#include "global.h"
#include "core.h"
#include "data.h"
#include "game/game.h"
#include "engine/task.h"
#include "game/init.h"
#include "flags.h"
#include "game/save.h"
#include "game/game.h"
#include "player.h"
#include "game/title_screen.h"
#include "game/options_screen.h"
#include "game/multiboot/connection.h"

void GameStart(void)
{
    u32 i;
    bool32 hasProfile = FALSE;

    gUnknown_03002260 = gMapHeaders;
    gUnknown_03002794 = &gSpriteTables;
    gUnknown_03004D54 = gUnknown_03001B60[0];
    gUnknown_030022C0 = gUnknown_03001B60[1];

    gUnknown_03005424 = gUnknown_0300544C = EXTRA_STATE__CLEAR;

    gUnknown_030059D8 = 0;
    gUnknown_03005844 = NULL;
    gGameStageTask = NULL;
    gPlayer.unk8C = 0;
    gCamera.unk5C = 0;

    gUnknown_030059D0[1] = 0;
    gUnknown_03005660.unk10 = 0;

    gUnknown_0300543C = 0;
    gGameMode = GAME_MODE_SINGLE_PLAYER;
    gUnknown_030054DC = 0;
    gUnknown_03005B34 = 0;
    gDemoPlayCounter = 0;
    // TODO: resolve this
    gUnknown_030054E4 = 0;

    for (i = 0; i < 4; i++) {
        gMultiplayerPlayerTasks[i] = NULL;
    }

    for (i = 0; i < 4; i++) {
        gMultiplayerCharacters[i] = 0;
        gUnknown_030054B4[i] = 0;
        gMultiplayerMissingHeartbeats[i] = 0;
    }

    SaveInit();

    if (SaveGameExists()) {
        LoadSaveGame();
        hasProfile = TRUE;
    }

    if (gFlags & 0x200) {
        // Show singlepak results
        sub_8081C0C();
        return;
    }

    if (gFlags & FLAGS_NO_FLASH_MEMORY) {
        CreateTitleScreen();
        LoadCompletedSaveGame();
        return;
    }

    if (!hasProfile) {
        CreateNewProfileScreen();
        return;
    }

    // When a special button combination is pressed
    // skip the intro and go straight to the
    // title screen
    if (gFlags & FLAGS_SKIP_INTRO) {
        CreateTitleScreenAndSkipIntro();
        gFlags &= ~FLAGS_SKIP_INTRO;
        return;
    }

    CreateTitleScreen();
}

static void Task_DummyFunc(void);
static void DummyTaskOnDestroy(struct Task *);

UNUSED static void CreateDummyTask(void)
{
    gUnknown_03005844 = TaskCreate(Task_DummyFunc, 0, 0x100, 0, DummyTaskOnDestroy);
}

UNUSED static void DestroyDummyTask(void)
{
    TaskDestroy(gUnknown_03005844);
    gUnknown_03005844 = NULL;
}

UNUSED static void Task_DummyFunc(void) { }

UNUSED static void DummyTaskOnDestroy(struct Task *task) { gUnknown_03005844 = NULL; }
