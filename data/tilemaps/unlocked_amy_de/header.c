#include "global.h"
#include "core.h"

const ColorRaw Palette_unlocked_amy_de[] = INCPAL("data/tilemaps/unlocked_amy_de/palette.pal");
const u8 Tiles_unlocked_amy_de[] = INCBIN_U8("data/tilemaps/unlocked_amy_de/tiles.4bpp");
const u16 Tilemap_unlocked_amy_de[] = INCBIN_U16("data/tilemaps/unlocked_amy_de/tilemap.tilemap2");

const Tilemap unlocked_amy_de = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_amy_de,
    .tilesSize = sizeof(Tiles_unlocked_amy_de),
    .palette = Palette_unlocked_amy_de,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unlocked_amy_de),
    .map = Tilemap_unlocked_amy_de,
};
