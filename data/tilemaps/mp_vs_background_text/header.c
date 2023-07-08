#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_mp_vs_background_text[] = INCBIN_U16("data/tilemaps/mp_vs_background_text/palette.gbapal");
ALIGNED(4) static const u8 Tiles_mp_vs_background_text[] = INCBIN_U8("data/tilemaps/mp_vs_background_text/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_mp_vs_background_text[] = INCBIN_U16("data/tilemaps/mp_vs_background_text/tilemap.tilemap2");

ALIGNED(4) const Tilemap mp_vs_background_text = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_vs_background_text,
    .tilesSize = sizeof(Tiles_mp_vs_background_text),
    .palette = Palette_mp_vs_background_text,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_vs_background_text) / sizeof(u16),
    .map = Tilemap_mp_vs_background_text,
};
