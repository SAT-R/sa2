.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

   .global gUnknown_080D7A18
gUnknown_080D7A18:
    .incbin "baserom.gba", 0x000D7A18, 0x10

    .global gUnknown_080D7A28
gUnknown_080D7A28:
    .incbin "baserom.gba", 0x000D7A28, 0x10

    .global gUnknown_080D7A38
gUnknown_080D7A38:
    .incbin "baserom.gba", 0x000D7A38, 0x20

    .global gUnknown_080D7A58
gUnknown_080D7A58:
    .incbin "baserom.gba", 0x000D7A58, 0x20

    .global gUnknown_080D7A78
gUnknown_080D7A78:
    .incbin "baserom.gba", 0x000D7A78, 0x20

    .global gUnknown_080D7A98
gUnknown_080D7A98:
    .incbin "baserom.gba", 0x000D7A98, 0xA

    .global gUnknown_080D7AA2
gUnknown_080D7AA2:
    .incbin "baserom.gba", 0x000D7AA2, 0x6

    .global gUnknown_080D7AA8
gUnknown_080D7AA8:
    .4byte sub_803CAC8, sub_803B018

    .global gUnknown_080D7AB0
gUnknown_080D7AB0:
    .4byte sub_803B17C, sub_803B264, sub_803CB84, sub_803B2F8
    .4byte sub_803CBA4, sub_803B4A0, sub_803B57C, sub_803B62C

    .global gUnknown_080D7AD0
gUnknown_080D7AD0:
    .incbin "baserom.gba", 0x000D7AD0, 0x40

.text
.syntax unified
.arm
