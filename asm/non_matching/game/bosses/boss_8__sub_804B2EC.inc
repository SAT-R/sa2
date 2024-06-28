
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0         @ r7 = boss
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x3e
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B314
	movs r0, #0
	b _0804B41E
_0804B314:
	ldr r1, _0804B3C8 @ =gPlayer
	mov r8, r1              @ r8 = gPlayer
	mov r0, r8  
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc           @ r0 = s = &gPlayer.unk90->s;
	mov sl, r0              @ sl = s
	mov r2, sb              @ r2 = sb = arm
	lsls r4, r2, #3         @ r4 = arm * 8
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r0, r4
	ldr r3, [r7]            @ r3 = boss->qUnk0
	ldr r0, [r0]            @ r0 = qUnk18[arm][0]
	ldr r1, _0804B3CC       @ r1 = gUnknown_080D8888
	lsls r2, r2, #2         @ r2 = arm * 4
	adds r5, r2, r1         @ r5 = &gUnknown_080D8888[arm][0]
	adds r6, r3, r0         @ r6 = boss->qUnk0 + qUnk18[arm][0]
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r0, r4
	ldr r3, [r7, #4]        @ r3 = boss->qUnk4
	ldr r0, [r0]            @ r0 = qUnk18[arm][1]
	adds r1, #2
	adds r2, r2, r1
	adds r0, r3, r0
	ldrh r5, [r5]           @ r5 = gUnknown_080D8888[arm][0]
	adds r4, r6, r5         @ r4 = boss->qUnk0 + qUnk18[arm][0]
	ldrh r2, [r2]
	adds r5, r0, r2
	ldr r0, _0804B3D0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804B364
	adds r0, r4, #0
	adds r1, r5, #0
	bl Player_UpdateHomingPosition
_0804B364:
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804B3D8
	mov r2, sl
	ldr r1, [r2, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804B3D8
	mov r1, r8
	ldr r0, [r1, #8]
	subs r0, r0, r4
	asrs r6, r0, #8
	ldr r0, [r1, #0xc]
	subs r0, r0, r5
	asrs r0, r0, #8
	adds r2, r6, #0
	muls r2, r6, r2
	adds r6, r2, #0
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r6, r0
	ldr r0, _0804B3D4 @ =0x00000177
	cmp r1, r0
	bgt _0804B3D8
	adds r0, r7, #0
	mov r1, sb
	bl sub_804C9B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	mov r2, r8
	movs r5, #0x10
	ldrsh r0, [r2, r5]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	movs r5, #0x14
	ldrsh r0, [r2, r5]
	rsbs r0, r0, #0
	strh r0, [r2, #0x14]
	b _0804B41C
	.align 2, 0
_0804B3C8: .4byte gPlayer
_0804B3CC: .4byte gUnknown_080D8888
_0804B3D0: .4byte gSelectedCharacter
_0804B3D4: .4byte 0x00000177
_0804B3D8:
	ldr r0, _0804B430 @ =gCheese
	ldr r2, [r0]
	cmp r2, #0
	beq _0804B41C
	ldr r1, [r2, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804B41C
	ldr r0, [r2]
	subs r4, r4, r0
	asrs r4, r4, #8
	ldr r0, [r2, #4]
	subs r5, r5, r0
	asrs r5, r5, #8
	adds r0, r4, #0
	muls r0, r4, r0
	adds r1, r5, #0
	muls r1, r5, r1
	adds r0, r0, r1
	ldr r1, _0804B434 @ =0x00000177
	cmp r0, r1
	bgt _0804B41C
	adds r0, r7, #0
	mov r1, sb
	bl sub_804C9B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _0804B438 @ =gCheeseTarget
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
_0804B41C:
	ldr r0, [sp]
_0804B41E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B430: .4byte gCheese
_0804B434: .4byte 0x00000177
_0804B438: .4byte gCheeseTarget

.syntax divided
