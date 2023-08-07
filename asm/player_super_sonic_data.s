.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

@; NOTE / FIXME(?): These are only used by player_super_sonic.
@;                  But that already includes .rodata, which is 
@                   away from gUnknown_080D650C & gUnknown_080D661C
    .global gUnknown_080D650C
gUnknown_080D650C:
    .incbin "baserom.gba", 0x000D650C, 0x110

    .global gUnknown_080D661C
gUnknown_080D661C:
    .incbin "baserom.gba", 0x000D661C, 0x110

.text
.syntax unified
.arm
