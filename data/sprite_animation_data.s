.include "asm/macros/c_decl.inc"

.section .rodata

@ TODO: move these into C files in src/data?
    .global C_DECL(gSpritePalettes) @ 0x0816ADC8
C_DECL(gSpritePalettes):
    .include "graphics/obj_palettes.inc"

    .global C_DECL(gObjTiles_4bpp) @ 0x081709A8
C_DECL(gObjTiles_4bpp):
    .include "graphics/obj_tiles_4bpp.inc"

@ Unlike the first game, Sonic Advance 2 does not use 8-bits-per-pixel object tiles,
@   but the engine does need a dummy-pointer to 8bpp data!
@   Here it would just turn out to be "garbage" data.
    .global C_DECL(gObjTiles_8bpp)
C_DECL(gObjTiles_8bpp): @ 0x086E9E08
    @ DUMMY - NO DATA HERE!
