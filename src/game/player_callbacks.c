#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"

#include "game/sa1_leftovers/globals.h"
#include "game/sa1_leftovers/collision.h"

#include "game/stage/game_2.h"
#include "game/stage/player_controls.h"
#include "game/amy_attack_heart_effect.h"
#include "game/stage/dust_effect_braking.h"
#include "game/boost_effect.h"
#include "game/player_callbacks.h"

#include "game/stage/collision.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

// NOTE: It seems like this was supposed to store 5 positions for displaying/storing bound motion frames
//       but actually none of the positions are used.
#define NUM_BOUND_MOTION_FRAMES 5
typedef struct {
    /* 0x00 */ s32 px[NUM_BOUND_MOTION_FRAMES];
    /* 0x14 */ s32 py[NUM_BOUND_MOTION_FRAMES];
    /* 0x28 */ u16 prevFrameNum;
    /* 0x2C */ Sprite s;
} TrickBound; /* size: 0x5C */

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

void Player_SonicAmy_WindupSkidAttack(Player *);
void Player_SonicAmy_SkidAttack(Player *);
void Task_SonicBoundMotionFrames(void);
void Player_80123D0(Player *);
void Player_Tails_TailSwipe(Player *p);
void Player_SonicAmy_WindupStopNSlam(Player *);
void Player_SonicAmy_StopNSlam_AfterGroundCollision(Player *);
void Player_SonicAmy_StopNSlam_FallAfterCollision(Player *p);
void TaskDestructor_SonicBoundMotionFrames(struct Task *);
void Player_Sonic_HomingAttack(Player *p);
void Player_Cream_Flying(Player *p);
void Player_Cream_ChaoAttack(Player *p);
void Player_Cream_StepAttack(Player *p);
void Player_Cream_ChaoRollingAttack(Player *p);
void Player_Cream_WindupMidAirChaoAttack(Player *p);
void Player_Tails_8012C2C(Player *p);
void Player_8012D1C(Player *p);
void Player_Knuckles_PunchLeft(Player *p);
void Player_Knuckles_PunchRight(Player *p);
void Player_Knuckles_SpiralAttack(Player *p);
s32 sub_8013644(Player *p);
void sub_801394C(Player *p);
void Player_8013B6C(Player *p);
void Player_Knuckles_Glide(Player *p);
void Player_Knuckles_FallAfterGlide(Player *p);
void Player_Knuckles_GlideSoftLanding(Player *p);
void Player_Knuckles_GlideHardLanding(Player *p);
void Player_Knuckles_Climb(Player *p);
void Player_Knuckles_InitClimbPullUpEdge(Player *p);
void sub_8013CA0(Player *p);

void sub_8022318(Player *p);
void sub_8022838(Player *p);
void sub_80232D0(Player *p);

void sub_8023610(Player *p);
void Player_UpdatePosition(Player *p);
void PlayerFn_Cmd_UpdateAirFallSpeed(Player *p);

const ALIGNED(4) u16 gUnknown_080D5518[3][3] = {
    { 15, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_ATTACK, CHARACTER_SONIC), 3 },
    { 16, SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_1, CHARACTER_SONIC), 1 },
    { 16, SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_SONIC), 3 },
};

const ALIGNED(4) s16 gUnknown_080D552C[6] = { Q(2.0), Q(4.0), Q(6.0), Q(8.0), Q(10.0), 0 };

static const s8 sKnucklesTurnFrameToCharstate[4] = { CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_A, CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_B,
                                                     CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_C, CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_D };

static const u16 sKnucklesAnimData_FX[2][3] = {
    { 30, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_ATTACK, CHARACTER_KNUCKLES), 2 },
    { 25, SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 3 },
};

/* Character: Sonic */

struct Task *Player_SonicAmy_InitSkidAttackGfxTask(s32 x, s32 y, u16 p2)
{
    TaskStrc_801F15C *ts;
    struct Task *t;
    Sprite *s;

    if (IS_MULTI_PLAYER) {
        return NULL;
    }

    t = sub_801F15C(x, y, 0xE8, gPlayer.unk60, Task_801F214, TaskDestructor_801F550);
    ts = TASK_DATA(t);

    switch (p2) {
        case 0: {
            ts->playerAnim = gPlayer.anim;
            ts->playerVariant = gPlayer.variant;
        } break;

        case 1:
        case 2: {
            ts->playerAnim = sCharStateAnimInfo[gPlayer.charState][0];
            ts->playerVariant = sCharStateAnimInfo[gPlayer.charState][1];

            if (gPlayer.charState < CHARSTATE_SHARED_COUNT) {
                AnimId idle = gPlayerCharacterIdleAnims[gPlayer.character];
                ts->playerAnim += idle;
            }
        } break;
    }

    s = &ts->s;

    s->graphics.dest = VramMalloc(gUnknown_080D5518[p2][0]);
    s->graphics.anim = gUnknown_080D5518[p2][1];
    s->variant = gUnknown_080D5518[p2][2];
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

// For Sonic's Down-Trick "Bound"
struct Task *Player_Sonic_Bound(s32 x, s32 y)
{
    if (IS_MULTI_PLAYER) {
        return NULL;
    } else {
        struct Task *t = TaskCreate(Task_SonicBoundMotionFrames, sizeof(TrickBound), 0x4001, 0, TaskDestructor_SonicBoundMotionFrames);

        TrickBound *bound = TASK_DATA(t);
        Sprite *s = &bound->s;

        s16 i;
        for (i = 0; i < NUM_BOUND_MOTION_FRAMES; i++) {
            bound->px[i] = x;
            bound->py[i] = y;
        }

        bound->prevFrameNum = 0;
        s->graphics.dest = VramMalloc(16);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_SONIC);
        s->variant = 3;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(17);
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        return t;
    }
}

// NOTE: Amy only uses this in Boost mode!
void Player_SonicAmy_InitSkidAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_20000000;

    if (!p->isBoosting) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->speedGroundX = -Q(3.0);
        } else {
            p->speedGroundX = +Q(3.0);
        }

        p->charState = CHARSTATE_BOOSTLESS_ATTACK;
    } else {
        p->charState = CHARSTATE_BOOST_ATTACK;
    }

    m4aSongNumStart(SE_TAILS_TAIL_SWIPE);

    PLAYERFN_SET_AND_CALL(Player_SonicAmy_WindupSkidAttack, p);
}

