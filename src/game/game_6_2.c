#include "global.h"
#include "game/game.h"
#include "game/player_callbacks_1.h"
#include "game/playerfn_cmds.h"

#include "constants/move_states.h"

void sub_8024228(Player *p)
{
    if (p->unk6D) {
        switch (p->unk6D - 1) {
            case 0: {
                PLAYERFN_SET(PlayerCB_8025318);
            } break;
            case 1: {
                PLAYERFN_SET(PlayerCB_8025A0C);
            } break;
            case 2: {
                p->moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(PlayerCB_Jump);
            } break;
            case 3: {
                p->moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(PlayerCB_8025F84);
            } break;
            case 6: {
                PLAYERFN_SET(PlayerCB_8028D74);
            } break;
            case 5: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(PlayerCB_8026060);
            } break;
            case 4: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(PlayerCB_802611C);
            } break;
            case 7: {
                PLAYERFN_SET(PlayerCB_801225C);
            } break;
            case 8: {
                PLAYERFN_SET(PlayerCB_8027250);
            } break;
            case 9: {
                if (gGameMode == GAME_MODE_TIME_ATTACK) {
                    gUnknown_03005424 |= EXTRA_STATE__TURN_OFF_TIMER;
                }

                if (p->moveState
                    & (MOVESTATE_20000000 | MOVESTATE_10000000 | MOVESTATE_2000
                       | MOVESTATE_8 | MOVESTATE_IN_AIR)) {
                    p->moveState |= (MOVESTATE_8000000 | MOVESTATE_IGNORE_INPUT);
                    p->unk5C = 0;
                    p->unk5E = 0;
                } else {
                    // _080243D0
                    p->moveState |= MOVESTATE_8000000;
                    PLAYERFN_SET(PlayerCB_80273D0);
                }
            } break;
            case 13: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 14: {
                if (!GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 15: {
                p->unk6E |= 0x20;
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 16: {
                p->unk6E |= 0x30;
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 17: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x60;
                } else {
                    p->unk6E |= 0x40;
                }
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 18: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x70;
                } else {
                    p->unk6E |= 0x50;
                }
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 19: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x40;
                } else {
                    p->unk6E |= 0x60;
                }
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 20: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x50;
                } else {
                    p->unk6E |= 0x70;
                }
                PLAYERFN_SET(PlayerCB_8028E24);
            } break;
            case 21: {
                PLAYERFN_SET(PlayerCB_8029158);
            } break;
            case 23: {
                PLAYERFN_SET(PlayerCB_802A300);
            } break;
            case 10: {
                PLAYERFN_SET(PlayerCB_8026764);
            } break;
            case 11: {
                PLAYERFN_SET(PlayerCB_80269C0);
            } break;
            case 12: {
                PLAYERFN_SET(PlayerCB_8026A4C);
            } break;
            case 22: {
                PLAYERFN_SET(PlayerCB_802A258);
            } break;
            case 24: {
                PLAYERFN_SET(PlayerCB_8026E24);
            } break;
            case 27: {
                PLAYERFN_SET(PlayerCB_8026F10);
            } break;
            case 25: {
                PLAYERFN_SET(PlayerCB_8026FC8);
            } break;
            case 26: {
                PLAYERFN_SET(PlayerCB_8027114);
            } break;
        }
    }

    p->unk6F = p->unk6D;
    p->unk6D = 0;
}

#if 0
void sub_802486C(Player *player, UNK_03005AF0 *p2)
{
    
}
#endif