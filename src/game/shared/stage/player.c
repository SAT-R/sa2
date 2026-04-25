#include "global.h"
#include "trig.h"
#include "flags.h"
#include "malloc_vram.h"
#include "gba/io_reg.h"
#include "lib/m4a/m4a.h"

#include "game/globals.h"

#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/music_manager.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/dust_effect_braking.h" // CreateSpindashDustEffect
#include "game/shared/stage/dust_effect_spindash.h" // CreateSpindashDustEffect
#include "game/shared/stage/item_tasks.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/shared/stage/rings_scatter.h"
#include "game/shared/stage/stage.h"
#include "game/shared/stage/underwater_effects.h"
#include "game/shared/stage/water_effects.h"
#include "game/shared/stage/amy_attack_heart_effect.h"

#include "game/shared/parameters/bosses.h"
#include "game/shared/parameters/characters.h"

#if (GAME == GAME_SA1)
#include "game/sa1/save.h"
#include "game/sa1/stage/some_task_manager.h"
#include "game/sa1/stage/player_controls.h"
#include "game/sa1/stage/player_sonic.h"
#include "game/sa1/stage/player_tails.h"
#include "game/sa1/stage/player_super_sonic.h"
#include "game/sa1/stage/spawn_positions.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/zones.h"

#elif (GAME == GAME_SA2)
#include "game/sa2/stage/mp_attack_1_effect.h"
#include "game/sa2/stage/spawn_positions.h"
#include "game/sa2/stage/boost_effect.h"
#include "game/sa2/stage/boost_mode_particles.h" // incl. CreateBoostModeParticles
#include "game/sa2/stage/bosses/common.h"
#include "game/sa2/stage/cheese.h"
#include "game/sa2/stage/heart_particles_effect.h"
#include "game/sa2/stage/mp_attack_2_effect.h"
#include "game/sa2/stage/player_controls.h"
#include "game/sa2/stage/player_super_sonic.h"
#include "game/sa2/ui/stage_results.h"
#include "game/sa2/ui/time_attack_results.h" // for Player_VictoryPose
#include "game/sa2/stage/player_callbacks.h"
#include "game/sa2/stage/input_buffer.h"
#include "game/sa2/save.h"

#include "constants/sa2/animations.h"
#include "constants/sa2/char_states.h"
#include "constants/sa2/player_transitions.h"
#include "constants/sa2/songs.h"
#include "constants/sa2/zones.h"
#endif

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)
#define GET_ROTATED_ACCEL_3(angle) ((SIN_24_8((angle)*4) * 60))

#if (GAME == GAME_SA2)
// TODO: Match this without ASM!
#ifndef COLLECT_RINGS_ROM
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
#else
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                                                                           \
    {                                                                                                                                      \
        s16 speed = Q_8_8(PLAYER_GRAVITY);                                                                                                 \
                                                                                                                                           \
        if (player->qSpeedAirY < 0) {                                                                                                      \
            speed /= 2;                                                                                                                    \
        }                                                                                                                                  \
                                                                                                                                           \
        player->qSpeedAirY += speed;                                                                                                       \
    }
#endif
#endif

#define PLAYERFN_UPDATE_UNK2A(player)                                                                                                      \
    {                                                                                                                                      \
        if (player->SA2_LABEL(unk2A) != 0) {                                                                                               \
            player->SA2_LABEL(unk2A) -= 1;                                                                                                 \
        } else if ((player->rotation + Q(0.125)) & 0xC0) {                                                                                 \
            if (ABS(player->qSpeedGround) < Q(1.875)) {                                                                                    \
                player->qSpeedGround = 0;                                                                                                  \
                                                                                                                                           \
                player->moveState |= MOVESTATE_IN_AIR;                                                                                     \
                player->SA2_LABEL(unk2A) = GBA_FRAMES_PER_SECOND / 2;                                                                      \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#if (GAME == GAME_SA2)
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
#endif

#if (GAME == GAME_SA1)
#define UPDATE_POS_SPEEDCAP(player) ({});
#elif (GAME >= GAME_SA2)
#define UPDATE_POS_SPEEDCAP(player) ({ player->qSpeedAirY = MIN(player->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX)); })
#endif

#ifndef COLLECT_RINGS_ROM
#define PLAYERFN_UPDATE_POSITION(player)                                                                                                   \
    {                                                                                                                                      \
        player->qWorldX += player->qSpeedAirX;                                                                                             \
                                                                                                                                           \
        if ((gStageFlags ^ gPrevStageFlags) & STAGE_FLAG__GRAVITY_INVERTED) {                                                              \
            player->qSpeedAirY = -player->qSpeedAirY;                                                                                      \
        }                                                                                                                                  \
                                                                                                                                           \
        UPDATE_POS_SPEEDCAP(player);                                                                                                       \
                                                                                                                                           \
        player->qWorldY = GRAVITY_IS_INVERTED ? player->qWorldY - player->qSpeedAirY : player->qWorldY + player->qSpeedAirY;               \
    }
#else
#define PLAYERFN_UPDATE_POSITION(player)                                                                                                   \
    {                                                                                                                                      \
        player->qWorldX += player->qSpeedAirX;                                                                                             \
                                                                                                                                           \
        UPDATE_POS_SPEEDCAP(player);                                                                                                       \
                                                                                                                                           \
        player->qWorldY = player->qWorldY + player->qSpeedAirY;                                                                            \
    }
#endif

#if (GAME == GAME_SA2)
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
        SA2_LABEL(sub_8022190)(player);                                                                                                    \
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player);                                                                                  \
    }
#endif

#if (GAME == GAME_SA1)
#define PLAYERFN_UPDATE_AIR_FALL_SPEED(player)                                                                                             \
    if (!(player->moveState & MOVESTATE_IN_WATER)) {                                                                                       \
        player->qSpeedAirY += Q(PLAYER_GRAVITY);                                                                                           \
    } else {                                                                                                                               \
        player->qSpeedAirY += Q(PLAYER_GRAVITY_UNDER_WATER);                                                                               \
    }
#elif (GAME == GAME_SA2)
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
#endif

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
        x = I(psi->transform.qScaleX * p->SA2_LABEL(unk80));                                                                               \
        y = I(psi->transform.qScaleY * p->SA2_LABEL(unk82));                                                                               \
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
        x = I(psi->transform.qScaleX * p->SA2_LABEL(unk80));                                                                               \
        y = I(psi->transform.qScaleY * p->SA2_LABEL(unk82));                                                                               \
        psi->transform.qScaleX = x;                                                                                                        \
        psi->transform.qScaleY = y;                                                                                                        \
        UpdateSpriteAnimation(s);                                                                                                          \
    })
#endif

#if (GAME == GAME_SA2)
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
#endif

Player ALIGNED(8) gPlayer = {};
#if (GAME == GAME_SA1)
Player ALIGNED(8) gPartner = {};
#endif

// Potentially some extra space on player for this to be aligned 16 (should be 8)
#if (GAME == GAME_SA1)
PlayerSpriteInfo ALIGNED(16) gPartnerLimbsPSI = {};
#endif
#ifndef COLLECT_RINGS_ROM
PlayerSpriteInfo ALIGNED(16) gPlayerLimbsPSI = {};
#endif
PlayerSpriteInfo ALIGNED(16) gPlayerBodyPSI = {};
#if (GAME == GAME_SA1)
PlayerSpriteInfo ALIGNED(16) gPartnerBodyPSI = {};
#endif

void Task_PlayerMain(void);
void AllocateCharacterStageGfx(Player *p, PlayerSpriteInfo *param2);
void AllocateCharacterMidAirGfx(Player *p, PlayerSpriteInfo *param2);
void TaskDestructor_Player(struct Task *);

void SA2_LABEL(sub_802486C)(Player *p, PlayerSpriteInfo *psi);
void SA2_LABEL(sub_8024B10)(Player *p, PlayerSpriteInfo *psi);
s32 SA2_LABEL(sub_8029BB8)(Player *p, u8 *p1, s32 *out);
void SA2_LABEL(sub_8024F74)(Player *p, PlayerSpriteInfo *psi);

void Player_HandleInputs(Player *p);

#if (GAME == GAME_SA1)
void Player_80447D8(Player *p);

void Player_Sonic_80473AC(Player *p);
void Player_Tails_8047BA0(Player *p);
void Player_Knuckles_8049000(Player *p);
void Player_Amy_80497AC(Player *p);

void Player_Knuckles_InitGlide(Player *p);

void Task_8045AD8(void);
void Task_8045B38(void);
void sub_8045DF0(Player *p);
#endif

#if (GAME == GAME_SA2)
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
void Player_8026BCC(Player *);
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
void CallPlayerTransition(Player *p);

void sub_8022218(Player *);
void SA2_LABEL(sub_8022284)(Player *);

#if COLLECT_RINGS_ROM
void sub_0200DBE0(Player *p);
#endif
#endif

#if (GAME == GAME_SA1)
extern s16 gUnknown_084AE188[9];
extern s16 gUnknown_084AE19A[9];
#endif

#if (GAME == GAME_SA2)
const AnimId gPlayerCharacterIdleAnims[] = {
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_SONIC),
#ifndef COLLECT_RINGS_ROM
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_CREAM), // Anti format
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_TAILS), //
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_KNUCKLES), //
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_AMY), //
#endif
};

#ifndef COLLECT_RINGS_ROM
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
    [CHARSTATE_BOUNCE] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SHARED_ANIM), 2 },
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
#else
// TODO: unify with main game table
const u16 sCharStateAnimInfo[][2] = {
    { 0, 0 },  { 1, 0 },  { 2, 0 },  { 3, 0 },  { 4, 0 },  { 5, 0 },  { 6, 0 }, { 7, 0 }, { 8, 0 },  { 9, 0 },  { 10, 0 }, { 11, 0 },
    { 12, 0 }, { 13, 0 }, { 13, 0 }, { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 }, { 0, 0 }, { 28, 0 }, { 28, 1 }, { 29, 0 }, { 1, 0 },
    { 1, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 }, { 1, 0 }, { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },
    { 0, 0 },  { 0, 0 },  { 52, 0 }, { 53, 0 }, { 54, 0 }, { 55, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },
    { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 }, { 0, 0 }, { 0, 0 },  { 0, 0 },  { 0, 0 },  { 0, 0 },
    { 0, 0 },  { 0, 0 },  { 0, 0 },  { 9, 2 },  { 0, 0 },  { 0, 0 },  { 0, 0 }, { 0, 0 }, { 0, 0 },  { 0, 0 },  { 0, 0 },  { 1, 0 },
    { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 }, { 1, 0 }, { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },
    { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 }, { 1, 0 }, { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },
    { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 }, { 1, 0 }, { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },
    { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },  { 1, 0 },
};
#endif

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

#ifndef COLLECT_RINGS_ROM
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
#endif

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
#endif

#ifndef COLLECT_RINGS_ROM
void CreatePlayer(u32 UNUSED characterId, u32 levelId, Player *player)
{
    struct Task *t;
    player_0_Task *gt;

    Player *p = player;
    s32 playerID = p->playerID;

#if (GAME == GAME_SA1)
    if (playerID == 0)
#endif
    {
#if (GAME == GAME_SA1)
        if (IS_EXTRA_STAGE(levelId)) {
            p->spriteTask = TaskCreate(Task_8049898, sizeof(MaybeSuperSonic), 0x3000, 0, TaskDestructor_Player);
        } else
#endif
        {
            p->spriteTask = TaskCreate(Task_PlayerMain, sizeof(player_0_Task), 0x3000, 0, TaskDestructor_Player);
        }

        // NOTE: For this to work MaybeSuperSonic NEEDS to have a player_0_Task as first element!
        gt = TASK_DATA(p->spriteTask);
        gt->pid = playerID;
        gt->unk4 = 0;

#if (GAME == GAME_SA2)
        if (IS_MULTI_PLAYER) {
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                gRingCount = 1;
            } else {
                gRingCount = 0;
            }
        }
#endif

        InitializePlayer(p);

#if (GAME == GAME_SA2)
        PLAYERFN_SET(Player_TouchGround);
#endif

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
    }
#if (GAME == GAME_SA1)
    else /* (playerID != PLAYER_1) */ {
        // here: playerID != 0
        p->spriteTask = TaskCreate(Task_8045B38, sizeof(player_0_Task), 0x3001, 0, TaskDestructor_Player);
        gt = (player_0_Task *)TASK_DATA(p->spriteTask);
        gt->pid = playerID;
        gt->unk4 = 0;
        InitializePlayer(player);
    }
#endif

#if (GAME == GAME_SA2)
    gStageGoalX = 0;
    gWorldSpeedX = 0;
    gWorldSpeedY = 0;

    InitNewInputCounters();
#endif

#if PORTABLE
    if (p->spriteInfoBody != NULL)
#endif
        AllocateCharacterStageGfx(p, p->spriteInfoBody);
#if PORTABLE
    if (p->spriteInfoLimbs != NULL)
#endif
        AllocateCharacterMidAirGfx(p, p->spriteInfoLimbs);

#if (GAME == GAME_SA1)
    if (IS_EXTRA_STAGE(levelId)) {
        sub_804A1B8(p);
    }
#endif
}
#endif

void AllocateCharacterStageGfx(Player *p, PlayerSpriteInfo *psi)
{
    s32 playerID = p->playerID;
    Sprite *s = &psi->s;

    if (playerID == 0) {
        s->graphics.dest = (void *)OBJ_VRAM0;
    } else {
        // TODO: Maybe find out biggest char anim size through preprocessing in the future?
#if (GAME == GAME_SA1)
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SONIC_RUN);
#elif (GAME == GAME_SA2)
        s->graphics.dest = VramMalloc(64);
#endif
    }

    s->graphics.size = 0;
    s->graphics.anim = p->anim;
    s->variant = p->variant;
    s->prevVariant = -1;
    s->x = I(p->qWorldX);
    s->y = I(p->qWorldY);
#if (GAME == GAME_SA1)
    s->oamFlags = SPRITE_OAM_ORDER(16);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
#elif (GAME == GAME_SA2)
    s->oamFlags = SPRITE_OAM_ORDER(16 + playerID);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }
#endif

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

    psi->transform.rotation = 0;
    psi->transform.qScaleX = +Q(1);
    psi->transform.qScaleY = +Q(1);
    psi->transform.x = 0;
    psi->transform.y = 0;
}

#ifndef COLLECT_RINGS_ROM
// Allocate VRAM for Tails' tails and Cream's ears while mid-air
void AllocateCharacterMidAirGfx(Player *p, PlayerSpriteInfo *param2)
{
    Sprite *s = &param2->s;
    PlayerSpriteInfo *extraSprite = param2;
    u32 character = p->character;

#if (GAME == GAME_SA1)
    if (character == CHARACTER_TAILS) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_CHAR(TAILS, SPIN_ATTACK);
        extraSprite->s.variant = 1;
    }
#elif (GAME >= GAME_SA2)
    if (character == CHARACTER_CREAM) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_CREAM);
        extraSprite->s.variant = 1;
    } else if (character == CHARACTER_TAILS) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_TAILS);
        extraSprite->s.variant = 1;
    }
#endif
    else {
        return;
    }

#if (GAME == GAME_SA2)
    s->graphics.size = 0;
#endif
    s->prevVariant = -1;
    s->x = I(p->qWorldX);
    s->y = I(p->qWorldY);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

#if (GAME == GAME_SA2)
    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else
#endif
    {
        s->palId = 0;
    }

    s->frameFlags =
#if (GAME == GAME_SA2)
        SPRITE_FLAG_MASK_18 |
#endif
        (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 4));

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

#if (GAME == GAME_SA1)
    if (IS_SINGLE_PLAYER || (gGameMode == GAME_MODE_RACE) || (gGameMode == GAME_MODE_MULTI_PLAYER)) {
        p->checkPointX = gSpawnPositions[level][0];
        p->checkPointY = gSpawnPositions[level][1];
    } else if (gGameMode == GAME_MODE_CHAO_HUNT) {
        s32 sioId = SIO_MULTI_CNT->id;
        p->checkPointX = gSpawnPositions_Modes_4_and_5[level - NUM_LEVEL_IDS_SP][sioId][0];
        p->checkPointY = gSpawnPositions_Modes_4_and_5[level - NUM_LEVEL_IDS_SP][sioId][1];
    } else if (gGameMode == GAME_MODE_TEAM_PLAY) {
        s32 sioId = SIO_MULTI_CNT->id;

        if (level == ACT_CHAO_HUNT_C) {
            p->checkPointX = gSpawnPositions_Modes_4_and_5[level - NUM_LEVEL_IDS_SP][SIO_MULTI_CNT->id][0];
            p->checkPointY = gSpawnPositions_Modes_4_and_5[level - NUM_LEVEL_IDS_SP][SIO_MULTI_CNT->id][1];
        } else {
            s32 sioMask = ((gMultiplayerConnections & (0x10 << sioId))) >> (sioId + 4);
            u32 i, pid;

            for (pid = 0, i = 0; i < sioId; i++) {
                u32 ithMask = ((gMultiplayerConnections & (0x10 << i))) >> (i + 4);
                if (ithMask == sioMask) {
                    pid++;
                }
            }

            if (sioMask == 0) {
                pid = -pid;
            }

            p->checkPointX = gSpawnPositions_Modes_4_and_5[level - NUM_LEVEL_IDS_SP][sioMask][0] + pid * 24;
            p->checkPointY = gSpawnPositions_Modes_4_and_5[level - NUM_LEVEL_IDS_SP][sioMask][1];
        }
    } else {
        switch (SIO_MULTI_CNT->id) {
            case 0: {
                p->checkPointX = 232;
                p->checkPointY = 829;
            } break;

            case 1: {
                p->checkPointX = 1585;
                p->checkPointY = 926;
            } break;

            case 2: {
                p->checkPointX = 232;
                p->checkPointY = 348;
            } break;

            case 3: {
                p->checkPointX = 1585;
                p->checkPointY = 279;
            } break;
        }
    }
#elif (GAME == GAME_SA2)
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        p->checkPointX = gSpawnPositions[level][0];
        p->checkPointY = gSpawnPositions[level][1];
    } else {
        p->checkPointX = 360 - (SIO_MULTI_CNT->id * 20);
        p->checkPointY = 177;
        p->qWorldX = -1;
        p->qWorldY = -1;
    }
#endif

    p->SA2_LABEL(unk98) = 0;
    p->checkpointTime = 0;

#if (GAME == GAME_SA1)
    if (playerID == 0)
#endif
    {
        p->spriteInfoBody = &gPlayerBodyPSI;
        p->spriteInfoLimbs = &gPlayerLimbsPSI;
    }
#if (GAME == GAME_SA1)
    else {
        p->spriteInfoBody = &gPartnerBodyPSI;
        p->spriteInfoLimbs = &gPartnerLimbsPSI;
    }
#endif
}
#endif

#if (GAME == GAME_SA1)
#define ALL_PLAYER_CONTROLS gPlayerControls.jump | gPlayerControls.attack
#elif (GAME == GAME_SA2)
#define ALL_PLAYER_CONTROLS gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick
#endif

void InitializePlayer(Player *p)
{
#if (GAME == GAME_SA1)
#if DEBUG
    p->character = gSelectedCharacter;
#endif
#endif

#if (GAME == GAME_SA1)
    p->qWorldX = Q(p->checkPointX);
#elif (GAME == GAME_SA2)
    if (
#ifndef COLLECT_RINGS_ROM
        (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) &&
#endif
        (((p->qWorldX & p->qWorldY) + 1) != 0)) {
        p->qWorldX = Q(460);
    } else {
        p->qWorldX = Q(p->checkPointX);
    }
#endif
    p->qWorldY = Q(p->checkPointY);

#if (GAME == GAME_SA2)
    p->callback = Player_TouchGround;
#endif

    p->heldInput = ALL_PLAYER_CONTROLS;
    p->frameInput = ALL_PLAYER_CONTROLS;

    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
    p->qSpeedGround = 0;
    p->moveState = MOVESTATE_IGNORE_INPUT;
    p->rotation = 0;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    p->SA2_LABEL(unk25) = 120;
    p->qSpindashAccel = 0;
    p->SA2_LABEL(unk29) = 0;
    p->SA2_LABEL(unk28) = 0;
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
    p->timerConfusion = 0;
    p->stoodObj = NULL;
    p->itemEffect = PLAYER_ITEM_EFFECT__NONE;
    p->SA2_LABEL(unk2A) = 0;
    p->SA2_LABEL(unk72) = TIME(0, 6);
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
    if ((p->playerID == PLAYER_1) && IS_SINGLE_PLAYER) {
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
            p->w.sf.SA2_LABEL(unkAE) = 0;
            p->w.sf.SA2_LABEL(unkB0) = 0;
        } break;

#if (GAME == GAME_SA2)
        case CHARACTER_CREAM: {
            p->w.cf.SA2_LABEL(unkAE) = 0;
            p->w.cf.flyingDuration = 0;
            p->w.cf.SA2_LABEL(unkB0) = 0;
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
            p->w.kf.SA2_LABEL(unkAE) = 0;
        } break;

        case CHARACTER_AMY: {
            p->w.af.flags = 0;
        } break;
    }
#if (GAME == GAME_SA2)
    gShouldSpawnMPAttackEffect = FALSE;
#endif
#endif

#if (GAME == GAME_SA2)
    gMPAttackEffect2Regs = NULL;
    gShouldSpawnMPAttack2Effect = FALSE;
#endif
}

#if (GAME == GAME_SA2)
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
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_SPINDASH | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_FLIP_WITH_MOVE_DIR);

    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;
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
#else
static inline void Player_TransitionCancelBoost(Player *p)
{
    p->moveState &= ~(MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_SPINDASH | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_FLIP_WITH_MOVE_DIR);

    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;
    p->unk71 = 0;
    p->unk70 = FALSE;
}
#endif
#endif

