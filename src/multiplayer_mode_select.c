#include "global.h"
#include "multiplayer_mode_select.h"
#include "multiplayer.h"
#include "save.h"
#include "data.h"
#include "multi_sio.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "data.h"
#include "m4a.h"
#include "constants/songs.h"
#include "flags.h"
#include "input.h"
#include "title_screen.h"

struct MultiplayerModeScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;

    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 unk110;

    struct UNK_802D4CC_UNK270 unk140;

    // animFrame
    u8 unk14C;

    u8 unk14D;
    u8 unk14E;
};

void sub_805A9B0(void);
void sub_805AA94(struct Task*);

extern const struct UNK_080E0D64 gUnknown_080D8F70[28];

void sub_805A1CC(void) {
    struct Task* t;
    struct MultiplayerModeScreen* modeScreen;
    struct UNK_802D4CC_UNK270* unk140;
    struct UNK_0808B3FC_UNK240* unk80;
    struct Unk_03002400* unk0;

    u8 lang = gLoadedSaveGame->unk6 * 4;
    gDispCnt = 0;
    gDispCnt |= 0x1341;
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gBgCntRegs[1] = 0x560C;
    gBgCntRegs[0] = 0x1401;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_805A9B0, 0x150, 0x2000, 0, sub_805AA94);
    modeScreen = TaskGetStructPtr(t, modeScreen);
    modeScreen->unk14C = 0;
    modeScreen->unk14D = 0;
    modeScreen->unk14E = 0;

    unk140 = &modeScreen->unk140;
    unk140->unk0 = 1;
    unk140->unk4 = 0;
    unk140->unk2 = 2;
    unk140->unk6 = 0x100;
    unk140->unk8 = 0x3FFF;
    unk140->unkA = 0;
    sub_802D4CC(unk140);

    unk80 = &modeScreen->unk80;
    unk80->unk4 = sub_8007C10(0x32);
    unk80->unkA = 0x431;
    unk80->unk20 = 0;
    unk80->unk21 = 0xFF;
    unk80->unk16 = 0;
    unk80->unk18 = 0;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0x1000;
    sub_8004558(unk80);

    unk80 = &modeScreen->unkB0;
    unk80->unk4 = sub_8007C10(gUnknown_080D8F70[lang].unk0);
    unk80->unkA = gUnknown_080D8F70[lang].unk4;
    unk80->unk20 = gUnknown_080D8F70[lang].unk6;
    unk80->unk21 = 0xFF;

    unk80->unk16 = 0;
    unk80->unk18 = 0;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0x1000;
    sub_8004558(unk80);

    unk80 = &modeScreen->unkE0;
    unk80->unk4 = sub_8007C10(gUnknown_080D8F70[lang + 1].unk0);
    unk80->unkA = gUnknown_080D8F70[lang + 1].unk4;
    unk80->unk20 = gUnknown_080D8F70[lang + 1].unk6;
    unk80->unk21 = 0xFF;

    unk80->unk16 = 0;
    unk80->unk18 = 0;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0x1000;
    sub_8004558(unk80);

    unk80 = &modeScreen->unk110;
    unk80->unk4 = sub_8007C10(gUnknown_080D8F70[lang + 2].unk0);
    unk80->unkA = gUnknown_080D8F70[lang + 2].unk4;
    unk80->unk20 = gUnknown_080D8F70[lang + 2].unk6;
    unk80->unk21 = 0xFF;

    unk80->unk16 = 8;
    unk80->unk18 = 0x67;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0;

    unk0 = &modeScreen->unk0;
    unk0->unk4 = BG_SCREEN_ADDR(0);
    unk0->unkA = 0;
    unk0->unkC = BG_SCREEN_ADDR(20);
    unk0->unk18 = 0;
    unk0->unk1A = 0;
    unk0->unk1C = 0x6E;
    unk0->unk1E = 0;
    unk0->unk20 = 0;
    unk0->unk22 = 0;
    unk0->unk24 = 0;
    unk0->unk26 = 0x20;
    unk0->unk28 = 0x20;
    unk0->unk2A = 0;
    unk0->unk2E = 0;
    sub_8002A3C(unk0);

    unk0 = &modeScreen->unk40;
    unk0->unk4 = BG_SCREEN_ADDR(24);
    unk0->unkA = 0;
    unk0->unkC = BG_SCREEN_ADDR(22);
    unk0->unk18 = 0;
    unk0->unk18 = 0;
    unk0->unk18 = 0;
    unk0->unk1A = 0;
    unk0->unk1C = 0x6F;
    unk0->unk1E = 0;
    unk0->unk20 = 0;
    unk0->unk22 = 0;
    unk0->unk24 = 0;
    unk0->unk26 = 0x20;
    unk0->unk28 = 0x20;
    unk0->unk2A = 0;
    unk0->unk2E = 1;
    sub_8002A3C(unk0);
    m4aSongNumStart(MUS_VS_SELECT_PAK_MODE);
}

extern void sub_802EFDC(u32);
extern void sub_802E164(u16, u16);
void sub_805A598(void);
void sub_805A4F8(void) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, (0x10 - modeScreen->unk14C) * 20);
    if (gPressedKeys & A_BUTTON) {
        modeScreen->unk14C = 0;
        gCurTask->main = sub_805A598;
    }

    if (--modeScreen->unk14C == 0) {
        modeScreen->unk14C = 0;
        gCurTask->main = sub_805A598;
    }
}

