#include "global.h"
#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/entity.h"
#include "game/enemies/kyura.h"
#include "game/enemies/projectiles.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s; /* 0x0C */
    s32 unk3C;
    s32 unk40;
    s32 spawnX;
    s32 spawnY;
    s32 offsetX;
    s32 offsetY;
    s32 unk54;
    u8 unk58;
    u8 unk59;
    u8 framesUntilTaskSwitch; // switches task once it reached '0'
    u8 framesUntilProjectile; // name not entirely accurate as it spawns on '1', not '0'
} Sprite_Kyura; /* 0x5C*/

void Task_KyuraMain(void);
void TaskDestructor_80095E8(struct Task *);
void Task_KyuraRecover(void);

void CreateEntity_Kyura(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_KyuraMain, sizeof(Sprite_Kyura), 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Kyura *kyura = TASK_DATA(t);
    Sprite *s = &kyura->s;
    kyura->base.regionX = spriteRegionX;
    kyura->base.regionY = spriteRegionY;
    kyura->base.me = me;
    kyura->base.meX = me->x;
    kyura->base.id = spriteY;

    kyura->spawnX = Q(TO_WORLD_POS(me->x, spriteRegionX));
    kyura->spawnY = Q(TO_WORLD_POS(me->y, spriteRegionY));
    kyura->offsetX = 0;
    kyura->offsetY = 0;
    kyura->unk54 = 0;
    kyura->unk58 = me->d.uData[2] * 4;
    kyura->unk59 = me->d.uData[3] * 4;
    kyura->framesUntilTaskSwitch = 8;
    kyura->framesUntilProjectile = 12;

    s->x = 0;
    s->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 24, SA2_ANIM_KYURA, 0, 18, 2);
}

void Task_KyuraMain(void)
{
    Sprite_Kyura *kyura = TASK_DATA(gCurTask);
    Sprite *s = &kyura->s;
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
    // This uses SIN instead of COS because COS is received by adding 0x100
    // to the index in the sine array, and to match with the original game,
    // we had to use inline ASM
    // TODO: Match the inline asm (and this comment afterwards)!
    kyura->offsetX = (SIN(({
                          register u32 r2 asm("r2") = 0x100;
                          asm("" ::"r"(r2));
                          r0 + r2;
                      }))
                      * kyura->unk58)
        >> 6;
#else
    u32 r5 = ONE_CYCLE;
    kyura->offsetX = ((COS((unk54 * 5) & r5)) * kyura->unk58) >> 6;
#endif
    kyura->offsetY = ((SIN((unk54 * 3) & r5)) * kyura->unk59) >> 6;

    ENEMY_UPDATE_POSITION(kyura, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    ENEMY_DESTROY_IF_OFFSCREEN(kyura, me, s);

    if (--kyura->framesUntilTaskSwitch == 0) {
        kyura->framesUntilTaskSwitch = 4;
        if (kyura->framesUntilProjectile-- == 1) {
            ProjInit init;
            u32 randomBool;
            kyura->framesUntilProjectile = 12;

            randomBool = PseudoRandom32() & 1;
            init.numTiles = 3;
            init.anim = SA2_ANIM_KYURA_PROJ;
            init.variant = randomBool;
            init.x = Q(pos.x + 1);
            init.y = Q(pos.y + 20);
            init.rot = Q(1.0);
            init.speed = Q(2.0) - (Q(1.0) * randomBool);
            CreateProjectile(&init);
        }
        gCurTask->main = Task_KyuraRecover;
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
}

void Task_KyuraRecover(void)
{
    Sprite_Kyura *kyura = TASK_DATA(gCurTask);
    Sprite *s = &kyura->s;

    if (--kyura->framesUntilTaskSwitch == 0) {
        kyura->framesUntilTaskSwitch = 8;
        kyura->unk54 = (kyura->unk54 + 8) & ONE_CYCLE;
        gCurTask->main = Task_KyuraMain;
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
