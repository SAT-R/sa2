#ifndef GUARD_TASK_H
#define GUARD_TASK_H

#include "global.h"

struct Task;

typedef void (*TaskMain)(void);
typedef void (*TaskDestructor)(struct Task *);

// The task system uses the GBA's unique memory layout to halve the size of pointers.
// Other platforms need to have the same logical behavior, but done differently.
#if PLATFORM_GBA
typedef u16 TaskPtr;

// Mainly used to silence (void* -> u16) warnings
typedef u32 TaskPtr32;

#define TASK_PTR(taskRef)   (IWRAM_START + (taskRef))
#define TASK_IS_NULL(taskp) ((taskp) == (void *)IWRAM_START)

typedef u16 IwramData;
#define CLEAR_TASK_MEMORY_ON_DESTROY FALSE
#else
typedef struct Task *TaskPtr;
typedef TaskPtr TaskPtr32;

#define TASK_PTR(taskRef)  (taskRef)
#define TASK_IS_NULL(task) ((task) == NULL)

typedef void *IwramData;

#if !DEBUG && !TAS_TESTING
#define ENABLE_TASK_LOGGING !TRUE
#else
#define ENABLE_TASK_LOGGING TRUE
#endif // !DEBUG

#define CLEAR_TASK_MEMORY_ON_DESTROY TRUE
#endif // PLATFORM_GBA

#define TASK_IS_NOT_NULL(taskp) !TASK_IS_NULL(taskp)

#define MAX_TASK_NUM 128

#define TASK_INACTIVE         0x0001
#define TASK_DESTROY_DISABLED 0x0002
#define TASK_x0004            0x0004
#define TASK_USE_EWRAM        0x0010

struct Task {
    /* 0x00 */ TaskPtr parent;
    /* 0x02 */ TaskPtr prev;
    /* 0x04 */ TaskPtr next;
    /* 0x06 */ IwramData data;
#if PORTABLE
    u32 dataSize;
#endif
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
#if ENABLE_TASK_LOGGING
    const char *name;
#endif
};

#if PLATFORM_GBA
typedef u16 IwramNodePtr;
typedef u32 IwramNodePtr32;
#else
struct IwramNode;

typedef struct IwramNode *IwramNodePtr;
typedef IwramNodePtr IwramNodePtr32;
#endif

#define IWRAM_PTR(ptr) TASK_PTR(ptr)

struct IwramNode {
    IwramNodePtr next;
    s16 state;

    u8 ALIGNED(sizeof(void *)) space[0];
};

#define TASK_DATA(taskp)   (void *)TASK_PTR((taskp)->data)
#define TASK_PARENT(taskp) (struct Task *)TASK_PTR((taskp)->parent)
#define TASK_NEXT(taskp)   (struct Task *)TASK_PTR((taskp)->next)
#define TasksDestroyAll()  TasksDestroyInPriorityRange(0, 0xFFFF)

extern struct Task gTasks[MAX_TASK_NUM];
extern struct Task gEmptyTask;
extern struct Task *gTaskPtrs[MAX_TASK_NUM];
extern s32 gNumTasks;
extern struct Task *gNextTask;
extern struct Task *gCurTask;
extern u8 gIwramHeap[0x2204];

u32 TasksInit(void);
void TasksExec(void);

#if ENABLE_TASK_LOGGING
#include <stdio.h>

struct Task *TaskCreate(TaskMain taskMain, u16 structSize, u16 priority, u16 flags, TaskDestructor taskDestructor, const char *name);

// The printout is split so we can still read the input, even if TaskCreate crashes.
#define TaskCreate(taskMain, structSize, priority, flags, taskDestructor)                                                                  \
    ({                                                                                                                                     \
        printf("New '%s' (0x%X, %p) ", #taskMain, (u32)structSize, taskMain);                                                              \
        struct Task *tt = TaskCreate(taskMain, structSize, priority, flags, taskDestructor, #taskMain);                                    \
        printf("at %p\n", tt);                                                                                                             \
        tt;                                                                                                                                \
    })
#else
struct Task *TaskCreate(TaskMain taskMain, u16 structSize, u16 priority, u16 flags, TaskDestructor taskDestructor);
#endif

void TaskDestroy(struct Task *);
void *IwramMalloc(u16);
void TasksDestroyInPriorityRange(u16, u16);

#endif
