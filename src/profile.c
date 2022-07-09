#include "global.h"
#include "profile.h"
#include "m4a.h"
#include "task.h"
#include "input.h"
#include "save.h"
#include "malloc_ewram.h"
#include "random.h"
#include "sprite.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "data.h"
#include "title_screen.h"
#include "game.h"
#include "sound_test.h"
#include "ui.h"

// vram addresses
extern void* gProfileScreenNextVramAddress;
extern void* gProfileScreenSubMenuNextVramAddress;

// CreateOptionsScreen stuff
static void Task_ShowOptionsScreen(void);
static void OptionsScreenTaskDestroyHandler(struct Task*);

static void GetProfileData(struct OptionsScreen*);

static void Task_TimeRecordsScreenCreateTimesUI(void);
static void TimeRecordsScreenInitRegisters(void);
static void sub_8068700(struct TimeRecordsScreen*);
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

static void Task_PlayerDataMenuOpenAnim(void);
static void CreatePlayerDataMenuUI(struct PlayerDataMenu*);

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
static void sub_806AF10(void);
static void Task_TimeLimitMenuMain(void);

static void sub_8065A50(void);
static void Task_ButtonConfigMenuOpenAnim(void);
static void ButtonConfigMenuCreateUI(struct ButtonConfigMenu*);
static void ButtonConfigMenuRenderUI(void);
static void Task_ButtonConfigMenuMain(void);
static void sub_806AFAC(void);
static void sub_8066718(void);
static void sub_80665D8(void);
static void sub_806AFEC(void);
static void sub_806AF6C(void);

static void ReseedRng(void);
static void LanguageScreenHandleLanguageChanged(void);
static void RenderLanguageScreenUI(void);
static void LanguageScreenHandleExit(void);

static void Task_DeleteScreenFadeIn(void);
static void sub_8066D90(struct DeleteScreen*);
static void sub_806B258(struct DeleteScreen*);
static void CreateDeleteScreenUI(struct DeleteScreen*);

static void DeleteScreenRenderUI(void);
static void Task_DeleteScreenCreateAbsoluteConfirmation(void);
static void Task_DeleteScreenHandleExit(void);

static void Task_DeleteScreenAbsoluteConfirmationMain(void);

static void ProfileNameScreenRenderUI(void);
static bool16 ProfileNameScreenHandleShoulderInput(void);
static bool16 ProfileNameScreenHandleDpadInput(void);
static u16 sub_806A664(s16, u16);
static void ProfileNameScreenInputComplete(void);
static void ProfileNameScreenHandleExit(void);

static void Task_TimeRecordsScreenChoiceViewFadeIn(void);
static void sub_80682AC(void);
static void sub_80682EC(struct TimeRecordsScreen*);
static void TimeRecordsScreenCreateModeChoiceUI(struct TimeRecordsScreen*);

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
static void sub_8069B40(void);
static void sub_8069B88(struct MultiplayerRecordsScreen*);
static void MultiplayerRecordsScreenCreatePlayerRecordRowUI(struct MultiplayerRecordsScreen*);

static void sub_806A1D0(void);
static void MultiplayerRecordsScreenRenderUI(void);
static void Task_MultiplayerRecordsScreenHandleExit(void);

static void Task_OptionScreenFadeIn(void);
static void sub_806A794(struct OptionsScreen*);

static void CreateDifficultyMenu(struct OptionsScreen*);
static void CreateTimeLimitMenu(struct OptionsScreen*);

static void Task_OptionsScreenFadeOutToLanguageScreen(void);
static void CreateEditLanguageScreen(struct OptionsScreen*);
static void Task_OptionScreenFadeOutToSoundTest(void);
static void Task_OptionsScreenFadeOutToDeleteScreen(void);
static void Task_PlayerDataMenuFadeOutToProfileNameScreen(void);
static void Task_PlayerDataMenuFadeOutToMultiplayerRecordsScreen(void);
static void Task_OptionsScreenFadeOutAnimAndSave(void);

static void sub_8072484(void);
static void Task_LanguageScreenFadeOutAndExit(void);
static void Task_TimeRecordsScreenFadeOutAndExit(void);
static void TimeRecordsScreenFadeOutToCoursesView(void);
static void TimeRecordsScreenCreateCoursesView(struct TimeRecordsScreen*);
static void Task_TimeRecordsScreenCoursesViewFadeIn(void);
static void Task_TimeRecordsScreenFadeOutToSelectedCourse(void);
static void Task_MultiplayerRecordsScreenFadeIn(void);
static void Task_MultiplayerRecordsScreenFadeOutAndExit(void);

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

#define OPTIONS_SCREEN_STATE_ACTIVE 0
#define OPTIONS_SCREEN_STATE_SUB_MENU_OPEN 1
#define OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN 2

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

#define NAME_SCREEN_COMPLETE_ACTION_START_GAME 2
#define NAME_SCREEN_COMPLETE_ACTION_MULTIPLAYER 1

#define LanguageIndex(lang) (lang - 1)

#define TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE 0
#define TIME_RECORDS_SCREEN_VIEW_COURSES 1
#define TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK 2

#define RENDER_TARGET_SCREEN 0
#define RENDER_TARGET_SUB_MENU 1

#define DELETE_SCREEN_CONFIRMATION_YES 0
#define DELETE_SCREEN_CONFIRMATION_NO 1

#define MULTIPLAYER_RECORDS_SCREEN_NUM_RECORD_ROWS 9

#define ResetProfileScreensVram() ({ \
    gProfileScreenNextVramAddress = (void*)OBJ_VRAM0; \
    gProfileScreenSubMenuNextVramAddress = NULL; \
})

#define ResetProfileScreensSubMenuVram() ({ \
    gProfileScreenSubMenuNextVramAddress = NULL; \
})

extern const struct UNK_080D95E8 sOptionsScreenTitleText[6];
extern const struct UNK_080D95E8 sOptionsScreenMenuItemsText[6][8];
extern const struct UNK_080D95E8 sDifficultyLevelSwitchValues[6][2];
extern const struct UNK_080D95E8 sTimeLimitMenuSwitchValues[6][2];
extern const struct UNK_080D95E8 sOptionsScreenSelectedLanguageText[6];
extern const struct UNK_080D95E8 gUnknown_080D9948[6][3];
extern const struct UNK_080D95E8 gUnknown_080D99D8[3];
extern const struct UNK_080D95E8 gUnknown_080D99F0[6][3];

extern const s16 gUnknown_080D9550[8];
extern const s8 gUnknown_080D9540[2][8];
extern const s16 gUnknown_080D9570[8];

extern const struct UNK_080D95E8 sPlayerDataMenuTitleText[6];
extern const struct UNK_080D95E8 sPlayerDataMenuControlsText[6];
extern const struct UNK_080D95E8 sPlayerDataMenuItemsText[6][4];
extern const struct UNK_080D95E8 sDifficultyMenuTitleText[6];
extern const struct UNK_080D95E8 sDifficultyMenuControlsText[6];
extern const struct UNK_080D95E8 sTimeLimitMenuTitleText[6];
extern const struct UNK_080D95E8 sTimeLimitMenuControlsText[6];

extern const struct UNK_080D95E8 sLanguageScreenTitles[6];
extern const struct UNK_080D95E8 sLanguageScreenNewControlsText[6];
extern const struct UNK_080D95E8 gUnknown_080D9B10[6];
extern const struct UNK_080D95E8 sLanguageScreenEditControlsText[6];

extern const struct UNK_080D95E8 gUnknown_080D9B40[6];
extern const struct UNK_080D95E8 gUnknown_080D9BA0[6];
extern const struct UNK_080D95E8 gUnknown_080D9BD0[6][2];

extern const struct UNK_080D95E8 sDeleteScreenAbsoluteConfirmationMessages[6];

extern const struct UNK_080D95E8 sProfileNameScreenNewTitleText[6];
extern const struct UNK_080D95E8 sProfileNameScreenEditTitleText[6];
extern const struct UNK_080D95E8 sProfileNameScreenArrowTiles[2];
extern const struct UNK_080D95E8 sProfileNameScreenEndButtonText[6];

extern const struct UNK_080D95E8 sScrollArrowTiles[2];

extern const struct UNK_080D95E8 gUnknown_080D9EB0[6];
extern const struct UNK_080D95E8 gUnknown_080D9EE0[6][2];
extern const u16 gUnknown_080D9590[5][2];
extern const struct UNK_080D95E8 gUnknown_080D9F40[7];
extern const struct UNK_080D95E8 gUnknown_080D9FD0[6][7];
extern const struct UNK_080D95E8 gUnknown_080DA120[6][7];
extern const struct UNK_080D95E8 sTimeRecordDigitTiles[11];
extern const u8 gMillisLookup[60][2];

extern const struct UNK_080D95E8 gUnknown_080D9E00[6][2];
extern const struct UNK_080D95E8 gUnknown_080D9E60[10];

