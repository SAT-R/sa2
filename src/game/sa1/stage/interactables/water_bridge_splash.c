#include "global.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"

#include "constants/sa1/animations.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ s32 worldX;
    /* 0x08 */ s32 worldY;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 meX;
} WaterBridgeSplash;

void Task_WaterBridgeSplash(void);
void TaskDestructor_WaterBridgeSplash(Task *);

void CreateEntity_WaterBridgeSplash(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_WaterBridgeSplash, sizeof(WaterBridgeSplash), 0x2000, 0, TaskDestructor_WaterBridgeSplash);
    WaterBridgeSplash *splash = TASK_DATA(t);
    Sprite *s;
    s32 worldX, worldY;

    splash->me = me;

    splash->meX = me->x;
    splash->unk3C = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);

    splash->worldX = worldX;
    splash->worldY = worldY;

    s = &splash->s;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WATER_BRIDGE_SPLASH);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_WATER_BRIDGE_SPLASH;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}

void Task_WaterBridgeSplash(void)
{
    WaterBridgeSplash *splash = TASK_DATA(gCurTask);
    Sprite *s = &splash->s;

    if (IS_OUT_OF_DISPLAY_RANGE(splash->worldX, splash->worldY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(splash->me, splash->meX);
        TaskDestroy(gCurTask);
        return;
    }

    s->x = splash->worldX - gCamera.x;
    s->y = splash->worldY - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_WaterBridgeSplash(Task *t)
{
    WaterBridgeSplash *splash = TASK_DATA(t);
    Sprite *s = &splash->s;
    VramFree(s->graphics.dest);
}