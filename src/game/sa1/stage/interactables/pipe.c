#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ u8 unk58;
    /* 0x59 */ u8 unk59;
} PipeEntrance;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F;
    /* 0x40 */ u16 unk40;
} PipeExit;

void Task_PipeEntrance(void);
void Task_8095D28(void);
void Task_8095E90(void);
void TaskDestructor_PipeEntrance(Task *t);
void Task_PipeExit(void);
void Task_809656C(void);
void Task_8096724(void);
void TaskDestructor_PipeExit(Task *t);

void CreateEntity_PipeEntrance(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    s32 i;

    i = 0;
    do {
        Task *t = TaskCreate(Task_PipeEntrance, sizeof(PipeEntrance), me->d.uData[3] | 0x2000, 0, TaskDestructor_PipeEntrance);
        PipeEntrance *pipe = TASK_DATA(t);
        Sprite *s = &pipe->s;

        pipe->base.regionX = regionX;
        pipe->base.regionY = regionY;
        pipe->base.me = me;
        pipe->base.meX = me->x;
        pipe->base.id = id;

        pipe->unk3C = i;
        pipe->unk3E = 20;
        pipe->unk3F = 0;

        pipe->unk40 = 0;
        pipe->unk44 = 0;
        pipe->unk50 = 0;
        pipe->unk54 = 0;

        pipe->unk48 = me->d.sData[0] * TILE_WIDTH;
        pipe->unk4C = me->d.sData[1] * TILE_WIDTH;

        pipe->unk58 = 0;
        pipe->unk3D = me->d.uData[3];
        pipe->unk59 = me->d.uData[2];

        // NOTE: Initializing sprite pos to world pos
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        if (pipe->unk59 == 0 || pipe->unk59 == 1) {
            s->frameFlags = 0;

            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
                if ((gCurrentLevel & 0x1) != ACT_1) {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_ENTER_6_2_V) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_ENTER_6_2_V;

                    s->variant = 0;

                    if (pipe->unk59 == 0) {
                        SPRITE_FLAG_SET(s, Y_FLIP);
                    }
                } else {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_ENTER_6_1_V) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_ENTER_6_1_V;

                    s->variant = 0;

                    if (pipe->unk59 != 0) {
                        SPRITE_FLAG_SET(s, Y_FLIP);
                    }
                }
            } else {
                s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_GATE_2_V) : NULL;
                s->graphics.anim = SA1_ANIM_PIPE_GATE_2_V;

                s->variant = 0;

                if (pipe->unk59 != 0) {
                    SPRITE_FLAG_SET(s, Y_FLIP);
                }
            }

            s->oamFlags = SPRITE_OAM_ORDER(5);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
        } else {
            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
                if ((gCurrentLevel & 0x1) != ACT_1) {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_ENTER_6_2_H) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_ENTER_6_2_H;

                    s->variant = 0;
                } else {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_ENTER_6_1_H) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_ENTER_6_1_H;

                    s->variant = 0;
                }
            } else {
                s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_GATE_2_H) : NULL;
                s->graphics.anim = SA1_ANIM_PIPE_GATE_2_H;

                s->variant = 0;
            }

            s->oamFlags = SPRITE_OAM_ORDER(5);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0;

            if ((pipe->unk59 & 0x1) != 0) {
                s->frameFlags = SPRITE_FLAG(X_FLIP, 1);
            }
        }

        if (i != 0) {
            s->frameFlags |= (SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_19);
        }

        UpdateSpriteAnimation(s);
    } while (++i < gNumSingleplayerCharacters);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void Task_PipeEntrance(void)
{
    s32 qPlayerX, qPlayerY;
    s16 screenX, screenY;
    s32 collided;
    MapEntity *me;
    Sprite *s;
    CamCoord worldX;
    CamCoord worldY;
    Player *p;
    PipeEntrance *pipe;
    u32 mask;
    u32 res;
    pipe = TASK_DATA(gCurTask);
    me = pipe->base.me;
    s = &pipe->s;
    p = &PLAYER(pipe->unk3C);

    worldX = TO_WORLD_POS(pipe->base.meX, pipe->base.regionX);
    worldY = TO_WORLD_POS(me->y, pipe->base.regionY);
    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    collided = 0;

    if (IS_ALIVE(p)) {
        if (pipe->unk59 == 0 || pipe->unk59 == 1) {
            qPlayerX = p->qWorldX;
            qPlayerY = p->qWorldY;

            if (pipe->unk59 != 0) {
                if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_2)) {
                    if (GRAVITY_IS_INVERTED) {
                        mask = 0x100008;
                    } else {
                        mask = 0x10000;
                    }

                    if (Coll_Player_Platform(s, worldX, worldY, p) & mask) {
                        collided = 1;
                    }
                } else {
                    if (GRAVITY_IS_INVERTED) {
                        mask = 0x10000;
                    } else {
                        mask = 0x100008;
                    }

                    if (Coll_Player_Platform(s, worldX, worldY, p) & mask) {
                        collided = 1;
                    }
                }
            } else {
                if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_2)) {
                    if (GRAVITY_IS_INVERTED) {
                        mask = 0x10000;
                    } else {
                        mask = 0x100008;
                    }

                    if (Coll_Player_Platform(s, worldX, worldY, p) & mask) {
                        collided = 1;
                    }
                } else {
                    if (GRAVITY_IS_INVERTED) {
                        mask = 0x100008;
                    } else {
                        mask = 0x10000;
                    }

                    if (Coll_Player_Platform(s, worldX, worldY, p) & mask) {
                        collided = 1;
                    }
                }
            }

            if (collided) {
                Player_TransitionCancelFlyingAndBoost(p);
                pipe->unk3F = 90;
                p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                p->moveState &= ~MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_100;
                p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                p->moveState &= ~MOVESTATE_20;
                p->moveState |= MOVESTATE_SPIN_ATTACK;
                p->moveState |= MOVESTATE_IA_OVERRIDE;

                p->qWorldX = qPlayerX;
                p->qWorldY = qPlayerY;
                p->charState = CHARSTATE_SPINATTACK;
                p->qSpeedAirY = Q(0);
                p->qSpeedAirX = Q(0);
                p->qSpeedGround = Q(0);
                p->SA2_LABEL(unk99)[0] = 0;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

                gCurTask->main = Task_8095D28;
                p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
            }
        } else {
            qPlayerX = p->qWorldX;
            qPlayerY = p->qWorldY;

            res = Coll_Player_Platform(s, worldX, worldY, p);

            if (res & 0x60000) {
                if ((res & 0x40000) && pipe->unk59 == 2) {
                    Player_TransitionCancelFlyingAndBoost(p);
                    pipe->unk3F = 90;
                    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    p->moveState |= MOVESTATE_IN_AIR;
                    p->moveState &= ~MOVESTATE_100;
                    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    p->moveState &= ~MOVESTATE_20;
                    p->moveState |= MOVESTATE_SPIN_ATTACK;
                    p->moveState |= MOVESTATE_IA_OVERRIDE;

                    p->qWorldX = qPlayerX;
                    p->qWorldY = qPlayerY;
                    p->charState = CHARSTATE_SPINATTACK;
                    p->qSpeedAirY = Q(0);
                    p->qSpeedAirX = Q(0);
                    p->qSpeedGround = Q(0);

                    p->SA2_LABEL(unk99)[0] = 0;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

                    gCurTask->main = Task_8095D28;
                    p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                } else if ((res & 0x20000) && pipe->unk59 == 3) {
                    pipe->unk3F = 90;
                    Player_TransitionCancelFlyingAndBoost(p);
                    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    p->moveState |= MOVESTATE_IN_AIR;
                    p->moveState &= ~MOVESTATE_100;
                    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    p->moveState &= ~MOVESTATE_20;
                    p->moveState |= MOVESTATE_SPIN_ATTACK;
                    p->moveState |= MOVESTATE_IA_OVERRIDE;

                    p->qWorldX = qPlayerX;
                    p->qWorldY = qPlayerY;
                    p->charState = CHARSTATE_SPINATTACK;
                    p->qSpeedAirY = Q(0);
                    p->qSpeedAirX = Q(0);
                    p->qSpeedGround = Q(0);

                    p->SA2_LABEL(unk99)[0] = 0;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

                    gCurTask->main = Task_8095D28;
                    p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                }
            }
        }
    } else {
        Player_TransitionCancelFlyingAndBoost(p);
        p->moveState |= MOVESTATE_DEAD; // NOTE: This OR is redundant...
        p->charState = CHARSTATE_DEAD;
    }

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        if (pipe->unk58) {
            p->moveState &= ~MOVESTATE_IA_OVERRIDE;
        }

        if (pipe->unk3C == 0) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, pipe->base.meX);
        }
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);

    if (pipe->unk3C == 0) {
        DisplaySprite(s);
    }
}

