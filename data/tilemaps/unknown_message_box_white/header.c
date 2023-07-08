#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_unknown_message_box_white[] = INCBIN_U16("data/tilemaps/unknown_message_box_white/palette.gbapal");
ALIGNED(4) static const u8 Tiles_unknown_message_box_white[] = INCBIN_U8("data/tilemaps/unknown_message_box_white/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_unknown_message_box_white[] = INCBIN_U16("data/tilemaps/unknown_message_box_white/tilemap.tilemap2");

ALIGNED(4) const Tilemap unknown_message_box_white = {
    .xTiles = 30,
    .yTiles = 10,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unknown_message_box_white,
    .tilesSize = sizeof(Tiles_unknown_message_box_white),
    .palette = Palette_unknown_message_box_white,
    .palOffset = 0,
    .palLength = sizeof(Palette_unknown_message_box_white) / sizeof(u16),
    .map = Tilemap_unknown_message_box_white,
};
