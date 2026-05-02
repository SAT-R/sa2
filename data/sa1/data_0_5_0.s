	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(gMillisUnpackTable)
C_DECL(gMillisUnpackTable):
    .incbin "baserom_sa1.gba", 0x0065EFF4, 0x78

    .global C_DECL(gSecondsTable)
C_DECL(gSecondsTable):
    .incbin "baserom_sa1.gba", 0x0065F06C, 0x78

    .global C_DECL(sZoneTimeSecondsTable)
C_DECL(sZoneTimeSecondsTable):
    .incbin "baserom_sa1.gba", 0x0065F0E4, 0x7A

    .global C_DECL(sZoneTimeMinutesTable)
C_DECL(sZoneTimeMinutesTable):
    .incbin "baserom_sa1.gba", 0x0065F15E, 0x16

    .global C_DECL(gUnknown_0865F174)
C_DECL(gUnknown_0865F174):
    .incbin "baserom_sa1.gba", 0x0065F174, 0x4

    .global C_DECL(gUnknown_0865F178)
C_DECL(gUnknown_0865F178):
    .incbin "baserom_sa1.gba", 0x0065F178, 0x4
