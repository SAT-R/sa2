#ifndef GUARD_PLAYER_CB_COMMANDS_H
#define GUARD_PLAYER_CB_COMMANDS_H

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)
#define GET_ROTATED_ACCEL_3(angle) ((SIN_24_8((angle)*4) * 60))

#define PLAYER_AIR_SPEED_MAX Q_24_8(15.0)

#define GET_CHARACTER_ANIM(player)                                                      \
    (player->unk68 - gPlayerCharacterIdleAnims[player->character])

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
        player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);               \
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

#define PLAYERFN_MAYBE_INCREMENT_LIVES(player, incVal)                                  \
    {                                                                                   \
        s32 divResA, divResB;                                                           \
        s32 old_3005450 = gUnknown_03005450;                                            \
        gUnknown_03005450 += incVal;                                                    \
                                                                                        \
        divResA = Div(gUnknown_03005450, 50000);                                        \
        divResB = Div(old_3005450, 50000);                                              \
                                                                                        \
        if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {           \
            u16 lives = divResA - divResB;                                              \
            lives += gNumLives;                                                         \
                                                                                        \
            gNumLives = ({                                                              \
                if (lives > 255)                                                        \
                    lives = 255;                                                        \
                lives;                                                                  \
            });                                                                         \
                                                                                        \
            gUnknown_030054A8.unk3 = 16;                                                \
        }                                                                               \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERFN_MAYBE_TRANSITION_TO_GROUND(player)                                     \
    {                                                                                   \
        sub_8022190(player);                                                            \
        PLAYERFN_MAYBE_TRANSITION_TO_GROUND_BASE(player);                               \
    }

#define PLAYERFN_UPDATE_AIR_FALL_SPEED(player)                                          \
    if (player->moveState & MOVESTATE_40) {                                             \
        player->speedAirY += Q_24_8(12.0 / 256.0);                                      \
    } else {                                                                            \
        player->speedAirY += Q_24_8(42.0 / 256.0);                                      \
    }

// TODO: Match this without ASM!
#define PLAYERFN_UPDATE_AIR_FALL_SPEED_B(player)                                        \
    {                                                                                   \
        s16 speed = (player->moveState & MOVESTATE_40) ? Q_8_8(12.0 / 256.0)            \
                                                       : Q_8_8(42.0 / 256.0);           \
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

#endif // GUARD_PLAYER_CB_COMMANDS_H