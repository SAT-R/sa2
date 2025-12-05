#include "global.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"

#include "task.h"

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
    /* 0x5C */ s32 unk5C;
    /* 0x60 */ s32 unk60;
    /* 0x64 */ s16 unk64;
    /* 0x66 */ s16 unk66;
    /* 0x68 */ u8 unk68;
} Sprite_Buzzer; /* size: 0x6C */

static void Task_BuzzerMain(void);
static void TaskDestructor_Buzzer(struct Task *);
static void sub_80533B4(void);
static void sub_80534F0(void);
static void sub_8053620(void);

void CreateEntity_Buzzer(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (DIFFICULTY_LEVEL_IS_NOT_EASY_AND_ZONE_IS_NOT_1) {
        struct Task *t = TaskCreate(Task_BuzzerMain, sizeof(Sprite_Buzzer), 0x4030, 0, TaskDestructor_Buzzer);
        Sprite_Buzzer *buzzer = TASK_DATA(t);
        Sprite *s = &buzzer->s;
        buzzer->base.regionX = spriteRegionX;
        buzzer->base.regionY = spriteRegionY;
        buzzer->base.me = me;
        buzzer->base.meX = me->x;
        buzzer->base.id = spriteY;

        ENEMY_SET_SPAWN_POS_FLYING(buzzer, me);

        buzzer->unk54 = Q(0.0);
        buzzer->unk58 = 0;
        buzzer->unk60 = 0;
        buzzer->unk64 = 0;
        buzzer->unk66 = 0;
        buzzer->unk5C = 0;
        buzzer->unk68 = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, 20, SA2_ANIM_BUZZER, 0, 18, 2);
    }
}

static void Task_BuzzerMain(void)
{
    Sprite_Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->s;
    MapEntity *me = buzzer->base.me;
    Vec2_32 pos;

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        buzzer->offsetX += 0xC0;
    } else {
        buzzer->offsetX -= 0xC0;
    }

    ENEMY_UPDATE_POSITION_RAW(buzzer, s, pos.x, pos.y, buzzer->offsetX, 0);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(buzzer, me, s);

    if ((buzzer->unk68 == 0 ||
#ifndef NON_MATCHING
         ({
             if (--buzzer->unk68 != 0) {
                 goto lab;
             }
             0;
         }) == 0
#else
         --buzzer->unk68 == 0
#endif
         )
        && !(s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) && I(gPlayer.qWorldX) > (pos.x - 0x3C) && I(gPlayer.qWorldX) < pos.x
        && I(gPlayer.qWorldY) > pos.y && I(gPlayer.qWorldY) < (pos.y + 0x50)) {
        gCurTask->main = sub_80534F0;
        s->graphics.anim = SA2_ANIM_BUZZER;
        s->variant = 1;
        s->prevVariant = -1;
        buzzer->unk5C = gPlayer.qWorldY;
        buzzer->unk64 = Div(gPlayer.qWorldX - QS(pos.x), 0x20);
        buzzer->unk66 = Div(gPlayer.qWorldY - QS(pos.y), 0x20);
    } else if (buzzer->unk68 == 0 && (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) && I(gPlayer.qWorldX) > pos.x
               && I(gPlayer.qWorldX) < (pos.x + 0x3C) && I(gPlayer.qWorldY) > pos.y && I(gPlayer.qWorldY) < (pos.y + 0x50)) {
        gCurTask->main = sub_80534F0;
        s->graphics.anim = SA2_ANIM_BUZZER;
        s->variant = 1;
        s->prevVariant = -1;
        buzzer->unk5C = gPlayer.qWorldY;

        // Wtf
        buzzer->unk64 = Div(QS(pos.x) - gPlayer.qWorldX, 0x20);
        buzzer->unk64 = Div(gPlayer.qWorldX - QS(pos.x), 0x20);

        buzzer->unk66 = Div(gPlayer.qWorldY - QS(pos.y), 0x20);
    } else {
#ifndef NON_MATCHING
    lab:
#endif
        if (ENEMY_CROSSED_LEFT_BORDER(buzzer, me) && !(s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
            gCurTask->main = sub_80533B4;
            s->graphics.anim = SA2_ANIM_BUZZER;
            s->variant = 2;
            s->prevVariant = -1;
        } else if (ENEMY_CROSSED_RIGHT_BORDER(buzzer, me) && s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            gCurTask->main = sub_80533B4;
            s->graphics.anim = SA2_ANIM_BUZZER;
            s->variant = 2;
            s->prevVariant = -1;
        }
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
}

static void sub_80533B4(void)
{
    Sprite_Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->s;
    MapEntity *me = buzzer->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_RAW(buzzer, s, pos.x, pos.y, buzzer->offsetX, 0);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(buzzer, me, s);

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    if (UpdateSpriteAnimation(s) == 0) {
        ENEMY_TURN_AROUND(s);
        s->graphics.anim = SA2_ANIM_BUZZER;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_BuzzerMain;
    }

    DisplaySprite(s);
}

static void sub_80534F0(void)
{
    Sprite_Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->s;
    MapEntity *me = buzzer->base.me;
    Vec2_32 pos;

    buzzer->unk54 += buzzer->unk64;
    buzzer->unk58 += buzzer->unk66;

    ENEMY_UPDATE_POSITION_RAW(buzzer, s, pos.x, pos.y, buzzer->offsetX + buzzer->unk54, buzzer->unk58);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(buzzer, me, s);

    ENEMY_UPDATE_EX(s, pos.x, pos.y, {
        if (QS(pos.y) > buzzer->unk5C) {
            gCurTask->main = sub_8053620;
        }
    });
}

static void sub_8053620(void)
{
    Sprite_Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->s;
    MapEntity *me = buzzer->base.me;
    Vec2_32 pos;

    buzzer->unk54 -= buzzer->unk64;
    buzzer->unk58 -= buzzer->unk66;

    ENEMY_UPDATE_POSITION_RAW(buzzer, s, pos.x, pos.y, buzzer->offsetX + buzzer->unk54, buzzer->unk58);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(buzzer, me, s);

    ENEMY_UPDATE_EX(s, pos.x, pos.y, {
        if (buzzer->unk58 < 1) {
            buzzer->unk54 = 0;
            buzzer->unk58 = 0;
            s->graphics.anim = SA2_ANIM_BUZZER;
            s->variant = 0;
            s->prevVariant = -1;
            buzzer->unk68 = 0x3C;
            gCurTask->main = Task_BuzzerMain;
        }
    });
}

static void TaskDestructor_Buzzer(struct Task *t)
{
    Sprite_Buzzer *buzzer = TASK_DATA(t);
    VramFree(buzzer->s.graphics.dest);
}
