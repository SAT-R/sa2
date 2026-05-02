	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(gUnknown_0868403C)
C_DECL(gUnknown_0868403C):
    .incbin "baserom_sa1.gba", 0x0068403C, 0x800

    .global C_DECL(gUnknown_0868483C)
C_DECL(gUnknown_0868483C):
    .incbin "baserom_sa1.gba", 0x0068483C, 0x500

    .global C_DECL(gUnknown_08684D3C)
C_DECL(gUnknown_08684D3C):
    .incbin "baserom_sa1.gba", 0x00684D3C, 0x1000

    .global C_DECL(gUnknown_08685D3C)
C_DECL(gUnknown_08685D3C):
    .incbin "baserom_sa1.gba", 0x00685D3C, 0x800

    .global C_DECL(gUnknown_0868653C)
C_DECL(gUnknown_0868653C):
    .incbin "baserom_sa1.gba", 0x0068653C, 0x1600
