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
    struct UNK_808D124_UNK180 transformer;
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

void sub_808623C(void);

void sub_808616C(void)
{
    Sprite_ItemBox *itemBox = TaskGetStructPtr(gCurTask);
    struct UNK_808D124_UNK180 *transformer;
    Sprite *identifier;

    itemBox->unk82 = gUnknown_080E029A[gMultiplayerPseudoRandom & 7];

    identifier = &itemBox->identifier;
    identifier->graphics.anim = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][0];
    identifier->variant = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][1];
    sub_8004558(identifier);

    itemBox->box.unk10 |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
    itemBox->identifier.unk10 |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    transformer = &itemBox->transformer;
    transformer->unk0 = 0;
    transformer->unk2 = 0x100;
    transformer->unk4 = 0;
    transformer->unk6[0] = 0;
    transformer->unk6[1] = 0;
    gCurTask->main = sub_808623C;
    sub_808623C();
}

void sub_80865E4(void);

void sub_8086858(Sprite_ItemBox *);

u32 sub_808693C(Sprite_ItemBox *);
u32 sub_80868F4(Sprite_ItemBox *);
void sub_8086474(Sprite_ItemBox *);
void sub_80868A8(Sprite_ItemBox *, u32);
void sub_8086804(Sprite_ItemBox *);

// TODO: move down when we come to it
static inline void sub_80865E4_inline(void)
{
    Sprite_ItemBox *itemBox = TaskGetStructPtr(gCurTask);
    MapEntity *me = itemBox->base.me;

    if (me->d.sData[0] != (gRandomItemBox & 7)) {
        sub_8086804(itemBox);
    } else {
        if (me->d.sData[1] > (gRandomItemBox >> 4)) {
            sub_8086858(itemBox);
        } else {
            if (sub_808693C(itemBox) != 0) {
                sub_8086474(itemBox);
            }

            if (sub_80868F4(itemBox) != 0) {
                SET_MAP_ENTITY_NOT_INITIALIZED(me, itemBox->base.spriteX);
                TaskDestroy(gCurTask);
                return;
            } else {
                sub_80868A8(itemBox, 0);
            }
        }
    }
}

void sub_808623C(void)
{
    Sprite_ItemBox *itemBox = TaskGetStructPtr(gCurTask);

    struct UNK_808D124_UNK180 *transformer = &itemBox->transformer;
    transformer->unk6[0] = itemBox->unk78 - gCamera.x;
    transformer->unk6[1] = itemBox->unk7C - gCamera.y;

    transformer->unk4 += 8;

    if (transformer->unk4 >= 0x100) {
        MapEntity *me;
        Sprite_ItemBox *itemBox2;
        itemBox->box.unk10 &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
        itemBox->identifier.unk10 &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
        transformer->unk4 = 0x100;
        itemBox->unk80 = 0;
        gCurTask->main = sub_80865E4;

        sub_80865E4_inline();
        return;
    }

    itemBox->box.unk10 &= ~0x1F;

    itemBox->box.unk10 |= gUnknown_030054B8;
    itemBox->identifier.unk10 &= ~0x1F;
    itemBox->identifier.unk10 |= gUnknown_030054B8++;

    sub_8004860(&itemBox->box, transformer);
    sub_8004860(&itemBox->identifier, transformer);
    sub_80051E8(&itemBox->box);
    sub_80051E8(&itemBox->identifier);
}
