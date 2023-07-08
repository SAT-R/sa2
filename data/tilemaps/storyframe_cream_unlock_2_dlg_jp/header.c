#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_storyframe_cream_unlock_2_dlg_jp[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_2_dlg_jp/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_storyframe_cream_unlock_2_dlg_jp[]
    = INCBIN_U8("data/tilemaps/storyframe_cream_unlock_2_dlg_jp/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_storyframe_cream_unlock_2_dlg_jp[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_2_dlg_jp/tilemap.tilemap2");

ALIGNED(4)
const Tilemap storyframe_cream_unlock_2_dlg_jp = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlock_2_dlg_jp,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlock_2_dlg_jp),
    .palette = Palette_storyframe_cream_unlock_2_dlg_jp,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_cream_unlock_2_dlg_jp) / sizeof(u16),
    .map = Tilemap_storyframe_cream_unlock_2_dlg_jp,
};
