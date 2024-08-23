#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "sakit/music_manager.h"
#include "sakit/input_buffer.h"

#include "game/save.h"

#include "game/boost_effect.h"
#include "game/bosses/common.h"
#include "game/cheese.h"
#include "game/stage/dust_effect_braking.h"

#include "game/stage/spawn_positions.h"
#include "game/stage/collision.h"
#include "game/stage/camera.h"
#include "game/stage/player.h"
#include "game/player_callbacks.h"
#include "game/stage/game_2.h"

#include "game/multiplayer/player_unk_2.h"
#include "game/parameters/bosses.h"
#include "game/stage/player_controls.h"
#include "game/stage/dust_effect_braking.h"
#include "game/multiplayer/mp_player.h"
#include "game/boost_effect.h"
#include "game/stage/player_super_sonic.h"
#include "game/stage/rings_scatter.h"
#include "game/stage/stage.h"
#include "game/unknown_effect.h"
#include "game/water_effects.h"
#include "game/stage/underwater_effects.h"
#include "game/stage/item_tasks.h"
#include "game/boost_effect.h"
#include "game/amy_attack_heart_effect.h"

#include "game/boost_mode_particles.h" // incl. CreateBoostModeParticles
#include "game/stage/dust_effect_braking.h" // CreateSpindashDustEffect
#include "game/stage/dust_effect_spindash.h" // CreateSpindashDustEffect
#include "game/time_attack/results.h" // for PlayerCB_80278D4
#include "game/stage/results.h"
#include "game/heart_particles_effect.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ u8 unk0;
    /* 0x04 */ u32 unk4; // TODO: Check the type!
} player_0_Task; /* size: 0x8 */

Player ALIGNED(8) gPlayer = {};

// Poentially some extra space on player for this to be aligned 16 (should be 8)
PlayerSpriteInfo ALIGNED(16) gUnknown_03005AA0 = {};
PlayerSpriteInfo ALIGNED(16) gUnknown_03005AF0 = {};

// sakit
extern void InitNewInputCounters(void);

void sub_8022218(Player *);
void sub_8022284(Player *);
void Task_8023FC0(void);
void AllocateCharacterStageGfx(Player *, PlayerSpriteInfo *);
void AllocateCharacterMidAirGfx(Player *, PlayerSpriteInfo *);
void TaskDestructor_802A07C(struct Task *);
void sub_802486C(Player *p, PlayerSpriteInfo *p2);
void sub_8024B10(Player *p, PlayerSpriteInfo *s);
void sub_8024F74(Player *p, PlayerSpriteInfo *s);
void PlayerCB_8026BCC(Player *);

s32 sub_8029BB8(Player *p, u8 *p1, s32 *out);

void PlayerCB_8025A0C(Player *p);

void PlayerCB_Idle(Player *);
void PlayerCB_8025AB8(Player *);
void PlayerCB_Jump(Player *p);
void PlayerCB_Jumping(Player *);
void PlayerCB_8025F84(Player *);
void PlayerCB_Spindash(Player *);
void PlayerCB_8026810(Player *);
void PlayerCB_8027040(Player *);
void PlayerCB_8027190(Player *);
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
void PlayerCB_8026060(Player *p);
void PlayerCB_802611C(Player *p);
void PlayerCB_8026764(Player *p);
void PlayerCB_80269C0(Player *p);
void PlayerCB_8026A4C(Player *p);
void PlayerCB_8026E24(Player *p);
void PlayerCB_8026F10(Player *p);
void PlayerCB_8026FC8(Player *p);
void PlayerCB_8027114(Player *p);
void PlayerCB_8027250(Player *p);
void PlayerCB_80273D0(Player *p);
void PlayerCB_8028D74(Player *p);
void PlayerCB_TouchNormalSpring(Player *p);
void PlayerCB_8029158(Player *p);
void sub_802989C(Player *p);
void PlayerCB_802A258(Player *p);
void PlayerCB_802A300(Player *p);

bool32 sub_80294F4(Player *);
void sub_802966C(Player *);
bool32 sub_8029E6C(Player *);
bool32 sub_802A0C8(Player *);
bool32 sub_802A0FC(Player *);
bool32 sub_802A184(Player *);
bool32 sub_802A2A8(Player *);
void PlayerCB_802A228(Player *);
void Player_InitIceSlide(Player *);
void PlayerCB_802A3B8(Player *);
void PlayerCB_802A3C4(Player *);
void PlayerCB_CameraShift(Player *);
void sub_802A40C(Player *);
void sub_802A468(Player *);
void sub_802A4B8(Player *);
void PlayerCB_Nop(Player *);
void PlayerCB_802A5C4(Player *);
void PlayerCB_802A620(Player *);
void Player_InitAttack(Player *);

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)
#define GET_ROTATED_ACCEL_3(angle) ((SIN_24_8((angle)*4) * 60))

// TODO: Match this without ASM!
#ifndef NON_MATCHING
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                                                                           \
    {                                                                                                                                      \
        s16 speed = (player->moveState & MOVESTATE_40) ? Q_8_8(PLAYER_GRAVITY_UNDER_WATER) : Q_8_8(PLAYER_GRAVITY);                        \
                                                                                                                                           \
        if (player->speedAirY < 0) {                                                                                                       \
            asm("lsl r0, %0, #16\n"                                                                                                        \
                "\tasr r0, r0, #17\n"                                                                                                      \
                "\tlsl r0, r0, #16\n"                                                                                                      \
                "\tlsr %0, r0, #16\n"                                                                                                      \
                : "=r"(speed)                                                                                                              \
                : "r"(speed)                                                                                                               \
                : "r0");                                                                                                                   \
        }                                                                                                                                  \
                                                                                                                                           \
        player->speedAirY += speed;                                                                                                        \
    }
#else
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                                                                           \
    {                                                                                                                                      \
        s16 speed = (player->moveState & MOVESTATE_40) ? Q_8_8(PLAYER_GRAVITY_UNDER_WATER) : Q_8_8(PLAYER_GRAVITY);                        \
                                                                                                                                           \
        if (player->speedAirY < 0) {                                                                                                       \
            speed /= 2;                                                                                                                    \
        }                                                                                                                                  \
                                                                                                                                           \
        player->speedAirY += speed;                                                                                                        \
    }
#endif

#define PLAYERFN_UPDATE_UNK2A(player)                                                                                                      \
    {                                                                                                                                      \
        if (player->unk2A) {                                                                                                               \
            player->unk2A -= 1;                                                                                                            \
        } else if ((player->rotation + 32) & 0xC0) {                                                                                       \
            s32 absGroundSpeed = ABS(player->speedGroundX);                                                                                \
            if (absGroundSpeed < Q(1.875)) {                                                                                               \
                player->speedGroundX = 0;                                                                                                  \
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

#define PLAYERFN_UPDATE_POSITION(player)                                                                                                   \
    {                                                                                                                                      \
        player->x += player->speedAirX;                                                                                                    \
                                                                                                                                           \
        if ((gStageFlags ^ gUnknown_0300544C) & STAGE_FLAG__GRAVITY_INVERTED) {                                                            \
            player->speedAirY = -player->speedAirY;                                                                                        \
        }                                                                                                                                  \
                                                                                                                                           \
        player->speedAirY = MIN(player->speedAirY, Q(PLAYER_AIR_SPEED_MAX));                                                               \
                                                                                                                                           \
        player->y = GRAVITY_IS_INVERTED ? player->y - player->speedAirY : player->y + player->speedAirY;                                   \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player)                                                                                   \
    if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {                                                           \
        gPlayer.callback = PlayerCB_8025318;                                                                                               \
                                                                                                                                           \
        player->speedGroundX = player->speedAirX;                                                                                          \
        player->rotation = 0;                                                                                                              \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND(player)                                                                                        \
    {                                                                                                                                      \
        sub_8022190(player);                                                                                                               \
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player);                                                                                  \
    }

#define PLAYERFN_UPDATE_AIR_FALL_SPEED(player)                                                                                             \
    if (player->moveState & MOVESTATE_40) {                                                                                                \
        player->speedAirY += Q(PLAYER_GRAVITY_UNDER_WATER);                                                                                \
    } else {                                                                                                                               \
        player->speedAirY += Q(PLAYER_GRAVITY);                                                                                            \
    }

#define PLAYERFN_SET_ANIM_SPEED(_p, _s)                                                                                                    \
    {                                                                                                                                      \
        s32 speed = _p->speedGroundX;                                                                                                      \
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
const u16 gUnknown_080D6736[][2] = {
    [0] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_SHARED_ANIM), 0 },
    [1] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [2] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_CROUCH, CHARACTER_SHARED_ANIM), 0 },
    [3] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_DASH, CHARACTER_SHARED_ANIM), 0 },
    [4] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_SHARED_ANIM), 0 },
    [5] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_5, CHARACTER_SHARED_ANIM), 0 },
    [6] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_6, CHARACTER_SHARED_ANIM), 0 },
    [7] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_7, CHARACTER_SHARED_ANIM), 0 },
    [8] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_BRAKE, CHARACTER_SHARED_ANIM), 0 },
    [9] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SHARED_ANIM), 0 },
    [10] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_JUMP_1, CHARACTER_SHARED_ANIM), 0 },
    [11] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_JUMP_2, CHARACTER_SHARED_ANIM), 0 },
    [12] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_12, CHARACTER_SHARED_ANIM), 0 },
    [13] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_FALLING_VULNERABLE, CHARACTER_SHARED_ANIM), 0 },
    [14] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_FALLING_VULNERABLE, CHARACTER_SHARED_ANIM), 0 },
    [15] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_14, CHARACTER_SHARED_ANIM), 0 },
    [16] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_15, CHARACTER_SHARED_ANIM), 0 },
    [17] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_16, CHARACTER_SHARED_ANIM), 0 },
    [18] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_1, CHARACTER_SHARED_ANIM), 0 },
    [19] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_2, CHARACTER_SHARED_ANIM), 0 },
    [20] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_28, CHARACTER_SHARED_ANIM), 0 },
    [21] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_28, CHARACTER_SHARED_ANIM), 1 },
    [22] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_29, CHARACTER_SHARED_ANIM), 0 },
    [23] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [24] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [25] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_31, CHARACTER_SHARED_ANIM), 0 },
    [26] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_31, CHARACTER_SHARED_ANIM), 1 },
    [27] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_31, CHARACTER_SHARED_ANIM), 2 },
    [28] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_ACT_CLEAR, CHARACTER_SHARED_ANIM), 0 },
    [29] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_33, CHARACTER_SHARED_ANIM), 0 },
    [30] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_34, CHARACTER_SHARED_ANIM), 0 },
    [31] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [32] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_35, CHARACTER_SHARED_ANIM), 0 },
    [33] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_UP, CHARACTER_SHARED_ANIM), 0 },
    [34] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TRICK_SIDE, CHARACTER_SHARED_ANIM), 0 },
    [35] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_50, CHARACTER_SHARED_ANIM), 0 },
    [36] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_SHARED_ANIM), 0 },
    [37] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_65, CHARACTER_SHARED_ANIM), 0 },
    [38] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_52, CHARACTER_SHARED_ANIM), 0 },
    [39] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_53, CHARACTER_SHARED_ANIM), 0 },
    [40] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_54, CHARACTER_SHARED_ANIM), 0 },
    [41] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_55, CHARACTER_SHARED_ANIM), 0 },
    [42] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_56, CHARACTER_SHARED_ANIM), 0 },
    [43] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_57, CHARACTER_SHARED_ANIM), 0 },
    [44] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_58, CHARACTER_SHARED_ANIM), 0 },
    [45] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_59, CHARACTER_SHARED_ANIM), 0 },
    [46] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_60, CHARACTER_SHARED_ANIM), 0 },
    [47] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_68, CHARACTER_SHARED_ANIM), 0 },
    [48] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_69, CHARACTER_SHARED_ANIM), 0 },
    [49] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_69, CHARACTER_SHARED_ANIM), 1 },
    [50] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_70, CHARACTER_SHARED_ANIM), 0 },
    [51] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_62, CHARACTER_SHARED_ANIM), 0 },
    [52] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_62, CHARACTER_SHARED_ANIM), 1 },
    [53] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_63, CHARACTER_SHARED_ANIM), 0 },
    [54] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_63, CHARACTER_SHARED_ANIM), 1 },
    [55] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_61, CHARACTER_SHARED_ANIM), 0 },
    [56] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_64, CHARACTER_SHARED_ANIM), 0 },
    [57] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_66, CHARACTER_SHARED_ANIM), 0 },
    [58] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_67, CHARACTER_SHARED_ANIM), 0 },
    [59] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_73, CHARACTER_SHARED_ANIM), 0 },
    [60] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_73, CHARACTER_SHARED_ANIM), 1 },
    [61] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_73, CHARACTER_SHARED_ANIM), 2 },
    [62] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_75, CHARACTER_SHARED_ANIM), 0 },
    [63] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SHARED_ANIM), 2 },
    [64] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_71, CHARACTER_SHARED_ANIM), 0 },
    [65] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_71, CHARACTER_SHARED_ANIM), 1 },
    [66] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_72, CHARACTER_SHARED_ANIM), 0 },
    [67] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_36, CHARACTER_SHARED_ANIM), 0 },
    [68] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_36, CHARACTER_SHARED_ANIM), 1 },
    [69] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_36, CHARACTER_SHARED_ANIM), 2 },
    [70] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_36, CHARACTER_SHARED_ANIM), 3 },
    [71] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [72] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [73] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [74] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [75] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [76] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [77] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [78] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [79] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [80] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_SHARED_ANIM), 0 },
    [81] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_37, CHARACTER_SHARED_ANIM), 0 },
    [82] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_37, CHARACTER_SHARED_ANIM), 1 },
    [83] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_CREAM), 0 },
    [84] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_CREAM), 1 },
    [85] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_CREAM), 0 },
    [86] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_CREAM), 0 },
    [87] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_CREAM), 0 },
    [88] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS), 0 },
    [89] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS), 0 },
    [90] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS), 0 },
    [91] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_TAILS), 0 },
    [92] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES), 0 },
    [93] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_KNUCKLES), 0 },
    [94] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_KNUCKLES), 1 },
    [95] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES), 0 },
    [96] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 0 },
    [97] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 1 },
    [98] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 2 },
    [99] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES), 3 },
    [100] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_23, CHARACTER_KNUCKLES), 0 },
    [101] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 2 },
    [102] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 0 },
    [103] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 1 },
    [104] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 3 },
    [105] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_24, CHARACTER_KNUCKLES), 4 },
    [106] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 0 },
    [107] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 1 },
    [108] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 2 },
    [109] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_52, CHARACTER_AMY), 0 },
    [110] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [111] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_14, CHARACTER_AMY), 0 },
    [112] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_AMY), 0 },
    [113] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SHARED_ANIM), 0 },
    [114] = { SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_2, CHARACTER_AMY), 0 },
};

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

