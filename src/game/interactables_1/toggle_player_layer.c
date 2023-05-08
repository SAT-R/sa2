#include "global.h"

#include "task.h"

#include "game/game.h"
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
} Interactable_Toggle_PlayerLayer;

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_ChangePlayerLayer;

static void Task_Interactable_Toggle_PlayerLayer(void)
{
    Sprite_ChangePlayerLayer *layerChanger = TaskGetStructPtr(gCurTask);
    SpriteBase *base = &layerChanger->base;
    Interactable_Toggle_PlayerLayer *me = (Interactable_Toggle_PlayerLayer *)base->me;
    u8 spriteX = base->spriteX;
    u32 regionX = base->regionX;
    u32 regionY = base->regionY;
    s32 screenX, screenY;

    screenX = TO_WORLD_POS(spriteX, regionX);
    screenY = TO_WORLD_POS(me->y, regionY);

    if ((screenX <= Q_24_8_TO_INT(gPlayer.x))
        && (screenX + (me->width * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.x))
        && (screenY <= Q_24_8_TO_INT(gPlayer.y))
        && (screenY + (me->height * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.y))) {

        // The interactable-index determines, whether the layer we switch to
        // should be the foreground- or the background layer.
        if (me->index == IA__TOGGLE_PLAYER_LAYER__FOREGROUND) {
            gPlayer.unk38 &= ~1;
        } else {
            gPlayer.unk38 |= 1;
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

void initSprite_Interactable_Toggle_PlayerLayer(MapEntity *me, u16 spriteRegionX,
                                                u16 spriteRegionY, UNUSED u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_Toggle_PlayerLayer,
                                sizeof(Sprite_ChangePlayerLayer), 0x2000, 0, NULL);
    Sprite_ChangePlayerLayer *layerChanger = TaskGetStructPtr(t);
    SpriteBase *base = &layerChanger->base;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->me = me;
    base->spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}