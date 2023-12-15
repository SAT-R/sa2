#include <string.h>

#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

/* TODO: Rename this module to something background-related */
#include "bg_triangles.h"

#if 01
// (36.65%) https://decomp.me/scratch/cTe86
void sub_8006228(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4, u8 param5)
{
    int_vcount *cursor;
    s16 r1, r2, r4;
    u16 sb = (param5 * param5);

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
    if (r2 < 0) {
        r2 = -r1 * 2;
    }
    param3 = r2;

    if ((param2 - r1) > param5) {
        param2 = (param4 + param5);
    }

    for (; param1 < param2; param1++) {
        s16 num = param1 - param4;
        s16 sqrtRes;

        num = num * num;
        sqrtRes = Sqrt(sb - num);

        r1 = param3 + sqrtRes;
        if (r1 < 0) {
            *cursor = 0;
            cursor++;
        } else if (r1 > DISPLAY_WIDTH) {
            *cursor = DISPLAY_WIDTH;
            cursor++;
        } else {
            *cursor = r1;
            cursor++;
        }

        r1 = param3 - sqrtRes;
        if (r1 > DISPLAY_WIDTH) {
            *cursor = DISPLAY_WIDTH;
            cursor++;
        } else if (r1 < 0) {
            *cursor = 0;
            cursor++;
        } else {
            *cursor = r1;
            cursor++;
        }

        cursor += (gUnknown_03002A80 - 2);
    }
}
#endif
