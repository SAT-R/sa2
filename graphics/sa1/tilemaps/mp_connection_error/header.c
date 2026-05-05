#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_connection_error[] = INCPAL("graphics/sa1/tilemaps/mp_connection_error/palette.pal");
const u8 Tiles_mp_connection_error[] = INCBIN_U8("graphics/sa1/tilemaps/mp_connection_error/tiles.4bpp");
const u8 Tilemap_mp_connection_error[] = INCBIN_U8("graphics/sa1/tilemaps/mp_connection_error/tilemap.tilemap2");

const Tilemap mp_connection_error = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_connection_error,
    .tilesSize = sizeof(Tiles_mp_connection_error),
    .palette = Palette_mp_connection_error,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_connection_error) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_connection_error,
};
