#include "global.h"
#include "core.h"
#include "sprite.h"

#include "lib/m4a/m4a.h"

#include "game/globals.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/music_manager.h"
#include "game/shared/stage/palette_loader.h"
#include "game/shared/stage/pause_menu.h"
#include "game/shared/stage/rings_manager.h"

#include "game/shared/stage/screen_shake.h"
#include "game/shared/stage/stage.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"

#include "game/shared/stage/mp_finish.h"
#include "game/shared/stage/mp_indicators.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/spot_lights_manager.h"

#if (GAME == GAME_SA1)
#include "game/sa1/save.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/ui/time_attack_lobby.h"
#include "game/sa1/ui/time_over.h"
#include "game/sa1/stage/mp_chao.h"
#include "game/sa1/stage/player_controls.h"
#include "game/sa1/parameters/stage.h"

#include "constants/sa1/characters.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/save.h"
#include "game/sa2/ui/game_over.h"
#include "game/sa2/ui/time_attack_lobby.h"
#include "game/sa2/stage/cheese.h"
#include "game/sa2/stage/player_controls.h"
#include "game/sa2/stage/player_super_sonic.h"
#include "game/sa2/stage/race_progress.h"
#include "game/sa2/collect_rings/time_display.h"

#include "constants/sa2/animations.h"
#include "constants/sa2/characters.h"
#include "constants/sa2/songs.h"
#include "constants/sa2/zones.h"
#endif

#define BOSS_RINGS_DEFAULT_RESPAWN_COUNT 10

struct Task *gGameStageTask = NULL;

void Task_GameStage(void);
void TaskDestructor_GameStage(struct Task *t);
void StageInit_CollectRings(void);

extern void CreateStageWaterTask(s32 waterLevel, u32 p1, u32 mask);
#if (GAME == GAME_SA1)
extern struct Task *CreateMultiplayerChao(u8, u8);
extern struct Task *sub_80550F8(void);
// stage_ui_z.c
typedef struct Struct_sub_80550F8 {
    u8 filler0[0x27];
    bool8 screenBlank;
} Struct_sub_80550F8; /* size: 0x28 */
extern void CreateChaoHuntHUD();

void StageInit_Zone1Act1(void);
void StageInit_Zone1Act2(void);
void StageInit_Zone2Act1(void);
void StageInit_Zone2Act2(void);
void StageInit_Zone3Act1(void);
void StageInit_Zone3Act2(void);
void StageInit_Zone4Act1(void);
void StageInit_Zone4Act2(void);
void StageInit_Zone5Act1(void);
void StageInit_Zone5Act2(void);
void StageInit_Zone6Act1(void);
void StageInit_Zone6Act2(void);
void StageInit_Zone7Act1(void);
void StageInit_Zone7Act2(void);
void StageInit_ForestChaoGarden(void);
void StageInit_FactoryChaoGarden(void);
void StageInit_PinballChaoGarden(void);
void StageInit_SpaceChaoGarden(void);

const VoidFn sStageInitProcs[NUM_LEVEL_IDS] = {
    StageInit_Zone1Act1,         StageInit_Zone1Act2, //
    StageInit_Zone2Act1,         StageInit_Zone2Act2, //
    StageInit_Zone3Act1,         StageInit_Zone3Act2, //
    StageInit_Zone4Act1,         StageInit_Zone4Act2, //
    StageInit_Zone5Act1,         StageInit_Zone5Act2, //
    StageInit_Zone6Act1,         StageInit_Zone6Act2, //
    StageInit_Zone7Act1,         StageInit_Zone7Act2, //
    StageInit_ForestChaoGarden,  StageInit_FactoryChaoGarden, //
    StageInit_PinballChaoGarden, StageInit_SpaceChaoGarden,
};
#elif (GAME == GAME_SA2)
// TODO: stage_intro.h
extern void SetupStageIntro(void);
// TODO: in boss run header
extern void CreateBossRunManager(u8);

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
#endif

