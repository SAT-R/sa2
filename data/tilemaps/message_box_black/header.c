#include "global.h"
#include "core.h"

const u16 Palette_message_box_black[]
    = INCBIN_U16("data/tilemaps/message_box_black/palette.gbapal");
const u8 Tiles_message_box_black[]
    = INCBIN_U8("data/tilemaps/message_box_black/tiles.4bpp");
const u16 Tilemap_message_box_black[]
    = INCBIN_U16("data/tilemaps/message_box_black/tilemap.tilemap2");

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
