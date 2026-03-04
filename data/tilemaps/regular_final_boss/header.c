#include "global.h"
#include "core.h"

const ColorRaw Palette_regular_final_boss[] = INCPAL("data/tilemaps/regular_final_boss/palette.pal");
const u8 Tiles_regular_final_boss[] = INCBIN_U8("data/tilemaps/regular_final_boss/tiles.4bpp");
const u16 Tilemap_regular_final_boss[] = INCBIN_U16("data/tilemaps/regular_final_boss/tilemap.tilemap2");

const Tilemap regular_final_boss = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_regular_final_boss,
    .tilesSize = sizeof(Tiles_regular_final_boss),
    .palette = Palette_regular_final_boss,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_regular_final_boss),
    .map = Tilemap_regular_final_boss,
};
