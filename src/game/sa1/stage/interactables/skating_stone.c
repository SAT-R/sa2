#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/stage/stage_ui.h" // for sub_80549FC

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

/* Platform that falls and slides once the player steps on it */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[0x60];
    /* 0x9C */ s32 unk9C;
    /* 0xA0 */ s32 qUnkA0;
    /* 0xA4 */ s32 qUnkA4;
    /* 0xA8 */ s32 qUnkA8;
    /* 0xAC */ s32 qUnkAC;
    /* 0xB0 */ u8 unkB0;
    /* 0xB1 */ u8 unkB1;
    /* 0xB2 */ u8 unkB2;
    /* 0xB3 */ u8 unkB3;
} SkatingStone;

typedef struct {
    /* 0x00 */ Sprite s[4];
    /* 0xC0 */ SpriteTransform transform[4];
    /* 0xF0 */ u16 unkF0;
    /* 0xF2 */ s16 qUnkF2;
} SkatingStoneDebris; /* 0xF4 */

void Task_SkatingStoneInit(void);
void Task_SkatingStone2(void);
void CreateSkatingStoneDebris(CamCoord worldX, CamCoord worldY);
void Task_SkatingStoneDebris(void);
void TaskDestructor_SkatingStone(struct Task *t);
void TaskDestructor_SkatingStoneDebris(struct Task *t);

void CreateEntity_SkatingStone(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_SkatingStoneInit, sizeof(SkatingStone), 0x2000, 0, TaskDestructor_SkatingStone);
    SkatingStone *stone = TASK_DATA(t);
    Sprite *s = &stone->s;

    stone->base.regionX = regionX;
    stone->base.regionY = regionY;
    stone->base.me = me;
    stone->base.meX = me->x;
    stone->base.id = id;

    stone->unk9C = 0;
    stone->qUnkA0 = 0;
    stone->qUnkA4 = 0;
    stone->qUnkA8 = 0;
    stone->qUnkAC = 0;
    stone->unkB0 = 0;
    stone->unkB1 = me->d.sData[0];
    stone->unkB2 = 0;
    stone->unkB3 = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_4) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SKATING_STONE_4);
        s->graphics.anim = SA1_ANIM_SKATING_STONE_4;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SKATING_STONE);
        s->graphics.anim = SA1_ANIM_SKATING_STONE;
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

    UpdateSpriteAnimation(s);
}

