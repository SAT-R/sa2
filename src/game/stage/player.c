#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "game/amy_attack_heart_effect.h"
#include "game/boost_effect.h"
#include "game/boost_mode_particles.h" // incl. CreateBoostModeParticles
#include "game/bosses/common.h"
#include "game/cheese.h"
#include "game/heart_particles_effect.h"
#include "game/multiplayer/mp_attack_2_effect.h"
#include "game/multiplayer/mp_player.h"
#include "game/parameters/bosses.h"
#include "game/player_callbacks.h"
#include "game/sa1_sa2_shared/input_buffer.h"
#include "game/sa1_sa2_shared/music_manager.h"
#include "game/save.h"
#include "game/stage/camera.h"
#include "game/stage/terrain_collision.h"
#include "game/stage/dust_effect_braking.h" // CreateSpindashDustEffect
#include "game/stage/dust_effect_spindash.h" // CreateSpindashDustEffect
#include "game/stage/item_tasks.h"
#include "game/stage/mp_sprite_task.h"
#include "game/stage/player.h"
#include "game/stage/player_controls.h"
#include "game/stage/player_super_sonic.h"
#include "game/stage/results.h"
#include "game/stage/rings_scatter.h"
#include "game/stage/spawn_positions.h"
#include "game/stage/stage.h"
#include "game/stage/underwater_effects.h"
#include "game/time_attack/results.h" // for Player_VictoryPose
#include "game/multiplayer/mp_attack_1_effect.h"
#include "game/water_effects.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ u8 unk0;
    /* 0x04 */ u32 unk4; // TODO: Check the type!
} player_0_Task; /* size: 0x8 */

Player ALIGNED(8) gPlayer = {};

// Potentially some extra space on player for this to be aligned 16 (should be 8)
PlayerSpriteInfo ALIGNED(16) gPlayerLimbsPSI = {};
PlayerSpriteInfo ALIGNED(16) gPlayerBodyPSI = {};

// sakit
extern void InitNewInputCounters(void);

void sub_8022218(Player *);
void sub_8022284(Player *);
void Task_PlayerMain(void);
void AllocateCharacterStageGfx(Player *, PlayerSpriteInfo *);
void AllocateCharacterMidAirGfx(Player *, PlayerSpriteInfo *);
void TaskDestructor_Player(struct Task *);
void sub_802486C(Player *p, PlayerSpriteInfo *p2);
void sub_8024B10(Player *p, PlayerSpriteInfo *s);
void sub_8024F74(Player *p, PlayerSpriteInfo *s);
void Player_8026BCC(Player *);

s32 sub_8029BB8(Player *p, u8 *rot, s32 *out);

void Player_SpinAttack(Player *p);

void Player_Idle(Player *);
void Player_Rolling(Player *);
void Player_InitJump(Player *p);
void Player_Jumping(Player *);
void Player_8025F84(Player *);
void Player_Spindash(Player *);
void Player_DoGrinding(Player *);
void Player_PropellorSpring(Player *);
void Player_Corkscrew(Player *);
void Player_Hurt(Player *);
void Player_InitReachedGoal(Player *);
void Player_GoalSlowdown(Player *);
void Player_GoalBrake(Player *);
void Player_InitVictoryPoseTransition(Player *);
void Player_VictoryPose(Player *);
void Player_8027B98(Player *);
void Player_WindupDefaultTrick(Player *);
void Player_DefaultTrick(Player *);
void Player_8029074(Player *);
void Player_8029314(Player *);
void Player_8026060(Player *p);
void Player_InitUncurl(Player *p);
void Player_InitGrinding(Player *p);
void Player_InitGrindRailEndGround(Player *p);
void Player_GrindRailEndAir(Player *p);
void Player_InitPipeEntry(Player *p);
void Player_InitPipeExit(Player *p);
void Player_InitPropellorSpring(Player *p);
void Player_InitCorkscrew(Player *p);
void Player_InitHurt(Player *p);
void Player_InitReachedGoal(Player *p);
void Player_8028D74(Player *p);
void Player_TouchNormalSpring(Player *p);
void Player_InitRampOrDashRing(Player *p);
void Player_HandleBoostThreshold(Player *p);
void Player_802A258(Player *p);
void Player_InitDashRing(Player *p);

bool32 Player_TryMidAirAction(Player *);
void Player_HandleGroundMovement(Player *);
bool32 Player_TryTaunt(Player *);
bool32 Player_TryCrouchOrSpinAttack(Player *);
bool32 Player_TryInitSpindash(Player *);
void Player_InitCrouch(Player *);
void Player_InitIceSlide(Player *);
void PlayerFn_Cmd_HandlePhysics(Player *);
void Player_802A3C4(Player *);
void Player_CameraShift(Player *);
void Player_InitSpecialStageTransition(Player *);
void Player_InitKilledBoss(Player *);
void Player_InitReachedGoalMultiplayer(Player *);
void Player_Nop(Player *);
void Player_Skidding(Player *);
void Player_InitTaunt(Player *);
void Player_InitAttack(Player *);
void Player_HandleBoostState(Player *p);
void Player_ApplyBoostPhysics(Player *p);
void Player_HandleWalkAnim(Player *p);
void Player_HandleInputs(Player *p);
void CallPlayerTransition(Player *p);

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)
#define GET_ROTATED_ACCEL_3(angle) ((SIN_24_8((angle)*4) * 60))

// TODO: Match this without ASM!
#ifndef NON_MATCHING
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                                                                           \
    {                                                                                                                                      \
        s16 speed = (player->moveState & MOVESTATE_IN_WATER) ? Q_8_8(PLAYER_GRAVITY_UNDER_WATER) : Q_8_8(PLAYER_GRAVITY);                  \
                                                                                                                                           \
        if (player->qSpeedAirY < 0) {                                                                                                      \
            asm("lsl r0, %0, #16\n"                                                                                                        \
                "\tasr r0, r0, #17\n"                                                                                                      \
                "\tlsl r0, r0, #16\n"                                                                                                      \
                "\tlsr %0, r0, #16\n"                                                                                                      \
                : "=r"(speed)                                                                                                              \
                : "r"(speed)                                                                                                               \
                : "r0");                                                                                                                   \
        }                                                                                                                                  \
                                                                                                                                           \
        player->qSpeedAirY += speed;                                                                                                       \
    }
#else
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                                                                           \
    {                                                                                                                                      \
        s16 speed = (player->moveState & MOVESTATE_IN_WATER) ? Q_8_8(PLAYER_GRAVITY_UNDER_WATER) : Q_8_8(PLAYER_GRAVITY);                  \
                                                                                                                                           \
        if (player->qSpeedAirY < 0) {                                                                                                      \
            speed /= 2;                                                                                                                    \
        }                                                                                                                                  \
                                                                                                                                           \
        player->qSpeedAirY += speed;                                                                                                       \
    }
#endif

#define PLAYERFN_UPDATE_UNK2A(player)                                                                                                      \
    {                                                                                                                                      \
        if (player->unk2A != 0) {                                                                                                          \
            player->unk2A -= 1;                                                                                                            \
        } else if ((player->rotation + Q(0.125)) & 0xC0) {                                                                                 \
            if (ABS(player->qSpeedGround) < Q(1.875)) {                                                                                    \
                player->qSpeedGround = 0;                                                                                                  \
                                                                                                                                           \
                player->moveState |= MOVESTATE_IN_AIR;                                                                                     \
                player->unk2A = GBA_FRAMES_PER_SECOND / 2;                                                                                 \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define PLAYERFN_UPDATE_ROTATION(player)                                                                                                   \
    {                                                                                                                                      \
        s32 rot = (s8)player->rotation;                                                                                                    \
        if (rot < 0) {                                                                                                                     \
            rot = MIN((rot + 2), 0);                                                                                                       \
        } else if (rot > 0) {                                                                                                              \
            rot = MAX((rot - 2), 0);                                                                                                       \
        }                                                                                                                                  \
        player->rotation = rot;                                                                                                            \
    }

#ifndef COLLECT_RINGS_ROM
#define PLAYERFN_UPDATE_POSITION(player)                                                                                                   \
    {                                                                                                                                      \
        player->qWorldX += player->qSpeedAirX;                                                                                             \
                                                                                                                                           \
        if ((gStageFlags ^ gUnknown_0300544C) & STAGE_FLAG__GRAVITY_INVERTED) {                                                            \
            player->qSpeedAirY = -player->qSpeedAirY;                                                                                      \
        }                                                                                                                                  \
                                                                                                                                           \
        player->qSpeedAirY = MIN(player->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX));                                                             \
                                                                                                                                           \
        player->qWorldY = GRAVITY_IS_INVERTED ? player->qWorldY - player->qSpeedAirY : player->qWorldY + player->qSpeedAirY;               \
    }
#else
#define PLAYERFN_UPDATE_POSITION(player)                                                                                                   \
    {                                                                                                                                      \
        player->qWorldX += player->qSpeedAirX;                                                                                             \
                                                                                                                                           \
        player->qSpeedAirY = MIN(player->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX));                                                             \
                                                                                                                                           \
        player->qWorldY = player->qWorldY + player->qSpeedAirY;                                                                            \
    }
#endif

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player)                                                                                   \
    if ((player->moveState & (MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_STOOD_ON_OBJ) {                                     \
        gPlayer.callback = Player_TouchGround;                                                                                             \
                                                                                                                                           \
        player->qSpeedGround = player->qSpeedAirX;                                                                                         \
        player->rotation = 0;                                                                                                              \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND(player)                                                                                        \
    {                                                                                                                                      \
        sub_8022190(player);                                                                                                               \
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player);                                                                                  \
    }

#ifndef COLLECT_RINGS_ROM
#define PLAYERFN_UPDATE_AIR_FALL_SPEED(player)                                                                                             \
    if (player->moveState & MOVESTATE_IN_WATER) {                                                                                          \
        player->qSpeedAirY += Q(PLAYER_GRAVITY_UNDER_WATER);                                                                               \
    } else {                                                                                                                               \
        player->qSpeedAirY += Q(PLAYER_GRAVITY);                                                                                           \
    }
#else
#define PLAYERFN_UPDATE_AIR_FALL_SPEED(player) player->qSpeedAirY += Q(PLAYER_GRAVITY);
#endif

#define PLAYERFN_SET_ANIM_SPEED(_p, _s)                                                                                                    \
    {                                                                                                                                      \
        s32 speed = _p->qSpeedGround;                                                                                                      \
        speed = (speed >> 5) + (speed >> 6);                                                                                               \
                                                                                                                                           \
        /* TODO: Try ABS macro */                                                                                                          \
        speed = ABS(speed);                                                                                                                \
                                                                                                                                           \
        if (speed >= SPRITE_ANIM_SPEED(0.5)) {                                                                                             \
            if (speed > SPRITE_ANIM_SPEED(8.0)) {                                                                                          \
                speed = SPRITE_ANIM_SPEED(8.0);                                                                                            \
            }                                                                                                                              \
        } else {                                                                                                                           \
            speed = SPRITE_ANIM_SPEED(0.5);                                                                                                \
        }                                                                                                                                  \
        _s->animSpeed = speed;                                                                                                             \
    }

#ifndef COLLECT_RINGS_ROM
#define MACRO_8024B10_PSI_UPDATE(p, psi)                                                                                                   \
    ({                                                                                                                                     \
        s32 x, y;                                                                                                                          \
        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {                                                                                     \
            psi->transform.qScaleX = -Q(1.0);                                                                                              \
        } else {                                                                                                                           \
            psi->transform.qScaleX = +Q(1.0);                                                                                              \
        }                                                                                                                                  \
        if (GRAVITY_IS_INVERTED) {                                                                                                         \
            psi->transform.qScaleX = -psi->transform.qScaleX;                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        if (psi->transform.qScaleX < 0) {                                                                                                  \
            psi->transform.x--;                                                                                                            \
        }                                                                                                                                  \
                                                                                                                                           \
        if (GRAVITY_IS_INVERTED) {                                                                                                         \
            psi->transform.qScaleY = Q(1.0);                                                                                               \
            /* requires double clamp to match */                                                                                           \
            psi->transform.rotation = CLAMP_SIN_PERIOD(CLAMP_SIN_PERIOD(-Q(1.0) - (psi->transform.rotation + psi->transform.qScaleY)));    \
        } else {                                                                                                                           \
            psi->transform.qScaleY = Q(1.0);                                                                                               \
        }                                                                                                                                  \
                                                                                                                                           \
        x = I(psi->transform.qScaleX * p->unk80);                                                                                          \
        y = I(psi->transform.qScaleY * p->unk82);                                                                                          \
        psi->transform.qScaleX = x;                                                                                                        \
        psi->transform.qScaleY = y;                                                                                                        \
        UpdateSpriteAnimation(s);                                                                                                          \
    })
#else
#define MACRO_8024B10_PSI_UPDATE(p, psi)                                                                                                   \
    ({                                                                                                                                     \
        s32 x, y;                                                                                                                          \
        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {                                                                                     \
            psi->transform.qScaleX = -Q(1.0);                                                                                              \
        } else {                                                                                                                           \
            psi->transform.qScaleX = +Q(1.0);                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        if (psi->transform.qScaleX < 0) {                                                                                                  \
            psi->transform.x--;                                                                                                            \
        }                                                                                                                                  \
                                                                                                                                           \
        x = I(psi->transform.qScaleX * p->unk80);                                                                                          \
        y = I(psi->transform.qScaleY * p->unk82);                                                                                          \
        psi->transform.qScaleX = x;                                                                                                        \
        psi->transform.qScaleY = y;                                                                                                        \
        UpdateSpriteAnimation(s);                                                                                                          \
    })
#endif

#define TRICK_DIR_UP       0
#define TRICK_DIR_DOWN     1
#define TRICK_DIR_FORWARD  2
#define TRICK_DIR_BACKWARD 3
#define NUM_TRICK_DIRS     4

#define MASK_80D6992_1  0x1
#define MASK_80D6992_2  0x2
#define MASK_80D6992_4  0x4
#define MASK_80D6992_8  0x8
#define MASK_80D6992_10 0x10

#ifndef COLLECT_RINGS_ROM
const AnimId gPlayerCharacterIdleAnims[NUM_CHARACTERS] = {
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_SONIC), SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_CREAM),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_TAILS), SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_KNUCKLES),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_AMY),
};

// TODO: This is unaligned in-ROM.
//       Can we somehow change this to be using a struct instead?
//
// TODO: Tidy up the macros, not just here, but everywhere!
//       This isn't intuitive to read.
//
// The index is the same as Player.unk64
const u16 sCharStateAnimInfo[][2] = {
    [CHARSTATE_IDLE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TAUNT] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_CROUCH] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_CROUCH, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SPIN_DASH] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_DASH, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SPIN_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TURN_SLOW] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_5, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TURN_AFTER_BRAKE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_6, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_BRAKE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_BRAKE, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_BRAKE_GOAL] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_BRAKE_GOAL, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WALK_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_JUMP_1] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_JUMP_1, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_JUMP_2] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_JUMP_2, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_HIT_GROUND] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_HIT_GROUND, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_FALLING_VULNERABLE_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_FALLING_VULNERABLE, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_FALLING_VULNERABLE_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_FALLING_VULNERABLE, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_BOOSTLESS_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOSTLESS_ATTACK, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_AIR_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_AIR_ATTACK, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_BOOST_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_ATTACK, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SOME_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_1, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SOME_OTHER_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_2, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_HIT_AIR] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_HIT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_HIT_STUNNED] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_HIT, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_DEAD] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_DEAD, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GOAL_BRAKE_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_GOAL_BRAKE, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GOAL_BRAKE_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_GOAL_BRAKE, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_GOAL_BRAKE_C] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_GOAL_BRAKE, CHARACTER_SHARED_ANIM), 2 },
    [CHARSTATE_ACT_CLEAR_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_ACT_CLEAR, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_ACT_CLEAR_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_33, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_ACT_CLEAR_C] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_34, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_C] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_35, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TRICK_UP] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_UP, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TRICK_FORWARD] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_SIDE, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TRICK_BACKWARD] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_50, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TRICK_DOWN] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SPRING_MUSIC_PLANT] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPRING_MUSIC_PLANT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SPRING_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_52, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SPRING_C] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_53, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_RAMP_AND_DASHRING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_54, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GRINDING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_GRINDING, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GRINDING_SONIC_AMY_JUMP_OFF] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_56, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GRAVITY_FLIP_UNUSED] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_57, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_IN_WHIRLWIND] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_IN_WHIRLWIND, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GRABBING_HANDLE_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_GRABBING_HANDLE_A, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_GRABBING_HANDLE_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_GRABBING_HANDLE_B, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_IN_CORKSCREW] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_68, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_IN_CORKSCREW_3D_RUNNING_DOWN] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_69, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_IN_CORKSCREW_3D_RUNNING_UP] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_69, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_CURLED_IN_AIR] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_70, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WINDUP_STICK_UPWARDS] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WINDUP_STICK_UPDOWN, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WINDUP_STICK_DOWNWARDS] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WINDUP_STICK_UPDOWN, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_WINDUP_STICK_SINGLE_TURN_UP] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WINDUP_STICK_SINGLE_TURN_UPDOWN, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WINDUP_STICK_SINGLE_TURN_DOWN] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WINDUP_STICK_SINGLE_TURN_UPDOWN, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_HANGING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_HANGING, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_TURNAROUND_BAR] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TURNAROUND_BAR, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_NOTE_BLOCK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_NOTE_BLOCK, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_FLUTE_EXHAUST] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_FLUTE_EXHAUST, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WALLRUN_INIT] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_73, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WALLRUN_TO_WALL] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_73, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_WALLRUN_ON_WALL] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_73, CHARACTER_SHARED_ANIM), 2 },
    [CHARSTATE_ICE_SLIDE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_75, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_WALK_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SHARED_ANIM), 2 },
    [CHARSTATE_LAUNCHER_IN_CART] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_71, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_LAUNCHER_IN_AIR] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_71, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_POLE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_72, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_CUTSCENE_LOOK_UP_FRAME_0] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_CUTSCENE_LOOK_UP, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_CUTSCENE_LOOK_UP_FRAME_1] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_CUTSCENE_LOOK_UP, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_CUTSCENE_LOOK_UP_FRAME_2] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_CUTSCENE_LOOK_UP, CHARACTER_SHARED_ANIM), 2 },
    [CHARSTATE_CUTSCENE_LOOK_UP_FRAME_3] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_CUTSCENE_LOOK_UP, CHARACTER_SHARED_ANIM), 3 },
    [CHARSTATE_UNUSED_D] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_E] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_F] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_G] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_H] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_I] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_J] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_K] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_UNUSED_L] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SONIC_FORWARD_THRUST] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SONIC_CATCHING_CREAM] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_37, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_SONIC_CAUGHT_CREAM] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_37, CHARACTER_SHARED_ANIM), 1 },
    [CHARSTATE_CREAM_FLYING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_CREAM), 0 },
    [CHARSTATE_CREAM_FLYING_TURNING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_CREAM), 1 },
    [CHARSTATE_CREAM_FLYING_TIRED] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_CREAM), 0 },
    [CHARSTATE_CREAM_ANIM_20] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_CREAM), 0 },
    [CHARSTATE_CREAM_CHAO_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_CREAM), 0 },
    [CHARSTATE_TAILS_FLYING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS), 0 },
    [CHARSTATE_TAILS_FLYING_TURNING] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS), 0 },
    [CHARSTATE_TAILS_FLYING_TIRED] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS), 0 },
    [CHARSTATE_TAILS_ANIM_19] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_TAILS), 0 },
    [CHARSTATE_KNUCKLES_GLIDE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_GLIDE_FALL] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_GLIDE_FALL_HIT] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_KNUCKLES), 1 },
    [CHARSTATE_KNUCKLES_GLIDE_IMPACT] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 1 },
    [CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_C] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 2 },
    [CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_D] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 3 },
    [CHARSTATE_KNUCKLES_GLIDE_GRAB_WALL] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_23, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_CLIMB_A] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 2 },
    [CHARSTATE_KNUCKLES_CLIMB_B] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_CLIMB_C] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 1 },
    [CHARSTATE_KNUCKLES_CLIMB_D] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 3 },
    [CHARSTATE_KNUCKLES_CLIMB_E] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 4 },
    [CHARSTATE_KNUCKLES_DRILL_CLAW_INIT] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 0 },
    [CHARSTATE_KNUCKLES_DRILL_CLAW_MAIN] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 1 },
    [CHARSTATE_KNUCKLES_DRILL_CLAW_GROUND] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 2 },
    [CHARSTATE_AMY_SA1_JUMP] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_52, CHARACTER_AMY), 0 },
    [CHARSTATE_UNUSED_M] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_AMY_HAMMER_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOSTLESS_ATTACK, CHARACTER_AMY), 0 },
    [CHARSTATE_AMY_SA1_HAMMER_ATTACK] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_AMY), 0 },
    [CHARSTATE_UNUSED_N] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [CHARSTATE_AMY_MID_AIR_HAMMER_SWIRL] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_2, CHARACTER_AMY), 0 },
};

static const s16 playerBoostPhysicsTable[5][2] = {
    { 8, 64 }, { 12, 64 }, { 14, 64 }, { 16, 64 }, { 18, 64 },
};

static const s16 playerBoostThresholdTable[5] = { Q(8), Q(7.96875), Q(6.5625), Q(5.625), Q(4.21875) };

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

// NOTE(Jace): It appears that they originally planned
//             to give the player a different amount of score points
//             depending on the direction of the trick.
static const u16 sTrickPoints[NUM_TRICK_DIRS]
    = { [TRICK_DIR_UP] = 100, [TRICK_DIR_DOWN] = 100, [TRICK_DIR_FORWARD] = 100, [TRICK_DIR_BACKWARD] = 100 };

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

