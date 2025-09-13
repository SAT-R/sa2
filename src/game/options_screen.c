#include "global.h"
#include "core.h"
#include "game/options_screen.h"
#include "lib/m4a/m4a.h"
#include "task.h"
#include "game/save.h"
#include "malloc_ewram.h"
#include "game/math.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "game/title_screen.h"
#include "game/sound_test.h"
#include "game/stage/stage.h"
#include "game/stage/ui.h"
#include "game/multiplayer/mode_select.h"
#include "game/character_select.h"

#include "constants/tilemaps.h"

#define NUM_PLAYER_DATA_MENU_ITEMS 4

struct TimeRecordDisplay {
    Sprite deliminators[2];
    Sprite minute;
    Sprite seconds[2];
    Sprite millis[2];
};

struct TimeRecordsScreen {
    ScreenFade fade;
    Background coursesViewBackground;
    Sprite choiceViewItemsOrZoneTitle[2];
    Sprite actTitle[2];
    Sprite choiceViewTitleOrZoneSubtitle;
    Sprite choiceViewScrollArrows[4];

    struct PlayerDataMenu *playerDataMenu;

    struct TimeRecords *timeRecords;

    Background coursesViewCharacterBackground;
    Background coursesViewCharacter;
    Sprite timeRecordDisplays[3];
    struct TimeRecordDisplay timeDisplays[3];

    u8 character;

    u8 zone;
    u8 act;

    u8 animFrame;
    bool8 unusedUnk708;
    u8 availableCharacters;
    u8 unlockedCourses[NUM_CHARACTERS];
    u8 language;

    bool8 isBossMode;

    u8 view;
}; /* size 0x714 */

struct LanguageScreen {
    Sprite headerFooter[2];
    Sprite languageOptions[NUM_LANGUAGES];
    Sprite optionOutline;
    Background unk1B0;
    ScreenFade unk1F0;

    struct OptionsScreen *optionsScreen;

    s8 menuCursor;

    bool8 creatingNewProfile;
}; /* size 0x204 */

struct NameInputDisplay {
    Sprite displayCursor;
    Sprite characterDisplay[MAX_PLAYER_NAME_LENGTH];

    u16 unk150;
    u16 cursor;

    u16 buffer[MAX_PLAYER_NAME_LENGTH];
};

struct ProfileNameScreen {
    Sprite title;
    Sprite controls[3];
    Background background;
    Background charMatrixBackground;

    ScreenFade fade;
    struct PlayerDataMenu *playerDataMenu;

    Sprite focusedCell[2];
    Sprite scrollArrows[2];
    Background charMatrix;
    u16 matrixPageIndex;

    s8 cursorCol;
    s8 cursorRow;

    u8 filler254[4];

    struct NameInputDisplay nameInput;

    u16 matrixCursorIndex;
    u8 language;
    u8 onCompleteAction;
}; /* size 0x3BC */

struct PlayerDataMenu {
    Sprite headerFooter[2];
    Sprite menuItems[NUM_PLAYER_DATA_MENU_ITEMS];
    Sprite menuItemOutline;

    ScreenFade unk150;

    struct OptionsScreen *optionsScreen;
    s8 menuCursor;
    s8 animFrame;

    s8 language;

    s8 state;
}; /* size 0x164 */

struct SwitchMenu {
    struct OptionsScreen *optionsScreen;
    Sprite headerFooter[2];
    Sprite options[2];
    Sprite switchValueOutline;
    s8 switchValue;
    s8 animFrame;
    s8 language;
}; /* size 0xF8 */

struct ButtonConfigMenu {
    struct OptionsScreen *optionsScreen;
    Sprite staticElements[6];
    Sprite buttonActions[3];
    Sprite scrollArrows[2];
    Sprite controlFocus;
    u8 aButtonAction;
    u8 bButtonAction;
    u8 rShoulderAction;
    u8 focus;
    s8 animFrame;
    s8 language;
}; /* size 0x24C */

struct DeleteScreen {
    Sprite headerFooter[2];
    Sprite options[2];
    Sprite optionOutline;
    Background background;
    ScreenFade unk130;
    struct OptionsScreen *optionsScreen;
    s8 confirmationCursor;
    bool8 unusedUnk141;
    s8 language;
    s8 deleteConfirmed;
}; /* 0x144 */

struct MultiplayerRecordRow {
    u16 playerName[6];

    bool8 slotFilled;
    u8 wins;
    u8 loses;
    u8 draws;
    Sprite nameDisplay[6];
    Sprite winsDigits[2];
    Sprite losesDigits[2];
    Sprite defeatsDigits[2];
}; /* size 0x250 */

struct MultiplayerRecordsTable {
    struct MultiplayerRecordRow rows[NUM_MULTIPLAYER_SCORES];
}; /* size 0x1720 */

struct MultiplayerRecordsScreen {
    ScreenFade fade;

    Background backgroundTrims;
    Background background;

    Sprite title;
    Sprite columnHeaders;
    Sprite scrollArrows[2];
    Sprite playerNameDisplay[6];
    Sprite playerWinsDigits[2];
    Sprite playerLossesDigits[2];
    Sprite playerDrawsDigits[2];

    struct PlayerDataMenu *playerDataMenu;

    struct MultiplayerRecordsTable *table;
    u8 scrollAnimFrame;
    u8 playerWins;
    u8 playerLoses;
    u8 playerDraws;

    u16 playerName[6];

    u8 targetFirstVisibleRowIndex;
    u8 currentFirstVisibleRowIndex;
    u8 scrollIndex;

    u8 language;
}; /* size 0x3A8 */

struct UNK_080D95E8 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
};

struct UNK_806B908 {
    u32 unk0;
    u16 unk4;
    u16 unk6;
};

// vram addresses
void *gProfileScreenNextVramAddress = NULL;
void *gProfileScreenSubMenuNextVramAddress = NULL;

static void Task_OptionsScreenShow(void);
static void OptionsScreenTaskDestroyHandler(struct Task *);

static void ReadProfileData(struct OptionsScreen *);

static void Task_TimeRecordsScreenCreateTimesUI(void);
static void TimeRecordsScreenInitRegisters(void);
static void TimeRecordsScreenCreateCoursesViewBackgroundsUI(struct TimeRecordsScreen *);
static void TimeRecordsScreenCreateCoursesViewUI(struct TimeRecordsScreen *);

static void Task_LanguageScreenFadeIn(void);
static void LanguageScreenInitRegisters(struct LanguageScreen *);
static void LanguageScreenCreateBackgroundsUI(struct LanguageScreen *);
static void LanguageScreenCreateUI(struct LanguageScreen *);

static void Task_ProfileNameScreenFadeIn(void);
static void ProfileNameScreenInitRegisters(s16);
static void ProfileNameScreenCreateUIBackgrounds(struct ProfileNameScreen *);
static void ProfileNameScreenCreateUIText(struct ProfileNameScreen *);
static void ProfileNameScreenCreateUIContextElements(struct ProfileNameScreen *);
static void ProfileNameScreenCreateInputDisplayUI(struct ProfileNameScreen *);

static void OptionsScreenRenderUI(void);
static void OptionsScreenShowSoundTestScreen(void);
static void OptionsScreenShowLanguageScreen(void);
static void OptionsScreenShowDeleteScreen(void);
static void OptionsScreenHandleExit(void);
static void OptionsScreenOpenSelectedSubMenu(void);
static void Task_OptionsScreenMenuCursorMoveAnim(void);

static void Task_OptionsScreenWaitForSubMenuExit(void);
static void Task_OptionsScreenFadeInFromLanguageScreen(void);
static void Task_OptionsScreenFadeInFromSoundTest(void);
static void Task_OptionsScreenFadeInFromDeleteScreen(void);

static void Task_PlayerDataMenuOpenAnimWait(void);
static void PlayerDataMenuCreateUI(struct PlayerDataMenu *);

static void PlayerDataMenuRenderUI(void);
static void Task_PlayerDataMenuMain(void);

static void PlayerDataMenuShowTimeRecordsScreen(void);
static void PlayerDataMenuShowProfileNameScreen(void);
static void PlayerDataMenuShowMultiplayerRecordsScreen(void);
static void Task_PlayerDataMenuCloseAnim(void);

static void Task_PlayerDataMenuFadeInFromProfileNameScreen(void);
static void CreateTimeRecordsScreen(struct PlayerDataMenu *);
static void CreateTimeRecordsScreenAtCoursesView(struct PlayerDataMenu *);
static void Task_PlayerDataMenuWaitForTimeRecordsScreenExit(void);

static void Task_PlayerDataMenuFadeInFromTimeRecordsScreen(void);
static void Task_PlayerDataMenuFadeInFromMultiplayerRecordsScreen(void);
static void DifficultyMenuRenderUI(void);
static void Task_DifficultyMenuMain(void);

static void Task_DifficultyMenuCloseAnim(void);
static void TimeLimitMenuRenderUI(void);
static void Task_TimeLimitMenuMain(void);

static void Task_TimeLimitMenuCloseAnim(void);
static void Task_ButtonConfigMenuOpenAnimWait(void);
static void ButtonConfigMenuCreateUI(struct ButtonConfigMenu *);
static void ButtonConfigMenuRenderUI(void);
static void Task_ButtonConfigMenuAButtonMain(void);
static void Task_ButtonConfigMenuHandleAButtonComplete(void);
static void Task_ButtonMenuConfigCloseAnim(void);
static void ButtonConfigMenuStartOver(void);
static void Task_ButtonConfigMenuHandleBButtonComplete(void);
static void Task_ButtonConfigMenuHandleStartOver(void);

static void ReseedRng(void);
static void LanguageScreenHandleLanguageChanged(void);
static void LanguageScreenRenderUI(void);
static void LanguageScreenHandleExit(void);

static void Task_DeleteScreenFadeIn(void);
static void DeleteScreenInitRegisters(struct DeleteScreen *);
static void DeleteScreenCreateBackgroundsUI(struct DeleteScreen *);
static void DeleteScreenCreateUI(struct DeleteScreen *);
static void DeleteScreenRenderUI(void);
static void Task_DeleteScreenCreateAbsoluteConfirmation(void);
static void Task_DeleteScreenHandleExit(void);

static void Task_DeleteScreenAbsoluteConfirmMain(void);

static void ProfileNameScreenRenderUI(void);
static bool16 ProfileNameScreenHandleShoulderInput(void);
static bool16 ProfileNameScreenHandleDpadInput(void);
static u16 sub_806A664(s16, u16);
static void ProfileNameScreenInputComplete(void);
static void ProfileNameScreenFadeOutAndExit(void);

static void Task_TimeRecordsScreenChoiceViewFadeIn(void);
static void TimeRecordScreenInitRegisters(void);
static void TimeRecordsScreenCreateChoiceViewBackgroundsUI(struct TimeRecordsScreen *);
static void TimeRecordsScreenCreateChoiceViewUI(struct TimeRecordsScreen *);

static void TimeRecordsScreenRenderModeChoiceUI(void);
static void TimeRecordsScreenShowCoursesView(void);
static void TimeRecordsScreenHandleExit(void);

static void TimeRecordsScreenRenderCoursesViewUI(u16);
static void Task_TimeRecordsScreenCharacterChangeAnimIn(void);

static void Task_TimeRecordsScreenCourseChangeAnim(void);

static void TimeRecordsScreenRenderTimeRowAnimFrame(s16, s16);
static void Task_TimeRecordsScreenCoursesViewMain(void);
static void Task_TimeRecordsScreenHandleCourseChange(void);
static void Task_TimeRecordsScreenHandleActChange(void);
static void Task_TimeRecordsScreenHandleCourseSelected(void);
static void Task_TimeRecordsScreenCharacterChangeAnimOut(void);
static void TimeRecordsScreenHandleReturn(void);

static void Task_MultiplayerRecordsScreenCreateNextTableRowUI(void);
static void MultiplayerRecordsScreenInitRegisters(void);
static void MultiplayerRecordsScreenCreateBackgroundsUI(struct MultiplayerRecordsScreen *);
static void MultiplayerRecordsScreenCreatePlayerRowUI(struct MultiplayerRecordsScreen *);

static void Task_MultiplayerRecordsScreenScrollAnim(void);
static void MultiplayerRecordsScreenRenderUI(void);
static void Task_MultiplayerRecordsScreenHandleExit(void);

static void Task_OptionScreenFadeIn(void);
static void SetupOptionScreenBackgroundsUI(struct OptionsScreen *);

static void CreateDifficultyMenu(struct OptionsScreen *);
static void CreateTimeLimitMenu(struct OptionsScreen *);

static void Task_OptionsScreenFadeOutToLanguageScreen(void);
static void CreateEditLanguageScreen(struct OptionsScreen *);
static void Task_OptionScreenFadeOutToSoundTest(void);
static void Task_OptionsScreenFadeOutToDeleteScreen(void);
static void Task_PlayerDataMenuFadeOutToProfileNameScreen(void);
static void Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen(void);
static void Task_OptionsScreenFadeOutAndExit(void);

static void Task_LanguageScreenFadeOutAndExit(void);
static void Task_TimeRecordsScreenFadeOutAndExit(void);
static void TimeRecordsScreenFadeOutToCoursesView(void);
static void TimeRecordsScreenCreateCoursesView(struct TimeRecordsScreen *);
static void Task_TimeRecordsScreenCoursesViewFadeIn(void);
static void Task_TimeRecordsScreenFadeOutToSelectedCourse(void);
static void Task_MultiplayerRecordsScreenFadeIn(void);
static void Task_MultiplayerRecordsScreenFadeOutAndExit(void);

static s32 MaxSpriteSize(const struct UNK_080D95E8 *, s8);
static struct UNK_806B908 sub_806B908(u16);
static bool16 sub_806B9C8(u16);
static bool16 sub_806BA14(s16, u16);
static bool16 sub_806B988(u16 *);

#define OPTIONS_MENU_ITEM_PLAYER_DATA      0
#define OPTIONS_MENU_ITEM_DIFFICULTY       1
#define OPTIONS_MENU_ITEM_TIME_LIMIT       2
#define OPTIONS_MENU_ITEM_LANGUAGE         3
#define OPTIONS_MENU_ITEM_BUTTON_CONFIG    4
#define OPTIONS_MENU_ITEM_SOUND_TEST       5
#define OPTIONS_MENU_ITEM_DELETE_GAME_DATA 6
#define OPTIONS_MENU_ITEM_EXIT             7

#define OPTIONS_META_ITEM_PLAYER_NAME      0
#define OPTIONS_META_ITEM_DIFFICULTY_LEVEL 1
#define OPTIONS_META_ITEM_TIME_LIMIT       2
#define OPTIONS_META_ITEM_LANGUAGE         3

#define OPTIONS_SCREEN_NEXT_CURSOR_MOVE_ANIMS 0
#define OPTIONS_SCREEN_PREV_CURSOR_MOVE_ANIMS 1

#define PLAYER_DATA_MENU_ITEM_CHANGE_NAME  0
#define PLAYER_DATA_MENU_ITEM_TIME_RECORDS 1
#define PLAYER_DATA_MENU_ITEM_VS_RECORDS   2
#define PLAYER_DATA_MENU_ITEM_EXIT         3

#define PLAYER_DATA_MENU_STATE_ACTIVE      0
#define PLAYER_DATA_MENU_STATE_SCREEN_OPEN 1

#define NAME_CHAR_MATRIX_NUM_COLS                11
#define NAME_CHAR_MATRIX_NUM_ROWS                22
#define NAME_CHAR_MATRIX_ROWS_PER_PAGE           7
#define NAME_CHAR_MATRIX_LAST_PAGE_START_INDEX   NAME_CHAR_MATRIX_NUM_COLS *(NAME_CHAR_MATRIX_NUM_ROWS - NAME_CHAR_MATRIX_ROWS_PER_PAGE)
#define NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT   16
#define NAME_CHAR_MATRIX_BACKGROUND_COLUMN_WIDTH 16

#define PROFILE_NAME_SCREEN_CONTROLS_COLUMN       11
#define PROFILE_NAME_SCREEN_CURSOR_BACK_BUTTON    4
#define PROFILE_NAME_SCREEN_CURSOR_FORWARD_BUTTON 5
#define PROFILE_NAME_SCREEN_END_BUTTON            6

#define NAME_INPUT_DISPLAY_CHAR_WIDTH 12

#define NAME_SCREEN_COMPLETE_ACTION_BACK_TO_OPTIONS 0
#define NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER     1
#define NAME_SCREEN_COMPLETE_ACTION_START_GAME      2

#define TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE 0
#define TIME_RECORDS_SCREEN_VIEW_COURSES     1
#define TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK 2

#define TIME_RECORDS_CHOICE_BOSS 1
#define TIME_RECORDS_CHOICE_ACTS 0

#define ASSET_CHARACTER_BACKGROUND 0
#define ASSET_CHARACTER            1

#define DIFFICULTY_OPTION_NORMAL 0
#define DIFFICULTY_OPTION_EASY   1

#define TIME_LIMIT_OPTION_ON  0
#define TIME_LIMIT_OPTION_OFF 1

#define DELETE_SCREEN_CONFIRMATION_YES 0
#define DELETE_SCREEN_CONFIRMATION_NO  1

#define MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS 4
#define MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX (NUM_MULTIPLAYER_SCORES - MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS)

#define BUTTON_CONFIG_MENU_A_BUTTON          0
#define BUTTON_CONFIG_MENU_B_BUTTON          1
#define BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON 2

#define BUTTON_CONFIG_MENU_ACTION_JUMP   0
#define BUTTON_CONFIG_MENU_ACTION_ATTACK 1
#define BUTTON_CONFIG_MENU_ACTION_TRICK  2

#define SetupOptionScreenBackgrounds(background, subMenuBackground)                                                                        \
    ({                                                                                                                                     \
        OptionsInitBackground(&(background), 0, 7, TM_OPTIONS_BG0, 0x1E, 0x14, 0, 0, 0, 0);                                                \
        OptionsInitBackground(&(subMenuBackground), 1, 0xE, TM_OPTIONS_LANGUAGE_SELECT, 0x1E, 0x14, 0, 1, 0, 0);                           \
    })

#define ReadAvailableCharacters(i, unlockedCharacters)                                                                                     \
    ({                                                                                                                                     \
        for (i = 1; i < NUM_CHARACTERS; i++) {                                                                                             \
            if (!GetBit((unlockedCharacters), i)) {                                                                                        \
                break;                                                                                                                     \
            }                                                                                                                              \
        };                                                                                                                                 \
    })

// Required for match in all uses
#define UI_COLUMN(c, cSize) ({ (c) * (cSize); })

static const s8 sMenuCursorMoveAnims[2][8] = {
    [OPTIONS_SCREEN_NEXT_CURSOR_MOVE_ANIMS] = { 8, 4, 1, -1, -2, -1, 1, 0 },
    [OPTIONS_SCREEN_PREV_CURSOR_MOVE_ANIMS] = { 1, 2, 5, 7, 8, 8, 8, 8 },
};

static const s16 sSubMenuOpenAnim[16] = {
    -16, -41, -66, -91, -116, -141, -166, -186, -201, -216, -228, -219, -210, -214, -217, -216,
};

static const s16 sSubMenuCloseAnim[16] = {
    -216, -201, -186, -171, -156, -141, -126, -111, -96, -81, -66, -51, -36, -21, -6, 0,
};

static const u16 sTimeRecordsCharacterAssets[NUM_CHARACTERS][2] = {
    [CHARACTER_SONIC]
    = { [ASSET_CHARACTER_BACKGROUND] = TM_MP_CHARACTER_SELECTED_SONIC_BG, [ASSET_CHARACTER] = TM_MP_CHARACTER_SELECTED_SONIC },
    [CHARACTER_CREAM]
    = { [ASSET_CHARACTER_BACKGROUND] = TM_MP_CHARACTER_SELECTED_CREAM_BG, [ASSET_CHARACTER] = TM_MP_CHARACTER_SELECTED_CREAM },
    [CHARACTER_TAILS]
    = { [ASSET_CHARACTER_BACKGROUND] = TM_MP_CHARACTER_SELECTED_TAILS_BG, [ASSET_CHARACTER] = TM_MP_CHARACTER_SELECTED_TAILS },
    [CHARACTER_KNUCKLES]
    = { [ASSET_CHARACTER_BACKGROUND] = TM_MP_CHARACTER_SELECTED_KNUCKLES_BG, [ASSET_CHARACTER] = TM_MP_CHARACTER_SELECTED_KNUCKLES },
    [CHARACTER_AMY] = { [ASSET_CHARACTER_BACKGROUND] = TM_MP_CHARACTER_SELECTED_AMY_BG, [ASSET_CHARACTER] = TM_MP_CHARACTER_SELECTED_AMY },
};

const u16 gUnknown_080D95A4[] = {
    17, 19, 39, 41, 61, 63, 75, 76, 77, 109, 142, 174, 175, 208, 241, 65535,
};

const u16 gUnknown_080D95C4[] = {
    55,
    65535,
};

const u16 gUnknown_080D95C8[] = {
    11, 22, 33, 55, 65535,
};

const u16 gUnknown_080D95D2[] = {
    55,
    262,
};

const u16 gUnknown_080D95D6[4][2] = {
    { 11, 242 },
    { 22, 247 },
    { 33, 252 },
    { 55, 257 },
};

static const u16 sUnused = 0;

const struct UNK_080D95E8 sOptionsScreenTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 956, .unk2 = 8, .unk4 = 39 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 975, .unk2 = 8, .unk4 = 26 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 976, .unk2 = 8, .unk4 = 30 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 977, .unk2 = 8, .unk4 = 24,},
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 978, .unk2 = 8, .unk4 = 30 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 979, .unk2 = 8, .unk4 = 24 },
};
const struct UNK_080D95E8 sOptionsScreenMenuItemsText[NUM_LANGUAGES][8] = {
    [LanguageIndex(LANG_JAPANESE)] = {
        [OPTIONS_MENU_ITEM_PLAYER_DATA] = { .unk0 = 956, .unk2 = 0, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DIFFICULTY] = { .unk0 = 956, .unk2 = 1, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_TIME_LIMIT] = { .unk0 = 956, .unk2 = 2, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_LANGUAGE] = { .unk0 = 956, .unk2 = 3, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_BUTTON_CONFIG] = { .unk0 = 956, .unk2 = 4, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_SOUND_TEST] = { .unk0 = 956, .unk2 = 6, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DELETE_GAME_DATA] = { .unk0 = 956, .unk2 = 5, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_EXIT] = { .unk0 = 956, .unk2 = 7, .unk4 = 50 },
    },
    [LanguageIndex(LANG_ENGLISH)] = {
        [OPTIONS_MENU_ITEM_PLAYER_DATA] = { .unk0 = 975, .unk2 = 0, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DIFFICULTY] = { .unk0 = 975, .unk2 = 1, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_TIME_LIMIT] = { .unk0 = 975, .unk2 = 2, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_LANGUAGE] = { .unk0 = 975, .unk2 = 3, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_BUTTON_CONFIG] = { .unk0 = 975, .unk2 = 4, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_SOUND_TEST] = { .unk0 = 975, .unk2 = 6, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DELETE_GAME_DATA] = { .unk0 = 975, .unk2 = 5, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_EXIT] = { .unk0 = 975, .unk2 = 7, .unk4 = 50 },
    },
    [LanguageIndex(LANG_GERMAN)] = {
        [OPTIONS_MENU_ITEM_PLAYER_DATA] = { .unk0 = 976, .unk2 = 0, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DIFFICULTY] = { .unk0 = 976, .unk2 = 1, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_TIME_LIMIT] = { .unk0 = 976, .unk2 = 2, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_LANGUAGE] = { .unk0 = 976, .unk2 = 3, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_BUTTON_CONFIG] = { .unk0 = 976, .unk2 = 4, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_SOUND_TEST] = { .unk0 = 976, .unk2 = 6, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DELETE_GAME_DATA] = { .unk0 = 976, .unk2 = 5, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_EXIT] = { .unk0 = 976, .unk2 = 7, .unk4 = 50 },
    },
    [LanguageIndex(LANG_FRENCH)] = {
        [OPTIONS_MENU_ITEM_PLAYER_DATA] = { .unk0 = 977, .unk2 = 0, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DIFFICULTY] = { .unk0 = 977, .unk2 = 1, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_TIME_LIMIT] = { .unk0 = 977, .unk2 = 2, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_LANGUAGE] = { .unk0 = 977, .unk2 = 3, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_BUTTON_CONFIG] = { .unk0 = 977, .unk2 = 4, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_SOUND_TEST] = { .unk0 = 977, .unk2 = 6, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DELETE_GAME_DATA] = { .unk0 = 977, .unk2 = 5, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_EXIT] = { .unk0 = 977, .unk2 = 7, .unk4 = 50 },
    },
    [LanguageIndex(LANG_SPANISH)] = {
        [OPTIONS_MENU_ITEM_PLAYER_DATA] = { .unk0 = 978, .unk2 = 0, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DIFFICULTY] = { .unk0 = 978, .unk2 = 1, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_TIME_LIMIT] = { .unk0 = 978, .unk2 = 2, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_LANGUAGE] = { .unk0 = 978, .unk2 = 3, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_BUTTON_CONFIG] = { .unk0 = 978, .unk2 = 4, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_SOUND_TEST] = { .unk0 = 978, .unk2 = 6, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DELETE_GAME_DATA] = { .unk0 = 978, .unk2 = 5, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_EXIT] = { .unk0 = 978, .unk2 = 7, .unk4 = 50 },
    },
    [LanguageIndex(LANG_ITALIAN)] = {
        [OPTIONS_MENU_ITEM_PLAYER_DATA] = { .unk0 = 979, .unk2 = 0, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DIFFICULTY] = { .unk0 = 979, .unk2 = 1, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_TIME_LIMIT] = { .unk0 = 979, .unk2 = 2, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_LANGUAGE] = { .unk0 = 979, .unk2 = 3, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_BUTTON_CONFIG] = { .unk0 = 979, .unk2 = 4, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_SOUND_TEST] = { .unk0 = 979, .unk2 = 6, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_DELETE_GAME_DATA] = { .unk0 = 979, .unk2 = 5, .unk4 = 50 },
        [OPTIONS_MENU_ITEM_EXIT] = { .unk0 = 979, .unk2 = 7, .unk4 = 50 },
    },
};

const struct UNK_080D95E8 sDifficultyLevelSwitchText[NUM_LANGUAGES][2] = {
    [LanguageIndex(LANG_JAPANESE)] = {
        [DIFFICULTY_OPTION_NORMAL] = { .unk0 = 952, .unk2 = 0, .unk4 = 16 },
        [DIFFICULTY_OPTION_EASY] = { .unk0 = 952, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_ENGLISH)] = {
        [DIFFICULTY_OPTION_NORMAL] = { .unk0 = 990, .unk2 = 0, .unk4 = 16 },
        [DIFFICULTY_OPTION_EASY] = { .unk0 = 990, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_GERMAN)] = {
        [DIFFICULTY_OPTION_NORMAL] = { .unk0 = 991, .unk2 = 0, .unk4 = 16 },
        [DIFFICULTY_OPTION_EASY] = { .unk0 = 991, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_FRENCH)] = {
        [DIFFICULTY_OPTION_NORMAL] = { .unk0 = 992, .unk2 = 0, .unk4 = 16 },
        [DIFFICULTY_OPTION_EASY] = { .unk0 = 992, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_SPANISH)] = {
        [DIFFICULTY_OPTION_NORMAL] = { .unk0 = 993, .unk2 = 0, .unk4 = 16 },
        [DIFFICULTY_OPTION_EASY] = { .unk0 = 993, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_ITALIAN)] = {
        [DIFFICULTY_OPTION_NORMAL] = { .unk0 = 994, .unk2 = 0, .unk4 = 16 },
        [DIFFICULTY_OPTION_EASY] = { .unk0 = 994, .unk2 = 1, .unk4 = 16 },
    },
};

