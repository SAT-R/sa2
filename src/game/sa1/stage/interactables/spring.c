#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/collision.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} SpringA;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
} SpringB;

void Task_Spring_Normal_Up(void);
void Task_8021BC0(void);
void Task_8021E70(void);
void Task_Spring_Normal_Down(void);
void Task_Spring_Horizontal(void);
void Task_Spring_Big_Up(void);
void Task_80220FC(void);
void Task_8022354(void);
void Task_Spring_Small_Up(void);
void Task_8022594(void);
void TaskDestructor_Spring(Task *t);

bool32 sub_8022640(Sprite *s, MapEntity *me, SpringA *spring, Player *p);
bool32 sub_8022804(Sprite *s, MapEntity *me, SpringA *spring, Player *p);
bool32 sub_80228D0(Sprite *s, MapEntity *me, SpringA *spring, Player *p);
bool32 sub_8022AB4(Sprite *s, MapEntity *me, SpringB *spring, Player *p);
bool32 sub_8022E14(Sprite *s, MapEntity *me, SpringB *spring, Player *p);

const s16 sData0Accel[4] = { Q(7.5), Q(9.0), Q(10.5), Q(12.0) };

void CreateEntity_Spring_Normal_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spring_Normal_Up, sizeof(SpringA), 0x2000, 0, TaskDestructor_Spring);
    SpringA *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPRING;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;

    if (!(me->d.sData[0] & 0x2)) {
        DmaCopy32(3, &gRefSpriteTables->palettes[288 * sizeof(u16)], &gObjPalette[8 * 16], 16 * sizeof(u16));
        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
        s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(18, 1));
        s->palId = 1;
    } else {
        s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(18, 0));
    }

    UpdateSpriteAnimation(s);
}

void Task_Spring_Normal_Up(void)
{
    SpringA *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;
    Task **t;
    TaskMain func;

    i = 0;
    t = &gCurTask;
    func = Task_8021BC0;
    do {
        bool32 res;

        if (!GRAVITY_IS_INVERTED) {
            res = sub_8022640(s, me, spring, &PLAYER(i));
        } else {
            res = sub_8022804(s, me, spring, &PLAYER(i));
        }

        if (res) {
            (*t)->main = func;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_8021BC0(void)
{
    SpringA *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        if (!GRAVITY_IS_INVERTED) {
            res = sub_8022640(s, me, spring, &PLAYER(i));
        } else {
            res = sub_8022804(s, me, spring, &PLAYER(i));
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 0;
        UpdateSpriteAnimation(s);

        gCurTask->main = Task_Spring_Normal_Up;
    }
    DisplaySprite(s);
}

void CreateEntity_Spring_Normal_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spring_Normal_Down, sizeof(SpringA), 0x2000, 0, TaskDestructor_Spring);
    SpringA *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPRING;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;

    s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(Y_FLIP, 1));

    UpdateSpriteAnimation(s);
}

void Task_Spring_Normal_Down(void)
{
    SpringA *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;
    Task **t;
    TaskMain func;

    i = 0;
    t = &gCurTask;
    func = Task_8021E70;
    do {
        bool32 res;

        if (!GRAVITY_IS_INVERTED) {
            res = sub_8022804(s, me, spring, &PLAYER(i));
        } else {
            res = sub_8022640(s, me, spring, &PLAYER(i));
        }

        if (res) {
            (*t)->main = func;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_8021E70(void)
{
    SpringA *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        if (!GRAVITY_IS_INVERTED) {
            res = sub_8022804(s, me, spring, &PLAYER(i));
        } else {
            res = sub_8022640(s, me, spring, &PLAYER(i));
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 0;
        UpdateSpriteAnimation(s);

        gCurTask->main = Task_Spring_Normal_Down;
    }
    DisplaySprite(s);
}

// NOTE: IA_010 = Left, IA_011 = Right
void CreateEntity_Spring_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spring_Horizontal, sizeof(SpringA), 0x2000, 0, TaskDestructor_Spring);
    SpringA *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPRING;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(18, 0));

    if (gGameMode == 6) {
        // IA__SPRING__LEFT - Multiplayer_Ver
        if (me->index == 8) {
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        }
    } else {
        if (me->index == IA__SPRING__LEFT) {
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        }
    }

    UpdateSpriteAnimation(s);
}