void Player_SonicAmy_WindupSkidAttack(Player *p)
{
    s32 grndSpeed = p->speedGroundX;
    if (grndSpeed > 0) {
        p->speedGroundX = ((grndSpeed - 8) > 0) ? (grndSpeed - 8) : 0;
    } else if (grndSpeed < 0) {
        if ((grndSpeed + 8) <= 0)
            p->speedGroundX = (grndSpeed + 8);
        else
            p->speedGroundX = 0;
    }

    sub_8029C84(p);

    if (p->unk90->s.frameFlags & MOVESTATE_4000) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_CURLED_IN_AIR;
            p->transition = PLTRANS_PT5;
        } else {
            p->variant = 1;
            p->unk6C = TRUE;

            PLAYERFN_SET(Player_SonicAmy_SkidAttack);

            if (!p->isBoosting) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->speedGroundX = -Q(4.0);
                } else {
                    p->speedGroundX = +Q(4.0);
                }
            } else {
                Player_SonicAmy_InitSkidAttackGfxTask(I(p->x), I(p->y), 0);
            }

            p->unk72 = 32;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }
    }

    sub_8027EF0(p);
}

void Player_SonicAmy_SkidAttack(Player *p)
{
    s32 grndSpeed = p->speedGroundX;
    if (grndSpeed > 0) {
        p->speedGroundX = ((grndSpeed - Q(0.125)) > 0) ? (grndSpeed - Q(0.125)) : 0;
    } else if (grndSpeed < 0) {
        if ((grndSpeed + Q(0.125)) <= 0)
            p->speedGroundX = (grndSpeed + Q(0.125));
        else
            p->speedGroundX = 0;
    }

    sub_8029C84(p);

    if (--p->unk72 == -1) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_CURLED_IN_AIR;
            p->transition = PLTRANS_PT5;
        } else {
            p->variant = 2;
            p->unk6C = TRUE;

            PLAYERFN_SET(Player_80123D0);
        }
    }

    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        sub_8029FA4(p);
    }
}

// Seems to initialize the "Stop'n'Slam" moves (Trickmove-Down)
// for Sonic (Bound) & Amy (Mid-Air Hammer Swirl)
void Player_SonicAmy_InitStopNSlam(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_20000000;

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->isBoosting = FALSE;
    p->charState = CHARSTATE_TRICK_DOWN;

    if (p->character == CHARACTER_AMY) {
        m4aSongNumStart(SE_AMY_HAMMER_SWIRL);
    }

#if !DISABLE_TRICK_AIR_WAIT
    p->speedAirX = 0;
    p->speedAirY = 0;
#endif

    PLAYERFN_SET_AND_CALL(Player_SonicAmy_WindupStopNSlam, p);
}

// This move is called:
// - "Bound" for Sonic
// - "Hammer Swirl" for Amy.
void Player_SonicAmy_StopNSlam(Player *p)
{
    p->speedAirY += TRICK__STOP_N_SLAM__DROP_SPEED;

    sub_80283C4(p);

    if ((p->moveState & (MOVESTATE_4000 | MOVESTATE_IN_AIR)) != MOVESTATE_IN_AIR) {
        s32 bounceSpeed;
        s32 rot;
        s32 sinValue;
        s32 bounceImpactAccel = -Q(6.0);

#ifndef NON_MATCHING
        u8 *rotPtr = &p->rotation;
        rotPtr++;
        rotPtr--;
#endif

        // Bounce up after hitting the ground
        sinValue = SIN_24_8(rot = p->rotation * 4);
        p->speedAirX = -I(bounceImpactAccel * sinValue);
        bounceSpeed = I(bounceImpactAccel * (COS_24_8((rot))));
        p->speedAirY = -ABS(bounceSpeed);

        p->speedAirX = HALVE(p->speedAirX);

        PLAYERFN_SET(Player_SonicAmy_StopNSlam_AfterGroundCollision);

        p->moveState |= MOVESTATE_IN_AIR;

        if (p->character == CHARACTER_SONIC) {
            m4aSongNumStart(SE_SONIC_BOUND_IMPACT);
        }

        p->charState = CHARSTATE_INVALID;
    }
}

void Task_SonicBoundMotionFrames(void)
{
    TrickBound *bound = TASK_DATA(gCurTask);
    Sprite *s = &bound->s;
    Vec2_32 pos;

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.speedAirY < Q(2.0)) || (gPlayer.charState != CHARSTATE_TRICK_DOWN)) {
        TaskDestroy(gCurTask);
    } else {
        UpdateSpriteAnimation(s);

        bound->prevFrameNum = ((bound->prevFrameNum - 1) & 0x6);

        // Get player's previous position 'unk28' frames ago
        // and display it
        GetPreviousPlayerPos(&pos, bound->prevFrameNum);
        s->x = I(pos.x) - gCamera.x;
        s->y = I(pos.y) - gCamera.y;

        DisplaySprite(s);
    }
}

void Player_SonicForwardThrust(Player *p)
{
    if (p->moveState & MOVESTATE_10) {
        if (p->heldInput & DPAD_LEFT)
            p->moveState |= MOVESTATE_FACING_LEFT;

        if (p->heldInput & DPAD_RIGHT)
            p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_SONIC_FORWARD_THRUST;

    if (p->moveState & MOVESTATE_FACING_LEFT)
        p->speedAirX -= Q(2.25);
    else
        p->speedAirX += Q(2.25);

    p->speedAirY = 0;
    p->rotation = 0;
    p->unk70 = FALSE;
    p->unk71 = 0;

    m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

    p->unk6E = 0;
    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(Player_80261D8, p);
}

void Player_Sonic_InitHomingAttack(Player *p)
{
    s16 angle = gHomingTarget.angle;
    s32 six = Q(6.0);
    s32 cosVal, sinVal;

    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_BOOST_EFFECT_ON | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->charState = CHARSTATE_SOME_OTHER_ATTACK;

    cosVal = COS_24_8(angle);
    sinVal = SIN_24_8(angle);
    p->speedAirX = I(cosVal * six);
    p->speedAirY = I(sinVal * six) - Q(0.5);

    p->rotation = 0;
    p->unk70 = FALSE;
    p->unk71 = 0;
    p->unk6E = 0;
    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->rotation = 0;
    p->unk72 = GBA_FRAMES_PER_SECOND;

    m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

    PLAYERFN_SET_AND_CALL(Player_Sonic_HomingAttack, p);
}

void Player_801225C(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_20000000 | MOVESTATE_1000000 | MOVESTATE_20);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_FALLING_VULNERABLE_B;

    p->speedAirX = 0;
    p->speedAirY = -Q(4.0);
    p->rotation = 0;

    p->unk70 = TRUE;
    p->unk71 = 0;
    p->unk6E = 0;
    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(Player_80261D8, p);
}

