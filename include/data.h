/**
 * Used to store unknown globals defined in iwram and ewram
 * until we can find a better place for them
 */
#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "global.h"
#include "core.h"
#include "animation_commands.h"

extern const struct SpriteTables gSpriteTables;

// We need 'Tilemap' in data.h, so it has to be declared later
extern const Tilemap *const gTilemaps[381];

#endif
