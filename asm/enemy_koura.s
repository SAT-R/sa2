.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D8F38
gUnknown_080D8F38:
    .2byte 0x1EC, 1     @ SA2_ANIM_KOURA, Variant 1
    .2byte 0x1EC, 2     @ SA2_ANIM_KOURA, Variant 2
    .2byte 0x1EC, 3     @ SA2_ANIM_KOURA, Variant 3
    .2byte 0x1EC, 4     @ SA2_ANIM_KOURA, Variant 4
    .2byte 0x1EC, 5     @ SA2_ANIM_KOURA, Variant 5
    .2byte 0x1EC, 6     @ SA2_ANIM_KOURA, Variant 6

.text
.syntax unified
.arm
