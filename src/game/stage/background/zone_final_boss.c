#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"

#include "game/stage/background/callbacks.h"

void StageBgUpdateZoneFinalActXX(void)
{
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_BgUpdateZoneFinalActXX;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}