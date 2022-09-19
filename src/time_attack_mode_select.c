#include "time_attack_mode_select.h"
#include "main.h"
#include "sprite.h"
#include "transition.h"
#include "save.h"
#include "task.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "constants/songs.h"
#include "title_screen.h"
#include "game.h"
#include "character_select.h"

struct TimeAttackModeSelectionScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 unk110;
    struct UNK_802D4CC_UNK270 unk140;
    u8 unk14C;
    u8 unk14D;
    u8 unk14E;
    u8 filler14F;
};

void sub_8088800(void);
void sub_8088900(struct Task*);

extern const struct UNK_080E0D64 gUnknown_080E0384[30];

void CreateTimeAttackModeSelectionScreen(void) {
    struct Task* t;
    struct TimeAttackModeSelectionScreen* modeScreen;
    struct UNK_802D4CC_UNK270* transitionConfig;
    struct UNK_0808B3FC_UNK240* element;
    struct Unk_03002400* background;

    s8 lang = gLoadedSaveGame->unk6 - 1;
    if (lang < 0) {
        lang = 0;
    }

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
    
    t = TaskCreate(sub_8088800, 0x150, 0x2000, 0, sub_8088900);
    modeScreen = TaskGetStructPtr(t);

    modeScreen->unk14C = 0;
    modeScreen->unk14D = 0;
    modeScreen->unk14E = 0;

    transitionConfig = &modeScreen->unk140;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 2;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

    sub_802D4CC(transitionConfig);

    element = &modeScreen->unk80;
    element->unk4 = VramMalloc(0x6C);
    element->unkA = 0x421;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &modeScreen->unkB0;
    element->unk4 = VramMalloc(gUnknown_080E0384[lang * 5].unk0);
    element->unkA = gUnknown_080E0384[lang * 5].unk4;
    element->unk20 = gUnknown_080E0384[lang * 5].unk6;
    element->unk21 = 0xFF;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &modeScreen->unkE0;
    element->unk4 = VramMalloc(gUnknown_080E0384[1 + lang * 5].unk0);
    element->unkA = gUnknown_080E0384[1 + lang * 5].unk4;
    element->unk20 = gUnknown_080E0384[1 + lang * 5].unk6;
    element->unk21 = 0xFF;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &modeScreen->unk110;
    element->unk4 = VramMalloc(gUnknown_080E0384[2 + lang * 5].unk0);
    element->unkA = gUnknown_080E0384[2 + lang * 5].unk4;
    element->unk20 = gUnknown_080E0384[2 + lang * 5].unk6;
    element->unk21 = 0xFF;
    element->unk16 = 8;
    element->unk18 = 0x67;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;

    background = &modeScreen->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x6E;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &modeScreen->unk40;
    background->unk4 = BG_SCREEN_ADDR(24);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x70;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    m4aSongNumStart(MUS_TIME_ATTACK_MENU);
}

void sub_802EFDC(u32);
void sub_802E044(u16, u16);

void sub_8088398(void);

void sub_80882F8(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, modeScreen->unk14C * 20 + 700);

    if (gPressedKeys & A_BUTTON) {
        modeScreen->unk14C = 0;
        gCurTask->main = sub_8088398;
    }

    if (--modeScreen->unk14C == 0) {
        modeScreen->unk14C = 0;
        gCurTask->main = sub_8088398;
    }
}

void sub_80884C0(void);

void sub_80888BC(struct TimeAttackModeSelectionScreen* modeScreen);

void sub_8088398(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element;
    if (++modeScreen->unk14C == 0x20) {
        modeScreen->unk14E = 1;
        gCurTask->main = sub_80884C0;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->unk14C = 0x1F;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);

    element = &modeScreen->unk80;
    if (modeScreen->unk14C < 10) {
        element->unk16 = modeScreen->unk14C * 10 - 0x32;
    } else {
        element->unk16 = 0x32;
    }
    element->unk18 = 10;

    element = &modeScreen->unkB0;
    if (modeScreen->unk14C < 10) {
        element->unk16 = -0x50;
    } else if (modeScreen->unk14C < 0x14) {
        element->unk16 = (modeScreen->unk14C * 0x10) - 0xFA;
    } else {
        element->unk16 = 0x46;
    }
    element->unk18 = 0x3C;

    element = &modeScreen->unkE0;
    if (modeScreen->unk14C < 0x14) {
        element->unk16 = -0x5A;
    } else  if (modeScreen->unk14C < 0x1E) {
        element->unk16 = (modeScreen->unk14C * 0x10) - 400;
    } else {
        element->unk16 = 0x50;
    }
    element->unk18 = 0x4C;
    sub_80888BC(modeScreen);
}

