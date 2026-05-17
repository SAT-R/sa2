#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 data1;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E; // charState
    /* 0x3F */ u8 tuggingPlayerIndex;
} RedFlagPole;

void Task_RedFlag(void);
void Task_8077760(void);
void Task_8077918(void);
void Task_8077C5C(void);
void Task_8077D1C(void);
void Task_8077E9C(void);
bool32 sub_8077FA4(RedFlagPole *pole, Sprite *s, s32 worldX, s32 worldY);
bool32 sub_80780B4(RedFlagPole *pole, Sprite *s, s32 worldX, s32 worldY);
bool32 sub_80781E4(RedFlagPole *pole, Sprite *s, s32 worldX, s32 worldY);
void TaskDestructor_RedFlag(Task *t);

void CreateEntity_RedFlag(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_RedFlag, sizeof(RedFlagPole), 0x2000, 0, TaskDestructor_RedFlag);
    RedFlagPole *pole = TASK_DATA(t);
    Sprite *s = &pole->s;

    pole->base.regionX = regionX;
    pole->base.regionY = regionY;
    pole->base.me = me;
    pole->base.meX = me->x;
    pole->base.id = id;

    pole->data1 = me->d.sData[1];
    pole->unk3D = 0;
    pole->unk3E = 0;
    pole->tuggingPlayerIndex = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_RED_FLAG_V);
    s->graphics.anim = SA1_ANIM_RED_FLAG_V;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->d.sData[1]) {
        SPRITE_FLAG_SET(s, X_FLIP);
    }

    UpdateSpriteAnimation(s);
}

