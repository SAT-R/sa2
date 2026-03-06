#include "global.h"
#include "core.h"

const ColorRaw Palette_unknown_options_bg[] = INCPAL("data/tilemaps/unknown_options_bg/palette.pal");
const u8 Tiles_unknown_options_bg[] = INCBIN_U8("data/tilemaps/unknown_options_bg/tiles.4bpp");
const u16 Tilemap_unknown_options_bg[] = INCBIN_U16("data/tilemaps/unknown_options_bg/tilemap.tilemap2");

const Tilemap unknown_options_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unknown_options_bg,
    .tilesSize = sizeof(Tiles_unknown_options_bg),
    .palette = Palette_unknown_options_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unknown_options_bg),
    .map = Tilemap_unknown_options_bg,
};
