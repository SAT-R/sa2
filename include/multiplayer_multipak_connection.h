#ifndef GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H
#define GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H

#include "global.h"
#include "data.h"
#include "multi_sio.h"

extern u8 gUnknown_03005594;
extern u8 gUnknown_030055B8;
extern u8 gUnknown_030054D8;

void StartMultiPakConnect(void);
void MultiPakCommunicationError(void);

#define MultiPakHeartbeat() ({ \
    if (gGameMode > 2) { \
        u32 i; \
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && GetBit(gUnknown_030055B8, i); i++) { \
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) { \
                if (gUnknown_030054D4[i]++ > 0xB4) { \
                    TasksDestroyAll(); \
                    gUnknown_03002AE4 = gUnknown_0300287C; \
                    gUnknown_03005390 = 0; \
                    gUnknown_03004D5C = gUnknown_03002A84; \
                    MultiPakCommunicationError(); \
                    return; \
                } \
            } else { \
                gUnknown_030054D4[i] = 0; \
            } \
        } \
    } \
}) \

#endif // GUARD_MULTIPLAYER_MULTIPAK_CONNECTION_H
