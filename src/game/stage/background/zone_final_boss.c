#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/stage/player.h"
#include "game/stage/background/callbacks.h"

void StageBgUpdate_ZoneFinalActXX(void)
{
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_BgUpdateZoneFinalActXX;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}
