#include "global.h"
#include "core.h"

const ColorRaw Palette_unlocked_tiny_chao_garden_de[] = INCPAL("data/tilemaps/unlocked_tiny_chao_garden_de/palette.pal");
const u8 Tiles_unlocked_tiny_chao_garden_de[] = INCBIN_U8("data/tilemaps/unlocked_tiny_chao_garden_de/tiles.4bpp");
const u16 Tilemap_unlocked_tiny_chao_garden_de[] = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_de/tilemap.tilemap2");

const Tilemap unlocked_tiny_chao_garden_de = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_tiny_chao_garden_de,
    .tilesSize = sizeof(Tiles_unlocked_tiny_chao_garden_de),
    .palette = Palette_unlocked_tiny_chao_garden_de,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unlocked_tiny_chao_garden_de),
    .map = Tilemap_unlocked_tiny_chao_garden_de,
};
