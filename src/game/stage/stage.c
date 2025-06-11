#include "global.h"
#include "core.h"
#include "sprite.h"

#include "game/sa1_sa2_shared/entities_manager.h"
#include "game/sa1_sa2_shared/music_manager.h"
#include "game/sa1_sa2_shared/palette_loader.h"
#include "game/sa1_sa2_shared/pause_menu.h"
#include "game/sa1_sa2_shared/rings_manager.h"
#include "game/save.h"
#include "game/game_over.h"
#include "game/cheese.h"
#include "game/stage/player_controls.h"
#include "game/stage/player_super_sonic.h"
#include "game/race_progress.h"
#include "game/stage/screen_shake.h"
#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/time_attack/lobby.h"
#include "game/multiplayer/finish.h"
#include "game/multiplayer/indicators.h"

#include "game/multiboot/collect_rings/time_display.h"
#include "game/multiplayer/mp_player.h"

#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/characters.h"
#include "constants/songs.h"
#include "constants/zones.h"

#include "game/multiplayer/multiplayer_event_mgr.h"

#define BOSS_RINGS_DEFAULT_RESPAWN_COUNT 10

struct Task *gGameStageTask = NULL;

void Task_GameStage(void);

void TaskDestructor_GameStage(struct Task *);
void sub_801F044(void);

void CreatePlayer(u32, u32, Player *);
void CreateBossRunManager(u8);
void StageInit_CollectRings(void);

void SetupStageIntro(void);

void CreateStageWaterTask(u32, u32, u32);

void StageInit_Zone1Act1(void);
void StageInit_Zone3Act1(void);
void StageInit_Zone3Act2(void);
void StageInit_Zone4Act1(void);
void StageInit_Zone4Act2(void);
void StageInit_Zone6Act1(void);
void StageInit_Zone6Act2(void);
void StageInit_Zone7Act1(void);
void StageInit_Zone7Act2(void);
void StageInit_Zone7ActBoss(void);
void StageInit_Zone1Act2(void);
void StageInit_Zone1ActBoss(void);
void StageInit_Zone2Act1(void);
void StageInit_Zone2Act2(void);
void StageInit_Zone2ActBoss(void);
void StageInit_Zone3ActBoss(void);
void StageInit_Zone4ActBoss(void);
void StageInit_Zone5Act1(void);
void StageInit_Zone5Act2(void);
void StageInit_Zone5ActBoss(void);
void StageInit_ZoneFinalActXX(void);
void StageInit_Zone6ActBoss(void);
void StageInit_ZoneFinalActTA53(void);
void StageInit_MultiplayerSinglePak(void);
void StageInit_31(void);
void StageInit_32(void);
void StageInit_33(void);
void StageInit_Dummy(void);
#ifndef COLLECT_RINGS_ROM
// NOTE(Jace): Many of these call copies of the exact same procedure,
//             so for non-matching builds we could just exclude
//             codegen for those copies and have pointers to a single one?
const VoidFn sStageInitProcs[NUM_LEVEL_IDS] = { StageInit_Zone1Act1,
                                                StageInit_Zone1Act2,
                                                StageInit_Zone1ActBoss,
                                                StageInit_Dummy,
                                                StageInit_Zone2Act1,
                                                StageInit_Zone2Act2,
                                                StageInit_Zone2ActBoss,
                                                StageInit_Dummy,
                                                StageInit_Zone3Act1,
                                                StageInit_Zone3Act2,
                                                StageInit_Zone3ActBoss,
                                                StageInit_Dummy,
                                                StageInit_Zone4Act1,
                                                StageInit_Zone4Act2,
                                                StageInit_Zone4ActBoss,
                                                StageInit_Dummy,
                                                StageInit_Zone5Act1,
                                                StageInit_Zone5Act2,
                                                StageInit_Zone5ActBoss,
                                                StageInit_Dummy,
                                                StageInit_Zone6Act1,
                                                StageInit_Zone6Act2,
                                                StageInit_Zone6ActBoss,
                                                StageInit_Dummy,
                                                StageInit_Zone7Act1,
                                                StageInit_Zone7Act2,
                                                StageInit_Zone7ActBoss,
                                                StageInit_Dummy,
                                                StageInit_ZoneFinalActXX,
                                                StageInit_ZoneFinalActTA53,
                                                StageInit_MultiplayerSinglePak,
                                                StageInit_31,
                                                StageInit_32,
                                                StageInit_33 };
