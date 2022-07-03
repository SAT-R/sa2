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
extern void* gUnknown_03005B50;
extern void* gUnknown_03005B54;

// CreateOptionsScreen stuff
static void sub_806A75C(void);
static void sub_806A758(struct Task*);

static void GetProfileData(struct OptionsScreen*);

static void sub_806B5A4(void);
static void sub_8068640(void);
static void sub_8068700(struct CourseRecordsScreen*);
static void sub_80687BC(struct CourseRecordsScreen*);

static void sub_806B0D8(void);
static void sub_80668A8(struct LanguageScreen*);
static void sub_806B0AC(struct LanguageScreen*);
static void sub_8066930(struct LanguageScreen*);

static void sub_806B354(void);
static void sub_8067420(s16);
static void ProfileNameScreenCreateUIBackgrounds(struct ProfileNameScreen*);
static void ProfileNameScreenCreateUIText(struct ProfileNameScreen*);
static void ProfileNameScreenCreateUIContextElements(struct ProfileNameScreen*);
static void ProfileNameScreenCreateInputDisplayUI(struct ProfileNameScreen*);

static void sub_80649A4(void);
static void OptionScreenShowSoundTestScreen(void);
static void OptionScreenShowLanguageScreen(void);
static void OptionScreenShowDeleteGameDataScreen(void);
static void OptionScreenHandleExit(void);
static void OptionsScreenOpenSelectedSubMenu(void);
static void sub_8064304(void);

static void sub_806A8A8(void);
static void sub_806A968(void);
static void sub_806AA18(void);
static void sub_806AAC8(void);

static void sub_8064C44(void);
static void RenderPlayerDataMenuUI(struct PlayerDataMenu*);

static void sub_806AD98(void);
static void Task_OptionsPlayerDataMenuMain(void);

static void sub_806ABC4(void);
static void sub_806AAFC(void);
static void sub_806AC28(void);
static void sub_8064E6C(void);

static void sub_806AB90(void);
static void sub_8068198(struct PlayerDataMenu*);
static void sub_8068524(struct PlayerDataMenu*);
static void sub_806508C(void);

static void sub_806ABF4(void);
static void sub_806ACBC(void);
static void sub_806AE54(void);
static void sub_806548C(void);

static void sub_80655FC(void);
static void sub_806AF10(void);
static void sub_80658E0(void);

static void sub_8065A50(void);
static void sub_8065F04(void);
static void RenderButtonConfigMenuUI(struct ButtonConfigMenu*);
static void sub_8066818(void);
static void sub_8066004(void);
static void sub_806AFAC(void);
static void sub_8066718(void);
static void sub_80665D8(void);
static void sub_806AFEC(void);
static void sub_806AF6C(void);

static void sub_8066818(void);
static void sub_806B1B8(void);
static void sub_8066C2C(void);
static void sub_806B1F8(void);
static void sub_806B110(void);

static void sub_806B280(void);
static void sub_8066D90(struct DeleteGameDataScreen*);
static void sub_806B258(struct DeleteGameDataScreen*);
static void sub_8066E18(struct DeleteGameDataScreen*);

static void sub_806B2F8(void);
static void sub_806709C(void);
static void sub_806B2B4(void);

static void sub_8067148(void);

static void RenderProfileNameScreenUI(void);
static bool16 ProfileNameScreenHandleShoulderInput(void);
static bool16 ProfileNameScreenHandleDpadInput(void);
static u16 sub_806A664(s16, u16);
static void ProfileNameScreenInputComplete(void);
static void ProfileNameScreenHandleExit(void);

static void sub_806B3F0(void);
static void sub_80682AC(void);
static void sub_80682EC(struct CourseRecordsScreen*);
static void sub_806834C(struct CourseRecordsScreen*);

static void sub_806B4F8(void);
static void sub_806B498(void);
static void sub_806B424(void);

static void sub_806979C(u16);
static void sub_80690A4(void);

static void sub_8069110(void);

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

#define PLAYER_DATA_MENU_ITEM_CHANGE_NAME 0
#define PLAYER_DATA_MENU_ITEM_TIME_RECORDS 1
#define PLAYER_DATA_MENU_ITEM_VS_RECORDS 2
#define PLAYER_DATA_MENU_ITEM_EXIT 3

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

extern const struct UNK_080D95E8 gUnknown_080D9A80[6];
extern const struct UNK_080D95E8 gUnknown_080D9AE0[6];
extern const struct UNK_080D95E8 gUnknown_080D9B10[6];
extern const struct UNK_080D95E8 gUnknown_080D9AB0[6];

extern const struct UNK_080D95E8 gUnknown_080D9B40[6];
extern const struct UNK_080D95E8 gUnknown_080D9BA0[6];
extern const struct UNK_080D95E8 gUnknown_080D9BD0[6][2];

extern const struct UNK_080D95E8 gUnknown_080D9B70[6];

extern const struct UNK_080D95E8 sProfileNameScreenNewTitleText[6];
extern const struct UNK_080D95E8 sProfileNameScreenEditTitleText[6];
extern const struct UNK_080D95E8 sProfileNameScreenArrowTiles[2];
extern const struct UNK_080D95E8 sProfileNameScreenEndButtonText[6];

extern const struct UNK_080D95E8 sProfileNameScreenScrollTiles[2];

extern const struct UNK_080D95E8 gUnknown_080D9EB0[6];
extern const struct UNK_080D95E8 gUnknown_080D9EE0[6][2];
extern const u16 gUnknown_080D9590[5][2];
extern const struct UNK_080D95E8 gUnknown_080D9F40[7];
extern const struct UNK_080D95E8 gUnknown_080D9FD0[6][7];
extern const struct UNK_080D95E8 gUnknown_080DA120[6][7];
extern const struct UNK_080D95E8 gUnknown_080D9F78[11];
extern const u8 gUnknown_080D6B80[60][2];


void CreateOptionsScreen(u16 p1) {
    struct Task* t;
    struct OptionsScreen* optionsScreen;
    s16 i;

    m4aSongNumStart(MUS_OPTIONS);

    t = TaskCreate(sub_806A75C, sizeof(struct OptionsScreen), 0x1000, TASK_x0004, sub_806A758);
    optionsScreen = TaskGetStructPtr(t, optionsScreen);

    GetProfileData(optionsScreen);

    optionsScreen->unk358 = p1;
    optionsScreen->subMenuXPos = 0;
    optionsScreen->unk781 = 0;
    optionsScreen->transitionFrame = 0;
    optionsScreen->menuCursor = 0;
    optionsScreen->unk782 = 0xFF;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }
}

// The logic for showing TA records
// and selecting a time attack course is the same
// so this is within the profile source.
void CreateCourseRecordsScreen(u16 p1, u16 selectedCharacter) {
    struct Task* t = TaskCreate(sub_806B5A4, sizeof(struct CourseRecordsScreen), 0x2000, TASK_x0004, NULL);
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(t, courseRecordsScreen);
    s16 i;

    for (i = 1; i < NUM_CHARACTERS; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    courseRecordsScreen->playerProfileMenu = 0;
    courseRecordsScreen->timeRecords = EwramMallocStruct(struct TimeRecords);
    courseRecordsScreen->character = selectedCharacter;
    courseRecordsScreen->zone = 0;
    courseRecordsScreen->act = 0;
    courseRecordsScreen->unk707 = 0;
    courseRecordsScreen->unk708 = 0;
    courseRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        courseRecordsScreen->characterZones[i] = gLoadedSaveGame->unk7[i];
    }

    courseRecordsScreen->language = LanguageIndex(gLoadedSaveGame->unk6);
    courseRecordsScreen->showingBossRecords = p1;
    courseRecordsScreen->mode = 2;

    if (courseRecordsScreen->language > NUM_LANGUAGES - 1) {
        courseRecordsScreen->language = LanguageIndex(LANG_ENGLISH);
    }

    memcpy(courseRecordsScreen->timeRecords, &gLoadedSaveGame->unk34, sizeof(struct TimeRecords));

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8068640();
    sub_8068700(courseRecordsScreen);
    sub_80687BC(courseRecordsScreen);
    m4aSongNumStart(MUS_TA_COURSE_SELECTION);
}

