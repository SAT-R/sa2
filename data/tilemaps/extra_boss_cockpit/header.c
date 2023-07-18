#include "global.h"
#include "core.h"

const u16 Palette_extra_boss_cockpit[]
    = INCBIN_U16("data/tilemaps/extra_boss_cockpit/palette.gbapal");
const u8 Tiles_extra_boss_cockpit[]
    = INCBIN_U8("data/tilemaps/extra_boss_cockpit/tiles.4bpp");
const u8 Tilemap_extra_boss_cockpit[]
    = INCBIN_U8("data/tilemaps/extra_boss_cockpit/tilemap.tilemap2");

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
    .palLength = sizeof(Palette_extra_boss_cockpit) / sizeof(u16),
    .map = (const u16 *)Tilemap_extra_boss_cockpit,
};
