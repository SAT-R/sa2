#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/heart_particles_effect.h"
#include "game/stage/music_manager.h"

#include "game/game_6.h"
#include "game/boost_effect.h" // incl. CreateBoostModeParticles
#include "game/dust_effect_braking.h" // CreateSpindashDustEffect
#include "game/dust_effect_spindash.h" // CreateSpindashDustEffect
#include "game/time_attack/results.h" // for PlayerCB_80278D4
#include "game/parameters/characters.h"
#include "game/playerfn_cmds.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

struct Task *sub_8011B88(s32 x, s32 y, u16 p2);
extern void sub_8011D48(Player *);
extern void PlayerCB_8011F1C(Player *);
extern void sub_8012194(Player *);
extern bool32 sub_801251C(Player *);
extern void sub_8012644(Player *);
extern void sub_8012888(Player *);
extern void sub_80128E0(Player *);
extern void sub_8012548(Player *);
extern void sub_8012830(Player *);
extern void sub_8012BC0(Player *);
extern void sub_8012D3C(Player *);
extern void sub_8012EEC(Player *);
extern void sub_8013070(Player *);
extern void sub_8013AD8(Player *);
extern void PlayerCB_8013D18(Player *);
extern void sub_8013F04(Player *);
extern void sub_801583C(void);
extern void sub_8015BD4(u16);
extern void sub_801F488(void);

extern s32 sub_8022F58(u8, Player *);
extern void sub_8022190(Player *);
extern void sub_8022218(Player *);
extern void sub_8022284(Player *);
extern void sub_8022D6C(Player *);
extern void sub_8023128(Player *);
extern void sub_80231C0(Player *);
extern void sub_8023260(Player *);
extern void sub_80232D0(Player *);
extern void sub_8023610(Player *);
extern void sub_80236C8(Player *);
extern void sub_8023708(Player *);
extern void sub_80246DC(Player *);

void PlayerCB_Idle(Player *);
void PlayerCB_8025AB8(Player *);
void PlayerCB_Jumping(Player *);
void PlayerCB_8025F84(Player *);
void PlayerCB_80261D8(Player *);
void PlayerCB_Spindash(Player *);
void PlayerCB_8026810(Player *);
void PlayerCB_8027040(Player *);
void PlayerCB_8027190(Player *);
void PlayerCB_8027250(Player *);
void PlayerCB_8027324(Player *);
void PlayerCB_80273D0(Player *);
void PlayerCB_GoalSlowdown(Player *);
void PlayerCB_GoalBrake(Player *);
void sub_802785C(Player *);
void PlayerCB_80278D4(Player *);
void PlayerCB_8027B98(Player *);
void PlayerCB_80287AC(Player *);
void PlayerCB_802890C(Player *);
void PlayerCB_8029074(Player *);
void PlayerCB_8029314(Player *);
bool32 sub_80294F4(Player *);
void sub_802966C(Player *);
bool32 sub_8029E6C(Player *);
void sub_8029FA4(Player *);
bool32 sub_802A0C8(Player *);
bool32 sub_802A0FC(Player *);
bool32 sub_802A184(Player *);
bool32 sub_802A2A8(Player *);
void PlayerCB_802A228(Player *);
void sub_802A360(Player *);
void PlayerCB_802A3B8(Player *);
void PlayerCB_802A3C4(Player *);
void PlayerCB_802A3F0(Player *);
void sub_802A40C(Player *);
void sub_802A468(Player *);
void sub_802A4B8(Player *);
void PlayerCB_802A4FC(Player *);
void PlayerCB_802A5C4(Player *);
void PlayerCB_802A620(Player *);
void PlayerCB_802A714(Player *);

static const s16 gUnknown_080D6902[5][2] = {
    { 8, 64 }, { 12, 64 }, { 14, 64 }, { 16, 64 }, { 18, 64 },
};

static const s16 gUnknown_080D6916[5] = { 0x800, 0x7F8, 0x690, 0x5A0, 0x438 };

static const s16 sSpinDashSpeeds[9] = {
    Q_8_8(6.000 + 0 * (3. / 8.)), //
    Q_8_8(6.000 + 1 * (3. / 8.)), //
    Q_8_8(6.000 + 2 * (3. / 8.)), //
    Q_8_8(6.000 + 3 * (3. / 8.)), //
    Q_8_8(6.000 + 4 * (3. / 8.)), // Formatter
    Q_8_8(6.000 + 5 * (3. / 8.)), //
    Q_8_8(6.000 + 6 * (3. / 8.)), //
    Q_8_8(6.000 + 7 * (3. / 8.)), //
    Q_8_8(6.000 + 8 * (3. / 8.)), //
};

#define TRICK_DIR_UP       0
#define TRICK_DIR_DOWN     1
#define TRICK_DIR_FORWARD  2
#define TRICK_DIR_BACKWARD 3
#define NUM_TRICK_DIRS     4

// NOTE(Jace): It appears that they originally planned
//             to give the player a different amount of score points
//             depending on the direction of the trick.
static const u16 sTrickPoints[NUM_TRICK_DIRS] = { [TRICK_DIR_UP] = 100,
                                                  [TRICK_DIR_DOWN] = 100,
                                                  [TRICK_DIR_FORWARD] = 100,
                                                  [TRICK_DIR_BACKWARD] = 100 };

static const s16 sTrickAccel[NUM_TRICK_DIRS][NUM_CHARACTERS][2] = {
    [TRICK_DIR_UP] = {
        [CHARACTER_SONIC] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_CREAM] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_TAILS] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_KNUCKLES] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_AMY] = {Q_8_8(0.00), Q_8_8(-6.00)},
    },
    [TRICK_DIR_DOWN] = {
        [CHARACTER_SONIC] = {Q_8_8(0.00), Q_8_8(1.00)},
        [CHARACTER_CREAM] = {Q_8_8(0.00), Q_8_8(0.50)},
        [CHARACTER_TAILS] = {Q_8_8(0.00), Q_8_8(0.50)},
        [CHARACTER_KNUCKLES] = {Q_8_8(0.00), Q_8_8(1.00)},
        [CHARACTER_AMY] = {Q_8_8(0.00), Q_8_8(1.00)},
    },
    [TRICK_DIR_FORWARD] = {
        [CHARACTER_SONIC] = {Q_8_8(6.00), Q_8_8(0.00)},
        [CHARACTER_CREAM] = {Q_8_8(4.00), Q_8_8(-2.50)},
        [CHARACTER_TAILS] = {Q_8_8(4.00), Q_8_8(-2.50)},
        [CHARACTER_KNUCKLES] = {Q_8_8(6.00), Q_8_8(0.00)},
        [CHARACTER_AMY] = {Q_8_8(6.00), Q_8_8(0.00)},
    },
    [TRICK_DIR_BACKWARD] = {
        [CHARACTER_SONIC] = {Q_8_8(-5.00), Q_8_8(-3.50)},
        [CHARACTER_CREAM] = {Q_8_8(-3.50), Q_8_8(-3.00)},
        [CHARACTER_TAILS] = {Q_8_8(-3.50), Q_8_8(-3.00)},
        [CHARACTER_KNUCKLES] = {Q_8_8(-5.00), Q_8_8(0.00)},
        [CHARACTER_AMY] = {Q_8_8(-3.50), Q_8_8(-2.00)},
    },
};

static const u16 gUnknown_080D698A[NUM_TRICK_DIRS] = { 33, 36, 34, 35 };

#define MASK_80D6992_1  0x1
#define MASK_80D6992_2  0x2
#define MASK_80D6992_4  0x4
#define MASK_80D6992_8  0x8
#define MASK_80D6992_10 0x10

static const u8 sTrickMasks[NUM_TRICK_DIRS][NUM_CHARACTERS] = {
    [TRICK_DIR_UP] = {
        [CHARACTER_SONIC]    = MASK_80D6992_1,
        [CHARACTER_CREAM]    = MASK_80D6992_1,
        [CHARACTER_TAILS]    = MASK_80D6992_1,
        [CHARACTER_KNUCKLES] = (MASK_80D6992_2 | MASK_80D6992_1),
        [CHARACTER_AMY]      = MASK_80D6992_1,
    },
    [TRICK_DIR_DOWN] = {
        [CHARACTER_SONIC]    = 0,
        [CHARACTER_CREAM]    = 0,
        [CHARACTER_TAILS]    = 0,
        [CHARACTER_KNUCKLES] = 0,
        [CHARACTER_AMY]      = 0,
    },
    [TRICK_DIR_FORWARD] = {
        [CHARACTER_SONIC]    = MASK_80D6992_8,
        [CHARACTER_CREAM]    = MASK_80D6992_10,
        [CHARACTER_TAILS]    = (MASK_80D6992_10 | MASK_80D6992_1),
        [CHARACTER_KNUCKLES] = MASK_80D6992_4,
        [CHARACTER_AMY]      = MASK_80D6992_8,
    },
    [TRICK_DIR_BACKWARD] = {
        [CHARACTER_SONIC]    = 0,
        [CHARACTER_CREAM]    = (MASK_80D6992_10 | MASK_80D6992_1),
        [CHARACTER_TAILS]    = (MASK_80D6992_10 | MASK_80D6992_1),
        [CHARACTER_KNUCKLES] = MASK_80D6992_4,
        [CHARACTER_AMY]      = 0,
    },
};

static const u16 gUnknown_080D69A6[2][3] = {
    [0] = { 32, SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_SIDE, CHARACTER_SONIC),
            SA2_CHAR_ANIM_VARIANT_TRICK_SIDE_PARTICLE_FX },
    [1] = { 24, SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_UP, CHARACTER_KNUCKLES),
            SA2_CHAR_ANIM_VARIANT_TRICK_UP_PARTICLE_FX },
};

