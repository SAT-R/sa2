#ifndef GUARD_LOADER_TABLES_H
#define GUARD_LOADER_TABLES_H

#include "global.h"

extern void *const gSegmentLoadBuffers[];
extern const u8 gUnknown_0203EBC0[];
extern const u8 gUnknown_0203EDC0[];

struct UNK_203F260 {
    u8 filler4[0x3C];
}; /* 0x3C */

struct UNK_203E844 {
    u8 filler4[0x30];
}; /* 0x3C */

extern const struct UNK_203F260 gUnknown_0203F260[];

extern const u8 gUnknown_0203C4A4[];
extern const struct UNK_203E844 gUnknown_0203E844[];

#endif // GUARD_LOADER_TABLES_H
