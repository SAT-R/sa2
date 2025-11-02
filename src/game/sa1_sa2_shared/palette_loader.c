#include "global.h"
#include "task.h"
#include "game/entity.h"

#include "game/sa1_sa2_shared/palette_loader.h"

static void Task_StagePaletteLoader(void);

/*
 * Some sort of palette loader function. Uses the Sprite object
 * but only ever called with animations which load a palette
 */

struct Task *CreatePaletteLoaderTask(u16 priority, AnimId anim, u8 variant, TaskDestructor dtor)
{
    struct Task *t = TaskCreate(Task_StagePaletteLoader, sizeof(Sprite), priority, 0, dtor);

    Sprite *s = TASK_DATA(t);

    s->x = 0;
    s->y = 0;
    s->graphics.dest = NULL;
    s->oamFlags = SPRITE_OAM_ORDER(0);
    s->graphics.size = 0;
    s->graphics.anim = anim;
    s->variant = variant;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;

    return t;
}

static void Task_StagePaletteLoader(void)
{
    Sprite *s = TASK_DATA(gCurTask);

    if (UpdateSpriteAnimation_BG(s) == 0) {
        TaskDestroy(gCurTask);
    }
}