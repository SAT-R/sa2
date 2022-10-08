.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.section .rodata

    .global gPayload
gSignedPayload: @ 0x2000370
	.incbin "payload/payload.gba.lz"
