#include "global.h"
#include "task.h"

#include "game/stage/spot_light.h"
#include "game/stage/unknown_task.h"

/* Spot Lights that appear in the background of Ice Paradise
   (seem to be the same as in Sonic Advance's Secret Base Zone) */

typedef struct {
    struct Task *t0;
    struct Task *t1;
    u16 unk8;
    s32 unkC;
} Struct_StageSpotLight;

void Task_SpotLightMain(void);
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