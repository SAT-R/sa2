#include "global.h"
#include "multiplayer_mode_select.h"
#include "multiplayer_multipak_connection.h"
#include "multiplayer_singlepak_connection.h"
#include "save.h"
#include "main.h"
#include "multi_sio.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "transition.h"
#include "m4a.h"
#include "constants/songs.h"
#include "flags.h"
#include "title_screen.h"
#include "constants/text.h"

#define PAK_MODE_MULTI  0
#define PAK_MODE_SINGLE 1

struct MultiplayerModeSelectScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;

    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 subText;

    struct UNK_802D4CC_UNK270 unk140;

    // animFrame
    u8 animFrame;

    u8 pakMode;
    bool8 enterAnimDone;
};

static void Task_FadeInAndStartEnterAnim(void);
static void MultiplayerModeSelectScreenOnDestroy(struct Task *);
static void Task_EnterAnimPart2(void);
static void Task_ScreenMain(void);
static void RenderUI(struct MultiplayerModeSelectScreen *);
static void Task_FadeOutToSelectedMode(void);
static void Task_FadeOutAndExitToTitleScreen(void);
static void Task_ExitAndInitSelectedPakMode(void);

static const struct UNK_080E0D64 sMultiplayerModeSelectScreenText[] = {
    TextElementAlt(4, LANG_DEFAULT, 1, 38, 1073),
    TextElementAlt(4, LANG_DEFAULT, 2, 32, 1073),
    TextElementAlt(4, LANG_DEFAULT, 3, 168, 1073),
    TextElementAlt(4, LANG_DEFAULT, 4, 168, 1073),
    TextElementAlt(4, LANG_JAPANESE, 1, 38, 1073),
    TextElementAlt(4, LANG_JAPANESE, 2, 32, 1073),
    TextElementAlt(4, LANG_JAPANESE, 3, 168, 1073),
    TextElementAlt(4, LANG_JAPANESE, 4, 168, 1073),
    TextElement(4, LANG_ENGLISH, 0, 36, 1094),
    TextElement(4, LANG_ENGLISH, 1, 38, 1094),
    TextElement(4, LANG_ENGLISH, 2, 168, 1094),
    TextElement(4, LANG_ENGLISH, 3, 168, 1094),
    TextElement(4, LANG_GERMAN, 0, 34, 1095),
    TextElement(4, LANG_GERMAN, 1, 28, 1095),
    TextElement(4, LANG_GERMAN, 2, 168, 1095),
    TextElement(4, LANG_GERMAN, 3, 168, 1095),
    TextElement(4, LANG_FRENCH, 0, 36, 1096),
    TextElement(4, LANG_FRENCH, 1, 32, 1096),
    TextElement(4, LANG_FRENCH, 2, 168, 1096),
    TextElement(4, LANG_FRENCH, 3, 168, 1096),
    TextElement(4, LANG_SPANISH, 0, 36, 1097),
    TextElement(4, LANG_SPANISH, 1, 36, 1097),
    TextElement(4, LANG_SPANISH, 2, 168, 1097),
    TextElement(4, LANG_SPANISH, 3, 168, 1097),
    TextElement(4, LANG_ITALIAN, 0, 36, 1098),
    TextElement(4, LANG_ITALIAN, 1, 36, 1098),
    TextElement(4, LANG_ITALIAN, 2, 168, 1098),
    TextElement(4, LANG_ITALIAN, 3, 168, 1098),
};

void CreateMultiplayerModeSelectScreen(void)
{
    struct Task *t;
    struct MultiplayerModeSelectScreen *modeScreen;
    struct UNK_802D4CC_UNK270 *unk140;
    struct UNK_0808B3FC_UNK240 *unk80;
    struct Unk_03002400 *unk0;

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

    t = TaskCreate(Task_FadeInAndStartEnterAnim,
                   sizeof(struct MultiplayerModeSelectScreen), 0x2000, 0,
                   MultiplayerModeSelectScreenOnDestroy);
    modeScreen = TaskGetStructPtr(t);
    modeScreen->animFrame = 0;
    modeScreen->pakMode = PAK_MODE_MULTI;
    modeScreen->enterAnimDone = FALSE;

    unk140 = &modeScreen->unk140;
    unk140->unk0 = 1;
    unk140->unk4 = 0;
    unk140->unk2 = 2;
    unk140->unk6 = 0x100;
    unk140->unk8 = 0x3FFF;
    unk140->unkA = 0;
    sub_802D4CC(unk140);

    unk80 = &modeScreen->unk80;
    unk80->unk4 = VramMalloc(0x32);
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
    unk80->unk4 = VramMalloc(sMultiplayerModeSelectScreenText[lang].unk0);
    unk80->unkA = sMultiplayerModeSelectScreenText[lang].unk4;
    unk80->unk20 = sMultiplayerModeSelectScreenText[lang].unk6;
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
    unk80->unk4 = VramMalloc(sMultiplayerModeSelectScreenText[lang + 1].unk0);
    unk80->unkA = sMultiplayerModeSelectScreenText[lang + 1].unk4;
    unk80->unk20 = sMultiplayerModeSelectScreenText[lang + 1].unk6;
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

    unk80 = &modeScreen->subText;
    unk80->unk4 = VramMalloc(sMultiplayerModeSelectScreenText[lang + 2].unk0);
    unk80->unkA = sMultiplayerModeSelectScreenText[lang + 2].unk4;
    unk80->unk20 = sMultiplayerModeSelectScreenText[lang + 2].unk6;
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

static void Task_EnterAnimPart1(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, (0x10 - modeScreen->animFrame) * 20);
    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 0;
        gCurTask->main = Task_EnterAnimPart2;
    }

    if (--modeScreen->animFrame == 0) {
        modeScreen->animFrame = 0;
        gCurTask->main = Task_EnterAnimPart2;
    }
}

