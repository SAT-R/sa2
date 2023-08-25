#ifndef GUARD_PLAYER_CB_COMMANDS_H
#define GUARD_PLAYER_CB_COMMANDS_H

#include "game/parameters/characters.h"

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)
#define GET_ROTATED_ACCEL_3(angle) ((SIN_24_8((angle)*4) * 60))

#define GET_CHARACTER_ANIM(player)                                                      \
    (player->anim - gPlayerCharacterIdleAnims[player->character])

#define PLAYERFN_SET(proc)          gPlayer.callback = proc;
#define PLAYERFN_CALL(proc, player) proc(player);
#define PLAYERFN_SET_AND_CALL(proc, player)                                             \
    {                                                                                   \
        PLAYERFN_SET(proc);                                                             \
        PLAYERFN_CALL(proc, player);                                                    \
    }

#define PLAYERFN_UPDATE_UNK2A(player)                                                   \
    {                                                                                   \
        if (player->unk2A) {                                                            \
            player->unk2A -= 1;                                                         \
        } else if ((player->rotation + 32) & 0xC0) {                                    \
            s32 absGroundSpeed = ABS(player->speedGroundX);                             \
            if (absGroundSpeed < Q_24_8(1.875)) {                                       \
                player->speedGroundX = 0;                                               \
                                                                                        \
                player->moveState |= MOVESTATE_IN_AIR;                                  \
                player->unk2A = GBA_FRAMES_PER_SECOND / 2;                              \
            }                                                                           \
        }                                                                               \
    }

#define PLAYERFN_UPDATE_ROTATION(player)                                                \
    {                                                                                   \
        s32 rot = (s8)player->rotation;                                                 \
        if (rot < 0) {                                                                  \
            rot = MIN((rot + 2), 0);                                                    \
        } else if (rot > 0) {                                                           \
            rot = MAX((rot - 2), 0);                                                    \
        }                                                                               \
        player->rotation = rot;                                                         \
    }

#define PLAYERFN_UPDATE_POSITION(player)                                                \
    {                                                                                   \
        player->x += player->speedAirX;                                                 \
                                                                                        \
        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {  \
            player->speedAirY = -player->speedAirY;                                     \
        }                                                                               \
                                                                                        \
        player->speedAirY = MIN(player->speedAirY, Q_24_8(PLAYER_AIR_SPEED_MAX));       \
                                                                                        \
        player->y = GRAVITY_IS_INVERTED ? player->y - player->speedAirY                 \
                                        : player->y + player->speedAirY;                \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player)                                \
    if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {        \
        gPlayer.callback = PlayerCB_8025318;                                            \
                                                                                        \
        player->speedGroundX = player->speedAirX;                                       \
        player->rotation = 0;                                                           \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND(player)                                     \
    {                                                                                   \
        sub_8022190(player);                                                            \
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player);                               \
    }

#define PLAYERFN_UPDATE_AIR_FALL_SPEED(player)                                          \
    if (player->moveState & MOVESTATE_40) {                                             \
        player->speedAirY += Q_24_8(PLAYER_GRAVITY_UNDER_WATER);                        \
    } else {                                                                            \
        player->speedAirY += Q_24_8(PLAYER_GRAVITY);                                    \
    }

// TODO: Match this without ASM!
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                        \
    {                                                                                   \
        s16 speed = (player->moveState & MOVESTATE_40)                                  \
            ? Q_8_8(PLAYER_GRAVITY_UNDER_WATER)                                         \
            : Q_8_8(PLAYER_GRAVITY);                                                    \
                                                                                        \
        if (player->speedAirY < 0) {                                                    \
            asm("lsl r0, %0, #16\n"                                                     \
                "\tasr r0, r0, #17\n"                                                   \
                "\tlsl r0, r0, #16\n"                                                   \
                "\tlsr %0, r0, #16\n"                                                   \
                : "=r"(speed)                                                           \
                : "r"(speed)                                                            \
                : "r0");                                                                \
        }                                                                               \
                                                                                        \
        player->speedAirY += speed;                                                     \
    }

#define PLAYERFN_SET_SHIFT_OFFSETS(player, x, y)                                        \
    {                                                                                   \
        player->unk16 = x;                                                              \
        player->unk17 = y;                                                              \
    }
#define PLAYERFN_CHANGE_SHIFT_OFFSETS(player, x, y)                                     \
    {                                                                                   \
        sub_8023B5C(player, y);                                                         \
        PLAYERFN_SET_SHIFT_OFFSETS(player, x, y)                                        \
    }

#define PLAYERFN_SET_ANIM_SPEED(_p, _s)                                                 \
    {                                                                                   \
        s32 speed = _p->speedGroundX;                                                   \
        speed = (speed >> 5) + (speed >> 6);                                            \
                                                                                        \
        /* TODO: Try ABS macro */                                                       \
        speed = ABS(speed);                                                             \
                                                                                        \
        if (speed >= SPRITE_ANIM_SPEED(0.5)) {                                          \
            if (speed > SPRITE_ANIM_SPEED(8.0)) {                                       \
                speed = SPRITE_ANIM_SPEED(8.0);                                         \
            }                                                                           \
        } else {                                                                        \
            speed = SPRITE_ANIM_SPEED(0.5);                                             \
        }                                                                               \
        _s->animSpeed = speed;                                                          \
    }
#endif // GUARD_PLAYER_CB_COMMANDS_H