const struct UNK_080D95E8 sTimeLimitMenuSwitchText[NUM_LANGUAGES][2] = {
    [LanguageIndex(LANG_JAPANESE)] = {
        [TIME_LIMIT_OPTION_ON] = { .unk0 = 960, .unk2 = 0, .unk4 = 16 },
        [TIME_LIMIT_OPTION_OFF] = { .unk0 = 960, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_ENGLISH)] = {
        [TIME_LIMIT_OPTION_ON] = { .unk0 = 1020, .unk2 = 0, .unk4 = 16 },
        [TIME_LIMIT_OPTION_OFF] = { .unk0 = 1020, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_GERMAN)] = {
        [TIME_LIMIT_OPTION_ON] = { .unk0 = 1021, .unk2 = 0, .unk4 = 16 },
        [TIME_LIMIT_OPTION_OFF] = { .unk0 = 1021, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_FRENCH)] = {
        [TIME_LIMIT_OPTION_ON] = { .unk0 = 1022, .unk2 = 0, .unk4 = 16 },
        [TIME_LIMIT_OPTION_OFF] = { .unk0 = 1022, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_SPANISH)] = {
        [TIME_LIMIT_OPTION_ON] = { .unk0 = 1023, .unk2 = 0, .unk4 = 16 },
        [TIME_LIMIT_OPTION_OFF] = { .unk0 = 1023, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_ITALIAN)] = {
        [TIME_LIMIT_OPTION_ON] = { .unk0 = 1024, .unk2 = 0, .unk4 = 16 },
        [TIME_LIMIT_OPTION_OFF] = { .unk0 = 1024, .unk2 = 1, .unk4 = 16 },
    },
};

const struct UNK_080D95E8 sOptionsScreenSelectedLanguageText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 953, .unk2 = 7, .unk4 = 16 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 953, .unk2 = 8, .unk4 = 16 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 953, .unk2 = 9, .unk4 = 16 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 953, .unk2 = 10, .unk4 = 16 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 953, .unk2 = 11, .unk4 = 16 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 953, .unk2 = 12, .unk4 = 16 },
};

const struct UNK_080D95E8 sDifficultyMenuTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 952, .unk2 = 2, .unk4 = 42 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 990, .unk2 = 2, .unk4 = 28 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 991, .unk2 = 2, .unk4 = 50 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 992, .unk2 = 2, .unk4 = 28 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 993, .unk2 = 2, .unk4 = 28 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 994, .unk2 = 2, .unk4 = 45 },
};
const struct UNK_080D95E8 sDifficultyMenuControlsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 958, .unk2 = 0, .unk4 = 28 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1010, .unk2 = 0, .unk4 = 22 },
#ifdef JAPAN
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 39 },
#else
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
#endif
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
};

const struct UNK_080D95E8 sTimeLimitMenuTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 960, .unk2 = 2, .unk4 = 42 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1020, .unk2 = 2, .unk4 = 26 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1021, .unk2 = 2, .unk4 = 24 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1022, .unk2 = 2, .unk4 = 38 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1023, .unk2 = 2, .unk4 = 40 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1024, .unk2 = 2, .unk4 = 36 },
};
const struct UNK_080D95E8 sTimeLimitMenuControlsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 958, .unk2 = 0, .unk4 = 28 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1010, .unk2 = 0, .unk4 = 22 },
#ifdef JAPAN
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 39 },
#else
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
#endif
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
};

const struct UNK_080D95E8 sButtonConfigTitleAndControlsText[NUM_LANGUAGES][3] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        { .unk0 = 950, .unk2 = 3, .unk4 = 51 }, // title
        { .unk0 = 958, .unk2 = 0, .unk4 = 28 }, // controls line 1
        { .unk0 = 950, .unk2 = 10, .unk4 = 14 }, // controls line 2
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        { .unk0 = 980, .unk2 = 3, .unk4 = 38 },
        { .unk0 = 1010, .unk2 = 0, .unk4 = 22 },
        { .unk0 = 980, .unk2 = 4, .unk4 = 17 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        { .unk0 = 981, .unk2 = 3, .unk4 = 38 },
#ifdef JAPAN
        { .unk0 = 1011, .unk2 = 0, .unk4 = 39 },
#else
        { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
#endif
        { .unk0 = 981, .unk2 = 4, .unk4 = 17 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        { .unk0 = 982, .unk2 = 3, .unk4 = 44 },
        { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
#ifdef JAPAN
        { .unk0 = 982, .unk2 = 4, .unk4 = 23 },
#else
        { .unk0 = 982, .unk2 = 4, .unk4 = 17 },
#endif
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        { .unk0 = 983, .unk2 = 3, .unk4 = 40 },
        { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
        { .unk0 = 983, .unk2 = 4, .unk4 = 21 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        { .unk0 = 984, .unk2 = 3, .unk4 = 46 },
        { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
        { .unk0 = 984, .unk2 = 4, .unk4 = 15 },
    },
};
const struct UNK_080D95E8 sButtonConfigButtonIcons[] = {
    [BUTTON_CONFIG_MENU_A_BUTTON] = { .unk0 = 950, .unk2 = 4, .unk4 = 12 },
    [BUTTON_CONFIG_MENU_B_BUTTON] = { .unk0 = 950, .unk2 = 5, .unk4 = 12 },
    [BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON] = { .unk0 = 950, .unk2 = 6, .unk4 = 12 },
};
const struct UNK_080D95E8 sButtonConfigActionsText[NUM_LANGUAGES][3] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        [BUTTON_CONFIG_MENU_ACTION_JUMP] = { .unk0 = 950, .unk2 = 0, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_ATTACK] = { .unk0 = 950, .unk2 = 1, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_TRICK] = { .unk0 = 950, .unk2 = 2, .unk4 = 18 },
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        [BUTTON_CONFIG_MENU_ACTION_JUMP] = { .unk0 = 980, .unk2 = 0, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_ATTACK] = { .unk0 = 980, .unk2 = 1, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_TRICK] = { .unk0 = 980, .unk2 = 2, .unk4 = 18 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        [BUTTON_CONFIG_MENU_ACTION_JUMP] = { .unk0 = 981, .unk2 = 0, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_ATTACK] = { .unk0 = 981, .unk2 = 1, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_TRICK] = { .unk0 = 981, .unk2 = 2, .unk4 = 18 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        [BUTTON_CONFIG_MENU_ACTION_JUMP] = { .unk0 = 982, .unk2 = 0, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_ATTACK] = { .unk0 = 982, .unk2 = 1, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_TRICK] = { .unk0 = 982, .unk2 = 2, .unk4 = 18 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        [BUTTON_CONFIG_MENU_ACTION_JUMP] = { .unk0 = 983, .unk2 = 0, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_ATTACK] = { .unk0 = 983, .unk2 = 1, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_TRICK] = { .unk0 = 983, .unk2 = 2, .unk4 = 18 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        [BUTTON_CONFIG_MENU_ACTION_JUMP] = { .unk0 = 984, .unk2 = 0, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_ATTACK] = { .unk0 = 984, .unk2 = 1, .unk4 = 18 },
        [BUTTON_CONFIG_MENU_ACTION_TRICK] = { .unk0 = 984, .unk2 = 2, .unk4 = 18 },
    },
};

const struct UNK_080D95E8 sLanguageScreenTitles[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 953, .unk2 = 6, .unk4 = 45 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 995, .unk2 = 0, .unk4 = 50 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 996, .unk2 = 0, .unk4 = 46 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 997, .unk2 = 0, .unk4 = 60 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 998, .unk2 = 0, .unk4 = 38 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 999, .unk2 = 0, .unk4 = 46 },
};
const struct UNK_080D95E8 sLanguageScreenEditControlsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 958, .unk2 = 0, .unk4 = 28 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1010, .unk2 = 0, .unk4 = 22 },
#ifdef JAPAN
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 39 },
#else
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
#endif
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
};
const struct UNK_080D95E8 sLanguageScreenNewControlsText[NUM_LANGUAGES] = {
#ifdef JAPAN
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 953, .unk2 = 13, .unk4 = 28 },
#else
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 953, .unk2 = 13, .unk4 = 26 },
#endif
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 995, .unk2 = 1, .unk4 = 20 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 995, .unk2 = 1, .unk4 = 20 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 995, .unk2 = 1, .unk4 = 20 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 995, .unk2 = 1, .unk4 = 20 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 995, .unk2 = 1, .unk4 = 20 },
};
const struct UNK_080D95E8 sLanguageScreenOptionsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 953, .unk2 = 0, .unk4 = 40 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 953, .unk2 = 1, .unk4 = 40 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 953, .unk2 = 2, .unk4 = 40 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 953, .unk2 = 3, .unk4 = 40 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 953, .unk2 = 4, .unk4 = 40 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 953, .unk2 = 5, .unk4 = 40 },
};

const struct UNK_080D95E8 sDeleteScreenConfirmTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 951, .unk2 = 2, .unk4 = 54 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 985, .unk2 = 2, .unk4 = 46 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 986, .unk2 = 2, .unk4 = 48 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 987, .unk2 = 2, .unk4 = 80 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 988, .unk2 = 2, .unk4 = 68 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 989, .unk2 = 2, .unk4 = 60 },
};
const struct UNK_080D95E8 sDeleteScreenAbsoluteConfirmTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 951, .unk2 = 3, .unk4 = 39 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 985, .unk2 = 3, .unk4 = 38 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 986, .unk2 = 3, .unk4 = 44 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 987, .unk2 = 3, .unk4 = 42 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 988, .unk2 = 3, .unk4 = 63 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 989, .unk2 = 3, .unk4 = 22 },
};
const struct UNK_080D95E8 sDeleteScreenControlsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 958, .unk2 = 0, .unk4 = 28 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1010, .unk2 = 0, .unk4 = 22 },
#ifdef JAPAN
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 39 },
#else
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
#endif
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
};
const struct UNK_080D95E8 sDeleteScreenOptionsText[NUM_LANGUAGES][2] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        [DELETE_SCREEN_CONFIRMATION_YES] = { .unk0 = 951, .unk2 = 0, .unk4 = 16 },
        [DELETE_SCREEN_CONFIRMATION_NO] = { .unk0 = 951, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        [DELETE_SCREEN_CONFIRMATION_YES] = { .unk0 = 985, .unk2 = 0, .unk4 = 16 },
        [DELETE_SCREEN_CONFIRMATION_NO] = { .unk0 = 985, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        [DELETE_SCREEN_CONFIRMATION_YES] = { .unk0 = 986, .unk2 = 0, .unk4 = 16 },
        [DELETE_SCREEN_CONFIRMATION_NO] = { .unk0 = 986, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        [DELETE_SCREEN_CONFIRMATION_YES] = { .unk0 = 987, .unk2 = 0, .unk4 = 16 },
        [DELETE_SCREEN_CONFIRMATION_NO] = { .unk0 = 987, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        [DELETE_SCREEN_CONFIRMATION_YES] = { .unk0 = 988, .unk2 = 0, .unk4 = 16 },
        [DELETE_SCREEN_CONFIRMATION_NO] = { .unk0 = 988, .unk2 = 1, .unk4 = 16 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        [DELETE_SCREEN_CONFIRMATION_YES] = { .unk0 = 989, .unk2 = 0, .unk4 = 16 },
        [DELETE_SCREEN_CONFIRMATION_NO] = { .unk0 = 989, .unk2 = 1, .unk4 = 16 },
    },
};

const struct UNK_080D95E8 sPlayerDataMenuTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 957, .unk2 = 4, .unk4 = 51 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1005, .unk2 = 4, .unk4 = 34 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1006, .unk2 = 4, .unk4 = 38 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1007, .unk2 = 4, .unk4 = 28 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1008, .unk2 = 4, .unk4 = 30 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1009, .unk2 = 4, .unk4 = 28 },
};
const struct UNK_080D95E8 sPlayerDataMenuControlsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 958, .unk2 = 0, .unk4 = 28 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1010, .unk2 = 0, .unk4 = 22 },
#ifdef JAPAN
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 39 },
#else
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
#endif
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
};

const struct UNK_080D95E8 sPlayerDataMenuItemsText[NUM_LANGUAGES][4] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        [PLAYER_DATA_MENU_ITEM_CHANGE_NAME] = { .unk0 = 957, .unk2 = 0, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_TIME_RECORDS] = { .unk0 = 957, .unk2 = 1, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_VS_RECORDS] = { .unk0 = 957, .unk2 = 2, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_EXIT] = { .unk0 = 957, .unk2 = 3, .unk4 = 40 },
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        [PLAYER_DATA_MENU_ITEM_CHANGE_NAME] = { .unk0 = 1005, .unk2 = 0, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_TIME_RECORDS] = { .unk0 = 1005, .unk2 = 1, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_VS_RECORDS] = { .unk0 = 1005, .unk2 = 2, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_EXIT] = { .unk0 = 1005, .unk2 = 3, .unk4 = 40 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        [PLAYER_DATA_MENU_ITEM_CHANGE_NAME] = { .unk0 = 1006, .unk2 = 0, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_TIME_RECORDS] = { .unk0 = 1006, .unk2 = 1, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_VS_RECORDS] = { .unk0 = 1006, .unk2 = 2, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_EXIT] = { .unk0 = 1006, .unk2 = 3, .unk4 = 40 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        [PLAYER_DATA_MENU_ITEM_CHANGE_NAME] = { .unk0 = 1007, .unk2 = 0, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_TIME_RECORDS] = { .unk0 = 1007, .unk2 = 1, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_VS_RECORDS] = { .unk0 = 1007, .unk2 = 2, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_EXIT] = { .unk0 = 1007, .unk2 = 3, .unk4 = 40 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        [PLAYER_DATA_MENU_ITEM_CHANGE_NAME] = { .unk0 = 1008, .unk2 = 0, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_TIME_RECORDS] = { .unk0 = 1008, .unk2 = 1, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_VS_RECORDS] = { .unk0 = 1008, .unk2 = 2, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_EXIT] = { .unk0 = 1008, .unk2 = 3, .unk4 = 40 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        [PLAYER_DATA_MENU_ITEM_CHANGE_NAME] = { .unk0 = 1009, .unk2 = 0, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_TIME_RECORDS] = { .unk0 = 1009, .unk2 = 1, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_VS_RECORDS] = { .unk0 = 1009, .unk2 = 2, .unk4 = 40 },
        [PLAYER_DATA_MENU_ITEM_EXIT] = { .unk0 = 1009, .unk2 = 3, .unk4 = 40 },
    },
};

const struct UNK_080D95E8 sProfileNameScreenNewTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 954, .unk2 = 2, .unk4 = 48 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1000, .unk2 = 1, .unk4 = 24 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1001, .unk2 = 1, .unk4 = 28 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1002, .unk2 = 1, .unk4 = 30 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1003, .unk2 = 1, .unk4 = 20 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1004, .unk2 = 1, .unk4 = 26 },
};
const struct UNK_080D95E8 sProfileNameScreenEditTitleText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 954, .unk2 = 1, .unk4 = 48 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1000, .unk2 = 0, .unk4 = 32 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1001, .unk2 = 0, .unk4 = 28 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1002, .unk2 = 0, .unk4 = 34 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1003, .unk2 = 0, .unk4 = 20 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1004, .unk2 = 0, .unk4 = 32 },
};
const struct UNK_080D95E8 sProfileNameScreenArrowTiles[2] = {
    { .unk0 = 954, .unk2 = 4, .unk4 = 3 },
    { .unk0 = 954, .unk2 = 3, .unk4 = 3 },
};
const struct UNK_080D95E8 sProfileNameScreenEndButtonText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 954, .unk2 = 5, .unk4 = 8 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 954, .unk2 = 5, .unk4 = 8 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 954, .unk2 = 5, .unk4 = 8 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 954, .unk2 = 5, .unk4 = 8 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 954, .unk2 = 5, .unk4 = 8 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 954, .unk2 = 5, .unk4 = 8 },
};

const struct UNK_080D95E8 sProfileNameScreenScrollArrowTiles[2] = {
    { .unk0 = 962, .unk2 = 0, .unk4 = 2 },
    { .unk0 = 962, .unk2 = 1, .unk4 = 2 },
};

const struct UNK_080D95E8 sMultiplayerRecordsTitleAndColumnHeadersText[NUM_LANGUAGES][2] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        { .unk0 = 961, .unk2 = 0, .unk4 = 48 }, // title
        { .unk0 = 961, .unk2 = 1, .unk4 = 28 }, // column headers
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        { .unk0 = 1025, .unk2 = 0, .unk4 = 42 },
        { .unk0 = 1025, .unk2 = 1, .unk4 = 26 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        { .unk0 = 1026, .unk2 = 0, .unk4 = 28 },
        { .unk0 = 1026, .unk2 = 1, .unk4 = 26 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        { .unk0 = 1027, .unk2 = 0, .unk4 = 42 },
        { .unk0 = 1027, .unk2 = 1, .unk4 = 24 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        { .unk0 = 1028, .unk2 = 0, .unk4 = 40 },
        { .unk0 = 1028, .unk2 = 1, .unk4 = 24 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        { .unk0 = 1029, .unk2 = 0, .unk4 = 40 },
        { .unk0 = 1029, .unk2 = 1, .unk4 = 26 },
    },
};

const struct UNK_080D95E8 sMultiplayerScoreDigitTiles[10] = {
    { .unk0 = 1119, .unk2 = 16, .unk4 = 2 }, { .unk0 = 1119, .unk2 = 17, .unk4 = 2 }, { .unk0 = 1119, .unk2 = 18, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 19, .unk4 = 2 }, { .unk0 = 1119, .unk2 = 20, .unk4 = 2 }, { .unk0 = 1119, .unk2 = 21, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 22, .unk4 = 2 }, { .unk0 = 1119, .unk2 = 23, .unk4 = 2 }, { .unk0 = 1119, .unk2 = 24, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 25, .unk4 = 2 },
};

const struct UNK_080D95E8 sTimeRecordsChoiceViewTitles[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 959, .unk2 = 0, .unk4 = 66 },
    [LanguageIndex(LANG_ENGLISH)] = { .unk0 = 1015, .unk2 = 0, .unk4 = 32 },
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1016, .unk2 = 0, .unk4 = 30 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1017, .unk2 = 0, .unk4 = 44 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1018, .unk2 = 0, .unk4 = 44 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1019, .unk2 = 0, .unk4 = 36 },
};
const struct UNK_080D95E8 sTimeRecordsScreenChoices[NUM_LANGUAGES][2] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        [TIME_RECORDS_CHOICE_ACTS] = { .unk0 = 959, .unk2 = 1, .unk4 = 36 },
        [TIME_RECORDS_CHOICE_BOSS] = { .unk0 = 959, .unk2 = 2, .unk4 = 36 },
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        [TIME_RECORDS_CHOICE_ACTS] = { .unk0 = 1015, .unk2 = 1, .unk4 = 36 },
        [TIME_RECORDS_CHOICE_BOSS] = { .unk0 = 1015, .unk2 = 2, .unk4 = 36 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        [TIME_RECORDS_CHOICE_ACTS] = { .unk0 = 1015, .unk2 = 1, .unk4 = 36 },
        [TIME_RECORDS_CHOICE_BOSS] = { .unk0 = 1015, .unk2 = 2, .unk4 = 36 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        [TIME_RECORDS_CHOICE_ACTS] = { .unk0 = 1015, .unk2 = 1, .unk4 = 36 },
        [TIME_RECORDS_CHOICE_BOSS] = { .unk0 = 1015, .unk2 = 2, .unk4 = 36 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        [TIME_RECORDS_CHOICE_ACTS] = { .unk0 = 1015, .unk2 = 1, .unk4 = 36 },
        [TIME_RECORDS_CHOICE_BOSS] = { .unk0 = 1015, .unk2 = 2, .unk4 = 36 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        [TIME_RECORDS_CHOICE_ACTS] = { .unk0 = 1015, .unk2 = 1, .unk4 = 36 },
        [TIME_RECORDS_CHOICE_BOSS] = { .unk0 = 1015, .unk2 = 2, .unk4 = 36 },
    },
};

const struct UNK_080D95E8 sTimeRecordsZoneActTitleDigits[7] = {
    { .unk0 = 1048, .unk2 = 2, .unk4 = 4 }, { .unk0 = 1048, .unk2 = 3, .unk4 = 6 }, { .unk0 = 1048, .unk2 = 4, .unk4 = 6 },
    { .unk0 = 1048, .unk2 = 5, .unk4 = 6 }, { .unk0 = 1048, .unk2 = 6, .unk4 = 6 }, { .unk0 = 1048, .unk2 = 7, .unk4 = 6 },
    { .unk0 = 1048, .unk2 = 8, .unk4 = 6 },
};

const struct UNK_080D95E8 sTimeRecordDigitTiles[11] = {
    { .unk0 = 1047, .unk2 = 0, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 1, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 2, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 3, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 4, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 5, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 6, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 7, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 8, .unk4 = 4 },
    { .unk0 = 1047, .unk2 = 9, .unk4 = 4 },
    [DELIMINATOR_DIGIT] = { .unk0 = 1047, .unk2 = 10, .unk4 = 4 },
};

const struct UNK_080D95E8 sZoneNameTitles[NUM_LANGUAGES][7] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        [ZONE_1] = { .unk0 = 1049, .unk2 = 0, .unk4 = 28 },
        [ZONE_2] = { .unk0 = 1049, .unk2 = 1, .unk4 = 28 },
        [ZONE_3] = { .unk0 = 1049, .unk2 = 2, .unk4 = 36 },
        [ZONE_4] = { .unk0 = 1049, .unk2 = 3, .unk4 = 30 },
        [ZONE_5] = { .unk0 = 1049, .unk2 = 4, .unk4 = 28 },
        [ZONE_6] = { .unk0 = 1049, .unk2 = 5, .unk4 = 22 },
        [ZONE_7] = { .unk0 = 1049, .unk2 = 6, .unk4 = 30 },
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        [ZONE_1] = { .unk0 = 1063, .unk2 = 0, .unk4 = 36 },
        [ZONE_2] = { .unk0 = 1063, .unk2 = 1, .unk4 = 34 },
        [ZONE_3] = { .unk0 = 1063, .unk2 = 2, .unk4 = 34 },
        [ZONE_4] = { .unk0 = 1063, .unk2 = 3, .unk4 = 36 },
        [ZONE_5] = { .unk0 = 1063, .unk2 = 4, .unk4 = 34 },
        [ZONE_6] = { .unk0 = 1063, .unk2 = 5, .unk4 = 36 },
        [ZONE_7] = { .unk0 = 1063, .unk2 = 6, .unk4 = 32 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        [ZONE_1] = { .unk0 = 1063, .unk2 = 0, .unk4 = 36 },
        [ZONE_2] = { .unk0 = 1063, .unk2 = 1, .unk4 = 34 },
        [ZONE_3] = { .unk0 = 1063, .unk2 = 2, .unk4 = 34 },
        [ZONE_4] = { .unk0 = 1063, .unk2 = 3, .unk4 = 36 },
        [ZONE_5] = { .unk0 = 1063, .unk2 = 4, .unk4 = 34 },
        [ZONE_6] = { .unk0 = 1063, .unk2 = 5, .unk4 = 36 },
        [ZONE_7] = { .unk0 = 1063, .unk2 = 6, .unk4 = 32 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        [ZONE_1] = { .unk0 = 1063, .unk2 = 0, .unk4 = 36 },
        [ZONE_2] = { .unk0 = 1063, .unk2 = 1, .unk4 = 34 },
        [ZONE_3] = { .unk0 = 1063, .unk2 = 2, .unk4 = 34 },
        [ZONE_4] = { .unk0 = 1063, .unk2 = 3, .unk4 = 36 },
        [ZONE_5] = { .unk0 = 1063, .unk2 = 4, .unk4 = 34 },
        [ZONE_6] = { .unk0 = 1063, .unk2 = 5, .unk4 = 36 },
        [ZONE_7] = { .unk0 = 1063, .unk2 = 6, .unk4 = 32 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        [ZONE_1] = { .unk0 = 1063, .unk2 = 0, .unk4 = 36 },
        [ZONE_2] = { .unk0 = 1063, .unk2 = 1, .unk4 = 34 },
        [ZONE_3] = { .unk0 = 1063, .unk2 = 2, .unk4 = 34 },
        [ZONE_4] = { .unk0 = 1063, .unk2 = 3, .unk4 = 36 },
        [ZONE_5] = { .unk0 = 1063, .unk2 = 4, .unk4 = 34 },
        [ZONE_6] = { .unk0 = 1063, .unk2 = 5, .unk4 = 36 },
        [ZONE_7] = { .unk0 = 1063, .unk2 = 6, .unk4 = 32 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        [ZONE_1] = { .unk0 = 1063, .unk2 = 0, .unk4 = 36 },
        [ZONE_2] = { .unk0 = 1063, .unk2 = 1, .unk4 = 34 },
        [ZONE_3] = { .unk0 = 1063, .unk2 = 2, .unk4 = 34 },
        [ZONE_4] = { .unk0 = 1063, .unk2 = 3, .unk4 = 36 },
        [ZONE_5] = { .unk0 = 1063, .unk2 = 4, .unk4 = 34 },
        [ZONE_6] = { .unk0 = 1063, .unk2 = 5, .unk4 = 36 },
        [ZONE_7] = { .unk0 = 1063, .unk2 = 6, .unk4 = 32 },
    },
};
const struct UNK_080D95E8 sZoneBossTitles[NUM_LANGUAGES][7] = {
    [LanguageIndex(LANG_JAPANESE)] = { 
        [ZONE_1] = { .unk0 = 1064, .unk2 = 0, .unk4 = 36 },
        [ZONE_2] = { .unk0 = 1064, .unk2 = 1, .unk4 = 34 },
        [ZONE_3] = { .unk0 = 1064, .unk2 = 2, .unk4 = 24 },
        [ZONE_4] = { .unk0 = 1064, .unk2 = 3, .unk4 = 22 },
        [ZONE_5] = { .unk0 = 1064, .unk2 = 4, .unk4 = 24 },
        [ZONE_6] = { .unk0 = 1064, .unk2 = 5, .unk4 = 28 },
        [ZONE_7] = { .unk0 = 1064, .unk2 = 6, .unk4 = 24 },
    },
    [LanguageIndex(LANG_ENGLISH)] = { 
        [ZONE_1] = { .unk0 = 1065, .unk2 = 0, .unk4 = 38 },
        [ZONE_2] = { .unk0 = 1065, .unk2 = 1, .unk4 = 38 },
        [ZONE_3] = { .unk0 = 1065, .unk2 = 2, .unk4 = 26 },
        [ZONE_4] = { .unk0 = 1065, .unk2 = 3, .unk4 = 22 },
        [ZONE_5] = { .unk0 = 1065, .unk2 = 4, .unk4 = 28 },
        [ZONE_6] = { .unk0 = 1065, .unk2 = 5, .unk4 = 34 },
        [ZONE_7] = { .unk0 = 1065, .unk2 = 6, .unk4 = 22 },
    },
    [LanguageIndex(LANG_GERMAN)] = { 
        [ZONE_1] = { .unk0 = 1065, .unk2 = 0, .unk4 = 38 },
        [ZONE_2] = { .unk0 = 1065, .unk2 = 1, .unk4 = 38 },
        [ZONE_3] = { .unk0 = 1065, .unk2 = 2, .unk4 = 26 },
        [ZONE_4] = { .unk0 = 1065, .unk2 = 3, .unk4 = 22 },
        [ZONE_5] = { .unk0 = 1065, .unk2 = 4, .unk4 = 28 },
        [ZONE_6] = { .unk0 = 1065, .unk2 = 5, .unk4 = 34 },
        [ZONE_7] = { .unk0 = 1065, .unk2 = 6, .unk4 = 22 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        [ZONE_1] = { .unk0 = 1065, .unk2 = 0, .unk4 = 38 },
        [ZONE_2] = { .unk0 = 1065, .unk2 = 1, .unk4 = 38 },
        [ZONE_3] = { .unk0 = 1065, .unk2 = 2, .unk4 = 26 },
        [ZONE_4] = { .unk0 = 1065, .unk2 = 3, .unk4 = 22 },
        [ZONE_5] = { .unk0 = 1065, .unk2 = 4, .unk4 = 28 },
        [ZONE_6] = { .unk0 = 1065, .unk2 = 5, .unk4 = 34 },
        [ZONE_7] = { .unk0 = 1065, .unk2 = 6, .unk4 = 22 },
    },
    [LanguageIndex(LANG_SPANISH)] = { 
        [ZONE_1] = { .unk0 = 1065, .unk2 = 0, .unk4 = 38 },
        [ZONE_2] = { .unk0 = 1065, .unk2 = 1, .unk4 = 38 },
        [ZONE_3] = { .unk0 = 1065, .unk2 = 2, .unk4 = 26 },
        [ZONE_4] = { .unk0 = 1065, .unk2 = 3, .unk4 = 22 },
        [ZONE_5] = { .unk0 = 1065, .unk2 = 4, .unk4 = 28 },
        [ZONE_6] = { .unk0 = 1065, .unk2 = 5, .unk4 = 34 },
        [ZONE_7] = { .unk0 = 1065, .unk2 = 6, .unk4 = 22 },
    },
    [LanguageIndex(LANG_ITALIAN)] = { 
        [ZONE_1] = { .unk0 = 1065, .unk2 = 0, .unk4 = 38 },
        [ZONE_2] = { .unk0 = 1065, .unk2 = 1, .unk4 = 38 },
        [ZONE_3] = { .unk0 = 1065, .unk2 = 2, .unk4 = 26 },
        [ZONE_4] = { .unk0 = 1065, .unk2 = 3, .unk4 = 22 },
        [ZONE_5] = { .unk0 = 1065, .unk2 = 4, .unk4 = 28 },
        [ZONE_6] = { .unk0 = 1065, .unk2 = 5, .unk4 = 34 },
        [ZONE_7] = { .unk0 = 1065, .unk2 = 6, .unk4 = 22 },
    },
};

void CreateOptionsScreen(u16 p1)
{
    struct Task *t;
    struct OptionsScreen *optionsScreen;
    s16 i;

    m4aSongNumStart(MUS_OPTIONS);

    t = TaskCreate(Task_OptionsScreenShow, sizeof(struct OptionsScreen), 0x1000, TASK_x0004, OptionsScreenTaskDestroyHandler);
    optionsScreen = TASK_DATA(t);

    ReadProfileData(optionsScreen);

    optionsScreen->unusedUnk358 = p1;
    optionsScreen->subMenuXPos = 0;
    optionsScreen->prevCursorPosition = 0;
    optionsScreen->subMenuAnimFrame = 0;
    optionsScreen->menuCursor = 0;
    optionsScreen->initialSubMenuCursorPosition = -1;

    ResetProfileScreensVram();

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }
}

// The logic for showing TA records
// and selecting a time attack course is the same,
// except the mode is TIME_ATTACK
// so this is within the profile source.
void CreateTimeAttackLevelSelectScreen(bool16 isBossView, s16 selectedCharacter, s8 unused_currentLevel)
{
    struct Task *t = TaskCreate(Task_TimeRecordsScreenCreateTimesUI, sizeof(struct TimeRecordsScreen), 0x2000, TASK_x0004, NULL);
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(t);
    s16 i;

    ReadAvailableCharacters(i, gLoadedSaveGame->unlockedCharacters);

    timeRecordsScreen->playerDataMenu = 0;
    timeRecordsScreen->timeRecords = EwramMalloc(sizeof(struct TimeRecords));
    timeRecordsScreen->character = selectedCharacter;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unusedUnk708 = FALSE;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->unlockedCourses[i] = gLoadedSaveGame->unlockedLevels[i];
    }

    timeRecordsScreen->language = LanguageIndex(gLoadedSaveGame->language);
    timeRecordsScreen->isBossMode = isBossView;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK;

    if (timeRecordsScreen->language > NUM_LANGUAGES - 1) {
#ifdef JAPAN
        timeRecordsScreen->language = LanguageIndex(LANG_JAPANESE);
#else
        timeRecordsScreen->language = LanguageIndex(LANG_ENGLISH);
#endif
    }

    memcpy(timeRecordsScreen->timeRecords, &gLoadedSaveGame->timeRecords, sizeof(struct TimeRecords));

    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    TimeRecordsScreenCreateCoursesViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);
    m4aSongNumStart(MUS_TA_COURSE_SELECTION);
}

void CreateNewProfileScreen(void)
{
    struct Task *t;
    struct LanguageScreen *languageScreen;

    ShuffleRngSeed();

    t = TaskCreate(Task_LanguageScreenFadeIn, sizeof(struct LanguageScreen), 0x2000, TASK_x0004, NULL);
    languageScreen = TASK_DATA(t);

    languageScreen->optionsScreen = NULL;
    languageScreen->menuCursor = LanguageIndex(gLoadedSaveGame->language);
    languageScreen->creatingNewProfile = TRUE;

    if ((u8)languageScreen->menuCursor >= NUM_LANGUAGES) {
#ifdef JAPAN
        languageScreen->menuCursor = LanguageIndex(LANG_JAPANESE);
#else
        languageScreen->menuCursor = LanguageIndex(LANG_ENGLISH);
#endif
    }

    ResetProfileScreensVram();

    LanguageScreenInitRegisters(languageScreen);
    LanguageScreenCreateBackgroundsUI(languageScreen);
    LanguageScreenCreateUI(languageScreen);
}

void CreateNewProfileNameScreen(s16 mode)
{
    struct Task *t = TaskCreate(Task_ProfileNameScreenFadeIn, sizeof(struct ProfileNameScreen), 0x2000, TASK_x0004, NULL);
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(t);
    s16 i;

    profileNameScreen->playerDataMenu = NULL;
    profileNameScreen->language = LanguageIndex(gLoadedSaveGame->language);

    profileNameScreen->onCompleteAction
        = mode == NEW_PROFILE_NAME_START_GAME ? NAME_SCREEN_COMPLETE_ACTION_START_GAME : NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER;
    profileNameScreen->cursorCol = 0;

    if (profileNameScreen->language == LanguageIndex(LANG_JAPANESE)) {
        profileNameScreen->matrixCursorIndex = 0;
        profileNameScreen->cursorRow = 0;
        profileNameScreen->matrixPageIndex = 0;
    } else {
        profileNameScreen->matrixCursorIndex = 99;
        profileNameScreen->cursorRow = 0;
        profileNameScreen->matrixPageIndex = 99;
    }

    if (profileNameScreen->language > NUM_LANGUAGES - 1) {
#ifdef JAPAN
        profileNameScreen->language = LanguageIndex(LANG_JAPANESE);
#else
        profileNameScreen->language = LanguageIndex(LANG_ENGLISH);
#endif
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        profileNameScreen->nameInput.buffer[i] = PLAYER_NAME_END_CHAR;
    }

    profileNameScreen->nameInput.cursor = 0;
    ResetProfileScreensVram();

    ProfileNameScreenInitRegisters(profileNameScreen->language);
    ProfileNameScreenCreateUIBackgrounds(profileNameScreen);
    ProfileNameScreenCreateUIText(profileNameScreen);
    ProfileNameScreenCreateUIContextElements(profileNameScreen);
    ProfileNameScreenCreateInputDisplayUI(profileNameScreen);
}

static void ReadProfileData(struct OptionsScreen *optionsScreen)
{
    struct SaveGame *saveGame = gLoadedSaveGame;
    struct OptionsScreenProfileData *profile = &optionsScreen->profileData;

    s16 i;

    memcpy(profile->playerName, saveGame->playerName, sizeof(saveGame->playerName));
    memcpy(&profile->timeRecords, &saveGame->timeRecords, sizeof(saveGame->timeRecords));
    memcpy(profile->multiplayerScores, saveGame->multiplayerScores, sizeof(saveGame->multiplayerScores));

    profile->multiplayerWins = saveGame->multiplayerWins;
    profile->multiplayerLoses = saveGame->multiplayerLoses;
    profile->multiplayerDraws = saveGame->multiplayerDraws;

    memcpy(&profile->buttonConfig, &saveGame->buttonConfig, 8);

    optionsScreen->difficultyLevel = saveGame->difficultyLevel;
    optionsScreen->timeLimitDisabled = saveGame->timeLimitDisabled;
    optionsScreen->language = LanguageIndex(saveGame->language);
    optionsScreen->soundTestUnlocked = saveGame->soundTestUnlocked;
    optionsScreen->bossTimeAttackUnlocked = saveGame->bossTimeAttackUnlocked;
    optionsScreen->unk35E = saveGame->unlockedCharacters;

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        if (profile->playerName[i] == PLAYER_NAME_END_CHAR) {
            break;
        }
    }

    for (; i < MAX_PLAYER_NAME_LENGTH; i++) {
        profile->playerName[i] = PLAYER_NAME_END_CHAR;
    }

    if (optionsScreen->difficultyLevel > 1) {
        optionsScreen->difficultyLevel = 0;
    }

    if (optionsScreen->timeLimitDisabled > 1) {
        optionsScreen->timeLimitDisabled = FALSE;
    }

    if (optionsScreen->language > NUM_LANGUAGES - 1) {
#ifdef JAPAN
        optionsScreen->language = LanguageIndex(LANG_JAPANESE);
#else
        optionsScreen->language = LanguageIndex(LANG_ENGLISH);
#endif
    }

    if (optionsScreen->soundTestUnlocked > 1) {
        optionsScreen->soundTestUnlocked = FALSE;
    }

    if (optionsScreen->bossTimeAttackUnlocked > 1) {
        optionsScreen->bossTimeAttackUnlocked = FALSE;
    }
}

static void StoreProfileData(struct OptionsScreen *optionsScreen)
{
    struct SaveGame *saveGame = gLoadedSaveGame;
    struct OptionsScreenProfileData *profile = &optionsScreen->profileData;

    memcpy(saveGame->playerName, profile->playerName, sizeof(profile->playerName));
    saveGame->timeRecords = profile->timeRecords;

    memcpy(saveGame->multiplayerScores, profile->multiplayerScores, sizeof(struct MultiplayerScore));

    saveGame->multiplayerWins = profile->multiplayerWins;
    saveGame->multiplayerLoses = profile->multiplayerLoses;
    saveGame->multiplayerDraws = profile->multiplayerDraws;

    // Doesn't match when assigned, not sure
    memcpy(&saveGame->buttonConfig, &profile->buttonConfig, sizeof(struct ButtonConfig));

    saveGame->difficultyLevel = optionsScreen->difficultyLevel;
    saveGame->timeLimitDisabled = optionsScreen->timeLimitDisabled;
    saveGame->language = optionsScreen->language + 1;
    saveGame->soundTestUnlocked = optionsScreen->soundTestUnlocked;
    saveGame->bossTimeAttackUnlocked = optionsScreen->bossTimeAttackUnlocked;
}

// OptionsScreenInitRegistersAndFadeIn
static void OptionsScreenInitRegisters(struct OptionsScreen *optionsScreen, s16 state)
{
    ScreenFade *fade = &optionsScreen->unk774;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    if (state == OPTIONS_SCREEN_STATE_ACTIVE) {
        gBgScrollRegs[2][0] = 0xFF28;
    } else {
        gBgScrollRegs[2][0] = 0;
    }

    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    if (state == OPTIONS_SCREEN_STATE_ACTIVE) {
        fade->window = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_USE_WINDOW_0);
        fade->flags = SCREEN_FADE_FLAG_2;
        fade->brightness = 0;
        fade->speed = 0x100;
        fade->bldAlpha = 0;
        fade->bldCnt = 0xFF;

        UpdateScreenFade(fade);
    }
}

