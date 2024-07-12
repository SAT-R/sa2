#include "global.h"
#include "core.h"

const u16 Palette_unlocked_amy_en[] = INCBIN_U16("data/tilemaps/unlocked_amy_en/palette.gbapal");
const u8 Tiles_unlocked_amy_en[] = INCBIN_U8("data/tilemaps/unlocked_amy_en/tiles.4bpp");
const u16 Tilemap_unlocked_amy_en[] = INCBIN_U16("data/tilemaps/unlocked_amy_en/tilemap.tilemap2");

const Tilemap unlocked_amy_en = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_amy_en,
    .tilesSize = sizeof(Tiles_unlocked_amy_en),
    .palette = Palette_unlocked_amy_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_amy_en) / sizeof(u16),
    .map = Tilemap_unlocked_amy_en,
};
