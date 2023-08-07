#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"

#include "game/stage/background/callbacks.h"

void StageBgUpdateZone1ActBoss(void)
{
    struct Camera *cam = &gCamera;
    if (!PLAYER_IS_ALIVE) {
        gUnknown_03005590--;
    }

    gBgScrollRegs[0][0] = ((gUnknown_03005590 + 4) >> 3) & 0xFF;
    gBgScrollRegs[0][1] = cam->y >> 9;
    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_801E434;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}