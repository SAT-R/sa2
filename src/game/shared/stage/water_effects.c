#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "task.h"

#if (GAME == GAME_SA1)
#include "trig.h"
#include "bg_triangles.h"
#endif

#include "game/globals.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/shared/stage/water_effects.h"

#if (GAME == GAME_SA1)
#include "data/sa1/sprite_data.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/zones.h"
#include "constants/sa1/vram_hardcoded.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/boost_effect.h"

#include "data/sa2/sprite_data.h"

#include "constants/sa2/animations.h"
#include "constants/sa2/zones.h"
#include "constants/sa2/vram_hardcoded.h"
#endif

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
static void SA2_LABEL(sub_8011A4C)(void);
static void SA2_LABEL(VCountIntr_8011ACC)(void);
static void TaskDestructor_RunOnWaterEffect(struct Task *);

#if (GAME == GAME_SA1)
// SA2 allocates these in the Task, to save global memory.
// Water is only used in one stage, after all.
u16 sPaletteBuffer[(16 * 2) * 16] = { 0 };
#endif
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

#if (GAME == GAME_SA2)
static const u16 gUnknown_080D550C[NUM_CHARACTERS] = {
    SA2_ANIM_UNDERWATER_1UP_SONIC,    SA2_ANIM_UNDERWATER_1UP_CREAM, SA2_ANIM_UNDERWATER_1UP_TAILS,
    SA2_ANIM_UNDERWATER_1UP_KNUCKLES, SA2_ANIM_UNDERWATER_1UP_AMY,
};

static inline void CopyPalette(u32 *dst, u32 *src, s32 length)
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
#endif

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
#if (GAME == GAME_SA1)
    MaskPaletteWithUnderwaterColor_inline((u32 *)&sPaletteBuffer[0], (u32 *)&gObjPalette[0], water->blendColors, 16 * 16);
    MaskPaletteWithUnderwaterColor_inline((u32 *)&sPaletteBuffer[16 * 16], (u32 *)&gBgPalette[0], water->blendColors, 16 * 16);
