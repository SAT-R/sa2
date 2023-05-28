#include "global.h"
#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "game/entity.h"
#include "game/enemies/kura_kura.h"
#include "game/stage_entities_manager.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s0; /* 0x0C */
    Sprite s1; /* 0x3C */
    Sprite s2; /* 0x6C */
    s32 unk9C;
    s32 unkA0;
    s32 unkA4; // x;
    s32 unkA8; // y;
    s32 unkAC;
    s32 unkB0;
} Sprite_KuraKura; /* 0xB4*/

void sub_8052024(void);
void sub_8052264(struct Task *);

void CreateEntity_KuraKura(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8052024, 0xB4, 0x4050, 0, sub_8052264);
    Sprite_KuraKura *kuraKura = TaskGetStructPtr(t);
    Sprite *sprite = &kuraKura->s0;

    kuraKura->unkB0 = 0;
    kuraKura->unkAC = 0;

    kuraKura->base.regionX = spriteRegionX;
    kuraKura->base.regionY = spriteRegionY;
    kuraKura->base.me = me;
    kuraKura->base.spriteX = me->x;
    kuraKura->base.spriteY = spriteY;

    kuraKura->unkA4 = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    kuraKura->unkA8 = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

    sprite->x = TO_WORLD_POS(me->x, spriteRegionX);
    sprite->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest = VramMalloc(8);
    sprite->graphics.anim = SA2_ANIM_KURAKURA;
    sprite->variant = 0;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;

    sprite = &kuraKura->s1;
    sprite->x = 0;
    sprite->y = 0;

    sprite->graphics.dest = VramMalloc(1);
    sprite->graphics.anim = SA2_ANIM_KURAKURA_PROJ;
    sprite->variant = 0;
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sub_8004558(sprite);

    sprite = &kuraKura->s2;
    sprite->x = 0;
    sprite->y = 0;

    sprite->graphics.dest = VramMalloc(4);
    sprite->graphics.anim = SA2_ANIM_KURAKURA_PROJ_FIREBALL;
    sprite->variant = 0;
    sprite->unk1A = 0x400;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
}
