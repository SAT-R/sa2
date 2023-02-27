#include "global.h"
#include "task.h"

#include "game/game.h"
#include "game/interactable.h"

#include "constants/move_states.h"

extern void Task_Interactable_IceParadise_SlidyIce(void);

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} Interactable_SlidyIce PACKED;

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_SlidyIce;

void Task_Interactable_IceParadise_SlidyIce(void)
{
    Sprite_SlidyIce *ice = TaskGetStructPtr(gCurTask);
    Interactable_SlidyIce *ia = (Interactable_SlidyIce *)ice->base.ia;
    u8 spriteX = ice->base.spriteX;

    s32 regionX, regionY;
    s32 screenX, screenY;
    regionX = ice->base.regionX;
    regionY = ice->base.regionY;
    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s32 posX = (screenX + ia->offsetX * TILE_WIDTH);

        if ((posX <= Q_24_8_TO_INT(gPlayer.x))
            && ((posX + ia->width * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.x))) {
            s32 posY = screenY + ia->offsetY * TILE_WIDTH;

            if ((posY <= Q_24_8_TO_INT(gPlayer.y))
                && ((posY + ia->height * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.y))) {
                gPlayer.moveState |= MOVESTATE_800;
            }
        }
    }

    // _08011292
    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_IceParadise_SlidyIce(Interactable *ia, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_IceParadise_SlidyIce, 0xC, 0x2010, 0, NULL);

    Sprite_SlidyIce *ice = TaskGetStructPtr(t);
    ice->base.regionX = spriteRegionX;
    ice->base.regionY = spriteRegionY;
    ice->base.ia = ia;
    ice->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}
