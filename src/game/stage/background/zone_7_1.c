#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage/background/zone_7.h"

// TEMP: Debug!!!
#include "game/stage/debug_text_printer.h"
extern void Zone7BgUpdate_Inside_(s32 x, s32 y);

#if 01
// https://decomp.me/scratch/yQ5VE
void Zone7BgUpdate_Inside(s32 x, s32 y)
{
    u16 *lineShiftX;
    s32 someX;
    s32 i;
    u8 j;
    s32 ip;
    s32 sp4[3];

    // TEMP: Debug!!!
    Debug_PrintIntegerAt(x, 224, 16);
    Debug_PrintIntegerAt(y, 224, 32);

#if 0
    Zone7BgUpdate_Inside_(x, y);
    return;
#endif
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

    lineShiftX = (u16 *)gComputedBgBuffer;

#ifndef NON_MATCHING
    // Why call Div without using its return value?
    someX = Div(x * 42, 400);
#endif

    someX = x * 2;

    sp4[2] = y >> 4;
    sp4[0] = y >> 1;
    sp4[1] = x >> 4;

    for (i = 0; i < 40; i++) {
        *lineShiftX++ = 8;
        *lineShiftX++ = 16;
    }

    someX += x;
    someX *= 8;
    someX += x; // someX = 25*x

    ip = Div(someX, 400);
    ip &= 0xFF;

    for (i = 0; i < 119; i++) {
        *lineShiftX++ = ip;
        *lineShiftX++ = 17;
    }

    // _0801DAA6
    // Draw the small, green-shining, moving pillars
    // NOTE: j stored in *sp
    for (j = 0; j < 2; j++) {
        s32 r5; // r5 might be u8?
        ip = (gStageTime + x) >> 3;
        ip &= 0xFF;

        r5 = (((j * 100) + 64) - sp4[2]);
        if (r5 < 240) {
            // __0801DACA
            s32 sb;
            u8 r1;
            u8 r2;
            s32 r3;
            u32 r6;

            sb = r5 * 2;
            if (r5 > 80) {

                lineShiftX = gComputedBgBuffer;
                r1 = ((r5 - 80) >> 4);
                lineShiftX += (r5 - r1) << 1;

                r3 = r5;
                r6 = 208 - r3;
                for (r2 = 0; ((r3 < r1 + 160) && (r2 < r1)); r2++) {
                    *lineShiftX++ = 0;
                    *lineShiftX++ = r6;
                }
            }
            // _0801DB1C
            lineShiftX = gComputedBgBuffer;
            lineShiftX += sb;

            r3 = r5;
            for (r3 = r5, r2 = 0; ((r3 < DISPLAY_HEIGHT) && (r2 < 16)); r2++, r3++) {
                *lineShiftX++ = ip;
                *lineShiftX++ = (240 - r3);
            }

            if (r3 < 80) {
                s32 r0 = (80 - r3) >> 4;
                r1 = r0;

                for (r2 = 0; ((r3 < DISPLAY_HEIGHT) && (r2 < r1)); r2++) {
                    *lineShiftX++ = 0;
                    *lineShiftX++ = (184 - r5);
                }
            }
        } else {
            u8 r2;
            u32 r3;
            // _0801DBAC
            lineShiftX = gComputedBgBuffer;

            for (r3 = 255 - r5; r3 < 16; r3++) {
                *lineShiftX++ = ip;
                *lineShiftX++ = 495 - r5;
            }
            // _0801DBD2

            for (r2 = 0; r2 < 4; r2++) {
                *lineShiftX++ = 0;
                *lineShiftX++ = 439 - r5;
            }
        }
    } // _0801DBEE == continue of (j < 2)
    // _0801DBFA

    ip = (gStageTime + x) >> 1;
    ip &= 0xFF;

    {
        u8 r1;
        u8 r2;
        s32 r3;
        s32 r6, r7;
        s32 temp;
        u8 r5 = -sp4[0];
        u8 sb;

        if (r5 < 224) {
            sb = r5 << 1;

            if (r5 > 80) {
                lineShiftX = gComputedBgBuffer;

                r1 = (((s8)r5 - 80) >> 4);
                lineShiftX += (r5 - r1) << 1;

                r7 = 204 - r3;
                for (r3 = r5, r2 = 0, r6 = r1 + 160; ((r3 < r6) && (r2 < r1)); r2++) {
                    *lineShiftX++ = 0;
                    *lineShiftX++ = r7;
                }
            }
            // _0801DC66
            lineShiftX = gComputedBgBuffer;
            lineShiftX += sb;

            temp = 208 - r3;
            r3 = r5, r2 = 0;
            for (; ((r3 < DISPLAY_HEIGHT) && (r2 < 32)); r3++, r2++) {
                *lineShiftX++ = ip;
                *lineShiftX++ = temp;
            }
        } else {
            // _0801DCDC
            lineShiftX = gComputedBgBuffer;

            for (r3 = 255 - r5; r3 < 32; r3++) {
                *lineShiftX++ = ip;
                *lineShiftX++ = 463 - r5;
            }

            for (r2 = 0; r2 < 4; r2++) {
                *lineShiftX++ = 0;
                *lineShiftX++ = 423 - r5;
            }
        }
        // _0801DD1A
        {
            u16 new_r1 = sp4[1];

            for (r3 = 0; r3 < 8; new_r1--, r3++) {
                *lineShiftX++ = gUnknown_080D5C82[(new_r1 & 0x7) + 1];
            }
        }
    }

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}
#endif

// https://decomp.me/scratch/7KDXI
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
