#include "global.h"

#include "task.h"

#include "game/stage/camera.h"
#include "game/entity.h"
#include "sprite.h"

#include "constants/interactables.h"

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 unused3;
    /* 0x04 */ s8 unused4;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} MapEntity_Toggle_PlayerLayer;

typedef struct {
    /* 0x00 */ SpriteBase base;
} TogglePlayerLayer;

static void Task_MapEntity_Toggle_PlayerLayer(void)
{
    TogglePlayerLayer *toggle = TASK_DATA(gCurTask);
    SpriteBase *base = &toggle->base;
    MapEntity_Toggle_PlayerLayer *me = (MapEntity_Toggle_PlayerLayer *)base->me;
    u8 spriteX = base->meX;
    u32 regionX = base->regionX;
    u32 regionY = base->regionY;
    s32 screenX, screenY;

    screenX = TO_WORLD_POS(spriteX, regionX);
    screenY = TO_WORLD_POS(me->y, regionY);

    if ((screenX <= I(gPlayer.qWorldX)) && (screenX + (me->width * TILE_WIDTH) >= I(gPlayer.qWorldX)) && (screenY <= I(gPlayer.qWorldY))
        && (screenY + (me->height * TILE_WIDTH) >= I(gPlayer.qWorldY))) {

        // The interactable-index determines, whether the layer we switch to
        // should be the foreground- or the background layer.
        if (me->index == IA__TOGGLE_PLAYER_LAYER__FOREGROUND) {
            gPlayer.layer &= ~1;
        } else {
            gPlayer.layer |= 1;
        }

        gPlayer.moveState &= ~MOVESTATE_1000000;
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void CreateEntity_Toggle_PlayerLayer(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, UNUSED u8 spriteY)
{
    struct Task *t = TaskCreate(Task_MapEntity_Toggle_PlayerLayer, sizeof(TogglePlayerLayer), 0x2000, 0, NULL);
    TogglePlayerLayer *toggle = TASK_DATA(t);
    SpriteBase *base = &toggle->base;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->me = me;
    base->meX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}