// Very similar to sub_8029BB8
s32 SA2_LABEL(sub_802195C)(Player *p, u8 *rot, s32 *out)
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

    r5 = SA2_LABEL(sub_801E4E4)(playerX2, playerY2, mask, -8, &anotherByte, SA2_LABEL(sub_801ED24));

    playerX = I(p->qWorldX) - (2 + p->spriteOffsetX);
    playerY = I(p->qWorldY) + (p->spriteOffsetY);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, &anotherByte2, SA2_LABEL(sub_801ED24));

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

// Very similar to SA2_LABEL(sub_802195C)
s32 SA2_LABEL(sub_8021A34)(Player *p, u8 *rot, s32 *out)
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

    r5 = SA2_LABEL(sub_801E4E4)(playerX2, playerY2, mask, +8, &anotherByte, SA2_LABEL(sub_801ED24));

    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);
    playerY = I(p->qWorldY) + (p->spriteOffsetY);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, +8, &anotherByte2, SA2_LABEL(sub_801ED24));

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

// Very similar to SA2_LABEL(sub_802195C)
s32 SA2_LABEL(sub_8021B08)(Player *p, u8 *rot, s32 *out)
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

    r5 = SA2_LABEL(sub_801E4E4)(playerY2, playerX2, mask, -8, &anotherByte, SA2_LABEL(sub_801EE64));

    playerY = I(p->qWorldY) - (p->spriteOffsetY);
    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->qSpeedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = SA2_LABEL(sub_801E4E4)(playerY, playerX, mask, -8, &anotherByte2, SA2_LABEL(sub_801EE64));

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

void SA2_LABEL(sub_8021BE0)(Player *p)
{
    if (!(p->moveState & MOVESTATE_200)) {
        if (!(p->moveState & MOVESTATE_800000)) {
#if (GAME == GAME_SA1)
            p->charState = 4;
#elif (GAME == GAME_SA2)
            PLAYERFN_SET(Player_TouchGround);
            p->moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
#endif
        }

        if (p->moveState & MOVESTATE_SPIN_ATTACK) {
            p->moveState &= ~MOVESTATE_SPIN_ATTACK;
            Player_HandleSpriteYOffsetChange(p, 14);
        }
        PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    }
#if (GAME == GAME_SA2)
    else {
        p->moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
    }
#endif

#if (GAME == GAME_SA1)
    p->moveState &= ~(MOVESTATE_20);
    p->moveState &= ~(MOVESTATE_100);
    p->moveState &= ~(MOVESTATE_SPINDASH);

    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;

    p->moveState &= ~(MOVESTATE_8000);

    if (p->character == CHARACTER_TAILS) {
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    }

    if (p->character == CHARACTER_AMY) {
        p->moveState &= ~(MOVESTATE_4000000 | MOVESTATE_2000000);
    }
#endif

    p->defeatScoreIndex = 0;

#if (GAME == GAME_SA1)
    Player_804726C(p);
    p->moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
#endif
}

void SA2_LABEL(sub_8021C4C)(Player *p)
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

    result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, 0, SA2_LABEL(sub_801ED24));

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

    result = SA2_LABEL(sub_801E4E4)(playerX2, playerY2, mask, +8, 0, SA2_LABEL(sub_801ED24));

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
    } else
#endif
    {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
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

            SA2_LABEL(sub_8021BE0)(p);

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

void SA2_LABEL(sub_8021DB8)(Player *p)
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

    result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, 0, SA2_LABEL(sub_801ED24));

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

    result = SA2_LABEL(sub_801E4E4)(playerX2, playerY2, mask, +8, 0, SA2_LABEL(sub_801ED24));

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
    } else
#endif
    {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
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

                SA2_LABEL(sub_8021BE0)(p);

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

void SA2_LABEL(sub_8021EE4)(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->layer;

    gravity = GRAVITY_IS_INVERTED;
#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    if (gravity) {
        s32 playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
        s32 playerY = I(p->qWorldY);
        result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask2, -8, NULL, SA2_LABEL(sub_801ED24));
    } else
#endif
#endif
#ifndef COLLECT_RINGS_ROM
        if (!gravity)
#endif
    {
        s32 playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
        s32 playerY = I(p->qWorldY);

        mask = mask2;
        if (p->qSpeedAirY < Q(3.0)) {
            mask |= 0x80;
        }
        result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, NULL, SA2_LABEL(sub_801ED24));
    }
#if (GAME == GAME_SA1)
    else {
        s32 playerX = I(p->qWorldX) - (3 + p->spriteOffsetX);
        s32 playerY = I(p->qWorldY);
        result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask2, -8, NULL, SA2_LABEL(sub_801ED24));
    }
#endif

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
        p->qSpeedGround = p->qSpeedAirY;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
    } else
#endif
    {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
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
            result = SA2_LABEL(sub_8029AC0)(p, &rotation, &fnOut);
        } else
#endif
        {
            result = SA2_LABEL(sub_8029B0C)(p, &rotation, &fnOut);
        }

        if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }
#endif

            p->qWorldY += Q(result);

            p->rotation = rotation;
            SA2_LABEL(sub_8021BE0)(p);

            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
    }
}

void SA2_LABEL(sub_802203C)(Player *p)
{
    u8 rotation;
    s32 fnOut;
    s32 result;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->layer;

    gravity = GRAVITY_IS_INVERTED;
#if (GAME == GAME_SA2) && !defined(COLLECT_RINGS_ROM)
    if (gravity) {
        s32 playerX = I(p->qWorldX) + (3 + p->spriteOffsetX);
        s32 playerY = I(p->qWorldY);
        result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask2, +8, NULL, SA2_LABEL(sub_801ED24));
    } else
#elif (GAME == GAME_SA1)
    if (!gravity)
#endif
    {
        s32 playerX = I(p->qWorldX) + (3 + p->spriteOffsetX);
        s32 playerY = I(p->qWorldY);

        mask = mask2;
        if (p->qSpeedAirY < Q(3.0)) {
            mask |= 0x80;
        }
        result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, +8, NULL, SA2_LABEL(sub_801ED24));
    }
#if (GAME == GAME_SA1)
    else
    {
        s32 playerX = I(p->qWorldX) + (3 + p->spriteOffsetX);
        s32 playerY = I(p->qWorldY);
        result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask2, +8, NULL, SA2_LABEL(sub_801ED24));
    }
#endif

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        p->qSpeedGround = p->qSpeedAirY;
    }

    ptr = &fnOut;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
    } else
#endif
    {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
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
            result = SA2_LABEL(sub_8029AC0)(p, &rotation, &fnOut);
        } else
#endif
        {
            result = SA2_LABEL(sub_8029B0C)(p, &rotation, &fnOut);
        }

        if (result <= 0) {
#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }
#endif
            p->qWorldY += Q(result);

            p->rotation = rotation;
            SA2_LABEL(sub_8021BE0)(p);

            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
    }
}

#if COLLECT_RINGS_ROM
static inline
#endif
    void
    SA2_LABEL(sub_8022190)(Player *p)
{
    s16 airY = p->qSpeedAirY;
#ifndef COLLECT_RINGS_ROM
    u8 arcResult = (GRAVITY_IS_INVERTED) ? 0x80 : 0;
#else
    u8 arcResult = 0;
#endif
    s16 airX = p->qSpeedAirX;

    if (airX || airY) {
        arcResult = I(ArcTan2(airX, airY));
    }

    arcResult = (arcResult - 0x20) & 0xC0;

    switch (arcResult >> 6) {
        case 0: {
            SA2_LABEL(sub_8021C4C)(p);
        } break;

        case 2: {
            SA2_LABEL(sub_8021DB8)(p);
        } break;

        case 1: {
            SA2_LABEL(sub_8021EE4)(p);
        } break;

        case 3: {
            SA2_LABEL(sub_802203C)(p);
        } break;
    }
}

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
void sub_8022218(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;

    if (GRAVITY_IS_INVERTED) {
        res = SA2_LABEL(sub_8029AC0)(p, &rotation, pSp04);
    } else {
        res = SA2_LABEL(sub_8029B0C)(p, &rotation, pSp04);
    }

    if (res <= 0) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->qWorldY += Q(res);
        p->rotation = rotation;
        SA2_LABEL(sub_8021BE0)(p);

        p->qSpeedAirY = 0;
        p->qSpeedGround = p->qSpeedAirX;
    }
}
#endif

void SA2_LABEL(sub_8022284)(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;
    s32 airY;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        res = SA2_LABEL(sub_8029B0C)(p, &rotation, pSp04);
    } else
#endif
    {
        res = SA2_LABEL(sub_8029AC0)(p, &rotation, pSp04);
    }

    if (res <= 0) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }
#endif

        p->qWorldY -= Q(res);
        p->rotation = rotation;
        SA2_LABEL(sub_8021BE0)(p);

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
#endif

#if COLLECT_RINGS_ROM
void sub_0200DBE0(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 sp08;
    s32 res;
    if (p->qSpeedAirY >= 0) {
        res = SA2_LABEL(sub_8029B0C)(p, &rotation, &sp04);
        if (res <= 0) {
            p->qWorldY += Q(res);
            p->rotation = rotation;
            SA2_LABEL(sub_8021BE0)(p);
            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
        SA2_LABEL(sub_8022284)(p);
    } else {
        SA2_LABEL(sub_8022284)(p);
        res = SA2_LABEL(sub_8029B0C)(p, &rotation, &sp08);
        if (res <= 0) {
            p->qWorldY += Q(res);
            p->rotation = rotation;
            SA2_LABEL(sub_8021BE0)(p);
            p->qSpeedAirY = 0;
            p->qSpeedGround = p->qSpeedAirX;
        }
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
void SA2_LABEL(sub_8022318)(Player *p)
{
    s32 offsetY;

    if (!(p->moveState & MOVESTATE_SPIN_ATTACK)) {
        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;
    } else {
        p->moveState &= ~MOVESTATE_SPIN_ATTACK;
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

#if (GAME == GAME_SA1)
    p->moveState &= ~MOVESTATE_8000;
#endif

    p->SA2_LABEL(unk25) = 120;
    p->SA2_LABEL(unk61) = 0;

    if (p->charState >= CHARSTATE_KNUCKLES_GLIDE) {
        p->charState = CHARSTATE_IDLE;
    }
}

void SA2_LABEL(sub_80223BC)(Player *p)
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
    result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, NULL, SA2_LABEL(sub_801ED24));

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
    result = SA2_LABEL(sub_801E4E4)(playerX2, playerY2, mask, +8, NULL, SA2_LABEL(sub_801ED24));

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        p->w.sf.flags |= 0x20;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
    } else {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
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
void SA2_LABEL(sub_80224DC)(Player *p)
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
    result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, NULL, SA2_LABEL(sub_801ED24));

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
    result = SA2_LABEL(sub_801E4E4)(playerX2, playerY2, mask, +8, NULL, SA2_LABEL(sub_801ED24));

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        p->w.sf.flags |= 0x20;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
    } else {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->qWorldY -= Q(result);

        p->qSpeedAirY = 0;
    }
}

void SA2_LABEL(sub_80225E8)(Player *p)
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
    result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, -8, NULL, SA2_LABEL(sub_801ED24));

    if (result <= 0) {
        p->qWorldX -= Q(result);
        p->qSpeedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    gravity = GRAVITY_IS_INVERTED;
    ptr = &fnOut;
    if (gravity) {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
    } else {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
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
            result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
        } else {
            result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
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
void SA2_LABEL(sub_8022710)(Player *p)
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
    result = SA2_LABEL(sub_801E4E4)(playerX, playerY, mask, +8, NULL, SA2_LABEL(sub_801ED24));

    if (result <= 0) {
        p->qWorldX += Q(result);
        p->qSpeedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    gravity = GRAVITY_IS_INVERTED;
    ptr = &fnOut;
    if (gravity) {
        result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
    } else {
        result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
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
            result = SA2_LABEL(sub_8029AC0)(p, &rotation, ptr);
        } else {
            result = SA2_LABEL(sub_8029B0C)(p, &rotation, ptr);
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

void SA2_LABEL(sub_8022838)(Player *p)
{
    s16 airX = p->qSpeedAirX;
    s16 airY = p->qSpeedAirY;
    u8 arcResult = 0;

    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
        p->w.sf.flags &= ~0x2;
        p->SA2_LABEL(unk29) = 0;
        p->SA2_LABEL(unk28) = 0;
    } else {
        arcResult = I(ArcTan2(airX, airY));

        arcResult = (arcResult - 0x20) & 0xC0;

        switch (arcResult >> 6) {
            case 0: {
                SA2_LABEL(sub_80223BC)(p);
            } break;

            case 2: {
                SA2_LABEL(sub_80224DC)(p);
            } break;

            case 1: {
                SA2_LABEL(sub_80225E8)(p);
            } break;

            case 3: {
                SA2_LABEL(sub_8022710)(p);
            } break;
        }
    }
}
#endif

void SA2_LABEL(sub_80228C0)(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
#ifndef NON_MATCHING
#if (GAME == GAME_SA1)
    register s32 resultA asm("sl");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4") = p->qWorldX;
    register s32 playerY asm("r9") = p->qWorldY;
    register s32 rot asm("r6") = p->rotation;
#elif (GAME == GAME_SA2)
    register s32 resultA asm("r6");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4") = p->qWorldX;
    register s32 playerY asm("sl") = p->qWorldY;
    register s32 rot asm("r1");
#endif
#else
    s32 resultA;
    u32 r0;
    s32 playerX = p->qWorldX;
    s32 playerY = p->qWorldY;
    s32 rot = p->rotation;
#endif
    u32 mask = p->layer;
    s32 py = I(playerY);

    resultA = SA2_LABEL(sub_801E4E4)(py + p->spriteOffsetY, (playerX = I(playerX)) - (2 + p->spriteOffsetX), mask, 8, &p->SA2_LABEL(unk28),
                                     SA2_LABEL(sub_801EE64));

    py = py + (p->spriteOffsetY);
    playerX += 2;
    playerX += p->spriteOffsetX;
    p29 = &p->SA2_LABEL(unk29);
    resultB = SA2_LABEL(sub_801E4E4)(py, playerX, mask, 8, p29, SA2_LABEL(sub_801EE64));

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
                r0 = p->SA2_LABEL(unk28);
            } else {
                r0 = p->SA2_LABEL(unk29);
            }
            rot = r0;
        } else /* val >= 0 */ {
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
                    r0 = p->SA2_LABEL(unk28);
                } else {
                    r0 = p->SA2_LABEL(unk29);
                }
                rot = r0;
            } else
#if (GAME == GAME_SA1)
                if (p->moveState & MOVESTATE_ICE_SLIDE) {
                playerY += Q(val);
            } else
#endif
            {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->SA2_LABEL(unk28);
        } else {
            r0 = p->SA2_LABEL(unk29);
        }
        rot = r0;
    }

    p->qWorldY = playerY;

    if (!(rot & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = rot;
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = -r1)
            rot = *pRot;
            asm("" ::"r"(rot));
            r0 = rot;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            rot = r0 >> 24;
            asm("" ::"r"(r0), "r"(rot));
            r0 = rot;
            r0 -= 0x40;

            *pRot = r0;
        }
#endif
    }
}

// Similar to SA2_LABEL(sub_80228C0), SA2_LABEL(sub_8022B18)
void SA2_LABEL(sub_80229EC)(Player *p)
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

    resultA = SA2_LABEL(sub_801E4E4)(py - p->spriteOffsetY, (playerX = I(playerX)) + (2 + p->spriteOffsetX), mask, -8, &p->SA2_LABEL(unk28),
                                     SA2_LABEL(sub_801EE64));

    py = py - (p->spriteOffsetY);
    playerX -= 2;
    playerX -= p->spriteOffsetX;
    p29 = &p->SA2_LABEL(unk29);
    resultB = SA2_LABEL(sub_801E4E4)(py, playerX, mask, -8, p29, SA2_LABEL(sub_801EE64));

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
                r0 = p->SA2_LABEL(unk28);
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
                    r0 = p->SA2_LABEL(unk28);
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
            r0 = p->SA2_LABEL(unk28);
        } else {
            r0 = p->SA2_LABEL(unk29);
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

// Similar to SA2_LABEL(sub_80228C0), SA2_LABEL(sub_80229EC)
void SA2_LABEL(sub_8022B18)(Player *p)
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

    resultA = SA2_LABEL(sub_801E4E4)(py - p->spriteOffsetY, (playerY = I(playerY)) - (2 + p->spriteOffsetX), mask, -8, &p->SA2_LABEL(unk28),
                                     SA2_LABEL(sub_801ED24));

    py = py - (p->spriteOffsetY);
    playerY += 2;
    playerY += p->spriteOffsetX;
    p29 = &p->SA2_LABEL(unk29);
    resultB = SA2_LABEL(sub_801E4E4)(py, playerY, mask, -8, p29, SA2_LABEL(sub_801ED24));

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
                r0 = p->SA2_LABEL(unk28);
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
                    r0 = p->SA2_LABEL(unk28);
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
            r0 = p->SA2_LABEL(unk28);
        } else {
            r0 = p->SA2_LABEL(unk29);
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

// Similar to SA2_LABEL(sub_80228C0), SA2_LABEL(sub_80229EC), SA2_LABEL(sub_8022B18)
void SA2_LABEL(sub_8022C44)(Player *p)
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

    resultA = SA2_LABEL(sub_801E4E4)(py + p->spriteOffsetY, (playerY = I(playerY)) + (2 + p->spriteOffsetX), mask, +8, &p->SA2_LABEL(unk28),
                                     SA2_LABEL(sub_801ED24));

    py = py + (p->spriteOffsetY);
    playerY -= 2;
    playerY -= p->spriteOffsetX;
    resultB = SA2_LABEL(sub_801E4E4)(py, playerY, mask, +8, &p->SA2_LABEL(unk29), SA2_LABEL(sub_801ED24));

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
                r0 = p->SA2_LABEL(unk28);
            } else {
                r0 = p->SA2_LABEL(unk29);
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
                    r0 = p->SA2_LABEL(unk28);
                } else {
                    r0 = p->SA2_LABEL(unk29);
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->SA2_LABEL(unk28);
        } else {
            r0 = p->SA2_LABEL(unk29);
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

void SA2_LABEL(sub_8022D6C)(Player *p)
{
#if (GAME == GAME_SA1) && !defined(BUG_FIX)
    u8 r1;
#else
    u8 r1 = 0;
#endif
    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
        p->SA2_LABEL(unk29) = 0;
        p->SA2_LABEL(unk28) = 0;
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
            SA2_LABEL(sub_80228C0)(p);

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
                SA2_LABEL(sub_80228C0)(p);
            } break;

            case 2: {
                SA2_LABEL(sub_80229EC)(p);
            } break;

            case 1: {
                SA2_LABEL(sub_8022B18)(p);
            } break;

            case 3: {
                SA2_LABEL(sub_8022C44)(p);
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
                SA2_LABEL(sub_80228C0)(p);
            } break;

            case 2: {
                SA2_LABEL(sub_80229EC)(p);
            } break;

            case 1: {
                SA2_LABEL(sub_8022B18)(p);
            } break;

            case 3: {
                SA2_LABEL(sub_8022C44)(p);
            } break;
        }
    }
}

#if (GAME == GAME_SA1)
// Basically the opposite to Player_8043A2C.
// Uses the same variables, but checks are inverted.
// Player_WalkLeft ?
void Player_8043970(Player *p)
{
#ifndef NON_MATCHING
    register s32 qSpeedGround asm("r5") = p->qSpeedGround;
#else
    s32 qSpeedGround = p->qSpeedGround;
#endif
    s32 qMaxSpeed = p->maxSpeed;
    s32 qAcceleration = p->acceleration;
    s32 qDeceleration = p->deceleration;

    if (qSpeedGround <= Q(0)) {
        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            p->moveState &= ~MOVESTATE_20;
            p->charState = CHARSTATE_22;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }

        p->moveState |= MOVESTATE_FACING_LEFT;

        qSpeedGround -= qAcceleration;

        if (qSpeedGround < -qMaxSpeed) {
            qSpeedGround += qAcceleration;

            if (qSpeedGround > -qMaxSpeed) {
                qSpeedGround = -qMaxSpeed;
            }

            p->qSpeedGround = qSpeedGround;
        } else {
            p->qSpeedGround = qSpeedGround;
        }

        if (!(p->moveState & (MOVESTATE_800000 | MOVESTATE_8000))) {
            if (p->charState != 22) {
                p->charState = CHARSTATE_WALK_A;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            }
        }
    } else {
        qSpeedGround -= qDeceleration;

        if (qSpeedGround < Q(0)) {
            qSpeedGround = -Q(96. / 256.);
        }

        p->qSpeedGround = qSpeedGround;

        if (qSpeedGround < Q(3)) {
            return;
        }

        m4aSongNumStart(SE_BRAKE);

        p->charState = CHARSTATE_BRAKE;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }
}

// Basically the opposite to Player_8043970.
// Uses the same variables, but checks are inverted.
// Player_WalkRight?
void Player_8043A2C(Player *p)
{
#ifndef NON_MATCHING
    register s32 qSpeedGround asm("r5") = p->qSpeedGround;
#else
    s32 qSpeedGround = p->qSpeedGround;
#endif
    s32 qMaxSpeed = p->maxSpeed;
    s32 qAcceleration = p->acceleration;
    s32 qDeceleration = p->deceleration;

    if (qSpeedGround >= Q(0)) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->moveState &= ~MOVESTATE_20;
            p->charState = CHARSTATE_22;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }

        p->moveState &= ~MOVESTATE_FACING_LEFT;

        qSpeedGround += qAcceleration;

        if (qSpeedGround > +qMaxSpeed) {
            qSpeedGround -= qAcceleration;

            if (qSpeedGround < +qMaxSpeed) {
                qSpeedGround = +qMaxSpeed;
            }

            p->qSpeedGround = qSpeedGround;
        } else {
            p->qSpeedGround = qSpeedGround;
        }

        if (!(p->moveState & (MOVESTATE_800000 | MOVESTATE_8000))) {
            if (p->charState != 22) {
                p->charState = CHARSTATE_WALK_A;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            }
        }
    } else {
        qSpeedGround += qDeceleration;

        if (qSpeedGround > Q(0)) {
            qSpeedGround = +Q(96. / 256.);
        }

        p->qSpeedGround = qSpeedGround;

        if (qSpeedGround > -Q(3)) {
            return;
        }

        m4aSongNumStart(SE_BRAKE);

        p->charState = CHARSTATE_BRAKE;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }
}
#endif

