    .section .rodata

    @; These functions control the character when they enter
    @; one of the trumpets(/horns(?)) or pipes in Music Plant.
    .global sPipeHandlers
sPipeHandlers: @ 0x80DFCB0
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
