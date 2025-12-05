#include "global.h"
#include "malloc_vram.h"
#include "game/enemies/balloon.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/entities_manager.h"
#include "game/enemies/projectiles.h"
#include "task.h"
#include "trig.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ s32 offsetX;
    /* 0x50 */ s32 offsetY;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ u8 unk5C;
    /* 0x5D */ u8 unk5D;
    /* 0x5E */ u8 unk5E;
} Sprite_Balloon; /* size: 0x60 */

void Task_BalloonMain(void);

void CreateEntity_Balloon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (DIFFICULTY_LEVEL_IS_NOT_EASY) {
        struct Task *t = TaskCreate(Task_BalloonMain, sizeof(Sprite_Balloon), 0x4040, 0, TaskDestructor_80095E8);
        Sprite_Balloon *balloon = TASK_DATA(t);
        Sprite *s = &balloon->s;
        balloon->base.regionX = spriteRegionX;
        balloon->base.regionY = spriteRegionY;
        balloon->base.me = me;
        balloon->base.meX = me->x;
        balloon->base.id = spriteY;

        ENEMY_SET_SPAWN_POS_FLYING(balloon, me);

        balloon->unk54 = Q(0.5);
        balloon->unk58 = Q(0.0);
        balloon->unk5E = 120;
        balloon->unk5C = me->d.uData[2] * 4;
        balloon->unk5D = me->d.uData[3] * 4;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, 10, SA2_ANIM_BALLOON, 0, 18, 2);
    }
}

void sub_805879C(void);

void Task_BalloonMain(void)
{
    Sprite_Balloon *balloon = TASK_DATA(gCurTask);
    Sprite *s = &balloon->s;
    MapEntity *me = balloon->base.me;
    Vec2_32 pos;
    u16 idx;

    balloon->unk58 = (balloon->unk58 + 1) & 0x3FF;
    idx = CLAMP_SIN_PERIOD(balloon->unk58 * 5);
    balloon->offsetX = (COS(idx) * balloon->unk5C) >> 6;
    idx = CLAMP_SIN_PERIOD(balloon->unk58 * 3);
    balloon->offsetY = (SIN(idx) * balloon->unk5D) >> 6;

    ENEMY_UPDATE_POSITION(balloon, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(balloon, me, s);

    if (ENEMY_CROSSED_LEFT_BORDER(balloon, me)) {
        balloon->unk54 = 0x80;
    } else if (ENEMY_CROSSED_RIGHT_BORDER(balloon, me)) {
        balloon->unk54 = -0x80;
    }

    if (--balloon->unk5E == 0) {
        s->graphics.anim = SA2_ANIM_BALLOON;
        s->variant = 1;
        s->prevVariant = -1;
        gCurTask->main = sub_805879C;
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
    s->frameFlags ^= 0x400;
    DisplaySprite(s);
}

void sub_805879C(void)
{
#ifndef NON_MATCHING
    register u8 r8 asm("r8");
#endif

    Sprite_Balloon *balloon = TASK_DATA(gCurTask);
    Sprite *s = &balloon->s;
    MapEntity *me = balloon->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION(balloon, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(balloon, me, s);

    balloon->unk5E++;

#ifndef NON_MATCHING
    r8 = -1;
#endif

    if (balloon->unk5E == 45) {
        ProjInit proj;
        proj.numTiles = 3;
        proj.anim = SA2_ANIM_BALLOON_PROJ;
        proj.variant = 0;
        proj.x = QS(pos.x + 1);
        proj.y = QS(pos.y + 20);
        proj.rot = (u8)-1;
        proj.speed = 512;
        CreateProjectile(&proj);
    }

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));
    if (UpdateSpriteAnimation(s) == 0) {
        balloon->unk5E = 120;
        s->graphics.anim = SA2_ANIM_BALLOON;
        s->variant = 0;
#ifndef NON_MATCHING
        s->prevVariant |= r8;
#else
        s->prevVariant = -1;
#endif
        gCurTask->main = Task_BalloonMain;
    }
    DisplaySprite(s);
    s->frameFlags ^= 0x400;
    DisplaySprite(s);
}
