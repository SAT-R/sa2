#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"
#include "game/stage/screen_mask.h"

void sub_802DBC0(u8 p0, u16 p1)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
#ifdef BUG_FIX
    if (bgOffsets == NULL) {
        return;
    }
#endif
    s32 r5 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - Q(1.0)) << 16 <= 512 << 16)
        return;

    if (r6 == 0 || r6 == 1) {
        s16 i;

        bgOffsets = &bgOffsets[p0 * 2];

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
            r3 = Q(1.0);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if (r6 < Q(2.0)) {
            bgOffsets = &bgOffsets[p0 * 2];

            // __0802DC56
            for (i = p0; i < DISPLAY_HEIGHT; i++) {
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }

                // TODO: Macro?
                bgOffsets++;
                *bgOffsets = xVal;
                bgOffsets++;
            }
        } else {
            // _0802DC90
            bgOffsets = &bgOffsets[p0 * 2];

            for (i = p0; i >= 0; i--) {
                // _0802DC9C
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                *bgOffsets = xVal;
                bgOffsets -= 2;
            }
        }
    }
}

UNUSED void sub_802DCC8(u8 p0, u16 p1)
{
    u32 r7 = p0;
    s16 i;
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    s32 r5 = 0;

    if ((unsigned)((((unsigned)p1 << 22) >> 22) - Q(1.0)) << 16 <= 512 << 16)
        return;

    if ((((unsigned)p1 << 22) >> 22) == 0 || (((unsigned)p1 << 22) >> 22) == 1) {
        bgOffsets = &bgOffsets[r7 * 2];

        for (i = r7; i > 0; i--) {
            // TODO: Is this a macro?
            bgOffsets--;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets--;
        }
    } else {
        // _0802DC14
        s32 r3 = (COS((((unsigned)p1 << 22) >> 22)) * 15) >> 2;
        s32 r1 = SIN_24_8((((unsigned)p1 << 22) >> 22));

        if (r3 != 0) {
            r3 = Div(r3, r1);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if ((((unsigned)p1 << 22) >> 22) < Q(2.0)) {
            bgOffsets = &bgOffsets[r7 * 2];

            // __0802DC56
            for (i = r7; i >= 0; i--) {
                u16 xVal;
                r5 = r5 + r3;
                xVal = I(r5);
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }

                // TODO: Macro?
                bgOffsets--;
                *bgOffsets = xVal;
                bgOffsets--;
            }
        } else {
            // _0802DC90
            bgOffsets = &bgOffsets[r7 * 2];

            for (i = r7; i < DISPLAY_HEIGHT; i++) {
                // _0802DC9C
                u16 xVal;
                r5 = r5 + r3;
                xVal = I(r5);
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                *bgOffsets = xVal;
                bgOffsets += 2;
            }
        }
    }
}

void sub_802DDC4(u8 p0, u16 p1)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    s32 r5 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - (Q(1.0) + 1)) << 16 > 510 << 16)
        return;

    if ((r6 - Q(2.0)) == 0 || (r6 - Q(2.0)) == 1) {
        s16 i;

        bgOffsets = &bgOffsets[p0 * 2];

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
            r3 = Q(1.0);
        }

        if (r6 < Q(2.0)) {
            bgOffsets = &bgOffsets[p0 * 2];

            // __0802DC56
            for (i = p0; i < DISPLAY_HEIGHT; i++) {
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }

                // TODO: Macro?
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets += 2;
            }
        } else {
            // _0802DC90
            bgOffsets = &bgOffsets[DISPLAY_HEIGHT * 2];

            for (i = DISPLAY_HEIGHT; i > p0; i--) {
                bgOffsets--;
                *bgOffsets = DISPLAY_WIDTH;
                bgOffsets--;
            }

            bgOffsets = gBgOffsetsHBlank;
            bgOffsets += p0 * 2;

            for (i = p0; i >= 0; i--) {
                // _0802DC9C
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q(r5) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                bgOffsets -= 1;
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets -= 1;
            }
        }
    }
}

