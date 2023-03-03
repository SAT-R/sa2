#include "global.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/interactable.h"
#include "game/interactables_2/floating_spring.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s16 unk50;
    s16 unk52;
    s16 unk54;
    u16 unk56;
} Sprite_FloatingSpring; /* size 0x58 */

void sub_80750A8(void);
void sub_8075140(struct Task *);

void sub_8075284(Sprite_FloatingSpring *);
void sub_8074FD8(Sprite_FloatingSpring *);
void sub_8074E44(Sprite_FloatingSpring *);
void sub_80751B4(Sprite_FloatingSpring *);

void initSprite_Interactable_FloatingSpring_Up(Interactable *ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80750A8, 0x58, 0x2010, 0, sub_8075140);
    Sprite_FloatingSpring *floatingSpring = TaskGetStructPtr(t);
    Sprite *sprite = &floatingSpring->sprite;

    floatingSpring->unk44 = 0;
    floatingSpring->unk48 = 0;
    floatingSpring->unk50 = 0;

    floatingSpring->base.ia = ia;
    floatingSpring->base.regionX = spriteRegionX;
    floatingSpring->base.regionY = spriteRegionY;
    floatingSpring->base.spriteX = ia->x;
    floatingSpring->base.spriteY = spriteY;

    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;

    floatingSpring->unk4C = 0;
    sprite->graphics.dest = 0;
    sub_8075284(floatingSpring);

    if (ia->d.uData[2] > ia->d.uData[3]) {
        if (ia->d.sData[0] >= 0) {
            floatingSpring->unk52 = 4;
            floatingSpring->unk54 = 0;
            floatingSpring->unk56 = 0;
        } else {
            floatingSpring->unk52 = 4;
            floatingSpring->unk54 = 0;
            floatingSpring->unk56 = 0x80;
        }
    } else {
        if (ia->d.sData[1] >= 0) {
            floatingSpring->unk52 = 0;
            floatingSpring->unk54 = 4;
            floatingSpring->unk56 = 0;
        } else {
            floatingSpring->unk52 = 0;
            floatingSpring->unk54 = 4;
            floatingSpring->unk56 = 0x80;
        }
    }
    sub_8074FD8(floatingSpring);
    sub_8004558(sprite);
    sub_8074E44(floatingSpring);
    sub_80751B4(floatingSpring);

    SET_SPRITE_INITIALIZED(ia);
}

void sub_8074E44(Sprite_FloatingSpring *floatingSpring)
{
    Interactable *ia = floatingSpring->base.ia;

    if (floatingSpring->unk52 != 0) {
        s32 temp = ia->d.uData[2] * 2048;
        floatingSpring->unk44
            = (SIN((floatingSpring->unk52
                    * ((gUnknown_03005590 + floatingSpring->unk56) & 255))
                   & ONE_CYCLE)
               * temp)
            >> 15;
    }

    if (floatingSpring->unk54 != 0) {
        s32 temp = ia->d.uData[3] * 2048;
        floatingSpring->unk48
            = (SIN((floatingSpring->unk54
                    * ((gUnknown_03005590 + floatingSpring->unk56) & 255))
                   & ONE_CYCLE)
               * temp)
            >> 15;
    }

    floatingSpring->unk3C
        = SpriteGetScreenPos(floatingSpring->base.spriteX, floatingSpring->base.regionX)
        + Q_24_8_TO_INT(floatingSpring->unk44);
    floatingSpring->unk40 = SpriteGetScreenPos(ia->y, floatingSpring->base.regionY)
        + Q_24_8_TO_INT(floatingSpring->unk48);
}