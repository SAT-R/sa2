#include "global.h"
#include "core.h"

const u16 Palette_tilemap_unused_mp_4[] = INCBIN_U16("graphics/sa1/tilemaps/tilemap_unused_mp_4/palette.gbapal");
const u8 Tiles_tilemap_unused_mp_4[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_unused_mp_4/tiles.4bpp");
const u8 Tilemap_tilemap_unused_mp_4[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_unused_mp_4/tilemap.tilemap2");

// 0x080D74A0
const Tilemap tilemap_unused_mp_4 = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_unused_mp_4,
    .tilesSize = sizeof(Tiles_tilemap_unused_mp_4),
    .palette = Palette_tilemap_unused_mp_4,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_unused_mp_4) / sizeof(u16),
    .map = (const u16 *)Tilemap_tilemap_unused_mp_4,
};
