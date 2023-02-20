#include "global.h"
#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/interactables.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_IA044;

#define sLeft   (screenX + ia->d.sData[0] * TILE_WIDTH)
#define sRight  ((sLeft) + ia->d.uData[2] * TILE_WIDTH)
#define sTop    (screenY + ia->d.sData[1] * TILE_WIDTH)
#define sBottom ((sTop) + ia->d.uData[3] * TILE_WIDTH)
void Task_Interactable_044(void)
{
    Sprite_IA044 *ia044 = TaskGetStructPtr(gCurTask);
    SpriteBase *object = &ia044->base;
    Interactable *ia = object->ia;
    s32 screenX, screenY;
    u32 regionY, regionX;
    s32 left, top;
    s32 playerX, playerY;
    s32 spriteX;

    spriteX = object->spriteX;
    regionX = object->regionX;
    regionY = object->regionY;
    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    left = sLeft;
    playerX = Q_24_8_TO_INT(gPlayer.x);

    if ((left <= playerX) && sRight >= playerX) {
        top = sTop;
        playerY = Q_24_8_TO_INT(gPlayer.y);

        if ((top <= playerY) && sBottom >= playerY) {
            u32 moveState = gPlayer.moveState;
            if (((moveState & (MOVESTATE_40000 | MOVESTATE_IN_AIR)) == MOVESTATE_IN_AIR)
                && (gPlayer.speedAirY < 0)) {
                if (moveState & MOVESTATE_10000000) {
                    object->spriteY = 1;
                }

                if ((!(moveState & MOVESTATE_10000000)
                     || !(gPlayer.moveState & MOVESTATE_10000000))
                    && object->spriteY == 0) {
                    gPlayer.unk6D = 0x17;
                    gPlayer.unk6E = 0;

                    if (ia->index != IA__044)
                        gPlayer.unk6E = 1;
                }
            }
        } else {
            object->spriteY = 0;
        }
    } else {
        object->spriteY = 0;
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}
#undef sBottom
#undef sTop
#undef sRight
#undef sLeft

void initSprite_Interactable_044(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_044, sizeof(Sprite_IA044), 0x2010, 0, NULL);
    Sprite_IA044 *ia044 = TaskGetStructPtr(t);

    ia044->base.regionX = spriteRegionX;
    ia044->base.regionY = spriteRegionY;
    ia044->base.ia = ia;
    ia044->base.spriteX = ia->x;
    ia044->base.spriteY = 0;
    SET_SPRITE_INITIALIZED(ia);
}