#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA2)
void ApplyGameStageSettings(void)
{
    gLevelScore = 0;
    gFinalBossActive = FALSE;
    gNumLives = 3;

    if (IS_MULTI_PLAYER) {
        gNumLives = 1;
    }

    if ((gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK || gGameMode == GAME_MODE_MULTI_PLAYER
         || gGameMode == GAME_MODE_TEAM_PLAY)
        || (gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        gDifficultyLevel = DIFFICULTY_NORMAL;
    } else {
        gDifficultyLevel = LOADED_SAVE->difficultyLevel;
    }

    if ((gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        SetPlayerControls(A_BUTTON, B_BUTTON, R_BUTTON);
    } else {
        SetPlayerControls(LOADED_SAVE->buttonConfig.jump, LOADED_SAVE->buttonConfig.attack, LOADED_SAVE->buttonConfig.trick);
    }
}
#endif

void GameStageStart(void)
{
    gTrappedAnimalVariant = 0;
    gBossIndex = 0;
    gRingCount = 0;
    gNumSingleplayerCharacters = 1;

#if (GAME == GAME_SA1)
    if (IS_MULTI_PLAYER) {
        CallSetStageSpawnPos(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
    } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
        CallSetStageSpawnPos(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
    } else
#endif
    {
        if (!IS_EXTRA_STAGE(gCurrentLevel)) {
            CallSetStageSpawnPos(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);

#if (GAME == GAME_SA1)
            if (gTailsEnabled && (gSelectedCharacter == CHARACTER_SONIC)) {
                gNumSingleplayerCharacters = 2;
                CallSetStageSpawnPos(CHARACTER_TAILS, gCurrentLevel, 1, &gPartner);
            }
#elif (GAME == GAME_SA2)
            gCheese = NULL;
#endif
        }
    }

    gStageTime = 0;
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

    if (IS_MULTI_PLAYER) {
        gMPStageStartFrameCount = gFrameCount;
    }

    gCheckpointTime = TIME(0, 0);

#if (GAME == GAME_SA1)
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (gGameMode == GAME_MODE_CHAO_HUNT)) {
        gCourseTime = TIME(3, 0);
    } else if (gGameMode == GAME_MODE_TEAM_PLAY) {
        gCourseTime = TIME(5, 0);
    } else {
        gCourseTime = TIME(0, 0);
    }
#elif (GAME == GAME_SA2)
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gCourseTime = TIME(0, 0);
    } else {
        gCourseTime = TIME(3, 0);
    }
#endif

    CreateGameStage();
}
#endif

void CreateGameStage(void)
{
    u8 i;
    u32 j;
#if (GAME == GAME_SA1)
    struct Task *someTask;
#ifdef BUG_FIX
    someTask = NULL;
#endif
#endif
    gGameStageTask = TaskCreate(Task_GameStage, 0, 0xff00, 0, TaskDestructor_GameStage);
    gActiveCollectRingEffectCount = 0;
#if (GAME == GAME_SA2)
    gSpecialRingCount = 0;
    gFinalBossActive = 0;
#endif

    gStageFlags |= (STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__ACT_START);
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

#if (GAME == GAME_SA2)
    gBossRingsShallRespawn = FALSE;
    gBossRingsRespawnCount = BOSS_RINGS_DEFAULT_RESPAWN_COUNT;
    gBoostEffectTasksCreated = 0;
#endif

    SA2_LABEL(sub_801F044)();

#if (GAME == GAME_SA1)
    CreateStageMusicManager();

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        someTask = sub_80550F8();
    }

    gSpikesUnknownTimer = 0;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateChaoHuntHUD();
    }

    if (IS_MULTI_PLAYER) {
        CreatePlayer(gSelectedCharacter, gCurrentLevel, &gPlayer);
    } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
        CreatePlayer(gSelectedCharacter, gCurrentLevel, &gPlayer);
    } else {
        CreatePlayer(gSelectedCharacter, gCurrentLevel, &gPlayer);

        if (gNumSingleplayerCharacters == 2) {
            CreatePlayer(PARTNER_CHARACTER, gCurrentLevel, &gPartner);
        }
    }

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        InitCamera(gCurrentLevel);
    } else {
        InitCamera(LEVEL_INDEX(ZONE_1, ACT_1));
    }

    gStageFlags &= ~STAGE_FLAG__2;
    gStageFlags &= ~STAGE_FLAG__TIMER_REVERSED;

    if ((gGameMode != GAME_MODE_SINGLE_PLAYER) && (gGameMode != GAME_MODE_TIME_ATTACK) && (gGameMode != GAME_MODE_RACE)
        && (gGameMode != GAME_MODE_MULTI_PLAYER)) {
        gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
    }

    CreateStageRingsManager();
    CreateStageEntitiesManager();

    if (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_4) {
        CreateStageWaterTask(-1, 0, 0);
    }

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        sStageInitProcs[gCurrentLevel]();

        if (gCurrentLevel == LEVEL_INDEX(ZONE_2, ACT_1)) {
            if (CreateSpotlightsManager()) {
#ifdef BUG_FIX
                if (someTask != NULL)
#endif
                {
                    Struct_sub_80550F8 *strc = TASK_DATA(someTask);
                    strc->screenBlank = 1;
                }
            }
        }
    } else {
        StageInit_CollectRings();
    }
