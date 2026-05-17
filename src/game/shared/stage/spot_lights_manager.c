#include "global.h"
#include "core.h"
#include "task.h"
#include "trig.h"

#include "game/globals.h"
#include "game/shared/stage/spot_lights_manager.h"
#include "game/shared/stage/spot_light_beam_task.h"
#include "game/shared/stage/player.h"

#if (GAME == GAME_SA1)
#include "game/sa1/parameters/stage.h"
#endif

/* Spot Lights that appear in the background of Ice Paradise
   (seem to be the same as in Sonic Advance's Secret Base Zone) */

typedef struct {
    Task *spotlightTaskA;
    Task *spotlightTaskB;
    s16 qBlend;
#if (GAME == GAME_SA2)
    s32 unkC;
#endif
} SpotlightsManager;

void Task_SpotlightsManagerMain(void);
#if (GAME == GAME_SA1)
void Task_801796C(void);
#elif (GAME == GAME_SA2)
void Task_800A8E0(void);
#endif
void TaskDestructor_SpotlightsManager(Task *);

#if (GAME == GAME_SA1)
#define Q_MIN_BLEND Q(8.0)
#elif (GAME == GAME_SA2)
#define Q_MIN_BLEND Q(6.0)
#endif

bool32 CreateSpotlightsManager(void)
{
#if (GAME == GAME_SA1)
    if (PORTABLE || gPlayer.checkPointX > SPOTLIGHT_DESPAWN_X0) {
        return FALSE;
    } else
#endif
    {
        Task *t = TaskCreate(Task_SpotlightsManagerMain, sizeof(SpotlightsManager), 0x2000, 0, TaskDestructor_SpotlightsManager);
        SpotlightsManager *manager = TASK_DATA(t);
        SpotlightBeam *beam;
#if (GAME == GAME_SA1)
        manager->qBlend = Q_MIN_BLEND * 2;
#elif (GAME == GAME_SA2)
        manager->qBlend = Q_MIN_BLEND;
        manager->unkC = 0;
#endif

        manager->spotlightTaskA = CreateSpotlightBeamTask();
        beam = TASK_DATA(manager->spotlightTaskA);
        beam->unk6 = 60;
        beam->unk8 = 200;
        beam->unk0 = 0;
#if (GAME == GAME_SA1)
        beam->unk2 = 0x40;
        beam->unk4 = 0x800;
#elif (GAME == GAME_SA2)
        beam->unk2 = 32;
        beam->unk4 = 0x400;
#endif
        beam->bg = 2;
#if (GAME == GAME_SA1)
        beam->unkB = 0x20;
#elif (GAME == GAME_SA2)
        beam->unkB = 0;
#endif

        manager->spotlightTaskB = CreateSpotlightBeamTask();
        beam = TASK_DATA(manager->spotlightTaskB);
        beam->unk6 = 200;
        beam->unk8 = 240;
        beam->unk0 = 0;
#if (GAME == GAME_SA1)
        beam->unk2 = 8;
        beam->unk4 = 0x400;
#elif (GAME == GAME_SA2)
        beam->unk2 = 16;
        beam->unk4 = 0x300;
#endif
        beam->bg = 3;
#if (GAME == GAME_SA1)
        beam->unkB = 0x10;
#elif (GAME == GAME_SA2)
        beam->unkB = 0;
#endif

#if (GAME == GAME_SA1)
        gBldRegs.bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT2_ALL | (BLDCNT_TGT1_ALL & ~BLDCNT_TGT1_BD));
        gBldRegs.bldY = I(manager->qBlend);
#endif
    }
    return TRUE;
}

