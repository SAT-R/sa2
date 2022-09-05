#include "global.h"
#include "main.h"
#include "profile.h"
#include "m4a.h"
#include "task.h"
#include "save.h"
#include "malloc_ewram.h"
#include "random.h"
#include "sprite.h"
#include "transition.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "title_screen.h"
#include "game.h"
#include "sound_test.h"
#include "time.h"
#include "multiplayer_mode_select.h"
#include "character_select.h"

#define NUM_PLAYER_DATA_MENU_ITEMS 4

struct TimeRecordDisplay {
    struct UNK_0808B3FC_UNK240 deliminators[2];
    struct UNK_0808B3FC_UNK240 minute;
    struct UNK_0808B3FC_UNK240 seconds[2];
    struct UNK_0808B3FC_UNK240 millis[2];
};

struct TimeRecordsScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct Unk_03002400 coursesViewBackground;
    struct UNK_0808B3FC_UNK240 choiceViewItemsOrZoneTitle[2];
    struct UNK_0808B3FC_UNK240 actTitle[2];
    struct UNK_0808B3FC_UNK240 choiceViewTitleOrZoneSubtitle;
    struct UNK_0808B3FC_UNK240 choiceViewScrollArrows[4];

    struct PlayerDataMenu* playerDataMenu;

    struct TimeRecords* timeRecords;

    struct Unk_03002400 coursesViewCharacterBackground;
    struct Unk_03002400 coursesViewCharacter;
    struct UNK_0808B3FC_UNK240 timeRecordDisplays[3];
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
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 languageOptions[NUM_LANGUAGES];
    struct UNK_0808B3FC_UNK240 optionOutline;
    struct Unk_03002400 unk1B0;
    struct UNK_802D4CC_UNK270 unk1F0;

    struct OptionsScreen* optionsScreen;

    s8 menuCursor;

    bool8 creatingNewProfile;
}; /* size 0x204 */

struct NameInputDisplay {
    struct UNK_0808B3FC_UNK240 displayCursor;
    struct UNK_0808B3FC_UNK240 characterDisplay[MAX_PLAYER_NAME_LENGTH];

    u16 unk150;
    u16 cursor;

    u16 buffer[MAX_PLAYER_NAME_LENGTH];
};

struct ProfileNameScreen {
    struct UNK_0808B3FC_UNK240 title;
    struct UNK_0808B3FC_UNK240 controls[3];
    struct Unk_03002400 background;
    struct Unk_03002400 charMatrixBackground;
    
    struct UNK_802D4CC_UNK270 unk140;
    struct PlayerDataMenu* playerDataMenu;

    struct UNK_0808B3FC_UNK240 focusedCell[2];
    struct UNK_0808B3FC_UNK240 scrollArrows[2];
    struct Unk_03002400 charMatrix;
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
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 menuItems[NUM_PLAYER_DATA_MENU_ITEMS];
    struct UNK_0808B3FC_UNK240 menuItemOutline;

    struct UNK_802D4CC_UNK270 unk150;
    
    struct OptionsScreen* optionsScreen;
    s8 menuCursor;
    s8 animFrame;

    s8 language;
    
    s8 state;
}; /* size 0x164 */

struct SwitchMenu {
    struct OptionsScreen* optionsScreen;
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 options[2];
    struct UNK_0808B3FC_UNK240 switchValueOutline;
    s8 switchValue;
    s8 animFrame;
    s8 language;
}; /* size 0xF8 */

struct ButtonConfigMenu {
    struct OptionsScreen* optionsScreen;
    struct UNK_0808B3FC_UNK240 staticElements[6];
    struct UNK_0808B3FC_UNK240 buttonActions[3];
    struct UNK_0808B3FC_UNK240 scrollArrows[2];
    struct UNK_0808B3FC_UNK240 controlFocus;
    u8 aButtonAction;
    u8 bButtonAction;
    u8 rShoulderAction;
    u8 focus;
    s8 animFrame;
    s8 language;
}; /* size 0x24C */

struct DeleteScreen {
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 options[2];
    struct UNK_0808B3FC_UNK240 optionOutline;
    struct Unk_03002400 background;
    struct UNK_802D4CC_UNK270 unk130;
    struct OptionsScreen* optionsScreen; 
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
    struct UNK_0808B3FC_UNK240 nameDisplay[6];
    struct UNK_0808B3FC_UNK240 winsDigits[2];
    struct UNK_0808B3FC_UNK240 losesDigits[2];
    struct UNK_0808B3FC_UNK240 defeatsDigits[2];
}; /* size 0x250 */

struct MultiplayerRecordsTable {
   struct MultiplayerRecordRow rows[NUM_MULTIPLAYER_SCORES];
}; /* size 0x1720 */

struct MultiplayerRecordsScreen {
    struct UNK_802D4CC_UNK270 unk0;

    struct Unk_03002400 backgroundTrims;
    struct Unk_03002400 background;

    struct UNK_0808B3FC_UNK240 title;
    struct UNK_0808B3FC_UNK240 columnHeaders;
    struct UNK_0808B3FC_UNK240 scrollArrows[2];
    struct UNK_0808B3FC_UNK240 playerNameDisplay[6];
    struct UNK_0808B3FC_UNK240 playerWinsDigits[2];
    struct UNK_0808B3FC_UNK240 playerLosesDigits[2];
    struct UNK_0808B3FC_UNK240 playerDrawsDigits[2];

    struct PlayerDataMenu* playerDataMenu;

    struct MultiplayerRecordsTable* table;
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
void* gProfileScreenNextVramAddress = NULL;
void* gProfileScreenSubMenuNextVramAddress = NULL;

static void Task_OptionsScreenShow(void);
static void OptionsScreenTaskDestroyHandler(struct Task*);

static void ReadProfileData(struct OptionsScreen*);

static void Task_TimeRecordsScreenCreateTimesUI(void);
static void TimeRecordsScreenInitRegisters(void);
static void TimeRecordsScreenCreateCoursesViewBackgroundsUI(struct TimeRecordsScreen*);
static void TimeRecordsScreenCreateCoursesViewUI(struct TimeRecordsScreen*);

static void Task_LanguageScreenFadeIn(void);
static void LanguageScreenInitRegisters(struct LanguageScreen*);
static void LanguageScreenCreateBackgroundsUI(struct LanguageScreen*);
static void LanguageScreenCreateUI(struct LanguageScreen*);

static void Task_ProfileNameScreenFadeIn(void);
static void ProfileNameScreenInitRegisters(s16);
static void ProfileNameScreenCreateUIBackgrounds(struct ProfileNameScreen*);
static void ProfileNameScreenCreateUIText(struct ProfileNameScreen*);
static void ProfileNameScreenCreateUIContextElements(struct ProfileNameScreen*);
static void ProfileNameScreenCreateInputDisplayUI(struct ProfileNameScreen*);

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
static void PlayerDataMenuCreateUI(struct PlayerDataMenu*);

static void PlayerDataMenuRenderUI(void);
static void Task_PlayerDataMenuMain(void);

static void PlayerDataMenuShowTimeRecordsScreen(void);
static void PlayerDataMenuShowProfileNameScreen(void);
static void PlayerDataMenuShowMultiplayerRecordsScreen(void);
static void Task_PlayerDataMenuCloseAnim(void);

static void Task_PlayerDataMenuFadeInFromProfileNameScreen(void);
static void CreateTimeRecordsScreen(struct PlayerDataMenu*);
static void CreateTimeRecordsScreenAtCoursesView(struct PlayerDataMenu*);
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
static void ButtonConfigMenuCreateUI(struct ButtonConfigMenu*);
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
static void DeleteScreenInitRegisters(struct DeleteScreen*);
static void DeleteScreenCreateBackgroundsUI(struct DeleteScreen*);
static void DeleteScreenCreateUI(struct DeleteScreen*);
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
static void TimeRecordsScreenCreateChoiceViewBackgroundsUI(struct TimeRecordsScreen*);
static void TimeRecordsScreenCreateChoiceViewUI(struct TimeRecordsScreen*);

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
static void MultiplayerRecordsScreenCreateBackgroundsUI(struct MultiplayerRecordsScreen*);
static void MultiplayerRecordsScreenCreatePlayerRowUI(struct MultiplayerRecordsScreen*);

static void Task_MultiplayerRecordsScreenScrollAnim(void);
static void MultiplayerRecordsScreenRenderUI(void);
static void Task_MultiplayerRecordsScreenHandleExit(void);

static void Task_OptionScreenFadeIn(void);
static void SetupOptionScreenBackgroundsUI(struct OptionsScreen*);

static void CreateDifficultyMenu(struct OptionsScreen*);
static void CreateTimeLimitMenu(struct OptionsScreen*);

static void Task_OptionsScreenFadeOutToLanguageScreen(void);
static void CreateEditLanguageScreen(struct OptionsScreen*);
static void Task_OptionScreenFadeOutToSoundTest(void);
static void Task_OptionsScreenFadeOutToDeleteScreen(void);
static void Task_PlayerDataMenuFadeOutToProfileNameScreen(void);
static void Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen(void);
static void Task_OptionsScreenFadeOutAndExit(void);

static void Task_LanguageScreenFadeOutAndExit(void);
static void Task_TimeRecordsScreenFadeOutAndExit(void);
static void TimeRecordsScreenFadeOutToCoursesView(void);
static void TimeRecordsScreenCreateCoursesView(struct TimeRecordsScreen*);
static void Task_TimeRecordsScreenCoursesViewFadeIn(void);
static void Task_TimeRecordsScreenFadeOutToSelectedCourse(void);
static void Task_MultiplayerRecordsScreenFadeIn(void);
static void Task_MultiplayerRecordsScreenFadeOutAndExit(void);

static s32 MaxSpriteSize(const struct UNK_080D95E8*, s8);
static struct UNK_806B908 sub_806B908(u16);
static bool16 sub_806B9C8(u16);
static bool16 sub_806BA14(s16, u16);
static bool16 sub_806B988(u16*);

#define OPTIONS_MENU_ITEM_PLAYER_DATA 0
#define OPTIONS_MENU_ITEM_DIFFICULTY 1
#define OPTIONS_MENU_ITEM_TIME_LIMIT 2
#define OPTIONS_MENU_ITEM_LANGUAGE 3
#define OPTIONS_MENU_ITEM_BUTTON_CONFIG 4
#define OPTIONS_MENU_ITEM_SOUND_TEST 5
#define OPTIONS_MENU_ITEM_DELETE_GAME_DATA 6
#define OPTIONS_MENU_ITEM_EXIT 7

#define OPTIONS_META_ITEM_PLAYER_NAME 0
#define OPTIONS_META_ITEM_DIFFICULTY_LEVEL 1
#define OPTIONS_META_ITEM_TIME_LIMIT 2
#define OPTIONS_META_ITEM_LANGUAGE 3

#define OPTIONS_SCREEN_NEXT_CURSOR_MOVE_ANIMS 0
#define OPTIONS_SCREEN_PREV_CURSOR_MOVE_ANIMS 1

#define PLAYER_DATA_MENU_ITEM_CHANGE_NAME 0
#define PLAYER_DATA_MENU_ITEM_TIME_RECORDS 1
#define PLAYER_DATA_MENU_ITEM_VS_RECORDS 2
#define PLAYER_DATA_MENU_ITEM_EXIT 3

#define PLAYER_DATA_MENU_STATE_ACTIVE 0
#define PLAYER_DATA_MENU_STATE_SCREEN_OPEN 1

#define NAME_CHAR_MATRIX_NUM_COLS 11
#define NAME_CHAR_MATRIX_NUM_ROWS 22
#define NAME_CHAR_MATRIX_ROWS_PER_PAGE 7
#define NAME_CHAR_MATRIX_LAST_PAGE_START_INDEX NAME_CHAR_MATRIX_NUM_COLS * (NAME_CHAR_MATRIX_NUM_ROWS - NAME_CHAR_MATRIX_ROWS_PER_PAGE)
#define NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT 16
#define NAME_CHAR_MATRIX_BACKGROUND_COLUMN_WIDTH 16

#define PROFILE_NAME_SCREEN_CONTROLS_COLUMN 11
#define PROFILE_NAME_SCREEN_CURSOR_BACK_BUTTON 4
#define PROFILE_NAME_SCREEN_CURSOR_FORWARD_BUTTON 5
#define PROFILE_NAME_SCREEN_END_BUTTON 6

#define NAME_INPUT_DISPLAY_CHAR_WIDTH 12

#define NAME_SCREEN_COMPLETE_ACTION_BACK_TO_OPTIONS 0
#define NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER 1
#define NAME_SCREEN_COMPLETE_ACTION_START_GAME 2

#define TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE 0
#define TIME_RECORDS_SCREEN_VIEW_COURSES 1
#define TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK 2

#define TIME_RECORDS_CHOICE_BOSS 1
#define TIME_RECORDS_CHOICE_ACTS 0

#define ASSET_CHARACTER_BACKGROUND 0
#define ASSET_CHARACTER 1

#define DIFFICULTY_OPTION_NORMAL 0
#define DIFFICULTY_OPTION_EASY 1

#define TIME_LIMIT_OPTION_ON 0
#define TIME_LIMIT_OPTION_OFF 1

#define DELETE_SCREEN_CONFIRMATION_YES 0
#define DELETE_SCREEN_CONFIRMATION_NO 1

#define MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS 4
#define MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX (NUM_MULTIPLAYER_SCORES - MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS)

#define BUTTON_CONFIG_MENU_A_BUTTON 0
#define BUTTON_CONFIG_MENU_B_BUTTON 1
#define BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON 2

#define BUTTON_CONFIG_MENU_ACTION_JUMP 0
#define BUTTON_CONFIG_MENU_ACTION_ATTACK 1
#define BUTTON_CONFIG_MENU_ACTION_TRICK 2

#define SetupOptionScreenBackgrounds(background, subMenuBackground) ({ \
    sub_806B854(&(background), 0, 7, 0x85, 0x1E, 0x14, 0, 0, 0, 0); \
    sub_806B854(&(subMenuBackground), 1, 0xE, 0x86, 0x1E, 0x14, 0, 1, 0, 0); \
})

#define ReadAvailableCharacters(i, unlockedCharacters) ({ \
    for (i = 1; i < NUM_CHARACTERS; i++) { \
        if (!GetBit((unlockedCharacters), i)) { \
            break; \
        } \
    }; \
})

#define DELIMINATOR_DIGIT 10
#define TensDigit(number) ((number) / 10)
#define UnitsDigit(number) ((number) % 10)

static const s8 sMenuCursorMoveAnims[2][8] = {
    [OPTIONS_SCREEN_NEXT_CURSOR_MOVE_ANIMS] = { 8, 4, 1, -1, -2, -1, 1, 0 },
    [OPTIONS_SCREEN_PREV_CURSOR_MOVE_ANIMS] = { 1, 2, 5, 7, 8, 8, 8, 8 },
};

static const s16 sSubMenuOpenAnim[16] = {
    -16, -41, -66, -91, -116, -141, -166, -186, 
    -201, -216, -228, -219, -210, -214, -217, -216,
};

static const s16 sSubMenuCloseAnim[16] = {
    -216, -201, -186, -171, -156, -141, -126, -111, 
    -96, -81, -66, -51, -36, -21, -6, 0,
};

static const u16 sTimeRecordsCharacterAssets[NUM_CHARACTERS][2] = {
    [CHARACTER_SONIC] = { 
        [ASSET_CHARACTER_BACKGROUND] = 140, 
        [ASSET_CHARACTER] = 141 
    },
    [CHARACTER_CREAM] = { 
        [ASSET_CHARACTER_BACKGROUND] = 148, 
        [ASSET_CHARACTER] = 149 
    },
    [CHARACTER_TAILS] = { 
        [ASSET_CHARACTER_BACKGROUND] = 142, 
        [ASSET_CHARACTER] = 143 
    },
    [CHARACTER_KNUCKLES] = { 
        [ASSET_CHARACTER_BACKGROUND] = 144, 
        [ASSET_CHARACTER] = 145 
    },
    [CHARACTER_AMY] = { 
        [ASSET_CHARACTER_BACKGROUND] = 146, 
        [ASSET_CHARACTER] = 147 
    },
};

const u16 gUnknown_080D95A4[] = {
    17, 19, 39, 41, 61, 63, 75, 76,
    77, 109, 142, 174, 175, 208, 241, 65535, 
};

const u16 gUnknown_080D95C4[] = {
    55, 65535,
};

const u16 gUnknown_080D95C8[] = {
    11, 22, 33, 55, 65535,
};

