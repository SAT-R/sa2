#include "global.h"
#include "core.h"

const u16 Palette_credits_10[] = INCBIN_U16("data/tilemaps/credits_10/palette.gbapal");
const u8 Tiles_credits_10[] = INCBIN_U8("data/tilemaps/credits_10/tiles.4bpp");
const u16 Tilemap_credits_10[] = INCBIN_U16("data/tilemaps/credits_10/tilemap.tilemap2");

const Tilemap credits_10 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_10,
    .tilesSize = sizeof(Tiles_credits_10),
    .palette = Palette_credits_10,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_10) / sizeof(u16),
    .map = Tilemap_credits_10,
};
