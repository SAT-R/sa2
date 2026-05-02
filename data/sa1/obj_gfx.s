	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(gObjTiles_4bpp)
C_DECL(gObjTiles_4bpp):
    .include "graphics/sa1/obj_tiles_4bpp.inc"

    .global C_DECL(gObjTiles_8bpp)
C_DECL(gObjTiles_8bpp):
    .include "graphics/sa1/obj_tiles_8bpp.inc"
