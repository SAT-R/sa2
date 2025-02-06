#include "global.h"
#include "game/sound_test.h"
#include "core.h"
#include "game/options_screen.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "flags.h"
#include "trig.h"
#include "game/bg_palette_effects.h"
#include "game/stage/screen_fade.h"
#include "data/palettes.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

#define MAX_SOUND_NAME_LENGTH     16
#define NUM_SPEAKER_CONE_SECTIONS 4

struct SoundTestScreen {
    struct OptionsScreen *optionsScreen;
    ScreenFade fade;
    BgPaletteEffectState bgPaletteEffect;

    // Only 1 used, but fits 2
    Background background[2];

    Sprite title;
    Sprite titleTrimAndControls[2];

    // maybe this was originally going to be the back button
    Sprite unused_unk158;

    Sprite scrollArrows;
    Sprite speakerCone[NUM_SPEAKER_CONE_SECTIONS];

    Sprite creams[2];
    Sprite *activeCream;
    Sprite danceStage;
    Sprite backControlName;
    Sprite numberDisplay[3];

    SpriteTransform speakerConeEffects[NUM_SPEAKER_CONE_SECTIONS];

    Sprite nameDisplay[MAX_SOUND_NAME_LENGTH];

    u8 animFrame;

    u32 barBeat;
    u32 songTempo;
    u8 scrollArrowAnimFrame;
    u8 state;

    u8 creamDanceAnimStep;

    u8 soundNumber;
    s8 soundNumAnimSteps[2];

    s16 nameTickerPos;
    s16 speakerSize;
    u8 speakerAnimFrame;

    u8 measurementSound1H;
    u8 measurementSound2H;
    u8 measurementSound3H;
    u8 measurementSound3L;

    u32 freqChanges[8];
    u32 channelFreqs[8];
    u8 language;

#ifdef BUG_FIX
    u8 hblankIrqIndex;
#endif
}; /* size 0x75C */

static void SoundTestScreenCreateUI(struct Task *t);
static void SoundTestScreenInitRegistersAndBackground(struct Task *t);
static void SoundTestScreenRenderUI(void);
static void Task_SoundTestScreenInOutTransition(void);

static void SoundTestScreenOnDestroy(struct Task *t);
static void Task_SoundTestScreenCleanup(void);

static void SoundTestScreenUpdateCreamAnim(void);
static void SoundTestScreenSetNameDisplay(u8);
static void SoundTestScreenSetCreamAnim(u8);
static void SoundTestScreenSetNameDisplayPos(u8, s16, s16);

#define SOUND_TEST_SCREEN_STOPPED 0
#define SOUND_TEST_SCREEN_PLAYING 1
#define SOUND_TEST_SCREEN_EXITING 2

#define CREAM_ANIM_BOW          0
#define CREAM_ANIM_IDLE         1
#define CREAM_ANIM_DANCE_RIGHT  2
#define CREAM_ANIM_DANCE_MIDDLE 3
#define CREAM_ANIM_DANCE_LEFT   4
#define CREAM_ANIM_SOUND_END    5

#define IDLE_CREAM    0
#define DANCING_CREAM 1

#define CREAM_DANCE_STEP_RIGHT         0
#define CREAM_DANCE_STEP_FIRST_MIDDLE  1
#define CREAM_DANCE_STEP_LEFT          2
#define CREAM_DANCE_STEP_SECOND_MIDDLE 3

#define LangOffset(lang)                                     ((lang)*3)
#define TextOffset(langOffset, offset, segment, numSegments) (langOffset * numSegments + (segment * 3) + offset)
#define Text(language, a, b, segment, numSegments)                                                                                         \
    [TextOffset(LangOffset(LanguageIndex(language)), 0, segment, numSegments)]                                                             \
        = a,                                                                                                                               \
        [TextOffset(LangOffset(LanguageIndex(language)), 1, segment, numSegments)]                                                         \
        = b,                                                                                                                               \
        [TextOffset(LangOffset(LanguageIndex(language)), 2, segment, numSegments)] = segment

static const char sSoundNames[68][MAX_SOUND_NAME_LENGTH] = {
    "OPENING         ", "TITLE           ", "CHARACTER SELECT", "ZONE SELECT     ", "ZONE SELECT 2   ", "ZONE SELECT 3   ",
    "TIMEATTACK 1    ", "OPTIONS         ", "ZONE 1-1        ", "ZONE 1-2        ", "ZONE 2-1        ", "ZONE 2-2        ",
    "ZONE 3-1        ", "ZONE 3-2        ", "ZONE 4-1        ", "ZONE 4-2        ", "ZONE 5-1        ", "ZONE 5-2        ",
    "ZONE 6-1        ", "ZONE 6-2        ", "ZONE 7-1        ", "ZONE 7-2        ", "FINAL ZONE      ", "EXTRA ZONE      ",
    "UNRIVAL         ", "DROWN           ", "BOSS            ", "BOSS-PINCH      ", "KNUCKLES BOSS   ", "7-BOSS          ",
    "7-BOSS-PINCH    ", "FINAL BOSS      ", "FINAL BOSS-PINCH", "GAME OVER       ", "FINAL ENDING    ", "EXTRA ENDING    ",
    "STAFF ROLL      ", "DEMO 1          ", "DEMO 2          ", "EXTRA DEMO 1    ", "EXTRA DEMO 2    ", "IN SP STAGE     ",
    "SP STAGE        ", "SP STAGE-PINCH  ", "ACHIEVEMENT     ", "SP CLEAR        ", "SP RESULT 1     ", "SP RESULT 2     ",
    "SP RESULT 3     ", "VS 1            ", "VS 2            ", "VS 4            ", "VS 3            ", "VS WAIT         ",
    "ACT CLEAR       ", "BOSS CLEAR      ", "FINAL CLEAR     ", "EXTRA CLEAR     ", "TIMEATTACK 2    ", "TIMEATTACK 3    ",
    "1_UP            ", "CHARACTER       ", "VS END          ", "VS WAIT         ", "VS WAIT         ", "CAOS EMERALD 7  ",
    "MESSAGE         ", "FANFARE         ",
};

