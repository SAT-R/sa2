#include "global.h"
#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"

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
    Sprite_KuraKura *kk = TaskGetStructPtr(t);
    Sprite *sprite = &kk->s0;

    kk->unkB0 = 0;
    kk->unkAC = 0;

    kk->base.regionX = spriteRegionX;
    kk->base.regionY = spriteRegionY;
    kk->base.me = me;
    kk->base.spriteX = me->x;
    kk->base.spriteY = spriteY;

    kk->unkA4 = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    kk->unkA8 = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

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

    sprite = &kk->s1;
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

    sprite = &kk->s2;
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

void sub_805213C(Sprite_KuraKura *kk);

void sub_8052024(void)
{
    Sprite_KuraKura *kk = TaskGetStructPtr(gCurTask);
    Sprite *s = &kk->s0;
    MapEntity *me = kk->base.me;

    Vec2_32 pos;
    pos.x = Q_24_8_TO_INT(kk->unkA4);
    pos.y = Q_24_8_TO_INT(kk->unkA8);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    s->unk10 &= ~0x400;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
    } else if ((pos.x > gCamera.x + 0x170 || pos.x < gCamera.x - 0x80
                || pos.y > gCamera.y + 0x120 || pos.y < gCamera.y - 0x80)
               && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kk->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        sub_80122DC(kk->unkA4, kk->unkA8);
        sub_8004558(s);
        sub_80051E8(s);

        s->unk10 |= 0x400;
        sub_80051E8(s);
        sub_805213C(kk);
    }
}

void sub_805213C(Sprite_KuraKura *kk)
{
    u8 i;
    Vec2_32 pos;
    Sprite *s1 = &kk->s1;
    Sprite *s2 = &kk->s2;

    kk->unkAC = (SIN_24_8((gUnknown_03005590 * 4) & ONE_CYCLE) >> 1) & ONE_CYCLE;

    for (i = 0; i < 2; i++) {
        s1->x = (Q_24_8_TO_INT(kk->unkA4) + (SIN(kk->unkAC) >> (11 - i))) - gCamera.x;
        s1->y = (Q_24_8_TO_INT(kk->unkA8) + (COS(kk->unkAC) >> (11 - i))) - gCamera.y;
        sub_80051E8(s1);
    }

    pos.x = (Q_24_8_TO_INT(kk->unkA4) + (SIN(kk->unkAC) >> 9)) - (SIN(kk->unkAC) >> 11);
    pos.y = (Q_24_8_TO_INT(kk->unkA8) + (COS(kk->unkAC) >> 9)) - (COS(kk->unkAC) >> 11);

    s2->x = pos.x - gCamera.x;
    s2->y = pos.y - gCamera.y;
    sub_800C84C(s2, pos.x, pos.y);
    sub_8004558(s2);
    sub_80051E8(s2);
}

void sub_8052264(struct Task *t)
{
    Sprite_KuraKura *kk = TaskGetStructPtr(t);
    VramFree(kk->s0.graphics.dest);
    VramFree(kk->s1.graphics.dest);
    VramFree(kk->s2.graphics.dest);
}
