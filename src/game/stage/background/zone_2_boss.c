#include "global.h"
#include "core.h"
#include "game/sa1_leftovers/globals.h"
#include "game/stage/player.h"
#include "game/stage/background/zone_2.h"

void StageBgUpdate_Zone2ActBoss(UNUSED s32 a, UNUSED s32 b)
{
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    StageBgUpdate_Zone2Acts12(gStageTime, 4000);
}