static const u8 gUnknown_080D69C2[4] = { 4, 3, 2, 2 };

// TODO: Find a compiler-flag or another way to inline without defining functions twice.

static inline void Player_InitIceSlide_inline(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = 62;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    m4aSongNumStart(SE_ICE_PARADISE_SLIDE);

    PLAYERFN_SET_AND_CALL(PlayerCB_8026BCC, p);
}

static inline void sub_802A500_inline(Player *p)
{
    if (p->speedAirY >= 0) {
        sub_8022218(p);
        sub_8022284(p);
    } else {
        sub_8022284(p);
        sub_8022218(p);
    }
}

static inline void PlayerCB_CameraShift_inline(Player *p)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;
}

void sub_80213C0(u32 UNUSED characterId, u32 UNUSED levelId, Player *player)
{
#ifndef NON_MATCHING
    register Player *p asm("r5") = player;
#else
    Player *p = player;
#endif

    s32 unk60 = p->unk60;
    struct Task *t;
    player_0_Task *gt;

    t = TaskCreate(Task_8023FC0, sizeof(player_0_Task), 0x3000, 0, TaskDestructor_802A07C);
    p->spriteTask = t;
    gt = TASK_DATA(t);
    gt->unk0 = unk60;
    gt->unk4 = 0;

    if (IS_MULTI_PLAYER) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gRingCount = 1;
        } else {
            gRingCount = 0;
        }
    }

    InitializePlayer(p);

    PLAYERFN_SET(PlayerCB_8025318);

    sub_801F754();
    InitPlayerHitRingsScatter();

    if ((gInputRecorder.mode == RECORDER_RECORD)) {
        InputRecorderLoadTape();
        gInputRecorder.mode = RECORDER_RECORD;
    } else if (gInputRecorder.mode == RECORDER_PLAYBACK) {
        InputRecorderLoadTape();
        gInputRecorder.mode = RECORDER_PLAYBACK;
    }

    gStageGoalX = 0;
    gUnknown_030054FC = 0;
    gUnknown_030054E0 = 0;

    InitNewInputCounters();
    AllocateCharacterStageGfx(p, p->unk90);
    AllocateCharacterMidAirGfx(p, p->unk94);
}

void AllocateCharacterStageGfx(Player *p, PlayerSpriteInfo *param2)
{
    s32 unk60 = p->unk60;
    Sprite *s = &param2->s;

    if (unk60 == 0) {
        s->graphics.dest = (void *)OBJ_VRAM0;
    } else {
        s->graphics.dest = VramMalloc(64);
    }

    s->graphics.size = 0;
    s->graphics.anim = p->anim;
    s->variant = p->variant;
    s->prevVariant = -1;
    s->x = I(p->x);
    s->y = I(p->y);
    s->oamFlags = SPRITE_OAM_ORDER(16 + unk60);
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (IS_MULTI_PLAYER) {
        s->frameFlags |= (SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_19);
    }
    SPRITE_FLAG_SET(s, ROT_SCALE_ENABLE);
    s->frameFlags |= unk60;

    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;

    param2->transform.rotation = 0;
    param2->transform.width = 0x100;
    param2->transform.height = 0x100;
    param2->transform.x = 0;
    param2->transform.y = 0;
}

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
    s->x = I(p->x);
    s->y = I(p->y);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->frameFlags = (SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 4));

    extraSprite->transform.rotation = 0;
    extraSprite->transform.width = 0x100;
    extraSprite->transform.height = 0x100;
    extraSprite->transform.x = 0;
    extraSprite->transform.y = 0;
}

void SetStageSpawnPos(u32 character, u32 level, u32 p2, Player *p)
{
    p->unk60 = p2;
    p->character = character;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        p->checkPointX = gSpawnPositions[level][0];
        p->checkPointY = gSpawnPositions[level][1];
    } else {
        p->checkPointX = 360 - (SIO_MULTI_CNT->id * 20);
        p->checkPointY = 177;
        p->x = -1;
        p->y = -1;
    }

    p->unk98 = 0;
    p->checkpointTime = 0;
    p->unk90 = &gUnknown_03005AF0;
    p->unk94 = &gUnknown_03005AA0;
}

// NOTE: Only reg-alloc mismatch in loop (see comment below)
// (99.91%) https://decomp.me/scratch/UT9dt
NONMATCH("asm/non_matching/game/InitializePlayer.inc", void InitializePlayer(Player *p))
{
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (((p->x & p->y) + 1) != 0)) {
        p->x = Q(460);
    } else {
        p->x = Q(p->checkPointX);
    }
    p->y = Q(p->checkPointY);

    p->callback = PlayerCB_8025318;

    p->heldInput = gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick;
    p->frameInput = gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick;

    p->speedAirX = 0;
    p->speedAirY = 0;
    p->speedGroundX = 0;
    p->moveState = MOVESTATE_IGNORE_INPUT;
    p->rotation = 0;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    p->unk25 = 120;
    p->spindashAccel = 0;
    p->unk29 = 0;
    p->unk28 = 0;
    p->layer = PLAYER_LAYER__BACK;
    p->unk40 = 0x900;
    p->unk44 = 0x600;
    p->unk48 = 8;
    p->unk4C = 64;
    p->charState = 0;
    p->prevCharState = -1;
    p->anim = -1;
    p->variant = -1;
    p->timerInvulnerability = 0;
    p->timerInvincibility = 0;
    p->timerSpeedup = 0;
    p->unk32 = 0;
    p->unk3C = NULL;
    p->itemEffect = 0;
    p->unk2A = 0;
    p->unk72 = ZONE_TIME_TO_INT(0, 6);
    p->unk7E = 0;
    p->unk7C = 0;
    p->unk82 = 0x100;
    p->unk80 = 0x100;
    p->defeatScoreIndex = 0;
    p->unk61 = 0;
    p->unk62 = 0;
    p->unk63 = 0;
    p->unk86 = 30;
    p->unk87 = 60;
    p->unk88 = 10;
    p->transition = 0;
    p->unk6E = 0;
    p->prevTransition = 0;
    p->isBoosting = FALSE;
    p->unk58 = 0;
    p->unk6C = FALSE;
    p->unk71 = 0;
    p->unk70 = FALSE;
    p->unk36 = 0;

    sub_8015750();
    sub_801561C();
    sub_802989C(p);

    { // This smells like a memset macro.
        // Nonmatching reg-alloc between r4 & r6 here
        u32 *u99 = (void *)p->unk99;
        s32 i = 4;

        while (i-- != 0) {
            *u99++ = 0;
        }
    }

    p->unk99[0] = 0x7F;

    if ((p->unk60 == 0) && IS_SINGLE_PLAYER) {
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

        case CHARACTER_CREAM: {
            p->w.cf.unkAE = 0;
            p->w.cf.flyingDuration = 0;
            p->w.cf.unkB0 = 0;
        } break;

        case CHARACTER_TAILS: {
            p->w.tf.flags = 0;
            p->w.tf.flyingDuration = 0;
            p->w.tf.shift = 0;
        } break;

        case CHARACTER_KNUCKLES: {
            p->w.kf.unkAC = 0;
            p->w.kf.unkAD = 0;
            p->w.kf.unkAE = 0;
        } break;

        case CHARACTER_AMY: {
            p->w.af.unkAC = 0;
        } break;
    }

    gUnknown_03005B7C = 0;
    gUnknown_03005840 = NULL;
    gUnknown_0300583C = 0;
}
END_NONMATCH

// Called anytime the player actively jumps, "autojumps" through touching an IA,
// touches a Boost Pad or a Rotating Handle, touches the ground, etc.
// TODO: Find a better name.
void Player_TransitionCancelFlyingAndBoost(Player *p)
{
    if (p->moveState & MOVESTATE_20000) {
        m4aSongNumStop(SE_281);
    }

    p->moveState &= ~(MOVESTATE_20000000 | MOVESTATE_10000000 | MOVESTATE_1000000 | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_400 | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20
                      | MOVESTATE_10);

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

// Very similar to sub_8029BB8
s32 sub_802195C(Player *p, u8 *p1, s32 *out)
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

    playerX2 = I(p->x) - (2 + p->spriteOffsetX);
    playerY2 = I(p->y) - (p->spriteOffsetY);

    mask = p->layer;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerX2, playerY2, mask, -8, &anotherByte, sub_801ED24);

    playerX = I(p->x) - (2 + p->spriteOffsetX);
    playerY = I(p->y) + (p->spriteOffsetY);

    mask = p->layer;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerX, playerY, mask, -8, &anotherByte2, sub_801ED24);

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

// Very similar to sub_802195C
s32 sub_8021A34(Player *p, u8 *p1, s32 *out)
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

    playerX2 = I(p->x) + (2 + p->spriteOffsetX);
    playerY2 = I(p->y) - (p->spriteOffsetY);

    mask = p->layer;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerX2, playerY2, mask, +8, &anotherByte, sub_801ED24);

    playerX = I(p->x) + (2 + p->spriteOffsetX);
    playerY = I(p->y) + (p->spriteOffsetY);

    mask = p->layer;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerX, playerY, mask, +8, &anotherByte2, sub_801ED24);

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

// Very similar to sub_802195C
s32 sub_8021B08(Player *p, u8 *p1, s32 *out)
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

    playerY2 = I(p->y) - (p->spriteOffsetY);
    playerX2 = I(p->x) - (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerY2, playerX2, mask, -8, &anotherByte, sub_801EE64);

    playerY = I(p->y) - (p->spriteOffsetY);
    playerX = I(p->x) + (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerY, playerX, mask, -8, &anotherByte2, sub_801EE64);

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

