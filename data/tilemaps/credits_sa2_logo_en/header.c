#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_credits_sa2_logo_en[]
    = INCBIN_U16("data/tilemaps/credits_sa2_logo_en/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_credits_sa2_logo_en[]
    = INCBIN_U8("data/tilemaps/credits_sa2_logo_en/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_credits_sa2_logo_en[]
    = INCBIN_U16("data/tilemaps/credits_sa2_logo_en/tilemap.tilemap2");

ALIGNED(4)
const Tilemap credits_sa2_logo_en = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_sa2_logo_en,
    .tilesSize = sizeof(Tiles_credits_sa2_logo_en),
    .palette = Palette_credits_sa2_logo_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_sa2_logo_en) / sizeof(u16),
    .map = Tilemap_credits_sa2_logo_en,
};
