

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

// Common RoomEvent variables
#define ROOMEVENT_BASE u8 type

// RoomEvent opaque struct
struct RoomEvent {
    ROOMEVENT_BASE;

    u8 opaque[7];
}; /* 0x8 */

// RoomEvent variable structs
struct RoomEvent_PlatformChange {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
    u8 action;
} platformChange;

struct RoomEvent_ItemBoxBreak {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
} itemBoxBreak;

struct RoomEvent_EnemyDestroy {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
} enemyDestroy;

struct RoomEvent_RingLoss {
    ROOMEVENT_BASE;

    u8 ringCount;
};

struct RoomEvent_MysteryItemBoxBreak {
    ROOMEVENT_BASE;

    u8 x;
    u8 y;
    u8 id;
    u8 unk4;
};

struct RoomEvent_ItemEffect {
    ROOMEVENT_BASE;
    u8 effect;
    u8 targetPlayer;
};

struct RoomEvent_Unknown {
    ROOMEVENT_BASE;
    u8 unk1;
    u8 unk2;
};

extern u8 gRoomEventQueueSendPos;
extern u8 gRoomEventQueueWritePos;
extern struct RoomEvent gRoomEventQueue[16];

struct Task *CreateMultiplayerRecieveEventMgr(void);
struct Task *CreateMultiplayerSendEventMgr(void);

void RecieveRoomEvent_PlatformChange(union MultiSioData *, u8);
void RecieveRoomEvent_ItemBoxBreak(union MultiSioData *, u8);
void RecieveRoomEvent_EnemyDestroyed(union MultiSioData *, u8);
void RecieveRoomEvent_PlayerRingLoss(union MultiSioData *, u8);
void RecieveRoomEvent_MysterItemBoxBreak(union MultiSioData *, u8);
void RecieveRoomEvent_Unknown(union MultiSioData *, u8);

// Creates and sends a room event for multiplayer
struct RoomEvent *CreateRoomEvent(void);

#endif // GUARD_MULTIPLAYER_EVENT_MGR_H