void Player_UpdateHomingPosition(s32 qX, s32 qY)
{
    s32 vecTargetX, vecTargetY;
    s32 sqTargetX, sqTargetY, sqDistance;

    vecTargetX = I(gPlayer.x - qX);
    vecTargetY = I(gPlayer.y - qY);
    sqTargetX = vecTargetX * vecTargetX;
    sqTargetY = vecTargetY * vecTargetY;
    sqDistance = sqTargetX + sqTargetY; // c^2 = a^2 + b^2

    if (gPlayer.character == CHARACTER_SONIC) {
        if (sqDistance < gHomingTarget.squarePlayerDistance) {
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                u16 angle = CLAMP_SIN_PERIOD(sub_8004418(vecTargetX, vecTargetY) - (SIN_PERIOD / 4));
                if (angle <= DEG_TO_SIN(110)) {
                    angle = CLAMP_SIN_PERIOD((SIN_PERIOD / 2) - angle);

                    gHomingTarget.squarePlayerDistance = sqDistance;
                    gHomingTarget.angle = angle;
                }
            } else {
                u16 angle = sub_8004418(-vecTargetY, -vecTargetX);
                if (angle <= DEG_TO_SIN(110)) {
                    gHomingTarget.squarePlayerDistance = sqDistance;
                    gHomingTarget.angle = angle;
                }
            }
        }
    } else if (gPlayer.character == CHARACTER_CREAM) {
        struct Task *t = gCurTask;

        if (sqDistance < gCheeseTarget.squarePlayerDistance) {
            if (((gPlayer.moveState & MOVESTATE_FACING_LEFT) && (vecTargetX >= 0))
                || ((!(gPlayer.moveState & MOVESTATE_FACING_LEFT)) && (vecTargetX <= 0))) {
                gCheeseTarget.squarePlayerDistance = sqDistance;
                gCheeseTarget.task = t;
            }

            if (t->unk15) {
                t->unk16 = I(qX);
                t->unk18 = I(qY);
            }
        }
    }
}

void Player_80123D0(Player *p)
{
    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        PLAYERFN_SET(Player_TouchGround);
    }

    sub_8027EF0(p);
}

void Player_SonicAmy_WindupStopNSlam(Player *p)
{
    sub_80283C4(p);

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        p->variant++;

        p->speedAirY = Q(2.0);
        PLAYERFN_SET(Player_SonicAmy_StopNSlam);

        if (p->character == CHARACTER_SONIC) {
            Player_Sonic_Bound(I(p->x), I(p->y));
        } else if (p->character == CHARACTER_AMY) {
            CreateAmyAttackHeartEffect(AMY_HEART_PATTERN_STOP_N_SLAM);
        }
    }
}

void Player_SonicAmy_StopNSlam_AfterGroundCollision(Player *p)
{
    p->speedAirY += Q(56.0 / 256.0);

    if (p->speedAirY >= 0) {
        p->variant++;
        p->unk6C = TRUE;
        PLAYERFN_SET(Player_SonicAmy_StopNSlam_FallAfterCollision);
    }

    sub_80283C4(p);
}

void Player_SonicAmy_StopNSlam_FallAfterCollision(Player *p)
{
    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->transition = PLTRANS_TOUCH_GROUND;
    }
}

void TaskDestructor_SonicBoundMotionFrames(struct Task *t)
{
    TrickBound *strc = TASK_DATA(t);
    Sprite *s = &strc->s;
    VramFree(s->graphics.dest);
}

void Player_Sonic_HomingAttack(Player *p)
{
    if (--p->unk72 == -1) {
        p->charState = CHARSTATE_FALLING_VULNERABLE_B;
        p->moveState &= ~MOVESTATE_BOOST_EFFECT_ON;
    }

    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        // Hit ground instead of targeted enemy
        p->transition = PLTRANS_TOUCH_GROUND;
    }
}

bool32 Player_Sonic_TryForwardThrust(Player *p)
{
    if (p->character == CHARACTER_SONIC) {
        if (p->unk71 == 1) {
            Player_SonicForwardThrust(p);
            return TRUE;
        }
    }

    return FALSE;
}

/* Character: Cream */

void Player_Cream_InitChaoAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    if (ABS(p->speedGroundX) < Q(0.25)) {
        p->speedGroundX = 0;
        p->charState = CHARSTATE_BOOSTLESS_ATTACK;
    } else {
        p->charState = CHARSTATE_CREAM_CHAO_ATTACK;
    }

    PLAYERFN_SET_AND_CALL(Player_Cream_ChaoAttack, p);
}

void UpdateCreamFlying(Player *p)
{
    if (p->w.cf.flyingDuration == 0) {
        if (p->charState == CHARSTATE_CREAM_FLYING_TIRED)
            m4aSongNumStop(SE_CREAM_FLYING);

        p->charState = CHARSTATE_CREAM_FLYING_TIRED;
    } else {
        if (((p->heldInput & DPAD_LEFT) && !(p->moveState & MOVESTATE_FACING_LEFT))
            || ((p->heldInput & DPAD_RIGHT) && (p->moveState & MOVESTATE_FACING_LEFT))) {
            p->charState = CHARSTATE_CREAM_FLYING_TURNING;
        } else if (p->charState == CHARSTATE_CREAM_FLYING_TURNING) {
            if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                p->charState = CHARSTATE_CREAM_FLYING;
            }
        } else {
            p->charState = CHARSTATE_CREAM_FLYING;
        }

        m4aSongNumStartOrChange(SE_CREAM_FLYING);
    }
}

void Player_Cream_InitFlying(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    if (p->moveState & MOVESTATE_4) {
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->w.cf.flyingDuration = CREAM_FLYING_DURATION;
    p->unk61 = 1;
    p->isBoosting = FALSE;
    p->unk58 = 0;
    gPlayer.moveState |= MOVESTATE_10000000;
    PLAYERFN_SET_AND_CALL(Player_Cream_Flying, p);
}

void Player_Cream_Flying(Player *p)
{
    if (p->w.cf.flyingDuration != 0) {
        p->w.cf.flyingDuration--;

        if (p->heldInput & gPlayerControls.attack) {
            p->charState = CHARSTATE_CREAM_ANIM_20;
            p->transition = PLTRANS_PT5;

            m4aSongNumStop(SE_CREAM_FLYING);
            return;
        }
    }

    if (p->unk61 != 1) {
        if (p->speedAirY >= -Q(0.75)) {
            p->speedAirY -= Q(0.09375);

            if (++p->unk61 == 32) {
                p->unk61 = 1;
            }
        } else {
            p->unk61 = 1;
        }
    } else {
        if ((p->frameInput & gPlayerControls.jump) && (p->speedAirY >= -Q(0.75)) && (p->w.cf.flyingDuration != 0)) {
            p->unk61 = 2;
        }

        p->speedAirY += Q(PLAYER_FLYING_END_GRAVITY);
    }

    if (p->y < Q(gCamera.minY)) {
        p->y = Q(gCamera.minY);

        if (p->speedAirY < 0)
            p->speedAirY = 0;
    }

    UpdateCreamFlying(p);

    {
        s16 speed = gUnknown_080D552C[p->unk52];
        if (ABS(p->speedAirX) > speed) {
            if (p->speedAirX > 0)
                p->speedAirX -= p->unk48 * 2;
            else
                p->speedAirX += p->unk48 * 2;
        }
    }

    sub_80282EC(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->transition = PLTRANS_TOUCH_GROUND;
    } else if (p->moveState & MOVESTATE_40) {
        p->charState = CHARSTATE_FALLING_VULNERABLE_B;
        p->transition = PLTRANS_PT5;
    }
}

void Player_Cream_ChaoAttack(Player *p)
{
    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_WALK_A;
            p->transition = PLTRANS_PT5;
        } else {
            p->transition = PLTRANS_TOUCH_GROUND;
        }
    }

    sub_8027EF0(p);
}

