#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "multi_sio.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/multiplayer/mode_select.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/multiboot/connection.h"
#include "game/save.h"
#include "game/stage/screen_fade.h"
#include "game/stage/boss_results_transition.h"
#include "game/title_screen.h"
#include "game/stage/game_7.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

#define PAK_MODE_MULTI  0
#define PAK_MODE_SINGLE 1

struct MultiplayerModeSelectScreen {
    Background unk0;
    Background unk40;

    Sprite unk80;
    Sprite unkB0;
    Sprite unkE0;
    Sprite subText;

    ScreenFade fade;

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
    TextElementAlt(4, LANG_DEFAULT, 1, 38, 1073),   TextElementAlt(4, LANG_DEFAULT, 2, 32, 1073),
    TextElementAlt(4, LANG_DEFAULT, 3, 168, 1073),  TextElementAlt(4, LANG_DEFAULT, 4, 168, 1073),
    TextElementAlt(4, LANG_JAPANESE, 1, 38, 1073),  TextElementAlt(4, LANG_JAPANESE, 2, 32, 1073),
    TextElementAlt(4, LANG_JAPANESE, 3, 168, 1073), TextElementAlt(4, LANG_JAPANESE, 4, 168, 1073),
    TextElement(4, LANG_ENGLISH, 0, 36, 1094),      TextElement(4, LANG_ENGLISH, 1, 38, 1094),
    TextElement(4, LANG_ENGLISH, 2, 168, 1094),     TextElement(4, LANG_ENGLISH, 3, 168, 1094),
    TextElement(4, LANG_GERMAN, 0, 34, 1095),       TextElement(4, LANG_GERMAN, 1, 28, 1095),
    TextElement(4, LANG_GERMAN, 2, 168, 1095),      TextElement(4, LANG_GERMAN, 3, 168, 1095),
    TextElement(4, LANG_FRENCH, 0, 36, 1096),       TextElement(4, LANG_FRENCH, 1, 32, 1096),
    TextElement(4, LANG_FRENCH, 2, 168, 1096),      TextElement(4, LANG_FRENCH, 3, 168, 1096),
    TextElement(4, LANG_SPANISH, 0, 36, 1097),      TextElement(4, LANG_SPANISH, 1, 36, 1097),
    TextElement(4, LANG_SPANISH, 2, 168, 1097),     TextElement(4, LANG_SPANISH, 3, 168, 1097),
    TextElement(4, LANG_ITALIAN, 0, 36, 1098),      TextElement(4, LANG_ITALIAN, 1, 36, 1098),
    TextElement(4, LANG_ITALIAN, 2, 168, 1098),     TextElement(4, LANG_ITALIAN, 3, 168, 1098),
};

void CreateMultiplayerModeSelectScreen(void)
{
    struct Task *t;
    struct MultiplayerModeSelectScreen *modeScreen;
    ScreenFade *fade;
    Sprite *s;
    Background *background;

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

    t = TaskCreate(Task_FadeInAndStartEnterAnim, sizeof(struct MultiplayerModeSelectScreen), 0x2000, 0,
                   MultiplayerModeSelectScreenOnDestroy);
    modeScreen = TASK_DATA(t);
    modeScreen->animFrame = 0;
    modeScreen->pakMode = PAK_MODE_MULTI;
    modeScreen->enterAnimDone = FALSE;

    fade = &modeScreen->fade;
    fade->window = 1;
    fade->brightness = Q(0.0);
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->speed = Q(1.0);
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;
    UpdateScreenFade(fade);

    s = &modeScreen->unk80;
    s->graphics.dest = VramMalloc(0x32);
    s->graphics.anim = SA2_ANIM_VS;
    s->variant = 0;
    s->prevVariant = -1;
    s->x = 0;
    s->y = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    s = &modeScreen->unkB0;
    s->graphics.dest = VramMalloc(sMultiplayerModeSelectScreenText[lang].numTiles);
    s->graphics.anim = sMultiplayerModeSelectScreenText[lang].anim;
    s->variant = sMultiplayerModeSelectScreenText[lang].variant;
    s->prevVariant = -1;

    s->x = 0;
    s->y = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    s = &modeScreen->unkE0;
    s->graphics.dest = VramMalloc(sMultiplayerModeSelectScreenText[lang + 1].numTiles);
    s->graphics.anim = sMultiplayerModeSelectScreenText[lang + 1].anim;
    s->variant = sMultiplayerModeSelectScreenText[lang + 1].variant;
    s->prevVariant = -1;

    s->x = 0;
    s->y = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    s = &modeScreen->subText;
    s->graphics.dest = VramMalloc(sMultiplayerModeSelectScreenText[lang + 2].numTiles);
    s->graphics.anim = sMultiplayerModeSelectScreenText[lang + 2].anim;
    s->variant = sMultiplayerModeSelectScreenText[lang + 2].variant;
    s->prevVariant = -1;

    s->x = 8;
    s->y = 103;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;

    background = &modeScreen->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_TA_AND_MP_WHITE_BG;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &modeScreen->unk40;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk18 = 0;
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_ORANGE_BG;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);
    m4aSongNumStart(MUS_VS_SELECT_PAK_MODE);
}