static const s16 sSpringAccelY[4] = {
    Q_8_8(7.5),
    Q_8_8(9.0),
    Q_8_8(10.5),
    Q_8_8(12.0),
};

static const s16 sSpringAccelX[4] = {
    Q_8_8(7.5),
    Q_8_8(9.0),
    Q_8_8(10.5),
    Q_8_8(12.0),
};

static const u8 gUnknown_080D69C2[4] = { 4, 3, 2, 2 };

void PlayerCB_8025318(Player *p)
{
    u32 mask;
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if ((p->moveState & MOVESTATE_IN_AIR)) {
            PlayerCB_8025F84(p);
            return;
        }
    }

    mask = (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR);
    if ((p->moveState & mask) == MOVESTATE_800) {
        sub_802A360(p);
    } else {
        sub_80218E4(p);

        p->moveState &= ~(MOVESTATE_4 | MOVESTATE_IN_AIR);

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        if (p->speedGroundX != 0) {
            p->unk64 = 9;
        } else {
            p->unk64 = 0;
        }

        PLAYERFN_SET_AND_CALL(PlayerCB_Idle, p);
    }
}

// TODO/NAME: Not only used for idling...
void PlayerCB_Idle(Player *p)
{
    if ((p->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_8000000) {
        PlayerCB_80273D0(p);
    } else if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
               == MOVESTATE_800) {
        sub_802A360(p);
    } else if (!sub_802A0C8(p) && !sub_802A0FC(p) && !sub_8029E6C(p)
               && !sub_802A2A8(p)) {
        sub_802966C(p);

        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->speedGroundX != 0) {
                p->speedGroundX += acceleration;
            }
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_8000) {
            p->moveState &= ~MOVESTATE_IN_AIR;
        } else if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(PlayerCB_Jumping);
        }
    }
}

void PlayerCB_8025548(Player *p)
{
    if (!sub_802A0FC(p) && !sub_8029E6C(p)
        && ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || !sub_802A2A8(p))) {
        if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->speedGroundX != 0)
                p->speedGroundX += acceleration;
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(PlayerCB_Jumping);
        }
    }
}

void PlayerCB_802569C(Player *p)
{
    Sprite *s = &p->unk90->s;
    u16 characterAnim = GET_CHARACTER_ANIM(p);

    if (!sub_802A0FC(p) && !sub_8029E6C(p) && !sub_802A2A8(p)) {
        u16 dpad = (p->unk5C & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (p->variant == 0)) {
                p->variant = 1;
                p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            }
        } else if (dpad != DPAD_UP) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (p->variant == 1)
            && (s->unk10 & 0x4000)) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->speedGroundX != 0)
                p->speedGroundX += acceleration;
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(PlayerCB_Jumping);
        }
    }
}

void PlayerCB_8025854(Player *p)
{
    Sprite *s = &p->unk90->s;
    u16 characterAnim = GET_CHARACTER_ANIM(p);

    if (!sub_802A184(p) && !sub_8029E6C(p) && !sub_802A2A8(p)) {
        u16 dpad = (p->unk5C & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (p->variant == 0)) {
                p->variant = 1;
                p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            }
        } else if (dpad != DPAD_DOWN) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (p->variant == 1)
            && (s->unk10 & 0x4000)) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->speedGroundX != 0)
                p->speedGroundX += acceleration;
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(PlayerCB_Jumping);
        }
    }
}

void PlayerCB_8025A0C(Player *p)
{
    u32 mask;
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if ((p->moveState & MOVESTATE_IN_AIR)) {
            PlayerCB_8025F84(p);
            return;
        }
    }

    if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_800) {
        sub_802A360(p);
    } else {
        p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->unk64 = 4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_4;
        p->unk99[0] = 0;
        PLAYERFN_SET_AND_CALL(PlayerCB_8025AB8, p);
    }
}