void Task_SkatingStoneInit(void)
{
    bool32 sl = FALSE;
    SkatingStone *stone = TASK_DATA(gCurTask);
    Sprite *s = &stone->s;
    CamCoord worldX, worldY;
    MapEntity *me = stone->base.me;
    s32 i;

    worldX = TO_WORLD_POS(stone->base.meX, stone->base.regionX);
    worldY = TO_WORLD_POS(me->y, stone->base.regionY);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (sub_80549FC()) {
                if (PLAYER(i).qWorldY > Q(worldY)) {
                    if (PLAYER(i).charState != CHARSTATE_73) {
                        if (Coll_Player_SkatingStone(s, worldX, worldY, &PLAYER(i)) & COLL_FLAG_10000) {
                            PLAYER(i).qWorldY = Q(worldY + 6);
                        }
                    }
                } else {
                    if (PLAYER(i).charState != CHARSTATE_72) {
                        Coll_Player_SkatingStone(s, worldX, worldY, &PLAYER(i));
                    }
                }
            } else {
                if (Coll_Player_SkatingStone(s, worldX, worldY, &PLAYER(i)) & COLL_FLAG_8) {
                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                    PLAYER(i).moveState &= ~MOVESTATE_100;
                    PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                    PLAYER(i).qWorldY = Q(worldY) - Q(44);

                    SetBit(stone->unkB2, i);
                    stone->qUnkA0 = 0;
                    stone->qUnkA4 = 0;
                    stone->qUnkA8 = 0;
                    stone->qUnkAC = 0;

                    sl = TRUE;

                    if (IS_MULTI_PLAYER) {
                        RoomEvent_PlatformChange *roomEvent = CreateRoomEvent();
                        roomEvent->type = sl;
                        roomEvent->x = stone->base.regionX;
                        roomEvent->y = stone->base.regionY;
                        roomEvent->id = stone->base.id;
                        roomEvent->action = 1;
                    } else {
                        continue;
                    }
                }
            }
        }

        if (IS_MULTI_PLAYER) {
            if ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE) {
                sl = TRUE;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (sl) {
        gCurTask->main = Task_SkatingStone2;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, stone->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_SkatingStone2(void)
{
    Sprite *s;
    MapEntity *me;
    SkatingStone *stone;
    CamCoord worldX, worldY;
    u8 sp08;
    s32 i;
    s32 res;
    u8 layer;
    layer = PLAYER_LAYER__FRONT;
    stone = TASK_DATA(gCurTask);
    s = &stone->s;
    worldX, worldY;
    me = stone->base.me;

    worldX = TO_WORLD_POS(stone->base.meX, stone->base.regionX);
    worldY = TO_WORLD_POS(me->y, stone->base.regionY);

    stone->qUnkAC += stone->qUnkA4;

    s->y = I(stone->qUnkAC) + worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        m4aSongNumStop(SE_198);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, stone->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (i == PLAYER_1) {
                layer = gPlayer.layer;
            }

            if (GetBit(stone->unkB2, i)) {
                if (!(PLAYER(i).moveState & (MOVESTATE_SPINDASH | MOVESTATE_SPIN_ATTACK))) {
                    PLAYER(i).qWorldY = Q(worldY) + stone->qUnkAC - Q(46);
                } else {
                    PLAYER(i).qWorldY = Q(worldY) + stone->qUnkAC - Q(42);
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (stone->unkB0 != 0) {
        res = SA2_LABEL(sub_801F07C)(worldY + I(stone->qUnkAC), worldX + I(stone->qUnkA8), layer, +8, NULL, SA2_LABEL(sub_801EE64));

        if (res >= 0) {
            stone->qUnkA4 += Q(32. / 256.);
        } else {
            stone->qUnkA4 = Q(0);

            stone->unkB0 = 0;

            if (stone->unkB1 != 0) {
                m4aSongNumStart(SE_198);
                stone->unkB1--;
            } else {
                s32 i = 0;
                do {
                    if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && GetBit(stone->unkB2, i)) {
                        PLAYER(i).qSpeedAirY = -Q(3);
                        PLAYER(i).qSpeedAirX = stone->qUnkA0;
                        PLAYER(i).qSpeedGround = stone->qUnkA0;

                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                        PLAYER(i).stoodObj = NULL;

                        if (PLAYER(i).character != CHARACTER_AMY) {
                            PLAYER(i).charState = CHARSTATE_SPINATTACK;
                        } else {
                            PLAYER(i).charState = CHARSTATE_85;
                        }

                        ClearBit(stone->unkB2, i);
                    }
                } while (++i < gNumSingleplayerCharacters);

                m4aSongNumStop(SE_198);

                gSpriteTransformX = s->x;
                gSpriteTransformY = s->y;

                CreateSkatingStoneDebris(worldX + I(stone->qUnkA8) - s->x, worldY + I(stone->qUnkAC) - 20 - s->y);

                SET_MAP_ENTITY_NOT_INITIALIZED(me, stone->base.meX);
                TaskDestroy(gCurTask);
                return;
            }
        }
    } else {
        res = SA2_LABEL(sub_801E4E4)(worldY + I(stone->qUnkAC), worldX + I(stone->qUnkA8), layer, +8, &sp08, SA2_LABEL(sub_801EE64));

        if (res > 5) {
            m4aSongNumStop(SE_198);

            if (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_4) {
                stone->qUnkA4 += -ABS2(Div(stone->qUnkA0 * 3, 5));
            } else {
                stone->qUnkA4 += +ABS2(Div(stone->qUnkA0 * 2, 5));
            }
            stone->unkB0 = 1;
        } else {
            s32 i = 0;
            do {
                if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && GetBit(stone->unkB2, i)) {
                    if (stone->unkB3 != 0) {
                        PLAYER(i).qWorldX += Div(COS(sp08 * 4), 6070);
                    } else {
                        PLAYER(i).qWorldX -= Div(COS(sp08 * 4), 6070);
                    }
                }
            } while (++i < gNumSingleplayerCharacters);

            if (stone->unkB3 != 0) {
                stone->qUnkA0 -= Div(COS(sp08 * 4), 1440);
            } else {
                stone->qUnkA0 += Div(COS(sp08 * 4), 1440);
            }

            stone->qUnkAC += Q(res + 3);
        }
    }

    {
        s32 res = SA2_LABEL(sub_801F07C)(worldX + I(stone->qUnkA8) + 18, worldY + I(stone->qUnkAC) - 30, layer, +8, &sp08,
                                         SA2_LABEL(sub_801ED24));

        if (res < 0) {
            s32 i = 0;
            do {
                if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && GetBit(stone->unkB2, i)) {
                    PLAYER(i).qSpeedAirY = -Q(3);
                    PLAYER(i).qSpeedAirX = stone->qUnkA0;
                    PLAYER(i).qSpeedGround = stone->qUnkA0;

                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                    PLAYER(i).stoodObj = NULL;

                    if (PLAYER(i).character != CHARACTER_AMY) {
                        PLAYER(i).charState = CHARSTATE_SPINATTACK;
                    } else {
                        PLAYER(i).charState = CHARSTATE_85;
                    }

                    ClearBit(stone->unkB2, i);
                }
            } while (++i < gNumSingleplayerCharacters);
        _0808D2B2:

            m4aSongNumStop(SE_198);

            gSpriteTransformX = s->x;
            gSpriteTransformY = s->y;

            CreateSkatingStoneDebris(worldX + I(stone->qUnkA8) - s->x, worldY + I(stone->qUnkAC) - 20 - s->y);

            SET_MAP_ENTITY_NOT_INITIALIZED(me, stone->base.meX);
            TaskDestroy(gCurTask);
            return;
        } else {
            s32 i = 0;
            do {
                if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                    if (GetBit(stone->unkB2, i)) {
                        if (PLAYER(i).moveState & MOVESTATE_IN_AIR) {
                            ClearBit(stone->unkB2, i);
                        } else {
                            s32 res;

                            PLAYER(i).moveState &= ~MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_100;
                            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                            res = SA2_LABEL(sub_801F07C)(I(PLAYER(i).qWorldX), I(PLAYER(i).qWorldY), PLAYER(i).layer, +8, NULL,
                                                         SA2_LABEL(sub_801ED24));

                            if (res < 0) {
                                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                                PLAYER(i).moveState |= MOVESTATE_IN_AIR;

                                ClearBit(stone->unkB2, i);

                                PLAYER(i).qWorldX += Q(res);
                            }

                            res = SA2_LABEL(sub_801F07C)(I(PLAYER(i).qWorldX), I(PLAYER(i).qWorldY), PLAYER(i).layer, -8, NULL,
                                                         SA2_LABEL(sub_801ED24));

                            if (res < 0) {
                                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                                PLAYER(i).moveState |= MOVESTATE_IN_AIR;

                                ClearBit(stone->unkB2, i);

                                PLAYER(i).qWorldX -= Q(res);
                            }

                            if (Coll_Player_Entity_Intersection(s, worldX + I(stone->qUnkA8), worldY + I(stone->qUnkAC) - 12, &PLAYER(i))) {
                                PLAYER(i).qWorldX += stone->qUnkA0 * 2;

                                res = SA2_LABEL(sub_801E4E4)(I(PLAYER(i).qWorldX + stone->qUnkA0 * 2), I(PLAYER(i).qWorldY),
                                                             PLAYER(i).layer, +8, NULL, SA2_LABEL(sub_801ED24));

                                if (res < 0) {
                                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;

                                    if (PLAYER(i).character != CHARACTER_AMY) {
                                        PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                    } else {
                                        PLAYER(i).charState = CHARSTATE_85;
                                    }

                                    PLAYER(i).stoodObj = NULL;

                                    ClearBit(stone->unkB2, i);

                                    PLAYER(i).qWorldX += Q(res);
                                    PLAYER(i).qSpeedAirX = Q(0);
                                } else {
                                    res = SA2_LABEL(sub_801E4E4)(I(PLAYER(i).qWorldX + stone->qUnkA0 * 2), I(PLAYER(i).qWorldY),
                                                                 PLAYER(i).layer, -8, NULL, SA2_LABEL(sub_801ED24));

                                    if (res < 0) {
                                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                                        PLAYER(i).moveState |= MOVESTATE_IN_AIR;

                                        if (PLAYER(i).character != CHARACTER_AMY) {
                                            PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                        } else {
                                            PLAYER(i).charState = CHARSTATE_85;
                                        }

                                        PLAYER(i).stoodObj = NULL;

                                        ClearBit(stone->unkB2, i);

                                        PLAYER(i).qWorldX -= Q(res);
                                        PLAYER(i).qSpeedAirX = Q(0);
                                    }
                                }

                                if (!(PLAYER(i).moveState & (MOVESTATE_SPINDASH | MOVESTATE_SPIN_ATTACK))) {
                                    s->y = I(PLAYER(i).qWorldY) - gCamera.y + 46;
                                } else {
                                    s->y = I(PLAYER(i).qWorldY) - gCamera.y + 42;
                                }
                            } else {
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                                PLAYER(i).moveState |= MOVESTATE_IN_AIR;

                                ClearBit(stone->unkB2, i);
                                continue;
                            }
                        }
                    } else {
                        u32 collRes = Coll_Player_PlatformCrumbling(s, worldX + I(stone->qUnkA8), worldY + I(stone->qUnkAC), &PLAYER(i));

                        if (collRes & COLL_FLAG_8) {
                            PLAYER(i).qWorldY += Q(1);

                            SetBit(stone->unkB2, i);

                            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                            PLAYER(i).moveState |= MOVESTATE_STOOD_ON_OBJ;
                            PLAYER(i).moveState &= ~MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_100;
                            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                            PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;

                            PLAYER(i).charState = CHARSTATE_WALK_A;

                            PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                        }
                    }
                }
            } while (++i < gNumSingleplayerCharacters);

            stone->qUnkA8 += stone->qUnkA0 * 2;

            s->x = worldX + I(stone->qUnkA8) - gCamera.x;

            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void CreateSkatingStoneDebris(CamCoord worldX, CamCoord worldY)
{
    struct Task *t = TaskCreate(Task_SkatingStoneDebris, sizeof(SkatingStoneDebris), 0x2000, 0, TaskDestructor_SkatingStoneDebris);
    SkatingStoneDebris *debris = TASK_DATA(t);
    Sprite *s = &debris->s[0];
    SpriteTransform *tf = &debris->transform[0];

    debris->unkF0 = 0;
    debris->qUnkF2 = -Q(2);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_4) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SKATING_STONE_DEBRIS_4_S);
        s->graphics.anim = SA1_ANIM_SKATING_STONE_DEBRIS_4_S;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SKATING_STONE_DEBRIS_S);
        s->graphics.anim = SA1_ANIM_SKATING_STONE_DEBRIS_S;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = (SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 12));

    tf->rotation = 0;
    tf->qScaleX = Q(0.75);
    tf->qScaleY = Q(0.75);
    tf->x = worldX;
    tf->y = worldY;

    UpdateSpriteAnimation(s);