void Player_Cream_InitStepAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    p->charState = CHARSTATE_BOOST_ATTACK;

    PLAYERFN_SET_AND_CALL(Player_Cream_StepAttack, p);
}

void Player_Cream_InitChaoRollingAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    p->charState = CHARSTATE_SOME_ATTACK;

    PLAYERFN_SET_AND_CALL(Player_Cream_ChaoRollingAttack, p);
}

void Player_Cream_InitMidAirChaoAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    p->charState = CHARSTATE_SOME_OTHER_ATTACK;

    PLAYERFN_SET_AND_CALL(Player_Cream_WindupMidAirChaoAttack, p);
}

void Player_Cream_StepAttack(Player *p)
{
    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_CURLED_IN_AIR;
            p->transition = PLTRANS_PT5;
        } else {
            p->transition = PLTRANS_TOUCH_GROUND;
        }
    }

    sub_8027EF0(p);
}

// Mid-Air: Down-B
void Player_Cream_ChaoRollingAttack(Player *p)
{
    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        if ((p->anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_1, CHARACTER_CREAM)) && p->variant == 0) {
            p->variant++;
        }
    }

    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->transition = PLTRANS_TOUCH_GROUND;
    }
}

void Player_Cream_WindupMidAirChaoAttack(Player *p)
{
    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->transition = PLTRANS_TOUCH_GROUND;
    }
}

/* Character: Tails */

struct Task *sub_80129DC(s32 x, s32 y)
{
    struct Task *result;

    if (IS_MULTI_PLAYER) {
        result = NULL;
    } else {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        t = sub_801F15C(x, y, 232, gPlayer.unk60, Task_801F214, TaskDestructor_801F550);
        ts = TASK_DATA(t);
        ts->playerAnim = gPlayerCharacterIdleAnims[gPlayer.character];

        // This is += because it's adding to the base Idle character animation
        ts->playerAnim += sCharStateAnimInfo[gPlayer.charState][0];
        ts->playerVariant = sCharStateAnimInfo[gPlayer.charState][1];

        s = &ts->s;

        if (!gPlayer.isBoosting) {
            s->graphics.dest = VramMalloc(15);
            s->graphics.anim = SA2_ANIM_TAILS_TAIL_SWIPE;
            s->variant = 0;
        } else {
            s->graphics.dest = VramMalloc(24);
            s->graphics.anim = SA2_ANIM_TAILS_SUPER_TAIL_SWIPE;
            s->variant = 1;
        }

        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        result = t;
    }

    return result;
}

void Player_Tails_InitUnusedJump(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->charState = CHARSTATE_TAILS_ANIM_19;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    p->speedAirY = -Q(4.0);

    if (p->moveState & MOVESTATE_40) {
        p->speedAirY >>= 1;
    }

    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(Player_8012D1C, p);
}

void sub_8012B44(Player *p)
{
    if (p->w.tf.flyingDuration == 0) {
        p->charState = CHARSTATE_TAILS_FLYING_TIRED;
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    } else {
        if (((p->heldInput & DPAD_LEFT) && !(p->moveState & MOVESTATE_FACING_LEFT))
            || ((p->heldInput & DPAD_RIGHT) && (p->moveState & MOVESTATE_FACING_LEFT))) {
            p->charState = CHARSTATE_TAILS_FLYING_TURNING;
        } else if ((p->charState == CHARSTATE_TAILS_FLYING_TURNING)) {
            if ((p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER))
                p->charState = CHARSTATE_TAILS_FLYING;
        } else {
            p->charState = CHARSTATE_TAILS_FLYING;
        }

        m4aSongNumStartOrChange(SE_TAILS_PROPELLER_FLYING);
    }
}

void Player_Tails_InitFlying(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    if (p->moveState & MOVESTATE_4) {
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->w.tf.flyingDuration = TAILS_FLYING_DURATION;
    p->unk61 = 1;
    p->isBoosting = FALSE;
    p->unk58 = 0;

    gPlayer.moveState |= MOVESTATE_10000000;
    PLAYERFN_SET_AND_CALL(Player_Tails_8012C2C, p);
}

void Player_Tails_8012C2C(Player *p)
{
    // Only decrease Tails' counter every 2nd frame, giving him 8 seconds of flight.
    // ...why didn't they just set his timer to a bigger value?
    if ((gStageTime & 0x1) && (p->w.tf.flyingDuration != 0)) {
        p->w.tf.flyingDuration--;
    }

    if (p->unk61 != 1) {
        if (p->speedAirY >= -Q(0.75)) {
            p->speedAirY -= Q(0.09375);

            if (++p->unk61 == 32) {
                p->unk61 = 1;
            }
        } else {
            p->unk61 = 1;
        }
    } else {
        if ((p->frameInput & gPlayerControls.jump) && (p->speedAirY >= -Q(0.75)) && (p->w.tf.flyingDuration != 0)) {
            p->unk61 = 2;
        }

        p->speedAirY += Q(PLAYER_FLYING_END_GRAVITY);
    }

    if (p->y < Q(gCamera.minY)) {
        p->y = Q(gCamera.minY);

        if (p->speedAirY < 0)
            p->speedAirY = 0;
    }

    sub_8012B44(p);

    p->unk40 = Q(6.0);
    p->unk48 = 0x10;

    sub_80282EC(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->transition = PLTRANS_TOUCH_GROUND;
    } else if (p->moveState & MOVESTATE_40) {
        p->charState = CHARSTATE_FALLING_VULNERABLE_B;
        p->transition = PLTRANS_PT5;
    }
}

void Player_8012D1C(Player *p)
{
    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->transition = PLTRANS_TOUCH_GROUND;
    }

    sub_8028204(p);
}

void Player_Tails_InitTailSwipe(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->charState = CHARSTATE_BOOSTLESS_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    sub_80129DC(I(p->x), I(p->y));

    m4aSongNumStart(SE_TAILS_TAIL_SWIPE);

    PLAYERFN_SET_AND_CALL(Player_Tails_TailSwipe, p);
}