static void OptionsScreenCreateUI(struct OptionsScreen *optionsScreen, s16 state)
{
    u8 language = optionsScreen->language;

    Sprite *title = &optionsScreen->title;
    Sprite *menuItem = optionsScreen->menuItems;
    Sprite *metaItem = optionsScreen->metaItems;
    Sprite *playerNameDisplayChar = optionsScreen->playerNameDisplay;

    struct UNK_806B908 nameCharTile;
    s16 i, xPos, yPos;

    {
        const struct UNK_080D95E8 *titleText = &sOptionsScreenTitleText[language];
        sub_806A568(title, RENDER_TARGET_SCREEN, titleText->unk4, titleText->unk0, 0x3000, 0, 0xF, 0xF, titleText->unk2, 0);
    }

    for (i = 0, yPos = 30; i < NUM_OPTIONS_MENU_ITEMS; i++, menuItem++) {
        if (optionsScreen->soundTestUnlocked || i != OPTIONS_MENU_ITEM_SOUND_TEST) {
            const struct UNK_080D95E8 *itemText = &sOptionsScreenMenuItemsText[language][i];

            if (optionsScreen->menuCursor == i) {
                xPos = 32;
            } else {
                xPos = 40;
            }

            if (state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN && i == OPTIONS_MENU_ITEM_PLAYER_DATA) {
                xPos = -184;
            }
            sub_806A568(menuItem, RENDER_TARGET_SCREEN, itemText->unk4, itemText->unk0, 0x3000, xPos, yPos, 0xD, itemText->unk2, 0);
            yPos += 15;
        }
    }

    {
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_PLAYER_DATA ? 152 : 160;
        if (state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN) {
            xPos = -64;
        }
        sub_806A568(metaItem, RENDER_TARGET_SCREEN, 0x12, 0x3BA, 0x3000, xPos, 30, 0xC, 0, 0);
        ++metaItem;
    }

    {
        const struct UNK_080D95E8 *difficultyLevelText = &sDifficultyLevelSwitchText[language][optionsScreen->difficultyLevel];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_DIFFICULTY ? 152 : 160;

        sub_806A568(metaItem, RENDER_TARGET_SCREEN, difficultyLevelText->unk4, difficultyLevelText->unk0, 0x3000, xPos, 45, 10,
                    difficultyLevelText->unk2, 0);
        ++metaItem;
    }

    {
        const struct UNK_080D95E8 *timeLimitSwitchText = &sTimeLimitMenuSwitchText[language][optionsScreen->timeLimitDisabled];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_TIME_LIMIT ? 152 : 160;

        sub_806A568(metaItem, RENDER_TARGET_SCREEN, timeLimitSwitchText->unk4, timeLimitSwitchText->unk0, 0x3000, xPos, 0x3C, 10,
                    timeLimitSwitchText->unk2, 0);
        ++metaItem;
    }

    {
        const struct UNK_080D95E8 *languageText = &sOptionsScreenSelectedLanguageText[language];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_LANGUAGE ? 152 : 160;

        sub_806A568(metaItem, RENDER_TARGET_SCREEN, languageText->unk4, languageText->unk0, 0x3000, xPos, 0x4B, 10, languageText->unk2, 0);
    }
    {
        bool32 finishedReadingName;
        u16 nameChar;

        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_PLAYER_DATA ? 163 : 171;
        if (state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN && i == 0) {
            xPos = -53;
        }

        for (i = 0, yPos = 38, finishedReadingName = FALSE; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++, xPos += 10) {
            if (finishedReadingName) {
                nameChar = 0x11;
            } else {
                nameChar = optionsScreen->profileData.playerName[i];
            }

            if (nameChar == PLAYER_NAME_END_CHAR) {
                nameChar = 0x11;
                finishedReadingName = TRUE;
            }

            nameCharTile = sub_806B908(nameChar);
            sub_806A568(playerNameDisplayChar, RENDER_TARGET_SCREEN, nameCharTile.unk0, nameCharTile.unk4, 0x3000, xPos, yPos, 10,
                        nameCharTile.unk6, 0);
            playerNameDisplayChar->palId = optionsScreen->menuCursor == 0 ? 7 : 8;
        }
    }

    metaItem = optionsScreen->metaItems;
    menuItem = optionsScreen->menuItems;
    for (i = 0; i < NUM_OPTIONS_MENU_ITEMS; i++) {
        if (optionsScreen->menuCursor == i) {
            menuItem->palId = 0;
        } else {
            menuItem->palId = 1;
        }

        ++menuItem;
        if (i > 3)
            continue;

        if (optionsScreen->menuCursor == i) {
            metaItem->palId = 0;
        } else {
            metaItem->palId = 1;
        }
        ++metaItem;
    }

    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3c4, 0, 0, 0, 0, 0, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3c4, 0, 0, 0, 0, 1, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3c3, 0, 0, 0, 0, 0xc, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3c3, 0, 0, 0, 0, 0xd, 0);
}

static void Task_OptionsScreenMain(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);

    OptionsScreenRenderUI();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        switch (optionsScreen->menuCursor) {
            case OPTIONS_MENU_ITEM_LANGUAGE:
                OptionsScreenShowLanguageScreen();
                return;
            case OPTIONS_MENU_ITEM_SOUND_TEST:
                OptionsScreenShowSoundTestScreen();
                return;
            case OPTIONS_MENU_ITEM_DELETE_GAME_DATA:
                OptionsScreenShowDeleteScreen();
                return;
            case OPTIONS_MENU_ITEM_EXIT:
                OptionsScreenHandleExit();
                return;
            default:
                // For other menu items we can just handle this generically
                OptionsScreenOpenSelectedSubMenu();
                return;
        }
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        OptionsScreenHandleExit();
        return;
    }

    if (gRepeatedKeys & DPAD_DOWN) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        optionsScreen->prevCursorPosition = optionsScreen->menuCursor;

        if (optionsScreen->menuCursor >= NUM_OPTIONS_MENU_ITEMS - 1) {
            optionsScreen->menuCursor = 0;
        } else {
            optionsScreen->menuCursor++;
        }

        // Skip the soundtest menu index if not available
        if (!optionsScreen->soundTestUnlocked && optionsScreen->menuCursor == OPTIONS_MENU_ITEM_SOUND_TEST) {
            optionsScreen->menuCursor++;
        }
        optionsScreen->subMenuAnimFrame = 0;
        gCurTask->main = Task_OptionsScreenMenuCursorMoveAnim;
        return;
    }

    if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        optionsScreen->prevCursorPosition = optionsScreen->menuCursor;
        if (optionsScreen->menuCursor <= 0) {
            optionsScreen->menuCursor = NUM_OPTIONS_MENU_ITEMS - 1;
        } else {
            optionsScreen->menuCursor--;
        }

        if (!optionsScreen->soundTestUnlocked && optionsScreen->menuCursor == OPTIONS_MENU_ITEM_SOUND_TEST) {
            optionsScreen->menuCursor--;
        }

        optionsScreen->subMenuAnimFrame = 0;
        gCurTask->main = Task_OptionsScreenMenuCursorMoveAnim;
    }
}

static inline void NextMenuCursorAnimFrame(struct OptionsScreen *optionsScreen, s8 subMenuAnimPos)
{
    s16 baseXPos;
    Sprite *item;

    optionsScreen->subMenuXPos = subMenuAnimPos;
    baseXPos = subMenuAnimPos;

    item = &optionsScreen->menuItems[optionsScreen->menuCursor];
    item->x = baseXPos + 32;
    item->palId = 0;

    if (optionsScreen->menuCursor < 4) {
        item = &optionsScreen->metaItems[optionsScreen->menuCursor];
        item->x = baseXPos + 152;
        item->palId = 0;

        if (optionsScreen->menuCursor == OPTIONS_MENU_ITEM_PLAYER_DATA) {
            s16 i;
            Sprite *playerNameDisplayChar = optionsScreen->playerNameDisplay;

            for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
                playerNameDisplayChar->x = baseXPos + 163 + UI_COLUMN(i, 10);
                playerNameDisplayChar->palId = 7;
            }
        }
    }

    baseXPos = -216 - baseXPos;
    gBgScrollRegs[2][0] = baseXPos;
}

static inline void PrevMenuCursorAnimFrame(struct OptionsScreen *optionsScreen, s8 baseXPos)
{
    Sprite *item = &optionsScreen->menuItems[optionsScreen->prevCursorPosition];

    item->x = baseXPos + 32;
    item->palId = 1;

    if (optionsScreen->prevCursorPosition < 4) {
        item = &optionsScreen->metaItems[optionsScreen->prevCursorPosition];
        item->x = baseXPos + 152;
        item->palId = 1;

        if (optionsScreen->prevCursorPosition == OPTIONS_MENU_ITEM_PLAYER_DATA) {
            s16 i;
            Sprite *playerNameDisplayChar = optionsScreen->playerNameDisplay;
            for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
                playerNameDisplayChar->x = baseXPos + 163 + UI_COLUMN(i, 10);
                playerNameDisplayChar->palId = 8;
            }
        }
    }
}

static void Task_OptionsScreenMenuCursorMoveAnim(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    s16 animFrame = optionsScreen->subMenuAnimFrame;

    NextMenuCursorAnimFrame(optionsScreen, sMenuCursorMoveAnims[OPTIONS_SCREEN_NEXT_CURSOR_MOVE_ANIMS][animFrame]);
    PrevMenuCursorAnimFrame(optionsScreen, sMenuCursorMoveAnims[OPTIONS_SCREEN_PREV_CURSOR_MOVE_ANIMS][animFrame]);

    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame >= 8) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static inline void SubMenuAnimFrame(struct OptionsScreen *optionsScreen, const s16 *animFrames)
{
    s16 baseXPos = optionsScreen->subMenuXPos = animFrames[optionsScreen->subMenuAnimFrame];
    Sprite *item = &optionsScreen->menuItems[optionsScreen->menuCursor];

    item->x = baseXPos + 32;
    item->palId = 0;

    if (optionsScreen->menuCursor < 4) {
        Sprite *item = &optionsScreen->metaItems[optionsScreen->menuCursor];
        item->x = baseXPos + 152;
        item->palId = 0;

        if (optionsScreen->menuCursor == 0) {
            s16 i;
            Sprite *playerNameDisplayChar = optionsScreen->playerNameDisplay;

            for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
                playerNameDisplayChar->x = baseXPos + 163 + UI_COLUMN(i, 10);
                playerNameDisplayChar->palId = 7;
            }
        }
    }

    baseXPos = -216 - baseXPos;
    gBgScrollRegs[2][0] = baseXPos;
}

static void Task_OptionsScreenSubMenuOpenAnim(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);

    SubMenuAnimFrame(optionsScreen, sSubMenuOpenAnim);
    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame >= 16) {
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForSubMenuExit;
    }
}

static void Task_OptionsScreenSubMenuCloseAnim(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);

    SubMenuAnimFrame(optionsScreen, sSubMenuCloseAnim);
    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame >= 16) {
        ResetProfileScreensSubMenuVram();
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static void Task_OptionsScreenWaitForLanguageScreenExit(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;

    if (optionsScreen->state != OPTIONS_SCREEN_STATE_ACTIVE) {
        return;
    }

    ResetProfileScreensVram();

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_OptionsScreenFadeInFromLanguageScreen;
}

static void Task_OptionsScreenWaitForSoundTestExit(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;

    if (optionsScreen->state != OPTIONS_SCREEN_STATE_ACTIVE) {
        return;
    }

    ResetProfileScreensVram();

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    m4aSongNumStart(MUS_OPTIONS);
    gCurTask->main = Task_OptionsScreenFadeInFromSoundTest;
}

static void Task_OptionsScreenWaitForDeleteScreenExit(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;
    u8 language = optionsScreen->language;

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN) {
        return;
    }

    ResetProfileScreensVram();

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_ACTIVE) {
        ReadProfileData(optionsScreen);
    }

    optionsScreen->language = language;

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_ACTIVE) {
        m4aSongNumStart(MUS_OPTIONS);
    }

    optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
    gCurTask->main = Task_OptionsScreenFadeInFromDeleteScreen;
}

static void OptionsScreenRenderUI(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    Sprite *title = &optionsScreen->title;
    Sprite *menuItem = optionsScreen->menuItems;
    Sprite *metaItem = optionsScreen->metaItems;
    Sprite *playerNameDisplayChar = optionsScreen->playerNameDisplay;
    s16 i;

    DisplaySprite(title);

    for (i = 0; i < NUM_OPTIONS_MENU_ITEMS; i++, menuItem++) {
        if (optionsScreen->soundTestUnlocked || i != OPTIONS_MENU_ITEM_SOUND_TEST) {
            DisplaySprite(menuItem);
            if (i < 4) {
                DisplaySprite(metaItem);
                metaItem++;
            }
        }
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
        DisplaySprite(playerNameDisplayChar);
    }
}

static void CreatePlayerDataMenu(struct OptionsScreen *optionsScreen)
{
    struct Task *t = TaskCreate(Task_PlayerDataMenuOpenAnimWait, sizeof(struct PlayerDataMenu), 0x2000, TASK_x0004, NULL);
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(t);

    s16 initialCursorPos;
    if (optionsScreen->initialSubMenuCursorPosition != -1) {
        initialCursorPos = optionsScreen->initialSubMenuCursorPosition;
    } else {
        initialCursorPos = 0;
    }

    playerDataMenu->optionsScreen = optionsScreen;
    playerDataMenu->menuCursor = initialCursorPos;
    playerDataMenu->animFrame = 0;
    playerDataMenu->language = optionsScreen->language;

    PlayerDataMenuCreateUI(playerDataMenu);
}

static void PlayerDataMenuCreateUI(struct PlayerDataMenu *playerDataMenu)
{
    Sprite *headerFooter = playerDataMenu->headerFooter;
    Sprite *menuItem = playerDataMenu->menuItems;
    Sprite *menuItemOutline = &playerDataMenu->menuItemOutline;

    const struct UNK_080D95E8 *titleText = &sPlayerDataMenuTitleText[playerDataMenu->language];
    const struct UNK_080D95E8 *footerText = &sPlayerDataMenuControlsText[playerDataMenu->language];
    const struct UNK_080D95E8 *menuItemText = sPlayerDataMenuItemsText[playerDataMenu->language];

    s16 baseXPos = playerDataMenu->optionsScreen->subMenuXPos;
    s16 menuCursor = playerDataMenu->menuCursor;

    s16 i, yPos;

    // Title
    sub_806A568(&headerFooter[0], RENDER_TARGET_SUB_MENU, titleText->unk4, titleText->unk0, 0x1000, baseXPos + 336, 32, 8, titleText->unk2,
                0);

    // Controls
    sub_806A568(&headerFooter[1], RENDER_TARGET_SUB_MENU, footerText->unk4, footerText->unk0, 0x1000, baseXPos + 336, 132, 8,
                footerText->unk2, 0);

    // Menu items
    for (i = 0, yPos = 46; i < NUM_PLAYER_DATA_MENU_ITEMS; i++, menuItem++, menuItemText++, yPos += 19) {
        sub_806A568(menuItem, RENDER_TARGET_SUB_MENU, menuItemText->unk4, menuItemText->unk0, 0x1000, baseXPos + 256, yPos, 8,
                    menuItemText->unk2, 0);

        // Interesting to note that gcc
        // uses some trickery here to set this
        // and the actual logic is `(u32)(-temp0 | temp0) >> 31;`
        menuItem->palId = (menuCursor ^ i) ? 1 : 0;
    }

    sub_806A568(menuItemOutline, RENDER_TARGET_SUB_MENU, 0x3f, 0x3bd, 0x1000, baseXPos + 254, menuCursor * 19 + 46, 7, 5, 0);
}

static void Task_PlayerDataMenuOpenAnimWait(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = playerDataMenu->headerFooter;
    Sprite *menuItem = playerDataMenu->menuItems;
    Sprite *menuItemOutline = &playerDataMenu->menuItemOutline;

    s16 baseXPos = playerDataMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->x = baseXPos + 336;
    }

    for (i = 0; i < 4; i++, menuItem++) {
        menuItem->x = baseXPos + 256;
    }

    menuItemOutline->x = baseXPos + 254;

    PlayerDataMenuRenderUI();

    if (++playerDataMenu->animFrame >= 16) {
        playerDataMenu->animFrame = 0;
        gCurTask->main = Task_PlayerDataMenuMain;
    }
}