static const u16 sTrickDirToCharstate[NUM_TRICK_DIRS]
    = { CHARSTATE_TRICK_UP, CHARSTATE_TRICK_DOWN, CHARSTATE_TRICK_FORWARD, CHARSTATE_TRICK_BACKWARD };

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
    [0] = { 32, SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_SIDE, CHARACTER_SONIC), SA2_CHAR_ANIM_VARIANT_TRICK_SIDE_PARTICLE_FX },
    [1] = { 24, SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_UP, CHARACTER_KNUCKLES), SA2_CHAR_ANIM_VARIANT_TRICK_UP_PARTICLE_FX },
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

static const u8 disableTrickTimerTable[4] = { 4, 3, 2, 2 };

#else
extern const AnimId gPlayerCharacterIdleAnims[NUM_CHARACTERS];

// TODO: This is unaligned in-ROM.
//       Can we somehow change this to be using a struct instead?
//
// TODO: Tidy up the macros, not just here, but everywhere!
//       This isn't intuitive to read.
//
// The index is the same as Player.unk64
extern const u16 sCharStateAnimInfo[][2];
extern const s16 playerBoostPhysicsTable[5][2];
extern const s16 playerBoostThresholdTable[5];

extern const s16 sSpinDashSpeeds[9];

// NOTE(Jace): It appears that they originally planned
//             to give the player a different amount of score points
//             depending on the direction of the trick.
extern const u16 sTrickPoints[NUM_TRICK_DIRS];

extern const s16 sTrickAccel[NUM_TRICK_DIRS][NUM_CHARACTERS][2];

extern const u16 sTrickDirToCharstate[NUM_TRICK_DIRS];

extern const u8 sTrickMasks[NUM_TRICK_DIRS][NUM_CHARACTERS];

static const u16 gUnknown_080D69A6[2][3];

extern const s16 sSpringAccelY[4];
extern const s16 sSpringAccelX[4];

extern const u8 disableTrickTimerTable[4];
#endif

// TODO: Find a compiler-flag or another way to inline without defining functions twice.

static inline void Player_InitIceSlide_inline(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_ICE_SLIDE;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    m4aSongNumStart(SE_ICE_PARADISE_SLIDE);

    PLAYERFN_SET_AND_CALL(Player_8026BCC, p);
}

static inline void sub_802A500_inline(Player *p)
{
    if (p->qSpeedAirY >= 0) {
        sub_8022218(p);
        sub_8022284(p);
    } else {
        sub_8022284(p);
        sub_8022218(p);
    }
}

static inline void Player_CameraShift_inline(Player *p)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;
}

#ifndef COLLECT_RINGS_ROM
void CreatePlayer(u32 UNUSED characterId, u32 UNUSED levelId, Player *player)
{
    struct Task *t;
    player_0_Task *gt;

    Player *p = player;
    s32 playerID = p->playerID;

    p->spriteTask = TaskCreate(Task_PlayerMain, sizeof(player_0_Task), 0x3000, 0, TaskDestructor_Player);
    gt = TASK_DATA(p->spriteTask);
    gt->unk0 = playerID;
    gt->unk4 = 0;

    if (IS_MULTI_PLAYER) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gRingCount = 1;
        } else {
            gRingCount = 0;
        }
    }

    InitializePlayer(p);

    PLAYERFN_SET(Player_TouchGround);

    CreateBrakingDustEffectRelatedTask();
    InitPlayerHitRingsScatter();

#if !TAS_TESTING
    if ((gInputRecorder.mode == RECORDER_RECORD)) {
        InputRecorderLoadTape();
        gInputRecorder.mode = RECORDER_RECORD;
    } else if (gInputRecorder.mode == RECORDER_PLAYBACK) {
        InputRecorderLoadTape();
        gInputRecorder.mode = RECORDER_PLAYBACK;
    }
#endif

    gStageGoalX = 0;
    gUnknown_030054FC = 0;
    gUnknown_030054E0 = 0;

    InitNewInputCounters();
    AllocateCharacterStageGfx(p, p->spriteInfoBody);
    AllocateCharacterMidAirGfx(p, p->spriteInfoLimbs);
}
#endif

void AllocateCharacterStageGfx(Player *p, PlayerSpriteInfo *param2)
{
    s32 playerID = p->playerID;
    Sprite *s = &param2->s;

    if (playerID == 0) {
        s->graphics.dest = (void *)OBJ_VRAM0;
    } else {
        s->graphics.dest = VramMalloc(64);
    }

    s->graphics.size = 0;
    s->graphics.anim = p->anim;
    s->variant = p->variant;
    s->prevVariant = -1;
    s->x = I(p->qWorldX);
    s->y = I(p->qWorldY);
    s->oamFlags = SPRITE_OAM_ORDER(16 + playerID);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

#ifndef COLLECT_RINGS_ROM
    if (IS_MULTI_PLAYER)
#endif
    {
        s->frameFlags |= (SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_19);
    }

    SPRITE_FLAG_SET(s, ROT_SCALE_ENABLE);
    s->frameFlags |= playerID;

    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;

    param2->transform.rotation = 0;
    param2->transform.qScaleX = +Q(1);
    param2->transform.qScaleY = +Q(1);
    param2->transform.x = 0;
    param2->transform.y = 0;
}

#ifndef COLLECT_RINGS_ROM
// Allocate VRAM for Tails' tails and Cream's ears while mid-air
void AllocateCharacterMidAirGfx(Player *p, PlayerSpriteInfo *param2)
{
    Sprite *s = &param2->s;
    PlayerSpriteInfo *extraSprite = param2;
    u32 character = p->character;

    if (character == CHARACTER_CREAM) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_CREAM);
        extraSprite->s.variant = 1;
    } else if (character == CHARACTER_TAILS) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_TAILS);
        extraSprite->s.variant = 1;
    } else {
        return;
    }

    s->graphics.size = 0;
    s->prevVariant = -1;
    s->x = I(p->qWorldX);
    s->y = I(p->qWorldY);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->frameFlags = (SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 4));

    extraSprite->transform.rotation = 0;
    extraSprite->transform.qScaleX = +Q(1);
    extraSprite->transform.qScaleY = +Q(1);
    extraSprite->transform.x = 0;
    extraSprite->transform.y = 0;
}

void SetStageSpawnPos(u32 character, u32 level, u32 playerID, Player *p)
{
    p->playerID = playerID;
    p->character = character;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        p->checkPointX = gSpawnPositions[level][0];
        p->checkPointY = gSpawnPositions[level][1];
    } else {
        p->checkPointX = 360 - (SIO_MULTI_CNT->id * 20);
        p->checkPointY = 177;
        p->qWorldX = -1;
        p->qWorldY = -1;
    }

    p->unk98 = 0;
    p->checkpointTime = 0;
    p->spriteInfoBody = &gPlayerBodyPSI;
    p->spriteInfoLimbs = &gPlayerLimbsPSI;
}
#endif

void InitializePlayer(Player *p)
{
    if (
#ifndef COLLECT_RINGS_ROM
        (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) &&
#endif
        (p->qWorldX & p->qWorldY) + 1 != 0) {
        p->qWorldX = Q(460);
    } else {
        p->qWorldX = Q(p->checkPointX);
    }
    p->qWorldY = Q(p->checkPointY);

    p->callback = Player_TouchGround;

    p->heldInput = gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick;
    p->frameInput = gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick;

    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
    p->qSpeedGround = 0;
    p->moveState = MOVESTATE_IGNORE_INPUT;
    p->rotation = 0;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    p->unk25 = 120;
    p->spindashAccel = 0;
    p->unk29 = 0;
    p->unk28 = 0;
    p->layer = PLAYER_LAYER__BACK;
#if (GAME == GAME_SA1)
    p->maxSpeed = Q(4.5);
#elif (GAME == GAME_SA2)
    p->maxSpeed = Q(9.0);
    p->topSpeed = Q(6.0);
#endif

#if (GAME == GAME_SA1)
    p->acceleration = Q(8. / 256.);
    p->deceleration = Q(96. / 256.);
#elif (GAME == GAME_SA2)
    p->acceleration = Q(8. / 256.);
    p->deceleration = Q(64. / 256.);
#endif
    p->charState = CHARSTATE_IDLE;
#if (GAME == GAME_SA1)
    p->prevCharState = 0;
#elif (GAME == GAME_SA2)
    p->prevCharState = CHARSTATE_INVALID;
#endif
    p->anim = -1;
    p->variant = -1;
    p->timerInvulnerability = 0;
    p->timerInvincibility = 0;
    p->timerSpeedup = 0;
    p->confusionTimer = 0;
    p->stoodObj = NULL;
    p->itemEffect = PLAYER_ITEM_EFFECT__NONE;
    p->SA2_LABEL(unk2A) = 0;
    p->SA2_LABEL(unk72) = ZONE_TIME_TO_INT(0, 6);
    p->SA2_LABEL(unk7E) = 0;
    p->SA2_LABEL(unk7C) = 0;
    p->SA2_LABEL(unk82) = Q(1);
    p->SA2_LABEL(unk80) = Q(1);
    p->defeatScoreIndex = 0;
    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;
    p->secondsUntilDrown = 30;
    p->framesUntilDrownCountDecrement = 60;
    p->framesUntilWaterSurfaceEffect = 10;

#if (GAME == GAME_SA2)
    p->transition = 0;
    p->unk6E = 0;
    p->prevTransition = 0;
    p->isBoosting = FALSE;
    p->boostSpeed = 0;
    p->unk6C = FALSE;
    p->unk71 = 0;
    p->unk70 = FALSE;
    p->disableTrickTimer = 0;

#ifndef COLLECT_RINGS_ROM
    sub_8015750();
    sub_801561C();
#endif
    Player_HandleBoostThreshold(p);
#endif

    {
        u32 *ptr = (u32 *)(&p->SA2_LABEL(unk99)[0]);
        s32 i = 3;
#if (GAME == GAME_SA2) && !defined(COLLECT_RINGS_ROM) && !defined(NON_MATCHING)
        register u8 *u99_r6 asm("r6") = (void *)ptr;
#endif
        do {
            // @BUG: agbcc compiles this to an stmia instruction, which writes aligned words,
            //       so the written bytes are off by one, because SA2_LABEL(unk99) isn't word-aligned!
            //       >> writes unk98 - unk99[14]
            *ptr++ = 0;
        } while (i-- != 0);
#if (GAME == GAME_SA2) && !defined(COLLECT_RINGS_ROM) && !defined(NON_MATCHING)
        *u99_r6 = 0x7F;
#else
        p->SA2_LABEL(unk99)[0] = 0x7F;
#endif
    }

#ifndef COLLECT_RINGS_ROM
    if ((p->playerID == 0) && IS_SINGLE_PLAYER) {
        if (gCourseTime >= MAX_COURSE_TIME) {
            gCheckpointTime = 0;
            gCourseTime = 0;
            p->checkpointTime = 0;
        } else {
            gCheckpointTime = p->checkpointTime;
            gCourseTime = p->checkpointTime;
        }
    }

    switch (p->character) {
        case CHARACTER_SONIC: {
            p->w.sf.flags = 0;
            p->w.sf.unkAE = 0;
            p->w.sf.unkB0 = 0;
        } break;

#if (GAME == GAME_SA2)
        case CHARACTER_CREAM: {
            p->w.cf.unkAE = 0;
            p->w.cf.flyingDuration = 0;
            p->w.cf.unkB0 = 0;
        } break;
#endif

        case CHARACTER_TAILS: {
            p->w.tf.flags = 0;
            p->w.tf.flyingDuration = 0;
            p->w.tf.shift = 0;
        } break;

        case CHARACTER_KNUCKLES: {
            p->w.kf.flags = 0;
            p->w.kf.shift = 0;
            p->w.kf.unkAE = 0;
        } break;

        case CHARACTER_AMY: {
            p->w.af.unkAC = 0;
        } break;
    }

    gShouldSpawnMPAttackEffect = FALSE;
#endif

    gMPAttackEffect2Regs = NULL;
    gShouldSpawnMPAttack2Effect = FALSE;
}

#ifndef COLLECT_RINGS_ROM
// Called anytime the player actively jumps, "autojumps" through touching an IA,
// touches a Boost Pad or a Rotating Handle, touches the ground, etc.
// TODO: Find a better name.
void Player_TransitionCancelFlyingAndBoost(Player *p)
{
    if (p->moveState & MOVESTATE_20000) {
        m4aSongNumStop(SE_281);
    }

    p->moveState &= ~(MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_400 | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_FLIP_WITH_MOVE_DIR);

    p->unk61 = 0;
    p->unk62 = 0;
    p->unk63 = 0;
    p->unk71 = 0;
    p->unk70 = FALSE;

    if (p->character == CHARACTER_TAILS) {
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    }

    if (p->character == CHARACTER_CREAM) {
        m4aSongNumStop(SE_CREAM_FLYING);
    }

    if (p->character == CHARACTER_SONIC) {
        p->moveState &= ~MOVESTATE_BOOST_EFFECT_ON;
    }
}
#endif

// Very similar to sub_8029BB8
s32 sub_802195C(Player *p, u8 *rot, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerX2 = I(p->qWorldX) - (2 + p->spriteOffsetX);
    playerY2 = I(p->qWorldY) - (p->spriteOffsetY);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerX2, playerY2, mask, -8, &anotherByte, sub_801ED24);

    playerX = I(p->qWorldX) - (2 + p->spriteOffsetX);
    playerY = I(p->qWorldY) + (p->spriteOffsetY);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerX, playerY, mask, -8, &anotherByte2, sub_801ED24);

    if (r5 < r1) {
        result = r5;
        *rot = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *rot = anotherByte2;
        *out = r5;
    }

    return result;
}

// Very similar to sub_802195C
s32 sub_8021A34(Player *p, u8 *rot, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerX2 = I(p->qWorldX) + (2 + p->spriteOffsetX);
    playerY2 = I(p->qWorldY) - (p->spriteOffsetY);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerX2, playerY2, mask, +8, &anotherByte, sub_801ED24);

    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);
    playerY = I(p->qWorldY) + (p->spriteOffsetY);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerX, playerY, mask, +8, &anotherByte2, sub_801ED24);

    if (r5 < r1) {
        result = r5;
        *rot = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *rot = anotherByte2;
        *out = r5;
    }

    return result;
}

// Very similar to sub_802195C
s32 sub_8021B08(Player *p, u8 *rot, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerY2 = I(p->qWorldY) - (p->spriteOffsetY);
    playerX2 = I(p->qWorldX) - (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerY2, playerX2, mask, -8, &anotherByte, sub_801EE64);

    playerY = I(p->qWorldY) - (p->spriteOffsetY);
    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerY, playerX, mask, -8, &anotherByte2, sub_801EE64);

    if (r5 < r1) {
        result = r5;
        *rot = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *rot = anotherByte2;
        *out = r5;
    }

    return result;
}

void sub_8021BE0(Player *p)
{
    if (!(p->moveState & MOVESTATE_200)) {
        if (!(p->moveState & MOVESTATE_800000)) {
            PLAYERFN_SET(Player_TouchGround);
            p->moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
        }

        if (p->moveState & MOVESTATE_4) {
            p->moveState &= ~MOVESTATE_4;
            Player_HandleSpriteYOffsetChange(p, 14);
        }
        PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    } else {
        p->moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
    }

    p->defeatScoreIndex = 0;
}

void sub_8021C4C(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;

    u32 mask;
    u32 mask2 = p->layer;

    playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
    playerY = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }

    result = sub_801E4E4(playerX, playerY, mask, -8, 0, sub_801ED24);

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
    }

    playerX2 = I(p->qWorldX) + (3 + p->spriteOffsetX);
    playerY2 = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    result = sub_801E4E4(playerX2, playerY2, mask, +8, 0, sub_801ED24);

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, &rotation, ptr);
    } else
#endif
    {
        result = sub_8029B0C(p, &rotation, ptr);
    }

    if (result < 0) {
        s8 rotCopy;
        s32 r1 = I(p->qSpeedAirY);
        r1 += 6;
        r1 = -r1;

        if ((result >= r1) || (fnOut >= r1)) {
            s32 airY;
            p->rotation = rotation;

#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }
#endif

            p->qWorldY += result << 8;

            sub_8021BE0(p);

            if ((rotation + 32) & 0x40) {
                p->qSpeedAirX = 0;

                if (p->qSpeedAirY > Q(11.8125)) {
                    p->qSpeedAirY = Q(11.8125);
                }
            } else if (!((rotation + 16) & 0x20)) {
                p->qSpeedAirY = 0;
                p->qSpeedGround = p->qSpeedAirX;
                return;
            } else {
                p->qSpeedAirY >>= 1;
            }

            airY = p->qSpeedAirY;
            if (airY < 0) {
                airY = -airY;
            }
            p->qSpeedGround = airY;

            rotCopy = rotation;
            if (rotCopy < 0) {
                p->qSpeedGround = -airY;
            }
        }
    }
}

void sub_8021DB8(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;

    u32 mask;
    u32 mask2 = p->layer;

    playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
    playerY = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }

    result = sub_801E4E4(playerX, playerY, mask, -8, 0, sub_801ED24);

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
    }

    playerX2 = I(p->qWorldX) + (3 + p->spriteOffsetX);
    playerY2 = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    result = sub_801E4E4(playerX2, playerY2, mask, +8, 0, sub_801ED24);

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else
#endif
    {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
#endif

        p->qWorldY -= result << 8;

        if (((rotation + 32) & 0x40)) {
            s8 *pt = (s8 *)&rotation;
            if ((*pt - 0x40) > 0) {
                s32 speed;
                p->rotation = rotation;

                sub_8021BE0(p);

                speed = p->qSpeedAirY;
                if (speed < 0) {
                    speed = -speed;
                }
                p->qSpeedGround = speed;
                return;
            }
        }
        p->qSpeedAirY = 0;
    }
}

void sub_8021EE4(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->layer;

#ifndef COLLECT_RINGS_ROM
    gravity = GRAVITY_IS_INVERTED;
    if (gravity) {
        playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
        playerY = I(p->qWorldY);
        result = sub_801E4E4(playerX, playerY, mask2, -8, NULL, sub_801ED24);
    } else
#endif
    {
        playerX2 = I(p->qWorldX) - (3 + p->spriteOffsetX);
        playerY2 = I(p->qWorldY);

        mask = mask2;
        if (p->qSpeedAirY < Q(3.0)) {
            mask |= 0x80;
        }
        result = sub_801E4E4(playerX2, playerY2, mask, -8, NULL, sub_801ED24);
    }

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
        p->qSpeedGround = p->qSpeedAirY;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else
#endif
    {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
#endif

        p->qWorldY -= Q(result);

        if (p->qSpeedAirY < 0) {
            p->qSpeedAirY = 0;
        }
    } else if (p->qSpeedAirY >= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, &fnOut);
        } else
#endif
        {
            result = sub_8029B0C(p, &rotation, &fnOut);
        }

        if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }
#endif

            p->qWorldY += Q(result);

            p->rotation = rotation;
            sub_8021BE0(p);

            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
    }
}

void sub_802203C(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->layer;
#ifndef COLLECT_RINGS_ROM
    gravity = GRAVITY_IS_INVERTED;
    if (gravity) {
        playerX = I(p->qWorldX) + (3 + p->spriteOffsetX);
        playerY = I(p->qWorldY);
        result = sub_801E4E4(playerX, playerY, mask2, +8, NULL, sub_801ED24);
    } else
#endif
    {
        playerX2 = I(p->qWorldX) + (3 + p->spriteOffsetX);
        playerY2 = I(p->qWorldY);

        mask = mask2;
        if (p->qSpeedAirY < Q(3.0)) {
            mask |= 0x80;
        }
        result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);
    }

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        p->qSpeedGround = p->qSpeedAirY;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else
#endif
    {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
#endif

        p->qWorldY -= Q(result);

        if (p->qSpeedAirY < 0) {
            p->qSpeedAirY = 0;
        }
    } else if (p->qSpeedAirY >= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, &fnOut);
        } else
#endif
        {
            result = sub_8029B0C(p, &rotation, &fnOut);
        }

        if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }
#endif
            p->qWorldY += Q(result);

            p->rotation = rotation;
            sub_8021BE0(p);

            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
    }
}

#ifndef COLLECT_RINGS_ROM
void sub_8022190(Player *p)
{
    s16 airY = p->qSpeedAirY;
    u8 arcResult = (GRAVITY_IS_INVERTED) ? 0x80 : 0;
    s16 airX = p->qSpeedAirX;

    if (airX || airY) {
        arcResult = I(ArcTan2(airX, airY));
    }

    arcResult = (arcResult - 0x20) & 0xC0;

    switch (arcResult >> 6) {
        case 0: {
            sub_8021C4C(p);
        } break;

        case 2: {
            sub_8021DB8(p);
        } break;

        case 1: {
            sub_8021EE4(p);
        } break;

        case 3: {
            sub_802203C(p);
        } break;
    }
}

void sub_8022218(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;

    if (GRAVITY_IS_INVERTED) {
        res = sub_8029AC0(p, &rotation, pSp04);
    } else {
        res = sub_8029B0C(p, &rotation, pSp04);
    }

    if (res <= 0) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->qWorldY += Q(res);
        p->rotation = rotation;
        sub_8021BE0(p);

        p->qSpeedAirY = 0;
        p->qSpeedGround = p->qSpeedAirX;
    }
}
#endif

void sub_8022284(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;
    s32 airY;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        res = sub_8029B0C(p, &rotation, pSp04);
    } else
#endif
    {
        res = sub_8029AC0(p, &rotation, pSp04);
    }

    if (res <= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }
#endif

        p->qWorldY -= Q(res);
        p->rotation = rotation;
        sub_8021BE0(p);

        airY = p->qSpeedAirY;
        if (airY < 0) {
            airY = -airY;
        }
        p->qSpeedGround = airY;

        if ((s8)rotation >= 0) {
            p->qSpeedGround = -airY;
        }

        if (p->unk6E) {
            p->moveState ^= MOVESTATE_FACING_LEFT;
        }
    }
}

