#include "global.h"
#include "core.h"

const u16 Palette_mp_cheese_please_wait_es[] = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_es/palette.gbapal");
const u8 Tiles_mp_cheese_please_wait_es[] = INCBIN_U8("data/tilemaps/mp_cheese_please_wait_es/tiles.4bpp");
const u16 Tilemap_mp_cheese_please_wait_es[] = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_es/tilemap.tilemap2");

const Tilemap mp_cheese_please_wait_es = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_cheese_please_wait_es,
    .tilesSize = sizeof(Tiles_mp_cheese_please_wait_es),
    .palette = Palette_mp_cheese_please_wait_es,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_cheese_please_wait_es) / sizeof(u16),
    .map = Tilemap_mp_cheese_please_wait_es,
};
