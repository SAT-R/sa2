.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	movs r0, #0
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
	ldr r4, _08071CFC @ =0x0000FFFF
	mov sl, r4
	movs r1, #0
_08071C7C:
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	asrs r6, r0, #0x10
	lsls r5, r6, #3
	mov r0, sp
	adds r4, r0, r5
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #8
	bl ReadFlash
	ldr r1, [r4]
	ldr r0, _08071D00 @ =0x4547474D
	cmp r1, r0
	bne _08071D08
	add r2, sp, #4
	adds r0, r2, r5
	ldr r0, [r0]
	cmp r0, sb
	bls _08071CA8
	mov sb, r0
_08071CA8:
	cmp r0, r8
	bhs _08071CB0
	mov sl, r7
	mov r8, r0
_08071CB0:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071C7C
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	bne _08071D0C
	ldr r4, _08071D04 @ =0xFFFF0000
	mov r8, r4
	movs r1, #0
	mov r3, r8
_08071CCC:
	lsls r1, r1, #0x10
	cmp r8, r3
	bls _08071CE2
	asrs r0, r1, #0xd
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, r8
	bhs _08071CE2
	lsrs r4, r1, #0x10
	mov sl, r4
	mov r8, r0
_08071CE2:
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r1, r4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071CCC
	ldr r0, _08071D04 @ =0xFFFF0000
	cmp r8, r0
	bne _08071D0C
	movs r0, #1
	rsbs r0, r0, #0
	b _08071D12
	.align 2, 0
_08071CFC: .4byte 0x0000FFFF
_08071D00: .4byte 0x4547474D
_08071D04: .4byte 0xFFFF0000
_08071D08:
	adds r0, r6, #0
	b _08071D12
_08071D0C:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
_08071D12:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.syntax divided