void CreateNewProfileScreen(void) {
    struct Task* t;
    struct LanguageScreen* languageScreen;

    ShuffleRngSeed();

    t = TaskCreate(sub_806B0D8, sizeof(struct LanguageScreen), 0x2000, TASK_x0004, 0);
    languageScreen = TaskGetStructPtr(t, languageScreen);

    languageScreen->optionsScreen = NULL;
    languageScreen->menuCursor = gLoadedSaveGame->unk6 - 1;
    languageScreen->creatingNewProfile = TRUE;

    if ((u8)languageScreen->menuCursor >= NUM_LANGUAGES) {
        languageScreen->menuCursor = 1;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_80668A8(languageScreen);
    sub_806B0AC(languageScreen);
    sub_8066930(languageScreen);
}

void CreateNewProfileNameScreen(s16 mode) {
    struct Task* t = TaskCreate(sub_806B354, sizeof(struct ProfileNameScreen), 0x2000, TASK_x0004, NULL);
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
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8067420(profileNameScreen->language);
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
    optionsScreen->unk35D = saveGame->unk12;
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

    if (optionsScreen->unk35D > 1) {
        optionsScreen->unk35D = 0;
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
    saveGame->unk12 = optionsScreen->unk35D;
}

static void sub_8063D20(struct OptionsScreen* optionsScreen, s16 p2) {
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    if (!p2) {
        gBgScrollRegs[2][0] = 0xFF28;
    } else {
        gBgScrollRegs[2][0] = 0;
    }

    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    if (!p2) {
        unk774->unk0 = 0;
        unk774->unk2 = 2;
        unk774->unk4 = 0;
        unk774->unk6 = 0x100;
        unk774->unkA = 0;
        unk774->unk8 = 0xFF;

        sub_802D4CC(unk774);
    }
}

static void sub_8063DCC(struct OptionsScreen* optionsScreen, s16 p2) {
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

            if (p2 == 1 && i == OPTIONS_MENU_ITEM_PLAYER_DATA) {
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
        if (p2 == 1) {
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
        if (p2 == 1 && i == 0) {
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

static void Task_OptionScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

    sub_80649A4();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        switch(optionsScreen->menuCursor) {
            case OPTIONS_MENU_ITEM_LANGUAGE:
                OptionScreenShowLanguageScreen();
                return;
            case OPTIONS_MENU_ITEM_SOUND_TEST:
                // SoundTest
                OptionScreenShowSoundTestScreen();
                return;
            case OPTIONS_MENU_ITEM_DELETE_GAME_DATA:
                OptionScreenShowDeleteGameDataScreen();
                return;
            case OPTIONS_MENU_ITEM_EXIT:
                OptionScreenHandleExit();
                return;
            default:
                // For other menu items we can just handle this generically
                OptionsScreenOpenSelectedSubMenu();
                return;
        }
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        OptionScreenHandleExit();
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
        optionsScreen->transitionFrame = 0;
        gCurTask->main = sub_8064304;
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
        
        optionsScreen->transitionFrame = 0;
        gCurTask->main = sub_8064304;
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

static void sub_8064304(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    s16 unk783 = optionsScreen->transitionFrame;
    
    sub_8064304_A(optionsScreen, gUnknown_080D9540[0][unk783]);
    sub_8064304_B(optionsScreen, gUnknown_080D9540[1][unk783]);

    sub_80649A4();

    if (++optionsScreen->transitionFrame > 7) {
        gCurTask->main = Task_OptionScreen;
    }
}

static inline void sub_80644C4_A(struct OptionsScreen* optionsScreen, const s16* transitionFrames) {
    s16 baseXPos = optionsScreen->subMenuXPos = transitionFrames[optionsScreen->transitionFrame];
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

static void sub_80644C4(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    
    sub_80644C4_A(optionsScreen, gUnknown_080D9550);
    sub_80649A4();

    if (++optionsScreen->transitionFrame > 15) {
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_806A8A8;
    }
}

static void sub_80645E0(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    
    sub_80644C4_A(optionsScreen, gUnknown_080D9570);
    sub_80649A4();

    if (++optionsScreen->transitionFrame > 15) {
        gUnknown_03005B54 = NULL;
        gCurTask->main = Task_OptionScreen;
    }
}

static void sub_80646FC(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    if (optionsScreen->unk784) {
        return;
    }
    
    // TODO make this section a macro or a inline func
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8063D20(optionsScreen, 0);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
    sub_8063DCC(optionsScreen, 0);
    
    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    gCurTask->main = sub_806A968;
}

static void sub_80647C8(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    if (optionsScreen->unk784) {
        return;
    }
    
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8063D20(optionsScreen, 0);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
    sub_8063DCC(optionsScreen, 0);

    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    m4aSongNumStart(MUS_OPTIONS);
    gCurTask->main = sub_806AA18;
}

static void sub_806489C(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    u8 language = optionsScreen->language;

    if (optionsScreen->unk784 == 1) {
        return;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    if (!optionsScreen->unk784) {
        GetProfileData(optionsScreen);
    }

    optionsScreen->language = language;

    sub_8063D20(optionsScreen, 0);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
    sub_8063DCC(optionsScreen, 0);

    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    if (!optionsScreen->unk784) {
        m4aSongNumStart(MUS_OPTIONS);
    }

    optionsScreen->unk784 = 0;
    gCurTask->main = sub_806AAC8;
}

static void sub_80649A4(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_0808B3FC_UNK240 *title = &optionsScreen->title;
    struct UNK_0808B3FC_UNK240 *menuItem = optionsScreen->menuItems;
    struct UNK_0808B3FC_UNK240 *metaItem = optionsScreen->metaItems;
    struct UNK_0808B3FC_UNK240 *playerNameDisplayChar = optionsScreen->playerNameDisplay;
    s16 i;

    sub_80051E8(title);

    for (i = 0; i < NUM_OPTIONS_MENU_ITEMS; i++, menuItem++) {
        if ((optionsScreen->soundTestUnlocked || i != OPTIONS_MENU_ITEM_SOUND_TEST) && (sub_80051E8(menuItem), i < 4)) {
            sub_80051E8(metaItem);
            metaItem++;
        }
    }

    for (i = 0; i < 6; i++, playerNameDisplayChar++) {
        sub_80051E8(playerNameDisplayChar);
    }
}

static void CreatePlayerDataMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(sub_8064C44, sizeof(struct PlayerDataMenu), 0x2000, TASK_x0004, NULL);
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

    RenderPlayerDataMenuUI(playerDataMenu);
}

static void RenderPlayerDataMenuUI(struct PlayerDataMenu* playerDataMenu) {
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

static void sub_8064C44(void) {
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

    sub_806AD98();

    if (++playerDataMenu->unk161 > 15) {
        playerDataMenu->unk161 = 0;
        gCurTask->main = Task_OptionsPlayerDataMenuMain;
    }
}

static void Task_OptionsPlayerDataMenuMain(void) {
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

    sub_806AD98();
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        switch(playerDataMenu->menuCursor) {
            case PLAYER_DATA_MENU_ITEM_CHANGE_NAME:
                sub_806AAFC();
                return;
            case PLAYER_DATA_MENU_ITEM_TIME_RECORDS:
                sub_806ABC4();
                return;
            case PLAYER_DATA_MENU_ITEM_VS_RECORDS:
                sub_806AC28();
                return;
            case PLAYER_DATA_MENU_ITEM_EXIT:
                optionsScreen->unk784 = 0;
                gCurTask->main = sub_8064E6C;
                return;
            default:
                return;
        }
    } else if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->unk784 = 0;
        gCurTask->main = sub_8064E6C;
    }
}

static void sub_8064E6C(void) {
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
        sub_806AD98();
    } else {
        TaskDestroy(gCurTask);
    }
}


static inline void sub_8064F1C_A(struct PlayerDataMenu* playerDataMenu, struct UNK_802D4CC_UNK270* unk150) {
    struct OptionsScreen* optionsScreen;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8063D20(playerDataMenu->optionsScreen, 1);
    
    optionsScreen = playerDataMenu->optionsScreen;
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1E,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xE, 0x86,0x1E,0x14,0,1,0,0);
    
    sub_8063DCC(playerDataMenu->optionsScreen, 1);
    RenderPlayerDataMenuUI(playerDataMenu);

    unk150->unk0 = 0;
    unk150->unk2 = 2;
    unk150->unk4 = 0;
    unk150->unk6 = 0x100;
    unk150->unkA = 0;
    unk150->unk8 = 0xFF;

    playerDataMenu->optionsScreen->unk784 = 1;
}

static void sub_8064F1C(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->unk163 == 0) {
        sub_8064F1C_A(playerDataMenu, unk150);
        gCurTask->main = sub_806AB90;
    }
}

void sub_8065004(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        if (playerDataMenu->optionsScreen->unk35D) {
            sub_8068198(playerDataMenu);
        } else {
            sub_8068524(playerDataMenu);
        }
        playerDataMenu->unk163 = 1;
        playerDataMenu->optionsScreen->unk784 = 2;

        gCurTask->main = sub_806508C;
    }
}

static void sub_806508C(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->unk163 == 0) {
        sub_8064F1C_A(playerDataMenu, unk150);
        gCurTask->main = sub_806ABF4;
    }
}

static void sub_8065174(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;

    if (playerDataMenu->unk163 == 0) {
        sub_8064F1C_A(playerDataMenu, unk150);
        gCurTask->main = sub_806ACBC;
    }
}

/** Switch Menus **/

static void RenderDifficultyMenuUI(struct SwitchMenu* difficultyMenu) {
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

void sub_80653E4(void) {
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
    sub_806AE54();

    if (++difficultyMenu->unkF5 > 15) {
        difficultyMenu->unkF5 = 0;
        gCurTask->main = sub_806548C;
    }
}

static void sub_806548C(void) {
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

    sub_806AE54();

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
        optionsScreen->unk784 = 0;
        gCurTask->main = sub_80655FC;
        return;
    } 
    
    if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->unk784 = 0;
        gCurTask->main = sub_80655FC;
    }
}

static void sub_80655FC(void) {
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

    if (++difficultyMenu->unkF5 < 0xF) {
        sub_806AE54();
    } else {
        TaskDestroy(gCurTask);
    }
}

static void RenderTimeLimitMenuUI(struct SwitchMenu* timeLimitMenu) {
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

static void sub_8065838(void) {
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

    if (++timeLimitMenu->unkF5 > 15) {
        timeLimitMenu->unkF5 = 0;
        gCurTask->main = sub_80658E0;
    }
}

static void sub_80658E0(void) {
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
        optionsScreen->unk784 = 0;
        gCurTask->main = sub_8065A50;
    } else if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        optionsScreen->unk784 = 0;
        gCurTask->main = sub_8065A50;
    }
}

static void sub_8065A50(void) {
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(gCurTask, difficultyMenu);
    struct UNK_0808B3FC_UNK240* headerFooter = difficultyMenu->headerFooter;
    struct UNK_0808B3FC_UNK240* timeLimitOption = difficultyMenu->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &difficultyMenu->switchValueOutline;

    s16 baseXPos = difficultyMenu->optionsScreen->subMenuXPos;
    s16 i;

    for (i = 0; i < 2; i++, headerFooter++) {
        headerFooter->unk16 = baseXPos + 336;
    }

    timeLimitOption->unk16 = baseXPos + 274;
    timeLimitOption++;
    timeLimitOption->unk16 = baseXPos + 334;

    switchValueOutline->unk16 = difficultyMenu->switchValue * 60 + 272 + baseXPos;

    if (++difficultyMenu->unkF5 < 15) {
        sub_806AF10();
    } else {
        TaskDestroy(gCurTask);
    }
}

/** Button Config Menu **/

void CreateButtonConfigMenu(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(sub_8065F04, sizeof(struct ButtonConfigMenu), 0x2000, 4, NULL);
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
    RenderButtonConfigMenuUI(buttonConfigMenu);
}

