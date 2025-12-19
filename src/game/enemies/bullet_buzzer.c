#include "global.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"

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
    /* 0x58 */ u16 unk58;
    /* 0x5A */ u8 unk5A;
    /* 0x5B */ u8 unk5B;
    /* 0x5C */ u8 unk5C;
    /* 0x5C */ u8 unk5D;
    /* 0x5C */ u8 unk5E;
} Sprite_BulletBuzzer; /* size: 0x60 */

void Task_BulletBuzzerMain(void);

void CreateEntity_BulletBuzzer(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_BulletBuzzerMain, sizeof(Sprite_BulletBuzzer), 0x4040, 0, TaskDestructor_80095E8);
    Sprite_BulletBuzzer *bbuzzer = TASK_DATA(t);
    Sprite *s = &bbuzzer->s;
    bbuzzer->base.regionX = spriteRegionX;
    bbuzzer->base.regionY = spriteRegionY;
    bbuzzer->base.me = me;
    bbuzzer->base.meX = me->x;
    bbuzzer->base.id = spriteY;

    ENEMY_SET_SPAWN_POS_FLYING(bbuzzer, me);

    bbuzzer->unk54 = Q(0.0);
    bbuzzer->unk5A = me->d.uData[2] * 4;
    bbuzzer->unk5B = me->d.uData[3] * 4;
    bbuzzer->unk5C = 0;
    bbuzzer->unk5E = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(24);
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_BULLETBUZZER, 0, 18, 2, SPRITE_FLAG_MASK_X_FLIP);
}

void sub_8059B04(void);

void Task_BulletBuzzerMain(void)
{
    Sprite_BulletBuzzer *bbuzzer = TASK_DATA(gCurTask);
    Sprite *s = &bbuzzer->s;
    MapEntity *me = bbuzzer->base.me;
    s32 oldOffsetX = bbuzzer->offsetX;
    Vec2_32 pos;
    u16 value;
    u32 index;

    bbuzzer->unk54++;
    bbuzzer->unk54 = CLAMP_SIN_PERIOD(bbuzzer->unk54);

    index = CLAMP_SIN_PERIOD(bbuzzer->unk54 * 5);
    bbuzzer->offsetX = Q_2_14_TO_Q_24_8(COS(index) * bbuzzer->unk5A);

    index = CLAMP_SIN_PERIOD(bbuzzer->unk54 * 3);
    bbuzzer->offsetY = Q_2_14_TO_Q_24_8(SIN(index) * bbuzzer->unk5B);

    ENEMY_UPDATE_POSITION(bbuzzer, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    if (bbuzzer->unk5C != 0) {
        if (oldOffsetX < bbuzzer->offsetX) {
            s->graphics.anim = SA2_ANIM_BULLETBUZZER;
            s->variant = 1;
            s->prevVariant = -1;
        }

    } else if (oldOffsetX > bbuzzer->offsetX) {
        s->graphics.anim = SA2_ANIM_BULLETBUZZER;
        s->variant = 1;
        s->prevVariant = -1;
    }

    if (oldOffsetX < bbuzzer->offsetX) {
        bbuzzer->unk5C = 0;
    } else {
        bbuzzer->unk5C = 1;
    }

    if (bbuzzer->unk5E != 0) {
        bbuzzer->unk5E--;
    }

    ENEMY_DESTROY_IF_OFFSCREEN(bbuzzer, me, s);
    value = sub_8004418(I(gPlayer.qWorldY) - pos.y, I(gPlayer.qWorldX) - pos.x);

    if (bbuzzer->unk5E == 0) {
        if (((u16)(value - 86) < 84 && s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)
            || ((u16)(value - 342) < 84 && !(s->frameFlags & SPRITE_FLAG_MASK_X_FLIP))) {
            bbuzzer->unk58 = value;
            bbuzzer->unk5D = 0;
            s->graphics.anim = SA2_ANIM_BULLETBUZZER;
            s->variant = 2;
            s->prevVariant = -1;
            gCurTask->main = sub_8059B04;
        }
    }

    Player_UpdateHomingPosition(Q(pos.x), Q(pos.y));
    if (UpdateSpriteAnimation(s) == 0) {
        ENEMY_TURN_AROUND(s);
        s->graphics.anim = SA2_ANIM_BULLETBUZZER;
        s->variant = 0;
        s->prevVariant = -1;
    }
    DisplaySprite(s);
}

void sub_8059B04(void)
{

    Sprite_BulletBuzzer *bbuzzer = TASK_DATA(gCurTask);
    Sprite *s = &bbuzzer->s;
    MapEntity *me = bbuzzer->base.me;
    ProjInit init;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION(bbuzzer, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(bbuzzer, me, s);

    if (++bbuzzer->unk5D == 34) {
        init.numTiles = 4;
        init.anim = SA2_ANIM_BUZZER_PROJ;
        init.variant = 0;
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            init.x = QS(pos.x + 10);
        } else {
            init.x = QS(pos.x - 10);
        }

        init.y = QS(pos.y + 14);
        init.rot = bbuzzer->unk58 - 16;
        init.speed = Q(2);
        CreateSeveralProjectiles(&init, 3, 16);
    }

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    if (UpdateSpriteAnimation(s) == 0) {
        DisplaySprite(s);
        bbuzzer->unk5E = 60;
        s->graphics.anim = SA2_ANIM_BULLETBUZZER;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_BulletBuzzerMain;
    } else {
        DisplaySprite(s);
    }
}