// Tails' "Tail Swipe" can be used both while stationary as well as moving/boosting.
// While boosting, it is commonly referred to as "Super Tail Swipe".
void Player_Tails_TailSwipe(Player *p)
{
    s32 halfUnk4C = p->unk4C >> 1;

    s32 speed = p->speedGroundX;
    if (speed > 0) {
        speed = MAX(0, speed - halfUnk4C);
    } else {
        speed = MIN(0, speed + halfUnk4C);
    }
    p->speedGroundX = speed;

    sub_8029C84(p);

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        PLAYERFN_SET(Player_TouchGround);
    }

    sub_8027EF0(p);
}

/* Character: Knuckles */

struct Task *sub_8012DF8(s32 x, s32 y, u16 p2)
{
    struct Task *result;

    if (IS_MULTI_PLAYER) {
        result = NULL;
    } else {
        TaskStrc_801F15C *ts;
        Sprite *s;
        struct Task *t;
        t = sub_801F15C(x, y, 232, gPlayer.unk60, Task_801F214, TaskDestructor_801F550);
        ts = TASK_DATA(t);

        ts->playerAnim = sCharStateAnimInfo[gPlayer.charState][0];
        ts->playerVariant = sCharStateAnimInfo[gPlayer.charState][1];

        if (gPlayer.charState < CHARSTATE_SHARED_COUNT) {
            ts->playerAnim += gPlayerCharacterIdleAnims[gPlayer.character];
        }

        s = &ts->s;

        s->graphics.dest = VramMalloc(sKnucklesAnimData_FX[p2][0]);
        s->graphics.anim = sKnucklesAnimData_FX[p2][1];
        s->variant = sKnucklesAnimData_FX[p2][2];

        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        result = t;
    }

    return result;
}

void Player_Knuckles_InitPunch(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->charState = CHARSTATE_BOOSTLESS_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    if (ABS(p->speedGroundX) < Q(3.0)) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->speedGroundX = -Q(3.0);
        } else {
            p->speedGroundX = +Q(3.0);
        }
    }

    PLAYERFN_SET_AND_CALL(Player_Knuckles_PunchLeft, p);
}

void Player_Knuckles_PunchLeft(Player *p)
{
    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q(0.375)) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q(0.375)) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_CURLED_IN_AIR;
            p->transition = PLTRANS_PT5;
        } else {
            p->variant++;
            p->unk6C = TRUE;

            if (ABS(p->speedGroundX) < Q(3.0)) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->speedGroundX = -Q(3.0);
                } else {
                    p->speedGroundX = +Q(3.0);
                }
            }

            PLAYERFN_SET(Player_Knuckles_PunchRight);
        }
    }

    sub_8027EF0(p);
}

void Player_Knuckles_PunchRight(Player *p)
{
    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q(0.375)) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q(0.375)) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_CURLED_IN_AIR;
            p->transition = PLTRANS_PT5;
        } else {
            p->transition = PLTRANS_TOUCH_GROUND;
        }
    }

    sub_8027EF0(p);
}

void Player_Knuckles_InitSpiralAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->charState = CHARSTATE_BOOST_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_20000000;

    sub_8012DF8(I(p->x), I(p->y), 0);

    p->unk72 = 32;

    m4aSongNumStart(SE_SPIRAL_ATTACK);

    PLAYERFN_SET_AND_CALL(Player_Knuckles_SpiralAttack, p);
}

void Player_Knuckles_SpiralAttack(Player *p)
{
    s32 speed = p->speedGroundX;
    s32 addend = p->unk4C >> 1;
    if (speed > 0) {
        if ((speed -= addend) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += addend) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    sub_8029C84(p);

    if (--p->unk72 == -1) {
        p->variant++;
        p->unk6C = TRUE;
        PLAYERFN_SET(Player_8013B6C);
    }

    sub_8027EF0(p);
}

void Player_Knuckles_Glide_UpdateFrames(Player *p)
{
    s8 xOffset = p->w.kf.shift;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_FACING_LEFT;

    if (!(xOffset & 0x7F)) {
        p->charState = CHARSTATE_KNUCKLES_GLIDE;

        if ((u8)xOffset == 0x80) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        }
    } else {
        if (xOffset < 0) {
            xOffset = -xOffset;
        }
        p->charState = sKnucklesTurnFrameToCharstate[(xOffset & 0x7F) >> 5];
    }
}

