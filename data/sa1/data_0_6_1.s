	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc" @; for mPtr / mAlignWord

	mSectionRodata

    .align 2, 0
    .global C_DECL(gUnknown_0868B684)
C_DECL(gUnknown_0868B684):
    .incbin "baserom_sa1.gba", 0x0068B684, 0x10

    .global C_DECL(gUnknown_0868B694)
C_DECL(gUnknown_0868B694):
    .incbin "baserom_sa1.gba", 0x0068B694, 0x8

    .global C_DECL(gUnknown_0868B69C)
C_DECL(gUnknown_0868B69C):
    .incbin "baserom_sa1.gba", 0x0068B69C, 0x4

    .global C_DECL(gUnknown_0868B6A0)
C_DECL(gUnknown_0868B6A0):
    .incbin "baserom_sa1.gba", 0x0068B6A0, 0x18

    .global C_DECL(gUnknown_0868B6B8)
C_DECL(gUnknown_0868B6B8):
    .incbin "baserom_sa1.gba", 0x0068B6B8, 0xC

    .global C_DECL(gUnknown_0868B6C4)
C_DECL(gUnknown_0868B6C4):
    mPtr C_DECL(ApplyGameStageSettingsAndStart)
    mPtr C_DECL(sub_806A66C)
    mPtr C_DECL(sub_806A680)
    mPtr C_DECL(sub_806A68C)

@ Edit Language Screen - Data Start
    .global C_DECL(gUnknown_0868B6D4)
C_DECL(gUnknown_0868B6D4):
    .incbin "baserom_sa1.gba", 0x0068B6D4, 0x18

    .global C_DECL(gUnknown_0868B6EC)
C_DECL(gUnknown_0868B6EC):
    .incbin "baserom_sa1.gba", 0x0068B6EC, 0x18

    .global C_DECL(gUnknown_0868B704)
C_DECL(gUnknown_0868B704):
    .incbin "baserom_sa1.gba", 0x0068B704, 0xC

    .global C_DECL(gUnknown_0868B710)
C_DECL(gUnknown_0868B710):
    .incbin "baserom_sa1.gba", 0x0068B710, 0xC

    .global C_DECL(gUnknown_0868B71C)
C_DECL(gUnknown_0868B71C):
    .incbin "baserom_sa1.gba", 0x0068B71C, 0x6

    .global C_DECL(gUnknown_0868B722)
C_DECL(gUnknown_0868B722):
    .incbin "baserom_sa1.gba", 0x0068B722, 0x6

    .global C_DECL(gUnknown_0868B728)
C_DECL(gUnknown_0868B728):
    .incbin "baserom_sa1.gba", 0x0068B728, 0x1

    .global C_DECL(gUnknown_0868B729)
C_DECL(gUnknown_0868B729):
    .incbin "baserom_sa1.gba", 0x0068B729, 0xB

    .global C_DECL(gUnknown_0868B734)
C_DECL(gUnknown_0868B734):
    .incbin "baserom_sa1.gba", 0x0068B734, 0x24

    mAlignWord
    .global C_DECL(sLangScreenReturnProcs)
C_DECL(sLangScreenReturnProcs):
    mPtr C_DECL(CreateOptionsMenu)
    mPtr C_DECL(CreateSegaLogo)

    .global C_DECL(gUnknown_0868B760)
C_DECL(gUnknown_0868B760):
    .incbin "baserom_sa1.gba", 0x0068B760, 0xC

@ Edit Language Screen - Data End

    .global C_DECL(gUnknown_0868B76C)
C_DECL(gUnknown_0868B76C):
    .incbin "baserom_sa1.gba", 0x0068B76C, 0xC

    .global C_DECL(gUnknown_0868B778)
C_DECL(gUnknown_0868B778):
    .incbin "baserom_sa1.gba", 0x0068B778, 0x6

    .global C_DECL(gUnknown_0868B77E)
C_DECL(gUnknown_0868B77E):
    .incbin "baserom_sa1.gba", 0x0068B77E, 0x4

    .global C_DECL(gUnknown_0868B782)
C_DECL(gUnknown_0868B782):
    .incbin "baserom_sa1.gba", 0x0068B782, 0x4

    .global C_DECL(gUnknown_0868B786)
C_DECL(gUnknown_0868B786):
    .incbin "baserom_sa1.gba", 0x0068B786, 0x4

    .global C_DECL(gUnknown_0868B78A)
C_DECL(gUnknown_0868B78A):
    .incbin "baserom_sa1.gba", 0x0068B78A, 0x1

    .global C_DECL(gUnknown_0868B78B)
C_DECL(gUnknown_0868B78B):
    .incbin "baserom_sa1.gba", 0x0068B78B, 0x5

    .global C_DECL(gUnknown_0868B790)
C_DECL(gUnknown_0868B790):
    .incbin "baserom_sa1.gba", 0x0068B790, 0x4