#elif (GAME == GAME_SA2)
    gSpikesUnknownTimer = 0;

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
#endif

    gSpriteTransformRotation = 0;
    gSpriteTransformScaleX = 0x100;
    gSpriteTransformScaleY = 0x100;
    SA2_LABEL(gUnknown_03002A8C) = 0x78;
    SA2_LABEL(gUnknown_03004D58) = 0x50;
    gSpriteTransformX = 0x78;
    gSpriteTransformY = 0x50;
    gSpriteTransformScaleUnknown = 0x80;

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
                }
#if (GAME == GAME_SA2)
                else {
                    CreateSelfPositionIndicator();
                }
#endif
            }

            gMultiplayerRanks[i] = -1;

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                gMultiplayerCharacters[i] = i;
            }
        }

#if (GAME == GAME_SA1)
        if (gGameMode == GAME_MODE_CHAO_HUNT || gGameMode == GAME_MODE_TEAM_PLAY) {
            for (j = 0; j < ARRAY_COUNT(gChaoTasks); j++) {
                gChaoTasks[j] = CreateMultiplayerChao((u8)(uintptr_t)gChaoTasks[j], j);

                if (gGameMode == GAME_MODE_CHAO_HUNT) {
                    // TODO: This check does not make sense!
                    break;
                }
            }
        }
#endif

        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
        }
    }
#ifndef COLLECT_RINGS_ROM
    else {
        for (i = 0; i < 4; i++) {
            gMultiplayerRanks[i] = -1;
        }
    }

#if (GAME == GAME_SA2)
    gCheese = NULL;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateCheese(&gPlayer);
    }

    if (IS_MULTI_PLAYER && gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateRaceProgressIndicator();
    }
#endif
#endif
}