// (100.00%) https://decomp.me/scratch/U0r54
s32 SA2_LABEL(sub_8022F58)(u8 param0, Player *p)
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

    p->SA2_LABEL(unk29) = param0;
    p->SA2_LABEL(unk28) = param0;

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
            fnRes = SA2_LABEL(sub_8029BB8)(p, ptr, &sp4[0]);
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
            fnRes = SA2_LABEL(sub_802195C)(p, ptr, &sp4[1]);
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
            fnRes = SA2_LABEL(sub_8021B08)(p, ptr, &sp4[2]);
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
            fnRes = SA2_LABEL(sub_8021A34)(p, ptr, &sp4[3]);
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

s32 SA2_LABEL(sub_802302C)(u8 param0, Player *p)
{
    s32 r3;
    u32 r0;
    s32 result;
    u32 temp;

    s32 px = I(p->qWorldX);
    s32 py = I(p->qWorldY);

    p->SA2_LABEL(unk29) = param0;
    r3 = (s8)param0;
#ifndef NON_MATCHING
    p->SA2_LABEL(unk28) = ((u32)param0 << 0x18) >> 0x18;
#else
    p->SA2_LABEL(unk28) = param0;
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
            result = SA2_LABEL(sub_801E4E4)(y + p->spriteOffsetX, px, p->layer, +8, NULL, SA2_LABEL(sub_801EE64));
        } break;

        case 2: {
            s32 y = py - 2;
            result = SA2_LABEL(sub_801E4E4)(y - p->spriteOffsetX, px, p->layer, -8, NULL, SA2_LABEL(sub_801EE64));
        } break;

        case 1: {
            s32 x = (px - 2);
            result = SA2_LABEL(sub_801E4E4)(x - p->spriteOffsetX, py, p->layer, -8, NULL, SA2_LABEL(sub_801ED24));
        } break;

        case 3: {
            s32 x = (px + 2);
            result = SA2_LABEL(sub_801E4E4)(x + p->spriteOffsetX, py, p->layer, +8, NULL, SA2_LABEL(sub_801ED24));
        } break;

        default: {
            result = 0;
        }
    }

    return result;
}

void SA2_LABEL(sub_8023128)(Player *p)
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

    r2 = Q(SA2_LABEL(sub_802302C)(r5, p));

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
#if (GAME == GAME_SA1)
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
#endif
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
#if (GAME == GAME_SA1)
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
#endif
                p->qSpeedGround = 0;
            } break;
        }

        p->SA2_LABEL(unk62) = 0;
        p->SA2_LABEL(unk63) = 0;
    }
}

void SA2_LABEL(sub_80231C0)(Player *p)
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

    r2 = Q(SA2_LABEL(sub_802302C)(r5, p));

    if (r2 <= 0) {
        switch (((r5 + Q(0.125)) & 0xC0) >> 6) {

            case 0: {
                p->qWorldY += r2;
                p->qSpeedAirY = 0;
            } break;

            case 1: {
                p->qWorldX -= r2;
                p->qSpeedAirX = 0;
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;

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
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                p->qSpeedGround = 0;
            } break;
        }
    }
}

// These don't appear to be in SA2
#if (GAME == GAME_SA1)
void Player_8043DDC(Player *p)
{
    if (p->SA2_LABEL(unk2A) == 0) {
        s32 qSpeedGround;
        if ((p->heldInput & DPAD_SIDEWAYS) != DPAD_RIGHT) {
            if ((p->heldInput & DPAD_SIDEWAYS) == DPAD_LEFT) {
                qSpeedGround = p->qSpeedGround;

                if (qSpeedGround <= Q(0)) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                } else {
                    qSpeedGround -= Q(24. / 256.);

                    if (qSpeedGround < Q(0)) {
                        qSpeedGround = -Q(96. / 256.);
                        qSpeedGround = qSpeedGround;
                    }

                    p->qSpeedGround = qSpeedGround;
                }
            }
        } else {
            // _08043E14
            qSpeedGround = p->qSpeedGround;

            if (qSpeedGround >= 0) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else {
                qSpeedGround += Q(24. / 256.);

                if (qSpeedGround > Q(0)) {
                    qSpeedGround = +Q(96. / 256.);
                    qSpeedGround = qSpeedGround;
                }

                p->qSpeedGround = qSpeedGround;
            }
        }
    }

    {
        s32 qHalfAccel = (p->acceleration >> 1);
        s32 qSpeedGround = p->qSpeedGround;
        if (qSpeedGround < 0) {
            qSpeedGround += qHalfAccel;
            if (qSpeedGround > Q(0)) {
                qSpeedGround = Q(0);
            }

            p->qSpeedGround = qSpeedGround;
        } else if (qSpeedGround > 0) {
            qSpeedGround -= qHalfAccel;
            if (qSpeedGround < Q(0)) {
                qSpeedGround = Q(0);
            }

            p->qSpeedGround = qSpeedGround;
        }

        if (qSpeedGround == 0) {
            if (!(p->moveState & MOVESTATE_200)) {
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;

                if (p->heldInput & DPAD_DOWN) {
                    p->charState = CHARSTATE_CROUCH;
                } else {
                    p->charState = CHARSTATE_WALK_A;
                }

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
            } else {
                qSpeedGround = Q(3);

                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    qSpeedGround = -qSpeedGround;
                }

                p->qSpeedGround = qSpeedGround;
                m4aSongNumStart(SE_SPIN_ATTACK);
            }
        }
    }

    Player_80470AC(p);
    SA2_LABEL(sub_8023128)(p);
}
#endif

#if (GAME == GAME_SA2)
void SA2_LABEL(sub_8023260)(Player *p)
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
#endif

void SA2_LABEL(sub_80232D0)(Player *p)
{
    Camera *cam = &gCamera;
    s32 qWorldX = p->qWorldX;
    s32 qWorldY = p->qWorldY;
    s32 unkX, unkY;

#ifndef COLLECT_RINGS_ROM
    if (p->playerID == PLAYER_1) {
#if (GAME == GAME_SA2)
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gCurrentLevel & 0x2) {
                unkX = SA2_LABEL(gUnknown_080D650C)[gCurrentLevel][0];
                if ((unkX >= 0) && (qWorldX >= Q(unkX))) {
                    s32 ix = SA2_LABEL(gUnknown_080D661C)[gCurrentLevel][0];
                    s32 iy = SA2_LABEL(gUnknown_080D661C)[gCurrentLevel][1];

                    qWorldX += Q(ix);
                    qWorldY += Q(iy);

                    if (gCheese != NULL) {
                        gCheese->posX += Q(ix);
                        gCheese->posY += Q(iy);
                    }

                    gWorldSpeedX = Q(ix);
                    gWorldSpeedY = Q(iy);

                    sub_8039F14(Q(ix), Q(iy));

                    gBossRingsShallRespawn = TRUE;

                    cam->x += ix;
                    cam->SA2_LABEL(unk20) += ix;
                    cam->SA2_LABEL(unk10) += ix;
                    cam->y += iy;
                    cam->SA2_LABEL(unk24) += iy;
                    cam->unk14 += iy;
                }
            }
        } else if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT))
#endif
        {
            unkX = SA2_LABEL(gUnknown_080D650C)[gCurrentLevel][0];
            if ((unkX >= 0) && (qWorldX >= Q(unkX)) && (cam->SA2_LABEL(unk8) != 0) && !(cam->SA2_LABEL(unk50) & 0x1)) {
                s32 ix = SA2_LABEL(gUnknown_080D661C)[gCurrentLevel][0];
                qWorldX += Q(ix);

#if (GAME == GAME_SA1)
                if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
                    gPartner.qWorldX += Q(ix);
                }
#endif
                cam->x += ix;
                cam->SA2_LABEL(unk20) += ix;
#if (GAME == GAME_SA2)
                cam->SA2_LABEL(unk10) += ix;
                if (gCheese != NULL) {
                    gCheese->posX += Q(ix);
                }
#endif
            }

            unkY = SA2_LABEL(gUnknown_080D650C)[gCurrentLevel][1];
            if ((unkY >= 0) && (qWorldY >= Q(unkY)) && (cam->SA2_LABEL(unkC) != 0) && !(cam->SA2_LABEL(unk50) & 0x2)) {
                s32 iy = SA2_LABEL(gUnknown_080D661C)[gCurrentLevel][1];
                s32 worldY = iy * CAM_REGION_WIDTH;
                qWorldY += Q(worldY);

#if (GAME == GAME_SA1)
                if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
                    gPartner.qWorldY += Q(worldY);
                }
#endif

#if (GAME == GAME_SA1)
                // TODO: look at the data and determine if using `worldY` in sa1 was a bug
                cam->y += worldY;
                cam->SA2_LABEL(unk24) += worldY;
#elif (GAME == GAME_SA2)
                cam->y += Q(iy);
                cam->SA2_LABEL(unk24) += Q(iy);
                if (gCheese != NULL) {
                    gCheese->posY += Q(worldY);
                }
#endif
            }
        }
    }
#endif
    if ((p->moveState & (MOVESTATE_80000000 | MOVESTATE_DEAD)) != MOVESTATE_DEAD) {
#if (GAME == GAME_SA2)
        s32 camMinY, camMaxY;
#endif
        s32 qNoclipWorldX, qNoclipWorldY;
        Camera *cam2 = &gCamera;
        s32 qPlayerY = p->qWorldY;

        if (!(p->moveState & MOVESTATE_80000000)) {
            bool32 outOfBounds;
            // These blocks are basically the same but the gravity check was swapped in SA2
            // TODO: match without gotos
#if (GAME == GAME_SA1)
            if (!(gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                if (qPlayerY >= Q(cam2->maxY) - 1) {
                    outOfBounds = TRUE;
                    goto lab;
                }
            } else if ((gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                if (qPlayerY <= Q(cam2->minY)) {
                    outOfBounds = TRUE;
                    goto lab;
                }
            }

            outOfBounds = FALSE;
        lab:
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                if (qPlayerY > Q(gCamera.minY)) {
                    goto lbl0;
                } else {
                    outOfBounds = TRUE;
                }
            } else {
                s32 qMaxY = Q(cam2->maxY) - 1;

                outOfBounds = 1;

                if (qPlayerY < qMaxY) {
                lbl0:
                    outOfBounds = FALSE;
                }
            }
#else
            {
                s32 qMaxY = Q(cam2->maxY) - 1;

                outOfBounds = FALSE;

                if (qPlayerY >= qMaxY) {
                lbl0:
                    outOfBounds = TRUE;
                }
            }
#endif
#endif
            if (outOfBounds) {
                p->moveState |= MOVESTATE_DEAD;

#ifndef COLLECT_RINGS_ROM
                if (p->moveState & MOVESTATE_IN_WATER) {
                    p->qSpeedAirY = -Q(PLAYER_JUMP_HEIGHT_UNDER_WATER);
                } else
#endif
                {
                    p->qSpeedAirY = -Q(PLAYER_JUMP_HEIGHT);
                }
#if (GAME == GAME_SA1)
                if (!(gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                    qWorldY = Q(cam->maxY) - 1;
                } else {
                    qWorldY = Q(cam->minY);
                }
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
                qWorldY = GRAVITY_IS_INVERTED ? Q(cam->minY) : Q(cam->maxY) - 1;
#else
                qWorldY = Q(cam->maxY) - 1;
#endif
#endif
            }
        }

#if (GAME == GAME_SA2)
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            camMinY = gBossCameraClampYLower;
            camMaxY = gBossCameraClampYUpper;
        } else {
            camMinY = cam->minY;
            camMaxY = cam->maxY;
        }
#endif

        qNoclipWorldX = qWorldX;
        qNoclipWorldY = qWorldY;

        qWorldX = CLAMP(qWorldX, Q(cam->minX), Q(cam->maxX) - 1);
#if (GAME == GAME_SA1)
        qWorldY = CLAMP(qWorldY, Q(cam->minY), Q(cam->maxY) - 1);
#elif (GAME == GAME_SA2)
        qWorldY = CLAMP(qWorldY, Q(camMinY), Q(camMaxY) - 1);
#endif
        if (qWorldX != qNoclipWorldX) {
            p->qSpeedAirX = Q(0);
            p->qSpeedGround = Q(0);
        }

        if (qWorldY != qNoclipWorldY) {
            p->qSpeedAirY = Q(0);
            p->qSpeedGround = Q(0);
        }

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            s32 qPXMin = (Q(cam->SA2_LABEL(unk10)));
            if (qWorldX < qPXMin + Q(8.0)) {
                qWorldX = qPXMin + Q(8.0);
                p->qSpeedGround = BOSS_VELOCITY_X;
                p->qSpeedAirX = BOSS_VELOCITY_X;

                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if (qWorldX > (qPXMin + Q(312.0))) {
                qWorldX = (qPXMin + Q(312.0));
                p->qSpeedGround = BOSS_VELOCITY_X;
                p->qSpeedAirX = BOSS_VELOCITY_X;
            }
        }
#endif
#endif

        p->qWorldX = qWorldX;
        p->qWorldY = qWorldY;
    }
}

#if (GAME == GAME_SA1)
bool32 Player_TrySpindash(Player *p)
{
    if (!(p->moveState & MOVESTATE_SPINDASH)) {
        if ((p->charState != CHARSTATE_CROUCH) || !(p->frameInput & gPlayerControls.jump)) {
            return FALSE;
        }

        p->charState = CHARSTATE_SPINDASH;
        m4aSongNumStart(SE_SPIN_ATTACK);
        CreateSpindashDustEffect();

        p->moveState |= MOVESTATE_SPINDASH;

        {
#ifndef NON_MATCHING
            s16 qInitialAccel;
            asm("mov %0, #0\n" : "=r"(qInitialAccel));
            p->qSpindashAccel = qInitialAccel;
#else
            p->qSpindashAccel = Q(0);
#endif
        }

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
    } else {
        if (!(p->heldInput & DPAD_DOWN)) {
            s32 qNewSpeed;

            p->moveState &= ~MOVESTATE_SPINDASH;

            qNewSpeed = !(p->moveState & MOVESTATE_2000) //
                ? gUnknown_084AE188[I(p->qSpindashAccel)]
                : gUnknown_084AE19A[I(p->qSpindashAccel)];

            if (p->playerID == PLAYER_1) {
                gCamera.SA2_LABEL(unk40) = 10;
            }

            if (p->moveState & MOVESTATE_FACING_LEFT) {
                qNewSpeed = -qNewSpeed;
            }

            p->qSpeedGround = qNewSpeed;
            p->moveState |= MOVESTATE_SPIN_ATTACK;

            m4aSongNumStart(SE_SPINDASH_RELEASE);
            p->charState = CHARSTATE_SPINATTACK;
        } else {
            s16 qNewAccel = p->qSpindashAccel;

            s16 qNewAccel2 = qNewAccel;
            if (qNewAccel2 != Q(0)) {
                qNewAccel = qNewAccel2 - (I(qNewAccel << 3));

                if (qNewAccel <= Q(0)) {
                    qNewAccel = Q(0);
                }
            }

            if (p->charState != CHARSTATE_7) {
                p->charState = CHARSTATE_SPINDASH;
            }

            if (p->frameInput & gPlayerControls.jump) {
                struct MP2KPlayerState *mPlayerInfo;
                m4aSongNumStart(SE_SPIN_ATTACK);

                mPlayerInfo = gMPlayTable[gSongTable[SE_SPIN_ATTACK].ms].info;
                m4aMPlayImmInit(mPlayerInfo);
                m4aMPlayPitchControl(mPlayerInfo, 0xFFFF, (qNewAccel & ~0x7F));

                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if ((p->character == CHARACTER_SONIC) || (p->character == CHARACTER_KNUCKLES)) {
                        p->charState = CHARSTATE_7;
                    }
                }

                qNewAccel += Q(2.0);
                qNewAccel = MAX(qNewAccel, Q(8.0));
            }
            p->qSpindashAccel = qNewAccel;
        }

        Player_804726C(p);
        Player_8047280(p);
    }

    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8022D6C)(p);

    return TRUE;
}

bool32 Player_TryJump(Player *p)
{
    u8 rot = p->rotation;
    s32 r5 = 0;
    s32 theta;

    if (!(p->frameInput & gPlayerControls.jump)) {
        return FALSE;
    }

    if (GRAVITY_IS_INVERTED) {
        rot += Q(0.25);
        rot = -rot;
        rot -= Q(0.25);
    }

    if (SA2_LABEL(sub_8022F58)(rot + Q(0.50), p) < 4) {
        return FALSE;
    }

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    p->moveState |= MOVESTATE_100;
    p->moveState &= ~(MOVESTATE_ICE_SLIDE);

    switch (p->character) {
        case CHARACTER_SONIC:
        case CHARACTER_TAILS:
        case CHARACTER_KNUCKLES: {
            p->charState = CHARSTATE_SPINATTACK;
            if (p->moveState & MOVESTATE_IN_WATER) {
                r5 = 0x2A0;
            } else {
                r5 = 0x4E0;
            }
        } break;

        case CHARACTER_AMY: {
            if (!(p->heldInput & DPAD_DOWN)) {
                p->charState = CHARSTATE_85;
                if (p->moveState & MOVESTATE_IN_WATER) {
                    r5 = 0x2A0;
                } else {
                    r5 = 0x4E0;
                }
            } else {
                s32 r2;
                p->charState = CHARSTATE_91;
                p->moveState &= ~MOVESTATE_2000000;
                p->moveState |= MOVESTATE_4000000;
                p->moveState &= ~MOVESTATE_100;
                p->w.af.flags = 2;
                if (p->moveState & MOVESTATE_IN_WATER) {
                    r2 = Q(2.50);
                    r5 = Q(0.75);
                } else {
                    r2 = Q(4.00);
                    r5 = Q(1.25);
                }
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->qSpeedAirX = Q_MUL_NEG(r2, COS_24_8(p->rotation * 4));
                    p->qSpeedAirY = Q_MUL_NEG(r2, SIN_24_8(p->rotation * 4));
                } else {
                    p->qSpeedAirX = +Q_MUL(r2, COS_24_8(p->rotation * 4));
                    p->qSpeedAirY = +Q_MUL(r2, SIN_24_8(p->rotation * 4));
                }
            }
        } break;
    }

    rot = p->rotation - Q(0.25);
    p->qSpeedAirX += Q_MUL(r5, COS_24_8(rot * 4));
    p->qSpeedAirY += Q_MUL(r5, SIN_24_8(rot * 4));

    m4aSongNumStart(SE_JUMP);

    if (p->character != CHARACTER_AMY) {
        if (!(p->moveState & MOVESTATE_SPIN_ATTACK)) {
            p->moveState |= MOVESTATE_SPIN_ATTACK;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            p->moveState |= MOVESTATE_FLIP_WITH_MOVE_DIR;
        }
    }

    return TRUE;
}

// (98.55%) https://decomp.me/scratch/lAHT0
NONMATCH("asm/non_matching/game/sa1/stage/Player__sub_8044434.inc", bool32 sub_8044434(Player *p))
{
    u8 rot = p->rotation;
    s32 r2 = 0;

    if (!(p->frameInput & gPlayerControls.jump)) {
        return FALSE;
    }

    if (GRAVITY_IS_INVERTED) {
        rot += Q(0.25);
        rot = -rot;
        rot -= Q(0.25);
    }

    p->layer ^= 1;

    if (SA2_LABEL(sub_8022F58)(rot + Q(0.50), p) < 4) {
        p->layer ^= 1;
        return FALSE;
    }

    if (gPlayer.character == CHARACTER_AMY) {
        m4aSongNumStop(SE_AMY_GRINDING);
    } else {
        m4aSongNumStop(SE_GRINDING);
    }

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    p->moveState |= MOVESTATE_100;
    p->moveState &= ~(MOVESTATE_ICE_SLIDE);

    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

    switch (p->character) {
        case CHARACTER_SONIC:
        case CHARACTER_TAILS:
        case CHARACTER_KNUCKLES: {
            p->charState = CHARSTATE_SPINATTACK;
        } break;

        case CHARACTER_AMY: {
            p->charState = CHARSTATE_85;
        } break;
    }

    if (p->moveState & MOVESTATE_IN_WATER) {
        r2 = Q(2.625);
    } else {
        r2 = Q(4.875);
    }

    rot = p->rotation - Q(0.25);
    p->qSpeedAirY = Q_MUL(r2, SIN_24_8(rot * 4));
    m4aSongNumStart(SE_JUMP);

    SPRITE_FLAG_CLEAR(&p->spriteInfoBody->s, PRIORITY);
    SPRITE_FLAG_SET_VALUE(&p->spriteInfoBody->s, PRIORITY, 2);
    SPRITE_FLAG_CLEAR(&p->spriteInfoLimbs->s, PRIORITY);
    SPRITE_FLAG_SET_VALUE(&p->spriteInfoLimbs->s, PRIORITY, 2);

    if (p->character != CHARACTER_AMY) {
        if (!(p->moveState & MOVESTATE_SPIN_ATTACK)) {
            p->moveState |= MOVESTATE_SPIN_ATTACK;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            p->moveState |= MOVESTATE_FLIP_WITH_MOVE_DIR;
        }
    }

    return TRUE;
}
END_NONMATCH
#endif // (GAME == GAME_SA1)

