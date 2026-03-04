#include "global.h"
#include "core.h"

const ColorRaw Palette_unlocked_tiny_chao_garden_es[] = INCPAL("data/tilemaps/unlocked_tiny_chao_garden_es/palette.pal");
const u8 Tiles_unlocked_tiny_chao_garden_es[] = INCBIN_U8("data/tilemaps/unlocked_tiny_chao_garden_es/tiles.4bpp");
const u16 Tilemap_unlocked_tiny_chao_garden_es[] = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_es/tilemap.tilemap2");

const Tilemap unlocked_tiny_chao_garden_es = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_tiny_chao_garden_es,
    .tilesSize = sizeof(Tiles_unlocked_tiny_chao_garden_es),
    .palette = Palette_unlocked_tiny_chao_garden_es,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unlocked_tiny_chao_garden_es),
    .map = Tilemap_unlocked_tiny_chao_garden_es,
};
