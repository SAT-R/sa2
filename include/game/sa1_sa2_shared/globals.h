#ifndef GUARD_SAKIT_GLOBALS_H
#define GUARD_SAKIT_GLOBALS_H

#include "multi_sio.h"
#include "core.h"

#define GAME_MODE_SINGLE_PLAYER 0
#define GAME_MODE_TIME_ATTACK   1

#define GAME_MODE_MULTI_PLAYER 3
#if (GAME == GAME_SA1)
#define GAME_MODE_RACE                       2
#define GAME_MODE_CHAO_HUNT                  4
#define GAME_MODE_TEAM_PLAY                  5
#define GAME_MODE_MULTI_PLAYER_COLLECT_RINGS 6
#elif (GAME == GAME_SA2)
#define GAME_MODE_BOSS_TIME_ATTACK           2
#define GAME_MODE_TEAM_PLAY                  4
#define GAME_MODE_MULTI_PLAYER_COLLECT_RINGS 5
#endif

// TODO: not verfied yet but all instances of this condition
// seem to be compiled out in collect rings
#ifndef COLLECT_RINGS_ROM
#define IS_COLLECT_RINGS_MINIGAME (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
#else
#define IS_COLLECT_RINGS_MINIGAME TRUE
#endif

// TODO: Improve this name; SA1 only?
#define IS_MP_OR_TEAM_PLAY ((gGameMode == GAME_MODE_MULTI_PLAYER) || (gGameMode == GAME_MODE_TEAM_PLAY))

#if (GAME == GAME_SA1)
#define IS_SINGLE_PLAYER ((gGameMode == GAME_MODE_SINGLE_PLAYER) || (gGameMode == GAME_MODE_TIME_ATTACK))
#elif (GAME == GAME_SA2)
#define IS_SINGLE_PLAYER                                                                                                                   \
    ((gGameMode == GAME_MODE_SINGLE_PLAYER) || (gGameMode == GAME_MODE_TIME_ATTACK) || (gGameMode == GAME_MODE_BOSS_TIME_ATTACK))
#endif

#if (GAME == GAME_SA1)
#define GAME_MODE_IS_TIME_ATTACK (gGameMode == GAME_MODE_TIME_ATTACK)
#elif (GAME == GAME_SA2)
#define GAME_MODE_IS_TIME_ATTACK (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK)
#endif

#if (GAME == GAME_SA1)
#define GAME_MODE_REQUIRES_ITEM_RNG                                                                                                        \
    ((gGameMode != GAME_MODE_SINGLE_PLAYER) && (gGameMode != GAME_MODE_TIME_ATTACK) && (gGameMode != GAME_MODE_RACE)                       \
     && (gGameMode != GAME_MODE_MULTI_PLAYER))
#elif (GAME == GAME_SA2)
#define GAME_MODE_REQUIRES_ITEM_RNG (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
#endif

#define IS_MULTI_PLAYER (!(IS_SINGLE_PLAYER))

#define STAGE_FLAG__CLEAR              0x0000
#define STAGE_FLAG__ACT_START          0x0001 // Turns timer off, likely other effects?
#define STAGE_FLAG__2                  0x0002
#define STAGE_FLAG__TIMER_REVERSED     0x0004 // Timer gets lower on every tick, and player loses life on 0:00:00.
#define STAGE_FLAG__10                 0x0010
#define STAGE_FLAG__DISABLE_PAUSE_MENU 0x0020
#define STAGE_FLAG__DEMO_RUNNING       0x0040 // TODO: Check accuracy of name
#define STAGE_FLAG__GRAVITY_INVERTED   0x0080
#define STAGE_FLAG__100                0x0100 // Set during stage's "loading screen"
#define STAGE_FLAG__TURN_OFF_TIMER     0x0200
#define STAGE_FLAG__TURN_OFF_HUD       0x0400

#define DIFFICULTY_NORMAL 0
#define DIFFICULTY_EASY   1

