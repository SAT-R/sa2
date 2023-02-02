.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_WindUpStick
initSprite_Interactable_WindUpStick: @ 0x080725B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08072644 @ =sub_8072998
	ldr r2, _08072648 @ =0x00002010
	ldr r1, _0807264C @ =sub_80729D4
	str r1, [sp]
	movs r1, #0x1c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
	movs r0, #0
	strb r0, [r3, #0x11]
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #4]
	movs r1, #3
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	strh r1, [r3, #8]
	movs r2, #4
	ldrsb r2, [r6, r2]
	lsls r2, r2, #3
	strh r2, [r3, #0xa]
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #0xc]
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #0xe]
	str r6, [r3, #0x14]
	ldrb r0, [r6]
	strb r0, [r3, #0x18]
	mov r1, r8
	strb r1, [r3, #0x19]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072644: .4byte sub_8072998
_08072648: .4byte 0x00002010
_0807264C: .4byte sub_80729D4

	thumb_func_start sub_8072650
sub_8072650: @ 0x08072650
	push {r4, r5, lr}
	ldr r0, _08072674 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _08072678 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807267C
	adds r0, r5, #0
	bl sub_80729D8
	b _080726DE
	.align 2, 0
_08072674: .4byte gCurTask
_08072678: .4byte gPlayer
_0807267C:
	ldrb r0, [r5, #0x10]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080726C6
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080726A6
	adds r0, r5, #0
	bl sub_8072A28
	cmp r0, #0
	beq _080726A6
	ldr r0, [r4, #8]
	adds r0, #0x80
	str r0, [r4, #8]
_080726A6:
	ldr r4, _080726E4 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080726C6
	adds r0, r5, #0
	bl sub_80729F4
	cmp r0, #0
	beq _080726C6
	ldr r0, [r4, #8]
	subs r0, #0x80
	str r0, [r4, #8]
_080726C6:
	ldr r0, _080726E4 @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080726DE
	adds r0, r5, #0
	bl sub_80727F4
_080726DE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080726E4: .4byte gPlayer

	thumb_func_start sub_80726E8
sub_80726E8: @ 0x080726E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08072748 @ =gPlayer
	adds r0, r5, #0
	bl sub_80218E4
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r6, #0
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	bl Player_SetMovestate_IsInScriptedSequence
	ldr r3, [r5, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r3, r0
	str r3, [r5, #0x20]
	ldr r2, _0807274C @ =gUnknown_03005AF0
	ldr r1, [r2, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r1
	lsrs r0, r0, #0xc
	strb r0, [r4, #0x12]
	ldr r0, _08072750 @ =0xFFFFCFFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r1, r0
	str r1, [r2, #0x1c]
	ldr r0, [r4, #4]
	adds r0, #3
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldrb r0, [r4, #0x10]
	cmp r0, #2
	beq _08072778
	cmp r0, #2
	bgt _08072754
	cmp r0, #1
	beq _0807275E
	b _080727DA
	.align 2, 0
_08072748: .4byte gPlayer
_0807274C: .4byte gUnknown_03005AF0
_08072750: .4byte 0xFFFFCFFF
_08072754:
	cmp r0, #3
	beq _08072784
	cmp r0, #4
	beq _080727AA
	b _080727DA
_0807275E:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x33
	strh r0, [r1]
	strh r6, [r5, #0x10]
	ldr r1, _08072774 @ =0xFFFFF980
	adds r0, r1, #0
	ldrh r1, [r5, #0x12]
	adds r0, r0, r1
	strh r0, [r5, #0x12]
	b _080727DA
	.align 2, 0
_08072774: .4byte 0xFFFFF980
_08072778:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0x34
	strh r1, [r0]
	strh r6, [r5, #0x10]
	b _080727DA
_08072784:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0x35
	strh r1, [r0]
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _0807279C
	ldr r1, _08072798 @ =0xFFFFFD80
	b _080727A0
	.align 2, 0
_08072798: .4byte 0xFFFFFD80
_0807279C:
	movs r1, #0xa0
	lsls r1, r1, #2
_080727A0:
	adds r0, r1, #0
	ldrh r1, [r5, #0x14]
	adds r0, r0, r1
	strh r0, [r5, #0x14]
	b _080727DA
_080727AA:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0x36
	strh r1, [r0]
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _080727C4
	ldr r1, _080727C0 @ =0xFFFFFEC0
	b _080727C8
	.align 2, 0
_080727C0: .4byte 0xFFFFFEC0
_080727C4:
	movs r1, #0xa0
	lsls r1, r1, #1
_080727C8:
	adds r0, r1, #0
	ldrh r1, [r5, #0x14]
	adds r0, r0, r1
	strh r0, [r5, #0x14]
	ldr r0, _080727E8 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #1
	eors r1, r2
	str r1, [r0, #0x20]
_080727DA:
	ldr r0, _080727EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080727F0 @ =sub_8072650
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080727E8: .4byte gPlayer
_080727EC: .4byte gCurTask
_080727F0: .4byte sub_8072650

	thumb_func_start sub_80727F4
sub_80727F4: @ 0x080727F4
	push {r4, lr}
	adds r4, r0, #0
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r2, _08072828 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807282C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r2, _08072830 @ =gUnknown_03005AF0
	ldr r1, [r2, #0x1c]
	ldr r0, _08072834 @ =0xFFFFCFFF
	ands r1, r0
	ldrb r0, [r4, #0x12]
	lsls r0, r0, #0xc
	orrs r1, r0
	str r1, [r2, #0x1c]
	ldrb r0, [r4, #0x10]
	cmp r0, #2
	beq _08072850
	cmp r0, #2
	bgt _08072838
	cmp r0, #1
	beq _08072842
	b _0807285E
	.align 2, 0
_08072828: .4byte gPlayer
_0807282C: .4byte 0xFFBFFFFF
_08072830: .4byte gUnknown_03005AF0
_08072834: .4byte 0xFFFFCFFF
_08072838:
	cmp r0, #3
	beq _08072842
	cmp r0, #4
	beq _08072850
	b _0807285E
_08072842:
	ldr r2, _0807284C @ =gPlayer
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08072856
	.align 2, 0
_0807284C: .4byte gPlayer
_08072850:
	ldr r2, _08072870 @ =gPlayer
	movs r0, #0xe
	ldrsh r1, [r4, r0]
_08072856:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0xc]
_0807285E:
	ldrb r0, [r4, #0x10]
	cmp r0, #2
	beq _0807287E
	cmp r0, #2
	bgt _08072874
	cmp r0, #1
	beq _0807287E
	b _080728B4
	.align 2, 0
_08072870: .4byte gPlayer
_08072874:
	cmp r0, #3
	beq _08072894
	cmp r0, #4
	beq _080728A4
	b _080728B4
_0807287E:
	ldr r1, _08072890 @ =gPlayer
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #0xe
	strh r0, [r2]
	adds r1, #0x6d
	movs r0, #7
	strb r0, [r1]
	b _080728B4
	.align 2, 0
_08072890: .4byte gPlayer
_08072894:
	ldr r0, _080728A0 @ =gPlayer
	adds r0, #0x6d
	movs r1, #1
	strb r1, [r0]
	b _080728B4
	.align 2, 0
_080728A0: .4byte gPlayer
_080728A4:
	ldr r0, _080728C8 @ =gPlayer
	adds r1, r0, #0
	adds r1, #0x6d
	movs r2, #1
	strb r2, [r1]
	ldr r1, [r0, #0x20]
	eors r1, r2
	str r1, [r0, #0x20]
_080728B4:
	movs r0, #0xf
	strb r0, [r4, #0x11]
	ldr r0, _080728CC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080728D0 @ =sub_8072998
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080728C8: .4byte gPlayer
_080728CC: .4byte gCurTask
_080728D0: .4byte sub_8072998

	thumb_func_start sub_80728D4
sub_80728D4: @ 0x080728D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	beq _080728E8
	subs r0, #1
	strb r0, [r5, #0x11]
	b _0807298C
_080728E8:
	ldr r7, _08072970 @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	bne _0807298C
	ldr r2, [r5]
	ldr r1, _08072974 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #8
	ldrsh r3, [r5, r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _0807298C
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _0807298C
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	adds r3, r0, r2
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r3, r1
	bgt _0807298C
	movs r4, #0xe
	ldrsh r0, [r5, r4]
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _0807298C
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	beq _0807297C
	movs r1, #0x12
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bge _08072978
	movs r0, #1
	b _0807298E
	.align 2, 0
_08072970: .4byte gPlayer
_08072974: .4byte gCamera
_08072978:
	movs r0, #2
	b _0807298E
_0807297C:
	movs r4, #0x12
	ldrsh r0, [r7, r4]
	cmp r0, #0
	bge _08072988
	movs r0, #3
	b _0807298E
_08072988:
	movs r0, #4
	b _0807298E
_0807298C:
	movs r0, #0
_0807298E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8072998
sub_8072998: @ 0x08072998
	push {r4, lr}
	ldr r0, _080729D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80728D4
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080729BA
	adds r0, r4, #0
	bl sub_80726E8
_080729BA:
	adds r0, r4, #0
	bl sub_8072A5C
	cmp r0, #0
	beq _080729CA
	adds r0, r4, #0
	bl sub_8072AC0
_080729CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080729D0: .4byte gCurTask

	thumb_func_start sub_80729D4
sub_80729D4: @ 0x080729D4
	bx lr
	.align 2, 0

	thumb_func_start sub_80729D8
sub_80729D8: @ 0x080729D8
	push {lr}
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r0, _080729EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080729F0 @ =sub_8072998
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080729EC: .4byte gCurTask
_080729F0: .4byte sub_8072998

	thumb_func_start sub_80729F4
sub_80729F4: @ 0x080729F4
	push {lr}
	ldr r1, [r0]
	ldrh r0, [r0, #8]
	adds r1, r1, r0
	ldr r0, _08072A20 @ =gCamera
	ldr r2, [r0]
	adds r0, r2, #0
	subs r0, #8
	subs r1, r1, r0
	ldr r0, _08072A24 @ =gPlayer
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	movs r2, #0
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _08072A1A
	movs r2, #1
_08072A1A:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08072A20: .4byte gCamera
_08072A24: .4byte gPlayer

	thumb_func_start sub_8072A28
sub_8072A28: @ 0x08072A28
	push {lr}
	ldr r1, [r0]
	ldrh r0, [r0, #0xc]
	adds r1, r1, r0
	ldr r0, _08072A54 @ =gCamera
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #8
	subs r1, r1, r0
	ldr r0, _08072A58 @ =gPlayer
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	movs r2, #0
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	cmp r1, r0
	ble _08072A4E
	movs r2, #1
_08072A4E:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08072A54: .4byte gCamera
_08072A58: .4byte gPlayer

	thumb_func_start sub_8072A5C
sub_8072A5C: @ 0x08072A5C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _08072AB4 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08072AAE
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08072AAE
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _08072AAE
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _08072AB8
_08072AAE:
	movs r0, #1
	b _08072ABA
	.align 2, 0
_08072AB4: .4byte gCamera
_08072AB8:
	movs r0, #0
_08072ABA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8072AC0
sub_8072AC0: @ 0x08072AC0
	push {lr}
	ldr r1, [r0, #0x14]
	ldrb r0, [r0, #0x18]
	strb r0, [r1]
	ldr r0, _08072AD4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08072AD4: .4byte gCurTask