void Task_SpotlightsManagerMain(void)
{
    SpotlightsManager *manager = TASK_DATA(gCurTask);

#if (GAME == GAME_SA2)
    s32 unkC;
    SpotlightBeam *beam;
    if ((gStageFlags & STAGE_FLAG__100)) {
        return;
    }
    beam = TASK_DATA(manager->spotlightTaskA);

    if (((gStageTime & 0x7) == 0) && (beam->unkB != 0) && (gDispCnt & DISPCNT_BG0_ON)) {

        if (beam->unkB < 32)
            beam->unkB++;

        beam = TASK_DATA(manager->spotlightTaskB);

        if (beam->unkB < 16)
            beam->unkB++;
    } else if (!(gDispCnt & DISPCNT_BG0_ON)) {
        if (beam->unkB == 0) {
            beam->unkB = 4;

            beam = TASK_DATA(manager->spotlightTaskB);
            beam->unkB = 4;
        } else {
            // _0800A7F4
            gDispCnt |= DISPCNT_BG0_ON;
        }
    }
    // _0800A800
    unkC = manager->unkC - Q(2.0);
    manager->unkC = unkC - SIN_24_8(gStageTime & (ONE_CYCLE - 512));

    gBgScrollRegs[0][0] = I(manager->unkC) & 0xFF;
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;
#endif

    gDispCnt |= (DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);

#if (GAME == GAME_SA1)
    gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL & ~WININ_WIN0_CLR) | (WININ_WIN1_ALL & ~WININ_WIN1_CLR);
    gWinRegs[WINREG_WINOUT] = (WININ_WIN0_ALL);
#elif (GAME == GAME_SA2)
    gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);
    gWinRegs[WINREG_WINOUT] = (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ) & ~WINOUT_WIN01_BG0;
#endif

    manager->qBlend -= Q(0.25);

    if (manager->qBlend < Q_MIN_BLEND) {
        manager->qBlend = Q_MIN_BLEND;
    }

#if (GAME == GAME_SA2)
    gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
#endif
    gBldRegs.bldY = I(manager->qBlend);

#if (GAME == GAME_SA1)
    if (I(gPlayer.qWorldX) > SPOTLIGHT_DESPAWN_X0) {
        gCurTask->main = Task_801796C;
        return;
    }
#elif (GAME == GAME_SA2)
    if (gPlayer.moveState & (MOVESTATE_DEAD | MOVESTATE_GOAL_REACHED)) {
        gCurTask->main = Task_800A8E0;
        return;
    }
#endif

    if (((gPlayer.moveState & MOVESTATE_DEAD) && (GAME == GAME_SA1)) || gDestroySpotlights) {
        TaskDestroy(manager->spotlightTaskA);
        TaskDestroy(manager->spotlightTaskB);
        TaskDestroy(gCurTask);
        return;
    }
}

#if (GAME == GAME_SA1)
void Task_801796C(void)
{
    SpotlightsManager *manager = TASK_DATA(gCurTask);

    manager->qBlend -= Q(0.25);

    if (manager->qBlend < Q(0)) {
        TaskDestroy(manager->spotlightTaskA);
        TaskDestroy(manager->spotlightTaskB);
        TaskDestroy(gCurTask);
        return;
    }

    if ((I(gPlayer.qWorldX) > SPOTLIGHT_DESPAWN_X1) || !PLAYER_IS_ALIVE || gDestroySpotlights) {
        TaskDestroy(manager->spotlightTaskA);
        TaskDestroy(manager->spotlightTaskB);
        TaskDestroy(gCurTask);
        return;
    }

    gBldRegs.bldY = I(manager->qBlend);
}
#elif (GAME == GAME_SA2)
void Task_800A8E0(void)
{
    bool32 boolR5 = FALSE;
    SpotlightsManager *manager = TASK_DATA(gCurTask);
    SpotlightBeam *beam;
    s32 unkC;

    beam = TASK_DATA(manager->spotlightTaskA);
    if (!(gStageTime & 0x1) && (beam->unkB != 0)) {
        beam->unkB -= 2;
        if (beam->unkB < 5)
            boolR5 = TRUE;
    }

    beam = TASK_DATA(manager->spotlightTaskB);
    if (!(gStageTime & 0x1) && (beam->unkB != 0)) {
        beam->unkB -= 1;
        if (beam->unkB < 3)
            boolR5 = TRUE;
    }

    unkC = manager->unkC - Q(2.0);
    manager->unkC = unkC - SIN_24_8(gStageTime & (ONE_CYCLE - 512));

    gBgScrollRegs[0][0] = I(manager->unkC) & 0xFF;
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;

    if (boolR5) {
        gDispCnt &= ~DISPCNT_BG0_ON;

        TaskDestroy(manager->spotlightTaskA);
        TaskDestroy(manager->spotlightTaskB);
        TaskDestroy(gCurTask);
    }
}
#endif

void TaskDestructor_SpotlightsManager(Task *t)
{
    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
#if (GAME == GAME_SA2)
    gDispCnt &= ~DISPCNT_BG0_ON;
#endif

    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, 0);

    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
}
