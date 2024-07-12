#include "global.h"
#include "core.h"

const u16 Palette_storyframe_tails_unlock_1_dlg_es[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_1_dlg_es/palette.gbapal");
const u8 Tiles_storyframe_tails_unlock_1_dlg_es[] = INCBIN_U8("data/tilemaps/storyframe_tails_unlock_1_dlg_es/tiles.4bpp");
const u16 Tilemap_storyframe_tails_unlock_1_dlg_es[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_1_dlg_es/tilemap.tilemap2");

const Tilemap storyframe_tails_unlock_1_dlg_es = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_tails_unlock_1_dlg_es,
    .tilesSize = sizeof(Tiles_storyframe_tails_unlock_1_dlg_es),
    .palette = Palette_storyframe_tails_unlock_1_dlg_es,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_tails_unlock_1_dlg_es) / sizeof(u16),
    .map = Tilemap_storyframe_tails_unlock_1_dlg_es,
};