const u16 gUnknown_080D95D2[] = {
    55, 262,
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
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
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
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
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
        { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
        { .unk0 = 981, .unk2 = 4, .unk4 = 17 },
    },
    [LanguageIndex(LANG_FRENCH)] = { 
        { .unk0 = 982, .unk2 = 3, .unk4 = 44 },
        { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
        { .unk0 = 982, .unk2 = 4, .unk4 = 17 },
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
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_FRENCH)] = { .unk0 = 1012, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_SPANISH)] = { .unk0 = 1013, .unk2 = 0, .unk4 = 26 },
    [LanguageIndex(LANG_ITALIAN)] = { .unk0 = 1014, .unk2 = 0, .unk4 = 28 },
};
const struct UNK_080D95E8 sLanguageScreenNewControlsText[NUM_LANGUAGES] = {
    [LanguageIndex(LANG_JAPANESE)] = { .unk0 = 953, .unk2 = 13, .unk4 = 26 },
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
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
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
    [LanguageIndex(LANG_GERMAN)] = { .unk0 = 1011, .unk2 = 0, .unk4 = 26 },
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
    { .unk0 = 1119, .unk2 = 16, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 17, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 18, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 19, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 20, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 21, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 22, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 23, .unk4 = 2 },
    { .unk0 = 1119, .unk2 = 24, .unk4 = 2 },
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
    { .unk0 = 1048, .unk2 = 2, .unk4 = 4 },
    { .unk0 = 1048, .unk2 = 3, .unk4 = 6 },
    { .unk0 = 1048, .unk2 = 4, .unk4 = 6 },
    { .unk0 = 1048, .unk2 = 5, .unk4 = 6 },
    { .unk0 = 1048, .unk2 = 6, .unk4 = 6 },
    { .unk0 = 1048, .unk2 = 7, .unk4 = 6 },
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

void CreateOptionsScreen(u16 p1) {
    struct Task* t;
    struct OptionsScreen* optionsScreen;
    s16 i;

    m4aSongNumStart(MUS_OPTIONS);

    t = TaskCreate(Task_OptionsScreenShow, sizeof(struct OptionsScreen), 0x1000, TASK_x0004, OptionsScreenTaskDestroyHandler);
    optionsScreen = TaskGetStructPtr(t);

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
void CreateTimeAttackSelectionScreen(bool16 isBossView, s16 selectedCharacter, s8 unused_currentLevel) {
    struct Task* t = TaskCreate(Task_TimeRecordsScreenCreateTimesUI, sizeof(struct TimeRecordsScreen), 0x2000, TASK_x0004, NULL);
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(t);
    s16 i;

    ReadAvailableCharacters(i, gLoadedSaveGame->unk13);

    timeRecordsScreen->playerDataMenu = 0;
    timeRecordsScreen->timeRecords = EwramMalloc(sizeof(struct TimeRecords));
    timeRecordsScreen->character = selectedCharacter;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unusedUnk708 = FALSE;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->unlockedCourses[i] = gLoadedSaveGame->unk7[i];
    }

    timeRecordsScreen->language = LanguageIndex(gLoadedSaveGame->unk6);
    timeRecordsScreen->isBossMode = isBossView;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK;

    if (timeRecordsScreen->language > NUM_LANGUAGES - 1) {
        timeRecordsScreen->language = LanguageIndex(LANG_ENGLISH);
    }

    memcpy(timeRecordsScreen->timeRecords, &gLoadedSaveGame->unk34, sizeof(struct TimeRecords));

    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    TimeRecordsScreenCreateCoursesViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);
    m4aSongNumStart(MUS_TA_COURSE_SELECTION);
}

void CreateNewProfileScreen(void) {
    struct Task* t;
    struct LanguageScreen* languageScreen;

    ShuffleRngSeed();

    t = TaskCreate(Task_LanguageScreenFadeIn, sizeof(struct LanguageScreen), 0x2000, TASK_x0004, NULL);
    languageScreen = TaskGetStructPtr(t);

    languageScreen->optionsScreen = NULL;
    languageScreen->menuCursor = LanguageIndex(gLoadedSaveGame->unk6);
    languageScreen->creatingNewProfile = TRUE;

    if ((u8)languageScreen->menuCursor >= NUM_LANGUAGES) {
        languageScreen->menuCursor = LanguageIndex(LANG_ENGLISH);
    }

    ResetProfileScreensVram();

    LanguageScreenInitRegisters(languageScreen);
    LanguageScreenCreateBackgroundsUI(languageScreen);
    LanguageScreenCreateUI(languageScreen);
}

void CreateNewProfileNameScreen(s16 mode) {
    struct Task* t = TaskCreate(Task_ProfileNameScreenFadeIn, sizeof(struct ProfileNameScreen), 0x2000, TASK_x0004, NULL);
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(t);
    s16 i;

    profileNameScreen->playerDataMenu = NULL;
    profileNameScreen->language = LanguageIndex(gLoadedSaveGame->unk6);
    
    profileNameScreen->onCompleteAction = mode == NEW_PROFILE_NAME_START_GAME ? 
        NAME_SCREEN_COMPLETE_ACTION_START_GAME : 
        NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER;
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
        profileNameScreen->language = LanguageIndex(LANG_ENGLISH);
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

static void ReadProfileData(struct OptionsScreen* optionsScreen) {
    struct SaveGame* saveGame = gLoadedSaveGame;
    struct OptionsScreenProfileData* profile = &optionsScreen->profileData;

    s16 i;

    memcpy(profile->playerName, saveGame->unk20, sizeof(saveGame->unk20));
    memcpy(&profile->timeRecords, &saveGame->unk34, sizeof(saveGame->unk34));
    memcpy(profile->multiplayerScores, saveGame->unk2AC, sizeof(saveGame->unk2AC));

    profile->multiplayerWins = saveGame->unk1C;
    profile->multiplayerLoses = saveGame->unk1D;
    profile->multiplayerDraws = saveGame->unk1E;

    memcpy(&profile->buttonConfig, &saveGame->unk2C, 8);

    optionsScreen->difficultyLevel = saveGame->unk4;
    optionsScreen->timeLimitEnabled = saveGame->unk5;
    optionsScreen->language = LanguageIndex(saveGame->unk6);
    optionsScreen->soundTestUnlocked = saveGame->unk11;
    optionsScreen->bossTimeAttackUnlocked = saveGame->unk12;
    optionsScreen->unk35E = saveGame->unk13;

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

    if (optionsScreen->timeLimitEnabled > 1) {
        optionsScreen->timeLimitEnabled = FALSE;
    }

    if (optionsScreen->language > NUM_LANGUAGES - 1) {
        optionsScreen->language = LanguageIndex(LANG_ENGLISH);
    }

    if (optionsScreen->soundTestUnlocked > 1) {
        optionsScreen->soundTestUnlocked = FALSE;
    }

    if (optionsScreen->bossTimeAttackUnlocked > 1) {
        optionsScreen->bossTimeAttackUnlocked = FALSE;
    }
}

static void StoreProfileData(struct OptionsScreen* optionsScreen) {
    struct SaveGame* saveGame = gLoadedSaveGame;
    struct OptionsScreenProfileData* profile = &optionsScreen->profileData;

    memcpy(saveGame->unk20, profile->playerName, sizeof(profile->playerName));
    memcpy(&saveGame->unk34, &profile->timeRecords, sizeof(profile->timeRecords));

    memcpy(&saveGame->unk2AC[0], &profile->multiplayerScores[0], sizeof(profile->multiplayerScores[0]));

    saveGame->unk1C = profile->multiplayerWins;
    saveGame->unk1D = profile->multiplayerLoses;
    saveGame->unk1E = profile->multiplayerDraws;

    memcpy(&saveGame->unk2C, &profile->buttonConfig, 8);

    saveGame->unk4 = optionsScreen->difficultyLevel;
    saveGame->unk5 = optionsScreen->timeLimitEnabled;
    saveGame->unk6 = optionsScreen->language + 1;
    saveGame->unk11 = optionsScreen->soundTestUnlocked;
    saveGame->unk12 = optionsScreen->bossTimeAttackUnlocked;
}

// OptionsScreenInitRegistersAndFadeIn
static void OptionsScreenInitRegisters(struct OptionsScreen* optionsScreen, s16 state) {
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

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
        unk774->unk0 = 0;
        unk774->unk2 = 2;
        unk774->unk4 = 0;
        unk774->unk6 = 0x100;
        unk774->unkA = 0;
        unk774->unk8 = 0xFF;

        sub_802D4CC(unk774);
    }
}

static void OptionsScreenCreateUI(struct OptionsScreen* optionsScreen, s16 state) {
    u8 language = optionsScreen->language;

    struct UNK_0808B3FC_UNK240 *title = &optionsScreen->title;
    struct UNK_0808B3FC_UNK240 *menuItem = optionsScreen->menuItems;
    struct UNK_0808B3FC_UNK240 *metaItem = optionsScreen->metaItems;
    struct UNK_0808B3FC_UNK240 *playerNameDisplayChar = optionsScreen->playerNameDisplay;

    struct UNK_806B908 nameCharTile;
    s16 i, xPos, yPos;

    {
        const struct UNK_080D95E8 *titleText = &sOptionsScreenTitleText[language];
        sub_806A568(
            title, 
            RENDER_TARGET_SCREEN, 
            titleText->unk4,
            titleText->unk0,
            0x3000,
            0, 
            0xF,
            0xF,
            titleText->unk2,
            0
        );
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
            sub_806A568(
                menuItem, 
                RENDER_TARGET_SCREEN, 
                itemText->unk4,
                itemText->unk0,
                0x3000,
                xPos, 
                yPos,
                0xD,
                itemText->unk2,
                0
            );
            yPos += 15;
        }
    }

    {
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_PLAYER_DATA ? 152 : 160;
        if (state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN) {
            xPos = -64;
        }
        sub_806A568(
            metaItem, 
            RENDER_TARGET_SCREEN, 
            0x12,
            0x3BA,
            0x3000,
            xPos, 
            30,
            0xC,
            0,
            0
        );
        ++metaItem;
    }

    {
        const struct UNK_080D95E8 *difficultyLevelText = &sDifficultyLevelSwitchText[language][optionsScreen->difficultyLevel];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_DIFFICULTY ? 152 : 160;
    
        sub_806A568(
            metaItem, 
            RENDER_TARGET_SCREEN, 
            difficultyLevelText->unk4,
            difficultyLevelText->unk0,
            0x3000,
            xPos, 
            45,
            10,
            difficultyLevelText->unk2,
            0
        );
        ++metaItem;
    }

    {
        const struct UNK_080D95E8 *timeLimitSwitchText = &sTimeLimitMenuSwitchText[language][optionsScreen->timeLimitEnabled];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_TIME_LIMIT ? 152 : 160;
    
        sub_806A568(
            metaItem, 
            RENDER_TARGET_SCREEN, 
            timeLimitSwitchText->unk4,
            timeLimitSwitchText->unk0,
            0x3000,
            xPos, 
            0x3C,
            10,
            timeLimitSwitchText->unk2,
            0
        );
        ++metaItem;
    }

    {
        const struct UNK_080D95E8 *languageText = &sOptionsScreenSelectedLanguageText[language];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_LANGUAGE ? 152 : 160;
    
        sub_806A568(
            metaItem, 
            RENDER_TARGET_SCREEN, 
            languageText->unk4,
            languageText->unk0,
            0x3000,
            xPos, 
            0x4B,
            10,
            languageText->unk2,
            0
        );
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
            sub_806A568(
                playerNameDisplayChar, 
                RENDER_TARGET_SCREEN, 
                nameCharTile.unk0,
                nameCharTile.unk4,
                0x3000,
                xPos, 
                yPos,
                10,
                nameCharTile.unk6,
                0
            );
            playerNameDisplayChar->unk25 = optionsScreen->menuCursor == 0 ? 7 : 8;
        }
    }

    metaItem = optionsScreen->metaItems;
    menuItem = optionsScreen->menuItems;
    for (i = 0; i < NUM_OPTIONS_MENU_ITEMS; i++) {        
        if (optionsScreen->menuCursor == i) {
            menuItem->unk25 = 0;
        } else {
            menuItem->unk25 = 1;
        }

        ++menuItem;
        if (i > 3) continue;

        if (optionsScreen->menuCursor == i) {
            metaItem->unk25 = 0;
        } else {
            metaItem->unk25 = 1;
        }
        ++metaItem;
    }

    sub_806A568(NULL,RENDER_TARGET_SCREEN,0, 0x3c4, 0, 0, 0, 0, 0, 0);
    sub_806A568(NULL,RENDER_TARGET_SCREEN,0, 0x3c4, 0, 0, 0, 0, 1 ,0);
    sub_806A568(NULL,RENDER_TARGET_SCREEN,0, 0x3c3, 0, 0, 0, 0, 0xc, 0);
    sub_806A568(NULL,RENDER_TARGET_SCREEN,0, 0x3c3, 0, 0, 0, 0, 0xd, 0);
}

static void Task_OptionsScreenMain(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);

    OptionsScreenRenderUI();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        switch(optionsScreen->menuCursor) {
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

static inline void NextMenuCursorAnimFrame(struct OptionsScreen* optionsScreen, s8 subMenuAnimPos) {
    s16 baseXPos;
    struct UNK_0808B3FC_UNK240* item;

    optionsScreen->subMenuXPos = subMenuAnimPos;
    baseXPos = subMenuAnimPos;

    item = &optionsScreen->menuItems[optionsScreen->menuCursor];
    item->unk16 = baseXPos + 32;
    item->unk25 = 0;

    if (optionsScreen->menuCursor < 4) {
        item = &optionsScreen->metaItems[optionsScreen->menuCursor];
        item->unk16 = baseXPos + 152;
        item->unk25 = 0;

        if (optionsScreen->menuCursor == OPTIONS_MENU_ITEM_PLAYER_DATA) {
            s16 i;
            struct UNK_0808B3FC_UNK240* playerNameDisplayChar = optionsScreen->playerNameDisplay;
            
            for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
                playerNameDisplayChar->unk16 = baseXPos + (i * 10 + 163);
                playerNameDisplayChar->unk25 = 7;                    
            }
        }
    }

    baseXPos = -216 - baseXPos;
    gBgScrollRegs[2][0] = baseXPos;    
}

static inline void PrevMenuCursorAnimFrame(struct OptionsScreen* optionsScreen, s8 baseXPos) {
    struct UNK_0808B3FC_UNK240* item = &optionsScreen->menuItems[optionsScreen->prevCursorPosition];

    item->unk16 = baseXPos + 32;
    item->unk25 = 1;

    if (optionsScreen->prevCursorPosition < 4) {
        item = &optionsScreen->metaItems[optionsScreen->prevCursorPosition];
        item->unk16 = baseXPos + 152;
        item->unk25 = 1;

        if (optionsScreen->prevCursorPosition == OPTIONS_MENU_ITEM_PLAYER_DATA) {
            s16 i;
            struct UNK_0808B3FC_UNK240* playerNameDisplayChar = optionsScreen->playerNameDisplay;
            for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
                playerNameDisplayChar->unk16 = baseXPos + (i * 10 + 163);
                playerNameDisplayChar->unk25 = 8;
            }
        }
    }
} 

static void Task_OptionsScreenMenuCursorMoveAnim(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    s16 animFrame = optionsScreen->subMenuAnimFrame;
    
    NextMenuCursorAnimFrame(optionsScreen, sMenuCursorMoveAnims[OPTIONS_SCREEN_NEXT_CURSOR_MOVE_ANIMS][animFrame]);
    PrevMenuCursorAnimFrame(optionsScreen, sMenuCursorMoveAnims[OPTIONS_SCREEN_PREV_CURSOR_MOVE_ANIMS][animFrame]);

    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame >= 8) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static inline void SubMenuAnimFrame(struct OptionsScreen* optionsScreen, const s16* animFrames) {
    s16 baseXPos = optionsScreen->subMenuXPos = animFrames[optionsScreen->subMenuAnimFrame];
    struct UNK_0808B3FC_UNK240* item = &optionsScreen->menuItems[optionsScreen->menuCursor];

    item->unk16 = baseXPos + 32;
    item->unk25 = 0;

    if (optionsScreen->menuCursor < 4) {
        struct UNK_0808B3FC_UNK240* item = &optionsScreen->metaItems[optionsScreen->menuCursor];
        item->unk16 = baseXPos + 152;
        item->unk25 = 0;

        if (optionsScreen->menuCursor == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* playerNameDisplayChar = optionsScreen->playerNameDisplay;
            
            for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
                playerNameDisplayChar->unk16 = baseXPos + (i * 10 + 163);
                playerNameDisplayChar->unk25 = 7;                    
            }
        }
    }

    baseXPos = -216 - baseXPos;
    gBgScrollRegs[2][0] = baseXPos; 
}

static void Task_OptionsScreenSubMenuOpenAnim(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    
    SubMenuAnimFrame(optionsScreen, sSubMenuOpenAnim);
    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame >= 16) {
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForSubMenuExit;
    }
}

static void Task_OptionsScreenSubMenuCloseAnim(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    
    SubMenuAnimFrame(optionsScreen, sSubMenuCloseAnim);
    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame >= 16) {
        ResetProfileScreensSubMenuVram();
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static void Task_OptionsScreenWaitForLanguageScreenExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    if (optionsScreen->state != OPTIONS_SCREEN_STATE_ACTIVE) {
        return;
    }
    
    ResetProfileScreensVram();

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    
    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    gCurTask->main = Task_OptionsScreenFadeInFromLanguageScreen;
}

static void Task_OptionsScreenWaitForSoundTestExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    if (optionsScreen->state != OPTIONS_SCREEN_STATE_ACTIVE) {
        return;
    }
    
    ResetProfileScreensVram();

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    m4aSongNumStart(MUS_OPTIONS);
    gCurTask->main = Task_OptionsScreenFadeInFromSoundTest;
}

static void Task_OptionsScreenWaitForDeleteScreenExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
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

    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_ACTIVE) {
        m4aSongNumStart(MUS_OPTIONS);
    }

    optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
    gCurTask->main = Task_OptionsScreenFadeInFromDeleteScreen;
}

static void OptionsScreenRenderUI(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *title = &optionsScreen->title;
    struct UNK_0808B3FC_UNK240 *menuItem = optionsScreen->menuItems;
    struct UNK_0808B3FC_UNK240 *metaItem = optionsScreen->metaItems;
    struct UNK_0808B3FC_UNK240 *playerNameDisplayChar = optionsScreen->playerNameDisplay;
    s16 i;

    sub_80051E8(title);

    for (i = 0; i < NUM_OPTIONS_MENU_ITEMS; i++, menuItem++) {
        if (optionsScreen->soundTestUnlocked || i != OPTIONS_MENU_ITEM_SOUND_TEST) {
            sub_80051E8(menuItem);
            if (i < 4) {
                sub_80051E8(metaItem);
                metaItem++;
            }
        }
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
        sub_80051E8(playerNameDisplayChar);
    }
}

