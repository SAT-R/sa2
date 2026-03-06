#include "global.h"
#include "core.h"

const ColorRaw Palette_music_plant_moving_stars[] = INCPAL("data/tilemaps/music_plant_moving_stars/palette.pal");
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
    .palLength = ARRAY_COUNT(Palette_music_plant_moving_stars),
    .map = Tilemap_music_plant_moving_stars,
};
