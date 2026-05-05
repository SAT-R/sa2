#include "global.h"
#include "core.h"

const ColorRaw Palette_tilemap_unused_mp_3[] = INCPAL("graphics/sa1/tilemaps/tilemap_unused_mp_3/palette.pal");
const u8 Tiles_tilemap_unused_mp_3[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_unused_mp_3/tiles.4bpp");
const u8 Tilemap_tilemap_unused_mp_3[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_unused_mp_3/tilemap.tilemap2");

// 0x080D6F58
const Tilemap tilemap_unused_mp_3 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_unused_mp_3,
    .tilesSize = sizeof(Tiles_tilemap_unused_mp_3),
    .palette = Palette_tilemap_unused_mp_3,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_unused_mp_3) / sizeof(u16),
    .map = (const u16 *)Tilemap_tilemap_unused_mp_3,
};
