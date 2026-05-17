#ifndef GUARD_SA1_NUTS_AND_BOLTS_TASK_H
#define GUARD_SA1_NUTS_AND_BOLTS_TASK_H

#include "core.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 qUnk30;
    /* 0x34 */ s32 qUnk34;
    /* 0x38 */ s16 qUnk38;
    /* 0x3A */ s16 qUnk3A;
    /* 0x3C */ u16 qUnk3C;
    /* 0x3E */ s16 qUnk3E;
    /* 0x40 */ u16 qUnk40; // TODO: qUnk40 not a Q()?
} NutsAndBolts;

extern Task *CreateNutsAndBoltsTask(u16 taskFlags, void *vramTiles, u16 anim, u8 variant, TaskDestructor dtor);
extern void Task_NutsAndBolts(void);
extern void TaskDestructor_NutsAndBolts(Task *t);

extern const u16 gUnknown_080BB41C[8];
extern const u8 gUnknown_080BB42C[8];
extern const u8 gUnknown_080BB434[8];

#endif // GUARD_SA1_NUTS_AND_BOLTS_TASK_H
