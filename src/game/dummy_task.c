#include "core.h"
#include "task.h"

#include "game/dummy_task.h"
#include "game/shared/stage/stage.h"

Task *gDummyTask = NULL;

static void Task_DummyFunc(void);
static void DummyTaskOnDestroy(Task *);

UNUSED void CreateDummyTask(void) { gDummyTask = TaskCreate(Task_DummyFunc, 0, 0x100, 0, DummyTaskOnDestroy); }

UNUSED static void DestroyDummyTask(void)
{
    TaskDestroy(gDummyTask);
    gDummyTask = NULL;
}

static void Task_DummyFunc(void) { }

UNUSED static void DummyTaskOnDestroy(Task *task) { gDummyTask = NULL; }
