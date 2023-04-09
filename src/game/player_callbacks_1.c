#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"
#include "game/game.h"

#include "game/boost_effect.h" // incl. CreateBoostModeParticles
#include "game/time_attack/results.h" // for PlayerCB_80278D4

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

extern void sub_8011B88(s32, s32, u32);
extern void PlayerCB_8011F1C(Player *);
extern void sub_8012194(Player *);
extern void sub_8012BC0(Player *);
extern bool32 sub_801251C(Player *);
extern void sub_8012644(Player *);
extern void sub_8012888(Player *);
extern void sub_80128E0(Player *);
extern void sub_8013AD8(Player *);
extern void PlayerCB_8013D18(Player *);
extern void sub_801583C(void);
extern void sub_8015BD4(u16);
extern void sub_801F488(void);

void PlayerCB_Idle(Player *);
void sub_8022190(Player *);
void sub_8022218(Player *);
void sub_8022284(Player *);
void sub_8022D6C(Player *);
void sub_8023128(Player *);
void sub_80231C0(Player *);
void sub_8023260(Player *);
void sub_80232D0(Player *);
void sub_8023610(Player *);
void sub_80236C8(Player *);
void sub_8023708(Player *);
void sub_80246DC(Player *);
void PlayerCB_8025AB8(Player *);
void PlayerCB_8025E18(Player *);
void sub_8025F84(Player *);
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
void sub_802A360(Player *);
void PlayerCB_802A3B8(Player *);
void PlayerCB_802A3C4(Player *);
void PlayerCB_802A3F0(Player *);
void sub_802A40C(Player *);
void sub_802A468(Player *);
void sub_802A4B8(Player *);
void PlayerCB_802A4FC(Player *);
void PlayerCB_802A5C4(Player *);

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)

#define PLAYER_AIR_SPEED_MAX Q_24_8(15.0)

#define GET_CHARACTER_ANIM(player)                                                      \
    (player->unk68 - PlayerCharacterIdleAnims[player->character])

#define PLAYERCB_UPDATE_UNK2A(player)                                                   \
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

#define PLAYERCB_UPDATE_ROTATION(player)                                                \
    {                                                                                   \
        s32 rot = (s8)player->rotation;                                                 \
        if (rot < 0) {                                                                  \
            rot = MIN((rot + 2), 0);                                                    \
        } else if (rot > 0) {                                                           \
            rot = MAX((rot - 2), 0);                                                    \
        }                                                                               \
        player->rotation = rot;                                                         \
    }

#define PLAYERCB_UPDATE_POSITION(player)                                                \
    {                                                                                   \
        player->x += player->speedAirX;                                                 \
                                                                                        \
        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {  \
            player->speedAirY = -player->speedAirY;                                     \
        }                                                                               \
                                                                                        \
        player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);               \
                                                                                        \
        player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)                 \
            ? player->y - player->speedAirY                                             \
            : player->y + player->speedAirY;                                            \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERCB_MAYBE_TRANSITION_TO_GROUND_BASE(player)                                \
    if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {        \
        gPlayer.callback = PlayerCB_8025318;                                            \
                                                                                        \
        player->speedGroundX = player->speedAirX;                                       \
        player->rotation = 0;                                                           \
    }

#define PLAYERCB_MAYBE_INCREMENT_LIVES(player, incVal)                                  \
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
            gUnknown_030054A8[3] = 16;                                                  \
        }                                                                               \
    }

// TODO(Jace): This name is speculative right now, check for accuracy!
#define PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player)                                     \
    {                                                                                   \
        sub_8022190(player);                                                            \
        PLAYERCB_MAYBE_TRANSITION_TO_GROUND_BASE(player);                               \
    }

#define PLAYERCB_UPDATE_AIR_FALL_SPEED(player)                                          \
    if (player->moveState & MOVESTATE_40) {                                             \
        player->speedAirY += Q_24_8(12.0 / 256.0);                                      \
    } else {                                                                            \
        player->speedAirY += Q_24_8(42.0 / 256.0);                                      \
    }

// TODO: Match this without ASM!
#define PLAYERCB_UPDATE_AIR_FALL_SPEED_B(player)                                        \
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

static const s16 gUnknown_080D6916[5] = { 0x800, 0x7F8, 0x690, 0x5A0, 0x438 };

// TODO: static
const s16 sSpinDashSpeeds[9] = {
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

// TODO: static
const u16 gUnknown_080D6932[4] = { 100, 100, 100, 100 };

void PlayerCB_8025318(Player *player)
{
    u32 mask;
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if ((player->moveState & MOVESTATE_IN_AIR)) {
            sub_8025F84(player);
            return;
        }
    }

    mask = (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR);
    if ((player->moveState & mask) == MOVESTATE_800) {
        sub_802A360(player);
    } else {
        sub_80218E4(player);

        player->moveState &= ~(MOVESTATE_4 | MOVESTATE_IN_AIR);

        sub_8023B5C(player, 14);
        player->unk16 = 6;
        player->unk17 = 14;

        if (player->speedGroundX) {
            player->unk64 = 9;
        } else {
            player->unk64 = 0;
        }

        gPlayer.callback = PlayerCB_Idle;
        PlayerCB_Idle(player);
    }
}

void PlayerCB_Idle(Player *player)
{
    if ((player->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_8000000) {
        PlayerCB_80273D0(player);
    } else if ((player->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
               == MOVESTATE_800) {
        sub_802A360(player);
    } else if (!sub_802A0C8(player) && !sub_802A0FC(player) && !sub_8029E6C(player)
               && !sub_802A2A8(player)) {
        sub_802966C(player);

        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(player->rotation);

            if (player->speedGroundX != 0) {
                player->speedGroundX += acceleration;
            }
        }

        sub_80232D0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);

        if (player->moveState & MOVESTATE_8000) {
            player->moveState &= ~MOVESTATE_IN_AIR;
        } else if (player->moveState & MOVESTATE_IN_AIR) {
            gPlayer.callback = PlayerCB_8025E18;
        }
    }
}

void PlayerCB_8025548(Player *player)
{
    if (!sub_802A0FC(player) && !sub_8029E6C(player)
        && ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            || !sub_802A2A8(player))) {
        if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
            gPlayer.callback = PlayerCB_8025318;
        }

        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(player->rotation);

            if (player->speedGroundX != 0)
                player->speedGroundX += acceleration;
        }

        sub_80232D0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);

        if (player->moveState & MOVESTATE_IN_AIR) {
            gPlayer.callback = PlayerCB_8025E18;
        }
    }
}

void PlayerCB_802569C(Player *player)
{
    Sprite *s = &player->unk90->s;
    u16 characterAnim = GET_CHARACTER_ANIM(player);

    if (!sub_802A0FC(player) && !sub_8029E6C(player) && !sub_802A2A8(player)) {
        u16 dpad = (player->unk5C & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (player->unk6A == 0)) {
                player->unk6A = 1;
                player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
            }
        } else if (dpad != DPAD_UP) {
            gPlayer.callback = PlayerCB_8025318;
        }

        if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (player->unk6A == 1)
            && (s->unk10 & 0x4000)) {
            gPlayer.callback = PlayerCB_8025318;
        }

        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(player->rotation);

            if (player->speedGroundX != 0)
                player->speedGroundX += acceleration;
        }

        sub_80232D0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);

        if (player->moveState & MOVESTATE_IN_AIR) {
            gPlayer.callback = PlayerCB_8025E18;
        }
    }
}

void PlayerCB_8025854(Player *player)
{
    Sprite *s = &player->unk90->s;
    u16 characterAnim = GET_CHARACTER_ANIM(player);

    if (!sub_802A184(player) && !sub_8029E6C(player) && !sub_802A2A8(player)) {
        u16 dpad = (player->unk5C & DPAD_ANY);
        if (dpad == 0) {
            if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (player->unk6A == 0)) {
                player->unk6A = 1;
                player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
            }
        } else if (dpad != DPAD_DOWN) {
            gPlayer.callback = PlayerCB_8025318;
        }

        if ((characterAnim == SA2_CHAR_ANIM_CROUCH) && (player->unk6A == 1)
            && (s->unk10 & 0x4000)) {
            gPlayer.callback = PlayerCB_8025318;
        }

        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(player->rotation);

            if (player->speedGroundX != 0)
                player->speedGroundX += acceleration;
        }

        sub_80232D0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);

        if (player->moveState & MOVESTATE_IN_AIR) {
            gPlayer.callback = PlayerCB_8025E18;
        }
    }
}

