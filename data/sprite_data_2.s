	.section .rodata

    .global gUnknown_0814E378 @ 0x0814E378
 gUnknown_0814E378:
    .incbin "baserom.gba", 0x0014E378, 0x1B89C
.size gUnknown_0814E378, .-gUnknown_0814E378
    

@; NOTE(Jace): As the name suggests, the data pointed to
@;             is using the exact same layout
@;             as the OAM memory in the GBA.
@;             IIRC this is used for layouting bigger sprites.
    .global gSpriteOamData @ 0x08169C14
gSpriteOamData:
    .incbin "baserom.gba", 0x00169C14, 0x11B4
.size gSpriteOamData, .-gSpriteOamData

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