#define MAX_PLAYER_NAME_LENGTH 6

#define GRAVITY_IS_INVERTED (gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u16 fadeoutSpeed;
} MusicManagerState; /* size: 8 */

typedef struct {
    s32 squarePlayerDistance;
    u16 angle;
} HomingTarget;

// Common RoomEvent variables
#define ROOMEVENT_BASE u8 type

// RoomEvent opaque struct
// See 'multiplayer_event_mgr.h' for more information on this
typedef struct {
    ROOMEVENT_BASE;

    u8 opaque[7];
} RoomEvent; /* 0x8 */

#define CHEESE_DISTANCE_MAX 200
typedef struct {
    /* 0x00 */ s32 squarePlayerDistance;
    /* 0x04 */ struct Task *task;
} CheeseTarget; /* size: unknown (but >= 0x8?) */

// Incomplete
extern u8 gDemoPlayCounter;
extern u8 gGameMode;

extern s8 gCurrentLevel;
extern s8 gSelectedCharacter;
#if (GAME == GAME_SA1)
extern bool8 gTailsEnabled;
extern s8 gNumSingleplayerCharacters;
#endif

extern u8 gMultiplayerLanguage;

// Sometimes loaded as s16, but as u16 most of the time.
// If you encounter it being loaded as s16, please cast it.
extern u16 gRingCount;

extern MusicManagerState gMusicManagerState;

// Time that is being used to score the player (or in Time Attack)
extern u32 gCourseTime;

// Collected Special Rings in current stage?
extern u8 gSpecialRingCount;

// TODO: Types not checked yet!
extern s32 gWorldSpeedY;
extern s32 gWorldSpeedX;

extern u16 gBossCameraClampYLower;
extern u16 gBossCameraClampYUpper;
extern u8 gRandomItemBox;
extern u8 gSpikesUnknownTimer;

extern s8 gUnknown_0300543C;
extern struct Task *gEntitiesManagerTask;

extern u8 gDestroySpotlights;

extern u8 gRoomEventQueueSendPos;

// "Extra State" (see above #defines for states)
// TODO: Find better name. Put somewhere else?
extern u16 gStageFlags;
extern u16 gPrevStageFlags;

extern u8 gDifficultyLevel;

extern s8 gTrappedAnimalVariant;

extern u8 gBossIndex; // TODO: Boss ID in XX-Stage? But it's used in checkpointc.c ...
extern u8 gNumSingleplayerCharacters;

// Incremented by 1 every frame if the game is not paused.
// Starts before the stage-timer that is used for scores does.
extern u32 gStageTime;
extern u32 gMPStageStartFrameCount;

extern u32 gCheckpointTime; // Checkpoint timer?

extern u8 gRoomEventQueueWritePos;

extern u8 gBossRingsRespawnCount;
extern bool8 gBossRingsShallRespawn;
extern bool8 gBoostEffectTasksCreated;

extern struct Task *gMultiplayerPlayerTasks[4];
extern s8 gMultiplayerCharacters[4];
extern s8 gMultiplayerRanks[4];
extern u8 gOamMatrixIndex;

extern u8 gMultiplayerMissingHeartbeats[4];
extern u8 gActiveCollectRingEffectCount;

extern u8 gMultiplayerUnlockedCharacters;
extern u8 gMultiplayerUnlockedLevels;
extern u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX];
extern u16 gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH];

extern u32 gMultiplayerPseudoRandom;

extern s32 gLevelScore;
extern u8 gNumLives;
extern bool8 gFinalBossActive;

extern HomingTarget gHomingTarget;

extern u8 gMultiplayerConnections;

// Only set after the player passed it, used to determine extra score
extern s32 gStageGoalX;

extern u8 gMPRingCollectWins[4];
extern u8 gMultiplayerCharRings[MULTI_SIO_PLAYERS_MAX];

extern RoomEvent gRoomEventQueue[16];