static void RenderButtonConfigMenuUI(struct ButtonConfigMenu* buttonConfigMenu) {
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

static void sub_8065F04(void) {
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
    
    sub_8066818();

    if (++buttonConfigMenu->unk248 > 15) {
        buttonConfigMenu->unk248 = 0;
        gCurTask->main = sub_8066004;
    }
}

static void sub_8066004(void) {
    struct ButtonConfigMenu* buttonConfigMenu = TaskGetStructPtr(gCurTask, buttonConfigMenu);
    struct UNK_0808B3FC_UNK240* unk124 = buttonConfigMenu->unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[buttonConfigMenu->language];
    const struct UNK_080D95E8 *itemText4;

    sub_8066818();

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
        buttonConfigMenu->optionsScreen->unk784 = 0;
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

    sub_8066818();

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

    sub_8066818();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
    
        sub_8066478_StoreButtonConfig(buttonConfigMenu, optionsScreen);
    
        buttonConfigMenu->unk248 = 0;
        buttonConfigMenu->optionsScreen->unk784 = 0;
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
        sub_8066818();
    } else {
        TaskDestroy(gCurTask);
    }
}

static void sub_8066818(void) {
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

static void sub_80668A8(struct LanguageScreen* languageScreen) {
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

static void sub_8066930(struct LanguageScreen* languageScreen) {
    s16 selectedLanguage = languageScreen->menuCursor;
    struct UNK_0808B3FC_UNK240* unk0 = languageScreen->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = languageScreen->unk60;
    struct UNK_0808B3FC_UNK240* unk180 = &languageScreen->unk180;

    const struct UNK_080D95E8* a80 = gUnknown_080D9A80;
    const struct UNK_080D95E8* b10 = gUnknown_080D9B10;
    const struct UNK_080D95E8* ae0;

    s16 var1;
    s16 var2;
    s16 i;
    s16 pos;

    if (languageScreen->creatingNewProfile == FALSE) {
        ae0 = gUnknown_080D9AB0;
    } else {
        ae0 = gUnknown_080D9AE0;
    }

    var1 = sub_806B8D4(a80, ARRAY_COUNT(gUnknown_080D9A80));
    var2 = sub_806B8D4(ae0, ARRAY_COUNT(gUnknown_080D9AE0));

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
    sub_806B1B8();

    if (gRepeatedKeys & (DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (languageScreen->menuCursor >= NUM_LANGUAGES - 1) {
           languageScreen->menuCursor = 0;
        } else {
           languageScreen->menuCursor++;
        }
        sub_8066C2C();
    } else if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (languageScreen->menuCursor < 1) {
            languageScreen->menuCursor = NUM_LANGUAGES - 1;
        } else {
            languageScreen->menuCursor--;
        }
        sub_8066C2C();
    }

    sub_806B1F8();

    if ((gRepeatedKeys & (DPAD_DOWN | DPAD_UP))) {
        return;
    }

    if (languageScreen->creatingNewProfile) {
        if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
            m4aSongNumStart(SE_SELECT);
            gLoadedSaveGame->unk6 = languageScreen->menuCursor + 1;
            sub_806B110();
        }
        return;
    }
    
    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        languageScreen->optionsScreen->language = languageScreen->menuCursor;
        sub_806B110();
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        sub_806B110();
    }
}

static void sub_8066C2C(void) {
    struct LanguageScreen* languageScreen = TaskGetStructPtr(gCurTask, languageScreen);
    struct UNK_0808B3FC_UNK240* unk0 = languageScreen->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = languageScreen->unk60;
    struct UNK_0808B3FC_UNK240* unk180 = &languageScreen->unk180;

    const struct UNK_080D95E8* a80 = &gUnknown_080D9A80[languageScreen->menuCursor];
    const struct UNK_080D95E8* ae0;
    s16 i;

    if (languageScreen->creatingNewProfile != TRUE) {
        ae0 = &gUnknown_080D9AB0[languageScreen->menuCursor];
    } else {
        ae0 = &gUnknown_080D9AE0[languageScreen->menuCursor];
    }

    unk180->unk18 = languageScreen->menuCursor * 0xF + 0x28;

    for (i = 0; i < 6; i++, unk60++) {
        unk60->unk25 = !!(languageScreen->menuCursor ^ i);
    }

    unk0->unk20 = a80->unk2;
    unk0->unkA = a80->unk0;
    sub_8004558(unk0);

    unk0++;
    unk0->unk20 = ae0->unk2;
    unk0->unkA = ae0->unk0;
    sub_8004558(unk0);
}

void CreateDeleteGameDataScreen(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(sub_806B280, sizeof(struct DeleteGameDataScreen), 0x2000, TASK_x0004, NULL);
    struct DeleteGameDataScreen* deleteGameDataScreen = TaskGetStructPtr(t, deleteGameDataScreen);

    deleteGameDataScreen->optionsScreen = optionsScreen;
    deleteGameDataScreen->confirmationCursor = 1;
    deleteGameDataScreen->unk141 = 0;
    deleteGameDataScreen->language = optionsScreen->language;
    deleteGameDataScreen->unk143 = 0;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8066D90(deleteGameDataScreen);
    sub_806B258(deleteGameDataScreen);
    sub_8066E18(deleteGameDataScreen);
}

static void sub_8066D90(struct DeleteGameDataScreen* deleteGameDataScreen) {
    struct UNK_802D4CC_UNK270* unk130 = &deleteGameDataScreen->unk130;

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

    sub_802D4CC(&deleteGameDataScreen->unk130);
}

static void sub_8066E18(struct DeleteGameDataScreen* deleteGameDataScreen) {
    s16 language = deleteGameDataScreen->language;
    struct UNK_0808B3FC_UNK240* unk60 = deleteGameDataScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteGameDataScreen->unkC0;

    const struct UNK_080D95E8* b40 = &gUnknown_080D9B40[language];
    const struct UNK_080D95E8* ba0 = &gUnknown_080D9BA0[language];
    const struct UNK_080D95E8* bd0 = gUnknown_080D9BD0[language];

    s16 confirmationCursor = deleteGameDataScreen->confirmationCursor;
    
    sub_806A568(
        &deleteGameDataScreen->unk0[0],
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
        &deleteGameDataScreen->unk0[1],
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

static void sub_8066FAC(void) {
    struct DeleteGameDataScreen* deleteGameDataScreen = TaskGetStructPtr(gCurTask, deleteGameDataScreen);
    struct UNK_0808B3FC_UNK240* unk60 = deleteGameDataScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteGameDataScreen->unkC0;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteGameDataScreen->confirmationCursor = deleteGameDataScreen->confirmationCursor == 0;

        for (i = 0; i < 2; i++, unk60++) {
            unk60->unk25 = !!(deleteGameDataScreen->confirmationCursor ^ i);
        }
        unkC0->unk16 = deleteGameDataScreen->confirmationCursor * 0x3C + 0x38;
    }

    sub_806B2F8();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        if (deleteGameDataScreen->confirmationCursor == 0) {
            gCurTask->main = sub_806709C;
        } else {
            gCurTask->main = sub_806B2B4;
        }
    } else {
        if (gPressedKeys & B_BUTTON) {
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = sub_806B2B4;
        }
    }
}

static void sub_806709C(void) {
    struct DeleteGameDataScreen* deleteGameDataScreen = TaskGetStructPtr(gCurTask, deleteGameDataScreen);

    struct UNK_0808B3FC_UNK240* unk0 = deleteGameDataScreen->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = deleteGameDataScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteGameDataScreen->unkC0;
    const struct UNK_080D95E8* b70 = &gUnknown_080D9B70[deleteGameDataScreen->language];
    s16 i;

    unk0->unk20 = b70->unk2;
    unk0->unkA = b70->unk0;

    sub_8004558(unk0);

    deleteGameDataScreen->confirmationCursor = 1;

    for (i = 0; i < 2; i++, unk60++) {
        unk60->unk25 = !!(deleteGameDataScreen->confirmationCursor ^ i);
    }

    unkC0->unk16 = deleteGameDataScreen->confirmationCursor * 0x3C + 0x38;

    sub_806B2F8();
    gCurTask->main = sub_8067148;
}

static void sub_8067148(void) {
    struct DeleteGameDataScreen* deleteGameDataScreen = TaskGetStructPtr(gCurTask, deleteGameDataScreen);
    struct UNK_0808B3FC_UNK240* unk60 = deleteGameDataScreen->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &deleteGameDataScreen->unkC0;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        deleteGameDataScreen->confirmationCursor = deleteGameDataScreen->confirmationCursor == 0;

        for (i = 0; i < 2; i++, unk60++) {
            unk60->unk25 = !!(deleteGameDataScreen->confirmationCursor ^ i);
        }
        unkC0->unk16 = deleteGameDataScreen->confirmationCursor * 0x3C + 0x38;
    }

    sub_806B2F8();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (deleteGameDataScreen->confirmationCursor == 0) {
            deleteGameDataScreen->unk143 = 1;
            m4aSongNumStart(220);
        } else {
            m4aSongNumStart(SE_SELECT);
        }
        gCurTask->main = sub_806B2B4;
        return;
    } else {
        if (gPressedKeys & B_BUTTON) {
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = sub_806B2B4;
        }
    }
}

void sub_806723C(void) {
    struct DeleteGameDataScreen* deleteGameDataScreen = TaskGetStructPtr(gCurTask, deleteGameDataScreen);

    if (!sub_802D4CC(&deleteGameDataScreen->unk130)) {
        sub_806B2F8();
        return;
    }

    if (deleteGameDataScreen->unk143) {
        SetProfileData(deleteGameDataScreen->optionsScreen);
        NewSaveGame();
        deleteGameDataScreen->optionsScreen->unk784 = 0;
    } else {
        deleteGameDataScreen->optionsScreen->unk784 = 2;
    }

    TaskDestroy(gCurTask);
}

void CreateEditProfileNameScreen(struct PlayerDataMenu* playerDataMenu) {
    struct Task* t = TaskCreate(sub_806B354, sizeof(struct ProfileNameScreen), 0x2000, 4, NULL);
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

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8067420(profileNameScreen->language);
    ProfileNameScreenCreateUIBackgrounds(profileNameScreen);
    ProfileNameScreenCreateUIText(profileNameScreen);
    ProfileNameScreenCreateUIContextElements(profileNameScreen);
    ProfileNameScreenCreateInputDisplayUI(profileNameScreen);
}