void sub_80886C8(void);
void sub_8088768(void);

void sub_80884C0(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* transitionConfig;
    struct UNK_0808B3FC_UNK240* element;
    s8 lang;
    
    if (gPressedKeys & A_BUTTON) {
        if (modeScreen->unk14D && gLoadedSaveGame->unk12 == 0) {
            m4aSongNumStart(SE_ABORT);
        } else {
            transitionConfig = &modeScreen->unk140;
            transitionConfig->unk0 = 1;
            transitionConfig->unk4 = 0;
            transitionConfig->unk2 = 1;
            transitionConfig->unk6 = 0x100;
            transitionConfig->unk8 = 0x3FFF;
            transitionConfig->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = sub_80886C8;
        }
    } else if (gPressedKeys & B_BUTTON) {
        transitionConfig = &modeScreen->unk140;
        transitionConfig->unk0 = 1;
        transitionConfig->unk4 = 0;
        transitionConfig->unk2 = 1;
        transitionConfig->unk6 = 0x100;
        transitionConfig->unk8 = 0x3FFF;
        transitionConfig->unkA = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = sub_8088768;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);

    if (gPressedKeys & (DPAD_UP | DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        modeScreen->unk14D ^= 1;
    }

    if (modeScreen->unk14D) {
        lang = gLoadedSaveGame->unk6 - 1;
        if (lang < 0) {
            lang = 0;
        }

        element = &modeScreen->unkB0;
        element->unk25 = 1;

        element = &modeScreen->unkE0;
        element->unk25 = 0xFF;

        element = &modeScreen->unk110;
        if (gLoadedSaveGame->unk12 != 0) {
            element->unkA = gUnknown_080E0384[3 + lang * 5].unk4;
            element->unk20 = gUnknown_080E0384[3 + lang * 5].unk6;
        } else {
            element->unkA = gUnknown_080E0384[4 + lang * 5].unk4;
            element->unk20 = gUnknown_080E0384[4 + lang * 5].unk6;
        }
        element->unk21 = 0xFF;
    } else {
        lang = gLoadedSaveGame->unk6 - 1;
        if (lang < 0) {
            lang = 0;
        }
        element = &modeScreen->unkB0;
        element->unk25 = 0;

        element = &modeScreen->unkE0;
        element->unk25 = 0;

        element = &modeScreen->unk110;
        element->unkA = gUnknown_080E0384[2 + lang * 5].unk4;
        element->unk20 = gUnknown_080E0384[2 + lang * 5].unk6;
        element->unk21 = 0xFF;
    }
    sub_80888BC(modeScreen);
}

void sub_808883C(void);

void sub_80886C8(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        gMultiSioEnabled = TRUE;
        gCurTask->main = sub_808883C;
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);
    sub_80888BC(modeScreen);
}


void sub_8088768(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        CreateTitleScreenAtSinglePlayerMenu();
        TaskDestroy(gCurTask);
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);
    sub_80888BC(modeScreen);
}

void sub_8088800(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);
     if (sub_802D4CC(&modeScreen->unk140) == 1) {
        modeScreen->unk14C = 0xF;
        gCurTask->main = sub_80882F8;
     }
}

void sub_808883C(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);

    if (modeScreen->unk14D != 0) {
        gGameMode = GAME_MODE_BOSS_TIME_ATTACK;
    } else {
        gGameMode = GAME_MODE_TIME_ATTACK;
    }

    TasksDestroyAll();
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;
    CreateCharacterSelectionScreen(0, gLoadedSaveGame->unk13 & 0x10);
}

void sub_80888BC(struct TimeAttackModeSelectionScreen* modeScreen) {
    struct UNK_0808B3FC_UNK240* element;
    element = &modeScreen->unk80;
    sub_80051E8(element);
    element = &modeScreen->unkB0;
    sub_80051E8(element);
    element = &modeScreen->unkE0;
    sub_80051E8(element);

    if (modeScreen->unk14E != 0) {
        element = &modeScreen->unk110;
        sub_8004558(element);
        sub_80051E8(element);
    }
}

void sub_8088900(struct Task* t) {
     struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(t);
    VramFree(modeScreen->unk80.unk4);
    VramFree(modeScreen->unkB0.unk4);
    VramFree(modeScreen->unkE0.unk4);
    VramFree(modeScreen->unk110.unk4);
}
