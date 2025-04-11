#include <string.h>
#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/background/zone_7.h"

#include "constants/tilemaps.h"

const s16 gUnknown_080D5C62[8][2] = {
    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.50), +Q_8_8(0.00) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.00), -Q_8_8(0.0859375) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.50), +Q_8_8(0.00) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(0.75), -Q_8_8(0.125) }, //
};

static const u16 sPalette_Zone7BgCeiling[16] = INCBIN_U16("graphics/080D5C82.gbapal");

void CreateStageBg_Zone7(void)
{
    Background *bg = &gStageBackgroundsRam.unk0;
    const Background *src;
    gDispCnt = DISPCNT_OBJ_ON | DISPCNT_BG2_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;

    gBgCntRegs[0] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(22) | BGCNT_16COLOR | BGCNT_PRIORITY(15));

    src = gStageCameraBgTemplates;
    memcpy(bg, &src[3], sizeof(Background));

    bg->tilemapId = TM_UNK_SPACE_BG;
    bg->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    bg->layoutVram = (void *)BG_SCREEN_ADDR(22);
    bg->targetTilesX = 32;
    bg->targetTilesY = 20;
    DrawBackground(bg);

    gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
    gBgCntRegs[3] |= BGCNT_PRIORITY(3);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}

// (98.52%) https://decomp.me/scratch/DUPkY
// (99.82%) https://decomp.me/scratch/pfVTf (fake match)
NONMATCH("asm/non_matching/game/stage/background/Zone7BgUpdate_Inside.inc", void Zone7BgUpdate_Inside(s32 x, s32 y))
{
    u16 *dst;
    s32 someX;
    s32 lineY;
    s32 ip;
    u8 j;
    u8 r1;
    u8 r2;
    u8 r5;

    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
        if (gBgScrollRegs[3][0] == 0)
            gBgScrollRegs[3][0] = x;

        gBgScrollRegs[3][0] += I(gPlayer.qSpeedGround);

        x = gBgScrollRegs[3][0];
    }

    gDispCnt &= ~DISPCNT_BG0_ON;
    gDispCnt |= DISPCNT_BG3_ON;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&REG_BG3HOFS;
    gHBlankCopySize = 4;

    dst = (u16 *)gBgOffsetsHBlank;

#ifndef NON_MATCHING
    // Why call Div without using its return value?
    someX = Div(x * 42, 400);