void Player_Knuckles_Glide_MainUpdate(Player *p)
{
    type8029A28 result;
    u8 someFlags;
    sub_8022838(p);

    someFlags = p->w.kf.flags;

    if (!(someFlags & MOVESTATE_IN_AIR)) {
        u8 temp;
        if (p->speedAirX <= 0) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        } else {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        }

        temp = -((p->rotation + Q(0.125)) & -Q(0.25));
        if (temp != 0) {
            s8 shift = p->w.kf.shift + Q(0.25);
            if (shift <= 0) {
                p->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            p->speedAirY = 0;

            sub_8022318(p);

            p->transition = PLTRANS_TOUCH_GROUND;
        } else {
            PLAYERFN_SET(Player_Knuckles_GlideHardLanding);
            p->charState = CHARSTATE_KNUCKLES_GLIDE_IMPACT;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }
    } else {
        u32 temp = 0x20;
        temp &= someFlags;
        if (temp) {
            type8029A28 sp08;

            if (p->w.kf.unkAE >= 0) {
                s8 temp = p->w.kf.shift + Q(0.25);
                if (temp <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                    result = sub_8029A28(p, NULL, &sp08);

                    if (result != sp08) {
                        PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                        p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                        p->spriteOffsetX = 6;
                        p->spriteOffsetY = 14;
                        p->w.kf.flags |= MOVESTATE_IN_AIR;
                        return;
                    }

                    if (result != 0) {
                        u16 gravInv = GRAVITY_IS_INVERTED;
                        if (gravInv) {
                            s32 playerBottomX;
                            s32 playerBottomY = I(p->y);
                            playerBottomY -= 1;
                            playerBottomY -= p->spriteOffsetY;

                            playerBottomX = I(p->x);
                            playerBottomX -= 1;
                            playerBottomX -= p->spriteOffsetX;

                            if (sub_801E4E4(playerBottomY, playerBottomX, p->layer, -8, NULL, sub_801EE64) < 0) {
                                PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                                p->spriteOffsetX = 6;
                                p->spriteOffsetY = 14;
                                p->w.kf.flags |= MOVESTATE_IN_AIR;
                                return;
                            }
                        } else {
                            s32 playerBottomX;
                            s32 playerBottomY = I(p->y);
                            playerBottomY += 1;
                            playerBottomY += p->spriteOffsetY;

                            playerBottomX = I(p->x);
                            playerBottomX -= 1;
                            playerBottomX -= p->spriteOffsetX;

                            if (sub_801E4E4(playerBottomY, playerBottomX, p->layer, +8, NULL, sub_801EE64) < 0) {
                                PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                                p->spriteOffsetX = 6;
                                p->spriteOffsetY = 14;
                                p->w.kf.flags |= MOVESTATE_IN_AIR;
                                return;
                            }
                        }

                        p->x -= Q(result);
                    }
                } else {
                    p->moveState &= ~MOVESTATE_FACING_LEFT;

                    result = sub_8029A74(p, 0, &sp08);
                    if (result != sp08) {
                        PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                        p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                        p->spriteOffsetX = 6;
                        p->spriteOffsetY = 14;
                        p->w.kf.flags |= MOVESTATE_IN_AIR;
                        return;
                    } else if (result != 0) {
                        if (!GRAVITY_IS_INVERTED) {
                            s32 playerBottomX;
                            s32 playerBottomY = I(p->y);
                            playerBottomY += 1;
                            playerBottomY += p->spriteOffsetY;

                            playerBottomX = I(p->x);
                            playerBottomX += 1;
                            playerBottomX += p->spriteOffsetX;

                            if (sub_801E4E4(playerBottomY, playerBottomX, p->layer, +8, NULL, sub_801EE64) < 0) {
                                PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                                p->spriteOffsetX = 6;
                                p->spriteOffsetY = 14;
                                p->w.kf.flags |= MOVESTATE_IN_AIR;
                                return;
                            }
                        }
                        p->x += Q(result);
                    }
                }

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                PLAYERFN_SET(Player_Knuckles_Climb);

                p->w.kf.shift = 3;

                p->charState = CHARSTATE_KNUCKLES_GLIDE_GRAB_WALL;
                p->moveState |= MOVESTATE_10000000;

                PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 10);

                return;
            }

            PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
            p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
            p->spriteOffsetX = 6;
            p->spriteOffsetY = 14;
            p->w.kf.flags |= MOVESTATE_IN_AIR;
        } else {
            if (!(p->heldInput & gPlayerControls.jump) || (p->moveState & MOVESTATE_40)) {
                PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;

                if (p->speedAirX <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                } else {
                    p->moveState &= ~MOVESTATE_FACING_LEFT;
                }

                p->speedAirX >>= 2;
                p->spriteOffsetX = 6;
                p->spriteOffsetY = 14;
            } else {
                Player_Knuckles_Glide_UpdateFrames(p);
            }
        }
    }
}

void Player_Knuckles_GlideSoftFall(Player *p)
{
    u8 someFlags;

    sub_8023610(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    sub_8022838(p);

    if (!(p->w.kf.flags & 0x2)) {
        p->speedGroundX = 0;
        p->speedAirX = 0;
        p->speedAirY = 0;

        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;

        sub_8022318(p);

        if ((p->rotation + Q(0.125)) & Q(0.75)) {
            p->transition = PLTRANS_TOUCH_GROUND;
        } else {
            p->unk2A = 15;
            p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL_HIT;
            PLAYERFN_SET(Player_Knuckles_GlideSoftLanding);
        }
    }
}

void Player_Knuckles_GlideHardLandingUpdateAnim(Player *p)
{
    u8 rot;
    s32 p2;
    s32 res;

    if ((gStageTime & 0x3) == 0) {
        s32 offsetY = p->spriteOffsetY;

        if (GRAVITY_IS_INVERTED)
            offsetY = -offsetY;

        CreateBrakingDustEffect(I(p->x), I(p->y) + offsetY);
    }

    sub_8022838(p);

    res = sub_8029B88(p, &rot, &p2);

    if (res < 12) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->y += Q(res);
        p->rotation = rot;
    } else if (!(p->moveState & MOVESTATE_8)) {
        PLAYERFN_SET(Player_Knuckles_FallAfterGlide);

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        p->w.tf.flags |= 0x2;
    }
}

void sub_80135BC(Player *p)
{
    if (p->heldInput & gPlayerControls.jump) {
        if (p->speedAirX <= 0) {
            p->speedAirX += Q(0.09375);

            if (p->speedAirX < 0) {
                Player_Knuckles_GlideHardLandingUpdateAnim(p);
                return;
            }
        } else {
            p->speedAirX -= Q(0.09375);

            if (p->speedAirX > 0) {
                Player_Knuckles_GlideHardLandingUpdateAnim(p);
                return;
            }
        }
    }

    p->speedGroundX = 0;
    p->speedAirX = 0;
    p->speedAirY = 0;

    {
        s32 offsetY;
        offsetY = p->spriteOffsetY - 14;

        if (GRAVITY_IS_INVERTED)
            offsetY = -offsetY;

        p->y += Q(offsetY);
    }

    sub_8022318(p);

    p->unk2A = 15;
    p->transition = PLTRANS_TOUCH_GROUND;
}

s32 sub_8013644(Player *p)
{
    s32 result;
    u8 rot;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        s32 pX;
        s32 pY;

        pX = I(p->x);
        pX -= 2;
        pX -= p->spriteOffsetX;

        pY = I(p->y);

        result = sub_801E4E4(pX, pY, p->layer, -8, &rot, sub_801ED24);

        if (rot & 0x1) {
            p->rotation = Q(0.25);
        } else {
            p->rotation = rot;
        }
    } else {
        s32 pX;
        s32 pY;
        pX = I(p->x);
        pX += 2;
        pX += p->spriteOffsetX;

        pY = I(p->y);

        result = sub_801E4E4(pX, pY, p->layer, +8, &rot, sub_801ED24);

        if (!(rot & 0x1)) {
            p->rotation = rot;
        } else {
            p->rotation = Q(0.75);
        }
    }

    return result;
}

