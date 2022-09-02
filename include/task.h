#ifndef GUARD_TASK_H
#define GUARD_TASK_H

#include "global.h"

struct Task;

typedef void (*TaskMain)(void);
typedef void (*TaskDestructor)(struct Task*);

#define MAX_TASK_NUM                128

#define TASK_INACTIVE               0x0001
#define TASK_DESTROY_DISABLED       0x0002
#define TASK_x0004                  0x0004
#define TASK_USE_EWRAM              0x0010

struct Task {
    /* 0x00 */ u16 parent;
    /* 0x02 */ u16 prev; // prev? 
    /* 0x04 */ u16 next;
    /* 0x06 */ u16 structOffset;
    /* 0x08 */ TaskMain main;
    /* 0x0C */ TaskDestructor dtor;
    /* 0x10 */ u16 priority; // priority? 
    /* 0x12 */ u16 flags; // 0x1  = active
                          // 0x2  = ???
                          // 0x10 = use ewram for struct
    /* 0x14 */ u8 unk14;
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u16 unk16;
    /* 0x18 */ u16 unk18;
};

struct IwramNode {
    u16 next;
    s16 state;
    u8 space[0];
};

#define TaskGetStructPtr(taskp) (void*)(IWRAM_START + (taskp)->structOffset)
#define TasksDestroyAll() TasksDestroyInPriorityRange(0, 0xFFFF)

extern struct Task gTasks[MAX_TASK_NUM];
extern struct Task gEmptyTask;
extern struct Task* gTaskPtrs[MAX_TASK_NUM];
extern s32 gNumTasks;
extern struct Task* gNextTask;
extern struct Task* gCurTask;
extern u8 gIwramHeap[0x2204];

u32 TasksInit(void);
void TasksExec(void);
struct Task* TaskCreate(TaskMain, u16, u16, u16, TaskDestructor);
void TaskDestroy(struct Task*);
void* IwramMalloc(u16);
void TasksDestroyInPriorityRange(u16, u16);

#endif
