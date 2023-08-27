#include "game/time_attack/mode_select.h"
#include "core.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "game/save.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "game/title_screen.h"
#include "game/game.h"
#include "game/character_select.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct TimeAttackModeSelectionScreen {
    Background unk0;
    Background unk40;
    Sprite unk80;
    Sprite unkB0;
    Sprite unkE0;
    Sprite infoText;
    struct TransitionState unk140;
    u8 animFrame;
    u8 unk14D;
    u8 unk14E;
    u8 filler14F;
};

static void Task_FadeInAndStartIntro(void);
static void Task_IntroUIAnim(void);

static void Task_ScreenMain(void);
static void RenderUI(struct TimeAttackModeSelectionScreen *modeScreen);

static void Task_FadeOutModeSelected(void);
static void Task_FadeOutToTitleScreen(void);
static void Task_HandleModeSelectedExit(void);

static void TimeAttackModeSelectionScreenOnDestroy(struct Task *);

const TileInfo gUnknown_080E0384[30] = {
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_ZONE, 12, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_BOSS, 8, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_CLEAR, 168, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_DEFEAT, 168, SA2_ANIM_TIME_ATTACK_JP),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_JP_CANT_PLAY, 168, SA2_ANIM_TIME_ATTACK_JP),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168,
                    SA2_ANIM_TIME_ATTACK_EN),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_DE),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_DE),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168,
                    SA2_ANIM_TIME_ATTACK_DE),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_FR),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_FR),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168,
                    SA2_ANIM_TIME_ATTACK_FR),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_ES),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_ES),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168,
                    SA2_ANIM_TIME_ATTACK_ES),

    TextElementAlt4(SA2_ANIM_VARIANT_TA_ZONE, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_BOSS, 12, SA2_ANIM_TIME_ATTACK_EN),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP, 168, SA2_ANIM_TIME_ATTACK_IT),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP, 168, SA2_ANIM_TIME_ATTACK_IT),
    TextElementAlt4(SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET, 168,
                    SA2_ANIM_TIME_ATTACK_IT),
};

void CreateTimeAttackModeSelectionScreen(void)
{
    struct Task *t;
    struct TimeAttackModeSelectionScreen *modeScreen;
    struct TransitionState *transition;
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

    t = TaskCreate(Task_FadeInAndStartIntro,
                   sizeof(struct TimeAttackModeSelectionScreen), 0x2000, 0,
                   TimeAttackModeSelectionScreenOnDestroy);
    modeScreen = TaskGetStructPtr(t);

    modeScreen->animFrame = 0;
    modeScreen->unk14D = 0;
    modeScreen->unk14E = 0;

    transition = &modeScreen->unk140;
    transition->unk0 = 1;
    transition->unk4 = Q_8_8(0);
    transition->unk2 = 2;
    transition->speed = 0x100;
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;

    NextTransitionFrame(transition);

    s = &modeScreen->unk80;
    s->graphics.dest = VramMalloc(0x6C);
    s->graphics.anim = SA2_ANIM_TIME_ATTACK_JP;
    s->variant = SA2_ANIM_VARIANT_TA_TITLE;
    s->prevVariant = -1;
    s->x = 0;
    s->y = 0;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x1000;
    UpdateSpriteAnimation(s);

    s = &modeScreen->unkB0;
    s->graphics.dest
        = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 0)].numTiles);
    s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 0)].anim;
    s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 0)].variant;
    s->prevVariant = -1;
    s->x = 0;
    s->y = 0;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x1000;
    UpdateSpriteAnimation(s);

    s = &modeScreen->unkE0;
    s->graphics.dest
        = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 1)].numTiles);
    s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 1)].anim;
    s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 1)].variant;
    s->prevVariant = -1;
    s->x = 0;
    s->y = 0;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x1000;
    UpdateSpriteAnimation(s);

    s = &modeScreen->infoText;
    s->graphics.dest
        = VramMalloc(gUnknown_080E0384[TextElementOffset(lang, 5, 2)].numTiles);
    s->graphics.anim = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].anim;
    s->variant = gUnknown_080E0384[TextElementOffset(lang, 5, 2)].variant;
    s->prevVariant = -1;
    s->x = 8;
    s->y = 103;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;

    background = &modeScreen->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_TA_AND_MP_WHITE_BG;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    sub_8002A3C(background);

    background = &modeScreen->unk40;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_TA_ORANGE_BG;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    sub_8002A3C(background);

    m4aSongNumStart(MUS_TIME_ATTACK_MENU);
}

