#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_cutscene_post_extra_boss_bg[]
    = INCBIN_U16("data/tilemaps/cutscene_post_extra_boss_bg/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_cutscene_post_extra_boss_bg[]
    = INCBIN_U8("data/tilemaps/cutscene_post_extra_boss_bg/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_cutscene_post_extra_boss_bg[]
    = INCBIN_U16("data/tilemaps/cutscene_post_extra_boss_bg/tilemap.tilemap2");

ALIGNED(4)
const Tilemap cutscene_post_extra_boss_bg = {
    .xTiles = 32,
    .yTiles = 64,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_post_extra_boss_bg,
    .tilesSize = sizeof(Tiles_cutscene_post_extra_boss_bg),
    .palette = Palette_cutscene_post_extra_boss_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_cutscene_post_extra_boss_bg) / sizeof(u16),
    .map = Tilemap_cutscene_post_extra_boss_bg,
};
