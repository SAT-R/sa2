.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0     @ r3 = param0
	adds r4, r2, #0     @ r4 = p
	ldr r0, _0804D4E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0     @ r1 = halfpipe
	mov r8, r1          @ r8 = r1 = halfpipe
	movs r6, #0
	ldr r0, _0804D4EC @ =0x0000029F
	cmp r3, r0
	bhi _0804D550
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0804D4CA
	rsbs r0, r0, #0
_0804D4CA:
	ldr r2, _0804D4F0 @ =0xFFFFFDC0
	adds r0, r0, r2
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804D4F4
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	ble _0804D4E2
	adds r1, r2, #0
_0804D4E2:
	adds r0, r1, #0
	b _0804D4F6
	.align 2, 0
_0804D4E8: .4byte gCurTask
_0804D4EC: .4byte 0x0000029F
_0804D4F0: .4byte 0xFFFFFDC0
_0804D4F4:
	movs r0, #0
_0804D4F6:
	ldr r7, _0804D518 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x16
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r6, r5
	ble _0804D50C
	adds r6, r5, #0
_0804D50C:
	ldr r0, _0804D51C @ =0x0000014F
	cmp r3, r0
	bgt _0804D520
	lsls r0, r3, #0xf
	b _0804D526
	.align 2, 0
_0804D518: .4byte gSineTable
_0804D51C: .4byte 0x0000014F
_0804D520:
	ldr r2, _0804D58C @ =0xFFFFFD60
	adds r0, r3, r2
	lsls r0, r0, #0xf
_0804D526:
	movs r1, #0xa8
	lsls r1, r1, #1
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r1, r1, #0     @ -COS_24_8(Div(divParam0, 0x150));
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r6, r0, #0
_0804D550:
	ldr r0, [r4, #0x10]
	movs r3, #4
	ands r0, r3
	cmp r0, #0
	bne _0804D5B8
__0804D55A:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D5B8
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	beq _0804D582
	adds r0, r2, #0
	subs r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0804D5B8
_0804D582:
	ldr r0, _0804D590 @ =0x000007FF
	cmp r6, r0
	bgt _0804D594
	strb r3, [r1]
	b _0804D5B8
	.align 2, 0
_0804D58C: .4byte 0xFFFFFD60
_0804D590: .4byte 0x000007FF
_0804D594:
	ldr r0, _0804D5A0 @ =0x000017FF
	cmp r6, r0
	bgt _0804D5A4
	movs r0, #0x18
	b _0804D5B6
	.align 2, 0
_0804D5A0: .4byte 0x000017FF
_0804D5A4:
	ldr r0, _0804D5B0 @ =0x00002FFF
	cmp r6, r0
	bgt _0804D5B4
	movs r0, #0x19
	b _0804D5B6
	.align 2, 0
_0804D5B0: .4byte 0x00002FFF
_0804D5B4:
	movs r0, #0x1a
_0804D5B6:
	strb r0, [r1]
_0804D5B8:
	ldr r0, [r4, #0x10]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	movs r0, #0
	strh r0, [r4, #0xa]
	mov r2, r8
	ldr r1, [r2, #0x1c]
	subs r1, r1, r6
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	lsls r0, r0, #8
	subs r1, r1, r0
	ldr r0, [r4, #4]
	subs r1, r1, r0
	ldr r2, _0804D5FC @ =0xFFFFFA00
	adds r3, r0, #0
	cmp r1, r2
	blt _0804D5EA
	adds r0, r1, #0
	movs r2, #0xc0
	lsls r2, r2, #3
	cmp r0, r2
	ble _0804D5EC
_0804D5EA:
	adds r0, r2, #0
_0804D5EC:
	adds r0, r3, r0
	str r0, [r4, #4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D5FC: .4byte 0xFFFFFA00

.syntax divided