static void CreatePlayerDataMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(Task_PlayerDataMenuOpenAnimWait, sizeof(struct PlayerDataMenu), 0x2000, TASK_x0004, NULL);
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(t);

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

static void PlayerDataMenuCreateUI(struct PlayerDataMenu* playerDataMenu) {
    struct UNK_0808B3FC_UNK240* headerFooter = playerDataMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* menuItem = playerDataMenu->menuItems;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &playerDataMenu->menuItemOutline;
    
    const struct UNK_080D95E8 *titleText = &sPlayerDataMenuTitleText[playerDataMenu->language];
    const struct UNK_080D95E8 *footerText = &sPlayerDataMenuControlsText[playerDataMenu->language];
    const struct UNK_080D95E8 *menuItemText = sPlayerDataMenuItemsText[playerDataMenu->language];
    
    s16 baseXPos = playerDataMenu->optionsScreen->subMenuXPos;
    s16 menuCursor = playerDataMenu->menuCursor;

    s16 i, yPos;

    // Title
    sub_806A568(
        &headerFooter[0], 
        RENDER_TARGET_SUB_MENU, 
        titleText->unk4,
        titleText->unk0,
        0x1000,
        baseXPos + 336, 
        32,
        8,
        titleText->unk2,
        0
    );
        
    // Controls
    sub_806A568(
        &headerFooter[1], 
        RENDER_TARGET_SUB_MENU, 
        footerText->unk4,
        footerText->unk0,
        0x1000,
        baseXPos + 336, 
        132,
        8,
        footerText->unk2,
        0
    );

    // Menu items
    for (i = 0, yPos = 46; i < NUM_PLAYER_DATA_MENU_ITEMS; i++, menuItem++, menuItemText++, yPos += 19) {
        sub_806A568(
            menuItem, 
            RENDER_TARGET_SUB_MENU, 
            menuItemText->unk4,
            menuItemText->unk0,
            0x1000,
            baseXPos + 256,
            yPos,
            8,
            menuItemText->unk2,
            0
        );

        // Interesting to note that gcc
        // uses some trickery here to set this
        // and the actual logic is `(u32)(-temp0 | temp0) >> 31;`
        menuItem->unk25 = !!(menuCursor ^ i);
    }

    sub_806A568(
        menuItemOutline,
        RENDER_TARGET_SUB_MENU,
        0x3f,
        0x3bd,
        0x1000,
        baseXPos + 254,
        menuCursor * 19 + 46,
        7,
        5,
        0
    );
}

static void Task_PlayerDataMenuOpenAnimWait(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = playerDataMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* menuItem = playerDataMenu->menuItems;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &playerDataMenu->menuItemOutline;
    
    s16 baseXPos = playerDataMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->unk16 = baseXPos + 336; 
    }

    for (i = 0; i < 4; i++, menuItem++) {
        menuItem->unk16 = baseXPos + 256;
    }
    
    menuItemOutline->unk16 = baseXPos + 254;

    PlayerDataMenuRenderUI();

    if (++playerDataMenu->animFrame >= 16) {
        playerDataMenu->animFrame = 0;
        gCurTask->main = Task_PlayerDataMenuMain;
    }
}

static void Task_PlayerDataMenuMain(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* menuItem = playerDataMenu->menuItems;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &playerDataMenu->menuItemOutline;
    struct OptionsScreen* optionsScreen = playerDataMenu->optionsScreen;
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
            menuItem->unk25 = !!(playerDataMenu->menuCursor ^ i);
        }
        menuItemOutline->unk18 = playerDataMenu->menuCursor * 19 + 46;
    }

    PlayerDataMenuRenderUI();
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        switch(playerDataMenu->menuCursor) {
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

static void Task_PlayerDataMenuCloseAnim(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = playerDataMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* menuItem = playerDataMenu->menuItems;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &playerDataMenu->menuItemOutline;
    
    s16 baseXPos = playerDataMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->unk16 = baseXPos + 336; 
    }

    for (i = 0; i < NUM_PLAYER_DATA_MENU_ITEMS; i++, menuItem++) {
        menuItem->unk16 = baseXPos + 256;
    }
    
    menuItemOutline->unk16 = baseXPos + 254;

    if (++playerDataMenu->animFrame < 15) {
        PlayerDataMenuRenderUI();
    } else {
        TaskDestroy(gCurTask);
    }
}

static inline void OptionsScreenRecreateUIForPlayerDataMenu(struct PlayerDataMenu* playerDataMenu, struct UNK_802D4CC_UNK270* unk150) {
    struct OptionsScreen* optionsScreen;

    ResetProfileScreensVram();

    OptionsScreenInitRegisters(playerDataMenu->optionsScreen, OPTIONS_SCREEN_STATE_SUB_MENU_OPEN);
    
    optionsScreen = playerDataMenu->optionsScreen;
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
    OptionsScreenCreateUI(playerDataMenu->optionsScreen, 1);
    PlayerDataMenuCreateUI(playerDataMenu);

    unk150->unk0 = 0;
    unk150->unk2 = 2;
    unk150->unk4 = 0;
    unk150->unk6 = 0x100;
    unk150->unkA = 0;
    unk150->unk8 = 0xFF;

    playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
}

static void Task_PlayerDataMenuWaitForProfileNameScreenExit(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == 0) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromProfileNameScreen;
    }
}

void Task_PlayerDataMenuFadeOutToTimeRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    // fade out until complete
    if (sub_802D4CC(unk150)) {
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

static void Task_PlayerDataMenuWaitForTimeRecordsScreenExit(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == PLAYER_DATA_MENU_STATE_ACTIVE) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromTimeRecordsScreen;
    }
}

static void Task_PlayerDataMenuWaitForMultiplayerRecordsScreenExit(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == PLAYER_DATA_MENU_STATE_ACTIVE) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromMultiplayerRecordsScreen;
    }
}

static void DifficultyMenuCreateUI(struct SwitchMenu* difficultyMenu) {
    struct UNK_0808B3FC_UNK240* headerFooter = difficultyMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* difficultyOption = difficultyMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &difficultyMenu->switchValueOutline;

    const struct UNK_080D95E8 *titleText = &sDifficultyMenuTitleText[difficultyMenu->language];
    const struct UNK_080D95E8 *footerText = &sDifficultyMenuControlsText[difficultyMenu->language];
    const struct UNK_080D95E8 *difficultyLevelText = sDifficultyLevelSwitchText[difficultyMenu->language];
    
    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 difficultyLevel = difficultyMenu->switchValue;
    s16 i;

    sub_806A568(
        headerFooter,
        RENDER_TARGET_SUB_MENU,
        titleText->unk4,
        titleText->unk0,
        0x1000,
        baseXPos + 336,
        50,
        8,
        titleText->unk2,
        0
    );

    headerFooter++;
    sub_806A568(
        headerFooter,
        RENDER_TARGET_SUB_MENU,
        footerText->unk4,
        footerText->unk0,
        0x1000,
        baseXPos + 336,
        116,
        8,
        footerText->unk2,
        0
    );
    
    // Normal
    sub_806A568(
        difficultyOption,
        RENDER_TARGET_SUB_MENU,
        difficultyLevelText->unk4,
        difficultyLevelText->unk0,
        0x1000,
        baseXPos + 274,
        76,
        8,
        difficultyLevelText->unk2,
        0
    );

    difficultyOption++;
    difficultyLevelText++;
    // Easy
    sub_806A568(
        difficultyOption,
        RENDER_TARGET_SUB_MENU,
        difficultyLevelText->unk4,
        difficultyLevelText->unk0,
        0x1000,
        baseXPos + 334,
        76,
        8,
        difficultyLevelText->unk2,
        0
    );

    sub_806A568(
        switchValueOutline,
        RENDER_TARGET_SUB_MENU,
        0x12,
        0x3b8,
        0x1000,
        difficultyLevel * 60 + 272,
        76,
        7,
        3,
        0
    );

    for (i = 0, difficultyOption = difficultyMenu->options; i < 2; i++, difficultyOption++) {
        difficultyOption->unk25 = !!(difficultyLevel ^ i);
    }
} 

void Task_DifficultyMenuOpenAnimWait(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = difficultyMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* difficultyOption = difficultyMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &difficultyMenu->switchValueOutline;
    
    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->unk16 = baseXPos + 336;
    }

    difficultyOption->unk16 = baseXPos + 274;
    difficultyOption++;
    difficultyOption->unk16 = baseXPos + 334;
    
    switchValueOutline->unk16 = baseXPos + (difficultyMenu->switchValue * 60 + 272);
    DifficultyMenuRenderUI();

    if (++difficultyMenu->animFrame >= 16) {
        difficultyMenu->animFrame = 0;
        gCurTask->main = Task_DifficultyMenuMain;
    }
}

static void Task_DifficultyMenuMain(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* difficultyOption = difficultyMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &difficultyMenu->switchValueOutline;
    struct OptionsScreen* optionsScreen = difficultyMenu->optionsScreen;

    s16 baseXPos = optionsScreen->subMenuXPos;
    s16 language = difficultyMenu->language;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        difficultyMenu->switchValue = difficultyMenu->switchValue == 0;

       
        for (i = 0; i < 2; i++, difficultyOption++) {
            difficultyOption->unk25 = !!(difficultyMenu->switchValue ^ i);
        }

        switchValueOutline->unk16 = baseXPos + (difficultyMenu->switchValue * 60 + 272);
    }

    DifficultyMenuRenderUI();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *difficultyLevelText = &sDifficultyLevelSwitchText[language][difficultyMenu->switchValue];

        difficultyOption = &optionsScreen->metaItems[OPTIONS_META_ITEM_DIFFICULTY_LEVEL];
        difficultyOption->unk20 = difficultyLevelText->unk2;
        difficultyOption->unkA = difficultyLevelText->unk0;
        sub_8004558(difficultyOption);

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

static void Task_DifficultyMenuCloseAnim(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = difficultyMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* difficultyOption = difficultyMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &difficultyMenu->switchValueOutline;

    s16 unk360 = difficultyMenu->optionsScreen->subMenuXPos;
    s16 i = 0;

    while (i < 2) {
        headerFooter->unk16 = unk360 + 0x150;
        i++;
        headerFooter++;
    }

    difficultyOption->unk16 = unk360 + 0x112;
    difficultyOption++;
    difficultyOption->unk16 = unk360 + 0x14E;

    switchValueOutline->unk16 = difficultyMenu->switchValue * 0x3C + 0x110 + unk360;

    if (++difficultyMenu->animFrame < 0xF) {
        DifficultyMenuRenderUI();
    } else {
        TaskDestroy(gCurTask);
    }
}

static void TimeLimitMenuCreateUI(struct SwitchMenu* timeLimitMenu) {
    // same function as sub_806525C
    struct UNK_0808B3FC_UNK240* headerFooter = timeLimitMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* timeLimitOption = timeLimitMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &timeLimitMenu->switchValueOutline;

    const struct UNK_080D95E8 *titleText = &sTimeLimitMenuTitleText[timeLimitMenu->language];
    const struct UNK_080D95E8 *footerText = &sTimeLimitMenuControlsText[timeLimitMenu->language];
    const struct UNK_080D95E8 *timeLimitSwitchText = sTimeLimitMenuSwitchText[timeLimitMenu->language];

    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 timeLimitEnabled = timeLimitMenu->switchValue;
    s16 i;
    
    // TODO: can these be a macro?
    sub_806A568(
        headerFooter,
        RENDER_TARGET_SUB_MENU,
        titleText->unk4,
        titleText->unk0,
        0x1000,
        baseXPos + 336,
        50,
        8,
        titleText->unk2,
        0
    );

    headerFooter++;
    sub_806A568(
        headerFooter,
        RENDER_TARGET_SUB_MENU,
        footerText->unk4,
        footerText->unk0,
        0x1000,
        baseXPos + 336,
        116,
        8,
        footerText->unk2,
        0
    );
    
    // On
    sub_806A568(
        timeLimitOption,
        RENDER_TARGET_SUB_MENU,
        timeLimitSwitchText->unk4,
        timeLimitSwitchText->unk0,
        0x1000,
        baseXPos + 274,
        76,
        8,
        timeLimitSwitchText->unk2,
        0
    );

    timeLimitOption++;
    timeLimitSwitchText++;
    // Off
    sub_806A568(
        timeLimitOption,
        RENDER_TARGET_SUB_MENU,
        timeLimitSwitchText->unk4,
        timeLimitSwitchText->unk0,
        0x1000,
        baseXPos + 334,
        76,
        8,
        timeLimitSwitchText->unk2,
        0
    );

    sub_806A568(
        switchValueOutline,
        RENDER_TARGET_SUB_MENU,
        0x12,
        0x3b8,
        0x1000,
        timeLimitEnabled * 60 + 272,
        76,
        7,
        3,
        0
    );

    for (i = 0, timeLimitOption = timeLimitMenu->options; i < 2; i++, timeLimitOption++) {
        timeLimitOption->unk25 = !!(timeLimitEnabled ^ i);
    }
}

static void Task_TimeLimitMenuOpenAnimWait(void) {
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = timeLimitMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* timeLimitOption = timeLimitMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &timeLimitMenu->switchValueOutline;
    
    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->unk16 = baseXPos + 336;
    }

    timeLimitOption->unk16 = baseXPos + 274;
    timeLimitOption++;
    timeLimitOption->unk16 = baseXPos + 334;
    
    switchValueOutline->unk16 = baseXPos + (timeLimitMenu->switchValue * 60 + 272);
    TimeLimitMenuRenderUI();

    if (++timeLimitMenu->animFrame > 15) {
        timeLimitMenu->animFrame = 0;
        gCurTask->main = Task_TimeLimitMenuMain;
    }
}

static void Task_TimeLimitMenuMain(void) {
    // Same as sub_806548C
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* timeLimitOption = timeLimitMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &timeLimitMenu->switchValueOutline;
    struct OptionsScreen* optionsScreen = timeLimitMenu->optionsScreen;

    s16 baseXPos = optionsScreen->subMenuXPos;
    s16 language = timeLimitMenu->language;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        timeLimitMenu->switchValue = timeLimitMenu->switchValue == 0;
       
        for (i = 0; i < 2; i++, timeLimitOption++) {
            timeLimitOption->unk25 = !!(timeLimitMenu->switchValue ^ i);
        }

        switchValueOutline->unk16 = baseXPos + (timeLimitMenu->switchValue * 60 + 272);
    }

    TimeLimitMenuRenderUI();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *itemText3 = &sTimeLimitMenuSwitchText[language][timeLimitMenu->switchValue];
        // Except this is different
        timeLimitOption = &optionsScreen->metaItems[OPTIONS_META_ITEM_TIME_LIMIT];
        
        timeLimitOption->unk20 = itemText3->unk2;
        timeLimitOption->unkA = itemText3->unk0;
        sub_8004558(timeLimitOption);
        m4aSongNumStart(SE_SELECT);
        // and this
        optionsScreen->timeLimitEnabled = timeLimitMenu->switchValue;
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_TimeLimitMenuCloseAnim;
    } else if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = Task_TimeLimitMenuCloseAnim;
    }
}

static void Task_TimeLimitMenuCloseAnim(void) {
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = timeLimitMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* timeLimitOption = timeLimitMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &timeLimitMenu->switchValueOutline;

    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->unk16 = baseXPos + 336;
    }

    timeLimitOption->unk16 = baseXPos + 274;
    timeLimitOption++;
    timeLimitOption->unk16 = baseXPos + 334;

    switchValueOutline->unk16 = timeLimitMenu->switchValue * 60 + 272 + baseXPos;

    if (++timeLimitMenu->animFrame < 15) {
        TimeLimitMenuRenderUI();
        return;
    }

    TaskDestroy(gCurTask);
}

/** Button Config Menu **/

void CreateButtonConfigMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(Task_ButtonConfigMenuOpenAnimWait, sizeof(struct ButtonConfigMenu), 0x2000, 4, NULL);
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(t);

    buttonConfigMenu->optionsScreen = optionsScreen;
    
    switch(optionsScreen->profileData.buttonConfig.unk0) {
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

    switch(optionsScreen->profileData.buttonConfig.unk2) {
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

    switch(optionsScreen->profileData.buttonConfig.unk4) {
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

static void ButtonConfigMenuCreateUI(struct ButtonConfigMenu* buttonConfigMenu) {
    struct UNK_0808B3FC_UNK240* uiElement = buttonConfigMenu->staticElements;
    struct UNK_0808B3FC_UNK240* buttonAction = buttonConfigMenu->buttonActions;
    struct UNK_0808B3FC_UNK240* scrollArrow = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* controlFocus = &buttonConfigMenu->controlFocus;

    const struct UNK_080D95E8 *titleControlsText = sButtonConfigTitleAndControlsText[buttonConfigMenu->language];
    const struct UNK_080D95E8 *buttonIcon = sButtonConfigButtonIcons;
    const struct UNK_080D95E8 *actionsText = sButtonConfigActionsText[buttonConfigMenu->language];

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;

    s16 i;

    // title
    sub_806A568(
        uiElement,
        RENDER_TARGET_SUB_MENU,
        titleControlsText->unk4,
        titleControlsText->unk0,
        0x1000,
        baseXPos + 336,
        0x1C,
        8,
        titleControlsText->unk2,
        0
    );

    // controls line 1
    uiElement++;
    titleControlsText++;
    sub_806A568(
        uiElement,
        RENDER_TARGET_SUB_MENU,
        titleControlsText->unk4,
        titleControlsText->unk0,
        0x1000,
        baseXPos + 336,
        0x7A,
        8,
        titleControlsText->unk2,
        0
    );
    // controls line 2
    uiElement++;
    titleControlsText++;
    sub_806A568(
        uiElement,
        RENDER_TARGET_SUB_MENU,
        titleControlsText->unk4,
        titleControlsText->unk0,
        0x1000,
        baseXPos + 336,
        0x87,
        8,
        titleControlsText->unk2,
        0
    );

    // A button
    uiElement++;
    sub_806A568(
        uiElement,
        RENDER_TARGET_SUB_MENU,
        buttonIcon->unk4,
        buttonIcon->unk0,
        0x1000,
        baseXPos + 264,
        0x35,
        8,
        buttonIcon->unk2,
        0
    );
    // B Button
    uiElement++;
    buttonIcon++;
    sub_806A568(
        uiElement,
        RENDER_TARGET_SUB_MENU,
        buttonIcon->unk4,
        buttonIcon->unk0,
        0x1000,
        baseXPos + 264,
        0x4D,
        8,
        buttonIcon->unk2,
        0
    );
    // R Shoulder button
    uiElement++;
    buttonIcon++;
    sub_806A568(
        uiElement,
        RENDER_TARGET_SUB_MENU,
        buttonIcon->unk4,
        buttonIcon->unk0,
        0x1000,
        baseXPos + 264,
        0x65,
        8,
        buttonIcon->unk2,
        0
    );

    // Selected A Button
    sub_806A568(
        buttonAction,
        RENDER_TARGET_SUB_MENU,
        actionsText[buttonConfigMenu->aButtonAction].unk4,
        actionsText[buttonConfigMenu->aButtonAction].unk0,
        0x1000,
        baseXPos + 0x14C,
        0x2D,
        8,
        actionsText[buttonConfigMenu->aButtonAction].unk2,
        0
    );

    // Selected B Button
    buttonAction++;
    sub_806A568(
        buttonAction,
        RENDER_TARGET_SUB_MENU,
        actionsText[buttonConfigMenu->bButtonAction].unk4,
        actionsText[buttonConfigMenu->bButtonAction].unk0,
        0x1000,
        baseXPos + 0x14C,
        0x45,
        8,
        actionsText[buttonConfigMenu->bButtonAction].unk2,
        0
    );

    // Selected R Shoulder button
    buttonAction++;
    sub_806A568(
        buttonAction,
        RENDER_TARGET_SUB_MENU,
        actionsText[buttonConfigMenu->rShoulderAction].unk4,
        actionsText[buttonConfigMenu->rShoulderAction].unk0,
        0x1000,
        baseXPos + 0x14C,
        0x5D,
        8,
        actionsText[buttonConfigMenu->rShoulderAction].unk2,
        0
    );

    sub_806A568(
        controlFocus,
        RENDER_TARGET_SUB_MENU,
        0x42,
        0x3B6,
        0x1000,
        baseXPos + 0xFC,
        0x2A,
        6,
        7,
        0
    );
    
    sub_806A568(
        scrollArrow,
        RENDER_TARGET_SUB_MENU,
        2,
        0x3B6,
        0x1000,
        baseXPos + 0x143,
        0x35,
        6,
        8,
        0
    );
    scrollArrow++;
    sub_806A568(
        scrollArrow,
        RENDER_TARGET_SUB_MENU,
        2,
        0x3B6,
        0x1000,
        baseXPos + 0x19D,
        0x35,
        6,
        9,
        0
    );
}

static void Task_ButtonConfigMenuOpenAnimWait(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* uiElement = buttonConfigMenu->staticElements;
    struct UNK_0808B3FC_UNK240* buttonAction = buttonConfigMenu->buttonActions;
    struct UNK_0808B3FC_UNK240* scrollArrow = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* controlFocus = &buttonConfigMenu->controlFocus;

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 3; i++, uiElement++) {
        uiElement->unk16 = baseXPos + 336;
    }

    for (;i < 6; i++, uiElement++) {
        uiElement->unk16 = baseXPos + 264;
    }

    for (i = 0; i < 3; i++, buttonAction++) {
        buttonAction->unk16 = baseXPos + 332;
    }

    controlFocus->unk16 = baseXPos + 252;
    scrollArrow->unk16 = baseXPos + 323;
    scrollArrow++;
    scrollArrow->unk16 = baseXPos + 413;
    
    ButtonConfigMenuRenderUI();

    if (++buttonConfigMenu->animFrame >= 16) {
        buttonConfigMenu->animFrame = 0;
        gCurTask->main = Task_ButtonConfigMenuAButtonMain;
    }
}

static void Task_ButtonConfigMenuAButtonMain(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* buttonAction = buttonConfigMenu->buttonActions;
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
        buttonAction->unkA = actionText->unk0;
        buttonAction->unk20 = actionText->unk2;
        sub_8004558(&buttonAction[0]);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction || buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->bButtonAction < 2) {
                    buttonConfigMenu->bButtonAction++;
                } else {
                    buttonConfigMenu->bButtonAction = 0;
                }
            }
            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_B_BUTTON];
            buttonAction->unkA = actionsText[buttonConfigMenu->bButtonAction].unk0;
            buttonAction->unk20 = actionsText[buttonConfigMenu->bButtonAction].unk2;
            
            sub_8004558(buttonAction);
        }

        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->rShoulderAction < 2) {
                    buttonConfigMenu->rShoulderAction++;
                } else {
                    buttonConfigMenu->rShoulderAction = 0;
                }
            }

            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON];
            buttonAction->unkA = actionsText[buttonConfigMenu->rShoulderAction].unk0;
            buttonAction->unk20 = actionsText[buttonConfigMenu->rShoulderAction].unk2;
            sub_8004558(buttonAction);
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

