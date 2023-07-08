#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_tilemap_108[]
    = INCBIN_U16("data/tilemaps/tilemap_108/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_tilemap_108[] = INCBIN_U8("data/tilemaps/tilemap_108/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_tilemap_108[]
    = INCBIN_U16("data/tilemaps/tilemap_108/tilemap.tilemap2");

ALIGNED(4)
const Tilemap tilemap_108 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_108,
    .tilesSize = sizeof(Tiles_tilemap_108),
    .palette = Palette_tilemap_108,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_108) / sizeof(u16),
    .map = Tilemap_tilemap_108,
};
