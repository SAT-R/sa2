

#ifndef GUARD_MULTIPLAYER_EVENT_MGR_H
#define GUARD_MULTIPLAYER_EVENT_MGR_H

#include "global.h"
#include "core.h" // for MultiSioData

#include "game/sa1_sa2_shared/globals.h"

void RecieveRoomEvent_PlatformChange(union MultiSioData *, u8);
void RecieveRoomEvent_ItemBoxBreak(union MultiSioData *, u8);
void RecieveRoomEvent_EnemyDestroyed(union MultiSioData *, u8);
void RecieveRoomEvent_PlayerRingLoss(union MultiSioData *, u8);
void RecieveRoomEvent_MysterItemBoxBreak(union MultiSioData *, u8);
void RecieveRoomEvent_Unknown(union MultiSioData *, u8);

// Creates and sends a room event for multiplayer
struct RoomEvent *CreateRoomEvent(void);

#endif // GUARD_MULTIPLAYER_EVENT_MGR_H
