.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov ip, r0          @ ip = s
	adds r7, r1, #0     @ r7 = worldX
	mov r8, r2          @ r8 = worldY
	adds r5, r3, #0     @ r5 = rect
	ldr r4, [sp, #0x20] @ r4 = p
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r7, r3
	ldr r0, [r4]
	asrs r0, r0, #8
	movs r6, #0
	ldrsb r6, [r5, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _08080608
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _08080616
	cmp r2, r1
	bge _08080608
	b _0808070C
_08080608:
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _08080616
	b _0808070C
_08080616:
	mov r0, ip
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	movs r6, #1
	ldrsb r6, [r5, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _08080646
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _08080652
	cmp r2, r1
	blt _0808070C
_08080646:
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0808070C
_08080652:
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	movs r1, #2
	ldrsb r1, [r5, r1]
	subs r1, r0, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r4]
	asrs r3, r0, #8
	cmp r3, r2
	bgt _0808067E
	lsls r0, r1, #8
	str r0, [r4]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080806AA
	b _080806A4
_0808067E:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	movs r1, #0
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	adds r2, r0, #0
	subs r2, #8
	cmp r3, r2
	blt _0808070C
	lsls r0, r0, #8
	str r0, [r4]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080806AA
_080806A4:
	movs r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #8]
_080806AA:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #9
	ldr r1, [r4]
	asrs r1, r1, #8
	adds r5, r4, #0
	adds r5, #0x27
	ldrb r2, [r5]
	movs r7, #0
	str r7, [sp]
	ldr r6, _08080708 @ =sa2__sub_801EE64
	str r6, [sp, #4]
	movs r3, #8
	bl sa2__sub_801E4E4
	cmp r0, #0
	bge _080806D4
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_080806D4:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	asrs r1, r1, #8
	ldrb r2, [r5]
	movs r3, #8
	rsbs r3, r3, #0
	str r7, [sp]
	str r6, [sp, #4]
	bl sa2__sub_801E4E4
	cmp r0, #0
	bge _080806F6
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_080806F6:
	ldr r0, [r4, #0x10]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r4, #0x10]
	movs r0, #1
	b _0808070E
	.align 2, 0
_08080708: .4byte sa2__sub_801EE64
_0808070C:
	movs r0, #0
_0808070E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
