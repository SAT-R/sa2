#include "global.h"
#include "task.h"
#include "game/entity.h"

#include "game/stage/palette_loader.h"

static void Task_StagePaletteLoader(void);

/*
 * Some sort of palette loader function. Uses the Sprite object
 * but only ever called with animations which load a palette
 */

struct Task *CreatePaletteLoaderTask(u16 priority, AnimId anim, u8 variant,
                                     TaskDestructor dtor)
{
    struct Task *t
        = TaskCreate(Task_StagePaletteLoader, sizeof(Sprite), priority, 0, dtor);

    Sprite *s = TaskGetStructPtr(t);

    s->x = 0;
    s->y = 0;
    s->graphics.dest = NULL;
    s->unk1A = 0;
    s->graphics.size = 0;
    s->graphics.anim = anim;
    s->variant = variant;
    s->animCursor = 0;
    s->unk1C = 0;
    s->prevVariant = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;

    return t;
}

static void Task_StagePaletteLoader(void)
{
    Sprite *s = TaskGetStructPtr(gCurTask);

    if (sub_80036E0(s) == 0) {
        TaskDestroy(gCurTask);
    }
}