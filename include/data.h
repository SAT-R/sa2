/**
 * Used to store unknown globals defined in iwram and ewram
 * until we can find a better place for them
 */
#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "global.h"

// TODO: extract this data
extern union Unk_03002E60 gMapHeaders[];

struct SpriteTables {
    void *animations; /* 0x00 */
    void *dimensions; /* 0x04 */
    u16 **oamData; /* 0x08 */
    u16 *palettes; /* 0xC */
    void *graphics; /* 0x10 */
    void *unk20; /* 0x14 */
};

extern const struct SpriteTables gSpriteTables;

#endif