void Task_ButtonConfigMenuBButtonMain(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* buttonAction;
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
        buttonAction->unkA = itemText4->unk0;
        buttonAction->unk20 = itemText4->unk2;
        sub_8004558(buttonAction);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->rShoulderAction || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->rShoulderAction < 2) {
                    buttonConfigMenu->rShoulderAction++;
                } else {
                    buttonConfigMenu->rShoulderAction = 0;
                }
            }
            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON];
            buttonAction->unkA = actionsText[buttonConfigMenu->rShoulderAction].unk0;
            buttonAction->unk20 = actionsText[buttonConfigMenu->rShoulderAction].unk2;
            
            sub_8004558(buttonAction);
        }

        buttonConfigMenu->focus = BUTTON_CONFIG_MENU_R_SHOULDER_BUTTON;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_ButtonConfigMenuHandleBButtonComplete;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        if (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
            while (buttonConfigMenu->aButtonAction == buttonConfigMenu->bButtonAction || buttonConfigMenu->bButtonAction == buttonConfigMenu->rShoulderAction) {
                if (buttonConfigMenu->bButtonAction < 2) {
                    buttonConfigMenu->bButtonAction++;
                } else {
                    buttonConfigMenu->bButtonAction = 0;
                }
            }
            buttonAction = &buttonConfigMenu->buttonActions[BUTTON_CONFIG_MENU_B_BUTTON];
            buttonAction->unkA = actionsText[buttonConfigMenu->bButtonAction].unk0;
            buttonAction->unk20 = actionsText[buttonConfigMenu->bButtonAction].unk2;
            
            sub_8004558(buttonAction);
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

static inline void CommitButtonConfig(struct ButtonConfigMenu* buttonConfigMenu, struct OptionsScreen* optionsScreen) {
     switch (buttonConfigMenu->aButtonAction) {
        case BUTTON_CONFIG_MENU_ACTION_JUMP:
            optionsScreen->profileData.buttonConfig.unk0 = A_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_ATTACK:
            optionsScreen->profileData.buttonConfig.unk2 = A_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_TRICK:
            optionsScreen->profileData.buttonConfig.unk4 = A_BUTTON;
            break;
    }

    switch (buttonConfigMenu->bButtonAction) {
        case BUTTON_CONFIG_MENU_ACTION_JUMP:
            optionsScreen->profileData.buttonConfig.unk0 = B_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_ATTACK:
            optionsScreen->profileData.buttonConfig.unk2 = B_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_TRICK:
            optionsScreen->profileData.buttonConfig.unk4 = B_BUTTON;
            break;
    }

    switch (buttonConfigMenu->rShoulderAction) {
        case BUTTON_CONFIG_MENU_ACTION_JUMP:
            optionsScreen->profileData.buttonConfig.unk0 = R_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_ATTACK:
            optionsScreen->profileData.buttonConfig.unk2 = R_BUTTON;
            break;
        case BUTTON_CONFIG_MENU_ACTION_TRICK:
            optionsScreen->profileData.buttonConfig.unk4 = R_BUTTON;
            break;
    }
}

static void Task_ButtonConfigMenuRShoulderMain(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct OptionsScreen* optionsScreen = buttonConfigMenu->optionsScreen;

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

static void ButtonConfigMenuStartOver(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct OptionsScreen* optionsScreen = buttonConfigMenu->optionsScreen;
    struct UNK_0808B3FC_UNK240* buttonAction = buttonConfigMenu->buttonActions;
    const struct UNK_080D95E8 *actionsText = sButtonConfigActionsText[buttonConfigMenu->language];
    s16 i;

    buttonConfigMenu->aButtonAction = BUTTON_CONFIG_MENU_ACTION_JUMP;
    buttonConfigMenu->bButtonAction = BUTTON_CONFIG_MENU_ACTION_ATTACK;
    buttonConfigMenu->rShoulderAction = BUTTON_CONFIG_MENU_ACTION_TRICK;

    CommitButtonConfig(buttonConfigMenu, optionsScreen);

    for (i = 0; i < 3; i++, buttonAction++) {
        buttonAction->unkA = actionsText[i].unk0;
        buttonAction->unk20 = actionsText[i].unk2;
        sub_8004558(buttonAction);
    }

    gCurTask->main = Task_ButtonConfigMenuHandleStartOver;
}

static void Task_ButtonMenuConfigCloseAnim(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* unk4 = buttonConfigMenu->staticElements;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->buttonActions;
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->controlFocus;

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 3; i++, unk4++) {
        unk4->unk16 = baseXPos + 0x150;
    }

    for (; i < 6; i++, unk4++) {
        unk4->unk16 = baseXPos + 0x108;
    }

    for (i = 0; i < 3; i++, unk124++) {
        unk124->unk16 = baseXPos + 0x14C;
    }

    unk214->unk16 = baseXPos + 0xFC;
    unk1B4->unk16 = baseXPos + 0x143;
    unk1B4++;
    unk1B4->unk16 = baseXPos + 0x19D;

    if (++buttonConfigMenu->animFrame < 15) {
        ButtonConfigMenuRenderUI();
        return;
    }

    TaskDestroy(gCurTask);
}

static void ButtonConfigMenuRenderUI(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* unk4 = buttonConfigMenu->staticElements;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->buttonActions;
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->controlFocus;
    s16 i;

    for (i = 0; i < 6; i++, unk4++) {
        sub_80051E8(unk4);
    }

    for (i = 0; i < 3; i++, unk124++) {
        sub_80051E8(unk124);
    }
    
    for (i = 0; i < 2; i++, unk1B4++) {
        sub_8004558(unk1B4);
        sub_80051E8(unk1B4);
    }
    
    sub_80051E8(unk214);
}

static void LanguageScreenInitRegisters(struct LanguageScreen* languageScreen) {
    struct UNK_802D4CC_UNK270* unk1F0 = &languageScreen->unk1F0;

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

    unk1F0->unk0 = 0;
    unk1F0->unk2 = 2;
    unk1F0->unk4 = 0;
    unk1F0->unk6 = 0x100;
    unk1F0->unkA = 0;
    unk1F0->unk8 = 0xFF;

    sub_802D4CC(&languageScreen->unk1F0);
}

static void LanguageScreenCreateUI(struct LanguageScreen* languageScreen) {
    s16 selectedLanguage = languageScreen->menuCursor;
    struct UNK_0808B3FC_UNK240* headerFooter = languageScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* languageOption = languageScreen->languageOptions;
    struct UNK_0808B3FC_UNK240* optionOutline = &languageScreen->optionOutline;

    const struct UNK_080D95E8* languageScreenTitles = sLanguageScreenTitles;
    const struct UNK_080D95E8* optionText = sLanguageScreenOptionsText;
    const struct UNK_080D95E8* controlsText;

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
    
    sub_806A568(
        headerFooter,
        RENDER_TARGET_SCREEN,
        titleSize,
        languageScreenTitles->unk0,
        0x3000,
        0x78,
        0x1A,
        0xD,
        languageScreenTitles->unk2,
        0
    );
    headerFooter++;
    sub_806A568(
        headerFooter,
        RENDER_TARGET_SCREEN,
        controlsTextSize,
        controlsText->unk0,
        0x3000,
        0x78,
        0x8A,
        0xD,
        controlsText->unk2,
        0
    );

    for (i = 0, yPos = 40; i < NUM_LANGUAGES; i++, languageOption++, optionText++, yPos+= 15) {
        sub_806A568(
            languageOption,
            RENDER_TARGET_SCREEN,
            optionText->unk4,
            optionText->unk0,
            0x3000,
            0x28,
            yPos,
            0xD,
            optionText->unk2,
            0
        );
        languageOption->unk25 = !!(selectedLanguage ^ i);
    }

    sub_806A568(
        optionOutline,
        RENDER_TARGET_SCREEN,
        0x3F,
        0x3BD,
        0x3000,
        0x26,
        (selectedLanguage * 15) + 40,
        0xC,
        5,
        0
    );

    sub_806A568(
        NULL, 
        RENDER_TARGET_SCREEN, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0
    );
    sub_806A568(
        NULL, 
        RENDER_TARGET_SCREEN, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        1, 
        0
    );
    sub_806A568(
        NULL, 
        RENDER_TARGET_SCREEN, 
        0, 
        0x3C3, 
        0, 
        0, 
        0, 
        0, 
        0xC, 
        0
    );
}

static void Task_LanguageScreenMain(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask);
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
            gLoadedSaveGame->unk6 = languageScreen->menuCursor + 1;
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

static void LanguageScreenHandleLanguageChanged(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = languageScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* menuItems = languageScreen->languageOptions;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &languageScreen->optionOutline;

    const struct UNK_080D95E8* titleText = &sLanguageScreenTitles[languageScreen->menuCursor];
    const struct UNK_080D95E8* controlsText;
    s16 i;

    if (languageScreen->creatingNewProfile != TRUE) {
        controlsText = &sLanguageScreenEditControlsText[languageScreen->menuCursor];
    } else {
        controlsText = &sLanguageScreenNewControlsText[languageScreen->menuCursor];
    }

    menuItemOutline->unk18 = languageScreen->menuCursor * 15 + 40;

    for (i = 0; i < NUM_LANGUAGES; i++, menuItems++) {
        menuItems->unk25 = !!(languageScreen->menuCursor ^ i);
    }

    headerFooter->unk20 = titleText->unk2;
    headerFooter->unkA = titleText->unk0;
    sub_8004558(headerFooter);

    headerFooter++;
    headerFooter->unk20 = controlsText->unk2;
    headerFooter->unkA = controlsText->unk0;
    sub_8004558(headerFooter);
}

static void CreateDeleteScreen(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(Task_DeleteScreenFadeIn, sizeof(struct DeleteScreen), 0x2000, TASK_x0004, NULL);
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(t);

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

static void DeleteScreenInitRegisters(struct DeleteScreen* deleteScreen) {
    struct UNK_802D4CC_UNK270* unk130 = &deleteScreen->unk130;

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

    unk130->unk0 = 0;
    unk130->unk2 = 2;
    unk130->unk4 = 0;
    unk130->unk6 = 0x100;
    unk130->unkA = 0;
    unk130->unk8 = 0xFF;

    sub_802D4CC(&deleteScreen->unk130);
}

static void DeleteScreenCreateUI(struct DeleteScreen* deleteScreen) {
    s16 language = deleteScreen->language;
    struct UNK_0808B3FC_UNK240* option = deleteScreen->options;
    struct UNK_0808B3FC_UNK240* optionOutline = &deleteScreen->optionOutline;

    const struct UNK_080D95E8* titleText = &sDeleteScreenConfirmTitleText[language];
    const struct UNK_080D95E8* controlsText = &sDeleteScreenControlsText[language];
    const struct UNK_080D95E8* optionText = sDeleteScreenOptionsText[language];

    s16 confirmationCursor = deleteScreen->confirmationCursor;
    
    sub_806A568(
        &deleteScreen->headerFooter[0],
        RENDER_TARGET_SCREEN,
        titleText->unk4,
        titleText->unk0,
        0x3000,
        0x78,
        0x32,
        0xD,
        titleText->unk2,
        0
    );
    sub_806A568(
        &deleteScreen->headerFooter[1],
        RENDER_TARGET_SCREEN,
        controlsText->unk4,
        controlsText->unk0,
        0x3000,
        0x78,
        0x74,
        0xD,
        controlsText->unk2,
        0
    );
    sub_806A568(
        option,
        RENDER_TARGET_SCREEN,
        optionText->unk4,
        optionText->unk0,
        0x3000,
        0x3A,
        0x4C,
        0xD,
        optionText->unk2,
        0
    );

    option->unk25 = 1;
    option++;
    optionText++;
    sub_806A568(
        option,
        RENDER_TARGET_SCREEN,
        optionText->unk4,
        optionText->unk0,
        0x3000,
        0x76,
        0x4C,
        0xD,
        optionText->unk2,
        0
    );

    sub_806A568(
        optionOutline,
        RENDER_TARGET_SCREEN,
        0x12,
        0x3B8,
        0x3000,
        (confirmationCursor * 60) + 56,
        0x4C,
        0xC,
        3,
        0
    );

    sub_806A568(
        NULL, 
        RENDER_TARGET_SCREEN, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0
    );
    sub_806A568(
        NULL, 
        RENDER_TARGET_SCREEN, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        1, 
        0
    );
    sub_806A568(
        NULL, 
        RENDER_TARGET_SCREEN, 
        0, 
        0x3C3, 
        0, 
        0, 
        0, 
        0, 
        0xC, 
        0
    );
}

static void Task_DeleteScreenConfrimationMain(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* option = deleteScreen->options;
    struct UNK_0808B3FC_UNK240* optionOutline = &deleteScreen->optionOutline;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteScreen->confirmationCursor = !deleteScreen->confirmationCursor;

        for (i = 0; i < 2; i++, option++) {
            option->unk25 = !!(deleteScreen->confirmationCursor ^ i);
        }
        optionOutline->unk16 = deleteScreen->confirmationCursor * 60 + 56;
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

static void Task_DeleteScreenCreateAbsoluteConfirmation(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);

    struct UNK_0808B3FC_UNK240* headerFooter = deleteScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* option = deleteScreen->options;
    struct UNK_0808B3FC_UNK240* optionOutline = &deleteScreen->optionOutline;
    const struct UNK_080D95E8* titleText = &sDeleteScreenAbsoluteConfirmTitleText[deleteScreen->language];
    s16 i;

    headerFooter->unk20 = titleText->unk2;
    headerFooter->unkA = titleText->unk0;

    sub_8004558(headerFooter);

    deleteScreen->confirmationCursor = DELETE_SCREEN_CONFIRMATION_NO;

    for (i = 0; i < 2; i++, option++) {
        option->unk25 = !!(deleteScreen->confirmationCursor ^ i);
    }

    optionOutline->unk16 = deleteScreen->confirmationCursor * 60 + 56;

    DeleteScreenRenderUI();
    gCurTask->main = Task_DeleteScreenAbsoluteConfirmMain;
}

static void Task_DeleteScreenAbsoluteConfirmMain(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* option = deleteScreen->options;
    struct UNK_0808B3FC_UNK240* optionOutline = &deleteScreen->optionOutline;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteScreen->confirmationCursor = deleteScreen->confirmationCursor == 0;

        for (i = 0; i < 2; i++, option++) {
            option->unk25 = !!(deleteScreen->confirmationCursor ^ i);
        }
        optionOutline->unk16 = deleteScreen->confirmationCursor * 60 + 56;
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

void Task_DeleteScreenFadeOutAndExit(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);

    if (!sub_802D4CC(&deleteScreen->unk130)) {
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

void CreateEditProfileNameScreen(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(Task_ProfileNameScreenFadeIn, sizeof(struct ProfileNameScreen), 0x2000, 4, NULL);
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(t);
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

    for (;i < MAX_PLAYER_NAME_LENGTH; i++) {
        profileNameScreen->nameInput.buffer[i] = PLAYER_NAME_END_CHAR;
    }

    ResetProfileScreensVram();

    ProfileNameScreenInitRegisters(profileNameScreen->language);
    ProfileNameScreenCreateUIBackgrounds(profileNameScreen);
    ProfileNameScreenCreateUIText(profileNameScreen);
    ProfileNameScreenCreateUIContextElements(profileNameScreen);
    ProfileNameScreenCreateInputDisplayUI(profileNameScreen);
}

static void ProfileNameScreenInitRegisters(s16 language) {
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

static void ProfileNameScreenCreateUIBackgrounds(struct ProfileNameScreen* profileNameScreen) {
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;

    unk140->unk0 = 0;
    unk140->unk2 = 2;
    unk140->unk4 = 0;
    unk140->unk6 = 0x100;
    unk140->unkA = 0;
    unk140->unk8 = 0xFF;
    
    sub_806B854(
        &profileNameScreen->background, 
        0, 
        7, 
        0x87, 
        0x1E, 
        0x14, 
        0, 
        0, 
        0, 
        0
    );
    sub_806B854(
        &profileNameScreen->charMatrixBackground, 
        3, 
        0x1F, 
        0x89, 
        0x1E, 
        0x14, 
        0, 
        2, 
        0, 
        0
    );
    sub_806B854(
        &profileNameScreen->charMatrix, 
        1, 
        0x16, 
        0x88, 
        0x16, 
        0x2C, 
        0, 
        1, 
        0, 
        0
    );
}

static void ProfileNameScreenCreateUIText(struct ProfileNameScreen* profileNameScreen) {
    struct UNK_0808B3FC_UNK240* title = &profileNameScreen->title;
    struct UNK_0808B3FC_UNK240* control = profileNameScreen->controls;
    
    u8* language = &profileNameScreen->language;
    const struct UNK_080D95E8* arrowTile = sProfileNameScreenArrowTiles;
    const struct UNK_080D95E8* endButtonText = &sProfileNameScreenEndButtonText[*language];
    const struct UNK_080D95E8* titleText;

    if (profileNameScreen->nameInput.cursor > 0) {
        titleText = &sProfileNameScreenEditTitleText[*language];
    } else {
        titleText = &sProfileNameScreenNewTitleText[*language];
    }

    sub_806A568(
        title, 
        RENDER_TARGET_SCREEN, 
        titleText->unk4,
        titleText->unk0,
        0x1000,
        3, 
        0x15,
        0xD,
        titleText->unk2,
        0
    );
    
    // Left arrow
    sub_806A568(
        control, 
        RENDER_TARGET_SCREEN, 
        arrowTile->unk4,
        arrowTile->unk0,
        0x1000,
        0xDB, 
        0x70,
        0xD,
        arrowTile->unk2,
        0
    );
    control++;
    arrowTile++;

    // Right arrow
    sub_806A568(
        control, 
        RENDER_TARGET_SCREEN, 
        arrowTile->unk4,
        arrowTile->unk0,
        0x1000,
        0xDB, 
        0x80,
        0xD,
        arrowTile->unk2,
        0
    );
    control++;

    // End button
    sub_806A568(
        control, 
        RENDER_TARGET_SCREEN, 
        endButtonText->unk4,
        endButtonText->unk0,
        0x1000,
        0xDB, 
        0x8F,
        0xD,
        endButtonText->unk2,
        0
    );
}

static void ProfileNameScreenCreateUIContextElements(struct ProfileNameScreen* profileNameScreen) {
    struct UNK_0808B3FC_UNK240* focusedCell = profileNameScreen->focusedCell;
    struct UNK_0808B3FC_UNK240* scrollArrow = profileNameScreen->scrollArrows;
    const struct UNK_080D95E8* scrollArrowTile = sProfileNameScreenScrollArrowTiles;
    struct UNK_806B908 nameCharTile;
    
    // background
    sub_806A568(
        focusedCell, 
        RENDER_TARGET_SCREEN, 
        10,
        0x3BA,
        0x1000,
        0x21, 
        0x2F,
        8,
        7,
        0
    );
    focusedCell++;

    // foreground
    nameCharTile = sub_806B908(profileNameScreen->matrixCursorIndex);
    sub_806A568(
        focusedCell, 
        RENDER_TARGET_SCREEN, 
        nameCharTile.unk0,
        nameCharTile.unk4,
        0x1000,
        0x21, 
        0x2F,
        7,
        nameCharTile.unk6,
        0
    );
    
    sub_806A568(
        scrollArrow, 
        RENDER_TARGET_SCREEN, 
        scrollArrowTile->unk4,
        scrollArrowTile->unk0,
        0x1000,
        8, 
        0x2C,
        0xD,
        scrollArrowTile->unk2,
        0
    );
    scrollArrow++;
    scrollArrowTile++;
    sub_806A568(
        scrollArrow, 
        RENDER_TARGET_SCREEN, 
        scrollArrowTile->unk4,
        scrollArrowTile->unk0,
        0x1000,
        8, 
        0x82,
        0xD,
        scrollArrowTile->unk2,
        0
    );
}

static void ProfileNameScreenCreateInputDisplayUI(struct ProfileNameScreen* profileNameScreen) {
    struct UNK_806B908 nameCharTile;
    struct UNK_0808B3FC_UNK240* inputDisplayChar = profileNameScreen->nameInput.characterDisplay;
    struct UNK_0808B3FC_UNK240* inputDisplayCursor = &profileNameScreen->nameInput.displayCursor;

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
        sub_806A568(
            inputDisplayChar, 
            RENDER_TARGET_SCREEN, 
            nameCharTile.unk0,
            nameCharTile.unk4,
            0x1000,
            xPos, 
            yPos,
            8,
            nameCharTile.unk6,
            0
        );
    }

    sub_806A568(
        inputDisplayCursor, 
        RENDER_TARGET_SCREEN, 
        2,
        0x3BA,
        0x1000,
        profileNameScreen->nameInput.cursor * NAME_INPUT_DISPLAY_CHAR_WIDTH + 161, 
        21,
        5,
        6,
        0
    );
}

static void Task_ProfileNameScreenMain(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);
    struct NameInputDisplay* nameInput = &profileNameScreen->nameInput;

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
            if (profileNameScreen->matrixCursorIndex == NAME_CHAR_MATRIX_NUM_COLS - 1 || profileNameScreen->matrixCursorIndex == NAME_CHAR_MATRIX_NUM_COLS * 2 - 1) {
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
                if (profileNameScreen->matrixCursorIndex != NAME_CHAR_MATRIX_NUM_COLS - 1 && profileNameScreen->matrixCursorIndex != NAME_CHAR_MATRIX_NUM_COLS * 2 - 1) {
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
        if (profileNameScreen->cursorCol == PROFILE_NAME_SCREEN_CONTROLS_COLUMN && profileNameScreen->cursorRow == PROFILE_NAME_SCREEN_END_BUTTON) {
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
        if ((nameInput->cursor > 0 && nameInput->buffer[nameInput->cursor] == PLAYER_NAME_END_CHAR) || nameInput->cursor > MAX_PLAYER_NAME_LENGTH - 1) {
            nameInput->cursor--;
        }
        
        for (i = nameInput->cursor; i < MAX_PLAYER_NAME_LENGTH - 1; i++) {
            nameInput->buffer[i] = nameInput->buffer[i + 1];
        }
        nameInput->buffer[MAX_PLAYER_NAME_LENGTH - 1] = 0xFFFF;
    }
}

static bool16 ProfileNameScreenHandleShoulderInput(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);

    if (gRepeatedKeys & L_BUTTON) {
        if (profileNameScreen->nameInput.cursor > 0) {
            profileNameScreen->nameInput.cursor--;
            if (profileNameScreen->nameInput.cursor < MAX_PLAYER_NAME_LENGTH - 1) {
                if (
                    profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor + 1] == PLAYER_NAME_END_CHAR &&
                    !sub_806B9C8(profileNameScreen->nameInput.buffer[profileNameScreen->nameInput.cursor])
                ) {
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

static bool16 ProfileNameScreenHandleDpadInput(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);

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
                    gBgScrollRegs[1][1] = 65497;
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

static void ProfileNameScreenInputComplete(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;
    struct NameInputDisplay* nameInput = &profileNameScreen->nameInput;
    s16 i;

    // Copy name from input into profile data on the options screen
    if (profileNameScreen->onCompleteAction == 0) {
        struct OptionsScreenProfileData* profileData = &profileNameScreen->playerDataMenu->optionsScreen->profileData;
        for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
            profileData->playerName[i] = nameInput->buffer[i];
        }
    }

    unk140->unk0 = 0;
    unk140->unk2 = 1;
    unk140->unk4 = 0;
    unk140->unk6 = 0x100;
    unk140->unkA = 0;
    unk140->unk8 = 0xFF;

    gCurTask->main = ProfileNameScreenFadeOutAndExit;
}

static void ProfileNameScreenFadeOutAndExit(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;
    struct NameInputDisplay* nameInput = &profileNameScreen->nameInput;
    s16 onCompleteAction = profileNameScreen->onCompleteAction;
    s16 i;

    if (!sub_802D4CC(unk140)) {
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
        gLoadedSaveGame->unk20[i] = nameInput->buffer[i];
    }
    WriteSaveGame();
    TasksDestroyAll();
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;

    if (onCompleteAction == NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER) {
        CreateMultiplayerModeSelectScreen();
    } else {
        CreateTitleScreen();
    }
}

static void ProfileNameScreenRenderUI(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);

    struct UNK_0808B3FC_UNK240* title = &profileNameScreen->title;
    struct UNK_0808B3FC_UNK240* controls = profileNameScreen->controls;
    struct UNK_0808B3FC_UNK240* focusedCell = profileNameScreen->focusedCell;
    struct UNK_0808B3FC_UNK240* scrollArrow = profileNameScreen->scrollArrows;
    struct UNK_0808B3FC_UNK240* inputDisplayChar = profileNameScreen->nameInput.characterDisplay;
    struct UNK_0808B3FC_UNK240* inputDisplayCursor = &profileNameScreen->nameInput.displayCursor;
    struct UNK_806B908 charMatrixCursorTile;
    struct UNK_806B908 nameCharTile;

    s16 i;
    u16* nameChar;

    sub_80051E8(title);

    for (i = 0; i < 3; i++, controls++) {
        sub_80051E8(controls);
    }

    if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
        // background
        focusedCell->unkA = 0x3BA;
        focusedCell->unk20 = 7;
        focusedCell->unk16 = profileNameScreen->cursorCol * NAME_CHAR_MATRIX_BACKGROUND_COLUMN_WIDTH + 32;
        focusedCell->unk18 = profileNameScreen->cursorRow * NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT + 47;
        sub_8004558(focusedCell);
        sub_80051E8(focusedCell);
        focusedCell++;

        // Interesting that this is calculated here, feels like the wrong place
        profileNameScreen->matrixCursorIndex = profileNameScreen->matrixPageIndex + profileNameScreen->cursorRow * NAME_CHAR_MATRIX_NUM_COLS + profileNameScreen->cursorCol; 
        
        // foreground  
        charMatrixCursorTile = sub_806B908(profileNameScreen->matrixCursorIndex);
        focusedCell->unkA = charMatrixCursorTile.unk4;
        focusedCell->unk20 = charMatrixCursorTile.unk6;
        focusedCell->unk16 = profileNameScreen->cursorCol * NAME_CHAR_MATRIX_BACKGROUND_COLUMN_WIDTH + 32;
        focusedCell->unk18 = profileNameScreen->cursorRow * NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT + 47;
        sub_8004558(focusedCell);
        sub_80051E8(focusedCell);
    } else {
        // Make a focus outline if we are on the controls
        focusedCell->unkA = 0x3BA;
        focusedCell->unk20 = 8;
        focusedCell->unk16 = 0xCB;
        focusedCell->unk18 = profileNameScreen->cursorRow * NAME_CHAR_MATRIX_BACKGROUND_ROW_HEIGHT + 39;
        sub_8004558(focusedCell);
        sub_80051E8(focusedCell);
    }

    // top
    sub_8004558(scrollArrow);
    scrollArrow++;
    // bottom
    sub_8004558(scrollArrow);

    if (profileNameScreen->cursorCol < PROFILE_NAME_SCREEN_CONTROLS_COLUMN) {
        // Show the top arrow if we are not on the first row
        scrollArrow = profileNameScreen->scrollArrows;
        if (profileNameScreen->matrixCursorIndex > NAME_CHAR_MATRIX_NUM_COLS - 1) {
            sub_80051E8(scrollArrow);
        }
        scrollArrow++;

        // Show the bottom arrow if we are not on the last row
        if (profileNameScreen->matrixCursorIndex < NAME_CHAR_MATRIX_NUM_COLS * (NAME_CHAR_MATRIX_NUM_ROWS - 1)) {
            sub_80051E8(scrollArrow);
        }
    }

    if (profileNameScreen->nameInput.cursor < MAX_PLAYER_NAME_LENGTH) {
        inputDisplayCursor->unk16 = profileNameScreen->nameInput.cursor * NAME_INPUT_DISPLAY_CHAR_WIDTH + 161;
        sub_80051E8(inputDisplayCursor);
    }

    // render the inputted name into the display
    for (i = 0, nameChar = profileNameScreen->nameInput.buffer; i < MAX_PLAYER_NAME_LENGTH && *nameChar != PLAYER_NAME_END_CHAR; i++, inputDisplayChar++, nameChar++) {
        nameCharTile = sub_806B908(*nameChar);
        inputDisplayChar->unkA = nameCharTile.unk4;
        inputDisplayChar->unk20 = nameCharTile.unk6;
        sub_8004558(inputDisplayChar);
        sub_80051E8(inputDisplayChar);
    }
}

static void CreateTimeRecordsScreen(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(Task_TimeRecordsScreenChoiceViewFadeIn, sizeof(struct TimeRecordsScreen), 0x2000, 4, NULL);
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(t);
    s16 availableCharacters;

    ReadAvailableCharacters(availableCharacters, gLoadedSaveGame->unk13);

    timeRecordsScreen->playerDataMenu = playerDataMenu;
    timeRecordsScreen->character = 0;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unusedUnk708 = FALSE;
    timeRecordsScreen->availableCharacters = availableCharacters;

    for (availableCharacters = 0; availableCharacters < NUM_CHARACTERS; availableCharacters++) {
        timeRecordsScreen->unlockedCourses[availableCharacters] = gLoadedSaveGame->unk7[availableCharacters];
    }

    timeRecordsScreen->language = playerDataMenu->language;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    
    ResetProfileScreensVram();

    TimeRecordScreenInitRegisters();
    TimeRecordsScreenCreateChoiceViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateChoiceViewUI(timeRecordsScreen);
}

static void TimeRecordScreenInitRegisters(void) {
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

static void TimeRecordsScreenCreateChoiceViewBackgroundsUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk270 = &timeRecordsScreen->unk0;
    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;
    sub_806B854(&timeRecordsScreen->coursesViewCharacterBackground,0,7,0x89,0x1e,0x14,0,0,0,0);
    sub_806B854(&timeRecordsScreen->coursesViewCharacter,1,0xF,0x8A,0x1e,0x14,0,1,0,0);
}

static void TimeRecordsScreenCreateChoiceViewUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_0808B3FC_UNK240* title = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    struct UNK_0808B3FC_UNK240* scrollArrow = timeRecordsScreen->choiceViewScrollArrows;
    struct UNK_0808B3FC_UNK240* choiceItem = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    const struct UNK_080D95E8 *titleText = &sTimeRecordsChoiceViewTitles[timeRecordsScreen->language];
    const struct UNK_080D95E8 *choiceText = sTimeRecordsScreenChoices[timeRecordsScreen->language];
    
    // TODO: This X is a fake match, the compiler wants to use 0
    // from a register but won't do it without this
#ifndef NON_MATCHING
    s32 x = 0x1000;
    ++x; --x;
#endif

    sub_806A568(
        title, 
        RENDER_TARGET_SCREEN, 
        titleText->unk4,
        titleText->unk0,
#ifndef NON_MATCHING
        x,
#else
        0x1000,
#endif
        4, 
        0x1A,
        5,
        titleText->unk2,
        0
    );

    sub_806A568(
        choiceItem, 
        RENDER_TARGET_SCREEN, 
        choiceText->unk4,
        choiceText->unk0,
#ifndef NON_MATCHING
        x,
#else
        0x1000,
#endif
        0x28, 
        0x54,
        5,
        choiceText->unk2,
        0
    );

    choiceItem++;
    choiceText++;
    sub_806A568(
        choiceItem, 
        RENDER_TARGET_SCREEN, 
        choiceText->unk4,
        choiceText->unk0,
#ifndef NON_MATCHING
        x,
#else
        0x1000,
#endif
        0x86, 
        0x54,
        5,
        choiceText->unk2,
        0
    );

    sub_806A568(
        scrollArrow, 
        RENDER_TARGET_SCREEN, 
        2,
        0x3B6,
#ifndef NON_MATCHING
        x,
#else
        0x1000,
#endif
        100, 
        0x4B,
        6,
        8,
        0
    );
    scrollArrow++;
    sub_806A568(
        scrollArrow, 
        RENDER_TARGET_SCREEN, 
        2,
        0x3B6,
#ifndef NON_MATCHING
        x,
#else
        0x1000,
#endif
        0x8C, 
        0x4B,
        6,
        9,
        0
    );
}

static void Task_TimeRecordsScreenModeChoiceMain(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* unk4C = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    
    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        timeRecordsScreen->isBossMode = !timeRecordsScreen->isBossMode;
        
        if (!timeRecordsScreen->isBossMode) {
            unk4C->unk25 = 0;
            unk4C++;
            unk4C->unk25 = 0;
        } else {
            unk4C->unk25 = 1;
            unk4C++;
            unk4C->unk25 = 0xFF;
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

static void CreateTimeRecordsScreenAtCoursesView(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(Task_TimeRecordsScreenCreateTimesUI, sizeof(struct TimeRecordsScreen), 0x2000, 4, NULL);
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(t);
    s16 i;

    ReadAvailableCharacters(i, gLoadedSaveGame->unk13);

    timeRecordsScreen->playerDataMenu = playerDataMenu;
    timeRecordsScreen->timeRecords = NULL;
    timeRecordsScreen->character = 0;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unusedUnk708 = FALSE;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->unlockedCourses[i] = gLoadedSaveGame->unk7[i];
    }

    timeRecordsScreen->language = playerDataMenu->language;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_COURSES;
    
    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    TimeRecordsScreenCreateCoursesViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);
}

static void TimeRecordsScreenInitRegisters(void) {
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
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 64;

    DmaFill32(3, 0, (void *)BG_CHAR_ADDR(1), 0x40);

    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 64;

    DmaFill32(3, 0, (void *)BG_CHAR_ADDR(2), 0x40);
}

static void TimeRecordsScreenCreateCoursesViewBackgroundsUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk270 = &timeRecordsScreen->unk0;
    u8 character;
    if (timeRecordsScreen->character != 0xFF) {
        character = timeRecordsScreen->character;
    } else {
        character = 0;
    }

    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    sub_806B854(&timeRecordsScreen->coursesViewBackground,0,7,0x8B,0x1e,0x14,0,0,0,0);
    sub_806B854(&timeRecordsScreen->coursesViewCharacterBackground,1,0x16,sTimeRecordsCharacterAssets[character][ASSET_CHARACTER_BACKGROUND],9,0x14,0,1,0,0);
    sub_806B854(&timeRecordsScreen->coursesViewCharacter,2,0x1E,sTimeRecordsCharacterAssets[character][ASSET_CHARACTER],9,0x14,0,2,0,0);
}

static void TimeRecordsScreenCreateCoursesViewUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_0808B3FC_UNK240* unk284 = timeRecordsScreen->timeRecordDisplays;
    struct UNK_0808B3FC_UNK240* zoneText = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    struct UNK_0808B3FC_UNK240* actText = timeRecordsScreen->actTitle;
    struct UNK_0808B3FC_UNK240* zoneSubTitle = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    struct UNK_0808B3FC_UNK240* scrollArrow = timeRecordsScreen->choiceViewScrollArrows;
    
    u8 language = timeRecordsScreen->language;
    u8 zone = timeRecordsScreen->zone;
    u8 act = timeRecordsScreen->act;

    const struct UNK_080D95E8* zoneSubText, *titleDigit, *r0;

    s16 spriteSize;

    sub_806A568(scrollArrow,RENDER_TARGET_SCREEN,2,0x41A,0x1400,0xE,0x20,2,0,0);
    scrollArrow++;
    sub_806A568(scrollArrow,RENDER_TARGET_SCREEN,2,0x41A,0x1000,0x9C,0x20,2,0,0);
    scrollArrow++;
    sub_806A568(scrollArrow,RENDER_TARGET_SCREEN,2,0x41A,0x1000,0xD0,0x18,3,1,0);
    scrollArrow++;
    sub_806A568(scrollArrow,RENDER_TARGET_SCREEN,2,0x41A,0x1800,0xD0,0x8C,3,1,0);

    sub_806A568(unk284,RENDER_TARGET_SCREEN,0x10,0x417,0x1000,4,0x50,5,0xB,0);
    unk284++;
    sub_806A568(unk284,RENDER_TARGET_SCREEN,0x10,0x417,0x1000,0xC,0x68,5,0xC,0);
    unk284++;
    sub_806A568(unk284,RENDER_TARGET_SCREEN,0x10,0x417,0x1000,0x14,0x80,5,0xD,0);

// Might not be matching because of something to do with the data
#ifndef NON_MATCHING
    r0 = sTimeRecordsZoneActTitleDigits;
    spriteSize = MaxSpriteSize(r0, ARRAY_COUNT(sTimeRecordsZoneActTitleDigits));
#else
    temp = sub_806B8D4(sTimeRecordsZoneActTitleDigits, ARRAY_COUNT(sTimeRecordsZoneActTitleDigits));
#endif
    // render "ZONE"
    sub_806A568(zoneText,RENDER_TARGET_SCREEN,0x14,0x418,0x1000,0x10,0xC,3,0,0);
#ifndef NON_MATCHING
    asm("":"=r"(r0));
#endif

    zoneText++;
    titleDigit = &sTimeRecordsZoneActTitleDigits[zone];
#ifndef NON_MATCHING
    asm("":::"sl");
#endif
    // render zone number
    sub_806A568(zoneText,RENDER_TARGET_SCREEN,spriteSize,titleDigit->unk0,0x1000,0x5E,0xC,3,titleDigit->unk2,0);

    if (!timeRecordsScreen->isBossMode) {
        // render "ACT"
        sub_806A568(actText,RENDER_TARGET_SCREEN,0x10,0x418,0x1000,0x4E,0x20,3,1,0);
        actText++;
    
        titleDigit = &sTimeRecordsZoneActTitleDigits[act];
        // render act number
        sub_806A568(actText,RENDER_TARGET_SCREEN,spriteSize,titleDigit->unk0,0x1000,0x88,0x20,3,titleDigit->unk2,0);
    } else {
        // render "BOSS"
        sub_806A568(actText,RENDER_TARGET_SCREEN,0x14,0x418,0x1000,0x4e,0x20,3,9,0);  
    }

    if (!timeRecordsScreen->isBossMode) {
        zoneSubText = &sZoneNameTitles[language][timeRecordsScreen->zone];
    } else {
        zoneSubText = &sZoneBossTitles[language][timeRecordsScreen->zone];
    }

    // Seems like a bug, this will potentially overflow when reading
    // 7 zones, as we could already be further
    spriteSize = MaxSpriteSize(zoneSubText, 7);
    sub_806A568(zoneSubTitle,RENDER_TARGET_SCREEN,spriteSize, zoneSubText->unk0,0x1000,0x9a,0x44,3,zoneSubText->unk2,0);
}

static inline u16* LoadCourseTimes(struct TimeRecordsScreen* timeRecordsScreen) {
    u8 act;
    
     if (!timeRecordsScreen->isBossMode) {
        act = timeRecordsScreen->act;
    } else {
        act = 2;
    }

    // When the records are loaded from options we have to load the data from the options 
    // screen (though I don't understand why this wasn't done from the gLoadedSaveData)
    if (timeRecordsScreen->view != 2) {
        return timeRecordsScreen->playerDataMenu->optionsScreen->profileData.timeRecords.table[timeRecordsScreen->character][timeRecordsScreen->zone][act];
    } else {
        return timeRecordsScreen->timeRecords->table[timeRecordsScreen->character][timeRecordsScreen->zone][act];
    }
}

static void TimeRecordsScreenCreateTimesUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct TimeRecordDisplay* timeRecordDisplay = timeRecordsScreen->timeDisplays;
    // interesting optimistation, as I guess they are all the same size
    s16 digitSize = sTimeRecordDigitTiles[DELIMINATOR_DIGIT].unk4;
    struct UNK_0808B3FC_UNK240* minuteDigit, *secondDigit, *milliDigit, *deliminator;

    u16* courseTimes = LoadCourseTimes(timeRecordsScreen);
    s16 i;

    for (i = 0; i < 3; i++, timeRecordDisplay++) {
        const struct UNK_080D95E8* digit;
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
        sub_806A568(deliminator,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 48),(i * 24 + 84),8,digit->unk2,0);

        deliminator++;
        sub_806A568(deliminator,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 96),(i * 24 + 84),8,digit->unk2,0);

        digit = &sTimeRecordDigitTiles[minutes];
        sub_806A568(minuteDigit,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 0x20),(i * 24 + 84),8,digit->unk2,0);

        digit = &sTimeRecordDigitTiles[TensDigit(seconds)];
        sub_806A568(secondDigit,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 0x40),(i * 24 + 84),8,digit->unk2,0);

        secondDigit++;
        digit = &sTimeRecordDigitTiles[UnitsDigit(seconds)];
        sub_806A568(secondDigit,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 0x50),(i * 24 + 84),8,digit->unk2,0);

        digit = &sTimeRecordDigitTiles[TensDigit(millis)];
        sub_806A568(milliDigit,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 0x70),(i * 24 + 84),8,digit->unk2,0);
        
        milliDigit++;
        digit = &sTimeRecordDigitTiles[UnitsDigit(millis)];
        sub_806A568(milliDigit,RENDER_TARGET_SCREEN,digitSize,digit->unk0,0x3000,(i * 8 + 0x80),(i * 24 + 84),8,digit->unk2,0);
    }
}

