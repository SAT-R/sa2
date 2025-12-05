#include "global.h"
#include "task.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/interactables/slidy_ice.h"

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} MapEntity_SlidyIce;

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_SlidyIce;

void Task_SlidyIce(void)
{
    Sprite_SlidyIce *ice = TASK_DATA(gCurTask);
    MapEntity_SlidyIce *me = (MapEntity_SlidyIce *)ice->base.me;
    u8 spriteX = ice->base.meX;

    s32 regionX, regionY;
    s32 screenX, screenY;
    regionX = ice->base.regionX;
    regionY = ice->base.regionY;
    screenX = TO_WORLD_POS(spriteX, regionX);
    screenY = TO_WORLD_POS(me->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s32 posX = (screenX + me->offsetX * TILE_WIDTH);

        if ((posX <= I(gPlayer.qWorldX)) && ((posX + me->width * TILE_WIDTH) >= I(gPlayer.qWorldX))) {
            s32 posY = screenY + me->offsetY * TILE_WIDTH;

            if ((posY <= I(gPlayer.qWorldY)) && ((posY + me->height * TILE_WIDTH) >= I(gPlayer.qWorldY))) {
                gPlayer.moveState |= MOVESTATE_ICE_SLIDE;
            }
        }
    }

    // _08011292
    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void CreateEntity_SlidyIce(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SlidyIce, sizeof(Sprite_SlidyIce), 0x2010, 0, NULL);

    Sprite_SlidyIce *ice = TASK_DATA(t);
    ice->base.regionX = spriteRegionX;
    ice->base.regionY = spriteRegionY;
    ice->base.me = me;
    ice->base.meX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}