static const u16 sSoundNumberToSongMap[68] = {
    MUS_INTRO,
    MUS_TITLE_FANFARE,
    MUS_CHARACTER_SELECTION,
    MUS_TA_COURSE_SELECTION,
    MUS_COURSE_SELECTION_2,
    MUS_COURSE_SELECTION_3,
    MUS_TIME_ATTACK_MENU,
    MUS_OPTIONS,
    MUS_LEAF_FOREST__ACT_1,
    MUS_LEAF_FOREST__ACT_2,
    MUS_HOT_CRATER__ACT_1,
    MUS_HOT_CRATER__ACT_2,
    MUS_MUSIC_PLANT__ACT_1,
    MUS_MUSIC_PLANT__ACT_2,
    MUS_ICE_PARADISE__ACT_1,
    MUS_ICE_PARADISE__ACT_2,
    MUS_SKY_CANYON__ACT_1,
    MUS_SKY_CANYON__ACT_2,
    MUS_TECHNO_BASE__ACT_1,
    MUS_TECHNO_BASE__ACT_2,
    MUS_EGG_UTOPIA__ACT_1,
    MUS_EGG_UTOPIA__ACT_2,
    MUS_XX__FINAL_ZONE,
    MUS_TRUE_AREA_53,
    MUS_INVINCIBILITY,
    MUS_DROWNING,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_BOSS_KNUCKLES,
    MUS_7_BOSS,
    MUS_7_BOSS_PINCH,
    MUS_FINAL_BOSS,
    MUS_FINAL_BOSS_PINCH,
    MUS_GAME_OVER,
    MUS_FINAL_ENDING,
    MUS_EXTRA_ENDING,
    MUS_STAFF_CREDITS,
    MUS_DEMO_1,
    MUS_DEMO_2,
    MUS_EXTRA_DEMO_1,
    MUS_EXTRA_DEMO_2,
    MUS_SPECIAL_STAGE_INTRO,
    MUS_SPECIAL_STAGE,
    MUS_SPECIAL_STAGE_PINCH,
    MUS_ACHIEVEMENT,
    MUS_SPECIAL_STAGE_CLEAR,
    MUS_SPECIAL_STAGE_RESULT,
    MUS_CHAOS_EMERALD,
    MUS_SPECIAL_STAGE_RESULT_LOSE,
    MUS_VS_SELECT_PAK_MODE,
    MUS_VS_2,
    MUS_VS_LOBBY,
    MUS_VS_3,
    MUS_CONNECTION_PENDING,
    MUS_ACT_CLEAR,
    MUS_BOSS_CLEAR,
    MUS_FINAL_CLEAR,
    MUS_EXTRA_CLEAR,
    MUS_TIME_ATTACK_2,
    MUS_TIME_ATTACK_3,
    MUS_1_UP,
    MUS_GOT_ALL_CHAOS_EMERALDS,
    MUS_VS_EXIT,
    MUS_VS_SUCCESS,
    MUS_VS_MISS,
    MUS_MESSAGE_2,
    MUS_MESSAGE,
    MUS_FANFARE,
};

static const u32 sSoundTempos[67] = {
    Q_20_12(17.5),           Q_20_12(17.5),           Q_20_12(16.0),   Q_20_12(16.0625), Q_20_12(16.6875),    Q_20_12(16.25),
    Q_20_12(15.25),          Q_20_12(15.0),           Q_20_12(20.75),  Q_20_12(20.75),   Q_20_12(21.0234375), Q_20_12(20.4375),
    Q_20_12(16.84228515625), Q_20_12(16.84228515625), Q_20_12(19.0),   Q_20_12(27.0),    Q_20_12(17.8125),    Q_20_12(20.0),
    Q_20_12(20.5),           Q_20_12(21.5),           Q_20_12(20.125), Q_20_12(21.5),    Q_20_12(20.75),      Q_20_12(21.5),
    Q_20_12(16.8203125),     Q_20_12(19.25),          Q_20_12(21.25),  Q_20_12(20.0),    Q_20_12(20.5),       Q_20_12(22.5),
    Q_20_12(23.6875),        Q_20_12(18.0),           Q_20_12(19.125), Q_20_12(16.0),    Q_20_12(17.0),       Q_20_12(22.5),
    Q_20_12(19.0),           Q_20_12(16.0),           Q_20_12(14.75),  Q_20_12(18.875),  Q_20_12(19.0625),    Q_20_12(16.0),
    Q_20_12(21.0),           Q_20_12(22.0),           Q_20_12(21.0),   Q_20_12(20.0),    Q_20_12(26.3125),    Q_20_12(18.0),
    Q_20_12(23.75),          Q_20_12(20.8125),        Q_20_12(20.0),   Q_20_12(21.0),    Q_20_12(16.875),     Q_20_12(20.0),
    Q_20_12(18.0),           Q_20_12(19.0),           Q_20_12(21.0),   Q_20_12(18.0),    Q_20_12(18.0),       Q_20_12(21.0),
    Q_20_12(16.0),           Q_20_12(16.0),           Q_20_12(16.0),   Q_20_12(16.0),    Q_20_12(18.0),       Q_20_12(16.0),
    Q_20_12(20.0),
};

