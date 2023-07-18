#include "global.h"
#include "core.h"

const u16 Palette_spotlight_snow[]
    = INCBIN_U16("data/tilemaps/spotlight_snow/palette.gbapal");
const u8 Tiles_spotlight_snow[] = INCBIN_U8("data/tilemaps/spotlight_snow/tiles.4bpp");
const u8 Tiles_AnimTiles_spotlight_snow[]
    = INCBIN_U8("data/tilemaps/spotlight_snow/tiles_anim.4bpp");
const u16 Tilemap_spotlight_snow[]
    = INCBIN_U16("data/tilemaps/spotlight_snow/tilemap.tilemap2");

/* This is the snow effect inside Ice Paradise's spotlights */

const Tilemap spotlight_snow = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 128,
    .animFrameCount = 4,
    .animDelay = 9,
    .tiles = Tiles_spotlight_snow,
    .tilesSize = sizeof(Tiles_spotlight_snow),
    .palette = Palette_spotlight_snow,
    .palOffset = 0,
    .palLength = sizeof(Palette_spotlight_snow) / sizeof(u16),
    .map = Tilemap_spotlight_snow,
};
