#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

void StageBgUpdate_Zone1ActBoss(UNUSED s32 x, UNUSED s32 y)
{
    Camera *cam = &gCamera;
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    gBgScrollRegs[0][0] = ((gStageTime + 4) >> 3) & 0xFF;
    gBgScrollRegs[0][1] = cam->y >> 9;
    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_801E434;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}
