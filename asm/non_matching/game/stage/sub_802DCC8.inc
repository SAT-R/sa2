.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DD08 @ =gBgOffsetsHBlank
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DD0C @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DDBC
	cmp r6, #1
	bhi _0802DD14
	lsls r0, r7, #1
	adds r4, r4, r0
	lsls r1, r7, #0x10
	cmp r1, #0
	beq _0802DDBC
	movs r2, #0xf0
_0802DCF6:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	ldr r3, _0802DD10 @ =0xFFFF0000
	adds r1, r1, r3
	asrs r0, r1, #0x10
	cmp r0, #0
	bgt _0802DCF6
	b _0802DDBC
	.align 2, 0
_0802DD08: .4byte gBgOffsetsHBlank
_0802DD0C: .4byte 0xFFFFFF00
_0802DD10: .4byte 0xFFFF0000
_0802DD14:
	ldr r2, _0802DD80 @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DD46
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	cmp r3, #0
	bge _0802DD46
	rsbs r3, r3, #0
_0802DD46:
	ldr r0, _0802DD84 @ =0x000001FF
	cmp r6, r0
	bhi _0802DD8C
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DDBC
_0802DD58:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DD6A
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DD6A:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DD88 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DD58
	b _0802DDBC
	.align 2, 0
_0802DD80: .4byte gSineTable
_0802DD84: .4byte 0x000001FF
_0802DD88: .4byte 0xFFFF0000
_0802DD8C:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DDBC
_0802DD96:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DDA8
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DDA8:
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DD96
_0802DDBC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	
.syntax divided
