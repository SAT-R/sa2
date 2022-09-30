#include "time_attack_mode_select.h"
#include "main.h"
#include "sprite.h"
#include "transition.h"
#include "save.h"
#include "task.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "title_screen.h"
#include "game.h"
#include "character_select.h"

struct TimeAttackModeSelectionScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 infoText;
    struct UNK_802D4CC_UNK270 unk140;
    u8 animFrame;
    u8 unk14D;
    u8 unk14E;
    u8 filler14F;
};

static void Task_FadeInAndStartIntro(void);
static void Task_IntroUIAnim(void);

static void Task_ScreenMain(void);
static void RenderUI(struct TimeAttackModeSelectionScreen* modeScreen);

static void Task_FadeOutModeSelected(void);
static void Task_FadeOutToTitleScreen(void);
static void Task_HandleModeSelectedExit(void);

static void TimeAttackModeSelectionScreenOnDestroy(struct Task*);

const struct UNK_080E0D64 gUnknown_080E0384[30] = {
    TextElementAlt4(1, 12, 1057),
    TextElementAlt4(2, 8, 1057),
    TextElementAlt4(3, 168, 1057),
    TextElementAlt4(4, 168, 1057),
    TextElementAlt4(5, 168, 1057),

    TextElementAlt4(3, 12, 1058),
    TextElementAlt4(4, 12, 1058),
    TextElementAlt4(0, 168, 1058),
    TextElementAlt4(1, 168, 1058),
    TextElementAlt4(2, 168, 1058),

    TextElementAlt4(3, 12, 1058),
    TextElementAlt4(4, 12, 1058),
    TextElementAlt4(0, 168, 1059),
    TextElementAlt4(1, 168, 1059),
    TextElementAlt4(2, 168, 1059),

    TextElementAlt4(3, 12, 1058),
    TextElementAlt4(4, 12, 1058),
    TextElementAlt4(0, 168, 1060),
    TextElementAlt4(1, 168, 1060),
    TextElementAlt4(2, 168, 1060),

    TextElementAlt4(3, 12, 1058),
    TextElementAlt4(4, 12, 1058),
    TextElementAlt4(0, 168, 1061),
    TextElementAlt4(1, 168, 1061),
    TextElementAlt4(2, 168, 1061),

    TextElementAlt4(3, 12, 1058),
    TextElementAlt4(4, 12, 1058),
    TextElementAlt4(0, 168, 1062),
    TextElementAlt4(1, 168, 1062),
    TextElementAlt4(2, 168, 1062),
};

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
    
    t = TaskCreate(Task_FadeInAndStartIntro, sizeof(struct TimeAttackModeSelectionScreen), 0x2000, 0, TimeAttackModeSelectionScreenOnDestroy);
    modeScreen = TaskGetStructPtr(t);

    modeScreen->animFrame = 0;
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
    element->unk4 = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 0)].unk0);
    element->unkA = gUnknown_080E0384[TextElementOffset(lang, 5, 0)].unk4;
    element->unk20 = gUnknown_080E0384[TextElementOffset(lang, 5, 0)].unk6;
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
    element->unk4 = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 1)].unk0);
    element->unkA = gUnknown_080E0384[TextElementOffset(lang, 5, 1)].unk4;
    element->unk20 = gUnknown_080E0384[TextElementOffset(lang, 5, 1)].unk6;
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

    element = &modeScreen->infoText;
    element->unk4 = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 2)].unk0);
    element->unkA = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].unk4;
    element->unk20 = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].unk6;
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

void Task_IntroSweepAnim(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, modeScreen->animFrame * 20 + 700);

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 0;
        gCurTask->main = Task_IntroUIAnim;
    }

    if (--modeScreen->animFrame == 0) {
        modeScreen->animFrame = 0;
        gCurTask->main = Task_IntroUIAnim;
    }
}

static void Task_IntroUIAnim(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element;
    if (++modeScreen->animFrame == 32) {
        modeScreen->unk14E = 1;
        gCurTask->main = Task_ScreenMain;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 31;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);

    element = &modeScreen->unk80;
    if (modeScreen->animFrame < 10) {
        element->unk16 = modeScreen->animFrame * 10 - 50;
    } else {
        element->unk16 = 0x32;
    }
    element->unk18 = 10;

    element = &modeScreen->unkB0;
    if (modeScreen->animFrame < 10) {
        element->unk16 = -0x50;
    } else if (modeScreen->animFrame < 0x14) {
        element->unk16 = (modeScreen->animFrame * 16) - 250;
    } else {
        element->unk16 = 0x46;
    }
    element->unk18 = 0x3C;

    element = &modeScreen->unkE0;
    if (modeScreen->animFrame < 0x14) {
        element->unk16 = -0x5A;
    } else  if (modeScreen->animFrame < 0x1E) {
        element->unk16 = (modeScreen->animFrame * 16) - 400;
    } else {
        element->unk16 = 0x50;
    }
    element->unk18 = 0x4C;
    RenderUI(modeScreen);
}

static void Task_ScreenMain(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* transitionConfig;
    struct UNK_0808B3FC_UNK240* element;
    s8 lang;
    
    if (gPressedKeys & A_BUTTON) {
        if (modeScreen->unk14D && !gLoadedSaveGame->unk12) {
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
            gCurTask->main = Task_FadeOutModeSelected;
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
        gCurTask->main = Task_FadeOutToTitleScreen;
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

        element = &modeScreen->infoText;
        if (gLoadedSaveGame->unk12) {
            element->unkA = gUnknown_080E0384[TextElementOffset(lang, 5, 3)].unk4;
            element->unk20 = gUnknown_080E0384[TextElementOffset(lang, 5, 3)].unk6;
        } else {
            element->unkA = gUnknown_080E0384[TextElementOffset(lang, 5, 4)].unk4;
            element->unk20 = gUnknown_080E0384[TextElementOffset(lang, 5, 4)].unk6;
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

        element = &modeScreen->infoText;
        element->unkA = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].unk4;
        element->unk20 = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].unk6;
        element->unk21 = 0xFF;
    }
    RenderUI(modeScreen);
}

static void Task_FadeOutModeSelected(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        gMultiSioEnabled = TRUE;
        gCurTask->main = Task_HandleModeSelectedExit;
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void*)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);
    RenderUI(modeScreen);
}

static void Task_FadeOutToTitleScreen(void) {
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
    RenderUI(modeScreen);
}

static void Task_FadeInAndStartIntro(void) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(gCurTask);
     if (sub_802D4CC(&modeScreen->unk140) == 1) {
        modeScreen->animFrame = 0xF;
        gCurTask->main = Task_IntroSweepAnim;
     }
}

static void Task_HandleModeSelectedExit(void) {
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

static void RenderUI(struct TimeAttackModeSelectionScreen* modeScreen) {
    struct UNK_0808B3FC_UNK240* element;
    element = &modeScreen->unk80;
    sub_80051E8(element);
    element = &modeScreen->unkB0;
    sub_80051E8(element);
    element = &modeScreen->unkE0;
    sub_80051E8(element);

    if (modeScreen->unk14E != 0) {
        element = &modeScreen->infoText;
        sub_8004558(element);
        sub_80051E8(element);
    }
}

static void TimeAttackModeSelectionScreenOnDestroy(struct Task* t) {
    struct TimeAttackModeSelectionScreen* modeScreen = TaskGetStructPtr(t);
    VramFree(modeScreen->unk80.unk4);
    VramFree(modeScreen->unkB0.unk4);
    VramFree(modeScreen->unkE0.unk4);
    VramFree(modeScreen->infoText.unk4);
}
