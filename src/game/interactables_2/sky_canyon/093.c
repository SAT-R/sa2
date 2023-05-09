#include "core.h"
#include "game/interactables_2/sky_canyon/093.h"

typedef struct {
    Sprite sprite1;
    Sprite sprite2;
    s32 x;
    s32 y;
    u16 unk68;
    s16 unk6A;
    s16 unk6C;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_Cannon; /* 0x78 */

void Task_Interactable093(void);
void TaskDestructor_Interactable093(struct Task *);

void initSprite_Interactable093(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_Interactable093, sizeof(Sprite_Cannon), 0x2010, 0,
                                TaskDestructor_Interactable093);
    Sprite_Cannon *cannon = TaskGetStructPtr(t);
    cannon->unk68 = me->d.sData[0];
    cannon->x = TO_WORLD_POS(me->x, spriteRegionX);
    cannon->y = TO_WORLD_POS(me->y, spriteRegionY);
    cannon->me = me;
    cannon->spriteX = me->x;
    cannon->spriteY = spriteY;

    if (cannon->unk68 == 0) {
        cannon->unk6A = 0x200;
    } else {
        cannon->unk6A = 0;
    }

    sprite = &cannon->sprite2;
    sprite->unk1A = 0x1C0;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + 0x2C80;

    // TODO: anim cannon?
    sprite->graphics.anim = 0x268;
    sprite->variant = 1;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}
