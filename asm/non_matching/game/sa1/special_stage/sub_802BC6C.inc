.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0802BCC0 @ =gUnknown_03005690
	ldr r0, _0802BCC4 @ =gCurTask
	ldr r3, [r0]
	ldrh r2, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0
	ldr r0, _0802BCC8 @ =0x0300000C
	adds r0, r0, r2
	mov sl, r0
	mov sb, r8
	ldr r0, [r1, #8]
	mov r4, sb
	ldr r1, [r4, #0x44]
	subs r0, r0, r1
	asrs r1, r0, #8
	ldr r4, _0802BCCC @ =0x03000050
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _0802BCD0 @ =0x03000060
	adds r2, r2, r0
	ldrh r0, [r2]
	cmp r0, #3
	beq _0802BCD4
	lsls r1, r1, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x12
	cmp r1, r0
	ble _0802BCD4
	adds r0, r3, #0
	bl TaskDestroy
_0802BCBA:
	movs r0, #0
	b _0802BDE8
	.align 2, 0
_0802BCC0: .4byte gUnknown_03005690
_0802BCC4: .4byte gCurTask
_0802BCC8: .4byte 0x0300000C
_0802BCCC: .4byte 0x03000050
_0802BCD0: .4byte 0x03000060
_0802BCD4:
	mov r1, r8
	adds r1, #0x50
	str r1, [sp]
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r1, #0xc0
	bgt _0802BCBA
	ldr r0, _0802BDF8 @ =0xFFFFFD00
	cmp r1, r0
	blt _0802BCBA
	ldr r3, [sp]
	movs r4, #0
	ldrsh r0, [r3, r4]
	bl sub_802D58C
	mov r1, r8
	adds r1, #0x66
	str r1, [sp, #4]
	strb r0, [r1]
	ldr r2, [sp]
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r7, r0, r4
	asrs r7, r7, #3
	cmp r7, #0
	bne _0802BD0E
	movs r7, #1
_0802BD0E:
	adds r0, r7, #0
	muls r0, r7, r0
	muls r0, r7, r0
	muls r7, r0, r7
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r7, #0
	bl __divsi3
	adds r7, r0, #0
	adds r4, r7, #0
	cmp r7, #0
	bge _0802BD2C
	ldr r0, _0802BDFC @ =0x000001FF
	adds r4, r7, r0
_0802BD2C:
	asrs r4, r4, #9
	adds r4, #0x38
	mov r1, r8
	ldr r0, [r1, #0x3c]
	muls r0, r4, r0
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r1, r5, #0
	bl __divsi3
	asrs r0, r0, #8
	mov r6, r8
	adds r6, #0x48
	strh r0, [r6]
	mov r2, r8
	ldr r0, [r2, #0x40]
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	asrs r0, r0, #8
	mov r1, r8
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r6]
	adds r0, #0x78
	mov r3, r8
	adds r3, #0x4c
	strh r0, [r3]
	ldrh r1, [r1]
	movs r0, #0x50
	subs r0, r0, r1
	mov r2, r8
	adds r2, #0x4e
	strh r0, [r2]
	ldr r4, _0802BE00 @ =gUnknown_03005780
	ldrh r0, [r4, #4]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	ldrh r1, [r4, #6]
	subs r0, r0, r1
	strh r0, [r2]
	ldrh r1, [r3]
	mov r3, sl
	strh r1, [r3, #0x16]
	ldrh r0, [r2]
	strh r0, [r3, #0x18]
	mov r4, sb
	strh r1, [r4, #6]
	ldrh r0, [r3, #0x18]
	strh r0, [r4, #8]
	adds r0, r7, #0
	cmp r7, #0
	bge _0802BDA0
	ldr r1, _0802BE04 @ =0x000003FF
	adds r0, r7, r1
_0802BDA0:
	asrs r0, r0, #0xa
	adds r0, #0x40
	mov r2, sb
	strh r0, [r2, #2]
	mov r3, sb
	strh r0, [r3, #4]
	ldr r4, [sp, #4]
	ldrb r2, [r4]
	ldr r0, _0802BE08 @ =0x00002020
	orrs r2, r0
	mov r0, sl
	str r2, [r0, #0x10]
	movs r4, #2
	ldrsh r1, [r3, r4]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802BDCC
	movs r0, #0x40
	orrs r2, r0
	mov r0, sl
	str r2, [r0, #0x10]
_0802BDCC:
	ldr r2, [sp]
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r1, #0
	subs r0, #0xc0
	cmp r0, #0
	bge _0802BDDC
	adds r0, #0x1f
_0802BDDC:
	asrs r0, r0, #5
	rsbs r0, r0, #0
	lsls r0, r0, #6
	mov r4, sl
	strh r0, [r4, #0x1a]
	movs r0, #1
_0802BDE8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802BDF8: .4byte 0xFFFFFD00
_0802BDFC: .4byte 0x000001FF
_0802BE00: .4byte gUnknown_03005780
_0802BE04: .4byte 0x000003FF
_0802BE08: .4byte 0x00002020

.syntax divided