extern CheeseTarget gCheeseTarget;

extern u8 gFrameInputsBuf[4];

#if 0
extern u8 gNewInputCountersIndex;
extern u8 gNewInputCounters[128];
#else

struct InputCounters {
    u8 unk0, unk1, unk2, unk3;
};

extern u8 gNewInputCountersIndex;
extern struct InputCounters gNewInputCounters[32];
#endif

extern u8 gFrameInputsBufIndex;

#if (GAME == GAME_SA1) && !defined(BUG_FIX)
#define LIVES_BOUND_CHECK_A(lives)            (lives)
#define LIVES_BOUND_CHECK_B(lives)            (lives)
#define NEW_LIVE_COUNT(_type, _varname, _inc) (gNumLives += 1)

#define BOUND_CHK_VARNAME gNumLives
#else
#define LIVES_BOUND_CHECK_A(lives)                                                                                                         \
    ({                                                                                                                                     \
        if ((lives) > 255)                                                                                                                 \
            (lives) = 255;                                                                                                                 \
        gNumLives = (lives);                                                                                                               \
    })

#define LIVES_BOUND_CHECK_B(lives)                                                                                                         \
    ({                                                                                                                                     \
        if (lives > 255) {                                                                                                                 \
            gNumLives = 255;                                                                                                               \
        } else {                                                                                                                           \
            gNumLives = lives;                                                                                                             \
        }                                                                                                                                  \
    })

#define NEW_LIVE_COUNT(_type, _varname, _inc)                                                                                              \
    _type _varname = divResA - divResB;                                                                                                    \
    _varname += _inc;

#define BOUND_CHK_VARNAME lives
#endif

#define INCREMENT_SCORE_BASE(_inc, restartMusic, BoundCheck)                                                                               \
    {                                                                                                                                      \
        s32 divResA, divResB;                                                                                                              \
        s32 oldScore = gLevelScore;                                                                                                        \
        gLevelScore += _inc;                                                                                                               \
                                                                                                                                           \
        divResA = Div(gLevelScore, 50000);                                                                                                 \
        divResB = Div(oldScore, 50000);                                                                                                    \
                                                                                                                                           \
        if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {                                                              \
            NEW_LIVE_COUNT(u16, BOUND_CHK_VARNAME, gNumLives);                                                                             \
            BoundCheck(BOUND_CHK_VARNAME);                                                                                                 \
                                                                                                                                           \
            if (restartMusic)                                                                                                              \
                gMusicManagerState.unk3 = 0x10 | 0x0;                                                                                      \
        }                                                                                                                                  \
    }

#define INCREMENT_SCORE_A(_inc) INCREMENT_SCORE_BASE(_inc, FALSE, LIVES_BOUND_CHECK_A)
#define INCREMENT_SCORE(_inc)   INCREMENT_SCORE_BASE(_inc, TRUE, LIVES_BOUND_CHECK_A)
#define INCREMENT_SCORE_B(_inc) INCREMENT_SCORE_BASE(_inc, TRUE, LIVES_BOUND_CHECK_B)

#define INCREMENT_RINGS(_inc)                                                                                                              \
    {                                                                                                                                      \
        s32 prevLives, newLives;                                                                                                           \
        u16 oldRings = gRingCount;                                                                                                         \
        gRingCount = oldRings + (_inc);                                                                                                    \
        if (!(IS_EXTRA_STAGE(gCurrentLevel))) {                                                                                            \
            newLives = Div(gRingCount, 100);                                                                                               \
            prevLives = Div(oldRings, 100);                                                                                                \
            if ((newLives != prevLives) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {                                                       \
                u16 lives = gNumLives + 1;                                                                                                 \
                gNumLives = LIVES_BOUND_CHECK_A(lives);                                                                                    \
                gMusicManagerState.unk3 = 0x10 | 0x0;                                                                                      \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#endif // GUARD_SAKIT_GLOBALS_H
