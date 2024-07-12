#include "global.h"
#include "core.h"

const u16 Palette_credits_copyright[] = INCBIN_U16("data/tilemaps/credits_copyright/palette.gbapal");
const u8 Tiles_credits_copyright[] = INCBIN_U8("data/tilemaps/credits_copyright/tiles.4bpp");
const u16 Tilemap_credits_copyright[] = INCBIN_U16("data/tilemaps/credits_copyright/tilemap.tilemap2");

const Tilemap credits_copyright = {
    .xTiles = 30,
    .yTiles = 3,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_copyright,
    .tilesSize = sizeof(Tiles_credits_copyright),
    .palette = Palette_credits_copyright,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_copyright) / sizeof(u16),
    .map = Tilemap_credits_copyright,
};
