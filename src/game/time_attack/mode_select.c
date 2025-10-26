#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "task.h"
#include "flags.h"
#include "lib/m4a/m4a.h"
#include "game/character_select.h"
#include "game/stage/boss_results_transition.h"
#include "game/save.h"
#include "game/time_attack/mode_select.h"
#include "game/stage/screen_fade.h"
#include "game/title_screen.h"
#include "game/stage/screen_mask.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct TimeAttackModeSelectionScreen {
    Background unk0;
    Background unk40;
    Sprite title;
    Sprite zoneItem;
    Sprite bossItem;
    Sprite infoText;
    ScreenFade fade;
    u8 animFrame;
    u8 unk14D;
    u8 unk14E;
};

static void Task_FadeInAndStartIntro(void);
static void Task_IntroUIAnim(void);

static void Task_ScreenMain(void);
static void RenderUI(struct TimeAttackModeSelectionScreen *modeScreen);

static void Task_FadeOutModeSelected(void);
static void Task_FadeOutToTitleScreen(void);
static void Task_HandleModeSelectedExit(void);

static void TimeAttackModeSelectionScreenOnDestroy(struct Task *);

const TileInfo gUnknown_080E0384[] = {
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_ZONE, 12, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_BOSS, 8, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_CLEAR, 168, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_DEFEAT, 168, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_CANT_PLAY, 168, SA2_ANIM_TIME_ATTACK_JP),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168, SA2_ANIM_TIME_ATTACK_EN),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_DE),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_DE),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168, SA2_ANIM_TIME_ATTACK_DE),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_FR),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_FR),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168, SA2_ANIM_TIME_ATTACK_FR),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_ES),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_ES),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168, SA2_ANIM_TIME_ATTACK_ES),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_IT),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_IT),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168, SA2_ANIM_TIME_ATTACK_IT),
};

void CreateTimeAttackModeSelectionScreen(void)
{
    struct Task *t;
    struct TimeAttackModeSelectionScreen *modeScreen;
    ScreenFade *fade;
    Sprite *s;
    Background *background;

    s8 lang = gLoadedSaveGame->language - 1;
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

    t = TaskCreate(Task_FadeInAndStartIntro, sizeof(struct TimeAttackModeSelectionScreen), 0x2000, 0,
                   TimeAttackModeSelectionScreenOnDestroy);
    modeScreen = TASK_DATA(t);

    modeScreen->animFrame = 0;
    modeScreen->unk14D = 0;
    modeScreen->unk14E = 0;

    fade = &modeScreen->fade;
    fade->window = 1;
    fade->brightness = Q_8_8(0);
    fade->flags = 2;
    fade->speed = Q_8_8(1);
    fade->bldCnt = 0x3FFF;
    fade->bldAlpha = 0;

    UpdateScreenFade(fade);

    s = &modeScreen->title;
    s->graphics.dest = VramMalloc(0x6C);
    s->graphics.anim = SA2_ANIM_TIME_ATTACK_JP;
    s->variant = SA2_ANIM_VARIANT_TA_TITLE;
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
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
    UpdateSpriteAnimation(s);

    s = &modeScreen->zoneItem;
    s->graphics.dest = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 0)].numTiles);
    s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 0)].anim;
    s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 0)].variant;
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

    s = &modeScreen->bossItem;
    s->graphics.dest = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 1)].numTiles);
    s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 1)].anim;
    s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 1)].variant;
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

    s = &modeScreen->infoText;
    s->graphics.dest = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 2)].numTiles);
    s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].anim;
    s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].variant;
    s->prevVariant = -1;
    s->x = DISPLAY_WIDTH / 2 - 112;
    s->y = DISPLAY_HEIGHT - 57;
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
    background->unk1A = 0;
    background->tilemapId = TM_TA_ORANGE_BG;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);

    m4aSongNumStart(MUS_TIME_ATTACK_MENU);
}

void Task_IntroSweepAnim(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);

    gHBlankCopySize = sizeof(winreg_t);
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;

    gWinRegs[WINREG_WININ] = 0x1300;
    gWinRegs[WINREG_WINOUT] = 0x11;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    ScreenMask_Right_OriginBottom(Q(100), modeScreen->animFrame * DEG_TO_SIN(7.03125) + DEG_TO_SIN(246.09375));

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 0;
        gCurTask->main = Task_IntroUIAnim;
    }

    if (--modeScreen->animFrame == 0) {
        modeScreen->animFrame = 0;
        gCurTask->main = Task_IntroUIAnim;
    }
}

static void Task_IntroUIAnim(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);
    Sprite *s;
    if (++modeScreen->animFrame == 32) {
        modeScreen->unk14E = 1;
        gCurTask->main = Task_ScreenMain;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 31;
    }

    gHBlankCopySize = sizeof(winreg_t);
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;

    gWinRegs[WINREG_WININ] = 0x1300;
    gWinRegs[WINREG_WINOUT] = 0x11;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    ScreenMask_Right_OriginBottom(Q(100), DEG_TO_SIN(246.09375));

    s = &modeScreen->title;
    if (modeScreen->animFrame < 10) {
        s->x = modeScreen->animFrame * 10 - 50;
    } else {
        s->x = 50;
    }
    s->y = 10;

    s = &modeScreen->zoneItem;
    if (modeScreen->animFrame < 10) {
        s->x = -80;
    } else if (modeScreen->animFrame < 20) {
        s->x = (modeScreen->animFrame * 16) - 250;
    } else {
        s->x = 70;
    }
    s->y = 60;

    s = &modeScreen->bossItem;
    if (modeScreen->animFrame < 20) {
        s->x = -90;
    } else if (modeScreen->animFrame < 30) {
        s->x = (modeScreen->animFrame * 16) - 400;
    } else {
        s->x = 80;
    }
    s->y = 76;
    RenderUI(modeScreen);
}