void CreateOptionsScreen(u16 p1) {
    struct Task* t;
    struct OptionsScreen* optionsScreen;
    s16 i;

    m4aSongNumStart(MUS_OPTIONS);

    t = TaskCreate(Task_ShowOptionsScreen, sizeof(struct OptionsScreen), 0x1000, TASK_x0004, OptionsScreenTaskDestroyHandler);
    optionsScreen = TaskGetStructPtr(t, optionsScreen);

    GetProfileData(optionsScreen);

    optionsScreen->unk358 = p1;
    optionsScreen->subMenuXPos = 0;
    optionsScreen->unk781 = 0;
    optionsScreen->subMenuAnimFrame = 0;
    optionsScreen->menuCursor = 0;
    optionsScreen->unk782 = 0xFF;

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
void CreateTimeAttackSelectionScreen(bool16 isBossView, u16 selectedCharacter) {
    struct Task* t = TaskCreate(Task_TimeRecordsScreenCreateTimesUI, sizeof(struct TimeRecordsScreen), 0x2000, TASK_x0004, NULL);
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(t, timeRecordsScreen);
    s16 i;

    for (i = 1; i < NUM_CHARACTERS; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    timeRecordsScreen->playerDataMenu = 0;
    timeRecordsScreen->timeRecords = EwramMallocStruct(struct TimeRecords);
    timeRecordsScreen->character = selectedCharacter;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unk708 = 0;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->characterZones[i] = gLoadedSaveGame->unk7[i];
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
    sub_8068700(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);
    m4aSongNumStart(MUS_TA_COURSE_SELECTION);
}

void CreateNewProfileScreen(void) {
    struct Task* t;
    struct LanguageScreen* languageScreen;

    ShuffleRngSeed();

    t = TaskCreate(Task_LanguageScreenFadeIn, sizeof(struct LanguageScreen), 0x2000, TASK_x0004, NULL);
    languageScreen = TaskGetStructPtr(t, languageScreen);

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
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(t, profileNameScreen);
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

static void GetProfileData(struct OptionsScreen* optionsScreen) {
    struct SaveGame* saveGame = gLoadedSaveGame;
    struct OptionsScreenProfileData* profile = &optionsScreen->profileData;

    s16 i;

    memcpy(profile->playerName, saveGame->unk20, sizeof(saveGame->unk20));
    memcpy(&profile->unkC, &saveGame->unk34, sizeof(saveGame->unk34));
    memcpy(profile->unk284, saveGame->unk2AC, sizeof(saveGame->unk2AC));

    profile->unk34C = saveGame->unk1C;
    profile->unk34D = saveGame->unk1D;
    profile->unk34E = saveGame->unk1E;

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
        optionsScreen->timeLimitEnabled = 0;
    }

    if (optionsScreen->language > NUM_LANGUAGES - 1) {
        optionsScreen->language = LanguageIndex(LANG_ENGLISH);
    }

    if (optionsScreen->soundTestUnlocked > 1) {
        optionsScreen->soundTestUnlocked = FALSE;
    }

    if (optionsScreen->bossTimeAttackUnlocked > 1) {
        optionsScreen->bossTimeAttackUnlocked = 0;
    }
}

static void SetProfileData(struct OptionsScreen* optionsScreen) {
    struct SaveGame* saveGame = gLoadedSaveGame;
    struct OptionsScreenProfileData* profile = &optionsScreen->profileData;

    memcpy(saveGame->unk20, profile->playerName, sizeof(profile->playerName));
    memcpy(&saveGame->unk34, &profile->unkC, sizeof(profile->unkC));

    memcpy(&saveGame->unk2AC[0], &profile->unk284[0], 0x14);

    saveGame->unk1C = profile->unk34C;
    saveGame->unk1D = profile->unk34D;
    saveGame->unk1E = profile->unk34E;

    memcpy(&saveGame->unk2C, &profile->buttonConfig, 8);

    saveGame->unk4 = optionsScreen->difficultyLevel;
    saveGame->unk5 = optionsScreen->timeLimitEnabled;
    saveGame->unk6 = optionsScreen->language + 1;
    saveGame->unk11 = optionsScreen->soundTestUnlocked;
    saveGame->unk12 = optionsScreen->bossTimeAttackUnlocked;
}

// OptionsScreenInitRegistersAndFadeIn
static void sub_8063D20(struct OptionsScreen* optionsScreen, s16 state) {
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
            0, 
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

    for (i = 0, yPos = 0x1E; i < NUM_OPTIONS_MENU_ITEMS; i++, menuItem++) {
        if (optionsScreen->soundTestUnlocked || i != OPTIONS_MENU_ITEM_SOUND_TEST) {
            const struct UNK_080D95E8 *itemText = &sOptionsScreenMenuItemsText[language][i];

            if (optionsScreen->menuCursor == i) {
                xPos = 0x20;
            } else {
                xPos = 0x28;
            }

            if (state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN && i == OPTIONS_MENU_ITEM_PLAYER_DATA) {
                xPos = -0xB8;
            }
            sub_806A568(
                menuItem, 
                0, 
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
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_PLAYER_DATA ? 0x98 : 0xa0;
        if (state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN) {
            xPos = -0x40;
        }
        sub_806A568(
            metaItem, 
            0, 
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
        const struct UNK_080D95E8 *difficultyLevelText = &sDifficultyLevelSwitchValues[language][optionsScreen->difficultyLevel];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_DIFFICULTY ? 152 : 160;
    
        sub_806A568(
            metaItem, 
            0, 
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
        const struct UNK_080D95E8 *timeLimitSwitchText = &sTimeLimitMenuSwitchValues[language][optionsScreen->timeLimitEnabled];
        xPos = optionsScreen->menuCursor == OPTIONS_MENU_ITEM_TIME_LIMIT ? 152 : 160;
    
        sub_806A568(
            metaItem, 
            0, 
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
            0, 
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
            xPos = -0x35;
        }

        for (i = 0, yPos = 0x26, finishedReadingName = FALSE; i < MAX_PLAYER_NAME_LENGTH; i++, playerNameDisplayChar++, xPos += 10) {
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
                0, 
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

    sub_806A568(NULL, 0, 0, 0x3c4, 0, 0, 0, 0, 0, 0);
    sub_806A568(NULL, 0, 0, 0x3c4, 0, 0, 0, 0, 1, 0);
    sub_806A568(NULL, 0, 0, 0x3c3, 0, 0, 0, 0, 0xc, 0);
    sub_806A568(NULL, 0, 0, 0x3c3, 0, 0, 0, 0, 0xd, 0);
}

static void Task_OptionsScreenMain(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

    OptionsScreenRenderUI();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        switch(optionsScreen->menuCursor) {
            case OPTIONS_MENU_ITEM_LANGUAGE:
                OptionsScreenShowLanguageScreen();
                return;
            case OPTIONS_MENU_ITEM_SOUND_TEST:
                // SoundTest
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
        optionsScreen->unk781 = optionsScreen->menuCursor;

        if (optionsScreen->menuCursor >= NUM_OPTIONS_MENU_ITEMS - 1) {
            optionsScreen->menuCursor = 0;
        } else {
            optionsScreen->menuCursor++;
        }

        // Skip the soundtest menu index if not available
        if (!optionsScreen->soundTestUnlocked && optionsScreen->menuCursor == 5) {
           optionsScreen->menuCursor++; 
        }
        optionsScreen->subMenuAnimFrame = 0;
        gCurTask->main = Task_OptionsScreenMenuCursorMoveAnim;
        return;
        
    }

    if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        optionsScreen->unk781 = optionsScreen->menuCursor;
        if (optionsScreen->menuCursor < 1) {
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

static inline void sub_8064304_A(struct OptionsScreen* optionsScreen, s8 subMenuAnimPos) {
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

        if (optionsScreen->menuCursor == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* item = optionsScreen->playerNameDisplay;
            
            for (i = 0; i < 6; i++, item++) {
                item->unk16 = baseXPos + (i * 10 + 163);
                item->unk25 = 7;                    
            }
        }
    }

    baseXPos = -216 - baseXPos;
    gBgScrollRegs[2][0] = baseXPos;    
}

static inline void sub_8064304_B(struct OptionsScreen* optionsScreen, s8 baseXPos) {
    struct UNK_0808B3FC_UNK240* item = &optionsScreen->menuItems[optionsScreen->unk781];

    item->unk16 = baseXPos + 32;
    item->unk25 = 1;

    if (optionsScreen->unk781 < 4) {
        item = &optionsScreen->metaItems[optionsScreen->unk781];
        item->unk16 = baseXPos + 152;
        item->unk25 = 1;

        if (optionsScreen->unk781 == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* item = optionsScreen->playerNameDisplay;
            for (i = 0; i < 6; i++, item++) {
                item->unk16 = baseXPos + (i * 10 + 163);
                item->unk25 = 8;
            }
        }
    }
} 

static void Task_OptionsScreenMenuCursorMoveAnim(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    s16 animFrame = optionsScreen->subMenuAnimFrame;
    
    sub_8064304_A(optionsScreen, gUnknown_080D9540[0][animFrame]);
    sub_8064304_B(optionsScreen, gUnknown_080D9540[1][animFrame]);

    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame > 7) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static inline void sub_80644C4_A(struct OptionsScreen* optionsScreen, const s16* transitionFrames) {
    s16 baseXPos = optionsScreen->subMenuXPos = transitionFrames[optionsScreen->subMenuAnimFrame];
    struct UNK_0808B3FC_UNK240* item = &optionsScreen->menuItems[optionsScreen->menuCursor];

    item->unk16 = baseXPos + 32;
    item->unk25 = 0;

    if (optionsScreen->menuCursor < 4) {
        struct UNK_0808B3FC_UNK240* item = &optionsScreen->metaItems[optionsScreen->menuCursor];
        item->unk16 = baseXPos + 152;
        item->unk25 = 0;

        if (optionsScreen->menuCursor == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* item = optionsScreen->playerNameDisplay;
            
            for (i = 0; i < 6; i++, item++) {
                item->unk16 = baseXPos + (i * 10 + 163);
                item->unk25 = 7;                    
            }
        }
    }

    baseXPos = -216 - baseXPos;
    gBgScrollRegs[2][0] = baseXPos; 
}

static void Task_OptionsScreenSubMenuOpenAnim(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    
    sub_80644C4_A(optionsScreen, gUnknown_080D9550);
    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame > 15) {
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForSubMenuExit;
    }
}

static void Task_OptionsScreenSubMenuCloseAnim(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    
    sub_80644C4_A(optionsScreen, gUnknown_080D9570);
    OptionsScreenRenderUI();

    if (++optionsScreen->subMenuAnimFrame > 15) {
        ResetProfileScreensSubMenuVram();
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static void Task_OptionsScreenWaitForLanguageScreenExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    if (optionsScreen->state != OPTIONS_SCREEN_STATE_ACTIVE) {
        return;
    }
    
    ResetProfileScreensVram();

    sub_8063D20(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    if (optionsScreen->state != OPTIONS_SCREEN_STATE_ACTIVE) {
        return;
    }
    
    ResetProfileScreensVram();

    sub_8063D20(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    u8 language = optionsScreen->language;

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_SUB_MENU_OPEN) {
        return;
    }

    ResetProfileScreensVram();

    if (optionsScreen->state == OPTIONS_SCREEN_STATE_ACTIVE) {
        GetProfileData(optionsScreen);
    }

    optionsScreen->language = language;

    sub_8063D20(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
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
    struct Task* t = TaskCreate(Task_PlayerDataMenuOpenAnim, sizeof(struct PlayerDataMenu), 0x2000, TASK_x0004, NULL);
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(t, playerDataMenu);

    s16 initialCursorIndex;
    if (optionsScreen->unk782 != -1) {
        initialCursorIndex = optionsScreen->unk782; 
    } else {
        initialCursorIndex = 0;
    }

    playerDataMenu->optionsScreen = optionsScreen;
    playerDataMenu->menuCursor = initialCursorIndex;
    playerDataMenu->unk161 = 0;
    playerDataMenu->language = optionsScreen->language;

    CreatePlayerDataMenuUI(playerDataMenu);
}

static void CreatePlayerDataMenuUI(struct PlayerDataMenu* playerDataMenu) {
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
        1, 
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
        1, 
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
            1, 
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
        1,
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

static void Task_PlayerDataMenuOpenAnim(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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

    if (++playerDataMenu->unk161 > 15) {
        playerDataMenu->unk161 = 0;
        gCurTask->main = Task_PlayerDataMenuMain;
    }
}

static void Task_PlayerDataMenuMain(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
                optionsScreen->state = 0;
                gCurTask->main = Task_PlayerDataMenuCloseAnim;
                return;
            default:
                return;
        }
    } else if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->state = 0;
        gCurTask->main = Task_PlayerDataMenuCloseAnim;
    }
}

static void Task_PlayerDataMenuCloseAnim(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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

    if (++playerDataMenu->unk161 < 15) {
        PlayerDataMenuRenderUI();
    } else {
        TaskDestroy(gCurTask);
    }
}

static inline void OptionsScreenRecreateUIForPlayerDataMenu(struct PlayerDataMenu* playerDataMenu, struct UNK_802D4CC_UNK270* unk150) {
    struct OptionsScreen* optionsScreen;

    ResetProfileScreensVram();

    sub_8063D20(playerDataMenu->optionsScreen, OPTIONS_SCREEN_STATE_SUB_MENU_OPEN);
    
    optionsScreen = playerDataMenu->optionsScreen;
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1E,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xE, 0x86,0x1E,0x14,0,1,0,0);
    
    OptionsScreenCreateUI(playerDataMenu->optionsScreen, 1);
    CreatePlayerDataMenuUI(playerDataMenu);

    unk150->unk0 = 0;
    unk150->unk2 = 2;
    unk150->unk4 = 0;
    unk150->unk6 = 0x100;
    unk150->unkA = 0;
    unk150->unk8 = 0xFF;

    playerDataMenu->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
}

static void Task_PlayerDataMenuWaitForProfileNameScreenExit(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == 0) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromProfileNameScreen;
    }
}

void Task_PlayerDataMenuFadeOutToTimeRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->state == PLAYER_DATA_MENU_STATE_ACTIVE) {
        OptionsScreenRecreateUIForPlayerDataMenu(playerDataMenu, unk150);
        gCurTask->main = Task_PlayerDataMenuFadeInFromTimeRecordsScreen;
    }
}

static void Task_PlayerDataMenuWaitForMultiplayerRecordsScreenExit(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
    const struct UNK_080D95E8 *difficultyLevelText = sDifficultyLevelSwitchValues[difficultyMenu->language];
    
    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 difficultyLevel = difficultyMenu->switchValue;
    s16 i;

    sub_806A568(
        headerFooter,
        1,
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
        1,
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
        1,
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
        1,
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
        1,
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

void Task_DifficultyMenuOpenAnim(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask, difficultyMenu);
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

    if (++difficultyMenu->animFrame > 15) {
        difficultyMenu->animFrame = 0;
        gCurTask->main = Task_DifficultyMenuMain;
    }
}

static void Task_DifficultyMenuMain(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask, difficultyMenu);
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
        const struct UNK_080D95E8 *difficultyLevelText = &sDifficultyLevelSwitchValues[language][difficultyMenu->switchValue];

        difficultyOption = &optionsScreen->metaItems[1];
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
        optionsScreen->state = 0;
        gCurTask->main = Task_DifficultyMenuCloseAnim;
    }
}

static void Task_DifficultyMenuCloseAnim(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask, difficultyMenu);
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
    const struct UNK_080D95E8 *timeLimitSwitchText = sTimeLimitMenuSwitchValues[timeLimitMenu->language];

    s16 baseXPos = timeLimitMenu->optionsScreen->subMenuXPos;
    s16 timeLimitEnabled = timeLimitMenu->switchValue;
    s16 i;
    
    // TODO: can these be a macro?
    sub_806A568(
        headerFooter,
        1,
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
        1,
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
        1,
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
        1,
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
        1,
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

static void Task_TimeLimitMenuOpenAnim(void) {
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask, timeLimitMenu);
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
    sub_806AF10();

    if (++timeLimitMenu->animFrame > 15) {
        timeLimitMenu->animFrame = 0;
        gCurTask->main = Task_TimeLimitMenuMain;
    }
}

static void Task_TimeLimitMenuMain(void) {
    // Same as sub_806548C
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask, timeLimitMenu);
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

    sub_806AF10();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *itemText3 = &sTimeLimitMenuSwitchValues[language][timeLimitMenu->switchValue];
        // Except this is different
        timeLimitOption = &optionsScreen->metaItems[OPTIONS_META_ITEM_TIME_LIMIT];
        
        timeLimitOption->unk20 = itemText3->unk2;
        timeLimitOption->unkA = itemText3->unk0;
        sub_8004558(timeLimitOption);
        m4aSongNumStart(SE_SELECT);
        // and this
        optionsScreen->timeLimitEnabled = timeLimitMenu->switchValue;
        optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
        gCurTask->main = sub_8065A50;
    } else if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->state = 0;
        gCurTask->main = sub_8065A50;
    }
}

