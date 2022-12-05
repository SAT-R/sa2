#include "global.h"
#include "gba/types.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_IA044;

extern void sub_8010598(void);

void initSprite_Interactable_044(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8010598, sizeof(Sprite_IA044), 0x2010, 0, NULL);
    Sprite_IA044 *ia044 = TaskGetStructPtr(t);

    ia044->base.regionX = spriteRegionX;
    ia044->base.regionY = spriteRegionY;
    ia044->base.ia = ia;
    ia044->base.spriteX = ia->x;
    ia044->base.spriteY = 0;
    SET_SPRITE_INITIALIZED(ia);
}
