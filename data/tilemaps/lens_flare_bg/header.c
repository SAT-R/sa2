#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_lens_flare_bg[] = INCBIN_U16("data/tilemaps/lens_flare_bg/palette.gbapal");
ALIGNED(4) static const u8 Tiles_lens_flare_bg[] = INCBIN_U8("data/tilemaps/lens_flare_bg/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_lens_flare_bg[] = INCBIN_U16("data/tilemaps/lens_flare_bg/tilemap.tilemap2");

ALIGNED(4) const Tilemap lens_flare_bg = {
    .xTiles = 7,
    .yTiles = 16,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_lens_flare_bg,
    .tilesSize = sizeof(Tiles_lens_flare_bg),
    .palette = Palette_lens_flare_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_lens_flare_bg) / sizeof(u16),
    .map = Tilemap_lens_flare_bg,
};
