#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "malloc_vram.h"
#include "game/sa1/stage/nuts_and_bolts_task.h"

Task *CreateNutsAndBoltsTask(u16 taskFlags, void *vramTiles, u16 anim, u8 variant, TaskDestructor dtor)
{
    Task *t = TaskCreate(Task_NutsAndBolts, sizeof(NutsAndBolts), taskFlags, 0, dtor);
    NutsAndBolts *nuts = TASK_DATA(t);

    nuts->qUnk30 = 0;
    nuts->qUnk34 = 0;
    nuts->qUnk38 = 0;
    nuts->qUnk3A = 0;
    nuts->qUnk3A = 0;
    nuts->qUnk3C = 0;
    nuts->qUnk3E = 0;
    nuts->qUnk40 = 0;

    nuts->s.x = 0;
    nuts->s.y = 0;
    nuts->s.graphics.dest = vramTiles;
    nuts->s.oamFlags = 0;
    nuts->s.graphics.size = 0;
    nuts->s.graphics.anim = anim;
    nuts->s.variant = variant;
    nuts->s.animCursor = 0;
    nuts->s.qAnimDelay = Q(0);
    nuts->s.prevVariant = -1;
    nuts->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    nuts->s.palId = 0;
    nuts->s.hitboxes[0].index = HITBOX_STATE_INACTIVE;
    nuts->s.frameFlags = SPRITE_FLAG(PRIORITY, 0);

    return t;
}

void Task_NutsAndBolts(void)
{
    Task **taskPtr = &gCurTask; // TODO: Remove this by properly matching the range check-if below...
    NutsAndBolts *nuts = TASK_DATA(*taskPtr);
    Sprite *s = &nuts->s;

    nuts->qUnk38 += nuts->qUnk3C;
    nuts->qUnk3A += nuts->qUnk3E;
    nuts->qUnk30 += nuts->qUnk38;
    nuts->qUnk34 += nuts->qUnk3A;

    s->x = I(nuts->qUnk30) - gCamera.x;
    s->y = I(nuts->qUnk34) - gCamera.y;

    if (nuts->qUnk40 != Q(0)) {
        nuts->qUnk40--;
    }

    // TODO: IS_OUT_OF_CAM_RANGE()
    if (((s->x < -(32)) || (s->x > DISPLAY_WIDTH + (32)) || ((s->y) - (32) > DISPLAY_HEIGHT))
        || ((UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) && (nuts->qUnk40 == Q(0)))) {
        TaskDestroy(*taskPtr);
        return;
    }

    DisplaySprite(s);
}

void TaskDestructor_NutsAndBolts(Task *t)
{
    NutsAndBolts *nuts = TASK_DATA(t);
    VramFree(nuts->s.graphics.dest);
}