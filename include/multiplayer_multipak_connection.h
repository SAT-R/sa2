#ifndef GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H
#define GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H

#include "global.h"
#include "game.h"
#include "multi_sio.h"

extern u8 gMultiplayerUnlockedCharacters;
extern u8 gMultiplayerConnections;
extern u8 gMultiplayerUnlockedLevels;

void StartMultiPakConnect(void);
void MultiPakCommunicationError(void);

// TOOD: MultiSioHeartBeat
#define MultiPakHeartbeat()                                                             \
    ({                                                                                  \
        if (IsMultiplayer()) {                                                          \
            u32 i;                                                                      \
            for (i = 0;                                                                 \
                 i < MULTI_SIO_PLAYERS_MAX && GetBit(gMultiplayerConnections, i);       \
                 i++) {                                                                 \
                if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {                   \
                    if (gMultiplayerMissingHeartbeats[i]++ > 0xB4) {                    \
                        TasksDestroyAll();                                              \
                        gUnknown_03002AE4 = gUnknown_0300287C;                          \
                        gUnknown_03005390 = 0;                                          \
                        gUnknown_03004D5C = gUnknown_03002A84;                          \
                        MultiPakCommunicationError();                                   \
                        return;                                                         \
                    }                                                                   \
                } else {                                                                \
                    gMultiplayerMissingHeartbeats[i] = 0;                               \
                }                                                                       \
            }                                                                           \
        }                                                                               \
    })

#endif // GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H