#if COLLECT_RINGS_ROM
void sub_0200DBE0(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 sp08;
    s32 res;
    if (p->qSpeedAirY >= 0) {
        res = sub_8029B0C(p, &rotation, &sp04);
        if (res <= 0) {
            p->qWorldY += Q(res);
            p->rotation = rotation;
            sub_8021BE0(p);
            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
        sub_8022284(p);
    } else {
        sub_8022284(p);
        res = sub_8029B0C(p, &rotation, &sp08);
        if (res <= 0) {
            p->qWorldY += Q(res);
            p->rotation = rotation;
            sub_8021BE0(p);
            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
void sub_8022318(Player *p)
{
    s32 offsetY;

    if (!(p->moveState & MOVESTATE_4)) {
        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;
    } else {
        p->moveState &= ~MOVESTATE_4;
        p->charState = CHARSTATE_IDLE;

        offsetY = p->spriteOffsetY - 14;

        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }

        if (((p->rotation + 0x40) << 24) <= 0) {
            offsetY = -offsetY;
        }

        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;

        p->qWorldY += Q(offsetY);
    }

    p->moveState &= ~MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState &= ~MOVESTATE_100;

    p->defeatScoreIndex = 0;
    p->unk25 = 120;
    p->unk61 = 0;

    if (p->charState >= CHARSTATE_KNUCKLES_GLIDE) {
        p->charState = CHARSTATE_IDLE;
    }
}

void sub_80223BC(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;

    u32 mask;
    u32 mask2 = p->layer;

    playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
    playerY = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    playerX2 = I(p->qWorldX) + (3 + p->spriteOffsetX);
    playerY2 = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        p->w.sf.flags |= 0x20;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, &rotation, ptr);
    } else {
        result = sub_8029B0C(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->qWorldY += Q(result);

        p->rotation = rotation;
        p->qSpeedAirY = 0;
        p->w.sf.flags &= ~0x2;
    }
}

// Similar to sub_80223BC
void sub_80224DC(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;

    u32 mask;
    u32 mask2 = p->layer;

    playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
    playerY = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    playerX2 = I(p->qWorldX) + (3 + p->spriteOffsetX);
    playerY2 = I(p->qWorldY);

    mask = mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        p->w.sf.flags |= 0x20;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->qWorldY -= Q(result);

        p->qSpeedAirY = 0;
    }
}

void sub_80225E8(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u8 *mask2 = &p->layer;

    playerX = I(p->qWorldX) - (2 + p->spriteOffsetX);
    playerY = I(p->qWorldY);

    mask = *mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    gravity = GRAVITY_IS_INVERTED;
    ptr = &fnOut;
    if (gravity) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
        p->qWorldY -= Q(result);

        if (p->qSpeedAirY < 0) {
            p->qSpeedAirY = 0;
        }
    } else if (p->qSpeedAirY >= 0) {

        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, ptr);
        } else {
            result = sub_8029B0C(p, &rotation, ptr);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->qWorldY += Q(result);

            p->rotation = rotation;
            p->qSpeedAirY = 0;
            p->w.sf.flags &= ~0x2;
        }
    }
}

// Similar to sub_80225E8
void sub_8022710(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u8 *mask2 = &p->layer;

    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);
    playerY = I(p->qWorldY);

    mask = *mask2;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX, playerY, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    gravity = GRAVITY_IS_INVERTED;
    ptr = &fnOut;
    if (gravity) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
        p->qWorldY -= Q(result);

        if (p->qSpeedAirY < 0) {
            p->qSpeedAirY = 0;
        }
    } else if (p->qSpeedAirY >= 0) {

        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, ptr);
        } else {
            result = sub_8029B0C(p, &rotation, ptr);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->qWorldY += Q(result);

            p->rotation = rotation;
            p->qSpeedAirY = 0;
            p->w.sf.flags &= ~0x2;
        }
    }
}

void sub_8022838(Player *p)
{
    s16 airX = p->qSpeedAirX;
    s16 airY = p->qSpeedAirY;
    u8 arcResult = 0;

    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
        p->w.sf.flags &= ~0x2;
        p->unk29 = 0;
        p->unk28 = 0;
    } else {
        arcResult = I(ArcTan2(airX, airY));

        arcResult = (arcResult - 0x20) & 0xC0;

        switch (arcResult >> 6) {
            case 0: {
                sub_80223BC(p);
            } break;

            case 2: {
                sub_80224DC(p);
            } break;

            case 1: {
                sub_80225E8(p);
            } break;

            case 3: {
                sub_8022710(p);
            } break;
        }
    }
}
#endif

void sub_80228C0(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4") = p->qWorldX;
    register s32 playerY asm("sl") = p->qWorldY;
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerX = p->qWorldX;
    s32 playerY = p->qWorldY;
#endif
    u32 mask = p->layer;
    s32 py = I(playerY);

    resultA = sub_801E4E4(py + p->spriteOffsetY, (playerX = I(playerX)) - (2 + p->spriteOffsetX), mask, 8, &p->unk28, sub_801EE64);

    py = py + (p->spriteOffsetY);
    playerX += 2;
    playerX += p->spriteOffsetX;
    p29 = &p->unk29;
    resultB = sub_801E4E4(py, playerX, mask, 8, p29, sub_801EE64);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerY += Q(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = *p29;
            }
        } else /* val > 0 */ {
            s32 airX = p->qSpeedAirX;

            if (airX < 0) {
                airX = -airX;
            }

            airX = I(airX);
            airX += 3;

            if (airX > 11)
                airX = 11;

            if (val <= airX) {
                playerY += Q(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = *p29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->qWorldY = playerY;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = -r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0), "r"(r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
#endif
    }
}

// Similar to sub_80228C0, sub_8022B18
void sub_80229EC(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
    s32 playerY;
    s32 py;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4");
    register u32 mask asm("r9");
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerX;
    u32 mask;
#endif
    playerX = p->qWorldX;
    playerY = (p->qWorldY);
    mask = p->layer;
    py = I(playerY);

    resultA = sub_801E4E4(py - p->spriteOffsetY, (playerX = I(playerX)) + (2 + p->spriteOffsetX), mask, -8, &p->unk28, sub_801EE64);

    py = py - (p->spriteOffsetY);
    playerX -= 2;
    playerX -= p->spriteOffsetX;
    p29 = &p->unk29;
    resultB = sub_801E4E4(py, playerX, mask, -8, p29, sub_801EE64);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerY -= Q(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = *p29;
            }
        } else /* val > 0 */ {
            s32 airX = p->qSpeedAirX;

            if (airX < 0) {
                airX = -airX;
            }

            airX = I(airX);
            airX += 3;

            if (airX > 11)
                airX = 11;

            if (val <= airX) {
                playerY -= Q(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = *p29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->qWorldY = playerY;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = 128-r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0), "r"(r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
#endif
    }
}

// Similar to sub_80228C0, sub_80229EC
void sub_8022B18(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
    s32 playerX;
    s32 py;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerY asm("r4");
    register u32 mask asm("r9");
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerY;
    u32 mask;
#endif
    playerX = p->qWorldX;
    playerY = (p->qWorldY);
    mask = p->layer;
    py = I(playerX);

    resultA = sub_801E4E4(py - p->spriteOffsetY, (playerY = I(playerY)) - (2 + p->spriteOffsetX), mask, -8, &p->unk28, sub_801ED24);

    py = py - (p->spriteOffsetY);
    playerY += 2;
    playerY += p->spriteOffsetX;
    p29 = &p->unk29;
    resultB = sub_801E4E4(py, playerY, mask, -8, p29, sub_801ED24);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerX -= Q(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = *p29;
            }
        } else /* val > 0 */ {
            s32 airY = p->qSpeedAirY;

            if (airY < 0) {
                airY = -airY;
            }

            airY = I(airY);
            airY += 3;

            if (airY > 11)
                airY = 11;

            if (val <= airY) {
                playerX -= Q(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = *p29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->qWorldX = playerX;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = 128-r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0), "r"(r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
#endif
    }
}

// Similar to sub_80228C0, sub_80229EC, sub_8022B18
void sub_8022C44(Player *p)
{
    s32 val;
    s32 resultB;
    s32 playerX;
    s32 py;
    s32 resultA;

#ifndef NON_MATCHING
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerY asm("r4");
    register u32 mask asm("r8");
#else
    u32 r1;
    u32 r0;
    s32 playerY;
    u32 mask;
#endif
    playerX = p->qWorldX;
    playerY = (p->qWorldY);
    mask = p->layer;
    py = I(playerX);

    resultA = sub_801E4E4(py + p->spriteOffsetY, (playerY = I(playerY)) + (2 + p->spriteOffsetX), mask, +8, &p->unk28, sub_801ED24);

    py = py + (p->spriteOffsetY);
    playerY -= 2;
    playerY -= p->spriteOffsetX;
    resultB = sub_801E4E4(py, playerY, mask, +8, &p->unk29, sub_801ED24);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerX += Q(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = p->unk29;
            }
        } else /* val > 0 */ {
            s32 airY = p->qSpeedAirY;

            if (airY < 0) {
                airY = -airY;
            }

            airY = I(airY);
            airY += 3;

            if (airY > 11)
                airY = 11;

            if (val <= airY) {
                playerX += Q(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = p->unk29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->qWorldX = playerX;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
#ifndef NON_MATCHING
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0), "r"(r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
#else
            *pRot = 128 - r1;
#endif
        }
#endif
    }
}

void sub_8022D6C(Player *p)
{
    u8 r1 = 0;
    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
        p->unk29 = 0;
        p->unk28 = 0;
        return;
    }

    // NOTE/TODO: Not in SA1, but likely in SA3, so assuming >= GAME_SA2!
#if (GAME >= GAME_SA2) && !defined(COLLECT_RINGS_ROM)
    if ((gCurrentLevel == 0) && (gWater.isActive == TRUE)) {
        s32 r5 = Q(p->qWorldY) >> 16;
        u32 mask = ~0x3;
        s32 offsetY = p->spriteOffsetY;
        s32 unk4 = gWater.currentWaterLevel;
        s16 r0 = (unk4 - offsetY) & mask;
        r5 &= mask;

        if ((r5 == (r0)) && (p->qSpeedAirY >= 0) && ((u8)(p->rotation + 0x18) <= 0x30) && (!(p->moveState & MOVESTATE_IN_AIR))
            && (ABS(p->qSpeedGround) >= Q(6.0))) {
            sub_80228C0(p);

            if (p->qWorldY >= Q(r5)) {
                if (!(p->moveState & MOVESTATE_20000)) {
                    p->moveState |= MOVESTATE_20000;

                    if (IS_SINGLE_PLAYER) {
                        CreateRunOnWaterEffect();
                    }
                }

                m4aSongNumStartOrContinue(SE_281);
                p->qWorldY = (r0 << 8);
                p->rotation = 0;
                p->moveState &= ~MOVESTATE_IN_AIR;
            } else {
                if (p->moveState & MOVESTATE_20000) {
                    m4aSongNumStop(SE_281);
                }
                p->moveState &= ~MOVESTATE_20000;
            }
            return;
        } else if (p->moveState & MOVESTATE_20000) {
            p->moveState &= ~MOVESTATE_20000;
            m4aSongNumStop(SE_281);
        }
    }
#endif

#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        s8 rot = p->rotation;
        rot += 0x40;
        rot = -rot;
        rot -= 0x40;

        if (rot + 0x20 > 0) {
            if (rot <= 0) {
                r1 = rot + 0x20;
            } else {
                r1 = rot + 0x1F;
            }
        } else {
            if (rot > 0) {
                r1 = rot + 0x20;
            } else {
                r1 = rot + 0x1F;
            }
        }

        switch (r1 >> 6) {
            case 0: {
                sub_80228C0(p);
            } break;

            case 2: {
                sub_80229EC(p);
            } break;

            case 1: {
                sub_8022B18(p);
            } break;

            case 3: {
                sub_8022C44(p);
            } break;
        }
    } else
#endif
    {
        s8 rot = p->rotation;

        if (rot + 0x20 > 0) {
            if (rot <= 0) {
                r1 = rot + 0x20;
            } else {
                r1 = rot + 0x1F;
            }
        } else {
            if (rot > 0) {
                r1 = rot + 0x20;
            } else {
                r1 = rot + 0x1F;
            }
        }

        switch (r1 >> 6) {
            case 0: {
                sub_80228C0(p);
            } break;

            case 2: {
                sub_80229EC(p);
            } break;

            case 1: {
                sub_8022B18(p);
            } break;

            case 3: {
                sub_8022C44(p);
            } break;
        }
    }
}

// (100.00%) https://decomp.me/scratch/U0r54
s32 sub_8022F58(u8 param0, Player *p)
{
    u32 p0;
    s32 result = 0; // maybe u8?
    s32 r4;
    u8 sp0[4];
    s32 sp4[4];
#ifndef NON_MATCHING
    register s32 fnRes asm("r3");
#else
    s32 fnRes;
#endif

    p->unk29 = param0;
    p->unk28 = param0;

    p0 = (param0 + Q(0.125)) & 0xC0;

#ifndef NON_MATCHING
    asm("asr %0, %1, #6\n" : "=r"(r4) : "r"(p0));
#else
    r4 = p0 >> 6;
#endif

    switch (r4) {
        case 0: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_8029BB8(p, ptr, &sp4[0]);
            temp = *ptr;

            if (sp0[0] & 0x1) {
                *ptr = result;
            } else {
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;

        case 1: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_802195C(p, ptr, &sp4[1]);
            temp = *ptr;

            if (temp & 0x1) {
                *ptr = result;
            } else {
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;

        case 2: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_8021B08(p, ptr, &sp4[2]);
            temp = *ptr;

            if (temp & 0x1) {
                *ptr = result;
            } else {
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;

        case 3: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_8021A34(p, ptr, &sp4[3]);
            temp = *ptr;

            if (temp & 0x1) {
                *ptr = result;
            } else {
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;
    }

    return result;
}

s32 sub_802302C(u8 param0, Player *p)
{
    s32 r3;
    u32 r0;
    s32 result;
    u32 temp;

    s32 px = I(p->qWorldX);
    s32 py = I(p->qWorldY);

    p->unk29 = param0;
    r3 = (s8)param0;
#ifndef NON_MATCHING
    p->unk28 = ((u32)param0 << 0x18) >> 0x18;
#else
    p->unk28 = param0;
#endif

    if (((param0 + Q(0.125)) << 24) > 0) {
        if (r3 <= 0) {
#ifndef NON_MATCHING
            asm("");
#endif
            param0 += Q(0.125);
        } else {
            param0 += Q(0.125) - 1;
        }
    } else {
        if (r3 <= 0) {
            param0 += Q(0.125) - 1;
        } else {
            param0 += Q(0.125);
        }
    }

    switch (param0 >> 6) {
        case 0: {
            s32 y = py + 2;
            result = sub_801E4E4(y + p->spriteOffsetX, px, p->layer, +8, NULL, sub_801EE64);
        } break;

        case 2: {
            s32 y = py - 2;
            result = sub_801E4E4(y - p->spriteOffsetX, px, p->layer, -8, NULL, sub_801EE64);
        } break;

        case 1: {
            s32 x = (px - 2);
            result = sub_801E4E4(x - p->spriteOffsetX, py, p->layer, -8, NULL, sub_801ED24);
        } break;

        case 3: {
            s32 x = (px + 2);
            result = sub_801E4E4(x + p->spriteOffsetX, py, p->layer, +8, NULL, sub_801ED24);
        } break;

        default: {
            result = 0;
        }
    }

    return result;
}

void sub_8023128(Player *p)
{
    u8 r1;
    u32 temp;
    u8 r5;
    s32 r2;

    if (p->qSpeedGround == 0) {
        return;
    }

    r1 = Q(0.25);
    if (p->qSpeedGround >= 0) {
        r1 = -Q(0.25);
    }

    // without temp, the add instr. sources get switched
    temp = p->rotation + r1;
    r5 = temp;

    r2 = Q(sub_802302C(r5, p));

    if (r2 <= 0) {
        s32 rot = (r5 + Q(0.125));

        switch ((rot & 0xC0) >> 6) {

            case 0: {
                p->qWorldY += r2;
                p->qSpeedAirY = 0;
            } break;

            case 1: {
                p->qWorldX -= r2;
                p->qSpeedAirX = 0;
                p->moveState |= MOVESTATE_20;
                p->qSpeedGround = 0;
            } break;

            case 2: {
                p->qWorldY -= r2;
                p->qSpeedAirY = 0;
                p->moveState |= MOVESTATE_IN_AIR;
            } break;

            case 3: {
                p->qWorldX += r2;
                p->qSpeedAirX = 0;
                p->moveState |= MOVESTATE_20;
                p->qSpeedGround = 0;
            } break;
        }

        p->unk62 = 0;
        p->unk63 = 0;
    }
}

void sub_80231C0(Player *p)
{
    u8 r1;
    u32 temp;
    u8 r5;
    s32 r2;

    if (p->qSpeedGround == 0) {
        return;
    }

    r1 = Q(0.25);
    if (p->qSpeedGround >= 0) {
        r1 = -Q(0.25);
    }

    // without temp, the add instr. sources get switched
    temp = p->rotation + r1;
    r5 = temp;

    r2 = Q(sub_802302C(r5, p));

    if (r2 <= 0) {
        switch (((r5 + Q(0.125)) & 0xC0) >> 6) {

            case 0: {
                p->qWorldY += r2;
                p->qSpeedAirY = 0;
            } break;

            case 1: {
                p->qWorldX -= r2;
                p->qSpeedAirX = 0;
                p->moveState &= ~MOVESTATE_4;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                p->qSpeedGround = 0;
            } break;

            case 2: {
                p->qWorldY -= r2;
                p->qSpeedAirY = 0;
                p->moveState |= MOVESTATE_IN_AIR;
            } break;

            case 3: {
                p->qWorldX += r2;
                p->qSpeedAirX = 0;
                p->moveState &= ~MOVESTATE_4;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                p->qSpeedGround = 0;
            } break;
        }
    }
}

void sub_8023260(Player *p)
{
    s32 maxSpeed = p->maxSpeed;

    if (p->qSpeedGround > (s16)maxSpeed) {
        p->qSpeedGround = +maxSpeed;
    } else {
        s32 speedX = p->qSpeedGround;
        if (speedX < -(s16)maxSpeed) {
            p->qSpeedGround = -maxSpeed;
        }
    }

    maxSpeed = p->qSpeedGround;

    {
        s16 rot = p->rotation;

        p->qSpeedAirX = I(COS_24_8(rot * 4) * maxSpeed);

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->qSpeedAirY = 0;
        }

        p->qSpeedAirY += I(SIN_24_8(rot * 4) * maxSpeed);
    }
}

void sub_80232D0(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 qPX = p->qWorldX;
    s32 qPY = p->qWorldY;
    s32 ix, iy;
    s32 ox, oy;
#ifndef COLLECT_RINGS_ROM
    if (p->playerID == 0) {
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gCurrentLevel & 0x2) {
                ox = gUnknown_080D650C[gCurrentLevel].x;
                if ((ox >= 0) && (qPX >= Q(ox))) {
                    ix = gUnknown_080D661C[gCurrentLevel].x;
                    iy = gUnknown_080D661C[gCurrentLevel].y;

                    qPX += Q(ix);
                    qPY += Q(iy);

                    if (gCheese != NULL) {
                        gCheese->posX += Q(ix);
                        gCheese->posY += Q(iy);
                    }

                    gUnknown_030054FC = Q(ix);
                    gUnknown_030054E0 = Q(iy);

                    sub_8039F14(Q(ix), Q(iy));

                    gBossRingsShallRespawn = TRUE;

                    cam->x += ix;
                    cam->unk20 += ix;
                    cam->unk10 += ix;
                    cam->y += iy;
                    cam->unk24 += iy;
                    cam->unk14 += iy;
                }
            }
        } else if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            ox = gUnknown_080D650C[gCurrentLevel].x;
            if ((ox >= 0) && (qPX >= Q(ox)) && (cam->unk8 != 0)) {
                if (!(cam->unk50 & 0x1)) {
                    s32 ix;

                    ix = gUnknown_080D661C[gCurrentLevel].x;
                    qPX += Q(ix);
                    cam->x += ix;
                    cam->unk20 += ix;
                    cam->unk10 += ix;

                    if (gCheese != NULL) {
                        gCheese->posX += Q(ix);
                    }
                }
            }

            oy = gUnknown_080D650C[gCurrentLevel].y;
            if ((oy >= 0) && (qPY >= Q(oy)) && (cam->unkC != 0)) {
                if (!(cam->unk50 & 0x2)) {
                    s32 iy;

                    iy = gUnknown_080D661C[gCurrentLevel].y;
                    qPY += Q(iy << 8);
                    cam->y += Q(iy);
                    cam->unk24 += Q(iy);

                    if (gCheese != NULL) {
                        gCheese->posY += Q(iy << 8);
                    }
                }
            }
        }
    }
#endif
    if ((p->moveState & (MOVESTATE_80000000 | MOVESTATE_DEAD)) != MOVESTATE_DEAD) {
        s32 r2, r3;
        struct Camera *cam2 = &gCamera;
        r3 = p->qWorldY;

        if ((s32)p->moveState >= 0) {
            s32 r1;

#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                if (p->qWorldY > Q(gCamera.minY)) {
                    goto lbl0;
                } else {
                    r1 = 1;
                }
            } else {
                s32 qMaxY = Q(cam2->maxY) - 1;

                r1 = 1;

                if (p->qWorldY < qMaxY) {
                lbl0:
                    r1 = 0;
                }
            }
#else
            {
                s32 qMaxY = Q(cam2->maxY) - 1;

                r1 = 0;

                if (p->qWorldY >= qMaxY) {
                lbl0:
                    r1 = 1;
                }
            }
#endif

            if (r1 != 0) {
                p->moveState |= MOVESTATE_DEAD;

#ifndef COLLECT_RINGS_ROM
                if (p->moveState & MOVESTATE_IN_WATER) {
                    p->qSpeedAirY = -Q(2.625);
                } else
#endif
                {
                    p->qSpeedAirY = -Q(4.875);
                }

#ifndef COLLECT_RINGS_ROM
                qPY = GRAVITY_IS_INVERTED ? Q(cam->minY) : Q(cam->maxY) - 1;
#else
                qPY = Q(cam->maxY) - 1;
#endif
            }
        }

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            r2 = gBossCameraClampYLower;
            r3 = gBossCameraClampYUpper;
        } else {
            r2 = cam->minY;
            r3 = cam->maxY;
        }

        {
            s32 oldQPX = qPX;
            s32 oldQPY = qPY;
            s32 qMinX = Q(cam->minX);

            qPX = CLAMP_32(qPX, qMinX, Q(cam->maxX) - 1);
            qPY = CLAMP_32(qPY, Q(r2), Q(r3) - 1);

            if (qPX != oldQPX) {
                p->qSpeedAirX = 0;
                p->qSpeedGround = 0;
            }

            if (qPY != oldQPY) {
                p->qSpeedAirY = 0;
                p->qSpeedGround = 0;
            }

#ifndef COLLECT_RINGS_ROM
            if (IS_BOSS_STAGE(gCurrentLevel)) {
                s32 qPXMin = (Q(cam->unk10));
                if (qPX < qPXMin + Q(8.0)) {
                    qPX = qPXMin + Q(8.0);
                    p->qSpeedGround = BOSS_VELOCITY_X;
                    p->qSpeedAirX = BOSS_VELOCITY_X;

                    p->moveState &= ~MOVESTATE_FACING_LEFT;
                } else if (qPX > (qPXMin + Q(312.0))) {
                    qPX = (qPXMin + Q(312.0));
                    p->qSpeedGround = BOSS_VELOCITY_X;
                    p->qSpeedAirX = BOSS_VELOCITY_X;
                }
            }
#endif

            p->qWorldX = qPX;
            p->qWorldY = qPY;
        }
    }
}

