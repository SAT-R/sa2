#include "global.h"
#include "core.h"

const u16 Palette_intro_water[] = INCBIN_U16("data/tilemaps/intro_water/palette.gbapal");
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
    .palLength = sizeof(Palette_intro_water) / sizeof(u16),
    .map = (const u16 *)Tilemap_intro_water,
};
