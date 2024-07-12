#include "global.h"
#include "core.h"

const u16 Palette_storyframe_tails_unlock_3_dlg_de[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_3_dlg_de/palette.gbapal");
const u8 Tiles_storyframe_tails_unlock_3_dlg_de[] = INCBIN_U8("data/tilemaps/storyframe_tails_unlock_3_dlg_de/tiles.4bpp");
const u16 Tilemap_storyframe_tails_unlock_3_dlg_de[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_3_dlg_de/tilemap.tilemap2");

const Tilemap storyframe_tails_unlock_3_dlg_de = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_tails_unlock_3_dlg_de,
    .tilesSize = sizeof(Tiles_storyframe_tails_unlock_3_dlg_de),
    .palette = Palette_storyframe_tails_unlock_3_dlg_de,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_tails_unlock_3_dlg_de) / sizeof(u16),
    .map = Tilemap_storyframe_tails_unlock_3_dlg_de,
};
