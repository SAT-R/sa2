#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x3C */ u8 unk40;
} ConveyorBeltObject; /* 0x44 */

void Task_ConveyorBeltObject(void);
void TaskDestructor_ConveyorBeltObject(Task *t);

void CreateEntity_ConveyorBeltObject(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_ConveyorBeltObject, sizeof(ConveyorBeltObject), 0x2000, 0, TaskDestructor_ConveyorBeltObject);
    ConveyorBeltObject *belt = TASK_DATA(t);
    Sprite *s = &belt->s;

    belt->base.regionX = regionX;
    belt->base.regionY = regionY;
    belt->base.me = me;
    belt->base.meX = me->x;
    belt->base.id = id;
    belt->unk3C = 0;
    belt->unk40 = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    if ((gCurrentLevel & 0x1) != ACT_1) {
        if (me->d.sData[0] == 0) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_6_WIDE);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_6_WIDE;
            s->variant = 0;
        } else if (me->d.sData[0] == 1) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_6_WIDE);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_6_WIDE;
            s->variant = 1;
        } else if (me->d.sData[0] == 2) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_6_SLIM);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_6_SLIM;
            s->variant = 0;
        } else if (me->d.sData[0] == 3) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_6_SLIM);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_6_SLIM;
            s->variant = 1;
        }
    } else {
        if (me->d.sData[0] == 0) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_2_WIDE);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_2_WIDE;
            s->variant = 0;
        } else if (me->d.sData[0] == 1) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_2_WIDE);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_2_WIDE;
            s->variant = 1;
        } else if (me->d.sData[0] == 2) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_2_SLIM);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_2_SLIM;
            s->variant = 0;
        } else if (me->d.sData[0] == 3) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONVEYOR_BELT_2_SLIM);
            s->graphics.anim = SA1_ANIM_CONVEYOR_BELT_2_SLIM;
            s->variant = 1;
        }
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

void Task_ConveyorBeltObject(void)
{
    ConveyorBeltObject *belt = TASK_DATA(gCurTask);
    Sprite *s = &belt->s;
    MapEntity *me = belt->base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(belt->base.meX, belt->base.regionX);
    worldY = TO_WORLD_POS(me->y, belt->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    Coll_Player_Platform(s, worldX, worldY, &gPlayer);

    if (gNumSingleplayerCharacters == 2) {
        Coll_Player_Platform(s, worldX, worldY, &gPartner);
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, belt->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void TaskDestructor_ConveyorBeltObject(Task *t)
{
    ConveyorBeltObject *belt = TASK_DATA(t);
    VramFree(belt->s.graphics.dest);
}