void Task_Spring_Horizontal(void)
{
    SpringA *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        res = sub_80228D0(s, me, spring, &PLAYER(i));

        if (res) {
            gCurTask->main = Task_80220FC;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_80220FC(void)
{
    SpringA *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        sub_80228D0(s, me, spring, &PLAYER(i));

    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 2;
        UpdateSpriteAnimation(s);

        gCurTask->main = Task_Spring_Horizontal;
    }
    DisplaySprite(s);
}

void CreateEntity_Spring_Big_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spring_Big_Up, sizeof(SpringB), 0x2000, 0, TaskDestructor_Spring);
    SpringB *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPRING;
    s->variant = 4;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (gGameMode == 6) {
        // IA__SPRING__LEFT - Multiplayer_Ver
        if (me->index == 10) {
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        }
    } else {
        if (me->index == IA__SPRING__BIG_UPLEFT) {
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        }
    }

    UpdateSpriteAnimation(s);
}

void Task_Spring_Big_Up(void)
{
    SpringB *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        res = sub_8022AB4(s, me, spring, &PLAYER(i));

        if (res) {
            gCurTask->main = Task_8022354;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_8022354(void)
{
    SpringB *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        sub_8022AB4(s, me, spring, &PLAYER(i));

    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 4;
        UpdateSpriteAnimation(s);

        gCurTask->main = Task_Spring_Big_Up;
    }
    DisplaySprite(s);
}

void CreateEntity_Spring_Small_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spring_Small_Up, sizeof(SpringB), 0x2000, 0, TaskDestructor_Spring);
    SpringB *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPRING;
    s->variant = 6;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->index == 14) {
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    }

    UpdateSpriteAnimation(s);
}

void Task_Spring_Small_Up(void)
{
    SpringB *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        res = sub_8022E14(s, me, spring, &PLAYER(i));

        if (res) {
            gCurTask->main = Task_8022594;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_8022594(void)
{
    SpringB *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 i;

    i = 0;
    do {
        bool32 res;

        sub_8022E14(s, me, spring, &PLAYER(i));

    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 6;
        UpdateSpriteAnimation(s);

        gCurTask->main = Task_Spring_Small_Up;
    }
    DisplaySprite(s);
}

// (94.11%) https://decomp.me/scratch/h1tYL
NONMATCH("asm/non_matching/game/sa1/stage/interactables/Spring__sub_8022640.inc",
         bool32 sub_8022640(Sprite *s, MapEntity *me, SpringA *spring, Player *p))
{
#ifndef NON_MATCHING
    register bool32 hitWithHammer asm("sb") = 0;
    register bool32 r6 asm("r6") = FALSE;
#else
    bool32 hitWithHammer = 0;
    bool32 r6 = FALSE;
#endif
    CamCoord worldX, worldY;
    u8 i;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i]; i++) {
            if (i != SIO_MULTI_CNT->id) {
                MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

                if (mpp->unk5C & 0x4) {
                    r6 = TRUE;
                }
            }
            // _080226CE
        }
    }
    // _080226E2

    if (!(p->moveState & MOVESTATE_IA_OVERRIDE) || r6) {
        // _080226F2

        if (!(Coll_Player_Platform(s, worldX, worldY, p) & COLL_FLAG_8)) {
            hitWithHammer = Coll_AmyHammer_Spring(s, worldX, worldY, p);

            if (!hitWithHammer) {
                return FALSE;
            }
        }
        // _08022724

        if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
            p->timerInvulnerability = 2;
        }

        SA2_LABEL(sub_8021BE0)(p);

        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->moveState |= MOVESTATE_IN_AIR;
        p->moveState &= ~MOVESTATE_100;
        p->SA2_LABEL(unk61) = 0;

        if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
            p->qSpeedAirY = -(me->d.uData[1] << 4);
        } else {
            p->qSpeedAirY = -(sData0Accel[me->d.sData[0] & 0x3]);
        }

        if (hitWithHammer) {
            // p->qSpeedAirY * 1.5
            s16 qNewSpeed = (p->qSpeedAirY >> 1);
            qNewSpeed += p->qSpeedAirY;
            p->qSpeedAirY = qNewSpeed;
        }

        if (me->d.sData[0] & 0x1) {
            Player_TransitionCancelFlyingAndBoost(p);
            p->charState = CHARSTATE_SPRING_B;
        } else {
            Player_TransitionCancelFlyingAndBoost(p);
            p->charState = CHARSTATE_17;
        }
        // _080227C0

        p->spriteInfoBody->s.prevVariant = -1;
        s->variant = 1;
        s->prevVariant = -1;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        m4aSongNumStart(SE_SPRING);

        return TRUE;
    }

    return FALSE;
}
END_NONMATCH

