	.section .rodata

.global gUnknown_02016144
    .incbin "data/rom_data.bin", 0x00016144, 0xB58

    .global gMPlayTable
gMPlayTable:
    .incbin "data/rom_data.bin", 0x00016C9C, 0x30

    .global gSongTable
gSongTable:
    .incbin "data/rom_data.bin", 0x00016CCC, 0x5A34

    .global gUnknown_0201C7C0
gUnknown_0201C7C0:
    .incbin "data/rom_data.bin", 0x0001C700, 0x46C