void PlayerCB_8025A0C(Player *player)
{
    u32 mask;
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if ((player->moveState & MOVESTATE_IN_AIR)) {
            sub_8025F84(player);
            return;
        }
    }

    if ((player->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_800) {
        sub_802A360(player);
    } else {
        player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
        player->unk64 = 4;

        sub_8023B5C(player, 9);

        player->unk16 = 6;
        player->unk17 = 9;

        player->moveState |= MOVESTATE_4;
        player->unk99 = 0;
        gPlayer.callback = PlayerCB_8025AB8;
        PlayerCB_8025AB8(player);
    }
}

void PlayerCB_8025AB8(Player *player)
{
    if ((player->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_8000000) {
        PlayerCB_80273D0(player);
    } else if ((player->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
               == MOVESTATE_800) {
        sub_802A360(player);
    } else {
        if (player->unk99 != 0) {
            player->unk99--;
        } else if (!sub_8029E6C(player)) {
            if (player->unk2A == 0) {
                u16 dpadSideways = (player->unk5C & (DPAD_LEFT | DPAD_RIGHT));
                if (dpadSideways != DPAD_RIGHT) {
                    if (dpadSideways == DPAD_LEFT) {
                        s32 val = player->speedGroundX;
                        if (val <= 0) {
                            player->moveState |= MOVESTATE_FACING_LEFT;
                        } else if ((val - Q_24_8(0.09375)) < 0) {
                            s32 deceleration = -Q_24_8(0.375);
                            player->speedGroundX = deceleration;
                        } else {
                            player->speedGroundX = (val - Q_24_8(0.09375));
                        }
                    }
                } else {
                    s32 val = player->speedGroundX;
                    if (val >= 0) {
                        player->moveState &= ~MOVESTATE_FACING_LEFT;
                    } else if ((val + Q_24_8(0.09375)) > 0) {
                        player->speedGroundX = Q_24_8(0.375);
                    } else {
                        player->speedGroundX = (val + Q_24_8(0.09375));
                    }
                }
            }
        } else {
            return;
        }

        if (player->speedGroundX > 0) {
            player->unk50 = 8;
        } else if (player->speedGroundX < 0) {
            player->unk50 = -8;
        } else {
            player->unk50 = 0;
        }

        player->speedGroundX -= player->unk50;

        if ((player->speedGroundX > -Q_24_8(0.5))
            && (player->speedGroundX < Q_24_8(0.5))) {
            player->unk50 = 0;
            player->speedGroundX = 0;
        }

        if (player->speedGroundX == 0) {
            gPlayer.callback = PlayerCB_8025318;
            PlayerCB_8025318(player);
        } else {
            s32 speedX = player->speedGroundX;

            if ((((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) && (speedX != 0)) {
                u32 sinVal = SIN_24_8((player->rotation) * 4) * 60;
                s32 sinInt = (s32)(Q_24_8_TO_INT((s32)sinVal));

                if (speedX > 0) {
                    if (sinInt <= 0) {
                        sinInt >>= 2;
                    }
                } else if (sinInt >= 0) {
                    sinInt >>= 2;
                }

                speedX += sinInt;

                player->speedGroundX = speedX;
            }

            sub_80232D0(player);
            sub_8023260(player);
            sub_8023128(player);

            if (player->moveState & MOVESTATE_IN_AIR) {
                PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
            }

            PLAYERCB_UPDATE_POSITION(player);

            sub_8022D6C(player);

            PLAYERCB_UPDATE_UNK2A(player);

            if (player->moveState & MOVESTATE_IN_AIR) {
                gPlayer.callback = PlayerCB_8025E18;
            }
        }
    }
}

void PlayerCB_8025D00(Player *player)
{
    u8 rot;
    s32 mulVal;
    s32 accelX, accelY;

    sub_80218E4(player);

    player->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if (player->moveState & MOVESTATE_4) {
        player->moveState |= MOVESTATE_10;
    }

    if (ABS(player->speedAirX) < Q_24_8(1.25)) {
        player->unk64 = 10;
    } else {
        player->unk64 = 11;
    }

    player->unk70 = 1;

    mulVal = (player->moveState & MOVESTATE_40) ? Q_24_8(2.625) : Q_24_8(4.875);

    rot = player->rotation - 0x40;

    accelX = Q_24_8_TO_INT(COS_24_8((u8)rot * 4) * mulVal);
    player->speedAirX += accelX;

    accelY = Q_24_8_TO_INT(SIN_24_8((u8)rot * 4) * mulVal);
    player->speedAirY += accelY;

    if (player->moveState & MOVESTATE_8) {
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            player->speedAirX -= Q_24_8(gCamera.unk38);
        }
    }

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    m4aSongNumStart(SE_JUMP);

    gPlayer.callback = PlayerCB_8025E18;
    PlayerCB_8025E18(player);
}

void PlayerCB_8025E18(Player *player)
{
    s16 temp = -Q_24_8(3.0);

    if (player->moveState & MOVESTATE_40) {
        temp = -Q_24_8(1.5);
    }

    if (player->moveState & MOVESTATE_100) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            if (sub_801251C(player) || sub_80294F4(player))
                return;

        if ((player->speedAirY < temp)
            && ((player->unk5C & gPlayerControls.jump) == 0)) {
            player->speedAirY = temp;
        }
    }

    sub_80246DC(player);
    sub_8023610(player);

    if (!IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80236C8(player);
    }

    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void sub_8025F84(Player *player)
{
    sub_80218E4(player);

    player->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((player->unk16 < 6) || (player->unk17 < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(player);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1)
            || (chAnim == SA2_CHAR_ANIM_JUMP_2) || (chAnim == SA2_CHAR_ANIM_70)) {
            sub_8023B5C(player, 9);
            player->unk16 = 6;
            player->unk17 = 9;
        } else {
            sub_8023B5C(player, 14);
            player->unk16 = 6;
            player->unk17 = 14;
        }
    }

    if (ABS(player->speedAirX) < Q_24_8(1.25)) {
        player->unk64 = 10;
    } else {
        player->unk64 = 11;
    }

    player->unk70 = 1;

    player->unk90->s.unk10 &= ~MOVESTATE_4000;
    m4aSongNumStart(SE_JUMP);

    gPlayer.callback = PlayerCB_8025E18;
    PlayerCB_8025E18(player);
}

void PlayerCB_8026060(Player *player)
{
    sub_80218E4(player);

    player->moveState |= (MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((player->unk16 < 6) || (player->unk17 < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(player);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1)
            || (chAnim == SA2_CHAR_ANIM_JUMP_2) || (chAnim == SA2_CHAR_ANIM_70)) {
            sub_8023B5C(player, 9);
            player->unk16 = 6;
            player->unk17 = 9;
        } else {
            sub_8023B5C(player, 14);
            player->unk16 = 6;
            player->unk17 = 14;
        }
    }

    player->unk70 = 1;
    player->unk6E = 1;

    player->unk90->s.unk10 &= ~MOVESTATE_4000;

    player->rotation = 0;

    gPlayer.callback = PlayerCB_80261D8;
    PlayerCB_80261D8(player);
}

void PlayerCB_802611C(Player *player)
{
    sub_80218E4(player);

    player->moveState |= (MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((player->unk16 < 6) || (player->unk17 < 9)) {
        u16 chAnim = GET_CHARACTER_ANIM(player);

        if ((chAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (chAnim == SA2_CHAR_ANIM_JUMP_1)
            || (chAnim == SA2_CHAR_ANIM_JUMP_2) || (chAnim == SA2_CHAR_ANIM_70)) {
            sub_8023B5C(player, 9);
            player->unk16 = 6;
            player->unk17 = 9;
        } else {
            sub_8023B5C(player, 14);
            player->unk16 = 6;
            player->unk17 = 14;
        }
    }

    player->unk70 = 1;
    player->unk6E = 0;

    player->unk90->s.unk10 &= ~MOVESTATE_4000;

    player->rotation = 0;

    gPlayer.callback = PlayerCB_80261D8;
    PlayerCB_80261D8(player);
}

void PlayerCB_80261D8(Player *player)
{
    sub_80246DC(player);

    if ((player->unk6E != 1) || (player->speedAirY > 0)) {
        sub_8023610(player);

        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            && (player->moveState & MOVESTATE_100)) {
            if (sub_801251C(player) || sub_80294F4(player))
                return;
        }
    }

    if (!IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80236C8(player);
    }

    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void PlayerCB_802631C(Player *player)
{
    player->unk64 = 3;

    player->moveState |= (MOVESTATE_400 | MOVESTATE_4);
    player->moveState &= ~(MOVESTATE_20 | MOVESTATE_IN_AIR);

    sub_8023B5C(player, 9);

    player->unk16 = 6;
    player->unk17 = 9;
    player->unk26 = 0;
    player->speedAirX = 0;
    player->speedAirY = 0;
    player->speedGroundX = 0;

    m4aSongNumStart(SE_SPIN_ATTACK);
    sub_801F7DC();

    gPlayer.callback = PlayerCB_Spindash;
    PlayerCB_Spindash(player);
}

// https://decomp.me/scratch/jIJLs
NONMATCH("asm/non_matching/PlayerCB_Spindash.inc",
         void PlayerCB_Spindash(Player *player))
{
    Sprite *s = &player->unk90->s;
    u16 cAnim = GET_CHARACTER_ANIM(player);

    if (!(player->unk5C & DPAD_DOWN)) {
        s16 index;
        s32 speed;
        player->moveState &= ~MOVESTATE_400;

        index = Q_24_8_TO_INT(player->unk26);
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
        s16 pitch = player->unk26;
        if (pitch != 0) {
            pitch = pitch - (Q_24_8_TO_INT(pitch << 3));
            if (pitch <= 0)
                pitch = 0;
        }
        // _08026420
        if (player->unk5E & gPlayerControls.jump) {
            struct MusicPlayerInfo *mPlayerInfo;
            m4aSongNumStart(SE_SPIN_ATTACK);

            mPlayerInfo = gMPlayTable[gSongTable[SE_SPIN_ATTACK].ms].info;
            m4aMPlayImmInit(mPlayerInfo);
            m4aMPlayPitchControl(mPlayerInfo, 0xFFFF, (pitch & ~0x7F));

            pitch += Q_24_8(2.0);

            if (pitch < Q_24_8(8.0))
                pitch += Q_24_8(8.0);

            player->unk6A = 1;
            player->unk6C = 1;
        }
        // _08026490
        player->unk26 = pitch;

        if ((cAnim == SA2_CHAR_ANIM_SPIN_DASH) && (player->unk6A == 1)
            && (s->unk10 & SPRITE_FLAG_MASK_14)) {
            player->unk6A = 0;
        }
    }
    // _080264B2
    if (player->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(player);
        sub_80232D0(player);

        PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
        PLAYERCB_UPDATE_POSITION(player);
        PLAYERCB_UPDATE_ROTATION(player);
        PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
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

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);
    }
}
END_NONMATCH

extern s32 sub_801E6D4(s32, s32, s32, s32, s32, s32 (*)(s32, s32, s32, s32));
extern s32 sub_801EE64(s32, s32, s32, s32);

void sub_802669C(Player *player)
{
    s32 newY;
    player->unk38 = 0;
    player->rotation = 0;

    player->unk90->s.unk10 &= ~(MOVESTATE_2000 | MOVESTATE_1000);
    player->unk90->s.unk10 |= MOVESTATE_1000;

    player->unk37 |= 0x80;

    if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
        newY = sub_801E6D4(Q_24_8_TO_INT(player->y) - player->unk17,
                           Q_24_8_TO_INT(player->x), player->unk38, -8, 0, sub_801EE64);

        newY = player->y - Q_24_8(newY);
    } else {
        newY = sub_801E6D4(Q_24_8_TO_INT(player->y) + player->unk17,
                           Q_24_8_TO_INT(player->x), player->unk38, 8, 0, sub_801EE64);

        newY = player->y + Q_24_8(newY);
    }
    player->y = newY;
    player->moveState &= ~MOVESTATE_IN_AIR;

    gPlayer.moveState |= MOVESTATE_IN_SCRIPTED;
}

void PlayerCB_8026764(Player *player)
{
    sub_80218E4(player);

    player->moveState &= ~MOVESTATE_4;
    player->moveState |= MOVESTATE_1000000;

    sub_8023B5C(player, 14);

    player->unk16 = 6;
    player->unk17 = 14;
    player->unk64 = 41;

    if (player->unk6E != 0) {
        player->moveState |= MOVESTATE_FACING_LEFT;

        player->speedAirX = MIN(player->speedAirX, -Q_24_8(1.0));
        player->speedGroundX = MIN(player->speedAirX, -Q_24_8(1.0));
    } else {
        player->moveState &= ~MOVESTATE_FACING_LEFT;

        player->speedAirX = MAX(player->speedAirX, Q_24_8(1.0));
        player->speedGroundX = MAX(player->speedAirX, Q_24_8(1.0));
    }

    sub_802669C(player);
    m4aSongNumStart(SE_GRINDING);

    gPlayer.callback = PlayerCB_8026810;
    PlayerCB_8026810(player);
}

void PlayerCB_8026810(Player *player)
{
    if (sub_8029E6C(player)) {
        player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        player->unk90->s.unk10 |= SPRITE_FLAG_PRIORITY(2);

        player->unk37 &= ~0x80;
        player->unk38 = 1;

        gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
        m4aSongNumStop(SE_GRINDING);
    } else {
        if (player->speedGroundX >= 0) {
            player->moveState &= ~MOVESTATE_FACING_LEFT;
        } else {
            player->moveState |= MOVESTATE_FACING_LEFT;
        }

        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0)
            player->speedGroundX += GET_ROTATED_ACCEL_2(player->rotation);

        sub_80232D0(player);
        sub_8023260(player);

        if (player->moveState & MOVESTATE_IN_AIR) {
            PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
        }

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        m4aSongNumStartOrContinue(SE_GRINDING);

        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 14;
            player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
            player->unk90->s.unk10 |= SPRITE_FLAG_PRIORITY(2);
            player->unk37 &= ~0x80;
            player->unk38 = 1;

            gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;
            m4aSongNumStop(SE_GRINDING);
            gPlayer.callback = PlayerCB_8025E18;
        } else {
            if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
                sub_801F488();
            }
        }
    }
}