void Player_AirInputControls(Player *p)
{
    s32 r5 = p->acceleration * 2;
#if (GAME == GAME_SA1)
    s32 r6 = p->maxSpeed;
#elif (GAME == GAME_SA2)
    s32 r6 = p->topSpeed;
#endif

    if ((p->charState != CHARSTATE_HIT_AIR)) {
        if (!(p->moveState & MOVESTATE_FLIP_WITH_MOVE_DIR)) {
            s16 qAirSpeedS;
            u16 qAirSpeedU = p->qSpeedAirX;

            if (p->heldInput & DPAD_LEFT) {
#if (GAME == GAME_SA1) && !defined(NON_MATCHING)
                qAirSpeedS = qAirSpeedU;
#endif
                if ((p->charState != CHARSTATE_BOUNCE)
#if (GAME == GAME_SA2)
                    && !(p->moveState & MOVESTATE_2000)
#endif
                ) {
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
                if ((p->charState != CHARSTATE_BOUNCE)
#if (GAME == GAME_SA2)
                    && !(p->moveState & MOVESTATE_2000)
#endif
                ) {
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
#if (GAME == GAME_SA1) && !defined(NON_MATCHING)
            p->qSpeedAirX = (r5 = qAirSpeedU);
#else
            p->qSpeedAirX = qAirSpeedU;
#endif
        }

#if (GAME == GAME_SA1)
        if ((u16)p->qSpeedAirY > (u16)(-Q(67) - 1)) {
            s16 qSpeedAirX = p->qSpeedAirX;
            s16 qSpeedAirXFrac = p->qSpeedAirX >> 5;
            if (qSpeedAirXFrac < 0) {
                qSpeedAirX -= qSpeedAirXFrac;
                if (qSpeedAirX > 0) {
                    qSpeedAirX = 0;
                }

                p->qSpeedAirX = qSpeedAirX;
            } else if (qSpeedAirXFrac > 0) {
                qSpeedAirX -= qSpeedAirXFrac;

                if (qSpeedAirX < 0)
                    qSpeedAirX = 0;

                p->qSpeedAirX = qSpeedAirX;
            }
        }
#endif
    }
}

#if (GAME == GAME_SA1)
void Player_8044670(Player *p)
{
    s16 r4 = (!(p->moveState & MOVESTATE_IN_WATER)) ? -Q(3.0) : -Q(1.5);

    if (p->moveState & MOVESTATE_100) {
        if (p->qSpeedAirY < r4) {
            if (!(p->heldInput & gPlayerControls.jump)) {
                p->qSpeedAirY = r4;
            }
        } else {
            // Init mid-air action, if Jump button pressed
            if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->SA2_LABEL(unk61) == 0) && (p->frameInput & gPlayerControls.jump)
                && (p->charState != CHARSTATE_HIT_AIR)) {
                p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                p->SA2_LABEL(unk61) = 1;

                switch (p->character) {
                    case CHARACTER_SONIC: {
                        Player_Sonic_InitInstaShield(p);
                    } break;

                    case CHARACTER_TAILS: {
                        Player_Tails_InitFlying(p);
                    } break;

                    case CHARACTER_KNUCKLES: {
                        Player_Knuckles_InitGlide(p);
                    } break;

                    case CHARACTER_AMY: {
                        ;
                    } break;
                }
            }
        }
    } else if (!(p->moveState & MOVESTATE_200)) {
        if (p->qSpeedAirY < -Q(11.8125)) {
            p->qSpeedAirY = -Q(11.8125);
        }
    }
}

void Player_8044750(Player *p)
{
    Camera *cam = &gCamera;

    if ((p->SA2_LABEL(unk25) == 0) || (--p->SA2_LABEL(unk25) == 0)) {
        if (p->playerID == PLAYER_1) {
            if (!(gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                if (cam->SA2_LABEL(unk4C) + cam->shiftY > -72) {
                    cam->SA2_LABEL(unk4C) -= 2;
                }
            } else {
                if (cam->SA2_LABEL(unk4C) + cam->shiftY < 72) {
                    cam->SA2_LABEL(unk4C) += 2;
                }
            }
        }
    } else if (p->playerID == PLAYER_1) {
        if (cam->SA2_LABEL(unk4C) > 0) {
            cam->SA2_LABEL(unk4C) -= 2;
        } else if (cam->SA2_LABEL(unk4C) < 0) {
            cam->SA2_LABEL(unk4C) += 2;
        }
    }
}

// TODO: Look up|down function?
// (98.79%) https://decomp.me/scratch/yy7rw
NONMATCH("asm/non_matching/game/sa1/stage/Player__Player_80447D8.inc", void Player_80447D8(Player *p))
{
    Camera *cam = &gCamera;

    p->charState = CHARSTATE_CROUCH;

    if (p->qSpeedGround == 0) {
        if ((p->SA2_LABEL(unk25) == 0) || (--p->SA2_LABEL(unk25) == 0)) {
            if (p->playerID == PLAYER_1) {
                if (!(gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                    if (cam->SA2_LABEL(unk4C) + cam->shiftY < +60) {
                        cam->SA2_LABEL(unk4C) += 2;
                    }
                } else {
                    if (cam->SA2_LABEL(unk4C) + cam->shiftY > -60) {
                        cam->SA2_LABEL(unk4C) -= 2;
                    }
                }
            }
        } else if (p->playerID == PLAYER_1) {
            if (cam->SA2_LABEL(unk4C) > 0) {
                cam->SA2_LABEL(unk4C) -= 2;
            } else if (cam->SA2_LABEL(unk4C) < 0) {
                cam->SA2_LABEL(unk4C) += 2;
            }
        }
    } else if (p->character != CHARACTER_AMY) {
        m4aSongNumStart(SE_SPIN_ATTACK);
        p->moveState |= MOVESTATE_SPIN_ATTACK;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        p->charState = CHARSTATE_SPINATTACK;

        if (p->playerID == PLAYER_1) {
            // TODO: Is this entire code block a macro?
            //       (also twice in sub_80448D0)
            p->SA2_LABEL(unk25) = 120;

            if (p->playerID == PLAYER_1) {
                if (cam->SA2_LABEL(unk4C) > 0) {
                    cam->SA2_LABEL(unk4C) -= 2;
                    asm("");
                } else if (cam->SA2_LABEL(unk4C) < 0) {
                    cam->SA2_LABEL(unk4C) += 2;
                }
            }
        }
    }
}
END_NONMATCH

void sub_80448D0(Player *p)
{
    if (p->charState == CHARSTATE_12 || p->charState == CHARSTATE_13) {
        if (p->playerID == PLAYER_1) {
            // TODO: Is this entire code block a macro?
            //       (also in Player_80447D8)
            p->SA2_LABEL(unk25) = 120;

            if (p->playerID == PLAYER_1) {
                if (gCamera.SA2_LABEL(unk4C) > 0) {
                    gCamera.SA2_LABEL(unk4C) -= 2;
                } else if (gCamera.SA2_LABEL(unk4C) < 0) {
                    gCamera.SA2_LABEL(unk4C) += 2;
                }
            }
        }
    } else {
        switch (p->heldInput & DPAD_VERTICAL) {
            case 0: {
                if (p->playerID == PLAYER_1) {
                    p->SA2_LABEL(unk25) = 120;

                    if (p->playerID == PLAYER_1) {
                        if (gCamera.SA2_LABEL(unk4C) > 0) {
                            gCamera.SA2_LABEL(unk4C) -= 2;
                        } else if (gCamera.SA2_LABEL(unk4C) < 0) {
                            gCamera.SA2_LABEL(unk4C) += 2;
                        }
                    }
                }

                if (p->charState == CHARSTATE_CROUCH) {
                    p->charState = CHARSTATE_3;
                } else if (p->charState == CHARSTATE_LOOK_UP) {
                    p->charState = CHARSTATE_11;
                }
            } break;

            case DPAD_UP: {
                // _0804497C
                if (p->qSpeedGround == 0) {
                    p->charState = CHARSTATE_LOOK_UP;
                    Player_8044750(p);

                } else if (p->playerID == PLAYER_1) {
                    // _08044990
                    p->SA2_LABEL(unk25) = 120;

                    if (p->playerID == PLAYER_1) {
                        if (gCamera.SA2_LABEL(unk4C) > 0) {
                            gCamera.SA2_LABEL(unk4C) -= 2;
                        } else if (gCamera.SA2_LABEL(unk4C) < 0) {
                            gCamera.SA2_LABEL(unk4C) += 2;
                        }
                    }
                }
            } break;

            case DPAD_DOWN: {
                Player_80447D8(p);
            } break;
        }
    }
}

void sub_80449D8(Player *p)
{
    s32 qSpeedGround;
    s32 rot;
    s32 qMin;

    // TODO: Down | Right? Is this a bug?
    if (p->heldInput & (DPAD_DOWN | DPAD_RIGHT)) {
        if (((p->rotation + Q(0.375)) & 0xFF) < Q(0.75)) {
            p->qSpeedGround += (SIN_24_8(p->rotation * 4) * 5) >> 5;
        }
    }

    qSpeedGround = p->qSpeedGround;

    if (p->heldInput & DPAD_LEFT) {
        qSpeedGround -= Q(8. / 256.);

        qMin = Q(0.75);
        if (qSpeedGround < qMin) {
            qSpeedGround = qMin;
        }
    }

    qSpeedGround -= Q(8. / 256.);

    qMin = Q(0.75);
    if (qSpeedGround < qMin) {
        qSpeedGround = qMin;
    }

    p->qSpeedGround = qSpeedGround;

    p->charState = CHARSTATE_16;

    qSpeedGround = p->qSpeedGround;
    rot = p->rotation;
    p->qSpeedAirX = Q_MUL(p->qSpeedGround, COS_24_8(rot * 4));
    p->qSpeedAirY = Q_MUL(p->qSpeedGround, SIN_24_8(rot * 4));
}
#endif

#if (GAME == GAME_SA2)
void sub_80236C8(Player *p)
{
    s16 airX;
    s16 airX2;

    // TODO: This doesn't seem right...
    // TODO: Once fixed here, it should be fixed in sub_8023708() as well
    // https://decomp.me/scratch/UjBCm
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
#endif
#endif

#ifndef COLLECT_RINGS_ROM
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
                    if (p->playerID == PLAYER_1) {
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
        if (p->playerID == PLAYER_1) {
            m4aSongNumStop(MUS_DROWNING);
        }
#else
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_DROWNING].header && p->playerID == PLAYER_1) {
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

#if (GAME == GAME_SA1)
void Player_8044D74(Player *p)
{
    Sprite *sprBelow = p->stoodObj;
    CamCoord sprWorldX = gCamera.x + sprBelow->x;

    s32 sprWorldSubOffsetLeft = Q(sprWorldX + sprBelow->hitboxes[0].b.left - p->spriteOffsetX + 1);
    s32 sprWorldSub2;

    if ((p->qWorldX < sprWorldSubOffsetLeft) && (sprBelow->hitboxes[0].b.left != 0)) {
        if ((p->moveState & MOVESTATE_FACING_LEFT)) {
            p->charState = CHARSTATE_12;
        } else {
            p->charState = CHARSTATE_13;
        }

        return;
    } else {
        s32 sprWorldSubOffsetRight = Q(sprWorldX + sprBelow->hitboxes[0].b.right + p->spriteOffsetX - 2);

        if ((p->qWorldX > sprWorldSubOffsetRight) && (sprBelow->hitboxes[0].b.right != 0)) {
            if ((p->moveState & MOVESTATE_FACING_LEFT)) {
                p->charState = CHARSTATE_13;
            } else {
                p->charState = CHARSTATE_12;
            }

            return;
        }
    }

    sprWorldSub2 = Q(sprWorldX + sprBelow->hitboxes[0].b.left - p->spriteOffsetX + 2);

    if ((p->qWorldX < sprWorldSub2) || (p->qWorldX > Q(sprWorldX + sprBelow->hitboxes[0].b.right + p->spriteOffsetX - 3))) {
        if (p->prevCharState == 12 || p->prevCharState == 13) {
            // TODO: Are these names accurate, if charState gets get to prevCharState?
            p->charState = p->prevCharState;
        }
    }
}

void Player_8044E48(Player *p)
{
    s32 worldX = I(p->qWorldX);
    s32 worldY = I(p->qWorldY);
    s32 res;

    res = SA2_LABEL(sub_801E4E4)(worldY + p->spriteOffsetY, worldX, p->layer, +8, 0, SA2_LABEL(sub_801EE64));

    if (res > 8) {
        s32 r6;
        if (GRAVITY_IS_INVERTED) {
            s32 x, y;
            s32 x2, y2;
            y = p->spriteOffsetY;
            y = worldY - y;
            x = worldX - 2;
            r6 = SA2_LABEL(sub_801E4E4)(y, x - p->spriteOffsetX, p->layer, -8, 0, SA2_LABEL(sub_801EE64));

            y2 = p->spriteOffsetY;
            y2 = worldY - y2;
            x2 = worldX + 2;
            res = SA2_LABEL(sub_801E4E4)(y2, x2 + p->spriteOffsetX, p->layer, -8, 0, SA2_LABEL(sub_801EE64));
        } else {
            s32 x, y;
            s32 x2, y2;
            y = worldY + p->spriteOffsetY;
            x = worldX - 2;
            r6 = SA2_LABEL(sub_801E4E4)(y, x - p->spriteOffsetX, p->layer, +8, 0, SA2_LABEL(sub_801EE64));

            y2 = worldY + p->spriteOffsetY;
            x2 = worldX + 2;
            res = SA2_LABEL(sub_801E4E4)(y2, x2 + p->spriteOffsetX, p->layer, +8, 0, SA2_LABEL(sub_801EE64));
        }

        if ((r6 > 8) && (res == 0)) {
            if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
                p->charState = CHARSTATE_13;
            } else {
                p->charState = CHARSTATE_12;
            }
        } else if ((r6 == 0) && (res > 8)) {
            if ((p->moveState & MOVESTATE_FACING_LEFT)) {
                p->charState = CHARSTATE_13;
            } else {
                p->charState = CHARSTATE_12;
            }
        }
    }
}

void Player_8044F7C(Player *p)
{
    s32 qSpeed;
    u8 rot;

    if ((p->SA2_LABEL(unk2A) == 0) && (p->charState != CHARSTATE_64) && (p->charState != CHARSTATE_27)) {
        switch (p->heldInput & DPAD_SIDEWAYS) {
            case 0: {
                if (p->qSpeedGround != Q(0)) {
                    if ((p->charState == CHARSTATE_8) || (p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_IDLE)) {
                        p->charState = CHARSTATE_WALK_A;

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                    }
                } else if (!(p->moveState & MOVESTATE_800000)) {
                    if ((p->character != CHARACTER_AMY) || !(p->moveState & MOVESTATE_200)) {

                        if (p->charState == CHARSTATE_CROUCH) {
                            p->charState = CHARSTATE_3;
                        } else if (p->charState == CHARSTATE_LOOK_UP) {
                            p->charState = CHARSTATE_11;
                        } else if ((p->charState != CHARSTATE_3) && (p->charState != CHARSTATE_11)) {
                            p->charState = CHARSTATE_IDLE;
                        }

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                    }
                }

                if (p->character == CHARACTER_AMY) {
                    if (p->charState == CHARSTATE_CROUCH) {
                        qSpeed = p->qSpeedGround;
                        if (qSpeed > 0) {
                            qSpeed -= p->deceleration;

                            if (qSpeed < 0) {
                                qSpeed = 0;
                            }
                        } else {
                            qSpeed += p->deceleration;

                            if ((qSpeed) > 0) {
                                qSpeed = 0;
                            }
                        }
                        p->qSpeedGround = qSpeed;
                    }
                }

            } break;

            case DPAD_LEFT: {
                Player_8043970(p);
            } break;

            case DPAD_RIGHT: {
                Player_8043A2C(p);
            } break;
        }

        if ((p->character == CHARACTER_AMY) && (p->moveState & MOVESTATE_200)) {
            qSpeed = p->qSpeedGround;
            if (qSpeed == Q(0)) {
                qSpeed = Q(3);
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    NEGATE(qSpeed);
                }
                p->qSpeedGround = qSpeed;
            }
        } else {
            if ((!((p->rotation + Q(0.125)) & 0xC0)) && (p->qSpeedGround == 0)) {
                p->moveState &= ~MOVESTATE_20;

                if (!(p->moveState & MOVESTATE_800000)) {
                    if ((p->charState != CHARSTATE_3) && (p->charState != CHARSTATE_11)) {
                        p->charState = 0;
                    }

                    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
                        Player_8044D74(p);
                    } else {
                        Player_8044E48(p);
                    }
                }
            }
        }
    }

    sub_80448D0(p);

    if (!(p->heldInput & DPAD_SIDEWAYS)) {
        qSpeed = p->qSpeedGround;
        if (qSpeed > 0) {
            qSpeed -= Q(8. / 256.);
            qSpeed = MAX(Q(0), qSpeed);
            p->qSpeedGround = qSpeed;
        } else if (qSpeed < 0) {
            qSpeed += Q(8. / 256.);
            qSpeed = MIN(Q(0), qSpeed);
            p->qSpeedGround = qSpeed;
        }
    }

    qSpeed = p->qSpeedGround;
    p->qSpeedAirX = Q_MUL(qSpeed, COS_24_8((rot = p->rotation) * 4));
    p->qSpeedAirY = Q_MUL(qSpeed, SIN_24_8(rot * 4));

    SA2_LABEL(sub_8023128)(p);
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
        SA2_LABEL(sub_80232D0)(p);

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

            if ((!LOADED_SAVE->timeLimitDisabled
                 && (gCourseTime > MAX_COURSE_TIME || (gStageFlags & STAGE_FLAG__TIMER_REVERSED && gCourseTime == 0)))
#if (GAME == GAME_SA2)
                || ((gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) && gCourseTime > MAX_COURSE_TIME)
#endif
            ) {
                HandleDeath();
            } else {
                gRingCount = 0;
#if (GAME == GAME_SA2)
                gSpecialRingCount = 0;
#endif
                HandleLifeLost();
            }
        } else
#endif
        {
#if (GAME == GAME_SA1)
            if (gGameMode != GAME_MODE_CHAO_HUNT && gGameMode != GAME_MODE_TEAM_PLAY)
#endif
            {
                gRingCount = 0;
            }

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
            if (gGameMode == GAME_MODE_MULTI_PLAYER) {
                gRingCount = 1;
            }
#endif
#endif

#if (GAME == GAME_SA2)
            gSpecialRingCount = 0;
#endif
            InitializePlayer(&gPlayer);
            gCamera.x = I(gPlayer.qWorldX) + gCamera.shiftX - DISPLAY_CENTER_X;
            gCamera.y = I(gPlayer.qWorldY) + gCamera.shiftY - DISPLAY_CENTER_Y;
            m4aMPlayTempoControl(&gMPlayInfo_BGM, 256);
            gPlayer.moveState = 0;
            gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

            gPlayer.spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            gPlayer.spriteInfoLimbs->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoLimbs->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);

            gCamera.SA2_LABEL(unk50) &= ~0x3;

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
            if (gPlayer.character == CHARACTER_CREAM && gCheese != NULL) {
                gCheese->posX = gPlayer.qWorldX;
                gCheese->posY = gPlayer.qWorldY;
            }
#endif
#endif

            gCurTask->main = Task_PlayerMain;
#if (GAME == GAME_SA2)
            gPlayer.callback = Player_TouchGround;
#endif
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
#if (GAME == GAME_SA1)
    if (!GRAVITY_IS_INVERTED) {
        if (playerY >= Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1) {
            return TRUE;
        }
    } else {
        if (playerY <= Q(cam->y - 80)) {
            return TRUE;
        }
    }
#elif (GAME == GAME_SA2)
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
#endif
    return FALSE;
}

void Task_PlayerDied(void)
{
    Player *p = &gPlayer;

    PlayerSpriteInfo *psi1 = gPlayer.spriteInfoBody;
    PlayerSpriteInfo *psi2 = gPlayer.spriteInfoLimbs;

    if (DeadPlayerLeftScreen(&gPlayer, &gCamera, gPlayer.qWorldY)) {
        player_0_Task *gt = TASK_DATA(gCurTask);
        gt->unk4 = TIME(0, 1);
#if (GAME == GAME_SA2)
        gPlayer.moveState |= MOVESTATE_100000;
        if (IS_MULTI_PLAYER) {
            sub_8024B10(p, psi1);
        }
#endif
        gCurTask->main = Task_PlayerHandleDeath;
        return;
    }

#if (GAME == GAME_SA1)
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
#elif (GAME == GAME_SA2)
    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
#endif
    SA2_LABEL(sub_802486C)(p, psi1);
    SA2_LABEL(sub_8024B10)(p, psi1);
#ifndef COLLECT_RINGS_ROM
    SA2_LABEL(sub_8024F74)(p, psi2);
#endif
}

void Task_PlayerMain(void)
{
    Player *p = &gPlayer;

#if (GAME == GAME_SA2)
    Player_HandleBoostThreshold(p);
    Player_HandleBoostState(p);
    Player_ApplyBoostPhysics(p);
    Player_HandleWalkAnim(p);

    gWorldSpeedX = 0;
    gWorldSpeedY = 0;
    Player_HandleInputs(p);
#ifndef COLLECT_RINGS_ROM
    InputBuffer_HandleFrameInput(p);
    Player_HandleWater(p);
#endif
    CallPlayerTransition(p);

    if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        p->callback(p);
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        SA2_LABEL(sub_80232D0)(p);
    }

    SA2_LABEL(sub_802486C)(p, p->spriteInfoBody);
    SA2_LABEL(sub_8024B10)(p, p->spriteInfoBody);
