#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_message_box_black[]
    = INCBIN_U16("data/tilemaps/message_box_black/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_message_box_black[]
    = INCBIN_U8("data/tilemaps/message_box_black/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_message_box_black[]
    = INCBIN_U16("data/tilemaps/message_box_black/tilemap.tilemap2");

ALIGNED(4)
const Tilemap message_box_black = {
    .xTiles = 28,
    .yTiles = 12,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_message_box_black,
    .tilesSize = sizeof(Tiles_message_box_black),
    .palette = Palette_message_box_black,
    .palOffset = 0,
    .palLength = sizeof(Palette_message_box_black) / sizeof(u16),
    .map = Tilemap_message_box_black,
};