static void sub_8065A50(void) {
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask, timeLimitMenu);
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
        sub_806AF10();
    } else {
        TaskDestroy(gCurTask);
    }
}

/** Button Config Menu **/

void CreateButtonConfigMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(Task_ButtonConfigMenuOpenAnim, sizeof(struct ButtonConfigMenu), 0x2000, 4, NULL);
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(t, buttonConfigMenu);

    buttonConfigMenu->optionsScreen = optionsScreen;
    
    switch(optionsScreen->profileData.buttonConfig.unk0) {
        case 1:
            buttonConfigMenu->unk244 = 0;
            break;
        case 2:
            buttonConfigMenu->unk245 = 0;
            break;
        case 0x100:
            buttonConfigMenu->unk246 = 0;
            break;
    }

    switch(optionsScreen->profileData.buttonConfig.unk2) {
        case 1:
            buttonConfigMenu->unk244 = 1;
            break;
        case 2:
            buttonConfigMenu->unk245 = 1;
            break;
        case 0x100:
            buttonConfigMenu->unk246 = 1;
            break;
    }

    switch(optionsScreen->profileData.buttonConfig.unk4) {
        case 1:
            buttonConfigMenu->unk244 = 2;
            break;
        case 2:
            buttonConfigMenu->unk245 = 2;
            break;
        case 0x100:
            buttonConfigMenu->unk246 = 2;
            break;
    }

    buttonConfigMenu->unk247 = 0;
    buttonConfigMenu->unk248 = 0;
    buttonConfigMenu->language = optionsScreen->language;
    ButtonConfigMenuCreateUI(buttonConfigMenu);
}

static void ButtonConfigMenuCreateUI(struct ButtonConfigMenu* buttonConfigMenu) {
    struct UNK_0808B3FC_UNK240* unk4 = buttonConfigMenu->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;

    const struct UNK_080D95E8 *itemText1 = gUnknown_080D9948[buttonConfigMenu->language];
    const struct UNK_080D95E8 *itemText2 = gUnknown_080D99D8;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[buttonConfigMenu->language];

    s16 unk360 = buttonConfigMenu->optionsScreen->subMenuXPos;

    s16 i;

    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x1C,
        8,
        itemText1->unk2,
        0
    );
    unk4++;
    itemText1++;
    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x7A,
        8,
        itemText1->unk2,
        0
    );
    unk4++;
    itemText1++;
    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x87,
        8,
        itemText1->unk2,
        0
    );

    unk4++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 264,
        0x35,
        8,
        itemText2->unk2,
        0
    );
    unk4++;
    itemText2++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 264,
        0x4D,
        8,
        itemText2->unk2,
        0
    );
    unk4++;
    itemText2++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 264,
        0x65,
        8,
        itemText2->unk2,
        0
    );

    sub_806A568(
        unk124,
        1,
        itemText3[buttonConfigMenu->unk244].unk4,
        itemText3[buttonConfigMenu->unk244].unk0,
        0x1000,
        unk360 + 0x14C,
        0x2D,
        8,
        itemText3[buttonConfigMenu->unk244].unk2,
        0
    );
    unk124++;
    sub_806A568(
        unk124,
        1,
        itemText3[buttonConfigMenu->unk245].unk4,
        itemText3[buttonConfigMenu->unk245].unk0,
        0x1000,
        unk360 + 0x14C,
        0x45,
        8,
        itemText3[buttonConfigMenu->unk245].unk2,
        0
    );
    unk124++;
    sub_806A568(
        unk124,
        1,
        itemText3[buttonConfigMenu->unk246].unk4,
        itemText3[buttonConfigMenu->unk246].unk0,
        0x1000,
        unk360 + 0x14C,
        0x5D,
        8,
        itemText3[buttonConfigMenu->unk246].unk2,
        0
    );

    sub_806A568(
        unk214,
        1,
        0x42,
        0x3B6,
        0x1000,
        unk360 + 0xFC,
        0x2A,
        6,
        7,
        0
    );
    
    sub_806A568(
        unk1B4,
        1,
        2,
        0x3B6,
        0x1000,
        unk360 + 0x143,
        0x35,
        6,
        8,
        0
    );
    unk1B4++;
    sub_806A568(
        unk1B4,
        1,
        2,
        0x3B6,
        0x1000,
        unk360 + 0x19D,
        0x35,
        6,
        9,
        0
    );
}

static void Task_ButtonConfigMenuOpenAnim(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct UNK_0808B3FC_UNK240* unk4 = buttonConfigMenu->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;

    s16 baseXPos = buttonConfigMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 3; i++, unk4++) {
        unk4->unk16 = baseXPos + 336;
    }

    for (;i < 6; i++, unk4++) {
        unk4->unk16 = baseXPos + 264;
    }

    for (i = 0; i < 3; i++, unk124++) {
        unk124->unk16 = baseXPos + 332;
    }

    unk214->unk16 = baseXPos + 252;
    unk1B4->unk16 = baseXPos + 323;
    unk1B4++;
    unk1B4->unk16 = baseXPos + 413;
    
    ButtonConfigMenuRenderUI();

    if (++buttonConfigMenu->unk248 > 15) {
        buttonConfigMenu->unk248 = 0;
        gCurTask->main = Task_ButtonConfigMenuMain;
    }
}

static void Task_ButtonConfigMenuMain(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[buttonConfigMenu->language];
    const struct UNK_080D95E8 *itemText4;

    ButtonConfigMenuRenderUI();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & (DPAD_LEFT)) {
            if (buttonConfigMenu->unk244 != 0) {
                buttonConfigMenu->unk244--;
            } else {
                buttonConfigMenu->unk244 = 2;
            }
        } else {
            if (buttonConfigMenu->unk244 < 2) {
                buttonConfigMenu->unk244++;
            } else {
                buttonConfigMenu->unk244 = 0;
            }
        }

        itemText4 = &itemText3[buttonConfigMenu->unk244];
        unk124->unkA = itemText4->unk0;
        unk124->unk20 = itemText4->unk2;
        sub_8004558(&unk124[0]);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (buttonConfigMenu->unk244 == buttonConfigMenu->unk245) {
            while (buttonConfigMenu->unk244 == buttonConfigMenu->unk245 || buttonConfigMenu->unk244 == buttonConfigMenu->unk246) {
                if (buttonConfigMenu->unk245 < 2) {
                    buttonConfigMenu->unk245++;
                } else {
                    buttonConfigMenu->unk245 = 0;
                }
            }
            unk124 = &buttonConfigMenu->unk124[1];
            unk124->unkA = itemText3[buttonConfigMenu->unk245].unk0;
            unk124->unk20 = itemText3[buttonConfigMenu->unk245].unk2;
            
            sub_8004558(unk124);
        }

        if (buttonConfigMenu->unk244 == buttonConfigMenu->unk246) {
            while (buttonConfigMenu->unk244 == buttonConfigMenu->unk246 || buttonConfigMenu->unk245 == buttonConfigMenu->unk246) {
                if (buttonConfigMenu->unk246 < 2) {
                    buttonConfigMenu->unk246++;
                } else {
                    buttonConfigMenu->unk246 = 0;
                }
            }

            unk124 = &buttonConfigMenu->unk124[2];
            unk124->unkA = itemText3[buttonConfigMenu->unk246].unk0;
            unk124->unk20 = itemText3[buttonConfigMenu->unk246].unk2;
            sub_8004558(unk124);
        }

        buttonConfigMenu->unk247 = 1;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = sub_806AFAC;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        buttonConfigMenu->unk248 = 0;
        buttonConfigMenu->optionsScreen->state = 0;
        gCurTask->main = sub_8066718;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_80665D8();
    }
}

void sub_8066220(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct UNK_0808B3FC_UNK240* unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[buttonConfigMenu->language];
    const struct UNK_080D95E8 *itemText4;
    u8 unk245;

    ButtonConfigMenuRenderUI();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & DPAD_LEFT) {
            do {
                if (buttonConfigMenu->unk245 > 0) {
                    buttonConfigMenu->unk245--;
                } else {
                   buttonConfigMenu->unk245 = 2;
                }
            } while (buttonConfigMenu->unk244 == buttonConfigMenu->unk245);
        } else if (gRepeatedKeys & DPAD_RIGHT) {
            do {
                if (buttonConfigMenu->unk245 < 2) {
                    buttonConfigMenu->unk245++;
                } else {
                    buttonConfigMenu->unk245 = 0;
                }
            } while (buttonConfigMenu->unk244 == buttonConfigMenu->unk245);
        }
        
        // Who knows why this has to be assigned first
        unk245 = buttonConfigMenu->unk245;
        
        unk124 = &buttonConfigMenu->unk124[1];
        itemText4 = &itemText3[unk245];
        unk124->unkA = itemText4->unk0;
        unk124->unk20 = itemText4->unk2;
        sub_8004558(unk124);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (buttonConfigMenu->unk244 == buttonConfigMenu->unk246 || buttonConfigMenu->unk245 == buttonConfigMenu->unk246) {
            while (buttonConfigMenu->unk244 == buttonConfigMenu->unk246 || buttonConfigMenu->unk245 == buttonConfigMenu->unk246) {
                if (buttonConfigMenu->unk246 < 2) {
                    buttonConfigMenu->unk246++;
                } else {
                    buttonConfigMenu->unk246 = 0;
                }
            }
            unk124 = &buttonConfigMenu->unk124[2];
            unk124->unkA = itemText3[buttonConfigMenu->unk246].unk0;
            unk124->unk20 = itemText3[buttonConfigMenu->unk246].unk2;
            
            sub_8004558(unk124);
        }

        buttonConfigMenu->unk247 = 2;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = sub_806AFEC;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        if (buttonConfigMenu->unk244 == buttonConfigMenu->unk245 || buttonConfigMenu->unk245 == buttonConfigMenu->unk246) {
            while (buttonConfigMenu->unk244 == buttonConfigMenu->unk245 || buttonConfigMenu->unk245 == buttonConfigMenu->unk246) {
                if (buttonConfigMenu->unk245 < 2) {
                    buttonConfigMenu->unk245++;
                } else {
                    buttonConfigMenu->unk245 = 0;
                }
            }
            unk124 = &buttonConfigMenu->unk124[1];
            unk124->unkA = itemText3[buttonConfigMenu->unk245].unk0;
            unk124->unk20 = itemText3[buttonConfigMenu->unk245].unk2;
            
            sub_8004558(unk124);
        }
        m4aSongNumStart(SE_RETURN);
        buttonConfigMenu->unk247 = 0;
        gCurTask->main = sub_806AF6C;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_80665D8();
    }
}

