#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_tilemap_371[] = INCBIN_U16("data/tilemaps/tilemap_371/palette.gbapal");
ALIGNED(4) static const u8 Tiles_tilemap_371[] = INCBIN_U8("data/tilemaps/tilemap_371/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_tilemap_371[] = INCBIN_U16("data/tilemaps/tilemap_371/tilemap.tilemap2");

ALIGNED(4) const Tilemap tilemap_371 = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 128,
    .animFrameCount = 4,
    .animDelay = 9,
    .tiles = Tiles_tilemap_371,
    .tilesSize = sizeof(Tiles_tilemap_371),
    .palette = Palette_tilemap_371,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_371) / sizeof(u16),
    .map = Tilemap_tilemap_371,
};
