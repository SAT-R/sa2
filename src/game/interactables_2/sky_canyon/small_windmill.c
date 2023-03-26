#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/small_windmill.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    u8 unk3C;
    s32 x;
    s32 y;
} Sprite_SmallWindmill;

void Task_Interactable_SkyCanyon_SmallSpinnyWindmill(void);
void TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill(struct Task *);
void initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill(MapEntity *me,
                                                           u16 spriteRegionX,
                                                           u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_SkyCanyon_SmallSpinnyWindmill, 0x48, 0x2010, 0,
                     TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill);
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(t);
    Sprite *sprite;
    windmill->unk3C = me->d.uData[0];

    windmill->x = SpriteGetScreenPos(me->x, spriteRegionX);
    windmill->y = SpriteGetScreenPos(me->y, spriteRegionY);

    windmill->base.regionX = spriteRegionX;
    windmill->base.regionY = spriteRegionY;
    windmill->base.me = me;
    windmill->base.spriteX = me->x;
    windmill->base.spriteY = spriteY;

    sprite = &windmill->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0x20);
    sprite->graphics.anim = SA2_ANIM_CROSS_SKY_CAN;
    sprite->variant = 2;
    sub_8004558(sprite);

    SET_MAP_ENTITY_INITIALIZED(me);
}