#ifndef BUG_FIX
    DmaCopy16(3, s, ++s, sizeof(*s));
    DmaCopy16(3, tf, ++tf, sizeof(*tf));

    s->frameFlags = (SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 13));

    tf->y = worldY - 16;
    s++;
    DmaCopy16(3, tf, ++tf, sizeof(*tf));
#else
    DmaCopy16(3, s, (s + 1), sizeof(*s));
    s = (s + 1);
    DmaCopy16(3, tf, (tf + 1), sizeof(*tf));
    tf = (tf + 1);

    s->frameFlags = (SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 13));

    tf->y = worldY - 16;
    s++;
    DmaCopy16(3, tf, (tf + 1), sizeof(*tf));
    tf = (tf + 1);
#endif

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_4) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SKATING_STONE_DEBRIS_4_L);
        s->graphics.anim = SA1_ANIM_SKATING_STONE_DEBRIS_4_L;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SKATING_STONE_DEBRIS_L);
        s->graphics.anim = SA1_ANIM_SKATING_STONE_DEBRIS_L;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = (SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 14));
    tf->y = worldY;

    UpdateSpriteAnimation(s);

#ifndef BUG_FIX
    DmaCopy16(3, s, ++s, sizeof(*s));
    DmaCopy16(3, tf, ++tf, sizeof(*tf));
