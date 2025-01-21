#include "global.h"
#include "core.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/background/zone_7.h"

#include "constants/zones.h"

#define NUM_ZONE7_BG_TRANSITION_POSITIONS 8

const u16 sZone7BgTransitionRegions[2][NUM_ZONE7_BG_TRANSITION_POSITIONS] = {
    { 697, 1849, 8857, 11832, 18553, 22009, 25369, 27673 }, // ACT 1
    { 1344, 2616, 9432, 15192, 18552, 19892, 23158, 25848 }, // ACT 2
};

void StageBgUpdate_Zone7Acts12(s32 x, s32 y)
{
    u32 act = !!(gCurrentLevel ^ (LEVEL_INDEX(ZONE_7, ACT_1)));
    u32 bgId = 0;
    u8 regionId = 0;

    if (x >= sZone7BgTransitionRegions[act][regionId]) {
        while (TRUE) {
            if (++regionId >= NUM_ZONE7_BG_TRANSITION_POSITIONS) {
                break;
            }
            if (x < sZone7BgTransitionRegions[act][regionId]) {
                bgId = regionId % 2;
                break;
            }
        };
    };

    if (bgId == 0) {
        Zone7BgUpdate_Inside(x, y);
    } else {
        Zone7BgUpdate_Outside(x, y);
    }

    gPlayer.unk99[15] = bgId;
}
