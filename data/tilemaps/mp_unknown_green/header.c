#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_unknown_green[] = INCPAL("data/tilemaps/mp_unknown_green/palette.pal");
const u8 Tiles_mp_unknown_green[] = INCBIN_U8("data/tilemaps/mp_unknown_green/tiles.4bpp");
const u16 Tilemap_mp_unknown_green[] = INCBIN_U16("data/tilemaps/mp_unknown_green/tilemap.tilemap2");

const Tilemap mp_unknown_green = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_unknown_green,
    .tilesSize = sizeof(Tiles_mp_unknown_green),
    .palette = Palette_mp_unknown_green,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_mp_unknown_green),
    .map = Tilemap_mp_unknown_green,
};
