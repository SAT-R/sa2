.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D7BB0
gUnknown_080D7BB0:
    .incbin "baserom.gba", 0x000D7BB0, 0x18

    .global gUnknown_080D7BC8
gUnknown_080D7BC8:
    .incbin "baserom.gba", 0x000D7BC8, 0x10

    .global sOamOrderIds
sOamOrderIds: @ 0x080D7BD8
    .byte 21, 25, 24, 0

    .global gUnknown_080D7BDC
gUnknown_080D7BDC:
    .2byte 0x1600, 0x0D00, 0xF000

    .global sTotemDiscYs
sTotemDiscYs:
    .2byte 0xE000, 0xD000, 0xC000
    
    .global gUnknown_080D7BE8
gUnknown_080D7BE8:
    .incbin "baserom.gba", 0x000D7BE8, 0x290

    .global gUnknown_080D7E78
gUnknown_080D7E78:
    .4byte gUnknown_080D7BE8 + 0*0x40
    .4byte gUnknown_080D7BE8 + 1*0x40
    .4byte gUnknown_080D7BE8 + 2*0x40
    .4byte gUnknown_080D7BE8 + 3*0x40
    .4byte gUnknown_080D7BE8 + 4*0x40
    .4byte gUnknown_080D7BE8 + 5*0x40 - 0x8
    .4byte gUnknown_080D7BE8 + 6*0x40 - 0x10
    .4byte gUnknown_080D7BE8 + 7*0x40 + 0x8
    .4byte gUnknown_080D7BE8 + 8*0x40 + 0x10
    .4byte gUnknown_080D7BE8 + 9*0x40 + 0x10

    .global gUnknown_080D7EA0
gUnknown_080D7EA0:
    .incbin "baserom.gba", 0x000D7EA0, 0x34

    .global gUnknown_080D7ED4
gUnknown_080D7ED4:
    .4byte gUnknown_080D7EA0 + 0*3
    .4byte gUnknown_080D7EA0 + 1*3
    .4byte gUnknown_080D7EA0 + 2*3
    .4byte gUnknown_080D7EA0 + 3*3
    .4byte gUnknown_080D7EA0 + 4*3
    .4byte gUnknown_080D7EA0 + 5*3
    .4byte gUnknown_080D7EA0 + 6*3
    .4byte gUnknown_080D7EA0 + 7*3
    .4byte gUnknown_080D7EA0 + 8*3
    .4byte gUnknown_080D7EA0 + 9*3
    .4byte gUnknown_080D7EA0 + 10*3
    .4byte gUnknown_080D7EA0 + 11*3
    .4byte gUnknown_080D7EA0 + 12*3
    .4byte gUnknown_080D7EA0 + 13*3 + 0x2
    .4byte gUnknown_080D7EA0 + 14*3 + 0x4

    .global gUnknown_080D7F10
gUnknown_080D7F10:
    .byte 14, 14, 8, 0

    .global gUnknown_080D7F14
gUnknown_080D7F14:
    .incbin "graphics/boss_3_a.gbapal"
    .incbin "graphics/boss_3_b.gbapal"

.text
.syntax unified
.arm
