#include "global.h"
#include "gba/types.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/interactables.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_IA044;

void Task_Interactable_044(void)
{
    Sprite_IA044 *object = TaskGetStructPtr(gCurTask);
    Interactable *ia = object->base.ia;
    s32 screenX, screenY;
    u32 regionY, regionX;
    s32 someX, someY;
    s32 playerX, playerY;
    s32 spriteX;

    spriteX = object->base.spriteX;
    regionX = object->base.regionX;
    regionY = object->base.regionY;
    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    someX = screenX + ia->d.sData[0] * TILE_WIDTH;
    playerX = Q_24_8_TO_INT(gPlayer.unk8);
    if ((someX <= playerX) && (someX + ia->d.uData[2] * TILE_WIDTH) >= playerX) {
        someY = screenY + ia->d.sData[1] * TILE_WIDTH;
        playerY = Q_24_8_TO_INT(gPlayer.unkC);

        if ((someY <= playerY) && (someY + ia->d.uData[3] * TILE_WIDTH) >= playerY) {
            u32 moveState = gPlayer.unk20;
            if (((moveState & (MOVESTATE_40000 | MOVESTATE_IN_AIR)) == MOVESTATE_IN_AIR)
                && (gPlayer.unk12 < 0)) {
                if (moveState & MOVESTATE_10000000) {
                    object->base.spriteY = 1;

                    // Wat?
                    if (gPlayer.unk20 & MOVESTATE_10000000)
                        goto TaskI044_out;
                }

                if (object->base.spriteY == 0) {
                    gPlayer.unk6D = 0x17;
                    gPlayer.unk6E = 0;

                    if (ia->index != IA__044)
                        gPlayer.unk6E = 1;
                }
            }
        } else {
            object->base.spriteY = 0;
        }
    } else {
        object->base.spriteY = 0;
    }
TaskI044_out:

    screenX -= gCamera.unk0;
    screenY -= gCamera.unk4;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

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
