#include "global.h"
#include "core.h"

const u16 Palette_mp_message_box_unknown[] = INCBIN_U16("data/tilemaps/mp_message_box_unknown/palette.gbapal");
const u8 Tiles_mp_message_box_unknown[] = INCBIN_U8("data/tilemaps/mp_message_box_unknown/tiles.4bpp");
const u16 Tilemap_mp_message_box_unknown[] = INCBIN_U16("data/tilemaps/mp_message_box_unknown/tilemap.tilemap2");

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