void PlayerCB_80269C0(Player *player)
{
    sub_80218E4(player);

    player->moveState &= ~MOVESTATE_4;
    player->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->unk64 = 9;

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    player->unk90->s.unk10 |= SPRITE_FLAG_PRIORITY(2);

    player->unk37 &= ~0x80;
    player->unk38 = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);
    gPlayer.callback = PlayerCB_Idle;
    PlayerCB_Idle(player);
}

void PlayerCB_8026A4C(Player *player)
{
    sub_80218E4(player);

    player->moveState &= ~MOVESTATE_4;
    player->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
        && (player->unk5C & gPlayerControls.jump)
        && (player->character == CHARACTER_SONIC
            || player->character == CHARACTER_AMY)) {
        player->unk64 = 42;
        player->speedAirY = -Q_24_8(7.5);
    } else {
        player->unk64 = 39;
        player->speedAirY = -Q_24_8(4.875);
    }

    if (player->moveState & MOVESTATE_40)
        player->speedAirY /= 2;

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    player->unk90->s.unk10 |= SPRITE_FLAG_PRIORITY(2);

    player->unk37 &= ~0x80;
    player->unk38 = 1;

    gPlayer.moveState &= ~MOVESTATE_IN_SCRIPTED;

    m4aSongNumStop(SE_GRINDING);

    if (player->speedAirX > 0) {
        player->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    if (player->speedAirX < 0) {
        player->moveState |= MOVESTATE_FACING_LEFT;
    }

    m4aSongNumStart(SE_JUMP);
    gPlayer.callback = PlayerCB_8029074;
    PlayerCB_8029074(player);
}

void sub_8026B64(Player *player)
{
    s16 groundSpeed = player->speedGroundX;

    if ((player->unk2A == 0) && (player->unk5C & (DPAD_LEFT | DPAD_RIGHT))) {
        if ((player->unk5C & DPAD_RIGHT) && (groundSpeed < player->unk44)) {
            groundSpeed += Q_24_8(1.0 / 32.0);
        } else if ((player->unk5C & DPAD_LEFT) && (groundSpeed > Q_24_8(1.0))) {
            groundSpeed -= Q_24_8(1.0 / 32.0);
        }
    }

    if (groundSpeed < Q_24_8(1.0)) {
        groundSpeed += Q_24_8(1.0 / 32.0);
    }

    player->speedGroundX = groundSpeed;
}

void PlayerCB_8026BCC(Player *player)
{
    if (!sub_8029E6C(player)) {
        sub_8026B64(player);
        sub_8023128(player);

        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 accel = GET_ROTATED_ACCEL(player->rotation);
            if (player->speedGroundX)
                player->speedGroundX += accel;
        }

        sub_80232D0(player);
        sub_8023260(player);

        if (player->moveState & MOVESTATE_IN_AIR) {
            PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
        }

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);

        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 14;

            gPlayer.callback = PlayerCB_8025E18;
        } else if ((player->moveState & (MOVESTATE_800 | MOVESTATE_8))
                   != MOVESTATE_800) {
            gPlayer.callback = PlayerCB_8025318;
        }
    }
}

void PlayerCB_8026D2C(Player *player)
{
    sub_80246DC(player);
    sub_8023610(player);
    sub_80236C8(player);
    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);

    if (player->speedAirY >= 0) {
        sub_8022218(player);
        sub_8022284(player);
    } else {
        sub_8022284(player);
        sub_8022218(player);
    }

    PLAYERCB_MAYBE_TRANSITION_TO_GROUND_BASE(player);
}

