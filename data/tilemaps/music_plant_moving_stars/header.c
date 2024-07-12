#include "global.h"
#include "core.h"

const u16 Palette_music_plant_moving_stars[] = INCBIN_U16("data/tilemaps/music_plant_moving_stars/palette.gbapal");
const u8 Tiles_music_plant_moving_stars[] = INCBIN_U8("data/tilemaps/music_plant_moving_stars/tiles.4bpp");
const u16 Tilemap_music_plant_moving_stars[] = INCBIN_U16("data/tilemaps/music_plant_moving_stars/tilemap.tilemap2");

const Tilemap music_plant_moving_stars = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_music_plant_moving_stars,
    .tilesSize = sizeof(Tiles_music_plant_moving_stars),
    .palette = Palette_music_plant_moving_stars,
    .palOffset = 0,
    .palLength = sizeof(Palette_music_plant_moving_stars) / sizeof(u16),
    .map = Tilemap_music_plant_moving_stars,
};