static void Task_PlayerDataMenuMain(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    Sprite *menuItem = playerDataMenu->menuItems;
    Sprite *menuItemOutline = &playerDataMenu->menuItemOutline;
    struct OptionsScreen *optionsScreen = playerDataMenu->optionsScreen;
    s16 i;

    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        // Move the cursor up and down
        if (gRepeatedKeys & DPAD_UP) {
            if (playerDataMenu->menuCursor != 0) {
                playerDataMenu->menuCursor--;
            } else {
                playerDataMenu->menuCursor = 3;
            }
        } else if (gRepeatedKeys & DPAD_DOWN) {
            if (playerDataMenu->menuCursor < NUM_PLAYER_DATA_MENU_ITEMS - 1) {
                playerDataMenu->menuCursor++;
            } else {
                playerDataMenu->menuCursor = 0;
            }
        }

        for (i = 0; i < 4; i++, menuItem++) {
            menuItem->palId = (playerDataMenu->menuCursor ^ i) ? 1 : 0;
        }
        menuItemOutline->y = playerDataMenu->menuCursor * 19 + 46;
    }

    PlayerDataMenuRenderUI();
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        switch (playerDataMenu->menuCursor) {
            case PLAYER_DATA_MENU_ITEM_CHANGE_NAME:
                PlayerDataMenuShowProfileNameScreen();
                return;
            case PLAYER_DATA_MENU_ITEM_TIME_RECORDS:
                PlayerDataMenuShowTimeRecordsScreen();
                return;
            case PLAYER_DATA_MENU_ITEM_VS_RECORDS:
                PlayerDataMenuShowMultiplayerRecordsScreen();
                return;
            case PLAYER_DATA_MENU_ITEM_EXIT:
                optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
                gCurTask->main = Task_PlayerDataMenuCloseAnim;
                return;
            default:
                return;
        }
    } else if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_PlayerDataMenuCloseAnim;
    }
}

static void Task_PlayerDataMenuCloseAnim(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = playerDataMenu->headerFooter;
    Sprite *menuItem = playerDataMenu->menuItems;
    Sprite *menuItemOutline = &playerDataMenu->menuItemOutline;

    s16 baseXPos = playerDataMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->x = baseXPos + 336;
    }

    for (i = 0; i < NUM_PLAYER_DATA_MENU_ITEMS; i++, menuItem++) {
        menuItem->x = baseXPos + 256;
    }

    menuItemOutline->x = baseXPos + 254;

    if (++playerDataMenu->animFrame < 15) {
        PlayerDataMenuRenderUI();
    } else {
        TaskDestroy(gCurTask);
    }
}

static inline void OptionsScreenRecreateUIForPlayerDataMenu(struct PlayerDataMenu *playerDataMenu, ScreenFade *fade)
{
    struct OptionsScreen *optionsScreen;

    ResetProfileScreensVram();

    OptionsScreenInitRegisters(playerDataMenu->optionsScreen, OPTIONS_SCREEN_STATE_SUB_MENU_OPEN);

    optionsScreen = playerDataMenu->optionsScreen;
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(playerDataMenu->optionsScreen, 1);
    PlayerDataMenuCreateUI(playerDataMenu);

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
}

static void Task_PlayerDataMenuWaitForProfileNameScreenExit(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == 0) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromProfileNameScreen;
    }
}

static void Task_PlayerDataMenuFadeOutToTimeRecordsScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    // fade out until complete
    if (UpdateScreenFade(unk150)) {
        if (playerDataMenu->optionsScreen->bossTimeAttackUnlocked) {
            // give player the choice
            CreateTimeRecordsScreen(playerDataMenu);
        } else {
            CreateTimeRecordsScreenAtCoursesView(playerDataMenu);
        }
        playerDataMenu->state = PLAYER_DATA_MENU_STATE_SCREEN_OPEN;
        playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;

        gCurTask->main = Task_PlayerDataMenuWaitForTimeRecordsScreenExit;
    }
}

static void Task_PlayerDataMenuWaitForTimeRecordsScreenExit(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == PLAYER_DATA_MENU_STATE_ACTIVE) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromTimeRecordsScreen;
    }
}

static void Task_PlayerDataMenuWaitForMultiplayerRecordsScreenExit(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == PLAYER_DATA_MENU_STATE_ACTIVE) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromMultiplayerRecordsScreen;
    }
}

static void DifficultyMenuCreateUI(struct SwitchMenu *difficultyMenu)
{
    Sprite *headerFooter = difficultyMenu->headerFooter;
    Sprite *difficultyOption = difficultyMenu->options;
    Sprite *switchValueOutline = &difficultyMenu->switchValueOutline;

    const struct UNK_080D95E8 *titleText = &sDifficultyMenuTitleText[difficultyMenu->language];
    const struct UNK_080D95E8 *footerText = &sDifficultyMenuControlsText[difficultyMenu->language];
    const struct UNK_080D95E8 *difficultyLevelText = sDifficultyLevelSwitchText[difficultyMenu->language];

    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 difficultyLevel = difficultyMenu->switchValue;
    s16 i;

    sub_806A568(headerFooter, RENDER_TARGET_SUB_MENU, titleText->unk4, titleText->unk0, 0x1000, baseXPos + 336, 50, 8, titleText->unk2, 0);

    headerFooter++;
    sub_806A568(headerFooter, RENDER_TARGET_SUB_MENU, footerText->unk4, footerText->unk0, 0x1000, baseXPos + 336, 116, 8, footerText->unk2,
                0);

    // Normal
    sub_806A568(difficultyOption, RENDER_TARGET_SUB_MENU, difficultyLevelText->unk4, difficultyLevelText->unk0, 0x1000, baseXPos + 274, 76,
                8, difficultyLevelText->unk2, 0);

    difficultyOption++;
    difficultyLevelText++;
    // Easy
    sub_806A568(difficultyOption, RENDER_TARGET_SUB_MENU, difficultyLevelText->unk4, difficultyLevelText->unk0, 0x1000, baseXPos + 334, 76,
                8, difficultyLevelText->unk2, 0);

    sub_806A568(switchValueOutline, RENDER_TARGET_SUB_MENU, 0x12, 0x3b8, 0x1000, difficultyLevel * 60 + 272, 76, 7, 3, 0);

    for (i = 0, difficultyOption = difficultyMenu->options; i < 2; i++, difficultyOption++) {
        difficultyOption->palId = (difficultyLevel ^ i) ? 1 : 0;
    }
}

static void Task_DifficultyMenuOpenAnimWait(void)
{
    struct SwitchMenu *difficultyMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = difficultyMenu->headerFooter;
    Sprite *difficultyOption = difficultyMenu->options;
    Sprite *switchValueOutline = &difficultyMenu->switchValueOutline;

    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->x = baseXPos + 336;
    }

    difficultyOption->x = baseXPos + 274;
    difficultyOption++;
    difficultyOption->x = baseXPos + 334;
    switchValueOutline->x = baseXPos + 272 + UI_COLUMN(difficultyMenu->switchValue, 60);

    DifficultyMenuRenderUI();

    if (++difficultyMenu->animFrame >= 16) {
        difficultyMenu->animFrame = 0;
        gCurTask->main = Task_DifficultyMenuMain;
    }
}

static void Task_DifficultyMenuMain(void)
{
    struct SwitchMenu *difficultyMenu = TASK_DATA(gCurTask);
    Sprite *difficultyOption = difficultyMenu->options;
    Sprite *switchValueOutline = &difficultyMenu->switchValueOutline;
    struct OptionsScreen *optionsScreen = difficultyMenu->optionsScreen;

    s16 baseXPos = optionsScreen->subMenuXPos;
    s16 language = difficultyMenu->language;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        difficultyMenu->switchValue = difficultyMenu->switchValue == 0;

        for (i = 0; i < 2; i++, difficultyOption++) {
            difficultyOption->palId = (difficultyMenu->switchValue ^ i) ? 1 : 0;
        }

        switchValueOutline->x = baseXPos + 272 + UI_COLUMN(difficultyMenu->switchValue, 60);
    }

    DifficultyMenuRenderUI();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *difficultyLevelText = &sDifficultyLevelSwitchText[language][difficultyMenu->switchValue];

        difficultyOption = &optionsScreen->metaItems[OPTIONS_META_ITEM_DIFFICULTY_LEVEL];
        difficultyOption->variant = difficultyLevelText->unk2;
        difficultyOption->graphics.anim = difficultyLevelText->unk0;
        UpdateSpriteAnimation(difficultyOption);

        m4aSongNumStart(SE_SELECT);

        optionsScreen->difficultyLevel = difficultyMenu->switchValue;
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_DifficultyMenuCloseAnim;
        return;
    }

    if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_DifficultyMenuCloseAnim;
    }
}

static void Task_DifficultyMenuCloseAnim(void)
{
    struct SwitchMenu *difficultyMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = difficultyMenu->headerFooter;
    Sprite *difficultyOption = difficultyMenu->options;
    Sprite *switchValueOutline = &difficultyMenu->switchValueOutline;

    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->x = baseXPos + 336;
    }

    difficultyOption->x = baseXPos + 274;
    difficultyOption++;
    difficultyOption->x = baseXPos + 334;
    switchValueOutline->x = baseXPos + 272 + UI_COLUMN(difficultyMenu->switchValue, 60);

    if (++difficultyMenu->animFrame < 0xF) {
        DifficultyMenuRenderUI();
    } else {
        TaskDestroy(gCurTask);
    }
}

static void TimeLimitMenuCreateUI(struct SwitchMenu *timeLimitMenu)
{
    // same function as sub_806525C
    Sprite *headerFooter = timeLimitMenu->headerFooter;
    Sprite *timeLimitOption = timeLimitMenu->options;
    Sprite *switchValueOutline = &timeLimitMenu->switchValueOutline;

    const struct UNK_080D95E8 *titleText = &sTimeLimitMenuTitleText[timeLimitMenu->language];
    const struct UNK_080D95E8 *footerText = &sTimeLimitMenuControlsText[timeLimitMenu->language];
    const struct UNK_080D95E8 *timeLimitSwitchText = sTimeLimitMenuSwitchText[timeLimitMenu->language];

    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 timeLimitDisabled = timeLimitMenu->switchValue;
    s16 i;

    // TODO: can these be a macro?
    sub_806A568(headerFooter, RENDER_TARGET_SUB_MENU, titleText->unk4, titleText->unk0, 0x1000, baseXPos + 336, 50, 8, titleText->unk2, 0);

    headerFooter++;
    sub_806A568(headerFooter, RENDER_TARGET_SUB_MENU, footerText->unk4, footerText->unk0, 0x1000, baseXPos + 336, 116, 8, footerText->unk2,
                0);

    // On
    sub_806A568(timeLimitOption, RENDER_TARGET_SUB_MENU, timeLimitSwitchText->unk4, timeLimitSwitchText->unk0, 0x1000, baseXPos + 274, 76,
                8, timeLimitSwitchText->unk2, 0);

    timeLimitOption++;
    timeLimitSwitchText++;
    // Off
    sub_806A568(timeLimitOption, RENDER_TARGET_SUB_MENU, timeLimitSwitchText->unk4, timeLimitSwitchText->unk0, 0x1000, baseXPos + 334, 76,
                8, timeLimitSwitchText->unk2, 0);

    sub_806A568(switchValueOutline, RENDER_TARGET_SUB_MENU, 0x12, 0x3b8, 0x1000, timeLimitDisabled * 60 + 272, 76, 7, 3, 0);

    for (i = 0, timeLimitOption = timeLimitMenu->options; i < 2; i++, timeLimitOption++) {
        timeLimitOption->palId = (timeLimitDisabled ^ i) ? 1 : 0;
    }
}

static void Task_TimeLimitMenuOpenAnimWait(void)
{
    struct SwitchMenu *timeLimitMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = timeLimitMenu->headerFooter;
    Sprite *timeLimitOption = timeLimitMenu->options;
    Sprite *switchValueOutline = &timeLimitMenu->switchValueOutline;

    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->x = baseXPos + 336;
    }

    timeLimitOption->x = baseXPos + 274;
    timeLimitOption++;
    timeLimitOption->x = baseXPos + 334;
    switchValueOutline->x = baseXPos + 272 + UI_COLUMN(timeLimitMenu->switchValue, 60);

    TimeLimitMenuRenderUI();

    if (++timeLimitMenu->animFrame > 15) {
        timeLimitMenu->animFrame = 0;
        gCurTask->main = Task_TimeLimitMenuMain;
    }
}

static void Task_TimeLimitMenuMain(void)
{
    // Same as sub_806548C
    struct SwitchMenu *timeLimitMenu = TASK_DATA(gCurTask);
    Sprite *timeLimitOption = timeLimitMenu->options;
    Sprite *switchValueOutline = &timeLimitMenu->switchValueOutline;
    struct OptionsScreen *optionsScreen = timeLimitMenu->optionsScreen;

    s16 baseXPos = optionsScreen->subMenuXPos;
    s16 language = timeLimitMenu->language;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        timeLimitMenu->switchValue = timeLimitMenu->switchValue == 0;

        for (i = 0; i < 2; i++, timeLimitOption++) {
            timeLimitOption->palId = (timeLimitMenu->switchValue ^ i) ? 1 : 0;
        }

        switchValueOutline->x = baseXPos + 272 + UI_COLUMN(timeLimitMenu->switchValue, 60);
    }

    TimeLimitMenuRenderUI();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *itemText3 = &sTimeLimitMenuSwitchText[language][timeLimitMenu->switchValue];
        // Except this is different
        timeLimitOption = &optionsScreen->metaItems[OPTIONS_META_ITEM_TIME_LIMIT];

        timeLimitOption->variant = itemText3->unk2;
        timeLimitOption->graphics.anim = itemText3->unk0;
        UpdateSpriteAnimation(timeLimitOption);
        m4aSongNumStart(SE_SELECT);
        // and this
        optionsScreen->timeLimitDisabled = timeLimitMenu->switchValue;
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_TimeLimitMenuCloseAnim;
    } else if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_TimeLimitMenuCloseAnim;
    }
}

static void Task_TimeLimitMenuCloseAnim(void)
{
    struct SwitchMenu *timeLimitMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = timeLimitMenu->headerFooter;
    Sprite *timeLimitOption = timeLimitMenu->options;
    Sprite *switchValueOutline = &timeLimitMenu->switchValueOutline;

    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->x = baseXPos + 336;
    }

    timeLimitOption->x = baseXPos + 274;
    timeLimitOption++;
    timeLimitOption->x = baseXPos + 334;
    switchValueOutline->x = baseXPos + 272 + UI_COLUMN(timeLimitMenu->switchValue, 60);

    if (++timeLimitMenu->animFrame < 15) {
        TimeLimitMenuRenderUI();
        return;
    }

    TaskDestroy(gCurTask);
}

/** Button Config Menu **/

static void CreateButtonConfigMenu(struct OptionsScreen *optionsScreen)
{
    struct Task *t = TaskCreate(Task_ButtonConfigMenuOpenAnimWait, sizeof(struct ButtonConfigMenu), 0x2000, 4, NULL);
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(t);

    buttonConfigMenu->optionsScreen = optionsScreen;

    switch (optionsScreen->profileData.buttonConfig.jump) {
        case A_BUTTON:
            buttonConfigMenu->aButtonAction = BUTTON_CONFIG_MENU_ACTION_JUMP;
            break;
        case B_BUTTON:
            buttonConfigMenu->bButtonAction = BUTTON_CONFIG_MENU_ACTION_JUMP;
            break;
        case R_BUTTON:
            buttonConfigMenu->rShoulderAction = BUTTON_CONFIG_MENU_ACTION_JUMP;
            break;
    }

    switch (optionsScreen->profileData.buttonConfig.attack) {
        case A_BUTTON:
            buttonConfigMenu->aButtonAction = BUTTON_CONFIG_MENU_ACTION_ATTACK;
            break;
        case B_BUTTON:
            buttonConfigMenu->bButtonAction = BUTTON_CONFIG_MENU_ACTION_ATTACK;
            break;
        case R_BUTTON:
            buttonConfigMenu->rShoulderAction = BUTTON_CONFIG_MENU_ACTION_ATTACK;
            break;
    }

    switch (optionsScreen->profileData.buttonConfig.trick) {
        case A_BUTTON:
            buttonConfigMenu->aButtonAction = BUTTON_CONFIG_MENU_ACTION_TRICK;
            break;
        case B_BUTTON:
            buttonConfigMenu->bButtonAction = BUTTON_CONFIG_MENU_ACTION_TRICK;
            break;
        case R_BUTTON:
            buttonConfigMenu->rShoulderAction = BUTTON_CONFIG_MENU_ACTION_TRICK;
            break;
    }

    buttonConfigMenu->focus = 0;
    buttonConfigMenu->animFrame = 0;
    buttonConfigMenu->language = optionsScreen->language;
    ButtonConfigMenuCreateUI(buttonConfigMenu);
}

static void ButtonConfigMenuCreateUI(struct ButtonConfigMenu *buttonConfigMenu)
{
    Sprite *uiElement = buttonConfigMenu->staticElements;
    Sprite *buttonAction = buttonConfigMenu->buttonActions;
    Sprite *scrollArrow = buttonConfigMenu->scrollArrows;
    Sprite *controlFocus = &buttonConfigMenu->controlFocus;

    const struct UNK_080D95E8 *titleControlsText = sButtonConfigTitleAndControlsText[buttonConfigMenu->language];
    const struct UNK_080D95E8 *buttonIcon = sButtonConfigButtonIcons;
    const struct UNK_080D95E8 *actionsText = sButtonConfigActionsText[buttonConfigMenu->language];

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;

    s16 i;

    // title
    sub_806A568(uiElement, RENDER_TARGET_SUB_MENU, titleControlsText->unk4, titleControlsText->unk0, 0x1000, baseXPos + 336, 0x1C, 8,
                titleControlsText->unk2, 0);

    // controls line 1
    uiElement++;
    titleControlsText++;
    sub_806A568(uiElement, RENDER_TARGET_SUB_MENU, titleControlsText->unk4, titleControlsText->unk0, 0x1000, baseXPos + 336, 0x7A, 8,
                titleControlsText->unk2, 0);
    // controls line 2
    uiElement++;
    titleControlsText++;
    sub_806A568(uiElement, RENDER_TARGET_SUB_MENU, titleControlsText->unk4, titleControlsText->unk0, 0x1000, baseXPos + 336, 0x87, 8,
                titleControlsText->unk2, 0);

    // A button
    uiElement++;
    sub_806A568(uiElement, RENDER_TARGET_SUB_MENU, buttonIcon->unk4, buttonIcon->unk0, 0x1000, baseXPos + 264, 0x35, 8, buttonIcon->unk2,
                0);
    // B Button
    uiElement++;
    buttonIcon++;
    sub_806A568(uiElement, RENDER_TARGET_SUB_MENU, buttonIcon->unk4, buttonIcon->unk0, 0x1000, baseXPos + 264, 0x4D, 8, buttonIcon->unk2,
                0);
    // R Shoulder button
    uiElement++;
    buttonIcon++;
    sub_806A568(uiElement, RENDER_TARGET_SUB_MENU, buttonIcon->unk4, buttonIcon->unk0, 0x1000, baseXPos + 264, 0x65, 8, buttonIcon->unk2,
                0);

    // Selected A Button
    sub_806A568(buttonAction, RENDER_TARGET_SUB_MENU, actionsText[buttonConfigMenu->aButtonAction].unk4,
                actionsText[buttonConfigMenu->aButtonAction].unk0, 0x1000, baseXPos + 0x14C, 0x2D, 8,
                actionsText[buttonConfigMenu->aButtonAction].unk2, 0);

    // Selected B Button
    buttonAction++;
    sub_806A568(buttonAction, RENDER_TARGET_SUB_MENU, actionsText[buttonConfigMenu->bButtonAction].unk4,
                actionsText[buttonConfigMenu->bButtonAction].unk0, 0x1000, baseXPos + 0x14C, 0x45, 8,
                actionsText[buttonConfigMenu->bButtonAction].unk2, 0);

    // Selected R Shoulder button
    buttonAction++;
    sub_806A568(buttonAction, RENDER_TARGET_SUB_MENU, actionsText[buttonConfigMenu->rShoulderAction].unk4,
                actionsText[buttonConfigMenu->rShoulderAction].unk0, 0x1000, baseXPos + 0x14C, 0x5D, 8,
                actionsText[buttonConfigMenu->rShoulderAction].unk2, 0);

    sub_806A568(controlFocus, RENDER_TARGET_SUB_MENU, 0x42, 0x3B6, 0x1000, baseXPos + 0xFC, 0x2A, 6, 7, 0);

    sub_806A568(scrollArrow, RENDER_TARGET_SUB_MENU, 2, 0x3B6, 0x1000, baseXPos + 0x143, 0x35, 6, 8, 0);
    scrollArrow++;
    sub_806A568(scrollArrow, RENDER_TARGET_SUB_MENU, 2, 0x3B6, 0x1000, baseXPos + 0x19D, 0x35, 6, 9, 0);
}

static void Task_ButtonConfigMenuOpenAnimWait(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    Sprite *uiElement = buttonConfigMenu->staticElements;
    Sprite *buttonAction = buttonConfigMenu->buttonActions;
    Sprite *scrollArrow = buttonConfigMenu->scrollArrows;
    Sprite *controlFocus = &buttonConfigMenu->controlFocus;

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 3; i++, uiElement++) {
        uiElement->x = baseXPos + 336;
    }

    for (; i < 6; i++, uiElement++) {
        uiElement->x = baseXPos + 264;
    }

    for (i = 0; i < 3; i++, buttonAction++) {
        buttonAction->x = baseXPos + 332;
    }

    controlFocus->x = baseXPos + 252;
    scrollArrow->x = baseXPos + 323;
    scrollArrow++;
    scrollArrow->x = baseXPos + 413;

    ButtonConfigMenuRenderUI();

    if (++buttonConfigMenu->animFrame >= 16) {
        buttonConfigMenu->animFrame = 0;
        gCurTask->main = Task_ButtonConfigMenuAButtonMain;
    }
}

static void Task_ButtonConfigMenuAButtonMain(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    Sprite *buttonAction = buttonConfigMenu->buttonActions;
    const struct UNK_080D95E8 *actionsText = sButtonConfigActionsText[buttonConfigMenu->language];
    const struct UNK_080D95E8 *actionText;

    ButtonConfigMenuRenderUI();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & (DPAD_LEFT)) {
            if (buttonConfigMenu->aButtonAction > 0) {
                buttonConfigMenu->aButtonAction--;
            } else {
                buttonConfigMenu->aButtonAction = 2;
            }
        } else {
            if (buttonConfigMenu->aButtonAction < 2) {
                buttonConfigMenu->aButtonAction++;
            } else {
                buttonConfigMenu->aButtonAction = 0;
            }
        }

        actionText = &actionsText[buttonConfigMenu->aButtonAction];
        buttonAction->graphics.anim = actionText->unk0;
        buttonAction->variant = actionText->unk2;
        UpdateSpriteAnimation(&buttonAction[0]);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction
                   || buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->bButtonAction < 2) {
                    buttonConfigMenu->bButtonAction++;
                } else {
                    buttonConfigMenu->bButtonAction = 0;
                }
            }
            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_B_BUTTON];
            buttonAction->graphics.anim = actionsText[buttonConfigMenu->bButtonAction].unk0;
            buttonAction->variant = actionsText[buttonConfigMenu->bButtonAction].unk2;

            UpdateSpriteAnimation(buttonAction);
        }

        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction
                   || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->rShoulderAction < 2) {
                    buttonConfigMenu->rShoulderAction++;
                } else {
                    buttonConfigMenu->rShoulderAction = 0;
                }
            }

            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON];
            buttonAction->graphics.anim = actionsText[buttonConfigMenu->rShoulderAction].unk0;
            buttonAction->variant = actionsText[buttonConfigMenu->rShoulderAction].unk2;
            UpdateSpriteAnimation(buttonAction);
        }

        buttonConfigMenu->focus = BUTTON_CONFIG_MENU_B_BUTTON;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_ButtonConfigMenuHandleAButtonComplete;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        buttonConfigMenu->animFrame = 0;
        buttonConfigMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_ButtonMenuConfigCloseAnim;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        ButtonConfigMenuStartOver();
    }
}

static void Task_ButtonConfigMenuBButtonMain(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    Sprite *buttonAction;
    const struct UNK_080D95E8 *actionsText = sButtonConfigActionsText[buttonConfigMenu->language];
    const struct UNK_080D95E8 *itemText4;
    u8 unk245;

    ButtonConfigMenuRenderUI();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & DPAD_LEFT) {
            do {
                if (buttonConfigMenu->bButtonAction > 0) {
                    buttonConfigMenu->bButtonAction--;
                } else {
                    buttonConfigMenu->bButtonAction = 2;
                }
            } while (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction);
        } else if (gRepeatedKeys & DPAD_RIGHT) {
            do {
                if (buttonConfigMenu->bButtonAction < 2) {
                    buttonConfigMenu->bButtonAction++;
                } else {
                    buttonConfigMenu->bButtonAction = 0;
                }
            } while (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction);
        }

        // Who knows why this has to be assigned first
        unk245 = buttonConfigMenu->bButtonAction;

        buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_B_BUTTON];
        itemText4 = &actionsText[unk245];
        buttonAction->graphics.anim = itemText4->unk0;
        buttonAction->variant = itemText4->unk2;
        UpdateSpriteAnimation(buttonAction);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction
            || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction
                   || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->rShoulderAction < 2) {
                    buttonConfigMenu->rShoulderAction++;
                } else {
                    buttonConfigMenu->rShoulderAction = 0;
                }
            }
            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON];
            buttonAction->graphics.anim = actionsText[buttonConfigMenu->rShoulderAction].unk0;
            buttonAction->variant = actionsText[buttonConfigMenu->rShoulderAction].unk2;

            UpdateSpriteAnimation(buttonAction);
        }

        buttonConfigMenu->focus = BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_ButtonConfigMenuHandleBButtonComplete;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction
            || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction
                   || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->bButtonAction < 2) {
                    buttonConfigMenu->bButtonAction++;
                } else {
                    buttonConfigMenu->bButtonAction = 0;
                }
            }
            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_B_BUTTON];
            buttonAction->graphics.anim = actionsText[buttonConfigMenu->bButtonAction].unk0;
            buttonAction->variant = actionsText[buttonConfigMenu->bButtonAction].unk2;

            UpdateSpriteAnimation(buttonAction);
        }
        m4aSongNumStart(SE_RETURN);
        buttonConfigMenu->focus = BUTTON_CONFIG_MENU_A_BUTTON;
        gCurTask->main = Task_ButtonConfigMenuHandleStartOver;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        ButtonConfigMenuStartOver();
    }
}

static inline void CommitButtonConfig(struct ButtonConfigMenu *buttonConfigMenu, struct OptionsScreen *optionsScreen)
{
    switch (buttonConfigMenu->aButtonAction) {
        case BUTTON_CONFIG_MENU_ACTION_JUMP:
            optionsScreen->profileData.buttonConfig.jump = A_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_ATTACK:
            optionsScreen->profileData.buttonConfig.attack = A_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_TRICK:
            optionsScreen->profileData.buttonConfig.trick = A_BUTTON;
            break;
    }

    switch (buttonConfigMenu->bButtonAction) {
        case BUTTON_CONFIG_MENU_ACTION_JUMP:
            optionsScreen->profileData.buttonConfig.jump = B_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_ATTACK:
            optionsScreen->profileData.buttonConfig.attack = B_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_TRICK:
            optionsScreen->profileData.buttonConfig.trick = B_BUTTON;
            break;
    }

    switch (buttonConfigMenu->rShoulderAction) {
        case BUTTON_CONFIG_MENU_ACTION_JUMP:
            optionsScreen->profileData.buttonConfig.jump = R_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_ATTACK:
            optionsScreen->profileData.buttonConfig.attack = R_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_TRICK:
            optionsScreen->profileData.buttonConfig.trick = R_BUTTON;
            break;
    }
}

