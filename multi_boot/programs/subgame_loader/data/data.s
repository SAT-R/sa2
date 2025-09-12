	.section .rodata
@; TODO: this data needs to be extracted properly
@; it's mostly VRAM data
    .global gUnknown_0203c2a4
gUnknown_0203c2a4:
    .incbin "data/rom_data.bin", 0x000012a4, 0x200

    .global gUnknown_0203C4A4
gUnknown_0203C4A4:
    .incbin "data/rom_data.bin", 0x000014A4, 0x23A0

    .global gUnknown_0203E844
gUnknown_0203E844:
#ifdef JAPAN
    .incbin "data/rom_data_japan.bin", 0x0000384C, 0x37C
#else
    .incbin "data/rom_data.bin", 0x00003844, 0x37C
#endif

    .global gUnknown_0203EBC0
gUnknown_0203EBC0:
    .incbin "data/rom_data.bin", 0x00003BC0, 0x200

    .global gUnknown_0203EDC0
gUnknown_0203EDC0:
    .incbin "data/rom_data.bin", 0x00003DC0, 0x4A0


    .global gUnknown_0203F260
gUnknown_0203F260:
#ifdef JAPAN
    .incbin "data/rom_data_japan.bin", 0x00004268, 0x4CC
#else
    .incbin "data/rom_data.bin", 0x00004260, 0x4CC
#endif
