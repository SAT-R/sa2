#include "global.h"
#include "core.h"

const u16 Palette_sa2_logo_en[] = INCBIN_U16("data/tilemaps/sa2_logo_en/palette.gbapal");
const u8 Tiles_sa2_logo_en[] = INCBIN_U8("data/tilemaps/sa2_logo_en/tiles.8bpp");
const u8 Tilemap_sa2_logo_en[] = INCBIN_U8("data/tilemaps/sa2_logo_en/tilemap.tilemap1");

const Tilemap sa2_logo_en = {
    .xTiles = 26,
    .yTiles = 10,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_sa2_logo_en,
    .tilesSize = sizeof(Tiles_sa2_logo_en),
    .palette = Palette_sa2_logo_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_sa2_logo_en) / sizeof(u16),
    .map = (const u16 *)Tilemap_sa2_logo_en,
};
