#ifndef GUARD_OPTION_SCREEN_H
#define GUARD_OPTION_SCREEN_H

#include "global.h"
#include "save.h"
#include "sprite.h"

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

    struct SaveGameUnk2C unk350; /* size 0x8 */
};

#define NUM_OPTIONS_MENU_ITEMS 8

// OptionsScreen
struct OptionsScreen {
    // profileData
    struct OptionsScreenProfileData profileData;

    u8 unk358;
    u8 unk359;
    u8 unk35A;

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
    struct UNK_0808B3FC_UNK240 unk3E4;
    struct UNK_0808B3FC_UNK240 menuItems[NUM_OPTIONS_MENU_ITEMS];
    struct UNK_0808B3FC_UNK240 unk594[4];
    struct UNK_0808B3FC_UNK240 unk654[6];
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
    s8 language;

    // newProfileMode
    u8 unk201;

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
    u8 unk3BB;
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

void CreateOptionsScreen(u16);
void CreateCourseRecordsScreen(u16, u16);
void CreateNewProfileScreen();
void CreateProfileNameScreen(s16);

#endif // GUARD_OPTION_SCREEN_H