void Task_8095D28(void)
{
    PipeEntrance *pipe = TASK_DATA(gCurTask);
    MapEntity *me = pipe->base.me;
    Sprite *s = &pipe->s;
    Player *p = &PLAYER(pipe->unk3C);
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pipe->base.meX, pipe->base.regionX);
    worldY = TO_WORLD_POS(me->y, pipe->base.regionY);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_ALIVE(p)) {
        if (pipe->unk3F != 0) {
            if (p->qWorldY != Q(worldY)) {
                if (p->qWorldY < Q(worldY)) {
                    p->qWorldY += Q(1.5);

                    if (p->qWorldY > Q(worldY)) {
                        p->qWorldY = Q(worldY);
                    }
                } else {
                    p->qWorldY -= Q(1.5);

                    if (p->qWorldY < Q(worldY)) {
                        p->qWorldY = Q(worldY);
                    }
                }
            }

            if (p->qWorldX != Q(worldX)) {
                if (p->qWorldX < Q(worldX)) {
                    p->qWorldX += Q(1.5);

                    if (p->qWorldX > Q(worldX)) {
                        p->qWorldX = Q(worldX);
                    }
                } else {
                    p->qWorldX -= Q(1.5);

                    if (p->qWorldX < Q(worldX)) {
                        p->qWorldX = Q(worldX);
                    }
                }
            }

            if (--pipe->unk3F == 45) {
                m4aSongNumStart(SE_SPIN_ATTACK);
            }
        } else {
            pipe->unk40 = worldX;
            pipe->unk44 = worldY;

            pipe->unk58 = 1;

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gCurTask->main = Task_8095E90;
        }

        Player_TransitionCancelFlyingAndBoost(p);
        p->charState = CHARSTATE_SPINATTACK;
    } else {
        p->moveState &= ~MOVESTATE_IA_OVERRIDE;
    }

    UpdateSpriteAnimation(s);

    if (pipe->unk3C == 0) {
        DisplaySprite(s);
    }
}