bool32 sub_8022804(Sprite *s, MapEntity *me, SpringA *spring, Player *p)
{
    s32 sb = 0;
    bool32 r6 = FALSE;
    CamCoord worldX, worldY;
    u8 i;
    u32 collRes;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    // _080226F2

    collRes = Coll_Player_Platform(s, worldX, worldY, p);
    if (collRes & COLL_FLAG_10000) {
        if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
            p->timerInvulnerability = 2;
        }

        p->moveState |= MOVESTATE_IN_AIR;
        p->moveState &= ~MOVESTATE_100;
        p->SA2_LABEL(unk61) = 0;

        if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
            p->qSpeedAirY = +(me->d.uData[1] << 4);
        } else {
            p->qSpeedAirY = +(sData0Accel[me->d.sData[0] & 0x3]);
        }

        s->variant = 1;
        s->prevVariant = -1;

        m4aSongNumStart(SE_SPRING);

        return TRUE;
    } else if (collRes & 0x28) {
        SA2_LABEL(sub_8021BE0)(p);
    }

    return FALSE;
}

bool32 sub_80228D0(Sprite *s, MapEntity *me, SpringA *spring, Player *p)
{
    s32 sb = 0;
    bool32 r6 = FALSE;
    CamCoord worldX, worldY;
    u8 i;
    u32 collRes;
    s32 iaIndex;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    // _080226F2

    collRes = Coll_Player_Spring_Sideways(s, worldX, worldY, p);
    if (collRes & COLL_FLAG_20000) {
        iaIndex = 10;
        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            iaIndex = 8;
        }

        if (iaIndex == me->index) {
            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 2;
            }

            if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
                p->qSpeedAirX = -(me->d.uData[1] << 4);
                p->qSpeedGround = -(me->d.uData[1] << 4);
            } else {
                p->qSpeedAirX = -(sData0Accel[me->d.sData[0] & 0x3]);
                p->qSpeedGround = -(sData0Accel[me->d.sData[0] & 0x3]);
            }

            Player_TransitionCancelFlyingAndBoost(p);

            if (p->moveState & MOVESTATE_SPIN_ATTACK) {
                p->charState = CHARSTATE_SPINATTACK;
            } else {
                p->charState = CHARSTATE_WALK_A;
            }

            p->rotation = 0;
            p->moveState |= MOVESTATE_FACING_LEFT;

            s->variant = 3;
            s->prevVariant = -1;
            m4aSongNumStart(SE_SPRING);

            return TRUE;
        } else {
            SA2_LABEL(sub_8021BE0)(p);

            if (!(collRes & 0x20)) {
                return FALSE;
            }

            p->moveState |= 0x20;
            p->qSpeedAirX = Q(0);
            p->qSpeedGround = Q(0);
        }
    } else {
        if (!(collRes & COLL_FLAG_40000)) {
            return FALSE;
        }

        iaIndex = 11;
        if (gGameMode == 6) {
            iaIndex = 9;
        }

        if (iaIndex == me->index) {
            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 2;
            }

            if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
                p->qSpeedAirX = +(me->d.uData[1] << 4);
                p->qSpeedGround = +(me->d.uData[1] << 4);
            } else {
                p->qSpeedAirX = +(sData0Accel[me->d.sData[0] & 0x3]);
                p->qSpeedGround = +(sData0Accel[me->d.sData[0] & 0x3]);
            }

            Player_TransitionCancelFlyingAndBoost(p);

            if (p->moveState & MOVESTATE_SPIN_ATTACK) {
                p->charState = CHARSTATE_SPINATTACK;
            } else {
                p->charState = CHARSTATE_WALK_A;
            }

            p->rotation = 0;
            p->moveState &= ~MOVESTATE_FACING_LEFT;

            s->variant = 3;
            s->prevVariant = -1;
            m4aSongNumStart(SE_SPRING);

            return TRUE;
        } else {
            SA2_LABEL(sub_8021BE0)(p);

            if (!(collRes & 0x20)) {
                return FALSE;
            }

            p->moveState |= 0x20;
            p->qSpeedAirX = Q(0);
            p->qSpeedGround = Q(0);
        }
    }

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    return FALSE;
}

