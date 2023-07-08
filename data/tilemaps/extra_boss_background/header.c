#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_extra_boss_background[] = INCBIN_U16("data/tilemaps/extra_boss_background/palette.gbapal");
ALIGNED(4) static const u8 Tiles_extra_boss_background[] = INCBIN_U8("data/tilemaps/extra_boss_background/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_extra_boss_background[] = INCBIN_U16("data/tilemaps/extra_boss_background/tilemap.tilemap2");

ALIGNED(4) const Tilemap extra_boss_background = {
    .xTiles = 32,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_extra_boss_background,
    .tilesSize = sizeof(Tiles_extra_boss_background),
    .palette = Palette_extra_boss_background,
    .palOffset = 0,
    .palLength = sizeof(Palette_extra_boss_background) / sizeof(u16),
    .map = Tilemap_extra_boss_background,
};