void PlayerCB_8026E24(Player *player)
{
    sub_80218E4(player);

    player->moveState |= (MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_4);

    sub_8023B5C(player, 9);

    player->unk16 = 6;
    player->unk17 = 9;
    player->rotation = 0;
    player->unk64 = 4;

    player->moveState &= ~MOVESTATE_FACING_LEFT;

    switch (player->unk6E & 0x30) {
        case 0x00: {
            player->moveState |= MOVESTATE_IN_AIR;
            player->speedAirX = 0;
            player->speedAirY = -Q_24_8(12.0);
            player->speedGroundX = Q_24_8(12.0);
        } break;

        case 0x10: {
            player->moveState |= MOVESTATE_IN_AIR;
            player->speedAirX = 0;
            player->speedAirY = Q_24_8(12.0);
            player->speedGroundX = Q_24_8(12.0);
        } break;

        case 0x20: {
            player->moveState &= ~MOVESTATE_IN_AIR;
            player->moveState |= MOVESTATE_FACING_LEFT;
            player->speedAirX = -Q_24_8(12.0);
            player->speedAirY = 0;
            player->speedGroundX = -Q_24_8(12.0);
        } break;

        case 0x30: {
            player->moveState &= ~MOVESTATE_IN_AIR;
            player->speedAirX = Q_24_8(12.0);
            player->speedAirY = 0;
            player->speedGroundX = Q_24_8(12.0);
        } break;
    }

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    player->unk90->s.unk10 |= SPRITE_FLAG_PRIORITY(1);
    player->unk38 = 0;

    m4aSongNumStart(SE_SPIN);

    gPlayer.callback = PlayerCB_802A3B8;
    PlayerCB_802A3B8(player);
}

void PlayerCB_8026F10(Player *player)
{
    if ((player->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR))
        == MOVESTATE_800) {
        sub_80218E4(player);
        player->moveState &= ~MOVESTATE_4;

        sub_8023B5C(player, 14);
        player->unk16 = 6;
        player->unk17 = 14;

        player->unk64 = 62;

        player->moveState &= ~MOVESTATE_FACING_LEFT;
        m4aSongNumStart(SE_ICE_PARADISE_SLIDE);

        gPlayer.callback = PlayerCB_8026BCC;
        PlayerCB_8026BCC(player);
    } else {
        //_08026F74
        player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
        player->unk64 = 4;

        sub_8023B5C(player, 9);

        player->unk16 = 6;
        player->unk17 = 9;

        player->moveState |= MOVESTATE_4;

        player->unk99 = 30;

        gPlayer.callback = PlayerCB_8025AB8;
        PlayerCB_8025AB8(player);
    }
}

void PlayerCB_8026FC8(Player *player)
{
    sub_80218E4(player);

    player->moveState &= ~MOVESTATE_4;

    sub_8023B5C(player, 14);

    player->unk16 = 6;
    player->unk17 = 14;

    if (player->unk5C & DPAD_LEFT) {
        player->moveState |= MOVESTATE_FACING_LEFT;
    }
    if (player->unk5C & DPAD_RIGHT) {
        player->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    player->unk64 = 63;
    player->rotation = 0;

    gPlayer.callback = PlayerCB_8027040;
    PlayerCB_8027040(player);
}

void PlayerCB_8027040(Player *player)
{
    if (player->moveState & MOVESTATE_FACING_LEFT) {
        player->rotation -= Q_24_8(4.0 / 256.0);
    } else {
        player->rotation += Q_24_8(4.0 / 256.0);
    }

    sub_8023610(player);
    sub_80236C8(player);
    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void PlayerCB_8027114(Player *player)
{
    sub_80218E4(player);

    if ((!(player->moveState & MOVESTATE_4) || (player->unk64 != 4))) {
        player->unk64 = 47;
        player->moveState &= ~MOVESTATE_4;

        sub_8023B5C(player, 14);
        player->unk16 = 6;
        player->unk17 = 14;
    }

    player->rotation = 0;

    if (player->speedAirX > 0) {
        player->moveState &= ~MOVESTATE_FACING_LEFT;
    } else {
        player->moveState |= MOVESTATE_FACING_LEFT;
    }

    gPlayer.callback = PlayerCB_8027190;
    PlayerCB_8027190(player);
}

void PlayerCB_8027190(Player *player)
{
    s32 u48 = player->unk48;
    s32 u40 = player->unk40;
    s16 speed = player->speedGroundX;

    if (player->unk5C & DPAD_LEFT) {
        speed -= u48;

        if (speed < -u40) {
            speed += u48;

            if (speed > -u40)
                speed = -u40;
        }
    } else if (player->unk5C & DPAD_RIGHT) {
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
    player->speedGroundX = speed;

    sub_80232D0(player);

    PLAYERCB_UPDATE_UNK2A(player);
}

void PlayerCB_8027250(Player *player)
{
    player->unk2C = 0x78;
    player->unk5A = 0;

    if (ABS(player->speedAirX) <= Q_24_8(2.5)) {
        if (player->speedAirX <= Q_24_8(0.625)) {
            if (player->speedAirX < -Q_24_8(0.625)) {
                player->speedAirX = +Q_24_8(1.5);
            } else {
                if ((player->moveState & MOVESTATE_FACING_LEFT)) {
                    player->speedAirX = +Q_24_8(1.5);
                } else {
                    player->speedAirX = -Q_24_8(1.5);
                }
            }
        } else {
            player->speedAirX = -Q_24_8(1.5);
        }
        player->unk64 = 0x14;
    } else {
        if (player->speedAirX >= 0) {
            player->speedAirX = +Q_24_8(1.5);
        } else {
            player->speedAirX = -Q_24_8(1.5);
        }
        player->unk64 = 0x15;
    }

    player->speedAirY = -Q_24_8(3.0);

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY >>= 1;
        player->speedAirX >>= 1;
    }

    sub_80218E4(player);

    player->moveState |= MOVESTATE_IN_AIR;
    player->moveState &= ~(MOVESTATE_200 | MOVESTATE_8 | MOVESTATE_4);

    sub_8023B5C(player, 14);

    player->unk16 = 6;
    player->unk17 = 14;

    gPlayer.callback = PlayerCB_8027324;
    PlayerCB_8027324(player);
}

void PlayerCB_8027324(Player *player)
{
    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void PlayerCB_80273D0(Player *player)
{
    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sub_802A4B8(player);
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_802A468(player);
    } else {
        if (gGameMode == GAME_MODE_TIME_ATTACK)
            gUnknown_030054F4 = 7;

        if ((gPlayer.moveState & MOVESTATE_8000000) && (gUnknown_030054F4 > 6)) {
            sub_802A40C(player);
        } else {
            sub_80218E4(player);

            player->moveState &= ~(MOVESTATE_4 | MOVESTATE_FACING_LEFT);

            sub_8023B5C(player, 14);

            player->unk16 = 6;
            player->unk17 = 14;

            if (player->speedGroundX <= 0) {
                sub_802785C(player);
            } else {
                player->unk64 = 9;

                player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

                player->moveState &= ~MOVESTATE_IGNORE_INPUT;

                gPlayer.callback = PlayerCB_GoalSlowdown;
                PlayerCB_GoalSlowdown(player);
            }
        }
    }
}

void PlayerCB_GoalSlowdown(Player *player)
{
    u32 playerX = Q_24_8_TO_INT(player->x);
    u16 playerX2;

    playerX2 = playerX - gUnknown_030054D0;

    if (((player->speedGroundX >= Q_24_8(2.0)) && (player->unk5E & DPAD_LEFT))
        || (playerX2 > 0x579)) {
        player->unk64 = 25;

        player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

        m4aSongNumStart(SE_LONG_BRAKE);
        gPlayer.callback = PlayerCB_GoalBrake;
        PlayerCB_GoalBrake(player);
    } else {
        s32 grnd = player->speedGroundX;
        if (grnd > 0) {
            s32 speedOg = player->speedGroundX - Q_24_8(8.0 / 256.0);
            s16 speed = speedOg;
            if (speed <= 0)
                speed = 0;

            player->speedGroundX = speed;
        } else {
            player->speedGroundX = 0;
        }

        if (player->speedGroundX <= 0) {
            sub_802785C(player);
        } else {
            if (gCamera.shiftY > -56)
                gCamera.shiftY--;

            sub_80232D0(player);
            sub_8023260(player);

            PLAYERCB_UPDATE_POSITION(player);

            sub_8022D6C(player);

            PLAYERCB_UPDATE_UNK2A(player);
        }
    }
}

void PlayerCB_GoalBrake(Player *player)
{
    u16 cAnim = GET_CHARACTER_ANIM(player);

    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    if (cAnim == SA2_CHAR_ANIM_31) {
        if ((player->unk6A == 0) && (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14)) {
            player->unk64 = 26;
        }

        if ((player->unk6A == 1) && (player->speedGroundX <= 0)) {
            player->unk64 = 27;
            player->speedGroundX = 0;
            m4aSongNumStop(SE_LONG_BRAKE);

            if (gUnknown_030054D0 != 0) {
                u16 playerX = Q_24_8_TO_INT(player->x) - gUnknown_030054D0;
                s32 r8 = 0;

                if (playerX <= 730)
                    r8 = 800;
                else if (playerX <= 1114)
                    r8 = 500;
                else if (playerX <= 1401)
                    r8 = 100;

                if (r8 != 0) {
                    PLAYERCB_MAYBE_INCREMENT_LIVES(player, r8);

                    sub_801F3A4(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y), r8);
                }
            }
        }

        if ((player->unk6A == 2) && (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14)) {
            sub_802785C(player);
            return;
        }
    }

    player->speedGroundX -= Q_24_8(0.125);
    if (player->speedGroundX < 0)
        player->speedGroundX = 0;

    sub_8029FA4(player);
    sub_80232D0(player);
    sub_8023260(player);

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022D6C(player);

    PLAYERCB_UPDATE_UNK2A(player);
}

void sub_802785C(Player *player)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    player->unk72 = 90;

    if (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        switch (gCurrentLevel & 0x3) {
            case ACT_1: {
                player->unk64 = 28;
                gPlayer.callback = PlayerCB_80278D4;
            } break;

            case ACT_2: {
                player->unk64 = 29;
                gPlayer.callback = PlayerCB_80278D4;
            } break;

            case ACT_BOSS: {
                player->unk64 = 32;
            } break;
        }
    } else {
        player->unk64 = 28;
    }
}