static const u8 sCompletedGameSoundsOrder[63] = {
    0,  1,  2,  3, 8,  9,  10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 26, 27, 28, 29, 30, 31, 32, 54, 55, 56, 33, 24, 25,
    60, 37, 38, 4, 41, 42, 43, 44, 45, 46, 47, 48, 34, 36, 66, 6,  58, 59, 7,  53, 49, 50, 52, 51, 62, 5,  39, 40, 23, 57, 35,
};

static const u8 sSoundsOrder[57] = {
    0,  1,  2,  3,  8,  9,  10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 26, 27, 28, 29, 30, 31, 32, 54, 55, 56,
    33, 24, 25, 60, 37, 38, 4,  41, 42, 43, 44, 45, 46, 47, 48, 34, 36, 66, 6,  58, 59, 7,  53, 49, 50, 52, 51, 62,
};

static const u8 sDigitTransitionAnim[8] = {
    0, 1, 1, 1, 2, 2, 3, 4,
};

static const u8 sBgGradient[] = {
    (u8)(0.0 * DISPLAY_HEIGHT), (u8)(0.1 * DISPLAY_HEIGHT), (u8)(0.2 * DISPLAY_HEIGHT), (u8)(0.3 * DISPLAY_HEIGHT),
    (u8)(0.4 * DISPLAY_HEIGHT), (u8)(0.5 * DISPLAY_HEIGHT), (u8)(0.6 * DISPLAY_HEIGHT), (u8)(0.7 * DISPLAY_HEIGHT),
    (u8)(0.8 * DISPLAY_HEIGHT), (u8)(0.9 * DISPLAY_HEIGHT), (u8)(1.0 * DISPLAY_HEIGHT),
};

static const u32 sTitleText[NUM_LANGUAGES * 3] = {
    Text(LANG_JAPANESE, 42, 967, 0, 1), Text(LANG_ENGLISH, 32, 1030, 0, 1), Text(LANG_GERMAN, 32, 1030, 0, 1),
    Text(LANG_FRENCH, 26, 1031, 0, 1),  Text(LANG_SPANISH, 48, 1032, 0, 1), Text(LANG_ITALIAN, 34, 1033, 0, 1),
};

static const u32 sControlsText[NUM_LANGUAGES * 3] = {
    Text(LANG_JAPANESE, 20, 966, 0, 1), Text(LANG_ENGLISH, 20, 1039, 0, 1), Text(LANG_GERMAN, 20, 1040, 0, 1),
    Text(LANG_FRENCH, 20, 1041, 0, 1),  Text(LANG_SPANISH, 20, 1042, 0, 1), Text(LANG_ITALIAN, 20, 1043, 0, 1),
};

static const u32 sBackButtonText[NUM_LANGUAGES * 3 * 2] = {
    Text(LANG_JAPANESE, 10, 965, 0, 2), Text(LANG_JAPANESE, 10, 965, 1, 2), Text(LANG_ENGLISH, 8, 1034, 0, 2),
    Text(LANG_ENGLISH, 8, 1034, 1, 2),  Text(LANG_GERMAN, 8, 1035, 0, 2),   Text(LANG_GERMAN, 12, 1035, 1, 2),
    Text(LANG_FRENCH, 8, 1036, 0, 2),   Text(LANG_FRENCH, 12, 1036, 1, 2),  Text(LANG_SPANISH, 10, 1037, 0, 2),
    Text(LANG_SPANISH, 10, 1037, 1, 2), Text(LANG_ITALIAN, 8, 1038, 0, 2),  Text(LANG_ITALIAN, 12, 1038, 1, 2),
};

void CreateSoundTestScreen(struct OptionsScreen *optionsScreen)
{
    struct Task *t
        = TaskCreate(Task_SoundTestScreenInOutTransition, sizeof(struct SoundTestScreen), 0x1800, TASK_x0004, SoundTestScreenOnDestroy);
    struct SoundTestScreen *soundTestScreen = TASK_DATA(t);
    ScreenFade *fade;
    BgPaletteEffectState *bgPaletteEffect;
    u32 i;

    fade = &soundTestScreen->fade;
    bgPaletteEffect = &soundTestScreen->bgPaletteEffect;
    m4aMPlayAllStop();

    soundTestScreen->optionsScreen = optionsScreen;
    soundTestScreen->animFrame = 0;
    soundTestScreen->barBeat = 0;
    soundTestScreen->songTempo = 0x10000;
    soundTestScreen->soundNumber = 1;
    soundTestScreen->state = SOUND_TEST_SCREEN_STOPPED;
    soundTestScreen->scrollArrowAnimFrame = 0;
    soundTestScreen->activeCream = &soundTestScreen->creams[IDLE_CREAM];
    soundTestScreen->soundNumAnimSteps[0] = 0;
    soundTestScreen->soundNumAnimSteps[1] = 0;
    soundTestScreen->nameTickerPos = 0;
    soundTestScreen->speakerSize = 0;
    soundTestScreen->speakerAnimFrame = 0;
    soundTestScreen->language = optionsScreen->language;

    for (i = 0; i < 8; i++) {
        soundTestScreen->freqChanges[i] = 0;
        soundTestScreen->channelFreqs[i] = 0;
    }

    ResetProfileScreensVram();
    SoundTestScreenInitRegistersAndBackground(t);
    SoundTestScreenCreateUI(t);

    fade->window = 0;
    fade->flags = 2;
    fade->brightness = 0;
    fade->speed = Q(1.0);
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);

    bgPaletteEffect->unk0 = 0;
    bgPaletteEffect->cursor = 0;
    bgPaletteEffect->unkC = 1;
    bgPaletteEffect->unkD = 1;
    bgPaletteEffect->unkE = 1;
    bgPaletteEffect->bgPalId = 0;

    bgPaletteEffect->pattern = sBgGradient;
    bgPaletteEffect->palette = gBgGradientPalette;

    bgPaletteEffect->offset = 0;

    gBgPaletteEffects.state = bgPaletteEffect;
}

