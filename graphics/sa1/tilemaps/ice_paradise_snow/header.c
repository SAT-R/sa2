#include "global.h"
#include "core.h"

const u16 Palette_ice_paradise_snow[] = INCBIN_U16("graphics/sa1/tilemaps/ice_paradise_snow/palette.gbapal");
const u8 Tiles_ice_paradise_snow[] = INCBIN_U8("graphics/sa1/tilemaps/ice_paradise_snow/tiles.4bpp");
const u8 Tilemap_ice_paradise_snow[] = INCBIN_U8("graphics/sa1/tilemaps/ice_paradise_snow/tilemap.tilemap2");

const Tilemap ice_paradise_snow = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0x140,
    .animFrameCount = 8,
    .animDelay = 12,
    .tiles = Tiles_ice_paradise_snow,
    .tilesSize = (u32)sizeof(Tiles_ice_paradise_snow) - (9 * 0x140),
    .palette = Palette_ice_paradise_snow,
    .palOffset = 0,
    .palLength = sizeof(Palette_ice_paradise_snow) / sizeof(u16),
    .map = (const u16 *)Tilemap_ice_paradise_snow,
};
