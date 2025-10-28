

#ifndef GUARD_MULTIPLAYER_EVENT_MGR_H
#define GUARD_MULTIPLAYER_EVENT_MGR_H

#include "global.h"
#include "core.h" // for MultiSioData

#include "game/sa1_sa2_shared/globals.h"

// RoomEvent types
#define ROOMEVENT_TYPE_NONE                  0
#define ROOMEVENT_TYPE_PLATFORM_CHANGE       1
#define ROOMEVENT_TYPE_ITEMBOX_BREAK         2
#define ROOMEVENT_TYPE_ENEMY_DESTROYED       3
#define ROOMEVENT_TYPE_PLAYER_RING_LOSS      4
#define ROOMEVENT_TYPE_MYSTERY_ITEMBOX_BREAK 5
#define ROOMEVENT_TYPE_ITEMEFFECT_APPLIED    6
#define ROOMEVENT_TYPE_REACHED_STAGE_GOAL    7
#define ROOMEVENT_TYPE_UNKNOWN               8

// RoomEvent variable structs
typedef struct {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
    u8 action;
} RoomEvent_PlatformChange;

typedef struct {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
} RoomEvent_ItemBoxBreak;

typedef struct {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
} RoomEvent_EnemyDestroy;

typedef struct {
    ROOMEVENT_BASE;

    u8 ringCount;
} RoomEvent_RingLoss;

typedef struct {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
    u8 unk4;
} RoomEvent_MysteryItemBoxBreak;

typedef struct {
    ROOMEVENT_BASE;
    u8 x;
    u8 y;
} RoomEvent_GoalReached;

typedef struct {
    ROOMEVENT_BASE;
    u8 effect;
    u8 targetPlayer;
} RoomEvent_ItemEffect;

typedef struct {
    ROOMEVENT_BASE;
    u8 unk1;
    u8 unk2;
} RoomEvent_Unknown;

struct Task *CreateMultiplayerReceiveEventMgr(void);
struct Task *CreateMultiplayerSendEventMgr(void);

void ReceiveRoomEvent_PlatformChange(union MultiSioData *, u8);
void ReceiveRoomEvent_ItemBoxBreak(union MultiSioData *, u8);
void ReceiveRoomEvent_EnemyDestroyed(union MultiSioData *, u8);
void ReceiveRoomEvent_PlayerRingLoss(union MultiSioData *, u8);
void ReceiveRoomEvent_MysteryItemBoxBreak(union MultiSioData *, u8);
void ReceiveRoomEvent_Unknown(union MultiSioData *, u8);

// Creates and sends a room event for multiplayer
void *CreateRoomEvent(void);

#endif // GUARD_MULTIPLAYER_EVENT_MGR_H
