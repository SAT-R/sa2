#include "core.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/item_box.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base; /* 0x00 */
    Sprite box; /* 0x0C*/
    Sprite identifier; /* 0x3C */
    u32 unk6C;
    u32 unk70;
    u32 unk74;
    s32 unk78; // x
    s32 unk7C; // y
    s16 unk80;
    u8 unk82;
    u32 unk84;
} Sprite_ItemBox;

void sub_80865E4(void);
void sub_808673C(void);
void sub_80867E8(struct Task *);

extern u16 gUnknown_080E029A[];
extern u16 gUnknown_080E02AA[][3];

void initSprite_Interactable_ItemBox(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    Sprite *sprite;
    Sprite_ItemBox *itemBox;
    struct Task *t;
    if ((gRandomItemBox & 7) == me->d.sData[0]
        && me->d.sData[1] <= (gRandomItemBox >> 4)) {
        t = TaskCreate(sub_80865E4, sizeof(Sprite_ItemBox), 0x2000, 0, sub_80867E8);
    } else {
        t = TaskCreate(sub_808673C, sizeof(Sprite_ItemBox), 0x2000, 0, sub_80867E8);
    }

    if (me->d.sData[1] <= (gRandomItemBox >> 4)) {
        me->d.sData[1] = (gRandomItemBox >> 4);
    }

    itemBox = TaskGetStructPtr(t);
    itemBox->unk82 = gUnknown_080E029A[gMultiplayerPseudoRandom & 7];
    itemBox->unk80 = 0;
    itemBox->unk78 = TO_WORLD_POS(me->x, spriteRegionX);
    itemBox->unk7C = TO_WORLD_POS(me->y, spriteRegionY);
    itemBox->base.regionX = spriteRegionX;
    itemBox->base.regionY = spriteRegionY;
    itemBox->base.me = me;
    itemBox->base.spriteX = me->x;
    itemBox->base.spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite = &itemBox->box;
    sprite->unk22 = 0x10;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->focused = 0;
    sprite->unk1A = 0x480;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = SPRITE_FLAG_PRIORITY(2);
    sprite->graphics.dest = VramMalloc(16);
    sprite->graphics.anim = SA2_ANIM_ITEMBOX;
    sprite->variant = 0;
    sub_8004558(sprite);

    sprite = &itemBox->identifier;
    sprite->unk22 = 0x10;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->focused = 0;
    sprite->unk1A = 0x4C0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = SPRITE_FLAG_PRIORITY(2);
    sprite->graphics.dest = VramMalloc(4);
    sprite->graphics.anim = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][0];
    sprite->variant = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][1];
    sub_8004558(sprite);
}
