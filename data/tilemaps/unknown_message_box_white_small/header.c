#include "global.h"
#include "core.h"

const u16 Palette_unknown_message_box_white_small[] = INCBIN_U16("data/tilemaps/unknown_message_box_white_small/palette.gbapal");
const u8 Tiles_unknown_message_box_white_small[] = INCBIN_U8("data/tilemaps/unknown_message_box_white_small/tiles.4bpp");
const u16 Tilemap_unknown_message_box_white_small[] = INCBIN_U16("data/tilemaps/unknown_message_box_white_small/tilemap.tilemap2");

const Tilemap unknown_message_box_white_small = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unknown_message_box_white_small,
    .tilesSize = sizeof(Tiles_unknown_message_box_white_small),
    .palette = Palette_unknown_message_box_white_small,
    .palOffset = 0,
    .palLength = sizeof(Palette_unknown_message_box_white_small) / sizeof(u16),
    .map = Tilemap_unknown_message_box_white_small,
};
