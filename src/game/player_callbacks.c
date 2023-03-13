#include "global.h"
#include "game/game.h"

#include "constants/move_states.h"

void PlayerCB_Idle(Player *);
void sub_8025F84(Player *);
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