void PlayerCB_8025AB8(Player *p)
{
    if ((p->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_8000000) {
        PlayerCB_80273D0(p);
    } else if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
               == MOVESTATE_800) {
        sub_802A360(p);
    } else {
        if (p->unk99[0] != 0) {
            p->unk99[0]--;
        } else if (!sub_8029E6C(p)) {
            if (p->unk2A == 0) {
                u16 dpadSideways = (p->unk5C & (DPAD_LEFT | DPAD_RIGHT));
                if (dpadSideways != DPAD_RIGHT) {
                    if (dpadSideways == DPAD_LEFT) {
                        s32 val = p->speedGroundX;
                        if (val <= 0) {
                            p->moveState |= MOVESTATE_FACING_LEFT;
                        } else if ((val - Q_24_8(0.09375)) < 0) {
                            s32 deceleration = -Q_24_8(0.375);
                            p->speedGroundX = deceleration;
                        } else {
                            p->speedGroundX = (val - Q_24_8(0.09375));
                        }
                    }
                } else {
                    s32 val = p->speedGroundX;
                    if (val >= 0) {
                        p->moveState &= ~MOVESTATE_FACING_LEFT;
                    } else if ((val + Q_24_8(0.09375)) > 0) {
                        p->speedGroundX = Q_24_8(0.375);
                    } else {
                        p->speedGroundX = (val + Q_24_8(0.09375));
                    }
                }
            }
        } else {
            return;
        }

        if (p->speedGroundX > 0) {
            p->unk50 = 8;
        } else if (p->speedGroundX < 0) {
            p->unk50 = -8;
        } else {
            p->unk50 = 0;
        }

        p->speedGroundX -= p->unk50;

        if ((p->speedGroundX > -Q_24_8(0.5)) && (p->speedGroundX < Q_24_8(0.5))) {
            p->unk50 = 0;
            p->speedGroundX = 0;
        }

        if (p->speedGroundX == 0) {
            PLAYERFN_SET_AND_CALL(PlayerCB_8025318, p);
        } else {
            s32 speedX = p->speedGroundX;

            if ((((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) && (speedX != 0)) {
                u32 sinVal = SIN_24_8((p->rotation) * 4) * 60;
                s32 sinInt = (s32)(Q_24_8_TO_INT((s32)sinVal));

                if (speedX > 0) {
                    if (sinInt <= 0) {
                        sinInt >>= 2;
                    }
                } else if (sinInt >= 0) {
                    sinInt >>= 2;
                }

                speedX += sinInt;

                p->speedGroundX = speedX;
            }

            sub_80232D0(p);
            sub_8023260(p);
            sub_8023128(p);

            if (p->moveState & MOVESTATE_IN_AIR) {
                PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
            }

            PLAYERFN_UPDATE_POSITION(p);

            sub_8022D6C(p);

            PLAYERFN_UPDATE_UNK2A(p);

            if (p->moveState & MOVESTATE_IN_AIR) {
                PLAYERFN_SET(PlayerCB_Jumping);
            }
        }
    }
}

void PlayerCB_Jump(Player *p)
{
    u8 rot;
    s32 jumpHeight;
    s32 accelX, accelY;

    sub_80218E4(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if (p->moveState & MOVESTATE_4) {
        p->moveState |= MOVESTATE_10;
    }

    if (ABS(p->speedAirX) < Q_24_8(1.25)) {
        p->unk64 = 10;
    } else {
        p->unk64 = 11;
    }

    p->unk70 = 1;

    jumpHeight = (p->moveState & MOVESTATE_40) ? Q_24_8(PLAYER_JUMP_HEIGHT_UNDER_WATER)
                                               : Q_24_8(PLAYER_JUMP_HEIGHT);

    rot = p->rotation - 64;

    accelX = Q_24_8_TO_INT(COS_24_8(rot * 4) * jumpHeight);
    p->speedAirX += accelX;

    accelY = Q_24_8_TO_INT(SIN_24_8(rot * 4) * jumpHeight);
    p->speedAirY += accelY;

    if (p->moveState & MOVESTATE_8) {
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->speedAirX -= Q_24_8(gCamera.unk38);
        }
    }

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(PlayerCB_Jumping, p);
}

void PlayerCB_Jumping(Player *p)
{
    s16 maxJumpSpeed = -Q_24_8(PLAYER_MAX_NOT_HELD_JUMP_FORCE);

    if (p->moveState & MOVESTATE_40) {
        maxJumpSpeed = -Q_24_8(PLAYER_MAX_NOT_HELD_JUMP_FORCE_UNDER_WATER);
    }

    if (p->moveState & MOVESTATE_100) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            if (sub_801251C(p) || sub_80294F4(p))
                return;

        // Caps the jump force if the player lets go of the jump button
        if (p->speedAirY < maxJumpSpeed && !(p->unk5C & gPlayerControls.jump)) {
            p->speedAirY = maxJumpSpeed;
        }
    }

    sub_80246DC(p);
    sub_8023610(p);

    if (!IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80236C8(p);
    }

    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_8025F84(Player *p)
{
    sub_80218E4(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->unk16 < 6) || (p->unk17 < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1)
            || (chAnim == SA2_CHAR_ANIM_JUMP_2) || (chAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    if (ABS(p->speedAirX) < Q_24_8(1.25)) {
        p->unk64 = 10;
    } else {
        p->unk64 = 11;
    }

    p->unk70 = 1;

    p->unk90->s.unk10 &= ~MOVESTATE_4000;
    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(PlayerCB_Jumping, p);
}

void PlayerCB_8026060(Player *p)
{
    sub_80218E4(p);

    p->moveState |= (MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->unk16 < 6) || (p->unk17 < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1)
            || (chAnim == SA2_CHAR_ANIM_JUMP_2) || (chAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    p->unk70 = 1;
    p->unk6E = 1;

    p->unk90->s.unk10 &= ~MOVESTATE_4000;

    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80261D8, p);
}

void PlayerCB_802611C(Player *p)
{
    sub_80218E4(p);

    p->moveState |= (MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->unk16 < 6) || (p->unk17 < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1)
            || (chAnim == SA2_CHAR_ANIM_JUMP_2) || (chAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    p->unk70 = 1;
    p->unk6E = 0;

    p->unk90->s.unk10 &= ~MOVESTATE_4000;

    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80261D8, p);
}

void PlayerCB_80261D8(Player *p)
{
    sub_80246DC(p);

    if ((p->unk6E != 1) || (p->speedAirY > 0)) {
        sub_8023610(p);

        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            && (p->moveState & MOVESTATE_100)) {
            if (sub_801251C(p) || sub_80294F4(p))
                return;
        }
    }

    if (!IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80236C8(p);
    }

    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_802631C(Player *p)
{
    p->unk64 = 3;

    p->moveState |= (MOVESTATE_400 | MOVESTATE_4);
    p->moveState &= ~(MOVESTATE_20 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->spindashAccel = 0;
    p->speedAirX = 0;
    p->speedAirY = 0;
    p->speedGroundX = 0;

    m4aSongNumStart(SE_SPIN_ATTACK);
    CreateSpindashDustEffect();

    PLAYERFN_SET_AND_CALL(PlayerCB_Spindash, p);
}

void PlayerCB_Spindash(Player *player)
{
    Sprite *s = &player->unk90->s;
    u16 cAnim = GET_CHARACTER_ANIM(player);

    if (!(player->unk5C & DPAD_DOWN)) {
        s16 index;
        s32 speed;
        player->moveState &= ~MOVESTATE_400;

        index = Q_24_8_TO_INT(player->spindashAccel);
        if (index > 8)
            index = 8;

        speed = sSpinDashSpeeds[index];
        if (player->moveState & MOVESTATE_FACING_LEFT)
            speed = -sSpinDashSpeeds[index];

        player->speedGroundX = speed;

        gPlayer.callback = PlayerCB_8025A0C;

        m4aSongNumStart(SE_SPIN_DASH_RELEASE);
    } else {
        // _08026408
        s16 pitch = player->spindashAccel;

        s16 pitch2 = pitch;
        if (pitch2 != 0) {
            pitch = pitch2 - (Q_24_8_TO_INT(pitch << 3));
            if (pitch <= 0)
                pitch = 0;
        }

        if (player->unk5E & gPlayerControls.jump) {
            struct MusicPlayerInfo *mPlayerInfo;
            m4aSongNumStart(SE_SPIN_ATTACK);

            mPlayerInfo = gMPlayTable[gSongTable[SE_SPIN_ATTACK].ms].info;
            m4aMPlayImmInit(mPlayerInfo);
            m4aMPlayPitchControl(mPlayerInfo, 0xFFFF, (pitch & ~0x7F));

            pitch += Q_24_8(2.0);
            pitch = MAX(pitch, Q_24_8(8.0));

            player->variant = 1;
            player->unk6C = 1;
        }
        // _08026490
        player->spindashAccel = pitch;

        if ((cAnim == SA2_CHAR_ANIM_SPIN_DASH) && (player->variant == 1)
            && (s->unk10 & SPRITE_FLAG_MASK_ANIM_OVER)) {
            player->variant = 0;
        }
    }
    // _080264B2
    if (player->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(player);
        sub_80232D0(player);

        if (player->moveState & MOVESTATE_40) {
            player->speedAirY += Q_24_8(PLAYER_GRAVITY_UNDER_WATER);
        } else {
            player->speedAirY += Q_24_8(PLAYER_GRAVITY);
        }

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
            player->speedAirY = -player->speedAirY;
        }

        player->speedAirY = MIN(player->speedAirY, Q_24_8(PLAYER_AIR_SPEED_MAX));

        player->y = GRAVITY_IS_INVERTED ? player->y - player->speedAirY
                                        : player->y + player->speedAirY;

        {
            s32 rot = (s8)player->rotation;
            if (rot < 0) {
                rot = MIN((rot + 2), 0);
            } else if (rot > 0) {
                rot = MAX((rot - 2), 0);
            }
            player->rotation = rot;
        }

        sub_8022190(player);

        if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {
            gPlayer.callback = PlayerCB_8025318;
            player->speedGroundX = player->speedAirX;
            player->rotation = 0;
        }
    } else {
        // _08026598
        s32 groundSpeed = player->speedGroundX;

        if ((((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) && (groundSpeed != 0)) {
            u32 sinVal = SIN_24_8((player->rotation) * 4) * 60;
            s32 sinInt = (s32)(Q_24_8_TO_INT((s32)sinVal));

            if (groundSpeed > 0) {
                if (sinInt <= 0) {
                    sinInt >>= 2;
                }
            } else if (sinInt >= 0) {
                sinInt >>= 2;
            }

            groundSpeed += sinInt;

            player->speedGroundX = groundSpeed;
        }
        // _080265E2

        sub_80232D0(player);
        sub_8023260(player);
        sub_8023128(player);

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
            player->speedAirY = -player->speedAirY;
        }

        player->speedAirY = MIN(player->speedAirY, Q_24_8(PLAYER_AIR_SPEED_MAX));

        player->y = GRAVITY_IS_INVERTED ? player->y - player->speedAirY
                                        : player->y + player->speedAirY;

        sub_8022D6C(player);

        if (player->unk2A) {
            player->unk2A -= 1;
        } else if ((player->rotation + 32) & 0xC0) {
            s32 absGroundSpeed = ABS(player->speedGroundX);
            if (absGroundSpeed < Q_24_8(1.875)) {
                player->speedGroundX = 0;

                player->moveState |= MOVESTATE_IN_AIR;
                player->unk2A = GBA_FRAMES_PER_SECOND / 2;
            }
        }
    }
}

void sub_802669C(Player *p)
{
    s32 newY;
    p->unk38 = 0;
    p->rotation = 0;

    p->unk90->s.unk10 &= ~(MOVESTATE_2000 | MOVESTATE_1000);
    p->unk90->s.unk10 |= MOVESTATE_1000;

    p->itemEffect |= PLAYER_ITEM_EFFECT__80;

    if (GRAVITY_IS_INVERTED) {
        newY = sub_801E6D4(Q_24_8_TO_INT(p->y) - p->unk17, Q_24_8_TO_INT(p->x), p->unk38,
                           -8, NULL, sub_801EE64);

        newY = p->y - Q_24_8(newY);
    } else {
        newY = sub_801E6D4(Q_24_8_TO_INT(p->y) + p->unk17, Q_24_8_TO_INT(p->x), p->unk38,
                           8, NULL, sub_801EE64);

        newY = p->y + Q_24_8(newY);
    }
    p->y = newY;
    p->moveState &= ~MOVESTATE_IN_AIR;

    gPlayer.moveState |= MOVESTATE_IN_SCRIPTED;
}

void PlayerCB_8026764(Player *p)
{
    sub_80218E4(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState |= MOVESTATE_1000000;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 41;

    if (p->unk6E != 0) {
        p->moveState |= MOVESTATE_FACING_LEFT;

        p->speedAirX = MIN(p->speedAirX, -Q_24_8(1.0));
        p->speedGroundX = MIN(p->speedAirX, -Q_24_8(1.0));
    } else {
        p->moveState &= ~MOVESTATE_FACING_LEFT;

        p->speedAirX = MAX(p->speedAirX, Q_24_8(1.0));
        p->speedGroundX = MAX(p->speedAirX, Q_24_8(1.0));
    }

    sub_802669C(p);
    m4aSongNumStart(SE_GRINDING);

    PLAYERFN_SET_AND_CALL(PlayerCB_8026810, p);
}

void PlayerCB_8026810(Player *p)
{
    if (sub_8029E6C(p)) {
        p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;
        p->unk38 = 1;

        gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
        m4aSongNumStop(SE_GRINDING);
    } else {
        if (p->speedGroundX >= 0) {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        } else {
            p->moveState |= MOVESTATE_FACING_LEFT;
        }

        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0)
            p->speedGroundX += GET_ROTATED_ACCEL_2(p->rotation);

        sub_80232D0(p);
        sub_8023260(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        m4aSongNumStartOrContinue(SE_GRINDING);

        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 14;

            p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
            p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;
            p->unk38 = 1;

            gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
            m4aSongNumStop(SE_GRINDING);
            PLAYERFN_SET(PlayerCB_Jumping);
        } else {
            if (IS_SINGLE_PLAYER) {
                sub_801F488();
            }
        }
    }
}

void PlayerCB_80269C0(Player *p)
{
    sub_80218E4(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 9;

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;
    p->unk38 = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);
    PLAYERFN_SET_AND_CALL(PlayerCB_Idle, p);
}

void PlayerCB_8026A4C(Player *p)
{
    sub_80218E4(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
        && (p->unk5C & gPlayerControls.jump)
        && (p->character == CHARACTER_SONIC || p->character == CHARACTER_AMY)) {
        p->unk64 = 42;
        p->speedAirY = -Q_24_8(7.5);
    } else {
        p->unk64 = 39;
        p->speedAirY = -Q_24_8(4.875);
    }

    if (p->moveState & MOVESTATE_40)
        p->speedAirY /= 2;

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;
    p->unk38 = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);

    if (p->speedAirX > 0) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    if (p->speedAirX < 0) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    m4aSongNumStart(SE_JUMP);
    PLAYERFN_SET_AND_CALL(PlayerCB_8029074, p);
}

void sub_8026B64(Player *p)
{
    s16 groundSpeed = p->speedGroundX;

    if ((p->unk2A == 0) && (p->unk5C & (DPAD_LEFT | DPAD_RIGHT))) {
        if ((p->unk5C & DPAD_RIGHT) && (groundSpeed < p->unk44)) {
            groundSpeed += Q_24_8(1.0 / 32.0);
        } else if ((p->unk5C & DPAD_LEFT) && (groundSpeed > Q_24_8(1.0))) {
            groundSpeed -= Q_24_8(1.0 / 32.0);
        }
    }

    if (groundSpeed < Q_24_8(1.0)) {
        groundSpeed += Q_24_8(1.0 / 32.0);
    }

    p->speedGroundX = groundSpeed;
}

void PlayerCB_8026BCC(Player *p)
{
    if (!sub_8029E6C(p)) {
        sub_8026B64(p);
        sub_8023128(p);

        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 accel = GET_ROTATED_ACCEL(p->rotation);
            if (p->speedGroundX)
                p->speedGroundX += accel;
        }

        sub_80232D0(p);
        sub_8023260(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 14;

            PLAYERFN_SET(PlayerCB_Jumping);
        } else if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8)) != MOVESTATE_800) {
            PLAYERFN_SET(PlayerCB_8025318);
        }
    }
}

