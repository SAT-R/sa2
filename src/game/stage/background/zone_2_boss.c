#include "global.h"
#include "core.h"
#include "game/game.h"

#include "game/stage/background/zone_2.h"

void StageBgUpdateZone2ActBoss(void)
{
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    StageBgUpdateZone2Acts12(gUnknown_03005590, 4000);
}