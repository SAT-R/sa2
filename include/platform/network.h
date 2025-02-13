#ifndef GUARD_SA2_PLATFORM_H
#define GUARD_SA2_PLATFORM_H

#include "gba/types.h"

PACKED(NetworkPacket, {
    u16 sioData;
    u8 sioId;
});

#endif