static void Task_ButtonConfigMenuRShoulderMain(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    struct OptionsScreen *optionsScreen = buttonConfigMenu->optionsScreen;

    ButtonConfigMenuRenderUI();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        CommitButtonConfig(buttonConfigMenu, optionsScreen);

        buttonConfigMenu->animFrame = 0;
        buttonConfigMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_ButtonMenuConfigCloseAnim;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        buttonConfigMenu->focus = BUTTON_CONFIG_MENU_A_BUTTON;
        gCurTask->main = Task_ButtonConfigMenuHandleAButtonComplete;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        ButtonConfigMenuStartOver();
    }
}

static void ButtonConfigMenuStartOver(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    struct OptionsScreen *optionsScreen = buttonConfigMenu->optionsScreen;
    Sprite *buttonAction = buttonConfigMenu->buttonActions;
    const struct UNK_080D95E8 *actionsText = sButtonConfigActionsText[buttonConfigMenu->language];
    s16 i;

    buttonConfigMenu->aButtonAction = BUTTON_CONFIG_MENU_ACTION_JUMP;
    buttonConfigMenu->bButtonAction = BUTTON_CONFIG_MENU_ACTION_ATTACK;
    buttonConfigMenu->rShoulderAction = BUTTON_CONFIG_MENU_ACTION_TRICK;

    CommitButtonConfig(buttonConfigMenu, optionsScreen);

    for (i = 0; i < 3; i++, buttonAction++) {
        buttonAction->graphics.anim = actionsText[i].unk0;
        buttonAction->variant = actionsText[i].unk2;
        UpdateSpriteAnimation(buttonAction);
    }

    gCurTask->main = Task_ButtonConfigMenuHandleStartOver;
}

static void Task_ButtonMenuConfigCloseAnim(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    Sprite *unk4 = buttonConfigMenu->staticElements;
    Sprite *unk124 = buttonConfigMenu->buttonActions;
    Sprite *unk1B4 = buttonConfigMenu->scrollArrows;
    Sprite *unk214 = &buttonConfigMenu->controlFocus;

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 3; i++, unk4++) {
        unk4->x = baseXPos + 0x150;
    }

    for (; i < 6; i++, unk4++) {
        unk4->x = baseXPos + 0x108;
    }

    for (i = 0; i < 3; i++, unk124++) {
        unk124->x = baseXPos + 0x14C;
    }

    unk214->x = baseXPos + 0xFC;
    unk1B4->x = baseXPos + 0x143;
    unk1B4++;
    unk1B4->x = baseXPos + 0x19D;

    if (++buttonConfigMenu->animFrame < 15) {
        ButtonConfigMenuRenderUI();
        return;
    }

    TaskDestroy(gCurTask);
}

static void ButtonConfigMenuRenderUI(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);
    Sprite *unk4 = buttonConfigMenu->staticElements;
    Sprite *unk124 = buttonConfigMenu->buttonActions;
    Sprite *unk1B4 = buttonConfigMenu->scrollArrows;
    Sprite *unk214 = &buttonConfigMenu->controlFocus;
    s16 i;

    for (i = 0; i < 6; i++, unk4++) {
        DisplaySprite(unk4);
    }

    for (i = 0; i < 3; i++, unk124++) {
        DisplaySprite(unk124);
    }

    for (i = 0; i < 2; i++, unk1B4++) {
        UpdateSpriteAnimation(unk1B4);
        DisplaySprite(unk1B4);
    }

    DisplaySprite(unk214);
}

static void LanguageScreenInitRegisters(struct LanguageScreen *languageScreen)
{
    ScreenFade *fade = &languageScreen->unk1F0;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    UpdateScreenFade(&languageScreen->unk1F0);
}

static void LanguageScreenCreateUI(struct LanguageScreen *languageScreen)
{
    s16 selectedLanguage = languageScreen->menuCursor;
    Sprite *headerFooter = languageScreen->headerFooter;
    Sprite *languageOption = languageScreen->languageOptions;
    Sprite *optionOutline = &languageScreen->optionOutline;

    const struct UNK_080D95E8 *languageScreenTitles = sLanguageScreenTitles;
    const struct UNK_080D95E8 *optionText = sLanguageScreenOptionsText;
    const struct UNK_080D95E8 *controlsText;

    s16 titleSize, controlsTextSize, i, yPos;

    if (languageScreen->creatingNewProfile == FALSE) {
        controlsText = sLanguageScreenEditControlsText;
    } else {
        controlsText = sLanguageScreenNewControlsText;
    }

    titleSize = MaxSpriteSize(languageScreenTitles, NUM_LANGUAGES);
    controlsTextSize = MaxSpriteSize(controlsText, NUM_LANGUAGES);

    languageScreenTitles = &languageScreenTitles[selectedLanguage];
    controlsText = &controlsText[selectedLanguage];

    sub_806A568(headerFooter, RENDER_TARGET_SCREEN, titleSize, languageScreenTitles->unk0, 0x3000, 0x78, 0x1A, 0xD,
                languageScreenTitles->unk2, 0);
    headerFooter++;
    sub_806A568(headerFooter, RENDER_TARGET_SCREEN, controlsTextSize, controlsText->unk0, 0x3000, 0x78, 0x8A, 0xD, controlsText->unk2, 0);

    for (i = 0, yPos = 40; i < NUM_LANGUAGES; i++, languageOption++, optionText++, yPos += 15) {
        sub_806A568(languageOption, RENDER_TARGET_SCREEN, optionText->unk4, optionText->unk0, 0x3000, 0x28, yPos, 0xD, optionText->unk2, 0);
        languageOption->palId = (selectedLanguage ^ i) ? 1 : 0;
    }

    sub_806A568(optionOutline, RENDER_TARGET_SCREEN, 0x3F, 0x3BD, 0x3000, 0x26, (selectedLanguage * 15) + 40, 0xC, 5, 0);

    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3C4, 0, 0, 0, 0, 0, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3C4, 0, 0, 0, 0, 1, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3C3, 0, 0, 0, 0, 0xC, 0);
}

static void Task_LanguageScreenMain(void)
{
    struct LanguageScreen *languageScreen = TASK_DATA(gCurTask);
    ReseedRng();

    if (gRepeatedKeys & (DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (languageScreen->menuCursor >= NUM_LANGUAGES - 1) {
            languageScreen->menuCursor = 0;
        } else {
            languageScreen->menuCursor++;
        }
        LanguageScreenHandleLanguageChanged();
    } else if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (languageScreen->menuCursor < 1) {
            languageScreen->menuCursor = NUM_LANGUAGES - 1;
        } else {
            languageScreen->menuCursor--;
        }
        LanguageScreenHandleLanguageChanged();
    }

    LanguageScreenRenderUI();

    if ((gRepeatedKeys & (DPAD_DOWN | DPAD_UP))) {
        return;
    }

    if (languageScreen->creatingNewProfile) {
        if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
            m4aSongNumStart(SE_SELECT);
            gLoadedSaveGame->language = languageScreen->menuCursor + 1;
            LanguageScreenHandleExit();
        }
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        languageScreen->optionsScreen->language = languageScreen->menuCursor;
        LanguageScreenHandleExit();
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        LanguageScreenHandleExit();
    }
}

static void LanguageScreenHandleLanguageChanged(void)
{
    struct LanguageScreen *languageScreen = TASK_DATA(gCurTask);
    Sprite *headerFooter = languageScreen->headerFooter;
    Sprite *menuItems = languageScreen->languageOptions;
    Sprite *menuItemOutline = &languageScreen->optionOutline;

    const struct UNK_080D95E8 *titleText = &sLanguageScreenTitles[languageScreen->menuCursor];
    const struct UNK_080D95E8 *controlsText;
    s16 i;

    if (languageScreen->creatingNewProfile != TRUE) {
        controlsText = &sLanguageScreenEditControlsText[languageScreen->menuCursor];
    } else {
        controlsText = &sLanguageScreenNewControlsText[languageScreen->menuCursor];
    }

    menuItemOutline->y = languageScreen->menuCursor * 15 + 40;

    for (i = 0; i < NUM_LANGUAGES; i++, menuItems++) {
        menuItems->palId = (languageScreen->menuCursor ^ i) ? 1 : 0;
    }

    headerFooter->variant = titleText->unk2;
    headerFooter->graphics.anim = titleText->unk0;
    UpdateSpriteAnimation(headerFooter);

    headerFooter++;
    headerFooter->variant = controlsText->unk2;
    headerFooter->graphics.anim = controlsText->unk0;
    UpdateSpriteAnimation(headerFooter);
}

static void CreateDeleteScreen(struct OptionsScreen *optionsScreen)
{
    struct Task *t = TaskCreate(Task_DeleteScreenFadeIn, sizeof(struct DeleteScreen), 0x2000, TASK_x0004, NULL);
    struct DeleteScreen *deleteScreen = TASK_DATA(t);

    deleteScreen->optionsScreen = optionsScreen;
    deleteScreen->confirmationCursor = 1;
    deleteScreen->unusedUnk141 = FALSE;
    deleteScreen->language = optionsScreen->language;
    deleteScreen->deleteConfirmed = 0;

    ResetProfileScreensVram();

    DeleteScreenInitRegisters(deleteScreen);
    DeleteScreenCreateBackgroundsUI(deleteScreen);
    DeleteScreenCreateUI(deleteScreen);
}

static void DeleteScreenInitRegisters(struct DeleteScreen *deleteScreen)
{
    ScreenFade *fade = &deleteScreen->unk130;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    UpdateScreenFade(&deleteScreen->unk130);
}

static void DeleteScreenCreateUI(struct DeleteScreen *deleteScreen)
{
    s16 language = deleteScreen->language;
    Sprite *option = deleteScreen->options;
    Sprite *optionOutline = &deleteScreen->optionOutline;

    const struct UNK_080D95E8 *titleText = &sDeleteScreenConfirmTitleText[language];
    const struct UNK_080D95E8 *controlsText = &sDeleteScreenControlsText[language];
    const struct UNK_080D95E8 *optionText = sDeleteScreenOptionsText[language];

    s16 confirmationCursor = deleteScreen->confirmationCursor;

    sub_806A568(&deleteScreen->headerFooter[0], RENDER_TARGET_SCREEN, titleText->unk4, titleText->unk0, 0x3000, 0x78, 0x32, 0xD,
                titleText->unk2, 0);
    sub_806A568(&deleteScreen->headerFooter[1], RENDER_TARGET_SCREEN, controlsText->unk4, controlsText->unk0, 0x3000, 0x78, 0x74, 0xD,
                controlsText->unk2, 0);
    sub_806A568(option, RENDER_TARGET_SCREEN, optionText->unk4, optionText->unk0, 0x3000, 0x3A, 0x4C, 0xD, optionText->unk2, 0);

    option->palId = 1;
    option++;
    optionText++;
    sub_806A568(option, RENDER_TARGET_SCREEN, optionText->unk4, optionText->unk0, 0x3000, 0x76, 0x4C, 0xD, optionText->unk2, 0);

    sub_806A568(optionOutline, RENDER_TARGET_SCREEN, 0x12, 0x3B8, 0x3000, (confirmationCursor * 60) + 56, 0x4C, 0xC, 3, 0);

    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3C4, 0, 0, 0, 0, 0, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3C4, 0, 0, 0, 0, 1, 0);
    sub_806A568(NULL, RENDER_TARGET_SCREEN, 0, 0x3C3, 0, 0, 0, 0, 0xC, 0);
}

static void Task_DeleteScreenConfrimationMain(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);
    Sprite *option = deleteScreen->options;
    Sprite *optionOutline = &deleteScreen->optionOutline;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteScreen->confirmationCursor = !deleteScreen->confirmationCursor;

        for (i = 0; i < 2; i++, option++) {
            option->palId = (deleteScreen->confirmationCursor ^ i) ? 1 : 0;
        }
        optionOutline->x = deleteScreen->confirmationCursor * 60 + 56;
    }

    DeleteScreenRenderUI();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        if (deleteScreen->confirmationCursor == DELETE_SCREEN_CONFIRMATION_YES) {
            gCurTask->main = Task_DeleteScreenCreateAbsoluteConfirmation;
        } else {
            gCurTask->main = Task_DeleteScreenHandleExit;
        }
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_DeleteScreenHandleExit;
    }
}

static void Task_DeleteScreenCreateAbsoluteConfirmation(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);

    Sprite *headerFooter = deleteScreen->headerFooter;
    Sprite *option = deleteScreen->options;
    Sprite *optionOutline = &deleteScreen->optionOutline;
    const struct UNK_080D95E8 *titleText = &sDeleteScreenAbsoluteConfirmTitleText[deleteScreen->language];
    s16 i;

    headerFooter->variant = titleText->unk2;
    headerFooter->graphics.anim = titleText->unk0;

    UpdateSpriteAnimation(headerFooter);

    deleteScreen->confirmationCursor = DELETE_SCREEN_CONFIRMATION_NO;

    for (i = 0; i < 2; i++, option++) {
        option->palId = (deleteScreen->confirmationCursor ^ i) ? 1 : 0;
    }

    optionOutline->x = deleteScreen->confirmationCursor * 60 + 56;

    DeleteScreenRenderUI();
    gCurTask->main = Task_DeleteScreenAbsoluteConfirmMain;
}

static void Task_DeleteScreenAbsoluteConfirmMain(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);
    Sprite *option = deleteScreen->options;
    Sprite *optionOutline = &deleteScreen->optionOutline;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteScreen->confirmationCursor = deleteScreen->confirmationCursor == 0;

        for (i = 0; i < 2; i++, option++) {
            option->palId = (deleteScreen->confirmationCursor ^ i) ? 1 : 0;
        }
        optionOutline->x = deleteScreen->confirmationCursor * 60 + 56;
    }

    DeleteScreenRenderUI();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (deleteScreen->confirmationCursor == DELETE_SCREEN_CONFIRMATION_YES) {
            deleteScreen->deleteConfirmed = 1;
            m4aSongNumStart(SE_DELETE_GAME_DATA);
        } else {
            m4aSongNumStart(SE_SELECT);
        }
        gCurTask->main = Task_DeleteScreenHandleExit;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_DeleteScreenHandleExit;
    }
}

static void Task_DeleteScreenFadeOutAndExit(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);

    if (!UpdateScreenFade(&deleteScreen->unk130)) {
        DeleteScreenRenderUI();
        return;
    }

    if (deleteScreen->deleteConfirmed) {
        StoreProfileData(deleteScreen->optionsScreen);
        NewSaveGame();
        deleteScreen->optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
    } else {
        deleteScreen->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;
    }

    TaskDestroy(gCurTask);
}

static void CreateEditProfileNameScreen(struct PlayerDataMenu *playerDataMenu)
{
    struct Task *t = TaskCreate(Task_ProfileNameScreenFadeIn, sizeof(struct ProfileNameScreen), 0x2000, 4, NULL);
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(t);
    s16 i;

    profileNameScreen->playerDataMenu = playerDataMenu;
    profileNameScreen->language = playerDataMenu->language;
    profileNameScreen->onCompleteAction = 0;
    profileNameScreen->cursorCol = 0;

    if (profileNameScreen->language == LanguageIndex(LANG_JAPANESE)) {
        profileNameScreen->matrixCursorIndex = 0;
        profileNameScreen->cursorRow = 0;
        profileNameScreen->matrixPageIndex = 0;
    } else {
        profileNameScreen->matrixCursorIndex = 99;
        profileNameScreen->cursorRow = 0;
        profileNameScreen->matrixPageIndex = 99;
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        profileNameScreen->nameInput.buffer[i] = playerDataMenu->optionsScreen->profileData.playerName[i];
        if (profileNameScreen->nameInput.buffer[i] == PLAYER_NAME_END_CHAR) {
            break;
        }
    }

    profileNameScreen->nameInput.cursor = i;

    for (; i < MAX_PLAYER_NAME_LENGTH; i++) {
        profileNameScreen->nameInput.buffer[i] = PLAYER_NAME_END_CHAR;
    }

    ResetProfileScreensVram();

    ProfileNameScreenInitRegisters(profileNameScreen->language);
    ProfileNameScreenCreateUIBackgrounds(profileNameScreen);
    ProfileNameScreenCreateUIText(profileNameScreen);
    ProfileNameScreenCreateUIContextElements(profileNameScreen);
    ProfileNameScreenCreateInputDisplayUI(profileNameScreen);
}

static void ProfileNameScreenInitRegisters(s16 language)
{
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x701;
    gBgCntRegs[1] = 0x9606;
    gBgCntRegs[2] = 0x1F0F;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0xFFE8;

    if (language == LanguageIndex(LANG_JAPANESE)) {
        gBgScrollRegs[1][1] = 0xFFD9;
    } else {
        gBgScrollRegs[1][1] = 0x69;
    }

    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

static void ProfileNameScreenCreateUIBackgrounds(struct ProfileNameScreen *profileNameScreen)
{
    ScreenFade *fade = &profileNameScreen->fade;

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    OptionsInitBackground(&profileNameScreen->background, 0, 7, TM_OPTIONS_ENTER_NAME, 0x1E, 0x14, 0, 0, 0, 0);
    OptionsInitBackground(&profileNameScreen->charMatrixBackground, 3, 0x1F, TM_OPTIONS_TIME_RECORD_BG0, 0x1E, 0x14, 0, 2, 0, 0);
    OptionsInitBackground(&profileNameScreen->charMatrix, 1, 0x16, TM_OPTIONS_ENTER_NAME_CHARACTERS, 0x16, 0x2C, 0, 1, 0, 0);
}

static void ProfileNameScreenCreateUIText(struct ProfileNameScreen *profileNameScreen)
{
    Sprite *title = &profileNameScreen->title;
    Sprite *control = profileNameScreen->controls;

    u8 *language = &profileNameScreen->language;
    const struct UNK_080D95E8 *arrowTile = sProfileNameScreenArrowTiles;
    const struct UNK_080D95E8 *endButtonText = &sProfileNameScreenEndButtonText[*language];
    const struct UNK_080D95E8 *titleText;

    if (profileNameScreen->nameInput.cursor > 0) {
        titleText = &sProfileNameScreenEditTitleText[*language];
    } else {
        titleText = &sProfileNameScreenNewTitleText[*language];
    }

    sub_806A568(title, RENDER_TARGET_SCREEN, titleText->unk4, titleText->unk0, 0x1000, 3, 0x15, 0xD, titleText->unk2, 0);

    // Left arrow
    sub_806A568(control, RENDER_TARGET_SCREEN, arrowTile->unk4, arrowTile->unk0, 0x1000, 0xDB, 0x70, 0xD, arrowTile->unk2, 0);
    control++;
    arrowTile++;

    // Right arrow
    sub_806A568(control, RENDER_TARGET_SCREEN, arrowTile->unk4, arrowTile->unk0, 0x1000, 0xDB, 0x80, 0xD, arrowTile->unk2, 0);
    control++;

    // End button
    sub_806A568(control, RENDER_TARGET_SCREEN, endButtonText->unk4, endButtonText->unk0, 0x1000, 0xDB, 0x8F, 0xD, endButtonText->unk2, 0);
}

static void ProfileNameScreenCreateUIContextElements(struct ProfileNameScreen *profileNameScreen)
{
    Sprite *focusedCell = profileNameScreen->focusedCell;
    Sprite *scrollArrow = profileNameScreen->scrollArrows;
    const struct UNK_080D95E8 *scrollArrowTile = sProfileNameScreenScrollArrowTiles;
    struct UNK_806B908 nameCharTile;

    // background
    sub_806A568(focusedCell, RENDER_TARGET_SCREEN, 10, 0x3BA, 0x1000, 0x21, 0x2F, 8, 7, 0);
    focusedCell++;

    // foreground
    nameCharTile = sub_806B908(profileNameScreen->matrixCursorIndex);
    sub_806A568(focusedCell, RENDER_TARGET_SCREEN, nameCharTile.unk0, nameCharTile.unk4, 0x1000, 0x21, 0x2F, 7, nameCharTile.unk6, 0);

    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, scrollArrowTile->unk4, scrollArrowTile->unk0, 0x1000, 8, 0x2C, 0xD,
                scrollArrowTile->unk2, 0);
    scrollArrow++;
    scrollArrowTile++;
    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, scrollArrowTile->unk4, scrollArrowTile->unk0, 0x1000, 8, 0x82, 0xD,
                scrollArrowTile->unk2, 0);
}

static void ProfileNameScreenCreateInputDisplayUI(struct ProfileNameScreen *profileNameScreen)
{
    struct UNK_806B908 nameCharTile;
    Sprite *inputDisplayChar = profileNameScreen->nameInput.characterDisplay;
    Sprite *inputDisplayCursor = &profileNameScreen->nameInput.displayCursor;

    s16 i, xPos;
    u16 nameChar;

    // Required for match
    u32 yPos = 22;
    for (i = 0, xPos = 160; i < MAX_PLAYER_NAME_LENGTH; i++, inputDisplayChar++, xPos += 12) {
        nameChar = profileNameScreen->nameInput.buffer[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(inputDisplayChar, RENDER_TARGET_SCREEN, nameCharTile.unk0, nameCharTile.unk4, 0x1000, xPos, yPos, 8, nameCharTile.unk6,
                    0);
    }

    sub_806A568(inputDisplayCursor, RENDER_TARGET_SCREEN, 2, 0x3BA, 0x1000,
                profileNameScreen->nameInput.cursor * NAME_INPUT_DISPLAY_CHAR_WIDTH + 161, 21, 5, 6, 0);
}

static void Task_ProfileNameScreenMain(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);
    struct NameInputDisplay *nameInput = &profileNameScreen->nameInput;

    ProfileNameScreenRenderUI();

    ShuffleRngSeed();

    // Don't bother continuing if we take input
    // from any other functions
    if (ProfileNameScreenHandleShoulderInput()) {
        return;
    }

    if (ProfileNameScreenHandleDpadInput()) {
        return;
    }

    // Handle action button input
    if (gRepeatedKeys & A_BUTTON) {
        // If we are not in the controls column
        if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
            // If we are at the end of the first 2 rows of the matrix
            if (profileNameScreen->matrixCursorIndex == NAME_CHAR_MATRIX_NUM_COLS - 1
                || profileNameScreen->matrixCursorIndex == NAME_CHAR_MATRIX_NUM_COLS * 2 - 1) {
                s16 mode = 2;
                if (profileNameScreen->matrixCursorIndex == NAME_CHAR_MATRIX_NUM_COLS - 1) {
                    mode = 1;
                }

                if (nameInput->cursor < MAX_PLAYER_NAME_LENGTH) {
                    if (nameInput->buffer[nameInput->cursor] == PLAYER_NAME_END_CHAR) {
                        m4aSongNumStart(SE_SELECT);
                        if (sub_806BA14(mode, nameInput->buffer[nameInput->cursor - 1])) {
                            nameInput->buffer[nameInput->cursor - 1] = sub_806A664(mode, nameInput->buffer[nameInput->cursor - 1]);
                        } else {
                            nameInput->buffer[nameInput->cursor] = profileNameScreen->matrixCursorIndex;
                            if (nameInput->cursor < MAX_PLAYER_NAME_LENGTH - 1) {
                                nameInput->cursor++;
                            } else {
                                nameInput->cursor = MAX_PLAYER_NAME_LENGTH;
                                // Once we reach the end, set the cusor to the end button
                                profileNameScreen->cursorCol = PROFILE_NAME_SCREEN_CONTROLS_COLUMN;
                                profileNameScreen->cursorRow = PROFILE_NAME_SCREEN_END_BUTTON;
                            }
                        }
                    } else {
                        if (sub_806BA14(mode, nameInput->buffer[nameInput->cursor])) {
                            m4aSongNumStart(SE_SELECT);
                            nameInput->buffer[nameInput->cursor] = sub_806A664(mode, nameInput->buffer[nameInput->cursor]);
                        } else {
                            m4aSongNumStart(SE_SELECT);
                            nameInput->buffer[nameInput->cursor] = profileNameScreen->matrixCursorIndex;
                        }
                    }
                } else {
                    if (sub_806BA14(mode, nameInput->buffer[nameInput->cursor - 1])) {
                        m4aSongNumStart(SE_SELECT);
                        nameInput->buffer[nameInput->cursor - 1] = sub_806A664(mode, nameInput->buffer[nameInput->cursor - 1]);
                    }
                    nameInput->cursor = MAX_PLAYER_NAME_LENGTH;
                    profileNameScreen->cursorCol = PROFILE_NAME_SCREEN_CONTROLS_COLUMN;
                    profileNameScreen->cursorRow = PROFILE_NAME_SCREEN_END_BUTTON;
                }
            }

            if (nameInput->cursor < MAX_PLAYER_NAME_LENGTH) {
                if (profileNameScreen->matrixCursorIndex != NAME_CHAR_MATRIX_NUM_COLS - 1
                    && profileNameScreen->matrixCursorIndex != NAME_CHAR_MATRIX_NUM_COLS * 2 - 1) {
                    m4aSongNumStart(SE_SELECT);
                    nameInput->buffer[nameInput->cursor] = profileNameScreen->matrixCursorIndex;
                    if (nameInput->cursor < MAX_PLAYER_NAME_LENGTH - 1) {
                        nameInput->cursor++;
                    }
                }
            }
            return;
        }

        // Otherwise, handle the controls input
        switch (profileNameScreen->cursorRow) {
            case PROFILE_NAME_SCREEN_CURSOR_BACK_BUTTON:
                if (nameInput->cursor == 0) {
                    return;
                }
                nameInput->cursor--;
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                return;
            case PROFILE_NAME_SCREEN_CURSOR_FORWARD_BUTTON:
                if (nameInput->cursor > MAX_PLAYER_NAME_LENGTH - 2) {
                    return;
                }
                if (nameInput->buffer[nameInput->cursor] == PLAYER_NAME_END_CHAR) {
                    nameInput->buffer[nameInput->cursor] = 0x11;
                }
                nameInput->cursor++;
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                return;
            case PROFILE_NAME_SCREEN_END_BUTTON:
                if (!sub_806B988(nameInput->buffer)) {
                    m4aSongNumStart(SE_RETURN);
                    return;
                }
                m4aSongNumStart(SE_SELECT);
                ProfileNameScreenInputComplete();
                return;
        }
        return;
    }

    if (gPressedKeys & START_BUTTON) {
        if (profileNameScreen->cursorCol == PROFILE_NAME_SCREEN_CONTROLS_COLUMN
            && profileNameScreen->cursorRow == PROFILE_NAME_SCREEN_END_BUTTON) {
            if (!sub_806B988(nameInput->buffer)) {
                m4aSongNumStart(SE_RETURN);
                return;
            }
            m4aSongNumStart(SE_SELECT);
            ProfileNameScreenInputComplete();
            return;
        } else {
            // If start is pressed, go to the end button ready for the player
            // to confirm
            m4aSongNumStart(SE_SELECT);
            profileNameScreen->cursorCol = PROFILE_NAME_SCREEN_CONTROLS_COLUMN;
            profileNameScreen->cursorRow = PROFILE_NAME_SCREEN_END_BUTTON;
        }
        return;
    }

    // Delete the char at the input cursor
    if (gRepeatedKeys & B_BUTTON) {
        s16 i;
        m4aSongNumStart(SE_RETURN);
        if ((nameInput->cursor > 0 && nameInput->buffer[nameInput->cursor] == PLAYER_NAME_END_CHAR)
            || nameInput->cursor > MAX_PLAYER_NAME_LENGTH - 1) {
            nameInput->cursor--;
        }

        for (i = nameInput->cursor; i < MAX_PLAYER_NAME_LENGTH - 1; i++) {
            nameInput->buffer[i] = nameInput->buffer[i + 1];
        }
        nameInput->buffer[MAX_PLAYER_NAME_LENGTH - 1] = 0xFFFF;
    }
}

