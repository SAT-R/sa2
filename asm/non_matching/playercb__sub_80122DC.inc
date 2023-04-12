
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0  @ ip = x
	mov r8, r1  @ r8 = y
	ldr r5, _08012350 @ =gPlayer
	ldr r0, [r5, #8]
	mov r1, ip
	subs r0, r0, r1
	asrs r4, r0, #8     @ r4 = playerX
	ldr r0, [r5, #0xc]
	mov r2, r8
	subs r0, r0, r2
	asrs r3, r0, #8     @ r3 = playerY
	adds r1, r4, #0
	muls r1, r4, r1     @ r1 = sqPlayerX
	adds r0, r3, #0
	muls r0, r3, r0     @ r0 = sqPlayerY
	adds r6, r1, r0     @ r6 = distance^2
	adds r0, r5, #0
	adds r0, #0x85
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bne _08012382
	ldr r7, _08012354 @ =gUnknown_030054C0
	ldr r0, [r7]
	cmp r6, r0
	bge _080123C6
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012360
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldr r3, _08012358 @ =0xFFFFFF00
	adds r1, r0, r3
	ldr r0, _0801235C @ =0x000003FF
	adds r2, r0, #0
	ands r1, r2
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080123C6
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	subs r0, r0, r1
	ands r0, r2
	str r6, [r7]
	strh r0, [r7, #4]
	b _080123C6
	.align 2, 0
_08012350: .4byte gPlayer
_08012354: .4byte gUnknown_030054C0
_08012358: .4byte 0xFFFFFF00
_0801235C: .4byte 0x000003FF
_08012360:
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080123C6
	str r6, [r7]
	strh r1, [r7, #4]
	b _080123C6
_08012382:
	cmp r2, #1
	bne _080123C6
	ldr r0, _080123A4 @ =gCurTask
	ldr r3, [r0]
	ldr r0, _080123A8 @ =gUnknown_03005498
	ldr r1, [r0]
	adds r7, r0, #0
	cmp r6, r1
	bge _080123C6
	ldr r0, [r5, #0x20]
	ands r0, r2
	cmp r0, #0
	beq _080123AC
	cmp r4, #0
	bge _080123B0
	b _080123B4
	.align 2, 0
_080123A4: .4byte gCurTask
_080123A8: .4byte gUnknown_03005498
_080123AC:
	cmp r4, #0
	bgt _080123B4
_080123B0:
	str r6, [r7]
	str r3, [r7, #4]
_080123B4:
	ldrb r0, [r3, #0x15]
	cmp r0, #0
	beq _080123C6
	mov r1, ip
	asrs r0, r1, #8
	strh r0, [r3, #0x16]
	mov r2, r8
	asrs r0, r2, #8
	strh r0, [r3, #0x18]
_080123C6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