static void SoundTestScreenCreateUI(struct Task *t)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(t);

    Sprite *title = &soundTestScreen->title;
    Sprite *titleTrimAndControls = soundTestScreen->titleTrimAndControls;
    Sprite *backControlName = &soundTestScreen->backControlName;
    Sprite *speakerCone = soundTestScreen->speakerCone;
    Sprite *songNumDisplayElement = soundTestScreen->numberDisplay;
    Sprite *danceStage = &soundTestScreen->danceStage;
    Sprite *animatedCream = soundTestScreen->creams;
    Sprite *scrollArrows = &soundTestScreen->scrollArrows;
    SpriteTransform *transforms = soundTestScreen->speakerConeEffects;

    s16 i, xPos, yPos;

    // jiang: "the language stuff is definitely fake but I don't want to waste my time
    // experimenting expression elimination tricks"
    s8 *language = (s8 *)&soundTestScreen->language;
    const u32 *r6 = sTitleText;
    s32 langOffset = LangOffset(*language);

    sub_806A568(title, RENDER_TARGET_SCREEN, r6[TextOffset(langOffset, 0, 0, 1)], sTitleText[TextOffset(langOffset, 1, 0, 1)], 0x1000, 10,
                16, 5, sTitleText[TextOffset(langOffset, 2, 0, 1)], 0);
    // Trim
    sub_806A568(titleTrimAndControls, RENDER_TARGET_SCREEN, 0x60, 0x3C9, 0x1000, 0, 0, 6, 0, 0);

    titleTrimAndControls++;
    // Controls (play and buttons)
    sub_806A568(titleTrimAndControls, RENDER_TARGET_SCREEN, sControlsText[TextOffset(langOffset, 0, 0, 1)],
                sControlsText[TextOffset(langOffset, 1, 0, 1)], 0x1000, 10, DISPLAY_HEIGHT - 26, 5,
                sControlsText[TextOffset(langOffset, 2, 0, 1)], 0);

    // back button name
    sub_806A568(backControlName, RENDER_TARGET_SCREEN, sBackButtonText[TextOffset(langOffset, 0, 1, 2)],
                sBackButtonText[TextOffset(langOffset, 1, 1, 2)], 0x1000, 90, DISPLAY_HEIGHT - 26, 5,
                sBackButtonText[TextOffset(langOffset, 2, 1, 2)], 0);
    sub_806A568(scrollArrows, RENDER_TARGET_SCREEN, 1, 0x3C5, 0x1000, (DISPLAY_WIDTH / 4) + 30, (DISPLAY_HEIGHT / 2) + 10, 5, 2, 0);

    for (i = 0, xPos = (DISPLAY_WIDTH / 4) + 20, yPos = (DISPLAY_HEIGHT / 2) + 16; i < 3; i++, songNumDisplayElement++, xPos -= 8) {
        if (i == 0) {
            sub_806A568(songNumDisplayElement, RENDER_TARGET_SCREEN, 2, 0x45f, 0x1000, xPos, yPos, 5, 0x11, 0);
        } else {
            sub_806A568(songNumDisplayElement, RENDER_TARGET_SCREEN, 2, 0x45f, 0x1000, xPos, yPos, 5, 0x10, 0);
        }
    }

    for (i = 0; i < 4; i++) {
        sub_806A568(&speakerCone[i], RENDER_TARGET_SCREEN, 0x40, 0x3ce, i | 0x1060, (DISPLAY_WIDTH / 4) + 16, (DISPLAY_HEIGHT / 2) + 10, 6,
                    0, 0);
    }

    // Transforms static circle
    for (i = 0; i < 4; i++) {
        transforms[i].rotation = DEG_TO_SIN(90) * i;
        transforms[i].qScaleX = Q(1);
        transforms[i].qScaleY = Q(1);
        transforms[i].x = (DISPLAY_WIDTH / 4) + 16;
        transforms[i].y = (DISPLAY_HEIGHT / 2) + 10;
    }

    transforms[1].x--;
    transforms[2].y--;
    transforms[2].x--;
    transforms[3].y--;

    sub_806A568(danceStage, RENDER_TARGET_SCREEN, 0x14, 0x3CC, 0x1000, (DISPLAY_WIDTH / 4) * 3, (DISPLAY_HEIGHT / 2) + 60, 6, 0, 4);
    sub_806A568(animatedCream, RENDER_TARGET_SCREEN, 0x40, 0x3CA, 0x1000, (DISPLAY_WIDTH / 4) * 3, (DISPLAY_HEIGHT / 2) + 36, 5, 0, 0);
    animatedCream++;
    sub_806A568(animatedCream, RENDER_TARGET_SCREEN, 0x48, 0x3C8, 0x1000, (DISPLAY_WIDTH / 4) * 3, (DISPLAY_HEIGHT / 2) + 36, 5, 0, 0);

    for (i = 0; i < MAX_SOUND_NAME_LENGTH; i++) {
        sub_806A568(&soundTestScreen->nameDisplay[i], RENDER_TARGET_SCREEN, 2, 0x45F, 0x1000, 0, 0, 5,
                    sSoundNames[sCompletedGameSoundsOrder[0]][i] - 32, 0);
    }
}

