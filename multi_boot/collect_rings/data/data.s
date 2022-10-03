	.include "../../asm/macros/function.inc"
	.include "../../constants/gba_constants.inc"

	.section .rodata
    .global gSignedPayload
gSignedPayload: @ 0x20001B0
	.incbin "signed_payload/signed_payload.gba"
