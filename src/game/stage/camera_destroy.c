#include "global.h"
#include "core.h"
#include "flags.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/zones.h"

void Task_CallUpdateCameraInternal(void);

#ifndef COLLECT_RINGS_ROM
void DestroyCameraMovementTask(void)
{
    TaskDestroy(gCamera.movementTask);
    gCamera.movementTask = NULL;
}

void TaskDestructor_Camera(struct Task *unused)
{
    s32 i;
    gCamera.movementTask = NULL;

    for (i = 0; i < NUM_BACKGROUNDS; i++) {
        gBgScrollRegs[i][0] = 0;
        gBgScrollRegs[i][1] = 0;
    }

    if (IS_EXTRA_STAGE(gCurrentLevel) && (gFlags & FLAGS_EXECUTE_HBLANK_COPY0)) {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY0;
    }

    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
}

void Task_CallUpdateCamera(void)
{
    gDispCnt |= (DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON);

#if (GAME == GAME_SA2)
    if (IS_EXTRA_STAGE(gCurrentLevel)) {
        gDispCnt &= ~DISPCNT_BG3_ON;
    }
#endif

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gDispCnt &= ~DISPCNT_WIN0_ON;
    }

    gCurTask->main = Task_CallUpdateCameraInternal;
}

void Task_CallUpdateCameraInternal(void)
{
    UpdateCamera();
    gUnknown_030054B8 = 4;
}
#endif
