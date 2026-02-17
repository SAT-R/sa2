#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "task.h"

#include "game/boost_effect.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/mp_sprite_task.h"
#include "data/sprite_data.h"
#include "game/water_effects.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ u8 filler0[0x14];
    /* 0x1C */ Sprite s;
    /* 0x4C */ u8 filler4C[0xC];
} RunOnWaterEffect; /* size: 0x58 */

static void Task_StageWaterTask(void);
static void Task_RunOnWaterEffect(void);
static void TaskDestructor_WaterSurface(struct Task *);
static void sub_8011A4C(void);
static void VCountIntr_8011ACC(void);
static void TaskDestructor_8011B3C(struct Task *);

Water gWater = {};

#define WATER_MASK_COLOR_A 0x7BDE
#define WATER_MASK_COLOR_B 0x739C
#define WATER_MASK_A       ((WATER_MASK_COLOR_A << 16) | WATER_MASK_COLOR_A)
#define WATER_MASK_B       ((WATER_MASK_COLOR_B << 16) | WATER_MASK_COLOR_B)

#define WATER_SURFACE_SPRITE_COUNT ((DISPLAY_WIDTH + 16) / 16)

#define WATER_MASK_PALETTE_CHUNK(in, waterMask)                                                                                            \
    ({                                                                                                                                     \
        u32 temp1, temp2;                                                                                                                  \
        temp1 = (in);                                                                                                                      \
        temp2 = temp1;                                                                                                                     \
        temp2 = ((temp2 & WATER_MASK_A) + (((temp1 & WATER_MASK_B) + (WATER_MASK_B & (waterMask))) >> 1));                                 \
        temp2 >>= 1;                                                                                                                       \
    })

static const u16 gUnknown_080D550C[NUM_CHARACTERS] = {
    SA2_ANIM_UNDERWATER_1UP_SONIC,    SA2_ANIM_UNDERWATER_1UP_CREAM, SA2_ANIM_UNDERWATER_1UP_TAILS,
    SA2_ANIM_UNDERWATER_1UP_KNUCKLES, SA2_ANIM_UNDERWATER_1UP_AMY,
};

static void inline CopyPalette(u32 *dst, u32 *src, s32 length)
{
    u32 r2 = length >> 4;

    while (r2-- > 0) {
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
    }
}

static inline void MaskPaletteWithUnderwaterColor_inline(u32 *dst, u32 *src, u32 mask, s32 size)
{
    u32 k = (size >> 4);
    while (k-- > 0) {
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
    }
}

void InitWaterPalettes(void)
{
    u16 animId, character;
    const ACmd **animation;
    u32 pal;

    Water *water = &gWater;
    WaterData *wd = TASK_DATA(water->t);

    if (IS_MULTI_PLAYER) {
        u8 i = 0, j = 0;
        for (; j < 4; j++) {
            if ((gMultiplayerConnections >> j) & 0x1) {
                i++;
            }
        }

        for (j = 0; j < i; j++) {
            character = gMultiplayerCharacters[j];
            animId = gUnknown_080D550C[character];
            animation = gAnimations[animId];
            pal = animation[0]->pal.palId;
#ifndef NON_MATCHING
            {
                const u16 *src = gSpritePalettes[pal];
                CopyPalette((u32 *)wd->pal[j], (u32 *)src, PALETTE_LEN_4BPP);
            };
#else
            CopyPalette((u32 *)wd->pal[j], (u32 *)gSpritePalettes[pal], PALETTE_LEN_4BPP);
#endif
        }
    } else {
        character = gPlayer.character;

        animId = gUnknown_080D550C[character];
        animation = gAnimations[animId];
        pal = animation[0]->pal.palId;
        CopyPalette((u32 *)wd->pal[0], (u32 *)gSpritePalettes[pal], PALETTE_LEN_4BPP);

        character = gPlayer.character;
        animId = sCharacterPalettesBoostEffect[character];
        animation = gAnimations[animId];
        pal = animation[0]->pal.palId;
        CopyPalette((u32 *)wd->pal[1], (u32 *)gSpritePalettes[pal], PALETTE_LEN_4BPP);
    }

    animId = SA2_ANIM_PALETTE_554;
    animation = gAnimations[animId];
    pal = (animation[0]->pal.palId + 4);
    CopyPalette((u32 *)wd->pal[4], (u32 *)gSpritePalettes[pal], 12 * PALETTE_LEN_4BPP);

    MaskPaletteWithUnderwaterColor_inline((u32 *)wd->pal[16], (u32 *)&GET_PALETTE_COLOR_BG(0, 0), water->mask, 16 * PALETTE_LEN_4BPP);
}

