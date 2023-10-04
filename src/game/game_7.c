#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/game.h"

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

// (84.45%) https://decomp.me/scratch/ge5fv
NONMATCH("asm/non_matching/game/stage/sub_802DCC8.inc", void sub_802DCC8(u8 p0, u16 p1))
{
    register u32 r7 asm("r7") = p0;
    u8 *bgOffsets = gBgOffsetsHBlank;
    s32 r2;
    register s32 r5 asm("r5") = 0;
    register u16 r6 asm("r6") = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - Q_24_8(1.0)) << 16 <= 512 << 16)
        return;

    if (r6 == 0 || r6 == 1) {
        s16 i;

        bgOffsets = &bgOffsets[r7 * sizeof(u16)];

        for (i = r7; i > 0; i--) {
            // TODO: Is this a macro?
            bgOffsets--;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets--;
        }
    } else {
        // _0802DC14
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i; // r7

        if (r3 != 0) {
            r3 = Div(r3, r1);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if (r6 < Q_24_8(2.0)) {
            bgOffsets = &bgOffsets[r7 * sizeof(u16)];

            // __0802DC56
            for (i = r7; i >= 0; i--) {
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q_24_8(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q_24_8(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }

                // TODO: Macro?
                bgOffsets--;
                *bgOffsets = xVal;
                bgOffsets--;
            }
        } else {
            // _0802DC90
            bgOffsets = &bgOffsets[r7 * sizeof(u16)];

            for (i = r7; i < DISPLAY_HEIGHT; i++) {
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
                bgOffsets += 2;
            }
        }
    }
}
END_NONMATCH

void sub_802DDC4(u8 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    s32 r2;
    s32 r5 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - (Q_24_8(1.0) + 1)) << 16 > 510 << 16)
        return;

    if ((r6 - Q_24_8(2.0)) == 0 || (r6 - Q_24_8(2.0)) == 1) {
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

        r3 = ABS(r3);
        r1 = ABS(r1);

        if (r3 != 0) {
            r3 = Div(r3, r1);
        } else {
            r3 = Q_24_8(1.0);
        }

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
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets += 2;
            }
        } else {
            // _0802DC90
            u16 *pOffset;
            bgOffsets = &bgOffsets[DISPLAY_HEIGHT * sizeof(u16)];

            for (i = DISPLAY_HEIGHT; i > p0; i--) {
                *bgOffsets--;
                *bgOffsets = DISPLAY_WIDTH;
                *bgOffsets--;
            }

            bgOffsets = gBgOffsetsHBlank;
            bgOffsets += p0 * sizeof(u16);

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
                bgOffsets -= 1;
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets -= 1;
            }
        }
    }
}

// (98.53%) https://decomp.me/scratch/khvum
NONMATCH("asm/non_matching/game/stage/sub_802DF18.inc", void sub_802DF18(u8 p0, u16 p1))
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    s32 r2;
    s32 r7 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - (Q_24_8(1.0) + 1)) << 16 > 510 << 16)
        return;

    if ((r6 - Q_24_8(2.0)) == 0 || (r6 - Q_24_8(2.0)) == 1) {
        s16 i;

        // bgOffsets = &bgOffsets[p0 * sizeof(u16)];

#ifndef NON_MATCHING
        asm("" : "=r"(r7));
#endif
        for (i = 0; i < p0; i++) {
            bgOffsets++;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets++;
        }
    } else {
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i;

        r3 = ABS(r3);
        r1 = ABS(r1);

        if (r3 != 0) {
            r3 = Div(r3, r1);
        } else {
            r3 = Q_24_8(1.0);
        }

        if (r6 < Q_24_8(2.0)) {
            // bgOffsets = &bgOffsets[p0 * sizeof(u16)];
            s16 k;

            for (k = 0; k < p0; k++) {

                // TODO: Macro?
                *bgOffsets++;
                *bgOffsets = DISPLAY_WIDTH;
                *bgOffsets++;
            }

            for (k = p0; k < DISPLAY_HEIGHT; k++) {
                u32 val;
                s32 dw;

                dw = DISPLAY_WIDTH;

                r7 += r3;
                val = r7;

                val = (val << 8) >> 16;

                if (val > DISPLAY_WIDTH)
                    return;

                *bgOffsets++;
                *bgOffsets = dw - val;
                *bgOffsets++;
            }
        } else {
            bgOffsets += p0 * sizeof(u16);

            for (i = p0; i >= 0; i--) {
                u32 xVal;
                r7 = r7 + r3;
                xVal = (u32)Q_24_8(r7) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r7 = Q_24_8(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets -= 2;
            }
        }
    }
}
END_NONMATCH

void sub_802E044(s32 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    u16 r5 = ((unsigned)p1 << 22) >> 22;

    if (r5 > Q_24_8(2.0)) {
        s32 r3 = (COS(r5) * 15) >> 2;
        s32 r1 = SIN_24_8(r5);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q_24_8(1.0);
            }
        }

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[DISPLAY_HEIGHT - 1];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 -= r3;
            val = Q_24_8_TO_INT(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q_24_8(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            *bgOffsets = val;
            bgOffsets -= sizeof(u16);
        }
    }
}

