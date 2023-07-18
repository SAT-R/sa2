#include "global.h"
#include "core.h"

const u16 Palette_credits_15[] = INCBIN_U16("data/tilemaps/credits_15/palette.gbapal");
const u8 Tiles_credits_15[] = INCBIN_U8("data/tilemaps/credits_15/tiles.4bpp");
const u16 Tilemap_credits_15[] = INCBIN_U16("data/tilemaps/credits_15/tilemap.tilemap2");

const Tilemap credits_15 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_15,
    .tilesSize = sizeof(Tiles_credits_15),
    .palette = Palette_credits_15,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_15) / sizeof(u16),
    .map = Tilemap_credits_15,
};
