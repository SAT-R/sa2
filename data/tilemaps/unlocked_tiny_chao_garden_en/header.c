#include "global.h"
#include "core.h"

const ColorRaw Palette_unlocked_tiny_chao_garden_en[] = INCPAL("data/tilemaps/unlocked_tiny_chao_garden_en/palette.pal");
const u8 Tiles_unlocked_tiny_chao_garden_en[] = INCBIN_U8("data/tilemaps/unlocked_tiny_chao_garden_en/tiles.4bpp");
const u16 Tilemap_unlocked_tiny_chao_garden_en[] = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_en/tilemap.tilemap2");

const Tilemap unlocked_tiny_chao_garden_en = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_tiny_chao_garden_en,
    .tilesSize = sizeof(Tiles_unlocked_tiny_chao_garden_en),
    .palette = Palette_unlocked_tiny_chao_garden_en,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unlocked_tiny_chao_garden_en),
    .map = Tilemap_unlocked_tiny_chao_garden_en,
};
