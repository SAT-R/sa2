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

    u8 unk35D;
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
    s8 transitionFrame;
    s8 unk784;

    u8 filler785[3];
}; /* size 0x788 */

struct UNK_80637EC_UNK314 {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60;
    struct UNK_0808B3FC_UNK240 unk90[2];
    struct UNK_0808B3FC_UNK240 unkF0[2];
};

// CourseRecordsScreen
struct CourseRecordsScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct Unk_03002400 unkC;
    struct UNK_0808B3FC_UNK240 unk4C[2];
    struct UNK_0808B3FC_UNK240 unkAC[2];
    struct UNK_0808B3FC_UNK240 unk10C;
    struct UNK_0808B3FC_UNK240 unk13C[2];
    struct UNK_0808B3FC_UNK240 unk19C[2];

    struct PlayerDataMenu* playerProfileMenu;

    struct TimeRecords* timeRecords;

    struct Unk_03002400 unk204;
    struct Unk_03002400 unk244;
    struct UNK_0808B3FC_UNK240 unk284[3];
    struct UNK_80637EC_UNK314 unk314[3];

    u8 unk704;

    // course
    u8 zone;
    // act
    u8 act;

    u8 unk707;
    u8 unk708;
    u8 unk709;
    u8 unk70A[5];
    u8 unk70F;

    u8 showingBossRecords;

    u8 unk711;
    u8 filler712[2];
}; /* size 0x714 */

struct LanguageScreen {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60[6];
    struct UNK_0808B3FC_UNK240 unk180;
    struct Unk_03002400 unk1B0;
    struct UNK_802D4CC_UNK270 unk1F0;
    // option screen
    struct OptionsScreen* optionsScreen;
    // language
    s8 menuCursor;

    bool8 creatingNewProfile;

    u8 unk202[2];
}; /* size 0x204 */

struct NameInputDisplay {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30[MAX_PLAYER_NAME_LENGTH];

    u16 unk150;
    // inputCursor
    u16 unk152;

    // playerName
    u16 unk154[MAX_PLAYER_NAME_LENGTH];
};

struct ProfileNameScreen {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30[3];
    struct Unk_03002400 unkC0;
    struct Unk_03002400 unk100;
    
    struct UNK_802D4CC_UNK270 unk140;
    struct PlayerDataMenu* unk14C;

    struct UNK_0808B3FC_UNK240 unk150[2];
    struct UNK_0808B3FC_UNK240 unk1B0[2];
    struct Unk_03002400 unk210;
    u16 unk250;
    s8 unk252;
    s8 unk253;

    u8 filler254[4];
    
    // nameInputDisplay
    struct NameInputDisplay nameInput;

    u16 unk3B8;
    u8 unk3BA;
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
    
    s8 unk163;
}; /* size 0x164 */

struct SwitchMenu {
    struct OptionsScreen* optionsScreen;
    struct UNK_0808B3FC_UNK240 headerFooter[2];
    struct UNK_0808B3FC_UNK240 options[2];
    struct UNK_0808B3FC_UNK240 switchValueOutline;
    s8 switchValue;
    s8 unkF5;
    s8 language;
    u8 unkF7;
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

struct DeleteGameDataScreen {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60[2];
    struct UNK_0808B3FC_UNK240 unkC0;
    struct Unk_03002400 unk1F0;
    struct UNK_802D4CC_UNK270 unk130;
    struct OptionsScreen* optionsScreen; 
    s8 confirmationCursor;
    u8 unk141;
    s8 language;
    s8 unk143;
}; /* 0x144 */

void CreateOptionsScreen(u16);
void CreateCourseRecordsScreen(u16, u16);
void CreateNewProfileScreen(void);
void CreateNewProfileNameScreen(s16 mode);

#endif // GUARD_OPTION_SCREEN_H
