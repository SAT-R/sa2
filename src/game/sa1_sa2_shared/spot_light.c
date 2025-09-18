#include "global.h"
#include "core.h"
#include "task.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/spot_light.h"
#include "game/sa1_sa2_shared/spot_light_beam_task.h"
#include "game/sa1_sa2_shared/player.h"

/* Spot Lights that appear in the background of Ice Paradise
   (seem to be the same as in Sonic Advance's Secret Base Zone) */

typedef struct {
    struct Task *t0;
    struct Task *t1;
    s16 unk8;
    s32 unkC;
} StageSpotLight;

void Task_SpotLightMain(void);
void Task_800A8E0(void);
void TaskDestructor_SpotLightMain(struct Task *);

bool32 CreateSpotLightBeams(void)
{
    struct Task *t = TaskCreate(Task_SpotLightMain, sizeof(StageSpotLight), 0x2000, 0, TaskDestructor_SpotLightMain);
    StageSpotLight *spotLight = TASK_DATA(t);
    SpotlightBeamTask *beam;

    spotLight->unk8 = 0x600;
    spotLight->unkC = 0;

    spotLight->t0 = CreateSpotlightBeamTask();

    beam = TASK_DATA(spotLight->t0);
    beam->unk6 = 60;
    beam->unk8 = 200;
    beam->unk0 = 0;
    beam->unk2 = 32;
    beam->unk4 = 0x400;
    beam->bg = 2;
    beam->unkB = 0;

    spotLight->t1 = CreateSpotlightBeamTask();

    beam = TASK_DATA(spotLight->t1);
    beam->unk6 = 200;
    beam->unk8 = 240;
    beam->unk0 = 0;
    beam->unk2 = 16;
    beam->unk4 = 0x300;
    beam->bg = 3;
    beam->unkB = 0;

    return TRUE;
}

void Task_SpotLightMain(void)
{
    StageSpotLight *spotLight = TASK_DATA(gCurTask);
    SpotlightBeamTask *beam;
    s32 unkC;

    if (!(gStageFlags & STAGE_FLAG__100)) {
        beam = TASK_DATA(spotLight->t0);

        if (((gStageTime & 0x7) == 0) && (beam->unkB != 0) && (gDispCnt & DISPCNT_BG0_ON)) {

            if (beam->unkB < 32)
                beam->unkB++;

            beam = TASK_DATA(spotLight->t1);

            if (beam->unkB < 16)
                beam->unkB++;
        } else if (!(gDispCnt & DISPCNT_BG0_ON)) {
            if (beam->unkB == 0) {
                beam->unkB = 4;

                beam = TASK_DATA(spotLight->t1);
                beam->unkB = 4;
            } else {
                // _0800A7F4
                gDispCnt |= DISPCNT_BG0_ON;
            }
        }
        // _0800A800
        unkC = spotLight->unkC - Q(2.0);
        spotLight->unkC = unkC - SIN_24_8(gStageTime & (ONE_CYCLE - 512));

        gBgScrollRegs[0][0] = I(spotLight->unkC) & 0xFF;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;

        gDispCnt |= (DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);

        gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);

        gWinRegs[WINREG_WINOUT] = (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ) & ~WINOUT_WIN01_BG0;

        spotLight->unk8 -= 0x40;
        if (spotLight->unk8 < 0x600) {
            spotLight->unk8 = 0x600;
        }

        gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
        gBldRegs.bldY = spotLight->unk8 >> 8;

        if (gPlayer.moveState & (MOVESTATE_DEAD | MOVESTATE_GOAL_REACHED)) {
            gCurTask->main = Task_800A8E0;
        } else if (gDestroySpotlights != 0) {
            TaskDestroy(spotLight->t0);
            TaskDestroy(spotLight->t1);
            TaskDestroy(gCurTask);
        }
    }
}

void Task_800A8E0(void)
{
    bool32 boolR5 = FALSE;
    StageSpotLight *spotLight = TASK_DATA(gCurTask);
    SpotlightBeamTask *beam;
    s32 unkC;

    beam = TASK_DATA(spotLight->t0);
    if (!(gStageTime & 0x1) && (beam->unkB != 0)) {
        beam->unkB -= 2;
        if (beam->unkB < 5)
            boolR5 = TRUE;
    }

    beam = TASK_DATA(spotLight->t1);
    if (!(gStageTime & 0x1) && (beam->unkB != 0)) {
        beam->unkB -= 1;
        if (beam->unkB < 3)
            boolR5 = TRUE;
    }

    unkC = spotLight->unkC - Q(2.0);
    spotLight->unkC = unkC - SIN_24_8(gStageTime & (ONE_CYCLE - 512));

    gBgScrollRegs[0][0] = I(spotLight->unkC) & 0xFF;
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;

    if (boolR5) {
        gDispCnt &= ~DISPCNT_BG0_ON;

        TaskDestroy(spotLight->t0);
        TaskDestroy(spotLight->t1);
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_SpotLightMain(struct Task *t)
{
    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    gDispCnt &= ~DISPCNT_BG0_ON;

    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    gWinRegs[WINREG_WIN0H] = 0;
    gWinRegs[WINREG_WIN0V] = 0;
    gWinRegs[WINREG_WIN1H] = 0;
    gWinRegs[WINREG_WIN1V] = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
}