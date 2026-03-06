#include "global.h"
#include "core.h"

const ColorRaw Palette_credits_sa2_logo_jp[] = INCPAL("data/tilemaps/credits_sa2_logo_jp/palette.pal");
const u8 Tiles_credits_sa2_logo_jp[] = INCBIN_U8("data/tilemaps/credits_sa2_logo_jp/tiles.4bpp");
const u16 Tilemap_credits_sa2_logo_jp[] = INCBIN_U16("data/tilemaps/credits_sa2_logo_jp/tilemap.tilemap2");

const Tilemap credits_sa2_logo_jp = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_sa2_logo_jp,
    .tilesSize = sizeof(Tiles_credits_sa2_logo_jp),
    .palette = Palette_credits_sa2_logo_jp,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_credits_sa2_logo_jp),
    .map = Tilemap_credits_sa2_logo_jp,
};
