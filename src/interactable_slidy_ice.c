#include "global.h"

#include "task.h"

#include "game.h"
#include "interactable.h"

#include "constants/move_states.h"

extern void Task_Interactable_IceParadise_SlidyIce(void);

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_SlidyIce;

#if 1
void Task_Interactable_IceParadise_SlidyIce(void)
{
    Sprite_SlidyIce *ice = TaskGetStructPtr(gCurTask);
    Interactable *ia = ice->base.ia;
    u8 spriteX = ice->base.spriteX;

    s32 regionX, regionY;
    s32 screenX, screenY;
    regionX = ice->base.regionX;
    regionY = ice->base.regionY;
    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD)

        && ((screenX + ia->d.sData[0] * 8) <= Q_24_8_TO_INT(gPlayer.x))
        && (((screenX + ia->d.sData[0] * 8) + ia->d.uData[2] * 8)
            >= Q_24_8_TO_INT(gPlayer.x))
        && ((screenY + ia->d.sData[1] * 8) <= Q_24_8_TO_INT(gPlayer.y))
        && ((screenY + ia->d.sData[1] * 8) + ia->d.uData[3] * 8
            >= Q_24_8_TO_INT(gPlayer.y))) {
        gPlayer.moveState |= MOVESTATE_800;
    }

    // _08011292
    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}
#endif

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