void PlayerCB_8026D2C(Player *p)
{
    sub_80246DC(p);
    sub_8023610(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);

    if (p->speedAirY >= 0) {
        sub_8022218(p);
        sub_8022284(p);
    } else {
        sub_8022284(p);
        sub_8022218(p);
    }

    PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p);
}

void PlayerCB_8026E24(Player *p)
{
    sub_80218E4(p);

    p->moveState |= (MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->rotation = 0;
    p->unk64 = 4;

    p->moveState &= ~MOVESTATE_FACING_LEFT;

    switch (p->unk6E & 0x30) {
        case 0x00: {
            p->moveState |= MOVESTATE_IN_AIR;
            p->speedAirX = 0;
            p->speedAirY = -Q_24_8(12.0);
            p->speedGroundX = Q_24_8(12.0);
        } break;

        case 0x10: {
            p->moveState |= MOVESTATE_IN_AIR;
            p->speedAirX = 0;
            p->speedAirY = Q_24_8(12.0);
            p->speedGroundX = Q_24_8(12.0);
        } break;

        case 0x20: {
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->moveState |= MOVESTATE_FACING_LEFT;
            p->speedAirX = -Q_24_8(12.0);
            p->speedAirY = 0;
            p->speedGroundX = -Q_24_8(12.0);
        } break;

        case 0x30: {
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->speedAirX = Q_24_8(12.0);
            p->speedAirY = 0;
            p->speedGroundX = Q_24_8(12.0);
        } break;
    }

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
    p->unk38 = 0;

    m4aSongNumStart(SE_SPIN);

    PLAYERFN_SET_AND_CALL(PlayerCB_802A3B8, p);
}

void PlayerCB_8026F10(Player *p)
{
    if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_800) {
        sub_80218E4(p);
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        p->unk64 = 62;

        p->moveState &= ~MOVESTATE_FACING_LEFT;
        m4aSongNumStart(SE_ICE_PARADISE_SLIDE);

        PLAYERFN_SET_AND_CALL(PlayerCB_8026BCC, p);
    } else {
        //_08026F74
        p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->unk64 = 4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_4;

        p->unk99[0] = 30;

        PLAYERFN_SET_AND_CALL(PlayerCB_8025AB8, p);
    }
}

void PlayerCB_8026FC8(Player *p)
{
    sub_80218E4(p);

    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if (p->unk5C & DPAD_LEFT) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }
    if (p->unk5C & DPAD_RIGHT) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    p->unk64 = 63;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_8027040, p);
}

void PlayerCB_8027040(Player *p)
{
    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->rotation -= Q_24_8(4.0 / 256.0);
    } else {
        p->rotation += Q_24_8(4.0 / 256.0);
    }

    sub_8023610(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_8027114(Player *p)
{
    sub_80218E4(p);

    if ((!(p->moveState & MOVESTATE_4) || (p->unk64 != 4))) {
        p->unk64 = 47;
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->rotation = 0;

    if (p->speedAirX > 0) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    } else {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    PLAYERFN_SET_AND_CALL(PlayerCB_8027190, p);
}

void PlayerCB_8027190(Player *p)
{
    s32 u48 = p->unk48;
    s32 u40 = p->unk40;
    s16 speed = p->speedGroundX;

    if (p->unk5C & DPAD_LEFT) {
        speed -= u48;

        if (speed < -u40) {
            speed += u48;

            if (speed > -u40)
                speed = -u40;
        }
    } else if (p->unk5C & DPAD_RIGHT) {
        speed += u48;

        if (speed > +u40) {
            speed -= u48;

            if (speed < +u40)
                speed = +u40;
        }
    } else if (speed > 0) {
        speed -= Q_24_8(8.0 / 256.0);
    } else {
        speed += Q_24_8(8.0 / 256.0);
    }
    p->speedGroundX = speed;

    sub_80232D0(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void PlayerCB_8027250(Player *p)
{
    p->unk2C = 0x78;
    p->unk5A = 0;

    if (ABS(p->speedAirX) <= Q_24_8(2.5)) {
        if (p->speedAirX <= Q_24_8(0.625)) {
            if (p->speedAirX < -Q_24_8(0.625)) {
                p->speedAirX = +Q_24_8(1.5);
            } else {
                if ((p->moveState & MOVESTATE_FACING_LEFT)) {
                    p->speedAirX = +Q_24_8(1.5);
                } else {
                    p->speedAirX = -Q_24_8(1.5);
                }
            }
        } else {
            p->speedAirX = -Q_24_8(1.5);
        }
        p->unk64 = 0x14;
    } else {
        if (p->speedAirX >= 0) {
            p->speedAirX = +Q_24_8(1.5);
        } else {
            p->speedAirX = -Q_24_8(1.5);
        }
        p->unk64 = 0x15;
    }

    p->speedAirY = -Q_24_8(3.0);

    if (p->moveState & MOVESTATE_40) {
        p->speedAirY >>= 1;
        p->speedAirX >>= 1;
    }

    sub_80218E4(p);

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_200 | MOVESTATE_8 | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(PlayerCB_8027324, p);
}

void PlayerCB_8027324(Player *p)
{
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_80273D0(Player *p)
{
    if (IS_MULTI_PLAYER) {
        sub_802A4B8(p);
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_802A468(p);
    } else {
        if (gGameMode == GAME_MODE_TIME_ATTACK)
            gSpecialRingCount = 7;

        if ((gPlayer.moveState & MOVESTATE_8000000) && (gSpecialRingCount > 6)) {
            sub_802A40C(p);
        } else {
            sub_80218E4(p);

            p->moveState &= ~(MOVESTATE_4 | MOVESTATE_FACING_LEFT);

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

            if (p->speedGroundX <= 0) {
                sub_802785C(p);
            } else {
                p->unk64 = 9;

                p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;

                p->moveState &= ~MOVESTATE_IGNORE_INPUT;

                PLAYERFN_SET_AND_CALL(PlayerCB_GoalSlowdown, p);
            }
        }
    }
}

void PlayerCB_GoalSlowdown(Player *p)
{
    u32 playerX = Q_24_8_TO_INT(p->x);
    u16 playerX2;

    playerX2 = playerX - gStageGoalX;

    if (((p->speedGroundX >= Q_24_8(2.0)) && (p->unk5E & DPAD_LEFT))
        || (playerX2 > 0x579)) {
        p->unk64 = 25;

        p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;

        m4aSongNumStart(SE_LONG_BRAKE);
        PLAYERFN_SET_AND_CALL(PlayerCB_GoalBrake, p);
    } else {
        s32 grnd = p->speedGroundX;
        if (grnd > 0) {
            s32 speedOg = p->speedGroundX - Q_24_8(8.0 / 256.0);
            s16 speed = speedOg;
            if (speed <= 0)
                speed = 0;

            p->speedGroundX = speed;
        } else {
            p->speedGroundX = 0;
        }

        if (p->speedGroundX <= 0) {
            sub_802785C(p);
        } else {
            if (gCamera.shiftY > -56)
                gCamera.shiftY--;

            sub_80232D0(p);
            sub_8023260(p);

            PLAYERFN_UPDATE_POSITION(p);

            sub_8022D6C(p);

            PLAYERFN_UPDATE_UNK2A(p);
        }
    }
}

void PlayerCB_GoalBrake(Player *p)
{
    u16 cAnim = GET_CHARACTER_ANIM(p);

    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    if (cAnim == SA2_CHAR_ANIM_31) {
        if ((p->variant == 0) && (p->unk90->s.unk10 & SPRITE_FLAG_MASK_ANIM_OVER)) {
            p->unk64 = 26;
        }

        if ((p->variant == 1) && (p->speedGroundX <= 0)) {
            p->unk64 = 27;
            p->speedGroundX = 0;
            m4aSongNumStop(SE_LONG_BRAKE);

            if (gStageGoalX != 0) {
                u16 playerX = Q_24_8_TO_INT(p->x) - gStageGoalX;
                s32 r8 = 0;

                if (playerX <= 730)
                    r8 = 800;
                else if (playerX <= 1114)
                    r8 = 500;
                else if (playerX <= 1401)
                    r8 = 100;

                if (r8 != 0) {
                    INCREMENT_SCORE(r8);

                    CreateStageGoalBonusPointsAnim(Q_24_8_TO_INT(p->x),
                                                   Q_24_8_TO_INT(p->y), r8);
                }
            }
        }

        if ((p->variant == 2) && (p->unk90->s.unk10 & SPRITE_FLAG_MASK_ANIM_OVER)) {
            sub_802785C(p);
            return;
        }
    }

    p->speedGroundX -= Q_24_8(0.125);
    if (p->speedGroundX < 0)
        p->speedGroundX = 0;

    sub_8029FA4(p);
    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void sub_802785C(Player *p)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    p->unk72 = 90;

    if (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        switch (gCurrentLevel & 0x3) {
            case ACT_1: {
                p->unk64 = 28;
                PLAYERFN_SET(PlayerCB_80278D4);
            } break;

            case ACT_2: {
                p->unk64 = 29;
                PLAYERFN_SET(PlayerCB_80278D4);
            } break;

            case ACT_BOSS: {
                p->unk64 = 32;
            } break;
        }
    } else {
        p->unk64 = 28;
    }
}

void PlayerCB_80278D4(Player *p)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    if (--p->unk72 == 0) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResultsCutScene(gCourseTime);
        } else {
            sub_80304DC(gCourseTime, gRingCount, gSpecialRingCount);
        }
        PLAYERFN_SET(PlayerCB_802A3F0);
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void PlayerCB_80279F8(Player *p)
{
    if (p->speedGroundX > Q_24_8(5.5)) {
        p->speedGroundX -= Q_24_8(0.5);
    } else if (p->speedAirX < Q_24_8(4.75)) {
        p->speedGroundX += Q_24_8(0.25);
    } else {
        p->speedGroundX = Q_24_8(5.0);
    }

    if (p->unk72 < INT16_MAX)
        p->unk72++;

    if (p->unk72 == 120) {
        p->unk64 = 32;
    }

    if (p->unk72 == 180) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResultsCutScene(gCourseTime);
        } else {
            sub_80304DC(gCourseTime, gRingCount, gSpecialRingCount);
        }
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);

    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    if (p->moveState & MOVESTATE_4000000) {
        p->unk5A = 1;
        p->unk5C = 0x10;
        p->speedGroundX = Q_24_8(10.0);
        p->unk64 = 9;
        sub_801583C();

        PLAYERFN_SET(PlayerCB_8027B98);

        m4aSongNumStart(SE_273);
    }
}

void PlayerCB_8027B98(Player *p)
{
    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);

    gCamera.unk8 -= 56;
}

void PlayerCB_8027C5C(Player *p)
{
    // TODO: Maybe this is actually to be considered the p's
    //       x-position relative to a sprite region?
    s32 playerX = Q_24_8_TO_INT(p->x) - gCamera.x;

    if (playerX > 0x78) {
        p->speedGroundX = Q_24_8(4.5);
    } else if (playerX < 0x78) {
        p->speedGroundX = Q_24_8(5.5);
    } else {
        p->speedGroundX = Q_24_8(5.0);
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void PlayerCB_8027D3C(Player *p)
{
    s8 *someSio = gUnknown_030054B4;
    s32 sioDat = ((REG_SIOCNT_32 << 26) >> 30);
    u16 r8 = someSio[sioDat];
    u32 *pCmpX = &gStageGoalX;
    u32 cmpX;
    s32 index = (0x40 + (r8 * 32));

    cmpX = Q_24_8(*pCmpX + index);
    if (p->x < cmpX) {
        p->unk5C = DPAD_RIGHT;
    } else if (p->x > cmpX) {
        p->unk5C = DPAD_LEFT;
    } else {
        p->unk5C = 0;
    }

    sub_802966C(p);
    if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
        s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

        if (p->speedGroundX != 0) {
            p->speedGroundX += acceleration;
        }
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);

    if (((p->x > cmpX) && (p->unk5C == DPAD_RIGHT)) // fmt
        || ((p->x < cmpX) && (p->unk5C == DPAD_LEFT)) //
        || (p->x == cmpX)) {
        p->unk5A = 0;
        p->speedAirX = 0;
        p->speedAirY = 0;
        p->speedGroundX = 0;
        p->x = cmpX;

        // TODO: Check correctness of MULTI_SIO_PLAYERS_MAX being here!
        if (r8 < MULTI_SIO_PLAYERS_MAX) {
            p->unk64 = 28;
        } else {
            p->unk64 = 0;
        }

        p->moveState &= ~MOVESTATE_FACING_LEFT;
        p->unk72 = 0;
        p->unk5C = 0;

        PLAYERFN_SET(PlayerCB_802A4FC);
    }
}

void sub_8027EF0(Player *p)
{
    if (p->moveState & MOVESTATE_IN_AIR) {
        sub_8023610(p);
        sub_80236C8(p);
        sub_80232D0(p);

        PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        PLAYERFN_UPDATE_POSITION(p);
        PLAYERFN_UPDATE_ROTATION(p);
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
    } else {
        sub_80232D0(p);
        sub_80231C0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);
    }
}

void sub_802808C(Player *p)
{
    if (p->moveState & MOVESTATE_IN_AIR) {
        sub_80232D0(p);

        PLAYERFN_UPDATE_POSITION(p);
        PLAYERFN_UPDATE_ROTATION(p);
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
    } else {
        sub_80232D0(p);
        sub_80231C0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);
    }
}

