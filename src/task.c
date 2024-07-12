#if PORTABLE
// TEMP
#include <assert.h>
#include <stdlib.h>
#endif
#include "global.h"
#include "core.h"
#include "task.h"
#include "flags.h"
#include "lib/m4a.h"

static void TaskMainDummy1(void);
static void TaskMainDummy2(void);
static void TaskMainDummy3(void);
static void IwramFree(void *);
static struct Task *TaskGetNextSlot(void);

u32 TasksInit(void)
{
    struct Task *cur;
    struct IwramNode *heapRoot;
    s32 i;
    gCurTask = NULL;
    gNextTask = NULL;
    gNumTasks = 0;

#ifndef BUG_FIX
    // 0x4 * MAX_TASK_NUM = 0x200, but that would assume gTasks is an array of pointers
    DmaFill32(3, 0, gTasks, 0x200);
#else
    DmaFill32(3, 0, gTasks, sizeof(gTasks));
#endif

    for (i = 0; i < MAX_TASK_NUM; ++i)
        gTaskPtrs[i] = &gTasks[i];

    cur = TaskGetNextSlot();
    if (!cur) {
        return 0;
    }

    cur->main = TaskMainDummy1;
    cur->priority = 0;
    cur->flags = 0;
    cur->parent = (TaskPtr32)NULL;
    cur->prev = (TaskPtr32)NULL;
    cur->next = (TaskPtr32)TaskGetNextSlot();
#if ENABLE_TASK_LOGGING
    cur->name = "TaskMainDummy1";
#endif

    if (TASK_IS_NULL((void *)TASK_PTR(cur->next))) {
        return 0;
    }

    ((struct Task *)TASK_PTR(cur->next))->prev = (TaskPtr32)cur;
    cur = (struct Task *)TASK_PTR(cur->next);
    cur->main = TaskMainDummy2;
    cur->priority = 0xffff;
    cur->flags = 0;
    cur->parent = 0;
    cur->next = 0;
#if ENABLE_TASK_LOGGING
    cur->name = "TaskMainDummy2";
#endif
    gEmptyTask.parent = 0;
    gEmptyTask.prev = 0;
    gEmptyTask.next = 0;
    gEmptyTask.data = (IwramData)(uintptr_t)iwram_end;
#if ENABLE_TASK_LOGGING
    gEmptyTask.name = NULL;
#endif
    // initialize IWRAM heap -- a huge node
    heapRoot = (struct IwramNode *)&gIwramHeap[0];
    heapRoot->next = 0;
    heapRoot->state = sizeof(gIwramHeap);
    return 1;
}

#ifdef TaskCreate
#undef TaskCreate
#endif

#if ENABLE_TASK_LOGGING
struct Task *TaskCreate(TaskMain taskMain, u16 structSize, u16 priority, u16 flags, TaskDestructor taskDestructor, const char *name)
#else
struct Task *TaskCreate(TaskMain taskMain, u16 structSize, u16 priority, u16 flags, TaskDestructor taskDestructor)
#endif
{
    struct Task *slow;
    struct Task *task;
    TaskPtr fast;

#ifndef NON_MATCHING
    do
        ;
    while (0);
#endif

    task = NULL;
    slow = NULL;

    if (gNumTasks < MAX_TASK_NUM) {
        struct Task *nextSlot = gTaskPtrs[gNumTasks++];
        task = nextSlot;
    }

    if (task == NULL) {
        return &gEmptyTask;
    }

    task->main = taskMain;
    task->dtor = taskDestructor;
    task->priority = priority;
    task->flags = flags;
    task->unk15 = 0;
    task->unk16 = 0;
    task->unk18 = 0;
    task->data = (IwramData)(uintptr_t)IwramMalloc(structSize);
    task->parent = (TaskPtr32)gCurTask;
#if ENABLE_TASK_LOGGING
    task->name = name;
#endif

    // insert the task
    slow = gTaskPtrs[0];
    fast = slow->next;
    while (TASK_IS_NOT_NULL((void *)TASK_PTR(fast))) {
        if (((struct Task *)TASK_PTR(fast))->priority > priority) {
            ((struct Task *)TASK_PTR(fast))->prev = (TaskPtr32)task;
            task->next = slow->next;
            task->prev = (TaskPtr32)slow;
            slow->next = (TaskPtr32)task;
            break;
        }
        slow = (struct Task *)TASK_PTR(fast);
        fast = ((struct Task *)TASK_PTR(fast))->next;
    }
    return task;
}