void Task_GameStage(void)
{
    u16 sioId = SIO_MULTI_CNT->id;
    u32 timeStep;
#ifndef COLLECT_RINGS_ROM
    if (IS_SINGLE_PLAYER) {
#if DEBUG
        if (gInput & SELECT_BUTTON) {
            const u32 initialCharacter = CHARACTER_TAILS;
            const bool32 allUnlocked = TRUE;
            TasksDestroyAll();
#if (GAME == GAME_SA1)
#include "game/sa1/ui/character_select.h"
            CreateCharacterSelectionScreen(initialCharacter);
#elif (GAME == GAME_SA2)
#include "game/sa2/ui/character_select.h"
            CreateCharacterSelectionScreen(initialCharacter, allUnlocked);
#endif
            return;
        }
#endif
        if (!(gStageFlags & STAGE_FLAG__DISABLE_PAUSE_MENU) && (gPressedKeys & START_BUTTON) && !(gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
            CreatePauseMenu();
        }
        gStageTime++;
        timeStep = 1;
    } else
#endif
    {
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

        if (gCamera.SA2_LABEL(unk50) & CAM_MODE_SPECTATOR) {

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
        if (!CONNECTION_REGISTERED(gCamera.spectatorTarget)) {
            gCamera.spectatorTarget = sioId;
        }

        if (gSpikesUnknownTimer > 0) {
            gSpikesUnknownTimer--;
        }
    }

    gPrevStageFlags = gStageFlags;

    if (gStageFlags & STAGE_FLAG__ACT_START) {
        return;
    }

    gCheckpointTime += timeStep;

    if (gStageFlags & STAGE_FLAG__TIMER_REVERSED) {
        gCourseTime -= timeStep;
        if ((s32)gCourseTime > 0) {
            return;
        }

#ifndef COLLECT_RINGS_ROM
        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;

            if (LOADED_SAVE->timeLimitDisabled) {
                return;
            }

            gPlayer.itemEffect = 0;

            if (gPlayer.moveState & MOVESTATE_IN_WATER) {
                gPlayer.qSpeedAirY = -Q(2.625);
            } else {
                gPlayer.qSpeedAirY = -Q(4.875);
            }

#if (GAME == GAME_SA1)
            if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1))
#elif (GAME == GAME_SA2)
            // NOTE(Jace):
            // I wonder if the level index was hardcoded in the original source?
            if (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_BOSS))
#endif
            {
                CreateScreenShake(0x800, 8, 16, -1, (SCREENSHAKE_VERTICAL | SCREENSHAKE_HORIZONTAL | SCREENSHAKE_RANDOM_VALUE));
            }
            gPlayer.moveState |= MOVESTATE_DEAD;
            m4aSongNumStart(SE_TIME_UP);
        }
#endif
        else {
            gStageFlags |= STAGE_FLAG__ACT_START;
            CreateMultiplayerFinishHandler();
        }
    }
#ifndef COLLECT_RINGS_ROM
    else {
        gCourseTime += timeStep;
        if (gCourseTime <= MAX_COURSE_TIME) {
            return;
        }

        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;

            if (LOADED_SAVE->timeLimitDisabled && (gGameMode == GAME_MODE_SINGLE_PLAYER || IS_MULTI_PLAYER)) {
                return;
            }

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
            CreateMultiplayerFinishHandler();
        }
    }
#endif
}

#if (GAME == GAME_SA2)
#if COLLECT_RINGS_ROM
void ApplyGameStageSettings(void)
{
    gLevelScore = 0;
    gFinalBossActive = FALSE;
    gNumLives = 3;

    if (IS_MULTI_PLAYER) {
        gNumLives = 1;
    }

    SetPlayerControls(A_BUTTON, B_BUTTON, R_BUTTON);
}

void GameStageStart(void)
{
    gTrappedAnimalVariant = 0;
    gBossIndex = 0;
    gRingCount = 0;

    // Unused leftover var from SA1, used for CPU "Partner" Tails
    gNumSingleplayerCharacters = 1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        CallSetStageSpawnPos(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
        // gCheese = NULL;
    }

    gStageTime = 0;
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;

    gMPStageStartFrameCount = gFrameCount;

    gCheckpointTime = TIME(0, 0);

    gCourseTime = TIME(3, 0);

    CreateGameStage();
}
#endif
#endif

#ifndef COLLECT_RINGS_ROM
void HandleLifeLost(void)
{
    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

    if (GAME_MODE_IS_TIME_ATTACK) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();

        gBgSpritesCount = 0;

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

            gBgSpritesCount = 0;

            PAUSE_GRAPHICS_QUEUE();
            CreateGameStage();
        }
    }
}
#endif

