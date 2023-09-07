#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/stage/background/zone_7.h"

#include "constants/zones.h"

#define NUM_ZONE7_BG_TRANSITION_POSITIONS 8
const u16 sZone7BgTransitionRegions[2][NUM_ZONE7_BG_TRANSITION_POSITIONS] = {
    { 697, 1849, 8857, 11832, 18553, 22009, 25369, 27673 }, // ACT 1
    { 1344, 2616, 9432, 15192, 18552, 19892, 23158, 25848 }, // ACT 2
};

// https://decomp.me/scratch/SuYje
NONMATCH("asm/non_matching/StageBgUpdate_Zone7Acts12.inc",
         void StageBgUpdate_Zone7Acts12(s32 x, s32 y))
{
    // NOTE: GCC-Hack
    // u32 act = (gCurrentLevel - LEVEL_INDEX(ZONE_7, ACT_1)) % 2
    u32 act = !!(gCurrentLevel ^ (LEVEL_INDEX(ZONE_7, ACT_1)));
    u32 bgId = 0;
    u8 regionId = 0;

    while (x >= sZone7BgTransitionRegions[act][regionId]) {
        u32 one = 1;
        if (++regionId >= NUM_ZONE7_BG_TRANSITION_POSITIONS)
            goto StageBgUpdate_Zone7Acts12_CallBgUpdate;
        else
            bgId = regionId & one;
    }

StageBgUpdate_Zone7Acts12_CallBgUpdate:

    if (bgId == 0) {
        Zone7BgUpdate_Inside(x, y);
    } else {
        Zone7BgUpdate_Outside(x, y);
    }

    gPlayer.unkA8 = bgId;
}
END_NONMATCH
