#include "global.h"
#include "core.h"

const ColorRaw Palette_unlocked_tiny_chao_garden_fr[] = INCPAL("data/tilemaps/unlocked_tiny_chao_garden_fr/palette.pal");
const u8 Tiles_unlocked_tiny_chao_garden_fr[] = INCBIN_U8("data/tilemaps/unlocked_tiny_chao_garden_fr/tiles.4bpp");
const u16 Tilemap_unlocked_tiny_chao_garden_fr[] = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_fr/tilemap.tilemap2");

const Tilemap unlocked_tiny_chao_garden_fr = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_tiny_chao_garden_fr,
    .tilesSize = sizeof(Tiles_unlocked_tiny_chao_garden_fr),
    .palette = Palette_unlocked_tiny_chao_garden_fr,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unlocked_tiny_chao_garden_fr),
    .map = Tilemap_unlocked_tiny_chao_garden_fr,
};
