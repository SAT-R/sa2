	.section .rodata
    
    .global gUnknown_080D6BF8
gUnknown_080D6BF8:
    .2byte  0 * 60
    .2byte  1 * 60
    .2byte  2 * 60
    .2byte  3 * 60
    .2byte  4 * 60
    .2byte  5 * 60
    .2byte  6 * 60
    .2byte  7 * 60
    .2byte  8 * 60
    .2byte  9 * 60
    .2byte 10 * 60
    .2byte 11 * 60
    .2byte 12 * 60
    .2byte 13 * 60
    .2byte 14 * 60
    .2byte 15 * 60
    .2byte 16 * 60
    .2byte 17 * 60
    .2byte 18 * 60
    .2byte 19 * 60
    .2byte 20 * 60
    .2byte 21 * 60
    .2byte 22 * 60
    .2byte 23 * 60
    .2byte 24 * 60
    .2byte 25 * 60
    .2byte 26 * 60
    .2byte 27 * 60
    .2byte 28 * 60
    .2byte 29 * 60
    .2byte 30 * 60
    .2byte 31 * 60
    .2byte 32 * 60
    .2byte 33 * 60
    .2byte 34 * 60
    .2byte 35 * 60
    .2byte 36 * 60
    .2byte 37 * 60
    .2byte 38 * 60
    .2byte 39 * 60
    .2byte 40 * 60
    .2byte 41 * 60
    .2byte 42 * 60
    .2byte 43 * 60
    .2byte 44 * 60
    .2byte 45 * 60
    .2byte 46 * 60
    .2byte 47 * 60
    .2byte 48 * 60
    .2byte 49 * 60
    .2byte 50 * 60
    .2byte 51 * 60
    .2byte 52 * 60
    .2byte 53 * 60
    .2byte 54 * 60
    .2byte 55 * 60
    .2byte 56 * 60
    .2byte 57 * 60
    .2byte 58 * 60
    .2byte 59 * 60
    .2byte 60 * 60

    .global gUnknown_080D6C72
gUnknown_080D6C72:
    .2byte 0        @ ( Likely ZONE_TIME_TO_INT(0) )
    .2byte 3600     @ ( Likely ZONE_TIME_TO_INT(1) )
    .2byte 7200     @ ( Likely ZONE_TIME_TO_INT(2) )
    .2byte 10800    @ ( Likely ZONE_TIME_TO_INT(3) )
    .2byte 14400    @ ( Likely ZONE_TIME_TO_INT(4) )
    .2byte 18000    @ ( Likely ZONE_TIME_TO_INT(5) )
    .2byte 21600    @ ( Likely ZONE_TIME_TO_INT(6) )
    .2byte 25200    @ ( Likely ZONE_TIME_TO_INT(7) )
    .2byte 28800    @ ( Likely ZONE_TIME_TO_INT(8) )
    .2byte 32400    @ ( Likely ZONE_TIME_TO_INT(9) )
    .2byte 36000    @ ( Likely ZONE_TIME_TO_INT(10) )

    .global gAnimsTrappedAnimals
gAnimsTrappedAnimals:
  @ Zone 1
    .4byte 0xC0
    .4byte 0x20B
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x210
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC8
    .4byte 0x20F
    .4byte 0
    .byte  2, 0, 0, 0

  @ Zone 2
    .4byte 0xC0
    .4byte 0x207
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x20D
    .4byte 0
    .byte  2, 0, 0, 0
    .4byte 0xC8
    .4byte 0x20E
    .4byte 0
    .byte  1, 0, 0, 0

  @ Zone 3
    .4byte 0xC0
    .4byte 0x206
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x205
    .4byte 0
    .byte  2, 0, 0, 0
    .4byte 0xC8
    .4byte 0x208
    .4byte 0
    .byte  1, 0, 0, 0

  @ Zone 4
    .4byte 0xC0
    .4byte 0x20B
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x203
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC8
    .4byte 0x209
    .4byte 0
    .byte  2, 0, 0, 0

  @ Zone 5
    .4byte 0xC0
    .4byte 0x211
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x206
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC8
    .4byte 0x204
    .4byte 0
    .byte  2, 0, 0, 0

  @ Zone 6
    .4byte 0xC0
    .4byte 0x207
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x20C
    .4byte 0
    .byte  2, 0, 0, 0
    .4byte 0xC8
    .4byte 0x20A
    .4byte 0
    .byte  2, 0, 0, 0

  @ Zone 7
    .4byte 0xC0
    .4byte 0x20B
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC4
    .4byte 0x210
    .4byte 0
    .byte  0, 0, 0, 0
    .4byte 0xC8
    .4byte 0x20F
    .4byte 0
    .byte  2, 0, 0, 0

    .global gUnknown_080D6DD8
gUnknown_080D6DD8:
    .4byte sub_802D99C, sub_802D650, sub_802D7FC

    @ Seven unknown x/y positions
    .global gUnknown_080D6DE4
gUnknown_080D6DE4:
    .2byte 3800, 177
    .2byte 11864, 145
    .2byte 16088, 177
    .2byte 21080, 153
    .2byte 27000, 150
    .2byte 36058, 201
    .2byte 40000, 225