void Player_AirInputControls(Player *p)
{
    s32 r5 = p->acceleration * 2;
    s32 r6 = p->topSpeed;

    if ((p->charState != CHARSTATE_HIT_AIR) && !(p->moveState & MOVESTATE_FLIP_WITH_MOVE_DIR)) {
        s16 qAirSpeedS;
        u16 qAirSpeedU = p->qSpeedAirX;

        if (p->heldInput & DPAD_LEFT) {
            if ((p->charState != CHARSTATE_WALK_B) && !(p->moveState & MOVESTATE_2000)) {
                p->moveState |= MOVESTATE_FACING_LEFT;
            }

            qAirSpeedS = qAirSpeedU;
            qAirSpeedU = qAirSpeedS - r5;
            qAirSpeedS = qAirSpeedU;

            if (qAirSpeedS < -r6) {
                qAirSpeedU = qAirSpeedS + r5;
                qAirSpeedS = qAirSpeedU;

                if (qAirSpeedS > -r6) {
                    qAirSpeedU = -r6;
                }
            }
        } else if (p->heldInput & DPAD_RIGHT) {
            if ((p->charState != CHARSTATE_WALK_B) && !(p->moveState & MOVESTATE_2000)) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            qAirSpeedS = qAirSpeedU;
            qAirSpeedU = qAirSpeedS + r5;
            qAirSpeedS = qAirSpeedU;

            if (qAirSpeedS > r6) {
                qAirSpeedU = qAirSpeedS - r5;
                qAirSpeedS = qAirSpeedU;

                if (qAirSpeedS < r6) {
                    qAirSpeedU = r6;
                }
            }
        }

        p->qSpeedAirX = qAirSpeedU;
    }
}

void sub_80236C8(Player *p)
{
    s16 airX;
    s16 airX2;

    if ((u16)p->qSpeedAirY < (u16)Q(189))
        return;

    airX = p->qSpeedAirX;
    airX2 = (airX >> 5);

    if (airX2 < 0) {
        airX = (airX - airX2);
        if (airX > 0) {
            airX = 0;
        }
        p->qSpeedAirX = airX;
    } else if (airX2 > 0) {
        airX = (airX - airX2);

        if (airX < 0) {
            airX = 0;
        }

        p->qSpeedAirX = airX;
    }
}

void sub_8023708(Player *p)
{
    s16 airX;
    s16 airX2;

    if ((u16)p->qSpeedAirY < (u16)Q(189))
        return;

    airX = p->qSpeedAirX;
    airX2 = (airX >> 6);

    if (airX2 < 0) {
        airX = (airX - airX2);
        if (airX > 0) {
            airX = 0;
        }
        p->qSpeedAirX = airX;
    } else if (airX2 > 0) {
        airX = (airX - airX2);

        if (airX < 0) {
            airX = 0;
        }

        p->qSpeedAirX = airX;
    }
}

#ifndef COLLECT_RINGS_ROM

void sub_8023748(Player *p)
{
    if (p->itemEffect == PLAYER_ITEM_EFFECT__NONE)
        return;

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) && (--p->timerSpeedup == 0)) {
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__MP_SLOW_DOWN) && (--p->timerSpeedup == 0)) {
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) && (--p->timerInvincibility == 0)) {
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__INVINCIBILITY;

        if (p->itemEffect & PLAYER_ITEM_EFFECT__SHIELD_NORMAL) {
            CreateItemTask_Shield_Normal(gPlayer.playerID);
        } else if (p->itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC) {
            CreateItemTask_Shield_Magnetic(gPlayer.playerID);
        }

        // TODO: This could be a macro: IS_ACTICE_SONG(id)
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_INVINCIBILITY].header) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__20) && (--p->itemEffect20Timer == 0)) {
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__20;
        gDispCnt &= ~DISPCNT_OBJWIN_ON;
        gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
    }
}

void Player_HandleWater(Player *p)
{
#if (GAME == GAME_SA1) && !defined(BUG_FIX)
#define WATER_ACTIVE_CHECK 1
#else
#define WATER_ACTIVE_CHECK gWater.isActive == TRUE
#endif

    p->moveState &= ~MOVESTATE_1000;
    if (WATER_ACTIVE_CHECK && gWater.currentWaterLevel >= 0 && (I(p->qWorldY) - 4) >= gWater.currentWaterLevel) {
        if (!(p->moveState & MOVESTATE_IN_WATER)) {
            p->moveState |= MOVESTATE_IN_WATER;
            p->moveState |= MOVESTATE_1000;

            p->qSpeedAirX = p->qSpeedAirX >> 1;
            p->qSpeedAirY = p->qSpeedAirY >> 2;
            if ((p->character != CHARACTER_KNUCKLES || p->SA2_LABEL(unk61) != 9) && p->framesUntilWaterSurfaceEffect < 1) {
                p->framesUntilWaterSurfaceEffect = 10;
                CreateWaterfallSurfaceHitEffect(I(p->qWorldX), gWater.currentWaterLevel);
                m4aSongNumStart(SE_WATERFALL_SURFACE_HIT);
            }
        }

#if (GAME == GAME_SA1)
        if (!(p->moveState & MOVESTATE_2000)) {
            p->maxSpeed = Q(2.25);
            p->acceleration = Q(4. / 256.);
            p->deceleration = Q(48. / 256.);
        } else {
            p->maxSpeed = Q(3.75);
            p->acceleration = Q(18. / 256.);
            p->deceleration = Q(96. / 256.);
        }
#endif

        if (--p->framesUntilDrownCountDecrement < 1) {
            switch (p->secondsUntilDrown--) {
                case 11:
                    if (p->playerID == 0) {
                        gMusicManagerState.unk4 = 16;
                    }
                    break;
                case 12:
                    SpawnDrowningCountdownNum(p, 5);
                    break;
                case 10:
                    SpawnDrowningCountdownNum(p, 4);
                    break;
                case 8:
                    SpawnDrowningCountdownNum(p, 3);
                    break;
                case 6:
                    SpawnDrowningCountdownNum(p, 2);
                    break;
                case 4:
                    SpawnDrowningCountdownNum(p, 1);
                    break;
                case 2:
                    SpawnDrowningCountdownNum(p, 0);
                    break;
            }
            if (p->secondsUntilDrown < 0) {
                p->moveState |= MOVESTATE_DEAD;
                p->qSpeedAirY = 0;
                SpawnAirBubbles(p->qWorldX, p->qWorldY - Q(12), 0, 1);
                SpawnBubblesAfterDrowning(p);
            }
            p->framesUntilDrownCountDecrement = 60;
        }
        if (!(gStageTime % 16u) && !(PseudoRandom32() & 0x300)) {
            s32 qDX = ((p->moveState & MOVESTATE_FACING_LEFT) ? -Q(4) : +Q(4));
            SpawnAirBubbles(p->qWorldX + qDX, p->qWorldY - Q(4), 0, 0);
        }
    } else {
        if (p->moveState & MOVESTATE_IN_WATER) {
            p->moveState &= ~MOVESTATE_IN_WATER;
            p->moveState |= MOVESTATE_1000;
            p->qSpeedAirY = p->qSpeedAirY << 1;

            if ((p->character != CHARACTER_KNUCKLES || p->SA2_LABEL(unk61) != 9) && p->framesUntilWaterSurfaceEffect < 1) {
                p->framesUntilWaterSurfaceEffect = 10;
                CreateWaterfallSurfaceHitEffect(I(p->qWorldX), gWater.currentWaterLevel);
                m4aSongNumStart(SE_WATERFALL_SURFACE_HIT);
            }
        }
#if (GAME == GAME_SA1)
        if (!(p->moveState & MOVESTATE_2000)) {
            p->maxSpeed = Q(4.50);
            p->acceleration = Q(8. / 256.);
            p->deceleration = Q(96. / 256.);
        } else {
            p->maxSpeed = Q(7.50);
            p->acceleration = Q(36. / 256.);
            p->deceleration = Q(192. / 256.);
        }
#endif
        p->framesUntilDrownCountDecrement = 60;
        p->secondsUntilDrown = 30;

#if (GAME == GAME_SA1)
        if (p->playerID == 0) {
            m4aSongNumStop(MUS_DROWNING);
        }
#else
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_DROWNING].header && p->playerID == 0) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
#endif
    }

    if (p->itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) {
#if (GAME == GAME_SA1)
        p->maxSpeed = p->maxSpeed * 2;
        p->acceleration = p->acceleration * 2;
        p->deceleration = p->deceleration * 2;
#else
        p->acceleration = p->acceleration * 2;
        p->deceleration = p->deceleration * 2;
#endif
    } else if (p->itemEffect & PLAYER_ITEM_EFFECT__MP_SLOW_DOWN) {
        p->maxSpeed = p->maxSpeed >> 2;
        p->acceleration = p->acceleration >> 2;
        p->deceleration = p->deceleration >> 2;
    }

    if (p->framesUntilWaterSurfaceEffect != 0) {
        p->framesUntilWaterSurfaceEffect--;
    }
}
#endif

void Player_HandleSpriteYOffsetChange(Player *p, s32 spriteOffsetY)
{
    u8 rot;
    if (p->spriteOffsetY == spriteOffsetY) {
        return;
    }

    rot = p->rotation;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        rot += Q(1. / 4.);
        rot = -rot;
        rot -= Q(1. / 4.);
    }
#endif

    if ((s32)(rot + Q(1. / 8.)) > 0) {
        if (rot != 0) {
            rot = (rot + Q(1. / 8.)) - 1;
            ;
        } else {
            rot = Q(1. / 8.);
        }
    } else {
        if (rot != 0) {
            rot = (rot + Q(1. / 8.));
        } else {
            rot = Q(1. / 8.) - 1;
        }
    }

    switch ((rot >> 6)) {
        case 0: {
            p->qWorldY -= Q(spriteOffsetY - p->spriteOffsetY);
        } break;

        case 2: {
            p->qWorldY += Q(spriteOffsetY - p->spriteOffsetY);
        } break;

        case 1: {
            p->qWorldX += Q(spriteOffsetY - p->spriteOffsetY);
        } break;

        case 3: {
            p->qWorldX -= Q(spriteOffsetY - p->spriteOffsetY);
        } break;
    }
}

#ifndef COLLECT_RINGS_ROM
// 0x08023C10
void Player_Debug_TestRingScatter(Player *p)
{
    if (p->moveState & MOVESTATE_80000000) {
        s32 qSpeedGround = p->qSpeedGround;
        if (gInput & DPAD_ANY) {
            qSpeedGround += Q(0.125);
            qSpeedGround = qSpeedGround >= Q(0) ? CLAMP(qSpeedGround, Q(0), Q(16)) : Q(0);
        } else {
            qSpeedGround = 0;
        }
        p->qSpeedGround = qSpeedGround;

        switch (gInput & DPAD_SIDEWAYS) {
            case DPAD_LEFT:
                p->qSpeedAirX = -qSpeedGround;
                break;

            case DPAD_RIGHT:
                p->qSpeedAirX = +qSpeedGround;
                break;

            default:
                p->qSpeedAirX = 0;
        }

        switch (gInput & DPAD_VERTICAL) {
            case DPAD_UP:
                p->qSpeedAirY = -qSpeedGround;
                break;

            case DPAD_DOWN:
                p->qSpeedAirY = +qSpeedGround;
                break;

            default:
                p->qSpeedAirY = 0;
        }

        PLAYERFN_UPDATE_POSITION(p);
        sub_80232D0(p);

        if (gPressedKeys & B_BUTTON) {
            InitScatteringRings(I(p->qWorldX), I(p->qWorldY), 1);
        }
    }
}
#endif

void Task_PlayerHandleDeath(void)
{
    player_0_Task *gt = TASK_DATA(gCurTask);
    u32 val = gt->unk4;
    if (val == 0) {
#ifndef COLLECT_RINGS_ROM
        if (IS_SINGLE_PLAYER) {
            TaskDestroy(gCurTask);

            if ((!gLoadedSaveGame->timeLimitDisabled
                 && (gCourseTime > MAX_COURSE_TIME || (gStageFlags & STAGE_FLAG__TIMER_REVERSED && gCourseTime == 0)))
                || ((gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) && gCourseTime > MAX_COURSE_TIME)) {
                HandleDeath();
            } else {
                gRingCount = 0;
                gSpecialRingCount = 0;
                HandleLifeLost();
            }
        } else
#endif
        {

            gRingCount = 0;
#ifndef COLLECT_RINGS_ROM
            if (gGameMode == GAME_MODE_MULTI_PLAYER) {
                gRingCount = 1;
            }
#endif

            gSpecialRingCount = 0;
            InitializePlayer(&gPlayer);
            gCamera.x = I(gPlayer.qWorldX) + gCamera.shiftX - (DISPLAY_WIDTH / 2);
            gCamera.y = I(gPlayer.qWorldY) + gCamera.shiftY - (DISPLAY_HEIGHT / 2);
            m4aMPlayTempoControl(&gMPlayInfo_BGM, 256);
            gPlayer.moveState = 0;
            gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

            gPlayer.spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            gPlayer.spriteInfoLimbs->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoLimbs->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);

            gCamera.unk50 &= ~0x3;
#ifndef COLLECT_RINGS_ROM
            if (gPlayer.character == CHARACTER_CREAM && gCheese != NULL) {
                gCheese->posX = gPlayer.qWorldX;
                gCheese->posY = gPlayer.qWorldY;
            }
#endif

            gCurTask->main = Task_PlayerMain;
            gPlayer.callback = Player_TouchGround;
        }
    } else {
        val--;
        gt->unk4 = val;
    }
}

static inline bool32 DeadPlayerLeftScreen(Player *p, struct Camera *cam, s32 playerY)
{
    if (p->moveState & MOVESTATE_80000000) {
        return FALSE;
    }

#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        if (playerY <= Q(cam->y - 80)) {
            return TRUE;
        }
    } else
#endif
    {
        if (playerY >= Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1) {
            return TRUE;
        }
    }
    return FALSE;
}

void Task_PlayerDied(void)
{
    Player *p = &gPlayer;

    PlayerSpriteInfo *psi1 = gPlayer.spriteInfoBody;
    PlayerSpriteInfo *psi2 = gPlayer.spriteInfoLimbs;

    if (DeadPlayerLeftScreen(&gPlayer, &gCamera, gPlayer.qWorldY)) {
        player_0_Task *gt = TASK_DATA(gCurTask);
        gt->unk4 = ZONE_TIME_TO_INT(0, 1);
        gPlayer.moveState |= MOVESTATE_100000;
        if (IS_MULTI_PLAYER) {
            sub_8024B10(p, psi1);
        }
        gCurTask->main = Task_PlayerHandleDeath;
        return;
    }

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    sub_802486C(p, psi1);
    sub_8024B10(p, psi1);
#ifndef COLLECT_RINGS_ROM
    sub_8024F74(p, psi2);
#endif
}

void Task_PlayerMain(void)
{
    Player *p = &gPlayer;
    Player_HandleBoostThreshold(p);
    Player_HandleBoostState(p);
    Player_ApplyBoostPhysics(p);
    Player_HandleWalkAnim(p);

    gUnknown_030054FC = 0;
    gUnknown_030054E0 = 0;
    Player_HandleInputs(p);
#ifndef COLLECT_RINGS_ROM
    InputBuffer_HandleFrameInput(p);
    Player_HandleWater(p);
#endif
    CallPlayerTransition(p);

    if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        p->callback(p);
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80232D0(p);
    }

    sub_802486C(p, p->spriteInfoBody);
    sub_8024B10(p, p->spriteInfoBody);
#ifndef COLLECT_RINGS_ROM
    sub_8024F74(p, p->spriteInfoLimbs);
#endif

    if (p->charState != CHARSTATE_HIT_AIR && p->timerInvulnerability > 0) {
        p->timerInvulnerability--;
    }
#ifndef COLLECT_RINGS_ROM
    if (p->disableTrickTimer != 0) {
        p->disableTrickTimer--;
    }
#endif

#ifndef COLLECT_RINGS_ROM
    sub_8023748(p);

    // from boost_effect.c
    BoostEffect_StorePlayerPos();
    BoostEffect_StorePlayerState();

    p->moveState &= ~MOVESTATE_ICE_SLIDE;
    gHomingTarget.squarePlayerDistance = SQUARE(128);
    gHomingTarget.angle = 0;
    gCheeseTarget.squarePlayerDistance = SQUARE(CHEESE_DISTANCE_MAX);
    gCheeseTarget.task = NULL;
#endif

    if (p->moveState & MOVESTATE_DEAD) {
        struct Camera *cam = &gCamera;
        gCurTask->main = Task_PlayerDied;
        p->charState = CHARSTATE_DEAD;
        p->qSpeedAirX = 0;

        if (p->qSpeedAirY < -Q(4)) {
            p->qSpeedAirY = -Q(2);
        } else if (p->qSpeedAirY > 0) {
            p->qSpeedAirY = 0;
        }

        p->timerInvulnerability = 2;
        p->itemEffect = 0;
        p->moveState &= ~MOVESTATE_20;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->stoodObj = NULL;
        cam->unk50 |= 3;
#ifndef COLLECT_RINGS_ROM
        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;
        }
#endif

        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        p->unk80 = 0x100;
        p->unk82 = 0x100;
#ifndef COLLECT_RINGS_ROM
        // TODO: macro IS_SONG_PLAYING(...)
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_DROWNING].header) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_INVINCIBILITY].header) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }

        m4aSongNumStop(MUS_DROWNING);

        if (p->character == CHARACTER_TAILS) {
            m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
        }

        if (p->character == CHARACTER_CREAM) {
            m4aSongNumStop(SE_CREAM_FLYING);
        }

        if (p->secondsUntilDrown < 0) {
            m4aSongNumStart(SE_157);
        } else {
            m4aSongNumStart(SE_LIFE_LOST);
        }
#endif
    }
}

