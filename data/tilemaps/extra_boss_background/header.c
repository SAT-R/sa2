#include "global.h"
#include "core.h"

const ColorRaw Palette_extra_boss_background[] = INCPAL("data/tilemaps/extra_boss_background/palette.pal");
const u8 Tiles_extra_boss_background[] = INCBIN_U8("data/tilemaps/extra_boss_background/tiles.4bpp");
const u16 Tilemap_extra_boss_background[] = INCBIN_U16("data/tilemaps/extra_boss_background/tilemap.tilemap2");

const Tilemap extra_boss_background = {
    .xTiles = 32,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_extra_boss_background,
    .tilesSize = sizeof(Tiles_extra_boss_background),
    .palette = Palette_extra_boss_background,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_extra_boss_background),
    .map = Tilemap_extra_boss_background,
};
