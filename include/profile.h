#ifndef GUARD_OPTION_SCREEN_H
#define GUARD_OPTION_SCREEN_H

#include "global.h"
#include "save.h"
#include "sprite.h"
#include "constants/text.h"

#define NEW_PROFILE_NAME_MULTIPLAYER 0
#define NEW_PROFILE_NAME_START_GAME 1

#define NUM_OPTIONS_MENU_ITEMS 8

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

extern void* gProfileScreenNextVramAddress;
extern void* gProfileScreenSubMenuNextVramAddress;

extern const u16 gUnknown_080D95A4[16];
extern const u16 gUnknown_080D95C4[2];
extern const u16 gUnknown_080D95C8[5];

extern const u16 gUnknown_080D95D2[2];
extern const u16 gUnknown_080D95D6[4][2];

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