void CallPlayerTransition(Player *p)
{
    if (p->transition) {
        switch (p->transition - 1) {
            case PLTRANS_TOUCH_GROUND - 1: {
                PLAYERFN_SET(Player_TouchGround);
            } break;
            case PLTRANS_CORKSCREW_END - 1: {
                PLAYERFN_SET(Player_SpinAttack);
            } break;
            case PLTRANS_INIT_JUMP - 1: {
                p->moveState &= ~(MOVESTATE_IA_OVERRIDE | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(Player_InitJump);
            } break;
#ifndef COLLECT_RINGS_ROM
            case PLTRANS_PT4 - 1: {
                p->moveState &= ~(MOVESTATE_IA_OVERRIDE | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(Player_8025F84);
            } break;
#endif

            case PLTRANS_PT7
                - 1:
#ifndef COLLECT_RINGS_ROM
            {
                PLAYERFN_SET(Player_8028D74);
            } break;
#endif
            case PLTRANS_PT6
                - 1:
#ifndef COLLECT_RINGS_ROM
            {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(Player_8026060);
            } break;
#endif
            case PLTRANS_UNCURL - 1: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(Player_InitUncurl);
            } break;
#ifndef COLLECT_RINGS_ROM
            case PLTRANS_HOMING_ATTACK_RECOIL - 1: {
                PLAYERFN_SET(Player_InitHomingAttackRecoil);
            } break;
#endif
            case PLTRANS_HURT - 1: {
                PLAYERFN_SET(Player_InitHurt);
            } break;
#ifndef COLLECT_RINGS_ROM
            case PLTRANS_REACHED_GOAL - 1: {
                if (gGameMode == GAME_MODE_TIME_ATTACK) {
                    gStageFlags |= STAGE_FLAG__TURN_OFF_TIMER;
                }

                if (p->moveState
                    & (MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_2000 | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) {
                    p->moveState |= (MOVESTATE_GOAL_REACHED | MOVESTATE_IGNORE_INPUT);
                    p->heldInput = 0;
                    p->frameInput = 0;
                } else {
                    p->moveState |= MOVESTATE_GOAL_REACHED;
                    PLAYERFN_SET(Player_InitReachedGoal);
                }
            } break;
#endif
            case PLTRANS_SPRING_UP - 1: {
#ifndef COLLECT_RINGS_ROM
                // NOTE: Set to 0 or 3 in floating_spring.c
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
#endif
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN - 1: {
#ifndef COLLECT_RINGS_ROM
                if (!GRAVITY_IS_INVERTED)
#endif
                {
                    p->unk6E |= 0x10;
                }

                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_LEFT - 1: {
                p->unk6E |= 0x20;
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_RIGHT - 1: {
                p->unk6E |= 0x30;
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_UP_LEFT - 1: {
#ifndef COLLECT_RINGS_ROM
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x60;
                } else
#endif
                {
                    p->unk6E |= 0x40;
                }
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_UP_RIGHT - 1: {
#ifndef COLLECT_RINGS_ROM
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x70;
                } else
#endif
                {
                    p->unk6E |= 0x50;
                }
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN_LEFT - 1: {
#ifndef COLLECT_RINGS_ROM
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x40;
                } else
#endif
                {
                    p->unk6E |= 0x60;
                }
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN_RIGHT - 1: {
#ifndef COLLECT_RINGS_ROM
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x50;
                } else
#endif
                {
                    p->unk6E |= 0x70;
                }
                PLAYERFN_SET(Player_TouchNormalSpring);
            } break;
            case PLTRANS_RAMP_AND_DASHRING - 1: {
                PLAYERFN_SET(Player_InitRampOrDashRing);
            } break;
#ifndef COLLECT_RINGS_ROM
            case PLTRANS_DASHRING - 1: {
                PLAYERFN_SET(Player_InitDashRing);
            } break;
#endif
            case PLTRANS_GRINDING - 1: {
                PLAYERFN_SET(Player_InitGrinding);
            } break;
            case PLTRANS_GRIND_RAIL_END_GROUND - 1: {
                PLAYERFN_SET(Player_InitGrindRailEndGround);
            } break;
            case PLTRANS_GRIND_RAIL_END_AIR - 1: {
                PLAYERFN_SET(Player_GrindRailEndAir);
            } break;
            case PLTRANS_PT23 - 1: {
                PLAYERFN_SET(Player_802A258);
            } break;
#ifndef COLLECT_RINGS_ROM
            case PLTRANS_PIPE_ENTRY - 1: {
                PLAYERFN_SET(Player_InitPipeEntry);
            } break;
            case PLTRANS_PIPE_EXIT - 1: {
                PLAYERFN_SET(Player_InitPipeExit);
            } break;
            case PLTRANS_PROPELLER_SPRING - 1: {
                PLAYERFN_SET(Player_InitPropellorSpring);
            } break;
            case PLTRANS_CORKSCREW - 1: {
                PLAYERFN_SET(Player_InitCorkscrew);
            } break;
#endif
        }
    }

    p->prevTransition = p->transition;
    p->transition = 0;
}

void Player_HandleInputs(Player *p)
{
    u32 input;
    u16 input2;

    if (IS_MULTI_PLAYER && (SIO_MULTI_CNT->id != gCamera.spectatorTarget)) {
        p->heldInput = 0;
        input = 0;
    } else {
        input = p->heldInput;

        if (!(p->moveState & MOVESTATE_IGNORE_INPUT)) {
            p->heldInput = gInput;

            if (IS_MULTI_PLAYER && (p->itemEffect & PLAYER_ITEM_EFFECT__CONFUSION)) {
                u8 dpad = (p->heldInput & DPAD_ANY) >> 4;
                u32 r1 = gStageTime;

                r1 = ((p->confusionTimer + r1) & 0x3);
                if (!r1) {
                    r1 = 1;
                }

                dpad <<= r1;
                dpad = (dpad >> 4) | dpad;
                dpad = (u8)(dpad << 4);

                p->heldInput = (p->heldInput & ~DPAD_ANY) | dpad;

                if (--p->confusionTimer == 0) {
                    p->itemEffect &= ~PLAYER_ITEM_EFFECT__CONFUSION;
                }
            }
        }
    }

    input2 = p->heldInput;
    input ^= input2;
#ifdef NON_MATCHING
    input &= input2;
#else
    asm("and %0, %2" : "=r"(input) : "r"(input), "r"(input2));
#endif
    p->frameInput = input;
}

void sub_80246DC(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    u16 charState = p->charState;
#ifndef COLLECT_RINGS_ROM
    u32 anim = p->anim;
#else
    u16 anim = p->anim;
#endif
    u32 variant = p->variant;
    u32 sl = variant;

#ifndef COLLECT_RINGS_ROM
    AnimId baseAnim = gPlayerCharacterIdleAnims[p->character];
#else
    AnimId baseAnim = gPlayerCharacterIdleAnims[0];
#endif
    anim = (u16)(anim - baseAnim);

    if ((charState == CHARSTATE_JUMP_1) || (charState == CHARSTATE_JUMP_2)) {
        if (p->variant == 0 && (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) && (((u16)anim - 10) == 0 || ((u16)anim - 10) == 1)) {
            p->variant = 1;
            p->moveState |= MOVESTATE_4;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            if ((p->qSpeedAirY > 0) && (p->variant == 1) && ((((u16)anim - 10) == 0) || (((u16)anim - 10) == 1))) {
                s32 newY = sub_801E6D4(I(p->qWorldY) + p->spriteOffsetY, I(p->qWorldX), p->layer, 8, NULL, sub_801EE64);

                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (newY <= 32) {
                        p->variant = 2;
                    }
                }
            }
        }
    } else {
        if (charState == CHARSTATE_SPRING_B) {
            if (anim == SA2_CHAR_ANIM_52) {
                if (variant == 0) {
                    if (p->qSpeedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (p->variant == 1) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        }

        else if (charState == CHARSTATE_SPRING_C) {
            if (anim == SA2_CHAR_ANIM_53) {
                if (sl == 0) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
#ifndef COLLECT_RINGS_ROM
                        p->anim = (gPlayerCharacterIdleAnims[p->character] + SA2_CHAR_ANIM_52);
#else
                        p->anim = (gPlayerCharacterIdleAnims[0] + SA2_CHAR_ANIM_52);
#endif
                        p->variant = 2;
                    }
                }
            }
        }
#ifndef COLLECT_RINGS_ROM
        else if (charState == CHARSTATE_SPRING_MUSIC_PLANT) {
            if (anim == SA2_CHAR_ANIM_SPRING_MUSIC_PLANT) {
                if (variant == 0) {
                    if (p->qSpeedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (variant == 1) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        } else if (charState == CHARSTATE_NOTE_BLOCK) {
            if (anim == SA2_CHAR_ANIM_NOTE_BLOCK) {
                if (variant == 0) {
                    if (p->qSpeedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (sl == 1) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        }
#endif
    }
}

void sub_802486C(Player *p, PlayerSpriteInfo *p2)
{
#ifndef NON_MATCHING
    s32 speed;
    register s32 r0 asm("r0");
#endif
    Sprite *s = &p2->s;

    if ((p->charState != CHARSTATE_INVALID) && (p->charState != p->prevCharState)) {
        p->anim = sCharStateAnimInfo[p->charState][0];

        if (p->charState < CHARSTATE_SHARED_COUNT) {
#ifndef COLLECT_RINGS_ROM
            p->anim += gPlayerCharacterIdleAnims[p->character];
#else
            p->anim += gPlayerCharacterIdleAnims[0];
#endif
        }
        p->variant = sCharStateAnimInfo[p->charState][1];
        p2->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    }
#if !defined(NON_MATCHING) && !defined(COLLECT_RINGS_ROM)
    switch (((u16)(p->charState - 9) << 16) >> 16) {
#else
    switch (p->charState - 9) {
#endif
        case CHARSTATE_WALK_A - 9: {
#ifndef COLLECT_RINGS_ROM
            p->anim = gPlayerCharacterIdleAnims[p->character] + SA2_CHAR_ANIM_WALK;
#else
            p->anim = gPlayerCharacterIdleAnims[0] + SA2_CHAR_ANIM_WALK;
#endif
            p->variant = p->walkAnim;
        } // FALLTHROUGH!!!
#ifndef COLLECT_RINGS_ROM
        case CHARSTATE_WALLRUN_INIT - 9:
        case CHARSTATE_WALLRUN_TO_WALL - 9:
        case CHARSTATE_WALLRUN_ON_WALL
            - 9:
#endif
        {
            PLAYERFN_SET_ANIM_SPEED(p, s);
        } break;
#ifndef COLLECT_RINGS_ROM
        case CHARSTATE_AIR_ATTACK - 9: {
            if (p->character != CHARACTER_CREAM) {
                break;
            }
#ifndef NON_MATCHING
            speed = p->qSpeedGround;
            speed = (speed >> 5) + (speed >> 6);

            speed = ABS(speed);

            if (speed >= SPRITE_ANIM_SPEED(0.5)) {
                if (speed > SPRITE_ANIM_SPEED(8.0)) {
                    speed = SPRITE_ANIM_SPEED(8.0);
                }
            } else {
                speed = SPRITE_ANIM_SPEED(0.5);
            }
            s->animSpeed = speed;
#else
            PLAYERFN_SET_ANIM_SPEED(p, s);
#endif
        } break;

        case CHARSTATE_WINDUP_STICK_UPWARDS - 9:
        case CHARSTATE_WINDUP_STICK_DOWNWARDS - 9: {
#ifndef NON_MATCHING
            r0 = p->qSpeedAirY;
            goto lab;
#else
            s->animSpeed = I(ABS(p->qSpeedAirY)) * 3 + 8;
#endif
        } break;

        case CHARSTATE_WINDUP_STICK_SINGLE_TURN_UP - 9:
        case CHARSTATE_WINDUP_STICK_SINGLE_TURN_DOWN - 9: {
#ifndef NON_MATCHING
            r0 = p->qSpeedGround;
        lab:
            speed = I(ABS(r0)) * 3 + 8;
            s->animSpeed = speed;
#else
            s->animSpeed = I(ABS(p->qSpeedGround)) * 3 + 8;
#endif
        } break;
#endif
    }
#ifndef COLLECT_RINGS_ROM
    if (IS_MULTI_PLAYER)
#endif
    {

        p->unk98 = 0;
    }

    if (p->unk6C || (s->graphics.anim != p->anim) || (s->variant != p->variant)) {
        p->unk6C = FALSE;
        s->graphics.anim = p->anim;
        s->variant = p->variant;
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;

#ifndef COLLECT_RINGS_ROM
        if (IS_MULTI_PLAYER)
#endif
        {
            p->unk98 = 1;
        }
    }

    p->prevCharState = p->charState;
}

void sub_8024B10(Player *p, PlayerSpriteInfo *inPsi)
{
    struct MultiSioData_0_4 *send;
    MultiplayerPlayer *mpp;

    Sprite *s = &inPsi->s;
    PlayerSpriteInfo *psi = inPsi;

    struct Camera *cam = &gCamera;
    s16 camX = cam->x;
    s16 camY = cam->y;

    // required for match
    bool32 cond = ({
        bool32 r2 = s->prevVariant == 0xFF || s->prevAnim == 0xFFFF;
        r2;
    });

    s->x = I(p->qWorldX) - camX;
    s->y = I(p->qWorldY) - camY;

    psi->transform.x = I(p->qWorldX) - camX;
    psi->transform.y = I(p->qWorldY) - camY;

    if (p->charState == CHARSTATE_WALK_A || p->charState == CHARSTATE_GRINDING
#ifndef COLLECT_RINGS_ROM
        || p->charState == CHARSTATE_ICE_SLIDE || p->charState == CHARSTATE_WALK_B
        || (p->charState == CHARSTATE_CREAM_CHAO_ATTACK && p->character == CHARACTER_CREAM)
#endif
    ) {

        psi->transform.rotation = p->rotation << 2;
        s->frameFlags &= ~(SPRITE_FLAG_MASK_X_FLIP | SPRITE_FLAG_MASK_Y_FLIP);
        s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
        s->frameFlags |= p->playerID | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

        MACRO_8024B10_PSI_UPDATE(p, psi);
#ifndef COLLECT_RINGS_ROM
        if (IS_SINGLE_PLAYER) {
            TransformSprite(s, &psi->transform);
        }
#endif
    } else {
        psi->transform.rotation = 0;
        s->frameFlags &= ~(SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE);

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
            s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
            s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
            s->x++;
        }
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            s->frameFlags |= SPRITE_FLAG_MASK_Y_FLIP;
        } else
#endif
        {
            s->frameFlags &= ~SPRITE_FLAG_MASK_Y_FLIP;
        }
        UpdateSpriteAnimation(s);
    }
#ifndef COLLECT_RINGS_ROM
    if (IS_SINGLE_PLAYER) {
        // Draw Player sprite in SP modes
        if (p->moveState & MOVESTATE_DEAD
            || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
            DisplaySprite(s);
        }
#else
    {
#endif
        if (IS_SINGLE_PLAYER) {
            return;
        }
    }

    send = &gMultiSioSend.pat4;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    send->unk0 = 0x5000;
    send->x = I(p->qWorldX) + p->unk7C;
    send->y = I(p->qWorldY);
    send->unk6 = s->graphics.anim;
    send->unkA = p->itemEffect;
    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef COLLECT_RINGS_ROM
        send->unk6 -= gPlayerCharacterIdleAnims[p->character];
#endif
        send->unk6 |= gRingCount << 8;
    }
    send->unkB = s->variant | (p->spriteOffsetY << 4);
    send->unkC = s->animSpeed;
    send->unkD = psi->transform.rotation >> 2;

    if (s->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
        send->unk8 |= 1;
    } else {
        send->unk8 &= ~1;
    }

    if (!(p->moveState & 1)) {
        send->unk8 |= 2;
    } else {
        send->unk8 &= ~2;
    }

#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        send->unk8 |= 8;
    } else
#endif
    {
        send->unk8 &= ~8;
    }

    if (p->moveState & MOVESTATE_DEAD || mpp->unk5C & 1 || p->moveState & MOVESTATE_IN_SCRIPTED || p->timerInvulnerability != 0) {
        send->unk8 |= 4;
    } else {
        send->unk8 &= ~4;
    }

    if (mpp->unk5C & 1) {
        send->unk8 |= 0x100;
    } else {
        send->unk8 &= ~0x100;
    }

    if (p->moveState & MOVESTATE_100000) {
        send->unk8 |= 0x40;
    } else {
        send->unk8 &= ~0x40;
    }

    send->unk8 &= ~0x30;
    send->unk8 |= ((gPlayer.spriteInfoBody->s.frameFlags & 0x3000) >> 8);
    if (p->layer != 0) {
        send->unk8 |= 0x80;
    } else {
        send->unk8 &= ~0x80;
    }

    if (cond) {
        send->unk8 |= 0x800;
    } else {
        send->unk8 &= ~0x800;
    }

    mpp->unk64 = SIO_MULTI_CNT->id;
    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) {
        u8 i;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            s32 id = SIO_MULTI_CNT->id;
            if (id != i) {
                MultiplayerPlayer *mpp2;
                if (gMultiplayerPlayerTasks[i] == NULL) {
                    break;
                }

                mpp2 = TASK_DATA(gMultiplayerPlayerTasks[i]);
                if (gPlayer.stoodObj == &mpp2->s) {
                    mpp->unk64 = i;
                }
            }
        }
    }

    send->unk8 &= ~0x600;
    send->unk8 |= (mpp->unk64 << 9);
}

#ifndef COLLECT_RINGS_ROM
#define MACRO_8024F74_ANIM_CHECK(anim, variant)                                                                                            \
    (((anim == SA2_CHAR_ANIM_JUMP_1 || anim == SA2_CHAR_ANIM_JUMP_2) && variant == 1)                                                      \
     || (anim == SA2_CHAR_ANIM_SPIN_ATTACK && variant == 0) || (anim == SA2_CHAR_ANIM_70 && variant == 0))

void sub_8024F74(Player *p, PlayerSpriteInfo *inPsi)
{
    struct MultiSioData_0_4 *recv;

    Sprite *s = &inPsi->s;
    PlayerSpriteInfo *psi = inPsi;

    struct Camera *cam = &gCamera;
    s16 camX = cam->x;
    s16 camY = cam->y;

    if (IS_MULTI_PLAYER) {
        s32 id = SIO_MULTI_CNT->id;
        recv = &gMultiSioRecv[id].pat4;
        psi->transform.x = recv->x - camX;
        psi->transform.y = recv->y - camY;
    } else {
        psi->transform.x = I(p->qWorldX) - camX;
        psi->transform.y = I(p->qWorldY) - camY;
    }

    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    if (p->moveState & MOVESTATE_IN_WATER) {
        s->animSpeed = 8;
    }

    switch (p->character) {
        case CHARACTER_AMY:
        case CHARACTER_KNUCKLES:
        case CHARACTER_SONIC:
            break;

        case CHARACTER_CREAM: {
            u16 anim = p->anim;
            u16 variant = p->variant;
            anim = anim - gPlayerCharacterIdleAnims[p->character];
            if (MACRO_8024F74_ANIM_CHECK(anim, variant)) {
                u8 rotation = p->rotation;
                p->w.cf.unkB0 = rotation;
                psi->transform.rotation = rotation << 2;
                s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
                s->frameFlags |= gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

                MACRO_8024B10_PSI_UPDATE(p, psi);
                TransformSprite(s, &psi->transform);

                if (p->moveState & MOVESTATE_DEAD
                    || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
                    DisplaySprite(s);
                }
            }
            break;
        }
        case CHARACTER_TAILS: {
            s32 asx = p->qSpeedAirX;
            s32 asy = p->qSpeedAirY;

            u16 anim = p->anim;
            u16 variant = p->variant;
            anim = anim - gPlayerCharacterIdleAnims[p->character];
            if (MACRO_8024F74_ANIM_CHECK(anim, variant)) {
                u8 shift;
                if (asx != 0 || asy != 0) {
                    shift = (I(ArcTan2(asx, asy)) + 0x40);
                } else {
                    shift = p->moveState & MOVESTATE_FACING_LEFT ? 0xC0 : 0x40;
                }
                p->w.tf.shift = shift;

                psi->transform.rotation = shift << 2;
                s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
                s->frameFlags |= gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

                MACRO_8024B10_PSI_UPDATE(p, psi);
                TransformSprite(s, &psi->transform);

                if (p->moveState & MOVESTATE_DEAD
                    || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
                    DisplaySprite(s);
                }
            }
            break;
        }
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
void Player_TouchGround(Player *p)
{
    u32 mask;
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            Player_8025F84(p);
            return;
        }
    }

    mask = (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR);
    if ((p->moveState & mask) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
    } else {
        Player_TransitionCancelFlyingAndBoost(p);

        p->moveState &= ~(MOVESTATE_4 | MOVESTATE_IN_AIR);

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        if (p->qSpeedGround != 0) {
            p->charState = CHARSTATE_WALK_A;
        } else {
            p->charState = CHARSTATE_IDLE;
        }

        PLAYERFN_SET_AND_CALL(Player_Idle, p);
    }
}

// TODO/NAME: Not only used for idling...
void Player_Idle(Player *p)
{
    if ((p->moveState & (MOVESTATE_GOAL_REACHED | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_GOAL_REACHED) {
        Player_InitReachedGoal(p);
    } else if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
    } else if (!Player_TryTaunt(p) && !Player_TryCrouchOrSpinAttack(p) && !Player_TryJump(p) && !Player_TryAttack(p)) {
        Player_HandleGroundMovement(p);

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0) {
                p->qSpeedGround += acceleration;
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
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

void Player_8025548(Player *p)
{
    if (!Player_TryCrouchOrSpinAttack(p) && !Player_TryJump(p)
        && ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || !Player_TryAttack(p))) {
        if (p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
            PLAYERFN_SET(Player_TouchGround);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0)
                p->qSpeedGround += acceleration;
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

void Player_Taunt(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    u16 characterAnim = GET_CHARACTER_ANIM(p);

    if (!Player_TryCrouchOrSpinAttack(p) && !Player_TryJump(p) && !Player_TryAttack(p)) {
        u16 dpad = (p->heldInput & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (p->variant == 0)) {
                p->variant = 1;
                p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            }
        } else if (dpad != DPAD_UP) {
            PLAYERFN_SET(Player_TouchGround);
        }

        if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (p->variant == 1) && (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            PLAYERFN_SET(Player_TouchGround);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0)
                p->qSpeedGround += acceleration;
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

void Player_Crouch(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    u16 characterAnim = GET_CHARACTER_ANIM(p);

    if (!Player_TryInitSpindash(p) && !Player_TryJump(p) && !Player_TryAttack(p)) {
        u16 dpad = (p->heldInput & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (p->variant == 0)) {
                p->variant = 1;
                p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            }
        } else if (dpad != DPAD_DOWN) {
            PLAYERFN_SET(Player_TouchGround);
        }

        if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (p->variant == 1) && (s->frameFlags & 0x4000)) {
            PLAYERFN_SET(Player_TouchGround);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0)
                p->qSpeedGround += acceleration;
        }

        sub_80232D0(p);
        sub_8023260(p);

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

void Player_SpinAttack(Player *p)
{
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if ((p->moveState & MOVESTATE_IN_AIR)) {
            Player_8025F84(p);
            return;
        }
    }

    if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
    } else {
        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->charState = CHARSTATE_SPIN_ATTACK;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_4;
        p->unk99[0] = 0;
        PLAYERFN_SET_AND_CALL(Player_Rolling, p);
    }
}

void Player_Rolling(Player *p)
{
    if ((p->moveState & (MOVESTATE_GOAL_REACHED | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_GOAL_REACHED) {
        Player_InitReachedGoal(p);
    } else if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
    } else {
        if (p->unk99[0] != 0) {
            p->unk99[0]--;
        } else if (!Player_TryJump(p)) {
            if (p->unk2A == 0) {
                u16 dpadSideways = (p->heldInput & (DPAD_LEFT | DPAD_RIGHT));
                if (dpadSideways != DPAD_RIGHT) {
                    if (dpadSideways == DPAD_LEFT) {
                        s32 val = p->qSpeedGround;
                        if (val <= 0) {
                            p->moveState |= MOVESTATE_FACING_LEFT;
                        } else if ((val - Q(0.09375)) < 0) {
                            s32 deceleration = -Q(0.375);
                            p->qSpeedGround = deceleration;
                        } else {
                            p->qSpeedGround = (val - Q(0.09375));
                        }
                    }
                } else {
                    s32 val = p->qSpeedGround;
                    if (val >= 0) {
                        p->moveState &= ~MOVESTATE_FACING_LEFT;
                    } else if ((val + Q(0.09375)) > 0) {
                        p->qSpeedGround = Q(0.375);
                    } else {
                        p->qSpeedGround = (val + Q(0.09375));
                    }
                }
            }
        } else {
            return;
        }

        if (p->qSpeedGround > 0) {
            p->rollingDeceleration = 8;
        } else if (p->qSpeedGround < 0) {
            p->rollingDeceleration = -8;
        } else {
            p->rollingDeceleration = 0;
        }

        p->qSpeedGround -= p->rollingDeceleration;

        if ((p->qSpeedGround > -Q(0.5)) && (p->qSpeedGround < Q(0.5))) {
            p->rollingDeceleration = 0;
            p->qSpeedGround = 0;
        }

        if (p->qSpeedGround == 0) {
            PLAYERFN_SET_AND_CALL(Player_TouchGround, p);
        } else {
            s32 speedX = p->qSpeedGround;

            if ((((p->rotation + Q(0.375)) & 0xFF) < 0xC0) && (speedX != 0)) {
                u32 sinVal = SIN_24_8((p->rotation) * 4) * 60;
                s32 sinInt = (s32)(I((s32)sinVal));

                if (speedX > 0) {
                    if (sinInt <= 0) {
                        sinInt >>= 2;
                    }
                } else if (sinInt >= 0) {
                    sinInt >>= 2;
                }

                speedX += sinInt;

                p->qSpeedGround = speedX;
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
                PLAYERFN_SET(Player_Jumping);
            }
        }
    }
}

void Player_InitJump(Player *p)
{
    u8 rot;
    s32 jumpHeight;
    s32 accelX, accelY;

    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if (p->moveState & MOVESTATE_4) {
        p->moveState |= MOVESTATE_FLIP_WITH_MOVE_DIR;
    }

    if (ABS(p->qSpeedAirX) < Q(1.25)) {
        p->charState = CHARSTATE_JUMP_1;
    } else {
        p->charState = CHARSTATE_JUMP_2;
    }

    p->unk70 = TRUE;

    jumpHeight = (p->moveState & MOVESTATE_IN_WATER) ? Q(PLAYER_JUMP_HEIGHT_UNDER_WATER) : Q(PLAYER_JUMP_HEIGHT);

    rot = p->rotation - 64;

    accelX = I(COS_24_8(rot * 4) * jumpHeight);
    p->qSpeedAirX += accelX;

    accelY = I(SIN_24_8(rot * 4) * jumpHeight);
    p->qSpeedAirY += accelY;

    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->qSpeedAirX -= Q(gCamera.dx);
        }
    }

    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(Player_Jumping, p);
}

void Player_Jumping(Player *p)
{
    s16 maxJumpSpeed = -Q(PLAYER_MAX_NOT_HELD_JUMP_FORCE);

    if (p->moveState & MOVESTATE_IN_WATER) {
        maxJumpSpeed = -Q(PLAYER_MAX_NOT_HELD_JUMP_FORCE_UNDER_WATER);
    }

    if (p->moveState & MOVESTATE_100) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            if (Player_Sonic_TryForwardThrust(p) || Player_TryMidAirAction(p))
                return;

        // Caps the jump force if the player lets go of the jump button
        if (p->qSpeedAirY < maxJumpSpeed && !(p->heldInput & gPlayerControls.jump)) {
            p->qSpeedAirY = maxJumpSpeed;
        }
    }

    sub_80246DC(p);
    Player_AirInputControls(p);

    if (!IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80236C8(p);
    }

    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_8025F84(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->spriteOffsetX < 6) || (p->spriteOffsetY < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1) || (chAnim == SA2_CHAR_ANIM_JUMP_2)
            || (chAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    if (ABS(p->qSpeedAirX) < Q(1.25)) {
        p->charState = CHARSTATE_JUMP_1;
    } else {
        p->charState = CHARSTATE_JUMP_2;
    }

    p->unk70 = TRUE;

    p->spriteInfoBody->s.frameFlags &= ~MOVESTATE_4000;
    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(Player_Jumping, p);
}

void Player_8026060(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->spriteOffsetX < 6) || (p->spriteOffsetY < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1) || (chAnim == SA2_CHAR_ANIM_JUMP_2)
            || (chAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    p->unk70 = TRUE;
    p->unk6E = 1;

    p->spriteInfoBody->s.frameFlags &= ~MOVESTATE_4000;

    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(Player_Uncurl, p);
}

void Player_InitUncurl(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->spriteOffsetX < 6) || (p->spriteOffsetY < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1) || (chAnim == SA2_CHAR_ANIM_JUMP_2)
            || (chAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    p->unk70 = TRUE;
    p->unk6E = 0;

    p->spriteInfoBody->s.frameFlags &= ~MOVESTATE_4000;

    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(Player_Uncurl, p);
}

void Player_Uncurl(Player *p)
{
    sub_80246DC(p);

    if ((p->unk6E != 1) || (p->qSpeedAirY > 0)) {
        Player_AirInputControls(p);

        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->moveState & MOVESTATE_100)) {
            if (Player_Sonic_TryForwardThrust(p) || Player_TryMidAirAction(p))
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

void Player_InitSpindash(Player *p)
{
    p->charState = CHARSTATE_SPIN_DASH;

    p->moveState |= (MOVESTATE_400 | MOVESTATE_4);
    p->moveState &= ~(MOVESTATE_20 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->spindashAccel = 0;
    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
    p->qSpeedGround = 0;

    m4aSongNumStart(SE_SPIN_ATTACK);
    CreateSpindashDustEffect();

    PLAYERFN_SET_AND_CALL(Player_Spindash, p);
}

void Player_Spindash(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    u16 cAnim = GET_CHARACTER_ANIM(p);

    if (!(p->heldInput & DPAD_DOWN)) {
        s16 index;
        s32 speed;
        p->moveState &= ~MOVESTATE_400;

        index = I(p->spindashAccel);
        if (index > 8)
            index = 8;

        speed = sSpinDashSpeeds[index];
        if (p->moveState & MOVESTATE_FACING_LEFT)
            speed = -sSpinDashSpeeds[index];

        p->qSpeedGround = speed;

        gPlayer.callback = Player_SpinAttack;

        m4aSongNumStart(SE_SPIN_DASH_RELEASE);
    } else {
        s16 pitch = p->spindashAccel;

        s16 pitch2 = pitch;
        if (pitch2 != 0) {
            pitch = pitch2 - (I(pitch << 3));
            if (pitch <= 0)
                pitch = 0;
        }

        if (p->frameInput & gPlayerControls.jump) {
            struct MP2KPlayerState *mPlayerInfo;
            m4aSongNumStart(SE_SPIN_ATTACK);

            mPlayerInfo = gMPlayTable[gSongTable[SE_SPIN_ATTACK].ms].info;
            m4aMPlayImmInit(mPlayerInfo);
            m4aMPlayPitchControl(mPlayerInfo, 0xFFFF, (pitch & ~0x7F));

            pitch += Q(2.0);
            pitch = MAX(pitch, Q(8.0));

            p->variant = 1;
            p->unk6C = TRUE;
        }
        p->spindashAccel = pitch;

        if ((cAnim == SA2_CHAR_ANIM_SPIN_DASH) && (p->variant == 1) && (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            p->variant = 0;
        }
    }

    if (p->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(p);
        sub_80232D0(p);

        if (p->moveState & MOVESTATE_IN_WATER) {
            p->qSpeedAirY += Q(PLAYER_GRAVITY_UNDER_WATER);
        } else {
            p->qSpeedAirY += Q(PLAYER_GRAVITY);
        }

        p->qWorldX += p->qSpeedAirX;

        if ((gStageFlags ^ gUnknown_0300544C) & STAGE_FLAG__GRAVITY_INVERTED) {
            p->qSpeedAirY = -p->qSpeedAirY;
        }

        p->qSpeedAirY = MIN(p->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX));

        p->qWorldY = GRAVITY_IS_INVERTED ? p->qWorldY - p->qSpeedAirY : p->qWorldY + p->qSpeedAirY;

        {
            s32 rot = (s8)p->rotation;
            if (rot < 0) {
                rot = MIN((rot + 2), 0);
            } else if (rot > 0) {
                rot = MAX((rot - 2), 0);
            }
            p->rotation = rot;
        }

        sub_8022190(p);

        if ((p->moveState & (MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_STOOD_ON_OBJ) {
            gPlayer.callback = Player_TouchGround;
            p->qSpeedGround = p->qSpeedAirX;
            p->rotation = 0;
        }
    } else {
        s32 groundSpeed = p->qSpeedGround;

        if ((((p->rotation + Q(0.375)) & 0xFF) < 0xC0) && (groundSpeed != 0)) {
            u32 sinVal = SIN_24_8((p->rotation) * 4) * 60;
            s32 sinInt = (s32)(I((s32)sinVal));

            if (groundSpeed > 0) {
                if (sinInt <= 0) {
                    sinInt >>= 2;
                }
            } else if (sinInt >= 0) {
                sinInt >>= 2;
            }

            groundSpeed += sinInt;

            p->qSpeedGround = groundSpeed;
        }

        sub_80232D0(p);
        sub_8023260(p);
        sub_8023128(p);

        p->qWorldX += p->qSpeedAirX;

        if ((gStageFlags ^ gUnknown_0300544C) & STAGE_FLAG__GRAVITY_INVERTED) {
            p->qSpeedAirY = -p->qSpeedAirY;
        }

        p->qSpeedAirY = MIN(p->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX));

        p->qWorldY = GRAVITY_IS_INVERTED ? p->qWorldY - p->qSpeedAirY : p->qWorldY + p->qSpeedAirY;

        sub_8022D6C(p);

        if (p->unk2A) {
            p->unk2A -= 1;
        } else if ((p->rotation + 32) & 0xC0) {
            s32 absGroundSpeed = ABS(p->qSpeedGround);
            if (absGroundSpeed < Q(1.875)) {
                p->qSpeedGround = 0;

                p->moveState |= MOVESTATE_IN_AIR;
                p->unk2A = GBA_FRAMES_PER_SECOND / 2;
            }
        }
    }
}

void InitPlayerGrindGraphics(Player *p)
{
    s32 newY;
    p->layer = 0;
    p->rotation = 0;

    p->spriteInfoBody->s.frameFlags &= ~(MOVESTATE_2000 | MOVESTATE_1000);
    p->spriteInfoBody->s.frameFlags |= MOVESTATE_1000;

    p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

    if (GRAVITY_IS_INVERTED) {
        newY = sub_801E6D4(I(p->qWorldY) - p->spriteOffsetY, I(p->qWorldX), p->layer, -8, NULL, sub_801EE64);

        newY = p->qWorldY - Q(newY);
    } else {
        newY = sub_801E6D4(I(p->qWorldY) + p->spriteOffsetY, I(p->qWorldX), p->layer, 8, NULL, sub_801EE64);

        newY = p->qWorldY + Q(newY);
    }
    p->qWorldY = newY;
    p->moveState &= ~MOVESTATE_IN_AIR;

    gPlayer.moveState |= MOVESTATE_IN_SCRIPTED;
}

void Player_InitGrinding(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState |= MOVESTATE_1000000;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_GRINDING;

    if (p->unk6E != 0) {
        p->moveState |= MOVESTATE_FACING_LEFT;

        p->qSpeedAirX = MIN(p->qSpeedAirX, -Q(1.0));
        p->qSpeedGround = MIN(p->qSpeedAirX, -Q(1.0));
    } else {
        p->moveState &= ~MOVESTATE_FACING_LEFT;

        p->qSpeedAirX = MAX(p->qSpeedAirX, Q(1.0));
        p->qSpeedGround = MAX(p->qSpeedAirX, Q(1.0));
    }

    InitPlayerGrindGraphics(p);
    m4aSongNumStart(SE_GRINDING);

    PLAYERFN_SET_AND_CALL(Player_DoGrinding, p);
}

void Player_DoGrinding(Player *p)
{
    if (Player_TryJump(p)) {
        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
        p->layer = 1;

        gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
        m4aSongNumStop(SE_GRINDING);
    } else {
        if (p->qSpeedGround >= 0) {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        } else {
            p->moveState |= MOVESTATE_FACING_LEFT;
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0)
            p->qSpeedGround += GET_ROTATED_ACCEL_2(p->rotation);

        sub_80232D0(p);
        sub_8023260(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }

        PLAYERFN_UPDATE_POSITION(p);

        sub_8022D6C(p);

        m4aSongNumStartOrContinue(SE_GRINDING);

        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_FALLING_VULNERABLE_B;

            p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
            p->layer = 1;

            gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
            m4aSongNumStop(SE_GRINDING);
            PLAYERFN_SET(Player_Jumping);
        } else if (IS_SINGLE_PLAYER) {
            CreateGrindEffect2();
        }
    }
}

void Player_InitGrindRailEndGround(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_WALK_A;

    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    p->layer = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);
    PLAYERFN_SET_AND_CALL(Player_Idle, p);
}

void Player_GrindRailEndAir(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->heldInput & gPlayerControls.jump)
        && (p->character == CHARACTER_SONIC || p->character == CHARACTER_AMY)) {
        p->charState = CHARSTATE_GRINDING_SONIC_AMY_JUMP_OFF;
        p->qSpeedAirY = -Q(7.5);
    } else {
        p->charState = CHARSTATE_SPRING_C;
        p->qSpeedAirY = -Q(4.875);
    }

    if (p->moveState & MOVESTATE_IN_WATER)
        p->qSpeedAirY /= 2;

    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    p->layer = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);

    if (p->qSpeedAirX > 0) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    if (p->qSpeedAirX < 0) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    m4aSongNumStart(SE_JUMP);
    PLAYERFN_SET_AND_CALL(Player_8029074, p);
}

void sub_8026B64(Player *p)
{
    s16 groundSpeed = p->qSpeedGround;

    if ((p->unk2A == 0) && (p->heldInput & (DPAD_LEFT | DPAD_RIGHT))) {
        if ((p->heldInput & DPAD_RIGHT) && (groundSpeed < p->topSpeed)) {
            groundSpeed += Q(1.0 / 32.0);
        } else if ((p->heldInput & DPAD_LEFT) && (groundSpeed > Q(1.0))) {
            groundSpeed -= Q(1.0 / 32.0);
        }
    }

    if (groundSpeed < Q(1.0)) {
        groundSpeed += Q(1.0 / 32.0);
    }

    p->qSpeedGround = groundSpeed;
}

void Player_8026BCC(Player *p)
{
    if (!Player_TryJump(p)) {
        sub_8026B64(p);
        sub_8023128(p);

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            s32 accel = GET_ROTATED_ACCEL(p->rotation);
            if (p->qSpeedGround)
                p->qSpeedGround += accel;
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
            p->charState = CHARSTATE_FALLING_VULNERABLE_B;

            PLAYERFN_SET(Player_Jumping);
        } else if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ)) != MOVESTATE_ICE_SLIDE) {
            PLAYERFN_SET(Player_TouchGround);
        }
    }
}

void Player_8026D2C(Player *p)
{
    sub_80246DC(p);
    Player_AirInputControls(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);

    sub_802A500_inline(p);

    PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p);
}

void Player_InitPipeEntry(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->rotation = 0;
    p->charState = CHARSTATE_SPIN_ATTACK;

    p->moveState &= ~MOVESTATE_FACING_LEFT;

    switch (p->unk6E & 0x30) {
        case 0x00: {
            p->moveState |= MOVESTATE_IN_AIR;
            p->qSpeedAirX = 0;
            p->qSpeedAirY = -Q(12.0);
            p->qSpeedGround = Q(12.0);
        } break;

        case 0x10: {
            p->moveState |= MOVESTATE_IN_AIR;
            p->qSpeedAirX = 0;
            p->qSpeedAirY = Q(12.0);
            p->qSpeedGround = Q(12.0);
        } break;

        case 0x20: {
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->moveState |= MOVESTATE_FACING_LEFT;
            p->qSpeedAirX = -Q(12.0);
            p->qSpeedAirY = 0;
            p->qSpeedGround = -Q(12.0);
        } break;

        case 0x30: {
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->qSpeedAirX = Q(12.0);
            p->qSpeedAirY = 0;
            p->qSpeedGround = Q(12.0);
        } break;
    }

    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
    p->layer = 0;

    m4aSongNumStart(SE_SPIN);

    PLAYERFN_SET_AND_CALL(PlayerFn_Cmd_HandlePhysics, p);
}

void Player_InitPipeExit(Player *p)
{
    if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide_inline(p);
    } else {
        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->charState = CHARSTATE_SPIN_ATTACK;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_4;

        p->unk99[0] = 30;

        PLAYERFN_SET_AND_CALL(Player_Rolling, p);
    }
}

