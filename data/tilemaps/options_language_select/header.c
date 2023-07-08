#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_options_language_select[] = INCBIN_U16("data/tilemaps/options_language_select/palette.gbapal");
ALIGNED(4) static const u8 Tiles_options_language_select[] = INCBIN_U8("data/tilemaps/options_language_select/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_options_language_select[] = INCBIN_U16("data/tilemaps/options_language_select/tilemap.tilemap2");

ALIGNED(4) const Tilemap options_language_select = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_options_language_select,
    .tilesSize = sizeof(Tiles_options_language_select),
    .palette = Palette_options_language_select,
    .palOffset = 0,
    .palLength = sizeof(Palette_options_language_select) / sizeof(u16),
    .map = Tilemap_options_language_select,
};
