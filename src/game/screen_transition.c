#include "core.h"
#include "game/game.h"
#include "game/screen_transition.h"

u8 NextTransitionFrame(struct TransitionState *transition)
{
    if (transition->unk0 != 0) {
        gDispCnt |= DISPCNT_WIN1_ON;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x1F;
    } else {
        gDispCnt |= DISPCNT_WIN0_ON;
        gWinRegs[0] = 0xF0;
        gWinRegs[2] = 0xA0;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
    }

    gBldRegs.bldCnt = transition->unk8;
    gBldRegs.bldAlpha = transition->unkA;

    if (transition->unk2 & 1) {
        gBldRegs.bldY = Q_8_8_TO_INT(transition->unk4);
    } else {
        gBldRegs.bldY = 32 - Q_8_8_TO_INT(transition->unk4);
    }

    if (gBldRegs.bldY > 31) {
        gBldRegs.bldY = 32;
    }

    gBldRegs.bldY >>= 1;

    transition->unk4 += transition->speed;

    if (transition->unk4 >= Q_8_8(32)) {
        transition->unk4 = Q_8_8(32);
        return SCREEN_TRANSITION_COMPLETE;
    } else {
        return SCREEN_TRANSITION_RUNNING;
    }
}

void sub_802D5A0(struct TransitionState *transition)
{
    if (transition->unk0 != 0) {
        gDispCnt |= DISPCNT_WIN1_ON;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x1F;
    } else {
        gDispCnt |= DISPCNT_WIN0_ON;
        gWinRegs[0] = 0xF0;
        gWinRegs[2] = 0xA0;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
    }

    gBldRegs.bldCnt = transition->unk8;
    gBldRegs.bldAlpha = transition->unkA;

    if (transition->unk2 & 1) {
        gBldRegs.bldY = Q_8_8_TO_INT(transition->unk4);
    } else {
        gBldRegs.bldY = 32 - Q_8_8_TO_INT(transition->unk4);
    }

    if (gBldRegs.bldY > 31) {
        gBldRegs.bldY = 32;
    }

    gBldRegs.bldY >>= 1;
}