void PlayerCB_80278D4(Player *player)
{
    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    if (--player->unk72 == 0) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResultsCutScene(gUnknown_03005490);
        } else {
            sub_80304DC(gUnknown_03005490, gRingCount, gUnknown_030054F4);
        }
        gPlayer.callback = PlayerCB_802A3F0;
    }

    sub_80232D0(player);
    sub_8023260(player);

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022D6C(player);

    PLAYERCB_UPDATE_UNK2A(player);
}

void PlayerCB_80279F8(Player *player)
{
    if (player->speedGroundX > Q_24_8(5.5)) {
        player->speedGroundX -= Q_24_8(0.5);
    } else if (player->speedAirX < Q_24_8(4.75)) {
        player->speedGroundX += Q_24_8(0.25);
    } else {
        player->speedGroundX = Q_24_8(5.0);
    }

    if (player->unk72 < INT16_MAX)
        player->unk72++;

    if (player->unk72 == 120) {
        player->unk64 = 32;
    }

    if (player->unk72 == 180) {
        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackResultsCutScene(gUnknown_03005490);
        } else {
            sub_80304DC(gUnknown_03005490, gRingCount, gUnknown_030054F4);
        }
    }

    sub_80232D0(player);
    sub_8023260(player);

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022D6C(player);

    PLAYERCB_UPDATE_UNK2A(player);

    if (gCamera.shiftY > -56)
        gCamera.shiftY--;

    if (player->moveState & MOVESTATE_4000000) {
        player->unk5A = 1;
        player->unk5C = 0x10;
        player->speedGroundX = Q_24_8(10.0);
        player->unk64 = 9;
        sub_801583C();

        gPlayer.callback = PlayerCB_8027B98;
        m4aSongNumStart(SE_273);
    }
}

void PlayerCB_8027B98(Player *player)
{
    sub_80232D0(player);
    sub_8023260(player);

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022D6C(player);

    PLAYERCB_UPDATE_UNK2A(player);

    gCamera.unk8 -= 56;
}

void PlayerCB_8027C5C(Player *player)
{
    // TODO: Maybe this is actually to be considered the player's
    //       x-position relative to a sprite region?
    s32 playerX = Q_24_8_TO_INT(player->x) - gCamera.x;

    if (playerX > 0x78) {
        player->speedGroundX = Q_24_8(4.5);
    } else if (playerX < 0x78) {
        player->speedGroundX = Q_24_8(5.5);
    } else {
        player->speedGroundX = Q_24_8(5.0);
    }

    sub_80232D0(player);
    sub_8023260(player);

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022D6C(player);

    PLAYERCB_UPDATE_UNK2A(player);
}

void PlayerCB_8027D3C(Player *player)
{
    s8 *someSio = gUnknown_030054B4;
    s32 sioDat = ((REG_SIOCNT_32 << 26) >> 30);
    u16 r8 = someSio[sioDat];
    u32 *pCmpX = &gUnknown_030054D0;
    u32 cmpX;
    s32 index = (0x40 + (r8 * 32));

    cmpX = Q_24_8(*pCmpX + index);
    if (player->x < cmpX) {
        player->unk5C = DPAD_RIGHT;
    } else if (player->x > cmpX) {
        player->unk5C = DPAD_LEFT;
    } else {
        player->unk5C = 0;
    }

    sub_802966C(player);
    if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
        s32 acceleration = GET_ROTATED_ACCEL(player->rotation);

        if (player->speedGroundX != 0) {
            player->speedGroundX += acceleration;
        }
    }

    sub_80232D0(player);
    sub_8023260(player);

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022D6C(player);

    PLAYERCB_UPDATE_UNK2A(player);

    if (((player->x > cmpX) && (player->unk5C == DPAD_RIGHT)) // fmt
        || ((player->x < cmpX) && (player->unk5C == DPAD_LEFT)) //
        || (player->x == cmpX)) {
        player->unk5A = 0;
        player->speedAirX = 0;
        player->speedAirY = 0;
        player->speedGroundX = 0;
        player->x = cmpX;

        // TODO: Check correctness of MULTI_SIO_PLAYERS_MAX being here!
        if (r8 < MULTI_SIO_PLAYERS_MAX) {
            player->unk64 = 28;
        } else {
            player->unk64 = 0;
        }

        player->moveState &= ~MOVESTATE_FACING_LEFT;
        player->unk72 = 0;
        player->unk5C = 0;

        gPlayer.callback = PlayerCB_802A4FC;
    }
}

void sub_8027EF0(Player *player)
{
    if (player->moveState & MOVESTATE_IN_AIR) {
        sub_8023610(player);
        sub_80236C8(player);
        sub_80232D0(player);

        PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
        PLAYERCB_UPDATE_POSITION(player);
        PLAYERCB_UPDATE_ROTATION(player);
        PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
    } else {
        sub_80232D0(player);
        sub_80231C0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);
    }
}

void sub_802808C(Player *player)
{
    if (player->moveState & MOVESTATE_IN_AIR) {
        sub_80232D0(player);

        PLAYERCB_UPDATE_POSITION(player);
        PLAYERCB_UPDATE_ROTATION(player);
        PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
    } else {
        sub_80232D0(player);
        sub_80231C0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);
    }
}

