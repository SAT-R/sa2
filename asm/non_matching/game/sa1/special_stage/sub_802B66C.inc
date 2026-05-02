.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	ldr r5, _0802B750 @ =gUnknown_030055F0+0xC
	ldr r1, [r1, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0802B68E
	b _0802B878
_0802B68E:
	ldr r0, _0802B754 @ =gUnknown_03005690
	ldr r3, [r6, #0x44]
	ldr r2, _0802B758 @ =0xFFFFC000
	adds r1, r3, r2
	ldr r2, [r0, #8]
	adds r7, r0, #0
	cmp r2, r1
	bge _0802B6A0
	b _0802B878
_0802B6A0:
	cmp r2, r3
	ble _0802B6A6
	b _0802B878
_0802B6A6:
	adds r0, r6, #0
	adds r0, #0x60
	ldrh r0, [r0]
	cmp r0, #4
	bge _0802B6B2
	b _0802B7E0
_0802B6B2:
	cmp r0, #9
	ble _0802B6BC
	cmp r0, #0xb
	beq _0802B6BC
	b _0802B7E0
_0802B6BC:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B760
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov r1, ip
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r3, r0, r4
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, _0802B75C @ =gUnknown_0848720C
	movs r2, #0
	ldrsh r5, [r1, r2]
	adds r2, r0, r5
	adds r6, r1, #0
	cmp r3, r2
	bgt _0802B702
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0802B710
	cmp r3, r2
	bge _0802B702
	b _0802B878
_0802B702:
	movs r1, #4
	ldrsh r0, [r6, r1]
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0802B710
	b _0802B878
_0802B710:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r2, ip
	adds r2, #0x2d
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r3, r0, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r4, [r6, r2]
	adds r2, r0, r4
	cmp r3, r2
	bgt _0802B748
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0802B742
	b _0802B874
_0802B742:
	cmp r3, r2
	bge _0802B748
	b _0802B878
_0802B748:
	movs r1, #6
	ldrsh r0, [r6, r1]
	b _0802B86C
	.align 2, 0
_0802B750: .4byte gUnknown_030055F0+0xC
_0802B754: .4byte gUnknown_03005690
_0802B758: .4byte 0xFFFFC000
_0802B75C: .4byte gUnknown_0848720C
_0802B760:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov r1, ip
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r3, r0, r4
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, _0802B7DC @ =gUnknown_08487204
	movs r2, #0
	ldrsh r5, [r1, r2]
	adds r2, r0, r5
	adds r6, r1, #0
	cmp r3, r2
	bgt _0802B796
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0802B7A2
	cmp r3, r2
	blt _0802B878
_0802B796:
	movs r1, #4
	ldrsh r0, [r6, r1]
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	blt _0802B878
_0802B7A2:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r2, ip
	adds r2, #0x2d
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r3, r0, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r4, [r6, r2]
	adds r2, r0, r4
	cmp r3, r2
	bgt _0802B7D6
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	bge _0802B874
	cmp r3, r2
	blt _0802B878
_0802B7D6:
	movs r1, #6
	ldrsh r0, [r6, r1]
	b _0802B86C
	.align 2, 0
_0802B7DC: .4byte gUnknown_08487204
_0802B7E0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov r1, ip
	adds r1, #0x2c
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	ldr r0, [r7]
	asrs r0, r0, #8
	adds r1, r5, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0802B816
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0802B828
	cmp r2, r1
	blt _0802B878
_0802B816:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0802B878
_0802B828:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r1, ip
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	adds r2, r5, #0
	adds r2, #0x2d
	movs r4, #0
	ldrsb r4, [r2, r4]
	adds r2, r0, r4
	cmp r3, r2
	bgt _0802B862
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	bge _0802B874
	cmp r3, r2
	blt _0802B878
_0802B862:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0802B86C:
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	blt _0802B878
_0802B874:
	movs r0, #1
	b _0802B87A
_0802B878:
	movs r0, #0
_0802B87A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

.syntax divided
