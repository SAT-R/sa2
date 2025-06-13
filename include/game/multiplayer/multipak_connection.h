#ifndef GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H
#define GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H

#include "global.h"
#include "core.h"
#include "multi_sio.h"

extern u8 gMultiplayerUnlockedCharacters;
extern u8 gMultiplayerConnections;
extern u8 gMultiplayerUnlockedLevels;

void StartMultiPakConnect(void);
void LinkCommunicationError(void);

// TOOD: MultiSioHeartBeat
#define MultiPakHeartbeat()                                                                                                                \
    ({                                                                                                                                     \
        if (IS_MULTI_PLAYER) {                                                                                                             \
            u32 i;                                                                                                                         \
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX && GetBit(gMultiplayerConnections, i); i++) {                                            \
                if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {                                                                      \
                    if (gMultiplayerMissingHeartbeats[i]++ > 0xB4) {                                                                       \
                        TasksDestroyAll();                                                                                                 \
                        PAUSE_BACKGROUNDS_QUEUE();                                                                                         \
                        gUnknown_03005390 = 0;                                                                                             \
                        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;                                                             \
                        LinkCommunicationError();                                                                                          \
                        return;                                                                                                            \
                    }                                                                                                                      \
                } else {                                                                                                                   \
                    gMultiplayerMissingHeartbeats[i] = 0;                                                                                  \
                }                                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
    })

#endif // GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H
