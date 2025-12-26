#include "global.h"
#include "m4a.h"
#include "input.h"

void GetInput(void)
{
    u16 prevInput = gInput.unk0;
    u16 r6 = gInput.unk2;
    u16 input = REG_KEYINPUT | 0xFC00;

    gInput.unk2 = input;
    gInput.unk0 = ~input;

    if (!(gUnknown_03003330.unkF & 0x40)
        && (~input & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) == (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) {
        m4aMPlayAllStop();
        m4aSoundMain();
        VBlankIntrWait();
        m4aSoundVSyncOff();
        REG_IME = 0;
        REG_IE = 0;
        SoftResetRom(0x20);
    }

    gInput.unk4 = (r6 & gInput.unk0);

    if (gInput.unk0 == 0) {
        gInput.unk6 = 0;
        return;
    }

    if (gInput.unk0 > prevInput) {
        gInput.unk6 = (prevInput ^ gInput.unk0);
        gInput.unk8 = gInput.unk9;
        return;
    }

    if (--gInput.unk8 != 0) {
        gInput.unk6 = 0;
        return;
    }

    gInput.unk6 = gInput.unk0;
    gInput.unk8 = gInput.unkA;
}

void InputInit(void)
{
    gInput.unk6 = 0;
    gInput.unk4 = 0;
    gInput.unk0 = 0;
    gInput.unk2 = 0xFFFF;
    gInput.unk9 = 0xF;
    gInput.unk8 = 0xF;
    gInput.unkA = 7;
}
