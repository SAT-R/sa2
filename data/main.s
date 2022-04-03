	.section .rodata

    .align 2, 0

    .global gIntrTableTemplate
gIntrTableTemplate:
    .incbin "baserom.gba", 0x00097A2C, 0x38

    .global gUnknown_08097A64
gUnknown_08097A64:
    .incbin "baserom.gba", 0x00097A64, 0x10
