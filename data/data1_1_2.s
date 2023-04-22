	.section .rodata
    
    .global gUnknown_080D6BF8
gUnknown_080D6BF8:
    .incbin "baserom.gba", 0x000D6BF8, 0x7A

    .global gUnknown_080D6C72
gUnknown_080D6C72:
    .incbin "baserom.gba", 0x000D6C72, 0x16

    .global gUnknown_080D6C88
gUnknown_080D6C88:
    .incbin "baserom.gba", 0x000D6C88, 0x150

    .global gUnknown_080D6DD8
gUnknown_080D6DD8:
    .incbin "baserom.gba", 0x000D6DD8, 0xC

    .global gUnknown_080D6DE4
gUnknown_080D6DE4:
    .incbin "baserom.gba", 0x000D6DE4, 0x1C

    .global gUnknown_080D6E00
gUnknown_080D6E00:
    .incbin "baserom.gba", 0x000D6E00, 0x1E

    .global gUnknown_080D6E1E
gUnknown_080D6E1E:
    .incbin "baserom.gba", 0x000D6E1E, 0xF0

    .global gUnknown_080D6F0E
gUnknown_080D6F0E:
    .incbin "baserom.gba", 0x000D6F0E, 0x36

    .global gUnknown_080D6F44
gUnknown_080D6F44:
    .incbin "baserom.gba", 0x000D6F44, 0x3C

    .global gUnknown_080D6F80
gUnknown_080D6F80:
    .incbin "baserom.gba", 0x000D6F80, 0x20

    .global gUnknown_080D6FA0
gUnknown_080D6FA0:
    .incbin "baserom.gba", 0x000D6FA0, 0x28

    .global gUnknown_080D6FC8
gUnknown_080D6FC8:
    .incbin "baserom.gba", 0x000D6FC8, 0x28

    .global gUnknown_080D6FF0
gUnknown_080D6FF0:
    .incbin "baserom.gba", 0x000D6FF0, 0x5

    .global gUnknown_080D6FF5
gUnknown_080D6FF5:
    .incbin "baserom.gba", 0x000D6FF5, 0x2

    .global gUnknown_080D6FF7
gUnknown_080D6FF7:
    .incbin "baserom.gba", 0x000D6FF7, 0x11F

    @ Colors [NUM_CHARACTERS]
    .global gUnknown_080D7116
gUnknown_080D7116:
    .2byte 0x7C00
    .2byte 0x025F
    .2byte 0x037F
    .2byte 0x007F
    .2byte 0x563F

    .global gUnknown_080D7120
gUnknown_080D7120:
    .2byte 132, 97
    .2byte 153, 101
    .2byte 174, 105
    .2byte 196, 109

    .global gUnknown_080D7130
gUnknown_080D7130:
    .2byte 10, -8
    .2byte  6, -4
    .2byte  2,  0

    .global gUnknown_080D713C
gUnknown_080D713C:
    .2byte 24, 1121, 0
    .2byte 27, 1121, 4
    .2byte 24, 1121, 1
    .2byte 27, 1121, 2
    .2byte 18, 1121, 3

    .global gUnknown_080D715A
gUnknown_080D715A:
    .2byte 28, 1122, 0
    .2byte 36, 1122, 1
    .2byte 0, 0, 0
    .2byte 0, 0, 0
    .2byte 0, 0, 0

    .global gUnknown_080D7178
gUnknown_080D7178:
    .2byte 14, 1123, 0
    .2byte 14, 1123, 1
    .2byte 18, 1123, 4
    .2byte 18, 1123, 5
    .2byte 18, 1123, 6
    .2byte 18, 1123, 7
    .2byte 18, 1123, 8
    .2byte 18, 1123, 9
    .2byte 18, 1123, 10
    .2byte 16, 1123, 2
    .2byte 16, 1123, 3

    .global gUnknown_080D71BA
gUnknown_080D71BA:
    .2byte 26, 1124

    .global gUnknown_080D71BE
gUnknown_080D71BE:
    .2byte 0            @ Time Bonus
    .2byte 26, 1124, 1  @ Ring Bonus
    .2byte 26, 1124, 2  @ Spring Bonus

    .global gUnknown_080D71CC
gUnknown_080D71CC:
    .2byte 0, 69, 173, 0
