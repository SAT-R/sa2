.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

  	.global gUnknown_080D8030
gUnknown_080D8030:
    .incbin "baserom.gba", 0x000D8030, 0x4

    .global gUnknown_080D8034
gUnknown_080D8034:
    .incbin "baserom.gba", 0x000D8034, 0x10

    .global gUnknown_080D8044
gUnknown_080D8044:
    .incbin "baserom.gba", 0x000D8044, 0xA

    .global gUnknown_080D804E
gUnknown_080D804E:
    .incbin "baserom.gba", 0x000D804E, 0x28

    .global gUnknown_080D8076
gUnknown_080D8076:
    .incbin "baserom.gba", 0x000D8076, 0x28

    .global gUnknown_080D809E
gUnknown_080D809E:
    .incbin "baserom.gba", 0x000D809E, 0x28

    .global gUnknown_080D80C6
gUnknown_080D80C6:
    .incbin "baserom.gba", 0x000D80C6, 0x20

    .global gUnknown_080D80E6
gUnknown_080D80E6:
    .incbin "baserom.gba", 0x000D80E6, 0x22

.text
.syntax unified
.arm
