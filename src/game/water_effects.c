#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "task.h"

#include "sakit/globals.h"
#include "game/boost_effect.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/game_2.h"

#include "data/sprite_data.h"
#include "game/water_effects.h"

#include "constants/animations.h"
#include "constants/zones.h"

#define WATER_MASK_COLOR_A 0x7BDE
#define WATER_MASK_COLOR_B 0x739C
#define WATER_MASK_A       ((WATER_MASK_COLOR_A << 16) | WATER_MASK_COLOR_A)
#define WATER_MASK_B       ((WATER_MASK_COLOR_B << 16) | WATER_MASK_COLOR_B)

#define WATER_SURFACE_SPRITE_COUNT ((DISPLAY_WIDTH + 16) / 16)

Water gWater = {};

static const u16 gUnknown_080D550C[NUM_CHARACTERS] = {
    SA2_ANIM_UNDERWATER_1UP_SONIC, SA2_ANIM_UNDERWATER_1UP_CREAM,
    SA2_ANIM_UNDERWATER_1UP_TAILS, SA2_ANIM_UNDERWATER_1UP_KNUCKLES,
    SA2_ANIM_UNDERWATER_1UP_AMY,
};

static void Task_StageWaterTask(void);
static void Task_RunOnWaterEffect(void);
static void TaskDestructor_WaterSurface(struct Task *);
void sub_8011A4C(void);
void VCountIntr_8011ACC(void);
void TaskDestructor_8011B3C(struct Task *);

static void inline sub_8011B54_inline(u32 *dst, u32 *src, s32 size, s32 shift)
{
    u32 r2 = size >> shift;

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

static void inline copyMask(u32 *dst, u32 *src, u32 waterMask)
{
    u32 maskColors0, maskColors1;

    maskColors0 = *src;
    maskColors1 = maskColors0;
    maskColors1 &= WATER_MASK_A;
    maskColors0 &= WATER_MASK_B;
    maskColors0 = (maskColors0 + waterMask) >> 1;
    maskColors1 = (maskColors1 + maskColors0) >> 1;
    *dst = maskColors1;
}

// (98.73%) https://decomp.me/scratch/M6i4c
NONMATCH("asm/non_matching/game/sub_8011328.inc", void sub_8011328(void))
{
    u32 k;
    u16 animId;
    const ACmd **animation;
    s32 pal;
    u32 *dst, *src;
    u32 waterMask;
    u32 maskColors0, maskColors1;
    u32 maskA, maskB;

    Water *water = &gWater;
    WaterData *wd = TASK_DATA(water->t);

    if (IS_MULTI_PLAYER) {
        u8 i = 0, j = 0;
        // const u16 *palettes = gSpritePalettes;

        for (; j < 4; j++) {
            if ((gMultiplayerConnections >> j) & 0x1) {
                i++;
            }
        }

        for (j = 0; j < i; j++) {
            u16 mpChar = gMultiplayerCharacters[j];
            animId = gUnknown_080D550C[mpChar];
            animation = gAnimations[animId];
            pal = animation[0]->pal.palId;
            src = (u32 *)&gSpritePalettes[pal * 16];
            dst = (u32 *)&wd->pal[j * 16];
            sub_8011B54_inline(dst, src, 1, 0);
        }
    } else {
        u16 playerChar = gPlayer.character;

        animId = gUnknown_080D550C[playerChar];
        animation = gAnimations[animId];
        pal = animation[0]->pal.palId;
        sub_8011B54_inline((u32 *)&wd->pal[0 * 16], (u32 *)&gSpritePalettes[pal * 16], 1,
                           0);

        playerChar = gPlayer.character;
        animId = sCharacterPalettesBoostEffect[playerChar];
        animation = gAnimations[animId];
        pal = (animation[0]->pal.palId + 0) * 16;
        dst = (u32 *)&wd->pal[1 * 16];
        src = (u32 *)&gSpritePalettes[pal];
        sub_8011B54_inline(dst, src, 1, 0);
    }

    animId = SA2_ANIM_PALETTE_554;
    animation = gAnimations[animId];
    pal = (animation[0]->pal.palId + 4) * 16;
    dst = (u32 *)&wd->pal[4 * 16];
    src = (u32 *)&gSpritePalettes[(pal)];
    sub_8011B54_inline(dst, src, 12, 0);

    dst = (u32 *)&wd->pal[256];
    src = (u32 *)gBgPalette;
    waterMask = water->mask;
    k = 16;
    maskA = WATER_MASK_A;
    maskB = WATER_MASK_B;
    waterMask &= maskB;

    /* Mask sixteen 16-color palettes - Start */
    while (k-- > 0) {
        // TODO: Find a way to inline these!
        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;
    }
    /* Mask sixteen 16-color palettes - End */
}
END_NONMATCH

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
        s->unk1A = 0;
        s->timeUntilNextFrame = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);

        gWater.t = TaskCreate(Task_StageWaterTask, PLTT_SIZE, 0xFFFE, 0,
                              TaskDestructor_WaterSurface);
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

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_1, ACT_1)) && (I(gPlayer.x) > 6665)
        && (I(gPlayer.x) <= 10650)) {
        water->isActive = TRUE;
    } else {
        water->isActive = FALSE;
    }

    if (water->isActive != TRUE) {
        gFlags &= ~MOVESTATE_40;
        return;
    }

    if (gStageTime & 0x1) {
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

    gUnknown_03001870[gUnknown_03004D50++] = sub_8011A4C;
    gFlags |= FLAGS_10;

    unk1 = water->unk1 - 1;
    if (unk1 < DISPLAY_HEIGHT - 1) {
        s = &water->s;
        s->x = -((cam->x + ((gStageTime + 1) >> 2)) & 0xF);
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
        gUnknown_03002874 = unk2_2;
        gFlags |= FLAGS_40;
    } else {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_40;
    }
}

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ u8 filler0[0x14];
    /* 0x1C */ Sprite s;
    /* 0x4C */ u8 filler4C[0xC];
} RunOnWaterEffect; /* size: 0x58 */

