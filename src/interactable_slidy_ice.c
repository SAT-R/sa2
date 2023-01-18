#include "global.h"

#include "task.h"

#include "game.h"
#include "interactable.h"

extern void Task_Interactable_IceParadise_SlidyIce(void);


typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_SlidyIce;

#if 0
void Task_Interactable_IceParadise_SlidyIce(void) {
    
}
#endif

void initSprite_Interactable_IceParadise_SlidyIce(Interactable *ia, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_IceParadise_SlidyIce, 0xC, 0x2010, 0, NULL);

    Sprite_SlidyIce *ice = TaskGetStructPtr(t);
    ice->base.regionX = spriteRegionX;
    ice->base.regionY = spriteRegionY;
    ice->base.ia = ia;
    ice->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}
