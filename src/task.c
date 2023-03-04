#include "global.h"
#include "task.h"
#include "core.h"
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

    // 0x4 * MAX_TASK_NUM = 0x200, but that woud assume gTasks is an array of pointers
    DmaFill32(3, 0, gTasks, 0x200);

    for (i = 0; i < MAX_TASK_NUM; ++i)
        gTaskPtrs[i] = &gTasks[i];

    cur = TaskGetNextSlot();
    if (!cur) {
        return 0;
    }

    cur->main = TaskMainDummy1;
    cur->priority = 0;
    cur->flags = 0;
    cur->parent = 0;
    cur->prev = 0;
    cur->next = (uintptr_t)TaskGetNextSlot();

    if ((cur->next + IWRAM_START) == IWRAM_START) {
        return 0;
    }

    ((struct Task *)(cur->next + IWRAM_START))->prev = (u32)cur;
    cur = (struct Task *)(cur->next + IWRAM_START);
    cur->main = TaskMainDummy2;
    cur->priority = 0xffff;
    cur->flags = 0;
    cur->parent = 0;
    cur->next = 0;
    gEmptyTask.parent = 0;
    gEmptyTask.prev = 0;
    gEmptyTask.next = 0;
    gEmptyTask.structOffset = (uintptr_t)iwram_end;
    // initialize IWRAM heap -- a huge node
    heapRoot = (struct IwramNode *)&gIwramHeap[0];
    heapRoot->next = 0;
    heapRoot->state = sizeof(gIwramHeap);
    return 1;
}

struct Task *TaskCreate(TaskMain taskMain, u16 structSize, u16 priority, u16 flags,
                        TaskDestructor taskDestructor)
{
    struct Task *slow;
    struct Task *task;
    u16 fast;
    struct EwramNode *temp;

    // ???
    do
        ;
    while (0);

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
    task->structOffset = (uintptr_t)IwramMalloc(structSize);
    task->parent = (uintptr_t)gCurTask;

    // insert the task
    slow = gTaskPtrs[0];
    fast = slow->next;
    while ((fast + IWRAM_START) != IWRAM_START) {
        if (((struct Task *)(fast + IWRAM_START))->priority > priority) {
            ((struct Task *)(fast + IWRAM_START))->prev = (uintptr_t)task;
            task->next = slow->next;
            task->prev = (uintptr_t)slow;
            slow->next = (uintptr_t)task;
            break;
        }
        slow = (struct Task *)(fast + IWRAM_START);
        fast = ((struct Task *)(fast + IWRAM_START))->next;
    }
    return task;
}

