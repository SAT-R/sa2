/**
 * Used to store unknown globals defined in iwram and ewram
 * until we can find a better place for them
 */
#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "global.h"
#include "animation_commands.h"

// TODO: extract this data
extern struct MapHeader_Full *gMapHeaders[];

struct SpriteTables {
    /* 0x00 */ ACmd ***animations;
    /* 0x04 */ SpriteOffset **dimensions;
    /* 0x08 */ u16 **oamData;
    /* 0x0C */ u16 *palettes;
    /* 0x10 */ u8 *tiles_4bpp;
    /* 0x14 */ u8 *tiles_8bpp;
};

extern const struct SpriteTables gSpriteTables;

#endif