static inline void sub_8066478_StoreButtonConfig(struct ButtonConfigMenu* buttonConfigMenu, struct OptionsScreen* optionsScreen) {
     switch (buttonConfigMenu->unk244) {
        case 0:
            optionsScreen->profileData.buttonConfig.unk0 = 1;
            break;
        case 1:
            optionsScreen->profileData.buttonConfig.unk2 = 1;
            break;
        case 2:
            optionsScreen->profileData.buttonConfig.unk4 = 1;
            break;
    }

    switch (buttonConfigMenu->unk245) {
        case 0:
            optionsScreen->profileData.buttonConfig.unk0 = 2;
            break;
        case 1:
            optionsScreen->profileData.buttonConfig.unk2 = 2;
            break;
        case 2:
            optionsScreen->profileData.buttonConfig.unk4 = 2;
            break;
    }

    switch (buttonConfigMenu->unk246) {
        case 0:
            optionsScreen->profileData.buttonConfig.unk0 = 0x100;
            break;
        case 1:
            optionsScreen->profileData.buttonConfig.unk2 = 0x100;
            break;
        case 2:
            optionsScreen->profileData.buttonConfig.unk4 = 0x100;
            break;
    }
}

static void sub_8066478(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct OptionsScreen* optionsScreen = buttonConfigMenu->optionsScreen;

    ButtonConfigMenuRenderUI();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
    
        sub_8066478_StoreButtonConfig(buttonConfigMenu, optionsScreen);
    
        buttonConfigMenu->unk248 = 0;
        buttonConfigMenu->optionsScreen->state = 0;
        gCurTask->main = sub_8066718;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        buttonConfigMenu->unk247 = 0;
        gCurTask->main = sub_806AFAC;
        return;
    }
    
    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_80665D8();
    }
}

static void sub_80665D8(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct OptionsScreen* optionsScreen = buttonConfigMenu->optionsScreen;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[buttonConfigMenu->language];
    s16 i;

    buttonConfigMenu->unk244 = 0;
    buttonConfigMenu->unk245 = 1;
    buttonConfigMenu->unk246 = 2;

    sub_8066478_StoreButtonConfig(buttonConfigMenu, optionsScreen);

    for (i = 0; i < 3; i++, unk124++) {
        unk124->unkA = itemText3[i].unk0;
        unk124->unk20 = itemText3[i].unk2;
        sub_8004558(unk124);
    }

    gCurTask->main = sub_806AF6C;
}

static void sub_8066718(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct UNK_0808B3FC_UNK240* unk4 = buttonConfigMenu->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;

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

    if (++buttonConfigMenu->unk248 < 0xF) {
        ButtonConfigMenuRenderUI();
    } else {
        TaskDestroy(gCurTask);
    }
}

static void ButtonConfigMenuRenderUI(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct UNK_0808B3FC_UNK240* unk4 = buttonConfigMenu->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;
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
    struct UNK_0808B3FC_UNK240* unk0 = languageScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* unk60 = languageScreen->menuItems;
    struct UNK_0808B3FC_UNK240* unk180 = &languageScreen->menuItemOutline;

    const struct UNK_080D95E8* a80 = sLanguageScreenTitles;
    const struct UNK_080D95E8* b10 = gUnknown_080D9B10;
    const struct UNK_080D95E8* ae0;

    s16 var1;
    s16 var2;
    s16 i;
    s16 pos;

    if (languageScreen->creatingNewProfile == FALSE) {
        ae0 = sLanguageScreenEditControlsText;
    } else {
        ae0 = sLanguageScreenNewControlsText;
    }

    var1 = sub_806B8D4(a80, ARRAY_COUNT(sLanguageScreenTitles));
    var2 = sub_806B8D4(ae0, ARRAY_COUNT(sLanguageScreenNewControlsText));

    a80 = &a80[selectedLanguage];
    ae0 = &ae0[selectedLanguage];
    
    sub_806A568(
        unk0,
        0,
        var1,
        a80->unk0,
        0x3000,
        0x78,
        0x1A,
        0xD,
        a80->unk2,
        0
    );
    unk0++;
    sub_806A568(
        unk0,
        0,
        var2,
        ae0->unk0,
        0x3000,
        0x78,
        0x8A,
        0xD,
        ae0->unk2,
        0
    );

    for (i = 0, pos = 0x28; i < 6; i++, unk60++, b10++, pos+= 0xF) {
        sub_806A568(
            unk60,
            0,
            b10->unk4,
            b10->unk0,
            0x3000,
            0x28,
            pos,
            0xD,
            b10->unk2,
            0
        );
        unk60->unk25 = !!(selectedLanguage ^ i);
    }

    sub_806A568(
        unk180,
        0,
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
        0, 
        0, 
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
        0, 
        0, 
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
        0, 
        0, 
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
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
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

    RenderLanguageScreenUI();

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
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
    struct UNK_0808B3FC_UNK240* headerFooter = languageScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* menuItems = languageScreen->menuItems;
    struct UNK_0808B3FC_UNK240* menuItemOutline = &languageScreen->menuItemOutline;

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
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(t, deleteScreen);

    deleteScreen->optionsScreen = optionsScreen;
    deleteScreen->confirmationCursor = 1;
    deleteScreen->unk141 = 0;
    deleteScreen->language = optionsScreen->language;
    deleteScreen->deleteConfirmed = 0;

    ResetProfileScreensVram();

    sub_8066D90(deleteScreen);
    sub_806B258(deleteScreen);
    CreateDeleteScreenUI(deleteScreen);
}

// DeleteScreenInitUIRegisters
static void sub_8066D90(struct DeleteScreen* deleteScreen) {
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

static void CreateDeleteScreenUI(struct DeleteScreen* deleteScreen) {
    s16 language = deleteScreen->language;
    struct UNK_0808B3FC_UNK240* unk60 = deleteScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteScreen->unkC0;

    const struct UNK_080D95E8* b40 = &gUnknown_080D9B40[language];
    const struct UNK_080D95E8* ba0 = &gUnknown_080D9BA0[language];
    const struct UNK_080D95E8* bd0 = gUnknown_080D9BD0[language];

    s16 confirmationCursor = deleteScreen->confirmationCursor;
    
    sub_806A568(
        &deleteScreen->unk0[0],
        0,
        b40->unk4,
        b40->unk0,
        0x3000,
        0x78,
        0x32,
        0xD,
        b40->unk2,
        0
    );
    sub_806A568(
        &deleteScreen->unk0[1],
        0,
        ba0->unk4,
        ba0->unk0,
        0x3000,
        0x78,
        0x74,
        0xD,
        ba0->unk2,
        0
    );
    sub_806A568(
        unk60,
        0,
        bd0->unk4,
        bd0->unk0,
        0x3000,
        0x3A,
        0x4C,
        0xD,
        bd0->unk2,
        0
    );

    unk60->unk25 = 1;
    unk60++;
    bd0++;
    sub_806A568(
        unk60,
        0,
        bd0->unk4,
        bd0->unk0,
        0x3000,
        0x76,
        0x4C,
        0xD,
        bd0->unk2,
        0
    );

    sub_806A568(
        unkC0,
        0,
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
        0, 
        0, 
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
        0, 
        0, 
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
        0, 
        0, 
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
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);
    struct UNK_0808B3FC_UNK240* unk60 = deleteScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteScreen->unkC0;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteScreen->confirmationCursor = !deleteScreen->confirmationCursor;

        for (i = 0; i < 2; i++, unk60++) {
            unk60->unk25 = !!(deleteScreen->confirmationCursor ^ i);
        }
        unkC0->unk16 = deleteScreen->confirmationCursor * 60 + 56;
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
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);

    struct UNK_0808B3FC_UNK240* unk0 = deleteScreen->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = deleteScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteScreen->unkC0;
    const struct UNK_080D95E8* message = &sDeleteScreenAbsoluteConfirmationMessages[deleteScreen->language];
    s16 i;

    unk0->unk20 = message->unk2;
    unk0->unkA = message->unk0;

    sub_8004558(unk0);

    deleteScreen->confirmationCursor = DELETE_SCREEN_CONFIRMATION_NO;

    for (i = 0; i < 2; i++, unk60++) {
        unk60->unk25 = !!(deleteScreen->confirmationCursor ^ i);
    }

    unkC0->unk16 = deleteScreen->confirmationCursor * 60 + 56;

    DeleteScreenRenderUI();
    gCurTask->main = Task_DeleteScreenAbsoluteConfirmationMain;
}

static void Task_DeleteScreenAbsoluteConfirmationMain(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);
    struct UNK_0808B3FC_UNK240* unk60 = deleteScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteScreen->unkC0;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteScreen->confirmationCursor = deleteScreen->confirmationCursor == 0;

        for (i = 0; i < 2; i++, unk60++) {
            unk60->unk25 = !!(deleteScreen->confirmationCursor ^ i);
        }
        unkC0->unk16 = deleteScreen->confirmationCursor * 60 + 56;
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
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);

    if (!sub_802D4CC(&deleteScreen->unk130)) {
        DeleteScreenRenderUI();
        return;
    }

    if (deleteScreen->deleteConfirmed) {
        SetProfileData(deleteScreen->optionsScreen);
        NewSaveGame();
        deleteScreen->optionsScreen->state = OPTIONS_SCREEN_STATE_ACTIVE;
    } else {
        deleteScreen->optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN;
    }

    TaskDestroy(gCurTask);
}

void CreateEditProfileNameScreen(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(Task_ProfileNameScreenFadeIn, sizeof(struct ProfileNameScreen), 0x2000, 4, NULL);
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(t, profileNameScreen);
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
        0, 
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
        0, 
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
        0, 
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
        0, 
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
    const struct UNK_080D95E8* scrollArrowTile = sScrollArrowTiles;
    struct UNK_806B908 nameCharTile;
    
    // background
    sub_806A568(
        focusedCell, 
        0, 
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
        0, 
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
        0, 
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
        0, 
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
            0, 
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
        0, 
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
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);
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
        if ((nameInput->cursor != 0 && nameInput->buffer[nameInput->cursor] == PLAYER_NAME_END_CHAR) || nameInput->cursor > MAX_PLAYER_NAME_LENGTH - 1) {
            nameInput->cursor--;
        }
        
        for (i = nameInput->cursor; i < MAX_PLAYER_NAME_LENGTH - 1; i++) {
            nameInput->buffer[i] = nameInput->buffer[i + 1];
        }
        nameInput->buffer[MAX_PLAYER_NAME_LENGTH - 1] = 0xFFFF;
    }
}

static bool16 ProfileNameScreenHandleShoulderInput(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);

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
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);

    if (!(gRepeatedKeys & (DPAD_DOWN | DPAD_UP | DPAD_LEFT | DPAD_RIGHT))) {
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
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);
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

    gCurTask->main = ProfileNameScreenHandleExit;
}

static void ProfileNameScreenHandleExit(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;
    struct NameInputDisplay* unk258 = &profileNameScreen->nameInput;
    s16 onCompleteAction = profileNameScreen->onCompleteAction;
    s16 i;

    if (!sub_802D4CC(unk140)) {
        ProfileNameScreenRenderUI();
        return;
    }

    if (onCompleteAction == 0) {
        profileNameScreen->playerDataMenu->state = 0;
        TaskDestroy(gCurTask);
        return;
    }
    
    if (onCompleteAction == 2) {
        NewSaveGame();
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        gLoadedSaveGame->unk20[i] = unk258->buffer[i];
    }
    WriteSaveGame();
    TasksDestroyAll();
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;

    if (onCompleteAction == 1) {
        // Continue to multiplayer
        sub_805A1CC();
    } else {
        CreateTitleScreen();
    }
}

static void ProfileNameScreenRenderUI(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);

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

static void CreateTimeRecordsScreen(struct PlayerDataMenu* playerProfileMenu) {
    struct Task* t = TaskCreate(Task_TimeRecordsScreenChoiceViewFadeIn, sizeof(struct TimeRecordsScreen), 0x2000, 4, NULL);
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(t, timeRecordsScreen);
    s16 i;

    for (i = 1; i < NUM_CHARACTERS; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    timeRecordsScreen->playerDataMenu = playerProfileMenu;
    timeRecordsScreen->character = 0;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unk708 = 0;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->characterZones[i] = gLoadedSaveGame->unk7[i];
    }

    timeRecordsScreen->language = playerProfileMenu->language;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    
    ResetProfileScreensVram();

    sub_80682AC();
    sub_80682EC(timeRecordsScreen);
    TimeRecordsScreenCreateModeChoiceUI(timeRecordsScreen);
}

