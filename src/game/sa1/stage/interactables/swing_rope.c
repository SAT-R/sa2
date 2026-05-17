#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x40 */ s32 unk40[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x48 */ s32 unk48[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x50 */ s32 unk50[NUM_SINGLEPLAYER_CHARS_MAX];
} SwingRope;

void Task_SwingRope(void);

// (99.13%) https://decomp.me/scratch/zWpSE
NONMATCH("asm/non_matching/game/sa1/stage/interactables/swing_rope__Task_SwingRope.inc", void Task_SwingRope(void))
{
    SwingRope *rope = TASK_DATA(gCurTask);
    CamCoord x, y;
    MapEntity *me = rope->base.me;
    s32 i;

    // world-pos
    x = TO_WORLD_POS(rope->base.meX, rope->base.regionX);
    y = TO_WORLD_POS(me->y, rope->base.regionY);

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            // _08088890
            if (GetBit(rope->unk3C, i)) {
                // _080888A4
                if (rope->unk40[i] < Q(0.90625)) {
                    rope->unk40[i] += Q(0.0625);
                }

                if (rope->unk40[i] > Q(9)) {
                    rope->unk40[i] = Q(9);
                }
                // _080888C6

                rope->unk48[i] += rope->unk40[i];

                PLAYER(i).qWorldY = Q(y) + Q(1);
                // _080888EC
                if ((x + me->d.sData[0] * TILE_WIDTH) <= I(PLAYER(i).qWorldX)
                    && (x + me->d.sData[0] * TILE_WIDTH + me->d.uData[2] * TILE_WIDTH) >= I(PLAYER(i).qWorldX)) {
                    s8 res;

                    PLAYER(i).qWorldX += rope->unk40[i];

                    if (PLAYER(i).heldInput & DPAD_RIGHT) {
                        rope->unk40[i] += 0x10;
                    } else if (PLAYER(i).heldInput & DPAD_LEFT) {
                        if (rope->unk40[i] > Q(0.90625)) {
                            rope->unk40[i] -= 0x10;
                        }
                    }

                    res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) - 8, I(PLAYER(i).qWorldY), PLAYER(i).layer, -8,
                                                 SA2_LABEL(sub_801EB44));

                    if (res < 0) {
                        PLAYER(i).qWorldX -= Q(res);
                    }
                }
                PLAYER(i).qSpeedAirY = 0;
                // _08088A0A

                if (PLAYER(i).frameInput & gPlayerControls.jump) {
                    if (rope->unk40[i] < 0) {
                        PLAYER(i).qWorldX = Q(x + (me->d.sData[0] * TILE_WIDTH) + 2);
                        rope->unk40[i] = 0;
                        return;
                    }

                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                    PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                    PLAYER(i).heldInput |= gPlayerControls.jump | gPlayerControls.attack;
                    PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    PLAYER(i).moveState &= ~MOVESTATE_100;
                    PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                    if (PLAYER(i).heldInput & DPAD_VERTICAL) {
                        if (PLAYER(i).heldInput & DPAD_UP) {
                            PLAYER(i).qSpeedAirY = -Q(6.75);
                        } else {
                            PLAYER(i).qSpeedAirY = +Q(6.75);
                        }

                    } else {
                        if (Div(rope->unk50[i], 15) != 0) {
                            PLAYER(i).qSpeedAirY = +Q(6.75);
                        } else {
                            PLAYER(i).qSpeedAirY = -Q(6.75);
                        }
                    }

                    PLAYER(i).charState = CHARSTATE_SPINATTACK;

                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);

                    PLAYER(i).qWorldY = Q(y) + Q(9);
                    PLAYER(i).qSpeedGround = Q(0);
                    PLAYER(i).qSpeedAirX = Q(0);

                    ClearBit(rope->unk3C, i);

                    rope->unk50[i] = 0;
                    rope->unk3D[i] = 20;

                    (&PLAYER(i))->spriteInfoBody->s.frameFlags &= ~0x3000;
                    (&PLAYER(i))->spriteInfoBody->s.frameFlags |= 0x2000;
                }
                // _08088CD6

#ifndef NON_MATCHING
                rope->unk50[i] = Mod(++rope->unk50[i], 30);
#else
                rope->unk50[i] = (rope->unk50[i] + 1) % 30;
#endif

            } else {
                // _08088CF8 - not on rope
                if (rope->unk3D[i] > 0) {
                    rope->unk3D[i]--;
                    continue;
                } else {
                    // _08088D0A
                    if ((x + me->d.sData[0] * TILE_WIDTH) <= I(PLAYER(i).qWorldX)
                        && (x + me->d.sData[0] * TILE_WIDTH + me->d.uData[2] * TILE_WIDTH) >= I(PLAYER(i).qWorldX)
                        && (y + me->d.sData[1] * TILE_WIDTH) <= I(PLAYER(i).qWorldY)
                        && (y + me->d.sData[1] * TILE_WIDTH + me->d.uData[3] * TILE_WIDTH) >= I(PLAYER(i).qWorldY)) {
                        // _08088DB2
                        rope->unk40[i] = PLAYER(i).qSpeedGround >> 1;

                        // TODO: Clamp macro?
                        if (rope->unk40[i] < 0)
                            rope->unk40[i] = 0;
                        // _08088DDE

                        if (PLAYER(i).qWorldX > Q(x)) {
                            // _08088DFA
                            rope->unk48[i] = (PLAYER(i).qWorldX - Q(x));
                        } else {
                            // _08088E16
                            rope->unk48[i] = (Q(x) - PLAYER(i).qWorldX);
                        }
                        // _08088E2E+0x2

                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).moveState &= ~MOVESTATE_IN_AIR;
                        PLAYER(i).moveState &= ~MOVESTATE_100;
                        // _08088E98

                        SetBit(rope->unk3C, i);
                        PLAYER(i).charState = CHARSTATE_34;

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                        rope->unk50[i] = 0;

                        PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                }
            }
        } else {
            // _08088F1C - Player dead
            if (GetBit(rope->unk3C, i)) {
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                ClearBit(rope->unk3C, i);
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    // _08088F68
    if ((rope->unk3C & 0x3) == 0) {
        // screen-pos
        x -= gCamera.x;
        y -= gCamera.y;

        if (IS_OUT_OF_CAM_RANGE(x, y)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, rope->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}
END_NONMATCH

void CreateEntity_SwingRope(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_SwingRope, sizeof(SwingRope), 0x2000, 0, NULL);
    SwingRope *rope = TASK_DATA(t);
    s32 i;

    rope->base.regionX = regionX;
    rope->base.regionY = regionY;
    rope->base.me = me;
    rope->base.meX = me->x;
    rope->base.id = id;

    rope->unk3C = 0;

    for (i = 0; i < NUM_SINGLEPLAYER_CHARS_MAX; i++) {
        rope->unk40[i] = 0;
        rope->unk48[i] = 0;
        rope->unk3D[i] = 0;
    }

    SET_MAP_ENTITY_INITIALIZED(me);
}