#else
extern const VoidFn sStageInitProcs[NUM_LEVEL_IDS];
#endif
extern const s8 CollHeightMap_zone_1_act_1_fg[];
extern const u8 CollTileRot_zone_1_act_1_fg[];
extern const u8 CollFlags_zone_1_act_1_fg[];

#ifndef COLLECT_RINGS_ROM
void ApplyGameStageSettings(void)
{
    gLevelScore = 0;
    gUnknown_030054B0 = 0;
    gNumLives = 3;

    if (IS_MULTI_PLAYER) {
        gNumLives = 1;
    }

    if ((gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK || gGameMode == GAME_MODE_MULTI_PLAYER
         || gGameMode == GAME_MODE_TEAM_PLAY)
        || (gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        gDifficultyLevel = DIFFICULTY_NORMAL;
    } else {
        gDifficultyLevel = gLoadedSaveGame->difficultyLevel;
    }

    if ((gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        SetPlayerControls(A_BUTTON, B_BUTTON, R_BUTTON);
    } else {
        SetPlayerControls(gLoadedSaveGame->buttonConfig.jump, gLoadedSaveGame->buttonConfig.attack, gLoadedSaveGame->buttonConfig.trick);
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
void GameStageStart(void)
{
    gTrappedAnimalVariant = 0;
    gBossIndex = 0;
    gRingCount = 0;

    // Unused leftover var from SA1, used for CPU "Partner" Tails
    gNumSingleplayerCharacters = 1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        CallSetStageSpawnPos(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
        gCheese = NULL;
    }

    gStageTime = 0;
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

    if (IS_MULTI_PLAYER) {
        gMPStageStartFrameCount = gFrameCount;
    }

    gCheckpointTime = ZONE_TIME_TO_INT(0, 0);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gCourseTime = ZONE_TIME_TO_INT(0, 0);
    } else {
        gCourseTime = ZONE_TIME_TO_INT(3, 0);
    }

    CreateGameStage();
}
#endif

void CreateGameStage(void)
{
    u8 i;
    gGameStageTask = TaskCreate(Task_GameStage, 0, 0xff00, 0, TaskDestructor_GameStage);
    gActiveCollectRingEffectCount = 0;
    gSpecialRingCount = 0;
    gUnknown_030054B0 = 0;

    gStageFlags |= (STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__ACT_START);
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

    gBossRingsShallRespawn = FALSE;
    gBossRingsRespawnCount = BOSS_RINGS_DEFAULT_RESPAWN_COUNT;
    gUnknown_030055BC = 0;

    sub_801F044();
    gUnknown_030053E0 = 0;

    if (!IS_EXTRA_STAGE(gCurrentLevel)) {
        CreatePlayer(gSelectedCharacter, gCurrentLevel, &gPlayer);
    }
#ifndef COLLECT_RINGS_ROM
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        gBossCameraClampYLower = gBossCameraYClamps[LEVEL_TO_ZONE(gCurrentLevel)][0];
        gBossCameraClampYUpper = gBossCameraYClamps[LEVEL_TO_ZONE(gCurrentLevel)][1];

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
            CreateBossRunManager(gBossIndex);
        }

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            SuperSonicInit();
            gBossCameraClampYLower = gBossCameraYClamps[ZONE_FINAL + 1][0];
            gBossCameraClampYUpper = gBossCameraYClamps[ZONE_FINAL + 1][1];
        }
    }
#endif

#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateStageMusicManager();
        SetupStageIntro();
        InitCamera(gCurrentLevel);
        sStageInitProcs[gCurrentLevel]();
    } else
#endif
    {
        InitCamera(0);
        StageInit_CollectRings();
        CreateCollectRingsTimeDisplay();
        gPlayer.moveState &= ~(MOVESTATE_IA_OVERRIDE | MOVESTATE_IGNORE_INPUT);
        gStageFlags &= ~STAGE_FLAG__ACT_START;
    }

#ifndef COLLECT_RINGS_ROM
    if (gCurrentLevel != LEVEL_INDEX(ZONE_1, ACT_1)) {
        CreateStageWaterTask(-1, 0, 0);
    }
