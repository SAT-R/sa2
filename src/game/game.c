#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"

#include "game/game.h"
#include "game/save.h"

#include "game/title_screen.h"
#include "game/options_screen.h"
#include "game/multiboot/connection.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/decomp_credits.h"
#include "game/stage/tilemap_table.h"
#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/underwater_effects.h"
#include "game/stage/dust_effect_braking.h"
#include "game/stage/rings_scatter.h"

#if COLLECT_RINGS_ROM
#include "game/multiboot/collect_rings/results.h"
#endif

#include "game/water_effects.h"
#include "game/dummy_task.h"

#if TAS_TESTING
#include "data/recordings.h"
#endif

#include "data/sprite_tables.h"

#ifndef COLLECT_RINGS_ROM
void GameInit(void)
{
    u32 i;
    bool32 hasProfile = FALSE;

    // NOTE: cast because of const
    gTilemapsRef = (Tilemap **)gTilemaps;
    gRefSpriteTables = &gSpriteTables;
    gUnknown_03004D54 = gBgOffsetsBuffer[0];
    gUnknown_030022C0 = gBgOffsetsBuffer[1];

    gStageFlags = gUnknown_0300544C = STAGE_FLAG__CLEAR;

    gRingsScatterTask = NULL;
    gDummyTask = NULL;
    gGameStageTask = NULL;
    gPlayer.spriteTask = NULL;
    gCamera.movementTask = NULL;

    gDustEffectBrakingTask.t = NULL;
    gWater.t = NULL;

    gUnknown_0300543C = 0;
    gGameMode = GAME_MODE_SINGLE_PLAYER;
    gEntitiesManagerTask = NULL;
    gSmallAirBubbleCount = 0;
    gDemoPlayCounter = 0;
    // TODO: resolve this
    gDestroySpotlights = 0;

    for (i = 0; i < 4; i++) {
        gMultiplayerPlayerTasks[i] = NULL;
    }

#if (GAME == GAME_SA1)
    gTask_03006240 = 0;
#endif

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

    // This flag is only set in EngineInit
    if (gFlags & FLAGS_200) {
        ShowSinglePakResults();
        return;
    }

#if TAS_TESTING
    gInputPlaybackData = gDemoRecordings[4];
    InputRecorderLoadTape();
    gInputRecorder.mode = RECORDER_PLAYBACK;
    CreateTitleScreen();

    // Use this snippet to skip to a specific level
    // zone 7 act 1 starts at frame 44928
    // gInputRecorder.playbackHead = 44928;
    // gCurrentLevel = LEVEL_INDEX(ZONE_7, ACT_1);
    // ApplyGameStageSettings();
    // GameStageStart();

#elif ENABLE_DECOMP_CREDITS
    CreateDecompCreditsScreen(hasProfile);
#else
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
#endif
}
#else
void GameInit(void)
{
    u32 i;
#ifndef NON_MATCHING
    u8 *multiSioEnabled;
#endif
    gGameMode = 5;

    gUnknown_03004D54 = gBgOffsetsBuffer[0];
    gUnknown_030022C0 = gBgOffsetsBuffer[1];

    i = 0;
#ifndef NON_MATCHING
    multiSioEnabled = &gMultiSioEnabled;
#endif

    for (; i < 4; i++) {
        gMultiplayerCharacters[i] = 0;
        gMPRingCollectWins[i] = 0;
        gUnknown_030054B4[i] = i;
        gMultiplayerMissingHeartbeats[i] = 0;
    }
#ifndef NON_MATCHING
    *multiSioEnabled = TRUE;
#else
    gMultiSioEnabled = TRUE;
#endif
    // gMultiSioStatusFlags = 0;
    MultiSioInit(gMultiSioStatusFlags);
    MultiSioStart();
    CreateMultiplayerSinglePakResultsScreen(0);
}
#endif