#if (GAME == GAME_SA1)
void HandleDeath(void)
{
    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

    if (GAME_MODE_IS_TIME_ATTACK) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();

        gBgSpritesCount = 0;

        PAUSE_GRAPHICS_QUEUE();
        CreateTimeAttackLobbyScreen();
    } else if (--gNumLives == 0) {
        if (SA2_LABEL(gUnknown_0300543C) > 0) {
            SA2_LABEL(gUnknown_0300543C)--;
            CreateGameOverScreen(OVER_CAUSE_ZERO_LIVES);
        } else {
            s32 score = (gLevelScore < LOADED_SAVE->unk420) ? LOADED_SAVE->unk420 : gLevelScore;

            LOADED_SAVE->unk420 = score;

            CreateGameOverScreen(OVER_CAUSE_TIME_UP);
        }
    } else {
        CreateTimeOver();
    }
}

void GoToNextLevel(void)
{
    u16 irqEnable, irqMasterEnable, dispStat;

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

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

    WriteSaveGame();

    REG_IE = irqEnable;
    REG_IE;
    REG_IME = irqMasterEnable;
    REG_IME;
    REG_DISPSTAT = dispStat;
    REG_DISPSTAT;

    m4aSoundVSyncOn();

    gFlags &= ~FLAGS_8000;

    if (gGameMode != GAME_MODE_TIME_ATTACK) {
        if (++gCurrentLevel < NUM_LEVEL_IDS) {
            GameStageStart();
        }
    } else {
        CreateTimeAttackLobbyScreen();
    }
}
#endif

#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA2)
// NOTE: It's kind of redundant to check whether we are in Zone 5's boss stage
//       on every single stage init. (for changing music to Knuckles' fight BGM)
//
//       But maybe it doesn't matter as it's only called once per stage start.
static inline void StageInit_SetMusic_inline(u16 level)
{
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == CHARACTER_SONIC && LOADED_SAVE->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel
            && gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_BOSS)) {
            gMusicManagerState.unk1 = 0x10 | 0xE;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}
#endif

#if (GAME == GAME_SA2)
void StageInit_Zone1Act1(void)
{
    CreateStageWaterTask(0x830, 0x7F207F20, 0);
    CreatePaletteLoaderTask(0x2000, 897, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}
#endif

void StageInit_Zone3Act1(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 816, 0, 0);
    CreatePaletteLoaderTask(0x2000, 817, 0, 0);
    CreatePaletteLoaderTask(0x2000, 818, 0, 0);
    CreatePaletteLoaderTask(0x2000, 824, 0, 0);
    CreatePaletteLoaderTask(0x2000, 825, 0, 0);
    CreatePaletteLoaderTask(0x2000, 827, 0, 0); // TODO/BUG?: Should this be 826?
    CreatePaletteLoaderTask(0x2000, 827, 0, 0);
    CreatePaletteLoaderTask(0x2000, 828, 0, 0);
    CreatePaletteLoaderTask(0x2000, 843, 0, 0);
    CreatePaletteLoaderTask(0x2000, 844, 0, 0);
    CreatePaletteLoaderTask(0x2000, 826, 0, 0); // Chao Stage removes this loader

    m4aSongNumStart(MUS_CASINO_PARADISE__ACT_1);
#elif (GAME == GAME_SA2)
    CreatePaletteLoaderTask(0x2000, 900, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 2, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

void StageInit_Zone3Act2(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 816, 0, 0);
    CreatePaletteLoaderTask(0x2000, 817, 0, 0);
    CreatePaletteLoaderTask(0x2000, 818, 0, 0);
    CreatePaletteLoaderTask(0x2000, 824, 0, 0);
    CreatePaletteLoaderTask(0x2000, 825, 0, 0);
    CreatePaletteLoaderTask(0x2000, 827, 0, 0); // TODO/BUG?: Should this be 826?
    CreatePaletteLoaderTask(0x2000, 827, 0, 0);
    CreatePaletteLoaderTask(0x2000, 828, 0, 0);
    CreatePaletteLoaderTask(0x2000, 843, 0, 0);
    CreatePaletteLoaderTask(0x2000, 844, 0, 0);
    CreatePaletteLoaderTask(0x2000, 826, 0, 0);

    m4aSongNumStart(MUS_CASINO_PARADISE__ACT_2);
#elif (GAME == GAME_SA2)
    CreatePaletteLoaderTask(0x2000, 900, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 2, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

#if (GAME == GAME_SA2)
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
#endif

void StageInit_Zone6Act1(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 839, 0, 0);
    CreatePaletteLoaderTask(0x2000, 840, 0, 0);
    CreatePaletteLoaderTask(0x2000, 841, 0, 0);
    CreatePaletteLoaderTask(0x2000, 842, 0, 0);

    m4aSongNumStart(MUS_EGG_ROCKET);

    if (gBossIndex > 0) {
        // This section only gets called after hitting a checkpoint!
        //
        // Rocket "started", so don't allow player to leave.
        gCamera.minX = EGG_ROCKET_LAUNCH_MIN_X;
        gCamera.SA2_LABEL(unk50) |= 0x8000;
        gBgCntRegs[3] &= ~(BGCNT_TXT512x512);

        if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
            gCourseTime = TIME(5, 0);
        }
    }

    if (gBossIndex > 1) {
        // Rocket booster removed
        //
        // 'maxY' set because we are "climbing" the rocket and positive Y goes down.
        gCamera.maxY = EGG_ROCKET_BOOSTER_DEPART_MAX_Y;
        gCamera.SA2_LABEL(unk50) |= 0x8000;
        gBgCntRegs[3] &= ~(BGCNT_TXT512x512);

        if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
            gCourseTime = TIME(5, 0);
        }
    }

    if (gBossIndex > 2) {
        gBgCntRegs[3] &= ~(BGCNT_TXT512x512);
        gCamera.SA2_LABEL(unk50) |= 0x4000;
        gCamera.SA2_LABEL(unk50) &= ~0x8000;
        gCamera.maxY = EGG_ROCKET_MIDDLE_DEPART_MAX_Y;

        if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
            gCourseTime = TIME(5, 0);
        }
    }
