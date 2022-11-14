	.section .rodata
    
    .global gUnknown_SoundsData
gUnknown_SoundsData:
    .incbin "data/rom_data.bin", 0x00019D30, 0x744

    .global gMPlayTable
gMPlayTable:
    .incbin "data/rom_data.bin", 0x0001A474, 0x30

    .global gSongTable
gSongTable:
    .incbin "data/rom_data.bin", 0x0001A4A4, 0x5460