#endif

    gStageFlags &= ~STAGE_FLAG__2;
    gStageFlags &= ~STAGE_FLAG__TIMER_REVERSED;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
    }

    CreateStageRingsManager();
    CreateStageEntitiesManager();

    gUnknown_03001944 = 0;
    gUnknown_030017F0 = 0x100;
    gUnknown_03005394 = 0x100;
    gUnknown_03002A8C = 0x78;
    gUnknown_03004D58 = 0x50;
    gUnknown_0300194C = 0x78;
    gUnknown_03002820 = 0x50;
    gUnknown_03005398 = 0x80;

    if (IS_MULTI_PLAYER) {
        CreateMultiplayerReceiveEventMgr();
        CreateMultiplayerSendEventMgr();

        gRandomItemBox = 0;

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            gMultiplayerCharRings[i] = 0;

            if (GetBit(gMultiplayerConnections, i)) {
                CreateMultiplayerPlayer(i);
                if (i != SIO_MULTI_CNT->id) {
                    CreateOpponentPositionIndicator(i);
                } else {
                    CreateSelfPositionIndicator();
                }
            }

            gUnknown_030054B4[i] = -1;
            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                gMultiplayerCharacters[i] = i;
            }
        }

        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
        }
    }
#ifndef COLLECT_RINGS_ROM
    else {
        for (i = 0; i < 4; i++) {
            gUnknown_030054B4[i] = -1;
        }
    }

    gCheese = NULL;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateCheese(&gPlayer);
    }

    if (IS_MULTI_PLAYER && gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateRaceProgressIndicator();
    }
#endif
}

#ifndef COLLECT_RINGS_ROM
void Task_GameStage(void)
{
    u16 sioId = SIO_MULTI_CNT->id;
    u32 timeStep;

    if (IS_SINGLE_PLAYER) {
        if (!(gStageFlags & STAGE_FLAG__DISABLE_PAUSE_MENU) && (gPressedKeys & START_BUTTON) && !(gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
            CreatePauseMenu();
        }
        gStageTime++;
        timeStep = 1;
    } else {
        u32 framesSinceStageStart = (gFrameCount - gMPStageStartFrameCount);
        timeStep = framesSinceStageStart - gStageTime;
        gStageTime = framesSinceStageStart;

        if (GAME_MODE_REQUIRES_ITEM_RNG) {
            if ((framesSinceStageStart & ~(0x1FF)) != ((framesSinceStageStart - timeStep) & ~(0x1FF))) {
                u32 mask, rand;
                u32 temp = MultiplayerPseudoRandom32();

                if ((framesSinceStageStart & ~(0xFFF)) != ((framesSinceStageStart - timeStep) & ~(0xFFF))) {
                    u32 value = (gRandomItemBox >> 4) + 1;
                    gRandomItemBox = ((gRandomItemBox & 0xF) | (value * 16));
                }
                rand = gMultiplayerPseudoRandom;
                mask = 7;
                gRandomItemBox = (gRandomItemBox & 0xF8) | (rand & mask);
            }

        } else if ((framesSinceStageStart & ~(0x3F)) != ((framesSinceStageStart - timeStep) & ~(0x3F))) {
            u32 temp = MultiplayerPseudoRandom32();
        }

#if (GAME == GAME_SA1)
        if (gCamera.sa2__unk50 & CAM_MODE_SPECTATOR)
#elif (GAME == GAME_SA2)
        if (gCamera.unk50 & CAM_MODE_SPECTATOR)
#endif
        {

            if ((gInput & (L_BUTTON | R_BUTTON)) == (L_BUTTON | R_BUTTON)) {
                if (sioId != 3) {
                    gCamera.spectatorTarget = 3;
                } else {
                    gCamera.spectatorTarget = 2;
                }
            } else if (gInput & L_BUTTON) {
                if (sioId == 0) {
                    gCamera.spectatorTarget = 1;
                } else {
                    gCamera.spectatorTarget = 0;
                }
            } else if (gInput & R_BUTTON) {
                if (sioId < 2) {
                    gCamera.spectatorTarget = 2;
                } else {
                    gCamera.spectatorTarget = 1;
                }
            } else {
                gCamera.spectatorTarget = sioId;
            }
        } else {
            gCamera.spectatorTarget = sioId;
        }

        // If player is not connected, switch back to our player
        if (!GetBit(gMultiplayerConnections, gCamera.spectatorTarget)) {
            gCamera.spectatorTarget = sioId;
        }

#if (GAME == GAME_SA1)
        if (sa2__gUnknown_030053E0 > 0) {
            sa2__gUnknown_030053E0--;
        }
#elif (GAME == GAME_SA2)
        if (gUnknown_030053E0 > 0) {
            gUnknown_030053E0--;
        }
#endif
    }

#if (GAME == GAME_SA1)
    sa2__gUnknown_0300544C = gStageFlags;
#elif (GAME == GAME_SA2)
    gUnknown_0300544C = gStageFlags;
#endif

    if (gStageFlags & STAGE_FLAG__ACT_START) {
        return;
    }

    gCheckpointTime += timeStep;

    if (gStageFlags & STAGE_FLAG__TIMER_REVERSED) {
        gCourseTime -= timeStep;
        if ((s32)gCourseTime > 0) {
            return;
        }

        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;

#if (GAME == GAME_SA1)
            if (gLoadedSaveGame.timeLimitDisabled) {
                return;
            }
#elif (GAME == GAME_SA2)
            if (gLoadedSaveGame->timeLimitDisabled) {
                return;
            }
#endif

            gPlayer.itemEffect = 0;

            if (gPlayer.moveState & MOVESTATE_IN_WATER) {
                gPlayer.qSpeedAirY = -Q(2.625);
            } else {
                gPlayer.qSpeedAirY = -Q(4.875);
            }

#if (GAME == GAME_SA1)
            if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1))
#elif (GAME == GAME_SA2)
            if (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_BOSS))
