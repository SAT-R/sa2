#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_intro_water[]
    = INCBIN_U16("data/tilemaps/intro_water/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_intro_water[] = INCBIN_U8("data/tilemaps/intro_water/tiles.4bpp");
ALIGNED(4)
static const u8 Tilemap_intro_water[]
    = INCBIN_U8("data/tilemaps/intro_water/tilemap.tilemap2");

ALIGNED(4)
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
