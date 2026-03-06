#include "global.h"
#include "core.h"

const ColorRaw Palette_intro_water[] = INCPAL("data/tilemaps/intro_water/palette.pal");
const u8 Tiles_intro_water[] = INCBIN_U8("data/tilemaps/intro_water/tiles.4bpp");
const u8 Tilemap_intro_water[] = INCBIN_U8("data/tilemaps/intro_water/tilemap.tilemap2");

const Tilemap intro_water = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_intro_water,
    .tilesSize = sizeof(Tiles_intro_water),
    .palette = Palette_intro_water,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_intro_water),
    .map = (const u16 *)Tilemap_intro_water,
};