#endif
            {
                CreateScreenShake(0x800, 8, 16, -1, (SCREENSHAKE_VERTICAL | SCREENSHAKE_HORIZONTAL | SCREENSHAKE_RANDOM_VALUE));
            }
            gPlayer.moveState |= MOVESTATE_DEAD;
            m4aSongNumStart(SE_TIME_UP);
        } else {
            gStageFlags |= STAGE_FLAG__ACT_START;
#if (GAME == GAME_SA1)
            sa2__CreateMultiplayerFinishHandler();
#elif (GAME == GAME_SA2)
            CreateMultiplayerFinishHandler();
#endif
        }
    } else {
        gCourseTime += timeStep;
        if (gCourseTime <= MAX_COURSE_TIME) {
            return;
        }

        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;

#if (GAME == GAME_SA1)
            if (gLoadedSaveGame.timeLimitDisabled && (gGameMode == GAME_MODE_SINGLE_PLAYER || IS_MULTI_PLAYER)) {
                return;
            }
#elif (GAME == GAME_SA2)
            if (gLoadedSaveGame->timeLimitDisabled && (gGameMode == GAME_MODE_SINGLE_PLAYER || IS_MULTI_PLAYER)) {
                return;
            }
#endif

            gPlayer.itemEffect = 0;

            if (gPlayer.moveState & MOVESTATE_IN_WATER) {
                gPlayer.qSpeedAirY = -Q(2.625);
            } else {
                gPlayer.qSpeedAirY = -Q(4.875);
            }
            gPlayer.moveState |= MOVESTATE_DEAD;
            m4aSongNumStart(SE_TIME_UP);
        } else {
            gStageFlags |= STAGE_FLAG__ACT_START;
#if (GAME == GAME_SA1)
            sa2__CreateMultiplayerFinishHandler();
#elif (GAME == GAME_SA2)
            CreateMultiplayerFinishHandler();
#endif
        }
    }
}

void HandleLifeLost(void)
{
    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

    if (GAME_MODE_IS_TIME_ATTACK) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();

        SA2_LABEL(gUnknown_03005390) = 0;

        PAUSE_GRAPHICS_QUEUE();
        CreateTimeAttackLobbyScreen();
#if (GAME == GAME_SA2)
        gNumLives = 2;
#endif
        return;
    } else {
#if (GAME == GAME_SA1)
        if (IS_SINGLE_PLAYER && (--gNumLives == 0))
#elif (GAME == GAME_SA2)
        if (--gNumLives == 0)
#endif
        {
            gStageFlags |= STAGE_FLAG__ACT_START;

#if (GAME == GAME_SA1)
            if (SA2_LABEL(gUnknown_0300543C) > 0) {
                SA2_LABEL(gUnknown_0300543C)--;
                CreateGameOverScreen(OVER_CAUSE_ZERO_LIVES);
            } else {
                CreateGameOverScreen(OVER_CAUSE_TIME_UP);
            }
#else
            CreateGameOverScreen(OVER_CAUSE_ZERO_LIVES);
#endif
        } else {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();

            SA2_LABEL(gUnknown_03005390) = 0;

            PAUSE_GRAPHICS_QUEUE();
            CreateGameStage();
        }
    }
}