static void sub_8067420(s16 language) {
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
    const struct UNK_080D95E8* scrollArrowTile = sProfileNameScreenScrollTiles;
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

    RenderProfileNameScreenUI();
    
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
        RenderProfileNameScreenUI();
        return;
    }

    if (onCompleteAction == 0) {
        profileNameScreen->playerDataMenu->unk163 = 0;
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

static void RenderProfileNameScreenUI(void) {
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

static void sub_8068198(struct PlayerDataMenu* playerProfileMenu) {
    struct Task* t = TaskCreate(sub_806B3F0, sizeof(struct CourseRecordsScreen), 0x2000, 4, NULL);
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(t, courseRecordsScreen);
    s16 i;

    for (i = 1; i < NUM_CHARACTERS; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    courseRecordsScreen->playerProfileMenu = playerProfileMenu;
    courseRecordsScreen->character = 0;
    courseRecordsScreen->zone = 0;
    courseRecordsScreen->act = 0;
    courseRecordsScreen->unk707 = 0;
    courseRecordsScreen->unk708 = 0;
    courseRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        courseRecordsScreen->characterZones[i] = gLoadedSaveGame->unk7[i];
    }

    courseRecordsScreen->language = playerProfileMenu->language;
    courseRecordsScreen->showingBossRecords = FALSE;
    courseRecordsScreen->mode = 0;
    
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_80682AC();
    sub_80682EC(courseRecordsScreen);
    sub_806834C(courseRecordsScreen);
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

static void sub_80682EC(struct CourseRecordsScreen* courseRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk270 = &courseRecordsScreen->unk0;
    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;
    sub_806B854(&courseRecordsScreen->unk204,0,7,0x89,0x1e,0x14,0,0,0,0);
    sub_806B854(&courseRecordsScreen->unk244,1,0xF,0x8A,0x1e,0x14,0,1,0,0);
}

static void sub_806834C(struct CourseRecordsScreen* courseRecordsScreen) {
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = courseRecordsScreen->unk13C;
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
    const struct UNK_080D95E8 *itemText1 = &gUnknown_080D9EB0[courseRecordsScreen->language];
    const struct UNK_080D95E8 *itemText2 = gUnknown_080D9EE0[courseRecordsScreen->language];
    
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

static void sub_8068474(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
    
    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        courseRecordsScreen->showingBossRecords = !courseRecordsScreen->showingBossRecords;
        
        if (!courseRecordsScreen->showingBossRecords) {
            unk4C->unk25 = 0;
            unk4C++;
            unk4C->unk25 = 0;
        } else {
            unk4C->unk25 = 1;
            unk4C++;
            unk4C->unk25 = 0xFF;
        }
    }

    sub_806B4F8();

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_806B498();
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        sub_806B424();
    }
}

static void sub_8068524(struct PlayerDataMenu* playerProfileMenu) {
    struct Task* t = TaskCreate(sub_806B5A4, sizeof(struct CourseRecordsScreen), 0x2000, 4, NULL);
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(t, courseRecordsScreen);
    s16 i;

    for (i = 1; i < NUM_CHARACTERS; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    courseRecordsScreen->playerProfileMenu = playerProfileMenu;
    courseRecordsScreen->timeRecords = NULL;
    courseRecordsScreen->character = 0;
    courseRecordsScreen->zone = 0;
    courseRecordsScreen->act = 0;
    courseRecordsScreen->unk707 = 0;
    courseRecordsScreen->unk708 = 0;
    courseRecordsScreen->availableCharacters = i;

    for (i = 0; i < NUM_CHARACTERS; i++) {
        courseRecordsScreen->characterZones[i] = gLoadedSaveGame->unk7[i];
    }

    courseRecordsScreen->language = playerProfileMenu->language;
    courseRecordsScreen->showingBossRecords = FALSE;
    courseRecordsScreen->mode = 1;
    
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8068640();
    sub_8068700(courseRecordsScreen);
    sub_80687BC(courseRecordsScreen);
}

static void sub_8068640(void) {
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

static void sub_8068700(struct CourseRecordsScreen* courseRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk270 = &courseRecordsScreen->unk0;
    u8 character;
    if (courseRecordsScreen->character != 0xFF) {
        character = courseRecordsScreen->character;
    } else {
        character = 0;
    }

    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    sub_806B854(&courseRecordsScreen->unkC,0,7,0x8B,0x1e,0x14,0,0,0,0);
    sub_806B854(&courseRecordsScreen->unk204,1,0x16,gUnknown_080D9590[character][0],9,0x14,0,1,0,0);
    sub_806B854(&courseRecordsScreen->unk244,2,0x1E,gUnknown_080D9590[character][1],9,0x14,0,2,0,0);
}

static void sub_80687BC(struct CourseRecordsScreen* courseRecordsScreen) {
    struct UNK_0808B3FC_UNK240* unk284 = courseRecordsScreen->unk284;
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
    struct UNK_0808B3FC_UNK240* unkAC = courseRecordsScreen->unkAC;
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = courseRecordsScreen->unk13C;
    
    u8 language = courseRecordsScreen->language;
    u8 zone = courseRecordsScreen->zone;
    u8 act = courseRecordsScreen->act;

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

    if (!courseRecordsScreen->showingBossRecords) {
        sub_806A568(unkAC,0,0x10,0x418,0x1000,0x4E,0x20,3,1,0);
        unkAC++;
    
        r1 = &gUnknown_080D9F40[act];
        sub_806A568(unkAC,0,temp,r1->unk0,0x1000,0x88,0x20,3,r1->unk2,0);
    } else {
        sub_806A568(unkAC,0,0x14,0x418,0x1000,0x4e,0x20,3,9,0);  
    }

    if (!courseRecordsScreen->showingBossRecords) {
        r4 = &gUnknown_080D9FD0[language][courseRecordsScreen->zone];
    } else {
        r4 = &gUnknown_080DA120[language][courseRecordsScreen->zone];
    }

    temp = sub_806B8D4(r4, 7);
    sub_806A568(unk10C,0,temp, r4->unk0,0x1000,0x9a,0x44,3,r4->unk2,0);
}

static inline u16* LoadCourseTimes(struct CourseRecordsScreen* courseRecordsScreen) {
    u8 act;
    
     if (!courseRecordsScreen->showingBossRecords) {
        act = courseRecordsScreen->act;
    } else {
        act = 2;
    }

    // When the records are loaded from options we have to load the data from the options 
    // screen (though I don't understand why this wasn't done from the gLoadedSaveData)
    if (courseRecordsScreen->mode != 2) {
        return courseRecordsScreen->playerProfileMenu->optionsScreen->profileData.unkC.table[courseRecordsScreen->character][courseRecordsScreen->zone][act];
    } else {
        return courseRecordsScreen->timeRecords->table[courseRecordsScreen->character][courseRecordsScreen->zone][act];
    }
}

static void sub_8068A94(struct CourseRecordsScreen* courseRecordsScreen) {
    struct UNK_80637EC_UNK314* unk314 = courseRecordsScreen->unk314;
    s16 FCC = gUnknown_080D9F78[10].unk4;
    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;
    s16 i;

    u16* courseTimes = LoadCourseTimes(courseRecordsScreen);

    for (i = 0; i < 3; i++, unk314++) {
        const struct UNK_080D95E8* F78;
        s16 millis, minutes, seconds;
        u16 timeValue;

        unk0 = unk314->unk0;
        unk60 = &unk314->unk60;
        unk90 = unk314->unk90;
        unkF0 = unk314->unkF0;

        timeValue = courseTimes[i];
        if (timeValue < ZONE_TIME_TO_INT(10, 0)) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            millis = gUnknown_080D6B80[temp][0] * 10;
            millis += gUnknown_080D6B80[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        F78 = &gUnknown_080D9F78[10];
        sub_806A568(unk0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x30),(i * 24 + 84),8,F78->unk2,0);

        unk0++;
        sub_806A568(unk0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x60),(i * 24 + 84),8,F78->unk2,0);

        F78 = &gUnknown_080D9F78[minutes];
        sub_806A568(unk60,0,FCC,F78->unk0,0x3000,(i * 8 + 0x20),(i * 24 + 84),8,F78->unk2,0);

        F78 = &gUnknown_080D9F78[seconds / 10];
        sub_806A568(unk90,0,FCC,F78->unk0,0x3000,(i * 8 + 0x40),(i * 24 + 84),8,F78->unk2,0);

        unk90++;
        F78 = &gUnknown_080D9F78[seconds % 10];
        sub_806A568(unk90,0,FCC,F78->unk0,0x3000,(i * 8 + 0x50),(i * 24 + 84),8,F78->unk2,0);

        F78 = &gUnknown_080D9F78[millis / 10];
        sub_806A568(unkF0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x70),(i * 24 + 84),8,F78->unk2,0);
        
        unkF0++;
        F78 = &gUnknown_080D9F78[millis % 10];
        sub_806A568(unkF0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x80),(i * 24 + 84),8,F78->unk2,0);
    }
}

static void sub_8068D94(struct CourseRecordsScreen* courseRecordsScreen) {
    const struct UNK_080D95E8* F78;
    struct UNK_80637EC_UNK314* unk314 = courseRecordsScreen->unk314;
    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;
    s16 i;
    u16* courseTimes = LoadCourseTimes(courseRecordsScreen);

    for (i = 0; i < 3; i++, unk314++) {
        s16 millis, minutes, seconds;
        u16 timeValue;
        
        unk60 = &unk314->unk60;
        unk90 = unk314->unk90;
        unkF0 = unk314->unkF0;
        unk0 = unk314->unk0;
        
        timeValue = courseTimes[i];
        if (timeValue < ZONE_TIME_TO_INT(10, 0)) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            // This logic is the same as the above function but required to be
            // inline instead of split, but required to be split in the other function
            millis = gUnknown_080D6B80[temp][0] * 10 + gUnknown_080D6B80[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        F78 = &gUnknown_080D9F78[minutes];
        
        unk60->unkA = F78->unk0;
        unk60->unk20 = F78->unk2;
        unk60->unk16 = (i * 8) + 0x110;
        sub_8004558(unk60);
        
        unk0->unk16 = (i * 8) + 0x120;
        unk0++;

        F78 = &gUnknown_080D9F78[seconds / 10];
        unk90->unkA = F78->unk0;
        unk90->unk20 = F78->unk2;
        unk90->unk16 = (i * 8) + 0x130;
        sub_8004558(unk90);

        unk90++;
        F78 = &gUnknown_080D9F78[seconds % 10];
        unk90->unkA = F78->unk0;
        unk90->unk20 = F78->unk2;
        unk90->unk16 = (i * 8) + 0x140;
        sub_8004558(unk90);
    
        unk0->unk16 = (i * 8) + 0x150;

        F78 = &gUnknown_080D9F78[millis / 10];
        unkF0->unkA = F78->unk0;
        unkF0->unk20 = F78->unk2;
        unkF0->unk16 = (i * 8) + 0x160;
        sub_8004558(unkF0);

        unkF0++;
        F78 = &gUnknown_080D9F78[millis % 10];
        unkF0->unkA = F78->unk0;
        unkF0->unk20 = F78->unk2;
        unkF0->unk16 = (i * 8) + 0x170;
        sub_8004558(unkF0);
    }
}

static void sub_8068FE8(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    u32 character;

    if (courseRecordsScreen->character != 0xFF) {
        character = courseRecordsScreen->character;
    } else {
        character = CHARACTER_SONIC;
    }

    sub_806979C(1);
    gBgScrollRegs[1][0] = 0xFF10;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0xFF10;
    gBgScrollRegs[2][1] = 0x10;

    sub_806B854(&courseRecordsScreen->unk204, 1, 0x16, gUnknown_080D9590[character][0], 9, 0x14, 0, 1, 0, 0);
    sub_806B854(&courseRecordsScreen->unk244, 2, 0x1E, gUnknown_080D9590[character][1], 9, 0x14, 0, 2, 0, 0);

    gCurTask->main = sub_80690A4;
}

static void sub_80690A4(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);

    if (++courseRecordsScreen->unk707 < 5) {
        gBgScrollRegs[1][0] = courseRecordsScreen->unk707 * 0x12 - 0xF0;
    }

    if (courseRecordsScreen->unk707 > 6) {
        gBgScrollRegs[2][0] = (courseRecordsScreen->unk707 - 6) * 0x12 - 0xF0;
    }

    sub_806979C(1);

    if (courseRecordsScreen->unk707 > 9) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8069110;
    }
}

