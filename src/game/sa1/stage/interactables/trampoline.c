#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Trampoline;

void Task_Trampoline(void);
void Task_Trampoline1(void);
bool32 sub_8074FB0(Sprite *s, s16 worldX, s16 worldY);
void TaskDestructor_Trampoline(Task *);

void CreateEntity_Trampoline(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Trampoline, sizeof(Trampoline), 0x2000, 0, TaskDestructor_Trampoline);
    Trampoline *trampoline = TASK_DATA(t);
    Sprite *s = &trampoline->s;

    trampoline->base.regionX = regionX;
    trampoline->base.regionY = regionY;
    trampoline->base.me = me;
    trampoline->base.meX = me->x;
    trampoline->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;

    if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_2) || (gCurrentLevel == ACT_CHAO_HUNT_B)) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_TRAMPOLINE2);
        s->graphics.anim = SA1_ANIM_TRAMPOLINE2;
    } else if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_TRAMPOLINE2);
        s->graphics.anim = SA1_ANIM_TRAMPOLINE2;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_TRAMPOLINE1);
        s->graphics.anim = SA1_ANIM_TRAMPOLINE1;
    }

    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_Trampoline(void)
{
    Trampoline *trampoline = TASK_DATA(gCurTask);
    Sprite *s = &trampoline->s;
    MapEntity *me = trampoline->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(trampoline->base.meX, trampoline->base.regionX);
    worldY = TO_WORLD_POS(me->y, trampoline->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (sub_8074FB0(s, worldX, worldY)) {
        m4aSongNumStart(SE_TRAMPOLINE);
        s->variant = 1;
        gCurTask->main = Task_Trampoline1;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, trampoline->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        DisplaySprite(s);
    }
}

void Task_Trampoline1(void)
{
    Trampoline *trampoline = TASK_DATA(gCurTask);
    Sprite *s = &trampoline->s;
    MapEntity *me = trampoline->base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(trampoline->base.meX, trampoline->base.regionX);
    worldY = TO_WORLD_POS(me->y, trampoline->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (sub_8074FB0(s, worldX, worldY)) {
        m4aSongNumStart(SE_TRAMPOLINE);
        s->variant = 1;
        s->prevVariant = -1;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, trampoline->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 0;
        UpdateSpriteAnimation(s);

        gCurTask->main = Task_Trampoline;
    }

    DisplaySprite(s);
}

bool32 sub_8074FB0(Sprite *s, s16 worldX, s16 worldY)
{
    bool32 result = FALSE;
    s32 i;

    i = 0;
    do {
        Player *p = &PLAYER(i);
        s32 qSpeedAirY = p->qSpeedAirY;
        u32 res = Coll_Player_Platform(s, worldX, worldY, p);

        if (res & 0x8) {
            s32 a;
            Player_TransitionCancelFlyingAndBoost(p);

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->moveState &= ~MOVESTATE_100;
            p->moveState &= ~MOVESTATE_SPIN_ATTACK;
            p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
            PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);

            if (qSpeedAirY == 0) {
                p->qWorldY -= Q(8);
            }

            a = ((qSpeedAirY >> 5) - (qSpeedAirY + (qSpeedAirY >> 2)));
            p->qSpeedAirY = a;

            if (p->qSpeedAirY < -Q(10.9921875)) {
                p->qSpeedAirY = -Q(10.9921875);
            }

            if (p->qSpeedAirY > -Q(3.75)) {
                p->qSpeedAirY = -Q(3.75);
            }

            p->charState = CHARSTATE_SPRING_B;

            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 30;
            }

            result = TRUE;
        }
    } while (++i < gNumSingleplayerCharacters);

    return result;
}

void TaskDestructor_Trampoline(Task *t)
{
    Trampoline *trampoline = TASK_DATA(t);
    VramFree(trampoline->s.graphics.dest);
}