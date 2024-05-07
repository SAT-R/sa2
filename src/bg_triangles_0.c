#include <string.h>

#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

#include "bg_triangles.h"

// Almost identical to sub_80064A8
// (99%) https://decomp.me/scratch/78CWY
NONMATCH("asm/non_matching/engine/sub_8006228.inc",
         void sub_8006228(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4, u8 param5))
{
    int_vcount *cursor;
    s16 r1, r2, r4, r5, r7, r8;

    gFlags |= FLAGS_4;

    if (bg >= 2) {
        gUnknown_03002A80 = 4;

        if (bg & 1) {
            cursor = &((u8 *)gBgOffsetsHBlank)[2];
            gUnknown_03002878 = (void *)&REG_WIN0H;
        } else {
            cursor = &((u8 *)gBgOffsetsHBlank)[0];
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    } else {
        gUnknown_03002A80 = 2;
        cursor = &((u8 *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gUnknown_03002878 = (void *)&REG_WIN1H;
        } else {
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    }

    r1 = (param3 - param1);
    r4 = (param4 - param2);
    r5 = (param4 - param2);

    r2 = r1;
    r8 = ABS(r2) * 2;

    // _080062EA
    r4 = ABS(r4);
    r7 = (r4 * 2);
    cursor += (gUnknown_03002A80 * param2);

    // _08006302

    if (ABS(r2) > ABS(r1)) {
        // _0800630A+8
        r4 = -r2;

        if (r2 > 0) {
            cursor[1] = param5;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1++;
                r4 += r7;

                if (r4 >= 0) {
                    r4 = ((r4 << 16) >> 16) - r8;
                    cursor[0] = param1;
                    cursor += gUnknown_03002A80;
                    cursor[1] = param5;
                }
            }
            cursor[0] = param1;
        } else {
            cursor[0] = param1;
            cursor++;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1--;
                r4 += r7;

                if (r4 >= 0) {
                    r4 -= r8;
                    *cursor = param5;
                    cursor = (cursor + gUnknown_03002A80) - 1;
                    *cursor = param1;
#ifndef NON_MATCHING
                    asm("" : "=r"(cursor));
#endif
                    cursor++;
                }
            }
            *cursor = param5;
        }

    } else {
        r4 = -r1;
        // _080063DC
        if (r2 > 0) {
            for (r2 = 0; r2 < ABS(r5); r2++) {
                // _080063F6
                *cursor = param1 + 1;
                cursor++;
                *cursor = param5;
                cursor = (cursor + gUnknown_03002A80) - 1;

                r4 += r8;

                if (r4 >= 0) {
                    param1++;
                    r4 -= r7;
                }
            }
        } else {
            // _08006450
            for (r2 = 0; r2 < ABS(r5); r2++) {
                *cursor = param1 + 1;
                cursor++;
                *cursor = param5;

                cursor = (cursor + gUnknown_03002A80) - 1;

                r4 += r8;

                if (r4 >= 0) {
                    param1--;
                    r4 -= r7;
                }
            }
        }
    }
}
END_NONMATCH

// Almost identical to sub_8006228
// (99.04%) https://decomp.me/scratch/oriiw
NONMATCH("asm/non_matching/engine/sub_80064A8.inc",
         void sub_80064A8(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4, u8 param5))
{
    int_vcount *cursor;
    s16 r1, r2, r4, r5, r7, r8;

    gFlags |= FLAGS_4;

    if (bg >= 2) {
        gUnknown_03002A80 = 4;

        if (bg & 1) {
            cursor = &((u8 *)gBgOffsetsHBlank)[2];
            gUnknown_03002878 = (void *)&REG_WIN0H;
        } else {
            cursor = &((u8 *)gBgOffsetsHBlank)[0];
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    } else {
        gUnknown_03002A80 = 2;
        cursor = &((u8 *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gUnknown_03002878 = (void *)&REG_WIN1H;
        } else {
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    }

    r1 = (param3 - param1);
    r4 = (param4 - param2);
    r5 = (param4 - param2);

    r2 = r1;
    r8 = ABS(r2) * 2;

    r4 = ABS(r4);
    r7 = (r4 * 2);
    cursor += (gUnknown_03002A80 * param2);

    if (ABS(r2) > ABS(r1)) {
        r4 = -r2;

        if (r2 > 0) {
            cursor[1] = param1;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1++;
                r4 += r7;

                if (r4 >= 0) {
                    r4 = ((r4 << 16) >> 16) - r8;
                    cursor[0] = param5;
                    cursor += gUnknown_03002A80;
                    cursor[1] = param1;
                }
            }
            cursor[0] = param5;
        } else {
            cursor[0] = param5;
            cursor++;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1--;
                r4 += r7;

                if (r4 >= 0) {
                    r4 -= r8;
                    *cursor = param1;
                    cursor = (cursor + gUnknown_03002A80) - 1;
                    *cursor = param5;
#ifndef NON_MATCHING
                    asm("" : "=r"(cursor));
#endif
                    cursor++;
                }
            }
            *cursor = param1;
        }

    } else {
        r4 = -r1;
        if (r2 > 0) {
            for (r2 = 0; r2 < ABS(r5); r2++) {
                *cursor = param5;
                cursor++;
                *cursor = param1;
                cursor = (cursor + gUnknown_03002A80) - 1;

                r4 += r8;

                if (r4 >= 0) {
                    param1++;
                    r4 -= r7;
                }
            }
        } else {
            for (r2 = 0; r2 < ABS(r5); r2++) {
                *cursor = param5;
                cursor++;
                *cursor = param1;

                cursor = (cursor + gUnknown_03002A80) - 1;

                r4 += r8;

                if (r4 >= 0) {
                    param1--;
                    r4 -= r7;
                }
            }
        }
    }
}
END_NONMATCH
