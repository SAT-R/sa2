#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_unlocked_tiny_chao_garden_es[]
    = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_es/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_unlocked_tiny_chao_garden_es[]
    = INCBIN_U8("data/tilemaps/unlocked_tiny_chao_garden_es/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_unlocked_tiny_chao_garden_es[]
    = INCBIN_U16("data/tilemaps/unlocked_tiny_chao_garden_es/tilemap.tilemap2");

ALIGNED(4)
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
    .palLength = sizeof(Palette_unlocked_tiny_chao_garden_es) / sizeof(u16),
    .map = Tilemap_unlocked_tiny_chao_garden_es,
};
