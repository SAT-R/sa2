#include "global.h"
#include "core.h"
#include "task.h"
#include "trig.h"

#include "game/game.h"
#include "game/stage/spot_light.h"
#include "game/stage/unknown_task.h"

/* Spot Lights that appear in the background of Ice Paradise
   (seem to be the same as in Sonic Advance's Secret Base Zone) */

typedef struct {
    struct Task *t0;
    struct Task *t1;
    s16 unk8;
    s32 unkC;
} Struct_StageSpotLight;

void Task_SpotLightMain(void);
void Task_800A8E0(void);
void TaskDestructor_SpotLightMain(struct Task *);

bool32 CreateSpotLightBeams(void)
{
    struct Task *t = TaskCreate(Task_SpotLightMain, sizeof(Struct_StageSpotLight),
                                0x2000, 0, TaskDestructor_SpotLightMain);
    Struct_StageSpotLight *spotLight = TaskGetStructPtr(t);
    Struct_StageUnkTask *ut;

    spotLight->unk8 = 0x600;
    spotLight->unkC = 0;

    spotLight->t0 = CreateStageUnknownTask();

    ut = TaskGetStructPtr(spotLight->t0);
    ut->unk6 = 60;
    ut->unk8 = 200;
    ut->unk0 = 0;
    ut->unk2 = 32;
    ut->unk4 = 0x400;
    ut->unkA = 2;
    ut->unkB = 0;

    spotLight->t1 = CreateStageUnknownTask();

    ut = TaskGetStructPtr(spotLight->t1);
    ut->unk6 = 200;
    ut->unk8 = 240;
    ut->unk0 = 0;
    ut->unk2 = 16;
    ut->unk4 = 0x300;
    ut->unkA = 3;
    ut->unkB = 0;

    return TRUE;
}

void Task_SpotLightMain(void)
{
    Struct_StageSpotLight *spotLight = TaskGetStructPtr(gCurTask);
    Struct_StageUnkTask *ut;
    s32 unkC;

    if (!(gUnknown_03005424 & EXTRA_STATE__100)) {
        ut = TaskGetStructPtr(spotLight->t0);

        if (((gUnknown_03005590 & 0x7) == 0) && (ut->unkB != 0)
            && (gDispCnt & DISPCNT_BG0_ON)) {

            if (ut->unkB < 32)
                ut->unkB++;

            ut = TaskGetStructPtr(spotLight->t1);

            if (ut->unkB < 16)
                ut->unkB++;
        } else if (!(gDispCnt & DISPCNT_BG0_ON)) {
            if (ut->unkB == 0) {
                ut->unkB = 4;

                ut = TaskGetStructPtr(spotLight->t1);
                ut->unkB = 4;
            } else {
                // _0800A7F4
                gDispCnt |= DISPCNT_BG0_ON;
            }
        }
        // _0800A800
        unkC = spotLight->unkC - Q_24_8(2.0);
        spotLight->unkC = unkC - SIN_24_8(gUnknown_03005590 & (ONE_CYCLE - 512));

        gBgScrollRegs[0][0] = Q_24_8_TO_INT(spotLight->unkC) & 0xFF;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;

        gDispCnt |= (DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);

        gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);

        gWinRegs[WINREG_WINOUT]
            = (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ) & ~WINOUT_WIN01_BG0;

        spotLight->unk8 -= 0x40;
        if (spotLight->unk8 < 0x600) {
            spotLight->unk8 = 0x600;
        }

        gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
        gBldRegs.bldY = spotLight->unk8 >> 8;

        if (gPlayer.moveState & (MOVESTATE_DEAD | MOVESTATE_8000000)) {
            gCurTask->main = Task_800A8E0;
        } else if (gUnknown_030054E4 != 0) {
            TaskDestroy(spotLight->t0);
            TaskDestroy(spotLight->t1);
            TaskDestroy(gCurTask);
        }
    }
}

void Task_800A8E0(void)
{
    bool32 boolR5 = FALSE;
    Struct_StageSpotLight *spotLight = TaskGetStructPtr(gCurTask);
    Struct_StageUnkTask *ut;
    s32 unkC;

    ut = TaskGetStructPtr(spotLight->t0);
    if (!(gUnknown_03005590 & 0x1) && (ut->unkB != 0)) {
        ut->unkB -= 2;
        if (ut->unkB < 5)
            boolR5 = TRUE;
    }

    ut = TaskGetStructPtr(spotLight->t1);
    if (!(gUnknown_03005590 & 0x1) && (ut->unkB != 0)) {
        ut->unkB -= 1;
        if (ut->unkB < 3)
            boolR5 = TRUE;
    }

    unkC = spotLight->unkC - Q_24_8(2.0);
    spotLight->unkC = unkC - SIN_24_8(gUnknown_03005590 & (ONE_CYCLE - 512));

    gBgScrollRegs[0][0] = Q_24_8_TO_INT(spotLight->unkC) & 0xFF;
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

    gFlags &= ~0x4;
}