#else
    DmaCopy16(3, s, (s + 1), sizeof(*s));
    s = (s + 1);
    DmaCopy16(3, tf, (tf + 1), sizeof(*tf));
    tf = (tf + 1);
#endif

    s->frameFlags = (SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 15));

    tf->y = worldY - 16;

    m4aSongNumStart(SE_BOSS_HIT);
}

void Task_SkatingStoneDebris(void)
{
    SkatingStoneDebris *debris = TASK_DATA(gCurTask);
    Sprite *s = &debris->s[0];
    SpriteTransform *tf;
    s16 oldTfX, oldTfY;
    s16 qScaleX;

    if (debris->unkF0++ > GBA_FRAMES_PER_SECOND) {
        TaskDestroy(gCurTask);
        return;
    }

    debris->qUnkF2 += Q(40. / 256.);

    { // 0
        tf = &debris->transform[0];
        tf->y += I(debris->qUnkF2);
        oldTfX = tf->x;
        oldTfY = tf->y;
        tf->x = tf->x - gCamera.x;
        tf->y = tf->y - gCamera.y;

        tf->x -= debris->unkF0 * 2;

        // TODO: Can these be matched via CLAMP/MIN macros?
        qScaleX = tf->qScaleX + Q(8. / 256.);
        if (qScaleX > Q(2)) {
            qScaleX = Q(2);
        }

        tf->qScaleX = qScaleX;
        tf->qScaleY = qScaleX;
        tf->rotation = (tf->rotation - Q(42. / 256.)) & (SIN_PERIOD - 1);

        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

        SA2_LABEL(sub_8004E14)(s, tf);

        DisplaySprite(s);

        tf->x = oldTfX;
        tf->y = oldTfY;
    }

    { // 1
        s = &debris->s[1];
        tf = &debris->transform[1];

        tf->y += I(debris->qUnkF2);
        oldTfX = tf->x;
        oldTfY = tf->y;
        tf->x = tf->x - gCamera.x;
        tf->y = tf->y - gCamera.y;

        tf->x += debris->unkF0;
        tf->qScaleX = qScaleX;
        tf->qScaleY = qScaleX;
        tf->rotation = (tf->rotation + Q(42. / 256.)) & (SIN_PERIOD - 1);

        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

        SA2_LABEL(sub_8004E14)(s, tf);

        DisplaySprite(s);

        tf->x = oldTfX;
        tf->y = oldTfY;
    }

    { // 2
        s = &debris->s[2];
        tf = &debris->transform[2];

        tf->y += I(debris->qUnkF2);
        oldTfX = tf->x;
        oldTfY = tf->y;
        tf->x = tf->x - gCamera.x;
        tf->y = tf->y - gCamera.y;

        tf->x += debris->unkF0 * 2;
        tf->qScaleX = qScaleX;
        tf->qScaleY = qScaleX;
        tf->rotation = (tf->rotation + Q(14. / 256.)) & (SIN_PERIOD - 1);

        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

        SA2_LABEL(sub_8004E14)(s, tf);

        DisplaySprite(s);

        tf->x = oldTfX;
        tf->y = oldTfY;
    }

    { // 3
        s = &debris->s[3];
        tf = &debris->transform[3];

        tf->y += I(debris->qUnkF2);
        oldTfX = tf->x;
        oldTfY = tf->y;
        tf->x = tf->x - gCamera.x;
        tf->y = tf->y - gCamera.y;

        tf->x -= debris->unkF0;
        tf->qScaleX = qScaleX;
        tf->qScaleY = qScaleX;
        tf->rotation = (tf->rotation - Q(14. / 256.)) & (SIN_PERIOD - 1);

        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

        SA2_LABEL(sub_8004E14)(s, tf);

        DisplaySprite(s);

        tf->x = oldTfX;
        tf->y = oldTfY;
    }
}

void TaskDestructor_SkatingStone(struct Task *t)
{
    SkatingStone *stone = TASK_DATA(t);
    VramFree(stone->s.graphics.dest);
    m4aSongNumStop(SE_198);
}

void TaskDestructor_SkatingStoneDebris(struct Task *t)
{
    SkatingStoneDebris *debris = TASK_DATA(t);
    VramFree(debris->s[0].graphics.dest);
    VramFree(debris->s[2].graphics.dest);
}
