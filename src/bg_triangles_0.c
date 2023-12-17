#include <string.h>

#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

/* TODO: Rename this module to something background-related */
#include "bg_triangles.h"

#if 01
// (81.09%) https://decomp.me/scratch/78CWY
void sub_8006228(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4, u8 param5)
{
    int_vcount *cursor;
    s16 r0, r1, r2, r3, r4, r7, r8, sb;
    s32 r5;
    // u16 sb = (param5 * param5);

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

    r2 = r1;
    r0 = r2;
    r8 = ABS(r2) * 2;
    sb = r4;

    // _080062EA
    r7 = ABS(r4) * 2;
    cursor += (param2 * gUnknown_03002A80);

    // _08006302
    r4 = ABS(r2);

    if (r4 > ABS(r1)) {
        // _0800630A+8
        r4 = -r2;

        if (r2 > 0) {
            cursor[1] = param5;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1++;
                r4 += r7;

                if (r4 >= 0) {
                    r4 = r4 - param3;
                    cursor[0] = param1;
                    cursor += gUnknown_03002A80;
                    cursor[1] = param5;
                }
            }
        } else {
            cursor[0] = param1;
            cursor++;

            for (r2 = 0; r2 < ABS(r1); cursor++, r2++) {
                param1--;
                r4 += r7;

                if (r4 >= 0) {
                    r4 -= param3;
                    cursor[0] = param1;
                    cursor += gUnknown_03002A80;
                    cursor[1] = param5;
                }
            }
            cursor[0] = param5;
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
            // _08006440
            s32 r8_;
            r2 = 0;
            r8_ = r8;
            ;

            // _08006450
            for (r2 = 0; r2 < ABS(sb); r2++) {
                *cursor = param1 + 1;
                cursor++;
                *cursor = param5;

                cursor = (cursor + gUnknown_03002A80) - 1;

                r4 += r8_;

                if (r4 >= 0) {
                    param1--;
                    r4 -= r5;
                }
            }
        }
    }
}
#endif
