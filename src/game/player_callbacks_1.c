#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

extern bool32 sub_801251C(Player *);
extern void sub_801F488(void);

void PlayerCB_Idle(Player *);
void sub_8022190(Player *);
void sub_8022218(Player *);
void sub_8022284(Player *);
void sub_8022D6C(Player *);
void sub_8023128(Player *);
void sub_8023260(Player *);
void sub_80232D0(Player *);
void sub_8023610(Player *);
void sub_80236C8(Player *);
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
void PlayerCB_8029074(Player *);
bool32 sub_80294F4(Player *);
void sub_802966C(Player *);
bool32 sub_8029E6C(Player *);
bool32 sub_802A0C8(Player *);
bool32 sub_802A0FC(Player *);
bool32 sub_802A184(Player *);
bool32 sub_802A2A8(Player *);
void sub_802A360(Player *);
void PlayerCB_802A3B8(Player *);
void sub_802A40C(Player *);
void sub_802A468(Player *);
void sub_802A4B8(Player *);

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle)   ((SIN_24_8((angle)*4) * 3) >> 5)
#define GET_ROTATED_ACCEL_2(angle) ((SIN_24_8((angle)*4) * 5) >> 5)

#define PLAYER_AIR_SPEED_MAX Q_24_8(15.0)

#define GET_CHARACTER_ANIM(playerRef)                                                   \
    ((playerRef)->unk68 - PlayerCharacterIdleAnims[player->character])

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
                if (player->moveState & MOVESTATE_40) {
                    player->speedAirY += Q_24_8(12.0 / 256.0);
                } else {
                    player->speedAirY += Q_24_8(42.0 / 256.0);
                }
            }

            PLAYERCB_UPDATE_POSITION(player);

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

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY += Q_24_8(12.0 / 256.0);
    } else {
        player->speedAirY += Q_24_8(42.0 / 256.0);
    }

    PLAYERCB_UPDATE_POSITION(player);

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
    // _08026220

    if (!IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80236C8(player);
    }

    sub_80232D0(player);

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY += Q_24_8(12.0 / 256.0);
    } else {
        player->speedAirY += Q_24_8(42.0 / 256.0);
    }

    PLAYERCB_UPDATE_POSITION(player);

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

        if (player->moveState & MOVESTATE_40) {
            player->speedAirY += Q_24_8(12.0 / 256.0);
        } else {
            player->speedAirY += Q_24_8(42.0 / 256.0);
        }

        PLAYERCB_UPDATE_POSITION(player);

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

        PLAYERCB_UPDATE_POSITION(player);

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
        // _080267C4
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
            if (player->moveState & MOVESTATE_40) {
                player->speedAirY += Q_24_8(12.0 / 256.0);
            } else {
                player->speedAirY += Q_24_8(42.0 / 256.0);
            }
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

    // _08026ADA
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
            if (player->moveState & MOVESTATE_40) {
                player->speedAirY += Q_24_8(12.0 / 256.0);
            } else {
                player->speedAirY += Q_24_8(42.0 / 256.0);
            }
        }

        PLAYERCB_UPDATE_POSITION(player);

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

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY += Q_24_8(12.0 / 256.0);
    } else {
        player->speedAirY += Q_24_8(42.0 / 256.0);
    }

    PLAYERCB_UPDATE_POSITION(player);
    {
        s32 rot = (s8)player->rotation;
        if (rot < 0) {
            rot = MIN((rot + 2), 0);
        } else if (rot > 0) {
            rot = MAX((rot - 2), 0);
        }
        player->rotation = rot;
    }

    if (player->speedAirY >= 0) {
        sub_8022218(player);
        sub_8022284(player);
    } else {
        sub_8022284(player);
        sub_8022218(player);
    }

    if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {
        gPlayer.callback = PlayerCB_8025318;
        player->speedGroundX = player->speedAirX;
        player->rotation = 0;
    }
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

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY += Q_24_8(12.0 / 256.0);
    } else {
        player->speedAirY += Q_24_8(42.0 / 256.0);
    }

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022190(player);

    if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {
        gPlayer.callback = PlayerCB_8025318;
        player->speedGroundX = player->speedAirX;
        player->rotation = 0;
    }
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
        // _080271F0
        speed -= Q_24_8(8.0 / 256.0);
    } else {
        speed += Q_24_8(8.0 / 256.0);
    }
    player->speedGroundX = speed;

    sub_80232D0(player);

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

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY += Q_24_8(12.0 / 256.0);
    } else {
        player->speedAirY += Q_24_8(42.0 / 256.0);
    }

    PLAYERCB_UPDATE_POSITION(player);

    sub_8022190(player);

    if ((player->moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8) {
        gPlayer.callback = PlayerCB_8025318;

        player->speedGroundX = player->speedAirX;
        player->rotation = 0;
    }
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
}