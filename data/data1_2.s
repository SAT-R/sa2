    .section .rodata

    .global gUnknown_080DFBF0
gUnknown_080DFBF0:
    .incbin "baserom.gba", 0x000DFBF0, 0x30

    .global gUnknown_080DFC20
gUnknown_080DFC20:
    .incbin "baserom.gba", 0x000DFC20, 0x10

    .global gUnknown_080DFC30
gUnknown_080DFC30:
    .incbin "baserom.gba", 0x000DFC30, 0x10

    .global gUnknown_080DFC40
gUnknown_080DFC40:
    .incbin "baserom.gba", 0x000DFC40, 0x2A

    .global gUnknown_080DFC6A
gUnknown_080DFC6A:
    .incbin "baserom.gba", 0x000DFC6A, 0xE

    .global gUnknown_080DFC78
gUnknown_080DFC78:
    .incbin "baserom.gba", 0x000DFC78, 0x10

    .global gUnknown_080DFC88
gUnknown_080DFC88:
    .incbin "baserom.gba", 0x000DFC88, 0xC

    .global gUnknown_080DFC94
gUnknown_080DFC94:
    .incbin "baserom.gba", 0x000DFC94, 0xC

    @ These might be Q_8_8 values, actually.
    .global gUnknown_080DFCA0
gUnknown_080DFCA0:
    .2byte 0x700, 0x800, 0x900, 0xA00

    .global gUnknown_080DFCA8
gUnknown_080DFCA8:
    .2byte 0x146 @ SE_MUSIC_PLANT_FLUTE_1
    .2byte 0x147 @ SE_MUSIC_PLANT_FLUTE_2
    .2byte 0x148 @ SE_MUSIC_PLANT_FLUTE_3
    .2byte 0x149 @ SE_MUSIC_PLANT_FLUTE_4

    @; These functions control the character when they enter
    @; one of the trumpets(/horns(?)) or pipes in Music Plant.
    .global gUnknown_080DFCB0
gUnknown_080DFCB0:
    .4byte Handler_MusicPlant_Pipe_0, Handler_MusicPlant_Pipe_1, Handler_MusicPlant_Pipe_2, Handler_MusicPlant_Pipe_3
    .4byte Handler_MusicPlant_Pipe_4, Handler_MusicPlant_Pipe_5, Handler_MusicPlant_Pipe_6, Handler_MusicPlant_Pipe_7
    .4byte Handler_MusicPlant_Pipe_8, Handler_MusicPlant_Pipe_9, Handler_MusicPlant_Pipe_10
    .incbin "baserom.gba", 0x000DFCDC, 0x1B4

    .global gUnknown_080DFE90
gUnknown_080DFE90:
    .incbin "baserom.gba", 0x000DFE90, 0x24

    .global gUnknown_080DFEB4
gUnknown_080DFEB4:
    .incbin "baserom.gba", 0x000DFEB4, 0x1C

    .global gUnknown_080DFED0
gUnknown_080DFED0:
    .incbin "baserom.gba", 0x000DFED0, 0x124

    .global gUnknown_080DFFF4
gUnknown_080DFFF4:
    .incbin "baserom.gba", 0x000DFFF4, 0xC

    .global gUnknown_080E0000
gUnknown_080E0000:
    .incbin "baserom.gba", 0x000E0000, 0x8

    .global gUnknown_080E0008
gUnknown_080E0008:
    .incbin "baserom.gba", 0x000E0008, 0x12

    .global gUnknown_080E001A
gUnknown_080E001A:
    .incbin "baserom.gba", 0x000E001A, 0x18

    .global gUnknown_080E0032
gUnknown_080E0032:
    .incbin "baserom.gba", 0x000E0032, 0x6

    .global gUnknown_080E0038
gUnknown_080E0038:
    .incbin "baserom.gba", 0x000E0038, 0xC

    .global gUnknown_080E0044
gUnknown_080E0044:
    .incbin "baserom.gba", 0x000E0044, 0x10

    .global gUnknown_080E0054
gUnknown_080E0054:
    .incbin "baserom.gba", 0x000E0054, 0x10

    .global gUnknown_080E0064
gUnknown_080E0064:
    .incbin "baserom.gba", 0x000E0064, 0x8

    .global gUnknown_080E006C
gUnknown_080E006C:
    .incbin "baserom.gba", 0x000E006C, 0x48

    .global gUnknown_080E00B4
gUnknown_080E00B4:
    .incbin "baserom.gba", 0x000E00B4, 0x20

    .global gUnknown_080E00D4
gUnknown_080E00D4:
    .incbin "baserom.gba", 0x000E00D4, 0x28

    .global gUnknown_080E00FC
gUnknown_080E00FC:
    .incbin "baserom.gba", 0x000E00FC, 0x28

    .global gUnknown_080E0124
gUnknown_080E0124:
    .incbin "baserom.gba", 0x000E0124, 0x12

    .global gUnknown_080E0136
gUnknown_080E0136:
    .incbin "baserom.gba", 0x000E0136, 0xA
