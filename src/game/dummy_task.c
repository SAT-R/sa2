#include "core.h"
#include "task.h"

#include "game/dummy_task.h"
#include "game/stage/stage.h"

struct Task *gDummyTask = NULL;

static void Task_DummyFunc(void);
static void DummyTaskOnDestroy(struct Task *);

UNUSED void CreateDummyTask(void) { gDummyTask = TaskCreate(Task_DummyFunc, 0, 0x100, 0, DummyTaskOnDestroy); }

UNUSED static void DestroyDummyTask(void)
{
    TaskDestroy(gDummyTask);
    gDummyTask = NULL;
}

static void Task_DummyFunc(void) { }

UNUSED static void DummyTaskOnDestroy(struct Task *task) { gDummyTask = NULL; }