#ifndef COLLECT_RINGS_ROM
    SA2_LABEL(sub_8024F74)(p, p->spriteInfoLimbs);
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
#endif

    if (p->moveState & MOVESTATE_DEAD) {
        struct Camera *cam = &gCamera;
        gCurTask->main = Task_PlayerDied;
        p->charState = CHARSTATE_DEAD;
        p->qSpeedAirX = 0;

#if (GAME == GAME_SA2)
        if (p->qSpeedAirY < -Q(4)) {
            p->qSpeedAirY = -Q(2);
        } else if (p->qSpeedAirY > 0) {
            p->qSpeedAirY = 0;
        }
#endif

        p->timerInvulnerability = 2;
        p->itemEffect = 0;
        p->moveState &= ~MOVESTATE_20;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->stoodObj = NULL;
        cam->SA2_LABEL(unk50) |= 3;
#ifndef COLLECT_RINGS_ROM
        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;
        }
#endif

        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        p->SA2_LABEL(unk80) = 0x100;
        p->SA2_LABEL(unk82) = 0x100;
#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA1)
        m4aSongNumStop(28);
        m4aSongNumStop(27);
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
#elif (GAME == GAME_SA2)
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
#endif

        if (p->secondsUntilDrown < 0) {
            m4aSongNumStart(SE_DROWNED);
        } else {
            m4aSongNumStart(SE_LIFE_LOST);
        }
#endif
    }
#if (GAME == GAME_SA1)
    else {
        Player_HandleInputs(p);
        Player_HandleWater(p);

        if (!(p->moveState & 0x400000)) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    Player_Sonic_80473AC(p);
                } break;

                case CHARACTER_TAILS: {
                    Player_Tails_8047BA0(p);
                } break;

                case CHARACTER_KNUCKLES: {
                    Player_Knuckles_8049000(p);
                } break;

                case CHARACTER_AMY: {
                    Player_Amy_80497AC(p);
                } break;
            }
        }
    }
#endif
    // 124
#if (GAME == GAME_SA1)
    SA2_LABEL(sub_802486C)(p, p->spriteInfoBody);
    SA2_LABEL(sub_8024B10)(p, p->spriteInfoBody);
    SA2_LABEL(sub_8024F74)(p, p->spriteInfoLimbs);

    if ((p->charState != CHARSTATE_HIT_AIR) && (p->timerInvulnerability > 0)) {
        p->timerInvulnerability--;
    }

    if (p->itemEffect != 0) {
        if ((p->itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) && (--p->timerSpeedup == 0)) {
            m4aMPlayTempoControl(&gMPlayInfo_BGM, Q(1.0));
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
        }

        if ((p->itemEffect & PLAYER_ITEM_EFFECT__MP_SLOW_DOWN) && (--p->timerSpeedup == 0)) {
            m4aMPlayTempoControl(&gMPlayInfo_BGM, Q(1.0));
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;
        }

        if ((p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) && (--p->timerInvincibility == 0)) {
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__INVINCIBILITY;
            m4aSongNumStop(28);
        }

        if ((p->itemEffect & PLAYER_ITEM_EFFECT__20) && (--p->itemEffect20Timer == 0)) {
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__20;

            gDispCnt &= ~0x8000;
            gWinRegs[5] = 0x3F;
        }
    }
#endif
}

#if (GAME == GAME_SA1)
// Partner handlers
// TODO(Jace): Could this be exclusively for the CPU Tails?
//             I didn't find a way to trigger this procedure yet.
// (93.14%) https://decomp.me/scratch/CpseV
NONMATCH("asm/non_matching/game/sa1/stage/Player__Player_Tails_804571C.inc", void Player_Tails_804571C(Player *p))
{
    u16 gravityFlag = (gStageFlags & STAGE_FLAG__GRAVITY_INVERTED);

    p->layer = gPlayer.layer;

    if (gPlayer.moveState & MOVESTATE_1000000) {
        gPlayer.layer ^= 0x1;
    }

    if (p->moveState & MOVESTATE_IN_WATER) {
        p->charState = CHARSTATE_SWIMMING;
    } else {
        p->charState = CHARSTATE_FLYING;
    }

    if (I(p->qWorldX) < gCamera.x - CAM_REGION_WIDTH) {
        p->qWorldX = Q(gCamera.x - CAM_REGION_WIDTH);
    }

    if (I(p->qWorldX) > gCamera.x + DISPLAY_WIDTH + CAM_REGION_WIDTH) {
        p->qWorldX = Q(gCamera.x + DISPLAY_WIDTH + CAM_REGION_WIDTH);
    }

    if (I(p->qWorldY) < gCamera.y - CAM_REGION_WIDTH) {
        p->qWorldY = Q(gCamera.y - CAM_REGION_WIDTH);
    }

    if (I(p->qWorldY) > gCamera.y + DISPLAY_HEIGHT + CAM_REGION_WIDTH) {
        p->qWorldY = Q(gCamera.y + DISPLAY_HEIGHT + CAM_REGION_WIDTH);
    }
    // _080457CE

    if (((I(p->qWorldX) - 32) < I(gPlayer.qWorldX)) && ((I(p->qWorldX) + 32) > I(gPlayer.qWorldX))
        && ((!gravityFlag && ((I(p->qWorldY) - 32) < I(gPlayer.qWorldY) - 48) && ((I(p->qWorldY) + 32) > I(gPlayer.qWorldY) - 48))
            || (gravityFlag && ((I(p->qWorldY) - 32) < I(gPlayer.qWorldY) + 48) && ((I(p->qWorldY) + 32) > I(gPlayer.qWorldY) + 48)))
        && (SA2_LABEL(sub_8022F58)(0, p) >= 0)) {
        // _08045834 + 0xA
        p->moveState &= ~MOVESTATE_20;
        p->moveState &= ~MOVESTATE_100;
        p->moveState &= ~MOVESTATE_SPINDASH;
        p->SA2_LABEL(unk61) = 0;
        p->SA2_LABEL(unk62) = 0;
        p->SA2_LABEL(unk63) = 0;
        p->moveState &= ~MOVESTATE_8000;

        if (p->character == CHARACTER_TAILS) {
            m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
        }

        if (p->character == CHARACTER_AMY) {
            p->moveState &= ~(MOVESTATE_2000000 | MOVESTATE_4000000);
        }

        p->qSpeedGround = Q(0);
        p->qSpeedAirX = Q(0);
        p->qSpeedAirY = Q(0);

        p->charState = CHARSTATE_56;
        p->moveState &= ~MOVESTATE_SPIN_ATTACK;
        p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
        p->moveState &= ~MOVESTATE_200;
        p->moveState &= ~MOVESTATE_100000;
        p->moveState &= ~MOVESTATE_800000;
        p->moveState &= ~MOVESTATE_DEAD;
        p->moveState &= ~MOVESTATE_IGNORE_INPUT;
        p->moveState &= ~MOVESTATE_IA_OVERRIDE;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->stoodObj = NULL;

        gCurTask->main = Task_8045B38;
    } else {
        s32 r2;
        s32 qWorld;
        s32 qDelta;
        s32 world;
        // _080458F8
        if ((I(p->qWorldX) + 1) < I(gPlayer.qWorldX)) {
            p->qWorldX += Q(2);
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        } else if (I(gPlayer.qWorldX) < (I(p->qWorldX) - 1)) {
            p->qWorldX -= Q(2);
            p->moveState |= MOVESTATE_FACING_LEFT;
        }
        // _08045934

        world = I(p->qWorldY);
        qDelta = p->qWorldY;

        if (!gravityFlag) {
            r2 = I(gPlayer.qWorldY) - 48;
        } else {
            r2 = I(gPlayer.qWorldY) + 48;
        }

        if (world < r2) {
            qDelta = +Q(1);
        } else if (r2 < world) {
            qDelta = -Q(1);
        } else {
            return;
        }

        p->qWorldY += qDelta;
    }
}
END_NONMATCH

// (90.78%) https://decomp.me/scratch/SwkK7
NONMATCH("asm/non_matching/game/sa1/stage/Player__Task_804597C.inc", void Task_804597C(void))
{
    PlayerSpriteInfo *psiPartnerBody = gPartner.spriteInfoBody;
    PlayerSpriteInfo *psiPartnerLimbs = gPartner.spriteInfoLimbs;
    s32 qPartnerWorldY = gPartner.qWorldY;
    u32 qPartnerMovestate = gPartner.moveState;
    Camera *cam = &gCamera;
    s32 qWorld;

    if (!(qPartnerMovestate & MOVESTATE_80000000)) {
        s32 r1;

        if (!GRAVITY_IS_INVERTED) {
            if (qPartnerWorldY >= Q(cam->y) + Q(DISPLAY_WIDTH) - 1) {
                r1 = 1;
            } else {
                r1 = 0;
            }
        } else {
            if (qPartnerWorldY > Q(cam->y - DISPLAY_CENTER_Y)) {
                r1 = 0;
            } else {
                r1 = 1;
            }
        }

        if (r1) {
            // _080459D8

            gPartner.qWorldX = Q(cam->x - 256);
            gPartner.qWorldY = Q(cam->y - 256);
            gPartner.spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPartner.spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            gPartner.moveState &= ~MOVESTATE_20;
            gPartner.moveState &= ~MOVESTATE_DEAD;

            if (gPartner.moveState & MOVESTATE_IN_WATER) {
                gPartner.charState = CHARSTATE_SWIMMING;
            } else {
                gPartner.charState = CHARSTATE_FLYING;
            }

            // Inline of Player_InitializeDrowning?
            gPartner.framesUntilDrownCountDecrement = TIME(0, 1);
            gPartner.secondsUntilDrown = 30;

            if (gPartner.playerID == 0) {
                m4aSongNumStop(MUS_DROWNING);
            }
            // _08045A4E

            gCurTask->main = Task_8045AD8;
            return;
        }
    }
    // _08045A60

    gPartner.qWorldX += gPartner.qSpeedAirX;

    if ((gStageFlags ^ gPrevStageFlags) & STAGE_FLAG__GRAVITY_INVERTED) {
        gPartner.qSpeedAirY = -gPartner.qSpeedAirY;
    }
    // _08045A80

    if (gStageFlags & STAGE_FLAG__GRAVITY_INVERTED) {
        qWorld = gPartner.qWorldY - gPartner.qSpeedAirY;
    } else {
        qWorld = gPartner.qWorldY + gPartner.qSpeedAirY;
    }

    gPartner.qWorldY = qWorld;

    if (!(gPartner.moveState & MOVESTATE_IN_WATER)) {
        gPartner.qSpeedAirY += Q(42. / 256.);
    } else {
        gPartner.qSpeedAirY += Q(12. / 256.);
    }

    SA2_LABEL(sub_802486C)(&gPartner, psiPartnerBody);
    SA2_LABEL(sub_8024B10)(&gPartner, psiPartnerBody);
    SA2_LABEL(sub_8024F74)(&gPartner, psiPartnerLimbs);
}
END_NONMATCH

void Task_8045AD8(void)
{
    Player *partner = &gPartner;

    Player_HandleWater(partner);

    if (gPartner.character == CHARACTER_TAILS) {
        Player_Tails_804571C(partner);
    }

    SA2_LABEL(sub_802486C)(partner, gPartner.spriteInfoBody);
    SA2_LABEL(sub_8024B10)(partner, gPartner.spriteInfoBody);
    SA2_LABEL(sub_8024F74)(partner, gPartner.spriteInfoLimbs);

    if (gPartner.charState != CHARSTATE_HIT_AIR) {
        if (gPartner.timerInvulnerability > 0) {
            gPartner.timerInvulnerability--;
        }
    }

    partner->SA2_LABEL(unk25) = 120;
}

void Task_8045B38(void)
{
    Player *partner = &gPartner;
    PlayerSpriteInfo *psiBody;

    if (!IS_ALIVE(partner)) {
        gCurTask->main = Task_804597C;

        partner->charState = CHARSTATE_DEAD;
        partner->qSpeedAirX = Q(0);
        partner->timerInvulnerability = 2;
        partner->itemEffect = 0;
        partner->moveState &= ~MOVESTATE_20;
        partner->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        partner->stoodObj = NULL;
        psiBody = partner->spriteInfoBody;
        psiBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        psiBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        partner->SA2_LABEL(unk80) = Q(1.0);
        partner->SA2_LABEL(unk82) = Q(1.0);

        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);

        if (partner->secondsUntilDrown < 0) {
            m4aSongNumStart(SE_DROWNED);
        } else {
            m4aSongNumStart(SE_LIFE_LOST);
        }
    } else {
        sub_8045DF0(partner);
        Player_HandleWater(partner);

        if ((I(partner->qWorldX) < gCamera.x - CAM_REGION_WIDTH) || (I(partner->qWorldX) > gCamera.x + DISPLAY_WIDTH + CAM_REGION_WIDTH)
            || (I(partner->qWorldY) < gCamera.y - CAM_REGION_WIDTH)
            || (I(partner->qWorldY) > gCamera.y + DISPLAY_HEIGHT + CAM_REGION_WIDTH)) {
            if (partner->character == CHARACTER_TAILS) {
                if (partner->moveState & MOVESTATE_IN_WATER) {
                    partner->charState = CHARSTATE_SWIMMING;
                } else {
                    partner->charState = CHARSTATE_FLYING;
                }
            }

            partner->moveState |= MOVESTATE_DEAD;
            partner->moveState &= ~MOVESTATE_20;

            // Inline of Player_InitializeDrowning?
            partner->framesUntilDrownCountDecrement = TIME(0, 1);
            partner->secondsUntilDrown = 30;

            if (partner->playerID == PLAYER_1) {
                m4aSongNumStop(MUS_DROWNING);
            }

            gCurTask->main = Task_8045AD8;
        } else if (!(partner->moveState & MOVESTATE_IA_OVERRIDE)) {
            // TODO: This might be a macro.
            //       Task_8045B38 explicitly loads the partner data
            //       and that can only be Tails.
            //       (Unless gPartner is also used in MP matches?)
            switch (partner->character) {
                case CHARACTER_SONIC: {
                    Player_Sonic_80473AC(partner);
                } break;

                case CHARACTER_TAILS: {
                    Player_Tails_8047BA0(partner);
                } break;

                case CHARACTER_KNUCKLES: {
                    Player_Knuckles_8049000(partner);
                } break;

                case CHARACTER_AMY: {
                    Player_Amy_80497AC(partner);
                } break;
            }
        }
    }

    SA2_LABEL(sub_802486C)(partner, partner->spriteInfoBody);
    SA2_LABEL(sub_8024B10)(partner, partner->spriteInfoBody);
    SA2_LABEL(sub_8024F74)(partner, partner->spriteInfoLimbs);

    if (partner->charState != CHARSTATE_HIT_AIR) {
        if (partner->timerInvulnerability > 0) {
            partner->timerInvulnerability--;
        }
    }

    partner->SA2_LABEL(unk25) = 120;
}
#endif

#if (GAME == GAME_SA2)
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
#endif

// Confusion state related
void Player_HandleInputs(Player *p)
{
    u8 r0, r1, r2;
    u16 input;

    if (IS_MULTI_PLAYER && (SIO_MULTI_CNT->id != gCamera.spectatorTarget)) {
        p->heldInput = 0;
        input = 0;
#if (GAME == GAME_SA1)
        sub_804D13C(0);
#endif
    } else {
        input = p->heldInput;

        if (!(p->moveState & MOVESTATE_IGNORE_INPUT)) {
            p->heldInput = gInput;

            if (IS_MULTI_PLAYER && (p->itemEffect & PLAYER_ITEM_EFFECT__CONFUSION)) {
                r2 = ((p->heldInput & DPAD_ANY) >> 4);
                r1 = ((gStageTime + p->timerConfusion) & 0x3);

                if (r1 == 0) {
                    r1 = 1;
                }

                r2 <<= r1;
                r0 = ((r2 >> 4) | r2);
                r2 = r0 << 4;

                p->heldInput = (p->heldInput & ~DPAD_ANY) | r2;
                if (--p->timerConfusion == 0) {
                    p->itemEffect &= ~PLAYER_ITEM_EFFECT__CONFUSION;
                }
            }
#if (GAME == GAME_SA1)
            sub_804D13C(p->heldInput);
#endif
        }
#if (GAME == GAME_SA1)
        else {
            sub_804D13C(0);
        }
#endif
    }

    input ^= p->heldInput;
    input &= p->heldInput;
    p->frameInput = input;
#if (GAME == GAME_SA1)
    if (p->heldInput & DPAD_SIDEWAYS) {
        p->heldInput &= ~DPAD_VERTICAL;
    }

    if (p->frameInput & DPAD_SIDEWAYS) {
        p->frameInput &= ~DPAD_VERTICAL;
    }
#endif
}

#if (GAME == GAME_SA1)
// TODO: Remove gotos
void sub_8045DF0(Player *p)
{
    u16 r4 = p->heldInput;
    u16 r6 = r4;
    u32 r5;

    if (!(p->moveState & MOVESTATE_IGNORE_INPUT)) {
        r4 = gUnknown_030060F0[20];

        if (((p->rotation + Q(0.125)) & 0xC0) == 0) {
            if ((p->qWorldX + Q(16)) < gPlayer.qWorldX) {

                if (!(r4 & DPAD_DOWN)) {
                    r4 |= DPAD_RIGHT;
                    r4 &= ~DPAD_LEFT;
                }

            } else if ((p->qWorldX - Q(16)) > gPlayer.qWorldX) {
                // _08045E48 + 0x8
                if (!(r4 & DPAD_DOWN)) {
                    r4 |= DPAD_LEFT;
                    r4 &= ~DPAD_RIGHT;
                }
            } else {
                r4 &= ~(DPAD_LEFT | DPAD_RIGHT);
            }
            // _08045E74

            if (!(r4 & DPAD_SIDEWAYS) && (p->qSpeedGround == Q(0)) && !(p->moveState & MOVESTATE_IN_AIR) && (p->SA2_LABEL(unk62) == 0)
                && ((p->charState == 4) || (p->charState == 0))
                && !(p->moveState & (MOVESTATE_800000 | MOVESTATE_8000 | MOVESTATE_SPINDASH | MOVESTATE_200 | MOVESTATE_STOOD_ON_OBJ))) {
                if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                    if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
                        p->moveState |= MOVESTATE_FACING_LEFT;
                        p->charState = CHARSTATE_8;
                    }
                } else {
                    if (p->moveState & MOVESTATE_FACING_LEFT) {
                        p->moveState &= ~MOVESTATE_FACING_LEFT;
                        p->charState = CHARSTATE_8;
                    }
                }
            }
        }
    }
    // _08045EEE
    r5 = r4;
    r5 &= ~r6;

    if (!(p->moveState & MOVESTATE_IGNORE_INPUT)) {
        switch (p->moveState & MOVESTATE_IN_AIR) {
            case 0: {
                if (!GRAVITY_IS_INVERTED) {
                    if (p->qWorldY - Q(80) > gPlayer.qWorldY) {
                        goto _08045FC6;
                    }
                } else {
                    // _08045F38
                    if (p->qWorldY + Q(80) < gPlayer.qWorldY) {
                        r5 |= gPlayerControls.jump;
                    }
                }
            } break;

            case MOVESTATE_IN_AIR: {
                if (!GRAVITY_IS_INVERTED) {
                    if (p->qWorldY > gPlayer.qWorldY - Q(16)) {
                        goto _08045F90;
                    }
                } else {
                    // _08045F7C
                    if (p->qWorldY < gPlayer.qWorldY + Q(16)) {
                    _08045F90:
                        if ((p->SA2_LABEL(unk61) != 0) || (p->qSpeedAirY > Q(0))) {
                            // _08045FA8
                            if (!GRAVITY_IS_INVERTED) {
                                if (p->qWorldY > gPlayer.qWorldY) {
                                    goto _08045FC6;
                                }
                            } else {
                                // _08045FC0
                                if (p->qWorldY < gPlayer.qWorldY) {
                                _08045FC6:
                                    r5 |= gPlayerControls.jump;
                                }
                            }
                        } else {
                            r4 |= gPlayerControls.jump;
                        }
                    }
                }
            } break;
        }
    }
    // _08045FDA

    if (r4 & DPAD_SIDEWAYS) {
        r4 &= ~DPAD_VERTICAL;
    }
    // _08045FE8

    if (r5 & DPAD_SIDEWAYS) {
        u16 mask = ~DPAD_VERTICAL;
        r5 &= mask;
    }

    // _08045FF4
    p->heldInput = r4;
    p->frameInput = r5;
}
#endif

