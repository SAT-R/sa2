#ifndef GUARD_INTERACTABLE_074_H
#define GUARD_INTERACTABLE_074_H

#define BRIDGE_SEGMENT_WIDTH 12
#define BRIDGE_WIDTH         (28 * TILE_WIDTH)

#define SPRITE_TILES       2
#define NUM_BRIDGE_SPRITES 2

#define BRIDGE_TYPE_STRAIGHT 0
#define BRIDGE_TYPE_CURVED   1

#include "global.h"
#include "game/entity.h"

void CreateEntity_LightBridge(MapEntity *ia, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY);

#endif