void TaskDestroy(struct Task *task)
{
    u32 next, prev;
    if (!(task->flags & TASK_DESTROY_DISABLED)) {
        prev = task->prev + IWRAM_START;
        next = task->next + IWRAM_START;
        if (prev != IWRAM_START) {
            if (next != IWRAM_START) {
                if (task->dtor != NULL) {
                    task->dtor(task);
                }

                if (task == gNextTask) {
                    gNextTask = (struct Task *)(task->next + IWRAM_START);
                }

                prev = task->prev + IWRAM_START;
                next = task->next + IWRAM_START;
                ((struct Task *)prev)->next = next;
                ((struct Task *)next)->prev = prev;

                if (task->structOffset != 0) {
                    IwramFree(task->structOffset + (void *)IWRAM_START);
                }

                gTaskPtrs[--gNumTasks] = task;
                task->parent = 0;
                task->prev = 0;
                task->main = TaskMainDummy3;
                task->priority = 0;
                task->flags = 0;
                task->structOffset = 0;

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
    if (!(gFlags & 0x800) && (gTaskPtrs[0] != (struct Task *)IWRAM_START)) {
        while (gCurTask != (struct Task *)IWRAM_START) {
            gNextTask = (struct Task *)(IWRAM_START + gCurTask->next);

            if (!(gCurTask->flags & 1)) {
                gCurTask->main();
            }

            gCurTask = gNextTask;
            if (gExecSoundMain) {
                m4aSoundMain();
                gExecSoundMain = FALSE;
            }
        }
    } else if (gTaskPtrs[0] != (struct Task *)IWRAM_START) {
        while (gCurTask != (struct Task *)IWRAM_START) {
            gNextTask = (struct Task *)(IWRAM_START + gCurTask->next);

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

void *IwramMalloc(u16 req)
{
    struct IwramNode *cur, *next;
    u16 size = req;
    size = (size + 3) >> 2;
    if (size == 0) {
        return 0;
    }
    size = (size << 2) + sizeof(struct IwramNode);
    cur = (struct IwramNode *)&gIwramHeap[0];
    while (1) {
        s16 sizeSigned = size;
        if (sizeSigned <= cur->state) {
            if (sizeSigned != cur->state) {
                s16 offset = size + sizeof(struct IwramNode);
                if (offset > cur->state) {
                    if ((cur->next + IWRAM_START) == IWRAM_START) {
                        return NULL;
                    }
                    cur = (struct IwramNode *)(cur->next + IWRAM_START);
                    continue;
                }
                // shrink the original node
                next = (struct IwramNode *)((void *)cur + size);
                next->next = cur->next;
                next->state = cur->state - size;
                cur->next = (uintptr_t)next;
            }
            cur->state = -size;

            // Return the space now allocated to the node
            return cur->space;
        }
        if ((cur->next + IWRAM_START) == IWRAM_START) {
            return NULL;
        }
        cur = (struct IwramNode *)(cur->next + IWRAM_START);
    };
}

static void IwramFree(void *p)
{
    struct IwramNode *node = p, *fast;
#ifndef NON_MATCHING
    register struct IwramNode *slow asm("r1");
#else
    struct IwramNode *r1;
#endif
    node--;
    slow = (struct IwramNode *)&gIwramHeap[0];
    fast = slow;

    if (node != slow) {
        do {
            slow = fast;
            fast = (struct IwramNode *)(IWRAM_START + slow->next);
        } while (node != fast);
    }
    if (node->state < 0) {
        node->state = -node->state;
    }
    if ((struct IwramNode *)(slow->state + (void *)slow) == node) {
        u16 state = slow->state; // not actual code. only for handling side effect of
                                 // inline asm
        if (slow->state > 0) {
            slow->next = fast->next;
            slow->state = state + node->state;
            node = slow;
        }
    }
    fast = (struct IwramNode *)((void *)node + node->state);
    if (fast == (struct IwramNode *)(IWRAM_START + node->next)) {
        if (fast->state > 0) {
            node->state += fast->state;
            node->next = fast->next;
        }
    }
}

/* The function is probably for cleaning up the IWRAM nodes, but it's not working. */
UNUSED static void sub_80028DC(void)
{
    struct IwramNode *cur = (struct IwramNode *)&gIwramHeap[0];
    s32 curStateBackup;
    s32 i;
    u16 nextNodeOffset;
    void *nextNodeSpace;
    void *space;

    while ((cur->next + IWRAM_START) != IWRAM_START) {
        if (cur->state >= 0) {
            cur->next += 0; // load again pls
            nextNodeOffset = cur->next;
            if (((struct IwramNode *)(cur->next + IWRAM_START))->state >= 0) {
                cur->state += ((struct IwramNode *)(cur->next + IWRAM_START))->state;
                cur->next = ((struct IwramNode *)(cur->next + IWRAM_START))->next;
            } else {
                nextNodeSpace = cur->next
                    + (void *)(IWRAM_START + offsetof(struct IwramNode, space));
                space = cur->space;
                curStateBackup = cur->state;
                cur->state = ((struct IwramNode *)(cur->next + IWRAM_START))->state;

#ifndef NON_MATCHING
                ++nextNodeOffset, --nextNodeOffset; // why do you insist on loading here?
#endif

                cur->next = ((struct IwramNode *)(nextNodeOffset + IWRAM_START))->next;
                for (i = 0; i < MAX_TASK_NUM; i++) {
                    if (gTasks[i].structOffset == (u16)(uintptr_t)nextNodeSpace) {
                        gTasks[i].structOffset = (u32)space;
                        break;
                    }
                }

                DmaCopy32(3, nextNodeSpace, space,
                          cur->state + sizeof(struct IwramNode));
                {
                    struct IwramNode *newLoc = (void *)cur + cur->state;
                    newLoc->next = cur->next;
                    newLoc->state = curStateBackup;
                    cur = newLoc;
                    cur->next = (u32)cur; // will cause inf loop
                }
            }
        } else {
            cur = (struct IwramNode *)(cur->next + IWRAM_START);
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
    u32 curOffset = (u16)(uintptr_t)cur;

    while (curOffset != 0) {
        u32 priority = cur->priority;
        if (priority >= lbound) {
            while (priority < rbound) {
                struct Task *prev = cur;
                cur = (struct Task *)(prev->next + IWRAM_START);

                if (prev != gTaskPtrs[0] && prev != gTaskPtrs[1]) {
                    TaskDestroy(prev);
                }

                if (cur == (struct Task *)IWRAM_START) {
                    break;
                } else if (1) {
                    priority = cur->priority;
                } else {
                    break;
                }
            }
            return;
        }
        curOffset = cur->next;
        cur = (struct Task *)(curOffset + IWRAM_START);
    }
}

static void TaskMainDummy1(void) { }

static void TaskMainDummy2(void) { }

static void TaskMainDummy3(void) { }
