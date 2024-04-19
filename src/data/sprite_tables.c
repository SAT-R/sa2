#include "data/sprite_data.h"

extern const u8 gObjTiles_4bpp[];
extern const u8 gObjTiles_8bpp[];

const struct SpriteTables gSpriteTables = {
     gAnimations,
     gSpriteDimensions,
     (const u16**const)gSpriteOamData,
     gSpritePalettes,
     gObjTiles_4bpp,
     gObjTiles_8bpp
};
