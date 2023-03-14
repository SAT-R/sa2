#include "global.h"
#include "trig.h"
#include "game/game.h"

#include "constants/move_states.h"

void PlayerCB_Idle(Player *);
void sub_8022D6C(Player *);
void sub_8023260(Player *);
void sub_80232D0(Player *);
void PlayerCB_8025E18(Player *);
void sub_8025F84(Player *);
void PlayerCB_80273D0(Player *);
void sub_802966C(Player *);
bool32 sub_8029E6C(Player *);
bool32 sub_802A0C8(Player *);
bool32 sub_802A0FC(Player *);
bool32 sub_802A2A8(Player *);
void sub_802A360(Player *);

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

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

#if 001
void PlayerCB_Idle(Player *player)
{
    if ((player->moveState & (MOVESTATE_8000000 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_8000000) {
        PlayerCB_80273D0(player);
    } else if ((player->moveState & (MOVESTATE_800 | MOVESTATE_8 | MOVESTATE_IN_AIR)) == MOVESTATE_800) {
        sub_802A360(player);
    } else if (!sub_802A0C8(player) 
        && !sub_802A0FC(player) 
        && !sub_8029E6C(player)
        && !sub_802A2A8(player)) {
        // _0802542C
        u32 maybeRotation;
        sub_802966C(player);

        maybeRotation = player->unk24;

        if (((player->unk24 + Q_24_8(0.375)) & 0xFF) < 0xC0) {
            u32 sinus = (SIN_24_8(player->unk24 * 4) * 3) >> 5;

            if (player->speedGroundX != 0) {
                player->speedGroundX += sinus;
            }
        }

        sub_80232D0(player);
        sub_8023260(player);

        player->x += player->speedAirX;

        if ((gUnknown_03005424 ^ gUnknown_0300544C) & EXTRA_STATE__GRAVITY_INVERTED) {
#ifndef PORTABLE
            player->speedAirY = (u16)player->speedAirY * (-1);
#else
            player->speedAirY = player->speedAirY * (-1);
#endif
        }

        player->speedAirY = (player->speedAirY > Q_24_8(15.0))
            ? Q_24_8(15.0)
            : player->speedAirY;

        player->y = (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            ? player->y - player->speedAirY
            : player->y + player->speedAirY;

        sub_8022D6C(player);

        if(player->unk2A)
        {
            player->unk2A -= 1;
        }
        else if((player->unk24 + 32) & 0xC0)
        {
            s32 speed = player->speedGroundX;
            if(speed < 0)
                speed = -speed;
                
            if(speed < Q_24_8(1.875)) {
                player->speedGroundX = player->unk2A;

                player->moveState |= MOVESTATE_IN_AIR;
                player->unk2A = GBA_FRAMES_PER_SECOND/2;
            }
        }
        // _08025510

        if(player->moveState & MOVESTATE_8000)
        {
            player->moveState &= ~MOVESTATE_IN_AIR;
        }
        else if(player->moveState & MOVESTATE_IN_AIR)
        {
            gPlayer.callback = PlayerCB_8025E18;
        }

    }
}
#endif