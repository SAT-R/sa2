#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_sa2_title_logo_jp[]
    = INCBIN_U16("data/tilemaps/sa2_title_logo_jp/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_sa2_title_logo_jp[]
    = INCBIN_U8("data/tilemaps/sa2_title_logo_jp/tiles.4bpp");
ALIGNED(4)
static const u8 Tilemap_sa2_title_logo_jp[]
    = INCBIN_U8("data/tilemaps/sa2_title_logo_jp/tilemap.tilemap2");

ALIGNED(4)
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
    .palLength = sizeof(Palette_sa2_title_logo_jp) / sizeof(u16),
    .map = (const u16 *)Tilemap_sa2_title_logo_jp,
};
