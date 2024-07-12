#include "global.h"
#include "core.h"

const u16 Palette_storyframe_knuckles_unlock_3_dlg_en[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlock_3_dlg_en/palette.gbapal");
const u8 Tiles_storyframe_knuckles_unlock_3_dlg_en[] = INCBIN_U8("data/tilemaps/storyframe_knuckles_unlock_3_dlg_en/tiles.4bpp");
const u16 Tilemap_storyframe_knuckles_unlock_3_dlg_en[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlock_3_dlg_en/tilemap.tilemap2");

const Tilemap storyframe_knuckles_unlock_3_dlg_en = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_knuckles_unlock_3_dlg_en,
    .tilesSize = sizeof(Tiles_storyframe_knuckles_unlock_3_dlg_en),
    .palette = Palette_storyframe_knuckles_unlock_3_dlg_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_knuckles_unlock_3_dlg_en) / sizeof(u16),
    .map = Tilemap_storyframe_knuckles_unlock_3_dlg_en,
};
