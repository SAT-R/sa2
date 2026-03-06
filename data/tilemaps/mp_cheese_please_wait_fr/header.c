#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_cheese_please_wait_fr[] = INCPAL("data/tilemaps/mp_cheese_please_wait_fr/palette.pal");
const u8 Tiles_mp_cheese_please_wait_fr[] = INCBIN_U8("data/tilemaps/mp_cheese_please_wait_fr/tiles.4bpp");
const u16 Tilemap_mp_cheese_please_wait_fr[] = INCBIN_U16("data/tilemaps/mp_cheese_please_wait_fr/tilemap.tilemap2");

const Tilemap mp_cheese_please_wait_fr = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_cheese_please_wait_fr,
    .tilesSize = sizeof(Tiles_mp_cheese_please_wait_fr),
    .palette = Palette_mp_cheese_please_wait_fr,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_mp_cheese_please_wait_fr),
    .map = Tilemap_mp_cheese_please_wait_fr,
};
