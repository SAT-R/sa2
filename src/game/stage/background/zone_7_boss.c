#include "global.h"
#include "core.h"
#include "game/game.h"

#include "game/stage/background/zone_7.h"

void StageBgUpdateZone7ActBoss(void)
{
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    sub_801D9D4(gUnknown_03005590, 945);
}