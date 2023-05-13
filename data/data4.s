	.section .rodata
 
     .align 2
    .global gUnknown_08C882C8
gUnknown_08C882C8:
    .incbin "baserom.gba", 0x00C882C8, 0x140

    .global gUnknown_08C88408
gUnknown_08C88408:
    .incbin "baserom.gba", 0x00C88408, 0x8000

    .global gUnknown_08C90408
gUnknown_08C90408:
    .incbin "baserom.gba", 0x00C90408, 0x1e00

    .global gUnknown_08C92208
gUnknown_08C92208:
    .incbin "baserom.gba", 0x00C92208, 0x8000

    .global unused_gUnknown_08C9A208
unused_gUnknown_08C9A208:
    .incbin "baserom.gba", 0x00C9A208, 0xC558

    .global gUnknown_08CA6760
gUnknown_08CA6760:
    .incbin "baserom.gba", 0x00CA6760, 0x6A7C

    .global gUnknown_08CAD1DC
gUnknown_08CAD1DC:
    .incbin "baserom.gba", 0x00CAD1DC, 0x6fe4


    .global gUnknown_08CB41C0
gUnknown_08CB41C0:
    .incbin "baserom.gba", 0x00CB41C0, 0x6a44

    .global gUnknown_08CBAC04
gUnknown_08CBAC04:
    .incbin "multi_boot/collect_rings/mb_collect_rings.gba.lz"

    .global gUnknown_08CD0728
gUnknown_08CD0728:
    .incbin "baserom.gba", 0x00CD0728, 0x2DDC
