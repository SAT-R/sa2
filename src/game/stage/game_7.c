#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

void sub_802DBC0(u8 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
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
            r3 = Q(1.0);
        }
        // _0802DC4A

        r3 = ABS(r3);

        if (r6 < Q(2.0)) {
            bgOffsets = &bgOffsets[p0 * sizeof(u16)];

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
            bgOffsets = &bgOffsets[p0 * sizeof(u16)];

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

// (84.45%) https://decomp.me/scratch/ge5fv
NONMATCH("asm/non_matching/game/stage/sub_802DCC8.inc", void sub_802DCC8(u8 p0, u16 p1))
{
#ifndef NON_MATCHING
    register u32 r7 asm("r7") = p0;
    u8 *bgOffsets = gBgOffsetsHBlank;
    register s32 r5 asm("r5") = 0;
    register u16 r6 asm("r6") = ((unsigned)p1 << 22) >> 22;
#else
    u32 r7 = p0;
    u8 *bgOffsets = gBgOffsetsHBlank;
    s32 r5 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;
#endif

    if ((unsigned)(r6 - Q(1.0)) << 16 <= 512 << 16)
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

        if (r6 < Q(2.0)) {
            bgOffsets = &bgOffsets[r7 * sizeof(u16)];

            // __0802DC56
            for (i = r7; i >= 0; i--) {
                u32 xVal;
                r5 = r5 + r3;
                xVal = (u32)Q(r5) >> 16;
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
            bgOffsets = &bgOffsets[r7 * sizeof(u16)];

            for (i = r7; i < DISPLAY_HEIGHT; i++) {
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
                bgOffsets += 2;
            }
        }
    }
}
END_NONMATCH

void sub_802DDC4(u8 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    s32 r5 = 0;
    u16 r6 = ((unsigned)p1 << 22) >> 22;

    if ((unsigned)(r6 - (Q(1.0) + 1)) << 16 > 510 << 16)
        return;

    if ((r6 - Q(2.0)) == 0 || (r6 - Q(2.0)) == 1) {
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
            r3 = Q(1.0);
        }

        if (r6 < Q(2.0)) {
            bgOffsets = &bgOffsets[p0 * sizeof(u16)];

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
            bgOffsets = &bgOffsets[DISPLAY_HEIGHT * sizeof(u16)];

            for (i = DISPLAY_HEIGHT; i > p0; i--) {
                bgOffsets--;
                *bgOffsets = DISPLAY_WIDTH;
                bgOffsets--;
            }

            bgOffsets = gBgOffsetsHBlank;
            bgOffsets += p0 * sizeof(u16);

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

// (98.53%) https://decomp.me/scratch/khvum
// (98.53%) https://decomp.me/scratch/aNJxr
NONMATCH("asm/non_matching/game/stage/sub_802DF18.inc", void sub_802DF18(u8 p0, u16 p1))
{
    u8 *bgOffsets = gBgOffsetsHBlank;
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

            for (j = p0; j < DISPLAY_HEIGHT; j++) {
                u32 val;

                r7 += r3;
                val = r7;

                val = (val << 8) >> 16;

                if (val > DISPLAY_WIDTH)
                    return;

                *bgOffsets++;
                *bgOffsets = DISPLAY_WIDTH - val;
                *bgOffsets++;
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
END_NONMATCH

void sub_802E044(s32 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
    u16 r5 = ((unsigned)p1 << 22) >> 22;

    if (r5 > Q(2.0)) {
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

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[DISPLAY_HEIGHT - 1];

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
            bgOffsets -= sizeof(u16);
        }
    }
}

void sub_802E0D4(s32 inP0, u16 p1)
{
    s32 p0 = inP0;
    u8 *bgOffsets = gBgOffsetsHBlank;
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

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[DISPLAY_HEIGHT - 1];

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
    u8 *bgOffsets = gBgOffsetsHBlank;
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

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[0];

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
            bgOffsets += sizeof(u16);
        }
    }
}

void sub_802E1EC(s32 p0, u16 p1)
{
    u8 *bgOffsets = gBgOffsetsHBlank;
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

        bgOffsets = (u8 *)&((u16 *)bgOffsets)[0];

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

// (99.77%) https://decomp.me/scratch/BhinB
// (addendum by Ollie https://decomp.me/scratch/qyFAO )
// (99.92% https://decomp.me/scratch/m5XSc )
NONMATCH("asm/non_matching/game/stage/sub_802E278.inc", void sub_802E278(s16 p0[2][2], u8 pairCount))
{
    s16 i;
    s16 j;
    s16 sp[STGINTRO_SP_SIZE][2];

#ifdef NON_MATCHING
    // Make sure pairCount isn't bigger than the # of elements in sp
    if (pairCount > STGINTRO_SP_SIZE)
        pairCount = STGINTRO_SP_SIZE;
#endif

    for (j = 0; j < pairCount; j++) {
#ifndef NON_MATCHING
        asm("" ::: "r0", "r2");
#endif
        sp[j][0] = p0[j][0];
        sp[j][1] = p0[j][1];
    }

    for (i = 0; i < pairCount - 1; i++) {
        u8 *bgOffsets = gBgOffsetsHBlank;
        // s16 yVal = sp[i][1];
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l, r;
        s32 v;

        bgOffsets = (u8 *)&((s16 *)bgOffsets)[sp[i][1]];
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
NONMATCH("asm/non_matching/game/stage/sub_802E384.inc", void sub_802E384(Vec2_16 *p0, u16 pairCount))
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
#ifndef NON_MATCHING
        register s32 yVal asm("r3") = sp[i][1];
#else
        s32 yVal = sp[i][1];
#endif
        s16 xVal;
        s32 xVal2;
        s32 r4;
        s16 l;

        bgOffsets = (u8 *)&((s16 *)bgOffsets)[yVal];
        xVal = sp[i][0];
        xVal2 = Q(xVal);

        yVal -= sp[i + 1][1];

        if (yVal != 0) {
            r4 = Div(Q(xVal - sp[i + 1][0]), yVal);
        } else {
            r4 = Q(xVal - sp[i + 1][0]);
        }

        l = sp[i][1];
        while (l <= sp[i + 1][1]) {
            s16 r1 = (xVal2 >> 8);

            if (r1 > DISPLAY_WIDTH)
                r1 = DISPLAY_WIDTH;

            if (r1 < 0)
                r1 = 0;

            bgOffsets++;
            *bgOffsets = r1;
            bgOffsets++;

            xVal2 += r4;
            l++;
        }
    }
}
END_NONMATCH

void sub_802E49C(s32 *tmp9, s32);

void sub_802E784(u16 a, u16 b, u16 c, s16 x, s16 y, s16 d)
{
    s32 sin;
    s32 idx;
    s16 temp2;
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = REG_ADDR_WIN0H;
    gFlags |= FLAGS_4;

    if (0xEE > (u16)(x - 1) || 0x9F < y || x < 1) {
        if ((b >> 1) == 0) {
            if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                gUnknown_03002878 = REG_ADDR_WIN0H;
                gUnknown_03002A80 = 2;
                DmaClear32(3, &gBgOffsetsBuffer[0], 160 * 4);
                return;
            } else {
                gUnknown_03002878 = REG_ADDR_WIN0H;
                gUnknown_03002A80 = 2;
                DmaClear32(3, &gBgOffsetsBuffer[1], 160 * 4);
                return;
            }
        }

        if ((a - 0x101) <= 8160 && 239 < x) {
            sin = (SIN(a) * (x - 240)) >> 0xE + y;

            if ((u32)(sin - 1) < 0x9F) {
                if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                    DmaClear32(3, &gBgOffsetsBuffer[0], 160 * 4);
                } else {
                    DmaClear32(3, &gBgOffsetsBuffer[1], 160 * 4);
                }

                sub_802DDC4(CLAMP_16(sin - (b >> 1), 0, 0xA0), a);
                return;
            }
        }
        if (a > 0x200) {
            if (y > 0x9F) {
                sin = (COS(a) * (y - 0xA0)) >> 0xE + x;

                if ((u32)(sin - 1) < 0xEF) {
                    if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
                        DmaClear32(3, &gBgOffsetsBuffer[0], 160 * 4);
                    } else {
                        DmaClear32(3, &gBgOffsetsBuffer[1], 160 * 4);
                    }

                    sub_802DDC4(CLAMP_16(sin - b, 0, 0xF0) << 8, a);
                    sub_802DDC4(CLAMP_16(sin + b, 0, 0xF0) << 8, a);
                    return;
                }

                if (a > 0x200) {
                    gUnknown_03002878 = REG_ADDR_WIN0H;
                    gUnknown_03002A80 = 2;
                    return;
                }
            }

            if (a > 0x200) {
                gUnknown_03002878 = REG_ADDR_WIN0H;
                gUnknown_03002A80 = 2;
                return;
            }
        }
        if (y > -1) {
            gUnknown_03002878 = REG_ADDR_WIN0H;
            gUnknown_03002A80 = 2;
            return;
        }

        y = ((COS(a) * (y - 160)) >> 0xE) + x;

        if ((u16)(y - 1) > 0xEE) {
            gUnknown_03002878 = REG_ADDR_WIN0H;
            gUnknown_03002A80 = 2;
            return;
        }
        if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
            DmaClear32(3, &gBgOffsetsBuffer[0], 160 * 4);
        } else {
            DmaClear32(3, &gBgOffsetsBuffer[1], 160 * 4);
        }

        sub_802DDC4(CLAMP_16(sin - b, 0, 0xF0) << 8, a);
        sub_802DDC4(CLAMP_16(sin + b, 0, 0xF0) << 8, a);
        return;
    }

    if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
        DmaClear32(3, &gBgOffsetsBuffer[0], 160 * 4);
    } else {
        DmaClear32(3, &gBgOffsetsBuffer[1], 160 * 4);
    }

    idx = (a - 0x100) & (SIN_PERIOD - 1);
    {
        s32 tmp2 = (b * COS(idx)) >> 0xF;
        s32 tmp4 = (b * SIN(a)) >> 0xF;
        s32 tmp5 = (d * COS(a)) >> 0xE;
        s32 tmp6 = x + tmp2 + tmp5;
        s32 tmp7 = (d * SIN(a)) >> 0xE;
        s16 tmp8[7][2];

        s32 tmp11, tmp12;
        s32 tmp12, tmp13;
        s32 cos2, sin2;
        s32 tmp14;
        s32 tmp15;

        tmp8[0] = y + tmp4 + tmp7;
        tmp8[1] = (x - tmp2) + tmp5;
        tmp8[2] = (y - tmp4) + tmp7;
        tmp8[3] = tmp6;
        tmp8[4] = tmp8[0];
        tmp8[5] = tmp8[1];
        tmp11 = (x + ((c * COS(idx)) >> 0xF));
        tmp12 = (y + ((c * SIN(idx)) >> 0xF));

        x -= tmp2;
        y -= tmp4;

        cos2 = (COS(a) * 0xF) >> 2;
        sin2 = (SIN(a) >> 6);

        if (cos2 != 0) {
            if (sin2 == 0) {
                cos2 = -4096;
            } else {
                cos2 = Div(cos2, sin2);
            }
        }

        sin2 = tmp6 << 8;
        idx = tmp8;
        if (a < 0x200) {
            tmp13 = temp2;
            for (; idx < 0x9F; idx++) {
                sin2 += cos2;
                temp2 = sin2 >> 8;
                sin = sin2 >> 8;
                if (sin > 0xEF) {
                    tmp13 = 0xF0;
                }

                if (sin < 0) {
                    tmp13 = 0;
                }
            }
        } else {
            tmp13 = temp2;
            for (; idx != 0; idx--) {
                sin2 -= cos2;
                temp2 = sin2 >> 8;
                sin = sin2 >> 8;
                if (sin > 0xEF) {
                    tmp13 = 0xF0;
                    break;
                }

                if (sin < 0) {
                    tmp13 = 0;
                    break;
                }
            }
        }

        tmp15 = idx;

        sin2 = tmp8[1] << 8;

        if (a < 0x200) {
            for (; tmp8[2] < 0x9E; tmp8[2]++) {
                sin2 += cos2;
                sin = sin2 >> 8;
                if (sin > 0xEF) {
                    tmp14 = 0xF0;
                    break;
                }

                if (sin < 0) {
                    tmp14 = 0;
                    break;
                }
            }
        } else {
            for (; tmp8[2] != 0; tmp8[2]--) {
                sin2 -= cos2;
                temp2 = sin2 >> 8;
                sin = sin2 >> 8;
                if (sin > 0xEF) {
                    tmp14 = 0xF0;
                    break;
                }

                if (sin < 0) {
                    tmp14 = 0;
                    break;
                }
            }
        }

        if (tmp14 == tmp13 || tmp8[2] == tmp15) {
            sub_802E49C(&tmp8[1], 6);
        } else {
            sub_802E49C(&tmp8[1], 7);
        }
    }
}
