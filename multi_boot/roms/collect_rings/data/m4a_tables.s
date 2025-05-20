	.section .rodata

    .global gMPlayJumpTableTemplate
gMPlayJumpTableTemplate:
    .incbin "data/rom_data.bin", 0x00015DAC, 0x90

    .global gScaleTable
gScaleTable:
    .incbin "data/rom_data.bin", 0x00015E3C, 0xB4

    .global gFreqTable
gFreqTable:
    .incbin "data/rom_data.bin", 0x00015EF0, 0x30

    .global gPcmSamplesPerVBlankTable
gPcmSamplesPerVBlankTable:
    .incbin "data/rom_data.bin", 0x00015F20, 0x18

    .global gCgbScaleTable
gCgbScaleTable:
    .incbin "data/rom_data.bin", 0x00015F38, 0x84

    .global gCgbFreqTable
gCgbFreqTable:
    .incbin "data/rom_data.bin", 0x00015FBC, 0x18

    .global gNoiseTable
gNoiseTable:
    .incbin "data/rom_data.bin", 0x00015FD4, 0x3C

    .global gCgb3Vol
gCgb3Vol:
    .incbin "data/rom_data.bin", 0x00016010, 0x10

    .global gClockTable
gClockTable:
    .incbin "data/rom_data.bin", 0x00016020, 0x34

    .global gXcmdTable
gXcmdTable:
    .incbin "data/rom_data.bin", 0x00016054, 0xF0