void Task_8095E90(void)
{
    Sprite *s;
    s16 screenX, screenY;
    CamCoord worldX, worldY;
    Player *p;
    s32 test;
    PipeEntrance *pipe = TASK_DATA(gCurTask);
    MapEntity *me = pipe->base.me;
    s = &pipe->s;

    p = &PLAYER(pipe->unk3C);

    worldX = TO_WORLD_POS(pipe->base.meX, pipe->base.regionX);
    worldY = TO_WORLD_POS(me->y, pipe->base.regionY);
    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (pipe->unk58) {
        if (IS_ALIVE(p)) {
            if (p->SA2_LABEL(unk99)[0] == pipe->unk3D) {
                s32 r6 = Div(pipe->unk48 * pipe->unk3F, pipe->unk3E);
                s32 res2 = Div(pipe->unk4C * pipe->unk3F, pipe->unk3E);

                p->qWorldX = Q(pipe->unk40 + r6);
                p->qWorldY = Q(pipe->unk44 + res2);

                p->qSpeedAirY = p->qWorldY - pipe->unk54;
                p->qSpeedGround = p->qWorldX - pipe->unk50;
                p->qSpeedAirX = p->qSpeedGround;

                pipe->unk3F++;

                if ((I(p->qWorldX) == pipe->unk40 + pipe->unk48) && (I(p->qWorldY) == pipe->unk44 + pipe->unk4C)) {
                    if (p->SA2_LABEL(unk99)[0] == pipe->unk3D) {
                        p->moveState &= ~MOVESTATE_IA_OVERRIDE;
                        gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                    }

                    pipe->unk58 = 0;
                    p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

                } else {
                    Player_TransitionCancelFlyingAndBoost(p);
                    do {
                        p->moveState |= MOVESTATE_IA_OVERRIDE;

                        p->charState = CHARSTATE_SPINATTACK;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                    } while (0);

                    pipe->unk58 = 1;
                }

                pipe->unk50 = p->qWorldX;
                pipe->unk54 = p->qWorldY;
            } else {
                pipe->unk58 = 0;
            }
        } else {
            pipe->unk58 = 0;
            p->moveState &= ~MOVESTATE_IA_OVERRIDE;
        }
    } else {
        gCurTask->main = Task_PipeEntrance;

        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            if (pipe->unk58) {
                if (p->SA2_LABEL(unk99)[0] == pipe->unk3D) {
                    p->moveState &= ~MOVESTATE_IA_OVERRIDE;
                    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                }
            }

            if (pipe->unk3C == 0) {
                SET_MAP_ENTITY_NOT_INITIALIZED(me, pipe->base.meX);
            }
            TaskDestroy(gCurTask);
            return;
        }
    }

    UpdateSpriteAnimation(s);

    if (pipe->unk3C == 0) {
        DisplaySprite(s);
    }
}