static bool16 ProfileNameScreenHandleShoulderInput(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);

    if (gRepeatedKeys & L_BUTTON) {
        if (profileNameScreen->nameInput.cursor > 0) {
            profileNameScreen->nameInput.cursor--;
            if (profileNameScreen->nameInput.cursor < MAX_PLAYER_NAME_LENGTH - 1) {
                if (profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor + 1] == PLAYER_NAME_END_CHAR
                    && !sub_806B9C8(profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor])) {
                    profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor] = PLAYER_NAME_END_CHAR;
                }
            }
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        }
        return TRUE;
    }

    if (gRepeatedKeys & R_BUTTON) {
        if (profileNameScreen->nameInput.cursor < MAX_PLAYER_NAME_LENGTH - 1) {
            if (profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor] == PLAYER_NAME_END_CHAR) {
                profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor] = 0x11;
            }
            profileNameScreen->nameInput.cursor++;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        }
        return TRUE;
    }

    return FALSE;
}

static bool16 ProfileNameScreenHandleDpadInput(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);

    if (!(gRepeatedKeys & (DPAD_ANY))) {
        return FALSE;
    }

    m4aSongNumStart(SE_MENU_CURSOR_MOVE);

    if (gRepeatedKeys & DPAD_UP) {
        if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
            if (profileNameScreen->cursorRow != 0) {
                profileNameScreen->cursorRow--;
                return TRUE;
            }

            if (profileNameScreen->matrixPageIndex > 0) {
                gBgScrollRegs[1][1] -= NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT;
                profileNameScreen->matrixPageIndex -= NAME_CHAR_MATRIX_NUM_COLS;
            } else {
                profileNameScreen->cursorRow = NAME_CHAR_MATRIX_ROWS_PER_PAGE - 1;
                gBgScrollRegs[1][1] = 201;
                profileNameScreen->matrixPageIndex = NAME_CHAR_MATRIX_LAST_PAGE_START_INDEX;
            }
        } else {
            // handle controls input column
            if (profileNameScreen->cursorRow > PROFILE_NAME_SCREEN_CURSOR_BACK_BUTTON) {
                profileNameScreen->cursorRow--;
            } else {
                profileNameScreen->cursorRow = PROFILE_NAME_SCREEN_END_BUTTON;
            }
        }
        return TRUE;
    }

    if (gRepeatedKeys & DPAD_DOWN) {
        if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
            if (profileNameScreen->cursorRow < MAX_PLAYER_NAME_LENGTH) {
                profileNameScreen->cursorRow++;
            } else {
                if (profileNameScreen->matrixPageIndex < NAME_CHAR_MATRIX_LAST_PAGE_START_INDEX) {
                    gBgScrollRegs[1][1] += NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT;
                    profileNameScreen->matrixPageIndex += NAME_CHAR_MATRIX_NUM_COLS;
                } else {
                    gBgScrollRegs[1][1] = -39;
                    profileNameScreen->cursorRow = 0;
                    profileNameScreen->matrixPageIndex = 0;
                }
            }
        } else {
            if (profileNameScreen->cursorRow < PROFILE_NAME_SCREEN_END_BUTTON) {
                profileNameScreen->cursorRow++;
            } else {
                profileNameScreen->cursorRow = PROFILE_NAME_SCREEN_CURSOR_BACK_BUTTON;
            }
        }
        return TRUE;
    }

    if (gRepeatedKeys & DPAD_LEFT) {
        if (profileNameScreen->cursorCol != 0) {
            profileNameScreen->cursorCol--;
        } else {
            // If the cursor row doesn't intersect the controls row, then we loop
            // back around to the end of the matrix
            if (profileNameScreen->cursorRow < 4) {
                profileNameScreen->cursorCol = NAME_CHAR_MATRIX_NUM_COLS - 1;
            } else {
                profileNameScreen->cursorCol = PROFILE_NAME_SCREEN_CONTROLS_COLUMN;
            }
        }
        return TRUE;
    }

    if (gRepeatedKeys & DPAD_RIGHT) {
        // Allow the cursor to move to the controls column if we intersect
        // where the controls column starts
        if (profileNameScreen->cursorRow < 4) {
            if (profileNameScreen->cursorCol < NAME_CHAR_MATRIX_NUM_COLS - 1) {
                profileNameScreen->cursorCol++;
            } else {
                profileNameScreen->cursorCol = 0;
            }
        } else {
            if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
                profileNameScreen->cursorCol++;
            } else {
                profileNameScreen->cursorCol = 0;
            }
        }
        return TRUE;
    }

    // Shouldn't be possible to reach this
    return FALSE;
}

static void ProfileNameScreenInputComplete(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &profileNameScreen->fade;
    struct NameInputDisplay *nameInput = &profileNameScreen->nameInput;
    s16 i;

    // Copy name from input into profile data on the options screen
    if (profileNameScreen->onCompleteAction == 0) {
        struct OptionsScreenProfileData *profileData = &profileNameScreen->playerDataMenu->optionsScreen->profileData;
        for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
            profileData->playerName[i] = nameInput->buffer[i];
        }
    }

    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = ProfileNameScreenFadeOutAndExit;
}

static void ProfileNameScreenFadeOutAndExit(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &profileNameScreen->fade;
    struct NameInputDisplay *nameInput = &profileNameScreen->nameInput;
    s16 onCompleteAction = profileNameScreen->onCompleteAction;
    s16 i;

    if (!UpdateScreenFade(fade)) {
        ProfileNameScreenRenderUI();
        return;
    }

    if (onCompleteAction == NAME_SCREEN_COMPLETE_ACTION_BACK_TO_OPTIONS) {
        profileNameScreen->playerDataMenu->state = OPTIONS_SCREEN_STATE_ACTIVE;
        TaskDestroy(gCurTask);
        return;
    }

    if (onCompleteAction == NAME_SCREEN_COMPLETE_ACTION_START_GAME) {
        NewSaveGame();
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        gLoadedSaveGame->playerName[i] = nameInput->buffer[i];
    }
    WriteSaveGame();
    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gUnknown_03005390 = 0;
    PAUSE_GRAPHICS_QUEUE();

    if (onCompleteAction == NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER) {
        CreateMultiplayerModeSelectScreen();
    } else {
#if TAS_TESTING
        CreateTitleScreenAndSkipIntro();
#else
        CreateTitleScreen();
#endif
    }
}

static void ProfileNameScreenRenderUI(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);

    Sprite *title = &profileNameScreen->title;
    Sprite *controls = profileNameScreen->controls;
    Sprite *focusedCell = profileNameScreen->focusedCell;
    Sprite *scrollArrow = profileNameScreen->scrollArrows;
    Sprite *inputDisplayChar = profileNameScreen->nameInput.characterDisplay;
    Sprite *inputDisplayCursor = &profileNameScreen->nameInput.displayCursor;
    struct UNK_806B908 charMatrixCursorTile;
    struct UNK_806B908 nameCharTile;

    s16 i;
    u16 *nameChar;

    DisplaySprite(title);

    for (i = 0; i < 3; i++, controls++) {
        DisplaySprite(controls);
    }

    if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
        // background
        focusedCell->graphics.anim = 0x3BA;
        focusedCell->variant = 7;
        focusedCell->x = profileNameScreen->cursorCol * NAME_CHAR_MATRIX_BACKGROUND_COLUMN_WIDTH + 32;
        focusedCell->y = profileNameScreen->cursorRow * NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT + 47;
        UpdateSpriteAnimation(focusedCell);
        DisplaySprite(focusedCell);
        focusedCell++;

        // Interesting that this is calculated here, feels like the wrong place
        profileNameScreen->matrixCursorIndex
            = profileNameScreen->matrixPageIndex + profileNameScreen->cursorRow * NAME_CHAR_MATRIX_NUM_COLS + profileNameScreen->cursorCol;

        // foreground
        charMatrixCursorTile = sub_806B908(profileNameScreen->matrixCursorIndex);
        focusedCell->graphics.anim = charMatrixCursorTile.unk4;
        focusedCell->variant = charMatrixCursorTile.unk6;
        focusedCell->x = profileNameScreen->cursorCol * NAME_CHAR_MATRIX_BACKGROUND_COLUMN_WIDTH + 32;
        focusedCell->y = profileNameScreen->cursorRow * NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT + 47;
        UpdateSpriteAnimation(focusedCell);
        DisplaySprite(focusedCell);
    } else {
        // Make a focus outline if we are on the controls
        focusedCell->graphics.anim = 0x3BA;
        focusedCell->variant = 8;
        focusedCell->x = 0xCB;
        focusedCell->y = profileNameScreen->cursorRow * NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT + 39;
        UpdateSpriteAnimation(focusedCell);
        DisplaySprite(focusedCell);
    }

    // top
    UpdateSpriteAnimation(scrollArrow);
    scrollArrow++;
    // bottom
    UpdateSpriteAnimation(scrollArrow);

    if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
        // Show the top arrow if we are not on the first row
        scrollArrow = profileNameScreen->scrollArrows;
        if (profileNameScreen->matrixCursorIndex > NAME_CHAR_MATRIX_NUM_COLS - 1) {
            DisplaySprite(scrollArrow);
        }
        scrollArrow++;

        // Show the bottom arrow if we are not on the last row
        if (profileNameScreen->matrixCursorIndex < NAME_CHAR_MATRIX_NUM_COLS * (NAME_CHAR_MATRIX_NUM_ROWS - 1)) {
            DisplaySprite(scrollArrow);
        }
    }

    if (profileNameScreen->nameInput.cursor < MAX_PLAYER_NAME_LENGTH) {
        inputDisplayCursor->x = profileNameScreen->nameInput.cursor * NAME_INPUT_DISPLAY_CHAR_WIDTH + 161;
        DisplaySprite(inputDisplayCursor);
    }

    // render the inputted name into the display
    for (i = 0, nameChar = profileNameScreen->nameInput.buffer; i < MAX_PLAYER_NAME_LENGTH && *nameChar != PLAYER_NAME_END_CHAR;
         i++, inputDisplayChar++, nameChar++) {
        nameCharTile = sub_806B908(*nameChar);
        inputDisplayChar->graphics.anim = nameCharTile.unk4;
        inputDisplayChar->variant = nameCharTile.unk6;
        UpdateSpriteAnimation(inputDisplayChar);
        DisplaySprite(inputDisplayChar);
    }
}

static void CreateTimeRecordsScreen(struct PlayerDataMenu *playerDataMenu)
{
    struct Task *t = TaskCreate(Task_TimeRecordsScreenChoiceViewFadeIn, sizeof(struct TimeRecordsScreen), 0x2000, 4, NULL);
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(t);
    s16 availableCharacters;

    ReadAvailableCharacters(availableCharacters, gLoadedSaveGame->unlockedCharacters);

    timeRecordsScreen->playerDataMenu = playerDataMenu;
    timeRecordsScreen->character = 0;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unusedUnk708 = FALSE;
    timeRecordsScreen->availableCharacters = availableCharacters;

    for (availableCharacters = 0; availableCharacters < NUM_CHARACTERS; availableCharacters++) {
        timeRecordsScreen->unlockedCourses[availableCharacters] = gLoadedSaveGame->unlockedLevels[availableCharacters];
    }

    timeRecordsScreen->language = playerDataMenu->language;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;

    ResetProfileScreensVram();

    TimeRecordScreenInitRegisters();
    TimeRecordsScreenCreateChoiceViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateChoiceViewUI(timeRecordsScreen);
}

static void TimeRecordScreenInitRegisters(void)
{
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[1] = 0xF06;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

static void TimeRecordsScreenCreateChoiceViewBackgroundsUI(struct TimeRecordsScreen *timeRecordsScreen)
{
    ScreenFade *fade = &timeRecordsScreen->fade;
    fade->window = SCREEN_FADE_USE_WINDOW_0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = Q(0);
    fade->speed = Q(1.0);
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    OptionsInitBackground(&timeRecordsScreen->coursesViewCharacterBackground, 0, 7, TM_OPTIONS_TIME_RECORD_BG0, 0x1e, 0x14, 0, 0, 0, 0);
    OptionsInitBackground(&timeRecordsScreen->coursesViewCharacter, 1, 0xF, TM_OPTIONS_TIME_RECORD_BG1, 0x1e, 0x14, 0, 1, 0, 0);
}

static void TimeRecordsScreenCreateChoiceViewUI(struct TimeRecordsScreen *timeRecordsScreen)
{
    Sprite *title = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    Sprite *scrollArrow = timeRecordsScreen->choiceViewScrollArrows;
    Sprite *choiceItem = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    const struct UNK_080D95E8 *titleText = &sTimeRecordsChoiceViewTitles[timeRecordsScreen->language];
    const struct UNK_080D95E8 *choiceText = sTimeRecordsScreenChoices[timeRecordsScreen->language];

    // TODO: This X is a fake match, the compiler wants to use 0
    // from a register but won't do it without this
#ifndef NON_MATCHING
    s32 x = 0x1000;
    ++x;
    --x;
#endif

    sub_806A568(title, RENDER_TARGET_SCREEN, titleText->unk4, titleText->unk0,
#ifndef NON_MATCHING
                x,
#else
                0x1000,
#endif
                4, 0x1A, 5, titleText->unk2, 0);

    sub_806A568(choiceItem, RENDER_TARGET_SCREEN, choiceText->unk4, choiceText->unk0,
#ifndef NON_MATCHING
                x,
#else
                0x1000,
#endif
                0x28, 0x54, 5, choiceText->unk2, 0);

    choiceItem++;
    choiceText++;
    sub_806A568(choiceItem, RENDER_TARGET_SCREEN, choiceText->unk4, choiceText->unk0,
#ifndef NON_MATCHING
                x,
#else
                0x1000,
#endif
                0x86, 0x54, 5, choiceText->unk2, 0);

    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, 2, 0x3B6,
#ifndef NON_MATCHING
                x,
#else
                0x1000,
#endif
                100, 0x4B, 6, 8, 0);
    scrollArrow++;
    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, 2, 0x3B6,
#ifndef NON_MATCHING
                x,
#else
                0x1000,
#endif
                0x8C, 0x4B, 6, 9, 0);
}

static void Task_TimeRecordsScreenModeChoiceMain(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    Sprite *unk4C = timeRecordsScreen->choiceViewItemsOrZoneTitle;

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        timeRecordsScreen->isBossMode = !timeRecordsScreen->isBossMode;

        if (!timeRecordsScreen->isBossMode) {
            unk4C->palId = 0;
            unk4C++;
            unk4C->palId = 0;
        } else {
            unk4C->palId = 1;
            unk4C++;
            unk4C->palId = 0xFF;
        }
    }

    TimeRecordsScreenRenderModeChoiceUI();

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        TimeRecordsScreenShowCoursesView();
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        TimeRecordsScreenHandleExit();
    }
}

static void CreateTimeRecordsScreenAtCoursesView(struct PlayerDataMenu *playerDataMenu)
{
    struct Task *t = TaskCreate(Task_TimeRecordsScreenCreateTimesUI, sizeof(struct TimeRecordsScreen), 0x2000, 4, NULL);
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(t);
    s16 i;

    ReadAvailableCharacters(i, gLoadedSaveGame->unlockedCharacters);

    timeRecordsScreen->playerDataMenu = playerDataMenu;
    timeRecordsScreen->timeRecords = NULL;
    timeRecordsScreen->character = 0;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unusedUnk708 = FALSE;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->unlockedCourses[i] = gLoadedSaveGame->unlockedLevels[i];
    }

    timeRecordsScreen->language = playerDataMenu->language;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_COURSES;

    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    TimeRecordsScreenCreateCoursesViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);
}

static void TimeRecordsScreenInitRegisters(void)
{
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[1] = 0x5606;
    gBgCntRegs[2] = 0x5E09;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0xff58;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0xff58;
    gBgScrollRegs[2][1] = 0x10;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xFF;
    gUnknown_03002280[1][3] = 64;

    DmaFill32(3, 0, (void *)BG_CHAR_ADDR(1), sizeof(Background));

    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 64;

    DmaFill32(3, 0, (void *)BG_CHAR_ADDR(2), sizeof(Background));
}

static void TimeRecordsScreenCreateCoursesViewBackgroundsUI(struct TimeRecordsScreen *timeRecordsScreen)
{
    ScreenFade *fade = &timeRecordsScreen->fade;
    u8 character;
    if (timeRecordsScreen->character != 0xFF) {
        character = timeRecordsScreen->character;
    } else {
        character = 0;
    }

    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    OptionsInitBackground(&timeRecordsScreen->coursesViewBackground, 0, 7, TM_TILEMAP_139, 0x1e, 0x14, 0, 0, 0, 0);
    OptionsInitBackground(&timeRecordsScreen->coursesViewCharacterBackground, 1, 0x16,
                          sTimeRecordsCharacterAssets[character][ASSET_CHARACTER_BACKGROUND], 9, 0x14, 0, 1, 0, 0);
    OptionsInitBackground(&timeRecordsScreen->coursesViewCharacter, 2, 0x1E, sTimeRecordsCharacterAssets[character][ASSET_CHARACTER], 9,
                          0x14, 0, 2, 0, 0);
}

static void TimeRecordsScreenCreateCoursesViewUI(struct TimeRecordsScreen *timeRecordsScreen)
{
    Sprite *unk284 = timeRecordsScreen->timeRecordDisplays;
    Sprite *zoneText = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    Sprite *actText = timeRecordsScreen->actTitle;
    Sprite *zoneSubTitle = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    Sprite *scrollArrow = timeRecordsScreen->choiceViewScrollArrows;

    u8 language = timeRecordsScreen->language;
    u8 zone = timeRecordsScreen->zone;
    u8 act = timeRecordsScreen->act;

    const struct UNK_080D95E8 *zoneSubText, *titleDigit, *r0;

    s16 spriteSize;

    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, 2, 0x41A, 0x1400, 0xE, 0x20, 2, 0, 0);
    scrollArrow++;
    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, 2, 0x41A, 0x1000, 0x9C, 0x20, 2, 0, 0);
    scrollArrow++;
    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, 2, 0x41A, 0x1000, 0xD0, 0x18, 3, 1, 0);
    scrollArrow++;
    sub_806A568(scrollArrow, RENDER_TARGET_SCREEN, 2, 0x41A, 0x1800, 0xD0, 0x8C, 3, 1, 0);

    sub_806A568(unk284, RENDER_TARGET_SCREEN, 0x10, 0x417, 0x1000, 4, 0x50, 5, 0xB, 0);
    unk284++;
    sub_806A568(unk284, RENDER_TARGET_SCREEN, 0x10, 0x417, 0x1000, 0xC, 0x68, 5, 0xC, 0);
    unk284++;
    sub_806A568(unk284, RENDER_TARGET_SCREEN, 0x10, 0x417, 0x1000, 0x14, 0x80, 5, 0xD, 0);

// Might not be matching because of something to do with the data
#ifndef NON_MATCHING
    r0 = sTimeRecordsZoneActTitleDigits;
    spriteSize = MaxSpriteSize(r0, ARRAY_COUNT(sTimeRecordsZoneActTitleDigits));
#else
    spriteSize = MaxSpriteSize(sTimeRecordsZoneActTitleDigits, ARRAY_COUNT(sTimeRecordsZoneActTitleDigits));
#endif
    // render "ZONE"
    sub_806A568(zoneText, RENDER_TARGET_SCREEN, 0x14, 0x418, 0x1000, 0x10, 0xC, 3, 0, 0);
#ifndef NON_MATCHING
    asm("" : "=r"(r0));
#endif

    zoneText++;
    titleDigit = &sTimeRecordsZoneActTitleDigits[zone];
#ifndef NON_MATCHING
    asm("" ::: "sl");
#endif
    // render zone number
    sub_806A568(zoneText, RENDER_TARGET_SCREEN, spriteSize, titleDigit->unk0, 0x1000, 0x5E, 0xC, 3, titleDigit->unk2, 0);

    if (!timeRecordsScreen->isBossMode) {
        // render "ACT"
        sub_806A568(actText, RENDER_TARGET_SCREEN, 0x10, 0x418, 0x1000, 0x4E, 0x20, 3, 1, 0);
        actText++;

        titleDigit = &sTimeRecordsZoneActTitleDigits[act];
        // render act number
        sub_806A568(actText, RENDER_TARGET_SCREEN, spriteSize, titleDigit->unk0, 0x1000, 0x88, 0x20, 3, titleDigit->unk2, 0);
    } else {
        // render "BOSS"
        sub_806A568(actText, RENDER_TARGET_SCREEN, 0x14, 0x418, 0x1000, 0x4e, 0x20, 3, 9, 0);
    }

    if (!timeRecordsScreen->isBossMode) {
        zoneSubText = &sZoneNameTitles[language][timeRecordsScreen->zone];
    } else {
        zoneSubText = &sZoneBossTitles[language][timeRecordsScreen->zone];
    }

    // Seems like a bug, this will potentially overflow when reading
    // 7 zones, as we could already be further
    spriteSize = MaxSpriteSize(zoneSubText, 7);
    sub_806A568(zoneSubTitle, RENDER_TARGET_SCREEN, spriteSize, zoneSubText->unk0, 0x1000, 0x9a, 0x44, 3, zoneSubText->unk2, 0);
}

static inline u16 *LoadCourseTimes(struct TimeRecordsScreen *timeRecordsScreen)
{
    u8 act;

    if (!timeRecordsScreen->isBossMode) {
        act = timeRecordsScreen->act;
    } else {
        act = 2;
    }

    // When the records are loaded from options we have to load the data from the options
    // screen (though I don't understand why this wasn't done from the gLoadedSaveData)
    if (timeRecordsScreen->view != 2) {
        return timeRecordsScreen->playerDataMenu->optionsScreen->profileData.timeRecords
            .table[timeRecordsScreen->character][timeRecordsScreen->zone][act];
    } else {
        return timeRecordsScreen->timeRecords->table[timeRecordsScreen->character][timeRecordsScreen->zone][act];
    }
}

static void TimeRecordsScreenCreateTimesUI(struct TimeRecordsScreen *timeRecordsScreen)
{
    struct TimeRecordDisplay *timeRecordDisplay = timeRecordsScreen->timeDisplays;
    // interesting optimistation, as I guess they are all the same size
    s16 digitSize = sTimeRecordDigitTiles[DELIMINATOR_DIGIT].unk4;
    Sprite *minuteDigit, *secondDigit, *milliDigit, *deliminator;

    u16 *courseTimes = LoadCourseTimes(timeRecordsScreen);
    s16 i;

    for (i = 0; i < 3; i++, timeRecordDisplay++) {
        const struct UNK_080D95E8 *digit;
        s16 millis, minutes, seconds;
        u16 timeValue;

        deliminator = timeRecordDisplay->deliminators;
        minuteDigit = &timeRecordDisplay->minute;
        secondDigit = timeRecordDisplay->seconds;
        milliDigit = timeRecordDisplay->millis;

        timeValue = courseTimes[i];
        if (timeValue < MAX_COURSE_TIME) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            millis = gMillisUnpackTable[temp][0] * 10;
            millis += gMillisUnpackTable[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        digit = &sTimeRecordDigitTiles[DELIMINATOR_DIGIT];
        sub_806A568(deliminator, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 48), (i * 24 + 84), 8, digit->unk2, 0);

        deliminator++;
        sub_806A568(deliminator, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 96), (i * 24 + 84), 8, digit->unk2, 0);

        digit = &sTimeRecordDigitTiles[minutes];
        sub_806A568(minuteDigit, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 0x20), (i * 24 + 84), 8, digit->unk2, 0);

        digit = &sTimeRecordDigitTiles[TENS_DIGIT(seconds)];
        sub_806A568(secondDigit, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 0x40), (i * 24 + 84), 8, digit->unk2, 0);

        secondDigit++;
        digit = &sTimeRecordDigitTiles[UNITS_DIGIT(seconds)];
        sub_806A568(secondDigit, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 0x50), (i * 24 + 84), 8, digit->unk2, 0);

        digit = &sTimeRecordDigitTiles[TENS_DIGIT(millis)];
        sub_806A568(milliDigit, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 0x70), (i * 24 + 84), 8, digit->unk2, 0);

        milliDigit++;
        digit = &sTimeRecordDigitTiles[UNITS_DIGIT(millis)];
        sub_806A568(milliDigit, RENDER_TARGET_SCREEN, digitSize, digit->unk0, 0x3000, (i * 8 + 0x80), (i * 24 + 84), 8, digit->unk2, 0);
    }
}

static void TimeRecordsScreenRefreshTimesUI(struct TimeRecordsScreen *timeRecordsScreen)
{
    // Stack has to be declared in this order to match
    struct TimeRecordDisplay *timeDisplay = timeRecordsScreen->timeDisplays;
    Sprite *minuteDigit, *secondDigit, *milliDigit, *deliminator;

    u16 *courseTimes = LoadCourseTimes(timeRecordsScreen);
    s16 i;

    for (i = 0; i < 3; i++, timeDisplay++) {
        const struct UNK_080D95E8 *digitTile;
        s16 millis, minutes, seconds;
        u16 timeValue;

        minuteDigit = &timeDisplay->minute;
        secondDigit = timeDisplay->seconds;
        milliDigit = timeDisplay->millis;
        deliminator = timeDisplay->deliminators;

        timeValue = courseTimes[i];
        if (timeValue < MAX_COURSE_TIME) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            // This logic is the same as the above function but required to be
            // inline instead of split, but required to be split in the other function
            millis = gMillisUnpackTable[temp][0] * 10 + gMillisUnpackTable[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        digitTile = &sTimeRecordDigitTiles[minutes];

        minuteDigit->graphics.anim = digitTile->unk0;
        minuteDigit->variant = digitTile->unk2;
        minuteDigit->x = (i * 8) + 272;
        UpdateSpriteAnimation(minuteDigit);

        deliminator->x = (i * 8) + 288;
        deliminator++;

        digitTile = &sTimeRecordDigitTiles[TENS_DIGIT(seconds)];
        secondDigit->graphics.anim = digitTile->unk0;
        secondDigit->variant = digitTile->unk2;
        secondDigit->x = (i * 8) + 304;
        UpdateSpriteAnimation(secondDigit);

        secondDigit++;
        digitTile = &sTimeRecordDigitTiles[UNITS_DIGIT(seconds)];
        secondDigit->graphics.anim = digitTile->unk0;
        secondDigit->variant = digitTile->unk2;
        secondDigit->x = (i * 8) + 320;
        UpdateSpriteAnimation(secondDigit);

        deliminator->x = (i * 8) + 336;

        digitTile = &sTimeRecordDigitTiles[TENS_DIGIT(millis)];
        milliDigit->graphics.anim = digitTile->unk0;
        milliDigit->variant = digitTile->unk2;
        milliDigit->x = (i * 8) + 352;
        UpdateSpriteAnimation(milliDigit);

        milliDigit++;
        digitTile = &sTimeRecordDigitTiles[UNITS_DIGIT(millis)];
        milliDigit->graphics.anim = digitTile->unk0;
        milliDigit->variant = digitTile->unk2;
        milliDigit->x = (i * 8) + 368;
        UpdateSpriteAnimation(milliDigit);
    }
}

static void Task_TimeRecordsScreenHandleCharacterChange(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    u32 character;

    if (timeRecordsScreen->character != 0xFF) {
        character = timeRecordsScreen->character;
    } else {
        character = CHARACTER_SONIC;
    }

    TimeRecordsScreenRenderCoursesViewUI(1);
    gBgScrollRegs[1][0] = 0xFF10;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0xFF10;
    gBgScrollRegs[2][1] = 0x10;

    OptionsInitBackground(&timeRecordsScreen->coursesViewCharacterBackground, 1, 0x16, sTimeRecordsCharacterAssets[character][0], 9, 0x14,
                          0, 1, 0, 0);
    OptionsInitBackground(&timeRecordsScreen->coursesViewCharacter, 2, 0x1E, sTimeRecordsCharacterAssets[character][1], 9, 0x14, 0, 2, 0,
                          0);

    gCurTask->main = Task_TimeRecordsScreenCharacterChangeAnimIn;
}

static void Task_TimeRecordsScreenCharacterChangeAnimIn(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);

    if (++timeRecordsScreen->animFrame < 5) {
        gBgScrollRegs[1][0] = timeRecordsScreen->animFrame * 18 - DISPLAY_WIDTH;
    }

    if (timeRecordsScreen->animFrame > 6) {
        gBgScrollRegs[2][0] = (timeRecordsScreen->animFrame - 6) * 18 - DISPLAY_WIDTH;
    }

    TimeRecordsScreenRenderCoursesViewUI(1);

    if (timeRecordsScreen->animFrame > 9) {
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
    }
}