void sub_8028204(Player *p)
{
    sub_8023610(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void sub_80282EC(Player *p)
{
    p->unk48 >>= 1;

    sub_8023610(p);

    if (p->character == CHARACTER_TAILS) {
        sub_80236C8(p);
    }

    sub_80232D0(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void sub_80283C4(Player *p)
{
    sub_80232D0(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void sub_8028478(Player *p)
{
    if (p->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(p);
        sub_80232D0(p);

        PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        PLAYERFN_UPDATE_POSITION(p);
        PLAYERFN_UPDATE_ROTATION(p);
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
    } else {
        if (((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->speedGroundX != 0) {
                p->speedGroundX += acceleration;
            }
        }

        sub_80232D0(p);
        sub_80231C0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);
    }
}

/* Starting here, callbacks appear to have a different style,
   but they still use macros like PLAYERFN_UPDATE_POSITION */

struct Task *sub_8028640(s32 p0, s32 p1, s32 p2)
{
    struct Task *t;
    TaskStrc_801F15C *taskStrc;
    Sprite *s;

    u16 p2_ = p2;

    t = sub_801F15C(p0, p1, 232, gPlayer.unk60, Task_801F214, TaskDestructor_801F550);

    taskStrc = TaskGetStructPtr(t);
    taskStrc->playerAnim = gPlayer.anim;
    taskStrc->playerVariant = gPlayer.variant;

    s = &taskStrc->s;
    s->graphics.dest = VramMalloc(gUnknown_080D69A6[p2_][0]);
    s->graphics.anim = gUnknown_080D69A6[p2_][1];
    s->variant = gUnknown_080D69A6[p2_][2];
    s->unk1A = SPRITE_OAM_ORDER(7);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

// Set when doing tricks
void PlayerCB_80286F0(Player *p)
{
    u32 dir = p->unk5B;
    u16 character = p->character;
    u8 mask = sTrickMasks[dir][character];

    sub_80218E4(p);

    p->moveState |= (MOVESTATE_2000 | MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if (mask & MASK_80D6992_4)
        p->unk72 = 10;
    else if (mask & MASK_80D6992_8)
        p->unk72 = 45;

    p->speedAirX = 0;
    p->speedAirY = 0;

    p->unk64 = gUnknown_080D698A[dir];
    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    m4aSongNumStart(SE_JUMP);
    m4aSongNumStart(SE_230);

    PLAYERFN_SET_AND_CALL(PlayerCB_80287AC, p);
}

void PlayerCB_80287AC(Player *p)
{
    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
        u32 dir = p->unk5B;
        u16 character = p->character;
        p->variant++;

        p->speedAirX = sTrickAccel[dir][character][0];
        p->speedAirY = sTrickAccel[dir][character][1];

        if (p->moveState & MOVESTATE_FACING_LEFT)
            p->speedAirX = -p->speedAirX;

        PLAYERFN_SET(PlayerCB_802890C);

        if (IS_SINGLE_PLAYER) {
            if (dir == TRICK_DIR_FORWARD && character == CHARACTER_SONIC) {
                sub_8028640(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), 0);
            }
            if (dir == TRICK_DIR_UP && character == CHARACTER_KNUCKLES) {
                sub_8028640(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), 1);
            }
            if (dir == TRICK_DIR_FORWARD && character == CHARACTER_AMY) {
                CreateHeartParticles();
            }
        }
    }

    sub_80232D0(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_802890C(Player *p)
{
    u32 dir = p->unk5B;
    u16 character = p->character;
    u8 mask = sTrickMasks[dir][character];

    if ((mask & MASK_80D6992_1) && (p->variant == 1) && (p->speedAirY > 0)) {
        p->variant = 2;
    }

    if (p->unk72 != 0) {
        p->unk72--;
    } else {
        if (mask & MASK_80D6992_4)
            mask &= ~MASK_80D6992_4;

        if ((mask & MASK_80D6992_8) && (p->unk64 != 14))
            p->unk64 = 14;
    }

    if (!(mask & MASK_80D6992_2) || (p->speedAirY > 0)) {
        sub_8023610(p);
    }

    if (!(mask & MASK_80D6992_4)) {
        sub_80236C8(p);
    }

    sub_80232D0(p);

    if (mask & MASK_80D6992_10) {
        PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p);
    } else {
        if (!(mask & MASK_80D6992_4)) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }
    }

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);

    if (!(p->moveState & MOVESTATE_IN_AIR) && (p->character == CHARACTER_KNUCKLES)
        && (p->unk5B == 2)) {
        p->variant++;
        PLAYERFN_SET(PlayerCB_802A3C4);
    }
}

void DoTrickIfButtonPressed(Player *p)
{
    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->unk36 == 0)
        && (p->unk5E & gPlayerControls.trick)) {

        if (p->unk5C & DPAD_UP) {
            INCREMENT_SCORE(sTrickPoints[0]);
            p->unk5B = TRICK_DIR_UP;
            PLAYERFN_SET(PlayerCB_80286F0);
        } else if (p->unk5C & DPAD_DOWN) {
            INCREMENT_SCORE(sTrickPoints[3]);

            switch (p->character) {
                case CHARACTER_SONIC: {
                    p->moveState |= MOVESTATE_20000000;
                    PLAYERFN_SET(PlayerCB_8011F1C);
                } break;

                case CHARACTER_KNUCKLES: {
                    p->moveState |= MOVESTATE_20000000;
                    PLAYERFN_SET(PlayerCB_8013D18);
                } break;

                case CHARACTER_AMY: {
                    p->moveState |= MOVESTATE_20000000;
                    PLAYERFN_SET(PlayerCB_8011F1C);
                } break;

                default: {
                    p->unk5B = TRICK_DIR_DOWN;
                    PLAYERFN_SET(PlayerCB_80286F0);
                } break;
            }
        } else if ((!(p->moveState & MOVESTATE_FACING_LEFT) && (p->unk5C & DPAD_RIGHT))
                   || ((p->moveState & MOVESTATE_FACING_LEFT)
                       && (p->unk5C & DPAD_LEFT))) {
            INCREMENT_SCORE(sTrickPoints[2]);
            p->unk5B = TRICK_DIR_FORWARD;

            PLAYERFN_SET(PlayerCB_80286F0);
        } else {
            INCREMENT_SCORE(sTrickPoints[1]);
            p->unk5B = TRICK_DIR_BACKWARD;

            PLAYERFN_SET(PlayerCB_80286F0);
        }
    }
}

void PlayerCB_8028D74(Player *p)
{
    sub_80218E4(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->unk16 < 6) || (p->unk17 < 9)) {
        u16 cAnim = GET_CHARACTER_ANIM(p);

        if ((cAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (cAnim == SA2_CHAR_ANIM_JUMP_1)
            || (cAnim == SA2_CHAR_ANIM_JUMP_2) || (cAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_8029074, p);
}

void PlayerCB_TouchNormalSpring(Player *p)
{
    u8 u6E = p->unk6E;
    u8 r5 = (u6E >> 4);
    u8 r6 = u6E % 4;

    sub_80218E4(p);

    if (((r5 == 2) || (r5 == 3)) && !(p->moveState & MOVESTATE_IN_AIR)) {
        p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);
    } else {
        p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    }

    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1))
        || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        p->unk64 = 37;
    } else if (ABS(p->speedAirX) < Q_24_8(2.5)) {
        p->unk64 = 38;
    } else {
        p->unk64 = 39;
    }

    p->unk66 = -1;

    switch (r5) {
        case 0: {
            p->speedAirY = -sSpringAccelY[r6];
        } break;

        case 1: {
            p->speedAirY = +sSpringAccelY[r6];
        } break;

        case 2: {
            p->speedAirX = -sSpringAccelX[r6];

            if (!(p->moveState & MOVESTATE_IN_AIR) && p->speedAirX < -Q_24_8(9.0)) {
                p->unk5A = 1;
            }
        } break;

        case 3: {
            p->speedAirX = +sSpringAccelX[r6];

            if (!(p->moveState & MOVESTATE_IN_AIR) && p->speedAirX > +Q_24_8(9.0)) {
                p->unk5A = 1;
            }
        } break;

        case 4: {
            p->speedAirX = -sSpringAccelX[r6];
            p->speedAirY = -sSpringAccelY[r6];
        } break;

        case 5: {
            p->speedAirX = +sSpringAccelX[r6];
            p->speedAirY = -sSpringAccelY[r6];
        } break;

        case 6: {
            p->speedAirX = -sSpringAccelX[r6];
            p->speedAirY = +sSpringAccelY[r6];
        } break;

        case 7: {
            p->speedAirX = +sSpringAccelX[r6];
            p->speedAirY = +sSpringAccelY[r6];
        } break;
    }

    p->unk36 = gUnknown_080D69C2[r6];

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1))
        || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        {
            s32 speed = (p->speedAirX * 5);
            if (speed < 0) {
                speed += 3;
            }
            p->speedAirX = speed >> 2;
        }
        {
            s32 speed = (p->speedAirY * 5);
            if (speed < 0) {
                speed += 3;
            }
            p->speedAirY = speed >> 2;
        }
    }

    if (p->moveState & MOVESTATE_40) {
        p->speedAirY /= 2;
    }

    if (p->speedAirX > Q_24_8(1.25)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (p->speedAirX < -Q_24_8(1.25)) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    PLAYERFN_SET_AND_CALL(PlayerCB_8029074, p);
}