void sub_805A6C0(void);
void sub_805AA50(struct MultiplayerModeScreen*);
void sub_805A598(void) {
    struct UNK_0808B3FC_UNK240* unk80;
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    if (++modeScreen->unk14C == 32) {
        modeScreen->unk14E = 1;
        gCurTask->main = sub_805A6C0;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->unk14C = 31;
    }

    // TODO: make a macro
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    unk80 = &modeScreen->unk80;
    if (modeScreen->unk14C < 10) {
        unk80->unk16 = modeScreen->unk14C * 0xC - 0x14;
    } else {
        unk80->unk16 = 100;
    }
    unk80->unk18 = 10;
    unk80 = &modeScreen->unkB0;
    if (modeScreen->unk14C < 10) {
        unk80->unk16 = -0x50;
    } else if (modeScreen->unk14C < 20) {
        unk80->unk16 = modeScreen->unk14C * 0x10 - 0xF0;
    } else {
        unk80->unk16 = 0x50;
    }
    unk80->unk18 = 0x3C;

    unk80 = &modeScreen->unkE0;
    
    if (modeScreen->unk14C < 20) {
        unk80->unk16 = -0x5A;
    } else if (modeScreen->unk14C < 30) {
        unk80->unk16 = modeScreen->unk14C * 0x10 - 0x19A;
    } else {
        unk80->unk16 = 0x46;
    }
    unk80->unk18 = 0x55;
    sub_805AA50(modeScreen);
}

void sub_805A878(void);
void sub_805A918(void);

void sub_805A6C0(void) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    struct UNK_802D4CC_UNK270* unk140;
    if (gPressedKeys & A_BUTTON) {
        unk140 = &modeScreen->unk140;
        unk140->unk0 = 1;
        unk140->unk4 = 0;
        unk140->unk2 = 1;
        unk140->unk6 = 0x100;
        unk140->unk8 = 0x3FFF;
        unk140->unkA = 0;
        m4aSongNumStart(SE_SELECT);
        MultiSioStop();
        MultiSioInit(0);
        gCurTask->main = sub_805A878;
    } else if (gPressedKeys & B_BUTTON) {
        unk140 = &modeScreen->unk140;
        unk140->unk0 = 1;
        unk140->unk4 = 0;
        unk140->unk2 = 1;
        unk140->unk6 = 0x100;
        unk140->unk8 = 0x3FFF;
        unk140->unkA = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = sub_805A918;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    if (gPressedKeys & (DPAD_DOWN | DPAD_UP)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        modeScreen->unk14D ^= 1;
    }

    if (modeScreen->unk14D != 0) {
        struct UNK_0808B3FC_UNK240* unk110;
        u8 lang = gLoadedSaveGame->unk6 * 4;
        modeScreen->unkB0.unk25 = 1;
        modeScreen->unkE0.unk25 = 0xFF;

        unk110 = &modeScreen->unk110;
        unk110->unkA = gUnknown_080D8F70[lang + 3].unk4;
        unk110->unk20 = gUnknown_080D8F70[lang + 3].unk6;
        unk110->unk21 = 0xFF;
    } else {
        struct UNK_0808B3FC_UNK240* unk110;
        u8 lang = gLoadedSaveGame->unk6 * 4;
        modeScreen->unkB0.unk25 = 0;
        modeScreen->unkE0.unk25 = 0;
        unk110 = &modeScreen->unk110;
        unk110->unkA = gUnknown_080D8F70[lang + 2].unk4;
        unk110->unk20 = gUnknown_080D8F70[lang +2].unk6;
        unk110->unk21 = 0xFF;   
    }
    
    sub_805AA50(modeScreen);
}

void sub_805A9EC(void);

void sub_805A878(void) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        gMultiSioEnabled = TRUE;
        gCurTask->main = sub_805A9EC;
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    sub_805AA50(modeScreen);
}


void sub_805A918(void) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        CreateTitleScreenAtPlayModeMenu();
        TaskDestroy(gCurTask);
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    sub_805AA50(modeScreen);
}

void sub_805A9B0(void) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        modeScreen->unk14C = 0xF;
        gCurTask->main = sub_805A4F8;
    }
}

extern void sub_808129C(void);

void sub_805A9EC(void) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(gCurTask, modeScreen);
    u8 unk14D = modeScreen->unk14D;
    TasksDestroyAll();

    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;

    if (unk14D == 0) {
        sub_805AAD8();
    } else {
        sub_808129C();
    }
}

void sub_805AA50(struct MultiplayerModeScreen* modeScreen) {
    struct UNK_0808B3FC_UNK240* unk80 = &modeScreen->unk80; 
    sub_80051E8(unk80);
    unk80++;
    sub_80051E8(unk80);
    unk80++;
    sub_80051E8(unk80);
    if (modeScreen->unk14E) {
        unk80++;
        sub_8004558(unk80);
        sub_80051E8(unk80);
    };
}

void sub_805AA94(struct Task* t) {
    struct MultiplayerModeScreen* modeScreen = TaskGetStructPtr(t, modeScreen);
    sub_8007CF0(modeScreen->unk80.unk4);
    sub_8007CF0(modeScreen->unkB0.unk4);
    sub_8007CF0(modeScreen->unkE0.unk4);
    sub_8007CF0(modeScreen->unk110.unk4);
}