void CreateStageWaterTask(s32 waterLevel, u32 p1, u32 mask)
{
    gWater.currentWaterLevel = waterLevel;
    gWater.targetWaterLevel = waterLevel;
    gWater.unk2 = 0xFF;
    gWater.unk1 = -1;
    gWater.unk8 = mask & 0x100;
    gWater.mask = p1;

    if (waterLevel >= 0) {
        Sprite *s = &gWater.s;
        s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_WATER_SURFACE;
        s->variant = 0;
        s->prevVariant |= -1;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);

        gWater.t = TaskCreate(Task_StageWaterTask, sizeof(WaterData), 0xFFFE, 0, TaskDestructor_WaterSurface);
    }
}

static void Task_StageWaterTask(void)
{
    Water *water = &gWater;
    struct Camera *cam = &gCamera;
    bool32 active;
    Sprite *s;
    u8 unk1;
#ifndef NON_MATCHING
    register u8 unk2_0 asm("r0");
    register u8 unk2_2 asm("r2");
#else
    u8 unk2_0;
    u8 unk2_2;
#endif

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_1, ACT_1)) && (I(gPlayer.qWorldX) > 6665) && (I(gPlayer.qWorldX) <= 10650)) {
        water->isActive = TRUE;
    } else {
        water->isActive = FALSE;
    }

    if (water->isActive != TRUE) {
        gFlags &= ~MOVESTATE_IN_WATER;
        return;
    }

    if (gStageTime & 1) {
        if (water->currentWaterLevel != water->targetWaterLevel) {
            if (water->currentWaterLevel < water->targetWaterLevel)
                water->currentWaterLevel++;
            else if (water->currentWaterLevel > water->targetWaterLevel)
                water->currentWaterLevel--;
        }
    }

    if (water->currentWaterLevel <= cam->y) {
        water->unk2 = 0;
    } else if (water->currentWaterLevel < cam->y + DISPLAY_HEIGHT) {
        water->unk2 = water->currentWaterLevel - cam->y;
    } else {
        water->unk2 = 0xFF;
    }

    gVBlankCallbacks[gNumVBlankCallbacks++] = sub_8011A4C;
    gFlags |= FLAGS_EXECUTE_VBLANK_CALLBACKS;

    unk1 = water->unk1 - 1;
    if (unk1 < DISPLAY_HEIGHT - 1) {
        s = &water->s;
        s->x = -((cam->x + ((gStageTime + 1) >> 2)) & 15);
        s->y = water->unk2 + 1;
        s->frameFlags |= (SPRITE_FLAG_MASK_19 | SPRITE_FLAG_MASK_18);
        UpdateSpriteAnimation(s);

        if (gStageTime & 0x2) {
            u16 y = s->y - 1;
            if (y < DISPLAY_WIDTH - 1) {
                s32 count = WATER_SURFACE_SPRITE_COUNT;
                do {
                    DisplaySprite(s);
                    s->x += 16;
                } while (--count >= 0);
            }
        }
    }

    unk2_0 = (water->unk2);
    if ((unk2_2 = unk2_0 - 1) < DISPLAY_HEIGHT - 1) {
        gIntrTable[INTR_INDEX_VCOUNT] = VCountIntr_8011ACC;
        gVCountSetting = unk2_2;
        gFlags |= FLAGS_40;
    } else {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_40;
    }
}