static void Task_SoundTestScreenMain(void)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);

    Sprite *numberDisplayDigit = soundTestScreen->numberDisplay;
    Sprite *backControlName = &soundTestScreen->backControlName;
    ScreenFade *fade = &soundTestScreen->fade;

    const u8 *soundsList;
    u8 numSounds;

    if (gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] >= 30) {
        soundsList = sCompletedGameSoundsOrder;
        numSounds = ARRAY_COUNT(sCompletedGameSoundsOrder);
    } else {
        soundsList = sSoundsOrder;
        numSounds = ARRAY_COUNT(sSoundsOrder);
    }

    SoundTestScreenUpdateCreamAnim();

    if (gRepeatedKeys & DPAD_ANY) {
        u8 prevSongNumber = soundTestScreen->soundNumber;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        if (gRepeatedKeys & DPAD_LEFT) {
            soundTestScreen->soundNumber--;
        }

        if (gRepeatedKeys & DPAD_RIGHT) {
            soundTestScreen->soundNumber++;
        }

        if (gRepeatedKeys & DPAD_UP) {
            soundTestScreen->soundNumber += 10;
        }

        if (gRepeatedKeys & DPAD_DOWN) {
            if (soundTestScreen->soundNumber - 10 < 0) {
                soundTestScreen->soundNumber = numSounds;
            } else {
                soundTestScreen->soundNumber -= 10;
            }
        }

        if (soundTestScreen->soundNumber == 0) {
            soundTestScreen->soundNumber = numSounds;
        }

        if (soundTestScreen->soundNumber > numSounds) {
            soundTestScreen->soundNumber = 1;
        }

        // units
        if (soundTestScreen->soundNumber % 10 > prevSongNumber % 10) {
            // Up transiton
            soundTestScreen->soundNumAnimSteps[0] = -7;
        } else if (soundTestScreen->soundNumber % 10 < prevSongNumber % 10) {
            // down transition
            soundTestScreen->soundNumAnimSteps[0] = 7;
        }

        // tens
        if ((soundTestScreen->soundNumber / 10) % 10 > (prevSongNumber / 10) % 10) {
            soundTestScreen->soundNumAnimSteps[1] = -7;
        } else if ((soundTestScreen->soundNumber / 10) % 10 < (prevSongNumber / 10) % 10) {
            soundTestScreen->soundNumAnimSteps[1] = 7;
        }

        numberDisplayDigit[0].variant = soundTestScreen->soundNumber % 10 + 16;
        numberDisplayDigit[1].variant = soundTestScreen->soundNumber / 10 % 10 + 16;
        numberDisplayDigit[2].variant = soundTestScreen->soundNumber / 100 % 10 + 16;

        UpdateSpriteAnimation(&numberDisplayDigit[0]);
        UpdateSpriteAnimation(&numberDisplayDigit[1]);
        UpdateSpriteAnimation(&numberDisplayDigit[2]);

        if (soundTestScreen->state == SOUND_TEST_SCREEN_STOPPED) {
            SoundTestScreenSetNameDisplay(soundsList[soundTestScreen->soundNumber - 1]);
        }
    }

    if (soundTestScreen->state == SOUND_TEST_SCREEN_PLAYING && gMPlayTable[0].info->status == MUSICPLAYER_STATUS_PAUSE) {
        soundTestScreen->state = SOUND_TEST_SCREEN_STOPPED;
        backControlName->variant = 1;
        UpdateSpriteAnimation(backControlName);
        m4aMPlayAllStop();
        soundTestScreen->animFrame = 0;
        soundTestScreen->barBeat = 0;
        SoundTestScreenSetCreamAnim(CREAM_ANIM_SOUND_END);
    }

    if (gPressedKeys & A_BUTTON) {
        u32 songTempo;
        soundTestScreen->songTempo = songTempo = sSoundTempos[soundsList[soundTestScreen->soundNumber - 1]];
        soundTestScreen->creams[DANCING_CREAM].animSpeed = Q_20_12_TO_INT(songTempo);
        m4aMPlayAllStop();

        MPlayStart(&gMPlayInfo_BGM, gSongTable[sSoundNumberToSongMap[soundsList[soundTestScreen->soundNumber - 1]]].header);

        soundTestScreen->state = SOUND_TEST_SCREEN_PLAYING;
        backControlName->variant = 0;
        soundTestScreen->animFrame = 0;
        soundTestScreen->barBeat = 0;
        soundTestScreen->scrollArrowAnimFrame = 0;
        soundTestScreen->creamDanceAnimStep = 0;

        UpdateSpriteAnimation(backControlName);

        SoundTestScreenSetNameDisplay(soundsList[soundTestScreen->soundNumber - 1]);
        SoundTestScreenSetCreamAnim(CREAM_ANIM_DANCE_RIGHT);
    }

    if (gPressedKeys & B_BUTTON) {
        if (soundTestScreen->state == SOUND_TEST_SCREEN_PLAYING) {
            soundTestScreen->state = SOUND_TEST_SCREEN_STOPPED;
            backControlName->variant = 1;
            UpdateSpriteAnimation(backControlName);
            m4aMPlayAllStop();
            soundTestScreen->animFrame = 0;
            soundTestScreen->barBeat = 0;
            SoundTestScreenSetCreamAnim(CREAM_ANIM_SOUND_END);
        } else {
            SoundTestScreenSetCreamAnim(CREAM_ANIM_BOW);
            m4aSongNumStart(SE_RETURN);
            fade->window = 0;
            fade->flags = 1;
            fade->brightness = 0;
            fade->speed = Q(1.0);
            fade->bldAlpha = 0;
            fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);

            soundTestScreen->animFrame = 0;
            soundTestScreen->barBeat = 0;
            soundTestScreen->state = SOUND_TEST_SCREEN_EXITING;
            gCurTask->main = Task_SoundTestScreenInOutTransition;
        }
    }

    if (++soundTestScreen->nameTickerPos > DISPLAY_WIDTH + 160) {
        soundTestScreen->nameTickerPos = 0;
    }

    SoundTestScreenSetNameDisplayPos(soundsList[soundTestScreen->soundNumber - 1], (DISPLAY_WIDTH + 16) - soundTestScreen->nameTickerPos,
                                     DISPLAY_HEIGHT - 2);
    SoundTestScreenRenderUI();
}

