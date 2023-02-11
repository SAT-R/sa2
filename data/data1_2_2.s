    .section .rodata

    @; These functions control the character when they enter
    @; one of the trumpets(/horns(?)) or pipes in Music Plant.
    .global gUnknown_080DFCB0
gUnknown_080DFCB0:
    .4byte Handler_MusicPlant_Pipe_0, Handler_MusicPlant_Pipe_1, Handler_MusicPlant_Pipe_2, Handler_MusicPlant_Pipe_3
    .4byte Handler_MusicPlant_Pipe_4, Handler_MusicPlant_Pipe_5, Handler_MusicPlant_Pipe_6, Handler_MusicPlant_Pipe_7
    .4byte Handler_MusicPlant_Pipe_8, Handler_MusicPlant_Pipe_9, Handler_MusicPlant_Pipe_10, 0
    .4byte 0, 0, 0, 0
    
    .global gUnknown_080DFCF0
gUnknown_080DFCF0:
    .incbin "baserom.gba", 0x000DFCF0, 0x50
    
    .global gUnknown_080DFD40
gUnknown_080DFD40:
    .incbin "baserom.gba", 0x000DFD40, 0x58
    
    .global gUnknown_080DFD98
gUnknown_080DFD98:
    .incbin "baserom.gba", 0x000DFD98, 0x40
    
    .global gUnknown_080DFDD8
gUnknown_080DFDD8:
    .incbin "baserom.gba", 0x000DFDD8, 0x58

    .global gUnknown_080DFE30
gUnknown_080DFE30:
    .incbin "baserom.gba", 0x000DFE30, 0x60
    
    .global gUnknown_080DFE90
gUnknown_080DFE90:
    .incbin "baserom.gba", 0x000DFE90, 0x24

    .global gUnknown_080DFEB4
gUnknown_080DFEB4:
    .incbin "baserom.gba", 0x000DFEB4, 0x1C

    .global gUnknown_080DFED0
gUnknown_080DFED0:
    .incbin "baserom.gba", 0x000DFED0, 0x14
    
    .global gUnknown_080DFEE4
gUnknown_080DFEE4:
    .incbin "baserom.gba", 0x000DFEE4, 0x58

    .global gUnknown_080DFF3C
gUnknown_080DFF3C:
    .incbin "baserom.gba", 0x000DFF3C, 0x60
    
    .global gUnknown_080DFF9C
gUnknown_080DFF9C:
    .incbin "baserom.gba", 0x000DFF9C, 0x58
    
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
