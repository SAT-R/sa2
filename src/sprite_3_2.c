#include "global.h"
#include "core.h"

OamData *sub_80058B4(u8 p0)
{
    OamData *result;

    if (p0 > 31) {
        p0 = 31;
    }

    if ((s8)gUnknown_030018F0 < 0) {
        result = (OamData *)iwram_end;
    } else {
        if (gUnknown_03001850[p0] == 0xFF) {
            gUnknown_030022D0[gUnknown_030018F0].split.fractional = 0xFF;
            gUnknown_03001850[p0] = gUnknown_030018F0;
            gUnknown_03004D60[p0] = gUnknown_030018F0;
        } else {
            gUnknown_030022D0[gUnknown_030018F0].split.fractional = 0xFF;
            gUnknown_030022D0[gUnknown_03004D60[p0]].split.fractional
                = gUnknown_030018F0;
            gUnknown_03004D60[p0] = gUnknown_030018F0;
        }

        gUnknown_030018F0++;
        result = &gUnknown_030022D0[gUnknown_030018F0 - 1];
    }

    return result;
}
#if 01
#endif