void Player_Knuckles_Climb_80136E8(Player *p)
{
    u8 rot;
    s32 r2;

    if (p->w.tf.unkAE >= 0) {
        if (p->moveState & MOVESTATE_8) {
            sub_8013CA0(p);
            return;
        }

        p->speedGroundX = 0;
        p->speedAirX = 0;
        p->speedAirY = 0;

        if (p->charState != CHARSTATE_KNUCKLES_GLIDE_GRAB_WALL) {
            p->charState = CHARSTATE_KNUCKLES_CLIMB_A;
        }

        if (p->heldInput & DPAD_UP) {
            s32 offsetY = Q(p->spriteOffsetY);

            if (GRAVITY_IS_INVERTED) {
                offsetY = -offsetY;
            }

            p->y -= offsetY;
            r2 = sub_8013644(p);
            p->y += offsetY;

            if (r2 > 2) {
                Player_Knuckles_InitClimbPullUpEdge(p);
                return;
            } else if (r2 > 0) {
#ifdef BUGFIX
                rot = 0;
#endif
                // BUG: rot is not initialised
                p->rotation = rot;

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                sub_8022318(p);
                PLAYERFN_SET(Player_Knuckles_FallAfterGlide);

                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                return;
            } else if (r2 < 0) {
                sub_801394C(p);
                return;
            } else {
                s32 offsetY = Q(9.0);
                if (GRAVITY_IS_INVERTED) {
                    offsetY = -offsetY;
                }

                p->y -= offsetY;
                r2 = sub_8029AC0(p, &rot, NULL);
                p->y += offsetY;

                if (r2 < 0) {
                    p->charState = CHARSTATE_KNUCKLES_CLIMB_B;
                    p->y -= Q(r2);
                } else {
                    s32 speed;
                    p->charState = CHARSTATE_KNUCKLES_CLIMB_B;
                    speed = Q(0.75);
                    if (p->moveState & 0x40) {
                        speed = Q(0.5);
                    }
                    p->speedAirY = -speed;
                }
            }
        } else if (p->heldInput & DPAD_DOWN) {
            s32 speed;
            s32 offsetY = Q(p->spriteOffsetY);
            if (GRAVITY_IS_INVERTED) {
                offsetY = -offsetY;
            }

            p->y += offsetY;
            r2 = sub_8013644(p);
            p->y -= offsetY;

            if (r2 > 0) {
                sub_8013CA0(p);
                return;
            }

            if (GRAVITY_IS_INVERTED) {
                r2 = sub_8029AC0(p, &rot, NULL);
            } else {
                r2 = sub_8029B0C(p, &rot, NULL);
            }

            if (r2 < 0) {
                if (GRAVITY_IS_INVERTED) {
                    p->y -= Q(r2);
                } else {
                    p->y += Q(r2);
                }

                p->rotation = rot;

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                sub_8022318(p);
                PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                return;
            } else {
                p->charState = CHARSTATE_KNUCKLES_CLIMB_C;
                speed = Q(0.75);
                if (p->moveState & MOVESTATE_40) {
                    speed = Q(0.5);
                }
                p->speedAirY = speed;
            }
        } else {
            r2 = sub_8013644(p);
            if (r2 > 0) {
                sub_8013CA0(p);
                return;
            }
        }

        r2 = 1;
        if (!(p->heldInput & (DPAD_DOWN | DPAD_UP))) {
            r2 = sub_8029B0C(p, &rot, NULL);
            if (r2 < 0) {
                p->y += Q(r2);
                p->rotation = rot;

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                sub_8022318(p);

                p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
                return;
            }
        }

        if (r2 != 0 && --p->w.tf.shift == 0) {
            p->w.tf.shift = 3;
        }

        sub_801394C(p);
    } else {
        sub_8013CA0(p);
    }
}

void sub_801394C(Player *p)
{
    if (p->frameInput & gPlayerControls.jump) {
        p->speedAirY = -Q(2.625);
        p->speedAirX = +Q(3.0);
        p->moveState ^= MOVESTATE_FACING_LEFT;

        if (p->moveState & MOVESTATE_FACING_LEFT)
            p->speedAirX = -p->speedAirX;

        p->moveState |= MOVESTATE_4;
        p->moveState |= MOVESTATE_IN_AIR;
        p->moveState |= MOVESTATE_100;

        p->spriteOffsetX = 6;
        p->spriteOffsetY = 9;
        p->charState = CHARSTATE_CURLED_IN_AIR;
        p->transition = PLTRANS_PT4;
    }
}

// (76.32%) https://decomp.me/scratch/8fUWD
NONMATCH("asm/non_matching/game/player__sub_80139B0.inc", void Knuckles_Glide_UpdateSpeed(Player *p))
{
    s32 speedGrnd = ABS(p->speedGroundX);
    s8 r2 = p->w.tf.shift;
    u8 shift;

    if (speedGrnd < Q(3.0)) {
        speedGrnd += Q(6.0 / 256.0);
    } else if (speedGrnd < Q(15.0)) {
        if ((r2 & 0x7F) == 0)
            speedGrnd += Q(3.0 / 256.0);
    }

    if (p->moveState & MOVESTATE_40) {
        if ((speedGrnd > Q(3.0)) && (speedGrnd -= Q(9.0 / 256.0)) < Q(3.0))
            speedGrnd = Q(3.0);
    }

    shift = p->w.tf.shift + Q(0.25);
    if (shift <= 0) {
        p->speedGroundX = -speedGrnd;
    } else {
        p->speedGroundX = +speedGrnd;
    }

    if (p->heldInput & DPAD_LEFT) {
        if (((u8)r2 != 0x80)) {
            shift = ABS(r2) + Q_8_8(2.0);
        }
    } else if (p->heldInput & DPAD_RIGHT) {
        if ((r2 != 0)) {
            shift = ABS(r2) + Q_8_8(2.0);
        }
    } else {
        if (r2 & 0x7F) {
            shift = r2 + 2;
        }
    }

    p->w.tf.shift = shift;

    {
        s32 speedX = I(COS_24_8(shift) * speedGrnd);
        p->speedAirX = speedX;
    }
    {
        s32 speedY = p->speedAirY;

        if (speedY < Q(0.5)) {
            speedY += Q(0.09375);
        } else {
            speedY -= Q(0.09375);
        }
        p->speedAirY = speedY;
    }

    if (gCamera.unk4C > 0) {
        gCamera.unk4C -= 2;
    } else if (gCamera.unk4C < 0) {
        gCamera.unk4C += 4;
    }
}
END_NONMATCH

void Player_Knuckles_InitGlide(Player *p)
{
    p->moveState &= ~MOVESTATE_4;
    p->spriteOffsetX = 6;
    p->spriteOffsetY = 6;

    p->speedAirY += Q(1.5);

    if (p->speedAirY < 0)
        p->speedAirY = 0;

    p->speedGroundX = Q(3.0);

    if (p->moveState & MOVESTATE_40)
        p->speedGroundX /= 2;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->speedGroundX = -p->speedGroundX;
        p->speedAirX = p->speedGroundX;
        p->w.kf.shift = 0x80;
    } else {
        p->speedAirX = p->speedGroundX;
        p->w.kf.shift = 0;
    }

    p->rotation = 0;

    {
        u8 *tFlags = &p->w.kf.flags;
        *tFlags = 0;
        p->isBoosting = FALSE;
        *tFlags |= 0x2;
    }

    PLAYERFN_SET_AND_CALL(Player_Knuckles_Glide, p);
}

