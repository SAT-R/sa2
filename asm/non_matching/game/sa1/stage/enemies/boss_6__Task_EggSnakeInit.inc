.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080322B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0xc
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _080322BC @ =0x03000044
	adds r6, r2, r1
	ldr r4, [r5]
	ldr r3, _080322C0 @ =0x03000098
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, #0x78
	bne _080321FC
	adds r1, #0x65
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080321FC
	bl sub_8033878
	bl sub_803330C
_080321FC:
	ldr r1, _080322C4 @ =gSineTable
	adds r0, r5, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r2, r0, #0xb
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r5, #0x78]
	asrs r0, r0, #8
	adds r1, r1, r0
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	adds r0, r2, #0
	adds r0, #0x90
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0803223A
	adds r2, #0x1f
_0803223A:
	ldr r0, _080322C8 @ =gUnknown_03005870
	asrs r2, r2, #5
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r5, #0x7c]
	asrs r0, r0, #8
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	adds r2, r2, r1
	ldr r7, _080322B8 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	ldr r3, _080322CC @ =0x0300000C
	adds r1, r1, r3
	ldr r4, _080322D0 @ =gCamera
	ldrh r0, [r4]
	mov sb, r0
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r3, sb
	subs r0, r0, r3
	strh r0, [r1, #0x16]
	ldrh r0, [r4, #2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r1, #0x18]
	mov r0, r8
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	ldr r1, _080322CC @ =0x0300000C
	adds r2, r0, r1
	ldr r3, _080322BC @ =0x03000044
	adds r0, r0, r3
	ldrh r1, [r2, #0x16]
	strh r1, [r0, #0x16]
	ldrh r1, [r2, #0x18]
	strh r1, [r0, #0x18]
	bl sub_8031ED0
	adds r3, r5, #0
	adds r3, #0xa9
	ldrb r0, [r3]
	cmp r0, #1
	beq _08032300
	cmp r0, #1
	bgt _080322D4
	cmp r0, #0
	beq _080322DE
	b _0803235E
	.align 2, 0
_080322B8: .4byte gCurTask
_080322BC: .4byte 0x03000044
_080322C0: .4byte 0x03000098
_080322C4: .4byte gSineTable
_080322C8: .4byte gUnknown_03005870
_080322CC: .4byte 0x0300000C
_080322D0: .4byte gCamera
_080322D4:
	cmp r0, #2
	beq _0803231A
	cmp r0, #3
	beq _0803233E
	b _0803235E
_080322DE:
	adds r2, r5, #0
	adds r2, #0x98
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803235E
	ldr r1, _080322FC @ =gMusicManagerState
	movs r0, #0x13
	strb r0, [r1, #1]
	movs r0, #0x3c
	strh r0, [r2]
	b _08032336
	.align 2, 0
_080322FC: .4byte gMusicManagerState
_08032300:
	adds r1, r5, #0
	adds r1, #0x98
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803235E
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #4
	strb r0, [r1]
	b _08032336
_0803231A:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0803235E
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x98
	movs r0, #0x3c
	strh r0, [r1]
_08032336:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _0803235E
_0803233E:
	adds r1, r5, #0
	adds r1, #0x98
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803235E
	adds r1, #0x10
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0
	strb r0, [r3]
	ldr r1, [r7]
	ldr r0, _0803236C @ =Task_8032370
	str r0, [r1, #8]
_0803235E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803236C: .4byte Task_8032370

.syntax divided