#elif (GAME == GAME_SA2)
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
#endif
}

#if (GAME == GAME_SA2)
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
#endif

#if (GAME == GAME_SA1)
void StageInit_PinballChaoGarden(void)
{
    CreatePaletteLoaderTask(0x2000, 816, 0, 0);
    CreatePaletteLoaderTask(0x2000, 817, 0, 0);
    CreatePaletteLoaderTask(0x2000, 818, 0, 0);
    CreatePaletteLoaderTask(0x2000, 824, 0, 0);
    CreatePaletteLoaderTask(0x2000, 825, 0, 0);
    CreatePaletteLoaderTask(0x2000, 827, 0, 0); // TODO/BUG?: Should this be 826?
    CreatePaletteLoaderTask(0x2000, 827, 0, 0);
    CreatePaletteLoaderTask(0x2000, 828, 0, 0);
    CreatePaletteLoaderTask(0x2000, 843, 0, 0);
    CreatePaletteLoaderTask(0x2000, 844, 0, 0);
    // Regular Casino Paradise loads palette anim 826 here.

    m4aSongNumStart(MUS_CASINO_PARADISE__ACT_1);
}
#endif
#endif

#if (GAME == GAME_SA1)
void ApplyGameStageSettingsAndStart(void)
{
    gLevelScore = 0;
    gNumLives = 3;
    gFinalBossActive = gCurrentLevel;

    if (IS_MULTI_PLAYER) {
        gNumLives = 1;
    }

    if ((gGameMode == GAME_MODE_TIME_ATTACK || (gGameMode == GAME_MODE_RACE) || (gGameMode == GAME_MODE_MULTI_PLAYER))
        || (gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        gDifficultyLevel = LOADED_SAVE->difficultyLevel;
        LOADED_SAVE->difficultyLevel = DIFFICULTY_NORMAL;
    }

    SetPlayerControls(LOADED_SAVE->btnConfig);
    GameStageStart();
}
#endif

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

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
void HandleDeath(void)
{
    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
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
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    WriteSaveGame();

    if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
        if (++gCurrentLevel < NUM_LEVEL_IDS) {
            GameStageStart();
        }
    }
}
#endif
#endif