void TaskDestructor_PipeEntrance(Task *t)
{
    PipeEntrance *pipe = TASK_DATA(t);

    if (pipe->unk3C == 0) {
        VramFree(pipe->s.graphics.dest);
    }
}

void CreateEntity_PipeExit(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    s32 i;

    i = 0;
    do {
        Task *t = TaskCreate(Task_PipeExit, sizeof(PipeExit), me->d.uData[3] | 0x2000, 0, TaskDestructor_PipeExit);
        PipeExit *pipe = TASK_DATA(t);
        Sprite *s = &pipe->s;

        pipe->base.regionX = regionX;
        pipe->base.regionY = regionY;
        pipe->base.me = me;
        pipe->base.meX = me->x;
        pipe->base.id = id;

        pipe->unk3C = i;
        pipe->unk3E = 0;
        pipe->unk3D = me->d.uData[3];
        pipe->unk3F = me->d.uData[2];
        pipe->unk40 = (me->d.sData[1] * TILE_WIDTH) * 8;

        // NOTE: Initializing sprite pos to world pos
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        s->oamFlags = SPRITE_OAM_ORDER(5);

        if (pipe->unk3F == 0 || pipe->unk3F == 1) {
            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
                if ((gCurrentLevel & 0x1) != ACT_1) {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_ENTER_6_2_V) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_ENTER_6_2_V;
                    s->variant = 1;
                } else {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_EXIT_6_1_V) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_EXIT_6_1_V;
                    s->variant = 0;
                }
            } else {
                s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_GATE_2_V) : NULL;
                s->graphics.anim = SA1_ANIM_PIPE_GATE_2_V;
                s->variant = 1;
            }

            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 0);

            if (pipe->unk3F != 0) {
                SPRITE_FLAG_SET(s, Y_FLIP);
            }
        } else {
            if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
                if ((gCurrentLevel & 0x1) != ACT_1) {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_ENTER_6_2_H) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_ENTER_6_2_H;
                    s->variant = 1;
                } else {
                    s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_EXIT_6_1_H) : NULL;
                    s->graphics.anim = SA1_ANIM_PIPE_EXIT_6_1_H;
                    s->variant = 0;
                }
            } else {
                s->graphics.dest = (i == 0) ? ALLOC_TILES(SA1_ANIM_PIPE_GATE_2_H) : NULL;
                s->graphics.anim = SA1_ANIM_PIPE_GATE_2_H;
                s->variant = 1;
            }

            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0;

            if ((pipe->unk3F & 0x1) != 0) {
                s->frameFlags = SPRITE_FLAG(X_FLIP, 1);
            }
        }

        if (i != 0) {
            s->frameFlags |= (SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_19);
        }

        UpdateSpriteAnimation(s);
    } while (++i < gNumSingleplayerCharacters);

    SET_MAP_ENTITY_INITIALIZED(me);
}