void sub_8021BE0(Player *p)
{
    if (!(p->moveState & MOVESTATE_200)) {
        if (!(p->moveState & MOVESTATE_800000)) {
            PLAYERFN_SET(PlayerCB_8025318);
            p->moveState &= ~(MOVESTATE_10 | MOVESTATE_IN_AIR);
        }

        if (p->moveState & MOVESTATE_4) {
            p->moveState &= ~MOVESTATE_4;
            sub_8023B5C(p, 14);
        }
        PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    } else {
        p->moveState &= ~(MOVESTATE_10 | MOVESTATE_IN_AIR);
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

    playerX = I(p->x) - (3 + p->spriteOffsetX);
    playerY = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }

    result = sub_801E4E4(playerX, playerY, mask, -8, 0, sub_801ED24);

    if (result <= 0) {
        p->x -= Q(result);
        p->speedAirX = 0;
    }

    playerX2 = I(p->x) + (3 + p->spriteOffsetX);
    playerY2 = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    result = sub_801E4E4(playerX2, playerY2, mask, +8, 0, sub_801ED24);

    if (result <= 0) {
        p->x += Q(result);
        p->speedAirX = 0;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, &rotation, ptr);
    } else {
        result = sub_8029B0C(p, &rotation, ptr);
    }

    if (result < 0) {
        s8 rotCopy;
        s32 r1 = I(p->speedAirY);
        r1 += 6;
        r1 = -r1;

        if ((result >= r1) || (fnOut >= r1)) {
            s32 airY;
            p->rotation = rotation;

            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += result << 8;

            sub_8021BE0(p);

            if ((rotation + 32) & 0x40) {
                p->speedAirX = 0;

                if (p->speedAirY > Q(11.8125)) {
                    p->speedAirY = Q(11.8125);
                }
            } else if (!((rotation + 16) & 0x20)) {
                p->speedAirY = 0;
                p->speedGroundX = p->speedAirX;
                return;
            } else {
                p->speedAirY >>= 1;
            }

            airY = p->speedAirY;
            if (airY < 0) {
                airY = -airY;
            }
            p->speedGroundX = airY;

            rotCopy = rotation;
            if (rotCopy < 0) {
                p->speedGroundX = -airY;
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

    playerX = I(p->x) - (3 + p->spriteOffsetX);
    playerY = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }

    result = sub_801E4E4(playerX, playerY, mask, -8, 0, sub_801ED24);

    if (result <= 0) {
        p->x -= Q(result);
        p->speedAirX = 0;
    }

    playerX2 = I(p->x) + (3 + p->spriteOffsetX);
    playerY2 = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }

    result = sub_801E4E4(playerX2, playerY2, mask, +8, 0, sub_801ED24);

    if (result <= 0) {
        p->x += Q(result);
        p->speedAirX = 0;
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

        p->y -= result << 8;

        if (((rotation + 32) & 0x40)) {
            s8 *pt = (s8 *)&rotation;
            if ((*pt - 0x40) > 0) {
                s32 speed;
                p->rotation = rotation;

                sub_8021BE0(p);

                speed = p->speedAirY;
                if (speed < 0) {
                    speed = -speed;
                }
                p->speedGroundX = speed;
                return;
            }
        }
        p->speedAirY = 0;
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

    gravity = GRAVITY_IS_INVERTED;
    if (gravity) {
        playerX = I(p->x) - (3 + p->spriteOffsetX);
        playerY = I(p->y);
        result = sub_801E4E4(playerX, playerY, mask2, -8, NULL, sub_801ED24);
    } else {
        playerX2 = I(p->x) - (3 + p->spriteOffsetX);
        playerY2 = I(p->y);

        mask = mask2;
        if (p->speedAirY < Q(3.0)) {
            mask |= 0x80;
        }
        result = sub_801E4E4(playerX2, playerY2, mask, -8, NULL, sub_801ED24);
    }

    if (result <= 0) {
        p->x -= Q(result);
        p->speedAirX = 0;
        p->speedGroundX = p->speedAirY;
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

        p->y -= Q(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, &fnOut);
        } else {
            result = sub_8029B0C(p, &rotation, &fnOut);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q(result);

            p->rotation = rotation;
            sub_8021BE0(p);

            p->speedAirY = 0;
            p->speedGroundX = p->speedAirX;
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

    gravity = GRAVITY_IS_INVERTED;
    if (gravity) {
        playerX = I(p->x) + (3 + p->spriteOffsetX);
        playerY = I(p->y);
        result = sub_801E4E4(playerX, playerY, mask2, +8, NULL, sub_801ED24);
    } else {
        playerX2 = I(p->x) + (3 + p->spriteOffsetX);
        playerY2 = I(p->y);

        mask = mask2;
        if (p->speedAirY < Q(3.0)) {
            mask |= 0x80;
        }
        result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);
    }

    if (result <= 0) {
        p->x += Q(result);
        p->speedAirX = 0;
        p->speedGroundX = p->speedAirY;
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

        p->y -= Q(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, &fnOut);
        } else {
            result = sub_8029B0C(p, &rotation, &fnOut);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q(result);

            p->rotation = rotation;
            sub_8021BE0(p);

            p->speedAirY = 0;
            p->speedGroundX = p->speedAirX;
        }
    }
}

void sub_8022190(Player *p)
{
    s16 airY = p->speedAirY;
    u8 arcResult = (GRAVITY_IS_INVERTED) ? 0x80 : 0;
    s16 airX = p->speedAirX;

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

        p->y += Q(res);
        p->rotation = rotation;
        sub_8021BE0(p);

        p->speedAirY = 0;
        p->speedGroundX = p->speedAirX;
    }
}

void sub_8022284(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;
    s32 airY;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;

    if (GRAVITY_IS_INVERTED) {
        res = sub_8029B0C(p, &rotation, pSp04);
    } else {
        res = sub_8029AC0(p, &rotation, pSp04);
    }

    if (res <= 0) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->y -= Q(res);
        p->rotation = rotation;
        sub_8021BE0(p);

        airY = p->speedAirY;
        if (airY < 0) {
            airY = -airY;
        }
        p->speedGroundX = airY;

        if ((s8)rotation >= 0) {
            p->speedGroundX = -airY;
        }

        if (p->unk6E) {
            p->moveState ^= MOVESTATE_FACING_LEFT;
        }
    }
}

void sub_8022318(Player *p)
{
    s32 offsetY;

    if (!(p->moveState & MOVESTATE_4)) {
        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;
    } else {
        p->moveState &= ~MOVESTATE_4;
        p->charState = 0;

        offsetY = p->spriteOffsetY - 14;

        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }

        if (((p->rotation + 0x40) << 24) <= 0) {
            offsetY = -offsetY;
        }

        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;

        p->y += Q(offsetY);
    }

    p->moveState &= ~MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_10;
    p->moveState &= ~MOVESTATE_100;

    p->defeatScoreIndex = 0;
    p->unk25 = 120;
    p->unk61 = 0;

    if (p->charState > SA2_NUM_PLAYER_CHAR_ANIMATIONS) {
        p->charState = SA2_CHAR_ANIM_IDLE;
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

    playerX = I(p->x) - (3 + p->spriteOffsetX);
    playerY = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x -= Q(result);
        p->speedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    playerX2 = I(p->x) + (3 + p->spriteOffsetX);
    playerY2 = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x += Q(result);
        p->speedAirX = 0;
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

        p->y += Q(result);

        p->rotation = rotation;
        p->speedAirY = 0;
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

    playerX = I(p->x) - (3 + p->spriteOffsetX);
    playerY = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x -= Q(result);
        p->speedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    playerX2 = I(p->x) + (3 + p->spriteOffsetX);
    playerY2 = I(p->y);

    mask = mask2;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x += Q(result);
        p->speedAirX = 0;
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

        p->y -= Q(result);

        p->speedAirY = 0;
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

    playerX = I(p->x) - (2 + p->spriteOffsetX);
    playerY = I(p->y);

    mask = *mask2;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x -= Q(result);
        p->speedAirX = 0;
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
        p->y -= Q(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {

        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, ptr);
        } else {
            result = sub_8029B0C(p, &rotation, ptr);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q(result);

            p->rotation = rotation;
            p->speedAirY = 0;
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

    playerX = I(p->x) + (2 + p->spriteOffsetX);
    playerY = I(p->y);

    mask = *mask2;
    if (p->speedAirY < Q(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX, playerY, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x += Q(result);
        p->speedAirX = 0;
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
        p->y -= Q(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {

        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, ptr);
        } else {
            result = sub_8029B0C(p, &rotation, ptr);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q(result);

            p->rotation = rotation;
            p->speedAirY = 0;
            p->w.sf.flags &= ~0x2;
        }
    }
}

void sub_8022838(Player *p)
{
    s16 airX = p->speedAirX;
    s16 airY = p->speedAirY;
    u8 arcResult = 0;

    if (p->moveState & MOVESTATE_8) {
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

void sub_80228C0(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4") = p->x;
    register s32 playerY asm("sl") = p->y;
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerX = p->x;
    s32 playerY = p->y;
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
            s32 airX = p->speedAirX;

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
    p->y = playerY;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

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
    playerX = p->x;
    playerY = (p->y);
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
            s32 airX = p->speedAirX;

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
    p->y = playerY;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

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
    playerX = p->x;
    playerY = (p->y);
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
            s32 airY = p->speedAirY;

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
    p->x = playerX;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

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
    playerX = p->x;
    playerY = (p->y);
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
            s32 airY = p->speedAirY;

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
    p->x = playerX;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

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
    }
}

void sub_8022D6C(Player *p)
{
    u8 r1 = 0;
    if (p->moveState & MOVESTATE_8) {
        p->unk29 = 0;
        p->unk28 = 0;
        return;
    }
    if ((gCurrentLevel == 0) && (gWater.isActive == TRUE)) {
        s32 r5 = Q(p->y) >> 16;
        u32 mask = ~0x3;
        s32 offsetY = p->spriteOffsetY;
        s32 unk4 = gWater.currentWaterLevel;
        s16 r0 = (unk4 - offsetY) & mask;
        r5 &= mask;

        if ((r5 == (r0)) && (p->speedAirY >= 0) && ((u8)(p->rotation + 0x18) <= 0x30) && (!(p->moveState & MOVESTATE_IN_AIR))
            && (ABS(p->speedGroundX) >= Q(6.0))) {
            sub_80228C0(p);

            if (p->y >= Q(r5)) {
                if (!(p->moveState & MOVESTATE_20000)) {
                    p->moveState |= MOVESTATE_20000;

                    if (IS_SINGLE_PLAYER) {
                        CreateRunOnWaterEffect();
                    }
                }

                m4aSongNumStartOrContinue(SE_281);
                p->y = (r0 << 8);
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
    } else {
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

// (98.07%) https://decomp.me/scratch/xgjsf
NONMATCH("asm/non_matching/game/player__sub_802302C.inc", s32 sub_802302C(u8 param0, Player *p))
{
    s32 r3;
    s32 result;

    s32 px = I(p->x);
    s32 py = I(p->y);

    p->unk29 = param0;
    r3 = (s8)param0;
    p->unk28 = param0;

    if (((param0 + Q(0.125)) << 24) > 0) {
        if (r3 <= 0) {
            asm("");
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
END_NONMATCH

void sub_8023128(Player *p)
{
    u8 r1;
    u32 temp;
    u8 r5;
    s32 r2;

    if (p->speedGroundX == 0) {
        return;
    }

    r1 = Q(0.25);
    if (p->speedGroundX >= 0) {
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
                p->y += r2;
                p->speedAirY = 0;
            } break;

            case 1: {
                p->x -= r2;
                p->speedAirX = 0;
                p->moveState |= MOVESTATE_20;
                p->speedGroundX = 0;
            } break;

            case 2: {
                p->y -= r2;
                p->speedAirY = 0;
                p->moveState |= MOVESTATE_IN_AIR;
            } break;

            case 3: {
                p->x += r2;
                p->speedAirX = 0;
                p->moveState |= MOVESTATE_20;
                p->speedGroundX = 0;
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

    if (p->speedGroundX == 0) {
        return;
    }

    r1 = Q(0.25);
    if (p->speedGroundX >= 0) {
        r1 = -Q(0.25);
    }

    // without temp, the add instr. sources get switched
    temp = p->rotation + r1;
    r5 = temp;

    r2 = Q(sub_802302C(r5, p));

    if (r2 <= 0) {
        switch (((r5 + Q(0.125)) & 0xC0) >> 6) {

            case 0: {
                p->y += r2;
                p->speedAirY = 0;
            } break;

            case 1: {
                p->x -= r2;
                p->speedAirX = 0;
                p->moveState &= ~MOVESTATE_4;

                sub_8023B5C(p, 14);
                p->spriteOffsetX = 6;
                p->spriteOffsetY = 14;
                p->speedGroundX = 0;
            } break;

            case 2: {
                p->y -= r2;
                p->speedAirY = 0;
                p->moveState |= MOVESTATE_IN_AIR;
            } break;

            case 3: {
                p->x += r2;
                p->speedAirX = 0;
                p->moveState &= ~MOVESTATE_4;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

                p->speedGroundX = 0;
            } break;
        }
    }
}

void sub_8023260(Player *p)
{
    s32 r4 = p->unk40;

    if (p->speedGroundX > (s16)r4) {
        p->speedGroundX = +r4;
    } else {
        s32 speedX = p->speedGroundX;
        if (speedX < -(s16)r4) {
            p->speedGroundX = -r4;
        }
    }

    r4 = p->speedGroundX;

    {
        s16 rot = p->rotation;

        p->speedAirX = I(COS_24_8(rot * 4) * r4);

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->speedAirY = 0;
        }

        p->speedAirY += I(SIN_24_8(rot * 4) * r4);
    }
}

void sub_80232D0(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 qPX = p->x;
    s32 qPY = p->y;
    s32 ix, iy;
    s32 ox, oy;

    if (p->unk60 == 0) {
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
        } else if ((gPlayer.moveState & MOVESTATE_8000000) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
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

    if ((p->moveState & (MOVESTATE_80000000 | MOVESTATE_DEAD)) != MOVESTATE_DEAD) {
        s32 r2, r3;
        struct Camera *cam2 = &gCamera;
        r3 = p->y;

        if ((s32)p->moveState >= 0) {
            s32 r1;

            if (GRAVITY_IS_INVERTED) {
                if (p->y > Q(gCamera.minY)) {
                    goto lbl0;
                } else {
                    r1 = 1;
                }
            } else {
                s32 qMaxY = Q(cam2->maxY) - 1;

                r1 = 1;

                if (p->y < qMaxY) {
                lbl0:
                    r1 = 0;
                }
            }

            if (r1 != 0) {
                p->moveState |= MOVESTATE_DEAD;

                if (p->moveState & MOVESTATE_40) {
                    p->speedAirY = -Q(2.625);
                } else {
                    p->speedAirY = -Q(4.875);
                }

                qPY = GRAVITY_IS_INVERTED ? Q(cam->minY) : Q(cam->maxY) - 1;
            }
        }

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            r2 = gUnknown_03005440;
            r3 = gUnknown_030054BC;
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
                p->speedAirX = 0;
                p->speedGroundX = 0;
            }

            if (qPY != oldQPY) {
                p->speedAirY = 0;
                p->speedGroundX = 0;
            }

            if (IS_BOSS_STAGE(gCurrentLevel)) {
                s32 qPXMin = (Q(cam->unk10));
                if (qPX < qPXMin + Q(8.0)) {
                    qPX = qPXMin + Q(8.0);
                    p->speedGroundX = BOSS_VELOCITY_X;
                    p->speedAirX = BOSS_VELOCITY_X;

                    p->moveState &= ~MOVESTATE_FACING_LEFT;
                } else if (qPX > (qPXMin + Q(312.0))) {
                    qPX = (qPXMin + Q(312.0));
                    p->speedGroundX = BOSS_VELOCITY_X;
                    p->speedAirX = BOSS_VELOCITY_X;
                }
            }

            p->x = qPX;
            p->y = qPY;
        }
    }
}

// TODO: Remvoe gotos
// https://decomp.me/scratch/TeU3L
void sub_8023610(Player *p)
{
    s32 r5 = p->unk48 * 2;
    s32 r6 = p->unk44;

    if ((p->charState != SA2_CHAR_ANIM_20) && !(p->moveState & MOVESTATE_10)) {
        s16 r0;
        u16 r2 = p->speedAirX;

        if (p->heldInput & DPAD_LEFT) {
            if ((p->charState != SA2_CHAR_ANIM_63) && !(p->moveState & MOVESTATE_2000)) {
                p->moveState |= MOVESTATE_FACING_LEFT;
            }

            r0 = r2;
            r2 = r0 - r5;
            r0 = r2;

            if (r0 >= -r6) {
                goto set;
            }

            r2 = r0 + r5;
            r0 = r2;

            if (r0 <= -r6) {
                goto set;
            }

            r2 = -r6;
            goto set;

        } else if (p->heldInput & DPAD_RIGHT) {
            if ((p->charState != SA2_CHAR_ANIM_63) && !(p->moveState & MOVESTATE_2000)) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            r0 = r2;
            r2 = r0 + r5;
            r0 = r2;

            if (r0 <= r6) {
                goto set;
            }

            r2 = r0 - r5;
            r0 = r2;

            if (r0 >= r6) {
                goto set;
            }

            r2 = r6;
        }

    set:
        p->speedAirX = r2;
    }
}

void sub_80236C8(Player *p)
{
    s16 airX;
    s16 airX2;

    if ((u16)p->speedAirY < (u16)Q(189))
        return;

    airX = p->speedAirX;
    airX2 = (airX >> 5);

    if (airX2 < 0) {
        airX = (airX - airX2);
        if (airX > 0) {
            airX = 0;
        }
        p->speedAirX = airX;
    } else if (airX2 > 0) {
        airX = (airX - airX2);

        if (airX < 0) {
            airX = 0;
        }

        p->speedAirX = airX;
    }
}

void sub_8023708(Player *p)
{
    s16 airX;
    s16 airX2;

    if ((u16)p->speedAirY < (u16)Q(189))
        return;

    airX = p->speedAirX;
    airX2 = (airX >> 6);

    if (airX2 < 0) {
        airX = (airX - airX2);
        if (airX > 0) {
            airX = 0;
        }
        p->speedAirX = airX;
    } else if (airX2 > 0) {
        airX = (airX - airX2);

        if (airX < 0) {
            airX = 0;
        }

        p->speedAirX = airX;
    }
}

void sub_8023748(Player *p)
{
    if (p->itemEffect == PLAYER_ITEM_EFFECT__NONE)
        return;

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) && (--p->timerSpeedup == 0)) {
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__10) && (--p->timerSpeedup == 0)) {
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__10;
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) && (--p->timerInvincibility == 0)) {
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__INVINCIBILITY;

        if (p->itemEffect & PLAYER_ITEM_EFFECT__SHIELD_NORMAL) {
            CreateItemTask_Shield_Normal(gPlayer.unk60);
        } else if (p->itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC) {
            CreateItemTask_Shield_Magnetic(gPlayer.unk60);
        }

        // TODO: This could be a macro: IS_ACTICE_SONG(id)
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_INVINCIBILITY].header) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__20) && (--p->unk34 == 0)) {
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__20;
        gDispCnt &= ~DISPCNT_OBJWIN_ON;
        gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
    }
}

void sub_8023878(Player *p)
{
    p->moveState &= ~MOVESTATE_1000;
    if (gWater.isActive == 1 && gWater.currentWaterLevel > -1 && (I(p->y) - 4) >= gWater.currentWaterLevel) {
        if (!(p->moveState & MOVESTATE_40)) {
            p->moveState |= MOVESTATE_40;
            p->moveState |= MOVESTATE_1000;

            p->speedAirX = p->speedAirX >> 1;
            p->speedAirY = p->speedAirY >> 2;
            if ((p->character != 3 || p->unk61 != 9) && (s8)p->unk88 < 1) {
                p->unk88 = 10;
                CreateWaterfallSurfaceHitEffect(I(p->x), gWater.currentWaterLevel);
                m4aSongNumStart(SE_156);
            }
        }

        if (--p->unk87 < 1) {
            switch (p->unk86--) {
                case 11:
                    if (p->unk60 == 0) {
                        gUnknown_030054A8.unk4 = 16;
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
            if (p->unk86 < 0) {
                p->moveState |= MOVESTATE_DEAD;
                p->speedAirY = 0;
                SpawnAirBubbles(p->x, p->y - Q(12), 0, 1);
                SpawnBubblesAfterDrowning(p);
            }
            p->unk87 = 60;
        }
        if (!(gStageTime & 0xF) && !(PseudoRandom32() & 0x300)) {
            s32 dX = ((p->moveState & MOVESTATE_FACING_LEFT) ? -0x400 : 0x400);
            SpawnAirBubbles(p->x + dX, p->y - Q(4), 0, 0);
        }
    } else {
        if (p->moveState & MOVESTATE_40) {
            p->moveState &= ~MOVESTATE_40;
            p->moveState |= MOVESTATE_1000;
            p->speedAirY = p->speedAirY << 1;
            if ((p->character != 3 || p->unk61 != 9) && p->unk88 < 1) {
                p->unk88 = 10;
                CreateWaterfallSurfaceHitEffect(I(p->x), gWater.currentWaterLevel);
                m4aSongNumStart(SE_156);
            }
        }
        p->unk87 = 60;
        p->unk86 = 30;

        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_DROWNING].header && p->unk60 == 0) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
    }

    if (p->itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) {
        p->unk48 = p->unk48 << 1;
        p->unk4C = p->unk4C << 1;
    } else if (p->itemEffect & PLAYER_ITEM_EFFECT__10) {
        p->unk40 = p->unk40 >> 2;
        p->unk48 = p->unk48 >> 2;
        p->unk4C = p->unk4C >> 2;
    }

    if (p->unk88 != 0) {
        p->unk88--;
    }
}

void sub_8023B5C(Player *p, s32 spriteOffsetY)
{
    u8 rot;
    if (p->spriteOffsetY == spriteOffsetY) {
        return;
    }

    rot = p->rotation;
    if (GRAVITY_IS_INVERTED) {
        rot += Q(1. / 4.);
        rot = -rot;
        rot -= Q(1. / 4.);
    }

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
            p->y -= Q(spriteOffsetY - p->spriteOffsetY);
        } break;

        case 2: {
            p->y += Q(spriteOffsetY - p->spriteOffsetY);
        } break;

        case 1: {
            p->x += Q(spriteOffsetY - p->spriteOffsetY);
        } break;

        case 3: {
            p->x -= Q(spriteOffsetY - p->spriteOffsetY);
        } break;
    }
}

