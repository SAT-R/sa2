.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

	.global gUnknown_080D7B10
gUnknown_080D7B10:
    .incbin "baserom.gba", 0x000D7B10, 0x3

    .global gUnknown_080D7B13
gUnknown_080D7B13:
    .incbin "baserom.gba", 0x000D7B13, 0x30

    .global gUnknown_080D7B43
gUnknown_080D7B43:
    .incbin "baserom.gba", 0x000D7B43, 0xB

    .global gUnknown_080D7B4E
gUnknown_080D7B4E:
    .incbin "baserom.gba", 0x000D7B4E, 0x2

    .global gUnknown_080D7B50
gUnknown_080D7B50:
    .incbin "baserom.gba", 0x000D7B50, 0x18

    .global gUnknown_080D7B68
gUnknown_080D7B68:
    .incbin "baserom.gba", 0x000D7B68, 0x8

    .global gUnknown_080D7B70
gUnknown_080D7B70:
    .incbin "baserom.gba", 0x000D7B70, 0x20

    .global gUnknown_080D7B90
gUnknown_080D7B90:
    .incbin "baserom.gba", 0x000D7B90, 0x20

.text
.syntax unified
.arm
