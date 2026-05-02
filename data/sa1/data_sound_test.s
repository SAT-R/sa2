	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(sSoundTestSongIds)
C_DECL(sSoundTestSongIds): @ 0x0868B078
    .incbin "baserom_sa1.gba", 0x0068B078, 0x54
