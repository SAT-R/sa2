#ifndef GUARD_STAGE_UNK_TASK_H
#define GUARD_STAGE_UNK_TASK_H

// Declared in header because it's used outside the module
typedef struct {
    s16 unk0;
    u16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    u8 unkA;
    u8 unkB;
} StageUnkTask; /* size: 0xC */

struct Task *CreateStageUnknownTask(void);

#endif // GUARD_STAGE_UNK_TASK_H