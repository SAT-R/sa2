#include "global.h"
#include "core.h"
#include "game/game.h"

#include "game/stage/background/zone_7.h"

void StageBgUpdate_Zone7ActBoss(UNUSED s32 x, UNUSED s32 y)
{
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    Zone7BgUpdate_Inside(gUnknown_03005590, 945);
}