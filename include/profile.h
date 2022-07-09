#ifndef GUARD_OPTION_SCREEN_H
#define GUARD_OPTION_SCREEN_H

#include "global.h"
#include "save.h"
#include "sprite.h"

#define NEW_PROFILE_NAME_MULTIPLAYER 0
#define NEW_PROFILE_NAME_START_GAME 1

struct OptionsScreenProfileData {
    // playerName
    u16 playerName[MAX_PLAYER_NAME_LENGTH];

    // timeRecords
    struct TimeRecords unkC;
    
    struct MultiplayerTimeRecord unk284[10];

    u8 unk34C;
    u8 unk34D;
    u8 unk34E;

    u8 filler34F;

    struct ButtonConfig buttonConfig;
};

#define NUM_OPTIONS_MENU_ITEMS 8

// OptionsScreen
struct OptionsScreen {
    // profileData
    struct OptionsScreenProfileData profileData;

    u8 unk358;
    u8 difficultyLevel;
    u8 timeLimitEnabled;

    // language
    u8 language;

    bool8 soundTestUnlocked;

    u8 bossTimeAttackUnlocked;
    u8 unk35E;

    u8 filler35F;

    s16 subMenuXPos;
    s16 unk362;
    struct Unk_03002400 unk364;
    struct Unk_03002400 unk3A4;
    struct UNK_0808B3FC_UNK240 title;
    struct UNK_0808B3FC_UNK240 menuItems[NUM_OPTIONS_MENU_ITEMS];

    struct UNK_0808B3FC_UNK240 metaItems[4];

    struct UNK_0808B3FC_UNK240 playerNameDisplay[6];
    struct UNK_802D4CC_UNK270 unk774;
    s8 menuCursor;
    s8 unk781;
    s8 unk782;
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
    struct Unk_03002400 unkC;
    struct UNK_0808B3FC_UNK240 unk4C[2];
    struct UNK_0808B3FC_UNK240 unkAC[2];
    struct UNK_0808B3FC_UNK240 unk10C;
    struct UNK_0808B3FC_UNK240 unk13C[2];
    struct UNK_0808B3FC_UNK240 unk19C[2];

    struct PlayerDataMenu* playerDataMenu;

    struct TimeRecords* timeRecords;

    struct Unk_03002400 unk204;
    struct Unk_03002400 unk244;
    struct UNK_0808B3FC_UNK240 unk284[3];
    struct TimeRecordDisplay timeDisplays[3];

    u8 character;

    u8 zone;
    u8 act;

    u8 animFrame;
    u8 unk708;
    u8 availableCharacters;
    u8 characterZones[NUM_CHARACTERS];
    u8 language;

    bool8 isBossMode;

    u8 view;
}; /* size 0x714 */

struct LanguageScreen {
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 menuItems[6];
    struct UNK_0808B3FC_UNK240 menuItemOutline;
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
    s8 unk161;

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
    struct UNK_0808B3FC_UNK240 unk4[6];
    struct UNK_0808B3FC_UNK240 unk124[3];
    struct UNK_0808B3FC_UNK240 unk1B4[2];
    struct UNK_0808B3FC_UNK240 unk214;
    u8 unk244;
    u8 unk245;
    u8 unk246;
    u8 unk247;
    s8 unk248;
    s8 language;
}; /* size 0x24C */

struct DeleteScreen {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60[2];
    struct UNK_0808B3FC_UNK240 unkC0;
    struct Unk_03002400 unk1F0;
    struct UNK_802D4CC_UNK270 unk130;
    struct OptionsScreen* optionsScreen; 
    s8 confirmationCursor;
    u8 unk141;
    s8 language;
    s8 deleteConfirmed;
}; /* 0x144 */

struct MultiplayerRecordRow {
    // playerName
    u16 playerName[6];

    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    struct UNK_0808B3FC_UNK240 unk10[6];
    struct UNK_0808B3FC_UNK240 unk130[2];
    struct UNK_0808B3FC_UNK240 unk190[2];
    struct UNK_0808B3FC_UNK240 unk1F0[2];
}; /* size 0x250 */

struct MultiplayerRecordsTable {
   struct MultiplayerRecordRow rows[10];
}; /* size 0x1720 */

// MultiPlayerRecordsScreen
struct MultiplayerRecordsScreen {
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
    struct PlayerDataMenu* playerDataMenu;

    struct MultiplayerRecordsTable* table;
    u8 unk394;
    u8 unk395;
    u8 unk396;
    u8 unk397;

    // playerName
    u16 playerName[6];

    u8 unk3A4;
    u8 unk3A5;
    u8 unk3A6;

    // language
    u8 language;
}; /* size 0x3A8 */

void CreateOptionsScreen(u16);
void CreateTimeAttackSelectionScreen(bool16 isBossView, u16 selectedCharacter);
void CreateNewProfileScreen(void);
void CreateNewProfileNameScreen(s16 mode);

#endif // GUARD_OPTION_SCREEN_H
