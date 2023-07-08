#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_character_select_background_1[]
    = INCBIN_U16("data/tilemaps/character_select_background_1/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_character_select_background_1[]
    = INCBIN_U8("data/tilemaps/character_select_background_1/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_character_select_background_1[]
    = INCBIN_U16("data/tilemaps/character_select_background_1/tilemap.tilemap2");

ALIGNED(4)
const Tilemap character_select_background_1 = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_character_select_background_1,
    .tilesSize = sizeof(Tiles_character_select_background_1),
    .palette = Palette_character_select_background_1,
    .palOffset = 0,
    .palLength = sizeof(Palette_character_select_background_1) / sizeof(u16),
    .map = Tilemap_character_select_background_1,
};
