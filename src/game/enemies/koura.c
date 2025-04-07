#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "game/entity.h"
#include "game/enemies/koura.h"

#include "game/sa1_sa2_shared/entities_manager.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;

    /* 0x4C */ s32 offsetX;
    /* 0x50 */ s32 offsetY;

    /* 0x54 */ u8 unk54;
    /* 0x56 */ s16 unk56;
    /* 0x58 */ s16 unk58;
} Sprite_Koura; /* size: 0x5C */

static void sub_8054224(void);
static void sub_8054904(void);
static void sub_805462C(void);

static const u16 gUnknown_080D8F38[][2] = {
    { SA2_ANIM_KOURA, 1 }, { SA2_ANIM_KOURA, 2 }, { SA2_ANIM_KOURA, 3 },
    { SA2_ANIM_KOURA, 4 }, { SA2_ANIM_KOURA, 5 }, { SA2_ANIM_KOURA, 6 },
};

void CreateEntity_Koura(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{

    struct Task *t = TaskCreate(sub_8054224, sizeof(Sprite_Koura), 0x40B0, 0, TaskDestructor_80095E8);
    Sprite_Koura *koura = TASK_DATA(t);
    Sprite *s = &koura->s;
    koura->base.regionX = spriteRegionX;
    koura->base.regionY = spriteRegionY;
    koura->base.me = me;
    koura->base.spriteX = me->x;
    koura->base.id = spriteY;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[1] == 1) {
            koura->unk54 = 1;
        } else if (me->d.sData[1] == 0) {
            koura->unk54 = 0;
        } else {
            koura->unk54 = 2;
        }

        koura->unk56 = -128;
        koura->unk58 = 0;
    } else {
        koura->unk54 = 3;
        koura->unk56 = 0;
        koura->unk58 = -128;
    }

    ENEMY_SET_SPAWN_POS_STATIC(koura, me);
    koura->offsetX = 0;
    if (koura->unk54 < 2) {
        koura->offsetY = QS(sub_801F07C(I(koura->spawnY), I(koura->spawnX), koura->unk54, 8, NULL, sub_801EE64));
    } else {
        koura->offsetY = 0;
    }

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
    SPRITE_INIT(s, 30, gUnknown_080D8F38[koura->unk54 & 2][0], gUnknown_080D8F38[koura->unk54 & 2][1], 18, 2);
}

