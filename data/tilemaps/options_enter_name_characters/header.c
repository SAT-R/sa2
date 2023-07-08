#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_options_enter_name_characters[]
    = INCBIN_U16("data/tilemaps/options_enter_name_characters/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_options_enter_name_characters[]
    = INCBIN_U8("data/tilemaps/options_enter_name_characters/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_options_enter_name_characters[]
    = INCBIN_U16("data/tilemaps/options_enter_name_characters/tilemap.tilemap2");

ALIGNED(4)
const Tilemap options_enter_name_characters = {
    .xTiles = 22,
    .yTiles = 44,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_options_enter_name_characters,
    .tilesSize = sizeof(Tiles_options_enter_name_characters),
    .palette = Palette_options_enter_name_characters,
    .palOffset = 0,
    .palLength = sizeof(Palette_options_enter_name_characters) / sizeof(u16),
    .map = Tilemap_options_enter_name_characters,
};
