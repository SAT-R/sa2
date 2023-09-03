#include "global.h"
#include "core.h"
#include "game/game.h"

#include "game/stage/background/zone_2.h"

void StageBgUpdate_Zone2ActBoss(UNUSED s32 a, UNUSED s32 b)
{
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    StageBgUpdate_Zone2Acts12(gUnknown_03005590, 4000);
}