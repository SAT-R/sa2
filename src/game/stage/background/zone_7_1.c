#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage/background/zone_7.h"

#if 0
void Zone7BgUpdate_Inside(s32 x, s32 y)
{
}
#endif

// https://decomp.me/scratch/7KDXI
// 98.95% - only register alloc issues, logic works as intended
NONMATCH("asm/non_matching/Zone7BgUpdate_Outside.inc",
         void Zone7BgUpdate_Outside(s32 x, s32 y))
{
    u16 *bgBuffer;
    u8 frameCount;
    int_vcount i;
    u16 sp[32];

    gDispCnt &= ~DISPCNT_BG3_ON;
    gDispCnt |= DISPCNT_BG0_ON;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&REG_BG0HOFS;
    gUnknown_03002A80 = 2;
    bgBuffer = (u16 *)gComputedBgBuffer;

    frameCount = ((gStageTime >> 3) & 0x1F);
    if (frameCount >= 16) {
        frameCount = 31 - frameCount;
        asm("" ::"r"(frameCount));
    }

    for (i = 0; i < ARRAY_COUNT(sp); i++) {
        sp[i] = 0xFF
            & (Q_24_8_TO_INT(gUnknown_080D5C62[(i & 0x7)][0] * gStageTime)
               + gUnknown_080D5C62[(i & 0x7)][1]);
    }

    {
        u16 sinVal, value;
        u32 cosVal;
        u32 scrollSpeed = (Q_24_8(80.5) - 1);

        for (i = 0; i < DISPLAY_HEIGHT / 2; i++) {
            sinVal = SIN_24_8(((gStageTime * 4) + i * 2) & ONE_CYCLE) >> 3;
            cosVal = (COS_24_8(((i * scrollSpeed) >> 5) & ONE_CYCLE) >> 4);
            value = cosVal + sinVal;
            *bgBuffer++ = (value + sp[(i & 0x1F)]) & 0xFF;
        }

        for (; i < DISPLAY_HEIGHT - 1; i++) {
            sinVal = SIN_24_8(((gStageTime << 2) + i * 2) & ONE_CYCLE) >> 3;
            cosVal = (COS_24_8((((DISPLAY_HEIGHT - i) * scrollSpeed) >> 5) & ONE_CYCLE)
                      >> 4);
            value = cosVal + sinVal;
            *bgBuffer++ = (value + sp[(i & 0x1F)]) & 0xFF;
        }
    }
}
END_NONMATCH