static void SoundTestScreenRenderUI(void)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
    Sprite *title = &soundTestScreen->title;
    Sprite *titleTrimAndControls = soundTestScreen->titleTrimAndControls;
    Sprite *backCountrolName = &soundTestScreen->backControlName;
    Sprite *numberDisplayDigit = soundTestScreen->numberDisplay;

    Sprite *sprStage = &soundTestScreen->danceStage;
    Sprite *sprCream = soundTestScreen->activeCream;

    Sprite *scrollArrows = &soundTestScreen->scrollArrows;
    Sprite *speakerConeElement = soundTestScreen->speakerCone;
    SpriteTransform *speakerConeEffects = soundTestScreen->speakerConeEffects;

    struct SoundMixerState *soundInfo;

    s16 i;

    gBgScrollRegs[0][0] += 2;
    gBgScrollRegs[0][1] += 1;

#ifdef BUG_FIX
    soundTestScreen->hblankIrqIndex = gNumHBlankCallbacks;
#endif
    gHBlankCallbacks[gNumHBlankCallbacks++] = BgPaletteEffectGradient;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;

    for (i = 0; i < 2; i++, numberDisplayDigit++) {
        numberDisplayDigit->y = (DISPLAY_HEIGHT / 2) + 16;

        if (soundTestScreen->soundNumAnimSteps[i] != 0) {
            if (soundTestScreen->soundNumAnimSteps[i] > 0) {
                numberDisplayDigit->y = sDigitTransitionAnim[soundTestScreen->soundNumAnimSteps[i]] + (DISPLAY_HEIGHT / 2) + 16;
                soundTestScreen->soundNumAnimSteps[i]--;
            }

            if (soundTestScreen->soundNumAnimSteps[i] < 0) {
                numberDisplayDigit->y = (DISPLAY_HEIGHT / 2) + 16 - sDigitTransitionAnim[-soundTestScreen->soundNumAnimSteps[i]];
                soundTestScreen->soundNumAnimSteps[i]++;
            }
        }

        DisplaySprite(numberDisplayDigit);
    }

    for (i = 0; i < 2; i++, titleTrimAndControls++) {
        DisplaySprite(titleTrimAndControls);
    }

    DisplaySprite(backCountrolName);
    DisplaySprite(title);
    DisplaySprite(sprStage);
    SPRITE_FLAG_SET(sprStage, X_FLIP);
    DisplaySprite(sprStage);
    SPRITE_FLAG_CLEAR(sprStage, X_FLIP);

    if (soundTestScreen->state == SOUND_TEST_SCREEN_PLAYING) {
        u8 numChangeElements = 0;
        u16 amplification = 0;
        u32 testVal;
        testVal = (u32)(*(s16 *)REG_ADDR_SOUND1CNT_H & (SOUND_B_RIGHT_OUTPUT | SOUND_B_LEFT_OUTPUT | SOUND_B_TIMER_1 | SOUND_B_FIFO_RESET))
            >> 0xC;
        if (soundTestScreen->measurementSound1H != testVal) {
            amplification += 32;
            soundTestScreen->speakerAnimFrame = 32;
            soundTestScreen->measurementSound1H = testVal;
            numChangeElements++;
        }

        // Seems to either be broken, or turned off, just have to assume it was to
        // measure sound2
        testVal = 0;
        if (soundTestScreen->measurementSound2H != testVal) {
            amplification += 32;
            soundTestScreen->speakerAnimFrame = 32;
            soundTestScreen->measurementSound2H = testVal;
            numChangeElements++;
        }

        testVal = (u32)(*(s16 *)REG_ADDR_SOUND3CNT_H & (SOUND_B_RIGHT_OUTPUT | SOUND_B_LEFT_OUTPUT | SOUND_B_TIMER_1 | SOUND_B_FIFO_RESET))
            >> 0xC;
        if (soundTestScreen->measurementSound3H != testVal) {
            amplification += 32;
            soundTestScreen->speakerAnimFrame = 32;
            soundTestScreen->measurementSound3H = testVal;
            numChangeElements++;
        }

        testVal = (u32)(*(s16 *)REG_ADDR_SOUND4CNT_L & (SOUND_B_RIGHT_OUTPUT | SOUND_B_LEFT_OUTPUT | SOUND_B_TIMER_1 | SOUND_B_FIFO_RESET))
            >> 0xC;
        if (soundTestScreen->measurementSound3L != testVal) {
            amplification += 32;
            soundTestScreen->speakerAnimFrame = 32;
            soundTestScreen->measurementSound3L = testVal;
            numChangeElements++;
        }

        soundInfo = &gSoundInfo;

        for (i = 0; i < 8; i++) {
            if (soundTestScreen->channelFreqs[i] != soundInfo->chans[i].data.sound.freq) {
                s32 change = soundTestScreen->channelFreqs[i] - soundInfo->chans[i].data.sound.freq;
                if (change - soundTestScreen->freqChanges[i] > 256) {
                    soundTestScreen->speakerSize += 32;
                    soundTestScreen->speakerAnimFrame = 32;
                    numChangeElements++;
                }
                soundTestScreen->freqChanges[i] = change;
                soundTestScreen->channelFreqs[i] = soundInfo->chans[i].data.sound.freq;
            }
        }

        if (numChangeElements > 0) {
            soundTestScreen->speakerSize += amplification / numChangeElements;
        }

        if (soundTestScreen->speakerSize > 192) {
            soundTestScreen->speakerSize = 192;
            soundTestScreen->speakerAnimFrame = 4;
        }
    } else {
        soundTestScreen->speakerSize = 0;
        soundTestScreen->speakerAnimFrame = 0;
    }

    for (i = 0; i < 4; i++) {
        if (sprCream->graphics.anim != SA2_ANIM_SOUNDTEST_CREAM_BOW) {
            speakerConeEffects[i].rotation = DEG_TO_SIN(90) * i;
            speakerConeEffects[i].qScaleY = speakerConeEffects[i].qScaleX = soundTestScreen->speakerSize + 0x100;
        }

        TransformSprite(&speakerConeElement[i], &speakerConeEffects[i]);
    }

    soundTestScreen->speakerSize -= SIN(0x100 - (soundTestScreen->speakerAnimFrame * 4)) >> 8;

    if (soundTestScreen->speakerAnimFrame > 0) {
        soundTestScreen->speakerAnimFrame--;
    }

    if (soundTestScreen->speakerSize < 0) {
        soundTestScreen->speakerSize = 0;
    }

    for (i = 0; i < 4; i++) {
        DisplaySprite(&speakerConeElement[i]);
    }

    DisplaySprite(sprCream);

    scrollArrows->x = ((COS((soundTestScreen->scrollArrowAnimFrame & 15) * 0x10) >> 6) * 5 >> 7) + (DISPLAY_WIDTH / 4) + 34;
    DisplaySprite(scrollArrows);
    scrollArrows->x = (DISPLAY_WIDTH / 4 - 2) - ((COS((soundTestScreen->scrollArrowAnimFrame & 15) * 0x10) >> 6) * 5 >> 7);
    SPRITE_FLAG_SET(scrollArrows, X_FLIP);
    DisplaySprite(scrollArrows);
    SPRITE_FLAG_CLEAR(scrollArrows, X_FLIP);

    soundTestScreen->scrollArrowAnimFrame++;
}

