.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #0
	cmp r3, r5
	bge _0802E3C2
	mov r6, sp
	adds r6, #2
_0802E3A0:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E3A0
_0802E3C2:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E48A
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E3D2:
	ldr r0, _0802E41C @ =gBgOffsetsHBlank
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E420
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E42C
	.align 2, 0
_0802E41C: .4byte gBgOffsetsHBlank
_0802E420:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E42C:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E47C
_0802E44C:
	lsls r0, r6, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E458
	movs r1, #0xf0
_0802E458:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E460
	movs r1, #0
_0802E460:
	adds r5, #1
	strb r1, [r5]
	adds r5, #1
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E44C
_0802E47C:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E3D2
_0802E48A:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
