    	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .space 0x100

    .global C_DECL(gDemoRecordings)
C_DECL(gDemoRecordings):
    mPtr demo1
    mPtr demo2
    mPtr demo3
    mPtr demo4

    .global C_DECL(gUnknown_087BF8DC)
C_DECL(gUnknown_087BF8DC):
    mPtr C_DECL(gUnknown_08487358)
    mPtr C_DECL(gUnknown_08487BBC)
    mPtr C_DECL(gUnknown_0848872C)
    mPtr C_DECL(gUnknown_08489308)
    mPtr C_DECL(gUnknown_08489F5C)
    mPtr C_DECL(gUnknown_0848ADB4)
    mPtr C_DECL(gUnknown_0848BA80)
    .ascii "CODRED\0\0"
    .ascii "NIMDA \0\0"
    .ascii "CIRCAM\0\0"
    .ascii "HAPTIM\0\0"

@@@
@@@ Compressed Input-recordings for Demo playback
@@@
    @ src/data/sa1/recordings.c:static const u8 demo1[]
    .global demo1
demo1:
    .incbin "baserom_sa1.gba", 0x007BF918, 0x1F8

    @ src/data/sa1/recordings.c:static const u8 demo2[]
    .global demo2
demo2:
    .incbin "baserom_sa1.gba", 0x007BFB10, 0x200

    @ src/data/sa1/recordings.c:static const u8 demo4[]
    @ NOTE: Ice Mountain data comes before Casino Paradise!
    .global demo4
demo4:
    .incbin "baserom_sa1.gba", 0x007BFD10, 0x208

    @ src/data/sa1/recordings.c:static const u8 demo3[]
    .global demo3
demo3:
    .incbin "baserom_sa1.gba", 0x007BFF18, 0x200
