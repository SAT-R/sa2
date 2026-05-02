	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

    mSectionRodata

    @ "graphics/sa1/tilemaps/mp_multipak_player_overview/header.c"

    .global C_DECL(gUnknown_084ADA08)
C_DECL(gUnknown_084ADA08):
    .incbin "baserom_sa1.gba", 0x004ADA08, 0x2

    .global C_DECL(gUnknown_084ADA0A)
C_DECL(gUnknown_084ADA0A):
    .incbin "baserom_sa1.gba", 0x004ADA0A, 0x4

    .global C_DECL(gUnknown_084ADA0E)
C_DECL(gUnknown_084ADA0E):
    .incbin "baserom_sa1.gba", 0x004ADA0E, 0x2

    .global C_DECL(gUnknown_084ADA10)
C_DECL(gUnknown_084ADA10):
    .incbin "baserom_sa1.gba", 0x004ADA10, 0xA