static void sub_80682AC(void) {
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

static void sub_80682EC(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk270 = &timeRecordsScreen->unk0;
    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;
    sub_806B854(&timeRecordsScreen->unk204,0,7,0x89,0x1e,0x14,0,0,0,0);
    sub_806B854(&timeRecordsScreen->unk244,1,0xF,0x8A,0x1e,0x14,0,1,0,0);
}

static void TimeRecordsScreenCreateModeChoiceUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_0808B3FC_UNK240* unk10C = &timeRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = timeRecordsScreen->unk13C;
    struct UNK_0808B3FC_UNK240* unk4C = timeRecordsScreen->unk4C;
    const struct UNK_080D95E8 *itemText1 = &gUnknown_080D9EB0[timeRecordsScreen->language];
    const struct UNK_080D95E8 *itemText2 = gUnknown_080D9EE0[timeRecordsScreen->language];
    
    // TODO: This X is a fake match, the compiler wants to use 0
    // from a register but won't do it without this
    s32 x = 0x1000;

    ++x; --x;
    sub_806A568(
        unk10C, 
        0, 
        itemText1->unk4,
        itemText1->unk0,
        x,
        4, 
        0x1A,
        5,
        itemText1->unk2,
        0
    );

    sub_806A568(
        unk4C, 
        0, 
        itemText2->unk4,
        itemText2->unk0,
        x,
        0x28, 
        0x54,
        5,
        itemText2->unk2,
        0
    );

    unk4C++;
    itemText2++;
    sub_806A568(
        unk4C, 
        0, 
        itemText2->unk4,
        itemText2->unk0,
        x,
        0x86, 
        0x54,
        5,
        itemText2->unk2,
        0
    );

    sub_806A568(
        unk13C, 
        0, 
        2,
        0x3B6,
        x,
        100, 
        0x4B,
        6,
        8,
        0
    );
    unk13C++;
    sub_806A568(
        unk13C, 
        0, 
        2,
        0x3B6,
        x,
        0x8C, 
        0x4B,
        6,
        9,
        0
    );
}

static void Task_TimeRecordsScreenModeChoiceMain(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk4C = timeRecordsScreen->unk4C;
    
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

static void CreateTimeRecordsScreenAtCoursesView(struct PlayerDataMenu* playerProfileMenu) {
    struct Task* t = TaskCreate(Task_TimeRecordsScreenCreateTimesUI, sizeof(struct TimeRecordsScreen), 0x2000, 4, NULL);
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(t, timeRecordsScreen);
    s16 i;

    for (i = 1; i < NUM_CHARACTERS; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    timeRecordsScreen->playerDataMenu = playerProfileMenu;
    timeRecordsScreen->timeRecords = NULL;
    timeRecordsScreen->character = 0;
    timeRecordsScreen->zone = 0;
    timeRecordsScreen->act = 0;
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->unk708 = 0;
    timeRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        timeRecordsScreen->characterZones[i] = gLoadedSaveGame->unk7[i];
    }

    timeRecordsScreen->language = playerProfileMenu->language;
    timeRecordsScreen->isBossMode = FALSE;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_COURSES;
    
    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    sub_8068700(timeRecordsScreen);
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

static void sub_8068700(struct TimeRecordsScreen* timeRecordsScreen) {
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

    sub_806B854(&timeRecordsScreen->unkC,0,7,0x8B,0x1e,0x14,0,0,0,0);
    sub_806B854(&timeRecordsScreen->unk204,1,0x16,gUnknown_080D9590[character][0],9,0x14,0,1,0,0);
    sub_806B854(&timeRecordsScreen->unk244,2,0x1E,gUnknown_080D9590[character][1],9,0x14,0,2,0,0);
}

static void TimeRecordsScreenCreateCoursesViewUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct UNK_0808B3FC_UNK240* unk284 = timeRecordsScreen->unk284;
    struct UNK_0808B3FC_UNK240* unk4C = timeRecordsScreen->unk4C;
    struct UNK_0808B3FC_UNK240* unkAC = timeRecordsScreen->unkAC;
    struct UNK_0808B3FC_UNK240* unk10C = &timeRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = timeRecordsScreen->unk13C;
    
    u8 language = timeRecordsScreen->language;
    u8 zone = timeRecordsScreen->zone;
    u8 act = timeRecordsScreen->act;

    const struct UNK_080D95E8* r4, *r1, *r0;

    s16 temp;

    sub_806A568(unk13C,0,2,0x41A,0x1400,0xE,0x20,2,0,0);
    unk13C++;
    sub_806A568(unk13C,0,2,0x41A,0x1000,0x9C,0x20,2,0,0);
    unk13C++;
    sub_806A568(unk13C,0,2,0x41A,0x1000,0xD0,0x18,3,1,0);
    unk13C++;
    sub_806A568(unk13C,0,2,0x41A,0x1800,0xD0,0x8C,3,1,0);

    sub_806A568(unk284,0,0x10,0x417,0x1000,4,0x50,5,0xB,0);
    unk284++;
    sub_806A568(unk284,0,0x10,0x417,0x1000,0xC,0x68,5,0xC,0);
    unk284++;
    sub_806A568(unk284,0,0x10,0x417,0x1000,0x14,0x80,5,0xD,0);

// Might not be matching because of somethign to do with the data
#ifndef NON_MATCHING
    r0 = gUnknown_080D9F40;
    temp = sub_806B8D4(r0, ARRAY_COUNT(gUnknown_080D9F40));
#else
    temp = sub_806B8D4(gUnknown_080D9F40, ARRAY_COUNT(gUnknown_080D9F40));
#endif
    sub_806A568(unk4C,0,0x14,0x418,0x1000,0x10,0xC,3,0,0);
#ifndef NON_MATCHING
    asm("":"=r"(r0));
#endif

    unk4C++;
    r1 = &gUnknown_080D9F40[zone];
#ifndef NON_MATCHING
    asm("":::"sl");
#endif
    sub_806A568(unk4C,0,temp,r1->unk0,0x1000,0x5E,0xC,3,r1->unk2,0);

    if (!timeRecordsScreen->isBossMode) {
        sub_806A568(unkAC,0,0x10,0x418,0x1000,0x4E,0x20,3,1,0);
        unkAC++;
    
        r1 = &gUnknown_080D9F40[act];
        sub_806A568(unkAC,0,temp,r1->unk0,0x1000,0x88,0x20,3,r1->unk2,0);
    } else {
        sub_806A568(unkAC,0,0x14,0x418,0x1000,0x4e,0x20,3,9,0);  
    }

    if (!timeRecordsScreen->isBossMode) {
        r4 = &gUnknown_080D9FD0[language][timeRecordsScreen->zone];
    } else {
        r4 = &gUnknown_080DA120[language][timeRecordsScreen->zone];
    }

    temp = sub_806B8D4(r4, 7);
    sub_806A568(unk10C,0,temp, r4->unk0,0x1000,0x9a,0x44,3,r4->unk2,0);
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
        return timeRecordsScreen->playerDataMenu->optionsScreen->profileData.unkC.table[timeRecordsScreen->character][timeRecordsScreen->zone][act];
    } else {
        return timeRecordsScreen->timeRecords->table[timeRecordsScreen->character][timeRecordsScreen->zone][act];
    }
}

static void TimeRecordsScreenCreateTimesUI(struct TimeRecordsScreen* timeRecordsScreen) {
    struct TimeRecordDisplay* timeRecordDisplay = timeRecordsScreen->timeDisplays;
    // interesting optimistation, as I guess they are all the same size
    s16 digitSize = sTimeRecordDigitTiles[10].unk4;
    struct UNK_0808B3FC_UNK240* minuteDisplay, *secondDisplay, *milliDisplay, *deliminator;

    u16* courseTimes = LoadCourseTimes(timeRecordsScreen);
    s16 i;

    for (i = 0; i < 3; i++, timeRecordDisplay++) {
        const struct UNK_080D95E8* digit;
        s16 millis, minutes, seconds;
        u16 timeValue;

        deliminator = timeRecordDisplay->deliminators;
        minuteDisplay = &timeRecordDisplay->minute;
        secondDisplay = timeRecordDisplay->seconds;
        milliDisplay = timeRecordDisplay->millis;

        timeValue = courseTimes[i];
        if (timeValue < MAX_COURSE_TIME) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            millis = gMillisLookup[temp][0] * 10;
            millis += gMillisLookup[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        digit = &sTimeRecordDigitTiles[10];
        sub_806A568(deliminator,0,digitSize,digit->unk0,0x3000,(i * 8 + 48),(i * 24 + 84),8,digit->unk2,0);

        deliminator++;
        sub_806A568(deliminator,0,digitSize,digit->unk0,0x3000,(i * 8 + 96),(i * 24 + 84),8,digit->unk2,0);

        digit = &sTimeRecordDigitTiles[minutes];
        sub_806A568(minuteDisplay,0,digitSize,digit->unk0,0x3000,(i * 8 + 0x20),(i * 24 + 84),8,digit->unk2,0);

        digit = &sTimeRecordDigitTiles[seconds / 10];
        sub_806A568(secondDisplay,0,digitSize,digit->unk0,0x3000,(i * 8 + 0x40),(i * 24 + 84),8,digit->unk2,0);

        secondDisplay++;
        digit = &sTimeRecordDigitTiles[seconds % 10];
        sub_806A568(secondDisplay,0,digitSize,digit->unk0,0x3000,(i * 8 + 0x50),(i * 24 + 84),8,digit->unk2,0);

        digit = &sTimeRecordDigitTiles[millis / 10];
        sub_806A568(milliDisplay,0,digitSize,digit->unk0,0x3000,(i * 8 + 0x70),(i * 24 + 84),8,digit->unk2,0);
        
        milliDisplay++;
        digit = &sTimeRecordDigitTiles[millis % 10];
        sub_806A568(milliDisplay,0,digitSize,digit->unk0,0x3000,(i * 8 + 0x80),(i * 24 + 84),8,digit->unk2,0);
    }
}

static void TimeRecordsScreenRefreshTimesUI(struct TimeRecordsScreen* timeRecordsScreen) {
    // Stack has to be declared in this order to match
    struct TimeRecordDisplay* timeDisplay = timeRecordsScreen->timeDisplays;
    struct UNK_0808B3FC_UNK240* minuteDisplay, *secondDisplay, *milliDisplay, *deliminator;
    
    u16* courseTimes = LoadCourseTimes(timeRecordsScreen);
    s16 i;

    for (i = 0; i < 3; i++, timeDisplay++) {
        const struct UNK_080D95E8* digitTile;
        s16 millis, minutes, seconds;
        u16 timeValue;
        
        minuteDisplay = &timeDisplay->minute;
        secondDisplay = timeDisplay->seconds;
        milliDisplay = timeDisplay->millis;
        deliminator = timeDisplay->deliminators;
        
        timeValue = courseTimes[i];
        if (timeValue < MAX_COURSE_TIME) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            // This logic is the same as the above function but required to be
            // inline instead of split, but required to be split in the other function
            millis = gMillisLookup[temp][0] * 10 + gMillisLookup[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        digitTile = &sTimeRecordDigitTiles[minutes];
        
        minuteDisplay->unkA = digitTile->unk0;
        minuteDisplay->unk20 = digitTile->unk2;
        minuteDisplay->unk16 = (i * 8) + 272;
        sub_8004558(minuteDisplay);
        
        deliminator->unk16 = (i * 8) + 288;
        deliminator++;

        digitTile = &sTimeRecordDigitTiles[seconds / 10];
        secondDisplay->unkA = digitTile->unk0;
        secondDisplay->unk20 = digitTile->unk2;
        secondDisplay->unk16 = (i * 8) + 304;
        sub_8004558(secondDisplay);

        secondDisplay++;
        digitTile = &sTimeRecordDigitTiles[seconds % 10];
        secondDisplay->unkA = digitTile->unk0;
        secondDisplay->unk20 = digitTile->unk2;
        secondDisplay->unk16 = (i * 8) + 320;
        sub_8004558(secondDisplay);
    
        deliminator->unk16 = (i * 8) + 336;

        digitTile = &sTimeRecordDigitTiles[millis / 10];
        milliDisplay->unkA = digitTile->unk0;
        milliDisplay->unk20 = digitTile->unk2;
        milliDisplay->unk16 = (i * 8) + 352;
        sub_8004558(milliDisplay);

        milliDisplay++;
        digitTile = &sTimeRecordDigitTiles[millis % 10];
        milliDisplay->unkA = digitTile->unk0;
        milliDisplay->unk20 = digitTile->unk2;
        milliDisplay->unk16 = (i * 8) + 368;
        sub_8004558(milliDisplay);
    }
}

static void Task_TimeRecordsScreenHandleCharacterChange(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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

    sub_806B854(&timeRecordsScreen->unk204, 1, 0x16, gUnknown_080D9590[character][0], 9, 0x14, 0, 1, 0, 0);
    sub_806B854(&timeRecordsScreen->unk244, 2, 0x1E, gUnknown_080D9590[character][1], 9, 0x14, 0, 2, 0, 0);

    gCurTask->main = Task_TimeRecordsScreenCharacterChangeAnimIn;
}

static void Task_TimeRecordsScreenCharacterChangeAnimIn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);

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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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
        struct UNK_0808B3FC_UNK240* deliminatorDisplay = timeDisplay->deliminators;
        struct UNK_0808B3FC_UNK240* minuteDisplay = &timeDisplay->minute;
        struct UNK_0808B3FC_UNK240* secondDisplay = timeDisplay->seconds;
        struct UNK_0808B3FC_UNK240* milliDisplay = timeDisplay->millis;
        
        s16 baseXPos = (8 - frame) * 30 + (rowIndex * 8);
        minuteDisplay->unk16 = baseXPos + 0x20;
        deliminatorDisplay->unk16 = baseXPos + 0x30;
        deliminatorDisplay++;
        deliminatorDisplay->unk16 = baseXPos + 0x60;

        secondDisplay->unk16 = baseXPos + 0x40;
        secondDisplay++;
        secondDisplay->unk16 = baseXPos + 0x50;

        milliDisplay->unk16 = baseXPos + 0x70;
        milliDisplay++;
        milliDisplay->unk16 = baseXPos + 0x80;
    }
}

