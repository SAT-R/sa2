#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_storyframe_cream_unlock_3_dlg_fr[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_3_dlg_fr/palette.gbapal");
ALIGNED(4) static const u8 Tiles_storyframe_cream_unlock_3_dlg_fr[] = INCBIN_U8("data/tilemaps/storyframe_cream_unlock_3_dlg_fr/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_storyframe_cream_unlock_3_dlg_fr[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_3_dlg_fr/tilemap.tilemap2");

ALIGNED(4) const Tilemap storyframe_cream_unlock_3_dlg_fr = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlock_3_dlg_fr,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlock_3_dlg_fr),
    .palette = Palette_storyframe_cream_unlock_3_dlg_fr,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_cream_unlock_3_dlg_fr) / sizeof(u16),
    .map = Tilemap_storyframe_cream_unlock_3_dlg_fr,
};
