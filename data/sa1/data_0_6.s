	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc" @; for mPtr / mAlignWord

	mSectionRodata

    .global C_DECL(gUnknown_0868B0D4)
C_DECL(gUnknown_0868B0D4):
    .incbin "baserom_sa1.gba", 0x0068B0D4, 0x18

    .global C_DECL(gUnknown_0868B0EC)
C_DECL(gUnknown_0868B0EC):
    .incbin "baserom_sa1.gba", 0x0068B0EC, 0x8

    .global C_DECL(gUnknown_0868B0F4)
C_DECL(gUnknown_0868B0F4):
    .incbin "baserom_sa1.gba", 0x0068B0F4, 0x8

    .global C_DECL(gUnknown_0868B0FC)
C_DECL(gUnknown_0868B0FC):
    .incbin "baserom_sa1.gba", 0x0068B0FC, 0x10