void sub_802DF18(u8 p0, u16 p1)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    s32 r2;
    s32 r7 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;
    s16 i, j;
    s32 r3;
    s32 r1;

    if ((unsigned)(r6 - (Q(1.0) + 1)) << 16 > 510 << 16)
        return;

    if ((r6 - Q(2.0)) == 0 || (r6 - Q(2.0)) == 1) {
        for (i = 0; i < p0; i++) {
            bgOffsets++;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets++;
        }
    } else {
        r3 = (COS(r6) * 15) >> 2;
        r1 = SIN_24_8(r6);

        r3 = ABS(r3);
        r1 = ABS(r1);

        if (r3 != 0) {
            r3 = Div(r3, r1);
        } else {
            r3 = Q(1.0);
        }

        if (r6 < Q(2.0)) {
            for (i = 0; i < p0; i++) {

                // TODO: Macro?
                *bgOffsets++;
                *bgOffsets = DISPLAY_WIDTH;
                *bgOffsets++;
            }

#ifndef NON_MATCHING
            i = p0;
            if (i < DISPLAY_HEIGHT) {
                do {
#else
            for (i = p0; i < DISPLAY_HEIGHT; i++) {
#endif
                    u32 val;

                    r7 += r3;
                    val = r7;

                    val = (val << 8) >> 16;

                    if (val > DISPLAY_WIDTH)
                        return;

                    *bgOffsets++;
                    *bgOffsets = DISPLAY_WIDTH - val;
                    *bgOffsets++;
#ifndef NON_MATCHING
                    i++;
                } while (i < DISPLAY_HEIGHT);
#endif
            }
        } else {
            bgOffsets += p0 * sizeof(u16);

            for (i = p0; i >= 0; i--) {
                u32 xVal;
                r7 = r7 + r3;
                xVal = (u32)Q(r7) >> 16;
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r7 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets -= 2;
            }
        }
    }
}

void sub_802E044(s32 p0, u16 p1)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    u16 r5 = ((unsigned)p1 << 22) >> 22;

    if (r5 > 512) {
        s32 r3 = (COS(r5) * 15) >> 2;
        s32 r1 = SIN_24_8(r5);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q(1.0);
            }
        }

        bgOffsets = &bgOffsets[(DISPLAY_HEIGHT - 1) * 2];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 -= r3;
            val = I(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            *bgOffsets = val;
            bgOffsets -= 2;
        }
    }
}

void sub_802E0D4(s32 inP0, u16 p1)
{
    s32 p0 = inP0;
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if (r6 > Q(2.0)) {
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q(1.0);
            }
        }

        bgOffsets = &bgOffsets[(DISPLAY_HEIGHT - 1) * 2];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 -= r3;
            val = I(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            bgOffsets--;
            *bgOffsets = val;
            bgOffsets--;
        }
    }
}

void sub_802E164(s32 p0, u16 p1)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    u16 r5 = ((unsigned)p1 << 22) >> 22;

    if (r5 <= Q(2.0)) {
        s32 r3 = (COS(r5) * 15) >> 2;
        s32 r1 = SIN_24_8(r5);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q(1.0);
            }
        }

        bgOffsets = &bgOffsets[0];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 += r3;
            val = I(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            *bgOffsets = val;
            bgOffsets += 2;
        }
    }
}

void sub_802E1EC(s32 p0, u16 p1)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if (r6 <= Q(2.0)) {
        s32 r3 = (COS(r6) * 15) >> 2;
        s32 r1 = SIN_24_8(r6);
        s16 i;

        if (r3 != 0) {
            if (r1 != 0) {
                r3 = Div(r3, r1);
            } else {
                r3 = Q(1.0);
            }
        }

        bgOffsets = &bgOffsets[0];

        for (i = 0; i < DISPLAY_HEIGHT; i++) {
            s32 val;
            p0 += r3;
            val = I(p0);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                p0 = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                p0 = 0;
                val = 0;
            }

            bgOffsets++;
            *bgOffsets = val;
            bgOffsets++;
        }
    }
}

