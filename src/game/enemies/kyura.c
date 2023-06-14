#include "global.h"
#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/entity.h"
#include "game/enemies/kyura.h"
#include "game/enemies/projectiles.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite sprite; /* 0x0C */
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s32 unk54;
    u8 unk58;
    u8 unk59;
    u8 unk5A;
    u8 unk5B;
} Sprite_Kyura; /* 0x5C*/

void sub_80594E0(void);
void TaskDestructor_80095E8(struct Task *);
void sub_80596C4(void);

void CreateEntity_Kyura(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80594E0, 0x5C, 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Kyura *kyura = TaskGetStructPtr(t);
    Sprite *sprite = &kyura->sprite;
    kyura->base.regionX = spriteRegionX;
    kyura->base.regionY = spriteRegionY;
    kyura->base.me = me;
    kyura->base.spriteX = me->x;
    kyura->base.spriteY = spriteY;

    kyura->unk44 = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    kyura->unk48 = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
    kyura->unk4C = 0;
    kyura->unk50 = 0;
    kyura->unk54 = 0;
    kyura->unk58 = me->d.uData[2] * 4;
    kyura->unk59 = me->d.uData[3] * 4;
    kyura->unk5A = 8;
    kyura->unk5B = 12;

    sprite->x = 0;
    sprite->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest = VramMalloc(24);
    sprite->graphics.anim = SA2_ANIM_KYURA;
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
}

void sub_80594E0(void)
{
    Sprite_Kyura *kyura = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &kyura->sprite;
    MapEntity *me = kyura->base.me;
    u32 unk54 = kyura->unk54;

    Vec2_32 pos;

#ifndef NON_MATCHING
    u32 r0 = unk54 * 5;
    register s32 r1 asm("r1") = ONE_CYCLE;
    register s32 r5 asm("r5");
    asm("" ::"r"(r1));
    r5 = r1;
    r0 &= r5;
    kyura->unk4C = (SIN(({
                        register u32 r2 asm("r2") = 0x100;
                        asm("" ::"r"(r2));
                        r0 + r2;
                    }))
                    * kyura->unk58)
        >> 6;
#else
    u32 r5 = ONE_CYCLE;
    kyura->unk50 = ((COS((unk54 * 5) & r5)) * kyura->unk58) >> 6;
#endif
    kyura->unk50 = ((SIN((unk54 * 3) & r5)) * kyura->unk59) >> 6;

    pos.x = Q_24_8_TO_INT(kyura->unk44 + kyura->unk4C);
    pos.y = Q_24_8_TO_INT(kyura->unk48 + kyura->unk50);

    sprite->x = pos.x - gCamera.x;
    sprite->y = pos.y - gCamera.y;

    if (sub_800C4FC(sprite, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(kyura->unk44) > gCamera.x + 0x170
         || Q_24_8_TO_INT(kyura->unk44) < gCamera.x - 0x80
         || Q_24_8_TO_INT(kyura->unk48) > gCamera.y + 0x120
         || Q_24_8_TO_INT(kyura->unk48) < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kyura->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--kyura->unk5A == 0) {
        kyura->unk5A = 4;
        if (kyura->unk5B-- == 1) {
            ProjInit init;
            u32 oneOrZero;
            kyura->unk5B = 12;

            oneOrZero = PseudoRandom32() & 1;
            init.numTiles = 3;
            init.anim = SA2_ANIM_KYURA_PROJ;
            init.variant = oneOrZero;
            init.x = Q_24_8(pos.x + 1);
            init.y = Q_24_8(pos.y + 20);
            init.unk6 = 0x100;
            init.unk8 = 0x200 - (oneOrZero * 0x100);
            CreateProjectile(&init);
        }
        gCurTask->main = sub_80596C4;
    }
    sub_80122DC(Q_24_8(pos.x), Q_24_8(pos.y));
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80596C4(void)
{
    Sprite_Kyura *kyura = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &kyura->sprite;

    if (--kyura->unk5A == 0) {
        kyura->unk5A = 8;
        kyura->unk54 = (kyura->unk54 + 8) & ONE_CYCLE;
        gCurTask->main = sub_80594E0;
    }
    sub_8004558(sprite);
    sub_80051E8(sprite);
}