void PlayerCB_8029074(Player *p)
{
    sub_80246DC(p);
    DoTrickIfButtonPressed(p);
    sub_8023610(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_8029158(Player *p)
{
    sub_80218E4(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_8);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 40;
    p->unk66 = -1;

    if (p->speedAirX > Q_24_8(1.25)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (p->speedAirX < -Q_24_8(1.25)) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    switch (p->unk6E) {
        case 0: {
            s32 groundSpeed = p->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            p->speedAirX = r5 + Q_24_8(3.75);
            p->speedAirY = res + -Q_24_8(3.75);
        } break;

        case 1:
        case 2: {
            s32 groundSpeed = p->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            p->speedAirX = r5 + Q_24_8(3.75);
            p->speedAirY = res + -Q_24_8(7.50);
        } break;

        case 3: {
            s32 groundSpeed = p->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            p->speedAirX = r5 + Q_24_8(5.625);
            p->speedAirY = res + -Q_24_8(2.50);
        } break;

        case 4:
        case 5: {
            s32 groundSpeed = p->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            p->speedAirX = r5 + Q_24_8(11.25);
            p->speedAirY = res + -Q_24_8(2.50);
        } break;
    }

    if (p->moveState & MOVESTATE_40) {
        p->speedAirY >>= 1;
    }

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->speedAirX = -p->speedAirX;
    }

    m4aSongNumStart(SE_276);

    PLAYERFN_SET_AND_CALL(PlayerCB_8029314, p);
}

void PlayerCB_8029314(Player *p)
{
    if ((p->unk64 == 40) && (p->variant == 0) && (p->speedAirY > 0))
        p->variant = 1;

    DoTrickIfButtonPressed(p);
    sub_8023708(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void PlayerCB_802940C(Player *p)
{
    if (--p->unk72 == -1) {
        PLAYERFN_SET(PlayerCB_8029074);
    }

    sub_80246DC(p);
    DoTrickIfButtonPressed(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

// TODO: Fix the goto-match
bool32 sub_80294F4(Player *p)
{
    u16 song;
    if (!(p->moveState & MOVESTATE_20000000)) {
        if (p->unk5E & gPlayerControls.attack) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    PlayerCB_8011F1C(p);
                    return TRUE;
                } break;

                case CHARACTER_CREAM: {
                    if ((p->unk5C & DPAD_ANY) == DPAD_DOWN) {
                        sub_8012888(p);
                    } else {
                        sub_80128E0(p);
                    }
                    return TRUE;
                } break;

                case CHARACTER_KNUCKLES: {
                    PlayerCB_8013D18(p);
                    return TRUE;
                } break;

                case CHARACTER_AMY: {
                    PlayerCB_8011F1C(p);
                    return TRUE;
                } break;
            }
        }
        // _0802956E
        if (p->unk5E & gPlayerControls.jump) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    if (!IS_BOSS_STAGE(gCurrentLevel)
                        && gUnknown_030054C0.unk0 < 0x4000) {
                        sub_8012194(p);
                        return TRUE;
                    } else {
                        p->moveState |= MOVESTATE_20000000;
                        p->unk64 = 18;
                        sub_8011B88(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), 1);
                        song = SE_SONIC_INSTA_SHIELD;
                        goto sub_80294F4_PlaySfx;
                    }
                } break;

                case CHARACTER_CREAM: {
                    sub_8012644(p);
                    return TRUE;
                } break;

                case CHARACTER_TAILS: {
                    if (!(p->moveState & MOVESTATE_40)) {
                        sub_8012BC0(p);
                        p->moveState |= MOVESTATE_20000000;
                        return TRUE;
                    }
                } break;

                case CHARACTER_KNUCKLES: {
                    if (!(p->moveState & MOVESTATE_40)) {
                        sub_8013AD8(p);
                        return TRUE;
                    }
                } break;

                case CHARACTER_AMY: {
                    p->moveState |= MOVESTATE_20000000;
                    p->unk64 = 18;
                    sub_8015BD4(2);

                    song = SE_AMY_SUPER_HAMMER_ATTACK;
                sub_80294F4_PlaySfx:
                    m4aSongNumStart(song);
                    // TODO / BUG?
                    // there's no return TRUE; for Amy
                } break;
            }
        }
    }

    return FALSE;
}