static void Task_TimeRecordsScreenCoursesViewMain(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    s16 availableZones = timeRecordsScreen->characterZones[timeRecordsScreen->character];
    s32 temp;
    if (availableZones == 0) {
        availableZones = 1;
    }
    // Possibly some macro
    temp = (u16)availableZones;
    if (temp > 0x1B) {
        availableZones = 0x1B;
    }
    TimeRecordsScreenRenderCoursesViewUI(0);

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        if (timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && availableZones == 1) {
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
                            timeRecordsScreen->zone = availableZones >> 2;
                            timeRecordsScreen->act = (availableZones & 3) != 1;
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
                    s32 backup = availableZones;
                    availableZones >>= 2;
                    r1 = backup & 3;
                    r5 = r1 != 1;
                    if (timeRecordsScreen->act > 0) {
                        timeRecordsScreen->act = 0;
                        if (timeRecordsScreen->zone < NUM_ZONES - 1) {
                            timeRecordsScreen->zone++;
                        } else {
                            timeRecordsScreen->zone = 0;
                        }

                        if (timeRecordsScreen->zone > availableZones) {
                            timeRecordsScreen->zone = 0;
                            timeRecordsScreen->act = 0;
                        }
                    } else {
                        timeRecordsScreen->act++;
                        if (timeRecordsScreen->zone >= availableZones
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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);

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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk7C = &timeRecordsScreen->unk4C[1];
    struct UNK_0808B3FC_UNK240* unkDC = &timeRecordsScreen->unkAC[1];
    struct UNK_0808B3FC_UNK240* unk10C = &timeRecordsScreen->unk10C;

    u16 language = timeRecordsScreen->language;
    const struct UNK_080D95E8* F40 = &gUnknown_080D9F40[timeRecordsScreen->zone];
    unk7C->unkA = F40->unk0;
    unk7C->unk20 = F40->unk2;
    
    sub_8004558(unk7C);

    if (!timeRecordsScreen->isBossMode) {
        F40 = &gUnknown_080D9F40[timeRecordsScreen->act];
        unkDC->unkA = F40->unk0;
        unkDC->unk20 = F40->unk2;
        sub_8004558(unkDC);
    }

    if (!timeRecordsScreen->isBossMode) {
        F40 = &gUnknown_080D9FD0[language][timeRecordsScreen->zone];
    } else {
        F40 = &gUnknown_080DA120[language][timeRecordsScreen->zone];
    }

    unk10C->unkA = F40->unk0;
    unk10C->unk20 = F40->unk2;
    sub_8004558(unk10C);
    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(0);
    timeRecordsScreen->animFrame = 0;
    gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
}

static void Task_TimeRecordsScreenFadeToPrevious(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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

            sub_80682AC();
            sub_80682EC(timeRecordsScreen);
            TimeRecordsScreenCreateModeChoiceUI(timeRecordsScreen);
            gCurTask->main = Task_TimeRecordsScreenChoiceViewFadeIn;
            break;
        case TIME_RECORDS_SCREEN_VIEW_COURSES:
            playerDataMenu->state = 0;
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
            sub_803143C(timeRecordsScreen->character, allCharactersUnlocked);
            break;
    }
}

static void TimeRecordsScreenRenderCoursesViewUI(u16 a) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct TimeRecordDisplay* timeRecord = timeRecordsScreen->timeDisplays;
    struct UNK_0808B3FC_UNK240* unk284 = timeRecordsScreen->unk284;
    struct UNK_0808B3FC_UNK240* unk4C = timeRecordsScreen->unk4C;
    struct UNK_0808B3FC_UNK240* unkAC = timeRecordsScreen->unkAC;
    struct UNK_0808B3FC_UNK240* unk10C = &timeRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = timeRecordsScreen->unk13C;

    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;

    s16 temp, i, j;
    s16 availableZones = timeRecordsScreen->characterZones[timeRecordsScreen->character];
    if (availableZones == 0) {
        availableZones = 1;
    }

    for (i = 0; i < 3; i++, unk284++) {
        sub_80051E8(unk284);
    }

    for (i = 0; i < 2; i++, unk4C++) {
        sub_80051E8(unk4C);
    }

    // No idea why j is reused here
    j = timeRecordsScreen->view != TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && 
        !a && 
        timeRecordsScreen->availableCharacters > 1 ? 
            4 : 
            2;
    temp = timeRecordsScreen->view == TIME_RECORDS_SCREEN_VIEW_TIME_ATTACK && 
        availableZones < 2 ? 
            0 : 
            j;

    for (i = 0; i < temp; i++, unk13C++) {
        sub_8004558(unk13C);
        sub_80051E8(unk13C);
    }

    if (timeRecordsScreen->isBossMode == 0) {
        for (i = 0; i < 2; i++, unkAC++) {
            sub_80051E8(unkAC);
        }
    } else {
        sub_80051E8(unkAC);
    }

    sub_80051E8(unk10C);

    for (i = 0; i < 3; i++, timeRecord++) {
        unk0 = timeRecord->deliminators;
        unk60 = &timeRecord->minute;
        unk90 = timeRecord->seconds;
        unkF0 = timeRecord->millis;

        for (j = 0; j < 2; j++, unk0++) {
            sub_80051E8(unk0);
        }

        sub_80051E8(unk60);

        for (j = 0; j < 2; j++, unk90++) {
            sub_80051E8(unk90);
        }

        for (j = 0; j < 2; j++, unkF0++) {
            sub_80051E8(unkF0);
        }
    }
}

static void CreateMultiplayerRecordsScreen(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(Task_MultiplayerRecordsScreenCreateNextTableRowUI, sizeof(struct MultiplayerRecordsScreen), 0x2000, 4, NULL);
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(t, multiplayerRecordsScreen);
    
    struct MultiplayerRecordRow* multiplayerRecords;
    struct OptionsScreenProfileData* profileData;
    s16 i, j;
    
    multiplayerRecordsScreen->table = EwramMallocStruct(struct MultiplayerRecordsTable);
    multiplayerRecordsScreen->playerDataMenu = playerDataMenu;

    multiplayerRecordsScreen->unk394 = 0;
    multiplayerRecordsScreen->unk3A4 = 0;
    multiplayerRecordsScreen->unk3A5 = 0;
    multiplayerRecordsScreen->unk3A6 = 0;
    multiplayerRecordsScreen->language = playerDataMenu->language;


    profileData = &playerDataMenu->optionsScreen->profileData;
    memcpy(multiplayerRecordsScreen->playerName, profileData->playerName, 12);
    multiplayerRecordsScreen->unk395 = profileData->unk34C;
    multiplayerRecordsScreen->unk396 = profileData->unk34D;
    multiplayerRecordsScreen->unk397 = profileData->unk34E;

    multiplayerRecords = multiplayerRecordsScreen->table->rows;
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 6; j++) {
            multiplayerRecords[i].playerName[j] = profileData->unk284[i].unk4[j];
            if (multiplayerRecords[i].playerName[j] == PLAYER_NAME_END_CHAR) {
                break;
            }
        }

        for (;j < 6; j++) {
            multiplayerRecords[i].playerName[j] = PLAYER_NAME_END_CHAR;
        }

        multiplayerRecords[i].unkC = profileData->unk284[i].unk10;
        multiplayerRecords[i].unkD = profileData->unk284[i].unk11;
        multiplayerRecords[i].unkE = profileData->unk284[i].unk12;
        multiplayerRecords[i].unkF = profileData->unk284[i].unk13;
    }

    ResetProfileScreensVram();

    sub_8069B40();
    sub_8069B88(multiplayerRecordsScreen);
    MultiplayerRecordsScreenCreatePlayerRecordRowUI(multiplayerRecordsScreen);
}

