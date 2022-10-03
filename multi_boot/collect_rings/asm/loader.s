	.include "../../asm/macros/function.inc"
	.include "../../constants/gba_constants.inc"

	.syntax unified

	.text

	.global _entry
_entry: @ 0x02000000
	b _020000C0
_02000004:
	.include "asm/rom_header.inc"
_020000C0:
	b _0200010C
_020000C4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020000E0:
	ldrh r1, [r0, #8]
	tst r1, #0x80
	beq _020000E0
_020000EC:
	ldrh r1, [r0, #8]
	tst r1, #0x80
	bne _020000EC
	ldrh r1, [r0, #8]
	tst r1, #0x40
	bxne lr
	ldrh r1, [r0]
	bx lr
_0200010C:
	ldr r0, _020001A0 @ =0x04000120
_02000110:
	bl _020000E0
	bne _02000110
	mov r2, #0
	strh r2, [r0, #0xa]
	cmp r1, #0
	bne _02000110
	mov r2, #0x8000
_0200012C:
	mov r1, #0
_02000130:
	strh r1, [r0, #0xa]
	bl _020000E0
	bne _02000110
	cmp r1, r2
	bne _0200012C
	lsr r2, r2, #5
	cmp r1, #0
	bne _02000130
	ldr r3, _020001A4 @ =0x020000AC
	ldrh r2, [r3]
	strh r2, [r0, #0xa]
	bl _020000E0
_02000160:
	bne _02000160
	cmp r1, r2
	bne _02000160
	ldrh r2, [r3, #2]
	strh r2, [r0, #0xa]
	bl _020000E0
	bne _02000160
	cmp r1, r2
	bne _02000160
	mov r1, #0
	strh r1, [r0, #0xa]
	ldr r0, _020001A8 @ =gSignedPayload + 0x1C0
	ldr r1, _020001AC @ =gUnknown_0203B000
	svc #0x110000
	ldr lr, _020001AC @ =gUnknown_0203B000
	bx lr
	.align 2, 0
_020001A0: .4byte 0x04000120
_020001A4: .4byte 0x020000AC
_020001A8: .4byte gSignedPayload + 0x1C0
_020001AC: .4byte gUnknown_0203B000
