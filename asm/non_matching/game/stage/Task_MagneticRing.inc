.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0     @ r5 = ring
	ldr r4, _0800BCB8 @ =gPlayer
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrh r0, [r5, #0x16]
	subs r1, r1, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldrh r2, [r5, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldrh r1, [r5, #0x30]
	adds r1, #0x40
	strh r1, [r5, #0x30]
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	ldr r3, _0800BCBC @ =gSineTable
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r0, r6
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	muls r1, r2, r1
	asrs r1, r1, #0x16
	ldrh r2, [r5, #0x16]
	adds r1, r1, r2
	strh r1, [r5, #0x16]
	movs r6, #0x30
	ldrsh r1, [r5, r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #0x16
	ldrh r3, [r5, #0x18]
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	ldrh r6, [r5, #0x18]
	mov r8, r6              @ r8 = ringY
	ldrh r0, [r5, #0x16]
	mov sl, r0              @ sl = ringX
	movs r1, #0x16
	ldrsh r3, [r5, r1]
	adds r2, r3, #0
	subs r2, #8
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	adds r0, r6, #0
	adds r0, #0x38
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r2, r1
	bgt _0800BBE6
	adds r0, r3, #0
	adds r0, #8
	cmp r0, r1
	bge _0800BBF8
	cmp r2, r1
	blt _0800BCD8
_0800BBE6:
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800BCD8
_0800BBF8:
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r7, r2, #0x10
	adds r4, r7, #0
	subs r4, #0x10
	ldr r1, _0800BCB8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	mov ip, r6
	mov r3, ip
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	mov sb, r2
	cmp r4, r3
	bgt _0800BC24
	cmp r7, r3
	bge _0800BC36
	cmp r4, r3
	blt _0800BCD8
_0800BC24:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r4
	blt _0800BCD8
_0800BC36:
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800BCA8
	ldr r1, _0800BCC4 @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, #1
	strh r0, [r1]
	ldr r0, _0800BCC8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #29
	beq _0800BC86
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0800BC86
	ldr r0, _0800BCCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800BC86
	ldr r1, _0800BCD0 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800BC7E
	movs r0, #0xff
_0800BC7E:
	strb r0, [r1]
	ldr r1, _0800BCD4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800BC86:
	ldr r0, _0800BCCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800BC9A
	ldr r1, _0800BCC4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0800BC9A
	movs r0, #0xff
	strh r0, [r1]
_0800BC9A:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	asrs r1, r2, #0x10
	bl CreateCollectRingEffect
_0800BCA8:
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800BCFE
	.align 2, 0
_0800BCB4: .4byte gCurTask
_0800BCB8: .4byte gPlayer
_0800BCBC: .4byte gSineTable
_0800BCC0: .4byte gUnknown_03005AF0
_0800BCC4: .4byte gRingCount
_0800BCC8: .4byte gCurrentLevel
_0800BCCC: .4byte gGameMode
_0800BCD0: .4byte gNumLives
_0800BCD4: .4byte gUnknown_030054A8
_0800BCD8:
	ldr r2, _0800BD0C @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r5, #0x18]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	mov r3, sl
	strh r3, [r5, #0x16]
	mov r6, r8
	strh r6, [r5, #0x18]
_0800BCFE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD0C: .4byte gCamera

	
.syntax divided
