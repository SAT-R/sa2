#include "global.h"
#include "core.h"

const u16 Palette_mp_cheese_please_wait_en[]
    = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_en/palette.gbapal");
const u8 Tiles_mp_cheese_please_wait_en[]
    = INCBIN_U8("data/tilemaps/mp_cheese_please_wait_en/tiles.4bpp");
const u16 Tilemap_mp_cheese_please_wait_en[]
    = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_en/tilemap.tilemap2");

const Tilemap mp_cheese_please_wait_en = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_cheese_please_wait_en,
    .tilesSize = sizeof(Tiles_mp_cheese_please_wait_en),
    .palette = Palette_mp_cheese_please_wait_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_cheese_please_wait_en) / sizeof(u16),
    .map = Tilemap_mp_cheese_please_wait_en,
};
