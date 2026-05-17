#include "global.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"

#include "constants/sa1/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} IA097;

void Task_Interactable097(void);
void TaskDestructor_Interactable097(Task *);

#if 0
#endif

void CreateEntity_Interactable097(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Interactable097, sizeof(IA097), 0x2000, 0, TaskDestructor_Interactable097);
    IA097 *ia = TASK_DATA(t);
    Sprite *s = &ia->s;
    s32 worldX, worldY;

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    if (me->d.sData[0] == 0) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_DEBRIS_A);
        s->graphics.anim = SA1_ANIM_DEBRIS_A;
        s->variant = 0;
    } else if (me->d.sData[0] == 1) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_DEBRIS_C);
        s->graphics.anim = SA1_ANIM_DEBRIS_C;
        s->variant = 0;
        asm("");
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_DEBRIS_B);
        s->graphics.anim = SA1_ANIM_DEBRIS_B;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_Interactable097(void)
{
    IA097 *ia = TASK_DATA(gCurTask);
    Sprite *s = &ia->s;
    MapEntity *me = ia->base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(ia->base.meX, ia->base.regionX);
    worldY = TO_WORLD_POS(me->y, ia->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_Interactable097(Task *t)
{
    IA097 *ia = TASK_DATA(t);
    VramFree(ia->s.graphics.dest);
}