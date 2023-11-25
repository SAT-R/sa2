#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/zones.h"

static void Task_CallUpdateCamera(void);

void DestroyCameraMovementTask(void)
{
    TaskDestroy(gCamera.movementTask);
    gCamera.movementTask = NULL;
}

void TaskDestructor_801E040(struct Task *unused)
{
    s32 i;
    gCamera.movementTask = NULL;

    for (i = 0; i < 4; i++) {
        gBgScrollRegs[i][0] = 0;
        gBgScrollRegs[i][1] = 0;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)
        && (gFlags & FLAGS_40)) {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_40;
    }

    gFlags &= ~FLAGS_4;
}

void Task_801E0A8(void)
{
    gDispCnt |= 0x1E00;
    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gDispCnt &= ~DISPCNT_BG3_ON;
    }

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gDispCnt &= ~DISPCNT_WIN0_ON;
    }

    gCurTask->main = Task_CallUpdateCamera;
}

static void Task_CallUpdateCamera(void)
{
    UpdateCamera();
    gUnknown_030054B8 = 4;
}