void sub_8069180(s16, s16);
void sub_8069208(void);

static void sub_8069110(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    s16 i;

    courseRecordsScreen->unk707++;
    
    for (i = 0; i < 3; i++) {
        sub_8069180(i, courseRecordsScreen->unk707 + i * -8);
    }

    sub_806979C(0);

    if (courseRecordsScreen->unk707 > 0x1F) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8069208;
    }
}

void sub_8069180(s16 a, s16 b) {
    // Not sure why but the struct has to be loaded like this
#ifndef NON_MATCHING
    u32 offsetA = gCurTask->structOffset + (a * sizeof(struct UNK_80637EC_UNK314));
    register u32 offsetB asm("r2") = IWRAM_START + offsetof(struct CourseRecordsScreen, unk314);
    struct UNK_80637EC_UNK314* unk314 = (struct UNK_80637EC_UNK314*)(offsetA + offsetB);
#else
    struct UNK_80637EC_UNK314* unk314 = &((struct CourseRecordsScreen*)(IWRAM_START + gCurTask->structOffset))->unk314[a];
#endif

    if (b > 0 && b < 9) {
        struct UNK_0808B3FC_UNK240* unk0 = unk314->unk0;
        struct UNK_0808B3FC_UNK240* unk60 = &unk314->unk60;
        struct UNK_0808B3FC_UNK240* unk90 = unk314->unk90;
        struct UNK_0808B3FC_UNK240* unkF0 = unk314->unkF0;
        
        s16 c = (8 - b) * 0x1E + (a * 8);
        unk60->unk16 = c + 0x20;
        unk0->unk16 = c + 0x30;
        unk0++;
        unk0->unk16 = c + 0x60;

        unk90->unk16 = c + 0x40;
        unk90++;
        unk90->unk16 = c + 0x50;

        unkF0->unk16 = c + 0x70;
        unkF0++;
        unkF0->unk16 = c + 0x80;
    }
}

void sub_806955C(void);
void sub_806B60C(void);
void sub_806B684(void);
void sub_80694F8(void);
void sub_806B730(void);

void sub_8069208(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    s16 availableZones = courseRecordsScreen->characterZones[courseRecordsScreen->character];
    s32 var;
    if (availableZones == 0) {
        availableZones = 1;
    }
    // Possibly some macro
    var = (u16)availableZones;
    if (var > 0x1B) {
        availableZones = 0x1B;
    }
    sub_806979C(0);

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        if (courseRecordsScreen->mode == 2 && availableZones == 1) {
            return;
        }

        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & DPAD_LEFT) {
            if (courseRecordsScreen->showingBossRecords == 0) {
                if (courseRecordsScreen->mode == 2) {
                    if (courseRecordsScreen->act == 0) {
                        if (courseRecordsScreen->zone != 0) {
                            courseRecordsScreen->zone--;
                            courseRecordsScreen->act = 1;
                        } else {
                            courseRecordsScreen->zone = availableZones >> 2;
                            courseRecordsScreen->act = (availableZones & 3) != 1;
                        }
                        gCurTask->main = sub_806955C;
                        return;
                    }
                    courseRecordsScreen->act--;
                } else {
                    if (courseRecordsScreen->act == 0) {
                        courseRecordsScreen->act = 1;
                        if (courseRecordsScreen->zone != 0) {
                           courseRecordsScreen->zone--;
                        } else {
                            courseRecordsScreen->zone = 6;
                        }
                        gCurTask->main = sub_806955C;
                        return;
                    }
                    else
                        courseRecordsScreen->act--;
                }
            }
            else {
                if (courseRecordsScreen->zone != 0) {
                    courseRecordsScreen->zone--;
                } else {
                    courseRecordsScreen->zone = NUM_ZONES - 1;
                }
                gCurTask->main = sub_806955C;
                return;
            }
        }
        else if (gRepeatedKeys & DPAD_RIGHT) {
            if (!courseRecordsScreen->showingBossRecords) {
                if (courseRecordsScreen->mode == 2) {
                    s32 r5;
                    s16 r1;
                    s32 backup = availableZones;
                    availableZones >>= 2;
                    r1 = backup & 3;
                    r5 = r1 != 1;
                    if (courseRecordsScreen->act > 0) {
                        courseRecordsScreen->act = 0;
                        if (courseRecordsScreen->zone < NUM_ZONES - 1) {
                            courseRecordsScreen->zone++;
                        } else {
                            courseRecordsScreen->zone = 0;
                        }

                        if (courseRecordsScreen->zone > availableZones) {
                            courseRecordsScreen->zone = 0;
                            courseRecordsScreen->act = 0;
                        }
                    } else {
                        courseRecordsScreen->act++;
                        if (courseRecordsScreen->zone >= availableZones
                            && courseRecordsScreen->act > r5) {
                            courseRecordsScreen->zone = 0;
                            courseRecordsScreen->act = 0;
                            gCurTask->main = sub_806955C;
                            return;
                        }
                        else {
                            gCurTask->main = sub_806B60C;
                            return; 
                        }
                    }
                    gCurTask->main = sub_806955C;
                    return;
                }

                if (courseRecordsScreen->act > 0) {
                    courseRecordsScreen->act = 0;
                    if (courseRecordsScreen->zone < NUM_ZONES - 1) {
                        courseRecordsScreen->zone++;
                    } else {
                         courseRecordsScreen->zone = 0;
                    }
                    gCurTask->main = sub_806955C;
                    return;
                } else {
                    courseRecordsScreen->act++;
                }
                
            }
            else {
                if (courseRecordsScreen->zone < NUM_ZONES - 1) {
                    courseRecordsScreen->zone++;
                } else {
                     courseRecordsScreen->zone = 0;
                }
                gCurTask->main = sub_806955C;
                return;
            }
            
        }
        gCurTask->main = sub_806B60C;
        return;
    } else {
        if (courseRecordsScreen->mode != 2) {
            if (gRepeatedKeys & (DPAD_DOWN | DPAD_UP)) {
                s16 maxCharacterIndex = courseRecordsScreen->availableCharacters - 1;
                if (maxCharacterIndex == 0) {
                    return;
                }
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                if (gRepeatedKeys & DPAD_UP) {
                    if (courseRecordsScreen->character != 0) {
                       courseRecordsScreen->character--;
                    } else {
                         courseRecordsScreen->character = maxCharacterIndex;
                    }
                } else if (gRepeatedKeys & DPAD_DOWN) {
                    if (courseRecordsScreen->character < maxCharacterIndex) {
                        courseRecordsScreen->character++;
                    } else {
                        courseRecordsScreen->character = 0;
                    }
                }
    
                courseRecordsScreen->unk707 = 4;
                gCurTask->main = sub_80694F8;
                return;
            }
        }
        else if (gPressedKeys & A_BUTTON) {
            m4aSongNumStart(SE_SELECT);
            sub_806B684();
            return;
        }
        if (gPressedKeys & B_BUTTON) {
            m4aSongNumStart(SE_RETURN);
            sub_806B730();
        }
    }
}

void sub_80694F8(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);

    courseRecordsScreen->unk707--;

    gBgScrollRegs[1][0] = courseRecordsScreen->unk707 * 0x12 - 0xF0;
    gBgScrollRegs[2][0] = courseRecordsScreen->unk707 * 0x12 - 0xF0;

    sub_8068D94(courseRecordsScreen);
    sub_806979C(1);

    if (courseRecordsScreen->unk707 == 0) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8068FE8;
    }
}