void TaskDestructor_GameStage(struct Task *t)
{
#if (GAME == GAME_SA1)
    if ((gGameMode == GAME_MODE_TIME_ATTACK || (gGameMode == GAME_MODE_RACE) || (gGameMode == GAME_MODE_MULTI_PLAYER))
        || (gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
        LOADED_SAVE->difficultyLevel = gDifficultyLevel;
    }
#endif
    gGameStageTask = NULL;
#ifndef COLLECT_RINGS_ROM
    m4aMPlayAllStop();
#endif
}

#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA1)
void StageInit_Zone1Act1(void)
{
    CreatePaletteLoaderTask(0x2000, 814, 0, 0);
    CreatePaletteLoaderTask(0x2000, 815, 0, 0);

    m4aSongNumStart(MUS_NEO_GREEN_HILL__ACT_1);
}
#endif

void StageInit_Zone1Act2(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 814, 0, 0);
    CreatePaletteLoaderTask(0x2000, 815, 0, 0);
    CreatePaletteLoaderTask(0x2000, 820, 1, 0);
    CreatePaletteLoaderTask(0x2000, 820, 0, 0);

    if (IS_SINGLE_PLAYER) {
        gCamera.maxX = gRefCollision->pxWidth - 768;
    }

    m4aSongNumStart(MUS_NEO_GREEN_HILL__ACT_2);
#elif (GAME == GAME_SA2)
    CreatePaletteLoaderTask(0x2000, 897, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

#if (GAME == GAME_SA2)
void StageInit_Zone1ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }
#endif

void StageInit_Zone2Act1(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 819, 0, 0);
    CreatePaletteLoaderTask(0x2000, 845, 0, 0);
    CreatePaletteLoaderTask(0x2000, 849, 0, 0);

    m4aSongNumStart(MUS_SECRET_BASE__ACT_1);
#elif (GAME == GAME_SA2)
    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

void StageInit_Zone2Act2(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 819, 0, 0);
    CreatePaletteLoaderTask(0x2000, 845, 0, 0);
    CreatePaletteLoaderTask(0x2000, 849, 0, 0);

    m4aSongNumStart(MUS_SECRET_BASE__ACT_2);
#elif (GAME == GAME_SA2)
    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

#if (GAME == GAME_SA2)

void StageInit_Zone2ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }

void StageInit_Zone3ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }
#endif

#if (GAME == GAME_SA1)
void StageInit_Zone4Act1(void)
{
    CreatePaletteLoaderTask(0x2000, 822, 0, 0);
    CreatePaletteLoaderTask(0x2000, 821, 0, 0);
    CreateStageWaterTask(INITIAL_WATERLEVEL_ZONE_4_ACT_1, 0x7F207F20, 0);

    m4aSongNumStart(MUS_ICE_MOUNTAIN__ACT_1);
}

void StageInit_Zone4Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 822, 0, 0);
    CreatePaletteLoaderTask(0x2000, 821, 0, 0);
    CreateStageWaterTask(INITIAL_WATERLEVEL_ZONE_4_ACT_2, 0x7F207F20, 0);

    m4aSongNumStart(MUS_ICE_MOUNTAIN__ACT_2);
}
#endif

#if (GAME == GAME_SA2)
void StageInit_Zone4ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }
#endif

void StageInit_Zone5Act1(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 823, 0, 0);

    m4aSongNumStart(MUS_ANGEL_ISLAND__ACT_1);
#elif (GAME == GAME_SA2)
    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

void StageInit_Zone5Act2(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 823, 0, 0);

    m4aSongNumStart(MUS_ANGEL_ISLAND__ACT_2);
#elif (GAME == GAME_SA2)
    StageInit_SetMusic_inline(gCurrentLevel);
#endif
}