void Player_InitPropellorSpring(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if (p->heldInput & DPAD_LEFT) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }
    if (p->heldInput & DPAD_RIGHT) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    p->charState = CHARSTATE_WALK_B;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(Player_PropellorSpring, p);
}

void Player_PropellorSpring(Player *p)
{
    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->rotation -= Q(4.0 / 256.0);
    } else {
        p->rotation += Q(4.0 / 256.0);
    }

    Player_AirInputControls(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_InitCorkscrew(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    if ((!(p->moveState & MOVESTATE_4) || (p->charState != CHARSTATE_SPIN_ATTACK))) {
        p->charState = CHARSTATE_IN_CORKSCREW;
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->rotation = 0;

    if (p->qSpeedAirX > 0) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    } else {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    PLAYERFN_SET_AND_CALL(Player_Corkscrew, p);
}

void Player_Corkscrew(Player *p)
{
    s32 acc = p->acceleration;
    s32 maxSpeed = p->maxSpeed;
    s16 speed = p->qSpeedGround;

    if (p->heldInput & DPAD_LEFT) {
        speed -= acc;

        if (speed < -maxSpeed) {
            speed += acc;

            if (speed > -maxSpeed)
                speed = -maxSpeed;
        }
    } else if (p->heldInput & DPAD_RIGHT) {
        speed += acc;

        if (speed > +maxSpeed) {
            speed -= acc;

            if (speed < +maxSpeed)
                speed = +maxSpeed;
        }
    } else if (speed > 0) {
        speed -= Q(8.0 / 256.0);
    } else {
        speed += Q(8.0 / 256.0);
    }
    p->qSpeedGround = speed;

    sub_80232D0(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void Player_InitHurt(Player *p)
{
    p->timerInvulnerability = 0x78;
    p->isBoosting = FALSE;

    if (ABS(p->qSpeedAirX) <= Q(2.5)) {
        if (p->qSpeedAirX <= Q(0.625)) {
            if (p->qSpeedAirX < -Q(0.625)) {
                p->qSpeedAirX = +Q(1.5);
            } else {
                if ((p->moveState & MOVESTATE_FACING_LEFT)) {
                    p->qSpeedAirX = +Q(1.5);
                } else {
                    p->qSpeedAirX = -Q(1.5);
                }
            }
        } else {
            p->qSpeedAirX = -Q(1.5);
        }
        p->charState = CHARSTATE_HIT_AIR;
    } else {
        if (p->qSpeedAirX >= 0) {
            p->qSpeedAirX = +Q(1.5);
        } else {
            p->qSpeedAirX = -Q(1.5);
        }
        p->charState = CHARSTATE_HIT_STUNNED;
    }

    p->qSpeedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_IN_WATER) {
        p->qSpeedAirY >>= 1;
        p->qSpeedAirX >>= 1;
    }

    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_200 | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(Player_Hurt, p);
}

void Player_Hurt(Player *p)
{
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_InitReachedGoal(Player *p)
{
    if (IS_MULTI_PLAYER) {
        Player_InitReachedGoalMultiplayer(p);
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        Player_InitKilledBoss(p);
    } else {
        if (gGameMode == GAME_MODE_TIME_ATTACK)
            gSpecialRingCount = SPECIAL_STAGE_REQUIRED_SP_RING_COUNT;

        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            Player_InitSpecialStageTransition(p);
        } else {
            Player_TransitionCancelFlyingAndBoost(p);

            p->moveState &= ~(MOVESTATE_4 | MOVESTATE_FACING_LEFT);

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

            if (p->qSpeedGround <= 0) {
                Player_InitVictoryPoseTransition(p);
            } else {
                p->charState = CHARSTATE_WALK_A;

                p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

                p->moveState &= ~MOVESTATE_IGNORE_INPUT;

                PLAYERFN_SET_AND_CALL(Player_GoalSlowdown, p);
            }
        }
    }
}

void Player_GoalSlowdown(Player *p)
{
    u32 playerX = I(p->qWorldX);
    u16 playerX2;

    playerX2 = playerX - gStageGoalX;

    if (((p->qSpeedGround >= Q(2.0)) && (p->frameInput & DPAD_LEFT)) || (playerX2 > 0x579)) {
        p->charState = CHARSTATE_GOAL_BRAKE_A;

        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

        m4aSongNumStart(SE_LONG_BRAKE);
        PLAYERFN_SET_AND_CALL(Player_GoalBrake, p);
    } else {
        s32 grnd = p->qSpeedGround;
        if (grnd > 0) {
            s32 speedOg = p->qSpeedGround - Q(8.0 / 256.0);
            s16 speed = speedOg;
            if (speed <= 0)
                speed = 0;

            p->qSpeedGround = speed;
        } else {
            p->qSpeedGround = 0;
        }

        if (p->qSpeedGround <= 0) {
            Player_InitVictoryPoseTransition(p);
        } else {
            Player_CameraShift_inline(p);

            sub_80232D0(p);
            sub_8023260(p);

            PLAYERFN_UPDATE_POSITION(p);

            sub_8022D6C(p);

            PLAYERFN_UPDATE_UNK2A(p);
        }
    }
}

void Player_GoalBrake(Player *p)
{
    AnimId cAnim = GET_CHARACTER_ANIM(p);

    Player_CameraShift_inline(p);

    if (cAnim == SA2_CHAR_ANIM_GOAL_BRAKE) {
        if ((p->variant == 0) && (p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            p->charState = CHARSTATE_GOAL_BRAKE_B;
        }

        if ((p->variant == 1) && (p->qSpeedGround <= 0)) {
            p->charState = CHARSTATE_GOAL_BRAKE_C;
            p->qSpeedGround = 0;
            m4aSongNumStop(SE_LONG_BRAKE);

            if (gStageGoalX != 0) {
                u16 playerX = I(p->qWorldX) - gStageGoalX;
                s32 r8 = 0;

                if (playerX <= 730)
                    r8 = 800;
                else if (playerX <= 1114)
                    r8 = 500;
                else if (playerX <= 1401)
                    r8 = 100;

                if (r8 != 0) {
                    INCREMENT_SCORE(r8);

                    CreateStageGoalBonusPointsAnim(I(p->qWorldX), I(p->qWorldY), r8);
                }
            }
        }

        if ((p->variant == 2) && (p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            Player_InitVictoryPoseTransition(p);
            return;
        }
    }

    p->qSpeedGround -= Q(0.125);
    if (p->qSpeedGround < 0)
        p->qSpeedGround = 0;

    sub_8029FA4(p);
    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void Player_InitVictoryPoseTransition(Player *p)
{
    Player_CameraShift_inline(p);

    p->unk72 = ZONE_TIME_TO_INT(0, 1.5);

    if (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        switch (gCurrentLevel & 0x3) {
            case ACT_1: {
                p->charState = CHARSTATE_ACT_CLEAR_A;
                PLAYERFN_SET(Player_VictoryPose);
            } break;

            case ACT_2: {
                p->charState = CHARSTATE_ACT_CLEAR_B;
                PLAYERFN_SET(Player_VictoryPose);
            } break;

            case ACT_BOSS: {
                p->charState = CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS;
            } break;
        }
    } else {
        p->charState = CHARSTATE_ACT_CLEAR_A;
    }
}

void Player_VictoryPose(Player *p)
{
    Player_CameraShift_inline(p);

    if (--p->unk72 == 0) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
        } else {
            CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
        }
        PLAYERFN_SET(Player_CameraShift);
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void Player_80279F8(Player *p)
{
    if (p->qSpeedGround > Q(5.5)) {
        p->qSpeedGround -= Q(0.5);
    } else if (p->qSpeedAirX < Q(4.75)) {
        p->qSpeedGround += Q(0.25);
    } else {
        p->qSpeedGround = Q(5.0);
    }

    if (p->unk72 < INT16_MAX)
        p->unk72++;

    if (p->unk72 == 120) {
        p->charState = CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS;
    }

    if (p->unk72 == 180) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
        } else {
            CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
        }
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);

    Player_CameraShift_inline(p);

    if (p->moveState & MOVESTATE_4000000) {
        p->isBoosting = TRUE;
        p->heldInput = DPAD_RIGHT;
        p->qSpeedGround = Q(10.0);
        p->charState = CHARSTATE_WALK_A;
        CreateBoostEffectTasks();

        PLAYERFN_SET(Player_8027B98);

        m4aSongNumStart(SE_273);
    }
}

void Player_8027B98(Player *p)
{
    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);

    gCamera.unk8 -= 56;
}

void Player_8027C5C(Player *p)
{
    // TODO: Maybe this is actually to be considered the p's
    //       x-position relative to a sprite region?
    s32 playerX = I(p->qWorldX) - gCamera.x;

    if (playerX > (DISPLAY_WIDTH / 2)) {
        p->qSpeedGround = Q(4.5);
    } else if (playerX < (DISPLAY_WIDTH / 2)) {
        p->qSpeedGround = Q(5.5);
    } else {
        p->qSpeedGround = Q(5.0);
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

// Multiplayer-only
void Player_8027D3C(Player *p)
{
    s8 *someSio = gUnknown_030054B4;
    s32 sioDat = ((REG_SIOCNT_32 << 26) >> 30);
    u16 r8 = someSio[sioDat];
    s32 *pCmpX = &gStageGoalX;
    u32 cmpX;
    s32 index = (0x40 + (r8 * 32));

    cmpX = Q(*pCmpX + index);
    if (p->qWorldX < cmpX) {
        p->heldInput = DPAD_RIGHT;
    } else if (p->qWorldX > cmpX) {
        p->heldInput = DPAD_LEFT;
    } else {
        p->heldInput = 0;
    }

    Player_HandleGroundMovement(p);
    if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
        s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

        if (p->qSpeedGround != 0) {
            p->qSpeedGround += acceleration;
        }
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);

    if (((p->qWorldX > cmpX) && (p->heldInput == DPAD_RIGHT)) // fmt
        || ((p->qWorldX < cmpX) && (p->heldInput == DPAD_LEFT)) //
        || (p->qWorldX == cmpX)) {
        p->isBoosting = FALSE;
        p->qSpeedAirX = 0;
        p->qSpeedAirY = 0;
        p->qSpeedGround = 0;
        p->qWorldX = cmpX;

        // TODO: Check correctness of MULTI_SIO_PLAYERS_MAX being here!
        if (r8 < MULTI_SIO_PLAYERS_MAX) {
            p->charState = CHARSTATE_ACT_CLEAR_A;
        } else {
            p->charState = CHARSTATE_IDLE;
        }

        p->moveState &= ~MOVESTATE_FACING_LEFT;
        p->unk72 = 0;
        p->heldInput = 0;

        PLAYERFN_SET(Player_Nop);
    }
}

// Generic function for movement and collision, has aerial input, used in character aerial/landing states
void Player_HandlePhysicsWithAirInput(Player *p)
{
    if (p->moveState & MOVESTATE_IN_AIR) {
        Player_AirInputControls(p);
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

// Generic function for movement and collision that doesn't allow player influence
void Player_HandlePhysics(Player *p)
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
    Player_AirInputControls(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void sub_80282EC(Player *p)
{
    p->acceleration >>= 1;

    Player_AirInputControls(p);

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
        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0) {
                p->qSpeedGround += acceleration;
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

struct Task *sub_8028640(s32 x, s32 y, s32 p2)
{
    struct Task *t;
    MultiplayerSpriteTask *taskStrc;
    Sprite *s;

    u16 p2_ = p2;

    t = CreateMultiplayerSpriteTask(x, y, 232, gPlayer.playerID, Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);

    taskStrc = TASK_DATA(t);
    taskStrc->playerAnim = gPlayer.anim;
    taskStrc->playerVariant = gPlayer.variant;

    s = &taskStrc->s;
    s->graphics.dest = VramMalloc(gUnknown_080D69A6[p2_][0]);
    s->graphics.anim = gUnknown_080D69A6[p2_][1];
    s->variant = gUnknown_080D69A6[p2_][2];
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void Player_InitDefaultTrick(Player *p)
{
    u32 dir = p->trickDir;
    u16 character = p->character;
    u8 mask = sTrickMasks[dir][character];

    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_2000 | MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if (mask & MASK_80D6992_4)
        p->unk72 = 10;
    else if (mask & MASK_80D6992_8)
        p->unk72 = 45;

#if !DISABLE_TRICK_AIR_WAIT
    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
#endif

    p->charState = sTrickDirToCharstate[dir];
    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    m4aSongNumStart(SE_JUMP);
    m4aSongNumStart(SE_TAILS_CREAM_STOP_N_SLAM);

    PLAYERFN_SET_AND_CALL(Player_WindupDefaultTrick, p);
}

void Player_WindupDefaultTrick(Player *p)
{
    if (p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        u32 dir = p->trickDir;
        u16 character = p->character;
        p->variant++;

        p->qSpeedAirX = sTrickAccel[dir][character][0];
        p->qSpeedAirY = sTrickAccel[dir][character][1];

        if (p->moveState & MOVESTATE_FACING_LEFT)
            p->qSpeedAirX = -p->qSpeedAirX;

        PLAYERFN_SET(Player_DefaultTrick);

        if (IS_SINGLE_PLAYER) {
            if (dir == TRICK_DIR_FORWARD && character == CHARACTER_SONIC) {
                sub_8028640(I(p->qWorldX), I(p->qWorldY), 0);
            }
            if (dir == TRICK_DIR_UP && character == CHARACTER_KNUCKLES) {
                sub_8028640(I(p->qWorldX), I(p->qWorldY), 1);
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

void Player_DefaultTrick(Player *p)
{
    u32 dir = p->trickDir;
    u16 character = p->character;
    u8 mask = sTrickMasks[dir][character];

    if ((mask & MASK_80D6992_1) && (p->variant == 1) && (p->qSpeedAirY > 0)) {
        p->variant = 2;
    }

    if (p->unk72 != 0) {
        p->unk72--;
    } else {
        if (mask & MASK_80D6992_4)
            mask &= ~MASK_80D6992_4;

        if ((mask & MASK_80D6992_8) && (p->charState != CHARSTATE_FALLING_VULNERABLE_B))
            p->charState = CHARSTATE_FALLING_VULNERABLE_B;
    }

    if (!(mask & MASK_80D6992_2) || (p->qSpeedAirY > 0)) {
        Player_AirInputControls(p);
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

    if (!(p->moveState & MOVESTATE_IN_AIR) && (p->character == CHARACTER_KNUCKLES) && (p->trickDir == TRICK_DIR_FORWARD)) {
        p->variant++;
        PLAYERFN_SET(Player_802A3C4);
    }
}

void DoTrickIfButtonPressed(Player *p)
{
    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->disableTrickTimer == 0) && (p->frameInput & gPlayerControls.trick)) {

        if (p->heldInput & DPAD_UP) {
            INCREMENT_SCORE(sTrickPoints[0]);
            p->trickDir = TRICK_DIR_UP;
            PLAYERFN_SET(Player_InitDefaultTrick);
        } else if (p->heldInput & DPAD_DOWN) {
            INCREMENT_SCORE(sTrickPoints[3]);

            switch (p->character) {
                case CHARACTER_SONIC: {
                    p->moveState |= MOVESTATE_SOME_ATTACK;
                    PLAYERFN_SET(Player_SonicAmy_InitStopNSlam);
                } break;

                case CHARACTER_KNUCKLES: {
                    p->moveState |= MOVESTATE_SOME_ATTACK;
                    PLAYERFN_SET(Player_Knuckles_InitDrillClaw);
                } break;

                case CHARACTER_AMY: {
                    p->moveState |= MOVESTATE_SOME_ATTACK;
                    PLAYERFN_SET(Player_SonicAmy_InitStopNSlam);
                } break;

                default: {
                    p->trickDir = TRICK_DIR_DOWN;
                    PLAYERFN_SET(Player_InitDefaultTrick);
                } break;
            }
        } else if ((!(p->moveState & MOVESTATE_FACING_LEFT) && (p->heldInput & DPAD_RIGHT))
                   || ((p->moveState & MOVESTATE_FACING_LEFT) && (p->heldInput & DPAD_LEFT))) {
            INCREMENT_SCORE(sTrickPoints[2]);
            p->trickDir = TRICK_DIR_FORWARD;

            PLAYERFN_SET(Player_InitDefaultTrick);
        } else {
            INCREMENT_SCORE(sTrickPoints[1]);
            p->trickDir = TRICK_DIR_BACKWARD;

            PLAYERFN_SET(Player_InitDefaultTrick);
        }
    }
}

void Player_8028D74(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->spriteOffsetX < 6) || (p->spriteOffsetY < 9)) {
        u16 cAnim = GET_CHARACTER_ANIM(p);

        if ((cAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (cAnim == SA2_CHAR_ANIM_JUMP_1) || (cAnim == SA2_CHAR_ANIM_JUMP_2)
            || (cAnim == SA2_CHAR_ANIM_70)) {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
    }

    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(Player_8029074, p);
}

void Player_TouchNormalSpring(Player *p)
{
    u8 u6E = p->unk6E;
    u8 r5 = (u6E >> 4);
    u8 r6 = u6E % ARRAY_COUNT(sSpringAccelY);

    Player_TransitionCancelFlyingAndBoost(p);

    if (((r5 == 2) || (r5 == 3)) && !(p->moveState & MOVESTATE_IN_AIR)) {
        p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);
    } else {
        p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    }

    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        p->charState = CHARSTATE_SPRING_MUSIC_PLANT;
    } else if (ABS(p->qSpeedAirX) < Q(2.5)) {
        p->charState = CHARSTATE_SPRING_B;
    } else {
        p->charState = CHARSTATE_SPRING_C;
    }

    p->prevCharState = CHARSTATE_INVALID;

    switch (r5) {
        case 0: {
            p->qSpeedAirY = -sSpringAccelY[r6];
        } break;

        case 1: {
            p->qSpeedAirY = +sSpringAccelY[r6];
        } break;

        case 2: {
            p->qSpeedAirX = -sSpringAccelX[r6];

            if (!(p->moveState & MOVESTATE_IN_AIR) && p->qSpeedAirX < -Q(9.0)) {
                p->isBoosting = TRUE;
            }
        } break;

        case 3: {
            p->qSpeedAirX = +sSpringAccelX[r6];

            if (!(p->moveState & MOVESTATE_IN_AIR) && p->qSpeedAirX > +Q(9.0)) {
                p->isBoosting = TRUE;
            }
        } break;

        case 4: {
            p->qSpeedAirX = -sSpringAccelX[r6];
            p->qSpeedAirY = -sSpringAccelY[r6];
        } break;

        case 5: {
            p->qSpeedAirX = +sSpringAccelX[r6];
            p->qSpeedAirY = -sSpringAccelY[r6];
        } break;

        case 6: {
            p->qSpeedAirX = -sSpringAccelX[r6];
            p->qSpeedAirY = +sSpringAccelY[r6];
        } break;

        case 7: {
            p->qSpeedAirX = +sSpringAccelX[r6];
            p->qSpeedAirY = +sSpringAccelY[r6];
        } break;
    }

    p->disableTrickTimer = disableTrickTimerTable[r6];

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        {
            s32 speed = (p->qSpeedAirX * 5);
            if (speed < 0) {
                speed += 3;
            }
            p->qSpeedAirX = speed >> 2;
        }
        {
            s32 speed = (p->qSpeedAirY * 5);
            if (speed < 0) {
                speed += 3;
            }
            p->qSpeedAirY = speed >> 2;
        }
    }

    if (p->moveState & MOVESTATE_IN_WATER) {
        p->qSpeedAirY /= 2;
    }

    if (p->qSpeedAirX > Q(1.25)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (p->qSpeedAirX < -Q(1.25)) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    PLAYERFN_SET_AND_CALL(Player_8029074, p);
}

void Player_8029074(Player *p)
{
    sub_80246DC(p);
    DoTrickIfButtonPressed(p);
    Player_AirInputControls(p);
    sub_80236C8(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_InitRampOrDashRing(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_STOOD_ON_OBJ);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_RAMP_AND_DASHRING;
    p->prevCharState = CHARSTATE_INVALID;

    if (p->qSpeedAirX > +Q(1.25)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (p->qSpeedAirX < -Q(1.25)) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }

    switch (p->unk6E) {
        case 0: {
            s32 qGroundSpeed = p->qSpeedGround;
            s32 speed = (qGroundSpeed * 3);
            s16 qSpeedX, qSpeedY;

            if (speed < 0) {
                speed += 7;
            }
            qSpeedX = ((u32)speed / 8);
            qSpeedY = -ABS(qGroundSpeed) / 6;

            p->qSpeedAirX = qSpeedX + +Q(3.75);
            p->qSpeedAirY = qSpeedY + -Q(3.75);
        } break;

        case 1:
        case 2: {
            s32 groundSpeed = p->qSpeedGround;
            s32 speed = (groundSpeed * 3);
            s16 qSpeedX, qSpeedY;

            if (speed < 0) {
                speed += 7;
            }
            qSpeedX = ((u32)speed / 8);
            qSpeedY = -ABS(groundSpeed) / 6;

            p->qSpeedAirX = qSpeedX + +Q(3.75);
            p->qSpeedAirY = qSpeedY + -Q(7.50);
        } break;

        case 3: {
            s32 groundSpeed = p->qSpeedGround;
            s32 speed = (groundSpeed * 3);
            s16 qSpeedX, qSpeedY;

            if (speed < 0) {
                speed += 7;
            }
            qSpeedX = (speed / 8u);
            qSpeedY = -ABS(groundSpeed) / 6;

            p->qSpeedAirX = qSpeedX + +Q(5.625);
            p->qSpeedAirY = qSpeedY + -Q(2.50);
        } break;

        case 4:
        case 5: {
            s32 groundSpeed = p->qSpeedGround;
            s32 speed = (groundSpeed * 3);
            s16 qSpeedX, qSpeedY;

            if (speed < 0) {
                speed += 7;
            }
            qSpeedX = (((u32)speed << 13) >> 16);
            qSpeedY = -ABS(groundSpeed) / 6;

            p->qSpeedAirX = qSpeedX + +Q(11.25);
            p->qSpeedAirY = qSpeedY + -Q(2.50);
        } break;
    }

    if (p->moveState & MOVESTATE_IN_WATER) {
        p->qSpeedAirY >>= 1;
    }

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->qSpeedAirX = -p->qSpeedAirX;
    }

    m4aSongNumStart(SE_276);

    PLAYERFN_SET_AND_CALL(Player_8029314, p);
}

void Player_8029314(Player *p)
{
    if ((p->charState == CHARSTATE_RAMP_AND_DASHRING) && (p->variant == 0) && (p->qSpeedAirY > 0))
        p->variant = 1;

    DoTrickIfButtonPressed(p);
    sub_8023708(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_DashRing(Player *p)
{
    if (--p->unk72 == -1) {
        PLAYERFN_SET(Player_8029074);
    }

    sub_80246DC(p);
    DoTrickIfButtonPressed(p);
    sub_80232D0(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

// TODO: Fix the goto-match
// Only checks for A-/B-Button actions, not tricks!
bool32 Player_TryMidAirAction(Player *p)
{
    u16 song;
    if (!(p->moveState & MOVESTATE_SOME_ATTACK)) {
        if (p->frameInput & gPlayerControls.attack) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    Player_SonicAmy_InitStopNSlam(p);
                    return TRUE;
                } break;

                case CHARACTER_CREAM: {
                    if ((p->heldInput & DPAD_ANY) == DPAD_DOWN) {
                        Player_Cream_InitChaoRollingAttack(p);
                    } else {
                        Player_Cream_InitMidAirChaoAttack(p);
                    }
                    return TRUE;
                } break;

                case CHARACTER_KNUCKLES: {
                    Player_Knuckles_InitDrillClaw(p);
                    return TRUE;
                } break;

                case CHARACTER_AMY: {
                    Player_SonicAmy_InitStopNSlam(p);
                    return TRUE;
                } break;
            }
        }

        if (p->frameInput & gPlayerControls.jump) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    if (!IS_BOSS_STAGE(gCurrentLevel) && gHomingTarget.squarePlayerDistance < SQUARE(128)) {
                        Player_Sonic_InitHomingAttack(p);
                        return TRUE;
                    } else {
                        p->moveState |= MOVESTATE_SOME_ATTACK;
                        p->charState = CHARSTATE_SOME_ATTACK;
                        Player_SonicAmy_InitSkidAttackGfxTask(I(p->qWorldX), I(p->qWorldY), 1);
                        song = SE_SONIC_INSTA_SHIELD;
                        goto Player_TryMidAirAction_PlaySfx;
                    }
                } break;

                case CHARACTER_CREAM: {
                    Player_Cream_InitFlying(p);
                    return TRUE;
                } break;

                case CHARACTER_TAILS: {
                    if (!(p->moveState & MOVESTATE_IN_WATER)) {
                        Player_Tails_InitFlying(p);
                        p->moveState |= MOVESTATE_SOME_ATTACK;
                        return TRUE;
                    }
                } break;

                case CHARACTER_KNUCKLES: {
                    if (!(p->moveState & MOVESTATE_IN_WATER)) {
                        Player_Knuckles_InitGlide(p);
                        return TRUE;
                    }
                } break;

                case CHARACTER_AMY: {
                    p->moveState |= MOVESTATE_SOME_ATTACK;
                    p->charState = CHARSTATE_SOME_ATTACK;
                    CreateAmyAttackHeartEffect(AMY_HEART_PATTERN_C);

                    song = SE_AMY_SUPER_HAMMER_ATTACK;
                Player_TryMidAirAction_PlaySfx:
                    m4aSongNumStart(song);
                    // TODO / BUG?
                    // there's no return TRUE; for Amy
                } break;
            }
        }
    }

    return FALSE;
}

// (100.00%) https://decomp.me/scratch/ZcC17
void Player_HandleGroundMovement(Player *p)
{
    s8 charState = CHARSTATE_INVALID;
    s32 acc = p->acceleration;
    s32 dec = p->deceleration;

    if ((p->unk2A == 0) && p->heldInput & (DPAD_LEFT | DPAD_RIGHT)) {
        if (p->qSpeedGround > 0) {
            if (p->heldInput & DPAD_RIGHT) {
                if (p->qSpeedGround < p->topSpeed) {
                    p->qSpeedGround += acc;

                    if (p->qSpeedGround > p->topSpeed) {
                        p->qSpeedGround = p->topSpeed;
                    }
                } else {
                    p->boostSpeed += acc;
                }
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if (p->qSpeedGround >= Q(2.0)) {
                if ((p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_BRAKE_GOAL)) {
                    charState = p->charState;
                } else {
                    u16 walkAnim = p->walkAnim;
                    charState = CHARSTATE_BRAKE;
                    if (walkAnim > 3) {
                        charState = CHARSTATE_BRAKE_GOAL;
                    }
                }
                p->qSpeedGround -= dec;
                sub_8029FA4(p);
                m4aSongNumStart(SE_BRAKE);
            } else {
                p->qSpeedGround -= dec;

                if ((p->qSpeedGround > 0) && !(p->moveState & MOVESTATE_FACING_LEFT)) {
                    if ((p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_BRAKE_GOAL)) {
                        charState = CHARSTATE_BRAKE;
                    }
                    gPlayer.callback = Player_Skidding;
                }
            }
        } else if (p->qSpeedGround < 0) {
            if (p->heldInput & DPAD_LEFT) {
                if (p->qSpeedGround > -p->topSpeed) {
                    p->qSpeedGround -= acc;

                    if (p->qSpeedGround < -p->topSpeed) {
                        p->qSpeedGround = -p->topSpeed;
                    }
                } else {
                    p->boostSpeed += acc;
                }
                p->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                if (p->qSpeedGround <= -Q(2.0)) {
                    if ((p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_BRAKE_GOAL)) {
                        charState = p->charState;
                    } else {
                        u16 walkAnim = p->walkAnim;
                        charState = CHARSTATE_BRAKE;
                        if (walkAnim > 3) {
                            charState = CHARSTATE_BRAKE_GOAL;
                        }
                    }

                    p->qSpeedGround += dec;

                    sub_8029FA4(p);
                    m4aSongNumStart(SE_BRAKE);
                } else {
                    p->qSpeedGround += dec;

                    if ((p->qSpeedGround < 0) && (p->moveState & MOVESTATE_FACING_LEFT)) {
                        if ((p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_BRAKE_GOAL)) {
                            charState = CHARSTATE_BRAKE;
                        }
                        gPlayer.callback = Player_Skidding;
                    }
                }
            }
        } else {
            if ((p->moveState & MOVESTATE_FACING_LEFT) != ((p->heldInput & DPAD_RIGHT) >> 4)) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->qSpeedGround -= acc;
                } else {
                    p->qSpeedGround += acc;
                }

                charState = CHARSTATE_WALK_A;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            } else {
                gPlayer.callback = Player_Skidding;
            }
        }
    } else {
        s32 grndSpeed = p->qSpeedGround;
        if (grndSpeed > 0) {
            s16 val = grndSpeed - Q(8.0 / 256.0);
            if (val <= 0) {
                val = 0;
                charState = CHARSTATE_IDLE;
            } else {
                charState = CHARSTATE_WALK_A;
            }

            p->qSpeedGround = val;
        } else if (grndSpeed < 0) {
            s16 val = grndSpeed + Q(8.0 / 256.0);
            if (val >= 0) {
                val = 0;
                charState = CHARSTATE_IDLE;
            } else {
                charState = CHARSTATE_WALK_A;
            }

            p->qSpeedGround = val;
        } else {
            charState = CHARSTATE_IDLE;
        }
    }

    if (p->moveState & MOVESTATE_8000) {
        if ((charState == CHARSTATE_BRAKE) || (charState == CHARSTATE_BRAKE_GOAL)) {
            p->charState = charState;
        }
    } else if (charState != CHARSTATE_INVALID) {
        if (p->charState != charState)
            p->charState = charState;
    } else if ((p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_BRAKE_GOAL)) {
        p->charState = CHARSTATE_WALK_A;
    }

    sub_8023128(p);
}

void Player_HandleBoostThreshold(Player *p)
{
    if (gRingCount >= 150) {
        p->boostThreshold = 4;
    } else if (gRingCount >= 100) {
        p->boostThreshold = 3;
    } else if (gRingCount >= 50) {
        p->boostThreshold = 2;
    } else if (gRingCount > 10) {
        p->boostThreshold = 1;
    } else {
        p->boostThreshold = 0;
    }
}

void Player_HandleBoostState(Player *p)
{
    bool32 isBoostActive = p->isBoosting;
    if (isBoostActive) {
        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->boostSpeed = playerBoostThresholdTable[p->boostThreshold];

            if (ABS(p->qSpeedGround) < Q(4.5)) {
                p->isBoosting = FALSE;
                p->boostSpeed = 0;
            }
        }
    } else {
        if ((!(p->moveState & MOVESTATE_IN_AIR)) && ((ABS(p->qSpeedGround) >= p->topSpeed))) {
            if (p->boostSpeed >= playerBoostThresholdTable[p->boostThreshold]) {
                p->isBoosting = TRUE;
                gCamera.unk8 = 0x400;

                CreateBoostModeParticles();

                m4aSongNumStart(SE_221);
            }
        } else {
#ifndef NON_MATCHING
            p->boostSpeed = isBoostActive;
#else
            p->boostSpeed = 0;
#endif
        }
    }
}

void Player_HandleWalkAnim(Player *p)
{
    s32 absSpeed = ABS(p->qSpeedGround);

    if (absSpeed <= Q(1.25)) {
        p->walkAnim = 0;
    } else if (absSpeed <= Q(2.5)) {
        p->walkAnim = 1;
    } else if (absSpeed <= Q(4.0)) {
        p->walkAnim = 2;
    } else if (absSpeed <= Q(9.0)) {
        p->walkAnim = 3;
    } else if (absSpeed <= Q(10.0)) {
        p->walkAnim = 4;
    } else {
        p->walkAnim = 5;
    }
}

void CallSetStageSpawnPos(u32 character, u32 level, u32 playerID, Player *p) { SetStageSpawnPos(character, level, playerID, p); }

void DestroyPlayerTasks(Player *p)
{
    TaskDestroy(p->spriteTask);
    p->spriteTask = NULL;

    if (p->playerID == 0) {
        DestroyBrakingDustEffectRelatedTask();
        DestroyRingsScatterTask();
    }
}

s32 sub_8029A28(Player *p, u8 *rot, s32 *out)
{
    s32 result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    s32 dummyInt;
    s32 rotValue;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_802195C(p, rot, out);

    rotValue = *rot;

    if (rotValue & 0x1)
        *rot = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= rotValue;
            *rot = val;
        }
    }

    return result;
}

s32 sub_8029A74(Player *p, u8 *rot, s32 *out)
{
    s32 result;

    u8 dummy;

    s32 dummyInt;
    s32 rotValue;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8021A34(p, rot, out);

    rotValue = *rot;

    if (rotValue & 0x1)
        *rot = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= rotValue;
            *rot = val;
        }
    }

    return result;
}

s32 sub_8029AC0(Player *p, u8 *rot, s32 *out)
{
    s32 result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    s32 dummyInt;
    s32 rotValue;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8021B08(p, rot, out);

    rotValue = *rot;

    if (rotValue & 0x1)
        *rot = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -0x80;
            val -= rotValue;
            *rot = val;
        }
    }

    return result;
}

