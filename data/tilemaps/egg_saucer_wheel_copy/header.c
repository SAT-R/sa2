#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_egg_saucer_wheel_copy[]
    = INCBIN_U16("data/tilemaps/egg_saucer_wheel_copy/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_egg_saucer_wheel_copy[]
    = INCBIN_U8("data/tilemaps/egg_saucer_wheel_copy/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_egg_saucer_wheel_copy[]
    = INCBIN_U16("data/tilemaps/egg_saucer_wheel_copy/tilemap.tilemap2");

ALIGNED(4)
const Tilemap egg_saucer_wheel_copy = {
    .xTiles = 14,
    .yTiles = 14,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_egg_saucer_wheel_copy,
    .tilesSize = sizeof(Tiles_egg_saucer_wheel_copy),
    .palette = Palette_egg_saucer_wheel_copy,
    .palOffset = 0,
    .palLength = sizeof(Palette_egg_saucer_wheel_copy) / sizeof(u16),
    .map = Tilemap_egg_saucer_wheel_copy,
};