#define STGINTRO_SP_SIZE 8
void sub_802E278(s16 *p0, u8 pairCount)
{
    s16 i;
    s16 j;

    s16 sp[STGINTRO_SP_SIZE][2];

#ifdef BUG_FIX
    // Make sure pairCount isn't bigger than the # of elements in sp
    if (pairCount > STGINTRO_SP_SIZE)
        pairCount = STGINTRO_SP_SIZE;
#endif

    for (j = 0; j < pairCount; j++) {
#ifndef NON_MATCHING
        s16 *r3;
        asm("" ::: "r0", "r2");
        sp[j][0] = *(r3 = &p0[j * 2 + 0]);
#else
        sp[j][0] = p0[j * 2 + 0];
#endif
        sp[j][1] = p0[j * 2 + 1];
    }

    for (i = 0; i < pairCount - 1; i++) {
        int_vcount *bgOffsets = gBgOffsetsHBlank;
        // s16 yVal = sp[i][1];
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l, r;
        s32 v;

        bgOffsets = &bgOffsets[sp[i][1] * 2];
        xVal = sp[i][0];
        xVal2 = Q(xVal);

        v = sp[i][1] - sp[i + 1][1];
        if (v != 0) {
            r4 = Div(Q(xVal - sp[i + 1][0]), sp[i][1] - sp[i + 1][1]);
        } else {
            r4 = Q(xVal - sp[i + 1][0]);
        }

        l = sp[i][1];
        while (l <= sp[i + 1][1]) {
            s32 r0 = (int_vcount)(xVal2 >> 8);

            if (r0 > DISPLAY_WIDTH)
                r0 = DISPLAY_WIDTH;

            *bgOffsets++ = r0;
            *bgOffsets++;

            xVal2 += r4;
            l++;
        }
    }
}