// (98.25%) https://decomp.me/scratch/rvdlH
NONMATCH("asm/non_matching/game/sa1/stage/interactables/pipe__Task_PipeExit.inc", void Task_PipeExit(void))
{
    Sprite *s;
    s16 screenX, screenY;
    CamCoord worldX, worldY;
    PipeEntrance *pipe;
    s32 test;
    Player *p;
    MapEntity *me;
#ifndef NON_MATCHING
    register SpriteBase *base asm("r3");
#else
    SpriteBase *base;
#endif

    pipe = TASK_DATA(gCurTask);
    me = pipe->base.me;

    s = &pipe->s;

    p = &PLAYER(pipe->unk3C);

    base = &pipe->base;

    worldX = TO_WORLD_POS(base->meX, base->regionX);
    worldY = TO_WORLD_POS(me->y, base->regionY);
    screenX = worldX - gCamera.x;
    s->x = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    s->y = worldY - gCamera.y;

    if (IS_ALIVE(p)) {
        if (p->moveState & MOVESTATE_IA_OVERRIDE) {
            if (p->SA2_LABEL(unk99)[0] < pipe->unk3D) {
                if (Coll_Player_Entity_Intersection(s, worldX, worldY, p)) {
                    pipe->unk3E = 0;
                    Player_TransitionCancelFlyingAndBoost(p);
                    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    p->moveState &= ~MOVESTATE_IN_AIR;
                    p->moveState &= ~MOVESTATE_100;
                    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    p->moveState &= ~MOVESTATE_20;
                    p->moveState |= MOVESTATE_SPIN_ATTACK;
                    p->moveState |= MOVESTATE_IA_OVERRIDE;

                    p->charState = CHARSTATE_SPINATTACK;

                    p->qWorldY = Q(worldY);
                    p->qWorldX = Q(worldX);
                    p->qSpeedAirY = Q(0);
                    p->qSpeedAirX = Q(0);
                    p->qSpeedGround = Q(0);
                    p->heldInput = 0;
                    p->frameInput = 0;
                    p->SA2_LABEL(unk99)[0] = 0x7F;

                    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

                    gCurTask->main = Task_809656C;
                    p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                }
            }
        } else {
            Coll_Player_Platform(s, worldX, worldY, p);
        }
    } else {
        Player_TransitionCancelFlyingAndBoost(p);
        p->moveState |= MOVESTATE_DEAD; // NOTE: This OR is redundant...
        p->charState = CHARSTATE_DEAD;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        if (pipe->unk3C == 0) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, pipe->base.meX);
        }
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);

    if (pipe->unk3C == 0) {
        DisplaySprite(s);
    }
}
END_NONMATCH

