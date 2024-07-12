#include "global.h"
#include "core.h"

const u16 Palette_unlocked_tiny_chao_garden_it[] = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_it/palette.gbapal");
const u8 Tiles_unlocked_tiny_chao_garden_it[] = INCBIN_U8("data/tilemaps/unlocked_tiny_chao_garden_it/tiles.4bpp");
const u16 Tilemap_unlocked_tiny_chao_garden_it[] = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_it/tilemap.tilemap2");

const Tilemap unlocked_tiny_chao_garden_it = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_tiny_chao_garden_it,
    .tilesSize = sizeof(Tiles_unlocked_tiny_chao_garden_it),
    .palette = Palette_unlocked_tiny_chao_garden_it,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_tiny_chao_garden_it) / sizeof(u16),
    .map = Tilemap_unlocked_tiny_chao_garden_it,
};