void sub_8023C10(Player *p)
{
    if (p->moveState & MOVESTATE_80000000) {
        s32 speedGroundX = p->speedGroundX;
        if (gInput & DPAD_ANY) {
            speedGroundX += Q(0.125);
            speedGroundX = speedGroundX >= Q(0) ? CLAMP(speedGroundX, Q(0), Q(16)) : Q(0);
        } else {
            speedGroundX = 0;
        }
        p->speedGroundX = speedGroundX;

        switch (gInput & DPAD_SIDEWAYS) {
            case DPAD_LEFT:
                p->speedAirX = -speedGroundX;
                break;

            case DPAD_RIGHT:
                p->speedAirX = speedGroundX;
                break;

            default:
                p->speedAirX = 0;
        }

        switch (gInput & (DPAD_DOWN | DPAD_UP)) {
            case DPAD_UP:
                p->speedAirY = -speedGroundX;
                break;

            case DPAD_DOWN:
                p->speedAirY = speedGroundX;
                break;

            default:
                p->speedAirY = 0;
        }

        PLAYERFN_UPDATE_POSITION(p);
        sub_80232D0(p);

        if (gPressedKeys & B_BUTTON) {
            InitScatteringRings(I(p->x), I(p->y), 1);
        }
    }
}

void Task_8023D08(void)
{
    player_0_Task *gt = TASK_DATA(gCurTask);
    u32 val = gt->unk4;
    if (val == 0) {
        if (IS_SINGLE_PLAYER) {
            TaskDestroy(gCurTask);
            if ((!gLoadedSaveGame->timeLimitDisabled
                 && (gCourseTime > MAX_COURSE_TIME || (gStageFlags & STAGE_FLAG__4 && gCourseTime == 0)))
                || ((gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) && gCourseTime > MAX_COURSE_TIME)) {
                HandleDeath();
            } else {
                gRingCount = 0;
                gSpecialRingCount = 0;
                HandleLifeLost();
            }
            return;
        }

        gRingCount = 0;

        if (gGameMode == GAME_MODE_MULTI_PLAYER) {
            gRingCount = 1;
        }

        gSpecialRingCount = 0;
        InitializePlayer(&gPlayer);
        gCamera.x = I(gPlayer.x) + gCamera.shiftX - (DISPLAY_WIDTH / 2);
        gCamera.y = I(gPlayer.y) + gCamera.shiftY - (DISPLAY_HEIGHT / 2);
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 256);
        gPlayer.moveState = 0;
        gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

        gPlayer.unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        gPlayer.unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        gPlayer.unk94->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        gPlayer.unk94->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);

        gCamera.unk50 &= ~0x3;
        if (gPlayer.character == CHARACTER_CREAM && gCheese != NULL) {
            gCheese->posX = gPlayer.x;
            gCheese->posY = gPlayer.y;
        }

        gCurTask->main = Task_8023FC0;
        gPlayer.callback = PlayerCB_8025318;
    } else {
        val--;
        gt->unk4 = val;
    }
}

static inline bool32 SomePlayerYComparison(Player *p, struct Camera *cam, s32 playerY)
{
    if (p->moveState & MOVESTATE_80000000) {
        return FALSE;
    }

    if (GRAVITY_IS_INVERTED) {
        if (playerY <= Q(cam->y - 80)) {
            return TRUE;
        }
    } else {
        if (playerY >= Q(cam->y) + Q(240) - 1) {
            return TRUE;
        }
    }
    return FALSE;
}

void Task_8023E90(void)
{
    Player *p = &gPlayer;

    PlayerSpriteInfo *psi1 = gPlayer.unk90;
    PlayerSpriteInfo *psi2 = gPlayer.unk94;

    if (SomePlayerYComparison(&gPlayer, &gCamera, gPlayer.y)) {
        player_0_Task *gt = TASK_DATA(gCurTask);
        gt->unk4 = 0x3C;
        gPlayer.moveState |= MOVESTATE_100000;
        if (IS_MULTI_PLAYER) {
            sub_8024B10(p, psi1);
        }
        gCurTask->main = Task_8023D08;
        return;
    }

    PLAYERFN_UPDATE_AIR_FALL_SPEED(p);
    PLAYERFN_UPDATE_POSITION(p);
    sub_802486C(p, psi1);
    sub_8024B10(p, psi1);
    sub_8024F74(p, psi2);
}

void sub_80298DC(Player *p);
void sub_802A1C8(Player *p);
void sub_8029990(Player *p);
void sub_802460C(Player *p);
void CallPlayerTransition(Player *p);

void Task_8023FC0(void)
{
    Player *p = &gPlayer;
    sub_802989C(p);
    sub_80298DC(p);
    sub_802A1C8(p);
    sub_8029990(p);

    gUnknown_030054FC = 0;
    gUnknown_030054E0 = 0;
    sub_802460C(p);
    sub_800DF8C(p);
    sub_8023878(p);
    CallPlayerTransition(p);

    if (!(p->moveState & MOVESTATE_400000)) {
        p->callback(p);
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80232D0(p);
    }

    sub_802486C(p, p->unk90);
    sub_8024B10(p, p->unk90);
    sub_8024F74(p, p->unk94);

    if (p->charState != 0x14 && p->timerInvulnerability > 0) {
        p->timerInvulnerability--;
    }

    if (p->unk36 != 0) {
        p->unk36--;
    }

    sub_8023748(p);
    sub_8015790();
    sub_80156D0();

    p->moveState &= ~MOVESTATE_800;
    gHomingTarget.squarePlayerDistance = 0x4000;
    gHomingTarget.angle = 0;
    gCheeseTarget.squarePlayerDistance = CHEESE_DISTANCE_MAX;
    gCheeseTarget.task = NULL;

    if (p->moveState & MOVESTATE_DEAD) {
        struct Camera *cam = &gCamera;
        gCurTask->main = Task_8023E90;
        p->charState = 0x16;
        p->speedAirX = 0;

        if (p->speedAirY < -0x400) {
            p->speedAirY = -0x200;
        } else if (p->speedAirY > 0) {
            p->speedAirY = 0;
        }

        p->timerInvulnerability = 2;
        p->itemEffect = 0;
        p->moveState &= ~MOVESTATE_20;
        p->moveState &= ~MOVESTATE_8;
        p->unk3C = 0;
        cam->unk50 |= 3;

        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;
        }

        p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        p->unk80 = 0x100;
        p->unk82 = 0x100;

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

        if (p->unk86 < 0) {
            m4aSongNumStart(SE_157);
        } else {
            m4aSongNumStart(SE_LIFE_LOST);
        }
    }
}