static void Task_EnterAnimPart1(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    gHBlankCopySize = 2;
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
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
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    if (++modeScreen->animFrame == 32) {
        modeScreen->enterAnimDone = TRUE;
        gCurTask->main = Task_ScreenMain;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 31;
    }

    // TODO: make a macro
    gHBlankCopySize = 2;
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
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
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    ScreenFade *fade;
    if (gPressedKeys & A_BUTTON) {
        fade = &modeScreen->fade;
        fade->window = 1;
        fade->brightness = 0;
        fade->flags = 1;
        fade->speed = 0x100;
        fade->bldCnt = 0x3FFF;
        fade->bldAlpha = 0;
        m4aSongNumStart(SE_SELECT);
#ifndef JAPAN
        MultiSioStop();
        MultiSioInit(0);
#endif
        gCurTask->main = Task_FadeOutToSelectedMode;
    } else if (gPressedKeys & B_BUTTON) {
        fade = &modeScreen->fade;
        fade->window = 1;
        fade->brightness = 0;
        fade->flags = 1;
        fade->speed = 0x100;
        fade->bldCnt = 0x3FFF;
        fade->bldAlpha = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_FadeOutAndExitToTitleScreen;
    }

    gHBlankCopySize = 2;
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    sub_802E164(0x6400, 0x140);

    if (gPressedKeys & (DPAD_DOWN | DPAD_UP)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        modeScreen->pakMode ^= 1;
    }

    if (modeScreen->pakMode != PAK_MODE_MULTI) {
        Sprite *subText;
        u8 lang = gLoadedSaveGame->language * 4;
        modeScreen->unkB0.palId = 1;
        modeScreen->unkE0.palId = 0xFF;

        subText = &modeScreen->subText;
        subText->graphics.anim = sMultiplayerModeSelectScreenText[lang + 3].anim;
        subText->variant = sMultiplayerModeSelectScreenText[lang + 3].variant;
        subText->prevVariant = -1;
    } else {
        Sprite *subText;
        u8 lang = gLoadedSaveGame->language * 4;
        modeScreen->unkB0.palId = 0;
        modeScreen->unkE0.palId = 0;
        subText = &modeScreen->subText;
        subText->graphics.anim = sMultiplayerModeSelectScreenText[lang + 2].anim;
        subText->variant = sMultiplayerModeSelectScreenText[lang + 2].variant;
        subText->prevVariant = -1;
    }

    RenderUI(modeScreen);
}

static void Task_FadeOutToSelectedMode(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    if (UpdateScreenFade(&modeScreen->fade) == SCREEN_FADE_COMPLETE) {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        gMultiSioEnabled = TRUE;
        gCurTask->main = Task_ExitAndInitSelectedPakMode;
        return;
    }

    gHBlankCopySize = 2;
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    sub_802E164(0x6400, 0x140);

    RenderUI(modeScreen);
}

static void Task_FadeOutAndExitToTitleScreen(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    if (UpdateScreenFade(&modeScreen->fade) == SCREEN_FADE_COMPLETE) {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        CreateTitleScreenAtPlayModeMenu();
        TaskDestroy(gCurTask);
        return;
    }

    gHBlankCopySize = 2;
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;
    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    sub_802E164(0x6400, 0x140);

    RenderUI(modeScreen);
}

static void Task_FadeInAndStartEnterAnim(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    if (UpdateScreenFade(&modeScreen->fade) == SCREEN_FADE_COMPLETE) {
        modeScreen->animFrame = 15;
        gCurTask->main = Task_EnterAnimPart1;
    }
}

static void Task_ExitAndInitSelectedPakMode(void)
{
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(gCurTask);
    u8 pakMode = modeScreen->pakMode;
    TasksDestroyAll();

    PAUSE_BACKGROUNDS_QUEUE();
    gUnknown_03005390 = 0;
    PAUSE_GRAPHICS_QUEUE();

    if (pakMode == PAK_MODE_MULTI) {
        StartMultiPakConnect();
    } else {
        StartSinglePakConnect();
    }
}

static void RenderUI(struct MultiplayerModeSelectScreen *modeScreen)
{
    Sprite *unk80 = &modeScreen->unk80;
    DisplaySprite(unk80);
    unk80++;
    DisplaySprite(unk80);
    unk80++;
    DisplaySprite(unk80);
    if (modeScreen->enterAnimDone) {
        unk80++;
        UpdateSpriteAnimation(unk80);
        DisplaySprite(unk80);
    };
}

static void MultiplayerModeSelectScreenOnDestroy(struct Task *t)
{
    struct MultiplayerModeSelectScreen *modeScreen = TASK_DATA(t);
    VramFree(modeScreen->unk80.graphics.dest);
    VramFree(modeScreen->unkB0.graphics.dest);
    VramFree(modeScreen->unkE0.graphics.dest);
    VramFree(modeScreen->subText.graphics.dest);
}
