#include "global.h"
#include "malloc_vram.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/dust_cloud.h"
#include "game/sa1_sa2_shared/entities_manager.h"
#include "game/entity.h"
#include "game/cheese.h"
#include "game/enemies/projectiles.h"
#include "game/stage/trapped_animals.h"
#include "game/multiplayer/multiplayer_event_mgr.h"
#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ u8 unk4C;
    /* 0x4D */ bool8 clampParam;
} Sprite_Yado;

void Task_YadoMain(void);
void Task_8055084(void);
void Task_8055378(void);
void TaskDestructor_Yado(struct Task *);

#define YADO_PLAYER_ACCEL  -Q(9.0)
#define YADO_PROJ_COOLDOWN (2 * GBA_FRAMES_PER_SECOND)

#define IS_YADO_FACING_PLAYER(_yado, _yadoX, _player)                                                                                      \
    (((I(gPlayer.qWorldX) < _yadoX) && (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP))                                                          \
     || ((I(gPlayer.qWorldX) > _yadoX) && (~s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)))

void CreateEntity_Yado(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    s32 regX, regY;
    struct Task *t = TaskCreate(Task_YadoMain, sizeof(Sprite_Yado), 0x4090, 0, TaskDestructor_Yado);
    Sprite_Yado *yado = TASK_DATA(t);
    Sprite *s = &yado->s;
    yado->base.regionX = spriteRegionX;
    yado->base.regionY = spriteRegionY;
    yado->base.me = me;
    yado->base.meX = me->x;
    yado->base.id = spriteY;

    // This value was left uninitialised on the real game,
    // so the value is essentially random
#ifdef BUG_FIX
#if TAS_TESTING
    if (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) {
        // For this tas, it's likely that the value randomly started as 2
        yado->unk4C = 2;
    } else {
        yado->unk4C = 13;
    }
#else
    yado->unk4C = YADO_PROJ_COOLDOWN;
#endif
#endif

    if (me->d.sData[1] != 0) {
        yado->clampParam = TRUE;
    } else {
        yado->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_STATIC(yado, me);

    regX = spriteRegionX;
    regY = spriteRegionY;
    s->x = TO_WORLD_POS(me->x, regX);
    s->y = TO_WORLD_POS(me->y, regY);

    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 12, SA2_ANIM_YADO, 0, 18, 2);
}

void Task_YadoMain(void)
{
    Sprite_Yado *yado = TASK_DATA(gCurTask);
    Sprite *s = &yado->s;
    MapEntity *me = yado->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(yado, s, pos.x, pos.y);

    if (Coll_Player_Entity_HitboxN(s, pos.x, pos.y, 0, &gPlayer, 0) == TRUE) {
        m4aSongNumStart(SE_SPRING);
        gPlayer.qSpeedAirY = YADO_PLAYER_ACCEL;
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.unk6C = 1;
        gPlayer.transition = PLTRANS_UNCURL;

        // TODO: Why is this called twice?
        m4aSongNumStart(SE_SPRING);
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(yado, me, s);

    if (--yado->unk4C == 0) {
        yado->unk4C = YADO_PROJ_COOLDOWN;
        gCurTask->main = Task_8055084;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 1;
        s->prevVariant = -1;
    } else if (IS_YADO_FACING_PLAYER(yado, pos.x, &gPlayer)) {
        gCurTask->main = Task_8055378;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 3;
        s->prevVariant = -1;
    }

    ENEMY_UPDATE_EX_RAW(s, yado->spawnX, yado->spawnY, {});
}

void Task_8055084(void)
{
    Sprite_Yado *yado = TASK_DATA(gCurTask);
    Sprite *s = &yado->s;
    MapEntity *me = yado->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(yado, s, pos.x, pos.y);

    if (!(gPlayer.moveState & MOVESTATE_IN_AIR)) {
        if (Coll_Player_Enemy_Attack(s, pos.x, pos.y, 1) == TRUE) {
            TaskDestroy(gCurTask);
            return;
        } else if (Coll_Player_Entity_HitboxN(s, pos.x, pos.y, 0, &gPlayer, 0) == 1) {
            gPlayer.qSpeedAirY = YADO_PLAYER_ACCEL;
            gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
            gPlayer.unk6C = 1;
            gPlayer.transition = 5;

            m4aSongNumStart(SE_SPRING);
        }
    } else if (Coll_Player_Entity_HitboxN(s, pos.x, pos.y, 0, &gPlayer, 0) == 1) {
        gPlayer.qSpeedAirY = YADO_PLAYER_ACCEL;
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.unk6C = 1;
        gPlayer.transition = 5;

        m4aSongNumStart(SE_SPRING);
    } else {
        s32 x = pos.x;
        s32 y = pos.y;

        if (gCheese != NULL) {
            Cheese *cheese = gCheese;
            Sprite_Yado *yado2 = TASK_DATA(gCurTask);

            if (cheese->s.hitboxes[1].index != HITBOX_STATE_INACTIVE) {
                if (HB_COLLISION(x, y, s->hitboxes[0], I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1])) {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                        roomEvent->x = yado2->base.regionX;
                        roomEvent->y = yado2->base.regionY;
                        roomEvent->id = yado2->base.id;
                    }

                    CreateDustCloud(x, y);
                    CreateTrappedAnimal(x, y);
                    CreateEnemyDefeatScoreAndManageLives(x, y);

                    TaskDestroy(gCurTask);
                    return;
                }
            }
        }
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(yado, me, s);

    Player_UpdateHomingPosition(yado->spawnX, yado->spawnY);

    if (--yado->unk4C == 0) {
        yado->unk4C = YADO_PROJ_COOLDOWN;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_YadoMain;
    } else if (yado->unk4C == 60) {
        ProjInit pinit;
        pinit.numTiles = 4;
        pinit.anim = SA2_ANIM_YADO_PROJ;
        pinit.variant = 0;

        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            pinit.x = QS(pos.x + 6);
            pinit.rot = 0;
        } else {
            pinit.x = QS(pos.x - 5);
            pinit.rot = Q(2.0);
        }
        pinit.y = QS(pos.y - 6);
        pinit.speed = Q(1.5);

        CreateProjectile(&pinit);
    } else if (yado->unk4C == 6) {
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 2;
        s->prevVariant = -1;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8055378(void)
{
    Sprite_Yado *yado = TASK_DATA(gCurTask);
    Sprite *s = &yado->s;
    MapEntity *me = yado->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(yado, s, pos.x, pos.y);

    if (Coll_Player_Entity_HitboxN(s, pos.x, pos.y, 0, &gPlayer, 0) == TRUE) {
        gPlayer.qSpeedAirY = YADO_PLAYER_ACCEL;
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.unk6C = 1;
        gPlayer.transition = PLTRANS_UNCURL;

        m4aSongNumStart(SE_SPRING);
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(yado, me, s);

    Player_UpdateHomingPosition(yado->spawnX, yado->spawnY);

    if (UpdateSpriteAnimation(s) == 0) {
        DisplaySprite(s);

        ENEMY_TURN_AROUND(s);

        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_YadoMain;
    } else {
        DisplaySprite(s);
    }
}

void TaskDestructor_Yado(struct Task *t)
{
    Sprite_Yado *yado = TASK_DATA(t);
    VramFree(yado->s.graphics.dest);
}