void CallPlayerTransition(Player *p)
{
    if (p->transition) {
        switch (p->transition - 1) {
            case PLTRANS_PT1 - 1: {
                PLAYERFN_SET(PlayerCB_8025318);
            } break;
            case PLTRANS_PT2 - 1: {
                PLAYERFN_SET(PlayerCB_8025A0C);
            } break;
            case PLTRANS_PT3 - 1: {
                p->moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(PlayerCB_Jump);
            } break;
            case PLTRANS_PT4 - 1: {
                p->moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(PlayerCB_8025F84);
            } break;
            case PLTRANS_PT7 - 1: {
                PLAYERFN_SET(PlayerCB_8028D74);
            } break;
            case PLTRANS_PT6 - 1: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(PlayerCB_8026060);
            } break;
            case PLTRANS_PT5 - 1: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(PlayerCB_802611C);
            } break;
            case PLTRANS_PT8 - 1: {
                PLAYERFN_SET(PlayerCB_801225C);
            } break;
            case PLTRANS_PT9 - 1: {
                PLAYERFN_SET(PlayerCB_8027250);
            } break;
            case PLTRANS_PT10 - 1: {
                if (gGameMode == GAME_MODE_TIME_ATTACK) {
                    gStageFlags |= STAGE_FLAG__TURN_OFF_TIMER;
                }

                if (p->moveState & (MOVESTATE_20000000 | MOVESTATE_10000000 | MOVESTATE_2000 | MOVESTATE_8 | MOVESTATE_IN_AIR)) {
                    p->moveState |= (MOVESTATE_8000000 | MOVESTATE_IGNORE_INPUT);
                    p->heldInput = 0;
                    p->frameInput = 0;
                } else {
                    p->moveState |= MOVESTATE_8000000;
                    PLAYERFN_SET(PlayerCB_80273D0);
                }
            } break;
            case PLTRANS_SPRING_UP - 1: {
                // NOTE: Set to 0 or 3 in floating_spring.c
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN - 1: {
                if (!GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_LEFT - 1: {
                p->unk6E |= 0x20;
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_RIGHT - 1: {
                p->unk6E |= 0x30;
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_UP_LEFT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x60;
                } else {
                    p->unk6E |= 0x40;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_UP_RIGHT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x70;
                } else {
                    p->unk6E |= 0x50;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN_LEFT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x40;
                } else {
                    p->unk6E |= 0x60;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN_RIGHT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x50;
                } else {
                    p->unk6E |= 0x70;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_PT22 - 1: {
                PLAYERFN_SET(PlayerCB_8029158);
            } break;
            case PLTRANS_PT24 - 1: {
                PLAYERFN_SET(PlayerCB_802A300);
            } break;
            case PLTRANS_PT11 - 1: {
                PLAYERFN_SET(PlayerCB_8026764);
            } break;
            case PLTRANS_PT12 - 1: {
                PLAYERFN_SET(PlayerCB_80269C0);
            } break;
            case PLTRANS_PT13 - 1: {
                PLAYERFN_SET(PlayerCB_8026A4C);
            } break;
            case PLTRANS_PT23 - 1: {
                PLAYERFN_SET(PlayerCB_802A258);
            } break;
            case PLTRANS_PT25 - 1: {
                PLAYERFN_SET(PlayerCB_8026E24);
            } break;
            case PLTRANS_PT28 - 1: {
                PLAYERFN_SET(PlayerCB_8026F10);
            } break;
            case PLTRANS_PT26 - 1: {
                PLAYERFN_SET(PlayerCB_8026FC8);
            } break;
            case PLTRANS_PT27 - 1: {
                PLAYERFN_SET(PlayerCB_8027114);
            } break;
        }
    }

    p->prevTransition = p->transition;
    p->transition = 0;
}

void sub_802460C(Player *p)
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

                r1 = ((p->unk32 + r1) & 0x3);
                if (!r1) {
                    r1 = 1;
                }

                dpad <<= r1;
                dpad = (dpad >> 4) | dpad;
                dpad = (u8)(dpad << 4);

                p->heldInput = (p->heldInput & ~DPAD_ANY) | dpad;

                if (--p->unk32 == 0) {
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
    Sprite *s = &p->unk90->s;
    u16 charAnim = p->charState;
    u32 r3 = p->anim;
    u32 variant = p->variant;
    u32 sl = variant;

    AnimId baseAnim = gPlayerCharacterIdleAnims[p->character];
    r3 = (u16)(r3 - baseAnim);

    if ((charAnim == 10) || (charAnim == 11)) {
        if (variant == 0 && (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) && (((u16)r3 - 10) == 0 || ((u16)r3 - 10) == 1)) {
            p->variant = 1;
            p->moveState |= MOVESTATE_4;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            if ((p->speedAirY > 0) && (p->variant == 1) && ((((u16)r3 - 10) == 0) || (((u16)r3 - 10) == 1))) {
                s32 newY = sub_801E6D4(I(p->y) + p->spriteOffsetY, I(p->x), p->layer, 8, NULL, sub_801EE64);

                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (newY <= 32) {
                        p->variant = 2;
                    }
                }
            }
        }
    } else {
        if (charAnim == SA2_CHAR_ANIM_38) {
            if (r3 == SA2_CHAR_ANIM_52) {
                if (variant == 0) {
                    if (p->speedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (variant == 1) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        } else if (charAnim == SA2_CHAR_ANIM_39) {
            if (r3 == SA2_CHAR_ANIM_53) {
                if (variant == 0) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->anim = (gPlayerCharacterIdleAnims[p->character] + SA2_CHAR_ANIM_52);
                        p->variant = 2;
                    }
                }
            }
        } else if (charAnim == SA2_CHAR_ANIM_37) {
            if (r3 == SA2_CHAR_ANIM_65) {
                if (variant == 0) {
                    if (p->speedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (variant == 1) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        } else if (charAnim == SA2_CHAR_ANIM_57) {
            if (r3 == SA2_CHAR_ANIM_66) {
                if (variant == 0) {
                    if (p->speedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (sl == 1) {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        }
    }
}

void sub_802486C(Player *p, PlayerSpriteInfo *p2)
{
#ifndef NON_MATCHING
    s32 speed;
    register s32 r0 asm("r0");
#endif
    Sprite *s = &p2->s;

    if ((p->charState != -1) && (p->charState != p->prevCharState)) {
        p->anim = gUnknown_080D6736[p->charState][0];

        // NOTE: Could it be that anims 80-91 are character-specific?
        if (p->charState < SA2_CHAR_ANIM_80) {
            p->anim += gPlayerCharacterIdleAnims[p->character];
        }
        p->variant = gUnknown_080D6736[p->charState][1];
        p2->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    }

    switch (((u16)(p->charState - 9) << 16) >> 16) {
        case SA2_CHAR_ANIM_WALK - 9: {
            p->anim = gPlayerCharacterIdleAnims[p->character] + SA2_CHAR_ANIM_WALK;
            p->variant = p->unk54;
        } // FALLTHROUGH!!!

        case 59 - 9:
        case 60 - 9:
        case 61 - 9: {
            PLAYERFN_SET_ANIM_SPEED(p, s);
        } break;

        case 16 - 9: {
            if (p->character != CHARACTER_CREAM) {
                break;
            }
#ifndef NON_MATCHING
            speed = p->speedGroundX;
            speed = (speed >> 5) + (speed >> 6);

            /* TODO: Try ABS macro */
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

        case 51 - 9:
        case 52 - 9: {
#ifndef NON_MATCHING
            r0 = p->speedAirY;
            goto lab;
#else
            s->animSpeed = I(ABS(p->speedAirY)) * 3 + 8;
#endif
        } break;

        case 53 - 9:
        case 54 - 9: {
#ifndef NON_MATCHING
            r0 = p->speedGroundX;
        lab:
            speed = I(ABS(r0)) * 3 + 8;
            s->animSpeed = speed;
#else
            s->animSpeed = I(ABS(p->speedGroundX)) * 3 + 8;
#endif
        } break;
    }

    if (IS_MULTI_PLAYER) {
        p->unk98 = 0;
    }

    if (p->unk6C || (s->graphics.anim != p->anim) || (s->variant != p->variant)) {
        p->unk6C = FALSE;
        s->graphics.anim = p->anim;
        s->variant = p->variant;
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;

        if (IS_MULTI_PLAYER) {
            p->unk98 = 1;
        }
    }

    p->prevCharState = p->charState;
}

#define MACRO_8024B10_PSI_UPDATE(p, psi)                                                                                                   \
    ({                                                                                                                                     \
        s32 x, y;                                                                                                                          \
        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {                                                                                     \
            psi->transform.width = -Q(1.0);                                                                                                \
        } else {                                                                                                                           \
            psi->transform.width = +Q(1.0);                                                                                                \
        }                                                                                                                                  \
        if (GRAVITY_IS_INVERTED) {                                                                                                         \
            psi->transform.width = -psi->transform.width;                                                                                  \
        }                                                                                                                                  \
                                                                                                                                           \
        if (psi->transform.width < 0) {                                                                                                    \
            psi->transform.x--;                                                                                                            \
        }                                                                                                                                  \
                                                                                                                                           \
        if (GRAVITY_IS_INVERTED) {                                                                                                         \
            psi->transform.height = Q(1.0);                                                                                                \
            /* requires double clamp to match */                                                                                           \
            psi->transform.rotation = CLAMP_SIN_PERIOD(CLAMP_SIN_PERIOD(-Q(1.0) - (psi->transform.rotation + psi->transform.height)));     \
        } else {                                                                                                                           \
            psi->transform.height = Q(1.0);                                                                                                \
        }                                                                                                                                  \
                                                                                                                                           \
        x = I(psi->transform.width * p->unk80);                                                                                            \
        y = I(psi->transform.height * p->unk82);                                                                                           \
        psi->transform.width = x;                                                                                                          \
        psi->transform.height = y;                                                                                                         \
        UpdateSpriteAnimation(s);                                                                                                          \
    })

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

    s->x = I(p->x) - camX;
    s->y = I(p->y) - camY;

    psi->transform.x = I(p->x) - camX;
    psi->transform.y = I(p->y) - camY;

    if (p->charState == SA2_CHAR_ANIM_WALK || p->charState == SA2_CHAR_ANIM_41 || p->charState == SA2_CHAR_ANIM_62 || p->charState == 63
        || (p->charState == SA2_CHAR_ANIM_87 && p->character == CHARACTER_CREAM)) {
        psi->transform.rotation = p->rotation << 2;
        s->frameFlags &= ~(SPRITE_FLAG_MASK_X_FLIP | SPRITE_FLAG_MASK_Y_FLIP);
        s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
        s->frameFlags |= p->unk60 | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

        MACRO_8024B10_PSI_UPDATE(p, psi);
        if (IS_SINGLE_PLAYER) {
            TransformSprite(s, &psi->transform);
        }
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

        if (GRAVITY_IS_INVERTED) {
            s->frameFlags |= SPRITE_FLAG_MASK_Y_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_Y_FLIP;
        }
        UpdateSpriteAnimation(s);
    }
    if (IS_SINGLE_PLAYER) {
        if (p->moveState & MOVESTATE_DEAD
            || (!(p->moveState & MOVESTATE_100000) && (p->timerInvulnerability == 0 || (gStageTime & 2) == 0))) {
            DisplaySprite(s);
        }

        if (IS_SINGLE_PLAYER) {
            return;
        }
    }

    send = &gMultiSioSend.pat4;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    send->unk0 = 0x5000;
    send->x = I(p->x) + p->unk7C;
    send->y = I(p->y);
    send->unk6 = s->graphics.anim;
    send->unkA = p->itemEffect;
    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        send->unk6 -= gPlayerCharacterIdleAnims[p->character];
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

    if (GRAVITY_IS_INVERTED) {
        send->unk8 |= 8;
    } else {
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
    send->unk8 |= ((gPlayer.unk90->s.frameFlags & 0x3000) >> 8);
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
    if (gPlayer.moveState & MOVESTATE_8) {
        u8 i;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            s32 id = SIO_MULTI_CNT->id;
            if (id != i) {
                MultiplayerPlayer *mpp2;
                if (gMultiplayerPlayerTasks[i] == NULL) {
                    break;
                }

                mpp2 = TASK_DATA(gMultiplayerPlayerTasks[i]);
                if (gPlayer.unk3C == &mpp2->s) {
                    mpp->unk64 = i;
                }
            }
        }
    }

    send->unk8 &= ~0x600;
    send->unk8 |= (mpp->unk64 << 9);
}

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
        psi->transform.x = I(p->x) - camX;
        psi->transform.y = I(p->y) - camY;
    }

    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    if (p->moveState & MOVESTATE_40) {
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
            s32 asx = p->speedAirX;
            s32 asy = p->speedAirY;

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

void PlayerCB_8025318(Player *p)
{
    u32 mask;
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            PlayerCB_8025F84(p);
            return;
        }
    }

    mask = (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR);
    if ((p->moveState & mask) == MOVESTATE_800) {
        Player_InitIceSlide(p);
    } else {
        Player_TransitionCancelFlyingAndBoost(p);

        p->moveState &= ~(MOVESTATE_4 | MOVESTATE_IN_AIR);

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        if (p->speedGroundX != 0) {
            p->charState = 9;
        } else {
            p->charState = 0;
        }

        PLAYERFN_SET_AND_CALL(PlayerCB_Idle, p);
    }
}

// TODO/NAME: Not only used for idling...
void PlayerCB_Idle(Player *p)
{
    if ((p->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8000000) {
        PlayerCB_80273D0(p);
    } else if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_800) {
        Player_InitIceSlide(p);
    } else if (!sub_802A0C8(p) && !sub_802A0FC(p) && !sub_8029E6C(p) && !sub_802A2A8(p)) {
        sub_802966C(p);

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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
    if (!sub_802A0FC(p) && !sub_8029E6C(p) && ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || !sub_802A2A8(p))) {
        if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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
        u16 dpad = (p->heldInput & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (p->variant == 0)) {
                p->variant = 1;
                p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            }
        } else if (dpad != DPAD_UP) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (p->variant == 1) && (s->frameFlags & 0x4000)) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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
        u16 dpad = (p->heldInput & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (p->variant == 0)) {
                p->variant = 1;
                p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
            }
        } else if (dpad != DPAD_DOWN) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (p->variant == 1) && (s->frameFlags & 0x4000)) {
            PLAYERFN_SET(PlayerCB_8025318);
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if ((p->moveState & MOVESTATE_IN_AIR)) {
            PlayerCB_8025F84(p);
            return;
        }
    }

    if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_800) {
        Player_InitIceSlide(p);
    } else {
        p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->charState = 4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_4;
        p->unk99[0] = 0;
        PLAYERFN_SET_AND_CALL(PlayerCB_8025AB8, p);
    }
}

void PlayerCB_8025AB8(Player *p)
{
    if ((p->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8000000) {
        PlayerCB_80273D0(p);
    } else if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_800) {
        Player_InitIceSlide(p);
    } else {
        if (p->unk99[0] != 0) {
            p->unk99[0]--;
        } else if (!sub_8029E6C(p)) {
            if (p->unk2A == 0) {
                u16 dpadSideways = (p->heldInput & (DPAD_LEFT | DPAD_RIGHT));
                if (dpadSideways != DPAD_RIGHT) {
                    if (dpadSideways == DPAD_LEFT) {
                        s32 val = p->speedGroundX;
                        if (val <= 0) {
                            p->moveState |= MOVESTATE_FACING_LEFT;
                        } else if ((val - Q(0.09375)) < 0) {
                            s32 deceleration = -Q(0.375);
                            p->speedGroundX = deceleration;
                        } else {
                            p->speedGroundX = (val - Q(0.09375));
                        }
                    }
                } else {
                    s32 val = p->speedGroundX;
                    if (val >= 0) {
                        p->moveState &= ~MOVESTATE_FACING_LEFT;
                    } else if ((val + Q(0.09375)) > 0) {
                        p->speedGroundX = Q(0.375);
                    } else {
                        p->speedGroundX = (val + Q(0.09375));
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

        if ((p->speedGroundX > -Q(0.5)) && (p->speedGroundX < Q(0.5))) {
            p->unk50 = 0;
            p->speedGroundX = 0;
        }

        if (p->speedGroundX == 0) {
            PLAYERFN_SET_AND_CALL(PlayerCB_8025318, p);
        } else {
            s32 speedX = p->speedGroundX;

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

    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if (p->moveState & MOVESTATE_4) {
        p->moveState |= MOVESTATE_10;
    }

    if (ABS(p->speedAirX) < Q(1.25)) {
        p->charState = 10;
    } else {
        p->charState = 11;
    }

    p->unk70 = TRUE;

    jumpHeight = (p->moveState & MOVESTATE_40) ? Q(PLAYER_JUMP_HEIGHT_UNDER_WATER) : Q(PLAYER_JUMP_HEIGHT);

    rot = p->rotation - 64;

    accelX = I(COS_24_8(rot * 4) * jumpHeight);
    p->speedAirX += accelX;

    accelY = I(SIN_24_8(rot * 4) * jumpHeight);
    p->speedAirY += accelY;

    if (p->moveState & MOVESTATE_8) {
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->speedAirX -= Q(gCamera.dx);
        }
    }

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(PlayerCB_Jumping, p);
}

void PlayerCB_Jumping(Player *p)
{
    s16 maxJumpSpeed = -Q(PLAYER_MAX_NOT_HELD_JUMP_FORCE);

    if (p->moveState & MOVESTATE_40) {
        maxJumpSpeed = -Q(PLAYER_MAX_NOT_HELD_JUMP_FORCE_UNDER_WATER);
    }

    if (p->moveState & MOVESTATE_100) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            if (sub_801251C(p) || sub_80294F4(p))
                return;

        // Caps the jump force if the player lets go of the jump button
        if (p->speedAirY < maxJumpSpeed && !(p->heldInput & gPlayerControls.jump)) {
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

    if (ABS(p->speedAirX) < Q(1.25)) {
        p->charState = 10;
    } else {
        p->charState = 11;
    }

    p->unk70 = TRUE;

    p->unk90->s.frameFlags &= ~MOVESTATE_4000;
    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(PlayerCB_Jumping, p);
}

void PlayerCB_8026060(Player *p)
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

    p->unk90->s.frameFlags &= ~MOVESTATE_4000;

    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80261D8, p);
}

void PlayerCB_802611C(Player *p)
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

    p->unk90->s.frameFlags &= ~MOVESTATE_4000;

    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80261D8, p);
}

void PlayerCB_80261D8(Player *p)
{
    sub_80246DC(p);

    if ((p->unk6E != 1) || (p->speedAirY > 0)) {
        sub_8023610(p);

        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->moveState & MOVESTATE_100)) {
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
    p->charState = 3;

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

void PlayerCB_Spindash(Player *p)
{
    Sprite *s = &p->unk90->s;
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

        p->speedGroundX = speed;

        gPlayer.callback = PlayerCB_8025A0C;

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
            struct MusicPlayerInfo *mPlayerInfo;
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

        if (p->moveState & MOVESTATE_40) {
            p->speedAirY += Q(PLAYER_GRAVITY_UNDER_WATER);
        } else {
            p->speedAirY += Q(PLAYER_GRAVITY);
        }

        p->x += p->speedAirX;

        if ((gStageFlags ^ gUnknown_0300544C) & STAGE_FLAG__GRAVITY_INVERTED) {
            p->speedAirY = -p->speedAirY;
        }

        p->speedAirY = MIN(p->speedAirY, Q(PLAYER_AIR_SPEED_MAX));

        p->y = GRAVITY_IS_INVERTED ? p->y - p->speedAirY : p->y + p->speedAirY;

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

        if ((p->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {
            gPlayer.callback = PlayerCB_8025318;
            p->speedGroundX = p->speedAirX;
            p->rotation = 0;
        }
    } else {
        s32 groundSpeed = p->speedGroundX;

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

            p->speedGroundX = groundSpeed;
        }

        sub_80232D0(p);
        sub_8023260(p);
        sub_8023128(p);

        p->x += p->speedAirX;

        if ((gStageFlags ^ gUnknown_0300544C) & STAGE_FLAG__GRAVITY_INVERTED) {
            p->speedAirY = -p->speedAirY;
        }

        p->speedAirY = MIN(p->speedAirY, Q(PLAYER_AIR_SPEED_MAX));

        p->y = GRAVITY_IS_INVERTED ? p->y - p->speedAirY : p->y + p->speedAirY;

        sub_8022D6C(p);

        if (p->unk2A) {
            p->unk2A -= 1;
        } else if ((p->rotation + 32) & 0xC0) {
            s32 absGroundSpeed = ABS(p->speedGroundX);
            if (absGroundSpeed < Q(1.875)) {
                p->speedGroundX = 0;

                p->moveState |= MOVESTATE_IN_AIR;
                p->unk2A = GBA_FRAMES_PER_SECOND / 2;
            }
        }
    }
}

void sub_802669C(Player *p)
{
    s32 newY;
    p->layer = 0;
    p->rotation = 0;

    p->unk90->s.frameFlags &= ~(MOVESTATE_2000 | MOVESTATE_1000);
    p->unk90->s.frameFlags |= MOVESTATE_1000;

    p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

    if (GRAVITY_IS_INVERTED) {
        newY = sub_801E6D4(I(p->y) - p->spriteOffsetY, I(p->x), p->layer, -8, NULL, sub_801EE64);

        newY = p->y - Q(newY);
    } else {
        newY = sub_801E6D4(I(p->y) + p->spriteOffsetY, I(p->x), p->layer, 8, NULL, sub_801EE64);

        newY = p->y + Q(newY);
    }
    p->y = newY;
    p->moveState &= ~MOVESTATE_IN_AIR;

    gPlayer.moveState |= MOVESTATE_IN_SCRIPTED;
}

void PlayerCB_8026764(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState |= MOVESTATE_1000000;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = 41;

    if (p->unk6E != 0) {
        p->moveState |= MOVESTATE_FACING_LEFT;

        p->speedAirX = MIN(p->speedAirX, -Q(1.0));
        p->speedGroundX = MIN(p->speedAirX, -Q(1.0));
    } else {
        p->moveState &= ~MOVESTATE_FACING_LEFT;

        p->speedAirX = MAX(p->speedAirX, Q(1.0));
        p->speedGroundX = MAX(p->speedAirX, Q(1.0));
    }

    sub_802669C(p);
    m4aSongNumStart(SE_GRINDING);

    PLAYERFN_SET_AND_CALL(PlayerCB_8026810, p);
}

void PlayerCB_8026810(Player *p)
{
    if (sub_8029E6C(p)) {
        p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
        p->layer = 1;

        gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
        m4aSongNumStop(SE_GRINDING);
    } else {
        if (p->speedGroundX >= 0) {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        } else {
            p->moveState |= MOVESTATE_FACING_LEFT;
        }

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0)
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
            p->charState = 14;

            p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
            p->layer = 1;

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
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = 9;

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    p->layer = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);
    PLAYERFN_SET_AND_CALL(PlayerCB_Idle, p);
}

void PlayerCB_8026A4C(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState &= ~MOVESTATE_4;
    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->heldInput & gPlayerControls.jump)
        && (p->character == CHARACTER_SONIC || p->character == CHARACTER_AMY)) {
        p->charState = 42;
        p->speedAirY = -Q(7.5);
    } else {
        p->charState = 39;
        p->speedAirY = -Q(4.875);
    }

    if (p->moveState & MOVESTATE_40)
        p->speedAirY /= 2;

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    p->layer = 1;

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

    if ((p->unk2A == 0) && (p->heldInput & (DPAD_LEFT | DPAD_RIGHT))) {
        if ((p->heldInput & DPAD_RIGHT) && (groundSpeed < p->unk44)) {
            groundSpeed += Q(1.0 / 32.0);
        } else if ((p->heldInput & DPAD_LEFT) && (groundSpeed > Q(1.0))) {
            groundSpeed -= Q(1.0 / 32.0);
        }
    }

    if (groundSpeed < Q(1.0)) {
        groundSpeed += Q(1.0 / 32.0);
    }

    p->speedGroundX = groundSpeed;
}

void PlayerCB_8026BCC(Player *p)
{
    if (!sub_8029E6C(p)) {
        sub_8026B64(p);
        sub_8023128(p);

        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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
            p->charState = 14;

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

    sub_802A500_inline(p);

    PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p);
}

void PlayerCB_8026E24(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);

    p->moveState |= (MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->rotation = 0;
    p->charState = 4;

    p->moveState &= ~MOVESTATE_FACING_LEFT;

    switch (p->unk6E & 0x30) {
        case 0x00: {
            p->moveState |= MOVESTATE_IN_AIR;
            p->speedAirX = 0;
            p->speedAirY = -Q(12.0);
            p->speedGroundX = Q(12.0);
        } break;

        case 0x10: {
            p->moveState |= MOVESTATE_IN_AIR;
            p->speedAirX = 0;
            p->speedAirY = Q(12.0);
            p->speedGroundX = Q(12.0);
        } break;

        case 0x20: {
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->moveState |= MOVESTATE_FACING_LEFT;
            p->speedAirX = -Q(12.0);
            p->speedAirY = 0;
            p->speedGroundX = -Q(12.0);
        } break;

        case 0x30: {
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->speedAirX = Q(12.0);
            p->speedAirY = 0;
            p->speedGroundX = Q(12.0);
        } break;
    }

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
    p->layer = 0;

    m4aSongNumStart(SE_SPIN);

    PLAYERFN_SET_AND_CALL(PlayerCB_802A3B8, p);
}

void PlayerCB_8026F10(Player *p)
{
    if ((p->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_800) {
        Player_InitIceSlide_inline(p);
    } else {
        //_08026F74
        p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
        p->charState = 4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

        p->moveState |= MOVESTATE_4;

        p->unk99[0] = 30;

        PLAYERFN_SET_AND_CALL(PlayerCB_8025AB8, p);
    }
}

void PlayerCB_8026FC8(Player *p)
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

    p->charState = 63;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_8027040, p);
}

void PlayerCB_8027040(Player *p)
{
    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->rotation -= Q(4.0 / 256.0);
    } else {
        p->rotation += Q(4.0 / 256.0);
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
    Player_TransitionCancelFlyingAndBoost(p);

    if ((!(p->moveState & MOVESTATE_4) || (p->charState != 4))) {
        p->charState = 47;
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

    if (p->heldInput & DPAD_LEFT) {
        speed -= u48;

        if (speed < -u40) {
            speed += u48;

            if (speed > -u40)
                speed = -u40;
        }
    } else if (p->heldInput & DPAD_RIGHT) {
        speed += u48;

        if (speed > +u40) {
            speed -= u48;

            if (speed < +u40)
                speed = +u40;
        }
    } else if (speed > 0) {
        speed -= Q(8.0 / 256.0);
    } else {
        speed += Q(8.0 / 256.0);
    }
    p->speedGroundX = speed;

    sub_80232D0(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void PlayerCB_8027250(Player *p)
{
    p->timerInvulnerability = 0x78;
    p->isBoosting = 0;

    if (ABS(p->speedAirX) <= Q(2.5)) {
        if (p->speedAirX <= Q(0.625)) {
            if (p->speedAirX < -Q(0.625)) {
                p->speedAirX = +Q(1.5);
            } else {
                if ((p->moveState & MOVESTATE_FACING_LEFT)) {
                    p->speedAirX = +Q(1.5);
                } else {
                    p->speedAirX = -Q(1.5);
                }
            }
        } else {
            p->speedAirX = -Q(1.5);
        }
        p->charState = 0x14;
    } else {
        if (p->speedAirX >= 0) {
            p->speedAirX = +Q(1.5);
        } else {
            p->speedAirX = -Q(1.5);
        }
        p->charState = 0x15;
    }

    p->speedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_40) {
        p->speedAirY >>= 1;
        p->speedAirX >>= 1;
    }

    Player_TransitionCancelFlyingAndBoost(p);

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
            gSpecialRingCount = SPECIAL_STAGE_REQUIRED_SP_RING_COUNT;

        if ((gPlayer.moveState & MOVESTATE_8000000) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            sub_802A40C(p);
        } else {
            Player_TransitionCancelFlyingAndBoost(p);

            p->moveState &= ~(MOVESTATE_4 | MOVESTATE_FACING_LEFT);

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

            if (p->speedGroundX <= 0) {
                sub_802785C(p);
            } else {
                p->charState = 9;

                p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

                p->moveState &= ~MOVESTATE_IGNORE_INPUT;

                PLAYERFN_SET_AND_CALL(PlayerCB_GoalSlowdown, p);
            }
        }
    }
}

void PlayerCB_GoalSlowdown(Player *p)
{
    u32 playerX = I(p->x);
    u16 playerX2;

    playerX2 = playerX - gStageGoalX;

    if (((p->speedGroundX >= Q(2.0)) && (p->frameInput & DPAD_LEFT)) || (playerX2 > 0x579)) {
        p->charState = 25;

        p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

        m4aSongNumStart(SE_LONG_BRAKE);
        PLAYERFN_SET_AND_CALL(PlayerCB_GoalBrake, p);
    } else {
        s32 grnd = p->speedGroundX;
        if (grnd > 0) {
            s32 speedOg = p->speedGroundX - Q(8.0 / 256.0);
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
            PlayerCB_CameraShift_inline(p);

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

    PlayerCB_CameraShift_inline(p);

    if (cAnim == SA2_CHAR_ANIM_31) {
        if ((p->variant == 0) && (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            p->charState = 26;
        }

        if ((p->variant == 1) && (p->speedGroundX <= 0)) {
            p->charState = 27;
            p->speedGroundX = 0;
            m4aSongNumStop(SE_LONG_BRAKE);

            if (gStageGoalX != 0) {
                u16 playerX = I(p->x) - gStageGoalX;
                s32 r8 = 0;

                if (playerX <= 730)
                    r8 = 800;
                else if (playerX <= 1114)
                    r8 = 500;
                else if (playerX <= 1401)
                    r8 = 100;

                if (r8 != 0) {
                    INCREMENT_SCORE(r8);

                    CreateStageGoalBonusPointsAnim(I(p->x), I(p->y), r8);
                }
            }
        }

        if ((p->variant == 2) && (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
            sub_802785C(p);
            return;
        }
    }

    p->speedGroundX -= Q(0.125);
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
    PlayerCB_CameraShift_inline(p);

    p->unk72 = 90;

    if (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        switch (gCurrentLevel & 0x3) {
            case ACT_1: {
                p->charState = 28;
                PLAYERFN_SET(PlayerCB_80278D4);
            } break;

            case ACT_2: {
                p->charState = 29;
                PLAYERFN_SET(PlayerCB_80278D4);
            } break;

            case ACT_BOSS: {
                p->charState = 32;
            } break;
        }
    } else {
        p->charState = 28;
    }
}

void PlayerCB_80278D4(Player *p)
{
    PlayerCB_CameraShift_inline(p);

    if (--p->unk72 == 0) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
        } else {
            CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
        }
        PLAYERFN_SET(PlayerCB_CameraShift);
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

void PlayerCB_80279F8(Player *p)
{
    if (p->speedGroundX > Q(5.5)) {
        p->speedGroundX -= Q(0.5);
    } else if (p->speedAirX < Q(4.75)) {
        p->speedGroundX += Q(0.25);
    } else {
        p->speedGroundX = Q(5.0);
    }

    if (p->unk72 < INT16_MAX)
        p->unk72++;

    if (p->unk72 == 120) {
        p->charState = 32;
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

    PlayerCB_CameraShift_inline(p);

    if (p->moveState & MOVESTATE_4000000) {
        p->isBoosting = 1;
        p->heldInput = 0x10;
        p->speedGroundX = Q(10.0);
        p->charState = 9;
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
    s32 playerX = I(p->x) - gCamera.x;

    if (playerX > (DISPLAY_WIDTH / 2)) {
        p->speedGroundX = Q(4.5);
    } else if (playerX < (DISPLAY_WIDTH / 2)) {
        p->speedGroundX = Q(5.5);
    } else {
        p->speedGroundX = Q(5.0);
    }

    sub_80232D0(p);
    sub_8023260(p);

    PLAYERFN_UPDATE_POSITION(p);

    sub_8022D6C(p);

    PLAYERFN_UPDATE_UNK2A(p);
}

// Multiplayer-only
void PlayerCB_8027D3C(Player *p)
{
    s8 *someSio = gUnknown_030054B4;
    s32 sioDat = ((REG_SIOCNT_32 << 26) >> 30);
    u16 r8 = someSio[sioDat];
    s32 *pCmpX = &gStageGoalX;
    u32 cmpX;
    s32 index = (0x40 + (r8 * 32));

    cmpX = Q(*pCmpX + index);
    if (p->x < cmpX) {
        p->heldInput = DPAD_RIGHT;
    } else if (p->x > cmpX) {
        p->heldInput = DPAD_LEFT;
    } else {
        p->heldInput = 0;
    }

    sub_802966C(p);
    if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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

    if (((p->x > cmpX) && (p->heldInput == DPAD_RIGHT)) // fmt
        || ((p->x < cmpX) && (p->heldInput == DPAD_LEFT)) //
        || (p->x == cmpX)) {
        p->isBoosting = 0;
        p->speedAirX = 0;
        p->speedAirY = 0;
        p->speedGroundX = 0;
        p->x = cmpX;

        // TODO: Check correctness of MULTI_SIO_PLAYERS_MAX being here!
        if (r8 < MULTI_SIO_PLAYERS_MAX) {
            p->charState = 28;
        } else {
            p->charState = 0;
        }

        p->moveState &= ~MOVESTATE_FACING_LEFT;
        p->unk72 = 0;
        p->heldInput = 0;

        PLAYERFN_SET(PlayerCB_Nop);
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
        if (((p->rotation + Q(0.375)) & 0xFF) < 0xC0) {
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

struct Task *sub_8028640(s32 x, s32 y, s32 p2)
{
    struct Task *t;
    TaskStrc_801F15C *taskStrc;
    Sprite *s;

    u16 p2_ = p2;

    t = sub_801F15C(x, y, 232, gPlayer.unk60, Task_801F214, TaskDestructor_801F550);

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

// Set when doing tricks
void PlayerCB_80286F0(Player *p)
{
    u32 dir = p->unk5B;
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

    p->speedAirX = 0;
    p->speedAirY = 0;

    p->charState = gUnknown_080D698A[dir];
    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;

    m4aSongNumStart(SE_JUMP);
    m4aSongNumStart(SE_230);

    PLAYERFN_SET_AND_CALL(PlayerCB_80287AC, p);
}

void PlayerCB_80287AC(Player *p)
{
    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
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
                sub_8028640(I(p->x), I(p->y), 0);
            }
            if (dir == TRICK_DIR_UP && character == CHARACTER_KNUCKLES) {
                sub_8028640(I(p->x), I(p->y), 1);
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

        if ((mask & MASK_80D6992_8) && (p->charState != 14))
            p->charState = 14;
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

    if (!(p->moveState & MOVESTATE_IN_AIR) && (p->character == CHARACTER_KNUCKLES) && (p->unk5B == 2)) {
        p->variant++;
        PLAYERFN_SET(PlayerCB_802A3C4);
    }
}

void DoTrickIfButtonPressed(Player *p)
{
    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (p->unk36 == 0) && (p->frameInput & gPlayerControls.trick)) {

        if (p->heldInput & DPAD_UP) {
            INCREMENT_SCORE(sTrickPoints[0]);
            p->unk5B = TRICK_DIR_UP;
            PLAYERFN_SET(PlayerCB_80286F0);
        } else if (p->heldInput & DPAD_DOWN) {
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
        } else if ((!(p->moveState & MOVESTATE_FACING_LEFT) && (p->heldInput & DPAD_RIGHT))
                   || ((p->moveState & MOVESTATE_FACING_LEFT) && (p->heldInput & DPAD_LEFT))) {
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

    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_ANIM_OVER;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_8029074, p);
}

void PlayerCB_TouchNormalSpring(Player *p)
{
    u8 u6E = p->unk6E;
    u8 r5 = (u6E >> 4);
    u8 r6 = u6E % 4;

    Player_TransitionCancelFlyingAndBoost(p);

    if (((r5 == 2) || (r5 == 3)) && !(p->moveState & MOVESTATE_IN_AIR)) {
        p->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);
    } else {
        p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    }

    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        p->charState = 37;
    } else if (ABS(p->speedAirX) < Q(2.5)) {
        p->charState = 38;
    } else {
        p->charState = 39;
    }

    p->prevCharState = -1;

    switch (r5) {
        case 0: {
            p->speedAirY = -sSpringAccelY[r6];
        } break;

        case 1: {
            p->speedAirY = +sSpringAccelY[r6];
        } break;

        case 2: {
            p->speedAirX = -sSpringAccelX[r6];

            if (!(p->moveState & MOVESTATE_IN_AIR) && p->speedAirX < -Q(9.0)) {
                p->isBoosting = 1;
            }
        } break;

        case 3: {
            p->speedAirX = +sSpringAccelX[r6];

            if (!(p->moveState & MOVESTATE_IN_AIR) && p->speedAirX > +Q(9.0)) {
                p->isBoosting = 1;
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

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
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

    if (p->speedAirX > Q(1.25)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (p->speedAirX < -Q(1.25)) {
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
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_8);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = 40;
    p->prevCharState = -1;

    if (p->speedAirX > Q(1.25)) {
        p->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (p->speedAirX < -Q(1.25)) {
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

            p->speedAirX = r5 + Q(3.75);
            p->speedAirY = res + -Q(3.75);
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

            p->speedAirX = r5 + Q(3.75);
            p->speedAirY = res + -Q(7.50);
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

            p->speedAirX = r5 + Q(5.625);
            p->speedAirY = res + -Q(2.50);
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

            p->speedAirX = r5 + Q(11.25);
            p->speedAirY = res + -Q(2.50);
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
    if ((p->charState == 40) && (p->variant == 0) && (p->speedAirY > 0))
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
        if (p->frameInput & gPlayerControls.attack) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    PlayerCB_8011F1C(p);
                    return TRUE;
                } break;

                case CHARACTER_CREAM: {
                    if ((p->heldInput & DPAD_ANY) == DPAD_DOWN) {
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
        if (p->frameInput & gPlayerControls.jump) {
            switch (p->character) {
                case CHARACTER_SONIC: {
                    if (!IS_BOSS_STAGE(gCurrentLevel) && gHomingTarget.squarePlayerDistance < 0x4000) {
                        sub_8012194(p);
                        return TRUE;
                    } else {
                        p->moveState |= MOVESTATE_20000000;
                        p->charState = 18;
                        sub_8011B88(I(p->x), I(p->y), 1);
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
                    p->charState = 18;
                    CreateAmyAttackHeartEffect(2);

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

// (100.00%) https://decomp.me/scratch/ZcC17
void sub_802966C(Player *p)
{
    s8 charState = -1;
    s32 u48 = p->unk48;
    s32 u4C = p->unk4C;

    if ((p->unk2A == 0) && p->heldInput & (DPAD_LEFT | DPAD_RIGHT)) {
        if (p->speedGroundX > 0) {
            if (p->heldInput & DPAD_RIGHT) {
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
                if ((p->charState == 7) || (p->charState == 8)) {
                    charState = p->charState;
                } else {
                    u16 u54 = p->unk54;
                    charState = 7;
                    if (u54 > 3) {
                        charState = 8;
                    }
                }
                p->speedGroundX -= u4C;
                sub_8029FA4(p);
                m4aSongNumStart(SE_BRAKE);
            } else {
                p->speedGroundX -= u4C;

                if ((p->speedGroundX > 0) && !(p->moveState & MOVESTATE_FACING_LEFT)) {
                    if ((p->charState == 7) || (p->charState == 8)) {
                        charState = 7;
                    }
                    gPlayer.callback = PlayerCB_802A5C4;
                }
            }
        } else if (p->speedGroundX < 0) {
            if (p->heldInput & DPAD_LEFT) {
                if (p->speedGroundX > -p->unk44) {
                    p->speedGroundX -= u48;

                    if (p->speedGroundX < -p->unk44) {
                        p->speedGroundX = -p->unk44;
                    }
                } else {
                    p->unk58 += u48;
                }
                p->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                if (p->speedGroundX <= -Q_24_8(2.0)) {
                    if ((p->charState == 7) || (p->charState == 8)) {
                        charState = p->charState;
                    } else {
                        u16 u54 = p->unk54;
                        charState = 7;
                        if (u54 > 3) {
                            charState = 8;
                        }
                    }

                    p->speedGroundX += u4C;

                    sub_8029FA4(p);
                    m4aSongNumStart(SE_BRAKE);
                } else {
                    p->speedGroundX += u4C;

                    if ((p->speedGroundX < 0) && (p->moveState & MOVESTATE_FACING_LEFT)) {
                        if ((p->charState == 7) || (p->charState == 8)) {
                            charState = 7;
                        }
                        gPlayer.callback = PlayerCB_802A5C4;
                    }
                }
            }
        } else {
            if ((p->moveState & MOVESTATE_FACING_LEFT) != ((p->heldInput & DPAD_RIGHT) >> 4)) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->speedGroundX -= u48;
                } else {
                    p->speedGroundX += u48;
                }

                charState = 9;
                sub_8023B5C(p, 14);
                p->spriteOffsetX = 6;
                p->spriteOffsetY = 14;
            } else {
                gPlayer.callback = PlayerCB_802A5C4;
            }
        }
    } else {
        s32 grndSpeed = p->speedGroundX;
        if (grndSpeed > 0) {
            s16 val = grndSpeed - Q_24_8(8.0 / 256.0);
            if (val <= 0) {
                val = 0;
                charState = 0;
            } else {
                charState = 9;
            }

            p->speedGroundX = val;
        } else if (grndSpeed < 0) {
            s16 val = grndSpeed + Q_24_8(8.0 / 256.0);
            if (val >= 0) {
                val = 0;
                charState = 0;
            } else {
                charState = 9;
            }

            p->speedGroundX = val;
        } else {
            charState = 0;
        }
    }

    if (p->moveState & MOVESTATE_8000) {
        if ((charState == 7) || (charState == 8)) {
            p->charState = charState;
        }
    } else if (charState != -1) {
        if (p->charState != charState)
            p->charState = charState;
    } else if ((p->charState == 7) || (p->charState == 8)) {
        p->charState = 9;
    }

    sub_8023128(p);
}

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
    bool32 isBoostActive = p->isBoosting;
    if (isBoostActive) {
        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->unk58 = gUnknown_080D6916[p->unk52];

            if (ABS(p->speedGroundX) < Q(4.5)) {
                p->isBoosting = FALSE;
                p->unk58 = 0;
            }
        }
    } else {
        if ((!(p->moveState & MOVESTATE_IN_AIR)) && ((ABS(p->speedGroundX) >= p->unk44))) {
            if (p->unk58 >= gUnknown_080D6916[p->unk52]) {
                p->isBoosting = TRUE;
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

    if (absSpeed <= Q(1.25)) {
        p->unk54 = 0;
    } else if (absSpeed <= Q(2.5)) {
        p->unk54 = 1;
    } else if (absSpeed <= Q(4.0)) {
        p->unk54 = 2;
    } else if (absSpeed <= Q(9.0)) {
        p->unk54 = 3;
    } else if (absSpeed <= Q(10.0)) {
        p->unk54 = 4;
    } else {
        p->unk54 = 5;
    }
}

void CallSetStageSpawnPos(u32 character, u32 level, u32 p2, Player *p) { SetStageSpawnPos(character, level, p2, p); }

void sub_80299FC(Player *p)
{
    TaskDestroy(p->spriteTask);
    p->spriteTask = NULL;

    if (p->unk60 == 0) {
        sub_801F78C();
        DestroyRingsScatterTask();
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

    playerY2 = I(p->y) + p->spriteOffsetY;
    playerX2 = I(p->x) - (2 + p->spriteOffsetX);

    mask = p->layer;
    if (p->speedAirY < 0) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerY2, playerX2, mask, 8, &anotherByte, sub_801EE64);

    playerY = I(p->y) + p->spriteOffsetY;
    playerX = I(p->x) + (2 + p->spriteOffsetX);

    mask = p->layer;
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
    s32 rot = p->rotation + Q(0.25);

    if ((rot & UINT8_MAX) > INT8_MAX)
        p->speedGroundX = 0;
}

void sub_8029CA0(Player *p)
{
    s32 rot = p->rotation;
    if (((rot + Q(0.375)) & 0xFF) < 0xC0) {
        rot = GET_ROTATED_ACCEL(rot);

        if (p->speedGroundX != 0) {
            p->speedGroundX += rot;
        }
    }
}

void sub_8029CE0(Player *p)
{
    s32 rot = p->rotation;
    if (((rot + Q(0.375)) & 0xFF) < 0xC0) {
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

    if ((((p->rotation + Q(0.375)) & 0xFF) < 0xC0) && grndSpeed != 0) {
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
            if (playerY <= Q(cam->minY))
                return TRUE;
        } else {
            if (playerY >= Q(cam->maxY) - 1)
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
            if (playerY <= Q(cam->y - (DISPLAY_HEIGHT / 2)))
                return TRUE;
        } else {
            if (playerY >= Q(cam->y) + Q(DISPLAY_HEIGHT + 80) - 1)
                return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_8029E6C(Player *p)
{
    u8 rot = p->rotation;

    if (p->frameInput & gPlayerControls.jump) {
        if (GRAVITY_IS_INVERTED) {
            rot += Q(0.25);
            rot = -rot;
            rot -= Q(0.25);
        }

        if (sub_8022F58(rot + Q(0.5), p) > 3) {
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
        s32 u17 = p->spriteOffsetY;

        if (GRAVITY_IS_INVERTED) {
            u17 = -u17;
        }

        CreateBrakingDustEffect(I(p->x), I(p->y) + u17);
    }
}

void Player_SetMovestate_IsInScriptedSequence(void) { gPlayer.moveState |= MOVESTATE_IN_SCRIPTED; }

void Player_ClearMovestate_IsInScriptedSequence(void) { gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED; }

void Player_DisableInputAndBossTimer(void)
{
    gPlayer.transition = PLTRANS_PT10;
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

void TaskDestructor_802A07C(struct Task *t)
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
    if (((p->heldInput & DPAD_ANY) == DPAD_UP) && p->speedGroundX == 0) {
        PLAYERFN_SET(PlayerCB_802A620);
        return TRUE;
    }

    return FALSE;
}

bool32 sub_802A0FC(Player *p)
{
    if ((p->heldInput & DPAD_ANY) == DPAD_DOWN) {
        if ((p->speedGroundX == 0) && (((p->rotation + Q(0.125)) & 0xC0) == 0)
            && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_4 | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(PlayerCB_802A228);
            return TRUE;
        } else if (((u16)(p->speedGroundX + (Q(0.5) - 1)) > Q(1.0) - 2)
                   && !(p->moveState & (MOVESTATE_1000000 | MOVESTATE_4 | MOVESTATE_IN_AIR))) {
            PLAYERFN_SET(PlayerCB_8025A0C);
            m4aSongNumStart(SE_SPIN_ATTACK);
            return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_802A184(Player *p)
{
    if (p->charState == 2) {
        if (p->frameInput & gPlayerControls.jump) {
            PLAYERFN_SET_AND_CALL(PlayerCB_802631C, p);
            return TRUE;
        }
    }

    return FALSE;
}

void sub_802A1C8(Player *p)
{
    u32 unk52 = p->unk52;
    if (p->isBoosting) {
        p->unk44 = Q(12.0);
        p->unk40 = Q(15.0);
    } else if (p->moveState & MOVESTATE_4) {
        p->unk44 = Q(6.0);
        p->unk40 = Q(15.0);
    } else {
        p->unk44 = Q(6.0);
        p->unk40 = Q(9.0);
    }

    p->unk48 = gUnknown_080D6902[unk52][0];
    p->unk4C = gUnknown_080D6902[unk52][1];
}

void PlayerCB_802A228(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->charState = 2;
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
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (p->moveState & (MOVESTATE_8000 | MOVESTATE_400))
        || ((p->rotation + Q(0.25)) << 24 <= 0)) {
        return FALSE;
    } else if (p->frameInput & gPlayerControls.attack) {
        PLAYERFN_SET(Player_InitAttack);
        return TRUE;
    } else {
        return FALSE;
    }
}

void PlayerCB_802A300(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_8);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->prevCharState = -1;

    p->rotation = 0;

    m4aSongNumStart(SE_DASH_RING);

    PLAYERFN_SET_AND_CALL(PlayerCB_802940C, p);
}

void Player_InitIceSlide(Player *p) { Player_InitIceSlide_inline(p); }

void PlayerCB_802A3B8(Player *p) { sub_802808C(p); }

void PlayerCB_802A3C4(Player *p)
{
    sub_8027EF0(p);

    if (p->unk90->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)
        PLAYERFN_SET(PlayerCB_8025A0C);
}

void PlayerCB_CameraShift(Player *p) { PlayerCB_CameraShift_inline(p); }

void sub_802A40C(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->isBoosting = 0;
    p->charState = 9;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);
    p->unk72 = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80279F8, p);
}

// Boss-Stage-only
void sub_802A468(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->charState = 9;
    p->moveState &= ~(MOVESTATE_FACING_LEFT);

    PLAYERFN_SET_AND_CALL(PlayerCB_8027C5C, p);
}

// Multiplayer-only
void sub_802A4B8(Player *p)
{
    Player_TransitionCancelFlyingAndBoost(p);
    p->moveState &= ~MOVESTATE_4;
    p->moveState |= MOVESTATE_IGNORE_INPUT;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    PLAYERFN_SET_AND_CALL(PlayerCB_8027D3C, p);
}

void PlayerCB_Nop(Player *p) { }

void sub_802A500(Player *p) { sub_802A500_inline(p); }

void sub_802A52C(Player *p) { PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(p); }

void sub_802A558(Player *p) { PLAYERFN_UPDATE_AIR_FALL_SPEED_B(p); }

void sub_802A58C(Player *p)
{
    if (p->charState != 20) {
        if (p->timerInvulnerability > 0)
            p->timerInvulnerability--;
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

    if (p->charState == 7 || p->charState == 8) {
        p->charState = 6;
    } else {
        p->charState = 5;
    }

    p->unk90->s.frameFlags &= ~(MOVESTATE_4000);

    p->speedGroundX = 0;
    p->moveState ^= MOVESTATE_FACING_LEFT;

    PLAYERFN_SET_AND_CALL(PlayerCB_8025548, p);
}

void PlayerCB_802A620(Player *p)
{
    p->moveState &= ~MOVESTATE_20;

    p->unk90->s.frameFlags &= ~(MOVESTATE_4000);

    p->charState = 1;

    p->speedGroundX = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_802569C, p);
}

void sub_802A660(Player *p)
{
    if (p->unk2A == 0) {
        if ((p->heldInput & DPAD_SIDEWAYS) != DPAD_RIGHT) {
            if ((p->heldInput & DPAD_SIDEWAYS) == DPAD_LEFT) {
                s32 grnd = p->speedGroundX;
                if (grnd <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                } else if ((grnd - Q(0.09375)) < 0) {
                    s32 val = Q(0.375);
                    p->speedGroundX = -val;
                } else {
                    p->speedGroundX = (grnd - Q(0.09375));
                }
            }
        } else {
            s32 grnd = p->speedGroundX;
            if (grnd >= 0) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if ((grnd + Q(0.09375)) > 0) {
                p->speedGroundX = +Q(0.375);
            } else {
                p->speedGroundX = (grnd + Q(0.09375));
            }
        }
    }
}

void sub_802A6C0(Player *p)
{
    p->unk90->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->unk90->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    p->layer = 0x1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
    m4aSongNumStop(SE_GRINDING);
}

void Player_InitAttack(Player *p)
{
    switch (p->character) {
        case CHARACTER_SONIC: {
            Player_InitAttack_Sonic(p);
        } break;

        case CHARACTER_CREAM: {
            if (!p->isBoosting) {
                Player_InitAttack_Cream_ChaoAttack(p);
            } else {
                Player_InitAttack_Cream_StepAttack(p);
            }
        } break;

        case CHARACTER_TAILS: {
            Player_InitAttack_Tails(p);
        } break;

        case CHARACTER_KNUCKLES: {
            if (!p->isBoosting) {
                Player_InitAttack_Knuckles_Punch(p);
            } else {
                Player_InitAttack_Knuckles_SpiralAttack(p);
            }
        } break;

        case CHARACTER_AMY: {
            if (!p->isBoosting) {
                Player_InitAttack_Amy_HammerAttack(p);
            } else {
                // Same effect as Sonic's "Super Skid" (Boost + B_BUTTON)
                Player_InitAttack_Sonic(p);
            }
        } break;
    }
}
