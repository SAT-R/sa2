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