void Task_IntroSweepAnim(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;

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

static void Task_IntroUIAnim(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);
    Sprite *s;
    if (++modeScreen->animFrame == 32) {
        modeScreen->unk14E = 1;
        gCurTask->main = Task_ScreenMain;
    }

    if (gPressedKeys & A_BUTTON) {
        modeScreen->animFrame = 31;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x1300;
    gWinRegs[5] = 0x11;

    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);

    s = &modeScreen->unk80;
    if (modeScreen->animFrame < 10) {
        s->x = modeScreen->animFrame * 10 - 50;
    } else {
        s->x = 50;
    }
    s->y = 10;

    s = &modeScreen->unkB0;
    if (modeScreen->animFrame < 10) {
        s->x = -80;
    } else if (modeScreen->animFrame < 20) {
        s->x = (modeScreen->animFrame * 16) - 250;
    } else {
        s->x = 70;
    }
    s->y = 60;

    s = &modeScreen->unkE0;
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
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition;
    Sprite *s;
    s8 lang;

    if (gPressedKeys & A_BUTTON) {
        if (modeScreen->unk14D && !gLoadedSaveGame->bossTimeAttackUnlocked) {
            m4aSongNumStart(SE_ABORT);
        } else {
            transition = &modeScreen->unk140;
            transition->unk0 = 1;
            transition->unk4 = Q_8_8(0);
            transition->unk2 = 1;
            transition->speed = 0x100;
            transition->unk8 = 0x3FFF;
            transition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutModeSelected;
        }
    } else if (gPressedKeys & B_BUTTON) {
        transition = &modeScreen->unk140;
        transition->unk0 = 1;
        transition->unk4 = Q_8_8(0);
        transition->unk2 = 1;
        transition->speed = 0x100;
        transition->unk8 = 0x3FFF;
        transition->unkA = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_FadeOutToTitleScreen;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;

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
        lang = gLoadedSaveGame->language - 1;
        if (lang < 0) {
            lang = 0;
        }

        s = &modeScreen->unkB0;
        s->palId = 1;

        s = &modeScreen->unkE0;
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
        s = &modeScreen->unkB0;
        s->palId = 0;

        s = &modeScreen->unkE0;
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
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);

    if (NextTransitionFrame(&modeScreen->unk140) == SCREEN_TRANSITION_COMPLETE) {
        gFlags &= ~0x4;
        gMultiSioEnabled = TRUE;
        gCurTask->main = Task_HandleModeSelectedExit;
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;

    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);
    RenderUI(modeScreen);
}

static void Task_FadeOutToTitleScreen(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);

    if (NextTransitionFrame(&modeScreen->unk140) == SCREEN_TRANSITION_COMPLETE) {
        gFlags &= ~0x4;
        CreateTitleScreenAtSinglePlayerMenu();
        TaskDestroy(gCurTask);
        return;
    }

    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN1H;

    gWinRegs[4] = 0x3300;
    gWinRegs[5] = 0x31;

    gFlags |= 0x4;
    sub_802EFDC(0xF0);
    sub_802E044(0x6400, 700);
    RenderUI(modeScreen);
}

static void Task_FadeInAndStartIntro(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);
    if (NextTransitionFrame(&modeScreen->unk140) == SCREEN_TRANSITION_COMPLETE) {
        modeScreen->animFrame = 0xF;
        gCurTask->main = Task_IntroSweepAnim;
    }
}

static void Task_HandleModeSelectedExit(void)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(gCurTask);

    if (modeScreen->unk14D != 0) {
        gGameMode = GAME_MODE_BOSS_TIME_ATTACK;
    } else {
        gGameMode = GAME_MODE_TIME_ATTACK;
    }

    TasksDestroyAll();
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
    CreateCharacterSelectionScreen(0, gLoadedSaveGame->unlockedCharacters & 0x10);
}

static void RenderUI(struct TimeAttackModeSelectionScreen *modeScreen)
{
    Sprite *s;
    s = &modeScreen->unk80;
    DisplaySprite(s);
    s = &modeScreen->unkB0;
    DisplaySprite(s);
    s = &modeScreen->unkE0;
    DisplaySprite(s);

    if (modeScreen->unk14E != 0) {
        s = &modeScreen->infoText;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void TimeAttackModeSelectionScreenOnDestroy(struct Task *t)
{
    struct TimeAttackModeSelectionScreen *modeScreen = TaskGetStructPtr(t);
    VramFree(modeScreen->unk80.graphics.dest);
    VramFree(modeScreen->unkB0.graphics.dest);
    VramFree(modeScreen->unkE0.graphics.dest);
    VramFree(modeScreen->infoText.graphics.dest);
}
