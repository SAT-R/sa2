#include "global.h"
#include "core.h"

const ColorRaw Palette_sa2_title_logo_jp[] = INCPAL("data/tilemaps/sa2_title_logo_jp/palette.pal");
const u8 Tiles_sa2_title_logo_jp[] = INCBIN_U8("data/tilemaps/sa2_title_logo_jp/tiles.4bpp");
const u8 Tilemap_sa2_title_logo_jp[] = INCBIN_U8("data/tilemaps/sa2_title_logo_jp/tilemap.tilemap2");

const Tilemap sa2_title_logo_jp = {
    .xTiles = 26,
    .yTiles = 10,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_sa2_title_logo_jp,
    .tilesSize = sizeof(Tiles_sa2_title_logo_jp),
    .palette = Palette_sa2_title_logo_jp,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_sa2_title_logo_jp),
    .map = (const u16 *)Tilemap_sa2_title_logo_jp,
};
