#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/globals.h"

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ u8 filler08[0x10];
    Sprite s;
} CasinoParadiseFirework;

// TODO: Get these auto-generated?
#define BG_TILEMAP_ZONE3_WIDTH  256
#define BG_TILEMAP_ZONE3_HEIGHT 256

#define BG_LINE_SKY_START       0
#define BG_LINE_SKY_END         96
#define BG_LINE_WATER_START     96
#define BG_LINE_WATER_END       128
#define BG_LINE_GREENERY_PART_0 134
#define BG_LINE_GREENERY_PART_1 140
#define BG_LINE_GREENERY_PART_2 152
#define BG_LINE_GREENERY_PART_3 168
#define BG_LINE_RAILING_START   192
#define BG_LINE_RAILING_END     256

extern const TileInfoFirework gTileInfoZone3Fireworks[2];

void TaskDestructor_MultiplayerSpriteTask(struct Task *);

void Task_UpdateFireworkAnimation(void)
{
    CasinoParadiseFirework *firework = TASK_DATA(gCurTask);
    Sprite *s = &firework->s;
    Camera *cam = &gCamera;

    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        TaskDestroy(gCurTask);
        return;
    }

    s->x = firework->qWorldX - cam->SA2_LABEL(unk52);
    s->y = firework->qWorldY - cam->SA2_LABEL(unk54);

    s->frameFlags &= ~(SPRITE_FLAG(18, 1) | SPRITE_FLAG(19, 1));
    UpdateSpriteAnimation(s);
    s->frameFlags |= (SPRITE_FLAG(18, 1) | SPRITE_FLAG(19, 1));

    s->frameFlags &= ~(SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 1));
    DisplaySprite(s);

    s->frameFlags ^= SPRITE_FLAG(X_FLIP, 1);
    DisplaySprite(s);

    s->frameFlags ^= SPRITE_FLAG(X_FLIP, 1);
    s->frameFlags ^= SPRITE_FLAG(Y_FLIP, 1);
    DisplaySprite(s);

    s->frameFlags ^= SPRITE_FLAG(X_FLIP, 1);
    DisplaySprite(s);
}

void StageBgUpdate_Zone3Acts12(s32 x, s32 y)
{
    Camera *cam = &gCamera;
    const Collision *collision;
    s32 xSub, ySub;
    s32 scanline;
    s32 r4;
    u32 *ptr;
    s32 i;

    x -= cam->SA2_LABEL(unk20);
    y -= cam->SA2_LABEL(unk24);

    collision = gRefCollision;

    gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = xSub = Div(x * 16, collision->pxWidth - DISPLAY_WIDTH);
    gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = ySub = Div((y << 6) + (y << 5), collision->pxHeight - DISPLAY_HEIGHT);

    // TODO: There should be a macro for this already!
    r4 = ((ySub << 16) | xSub);

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)&REG_BG3HOFS;
    gHBlankCopySize = 4;

    {
        ptr = gBgOffsetsHBlankPrimary;
        DmaFill32(3, r4, ptr, DISPLAY_HEIGHT * sizeof(r4));

        r4 = ((ySub << 16) | ((xSub + (x >> 6)) & 0xFF));

        scanline = BG_LINE_GREENERY_PART_0 - ySub;

        ptr += scanline;
        for (i = 0; (i < BG_LINE_GREENERY_PART_1 - BG_LINE_GREENERY_PART_0); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    {
        ptr = gBgOffsetsHBlankPrimary;

        r4 = ((ySub << 16) | ((xSub + (x >> 5)) & 0xFF));

        scanline = BG_LINE_GREENERY_PART_0 - ySub;

        ptr += scanline;
        for (i = 0; (i < BG_LINE_GREENERY_PART_1 - BG_LINE_GREENERY_PART_0); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    {
        ptr = gBgOffsetsHBlankPrimary;

        r4 = ((ySub << 16) | ((xSub + (x >> 4)) & 0xFF));

        scanline = BG_LINE_GREENERY_PART_1 - ySub;

        ptr += scanline;
        for (i = 0; (i < BG_LINE_GREENERY_PART_2 - BG_LINE_GREENERY_PART_1); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    {
        ptr = gBgOffsetsHBlankPrimary;

        r4 = ((ySub << 16) | ((xSub + (x >> 3)) & 0xFF));

        scanline = BG_LINE_GREENERY_PART_2 - ySub;

        ptr += scanline;
        for (i = 0; (i < BG_LINE_GREENERY_PART_3 - BG_LINE_GREENERY_PART_2); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    {
        ptr = gBgOffsetsHBlankPrimary;

        r4 = ((ySub << 16) | ((xSub + (x >> 2)) & 0xFF));

        scanline = BG_LINE_GREENERY_PART_3 - ySub;

        ptr += scanline;
        for (i = 0; (i < BG_LINE_RAILING_START - BG_LINE_GREENERY_PART_3); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    {
        ptr = gBgOffsetsHBlankPrimary;

        r4 = ((ySub << 16) | ((xSub + (x >> 1)) & 0xFF));

        scanline = BG_LINE_RAILING_START - ySub;

        ptr += scanline;
        for (i = 0; (i < BG_LINE_RAILING_END - BG_LINE_RAILING_START); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    if (((gStageTime % 4u) == 0) && ((PseudoRandom32() & 0x700) == 0)) {
        // Spawn Firework, at random location in the sky, randomly big or small.
        struct Task *t;
        CasinoParadiseFirework *firework;
        Sprite *s;
        s32 randX = (((u32)PseudoRandom32() & 0xFF00) >> 8) - 8; // 0 - +256 ---> -8 - +248
        s32 randY = (((u32)PseudoRandom32() & 0x7F00) >> 8) - (BG_LINE_WATER_END - BG_LINE_SKY_END);
        u8 fireworkType = (((u32)PseudoRandom32() & 0x0100) >> 8);
        const TileInfoFirework *tileInfo = &gTileInfoZone3Fireworks[fireworkType];

        t = CreateMultiplayerSpriteTask(randX, randY, 0, 0, Task_UpdateFireworkAnimation, TaskDestructor_MultiplayerSpriteTask);
        firework = TASK_DATA(t);
        s = &firework->s;

        s->graphics.dest = VramMalloc(tileInfo->numTiles);
        s->graphics.anim = tileInfo->anim;
        s->variant = tileInfo->variant;
        s->oamFlags = SPRITE_OAM_ORDER(31);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 3);
    }
}
