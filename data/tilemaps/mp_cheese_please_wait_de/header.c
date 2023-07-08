#include "global.h"
#include "core.h"

const u16 Palette_mp_cheese_please_wait_de[]
    = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_de/palette.gbapal");
const u8 Tiles_mp_cheese_please_wait_de[]
    = INCBIN_U8("data/tilemaps/mp_cheese_please_wait_de/tiles.4bpp");
const u16 Tilemap_mp_cheese_please_wait_de[]
    = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_de/tilemap.tilemap2");

const Tilemap mp_cheese_please_wait_de = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_cheese_please_wait_de,
    .tilesSize = sizeof(Tiles_mp_cheese_please_wait_de),
    .palette = Palette_mp_cheese_please_wait_de,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_cheese_please_wait_de) / sizeof(u16),
    .map = Tilemap_mp_cheese_please_wait_de,
};
