	.section .rodata

    .global gSpritePalettes @ 0x0816ADC8
gSpritePalettes:
    .include "graphics/obj_palettes.inc"
.size gSpritePalettes, .-gSpritePalettes

    .global gObjTiles_4bpp @ 0x081709A8
gObjTiles_4bpp:
    .include "graphics/obj_tiles_4bpp.inc"
.size gObjTiles_4bpp, .-gObjTiles_4bpp

@ Unlike the first game, Sonic Advance 2 does not use 8-bits-per-pixel object tiles,
@   but the engine does need a dummy-pointer to 8bpp data.
@   Here it would just turn out to be "garbage" data.
    .global gObjTiles_8bpp
gObjTiles_8bpp: @ 0x086E9E08
    @ DUMMY - NO DATA HERE!
.size gObjTiles_8bpp, .-gObjTiles_8bpp