static void Task_SoundTestScreenInOutTransition(void)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
    Sprite *idleCream = &soundTestScreen->creams[IDLE_CREAM];

    soundTestScreen->animFrame++;

    if (soundTestScreen->state == SOUND_TEST_SCREEN_EXITING) {
        UpdateSpriteAnimation(idleCream);
        // Wait for bow animation to finish
        if (soundTestScreen->animFrame > (60 - 16)) {
            UpdateScreenFade(&soundTestScreen->fade);
        }
    } else {
        if (soundTestScreen->animFrame > 20) {
            UpdateSpriteAnimation(idleCream);
        }
        UpdateScreenFade(&soundTestScreen->fade);
    }

    if (soundTestScreen->animFrame > 60) {
        if (soundTestScreen->state == SOUND_TEST_SCREEN_EXITING) {
            gCurTask->main = Task_SoundTestScreenCleanup;
        } else {
            soundTestScreen->animFrame = 0;
            SoundTestScreenSetCreamAnim(CREAM_ANIM_IDLE);
            gCurTask->main = Task_SoundTestScreenMain;
        }
    }

    SoundTestScreenRenderUI();
}

static void SoundTestScreenSetCreamAnim(u8 anim)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
    Sprite *animatedCream = soundTestScreen->activeCream;

    switch (anim) {
        case CREAM_ANIM_BOW:
            soundTestScreen->activeCream = &soundTestScreen->creams[IDLE_CREAM];
            animatedCream = soundTestScreen->activeCream;
            animatedCream->prevVariant = -1;
            animatedCream->variant = 0;
            animatedCream->graphics.anim = SA2_ANIM_SOUNDTEST_CREAM_BOW;
            break;
        case CREAM_ANIM_IDLE:
            soundTestScreen->activeCream = &soundTestScreen->creams[IDLE_CREAM];
            animatedCream = soundTestScreen->activeCream;
            animatedCream->prevVariant = -1;
            animatedCream->variant = 0;
            animatedCream->graphics.anim = SA2_ANIM_SOUNDTEST_CLAP_FORWARD;
            break;
        case CREAM_ANIM_DANCE_RIGHT:
            soundTestScreen->activeCream = &soundTestScreen->creams[DANCING_CREAM];
            animatedCream = soundTestScreen->activeCream;
            animatedCream->frameFlags &= ~0x400;
            animatedCream->variant = SA2_ANIM_VARIANT_SOUNDTEST_CREAM_CLAP_UP_ACTIVE;
            animatedCream->graphics.anim = SA2_ANIM_SOUNDTEST_CREAM_CLAP_UP;
            break;
        case CREAM_ANIM_DANCE_MIDDLE:
            soundTestScreen->activeCream = &soundTestScreen->creams[DANCING_CREAM];
            animatedCream = soundTestScreen->activeCream;
            animatedCream->frameFlags &= ~0x400;
            animatedCream->variant = SA2_ANIM_VARIANT_SOUNDTEST_CREAM_CLAP_UP_HOLDING;
            animatedCream->graphics.anim = SA2_ANIM_SOUNDTEST_CREAM_CLAP_UP;
            break;
        case CREAM_ANIM_DANCE_LEFT:
            soundTestScreen->activeCream = &soundTestScreen->creams[DANCING_CREAM];
            animatedCream = soundTestScreen->activeCream;
            animatedCream->frameFlags |= 0x400;
            animatedCream->variant = SA2_ANIM_VARIANT_SOUNDTEST_CREAM_CLAP_UP_ACTIVE;
            animatedCream->graphics.anim = SA2_ANIM_SOUNDTEST_CREAM_CLAP_UP;
            break;
        case CREAM_ANIM_SOUND_END:
            soundTestScreen->activeCream = &soundTestScreen->creams[IDLE_CREAM];
            animatedCream = soundTestScreen->activeCream;
            animatedCream->prevVariant = -1;
            animatedCream->variant = 0;
            animatedCream->graphics.anim = SA2_ANIM_SOUNDTEST_CREAM_WAITING;
            break;
        default:
            break;
    }

    UpdateSpriteAnimation(animatedCream);
}

