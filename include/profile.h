#ifndef GUARD_OPTION_SCREEN_H
#define GUARD_OPTION_SCREEN_H

#include "global.h"
#include "save.h"
#include "sprite.h"
#include "constants/text.h"

#define NEW_PROFILE_NAME_MULTIPLAYER 0
#define NEW_PROFILE_NAME_START_GAME 1

struct OptionsScreenProfileData {
    // playerName
    u16 playerName[MAX_PLAYER_NAME_LENGTH];

    struct TimeRecords timeRecords;
    struct MultiplayerScore multiplayerScores[10];

    u8 multiplayerWins;
    u8 multiplayerLoses;
    u8 multiplayerDraws;

    struct ButtonConfig buttonConfig;
};

#define NUM_OPTIONS_MENU_ITEMS 8

// OptionsScreen
struct OptionsScreen {
    // profileData
    struct OptionsScreenProfileData profileData;

    u8 unusedUnk358;
    u8 difficultyLevel;
    u8 timeLimitEnabled;

    // language
    u8 language;

    bool8 soundTestUnlocked;

    u8 bossTimeAttackUnlocked;
    u8 unk35E;

    s16 subMenuXPos;
    s16 unk362;
    struct Unk_03002400 background;
    struct Unk_03002400 subMenuBackground;
    struct UNK_0808B3FC_UNK240 title;
    struct UNK_0808B3FC_UNK240 menuItems[NUM_OPTIONS_MENU_ITEMS];

    struct UNK_0808B3FC_UNK240 metaItems[4];

    struct UNK_0808B3FC_UNK240 playerNameDisplay[6];
    struct UNK_802D4CC_UNK270 unk774;
    s8 menuCursor;
    s8 prevCursorPosition;
    s8 initialSubMenuCursorPosition;
    s8 subMenuAnimFrame;
    s8 state;
}; /* size 0x788 */

struct TimeRecordDisplay {
    struct UNK_0808B3FC_UNK240 deliminators[2];
    struct UNK_0808B3FC_UNK240 minute;
    struct UNK_0808B3FC_UNK240 seconds[2];
    struct UNK_0808B3FC_UNK240 millis[2];
};

// TimeRecordsScreen
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
    // option screen
    struct OptionsScreen* optionsScreen;
    // language
    s8 menuCursor;

    bool8 creatingNewProfile;
}; /* size 0x204 */

struct NameInputDisplay {
    struct UNK_0808B3FC_UNK240 displayCursor;
    struct UNK_0808B3FC_UNK240 characterDisplay[MAX_PLAYER_NAME_LENGTH];

    u16 unk150;
    // inputCursor
    u16 cursor;

    // playerName
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
    
    // nameInputDisplay
    struct NameInputDisplay nameInput;

    u16 matrixCursorIndex;
    u8 language;
    u8 onCompleteAction;
}; /* size 0x3BC */

#define NUM_PLAYER_DATA_MENU_ITEMS 4

struct PlayerDataMenu {
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 menuItems[NUM_PLAYER_DATA_MENU_ITEMS];
    struct UNK_0808B3FC_UNK240 menuItemOutline;

    struct UNK_802D4CC_UNK270 unk150;
    
    struct OptionsScreen* optionsScreen;
    s8 menuCursor;
    s8 animFrame;

    // language
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
    // playerName
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

// MultiPlayerRecordsScreen
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

    // playerDataMenu
    struct PlayerDataMenu* playerDataMenu;

    struct MultiplayerRecordsTable* table;
    u8 scrollAnimFrame;
    u8 playerWins;
    u8 playerLoses;
    u8 playerDraws;

    // playerName
    u16 playerName[6];

    u8 targetFirstVisibleRowIndex;
    u8 currentFirstVisibleRowIndex;
    u8 scrollIndex;

    // language
    u8 language;
}; /* size 0x3A8 */

extern void* gProfileScreenNextVramAddress;
extern void* gProfileScreenSubMenuNextVramAddress;

#define ResetProfileScreensVram() ({ \
    gProfileScreenNextVramAddress = (void*)OBJ_VRAM0; \
    gProfileScreenSubMenuNextVramAddress = NULL; \
})

#define ResetProfileScreensSubMenuVram() ({ \
    gProfileScreenSubMenuNextVramAddress = NULL; \
})

void CreateOptionsScreen(u16);
void CreateTimeAttackSelectionScreen(bool16 isBossView, u16 selectedCharacter);
void CreateNewProfileScreen(void);
void CreateNewProfileNameScreen(s16 mode);

#endif // GUARD_OPTION_SCREEN_H
