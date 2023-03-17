#include "global.h"
#include "trig.h"
#include "game/game.h"

#include "constants/animations.h"
#include "constants/move_states.h"

void PlayerCB_Idle(Player *);
void sub_8022D6C(Player *);
void sub_8023128(Player *);
void sub_8023260(Player *);
void sub_80232D0(Player *);
void PlayerCB_8025AB8(Player *);
void PlayerCB_8025E18(Player *);
void sub_8025F84(Player *);
void PlayerCB_80273D0(Player *);
void sub_802966C(Player *);
bool32 sub_8029E6C(Player *);
bool32 sub_802A0C8(Player *);
bool32 sub_802A0FC(Player *);
bool32 sub_802A184(Player *);
bool32 sub_802A2A8(Player *);
void sub_802A360(Player *);

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

// >> acceleration = (sin(angle) * 3) / 32
#define GET_ROTATED_ACCEL(angle) ((SIN_24_8((angle)*4) * 3) >> 5)

#define PLAYER_AIR_SPEED_MAX Q_24_8(15.0)

void PlayerCB_8025318(Player *player)
{
    u32 mask;
    if (((gCurrentLevel & 0x3) == ACT_BOSS)
        || ((gCurrentLevel == 28) && (gUnknown_030054B0 == 0))
        || (gCurrentLevel == 29)) {
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
        gPlayer.callback(player);
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

        if (((player->unk24 + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            s32 acceleration = GET_ROTATED_ACCEL(player->unk24);

            if (player->speedGroundX != 0) {
                player->speedGroundX += acceleration;
            }
        }

        sub_80232D0(player);
        sub_8023260(player);

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
            player->speedAirY = -player->speedAirY;
        }

        player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);

        player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            ? player->y - player->speedAirY
            : player->y + player->speedAirY;

        sub_8022D6C(player);

        if (player->unk2A) {
            player->unk2A -= 1;
        } else if ((player->unk24 + 32) & 0xC0) {
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

        if (((player->unk24 + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(player->unk24);

            if (player->speedGroundX != 0)
                player->speedGroundX += acceleration;
        }
        // _080255C2

        sub_80232D0(player);
        sub_8023260(player);

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
            player->speedAirY = -player->speedAirY;
        }

        player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);

        player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            ? player->y - player->speedAirY
            : player->y + player->speedAirY;

        sub_8022D6C(player);

        if (player->unk2A) {
            player->unk2A -= 1;
        } else if ((player->unk24 + 32) & 0xC0) {
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

#define GetCharacterAnim(playerRef)                                                     \
    ((playerRef)->unk68 - PlayerCharacterIdleAnims[player->character])

void PlayerCB_802569C(Player *player)
{
    Sprite *s = &player->unk90->s;
    u16 characterAnim = GetCharacterAnim(player);

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
        //_0802572A
        if ((characterAnim == SA2_CHAR_ANIM_TAUNT) && (player->unk6A == 1)
            && (s->unk10 & 0x4000)) {
            gPlayer.callback = PlayerCB_8025318;
        }

        if (((player->unk24 + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(player->unk24);

            if (player->speedGroundX != 0)
                player->speedGroundX += acceleration;
        }

        sub_80232D0(player);
        sub_8023260(player);

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
            player->speedAirY = -player->speedAirY;
        }

        player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);

        player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            ? player->y - player->speedAirY
            : player->y + player->speedAirY;

        sub_8022D6C(player);

        if (player->unk2A) {
            player->unk2A -= 1;
        } else if ((player->unk24 + 32) & 0xC0) {
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
    u16 characterAnim = GetCharacterAnim(player);

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

        if (((player->unk24 + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 acceleration = GET_ROTATED_ACCEL(player->unk24);

            if (player->speedGroundX != 0)
                player->speedGroundX += acceleration;
        }

        sub_80232D0(player);
        sub_8023260(player);

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
            player->speedAirY = -player->speedAirY;
        }

        player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);

        player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            ? player->y - player->speedAirY
            : player->y + player->speedAirY;

        sub_8022D6C(player);

        if (player->unk2A) {
            player->unk2A -= 1;
        } else if ((player->unk24 + 32) & 0xC0) {
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
    if (((gCurrentLevel & 0x3) == ACT_BOSS)
        || ((gCurrentLevel == 28) && (gUnknown_030054B0 == 0))
        || (gCurrentLevel == 29)) {
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
        gPlayer.callback(player);
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
        if (player->unk99) {
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
                            s32 aaaa = -Q_24_8(0.375);
                            player->speedGroundX = aaaa;
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
        // _08025B66

        if (player->speedGroundX > 0) {
            player->unk50 = 8;
        } else if (player->speedGroundX < 0) {
            player->unk50 = -8;
        } else {
            player->unk50 = 0;
        }
        // __08025B90

        player->speedGroundX -= player->unk50;

        if ((player->speedGroundX > -Q_24_8(0.5))
            && (player->speedGroundX < Q_24_8(0.5))) {
            player->unk50 = 0;
            player->speedGroundX = 0;
        }

        if (player->speedGroundX == 0) {
            gPlayer.callback = PlayerCB_8025318;
            gPlayer.callback(player);
            return;
        }

        {
            s32 speedX = player->speedGroundX;
            if ((((player->unk24 + Q_24_8(0.375)) & 0xFF) < 0xC0) && (speedX != 0)) {
                u32 sinVal = SIN_24_8((player->unk24) * 4) * 60;
                s32 sinInt = (s32)(Q_24_8_TO_INT((s32)sinVal));

                if ((speedX > 0)) {
                    if ((sinInt > 0))
                        speedX += sinInt;
                    else {
                        sinInt >>= 2;
                        speedX += sinInt;
                    }
                } else {
                    if ((sinInt < 0))
                        speedX += sinInt;
                    else {
                        sinInt >>= 2;
                        speedX += sinInt;
                    }
                }

                player->speedGroundX = speedX;
            }
            // _08025C12

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
            // _08025C42

            player->x += player->speedAirX;

            if ((gUnknown_03005424 ^ gUnknown_0300544C)
                & EXTRA_STATE__GRAVITY_INVERTED) {
                player->speedAirY = -player->speedAirY;
            }

            player->speedAirY = MIN(player->speedAirY, PLAYER_AIR_SPEED_MAX);

            player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
                ? player->y - player->speedAirY
                : player->y + player->speedAirY;

            sub_8022D6C(player);

            if (player->unk2A) {
                player->unk2A -= 1;
            } else if ((player->unk24 + 32) & 0xC0) {
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