// NOTE: It's kind of redundant to check whether we are in Zone 5's boss stage
//       on every single stage init. (for changing music to Knuckles' fight BGM)
//
//       But maybe it doesn't matter as it's only called once per stage start.
static inline void StageInit_SetMusic_inline(u16 level)
{
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == CHARACTER_SONIC && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel
            && gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_BOSS)) {
            gMusicManagerState.unk1 = 0x10 | 0xE;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void StageInit_Zone1Act1(void)
{
    CreateStageWaterTask(0x830, 0x7F207F20, 0);
    CreatePaletteLoaderTask(0x2000, 897, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone3Act1(void)
{
    CreatePaletteLoaderTask(0x2000, 900, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 2, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone3Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 900, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 2, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone4Act1(void)
{
    CreatePaletteLoaderTask(0x2000, 906, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 901, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone4Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 906, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 901, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone6Act1(void)
{
    CreatePaletteLoaderTask(0x2000, 940, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 3, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 4, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 5, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 6, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 7, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 8, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 9, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 11, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone6Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 940, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 3, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 4, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 5, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 6, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 7, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 8, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 9, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 11, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone7Act1(void)
{
    CreatePaletteLoaderTask(0x2000, 941, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 942, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 943, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 944, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 945, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 946, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone7Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 941, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 942, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 943, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 944, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 945, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 946, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone7ActBoss(void)
{
    CreatePaletteLoaderTask(0x2000, 941, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 942, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 943, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 944, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 945, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 946, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void DestroyStageTasks(void)
{
    TaskDestroy(gGameStageTask);
    gGameStageTask = NULL;
    DestroyPlayerTasks(&gPlayer);

#if (GAME == GAME_SA1)
    if (IS_SINGLE_PLAYER) {
        DestroyPlayerTasks(&gPartner);
    }
#endif

    DestroyCameraMovementTask();
}

void HandleDeath(void)
{
    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateTimeAttackLobbyScreen();
        gNumLives = 2;
        return;
    }

    if (--gNumLives == 0) {
        CreateGameOverScreen(OVER_CAUSE_ZERO_LIVES);
    } else {
        CreateGameOverScreen(OVER_CAUSE_TIME_UP);
    }
}

// Unused.
// Leftover from SA1, but smaller than in there.
void GoToNextLevel(void)
{
    u16 irqEnable, irqMasterEnable, dispStat;

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    SA2_LABEL(gUnknown_03005390) = 0;
    PAUSE_GRAPHICS_QUEUE();

#if (GAME == GAME_SA1)
    m4aMPlayAllStop();
    m4aSoundVSyncOff();

    gFlags |= FLAGS_8000;
    irqEnable = REG_IE;
    irqMasterEnable = REG_IME;
    dispStat = REG_DISPSTAT;

    REG_IE = 0;
    REG_IE;
    REG_IME = 0;
    REG_IME;
    REG_DISPSTAT = 0;
    REG_DISPSTAT;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

    SlowDmaStop(0);
    SlowDmaStop(1);
    SlowDmaStop(2);
    SlowDmaStop(3);
#endif

    WriteSaveGame();

#if (GAME == GAME_SA1)
    REG_IE = irqEnable;
    REG_IE;
    REG_IME = irqMasterEnable;
    REG_IME;
    REG_DISPSTAT = dispStat;
    REG_DISPSTAT;

    m4aSoundVSyncOn();

    gFlags &= ~FLAGS_8000;
#endif

#if (GAME == GAME_SA1)
    if (gGameMode != GAME_MODE_TIME_ATTACK)
#elif (GAME == GAME_SA2)
    if (gGameMode == GAME_MODE_SINGLE_PLAYER)
#endif
    {
        if (++gCurrentLevel < NUM_LEVEL_IDS) {
            GameStageStart();
        }
    }
#if (GAME == GAME_SA1)
    else {
        CreateTimeAttackLobbyScreen();
    }
#endif
}

void TaskDestructor_GameStage(struct Task *t)
{
#if (GAME == GAME_SA1)
    if ((gGameMode == GAME_MODE_TIME_ATTACK || (gGameMode == GAME_MODE_RACE) || (gGameMode == GAME_MODE_MULTI_PLAYER))
        || (gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        gLoadedSaveGame.difficultyLevel = gDifficultyLevel;
    }
#endif
    gGameStageTask = NULL;
    m4aMPlayAllStop();
}

void StageInit_Zone1Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 897, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone1ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone2Act1(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone2Act2(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone2ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone3ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone4ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone5Act1(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone5Act2(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone5ActBoss(void)
{
    CreatePaletteLoaderTask(0x2000, 686, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_Zone6ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_ZoneFinalActXX(void)
{
    CreatePaletteLoaderTask(0x2000, 686, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}

void StageInit_ZoneFinalActTA53(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_MultiplayerSinglePak(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_31(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_32(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_33(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Dummy(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_CollectRings(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_SetMusic(u16 level) { StageInit_SetMusic_inline(level); }
#endif