void Player_8013B6C(Player *p)
{
    sub_8029C84(p);

    if ((p->unk90->s.frameFlags) & SPRITE_FLAG_MASK_ANIM_OVER) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_CURLED_IN_AIR;
            p->transition = PLTRANS_PT5;
        } else {
            p->transition = PLTRANS_TOUCH_GROUND;
        }
    }

    sub_8027EF0(p);
}

void Player_Knuckles_Glide(Player *p)
{
    Knuckles_Glide_UpdateSpeed(p);
    sub_80232D0(p);
    Player_UpdatePosition(p);
    Player_Knuckles_Glide_MainUpdate(p);
}

void Player_Knuckles_FallAfterGlide(Player *p)
{
    sub_80232D0(p);
    Player_UpdatePosition(p);
    Player_Knuckles_GlideSoftFall(p);
}

void Player_Knuckles_GlideSoftLanding(Player *p)
{
    if ((p->unk90->s.frameFlags) & SPRITE_FLAG_MASK_ANIM_OVER) {
        p->transition = PLTRANS_TOUCH_GROUND;
    }

    sub_8027EF0(p);
}

void Player_Knuckles_GlideHardLanding(Player *p)
{
    sub_80135BC(p);
    sub_80232D0(p);
    Player_UpdatePosition(p);
}

void Player_Knuckles_Climb(Player *p)
{
    Player_Knuckles_Climb_80136E8(p);
    sub_80232D0(p);
    Player_UpdatePosition(p);
}

void Player_Knuckles_ClimbPullUpEdge(Player *p);

void Player_Knuckles_InitClimbPullUpEdge(Player *p)
{
    p->charState = CHARSTATE_KNUCKLES_CLIMB_D;

    if (GRAVITY_IS_INVERTED) {
        p->y += Q(p->spriteOffsetY);
    } else {
        p->y -= Q(p->spriteOffsetY);
    }

    PLAYERFN_SET(Player_Knuckles_ClimbPullUpEdge);

    p->w.tf.shift = 0;
}

void sub_8013CA0(Player *p)
{
    PLAYERFN_SET(Player_Knuckles_FallAfterGlide);

    p->spriteOffsetX = 6;
    p->spriteOffsetY = 14;

    p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
}

// PlayerSomething_CeilGroundSpeed
void sub_8013CC0(Player *p)
{
    s32 speedGrnd = ABS(p->speedGroundX);

    if (speedGrnd < Q(3.0)) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->speedGroundX = -Q(3.0);
        } else {
            p->speedGroundX = +Q(3.0);
        }
    }
}

// Identical to sub_8013EE0
void sub_8013CF4(Player *p)
{
    s32 speedGrnd = p->speedGroundX;

    if (speedGrnd > 0) {
        if ((speedGrnd - Q(0.375)) < 0) {
            speedGrnd = 0;
        } else {
            speedGrnd -= Q(0.375);
        }

        p->speedGroundX = speedGrnd;
    } else if (speedGrnd < 0) {
        if ((speedGrnd + Q(0.375)) > 0) {
            speedGrnd = 0;
        } else {
            speedGrnd += Q(0.375);
        }

        p->speedGroundX = speedGrnd;
    }
}

void Player_Knuckles_WindupDrillClaw(Player *p);

void Player_Knuckles_InitDrillClaw(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->charState = CHARSTATE_KNUCKLES_DRILL_CLAW_INIT;

#if !DISABLE_TRICK_AIR_WAIT
    p->speedAirX = 0;
    p->speedAirY = 0;
#endif

    m4aSongNumStart(SE_226);

    PLAYERFN_SET_AND_CALL(Player_Knuckles_WindupDrillClaw, p);
}

void sub_8013D7C(Player *p)
{
    PLAYERFN_SET(Player_Knuckles_FallAfterGlide);
    p->charState = CHARSTATE_KNUCKLES_GLIDE_FALL;
    p->spriteOffsetX = 6;
    p->spriteOffsetY = 14;
    p->w.kf.flags |= 0x2;
}

void Player_Knuckles_DrillClaw(Player *p);

void Player_Knuckles_WindupDrillClaw(Player *p)
{
    sub_80283C4(p);

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        p->charState = CHARSTATE_KNUCKLES_DRILL_CLAW_MAIN;
        p->speedAirX = Q(0.0);
        p->speedAirY = Q(1.0);

        sub_8012DF8(I(p->x), I(p->y), 1);

        PLAYERFN_SET_AND_CALL(Player_Knuckles_DrillClaw, p);
    }
}

void Player_8013E34(Player *p);

void Player_Knuckles_DrillClaw(Player *p)
{
    p->speedAirY += Q(42.0 / 256.0);

    sub_80283C4(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        PLAYERFN_SET(Player_8013E34);

        p->charState = CHARSTATE_KNUCKLES_DRILL_CLAW_GROUND;
        p->speedAirY = 0;
    }
}

void Player_8013E34(Player *p)
{
    sub_8027EF0(p);

    p->speedGroundX = 0;
    p->speedAirX = 0;
    p->speedAirY = 0;

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        p->transition = PLTRANS_TOUCH_GROUND;
    }
}

void Player_Knuckles_ClimbPullUpEdge(Player *p)
{
    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        p->rotation = 0;

        if (GRAVITY_IS_INVERTED) {
            p->y += Q(p->spriteOffsetY);
        } else {
            p->y -= Q(p->spriteOffsetY);
        }

        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->x -= Q(16.0);
        } else {
            p->x += Q(16.0);
        }

        PLAYERFN_CALL(Player_TouchGround, p);
    } else {
        sub_80232D0(p);
        Player_UpdatePosition(p);
    }
}

/* Character: Amy */
/* Shares a bunch of code with Sonic */

// Identical to sub_8013CF4
void sub_8013EE0(Player *p)
{
    s32 speedGrnd = p->speedGroundX;

    if (speedGrnd > 0) {
        if ((speedGrnd - Q(0.375)) < 0) {
            speedGrnd = 0;
        } else {
            speedGrnd -= Q(0.375);
        }

        p->speedGroundX = speedGrnd;
    } else if (speedGrnd < 0) {
        if ((speedGrnd + Q(0.375)) > 0) {
            speedGrnd = 0;
        } else {
            speedGrnd += Q(0.375);
        }

        p->speedGroundX = speedGrnd;
    }
}

void Player_Amy_HammerAttack(Player *p);

void Player_Amy_InitHammerAttack(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    p->charState = CHARSTATE_BOOSTLESS_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    CreateAmyAttackHeartEffect(AMY_HEART_PATTERN_HAMMER_ATTACK);

    PLAYERFN_SET_AND_CALL(Player_Amy_HammerAttack, p);
}

void Player_Amy_HammerAttack(Player *p)
{
    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q(0.375)) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q(0.375)) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        PLAYERFN_SET(Player_TouchGround);
    }

    sub_8027EF0(p);
}