#if (GAME == GAME_SA2)
void StageInit_Zone5ActBoss(void)
{
    CreatePaletteLoaderTask(0x2000, 686, 0, NULL);

    StageInit_SetMusic_inline(gCurrentLevel);
}
#endif

#if (GAME == GAME_SA1)
void StageInit_Zone6Act2(void)
{
    CreatePaletteLoaderTask(0x2000, 829, 0, 0);
    CreatePaletteLoaderTask(0x2000, 830, 0, 0);
    CreatePaletteLoaderTask(0x2000, 831, 0, 0);
    CreatePaletteLoaderTask(0x2000, 850, 0, 0);
    CreatePaletteLoaderTask(0x2000, 851, 0, 0);
    CreatePaletteLoaderTask(0x2000, 848, 0, 0);
    CreatePaletteLoaderTask(0x2000, 846, 0, 0);
    CreatePaletteLoaderTask(0x2000, 847, 0, 0);

    m4aSongNumStart(MUS_COSMIC_ANGEL);
}
#endif

#if (GAME == GAME_SA2)
void StageInit_Zone6ActBoss(void) { StageInit_SetMusic_inline(gCurrentLevel); }
#endif

#if (GAME == GAME_SA1)
void StageInit_Zone7Act1(void) { m4aSongNumStart(MUS_X_ZONE); }

void StageInit_Zone7Act2(void) { m4aSongNumStart(MUS_EXTRA_BOSS); }
#endif

#if (GAME == GAME_SA2)
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
#endif

#if (GAME == GAME_SA1)
void StageInit_ForestChaoGarden(void)
{
    CreatePaletteLoaderTask(0x2000, 814, 0, 0);
    CreatePaletteLoaderTask(0x2000, 815, 0, 0);
    CreatePaletteLoaderTask(0x2000, 820, 1, 0);
    CreatePaletteLoaderTask(0x2000, 820, 0, 0);

    m4aSongNumStart(MUS_NEO_GREEN_HILL__ACT_1);
}

void StageInit_FactoryChaoGarden(void)
{
    CreatePaletteLoaderTask(0x2000, 819, 0, 0);
    CreatePaletteLoaderTask(0x2000, 845, 0, 0);
    CreatePaletteLoaderTask(0x2000, 849, 0, 0);

    m4aSongNumStart(MUS_SECRET_BASE__ACT_1);
}

void StageInit_SpaceChaoGarden(void)
{
    CreatePaletteLoaderTask(0x2000, 829, 0, 0);
    CreatePaletteLoaderTask(0x2000, 830, 0, 0);
    CreatePaletteLoaderTask(0x2000, 831, 0, 0);
    CreatePaletteLoaderTask(0x2000, 850, 0, 0);
    CreatePaletteLoaderTask(0x2000, 851, 0, 0);
    CreatePaletteLoaderTask(0x2000, 848, 0, 0);
    CreatePaletteLoaderTask(0x2000, 846, 0, 0);
    CreatePaletteLoaderTask(0x2000, 847, 0, 0);

    m4aSongNumStart(MUS_COSMIC_ANGEL);
}
#endif
#endif

void StageInit_CollectRings(void)
{
#if (GAME == GAME_SA1)
    CreatePaletteLoaderTask(0x2000, 814, 0, 0);
    CreatePaletteLoaderTask(0x2000, 815, 0, 0);
    CreatePaletteLoaderTask(0x2000, 820, 1, 0);
    CreatePaletteLoaderTask(0x2000, 820, 0, 0);

    m4aSongNumStart(MUS_VS_RING_RUSH_MODE);
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    StageInit_SetMusic_inline(gCurrentLevel);
#else
    m4aSongNumStart(MUS_VS_2);
#endif
#endif
}

#if (GAME == GAME_SA2)
#if COLLECT_RINGS_ROM
// ??
void StageInit_CollectRingsRom(void) { m4aSongNumStart(MUS_VS_2); }
#endif

#ifndef COLLECT_RINGS_ROM
void StageInit_SetMusic(u16 level) { StageInit_SetMusic_inline(level); }
#endif
#endif
