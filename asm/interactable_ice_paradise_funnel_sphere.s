.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8078170
sub_8078170: @ 0x08078170
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Player_SetMovestate_IsInScriptedSequence
	ldr r4, _080781B0 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r4, #0x85
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bhi _08078218
	lsls r0, r0, #2
	ldr r1, _080781B4 @ =_080781B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080781B0: .4byte gPlayer
_080781B4: .4byte _080781B8
_080781B8: @ jump table
	.4byte _080781F2 @ case 0
	.4byte _080781CC @ case 1
	.4byte _080781CC @ case 2
	.4byte _080781F2 @ case 3
	.4byte _080781F2 @ case 4
_080781CC:
	ldr r3, _08078228 @ =gPlayer
	adds r3, #0x94
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r0, r0, #0xc
	strh r0, [r5, #0x14]
	ldr r0, [r2, #0x1c]
	ldr r1, _0807822C @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
_080781F2:
	ldr r3, _08078228 @ =gPlayer
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r0, r0, #0xc
	strh r0, [r5, #0x12]
	ldr r0, [r2, #0x1c]
	ldr r1, _0807822C @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
_08078218:
	ldr r0, _08078228 @ =gPlayer
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	ldr r0, _08078230 @ =0x000008FF
	cmp r1, r0
	bgt _08078234
	movs r0, #1
	b _08078236
	.align 2, 0
_08078228: .4byte gPlayer
_0807822C: .4byte 0xFFFFCFFF
_08078230: .4byte 0x000008FF
_08078234:
	movs r0, #0
_08078236:
	strh r0, [r5, #0x1c]
	movs r0, #0
	str r0, [r5, #0x18]
	ldr r0, _0807824C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08078250 @ =sub_807844C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807824C: .4byte gCurTask
_08078250: .4byte sub_807844C

	thumb_func_start sub_8078254
sub_8078254: @ 0x08078254
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r4, _08078288 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _0807828C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _080782DE
	lsls r0, r0, #2
	ldr r1, _08078290 @ =_08078294
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078288: .4byte gPlayer
_0807828C: .4byte 0xFFBFFFFF
_08078290: .4byte _08078294
_08078294: @ jump table
	.4byte _080782C4 @ case 0
	.4byte _080782A8 @ case 1
	.4byte _080782A8 @ case 2
	.4byte _080782C4 @ case 3
	.4byte _080782C4 @ case 4
_080782A8:
	ldr r4, _080782EC @ =gPlayer
	adds r3, r4, #0
	adds r3, #0x94
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _080782F0 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldrh r1, [r5, #0x14]
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x1c]
	orrs r0, r1
	str r0, [r2, #0x1c]
_080782C4:
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _080782F0 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldrh r1, [r5, #0x12]
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x1c]
	orrs r0, r1
	str r0, [r2, #0x1c]
_080782DE:
	ldr r0, _080782F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080782F8 @ =sub_8078414
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080782EC: .4byte gPlayer
_080782F0: .4byte 0xFFFFCFFF
_080782F4: .4byte gCurTask
_080782F8: .4byte sub_8078414

	thumb_func_start sub_80782FC
sub_80782FC: @ 0x080782FC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r4, _08078320 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _08078372
	lsls r0, r0, #2
	ldr r1, _08078324 @ =_08078328
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078320: .4byte gPlayer
_08078324: .4byte _08078328
_08078328: @ jump table
	.4byte _08078358 @ case 0
	.4byte _0807833C @ case 1
	.4byte _0807833C @ case 2
	.4byte _08078358 @ case 3
	.4byte _08078358 @ case 4
_0807833C:
	ldr r4, _0807838C @ =gPlayer
	adds r3, r4, #0
	adds r3, #0x94
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08078390 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldrh r1, [r5, #0x14]
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x1c]
	orrs r0, r1
	str r0, [r2, #0x1c]
_08078358:
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08078390 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldrh r1, [r5, #0x12]
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x1c]
	orrs r0, r1
	str r0, [r2, #0x1c]
_08078372:
	ldr r1, _08078394 @ =gCamera
	adds r1, #0x50
	ldrh r2, [r1]
	ldr r0, _08078398 @ =0x0000FFFE
	ands r0, r2
	strh r0, [r1]
	ldr r0, _0807839C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080783A0 @ =sub_8078414
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807838C: .4byte gPlayer
_08078390: .4byte 0xFFFFCFFF
_08078394: .4byte gCamera
_08078398: .4byte 0x0000FFFE
_0807839C: .4byte gCurTask
_080783A0: .4byte sub_8078414

	thumb_func_start sub_80783A4
sub_80783A4: @ 0x080783A4
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08078404 @ =gPlayer
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08078400
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08078400
	ldr r3, [r2]
	ldr r0, _08078408 @ =gCamera
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r2, #4]
	ldr r4, [r0, #4]
	subs r2, r2, r4
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r1, r1, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r3, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r2, r2, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r1, r3, #0
	muls r1, r3, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0x90
	ble _0807840C
_08078400:
	movs r0, #0
	b _0807840E
	.align 2, 0
_08078404: .4byte gPlayer
_08078408: .4byte gCamera
_0807840C:
	movs r0, #1
_0807840E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078414
sub_8078414: @ 0x08078414
	push {r4, lr}
	ldr r0, _08078448 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80783A4
	cmp r0, #0
	beq _08078432
	adds r0, r4, #0
	bl sub_8078170
_08078432:
	adds r0, r4, #0
	bl sub_807854C
	cmp r0, #0
	beq _08078442
	adds r0, r4, #0
	bl sub_8078594
_08078442:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078448: .4byte gCurTask

	thumb_func_start sub_807844C
sub_807844C: @ 0x0807844C
	push {lr}
	ldr r0, _08078470 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r2, _08078474 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08078478
	adds r0, r3, #0
	bl sub_80782FC
	b _080784AC
	.align 2, 0
_08078470: .4byte gCurTask
_08078474: .4byte gPlayer
_08078478:
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	ldr r0, _0807848C @ =0x000002FF
	cmp r1, r0
	bgt _08078490
	ldr r0, [r2, #8]
	movs r1, #0xc0
	lsls r1, r1, #2
	b _08078496
	.align 2, 0
_0807848C: .4byte 0x000002FF
_08078490:
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
_08078496:
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	ldr r0, [r3]
	adds r0, #0x20
	cmp r1, r0
	blt _080784AC
	adds r0, r3, #0
	bl sub_80784B0
_080784AC:
	pop {r0}
	bx r0

	thumb_func_start sub_80784B0
sub_80784B0: @ 0x080784B0
	push {lr}
	ldr r3, _080784E4 @ =gPlayer
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x20
	lsls r1, r1, #8
	str r1, [r3, #8]
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0, #0x10]
	adds r2, #0x40
	lsls r2, r2, #8
	str r2, [r0, #8]
	ldr r1, [r0, #4]
	lsls r1, r1, #8
	str r1, [r0, #0xc]
	ldr r0, _080784E8 @ =0x00000125
	bl m4aSongNumStart
	ldr r0, _080784EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080784F0 @ =sub_8077F7C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080784E4: .4byte gPlayer
_080784E8: .4byte 0x00000125
_080784EC: .4byte gCurTask
_080784F0: .4byte sub_8077F7C

	thumb_func_start sub_80784F4
sub_80784F4: @ 0x080784F4
	push {lr}
	ldrh r0, [r0, #0x1c]
	cmp r0, #1
	bne _08078508
	ldr r1, _08078504 @ =gPlayer
	movs r0, #0xc0
	lsls r0, r0, #3
	b _0807850E
	.align 2, 0
_08078504: .4byte gPlayer
_08078508:
	ldr r1, _08078534 @ =gPlayer
	movs r0, #0xf6
	lsls r0, r0, #8
_0807850E:
	strh r0, [r1, #0x12]
	movs r0, #0
	strh r0, [r1, #0x10]
	ldr r1, _08078538 @ =gCamera
	adds r1, #0x50
	ldrh r2, [r1]
	ldr r0, _0807853C @ =0x0000FFFE
	ands r0, r2
	strh r0, [r1]
	ldr r0, _08078540 @ =0x00000125
	bl m4aSongNumStop
	ldr r0, _08078544 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08078548 @ =sub_8078634
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08078534: .4byte gPlayer
_08078538: .4byte gCamera
_0807853C: .4byte 0x0000FFFE
_08078540: .4byte 0x00000125
_08078544: .4byte gCurTask
_08078548: .4byte sub_8078634

	thumb_func_start sub_807854C
sub_807854C: @ 0x0807854C
	push {lr}
	ldr r1, [r0]
	ldr r3, _08078588 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08078584
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08078584
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807858C
_08078584:
	movs r0, #1
	b _0807858E
	.align 2, 0
_08078588: .4byte gCamera
_0807858C:
	movs r0, #0
_0807858E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8078594
sub_8078594: @ 0x08078594
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080785AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080785AC: .4byte gCurTask

	thumb_func_start initSprite_Interactable_IceParadise_FunnelSphere
initSprite_Interactable_IceParadise_FunnelSphere: @ 0x080785B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08078620 @ =sub_8078414
	ldr r2, _08078624 @ =0x00002010
	ldr r1, _08078628 @ =sub_8078688
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r1, r3
	mov r0, r8
	str r0, [r3, #0x20]
	ldrb r2, [r0]
	ldr r7, _0807862C @ =IWRAM_START + 0x24
	adds r0, r1, r7
	strb r2, [r0]
	ldr r0, _08078630 @ =IWRAM_START + 0x25
	adds r1, r1, r0
	strb r6, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #4]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078620: .4byte sub_8078414
_08078624: .4byte 0x00002010
_08078628: .4byte sub_8078688
_0807862C: .4byte IWRAM_START + 0x24
_08078630: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8078634
sub_8078634: @ 0x08078634
	push {lr}
	ldr r0, _08078658 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r2, _0807865C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08078660
	adds r0, r3, #0
	bl sub_80782FC
	b _08078684
	.align 2, 0
_08078658: .4byte gCurTask
_0807865C: .4byte gPlayer
_08078660:
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	ldr r1, [r2, #0xc]
	adds r1, r1, r0
	str r1, [r2, #0xc]
	ldr r0, [r3, #4]
	asrs r1, r1, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0807867A
	rsbs r0, r0, #0
_0807867A:
	cmp r0, #0x47
	ble _08078684
	adds r0, r3, #0
	bl sub_8078254
_08078684:
	pop {r0}
	bx r0

	thumb_func_start sub_8078688
sub_8078688: @ 0x08078688
	bx lr
	.align 2, 0
