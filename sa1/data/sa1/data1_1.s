    	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(gMultiboot_087C0258)
C_DECL(gMultiboot_087C0258):
    .incbin "baserom_sa1.gba", 0x007C0258, 0x20A0

    .global C_DECL(gMultiboot_087C22F8)
C_DECL(gMultiboot_087C22F8):
    .incbin "baserom_sa1.gba", 0x007C22F8, 0x8000

    .global C_DECL(gUnknown_087CA2F8)
C_DECL(gUnknown_087CA2F8):
    .incbin "baserom_sa1.gba", 0x007CA2F8, 0x8000
    
    .global C_DECL(gUnknown_087D22F8)
C_DECL(gUnknown_087D22F8):
    .incbin "baserom_sa1.gba", 0x007D22F8, 0x5B88

    .global C_DECL(gCollectRingsBgStageTileset)
C_DECL(gCollectRingsBgStageTileset):
    .incbin "baserom_sa1.gba", 0x007D7E80, 0x8000

    .global C_DECL(gUnknown_087DFE80)
C_DECL(gUnknown_087DFE80):
    .incbin "baserom_sa1.gba", 0x007DFE80, 0x3790

    .global C_DECL(gCollectRingsTilemaps)
C_DECL(gCollectRingsTilemaps):
    .incbin "baserom_sa1.gba", 0x007E3610, 0x8000

    .global C_DECL(gUnknown_087EB610)
C_DECL(gUnknown_087EB610):
    .incbin "baserom_sa1.gba", 0x007EB610, 0x6B18

    .global C_DECL(gUnknown_087F2128)
C_DECL(gUnknown_087F2128):
    .incbin "baserom_sa1.gba", 0x007F2128, 0x67C8

    .global C_DECL(gUnknown_087F88F0)
C_DECL(gUnknown_087F88F0):
    .incbin "baserom_sa1.gba", 0x007F88F0, 0x673C