static void sub_8069B40(void) {
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

static void sub_8069B88(struct MultiplayerRecordsScreen* multiplayerRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    unk0->unk0 = 0;
    unk0->unk2 = 2;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    sub_806B854(&multiplayerRecordsScreen->unkC, 0, 7, 0x98, 0x1E, 0x14, 0, 0, 0, 0);
    sub_806B854(&multiplayerRecordsScreen->unk4C, 1, 0x16, 0x89, 0x1E, 0x14, 0, 1, 0, 0);
}

// PlayerRecordRow
static void MultiplayerRecordsScreenCreatePlayerRecordRowUI(struct MultiplayerRecordsScreen* multiplayerRecordsScreen) {
    s16 i, xPos, yPos;
    struct UNK_806B908 nameCharTile;
    s16 unk395, unk396, unk397;

    struct UNK_0808B3FC_UNK240* unk8C = &multiplayerRecordsScreen->unk8C;
    struct UNK_0808B3FC_UNK240* unkBC = &multiplayerRecordsScreen->unkBC;
    struct UNK_0808B3FC_UNK240* unkEC = multiplayerRecordsScreen->unkEC;
    struct UNK_0808B3FC_UNK240* unk14C = multiplayerRecordsScreen->unk14C;
    struct UNK_0808B3FC_UNK240* unk26C = multiplayerRecordsScreen->unk26C;
    struct UNK_0808B3FC_UNK240* unk2CC = multiplayerRecordsScreen->unk2CC;
    struct UNK_0808B3FC_UNK240* unk32C = multiplayerRecordsScreen->unk32C;

    const struct UNK_080D95E8* E00 = gUnknown_080D9E00[multiplayerRecordsScreen->language];
    const struct UNK_080D95E8* scrollArrowTile = sScrollArrowTiles;
    // The data is made into a pointer here but then another pointer is used for
    // the actual reference
    const struct UNK_080D95E8* E60Val, *E60 = gUnknown_080D9E60;

    sub_806A568(unk8C,0,E00->unk4,E00->unk0,0x1000,9,0x12,5,E00->unk2,0);

    E00++;
    sub_806A568(unkBC,0,E00->unk4,E00->unk0,0x1000,0x76,0x26,5,E00->unk2,0);
    
    sub_806A568(unkEC,0,scrollArrowTile->unk4,scrollArrowTile->unk0,0x1000,8,0x4E,0xD,scrollArrowTile->unk2,0);
    unkEC++;
    scrollArrowTile++;
    sub_806A568(unkEC,0,scrollArrowTile->unk4,scrollArrowTile->unk0,0x1000,8,0x88,0xD,scrollArrowTile->unk2,0);


    for (i = 0, xPos = 0x22, yPos = 0x3A; i < MAX_PLAYER_NAME_LENGTH; i++, unk14C++, xPos+= 0xC) {
        u16 nameChar = multiplayerRecordsScreen->playerName[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(
            unk14C, 
            0, 
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

    unk395 = multiplayerRecordsScreen->unk395;
    unk396 = multiplayerRecordsScreen->unk396;
    unk397 = multiplayerRecordsScreen->unk397;

    E60Val = &E60[unk395 / 10];
    sub_806A568(unk26C,0,E60Val->unk4,E60Val->unk0,0x2000,0x7C,0x40,0xD,E60Val->unk2,0);

    unk26C++;
    E60Val = &E60[unk395 % 10];
    sub_806A568(unk26C,0,E60Val->unk4,E60Val->unk0,0x2000,0x84,0x40,0xD,E60Val->unk2,0);

    E60Val = &E60[unk396 / 10];
    sub_806A568(unk2CC,0,E60Val->unk4,E60Val->unk0,0x2000,0xA4,0x40,0xD,E60Val->unk2,0);

    unk2CC++;
    E60Val = &E60[unk396 % 10];
    sub_806A568(unk2CC,0,E60Val->unk4,E60Val->unk0,0x2000,0xAC,0x40,0xD,E60Val->unk2,0);

    E60Val = &E60[unk397 / 10];
    sub_806A568(unk32C,0,E60Val->unk4,E60Val->unk0,0x2000,0xCC,0x40,0xD,E60Val->unk2,0);

    unk32C++;
    E60Val = &E60[unk397 % 10];
    sub_806A568(unk32C,0,E60Val->unk4,E60Val->unk0,0x2000,0xD4,0x40,0xD,E60Val->unk2,0);
}

static void MultiplayerRecordsScreenCreateTableRowUI(s16 i) { 
    s16 unkE, unkF, unkD, j, xPos, yPos;
    struct UNK_0808B3FC_UNK240* unk130, *unk190, *unk1F0, *unk10;

    struct UNK_806B908 nameCharTile;

    struct MultiplayerRecordRow* record = &((struct MultiplayerRecordsScreen*)(IWRAM_START + gCurTask->structOffset))->table->rows[i];
    const struct UNK_080D95E8 *E60Val, *E60 = gUnknown_080D9E60;

    if (!record->unkC) {
        return;
    }

    yPos = i * 18 + 90;
    unk10 = record->unk10;
    
    for (j = 0, xPos = 34; j < MAX_PLAYER_NAME_LENGTH; j++, unk10++, xPos+= 12) {
        u16 nameChar = record->playerName[j];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 17;
        }

        nameCharTile = sub_806B908(nameChar);
        sub_806A568(
            unk10, 
            0, 
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

    unkD = record->unkD;
    unkE = record->unkE;
    unkF = record->unkF;
    yPos += 6; 

    E60Val = &E60[unkD / 10];
    sub_806A568(&record->unk130[0],0,E60Val->unk4,E60Val->unk0,0x2000,0x7C,yPos,0xD,E60Val->unk2,0);

    E60Val = &E60[unkD % 10];
    sub_806A568(&record->unk130[1],0,E60Val->unk4,E60Val->unk0,0x2000,0x84,yPos,0xD,E60Val->unk2,0);

    E60Val = &E60[unkE / 10];
    sub_806A568(&record->unk190[0],0,E60Val->unk4,E60Val->unk0,0x2000,0xA4,yPos,0xD,E60Val->unk2,0);

    E60Val = &E60[unkE % 10];
    sub_806A568(&record->unk190[1],0,E60Val->unk4,E60Val->unk0,0x2000,0xAC,yPos,0xD,E60Val->unk2,0);

    E60Val = &E60[unkF / 10];
    sub_806A568(&record->unk1F0[0],0,E60Val->unk4,E60Val->unk0,0x2000,0xCC,yPos,0xD,E60Val->unk2,0);

    E60Val = &E60[unkF % 10];
    sub_806A568(&record->unk1F0[1],0,E60Val->unk4,E60Val->unk0,0x2000,0xD4,yPos,0xD,E60Val->unk2,0);
}

static void Task_MultiplayerRecordsScreenMain(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct MultiplayerRecordRow* rows = multiplayerRecordsScreen->table->rows;

    MultiplayerRecordsScreenRenderUI();

    if (gRepeatedKeys & (DPAD_DOWN | DPAD_UP)) {
        if (gRepeatedKeys & DPAD_UP) {
            if (multiplayerRecordsScreen->unk3A6) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                multiplayerRecordsScreen->unk3A5 = multiplayerRecordsScreen->unk3A6;
                multiplayerRecordsScreen->unk3A4 = --multiplayerRecordsScreen->unk3A6;

                gCurTask->main = sub_806A1D0;
                return;
            }
        } else if (gRepeatedKeys & DPAD_DOWN) {
            if (multiplayerRecordsScreen->unk3A6 >= 6) {
                return;
            }
            
            rows = &rows[multiplayerRecordsScreen->unk3A6 + 4];
            if (rows->unkC) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                multiplayerRecordsScreen->unk3A4 = multiplayerRecordsScreen->unk3A6;
                multiplayerRecordsScreen->unk3A5 = multiplayerRecordsScreen->unk3A6;
                multiplayerRecordsScreen->unk3A6++;

                gCurTask->main = sub_806A1D0;
                return;
            }
        }
    }

    if (gRepeatedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        Task_MultiplayerRecordsScreenHandleExit();
    }
}

static void sub_806A1D0(void) {
    struct MultiplayerRecordRow* row;
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    s16 pos, temp;
    s16 numRows = 5;
    s16 i, j;
    multiplayerRecordsScreen->unk394++;

    if (multiplayerRecordsScreen->unk3A6 < multiplayerRecordsScreen->unk3A5) {
        temp = multiplayerRecordsScreen->unk394 * 2 + 72;
    } else {
        temp = 90 - (multiplayerRecordsScreen->unk394 * 2);
    }
    pos = temp;

    if (multiplayerRecordsScreen->unk394 > 8) {
        pos = 0x5A;
        multiplayerRecordsScreen->unk3A4 = multiplayerRecordsScreen->unk3A6;
    }

    if (multiplayerRecordsScreen->unk3A4 == 6) { 
        numRows--;
    }

    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->unk3A4];

    for (i = 0; i < numRows; i++, pos += 18, row++) {
        struct UNK_0808B3FC_UNK240* unk10, *unk130, *unk190, *unk1F0;
        
        unk10 = row->unk10;
        for (j = 0; j < 6; j++, unk10++) {
            unk10->unk18 = pos;
        }

        unk130 = row->unk130;
        for (j = 0; j < 2; j++, unk130++) {
            unk130->unk18 = pos + 6;
        }

        unk190 = row->unk190;
        for (j = 0; j < 2; j++, unk190++) {
            unk190->unk18 = pos + 6;
        }

        unk1F0 = row->unk1F0;
        for (j = 0; j < 2; j++, unk1F0++) {
            unk1F0->unk18 = pos + 6;
        }
    }

    MultiplayerRecordsScreenRenderUI();

    if (multiplayerRecordsScreen->unk394 > 8) {
        multiplayerRecordsScreen->unk394 = 0;
        gCurTask->main = Task_MultiplayerRecordsScreenMain;
    }
}

static void MultiplayerRecordsScreenRenderUI(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk8C = &multiplayerRecordsScreen->unk8C;
    struct UNK_0808B3FC_UNK240* unkBC = &multiplayerRecordsScreen->unkBC;
    struct UNK_0808B3FC_UNK240* unk14C = multiplayerRecordsScreen->unk14C;
    struct UNK_0808B3FC_UNK240* unk26C = multiplayerRecordsScreen->unk26C;
    struct UNK_0808B3FC_UNK240* unk2CC = multiplayerRecordsScreen->unk2CC;
    struct UNK_0808B3FC_UNK240* unk32C = multiplayerRecordsScreen->unk32C;
    struct UNK_0808B3FC_UNK240* unkEC;

    // recordsTable completely unused in this var, but needs to be assigned to match
    struct MultiplayerRecordsTable* recordsTable = multiplayerRecordsScreen->table;
    struct MultiplayerRecordRow* row;
    
    s16 i, j;
    s16 numRows = 5;

    sub_80051E8(unk8C);
    sub_80051E8(unkBC);

    unkEC = multiplayerRecordsScreen->unkEC;
    sub_8004558(unkEC);
    unkEC++;
    sub_8004558(unkEC);
    unkEC--;

    if (multiplayerRecordsScreen->unk3A6 != 0) {
        sub_80051E8(unkEC);
    }
    unkEC++;
    
    // Maybe they meant to use the assignment here
    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->unk3A6 + 4];
    if (multiplayerRecordsScreen->unk3A6 < 6 && row->unkC) {
        sub_80051E8(unkEC);
    }

    for (i = 0; i < 6; i++, unk14C++) {
        sub_80051E8(unk14C);
    }

    for (i = 0; i < 2; i++, unk26C++) {
        sub_80051E8(unk26C);
    }

    for (i = 0; i < 2; i++, unk2CC++) {
        sub_80051E8(unk2CC);
    }

    for (i = 0; i < 2; i++, unk32C++) {
        sub_80051E8(unk32C);
    }

    if (multiplayerRecordsScreen->unk3A4 == 6) {
        numRows--;
    }

    row = &multiplayerRecordsScreen->table->rows[multiplayerRecordsScreen->unk3A4];

    for (i = 0; i < numRows; i++, row++) {
        if (!row->unkC) {
            continue;
        }

        for (unk14C = row->unk10, j = 0; j < 6; j++, unk14C++) {
            sub_80051E8(unk14C);
        }

        unk26C = row->unk130;
        unk2CC = row->unk190;
        unk32C = row->unk1F0;
        sub_80051E8(unk26C);
        ++unk26C;
        sub_80051E8(unk26C);
        sub_80051E8(unk2CC);
        ++unk2CC;
        sub_80051E8(unk2CC);
        sub_80051E8(unk32C);
        ++unk32C;
        sub_80051E8(unk32C);
    }
}

// Some sort of register menu item function
// used in sound test, but wonder why it wasn't split out
void sub_806A568(struct UNK_0808B3FC_UNK240* obj, s8 target, u32 size, u16 c, u32 d, s16 xPos, s16 yPos, u16 g, u8 h, u8 focused) {
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
    element->unk10 = d;
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
static inline bool16 sub_806A664_A(s16 a, u16 b) {
    u16 unk5C4[2];
    u16 unk5C8[5];
    u16 *cursor; 

    memcpy(unk5C4, gUnknown_080D95C4, 4);
    memcpy(unk5C8, gUnknown_080D95C8, 10);

    cursor = unk5C4;
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

// Feels like it should be part of the UI module at the end but is declared here instead
static u16 sub_806A664(s16 a, u16 b) {
    u16 unk5D2[2];
    u16 unk5D6[4][2];
    s16 i;

    memcpy(unk5D2, gUnknown_080D95D2, 4);
    memcpy(unk5D6, gUnknown_080D95D6, 16);

    if (!sub_806A664_A(a, b)) {
        return b;
    }

    if (a == 1 && b == 2) {
        return 0x10B;
    } else if (a == 1) {
        for (i = 0; i < 4; i++) {
            if (b >= unk5D6[i][0] && b <= unk5D6[i][0] + 4) {
                return (b + unk5D6[i][1] - unk5D6[i][0]);
            }
        }
    } else if (b >= unk5D2[0] && b <= unk5D2[0] + 4) {
        return (b + unk5D2[1] - unk5D2[0]);
    }

    return b;
}

static void OptionsScreenTaskDestroyHandler(struct Task* optionsScreenTask) {
    // unimplemented
}

static void Task_ShowOptionsScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

    sub_8063D20(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);

    sub_806A794(optionsScreen);
    OptionsScreenCreateUI(optionsScreen, OPTIONS_SCREEN_STATE_ACTIVE);
    gCurTask->main = Task_OptionScreenFadeIn;
}

static void sub_806A794(struct OptionsScreen* optionsScreen) {
    sub_806B854(&optionsScreen->unk364, 0, 7, 0x85, 0x1E, 0x14, 0, 0, 0, 0);
    sub_806B854(&optionsScreen->unk3A4, 1, 0xE, 0x86, 0x1E, 0x14, 0, 1, 0, 0);
}

static void Task_OptionScreenFadeIn(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

static void OptionsScreenOpenSelectedSubMenu(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        CreateEditLanguageScreen(optionsScreen);
        optionsScreen->state = 1;
        gCurTask->main = Task_OptionsScreenWaitForLanguageScreenExit;
    }
}

static void Task_OptionsScreenFadeInFromLanguageScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }   
}