bool32 sub_8022AB4(Sprite *s, MapEntity *me, SpringB *spring, Player *p)
{
    u8 arr[4] = { -(p->spriteOffsetX + 6), -(p->spriteOffsetY + 1), +(p->spriteOffsetX + 6), +(p->spriteOffsetY + 1) };
    s32 sb = 0;
    bool32 r6 = FALSE;
    CamCoord worldX, worldY;
    u8 i;
    bool32 hitWithHammer;
    s32 iaIndex;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (p->moveState & MOVESTATE_DEAD) {
        return FALSE;
    }

    hitWithHammer = Coll_AmyHammer_Spring(s, worldX, worldY, p);

    if (hitWithHammer || HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), (*((Rect8 *)&arr)))) {
        iaIndex = IA__SPRING__BIG_UPLEFT;

        p->moveState &= ~MOVESTATE_SPIN_ATTACK;
        p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            // IA__SPRING__BIG_UPLEFT - Multiplayer
            iaIndex = 10;
        }

        if ((iaIndex == me->index) && (hitWithHammer || (worldX - ({ I(p->qWorldX) + 20; })) > 0)) {
            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 2;
            }

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->moveState &= ~MOVESTATE_100;
            p->SA2_LABEL(unk61) = 0;

            if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
                p->qSpeedAirY = -(me->d.uData[1] << 4);
                p->qSpeedAirX = -(me->d.uData[1] << 4);
            } else {
                p->qSpeedAirY = -(sData0Accel[me->d.sData[0] & 0x3]);
                p->qSpeedAirX = -(sData0Accel[me->d.sData[0] & 0x3]);
            }

            if (hitWithHammer) {
                // qSpeedAirX|Y *= 1.5
                p->qSpeedAirX = p->qSpeedAirX + (p->qSpeedAirX >> 1);
                p->qSpeedAirY = p->qSpeedAirY + (p->qSpeedAirY >> 1);
            }

            if (GRAVITY_IS_INVERTED) {
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            if (me->d.sData[0] & 0x1) {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_SPRING_B;
            } else {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_17;
            }

            p->spriteInfoBody->s.prevVariant = -1;
            s->variant = 5;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            m4aSongNumStart(SE_SPRING);

            return TRUE;
        } else if (hitWithHammer || worldX - I(p->qWorldX) + 20 < 0) {
            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 2;
            }

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->moveState &= ~MOVESTATE_100;
            p->SA2_LABEL(unk61) = 0;

            if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
                p->qSpeedAirY = -(me->d.uData[1] << 4);
                p->qSpeedAirX = +(me->d.uData[1] << 4);
            } else {
                p->qSpeedAirY = -(sData0Accel[me->d.sData[0] & 0x3]);
                p->qSpeedAirX = +(sData0Accel[me->d.sData[0] & 0x3]);
            }

            if (hitWithHammer) {
                // qSpeedAirX|Y *= 1.5
                p->qSpeedAirX = p->qSpeedAirX + (p->qSpeedAirX >> 1);
                p->qSpeedAirY = p->qSpeedAirY + (p->qSpeedAirY >> 1);
            }

            if (GRAVITY_IS_INVERTED) {
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            if (me->d.sData[0] & 0x1) {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_SPRING_B;
            } else {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_17;
            }

            p->spriteInfoBody->s.prevVariant = -1;
            s->variant = 5;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            m4aSongNumStart(SE_SPRING);

            return TRUE;
        } else {
            Coll_Player_Platform(s, worldX, worldY, p);
        }
    } else {
        Coll_Player_Platform(s, worldX, worldY, p);
    }

    return FALSE;
}

