#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_credits_sa2_logo_jp[] = INCBIN_U16("data/tilemaps/credits_sa2_logo_jp/palette.gbapal");
ALIGNED(4) static const u8 Tiles_credits_sa2_logo_jp[] = INCBIN_U8("data/tilemaps/credits_sa2_logo_jp/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_credits_sa2_logo_jp[] = INCBIN_U16("data/tilemaps/credits_sa2_logo_jp/tilemap.tilemap2");

ALIGNED(4) const Tilemap credits_sa2_logo_jp = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_sa2_logo_jp,
    .tilesSize = sizeof(Tiles_credits_sa2_logo_jp),
    .palette = Palette_credits_sa2_logo_jp,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_sa2_logo_jp) / sizeof(u16),
    .map = Tilemap_credits_sa2_logo_jp,
};
