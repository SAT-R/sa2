#include "global.h"
#include "core.h"
#include "flags.h"

#if 0
void Zone7BgUpdate_Inside(s32 x, s32 y)
{
}
#endif

#if 0
void Zone7BgUpdate_Outside(s32 x, s32 y)
{
    gDispCnt &= ~DISPCNT_BG3_ON;
    gDispCnt |= DISPCNT_BG0_ON;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void*)&REG_BG0HOFS;
    gUnknown_03002A80 = 2;
    gComputedBgBuffer;
}
#endif