void sub_806955C(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk7C = &courseRecordsScreen->unk4C[1];
    struct UNK_0808B3FC_UNK240* unkDC = &courseRecordsScreen->unkAC[1];
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;

    u16 language = courseRecordsScreen->language;
    const struct UNK_080D95E8* F40 = &gUnknown_080D9F40[courseRecordsScreen->zone];
    unk7C->unkA = F40->unk0;
    unk7C->unk20 = F40->unk2;
    
    sub_8004558(unk7C);

    if (!courseRecordsScreen->showingBossRecords) {
        F40 = &gUnknown_080D9F40[courseRecordsScreen->act];
        unkDC->unkA = F40->unk0;
        unkDC->unk20 = F40->unk2;
        sub_8004558(unkDC);
    }

    if (!courseRecordsScreen->showingBossRecords) {
        F40 = &gUnknown_080D9FD0[language][courseRecordsScreen->zone];
    } else {
        F40 = &gUnknown_080DA120[language][courseRecordsScreen->zone];
    }

    unk10C->unkA = F40->unk0;
    unk10C->unk20 = F40->unk2;
    sub_8004558(unk10C);
    sub_8068D94(courseRecordsScreen);
    sub_806979C(0);
    courseRecordsScreen->unk707 = 0;
    gCurTask->main = sub_8069110;
}

void sub_8069688(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;
    struct PlayerDataMenu* playerProfileMenu = courseRecordsScreen->playerProfileMenu;
    
    u8 availableCharacters;
    bool8 allCharactersUnlocked;

    if (!sub_802D4CC(unk0)) {
        sub_806979C(0);
        return;
    }
        
    switch (courseRecordsScreen->mode) {
        case 0:
            courseRecordsScreen->unk707 = 0;
            courseRecordsScreen->showingBossRecords = 0;
            courseRecordsScreen->mode = 0;
            gUnknown_03005B50 = (void*)OBJ_VRAM0;
            gUnknown_03005B54 = NULL;

            sub_80682AC();
            sub_80682EC(courseRecordsScreen);
            sub_806834C(courseRecordsScreen);
            gCurTask->main = sub_806B3F0;
            break;
        case 1:
            playerProfileMenu->unk163 = 0;
            TaskDestroy(gCurTask);
            break;
        case 2:
            allCharactersUnlocked = FALSE;
            availableCharacters = courseRecordsScreen->availableCharacters;
            if (availableCharacters == NUM_CHARACTERS) {
                allCharactersUnlocked = TRUE;
            }
            EwramFree(courseRecordsScreen->timeRecords);
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            sub_803143C(courseRecordsScreen->character, allCharactersUnlocked);
            break;
    }
}

static void sub_806979C(u16 a) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_80637EC_UNK314* unk314 = courseRecordsScreen->unk314;
    struct UNK_0808B3FC_UNK240* unk284 = courseRecordsScreen->unk284;
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
    struct UNK_0808B3FC_UNK240* unkAC = courseRecordsScreen->unkAC;
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = courseRecordsScreen->unk13C;

    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;

    s16 temp, i, j;
    s16 availableZones = courseRecordsScreen->characterZones[courseRecordsScreen->character];
    if (availableZones == 0) {
        availableZones = 1;
    }

    for (i = 0; i < 3; i++, unk284++) {
        sub_80051E8(unk284);
    }

    for (i = 0; i < 2; i++, unk4C++) {
        sub_80051E8(unk4C);
    }

    j = courseRecordsScreen->mode != 2 && a == 0 && courseRecordsScreen->availableCharacters > 1 ? 4 : 2;
    temp = courseRecordsScreen->mode == 2 && availableZones < 2 ? 0 : j;

    for (i = 0; i < temp; i++, unk13C++) {
        sub_8004558(unk13C);
        sub_80051E8(unk13C);
    }

    if (courseRecordsScreen->showingBossRecords == 0) {
        for (i = 0; i < 2; i++, unkAC++) {
            sub_80051E8(unkAC);
        }
    } else {
        sub_80051E8(unkAC);
    }

    sub_80051E8(unk10C);

    for (i = 0; i < 3; i++, unk314++) {
        unk0 = unk314->unk0;
        unk60 = &unk314->unk60;
        unk90 = unk314->unk90;
        unkF0 = unk314->unkF0;

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

struct UNK_8069978_UNK390_ROW {
    // playerName
    u16 unk0[6];

    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    struct UNK_0808B3FC_UNK240 unk10[6];
    struct UNK_0808B3FC_UNK240 unk130[2];
    struct UNK_0808B3FC_UNK240 unk190[2];
    struct UNK_0808B3FC_UNK240 unk1F0[2];
}; /* size 0x250 */

struct UNK_8069978_UNK390 {
   struct UNK_8069978_UNK390_ROW unk0[10];
}; /* size 0x1720 */

// MultiPlayerRecordsScreen
struct UNK_8069978 {
    struct UNK_802D4CC_UNK270 unk0;

    struct Unk_03002400 unkC;
    struct Unk_03002400 unk4C;

    struct UNK_0808B3FC_UNK240 unk8C;
    struct UNK_0808B3FC_UNK240 unkBC;
    struct UNK_0808B3FC_UNK240 unkEC[2];
    struct UNK_0808B3FC_UNK240 unk14C[6];
    struct UNK_0808B3FC_UNK240 unk26C[2];
    struct UNK_0808B3FC_UNK240 unk2CC[2];
    struct UNK_0808B3FC_UNK240 unk32C[2];

    // playerDataMenu
    struct PlayerDataMenu* unk38C;

    struct UNK_8069978_UNK390* unk390;
    u8 unk394;
    u8 unk395;
    u8 unk396;
    u8 unk397;

    // playerName
    u16 unk398[6];

    u8 unk3A4;
    u8 unk3A5;
    u8 unk3A6;

    // language
    u8 unk3A7;
}; /* size 0x3A8 */

void sub_806B760(void);
void sub_8069B40(void);
void sub_8069B88(struct UNK_8069978*);
void sub_8069BF0(struct UNK_8069978*);

void sub_8069978(struct PlayerDataMenu* playerDataMenu) {
    struct UNK_8069978_UNK390_ROW* unk390Rows;
    struct OptionsScreenProfileData* profileData;
    s16 i, j;

    struct Task* t = TaskCreate(sub_806B760, sizeof(struct UNK_8069978), 0x2000, 4, 0);
    struct UNK_8069978* config = TaskGetStructPtr(t, config);
    config->unk390 = EwramMallocStruct(struct UNK_8069978_UNK390);
    config->unk38C = playerDataMenu;

    config->unk394 = 0;
    config->unk3A4 = 0;
    config->unk3A5 = 0;
    config->unk3A6 = 0;
    config->unk3A7 = playerDataMenu->language;


    profileData = &playerDataMenu->optionsScreen->profileData;
    memcpy(config->unk398, profileData->playerName, 12);
    config->unk395 = profileData->unk34C;
    config->unk396 = profileData->unk34D;
    config->unk397 = profileData->unk34E;

    unk390Rows = config->unk390->unk0;
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 6; j++) {
            unk390Rows[i].unk0[j] = profileData->unk284[i].unk4[j];
            if (unk390Rows[i].unk0[j] == PLAYER_NAME_END_CHAR) {
                break;
            }
        }

        for (;j < 6; j++) {
            unk390Rows[i].unk0[j] = PLAYER_NAME_END_CHAR;
        }

        unk390Rows[i].unkC = profileData->unk284[i].unk10;
        unk390Rows[i].unkD = profileData->unk284[i].unk11;
        unk390Rows[i].unkE = profileData->unk284[i].unk12;
        unk390Rows[i].unkF = profileData->unk284[i].unk13;
    }

    gUnknown_03005B50 = (void*)(OBJ_VRAM0);
    gUnknown_03005B54 = NULL;

    sub_8069B40();
    sub_8069B88(config);
    sub_8069BF0(config);
}