void CreateRunOnWaterEffect(void)
{
    struct Task *t = TaskCreate(Task_RunOnWaterEffect, sizeof(RunOnWaterEffect), 0x4001, 0, TaskDestructor_8011B3C);
    RunOnWaterEffect *effect = TASK_DATA(t);
    Sprite *s = &effect->s;
    s->graphics.dest = VramMalloc(12);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_WATER_RUNNING_PARTICLES;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_RunOnWaterEffect(void)
{
    RunOnWaterEffect *effect = TASK_DATA(gCurTask);
    Sprite *s = &effect->s;
    Player *p = &gPlayer;
    u32 newMovestate;

    if ((p->moveState & (MOVESTATE_20000 | MOVESTATE_DEAD)) != MOVESTATE_20000) {
        TaskDestroy(gCurTask);
        return;
    }

    effect->x = I(p->qWorldX);
    effect->y = gWater.currentWaterLevel;

    s->x = effect->x - gCamera.x;
    s->y = effect->y - gCamera.y;

    if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
        s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    } else {
        s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

struct Task *CreateWaterfallSurfaceHitEffect(s32 x, s32 y)
{
    struct Task *t = CreateMultiplayerSpriteTask(x, y, 0x10, 0, Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *ts = TASK_DATA(t);
    Sprite *s = &ts->s;

    s->graphics.dest = VramMalloc(12);
    s->graphics.anim = SA2_ANIM_WATER_FALL_HIT_SURFACE;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

UNUSED void MaskPaletteWithUnderwaterColor(u32 *dst, u32 *src, u32 mask, s32 size)
{
#ifndef NON_MATCHING
    u32 k = (size >> 4);
    while (k-- > 0) {
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
        *dst++ = WATER_MASK_PALETTE_CHUNK(*src++, mask);
    }
#else
    MaskPaletteWithUnderwaterColor_inline(dst, src, mask, size);
#endif
}

static void TaskDestructor_WaterSurface(struct Task *t)
{
    Water *water = &gWater;

    gFlags &= ~FLAGS_40;
    gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
    water->t = NULL;
}

static void sub_8011A4C(void)
{
    Water *water = &gWater;
#ifdef BUG_FIX
    if (water && water->t)
#endif
    {
        WaterData *wd = TASK_DATA(water->t);
        u32 unk2;
        unk2 = water->unk2;
        water->unk1 = unk2;
        water->unk8 &= ~0x1;

        // TODO: This surely can be matched differently!
        unk2 <<= 24;

        if (!unk2) {
            DmaCopy32(3, &wd->pal[16], PLTT, 29 * 16);
            DmaCopy32(3, &wd->pal[0], OBJ_PLTT, OBJ_PLTT_SIZE);
            REG_DISPCNT &= ~DISPCNT_BG0_ON;
            gFlags |= (FLAGS_UPDATE_SPRITE_PALETTES | FLAGS_UPDATE_BACKGROUND_PALETTES);
        }
    }
}

static void VCountIntr_8011ACC(void)
{
    Water *water = &gWater;
#ifdef BUG_FIX
    if (water && water->t)
#endif
    {
        WaterData *wd = TASK_DATA(water->t);

        DmaCopy32(3, &wd->pal[16], PLTT, 29 * 16);
        DmaCopy32(3, &wd->pal[0], OBJ_PLTT, OBJ_PLTT_SIZE);

        REG_DISPCNT &= ~DISPCNT_BG0_ON;
        gFlags |= (FLAGS_UPDATE_SPRITE_PALETTES | FLAGS_UPDATE_BACKGROUND_PALETTES);
        REG_IF = INTR_FLAG_VCOUNT;
    }
}

static void TaskDestructor_8011B3C(struct Task *t)
{
    RunOnWaterEffect *effect = TASK_DATA(t);
    Sprite *s = &effect->s;
    VramFree(s->graphics.dest);
}

static void sub_8011B54(u32 *dst, u32 *src, s32 size) { CopyPalette(dst, src, size); }
