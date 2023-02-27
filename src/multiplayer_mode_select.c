#include "global.h"
#include "multiplayer_mode_select.h"
#include "multiplayer_multipak_connection.h"
#include "multiplayer_singlepak_connection.h"
#include "game/save.h"
#include "engine/core.h"
#include "lib/multi_sio.h"
#include "engine/task.h"
#include "engine/sprite.h"
#include "engine/malloc_vram.h"
#include "transition.h"
#include "lib/m4a.h"
#include "flags.h"
#include "title_screen.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

#define PAK_MODE_MULTI  0
#define PAK_MODE_SINGLE 1

struct MultiplayerModeSelectScreen {
    Background unk0;
    Background unk40;

    Sprite unk80;
    Sprite unkB0;
    Sprite unkE0;
    Sprite subText;

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

static const TileInfo sMultiplayerModeSelectScreenText[] = {
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
    Sprite *element;
    Background *unk0;

    u8 lang = gLoadedSaveGame->language * 4;
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

    element = &modeScreen->unk80;
    element->graphics.dest = VramMalloc(0x32);
    element->graphics.anim = SA2_ANIM_VS;
    element->variant = 0;
    element->unk21 = 0xFF;
    element->x = 0;
    element->y = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &modeScreen->unkB0;
    element->graphics.dest = VramMalloc(sMultiplayerModeSelectScreenText[lang].numTiles);
    element->graphics.anim = sMultiplayerModeSelectScreenText[lang].anim;
    element->variant = sMultiplayerModeSelectScreenText[lang].variant;
    element->unk21 = 0xFF;

    element->x = 0;
    element->y = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &modeScreen->unkE0;
    element->graphics.dest
        = VramMalloc(sMultiplayerModeSelectScreenText[lang + 1].numTiles);
    element->graphics.anim = sMultiplayerModeSelectScreenText[lang + 1].anim;
    element->variant = sMultiplayerModeSelectScreenText[lang + 1].variant;
    element->unk21 = 0xFF;

    element->x = 0;
    element->y = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &modeScreen->subText;
    element->graphics.dest
        = VramMalloc(sMultiplayerModeSelectScreenText[lang + 2].numTiles);
    element->graphics.anim = sMultiplayerModeSelectScreenText[lang + 2].anim;
    element->variant = sMultiplayerModeSelectScreenText[lang + 2].variant;
    element->unk21 = 0xFF;

    element->x = 8;
    element->y = 103;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;

    unk0 = &modeScreen->unk0;
    unk0->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    unk0->graphics.anim = 0;
    unk0->tilesVram = (void *)BG_SCREEN_ADDR(20);
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
    unk0->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    unk0->graphics.anim = 0;
    unk0->tilesVram = (void *)BG_SCREEN_ADDR(22);
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
    Sprite *unk80;
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
        unk80->x = modeScreen->animFrame * 0xC - 0x14;
    } else {
        unk80->x = 100;
    }
    unk80->y = 10;
    unk80 = &modeScreen->unkB0;
    if (modeScreen->animFrame < 10) {
        unk80->x = -(DISPLAY_WIDTH / 3);
    } else if (modeScreen->animFrame < 20) {
        unk80->x = modeScreen->animFrame * 0x10 - DISPLAY_WIDTH;
    } else {
        unk80->x = (DISPLAY_WIDTH / 3);
    }
    unk80->y = (DISPLAY_HEIGHT * (3. / 8.));

    unk80 = &modeScreen->unkE0;

    if (modeScreen->animFrame < 20) {
        unk80->x = -90;
    } else if (modeScreen->animFrame < 30) {
        unk80->x = modeScreen->animFrame * 0x10 - 410;
    } else {
        unk80->x = 70;
    }
    unk80->y = 0x55;
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
        Sprite *subText;
        u8 lang = gLoadedSaveGame->language * 4;
        modeScreen->unkB0.focused = 1;
        modeScreen->unkE0.focused = 0xFF;

        subText = &modeScreen->subText;
        subText->graphics.anim = sMultiplayerModeSelectScreenText[lang + 3].anim;
        subText->variant = sMultiplayerModeSelectScreenText[lang + 3].variant;
        subText->unk21 = 0xFF;
    } else {
        Sprite *subText;
        u8 lang = gLoadedSaveGame->language * 4;
        modeScreen->unkB0.focused = 0;
        modeScreen->unkE0.focused = 0;
        subText = &modeScreen->subText;
        subText->graphics.anim = sMultiplayerModeSelectScreenText[lang + 2].anim;
        subText->variant = sMultiplayerModeSelectScreenText[lang + 2].variant;
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
    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;

    if (pakMode == PAK_MODE_MULTI) {
        StartMultiPakConnect();
    } else {
        StartSinglePakConnect();
    }
}

static void RenderUI(struct MultiplayerModeSelectScreen *modeScreen)
{
    Sprite *unk80 = &modeScreen->unk80;
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
    VramFree(modeScreen->unk80.graphics.dest);
    VramFree(modeScreen->unkB0.graphics.dest);
    VramFree(modeScreen->unkE0.graphics.dest);
    VramFree(modeScreen->subText.graphics.dest);
}