/** Menu 2 **/

static void OptionsScreenShowSoundTestScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        CreateSoundTestScreen(optionsScreen);
        optionsScreen->state = OPTIONS_SCREEN_STATE_SUB_MENU_OPEN;
        gCurTask->main = Task_OptionsScreenWaitForSoundTestExit;
    }
}

static void Task_OptionsScreenFadeInFromSoundTest(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Menu 3 **/

static void OptionsScreenShowDeleteScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
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
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        CreateDeleteScreen(optionsScreen);
        optionsScreen->state = 1;
        gCurTask->main = Task_OptionsScreenWaitForDeleteScreenExit;
    }
}

static void Task_OptionsScreenFadeInFromDeleteScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    OptionsScreenRenderUI();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionsScreenMain;
    }
}

/** Player Data Menu 1 **/

static void PlayerDataMenuShowProfileNameScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        CreateEditProfileNameScreen(playerDataMenu);
        playerDataMenu->state = 1;
        playerDataMenu->optionsScreen->state = 2;
        gCurTask->main = Task_PlayerDataMenuWaitForProfileNameScreenExit;
    }
}

static void Task_PlayerDataMenuFadeInFromProfileNameScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnim;
    }
}

/** Player Data Menu 2 **/

static void PlayerDataMenuShowTimeRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnim;
    }
}

/** Player Data Menu 3 **/

static void PlayerDataMenuShowMultiplayerRecordsScreen(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
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
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    PlayerDataMenuRenderUI();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = Task_PlayerDataMenuOpenAnim;
    }
}

static void OptionsScreenHandleExit(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = Task_OptionsScreenFadeOutAnimAndSave;
}

static void Task_OptionsScreenFadeOutAnimAndSave(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    if (!sub_802D4CC(unk270)) {
        OptionsScreenRenderUI();
    } else {
        SetProfileData(optionsScreen);
        WriteSaveGame();
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        CreateTitleScreenAtSinglePlayerMenu();
    }
}

static void PlayerDataMenuRenderUI(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);

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
    struct Task* t = TaskCreate(Task_DifficultyMenuOpenAnim, sizeof(struct SwitchMenu), 0x2000, 4, NULL);
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(t, difficultyMenu);
    
    difficultyMenu->optionsScreen = optionsScreen;
    difficultyMenu->switchValue = optionsScreen->difficultyLevel;
    difficultyMenu->language = optionsScreen->language;
    difficultyMenu->animFrame = 0;

    DifficultyMenuCreateUI(difficultyMenu);
}

static void DifficultyMenuRenderUI(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask, difficultyMenu);
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
    struct Task* t = TaskCreate(Task_TimeLimitMenuOpenAnim, sizeof(struct SwitchMenu), 0x2000, 4, 0);
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(t, timeLimitMenu);

    timeLimitMenu->optionsScreen = optionsScreen;
    timeLimitMenu->switchValue = optionsScreen->timeLimitEnabled;
    timeLimitMenu->language = optionsScreen->language;
    timeLimitMenu->animFrame = 0;
    TimeLimitMenuCreateUI(timeLimitMenu);
}

static void sub_806AF10(void) {
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(gCurTask, timeLimitMenu);
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

static void sub_806AF6C(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;
    
    unk214->unk18 = 0x2A;
    unk1B4->unk18 = 0x35;
    unk1B4++;
    unk1B4->unk18 = 0x35;

    ButtonConfigMenuRenderUI();
    gCurTask->main = Task_ButtonConfigMenuMain;
}

static void sub_806AFAC(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;
    
    unk214->unk18 = 0x42;
    unk1B4->unk18 = 0x4D;
    unk1B4++;
    unk1B4->unk18 = 0x4D;

    ButtonConfigMenuRenderUI();
    gCurTask->main = sub_8066220;
}

static void sub_806AFEC(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = buttonConfigMenu->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &buttonConfigMenu->unk214;
    
    unk214->unk18 = 0x5A;
    unk1B4->unk18 = 0xB4;
    unk1B4++;
    unk1B4->unk18 = 0xB4;

    ButtonConfigMenuRenderUI();
    gCurTask->main = sub_8066478;
}

static void CreateEditLanguageScreen(struct OptionsScreen* optionScreen) {
    struct Task* t = TaskCreate(Task_LanguageScreenFadeIn, sizeof(struct LanguageScreen), 0x2000, 4, NULL);
    struct LanguageScreen* languageScreen = TaskGetStructPtr(t, languageScreen);

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
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
    struct UNK_802D4CC_UNK270* unk1F0 = &languageScreen->unk1F0;

    RenderLanguageScreenUI();
    ReseedRng();

    if (sub_802D4CC(unk1F0)) {
        gCurTask->main = Task_LanguageScreenMain;
    }
}


static void LanguageScreenHandleExit(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
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
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
    struct UNK_802D4CC_UNK270* unk1F0 = &languageScreen->unk1F0;
    ReseedRng();

    if (!sub_802D4CC(unk1F0)) {
        RenderLanguageScreenUI();
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

static void RenderLanguageScreenUI(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
    
    struct UNK_0808B3FC_UNK240* unk0 = languageScreen->headerFooter;
    struct UNK_0808B3FC_UNK240* unk60 = languageScreen->menuItems;
    struct UNK_0808B3FC_UNK240* unk180 = &languageScreen->menuItemOutline;

    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        sub_80051E8(unk0);
    }

    for (i = 0; i < 6; i++, unk60++) {
        sub_80051E8(unk60);
    }

    sub_80051E8(unk180);
}

static void sub_806B258(struct DeleteScreen* deleteScreen) {
    sub_806B854(&deleteScreen->unk1F0,0,7,0x86,0x1e,0x14,0,0,0,0);
}

static void Task_DeleteScreenFadeIn(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);
    struct UNK_802D4CC_UNK270* unk130 = &deleteScreen->unk130;
    DeleteScreenRenderUI();
    if (sub_802D4CC(unk130)) {
        gCurTask->main = Task_DeleteScreenConfrimationMain;
    }
}

static void Task_DeleteScreenHandleExit(void) {
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);
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
    struct DeleteScreen* deleteScreen = TaskGetStructPtr(gCurTask, deleteScreen);
    
    struct UNK_0808B3FC_UNK240* unk0 = deleteScreen->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = deleteScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteScreen->unkC0;

    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        sub_80051E8(unk0);
    }

    for (i = 0; i < 2; i++, unk60++) {
        sub_80051E8(unk60);
    }

    sub_80051E8(unkC0);
}

static void Task_ProfileNameScreenFadeIn(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;

    ProfileNameScreenRenderUI();

    if (sub_802D4CC(unk140)) {
        profileNameScreen->matrixCursorIndex = 0;
        gCurTask->main = Task_ProfileNameScreenMain;
    }
}

UNUSED static void sub_806B394(struct TimeRecordsScreen* timeRecordsScreen) {
    timeRecordsScreen->animFrame = 0;
    timeRecordsScreen->isBossMode = 0;
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    ResetProfileScreensVram();

    sub_80682AC();
    sub_80682EC(timeRecordsScreen);
    TimeRecordsScreenCreateModeChoiceUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenChoiceViewFadeIn;
}

static void Task_TimeRecordsScreenChoiceViewFadeIn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    TimeRecordsScreenRenderModeChoiceUI();

    if (sub_802D4CC(unk0)) {
        gCurTask->main = Task_TimeRecordsScreenModeChoiceMain;
    }
}

static void TimeRecordsScreenHandleExit(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;
    struct PlayerDataMenu* playerProfileMenu = timeRecordsScreen->playerDataMenu;

    if (!sub_802D4CC(unk0)) {
        TimeRecordsScreenRenderModeChoiceUI();
        return;
    }
 
    playerProfileMenu->state = 0;
    TaskDestroy(gCurTask);
}

static void TimeRecordsScreenShowCoursesView(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;

    if (!sub_802D4CC(unk0)) {
        TimeRecordsScreenRenderModeChoiceUI();
        return;
    }

    TimeRecordsScreenCreateCoursesView(timeRecordsScreen);
}

static void TimeRecordsScreenRenderModeChoiceUI(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);

    struct UNK_0808B3FC_UNK240* unk10C = &timeRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = timeRecordsScreen->unk13C;
    struct UNK_0808B3FC_UNK240* unk4C = timeRecordsScreen->unk4C;
    s16 i;

    sub_80051E8(unk10C);

    for (i = 0; i < 2; i++, unk4C++) {
        sub_80051E8(unk4C);
    }

    for (i = 0; i < 2; i++, unk13C++) {
        sub_8004558(unk13C);
        sub_80051E8(unk13C);
    }
}

static void TimeRecordsScreenCreateCoursesView(struct TimeRecordsScreen* timeRecordsScreen) {
    timeRecordsScreen->view = TIME_RECORDS_SCREEN_VIEW_MODE_CHOICE;
    ResetProfileScreensVram();

    TimeRecordsScreenInitRegisters();
    sub_8068700(timeRecordsScreen);
    TimeRecordsScreenCreateCoursesViewUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenCreateTimesUI;
}

static void Task_TimeRecordsScreenCreateTimesUI(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    TimeRecordsScreenCreateTimesUI(timeRecordsScreen);

    gCurTask->main = Task_TimeRecordsScreenCoursesViewFadeIn;
}

static void Task_TimeRecordsScreenCoursesViewFadeIn(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &timeRecordsScreen->unk0;
    TimeRecordsScreenRenderCoursesViewUI(0);
    
    if (sub_802D4CC(unk0)) {
        timeRecordsScreen->animFrame = 0;
        gCurTask->main = Task_TimeRecordsScreenCoursesViewMain;
    }
}

static void Task_TimeRecordsScreenHandleActChange(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
    struct UNK_0808B3FC_UNK240* unkDC = &timeRecordsScreen->unkAC[1];

    const struct UNK_080D95E8* unk5E8 = &gUnknown_080D9F40[timeRecordsScreen->act];

    unkDC->unkA = unk5E8->unk0;
    unkDC->unk20 = unk5E8->unk2;

    sub_8004558(unkDC);
    TimeRecordsScreenRefreshTimesUI(timeRecordsScreen);
    TimeRecordsScreenRenderCoursesViewUI(0);

    timeRecordsScreen->animFrame = 0;
    gCurTask->main = Task_TimeRecordsScreenCourseChangeAnim;
}

static void Task_TimeRecordsScreenHandleCourseSelected(void) {
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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
    struct TimeRecordsScreen* timeRecordsScreen = TaskGetStructPtr(gCurTask, timeRecordsScreen);
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
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);

    MultiplayerRecordsScreenCreateTableRowUI(multiplayerRecordsScreen->unk394);

    if (++multiplayerRecordsScreen->unk394 > MULTIPLAYER_RECORDS_SCREEN_NUM_RECORD_ROWS) {
        multiplayerRecordsScreen->unk394 = 0;
        gCurTask->main = Task_MultiplayerRecordsScreenFadeIn;
    }
}

static void Task_MultiplayerRecordsScreenFadeIn(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    MultiplayerRecordsScreenRenderUI();

    if (sub_802D4CC(unk0)) {
        gCurTask->main = Task_MultiplayerRecordsScreenMain;
    }
}

static void Task_MultiplayerRecordsScreenHandleExit(void) {
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
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
    struct MultiplayerRecordsScreen* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
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
