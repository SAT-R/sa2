#include "global.h"
#include "core.h"

const ColorRaw Palette_extra_boss_cockpit[] = INCPAL("data/tilemaps/extra_boss_cockpit/palette.pal");
const u8 Tiles_extra_boss_cockpit[] = INCBIN_U8("data/tilemaps/extra_boss_cockpit/tiles.4bpp");
const u8 Tilemap_extra_boss_cockpit[] = INCBIN_U8("data/tilemaps/extra_boss_cockpit/tilemap.tilemap2");

const Tilemap extra_boss_cockpit = {
    .xTiles = 10,
    .yTiles = 9,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_extra_boss_cockpit,
    .tilesSize = sizeof(Tiles_extra_boss_cockpit),
    .palette = Palette_extra_boss_cockpit,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_extra_boss_cockpit),
    .map = (const u16 *)Tilemap_extra_boss_cockpit,
};