void Task_RedFlag(void)
{
#ifndef NON_MATCHING
    register Task **t asm("r8") = &gCurTask;
#else
    Task **t = &gCurTask;
#endif
    RedFlagPole *pole = TASK_DATA(*t);
    Sprite *s = &pole->s;
    MapEntity *me = pole->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pole->base.meX, pole->base.regionX);
    worldY = TO_WORLD_POS(me->y, pole->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (PLAYER_IS_ALIVE) {
        bool32 res;
        if (pole->data1) {
            res = sub_8077FA4(pole, s, worldX, worldY);
        } else {
            res = sub_80780B4(pole, s, worldX, worldY);
        }

        if (res) {
            (*t)->main = Task_8077760;
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pole->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8077760(void)
{
    RedFlagPole *pole = TASK_DATA(gCurTask);
    Sprite *s = &pole->s;
    MapEntity *me = pole->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pole->base.meX, pole->base.regionX);
    worldY = TO_WORLD_POS(me->y, pole->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pole->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    {
        Player *p = &PLAYER(pole->tuggingPlayerIndex);
        if (PLAYER_IS_ALIVE) {
            if (pole->unk3D > 6) {
                if (pole->unk3D == 7) {
                    if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
                        p->qWorldX -= Q(10);
                    } else {
                        p->qWorldX += Q(10);
                    }
                } else {
                    if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
                        p->qWorldX -= Q(7.5);
                    } else {
                        p->qWorldX += Q(7.5);
                    }
                }
            }

            if (++pole->unk3D > 13) {
                p->charState = pole->unk3E;
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;

                if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
                    if (p->charState == CHARSTATE_BRAKE) {
                        p->charState = CHARSTATE_WALK_A;
                    }

                    if (p->qSpeedGround < +Q(10.5)) {
                        p->qSpeedGround = +Q(10.5);
                        p->qSpeedAirX = +Q(10.5);
                    }
                } else {
                    if (p->charState == CHARSTATE_BRAKE) {
                        p->charState = CHARSTATE_WALK_A;
                    }

                    if (p->qSpeedGround > -Q(10.5)) {
                        p->qSpeedGround = -Q(10.5);
                        p->qSpeedAirX = -Q(10.5);
                    }
                }

                p->moveState &= ~MOVESTATE_IA_OVERRIDE;
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                gCurTask->main = Task_8077918;
            }
        } else {
            p->moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8077918(void)
{
    RedFlagPole *pole = TASK_DATA(gCurTask);
    Sprite *s = &pole->s;
    MapEntity *me = pole->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pole->base.meX, pole->base.regionX);
    worldY = TO_WORLD_POS(me->y, pole->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pole->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        pole->unk3D = 0;
        s->prevVariant = -1;
        s->graphics.anim = SA1_ANIM_RED_FLAG_V;
        s->variant = 0;
        (gCurTask)->main = Task_RedFlag;
    }

    DisplaySprite(s);
}

void CreateEntity_WallPole_Left(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    Task *t = TaskCreate(Task_8077C5C, sizeof(RedFlagPole), 0x2000, 0, TaskDestructor_RedFlag);
    RedFlagPole *pole = TASK_DATA(t);
    Sprite *s = &pole->s;

    pole->base.regionX = regionX;
    pole->base.regionY = regionY;
    pole->base.me = me;
    pole->base.meX = me->x;
    pole->base.id = id;

    pole->data1 = me->d.sData[1];
    pole->unk3D = 0;
    pole->unk3E = 0;
    pole->tuggingPlayerIndex = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    if ((zone == ZONE_1) || (gCurrentLevel == ACT_CHAO_HUNT_A)) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOUNCY_BAR);
        s->graphics.anim = SA1_ANIM_BOUNCY_BAR;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_RED_FLAG_H);
        s->graphics.anim = SA1_ANIM_RED_FLAG_H;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void CreateEntity_WallPole_Right(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    Task *t = TaskCreate(Task_8077C5C, sizeof(RedFlagPole), 0x2000, 0, TaskDestructor_RedFlag);
    RedFlagPole *pole = TASK_DATA(t);
    Sprite *s = &pole->s;

    pole->base.regionX = regionX;
    pole->base.regionY = regionY;
    pole->base.me = me;
    pole->base.meX = me->x;
    pole->base.id = id;

    pole->data1 = me->d.sData[1];
    pole->unk3D = 0;
    pole->unk3E = 0;
    pole->tuggingPlayerIndex = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    if ((zone == ZONE_1) || (gCurrentLevel == ACT_CHAO_HUNT_A)) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOUNCY_BAR);
        s->graphics.anim = SA1_ANIM_BOUNCY_BAR;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_RED_FLAG_H);
        s->graphics.anim = SA1_ANIM_RED_FLAG_H;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1);
}

