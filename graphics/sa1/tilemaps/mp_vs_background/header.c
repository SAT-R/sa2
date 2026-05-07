#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_vs_background[] = INCPAL("graphics/sa1/tilemaps/mp_vs_background/palette.pal");
const u8 Tiles_mp_vs_background[] = INCBIN_U8("graphics/sa1/tilemaps/mp_vs_background/tiles.4bpp");
const u8 Tilemap_mp_vs_background[] = INCBIN_U8("graphics/sa1/tilemaps/mp_vs_background/tilemap.tilemap2");

const Tilemap mp_vs_background = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_vs_background,
    .tilesSize = sizeof(Tiles_mp_vs_background),
    .palette = Palette_mp_vs_background,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_vs_background) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_vs_background,
};
