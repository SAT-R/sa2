#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage/background/zone_7.h"

#if 01
// https://decomp.me/scratch/BPm17
void Zone7BgUpdate_Inside(s32 x, s32 y)
{
    u16 *bgShift;
    s32 someX;
    s32 i;
    u8 j;
    s32 ip;

    if ((gPlayer.moveState & MOVESTATE_8000000) && (gUnknown_030054F4 >= 7)) {
        s16 value;

        if (gBgScrollRegs[3][0] == 0)
            gBgScrollRegs[3][0] = x;

        gBgScrollRegs[3][0] += Q_24_8_TO_INT(gPlayer.speedGroundX);

        x = gBgScrollRegs[3][0];
    }

    gDispCnt &= ~DISPCNT_BG0_ON;
    gDispCnt |= DISPCNT_BG3_ON;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&REG_BG3HOFS;
    gUnknown_03002A80 = 4;

    bgShift = (u16 *)gComputedBgBuffer;

#ifndef NON_MATCHING
    // Why call Div without using its return value?
    someX = Div(x * 42, 400);
#endif

    someX = x * 2;

    for (i = 0; i < 40; i++) {
        *bgShift++ = 8;
        *bgShift++ = 16;
    }

    someX += x;
    someX *= 8;
    someX += x; // someX = 25*x

    // ip = Div(25*x, 400);
    ip = Div(someX, 400);
    ip &= 0xFF;

    for (i = 0; i < 119; i++) {
        *bgShift++ = ip;
        *bgShift++ = 17;
    }

    // _0801DAA6
    // Draw the small, green-shining, moving pillars
    // NOTE: j stored in *sp
    j = 0;
    do {
        u8 r5;
        ip = (gStageTime + x) >> 3;
        ip &= 0xFF;

        r5 = (((j * 100) + 64) - (y >> 4));
        if (r5 < 240) {
            // __0801DACA
            s32 sb;
            u8 r1;
            u8 r2;
            s32 r3;

            sb = r5 * 4;
            if (r5 > 80) {
                bgShift = gComputedBgBuffer;
                r1 = ((r5 - 80) >> 4);
                bgShift += (r5 - r1) << 1;

                i = r5;
                for (r2 = 0; ((i < r1 + 160) && (r2 < r1)); i++, r2++) {
                    *bgShift++ = 0;
                    *bgShift++ = 208 - r5;
                    // i++;
                }
            }
            // _0801DB1C
            bgShift = gComputedBgBuffer;
            bgShift = ((void *)bgShift) + sb;

            for (i = r5, r2 = 0; ((i < DISPLAY_HEIGHT) && (r2 < 16)); i++, r2++) {
                *bgShift++ = ip;
                *bgShift++ = (240 - r5);
            }

            if (i < 80) {
                s32 r0 = (80 - i) >> 4;
                r1 = r0;

                for (r2 = 0; ((i < DISPLAY_HEIGHT) && (r2 < r1)); i++, r2++) {
                    *bgShift++ = 0;
                    *bgShift++ = (184 - r5);
                }
            }
        } else {
            u8 r2;
            // _0801DBAC
            bgShift = gComputedBgBuffer;

            for (i = 255 - r5; i < 16; i++) {
                *bgShift++ = ip;
                *bgShift++ = 495 - r5;
            }
            // _0801DBD2

            for (r2 = 0; r2 < 4; r2++) {
                *bgShift++ = 0;
                *bgShift++ = 439 - r5;
            }
        }
    } while (++j < 2); // _0801DBEE == continue of (j < 2)
    // _0801DBFA

    ip = (gStageTime + x) >> 1;
    ip &= 0xFF;

    {
        u8 r2;
        s32 r6, r7;
        u8 r5 = -(y >> 1);
        s32 sb;

        if ((u8)r5 < 224) {
            sb = r5 << 2;

            if (r5 > 80) {
                bgShift = gComputedBgBuffer;

                j = ((r5 - 80) >> 4);
                bgShift += (r5 - j) << 1;

                i = r5, r2 = 0;
                r6 = j + 160;
                for (; ((i < r6) && (r2 < j)); i++, r2++) {
                    *bgShift++ = 0;
                    *bgShift++ = 208 - r5;
                }
            }
            // _0801DC66
            bgShift = gComputedBgBuffer;
            bgShift = ((void *)bgShift) + sb;

            for (i = r5, r2 = 0; ((i < DISPLAY_HEIGHT) && (r2 < 32)); i++, r2++) {
                *bgShift++ = ip;
                *bgShift++ = 208 - r5;
            }

            if (i < 80) {
                for (j = (80 - i) >> 4, r2 = 0; ((i < 160) && (r2 < j)); i++, r2++) {
                    *bgShift++ = 0;
                    *bgShift++ = 168 - r5;
                }
            }
        } else {
            // _0801DCDC
            bgShift = gComputedBgBuffer;

            for (i = 255 - r5; i < 32; i++) {
                *bgShift++ = ip;
                *bgShift++ = 463 - r5;
            }

            for (r2 = 0; r2 < 4; r2++) {
                *bgShift++ = 0;
                *bgShift++ = 423 - r5;
            }
        }
        // _0801DD1A
        { // Draw the "ceiling" movement
            u32 new_r1 = (x >> 4) << 16;
            s32 mask = 0x7;
            const u16 *src = gUnknown_080D5C82;
            u16 *pal = gBgPalette;
            pal += 0xD1;
            new_r1 >>= 16;

            for (i = 0; i < 8; new_r1--, i++) {
                s32 index = (new_r1 & mask) + 1;
                *pal++ = src[index];
            }
        }
    }

    gFlags = gFlags | FLAGS_UPDATE_BACKGROUND_PALETTES;
}
#endif