void sub_8069B40(void) {
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

void sub_8069B88(struct UNK_8069978* multiplayerRecordsScreen) {
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

struct UNK_080D9E00 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
};

extern const struct UNK_080D9E00 gUnknown_080D9E00[6][2];
extern const struct UNK_080D95E8 gUnknown_080D9E60[10];

// PlayerRecordRow
void sub_8069BF0(struct UNK_8069978* multiplayerRecordsScreen) {
    s16 i, pos, temp;
    struct UNK_806B908 local48;
    s16 unk395, unk396, unk397;

    struct UNK_0808B3FC_UNK240* unk8C = &multiplayerRecordsScreen->unk8C;
    struct UNK_0808B3FC_UNK240* unkBC = &multiplayerRecordsScreen->unkBC;
    struct UNK_0808B3FC_UNK240* unkEC = multiplayerRecordsScreen->unkEC;
    struct UNK_0808B3FC_UNK240* unk14C = multiplayerRecordsScreen->unk14C;
    struct UNK_0808B3FC_UNK240* unk26C = multiplayerRecordsScreen->unk26C;
    struct UNK_0808B3FC_UNK240* unk2CC = multiplayerRecordsScreen->unk2CC;
    struct UNK_0808B3FC_UNK240* unk32C = multiplayerRecordsScreen->unk32C;

    const struct UNK_080D9E00* E00 = gUnknown_080D9E00[multiplayerRecordsScreen->unk3A7];
    const struct UNK_080D95E8* DF0 = sProfileNameScreenScrollTiles;
    // The data is made into a pointer here but then another pointer is used for
    // the actual reference
    const struct UNK_080D95E8* E60Val, *E60 = gUnknown_080D9E60;

    sub_806A568(unk8C,0,E00->unk4,E00->unk0,0x1000,9,0x12,5,E00->unk2,0);

    E00++;
    sub_806A568(unkBC,0,E00->unk4,E00->unk0,0x1000,0x76,0x26,5,E00->unk2,0);
    
    sub_806A568(unkEC,0,DF0->unk4,DF0->unk0,0x1000,8,0x4E,0xD,DF0->unk2,0);
    unkEC++;
    DF0++;
    sub_806A568(unkEC,0,DF0->unk4,DF0->unk0,0x1000,8,0x88,0xD,DF0->unk2,0);


    for (i = 0, pos = 0x22, temp = 0x3A; i < MAX_PLAYER_NAME_LENGTH; i++, unk14C++, pos+= 0xC) {
        u16 nameChar = multiplayerRecordsScreen->unk398[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }

        local48 = sub_806B908(nameChar);
        sub_806A568(
            unk14C, 
            0, 
            local48.unk0,
            local48.unk4,
            0x1000,
            pos, 
            temp,
            5,
            local48.unk6,
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

// OtherRecordsRow
void sub_8069EC4(s16 i) { 
    s16 j, pos;
    s16 unkE, unkF, unkD;
    struct UNK_0808B3FC_UNK240* unk130, *unk190, *unk1F0;

    struct UNK_806B908 local48;

    struct UNK_8069978_UNK390_ROW* row = &((struct UNK_8069978*)(IWRAM_START + gCurTask->structOffset))->unk390->unk0[i];
    const struct UNK_080D95E8 *E60Val, *E60 = gUnknown_080D9E60;

    if (row->unkC) {
        s16 temp1 = i * 18 + 90;
        struct UNK_0808B3FC_UNK240* unk10 = row->unk10;
        
        for (j = 0, pos = 0x22; j < MAX_PLAYER_NAME_LENGTH; j++, unk10++, pos+= 0xC) {
            u16 nameChar = row->unk0[j];
            if (nameChar == PLAYER_NAME_END_CHAR) {
                nameChar = 0x11;
            }

            local48 = sub_806B908(nameChar);
            sub_806A568(
                unk10, 
                0, 
                local48.unk0,
                local48.unk4,
                0x2000,
                pos, 
                temp1,
                5,
                local48.unk6,
                0
            );
        }

        unkD = row->unkD;
        unkE = row->unkE;
        unkF = row->unkF;
        temp1 += 6; 

        E60Val = &E60[unkD / 10];
        sub_806A568(&row->unk130[0],0,E60Val->unk4,E60Val->unk0,0x2000,0x7C,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkD % 10];
        sub_806A568(&row->unk130[1],0,E60Val->unk4,E60Val->unk0,0x2000,0x84,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkE / 10];
        sub_806A568(&row->unk190[0],0,E60Val->unk4,E60Val->unk0,0x2000,0xA4,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkE % 10];
        sub_806A568(&row->unk190[1],0,E60Val->unk4,E60Val->unk0,0x2000,0xAC,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkF / 10];
        sub_806A568(&row->unk1F0[0],0,E60Val->unk4,E60Val->unk0,0x2000,0xCC,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkF % 10];
        sub_806A568(&row->unk1F0[1],0,E60Val->unk4,E60Val->unk0,0x2000,0xD4,temp1,0xD,E60Val->unk2,0);
    }
}

void sub_806A1D0(void);
void sub_806A348(void);
void sub_806B7D0(void);

void sub_806A0F4(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_8069978_UNK390_ROW* rows = multiplayerRecordsScreen->unk390->unk0;

    sub_806A348();
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
        sub_806B7D0();
    }
}

void sub_806A1D0(void) {
    struct UNK_8069978_UNK390_ROW* row;
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
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

    row = &multiplayerRecordsScreen->unk390->unk0[multiplayerRecordsScreen->unk3A4];

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

    sub_806A348();

    if (multiplayerRecordsScreen->unk394 > 8) {
        multiplayerRecordsScreen->unk394 = 0;
        gCurTask->main = sub_806A0F4;
    }
}

void sub_806A348(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk8C = &multiplayerRecordsScreen->unk8C;
    struct UNK_0808B3FC_UNK240* unkBC = &multiplayerRecordsScreen->unkBC;
    struct UNK_0808B3FC_UNK240* unk14C = multiplayerRecordsScreen->unk14C;
    struct UNK_0808B3FC_UNK240* unk26C = multiplayerRecordsScreen->unk26C;
    struct UNK_0808B3FC_UNK240* unk2CC = multiplayerRecordsScreen->unk2CC;
    struct UNK_0808B3FC_UNK240* unk32C = multiplayerRecordsScreen->unk32C;
    struct UNK_8069978_UNK390* unk390 = multiplayerRecordsScreen->unk390;
    
    struct UNK_8069978_UNK390_ROW* row;
    struct UNK_0808B3FC_UNK240* unkEC;

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
    
    row = &multiplayerRecordsScreen->unk390->unk0[multiplayerRecordsScreen->unk3A6 + 4];
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

    row = &multiplayerRecordsScreen->unk390->unk0[multiplayerRecordsScreen->unk3A4];

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

void sub_806A568(struct UNK_0808B3FC_UNK240* obj, s8 a, u32 b, u16 c, u32 d, s16 xPos, s16 yPos, u16 g, u8 h, u8 focused) {
    struct UNK_0808B3FC_UNK240 newObj;
    struct UNK_0808B3FC_UNK240* ref;
    ref = &newObj;
   
    if (obj != NULL) {
        ref = obj;
    }

    if (a != 0) {    
        if (gUnknown_03005B54 == NULL) {
            gUnknown_03005B54 = gUnknown_03005B50;
        }
        ref->unk4 = gUnknown_03005B54;
    } else {
        ref->unk4 = gUnknown_03005B50;
    }
    
    ref->unk8 = 0;
    ref->unkA = c;
    ref->unk10 = d;
    ref->unk16 = xPos;
    ref->unk18 = yPos;
    ref->unk1A = g << 6;
    ref->unk1C = 0;
    ref->unk1E = 0xffff;
    ref->unk20 = h;
    ref->unk21 = 0xff;
    ref->unk22 = 0x10;
    ref->unk25 = focused;
    ref->unk28 = -1;

    sub_8004558(ref);

    switch(a) {
        case 0:
            gUnknown_03005B50 = gUnknown_03005B50 + b * 32;
            gUnknown_03005B54 = NULL;
            break;
        case 1:
            gUnknown_03005B54 = gUnknown_03005B54 + b * 32;
            break;
    }
}

// This is the same function as sub_806BA14, so maybe
// the body is a macro?
// 
// Unfortunately sub_806BA14 can't just call this function
// to match
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

// OptionScreenTaskDestroyHandler
static void sub_806A758(struct Task* optionsScreenTask) {
    // unimplemented
}

void sub_806A7E0(void);
static void sub_806A794(struct OptionsScreen*);

static void sub_806A75C(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

    sub_8063D20(optionsScreen, 0);
    sub_806A794(optionsScreen);
    sub_8063DCC(optionsScreen, 0);
    gCurTask->main = sub_806A7E0;
}

static void sub_806A794(struct OptionsScreen* optionsScreen) {
    sub_806B854(&optionsScreen->unk364, 0, 7, 0x85, 0x1E, 0x14, 0, 0, 0, 0);
    sub_806B854(&optionsScreen->unk3A4, 1, 0xE, 0x86, 0x1E, 0x14, 0, 1, 0, 0);
}

void sub_806A7E0(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionScreen;
    }
}

static void CreateDifficultyMenu(struct OptionsScreen*);
static void CreateTimeLimitMenu(struct OptionsScreen*);

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

    optionsScreen->transitionFrame = 0;
    gCurTask->main = sub_80644C4;
}

static void sub_806A8A8(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    if (optionsScreen->unk784 < 2) {
        sub_80649A4();
    }

    if (optionsScreen->unk784 == 0) {
        optionsScreen->transitionFrame = 0;
        gCurTask->main = sub_80645E0;
    }
}

void sub_806A91C(void);

/** Menu 1 **/

static void OptionScreenShowLanguageScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_806A91C;
}

void sub_806B02C(struct OptionsScreen*);
void sub_806A91C(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        sub_806B02C(optionsScreen);
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_80646FC;
    }
}

static void sub_806A968(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionScreen;
    }   
}

void sub_806A9CC(void);

/** Menu 2 **/

// ShowSoundTestScreen
static void OptionScreenShowSoundTestScreen(void) {
    struct Task* task = gCurTask;

    struct OptionsScreen* optionsScreen = TaskGetStructPtr(task, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    task->main = sub_806A9CC;
}

void sub_806A9CC(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        sub_808A258(optionsScreen);
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_80647C8;
    }
}

static void sub_806AA18(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionScreen;
    }
}


static void sub_806AA7C(void);
/** Menu 3 **/

static void OptionScreenShowDeleteGameDataScreen(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_806AA7C;
}

static void sub_806AA7C(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        CreateDeleteGameDataScreen(optionsScreen);
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_806489C;
    }
}

static void sub_806AAC8(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = Task_OptionScreen;
    }
}

void sub_806AB2C(void);

/** Player Data Menu 1 **/

static void sub_806AAFC(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_806AB2C;
}

void sub_806AB2C(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        CreateEditProfileNameScreen(playerDataMenu);
        playerDataMenu->unk163 = 1;
        playerDataMenu->optionsScreen->unk784 = 2;
        gCurTask->main = sub_8064F1C;
    }
}

static void sub_806AB90(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = sub_8064C44;
    }
}

/** Player Data Menu 2 **/

static void sub_806ABC4(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_8065004;
}

static void sub_806ABF4(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = sub_8064C44;
    }
}

void sub_806AC58(void);

/** Player Data Menu 3 **/

static void sub_806AC28(void) {
    struct Task* task = gCurTask;

    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(task, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    task->main = sub_806AC58;
}

void sub_806AC58(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        sub_8069978(playerDataMenu);
        playerDataMenu->unk163 = 1;
        playerDataMenu->optionsScreen->unk784 = 2;
        gCurTask->main = sub_8065174;
    }
}

static void sub_806ACBC(void) {
    struct PlayerDataMenu* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = sub_8064C44;
    }
}

void sub_806AD20(void);

/** Menu 4 **/

