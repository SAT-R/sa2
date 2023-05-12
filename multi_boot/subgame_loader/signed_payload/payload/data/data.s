	.section .rodata

    .global gIntrTableTemplate
gIntrTableTemplate:
    .incbin "data/rom_data.bin", 0x00001208, 0x34

    .global gUnknown_0203C23C
gUnknown_0203C23C:
    .incbin "data/rom_data.bin", 0x0000123C, 0x44

    .global gUnknown_0203C280
gUnknown_0203C280:
    .incbin "data/rom_data.bin", 0x00001280, 0x224

    .global gUnknown_0203C4A4
gUnknown_0203C4A4:
    .incbin "data/rom_data.bin", 0x000014A4, 0x23A0

    .global gUnknown_0203E844
gUnknown_0203E844:
    .incbin "data/rom_data.bin", 0x00003844, 0x37C

    .global gUnknown_0203EBC0
gUnknown_0203EBC0:
    .incbin "data/rom_data.bin", 0x00003BC0, 0x200

    .global gUnknown_0203EDC0
gUnknown_0203EDC0:
    .incbin "data/rom_data.bin", 0x00003DC0, 0x4A0

    .global gUnknown_0203F260
gUnknown_0203F260:
    .incbin "data/rom_data.bin", 0x00004260, 0x4CC

