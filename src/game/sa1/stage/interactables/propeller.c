#include "global.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Propeller;

void Task_PropellerMain(void);
void TaskDestructor_Propeller(Task *);

#if 01
void CreateEntity_Propeller(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_PropellerMain, sizeof(Propeller), 0x2000, 0, TaskDestructor_Propeller);
    Propeller *propeller = TASK_DATA(t);
    Sprite *s = &propeller->s;

    propeller->base.regionX = regionX;
    propeller->base.regionY = regionY;
    propeller->base.me = me;

    propeller->base.meX = me->x;
    propeller->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PROPELLER);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_PROPELLER;
    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(18, 1);
    s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
}
#endif

void Task_PropellerMain(void)
{
    Propeller *propeller = TASK_DATA(gCurTask);
    Sprite *s = &propeller->s;
    MapEntity *me = propeller->base.me;

    s16 screenX, screenY;
    screenX = TO_WORLD_POS(propeller->base.meX, propeller->base.regionX);
    screenY = TO_WORLD_POS(me->y, propeller->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, propeller->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_Propeller(Task *t)
{
    Propeller *propeller = TASK_DATA(t);
    VramFree(propeller->s.graphics.dest);
}