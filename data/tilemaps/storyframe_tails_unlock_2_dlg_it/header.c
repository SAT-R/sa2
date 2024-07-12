#include "global.h"
#include "core.h"

const u16 Palette_storyframe_tails_unlock_2_dlg_it[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_2_dlg_it/palette.gbapal");
const u8 Tiles_storyframe_tails_unlock_2_dlg_it[] = INCBIN_U8("data/tilemaps/storyframe_tails_unlock_2_dlg_it/tiles.4bpp");
const u16 Tilemap_storyframe_tails_unlock_2_dlg_it[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_2_dlg_it/tilemap.tilemap2");

const Tilemap storyframe_tails_unlock_2_dlg_it = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_tails_unlock_2_dlg_it,
    .tilesSize = sizeof(Tiles_storyframe_tails_unlock_2_dlg_it),
    .palette = Palette_storyframe_tails_unlock_2_dlg_it,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_tails_unlock_2_dlg_it) / sizeof(u16),
    .map = Tilemap_storyframe_tails_unlock_2_dlg_it,
};