// https://decomp.me/scratch/BPm17
// 98.95% - only register alloc issues, logic works as intended
NONMATCH("asm/non_matching/Zone7BgUpdate_Outside.inc",
         void Zone7BgUpdate_Outside(s32 x, s32 y))
{
    u16 *lineShiftX;
    u8 frameCount;
    int_vcount i;
    u16 sp[32];

    gDispCnt &= ~DISPCNT_BG3_ON;
    gDispCnt |= DISPCNT_BG0_ON;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&REG_BG0HOFS;
    gUnknown_03002A80 = 2;
    lineShiftX = (u16 *)gComputedBgBuffer;

#ifndef NON_MATCHING
    frameCount = ((gStageTime >> 3) & 0x1F);
    if (frameCount >= 16) {
        frameCount = 31 - frameCount;
        asm("" ::"r"(frameCount));
    }
#endif

    for (i = 0; i < ARRAY_COUNT(sp); i++) {
        sp[i] = 0xFF
            & (Q_24_8_TO_INT(gUnknown_080D5C62[(i & 0x7)][0] * gStageTime)
               + gUnknown_080D5C62[(i & 0x7)][1]);
    }

    {
        u16 sinVal, value;
        u32 cosVal;
        u32 scrollSpeed = (Q_24_8(80.5) - 1);

        for (i = 0; i < DISPLAY_HEIGHT / 2; i++) {
            sinVal = SIN_24_8(((gStageTime * 4) + i * 2) & ONE_CYCLE) >> 3;
            cosVal = (COS_24_8(((i * scrollSpeed) >> 5) & ONE_CYCLE) >> 4);
            value = cosVal + sinVal;
            *lineShiftX++ = (value + sp[(i & 0x1F)]) & 0xFF;
        }

        for (; i < DISPLAY_HEIGHT - 1; i++) {
            sinVal = SIN_24_8(((gStageTime << 2) + i * 2) & ONE_CYCLE) >> 3;
            cosVal = (COS_24_8((((DISPLAY_HEIGHT - i) * scrollSpeed) >> 5) & ONE_CYCLE)
                      >> 4);
            value = cosVal + sinVal;
            *lineShiftX++ = (value + sp[(i & 0x1F)]) & 0xFF;
        }
    }
}
END_NONMATCH
