#include "global.h"
#include "core.h"

const ColorRaw Palette_extra_boss_background_copy[] = INCPAL("data/tilemaps/extra_boss_background_copy/palette.pal");
const u8 Tiles_extra_boss_background_copy[] = INCBIN_U8("data/tilemaps/extra_boss_background_copy/tiles.4bpp");
const u16 Tilemap_extra_boss_background_copy[] = INCBIN_U16("data/tilemaps/extra_boss_background_copy/tilemap.tilemap2");

const Tilemap extra_boss_background_copy = {
    .xTiles = 32,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_extra_boss_background_copy,
    .tilesSize = sizeof(Tiles_extra_boss_background_copy),
    .palette = Palette_extra_boss_background_copy,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_extra_boss_background_copy),
    .map = Tilemap_extra_boss_background_copy,
};