s32 sub_8029B0C(Player *p, u8 *ret_rotation, s32 *out)
{
    s32 result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    s32 dummyInt;
    s32 rotValue;

    if (ret_rotation == NULL)
        ret_rotation = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8029BB8(p, ret_rotation, out);

    rotValue = *ret_rotation;

    if (rotValue & 0x1)
        *ret_rotation = 0;
    else {
        if (GRAVITY_IS_INVERTED) {
            s32 val = -DEG_TO_TURNS(180);
            val -= rotValue;
            *ret_rotation = val;
        }
    }

    return result;
}

s32 sub_8029B58(Player *p, u8 *rot, s32 *out)
{
    s32 result;

    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, rot, out);
    } else {
        result = sub_8029AC0(p, rot, out);
    }

    return result;
}

s32 sub_8029B88(Player *p, u8 *rot, s32 *out)
{
    s32 result;

    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, rot, out);
    } else {
        result = sub_8029B0C(p, rot, out);
    }

    return result;
}

// Very similar to sub_802195C
s32 sub_8029BB8(Player *p, u8 *rotation, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (rotation == NULL)
        rotation = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerY2 = I(p->qWorldY) + p->spriteOffsetY;
    playerX2 = I(p->qWorldX) - (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->qSpeedAirY < 0) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerY2, playerX2, mask, 8, &anotherByte, sub_801EE64);

    playerY = I(p->qWorldY) + p->spriteOffsetY;
    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->qSpeedAirY < 0) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerY, playerX, mask, 8, &anotherByte2, sub_801EE64);

    if (r5 < r1) {
        result = r5;
        *rotation = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *rotation = anotherByte2;
        *out = r5;
    }

    return result;
}