void Task_8077C5C(void)
{
    RedFlagPole *pole = TASK_DATA(gCurTask);
    Sprite *s = &pole->s;
    MapEntity *me = pole->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pole->base.meX, pole->base.regionX);
    worldY = TO_WORLD_POS(me->y, pole->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (PLAYER_IS_ALIVE) {
        bool32 res = sub_80781E4(pole, s, worldX, worldY);

        if (res) {
            gCurTask->main = Task_8077D1C;
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pole->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8077D1C(void)
{
    s16 arr[15] = {
        1, 1, 1, 1, 1, 1, 1, 1, 16, 7, 7, 7, 7, 7, 7,
    };
    RedFlagPole *pole = TASK_DATA(gCurTask);
    Sprite *s = &pole->s;
    MapEntity *me = pole->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pole->base.meX, pole->base.regionX);
    worldY = TO_WORLD_POS(me->y, pole->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pole->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    {
        Player *p = &PLAYER(pole->tuggingPlayerIndex);
        if (PLAYER_IS_ALIVE) {
            if (pole->unk3D > 6) {
                p->qWorldY -= Q(arr[pole->unk3D]);
            } else {
                p->qWorldY += Q(arr[pole->unk3D]);
            }

            if (++pole->unk3D > 13) {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_100;
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;
                p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                p->charState = CHARSTATE_SPRING_B;
                p->qSpeedAirY = -Q(7.5);
                p->moveState &= ~MOVESTATE_IA_OVERRIDE;

                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                gCurTask->main = Task_8077E9C;
            }
        } else {
            p->moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8077E9C(void)
{
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    RedFlagPole *pole = TASK_DATA(gCurTask);
    Sprite *s = &pole->s;
    MapEntity *me = pole->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pole->base.meX, pole->base.regionX);
    worldY = TO_WORLD_POS(me->y, pole->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pole->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        pole->unk3D = 0;
        s->prevVariant = -1;
        if ((zone == ZONE_1) || (gCurrentLevel == ACT_CHAO_HUNT_A)) {
            s->graphics.anim = SA1_ANIM_BOUNCY_BAR;
            s->variant = 0;
        } else {
            s->graphics.anim = SA1_ANIM_RED_FLAG_H;
            s->variant = 0;
        }

        (gCurTask)->main = Task_8077C5C;
    }

    DisplaySprite(s);
}

// (96.54%) https://decomp.me/scratch/8M1w5
NONMATCH("asm/non_matching/game/sa1/stage/interactables/red_flag__sub_8077FA4.inc",
         bool32 sub_8077FA4(RedFlagPole *pole, Sprite *s, s32 worldX, s32 worldY))
{
    s32 qWorldX;
    u8 *ptrPrevVariant;
#ifndef NON_MATCHING
    register s32 i asm("r9");
    register u8 *ptrItemEffect asm("r8");
    register bool32 result asm("sl") = FALSE;
#else
    s32 i;
    u8 *ptrItemEffect;
    bool32 result = FALSE;
#endif

    i = 0;
    qWorldX = Q(worldX + 15);
    ptrItemEffect = &gPlayer.itemEffect;
    ptrPrevVariant = &s->prevVariant;
    do {
        Player *p = &PLAYER(i);
        u32 res;

        res = Coll_Player_Entity_Intersection(s, worldX, worldY, p);

        if (!(res & 0x80000) || (p->moveState & MOVESTATE_IN_AIR)) {
            continue;
        }

        if (!(p->moveState & MOVESTATE_SPIN_ATTACK) && (p->qSpeedGround >= -Q(3))) {
            continue;
        } else if ((p->moveState & MOVESTATE_SPIN_ATTACK) && (p->qSpeedGround >= -Q(5.25))) {
            continue;
        }

        if (p->moveState & MOVESTATE_FACING_LEFT) {
            u8 itemEffect;
            Player_TransitionCancelFlyingAndBoost(p);
            m4aSongNumStart(SE_POLE);

            p->qWorldX = qWorldX;
            p->moveState |= MOVESTATE_IA_OVERRIDE;
            itemEffect = *ptrItemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
            *ptrItemEffect = itemEffect;

            *ptrPrevVariant = -1;
            s->graphics.anim = SA1_ANIM_RED_FLAG_V;
            s->variant = 1;

            pole->tuggingPlayerIndex = p->playerID;
            pole->unk3E = p->charState;

            p->charState = CHARSTATE_30;

            result = TRUE;
        }
    } while (++i < gNumSingleplayerCharacters);

    return result;
}
END_NONMATCH

// (59.64%) https://decomp.me/scratch/VtSQc
NONMATCH("asm/non_matching/game/sa1/stage/interactables/red_flag__sub_80780B4.inc",
         bool32 sub_80780B4(RedFlagPole *pole, Sprite *s, s32 worldX, s32 worldY))
{
    s32 qWorldX;
    u8 *ptrPrevVariant;
#ifndef NON_MATCHING
    register s32 i asm("r9");
    register u8 *ptrItemEffect asm("r8");
    register bool32 result asm("sl") = FALSE;
#else
    s32 i;
    u8 *ptrItemEffect;
    bool32 result = FALSE;
#endif

    i = 0;
    qWorldX = Q(worldX - 15);
    ptrItemEffect = &gPlayer.itemEffect;
    ptrPrevVariant = &s->prevVariant;
    do {
        Player *p = &PLAYER(i);
        u32 res;

        res = Coll_Player_Entity_Intersection(s, worldX, worldY, p);

        if (!(res & 0x80000) || (p->moveState & MOVESTATE_IN_AIR)) {
            continue;
        }

        if (!(p->moveState & MOVESTATE_SPIN_ATTACK) && (p->qSpeedGround <= +Q(3))) {
            if ((p->qSpeedGround > Q(5.25)) && !(p->moveState & MOVESTATE_FACING_LEFT)) {
                Player_TransitionCancelFlyingAndBoost(p);
                m4aSongNumStart(SE_POLE);
                p->qWorldX = qWorldX;
            } else {
                continue;
            }
        }

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            u8 itemEffect;
            Player_TransitionCancelFlyingAndBoost(p);
            m4aSongNumStart(SE_POLE);

            p->qWorldX = qWorldX;

            p->moveState |= MOVESTATE_IA_OVERRIDE;
            itemEffect = *ptrItemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
            *ptrItemEffect = itemEffect;

            *ptrPrevVariant = -1;
            s->graphics.anim = SA1_ANIM_RED_FLAG_V;
            s->variant = 1;

            pole->tuggingPlayerIndex = p->playerID;
            pole->unk3E = p->charState;

            p->charState = CHARSTATE_30;

            result = TRUE;
        }
    } while (++i < gNumSingleplayerCharacters);

    return result;
}
END_NONMATCH

// (83.63%) https://decomp.me/scratch/cEJMI
NONMATCH("asm/non_matching/game/sa1/stage/interactables/red_flag__sub_80781E4.inc",
         bool32 sub_80781E4(RedFlagPole *pole, Sprite *s, s32 worldX, s32 worldY))
{
    u8 *ptrPrevVariant;
    u8 zone;
    s32 i;
    u8 *ptrItemEffect;
    bool32 result = FALSE;

    i = 0;
    zone = LEVEL_TO_ZONE(gCurrentLevel);
    ptrItemEffect = &gPlayer.itemEffect;
    ptrPrevVariant = &s->prevVariant;
    do {
        Player *p = &PLAYER(i);
        u32 res;
        u8 itemEffect;

        res = Coll_Player_Entity_Intersection(s, worldX, worldY, p);

        if (!(res & 0x80000) || ((p->character == CHARACTER_TAILS || p->character == CHARACTER_KNUCKLES) && (p->SA2_LABEL(unk61) != 0))) {
            continue;
        }

        Player_TransitionCancelFlyingAndBoost(p);
        m4aSongNumStart(SE_POLE);
        p->moveState |= MOVESTATE_IA_OVERRIDE;

        itemEffect = *ptrItemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
        *ptrItemEffect = itemEffect;
        p->qWorldY = Q(worldY + 16);

        if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
            p->qWorldX = Q(worldX - 8);
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        } else {
            p->qWorldX = Q(worldX + 8);
            p->moveState |= MOVESTATE_FACING_LEFT;
        }

        s->prevVariant = -1;
        if ((zone == ZONE_1) || (gCurrentLevel == ACT_CHAO_HUNT_A)) {
            s->graphics.anim = SA1_ANIM_BOUNCY_BAR;
            s->variant = 1;
        } else {
            s->graphics.anim = SA1_ANIM_RED_FLAG_H;
            s->variant = 1;
        }

        pole->tuggingPlayerIndex = p->playerID;
        pole->unk3E = p->charState;

        p->charState = CHARSTATE_31;

        result = TRUE;
    } while (++i < gNumSingleplayerCharacters);

    return result;
}
END_NONMATCH

// Shared with WallPole
void TaskDestructor_RedFlag(Task *t)
{
    RedFlagPole *pole = TASK_DATA(t);
    VramFree(pole->s.graphics.dest);
}