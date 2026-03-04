#include "global.h"
#include "core.h"

const ColorRaw Palette_sa2_logo_en[] = INCPAL("data/tilemaps/sa2_logo_en/palette.pal");
const u8 Tiles_sa2_logo_en[] = INCBIN_U8("data/tilemaps/sa2_logo_en/tiles.4bpp");
const u8 Tilemap_sa2_logo_en[] = INCBIN_U8("data/tilemaps/sa2_logo_en/tilemap.tilemap2");

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
    .palLength = ARRAY_COUNT(Palette_sa2_logo_en),
    .map = (const u16 *)Tilemap_sa2_logo_en,
};
