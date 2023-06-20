	.section .rodata

    .global gSpriteTables
gSpriteTables: @ 0x080F40D4
    .4byte gAnimations
    .4byte gSpriteDimensions
    .4byte gSpriteOamData
    .4byte gSpritePalettes
    .4byte gObjTiles_4bpp
    .4byte gObjTiles_8bpp @ 8bpp UNUSED - Read comment below at gObjTiles_8bpp
    
    .include "data/animations/animations.inc"
    .include "data/animations/animations_table.inc"
