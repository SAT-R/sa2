.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.section .rodata

    .global rom_footer
rom_footer:

RomBuildInfo:
    .ascii "0.94 Thu Oct 25 00:00:00  2002\r\n"