static void Task_TimeRecordsScreenCourseChangeAnim(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    s16 i;

    timeRecordsScreen->animFrame++;

    for (i = 0; i < 3; i++) {
        TimeRecordsScreenRenderTimeRowAnimFrame(i, timeRecordsScreen->animFrame + i * -8);
    }

    TimeRecordsScreenRenderCoursesViewUI(0);

    if (timeRecordsScreen->animFrame > 31) {
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenCoursesViewMain;
    }
}

static void TimeRecordsScreenRenderTimeRowAnimFrame(s16 rowIndex, s16 frame)
{
    // Not sure why but the struct has to be loaded like this
#ifndef NON_MATCHING
    u32 offsetA = gCurTask->data + (rowIndex * sizeof(struct TimeRecordDisplay));
    register u32 offsetB asm("r2") = IWRAM_START + offsetof(struct TimeRecordsScreen, timeDisplays);
    struct TimeRecordDisplay *timeDisplay = (struct TimeRecordDisplay *)(offsetA + offsetB);
#else
    struct TimeRecordsScreen *trs = TASK_DATA(gCurTask);
    struct TimeRecordDisplay *timeDisplay = &trs->timeDisplays[rowIndex];
#endif

    if (frame > 0 && frame < 9) {
        Sprite *deliminator = timeDisplay->deliminators;
        Sprite *minuteDigit = &timeDisplay->minute;
        Sprite *secondDigit = timeDisplay->seconds;
        Sprite *milliDigit = timeDisplay->millis;

        s16 baseXPos = (8 - frame) * 30 + (rowIndex * 8);
        minuteDigit->x = baseXPos + 0x20;
        deliminator->x = baseXPos + 0x30;
        deliminator++;
        deliminator->x = baseXPos + 0x60;

        secondDigit->x = baseXPos + 0x40;
        secondDigit++;
        secondDigit->x = baseXPos + 0x50;

        milliDigit->x = baseXPos + 0x70;
        milliDigit++;
        milliDigit->x = baseXPos + 0x80;
    }
}

static void Task_TimeRecordsScreenCoursesViewMain(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    s16 availableCourses = timeRecordsScreen->unlockedCourses[timeRecordsScreen->character];
    s32 temp;
    if (availableCourses == 0) {
        availableCourses = 1;
    }
    // Possibly some macro
    temp = (u16)availableCourses;
    if (temp > 0x1B) {
        availableCourses = 0x1B;
    }
    TimeRecordsScreenRenderCoursesViewUI(0);

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        if (timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && availableCourses == 1) {
            return;
        }

        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & DPAD_LEFT) {
            if (!timeRecordsScreen->isBossMode) {
                if (timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK) {
                    if (timeRecordsScreen->act == 0) {
                        if (timeRecordsScreen->zone != 0) {
                            timeRecordsScreen->zone--;
                            timeRecordsScreen->act = 1;
                        } else {
                            timeRecordsScreen->zone = availableCourses >> 2;
                            timeRecordsScreen->act = (availableCourses & 3) != 1;
                        }
                        gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                        return;
                    }
                    timeRecordsScreen->act--;
                } else {
                    if (timeRecordsScreen->act == 0) {
                        timeRecordsScreen->act = 1;
                        if (timeRecordsScreen->zone != 0) {
                            timeRecordsScreen->zone--;
                        } else {
                            timeRecordsScreen->zone = 6;
                        }
                        gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                        return;
                    } else {
                        timeRecordsScreen->act--;
                    }
                }
            } else {
                if (timeRecordsScreen->zone != 0) {
                    timeRecordsScreen->zone--;
                } else {
                    timeRecordsScreen->zone = NUM_COURSE_ZONES - 1;
                }
                gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                return;
            }
        } else if (gRepeatedKeys & DPAD_RIGHT) {
            if (!timeRecordsScreen->isBossMode) {
                if (timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK) {
                    s32 r5;
                    s16 r1;
                    s32 backup = availableCourses;
                    availableCourses >>= 2;
                    r1 = backup & 3;
                    r5 = r1 != 1;
                    if (timeRecordsScreen->act > 0) {
                        timeRecordsScreen->act = 0;
                        if (timeRecordsScreen->zone < NUM_COURSE_ZONES - 1) {
                            timeRecordsScreen->zone++;
                        } else {
                            timeRecordsScreen->zone = 0;
                        }

                        if (timeRecordsScreen->zone > availableCourses) {
                            timeRecordsScreen->zone = 0;
                            timeRecordsScreen->act = 0;
                        }
                    } else {
                        timeRecordsScreen->act++;
                        if (timeRecordsScreen->zone >= availableCourses && timeRecordsScreen->act > r5) {
                            timeRecordsScreen->zone = 0;
                            timeRecordsScreen->act = 0;
                            gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                            return;
                        } else {
                            gCurTask->main = Task_TimeRecordsScreenHandleActChange;
                            return;
                        }
                    }
                    gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                    return;
                }

                if (timeRecordsScreen->act > 0) {
                    timeRecordsScreen->act = 0;
                    if (timeRecordsScreen->zone < NUM_COURSE_ZONES - 1) {
                        timeRecordsScreen->zone++;
                    } else {
                        timeRecordsScreen->zone = 0;
                    }
                    gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                    return;
                } else {
                    timeRecordsScreen->act++;
                }

            } else {
                if (timeRecordsScreen->zone < NUM_COURSE_ZONES - 1) {
                    timeRecordsScreen->zone++;
                } else {
                    timeRecordsScreen->zone = 0;
                }
                gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                return;
            }
        }
        gCurTask->main = Task_TimeRecordsScreenHandleActChange;
        return;
    }

    if (timeRecordsScreen->view != TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK) {
        if (gRepeatedKeys & (DPAD_DOWN | DPAD_UP)) {
            s16 maxCharacterIndex = timeRecordsScreen->availableCharacters - 1;
            if (maxCharacterIndex == 0) {
                return;
            }

            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            if (gRepeatedKeys & DPAD_UP) {
                if (timeRecordsScreen->character != 0) {
                    timeRecordsScreen->character--;
                } else {
                    timeRecordsScreen->character = maxCharacterIndex;
                }
            } else if (gRepeatedKeys & DPAD_DOWN) {
                if (timeRecordsScreen->character < maxCharacterIndex) {
                    timeRecordsScreen->character++;
                } else {
                    timeRecordsScreen->character = 0;
                }
            }

            timeRecordsScreen->animFrame = 4;
            gCurTask->main = Task_TimeRecordsScreenCharacterChangeAnimOut;
            return;
        }
    } else {
        if (gPressedKeys & A_BUTTON) {
            m4aSongNumStart(SE_SELECT);
            Task_TimeRecordsScreenHandleCourseSelected();
            return;
        }
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        TimeRecordsScreenHandleReturn();
    }
}

static void Task_TimeRecordsScreenCharacterChangeAnimOut(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);

    timeRecordsScreen->animFrame--;

    gBgScrollRegs[1][0] = timeRecordsScreen->animFrame * 18 - DISPLAY_WIDTH;
    gBgScrollRegs[2][0] = timeRecordsScreen->animFrame * 18 - DISPLAY_WIDTH;

    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(1);

    if (timeRecordsScreen->animFrame == 0) {
        // Weird
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenHandleCharacterChange;
    }
}

static void Task_TimeRecordsScreenHandleCourseChange(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    Sprite *zoneNumber = &timeRecordsScreen->choiceViewItemsOrZoneTitle[1];
    Sprite *unkDC = &timeRecordsScreen->actTitle[1];
    Sprite *zoneSubtitle = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;

    u16 language = timeRecordsScreen->language;
    // zone number
    const struct UNK_080D95E8 *zoneTitleText = &sTimeRecordsZoneActTitleDigits[timeRecordsScreen->zone];
    zoneNumber->graphics.anim = zoneTitleText->unk0;
    zoneNumber->variant = zoneTitleText->unk2;

    UpdateSpriteAnimation(zoneNumber);

    if (!timeRecordsScreen->isBossMode) {
        zoneTitleText = &sTimeRecordsZoneActTitleDigits[timeRecordsScreen->act];
        unkDC->graphics.anim = zoneTitleText->unk0;
        unkDC->variant = zoneTitleText->unk2;
        UpdateSpriteAnimation(unkDC);
    }

    // zone subtitle text
    if (!timeRecordsScreen->isBossMode) {
        zoneTitleText = &sZoneNameTitles[language][timeRecordsScreen->zone];
    } else {
        zoneTitleText = &sZoneBossTitles[language][timeRecordsScreen->zone];
    }

    zoneSubtitle->graphics.anim = zoneTitleText->unk0;
    zoneSubtitle->variant = zoneTitleText->unk2;
    UpdateSpriteAnimation(zoneSubtitle);

    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(0);
    timeRecordsScreen->animFrame = 0;
    gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
}

static void Task_TimeRecordsScreenFadeToPrevious(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk0 = &timeRecordsScreen->fade;
    struct PlayerDataMenu *playerDataMenu = timeRecordsScreen->playerDataMenu;

    u8 availableCharacters;
    bool8 allCharactersUnlocked;

    if (!UpdateScreenFade(unk0)) {
        TimeRecordsScreenRenderCoursesViewUI(0);
        return;
    }

    switch (timeRecordsScreen->view) {
        case TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE:
            timeRecordsScreen->animFrame = 0;
            timeRecordsScreen->isBossMode = FALSE;
            timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
            ResetProfileScreensVram();

            TimeRecordScreenInitRegisters();
            TimeRecordsScreenCreateChoiceViewBackgroundsUI(timeRecordsScreen);
            TimeRecordsScreenCreateChoiceViewUI(timeRecordsScreen);
            gCurTask->main = Task_TimeRecordsScreenChoiceViewFadeIn;
            break;
        case TIME_RECORDS_SCREEN_VIEW_COURSES:
            playerDataMenu->state = PLAYER_DATA_MENU_STATE_ACTIVE;
            TaskDestroy(gCurTask);
            break;
        case TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK:
            allCharactersUnlocked = FALSE;
            availableCharacters = timeRecordsScreen->availableCharacters;
            if (availableCharacters == NUM_CHARACTERS) {
                allCharactersUnlocked = TRUE;
            }
            EwramFree(timeRecordsScreen->timeRecords);
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            CreateCharacterSelectionScreen(timeRecordsScreen->character, allCharactersUnlocked);
            break;
    }
}

static void TimeRecordsScreenRenderCoursesViewUI(u16 a)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    struct TimeRecordDisplay *timeRecord = timeRecordsScreen->timeDisplays;
    Sprite *timeRecordDisplay = timeRecordsScreen->timeRecordDisplays;
    Sprite *zoneTitleElement = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    Sprite *actTitleElement = timeRecordsScreen->actTitle;
    Sprite *zoneSubtitle = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    Sprite *scrollArrows = timeRecordsScreen->choiceViewScrollArrows;

    Sprite *minute, *secondDigit, *milliDigit, *deliminator;

    s16 visibleScrollArrows, i, j;
    s16 availableCourses = timeRecordsScreen->unlockedCourses[timeRecordsScreen->character];
    if (availableCourses == 0) {
        availableCourses = 1;
    }

    for (i = 0; i < 3; i++, timeRecordDisplay++) {
        DisplaySprite(timeRecordDisplay);
    }

    for (i = 0; i < 2; i++, zoneTitleElement++) {
        DisplaySprite(zoneTitleElement);
    }

    // No idea why j is reused here
    j = timeRecordsScreen->view != TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && !a && timeRecordsScreen->availableCharacters > 1 ? 4 : 2;
    visibleScrollArrows = timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && availableCourses < 2 ? 0 : j;

    for (i = 0; i < visibleScrollArrows; i++, scrollArrows++) {
        UpdateSpriteAnimation(scrollArrows);
        DisplaySprite(scrollArrows);
    }

    if (!timeRecordsScreen->isBossMode) {
        for (i = 0; i < 2; i++, actTitleElement++) {
            DisplaySprite(actTitleElement);
        }
    } else {
        DisplaySprite(actTitleElement);
    }

    DisplaySprite(zoneSubtitle);

    for (i = 0; i < 3; i++, timeRecord++) {
        deliminator = timeRecord->deliminators;
        minute = &timeRecord->minute;
        secondDigit = timeRecord->seconds;
        milliDigit = timeRecord->millis;

        for (j = 0; j < 2; j++, deliminator++) {
            DisplaySprite(deliminator);
        }

        DisplaySprite(minute);

        for (j = 0; j < 2; j++, secondDigit++) {
            DisplaySprite(secondDigit);
        }

        for (j = 0; j < 2; j++, milliDigit++) {
            DisplaySprite(milliDigit);
        }
    }
}

static void CreateMultiplayerRecordsScreen(struct PlayerDataMenu *playerDataMenu)
{
    struct Task *t
        = TaskCreate(Task_MultiplayerRecordsScreenCreateNextTableRowUI, sizeof(struct MultiplayerRecordsScreen), 0x2000, 4, NULL);
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(t);

    struct MultiplayerRecordRow *rows;
    struct OptionsScreenProfileData *profileData;
    s16 i, j;

    multiplayerRecordsScreen->table = EwramMalloc(sizeof(struct MultiplayerRecordsTable));
    multiplayerRecordsScreen->playerDataMenu = playerDataMenu;

    multiplayerRecordsScreen->scrollAnimFrame = 0;
    multiplayerRecordsScreen->targetFirstVisibleRowIndex = 0;
    multiplayerRecordsScreen->currentFirstVisibleRowIndex = 0;
    multiplayerRecordsScreen->scrollIndex = 0;
    multiplayerRecordsScreen->language = playerDataMenu->language;

    profileData = &playerDataMenu->optionsScreen->profileData;
    memcpy(multiplayerRecordsScreen->playerName, profileData->playerName, sizeof(profileData->playerName));
    multiplayerRecordsScreen->playerWins = profileData->multiplayerWins;
    multiplayerRecordsScreen->playerLoses = profileData->multiplayerLoses;
    multiplayerRecordsScreen->playerDraws = profileData->multiplayerDraws;

    rows = multiplayerRecordsScreen->table->rows;
    for (i = 0; i < NUM_MULTIPLAYER_SCORES; i++) {
        for (j = 0; j < MAX_PLAYER_NAME_LENGTH; j++) {
            rows[i].playerName[j] = profileData->multiplayerScores[i].playerName[j];
            if (rows[i].playerName[j] == PLAYER_NAME_END_CHAR) {
                break;
            }
        }

        for (; j < MAX_PLAYER_NAME_LENGTH; j++) {
            rows[i].playerName[j] = PLAYER_NAME_END_CHAR;
        }

        rows[i].slotFilled = profileData->multiplayerScores[i].slotFilled;
        rows[i].wins = profileData->multiplayerScores[i].wins;
        rows[i].loses = profileData->multiplayerScores[i].losses;
        rows[i].draws = profileData->multiplayerScores[i].draws;
    }

    ResetProfileScreensVram();

    MultiplayerRecordsScreenInitRegisters();
    MultiplayerRecordsScreenCreateBackgroundsUI(multiplayerRecordsScreen);
    MultiplayerRecordsScreenCreatePlayerRowUI(multiplayerRecordsScreen);
}

static void MultiplayerRecordsScreenInitRegisters(void)
{
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x701;
    gBgCntRegs[1] = 0x9606;
    gBgCntRegs[2] = 0x1F0F;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

static void MultiplayerRecordsScreenCreateBackgroundsUI(struct MultiplayerRecordsScreen *multiplayerRecordsScreen)
{
    ScreenFade *fade = &multiplayerRecordsScreen->fade;
    fade->window = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    OptionsInitBackground(&multiplayerRecordsScreen->backgroundTrims, 0, 7, TM_OPTIONS_VS_RECORD_BG1, 0x1E, 0x14, 0, 0, 0, 0);
    OptionsInitBackground(&multiplayerRecordsScreen->background, 1, 0x16, TM_OPTIONS_TIME_RECORD_BG0, 0x1E, 0x14, 0, 1, 0, 0);
}

static void MultiplayerRecordsScreenCreatePlayerRowUI(struct MultiplayerRecordsScreen *multiplayerRecordsScreen)
{
    s16 i, xPos, yPos;
    struct UNK_806B908 nameCharTile;
    s16 wins, loses, draws;

    Sprite *title = &multiplayerRecordsScreen->title;
    Sprite *columnHeaders = &multiplayerRecordsScreen->columnHeaders;
    Sprite *scrollArrows = multiplayerRecordsScreen->scrollArrows;
    Sprite *playerNameDisplayChar = multiplayerRecordsScreen->playerNameDisplay;
    Sprite *playerWinsDigit = multiplayerRecordsScreen->playerWinsDigits;
    Sprite *playerLossesDigit = multiplayerRecordsScreen->playerLossesDigits;
    Sprite *playerDrawsDigit = multiplayerRecordsScreen->playerDrawsDigits;

    const struct UNK_080D95E8 *titleAndColumnHeadersText = sMultiplayerRecordsTitleAndColumnHeadersText[multiplayerRecordsScreen->language];
    const struct UNK_080D95E8 *scrollArrowTile = sProfileNameScreenScrollArrowTiles;
    // The data is made into a pointer here but then another pointer is used for
    // the actual reference
    const struct UNK_080D95E8 *digitTile, *digitTiles = sMultiplayerScoreDigitTiles;

    // title
    sub_806A568(title, RENDER_TARGET_SCREEN, titleAndColumnHeadersText->unk4, titleAndColumnHeadersText->unk0, 0x1000, 9, 18, 5,
                titleAndColumnHeadersText->unk2, 0);

    // column headers
    titleAndColumnHeadersText++;
    sub_806A568(columnHeaders, RENDER_TARGET_SCREEN, titleAndColumnHeadersText->unk4, titleAndColumnHeadersText->unk0, 0x1000, 118, 38, 5,
                titleAndColumnHeadersText->unk2, 0);

    sub_806A568(scrollArrows, RENDER_TARGET_SCREEN, scrollArrowTile->unk4, scrollArrowTile->unk0, 0x1000, 8, 0x4E, 0xD,
                scrollArrowTile->unk2, 0);
    scrollArrows++;
    scrollArrowTile++;
    sub_806A568(scrollArrows, RENDER_TARGET_SCREEN, scrollArrowTile->unk4, scrollArrowTile->unk0, 0x1000, 8, 0x88, 0xD,
                scrollArrowTile->unk2, 0);

    for (i = 0, xPos = 34, yPos = 58; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++, xPos += 12) {
        u16 nameChar = multiplayerRecordsScreen->playerName[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(playerNameDisplayChar, RENDER_TARGET_SCREEN, nameCharTile.unk0, nameCharTile.unk4, 0x1000, xPos, yPos, 5,
                    nameCharTile.unk6, 0);
    }

    wins = multiplayerRecordsScreen->playerWins;
    loses = multiplayerRecordsScreen->playerLoses;
    draws = multiplayerRecordsScreen->playerDraws;

    digitTile = &digitTiles[TENS_DIGIT(wins)];
    sub_806A568(playerWinsDigit, RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0x7C, 0x40, 0xD, digitTile->unk2, 0);

    playerWinsDigit++;
    digitTile = &digitTiles[UNITS_DIGIT(wins)];
    sub_806A568(playerWinsDigit, RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0x84, 0x40, 0xD, digitTile->unk2, 0);

    digitTile = &digitTiles[TENS_DIGIT(loses)];
    sub_806A568(playerLossesDigit, RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xA4, 0x40, 0xD, digitTile->unk2, 0);

    playerLossesDigit++;
    digitTile = &digitTiles[UNITS_DIGIT(loses)];
    sub_806A568(playerLossesDigit, RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xAC, 0x40, 0xD, digitTile->unk2, 0);

    digitTile = &digitTiles[TENS_DIGIT(draws)];
    sub_806A568(playerDrawsDigit, RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xCC, 0x40, 0xD, digitTile->unk2, 0);

    playerDrawsDigit++;
    digitTile = &digitTiles[UNITS_DIGIT(draws)];
    sub_806A568(playerDrawsDigit, RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xD4, 0x40, 0xD, digitTile->unk2, 0);
}

static void MultiplayerRecordsScreenCreateTableRowUI(s16 rowIndex)
{
    s16 loses, draws, wins, j, xPos, yPos;
    Sprite *nameDisplayChar;

    struct UNK_806B908 nameCharTile;

    struct MultiplayerRecordsScreen *screen = TASK_DATA(gCurTask);
    struct MultiplayerRecordRow *row = &screen->table->rows[rowIndex];
    const struct UNK_080D95E8 *digitTile, *digitTiles = sMultiplayerScoreDigitTiles;

    if (!row->slotFilled) {
        return;
    }

    yPos = rowIndex * 18 + 90;
    nameDisplayChar = row->nameDisplay;

    for (j = 0, xPos = 34; j < MAX_PLAYER_NAME_LENGTH; j++, nameDisplayChar++, xPos += 12) {
        u16 nameChar = row->playerName[j];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 17;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(nameDisplayChar, RENDER_TARGET_SCREEN, nameCharTile.unk0, nameCharTile.unk4, 0x2000, xPos, yPos, 5, nameCharTile.unk6,
                    0);
    }

    wins = row->wins;
    loses = row->loses;
    draws = row->draws;
    yPos += 6;

    digitTile = &digitTiles[TENS_DIGIT(wins)];
    sub_806A568(&row->winsDigits[0], RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0x7C, yPos, 0xD, digitTile->unk2, 0);

    digitTile = &digitTiles[UNITS_DIGIT(wins)];
    sub_806A568(&row->winsDigits[1], RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0x84, yPos, 0xD, digitTile->unk2, 0);

    digitTile = &digitTiles[TENS_DIGIT(loses)];
    sub_806A568(&row->losesDigits[0], RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xA4, yPos, 0xD, digitTile->unk2, 0);

    digitTile = &digitTiles[UNITS_DIGIT(loses)];
    sub_806A568(&row->losesDigits[1], RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xAC, yPos, 0xD, digitTile->unk2, 0);

    digitTile = &digitTiles[TENS_DIGIT(draws)];
    sub_806A568(&row->defeatsDigits[0], RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xCC, yPos, 0xD, digitTile->unk2,
                0);

    digitTile = &digitTiles[UNITS_DIGIT(draws)];
    sub_806A568(&row->defeatsDigits[1], RENDER_TARGET_SCREEN, digitTile->unk4, digitTile->unk0, 0x2000, 0xD4, yPos, 0xD, digitTile->unk2,
                0);
}

static void Task_MultiplayerRecordsScreenMain(void)
{
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);
    struct MultiplayerRecordRow *rows = multiplayerRecordsScreen->table->rows;

    MultiplayerRecordsScreenRenderUI();

    if (gRepeatedKeys & (DPAD_DOWN | DPAD_UP)) {
        if (gRepeatedKeys & DPAD_UP) {
            if (multiplayerRecordsScreen->scrollIndex > 0) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                multiplayerRecordsScreen->currentFirstVisibleRowIndex = multiplayerRecordsScreen->scrollIndex;
                multiplayerRecordsScreen->targetFirstVisibleRowIndex = --multiplayerRecordsScreen->scrollIndex;

                gCurTask->main = Task_MultiplayerRecordsScreenScrollAnim;
                return;
            }
        } else if (gRepeatedKeys & DPAD_DOWN) {
            if (multiplayerRecordsScreen->scrollIndex >= MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX) {
                return;
            }

            // next row to show
            rows = &rows[multiplayerRecordsScreen->scrollIndex + MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS];
            if (rows->slotFilled) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                multiplayerRecordsScreen->targetFirstVisibleRowIndex = multiplayerRecordsScreen->scrollIndex;
                multiplayerRecordsScreen->currentFirstVisibleRowIndex = multiplayerRecordsScreen->scrollIndex;
                multiplayerRecordsScreen->scrollIndex++;

                gCurTask->main = Task_MultiplayerRecordsScreenScrollAnim;
                return;
            }
        }
    }

    if (gRepeatedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        Task_MultiplayerRecordsScreenHandleExit();
    }
}

static void Task_MultiplayerRecordsScreenScrollAnim(void)
{
    struct MultiplayerRecordRow *row;
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);

    // assume that we are going to need to render the next row or previous row
    s16 numVisibleRows = MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS + 1;
    s16 yPos, temp, i, j;

    multiplayerRecordsScreen->scrollAnimFrame++;

    if (multiplayerRecordsScreen->scrollIndex < multiplayerRecordsScreen->currentFirstVisibleRowIndex) {
        temp = multiplayerRecordsScreen->scrollAnimFrame * 2 + 72;
    } else {
        temp = 90 - (multiplayerRecordsScreen->scrollAnimFrame * 2);
    }
    yPos = temp;

    if (multiplayerRecordsScreen->scrollAnimFrame > 8) {
        yPos = 90;
        multiplayerRecordsScreen->targetFirstVisibleRowIndex = multiplayerRecordsScreen->scrollIndex;
    }

    if (multiplayerRecordsScreen->targetFirstVisibleRowIndex == MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX) {
        numVisibleRows--;
    }

    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->targetFirstVisibleRowIndex];

    for (i = 0; i < numVisibleRows; i++, yPos += 18, row++) {
        Sprite *unk10, *unk130, *unk190, *unk1F0;

        unk10 = row->nameDisplay;
        for (j = 0; j < 6; j++, unk10++) {
            unk10->y = yPos;
        }

        unk130 = row->winsDigits;
        for (j = 0; j < 2; j++, unk130++) {
            unk130->y = yPos + 6;
        }

        unk190 = row->losesDigits;
        for (j = 0; j < 2; j++, unk190++) {
            unk190->y = yPos + 6;
        }

        unk1F0 = row->defeatsDigits;
        for (j = 0; j < 2; j++, unk1F0++) {
            unk1F0->y = yPos + 6;
        }
    }

    MultiplayerRecordsScreenRenderUI();

    if (multiplayerRecordsScreen->scrollAnimFrame > 8) {
        multiplayerRecordsScreen->scrollAnimFrame = 0;
        gCurTask->main = Task_MultiplayerRecordsScreenMain;
    }
}

