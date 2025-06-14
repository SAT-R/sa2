#include "global.h"
#include "core.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/multiplayer/multiplayer_event_mgr.h"

u8 gUnknown_030053E0 = 0;
u32 gCheckpointTime = 0;
u8 gMultiplayerCharRings[MULTI_SIO_PLAYERS_MAX] = {};
u8 gMultiplayerLanguage = 0;

u16 ALIGNED(4) gRingCount = 0;

#ifndef NON_MATCHING
u8 ALIGNED(4) unused53F4[24] = {};
#endif

u8 gActiveCollectRingEffectCount = 0;

#ifndef COLLECT_RINGS_ROM
u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX] = {};
#endif

u8 ALIGNED(4) gRoomEventQueueSendPos = 0;
u16 ALIGNED(4) gStageFlags = 0;
u8 ALIGNED(4) gMPRingCollectWins[MULTI_SIO_PLAYERS_MAX] = {};

#if COLLECT_RINGS_ROM
u8 unused0[4] = {};
#endif

u8 gBossRingsRespawnCount = 0;
bool8 ALIGNED(4) gBossRingsShallRespawn = FALSE;

u32 gMultiplayerPseudoRandom = 0;
u8 gRoomEventQueueWritePos = 0;
s8 ALIGNED(4) gUnknown_0300543C = 0;
u16 ALIGNED(4) gBossCameraClampYLower = 0;
s8 ALIGNED(4) gTrappedAnimalVariant = 0;

u8 ALIGNED(4) gNumLives = 0;
u16 ALIGNED(4) gUnknown_0300544C = 0;
s32 gLevelScore = 0;

#ifndef COLLECT_RINGS_ROM
u16 ALIGNED(16) gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH] = {};
#endif
u32 gCourseTime = 0;

CheeseTarget ALIGNED(8) gCheeseTarget = {};
u32 gMPStageStartFrameCount = 0;
MusicManagerState ALIGNED(8) gMusicManagerState = {};
u8 gUnknown_030054B0 = 0;
s8 ALIGNED(4) gUnknown_030054B4[MULTI_SIO_PLAYERS_MAX] = {};
u8 gUnknown_030054B8 = 0;
u16 ALIGNED(4) gBossCameraClampYUpper = 0;
HomingTarget gHomingTarget = {};

u8 gDemoPlayCounter = 0;
u8 ALIGNED(4) gGameMode = 0;
s32 gStageGoalX = 0;

u8 gMultiplayerMissingHeartbeats[MULTI_SIO_PLAYERS_MAX] = {};
u8 gMultiplayerUnlockedLevels = 0;
struct Task *gEntitiesManagerTask = NULL;

s32 gUnknown_030054E0 = 0;
u8 gDestroySpotlights = 0;

u8 ALIGNED(4) gRandomItemBox = 0;
u8 ALIGNED(4) gDifficultyLevel = 0;

s8 ALIGNED(4) gSelectedCharacter = 0;
u8 ALIGNED(4) gSpecialRingCount = 0;

u8 ALIGNED(4) gNumSingleplayerCharacters = 0;
s32 gUnknown_030054FC = 0;

s8 gMultiplayerCharacters[4] = {};
RoomEvent ALIGNED(16) gRoomEventQueue[16] = {};
u32 gStageTime = 0;

u8 ALIGNED(4) gMultiplayerUnlockedCharacters = 0;

#ifndef NON_MATCHING
struct Task *ALIGNED(16) gMultiplayerPlayerTasks[MULTI_SIO_PLAYERS_MAX] = {};
#else
struct Task *gMultiplayerPlayerTasks[MULTI_SIO_PLAYERS_MAX] = {};
#endif

u8 gBossIndex = 0;

s8 ALIGNED(4) gCurrentLevel = 0;
u8 ALIGNED(4) gMultiplayerConnections = 0;

#if COLLECT_RINGS_ROM
u8 unused1[4] = {};
#endif

bool8 ALIGNED(4) gUnknown_030055BC = 0;

#if COLLECT_RINGS_ROM
u8 unused2[8] = {};
#endif

#ifndef COLLECT_RINGS_ROM
#ifndef NON_MATCHING
u32 unused_030055C0[4] = {};
#endif

// Maybe?
u8 gFrameInputsBuf[4] = {};
u8 gNewInputCountersIndex = 0;
u8 ALIGNED(4) gFrameInputsBufIndex = 0;

// Fills available space, but size not yet confirmed
struct InputCounters ALIGNED(8) gNewInputCounters[32] = {};
#endif