void sub_8028204(Player *player)
{
    sub_8023610(player);
    sub_80236C8(player);
    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED_B(player);

    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void sub_80282EC(Player *player)
{
    player->unk48 >>= 1;

    sub_8023610(player);

    if (player->character == CHARACTER_TAILS) {
        sub_80236C8(player);
    }

    sub_80232D0(player);

    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void sub_80283C4(Player *player)
{
    sub_80232D0(player);

    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void sub_8028478(Player *player)
{
    if (player->moveState & MOVESTATE_IN_AIR) {
        sub_80236C8(player);
        sub_80232D0(player);

        PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
        PLAYERCB_UPDATE_POSITION(player);
        PLAYERCB_UPDATE_ROTATION(player);
        PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
    } else {
        if (((player->rotation + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(player->rotation);

            if (player->speedGroundX != 0) {
                player->speedGroundX += acceleration;
            }
        }

        sub_80232D0(player);
        sub_80231C0(player);
        sub_8023260(player);

        PLAYERCB_UPDATE_POSITION(player);

        sub_8022D6C(player);

        PLAYERCB_UPDATE_UNK2A(player);
    }
}

/* Starting here, callbacks appear to have a different style,
   but they still use macros like PLAYERCB_UPDATE_POSITION */

extern struct Task *sub_801F15C(s16, s16, u16, s8, TaskMain, TaskDestructor);
extern void sub_801F214(void);
extern void sub_801F550(struct Task *);

static const s16 gUnknown_080D693A[4][NUM_CHARACTERS][2] = {
    [0] = {
        [CHARACTER_SONIC] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_CREAM] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_TAILS] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_KNUCKLES] = {Q_8_8(0.00), Q_8_8(-6.00)},
        [CHARACTER_AMY] = {Q_8_8(0.00), Q_8_8(-6.00)},
    },
    [1] = {
        [CHARACTER_SONIC] = {Q_8_8(0.00), Q_8_8(1.00)},
        [CHARACTER_CREAM] = {Q_8_8(0.00), Q_8_8(0.50)},
        [CHARACTER_TAILS] = {Q_8_8(0.00), Q_8_8(0.50)},
        [CHARACTER_KNUCKLES] = {Q_8_8(0.00), Q_8_8(1.00)},
        [CHARACTER_AMY] = {Q_8_8(0.00), Q_8_8(1.00)},
    },
    [2] = {
        [CHARACTER_SONIC] = {Q_8_8(6.00), Q_8_8(0.00)},
        [CHARACTER_CREAM] = {Q_8_8(4.00), Q_8_8(-2.50)},
        [CHARACTER_TAILS] = {Q_8_8(4.00), Q_8_8(-2.50)},
        [CHARACTER_KNUCKLES] = {Q_8_8(6.00), Q_8_8(0.00)},
        [CHARACTER_AMY] = {Q_8_8(6.00), Q_8_8(0.00)},
    },
    [3] = {
        [CHARACTER_SONIC] = {Q_8_8(-5.00), Q_8_8(-3.50)},
        [CHARACTER_CREAM] = {Q_8_8(-3.50), Q_8_8(-3.00)},
        [CHARACTER_TAILS] = {Q_8_8(-3.50), Q_8_8(-3.00)},
        [CHARACTER_KNUCKLES] = {Q_8_8(-5.00), Q_8_8(0.00)},
        [CHARACTER_AMY] = {Q_8_8(-3.50), Q_8_8(-2.00)},
    },
};

static const u16 gUnknown_080D698A[4] = { 33, 36, 34, 35 };

#define MASK_80D6992_1  0x1
#define MASK_80D6992_2  0x2
#define MASK_80D6992_4  0x4
#define MASK_80D6992_8  0x8
#define MASK_80D6992_10 0x10

static const u8 gUnknown_080D6992[4][NUM_CHARACTERS] = {
    [0] = {
        [CHARACTER_SONIC]    = MASK_80D6992_1,
        [CHARACTER_CREAM]    = MASK_80D6992_1,
        [CHARACTER_TAILS]    = MASK_80D6992_1,
        [CHARACTER_KNUCKLES] = (MASK_80D6992_2 | MASK_80D6992_1),
        [CHARACTER_AMY]      = MASK_80D6992_1,
    },
    [1] = {
        [CHARACTER_SONIC]    = 0,
        [CHARACTER_CREAM]    = 0,
        [CHARACTER_TAILS]    = 0,
        [CHARACTER_KNUCKLES] = 0,
        [CHARACTER_AMY]      = 0,
    },
    [2] = {
        [CHARACTER_SONIC]    = MASK_80D6992_8,
        [CHARACTER_CREAM]    = MASK_80D6992_10,
        [CHARACTER_TAILS]    = (MASK_80D6992_10 | MASK_80D6992_1),
        [CHARACTER_KNUCKLES] = MASK_80D6992_4,
        [CHARACTER_AMY]      = MASK_80D6992_8,
    },
    [3] = {
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

struct Task *sub_8028640(s32 p0, s32 p1, s32 p2)
{
    struct Task *t;
    TaskStrc_801F15C *taskStrc;
    Sprite *s;

    u16 p2_ = p2;

    t = sub_801F15C(p0, p1, 232, gPlayer.unk60, sub_801F214, sub_801F550);

    taskStrc = TaskGetStructPtr(t);
    taskStrc->playerAnim = gPlayer.unk68;
    taskStrc->playerVariant = gPlayer.unk6A;

    s = &taskStrc->s;
    s->graphics.dest = VramMalloc(gUnknown_080D69A6[p2_][0]);
    s->graphics.anim = gUnknown_080D69A6[p2_][1];
    s->variant = gUnknown_080D69A6[p2_][2];
    s->unk1A = 0x1C0;
    s->unk10 = SPRITE_FLAG_PRIORITY(2);

    return t;
}

// Set when doing (non-downwards) tricks
void PlayerCB_80286F0(Player *player)
{
    u32 u5B = player->unk5B;
    u16 character = player->character;
    u8 mask = gUnknown_080D6992[player->unk5B][character];

    sub_80218E4(player);

    player->moveState |= (MOVESTATE_2000 | MOVESTATE_100 | MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    sub_8023B5C(player, 14);

    player->unk16 = 6;
    player->unk17 = 14;

    if (mask & MASK_80D6992_4)
        player->unk72 = 10;
    else if (mask & MASK_80D6992_8)
        player->unk72 = 45;

    player->speedAirX = 0;
    player->speedAirY = 0;

    player->unk64 = gUnknown_080D698A[u5B];
    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    m4aSongNumStart(SE_JUMP);
    m4aSongNumStart(SE_230);

    gPlayer.callback = PlayerCB_80287AC;
    PlayerCB_80287AC(player);
}

#include "game/unknown_object_6998.h"
void PlayerCB_80287AC(Player *player)
{
    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        u32 u5B = player->unk5B;
        u16 character = player->character;
        player->unk6A++;

        player->speedAirX = gUnknown_080D693A[u5B][character][0];
        player->speedAirY = gUnknown_080D693A[u5B][character][1];

        if (player->moveState & MOVESTATE_FACING_LEFT)
            player->speedAirX = -player->speedAirX;

        gPlayer.callback = PlayerCB_802890C;

        if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
            if (u5B == 2 && character == CHARACTER_SONIC) {
                sub_8028640(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y), 0);
            }
            if (u5B == 0 && character == CHARACTER_KNUCKLES) {
                sub_8028640(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y), 1);
            }
            if (u5B == 2 && character == CHARACTER_AMY) {
                sub_8086998();
            }
        }
    }

    sub_80232D0(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void PlayerCB_802890C(Player *player)
{
    u32 u5B = player->unk5B;
    u16 character = player->character;
    u8 mask = gUnknown_080D6992[u5B][character];

    if ((mask & MASK_80D6992_1) && (player->unk6A == 1) && (player->speedAirY > 0)) {
        player->unk6A = 2;
    }

    if (player->unk72 != 0) {
        player->unk72--;
    } else {
        if (mask & MASK_80D6992_4)
            mask &= ~MASK_80D6992_4;

        if ((mask & MASK_80D6992_8) && (player->unk64 != 14))
            player->unk64 = 14;
    }

    if (!(mask & MASK_80D6992_2) || (player->speedAirY > 0)) {
        sub_8023610(player);
    }

    if (!(mask & MASK_80D6992_4)) {
        sub_80236C8(player);
    }

    sub_80232D0(player);

    if (mask & MASK_80D6992_10) {
        PLAYERCB_UPDATE_AIR_FALL_SPEED_B(player);
    } else {
        if (!(mask & MASK_80D6992_4)) {
            PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
        }
    }

    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)
        && (player->character == CHARACTER_KNUCKLES) && (player->unk5B == 2)) {
        player->unk6A++;
        gPlayer.callback = PlayerCB_802A3C4;
    }
}

void sub_8028ADC(Player *player)
{
    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (player->unk36 == 0)
        && (player->unk5E & gPlayerControls.trick)) {
        if (player->unk5C & DPAD_UP) {
            PLAYERCB_MAYBE_INCREMENT_LIVES(player, gUnknown_080D6932[0]);
            player->unk5B = 0;
            gPlayer.callback = PlayerCB_80286F0;
        } else if (player->unk5C & DPAD_DOWN) {
            PLAYERCB_MAYBE_INCREMENT_LIVES(player, gUnknown_080D6932[3]);

            switch (player->character) {
                case CHARACTER_SONIC: {
                    player->moveState |= MOVESTATE_20000000;
                    gPlayer.callback = PlayerCB_8011F1C;
                } break;

                case CHARACTER_KNUCKLES: {
                    player->moveState |= MOVESTATE_20000000;
                    gPlayer.callback = PlayerCB_8013D18;
                } break;

                case CHARACTER_AMY: {
                    player->moveState |= MOVESTATE_20000000;
                    gPlayer.callback = PlayerCB_8011F1C;
                } break;

                default: {
                    player->unk5B = 1;
                    gPlayer.callback = PlayerCB_80286F0;
                } break;
            }
        } else if ((!(player->moveState & MOVESTATE_FACING_LEFT)
                    && (player->unk5C & DPAD_RIGHT))
                   || ((player->moveState & MOVESTATE_FACING_LEFT)
                       && (player->unk5C & DPAD_LEFT))) {
            PLAYERCB_MAYBE_INCREMENT_LIVES(player, gUnknown_080D6932[2]);
            player->unk5B = 2;

            gPlayer.callback = PlayerCB_80286F0;
        } else {
            PLAYERCB_MAYBE_INCREMENT_LIVES(player, gUnknown_080D6932[1]);
            player->unk5B = 3;

            gPlayer.callback = PlayerCB_80286F0;
        }
    }
}