static void SoundTestScreenUpdateCreamAnim(void)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
    Sprite *animatedCream = soundTestScreen->activeCream;

    switch (soundTestScreen->state) {
        case SOUND_TEST_SCREEN_STOPPED:
            // If current animation is song end, set to anim idle
            if (animatedCream->graphics.anim == SA2_ANIM_SOUNDTEST_CREAM_WAITING) {
                if (!UpdateSpriteAnimation(animatedCream)) {
                    SoundTestScreenSetCreamAnim(CREAM_ANIM_IDLE);
                }
            } else {
                UpdateSpriteAnimation(animatedCream);
            }
            break;
        case SOUND_TEST_SCREEN_PLAYING:
            soundTestScreen->barBeat += soundTestScreen->songTempo;
            soundTestScreen->animFrame = soundTestScreen->barBeat >> 16;
            UpdateSpriteAnimation(animatedCream);

            if (soundTestScreen->animFrame >= 55 && soundTestScreen->creamDanceAnimStep == CREAM_DANCE_STEP_RIGHT) {
                soundTestScreen->creamDanceAnimStep = CREAM_DANCE_STEP_FIRST_MIDDLE;
                SoundTestScreenSetCreamAnim(CREAM_ANIM_DANCE_MIDDLE);
                break;
            }
            if (soundTestScreen->animFrame >= 60 && soundTestScreen->creamDanceAnimStep == CREAM_DANCE_STEP_FIRST_MIDDLE) {
                soundTestScreen->creamDanceAnimStep = CREAM_DANCE_STEP_LEFT;
                SoundTestScreenSetCreamAnim(CREAM_ANIM_DANCE_LEFT);
                break;
            }

            if (soundTestScreen->animFrame >= 115 && soundTestScreen->creamDanceAnimStep == CREAM_DANCE_STEP_LEFT) {
                soundTestScreen->creamDanceAnimStep = CREAM_DANCE_STEP_SECOND_MIDDLE;
                SoundTestScreenSetCreamAnim(CREAM_ANIM_DANCE_MIDDLE);
                break;
            }

            if (soundTestScreen->animFrame > 119 && soundTestScreen->creamDanceAnimStep == CREAM_DANCE_STEP_SECOND_MIDDLE) {
                soundTestScreen->creamDanceAnimStep = 0;
                SoundTestScreenSetCreamAnim(CREAM_ANIM_DANCE_RIGHT);
                soundTestScreen->barBeat = 0;
                soundTestScreen->animFrame = 0;
                break;
            }
    }
}

static void SoundTestScreenOnDestroy(struct Task *t)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(t);
    soundTestScreen->optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
}

static void Task_SoundTestScreenCleanup(void)
{
    ResetProfileScreensVram();

#ifdef BUG_FIX
    {
        // Prevent a crash related to task data being cleared on-destroy
        struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
        s32 i = soundTestScreen->hblankIrqIndex;

        for (; i + 1 < gNumHBlankIntrs; i++) {
            gHBlankCallbacks[i] = gHBlankCallbacks[i + 1];
        }

        gHBlankCallbacks[--gNumHBlankIntrs] = NULL;
    }
#endif

    TaskDestroy(gCurTask);
}

static void SoundTestScreenInitRegistersAndBackground(struct Task *t)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(t);
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x703;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    OptionsInitBackground(soundTestScreen->background, 0, 7, TM_SOUND_TEST_BG, 0x20, 0x20, 0, 0, 0, 0);
}

static void SoundTestScreenSetNameDisplayPos(u8 unused_, s16 x, s16 y)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
    u32 i;

    for (i = 0; i < MAX_SOUND_NAME_LENGTH; i++) {
        u16 *pos = (u16 *)&soundTestScreen->nameDisplay[i].x;
        *pos = x + i * 10;
        pos++;
        *pos = y;
        DisplaySprite(&soundTestScreen->nameDisplay[i]);
    }
}

static void SoundTestScreenSetNameDisplay(u8 soundId)
{
    struct SoundTestScreen *soundTestScreen = TASK_DATA(gCurTask);
    u32 i;
    for (i = 0; i < MAX_SOUND_NAME_LENGTH; i++) {
        u8 soundTextChar = sSoundNames[soundId][i];

        u8 *asset = &soundTestScreen->nameDisplay[i].variant;
        asset[0] = soundTextChar - 0x20;
        asset[1] = 0xFF;

        if (soundTextChar == 0) {
            asset[0] = 0;
        }

        UpdateSpriteAnimation(&soundTestScreen->nameDisplay[i]);
    }
}
