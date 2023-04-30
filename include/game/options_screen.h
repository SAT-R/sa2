#ifndef GUARD_OPTION_SCREEN_H
#define GUARD_OPTION_SCREEN_H

#include "global.h"
#include "game/save.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "constants/text.h"

#define RENDER_TARGET_SCREEN   0
#define RENDER_TARGET_SUB_MENU 1

#define NEW_PROFILE_NAME_MULTIPLAYER 0
#define NEW_PROFILE_NAME_START_GAME  1

#define NUM_OPTIONS_MENU_ITEMS 8

#define OPTIONS_SCREEN_STATE_ACTIVE               0
#define OPTIONS_SCREEN_STATE_SUB_MENU_OPEN        1
#define OPTIONS_SCREEN_STATE_SUB_MENU_SCREEN_OPEN 2

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
    Background background;
    Background subMenuBackground;
    Sprite title;
    Sprite menuItems[NUM_OPTIONS_MENU_ITEMS];

    Sprite metaItems[4];

    Sprite playerNameDisplay[6];
    struct TransitionState unk774;
    s8 menuCursor;
    s8 prevCursorPosition;
    s8 initialSubMenuCursorPosition;
    s8 subMenuAnimFrame;
    s8 state;
}; /* size 0x788 */

extern void *gProfileScreenNextVramAddress;
extern void *gProfileScreenSubMenuNextVramAddress;

extern const u16 gUnknown_080D95A4[16];
extern const u16 gUnknown_080D95C4[2];
extern const u16 gUnknown_080D95C8[5];

extern const u16 gUnknown_080D95D2[2];
extern const u16 gUnknown_080D95D6[4][2];

#define ResetProfileScreensVram()                                                       \
    ({                                                                                  \
        gProfileScreenNextVramAddress = (void *)OBJ_VRAM0;                              \
        gProfileScreenSubMenuNextVramAddress = NULL;                                    \
    })

#define ResetProfileScreensSubMenuVram()                                                \
    ({ gProfileScreenSubMenuNextVramAddress = NULL; })

void CreateOptionsScreen(u16);
void CreateTimeAttackLevelSelectScreen(bool16 isBossView, s16 selectedCharacter,
                                       s8 currentLevel);
void CreateNewProfileScreen(void);
void CreateNewProfileNameScreen(s16 mode);

void sub_806A568(Sprite *obj, s8 target, u32 size, u16 c, u32 assetId, s16 xPos,
                 s16 yPos, u16 g, u8 h, u8 focused);
void sub_806B854(Background *unk2400, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f,
                 u8 g, u16 scrollX, u16 scrollY);

#endif // GUARD_OPTION_SCREEN_H