void sub_802E384(s16 *p0, u16 pairCount)
{
    s16 i, j;
    s16 sp[STGINTRO_SP_SIZE][2];

#ifdef NON_MATCHING
    // Make sure pairCount isn't bigger than the # of elements in sp
    if (pairCount > STGINTRO_SP_SIZE)
        pairCount = STGINTRO_SP_SIZE;
#endif

    for (i = 0; i < pairCount; i++) {
#ifndef NON_MATCHING
        s16 *r3;
        asm("" ::: "r0", "r2");
        sp[i][0] = *(r3 = &p0[i * 2 + 0]);
#else
        sp[i][0] = p0[i * 2 + 0];
#endif
        sp[i][1] = p0[i * 2 + 1];
    }

    for (j = 0; j < pairCount - 1; j++) {

        int_vcount *bgOffsets = gBgOffsetsHBlank;
#ifndef NON_MATCHING
        register s32 yVal asm("r3") = sp[j][1];
#else
        s32 yVal = sp[j][1];
#endif
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l, r;

        bgOffsets = &bgOffsets[yVal * 2];
        xVal = sp[j][0];
        xVal2 = Q(xVal);

        yVal -= sp[j + 1][1];

        if (yVal != 0) {
            r4 = Div(Q(xVal - sp[j + 1][0]), yVal);
        } else {
            r4 = Q(xVal - sp[j + 1][0]);
        }

        l = sp[j][1];
        while (l <= sp[j + 1][1]) {
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

void sub_802E49C(s16 *input, u8 length)
{
    u8 i, j;
    s32 temp3, temp5, temp;
    s16 pairs[8][2];
    s16 last_pairs_1[8][2];
    s16 last_pairs_2[8][2];
    s16 another_pair_1[2];
    s16 another_pair_2[2];
    u8 array[DISPLAY_HEIGHT];

    if (length > 8) {
        return;
    }

    if (length <= 2) {
        return;
    }

    for (i = 0; i < length; i++) {
#ifndef NON_MATCHING
        pairs[i][0] = *({
            s16 *a = input;
            a += (i * 2);
            a;
        });
#else
        pairs[i][1] = input[i * 2 + 0];
#endif
        pairs[i][1] = input[i * 2 + 1];
    }

    for (i = 0; i < length - 1; i++) {
        for (j = i + 1; j < length; j++) {
            if (pairs[i][1] >= pairs[j][1] && (pairs[i][1] != pairs[j][1] || pairs[i][0] >= pairs[j][0])) {
                s16 temp;
                temp = pairs[i][0];
                pairs[i][0] = pairs[j][0];
                pairs[j][0] = temp;

                temp = pairs[i][1];
                pairs[i][1] = pairs[j][1];
                pairs[j][1] = temp;
            }
        }
    }

    another_pair_1[0] = pairs[0][0];
    another_pair_1[1] = pairs[0][1];

    for (i = 1; i < length && another_pair_1[1] == pairs[i][1]; i++) {
        if (another_pair_1[0] > pairs[i][0]) {
            another_pair_1[0] = pairs[i][0];
            another_pair_1[1] = pairs[i][1];
        }
    }

    another_pair_2[0] = pairs[length - 1][0];
    another_pair_2[1] = pairs[length - 1][1];

    for (i = length - 2; i > 0 && another_pair_2[1] <= pairs[i][1]; i--) {
        if (another_pair_2[0] < pairs[i][0]) {
            another_pair_2[0] = pairs[i][0];
            another_pair_2[1] = pairs[i][1];
        }
    }

    temp5 = Q(another_pair_1[0]);
    temp = (another_pair_2[1] - another_pair_1[1]);
    if (temp != 0) {
        temp3 = Div(Q(another_pair_2[0] - another_pair_1[0]) + Q(0.5), another_pair_2[1] - another_pair_1[1]);
    } else {
        temp3 = Q(another_pair_2[0] - another_pair_1[0]);
    }

    for (i = another_pair_1[1]; i <= another_pair_2[1]; i++) {
        s16 temp4 = I(temp5);
        if (temp4 > DISPLAY_WIDTH) {
            temp4 = DISPLAY_WIDTH;
        }

        if (temp4 < 0) {
            temp4 = 0;
        }
        array[i] = temp4;
        temp5 += temp3;
    }

    for (i = 0, j = 0; i < length; i++) {
        if (array[pairs[i][1]] <= pairs[i][0]) {
            last_pairs_1[j][0] = pairs[i][0];
            last_pairs_1[j][1] = pairs[i][1];
            j++;
        }
    }

    sub_802E278(last_pairs_1[0], j);

    for (i = 0, j = 0; i < length; i++) {
        if (array[pairs[i][1]] >= pairs[i][0]) {
            last_pairs_2[j][0] = pairs[i][0];
            last_pairs_2[j][1] = pairs[i][1];
            j++;
        }
    }

    sub_802E384(last_pairs_2[0], j);
}

void sub_802E784(u16 a, u16 b, u16 c, s16 x, s16 y, u8 d)
{
    s32 r6, r7, r1;

    s16 temp, r3, sl = 0;
    s16 tmp8[7][2];

    s16 limitY2, limitX2;
    s16 limitX1, limitY1;

    gHBlankCopySize = 2;
    gHBlankCopyTarget = (void *)REG_ADDR_WIN0H;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    if (x > 0 && x < DISPLAY_WIDTH && y < DISPLAY_HEIGHT && x > 0) {
        u16 i;
#ifndef NON_MATCHING
        s32 r8;
#endif
        if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
            DmaFill16(3, 0, &gBgOffsetsBuffer[0], sizeof(gBgOffsetsBuffer[0]));
        } else {
            DmaFill16(3, 0, &gBgOffsetsBuffer[1], sizeof(gBgOffsetsBuffer[1]));
        }

        r1 = CLAMP_SIN_PERIOD(a - Q(1));
        r6 = (COS(r1) * b) >> 15;
#ifndef NON_MATCHING
        {
            register void *r1_2 asm("r1") = (r1 * 2) + ((void *)gSineTable);
            r8 = *(s16 *)r1_2;
            r7 = (r8 * b) >> 15;
        }
#else
        r7 = (COS(r1) * b) >> 15;
#endif

        tmp8[1][0] = x + r6;
        tmp8[1][1] = y + r7;
        tmp8[0][0] = (x - r6);
        tmp8[0][1] = (y - r7);

        r6 = (COS(a) * d) >> 14;
        r7 = (SIN(a) * d) >> 14;

        tmp8[1][0] += r6;
        tmp8[1][1] += r7;

        tmp8[0][0] += r6;
        tmp8[0][1] += r7;

        limitX1 = tmp8[1][0];
        limitY1 = tmp8[1][1];
        limitX2 = tmp8[0][0];
        limitY2 = tmp8[0][1];

        r6 = (COS(r1) * c) >> 15;
#ifndef NON_MATCHING
        r7 = (r8 * c) >> 15;
#else
        r7 = (SIN(r1) * c) >> 15;
#endif

        tmp8[2][0] = x + r6;
        tmp8[2][1] = y + r7;
        tmp8[3][0] = x - r6;
        tmp8[3][1] = y - r7;

        r6 = (COS(a) * 15) >> 2;
        r7 = SIN(a) >> 6;

        if (r6 != 0) {
            if (r7 != 0) {
                r6 = Div(r6, r7);
            } else {
                r6 = Q(DISPLAY_WIDTH);
            }
        }

        r1 = Q(limitX1);

        if (a < Q(2)) {
            for (i = limitY1; i < (DISPLAY_HEIGHT - 1); i++) {
                r1 += r6;
                sl = I(r1);
                if (sl >= DISPLAY_WIDTH) {
                    sl = DISPLAY_WIDTH;
                    break;
                }

                if (sl < 0) {
                    sl = 0;
                    break;
                }
            }
        } else {
            for (i = limitY1; i != 0; i--) {
                r1 -= r6;
                sl = r1 >> 8;
                if (sl >= DISPLAY_WIDTH) {
                    sl = DISPLAY_WIDTH;
                    break;
                }

                if (sl < 0) {
                    sl = 0;
                    break;
                }
            }
        }

        tmp8[4][0] = sl;
        tmp8[4][1] = i;

        r1 = Q(limitX2);

        if (a < Q(2)) {
            for (i = limitY2; i < (DISPLAY_HEIGHT - 1); i++) {
                r1 += r6;
                sl = I(r1);
                if (sl >= DISPLAY_WIDTH) {
                    sl = DISPLAY_WIDTH;
                    break;
                }

                if (sl < 0) {
                    sl = 0;
                    break;
                }
            }
        } else {
            for (i = limitY2; i != 0; i--) {
                r1 -= r6;
                sl = I(r1);
                if (sl >= DISPLAY_WIDTH) {
                    sl = DISPLAY_WIDTH;
                    break;
                }

                if (sl < 0) {
                    sl = 0;
                    break;
                }
            }
        }
        tmp8[5][0] = sl;
        tmp8[5][1] = i;

        temp = tmp8[5][0];
        if (tmp8[5][0] != tmp8[4][0] && tmp8[5][1] != tmp8[4][1]) {
            if (tmp8[4][0] == 0) {
                tmp8[6][0] = tmp8[4][0];
                tmp8[6][1] = tmp8[5][1];
            } else {
                if (tmp8[5][0] != 0 && tmp8[4][0] == DISPLAY_WIDTH) {
                    tmp8[6][0] = tmp8[4][0];
                    tmp8[6][1] = tmp8[5][1];
                } else {
                    tmp8[6][0] = temp;
                    tmp8[6][1] = tmp8[4][1];
                }
            }
            sub_802E49C(tmp8[0], 7);
        } else {
            sub_802E49C(tmp8[0], 6);
        }
    } else {

        if ((b / 2) == 0) {
            if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                DmaFill16(3, 0, &gBgOffsetsBuffer[0], sizeof(gBgOffsetsBuffer[0]));
            } else {
                DmaFill16(3, 0, &gBgOffsetsBuffer[1], sizeof(gBgOffsetsBuffer[1]));
            }
            return;
        }

        if (a > Q(1) && a < Q(3) && x >= DISPLAY_WIDTH) {
            r7 = (SIN(a) * (x - DISPLAY_WIDTH)) >> 14;
            r7 += y;

            if (r7 > 0 && r7 < DISPLAY_HEIGHT) {
                s16 r3, r4;
                r3 = DISPLAY_WIDTH + 1;
                if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                    DmaFill16(3, r3, &gBgOffsetsBuffer[0], sizeof(gBgOffsetsBuffer[0]));
                } else {
                    DmaFill16(3, r3, &gBgOffsetsBuffer[1], sizeof(gBgOffsetsBuffer[1]));
                }

                r4 = r7 - (b / 2);
                if (r4 < 0) {
                    r4 = 0;
                } else if (r4 > DISPLAY_HEIGHT) {
                    r4 = DISPLAY_HEIGHT;
                }
                sub_802DF18(r4, a);

                r4 = r7 + (b / 2);
                if (r4 < 0) {
                    r4 = 0;
                } else if (r4 > DISPLAY_HEIGHT) {
                    r4 = DISPLAY_HEIGHT;
                }
                sub_802DDC4(r4, a);
                return;
            }
        }

        if (a > Q(2)) {
            if (y >= DISPLAY_HEIGHT) {
                s16 r3, r4;
                r6 = (COS(a) * (y - DISPLAY_HEIGHT)) >> 14;
                r6 += x;

                if (r6 > 0 && r6 < DISPLAY_WIDTH) {
                    r3 = DISPLAY_WIDTH + 1;
                    if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                        DmaFill16(3, r3, &gBgOffsetsBuffer[0], sizeof(gBgOffsetsBuffer[0]));
                    } else {
                        DmaFill16(3, r3, &gBgOffsetsBuffer[1], sizeof(gBgOffsetsBuffer[1]));
                    }

                    r4 = r6 - (b / 2);
                    if (r4 < 0) {
                        r4 = 0;
                    } else if (r4 > DISPLAY_WIDTH) {
                        r4 = DISPLAY_WIDTH;
                    }
                    sub_802E0D4(r4 << 8, a);

                    r4 = r6 + (b / 2);
                    if (r4 < 0) {
                        r4 = 0;
                    } else if (r4 > DISPLAY_WIDTH) {
                        r4 = DISPLAY_WIDTH;
                    }
                    sub_802E044(Q(r4), a);
                    return;
                }
            }
        }

        if (a <= Q(2)) {
            if (y < 0) {
                s16 r3, r4;
                r6 = Q_2_14_TO_INT(COS(a) * (y - DISPLAY_HEIGHT));
                r6 += x;
                if (r6 > 0 && r6 < DISPLAY_WIDTH) {
                    r3 = DISPLAY_WIDTH + 1;
                    if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                        DmaFill16(3, r3, &gBgOffsetsBuffer[0], sizeof(gBgOffsetsBuffer[0]));
                    } else {
                        DmaFill16(3, r3, &gBgOffsetsBuffer[1], sizeof(gBgOffsetsBuffer[1]));
                    }

                    r4 = r6 - (b / 2);
                    if (r4 < 0) {
                        r4 = 0;
                    } else if (r4 > DISPLAY_WIDTH) {
                        r4 = DISPLAY_WIDTH;
                    }
                    sub_802E1EC(Q(r4), a);

                    r4 = r6 + (b / 2);
                    if (r4 < 0) {
                        r4 = 0;
                    } else if (r4 > DISPLAY_WIDTH) {
                        r4 = DISPLAY_WIDTH;
                    }
                    sub_802E164(Q(r4), a);
                }
            }
        }
    }
}
