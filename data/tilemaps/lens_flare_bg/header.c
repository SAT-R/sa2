#include "global.h"
#include "core.h"

const u16 Palette_lens_flare_bg[]
    = INCBIN_U16("data/tilemaps/lens_flare_bg/palette.gbapal");
const u8 Tiles_lens_flare_bg[] = INCBIN_U8("data/tilemaps/lens_flare_bg/tiles.4bpp");
const u16 Tilemap_lens_flare_bg[]
    = INCBIN_U16("data/tilemaps/lens_flare_bg/tilemap.tilemap2");

const Tilemap lens_flare_bg = {
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
