    	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(gSpawnPositions)
C_DECL(gSpawnPositions):
    .incbin "baserom_sa1.gba", 0x004ADEF0, 0x48

    .global C_DECL(gSpawnPositions_Modes_4_and_5)
C_DECL(gSpawnPositions_Modes_4_and_5):
    .incbin "baserom_sa1.gba", 0x004ADF38, 0x40

    .global C_DECL(sa2__gUnknown_080D650C)
C_DECL(sa2__gUnknown_080D650C):
    .incbin "baserom_sa1.gba", 0x004ADF78, 0x48

    .global C_DECL(sa2__gUnknown_080D661C)
C_DECL(sa2__gUnknown_080D661C):
    .incbin "baserom_sa1.gba", 0x004ADFC0, 0x48

    .global C_DECL(gPlayerCharacterIdleAnims)
C_DECL(gPlayerCharacterIdleAnims):
    .short 0, 99, 199, 298

    .global C_DECL(sCharStateAnimInfo)
C_DECL(sCharStateAnimInfo):
    .incbin "baserom_sa1.gba", 0x004AE010, 0x178

    .global C_DECL(gUnknown_084AE188)
C_DECL(gUnknown_084AE188):
    .incbin "baserom_sa1.gba", 0x004AE188, 0x12

    .global C_DECL(gUnknown_084AE19A)
C_DECL(gUnknown_084AE19A):
    .incbin "baserom_sa1.gba", 0x004AE19A, 0x12

    .global C_DECL(gCharStatesKnucklesGlideTurn)
C_DECL(gCharStatesKnucklesGlideTurn):
    .byte 0x42, 0x43, 0x44, 0x45

    .global C_DECL(gUnknown_084AE1B0)
C_DECL(gUnknown_084AE1B0):
    .byte 0x8E, 0x01, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x00, 0x00, 0x8F, 0x01, 0x01, 0x00, 0x8F, 0x01, 0x02, 0x00

