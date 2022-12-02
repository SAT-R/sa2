#include "global.h"

#include "task.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"

#include "constants/interactables.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_ChangePlayerLayer;

// Width and height of the rectangle of this object, in tiles
#define splWidth  d.uData[2]
#define splHeight d.uData[3]

static void Task_Interactable_SetPlayerLayer(void)
{
    Sprite_ChangePlayerLayer *layerChanger = TaskGetStructPtr(gCurTask);
    SpriteBase *base = &layerChanger->base;
    Interactable *ia = base->ia;
    u8 spriteX = base->spriteX;
    u32 regionX = base->regionX;
    u32 regionY = base->regionY;
    s32 screenX, screenY;

    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    if ((screenX <= Q_24_8_TO_INT(gPlayer.unk8))
        && (screenX + (ia->splWidth * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.unk8))
        && (screenY <= Q_24_8_TO_INT(gPlayer.unkC))
        && (screenY + (ia->splHeight * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.unkC))) {

        // The interactable-index determines, whether the layer we switch to
        // should be the foreground- or the background layer.
        if (ia->index == IA__SET_PLAYER_LAYER__FOREGROUND) {
            gPlayer.unk38 &= ~1;
        } else {
            gPlayer.unk38 |= 1;
        }

        gPlayer.unk20 &= ~MOVESTATE_1000000;
    }

    screenX -= gCamera.unk0;
    screenY -= gCamera.unk4;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

#undef splHeight
#undef splWidth

void initSprite_Interactable_SetPlayerLayer(Interactable *ia, u16 spriteRegionX,
                                            u16 spriteRegionY, UNUSED u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_SetPlayerLayer,
                                sizeof(Sprite_ChangePlayerLayer), 0x2000, 0, NULL);
    Sprite_ChangePlayerLayer *layerChanger = TaskGetStructPtr(t);
    SpriteBase *base = &layerChanger->base;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->ia = ia;
    base->spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}