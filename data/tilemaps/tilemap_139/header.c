#include "global.h"
#include "core.h"

const u16 Palette_tilemap_139[] = INCBIN_U16("data/tilemaps/tilemap_139/palette.gbapal");
const u8 Tiles_tilemap_139[] = INCBIN_U8("data/tilemaps/tilemap_139/tiles.4bpp");
const u16 Tilemap_tilemap_139[]
    = INCBIN_U16("data/tilemaps/tilemap_139/tilemap.tilemap2");

const Tilemap tilemap_139 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_139,
    .tilesSize = sizeof(Tiles_tilemap_139),
    .palette = Palette_tilemap_139,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_139) / sizeof(u16),
    .map = Tilemap_tilemap_139,
};
