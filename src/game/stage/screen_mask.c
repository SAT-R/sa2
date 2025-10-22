#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"
#include "game/stage/screen_mask.h"

#define MAX_PAIRS 8

void sub_802DBC0(int_vcount y, u16 angle)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
#ifdef BUG_FIX
    if (bgOffsets == NULL) {
        return;
    }
#endif
    s32 r5 = 0;
    angle = angle % SIN_PERIOD;
    if (angle >= DEG_TO_SIN(90) && angle <= DEG_TO_SIN(270))
        return;

    if (angle == 0 || angle == 1) {
        s16 i;

        bgOffsets = &bgOffsets[y * 2];

#ifndef NON_MATCHING
        asm("" : "=r"(r5));
#endif
        for (i = 0; i < (DISPLAY_HEIGHT - y); i++) {
            // TODO: Is this a macro?
            bgOffsets++;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets++;
        }
    } else {
        // _0802DC14
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 sin = SIN_24_8(angle);
        s16 i; // r7

        if (r3 != 0) {
            r3 = Div(r3, sin);
        } else {
            r3 = Q(1.0);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if (angle < DEG_TO_SIN(180)) {
            bgOffsets = &bgOffsets[y * 2];

            // __0802DC56
            for (i = y; i < DISPLAY_HEIGHT; i++) {
                u16 xVal;
                r5 = r5 + r3;
                xVal = I(r5);
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
            bgOffsets = &bgOffsets[y * 2];

            for (i = y; i >= 0; i--) {
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
                bgOffsets -= 2;
            }
        }
    }
}

UNUSED void sub_802DCC8(int_vcount inY, u16 inAngle)
{
    u32 y = inY;
    s16 i;
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    s32 r5 = 0;

    u16 angle = inAngle = inAngle % SIN_PERIOD;
    if (angle >= DEG_TO_SIN(90) && angle <= DEG_TO_SIN(270))
        return;

    if (angle == 0 || angle == 1) {
        bgOffsets = &bgOffsets[y * 2];

        for (i = y; i > 0; i--) {
            // TODO: Is this a macro?
            bgOffsets--;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets--;
        }
    } else {
        // _0802DC14
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 r1 = SIN_24_8(angle);

        if (r3 != 0) {
            r3 = Div(r3, r1);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if (angle < DEG_TO_SIN(180)) {
            bgOffsets = &bgOffsets[y * 2];

            // __0802DC56
            for (i = y; i >= 0; i--) {
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
            bgOffsets = &bgOffsets[y * 2];

            for (i = y; i < DISPLAY_HEIGHT; i++) {
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

void sub_802DDC4(int_vcount y, u16 angle)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    s32 r5 = 0;
    angle = angle % SIN_PERIOD;

    // TODO: fix range check
    if ((unsigned)(angle - (DEG_TO_SIN(90) + 1)) << 16 > 510 << 16)
        return;

    if (angle == DEG_TO_SIN(180) || angle == 513) {
        s16 i;

        bgOffsets = &bgOffsets[y * 2];

#ifndef NON_MATCHING
        asm("" : "=r"(r5));
#endif
        for (i = 0; i < (DISPLAY_HEIGHT - y); i++) {
            // TODO: Is this a macro?
            bgOffsets++;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets++;
        }
    } else {
        // _0802DC14
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 r1 = SIN_24_8(angle);
        s16 i; // r7

        r3 = ABS(r3);
        r1 = ABS(r1);

        if (r3 != 0) {
            r3 = Div(r3, r1);
        } else {
            r3 = Q(1.0);
        }

        if (angle < DEG_TO_SIN(180)) {
            bgOffsets = &bgOffsets[y * 2];

            // __0802DC56
            for (i = y; i < DISPLAY_HEIGHT; i++) {
                u16 xVal;
                r5 = r5 + r3;
                xVal = I(r5);
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

            for (i = DISPLAY_HEIGHT; i > y; i--) {
                bgOffsets--;
                *bgOffsets = DISPLAY_WIDTH;
                bgOffsets--;
            }

            bgOffsets = gBgOffsetsHBlank;
            bgOffsets = &bgOffsets[y * 2];

            for (i = y; i >= 0; i--) {
                // _0802DC9C
                u16 xVal;
                r5 = r5 + r3;
                xVal = I(r5);
                if (xVal > DISPLAY_WIDTH) {
                    r3 = 0;
                    r5 = Q(DISPLAY_WIDTH);
                    xVal = DISPLAY_WIDTH;
                }
                bgOffsets--;
                *bgOffsets = DISPLAY_WIDTH - xVal;
                bgOffsets--;
            }
        }
    }
}

void sub_802DF18(int_vcount y, u16 angle)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    s32 r2;
    s32 r7 = 0;
    s16 i, j;
    s32 r3;
    s32 r1;

    angle = angle % SIN_PERIOD;
    if ((unsigned)(angle - (DEG_TO_SIN(90) + 1)) << 16 > 510 << 16)
        return;

    if (angle == DEG_TO_SIN(180) || angle == 513) {
        for (i = 0; i < y; i++) {
            bgOffsets++;
            *bgOffsets = DISPLAY_WIDTH;
            bgOffsets++;
        }
    } else {
        r3 = (COS(angle) * 15) >> 2;
        r1 = SIN_24_8(angle);

        r3 = ABS(r3);
        r1 = ABS(r1);

        if (r3 != 0) {
            r3 = Div(r3, r1);
        } else {
            r3 = Q(1.0);
        }

        if (angle < DEG_TO_SIN(180)) {
            for (i = 0; i < y; i++) {

                // TODO: Macro?
                *bgOffsets++;
                *bgOffsets = DISPLAY_WIDTH;
                *bgOffsets++;
            }

#ifndef NON_MATCHING
            i = y;
            if (i < DISPLAY_HEIGHT) {
                do {
#else
            for (i = y; i < DISPLAY_HEIGHT; i++) {
#endif
                    u16 val;
                    r7 = r7 + r3;
                    val = I(r7);
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
            bgOffsets = &bgOffsets[y * 2];

            for (i = y; i >= 0; i--) {
                u16 xVal;
                r7 = r7 + r3;
                xVal = I(r7);
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

void sub_802E044(s32 qX, u16 angle)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    angle = angle % SIN_PERIOD;

    if (angle > DEG_TO_SIN(180)) {
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 r1 = SIN_24_8(angle);
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
            qX -= r3;
            val = I(qX);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                qX = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                qX = 0;
                val = 0;
            }

            *bgOffsets = val;
            bgOffsets -= 2;
        }
    }
}

void sub_802E0D4(s32 inQX, u16 angle)
{
    s32 qX = inQX;
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    angle = angle % SIN_PERIOD;

    if (angle > DEG_TO_SIN(180)) {
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 r1 = SIN_24_8(angle);
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
            qX -= r3;
            val = I(qX);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                qX = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                qX = 0;
                val = 0;
            }

            bgOffsets--;
            *bgOffsets = val;
            bgOffsets--;
        }
    }
}

void sub_802E164(s32 qX, u16 angle)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    angle = angle % SIN_PERIOD;

    if (angle <= DEG_TO_SIN(180)) {
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 r1 = SIN_24_8(angle);
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
            qX += r3;
            val = I(qX);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                qX = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                qX = 0;
                val = 0;
            }

            *bgOffsets = val;
            bgOffsets += 2;
        }
    }
}

void sub_802E1EC(s32 qX, u16 angle)
{
    int_vcount *bgOffsets = gBgOffsetsHBlank;
    angle = angle % SIN_PERIOD;

    if (angle <= DEG_TO_SIN(180)) {
        s32 r3 = (COS(angle) * 15) >> 2;
        s32 r1 = SIN_24_8(angle);
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
            qX += r3;
            val = I(qX);

            if (val > DISPLAY_WIDTH) {
                r3 = 0;
                qX = Q(DISPLAY_WIDTH);
                val = DISPLAY_WIDTH;
            }

            if (val < 0) {
                r3 = 0;
                qX = 0;
                val = 0;
            }

            bgOffsets++;
            *bgOffsets = val;
            bgOffsets++;
        }
    }
}

void sub_802E278(s16 *p0, u8 pairCount)
{
    s16 i, j;

    s16 pairs[MAX_PAIRS][2];

#ifdef BUG_FIX
    // Make sure pairCount isn't bigger than the # of elements in pairs
    if (pairCount > MAX_PAIRS)
        pairCount = MAX_PAIRS;
#endif

    for (j = 0; j < pairCount; j++) {
#ifndef NON_MATCHING
        s16 *r3;
        asm("" ::: "r0", "r2");
        pairs[j][0] = *(r3 = &p0[j * 2 + 0]);
#else
        pairs[j][0] = p0[j * 2 + 0];
#endif
        pairs[j][1] = p0[j * 2 + 1];
    }

    for (i = 0; i < pairCount - 1; i++) {
        int_vcount *bgOffsets = gBgOffsetsHBlank;
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l, r;
        s32 v;

        bgOffsets = &bgOffsets[pairs[i][1] * 2];
        xVal = pairs[i][0];
        xVal2 = Q(xVal);

        v = pairs[i][1] - pairs[i + 1][1];
        if (v != 0) {
            r4 = Div(Q(xVal - pairs[i + 1][0]), pairs[i][1] - pairs[i + 1][1]);
        } else {
            r4 = Q(xVal - pairs[i + 1][0]);
        }

        for (l = pairs[i][1]; l <= pairs[i + 1][1]; l++) {
            s32 r0 = (int_vcount)I(xVal2);

            if (r0 > DISPLAY_WIDTH)
                r0 = DISPLAY_WIDTH;

            *bgOffsets++ = r0;
            *bgOffsets++;

            xVal2 += r4;
        }
    }
}

void sub_802E384(s16 *p0, u16 pairCount)
{
    s16 i, j;
    s16 sp[MAX_PAIRS][2];

#ifdef NON_MATCHING
    // Make sure pairCount isn't bigger than the # of elements in sp
    if (pairCount > MAX_PAIRS)
        pairCount = MAX_PAIRS;
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
        s16 i;

        bgOffsets = &bgOffsets[yVal * 2];
        xVal = sp[j][0];
        xVal2 = Q(xVal);

        yVal -= sp[j + 1][1];

        if (yVal != 0) {
            r4 = Div(Q(xVal - sp[j + 1][0]), yVal);
        } else {
            r4 = Q(xVal - sp[j + 1][0]);
        }

        for (i = sp[j][1]; i <= sp[j + 1][1]; i++) {
            s16 r1 = I(xVal2);

            if (r1 > DISPLAY_WIDTH)
                r1 = DISPLAY_WIDTH;

            if (r1 < 0)
                r1 = 0;

            *bgOffsets++;
            *bgOffsets = r1;
            *bgOffsets++;

            xVal2 += r4;
        }
    }
}

void sub_802E49C(s16 *input, u8 pairCount)
{
    u8 i, j;
    s32 temp3, temp5, temp;
    s16 pairs[MAX_PAIRS][2];
    s16 last_pairs_1[MAX_PAIRS][2];
    s16 last_pairs_2[MAX_PAIRS][2];
    s16 another_pair_1[2];
    s16 another_pair_2[2];
    u8 array[DISPLAY_HEIGHT];

    if (pairCount > MAX_PAIRS) {
        return;
    }

    if (pairCount <= 2) {
        return;
    }

    for (i = 0; i < pairCount; i++) {
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

    for (i = 0; i < pairCount - 1; i++) {
        for (j = i + 1; j < pairCount; j++) {
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

    for (i = 1; i < pairCount && another_pair_1[1] == pairs[i][1]; i++) {
        if (another_pair_1[0] > pairs[i][0]) {
            another_pair_1[0] = pairs[i][0];
            another_pair_1[1] = pairs[i][1];
        }
    }

    another_pair_2[0] = pairs[pairCount - 1][0];
    another_pair_2[1] = pairs[pairCount - 1][1];

    for (i = pairCount - 2; i > 0 && another_pair_2[1] <= pairs[i][1]; i--) {
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

    for (i = 0, j = 0; i < pairCount; i++) {
        if (array[pairs[i][1]] <= pairs[i][0]) {
            last_pairs_1[j][0] = pairs[i][0];
            last_pairs_1[j][1] = pairs[i][1];
            j++;
        }
    }

    sub_802E278(last_pairs_1[0], j);

    for (i = 0, j = 0; i < pairCount; i++) {
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
    s16 pairs[7][2];

    s16 limitY2, limitX2;
    s16 limitX1, limitY1;

    gHBlankCopySize = sizeof(winreg_t);
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

        r1 = CLAMP_SIN_PERIOD(a - DEG_TO_SIN(90));
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

        pairs[1][0] = x + r6;
        pairs[1][1] = y + r7;
        pairs[0][0] = (x - r6);
        pairs[0][1] = (y - r7);

        r6 = Q_2_14_TO_INT(COS(a) * d);
        r7 = Q_2_14_TO_INT(SIN(a) * d);

        pairs[1][0] += r6;
        pairs[1][1] += r7;

        pairs[0][0] += r6;
        pairs[0][1] += r7;

        limitX1 = pairs[1][0];
        limitY1 = pairs[1][1];
        limitX2 = pairs[0][0];
        limitY2 = pairs[0][1];

        r6 = (COS(r1) * c) >> 15;
#ifndef NON_MATCHING
        r7 = (r8 * c) >> 15;
#else
        r7 = (SIN(r1) * c) >> 15;
#endif

        pairs[2][0] = x + r6;
        pairs[2][1] = y + r7;
        pairs[3][0] = x - r6;
        pairs[3][1] = y - r7;

        r6 = (COS(a) * 15) >> 2;
        r7 = SIN_24_8(a);

        if (r6 != 0) {
            if (r7 != 0) {
                r6 = Div(r6, r7);
            } else {
                r6 = Q(DISPLAY_WIDTH);
            }
        }

        r1 = Q(limitX1);

        if (a < DEG_TO_SIN(180)) {
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

        pairs[4][0] = sl;
        pairs[4][1] = i;

        r1 = Q(limitX2);

        if (a < DEG_TO_SIN(180)) {
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
        pairs[5][0] = sl;
        pairs[5][1] = i;

        temp = pairs[5][0];
        if (pairs[5][0] != pairs[4][0] && pairs[5][1] != pairs[4][1]) {
            if (pairs[4][0] == 0) {
                pairs[6][0] = pairs[4][0];
                pairs[6][1] = pairs[5][1];
            } else {
                if (pairs[5][0] != 0 && pairs[4][0] == DISPLAY_WIDTH) {
                    pairs[6][0] = pairs[4][0];
                    pairs[6][1] = pairs[5][1];
                } else {
                    pairs[6][0] = temp;
                    pairs[6][1] = pairs[4][1];
                }
            }
            sub_802E49C(pairs[0], 7);
        } else {
            sub_802E49C(pairs[0], 6);
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

        if (a > DEG_TO_SIN(90) && a < DEG_TO_SIN(270) && x >= DISPLAY_WIDTH) {
            r7 = Q_2_14_TO_INT(SIN(a) * (x - DISPLAY_WIDTH));
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

        if (a > DEG_TO_SIN(180)) {
            if (y >= DISPLAY_HEIGHT) {
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
                    sub_802E0D4(Q(r4), a);

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

        if (a <= DEG_TO_SIN(180)) {
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