bool32 sub_8022E14(Sprite *s, MapEntity *me, SpringB *spring, Player *p)
{
    u8 arr[4] = { -(p->spriteOffsetX + 6), -(p->spriteOffsetY + 1), +(p->spriteOffsetX + 6), +(p->spriteOffsetY + 1) };
    s32 sb = 0;
    bool32 r6 = FALSE;
    CamCoord worldX, worldY;
    u8 i;
    bool32 hitWithHammer;
    s32 iaIndex;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (p->moveState & MOVESTATE_DEAD) {
        return FALSE;
    }

    hitWithHammer = Coll_AmyHammer_Spring(s, worldX, worldY, p);

    if (hitWithHammer || HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), (*((Rect8 *)&arr)))) {
        p->moveState &= ~MOVESTATE_SPIN_ATTACK;
        p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

        iaIndex = IA__SPRING__SMALL_UPLEFT;

        if ((iaIndex == me->index) && (hitWithHammer || (worldX - ({ I(p->qWorldX) + 20; })) > 0)) {
            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 2;
            }

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->moveState &= ~MOVESTATE_100;
            p->SA2_LABEL(unk61) = 0;

            if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
                p->qSpeedAirY = -(me->d.uData[1] << 4);
                p->qSpeedAirX = -(me->d.uData[1] << 4);
            } else {
                p->qSpeedAirY = -(sData0Accel[me->d.sData[0] & 0x3]);
                p->qSpeedAirX = -(sData0Accel[me->d.sData[0] & 0x3]);
            }

            if (hitWithHammer) {
                // qSpeedAirX|Y *= 1.5
                p->qSpeedAirX = p->qSpeedAirX + (p->qSpeedAirX >> 1);
                p->qSpeedAirY = p->qSpeedAirY + (p->qSpeedAirY >> 1);
            }

            if (GRAVITY_IS_INVERTED) {
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            if (me->d.sData[0] & 0x1) {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_SPRING_B;
            } else {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_17;
            }

            p->spriteInfoBody->s.prevVariant = -1;
            s->variant = 7;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            m4aSongNumStart(SE_SPRING);

            return TRUE;
        } else if (hitWithHammer || worldX - I(p->qWorldX) + 20 < 0) {
            if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                p->timerInvulnerability = 2;
            }

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->moveState &= ~MOVESTATE_100;
            p->SA2_LABEL(unk61) = 0;

            if (me->d.sData[0] >= (s32)ARRAY_COUNT(sData0Accel)) {
                p->qSpeedAirY = -(me->d.uData[1] << 4);
                p->qSpeedAirX = +(me->d.uData[1] << 4);
            } else {
                p->qSpeedAirY = -(sData0Accel[me->d.sData[0] & 0x3]);
                p->qSpeedAirX = +(sData0Accel[me->d.sData[0] & 0x3]);
            }

            if (hitWithHammer) {
                // qSpeedAirX|Y *= 1.5
                p->qSpeedAirX = p->qSpeedAirX + (p->qSpeedAirX >> 1);
                p->qSpeedAirY = p->qSpeedAirY + (p->qSpeedAirY >> 1);
            }

            if (GRAVITY_IS_INVERTED) {
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            if (me->d.sData[0] & 0x1) {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_SPRING_B;
            } else {
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_17;
            }

            p->spriteInfoBody->s.prevVariant = -1;
            s->variant = 7;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            m4aSongNumStart(SE_SPRING);

            return TRUE;
        } else {
            Coll_Player_Platform(s, worldX, worldY, p);
        }
    } else {
        Coll_Player_Platform(s, worldX, worldY, p);
    }

    return FALSE;
}

void TaskDestructor_Spring(Task *t)
{
    SpringA *spring = TASK_DATA(t);
    VramFree(spring->s.graphics.dest);
}