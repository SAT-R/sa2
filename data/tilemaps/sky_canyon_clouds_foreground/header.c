#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_sky_canyon_clouds_foreground[]
    = INCBIN_U16("data/tilemaps/sky_canyon_clouds_foreground/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_sky_canyon_clouds_foreground[]
    = INCBIN_U8("data/tilemaps/sky_canyon_clouds_foreground/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_sky_canyon_clouds_foreground[]
    = INCBIN_U16("data/tilemaps/sky_canyon_clouds_foreground/tilemap.tilemap2");

ALIGNED(4)
const Tilemap sky_canyon_clouds_foreground = {
    .xTiles = 32,
    .yTiles = 23,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_sky_canyon_clouds_foreground,
    .tilesSize = sizeof(Tiles_sky_canyon_clouds_foreground),
    .palette = Palette_sky_canyon_clouds_foreground,
    .palOffset = 0,
    .palLength = sizeof(Palette_sky_canyon_clouds_foreground) / sizeof(u16),
    .map = Tilemap_sky_canyon_clouds_foreground,
};
