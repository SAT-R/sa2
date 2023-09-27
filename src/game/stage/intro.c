#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/game.h"

// Seven unknown x/y positions
const u16 gUnknown_080D6DE4[][2] = {
    { 3800, 177 },  { 11864, 145 }, { 16088, 177 }, { 21080, 153 },
    { 27000, 150 }, { 36058, 201 }, { 40000, 225 },
};

void sub_802DBC0(u8 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    s32 r2;
    s32 r5 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - Q_24_8(1.0)) << 16 <= 512 << 16)
        return;

    if (r6 == 0 || r6 == 1) {
        s16 i;

        bgOffsets = &bgOffsets[p0 * sizeof(u16)];

#ifndef NON_MATCHING
        asm("" : "=r"(r5));
#endif
        for (i = 0; i < (DISPLAY_HEIGHT - p0); i++) {
            // TODO: Is this a macro?
            bgOffsets++;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets++;
        }
    } else {
        // _0802DC14
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i; // r7

        if (r3 != 0) {
            r3 = Div(r3, r1);
        } else {
            r3 = Q_24_8(1.0);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if (r6 < Q_24_8(2.0)) {
            bgOffsets = &bgOffsets[p0 * sizeof(u16)];

            // __0802DC56
            for (i = p0; i < DISPLAY_HEIGHT; i++) {
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q_24_8(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q_24_8(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }

                // TODO: Macro?
                bgOffsets++;
                *bgOffsets = xVal;
                bgOffsets++;
            }
        } else {
            // _0802DC90
            bgOffsets = &bgOffsets[p0 * sizeof(u16)];

            for (i = p0; i >= 0; i--) {
                // _0802DC9C
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q_24_8(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q_24_8(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                *bgOffsets = xVal;
                bgOffsets -= 2;
            }
        }
    }
}

#if 01
#endif