static void sub_8054224(void)
{
    Sprite_Koura *koura = TASK_DATA(gCurTask);
    Sprite *s = &koura->s;
    MapEntity *me = koura->base.me;
    Vec2_32 pos;

    if (koura->unk54 < 3) {
        koura->offsetX += koura->unk56;
    } else {
        koura->offsetY += koura->unk58;
    }

    if (koura->unk54 < 2) {
        ENEMY_CLAMP_TO_GROUND(koura, koura->unk54);
    } else if (koura->unk54 == 2) {
        s32 temp = SIN((gStageTime * 0x14) & ONE_CYCLE);
        koura->offsetY = temp >> 4;
    } else {
        s32 temp = SIN((gStageTime * 0x14) & ONE_CYCLE);
        koura->offsetX = temp >> 4;
    }

    ENEMY_UPDATE_POSITION(koura, s, pos.x, pos.y);

    if (gPlayer.qSpeedAirY >= 1 && (gPlayer.moveState & MOVESTATE_IN_AIR)) {
        if (Coll_Player_Entity_Intersection(s, pos.x, pos.y, &gPlayer) == 0x80000) {
            gPlayer.transition = 14;
            gPlayer.unk6E = 0;
            gPlayer.moveState &= ~MOVESTATE_100;
            gPlayer.qSpeedAirY = -896;

            gCurTask->main = sub_8054904;
            s->graphics.anim = gUnknown_080D8F38[koura->unk54 > 1 ? 3 : 1][0];
            s->variant = gUnknown_080D8F38[koura->unk54 > 1 ? 3 : 1][1];
            s->prevVariant = -1;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
            m4aSongNumStart(SE_SPRING);
            return;
        }
    } else {
        ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    }

    ENEMY_DESTROY_IF_OFFSCREEN(koura, me, s);

    if (koura->unk54 < 3) {
        if (ENEMY_CROSSED_LEFT_BORDER(koura, me) && koura->unk56 < 0) {
            gCurTask->main = sub_805462C;
            s->graphics.anim = gUnknown_080D8F38[koura->unk54 == 2 ? 5 : 4][0];
            s->variant = gUnknown_080D8F38[koura->unk54 == 2 ? 5 : 4][1];

            s->prevVariant = -1;
            koura->unk56 = NEGATE(koura->unk56);
        } else if (ENEMY_CROSSED_RIGHT_BORDER(koura, me) && koura->unk56 > 0) {
            gCurTask->main = sub_805462C;
            s->graphics.anim = gUnknown_080D8F38[koura->unk54 == 2 ? 5 : 4][0];
            s->variant = gUnknown_080D8F38[koura->unk54 == 2 ? 5 : 4][1];

            s->prevVariant = -1;
            koura->unk56 = NEGATE(koura->unk56);
        }
    } else {
        if ((ENEMY_CROSSED_TOP_BORDER(koura, me) && koura->unk58 < 0)) {
            koura->unk58 = NEGATE(koura->unk58);
        } else if (ENEMY_CROSSED_BOTTOM_BORDER(koura, me) && koura->unk58 > 0) {
            koura->unk58 = NEGATE(koura->unk58);
        }

        if ((SPRITE_FLAG_GET(s, X_FLIP) && gPlayer.qWorldX < QS(pos.x)) || (!SPRITE_FLAG_GET(s, X_FLIP) && gPlayer.qWorldX > QS(pos.x))) {
            gCurTask->main = sub_805462C;
            s->graphics.anim = gUnknown_080D8F38[5][0];
            s->variant = gUnknown_080D8F38[5][1];
            s->prevVariant = -1;
        }
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
}

static void sub_805462C(void)
{
    Sprite_Koura *koura = TASK_DATA(gCurTask);
    Sprite *s = &koura->s;
    MapEntity *me = koura->base.me;
    Vec2_32 pos;

    if (koura->unk54 < 2) {
        ENEMY_CLAMP_TO_GROUND(koura, koura->unk54);
    } else if (koura->unk54 == 2) {
        s32 temp = SIN((gStageTime * 0x14) & ONE_CYCLE);
        koura->offsetY = temp >> 4;
    } else {
        s32 temp = SIN((gStageTime * 0x14) & ONE_CYCLE);
        koura->offsetX = temp >> 4;
    }

    ENEMY_UPDATE_POSITION(koura, s, pos.x, pos.y);

    if (gPlayer.qSpeedAirY >= 1 && (gPlayer.moveState & MOVESTATE_IN_AIR)) {
        if (Coll_Player_Entity_Intersection(s, pos.x, pos.y, &gPlayer) == 0x80000) {
            gPlayer.transition = 14;
            gPlayer.unk6E = 0;
            gPlayer.moveState &= ~MOVESTATE_100;
            gPlayer.qSpeedAirY = -896;

            ENEMY_TURN_AROUND(s);

            gCurTask->main = sub_8054904;
            s->graphics.anim = gUnknown_080D8F38[koura->unk54 > 1 ? 3 : 1][0];
            s->variant = gUnknown_080D8F38[koura->unk54 > 1 ? 3 : 1][1];
            s->prevVariant = -1;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
            m4aSongNumStart(SE_SPRING);
            return;
        }
    } else {
        ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    }

    ENEMY_DESTROY_IF_OFFSCREEN(koura, me, s);

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    if (UpdateSpriteAnimation(s) == 0) {
        ENEMY_TURN_AROUND(s);
        s->graphics.anim = gUnknown_080D8F38[koura->unk54 & 2][0];
        s->variant = gUnknown_080D8F38[koura->unk54 & 2][1];
        s->prevVariant = -1;
        gCurTask->main = sub_8054224;
    };
    DisplaySprite(s);
}

static void sub_8054904(void)
{
    Sprite_Koura *koura = TASK_DATA(gCurTask);
    Sprite *s = &koura->s;
    MapEntity *me = koura->base.me;
    Vec2_32 pos;

    if (koura->unk54 < 2) {
        ENEMY_CLAMP_TO_GROUND(koura, koura->unk54);
    } else if (koura->unk54 == 2) {
        s32 temp = SIN((gStageTime * 0x14) & ONE_CYCLE);
        koura->offsetY = temp >> 4;
    } else {
        s32 temp = SIN((gStageTime * 0x14) & ONE_CYCLE);
        koura->offsetX = temp >> 4;
    }

    ENEMY_UPDATE_POSITION(koura, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_OFFSCREEN(koura, me, s);

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    if (UpdateSpriteAnimation(s) == 0) {
        s->graphics.anim = gUnknown_080D8F38[koura->unk54 & 2][0];
        s->variant = gUnknown_080D8F38[koura->unk54 & 2][1];
        s->prevVariant = -1;
        gCurTask->main = sub_8054224;
    };
    DisplaySprite(s);
}
