#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_mp_message_box_unknown[]
    = INCBIN_U16("data/tilemaps/mp_message_box_unknown/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_mp_message_box_unknown[]
    = INCBIN_U8("data/tilemaps/mp_message_box_unknown/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_mp_message_box_unknown[]
    = INCBIN_U16("data/tilemaps/mp_message_box_unknown/tilemap.tilemap2");

ALIGNED(4)
const Tilemap mp_message_box_unknown = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_message_box_unknown,
    .tilesSize = sizeof(Tiles_mp_message_box_unknown),
    .palette = Palette_mp_message_box_unknown,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_message_box_unknown) / sizeof(u16),
    .map = Tilemap_mp_message_box_unknown,
};