static void TimeRecordsScreenRefreshTimesUI(struct TimeRecordsScreen* timeRecordsScreen) {
    // Stack has to be declared in this order to match
    struct TimeRecordDisplay* timeDisplay = timeRecordsScreen->timeDisplays;
    struct UNK_0808B3FC_UNK240* minuteDigit, *secondDigit, *milliDigit, *deliminator;
    
    u16* courseTimes = LoadCourseTimes(timeRecordsScreen);
    s16 i;

    for (i = 0; i < 3; i++, timeDisplay++) {
        const struct UNK_080D95E8* digitTile;
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
        
        minuteDigit->unkA = digitTile->unk0;
        minuteDigit->unk20 = digitTile->unk2;
        minuteDigit->unk16 = (i * 8) + 272;
        sub_8004558(minuteDigit);
        
        deliminator->unk16 = (i * 8) + 288;
        deliminator++;

        digitTile = &sTimeRecordDigitTiles[TensDigit(seconds)];
        secondDigit->unkA = digitTile->unk0;
        secondDigit->unk20 = digitTile->unk2;
        secondDigit->unk16 = (i * 8) + 304;
        sub_8004558(secondDigit);

        secondDigit++;
        digitTile = &sTimeRecordDigitTiles[UnitsDigit(seconds)];
        secondDigit->unkA = digitTile->unk0;
        secondDigit->unk20 = digitTile->unk2;
        secondDigit->unk16 = (i * 8) + 320;
        sub_8004558(secondDigit);
    
        deliminator->unk16 = (i * 8) + 336;

        digitTile = &sTimeRecordDigitTiles[TensDigit(millis)];
        milliDigit->unkA = digitTile->unk0;
        milliDigit->unk20 = digitTile->unk2;
        milliDigit->unk16 = (i * 8) + 352;
        sub_8004558(milliDigit);

        milliDigit++;
        digitTile = &sTimeRecordDigitTiles[UnitsDigit(millis)];
        milliDigit->unkA = digitTile->unk0;
        milliDigit->unk20 = digitTile->unk2;
        milliDigit->unk16 = (i * 8) + 368;
        sub_8004558(milliDigit);
    }
}

static void Task_TimeRecordsScreenHandleCharacterChange(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
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

    sub_806B854(&timeRecordsScreen->coursesViewCharacterBackground, 1, 0x16, sTimeRecordsCharacterAssets[character][0], 9, 0x14, 0, 1, 0, 0);
    sub_806B854(&timeRecordsScreen->coursesViewCharacter, 2, 0x1E, sTimeRecordsCharacterAssets[character][1], 9, 0x14, 0, 2, 0, 0);

    gCurTask->main = Task_TimeRecordsScreenCharacterChangeAnimIn;
}

static void Task_TimeRecordsScreenCharacterChangeAnimIn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);

    if (++timeRecordsScreen->animFrame < 5) {
        gBgScrollRegs[1][0] = timeRecordsScreen->animFrame * 18 - 240;
    }

    if (timeRecordsScreen->animFrame > 6) {
        gBgScrollRegs[2][0] = (timeRecordsScreen->animFrame - 6) * 18 - 240;
    }

    TimeRecordsScreenRenderCoursesViewUI(1);

    if (timeRecordsScreen->animFrame > 9) {
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
    }
}