static void MultiplayerRecordsScreenRenderUI(void)
{
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);
    Sprite *title = &multiplayerRecordsScreen->title;
    Sprite *columnHeaders = &multiplayerRecordsScreen->columnHeaders;
    Sprite *playerNameDisplayChar = multiplayerRecordsScreen->playerNameDisplay;
    Sprite *playerWinsDigit = multiplayerRecordsScreen->playerWinsDigits;
    Sprite *playerLossesDigit = multiplayerRecordsScreen->playerLossesDigits;
    Sprite *playerDrawsDigit = multiplayerRecordsScreen->playerDrawsDigits;
    Sprite *scrollArrow;

    // recordsTable completely unused in this var, but needs to be assigned to match
    struct MultiplayerRecordsTable *recordsTable = multiplayerRecordsScreen->table;
    struct MultiplayerRecordRow *row;

    s16 i, j;
    s16 numVisibleRows = MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS + 1;

    DisplaySprite(title);
    DisplaySprite(columnHeaders);

    scrollArrow = multiplayerRecordsScreen->scrollArrows;
    UpdateSpriteAnimation(scrollArrow);
    scrollArrow++;
    UpdateSpriteAnimation(scrollArrow);
    scrollArrow--;

    if (multiplayerRecordsScreen->scrollIndex > 0) {
        DisplaySprite(scrollArrow);
    }
    scrollArrow++;

    // Maybe they meant to use the assignment here
    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->scrollIndex + MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS];
    if (multiplayerRecordsScreen->scrollIndex < MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX && row->slotFilled) {
        DisplaySprite(scrollArrow);
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
        DisplaySprite(playerNameDisplayChar);
    }

    for (i = 0; i < 2; i++, playerWinsDigit++) {
        DisplaySprite(playerWinsDigit);
    }

    for (i = 0; i < 2; i++, playerLossesDigit++) {
        DisplaySprite(playerLossesDigit);
    }

    for (i = 0; i < 2; i++, playerDrawsDigit++) {
        DisplaySprite(playerDrawsDigit);
    }

    if (multiplayerRecordsScreen->targetFirstVisibleRowIndex == MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX) {
        numVisibleRows--;
    }

    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->targetFirstVisibleRowIndex];

    for (i = 0; i < numVisibleRows; i++, row++) {
        if (!row->slotFilled) {
            continue;
        }

        playerNameDisplayChar = row->nameDisplay;

        for (j = 0; j < MAX_PLAYER_NAME_LENGTH; j++, playerNameDisplayChar++) {
            DisplaySprite(playerNameDisplayChar);
        }

        playerWinsDigit = row->winsDigits;
        playerLossesDigit = row->losesDigits;
        playerDrawsDigit = row->defeatsDigits;

        DisplaySprite(playerWinsDigit);
        ++playerWinsDigit;
        DisplaySprite(playerWinsDigit);

        DisplaySprite(playerLossesDigit);
        ++playerLossesDigit;
        DisplaySprite(playerLossesDigit);

        DisplaySprite(playerDrawsDigit);
        ++playerDrawsDigit;
        DisplaySprite(playerDrawsDigit);
    }
}

// Some sort of register menu item function
// used in sound test, but wonder why it wasn't split out
void sub_806A568(Sprite *obj, s8 target, u32 size, u16 c, u32 assetId, s16 xPos, s16 yPos, u16 oamOrder, u8 variant, u8 palId)
{
    Sprite newObj;
    Sprite *s;
    s = &newObj;

    if (obj != NULL) {
        s = obj;
    }

    if (target != RENDER_TARGET_SCREEN) {
        if (gProfileScreenSubMenuNextVramAddress == NULL) {
            gProfileScreenSubMenuNextVramAddress = gProfileScreenNextVramAddress;
        }
        s->graphics.dest = gProfileScreenSubMenuNextVramAddress;
    } else {
        s->graphics.dest = gProfileScreenNextVramAddress;
    }

    s->graphics.size = 0;
    s->graphics.anim = c;
    s->frameFlags = assetId;
    s->x = xPos;
    s->y = yPos;
    s->oamFlags = SPRITE_OAM_ORDER(oamOrder);
    s->qAnimDelay = 0;
    s->prevAnim = -1;
    s->variant = variant;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = palId;
    s->hitboxes[0].index = -1;

    UpdateSpriteAnimation(s);

    switch (target) {
        case RENDER_TARGET_SCREEN:
            gProfileScreenNextVramAddress += size * TILE_SIZE_4BPP;
            // if we render to screen then the sub menu address should reset
            ResetProfileScreensSubMenuVram();
            break;
        case RENDER_TARGET_SUB_MENU:
            gProfileScreenSubMenuNextVramAddress += size * TILE_SIZE_4BPP;
            break;
    }
}

// This is the same function as sub_806BA14, so maybe
// the body is a macro?
//
// Unfortunately sub_806BA14 can't just call this function
// to match.
//
// Would match without this as inline if we used sub_806BA14 with -O3
// but then otherstuff doesn't match. Leaving for now
static inline bool16 sub_806A664_A(s16 mode, u16 inputCharacter)
{
    u16 unk5C4[2];
    u16 unk5C8[5];
    u16 *character;

    memcpy(unk5C4, gUnknown_080D95C4, sizeof(gUnknown_080D95C4));
    memcpy(unk5C8, gUnknown_080D95C8, sizeof(gUnknown_080D95C8));

    character = unk5C4;
    if (mode == 1) {
        character = unk5C8;
    } else {
        character = unk5C4;
    }

    if (mode == 1 && inputCharacter == 2) {
        return TRUE;
    }

    for (; *character != PLAYER_NAME_END_CHAR; character++) {
        if (inputCharacter >= *character && inputCharacter <= *character + 4) {
            return TRUE;
        }
    }

    return FALSE;
}

// Feels like it should be part of the UI module at the end but is declared here instead
static u16 sub_806A664(s16 mode, u16 inputCharacter)
{
    u16 unk5D2[2];
    u16 unk5D6[4][2];
    s16 i;

    memcpy(unk5D2, gUnknown_080D95D2, sizeof(gUnknown_080D95D2));
    memcpy(unk5D6, gUnknown_080D95D6, sizeof(gUnknown_080D95D6));

    if (!sub_806A664_A(mode, inputCharacter)) {
        return inputCharacter;
    }

    if (mode == 1 && inputCharacter == 2) {
        return 0x10B;
    } else if (mode == 1) {
        for (i = 0; i < 4; i++) {
            if (inputCharacter >= unk5D6[i][0] && inputCharacter <= unk5D6[i][0] + 4) {
                return (inputCharacter + unk5D6[i][1] - unk5D6[i][0]);
            }
        }
    } else if (inputCharacter >= unk5D2[0] && inputCharacter <= unk5D2[0] + 4) {
        return (inputCharacter + unk5D2[1] - unk5D2[0]);
    }

    return inputCharacter;
}

static void OptionsScreenTaskDestroyHandler(struct Task *optionsScreenTask)
{
    // unimplemented
}

static void Task_OptionsScreenShow(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    SetupOptionScreenBackgroundsUI(optionsScreen);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    gCurTask->main = Task_OptionScreenFadeIn;
}

static void SetupOptionScreenBackgroundsUI(struct OptionsScreen *optionsScreen)
{
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
}

static void Task_OptionScreenFadeIn(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static void OptionsScreenOpenSelectedSubMenu(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);

    switch (optionsScreen->menuCursor) {
        case OPTIONS_MENU_ITEM_PLAYER_DATA:
            CreatePlayerDataMenu(optionsScreen);
            break;
        case OPTIONS_MENU_ITEM_DIFFICULTY:
            CreateDifficultyMenu(optionsScreen);
            break;
        case OPTIONS_MENU_ITEM_TIME_LIMIT:
            CreateTimeLimitMenu(optionsScreen);
            break;
        case OPTIONS_MENU_ITEM_LANGUAGE:
            break;
        case OPTIONS_MENU_ITEM_BUTTON_CONFIG:
            CreateButtonConfigMenu(optionsScreen);
            break;
        case OPTIONS_MENU_ITEM_SOUND_TEST:
        case OPTIONS_MENU_ITEM_DELETE_GAME_DATA:
        case OPTIONS_MENU_ITEM_EXIT:
            break;
    }

    optionsScreen->subMenuAnimFrame = 0;
    gCurTask->main = Task_OptionsScreenSubMenuOpenAnim;
}

static void Task_OptionsScreenWaitForSubMenuExit(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    if (optionsScreen->state < OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN) {
        OptionsScreenRenderUI();
    }

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_ACTIVE) {
        optionsScreen->subMenuAnimFrame = 0;
        gCurTask->main = Task_OptionsScreenSubMenuCloseAnim;
    }
}

/** Menu 1 **/

static void OptionsScreenShowLanguageScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;

    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_OptionsScreenFadeOutToLanguageScreen;
}

static void Task_OptionsScreenFadeOutToLanguageScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        CreateEditLanguageScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForLanguageScreenExit;
    }
}

static void Task_OptionsScreenFadeInFromLanguageScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Menu 2 **/

static void OptionsScreenShowSoundTestScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;

    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_OptionScreenFadeOutToSoundTest;
}

static void Task_OptionScreenFadeOutToSoundTest(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        CreateSoundTestScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForSoundTestExit;
    }
}

static void Task_OptionsScreenFadeInFromSoundTest(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Menu 3 **/

static void OptionsScreenShowDeleteScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_OptionsScreenFadeOutToDeleteScreen;
}

static void Task_OptionsScreenFadeOutToDeleteScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        CreateDeleteScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForDeleteScreenExit;
    }
}

static void Task_OptionsScreenFadeInFromDeleteScreen(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (UpdateScreenFade(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Player Data Menu 1 **/

static void PlayerDataMenuShowProfileNameScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *fade = &playerDataMenu->unk150;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_PlayerDataMenuFadeOutToProfileNameScreen;
}

static void Task_PlayerDataMenuFadeOutToProfileNameScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (UpdateScreenFade(unk150)) {
        CreateEditProfileNameScreen(playerDataMenu);
        playerDataMenu->state = PLAYER_DATA_MENU_STATE_SCREEN_OPEN;
        playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;
        gCurTask->main = Task_PlayerDataMenuWaitForProfileNameScreenExit;
    }
}

static void Task_PlayerDataMenuFadeInFromProfileNameScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (UpdateScreenFade(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnimWait;
    }
}

/** Player Data Menu 2 **/

static void PlayerDataMenuShowTimeRecordsScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *fade = &playerDataMenu->unk150;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_PlayerDataMenuFadeOutToTimeRecordsScreen;
}

static void Task_PlayerDataMenuFadeInFromTimeRecordsScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (UpdateScreenFade(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnimWait;
    }
}

/** Player Data Menu 3 **/

static void PlayerDataMenuShowMultiplayerRecordsScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *fade = &playerDataMenu->unk150;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen;
}

static void Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (UpdateScreenFade(unk150)) {
        CreateMultiplayerRecordsScreen(playerDataMenu);
        playerDataMenu->state = PLAYER_DATA_MENU_STATE_SCREEN_OPEN;
        playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;
        gCurTask->main = Task_PlayerDataMenuWaitForMultiplayerRecordsScreenExit;
    }
}

static void Task_PlayerDataMenuFadeInFromMultiplayerRecordsScreen(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);
    ScreenFade *unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (UpdateScreenFade(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnimWait;
    }
}

static void OptionsScreenHandleExit(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &optionsScreen->unk774;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_OptionsScreenFadeOutAndExit;
}

static void Task_OptionsScreenFadeOutAndExit(void)
{
    struct OptionsScreen *optionsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk270 = &optionsScreen->unk774;
    if (!UpdateScreenFade(unk270)) {
        OptionsScreenRenderUI();
        return;
    }

    StoreProfileData(optionsScreen);
    WriteSaveGame();
    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gUnknown_03005390 = 0;
    PAUSE_GRAPHICS_QUEUE();
    CreateTitleScreenAtSinglePlayerMenu();
}

static void PlayerDataMenuRenderUI(void)
{
    struct PlayerDataMenu *playerDataMenu = TASK_DATA(gCurTask);

    Sprite *headerFooter = playerDataMenu->headerFooter;
    Sprite *menuItem = playerDataMenu->menuItems;
    Sprite *menuItemOutline = &playerDataMenu->menuItemOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        DisplaySprite(headerFooter);
    }

    for (i = 0; i < NUM_PLAYER_DATA_MENU_ITEMS; i++, menuItem++) {
        DisplaySprite(menuItem);
    }

    DisplaySprite(menuItemOutline);
}

static void CreateDifficultyMenu(struct OptionsScreen *optionsScreen)
{
    struct Task *t = TaskCreate(Task_DifficultyMenuOpenAnimWait, sizeof(struct SwitchMenu), 0x2000, 4, NULL);
    struct SwitchMenu *difficultyMenu = TASK_DATA(t);

    difficultyMenu->optionsScreen = optionsScreen;
    difficultyMenu->switchValue = optionsScreen->difficultyLevel;
    difficultyMenu->language = optionsScreen->language;
    difficultyMenu->animFrame = 0;

    DifficultyMenuCreateUI(difficultyMenu);
}

static void DifficultyMenuRenderUI(void)
{
    struct SwitchMenu *difficultyMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = difficultyMenu->headerFooter;
    Sprite *difficultyOption = difficultyMenu->options;
    Sprite *switchValueOutline = &difficultyMenu->switchValueOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        DisplaySprite(headerFooter);
    }

    for (i = 0; i < 2; i++, difficultyOption++) {
        DisplaySprite(difficultyOption);
    }

    DisplaySprite(switchValueOutline);
}

static void CreateTimeLimitMenu(struct OptionsScreen *optionsScreen)
{
    struct Task *t = TaskCreate(Task_TimeLimitMenuOpenAnimWait, sizeof(struct SwitchMenu), 0x2000, 4, 0);
    struct SwitchMenu *timeLimitMenu = TASK_DATA(t);

    timeLimitMenu->optionsScreen = optionsScreen;
    timeLimitMenu->switchValue = optionsScreen->timeLimitDisabled;
    timeLimitMenu->language = optionsScreen->language;
    timeLimitMenu->animFrame = 0;
    TimeLimitMenuCreateUI(timeLimitMenu);
}

static void TimeLimitMenuRenderUI(void)
{
    struct SwitchMenu *timeLimitMenu = TASK_DATA(gCurTask);
    Sprite *headerFooter = timeLimitMenu->headerFooter;
    Sprite *option = timeLimitMenu->options;
    Sprite *switchValueOutline = &timeLimitMenu->switchValueOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        DisplaySprite(headerFooter);
    }

    for (i = 0; i < 2; i++, option++) {
        DisplaySprite(option);
    }

    DisplaySprite(switchValueOutline);
}

static void Task_ButtonConfigMenuHandleStartOver(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);

    Sprite *scrollArrow = buttonConfigMenu->scrollArrows;
    Sprite *controlFocus = &buttonConfigMenu->controlFocus;

    controlFocus->y = 42;

    scrollArrow->y = 53;
    scrollArrow++;
    scrollArrow->y = 53;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuAButtonMain;
}

static void Task_ButtonConfigMenuHandleAButtonComplete(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);

    Sprite *unk1B4 = buttonConfigMenu->scrollArrows;
    Sprite *unk214 = &buttonConfigMenu->controlFocus;

    unk214->y = 66;
    unk1B4->y = 77;
    unk1B4++;
    unk1B4->y = 77;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuBButtonMain;
}

static void Task_ButtonConfigMenuHandleBButtonComplete(void)
{
    struct ButtonConfigMenu *buttonConfigMenu = TASK_DATA(gCurTask);

    Sprite *unk1B4 = buttonConfigMenu->scrollArrows;
    Sprite *unk214 = &buttonConfigMenu->controlFocus;

    unk214->y = 90;

    unk1B4->y = 180;
    unk1B4++;
    unk1B4->y = 180;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuRShoulderMain;
}

static void CreateEditLanguageScreen(struct OptionsScreen *optionScreen)
{
    struct Task *t = TaskCreate(Task_LanguageScreenFadeIn, sizeof(struct LanguageScreen), 0x2000, 4, NULL);
    struct LanguageScreen *languageScreen = TASK_DATA(t);

    languageScreen->optionsScreen = optionScreen;
    languageScreen->menuCursor = optionScreen->language;
    languageScreen->creatingNewProfile = FALSE;

    ResetProfileScreensVram();

    LanguageScreenInitRegisters(languageScreen);
    LanguageScreenCreateBackgroundsUI(languageScreen);
    LanguageScreenCreateUI(languageScreen);
}

static void LanguageScreenCreateBackgroundsUI(struct LanguageScreen *languageScreen)
{
    OptionsInitBackground(&languageScreen->unk1B0, 0, 7, TM_OPTIONS_LANGUAGE_SELECT, 0x1E, 0x14, 0, 0, 0, 0);
}

static void Task_LanguageScreenFadeIn(void)
{
    struct LanguageScreen *languageScreen = TASK_DATA(gCurTask);
    ScreenFade *unk1F0 = &languageScreen->unk1F0;

    LanguageScreenRenderUI();
    ReseedRng();

    if (UpdateScreenFade(unk1F0)) {
        gCurTask->main = Task_LanguageScreenMain;
    }
}

static void LanguageScreenHandleExit(void)
{
    struct LanguageScreen *languageScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &languageScreen->unk1F0;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    UpdateScreenFade(fade);
    gCurTask->main = Task_LanguageScreenFadeOutAndExit;
}

static void Task_LanguageScreenFadeOutAndExit(void)
{
    struct LanguageScreen *languageScreen = TASK_DATA(gCurTask);
    ScreenFade *unk1F0 = &languageScreen->unk1F0;
    ReseedRng();

    if (!UpdateScreenFade(unk1F0)) {
        LanguageScreenRenderUI();
        return;
    }

    // Must be explicit to match
    if (languageScreen->creatingNewProfile == TRUE) {
        CreateNewProfileNameScreen(NEW_PROFILE_NAME_START_GAME);
    } else {
        languageScreen->optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
    }

    TaskDestroy(gCurTask);
}

static void ReseedRng(void) { ShuffleRngSeed(); }

static void LanguageScreenRenderUI(void)
{
    struct LanguageScreen *languageScreen = TASK_DATA(gCurTask);

    Sprite *headerFooter = languageScreen->headerFooter;
    Sprite *languageOption = languageScreen->languageOptions;
    Sprite *optionOutline = &languageScreen->optionOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        DisplaySprite(headerFooter);
    }

    for (i = 0; i < NUM_LANGUAGES; i++, languageOption++) {
        DisplaySprite(languageOption);
    }

    DisplaySprite(optionOutline);
}

static void DeleteScreenCreateBackgroundsUI(struct DeleteScreen *deleteScreen)
{
    OptionsInitBackground(&deleteScreen->background, 0, 7, TM_OPTIONS_LANGUAGE_SELECT, 0x1e, 0x14, 0, 0, 0, 0);
}

static void Task_DeleteScreenFadeIn(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);
    ScreenFade *unk130 = &deleteScreen->unk130;
    DeleteScreenRenderUI();
    if (UpdateScreenFade(unk130)) {
        gCurTask->main = Task_DeleteScreenConfrimationMain;
    }
}

static void Task_DeleteScreenHandleExit(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &deleteScreen->unk130;

    DeleteScreenRenderUI();

    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    UpdateScreenFade(fade);
    gCurTask->main = Task_DeleteScreenFadeOutAndExit;
}

static void DeleteScreenRenderUI(void)
{
    struct DeleteScreen *deleteScreen = TASK_DATA(gCurTask);

    Sprite *headerFooter = deleteScreen->headerFooter;
    Sprite *unk60 = deleteScreen->options;
    Sprite *unkC0 = &deleteScreen->optionOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        DisplaySprite(headerFooter);
    }

    for (i = 0; i < 2; i++, unk60++) {
        DisplaySprite(unk60);
    }

    DisplaySprite(unkC0);
}

static void Task_ProfileNameScreenFadeIn(void)
{
    struct ProfileNameScreen *profileNameScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &profileNameScreen->fade;

    ProfileNameScreenRenderUI();

    if (UpdateScreenFade(fade)) {
        profileNameScreen->matrixCursorIndex = 0;
        gCurTask->main = Task_ProfileNameScreenMain;
    }
}

UNUSED static void TimeRecordsScreenShowChoiceView(struct TimeRecordsScreen *timeRecordsScreen)
{
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    ResetProfileScreensVram();

    TimeRecordScreenInitRegisters();
    TimeRecordsScreenCreateChoiceViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateChoiceViewUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenChoiceViewFadeIn;
}

static void Task_TimeRecordsScreenChoiceViewFadeIn(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;

    TimeRecordsScreenRenderModeChoiceUI();

    if (UpdateScreenFade(fade)) {
        gCurTask->main = Task_TimeRecordsScreenModeChoiceMain;
    }
}

static void TimeRecordsScreenHandleExit(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;

    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_TimeRecordsScreenFadeOutAndExit;
}

static void Task_TimeRecordsScreenFadeOutAndExit(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;
    struct PlayerDataMenu *playerDataMenu = timeRecordsScreen->playerDataMenu;

    if (!UpdateScreenFade(fade)) {
        TimeRecordsScreenRenderModeChoiceUI();
        return;
    }

    playerDataMenu->state = PLAYER_DATA_MENU_STATE_ACTIVE;
    TaskDestroy(gCurTask);
}

static void TimeRecordsScreenShowCoursesView(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;

    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = TimeRecordsScreenFadeOutToCoursesView;
}

static void TimeRecordsScreenFadeOutToCoursesView(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;

    if (!UpdateScreenFade(fade)) {
        TimeRecordsScreenRenderModeChoiceUI();
        return;
    }

    TimeRecordsScreenCreateCoursesView(timeRecordsScreen);
}

static void TimeRecordsScreenRenderModeChoiceUI(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);

    Sprite *title = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    Sprite *scrollArrows = timeRecordsScreen->choiceViewScrollArrows;
    Sprite *choiceItem = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    s16 i;

    DisplaySprite(title);

    for (i = 0; i < 2; i++, choiceItem++) {
        DisplaySprite(choiceItem);
    }

    for (i = 0; i < 2; i++, scrollArrows++) {
        UpdateSpriteAnimation(scrollArrows);
        DisplaySprite(scrollArrows);
    }
}

static void TimeRecordsScreenCreateCoursesView(struct TimeRecordsScreen *timeRecordsScreen)
{
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    TimeRecordsScreenCreateCoursesViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenCreateTimesUI;
}

static void Task_TimeRecordsScreenCreateTimesUI(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    TimeRecordsScreenCreateTimesUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenCoursesViewFadeIn;
}

static void Task_TimeRecordsScreenCoursesViewFadeIn(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;
    TimeRecordsScreenRenderCoursesViewUI(0);

    if (UpdateScreenFade(fade)) {
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenCoursesViewMain;
    }
}

static void Task_TimeRecordsScreenHandleActChange(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    Sprite *unkDC = &timeRecordsScreen->actTitle[1];

    const struct UNK_080D95E8 *unk5E8 = &sTimeRecordsZoneActTitleDigits[timeRecordsScreen->act];

    unkDC->graphics.anim = unk5E8->unk0;
    unkDC->variant = unk5E8->unk2;

    UpdateSpriteAnimation(unkDC);
    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(0);

    timeRecordsScreen->animFrame = 0;
    gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
}

static void Task_TimeRecordsScreenHandleCourseSelected(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_TimeRecordsScreenFadeOutToSelectedCourse;
}

static void Task_TimeRecordsScreenFadeOutToSelectedCourse(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;

    if (!UpdateScreenFade(fade)) {
        TimeRecordsScreenRenderCoursesViewUI(0);
        return;
    }

    gCurrentLevel = LEVEL_INDEX(timeRecordsScreen->zone, timeRecordsScreen->isBossMode ? ACT_BOSS : timeRecordsScreen->act);

    EwramFree(timeRecordsScreen->timeRecords);
    TaskDestroy(gCurTask);
    GameStageStart();
}

static void TimeRecordsScreenHandleReturn(void)
{
    struct TimeRecordsScreen *timeRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &timeRecordsScreen->fade;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_TimeRecordsScreenFadeToPrevious;
}

static void Task_MultiplayerRecordsScreenCreateNextTableRowUI(void)
{
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);

    MultiplayerRecordsScreenCreateTableRowUI(multiplayerRecordsScreen->scrollAnimFrame);

    if (++multiplayerRecordsScreen->scrollAnimFrame >= 10) {
        multiplayerRecordsScreen->scrollAnimFrame = 0;
        gCurTask->main = Task_MultiplayerRecordsScreenFadeIn;
    }
}

static void Task_MultiplayerRecordsScreenFadeIn(void)
{
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *unk0 = &multiplayerRecordsScreen->fade;
    MultiplayerRecordsScreenRenderUI();

    if (UpdateScreenFade(unk0)) {
        gCurTask->main = Task_MultiplayerRecordsScreenMain;
    }
}

static void Task_MultiplayerRecordsScreenHandleExit(void)
{
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &multiplayerRecordsScreen->fade;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->brightness = 0;
    fade->speed = 0x100;
    fade->bldAlpha = 0;
    fade->bldCnt = (BLDCNT_TGT1_ALL | BLDCNT_EFFECT_DARKEN);

    gCurTask->main = Task_MultiplayerRecordsScreenFadeOutAndExit;
}

static void Task_MultiplayerRecordsScreenFadeOutAndExit(void)
{
    struct MultiplayerRecordsScreen *multiplayerRecordsScreen = TASK_DATA(gCurTask);
    ScreenFade *fade = &multiplayerRecordsScreen->fade;
    struct PlayerDataMenu *playerDataMenu = multiplayerRecordsScreen->playerDataMenu;

    if (!UpdateScreenFade(fade)) {
        MultiplayerRecordsScreenRenderUI();
        return;
    }

    EwramFree(multiplayerRecordsScreen->table);
    playerDataMenu->state = PLAYER_DATA_MENU_STATE_ACTIVE;
    TaskDestroy(gCurTask);
}

void OptionsInitBackground(Background *background, u32 a, u32 b, u8 tilemapId, u16 d, u16 e, u16 f, u8 bg_id, u16 scrollX, u16 scrollY)
{
    background->graphics.dest = (void *)BG_CHAR_ADDR(a);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(b);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = tilemapId;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = d;
    background->targetTilesY = e;
    background->paletteOffset = f;
    background->animFrameCounter = 0;
    background->animDelayCounter = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(bg_id);
    background->scrollX = scrollX;
    background->scrollY = scrollY;
    DrawBackground(background);
}

// Finds the max unk4 of the item text array
static s32 MaxSpriteSize(const struct UNK_080D95E8 *itemText, s8 length)
{
    s32 result = 0;
    s16 i;

    for (i = 0; i < length; i++, itemText++) {
        if (itemText->unk4 > result) {
            result = itemText->unk4;
        }
    }

    return result;
}

static struct UNK_806B908 sub_806B908(u16 nameChar)
{
    struct UNK_806B908 charTile;

    if (nameChar >= 0x10C) {
        charTile.unk4 = 0x3BB;
        charTile.unk6 = 0x11;
    } else {
        if ((nameChar & 0x100)) {
            charTile.unk4 = 0x3C3;
        } else {
            charTile.unk4 = 0x3BB;
        }

        charTile.unk6 = nameChar & 0xFF;
    }

    charTile.unk0 = 4;

    return charTile;
}

static bool16 sub_806B988(u16 *playerName)
{
    s16 i;

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        if (playerName[i] == PLAYER_NAME_END_CHAR) {
            return FALSE;
        }

        if (sub_806B9C8(playerName[i])) {
            return TRUE;
        }
    }

    return FALSE;
}

static bool16 sub_806B9C8(u16 nameChar)
{
    u16 localD95A4[16], *cursor;
    memcpy(localD95A4, gUnknown_080D95A4, sizeof(gUnknown_080D95A4));

    for (cursor = localD95A4; *cursor != PLAYER_NAME_END_CHAR; cursor++) {
        if (nameChar == *cursor) {
            return FALSE;
        }
    }

    if (nameChar >= 0x10C) {
        return FALSE;
    } else {
        return TRUE;
    }
}

static bool16 sub_806BA14(s16 a, u16 b)
{
    u16 unk5C4[2], unk5C8[5], *cursor;

    memcpy(unk5C4, gUnknown_080D95C4, sizeof(gUnknown_080D95C4));
    memcpy(unk5C8, gUnknown_080D95C8, sizeof(gUnknown_080D95C8));

    if (a == 1) {
        cursor = unk5C8;
    } else {
        cursor = unk5C4;
    }

    if (a == 1 && b == 2) {
        return TRUE;
    }

    for (; *cursor != PLAYER_NAME_END_CHAR; cursor++) {
        if (b >= *cursor && b <= *cursor + 4) {
            return TRUE;
        }
    }

    return FALSE;
}