void CreateRunOnWaterEffect(void)
{
    struct Task *t = TaskCreate(Task_RunOnWaterEffect, sizeof(RunOnWaterEffect), 0x4001,
                                0, TaskDestructor_8011B3C);
    RunOnWaterEffect *effect = TASK_DATA(t);
    Sprite *s = &effect->s;
    s->graphics.dest = VramMalloc(12);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_WATER_RUNNING_PARTICLES;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(7);
    s->timeUntilNextFrame = 0;
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

    effect->x = I(p->x);
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
    struct Task *t = sub_801F15C(x, y, 0x10, 0, Task_801F214, TaskDestructor_801F550);
    TaskStrc_801F15C *ts = TASK_DATA(t);
    Sprite *s = &ts->s;

    s->graphics.dest = VramMalloc(12);
    s->graphics.anim = SA2_ANIM_WATER_FALL_HIT_SURFACE;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(7);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

// TODO: Inlining this might match sub_8011328?
void MaskPaletteWithUnderwaterColor(u32 *dst, u32 *src, u32 mask, s32 size)
{
    u32 maskColors0, maskColors1;
    u32 maskA, maskB;
    u32 k;

    k = (size >> 4);

    /* Mask sixteen 16-color palettes - Start */
    while (k-- > 0) {
        maskA = WATER_MASK_A;
        maskB = WATER_MASK_B;

        // TODO: Find a way to inline these!
        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1
            = ((maskColors1 & maskA) + (((maskColors0 & maskB) + (maskB & mask)) >> 1));
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + (maskB & mask)) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;
    }
}

void TaskDestructor_WaterSurface(struct Task *t)
{
    Water *water = &gWater;

    gFlags &= ~FLAGS_40;
    gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
    water->t = NULL;
}

void sub_8011A4C(void)
{
    Water *water = &gWater;
    WaterData *wd = TASK_DATA(water->t);
    u32 unk2;
    unk2 = water->unk2;
    water->unk1 = unk2;
    water->unk8 &= ~0x1;

    // TODO: This surely can be matched differently!
    unk2 <<= 24;

    if (!unk2) {
        DmaCopy32(3, &wd->pal[0x100], PLTT, 0x1D0);
        DmaCopy32(3, &wd->pal[0x0], OBJ_PLTT, OBJ_PLTT_SIZE);
        REG_DISPCNT &= ~DISPCNT_BG0_ON;
        gFlags |= (FLAGS_UPDATE_SPRITE_PALETTES | FLAGS_UPDATE_BACKGROUND_PALETTES);
    }
}

void VCountIntr_8011ACC(void)
{
    Water *water = &gWater;
    WaterData *wd = TASK_DATA(water->t);

    DmaCopy32(3, &wd->pal[0x100], PLTT, 0x1D0);
    DmaCopy32(3, &wd->pal[0x0], OBJ_PLTT, OBJ_PLTT_SIZE);

    REG_DISPCNT &= ~DISPCNT_BG0_ON;
    gFlags |= (FLAGS_UPDATE_SPRITE_PALETTES | FLAGS_UPDATE_BACKGROUND_PALETTES);
    REG_IF = INTR_FLAG_VCOUNT;
}

void TaskDestructor_8011B3C(struct Task *t)
{
    RunOnWaterEffect *effect = TASK_DATA(t);
    Sprite *s = &effect->s;
    VramFree(s->graphics.dest);
}

static void sub_8011B54(u32 *dst, u32 *src, s32 size)
{
    sub_8011B54_inline(dst, src, size, 4);
}