#if (GAME == GAME_SA2)
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
            p->moveState |= MOVESTATE_SPIN_ATTACK;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            if ((p->qSpeedAirY > 0) && (p->variant == 1) && ((((u16)anim - 10) == 0) || (((u16)anim - 10) == 1))) {
                s32 newY = sub_801E6D4(I(p->qWorldY) + p->spriteOffsetY, I(p->qWorldX), p->layer, 8, NULL, SA2_LABEL(sub_801EE64));

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
#endif

#if (GAME == GAME_SA1)
#define MAX_RUN_ANIM_SPEED 1.0
#elif (GAME == GAME_SA2)
#define MAX_RUN_ANIM_SPEED 8.0
#endif

void SA2_LABEL(sub_802486C)(Player *p, PlayerSpriteInfo *p2)
{
    s32 speed;
    Sprite *s = &p2->s;

#if (GAME == GAME_SA1)
    if (p->moveState & MOVESTATE_20) {
        p->SA2_LABEL(unk62) = 0;
        p->SA2_LABEL(unk63) = 0;
        p->charState = 14;
    }
#endif
#if (GAME == GAME_SA2)
    if ((p->charState != CHARSTATE_INVALID) && (p->charState != p->prevCharState))
#endif
    {
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

#if (GAME == GAME_SA1)
    if ((p->qSpeedGround != Q(0)) || (p->heldInput & (DPAD_ANY | A_BUTTON | B_BUTTON))) {
        p->SA2_LABEL(unk72) = TIME(0, 6);
    }
#endif
    switch (p->charState) {
#if (GAME == GAME_SA1)
        case CHARSTATE_IDLE: {
            if (p->SA2_LABEL(unk72) != 0) {
                p->SA2_LABEL(unk72)--;
            } else {
                p->anim = gPlayerCharacterIdleAnims[p->character] + SA1_CHAR_ANIM_1; // SA1_CHAR_ANIM_WALK;
                p->variant = 0; // p->walkAnim;
            }
        } break;
#endif
        case CHARSTATE_WALK_A: {
#if (GAME == GAME_SA1)
            speed = p->qSpeedGround;
            if (ABS(speed) >= Q(4.5)) {
                p->anim = gPlayerCharacterIdleAnims[p->character] + SA1_CHAR_ANIM_RUN;
                p->variant = 0;
                s->animSpeed = SPRITE_ANIM_SPEED(1.0);
                break;
            }
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
            p->anim = gPlayerCharacterIdleAnims[p->character] + SA2_CHAR_ANIM_WALK;
#else
            p->anim = gPlayerCharacterIdleAnims[0] + SA2_CHAR_ANIM_WALK;
#endif
            p->variant = p->walkAnim;
#endif
        } // FALLTHROUGH!!!
#ifndef COLLECT_RINGS_ROM
        case CHARSTATE_WALLRUN_INIT:
        case CHARSTATE_WALLRUN_TO_WALL:
        case CHARSTATE_WALLRUN_ON_WALL:
#endif
            speed = p->qSpeedGround;
#if (GAME == GAME_SA1)
            speed = ABS(speed) >> 4;
#elif (GAME == GAME_SA2)
            speed = (speed >> 5) + (speed >> 6); // div 96
            speed = ABS(speed);
#endif
            s->animSpeed = CLAMP_32(speed, SPRITE_ANIM_SPEED(0.5), SPRITE_ANIM_SPEED(MAX_RUN_ANIM_SPEED));
            break;
#if (GAME == GAME_SA1)
        case CHARSTATE_SPRING_B:
        case CHARSTATE_85: {
            if (p->qSpeedAirY >= -Q(1.5)) {
                p->charState = CHARSTATE_18;
            }
        } break;

        case CHARSTATE_BRAKE: {
            if (ABS(p->qSpeedGround) < Q(1.5)) {
                // _080461A2 + 0x6
                p->anim = gPlayerCharacterIdleAnims[p->character] + 7;
                p->variant = 0;
            }
            // _080461C4

            if ((gStageTime % 4u) == 0) {
                s32 offsetY = p->spriteOffsetY;

                if (GRAVITY_IS_INVERTED) {
                    offsetY = -offsetY;
                }

                CreateBrakingDustEffect(I(p->qWorldX), I(p->qWorldY) + offsetY);
            }
        } break;

        case CHARSTATE_16: {
            if ((((p->rotation + Q(0.125)) & 0xC0) != 0)) {
                p->anim = gPlayerCharacterIdleAnims[p->character] + SA1_CHAR_ANIM_GRINDING;
                p->variant = 1;
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }
        } break;
#endif
#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
        case CHARSTATE_AIR_ATTACK: {
            if (p->character != CHARACTER_CREAM) {
                break;
            }
            speed = p->qSpeedGround;
            speed = (speed >> 5) + (speed >> 6);
            speed = ABS(speed);
            s->animSpeed = CLAMP_32(speed, SPRITE_ANIM_SPEED(0.5), SPRITE_ANIM_SPEED(8.0));
        } break;

        case CHARSTATE_WINDUP_STICK_UPWARDS:
        case CHARSTATE_WINDUP_STICK_DOWNWARDS: {
            speed = p->qSpeedAirY;
            speed = ABS(speed);
            speed = I(speed) * 3 + 8;
            s->animSpeed = speed;
        } break;

        case CHARSTATE_WINDUP_STICK_SINGLE_TURN_UP:
        case CHARSTATE_WINDUP_STICK_SINGLE_TURN_DOWN: {
            speed = p->qSpeedGround;
            speed = ABS(speed);
            speed = I(speed) * 3 + 8;
            s->animSpeed = speed;
        } break;
#endif
#endif
    }

#if (GAME == GAME_SA1)
    if (p->moveState & MOVESTATE_IN_WATER) {
        s->animSpeed -= (s->animSpeed >> 1);
    }

    if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
        SPRITE_FLAG_SET(s, X_FLIP);
    } else {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    }

    if (GRAVITY_IS_INVERTED) {
        SPRITE_FLAG_SET(s, Y_FLIP);
    } else {
        SPRITE_FLAG_CLEAR(s, Y_FLIP);
    }
#endif

#ifndef COLLECT_RINGS_ROM
    if (IS_MULTI_PLAYER)
#endif
    {

        p->SA2_LABEL(unk98) = 0;
    }

    if (
#if (GAME == GAME_SA2)
        p->SA2_LABEL(unk6C) ||
#endif
        (s->graphics.anim != p->anim) || (s->variant != p->variant)) {
#if (GAME == GAME_SA2)
        p->SA2_LABEL(unk6C) = FALSE;
#endif
        s->graphics.anim = p->anim;
        s->variant = p->variant;
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;

#ifndef COLLECT_RINGS_ROM
        if (IS_MULTI_PLAYER)
#endif
        {
            p->SA2_LABEL(unk98) = 1;
        }
    }

    p->prevCharState = p->charState;
}

void SA2_LABEL(sub_8024B10)(Player *p, PlayerSpriteInfo *inPsi)
{
    struct MultiSioData_0_4 *send;
    MultiplayerPlayer *mpp;
    AnimCmdResult acmdRes;

    Sprite *s = &inPsi->s;
    PlayerSpriteInfo *psi = inPsi;

    struct Camera *cam = &gCamera;
    s16 camX = cam->x;
    s16 camY = cam->y;

    // required for match
    bool32 cond = ({
        bool32 r2 = s->prevVariant == 0xFF ||
#if (GAME == GAME_SA1) && !defined(BUG_FIX)
            // The prevAnim check compares to a 0xFF, not 0xFFFF!
            s->prevAnim == 0xFF;
#else
            s->prevAnim == 0xFFFF;
#endif
        r2;
    });

top:
    s->x = I(p->qWorldX) - camX;
    s->y = I(p->qWorldY) - camY;

    psi->transform.x = I(p->qWorldX) - camX;
    psi->transform.y = I(p->qWorldY) - camY;

    if (
#if (GAME == GAME_SA1)
        p->charState == CHARSTATE_WALK_A || p->charState == CHARSTATE_BOUNCE || p->charState == CHARSTATE_32 || p->charState == CHARSTATE_40
#elif (GAME == GAME_SA2)
        p->charState == CHARSTATE_WALK_A || p->charState == CHARSTATE_GRINDING
#ifndef COLLECT_RINGS_ROM
        || p->charState == CHARSTATE_ICE_SLIDE || p->charState == CHARSTATE_BOUNCE
        || (p->charState == CHARSTATE_CREAM_CHAO_ATTACK && p->character == CHARACTER_CREAM)
#endif
#endif
    ) {
#if (GAME == GAME_SA1)
        if (p->charState != CHARSTATE_32)
#endif
        {
            psi->transform.rotation = p->rotation << 2;
        }
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
        acmdRes = UpdateSpriteAnimation(s);
#if (GAME == GAME_SA1)
        if (acmdRes == ACMD_RESULT__ENDED) {
            s8 oldCharState = p->charState; // sp04

            // TODO: Seems like this is a switch-case?
            if (p->charState == CHARSTATE_7) {
                p->charState = CHARSTATE_SPINDASH;
            } else if (p->charState == CHARSTATE_3) {
                if (p->qSpeedGround != 0) {
                    p->charState = CHARSTATE_WALK_A;
                } else {
                    p->charState = CHARSTATE_IDLE;
                }
            } else if (p->charState == CHARSTATE_11) {
                p->charState = CHARSTATE_IDLE;
            } else if (p->charState == CHARSTATE_22) {
                p->charState = CHARSTATE_WALK_A;
            } else if (p->charState == CHARSTATE_17) {
                p->charState = CHARSTATE_19;
            } else if (p->charState == CHARSTATE_18) {
                p->charState = CHARSTATE_19;
            } else if (p->charState == CHARSTATE_27) {
                p->charState = CHARSTATE_WALK_A;
            } else if (p->charState == CHARSTATE_74) {
                // _0804652C + 0x4
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->qWorldX -= Q(p->spriteOffsetX + 3);
                } else {
                    // _08046548
                    p->qWorldX += Q(p->spriteOffsetX + 3);
                }
                PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);

                // TODO: What is going on here?
                if (GRAVITY_IS_INVERTED) {
                    p->qWorldY += Q(p->spriteOffsetY);
                } else {
                    p->qWorldY -= Q(14);
                }
                // _0804657E

                p->charState = CHARSTATE_75;

                p->SA2_LABEL(unk62)++;

            } else if (p->charState == CHARSTATE_75) {
                // _08046594 + 0x4
                p->rotation = 0;
                SA2_LABEL(sub_8021BE0)(p);
            } else if (p->charState == CHARSTATE_45 || p->charState == CHARSTATE_48) {
                // _080465A4
                p->moveState &= ~MOVESTATE_20;
                p->moveState &= ~MOVESTATE_100;
                p->moveState &= ~MOVESTATE_SPINDASH;

                p->SA2_LABEL(unk61) = 0;
                p->SA2_LABEL(unk62) = 0;
                p->SA2_LABEL(unk63) = 0;
                p->moveState &= ~MOVESTATE_8000;

                if (p->character == CHARACTER_TAILS) {
                    m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
                }
                // _080465E0

                if (p->character == CHARACTER_AMY) {
                    p->moveState &= ~(MOVESTATE_2000000 | MOVESTATE_4000000);
                }
                // _080465F0
                if (p->qSpeedGround != 0) {
                    p->charState = CHARSTATE_WALK_A;
                } else {
                    p->charState = CHARSTATE_IDLE;
                }
            } else if (p->charState == CHARSTATE_46) {
                // _08046608 + 0xA
                if (p->SA2_LABEL(unk63) == 1) {
                    if (p->moveState & MOVESTATE_FACING_LEFT) {
                        p->qSpeedGround = -Q(4);
                    } else {
                        p->qSpeedGround = +Q(4);
                    }
                    // _08046632

                    p->SA2_LABEL(unk62)++;
                    p->SA2_LABEL(unk63) = 0;

                    p->charState = CHARSTATE_47;

                    m4aSongNumStart(SE_SONIC_SKID_ATTACK);
                } else if (p->SA2_LABEL(unk63) == 2) {
                    // _0804664E + 0x4
                    p->moveState &= ~MOVESTATE_20;
                    p->moveState &= ~MOVESTATE_100;
                    p->moveState &= ~MOVESTATE_SPINDASH;

                    p->SA2_LABEL(unk61) = 0;
                    p->SA2_LABEL(unk62) = 0;
                    p->SA2_LABEL(unk63) = 0;
                    p->moveState &= ~MOVESTATE_8000;

                    if (p->character == CHARACTER_TAILS) {
                        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
                    }
                    // _0804668C

                    if (p->character == CHARACTER_AMY) {
                        p->moveState &= ~(MOVESTATE_2000000 | MOVESTATE_4000000);
                    }
                    // _0804669C

                    p->qSpeedAirX = -p->qSpeedAirX;
                    p->qSpeedAirY = -Q(4.875);

                    if (p->moveState & MOVESTATE_IN_WATER) {
                        p->qSpeedAirY = -Q(2.625);
                    }
                    // _080466B4

                    p->moveState |= MOVESTATE_IN_AIR;
                    p->moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

                    p->charState = CHARSTATE_49;

                    m4aSongNumStart(SE_JUMP);
                } else {
                    // _080466F0
                    p->SA2_LABEL(unk62) = 0;
                    p->SA2_LABEL(unk63) = 0;
                    p->charState = CHARSTATE_IDLE;
                    p->defeatScoreIndex = 0;
                    p->qSpeedGround = 0;
                }

            } else if (p->charState == CHARSTATE_54) {
                // _08046704 + 4
                p->charState = CHARSTATE_FLYING;
            } else if (p->charState == CHARSTATE_58) {
                p->charState = CHARSTATE_SWIMMING;
            } else if (p->charState == CHARSTATE_GROUND_ATTACK) {
                // _08046714 + 0x4

                p->SA2_LABEL(unk62) = 0;
                p->SA2_LABEL(unk63) = 0;

                if (p->qSpeedGround == 0) {
                    p->charState = CHARSTATE_IDLE;
                } else {
                    p->charState = CHARSTATE_WALK_A;
                }

                p->defeatScoreIndex = 0;
            } else if (p->charState == CHARSTATE_64) {
                SA2_LABEL(sub_8021BE0)(p);
            } else if (p->charState == CHARSTATE_70) {
                p->charState = CHARSTATE_71;
            } else if (p->charState == CHARSTATE_76 || p->charState == CHARSTATE_77) {
                // _0804674E + 0xA

                if (p->SA2_LABEL(unk63) != 0) {
                    s32 qSpeed;

                    p->SA2_LABEL(unk62)++;
                    p->SA2_LABEL(unk63) = 0;

                    if (p->charState == CHARSTATE_77) {
                        m4aSongNumStart(SE_127);
                    } else {
                        m4aSongNumStart(SE_126);
                    }
                    // _08046788

                    p->charState++;

                    qSpeed = Q(3);
                    if (p->moveState & MOVESTATE_FACING_LEFT) {
                        qSpeed = -qSpeed;
                    }
                    p->qSpeedGround += qSpeed;
                } else {
                    // _080467A6
                    p->SA2_LABEL(unk62) = 0;
                    p->SA2_LABEL(unk63) = 0;
                    p->charState = CHARSTATE_IDLE;
                    p->defeatScoreIndex = 0;
                    p->qSpeedGround = 0;
                }
            } else if (p->charState == CHARSTATE_87) {
                s32 qSpeed;
                // _080467B8 + 0x4

                if (p->SA2_LABEL(unk63) == 0) {
                    p->SA2_LABEL(unk62) = 0;

                    if (p->qSpeedGround != 0) {
                        p->charState = CHARSTATE_WALK_A;
                    } else {
                        p->charState = CHARSTATE_IDLE;
                    }
                } else {
                    p->SA2_LABEL(unk63) = 0;
                    p->SA2_LABEL(unk62)++;
                    p->charState = CHARSTATE_88;

                    qSpeed = Q(3);
                    if (p->moveState & MOVESTATE_FACING_LEFT) {
                        qSpeed = -qSpeed;
                    }
                    p->qSpeedGround += qSpeed;

                    CreateAmyAttackHeartEffect();
                }
            } else if (p->charState == CHARSTATE_88) {
                p->SA2_LABEL(unk62) = 0;

                if (p->qSpeedGround != 0) {
                    p->charState = CHARSTATE_WALK_A;
                } else {
                    p->charState = CHARSTATE_IDLE;
                }
            } else if (p->charState == CHARSTATE_93) {
                p->SA2_LABEL(unk62) = 0;
                p->SA2_LABEL(unk63) = 0;
                p->charState = CHARSTATE_IDLE;
                p->defeatScoreIndex = 0;
            }

            // _08046836
            if (p->charState != oldCharState) {
                SA2_LABEL(sub_802486C)(p, inPsi);
                goto top;
            }
        }
#endif
    }

#ifndef COLLECT_RINGS_ROM
    if (IS_SINGLE_PLAYER)
#endif
    {
#ifndef COLLECT_RINGS_ROM
        // Draw Player sprite in SP modes
        if (p->moveState & MOVESTATE_DEAD
            || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
            DisplaySprite(s);
        }
#endif

        if (IS_SINGLE_PLAYER) {
            return;
        }
    }

    send = &gMultiSioSend.pat4;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
#if (GAME == GAME_SA1)
    send->unk0 = 0x1000;
#elif (GAME == GAME_SA2)
    send->unk0 = 0x5000;
#endif
    send->x = I(p->qWorldX) + p->SA2_LABEL(unk7C);
    send->y = I(p->qWorldY);
    send->unk6 = s->graphics.anim;
    send->unkA = p->itemEffect;
    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
        send->unk6 -= gPlayerCharacterIdleAnims[p->character];
#endif
#endif
        send->unk6 |= gRingCount << 8;
    }
#if (GAME == GAME_SA1)
    else if (gGameMode == 4 || gGameMode == 5) {
        send->unk6 |= (mpp->unk5C & 0x70000) >> 4;
    }
#endif

    send->unkB = s->variant |
#if (GAME == GAME_SA1)
        (p->spriteOffsetY << 3);
#elif (GAME == GAME_SA2)
        (p->spriteOffsetY << 4);
#endif
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

    if (p->moveState & MOVESTATE_DEAD || mpp->unk5C & 1
#if (GAME == GAME_SA2)
        || p->moveState & MOVESTATE_IN_SCRIPTED
#endif
        || p->timerInvulnerability != 0) {
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

void SA2_LABEL(sub_8024F74)(Player *p, PlayerSpriteInfo *inPsi)
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
        s->animSpeed = SPRITE_ANIM_SPEED(0.5);
    }

    switch (p->character) {
        case CHARACTER_AMY:
        case CHARACTER_KNUCKLES:
        case CHARACTER_SONIC:
            break;
#if (GAME == GAME_SA2)
        case CHARACTER_CREAM: {
            u16 anim = p->anim;
            u16 variant = p->variant;
            anim = anim - gPlayerCharacterIdleAnims[p->character];
            if (MACRO_8024F74_ANIM_CHECK(anim, variant)) {
                u8 rotation = p->rotation;
                p->w.cf.unkB0 = rotation;
                psi->transform.rotation = rotation << 2;
                s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
                s->frameFlags |= gOamMatrixIndex++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

                MACRO_8024B10_PSI_UPDATE(p, psi);
                TransformSprite(s, &psi->transform);

                if (p->moveState & MOVESTATE_DEAD
                    || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
                    DisplaySprite(s);
                }
            }
            break;
        }
#endif
        case CHARACTER_TAILS: {
            s32 asx = p->qSpeedAirX;
            s32 asy = p->qSpeedAirY;

            u16 anim = p->anim;
            u16 variant = p->variant;
            anim = anim - gPlayerCharacterIdleAnims[p->character];
#if (GAME == GAME_SA2)
            if (MACRO_8024F74_ANIM_CHECK(anim, variant))
#endif
            {
                u8 shift;
                if (asx != 0 || asy != 0) {
                    shift = (I(ArcTan2(asx, asy)) + 0x40);
                } else {
                    shift = p->moveState & MOVESTATE_FACING_LEFT ? 0xC0 : 0x40;
                }
                p->w.tf.shift = shift;

#if (GAME == GAME_SA1)
                if (p->charState == CHARSTATE_SPINATTACK)
#endif
                {
                    psi->transform.rotation = shift << 2;
                    s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
                    s->frameFlags |= gOamMatrixIndex++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

                    MACRO_8024B10_PSI_UPDATE(p, psi);
                    TransformSprite(s, &psi->transform);

                    if (p->moveState & MOVESTATE_DEAD
                        || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
                        DisplaySprite(s);
                    }
                }
            }
            break;
        }
    }
}
#endif

#if (GAME == GAME_SA2)
void Player_TouchGround(Player *p)
{
    u32 mask;
#ifndef COLLECT_RINGS_ROM
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            Player_8025F84(p);
            return;
        }
    }
#endif
#ifndef COLLECT_RINGS_ROM
    mask = (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR);
    if ((p->moveState & mask) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
    } else
#endif
    {
#ifndef COLLECT_RINGS_ROM
        Player_TransitionCancelFlyingAndBoost(p);
#else
        p->moveState &= ~(MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000
                          | MOVESTATE_20000 | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_SPINDASH | MOVESTATE_200
                          | MOVESTATE_100 | MOVESTATE_20 | MOVESTATE_FLIP_WITH_MOVE_DIR);

        p->SA2_LABEL(unk61) = 0;
        p->SA2_LABEL(unk62) = 0;
        p->SA2_LABEL(unk63) = 0;
        p->unk71 = 0;
        p->unk70 = FALSE;

#endif

        p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_IN_AIR);

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
#ifndef COLLECT_RINGS_ROM
    if ((p->moveState & (MOVESTATE_GOAL_REACHED | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_GOAL_REACHED) {
        Player_InitReachedGoal(p);
        return;
    }

    if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
        return;
    }
#endif

    if (!Player_TryTaunt(p) && !Player_TryCrouchOrSpinAttack(p) && !Player_TryJump(p)
#ifndef COLLECT_RINGS_ROM
        && !Player_TryAttack(p)
#endif
    ) {

        Player_HandleGroundMovement(p);

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0) {
                p->qSpeedGround += acceleration;
            }
        }

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

        PLAYERFN_UPDATE_UNK2A(p);
#ifndef COLLECT_RINGS_ROM
        if (p->moveState & MOVESTATE_8000) {
            p->moveState &= ~MOVESTATE_IN_AIR;
        } else
#endif
            if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