// (85.13%) https://decomp.me/scratch/HZn3x
NONMATCH("asm/non_matching/game/playercb__sub_802966C.inc", void sub_802966C(Player *p))
{
    u8 r6 = -1;
    s32 u48 = p->unk48;
    s32 u4C = p->unk4C;

    if ((p->unk2A == 0) && p->unk5C & (DPAD_LEFT | DPAD_RIGHT)) {
        // _08029690
        if (p->speedGroundX > 0) {
            if (p->unk5C & DPAD_RIGHT) {
                if (p->speedGroundX < p->unk44) {
                    p->speedGroundX += u48;

                    if (p->speedGroundX > p->unk44) {
                        p->speedGroundX = p->unk44;
                    }
                } else {
                    p->unk58 += u48;
                }
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if (p->speedGroundX >= Q_24_8(2.0)) {
            // _080296D2
            argh:
                if ((p->unk64 == 7) || (p->unk64 == 8)) {
                    r6 = p->unk64;
                } else {
                    r6 = (p->unk54 > 3) ? 8 : 7;
                }
                p->speedGroundX -= u4C;
            }

            // _080297A2
            sub_8029FA4(p);
            m4aSongNumStart(SE_BRAKE);
        } else if (p->speedGroundX < 0) {
            // _08029734
            if (p->moveState & MOVESTATE_20) {
                if ((p->unk64 == 7) || (p->unk64 == 8)) {
                    r6 = p->unk64;
                }

                if (p->speedGroundX > -p->unk44) {
                    p->speedGroundX -= u48;

                    if (p->speedGroundX < -p->speedGroundX) {
                        p->speedGroundX = -p->speedGroundX;
                    }
                } else {
                    // _0802975C
                    p->unk58 += u48;
                }
                p->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                // _08029770
                if (p->speedGroundX <= -Q_24_8(2.0)) {
                    if ((p->unk64 == 7) || (p->unk64 == 8)) {
                        r6 = p->unk64;
                    } else {
                        r6 = (p->unk54 > 3) ? 8 : 7;
                    }

                    p->speedGroundX += u4C;

                    // _080297A2
                    sub_8029FA4(p);
                    m4aSongNumStart(SE_BRAKE);
                } else {
                    // _080297B2
                    p->speedGroundX += u4C;

                    if ((p->speedGroundX < 0)
                        && !(p->moveState & MOVESTATE_FACING_LEFT)) {
                        goto skip_block;
                    } else {
                        goto argh;
                    }
                }
            }
        } else {
            // _080297C8
            if ((p->moveState & MOVESTATE_FACING_LEFT)
                != ((p->unk5C & DPAD_RIGHT) >> 4)) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->speedGroundX -= u48;
                } else {
                    p->speedGroundX += u48;
                }

                r6 = 9;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            } else {
                PLAYERFN_SET(PlayerCB_802A5C4);
            }
        }
    } else {
        // _0802980C
        s32 grndSpeed = p->speedGroundX;
        if (grndSpeed > 0) {
            s16 val = grndSpeed - Q_24_8(8.0 / 256.0);
            if (val <= 0) {
                r6 = 0;
                val = 0;
            } else {
                r6 = 9;
            }
            p->speedGroundX = val;
        } else if (grndSpeed < 0) {
            // _08029820
            s16 val = grndSpeed + Q_24_8(8.0 / 256.0);
            if (val >= 0) {
                r6 = 0;
                val = 0;
            } else {
                r6 = 9;
            }
            p->speedGroundX = val;

        } else {
            // _0802983A
            r6 = 0;
        }
    }
    // _0802983C
skip_block:
    if (p->moveState & MOVESTATE_8000) {
        s8 r6s = r6;
        if ((r6s == 7) || (r6s == 8)) {
            p->unk64 = r6s;
        }
    } else if ((s8)r6 != -1) {
        //_08029860
        if (p->unk64 != (s8)r6)
            p->unk64 = (s8)r6;
    } else if ((p->unk64 == 7) || (p->unk64 == 8)) {
        p->unk64 = 9;
    }

    sub_8023128(p);
}
END_NONMATCH

void sub_802989C(Player *p)
{
    if (gRingCount >= 150) {
        p->unk52 = 4;
    } else if (gRingCount >= 100) {
        p->unk52 = 3;
    } else if (gRingCount >= 50) {
        p->unk52 = 2;
    } else if (gRingCount > 10) {
        p->unk52 = 1;
    } else {
        p->unk52 = 0;
    }
}

void sub_80298DC(Player *p)
{
    // TODO: unk5A Might be isBoostActive ?
    bool32 isBoostActive = p->unk5A;
    if (isBoostActive) {
        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->unk58 = gUnknown_080D6916[p->unk52];

            if (ABS(p->speedGroundX) < Q_24_8(4.5)) {
                p->unk5A = FALSE;
                p->unk58 = 0;
            }
        }
    } else {
        if ((!(p->moveState & MOVESTATE_IN_AIR))
            && ((ABS(p->speedGroundX) >= p->unk44))) {
            if (p->unk58 >= gUnknown_080D6916[p->unk52]) {
                p->unk5A = TRUE;
                gCamera.unk8 = 0x400;

                CreateBoostModeParticles();

                m4aSongNumStart(SE_221);
            }
        } else {
            p->unk58 = isBoostActive;
        }
    }
}

void sub_8029990(Player *p)
{
    s32 absSpeed = ABS(p->speedGroundX);

    if (absSpeed <= Q_24_8(1.25)) {
        p->unk54 = 0;
    } else if (absSpeed <= Q_24_8(2.5)) {
        p->unk54 = 1;
    } else if (absSpeed <= Q_24_8(4.0)) {
        p->unk54 = 2;
    } else if (absSpeed <= Q_24_8(9.0)) {
        p->unk54 = 3;
    } else if (absSpeed <= Q_24_8(10.0)) {
        p->unk54 = 4;
    } else {
        p->unk54 = 5;
    }
}

void CallSetStageSpawnPos(u32 character, u32 level, u32 p2, Player *p)
{
    SetStageSpawnPos(character, level, p2, p);
}

void sub_80299FC(Player *p)
{
    TaskDestroy(p->spriteTask);
    p->spriteTask = NULL;

    if (p->unk60 == 0) {
        sub_801F78C();
        sub_8021350();
    }
}

