#include "global.h"
#include "main.h"
#include "sprite.h"
#include "interactable.h"
#include "task.h"
#include "malloc_vram.h"
#include "zones.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3C */ u16 unk3C;
} Ramp /* size 0x40 */;

void sub_800FAF4(void);

void TaskDestructor_800FE24(struct Task *);

void initSprite_Interactable_Ramp(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    u8 temp;
    s32 temp2;
    struct Task *t = TaskCreate(sub_800FAF4, 0x40, 0x2010, 0, TaskDestructor_800FE24);
    Ramp *ramp = TaskGetStructPtr(t);
    Sprite *displayed = &ramp->displayed;

    ramp->base.regionX = spriteRegionX;
    ramp->base.regionY = spriteRegionY;
    ramp->base.ia = ia;
    ramp->base.spriteX = ia->x;
    ramp->base.spriteY = spriteY;

    displayed->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    temp = ia->d.sData[0] & 3;
    ramp->unk3C = temp;

    displayed->graphics.dest = VramMalloc(0x14);
    displayed->graphics.anim = SA2_ANIM_RAMP;

    if (LEVEL_TO_ZONE(gCurrentLevel) == 5) {
        displayed->graphics.anim = 608;
    }

    // required for match
    temp2 = temp;

    displayed->variant = temp2 & 1;
    displayed->unk1A = 0x480;
    displayed->graphics.size = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = -1;
    displayed->unk22 = 0x10;
    displayed->focused = 0;
    displayed->unk28[0].unk0 = -1;
    displayed->unk10 = 0x2200;

    if (temp & 2) {
        displayed->unk10 |= 0x400;
    }
    sub_8004558(displayed);
}
