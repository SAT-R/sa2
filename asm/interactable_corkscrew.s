.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8061088
sub_8061088: @ 0x08061088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _08061178 @ =gCurTask
	ldr r0, [r3]
	str r0, [sp]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, [r5]
	mov sb, r1
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	mov ip, r0
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _0806117C @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r2, #0x80
	mov sl, r2
	mov r0, sl
	ands r0, r6
	mov sl, r0
	cmp r0, #0
	beq _080610D4
	b _080611D2
_080610D4:
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r2, r0
	ldr r3, [r7, #8]
	str r3, [sp, #4]
	asrs r4, r3, #8
	cmp r1, r4
	bgt _080611CA
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r4
	blt _080611CA
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080611CA
	mov r3, sb
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080611CA
	cmp ip, r4
	ble _08061190
	ldrb r1, [r5, #9]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _080611C4
	adds r1, r7, #0
	adds r1, #0x6d
	movs r0, #0x1b
	strb r0, [r1]
	mov r1, ip
	subs r0, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08061180 @ =0x000003FF
	ands r0, r1
	movs r3, #0x14
	ldrsh r1, [r7, r3]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	str r1, [r7, #8]
	mov r3, r8
	lsls r2, r3, #8
	ldr r1, _08061184 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061188 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r7, #0xc]
	mov r2, sl
	strh r2, [r7, #0x12]
	ldr r0, _0806118C @ =sub_8061228
	ldr r3, [sp]
	str r0, [r3, #8]
	b _080611D2
	.align 2, 0
_08061178: .4byte gCurTask
_0806117C: .4byte gPlayer
_08061180: .4byte 0x000003FF
_08061184: .4byte gSineTable
_08061188: .4byte 0xFFFFE400
_0806118C: .4byte sub_8061228
_08061190:
	movs r0, #0x14
	ldrsh r1, [r7, r0]
	ldr r0, _080611BC @ =0xFFFFFC00
	ldrb r3, [r5, #9]
	cmp r1, r0
	bge _080611C4
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	bne _080611C4
	adds r0, r7, #0
	adds r0, #0x5e
	ldr r1, _080611C0 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _080611C4
	movs r0, #1
	orrs r0, r3
	b _080611D0
	.align 2, 0
_080611BC: .4byte 0xFFFFFC00
_080611C0: .4byte gPlayerControls
_080611C4:
	movs r0, #0xfe
	ands r0, r3
	b _080611D0
_080611CA:
	ldrb r1, [r5, #9]
	movs r0, #0xfe
	ands r0, r1
_080611D0:
	strb r0, [r5, #9]
_080611D2:
	ldr r1, _08061220 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r2, r2, r0
	mov ip, r2
	ldr r0, [r1, #4]
	mov r3, r8
	subs r3, r3, r0
	mov r8, r3
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08061200
	mov r0, r8
	adds r0, #0x80
	cmp r0, #0
	blt _08061200
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r8, r0
	ble _0806120E
_08061200:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r2, _08061224 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
_0806120E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061220: .4byte gCamera
_08061224: .4byte gCurTask

	thumb_func_start sub_8061228
sub_8061228: @ 0x08061228
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061278 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r5, [r7]
	mov r8, r5
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _0806127C @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sl, r0
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08061280
	mov r1, r8
	strb r3, [r1]
	mov r5, ip
	ldr r0, [r5]
	bl TaskDestroy
	b _080613CE
	.align 2, 0
_08061278: .4byte gCurTask
_0806127C: .4byte gPlayer
_08061280:
	ldr r2, [r4, #8]
	asrs r0, r2, #8
	subs r3, r0, r1
	ldr r0, _0806129C @ =0xFFFFFDD0
	cmp r3, r0
	bge _080612BC
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _080612A0
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _080612A6
	.align 2, 0
_0806129C: .4byte 0xFFFFFDD0
_080612A0:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_080612A6:
	strb r0, [r1]
	ldr r0, _080612B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080612B8 @ =sub_8061088
	str r0, [r1, #8]
	b _080613CE
	.align 2, 0
_080612B4: .4byte gCurTask
_080612B8: .4byte sub_8061088
_080612BC:
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r3, r1
	ldr r0, _08061320 @ =0x000003FF
	mov r8, r0
	ands r3, r0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, #8]
	mov r0, sl
	lsls r2, r0, #8
	ldr r1, _08061324 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061328 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0x10]
	cmp r1, r0
	ble _08061330
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806132C @ =sub_8061088
	mov r1, sb
	str r0, [r1, #8]
	b _080613CE
	.align 2, 0
_08061320: .4byte 0x000003FF
_08061324: .4byte gSineTable
_08061328: .4byte 0xFFFFE400
_0806132C: .4byte sub_8061088
_08061330:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061360 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0806136C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08061364 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061368 @ =sub_8061088
	mov r5, sb
	str r0, [r5, #8]
	b _080613CE
	.align 2, 0
_08061360: .4byte gPlayerControls
_08061364: .4byte 0x0000FB20
_08061368: .4byte sub_8061088
_0806136C:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _080613CE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080613A0
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #109
	bl m4aSongNumStart
	b _080613CE
_080613A0:
	ldr r1, _080613DC @ =PlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r1, _080613E0 @ =0xFFFFFEE6
	adds r0, r3, r1
	mov r5, r8
	ands r0, r5
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_080613CE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080613DC: .4byte PlayerCharacterIdleAnims
_080613E0: .4byte 0xFFFFFEE6

	thumb_func_start initSprite_Interactable_CorkScrew_Start
initSprite_Interactable_CorkScrew_Start: @ 0x080613E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08061434 @ =Task_8060D34
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r6]
	strb r2, [r0, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	str r1, [r0, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061434: .4byte Task_8060D34

	thumb_func_start initSprite_Interactable_CorkScrew_End
initSprite_Interactable_CorkScrew_End: @ 0x08061438
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08061484 @ =sub_8061088
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r6]
	ldr r1, _08061488 @ =0xFFFFFC00
	str r1, [r0, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061484: .4byte sub_8061088
_08061488: .4byte 0xFFFFFC00

@; Unused? SA1 code?
	thumb_func_start sub_806148C
sub_806148C: @ 0x0806148C
	push {r4, r5, lr}
	ldr r5, _080614DC @ =gPlayer
	ldr r4, [r5, #8]
	asrs r2, r4, #8
	subs r2, r2, r0
	lsls r3, r2, #4
	subs r3, r3, r2
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r2, _080614E0 @ =0x000003FF
	ands r0, r2
	movs r3, #0x14
	ldrsh r2, [r5, r3]
	adds r4, r4, r2
	str r4, [r5, #8]
	lsls r1, r1, #8
	ldr r3, _080614E4 @ =gSineTable
	lsls r2, r0, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r2, r1
	ldr r1, _080614E8 @ =0xFFFFE400
	adds r2, r2, r1
	str r2, [r5, #0xc]
	movs r1, #0
	strh r1, [r5, #0x12]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080614DC: .4byte gPlayer
_080614E0: .4byte 0x000003FF
_080614E4: .4byte gSineTable
_080614E8: .4byte 0xFFFFE400
