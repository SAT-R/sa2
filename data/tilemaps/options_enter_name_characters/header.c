#include "global.h"
#include "core.h"

const ColorRaw Palette_options_enter_name_characters[] = INCPAL("data/tilemaps/options_enter_name_characters/palette.pal");
const u8 Tiles_options_enter_name_characters[] = INCBIN_U8("data/tilemaps/options_enter_name_characters/tiles.4bpp");
const u16 Tilemap_options_enter_name_characters[] = INCBIN_U16("data/tilemaps/options_enter_name_characters/tilemap.tilemap2");

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
    .palLength = ARRAY_COUNT(Palette_options_enter_name_characters),
    .map = Tilemap_options_enter_name_characters,
};
