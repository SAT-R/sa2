.include "../../asm/macros/function.inc"
.include "../../constants/gba_constants.inc"

.section .rodata

    .global gCollectRingsRom
gCollectRingsRom: @ 0x20000C0
	.incbin "collect_rings/collect_rings.gba"
