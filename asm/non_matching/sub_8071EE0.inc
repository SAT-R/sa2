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
	mov r8, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	mov sl, r0
	movs r4, #0
_08071EFA:
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	asrs r6, r4, #0xd
	mov r3, sp
	adds r5, r3, r6
	adds r0, r7, #0
	movs r1, #0
	adds r2, r5, #0
	movs r3, #8
	bl ReadFlash
	ldr r1, [r5]
	ldr r0, _08071F84 @ =0x4547474D
	cmp r1, r0
	bne _08071F2C
	add r0, sp, #4
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, r8
	bls _08071F26
	mov sl, r7
	mov r8, r0
_08071F26:
	cmp r0, sb
	bhs _08071F2C
	mov sb, r0
_08071F2C:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071EFA
	mov r3, sb
	cmp r3, #0
	bne _08071F6E
	movs r3, #0
	mov r8, r3
	movs r4, #0
	ldr r2, _08071F88 @ =0x0000FFFF
	add r1, sp, #4
_08071F4A:
	lsls r4, r4, #0x10
	cmp r8, r2
	bhi _08071F60
	asrs r0, r4, #0xd
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, r8
	bls _08071F60
	lsrs r3, r4, #0x10
	mov sl, r3
	mov r8, r0
_08071F60:
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r4, r3
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071F4A
_08071F6E:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071F84: .4byte 0x4547474D
_08071F88: .4byte 0x0000FFFF
.syntax divided
