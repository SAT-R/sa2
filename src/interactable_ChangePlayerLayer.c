#include "global.h"

#include "task.h"

#include "interactable.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_ChangePlayerLayer;

extern void Task_Interactable_ChangePlayerLayer(void);

void initSprite_Interactable_ChangePlayerLayer(Interactable *ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_ChangePlayerLayer,
                                sizeof(Sprite_ChangePlayerLayer),
                                0x2000, 0, NULL);
    Sprite_ChangePlayerLayer *layerChanger = TaskGetStructPtr(t);
    SpriteBase *base = &layerChanger->base;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->ia = ia;
    base->spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}