static void Task_TimeRecordsScreenCourseChangeAnim(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
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

static void TimeRecordsScreenRenderTimeRowAnimFrame(s16 rowIndex, s16 frame) {
    // Not sure why but the struct has to be loaded like this
#ifndef NON_MATCHING
    u32 offsetA = gCurTask->structOffset + (rowIndex * sizeof(struct TimeRecordDisplay));
    register u32 offsetB asm("r2") = IWRAM_START + offsetof(struct TimeRecordsScreen, timeDisplays);
    struct TimeRecordDisplay* timeDisplay = (struct TimeRecordDisplay*)(offsetA + offsetB);
#else
    struct UNK_80637EC_UNK314* unk314 = &((struct TimeRecordsScreen*)(IWRAM_START + gCurTask->structOffset))->unk314[a];
#endif

    if (frame > 0 && frame < 9) {
        struct UNK_0808B3FC_UNK240* deliminator = timeDisplay->deliminators;
        struct UNK_0808B3FC_UNK240* minuteDigit = &timeDisplay->minute;
        struct UNK_0808B3FC_UNK240* secondDigit = timeDisplay->seconds;
        struct UNK_0808B3FC_UNK240* milliDigit = timeDisplay->millis;
        
        s16 baseXPos = (8 - frame) * 30 + (rowIndex * 8);
        minuteDigit->unk16 = baseXPos + 0x20;
        deliminator->unk16 = baseXPos + 0x30;
        deliminator++;
        deliminator->unk16 = baseXPos + 0x60;

        secondDigit->unk16 = baseXPos + 0x40;
        secondDigit++;
        secondDigit->unk16 = baseXPos + 0x50;

        milliDigit->unk16 = baseXPos + 0x70;
        milliDigit++;
        milliDigit->unk16 = baseXPos + 0x80;
    }
}

static void Task_TimeRecordsScreenCoursesViewMain(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
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
                    timeRecordsScreen->zone = NUM_ZONES - 1;
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
                        if (timeRecordsScreen->zone < NUM_ZONES - 1) {
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
                        if (timeRecordsScreen->zone >= availableCourses
                            && timeRecordsScreen->act > r5) {
                            timeRecordsScreen->zone = 0;
                            timeRecordsScreen->act = 0;
                            gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                            return;
                        }
                        else {
                            gCurTask->main = Task_TimeRecordsScreenHandleActChange;
                            return; 
                        }
                    }
                    gCurTask->main = Task_TimeRecordsScreenHandleCourseChange;
                    return;
                }

                if (timeRecordsScreen->act > 0) {
                    timeRecordsScreen->act = 0;
                    if (timeRecordsScreen->zone < NUM_ZONES - 1) {
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
                if (timeRecordsScreen->zone < NUM_ZONES - 1) {
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

static void Task_TimeRecordsScreenCharacterChangeAnimOut(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);

    timeRecordsScreen->animFrame--;

    gBgScrollRegs[1][0] = timeRecordsScreen->animFrame * 18 - 240;
    gBgScrollRegs[2][0] = timeRecordsScreen->animFrame * 18 - 240;

    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(1);

    if (timeRecordsScreen->animFrame == 0) {
        // Weird
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenHandleCharacterChange;
    }
}

static void Task_TimeRecordsScreenHandleCourseChange(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneNumber = &timeRecordsScreen->choiceViewItemsOrZoneTitle[1];
    struct UNK_0808B3FC_UNK240* unkDC = &timeRecordsScreen->actTitle[1];
    struct UNK_0808B3FC_UNK240* zoneSubtitle = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;

    u16 language = timeRecordsScreen->language;
    // zone number
    const struct UNK_080D95E8* zoneTitleText = &sTimeRecordsZoneActTitleDigits[timeRecordsScreen->zone];
    zoneNumber->unkA = zoneTitleText->unk0;
    zoneNumber->unk20 = zoneTitleText->unk2;
    
    sub_8004558(zoneNumber);

    if (!timeRecordsScreen->isBossMode) {
        zoneTitleText = &sTimeRecordsZoneActTitleDigits[timeRecordsScreen->act];
        unkDC->unkA = zoneTitleText->unk0;
        unkDC->unk20 = zoneTitleText->unk2;
        sub_8004558(unkDC);
    }

    // zone subtitle text
    if (!timeRecordsScreen->isBossMode) {
        zoneTitleText = &sZoneNameTitles[language][timeRecordsScreen->zone];
    } else {
        zoneTitleText = &sZoneBossTitles[language][timeRecordsScreen->zone];
    }

    zoneSubtitle->unkA = zoneTitleText->unk0;
    zoneSubtitle->unk20 = zoneTitleText->unk2;
    sub_8004558(zoneSubtitle);

    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(0);
    timeRecordsScreen->animFrame = 0;
    gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
}

static void Task_TimeRecordsScreenFadeToPrevious(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;
    struct PlayerDataMenu* playerDataMenu = timeRecordsScreen->playerDataMenu;
    
    u8 availableCharacters;
    bool8 allCharactersUnlocked;

    if (!sub_802D4CC(unk0)) {
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
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            CreateCharacterSelectionScreen(timeRecordsScreen->character, allCharactersUnlocked);
            break;
    }
}

static void TimeRecordsScreenRenderCoursesViewUI(u16 a) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct TimeRecordDisplay* timeRecord = timeRecordsScreen->timeDisplays;
    struct UNK_0808B3FC_UNK240* timeRecordDisplay = timeRecordsScreen->timeRecordDisplays;
    struct UNK_0808B3FC_UNK240* zoneTitleElement = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    struct UNK_0808B3FC_UNK240* actTitleElement = timeRecordsScreen->actTitle;
    struct UNK_0808B3FC_UNK240* zoneSubtitle = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    struct UNK_0808B3FC_UNK240* scrollArrows = timeRecordsScreen->choiceViewScrollArrows;

    struct UNK_0808B3FC_UNK240* minute, *secondDigit, *milliDigit, *deliminator;

    s16 visibleScrollArrows, i, j;
    s16 availableCourses = timeRecordsScreen->unlockedCourses[timeRecordsScreen->character];
    if (availableCourses == 0) {
        availableCourses = 1;
    }

    for (i = 0; i < 3; i++, timeRecordDisplay++) {
        sub_80051E8(timeRecordDisplay);
    }

    for (i = 0; i < 2; i++, zoneTitleElement++) {
        sub_80051E8(zoneTitleElement);
    }

    // No idea why j is reused here
    j = timeRecordsScreen->view != TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && 
        !a && 
        timeRecordsScreen->availableCharacters > 1 ? 
            4 : 
            2;
    visibleScrollArrows = timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && 
        availableCourses < 2 ? 
            0 : 
            j;

    for (i = 0; i < visibleScrollArrows; i++, scrollArrows++) {
        sub_8004558(scrollArrows);
        sub_80051E8(scrollArrows);
    }

    if (!timeRecordsScreen->isBossMode) {
        for (i = 0; i < 2; i++, actTitleElement++) {
            sub_80051E8(actTitleElement);
        }
    } else {
        sub_80051E8(actTitleElement);
    }

    sub_80051E8(zoneSubtitle);

    for (i = 0; i < 3; i++, timeRecord++) {
        deliminator = timeRecord->deliminators;
        minute = &timeRecord->minute;
        secondDigit = timeRecord->seconds;
        milliDigit = timeRecord->millis;

        for (j = 0; j < 2; j++, deliminator++) {
            sub_80051E8(deliminator);
        }

        sub_80051E8(minute);

        for (j = 0; j < 2; j++, secondDigit++) {
            sub_80051E8(secondDigit);
        }

        for (j = 0; j < 2; j++, milliDigit++) {
            sub_80051E8(milliDigit);
        }
    }
}

static void CreateMultiplayerRecordsScreen(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(Task_MultiplayerRecordsScreenCreateNextTableRowUI, sizeof(struct MultiplayerRecordsScreen), 0x2000, 4, NULL);
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(t);
    
    struct MultiplayerRecordRow* rows;
    struct OptionsScreenProfileData* profileData;
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
            rows[i].playerName[j] = profileData->multiplayerScores[i].unk4[j];
            if (rows[i].playerName[j] == PLAYER_NAME_END_CHAR) {
                break;
            }
        }

        for (;j < MAX_PLAYER_NAME_LENGTH; j++) {
            rows[i].playerName[j] = PLAYER_NAME_END_CHAR;
        }

        rows[i].slotFilled = profileData->multiplayerScores[i].unk10;
        rows[i].wins = profileData->multiplayerScores[i].unk11;
        rows[i].loses = profileData->multiplayerScores[i].unk12;
        rows[i].draws = profileData->multiplayerScores[i].unk13;
    }

    ResetProfileScreensVram();

    MultiplayerRecordsScreenInitRegisters();
    MultiplayerRecordsScreenCreateBackgroundsUI(multiplayerRecordsScreen);
    MultiplayerRecordsScreenCreatePlayerRowUI(multiplayerRecordsScreen);
}

static void MultiplayerRecordsScreenInitRegisters(void) {
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

static void MultiplayerRecordsScreenCreateBackgroundsUI(struct MultiplayerRecordsScreen* multiplayerRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    unk0->unk0 = 0;
    unk0->unk2 = 2;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    sub_806B854(&multiplayerRecordsScreen->backgroundTrims, 0, 7, 0x98, 0x1E, 0x14, 0, 0, 0, 0);
    sub_806B854(&multiplayerRecordsScreen->background, 1, 0x16, 0x89, 0x1E, 0x14, 0, 1, 0, 0);
}

static void MultiplayerRecordsScreenCreatePlayerRowUI(struct MultiplayerRecordsScreen* multiplayerRecordsScreen) {
    s16 i, xPos, yPos;
    struct UNK_806B908 nameCharTile;
    s16 wins, loses, draws;

    struct UNK_0808B3FC_UNK240* title = &multiplayerRecordsScreen->title;
    struct UNK_0808B3FC_UNK240* columnHeaders = &multiplayerRecordsScreen->columnHeaders;
    struct UNK_0808B3FC_UNK240* scrollArrows = multiplayerRecordsScreen->scrollArrows;
    struct UNK_0808B3FC_UNK240* playerNameDisplayChar = multiplayerRecordsScreen->playerNameDisplay;
    struct UNK_0808B3FC_UNK240* playerWinsDigit = multiplayerRecordsScreen->playerWinsDigits;
    struct UNK_0808B3FC_UNK240* playerLosesDigit = multiplayerRecordsScreen->playerLosesDigits;
    struct UNK_0808B3FC_UNK240* playerDrawsDigit = multiplayerRecordsScreen->playerDrawsDigits;

    const struct UNK_080D95E8* titleAndColumnHeadersText = sMultiplayerRecordsTitleAndColumnHeadersText[multiplayerRecordsScreen->language];
    const struct UNK_080D95E8* scrollArrowTile = sProfileNameScreenScrollArrowTiles;
    // The data is made into a pointer here but then another pointer is used for
    // the actual reference
    const struct UNK_080D95E8* digitTile, *digitTiles = sMultiplayerScoreDigitTiles;

    // title
    sub_806A568(title,RENDER_TARGET_SCREEN,titleAndColumnHeadersText->unk4,titleAndColumnHeadersText->unk0,0x1000,9,18,5,titleAndColumnHeadersText->unk2,0);

    // column headers
    titleAndColumnHeadersText++;
    sub_806A568(columnHeaders,RENDER_TARGET_SCREEN,titleAndColumnHeadersText->unk4,titleAndColumnHeadersText->unk0,0x1000,118,38,5,titleAndColumnHeadersText->unk2,0);
    
    sub_806A568(scrollArrows,RENDER_TARGET_SCREEN,scrollArrowTile->unk4,scrollArrowTile->unk0,0x1000,8,0x4E,0xD,scrollArrowTile->unk2,0);
    scrollArrows++;
    scrollArrowTile++;
    sub_806A568(scrollArrows,RENDER_TARGET_SCREEN,scrollArrowTile->unk4,scrollArrowTile->unk0,0x1000,8,0x88,0xD,scrollArrowTile->unk2,0);


    for (i = 0, xPos = 34, yPos = 58; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++, xPos+= 12) {
        u16 nameChar = multiplayerRecordsScreen->playerName[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(
            playerNameDisplayChar, 
            RENDER_TARGET_SCREEN, 
            nameCharTile.unk0,
            nameCharTile.unk4,
            0x1000,
            xPos, 
            yPos,
            5,
            nameCharTile.unk6,
            0
        );
    }

    wins = multiplayerRecordsScreen->playerWins;
    loses = multiplayerRecordsScreen->playerLoses;
    draws = multiplayerRecordsScreen->playerDraws;

    digitTile = &digitTiles[TensDigit(wins)];
    sub_806A568(playerWinsDigit,RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0x7C,0x40,0xD,digitTile->unk2,0);

    playerWinsDigit++;
    digitTile = &digitTiles[UnitsDigit(wins)];
    sub_806A568(playerWinsDigit,RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0x84,0x40,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[TensDigit(loses)];
    sub_806A568(playerLosesDigit,RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xA4,0x40,0xD,digitTile->unk2,0);

    playerLosesDigit++;
    digitTile = &digitTiles[UnitsDigit(loses)];
    sub_806A568(playerLosesDigit,RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xAC,0x40,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[TensDigit(draws)];
    sub_806A568(playerDrawsDigit,RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xCC,0x40,0xD,digitTile->unk2,0);

    playerDrawsDigit++;
    digitTile = &digitTiles[UnitsDigit(draws)];
    sub_806A568(playerDrawsDigit,RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xD4,0x40,0xD,digitTile->unk2,0);
}

static void MultiplayerRecordsScreenCreateTableRowUI(s16 rowIndex) { 
    s16 loses, draws, wins, j, xPos, yPos;
    struct UNK_0808B3FC_UNK240 *nameDisplayChar;

    struct UNK_806B908 nameCharTile;

    struct MultiplayerRecordRow* row = &((struct MultiplayerRecordsScreen*)(IWRAM_START + gCurTask->structOffset))->table->rows[rowIndex];
    const struct UNK_080D95E8 *digitTile, *digitTiles = sMultiplayerScoreDigitTiles;

    if (!row->slotFilled) {
        return;
    }

    yPos = rowIndex * 18 + 90;
    nameDisplayChar = row->nameDisplay;
    
    for (j = 0, xPos = 34; j < MAX_PLAYER_NAME_LENGTH; j++, nameDisplayChar++, xPos+= 12) {
        u16 nameChar = row->playerName[j];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 17;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(
            nameDisplayChar, 
            RENDER_TARGET_SCREEN, 
            nameCharTile.unk0,
            nameCharTile.unk4,
            0x2000,
            xPos, 
            yPos,
            5,
            nameCharTile.unk6,
            0
        );
    }

    wins = row->wins;
    loses = row->loses;
    draws = row->draws;
    yPos += 6; 

    digitTile = &digitTiles[TensDigit(wins)];
    sub_806A568(&row->winsDigits[0],RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0x7C,yPos,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[UnitsDigit(wins)];
    sub_806A568(&row->winsDigits[1],RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0x84,yPos,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[TensDigit(loses)];
    sub_806A568(&row->losesDigits[0],RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xA4,yPos,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[UnitsDigit(loses)];
    sub_806A568(&row->losesDigits[1],RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xAC,yPos,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[TensDigit(draws)];
    sub_806A568(&row->defeatsDigits[0],RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xCC,yPos,0xD,digitTile->unk2,0);

    digitTile = &digitTiles[UnitsDigit(draws)];
    sub_806A568(&row->defeatsDigits[1],RENDER_TARGET_SCREEN,digitTile->unk4,digitTile->unk0,0x2000,0xD4,yPos,0xD,digitTile->unk2,0);
}

static void Task_MultiplayerRecordsScreenMain(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);
    struct MultiplayerRecordRow* rows = multiplayerRecordsScreen->table->rows;

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

static void Task_MultiplayerRecordsScreenScrollAnim(void) {
    struct MultiplayerRecordRow* row;
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);
    
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
        struct UNK_0808B3FC_UNK240* unk10, *unk130, *unk190, *unk1F0;
        
        unk10 = row->nameDisplay;
        for (j = 0; j < 6; j++, unk10++) {
            unk10->unk18 = yPos;
        }

        unk130 = row->winsDigits;
        for (j = 0; j < 2; j++, unk130++) {
            unk130->unk18 = yPos + 6;
        }

        unk190 = row->losesDigits;
        for (j = 0; j < 2; j++, unk190++) {
            unk190->unk18 = yPos + 6;
        }

        unk1F0 = row->defeatsDigits;
        for (j = 0; j < 2; j++, unk1F0++) {
            unk1F0->unk18 = yPos + 6;
        }
    }

    MultiplayerRecordsScreenRenderUI();

    if (multiplayerRecordsScreen->scrollAnimFrame > 8) {
        multiplayerRecordsScreen->scrollAnimFrame = 0;
        gCurTask->main = Task_MultiplayerRecordsScreenMain;
    }
}

static void MultiplayerRecordsScreenRenderUI(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* title = &multiplayerRecordsScreen->title;
    struct UNK_0808B3FC_UNK240* columnHeaders = &multiplayerRecordsScreen->columnHeaders;
    struct UNK_0808B3FC_UNK240* playerNameDisplayChar = multiplayerRecordsScreen->playerNameDisplay;
    struct UNK_0808B3FC_UNK240* playerWinsDigit = multiplayerRecordsScreen->playerWinsDigits;
    struct UNK_0808B3FC_UNK240* playerLosesDigit = multiplayerRecordsScreen->playerLosesDigits;
    struct UNK_0808B3FC_UNK240* playerDrawsDigit = multiplayerRecordsScreen->playerDrawsDigits;
    struct UNK_0808B3FC_UNK240* scrollArrow;

    // recordsTable completely unused in this var, but needs to be assigned to match
    struct MultiplayerRecordsTable* recordsTable = multiplayerRecordsScreen->table;
    struct MultiplayerRecordRow* row;
    
    s16 i, j;
    s16 numVisibleRows = MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS + 1;

    sub_80051E8(title);
    sub_80051E8(columnHeaders);

    scrollArrow = multiplayerRecordsScreen->scrollArrows;
    sub_8004558(scrollArrow);
    scrollArrow++;
    sub_8004558(scrollArrow);
    scrollArrow--;

    if (multiplayerRecordsScreen->scrollIndex > 0) {
        sub_80051E8(scrollArrow);
    }
    scrollArrow++;
    
    // Maybe they meant to use the assignment here
    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->scrollIndex + MULTIPLAYER_RECORDS_SCREEN_NUM_VISIBLE_ROWS];
    if (multiplayerRecordsScreen->scrollIndex < MULTIPLAYER_RECORDS_SCREEN_MAX_SCROLL_INDEX && row->slotFilled) {
        sub_80051E8(scrollArrow);
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++) {
        sub_80051E8(playerNameDisplayChar);
    }

    for (i = 0; i < 2; i++, playerWinsDigit++) {
        sub_80051E8(playerWinsDigit);
    }

    for (i = 0; i < 2; i++, playerLosesDigit++) {
        sub_80051E8(playerLosesDigit);
    }

    for (i = 0; i < 2; i++, playerDrawsDigit++) {
        sub_80051E8(playerDrawsDigit);
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
            sub_80051E8(playerNameDisplayChar);
        }

        playerWinsDigit = row->winsDigits;
        playerLosesDigit = row->losesDigits;
        playerDrawsDigit = row->defeatsDigits;

        sub_80051E8(playerWinsDigit);
        ++playerWinsDigit;
        sub_80051E8(playerWinsDigit);

        sub_80051E8(playerLosesDigit);
        ++playerLosesDigit;
        sub_80051E8(playerLosesDigit);

        sub_80051E8(playerDrawsDigit);
        ++playerDrawsDigit;
        sub_80051E8(playerDrawsDigit);
    }
}

// Some sort of register menu item function
// used in sound test, but wonder why it wasn't split out
void sub_806A568(struct UNK_0808B3FC_UNK240* obj, s8 target, u32 size, u16 c, u32 assetId, s16 xPos, s16 yPos, u16 g, u8 h, u8 focused) {
    struct UNK_0808B3FC_UNK240 newObj;
    struct UNK_0808B3FC_UNK240* element;
    element = &newObj;
   
    if (obj != NULL) {
        element = obj;
    }

    if (target != RENDER_TARGET_SCREEN) {
        if (gProfileScreenSubMenuNextVramAddress == NULL) {
            gProfileScreenSubMenuNextVramAddress = gProfileScreenNextVramAddress;
        }
        element->unk4 = gProfileScreenSubMenuNextVramAddress;
    } else {
        element->unk4 = gProfileScreenNextVramAddress;
    }
    
    element->unk8 = 0;
    element->unkA = c;
    element->unk10 = assetId;
    element->unk16 = xPos;
    element->unk18 = yPos;
    element->unk1A = g << 6;
    element->unk1C = 0;
    element->unk1E = 0xffff;
    element->unk20 = h;
    element->unk21 = 0xff;
    element->unk22 = 0x10;
    element->unk25 = focused;
    element->unk28 = -1;

    sub_8004558(element);

    switch(target) {
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
static inline bool16 sub_806A664_A(s16 mode, u16 inputCharacter) {
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
static u16 sub_806A664(s16 mode, u16 inputCharacter) {
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

static void OptionsScreenTaskDestroyHandler(struct Task* optionsScreenTask) {
    // unimplemented
}

static void Task_OptionsScreenShow(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);

    OptionsScreenInitRegisters(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    SetupOptionScreenBackgroundsUI(optionsScreen);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    gCurTask->main = Task_OptionScreenFadeIn;
}

static void SetupOptionScreenBackgroundsUI(struct OptionsScreen* optionsScreen) {
    SetupOptionScreenBackgrounds(optionsScreen->background, optionsScreen->subMenuBackground);
}

static void Task_OptionScreenFadeIn(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static void OptionsScreenOpenSelectedSubMenu(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);

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

static void Task_OptionsScreenWaitForSubMenuExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    if (optionsScreen->state < OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN) {
        OptionsScreenRenderUI();
    }

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_ACTIVE) {
        optionsScreen->subMenuAnimFrame = 0;
        gCurTask->main = Task_OptionsScreenSubMenuCloseAnim;
    }
}

/** Menu 1 **/

static void OptionsScreenShowLanguageScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_OptionsScreenFadeOutToLanguageScreen;
}

static void Task_OptionsScreenFadeOutToLanguageScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        CreateEditLanguageScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForLanguageScreenExit;
    }
}

static void Task_OptionsScreenFadeInFromLanguageScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }   
}

/** Menu 2 **/

static void OptionsScreenShowSoundTestScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_OptionScreenFadeOutToSoundTest;
}

static void Task_OptionScreenFadeOutToSoundTest(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        CreateSoundTestScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForSoundTestExit;
    }
}