static void OptionScreenHandleExit(void) {
    struct Task* task = gCurTask;

    struct OptionsScreen* optionsScreen = TaskGetStructPtr(task, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    task->main = sub_806AD20;
}

void sub_8072484(void);

void sub_806AD20(void) {
    struct OptionsScreen* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    if (!sub_802D4CC(unk270)) {
        sub_80649A4();
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

static void sub_806AD98(void) {
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
    struct Task* t = TaskCreate(sub_80653E4, sizeof(struct SwitchMenu), 0x2000, 4, NULL);
    struct SwitchMenu* difficultyMenu = TaskGetStructPtr(t, difficultyMenu);
    
    difficultyMenu->optionsScreen = optionsScreen;
    difficultyMenu->switchValue = optionsScreen->difficultyLevel;
    difficultyMenu->language = optionsScreen->language;
    difficultyMenu->unkF5 = 0;

    RenderDifficultyMenuUI(difficultyMenu);
}

static void sub_806AE54(void) {
    struct SwitchMenu* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* headerFooter = state->headerFooter;
    struct UNK_0808B3FC_UNK240* difficultyOption = state->options;
    struct UNK_0808B3FC_UNK240* switchValueOutline = &state->switchValueOutline;

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
    struct Task* t = TaskCreate(sub_8065838, sizeof(struct SwitchMenu), 0x2000, 4, 0);
    struct SwitchMenu* timeLimitMenu = TaskGetStructPtr(t, timeLimitMenu);

    timeLimitMenu->optionsScreen = optionsScreen;
    timeLimitMenu->switchValue = optionsScreen->timeLimitEnabled;
    timeLimitMenu->language = optionsScreen->language;
    timeLimitMenu->unkF5 = 0;
    RenderTimeLimitMenuUI(timeLimitMenu);
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
    struct ButtonConfigMenu* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    
    unk214->unk18 = 0x2A;
    unk1B4->unk18 = 0x35;
    unk1B4++;
    unk1B4->unk18 = 0x35;

    sub_8066818();
    gCurTask->main = sub_8066004;
}

static void sub_806AFAC(void) {
    struct ButtonConfigMenu* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    
    unk214->unk18 = 0x42;
    unk1B4->unk18 = 0x4D;
    unk1B4++;
    unk1B4->unk18 = 0x4D;

    sub_8066818();
    gCurTask->main = sub_8066220;
}

static void sub_806AFEC(void) {
    struct ButtonConfigMenu* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    
    unk214->unk18 = 0x5A;
    unk1B4->unk18 = 0xB4;
    unk1B4++;
    unk1B4->unk18 = 0xB4;

    sub_8066818();
    gCurTask->main = sub_8066478;
}

void sub_806B02C(struct OptionsScreen* optionScreen) {
    struct Task* t = TaskCreate(sub_806B0D8, 0x204, 0x2000, 4, 0);
    struct LanguageScreen* state = TaskGetStructPtr(t, state);

    state->optionsScreen = optionScreen;
    state->menuCursor = optionScreen->language;
    state->creatingNewProfile = FALSE;
    gUnknown_03005B50 = (void*)(OBJ_VRAM0);
    gUnknown_03005B54 = 0;

    sub_80668A8(state);
    sub_806B0AC(state);
    sub_8066930(state);
}

static void sub_806B0AC(struct LanguageScreen* languageSelectionScreen) {
    sub_806B854(&languageSelectionScreen->unk1B0,0,7,0x86,0x1E,0x14,0,0,0,0);
}

static void sub_806B0D8(void) {
    struct LanguageScreen* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk1F0 = &state->unk1F0;

    sub_806B1F8();
    sub_806B1B8();

    if (sub_802D4CC(unk1F0)) {
        gCurTask->main = Task_LanguageScreenMain;
    }
}

void sub_806B14C(void);
static void sub_806B110(void) {
    struct LanguageScreen* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk1F0 = &state->unk1F0;
    unk1F0->unk0 = 0;
    unk1F0->unk2 = 1;
    unk1F0->unk4 = 0;
    unk1F0->unk6 = 0x100;
    unk1F0->unkA = 0;
    unk1F0->unk8 = 0xFF;

    sub_802D4CC(unk1F0);
    gCurTask->main = sub_806B14C;
}

void sub_806B14C(void) {
    struct LanguageScreen* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk1F0 = &state->unk1F0;
    sub_806B1B8();

    if (!sub_802D4CC(unk1F0)) {
        sub_806B1F8();
    } else {
        if (state->creatingNewProfile == TRUE) {
            CreateNewProfileNameScreen(NEW_PROFILE_NAME_START_GAME);
        } else {
            state->optionsScreen->unk784 = 0;
        }
        TaskDestroy(gCurTask);
    }
}

// ReseedRng
static void sub_806B1B8(void) {
    ShuffleRngSeed();
}

static void sub_806B1F8(void) {
    struct LanguageScreen* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unk180 = &state->unk180;

    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        sub_80051E8(unk0);
    }

    for (i = 0; i < 6; i++, unk60++) {
        sub_80051E8(unk60);
    }

    sub_80051E8(unk180);
}

static void sub_806B258(struct DeleteGameDataScreen* state) {
    sub_806B854(&state->unk1F0,0,7,0x86,0x1e,0x14,0,0,0,0);
}

static void sub_806B280(void) {
    struct DeleteGameDataScreen* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk130 = &state->unk130;
    sub_806B2F8();
    if (sub_802D4CC(unk130)) {
        gCurTask->main = sub_8066FAC;
    }
}

static void sub_806B2B4(void) {
    struct DeleteGameDataScreen* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk130 = &state->unk130;

    sub_806B2F8();

    unk130->unk0 = 0;
    unk130->unk2 = 1;
    unk130->unk4 = 0;
    unk130->unk6 = 0x100;
    unk130->unkA = 0;
    unk130->unk8 = 0xFF;

    sub_802D4CC(unk130);
    gCurTask->main = sub_806723C;
}

static void sub_806B2F8(void) {
    struct DeleteGameDataScreen* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &state->unkC0;

    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        sub_80051E8(unk0);
    }

    for (i = 0; i < 2; i++, unk60++) {
        sub_80051E8(unk60);
    }

    sub_80051E8(unkC0);
}

static void sub_806B354(void) {
    struct ProfileNameScreen* profileNameScreen = TaskGetStructPtr(gCurTask, profileNameScreen);
    struct UNK_802D4CC_UNK270* unk140 = &profileNameScreen->unk140;

    RenderProfileNameScreenUI();
    if (sub_802D4CC(unk140)) {
        profileNameScreen->matrixCursorIndex = 0;
        gCurTask->main = Task_ProfileNameScreenMain;
    }
}

/** Course Records Screen **/

void sub_806B394(struct CourseRecordsScreen* courseRecordsScreen) {
    courseRecordsScreen->unk707 = 0;
    courseRecordsScreen->showingBossRecords = 0;
    courseRecordsScreen->mode = 0;
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_80682AC();
    sub_80682EC(courseRecordsScreen);
    sub_806834C(courseRecordsScreen);

    gCurTask->main = sub_806B3F0;
}


static void sub_806B3F0(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;

    sub_806B4F8();
    if (sub_802D4CC(unk0)) {
        gCurTask->main = sub_8068474;
    }
}

void sub_806B454(void);

static void sub_806B424(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = sub_806B454;
}

void sub_806B454(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;
    struct PlayerDataMenu* playerProfileMenu = courseRecordsScreen->playerProfileMenu;

    if (!sub_802D4CC(unk0)) {
        sub_806B4F8();
    } else {
        playerProfileMenu->unk163 = 0;
        TaskDestroy(gCurTask);
    }
}

void sub_806B4C8(void);

static void sub_806B498(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = sub_806B4C8;
}

void sub_806B558(struct CourseRecordsScreen*);

void sub_806B4C8(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;

    if (!sub_802D4CC(unk0)) {
        sub_806B4F8();
    } else {
        sub_806B558(courseRecordsScreen);
    }
}

static void sub_806B4F8(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);

    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = courseRecordsScreen->unk13C;
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
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

void sub_806B558(struct CourseRecordsScreen* courseRecordsScreen) {
    courseRecordsScreen->mode = 0;
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8068640();
    sub_8068700(courseRecordsScreen);
    sub_80687BC(courseRecordsScreen);

    gCurTask->main = sub_806B5A4;
}

void sub_806B5CC(void);

static void sub_806B5A4(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    sub_8068A94(courseRecordsScreen);

    gCurTask->main = sub_806B5CC;
}

void sub_806B5CC(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;
    sub_806979C(0);
    
    if (sub_802D4CC(unk0)) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8069208;
    }
}

void sub_806B60C(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_0808B3FC_UNK240* unkDC = &courseRecordsScreen->unkAC[1];

    const struct UNK_080D95E8* unk5E8 = &gUnknown_080D9F40[courseRecordsScreen->act];

    unkDC->unkA = unk5E8->unk0;
    unkDC->unk20 = unk5E8->unk2;

    sub_8004558(unkDC);
    sub_8068D94(courseRecordsScreen);
    sub_806979C(0);

    courseRecordsScreen->unk707 = 0;
    gCurTask->main = sub_8069110;
}

void sub_806B6B4(void);

void sub_806B684(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = sub_806B6B4;
}

void sub_806B6B4(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0; 

    if (!sub_802D4CC(unk0)) {
        sub_806979C(0);
    } else {
        gSelectedZone = courseRecordsScreen->zone * 4 + (courseRecordsScreen->showingBossRecords ? 2 : courseRecordsScreen->act);

        EwramFree(courseRecordsScreen->timeRecords);
        TaskDestroy(gCurTask);
        sub_801A770();
    }
}

void sub_806B730(void) {
    struct CourseRecordsScreen* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = sub_8069688;
}

void sub_806B79C(void);

void sub_806B760(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);

    sub_8069EC4(multiplayerRecordsScreen->unk394);

    if (++multiplayerRecordsScreen->unk394 > 9) {
        multiplayerRecordsScreen->unk394 = 0;
        gCurTask->main = sub_806B79C;
    }
}

void sub_806B79C(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    sub_806A348();

    if (sub_802D4CC(unk0)) {
        gCurTask->main = sub_806A0F4;
    }
}

void sub_806B800(void);

void sub_806B7D0(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;

    unk0->unk0 = 0;
    unk0->unk2 = 1;
    unk0->unk4 = 0;
    unk0->unk6 = 0x100;
    unk0->unkA = 0;
    unk0->unk8 = 0xFF;

    gCurTask->main = sub_806B800;
}

void sub_806B800(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &multiplayerRecordsScreen->unk0;
    struct PlayerDataMenu* playerDataMenu = multiplayerRecordsScreen->unk38C;

    if (!sub_802D4CC(unk0)) {
        sub_806A348();
    } else {
        EwramFree(multiplayerRecordsScreen->unk390);
        playerDataMenu->unk163 = 0;
        TaskDestroy(gCurTask);
    }
}