s32 sub_8029A28(Player *p, u8 *p1, s32 *out)
{
    s32 result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_802195C(p, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

s32 sub_8029A74(Player *p, u8 *p1, s32 *out)
{
    s32 result;

    u8 dummy;

    s32 dummyInt;
    s32 p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8021A34(p, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

s32 sub_8029AC0(Player *p, u8 *p1, s32 *out)
{
    s32 result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8021B08(p, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

s32 sub_8029BB8(Player *p, u8 *p1, s32 *out);

s32 sub_8029B0C(Player *p, u8 *p1, s32 *out)
{
    s32 result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8029BB8(p, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

s32 sub_8029B58(Player *p, u8 *p1, int *out)
{
    s32 result;

    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, p1, out);
    } else {
        result = sub_8029AC0(p, p1, out);
    }

    return result;
}

s32 sub_8029B88(Player *p, u8 *p1, int *out)
{
    s32 result;

    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, p1, out);
    } else {
        result = sub_8029B0C(p, p1, out);
    }

    return result;
}

// Very similar to sub_802195C
s32 sub_8029BB8(Player *p, u8 *p1, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerY2 = Q_24_8_TO_INT(p->y) + p->unk17;
    playerX2 = Q_24_8_TO_INT(p->x) - (2 + p->unk16);

    mask = p->unk38;
    if (p->speedAirY < 0) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerY2, playerX2, mask, 8, &anotherByte, sub_801EE64);

    playerY = Q_24_8_TO_INT(p->y) + p->unk17;
    playerX = Q_24_8_TO_INT(p->x) + (2 + p->unk16);

    mask = p->unk38;
    if (p->speedAirY < 0) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerY, playerX, mask, 8, &anotherByte2, sub_801EE64);

    if (r5 < r1) {
        result = r5;
        *p1 = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *p1 = anotherByte2;
        *out = r5;
    }

    return result;
}

void sub_8029C84(Player *p)
{
    s32 rot = p->rotation + Q_24_8(0.25);

    if ((rot & UINT8_MAX) > INT8_MAX)
        p->speedGroundX = 0;
}

void sub_8029CA0(Player *p)
{
    s32 rot = p->rotation;
    if (((rot + Q_24_8(0.375)) & 0xFF) < 0xC0) {
        rot = GET_ROTATED_ACCEL(rot);

        if (p->speedGroundX != 0) {
            p->speedGroundX += rot;
        }
    }
}

void sub_8029CE0(Player *p)
{
    s32 rot = p->rotation;
    if (((rot + Q_24_8(0.375)) & 0xFF) < 0xC0) {
        s32 other = GET_ROTATED_ACCEL_2(rot);

        p->speedGroundX += other;
    }
}

void sub_8029D14(Player *p)
{
#ifndef NON_MATCHING
    register s32 grndSpeed asm("r2") = p->speedGroundX;
#else
    s32 grndSpeed = p->speedGroundX;
#endif

    if ((((p->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) && grndSpeed != 0) {
        s32 accelInt = Q_24_8_TO_INT(GET_ROTATED_ACCEL_3(p->rotation));

        if (grndSpeed > 0) {
            if (accelInt <= 0) {
                accelInt = (accelInt >> 2);
            }
        } else {
            if (accelInt >= 0) {
                accelInt = (accelInt >> 2);
            }
        }

        p->speedGroundX = grndSpeed + accelInt;
    }
}

void PlayerFn_Cmd_UpdatePosition(Player *p) { PLAYERFN_UPDATE_POSITION(p); }

void PlayerFn_Cmd_UpdateAirFallSpeed(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED(p); }

bool32 sub_8029DE8(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 playerY = p->y;

    if (!(p->moveState & MOVESTATE_80000000)) {
        if (GRAVITY_IS_INVERTED) {
            if (playerY <= Q_24_8(cam->unk28))
                return TRUE;
        } else {
            if (playerY >= Q_24_8(cam->unk2C) - 1)
                return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_8029E24(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 playerY = p->y;

    if (!(p->moveState & MOVESTATE_80000000)) {
        if (GRAVITY_IS_INVERTED) {
            if (playerY <= Q_24_8(cam->y - (DISPLAY_HEIGHT / 2)))
                return TRUE;
        } else {
            if (playerY >= Q_24_8(cam->y) + Q_24_8(DISPLAY_HEIGHT + 80) - 1)
                return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_8029E6C(Player *p)
{
    u8 rot = p->rotation;

    if (p->unk5E & gPlayerControls.jump) {
        if (GRAVITY_IS_INVERTED) {
            rot += Q_24_8(0.25);
            rot = -rot;
            rot -= Q_24_8(0.25);
        }

        if (sub_8022F58(rot + Q_24_8(0.5), p) > 3) {
            PLAYERFN_SET(PlayerCB_Jump);
            return TRUE;
        }
    }

    return FALSE;
}

void sub_8029ED8(Player *p) { PLAYERFN_UPDATE_UNK2A(p); }

void sub_8029F20(Player *p) { PLAYERFN_UPDATE_ROTATION(p); }

/* This could be a different module starting here? */

void ContinueLevelSongAfterDrowning(Player *p)
{
    p->unk87 = 60;
    p->unk86 = 30;

    if (gMPlayTable[0].info->songHeader == gSongTable[MUS_DROWNING].header) {
        if (p->unk60 == 0) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
    }
}

void sub_8029FA4(Player *p)
{
    u8 mask = (p->moveState & MOVESTATE_8000000) ? 0x7 : 0x3;

    if ((gStageTime & mask) == 0) {
        s32 u17 = p->unk17;

        if (GRAVITY_IS_INVERTED) {
            u17 = -u17;
        }

        CreateBrakingDustEffect(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y) + u17);
    }
}

void Player_SetMovestate_IsInScriptedSequence(void)
{
    gPlayer.moveState |= MOVESTATE_IN_SCRIPTED;
}

void Player_ClearMovestate_IsInScriptedSequence(void)
{
    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
}

void sub_802A018(void)
{
    gPlayer.transition = PLTRANS_PT10;
    gUnknown_03005424
        |= (EXTRA_STATE__DISABLE_PAUSE_MENU | EXTRA_STATE__2 | EXTRA_STATE__ACT_START);

    if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        gUnknown_03005424 |= EXTRA_STATE__TURN_OFF_TIMER;
    }
}

void sub_802A050(void)
{
    gUnknown_03005424
        |= (EXTRA_STATE__DISABLE_PAUSE_MENU | EXTRA_STATE__2 | EXTRA_STATE__ACT_START);

    if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        gUnknown_03005424 |= EXTRA_STATE__TURN_OFF_TIMER;
    }
}

void TaskDestructor_802A07C(void)
{
    gPlayer.spriteTask = NULL;

    if (gPlayer.unk60) {
        VramFree(gPlayer.unk90->s.graphics.dest);
    }

    if (gPlayer.character == CHARACTER_CREAM || gPlayer.character == CHARACTER_TAILS) {
        VramFree(gPlayer.unk94->s.graphics.dest);
    }
}

bool32 sub_802A0C8(Player *p)
{
    if (((p->unk5C & DPAD_ANY) == DPAD_UP) && p->speedGroundX == 0) {
        PLAYERFN_SET(PlayerCB_802A620);
        return TRUE;
    }

    return FALSE;
}

bool32 sub_802A0FC(Player *p)
{
    if ((p->unk5C & DPAD_ANY) == DPAD_DOWN) {
        if ((p->speedGroundX == 0) && (((p->rotation + Q_24_8(0.125)) & 0xC0) == 0)
            && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_4 | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(PlayerCB_802A228);
            return TRUE;
        } else if (((u16)(p->speedGroundX + (Q_24_8(0.5) - 1)) > Q_24_8(1.0) - 2)
                   && !(p->moveState
                        & (MOVESTATE_1000000 | MOVESTATE_4 | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(PlayerCB_8025A0C);
            m4aSongNumStart(SE_SPIN_ATTACK);
            return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_802A184(Player *p)
{
    if (p->unk64 == 2) {
        if (p->unk5E & gPlayerControls.jump) {
            PLAYERFN_SET_AND_CALL(PlayerCB_802631C, p);
            return TRUE;
        }
    }

    return FALSE;
}

void sub_802A1C8(Player *p)
{
    u32 unk52 = p->unk52;
    if (p->unk5A) {
        p->unk44 = Q_24_8(12.0);
        p->unk40 = Q_24_8(15.0);
    } else if (p->moveState & MOVESTATE_4) {
        p->unk44 = Q_24_8(6.0);
        p->unk40 = Q_24_8(15.0);
    } else {
        p->unk44 = Q_24_8(6.0);
        p->unk40 = Q_24_8(9.0);
    }

    p->unk48 = gUnknown_080D6902[unk52][0];
    p->unk4C = gUnknown_080D6902[unk52][1];
}

void PlayerCB_802A228(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->unk64 = 2;
    p->speedGroundX = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_8025854, p);
}

void PlayerCB_802A258(Player *p)
{
    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        if (p->moveState & MOVESTATE_4)
            PlayerCB_8025A0C(p);
        else
            PlayerCB_8025318(p);
    } else {
        p->moveState |= MOVESTATE_40000;
        p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

        PLAYERFN_SET_AND_CALL(PlayerCB_8026D2C, p);
    }
}

bool32 sub_802A2A8(Player *p)
{
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
        || (p->moveState & (MOVESTATE_8000 | MOVESTATE_400))
        || ((p->rotation + Q_24_8(0.25)) << 24 <= 0)) {
        return FALSE;
    } else if (p->unk5E & gPlayerControls.attack) {
        PLAYERFN_SET(PlayerCB_802A714);
        return TRUE;
    } else {
        return FALSE;
    }
}

void PlayerCB_802A300(Player *p)
{
    sub_80218E4(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_8);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk66 = -1;

    p->rotation = 0;

    m4aSongNumStart(SE_DASH_RING);

    PLAYERFN_SET_AND_CALL(PlayerCB_802940C, p);
}

void sub_802A360(Player *p)
{
    sub_80218E4(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 62;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    m4aSongNumStart(SE_ICE_PARADISE_SLIDE);

    PLAYERFN_SET_AND_CALL(PlayerCB_8026BCC, p);
}

void PlayerCB_802A3B8(Player *p) { sub_802808C(p); }

void PlayerCB_802A3C4(Player *p)
{
    sub_8027EF0(p);

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_ANIM_OVER)
        PLAYERFN_SET(PlayerCB_8025A0C);
}

void PlayerCB_802A3F0(Player *p)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;
}

void sub_802A40C(Player *p)
{
    sub_80218E4(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk5A = 0;
    p->unk64 = 9;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);
    p->unk72 = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80279F8, p);
}

void sub_802A468(Player *p)
{
    sub_80218E4(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 9;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    PLAYERFN_SET_AND_CALL(PlayerCB_8027C5C, p);
}

void sub_802A4B8(Player *p)
{
    sub_80218E4(p);
    p->moveState &= ~MOVESTATE_4;
    p->moveState |= MOVESTATE_IGNORE_INPUT;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(PlayerCB_8027D3C, p);
}

void PlayerCB_802A4FC(Player *p) { }

void sub_802A500(Player *p)
{
    if (p->speedAirY >= 0) {
        sub_8022218(p);
        sub_8022284(p);
    } else {
        sub_8022284(p);
        sub_8022218(p);
    }
}

void sub_802A52C(Player *p) { PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p); }

void sub_802A558(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p); }

void sub_802A58C(Player *p)
{
    if (p->unk64 != 20) {
        if (p->unk2C > 0)
            p->unk2C--;
    }
}

void sub_802A5AC(Player *p)
{
    if (p->unk36 != 0)
        p->unk36--;
}

void PlayerCB_802A5C4(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    if (p->unk64 == 7 || p->unk64 == 8) {
        p->unk64 = 6;
    } else {
        p->unk64 = 5;
    }

    p->unk90->s.unk10 &= ~(MOVESTATE_4000);

    p->speedGroundX = 0;
    p->moveState ^= MOVESTATE_FACING_LEFT;

    PLAYERFN_SET_AND_CALL(PlayerCB_8025548, p);
}

void PlayerCB_802A620(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->unk90->s.unk10 &= ~(MOVESTATE_4000);

    p->unk64 = 1;

    p->speedGroundX = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_802569C, p);
}

void sub_802A660(Player *p)
{
    if (p->unk2A == 0) {
        if ((p->unk5C & DPAD_SIDEWAYS) != DPAD_RIGHT) {
            if ((p->unk5C & DPAD_SIDEWAYS) == DPAD_LEFT) {
                s32 grnd = p->speedGroundX;
                if (grnd <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                } else if ((grnd - Q_24_8(0.09375)) < 0) {
                    s32 val = Q_24_8(0.375);
                    p->speedGroundX = -val;
                } else {
                    p->speedGroundX = (grnd - Q_24_8(0.09375));
                }
            }
        } else {
            s32 grnd = p->speedGroundX;
            if (grnd >= 0) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if ((grnd + Q_24_8(0.09375)) > 0) {
                p->speedGroundX = +Q_24_8(0.375);
            } else {
                p->speedGroundX = (grnd + Q_24_8(0.09375));
            }
        }
    }
}

void sub_802A6C0(Player *p)
{
    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;
    p->unk38 = 0x1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
    m4aSongNumStop(SE_GRINDING);
}

void PlayerCB_802A714(Player *p)
{
    switch (p->character) {
        case CHARACTER_SONIC: {
            sub_8011D48(p);
        } break;

        case CHARACTER_CREAM: {
            if (p->unk5A == 0) {
                sub_8012548(p);
            } else {
                sub_8012830(p);
            }
        } break;

        case CHARACTER_TAILS: {
            sub_8012D3C(p);
        } break;

        case CHARACTER_KNUCKLES: {
            if (p->unk5A == 0) {
                sub_8012EEC(p);
            } else {
                sub_8013070(p);
            }
        } break;

        case CHARACTER_AMY: {
            if (p->unk5A == 0) {
                sub_8013F04(p);
            } else {
                sub_8011D48(p);
            }
        } break;
    }
}