void Player_8025548(Player *p)
{
    if (!Player_TryCrouchOrSpinAttack(p) && !Player_TryJump(p)
#ifndef COLLECT_RINGS_ROM
        && ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || !Player_TryAttack(p))
#endif
    ) {
        if (p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
            PLAYERFN_SET(Player_TouchGround);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(p->rotation);

            if (p->qSpeedGround != 0)
                p->qSpeedGround += acceleration;
        }

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

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

    if (!Player_TryCrouchOrSpinAttack(p) && !Player_TryJump(p)
#ifndef COLLECT_RINGS_ROM
        && !Player_TryAttack(p)
#endif
    ) {
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

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

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

    if (!Player_TryInitSpindash(p) && !Player_TryJump(p)
#ifndef COLLECT_RINGS_ROM
        && !Player_TryAttack(p)
#endif
    ) {
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

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

#ifndef COLLECT_RINGS_ROM
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

        p->moveState |= MOVESTATE_SPIN_ATTACK;
        p->SA2_LABEL(unk99)[0] = 0;
        PLAYERFN_SET_AND_CALL(Player_Rolling, p);
    }
}
#endif

void Player_Rolling(Player *p)
{
#ifndef COLLECT_RINGS_ROM
    if ((p->moveState & (MOVESTATE_GOAL_REACHED | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_GOAL_REACHED) {
        Player_InitReachedGoal(p);
        return;
    }
    if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide(p);
        return;
    }
#endif

    if (p->SA2_LABEL(unk99)[0] != 0) {
        p->SA2_LABEL(unk99)[0]--;
    } else if (!Player_TryJump(p)) {
        if (p->SA2_LABEL(unk2A) == 0) {
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

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);
        SA2_LABEL(sub_8023128)(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_SET(Player_Jumping);
        }
    }
}

void Player_InitJump(Player *p)
{
    u8 rot;
    s32 jumpHeight;
    s32 accelX, accelY;
#if COLLECT_RINGS_ROM && !defined(NON_MATCHING)
    register u32 r3 asm("r3") = 0;
#else
    u32 r3 = 0;
#endif

#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    p->moveState &= ~(MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_SPINDASH | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_FLIP_WITH_MOVE_DIR);

    p->SA2_LABEL(unk61) = r3;
    p->SA2_LABEL(unk62) = r3;
    p->SA2_LABEL(unk63) = r3;
    p->unk71 = r3;
    p->unk70 = r3;

#endif

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if (p->moveState & MOVESTATE_SPIN_ATTACK) {
        p->moveState |= MOVESTATE_FLIP_WITH_MOVE_DIR;
    }

    if (ABS(p->qSpeedAirX) < Q(1.25)) {
        p->charState = CHARSTATE_JUMP_1;
    } else {
        p->charState = CHARSTATE_JUMP_2;
    }

#ifndef COLLECT_RINGS_ROM
    p->unk70 = TRUE;
    jumpHeight = (p->moveState & MOVESTATE_IN_WATER) ? Q(PLAYER_JUMP_HEIGHT_UNDER_WATER) : Q(PLAYER_JUMP_HEIGHT);
#else
    jumpHeight = Q(PLAYER_JUMP_HEIGHT);
#endif

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

#ifndef COLLECT_RINGS_ROM
    if (p->moveState & MOVESTATE_IN_WATER) {
        maxJumpSpeed = -Q(PLAYER_MAX_NOT_HELD_JUMP_FORCE_UNDER_WATER);
    }
#endif

    if (p->moveState & MOVESTATE_100) {
#ifndef COLLECT_RINGS_ROM
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            if (Player_Sonic_TryForwardThrust(p) || Player_TryMidAirAction(p))
                return;
#endif

        // Caps the jump force if the player lets go of the jump button
        if (p->qSpeedAirY < maxJumpSpeed && !(p->heldInput & gPlayerControls.jump)) {
            p->qSpeedAirY = maxJumpSpeed;
        }
    }

    sub_80246DC(p);
    Player_AirInputControls(p);
#ifndef COLLECT_RINGS_ROM
    if (!IS_BOSS_STAGE(gCurrentLevel))
#endif
    {
        sub_80236C8(p);
    }

    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

#ifndef COLLECT_RINGS_ROM
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
#endif

void Player_InitUncurl(Player *p)
{
#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    p->moveState &= ~(MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_SPINDASH | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_FLIP_WITH_MOVE_DIR);

    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;
    p->unk71 = 0;
    p->unk70 = FALSE;
#endif
    p->moveState |= (MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((p->spriteOffsetX < 6) || (p->spriteOffsetY < 9)) {
#ifndef COLLECT_RINGS_ROM
        u16 chAnim = GET_CHARACTER_ANIM(p);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1) || (chAnim == SA2_CHAR_ANIM_JUMP_2)
            || (chAnim == SA2_CHAR_ANIM_70))
#endif
        {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        }
#ifndef COLLECT_RINGS_ROM
        else {
            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        }
#endif
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
#ifndef COLLECT_RINGS_ROM
    if ((p->unk6E != 1) || (p->qSpeedAirY > 0))
#endif
    {

        Player_AirInputControls(p);
#ifndef COLLECT_RINGS_ROM
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->moveState & MOVESTATE_100)) {
            if (Player_Sonic_TryForwardThrust(p) || Player_TryMidAirAction(p))
                return;
        }
#endif
    }
#ifndef COLLECT_RINGS_ROM
    if (!IS_BOSS_STAGE(gCurrentLevel))
#endif
    {
        sub_80236C8(p);
    }

    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

#ifndef COLLECT_RINGS_ROM
void Player_InitSpindash(Player *p)
{
    p->charState = CHARSTATE_SPIN_DASH;

    p->moveState |= (MOVESTATE_SPINDASH | MOVESTATE_SPIN_ATTACK);
    p->moveState &= ~(MOVESTATE_20 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->qSpindashAccel = 0;
    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
    p->qSpeedGround = 0;

    m4aSongNumStart(SE_SPIN_ATTACK);
    CreateSpindashDustEffect();

    PLAYERFN_SET_AND_CALL(Player_Spindash, p);
}
#endif

void Player_Spindash(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    u16 cAnim = GET_CHARACTER_ANIM(p);

    if (!(p->heldInput & DPAD_DOWN)) {
        s16 index;
        s32 speed;
        p->moveState &= ~MOVESTATE_SPINDASH;

        index = I(p->qSpindashAccel);
        if (index > 8)
            index = 8;

        speed = sSpinDashSpeeds[index];
        if (p->moveState & MOVESTATE_FACING_LEFT)
            speed = -sSpinDashSpeeds[index];

        p->qSpeedGround = speed;

        gPlayer.callback = Player_SpinAttack;

        m4aSongNumStart(SE_SPIN_DASH_RELEASE);
    } else {
        s16 pitch = p->qSpindashAccel;

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
        p->qSpindashAccel = pitch;

        if ((cAnim == SA2_CHAR_ANIM_SPIN_DASH) && (p->variant == 1) && (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            p->variant = 0;
        }
    }

    if (p->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(p);
        SA2_LABEL(sub_80232D0)(p);

#ifndef COLLECT_RINGS_ROM
        if (p->moveState & MOVESTATE_IN_WATER) {
            p->qSpeedAirY += Q(PLAYER_GRAVITY_UNDER_WATER);
        } else
#endif
        {
            p->qSpeedAirY += Q(PLAYER_GRAVITY);
        }

        p->qWorldX += p->qSpeedAirX;
#ifndef COLLECT_RINGS_ROM
        if ((gStageFlags ^ gPrevStageFlags) & STAGE_FLAG__GRAVITY_INVERTED) {
            p->qSpeedAirY = -p->qSpeedAirY;
        }
#endif

        p->qSpeedAirY = MIN(p->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX));
#ifndef COLLECT_RINGS_ROM
        p->qWorldY = GRAVITY_IS_INVERTED ? p->qWorldY - p->qSpeedAirY : p->qWorldY + p->qSpeedAirY;
#else
        p->qWorldY = p->qWorldY + p->qSpeedAirY;
#endif

        {
            s32 rot = (s8)p->rotation;
            if (rot < 0) {
                rot = MIN((rot + 2), 0);
            } else if (rot > 0) {
                rot = MAX((rot - 2), 0);
            }
            p->rotation = rot;
        }

        SA2_LABEL(sub_8022190)(p);

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

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);
        SA2_LABEL(sub_8023128)(p);

        p->qWorldX += p->qSpeedAirX;
#ifndef COLLECT_RINGS_ROM
        if ((gStageFlags ^ gPrevStageFlags) & STAGE_FLAG__GRAVITY_INVERTED) {
            p->qSpeedAirY = -p->qSpeedAirY;
        }
#endif

        p->qSpeedAirY = MIN(p->qSpeedAirY, Q(PLAYER_AIR_SPEED_MAX));

#ifndef COLLECT_RINGS_ROM
        p->qWorldY = GRAVITY_IS_INVERTED ? p->qWorldY - p->qSpeedAirY : p->qWorldY + p->qSpeedAirY;
#else
        p->qWorldY = p->qWorldY + p->qSpeedAirY;
#endif

        SA2_LABEL(sub_8022D6C)(p);

        if (p->SA2_LABEL(unk2A)) {
            p->SA2_LABEL(unk2A) -= 1;
        } else if ((p->rotation + 32) & 0xC0) {
            s32 absGroundSpeed = ABS(p->qSpeedGround);
            if (absGroundSpeed < Q(1.875)) {
                p->qSpeedGround = 0;

                p->moveState |= MOVESTATE_IN_AIR;
                p->SA2_LABEL(unk2A) = GBA_FRAMES_PER_SECOND / 2;
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
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        newY = sub_801E6D4(I(p->qWorldY) - p->spriteOffsetY, I(p->qWorldX), p->layer, -8, NULL, SA2_LABEL(sub_801EE64));

        p->qWorldY = p->qWorldY - Q(newY);
    } else
#endif
    {
        newY = sub_801E6D4(I(p->qWorldY) + p->spriteOffsetY, I(p->qWorldX), p->layer, 8, NULL, SA2_LABEL(sub_801EE64));

        p->qWorldY = p->qWorldY + Q(newY);
    }
    p->moveState &= ~MOVESTATE_IN_AIR;

    gPlayer.moveState |= MOVESTATE_IN_SCRIPTED;
}

void Player_InitGrinding(Player *p)
{
#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    p->moveState &= ~(MOVESTATE_SOME_ATTACK | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_SPINDASH | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_FLIP_WITH_MOVE_DIR);

    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;
    p->unk71 = 0;
    p->unk70 = FALSE;
#endif

    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
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

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

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
            return;
        }
#ifndef COLLECT_RINGS_ROM
        if (IS_SINGLE_PLAYER) {
            CreateGrindEffect2();
        }
#endif
    }
}

void Player_InitGrindRailEndGround(Player *p)
{
#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    Player_TransitionCancelBoost(p);
#endif

    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
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
#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    Player_TransitionCancelBoost(p);
#endif

    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

#ifndef COLLECT_RINGS_ROM
    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->heldInput & gPlayerControls.jump)
        && (p->character == CHARACTER_SONIC || p->character == CHARACTER_AMY)) {
        p->charState = CHARSTATE_GRINDING_SONIC_AMY_JUMP_OFF;
        p->qSpeedAirY = -Q(7.5);
    } else
#endif
    {
        p->charState = CHARSTATE_SPRING_C;
        p->qSpeedAirY = -Q(4.875);
    }

#ifndef COLLECT_RINGS_ROM
    if (p->moveState & MOVESTATE_IN_WATER)
        p->qSpeedAirY /= 2;
#endif

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
void Player_8026D2C(Player *p);

#if COLLECT_RINGS_ROM
void Player_802A258(Player *p)
{
    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        if (p->moveState & MOVESTATE_SPIN_ATTACK) {
            p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            p->charState = CHARSTATE_SPIN_ATTACK;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

            p->moveState |= MOVESTATE_SPIN_ATTACK;
            p->SA2_LABEL(unk99)[0] = 0;
            PLAYERFN_SET_AND_CALL(Player_Rolling, p);
        } else {
            Player_TouchGround(p);
        }
    } else {
        p->moveState |= MOVESTATE_40000;
        p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

        PLAYERFN_SET_AND_CALL(Player_8026D2C, p);
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
void sub_8026B64(Player *p)
{
    s16 groundSpeed = p->qSpeedGround;

    if ((p->SA2_LABEL(unk2A) == 0) && (p->heldInput & (DPAD_LEFT | DPAD_RIGHT))) {
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
        SA2_LABEL(sub_8023128)(p);

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
            s32 accel = GET_ROTATED_ACCEL(p->rotation);
            if (p->qSpeedGround)
                p->qSpeedGround += accel;
        }

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_8023260)(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        }

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

        PLAYERFN_UPDATE_UNK2A(p);

        if (p->moveState & MOVESTATE_IN_AIR) {
            p->charState = CHARSTATE_FALLING_VULNERABLE_B;

            PLAYERFN_SET(Player_Jumping);
        } else if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ)) != MOVESTATE_ICE_SLIDE) {
            PLAYERFN_SET(Player_TouchGround);
        }
    }
}
#endif

static inline void sub_802A500_inline(Player *p)
{
#ifndef COLLECT_RINGS_ROM
    if (p->qSpeedAirY >= 0) {
        sub_8022218(p);
        SA2_LABEL(sub_8022284)(p);
    } else {
        SA2_LABEL(sub_8022284)(p);
        sub_8022218(p);
    }
#else
    sub_0200DBE0(p);
#endif
}

void Player_8026D2C(Player *p)
{
    sub_80246DC(p);
    Player_AirInputControls(p);
    sub_80236C8(p);
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);

    sub_802A500_inline(p);

    PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p);
}

#ifndef COLLECT_RINGS_ROM
void Player_InitPipeEntry(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_SPIN_ATTACK);

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

static inline void Player_InitIceSlide_inline(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_ICE_SLIDE;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    m4aSongNumStart(SE_ICE_PARADISE_SLIDE);

    PLAYERFN_SET_AND_CALL(Player_8026BCC, p);
}

void Player_InitPipeExit(Player *p)
{
    if ((p->moveState & (MOVESTATE_ICE_SLIDE | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) == MOVESTATE_ICE_SLIDE) {
        Player_InitIceSlide_inline(p);
    } else {
        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->charState = CHARSTATE_SPIN_ATTACK;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_SPIN_ATTACK;

        p->SA2_LABEL(unk99)[0] = 30;

        PLAYERFN_SET_AND_CALL(Player_Rolling, p);
    }
}

void Player_InitPropellorSpring(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_SPIN_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if (p->heldInput & DPAD_LEFT) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    }
    if (p->heldInput & DPAD_RIGHT) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    p->charState = CHARSTATE_BOUNCE;
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
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_InitCorkscrew(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    if ((!(p->moveState & MOVESTATE_SPIN_ATTACK) || (p->charState != CHARSTATE_SPIN_ATTACK))) {
        p->charState = CHARSTATE_IN_CORKSCREW;
        p->moveState &= ~MOVESTATE_SPIN_ATTACK;

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

    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_UNK2A(p);
}
#endif

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

#ifndef COLLECT_RINGS_ROM
    if (p->moveState & MOVESTATE_IN_WATER) {
        p->qSpeedAirY >>= 1;
        p->qSpeedAirX >>= 1;
    }
    Player_TransitionCancelFlyingAndBoost(p);
#else
    Player_TransitionCancelBoost(p);
#endif

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_200 | MOVESTATE_STOOD_ON_OBJ | MOVESTATE_SPIN_ATTACK);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(Player_Hurt, p);
}

void Player_Hurt(Player *p)
{
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

#ifndef COLLECT_RINGS_ROM
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

            p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_FACING_LEFT);

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

// TODO: Find a compiler-flag or another way to inline without defining functions twice.
static inline void Player_CameraShift_inline(Player *p)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;
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

            SA2_LABEL(sub_80232D0)(p);
            SA2_LABEL(sub_8023260)(p);

            PLAYERFN_UPDATE_POSITION(p);

            SA2_LABEL(sub_8022D6C)(p);

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

    SA2_LABEL(sub_8029FA4)(p);
    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8023260)(p);

    PLAYERFN_UPDATE_POSITION(p);

    SA2_LABEL(sub_8022D6C)(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void Player_InitVictoryPoseTransition(Player *p)
{
    Player_CameraShift_inline(p);

    p->SA2_LABEL(unk72) = TIME(0, 1.5);

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

    if (--p->SA2_LABEL(unk72) == 0) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
        } else {
            CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
        }
        PLAYERFN_SET(Player_CameraShift);
    }

    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8023260)(p);

    PLAYERFN_UPDATE_POSITION(p);

    SA2_LABEL(sub_8022D6C)(p);

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

    if (p->SA2_LABEL(unk72) < INT16_MAX)
        p->SA2_LABEL(unk72)++;

    if (p->SA2_LABEL(unk72) == 120) {
        p->charState = CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS;
    }

    if (p->SA2_LABEL(unk72) == 180) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
        } else {
            CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
        }
    }

    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8023260)(p);

    PLAYERFN_UPDATE_POSITION(p);

    SA2_LABEL(sub_8022D6C)(p);

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
    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8023260)(p);

    PLAYERFN_UPDATE_POSITION(p);

    SA2_LABEL(sub_8022D6C)(p);

    PLAYERFN_UPDATE_UNK2A(p);

    gCamera.SA2_LABEL(unk8) -= 56;
}

void Player_8027C5C(Player *p)
{
    // TODO: Maybe this is actually to be considered the p's
    //       x-position relative to a sprite region?
    s32 playerX = I(p->qWorldX) - gCamera.x;

    if (playerX > DISPLAY_CENTER_X) {
        p->qSpeedGround = Q(4.5);
    } else if (playerX < DISPLAY_CENTER_X) {
        p->qSpeedGround = Q(5.5);
    } else {
        p->qSpeedGround = Q(5.0);
    }

    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8023260)(p);

    PLAYERFN_UPDATE_POSITION(p);

    SA2_LABEL(sub_8022D6C)(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void Player_HandleMultiplayerFinish(Player *p)
{
    u16 rank = gMultiplayerRanks[SIO_MULTI_CNT->id];
    s32 *pCmpX = &gStageGoalX;
    u32 cmpX;
    s32 finalXPos = ((8 * TILE_WIDTH) + (rank * (4 * TILE_WIDTH)));

    cmpX = Q(*pCmpX + finalXPos);
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

    SA2_LABEL(sub_80232D0)(p);
    SA2_LABEL(sub_8023260)(p);

    PLAYERFN_UPDATE_POSITION(p);

    SA2_LABEL(sub_8022D6C)(p);

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
        if (rank < MULTI_SIO_PLAYERS_MAX) {
            p->charState = CHARSTATE_ACT_CLEAR_A;
        } else {
            p->charState = CHARSTATE_IDLE;
        }

        p->moveState &= ~MOVESTATE_FACING_LEFT;
        p->SA2_LABEL(unk72) = 0;
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
        SA2_LABEL(sub_80232D0)(p);

        PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
        PLAYERFN_UPDATE_POSITION(p);
        PLAYERFN_UPDATE_ROTATION(p);
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
    } else {
        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_80231C0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

        PLAYERFN_UPDATE_UNK2A(p);
    }
}

// Generic function for movement and collision that doesn't allow player influence
void Player_HandlePhysics(Player *p)
{
    if (p->moveState & MOVESTATE_IN_AIR) {
        SA2_LABEL(sub_80232D0)(p);

        PLAYERFN_UPDATE_POSITION(p);
        PLAYERFN_UPDATE_ROTATION(p);
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
    } else {
        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_80231C0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

        PLAYERFN_UPDATE_UNK2A(p);
    }
}