void TaskDestroy(struct Task *task)
{
    TaskPtr32 next, prev;
    if (!(task->flags & TASK_DESTROY_DISABLED)) {
#if ENABLE_TASK_LOGGING
        printf("Destroying '%s'\n", task->name);
#endif
        prev = TASK_PTR(task->prev);
        next = TASK_PTR(task->next);

        if (TASK_IS_NOT_NULL((struct Task *)prev)) {
            if (TASK_IS_NOT_NULL((struct Task *)next)) {
                if (task->dtor != NULL) {
                    task->dtor(task);
                }

                if (task == gNextTask) {
                    gNextTask = TASK_NEXT(task);
                }

                prev = TASK_PTR(task->prev);
                next = TASK_PTR(task->next);
                ((struct Task *)prev)->next = next;
                ((struct Task *)next)->prev = prev;

                if (task->data != (IwramData)NULL) {
                    IwramFree(TASK_DATA(task));
                }

                gTaskPtrs[--gNumTasks] = task;
                task->parent = (TaskPtr)NULL;
                task->prev = (TaskPtr)NULL;
                task->main = TaskMainDummy3;
                task->priority = 0;
                task->flags = 0;
                task->data = (IwramData)NULL;

                task->unk15 = 0;
                task->unk16 = 0;
                task->unk18 = 0;
            }
        }
    }
}

void TasksExec(void)
{
    gCurTask = gTaskPtrs[0];
    if (!(gFlags & FLAGS_800) && TASK_IS_NOT_NULL(gTaskPtrs[0])) {
        while (TASK_IS_NOT_NULL(gCurTask)) {
            gNextTask = (struct Task *)TASK_PTR(gCurTask->next);

            if (!(gCurTask->flags & 1)) {
                gCurTask->main();
            }

            gCurTask = gNextTask;
            if (gExecSoundMain) {
                m4aSoundMain();
                gExecSoundMain = FALSE;
            }
        }
    } else if (TASK_IS_NOT_NULL(gTaskPtrs[0])) {
        while (TASK_IS_NOT_NULL(gCurTask)) {
            gNextTask = (struct Task *)TASK_PTR(gCurTask->next);

            if ((gCurTask->flags & TASK_x0004) && !(gCurTask->flags & TASK_INACTIVE)) {
                gCurTask->main();
            }

            gCurTask = gNextTask;
            if (gExecSoundMain) {
                m4aSoundMain();
                gExecSoundMain = FALSE;
            }
        }
    }
    gCurTask = NULL;
    gNextTask = NULL;
}

// TEMP: IwramMalloc/Free crash currently.
//       (Might be because of missing DMAs?)
void *IwramMalloc(u16 req)
{
#if PORTABLE
    if (req == 0) {
        return NULL;
    }

    void *result = calloc(req, 1);
    assert(result != NULL);
    return result;
#else
    struct IwramNode *cur, *next;
    u16 size = req;

    // Align size to be a multiple of 0x4.
    size = (size + 3) >> 2;

    if (size == 0) {
        return 0;
    }

    size = (size << 2) + offsetof(struct IwramNode, space);
    cur = (struct IwramNode *)&gIwramHeap[0];

    while (1) {
        s16 sizeSigned = size;
        if (sizeSigned <= cur->state) {
            if (sizeSigned != cur->state) {
                s16 offset = size + offsetof(struct IwramNode, space);
                if (offset > cur->state) {
                    if (TASK_IS_NULL((void *)IWRAM_PTR(cur->next))) {
                        return NULL;
                    }
                    cur = (struct IwramNode *)IWRAM_PTR(cur->next);
                    continue;
                }
                // shrink the original node
                next = (struct IwramNode *)((u8 *)cur + size);
                next->next = cur->next;
                next->state = cur->state - size;
                cur->next = (IwramNodePtr32)next;
            }
            cur->state = -size;

            // Return the space now allocated to the node
            return cur->space;
        }
        if (TASK_IS_NULL((struct Task *)TASK_PTR(cur->next))) {
            return NULL;
        }
        cur = (struct IwramNode *)TASK_PTR(cur->next);
    };
#endif
}

