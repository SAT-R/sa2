#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"

#include "game/game.h"
#include "game/save.h"

#include "game/title_screen.h"
#include "game/options_screen.h"
#include "game/multiboot/connection.h"

#include "sakit/entities_manager.h"

#include "game/stage/tilemap_table.h"
#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/underwater_effects.h"
#include "game/stage/dust_effect_braking.h"
#include "game/stage/rings_scatter.h"

#include "game/water_effects.h"
#include "game/dummy_task.h"

#include "data/sprite_tables.h"

void GameStart(void)
{
    u32 i;
    bool32 hasProfile = FALSE;

    // TODO: Fix cast
    gTilemapsRef = (struct MapHeader **)gTilemaps;
    gUnknown_03002794 = &gSpriteTables;
    gUnknown_03004D54 = gBgOffsetsBuffer[0];
    gUnknown_030022C0 = gBgOffsetsBuffer[1];

    gUnknown_03005424 = gUnknown_0300544C = EXTRA_STATE__CLEAR;

    gRingsScatterTask = NULL;
    gDummyTask = NULL;
    gGameStageTask = NULL;
    gPlayer.spriteTask = NULL;
    gCamera.movementTask = NULL;

    gUnknown_030059D0.t = NULL;
    gWater.t = NULL;

    gUnknown_0300543C = 0;
    gGameMode = GAME_MODE_SINGLE_PLAYER;
    gEntitiesManagerTask = NULL;
    gSmallAirBubbleCount = 0;
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

    // This flag is only set in GameInit
    if (gFlags & FLAGS_200) {
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