#elif (GAME == GAME_SA2)
    if (IS_MULTI_PLAYER) {
        u8 i = 0, j = 0;
        for (; j < 4; j++) {
            if (CONNECTION_REGISTERED(j)) {
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

    MaskPaletteWithUnderwaterColor_inline((u32 *)wd->pal[16], (u32 *)gBgPalette, water->blendColors, 16 * 16);
#endif
}

#if (GAME == GAME_SA1)
void LoadPalette423Anim(void)
{
    Sprite s;
    s.graphics.dest = NULL;
    s.graphics.anim = SA1_ANIM_LOAD_PALETTE_423;
    s.variant = 0;
    s.oamFlags = 0;
    s.frameFlags = 0;
    s.graphics.size = 0;
    s.prevVariant = -1;
    s.qAnimDelay = Q(0);
    s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    s.palId = 0;

    UpdateSpriteAnimation(&s);
}
#endif

void CreateStageWaterTask(s32 waterLevel, u32 p1, u32 mask)
{
    gWater.currentWaterLevel = waterLevel;
    gWater.targetWaterLevel = waterLevel;
    gWater.SA2_LABEL(unk2) = 0xFF;
    gWater.SA2_LABEL(unk1) = -1;
    gWater.flags = mask & 0x100;
    gWater.blendColors = p1;

    if (waterLevel >= 0) {
        Sprite *s = &gWater.s;
        s->graphics.dest = VRAM_RESERVED_WATER_SURFACE;
        s->graphics.size = 0;
#if (GAME == GAME_SA1)
        s->graphics.anim = SA1_ANIM_WATER_SURFACE;
#elif (GAME == GAME_SA2)
        s->graphics.anim = SA2_ANIM_WATER_SURFACE;
#endif
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

#if (HAS_RUN_ON_WATER)
    if ((gCurrentLevel == LEVEL_INDEX(ZONE_1, ACT_1)) && (I(gPlayer.qWorldX) > 6665) && (I(gPlayer.qWorldX) <= 10650)) {
        water->isActive = TRUE;
    } else {
        water->isActive = FALSE;
    }

    if (water->isActive != TRUE) {
        gFlags &= ~MOVESTATE_IN_WATER;
        return;
    }
#endif

    if (gStageTime & 1) {
        if (water->currentWaterLevel != water->targetWaterLevel) {
            if (water->currentWaterLevel < water->targetWaterLevel)
                water->currentWaterLevel++;
            else if (water->currentWaterLevel > water->targetWaterLevel)
                water->currentWaterLevel--;
        }
    }

    if (water->currentWaterLevel <= cam->y) {
        water->SA2_LABEL(unk2) = 0;
    } else if (water->currentWaterLevel < cam->y + DISPLAY_HEIGHT) {
        water->SA2_LABEL(unk2) = water->currentWaterLevel - cam->y;
    } else {
        water->SA2_LABEL(unk2) = -1;
    }

    gVBlankCallbacks[gNumVBlankCallbacks++] = SA2_LABEL(sub_8011A4C);
    gFlags |= FLAGS_EXECUTE_VBLANK_CALLBACKS;

    if (water->SA2_LABEL(unk1) > 0 && water->SA2_LABEL(unk1) < DISPLAY_HEIGHT) {
        s = &water->s;
        s->x = -((cam->x + ((gStageTime + 1) >> 2)) & 15);
        s->y = water->SA2_LABEL(unk2) + 1;
        s->frameFlags |= (SPRITE_FLAG_MASK_19 | SPRITE_FLAG_MASK_18);
        UpdateSpriteAnimation(s);

        if (gStageTime & 2) {
            if (s->y > 0 && s->y < DISPLAY_WIDTH) {
                s32 count = WATER_SURFACE_SPRITE_COUNT;
                do {
                    DisplaySprite(s);
                    s->x += 16;
                } while (--count >= 0);
            }
        }
    }

    if (water->SA2_LABEL(unk2) > 0 && water->SA2_LABEL(unk2) < DISPLAY_HEIGHT) {
        gIntrTable[INTR_INDEX_VCOUNT] = SA2_LABEL(VCountIntr_8011ACC);
        gVCountSetting = water->SA2_LABEL(unk2) - 1;
        gFlags |= FLAGS_40;
    } else {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_40;
    }

#if (GAME == GAME_SA1)
    if (water->SA2_LABEL(unk2) >= DISPLAY_HEIGHT) {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    } else {
#ifndef NON_MATCHING
        UNUSED u32 _;
#endif
        u32 r5, i;
        s32 r3 = CLAMP_SIN_PERIOD(((gStageTime * 4) + (((gBgScrollRegs[3][1] + water->SA2_LABEL(unk2)) % 32u) << 6)));

        SA2_LABEL(sub_8007738)
        (3, 0, 32, r3, 2, 64, (((gStageTime * 2 + (((gBgScrollRegs[3][1] + water->SA2_LABEL(unk2)) % 32u) << 5))) + 0x100) & ONE_CYCLE, 10,
         32, gBgScrollRegs[3][0], gBgScrollRegs[3][1]);

        for (r5 = 32, i = 1; r5 < DISPLAY_HEIGHT; i++, r5 += 32) {
            DmaCopy32(3, gBgOffsetsHBlankPrimary, gBgOffsetsHBlankPrimary + ((gHBlankCopySize << 5) * i), (gHBlankCopySize << 5));
        }

        if (water->SA2_LABEL(unk2)) {
            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        }
    }
#endif
}

#if (HAS_RUN_ON_WATER)
void CreateRunOnWaterEffect(void)
{
    struct Task *t = TaskCreate(Task_RunOnWaterEffect, sizeof(RunOnWaterEffect), 0x4001, 0, TaskDestructor_RunOnWaterEffect);
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
#endif

#if (GAME == GAME_SA1)
void unused_DestroygWaterTask(void)
{
    TaskDestroy(gWater.t);
    gWater.t = NULL;
}
#endif

struct Task *CreateWaterfallSurfaceHitEffect(s32 x, s32 y)
{
    struct Task *t = CreateMultiplayerSpriteTask(x, y, 0x10, 0, Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *ts = TASK_DATA(t);
    Sprite *s = &ts->s;

    s->graphics.dest = VramMalloc(12);
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_WATER_FALL_HIT_SURFACE;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_WATER_FALL_HIT_SURFACE;
#endif
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

// At the bottom of the file in SA1!
#if (GAME == GAME_SA2)
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
#endif

static void TaskDestructor_WaterSurface(struct Task *t)
{
    Water *water = &gWater;

    gFlags &= ~FLAGS_40;
    gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
    water->t = NULL;
#if (GAME == GAME_SA1)
    DmaFill32(3, 0, sPaletteBuffer, 60 * 16);
#endif
}

static void SA2_LABEL(sub_8011A4C)(void)
{
    Water *water = &gWater;
#ifdef BUG_FIX
    if (water && water->t)
#endif
    {
        WaterData *wd = TASK_DATA(water->t);
        u32 unk2 = water->SA2_LABEL(unk2);
        water->SA2_LABEL(unk1) = unk2;
        water->flags &= ~0x1;

        // TODO: This surely can be matched differently!
        unk2 <<= 24;

        if (!unk2) {
#if (GAME == GAME_SA1)
            DmaCopy32(3, &sPaletteBuffer[16 * 16], BG_PLTT, 29 * 16);
            DmaCopy32(3, &sPaletteBuffer, OBJ_PLTT, OBJ_PLTT_SIZE);
#elif (GAME == GAME_SA2)
            DmaCopy32(3, &wd->pal[16], PLTT, 29 * 16);
            DmaCopy32(3, &wd->pal[0], OBJ_PLTT, OBJ_PLTT_SIZE);
#endif
            REG_DISPCNT &= ~DISPCNT_BG0_ON;
            gFlags |= (FLAGS_UPDATE_SPRITE_PALETTES | FLAGS_UPDATE_BACKGROUND_PALETTES);
        }
    }
}

static void SA2_LABEL(VCountIntr_8011ACC)(void)
{
    Water *water = &gWater;
#ifdef BUG_FIX
    if (water && water->t)
#endif
    {
        WaterData *wd = TASK_DATA(water->t);
#if (GAME == GAME_SA1)
        DmaCopy32(0, &sPaletteBuffer[16 * 16], BG_PLTT, 29 * 16);
        DmaCopy32(0, &sPaletteBuffer, OBJ_PLTT, OBJ_PLTT_SIZE);
#elif (GAME == GAME_SA2)
        DmaCopy32(3, &wd->pal[16], PLTT, 29 * 16);
        DmaCopy32(3, &wd->pal[0], OBJ_PLTT, OBJ_PLTT_SIZE);
#endif

        REG_DISPCNT &= ~DISPCNT_BG0_ON;
        gFlags |= (FLAGS_UPDATE_SPRITE_PALETTES | FLAGS_UPDATE_BACKGROUND_PALETTES);
#if (GAME == GAME_SA1)
        DmaSet(0, gBgOffsetsHBlankSecondary, (void *)&REG_BG3HOFS, //
               ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | (gHBlankCopySize >> 1));
#endif
        REG_IF = INTR_FLAG_VCOUNT;
    }
}

// Further up in SA2!
#if (GAME == GAME_SA1)
UNUSED void MaskPaletteWithUnderwaterColor(u32 *dst, u32 *src, u32 mask, s32 size)
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
#endif

#if (HAS_RUN_ON_WATER)
static void TaskDestructor_RunOnWaterEffect(struct Task *t)
{
    RunOnWaterEffect *effect = TASK_DATA(t);
    Sprite *s = &effect->s;
    VramFree(s->graphics.dest);
}

static void SA2_LABEL(sub_8011B54)(u32 *dst, u32 *src, s32 size) { CopyPalette(dst, src, size); }
#endif
