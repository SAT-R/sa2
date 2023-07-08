#include "global.h"
#include "core.h"

const u16 Palette_mp_wait_connection[]
    = INCBIN_U16("data/tilemaps/mp_wait_connection/palette.gbapal");
const u8 Tiles_mp_wait_connection[]
    = INCBIN_U8("data/tilemaps/mp_wait_connection/tiles.4bpp");
const u16 Tilemap_mp_wait_connection[]
    = INCBIN_U16("data/tilemaps/mp_wait_connection/tilemap.tilemap2");

const Tilemap mp_wait_connection = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_wait_connection,
    .tilesSize = sizeof(Tiles_mp_wait_connection),
    .palette = Palette_mp_wait_connection,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_wait_connection) / sizeof(u16),
    .map = Tilemap_mp_wait_connection,
};
