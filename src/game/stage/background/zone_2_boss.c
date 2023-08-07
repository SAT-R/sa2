#include "global.h"
#include "core.h"
#include "game/game.h"

extern void StageBgUpdateZone2Acts12(s32, s32);

void StageBgUpdateZone2ActBoss(void)
{
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    StageBgUpdateZone2Acts12(gUnknown_03005590, 4000);
}