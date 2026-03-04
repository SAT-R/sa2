#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_cream_unlock_3_dlg_en[] = INCPAL("data/tilemaps/storyframe_cream_unlock_3_dlg_en/palette.pal");
const u8 Tiles_storyframe_cream_unlock_3_dlg_en[] = INCBIN_U8("data/tilemaps/storyframe_cream_unlock_3_dlg_en/tiles.4bpp");
const u16 Tilemap_storyframe_cream_unlock_3_dlg_en[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_3_dlg_en/tilemap.tilemap2");

const Tilemap storyframe_cream_unlock_3_dlg_en = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlock_3_dlg_en,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlock_3_dlg_en),
    .palette = Palette_storyframe_cream_unlock_3_dlg_en,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_cream_unlock_3_dlg_en),
    .map = Tilemap_storyframe_cream_unlock_3_dlg_en,
};