void PlayerCB_8028D74(Player *player)
{
    sub_80218E4(player);

    player->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    if ((player->unk16 < 6) || (player->unk17 < 9)) {
        u16 cAnim = GET_CHARACTER_ANIM(player);

        if ((cAnim == SA2_CHAR_ANIM_SPIN_ATTACK) || (cAnim == SA2_CHAR_ANIM_JUMP_1)
            || (cAnim == SA2_CHAR_ANIM_JUMP_2) || (cAnim == SA2_CHAR_ANIM_70)) {
            sub_8023B5C(player, 9);
            player->unk16 = 6;
            player->unk17 = 9;
        } else {
            sub_8023B5C(player, 14);
            player->unk16 = 6;
            player->unk17 = 14;
        }
    }

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    player->rotation = 0;

    gPlayer.callback = PlayerCB_8029074;
    PlayerCB_8029074(player);
}

static const s16 gUnknown_080D69B2[4] = {
    Q_8_8(7.5),
    Q_8_8(9.0),
    Q_8_8(10.5),
    Q_8_8(12.0),
};

static const s16 gUnknown_080D69BA[4] = {
    Q_8_8(7.5),
    Q_8_8(9.0),
    Q_8_8(10.5),
    Q_8_8(12.0),
};

static const u8 gUnknown_080D69C2[4] = { 4, 3, 2, 2 };

void PlayerCB_8028E24(Player *player)
{
    u8 u6E = player->unk6E;
    u8 r5 = (u6E >> 4);
    u8 r6 = u6E % 4;

    sub_80218E4(player);

    if (((r5 == 2) || (r5 == 3)) && !(player->moveState & MOVESTATE_IN_AIR)) {
        player->moveState &= ~(MOVESTATE_100 | MOVESTATE_IN_AIR);
    } else {
        player->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    }

    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1))
        || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        player->unk64 = 37;
    } else if (ABS(player->speedAirX) < Q_24_8(2.5)) {
        player->unk64 = 38;
    } else {
        player->unk64 = 39;
    }

    player->unk66 = -1;

    switch (r5) {
        case 0: {
            player->speedAirY = -gUnknown_080D69B2[r6];
        } break;

        case 1: {
            player->speedAirY = +gUnknown_080D69B2[r6];
        } break;

        case 2: {
            player->speedAirX = -gUnknown_080D69BA[r6];

            if (!(player->moveState & MOVESTATE_IN_AIR)
                && player->speedAirX < -Q_24_8(9.0)) {
                player->unk5A = 1;
            }
        } break;

        case 3: {
            player->speedAirX = +gUnknown_080D69BA[r6];

            if (!(player->moveState & MOVESTATE_IN_AIR)
                && player->speedAirX > +Q_24_8(9.0)) {
                player->unk5A = 1;
            }
        } break;

        case 4: {
            player->speedAirX = -gUnknown_080D69BA[r6];
            player->speedAirY = -gUnknown_080D69B2[r6];
        } break;

        case 5: {
            player->speedAirX = +gUnknown_080D69BA[r6];
            player->speedAirY = -gUnknown_080D69B2[r6];
        } break;

        case 6: {
            player->speedAirX = -gUnknown_080D69BA[r6];
            player->speedAirY = +gUnknown_080D69B2[r6];
        } break;

        case 7: {
            player->speedAirX = +gUnknown_080D69BA[r6];
            player->speedAirY = +gUnknown_080D69B2[r6];
        } break;
    }

    player->unk36 = gUnknown_080D69C2[r6];

    if ((gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1))
        || (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2))) {
        {
            s32 speed = (player->speedAirX * 5);
            if (speed < 0) {
                speed += 3;
            }
            player->speedAirX = speed >> 2;
        }
        {
            s32 speed = (player->speedAirY * 5);
            if (speed < 0) {
                speed += 3;
            }
            player->speedAirY = speed >> 2;
        }
    }

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY /= 2;
    }

    if (player->speedAirX > Q_24_8(1.25)) {
        player->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (player->speedAirX < -Q_24_8(1.25)) {
        player->moveState |= MOVESTATE_FACING_LEFT;
    }

    gPlayer.callback = PlayerCB_8029074;
    PlayerCB_8029074(player);
}

void PlayerCB_8029074(Player *player)
{
    sub_80246DC(player);
    sub_8028ADC(player);
    sub_8023610(player);
    sub_80236C8(player);
    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void PlayerCB_8029158(Player *player)
{
    sub_80218E4(player);
    player->moveState |= MOVESTATE_IN_AIR;
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_8);

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->unk64 = 40;
    player->unk66 = -1;

    if (player->speedAirX > Q_24_8(1.25)) {
        player->moveState &= ~MOVESTATE_FACING_LEFT;
    }
    if (player->speedAirX < -Q_24_8(1.25)) {
        player->moveState |= MOVESTATE_FACING_LEFT;
    }

    switch (player->unk6E) {
        case 0: {
            s32 groundSpeed = player->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            player->speedAirX = r5 + Q_24_8(3.75);
            player->speedAirY = res + -Q_24_8(3.75);
        } break;

        case 1:
        case 2: {
            s32 groundSpeed = player->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            player->speedAirX = r5 + Q_24_8(3.75);
            player->speedAirY = res + -Q_24_8(7.50);
        } break;

        case 3: {
            s32 groundSpeed = player->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            player->speedAirX = r5 + Q_24_8(5.625);
            player->speedAirY = res + -Q_24_8(2.50);
        } break;

        case 4:
        case 5: {
            s32 groundSpeed = player->speedGroundX;
            s32 speed = (groundSpeed * 3);
            s16 r5;
            s16 res;
            if (speed < 0) {
                speed += 7;
            }
            r5 = (((u32)speed << 13) >> 16);

            res = -ABS(groundSpeed) / 6;

            player->speedAirX = r5 + Q_24_8(11.25);
            player->speedAirY = res + -Q_24_8(2.50);
        } break;
    }

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY >>= 1;
    }

    if (player->moveState & MOVESTATE_FACING_LEFT) {
        player->speedAirX = -player->speedAirX;
    }

    m4aSongNumStart(SE_276);

    gPlayer.callback = PlayerCB_8029314;
    PlayerCB_8029314(player);
}