static void Task_EnterAnimPart2(void)
{
    struct UNK_0808B3FC_UNK240 *unk80;
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    if (++modeScreen->animFrame == 32) {
        modeScreen->enterAnimDone = TRUE;
        gCurTask->main = Task_ScreenMain;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 31;
    }

    // TODO: make a macro
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    unk80 = &modeScreen->unk80;
    if (modeScreen->animFrame < 10) {
        unk80->unk16 = modeScreen->animFrame * 0xC - 0x14;
    } else {
        unk80->unk16 = 100;
    }
    unk80->unk18 = 10;
    unk80 = &modeScreen->unkB0;
    if (modeScreen->animFrame < 10) {
        unk80->unk16 = -0x50;
    } else if (modeScreen->animFrame < 20) {
        unk80->unk16 = modeScreen->animFrame * 0x10 - 0xF0;
    } else {
        unk80->unk16 = 0x50;
    }
    unk80->unk18 = 0x3C;

    unk80 = &modeScreen->unkE0;

    if (modeScreen->animFrame < 20) {
        unk80->unk16 = -0x5A;
    } else if (modeScreen->animFrame < 30) {
        unk80->unk16 = modeScreen->animFrame * 0x10 - 0x19A;
    } else {
        unk80->unk16 = 0x46;
    }
    unk80->unk18 = 0x55;
    RenderUI(modeScreen);
}

static void Task_ScreenMain(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *unk140;
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
        gCurTask->main = Task_FadeOutToSelectedMode;
    } else if (gPressedKeys & B_BUTTON) {
        unk140 = &modeScreen->unk140;
        unk140->unk0 = 1;
        unk140->unk4 = 0;
        unk140->unk2 = 1;
        unk140->unk6 = 0x100;
        unk140->unk8 = 0x3FFF;
        unk140->unkA = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_FadeOutAndExitToTitleScreen;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    if (gPressedKeys & (DPAD_DOWN | DPAD_UP)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        modeScreen->pakMode ^= 1;
    }

    if (modeScreen->pakMode != PAK_MODE_MULTI) {
        struct UNK_0808B3FC_UNK240 *subText;
        u8 lang = gLoadedSaveGame->unk6 * 4;
        modeScreen->unkB0.unk25 = 1;
        modeScreen->unkE0.unk25 = 0xFF;

        subText = &modeScreen->subText;
        subText->unkA = sMultiplayerModeSelectScreenText[lang + 3].unk4;
        subText->unk20 = sMultiplayerModeSelectScreenText[lang + 3].unk6;
        subText->unk21 = 0xFF;
    } else {
        struct UNK_0808B3FC_UNK240 *subText;
        u8 lang = gLoadedSaveGame->unk6 * 4;
        modeScreen->unkB0.unk25 = 0;
        modeScreen->unkE0.unk25 = 0;
        subText = &modeScreen->subText;
        subText->unkA = sMultiplayerModeSelectScreenText[lang + 2].unk4;
        subText->unk20 = sMultiplayerModeSelectScreenText[lang + 2].unk6;
        subText->unk21 = 0xFF;
    }

    RenderUI(modeScreen);
}

static void Task_FadeOutToSelectedMode(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        gMultiSioEnabled = TRUE;
        gCurTask->main = Task_ExitAndInitSelectedPakMode;
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    RenderUI(modeScreen);
}

static void Task_FadeOutAndExitToTitleScreen(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        gFlags &= ~0x4;
        CreateTitleScreenAtPlayModeMenu();
        TaskDestroy(gCurTask);
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E164(0x6400, 0x140);

    RenderUI(modeScreen);
}

static void Task_FadeInAndStartEnterAnim(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    if (sub_802D4CC(&modeScreen->unk140) == 1) {
        modeScreen->animFrame = 15;
        gCurTask->main = Task_EnterAnimPart1;
    }
}

static void Task_ExitAndInitSelectedPakMode(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(gCurTask);
    u8 pakMode = modeScreen->pakMode;
    TasksDestroyAll();

    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;

    if (pakMode == PAK_MODE_MULTI) {
        StartMultiPakConnect();
    } else {
        StartSinglePakConnect();
    }
}

static void RenderUI(struct MultiplayerModeSelectScreen *modeScreen)
{
    struct UNK_0808B3FC_UNK240 *unk80 = &modeScreen->unk80;
    sub_80051E8(unk80);
    unk80++;
    sub_80051E8(unk80);
    unk80++;
    sub_80051E8(unk80);
    if (modeScreen->enterAnimDone) {
        unk80++;
        sub_8004558(unk80);
        sub_80051E8(unk80);
    };
}

static void MultiplayerModeSelectScreenOnDestroy(struct Task *t)
{
    struct MultiplayerModeSelectScreen *modeScreen = TaskGetStructPtr(t);
    VramFree(modeScreen->unk80.unk4);
    VramFree(modeScreen->unkB0.unk4);
    VramFree(modeScreen->unkE0.unk4);
    VramFree(modeScreen->subText.unk4);
}
