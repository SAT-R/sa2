#include "global.h"
#include "core.h"

const ColorRaw Palette_techno_base_bg_purple_grid[] = INCPAL("data/tilemaps/techno_base_bg_purple_grid/palette.pal");
const u8 Tiles_techno_base_bg_purple_grid[] = INCBIN_U8("data/tilemaps/techno_base_bg_purple_grid/tiles.4bpp");
const u16 Tilemap_techno_base_bg_purple_grid[] = INCBIN_U16("data/tilemaps/techno_base_bg_purple_grid/tilemap.tilemap2");

const Tilemap techno_base_bg_purple_grid = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_techno_base_bg_purple_grid,
    .tilesSize = sizeof(Tiles_techno_base_bg_purple_grid),
    .palette = Palette_techno_base_bg_purple_grid,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_techno_base_bg_purple_grid),
    .map = Tilemap_techno_base_bg_purple_grid,
};