void sub_802E0D4(s32 inP0, u16 p1)
{
    s32 p0 = inP0;
    u8 *bgOffsets = gBgOffsetsHBlank;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if (r6 > Q_24_8(2.0)) {
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q_24_8(1.0);
            }
        }

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[DISPLAY_HEIGHT - 1];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 -= r3;
            val = Q_24_8_TO_INT(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q_24_8(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            *bgOffsets--;
            *bgOffsets = val;
            *bgOffsets--;
        }
    }
}

void sub_802E164(s32 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    u16 r5 = ((unsigned)p1 << 22) >> 22;

    if (r5 <= Q_24_8(2.0)) {
        s32 r3 = (COS(r5) * 15) >> 2;
        s32 r1 = SIN_24_8(r5);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q_24_8(1.0);
            }
        }

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[0];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 += r3;
            val = Q_24_8_TO_INT(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q_24_8(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            *bgOffsets = val;
            bgOffsets += sizeof(u16);
        }
    }
}

void sub_802E1EC(s32 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if (r6 <= Q_24_8(2.0)) {
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q_24_8(1.0);
            }
        }

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[0];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 += r3;
            val = Q_24_8_TO_INT(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q_24_8(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            *bgOffsets++;
            *bgOffsets = val;
            *bgOffsets++;
        }
    }
}

#define STGINTRO_SP_SIZE 8

// (99.77%) https://decomp.me/scratch/BhinB
// (addendum by Ollie https://decomp.me/scratch/qyFAO )
NONMATCH("asm/non_matching/game/stage/sub_802E278.inc",
         void sub_802E278(Vec2_16 *p0, u8 pairCount))
{
    s16 i;
    s16 sp[STGINTRO_SP_SIZE][2];

#ifdef NON_MATCHING
    // Make sure pairCount isn't bigger than the # of elements in sp
    if (pairCount > STGINTRO_SP_SIZE)
        pairCount = STGINTRO_SP_SIZE;
#endif

    for (i = 0; i < pairCount; i++) {
        sp[i][0] = p0[i].x;
        sp[i][1] = p0[i].y;
    }

    for (i = 0; i < pairCount - 1; i++) {
        u8 *bgOffsets = gBgOffsetsHBlank;
        register s32 yVal asm("r3") = sp[i][1];
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l, r;

        bgOffsets = (u8 *)&((s16 *)bgOffsets)[yVal];
        xVal = sp[i][0];
        xVal2 = Q_24_8(xVal);

        yVal -= sp[i + 1][1];

        if (yVal != 0) {
            r4 = Div(Q_24_8(xVal - sp[i + 1][0]), yVal);
        } else {
            r4 = Q_24_8(xVal - sp[i + 1][0]);
        }

        l = sp[i][1];
        while (l <= sp[i + 1][1]) {
            s32 r0 = (u8)(xVal2 >> 8);

            if (r0 > DISPLAY_WIDTH)
                r0 = DISPLAY_WIDTH;

            *bgOffsets++ = r0;
            *bgOffsets++;

            xVal2 += r4;
            l++;
        }
    }
}
END_NONMATCH

// like sub_802E278
// (99.78%) https://decomp.me/scratch/soFiq
NONMATCH("asm/non_matching/game/stage/sub_802E384.inc",
         void sub_802E384(Vec2_16 *p0, u16 pairCount))
{
    s16 i;
    s16 sp[STGINTRO_SP_SIZE][2];

#ifdef NON_MATCHING
    // Make sure pairCount isn't bigger than the # of elements in sp
    if (pairCount > STGINTRO_SP_SIZE)
        pairCount = STGINTRO_SP_SIZE;
#endif

    for (i = 0; i < pairCount; i++) {
        sp[i][0] = p0[i].x;
        sp[i][1] = p0[i].y;
    }

    for (i = 0; i < pairCount - 1; i++) {
        u8 *bgOffsets = gBgOffsetsHBlank;
        register s32 yVal asm("r3") = sp[i][1];
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l, r;

        bgOffsets = (u8 *)&((s16 *)bgOffsets)[yVal];
        xVal = sp[i][0];
        xVal2 = Q_24_8(xVal);

        yVal -= sp[i + 1][1];

        if (yVal != 0) {
            r4 = Div(Q_24_8(xVal - sp[i + 1][0]), yVal);
        } else {
            r4 = Q_24_8(xVal - sp[i + 1][0]);
        }

        l = sp[i][1];
        while (l <= sp[i + 1][1]) {
            s16 r1 = (xVal2 >> 8);

            if (r1 > DISPLAY_WIDTH)
                r1 = DISPLAY_WIDTH;

            if (r1 < 0)
                r1 = 0;

            *bgOffsets++;
            *bgOffsets = r1;
            *bgOffsets++;

            xVal2 += r4;
            l++;
        }
    }
}
END_NONMATCH

#if 0
void sub_802E49C(s16 *p0, u8 p1)
{
    if(p1 > 8 || p1 < 3)
        return;

    // _0802E4BC
    
}
#endif