void sub_8029C84(Player *p)
{
    s32 rot = p->rotation + DEG_TO_TURNS(90);

    if ((rot & (DEG_TO_TURNS(360) - 1)) >= DEG_TO_TURNS(180))
        p->qSpeedGround = 0;
}

void sub_8029CA0(Player *p)
{
    s32 rot = p->rotation;
    if (((rot + DEG_TO_TURNS(135)) & (DEG_TO_TURNS(360) - 1)) < DEG_TO_TURNS(270)) {
        rot = GET_ROTATED_ACCEL(rot);

        if (p->qSpeedGround != 0) {
            p->qSpeedGround += rot;
        }
    }
}

void sub_8029CE0(Player *p)
{
    s32 rot = p->rotation;
    if (((rot + DEG_TO_TURNS(135)) & (DEG_TO_TURNS(360) - 1)) < DEG_TO_TURNS(270)) {
        s32 other = GET_ROTATED_ACCEL_2(rot);

        p->qSpeedGround += other;
    }
}

void sub_8029D14(Player *p)
{
#ifndef NON_MATCHING
    register s32 grndSpeed asm("r2") = p->qSpeedGround;
#else
    s32 grndSpeed = p->qSpeedGround;
#endif

    if (((p->rotation + DEG_TO_TURNS(135)) & (DEG_TO_TURNS(360) - 1)) < DEG_TO_TURNS(270) && grndSpeed != 0) {
        s32 accelInt = I(GET_ROTATED_ACCEL_3(p->rotation));

        if (grndSpeed > 0) {
            if (accelInt <= 0) {
                accelInt = (accelInt >> 2);
            }
        } else {
            if (accelInt >= 0) {
                accelInt = (accelInt >> 2);
            }
        }

        p->qSpeedGround = grndSpeed + accelInt;
    }
}

void Player_UpdatePosition(Player *p) { PLAYERFN_UPDATE_POSITION(p); }

void PlayerFn_Cmd_UpdateAirFallSpeed(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED(p); }

bool32 sub_8029DE8(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 playerY = p->qWorldY;

    if (!(p->moveState & MOVESTATE_80000000)) {
        if (GRAVITY_IS_INVERTED) {
            if (playerY <= Q(cam->minY))
                return TRUE;
        } else {
            if (playerY >= Q(cam->maxY) - 1)
                return TRUE;
        }
    }

    return FALSE;
}

// Might've been an inline func, but doesn't match with it.
UNUSED bool32 DeadPlayerLeftScreen_UnusedCopy(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 playerY = p->qWorldY;

    if (!(p->moveState & MOVESTATE_80000000)) {
        if (GRAVITY_IS_INVERTED) {
            if (playerY <= Q(cam->y - 80))
                return TRUE;
        } else {
            if (playerY >= Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1)
                return TRUE;
        }
    }

    return FALSE;
}

bool32 Player_TryJump(Player *p)
{
    u8 rot = p->rotation;

    if (p->frameInput & gPlayerControls.jump) {
        if (GRAVITY_IS_INVERTED) {
            rot += Q(0.25);
            rot = -rot;
            rot -= Q(0.25);
        }

        if (sub_8022F58(rot + Q(0.5), p) > 3) {
            PLAYERFN_SET(Player_InitJump);
            return TRUE;
        }
    }

    return FALSE;
}

void sub_8029ED8(Player *p) { PLAYERFN_UPDATE_UNK2A(p); }

void sub_8029F20(Player *p) { PLAYERFN_UPDATE_ROTATION(p); }

void ContinueLevelSongAfterDrowning(Player *p)
{
    p->framesUntilDrownCountDecrement = 60;
    p->secondsUntilDrown = 30;

    if (gMPlayTable[0].info->songHeader == gSongTable[MUS_DROWNING].header) {
        if (p->playerID == 0) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
    }
}

void sub_8029FA4(Player *p)
{
    u8 mask = (p->moveState & MOVESTATE_GOAL_REACHED) ? 0x7 : 0x3;

    if ((gStageTime & mask) == 0) {
        s32 u17 = p->spriteOffsetY;

        if (GRAVITY_IS_INVERTED) {
            u17 = -u17;
        }

        CreateBrakingDustEffect(I(p->qWorldX), I(p->qWorldY) + u17);
    }
}

void Player_SetMovestate_IsInScriptedSequence(void) { gPlayer.moveState |= MOVESTATE_IN_SCRIPTED; }

void Player_ClearMovestate_IsInScriptedSequence(void) { gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED; }

void Player_DisableInputAndBossTimer(void)
{
    gPlayer.transition = PLTRANS_REACHED_GOAL;
    gStageFlags |= (STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__2 | STAGE_FLAG__ACT_START);

    if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        gStageFlags |= STAGE_FLAG__TURN_OFF_TIMER;
    }
}

void Player_DisableInputAndBossTimer_FinalBoss(void)
{
    gStageFlags |= (STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__2 | STAGE_FLAG__ACT_START);

    if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        gStageFlags |= STAGE_FLAG__TURN_OFF_TIMER;
    }
}

void TaskDestructor_Player(struct Task *t)
{
    gPlayer.spriteTask = NULL;

    if (gPlayer.playerID) {
        VramFree(gPlayer.spriteInfoBody->s.graphics.dest);
    }

    if (gPlayer.character == CHARACTER_CREAM || gPlayer.character == CHARACTER_TAILS) {
        VramFree(gPlayer.spriteInfoLimbs->s.graphics.dest);
    }
}

// NOTE: Official name for the Taunt is "Appeal"
bool32 Player_TryTaunt(Player *p)
{
    if (((p->heldInput & DPAD_ANY) == DPAD_UP) && p->qSpeedGround == 0) {
        PLAYERFN_SET(Player_InitTaunt);
        return TRUE;
    }

    return FALSE;
}

bool32 Player_TryCrouchOrSpinAttack(Player *p)
{
    if ((p->heldInput & DPAD_ANY) == DPAD_DOWN) {
        if ((p->qSpeedGround == 0) && (((p->rotation + Q(0.125)) & 0xC0) == 0)
            && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_4 | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(Player_InitCrouch);
            return TRUE;
        } else if (((u16)(p->qSpeedGround + (Q(0.5) - 1)) > Q(1.0) - 2)
                   && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_4 | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(Player_SpinAttack);
            m4aSongNumStart(SE_SPIN_ATTACK);
            return TRUE;
        }
    }

    return FALSE;
}

bool32 Player_TryInitSpindash(Player *p)
{
    if (p->charState == CHARSTATE_CROUCH) {
        if (p->frameInput & gPlayerControls.jump) {
            PLAYERFN_SET_AND_CALL(Player_InitSpindash, p);
            return TRUE;
        }
    }

    return FALSE;
}

void Player_ApplyBoostPhysics(Player *p)
{
    u32 boostThreshold = p->boostThreshold;
    if (p->isBoosting) {
        p->topSpeed = Q(12.0);
        p->maxSpeed = Q(15.0);
    } else if (p->moveState & MOVESTATE_4) {
        p->topSpeed = Q(6.0);
        p->maxSpeed = Q(15.0);
    } else {
        p->topSpeed = Q(6.0);
        p->maxSpeed = Q(9.0);
    }

    p->acceleration = playerBoostPhysicsTable[boostThreshold][0];
    p->deceleration = playerBoostPhysicsTable[boostThreshold][1];
}

void Player_InitCrouch(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->charState = CHARSTATE_CROUCH;
    p->qSpeedGround = 0;

    PLAYERFN_SET_AND_CALL(Player_Crouch, p);
}

void Player_802A258(Player *p)
{
    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        if (p->moveState & MOVESTATE_4)
            Player_SpinAttack(p);
        else
            Player_TouchGround(p);
    } else {
        p->moveState |= MOVESTATE_40000;
        p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

        PLAYERFN_SET_AND_CALL(Player_8026D2C, p);
    }
}

bool32 Player_TryAttack(Player *p)
{
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (p->moveState & (MOVESTATE_8000 | MOVESTATE_400))
        || ((s8)(p->rotation + Q(0.25)) <= 0)) {
        return FALSE;
    } else if (p->frameInput & gPlayerControls.attack) {
        PLAYERFN_SET(Player_InitAttack);
        return TRUE;
    } else {
        return FALSE;
    }
}

void Player_InitDashRing(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_STOOD_ON_OBJ);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->prevCharState = CHARSTATE_INVALID;

    p->rotation = 0;

    m4aSongNumStart(SE_DASH_RING);

    PLAYERFN_SET_AND_CALL(Player_DashRing, p);
}

void Player_InitIceSlide(Player *p) { Player_InitIceSlide_inline(p); }

void PlayerFn_Cmd_HandlePhysics(Player *p) { Player_HandlePhysics(p); }

void Player_802A3C4(Player *p)
{
    Player_HandlePhysicsWithAirInput(p);

    if (p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)
        PLAYERFN_SET(Player_SpinAttack);
}

void Player_CameraShift(Player *p) { Player_CameraShift_inline(p); }

void Player_InitSpecialStageTransition(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->isBoosting = FALSE;
    p->charState = CHARSTATE_WALK_A;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);
    p->unk72 = 0;

    PLAYERFN_SET_AND_CALL(Player_80279F8, p);
}

// Boss-Stage-only
void Player_InitKilledBoss(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_WALK_A;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    PLAYERFN_SET_AND_CALL(Player_8027C5C, p);
}

void Player_InitReachedGoalMultiplayer(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;
    p->moveState |= MOVESTATE_IGNORE_INPUT;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(Player_8027D3C, p);
}

void Player_Nop(Player *p) { }

void sub_802A500(Player *p) { sub_802A500_inline(p); }

void sub_802A52C(Player *p) { PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p); }

void sub_802A558(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p); }

void sub_802A58C(Player *p)
{
    if (p->charState != CHARSTATE_HIT_AIR) {
        if (p->timerInvulnerability > 0)
            p->timerInvulnerability--;
    }
}

void sub_802A5AC(Player *p)
{
    if (p->disableTrickTimer != 0)
        p->disableTrickTimer--;
}

void Player_Skidding(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    if (p->charState == CHARSTATE_BRAKE || p->charState == CHARSTATE_BRAKE_GOAL) {
        p->charState = CHARSTATE_TURN_AFTER_BRAKE;
    } else {
        p->charState = CHARSTATE_TURN_SLOW;
    }

    p->spriteInfoBody->s.frameFlags &= ~(MOVESTATE_4000);

    p->qSpeedGround = 0;
    p->moveState ^= MOVESTATE_FACING_LEFT;

    PLAYERFN_SET_AND_CALL(Player_8025548, p);
}

void Player_InitTaunt(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->spriteInfoBody->s.frameFlags &= ~(MOVESTATE_4000);

    p->charState = CHARSTATE_TAUNT;

    p->qSpeedGround = 0;

    PLAYERFN_SET_AND_CALL(Player_Taunt, p);
}

void sub_802A660(Player *p)
{
    if (p->unk2A == 0) {
        if ((p->heldInput & DPAD_SIDEWAYS) != DPAD_RIGHT) {
            if ((p->heldInput & DPAD_SIDEWAYS) == DPAD_LEFT) {
                s32 grnd = p->qSpeedGround;
                if (grnd <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                } else if ((grnd - Q(0.09375)) < 0) {
                    s32 val = Q(0.375);
                    p->qSpeedGround = -val;
                } else {
                    p->qSpeedGround = (grnd - Q(0.09375));
                }
            }
        } else {
            s32 grnd = p->qSpeedGround;
            if (grnd >= 0) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if ((grnd + Q(0.09375)) > 0) {
                p->qSpeedGround = +Q(0.375);
            } else {
                p->qSpeedGround = (grnd + Q(0.09375));
            }
        }
    }
}

void sub_802A6C0(Player *p)
{
    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    p->layer = 0x1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
    m4aSongNumStop(SE_GRINDING);
}

void Player_InitAttack(Player *p)
{
    switch (p->character) {
        case CHARACTER_SONIC: {
            Player_SonicAmy_InitSkidAttack(p);
        } break;

        case CHARACTER_CREAM: {
            if (!p->isBoosting) {
                Player_Cream_InitChaoAttack(p);
            } else {
                Player_Cream_InitStepAttack(p);
            }
        } break;

        case CHARACTER_TAILS: {
            Player_Tails_InitTailSwipe(p);
        } break;

        case CHARACTER_KNUCKLES: {
            if (!p->isBoosting) {
                Player_Knuckles_InitPunch(p);
            } else {
                Player_Knuckles_InitSpiralAttack(p);
            }
        } break;

        case CHARACTER_AMY: {
            if (!p->isBoosting) {
                Player_Amy_InitHammerAttack(p);
            } else {
                // Same code as Sonic's "Super Skid" (Boost + B_BUTTON)
                Player_SonicAmy_InitSkidAttack(p);
            }
        } break;
    }
}
#endif