static void IwramFree(void *p)
{
#if PORTABLE
    if (p) {
#if ENABLE_TASK_LOGGING
        printf("IwramFree: %p\n", p);
#endif
        free(p);
    }
#else
    struct IwramNode *node = p, *fast;
#ifndef NON_MATCHING
    register struct IwramNode *slow asm("r1");
#else
    struct IwramNode *slow;
#endif
    node = (struct IwramNode *)(((u8 *)node) - offsetof(struct IwramNode, space));
    slow = (struct IwramNode *)&gIwramHeap[0];
    fast = slow;
    if (node != slow) {
        do {
            slow = fast;
            fast = (struct IwramNode *)IWRAM_PTR(slow->next);
        } while (node != fast);
    }
    if (node->state < 0) {
        node->state = -node->state;
    }
    if ((struct IwramNode *)(slow->state + (u8 *)slow) == node) {
        u16 state = slow->state; // only for handling side effect of inline asm above

        if (slow->state > 0) {
            slow->next = fast->next;
            slow->state = state + node->state;
            node = slow;
        }
    }
    fast = (struct IwramNode *)((u8 *)node + node->state);
    if (fast == (struct IwramNode *)IWRAM_PTR(node->next)) {
        if (fast->state > 0) {
            node->state += fast->state;
            node->next = fast->next;
        }
    }
#endif
}

/* The function is probably for cleaning up the IWRAM nodes, but it's not working. */
static void UNUSED sub_80028DC(void)
{
    struct IwramNode *cur = (struct IwramNode *)&gIwramHeap[0];
    s32 curStateBackup;
    s32 i;
    IwramNodePtr nextNodeOffset;
    void *nextNodeSpace;
    void *space;

    while (TASK_IS_NOT_NULL((struct Task *)IWRAM_PTR(cur->next))) {
        if (cur->state >= 0) {
            cur->next += 0; // load again pls
            nextNodeOffset = cur->next;
            if (((struct IwramNode *)IWRAM_PTR(cur->next))->state >= 0) {
                cur->state += ((struct IwramNode *)IWRAM_PTR(cur->next))->state;
                cur->next = ((struct IwramNode *)IWRAM_PTR(cur->next))->next;
            } else {
                nextNodeSpace = (void *)(cur->next + IWRAM_PTR(offsetof(struct IwramNode, space)));

                space = cur->space;
                curStateBackup = cur->state;
                cur->state = ((struct IwramNode *)IWRAM_PTR(cur->next))->state;

#ifndef NON_MATCHING
                ++nextNodeOffset, --nextNodeOffset; // why do you insist on loading here?
#endif

                cur->next = ((struct IwramNode *)IWRAM_PTR(nextNodeOffset))->next;
                for (i = 0; i < MAX_TASK_NUM; i++) {
                    if (gTasks[i].data == (IwramData)(IwramNodePtr32)nextNodeSpace) {
                        gTasks[i].data = (IwramData)(uintptr_t)space;
                        break;
                    }
                }

                DmaCopy32(3, nextNodeSpace, space, cur->state + sizeof(struct IwramNode));
                {
                    struct IwramNode *newLoc = (struct IwramNode *)((u8 *)cur + cur->state);
                    newLoc->next = cur->next;
                    newLoc->state = curStateBackup;
                    cur = newLoc;
                    cur->next = (IwramNodePtr32)cur; // will cause inf loop
                }
            }
        } else {
            cur = (struct IwramNode *)IWRAM_PTR(cur->next);
        }
    }
}

static struct Task *TaskGetNextSlot(void)
{
    if (gNumTasks >= MAX_TASK_NUM) {
        return NULL;
    } else {
        return gTaskPtrs[gNumTasks++];
    }
}

void TasksDestroyInPriorityRange(u16 lbound, u16 rbound)
{
    struct Task *cur = gTaskPtrs[0];
    TaskPtr curOffset = (TaskPtr)(TaskPtr32)cur;

    while (curOffset != 0) {
        u32 priority = cur->priority;
        if (priority >= lbound) {
            while (priority < rbound) {
                struct Task *prev = cur;
                cur = (struct Task *)TASK_PTR(prev->next);

                if (prev != gTaskPtrs[0] && prev != gTaskPtrs[1]) {
                    TaskDestroy(prev);
                }

                if (TASK_IS_NULL(cur)) {
                    break;
                } else if (1) {
                    priority = cur->priority;
                } else {
                    break;
                }
            }

            break;
        }
        curOffset = cur->next;
        cur = (struct Task *)TASK_PTR(curOffset);
    }
}

static void TaskMainDummy1(void) { }

static void TaskMainDummy2(void) { }

static void TaskMainDummy3(void) { }
