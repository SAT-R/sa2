#include "global.h"
#include "core.h"

const u16 Palette_options_vs_record_bg1[]
    = INCBIN_U16("data/tilemaps/options_vs_record_bg1/palette.gbapal");
const u8 Tiles_options_vs_record_bg1[]
    = INCBIN_U8("data/tilemaps/options_vs_record_bg1/tiles.4bpp");
const u16 Tilemap_options_vs_record_bg1[]
    = INCBIN_U16("data/tilemaps/options_vs_record_bg1/tilemap.tilemap2");

const Tilemap options_vs_record_bg1 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_options_vs_record_bg1,
    .tilesSize = sizeof(Tiles_options_vs_record_bg1),
    .palette = Palette_options_vs_record_bg1,
    .palOffset = 0,
    .palLength = sizeof(Palette_options_vs_record_bg1) / sizeof(u16),
    .map = Tilemap_options_vs_record_bg1,
};