void SA2_LABEL(sub_8028204)(Player *p)
{
    Player_AirInputControls(p);
    sub_80236C8(p);
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void SA2_LABEL(sub_80282EC)(Player *p)
{
    p->acceleration >>= 1;

    Player_AirInputControls(p);

    if (p->character == CHARACTER_TAILS) {
        sub_80236C8(p);
    }

    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void SA2_LABEL(sub_80283C4)(Player *p)
{
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void sub_8028478(Player *p)
{
    if (p->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(p);
        SA2_LABEL(sub_80232D0)(p);

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

        SA2_LABEL(sub_80232D0)(p);
        SA2_LABEL(sub_80231C0)(p);
        SA2_LABEL(sub_8023260)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);

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
        p->SA2_LABEL(unk72) = 10;
    else if (mask & MASK_80D6992_8)
        p->SA2_LABEL(unk72) = 45;

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

    SA2_LABEL(sub_80232D0)(p);
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

    if (p->SA2_LABEL(unk72) != 0) {
        p->SA2_LABEL(unk72)--;
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

    SA2_LABEL(sub_80232D0)(p);

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
#endif

void Player_TouchNormalSpring(Player *p)
{
    u8 u6E = p->unk6E;
    u8 r5 = (u6E >> 4);
    u8 r6 = u6E % ARRAY_COUNT(sSpringAccelY);
#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    Player_TransitionCancelBoost(p);
#endif

    if (((r5 == 2) || (r5 == 3)) && !(p->moveState & MOVESTATE_IN_AIR)) {
        p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);
    } else {
        p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    }

    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

#ifndef COLLECT_RINGS_ROM
    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        p->charState = CHARSTATE_SPRING_MUSIC_PLANT;
    } else
#endif
        if (ABS(p->qSpeedAirX) < Q(2.5)) {
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

#ifndef COLLECT_RINGS_ROM
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
#endif

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
#ifndef COLLECT_RINGS_ROM
    DoTrickIfButtonPressed(p);
#endif
    Player_AirInputControls(p);
    sub_80236C8(p);
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

void Player_InitRampOrDashRing(Player *p)
{
#ifndef COLLECT_RINGS_ROM
    Player_TransitionCancelFlyingAndBoost(p);
#else
    Player_TransitionCancelBoost(p);
#endif
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
            qSpeedX = speed / 8u;
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
            qSpeedX = speed / 8u;
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
            qSpeedX = speed / 8u;
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
            qSpeedX = speed / 8u;
            qSpeedY = -ABS(groundSpeed) / 6;

            p->qSpeedAirX = qSpeedX + +Q(11.25);
            p->qSpeedAirY = qSpeedY + -Q(2.50);
        } break;
    }

#ifndef COLLECT_RINGS_ROM
    if (p->moveState & MOVESTATE_IN_WATER) {
        p->qSpeedAirY >>= 1;
    }
#endif

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
#ifndef COLLECT_RINGS_ROM
    DoTrickIfButtonPressed(p);
#endif
    sub_8023708(p);
    SA2_LABEL(sub_80232D0)(p);

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    PLAYERFN_UPDATE_ROTATION(p);
    PLAYERFN_MAYBE_TRANSITION_TO_GROUND(p);
}

#ifndef COLLECT_RINGS_ROM
void Player_DashRing(Player *p)
{
    if (--p->SA2_LABEL(unk72) == -1) {
        PLAYERFN_SET(Player_8029074);
    }

    sub_80246DC(p);
    DoTrickIfButtonPressed(p);
    SA2_LABEL(sub_80232D0)(p);

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
                        CreateSonicAmySkidAttackEffect(I(p->qWorldX), I(p->qWorldY), 1);
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
#endif

#if COLLECT_RINGS_ROM
void Player_InitSpindash(Player *p);

bool32 Player_TryInitSpindash(Player *p)
{
    u32 r6 = 0;
    if (p->charState == CHARSTATE_CROUCH) {
        if (p->frameInput & gPlayerControls.jump) {
            PLAYERFN_SET(Player_InitSpindash);
            p->charState = CHARSTATE_SPIN_DASH;

            p->moveState |= (MOVESTATE_SPINDASH | MOVESTATE_SPIN_ATTACK);
            p->moveState &= ~(MOVESTATE_20 | MOVESTATE_IN_AIR);

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

            p->qSpindashAccel = 0;
            p->qSpeedAirX = r6;
            p->qSpeedAirY = 0;
            p->qSpeedGround = 0;

            m4aSongNumStart(SE_SPIN_ATTACK);

            PLAYERFN_SET_AND_CALL(Player_Spindash, p);
            return TRUE;
        }
    }

    return FALSE;
}

#endif

void Player_HandleGroundMovement(Player *p)
{
    s8 charState = CHARSTATE_INVALID;
    s32 acc = p->acceleration;
    s32 dec = p->deceleration;

    if ((p->SA2_LABEL(unk2A) == 0) && p->heldInput & (DPAD_LEFT | DPAD_RIGHT)) {
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
#ifndef COLLECT_RINGS_ROM
                SA2_LABEL(sub_8029FA4)(p);
#endif
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
#ifndef COLLECT_RINGS_ROM
                    SA2_LABEL(sub_8029FA4)(p);
#endif
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

#ifndef COLLECT_RINGS_ROM
    if (p->moveState & MOVESTATE_8000) {
        if ((charState == CHARSTATE_BRAKE) || (charState == CHARSTATE_BRAKE_GOAL)) {
            p->charState = charState;
        }
    } else
#endif
        if (charState != CHARSTATE_INVALID) {
        if (p->charState != charState)
            p->charState = charState;
    } else if ((p->charState == CHARSTATE_BRAKE) || (p->charState == CHARSTATE_BRAKE_GOAL)) {
        p->charState = CHARSTATE_WALK_A;
    }

    SA2_LABEL(sub_8023128)(p);
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
                gCamera.SA2_LABEL(unk8) = 0x400;
#ifndef COLLECT_RINGS_ROM
                CreateBoostModeParticles();
                m4aSongNumStart(SE_221);
#endif
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
#endif

// ALIGNED UP TO HERE
void CallSetStageSpawnPos(u32 character, u32 level, u32 playerID, Player *p) { SetStageSpawnPos(character, level, playerID, p); }

#if (GAME == GAME_SA2)
#if COLLECT_RINGS_ROM
void CreatePlayer(u32 UNUSED characterId, u32 UNUSED levelId, Player *player)
{
    struct Task *t;
    player_0_Task *gt;

    Player *p = player;
    s32 playerID = p->playerID;

    p->spriteTask = TaskCreate(Task_PlayerMain, sizeof(player_0_Task), 0x3000, 0, TaskDestructor_Player);
    gt = TASK_DATA(p->spriteTask);
    gt->pid = playerID;
    gt->unk4 = 0;

    InitializePlayer(p);

    PLAYERFN_SET(Player_TouchGround);
    InitPlayerHitRingsScatter();

    gStageGoalX = 0;
    gWorldSpeedX = 0;
    gWorldSpeedY = 0;

    AllocateCharacterStageGfx(p, p->spriteInfoBody);
}
#endif
#endif

void DestroyPlayerTasks(Player *p)
{
    TaskDestroy(p->spriteTask);
    p->spriteTask = NULL;

    if (p->playerID == 0) {
#ifndef COLLECT_RINGS_ROM
        DestroyBrakingDustEffectRelatedTask();
#endif
        DestroyRingsScatterTask();
    }
}

#if COLLECT_RINGS_ROM
// Just call some inline function, possibly the inline
// functions were defined here but agbcc requires it be defined above
UNUSED void sub_020111F4(Player *p) { Player_TransitionCancelBoost(p); }
UNUSED void sub_0201121C(Player *p) { SA2_LABEL(sub_8022190)(p); }
#endif

#if (GAME == GAME_SA1)
// Not sure why it's defined here
void Player_TransitionCancelFlyingAndBoost(Player *p)
{
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_100;
    p->moveState &= ~MOVESTATE_SPINDASH;

    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;
    p->SA2_LABEL(unk63) = 0;

    p->moveState &= ~MOVESTATE_8000;

    if (p->character == CHARACTER_TAILS) {
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    }

    if (p->character == CHARACTER_AMY) {
        p->moveState &= ~(MOVESTATE_4000000 | MOVESTATE_2000000);
    }
}
#endif

s32 SA2_LABEL(sub_8029A28)(Player *p, u8 *rot, s32 *out)
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

    result = SA2_LABEL(sub_802195C)(p, rot, out);

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

s32 SA2_LABEL(sub_8029A74)(Player *p, u8 *rot, s32 *out)
{
    s32 result;

    u8 dummy;

    s32 dummyInt;
    s32 rotValue;

    if (rot == NULL)
        rot = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = SA2_LABEL(sub_8021A34)(p, rot, out);

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

s32 SA2_LABEL(sub_8029AC0)(Player *p, u8 *rot, s32 *out)
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

    result = SA2_LABEL(sub_8021B08)(p, rot, out);

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

s32 SA2_LABEL(sub_8029B0C)(Player *p, u8 *ret_rotation, s32 *out)
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

    result = SA2_LABEL(sub_8029BB8)(p, ret_rotation, out);

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

s32 SA2_LABEL(sub_8029B58)(Player *p, u8 *rot, s32 *out)
{
    s32 result;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029B0C)(p, rot, out);
    } else
#endif
    {
        result = SA2_LABEL(sub_8029AC0)(p, rot, out);
    }

    return result;
}

s32 SA2_LABEL(sub_8029B88)(Player *p, u8 *rot, s32 *out)
{
    s32 result;
#ifndef COLLECT_RINGS_ROM
    if (GRAVITY_IS_INVERTED) {
        result = SA2_LABEL(sub_8029AC0)(p, rot, out);
    } else
#endif
    {
        result = SA2_LABEL(sub_8029B0C)(p, rot, out);
    }

    return result;
}

// Very similar to SA2_LABEL(sub_802195C)
s32 SA2_LABEL(sub_8029BB8)(Player *p, u8 *rotation, s32 *out)
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

    r5 = SA2_LABEL(sub_801E4E4)(playerY2, playerX2, mask, 8, &anotherByte, SA2_LABEL(sub_801EE64));

    playerY = I(p->qWorldY) + p->spriteOffsetY;
    playerX = I(p->qWorldX) + (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->qSpeedAirY < 0) {
        mask |= 0x80;
    }

    r1 = SA2_LABEL(sub_801E4E4)(playerY, playerX, mask, 8, &anotherByte2, SA2_LABEL(sub_801EE64));

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

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
void SA2_LABEL(sub_8029C84)(Player *p)
{
    s32 rot = p->rotation + Q(0.25);

    if ((rot & UINT8_MAX) > INT8_MAX)
        p->qSpeedGround = 0;
}
#endif
#endif

void SA2_LABEL(sub_8029CA0)(Player *p)
{
#if (GAME == GAME_SA1)
    s32 rot;
    if (((p->rotation + Q(0.375)) & 0xFF) < Q(0.75))
#else
    s32 rot = p->rotation;
    if (((rot + Q(0.375)) & 0xFF) < Q(0.75))
#endif
    {
#if (GAME == GAME_SA1)
        rot = GET_ROTATED_ACCEL(p->rotation);
#else
        rot = GET_ROTATED_ACCEL(rot);
#endif

        if (p->qSpeedGround != 0) {
            p->qSpeedGround += rot;
        }
    }
}

void SA2_LABEL(sub_8029CE0)(Player *p)
{
    if (((p->rotation + DEG_TO_TURNS(135)) & (DEG_TO_TURNS(360) - 1)) < DEG_TO_TURNS(270)) {
#if (GAME == GAME_SA1)
        s8 rot;
#elif (GAME == GAME_SA2)
        s32 rot;
#endif
        rot = GET_ROTATED_ACCEL_2(p->rotation);

        p->qSpeedGround += rot;
    }
}

void SA2_LABEL(sub_8029D14)(Player *p)
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

#if (GAME == GAME_SA1)
// Code part of SA2_LABEL(sub_802A660)
// They merged Player_8047064 and Player_8047088 into one!
void Player_8047064(Player *p)
{
    s32 qSpeed = p->qSpeedGround;
    if (qSpeed <= Q(0)) {
        p->moveState |= MOVESTATE_FACING_LEFT;
    } else if (qSpeed - Q(24. / 256.) < Q(0)) {
        qSpeed = Q(96. / 256.);
        p->qSpeedGround = -qSpeed;
    } else {
        p->qSpeedGround = qSpeed - Q(24. / 256.);
    }
}

// Code part of SA2_LABEL(sub_802A660)
// They merged Player_8047064 and Player_8047088 into one!
void Player_8047088(Player *p)
{
    s32 qSpeed = p->qSpeedGround;
    if (qSpeed >= Q(0)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    } else if (qSpeed + Q(24. / 256.) > Q(0)) {
        qSpeed = Q(96. / 256.);
        p->qSpeedGround = +qSpeed;
    } else {
        p->qSpeedGround = qSpeed + Q(24. / 256.);
    }
}

void Player_80470AC(Player *p)
{
    s32 qSpeed = p->qSpeedGround;
    u32 rot;
#ifndef NON_MATCHING
    const s16 *sinTbl = &gSineTable[0];
    asm("" ::"r"(sinTbl));
#endif
    rot = p->rotation;

    p->qSpeedAirX = Q_MUL(qSpeed, COS_24_8(rot * 4));
    p->qSpeedAirY = Q_MUL(qSpeed, SIN_24_8(rot * 4));
}
#endif

void Player_UpdatePosition(Player *p) { PLAYERFN_UPDATE_POSITION(p); }

void PlayerFn_Cmd_UpdateAirFallSpeed(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED(p); }

bool32 SA2_LABEL(sub_8029DE8)(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 playerY = p->qWorldY;

#ifndef COLLECT_RINGS_ROM
    if (!(p->moveState & MOVESTATE_80000000)) {
#if (GAME == GAME_SA1)
        if (!GRAVITY_IS_INVERTED) {
            if (playerY >= Q(cam->maxY) - 1)
                return TRUE;
        } else {
            if (playerY <= Q(cam->minY))
                return TRUE;
        }
#elif (GAME == GAME_SA2)
        if (GRAVITY_IS_INVERTED) {
            if (playerY <= Q(cam->minY))
                return TRUE;
        } else {
            if (playerY >= Q(cam->maxY) - 1)
                return TRUE;
        }
#endif
    }
    return FALSE;
#else
    if ((p->moveState & MOVESTATE_80000000) || playerY < Q(cam->maxY) - 1) {
        return FALSE;
    }

    return TRUE;
#endif
}

// Might've been an inline func, but doesn't match with it.
UNUSED bool32 DeadPlayerLeftScreen_UnusedCopy(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 playerY = p->qWorldY;

#ifndef COLLECT_RINGS_ROM
    if (!(p->moveState & MOVESTATE_80000000)) {
#if (GAME == GAME_SA1)
        if (!GRAVITY_IS_INVERTED) {
            if (playerY >= Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1)
                return TRUE;
        } else {
            if (playerY <= Q(cam->y - 80))
                return TRUE;
        }
#elif (GAME == GAME_SA2)
        if (GRAVITY_IS_INVERTED) {
            if (playerY <= Q(cam->y - 80))
                return TRUE;
        } else {
            if (playerY >= Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1)
                return TRUE;
        }
#endif
    }

    return FALSE;
#else
    if ((p->moveState & MOVESTATE_80000000) || playerY < Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1) {
        return FALSE;
    }

    return TRUE;
#endif
}

#if (GAME == GAME_SA2)
bool32 Player_TryJump(Player *p)
{
    u8 rot = p->rotation;

    if (p->frameInput & gPlayerControls.jump) {
#ifndef COLLECT_RINGS_ROM
        if (GRAVITY_IS_INVERTED) {
            rot += Q(0.25);
            rot = -rot;
            rot -= Q(0.25);
        }
#endif

        if (SA2_LABEL(sub_8022F58)(rot + Q(0.5), p) > 3) {
            PLAYERFN_SET(Player_InitJump);
            return TRUE;
        }
    }

    return FALSE;
}
#endif

void SA2_LABEL(sub_8029ED8)(Player *p)
{
#if (GAME == GAME_SA1)
    // TODO: Is this part of the macro in SA1?
    if (!(p->moveState & MOVESTATE_ICE_SLIDE))
#endif
    {
        PLAYERFN_UPDATE_UNK2A(p);
    }
}

#if (GAME == GAME_SA2)
void sub_8029F20(Player *p) { PLAYERFN_UPDATE_ROTATION(p); }

#ifndef COLLECT_RINGS_ROM
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

void SA2_LABEL(sub_8029FA4)(Player *p)
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
#endif

void Player_SetMovestate_IsInScriptedSequence(void) { gPlayer.moveState |= MOVESTATE_IN_SCRIPTED; }

void Player_ClearMovestate_IsInScriptedSequence(void) { gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED; }

#ifndef COLLECT_RINGS_ROM
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
#endif
#endif

#if (GAME == GAME_SA1)
void Player_8047224(Player *p)
{
    s32 rot = (s8)p->rotation;

    if (p->charState == CHARSTATE_BOUNCE) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->rotation -= Q(4. / 256.);
        } else {
            p->rotation += Q(4. / 256.);
        }
    } else {
        if (rot < 0) {
            if (rot + 2 > 0) {
                rot = 0;
            } else {
                rot += 2;
            }
        } else if (rot > 0) {
            if (rot - 2 < 0) {
                rot = 0;
            } else {
                rot -= 2;
            }
        }

        p->rotation = rot;
    }
}

void Player_804726C(Player *p)
{
    if (p->playerID == PLAYER_1) {
        p->SA2_LABEL(unk25) = 120;
    }
}

void Player_8047280(Player *p)
{
    if (p->playerID == PLAYER_1) {
        if (gCamera.SA2_LABEL(unk4C) > 0) {
            gCamera.SA2_LABEL(unk4C) -= 2;
        } else if (gCamera.SA2_LABEL(unk4C) < 0) {
            gCamera.SA2_LABEL(unk4C) += 2;
        }
    }
}

void sub_80472AC(Player *p) { p->SA2_LABEL(unk72) = TIME(0, 6); }

void sub_80472B8(Player *p)
{
    if (!sub_8044434(p)) {
        sub_80449D8(p);
        SA2_LABEL(sub_80232D0)(p);

        PLAYERFN_UPDATE_POSITION(p);

        SA2_LABEL(sub_8022D6C)(p);
    }
}

void Player_InitializeDrowning(Player *p)
{
    p->framesUntilDrownCountDecrement = 60;
    p->secondsUntilDrown = 30;

#if (GAME == GAME_SA1)
    if (p->playerID == PLAYER_1) {
        m4aSongNumStop(MUS_DROWNING);
    }
#endif
}
#endif

void TaskDestructor_Player(struct Task *t)
{
    player_0_Task *gt = TASK_DATA(t);
    Player *p;
#if (GAME == GAME_SA1)
    if (gt->pid != PLAYER_1) {
        p = &gPartner;
    } else
#endif
    {
        p = &gPlayer;
    }

    p->spriteTask = NULL;

    if (p->playerID != PLAYER_1) {
        VramFree(p->spriteInfoBody->s.graphics.dest);
    }

#ifndef COLLECT_RINGS_ROM
    if (
#if (GAME == GAME_SA2)
        p->character == CHARACTER_CREAM ||
#endif
        p->character == CHARACTER_TAILS) {
        VramFree(p->spriteInfoLimbs->s.graphics.dest);
    }
#endif
}

#if (GAME == GAME_SA2)
#if COLLECT_RINGS_ROM
void SetStageSpawnPos(u32 character, u32 level, u32 playerID, Player *p)
{
    p->playerID = playerID;
    p->character = character;

    p->checkPointX = 360 - (SIO_MULTI_CNT->id * 20);
    p->checkPointY = 177;
    p->qWorldX = -1;
    p->qWorldY = -1;

    p->SA2_LABEL(unk98) = 0;
    p->checkpointTime = 0;
    p->spriteInfoBody = &gPlayerBodyPSI;
}
#endif

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
            && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_SPIN_ATTACK | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(Player_InitCrouch);
            return TRUE;
        } else if (((u16)(p->qSpeedGround + (Q(0.5) - 1)) > Q(1.0) - 2)
                   && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_SPIN_ATTACK | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(Player_SpinAttack);
            m4aSongNumStart(SE_SPIN_ATTACK);
            return TRUE;
        }
    }

    return FALSE;
}

#ifndef COLLECT_RINGS_ROM
bool32 Player_TryInitSpindash(Player *p)
{
    u32 r6 = 0;
    if (p->charState == CHARSTATE_CROUCH) {
        if (p->frameInput & gPlayerControls.jump) {
            PLAYERFN_SET_AND_CALL(Player_InitSpindash, p);
            return TRUE;
        }
    }

    return FALSE;
}
#endif

void Player_ApplyBoostPhysics(Player *p)
{
    u32 boostThreshold = p->boostThreshold;
    if (p->isBoosting) {
        p->topSpeed = Q(12.0);
        p->maxSpeed = Q(15.0);
    } else if (p->moveState & MOVESTATE_SPIN_ATTACK) {
        p->topSpeed = Q(6.0);
        p->maxSpeed = Q(15.0);
    } else {
        p->topSpeed = Q(6.0);
        p->maxSpeed = Q(9.0);
    }

    p->acceleration = playerBoostPhysicsTable[boostThreshold][0];
    p->deceleration = playerBoostPhysicsTable[boostThreshold][1];
}

#if COLLECT_RINGS_ROM
void Player_SpinAttack(Player *p)
{
    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->charState = CHARSTATE_SPIN_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_SPIN_ATTACK;
    p->SA2_LABEL(unk99)[0] = 0;
    PLAYERFN_SET_AND_CALL(Player_Rolling, p);
}
#endif

void Player_InitCrouch(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->charState = CHARSTATE_CROUCH;
    p->qSpeedGround = 0;

    PLAYERFN_SET_AND_CALL(Player_Crouch, p);
}

#if COLLECT_RINGS_ROM
void Player_InitSpindash(Player *p)
{
    p->charState = CHARSTATE_SPIN_DASH;

    p->moveState |= (MOVESTATE_SPINDASH | MOVESTATE_SPIN_ATTACK);
    p->moveState &= ~(MOVESTATE_20 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->qSpindashAccel = 0;
    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
    p->qSpeedGround = 0;

    m4aSongNumStart(SE_SPIN_ATTACK);

    PLAYERFN_SET_AND_CALL(Player_Spindash, p);
}

void sub_02011950(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 sp08;
    s32 res = SA2_LABEL(sub_8029B0C)(p, &rotation, &sp04);
    if (res <= 0) {
        p->qWorldY += Q(res);
        p->rotation = rotation;
        SA2_LABEL(sub_8021BE0)(p);
        p->qSpeedAirY = 0;
        p->qSpeedGround = p->qSpeedAirX;
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
void Player_802A258(Player *p)
{
    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        if (p->moveState & MOVESTATE_SPIN_ATTACK)
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
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (p->moveState & (MOVESTATE_8000 | MOVESTATE_SPINDASH))
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
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->isBoosting = FALSE;
    p->charState = CHARSTATE_WALK_A;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);
    p->SA2_LABEL(unk72) = 0;

    PLAYERFN_SET_AND_CALL(Player_80279F8, p);
}

// Boss-Stage-only
void Player_InitKilledBoss(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = CHARSTATE_WALK_A;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    PLAYERFN_SET_AND_CALL(Player_8027C5C, p);
}

void Player_InitReachedGoalMultiplayer(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    p->moveState |= MOVESTATE_IGNORE_INPUT;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(Player_HandleMultiplayerFinish, p);
}

void Player_Nop(Player *p) { }

void sub_802A500(Player *p) { sub_802A500_inline(p); }
#endif

void sub_802A52C(Player *p) { PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p); }

void sub_802A558(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p); }

void sub_802A58C(Player *p)
{
    if (p->charState != CHARSTATE_HIT_AIR) {
        if (p->timerInvulnerability > 0)
            p->timerInvulnerability--;
    }
}

#ifndef COLLECT_RINGS_ROM
void sub_802A5AC(Player *p)
{
    if (p->disableTrickTimer != 0)
        p->disableTrickTimer--;
}
#endif

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
    if (p->SA2_LABEL(unk2A) == 0) {
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

#ifndef COLLECT_RINGS_ROM
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
#endif
