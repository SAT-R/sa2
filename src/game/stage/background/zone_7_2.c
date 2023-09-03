#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/stage/background/zone_7.h"

#include "constants/zones.h"

#define NUM_ZONE7_BG_TRANSITION_POSITIONS 8
const u16 sZone7BgTransitionRegions[2][NUM_ZONE7_BG_TRANSITION_POSITIONS] = {
    { 697, 1849, 8857, 11832, 18553, 22009, 25369, 27673 },
    { 1344, 2616, 9432, 15192, 18552, 19892, 23158, 25848 },
};

#if 01
void StageBgUpdateZone7Acts12(s32 x, s32 y)
{
    // NOTE: GCC-Hack
    // u32 act = (gCurrentLevel - LEVEL_INDEX(ZONE_7, ACT_1)) % 2
    u32 act = !!(gCurrentLevel ^ (LEVEL_INDEX(ZONE_7, ACT_1)));
    register u32 bgId asm("r4") = 0;
    u8 regionId = 0;

    if (x >= sZone7BgTransitionRegions[act][regionId]) {
        register u32 r5 asm("r5") = 1;

        do {
            if (++regionId >= NUM_ZONE7_BG_TRANSITION_POSITIONS)
                goto _0801E2B2;
        } while (x >= sZone7BgTransitionRegions[act][regionId]);

        bgId = r5;
        bgId &= regionId;
    }
_0801E2B2:

    if (bgId == 0) {
        sub_801D9D4(x, y);
    } else {
        sub_801DD7C(x, y);
    }

    gPlayer.unkA8 = bgId;
}
#endif