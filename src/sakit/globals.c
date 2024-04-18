#include "global.h"
#include "core.h"
#include "sakit/globals.h"

u8 gUnknown_030053E0 = 0;
u32 gCheckpointTime = 0;
u8 gMultiplayerCharRings[MULTI_SIO_PLAYERS_MAX] = {};
u8 gMultiplayerLanguage = 0;

u16 ALIGNED(4) gRingCount = 0;

#ifndef NON_MATCHING
u8 ALIGNED(4) unused53F4[24] = {};
#endif

u8 gActiveCollectRingEffectCount = 0;

u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX] = {};
u8 gUnknown_03005420 = 0;
u16 ALIGNED(4) gUnknown_03005424 = 0;
u8 ALIGNED(4) gUnknown_03005428[MULTI_SIO_PLAYERS_MAX] = {};

u8 gBossRingsRespawnCount = 0;
bool8 ALIGNED(4) gBossRingsShallRespawn = FALSE;

u32 gMultiplayerPseudoRandom = 0;
u8 gUnknown_03005438 = 0;
u8 ALIGNED(4) gUnknown_0300543C = 0;
u16 ALIGNED(4) gUnknown_03005440 = 0;
s8 ALIGNED(4) gTrappedAnimalVariant = 0;

u8 ALIGNED(4) gNumLives = 0;
u16 ALIGNED(4) gUnknown_0300544C = 0;
s32 gLevelScore = 0;

u16 ALIGNED(16) gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH] = {};
u32 gCourseTime = 0;

SomeStruct_3005498 ALIGNED(8) gUnknown_03005498 = {};
u32 sMPStageStartFrameCount = 0;
UNK_30054A8 ALIGNED(8) gUnknown_030054A8 = {};
u8 gUnknown_030054B0 = 0;
s8 ALIGNED(4) gUnknown_030054B4[MULTI_SIO_PLAYERS_MAX] = {};
u8 gUnknown_030054B8 = 0;
u16 ALIGNED(4) gUnknown_030054BC = 0;
Struct_30054C0 gUnknown_030054C0 = {};

u8 gDemoPlayCounter = 0;
u8 ALIGNED(4) gGameMode = 0;
s32 gStageGoalX = 0;

u8 gMultiplayerMissingHeartbeats[MULTI_SIO_PLAYERS_MAX] = {};
u8 gMultiplayerUnlockedLevels = 0;
struct Task *gEntitiesManagerTask = NULL;

s32 gUnknown_030054E0 = 0;
u8 gUnknown_030054E4 = 0;

u8 ALIGNED(4) gRandomItemBox = 0;
u8 ALIGNED(4) gDifficultyLevel = 0;

s8 ALIGNED(4) gSelectedCharacter = 0;
u8 ALIGNED(4) gSpecialRingCount = 0;

u8 ALIGNED(4) gUnknown_030054F8 = 0;
s32 gUnknown_030054FC = 0;

s8 gMultiplayerCharacters[4] = {};
struct UNK_3005510 ALIGNED(16) gUnknown_03005510[16] = {};
u32 gStageTime = 0;

u8 ALIGNED(4) gMultiplayerUnlockedCharacters = 0;
struct Task *ALIGNED(16) gMultiplayerPlayerTasks[MULTI_SIO_PLAYERS_MAX] = {};
u8 gUnknown_030055B0 = 0;

s8 ALIGNED(4) gCurrentLevel = 0;
u8 ALIGNED(4) gMultiplayerConnections = 0;

bool8 ALIGNED(4) gUnknown_030055BC = 0;

#ifndef NON_MATCHING
u32 unused_030055C0[4] = {};
#endif

// Maybe?
u8 gUnknown_030055D0[MULTI_SIO_PLAYERS_MAX] = {};
u8 gNewInputCountersIndex = 0;
u8 ALIGNED(4) gUnknown_030055D8 = 0;

// Fills available space, but size not yet confirmed
struct InputCounters ALIGNED(8) gNewInputCounters[32] = {};
