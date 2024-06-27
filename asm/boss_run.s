.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata


    .global gUnknown_080D8808
gUnknown_080D8808:
    .incbin "baserom.gba", 0x000D8808, 0x38

    .global gUnknown_080D8840
gUnknown_080D8840:
    .incbin "baserom.gba", 0x000D8840, 0x18

    .global gUnknown_080D8858
gUnknown_080D8858:
    .incbin "baserom.gba", 0x000D8858, 0xC

    .global gUnknown_080D8864
gUnknown_080D8864:
    .incbin "baserom.gba", 0x000D8864, 0x10

    .global gUnknown_080D8874
gUnknown_080D8874:
    .incbin "baserom.gba", 0x000D8874, 0x14

.text
.syntax unified
.arm
