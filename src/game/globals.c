#include "global.h"
#include "core.h"
#include "game/globals.h"
#include "game/shared/stage/mp_event_mgr.h"

u8 gSpikesUnknownTimer = 0;
u32 gCheckpointTime = 0;
u8 gMultiplayerCharRings[MULTI_SIO_PLAYERS_MAX] = {};
#if (GAME == GAME_SA2)
u8 gMultiplayerLanguage = 0;
#endif

u16 ALIGNED(4) gRingCount = 0;
Task *ALIGNED(4) gChaoTasks[] = {};

#if (GAME == GAME_SA2)
#ifndef NON_MATCHING
u8 ALIGNED(4) unused5400[12] = {};
#endif
#endif

u8 ALIGNED(4) gActiveCollectRingEffectCount = 0;

#if (GAME == GAME_SA2) && !defined(COLLECT_RINGS_ROM)
u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX] = {};
#endif
u8 ALIGNED(4) gRoomEventQueueSendPos = 0;
u16 ALIGNED(4) gStageFlags = 0;
#if (GAME == GAME_SA1)
// TODO: Check type!
u8 ALIGNED(4) gUnknown_03005008[MULTI_SIO_PLAYERS_MAX] = {};
#endif
u8 ALIGNED(4) gMPRingCollectWins[MULTI_SIO_PLAYERS_MAX] = {};

#if (GAME == GAME_SA2) && COLLECT_RINGS_ROM
u8 unused0[4] = {};
#endif

#if (GAME == GAME_SA2)
u8 gBossRingsRespawnCount = 0;
bool8 ALIGNED(4) gBossRingsShallRespawn = FALSE;
#endif

u32 gMultiplayerPseudoRandom = 0;
u8 ALIGNED(4) gRoomEventQueueWritePos = 0;
s8 ALIGNED(4) SA2_LABEL(gUnknown_0300543C) = 0;
#if (GAME == GAME_SA2)
u16 ALIGNED(4) gBossCameraClampYLower = 0;
#endif
s8 ALIGNED(4) gTrappedAnimalVariant = 0;
#if (GAME == GAME_SA1)
u8 ALIGNED(4) gFinalBossActive = 0;
#endif

u8 ALIGNED(4) gNumLives = 0;
#if (GAME == GAME_SA1)
u16 ALIGNED(4) gUnknown_03005028 = 0; // Special Stage-related
#endif
u16 ALIGNED(4) gPrevStageFlags = 0;
s32 gLevelScore = 0;

#if (GAME == GAME_SA2) && !defined(COLLECT_RINGS_ROM)
u16 ALIGNED(16) gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH] = {};
#endif
u32 gCourseTime = 0;

#if (GAME == GAME_SA2)
CheeseTarget ALIGNED(8) gCheeseTarget = {};
#endif

u32 gMPStageStartFrameCount = 0;
MusicManagerState ALIGNED(8) gMusicManagerState = {};
#if (GAME == GAME_SA2)
bool8 gFinalBossActive = 0;
#endif
s8 ALIGNED(4) gMultiplayerRanks[MULTI_SIO_PLAYERS_MAX] = {};
u8 ALIGNED(4) gOamMatrixIndex = 0;

#if (GAME == GAME_SA1)
s8 ALIGNED(4) gTailsEnabled = 0;
#endif

#if (GAME == GAME_SA2)
u16 ALIGNED(4) gBossCameraClampYUpper = 0;
HomingTarget gHomingTarget = {};
#endif

u8 ALIGNED(4) gDemoPlayCounter = 0;

#if (GAME == GAME_SA1)
u16 ALIGNED(4) gSpecialStageReturnX = 0;
#endif

u8 ALIGNED(4) gGameMode = 0;

#if (GAME == GAME_SA2)
s32 ALIGNED(4) gStageGoalX = 0;
#endif

u8 ALIGNED(4) gMultiplayerMissingHeartbeats[MULTI_SIO_PLAYERS_MAX] = {};
#if (GAME == GAME_SA1)
u16 ALIGNED(4) gSpecialStageReturnY = 0;
#elif (GAME == GAME_SA2)
u8 ALIGNED(4) gMultiplayerUnlockedLevels = 0;
#endif
Task *ALIGNED(4) gEntitiesManagerTask = NULL;

#if (GAME == GAME_SA2)
s32 ALIGNED(4) gWorldSpeedY = 0;
#endif

u8 ALIGNED(4) gDestroySpotlights = 0;

#if (GAME == GAME_SA1)
u16 ALIGNED(4) gUnknown_03005070 = 0; // Used in Sp Stage
#endif

u8 ALIGNED(4) gRandomItemBox = 0;
#if (GAME == GAME_SA1)
u16 ALIGNED(4) gSpecialStageCollectedRings = 0;
u16 ALIGNED(4) gUnknown_0300507C = 0;
#endif
u8 ALIGNED(4) gDifficultyLevel = 0;

s8 ALIGNED(4) gSelectedCharacter = 0;

#if (GAME == GAME_SA1)
s8 ALIGNED(4) gNumSingleplayerCharacters = 0;
#endif
#if (GAME == GAME_SA2)
u8 ALIGNED(4) gSpecialRingCount = 0;
#endif
#if (GAME == GAME_SA1)
s8 ALIGNED(4) gUsedSaveSectorID = 0;
#endif

#if (GAME == GAME_SA2)
u8 ALIGNED(4) gNumSingleplayerCharacters = 0;
s32 ALIGNED(4) gWorldSpeedX = 0;
#endif

s8 ALIGNED(4) gMultiplayerCharacters[4] = {};
RoomEvent ALIGNED(16) gRoomEventQueue[16] = {};
u32 gStageTime = 0;

#if (GAME == GAME_SA1)
s8 ALIGNED(4) gMultiplayerCurrentLevel = 0;
#endif

#if (GAME == GAME_SA2)
u8 ALIGNED(4) gMultiplayerUnlockedCharacters = 0;
#endif

#ifndef NON_MATCHING
Task *ALIGNED(16) gMultiplayerPlayerTasks[MULTI_SIO_PLAYERS_MAX] = {};
#else
Task *ALIGNED(4) gMultiplayerPlayerTasks[MULTI_SIO_PLAYERS_MAX] = {};
#endif

#if (GAME == GAME_SA1)
u8 ALIGNED(4) gUnknown_03005140 = 0;
#endif

u8 ALIGNED(8) gBossIndex = 0;

s8 ALIGNED(4) gCurrentLevel = 0;
u8 ALIGNED(4) gMultiplayerConnections = 0;

#if (GAME == GAME_SA2) && COLLECT_RINGS_ROM
u8 unused1[4] = {};
#endif

#if (GAME == GAME_SA2)
bool8 ALIGNED(4) gBoostEffectTasksCreated = 0;

#if COLLECT_RINGS_ROM
u8 unused2[8] = {};
#endif
#endif