static void Task_ScreenMain(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);
    ScreenFade *fade;
    Sprite *s;
    s8 lang;

    if (gPressedKeys & A_BUTTON) {
        if (modeScreen->unk14D && !gLoadedSaveGame->bossTimeAttackUnlocked) {
            m4aSongNumStart(SE_ABORT);
        } else {
            fade = &modeScreen->fade;
            fade->window = 1;
            fade->brightness = Q_8_8(0);
            fade->flags = 1;
            fade->speed = 0x100;
            fade->bldCnt = 0x3FFF;
            fade->bldAlpha = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutModeSelected;
        }
    } else if (gPressedKeys & B_BUTTON) {
        fade = &modeScreen->fade;
        fade->window = 1;
        fade->brightness = Q_8_8(0);
        fade->flags = 1;
        fade->speed = 0x100;
        fade->bldCnt = 0x3FFF;
        fade->bldAlpha = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_FadeOutToTitleScreen;
    }

    gHBlankCopySize = sizeof(winreg_t);
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;

    gWinRegs[WINREG_WININ] = 0x1300;
    gWinRegs[WINREG_WINOUT] = 0x11;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    ScreenMask_Right_OriginBottom(Q(100), DEG_TO_SIN(246.09375));

    if (gPressedKeys & (DPAD_UP | DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        modeScreen->unk14D ^= 1;
    }

    if (modeScreen->unk14D) {
        lang = gLoadedSaveGame->language - 1;
        if (lang < 0) {
            lang = 0;
        }

        s = &modeScreen->zoneItem;
        s->palId = 1;

        s = &modeScreen->bossItem;
        s->palId = 0xFF;

        s = &modeScreen->infoText;
        if (gLoadedSaveGame->bossTimeAttackUnlocked) {
            s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 3)].anim;
            s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 3)].variant;
        } else {
            s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 4)].anim;
            s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 4)].variant;
        }
        s->prevVariant = -1;
    } else {
        lang = gLoadedSaveGame->language - 1;
        if (lang < 0) {
            lang = 0;
        }
        s = &modeScreen->zoneItem;
        s->palId = 0;

        s = &modeScreen->bossItem;
        s->palId = 0;

        s = &modeScreen->infoText;
        s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].anim;
        s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].variant;
        s->prevVariant = -1;
    }
    RenderUI(modeScreen);
}

static void Task_FadeOutModeSelected(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&modeScreen->fade) == SCREEN_FADE_COMPLETE) {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        gMultiSioEnabled = TRUE;
        gCurTask->main = Task_HandleModeSelectedExit;
        return;
    }

    gHBlankCopySize = sizeof(winreg_t);
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;

    gWinRegs[WINREG_WININ] = 0x3300;
    gWinRegs[WINREG_WINOUT] = 0x31;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    ScreenMask_Right_OriginBottom(Q(100), DEG_TO_SIN(246.09375));
    RenderUI(modeScreen);
}

static void Task_FadeOutToTitleScreen(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&modeScreen->fade) == SCREEN_FADE_COMPLETE) {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        CreateTitleScreenAtSinglePlayerMenu();
        TaskDestroy(gCurTask);
        return;
    }

    gHBlankCopySize = sizeof(winreg_t);
    gHBlankCopyTarget = (void *)REG_ADDR_WIN1H;

    gWinRegs[WINREG_WININ] = 0x3300;
    gWinRegs[WINREG_WINOUT] = 0x31;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    InitHBlankBgOffsets(DISPLAY_WIDTH);
    ScreenMask_Right_OriginBottom(Q(100), DEG_TO_SIN(246.09375));
    RenderUI(modeScreen);
}

static void Task_FadeInAndStartIntro(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);
    if (UpdateScreenFade(&modeScreen->fade) == SCREEN_FADE_COMPLETE) {
        modeScreen->animFrame = 0xF;
        gCurTask->main = Task_IntroSweepAnim;
    }
}

static void Task_HandleModeSelectedExit(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(gCurTask);

    if (modeScreen->unk14D != 0) {
        gGameMode = GAME_MODE_BOSS_TIME_ATTACK;
    } else {
        gGameMode = GAME_MODE_TIME_ATTACK;
    }

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gUnknown_03005390 = 0;
    PAUSE_GRAPHICS_QUEUE();
    CreateCharacterSelectionScreen(0, gLoadedSaveGame->unlockedCharacters & 0x10);
}

static void RenderUI(struct TimeAttackModeSelectionScreen *modeScreen)
{
    Sprite *s;
    s = &modeScreen->title;
    DisplaySprite(s);
    s = &modeScreen->zoneItem;
    DisplaySprite(s);
    s = &modeScreen->bossItem;
    DisplaySprite(s);

    if (modeScreen->unk14E != 0) {
        s = &modeScreen->infoText;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void TimeAttackModeSelectionScreenOnDestroy(struct Task *t)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TASK_DATA(t);
    VramFree(modeScreen->title.graphics.dest);
    VramFree(modeScreen->zoneItem.graphics.dest);
    VramFree(modeScreen->bossItem.graphics.dest);
    VramFree(modeScreen->infoText.graphics.dest);
}