void Task_809656C(void)
{
    PipeExit *pipe = TASK_DATA(gCurTask);
    MapEntity *me = pipe->base.me;
    Sprite *s = &pipe->s;
    Player *p = &PLAYER(pipe->unk3C);
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(pipe->base.meX, pipe->base.regionX);
    worldY = TO_WORLD_POS(me->y, pipe->base.regionY);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_ALIVE(p)) {
        if (pipe->unk3E != 0) {
            if (p->qWorldY != Q(worldY)) {
                if (p->qWorldY < Q(worldY)) {
                    p->qWorldY += Q(1.5);

                    if (p->qWorldY > Q(worldY)) {
                        p->qWorldY = Q(worldY);
                    }
                } else {
                    p->qWorldY -= Q(1.5);

                    if (p->qWorldY < Q(worldY)) {
                        p->qWorldY = Q(worldY);
                    }
                }
            }

            if (p->qWorldX != Q(worldX)) {
                if (p->qWorldX < Q(worldX)) {
                    p->qWorldX += Q(1.5);

                    if (p->qWorldX > Q(worldX)) {
                        p->qWorldX = Q(worldX);
                    }
                } else {
                    p->qWorldX -= Q(1.5);

                    if (p->qWorldX < Q(worldX)) {
                        p->qWorldX = Q(worldX);
                    }
                }
            }

            --pipe->unk3E;
        } else {
            if (pipe->unk3F == 0 || pipe->unk3F == 1) {
                if (pipe->unk3F & 0x1) {
                    p->qSpeedAirY = -pipe->unk40;
                    p->qSpeedAirX = 0;
                    p->qSpeedGround = 0;
                } else {
                    p->qSpeedAirY = +pipe->unk40;
                    p->qSpeedAirX = 0;
                    p->qSpeedGround = 0;
                }

                pipe->unk3E = 15;
            } else {
                if (pipe->unk3F & 0x1) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                    p->qSpeedAirY = 0;
                    p->qSpeedAirX = -pipe->unk40;
                    p->qSpeedGround = -pipe->unk40;
                } else {
                    p->moveState &= ~MOVESTATE_FACING_LEFT;
                    p->qSpeedAirY = 0;
                    p->qSpeedAirX = +pipe->unk40;
                    p->qSpeedGround = +pipe->unk40;
                }
                pipe->unk3E = 15;
            }

            gCurTask->main = Task_8096724;
        }

        Player_TransitionCancelFlyingAndBoost(p);
        p->charState = CHARSTATE_SPINATTACK;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    UpdateSpriteAnimation(s);

    if (pipe->unk3C == 0) {
        DisplaySprite(s);
    }
}

void Task_8096724(void)
{
    PipeExit *pipe = TASK_DATA(gCurTask);
    MapEntity *me = pipe->base.me;
    Sprite *s = &pipe->s;
    Player *p = &PLAYER(pipe->unk3C);
    CamCoord worldX, worldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(pipe->base.meX, pipe->base.regionX);
    worldY = TO_WORLD_POS(me->y, pipe->base.regionY);
    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (pipe->unk3E != 0) {
        if (IS_ALIVE(p)) {
            pipe->unk3E--;
            p->qWorldX += p->qSpeedAirX;
            p->qWorldY += p->qSpeedAirY;

            if (pipe->unk3E == 0) {
                p->moveState &= ~MOVESTATE_IGNORE_INPUT;
                p->heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                p->SA2_LABEL(unk99)[0] = 0x7F;
                p->moveState &= ~MOVESTATE_IA_OVERRIDE;
                p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
            }
        }
    } else {
        gCurTask->main = Task_PipeExit;

        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            if (pipe->unk3C == 0) {
                SET_MAP_ENTITY_NOT_INITIALIZED(me, pipe->base.meX);
            }
            TaskDestroy(gCurTask);
            return;
        }
    }

    UpdateSpriteAnimation(s);

    if (pipe->unk3C == 0) {
        DisplaySprite(s);
    }
}

void TaskDestructor_PipeExit(Task *t)
{
    PipeExit *pipe = TASK_DATA(t);

    if (pipe->unk3C == 0) {
        VramFree(pipe->s.graphics.dest);
    }
}