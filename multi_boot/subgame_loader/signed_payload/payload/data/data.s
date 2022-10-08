.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"

.section .rodata

    .global gData
gData: @ 0x0203C208
	.incbin "data/rom_data.bin", 0x1208, 0x3524
