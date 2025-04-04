#include "global.h"
#include "core.h"
#include "flags.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/stage/background/callbacks.h"
#include "game/stage/background/zone_1.h"

void StageBgUpdate_Zone1ActBoss(UNUSED s32 x, UNUSED s32 y)
{
    struct Camera *cam = &gCamera;
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    gBgScrollRegs[0][0] = ((gStageTime + 4) >> 3) & 0xFF;
    gBgScrollRegs[0][1] = cam->y >> 9;
    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_801E434;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}