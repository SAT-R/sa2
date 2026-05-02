	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

    mSectionRodata

    .align 2 , 0
    .global C_DECL(gMultiBootProgram_TinyChaoGarden)
C_DECL(gMultiBootProgram_TinyChaoGarden):
    .incbin "baserom_sa1.gba", 0x0009C170, 0x1EDD4
