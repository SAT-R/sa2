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
    /* 0x00 */ void *animations;
    /* 0x04 */ void *dimensions;
    /* 0x08 */ u16 **oamData;
    /* 0x0C */ u16 *palettes;
    /* 0x10 */ u8 *graphics; // @TODO: Rename to 'tiles_4bpp'
    /* 0x14 */ u8 *tiles_8bpp;
};

extern const struct SpriteTables gSpriteTables;

#endif
