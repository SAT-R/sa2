.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D5548
gUnknown_080D5548:
    .2byte 0x1C7, 0
    .2byte 0x1C8, 0
    .2byte 0x1C9, 0
    .2byte 0x1C7, 0
    .2byte 0x1C8, 0
    .2byte 0x1C9, 0
    .2byte 0x1C9, 1
    .2byte 0x1CA, 0
    .2byte 0x1CB, 0
    .2byte 0x1CC, 0
    .2byte 0x1CC, 1
    .2byte 0x1CD, 0
    .2byte 0x1CE, 0
    .2byte 0x1CF, 0
    .2byte 0x1CF, 1
    .2byte 0x1D0, 0
    .2byte 0x1D1, 0
    .2byte 0x1D6, 0

    .global gUnknown_080D5590
gUnknown_080D5590:
    .incbin "baserom.gba", 0x000D5590, 0x98

    .global gUnknown_080D5628
gUnknown_080D5628:
    .incbin "baserom.gba", 0x000D5628, 0x4C


.text
.syntax unified
.arm