#endif

    // Move BG3 to the "ceiling" for the first 40 lines
    for (lineY = 0; lineY < 40; lineY++) {
        *dst++ = 8;
        *dst++ = 16;
    }

    // ip = Div(25*x, 400);
    ip = Div(25 * x, 400) & 0xFF;

    for (lineY = 0; lineY < 119; lineY++) {
        *dst++ = ip;
        *dst++ = 17;
    }

    // _0801DAA6
    // Draw the small, green-shining, moving pillars
    // NOTE: j stored in *sp
    j = 0;
    do {
        ip = (((gStageTime + x) / 8)) & 0xFF;

        r5 = (((100 * j) + 64) - (y >> 4));
        if (r5 < 240) {
            // __0801DACA
            if (r5 > 80) {
                dst = gBgOffsetsHBlank;
                r1 = ((r5 - 80) >> 4);
                dst += (r5 - r1) << 1;

                lineY = r5;
                for (r2 = 0; ((lineY < r1 + 160) && (r2 < r1)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = 208 - r5;
                }
            }
            // _0801DB1C
            dst = gBgOffsetsHBlank;
            dst = ((void *)dst) + (r5 * 4);

            for (lineY = r5, r2 = 0; ((lineY < DISPLAY_HEIGHT) && (r2 < 16)); lineY++, r2++) {
                *dst++ = ip;
                *dst++ = (240 - r5);
            }

            if (lineY < 80) {
                s32 r0 = (80 - lineY) >> 4;
                r1 = r0;

                for (r2 = 0; ((lineY < DISPLAY_HEIGHT) && (r2 < r1)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = (184 - r5);
                }
            }
        } else {
            // _0801DBAC
            dst = gBgOffsetsHBlank;

            for (lineY = 255 - r5; lineY < 16; lineY++) {
                *dst++ = ip;
                *dst++ = 495 - r5;
            }
            // _0801DBD2

            for (r2 = 0; r2 < 4; r2++) {
                *dst++ = 0;
                *dst++ = 439 - r5;
            }
        }
    } while (++j < 2); // _0801DBEE == continue of (j < 2)
    // _0801DBFA

    ip = ((gStageTime + x) / 2) & 0xFF;

    {
        r5 = -(y >> 1);

        if (r5 < 224) {
            u8 val;
            if (r5 > 80) {
                dst = gBgOffsetsHBlank;

                val = ((r5 - 80) >> 4);
                dst += (r5 - val) << 1;

                lineY = r5, r2 = 0;
                for (; ((lineY < (160 + val)) && (r2 < val)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = 208 - r5;
                }
            }
            // _0801DC66
            dst = gBgOffsetsHBlank;
            dst = ((void *)dst) + (r5 * 4);

            for (lineY = r5, r2 = 0; ((lineY < DISPLAY_HEIGHT) && (r2 < 32)); lineY++, r2++) {
                *dst++ = ip;
                *dst++ = 208 - r5;
            }

            if (lineY < 80) {
                for (r1 = (80 - lineY) >> 4, r2 = 0; ((lineY < 160) && (r2 < r1)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = 168 - r5;
                }
            }
        } else {
            // _0801DCDC
            dst = gBgOffsetsHBlank;

            for (lineY = 255 - r5; lineY < 32; lineY++) {
                *dst++ = ip;
                *dst++ = 463 - r5;
            }

            for (r2 = 0; r2 < 4; r2++) {
                *dst++ = 0;
                *dst++ = 423 - r5;
            }
        }
// _0801DD1A
#if 001
        { // Draw the "ceiling" movement
            u32 new_r1 = (x >> 4) << 16;
            const u16 *src;
            s32 r6 = 0x7;
            src = sPalette_Zone7BgCeiling;
            dst = gBgPalette;
            dst += 209;
            new_r1 >>= 16;

            for (lineY = 0; lineY < 8; new_r1--, lineY++) {
                s32 index = (new_r1 & r6) + 1;
                *dst++ = src[index];
            }
        }
#else
        { // Draw the "ceiling" movement
            for (lineY = 0; lineY < 8; lineY++) {
                dst = gBgPalette;
                dst += 209;
                dst[lineY] = sPalette_Zone7BgCeiling[((x >> 4) & 0x7) + 1];
            }
        }
#endif
    }

    gFlags = gFlags | FLAGS_UPDATE_BACKGROUND_PALETTES;
}
END_NONMATCH

void Zone7BgUpdate_Outside(s32 x, s32 y)
{
    u16 *lineShiftX;
    u8 frameCount;
    int_vcount i;
    u16 sp[32];
    u32 stageTime;

    gDispCnt &= ~DISPCNT_BG3_ON;
    gDispCnt |= DISPCNT_BG0_ON;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 2;
    lineShiftX = (u16 *)gBgOffsetsHBlank;

    stageTime = gStageTime;
    frameCount = ((stageTime >> 3) & 0x1F);
    if (frameCount >= 16) {
        // Likely some sort of debug log
#ifndef NON_MATCHING
        register u32 r1 asm("r1");
        register u8 r0 asm("r0");
        r0 = 31 - frameCount;
        asm("" ::"r"(r0));
        r1 = r0;
        asm("" ::"r"(r1));
#endif
    }

    for (i = 0; i < ARRAY_COUNT(sp); i++) {
        sp[i] = 0xFF & (I(gUnknown_080D5C62[(i & 0x7)][0] * stageTime) + gUnknown_080D5C62[(i & 0x7)][1]);
    }

    {
        u16 sinVal, value;
        u32 cosVal;
        u32 scrollSpeed = (Q(80.5) - 1);

        for (i = 0; i < DISPLAY_HEIGHT / 2; i++) {
            sinVal = SIN_24_8(((gStageTime * 4) + i * 2) & ONE_CYCLE) >> 3;
            value = (COS_24_8(((i * scrollSpeed) >> 5) & ONE_CYCLE) >> 4) + sinVal;
            value = (value + sp[(i & 0x1F)]) & 0xFF;
            *lineShiftX++ = value;
        }

        for (; i < DISPLAY_HEIGHT - 1; i++) {
            sinVal = SIN_24_8(((gStageTime << 2) + i * 2) & ONE_CYCLE) >> 3;
            cosVal = (COS_24_8((((DISPLAY_HEIGHT - i) * scrollSpeed) >> 5) & ONE_CYCLE) >> 4);
            value = cosVal + sinVal;
            value = (value + sp[(i & 0x1F)]) & 0xFF;
            *lineShiftX++ = value;
        }
    }
}