static void Task_OptionsScreenFadeInFromSoundTest(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Menu 3 **/

static void OptionsScreenShowDeleteScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_OptionsScreenFadeOutToDeleteScreen;
}

static void Task_OptionsScreenFadeOutToDeleteScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        CreateDeleteScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForDeleteScreenExit;
    }
}

static void Task_OptionsScreenFadeInFromDeleteScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Player Data Menu 1 **/

static void PlayerDataMenuShowProfileNameScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_PlayerDataMenuFadeOutToProfileNameScreen;
}

static void Task_PlayerDataMenuFadeOutToProfileNameScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        CreateEditProfileNameScreen(playerDataMenu);
        playerDataMenu->state = PLAYER_DATA_MENU_STATE_SCREEN_OPEN;
        playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;
        gCurTask->main = Task_PlayerDataMenuWaitForProfileNameScreenExit;
    }
}

static void Task_PlayerDataMenuFadeInFromProfileNameScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnimWait;
    }
}

/** Player Data Menu 2 **/

static void PlayerDataMenuShowTimeRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_PlayerDataMenuFadeOutToTimeRecordsScreen;
}

static void Task_PlayerDataMenuFadeInFromTimeRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnimWait;
    }
}

/** Player Data Menu 3 **/

static void PlayerDataMenuShowMultiplayerRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen;
}

static void Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        CreateMultiplayerRecordsScreen(playerDataMenu);
        playerDataMenu->state = PLAYER_DATA_MENU_STATE_SCREEN_OPEN;
        playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;
        gCurTask->main = Task_PlayerDataMenuWaitForMultiplayerRecordsScreenExit;
    }
}

static void Task_PlayerDataMenuFadeInFromMultiplayerRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnimWait;
    }
}

static void OptionsScreenHandleExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_OptionsScreenFadeOutAndExit;
}

static void Task_OptionsScreenFadeOutAndExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    if (!sub_802D4CC(unk270)) {
        OptionsScreenRenderUI();
        return;
    }

    StoreProfileData(optionsScreen);
    WriteSaveGame();
    TasksDestroyAll();
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;
    CreateTitleScreenAtSinglePlayerMenu();
}

static void PlayerDataMenuRenderUI(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask);

    struct UNK_0808B3FC_UNK240* headerFooter = playerDataMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* menuItem = playerDataMenu->menuItems;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &playerDataMenu->menuItemOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        sub_80051E8(headerFooter);
    }

    for (i = 0; i < NUM_PLAYER_DATA_MENU_ITEMS; i++, menuItem++) {
        sub_80051E8(menuItem);
    }

    sub_80051E8(menuItemOutline);
}

static void CreateDifficultyMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(Task_DifficultyMenuOpenAnimWait, sizeof(struct SwitchMenu), 0x2000, 4, NULL);
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(t);
    
    difficultyMenu->optionsScreen = optionsScreen;
    difficultyMenu->switchValue = optionsScreen->difficultyLevel;
    difficultyMenu->language = optionsScreen->language;
    difficultyMenu->animFrame = 0;

    DifficultyMenuCreateUI(difficultyMenu);
}

static void DifficultyMenuRenderUI(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = difficultyMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* difficultyOption = difficultyMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &difficultyMenu->switchValueOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        sub_80051E8(headerFooter);
    }

    for (i = 0; i < 2; i++, difficultyOption++) {
        sub_80051E8(difficultyOption);
    }

    sub_80051E8(switchValueOutline);
}

static void CreateTimeLimitMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(Task_TimeLimitMenuOpenAnimWait, sizeof(struct SwitchMenu), 0x2000, 4, 0);
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(t);

    timeLimitMenu->optionsScreen = optionsScreen;
    timeLimitMenu->switchValue = optionsScreen->timeLimitEnabled;
    timeLimitMenu->language = optionsScreen->language;
    timeLimitMenu->animFrame = 0;
    TimeLimitMenuCreateUI(timeLimitMenu);
}

static void TimeLimitMenuRenderUI(void) {
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* headerFooter = timeLimitMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* option = timeLimitMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &timeLimitMenu->switchValueOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        sub_80051E8(headerFooter);
    }

    for (i = 0; i < 2; i++, option++) {
        sub_80051E8(option);
    }

    sub_80051E8(switchValueOutline);
}

static void Task_ButtonConfigMenuHandleStartOver(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* scrollArrow = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* controlFocus = &buttonConfigMenu->controlFocus;
    
    controlFocus->unk18 = 42;

    scrollArrow->unk18 = 53;
    scrollArrow++;
    scrollArrow->unk18 = 53;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuAButtonMain;
}

static void Task_ButtonConfigMenuHandleAButtonComplete(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->controlFocus;
    
    unk214->unk18 = 66;
    unk1B4->unk18 = 77;
    unk1B4++;
    unk1B4->unk18 = 77;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuBButtonMain;
}

static void Task_ButtonConfigMenuHandleBButtonComplete(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->scrollArrows;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->controlFocus;
    
    unk214->unk18 = 90;

    unk1B4->unk18 = 180;
    unk1B4++;
    unk1B4->unk18 = 180;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuRShoulderMain;
}

static void CreateEditLanguageScreen(struct OptionsScreen* optionScreen) {
    struct Task* t = TaskCreate(Task_LanguageScreenFadeIn, sizeof(struct LanguageScreen), 0x2000, 4, NULL);
    struct LanguageScreen* languageScreen = TaskGetStructPtr(t);

    languageScreen->optionsScreen = optionScreen;
    languageScreen->menuCursor = optionScreen->language;
    languageScreen->creatingNewProfile = FALSE;

    ResetProfileScreensVram();

    LanguageScreenInitRegisters(languageScreen);
    LanguageScreenCreateBackgroundsUI(languageScreen);
    LanguageScreenCreateUI(languageScreen);
}

static void LanguageScreenCreateBackgroundsUI(struct LanguageScreen* languageScreen) {
    sub_806B854(&languageScreen->unk1B0,0,7,0x86,0x1E,0x14,0,0,0,0);
}

static void Task_LanguageScreenFadeIn(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk1F0 = &languageScreen->unk1F0;

    LanguageScreenRenderUI();
    ReseedRng();

    if (sub_802D4CC(unk1F0)) {
        gCurTask->main = Task_LanguageScreenMain;
    }
}


static void LanguageScreenHandleExit(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk1F0 = &languageScreen->unk1F0;
    unk1F0->unk0 = 0;
    unk1F0->unk2 = 1;
    unk1F0->unk4 = 0;
    unk1F0->unk6 = 0x100;
    unk1F0->unkA = 0;
    unk1F0->unk8 = 0xFF;

    sub_802D4CC(unk1F0);
    gCurTask->main = Task_LanguageScreenFadeOutAndExit;
}

static void Task_LanguageScreenFadeOutAndExit(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk1F0 = &languageScreen->unk1F0;
    ReseedRng();

    if (!sub_802D4CC(unk1F0)) {
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

static void ReseedRng(void) {
    ShuffleRngSeed();
}

static void LanguageScreenRenderUI(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* headerFooter = languageScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* languageOption = languageScreen->languageOptions;
    struct UNK_0808B3FC_UNK240* optionOutline = &languageScreen->optionOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        sub_80051E8(headerFooter);
    }

    for (i = 0; i < NUM_LANGUAGES; i++, languageOption++) {
        sub_80051E8(languageOption);
    }

    sub_80051E8(optionOutline);
}

static void DeleteScreenCreateBackgroundsUI(struct DeleteScreen* deleteScreen) {
    sub_806B854(&deleteScreen->background,0,7,0x86,0x1e,0x14,0,0,0,0);
}

static void Task_DeleteScreenFadeIn(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk130 = &deleteScreen->unk130;
    DeleteScreenRenderUI();
    if (sub_802D4CC(unk130)) {
        gCurTask->main = Task_DeleteScreenConfrimationMain;
    }
}

static void Task_DeleteScreenHandleExit(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk130 = &deleteScreen->unk130;

    DeleteScreenRenderUI();

    unk130->unk0 = 0;
    unk130->unk2 = 1;
    unk130->unk4 = 0;
    unk130->unk6 = 0x100;
    unk130->unkA = 0;
    unk130->unk8 = 0xFF;

    sub_802D4CC(unk130);
    gCurTask->main = Task_DeleteScreenFadeOutAndExit;
}

static void DeleteScreenRenderUI(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* headerFooter = deleteScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* unk60 = deleteScreen->options;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteScreen->optionOutline;

    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        sub_80051E8(headerFooter);
    }

    for (i = 0; i < 2; i++, unk60++) {
        sub_80051E8(unk60);
    }

    sub_80051E8(unkC0);
}

static void Task_ProfileNameScreenFadeIn(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;

    ProfileNameScreenRenderUI();

    if (sub_802D4CC(unk140)) {
        profileNameScreen->matrixCursorIndex = 0;
        gCurTask->main = Task_ProfileNameScreenMain;
    }
}

UNUSED static void TimeRecordsScreenShowChoiceView(struct TimeRecordsScreen* timeRecordsScreen) {
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    ResetProfileScreensVram();

    TimeRecordScreenInitRegisters();
    TimeRecordsScreenCreateChoiceViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateChoiceViewUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenChoiceViewFadeIn;
}

static void Task_TimeRecordsScreenChoiceViewFadeIn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    TimeRecordsScreenRenderModeChoiceUI();

    if (sub_802D4CC(unk0)) {
        gCurTask->main = Task_TimeRecordsScreenModeChoiceMain;
    }
}

static void TimeRecordsScreenHandleExit(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = Task_TimeRecordsScreenFadeOutAndExit;
}

static void Task_TimeRecordsScreenFadeOutAndExit(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;
    struct PlayerDataMenu* playerDataMenu = timeRecordsScreen->playerDataMenu;

    if (!sub_802D4CC(unk0)) {
        TimeRecordsScreenRenderModeChoiceUI();
        return;
    }
 
    playerDataMenu->state = PLAYER_DATA_MENU_STATE_ACTIVE;
    TaskDestroy(gCurTask);
}

static void TimeRecordsScreenShowCoursesView(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = TimeRecordsScreenFadeOutToCoursesView;
}

static void TimeRecordsScreenFadeOutToCoursesView(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    if (!sub_802D4CC(unk0)) {
        TimeRecordsScreenRenderModeChoiceUI();
        return;
    }

    TimeRecordsScreenCreateCoursesView(timeRecordsScreen);
}

static void TimeRecordsScreenRenderModeChoiceUI(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);

    struct UNK_0808B3FC_UNK240* title = &timeRecordsScreen->choiceViewTitleOrZoneSubtitle;
    struct UNK_0808B3FC_UNK240* scrollArrows = timeRecordsScreen->choiceViewScrollArrows;
    struct UNK_0808B3FC_UNK240* choiceItem = timeRecordsScreen->choiceViewItemsOrZoneTitle;
    s16 i;

    sub_80051E8(title);

    for (i = 0; i < 2; i++, choiceItem++) {
        sub_80051E8(choiceItem);
    }

    for (i = 0; i < 2; i++, scrollArrows++) {
        sub_8004558(scrollArrows);
        sub_80051E8(scrollArrows);
    }
}

static void TimeRecordsScreenCreateCoursesView(struct TimeRecordsScreen* timeRecordsScreen) {
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    TimeRecordsScreenCreateCoursesViewBackgroundsUI(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenCreateTimesUI;
}

static void Task_TimeRecordsScreenCreateTimesUI(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    TimeRecordsScreenCreateTimesUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenCoursesViewFadeIn;
}

static void Task_TimeRecordsScreenCoursesViewFadeIn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;
    TimeRecordsScreenRenderCoursesViewUI(0);
    
    if (sub_802D4CC(unk0)) {
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenCoursesViewMain;
    }
}

static void Task_TimeRecordsScreenHandleActChange(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* unkDC = &timeRecordsScreen->actTitle[1];

    const struct UNK_080D95E8* unk5E8 = &sTimeRecordsZoneActTitleDigits[timeRecordsScreen->act];

    unkDC->unkA = unk5E8->unk0;
    unkDC->unk20 = unk5E8->unk2;

    sub_8004558(unkDC);
    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(0);

    timeRecordsScreen->animFrame = 0;
    gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
}

static void Task_TimeRecordsScreenHandleCourseSelected(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = Task_TimeRecordsScreenFadeOutToSelectedCourse;
}

static void Task_TimeRecordsScreenFadeOutToSelectedCourse(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0; 

    if (!sub_802D4CC(unk0)) {
        TimeRecordsScreenRenderCoursesViewUI(0);
        return;
    } 

    gCurrentLevel = TO_LEVEL_INDEX(timeRecordsScreen->zone, timeRecordsScreen->isBossMode ? BOSS_ACT : timeRecordsScreen->act);

    EwramFree(timeRecordsScreen->timeRecords);
    TaskDestroy(gCurTask);
    sub_801A770();
}

static void TimeRecordsScreenHandleReturn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = Task_TimeRecordsScreenFadeToPrevious;
}

static void Task_MultiplayerRecordsScreenCreateNextTableRowUI(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);

    MultiplayerRecordsScreenCreateTableRowUI(multiplayerRecordsScreen->scrollAnimFrame);

    if (++multiplayerRecordsScreen->scrollAnimFrame >= 10) {
        multiplayerRecordsScreen->scrollAnimFrame = 0;
        gCurTask->main = Task_MultiplayerRecordsScreenFadeIn;
    }
}

static void Task_MultiplayerRecordsScreenFadeIn(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    MultiplayerRecordsScreenRenderUI();

    if (sub_802D4CC(unk0)) {
        gCurTask->main = Task_MultiplayerRecordsScreenMain;
    }
}

static void Task_MultiplayerRecordsScreenHandleExit(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = Task_MultiplayerRecordsScreenFadeOutAndExit;
}

static void Task_MultiplayerRecordsScreenFadeOutAndExit(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    struct PlayerDataMenu* playerDataMenu = multiplayerRecordsScreen->playerDataMenu;

    if (!sub_802D4CC(unk0)) {
        MultiplayerRecordsScreenRenderUI();
        return;
    }

    EwramFree(multiplayerRecordsScreen->table);
    playerDataMenu->state = PLAYER_DATA_MENU_STATE_ACTIVE;
    TaskDestroy(gCurTask);
}

void sub_806B854(struct Unk_03002400* unk2400, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f, u8 g, u16 h, u16 i) {
    unk2400->unk4 = BG_CHAR_ADDR(a);
    unk2400->unkA = 0;
    unk2400->unkC = BG_SCREEN_ADDR(b);
    unk2400->unk18 = 0;
    unk2400->unk1A = 0;
    unk2400->unk1C = assetId;
    unk2400->unk1E = 0;
    unk2400->unk20 = 0;
    unk2400->unk22 = 0;
    unk2400->unk24 = 0;
    unk2400->unk26 = d;
    unk2400->unk28 = e;
    unk2400->unk2A = f;
    unk2400->unk2B = 0;
    unk2400->unk2C = 0;
    unk2400->unk2E = g;
    unk2400->unk30 = h;
    unk2400->unk32 = i;
    sub_8002A3C(unk2400);
}

// Finds the max unk4 of the item text array
static s32 MaxSpriteSize(const struct UNK_080D95E8* itemText, s8 length) {
    s32 result = 0;
    s16 i;

    for (i = 0; i < length; i++, itemText++) {
        if (itemText->unk4 > result) {
            result = itemText->unk4;
        }
    }

    return result;
}

static struct UNK_806B908 sub_806B908(u16 nameChar) {
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

static bool16 sub_806B988(u16* playerName) {
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

static bool16 sub_806B9C8(u16 nameChar) {
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

static bool16 sub_806BA14(s16 a, u16 b) {
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