void PlayerCB_8029314(Player *player)
{
    if ((player->unk64 == 40) && (player->unk6A == 0) && (player->speedAirY > 0))
        player->unk6A = 1;

    sub_8028ADC(player);
    sub_8023708(player);
    sub_80232D0(player);

    PLAYERCB_UPDATE_AIR_FALL_SPEED(player);
    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

void PlayerCB_802940C(Player *player)
{
    if (--player->unk72 == -1) {
        gPlayer.callback = PlayerCB_8029074;
    }

    sub_80246DC(player);
    sub_8028ADC(player);
    sub_80232D0(player);

    PLAYERCB_UPDATE_POSITION(player);
    PLAYERCB_UPDATE_ROTATION(player);
    PLAYERCB_MAYBE_TRANSITION_TO_GROUND(player);
}

// TODO: Fix the goto-match
bool32 sub_80294F4(Player *player)
{
    u16 song;
    if (!(player->moveState & MOVESTATE_20000000)) {
        if (player->unk5E & gPlayerControls.attack) {
            switch (player->character) {
                case CHARACTER_SONIC: {
                    PlayerCB_8011F1C(player);
                    return TRUE;
                } break;

                case CHARACTER_CREAM: {
                    if ((player->unk5C & DPAD_ANY) == DPAD_DOWN) {
                        sub_8012888(player);
                    } else {
                        sub_80128E0(player);
                    }
                    return TRUE;
                } break;

                case CHARACTER_KNUCKLES: {
                    PlayerCB_8013D18(player);
                    return TRUE;
                } break;

                case CHARACTER_AMY: {
                    PlayerCB_8011F1C(player);
                    return TRUE;
                } break;
            }
        }
        // _0802956E
        if (player->unk5E & gPlayerControls.jump) {
            switch (player->character) {
                case CHARACTER_SONIC: {
                    if (!IS_BOSS_STAGE(gCurrentLevel)
                        && gUnknown_030054C0.unk0 < 0x4000) {
                        sub_8012194(player);
                        return TRUE;
                    } else {
                        player->moveState |= MOVESTATE_20000000;
                        player->unk64 = 18;
                        sub_8011B88(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y),
                                    1);
                        song = SE_SONIC_INSTA_SHIELD;
                        goto sub_80294F4_PlaySfx;
                    }
                } break;

                case CHARACTER_CREAM: {
                    sub_8012644(player);
                    return TRUE;
                } break;

                case CHARACTER_TAILS: {
                    if (!(player->moveState & MOVESTATE_40)) {
                        sub_8012BC0(player);
                        player->moveState |= MOVESTATE_20000000;
                        return TRUE;
                    }
                } break;

                case CHARACTER_KNUCKLES: {
                    if (!(player->moveState & MOVESTATE_40)) {
                        sub_8013AD8(player);
                        return TRUE;
                    }
                } break;

                case CHARACTER_AMY: {
                    player->moveState |= MOVESTATE_20000000;
                    player->unk64 = 18;
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

// https://decomp.me/scratch/HZn3x
NONMATCH("asm/non_matching/playercb__sub_802966C.inc", void sub_802966C(Player *player))
{
    u8 r6 = -1;
    s32 u48 = player->unk48;
    s32 u4C = player->unk4C;

    if ((player->unk2A == 0) && player->unk5C & (DPAD_LEFT | DPAD_RIGHT)) {
        // _08029690
        if (player->speedGroundX > 0) {
            if (player->unk5C & DPAD_RIGHT) {
                if (player->speedGroundX < player->unk44) {
                    player->speedGroundX += u48;

                    if (player->speedGroundX > player->unk44) {
                        player->speedGroundX = player->unk44;
                    }
                } else {
                    player->unk58 += u48;
                }
                player->moveState &= ~MOVESTATE_FACING_LEFT;
            } else if (player->speedGroundX >= Q_24_8(2.0)) {
            // _080296D2
            argh:
                if ((player->unk64 == 7) || (player->unk64 == 8)) {
                    r6 = player->unk64;
                } else {
                    r6 = (player->unk54 > 3) ? 8 : 7;
                }
                player->speedGroundX -= u4C;
            }

            // _080297A2
            sub_8029FA4(player);
            m4aSongNumStart(SE_BRAKE);
        } else if (player->speedGroundX < 0) {
            // _08029734
            if (player->moveState & MOVESTATE_20) {
                if ((player->unk64 == 7) || (player->unk64 == 8)) {
                    r6 = player->unk64;
                }

                if (player->speedGroundX > -player->unk44) {
                    player->speedGroundX -= u48;

                    if (player->speedGroundX < -player->speedGroundX) {
                        player->speedGroundX = -player->speedGroundX;
                    }
                } else {
                    // _0802975C
                    player->unk58 += u48;
                }
                player->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                // _08029770
                if (player->speedGroundX <= -Q_24_8(2.0)) {
                    if ((player->unk64 == 7) || (player->unk64 == 8)) {
                        r6 = player->unk64;
                    } else {
                        r6 = (player->unk54 > 3) ? 8 : 7;
                    }

                    player->speedGroundX += u4C;

                    // _080297A2
                    sub_8029FA4(player);
                    m4aSongNumStart(SE_BRAKE);
                } else {
                    // _080297B2
                    player->speedGroundX += u4C;

                    if ((player->speedGroundX < 0)
                        && !(player->moveState & MOVESTATE_FACING_LEFT)) {
                        goto skip_block;
                    } else {
                        goto argh;
                    }
                }
            }
        } else {
            // _080297C8
            if ((player->moveState & MOVESTATE_FACING_LEFT)
                != ((player->unk5C & DPAD_RIGHT) >> 4)) {
                if (player->moveState & MOVESTATE_FACING_LEFT) {
                    player->speedGroundX -= u48;
                } else {
                    player->speedGroundX += u48;
                }

                r6 = 9;
                sub_8023B5C(player, 14);
                player->unk16 = 6;
                player->unk17 = 14;
            } else {
                gPlayer.callback = PlayerCB_802A5C4;
            }
        }
    } else {
        // _0802980C
        s32 grndSpeed = player->speedGroundX;
        if (grndSpeed > 0) {
            s16 val = grndSpeed - Q_24_8(8.0 / 256.0);
            if (val <= 0) {
                r6 = 0;
                val = 0;
            } else {
                r6 = 9;
            }
            player->speedGroundX = val;
        } else if (grndSpeed < 0) {
            // _08029820
            s16 val = grndSpeed + Q_24_8(8.0 / 256.0);
            if (val >= 0) {
                r6 = 0;
                val = 0;
            } else {
                r6 = 9;
            }
            player->speedGroundX = val;

        } else {
            // _0802983A
            r6 = 0;
        }
    }
    // _0802983C
skip_block:
    if (player->moveState & MOVESTATE_8000) {
        s8 r6s = r6;
        if ((r6s == 7) || (r6s == 8)) {
            player->unk64 = r6s;
        }
    } else if ((s8)r6 != -1) {
        //_08029860
        if (player->unk64 != (s8)r6)
            player->unk64 = (s8)r6;
    } else if ((player->unk64 == 7) || (player->unk64 == 8)) {
        player->unk64 = 9;
    }

    sub_8023128(player);
}
END_NONMATCH

void sub_802989C(Player *player)
{
    if ((u16)gRingCount >= 150) {
        player->unk52 = 4;
    } else if ((u16)gRingCount >= 100) {
        player->unk52 = 3;
    } else if ((u16)gRingCount >= 50) {
        player->unk52 = 2;
    } else if ((u16)gRingCount > 10) {
        player->unk52 = 1;
    } else {
        player->unk52 = 0;
    }
}

void sub_80298DC(Player *player)
{
    // TODO: unk5A Might be isBoostActive ?
    bool32 isBoostActive = player->unk5A;
    if (isBoostActive) {
        if (!(player->moveState & MOVESTATE_IN_AIR)) {
            player->unk58 = gUnknown_080D6916[player->unk52];

            if (ABS(player->speedGroundX) < Q_24_8(4.5)) {
                player->unk5A = FALSE;
                player->unk58 = 0;
            }
        }
    } else {
        if ((!(player->moveState & MOVESTATE_IN_AIR))
            && ((ABS(player->speedGroundX) >= player->unk44))) {
            if (player->unk58 >= gUnknown_080D6916[player->unk52]) {
                player->unk5A = TRUE;
                gCamera.unk8 = 0x400;

                CreateBoostModeParticles();

                m4aSongNumStart(SE_221);
            }
        } else {
            player->unk58 = isBoostActive;
        }
    }
}

void sub_8029990(Player *player)
{
    s32 absSpeed = ABS(player->speedGroundX);

    if (absSpeed <= Q_24_8(1.25)) {
        player->unk54 = 0;
    } else if (absSpeed <= Q_24_8(2.5)) {
        player->unk54 = 1;
    } else if (absSpeed <= Q_24_8(4.0)) {
        player->unk54 = 2;
    } else if (absSpeed <= Q_24_8(9.0)) {
        player->unk54 = 3;
    } else if (absSpeed <= Q_24_8(10.0)) {
        player->unk54 = 4;
    } else {
        player->unk54 = 5;
    }
}

// NOTE: Proc type should be the same as sub_8021604!
void sub_80299F0(u32 character, u32 level, u32 p2, Player *player)
{
    sub_8021604(character, level, p2, player);
}

void sub_80299FC(Player *player)
{
    TaskDestroy(player->unk8C);
    player->unk8C = NULL;

    if (player->unk60 == 0) {
        sub_801F78C();
        sub_8021350();
    }
}

extern void *sub_802195C(Player *player, u8 *p1, int *out);
extern void *sub_8021A34(Player *player, u8 *p1, int *out);
extern void *sub_8021B08(Player *player, u8 *p1, int *out);
extern void *sub_8029BB8(Player *player, u8 *p1, int *out);

void *sub_8029A28(Player *player, u8 *p1, int *out)
{
    void *result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_802195C(player, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

void *sub_8029A74(Player *player, u8 *p1, int *out)
{
    void *result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8021A34(player, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

void *sub_8029AC0(Player *player, u8 *p1, int *out)
{
    void *result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8021B08(player, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

void *sub_8029B0C(Player *player, u8 *p1, int *out)
{
    void *result;

    u8 dummy;

    // TODO: Why is dummyInt unused?
    int dummyInt;
    int p1Value;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    result = sub_8029BB8(player, p1, out);

    p1Value = *p1;

    if (p1Value & 0x1)
        *p1 = 0;
    else {
        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            s32 val = -0x80;
            val -= p1Value;
            *p1 = val;
        }
    }

    return result;
}

void *sub_8029B58(Player *player, u8 *p1, int *out)
{
    void *result;

    u8 dummy;

    if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
        result = sub_8029B0C(player, p1, out);
    } else {
        result = sub_8029AC0(player, p1, out);
    }

    return result;
}

void *sub_8029B88(Player *player, u8 *p1, int *out)
{
    void *result;

    u8 dummy;

    if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
        result = sub_8029AC0(player, p1, out);
    } else {
        result = sub_8029B0C(player, p1, out);
    }

    return result;
}
