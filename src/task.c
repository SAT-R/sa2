#include "global.h"
#include "task.h"

void nullsub_8002A30(void);
void nullsub_8002A34(void);
void nullsub_145(void);
void IwramFree(struct Unk_03003A20* arg0);
struct Task* TaskGetNextSlot(void);

u32 TaskInit(void) {
    struct Task *r2, *r4;
    struct Task **i, **r1;
    gCurTask = NULL;
    gNextTask = NULL;
    gLastTaskNum = 0;
    DmaFill32(3, 0, gUnknown_030009F0, 0x200);
    r1 = gTaskList;
    r2 = gUnknown_030009F0 + 0x7f;
    i = r1 + 0x7f;

    do {
        *i = r2;
        r2--;
        i--;
    } while ((intptr_t)i >= (intptr_t)r1);

    r4 = TaskGetNextSlot();
    if (!r4) {
        return 0;
    }

    r4->main = nullsub_8002A30;
    r4->unk10 = 0;
    r4->flags = 0;
    r4->unk0 = 0;
    r4->unk2 = 0;
    r4->next = (uintptr_t)TaskGetNextSlot();

    if ((r4->next + IWRAM_START) == IWRAM_START) {
        return 0;
    }

    ((struct Task*)(r4->next + IWRAM_START))->unk2 = (u32)r4;
    r4 = (struct Task*)(r4->next + IWRAM_START);
    r4->main = nullsub_8002A34;
    r4->unk10 = 0xffff;
    r4->flags = 0;
    r4->unk0 = 0;
    r4->next = 0;
    gEmptyTask.unk0 = 0;
    gEmptyTask.unk2 = 0;
    gEmptyTask.next = 0;
    gEmptyTask.structOffset = (uintptr_t)gUnknown_03005BB4;
    gUnknown_03002B00[0].unk0 = 0;
    gUnknown_03002B00[0].unk2 = 0x2204;
    return 1;
}

struct Task* TaskCreate(TaskMain taskMain, u16 structSize, u16 arg2, u16 flags, TaskDestructor taskDestructor) {
    struct Task* slow;
    struct Task* r4;
    u16 fast;
    struct EwramNode* r1;

    // ???
    do ; while (0);
    
    r4 = NULL;
    slow = NULL;

    if (gLastTaskNum <= 0x7f) {
        struct Task* nextSlot = gTaskList[gLastTaskNum++];
        r4 = nextSlot;
    }

    if (r4 == NULL) {
        return &gEmptyTask;
    }

    r4->main = taskMain;
    r4->dtor = taskDestructor;
    r4->unk10 = arg2;
    r4->flags = flags;
    r4->unk15 = 0;
    r4->unk16 = 0;
    r4->unk18 = 0;
    r4->structOffset = ((uintptr_t)IwramMalloc(structSize));
    r4->unk0 = (uintptr_t)gCurTask;
    
    slow = gTaskList[0];
    fast = slow->next;
    while ((fast + IWRAM_START) != IWRAM_START) {
        if (((struct Task*)(fast + IWRAM_START))->unk10 > arg2) {
            ((struct Task*)(fast + IWRAM_START))->unk2 = (uintptr_t)r4;
            r4->next = slow->next;
            r4->unk2 = (uintptr_t)slow;
            slow->next = (uintptr_t)r4;
            break;
        }
        slow = (struct Task*)(fast + IWRAM_START);
        fast = ((struct Task*)(fast + IWRAM_START))->next;
    }
    return r4;
}
