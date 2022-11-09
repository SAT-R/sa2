.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80725B4
sub_80725B4: @ 0x080725B4
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
	ldr r4, _08072678 @ =gUnknown_030059E0
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
_08072678: .4byte gUnknown_030059E0
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
	ldr r4, _080726E4 @ =gUnknown_030059E0
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
	ldr r0, _080726E4 @ =gUnknown_030059E0
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
_080726E4: .4byte gUnknown_030059E0

	thumb_func_start sub_80726E8
sub_80726E8: @ 0x080726E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08072748 @ =gUnknown_030059E0
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
	bl sub_8029FF0
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
_08072748: .4byte gUnknown_030059E0
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
	ldr r0, _080727E8 @ =gUnknown_030059E0
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
_080727E8: .4byte gUnknown_030059E0
_080727EC: .4byte gCurTask
_080727F0: .4byte sub_8072650

	thumb_func_start sub_80727F4
sub_80727F4: @ 0x080727F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r2, _08072828 @ =gUnknown_030059E0
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
_08072828: .4byte gUnknown_030059E0
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
	ldr r2, _0807284C @ =gUnknown_030059E0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08072856
	.align 2, 0
_0807284C: .4byte gUnknown_030059E0
_08072850:
	ldr r2, _08072870 @ =gUnknown_030059E0
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
_08072870: .4byte gUnknown_030059E0
_08072874:
	cmp r0, #3
	beq _08072894
	cmp r0, #4
	beq _080728A4
	b _080728B4
_0807287E:
	ldr r1, _08072890 @ =gUnknown_030059E0
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #0xe
	strh r0, [r2]
	adds r1, #0x6d
	movs r0, #7
	strb r0, [r1]
	b _080728B4
	.align 2, 0
_08072890: .4byte gUnknown_030059E0
_08072894:
	ldr r0, _080728A0 @ =gUnknown_030059E0
	adds r0, #0x6d
	movs r1, #1
	strb r1, [r0]
	b _080728B4
	.align 2, 0
_080728A0: .4byte gUnknown_030059E0
_080728A4:
	ldr r0, _080728C8 @ =gUnknown_030059E0
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
_080728C8: .4byte gUnknown_030059E0
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
	ldr r7, _08072970 @ =gUnknown_030059E0
	ldr r6, [r7, #0x20]
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	bne _0807298C
	ldr r2, [r5]
	ldr r1, _08072974 @ =gUnknown_03005960
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
_08072970: .4byte gUnknown_030059E0
_08072974: .4byte gUnknown_03005960
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
	bl sub_802A004
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
	ldr r0, _08072A20 @ =gUnknown_03005960
	ldr r2, [r0]
	adds r0, r2, #0
	subs r0, #8
	subs r1, r1, r0
	ldr r0, _08072A24 @ =gUnknown_030059E0
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
_08072A20: .4byte gUnknown_03005960
_08072A24: .4byte gUnknown_030059E0

	thumb_func_start sub_8072A28
sub_8072A28: @ 0x08072A28
	push {lr}
	ldr r1, [r0]
	ldrh r0, [r0, #0xc]
	adds r1, r1, r0
	ldr r0, _08072A54 @ =gUnknown_03005960
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #8
	subs r1, r1, r0
	ldr r0, _08072A58 @ =gUnknown_030059E0
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
_08072A54: .4byte gUnknown_03005960
_08072A58: .4byte gUnknown_030059E0

	thumb_func_start sub_8072A5C
sub_8072A5C: @ 0x08072A5C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _08072AB4 @ =gUnknown_03005960
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
_08072AB4: .4byte gUnknown_03005960
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

	thumb_func_start sub_8072AD8
sub_8072AD8: @ 0x08072AD8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r6, #1
	beq _08072B0C
	cmp r6, #1
	blo _08072B0C
	cmp r6, #2
	beq _08072B2C
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	b _08072B94
_08072B0C:
	ldr r0, _08072B20 @ =sub_8072F38
	ldr r2, _08072B24 @ =0x00002010
	ldr r1, _08072B28 @ =sub_8072FD4
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
	b _08072B3C
	.align 2, 0
_08072B20: .4byte sub_8072F38
_08072B24: .4byte 0x00002010
_08072B28: .4byte sub_8072FD4
_08072B2C:
	ldr r0, _08072BA4 @ =sub_8072F8C
	ldr r2, _08072BA8 @ =0x00002010
	ldr r1, _08072BAC @ =sub_8072FD4
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
_08072B3C:
	ldrh r4, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r4, r3
	strb r6, [r3, #0x10]
	ldrb r0, [r5]
	lsls r0, r0, #3
	lsls r1, r7, #8
	adds r0, r0, r1
	str r0, [r3]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	mov r2, r8
	lsls r1, r2, #8
	adds r0, r0, r1
	str r0, [r3, #4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	lsls r1, r1, #3
	strh r1, [r3, #8]
	movs r2, #4
	ldrsb r2, [r5, r2]
	lsls r2, r2, #3
	strh r2, [r3, #0xa]
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #0xc]
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #0xe]
	str r5, [r3, #0x20]
	ldrb r1, [r5]
	ldr r2, _08072BB0 @ =IWRAM_START + 0x24
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08072BB4 @ =IWRAM_START + 0x25
	adds r4, r4, r0
	mov r1, sb
	strb r1, [r4]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
_08072B94:
	strb r0, [r5]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072BA4: .4byte sub_8072F8C
_08072BA8: .4byte 0x00002010
_08072BAC: .4byte sub_8072FD4
_08072BB0: .4byte IWRAM_START + 0x24
_08072BB4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8072BB8
sub_8072BB8: @ 0x08072BB8
	push {r4, r5, lr}
	ldr r0, _08072BDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _08072BE0 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08072BE4
	adds r0, r5, #0
	bl sub_8073068
	b _08072C88
	.align 2, 0
_08072BDC: .4byte gCurTask
_08072BE0: .4byte gUnknown_030059E0
_08072BE4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08072BF4
	adds r0, r5, #0
	bl sub_8073088
	b _08072C88
_08072BF4:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08072C10 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08072C14
	bl sub_807321C
	adds r0, r5, #0
	bl sub_8073048
	b _08072C88
	.align 2, 0
_08072C10: .4byte gUnknown_03005B38
_08072C14:
	bl sub_80731D4
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	bl sub_807319C
	strh r0, [r4, #0x14]
	ldr r0, [r5]
	ldr r1, _08072C6C @ =gUnknown_03005960
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _08072C70
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r3, #8
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	cmp r0, r1
	bge _08072C88
	adds r0, r5, #0
	bl sub_8072FD8
	b _08072C88
	.align 2, 0
_08072C6C: .4byte gUnknown_03005960
_08072C70:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	cmp r0, r1
	ble _08072C88
	adds r0, r5, #0
	bl sub_8072FD8
_08072C88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8072C90
sub_8072C90: @ 0x08072C90
	push {r4, r5, lr}
	ldr r0, _08072CB4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08072CB8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08072CBC
	adds r0, r4, #0
	bl sub_8073068
	b _08072D36
	.align 2, 0
_08072CB4: .4byte gCurTask
_08072CB8: .4byte gUnknown_030059E0
_08072CBC:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _08072CCC
	adds r0, r4, #0
	bl sub_8073088
	b _08072D36
_08072CCC:
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _08072CE8 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08072CEC
	bl sub_807321C
	adds r0, r4, #0
	bl sub_8073048
	b _08072D36
	.align 2, 0
_08072CE8: .4byte gUnknown_03005B38
_08072CEC:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x6d
	beq _08072D02
	cmp r0, #0x13
	beq _08072D02
	adds r0, r4, #0
	bl sub_8073034
	b _08072D36
_08072D02:
	bl sub_80731D4
	ldr r5, _08072D3C @ =gUnknown_030059E0
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bge _08072D20
	rsbs r1, r1, #0
_08072D20:
	asrs r1, r1, #1
	ldr r0, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #0x14]
	adds r0, #0x15
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807319C
	strh r0, [r5, #0x14]
_08072D36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072D3C: .4byte gUnknown_030059E0

	thumb_func_start sub_8072D40
sub_8072D40: @ 0x08072D40
	push {r4, r5, lr}
	ldr r0, _08072D6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _08072D70 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08072D88
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08072D74
	adds r0, r5, #0
	bl sub_8073168
	b _08072DC6
	.align 2, 0
_08072D6C: .4byte gCurTask
_08072D70: .4byte gUnknown_030059E0
_08072D74:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08072D90 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08072D94
	bl sub_807321C
_08072D88:
	adds r0, r5, #0
	bl sub_8073148
	b _08072DC6
	.align 2, 0
_08072D90: .4byte gUnknown_03005B38
_08072D94:
	bl sub_80731D4
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	bl sub_807319C
	strh r0, [r4, #0x14]
	adds r0, r5, #0
	bl sub_8072E84
	cmp r0, #0
	bne _08072DC6
	adds r0, r5, #0
	bl sub_80730F0
_08072DC6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8072DCC
sub_8072DCC: @ 0x08072DCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08072E38 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x20]
	adds r1, r6, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #0x37
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_80218E4
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	ldr r1, [r6, #0x20]
	subs r0, #0x13
	ands r1, r0
	str r1, [r6, #0x20]
	ldr r0, [r4, #4]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [r6, #0xc]
	str r5, [r4, #0x1c]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _08072E40
	movs r0, #1
	orrs r1, r0
	str r1, [r6, #0x20]
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08072E3C @ =0xFFFFFF00
	cmp r0, r1
	ble _08072E2E
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r6, #0x14]
_08072E2E:
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x80
	b _08072E60
	.align 2, 0
_08072E38: .4byte gUnknown_030059E0
_08072E3C: .4byte 0xFFFFFF00
_08072E40:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt _08072E5A
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x14]
_08072E5A:
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
_08072E60:
	strb r0, [r1]
	ldr r0, _08072E78 @ =0x0000011B
	bl m4aSongNumStart
	ldr r0, _08072E7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08072E80 @ =sub_8072BB8
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072E78: .4byte 0x0000011B
_08072E7C: .4byte gCurTask
_08072E80: .4byte sub_8072BB8

	thumb_func_start sub_8072E84
sub_8072E84: @ 0x08072E84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r5, _08072F1C @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08072F28
	ldr r2, [r6]
	ldr r1, _08072F20 @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r6, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	movs r0, #8
	ldrsh r5, [r6, r0]
	adds r3, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r3, r1
	bgt _08072F28
	movs r7, #0xc
	ldrsh r2, [r6, r7]
	mov sl, r2
	subs r0, r2, r5
	adds r0, r3, r0
	cmp r0, r1
	blt _08072F28
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xa
	ldrsh r2, [r6, r3]
	adds r4, r0, r2
	mov r7, r8
	lsls r0, r7, #0x10
	asrs r3, r0, #0x10
	cmp r4, r3
	bgt _08072F28
	movs r7, #0xe
	ldrsh r0, [r6, r7]
	subs r0, r0, r2
	adds r0, r4, r0
	cmp r0, r3
	blt _08072F28
	mov r2, sl
	adds r0, r2, r5
	asrs r0, r0, #1
	add r0, ip
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08072F24
	movs r0, #1
	b _08072F2A
	.align 2, 0
_08072F1C: .4byte gUnknown_030059E0
_08072F20: .4byte gUnknown_03005960
_08072F24:
	movs r0, #2
	b _08072F2A
_08072F28:
	movs r0, #0
_08072F2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8072F38
sub_8072F38: @ 0x08072F38
	push {r4, lr}
	ldr r0, _08072F68 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8072E84
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	beq _08072F76
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _08072F6C
	cmp r1, #1
	bne _08072F76
	adds r0, r4, #0
	bl sub_8072DCC
	b _08072F76
	.align 2, 0
_08072F68: .4byte gCurTask
_08072F6C:
	cmp r2, #2
	bne _08072F76
	adds r0, r4, #0
	bl sub_8072DCC
_08072F76:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _08072F86
	adds r0, r4, #0
	bl sub_8073280
_08072F86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8072F8C
sub_8072F8C: @ 0x08072F8C
	push {r4, lr}
	ldr r0, _08072FCC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8072E84
	cmp r0, #0
	beq _08072FB6
	ldr r0, _08072FD0 @ =gUnknown_030059E0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x37
	bne _08072FB6
	adds r0, r4, #0
	bl sub_80730BC
_08072FB6:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _08072FC6
	adds r0, r4, #0
	bl sub_8073280
_08072FC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072FCC: .4byte gCurTask
_08072FD0: .4byte gUnknown_030059E0

	thumb_func_start sub_8072FD4
sub_8072FD4: @ 0x08072FD4
	bx lr
	.align 2, 0

	thumb_func_start sub_8072FD8
sub_8072FD8: @ 0x08072FD8
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	bne _08073000
	ldr r1, _08072FFC @ =gUnknown_030059E0
	movs r0, #8
	ldrsh r2, [r3, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r0, [r3, #0x14]
	ldr r0, [r1, #0xc]
	str r0, [r3, #0x18]
	adds r1, #0x24
	movs r0, #0x6d
	b _08073018
	.align 2, 0
_08072FFC: .4byte gUnknown_030059E0
_08073000:
	ldr r1, _08073028 @ =gUnknown_030059E0
	movs r0, #0xc
	ldrsh r2, [r3, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r0, [r3, #0x14]
	ldr r0, [r1, #0xc]
	str r0, [r3, #0x18]
	adds r1, #0x24
	movs r0, #0x13
_08073018:
	strb r0, [r1]
	ldr r0, _0807302C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073030 @ =sub_8072C90
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08073028: .4byte gUnknown_030059E0
_0807302C: .4byte gCurTask
_08073030: .4byte sub_8072C90

	thumb_func_start sub_8073034
sub_8073034: @ 0x08073034
	ldr r0, _08073040 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073044 @ =sub_8072F38
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08073040: .4byte gCurTask
_08073044: .4byte sub_8072F38

	thumb_func_start sub_8073048
sub_8073048: @ 0x08073048
	push {lr}
	ldr r0, _0807305C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073060 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073064 @ =sub_8073320
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807305C: .4byte 0x0000011B
_08073060: .4byte gCurTask
_08073064: .4byte sub_8073320

	thumb_func_start sub_8073068
sub_8073068: @ 0x08073068
	push {lr}
	ldr r0, _0807307C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073080 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073084 @ =sub_8072F38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807307C: .4byte 0x0000011B
_08073080: .4byte gCurTask
_08073084: .4byte sub_8072F38

	thumb_func_start sub_8073088
sub_8073088: @ 0x08073088
	push {lr}
	ldr r2, _080730A8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _080730AC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _080730B0 @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _080730B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080730B8 @ =sub_8073320
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080730A8: .4byte gUnknown_030059E0
_080730AC: .4byte 0xFFBFFFFF
_080730B0: .4byte 0x0000011B
_080730B4: .4byte gCurTask
_080730B8: .4byte sub_8073320

	thumb_func_start sub_80730BC
sub_80730BC: @ 0x080730BC
	push {lr}
	ldr r1, _080730D4 @ =gUnknown_030059E0
	ldr r0, [r0, #4]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x6d
	bne _080730D8
	movs r0, #0x80
	b _080730DA
	.align 2, 0
_080730D4: .4byte gUnknown_030059E0
_080730D8:
	movs r0, #0
_080730DA:
	strb r0, [r1]
	ldr r0, _080730E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080730EC @ =sub_8072D40
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080730E8: .4byte gCurTask
_080730EC: .4byte sub_8072D40

	thumb_func_start sub_80730F0
sub_80730F0: @ 0x080730F0
	push {lr}
	ldr r2, _08073118 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _0807311C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	subs r1, #0x49
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08073120
	movs r0, #0x6d
	b _08073122
	.align 2, 0
_08073118: .4byte gUnknown_030059E0
_0807311C: .4byte 0xFFBFFFFF
_08073120:
	movs r0, #0x13
_08073122:
	strb r0, [r1]
	bl sub_80731D4
	ldr r0, _0807313C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073140 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073144 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807313C: .4byte 0x0000011B
_08073140: .4byte gCurTask
_08073144: .4byte sub_8072F8C

	thumb_func_start sub_8073148
sub_8073148: @ 0x08073148
	push {lr}
	ldr r0, _0807315C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073160 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073164 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807315C: .4byte 0x0000011B
_08073160: .4byte gCurTask
_08073164: .4byte sub_8072F8C

	thumb_func_start sub_8073168
sub_8073168: @ 0x08073168
	push {lr}
	ldr r2, _08073188 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _0807318C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _08073190 @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073194 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073198 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08073188: .4byte gUnknown_030059E0
_0807318C: .4byte 0xFFBFFFFF
_08073190: .4byte 0x0000011B
_08073194: .4byte gCurTask
_08073198: .4byte sub_8072F8C

	thumb_func_start sub_807319C
sub_807319C: @ 0x0807319C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080731B8 @ =gUnknown_030059E0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080731BC
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xf0
	lsls r2, r2, #4
	b _080731C4
	.align 2, 0
_080731B8: .4byte gUnknown_030059E0
_080731BC:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x90
	lsls r2, r2, #4
_080731C4:
	cmp r0, r2
	ble _080731CA
	adds r1, r2, #0
_080731CA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80731D4
sub_80731D4: @ 0x080731D4
	push {r4, r5, lr}
	ldr r1, _08073214 @ =gUnknown_030059E0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	ldr r4, _08073218 @ =gSineTable
	adds r3, r1, #0
	adds r3, #0x24
	ldrb r0, [r3]
	lsls r0, r0, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r1, #0x10]
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r1, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073214: .4byte gUnknown_030059E0
_08073218: .4byte gSineTable

	thumb_func_start sub_807321C
sub_807321C: @ 0x0807321C
	ldr r2, _08073230 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _08073234 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x6d
	movs r0, #3
	strb r0, [r2]
	bx lr
	.align 2, 0
_08073230: .4byte gUnknown_030059E0
_08073234: .4byte 0xFFBFFFFF

	thumb_func_start sub_8073238
sub_8073238: @ 0x08073238
	push {lr}
	ldr r1, [r0]
	ldr r3, _08073274 @ =gUnknown_03005960
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
	bhi _08073270
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08073270
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08073278
_08073270:
	movs r0, #1
	b _0807327A
	.align 2, 0
_08073274: .4byte gUnknown_03005960
_08073278:
	movs r0, #0
_0807327A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8073280
sub_8073280: @ 0x08073280
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08073298 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08073298: .4byte gCurTask

	thumb_func_start sub_807329C
sub_807329C: @ 0x0807329C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_8072AD8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80732C8
sub_80732C8: @ 0x080732C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_8072AD8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80732F4
sub_80732F4: @ 0x080732F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_8072AD8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8073320
sub_8073320: @ 0x08073320
	push {r4, lr}
	ldr r0, _08073344 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08073348 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807334C
	adds r0, r4, #0
	bl sub_8073068
	b _0807336C
	.align 2, 0
_08073344: .4byte gCurTask
_08073348: .4byte gUnknown_030059E0
_0807334C:
	adds r0, r4, #0
	bl sub_8072E84
	cmp r0, #0
	bne _0807335C
	adds r0, r4, #0
	bl sub_8073068
_0807335C:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _0807336C
	adds r0, r4, #0
	bl sub_8073280
_0807336C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073374
sub_8073374: @ 0x08073374
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08073450 @ =sub_80735AC
	ldr r2, _08073454 @ =0x00002010
	ldr r1, _08073458 @ =sub_807365C
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r1, _0807345C @ =IWRAM_START + 0xC
	adds r6, r4, r1
	movs r1, #0
	mov r0, r8
	strh r0, [r5, #4]
	mov r0, sb
	strh r0, [r5, #6]
	str r7, [r5]
	ldrb r0, [r7]
	strb r0, [r5, #8]
	mov r0, sl
	strb r0, [r5, #9]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r1, [r6, #8]
	strh r1, [r6, #0x14]
	strh r1, [r6, #0x1c]
	ldr r0, _08073460 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08073464 @ =IWRAM_START + 0x2E
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08073468 @ =IWRAM_START + 0x31
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0807346C @ =0x00000237
	strh r0, [r6, #0xa]
	ldr r0, _08073470 @ =IWRAM_START + 0x2C
	adds r4, r4, r0
	movs r1, #0
	strb r1, [r4]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r1, r8
	lsls r1, r1, #8
	mov r8, r1
	add r0, r8
	str r0, [r5, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r1, sb
	lsls r1, r1, #8
	mov sb, r1
	add r0, sb
	str r0, [r5, #0x40]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073450: .4byte sub_80735AC
_08073454: .4byte 0x00002010
_08073458: .4byte sub_807365C
_0807345C: .4byte IWRAM_START + 0xC
_08073460: .4byte IWRAM_START + 0x2D
_08073464: .4byte IWRAM_START + 0x2E
_08073468: .4byte IWRAM_START + 0x31
_0807346C: .4byte 0x00000237
_08073470: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_8073474
sub_8073474: @ 0x08073474
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	bl sub_802A004
	ldr r2, _080734AC @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _080734B0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r2, #0xc]
	ldr r1, [r4, #0x44]
	subs r0, r0, r1
	str r0, [r2, #0xc]
	ldrh r1, [r2, #0x14]
	movs r3, #0x14
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _080734B4
	ldr r0, [r4, #0x3c]
	subs r0, #6
	lsls r0, r0, #8
	str r0, [r2, #8]
	movs r3, #0xa0
	lsls r3, r3, #1
	b _080734BE
	.align 2, 0
_080734AC: .4byte gUnknown_030059E0
_080734B0: .4byte 0xFFBFFFFF
_080734B4:
	ldr r0, [r4, #0x3c]
	adds r0, #6
	lsls r0, r0, #8
	str r0, [r2, #8]
	ldr r3, _0807350C @ =0xFFFFFEC0
_080734BE:
	adds r0, r1, r3
	strh r0, [r2, #0x14]
	ldr r4, _08073510 @ =gUnknown_030059E0
	ldrh r0, [r4, #0x14]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_80737CC
	movs r1, #0
	movs r2, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r2, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #0x20]
	adds r4, #0x6d
	strb r1, [r4]
	ldr r0, _08073514 @ =0x00000237
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08073518 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807351C @ =sub_8073600
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807350C: .4byte 0xFFFFFEC0
_08073510: .4byte gUnknown_030059E0
_08073514: .4byte 0x00000237
_08073518: .4byte gCurTask
_0807351C: .4byte sub_8073600

	thumb_func_start sub_8073520
sub_8073520: @ 0x08073520
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08073598 @ =gUnknown_030059E0
	ldr r5, [r6, #0x20]
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _080735A4
	ldr r2, [r4, #0x3c]
	ldr r1, _0807359C @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x40]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r2, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080735A4
	adds r0, r2, #6
	cmp r0, r1
	blt _080735A4
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	subs r1, #0x20
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _080735A4
	cmp r2, r0
	blt _080735A4
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _08073584
	rsbs r1, r1, #0
_08073584:
	ldr r0, _080735A0 @ =0x000003FF
	cmp r1, r0
	ble _08073592
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080735A6
_08073592:
	movs r0, #1
	b _080735A6
	.align 2, 0
_08073598: .4byte gUnknown_030059E0
_0807359C: .4byte gUnknown_03005960
_080735A0: .4byte 0x000003FF
_080735A4:
	movs r0, #0
_080735A6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80735AC
sub_80735AC: @ 0x080735AC
	push {r4, r5, r6, r7, lr}
	ldr r7, _080735E8 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r5, [r4]
	adds r0, r4, #0
	bl sub_8073520
	cmp r0, #2
	bne _080735D0
	adds r0, r4, #0
	bl sub_8073670
_080735D0:
	adds r0, r4, #0
	bl sub_8073784
	cmp r0, #0
	beq _080735EC
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r7]
	bl TaskDestroy
	b _080735F8
	.align 2, 0
_080735E8: .4byte gCurTask
_080735EC:
	adds r0, r4, #0
	bl sub_8073760
	adds r0, r6, #0
	bl sub_80051E8
_080735F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073600
sub_8073600: @ 0x08073600
	push {r4, r5, lr}
	ldr r0, _08073628 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r4, r1, r0
	ldr r0, _0807362C @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08073630
	adds r0, r5, #0
	bl sub_807371C
	b _08073654
	.align 2, 0
_08073628: .4byte gCurTask
_0807362C: .4byte gUnknown_030059E0
_08073630:
	adds r0, r5, #0
	bl sub_8073760
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08073654
	adds r0, r5, #0
	bl sub_80736E0
_08073654:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807365C
sub_807365C: @ 0x0807365C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8073670
sub_8073670: @ 0x08073670
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	bl sub_8029FF0
	ldr r1, _080736D0 @ =gUnknown_030059E0
	ldr r3, [r1, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r3, r0
	str r3, [r1, #0x20]
	ldr r2, [r4, #0x40]
	lsls r2, r2, #8
	ldr r0, [r1, #0xc]
	subs r0, r2, r0
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	adds r1, #0x64
	movs r0, #0x38
	strh r0, [r1]
	ldr r0, _080736D4 @ =0x00000237
	strh r0, [r5, #0xa]
	adds r4, #0x2c
	movs r0, #1
	strb r0, [r4]
	ands r3, r0
	cmp r3, #0
	beq _080736BA
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_080736BA:
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _080736D8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080736DC @ =sub_8073818
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080736D0: .4byte gUnknown_030059E0
_080736D4: .4byte 0x00000237
_080736D8: .4byte gCurTask
_080736DC: .4byte sub_8073818

	thumb_func_start sub_80736E0
sub_80736E0: @ 0x080736E0
	push {lr}
	adds r2, r0, #0
	adds r2, #0xc
	movs r3, #0
	ldr r1, _0807370C @ =0x00000237
	strh r1, [r2, #0xa]
	adds r0, #0x2c
	strb r3, [r0]
	ldr r0, [r2, #0x10]
	ldr r1, _08073710 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
	ldr r0, _08073714 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073718 @ =sub_80735AC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807370C: .4byte 0x00000237
_08073710: .4byte 0xFFFFFBFF
_08073714: .4byte gCurTask
_08073718: .4byte sub_80735AC

	thumb_func_start sub_807371C
sub_807371C: @ 0x0807371C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	bl sub_802A004
	movs r1, #0
	ldr r0, _08073750 @ =0x00000237
	strh r0, [r5, #0xa]
	adds r4, #0x2c
	strb r1, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _08073754 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08073758 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807375C @ =sub_80735AC
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073750: .4byte 0x00000237
_08073754: .4byte 0xFFFFFBFF
_08073758: .4byte gCurTask
_0807375C: .4byte sub_80735AC

	thumb_func_start sub_8073760
sub_8073760: @ 0x08073760
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r1, [r0, #0x3c]
	ldr r3, _08073780 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r4, #0x16]
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073780: .4byte gUnknown_03005960

	thumb_func_start sub_8073784
sub_8073784: @ 0x08073784
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _080737C0 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
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
	bhi _080737BC
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080737BC
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080737C4
_080737BC:
	movs r0, #1
	b _080737C6
	.align 2, 0
_080737C0: .4byte gUnknown_03005960
_080737C4:
	movs r0, #0
_080737C6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80737CC
sub_80737CC: @ 0x080737CC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080737EC @ =gUnknown_030059E0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080737F0
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080737FC
	b _08073800
	.align 2, 0
_080737EC: .4byte gUnknown_030059E0
_080737F0:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	ble _08073800
_080737FC:
	adds r1, r0, #0
	b _0807380A
_08073800:
	ldr r0, _08073814 @ =0xFFFFF100
	cmp r2, r0
	bge _0807380A
	movs r1, #0xf1
	lsls r1, r1, #8
_0807380A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08073814: .4byte 0xFFFFF100

	thumb_func_start sub_8073818
sub_8073818: @ 0x08073818
	push {r4, r5, lr}
	ldr r0, _08073840 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r4, r1, r0
	ldr r0, _08073844 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08073848
	adds r0, r5, #0
	bl sub_807371C
	b _0807386C
	.align 2, 0
_08073840: .4byte gCurTask
_08073844: .4byte gUnknown_030059E0
_08073848:
	adds r0, r5, #0
	bl sub_8073760
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0807386C
	adds r0, r5, #0
	bl sub_8073474
_0807386C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073874
sub_8073874: @ 0x08073874
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
	ldr r0, _08073970 @ =sub_8073AA8
	movs r1, #0xe6
	lsls r1, r1, #1
	ldr r2, _08073974 @ =0x00002010
	ldr r3, _08073978 @ =sub_80743B8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r1, _0807397C @ =IWRAM_START + 0x1B8
	adds r0, r2, r1
	movs r3, #0
	str r3, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r7]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r7, #4]
	ldr r4, _08073980 @ =IWRAM_START + 0x1C4
	adds r0, r2, r4
	str r1, [r0]
	ldrb r1, [r1]
	adds r4, #4
	adds r0, r2, r4
	strb r1, [r0]
	ldr r1, _08073984 @ =IWRAM_START + 0x1C9
	adds r0, r2, r1
	strb r6, [r0]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r1, r8
	strb r0, [r1]
	ldr r4, _08073988 @ =IWRAM_START + 0x8
	adds r5, r2, r4
	ldr r0, _0807398C @ =IWRAM_START + 0x128
	adds r2, r2, r0
	str r2, [r5]
	movs r4, #0
	movs r0, #5
	strh r0, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #8]
	str r3, [r5, #0xc]
	str r3, [r5, #0x10]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	ldr r0, [r5]
	strh r3, [r0, #8]
	ldr r0, [r5]
	strh r3, [r0, #0x14]
	ldr r0, [r5]
	strh r3, [r0, #0x1c]
	ldr r0, [r5]
	adds r0, #0x21
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x25
	strb r4, [r0]
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldr r0, _08073990 @ =0x06012BC0
	str r0, [r1, #4]
	ldr r0, _08073994 @ =0x00000235
	strh r0, [r1, #0xa]
	ldr r0, [r5]
	adds r0, #0x20
	strb r4, [r0]
	ldr r0, [r5]
	bl sub_8004558
	movs r4, #0
	movs r1, #0
	mov r8, r1
	movs r6, #0
_08073952:
	lsls r0, r4, #5
	adds r0, #0x28
	adds r5, r7, r0
	strh r6, [r5, #4]
	cmp r4, #0
	bne _08073998
	movs r0, #2
	strh r0, [r5, #4]
	str r4, [r5]
	strh r4, [r5, #8]
	movs r0, #0xb0
	lsls r0, r0, #6
	str r0, [r5, #0xc]
	str r4, [r5, #0x10]
	b _08073A00
	.align 2, 0
_08073970: .4byte sub_8073AA8
_08073974: .4byte 0x00002010
_08073978: .4byte sub_80743B8
_0807397C: .4byte IWRAM_START + 0x1B8
_08073980: .4byte IWRAM_START + 0x1C4
_08073984: .4byte IWRAM_START + 0x1C9
_08073988: .4byte IWRAM_START + 0x8
_0807398C: .4byte IWRAM_START + 0x128
_08073990: .4byte 0x06012BC0
_08073994: .4byte 0x00000235
_08073998:
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r1, r7, r0
	str r1, [r5]
	strh r6, [r5, #8]
	str r6, [r5, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r5, #0x10]
	cmp r4, #1
	bne _08073A00
	movs r0, #4
	strh r0, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	ldr r0, [r5]
	strh r6, [r0, #8]
	ldr r0, [r5]
	strh r6, [r0, #0x14]
	ldr r0, [r5]
	strh r6, [r0, #0x1c]
	ldr r0, [r5]
	adds r0, #0x21
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldr r0, _08073AA0 @ =0x06012B80
	str r0, [r1, #4]
	movs r0, #0x8d
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	ldr r0, [r5]
	adds r0, #0x20
	strb r4, [r0]
	ldr r0, [r5]
	bl sub_8004558
_08073A00:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _08073952
	adds r5, r7, #0
	adds r5, #0xe8
	movs r4, #0xac
	lsls r4, r4, #1
	adds r1, r7, r4
	str r1, [r5]
	movs r2, #0
	movs r4, #0
	movs r0, #5
	strh r0, [r5, #4]
	adds r0, #0xfb
	strh r0, [r5, #8]
	str r4, [r5, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r5, #0x10]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	ldr r0, [r5]
	strh r4, [r0, #8]
	ldr r0, [r5]
	strh r4, [r0, #0x14]
	ldr r0, [r5]
	strh r4, [r0, #0x1c]
	ldr r0, [r5]
	adds r0, #0x21
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x25
	strb r2, [r0]
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldr r0, _08073AA4 @ =0x06012980
	str r0, [r1, #4]
	movs r0, #0x8d
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	ldr r0, [r5]
	adds r0, #0x20
	strb r2, [r0]
	ldr r0, [r5]
	bl sub_8004558
	movs r0, #0x84
	lsls r0, r0, #1
	adds r5, r7, r0
	str r4, [r5]
	movs r0, #2
	strh r0, [r5, #4]
	strh r4, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0xc]
	str r4, [r5, #0x10]
	adds r0, r7, #0
	bl sub_807447C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073AA0: .4byte 0x06012B80
_08073AA4: .4byte 0x06012980

	thumb_func_start sub_8073AA8
sub_8073AA8: @ 0x08073AA8
	push {r4, r5, lr}
	ldr r0, _08073AD4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8074260
	ldr r0, _08073AD8 @ =IWRAM_START + 0xF0
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r1, r2
	beq _08073AE0
	cmp r1, r2
	bls _08073ADC
	subs r0, #1
	b _08073ADE
	.align 2, 0
_08073AD4: .4byte gCurTask
_08073AD8: .4byte IWRAM_START + 0xF0
_08073ADC:
	adds r0, #1
_08073ADE:
	strh r0, [r4]
_08073AE0:
	adds r0, r5, #0
	bl sub_807447C
	adds r0, r5, #0
	bl sub_80741B4
	adds r0, r5, #0
	bl sub_807432C
	cmp r0, #0
	beq _08073AFC
	adds r0, r5, #0
	bl sub_8074088
_08073AFC:
	adds r0, r5, #0
	bl sub_80745B4
	cmp r0, #0
	beq _08073B0E
	adds r0, r5, #0
	bl sub_8074604
	b _08073B14
_08073B0E:
	adds r0, r5, #0
	bl sub_80742A8
_08073B14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073B1C
sub_8073B1C: @ 0x08073B1C
	push {r4, r5, lr}
	ldr r0, _08073B70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _08073B74 @ =gUnknown_030059E0
	ldr r2, [r3, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08073B3E
	movs r5, #0x2c
	ldrsh r0, [r3, r5]
	cmp r0, #0x78
	bne _08073B4C
_08073B3E:
	ldr r0, _08073B78 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r3, #0x20]
	ldr r0, _08073B7C @ =IWRAM_START + 0x1B8
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_08073B4C:
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r1, r4, r2
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xc
	lsrs r1, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #1
	cmp r1, r0
	bls _08073B80
	adds r1, r0, #0
	b _08073B86
	.align 2, 0
_08073B70: .4byte gCurTask
_08073B74: .4byte gUnknown_030059E0
_08073B78: .4byte 0xFFBFFFFF
_08073B7C: .4byte IWRAM_START + 0x1B8
_08073B80:
	cmp r1, #0x3f
	bhi _08073B86
	movs r1, #0x40
_08073B86:
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, r1, r0
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x16
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	subs r1, r1, r0
	strh r1, [r4, #0x10]
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r2, [r2]
	cmp r0, r2
	bhi _08073BB4
	adds r0, r4, #0
	bl sub_80743BC
_08073BB4:
	adds r0, r4, #0
	bl sub_807447C
	adds r0, r4, #0
	bl sub_80741B4
	adds r0, r4, #0
	bl sub_8074550
	adds r0, r4, #0
	bl sub_80742A8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073BD4
sub_8073BD4: @ 0x08073BD4
	push {r4, r5, lr}
	ldr r0, _08073C1C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _08073C20 @ =gUnknown_030059E0
	ldr r2, [r3, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08073BF6
	movs r5, #0x2c
	ldrsh r0, [r3, r5]
	cmp r0, #0x78
	bne _08073C04
_08073BF6:
	ldr r0, _08073C24 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r3, #0x20]
	ldr r0, _08073C28 @ =IWRAM_START + 0x1B8
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_08073C04:
	movs r3, #0xdf
	lsls r3, r3, #1
	adds r1, r4, r3
	ldrh r2, [r1]
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0x3f
	ble _08073C2C
	movs r3, #0x40
	adds r0, r2, #0
	subs r0, #0x40
	b _08073C30
	.align 2, 0
_08073C1C: .4byte gCurTask
_08073C20: .4byte gUnknown_030059E0
_08073C24: .4byte 0xFFBFFFFF
_08073C28: .4byte IWRAM_START + 0x1B8
_08073C2C:
	ldrh r3, [r1]
	movs r0, #0
_08073C30:
	strh r0, [r1]
	ldrh r0, [r4, #0x10]
	adds r0, r3, r0
	strh r0, [r4, #0x10]
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08073C4C
	adds r0, r4, #0
	bl sub_8074138
_08073C4C:
	adds r0, r4, #0
	bl sub_807447C
	adds r0, r4, #0
	bl sub_80741B4
	adds r0, r4, #0
	bl sub_8074550
	adds r0, r4, #0
	bl sub_80742A8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8073C6C
sub_8073C6C: @ 0x08073C6C
	push {r4, r5, r6, lr}
	ldr r0, _08073CD4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08073CD8 @ =IWRAM_START + 0x1BE
	adds r5, r1, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r0, r4, #0
	bl sub_80744D0
	adds r6, r0, #0
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r0, r4, #0
	bl sub_8074490
	adds r0, r4, #0
	bl sub_807447C
	adds r0, r4, #0
	movs r1, #7
	bl sub_8074448
	ldr r1, _08073CDC @ =0xFFFFFF00
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08073D0A
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08073CBC
	rsbs r0, r0, #0
_08073CBC:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08073CC6
	movs r2, #1
_08073CC6:
	ldr r0, _08073CE0 @ =0x000001FF
	cmp r1, r0
	bhi _08073CE4
	cmp r2, r1
	bhi _08073CF6
	subs r0, r1, r2
	b _08073CF0
	.align 2, 0
_08073CD4: .4byte gCurTask
_08073CD8: .4byte IWRAM_START + 0x1BE
_08073CDC: .4byte 0xFFFFFF00
_08073CE0: .4byte 0x000001FF
_08073CE4:
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	cmp r2, r0
	bgt _08073CF6
	adds r0, r1, r2
_08073CF0:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08073CF8
_08073CF6:
	movs r1, #0
_08073CF8:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r2, _08073D44 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0xf0
	strh r0, [r1]
_08073D0A:
	adds r0, r4, #0
	bl sub_80741B4
	movs r0, #0xdf
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08073D26
	cmp r6, #0
	bne _08073D2C
_08073D26:
	adds r0, r4, #0
	bl sub_80743E4
_08073D2C:
	adds r0, r4, #0
	bl sub_80742A8
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073D44: .4byte 0x000003FF

	thumb_func_start sub_8073D48
sub_8073D48: @ 0x08073D48
	push {r4, r5, r6, lr}
	ldr r0, _08073DBC @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8074260
	ldr r0, _08073DC0 @ =IWRAM_START + 0x1BE
	adds r4, r4, r0
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r0, r5, #0
	bl sub_80744D0
	adds r6, r0, #0
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r0, r5, #0
	bl sub_8074490
	adds r0, r5, #0
	bl sub_807447C
	adds r0, r5, #0
	movs r1, #7
	bl sub_8074448
	ldr r3, _08073DC4 @ =0xFFFFFF00
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r1, r2
	beq _08073DF4
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08073DA2
	rsbs r0, r0, #0
_08073DA2:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08073DAC
	movs r4, #1
_08073DAC:
	ldr r0, _08073DC8 @ =0x000001FF
	cmp r1, r0
	bhi _08073DCC
	subs r0, r2, r1
	cmp r4, r0
	bgt _08073DE0
	adds r0, r1, r4
	b _08073DD6
	.align 2, 0
_08073DBC: .4byte gCurTask
_08073DC0: .4byte IWRAM_START + 0x1BE
_08073DC4: .4byte 0xFFFFFF00
_08073DC8: .4byte 0x000001FF
_08073DCC:
	ldr r3, _08073DDC @ =0xFFFFFE00
	adds r0, r1, r3
	cmp r4, r0
	bgt _08073DE0
	subs r0, r1, r4
_08073DD6:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08073DE2
	.align 2, 0
_08073DDC: .4byte 0xFFFFFE00
_08073DE0:
	adds r1, r2, #0
_08073DE2:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r3, _08073E1C @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	strh r0, [r1]
_08073DF4:
	adds r0, r5, #0
	bl sub_80741B4
	movs r0, #0xdf
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	cmp r6, #0
	bne _08073E10
	adds r0, r5, #0
	bl sub_8074400
_08073E10:
	adds r0, r5, #0
	bl sub_80742A8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073E1C: .4byte 0x000003FF

	thumb_func_start sub_8073E20
sub_8073E20: @ 0x08073E20
	push {r4, r5, r6, lr}
	ldr r0, _08073E88 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8074260
	adds r0, r5, #0
	bl sub_807447C
	ldr r0, _08073E8C @ =IWRAM_START + 0x1C0
	adds r3, r4, r0
	ldr r0, [r3]
	cmp r0, #0
	bne _08073E46
	b _08073FFC
_08073E46:
	ldr r1, _08073E90 @ =IWRAM_START + 0x1BE
	adds r0, r4, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08073E9C
	adds r1, #4
	adds r0, r4, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r6, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r3, r0, #0
	subs r0, r6, r3
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	ble _08073E74
	ldr r2, _08073E94 @ =0x0000FFE0
_08073E74:
	subs r0, r3, r6
	asrs r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, _08073E98 @ =IWRAM_START + 0xF0
	adds r1, r4, r3
	strh r0, [r1]
	b _08073F56
	.align 2, 0
_08073E88: .4byte gCurTask
_08073E8C: .4byte IWRAM_START + 0x1C0
_08073E90: .4byte IWRAM_START + 0x1BE
_08073E94: .4byte 0x0000FFE0
_08073E98: .4byte IWRAM_START + 0xF0
_08073E9C:
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08073ECC
	ldr r2, _08073EB8 @ =IWRAM_START + 0x1C2
	adds r0, r4, r2
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	ble _08073EBC
	cmp r1, #0x20
	bgt _08073F54
	b _08073EC4
	.align 2, 0
_08073EB8: .4byte IWRAM_START + 0x1C2
_08073EBC:
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08073F04
_08073EC4:
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08073F56
_08073ECC:
	cmp r0, #0
	ble _08073F0C
	ldr r0, _08073EE8 @ =IWRAM_START + 0x1C2
	adds r2, r4, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08073EEC
	movs r4, #0
	ldrsh r0, [r3, r4]
	movs r3, #0
	ldrsh r1, [r2, r3]
	b _08073EF8
	.align 2, 0
_08073EE8: .4byte IWRAM_START + 0x1C2
_08073EEC:
	ldr r1, _08073F08 @ =IWRAM_START + 0x1BC
	adds r0, r4, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r4, #0
	ldrsh r0, [r2, r4]
_08073EF8:
	subs r0, r0, r1
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _08073F56
_08073F04:
	movs r2, #0x20
	b _08073F56
	.align 2, 0
_08073F08: .4byte IWRAM_START + 0x1BC
_08073F0C:
	ldr r0, _08073F34 @ =IWRAM_START + 0x1C2
	adds r1, r4, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08073F3C
	ldr r2, _08073F38 @ =IWRAM_START + 0x1BC
	adds r1, r4, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	ble _08073F56
	b _08073F54
	.align 2, 0
_08073F34: .4byte IWRAM_START + 0x1C2
_08073F38: .4byte IWRAM_START + 0x1BC
_08073F3C:
	movs r4, #0
	ldrsh r0, [r1, r4]
	movs r2, #0
	ldrsh r1, [r3, r2]
	subs r1, r1, r0
	lsls r1, r1, #0xc
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08073F56
_08073F54:
	ldr r2, _08073FC8 @ =0x0000FFE0
_08073F56:
	movs r4, #0xe1
	lsls r4, r4, #1
	adds r3, r5, r4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r3]
	adds r1, r0, r2
	strh r1, [r3]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r5, r3
	movs r4, #0
	ldrsh r2, [r0, r4]
	cmp r2, #0
	ble _08073F7C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	ble _08073F88
_08073F7C:
	cmp r2, #0
	bge _08073FDA
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	blt _08073FDA
_08073F88:
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r4, #0xe1
	lsls r4, r4, #1
	adds r3, r5, r4
	strh r1, [r3]
	subs r4, #6
	adds r0, r5, r4
	strh r1, [r0]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	rsbs r0, r0, #0
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08073FCC
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08073FBE
	rsbs r0, r0, #0
_08073FBE:
	cmp r0, #0x80
	bgt _08073FCE
	movs r0, #0
	strh r0, [r2]
	b _08073FCE
	.align 2, 0
_08073FC8: .4byte 0x0000FFE0
_08073FCC:
	strh r0, [r3]
_08073FCE:
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08073FDA:
	movs r3, #0xe1
	lsls r3, r3, #1
	adds r0, r5, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	ldrh r4, [r5, #0x30]
	adds r0, r0, r4
	ldr r1, _08074058 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0x30]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08074004
_08073FFC:
	ldr r0, _0807405C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074060 @ =sub_8073AA8
	str r0, [r1, #8]
_08074004:
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	bge _08074014
	rsbs r1, r1, #0
_08074014:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08074064
	adds r0, r5, #0
	bl sub_807432C
	cmp r0, #0
	beq _08074032
	adds r0, r5, #0
	bl sub_807447C
	adds r0, r5, #0
	bl sub_8074088
_08074032:
	adds r0, r5, #0
	bl sub_80745B4
	cmp r0, #0
	beq _08074064
	movs r4, #0xe2
	lsls r4, r4, #1
	adds r0, r5, r4
	ldr r1, [r0]
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807405C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08074082
	.align 2, 0
_08074058: .4byte 0x000003FF
_0807405C: .4byte gCurTask
_08074060: .4byte sub_8073AA8
_08074064:
	adds r0, r5, #0
	bl sub_80741B4
	adds r0, r5, #0
	bl sub_80745B4
	cmp r0, #0
	beq _0807407C
	adds r0, r5, #0
	bl sub_8074604
	b _08074082
_0807407C:
	adds r0, r5, #0
	bl sub_80742A8
_08074082:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8074088
sub_8074088: @ 0x08074088
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080740E0 @ =gUnknown_030059E0
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x37
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_8074550
	movs r0, #0xdc
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #1
	str r0, [r1]
	ldrh r0, [r4, #0x12]
	lsls r1, r0, #1
	movs r3, #0xde
	lsls r3, r3, #1
	adds r2, r5, r3
	strh r1, [r2]
	lsls r0, r0, #0x11
	asrs r1, r0, #0x10
	ldr r0, _080740E4 @ =0x0000077F
	cmp r1, r0
	bgt _080740E8
	adds r0, #1
	b _080740F0
	.align 2, 0
_080740E0: .4byte gUnknown_030059E0
_080740E4: .4byte 0x0000077F
_080740E8:
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	ble _080740F2
_080740F0:
	strh r0, [r2]
_080740F2:
	movs r1, #0xde
	lsls r1, r1, #1
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r2, #0
	strh r1, [r0]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r5, r3
	strh r2, [r0]
	ldr r0, _0807412C @ =gUnknown_030059E0
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldr r0, _08074130 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074134 @ =sub_8073B1C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807412C: .4byte gUnknown_030059E0
_08074130: .4byte gCurTask
_08074134: .4byte sub_8073B1C

	thumb_func_start sub_8074138
sub_8074138: @ 0x08074138
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _080741A4 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r4, #0x80
	ands r4, r1
	cmp r4, #0
	bne _08074178
	movs r0, #0xdc
	lsls r0, r0, #1
	adds r5, r3, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _08074178
	ldr r0, _080741A8 @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #9
	movs r0, #7
	strb r0, [r1]
	strh r4, [r2, #0x10]
	movs r1, #0xde
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	str r4, [r5]
_08074178:
	movs r2, #0xde
	lsls r2, r2, #1
	adds r0, r3, r2
	ldrh r0, [r0]
	rsbs r0, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r2, r3, r1
	movs r1, #0
	strh r0, [r2]
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
	ldr r0, _080741AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080741B0 @ =sub_8073C6C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080741A4: .4byte gUnknown_030059E0
_080741A8: .4byte 0xFFBFFFFF
_080741AC: .4byte gCurTask
_080741B0: .4byte sub_8073C6C

	thumb_func_start sub_80741B4
sub_80741B4: @ 0x080741B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r7, #0
	ldr r2, _08074254 @ =gUnknown_03005960
	ldr r0, [r0]
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	mov r1, sl
	ldr r0, [r1, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #8
	mov r8, r0
	movs r0, #0
	mov ip, r0
_080741DE:
	mov r1, ip
	lsls r3, r1, #5
	adds r3, #8
	add r3, sl
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r1, _08074258 @ =gSineTable
	adds r0, r0, r1
	ldrh r4, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x16
	ldr r6, [r3, #0xc]
	adds r2, r6, #0
	muls r2, r4, r2
	asrs r2, r2, #8
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r5, [r3, #0x10]
	adds r0, r5, #0
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	add sb, r2
	muls r1, r6, r1
	asrs r1, r1, #8
	adds r0, r5, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	add r8, r1
	ldrh r0, [r3, #8]
	adds r7, r7, r0
	ldr r1, _0807425C @ =0x000003FF
	adds r0, r1, #0
	ands r7, r0
	strh r7, [r3, #0x14]
	mov r0, sb
	str r0, [r3, #0x18]
	mov r1, r8
	str r1, [r3, #0x1c]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #8
	bls _080741DE
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074254: .4byte gUnknown_03005960
_08074258: .4byte gSineTable
_0807425C: .4byte 0x000003FF

	thumb_func_start sub_8074260
sub_8074260: @ 0x08074260
	push {lr}
	adds r2, r0, #0
	adds r2, #8
	ldrh r0, [r2, #8]
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r1, r3
	bne _08074276
	movs r0, #1
	b _080742A2
_08074276:
	cmp r1, r3
	bls _08074288
	subs r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r3
	bhi _080742A0
	b _08074294
_08074288:
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	ldr r1, _0807429C @ =0x01FF0000
	cmp r0, r1
	bls _080742A0
_08074294:
	strh r3, [r2, #8]
	movs r0, #1
	b _080742A2
	.align 2, 0
_0807429C: .4byte 0x01FF0000
_080742A0:
	movs r0, #0
_080742A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80742A8
sub_80742A8: @ 0x080742A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r6, #0
	mov r5, sp
_080742B2:
	lsls r0, r6, #5
	adds r0, #8
	adds r4, r7, r0
	ldrh r1, [r4, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08074310
	ldr r1, [r4]
	ldr r0, [r4, #0x18]
	asrs r0, r0, #8
	strh r0, [r1, #0x16]
	ldr r1, [r4]
	ldr r0, [r4, #0x1c]
	asrs r0, r0, #8
	strh r0, [r1, #0x18]
	ldrh r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807430A
	ldrh r0, [r4, #0x14]
	strh r0, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r0, #0x16]
	strh r1, [r5, #6]
	ldrh r1, [r0, #0x18]
	strh r1, [r5, #8]
	ldr r3, _08074324 @ =gUnknown_030054B8
	ldrb r1, [r3]
	adds r2, r1, #1
	strb r2, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08074328 @ =0x00002060
	orrs r1, r2
	str r1, [r0, #0x10]
	mov r1, sp
	bl sub_8004860
_0807430A:
	ldr r0, [r4]
	bl sub_80051E8
_08074310:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #8
	bls _080742B2
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074324: .4byte gUnknown_030054B8
_08074328: .4byte 0x00002060

	thumb_func_start sub_807432C
sub_807432C: @ 0x0807432C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, _080743A8 @ =gUnknown_030059E0
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080743B0
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080743B0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080743B0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r3, [r0]
	lsls r3, r3, #8
	adds r1, #4
	adds r0, r2, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	ldr r1, _080743AC @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r3, r3, #0x10
	adds r0, r3, #0
	subs r0, #0x18
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bgt _080743B0
	adds r0, #0x30
	cmp r0, r2
	blt _080743B0
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x18
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080743B0
	adds r0, r3, #0
	adds r0, #0x18
	cmp r0, r2
	blt _080743B0
	movs r0, #1
	b _080743B2
	.align 2, 0
_080743A8: .4byte gUnknown_030059E0
_080743AC: .4byte gUnknown_03005960
_080743B0:
	movs r0, #0
_080743B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80743B8
sub_80743B8: @ 0x080743B8
	bx lr
	.align 2, 0

	thumb_func_start sub_80743BC
sub_80743BC: @ 0x080743BC
	ldrh r2, [r0, #0x10]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r2
	lsls r1, r1, #1
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r1, [r0]
	ldr r0, _080743DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080743E0 @ =sub_8073BD4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080743DC: .4byte gCurTask
_080743E0: .4byte sub_8073BD4

	thumb_func_start sub_80743E4
sub_80743E4: @ 0x080743E4
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080743F8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080743FC @ =sub_8073D48
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080743F8: .4byte gCurTask
_080743FC: .4byte sub_8073D48

	thumb_func_start sub_8074400
sub_8074400: @ 0x08074400
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r2, #0
	strh r2, [r0]
	adds r0, r3, #0
	adds r0, #0xf0
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r4, #0xc0
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, #0xe1
	lsls r1, r1, #1
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, #4
	adds r0, r3, r4
	strh r2, [r0]
	ldr r0, _08074440 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074444 @ =sub_8073E20
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074440: .4byte gCurTask
_08074444: .4byte sub_8073E20

	thumb_func_start sub_8074448
sub_8074448: @ 0x08074448
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0
	movs r3, #0
	cmp r2, r1
	bhi _08074470
	ldr r0, _08074478 @ =0x000003FF
	adds r5, r0, #0
_0807445C:
	lsls r0, r3, #5
	adds r0, r4, r0
	ldrh r0, [r0, #0x10]
	adds r2, r2, r0
	ands r2, r5
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r1
	bls _0807445C
_08074470:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08074478: .4byte 0x000003FF

	thumb_func_start sub_807447C
sub_807447C: @ 0x0807447C
	ldrh r2, [r0, #0x10]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	subs r1, r1, r2
	subs r3, #1
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0, #0x30]
	bx lr

	thumb_func_start sub_8074490
sub_8074490: @ 0x08074490
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #2
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	movs r1, #0xc0
	lsls r1, r1, #4
_0807449E:
	lsls r0, r4, #5
	adds r0, #8
	adds r2, r6, r0
	ldr r0, [r2, #0x10]
	adds r0, r0, r5
	str r0, [r2, #0x10]
	cmp r0, r1
	ble _080744B2
	str r1, [r2, #0x10]
	b _080744BA
_080744B2:
	ldr r3, _080744CC @ =0xFFFFF400
	cmp r0, r3
	bge _080744BA
	str r3, [r2, #0x10]
_080744BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0807449E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080744CC: .4byte 0xFFFFF400

	thumb_func_start sub_80744D0
sub_80744D0: @ 0x080744D0
	push {lr}
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	movs r1, #7
	bl sub_80744E0
	pop {r1}
	bx r1

	thumb_func_start sub_80744E0
sub_80744E0: @ 0x080744E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r0, r4, #5
	adds r0, #8
	adds r1, r6, r0
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	adds r3, r0, #0
	cmp r0, #0
	bge _080744FE
	rsbs r3, r0, #0
_080744FE:
	movs r2, #0xc0
	lsls r2, r2, #4
	cmp r3, r2
	bgt _0807450C
	str r0, [r1, #0x10]
	movs r0, #1
	b _08074548
_0807450C:
	cmp r5, #0
	ble _08074520
	ldr r3, _0807451C @ =0xFFFFF400
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	str r2, [r1, #0x10]
	b _0807452A
	.align 2, 0
_0807451C: .4byte 0xFFFFF400
_08074520:
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08074538 @ =0xFFFFF400
	str r0, [r1, #0x10]
_0807452A:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bne _0807453C
	movs r0, #0
	b _08074548
	.align 2, 0
_08074538: .4byte 0xFFFFF400
_0807453C:
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80744E0
_08074548:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074550
sub_8074550: @ 0x08074550
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r5, _08074594 @ =gUnknown_030059E0
	ldr r2, [r5, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080745AE
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080745AE
	subs r1, #0x94
	adds r0, r3, r1
	ldr r4, _08074598 @ =gUnknown_03005960
	ldr r1, [r4, #4]
	adds r1, #0x18
	lsls r1, r1, #8
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _0807459C
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r1, [r4]
	adds r1, #6
	b _080745A6
	.align 2, 0
_08074594: .4byte gUnknown_030059E0
_08074598: .4byte gUnknown_03005960
_0807459C:
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r1, [r4]
	subs r1, #6
_080745A6:
	lsls r1, r1, #8
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r5, #8]
_080745AE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80745B4
sub_80745B4: @ 0x080745B4
	push {lr}
	ldr r1, [r0]
	ldr r3, _080745F8 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _080745F2
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080745F2
	subs r1, #0x80
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080745FC
_080745F2:
	movs r0, #1
	b _080745FE
	.align 2, 0
_080745F8: .4byte gUnknown_03005960
_080745FC:
	movs r0, #0
_080745FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074604
sub_8074604: @ 0x08074604
	push {lr}
	adds r2, r0, #0
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r0]
	movs r3, #0xe4
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08074628 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08074628: .4byte gCurTask

	thumb_func_start sub_807462C
sub_807462C: @ 0x0807462C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _08074898 @ =sub_8074B68
	ldr r2, _0807489C @ =0x00002010
	ldr r1, _080748A0 @ =sub_8074C04
	str r1, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r6, r0
	mov r1, sb
	movs r0, #3
	ldrsb r0, [r1, r0]
	ldr r2, _080748A4 @ =IWRAM_START + 0x6C
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0
	strh r0, [r2]
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r7, #0x70]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r7, #0x74]
	ldrb r1, [r1]
	ldr r4, _080748A8 @ =IWRAM_START + 0x7C
	adds r0, r6, r4
	strb r1, [r0]
	ldr r1, _080748AC @ =IWRAM_START + 0x7D
	adds r0, r6, r1
	mov r2, r8
	strb r2, [r0]
	mov r4, sb
	str r4, [r7, #0x78]
	ldr r0, _080748B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #5
	bne _080746B2
	movs r0, #1
	str r0, [sp, #8]
_080746B2:
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	ldr r2, _080748B4 @ =IWRAM_START + 0x21
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r4, _080748B8 @ =IWRAM_START + 0x22
	adds r0, r6, r4
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #4
	adds r0, r6, r2
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	ldr r2, _080748BC @ =gUnknown_080DFA10
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	lsls r5, r1, #1
	adds r5, r5, r1
	lsls r5, r5, #6
	adds r0, r0, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r4, _080748C0 @ =IWRAM_START + 0x20
	adds r0, r6, r4
	strb r1, [r0]
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl VramMalloc
	str r0, [r7, #4]
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [sp, #0xc]
	adds r1, r2, #6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r0, _080748C4 @ =IWRAM_START + 0x30
	adds r4, r6, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	ldr r3, [sp, #0x10]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]
	ldr r3, _080748C8 @ =IWRAM_START + 0x51
	adds r1, r6, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _080748CC @ =IWRAM_START + 0x52
	adds r0, r6, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r6, r1
	movs r3, #0
	strb r3, [r0]
	mov r0, r8
	str r0, [r4, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r4, #0x10]
	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #0
	adds r1, #0xe
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _080748D0 @ =IWRAM_START + 0x50
	adds r0, r6, r3
	strb r1, [r0]
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #0xc]
	bl VramMalloc
	str r0, [r4, #4]
	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [sp, #0xc]
	adds r1, r2, #0
	adds r1, #0x12
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r4, #0x10]
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r7, #0
	bl sub_8074C20
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_8004558
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r1, sb
	strb r0, [r1]
	ldr r2, _080748D4 @ =gUnknown_080DFB90
	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r4, _080748D8 @ =IWRAM_START + 0x60
	adds r0, r6, r4
	strh r1, [r0]
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _080748DC @ =IWRAM_START + 0x62
	adds r0, r6, r3
	strh r1, [r0]
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r6, r3
	strh r1, [r0]
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r4, _080748E0 @ =IWRAM_START + 0x66
	adds r0, r6, r4
	strh r1, [r0]
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r3, #4
	adds r0, r6, r3
	strh r1, [r0]
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0xa
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _080748E4 @ =IWRAM_START + 0x6A
	adds r0, r6, r2
	strh r1, [r0]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074898: .4byte sub_8074B68
_0807489C: .4byte 0x00002010
_080748A0: .4byte sub_8074C04
_080748A4: .4byte IWRAM_START + 0x6C
_080748A8: .4byte IWRAM_START + 0x7C
_080748AC: .4byte IWRAM_START + 0x7D
_080748B0: .4byte gCurrentLevel
_080748B4: .4byte IWRAM_START + 0x21
_080748B8: .4byte IWRAM_START + 0x22
_080748BC: .4byte gUnknown_080DFA10
_080748C0: .4byte IWRAM_START + 0x20
_080748C4: .4byte IWRAM_START + 0x30
_080748C8: .4byte IWRAM_START + 0x51
_080748CC: .4byte IWRAM_START + 0x52
_080748D0: .4byte IWRAM_START + 0x50
_080748D4: .4byte gUnknown_080DFB90
_080748D8: .4byte IWRAM_START + 0x60
_080748DC: .4byte IWRAM_START + 0x62
_080748E0: .4byte IWRAM_START + 0x66
_080748E4: .4byte IWRAM_START + 0x6A

	thumb_func_start sub_80748E8
sub_80748E8: @ 0x080748E8
	push {lr}
	ldr r2, _0807491C @ =gUnknown_030059E0
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0x18
	strb r1, [r3]
	ldr r1, [r0, #0x70]
	lsls r1, r1, #8
	str r1, [r2, #8]
	ldr r1, [r0, #0x74]
	lsls r1, r1, #8
	str r1, [r2, #0xc]
	adds r3, #5
	movs r1, #0x10
	strh r1, [r3]
	adds r0, #0x6c
	ldrh r0, [r0]
	cmp r0, #7
	bls _08074910
	b _08074AA6
_08074910:
	lsls r0, r0, #2
	ldr r1, _08074920 @ =_08074924
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807491C: .4byte gUnknown_030059E0
_08074920: .4byte _08074924
_08074924: @ jump table
	.4byte _08074944 @ case 0
	.4byte _08074968 @ case 1
	.4byte _08074998 @ case 2
	.4byte _080749C4 @ case 3
	.4byte _080749F8 @ case 4
	.4byte _08074A1C @ case 5
	.4byte _08074A48 @ case 6
	.4byte _08074A74 @ case 7
_08074944:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074964 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074964: .4byte gSineTable
_08074968:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074994 @ =gSineTable
	movs r3, #0x90
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xe0
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074994: .4byte gSineTable
_08074998:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _080749C0 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	b _08074A9C
	.align 2, 0
_080749C0: .4byte gSineTable
_080749C4:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _080749F4 @ =gSineTable
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	b _08074A9E
	.align 2, 0
_080749F4: .4byte gSineTable
_080749F8:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08074A18 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #2
	b _08074A9A
	.align 2, 0
_08074A18: .4byte gSineTable
_08074A1C:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08074A44 @ =gSineTable
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #2
	b _08074A9A
	.align 2, 0
_08074A44: .4byte gSineTable
_08074A48:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _08074A70 @ =gSineTable
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074A70: .4byte gSineTable
_08074A74:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074AB8 @ =gSineTable
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xa0
	lsls r0, r0, #3
_08074A9A:
	adds r1, r1, r0
_08074A9C:
	ldrh r0, [r1]
_08074A9E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x12]
_08074AA6:
	ldr r0, _08074ABC @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _08074AC0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074AC4 @ =sub_8074BBC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08074AB8: .4byte gSineTable
_08074ABC: .4byte 0x00000115
_08074AC0: .4byte gCurTask
_08074AC4: .4byte sub_8074BBC

	thumb_func_start sub_8074AC8
sub_8074AC8: @ 0x08074AC8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08074ADC @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08074AE4
	b _08074B5A
	.align 2, 0
_08074ADC: .4byte gUnknown_030059E0
_08074AE0:
	movs r0, #1
	b _08074B5C
_08074AE4:
	ldr r3, [r7, #0x70]
	ldr r0, _08074B64 @ =gUnknown_03005960
	ldr r4, [r0]
	subs r3, r3, r4
	ldr r2, [r7, #0x74]
	ldr r5, [r0, #4]
	subs r2, r2, r5
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	movs r4, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
_08074B12:
	lsls r2, r4, #2
	adds r2, r7, r2
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r1, r3, r1
	subs r1, #0xc
	adds r2, #0x62
	ldrh r0, [r2]
	adds r0, r6, r0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, r5
	bgt _08074B50
	adds r0, #0x18
	cmp r0, r5
	blt _08074B50
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08074B50
	adds r0, r2, #0
	adds r0, #0x18
	cmp r0, r1
	bge _08074AE0
_08074B50:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08074B12
_08074B5A:
	movs r0, #0
_08074B5C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074B64: .4byte gUnknown_03005960

	thumb_func_start sub_8074B68
sub_8074B68: @ 0x08074B68
	push {r4, r5, lr}
	ldr r0, _08074B98 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8074AC8
	cmp r0, #0
	beq _08074B86
	adds r0, r4, #0
	bl sub_80748E8
_08074B86:
	adds r0, r4, #0
	bl sub_8074C48
	cmp r0, #0
	beq _08074B9C
	adds r0, r4, #0
	bl sub_8074C98
	b _08074BB0
	.align 2, 0
_08074B98: .4byte gCurTask
_08074B9C:
	adds r0, r4, #0
	bl sub_8074C20
	adds r0, r4, #0
	bl sub_80051E8
	ldr r1, _08074BB8 @ =IWRAM_START + 0x30
	adds r0, r5, r1
	bl sub_80051E8
_08074BB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074BB8: .4byte IWRAM_START + 0x30

	thumb_func_start sub_8074BBC
sub_8074BBC: @ 0x08074BBC
	push {r4, r5, r6, lr}
	ldr r6, _08074BF8 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	adds r0, r4, #0
	bl sub_8074C20
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08074BFC @ =IWRAM_START + 0x30
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_8074AC8
	cmp r0, #0
	bne _08074BF0
	ldr r1, [r6]
	ldr r0, _08074C00 @ =sub_8074B68
	str r0, [r1, #8]
_08074BF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074BF8: .4byte gCurTask
_08074BFC: .4byte IWRAM_START + 0x30
_08074C00: .4byte sub_8074B68

	thumb_func_start sub_8074C04
sub_8074C04: @ 0x08074C04
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8074C20
sub_8074C20: @ 0x08074C20
	ldr r2, [r0, #0x70]
	ldr r3, _08074C44 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	strh r2, [r0, #0x16]
	ldr r1, [r0, #0x74]
	ldr r3, [r3, #4]
	subs r1, r1, r3
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x46
	strh r2, [r1]
	ldr r1, [r0, #0x74]
	subs r1, r1, r3
	adds r0, #0x48
	strh r1, [r0]
	bx lr
	.align 2, 0
_08074C44: .4byte gUnknown_03005960

	thumb_func_start sub_8074C48
sub_8074C48: @ 0x08074C48
	push {lr}
	ldr r1, [r0, #0x70]
	ldr r3, _08074C8C @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x74]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x82
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _08074C86
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0xc
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08074C86
	subs r1, #0x18
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08074C90
_08074C86:
	movs r0, #1
	b _08074C92
	.align 2, 0
_08074C8C: .4byte gUnknown_03005960
_08074C90:
	movs r0, #0
_08074C92:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074C98
sub_8074C98: @ 0x08074C98
	push {lr}
	ldr r1, [r0, #0x78]
	adds r0, #0x7c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08074CB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08074CB0: .4byte gCurTask

	thumb_func_start sub_8074CB4
sub_8074CB4: @ 0x08074CB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08074D7C @ =sub_80750A8
	ldr r2, _08074D80 @ =0x00002010
	ldr r1, _08074D84 @ =sub_8075140
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _08074D88 @ =IWRAM_START + 0xC
	adds r0, r0, r7
	mov sb, r0
	movs r3, #0
	mov r1, r8
	str r3, [r1, #0x44]
	str r3, [r1, #0x48]
	ldr r2, _08074D8C @ =IWRAM_START + 0x50
	adds r0, r7, r2
	movs r2, #0
	strh r3, [r0]
	mov r0, sl
	str r0, [r1]
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	movs r0, #0x90
	lsls r0, r0, #3
	mov r1, sb
	strh r0, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r0, _08074D90 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08074D94 @ =IWRAM_START + 0x2E
	adds r1, r7, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08074D98 @ =IWRAM_START + 0x31
	adds r0, r7, r1
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, sb
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	mov r0, r8
	str r3, [r0, #0x4c]
	str r3, [r2, #4]
	str r3, [sp, #4]
	bl sub_8075284
	mov r1, sl
	ldrb r0, [r1, #5]
	ldr r3, [sp, #4]
	ldrb r2, [r1, #6]
	cmp r0, r2
	bls _08074DC8
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08074DA8
	ldr r0, _08074D9C @ =IWRAM_START + 0x52
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _08074DA0 @ =IWRAM_START + 0x54
	adds r0, r7, r1
	strh r3, [r0]
	ldr r2, _08074DA4 @ =IWRAM_START + 0x56
	adds r0, r7, r2
	strh r3, [r0]
	b _08074E0A
	.align 2, 0
_08074D7C: .4byte sub_80750A8
_08074D80: .4byte 0x00002010
_08074D84: .4byte sub_8075140
_08074D88: .4byte IWRAM_START + 0xC
_08074D8C: .4byte IWRAM_START + 0x50
_08074D90: .4byte IWRAM_START + 0x2D
_08074D94: .4byte IWRAM_START + 0x2E
_08074D98: .4byte IWRAM_START + 0x31
_08074D9C: .4byte IWRAM_START + 0x52
_08074DA0: .4byte IWRAM_START + 0x54
_08074DA4: .4byte IWRAM_START + 0x56
_08074DA8:
	ldr r0, _08074DBC @ =IWRAM_START + 0x52
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _08074DC0 @ =IWRAM_START + 0x54
	adds r0, r7, r1
	strh r3, [r0]
	ldr r2, _08074DC4 @ =IWRAM_START + 0x56
	b _08074E04
	.align 2, 0
_08074DBC: .4byte IWRAM_START + 0x52
_08074DC0: .4byte IWRAM_START + 0x54
_08074DC4: .4byte IWRAM_START + 0x56
_08074DC8:
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08074DF4
	ldr r2, _08074DE8 @ =IWRAM_START + 0x52
	adds r0, r7, r2
	strh r3, [r0]
	ldr r0, _08074DEC @ =IWRAM_START + 0x54
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _08074DF0 @ =IWRAM_START + 0x56
	adds r0, r7, r1
	strh r3, [r0]
	b _08074E0A
	.align 2, 0
_08074DE8: .4byte IWRAM_START + 0x52
_08074DEC: .4byte IWRAM_START + 0x54
_08074DF0: .4byte IWRAM_START + 0x56
_08074DF4:
	ldr r2, _08074E3C @ =IWRAM_START + 0x52
	adds r0, r7, r2
	strh r3, [r0]
	ldr r0, _08074E40 @ =IWRAM_START + 0x54
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	adds r2, #4
_08074E04:
	adds r1, r7, r2
	movs r0, #0x80
	strh r0, [r1]
_08074E0A:
	mov r0, r8
	bl sub_8074FD8
	mov r0, sb
	bl sub_8004558
	mov r0, r8
	bl sub_8074E44
	mov r0, r8
	bl sub_80751B4
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sl
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074E3C: .4byte IWRAM_START + 0x52
_08074E40: .4byte IWRAM_START + 0x54

	thumb_func_start sub_8074E44
sub_8074E44: @ 0x08074E44
	push {r4, r5, lr}
	mov ip, r0
	ldr r5, [r0]
	mov r1, ip
	adds r1, #0x52
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08074E82
	ldrb r2, [r5, #5]
	lsls r2, r2, #0xb
	ldr r4, _08074EE8 @ =gSineTable
	adds r3, r0, #0
	ldr r0, _08074EEC @ =gUnknown_03005590
	adds r1, #4
	ldrh r1, [r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _08074EF0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x44]
_08074E82:
	mov r1, ip
	adds r1, #0x54
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08074EBA
	ldrb r2, [r5, #6]
	lsls r2, r2, #0xb
	ldr r4, _08074EE8 @ =gSineTable
	adds r3, r0, #0
	ldr r0, _08074EEC @ =gUnknown_03005590
	adds r1, #2
	ldrh r1, [r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _08074EF0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x48]
_08074EBA:
	mov r0, ip
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r2, ip
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074EE8: .4byte gSineTable
_08074EEC: .4byte gUnknown_03005590
_08074EF0: .4byte 0x000003FF

	thumb_func_start sub_8074EF4
sub_8074EF4: @ 0x08074EF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08074F38 @ =gUnknown_030059E0
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _08074FD0
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r3, r5, #0
	bl sub_800CDBC
	adds r2, r0, #0
	cmp r2, #0
	beq _08074FD0
	ldr r3, [r5, #0xc]
	asrs r1, r3, #8
	ldr r0, [r4, #0x40]
	cmp r1, r0
	bge _08074F3C
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #8
	adds r0, r3, r0
	str r0, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	b _08074F52
	.align 2, 0
_08074F38: .4byte gUnknown_030059E0
_08074F3C:
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r2
	cmp r1, #0
	beq _08074F5C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r0, r3, r0
	str r0, [r5, #0xc]
	movs r2, #0x12
	ldrsh r0, [r5, r2]
_08074F52:
	cmp r0, #0
	ble _08074F58
	strh r6, [r5, #0x12]
_08074F58:
	movs r0, #2
	b _08074FD2
_08074F5C:
	movs r4, #0x80
	lsls r4, r4, #0xa
	ands r4, r2
	cmp r4, #0
	beq _08074F7A
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r0, r3, r0
	str r0, [r5, #0xc]
	movs r2, #0x12
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08074FCC
	strh r1, [r5, #0x12]
	b _08074FCC
_08074F7A:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r2
	cmp r3, #0
	beq _08074FA4
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08074FCC
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x14]
	b _08074FCC
_08074FA4:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _08074FD0
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08074FCC
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_08074FCC:
	movs r0, #1
	b _08074FD2
_08074FD0:
	movs r0, #0
_08074FD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8074FD8
sub_8074FD8: @ 0x08074FD8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08075012
	ldr r0, _08074FFC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _08075004
	movs r0, #0
	ldr r1, _08075000 @ =0x0000023B
	strh r1, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2c
	b _08075040
	.align 2, 0
_08074FFC: .4byte gCurrentLevel
_08075000: .4byte 0x0000023B
_08075004:
	movs r0, #0
	movs r1, #0x8e
	lsls r1, r1, #2
	strh r1, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2c
	b _08075040
_08075012:
	ldr r0, _0807502C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x1a
	cmp r1, #2
	bne _08075034
	ldr r0, _08075030 @ =0x0000023B
	strh r0, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _08075042
	.align 2, 0
_0807502C: .4byte gCurrentLevel
_08075030: .4byte 0x0000023B
_08075034:
	movs r0, #0x8e
	lsls r0, r0, #2
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #2
_08075040:
	strb r0, [r1]
_08075042:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075048
sub_8075048: @ 0x08075048
	push {lr}
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08075080
	ldr r0, _0807506C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _08075074
	ldr r0, _08075070 @ =0x0000023B
	strh r0, [r1, #0x16]
	adds r1, #0x2c
	movs r0, #1
	b _080750A2
	.align 2, 0
_0807506C: .4byte gCurrentLevel
_08075070: .4byte 0x0000023B
_08075074:
	movs r0, #0x8e
	lsls r0, r0, #2
	strh r0, [r1, #0x16]
	adds r1, #0x2c
	movs r0, #1
	b _080750A2
_08075080:
	ldr r0, _08075090 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _08075098
	ldr r0, _08075094 @ =0x0000023B
	b _0807509C
	.align 2, 0
_08075090: .4byte gCurrentLevel
_08075094: .4byte 0x0000023B
_08075098:
	movs r0, #0x8e
	lsls r0, r0, #2
_0807509C:
	strh r0, [r1, #0x16]
	adds r1, #0x2c
	movs r0, #3
_080750A2:
	strb r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_80750A8
sub_80750A8: @ 0x080750A8
	push {r4, r5, lr}
	ldr r0, _080750D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8074E44
	adds r0, r4, #0
	bl sub_8075228
	cmp r0, #0
	beq _080750D8
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080750F2
	adds r0, r4, #0
	bl sub_80752BC
	b _080750F2
	.align 2, 0
_080750D4: .4byte gCurTask
_080750D8:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080750F2
	adds r0, r4, #0
	bl sub_8075284
	adds r0, r4, #0
	bl sub_8074FD8
	ldr r1, _0807511C @ =IWRAM_START + 0xC
	adds r0, r5, r1
	bl sub_8004558
_080750F2:
	adds r0, r4, #0
	bl sub_8074EF4
	cmp r0, #2
	bne _08075102
	adds r0, r4, #0
	bl sub_8075154
_08075102:
	adds r0, r4, #0
	bl sub_80751CC
	cmp r0, #0
	beq _08075124
	ldr r1, [r4]
	ldrb r0, [r4, #8]
	strb r0, [r1]
	ldr r0, _08075120 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08075138
	.align 2, 0
_0807511C: .4byte IWRAM_START + 0xC
_08075120: .4byte gCurTask
_08075124:
	adds r0, r4, #0
	bl sub_80751B4
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08075138
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_08075138:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075140
sub_8075140: @ 0x08075140
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_80752BC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075154
sub_8075154: @ 0x08075154
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08075174 @ =gUnknown_030059E0
	adds r2, r1, #0
	adds r2, #0x6d
	movs r0, #0xe
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r2, [r0]
	cmp r2, #0
	beq _08075178
	adds r1, #0x6e
	movs r0, #3
	strb r0, [r1]
	b _0807517E
	.align 2, 0
_08075174: .4byte gUnknown_030059E0
_08075178:
	adds r0, r1, #0
	adds r0, #0x6e
	strb r2, [r0]
_0807517E:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _0807518A
	adds r0, r4, #0
	bl sub_8075284
_0807518A:
	adds r0, r4, #0
	bl sub_8075048
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	movs r0, #0x99
	bl m4aSongNumStart
	ldr r0, _080751AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080751B0 @ =sub_80752D8
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080751AC: .4byte gCurTask
_080751B0: .4byte sub_80752D8

	thumb_func_start sub_80751B4
sub_80751B4: @ 0x080751B4
	ldr r1, [r0, #0x3c]
	ldr r3, _080751C8 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_080751C8: .4byte gUnknown_03005960

	thumb_func_start sub_80751CC
sub_80751CC: @ 0x080751CC
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _0807521C @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r0, [r4, #5]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _08075216
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08075216
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _08075216
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r1, r3
	cmp r2, r0
	ble _08075220
_08075216:
	movs r0, #1
	b _08075222
	.align 2, 0
_0807521C: .4byte gUnknown_03005960
_08075220:
	movs r0, #0
_08075222:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8075228
sub_8075228: @ 0x08075228
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _08075278 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r0, [r4, #5]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _08075272
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08075272
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _08075272
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	ble _0807527C
_08075272:
	movs r0, #1
	b _0807527E
	.align 2, 0
_08075278: .4byte gUnknown_03005960
_0807527C:
	movs r0, #0
_0807527E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8075284
sub_8075284: @ 0x08075284
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080752AE
	ldr r0, _080752B4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	movs r0, #0x1c
	bl VramMalloc
	str r0, [r4, #0x10]
	ldr r0, _080752B8 @ =0x0000FFFF
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	str r0, [r4, #0x4c]
_080752AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080752B4: .4byte gCurrentLevel
_080752B8: .4byte 0x0000FFFF

	thumb_func_start sub_80752BC
sub_80752BC: @ 0x080752BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080752D2
	ldr r0, [r4, #0x10]
	bl VramFree
	movs r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x4c]
_080752D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80752D8
sub_80752D8: @ 0x080752D8
	push {r4, r5, lr}
	ldr r0, _0807530C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8074E44
	adds r0, r4, #0
	bl sub_80751B4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08075310
	adds r0, r5, #0
	bl sub_8004558
	b _08075316
	.align 2, 0
_0807530C: .4byte gCurTask
_08075310:
	adds r0, r4, #0
	bl sub_8075334
_08075316:
	adds r0, r4, #0
	bl sub_8074EF4
	cmp r0, #2
	bne _08075326
	adds r0, r4, #0
	bl sub_8075154
_08075326:
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075334
sub_8075334: @ 0x08075334
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #1
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	bl sub_8074FD8
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08075368 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807536C @ =sub_80750A8
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075368: .4byte gCurTask
_0807536C: .4byte sub_80750A8

	thumb_func_start sub_8075370
sub_8075370: @ 0x08075370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08075484 @ =sub_8075834
	ldr r2, _08075488 @ =0x00002010
	ldr r1, _0807548C @ =sub_807587C
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r3, r5
	ldr r1, _08075490 @ =IWRAM_START + 0xC
	adds r0, r3, r1
	ldr r2, _08075494 @ =IWRAM_START + 0x44
	adds r1, r3, r2
	movs r7, #0
	mov ip, r7
	movs r2, #0
	strh r2, [r1]
	ldr r7, _08075498 @ =IWRAM_START + 0x46
	adds r1, r3, r7
	strh r2, [r1]
	mov r7, sl
	ldrb r1, [r7, #3]
	ldr r7, _0807549C @ =IWRAM_START + 0x48
	adds r7, r7, r3
	mov sb, r7
	strb r1, [r7]
	strh r6, [r5, #4]
	mov r1, r8
	strh r1, [r5, #6]
	mov r7, sl
	str r7, [r5]
	ldrb r1, [r7]
	strb r1, [r5, #8]
	strb r4, [r5, #9]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	ldr r1, _080754A0 @ =IWRAM_START + 0x2D
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r7, _080754A4 @ =IWRAM_START + 0x2E
	adds r2, r3, r7
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _080754A8 @ =IWRAM_START + 0x31
	adds r1, r3, r2
	mov r7, ip
	strb r7, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r4, _080754AC @ =gUnknown_080DFBF0
	mov r1, sb
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r2, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _080754B0 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #4]
	mov r7, sb
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r4, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	ldr r2, _080754B4 @ =IWRAM_START + 0x2C
	adds r3, r3, r2
	strb r1, [r3]
	mov r7, sl
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r6, r6, #8
	adds r1, r1, r6
	str r1, [r5, #0x3c]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r1, r8
	str r1, [r5, #0x40]
	movs r7, #2
	rsbs r7, r7, #0
	adds r1, r7, #0
	mov r2, sl
	strb r1, [r2]
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075484: .4byte sub_8075834
_08075488: .4byte 0x00002010
_0807548C: .4byte sub_807587C
_08075490: .4byte IWRAM_START + 0xC
_08075494: .4byte IWRAM_START + 0x44
_08075498: .4byte IWRAM_START + 0x46
_0807549C: .4byte IWRAM_START + 0x48
_080754A0: .4byte IWRAM_START + 0x2D
_080754A4: .4byte IWRAM_START + 0x2E
_080754A8: .4byte IWRAM_START + 0x31
_080754AC: .4byte gUnknown_080DFBF0
_080754B0: .4byte 0x06010000
_080754B4: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_80754B8
sub_80754B8: @ 0x080754B8
	push {r4, r5, r6, lr}
	ldr r3, _080754E4 @ =gCurTask
	ldr r0, [r3]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x4a
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0807552C
	cmp r0, #4
	bgt _080754E8
	cmp r0, #0
	beq _080754EE
	b _08075588
	.align 2, 0
_080754E4: .4byte gCurTask
_080754E8:
	cmp r0, #6
	beq _08075574
	b _08075588
_080754EE:
	ldr r3, _08075520 @ =gSineTable
	ldr r1, _08075524 @ =IWRAM_START + 0x49
	adds r2, r4, r1
	ldrb r0, [r2]
	lsls r0, r0, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	ldr r6, _08075528 @ =IWRAM_START + 0x44
	adds r1, r4, r6
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	b _0807555E
	.align 2, 0
_08075520: .4byte gSineTable
_08075524: .4byte IWRAM_START + 0x49
_08075528: .4byte IWRAM_START + 0x44
_0807552C:
	ldr r3, _08075568 @ =gSineTable
	ldr r6, _0807556C @ =IWRAM_START + 0x49
	adds r2, r4, r6
	ldrb r0, [r2]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	rsbs r0, r0, #0
	subs r6, #5
	adds r1, r4, r6
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	rsbs r0, r0, #0
_0807555E:
	ldr r2, _08075570 @ =IWRAM_START + 0x46
	adds r1, r4, r2
	strh r0, [r1]
	b _08075588
	.align 2, 0
_08075568: .4byte gSineTable
_0807556C: .4byte IWRAM_START + 0x49
_08075570: .4byte IWRAM_START + 0x46
_08075574:
	ldr r6, _0807559C @ =IWRAM_START + 0x44
	adds r0, r4, r6
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080755A0 @ =IWRAM_START + 0x46
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, [r3]
	ldr r0, _080755A4 @ =sub_8075834
	str r0, [r1, #8]
_08075588:
	adds r0, r5, #0
	bl sub_8075880
	adds r0, r5, #0
	bl sub_80758B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807559C: .4byte IWRAM_START + 0x44
_080755A0: .4byte IWRAM_START + 0x46
_080755A4: .4byte sub_8075834

	thumb_func_start sub_80755A8
sub_80755A8: @ 0x080755A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	bl sub_8075678
	adds r1, r7, #0
	adds r1, #0x49
	movs r2, #0
	mov ip, r2
	strb r0, [r1]
	ldr r2, _08075660 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _08075664 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r0, r7, #0
	adds r0, #0x4a
	mov r3, ip
	strb r3, [r0]
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	ldr r4, _08075668 @ =gUnknown_080DFC20
	adds r5, r7, #0
	adds r5, #0x48
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	str r2, [sp]
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r6, #0
	ldrsh r3, [r2, r6]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, ip
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	rsbs r2, r2, #0
	asrs r2, r2, #3
	str r2, [sp]
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r1, _0807566C @ =gUnknown_080DFC30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08075670 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075674 @ =sub_80754B8
	str r0, [r1, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075660: .4byte gUnknown_030059E0
_08075664: .4byte 0xFFFFFEFF
_08075668: .4byte gUnknown_080DFC20
_0807566C: .4byte gUnknown_080DFC30
_08075670: .4byte gCurTask
_08075674: .4byte sub_80754B8

	thumb_func_start sub_8075678
sub_8075678: @ 0x08075678
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r0, _080757B4 @ =gUnknown_030059E0
	mov sb, r0
	ldr r4, [r0, #8]
	asrs r4, r4, #8
	mov r1, sl
	ldr r0, [r1, #0x3c]
	subs r4, r4, r0
	mov r2, sb
	ldr r5, [r2, #0xc]
	asrs r5, r5, #8
	ldr r0, [r1, #0x40]
	subs r5, r5, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8085530
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0xe
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0xe
	adds r0, r5, #0
	adds r1, r6, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl ArcTan2
	mov r8, r0
	mov r3, r8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x18
	mov r8, r3
	mov r0, sl
	adds r0, #0x49
	strb r3, [r0]
	mov r5, sb
	ldrh r4, [r5, #0x10]
	rsbs r4, r4, #0
	ldrh r5, [r5, #0x12]
	rsbs r5, r5, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8085530
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #8
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x16
	lsrs r4, r4, #0x10
	lsls r5, r5, #8
	adds r0, r5, #0
	adds r1, r6, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x16
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl ArcTan2
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	mov r1, r8
	movs r2, #8
	bl sub_808558C
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r3, _080757B8 @ =gUnknown_080DFC20
	movs r0, #0x48
	add sl, r0
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _080757BC @ =gSineTable
	lsls r0, r4, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, sb
	strh r0, [r1, #0x10]
	mov r5, sl
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r4, r4, #3
	adds r4, r4, r2
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r5, sb
	strh r0, [r5, #0x12]
	movs r0, #0x6d
	add sb, r0
	movs r0, #5
	mov r1, sb
	strb r0, [r1]
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080757B4: .4byte gUnknown_030059E0
_080757B8: .4byte gUnknown_080DFC20
_080757BC: .4byte gSineTable

	thumb_func_start sub_80757C0
sub_80757C0: @ 0x080757C0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08075828 @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807582C
	ldr r0, [r5, #8]
	asrs r2, r0, #8
	ldr r1, [r3, #0x3c]
	subs r0, r1, r2
	cmp r0, #0
	bge _080757E0
	subs r0, r2, r1
_080757E0:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	asrs r2, r0, #8
	ldr r1, [r3, #0x40]
	subs r0, r1, r2
	cmp r0, #0
	bge _080757F4
	subs r0, r2, r1
_080757F4:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08075808
	adds r3, r4, #0
_08075808:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bgt _0807582C
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r1, #0x90
	lsls r1, r1, #2
	cmp r0, r1
	bgt _0807582C
	movs r0, #1
	b _0807582E
	.align 2, 0
_08075828: .4byte gUnknown_030059E0
_0807582C:
	movs r0, #0
_0807582E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8075834
sub_8075834: @ 0x08075834
	push {r4, lr}
	ldr r0, _08075864 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80757C0
	cmp r0, #0
	beq _08075852
	adds r0, r4, #0
	bl sub_80755A8
_08075852:
	adds r0, r4, #0
	bl sub_80758E8
	cmp r0, #0
	beq _08075868
	adds r0, r4, #0
	bl sub_8075924
	b _08075874
	.align 2, 0
_08075864: .4byte gCurTask
_08075868:
	adds r0, r4, #0
	bl sub_8075880
	adds r0, r4, #0
	bl sub_80758B8
_08075874:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807587C
sub_807587C: @ 0x0807587C
	bx lr
	.align 2, 0

	thumb_func_start sub_8075880
sub_8075880: @ 0x08075880
	mov ip, r0
	mov r3, ip
	adds r3, #0xc
	ldr r1, [r0, #0x3c]
	ldr r2, _080758B4 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	mov r0, ip
	ldr r1, [r0, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x18]
	bx lr
	.align 2, 0
_080758B4: .4byte gUnknown_03005960

	thumb_func_start sub_80758B8
sub_80758B8: @ 0x080758B8
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _080758E4 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080758E4: .4byte 0xFFFFFBFF

	thumb_func_start sub_80758E8
sub_80758E8: @ 0x080758E8
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08075918 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _08075912
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _0807591C
_08075912:
	movs r0, #1
	b _0807591E
	.align 2, 0
_08075918: .4byte gUnknown_03005960
_0807591C:
	movs r0, #0
_0807591E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075924
sub_8075924: @ 0x08075924
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08075938 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08075938: .4byte gCurTask

	thumb_func_start sub_807593C
sub_807593C: @ 0x0807593C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	mov sb, r2
	adds r6, r3, #0
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08075A5C @ =sub_8075C6C
	ldr r2, _08075A60 @ =0x00002010
	ldr r1, _08075A64 @ =sub_8075CC0
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r3, r5
	ldr r2, _08075A68 @ =IWRAM_START + 0xC
	adds r0, r3, r2
	ldr r1, _08075A6C @ =IWRAM_START + 0x4B
	adds r2, r3, r1
	movs r4, #0
	movs r1, #3
	strb r1, [r2]
	ldr r2, _08075A70 @ =IWRAM_START + 0x44
	adds r1, r3, r2
	movs r2, #0
	mov ip, r2
	strh r4, [r1]
	ldr r2, _08075A74 @ =IWRAM_START + 0x46
	adds r1, r3, r2
	strh r4, [r1]
	ldrb r1, [r7, #3]
	adds r2, #2
	adds r2, r2, r3
	mov sl, r2
	strb r1, [r2]
	mov r1, r8
	strh r1, [r5, #4]
	mov r2, sb
	strh r2, [r5, #6]
	str r7, [r5]
	ldrb r1, [r7]
	strb r1, [r5, #8]
	strb r6, [r5, #9]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	ldr r1, _08075A78 @ =IWRAM_START + 0x2D
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _08075A7C @ =IWRAM_START + 0x2E
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _08075A80 @ =IWRAM_START + 0x31
	adds r1, r3, r2
	mov r2, ip
	strb r2, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r4, _08075A84 @ =gUnknown_080DFC40
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r2, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _08075A88 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #4]
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r4, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	ldr r2, _08075A8C @ =IWRAM_START + 0x2C
	adds r3, r3, r2
	strb r1, [r3]
	ldrb r1, [r7]
	lsls r1, r1, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r1, r8
	str r1, [r5, #0x3c]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	mov r2, sb
	lsls r2, r2, #8
	mov sb, r2
	add r1, sb
	str r1, [r5, #0x40]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r7]
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075A5C: .4byte sub_8075C6C
_08075A60: .4byte 0x00002010
_08075A64: .4byte sub_8075CC0
_08075A68: .4byte IWRAM_START + 0xC
_08075A6C: .4byte IWRAM_START + 0x4B
_08075A70: .4byte IWRAM_START + 0x44
_08075A74: .4byte IWRAM_START + 0x46
_08075A78: .4byte IWRAM_START + 0x2D
_08075A7C: .4byte IWRAM_START + 0x2E
_08075A80: .4byte IWRAM_START + 0x31
_08075A84: .4byte gUnknown_080DFC40
_08075A88: .4byte 0x06010000
_08075A8C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_8075A90
sub_8075A90: @ 0x08075A90
	push {r4, r5, r6, lr}
	ldr r0, _08075AB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x4a
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08075ABC
	cmp r0, #4
	beq _08075B04
	b _08075B32
	.align 2, 0
_08075AB8: .4byte gCurTask
_08075ABC:
	ldr r3, _08075AF4 @ =gSineTable
	ldr r1, _08075AF8 @ =IWRAM_START + 0x49
	adds r2, r4, r1
	ldrb r0, [r2]
	lsls r0, r0, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r6, _08075AFC @ =IWRAM_START + 0x44
	adds r1, r4, r6
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r2, _08075B00 @ =IWRAM_START + 0x46
	adds r1, r4, r2
	strh r0, [r1]
	b _08075B32
	.align 2, 0
_08075AF4: .4byte gSineTable
_08075AF8: .4byte IWRAM_START + 0x49
_08075AFC: .4byte IWRAM_START + 0x44
_08075B00: .4byte IWRAM_START + 0x46
_08075B04:
	ldr r6, _08075B24 @ =IWRAM_START + 0x44
	adds r0, r4, r6
	movs r1, #0
	strh r1, [r0]
	ldr r2, _08075B28 @ =IWRAM_START + 0x46
	adds r0, r4, r2
	strh r1, [r0]
	adds r6, #7
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _08075B2C
	adds r0, r5, #0
	bl sub_8075DE8
	b _08075B48
	.align 2, 0
_08075B24: .4byte IWRAM_START + 0x44
_08075B28: .4byte IWRAM_START + 0x46
_08075B2C:
	adds r0, r5, #0
	bl sub_8075CC4
_08075B32:
	adds r0, r5, #0
	bl sub_8075CF0
	adds r0, r5, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075B48
	adds r0, r5, #0
	bl sub_8075D28
_08075B48:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075B50
sub_8075B50: @ 0x08075B50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #0
	mov ip, r0
	movs r0, #0xc0
	strb r0, [r1]
	ldr r3, _08075C4C @ =gUnknown_030059E0
	ldr r4, _08075C50 @ =gUnknown_080DFC6A
	adds r7, r6, #0
	adds r7, #0x48
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	movs r2, #0
	strh r0, [r3, #0x12]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #0x39
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	subs r1, #7
	ldr r0, _08075C54 @ =0x0000FFFF
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4a
	strb r2, [r0]
	ldr r0, [r6, #0x3c]
	ldr r1, [r6, #0x40]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	str r2, [sp]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r5, #0
	ldrsh r3, [r2, r5]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, ip
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r0, [r6, #0x3c]
	ldr r1, [r6, #0x40]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	rsbs r2, r2, #0
	asrs r2, r2, #3
	str r2, [sp]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	adds r1, r6, #0
	adds r1, #0x4b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08075C2C
	ldr r1, _08075C58 @ =gUnknown_080DFC40
	ldrh r0, [r1, #0x28]
	lsls r0, r0, #5
	ldr r5, _08075C5C @ =0x06010000
	adds r0, r0, r5
	str r0, [r6, #0x10]
	ldrh r0, [r1, #0x24]
	strh r0, [r6, #0x16]
	ldrh r1, [r1, #0x26]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
_08075C2C:
	ldr r1, _08075C60 @ =gUnknown_080DFC78
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08075C64 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075C68 @ =sub_8075A90
	str r0, [r1, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C4C: .4byte gUnknown_030059E0
_08075C50: .4byte gUnknown_080DFC6A
_08075C54: .4byte 0x0000FFFF
_08075C58: .4byte gUnknown_080DFC40
_08075C5C: .4byte 0x06010000
_08075C60: .4byte gUnknown_080DFC78
_08075C64: .4byte gCurTask
_08075C68: .4byte sub_8075A90

	thumb_func_start sub_8075C6C
sub_8075C6C: @ 0x08075C6C
	push {r4, r5, lr}
	ldr r0, _08075C9C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8075D98
	cmp r0, #0
	beq _08075C8A
	adds r0, r4, #0
	bl sub_8075B50
_08075C8A:
	adds r0, r4, #0
	bl sub_8075D58
	cmp r0, #0
	beq _08075CA0
	adds r0, r4, #0
	bl sub_8075DE8
	b _08075CB6
	.align 2, 0
_08075C9C: .4byte gCurTask
_08075CA0:
	adds r0, r4, #0
	bl sub_8075CF0
	ldr r1, _08075CBC @ =IWRAM_START + 0x4B
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075CB6
	adds r0, r4, #0
	bl sub_8075D28
_08075CB6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075CBC: .4byte IWRAM_START + 0x4B

	thumb_func_start sub_8075CC0
sub_8075CC0: @ 0x08075CC0
	bx lr
	.align 2, 0

	thumb_func_start sub_8075CC4
sub_8075CC4: @ 0x08075CC4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075CE4
	ldr r0, _08075CDC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075CE0 @ =sub_8075C6C
	str r0, [r1, #8]
	b _08075CEA
	.align 2, 0
_08075CDC: .4byte gCurTask
_08075CE0: .4byte sub_8075C6C
_08075CE4:
	adds r0, r1, #0
	bl sub_8075DE8
_08075CEA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075CF0
sub_8075CF0: @ 0x08075CF0
	mov ip, r0
	mov r3, ip
	adds r3, #0xc
	ldr r1, [r0, #0x3c]
	ldr r2, _08075D24 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	mov r0, ip
	ldr r1, [r0, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x18]
	bx lr
	.align 2, 0
_08075D24: .4byte gUnknown_03005960

	thumb_func_start sub_8075D28
sub_8075D28: @ 0x08075D28
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _08075D54 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075D54: .4byte 0xFFFFFBFF

	thumb_func_start sub_8075D58
sub_8075D58: @ 0x08075D58
	push {r4, lr}
	ldr r2, [r0, #0x3c]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r1, #0
	adds r2, r2, r4
	ldr r3, _08075D8C @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, r0, r4
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xbc
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _08075D88
	movs r0, #0xa8
	lsls r0, r0, #2
	cmp r1, r0
	bls _08075D90
_08075D88:
	movs r0, #1
	b _08075D92
	.align 2, 0
_08075D8C: .4byte gUnknown_03005960
_08075D90:
	movs r0, #0
_08075D92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8075D98
sub_8075D98: @ 0x08075D98
	push {lr}
	adds r2, r0, #0
	ldr r3, _08075DDC @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08075DE0
	adds r0, r2, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075DE0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	adds r1, #0x10
	ldr r0, [r2, #0x3c]
	subs r1, r1, r0
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	adds r0, #0x18
	ldr r2, [r2, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bhi _08075DE0
	cmp r0, #0x18
	bhi _08075DE0
	movs r0, #1
	b _08075DE2
	.align 2, 0
_08075DDC: .4byte gUnknown_030059E0
_08075DE0:
	movs r0, #0
_08075DE2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075DE8
sub_8075DE8: @ 0x08075DE8
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08075DFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08075DFC: .4byte gCurTask

	thumb_func_start sub_8075E00
sub_8075E00: @ 0x08075E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #4]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08075EE4 @ =sub_8076204
	ldr r2, _08075EE8 @ =0x00002010
	ldr r1, _08075EEC @ =sub_8076254
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r1, _08075EF0 @ =IWRAM_START + 0x3C
	adds r0, r3, r1
	movs r2, #0
	mov sl, r2
	movs r4, #0
	strh r5, [r7, #0x34]
	strh r6, [r7, #0x36]
	mov r1, sb
	str r1, [r7, #0x30]
	ldrb r2, [r1]
	ldr r6, _08075EF4 @ =IWRAM_START + 0x38
	adds r1, r3, r6
	strb r2, [r1]
	ldr r2, _08075EF8 @ =IWRAM_START + 0x39
	adds r1, r3, r2
	mov r6, r8
	strb r6, [r1]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	ldr r1, _08075EFC @ =IWRAM_START + 0x5D
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r6, _08075F00 @ =IWRAM_START + 0x5E
	adds r2, r3, r6
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _08075F04 @ =IWRAM_START + 0x61
	adds r1, r3, r2
	mov r6, sl
	strb r6, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r1, _08075F08 @ =0x06013700
	str r1, [r0, #4]
	ldr r1, _08075F0C @ =0x0000023F
	strh r1, [r0, #0xa]
	ldr r1, _08075F10 @ =IWRAM_START + 0x5C
	adds r3, r3, r1
	movs r1, #0xf
	strb r1, [r3]
	mov r2, sb
	ldrb r1, [r2]
	lsls r1, r1, #3
	lsls r5, r5, #8
	adds r1, r1, r5
	str r1, [r7, #0x6c]
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldr r2, [sp, #4]
	lsls r6, r2, #8
	adds r1, r1, r6
	str r1, [r7, #0x70]
	movs r6, #2
	rsbs r6, r6, #0
	adds r1, r6, #0
	mov r2, sb
	strb r1, [r2]
	bl sub_8004558
	movs r3, #0
_08075EC8:
	lsls r0, r3, #3
	adds r2, r7, r0
	lsls r0, r3, #0xb
	movs r1, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	cmp r3, #5
	bhi _08075F3E
	lsls r0, r3, #2
	ldr r1, _08075F14 @ =_08075F18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08075EE4: .4byte sub_8076204
_08075EE8: .4byte 0x00002010
_08075EEC: .4byte sub_8076254
_08075EF0: .4byte IWRAM_START + 0x3C
_08075EF4: .4byte IWRAM_START + 0x38
_08075EF8: .4byte IWRAM_START + 0x39
_08075EFC: .4byte IWRAM_START + 0x5D
_08075F00: .4byte IWRAM_START + 0x5E
_08075F04: .4byte IWRAM_START + 0x61
_08075F08: .4byte 0x06013700
_08075F0C: .4byte 0x0000023F
_08075F10: .4byte IWRAM_START + 0x5C
_08075F14: .4byte _08075F18
_08075F18: @ jump table
	.4byte _08075F30 @ case 0
	.4byte _08075F34 @ case 1
	.4byte _08075F38 @ case 2
	.4byte _08075F38 @ case 3
	.4byte _08075F34 @ case 4
	.4byte _08075F30 @ case 5
_08075F30:
	movs r0, #0
	b _08075F3C
_08075F34:
	movs r0, #0x80
	b _08075F3C
_08075F38:
	movs r0, #0x80
	lsls r0, r0, #1
_08075F3C:
	strh r0, [r2, #4]
_08075F3E:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _08075EC8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075F58
sub_8075F58: @ 0x08075F58
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r0, _08075FA0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80762E0
	movs r6, #0
_08075F70:
	lsls r0, r6, #3
	adds r2, r4, r0
	adds r0, r4, #0
	adds r0, #0x74
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r5, #2
	ldrsh r3, [r2, r5]
	subs r1, r1, r3
	movs r5, #4
	ldrsh r0, [r2, r5]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	mov ip, r0
	adds r0, r3, #0
	cmp r1, r0
	bgt _08075FA4
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08075FBA
	.align 2, 0
_08075FA0: .4byte gCurTask
_08075FA4:
	subs r0, r1, r3
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	bgt _08075FB2
	movs r1, #0x80
_08075FB2:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	add r0, ip
	strh r0, [r2, #2]
_08075FBA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08075F70
	ldr r2, _08075FFC @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08075FE6
	ldr r0, [r4, #0x70]
	subs r0, #0x10
	lsls r0, r0, #8
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
_08075FE6:
	cmp r7, #6
	bne _08075FF0
	adds r0, r4, #0
	bl sub_8076258
_08075FF0:
	adds r0, r4, #0
	bl sub_8076114
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FFC: .4byte gUnknown_030059E0

	thumb_func_start sub_8076000
sub_8076000: @ 0x08076000
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _08076028 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r3, #0
_08076012:
	lsls r0, r3, #3
	adds r1, r4, r0
	ldrh r2, [r1, #2]
	movs r6, #2
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bne _0807602C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0807605C
	.align 2, 0
_08076028: .4byte gCurTask
_0807602C:
	cmp r0, #0
	ble _08076044
	ldr r6, _08076040 @ =0xFFFFFF00
	adds r0, r2, r6
	movs r2, #0
	strh r0, [r1, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08076056
	b _08076054
	.align 2, 0
_08076040: .4byte 0xFFFFFF00
_08076044:
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	movs r2, #0
	strh r0, [r1, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08076056
_08076054:
	strh r2, [r1, #2]
_08076056:
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_0807605C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08076012
	cmp r5, #6
	bne _08076070
	adds r0, r4, #0
	bl sub_80762A8
_08076070:
	adds r0, r4, #0
	bl sub_807618C
	cmp r0, #0
	beq _08076080
	adds r0, r4, #0
	bl sub_80762BC
_08076080:
	adds r0, r4, #0
	bl sub_8076114
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_807608C
sub_807608C: @ 0x0807608C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _080760D0 @ =gUnknown_030059E0
	ldr r4, [r1, #0x20]
	movs r0, #0x80
	ands r4, r0
	adds r5, r1, #0
	cmp r4, #0
	bne _080760E2
	bl sub_8029FF0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	strh r4, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r5, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, _080760D4 @ =0x000003FF
	cmp r1, r0
	bgt _080760D8
	adds r0, #1
	b _080760E0
	.align 2, 0
_080760D0: .4byte gUnknown_030059E0
_080760D4: .4byte 0x000003FF
_080760D8:
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	ble _080760E2
_080760E0:
	strh r0, [r5, #0x12]
_080760E2:
	ldrh r0, [r5, #0x12]
	lsls r1, r0, #1
	adds r2, r6, #0
	adds r2, #0x74
	strh r1, [r2]
	lsls r0, r0, #0x11
	ldr r1, _08076108 @ =0x3FF0000
	cmp r0, r1
	bgt _080760FA
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2]
_080760FA:
	ldr r0, _0807610C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076110 @ =sub_8075F58
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076108: .4byte 0x3FF0000
_0807610C: .4byte gCurTask
_08076110: .4byte sub_8075F58

	thumb_func_start sub_8076114
sub_8076114: @ 0x08076114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x3c
	movs r5, #0
	ldr r0, _08076188 @ =gUnknown_03005960
	mov r8, r0
_08076126:
	lsls r0, r5, #3
	adds r3, r4, r0
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08076134
	rsbs r0, r0, #0
_08076134:
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x10
	cmp r5, #2
	bls _08076142
	lsls r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r0, r0, #0x10
_08076142:
	ldr r2, [r4, #0x6c]
	adds r2, #4
	movs r7, #0
	ldrsh r1, [r3, r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r2, r2, r1
	mov r1, r8
	ldr r0, [r1]
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldr r1, [r4, #0x70]
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r2, r8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08076126
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076188: .4byte gUnknown_03005960

	thumb_func_start sub_807618C
sub_807618C: @ 0x0807618C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _080761F4 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080761FC
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _080761FC
	ldr r2, [r4, #0x6c]
	ldr r1, _080761F8 @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x70]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080761FC
	adds r0, #0x30
	cmp r0, r1
	blt _080761FC
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #9
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080761FC
	adds r0, r3, #0
	adds r0, #9
	cmp r0, r2
	blt _080761FC
	movs r0, #1
	b _080761FE
	.align 2, 0
_080761F4: .4byte gUnknown_030059E0
_080761F8: .4byte gUnknown_03005960
_080761FC:
	movs r0, #0
_080761FE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8076204
sub_8076204: @ 0x08076204
	push {r4, r5, r6, lr}
	ldr r6, _08076240 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_807618C
	cmp r0, #0
	beq _08076222
	adds r0, r4, #0
	bl sub_807608C
_08076222:
	adds r0, r4, #0
	bl sub_8076320
	cmp r0, #0
	beq _08076248
	ldr r1, [r4, #0x30]
	ldr r2, _08076244 @ =IWRAM_START + 0x38
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r6]
	bl TaskDestroy
	b _0807624E
	.align 2, 0
_08076240: .4byte gCurTask
_08076244: .4byte IWRAM_START + 0x38
_08076248:
	adds r0, r4, #0
	bl sub_8076114
_0807624E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8076254
sub_8076254: @ 0x08076254
	bx lr
	.align 2, 0

	thumb_func_start sub_8076258
sub_8076258: @ 0x08076258
	push {r4, lr}
	ldr r4, _08076298 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076288
	bl sub_802A004
	ldr r0, [r4, #0x20]
	ldr r1, _0807629C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
	movs r0, #0xa2
	lsls r0, r0, #1
	bl m4aSongNumStart
_08076288:
	ldr r0, _080762A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080762A4 @ =sub_8076000
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076298: .4byte gUnknown_030059E0
_0807629C: .4byte 0xFFBFFFFF
_080762A0: .4byte gCurTask
_080762A4: .4byte sub_8076000

	thumb_func_start sub_80762A8
sub_80762A8: @ 0x080762A8
	ldr r0, _080762B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080762B8 @ =sub_8076204
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080762B4: .4byte gCurTask
_080762B8: .4byte sub_8076204

	thumb_func_start sub_80762BC
sub_80762BC: @ 0x080762BC
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_080762C4:
	lsls r0, r1, #3
	adds r0, r2, r0
	strh r3, [r0, #2]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #5
	bls _080762C4
	adds r0, r2, #0
	bl sub_807608C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80762E0
sub_80762E0: @ 0x080762E0
	push {lr}
	adds r3, r0, #0
	ldr r2, _0807630C @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807631A
	ldr r0, [r3, #0x6c]
	adds r0, #0x18
	lsls r1, r0, #8
	ldr r0, [r2, #8]
	cmp r0, r1
	beq _0807631A
	cmp r0, r1
	ble _08076310
	subs r0, #0x80
	str r0, [r2, #8]
	cmp r0, r1
	bge _0807631A
	b _08076318
	.align 2, 0
_0807630C: .4byte gUnknown_030059E0
_08076310:
	adds r0, #0x80
	str r0, [r2, #8]
	cmp r0, r1
	ble _0807631A
_08076318:
	str r1, [r2, #8]
_0807631A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076320
sub_8076320: @ 0x08076320
	push {lr}
	ldr r1, [r0, #0x6c]
	ldr r3, _0807635C @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x70]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x82
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _08076358
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08076358
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08076360
_08076358:
	movs r0, #1
	b _08076362
	.align 2, 0
_0807635C: .4byte gUnknown_03005960
_08076360:
	movs r0, #0
_08076362:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8076368
sub_8076368: @ 0x08076368
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldr r0, _08076434 @ =sub_807680C
	ldr r2, _08076438 @ =0x00002010
	ldr r1, _0807643C @ =sub_8076844
	str r1, [sp]
	movs r1, #0x24
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r3, r1, r0
	movs r0, #0
	strb r6, [r3]
	strb r0, [r3, #1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3, #4]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #8]
	movs r1, #3
	ldrsb r1, [r7, r1]
	lsls r2, r1, #3
	strh r2, [r3, #0xc]
	movs r0, #4
	ldrsb r0, [r7, r0]
	mov ip, r0
	lsls r4, r0, #3
	strh r4, [r3, #0xe]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	adds r5, r2, r0
	strh r5, [r3, #0x10]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r6, r4, r0
	strh r6, [r3, #0x12]
	adds r1, r2, #0
	cmp r1, #0
	ble _080763E8
	movs r2, #0
_080763E8:
	strh r2, [r3, #0x14]
	adds r1, r4, #0
	mov r2, ip
	lsls r0, r2, #3
	cmp r0, #0
	ble _080763F6
	movs r1, #0
_080763F6:
	strh r1, [r3, #0x16]
	adds r0, r5, #0
	cmp r5, #0
	bge _08076400
	movs r0, #0
_08076400:
	strh r0, [r3, #0x18]
	adds r0, r6, #0
	cmp r6, #0
	bge _0807640A
	movs r0, #0
_0807640A:
	strh r0, [r3, #0x1a]
	ldrb r1, [r7]
	ldr r0, _08076440 @ =IWRAM_START + 0x20
	add r0, r8
	strb r1, [r0]
	ldr r0, _08076444 @ =IWRAM_START + 0x21
	add r0, r8
	mov r1, sb
	strb r1, [r0]
	str r7, [r3, #0x1c]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076434: .4byte sub_807680C
_08076438: .4byte 0x00002010
_0807643C: .4byte sub_8076844
_08076440: .4byte IWRAM_START + 0x20
_08076444: .4byte IWRAM_START + 0x21

	thumb_func_start sub_8076448
sub_8076448: @ 0x08076448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #8
	strb r0, [r4, #1]
	ldr r1, _0807647C @ =gUnknown_030059E0
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #4
	strh r0, [r2]
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08076480 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #5
	bne _08076484
	movs r0, #0x93
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _0807648A
	.align 2, 0
_0807647C: .4byte gUnknown_030059E0
_08076480: .4byte gCurrentLevel
_08076484:
	ldr r0, _080764A0 @ =0x00000145
	bl m4aSongNumStart
_0807648A:
	ldrb r2, [r4]
	cmp r2, #1
	bne _08076492
	b _08076584
_08076492:
	cmp r2, #1
	bgt _080764A8
	cmp r2, #0
	beq _080764B8
	ldr r3, _080764A4 @ =gCurrentLevel
	b _08076716
	.align 2, 0
_080764A0: .4byte 0x00000145
_080764A4: .4byte gCurrentLevel
_080764A8:
	cmp r2, #2
	bne _080764AE
	b _08076648
_080764AE:
	ldr r3, _080764B4 @ =gCurrentLevel
	b _08076716
	.align 2, 0
_080764B4: .4byte gCurrentLevel
_080764B8:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080764F8
	ldr r1, _080764D4 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _080764E0
	ldr r2, _080764D8 @ =gUnknown_030059E0
	ldr r1, _080764DC @ =gUnknown_080DFC94
	b _080764E4
	.align 2, 0
_080764D4: .4byte gCurrentLevel
_080764D8: .4byte gUnknown_030059E0
_080764DC: .4byte gUnknown_080DFC94
_080764E0:
	ldr r2, _080764F0 @ =gUnknown_030059E0
	ldr r1, _080764F4 @ =gUnknown_080DFC88
_080764E4:
	ldrh r0, [r1]
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	b _0807670C
	.align 2, 0
_080764F0: .4byte gUnknown_030059E0
_080764F4: .4byte gUnknown_080DFC88
_080764F8:
	cmp r0, #0
	bge _08076548
	ldr r1, _08076510 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _0807651C
	ldr r2, _08076514 @ =gUnknown_030059E0
	ldr r1, _08076518 @ =gUnknown_080DFC94
	b _08076520
	.align 2, 0
_08076510: .4byte gCurrentLevel
_08076514: .4byte gUnknown_030059E0
_08076518: .4byte gUnknown_080DFC94
_0807651C:
	ldr r2, _08076538 @ =gUnknown_030059E0
	ldr r1, _0807653C @ =gUnknown_080DFC88
_08076520:
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	movs r7, #0xe0
	ldr r5, _08076540 @ =0x0000FB80
	ldr r1, _08076544 @ =0x0000FF20
	mov r8, r1
	b _08076714
	.align 2, 0
_08076538: .4byte gUnknown_030059E0
_0807653C: .4byte gUnknown_080DFC88
_08076540: .4byte 0x0000FB80
_08076544: .4byte 0x0000FF20
_08076548:
	ldr r1, _08076560 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _0807656C
	ldr r1, _08076564 @ =gUnknown_030059E0
	strh r2, [r1, #0x10]
	ldr r0, _08076568 @ =gUnknown_080DFC94
	b _08076572
	.align 2, 0
_08076560: .4byte gCurrentLevel
_08076564: .4byte gUnknown_030059E0
_08076568: .4byte gUnknown_080DFC94
_0807656C:
	ldr r1, _0807657C @ =gUnknown_030059E0
	strh r2, [r1, #0x10]
	ldr r0, _08076580 @ =gUnknown_080DFC88
_08076572:
	ldrh r0, [r0, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #0x12]
	b _0807670C
	.align 2, 0
_0807657C: .4byte gUnknown_030059E0
_08076580: .4byte gUnknown_080DFC88
_08076584:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080765C4
	ldr r1, _080765A0 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _080765AC
	ldr r2, _080765A4 @ =gUnknown_030059E0
	ldr r1, _080765A8 @ =gUnknown_080DFC94
	b _080765B0
	.align 2, 0
_080765A0: .4byte gCurrentLevel
_080765A4: .4byte gUnknown_030059E0
_080765A8: .4byte gUnknown_080DFC94
_080765AC:
	ldr r2, _080765BC @ =gUnknown_030059E0
	ldr r1, _080765C0 @ =gUnknown_080DFC88
_080765B0:
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #6]
	b _0807667A
	.align 2, 0
_080765BC: .4byte gUnknown_030059E0
_080765C0: .4byte gUnknown_080DFC88
_080765C4:
	cmp r0, #0
	bge _08076614
	ldr r1, _080765DC @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _080765E8
	ldr r2, _080765E0 @ =gUnknown_030059E0
	ldr r1, _080765E4 @ =gUnknown_080DFC94
	b _080765EC
	.align 2, 0
_080765DC: .4byte gCurrentLevel
_080765E0: .4byte gUnknown_030059E0
_080765E4: .4byte gUnknown_080DFC94
_080765E8:
	ldr r2, _08076604 @ =gUnknown_030059E0
	ldr r1, _08076608 @ =gUnknown_080DFC88
_080765EC:
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	movs r7, #0xe0
	ldr r5, _0807660C @ =0x0000FB80
	ldr r1, _08076610 @ =0x0000FF20
	mov r8, r1
	b _08076714
	.align 2, 0
_08076604: .4byte gUnknown_030059E0
_08076608: .4byte gUnknown_080DFC88
_0807660C: .4byte 0x0000FB80
_08076610: .4byte 0x0000FF20
_08076614:
	ldr r1, _08076628 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _08076634
	ldr r2, _0807662C @ =gUnknown_030059E0
	ldr r0, _08076630 @ =gUnknown_080DFC94
	b _08076638
	.align 2, 0
_08076628: .4byte gCurrentLevel
_0807662C: .4byte gUnknown_030059E0
_08076630: .4byte gUnknown_080DFC94
_08076634:
	ldr r2, _08076640 @ =gUnknown_030059E0
	ldr r0, _08076644 @ =gUnknown_080DFC88
_08076638:
	ldrh r0, [r0, #4]
	rsbs r0, r0, #0
	b _08076706
	.align 2, 0
_08076640: .4byte gUnknown_030059E0
_08076644: .4byte gUnknown_080DFC88
_08076648:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08076694
	ldr r1, _08076664 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _08076670
	ldr r2, _08076668 @ =gUnknown_030059E0
	ldr r1, _0807666C @ =gUnknown_080DFC94
	b _08076674
	.align 2, 0
_08076664: .4byte gCurrentLevel
_08076668: .4byte gUnknown_030059E0
_0807666C: .4byte gUnknown_080DFC94
_08076670:
	ldr r2, _08076688 @ =gUnknown_030059E0
	ldr r1, _0807668C @ =gUnknown_080DFC88
_08076674:
	ldrh r0, [r1, #8]
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #0xa]
_0807667A:
	strh r0, [r2, #0x12]
	movs r7, #0xe0
	movs r5, #0
	ldr r0, _08076690 @ =0x0000FF20
	mov r8, r0
	movs r6, #0
	b _08076716
	.align 2, 0
_08076688: .4byte gUnknown_030059E0
_0807668C: .4byte gUnknown_080DFC88
_08076690: .4byte 0x0000FF20
_08076694:
	cmp r0, #0
	bge _080766E0
	ldr r1, _080766AC @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _080766B8
	ldr r2, _080766B0 @ =gUnknown_030059E0
	ldr r1, _080766B4 @ =gUnknown_080DFC94
	b _080766BC
	.align 2, 0
_080766AC: .4byte gCurrentLevel
_080766B0: .4byte gUnknown_030059E0
_080766B4: .4byte gUnknown_080DFC94
_080766B8:
	ldr r2, _080766D0 @ =gUnknown_030059E0
	ldr r1, _080766D4 @ =gUnknown_080DFC88
_080766BC:
	ldrh r0, [r1, #8]
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #0xa]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	movs r7, #0xe0
	ldr r5, _080766D8 @ =0x0000FB80
	ldr r1, _080766DC @ =0x0000FF20
	mov r8, r1
	b _08076714
	.align 2, 0
_080766D0: .4byte gUnknown_030059E0
_080766D4: .4byte gUnknown_080DFC88
_080766D8: .4byte 0x0000FB80
_080766DC: .4byte 0x0000FF20
_080766E0:
	ldr r1, _080766F4 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r3, r1, #0
	cmp r0, #5
	bne _08076700
	ldr r2, _080766F8 @ =gUnknown_030059E0
	ldr r0, _080766FC @ =gUnknown_080DFC94
	b _08076704
	.align 2, 0
_080766F4: .4byte gCurrentLevel
_080766F8: .4byte gUnknown_030059E0
_080766FC: .4byte gUnknown_080DFC94
_08076700:
	ldr r2, _08076770 @ =gUnknown_030059E0
	ldr r0, _08076774 @ =gUnknown_080DFC88
_08076704:
	ldrh r0, [r0, #8]
_08076706:
	movs r1, #0
	strh r0, [r2, #0x10]
	strh r1, [r2, #0x12]
_0807670C:
	movs r7, #0xe0
	ldr r5, _08076778 @ =0x0000FB80
	ldr r0, _0807677C @ =0x0000FF20
	mov r8, r0
_08076714:
	adds r6, r5, #0
_08076716:
	ldrb r0, [r3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #5
	beq _08076764
	ldr r4, _08076770 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
_08076764:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076770: .4byte gUnknown_030059E0
_08076774: .4byte gUnknown_080DFC88
_08076778: .4byte 0x0000FB80
_0807677C: .4byte 0x0000FF20

	thumb_func_start sub_8076780
sub_8076780: @ 0x08076780
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _080767F8 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076804
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _08076800
	ldr r2, [r5, #4]
	ldr r1, _080767FC @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #8]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xc
	ldrsh r3, [r5, r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08076804
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _08076804
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	adds r3, r0, r2
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r3, r1
	bgt _08076804
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _08076804
	movs r0, #1
	b _08076806
	.align 2, 0
_080767F8: .4byte gUnknown_030059E0
_080767FC: .4byte gUnknown_03005960
_08076800:
	subs r0, #1
	strb r0, [r5, #1]
_08076804:
	movs r0, #0
_08076806:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807680C
sub_807680C: @ 0x0807680C
	push {r4, lr}
	ldr r0, _08076840 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8076780
	cmp r0, #0
	beq _0807682A
	adds r0, r4, #0
	bl sub_8076448
_0807682A:
	adds r0, r4, #0
	bl sub_8076848
	cmp r0, #0
	beq _0807683A
	adds r0, r4, #0
	bl sub_80768AC
_0807683A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076840: .4byte gCurTask

	thumb_func_start sub_8076844
sub_8076844: @ 0x08076844
	bx lr
	.align 2, 0

	thumb_func_start sub_8076848
sub_8076848: @ 0x08076848
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #4]
	ldr r1, _080768A0 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #8]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807689A
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807689A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x1a
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807689A
	movs r2, #0x16
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _080768A4
_0807689A:
	movs r0, #1
	b _080768A6
	.align 2, 0
_080768A0: .4byte gUnknown_03005960
_080768A4:
	movs r0, #0
_080768A6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80768AC
sub_80768AC: @ 0x080768AC
	push {lr}
	ldr r1, [r0, #0x1c]
	adds r0, #0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080768C4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080768C4: .4byte gCurTask

	thumb_func_start sub_80768C8
sub_80768C8: @ 0x080768C8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_8076368
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80768E8
sub_80768E8: @ 0x080768E8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_8076368
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8076908
sub_8076908: @ 0x08076908
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_8076368
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8076928
sub_8076928: @ 0x08076928
	push {r4, r5, r6, lr}
	ldr r0, _0807694C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _08076950 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076954
	adds r0, r5, #0
	bl sub_8076CF4
	b _080769D8
	.align 2, 0
_0807694C: .4byte gCurTask
_08076950: .4byte gUnknown_030059E0
_08076954:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _08076964
	adds r0, r5, #0
	bl sub_8076D08
	b _080769D8
_08076964:
	ldr r0, [r5]
	lsls r3, r0, #8
	ldr r0, [r5, #4]
	lsls r0, r0, #8
	movs r6, #0xc0
	lsls r6, r6, #5
	adds r4, r0, r6
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _08076990
	cmp r0, r3
	ble _08076986
	subs r0, #0x80
	str r0, [r2, #8]
	cmp r0, r3
	bge _08076990
	b _0807698E
_08076986:
	adds r0, #0x80
	str r0, [r2, #8]
	cmp r0, r3
	ble _08076990
_0807698E:
	str r3, [r2, #8]
_08076990:
	ldr r0, [r2, #8]
	subs r1, r0, r3
	cmp r1, #0
	blt _080769A2
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _080769AC
	b _080769C6
_080769A2:
	subs r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bgt _080769C6
_080769AC:
	ldr r1, [r2, #0xc]
	cmp r1, r4
	beq _080769C6
	ldrh r0, [r2, #0x12]
	adds r0, #0x2a
	strh r0, [r2, #0x12]
	movs r6, #0x12
	ldrsh r0, [r2, r6]
	adds r0, r1, r0
	str r0, [r2, #0xc]
	cmp r0, r4
	ble _080769C6
	str r4, [r2, #0xc]
_080769C6:
	ldr r0, [r2, #8]
	cmp r0, r3
	bne _080769D8
	ldr r0, [r2, #0xc]
	cmp r0, r4
	bne _080769D8
	adds r0, r5, #0
	bl sub_8076C58
_080769D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80769E0
sub_80769E0: @ 0x080769E0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08076A60 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r5, _08076A64 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076A02
	adds r0, r6, #0
	bl sub_8076CF4
_08076A02:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08076A10
	adds r0, r6, #0
	bl sub_8076D08
_08076A10:
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r1, [r5, #0x12]
	adds r1, #0x2a
	strh r1, [r5, #0x12]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08076A68 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08076A4A
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
_08076A4A:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _08076A58
	adds r0, r6, #0
	bl sub_8076C70
_08076A58:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076A60: .4byte gCurTask
_08076A64: .4byte gUnknown_030059E0
_08076A68: .4byte sub_801EC3C

	thumb_func_start sub_8076A6C
sub_8076A6C: @ 0x08076A6C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08076B70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r5, _08076B74 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076A8E
	adds r0, r6, #0
	bl sub_8076CF4
_08076A8E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08076A9C
	adds r0, r6, #0
	bl sub_8076D08
_08076A9C:
	movs r2, #8
	ldrsh r1, [r6, r2]
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r6, #8]
	ldr r1, _08076B78 @ =gSineTable
	ldrb r0, [r6, #0xe]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r6, #0xa]
	ldr r1, [r5, #8]
	movs r0, #0xa
	ldrsh r2, [r6, r0]
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r2, #0x17
	ldrsb r2, [r5, r2]
	subs r0, r0, r2
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08076B7C @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08076AFA
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
_08076AFA:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r2, r5, #0
	adds r2, #0x5c
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08076B1E
	ldr r0, [r5, #8]
	adds r0, #0x80
	str r0, [r5, #8]
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
_08076B1E:
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08076B36
	ldr r0, [r5, #8]
	subs r0, #0x80
	str r0, [r5, #8]
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x20]
_08076B36:
	ldr r0, [r6]
	lsls r1, r0, #8
	ldr r2, _08076B80 @ =0xFFFFF000
	adds r0, r1, r2
	ldr r2, [r5, #8]
	cmp r0, r2
	bgt _08076B4E
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r1, r3
	cmp r0, r2
	bge _08076B54
_08076B4E:
	adds r0, r6, #0
	bl sub_8076C88
_08076B54:
	ldrh r0, [r6, #0xe]
	adds r1, r0, #1
	strh r1, [r6, #0xe]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb3
	bls _08076B68
	adds r0, r6, #0
	bl sub_8076CC0
_08076B68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076B70: .4byte gCurTask
_08076B74: .4byte gUnknown_030059E0
_08076B78: .4byte gSineTable
_08076B7C: .4byte sub_801EC3C
_08076B80: .4byte 0xFFFFF000

	thumb_func_start sub_8076B84
sub_8076B84: @ 0x08076B84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08076BD8 @ =gUnknown_030059E0
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r5, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
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
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	ldr r0, [r6, #4]
	subs r0, #8
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldr r0, _08076BDC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076BE0 @ =sub_8076928
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076BD8: .4byte gUnknown_030059E0
_08076BDC: .4byte gCurTask
_08076BE0: .4byte sub_8076928

	thumb_func_start sub_8076BE4
sub_8076BE4: @ 0x08076BE4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r5, _08076C48 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076C50
	ldr r2, [r3]
	ldr r1, _08076C4C @ =gUnknown_03005960
	ldr r4, [r1]
	adds r0, r4, #0
	adds r0, #0x14
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r3, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _08076C50
	adds r0, #0x28
	cmp r1, r0
	bge _08076C50
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08076C50
	adds r0, r2, #0
	adds r0, #0x20
	cmp r1, r0
	bge _08076C50
	movs r0, #1
	b _08076C52
	.align 2, 0
_08076C48: .4byte gUnknown_030059E0
_08076C4C: .4byte gUnknown_03005960
_08076C50:
	movs r0, #0
_08076C52:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8076C58
sub_8076C58: @ 0x08076C58
	movs r1, #0
	strh r1, [r0, #0xe]
	ldr r0, _08076C68 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076C6C @ =sub_8076DE8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08076C68: .4byte gCurTask
_08076C6C: .4byte sub_8076DE8

	thumb_func_start sub_8076C70
sub_8076C70: @ 0x08076C70
	movs r1, #0
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xe]
	ldr r0, _08076C80 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076C84 @ =sub_8076A6C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08076C80: .4byte gCurTask
_08076C84: .4byte sub_8076A6C

	thumb_func_start sub_8076C88
sub_8076C88: @ 0x08076C88
	ldr r3, _08076CB0 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	ldr r1, _08076CB4 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	strh r2, [r3, #0x10]
	strh r2, [r3, #0x12]
	ldr r0, _08076CB8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076CBC @ =sub_8076DB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08076CB0: .4byte gUnknown_030059E0
_08076CB4: .4byte 0xFFBFFFFF
_08076CB8: .4byte gCurTask
_08076CBC: .4byte sub_8076DB0

	thumb_func_start sub_8076CC0
sub_8076CC0: @ 0x08076CC0
	ldr r2, _08076CE4 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _08076CE8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0
	movs r0, #5
	strb r0, [r3]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	ldr r0, _08076CEC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076CF0 @ =sub_8076DB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08076CE4: .4byte gUnknown_030059E0
_08076CE8: .4byte 0xFFBFFFFF
_08076CEC: .4byte gCurTask
_08076CF0: .4byte sub_8076DB0

	thumb_func_start sub_8076CF4
sub_8076CF4: @ 0x08076CF4
	ldr r0, _08076D00 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076D04 @ =sub_8076DB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08076D00: .4byte gCurTask
_08076D04: .4byte sub_8076DB0

	thumb_func_start sub_8076D08
sub_8076D08: @ 0x08076D08
	ldr r2, _08076D1C @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _08076D20 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _08076D24 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076D28 @ =sub_8076DB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08076D1C: .4byte gUnknown_030059E0
_08076D20: .4byte 0xFFBFFFFF
_08076D24: .4byte gCurTask
_08076D28: .4byte sub_8076DB0

	thumb_func_start sub_8076D2C
sub_8076D2C: @ 0x08076D2C
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
	ldr r0, _08076DA4 @ =sub_8076DB0
	ldr r2, _08076DA8 @ =0x00002010
	ldr r1, _08076DAC @ =sub_8076E38
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	adds r0, #4
	str r0, [r1]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r1, #4]
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	movs r0, #3
	ldrsb r0, [r6, r0]
	strh r0, [r1, #0xc]
	str r6, [r1, #0x10]
	ldrb r0, [r6]
	strb r0, [r1, #0x14]
	mov r0, r8
	strb r0, [r1, #0x15]
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
_08076DA4: .4byte sub_8076DB0
_08076DA8: .4byte 0x00002010
_08076DAC: .4byte sub_8076E38

	thumb_func_start sub_8076DB0
sub_8076DB0: @ 0x08076DB0
	push {r4, lr}
	ldr r0, _08076DE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8076BE4
	cmp r0, #0
	beq _08076DCE
	adds r0, r4, #0
	bl sub_8076B84
_08076DCE:
	adds r0, r4, #0
	bl sub_8076EAC
	cmp r0, #0
	beq _08076DDE
	adds r0, r4, #0
	bl sub_8076EF4
_08076DDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076DE4: .4byte gCurTask

	thumb_func_start sub_8076DE8
sub_8076DE8: @ 0x08076DE8
	push {r4, r5, lr}
	ldr r0, _08076E30 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _08076E34 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076E08
	adds r0, r4, #0
	bl sub_8076CF4
_08076E08:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08076E16
	adds r0, r4, #0
	bl sub_8076D08
_08076E16:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _08076E2A
	adds r0, r4, #0
	bl sub_8076E3C
_08076E2A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076E30: .4byte gCurTask
_08076E34: .4byte gUnknown_030059E0

	thumb_func_start sub_8076E38
sub_8076E38: @ 0x08076E38
	bx lr
	.align 2, 0

	thumb_func_start sub_8076E3C
sub_8076E3C: @ 0x08076E3C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08076E98 @ =gUnknown_030059E0
	adds r2, r1, #0
	adds r2, #0x64
	movs r3, #0
	movs r0, #0x3a
	strh r0, [r2]
	strh r3, [r1, #0x10]
	ldr r2, _08076E9C @ =gUnknown_080DFCA0
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r1, #0x12]
	strh r3, [r4, #0xe]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	adds r1, #0x18
	str r3, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	movs r2, #0
	movs r3, #0x1e
	bl sub_8080AFC
	ldr r1, _08076EA0 @ =gUnknown_080DFCA8
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08076EA4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076EA8 @ =sub_80769E0
	str r0, [r1, #8]
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076E98: .4byte gUnknown_030059E0
_08076E9C: .4byte gUnknown_080DFCA0
_08076EA0: .4byte gUnknown_080DFCA8
_08076EA4: .4byte gCurTask
_08076EA8: .4byte sub_80769E0

	thumb_func_start sub_8076EAC
sub_8076EAC: @ 0x08076EAC
	push {lr}
	ldr r1, [r0]
	ldr r3, _08076EE8 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x84
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xfc
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08076EE4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08076EE4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08076EEC
_08076EE4:
	movs r0, #1
	b _08076EEE
	.align 2, 0
_08076EE8: .4byte gUnknown_03005960
_08076EEC:
	movs r0, #0
_08076EEE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8076EF4
sub_8076EF4: @ 0x08076EF4
	push {lr}
	ldr r1, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	strb r0, [r1]
	ldr r0, _08076F08 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08076F08: .4byte gCurTask

	thumb_func_start sub_8076F0C
sub_8076F0C: @ 0x08076F0C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #6]
	movs r3, #4
	ldrsh r0, [r0, r3]
	ldr r3, [r2, #8]
	mov ip, r3
	rsbs r7, r0, #0
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xa
	mov r3, ip
	subs r0, r3, r0
	str r0, [r2, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r6, [r2, #0xc]
	rsbs r5, r1, #0
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r0, r6, r0
	str r0, [r2, #0x14]
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	ldrh r1, [r2, #0x1a]
	adds r3, r0, r1
	strh r3, [r2, #0x1a]
	lsls r1, r3, #0x10
	ldr r0, _08076F8C @ =0x3FF0000
	cmp r1, r0
	bls _08076F84
	ldr r1, _08076F90 @ =0xFFFFFC00
	adds r0, r3, r1
	strh r0, [r2, #0x1a]
	mov r3, ip
	subs r0, r3, r7
	str r0, [r2, #8]
	subs r0, r6, r5
	str r0, [r2, #0xc]
	ldrh r0, [r2, #0x18]
	adds r3, r0, #1
	strh r3, [r2, #0x18]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r0, _08076F94 @ =0x0000FFFF
	cmp r1, r0
	bne _08076F84
	orrs r3, r1
	strh r3, [r2, #0x18]
_08076F84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F8C: .4byte 0x3FF0000
_08076F90: .4byte 0xFFFFFC00
_08076F94: .4byte 0x0000FFFF

	thumb_func_start sub_8076F98
sub_8076F98: @ 0x08076F98
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _08077048 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _0807704C @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077042
	ldr r0, _08077050 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077054 @ =0x0000FFFF
	cmp r1, r0
	bne _08077042
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077042:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077048: .4byte 0x000003FF
_0807704C: .4byte gSineTable
_08077050: .4byte 0xFFFFFC00
_08077054: .4byte 0x0000FFFF

	thumb_func_start sub_8077058
sub_8077058: @ 0x08077058
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _08077108 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _0807710C @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077100
	ldr r0, _08077110 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077114 @ =0x0000FFFF
	cmp r1, r0
	bne _08077100
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077100:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077108: .4byte 0x000003FF
_0807710C: .4byte gSineTable
_08077110: .4byte 0xFFFFFC00
_08077114: .4byte 0x0000FFFF

	thumb_func_start sub_8077118
sub_8077118: @ 0x08077118
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	ldr r0, _080771C8 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _080771CC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _080771C0
	ldr r0, _080771D0 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _080771D4 @ =0x0000FFFF
	cmp r1, r0
	bne _080771C0
	orrs r2, r1
	strh r2, [r4, #0x18]
_080771C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080771C8: .4byte 0x000003FF
_080771CC: .4byte gSineTable
_080771D0: .4byte 0xFFFFFC00
_080771D4: .4byte 0x0000FFFF

	thumb_func_start sub_80771D8
sub_80771D8: @ 0x080771D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _08077290 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _08077294 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077288
	ldr r0, _08077298 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _0807729C @ =0x0000FFFF
	cmp r1, r0
	bne _08077288
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077288:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077290: .4byte 0x000003FF
_08077294: .4byte gSineTable
_08077298: .4byte 0xFFFFFC00
_0807729C: .4byte 0x0000FFFF

	thumb_func_start sub_80772A0
sub_80772A0: @ 0x080772A0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r3, _08077354 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _08077358 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _0807734E
	ldr r0, _0807735C @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077360 @ =0x0000FFFF
	cmp r1, r0
	bne _0807734E
	orrs r2, r1
	strh r2, [r4, #0x18]
_0807734E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077354: .4byte 0x000003FF
_08077358: .4byte gSineTable
_0807735C: .4byte 0xFFFFFC00
_08077360: .4byte 0x0000FFFF

	thumb_func_start sub_8077364
sub_8077364: @ 0x08077364
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _0807741C @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _08077420 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077414
	ldr r0, _08077424 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077428 @ =0x0000FFFF
	cmp r1, r0
	bne _08077414
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077414:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807741C: .4byte 0x000003FF
_08077420: .4byte gSineTable
_08077424: .4byte 0xFFFFFC00
_08077428: .4byte 0x0000FFFF

	thumb_func_start sub_807742C
sub_807742C: @ 0x0807742C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _080774E4 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _080774E8 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _080774DC
	ldr r0, _080774EC @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _080774F0 @ =0x0000FFFF
	cmp r1, r0
	bne _080774DC
	orrs r2, r1
	strh r2, [r4, #0x18]
_080774DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080774E4: .4byte 0x000003FF
_080774E8: .4byte gSineTable
_080774EC: .4byte 0xFFFFFC00
_080774F0: .4byte 0x0000FFFF

	thumb_func_start sub_80774F4
sub_80774F4: @ 0x080774F4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _080775A8 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _080775AC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _080775A2
	ldr r0, _080775B0 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _080775B4 @ =0x0000FFFF
	cmp r1, r0
	bne _080775A2
	orrs r2, r1
	strh r2, [r4, #0x18]
_080775A2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080775A8: .4byte 0x000003FF
_080775AC: .4byte gSineTable
_080775B0: .4byte 0xFFFFFC00
_080775B4: .4byte 0x0000FFFF

	thumb_func_start sub_80775B8
sub_80775B8: @ 0x080775B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov ip, r1
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #3
	add r0, ip
	ldr r7, [r0, #4]
	ldrh r4, [r6, #0x1a]
	lsrs r2, r4, #3
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r1, _080776A0 @ =0x000003FF
	mov sl, r1
	mov r0, sl
	ands r2, r0
	ldr r5, _080776A4 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r7, #0
	muls r1, r0, r1
	mov r8, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r7, #0
	muls r1, r0, r1
	mov sb, r1
	mov r0, r8
	subs r0, r0, r1
	asrs r1, r0, #8
	ldr r0, [r6, #8]
	mov r8, r0
	add r1, r8
	str r1, [r6, #0x10]
	lsls r2, r2, #1
	adds r2, r2, r5
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r3, r5, r3
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x16
	adds r1, r1, r3
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #8
	ldr r1, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0x14]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #2]
	adds r4, r4, r0
	strh r4, [r6, #0x1a]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, sl
	bls _08077692
	ldr r2, _080776A8 @ =0xFFFFFC00
	adds r0, r4, r2
	strh r0, [r6, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	mov r2, sb
	subs r0, r0, r2
	asrs r0, r0, #8
	add r0, r8
	str r0, [r6, #8]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r0, r0, r3
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r6, #0xc]
	ldrh r0, [r6, #0x18]
	adds r2, r0, #1
	strh r2, [r6, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	add r0, ip
	ldrh r1, [r0]
	ldr r0, _080776AC @ =0x0000FFFF
	cmp r1, r0
	bne _08077692
	orrs r2, r1
	strh r2, [r6, #0x18]
_08077692:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080776A0: .4byte 0x000003FF
_080776A4: .4byte gSineTable
_080776A8: .4byte 0xFFFFFC00
_080776AC: .4byte 0x0000FFFF

	thumb_func_start sub_80776B0
sub_80776B0: @ 0x080776B0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _08077764 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _08077768 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _0807775E
	ldr r0, _0807776C @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077770 @ =0x0000FFFF
	cmp r1, r0
	bne _0807775E
	orrs r2, r1
	strh r2, [r4, #0x18]
_0807775E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077764: .4byte 0x000003FF
_08077768: .4byte gSineTable
_0807776C: .4byte 0xFFFFFC00
_08077770: .4byte 0x0000FFFF

	thumb_func_start sub_8077774
sub_8077774: @ 0x08077774
	str r1, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	bx lr

	thumb_func_start sub_8077788
sub_8077788: @ 0x08077788
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r4, #0x18]
	ldr r5, _080777B8 @ =0x0000FFFF
	cmp r0, r5
	beq _080777C0
	ldr r1, _080777BC @ =gUnknown_080DFCB0
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
	ldrh r1, [r4, #0x18]
	eors r1, r5
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _080777C2
	.align 2, 0
_080777B8: .4byte 0x0000FFFF
_080777BC: .4byte gUnknown_080DFCB0
_080777C0:
	movs r0, #0
_080777C2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80777C8
sub_80777C8: @ 0x080777C8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r2, _08077824 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _08077828 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r1, _0807782C @ =gUnknown_080DFE90
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x10]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r1, _08077830 @ =gUnknown_080DFEB4
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, #0x24
	strb r0, [r2]
	ldr r1, _08077834 @ =gUnknown_080DFED0
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08077838 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807783C @ =sub_80778AC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077824: .4byte gUnknown_030059E0
_08077828: .4byte 0xFFBFFFFF
_0807782C: .4byte gUnknown_080DFE90
_08077830: .4byte gUnknown_080DFEB4
_08077834: .4byte gUnknown_080DFED0
_08077838: .4byte gCurTask
_0807783C: .4byte sub_80778AC

	thumb_func_start sub_8077840
sub_8077840: @ 0x08077840
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0807789C @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077898
	ldr r3, [r2, #0x1c]
	ldr r0, _080778A0 @ =gUnknown_03005960
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r2, #0x20]
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
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	ble _080778A4
_08077898:
	movs r0, #0
	b _080778A6
	.align 2, 0
_0807789C: .4byte gUnknown_030059E0
_080778A0: .4byte gUnknown_03005960
_080778A4:
	movs r0, #1
_080778A6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80778AC
sub_80778AC: @ 0x080778AC
	push {r4, lr}
	ldr r0, _080778E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8077840
	cmp r0, #0
	beq _080778CA
	adds r0, r4, #0
	bl sub_80778E4
_080778CA:
	adds r0, r4, #0
	bl sub_807794C
	cmp r0, #0
	beq _080778DA
	adds r0, r4, #0
	bl sub_8077994
_080778DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080778E0: .4byte gCurTask

	thumb_func_start sub_80778E4
sub_80778E4: @ 0x080778E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _0807793C @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r6, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	ldr r1, [r5, #0x1c]
	lsls r1, r1, #8
	ldr r2, [r5, #0x20]
	adds r2, #4
	lsls r2, r2, #8
	adds r0, r5, #0
	bl sub_8077774
	ldr r0, _08077940 @ =0x00000141
	bl m4aSongNumStart
	ldr r0, _08077944 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08077948 @ =sub_8077A3C
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807793C: .4byte gUnknown_030059E0
_08077940: .4byte 0x00000141
_08077944: .4byte gCurTask
_08077948: .4byte sub_8077A3C

	thumb_func_start sub_807794C
sub_807794C: @ 0x0807794C
	push {lr}
	ldr r1, [r0, #0x1c]
	ldr r3, _08077988 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x20]
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
	bhi _08077984
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08077984
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807798C
_08077984:
	movs r0, #1
	b _0807798E
	.align 2, 0
_08077988: .4byte gUnknown_03005960
_0807798C:
	movs r0, #0
_0807798E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8077994
sub_8077994: @ 0x08077994
	push {lr}
	ldr r1, [r0, #0x28]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080779AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080779AC: .4byte gCurTask

	thumb_func_start sub_80779B0
sub_80779B0: @ 0x080779B0
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
	ldr r0, _08077A28 @ =sub_80778AC
	ldr r2, _08077A2C @ =0x00002010
	ldr r1, _08077A30 @ =sub_8077AA8
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r1, r3
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	strh r0, [r3, #0x24]
	str r2, [r3, #0x28]
	ldrb r2, [r2]
	ldr r7, _08077A34 @ =IWRAM_START + 0x2C
	adds r0, r1, r7
	strb r2, [r0]
	ldr r0, _08077A38 @ =IWRAM_START + 0x2D
	adds r1, r1, r0
	strb r6, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #0x20]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A28: .4byte sub_80778AC
_08077A2C: .4byte 0x00002010
_08077A30: .4byte sub_8077AA8
_08077A34: .4byte IWRAM_START + 0x2C
_08077A38: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_8077A3C
sub_8077A3C: @ 0x08077A3C
	push {r4, r5, lr}
	ldr r5, _08077A64 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08077A68 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08077A70
	bl sub_802A004
	ldr r1, [r5]
	ldr r0, _08077A6C @ =sub_80778AC
	str r0, [r1, #8]
	b _08077A9C
	.align 2, 0
_08077A64: .4byte gCurTask
_08077A68: .4byte gUnknown_030059E0
_08077A6C: .4byte sub_80778AC
_08077A70:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	movs r0, #1
	strh r0, [r2, #0x10]
	strh r1, [r2, #0x12]
	ldr r1, _08077AA4 @ =gUnknown_08C8793C
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8077788
	cmp r0, #0
	bne _08077A96
	adds r0, r4, #0
	bl sub_80777C8
_08077A96:
	adds r0, r4, #0
	bl sub_8077AAC
_08077A9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077AA4: .4byte gUnknown_08C8793C

	thumb_func_start sub_8077AA8
sub_8077AA8: @ 0x08077AA8
	bx lr
	.align 2, 0

	thumb_func_start sub_8077AAC
sub_8077AAC: @ 0x08077AAC
	ldr r2, _08077AB8 @ =gUnknown_030059E0
	ldr r1, [r0, #0x10]
	str r1, [r2, #8]
	ldr r0, [r0, #0x14]
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
_08077AB8: .4byte gUnknown_030059E0

	thumb_func_start sub_8077ABC
sub_8077ABC: @ 0x08077ABC
	push {r4, r5, lr}
	ldr r5, _08077AE4 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08077AE8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08077AF0
	bl sub_802A004
	ldr r1, [r5]
	ldr r0, _08077AEC @ =sub_8077C04
	str r0, [r1, #8]
	b _08077B1E
	.align 2, 0
_08077AE4: .4byte gCurTask
_08077AE8: .4byte gUnknown_030059E0
_08077AEC: .4byte sub_8077C04
_08077AF0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #1
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x12]
	ldr r1, _08077B24 @ =gUnknown_08C87960
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8077788
	cmp r0, #0
	bne _08077B18
	adds r0, r4, #0
	bl sub_8077B28
_08077B18:
	adds r0, r4, #0
	bl sub_8077CA0
_08077B1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077B24: .4byte gUnknown_08C87960

	thumb_func_start sub_8077B28
sub_8077B28: @ 0x08077B28
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r2, _08077B80 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _08077B84 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r1, _08077B88 @ =gUnknown_080DFFF4
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x10]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r1, _08077B8C @ =gUnknown_080E0000
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, #0x24
	strb r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08077B90 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08077B94 @ =sub_8077C04
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077B80: .4byte gUnknown_030059E0
_08077B84: .4byte 0xFFBFFFFF
_08077B88: .4byte gUnknown_080DFFF4
_08077B8C: .4byte gUnknown_080E0000
_08077B90: .4byte gCurTask
_08077B94: .4byte sub_8077C04

	thumb_func_start sub_8077B98
sub_8077B98: @ 0x08077B98
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08077BF4 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077BF0
	ldr r3, [r2, #0x1c]
	ldr r0, _08077BF8 @ =gUnknown_03005960
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r2, #0x20]
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
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	ble _08077BFC
_08077BF0:
	movs r0, #0
	b _08077BFE
	.align 2, 0
_08077BF4: .4byte gUnknown_030059E0
_08077BF8: .4byte gUnknown_03005960
_08077BFC:
	movs r0, #1
_08077BFE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8077C04
sub_8077C04: @ 0x08077C04
	push {r4, lr}
	ldr r0, _08077C38 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8077B98
	cmp r0, #0
	beq _08077C22
	adds r0, r4, #0
	bl sub_8077C3C
_08077C22:
	adds r0, r4, #0
	bl sub_8077CB0
	cmp r0, #0
	beq _08077C32
	adds r0, r4, #0
	bl sub_8077CF8
_08077C32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077C38: .4byte gCurTask

	thumb_func_start sub_8077C3C
sub_8077C3C: @ 0x08077C3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _08077C90 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r6, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	ldr r1, [r5, #0x1c]
	lsls r1, r1, #8
	ldr r2, [r5, #0x20]
	lsls r2, r2, #8
	adds r0, r5, #0
	bl sub_8077774
	ldr r0, _08077C94 @ =0x0000013F
	bl m4aSongNumStart
	ldr r0, _08077C98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08077C9C @ =sub_8077ABC
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077C90: .4byte gUnknown_030059E0
_08077C94: .4byte 0x0000013F
_08077C98: .4byte gCurTask
_08077C9C: .4byte sub_8077ABC

	thumb_func_start sub_8077CA0
sub_8077CA0: @ 0x08077CA0
	ldr r2, _08077CAC @ =gUnknown_030059E0
	ldr r1, [r0, #0x10]
	str r1, [r2, #8]
	ldr r0, [r0, #0x14]
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
_08077CAC: .4byte gUnknown_030059E0

	thumb_func_start sub_8077CB0
sub_8077CB0: @ 0x08077CB0
	push {lr}
	ldr r1, [r0, #0x1c]
	ldr r3, _08077CEC @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x20]
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
	bhi _08077CE8
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08077CE8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08077CF0
_08077CE8:
	movs r0, #1
	b _08077CF2
	.align 2, 0
_08077CEC: .4byte gUnknown_03005960
_08077CF0:
	movs r0, #0
_08077CF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8077CF8
sub_8077CF8: @ 0x08077CF8
	push {lr}
	ldr r1, [r0, #0x28]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08077D10 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08077D10: .4byte gCurTask

	thumb_func_start sub_8077D14
sub_8077D14: @ 0x08077D14
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
	ldr r0, _08077D8C @ =sub_8077C04
	ldr r2, _08077D90 @ =0x00002010
	ldr r1, _08077D94 @ =sub_8077DA0
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r1, r3
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	strh r0, [r3, #0x24]
	str r2, [r3, #0x28]
	ldrb r2, [r2]
	ldr r7, _08077D98 @ =IWRAM_START + 0x2C
	adds r0, r1, r7
	strb r2, [r0]
	ldr r0, _08077D9C @ =IWRAM_START + 0x2D
	adds r1, r1, r0
	strb r6, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #0x20]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077D8C: .4byte sub_8077C04
_08077D90: .4byte 0x00002010
_08077D94: .4byte sub_8077DA0
_08077D98: .4byte IWRAM_START + 0x2C
_08077D9C: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_8077DA0
sub_8077DA0: @ 0x08077DA0
	bx lr
	.align 2, 0

	thumb_func_start sub_8077DA4
sub_8077DA4: @ 0x08077DA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08077E30 @ =sub_8077EC8
	ldr r2, _08077E34 @ =0x00002010
	ldr r1, _08077E38 @ =sub_8077F14
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
	movs r1, #3
	ldrsb r1, [r4, r1]
	lsls r1, r1, #3
	strh r1, [r3]
	movs r2, #4
	ldrsb r2, [r4, r2]
	lsls r2, r2, #3
	strh r2, [r3, #2]
	ldrb r0, [r4, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #4]
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #6]
	str r4, [r3, #0x10]
	ldrb r0, [r4]
	strb r0, [r3, #0x14]
	mov r1, r8
	strb r1, [r3, #0x15]
	ldrb r0, [r4]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #8]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r3, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077E30: .4byte sub_8077EC8
_08077E34: .4byte 0x00002010
_08077E38: .4byte sub_8077F14

	thumb_func_start sub_8077E3C
sub_8077E3C: @ 0x08077E3C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08077EB8 @ =gUnknown_030059E0
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077EC0
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08077EC0
	ldr r2, [r5, #8]
	ldr r1, _08077EBC @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #0xc]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	ldrsh r3, [r5, r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08077EC0
	movs r6, #4
	ldrsh r0, [r5, r6]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _08077EC0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r1, #2
	ldrsh r2, [r5, r1]
	adds r3, r0, r2
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r3, r1
	bgt _08077EC0
	movs r4, #6
	ldrsh r0, [r5, r4]
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _08077EC0
	movs r0, #1
	b _08077EC2
	.align 2, 0
_08077EB8: .4byte gUnknown_030059E0
_08077EBC: .4byte gUnknown_03005960
_08077EC0:
	movs r0, #0
_08077EC2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8077EC8
sub_8077EC8: @ 0x08077EC8
	push {r4, r5, lr}
	ldr r5, _08077F0C @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8077E3C
	cmp r0, #0
	beq _08077EEE
	ldr r2, _08077F10 @ =gUnknown_030059E0
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	movs r0, #0xf3
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x14]
_08077EEE:
	adds r0, r4, #0
	bl sub_8077F18
	cmp r0, #0
	beq _08077F04
	ldr r0, [r4, #0x10]
	ldrb r1, [r4, #0x14]
	strb r1, [r0]
	ldr r0, [r5]
	bl TaskDestroy
_08077F04:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077F0C: .4byte gCurTask
_08077F10: .4byte gUnknown_030059E0

	thumb_func_start sub_8077F14
sub_8077F14: @ 0x08077F14
	bx lr
	.align 2, 0

	thumb_func_start sub_8077F18
sub_8077F18: @ 0x08077F18
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #8]
	ldr r1, _08077F70 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0xc]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08077F6A
	movs r1, #0
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08077F6A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #6
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _08077F6A
	movs r2, #2
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _08077F74
_08077F6A:
	movs r0, #1
	b _08077F76
	.align 2, 0
_08077F70: .4byte gUnknown_03005960
_08077F74:
	movs r0, #0
_08077F76:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8077F7C
sub_8077F7C: @ 0x08077F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08077FA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _08077FAC @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08077FB0
	adds r0, r5, #0
	bl sub_80782FC
	b _08078160
	.align 2, 0
_08077FA8: .4byte gCurTask
_08077FAC: .4byte gUnknown_030059E0
_08077FB0:
	ldrh r0, [r5, #0x10]
	subs r0, #0x40
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x12
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r5, #0x18]
	cmp r0, #0
	bne _08077FD8
	cmp r6, #0x3f
	bhi _08077FD8
	ldr r1, _08078094 @ =gUnknown_03005960
	adds r1, #0x50
	ldrh r0, [r1]
	movs r2, #1
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	str r0, [r5, #0x18]
_08077FD8:
	ldrh r0, [r5, #0x1c]
	cmp r0, #1
	bne _0807809C
	ldr r2, [r5, #0xc]
	asrs r0, r2, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0x20
	subs r0, r0, r7
	lsls r4, r0, #6
	ldr r3, _08078098 @ =gSineTable
	lsls r1, r6, #2
	lsls r0, r6, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r4, r0, #8
	adds r2, r2, r4
	mov r0, r8
	str r2, [r0, #0xc]
	lsls r4, r7, #1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	movs r0, #0xff
	mov ip, r0
	ands r4, r0
	lsls r0, r4, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	muls r0, r1, r0
	asrs r4, r0, #8
	ldr r0, [r5, #8]
	adds r0, r0, r4
	mov r1, r8
	str r0, [r1, #8]
	adds r4, r6, #0
	cmp r4, #0x80
	ble _08078046
	adds r0, r2, #0
	subs r4, r0, r4
_08078046:
	movs r1, #0x40
	subs r1, r1, r4
	lsls r0, r7, #1
	mov r4, ip
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r0, #0x40
	mov r1, r8
	adds r1, #0x24
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r2, r8
	strh r0, [r2, #0x10]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r2, #0x12]
	ldr r0, [r5, #0xc]
	adds r0, #0x40
	b _08078154
	.align 2, 0
_08078094: .4byte gUnknown_03005960
_08078098: .4byte gSineTable
_0807809C:
	ldr r0, [r5, #4]
	ldr r2, [r5, #0xc]
	asrs r1, r2, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0x20
	subs r0, r0, r7
	lsls r4, r0, #6
	ldr r3, _0807816C @ =gSineTable
	mov ip, r3
	lsls r1, r6, #2
	lsls r0, r6, #3
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	rsbs r0, r0, #0
	asrs r4, r0, #8
	mov r3, r8
	adds r2, r2, r4
	str r2, [r3, #0xc]
	lsls r4, r7, #1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	add r1, ip
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	movs r0, #0xff
	mov sb, r0
	ands r4, r0
	lsls r0, r4, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	muls r0, r1, r0
	asrs r4, r0, #8
	ldr r0, [r5, #8]
	adds r0, r0, r4
	str r0, [r3, #8]
	adds r4, r6, #0
	cmp r4, #0x7f
	bgt _0807810A
	movs r0, #0x80
	subs r0, r0, r4
	lsls r0, r0, #1
	adds r4, r4, r0
_0807810A:
	movs r1, #0xc0
	subs r1, r1, r4
	lsls r0, r7, #1
	mov r3, sb
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r0, #0x40
	mov r1, r8
	adds r1, #0x24
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r4, r8
	strh r0, [r4, #0x10]
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r4, #0x12]
	ldr r0, [r5, #0xc]
	subs r0, #0x40
_08078154:
	str r0, [r5, #0xc]
	cmp r7, #0x1f
	bls _08078160
	adds r0, r5, #0
	bl sub_80784F4
_08078160:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807816C: .4byte gSineTable

	thumb_func_start sub_8078170
sub_8078170: @ 0x08078170
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _080781B0 @ =gUnknown_030059E0
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
_080781B0: .4byte gUnknown_030059E0
_080781B4: .4byte _080781B8
_080781B8: @ jump table
	.4byte _080781F2 @ case 0
	.4byte _080781CC @ case 1
	.4byte _080781CC @ case 2
	.4byte _080781F2 @ case 3
	.4byte _080781F2 @ case 4
_080781CC:
	ldr r3, _08078228 @ =gUnknown_030059E0
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
	ldr r3, _08078228 @ =gUnknown_030059E0
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
	ldr r0, _08078228 @ =gUnknown_030059E0
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	ldr r0, _08078230 @ =0x000008FF
	cmp r1, r0
	bgt _08078234
	movs r0, #1
	b _08078236
	.align 2, 0
_08078228: .4byte gUnknown_030059E0
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
	bl sub_802A004
	ldr r4, _08078288 @ =gUnknown_030059E0
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
_08078288: .4byte gUnknown_030059E0
_0807828C: .4byte 0xFFBFFFFF
_08078290: .4byte _08078294
_08078294: @ jump table
	.4byte _080782C4 @ case 0
	.4byte _080782A8 @ case 1
	.4byte _080782A8 @ case 2
	.4byte _080782C4 @ case 3
	.4byte _080782C4 @ case 4
_080782A8:
	ldr r4, _080782EC @ =gUnknown_030059E0
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
_080782EC: .4byte gUnknown_030059E0
_080782F0: .4byte 0xFFFFCFFF
_080782F4: .4byte gCurTask
_080782F8: .4byte sub_8078414

	thumb_func_start sub_80782FC
sub_80782FC: @ 0x080782FC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_802A004
	ldr r4, _08078320 @ =gUnknown_030059E0
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
_08078320: .4byte gUnknown_030059E0
_08078324: .4byte _08078328
_08078328: @ jump table
	.4byte _08078358 @ case 0
	.4byte _0807833C @ case 1
	.4byte _0807833C @ case 2
	.4byte _08078358 @ case 3
	.4byte _08078358 @ case 4
_0807833C:
	ldr r4, _0807838C @ =gUnknown_030059E0
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
	ldr r1, _08078394 @ =gUnknown_03005960
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
_0807838C: .4byte gUnknown_030059E0
_08078390: .4byte 0xFFFFCFFF
_08078394: .4byte gUnknown_03005960
_08078398: .4byte 0x0000FFFE
_0807839C: .4byte gCurTask
_080783A0: .4byte sub_8078414

	thumb_func_start sub_80783A4
sub_80783A4: @ 0x080783A4
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08078404 @ =gUnknown_030059E0
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
	ldr r0, _08078408 @ =gUnknown_03005960
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
_08078404: .4byte gUnknown_030059E0
_08078408: .4byte gUnknown_03005960
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
	ldr r2, _08078474 @ =gUnknown_030059E0
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
_08078474: .4byte gUnknown_030059E0
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
	ldr r3, _080784E4 @ =gUnknown_030059E0
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
_080784E4: .4byte gUnknown_030059E0
_080784E8: .4byte 0x00000125
_080784EC: .4byte gCurTask
_080784F0: .4byte sub_8077F7C

	thumb_func_start sub_80784F4
sub_80784F4: @ 0x080784F4
	push {lr}
	ldrh r0, [r0, #0x1c]
	cmp r0, #1
	bne _08078508
	ldr r1, _08078504 @ =gUnknown_030059E0
	movs r0, #0xc0
	lsls r0, r0, #3
	b _0807850E
	.align 2, 0
_08078504: .4byte gUnknown_030059E0
_08078508:
	ldr r1, _08078534 @ =gUnknown_030059E0
	movs r0, #0xf6
	lsls r0, r0, #8
_0807850E:
	strh r0, [r1, #0x12]
	movs r0, #0
	strh r0, [r1, #0x10]
	ldr r1, _08078538 @ =gUnknown_03005960
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
_08078534: .4byte gUnknown_030059E0
_08078538: .4byte gUnknown_03005960
_0807853C: .4byte 0x0000FFFE
_08078540: .4byte 0x00000125
_08078544: .4byte gCurTask
_08078548: .4byte sub_8078634

	thumb_func_start sub_807854C
sub_807854C: @ 0x0807854C
	push {lr}
	ldr r1, [r0]
	ldr r3, _08078588 @ =gUnknown_03005960
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
_08078588: .4byte gUnknown_03005960
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

	thumb_func_start sub_80785B0
sub_80785B0: @ 0x080785B0
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
	ldr r2, _0807865C @ =gUnknown_030059E0
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
_0807865C: .4byte gUnknown_030059E0
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

	thumb_func_start sub_807868C
sub_807868C: @ 0x0807868C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807871C @ =sub_8078940
	ldr r2, _08078720 @ =0x00002010
	ldr r1, _08078724 @ =sub_8078978
	str r1, [sp]
	movs r1, #0x20
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
	strh r7, [r3, #0x14]
	lsls r4, r4, #8
	ldrb r0, [r6]
	lsls r0, r0, #3
	adds r4, r4, r0
	str r4, [r3]
	lsls r5, r5, #8
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r5, r5, r0
	str r5, [r3, #4]
	movs r1, #3
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	strh r1, [r3, #0xc]
	movs r2, #4
	ldrsb r2, [r6, r2]
	lsls r2, r2, #3
	strh r2, [r3, #0xe]
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #0x10]
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #0x12]
	str r6, [r3, #0x18]
	ldrb r0, [r6]
	strb r0, [r3, #0x1c]
	mov r1, r8
	strb r1, [r3, #0x1d]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807871C: .4byte sub_8078940
_08078720: .4byte 0x00002010
_08078724: .4byte sub_8078978

	thumb_func_start sub_8078728
sub_8078728: @ 0x08078728
	push {r4, r5, lr}
	ldr r0, _0807874C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _08078750 @ =gUnknown_030059E0
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08078758
	ldr r0, _08078754 @ =0xFFFF7FFF
	ands r1, r0
	str r1, [r5, #0x20]
	b _0807877E
	.align 2, 0
_0807874C: .4byte gCurTask
_08078750: .4byte gUnknown_030059E0
_08078754: .4byte 0xFFFF7FFF
_08078758:
	adds r0, r4, #0
	bl sub_80789AC
	cmp r0, #0
	bne _0807878C
	ldr r0, [r5, #0x20]
	ldr r1, _08078788 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #0x3b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0807877E
	movs r0, #9
	strh r0, [r1]
_0807877E:
	adds r0, r4, #0
	bl sub_8078998
	b _080787BE
	.align 2, 0
_08078788: .4byte 0xFFFF7FFF
_0807878C:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _080787A8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r4]
	ldrh r2, [r4, #0xc]
	adds r1, r1, r2
	b _080787B2
_080787A8:
	ldr r0, [r4]
	ldrh r1, [r4, #0x10]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
_080787B2:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r4, #0
	bl sub_80787C4
_080787BE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80787C4
sub_80787C4: @ 0x080787C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #6
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _080787F4
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	cmp r0, r2
	ble _080787F0
	adds r1, r2, #0
_080787F0:
	adds r0, r1, #0
	b _080787F6
_080787F4:
	movs r0, #0
_080787F6:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r2, _08078894 @ =0x000003FF
	adds r0, r2, #0
	ands r4, r0
	ldr r6, _08078898 @ =gUnknown_030059E0
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bge _08078812
	rsbs r0, r0, #0
_08078812:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08078826
	adds r2, r1, #0
_08078826:
	lsls r0, r2, #0x10
	asrs r0, r0, #8
	bl __divsi3
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	subs r1, #0x10
	asrs r3, r1, #1
	ldr r2, _0807889C @ =gSineTable
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r2, r3, #0
	muls r2, r1, r2
	lsls r1, r3, #8
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r2, r0, #8
	ldr r0, [r5, #8]
	subs r0, r0, r2
	str r0, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r0, [r6, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080788C0
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0x1f
	bgt _080788A0
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	b _080788BE
	.align 2, 0
_08078894: .4byte 0x000003FF
_08078898: .4byte gUnknown_030059E0
_0807889C: .4byte gSineTable
_080788A0:
	cmp r3, #0x5f
	bgt _080788AC
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x3b
	b _080788BE
_080788AC:
	cmp r3, #0x9f
	bgt _080788B8
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x3c
	b _080788BE
_080788B8:
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x3d
_080788BE:
	strh r0, [r1]
_080788C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80788C8
sub_80788C8: @ 0x080788C8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _08078930 @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08078934 @ =gUnknown_030059E0
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xc
	ldrsh r3, [r5, r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08078938
	movs r7, #0x10
	ldrsh r0, [r5, r7]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _08078938
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	adds r3, r0, r2
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r3, r1
	bgt _08078938
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _08078938
	movs r0, #1
	b _0807893A
	.align 2, 0
_08078930: .4byte gUnknown_03005960
_08078934: .4byte gUnknown_030059E0
_08078938:
	movs r0, #0
_0807893A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078940
sub_8078940: @ 0x08078940
	push {r4, lr}
	ldr r0, _08078974 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8078A60
	cmp r0, #0
	beq _0807895E
	adds r0, r4, #0
	bl sub_807897C
_0807895E:
	adds r0, r4, #0
	bl sub_80789FC
	cmp r0, #0
	beq _0807896E
	adds r0, r4, #0
	bl sub_8078AC4
_0807896E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078974: .4byte gCurTask

	thumb_func_start sub_8078978
sub_8078978: @ 0x08078978
	bx lr
	.align 2, 0

	thumb_func_start sub_807897C
sub_807897C: @ 0x0807897C
	ldr r1, _0807898C @ =gUnknown_030059E0
	ldr r1, [r1, #0xc]
	str r1, [r0, #8]
	ldr r0, _08078990 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08078994 @ =sub_8078728
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807898C: .4byte gUnknown_030059E0
_08078990: .4byte gCurTask
_08078994: .4byte sub_8078728

	thumb_func_start sub_8078998
sub_8078998: @ 0x08078998
	ldr r0, _080789A4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080789A8 @ =sub_8078940
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080789A4: .4byte gCurTask
_080789A8: .4byte sub_8078940

	thumb_func_start sub_80789AC
sub_80789AC: @ 0x080789AC
	push {lr}
	adds r3, r0, #0
	ldr r2, _080789DC @ =gUnknown_030059E0
	ldr r1, _080789E0 @ =0x000001FF
	adds r0, r1, #0
	ldrh r1, [r2, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _080789E4 @ =0x043E0000
	cmp r0, r1
	bls _080789F4
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _080789E8 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _080789EC
	adds r0, r3, #0
	bl sub_80788C8
	b _080789F6
	.align 2, 0
_080789DC: .4byte gUnknown_030059E0
_080789E0: .4byte 0x000001FF
_080789E4: .4byte 0x043E0000
_080789E8: .4byte gUnknown_03005B38
_080789EC:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
_080789F4:
	movs r0, #0
_080789F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80789FC
sub_80789FC: @ 0x080789FC
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _08078A54 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x10
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08078A4E
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08078A4E
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x12
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _08078A4E
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _08078A58
_08078A4E:
	movs r0, #1
	b _08078A5A
	.align 2, 0
_08078A54: .4byte gUnknown_03005960
_08078A58:
	movs r0, #0
_08078A5A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078A60
sub_8078A60: @ 0x08078A60
	push {lr}
	adds r3, r0, #0
	ldr r1, _08078A94 @ =gUnknown_030059E0
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08078AA2
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _08078AA2
	adds r0, r1, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	beq _08078A88
	cmp r0, #9
	bne _08078AA2
_08078A88:
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _08078A98
	cmp r0, #1
	beq _08078AAC
	b _08078AB6
	.align 2, 0
_08078A94: .4byte gUnknown_030059E0
_08078A98:
	movs r0, #0x10
	ldrsh r1, [r1, r0]
	ldr r0, _08078AA8 @ =0x0000023F
	cmp r1, r0
	bgt _08078AB6
_08078AA2:
	movs r0, #0
	b _08078ABC
	.align 2, 0
_08078AA8: .4byte 0x0000023F
_08078AAC:
	movs r2, #0x10
	ldrsh r1, [r1, r2]
	ldr r0, _08078AC0 @ =0xFFFFFDC0
	cmp r1, r0
	bgt _08078AA2
_08078AB6:
	adds r0, r3, #0
	bl sub_80788C8
_08078ABC:
	pop {r1}
	bx r1
	.align 2, 0
_08078AC0: .4byte 0xFFFFFDC0

	thumb_func_start sub_8078AC4
sub_8078AC4: @ 0x08078AC4
	push {lr}
	ldr r1, [r0, #0x18]
	ldrb r0, [r0, #0x1c]
	strb r0, [r1]
	ldr r0, _08078AD8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08078AD8: .4byte gCurTask

	thumb_func_start sub_8078ADC
sub_8078ADC: @ 0x08078ADC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807868C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8078AFC
sub_8078AFC: @ 0x08078AFC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807868C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8078B1C
sub_8078B1C: @ 0x08078B1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _08078DB4 @ =sub_807974C
	movs r1, #0xe0
	lsls r1, r1, #1
	ldr r2, _08078DB8 @ =0x00002010
	ldr r3, _08078DBC @ =sub_8079794
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	mov r3, sl
	movs r0, #3
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	ldr r7, _08078DC0 @ =IWRAM_START + 0x1AC
	adds r1, r4, r7
	movs r5, #0
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r7, #2
	adds r3, r4, r7
	strh r0, [r3]
	mov r7, sl
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r7, _08078DC4 @ =IWRAM_START + 0x1B0
	adds r1, r4, r7
	strh r0, [r1]
	mov r1, sl
	ldrb r0, [r1, #6]
	lsls r0, r0, #3
	ldrh r7, [r3]
	adds r0, r0, r7
	ldr r1, _08078DC8 @ =IWRAM_START + 0x1B2
	adds r1, r1, r4
	mov ip, r1
	strh r0, [r1]
	ldr r7, _08078DCC @ =IWRAM_START + 0x1B8
	adds r0, r4, r7
	mov r1, sl
	str r1, [r0]
	ldrb r1, [r1]
	adds r7, #4
	adds r0, r4, r7
	strb r1, [r0]
	ldr r1, _08078DD0 @ =IWRAM_START + 0x1BD
	adds r0, r4, r1
	mov r7, sb
	strb r7, [r0]
	ldr r0, _08078DD4 @ =IWRAM_START + 0x158
	adds r1, r4, r0
	mov r7, sl
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, _08078DD8 @ =IWRAM_START + 0x15C
	adds r1, r4, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r6, r8
	lsls r6, r6, #8
	mov r8, r6
	add r0, r8
	str r0, [r1]
	mov r7, ip
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r6, #0
	ldrsh r1, [r3, r6]
	subs r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xc0
	lsls r1, r1, #3
	str r2, [sp, #4]
	bl __udivsi3
	adds r0, #0x78
	ldr r7, _08078DDC @ =IWRAM_START + 0x160
	adds r1, r4, r7
	strh r0, [r1]
	ldr r1, _08078DE0 @ =IWRAM_START + 0x164
	adds r0, r4, r1
	str r5, [r0]
	ldr r3, _08078DE4 @ =IWRAM_START + 0x168
	adds r0, r4, r3
	str r5, [r0]
	ldr r6, _08078DE8 @ =IWRAM_START + 0x16C
	adds r0, r4, r6
	movs r7, #1
	rsbs r7, r7, #0
	str r7, [r0]
	adds r1, #0xc
	adds r0, r4, r1
	strh r5, [r0]
	movs r0, #0x1f
	bl VramMalloc
	adds r7, r0, #0
	ldr r3, _08078DEC @ =IWRAM_START + 0x1B4
	adds r0, r4, r3
	str r7, [r0]
	ldr r2, [sp, #4]
	movs r6, #0x90
	lsls r6, r6, #3
	strh r6, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078DF0 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08078DF4 @ =IWRAM_START + 0x22
	adds r0, r4, r1
	movs r3, #0x10
	mov sb, r3
	mov r6, sb
	strb r6, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	mov r8, r0
	str r0, [r2, #0x10]
	str r7, [r2, #4]
	ldr r6, _08078DF8 @ =0x00000246
	strh r6, [r2, #0xa]
	subs r1, #5
	adds r0, r4, r1
	strb r3, [r0]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0x80
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078DFC @ =IWRAM_START + 0x30
	adds r2, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E00 @ =IWRAM_START + 0x51
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E04 @ =IWRAM_START + 0x52
	adds r0, r4, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08078E08 @ =IWRAM_START + 0x55
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E0C @ =IWRAM_START + 0x50
	adds r1, r4, r3
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078E10 @ =IWRAM_START + 0x60
	adds r2, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E14 @ =IWRAM_START + 0x81
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E18 @ =IWRAM_START + 0x82
	adds r0, r4, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08078E1C @ =IWRAM_START + 0x85
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E20 @ =IWRAM_START + 0x80
	adds r1, r4, r3
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xe8
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078E24 @ =IWRAM_START + 0x90
	adds r2, r4, r1
	adds r0, #0xe0
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E28 @ =IWRAM_START + 0xB1
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E2C @ =IWRAM_START + 0xB2
	adds r0, r4, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08078E30 @ =IWRAM_START + 0xB5
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E34 @ =IWRAM_START + 0xB0
	adds r1, r4, r3
	movs r0, #3
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078E38 @ =IWRAM_START + 0xC0
	adds r2, r4, r1
	movs r7, #0x90
	lsls r7, r7, #3
	strh r7, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E3C @ =IWRAM_START + 0xE1
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E40 @ =IWRAM_START + 0xE2
	adds r0, r4, r1
	mov r7, sb
	strb r7, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r7, #0
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E44 @ =IWRAM_START + 0xE0
	adds r4, r4, r3
	movs r0, #4
	strb r0, [r4]
	adds r0, r2, #0
	bl sub_8004558
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	mov r7, sl
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078DB4: .4byte sub_807974C
_08078DB8: .4byte 0x00002010
_08078DBC: .4byte sub_8079794
_08078DC0: .4byte IWRAM_START + 0x1AC
_08078DC4: .4byte IWRAM_START + 0x1B0
_08078DC8: .4byte IWRAM_START + 0x1B2
_08078DCC: .4byte IWRAM_START + 0x1B8
_08078DD0: .4byte IWRAM_START + 0x1BD
_08078DD4: .4byte IWRAM_START + 0x158
_08078DD8: .4byte IWRAM_START + 0x15C
_08078DDC: .4byte IWRAM_START + 0x160
_08078DE0: .4byte IWRAM_START + 0x164
_08078DE4: .4byte IWRAM_START + 0x168
_08078DE8: .4byte IWRAM_START + 0x16C
_08078DEC: .4byte IWRAM_START + 0x1B4
_08078DF0: .4byte IWRAM_START + 0x21
_08078DF4: .4byte IWRAM_START + 0x22
_08078DF8: .4byte 0x00000246
_08078DFC: .4byte IWRAM_START + 0x30
_08078E00: .4byte IWRAM_START + 0x51
_08078E04: .4byte IWRAM_START + 0x52
_08078E08: .4byte IWRAM_START + 0x55
_08078E0C: .4byte IWRAM_START + 0x50
_08078E10: .4byte IWRAM_START + 0x60
_08078E14: .4byte IWRAM_START + 0x81
_08078E18: .4byte IWRAM_START + 0x82
_08078E1C: .4byte IWRAM_START + 0x85
_08078E20: .4byte IWRAM_START + 0x80
_08078E24: .4byte IWRAM_START + 0x90
_08078E28: .4byte IWRAM_START + 0xB1
_08078E2C: .4byte IWRAM_START + 0xB2
_08078E30: .4byte IWRAM_START + 0xB5
_08078E34: .4byte IWRAM_START + 0xB0
_08078E38: .4byte IWRAM_START + 0xC0
_08078E3C: .4byte IWRAM_START + 0xE1
_08078E40: .4byte IWRAM_START + 0xE2
_08078E44: .4byte IWRAM_START + 0xE0

	thumb_func_start sub_8078E48
sub_8078E48: @ 0x08078E48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r3, r2, r0
	movs r5, #0
	movs r1, #0
_08078E5E:
	strh r1, [r3]
	strh r1, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #0
	beq _08078E5E
	movs r5, #0
	adds r2, #0xf0
	mov r8, r2
	ldr r7, _08078E9C @ =gUnknown_030053B8
	ldr r6, _08078EA0 @ =0x00196225
	ldr r4, _08078EA4 @ =0x3C6EF35F
_08078E7A:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08078EA8
	ldr r0, [r7]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r4
	lsrs r0, r2, #0x14
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r2, #0
	muls r0, r6, r0
	b _08078EBC
	.align 2, 0
_08078E9C: .4byte gUnknown_030053B8
_08078EA0: .4byte 0x00196225
_08078EA4: .4byte 0x3C6EF35F
_08078EA8:
	ldr r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsrs r2, r1, #0x14
	ldr r0, _08078F08 @ =0xFFFFF000
	subs r0, r0, r2
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r6, r0
_08078EBC:
	adds r0, r0, r4
	str r0, [r7]
	lsrs r0, r0, #0x14
	rsbs r0, r0, #0
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #1
	bls _08078E7A
	movs r5, #0
	ldr r7, _08078F0C @ =gUnknown_030053B8
	ldr r6, _08078F10 @ =0x00196225
	ldr r4, _08078F14 @ =0x3C6EF35F
	ldr r1, _08078F08 @ =0xFFFFF000
	mov ip, r1
_08078EDE:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08078F18
	ldr r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsrs r0, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r0, r4
	str r0, [r7]
	lsrs r0, r0, #0x13
	mov r1, ip
	subs r0, r1, r0
	b _08078F36
	.align 2, 0
_08078F08: .4byte 0xFFFFF000
_08078F0C: .4byte gUnknown_030053B8
_08078F10: .4byte 0x00196225
_08078F14: .4byte 0x3C6EF35F
_08078F18:
	ldr r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsrs r2, r1, #0x14
	ldr r0, _08079010 @ =0xFFFFF800
	subs r0, r0, r2
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r0, r4
	str r0, [r7]
	lsrs r0, r0, #0x13
	mov r2, ip
	subs r0, r2, r0
_08078F36:
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #1
	bls _08078EDE
	movs r5, #0
	ldr r6, _08079014 @ =gUnknown_030053B8
	ldr r4, _08079018 @ =0x00196225
	ldr r2, _0807901C @ =0x3C6EF35F
	ldr r7, _08079020 @ =0xFFFFE000
_08078F4E:
	ldr r0, [r6]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r1, r1, r2
	lsrs r0, r1, #0x12
	adds r0, r0, r7
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r6]
	lsrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #3
	bls _08078F4E
	movs r5, #0
	ldr r6, _08079014 @ =gUnknown_030053B8
	ldr r4, _08079018 @ =0x00196225
	ldr r2, _0807901C @ =0x3C6EF35F
	ldr r7, _08079020 @ =0xFFFFE000
_08078F80:
	ldr r0, [r6]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r1, r1, r2
	lsrs r0, r1, #0x12
	adds r0, r0, r7
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r6]
	lsrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #3
	bls _08078F80
	mov r3, r8
	movs r5, #0
	movs r1, #0
	movs r2, #0xfd
	lsls r2, r2, #8
_08078FB2:
	strh r1, [r3]
	strh r1, [r3, #2]
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #0
	beq _08078FB2
	movs r5, #0
	ldr r7, _08079014 @ =gUnknown_030053B8
	mov ip, r7
	ldr r7, _08079018 @ =0x00196225
	ldr r6, _0807901C @ =0x3C6EF35F
	ldr r0, _08079024 @ =0x000007FF
	mov sl, r0
	ldr r1, _08079028 @ =0x0000FD40
	mov sb, r1
	movs r2, #0x1f
	mov r8, r2
_08078FDC:
	movs r4, #1
	ands r4, r5
	cmp r4, #0
	beq _08079030
	mov r1, ip
	ldr r0, [r1]
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r1, r6
	adds r0, r1, #0
	mov r2, sl
	ands r0, r2
	ldr r2, _0807902C @ =0xFFFFFC00
	adds r0, r0, r2
	strh r0, [r3]
	movs r0, #0
	strh r0, [r3, #2]
	adds r0, r1, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x20
	b _0807905C
	.align 2, 0
_08079010: .4byte 0xFFFFF800
_08079014: .4byte gUnknown_030053B8
_08079018: .4byte 0x00196225
_0807901C: .4byte 0x3C6EF35F
_08079020: .4byte 0xFFFFE000
_08079024: .4byte 0x000007FF
_08079028: .4byte 0x0000FD40
_0807902C: .4byte 0xFFFFFC00
_08079030:
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, sl
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3]
	strh r4, [r3, #2]
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x20
	rsbs r0, r0, #0
_0807905C:
	strh r0, [r3, #4]
	mov r0, sb
	strh r0, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #1
	bls _08078FDC
	movs r5, #0
	ldr r1, _080790B8 @ =gUnknown_030053B8
	mov ip, r1
	ldr r7, _080790BC @ =0x00196225
	ldr r6, _080790C0 @ =0x3C6EF35F
	ldr r2, _080790C4 @ =0x00001FFF
	mov sl, r2
	ldr r0, _080790C8 @ =0x0000FD80
	mov sb, r0
	movs r1, #0x3f
	mov r8, r1
_08079084:
	movs r4, #1
	ands r4, r5
	cmp r4, #0
	beq _080790D0
	mov r2, ip
	ldr r0, [r2]
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r1, r6
	adds r0, r1, #0
	mov r2, sl
	ands r0, r2
	ldr r2, _080790CC @ =0xFFFFF000
	adds r0, r0, r2
	strh r0, [r3]
	movs r0, #0
	strh r0, [r3, #2]
	adds r0, r1, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x30
	b _080790FC
	.align 2, 0
_080790B8: .4byte gUnknown_030053B8
_080790BC: .4byte 0x00196225
_080790C0: .4byte 0x3C6EF35F
_080790C4: .4byte 0x00001FFF
_080790C8: .4byte 0x0000FD80
_080790CC: .4byte 0xFFFFF000
_080790D0:
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, sl
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r0, r0, r1
	strh r0, [r3]
	strh r4, [r3, #2]
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x30
	rsbs r0, r0, #0
_080790FC:
	strh r0, [r3, #4]
	mov r0, sb
	strh r0, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #1
	bls _08079084
	movs r5, #0
	ldr r1, _0807915C @ =gUnknown_030053B8
	mov r8, r1
	ldr r4, _08079160 @ =0x00196225
	ldr r2, _08079164 @ =0x3C6EF35F
	mov ip, r2
	movs r7, #0x3f
	mov sb, r7
	ldr r6, _08079168 @ =0x0000FDC0
_08079120:
	mov r1, r8
	ldr r0, [r1]
	muls r0, r4, r0
	add r0, ip
	ldr r1, _0807916C @ =0x00003FFF
	ands r1, r0
	ldr r2, _08079170 @ =0xFFFFE000
	adds r1, r1, r2
	strh r1, [r3]
	muls r0, r4, r0
	mov r7, ip
	adds r2, r0, r7
	mov r0, r8
	str r2, [r0]
	ldr r0, _08079174 @ =0x00000FFF
	ands r0, r2
	strh r0, [r3, #2]
	lsls r1, r1, #0x10
	cmp r1, #0
	ble _08079178
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r1, _08079164 @ =0x3C6EF35F
	adds r0, r0, r1
	ldr r2, _0807915C @ =gUnknown_030053B8
	str r0, [r2]
	mov r7, sb
	ands r0, r7
	adds r0, #0x40
	b _0807918C
	.align 2, 0
_0807915C: .4byte gUnknown_030053B8
_08079160: .4byte 0x00196225
_08079164: .4byte 0x3C6EF35F
_08079168: .4byte 0x0000FDC0
_0807916C: .4byte 0x00003FFF
_08079170: .4byte 0xFFFFE000
_08079174: .4byte 0x00000FFF
_08079178:
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r1, _080791AC @ =0x3C6EF35F
	adds r0, r0, r1
	ldr r2, _080791B0 @ =gUnknown_030053B8
	str r0, [r2]
	mov r7, sb
	ands r0, r7
	adds r0, #0x40
	rsbs r0, r0, #0
_0807918C:
	strh r0, [r3, #4]
	strh r6, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #7
	bls _08079120
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080791AC: .4byte 0x3C6EF35F
_080791B0: .4byte gUnknown_030053B8

	thumb_func_start sub_80791B4
sub_80791B4: @ 0x080791B4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r1, _08079230 @ =gUnknown_03005590
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r6, r2
	ldrh r5, [r0]
	ldr r4, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl __umodsi3
	adds r5, r0, #0
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, r7
	beq _080791EC
	adds r0, r6, #0
	bl sub_8078E48
	str r7, [r4]
_080791EC:
	movs r1, #0xb4
	lsls r1, r1, #1
	adds r3, r6, r1
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #9
	str r1, [r3]
	movs r4, #0xd9
	lsls r4, r4, #1
	adds r2, r6, r4
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r0, r0, #8
	cmp r1, r0
	ble _08079234
	movs r0, #0xba
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #1
	str r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #8
	ldr r1, [r3]
	subs r1, r1, r0
	movs r0, #0xf0
	lsls r0, r0, #6
	cmp r1, r0
	ble _0807928C
	adds r0, r6, #0
	bl sub_8079510
	b _0807928C
	.align 2, 0
_08079230: .4byte gUnknown_03005590
_08079234:
	movs r2, #0xba
	lsls r2, r2, #1
	adds r1, r6, r2
	movs r0, #0
	str r0, [r1]
	movs r4, #0xc6
	lsls r4, r4, #1
	adds r2, r6, r4
	movs r3, #0
	ldr r7, _08079294 @ =0xFFFFA000
	mov ip, r7
	ldr r6, _08079298 @ =gUnknown_030053B8
	ldr r5, _0807929C @ =0x00196225
	ldr r4, _080792A0 @ =0x3C6EF35F
_08079250:
	ldr r1, _080792A4 @ =0xFFFFFE00
	adds r0, r1, #0
	ldrh r7, [r2, #2]
	adds r0, r0, r7
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bge _08079280
	ldr r0, [r6]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r1, r1, r4
	lsrs r0, r1, #0x12
	ldr r7, _080792A8 @ =0xFFFFE000
	adds r0, r0, r7
	strh r0, [r2]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r4
	str r0, [r6]
	lsrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r2, #2]
_08079280:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
	cmp r3, #7
	bls _08079250
_0807928C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079294: .4byte 0xFFFFA000
_08079298: .4byte gUnknown_030053B8
_0807929C: .4byte 0x00196225
_080792A0: .4byte 0x3C6EF35F
_080792A4: .4byte 0xFFFFFE00
_080792A8: .4byte 0xFFFFE000

	thumb_func_start sub_80792AC
sub_80792AC: @ 0x080792AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r0, #0xb4
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r3, #0xd9
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r0, r0, #8
	ldr r1, [r1]
	subs r1, r1, r0
	movs r0, #0xf0
	lsls r0, r0, #6
	cmp r1, r0
	ble _080792D8
	b _080794FC
_080792D8:
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r5, r4, r0
	subs r3, #4
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	movs r6, #0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov sb, r7
	mov r8, r0
	ldr r0, _080794F8 @ =gUnknown_03005960
	mov sl, r0
_080792F6:
	movs r1, #0xb4
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	cmp r3, sb
	bge _08079342
	movs r7, #0xac
	lsls r7, r7, #1
	adds r0, r4, r7
	ldr r1, [r0]
	mov r2, sl
	ldr r0, [r2]
	subs r1, r1, r0
	adds r7, #0xc
	adds r0, r4, r7
	movs r7, #0
	ldrsh r2, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r0, [r0]
	mov r2, sl
	ldr r1, [r2, #4]
	subs r0, r0, r1
	adds r0, r0, r3
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
_08079342:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #0
	beq _080792F6
	movs r6, #0
	ldr r3, _080794F8 @ =gUnknown_03005960
	mov sb, r3
_08079354:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _080793AC
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x46
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_080793AC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #1
	bls _08079354
	movs r6, #0
	ldr r3, _080794F8 @ =gUnknown_03005960
	mov sb, r3
_080793BE:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _08079416
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x76
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0x78
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_08079416:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #1
	bls _080793BE
	movs r6, #0
	ldr r3, _080794F8 @ =gUnknown_03005960
	mov sb, r3
_08079428:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _08079480
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0xa6
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0xa8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_08079480:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #3
	bls _08079428
	movs r6, #0
	ldr r3, _080794F8 @ =gUnknown_03005960
	mov sb, r3
_08079492:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _080794EA
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0xd6
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0xd8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_080794EA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #3
	bls _08079492
	b _08079502
	.align 2, 0
_080794F8: .4byte gUnknown_03005960
_080794FC:
	adds r0, r4, #0
	bl sub_8079560
_08079502:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8079510
sub_8079510: @ 0x08079510
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r1, #0xf0
	movs r4, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
_0807951C:
	ldrh r3, [r1, #6]
	movs r2, #6
	ldrsh r0, [r1, r2]
	ldrh r2, [r1, #2]
	cmp r0, #0
	ble _0807952E
	lsls r0, r2, #0x10
	cmp r0, #0
	bgt _0807954C
_0807952E:
	ldrh r0, [r1, #4]
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	adds r0, r2, r3
	strh r0, [r1, #2]
	adds r0, r3, #0
	adds r0, #0x2a
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	asrs r2, r5, #0x10
	cmp r0, r2
	ble _0807954C
	strh r2, [r1, #6]
_0807954C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r1, #8
	cmp r4, #0xc
	bls _0807951C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079560
sub_8079560: @ 0x08079560
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r5, r1
	ldr r0, [r0]
	mov sb, r0
	movs r2, #0xae
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r2, #0x56
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0xf0
	movs r6, #0
	ldr r7, _080795D8 @ =gUnknown_03005960
_08079590:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080795A0
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _0807960A
_080795A0:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080795DC
	ldr r1, [r7]
	mov r0, sb
	subs r1, r0, r1
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xa6
	strh r1, [r0]
	ldr r1, [r7, #4]
	mov r2, r8
	subs r1, r2, r1
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xa8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
	b _0807960A
	.align 2, 0
_080795D8: .4byte gUnknown_03005960
_080795DC:
	ldr r1, [r7]
	mov r0, sb
	subs r1, r0, r1
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xd6
	strh r1, [r0]
	ldr r1, [r7, #4]
	mov r2, r8
	subs r1, r2, r1
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xd8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_0807960A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, #8
	cmp r6, #0xc
	bls _08079590
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079624
sub_8079624: @ 0x08079624
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r2, [r0]
	ldr r1, _0807969C @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xd8
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08079698
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08079698
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xd9
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	cmp r0, r5
	blt _08079698
	subs r2, #4
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _080796A0
_08079698:
	movs r0, #1
	b _080796A2
	.align 2, 0
_0807969C: .4byte gUnknown_03005960
_080796A0:
	movs r0, #0
_080796A2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80796A8
sub_80796A8: @ 0x080796A8
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, _0807973C @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08079744
	movs r1, #0xd9
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r1, r3, r7
	ldr r1, [r1]
	asrs r5, r1, #8
	subs r0, r0, r5
	cmp r0, #0x3f
	ble _08079744
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r2, [r0]
	movs r7, #0xb2
	lsls r7, r7, #1
	adds r0, r3, r7
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r1, _08079740 @ =gUnknown_03005960
	ldr r4, [r1]
	subs r2, r2, r4
	subs r7, #8
	adds r0, r3, r7
	ldr r0, [r0]
	adds r0, r0, r5
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x20
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _08079744
	adds r0, #0x40
	cmp r0, r1
	blt _08079744
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	subs r1, #0x20
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08079744
	cmp r2, r0
	blt _08079744
	movs r0, #1
	b _08079746
	.align 2, 0
_0807973C: .4byte gUnknown_030059E0
_08079740: .4byte gUnknown_03005960
_08079744:
	movs r0, #0
_08079746:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807974C
sub_807974C: @ 0x0807974C
	push {r4, lr}
	ldr r0, _08079784 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80791B4
	adds r0, r4, #0
	bl sub_80796A8
	cmp r0, #0
	beq _08079770
	adds r0, r4, #0
	bl sub_80797AC
_08079770:
	adds r0, r4, #0
	bl sub_8079624
	cmp r0, #0
	beq _08079788
	adds r0, r4, #0
	bl sub_80797E8
	b _0807978E
	.align 2, 0
_08079784: .4byte gCurTask
_08079788:
	adds r0, r4, #0
	bl sub_80792AC
_0807978E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8079794
sub_8079794: @ 0x08079794
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _080797A8 @ =IWRAM_START + 0x1B4
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_080797A8: .4byte IWRAM_START + 0x1B4

	thumb_func_start sub_80797AC
sub_80797AC: @ 0x080797AC
	push {lr}
	bl sub_8029FF0
	ldr r2, _080797DC @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r3, r2, #0
	adds r3, #0x64
	movs r1, #0
	movs r0, #0x14
	strh r0, [r3]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	strh r1, [r2, #0x14]
	ldr r0, _080797E0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080797E4 @ =sub_8079810
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080797DC: .4byte gUnknown_030059E0
_080797E0: .4byte gCurTask
_080797E4: .4byte sub_8079810

	thumb_func_start sub_80797E8
sub_80797E8: @ 0x080797E8
	push {lr}
	adds r2, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r0]
	movs r3, #0xde
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807980C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807980C: .4byte gCurTask

	thumb_func_start sub_8079810
sub_8079810: @ 0x08079810
	push {r4, r5, r6, lr}
	ldr r6, _0807983C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80791B4
	ldr r2, _08079840 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08079848
	bl sub_802A004
	ldr r1, [r6]
	ldr r0, _08079844 @ =sub_807974C
	str r0, [r1, #8]
	b _0807986E
	.align 2, 0
_0807983C: .4byte gCurTask
_08079840: .4byte gUnknown_030059E0
_08079844: .4byte sub_807974C
_08079848:
	ldr r1, _0807987C @ =IWRAM_START + 0x15C
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r3, _08079880 @ =IWRAM_START + 0x168
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _08079884 @ =0xFFFFF000
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r3, #0xc
	adds r0, r4, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0807986E
	adds r0, r5, #0
	bl sub_8079888
_0807986E:
	adds r0, r5, #0
	bl sub_80792AC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807987C: .4byte IWRAM_START + 0x15C
_08079880: .4byte IWRAM_START + 0x168
_08079884: .4byte 0xFFFFF000

	thumb_func_start sub_8079888
sub_8079888: @ 0x08079888
	push {lr}
	bl sub_802A004
	ldr r1, _080798B4 @ =gUnknown_030059E0
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080798A6
	ldr r0, _080798B8 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r1, #0x20]
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
_080798A6:
	ldr r0, _080798BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080798C0 @ =sub_807974C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080798B4: .4byte gUnknown_030059E0
_080798B8: .4byte 0xFFBFFFFF
_080798BC: .4byte gCurTask
_080798C0: .4byte sub_807974C

	thumb_func_start sub_80798C4
sub_80798C4: @ 0x080798C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080799D0 @ =sub_8079C80
	ldr r2, _080799D4 @ =0x00002010
	ldr r1, _080799D8 @ =sub_8079CC8
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r5, r3
	ldr r1, _080799DC @ =IWRAM_START + 0xC
	adds r0, r5, r1
	movs r2, #0
	str r2, [r3, #0x44]
	str r2, [r3, #0x48]
	mov r7, sl
	ldrb r1, [r7, #3]
	ldr r7, _080799E0 @ =IWRAM_START + 0x4C
	adds r7, r7, r5
	mov sb, r7
	strb r1, [r7]
	movs r1, #0
	mov ip, r1
	strh r6, [r3, #4]
	mov r7, r8
	strh r7, [r3, #6]
	mov r1, sl
	str r1, [r3]
	ldrb r1, [r1]
	strb r1, [r3, #8]
	strb r4, [r3, #9]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	ldr r7, _080799E4 @ =IWRAM_START + 0x2D
	adds r2, r5, r7
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _080799E8 @ =IWRAM_START + 0x2E
	adds r2, r5, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _080799EC @ =IWRAM_START + 0x31
	adds r1, r5, r2
	mov r7, ip
	strb r7, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r4, _080799F0 @ =gUnknown_080E0008
	mov r1, sb
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r2, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _080799F4 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #4]
	mov r7, sb
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r4, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	ldr r2, _080799F8 @ =IWRAM_START + 0x2C
	adds r5, r5, r2
	strb r1, [r5]
	mov r7, sl
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r6, r6, #8
	adds r1, r1, r6
	str r1, [r3, #0x3c]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r1, r8
	str r1, [r3, #0x40]
	movs r7, #2
	rsbs r7, r7, #0
	adds r1, r7, #0
	mov r2, sl
	strb r1, [r2]
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080799D0: .4byte sub_8079C80
_080799D4: .4byte 0x00002010
_080799D8: .4byte sub_8079CC8
_080799DC: .4byte IWRAM_START + 0xC
_080799E0: .4byte IWRAM_START + 0x4C
_080799E4: .4byte IWRAM_START + 0x2D
_080799E8: .4byte IWRAM_START + 0x2E
_080799EC: .4byte IWRAM_START + 0x31
_080799F0: .4byte gUnknown_080E0008
_080799F4: .4byte 0x06010000
_080799F8: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_80799FC
sub_80799FC: @ 0x080799FC
	push {r4, lr}
	ldr r0, _08079A28 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x4e
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _08079A68
	cmp r0, #4
	bgt _08079A2C
	cmp r0, #0
	beq _08079A32
	b _08079AB2
	.align 2, 0
_08079A28: .4byte gCurTask
_08079A2C:
	cmp r0, #6
	beq _08079AA4
	b _08079AB2
_08079A32:
	ldr r2, _08079A60 @ =gSineTable
	ldr r0, _08079A64 @ =IWRAM_START + 0x4D
	adds r1, r3, r0
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r4, #0x44]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r4, #0x48]
	b _08079AB2
	.align 2, 0
_08079A60: .4byte gSineTable
_08079A64: .4byte IWRAM_START + 0x4D
_08079A68:
	ldr r2, _08079A9C @ =gSineTable
	ldr r0, _08079AA0 @ =IWRAM_START + 0x4D
	adds r1, r3, r0
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x44]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x48]
	b _08079AB2
	.align 2, 0
_08079A9C: .4byte gSineTable
_08079AA0: .4byte IWRAM_START + 0x4D
_08079AA4:
	movs r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	adds r0, r4, #0
	bl sub_8079D9C
	b _08079ABE
_08079AB2:
	adds r0, r4, #0
	bl sub_8079D00
	adds r0, r4, #0
	bl sub_8079D30
_08079ABE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8079AC4
sub_8079AC4: @ 0x08079AC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r5, _08079B58 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r7, #0x80
	ands r0, r7
	cmp r0, #0
	beq _08079ADA
	b _08079C74
_08079ADA:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r1, #0x18
	ldr r3, [r6, #0x3c]
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #0x10
	ldr r2, [r6, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x30
	bls _08079AFC
	b _08079C74
_08079AFC:
	cmp r0, #0x20
	bls _08079B02
	b _08079C74
_08079B02:
	ldrh r0, [r5, #0x14]
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	adds r1, r3, #0
	adds r3, r5, #0
	bl sub_800CDBC
	adds r1, r0, #0
	cmp r1, #0
	bne _08079B1C
	b _08079C74
_08079B1C:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08079B60
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldr r1, _08079B5C @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x4d
	movs r0, #0xc0
	b _08079C24
	.align 2, 0
_08079B58: .4byte gUnknown_030059E0
_08079B5C: .4byte gUnknown_080E001A
_08079B60:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08079BA8
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, _08079BA4 @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4d
	strb r7, [r0]
	b _08079C26
	.align 2, 0
_08079BA4: .4byte gUnknown_080E001A
_08079BA8:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08079BF4
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, _08079BF0 @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4d
	strb r2, [r0]
	b _08079C26
	.align 2, 0
_08079BF0: .4byte gUnknown_080E001A
_08079BF4:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldr r1, _08079C3C @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x4d
	movs r0, #0x40
_08079C24:
	strb r0, [r1]
_08079C26:
	ldr r2, _08079C40 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08079C48
	ldr r0, _08079C44 @ =0xFFFFFEFF
	ands r1, r0
	str r1, [r2, #0x20]
	b _08079C5C
	.align 2, 0
_08079C3C: .4byte gUnknown_080E001A
_08079C40: .4byte gUnknown_030059E0
_08079C44: .4byte 0xFFFFFEFF
_08079C48:
	mov r0, r8
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #4
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
_08079C5C:
	ldr r0, [r2, #0x3c]
	cmp r0, r4
	bne _08079C70
	movs r0, #0
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
_08079C70:
	movs r0, #1
	b _08079C76
_08079C74:
	movs r0, #0
_08079C76:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8079C80
sub_8079C80: @ 0x08079C80
	push {r4, lr}
	ldr r0, _08079CB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8079AC4
	cmp r0, #0
	beq _08079C9E
	adds r0, r4, #0
	bl sub_8079CCC
_08079C9E:
	adds r0, r4, #0
	bl sub_8079D60
	cmp r0, #0
	beq _08079CB4
	adds r0, r4, #0
	bl sub_8079D9C
	b _08079CC0
	.align 2, 0
_08079CB0: .4byte gCurTask
_08079CB4:
	adds r0, r4, #0
	bl sub_8079D00
	adds r0, r4, #0
	bl sub_8079D30
_08079CC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079CC8
sub_8079CC8: @ 0x08079CC8
	bx lr
	.align 2, 0

	thumb_func_start sub_8079CCC
sub_8079CCC: @ 0x08079CCC
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4e
	movs r1, #0
	strb r1, [r2]
	ldr r1, _08079CF4 @ =gUnknown_080E0032
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08079CF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08079CFC @ =sub_80799FC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08079CF4: .4byte gUnknown_080E0032
_08079CF8: .4byte gCurTask
_08079CFC: .4byte sub_80799FC

	thumb_func_start sub_8079D00
sub_8079D00: @ 0x08079D00
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r2, [r0, #0x3c]
	ldr r3, _08079D2C @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	strh r2, [r4, #0x16]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	ldr r0, [r0, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079D2C: .4byte gUnknown_03005960

	thumb_func_start sub_8079D30
sub_8079D30: @ 0x08079D30
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _08079D5C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079D5C: .4byte 0xFFFFFBFF

	thumb_func_start sub_8079D60
sub_8079D60: @ 0x08079D60
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08079D90 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _08079D8A
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _08079D94
_08079D8A:
	movs r0, #1
	b _08079D96
	.align 2, 0
_08079D90: .4byte gUnknown_03005960
_08079D94:
	movs r0, #0
_08079D96:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079D9C
sub_8079D9C: @ 0x08079D9C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08079DB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08079DB0: .4byte gCurTask

	thumb_func_start sub_8079DB4
sub_8079DB4: @ 0x08079DB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sb, r6
	ldr r0, _08079ED8 @ =sub_807A1A8
	ldr r2, _08079EDC @ =0x00002010
	ldr r1, _08079EE0 @ =sub_807A204
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldrb r2, [r7, #3]
	ldr r3, _08079EE4 @ =IWRAM_START + 0x68
	adds r0, r1, r3
	movs r3, #0
	strb r2, [r0]
	ldrb r2, [r7, #4]
	ldr r6, _08079EE8 @ =IWRAM_START + 0x6C
	adds r0, r1, r6
	strb r2, [r0]
	ldr r2, _08079EEC @ =IWRAM_START + 0x69
	adds r0, r1, r2
	strb r3, [r0]
	subs r6, #1
	adds r0, r1, r6
	strb r3, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	mov r2, r8
	str r0, [r2, #0x60]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r2, #0x64]
	ldrb r2, [r7]
	ldr r3, _08079EF0 @ =IWRAM_START + 0x78
	adds r0, r1, r3
	strb r2, [r0]
	adds r6, #0xe
	adds r1, r1, r6
	mov r0, sb
	strb r0, [r1]
	mov r1, r8
	str r7, [r1, #0x74]
	movs r0, #4
	bl VramMalloc
	adds r5, r0, #0
	mov r2, r8
	str r5, [r2, #0x70]
	movs r6, #0
	movs r3, #0
	ldr r0, _08079EF4 @ =gUnknown_080E0038
	mov sb, r0
	movs r1, #4
	add r1, sb
	mov sl, r1
_08079E52:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r0, r4, #4
	mov r1, r8
	adds r2, r1, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	lsls r4, r4, #1
	mov r1, sb
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	mov r0, sb
	adds r0, #2
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	str r5, [r2, #4]
	adds r0, r2, #0
	str r3, [sp, #4]
	bl sub_8004558
	add r4, sl
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r5, r5, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #4]
	cmp r6, #1
	bls _08079E52
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079ED8: .4byte sub_807A1A8
_08079EDC: .4byte 0x00002010
_08079EE0: .4byte sub_807A204
_08079EE4: .4byte IWRAM_START + 0x68
_08079EE8: .4byte IWRAM_START + 0x6C
_08079EEC: .4byte IWRAM_START + 0x69
_08079EF0: .4byte IWRAM_START + 0x78
_08079EF4: .4byte gUnknown_080E0038

	thumb_func_start sub_8079EF8
sub_8079EF8: @ 0x08079EF8
	push {r4, r5, r6, lr}
	ldr r0, _08079F30 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r5, _08079F34 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08079F18
	adds r0, r4, #0
	bl sub_807A238
_08079F18:
	ldr r1, _08079F38 @ =IWRAM_START + 0x69
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08079F3C
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	b _08079F46
	.align 2, 0
_08079F30: .4byte gCurTask
_08079F34: .4byte gUnknown_030059E0
_08079F38: .4byte IWRAM_START + 0x69
_08079F3C:
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
_08079F46:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_807A104
	cmp r0, #0
	bne _08079F58
	adds r0, r4, #0
	bl sub_807A238
_08079F58:
	adds r0, r4, #0
	bl sub_807A25C
	adds r0, r4, #0
	bl sub_807A2D0
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	cmp r0, #0
	beq _08079F74
	adds r0, r4, #0
	bl sub_807A2AC
_08079F74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079F7C
sub_8079F7C: @ 0x08079F7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r6, #0x30
	ldr r2, [r0, #0x60]
	ldr r4, _0807A000 @ =gUnknown_03005960
	ldr r3, [r4]
	subs r1, r2, r3
	subs r1, #0x70
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	subs r2, r2, r3
	adds r2, #0x70
	ldr r0, [r0, #0x64]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0807A004 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r4, r0, #1
	movs r0, #1
	ands r4, r0
	lsls r1, r5, #0x10
	asrs r0, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bgt _08079FF6
	cmp r0, #0xf6
	bgt _08079FF6
	adds r7, r2, #0
_08079FC0:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08079FDA
	asrs r0, r1, #0x10
	cmp r0, #5
	ble _08079FDA
	strh r5, [r6, #0x16]
	mov r0, r8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
_08079FDA:
	lsls r0, r5, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r5, #0x10
	asrs r0, r1, #0x10
	cmp r0, r7
	bgt _08079FF6
	cmp r0, #0xf6
	ble _08079FC0
_08079FF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A000: .4byte gUnknown_03005960
_0807A004: .4byte gUnknown_03005590

	thumb_func_start sub_807A008
sub_807A008: @ 0x0807A008
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	ldr r2, _0807A088 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, [r5, #0x64]
	ldr r0, [r2, #4]
	subs r0, #4
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0807A08C @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r4, r0, #1
	movs r0, #1
	ands r4, r0
	cmp r4, #0xb
	bhi _0807A07C
	ldr r6, _0807A090 @ =gUnknown_080E006C
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r0, r6, #2
	mov sb, r0
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0807A048:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r0, r6, #4
	adds r0, r2, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r1, r2, r6
	ldrh r1, [r1]
	add r1, r8
	strh r1, [r0, #0x16]
	add r2, sb
	ldrh r1, [r2]
	adds r1, r7, r1
	strh r1, [r0, #0x18]
	bl sub_80051E8
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _0807A048
_0807A07C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A088: .4byte gUnknown_03005960
_0807A08C: .4byte gUnknown_03005590
_0807A090: .4byte gUnknown_080E006C

	thumb_func_start sub_807A094
sub_807A094: @ 0x0807A094
	push {r4, r5, lr}
	ldr r3, [r0, #0x60]
	ldr r2, _0807A0F4 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r3, r3, r1
	ldr r1, [r0, #0x64]
	ldr r2, [r2, #4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r1, _0807A0F8 @ =gUnknown_080E0044
	adds r0, #0x68
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsh r0, [r2, r1]
	adds r0, r3, r0
	movs r4, #0x80
	rsbs r4, r4, #0
	cmp r0, r4
	blt _0807A0EE
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r0, r3, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807A0EE
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	movs r3, #6
	ldrsh r0, [r2, r3]
	adds r0, r1, r0
	cmp r0, r4
	blt _0807A0EE
	movs r3, #2
	ldrsh r0, [r2, r3]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807A0FC
_0807A0EE:
	movs r0, #1
	b _0807A0FE
	.align 2, 0
_0807A0F4: .4byte gUnknown_03005960
_0807A0F8: .4byte gUnknown_080E0044
_0807A0FC:
	movs r0, #0
_0807A0FE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A104
sub_807A104: @ 0x0807A104
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0807A194 @ =gUnknown_030059E0
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A1A0
	ldr r3, [r6, #0x60]
	ldr r0, _0807A198 @ =gUnknown_03005960
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r6, #0x64]
	ldr r5, [r0, #4]
	subs r2, r2, r5
	ldr r4, [r7, #8]
	asrs r4, r4, #8
	subs r4, r4, r1
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r5, _0807A19C @ =gUnknown_080E0054
	adds r0, r6, #0
	adds r0, #0x68
	ldrb r1, [r0]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r5, [r1]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r3, r3, r5
	ldrh r6, [r1, #2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r6
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r0, [r1, #4]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r1, #6]
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r3, r4
	bgt _0807A1A0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r3, r0
	cmp r0, r4
	blt _0807A1A0
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	lsls r0, r7, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807A1A0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, r2, r0
	cmp r0, r1
	blt _0807A1A0
	movs r0, #1
	b _0807A1A2
	.align 2, 0
_0807A194: .4byte gUnknown_030059E0
_0807A198: .4byte gUnknown_03005960
_0807A19C: .4byte gUnknown_080E0054
_0807A1A0:
	movs r0, #0
_0807A1A2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807A1A8
sub_807A1A8: @ 0x0807A1A8
	push {r4, r5, lr}
	ldr r0, _0807A1D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_807A104
	cmp r0, #0
	beq _0807A1C6
	adds r0, r4, #0
	bl sub_807A218
_0807A1C6:
	adds r0, r4, #0
	bl sub_807A094
	cmp r0, #0
	beq _0807A1DC
	adds r0, r4, #0
	bl sub_807A314
	b _0807A1F8
	.align 2, 0
_0807A1D8: .4byte gCurTask
_0807A1DC:
	adds r0, r4, #0
	bl sub_807A25C
	adds r0, r4, #0
	bl sub_807A2D0
	ldr r1, _0807A200 @ =IWRAM_START + 0x69
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A1F8
	adds r0, r4, #0
	bl sub_807A2AC
_0807A1F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A200: .4byte IWRAM_START + 0x69

	thumb_func_start sub_807A204
sub_807A204: @ 0x0807A204
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x70]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807A218
sub_807A218: @ 0x0807A218
	ldr r1, _0807A22C @ =gUnknown_030059E0
	adds r1, #0x38
	ldrb r1, [r1]
	adds r0, #0x6a
	strb r1, [r0]
	ldr r0, _0807A230 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A234 @ =sub_8079EF8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807A22C: .4byte gUnknown_030059E0
_0807A230: .4byte gCurTask
_0807A234: .4byte sub_8079EF8

	thumb_func_start sub_807A238
sub_807A238: @ 0x0807A238
	ldr r1, _0807A250 @ =gUnknown_030059E0
	adds r1, #0x38
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0807A254 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A258 @ =sub_807A1A8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807A250: .4byte gUnknown_030059E0
_0807A254: .4byte gCurTask
_0807A258: .4byte sub_807A1A8

	thumb_func_start sub_807A25C
sub_807A25C: @ 0x0807A25C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0807A294 @ =gUnknown_03005590
	adds r0, #0x6c
	ldrb r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r3, _0807A298 @ =gUnknown_080E0064
	adds r1, r5, #0
	adds r1, #0x68
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r2, r1, r3
	ldrh r4, [r2]
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r1, r4, r1
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bhs _0807A29C
	adds r1, r5, #0
	adds r1, #0x69
	movs r0, #1
	b _0807A2A2
	.align 2, 0
_0807A294: .4byte gUnknown_03005590
_0807A298: .4byte gUnknown_080E0064
_0807A29C:
	adds r1, r5, #0
	adds r1, #0x69
	movs r0, #0
_0807A2A2:
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A2AC
sub_807A2AC: @ 0x0807A2AC
	push {lr}
	adds r1, r0, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A2BE
	cmp r0, #1
	beq _0807A2C6
	b _0807A2CC
_0807A2BE:
	adds r0, r1, #0
	bl sub_8079F7C
	b _0807A2CC
_0807A2C6:
	adds r0, r1, #0
	bl sub_807A008
_0807A2CC:
	pop {r0}
	bx r0

	thumb_func_start sub_807A2D0
sub_807A2D0: @ 0x0807A2D0
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r1, #0x69
	ldrb r5, [r1]
	cmp r5, #0
	beq _0807A2F8
	adds r4, r0, #0
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807A30A
	ldr r0, _0807A2F4 @ =0x00000127
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r4]
	b _0807A30A
	.align 2, 0
_0807A2F4: .4byte 0x00000127
_0807A2F8:
	adds r4, r0, #0
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	beq _0807A30A
	ldr r0, _0807A310 @ =0x00000127
	bl m4aSongNumStop
	strb r5, [r4]
_0807A30A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A310: .4byte 0x00000127

	thumb_func_start sub_807A314
sub_807A314: @ 0x0807A314
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807A334 @ =0x00000127
	bl m4aSongNumStop
	ldr r1, [r4, #0x74]
	adds r4, #0x78
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r0, _0807A338 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A334: .4byte 0x00000127
_0807A338: .4byte gCurTask

	thumb_func_start sub_807A33C
sub_807A33C: @ 0x0807A33C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sl, r0
	adds r5, r3, #0
	ldr r4, [sp, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x20]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0807A3FC @ =sub_807AA68
	ldr r2, _0807A400 @ =0x00002010
	ldr r1, _0807A404 @ =sub_807AB04
	str r1, [sp]
	movs r1, #0xb0
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0x94
	adds r3, r1, r0
	movs r2, #0
	strh r4, [r3]
	ldr r4, _0807A408 @ =IWRAM_START + 0x8C
	adds r0, r1, r4
	str r2, [r0]
	ldr r5, _0807A40C @ =IWRAM_START + 0x90
	adds r0, r1, r5
	str r2, [r0]
	mov r2, sl
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	subs r4, #8
	adds r2, r1, r4
	strh r0, [r2]
	mov r5, sl
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	ldr r5, _0807A410 @ =IWRAM_START + 0x86
	adds r4, r1, r5
	strh r0, [r4]
	mov r5, sl
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	ldrh r5, [r2]
	adds r0, r0, r5
	subs r0, #0x18
	ldr r5, _0807A414 @ =IWRAM_START + 0x88
	adds r7, r1, r5
	strh r0, [r7]
	mov r5, sl
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r5, [r4]
	adds r0, r0, r5
	subs r0, #0x18
	ldr r5, _0807A418 @ =IWRAM_START + 0x8A
	adds r1, r1, r5
	strh r0, [r1]
	mov r0, sl
	str r0, [r6]
	mov r5, sb
	strh r5, [r6, #4]
	mov r0, r8
	strh r0, [r6, #6]
	mov r5, sl
	ldrb r0, [r5]
	strb r0, [r6, #8]
	add r0, sp, #0x20
	ldrb r0, [r0]
	strb r0, [r6, #9]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807A430
	cmp r0, #1
	bgt _0807A41C
	cmp r0, #0
	beq _0807A422
	b _0807A44E
	.align 2, 0
_0807A3FC: .4byte sub_807AA68
_0807A400: .4byte 0x00002010
_0807A404: .4byte sub_807AB04
_0807A408: .4byte IWRAM_START + 0x8C
_0807A40C: .4byte IWRAM_START + 0x90
_0807A410: .4byte IWRAM_START + 0x86
_0807A414: .4byte IWRAM_START + 0x88
_0807A418: .4byte IWRAM_START + 0x8A
_0807A41C:
	cmp r0, #2
	beq _0807A43E
	b _0807A44E
_0807A422:
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	str r0, [r6, #0x74]
	movs r2, #0
	ldrsh r0, [r4, r2]
	b _0807A44A
_0807A430:
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r6, #0x74]
	movs r5, #0
	ldrsh r0, [r4, r5]
	b _0807A44A
_0807A43E:
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r6, #0x74]
	movs r4, #0
	ldrsh r0, [r1, r4]
_0807A44A:
	lsls r0, r0, #8
	str r0, [r6, #0x78]
_0807A44E:
	mov r5, sb
	lsls r2, r5, #8
	mov r0, r8
	lsls r0, r0, #8
	mov r8, r0
	adds r7, r6, #0
	adds r7, #0xc
	movs r1, #0x2d
	adds r1, r1, r6
	mov sb, r1
	movs r3, #0x2e
	adds r3, r3, r6
	mov ip, r3
	adds r4, r6, #0
	adds r4, #0x31
	str r4, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x2c
	str r5, [sp, #0x14]
	adds r1, r6, #0
	adds r1, #0x3c
	adds r0, r6, #0
	adds r0, #0x5d
	str r0, [sp, #8]
	adds r3, r6, #0
	adds r3, #0x5e
	str r3, [sp, #0xc]
	adds r4, #0x30
	str r4, [sp, #0x10]
	adds r5, #0x30
	str r5, [sp, #4]
	adds r4, #0x3b
	adds r3, #0x3a
	movs r5, #2
_0807A492:
	ldr r0, [r6, #0x74]
	str r0, [r3]
	ldr r0, [r6, #0x78]
	str r0, [r4]
	adds r4, #8
	adds r3, #8
	subs r5, #1
	cmp r5, #0
	bge _0807A492
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r2
	str r0, [r6, #0x6c]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	add r0, r8
	str r0, [r6, #0x70]
	movs r5, #0
	movs r4, #0
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	mov r2, sb
	strb r0, [r2]
	movs r3, #0x10
	mov sb, r3
	mov r2, sb
	mov r0, ip
	strb r2, [r0]
	ldr r3, [sp, #0x18]
	strb r5, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	movs r0, #8
	str r1, [sp, #0x1c]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0807A554 @ =0x00000253
	strh r0, [r7, #0xa]
	movs r0, #2
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0x90
	lsls r0, r0, #3
	ldr r1, [sp, #0x1c]
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #8]
	strb r0, [r3]
	mov r0, sb
	ldr r4, [sp, #0xc]
	strb r0, [r4]
	ldr r2, [sp, #0x10]
	strb r5, [r2]
	mov r3, r8
	str r3, [r1, #0x28]
	str r6, [r1, #0x10]
	ldr r0, _0807A558 @ =0x06012C80
	str r0, [r1, #4]
	ldr r0, _0807A55C @ =0x00000257
	strh r0, [r1, #0xa]
	ldr r4, [sp, #4]
	strb r5, [r4]
	adds r0, r1, #0
	bl sub_8004558
	movs r5, #2
	rsbs r5, r5, #0
	adds r0, r5, #0
	mov r1, sl
	strb r0, [r1]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A554: .4byte 0x00000253
_0807A558: .4byte 0x06012C80
_0807A55C: .4byte 0x00000257

	thumb_func_start sub_807A560
sub_807A560: @ 0x0807A560
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r0, _0807A5A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807A5A4 @ =gUnknown_030059E0
	adds r2, r0, #0
	adds r2, #0x6d
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x64
	strh r6, [r0]
	ldr r0, _0807A5A8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807A58C
	adds r0, r4, #0
	bl sub_807AB6C
_0807A58C:
	ldr r1, _0807A5AC @ =IWRAM_START + 0x94
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807A5DC
	cmp r0, #1
	bgt _0807A5B0
	cmp r0, #0
	beq _0807A5B6
	b _0807A61C
	.align 2, 0
_0807A5A0: .4byte gCurTask
_0807A5A4: .4byte gUnknown_030059E0
_0807A5A8: .4byte gGameMode
_0807A5AC: .4byte IWRAM_START + 0x94
_0807A5B0:
	cmp r0, #2
	beq _0807A600
	b _0807A61C
_0807A5B6:
	ldr r0, [r4, #0x74]
	ldr r2, _0807A5D4 @ =0xFFFFF880
	adds r0, r0, r2
	str r0, [r4, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807A5D8 @ =IWRAM_START + 0x84
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bgt _0807A61C
	lsls r0, r1, #8
	str r0, [r4, #0x74]
	b _0807A61A
	.align 2, 0
_0807A5D4: .4byte 0xFFFFF880
_0807A5D8: .4byte IWRAM_START + 0x84
_0807A5DC:
	ldr r0, [r4, #0x74]
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r4, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807A5FC @ =IWRAM_START + 0x88
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	blt _0807A61C
	lsls r0, r1, #8
	str r0, [r4, #0x74]
	b _0807A61A
	.align 2, 0
_0807A5FC: .4byte IWRAM_START + 0x88
_0807A600:
	ldr r0, [r4, #0x78]
	ldr r1, _0807A678 @ =0xFFFFF880
	adds r0, r0, r1
	str r0, [r4, #0x78]
	asrs r0, r0, #8
	ldr r2, _0807A67C @ =IWRAM_START + 0x86
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bgt _0807A61C
	lsls r0, r1, #8
	str r0, [r4, #0x78]
_0807A61A:
	movs r6, #1
_0807A61C:
	ldr r0, _0807A680 @ =gUnknown_030059E0
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0x78
	bne _0807A63E
	adds r2, r4, #0
	adds r2, #0x90
	ldr r0, [r2]
	cmp r0, #0
	beq _0807A63E
	ldr r0, [r3, #0x20]
	ldr r1, _0807A684 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	movs r0, #0
	str r0, [r2]
_0807A63E:
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A658
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	beq _0807A658
	adds r0, r4, #0
	bl sub_807AB18
_0807A658:
	cmp r6, #0
	beq _0807A662
	adds r0, r4, #0
	bl sub_807A73C
_0807A662:
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	adds r0, r4, #0
	bl sub_807A7F4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A678: .4byte 0xFFFFF880
_0807A67C: .4byte IWRAM_START + 0x86
_0807A680: .4byte gUnknown_030059E0
_0807A684: .4byte 0xFFBFFFFF

	thumb_func_start sub_807A688
sub_807A688: @ 0x0807A688
	push {r4, lr}
	mov ip, r0
	ldr r3, _0807A6EC @ =gUnknown_030059E0
	ldr r1, [r0, #0x6c]
	lsls r1, r1, #8
	ldr r0, [r0, #0x74]
	adds r1, r1, r0
	ldr r0, [r3, #8]
	subs r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x7c]
	mov r2, ip
	adds r2, #0x80
	ldr r1, [r1, #0x70]
	lsls r1, r1, #8
	mov r4, ip
	ldr r0, [r4, #0x78]
	adds r1, r1, r0
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r2]
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0
	movs r4, #1
	strb r4, [r1]
	subs r1, #9
	movs r2, #0
	strh r0, [r1]
	strh r0, [r3, #0x10]
	strh r0, [r3, #0x12]
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	mov r0, ip
	adds r0, #0x90
	str r4, [r0]
	mov r1, ip
	adds r1, #0xc
	adds r0, #4
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807A6F6
	cmp r0, #1
	bgt _0807A6F0
	cmp r0, #0
	beq _0807A6F6
	b _0807A712
	.align 2, 0
_0807A6EC: .4byte gUnknown_030059E0
_0807A6F0:
	cmp r0, #2
	beq _0807A708
	b _0807A712
_0807A6F6:
	ldr r0, _0807A704 @ =0x00000253
	strh r0, [r1, #0xa]
	mov r0, ip
	adds r0, #0x2c
	strb r2, [r0]
	b _0807A712
	.align 2, 0
_0807A704: .4byte 0x00000253
_0807A708:
	ldr r0, _0807A730 @ =0x00000253
	strh r0, [r1, #0xa]
	mov r0, ip
	adds r0, #0x2c
	strb r4, [r0]
_0807A712:
	mov r1, ip
	adds r1, #0x8c
	movs r0, #1
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807A734 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A738 @ =sub_807A560
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A730: .4byte 0x00000253
_0807A734: .4byte gCurTask
_0807A738: .4byte sub_807A560

	thumb_func_start sub_807A73C
sub_807A73C: @ 0x0807A73C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0xc
	movs r7, #0
	ldr r1, _0807A788 @ =0x00000253
	strh r1, [r0, #0xa]
	adds r2, r6, #0
	adds r2, #0x2c
	movs r1, #2
	strb r1, [r2]
	bl sub_8004558
	ldr r3, _0807A78C @ =gUnknown_030059E0
	ldr r5, [r3, #0x20]
	movs r1, #0x80
	ands r1, r5
	cmp r1, #0
	bne _0807A7CC
	adds r4, r6, #0
	adds r4, #0x90
	ldr r0, [r4]
	cmp r0, #0
	beq _0807A7CC
	ldr r2, _0807A790 @ =0xFFBFFFFF
	ands r2, r5
	str r2, [r3, #0x20]
	str r1, [r4]
	adds r0, r6, #0
	adds r0, #0x94
	ldrh r1, [r0]
	cmp r1, #1
	beq _0807A7A8
	cmp r1, #1
	bgt _0807A794
	cmp r1, #0
	beq _0807A79A
	b _0807A7CC
	.align 2, 0
_0807A788: .4byte 0x00000253
_0807A78C: .4byte gUnknown_030059E0
_0807A790: .4byte 0xFFBFFFFF
_0807A794:
	cmp r1, #2
	beq _0807A7BE
	b _0807A7CC
_0807A79A:
	ldr r0, _0807A7A4 @ =0x0000F880
	strh r0, [r3, #0x14]
	movs r1, #1
	orrs r2, r1
	b _0807A7B4
	.align 2, 0
_0807A7A4: .4byte 0x0000F880
_0807A7A8:
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
_0807A7B4:
	str r2, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x6d
	strb r1, [r0]
	b _0807A7CC
_0807A7BE:
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0xe
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6e
	strb r7, [r0]
_0807A7CC:
	adds r1, r6, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807A7EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A7F0 @ =sub_807AABC
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A7EC: .4byte gCurTask
_0807A7F0: .4byte sub_807AABC

	thumb_func_start sub_807A7F4
sub_807A7F4: @ 0x0807A7F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0xc
	ldr r0, _0807A824 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807A82C
	ldr r1, [r6, #0x6c]
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807A828 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r6, #0x70]
	adds r0, r6, #0
	adds r0, #0xa4
	ldr r0, [r0]
	b _0807A840
	.align 2, 0
_0807A824: .4byte gGameMode
_0807A828: .4byte gUnknown_03005960
_0807A82C:
	ldr r1, [r6, #0x6c]
	ldr r0, [r6, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807A868 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r6, #0x70]
	ldr r0, [r6, #0x78]
_0807A840:
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0807A8DC
	adds r0, r6, #0
	adds r0, #0x94
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807A890
	cmp r0, #1
	bgt _0807A86C
	cmp r0, #0
	beq _0807A872
	b _0807A8FE
	.align 2, 0
_0807A868: .4byte gUnknown_03005960
_0807A86C:
	cmp r0, #2
	beq _0807A8B4
	b _0807A8FE
_0807A872:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A88C @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	b _0807A8CC
	.align 2, 0
_0807A88C: .4byte 0xFFFFF3FF
_0807A890:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A8B0 @ =0xFFFFF7FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	b _0807A8CC
	.align 2, 0
_0807A8B0: .4byte 0xFFFFF7FF
_0807A8B4:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A8D8 @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
_0807A8CC:
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	b _0807A8FE
	.align 2, 0
_0807A8D8: .4byte 0xFFFFF3FF
_0807A8DC:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A91C @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_0807A8FE:
	ldrh r0, [r5, #0x16]
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	ldrh r1, [r5, #0x18]
	adds r0, r6, #0
	adds r0, #0x54
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A91C: .4byte 0xFFFFF3FF

	thumb_func_start sub_807A920
sub_807A920: @ 0x0807A920
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x6c]
	ldr r1, _0807A990 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x70]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x88
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	adds r0, #0x18
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807A98A
	adds r0, r3, #0
	adds r0, #0x84
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	subs r0, #0x18
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807A98A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x8a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	adds r0, #0x18
	cmp r0, r5
	blt _0807A98A
	adds r0, r3, #0
	adds r0, #0x86
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	subs r0, #0x18
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807A994
_0807A98A:
	movs r0, #1
	b _0807A996
	.align 2, 0
_0807A990: .4byte gUnknown_03005960
_0807A994:
	movs r0, #0
_0807A996:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A99C
sub_807A99C: @ 0x0807A99C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807A9E8 @ =gUnknown_030059E0
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807AA5E
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r2, [r4, #0x74]
	asrs r2, r2, #8
	ldr r1, [r4, #0x6c]
	adds r1, r1, r2
	ldr r3, [r4, #0x78]
	asrs r3, r3, #8
	ldr r2, [r4, #0x70]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA5E
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807A9EC
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807AA60
	.align 2, 0
_0807A9E8: .4byte gUnknown_030059E0
_0807A9EC:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807AA18
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807AA60
_0807AA18:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807AA44
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #3
	b _0807AA60
_0807AA44:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AA5E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #4
	b _0807AA60
_0807AA5E:
	movs r0, #0
_0807AA60:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA68
sub_807AA68: @ 0x0807AA68
	push {r4, lr}
	ldr r0, _0807AAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807AAAC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807AA84
	adds r0, r4, #0
	bl sub_807AB6C
_0807AA84:
	adds r0, r4, #0
	bl sub_807A99C
	cmp r0, #2
	bne _0807AA94
	adds r0, r4, #0
	bl sub_807A688
_0807AA94:
	adds r0, r4, #0
	bl sub_807A920
	cmp r0, #0
	beq _0807AAB0
	adds r0, r4, #0
	bl sub_807AB54
	b _0807AAB6
	.align 2, 0
_0807AAA8: .4byte gCurTask
_0807AAAC: .4byte gGameMode
_0807AAB0:
	adds r0, r4, #0
	bl sub_807A7F4
_0807AAB6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AABC
sub_807AABC: @ 0x0807AABC
	push {r4, lr}
	ldr r0, _0807AAF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807AAF4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807AAD8
	adds r0, r4, #0
	bl sub_807AB6C
_0807AAD8:
	adds r0, r4, #0
	bl sub_807A99C
	adds r0, r4, #0
	bl sub_807A920
	cmp r0, #0
	beq _0807AAF8
	adds r0, r4, #0
	bl sub_807AB54
	b _0807AAFE
	.align 2, 0
_0807AAF0: .4byte gCurTask
_0807AAF4: .4byte gGameMode
_0807AAF8:
	adds r0, r4, #0
	bl sub_807A7F4
_0807AAFE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AB04
sub_807AB04: @ 0x0807AB04
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807AB18
sub_807AB18: @ 0x0807AB18
	push {lr}
	ldr r3, _0807AB50 @ =gUnknown_030059E0
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xf
	orrs r1, r2
	str r1, [r3, #0x20]
	ldr r2, [r0, #0x6c]
	lsls r2, r2, #8
	ldr r1, [r0, #0x7c]
	adds r1, r1, r2
	ldr r2, [r0, #0x74]
	adds r1, r1, r2
	str r1, [r3, #8]
	adds r1, r0, #0
	adds r1, #0x80
	ldr r2, [r0, #0x70]
	lsls r2, r2, #8
	ldr r1, [r1]
	adds r1, r1, r2
	ldr r2, [r0, #0x78]
	adds r1, r1, r2
	str r1, [r3, #0xc]
	bl sub_807A99C
	pop {r0}
	bx r0
	.align 2, 0
_0807AB50: .4byte gUnknown_030059E0

	thumb_func_start sub_807AB54
sub_807AB54: @ 0x0807AB54
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807AB68 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807AB68: .4byte gCurTask

	thumb_func_start sub_807AB6C
sub_807AB6C: @ 0x0807AB6C
	push {r4, lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0xa8
	mov r4, ip
	adds r4, #0xa0
	ldr r0, [r4]
	str r0, [r1]
	adds r1, #4
	mov r3, ip
	adds r3, #0xa4
	ldr r0, [r3]
	str r0, [r1]
	mov r2, ip
	adds r2, #0x98
	ldr r0, [r2]
	str r0, [r4]
	subs r1, #0x10
	ldr r0, [r1]
	str r0, [r3]
	mov r3, ip
	ldr r0, [r3, #0x74]
	str r0, [r2]
	ldr r0, [r3, #0x78]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807ABA4
sub_807ABA4: @ 0x0807ABA4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807ABC4
sub_807ABC4: @ 0x0807ABC4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807ABE4
sub_807ABE4: @ 0x0807ABE4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AC04
sub_807AC04: @ 0x0807AC04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
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
	ldr r0, _0807ACD4 @ =sub_807AF94
	ldr r2, _0807ACD8 @ =0x00002010
	ldr r1, _0807ACDC @ =sub_807AFF0
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r2, r6
	mov r1, sb
	str r1, [r6]
	movs r3, #0
	movs r1, #0
	strh r4, [r6, #4]
	strh r5, [r6, #6]
	mov r7, sb
	ldrb r0, [r7]
	strb r0, [r6, #8]
	mov r0, r8
	strb r0, [r6, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r6, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r6, #0x40]
	ldr r7, _0807ACE0 @ =IWRAM_START + 0xC
	adds r4, r2, r7
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _0807ACE4 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r7, #0x22
	adds r1, r2, r7
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807ACE8 @ =IWRAM_START + 0x31
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x2a
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807ACEC @ =0x0000FFFF
	strh r0, [r4, #0xa]
	ldr r2, [sp, #4]
	ldr r4, _0807ACF0 @ =IWRAM_START + 0x2C
	adds r2, r2, r4
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r2]
	adds r0, r6, #0
	movs r1, #1
	bl sub_807ACF4
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	mov r1, sb
	strb r0, [r1]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ACD4: .4byte sub_807AF94
_0807ACD8: .4byte 0x00002010
_0807ACDC: .4byte sub_807AFF0
_0807ACE0: .4byte IWRAM_START + 0xC
_0807ACE4: .4byte IWRAM_START + 0x2D
_0807ACE8: .4byte IWRAM_START + 0x31
_0807ACEC: .4byte 0x0000FFFF
_0807ACF0: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807ACF4
sub_807ACF4: @ 0x0807ACF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r6, #0
	adds r5, #0xc
	ldr r0, _0807AD2C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x8f
	lsls r1, r1, #1
	bl __umodsi3
	adds r2, r0, #0
	cmp r2, #0x77
	bhi _0807AD68
	movs r0, #0xf
	ands r2, r0
	cmp r4, #0
	beq _0807AD30
	cmp r2, #7
	bls _0807AD34
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #9
	b _0807AD40
	.align 2, 0
_0807AD2C: .4byte gUnknown_03005590
_0807AD30:
	cmp r2, #0
	bne _0807AD4A
_0807AD34:
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #8
_0807AD40:
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	b _0807AD62
_0807AD4A:
	cmp r2, #8
	bne _0807AD62
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #9
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
_0807AD62:
	movs r0, #0
	str r0, [r6, #0x44]
	b _0807AE52
_0807AD68:
	cmp r2, #0xb8
	bhi _0807ADA4
	subs r2, #0x78
	movs r3, #1
	ldr r0, _0807AD9C @ =gUnknown_080E00FC
	adds r1, r0, #0
	ldr r0, _0807ADA0 @ =gUnknown_080E00B4
	mov ip, r0
	adds r7, r6, #0
	adds r7, #0x2c
	ldrh r0, [r1, #4]
	cmp r2, r0
	blo _0807AE28
	adds r4, r1, #0
_0807AD84:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bhi _0807AE28
	lsls r0, r3, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r2, r0
	bhs _0807AD84
	b _0807AE28
	.align 2, 0
_0807AD9C: .4byte gUnknown_080E00FC
_0807ADA0: .4byte gUnknown_080E00B4
_0807ADA4:
	cmp r2, #0xf4
	bhi _0807ADFC
	subs r2, #0xb9
	movs r0, #0xf
	ands r2, r0
	cmp r4, #0
	beq _0807ADC4
	cmp r2, #7
	bls _0807ADC8
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #3
	b _0807ADD4
_0807ADC4:
	cmp r2, #0
	bne _0807ADDE
_0807ADC8:
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #2
_0807ADD4:
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	b _0807ADF6
_0807ADDE:
	cmp r2, #8
	bne _0807ADF6
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #3
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
_0807ADF6:
	movs r0, #1
	str r0, [r6, #0x44]
	b _0807AE52
_0807ADFC:
	subs r2, #0xf5
	movs r3, #1
	ldr r0, _0807AE58 @ =gUnknown_080E00D4
	ldr r1, _0807AE5C @ =gUnknown_080E00B4
	mov ip, r1
	adds r7, r6, #0
	adds r7, #0x2c
	adds r1, r0, #0
	ldrh r0, [r1, #4]
	cmp r2, r0
	blo _0807AE28
	adds r4, r1, #0
_0807AE14:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bhi _0807AE28
	lsls r0, r3, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r2, r0
	bhs _0807AE14
_0807AE28:
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	mov r2, ip
	adds r0, r1, r2
	ldrh r0, [r0]
	movs r4, #0
	strh r0, [r5, #0xa]
	mov r0, ip
	adds r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r7]
	adds r0, r5, #0
	bl sub_8004558
	str r4, [r6, #0x44]
_0807AE52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AE58: .4byte gUnknown_080E00D4
_0807AE5C: .4byte gUnknown_080E00B4

	thumb_func_start sub_807AE60
sub_807AE60: @ 0x0807AE60
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0807AEA0 @ =gUnknown_030059E0
	ldr r4, [r5, #0x20]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	bne _0807AF02
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AF02
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807AEA4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r4, [r5, #0x12]
	movs r0, #2
	b _0807AF04
	.align 2, 0
_0807AEA0: .4byte gUnknown_030059E0
_0807AEA4:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807AEC6
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	movs r0, #1
	b _0807AF04
_0807AEC6:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807AEE8
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	movs r0, #3
	b _0807AF04
_0807AEE8:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AF02
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #4
	b _0807AF04
_0807AF02:
	movs r0, #0
_0807AF04:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AF0C
sub_807AF0C: @ 0x0807AF0C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, _0807AF5C @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807AF8A
	adds r5, r2, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #0x10
	strb r0, [r5]
	adds r4, r2, #0
	adds r4, #0x3b
	ldrb r0, [r4]
	adds r0, #0x10
	strb r0, [r4]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	bl sub_800CDBC
	adds r1, r0, #0
	ldrb r0, [r5]
	adds r0, #0x10
	strb r0, [r5]
	ldrb r0, [r4]
	subs r0, #0x10
	strb r0, [r4]
	cmp r1, #0
	beq _0807AF8A
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0807AF60
	movs r0, #2
	b _0807AF8C
	.align 2, 0
_0807AF5C: .4byte gUnknown_030059E0
_0807AF60:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0807AF6E
	movs r0, #1
	b _0807AF8C
_0807AF6E:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0807AF7C
	movs r0, #3
	b _0807AF8C
_0807AF7C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AF8A
	movs r0, #4
	b _0807AF8C
_0807AF8A:
	movs r0, #0
_0807AF8C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AF94
sub_807AF94: @ 0x0807AF94
	push {r4, lr}
	ldr r0, _0807AFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0
	bl sub_807ACF4
	adds r0, r4, #0
	bl sub_807AE60
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0807AFCA
	adds r0, r4, #0
	bl sub_807AF0C
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0807AFCA
	ldr r0, _0807AFE0 @ =gUnknown_030059E0
	bl sub_800CBA4
_0807AFCA:
	adds r0, r4, #0
	bl sub_807B028
	cmp r0, #0
	beq _0807AFE4
	adds r0, r4, #0
	bl sub_807B070
	b _0807AFEA
	.align 2, 0
_0807AFDC: .4byte gCurTask
_0807AFE0: .4byte gUnknown_030059E0
_0807AFE4:
	adds r0, r4, #0
	bl sub_807B004
_0807AFEA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AFF0
sub_807AFF0: @ 0x0807AFF0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807B004
sub_807B004: @ 0x0807B004
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B024 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	adds r0, #0xc
	bl sub_80051E8
	pop {r0}
	bx r0
	.align 2, 0
_0807B024: .4byte gUnknown_03005960

	thumb_func_start sub_807B028
sub_807B028: @ 0x0807B028
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B064 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
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
	bhi _0807B060
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B060
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B068
_0807B060:
	movs r0, #1
	b _0807B06A
	.align 2, 0
_0807B064: .4byte gUnknown_03005960
_0807B068:
	movs r0, #0
_0807B06A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B070
sub_807B070: @ 0x0807B070
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807B084 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807B084: .4byte gCurTask

	thumb_func_start sub_807B088
sub_807B088: @ 0x0807B088
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807B168 @ =sub_807B274
	ldr r2, _0807B16C @ =0x00002010
	ldr r1, _0807B170 @ =sub_807B2BC
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldr r1, _0807B174 @ =IWRAM_START + 0x44
	adds r0, r5, r1
	movs r1, #0
	mov sl, r1
	movs r3, #0
	strh r3, [r0]
	ldr r1, _0807B178 @ =IWRAM_START + 0x46
	adds r0, r5, r1
	strh r3, [r0]
	adds r1, #2
	adds r0, r5, r1
	strh r3, [r0]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	strh r4, [r2, #4]
	strh r6, [r2, #6]
	mov r0, sb
	str r0, [r2]
	ldrb r0, [r0]
	strb r0, [r2, #8]
	mov r1, r8
	strb r1, [r2, #9]
	ldr r0, _0807B17C @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]
	ldr r0, _0807B180 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B184 @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807B188 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _0807B18C @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	mov r1, sl
	strb r1, [r5]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, sb
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B168: .4byte sub_807B274
_0807B16C: .4byte 0x00002010
_0807B170: .4byte sub_807B2BC
_0807B174: .4byte IWRAM_START + 0x44
_0807B178: .4byte IWRAM_START + 0x46
_0807B17C: .4byte IWRAM_START + 0xC
_0807B180: .4byte IWRAM_START + 0x2D
_0807B184: .4byte IWRAM_START + 0x2E
_0807B188: .4byte IWRAM_START + 0x31
_0807B18C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807B190
sub_807B190: @ 0x0807B190
	push {lr}
	ldr r3, [r0, #0x3c]
	ldr r2, _0807B1E4 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r3, r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r3, r3, r1
	ldr r1, [r0, #0x40]
	ldr r2, [r2, #4]
	subs r1, r1, r2
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r3, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r3, r3, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r3, r0
	bhi _0807B1DE
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B1DE
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B1E8
_0807B1DE:
	movs r0, #1
	b _0807B1EA
	.align 2, 0
_0807B1E4: .4byte gUnknown_03005960
_0807B1E8:
	movs r0, #0
_0807B1EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B1F0
sub_807B1F0: @ 0x0807B1F0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0807B264 @ =gUnknown_030059E0
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B260
	ldr r3, [r6, #0x3c]
	ldr r1, _0807B268 @ =gUnknown_03005960
	ldr r5, [r1]
	subs r3, r3, r5
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r3, r3, r0
	ldr r2, [r6, #0x40]
	ldr r4, [r1, #4]
	subs r2, r2, r4
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r2, r2, r0
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	subs r0, r0, r5
	ldr r1, [r7, #0xc]
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
	movs r0, #0x90
	lsls r0, r0, #2
	cmp r1, r0
	ble _0807B26C
_0807B260:
	movs r0, #0
	b _0807B26E
	.align 2, 0
_0807B264: .4byte gUnknown_030059E0
_0807B268: .4byte gUnknown_03005960
_0807B26C:
	movs r0, #1
_0807B26E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807B274
sub_807B274: @ 0x0807B274
	push {r4, lr}
	ldr r0, _0807B2A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807B1F0
	cmp r0, #0
	beq _0807B292
	adds r0, r4, #0
	bl sub_807B2D0
_0807B292:
	adds r0, r4, #0
	bl sub_807B190
	cmp r0, #0
	beq _0807B2A8
	adds r0, r4, #0
	bl sub_807B398
	b _0807B2B4
	.align 2, 0
_0807B2A4: .4byte gCurTask
_0807B2A8:
	adds r0, r4, #0
	bl sub_807B318
	adds r0, r4, #0
	bl sub_807B350
_0807B2B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B2BC
sub_807B2BC: @ 0x0807B2BC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807B2D0
sub_807B2D0: @ 0x0807B2D0
	push {r4, lr}
	ldr r2, _0807B308 @ =gUnknown_030059E0
	movs r1, #0x6d
	adds r1, r1, r2
	mov ip, r1
	movs r3, #0
	movs r1, #0xe
	mov r4, ip
	strb r1, [r4]
	adds r2, #0x6e
	strb r3, [r2]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807B30C @ =0x00000129
	bl m4aSongNumStart
	ldr r0, _0807B310 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B314 @ =sub_807B3B0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B308: .4byte gUnknown_030059E0
_0807B30C: .4byte 0x00000129
_0807B310: .4byte gCurTask
_0807B314: .4byte sub_807B3B0

	thumb_func_start sub_807B318
sub_807B318: @ 0x0807B318
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0807B348 @ =gSineTable
	adds r2, r3, #0
	adds r2, #0x48
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r3, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r3, _0807B34C @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0807B348: .4byte gSineTable
_0807B34C: .4byte 0x000003FF

	thumb_func_start sub_807B350
sub_807B350: @ 0x0807B350
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r1, [r3, #0x3c]
	ldr r2, _0807B394 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B394: .4byte gUnknown_03005960

	thumb_func_start sub_807B398
sub_807B398: @ 0x0807B398
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807B3AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807B3AC: .4byte gCurTask

	thumb_func_start sub_807B3B0
sub_807B3B0: @ 0x0807B3B0
	push {lr}
	ldr r0, _0807B3D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0807B3D8
	adds r0, r2, #0
	bl sub_807B398
	b _0807B3DE
	.align 2, 0
_0807B3D4: .4byte gCurTask
_0807B3D8:
	adds r0, r2, #0
	bl sub_807B350
_0807B3DE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B3E4
sub_807B3E4: @ 0x0807B3E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0807B40C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _0807B410 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807B418
	ldr r0, _0807B414 @ =sub_807B89C
	str r0, [r2, #8]
	b _0807B4FE
	.align 2, 0
_0807B40C: .4byte gCurTask
_0807B410: .4byte gUnknown_030059E0
_0807B414: .4byte sub_807B89C
_0807B418:
	adds r0, r5, #0
	bl sub_807B8FC
	ldr r0, [r4, #0xc]
	ldr r1, _0807B524 @ =0xFFFFFC00
	adds r0, r0, r1
	str r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #0x40]
	subs r1, #0x30
	cmp r0, r1
	bgt _0807B43A
	lsls r0, r1, #8
	str r0, [r4, #0xc]
	adds r0, r5, #0
	bl sub_807B74C
_0807B43A:
	adds r2, r4, #0
	adds r2, #0x5c
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807B44E
	ldr r0, [r4, #8]
	adds r0, #0x80
	str r0, [r4, #8]
_0807B44E:
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807B45E
	ldr r0, [r4, #8]
	subs r0, #0x80
	str r0, [r4, #8]
_0807B45E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r6, r4, #0
	adds r6, #0x38
	ldrb r2, [r6]
	ldr r7, _0807B528 @ =sub_801EB44
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B48A
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_0807B48A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	ldrb r2, [r6]
	movs r3, #8
	rsbs r3, r3, #0
	mov r8, r3
	str r7, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0807B4B4
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
_0807B4B4:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrb r2, [r6]
	ldr r7, _0807B52C @ =sub_801EC3C
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B4DA
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807B4DA:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrb r2, [r6]
	str r7, [sp]
	mov r3, r8
	bl sub_801F100
	cmp r0, #0
	bge _0807B4FE
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
_0807B4FE:
	adds r0, r5, #0
	bl sub_807B9A4
	cmp r0, #0
	bne _0807B50E
	adds r0, r5, #0
	bl sub_807B7BC
_0807B50E:
	bl sub_807BA70
	adds r0, r5, #0
	bl sub_807B930
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B524: .4byte 0xFFFFFC00
_0807B528: .4byte sub_801EB44
_0807B52C: .4byte sub_801EC3C

	thumb_func_start sub_807B530
sub_807B530: @ 0x0807B530
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0807B55C @ =gCurTask
	ldr r2, [r0]
	ldrh r6, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	ldr r4, _0807B560 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807B568
	ldr r0, _0807B564 @ =sub_807B89C
	str r0, [r2, #8]
	b _0807B730
	.align 2, 0
_0807B55C: .4byte gCurTask
_0807B560: .4byte gUnknown_030059E0
_0807B564: .4byte sub_807B89C
_0807B568:
	adds r0, r5, #0
	bl sub_807B8FC
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807B5B8
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0807B5A4 @ =IWRAM_START + 0x44
	adds r1, r6, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	adds r0, #0x10
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r0, r2
	ble _0807B5A8
	strh r2, [r1]
	b _0807B5B8
	.align 2, 0
_0807B5A4: .4byte IWRAM_START + 0x44
_0807B5A8:
	adds r0, r3, #0
	adds r0, #0x2f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3e
	bhi _0807B5B8
	movs r0, #0x20
	strh r0, [r1]
_0807B5B8:
	ldr r2, _0807B5F0 @ =gUnknown_030059E0
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r7, r2, #0
	adds r6, r5, #0
	adds r6, #0x44
	cmp r0, #0
	beq _0807B608
	ldr r0, [r7, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r7, #0x20]
	ldrh r2, [r6]
	adds r0, r2, #0
	subs r0, #0x10
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0807B5F4 @ =0xFFFFFE00
	cmp r0, r1
	bge _0807B5F8
	movs r0, #0xfe
	lsls r0, r0, #8
	b _0807B606
	.align 2, 0
_0807B5F0: .4byte gUnknown_030059E0
_0807B5F4: .4byte 0xFFFFFE00
_0807B5F8:
	adds r0, r2, #0
	adds r0, #0xf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3e
	bhi _0807B608
	ldr r0, _0807B710 @ =0x0000FFE0
_0807B606:
	strh r0, [r6]
_0807B608:
	adds r4, r7, #0
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r3, r5, #0
	adds r3, #0x46
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	ldr r1, _0807B714 @ =gSineTable
	adds r2, r5, #0
	adds r2, #0x48
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	strh r0, [r3]
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r2]
	subs r0, #4
	strb r0, [r2]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	ldr r3, _0807B718 @ =sub_801EB44
	mov sb, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B67C
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r0, #0x20
	strh r0, [r6]
_0807B67C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	movs r3, #8
	rsbs r3, r3, #0
	mov sl, r3
	mov r3, sb
	str r3, [sp]
	mov r3, sl
	bl sub_801F100
	cmp r0, #0
	bge _0807B6B0
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	subs r1, r1, r0
	str r1, [r4, #8]
	ldr r0, _0807B710 @ =0x0000FFE0
	strh r0, [r6]
_0807B6B0:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r6, _0807B71C @ =sub_801EC3C
	str r6, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B6D8
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807B6D8:
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	str r6, [sp]
	mov r3, sl
	bl sub_801F100
	cmp r0, #0
	bge _0807B6FE
	lsls r1, r0, #8
	ldr r0, [r7, #0xc]
	subs r0, r0, r1
	str r0, [r7, #0xc]
_0807B6FE:
	adds r0, r5, #0
	bl sub_807B9A4
	cmp r0, #0
	bne _0807B720
	adds r0, r5, #0
	bl sub_807B7BC
	b _0807B730
	.align 2, 0
_0807B710: .4byte 0x0000FFE0
_0807B714: .4byte gSineTable
_0807B718: .4byte sub_801EB44
_0807B71C: .4byte sub_801EC3C
_0807B720:
	adds r0, r5, #0
	bl sub_807B9F0
	cmp r0, #0
	bne _0807B730
	adds r0, r5, #0
	bl sub_807B7BC
_0807B730:
	bl sub_807BA70
	adds r0, r5, #0
	bl sub_807B930
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B74C
sub_807B74C: @ 0x0807B74C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0807B77C @ =gSineTable
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	subs r1, #2
	strh r0, [r1]
	ldr r1, _0807B780 @ =gUnknown_030059E0
	ldrh r0, [r1, #0x10]
	adds r2, #0x44
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _0807B784
	movs r0, #0x20
	strh r0, [r2]
	b _0807B7A8
	.align 2, 0
_0807B77C: .4byte gSineTable
_0807B780: .4byte gUnknown_030059E0
_0807B784:
	cmp r0, #0
	bge _0807B794
	ldr r0, _0807B790 @ =0x0000FFE0
	strh r0, [r2]
	b _0807B7A8
	.align 2, 0
_0807B790: .4byte 0x0000FFE0
_0807B794:
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	movs r1, #0x20
	cmp r0, #0
	beq _0807B7A6
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r1, r0, #0
_0807B7A6:
	strh r1, [r2]
_0807B7A8:
	ldr r0, _0807B7B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B7B8 @ =sub_807B530
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807B7B4: .4byte gCurTask
_0807B7B8: .4byte sub_807B530

	thumb_func_start sub_807B7BC
sub_807B7BC: @ 0x0807B7BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0807B818 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _0807B81C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r5, #0
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x48
	ldrb r1, [r3]
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x7e
	bls _0807B7FC
	adds r1, #0x40
	movs r0, #0x80
	subs r0, r0, r1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #0xa
	rsbs r0, r0, #0
	asrs r0, r0, #7
	strh r0, [r2, #0x12]
	cmp r0, #0
	ble _0807B7FE
_0807B7FC:
	strh r5, [r2, #0x12]
_0807B7FE:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r2, #0x10]
	ldr r0, _0807B820 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B824 @ =sub_807B89C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B818: .4byte gUnknown_030059E0
_0807B81C: .4byte 0xFFBFFFFF
_0807B820: .4byte gCurTask
_0807B824: .4byte sub_807B89C

	thumb_func_start sub_807B828
sub_807B828: @ 0x0807B828
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807B88C @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B894
	ldr r2, [r4, #0x3c]
	ldr r1, _0807B890 @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x40]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x4a
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807B894
	adds r0, #0x94
	cmp r0, r1
	blt _0807B894
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x40
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807B894
	adds r0, r3, #0
	adds r0, #0x40
	cmp r0, r2
	blt _0807B894
	movs r0, #1
	b _0807B896
	.align 2, 0
_0807B88C: .4byte gUnknown_030059E0
_0807B890: .4byte gUnknown_03005960
_0807B894:
	movs r0, #0
_0807B896:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807B89C
sub_807B89C: @ 0x0807B89C
	push {r4, lr}
	ldr r0, _0807B8CC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807B828
	cmp r0, #0
	beq _0807B8BA
	adds r0, r4, #0
	bl sub_807B8E0
_0807B8BA:
	adds r0, r4, #0
	bl sub_807B95C
	cmp r0, #0
	beq _0807B8D0
	adds r0, r4, #0
	bl sub_807BA3C
	b _0807B8DA
	.align 2, 0
_0807B8CC: .4byte gCurTask
_0807B8D0:
	bl sub_807BA70
	adds r0, r4, #0
	bl sub_807B930
_0807B8DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B8E0
sub_807B8E0: @ 0x0807B8E0
	push {lr}
	bl sub_807B8FC
	ldr r0, _0807B8F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B8F8 @ =sub_807B3E4
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807B8F4: .4byte gCurTask
_0807B8F8: .4byte sub_807B3E4

	thumb_func_start sub_807B8FC
sub_807B8FC: @ 0x0807B8FC
	push {r4, lr}
	ldr r4, _0807B92C @ =gUnknown_030059E0
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r4, #0x64
	movs r0, #0x2c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B92C: .4byte gUnknown_030059E0

	thumb_func_start sub_807B930
sub_807B930: @ 0x0807B930
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807BA54
	adds r0, #0x30
	ldr r1, [r4, #0x3c]
	ldr r3, _0807B958 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x16]
	ldr r1, [r4, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x18]
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B958: .4byte gUnknown_03005960

	thumb_func_start sub_807B95C
sub_807B95C: @ 0x0807B95C
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B998 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
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
	bhi _0807B994
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B994
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B99C
_0807B994:
	movs r0, #1
	b _0807B99E
	.align 2, 0
_0807B998: .4byte gUnknown_03005960
_0807B99C:
	movs r0, #0
_0807B99E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B9A4
sub_807B9A4: @ 0x0807B9A4
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807B9E0 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B9E8
	ldr r1, [r2, #0x3c]
	ldr r0, _0807B9E4 @ =gUnknown_03005960
	ldr r2, [r0]
	subs r1, r1, r2
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	adds r1, r3, #0
	subs r1, #0x4a
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807B9E8
	adds r0, r3, #0
	adds r0, #0x4a
	cmp r0, r2
	blt _0807B9E8
	movs r0, #1
	b _0807B9EA
	.align 2, 0
_0807B9E0: .4byte gUnknown_030059E0
_0807B9E4: .4byte gUnknown_03005960
_0807B9E8:
	movs r0, #0
_0807B9EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B9F0
sub_807B9F0: @ 0x0807B9F0
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807BA2C @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807BA34
	ldr r1, [r2, #0x40]
	ldr r0, _0807BA30 @ =gUnknown_03005960
	ldr r2, [r0, #4]
	subs r1, r1, r2
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	adds r1, r3, #0
	subs r1, #0x60
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807BA34
	adds r0, r3, #0
	adds r0, #0x40
	cmp r0, r2
	blt _0807BA34
	movs r0, #1
	b _0807BA36
	.align 2, 0
_0807BA2C: .4byte gUnknown_030059E0
_0807BA30: .4byte gUnknown_03005960
_0807BA34:
	movs r0, #0
_0807BA36:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807BA3C
sub_807BA3C: @ 0x0807BA3C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807BA50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807BA50: .4byte gCurTask

	thumb_func_start sub_807BA54
sub_807BA54: @ 0x0807BA54
	ldr r0, _0807BA6C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807BA6C: .4byte gCurTask

	thumb_func_start sub_807BA70
sub_807BA70: @ 0x0807BA70
	ldr r0, _0807BA90 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r1, [r0, #6]
	ldr r0, _0807BA94 @ =IWRAM_START + 0x62
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807BA90: .4byte gCurTask
_0807BA94: .4byte IWRAM_START + 0x62

	thumb_func_start sub_807BA98
sub_807BA98: @ 0x0807BA98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
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
	ldr r0, _0807BB08 @ =sub_807B89C
	ldr r2, _0807BB0C @ =0x00002010
	ldr r1, _0807BB10 @ =sub_807BB14
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	strh r4, [r2, #4]
	strh r5, [r2, #6]
	mov r0, r8
	str r0, [r2]
	ldrb r0, [r0]
	strb r0, [r2, #8]
	strb r6, [r2, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB08: .4byte sub_807B89C
_0807BB0C: .4byte 0x00002010
_0807BB10: .4byte sub_807BB14

	thumb_func_start sub_807BB14
sub_807BB14: @ 0x0807BB14
	bx lr
	.align 2, 0

	thumb_func_start sub_807BB18
sub_807BB18: @ 0x0807BB18
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807BBF4 @ =sub_807C068
	ldr r2, _0807BBF8 @ =0x00002010
	ldr r1, _0807BBFC @ =sub_807C178
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	mov r3, sb
	ldrb r1, [r3, #3]
	ldr r3, _0807BC00 @ =IWRAM_START + 0x3C
	adds r0, r5, r3
	movs r3, #0
	strb r1, [r0]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x44]
	movs r0, #0
	mov sl, r0
	strh r4, [r2, #4]
	strh r6, [r2, #6]
	mov r1, sb
	str r1, [r2]
	ldrb r0, [r1]
	strb r0, [r2, #8]
	mov r0, r8
	strb r0, [r2, #9]
	ldr r1, _0807BC04 @ =IWRAM_START + 0xC
	adds r4, r5, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]
	ldr r3, _0807BC08 @ =IWRAM_START + 0x2D
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807BC0C @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807BC10 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r3, sl
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x20
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807BC14 @ =0x00000249
	strh r0, [r4, #0xa]
	ldr r0, _0807BC18 @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	movs r0, #2
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sb
	strb r0, [r3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF4: .4byte sub_807C068
_0807BBF8: .4byte 0x00002010
_0807BBFC: .4byte sub_807C178
_0807BC00: .4byte IWRAM_START + 0x3C
_0807BC04: .4byte IWRAM_START + 0xC
_0807BC08: .4byte IWRAM_START + 0x2D
_0807BC0C: .4byte IWRAM_START + 0x2E
_0807BC10: .4byte IWRAM_START + 0x31
_0807BC14: .4byte 0x00000249
_0807BC18: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807BC1C
sub_807BC1C: @ 0x0807BC1C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	bl sub_8029FF0
	ldr r2, _0807BC58 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x64
	movs r0, #4
	strh r0, [r2]
	movs r0, #0x6d
	bl m4aSongNumStart
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BCA0
	lsls r0, r0, #2
	ldr r1, _0807BC5C @ =_0807BC60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BC58: .4byte gUnknown_030059E0
_0807BC5C: .4byte _0807BC60
_0807BC60: @ jump table
	.4byte _0807BC80 @ case 0
	.4byte _0807BC80 @ case 1
	.4byte _0807BC88 @ case 2
	.4byte _0807BC88 @ case 3
	.4byte _0807BC90 @ case 4
	.4byte _0807BC90 @ case 5
	.4byte _0807BC98 @ case 6
	.4byte _0807BC98 @ case 7
_0807BC80:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0xa0
	b _0807BC9E
_0807BC88:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0xe0
	b _0807BC9E
_0807BC90:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0x60
	b _0807BC9E
_0807BC98:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0x20
_0807BC9E:
	strb r0, [r1]
_0807BCA0:
	movs r0, #0x3e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r3, _0807BD08 @ =gUnknown_030059E0
	ldr r2, _0807BD0C @ =gSineTable
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r4, #0x40]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r3, #8]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r4, #0x44]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r3, #0xc]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BD50
	lsls r0, r0, #2
	ldr r1, _0807BD10 @ =_0807BD14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BD08: .4byte gUnknown_030059E0
_0807BD0C: .4byte gSineTable
_0807BD10: .4byte _0807BD14
_0807BD14: @ jump table
	.4byte _0807BD34 @ case 0
	.4byte _0807BD44 @ case 1
	.4byte _0807BD34 @ case 2
	.4byte _0807BD44 @ case 3
	.4byte _0807BD34 @ case 4
	.4byte _0807BD44 @ case 5
	.4byte _0807BD34 @ case 6
	.4byte _0807BD44 @ case 7
_0807BD34:
	movs r0, #0
	ldr r1, _0807BD40 @ =0x00000249
	strh r1, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	b _0807BD4E
	.align 2, 0
_0807BD40: .4byte 0x00000249
_0807BD44:
	ldr r0, _0807BD70 @ =0x00000249
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
_0807BD4E:
	strb r0, [r1]
_0807BD50:
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	ldr r0, _0807BD74 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807BD78 @ =sub_807C0B4
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD70: .4byte 0x00000249
_0807BD74: .4byte gCurTask
_0807BD78: .4byte sub_807C0B4

	thumb_func_start sub_807BD7C
sub_807BD7C: @ 0x0807BD7C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r1, _0807BDB4 @ =gUnknown_030059E0
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0807BE4E
	ldr r0, _0807BDB8 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r1, #0x20]
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BE4E
	lsls r0, r0, #2
	ldr r1, _0807BDBC @ =_0807BDC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BDB4: .4byte gUnknown_030059E0
_0807BDB8: .4byte 0xFFBFFFFF
_0807BDBC: .4byte _0807BDC0
_0807BDC0: @ jump table
	.4byte _0807BDF8 @ case 0
	.4byte _0807BDE0 @ case 1
	.4byte _0807BE38 @ case 2
	.4byte _0807BDF8 @ case 3
	.4byte _0807BE0C @ case 4
	.4byte _0807BE24 @ case 5
	.4byte _0807BE24 @ case 6
	.4byte _0807BE38 @ case 7
_0807BDE0:
	ldr r2, _0807BDF4 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0xf8
	lsls r0, r0, #8
	b _0807BE4A
	.align 2, 0
_0807BDF4: .4byte gUnknown_030059E0
_0807BDF8:
	ldr r0, _0807BE08 @ =gUnknown_030059E0
	movs r1, #0
	strh r1, [r0, #0x10]
	movs r1, #0xf8
	lsls r1, r1, #8
	strh r1, [r0, #0x12]
	b _0807BE4E
	.align 2, 0
_0807BE08: .4byte gUnknown_030059E0
_0807BE0C:
	ldr r2, _0807BE20 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0xf8
	lsls r0, r0, #8
	b _0807BE4A
	.align 2, 0
_0807BE20: .4byte gUnknown_030059E0
_0807BE24:
	ldr r0, _0807BE34 @ =gUnknown_030059E0
	movs r1, #0
	strh r1, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #0x12]
	b _0807BE4E
	.align 2, 0
_0807BE34: .4byte gUnknown_030059E0
_0807BE38:
	ldr r2, _0807BE64 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #4
_0807BE4A:
	strh r0, [r2, #0x10]
	strh r1, [r2, #0x12]
_0807BE4E:
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0807BE68 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807BE6C @ =sub_807C110
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE64: .4byte gUnknown_030059E0
_0807BE68: .4byte gCurTask
_0807BE6C: .4byte sub_807C110

	thumb_func_start sub_807BE70
sub_807BE70: @ 0x0807BE70
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BEC0
	lsls r0, r0, #2
	ldr r1, _0807BE88 @ =_0807BE8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BE88: .4byte _0807BE8C
_0807BE8C: @ jump table
	.4byte _0807BEAC @ case 0
	.4byte _0807BEB6 @ case 1
	.4byte _0807BEAC @ case 2
	.4byte _0807BEB6 @ case 3
	.4byte _0807BEAC @ case 4
	.4byte _0807BEB6 @ case 5
	.4byte _0807BEAC @ case 6
	.4byte _0807BEB6 @ case 7
_0807BEAC:
	adds r1, r3, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	adds r0, #8
	b _0807BEBE
_0807BEB6:
	adds r1, r3, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	subs r0, #8
_0807BEBE:
	strb r0, [r1]
_0807BEC0:
	ldr r4, _0807BF2C @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	movs r1, #0x3f
	adds r1, r1, r3
	mov ip, r1
	cmp r0, #0
	bne _0807BF10
	ldr r2, _0807BF30 @ =gSineTable
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r3, #0x40]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r4, #8]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r3, #0x44]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807BF10:
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x3e
	mov r3, ip
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807BF22
	movs r2, #1
_0807BF22:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807BF2C: .4byte gUnknown_030059E0
_0807BF30: .4byte gSineTable

	thumb_func_start sub_807BF34
sub_807BF34: @ 0x0807BF34
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0807BFC4 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807BF46
	b _0807C05E
_0807BF46:
	ldr r2, [r5, #0x40]
	ldr r0, _0807BFC8 @ =gUnknown_03005960
	ldr r1, [r0]
	subs r2, r2, r1
	ldr r3, [r5, #0x44]
	ldr r4, [r0, #4]
	subs r3, r3, r4
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	subs r1, r1, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	subs r2, r2, r7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	subs r0, r3, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r2, #0
	muls r1, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _0807C05E
	cmp r7, ip
	bgt _0807BFFE
	cmp r4, r3
	bgt _0807BFD0
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807BFB2
	rsbs r1, r1, #0
_0807BFB2:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807BFBC
	rsbs r0, r0, #0
_0807BFBC:
	cmp r1, r0
	bgt _0807BFCC
	movs r0, #2
	b _0807C060
	.align 2, 0
_0807BFC4: .4byte gUnknown_030059E0
_0807BFC8: .4byte gUnknown_03005960
_0807BFCC:
	movs r0, #1
	b _0807C060
_0807BFD0:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807BFE8
	rsbs r1, r1, #0
_0807BFE8:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807BFF2
	rsbs r0, r0, #0
_0807BFF2:
	cmp r1, r0
	bgt _0807BFFA
	movs r0, #5
	b _0807C060
_0807BFFA:
	movs r0, #6
	b _0807C060
_0807BFFE:
	cmp r4, r3
	bgt _0807C030
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807C01A
	rsbs r1, r1, #0
_0807C01A:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807C024
	rsbs r0, r0, #0
_0807C024:
	cmp r1, r0
	bgt _0807C02C
	movs r0, #3
	b _0807C060
_0807C02C:
	movs r0, #4
	b _0807C060
_0807C030:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807C048
	rsbs r1, r1, #0
_0807C048:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807C052
	rsbs r0, r0, #0
_0807C052:
	cmp r1, r0
	bgt _0807C05A
	movs r0, #8
	b _0807C060
_0807C05A:
	movs r0, #7
	b _0807C060
_0807C05E:
	movs r0, #0
_0807C060:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C068
sub_807C068: @ 0x0807C068
	push {r4, r5, lr}
	ldr r0, _0807C0A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_807BF34
	ldr r1, _0807C0A4 @ =IWRAM_START + 0x3D
	adds r4, r4, r1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C08E
	adds r0, r5, #0
	bl sub_807BC1C
_0807C08E:
	adds r0, r5, #0
	bl sub_807C20C
	cmp r0, #0
	beq _0807C0A8
	adds r0, r5, #0
	bl sub_807C25C
	b _0807C0AE
	.align 2, 0
_0807C0A0: .4byte gCurTask
_0807C0A4: .4byte IWRAM_START + 0x3D
_0807C0A8:
	adds r0, r5, #0
	bl sub_807C1C0
_0807C0AE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807C0B4
sub_807C0B4: @ 0x0807C0B4
	push {r4, r5, r6, lr}
	ldr r0, _0807C100 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	adds r0, #0xc
	adds r4, r5, r0
	adds r0, r6, #0
	bl sub_807BE70
	cmp r0, #0
	beq _0807C0D6
	adds r0, r6, #0
	bl sub_807BD7C
_0807C0D6:
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0807C0F4
	ldr r0, _0807C104 @ =0xFFFFBFFF
	ands r1, r0
	str r1, [r4, #0x10]
	ldr r0, _0807C108 @ =0x0000FFFF
	strh r0, [r4, #0x1e]
	ldr r0, _0807C10C @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
_0807C0F4:
	adds r0, r6, #0
	bl sub_807C1C0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C100: .4byte gCurTask
_0807C104: .4byte 0xFFFFBFFF
_0807C108: .4byte 0x0000FFFF
_0807C10C: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_807C110
sub_807C110: @ 0x0807C110
	push {r4, lr}
	ldr r0, _0807C164 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0xc
	adds r2, r3, r0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0807C156
	ldr r0, _0807C168 @ =0xFFFFBFFF
	ands r1, r0
	str r1, [r2, #0x10]
	ldr r0, _0807C16C @ =0x0000FFFF
	strh r0, [r2, #0x1e]
	ldr r0, _0807C170 @ =IWRAM_START + 0x2D
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807C174 @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	ldrb r0, [r1]
	subs r0, #8
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C156
	adds r0, r4, #0
	bl sub_807C18C
_0807C156:
	adds r0, r4, #0
	bl sub_807C1C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C164: .4byte gCurTask
_0807C168: .4byte 0xFFFFBFFF
_0807C16C: .4byte 0x0000FFFF
_0807C170: .4byte IWRAM_START + 0x2D
_0807C174: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_807C178
sub_807C178: @ 0x0807C178
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807C18C
sub_807C18C: @ 0x0807C18C
	push {lr}
	adds r3, r0, #0
	adds r0, #0xc
	ldr r1, _0807C1B4 @ =0x00000249
	strh r1, [r0, #0xa]
	adds r2, r3, #0
	adds r2, #0x2c
	movs r1, #2
	strb r1, [r2]
	adds r2, #2
	movs r1, #0x10
	strb r1, [r2]
	bl sub_8004558
	ldr r0, _0807C1B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C1BC @ =sub_807C068
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C1B4: .4byte 0x00000249
_0807C1B8: .4byte gCurTask
_0807C1BC: .4byte sub_807C068

	thumb_func_start sub_807C1C0
sub_807C1C0: @ 0x0807C1C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r5, #0x40]
	ldr r2, _0807C204 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x44]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	ldr r1, _0807C208 @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte gUnknown_03005960
_0807C208: .4byte 0xFFFFF3FF

	thumb_func_start sub_807C20C
sub_807C20C: @ 0x0807C20C
	push {lr}
	ldr r1, [r0, #0x40]
	ldr r3, _0807C250 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x44]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x8c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _0807C24A
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C24A
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C254
_0807C24A:
	movs r0, #1
	b _0807C256
	.align 2, 0
_0807C250: .4byte gUnknown_03005960
_0807C254:
	movs r0, #0
_0807C256:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C25C
sub_807C25C: @ 0x0807C25C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C270 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C270: .4byte gCurTask

	thumb_func_start sub_807C274
sub_807C274: @ 0x0807C274
	push {r4, lr}
	ldr r0, _0807C2C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0807C2C8 @ =gSineTable
	adds r0, #0x49
	adds r2, r1, r0
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	ldr r3, _0807C2CC @ =IWRAM_START + 0x46
	adds r1, r1, r3
	strh r0, [r1]
	ldrb r0, [r2]
	adds r0, #2
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_807C424
	cmp r0, #0
	beq _0807C2B2
	adds r0, r4, #0
	bl sub_807C4A0
_0807C2B2:
	adds r0, r4, #0
	bl sub_807C598
	cmp r0, #0
	beq _0807C2D0
	adds r0, r4, #0
	bl sub_807C5E0
	b _0807C2DA
	.align 2, 0
_0807C2C4: .4byte gCurTask
_0807C2C8: .4byte gSineTable
_0807C2CC: .4byte IWRAM_START + 0x46
_0807C2D0:
	bl sub_807C614
	adds r0, r4, #0
	bl sub_807C558
_0807C2DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807C2E0
sub_807C2E0: @ 0x0807C2E0
	push {r4, r5, lr}
	ldr r0, _0807C328 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0807C32C @ =gSineTable
	adds r0, #0x49
	adds r4, r1, r0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	ldr r2, _0807C330 @ =IWRAM_START + 0x46
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_807C52C
	ldrb r1, [r4]
	movs r0, #0x40
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807C334
	cmp r0, #6
	ble _0807C336
	movs r1, #6
	b _0807C336
	.align 2, 0
_0807C328: .4byte gCurTask
_0807C32C: .4byte gSineTable
_0807C330: .4byte IWRAM_START + 0x46
_0807C334:
	movs r1, #4
_0807C336:
	adds r2, r5, #0
	adds r2, #0x49
	ldrb r0, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _0807C34E
	adds r0, r5, #0
	bl sub_807C4EC
_0807C34E:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C360
sub_807C360: @ 0x0807C360
	push {r4, lr}
	ldr r0, _0807C388 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x49
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bne _0807C38C
	adds r0, r4, #0
	bl sub_807C504
	b _0807C3C4
	.align 2, 0
_0807C388: .4byte gCurTask
_0807C38C:
	cmp r0, #0x80
	bls _0807C3AC
	ldr r1, _0807C3A8 @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	b _0807C3BE
	.align 2, 0
_0807C3A8: .4byte gSineTable
_0807C3AC:
	ldr r1, _0807C3D4 @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
_0807C3BE:
	ldr r2, _0807C3D8 @ =IWRAM_START + 0x46
	adds r0, r3, r2
	strh r1, [r0]
_0807C3C4:
	bl sub_807C614
	adds r0, r4, #0
	bl sub_807C558
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C3D4: .4byte gSineTable
_0807C3D8: .4byte IWRAM_START + 0x46

	thumb_func_start sub_807C3DC
sub_807C3DC: @ 0x0807C3DC
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807C40C @ =gUnknown_030059E0
	adds r0, #0x5e
	ldr r1, _0807C410 @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807C41E
	adds r2, r3, #0
	adds r2, #0x48
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807C41E
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807C414
	movs r0, #1
	b _0807C41A
	.align 2, 0
_0807C40C: .4byte gUnknown_030059E0
_0807C410: .4byte gUnknown_03005B38
_0807C414:
	movs r0, #0xfe
	ands r0, r1
	movs r1, #2
_0807C41A:
	orrs r0, r1
	strb r0, [r2]
_0807C41E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C424
sub_807C424: @ 0x0807C424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807C490 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807C498
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0807C498
	ldr r2, [r4, #0x3c]
	ldr r1, _0807C494 @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x40]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807C498
	adds r0, #0x28
	cmp r0, r1
	blt _0807C498
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0xc
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807C498
	adds r0, r3, #0
	adds r0, #0xc
	cmp r0, r2
	blt _0807C498
	movs r0, #1
	b _0807C49A
	.align 2, 0
_0807C490: .4byte gUnknown_030059E0
_0807C494: .4byte gUnknown_03005960
_0807C498:
	movs r0, #0
_0807C49A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807C4A0
sub_807C4A0: @ 0x0807C4A0
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807C4DC @ =gUnknown_030059E0
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r0, _0807C4E0 @ =0x0000FA80
	strh r0, [r3, #0x12]
	adds r0, r2, #0
	adds r0, #0x49
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	movs r0, #0x8e
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807C4E4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C4E8 @ =sub_807C2E0
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C4DC: .4byte gUnknown_030059E0
_0807C4E0: .4byte 0x0000FA80
_0807C4E4: .4byte gCurTask
_0807C4E8: .4byte sub_807C2E0

	thumb_func_start sub_807C4EC
sub_807C4EC: @ 0x0807C4EC
	adds r0, #0x49
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807C4FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C500 @ =sub_807C6E4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C4FC: .4byte gCurTask
_0807C500: .4byte sub_807C6E4

	thumb_func_start sub_807C504
sub_807C504: @ 0x0807C504
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x49
	strb r2, [r0]
	ldr r0, _0807C524 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C528 @ =sub_807C274
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C524: .4byte gCurTask
_0807C528: .4byte sub_807C274

	thumb_func_start sub_807C52C
sub_807C52C: @ 0x0807C52C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807C550 @ =gUnknown_030059E0
	adds r0, #0x5e
	ldr r1, _0807C554 @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807C54C
	adds r2, r3, #0
	adds r2, #0x48
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
_0807C54C:
	pop {r0}
	bx r0
	.align 2, 0
_0807C550: .4byte gUnknown_030059E0
_0807C554: .4byte gUnknown_03005B38

	thumb_func_start sub_807C558
sub_807C558: @ 0x0807C558
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807C5F8
	ldr r2, [r4, #0x3c]
	ldr r3, _0807C594 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r2, r2, r1
	strh r2, [r0, #0x16]
	ldr r2, [r4, #0x40]
	ldr r1, [r3, #4]
	subs r2, r2, r1
	adds r4, #0x46
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r2, r2, r1
	strh r2, [r0, #0x18]
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C594: .4byte gUnknown_03005960

	thumb_func_start sub_807C598
sub_807C598: @ 0x0807C598
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807C5D4 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
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
	bhi _0807C5D0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C5D0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C5D8
_0807C5D0:
	movs r0, #1
	b _0807C5DA
	.align 2, 0
_0807C5D4: .4byte gUnknown_03005960
_0807C5D8:
	movs r0, #0
_0807C5DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C5E0
sub_807C5E0: @ 0x0807C5E0
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C5F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C5F4: .4byte gCurTask

	thumb_func_start sub_807C5F8
sub_807C5F8: @ 0x0807C5F8
	ldr r0, _0807C610 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807C610: .4byte gCurTask

	thumb_func_start sub_807C614
sub_807C614: @ 0x0807C614
	ldr r0, _0807C634 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r1, [r0, #6]
	ldr r0, _0807C638 @ =IWRAM_START + 0x60
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807C634: .4byte gCurTask
_0807C638: .4byte IWRAM_START + 0x60

	thumb_func_start sub_807C63C
sub_807C63C: @ 0x0807C63C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
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
	ldr r0, _0807C6CC @ =sub_807C274
	ldr r2, _0807C6D0 @ =0x00002010
	ldr r1, _0807C6D4 @ =sub_807C728
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r7, sb
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	ldr r1, _0807C6D8 @ =IWRAM_START + 0x44
	adds r0, r3, r1
	movs r6, #0
	movs r1, #0
	strh r1, [r0]
	ldr r7, _0807C6DC @ =IWRAM_START + 0x46
	adds r0, r3, r7
	strh r1, [r0]
	ldr r0, _0807C6E0 @ =IWRAM_START + 0x49
	adds r3, r3, r0
	strb r6, [r3]
	strh r4, [r2, #4]
	strh r5, [r2, #6]
	mov r1, sb
	str r1, [r2]
	ldrb r0, [r1]
	strb r0, [r2, #8]
	mov r7, r8
	strb r7, [r2, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r7, sb
	strb r0, [r7]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C6CC: .4byte sub_807C274
_0807C6D0: .4byte 0x00002010
_0807C6D4: .4byte sub_807C728
_0807C6D8: .4byte IWRAM_START + 0x44
_0807C6DC: .4byte IWRAM_START + 0x46
_0807C6E0: .4byte IWRAM_START + 0x49

	thumb_func_start sub_807C6E4
sub_807C6E4: @ 0x0807C6E4
	push {r4, r5, lr}
	ldr r0, _0807C720 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_807C3DC
	ldr r0, _0807C724 @ =IWRAM_START + 0x49
	adds r4, r4, r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C70E
	adds r0, r5, #0
	bl sub_807C72C
_0807C70E:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C720: .4byte gCurTask
_0807C724: .4byte IWRAM_START + 0x49

	thumb_func_start sub_807C728
sub_807C728: @ 0x0807C728
	bx lr
	.align 2, 0

	thumb_func_start sub_807C72C
sub_807C72C: @ 0x0807C72C
	adds r0, #0x49
	movs r1, #0x40
	strb r1, [r0]
	ldr r0, _0807C73C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C740 @ =sub_807C744
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C73C: .4byte gCurTask
_0807C740: .4byte sub_807C744

	thumb_func_start sub_807C744
sub_807C744: @ 0x0807C744
	push {r4, r5, lr}
	ldr r0, _0807C794 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0807C798 @ =gSineTable
	adds r0, #0x49
	adds r4, r1, r0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	ldr r2, _0807C79C @ =IWRAM_START + 0x46
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_807C3DC
	ldrb r0, [r4]
	adds r0, #8
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0807C784
	adds r0, r5, #0
	bl sub_807C7A0
_0807C784:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C794: .4byte gCurTask
_0807C798: .4byte gSineTable
_0807C79C: .4byte IWRAM_START + 0x46

	thumb_func_start sub_807C7A0
sub_807C7A0: @ 0x0807C7A0
	adds r0, #0x49
	movs r1, #0x80
	strb r1, [r0]
	ldr r0, _0807C7B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C7B4 @ =sub_807C360
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C7B0: .4byte gCurTask
_0807C7B4: .4byte sub_807C360

	thumb_func_start sub_807C7B8
sub_807C7B8: @ 0x0807C7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x30]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0807C980 @ =sub_807D06C
	movs r1, #0x96
	lsls r1, r1, #2
	ldr r2, _0807C984 @ =0x00002010
	ldr r3, _0807C988 @ =sub_807D118
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r0, [sp, #4]
	ldr r1, _0807C98C @ =IWRAM_START + 0x228
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r1]
	ldr r3, _0807C990 @ =IWRAM_START + 0x22C
	adds r3, r3, r2
	mov sl, r3
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3]
	ldr r4, _0807C994 @ =IWRAM_START + 0x230
	adds r0, r2, r4
	strh r6, [r0]
	movs r0, #3
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r1, _0807C998 @ =IWRAM_START + 0x234
	adds r1, r1, r2
	mov r8, r1
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r3, _0807C99C @ =IWRAM_START + 0x236
	adds r6, r2, r3
	strh r0, [r6]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r4, [r1]
	adds r0, r0, r4
	ldr r1, _0807C9A0 @ =IWRAM_START + 0x238
	adds r5, r2, r1
	strh r0, [r5]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	ldrh r3, [r6]
	adds r0, r0, r3
	ldr r4, _0807C9A4 @ =IWRAM_START + 0x23A
	adds r3, r2, r4
	strh r0, [r3]
	ldr r0, _0807C9A8 @ =IWRAM_START + 0x23C
	adds r0, r2, r0
	str r0, [sp, #8]
	movs r4, #0
	ldrsh r1, [r5, r4]
	str r1, [sp, #0xc]
	mov r1, r8
	movs r4, #0
	ldrsh r0, [r1, r4]
	ldr r4, [sp, #0xc]
	adds r1, r4, r0
	asrs r1, r1, #1
	mov r4, ip
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r1, [sp, #8]
	str r0, [r1]
	ldr r4, _0807C9AC @ =IWRAM_START + 0x240
	adds r4, r4, r2
	mov ip, r4
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov r4, sl
	ldr r0, [r4]
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1]
	ldrh r0, [r3]
	ldrh r1, [r6]
	subs r0, r0, r1
	ldr r3, _0807C9B0 @ =IWRAM_START + 0x244
	adds r1, r2, r3
	strh r0, [r1]
	ldrh r0, [r5]
	mov r4, r8
	ldrh r1, [r4]
	subs r0, r0, r1
	adds r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	ldrh r0, [r1]
	lsrs r0, r0, #2
	ldr r4, _0807C9B4 @ =IWRAM_START + 0x248
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _0807C9B8 @ =IWRAM_START + 0x24C
	adds r0, r2, r1
	str r7, [r0]
	ldrb r1, [r7]
	adds r3, #0xa
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, #9
	adds r2, r2, r4
	mov r0, sb
	strb r0, [r2]
	movs r4, #0
	movs r1, #0
_0807C8CA:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r2, [sp, #4]
	adds r0, r2, r0
	str r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0807C8CA
	movs r0, #4
	bl VramMalloc
	ldr r3, [sp, #4]
	movs r4, #0x95
	lsls r4, r4, #2
	adds r1, r3, r4
	str r0, [r1]
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	mov sl, r0
	movs r6, #0
	ldr r1, _0807C9BC @ =gUnknown_080E0124
	mov r8, r1
	movs r2, #4
	add r2, r8
	mov sb, r2
_0807C904:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r0, r2, #4
	movs r3, #0xcc
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #4]
	adds r3, r1, r0
	strh r6, [r3, #8]
	strh r6, [r3, #0x14]
	strh r6, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	str r5, [r3, #4]
	lsls r2, r2, #1
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	mov r0, r8
	adds r0, #2
	adds r0, r2, r0
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	add r2, sb
	ldrh r0, [r2]
	lsls r0, r0, #5
	adds r5, r5, r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0807C904
	ldr r0, [sp, #4]
	bl sub_807D1BC
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C980: .4byte sub_807D06C
_0807C984: .4byte 0x00002010
_0807C988: .4byte sub_807D118
_0807C98C: .4byte IWRAM_START + 0x228
_0807C990: .4byte IWRAM_START + 0x22C
_0807C994: .4byte IWRAM_START + 0x230
_0807C998: .4byte IWRAM_START + 0x234
_0807C99C: .4byte IWRAM_START + 0x236
_0807C9A0: .4byte IWRAM_START + 0x238
_0807C9A4: .4byte IWRAM_START + 0x23A
_0807C9A8: .4byte IWRAM_START + 0x23C
_0807C9AC: .4byte IWRAM_START + 0x240
_0807C9B0: .4byte IWRAM_START + 0x244
_0807C9B4: .4byte IWRAM_START + 0x248
_0807C9B8: .4byte IWRAM_START + 0x24C
_0807C9BC: .4byte gUnknown_080E0124

	thumb_func_start sub_807C9C0
sub_807C9C0: @ 0x0807C9C0
	push {r4, lr}
	mov ip, r0
	ldr r2, _0807CA58 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x2c
	strh r0, [r1]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r1, [r2, #8]
	adds r4, r2, #0
	movs r1, #0xc1
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0x40
	strb r0, [r1]
	movs r1, #0xc2
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	movs r0, #0x80
	strh r0, [r1]
	ldrh r0, [r4, #0x12]
	movs r1, #0xc3
	lsls r1, r1, #1
	add r1, ip
	strh r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	add r0, ip
	strh r3, [r0]
	movs r2, #0xc4
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r2]
	movs r2, #0xc6
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r2]
	movs r0, #0xc8
	lsls r0, r0, #1
	add r0, ip
	str r3, [r0]
	movs r0, #0xca
	lsls r0, r0, #1
	add r0, ip
	str r3, [r0]
	ldr r0, _0807CA5C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807CA60 @ =sub_807D0C4
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA58: .4byte gUnknown_030059E0
_0807CA5C: .4byte gCurTask
_0807CA60: .4byte sub_807D0C4

	thumb_func_start sub_807CA64
sub_807CA64: @ 0x0807CA64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	subs r0, #0x10
	lsls r5, r0, #8
	movs r2, #0xc3
	lsls r2, r2, #1
	adds r1, r4, r2
	ldrh r0, [r1]
	movs r7, #0
	ldrsh r3, [r1, r7]
	cmp r3, #0
	bgt _0807CAA4
	movs r6, #1
	subs r0, #0x40
	strh r0, [r1]
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0807CAA0 @ =0xFFFFFD00
	cmp r0, r2
	bge _0807CA9A
	adds r3, r2, #0
_0807CA9A:
	strh r3, [r1]
	b _0807CAC8
	.align 2, 0
_0807CAA0: .4byte 0xFFFFFD00
_0807CAA4:
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	cmp r3, r0
	ble _0807CAB0
	adds r2, r0, #0
_0807CAB0:
	strh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	rsbs r0, r0, #0
	asrs r0, r0, #4
	movs r3, #0x40
	rsbs r3, r3, #0
	cmp r0, r3
	ble _0807CAC4
	adds r0, r3, #0
_0807CAC4:
	adds r0, r2, r0
	strh r0, [r1]
_0807CAC8:
	ldr r2, _0807CB20 @ =gUnknown_030059E0
	movs r7, #0xc3
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2, #0xc]
	adds r1, r0, r1
	str r1, [r2, #0xc]
	adds r0, r5, #0
	cmp r0, r1
	ble _0807CAE2
	adds r0, r1, #0
_0807CAE2:
	str r0, [r2, #0xc]
	movs r7, #0xc2
	lsls r7, r7, #1
	adds r3, r4, r7
	ldrh r0, [r3]
	adds r0, #0x40
	movs r5, #0
	strh r0, [r3]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0807CB02
	adds r2, r1, #0
_0807CB02:
	strh r2, [r3]
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r1, [r2]
	cmp r1, #0
	ble _0807CB24
	movs r7, #0
	ldrsh r0, [r3, r7]
	subs r0, r1, r0
	str r0, [r2]
	cmp r0, #0
	bge _0807CB44
	str r5, [r2]
	b _0807CB44
	.align 2, 0
_0807CB20: .4byte gUnknown_030059E0
_0807CB24:
	cmp r1, #0
	bge _0807CB38
	movs r7, #0
	ldrsh r0, [r3, r7]
	adds r0, r1, r0
	str r0, [r2]
	cmp r0, #0
	ble _0807CB44
	str r5, [r2]
	b _0807CB44
_0807CB38:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl sub_807CC28
_0807CB44:
	ldr r2, _0807CB74 @ =gUnknown_030059E0
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	movs r7, #0xc8
	lsls r7, r7, #1
	adds r1, r4, r7
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r0, #0
	cmp r6, #2
	bne _0807CB6E
	movs r0, #1
_0807CB6E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807CB74: .4byte gUnknown_030059E0

	thumb_func_start sub_807CB78
sub_807CB78: @ 0x0807CB78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r3, _0807CBD0 @ =gUnknown_030059E0
	movs r0, #0x8b
	lsls r0, r0, #2
	adds r2, r4, r0
	ldr r1, _0807CBD4 @ =0x00000236
	adds r0, r4, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3, #0xc]
	cmp r1, r0
	ble _0807CBDC
	movs r0, #0xc3
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	subs r0, #0x10
	strh r0, [r1]
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0807CBD8 @ =0xFFFFFD00
	cmp r0, r2
	bge _0807CBB4
	adds r3, r2, #0
_0807CBB4:
	strh r3, [r1]
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r4, #0
	bl sub_807CC28
	b _0807CBDE
	.align 2, 0
_0807CBD0: .4byte gUnknown_030059E0
_0807CBD4: .4byte 0x00000236
_0807CBD8: .4byte 0xFFFFFD00
_0807CBDC:
	movs r5, #1
_0807CBDE:
	ldr r2, _0807CC24 @ =gUnknown_030059E0
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	movs r6, #0xc8
	lsls r6, r6, #1
	adds r1, r4, r6
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	adds r3, #4
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	adds r6, #4
	adds r1, r4, r6
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807CC24: .4byte gUnknown_030059E0

	thumb_func_start sub_807CC28
sub_807CC28: @ 0x0807CC28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrh r5, [r0]
	ldr r2, _0807CCB4 @ =0x00000246
	adds r0, r6, r2
	ldrh r4, [r0]
	subs r1, #0xbc
	adds r0, r6, r1
	ldr r0, [r0]
	rsbs r0, r0, #0
	subs r2, #2
	adds r1, r6, r2
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	movs r5, #0xc8
	lsls r5, r5, #1
	adds r3, r6, r5
	asrs r0, r0, #0x10
	ldr r2, _0807CCB8 @ =gSineTable
	movs r1, #0xc1
	lsls r1, r1, #1
	adds r4, r6, r1
	ldrb r1, [r4]
	lsls r1, r1, #3
	adds r5, #0x70
	adds r1, r1, r5
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, #0x80
	strh r0, [r1]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0xc0
	lsls r3, r3, #3
	cmp r0, r3
	bls _0807CCA2
	adds r2, r3, #0
_0807CCA2:
	strh r2, [r1]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	adds r0, r0, r1
	strb r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CCB4: .4byte 0x00000246
_0807CCB8: .4byte gSineTable

	thumb_func_start sub_807CCBC
sub_807CCBC: @ 0x0807CCBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
	ldr r0, _0807CD64 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807CCDC
	movs r1, #1
	mov sl, r1
_0807CCDC:
	movs r2, #0
	mov r8, r2
_0807CCE0:
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #4
	movs r2, #0xcc
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r0, r7, r0
	bl sub_8004558
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0807CCE0
	movs r0, #0
	mov r8, r0
	ldr r1, _0807CD68 @ =gSineTable
	mov sb, r1
_0807CD0A:
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #3
	adds r6, r7, r0
	ldr r4, [r6]
	cmp r4, #0
	bne _0807CD7E
	mov r0, sl
	cmp r0, #0
	bne _0807CD22
	b _0807CE74
_0807CD22:
	bl Random
	ldr r2, _0807CD6C @ =gUnknown_080E0136
	movs r5, #7
	adds r1, r5, #0
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	str r0, [r6]
	bl Random
	strb r0, [r6, #4]
	str r4, [r6, #8]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807CD70
	bl Random
	adds r1, r5, #0
	ands r1, r0
	rsbs r1, r1, #0
	lsls r1, r1, #8
	b _0807CD74
	.align 2, 0
_0807CD64: .4byte gUnknown_03005590
_0807CD68: .4byte gSineTable
_0807CD6C: .4byte gUnknown_080E0136
_0807CD70:
	movs r1, #0x80
	lsls r1, r1, #6
_0807CD74:
	str r1, [r6, #0xc]
	movs r0, #0
	str r0, [r6, #0x10]
	str r0, [r6, #0x14]
	mov sl, r0
_0807CD7E:
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807CD88
	rsbs r0, r1, #0
_0807CD88:
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0807CDA0
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	ble _0807CD9C
	adds r2, r3, #0
_0807CD9C:
	adds r0, r2, #0
	b _0807CDA2
_0807CDA0:
	movs r0, #0x40
_0807CDA2:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r1, r0
	str r3, [r6, #0xc]
	cmp r3, #0
	ble _0807CE12
	rsbs r0, r3, #0
	str r0, [r6, #0x14]
	asrs r1, r3, #5
	ldr r2, _0807CE04 @ =0x00000246
	adds r0, r7, r2
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r2, r0, #0x10
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrh r1, [r0]
	cmp r1, r2
	bge _0807CDCE
	adds r1, r2, #0
_0807CDCE:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	asrs r1, r3, #8
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0807CE08
	adds r1, r2, #0
	cmp r0, #8
	ble _0807CE0A
	movs r1, #8
	b _0807CE0A
	.align 2, 0
_0807CE04: .4byte 0x00000246
_0807CE08:
	movs r1, #2
_0807CE0A:
	ldrb r0, [r6, #4]
	adds r0, r0, r1
	strb r0, [r6, #4]
	b _0807CE74
_0807CE12:
	asrs r0, r3, #8
	rsbs r0, r0, #0
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrh r2, [r1]
	cmp r0, r2
	bge _0807CE70
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	str r0, [r6, #0x14]
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r5, [r0]
	subs r2, #2
	adds r0, r7, r2
	ldrh r4, [r0]
	rsbs r0, r3, #0
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	asrs r0, r0, #0x10
	ldrb r1, [r6, #4]
	lsls r1, r1, #3
	add r1, sb
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	ldrb r0, [r6, #4]
	adds r0, #8
	strb r0, [r6, #4]
	b _0807CE74
_0807CE70:
	movs r0, #0
	str r0, [r6]
_0807CE74:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bhi _0807CE84
	b _0807CD0A
_0807CE84:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807CE94
sub_807CE94: @ 0x0807CE94
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r7, _0807CEEC @ =gUnknown_03005960
_0807CE9C:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r3, [r4]
	cmp r3, #0
	beq _0807CF1A
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r7]
	subs r2, r2, r0
	strh r2, [r3, #0x16]
	ldr r3, [r4]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r7, #4]
	subs r2, r2, r0
	strh r2, [r3, #0x18]
	ldrb r0, [r4, #4]
	cmp r0, #0x7b
	bhi _0807CEF0
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0807CEF6
	.align 2, 0
_0807CEEC: .4byte gUnknown_03005960
_0807CEF0:
	ldr r1, [r4]
	movs r0, #0x90
	lsls r0, r0, #3
_0807CEF6:
	strh r0, [r1, #0x1a]
	ldr r1, [r4, #0xc]
	ldr r0, _0807CF08 @ =0xFFFFF000
	cmp r1, r0
	ble _0807CF0C
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #6
	b _0807CF12
	.align 2, 0
_0807CF08: .4byte 0xFFFFF000
_0807CF0C:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
_0807CF12:
	str r0, [r1, #0x10]
	adds r0, r1, #0
	bl sub_80051E8
_0807CF1A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0807CE9C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807CF2C
sub_807CF2C: @ 0x0807CF2C
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	ldr r2, [r0]
	ldr r1, _0807CFA4 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0x8b
	lsls r4, r4, #2
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807CF9E
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807CF9E
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0807CFA8 @ =0x0000023A
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807CF9E
	subs r2, #4
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807CFAC
_0807CF9E:
	movs r0, #1
	b _0807CFAE
	.align 2, 0
_0807CFA4: .4byte gUnknown_03005960
_0807CFA8: .4byte 0x0000023A
_0807CFAC:
	movs r0, #0
_0807CFAE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807CFB4
sub_807CFB4: @ 0x0807CFB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _0807D058 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D060
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r2, _0807D05C @ =gUnknown_03005960
	ldr r3, [r2]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r1, #4
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r3, [r1]
	subs r2, r6, r3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807D060
	adds r0, r2, r3
	cmp r0, r1
	blt _0807D060
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrh r5, [r0]
	subs r2, #2
	adds r0, r4, r2
	ldrh r4, [r0]
	subs r0, r6, r1
	lsls r0, r0, #8
	adds r1, r3, #0
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsrs r0, r0, #0x11
	subs r1, r1, r0
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807D060
	adds r0, r1, r3
	cmp r0, r2
	blt _0807D060
	movs r0, #1
	b _0807D062
	.align 2, 0
_0807D058: .4byte gUnknown_030059E0
_0807D05C: .4byte gUnknown_03005960
_0807D060:
	movs r0, #0
_0807D062:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807D06C
sub_807D06C: @ 0x0807D06C
	push {r4, lr}
	ldr r0, _0807D0A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807CFB4
	cmp r0, #0
	beq _0807D090
	ldr r0, _0807D0A8 @ =0x0000011D
	bl m4aSongNumStart
	adds r0, r4, #0
	bl sub_807C9C0
_0807D090:
	adds r0, r4, #0
	bl sub_807CF2C
	cmp r0, #0
	beq _0807D0AC
	adds r0, r4, #0
	bl sub_807D188
	b _0807D0BE
	.align 2, 0
_0807D0A4: .4byte gCurTask
_0807D0A8: .4byte 0x0000011D
_0807D0AC:
	adds r0, r4, #0
	bl sub_807CCBC
	adds r0, r4, #0
	bl sub_807CE94
	adds r0, r4, #0
	bl sub_807D16C
_0807D0BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D0C4
sub_807D0C4: @ 0x0807D0C4
	push {r4, lr}
	ldr r0, _0807D0E4 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807D0E8 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D0F0
	ldr r0, _0807D0EC @ =sub_807D06C
	str r0, [r2, #8]
	b _0807D100
	.align 2, 0
_0807D0E4: .4byte gCurTask
_0807D0E8: .4byte gUnknown_030059E0
_0807D0EC: .4byte sub_807D06C
_0807D0F0:
	adds r0, r4, #0
	bl sub_807CA64
	cmp r0, #0
	beq _0807D100
	adds r0, r4, #0
	bl sub_807D130
_0807D100:
	adds r0, r4, #0
	bl sub_807CCBC
	adds r0, r4, #0
	bl sub_807CE94
	adds r0, r4, #0
	bl sub_807D16C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D118
sub_807D118: @ 0x0807D118
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _0807D12C @ =IWRAM_START + 0x254
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0807D12C: .4byte IWRAM_START + 0x254

	thumb_func_start sub_807D130
sub_807D130: @ 0x0807D130
	mov ip, r0
	movs r1, #0xc4
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0
	str r0, [r1]
	movs r3, #0xc6
	lsls r3, r3, #1
	add r3, ip
	ldr r2, _0807D160 @ =gUnknown_030059E0
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	str r0, [r3]
	ldr r0, _0807D164 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D168 @ =sub_807D268
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D160: .4byte gUnknown_030059E0
_0807D164: .4byte gCurTask
_0807D168: .4byte sub_807D268

	thumb_func_start sub_807D16C
sub_807D16C: @ 0x0807D16C
	push {lr}
	ldr r0, _0807D180 @ =gUnknown_03005590
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807D17C
	ldr r0, _0807D184 @ =0x0000011D
	bl m4aSongNumStartOrContinue
_0807D17C:
	pop {r0}
	bx r0
	.align 2, 0
_0807D180: .4byte gUnknown_03005590
_0807D184: .4byte 0x0000011D

	thumb_func_start sub_807D188
sub_807D188: @ 0x0807D188
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D1B4 @ =0x0000011D
	bl m4aSongNumStop
	movs r1, #0x93
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, [r0]
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807D1B8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D1B4: .4byte 0x0000011D
_0807D1B8: .4byte gCurTask

	thumb_func_start sub_807D1BC
sub_807D1BC: @ 0x0807D1BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _0807D224 @ =gUnknown_080E0136
	mov r8, r0
	movs r7, #0
_0807D1CC:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r6, r4
	bl Random
	movs r1, #7
	ands r1, r0
	add r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r6, r0
	str r0, [r4]
	bl Random
	strb r0, [r4, #4]
	str r7, [r4, #8]
	bl Random
	movs r1, #0x3f
	ands r1, r0
	lsls r1, r1, #8
	rsbs r1, r1, #0
	str r1, [r4, #0xc]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0807D1CC
	adds r0, r6, #0
	bl sub_807CCBC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D224: .4byte gUnknown_080E0136

	thumb_func_start sub_807D228
sub_807D228: @ 0x0807D228
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807C7B8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D248
sub_807D248: @ 0x0807D248
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807C7B8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D268
sub_807D268: @ 0x0807D268
	push {r4, lr}
	ldr r0, _0807D288 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807D28C @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D294
	ldr r0, _0807D290 @ =sub_807D06C
	str r0, [r2, #8]
	b _0807D2A4
	.align 2, 0
_0807D288: .4byte gCurTask
_0807D28C: .4byte gUnknown_030059E0
_0807D290: .4byte sub_807D06C
_0807D294:
	adds r0, r4, #0
	bl sub_807CB78
	cmp r0, #0
	beq _0807D2A4
	adds r0, r4, #0
	bl sub_807D2BC
_0807D2A4:
	adds r0, r4, #0
	bl sub_807CCBC
	adds r0, r4, #0
	bl sub_807CE94
	adds r0, r4, #0
	bl sub_807D16C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D2BC
sub_807D2BC: @ 0x0807D2BC
	ldr r2, _0807D2E4 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _0807D2E8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0
	movs r0, #7
	strb r0, [r3]
	strh r1, [r2, #0x10]
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	ldr r0, _0807D2EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D2F0 @ =sub_807D06C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D2E4: .4byte gUnknown_030059E0
_0807D2E8: .4byte 0xFFBFFFFF
_0807D2EC: .4byte gCurTask
_0807D2F0: .4byte sub_807D06C

	thumb_func_start sub_807D2F4
sub_807D2F4: @ 0x0807D2F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #4]
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _0807D430 @ =sub_807D7B0
	ldr r2, _0807D434 @ =0x00002010
	ldr r1, _0807D438 @ =sub_807D7F8
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r3, _0807D43C @ =IWRAM_START + 0x44
	adds r0, r4, r3
	movs r5, #0
	mov sl, r5
	mov r6, sp
	ldrh r6, [r6, #0x28]
	strh r6, [r0]
	ldr r0, _0807D440 @ =IWRAM_START + 0x52
	adds r1, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	ldr r3, [sp, #4]
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r5, r8
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	movs r0, #3
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r6, _0807D444 @ =IWRAM_START + 0x48
	adds r3, r4, r6
	strh r0, [r3]
	movs r0, #4
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r5, _0807D448 @ =IWRAM_START + 0x4A
	adds r1, r4, r5
	strh r0, [r1]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r6, [r3]
	adds r0, r0, r6
	ldr r6, _0807D44C @ =IWRAM_START + 0x4C
	adds r5, r4, r6
	strh r0, [r5]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r6, #2
	adds r1, r4, r6
	strh r0, [r1]
	ldrh r0, [r5]
	ldrh r1, [r3]
	subs r0, r0, r1
	ldr r3, _0807D450 @ =IWRAM_START + 0x50
	adds r1, r4, r3
	strh r0, [r1]
	mov r5, sp
	ldrh r5, [r5, #4]
	strh r5, [r2, #4]
	mov r6, r8
	strh r6, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r0, sb
	strb r0, [r2, #9]
	ldr r1, _0807D454 @ =IWRAM_START + 0xC
	adds r5, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	mov r3, sl
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r6, _0807D458 @ =IWRAM_START + 0x2D
	adds r1, r4, r6
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807D45C @ =IWRAM_START + 0x2E
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807D460 @ =IWRAM_START + 0x31
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807D464 @ =0x0000024F
	strh r0, [r5, #0xa]
	subs r6, #1
	adds r4, r4, r6
	movs r0, #2
	strb r0, [r4]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0807D40E
	cmp r0, #2
	bne _0807D418
_0807D40E:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807D418:
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D430: .4byte sub_807D7B0
_0807D434: .4byte 0x00002010
_0807D438: .4byte sub_807D7F8
_0807D43C: .4byte IWRAM_START + 0x44
_0807D440: .4byte IWRAM_START + 0x52
_0807D444: .4byte IWRAM_START + 0x48
_0807D448: .4byte IWRAM_START + 0x4A
_0807D44C: .4byte IWRAM_START + 0x4C
_0807D450: .4byte IWRAM_START + 0x50
_0807D454: .4byte IWRAM_START + 0xC
_0807D458: .4byte IWRAM_START + 0x2D
_0807D45C: .4byte IWRAM_START + 0x2E
_0807D460: .4byte IWRAM_START + 0x31
_0807D464: .4byte 0x0000024F

	thumb_func_start sub_807D468
sub_807D468: @ 0x0807D468
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807D478
	cmp r0, #2
	bne _0807D494
_0807D478:
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r2, _0807D490 @ =gUnknown_030059E0
	ldr r1, [r2, #8]
	subs r3, r0, r1
	b _0807D4A8
	.align 2, 0
_0807D490: .4byte gUnknown_030059E0
_0807D494:
	ldr r2, _0807D4CC @ =gUnknown_030059E0
	adds r0, r4, #0
	adds r0, #0x48
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r2, #8]
	subs r3, r1, r0
_0807D4A8:
	adds r6, r2, #0
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	lsls r0, r1, #8
	subs r0, r0, r3
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0
	blt _0807D4D0
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807D4D2
	adds r0, r1, #0
	b _0807D4D2
	.align 2, 0
_0807D4CC: .4byte gUnknown_030059E0
_0807D4D0:
	movs r0, #0
_0807D4D2:
	lsls r0, r0, #4
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r4, #0
	adds r0, #0x52
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r5, [r0]
	cmp r5, #0
	beq _0807D4FA
	cmp r5, #2
	bne _0807D558
_0807D4FA:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _0807D516
	ldrh r0, [r6, #0x14]
	subs r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807D820
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x10]
	subs r0, #0x40
	b _0807D572
_0807D516:
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r6, #8]
	subs r2, r0, r1
	str r2, [r6, #8]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, _0807D554 @ =0xFFFFD000
	adds r3, r0, r1
	cmp r5, #2
	beq _0807D53C
	cmp r2, r3
	ble _0807D53C
	str r3, [r6, #8]
_0807D53C:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807D5C4
	ldr r0, [r6, #0x20]
	movs r1, #1
	orrs r0, r1
	b _0807D5BC
	.align 2, 0
_0807D554: .4byte 0xFFFFD000
_0807D558:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	ble _0807D57E
	ldrh r0, [r6, #0x14]
	adds r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807D820
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x10]
	adds r0, #0x40
_0807D572:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807D820
	strh r0, [r6, #0x10]
	b _0807D5C4
_0807D57E:
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r6, #8]
	adds r2, r0, r1
	str r2, [r6, #8]
	adds r0, r4, #0
	adds r0, #0x48
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r3, r0, r1
	cmp r5, #3
	beq _0807D5A6
	cmp r2, r3
	bge _0807D5A6
	str r3, [r6, #8]
_0807D5A6:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807D5C4
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_0807D5BC:
	str r0, [r6, #0x20]
	ldrh r0, [r6, #0x14]
	rsbs r0, r0, #0
	strh r0, [r6, #0x14]
_0807D5C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807D5CC
sub_807D5CC: @ 0x0807D5CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	adds r0, #0x44
	ldrh r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0807D698
	ldr r0, _0807D5FC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd2
	lsls r1, r1, #1
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x3b
	bhi _0807D600
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #0
	b _0807D67A
	.align 2, 0
_0807D5FC: .4byte gUnknown_03005590
_0807D600:
	cmp r1, #0x77
	bhi _0807D630
	subs r1, #0x3c
	lsls r0, r1, #8
	movs r1, #0x3c
	bl __udivsi3
	adds r2, r0, #0
	adds r1, r4, #0
	adds r1, #0x52
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0807D62C
	adds r0, r2, #0
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r3, r2
	ble _0807D67A
	adds r0, r2, #0
	b _0807D67A
_0807D62C:
	movs r0, #0
	b _0807D67A
_0807D630:
	ldr r0, _0807D640 @ =0x00000167
	cmp r1, r0
	bhi _0807D644
	adds r1, r4, #0
	adds r1, #0x52
	subs r0, #0x67
	b _0807D67A
	.align 2, 0
_0807D640: .4byte 0x00000167
_0807D644:
	ldr r0, _0807D66C @ =0xFFFFFE98
	adds r1, r1, r0
	lsls r0, r1, #8
	movs r1, #0x3c
	bl __udivsi3
	adds r2, r0, #0
	adds r1, r4, #0
	adds r1, #0x52
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0807D670
	movs r3, #0x80
	lsls r3, r3, #1
	cmp r0, r3
	ble _0807D672
	adds r2, r3, #0
	b _0807D672
	.align 2, 0
_0807D66C: .4byte 0xFFFFFE98
_0807D670:
	movs r2, #0
_0807D672:
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r2
_0807D67A:
	strh r0, [r1]
	ldrh r0, [r1]
	lsrs r0, r0, #4
	adds r2, r5, #0
	adds r2, #0x22
	strb r0, [r2]
	ldr r0, _0807D694 @ =0x0000024F
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	b _0807D6A2
	.align 2, 0
_0807D694: .4byte 0x0000024F
_0807D698:
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0807D6A2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807D6A8
sub_807D6A8: @ 0x0807D6A8
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807D6BC
	cmp r0, #2
	bne _0807D6C4
_0807D6BC:
	ldr r1, [r3, #0x3c]
	adds r0, r3, #0
	adds r0, #0x4c
	b _0807D6CA
_0807D6C4:
	ldr r1, [r3, #0x3c]
	adds r0, r3, #0
	adds r0, #0x48
_0807D6CA:
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r2, _0807D6F8 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #0x40]
	adds r1, r3, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D6F8: .4byte gUnknown_03005960

	thumb_func_start sub_807D6FC
sub_807D6FC: @ 0x0807D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	ldr r5, _0807D798 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D7A0
	mov r0, ip
	ldr r3, [r0, #0x3c]
	ldr r1, _0807D79C @ =gUnknown_03005960
	ldr r4, [r1]
	subs r3, r3, r4
	ldr r0, [r0, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	subs r2, r2, r4
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r0, ip
	adds r0, #0x4c
	mov r4, ip
	adds r4, #0x48
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	adds r0, #0x4e
	mov r5, ip
	adds r5, #0x4a
	ldrh r0, [r0]
	ldrh r1, [r5]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r3, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bgt _0807D7A0
	adds r0, r0, r6
	cmp r0, r2
	blt _0807D7A0
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r1, r0, r1
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807D7A0
	adds r0, r1, r7
	cmp r0, r2
	blt _0807D7A0
	movs r0, #1
	b _0807D7A2
	.align 2, 0
_0807D798: .4byte gUnknown_030059E0
_0807D79C: .4byte gUnknown_03005960
_0807D7A0:
	movs r0, #0
_0807D7A2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807D7B0
sub_807D7B0: @ 0x0807D7B0
	push {r4, lr}
	ldr r0, _0807D7E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807D6FC
	cmp r0, #0
	beq _0807D7CE
	adds r0, r4, #0
	bl sub_807D80C
_0807D7CE:
	adds r0, r4, #0
	bl sub_807D86C
	cmp r0, #0
	beq _0807D7E4
	adds r0, r4, #0
	bl sub_807D8E0
	b _0807D7F0
	.align 2, 0
_0807D7E0: .4byte gCurTask
_0807D7E4:
	adds r0, r4, #0
	bl sub_807D5CC
	adds r0, r4, #0
	bl sub_807D6A8
_0807D7F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807D7F8
sub_807D7F8: @ 0x0807D7F8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807D80C
sub_807D80C: @ 0x0807D80C
	ldr r0, _0807D818 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D81C @ =sub_807D978
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D818: .4byte gCurTask
_0807D81C: .4byte sub_807D978

	thumb_func_start sub_807D820
sub_807D820: @ 0x0807D820
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0807D840 @ =gUnknown_030059E0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807D844
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _0807D850
	b _0807D854
	.align 2, 0
_0807D840: .4byte gUnknown_030059E0
_0807D844:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	ble _0807D854
_0807D850:
	adds r1, r0, #0
	b _0807D85E
_0807D854:
	ldr r0, _0807D868 @ =0xFFFFF100
	cmp r2, r0
	bge _0807D85E
	movs r1, #0xf1
	lsls r1, r1, #8
_0807D85E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0807D868: .4byte 0xFFFFF100

	thumb_func_start sub_807D86C
sub_807D86C: @ 0x0807D86C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807D8D4 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807D8CE
	adds r0, r3, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807D8CE
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807D8CE
	adds r0, r3, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807D8D8
_0807D8CE:
	movs r0, #1
	b _0807D8DA
	.align 2, 0
_0807D8D4: .4byte gUnknown_03005960
_0807D8D8:
	movs r0, #0
_0807D8DA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807D8E0
sub_807D8E0: @ 0x0807D8E0
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807D8F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807D8F4: .4byte gCurTask

	thumb_func_start sub_807D8F8
sub_807D8F8: @ 0x0807D8F8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D918
sub_807D918: @ 0x0807D918
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D938
sub_807D938: @ 0x0807D938
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D958
sub_807D958: @ 0x0807D958
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D978
sub_807D978: @ 0x0807D978
	push {r4, lr}
	ldr r0, _0807D9B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807D468
	adds r0, r4, #0
	bl sub_807D6FC
	cmp r0, #0
	bne _0807D99C
	adds r0, r4, #0
	bl sub_807D9B4
_0807D99C:
	adds r0, r4, #0
	bl sub_807D5CC
	adds r0, r4, #0
	bl sub_807D6A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9B0: .4byte gCurTask

	thumb_func_start sub_807D9B4
sub_807D9B4: @ 0x0807D9B4
	ldr r0, _0807D9C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D9C4 @ =sub_807D7B0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D9C0: .4byte gCurTask
_0807D9C4: .4byte sub_807D7B0

	thumb_func_start sub_807D9C8
sub_807D9C8: @ 0x0807D9C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sl, r5
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0807DA8C @ =sub_807DE98
	ldr r2, _0807DA90 @ =0x00002010
	ldr r1, _0807DA94 @ =sub_807DF38
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r1, _0807DA98 @ =IWRAM_START + 0x44
	adds r3, r2, r1
	mov r5, sp
	ldrh r5, [r5, #0x30]
	strh r5, [r3]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	mov r5, ip
	str r0, [r5, #0x3c]
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r5, sl
	lsls r1, r5, #8
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x40]
	mov r5, r8
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _0807DA9C @ =IWRAM_START + 0x4C
	adds r7, r2, r1
	strh r0, [r7]
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r5, _0807DAA0 @ =IWRAM_START + 0x4E
	adds r6, r2, r5
	strh r0, [r6]
	mov r1, r8
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	ldrh r5, [r7]
	adds r0, r0, r5
	ldr r5, _0807DAA4 @ =IWRAM_START + 0x50
	adds r1, r2, r5
	strh r0, [r1]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r5, [r6]
	adds r0, r0, r5
	ldr r5, _0807DAA8 @ =IWRAM_START + 0x52
	adds r2, r2, r5
	strh r0, [r2]
	mov r0, ip
	strh r4, [r0, #4]
	mov r4, sl
	strh r4, [r0, #6]
	mov r5, r8
	str r5, [r0]
	ldrb r0, [r5]
	mov r4, ip
	strb r0, [r4, #8]
	mov r5, sb
	strb r5, [r4, #9]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DABC
	cmp r0, #1
	bgt _0807DAAC
	cmp r0, #0
	beq _0807DAB6
	b _0807DB0E
	.align 2, 0
_0807DA8C: .4byte sub_807DE98
_0807DA90: .4byte 0x00002010
_0807DA94: .4byte sub_807DF38
_0807DA98: .4byte IWRAM_START + 0x44
_0807DA9C: .4byte IWRAM_START + 0x4C
_0807DAA0: .4byte IWRAM_START + 0x4E
_0807DAA4: .4byte IWRAM_START + 0x50
_0807DAA8: .4byte IWRAM_START + 0x52
_0807DAAC:
	cmp r0, #2
	beq _0807DAD8
	cmp r0, #3
	beq _0807DAF4
	b _0807DB0E
_0807DAB6:
	movs r0, #0
	ldrsh r1, [r1, r0]
	b _0807DAC0
_0807DABC:
	movs r5, #0
	ldrsh r1, [r7, r5]
_0807DAC0:
	mov r3, ip
	ldr r0, [r3, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x54]
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x58]
	b _0807DB0E
_0807DAD8:
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov r2, ip
	ldr r0, [r2, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x54]
	movs r3, #0
	ldrsh r1, [r6, r3]
	ldr r0, [r2, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x58]
	b _0807DB0E
_0807DAF4:
	movs r4, #0
	ldrsh r1, [r7, r4]
	mov r5, ip
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x54]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x58]
_0807DB0E:
	movs r3, #0
	mov r4, ip
	adds r4, #0xc
	mov r6, ip
	adds r6, #0x2d
	mov r7, ip
	adds r7, #0x2e
	movs r1, #0x31
	add r1, ip
	mov sb, r1
	movs r2, #0x2c
	add r2, ip
	mov sl, r2
	mov r5, ip
	adds r5, #0x44
	str r5, [sp, #0xc]
	mov r2, ip
	adds r2, #0x64
	mov r1, ip
	adds r1, #0x60
_0807DB36:
	mov r5, ip
	ldr r0, [r5, #0x54]
	str r0, [r1]
	ldr r0, [r5, #0x58]
	str r0, [r2]
	adds r2, #8
	adds r1, #8
	adds r3, #1
	cmp r3, #2
	bls _0807DB36
	adds r5, r4, #0
	movs r4, #0
	movs r1, #0
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	movs r0, #0xff
	strb r0, [r6]
	movs r0, #0x10
	strb r0, [r7]
	mov r0, sb
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xf
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807DBA8 @ =0x00000266
	strh r0, [r5, #0xa]
	mov r1, sl
	strb r4, [r1]
	ldr r2, [sp, #0x30]
	cmp r2, #0
	bne _0807DB94
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DB94:
	ldr r3, [sp, #0xc]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DBD0
	cmp r0, #1
	bgt _0807DBAC
	cmp r0, #0
	beq _0807DBB6
	b _0807DBD0
	.align 2, 0
_0807DBA8: .4byte 0x00000266
_0807DBAC:
	cmp r0, #2
	beq _0807DBBE
	cmp r0, #3
	beq _0807DBC6
	b _0807DBD0
_0807DBB6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807DBCC
_0807DBBE:
	ldr r0, [r5, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	b _0807DBCC
_0807DBC6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
_0807DBCC:
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DBD0:
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807DBF0
sub_807DBF0: @ 0x0807DBF0
	push {r4, r5, lr}
	ldr r0, _0807DC38 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807DC3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DC0C
	adds r0, r4, #0
	bl sub_807E0D0
_0807DC0C:
	adds r0, r4, #0
	bl sub_807DF60
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807DC1E
	adds r0, r4, #0
	bl sub_807DD04
_0807DC1E:
	adds r0, r4, #0
	bl sub_807DFBC
	ldr r3, _0807DC40 @ =gUnknown_030059E0
	ldr r2, [r3, #0x20]
	movs r5, #0x80
	ands r5, r2
	cmp r5, #0
	beq _0807DC44
	movs r0, #0
	str r0, [r4, #0x48]
	b _0807DC6C
	.align 2, 0
_0807DC38: .4byte gCurTask
_0807DC3C: .4byte gGameMode
_0807DC40: .4byte gUnknown_030059E0
_0807DC44:
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	cmp r0, #0x78
	beq _0807DC64
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0807DC78 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807DC6C
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
_0807DC64:
	ldr r0, _0807DC7C @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r3, #0x20]
	str r5, [r4, #0x48]
_0807DC6C:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DC78: .4byte gUnknown_03005B38
_0807DC7C: .4byte 0xFFBFFFFF

	thumb_func_start sub_807DC80
sub_807DC80: @ 0x0807DC80
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x8f
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r4, _0807DCDC @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r2, r4, #0
	adds r2, #0x64
	movs r1, #0
	movs r0, #0x40
	strh r0, [r2]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r1, [r4, #0x20]
	subs r0, #0x13
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807DCD4
	cmp r0, #2
	bne _0807DCE0
_0807DCD4:
	movs r0, #1
	orrs r1, r0
	b _0807DCE6
	.align 2, 0
_0807DCDC: .4byte gUnknown_030059E0
_0807DCE0:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
_0807DCE6:
	str r1, [r4, #0x20]
	movs r0, #1
	str r0, [r5, #0x48]
	ldr r0, _0807DCFC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DD00 @ =sub_807DBF0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DCFC: .4byte gCurTask
_0807DD00: .4byte sub_807DBF0

	thumb_func_start sub_807DD04
sub_807DD04: @ 0x0807DD04
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0807DD44 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807DD78
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _0807DD78
	ldr r0, _0807DD48 @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x41
	strh r0, [r1]
	adds r1, #9
	movs r0, #7
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807DD5C
	cmp r0, #1
	bgt _0807DD4C
	cmp r0, #0
	beq _0807DD56
	b _0807DD68
	.align 2, 0
_0807DD44: .4byte gUnknown_030059E0
_0807DD48: .4byte 0xFFBFFFFF
_0807DD4C:
	cmp r0, #2
	beq _0807DD56
	cmp r0, #3
	beq _0807DD5C
	b _0807DD68
_0807DD56:
	movs r0, #0xf1
	lsls r0, r0, #8
	b _0807DD60
_0807DD5C:
	movs r0, #0xf0
	lsls r0, r0, #4
_0807DD60:
	strh r0, [r2, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
_0807DD68:
	movs r0, #0
	str r0, [r4, #0x48]
	ldr r0, _0807DD74 @ =0x0000011F
	bl m4aSongNumStart
	b _0807DD80
	.align 2, 0
_0807DD74: .4byte 0x0000011F
_0807DD78:
	movs r0, #0x8f
	lsls r0, r0, #1
	bl m4aSongNumStop
_0807DD80:
	adds r1, r4, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807DD98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DD9C @ =sub_807DEEC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DD98: .4byte gCurTask
_0807DD9C: .4byte sub_807DEEC

	thumb_func_start sub_807DDA0
sub_807DDA0: @ 0x0807DDA0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807DDC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DDC8
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	ldr r2, _0807DDC4 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x6c]
	b _0807DDD6
	.align 2, 0
_0807DDC0: .4byte gGameMode
_0807DDC4: .4byte gUnknown_03005960
_0807DDC8:
	ldr r0, [r3, #0x54]
	asrs r0, r0, #8
	ldr r2, _0807DDEC @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x58]
_0807DDD6:
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DDEC: .4byte gUnknown_03005960

	thumb_func_start sub_807DDF0
sub_807DDF0: @ 0x0807DDF0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r1, _0807DE1C @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r2, #0x80
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	bne _0807DE90
	ldr r0, _0807DE20 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807DE24
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
_0807DE14:
	cmp r0, #1
	bhi _0807DE32
	b _0807DE90
	.align 2, 0
_0807DE1C: .4byte gUnknown_030059E0
_0807DE20: .4byte gUnknown_03005424
_0807DE24:
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0807DE14
_0807DE32:
	ldr r2, [r3, #0x54]
	asrs r2, r2, #8
	ldr r1, _0807DE8C @ =gUnknown_03005960
	ldr r4, [r1]
	subs r2, r2, r4
	ldr r0, [r3, #0x58]
	asrs r0, r0, #8
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807DE90
	adds r0, #0x20
	cmp r0, r1
	blt _0807DE90
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x10
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807DE90
	adds r0, r3, #0
	adds r0, #0x10
	cmp r0, r2
	blt _0807DE90
	movs r0, #1
	b _0807DE92
	.align 2, 0
_0807DE8C: .4byte gUnknown_03005960
_0807DE90:
	movs r0, #0
_0807DE92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807DE98
sub_807DE98: @ 0x0807DE98
	push {r4, lr}
	ldr r0, _0807DED8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807DEDC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DEB4
	adds r0, r4, #0
	bl sub_807E0D0
_0807DEB4:
	adds r0, r4, #0
	bl sub_807DDF0
	cmp r0, #0
	beq _0807DEC4
	adds r0, r4, #0
	bl sub_807DC80
_0807DEC4:
	adds r0, r4, #0
	bl sub_807E044
	cmp r0, #0
	beq _0807DEE0
	adds r0, r4, #0
	bl sub_807E0B8
	b _0807DEE6
	.align 2, 0
_0807DED8: .4byte gCurTask
_0807DEDC: .4byte gGameMode
_0807DEE0:
	adds r0, r4, #0
	bl sub_807DDA0
_0807DEE6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807DEEC
sub_807DEEC: @ 0x0807DEEC
	push {r4, r5, lr}
	ldr r0, _0807DF2C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807DF30 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DF08
	adds r0, r4, #0
	bl sub_807E0D0
_0807DF08:
	ldr r0, _0807DF34 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0807DF20
	adds r0, r4, #0
	bl sub_807DF4C
_0807DF20:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF2C: .4byte gCurTask
_0807DF30: .4byte gGameMode
_0807DF34: .4byte IWRAM_START + 0x5C

	thumb_func_start sub_807DF38
sub_807DF38: @ 0x0807DF38
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807DF4C
sub_807DF4C: @ 0x0807DF4C
	ldr r0, _0807DF58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DF5C @ =sub_807E16C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807DF58: .4byte gCurTask
_0807DF5C: .4byte sub_807E16C

	thumb_func_start sub_807DF60
sub_807DF60: @ 0x0807DF60
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807DF72
	cmp r0, #2
	bne _0807DF94
_0807DF72:
	ldr r1, [r3, #0x54]
	ldr r0, _0807DF90 @ =0xFFFFF100
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807DFB4
	b _0807DFB0
	.align 2, 0
_0807DF90: .4byte 0xFFFFF100
_0807DF94:
	ldr r1, [r3, #0x54]
	movs r0, #0xf0
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	blt _0807DFB4
_0807DFB0:
	str r0, [r3, #0x54]
	movs r4, #1
_0807DFB4:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807DFBC
sub_807DFBC: @ 0x0807DFBC
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807DFE8 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E040
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _0807E040
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807E00C
	cmp r0, #1
	bgt _0807DFEC
	cmp r0, #0
	beq _0807DFF6
	b _0807E040
	.align 2, 0
_0807DFE8: .4byte gUnknown_030059E0
_0807DFEC:
	cmp r0, #2
	beq _0807E020
	cmp r0, #3
	beq _0807E02C
	b _0807E040
_0807DFF6:
	ldr r0, [r2, #0x54]
	ldr r1, _0807E004 @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	ldr r1, _0807E008 @ =0xFFFFF000
	b _0807E03C
	.align 2, 0
_0807E004: .4byte 0xFFFFF800
_0807E008: .4byte 0xFFFFF000
_0807E00C:
	ldr r0, [r2, #0x54]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	ldr r1, _0807E01C @ =0xFFFFF000
	b _0807E03C
	.align 2, 0
_0807E01C: .4byte 0xFFFFF000
_0807E020:
	ldr r0, [r2, #0x54]
	ldr r1, _0807E028 @ =0xFFFFF800
	b _0807E032
	.align 2, 0
_0807E028: .4byte 0xFFFFF800
_0807E02C:
	ldr r0, [r2, #0x54]
	movs r1, #0x80
	lsls r1, r1, #4
_0807E032:
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	movs r1, #0x80
	lsls r1, r1, #5
_0807E03C:
	adds r0, r0, r1
	str r0, [r3, #0xc]
_0807E040:
	pop {r0}
	bx r0

	thumb_func_start sub_807E044
sub_807E044: @ 0x0807E044
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807E0AC @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807E0A6
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807E0A6
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807E0A6
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807E0B0
_0807E0A6:
	movs r0, #1
	b _0807E0B2
	.align 2, 0
_0807E0AC: .4byte gUnknown_03005960
_0807E0B0:
	movs r0, #0
_0807E0B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807E0B8
sub_807E0B8: @ 0x0807E0B8
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807E0CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807E0CC: .4byte gCurTask

	thumb_func_start sub_807E0D0
sub_807E0D0: @ 0x0807E0D0
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x58]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start sub_807E0EC
sub_807E0EC: @ 0x0807E0EC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E10C
sub_807E10C: @ 0x0807E10C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E12C
sub_807E12C: @ 0x0807E12C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E14C
sub_807E14C: @ 0x0807E14C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E16C
sub_807E16C: @ 0x0807E16C
	push {r4, lr}
	ldr r0, _0807E1A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807E1AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807E188
	adds r0, r4, #0
	bl sub_807E0D0
_0807E188:
	adds r0, r4, #0
	bl sub_807E1C4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807E19A
	adds r0, r4, #0
	bl sub_807E1B0
_0807E19A:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1A8: .4byte gCurTask
_0807E1AC: .4byte gGameMode

	thumb_func_start sub_807E1B0
sub_807E1B0: @ 0x0807E1B0
	ldr r0, _0807E1BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E1C0 @ =sub_807DE98
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E1BC: .4byte gCurTask
_0807E1C0: .4byte sub_807DE98

	thumb_func_start sub_807E1C4
sub_807E1C4: @ 0x0807E1C4
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807E1D6
	cmp r0, #2
	bne _0807E1F4
_0807E1D6:
	ldr r1, [r3, #0x54]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	blt _0807E212
	b _0807E20E
_0807E1F4:
	ldr r1, [r3, #0x54]
	ldr r0, _0807E21C @ =0xFFFFFF00
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807E212
_0807E20E:
	str r0, [r3, #0x54]
	movs r4, #1
_0807E212:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807E21C: .4byte 0xFFFFFF00

	thumb_func_start sub_807E220
sub_807E220: @ 0x0807E220
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807E294 @ =sub_807E770
	ldr r2, _0807E298 @ =0x00002010
	ldr r1, _0807E29C @ =sub_807E830
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov ip, r0
	movs r0, #3
	ldrsb r0, [r7, r0]
	ldr r1, _0807E2A0 @ =IWRAM_START + 0x68
	adds r2, r3, r1
	strh r0, [r2]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	mov r4, ip
	str r0, [r4, #0x60]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r4, #0x64]
	str r7, [r4, #0x70]
	ldrb r1, [r7]
	ldr r4, _0807E2A4 @ =IWRAM_START + 0x74
	adds r0, r3, r4
	strb r1, [r0]
	ldr r1, _0807E2A8 @ =IWRAM_START + 0x75
	adds r0, r3, r1
	strb r6, [r0]
	ldrh r0, [r2]
	cmp r0, #0
	bne _0807E2AC
	subs r4, #0xa
	adds r1, r3, r4
	movs r0, #0x80
	lsls r0, r0, #2
	b _0807E2B2
	.align 2, 0
_0807E294: .4byte sub_807E770
_0807E298: .4byte 0x00002010
_0807E29C: .4byte sub_807E830
_0807E2A0: .4byte IWRAM_START + 0x68
_0807E2A4: .4byte IWRAM_START + 0x74
_0807E2A8: .4byte IWRAM_START + 0x75
_0807E2AC:
	ldr r0, _0807E30C @ =IWRAM_START + 0x6A
	adds r1, r3, r0
	movs r0, #0
_0807E2B2:
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x30
	movs r3, #0
	movs r2, #0
	movs r1, #0xe0
	lsls r1, r1, #1
	strh r1, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	mov r2, ip
	adds r2, #0x51
	movs r1, #0xff
	strb r1, [r2]
	adds r2, #1
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x55
	strb r3, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r1, _0807E310 @ =0x06012C80
	str r1, [r0, #4]
	movs r1, #0x9a
	lsls r1, r1, #2
	strh r1, [r0, #0xa]
	subs r2, #2
	movs r1, #1
	strb r1, [r2]
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E30C: .4byte IWRAM_START + 0x6A
_0807E310: .4byte 0x06012C80

	thumb_func_start sub_807E314
sub_807E314: @ 0x0807E314
	push {r4, lr}
	ldr r0, _0807E35C @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _0807E360 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E352
	ldr r1, _0807E364 @ =IWRAM_START + 0x6C
	adds r0, r3, r1
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	ldr r0, _0807E368 @ =0xFFFF0000
	cmp r1, r0
	beq _0807E352
	adds r2, #0x5e
	ldr r1, _0807E36C @ =gUnknown_03005B38
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0807E370
_0807E352:
	adds r0, r4, #0
	bl sub_807E408
	b _0807E376
	.align 2, 0
_0807E35C: .4byte gCurTask
_0807E360: .4byte gUnknown_030059E0
_0807E364: .4byte IWRAM_START + 0x6C
_0807E368: .4byte 0xFFFF0000
_0807E36C: .4byte gUnknown_03005B38
_0807E370:
	adds r0, r4, #0
	bl sub_807E56C
_0807E376:
	adds r0, r4, #0
	bl sub_807E5F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E384
sub_807E384: @ 0x0807E384
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _0807E3C8 @ =gUnknown_030059E0
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
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E3CC
	ldr r0, [r5, #0x60]
	adds r0, #0x28
	lsls r0, r0, #8
	str r0, [r4, #8]
	ldr r0, [r5, #0x64]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	b _0807E3E2
	.align 2, 0
_0807E3C8: .4byte gUnknown_030059E0
_0807E3CC:
	ldr r0, [r5, #0x60]
	subs r0, #0x28
	lsls r0, r0, #8
	str r0, [r4, #8]
	ldr r0, [r5, #0x64]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_0807E3E2:
	str r0, [r4, #0x20]
	ldr r1, _0807E3FC @ =gUnknown_030059E0
	movs r0, #0
	strh r0, [r1, #0x14]
	strh r0, [r1, #0x10]
	strh r0, [r1, #0x12]
	ldr r0, _0807E400 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E404 @ =sub_807E7B0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3FC: .4byte gUnknown_030059E0
_0807E400: .4byte gCurTask
_0807E404: .4byte sub_807E7B0

	thumb_func_start sub_807E408
sub_807E408: @ 0x0807E408
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_802A004
	ldr r0, _0807E4C8 @ =gUnknown_030059E0
	mov ip, r0
	ldr r1, [r0, #0x20]
	movs r6, #0x80
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	bne _0807E4B0
	ldr r0, _0807E4CC @ =0xFFBFFFFF
	ands r1, r0
	mov r7, ip
	str r1, [r7, #0x20]
	mov r1, ip
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r2, _0807E4D0 @ =gSineTable
	adds r4, r5, #0
	adds r4, #0x6a
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r1, [r7, #8]
	adds r1, r1, r0
	str r1, [r7, #8]
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r1, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #0xc]
	ldrh r0, [r4]
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	strh r0, [r7, #0x10]
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #4
	subs r2, r1, r0
	strh r2, [r7, #0x12]
	ldr r0, _0807E4D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0807E49A
	rsbs r0, r2, #0
	strh r0, [r7, #0x12]
_0807E49A:
	ldrh r0, [r4]
	lsrs r0, r0, #2
	mov r1, ip
	adds r1, #0x24
	strb r0, [r1]
	movs r0, #4
	mov r1, ip
	strh r0, [r1, #0x2c]
	ldr r0, _0807E4D8 @ =0x00000121
	bl m4aSongNumStart
_0807E4B0:
	adds r1, r5, #0
	adds r1, #0x6e
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807E4DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E4E0 @ =sub_807E7F8
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4C8: .4byte gUnknown_030059E0
_0807E4CC: .4byte 0xFFBFFFFF
_0807E4D0: .4byte gSineTable
_0807E4D4: .4byte gUnknown_03005424
_0807E4D8: .4byte 0x00000121
_0807E4DC: .4byte gCurTask
_0807E4E0: .4byte sub_807E7F8

	thumb_func_start sub_807E4E4
sub_807E4E4: @ 0x0807E4E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r0, [r4, #0x60]
	lsls r1, r0, #8
	ldr r0, _0807E508 @ =gUnknown_030059E0
	ldr r2, [r0, #8]
	adds r3, r0, #0
	cmp r2, r1
	ble _0807E510
	ldr r6, _0807E50C @ =0xFFFFFF00
	adds r0, r2, r6
	str r0, [r3, #8]
	cmp r0, r1
	bge _0807E526
	str r1, [r3, #8]
	b _0807E526
	.align 2, 0
_0807E508: .4byte gUnknown_030059E0
_0807E50C: .4byte 0xFFFFFF00
_0807E510:
	cmp r2, r1
	bge _0807E524
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	str r0, [r3, #8]
	cmp r0, r1
	ble _0807E526
	str r1, [r3, #8]
	b _0807E526
_0807E524:
	movs r5, #1
_0807E526:
	ldr r0, [r4, #0x64]
	lsls r1, r0, #8
	adds r2, r3, #0
	ldr r0, [r2, #0xc]
	cmp r0, r1
	ble _0807E544
	ldr r3, _0807E540 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r2, #0xc]
	cmp r0, r1
	bge _0807E55E
	str r1, [r2, #0xc]
	b _0807E55E
	.align 2, 0
_0807E540: .4byte 0xFFFFFF00
_0807E544:
	cmp r0, r1
	bge _0807E558
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	str r0, [r3, #0xc]
	cmp r0, r1
	ble _0807E55E
	str r1, [r3, #0xc]
	b _0807E55E
_0807E558:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0807E55E:
	movs r0, #0
	cmp r5, #2
	bne _0807E566
	movs r0, #1
_0807E566:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807E56C
sub_807E56C: @ 0x0807E56C
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E58E
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E5A0
	movs r3, #0xa0
	lsls r3, r3, #2
	b _0807E5A0
_0807E58E:
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E5A0
	movs r3, #0x80
_0807E5A0:
	adds r4, r2, #0
	adds r4, #0x6a
	ldrh r0, [r4]
	adds r1, r3, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0
	bge _0807E5BC
	rsbs r1, r0, #0
_0807E5BC:
	cmp r1, #4
	ble _0807E5D0
	ldr r2, _0807E5CC @ =0x0000FFFC
	cmp r0, #0
	ble _0807E5D8
	movs r2, #4
	b _0807E5D8
	.align 2, 0
_0807E5CC: .4byte 0x0000FFFC
_0807E5D0:
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_0807E5D8:
	ldrh r0, [r4]
	adds r0, r0, r2
	ldr r2, _0807E5EC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5EC: .4byte 0x000003FF

	thumb_func_start sub_807E5F0
sub_807E5F0: @ 0x0807E5F0
	push {r4, lr}
	sub sp, #0xc
	mov ip, r0
	mov r4, ip
	adds r4, #0x30
	ldr r3, [r0, #0x60]
	ldr r1, _0807E660 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r3, r3, r0
	strh r3, [r4, #0x16]
	mov r0, ip
	ldr r2, [r0, #0x64]
	ldr r0, [r1, #4]
	subs r2, r2, r0
	strh r2, [r4, #0x18]
	mov r1, sp
	mov r0, ip
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	ldr r2, _0807E664 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0807E668 @ =0x00002060
	orrs r1, r0
	str r1, [r4, #0x10]
	mov r0, ip
	adds r0, #0x68
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E64A
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	str r1, [r4, #0x10]
_0807E64A:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8004860
	adds r0, r4, #0
	bl sub_80051E8
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E660: .4byte gUnknown_03005960
_0807E664: .4byte gUnknown_030054B8
_0807E668: .4byte 0x00002060

	thumb_func_start sub_807E66C
sub_807E66C: @ 0x0807E66C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r3, #0
	adds r6, #0x30
	ldr r0, _0807E758 @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E764
	adds r0, r3, #0
	adds r0, #0x68
	ldrh r0, [r0]
	ldr r0, [r3, #0x60]
	ldr r2, _0807E75C @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r3, #0x64]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r1, r2, #0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r3, r0, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, _0807E760 @ =gUnknown_03005AF0
	adds r0, r1, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r2, r5
	mov ip, r1
	cmp r3, r2
	bgt _0807E6F4
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0807E706
	cmp r3, r2
	blt _0807E764
_0807E6F4:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	blt _0807E764
_0807E706:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r3, ip
	adds r3, #0x39
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r0, r3
	cmp r1, r2
	bgt _0807E740
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0807E752
	cmp r1, r2
	blt _0807E764
_0807E740:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _0807E764
_0807E752:
	movs r0, #1
	b _0807E766
	.align 2, 0
_0807E758: .4byte gUnknown_030059E0
_0807E75C: .4byte gUnknown_03005960
_0807E760: .4byte gUnknown_03005AF0
_0807E764:
	movs r0, #0
_0807E766:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807E770
sub_807E770: @ 0x0807E770
	push {r4, lr}
	ldr r0, _0807E7A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807E66C
	cmp r0, #0
	beq _0807E78E
	adds r0, r4, #0
	bl sub_807E384
_0807E78E:
	adds r0, r4, #0
	bl sub_807E898
	cmp r0, #0
	beq _0807E7A4
	adds r0, r4, #0
	bl sub_807E8E0
	b _0807E7AA
	.align 2, 0
_0807E7A0: .4byte gCurTask
_0807E7A4:
	adds r0, r4, #0
	bl sub_807E5F0
_0807E7AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E7B0
sub_807E7B0: @ 0x0807E7B0
	push {r4, lr}
	ldr r0, _0807E7D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807E7D8 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807E7DC
	adds r0, r4, #0
	bl sub_807E86C
	b _0807E7EC
	.align 2, 0
_0807E7D4: .4byte gCurTask
_0807E7D8: .4byte gUnknown_030059E0
_0807E7DC:
	adds r0, r4, #0
	bl sub_807E4E4
	cmp r0, #0
	beq _0807E7EC
	adds r0, r4, #0
	bl sub_807E834
_0807E7EC:
	adds r0, r4, #0
	bl sub_807E5F0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E7F8
sub_807E7F8: @ 0x0807E7F8
	push {r4, lr}
	ldr r0, _0807E82C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x6e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r2, r0, #1
	strh r2, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0807E81E
	adds r0, r4, #0
	bl sub_807E884
_0807E81E:
	adds r0, r4, #0
	bl sub_807E5F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E82C: .4byte gCurTask

	thumb_func_start sub_807E830
sub_807E830: @ 0x0807E830
	bx lr
	.align 2, 0

	thumb_func_start sub_807E834
sub_807E834: @ 0x0807E834
	push {lr}
	adds r2, r0, #0
	adds r0, #0x6c
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	subs r0, #4
	ldrh r1, [r0]
	cmp r1, #0
	bne _0807E84E
	adds r0, #6
	strh r1, [r0]
	b _0807E856
_0807E84E:
	adds r1, r2, #0
	adds r1, #0x6e
	movs r0, #1
	strh r0, [r1]
_0807E856:
	ldr r0, _0807E864 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E868 @ =sub_807E314
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807E864: .4byte gCurTask
_0807E868: .4byte sub_807E314

	thumb_func_start sub_807E86C
sub_807E86C: @ 0x0807E86C
	adds r0, #0x6e
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807E87C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E880 @ =sub_807E7F8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E87C: .4byte gCurTask
_0807E880: .4byte sub_807E7F8

	thumb_func_start sub_807E884
sub_807E884: @ 0x0807E884
	ldr r0, _0807E890 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E894 @ =sub_807E8FC
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E890: .4byte gCurTask
_0807E894: .4byte sub_807E8FC

	thumb_func_start sub_807E898
sub_807E898: @ 0x0807E898
	push {lr}
	ldr r1, [r0, #0x60]
	ldr r3, _0807E8D4 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x64]
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
	bhi _0807E8D0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807E8D0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807E8D8
_0807E8D0:
	movs r0, #1
	b _0807E8DA
	.align 2, 0
_0807E8D4: .4byte gUnknown_03005960
_0807E8D8:
	movs r0, #0
_0807E8DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E8E0
sub_807E8E0: @ 0x0807E8E0
	push {lr}
	ldr r1, [r0, #0x70]
	adds r0, #0x74
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807E8F8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807E8F8: .4byte gCurTask

	thumb_func_start sub_807E8FC
sub_807E8FC: @ 0x0807E8FC
	push {r4, lr}
	ldr r0, _0807E930 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807E954
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807E91C
	adds r0, r4, #0
	bl sub_807E940
_0807E91C:
	adds r0, r4, #0
	bl sub_807E898
	cmp r0, #0
	beq _0807E934
	adds r0, r4, #0
	bl sub_807E8E0
	b _0807E93A
	.align 2, 0
_0807E930: .4byte gCurTask
_0807E934:
	adds r0, r4, #0
	bl sub_807E5F0
_0807E93A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E940
sub_807E940: @ 0x0807E940
	ldr r0, _0807E94C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E950 @ =sub_807E770
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E94C: .4byte gCurTask
_0807E950: .4byte sub_807E770

	thumb_func_start sub_807E954
sub_807E954: @ 0x0807E954
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0
	cmp r0, #0
	bne _0807E968
	movs r1, #0x80
	lsls r1, r1, #2
_0807E968:
	adds r4, #0x6a
	ldrh r0, [r4]
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0
	bge _0807E980
	rsbs r1, r0, #0
_0807E980:
	cmp r1, #4
	ble _0807E994
	ldr r2, _0807E990 @ =0x0000FFFC
	cmp r0, #0
	ble _0807E996
	movs r2, #4
	b _0807E996
	.align 2, 0
_0807E990: .4byte 0x0000FFFC
_0807E994:
	movs r5, #1
_0807E996:
	ldrh r0, [r4]
	adds r0, r0, r2
	ldr r2, _0807E9AC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4]
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807E9AC: .4byte 0x000003FF

	thumb_func_start sub_807E9B0
sub_807E9B0: @ 0x0807E9B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r0, _0807EA78 @ =sub_807EC38
	ldr r2, _0807EA7C @ =0x00002010
	ldr r1, _0807EA80 @ =sub_807ECB4
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sl, r0
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sl
	mov r0, r8
	ldrb r6, [r0]
	lsls r6, r6, #3
	lsls r4, r4, #8
	adds r6, r6, r4
	str r6, [r2]
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	mov sb, r1
	lsls r5, r5, #8
	add sb, r5
	mov r3, sb
	str r3, [r2, #4]
	movs r4, #3
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r0, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r0, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	ldrb r0, [r0, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r6
	str r0, [r2, #0x14]
	movs r5, #0xa
	ldrsh r0, [r2, r5]
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, sb
	str r0, [r2, #0x18]
	mov r5, r8
	str r5, [r2, #0x20]
	ldrb r1, [r5]
	ldr r0, _0807EA84 @ =IWRAM_START + 0x24
	add r0, sl
	strb r1, [r0]
	ldr r0, _0807EA88 @ =IWRAM_START + 0x25
	add sl, r0
	mov r1, sl
	strb r7, [r1]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA78: .4byte sub_807EC38
_0807EA7C: .4byte 0x00002010
_0807EA80: .4byte sub_807ECB4
_0807EA84: .4byte IWRAM_START + 0x24
_0807EA88: .4byte IWRAM_START + 0x25

	thumb_func_start sub_807EA8C
sub_807EA8C: @ 0x0807EA8C
	push {r4, lr}
	ldr r0, _0807EAB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r1, _0807EAB4 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r3, #0x80
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq _0807EAB8
	adds r0, r4, #0
	bl sub_807ED68
	b _0807EB40
	.align 2, 0
_0807EAB0: .4byte gCurTask
_0807EAB4: .4byte gUnknown_030059E0
_0807EAB8:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _0807EAC8
	adds r0, r4, #0
	bl sub_807ED88
	b _0807EB40
_0807EAC8:
	ldr r0, _0807EADC @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807EAE4
	ldr r0, [r2, #0xc]
	ldr r1, _0807EAE0 @ =0xFFFFFF00
	b _0807EAEA
	.align 2, 0
_0807EADC: .4byte gUnknown_03005424
_0807EAE0: .4byte 0xFFFFFF00
_0807EAE4:
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
_0807EAEA:
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0807EB1C @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807EB20
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0807EB12
	movs r0, #1
_0807EB12:
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl sub_807EB48
	b _0807EB30
	.align 2, 0
_0807EB1C: .4byte gUnknown_03005B38
_0807EB20:
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	bne _0807EB30
	adds r0, r4, #0
	bl sub_807ED00
_0807EB30:
	adds r0, r4, #0
	bl sub_807EDB8
	cmp r0, #0
	beq _0807EB40
	adds r0, r4, #0
	bl sub_807EE1C
_0807EB40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EB48
sub_807EB48: @ 0x0807EB48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0807EB6C @ =gUnknown_030059E0
	ldr r3, [r1, #0x20]
	movs r0, #0x80
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _0807EBA4
	ldr r1, _0807EB70 @ =0xFFBFFFFF
	ands r1, r3
	str r1, [r2, #0x20]
	ldr r3, [r4, #0x1c]
	cmp r3, #0
	beq _0807EB74
	movs r0, #1
	orrs r1, r0
	b _0807EB7A
	.align 2, 0
_0807EB6C: .4byte gUnknown_030059E0
_0807EB70: .4byte 0xFFBFFFFF
_0807EB74:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
_0807EB7A:
	str r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #4
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	cmp r3, #0
	beq _0807EB96
	movs r0, #0xfb
	lsls r0, r0, #8
	b _0807EB9A
_0807EB96:
	movs r0, #0xa0
	lsls r0, r0, #3
_0807EB9A:
	strh r0, [r2, #0x10]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
_0807EBA4:
	ldr r0, _0807EBB4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807EBB8 @ =sub_807EC70
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBB4: .4byte gCurTask
_0807EBB8: .4byte sub_807EC70

	thumb_func_start sub_807EBBC
sub_807EBBC: @ 0x0807EBBC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0807EC28 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807EC30
	ldr r2, [r5]
	ldrh r0, [r5, #8]
	adds r2, r2, r0
	ldr r3, _0807EC2C @ =gUnknown_03005960
	ldr r4, [r3]
	subs r2, r2, r4
	ldr r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldr r3, [r3, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _0807EC30
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r0, r1
	blt _0807EC30
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807EC30
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r0, r1
	blt _0807EC30
	movs r0, #1
	b _0807EC32
	.align 2, 0
_0807EC28: .4byte gUnknown_030059E0
_0807EC2C: .4byte gUnknown_03005960
_0807EC30:
	movs r0, #0
_0807EC32:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807EC38
sub_807EC38: @ 0x0807EC38
	push {r4, lr}
	ldr r0, _0807EC6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	beq _0807EC56
	adds r0, r4, #0
	bl sub_807ECB8
_0807EC56:
	adds r0, r4, #0
	bl sub_807EDB8
	cmp r0, #0
	beq _0807EC66
	adds r0, r4, #0
	bl sub_807EE1C
_0807EC66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC6C: .4byte gCurTask

	thumb_func_start sub_807EC70
sub_807EC70: @ 0x0807EC70
	push {r4, lr}
	ldr r0, _0807EC90 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807EC94 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807EC9C
	ldr r0, _0807EC98 @ =sub_807EC38
	str r0, [r2, #8]
	b _0807ECAC
	.align 2, 0
_0807EC90: .4byte gCurTask
_0807EC94: .4byte gUnknown_030059E0
_0807EC98: .4byte sub_807EC38
_0807EC9C:
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	bne _0807ECAC
	adds r0, r4, #0
	bl sub_807ED48
_0807ECAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807ECB4
sub_807ECB4: @ 0x0807ECB4
	bx lr
	.align 2, 0

	thumb_func_start sub_807ECB8
sub_807ECB8: @ 0x0807ECB8
	push {r4, lr}
	ldr r3, _0807ECF4 @ =gUnknown_030059E0
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xf
	orrs r1, r2
	str r1, [r3, #0x20]
	adds r4, r3, #0
	adds r4, #0x64
	movs r2, #0
	movs r1, #0x42
	strh r1, [r4]
	ldr r0, [r0, #0x14]
	lsls r0, r0, #8
	str r0, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x10]
	strh r2, [r3, #0x12]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807ECF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ECFC @ =sub_807EA8C
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ECF4: .4byte gUnknown_030059E0
_0807ECF8: .4byte gCurTask
_0807ECFC: .4byte sub_807EA8C

	thumb_func_start sub_807ED00
sub_807ED00: @ 0x0807ED00
	push {lr}
	ldr r2, _0807ED38 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807ED2C
	ldr r0, _0807ED3C @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, #0xfb
	strh r0, [r2, #0x12]
	adds r0, #0x22
	bl m4aSongNumStop
_0807ED2C:
	ldr r0, _0807ED40 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED44 @ =sub_807EC38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED38: .4byte gUnknown_030059E0
_0807ED3C: .4byte 0xFFBFFFFF
_0807ED40: .4byte gCurTask
_0807ED44: .4byte sub_807EC38

	thumb_func_start sub_807ED48
sub_807ED48: @ 0x0807ED48
	push {lr}
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807ED60 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED64 @ =sub_807EC38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED60: .4byte gCurTask
_0807ED64: .4byte sub_807EC38

	thumb_func_start sub_807ED68
sub_807ED68: @ 0x0807ED68
	push {lr}
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807ED80 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED84 @ =sub_807EC38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED80: .4byte gCurTask
_0807ED84: .4byte sub_807EC38

	thumb_func_start sub_807ED88
sub_807ED88: @ 0x0807ED88
	push {lr}
	ldr r2, _0807EDA8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _0807EDAC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807EDB0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807EDB4 @ =sub_807EC70
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807EDA8: .4byte gUnknown_030059E0
_0807EDAC: .4byte 0xFFBFFFFF
_0807EDB0: .4byte gCurTask
_0807EDB4: .4byte sub_807EC70

	thumb_func_start sub_807EDB8
sub_807EDB8: @ 0x0807EDB8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _0807EE10 @ =gUnknown_03005960
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
	blt _0807EE0A
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807EE0A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807EE0A
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807EE14
_0807EE0A:
	movs r0, #1
	b _0807EE16
	.align 2, 0
_0807EE10: .4byte gUnknown_03005960
_0807EE14:
	movs r0, #0
_0807EE16:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807EE1C
sub_807EE1C: @ 0x0807EE1C
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807EE34 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807EE34: .4byte gCurTask

	thumb_func_start sub_807EE38
sub_807EE38: @ 0x0807EE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807EF08 @ =sub_807F078
	ldr r2, _0807EF0C @ =0x00002010
	ldr r1, _0807EF10 @ =sub_807F0C4
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sb, r0
	movs r2, #0
	str r2, [r0, #0x44]
	str r2, [r0, #0x48]
	mov r1, sl
	str r1, [r0]
	movs r3, #0
	mov r8, r3
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	ldrb r0, [r1]
	mov r1, sb
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	ldr r3, _0807EF14 @ =IWRAM_START + 0xC
	adds r4, r7, r3
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _0807EF18 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r3, #0x22
	adds r1, r7, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807EF1C @ =IWRAM_START + 0x31
	adds r0, r7, r1
	mov r3, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x12
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807EF20 @ =0x0000026A
	strh r0, [r4, #0xa]
	ldr r1, _0807EF24 @ =IWRAM_START + 0x2C
	adds r0, r7, r1
	mov r3, r8
	strb r3, [r0]
	adds r0, r4, #0
	bl sub_8004558
	mov r1, sl
	ldrb r0, [r1, #5]
	ldr r2, [sp, #4]
	ldrb r3, [r1, #6]
	cmp r0, r3
	bls _0807EF54
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0807EF34
	ldr r0, _0807EF28 @ =IWRAM_START + 0x4C
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF2C @ =IWRAM_START + 0x4E
	adds r0, r7, r1
	strh r2, [r0]
	ldr r3, _0807EF30 @ =IWRAM_START + 0x50
	adds r0, r7, r3
	strh r2, [r0]
	b _0807EF96
	.align 2, 0
_0807EF08: .4byte sub_807F078
_0807EF0C: .4byte 0x00002010
_0807EF10: .4byte sub_807F0C4
_0807EF14: .4byte IWRAM_START + 0xC
_0807EF18: .4byte IWRAM_START + 0x2D
_0807EF1C: .4byte IWRAM_START + 0x31
_0807EF20: .4byte 0x0000026A
_0807EF24: .4byte IWRAM_START + 0x2C
_0807EF28: .4byte IWRAM_START + 0x4C
_0807EF2C: .4byte IWRAM_START + 0x4E
_0807EF30: .4byte IWRAM_START + 0x50
_0807EF34:
	ldr r0, _0807EF48 @ =IWRAM_START + 0x4C
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF4C @ =IWRAM_START + 0x4E
	adds r0, r7, r1
	strh r2, [r0]
	ldr r3, _0807EF50 @ =IWRAM_START + 0x50
	b _0807EF90
	.align 2, 0
_0807EF48: .4byte IWRAM_START + 0x4C
_0807EF4C: .4byte IWRAM_START + 0x4E
_0807EF50: .4byte IWRAM_START + 0x50
_0807EF54:
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0807EF80
	ldr r3, _0807EF74 @ =IWRAM_START + 0x4C
	adds r0, r7, r3
	strh r2, [r0]
	ldr r0, _0807EF78 @ =IWRAM_START + 0x4E
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF7C @ =IWRAM_START + 0x50
	adds r0, r7, r1
	strh r2, [r0]
	b _0807EF96
	.align 2, 0
_0807EF74: .4byte IWRAM_START + 0x4C
_0807EF78: .4byte IWRAM_START + 0x4E
_0807EF7C: .4byte IWRAM_START + 0x50
_0807EF80:
	ldr r3, _0807EFBC @ =IWRAM_START + 0x4C
	adds r0, r7, r3
	strh r2, [r0]
	ldr r0, _0807EFC0 @ =IWRAM_START + 0x4E
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	adds r3, #4
_0807EF90:
	adds r1, r7, r3
	movs r0, #0x80
	strh r0, [r1]
_0807EF96:
	mov r0, sb
	bl sub_807EFC4
	mov r0, sb
	bl sub_807F0D8
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sl
	strb r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFBC: .4byte IWRAM_START + 0x4C
_0807EFC0: .4byte IWRAM_START + 0x4E

	thumb_func_start sub_807EFC4
sub_807EFC4: @ 0x0807EFC4
	push {r4, r5, r6, lr}
	mov ip, r0
	ldr r6, [r0]
	mov r1, ip
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807F004
	ldrb r3, [r6, #5]
	lsls r3, r3, #0xb
	ldr r5, _0807F06C @ =gSineTable
	adds r4, r0, #0
	ldr r2, _0807F070 @ =gUnknown_03005590
	mov r0, ip
	adds r0, #0x50
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _0807F074 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x44]
_0807F004:
	mov r1, ip
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807F03E
	ldrb r3, [r6, #6]
	lsls r3, r3, #0xb
	ldr r5, _0807F06C @ =gSineTable
	adds r4, r0, #0
	ldr r2, _0807F070 @ =gUnknown_03005590
	mov r0, ip
	adds r0, #0x50
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _0807F074 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x48]
_0807F03E:
	mov r0, ip
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r2, ip
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldrb r1, [r6, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F06C: .4byte gSineTable
_0807F070: .4byte gUnknown_03005590
_0807F074: .4byte 0x000003FF

	thumb_func_start sub_807F078
sub_807F078: @ 0x0807F078
	push {r4, lr}
	ldr r0, _0807F0B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807EFC4
	adds r0, r4, #0
	bl sub_807F17C
	cmp r0, #0
	beq _0807F09C
	ldr r0, _0807F0B4 @ =gUnknown_030059E0
	bl sub_800CBA4
_0807F09C:
	adds r0, r4, #0
	bl sub_807F120
	cmp r0, #0
	beq _0807F0B8
	adds r0, r4, #0
	bl sub_807F1B4
	b _0807F0BE
	.align 2, 0
_0807F0B0: .4byte gCurTask
_0807F0B4: .4byte gUnknown_030059E0
_0807F0B8:
	adds r0, r4, #0
	bl sub_807F0D8
_0807F0BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807F0C4
sub_807F0C4: @ 0x0807F0C4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807F0D8
sub_807F0D8: @ 0x0807F0D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	ldr r2, _0807F118 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, [r4, #0x40]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	ldr r0, [r4, #0x1c]
	ldr r1, _0807F11C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x1c]
	adds r5, r4, #0
	adds r5, #0xc
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, [r4, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x1c]
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F118: .4byte gUnknown_03005960
_0807F11C: .4byte 0xFFFFFBFF

	thumb_func_start sub_807F120
sub_807F120: @ 0x0807F120
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _0807F170 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r0, [r4, #5]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _0807F16A
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _0807F16A
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _0807F16A
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	ble _0807F174
_0807F16A:
	movs r0, #1
	b _0807F176
	.align 2, 0
_0807F170: .4byte gUnknown_03005960
_0807F174:
	movs r0, #0
_0807F176:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807F17C
sub_807F17C: @ 0x0807F17C
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807F1A8 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F1A2
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	bl sub_800DF38
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _0807F1AC
_0807F1A2:
	movs r0, #0
	b _0807F1AE
	.align 2, 0
_0807F1A8: .4byte gUnknown_030059E0
_0807F1AC:
	movs r0, #1
_0807F1AE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807F1B4
sub_807F1B4: @ 0x0807F1B4
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807F1C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807F1C8: .4byte gCurTask

	thumb_func_start sub_807F1CC
sub_807F1CC: @ 0x0807F1CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov sl, r6
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _0807F32C @ =sub_807F694
	ldr r2, _0807F330 @ =0x00002010
	ldr r1, _0807F334 @ =sub_807F75C
	str r1, [sp]
	movs r1, #0x84
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r3, _0807F338 @ =IWRAM_START + 0x68
	adds r0, r2, r3
	movs r6, #0
	mov ip, r6
	mov r1, ip
	strb r1, [r0]
	subs r3, #0xc
	adds r0, r2, r3
	mov r6, ip
	strh r6, [r0]
	ldr r1, _0807F33C @ =IWRAM_START + 0x5E
	adds r0, r2, r1
	strh r6, [r0]
	mov r3, ip
	str r3, [r7, #0x60]
	ldrb r0, [r5]
	lsls r0, r0, #3
	mov r6, sl
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r7, #0x3c]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r7, #0x40]
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r6, _0807F340 @ =IWRAM_START + 0x54
	adds r1, r2, r6
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r3, _0807F344 @ =IWRAM_START + 0x56
	adds r4, r2, r3
	strh r0, [r4]
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	ldrh r6, [r1]
	adds r0, r0, r6
	ldr r6, _0807F348 @ =IWRAM_START + 0x58
	adds r3, r2, r6
	strh r0, [r3]
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r4, [r4]
	adds r0, r0, r4
	adds r6, #2
	adds r4, r2, r6
	strh r0, [r4]
	movs r6, #0
	ldrsh r0, [r1, r6]
	movs r6, #0
	ldrsh r1, [r3, r6]
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r7, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r7, #0x44]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	mov r1, ip
	str r1, [r7, #0x4c]
	str r1, [r7, #0x50]
	mov r3, sl
	strh r3, [r7, #4]
	mov r6, r8
	strh r6, [r7, #6]
	str r5, [r7]
	ldrb r0, [r5]
	strb r0, [r7, #8]
	mov r0, sb
	strb r0, [r7, #9]
	movs r1, #0
	ldr r3, _0807F34C @ =IWRAM_START + 0x6C
	adds r2, r2, r3
_0807F2B6:
	ldr r0, [r7, #0x44]
	str r0, [r2]
	ldr r0, [r7, #0x48]
	str r0, [r2, #4]
	adds r2, #8
	adds r1, #1
	cmp r1, #2
	bls _0807F2B6
	adds r4, r7, #0
	adds r4, #0xc
	movs r6, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x19
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x94
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r6, [r0]
	adds r0, r4, #0
	bl sub_8004558
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F32C: .4byte sub_807F694
_0807F330: .4byte 0x00002010
_0807F334: .4byte sub_807F75C
_0807F338: .4byte IWRAM_START + 0x68
_0807F33C: .4byte IWRAM_START + 0x5E
_0807F340: .4byte IWRAM_START + 0x54
_0807F344: .4byte IWRAM_START + 0x56
_0807F348: .4byte IWRAM_START + 0x58
_0807F34C: .4byte IWRAM_START + 0x6C

	thumb_func_start sub_807F350
sub_807F350: @ 0x0807F350
	push {r4, r5, lr}
	ldr r0, _0807F388 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807F38C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F36C
	adds r0, r4, #0
	bl sub_807F8B4
_0807F36C:
	adds r0, r4, #0
	bl sub_807F818
	ldr r3, _0807F390 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807F394
	adds r0, r4, #0
	bl sub_807F770
	b _0807F3DC
	.align 2, 0
_0807F388: .4byte gCurTask
_0807F38C: .4byte gGameMode
_0807F390: .4byte gUnknown_030059E0
_0807F394:
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	cmp r0, #0x78
	bne _0807F3A4
	adds r0, r4, #0
	bl sub_807F798
	b _0807F3DC
_0807F3A4:
	ldr r1, _0807F408 @ =IWRAM_START + 0x69
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _0807F3E8
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0807F40C @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807F3DC
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0807F3D4
	movs r0, #1
_0807F3D4:
	str r0, [r4, #0x64]
	adds r0, r4, #0
	bl sub_807F484
_0807F3DC:
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807F3EE
_0807F3E8:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0807F3EE:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F7D0
	adds r0, r4, #0
	bl sub_807F5C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F408: .4byte IWRAM_START + 0x69
_0807F40C: .4byte gUnknown_03005B38

	thumb_func_start sub_807F410
sub_807F410: @ 0x0807F410
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0807F470 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #0x37
	strh r0, [r1]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x10]
	strh r5, [r2, #0x12]
	adds r0, r4, #0
	bl sub_807F7D0
	movs r0, #1
	str r0, [r4, #0x60]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0807F474 @ =0x0000FE80
	strh r0, [r1]
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x48]
	str r5, [r4, #0x4c]
	str r5, [r4, #0x50]
	adds r4, #0x69
	movs r0, #0x1e
	strb r0, [r4]
	ldr r0, _0807F478 @ =0x00000123
	bl m4aSongNumStart
	ldr r0, _0807F47C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F480 @ =sub_807F350
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F470: .4byte gUnknown_030059E0
_0807F474: .4byte 0x0000FE80
_0807F478: .4byte 0x00000123
_0807F47C: .4byte gCurTask
_0807F480: .4byte sub_807F350

	thumb_func_start sub_807F484
sub_807F484: @ 0x0807F484
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0807F4DC @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	ldr r1, _0807F4E0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x10]
	strh r2, [r4, #0x12]
	adds r5, #0x69
	movs r0, #0x1e
	strb r0, [r5]
	ldr r0, _0807F4E4 @ =0x00000123
	bl m4aSongNumStop
	ldr r0, _0807F4E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F4EC @ =sub_807F6F0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4DC: .4byte gUnknown_030059E0
_0807F4E0: .4byte 0xFFBFFFFF
_0807F4E4: .4byte 0x00000123
_0807F4E8: .4byte gCurTask
_0807F4EC: .4byte sub_807F6F0

	thumb_func_start sub_807F4F0
sub_807F4F0: @ 0x0807F4F0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x60]
	cmp r0, #0
	beq _0807F58A
	adds r2, r3, #0
	adds r2, #0x56
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3, #0x48]
	adds r5, r2, #0
	adds r4, r3, #0
	adds r4, #0x5e
	cmp r1, r0
	bgt _0807F540
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0807F540
	ldr r1, _0807F53C @ =gSineTable
	adds r2, #0x12
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r3, #0x50]
	ldrb r0, [r2]
	adds r0, #4
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4]
	b _0807F5B6
	.align 2, 0
_0807F53C: .4byte gSineTable
_0807F540:
	adds r1, r4, #0
	ldrh r0, [r1]
	adds r0, #0x10
	strh r0, [r1]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0807F558
	adds r2, r1, #0
_0807F558:
	strh r2, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r1, [r3, #0x48]
	subs r1, r1, r0
	str r1, [r3, #0x48]
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r0, [r3, #0x40]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807F5B6
	movs r0, #0
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	adds r1, r3, #0
	adds r1, #0x68
	movs r0, #0x80
	b _0807F5B4
_0807F58A:
	adds r0, r3, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	ldr r2, _0807F5BC @ =gSineTable
	adds r1, r3, #0
	adds r1, #0x68
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r3, #0x50]
	ldrb r0, [r1]
	adds r0, #4
_0807F5B4:
	strb r0, [r1]
_0807F5B6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5BC: .4byte gSineTable

	thumb_func_start sub_807F5C0
sub_807F5C0: @ 0x0807F5C0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807F5E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F5E8
	ldr r0, [r3, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807F5E4 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x78]
	b _0807F5FE
	.align 2, 0
_0807F5E0: .4byte gGameMode
_0807F5E4: .4byte gUnknown_03005960
_0807F5E8:
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r2, _0807F618 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x48]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
_0807F5FE:
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F618: .4byte gUnknown_03005960

	thumb_func_start sub_807F61C
sub_807F61C: @ 0x0807F61C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0807F684 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F680
	ldr r3, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r3, r3, r0
	asrs r3, r3, #8
	ldr r2, _0807F688 @ =gUnknown_03005960
	ldr r5, [r2]
	subs r3, r3, r5
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	asrs r1, r1, #8
	ldr r4, [r2, #4]
	subs r1, r1, r4
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r5
	ldr r2, [r6, #0xc]
	asrs r2, r2, #8
	subs r2, r2, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r3, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r1, r1, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r1, r0
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	ble _0807F68C
_0807F680:
	movs r0, #0
	b _0807F68E
	.align 2, 0
_0807F684: .4byte gUnknown_030059E0
_0807F688: .4byte gUnknown_03005960
_0807F68C:
	movs r0, #1
_0807F68E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807F694
sub_807F694: @ 0x0807F694
	push {r4, lr}
	ldr r0, _0807F6D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807F6D8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F6B0
	adds r0, r4, #0
	bl sub_807F8B4
_0807F6B0:
	adds r0, r4, #0
	bl sub_807F61C
	cmp r0, #0
	beq _0807F6C0
	adds r0, r4, #0
	bl sub_807F410
_0807F6C0:
	adds r0, r4, #0
	bl sub_807F828
	cmp r0, #0
	beq _0807F6DC
	adds r0, r4, #0
	bl sub_807F89C
	b _0807F6E8
	.align 2, 0
_0807F6D4: .4byte gCurTask
_0807F6D8: .4byte gGameMode
_0807F6DC:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F5C0
_0807F6E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F6F0
sub_807F6F0: @ 0x0807F6F0
	push {r4, r5, lr}
	ldr r0, _0807F734 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807F738 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F70C
	adds r0, r4, #0
	bl sub_807F8B4
_0807F70C:
	ldr r0, _0807F73C @ =IWRAM_START + 0x69
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807F744
	ldr r0, _0807F740 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F72C
	adds r0, r4, #0
	bl sub_807F61C
	cmp r0, #0
	bne _0807F748
_0807F72C:
	adds r0, r4, #0
	bl sub_807F784
	b _0807F748
	.align 2, 0
_0807F734: .4byte gCurTask
_0807F738: .4byte gGameMode
_0807F73C: .4byte IWRAM_START + 0x69
_0807F740: .4byte gUnknown_030059E0
_0807F744:
	subs r0, #1
	strb r0, [r1]
_0807F748:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F5C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F75C
sub_807F75C: @ 0x0807F75C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807F770
sub_807F770: @ 0x0807F770
	ldr r0, _0807F77C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F780 @ =sub_807F694
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807F77C: .4byte gCurTask
_0807F780: .4byte sub_807F694

	thumb_func_start sub_807F784
sub_807F784: @ 0x0807F784
	ldr r0, _0807F790 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F794 @ =sub_807F694
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807F790: .4byte gCurTask
_0807F794: .4byte sub_807F694

	thumb_func_start sub_807F798
sub_807F798: @ 0x0807F798
	push {lr}
	ldr r3, _0807F7BC @ =gUnknown_030059E0
	ldr r1, [r3, #0x20]
	ldr r2, _0807F7C0 @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r3, #0x20]
	adds r0, #0x69
	movs r1, #0x1e
	strb r1, [r0]
	ldr r0, _0807F7C4 @ =0x00000123
	bl m4aSongNumStop
	ldr r0, _0807F7C8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F7CC @ =sub_807F6F0
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807F7BC: .4byte gUnknown_030059E0
_0807F7C0: .4byte 0xFFBFFFFF
_0807F7C4: .4byte 0x00000123
_0807F7C8: .4byte gCurTask
_0807F7CC: .4byte sub_807F6F0

	thumb_func_start sub_807F7D0
sub_807F7D0: @ 0x0807F7D0
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807F7F0 @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	cmp r1, #0
	beq _0807F7F4
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807F7FC
	.align 2, 0
_0807F7F0: .4byte gUnknown_030059E0
_0807F7F4:
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	ldr r1, _0807F814 @ =0xFFFFFC00
_0807F7FC:
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, [r3, #0x48]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_0807F814: .4byte 0xFFFFFC00

	thumb_func_start sub_807F818
sub_807F818: @ 0x0807F818
	push {lr}
	ldr r0, _0807F824 @ =0x00000123
	bl m4aSongNumStartOrContinue
	pop {r0}
	bx r0
	.align 2, 0
_0807F824: .4byte 0x00000123

	thumb_func_start sub_807F828
sub_807F828: @ 0x0807F828
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807F890 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807F88A
	adds r0, r3, #0
	adds r0, #0x54
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807F88A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807F88A
	adds r0, r3, #0
	adds r0, #0x56
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807F894
_0807F88A:
	movs r0, #1
	b _0807F896
	.align 2, 0
_0807F890: .4byte gUnknown_03005960
_0807F894:
	movs r0, #0
_0807F896:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807F89C
sub_807F89C: @ 0x0807F89C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807F8B0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807F8B0: .4byte gCurTask

	thumb_func_start sub_807F8B4
sub_807F8B4: @ 0x0807F8B4
	ldr r1, [r0, #0x74]
	str r1, [r0, #0x7c]
	adds r2, r0, #0
	adds r2, #0x80
	ldr r1, [r0, #0x78]
	str r1, [r2]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x70]
	str r1, [r0, #0x78]
	ldr r1, [r0, #0x44]
	ldr r2, [r0, #0x4c]
	adds r1, r1, r2
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x48]
	ldr r2, [r0, #0x50]
	adds r1, r1, r2
	str r1, [r0, #0x70]
	bx lr
	.align 2, 0

	thumb_func_start sub_807F8DC
sub_807F8DC: @ 0x0807F8DC
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
	ldr r0, _0807F9D8 @ =sub_807FDCC
	ldr r2, _0807F9DC @ =0x00002010
	ldr r1, _0807F9E0 @ =sub_807FE20
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	movs r1, #0
	str r1, [r7, #0x54]
	ldr r3, _0807F9E4 @ =IWRAM_START + 0x58
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _0807F9E8 @ =IWRAM_START + 0x5E
	adds r1, r2, r0
	movs r0, #0x20
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r7, #0x3c]
	mov r3, r8
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r7, #0x40]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x44]
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [r7, #0x48]
	strh r4, [r7, #4]
	strh r5, [r7, #6]
	str r3, [r7]
	ldrb r0, [r3]
	strb r0, [r7, #8]
	strb r6, [r7, #9]
	movs r1, #0
	ldr r0, _0807F9EC @ =IWRAM_START + 0x60
	adds r2, r2, r0
_0807F964:
	ldr r0, [r7, #0x44]
	str r0, [r2]
	ldr r0, [r7, #0x48]
	str r0, [r2, #4]
	adds r2, #8
	adds r1, #1
	cmp r1, #2
	bls _0807F964
	adds r4, r7, #0
	adds r4, #0xc
	movs r5, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x99
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	strb r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F9D8: .4byte sub_807FDCC
_0807F9DC: .4byte 0x00002010
_0807F9E0: .4byte sub_807FE20
_0807F9E4: .4byte IWRAM_START + 0x58
_0807F9E8: .4byte IWRAM_START + 0x5E
_0807F9EC: .4byte IWRAM_START + 0x60

	thumb_func_start sub_807F9F0
sub_807F9F0: @ 0x0807F9F0
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0807FA74 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FA78 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FA0E
	adds r0, r4, #0
	bl sub_807FF04
_0807FA0E:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FA60
	ldr r1, _0807FA7C @ =IWRAM_START + 0x5A
	adds r0, r5, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _0807FA60
	ldr r1, [r4, #0x48]
	asrs r1, r1, #8
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r2, _0807FA80 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807FA60
	movs r3, #0
	str r3, [r4, #0x4c]
	ldr r2, _0807FA84 @ =gUnknown_030059E0
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	str r3, [r2, #0x3c]
_0807FA60:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FA88
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FA8E
	.align 2, 0
_0807FA74: .4byte gCurTask
_0807FA78: .4byte gGameMode
_0807FA7C: .4byte IWRAM_START + 0x5A
_0807FA80: .4byte sub_801EC3C
_0807FA84: .4byte gUnknown_030059E0
_0807FA88:
	adds r0, r4, #0
	bl sub_807FC20
_0807FA8E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807FA98
sub_807FA98: @ 0x0807FA98
	push {r4, lr}
	mov ip, r0
	ldr r0, _0807FB0C @ =0x00032E00
	mov r1, ip
	str r0, [r1, #0x44]
	movs r0, #0x90
	lsls r0, r0, #0xa
	str r0, [r1, #0x48]
	mov r4, ip
	adds r4, #0x5e
	movs r0, #0xe0
	strb r0, [r4]
	mov r2, ip
	adds r2, #0x5c
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r2]
	ldr r3, _0807FB10 @ =gSineTable
	ldrb r0, [r4]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x54]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807FB14 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FB18 @ =sub_807F9F0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB0C: .4byte 0x00032E00
_0807FB10: .4byte gSineTable
_0807FB14: .4byte gCurTask
_0807FB18: .4byte sub_807F9F0

	thumb_func_start sub_807FB1C
sub_807FB1C: @ 0x0807FB1C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807FB88
	adds r5, r4, #0
	adds r5, #0x5c
	ldrh r2, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0807FB3A
	adds r2, r1, #0
_0807FB3A:
	strh r2, [r5]
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _0807FB84 @ =gSineTable
	movs r0, #0x5e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r4, #0
	adds r2, #0x58
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r5, ip
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r3, r1, #0
	b _0807FBAA
	.align 2, 0
_0807FB84: .4byte gSineTable
_0807FB88:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	adds r5, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #4
	adds r3, r1, #0
	cmp r0, r2
	ble _0807FBA4
	adds r5, r2, #0
_0807FBA4:
	strh r5, [r3]
	adds r2, r4, #0
	adds r2, #0x58
_0807FBAA:
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4, #0x44]
	adds r6, r0, r1
	str r6, [r4, #0x44]
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r4, #0x48]
	adds r7, r0, r1
	str r7, [r4, #0x48]
	ldr r5, _0807FC1C @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807FC0C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FC0C
	adds r2, r4, #0
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	adds r0, r0, r6
	adds r1, r1, r0
	str r1, [r5, #8]
	adds r3, r4, #0
	adds r3, #0x52
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0x40]
	lsls r0, r0, #8
	adds r0, r0, r7
	adds r1, r1, r0
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	lsls r0, r0, #8
	subs r1, r1, r0
	str r1, [r5, #0xc]
	ldrh r0, [r5, #0x10]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r5, #0x12]
	ldrh r2, [r3]
	adds r0, r0, r2
	strh r0, [r3]
_0807FC0C:
	adds r0, r4, #0
	bl sub_807FC9C
	str r0, [r4, #0x4c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC1C: .4byte gUnknown_030059E0

	thumb_func_start sub_807FC20
sub_807FC20: @ 0x0807FC20
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807FC48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FC50
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC4C @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x6c]
	b _0807FC64
	.align 2, 0
_0807FC48: .4byte gGameMode
_0807FC4C: .4byte gUnknown_03005960
_0807FC50:
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC94 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x48]
_0807FC64:
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _0807FC98 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC94: .4byte gUnknown_03005960
_0807FC98: .4byte 0xFFFFFBFF

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 0x0807FC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FD04
	ldr r5, _0807FCC0 @ =gUnknown_030059E0
	ldr r1, [r5, #0x20]
	ldr r0, _0807FCC4 @ =0x01400082
	ands r0, r1
	cmp r0, #0
	beq _0807FCC8
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r0, #0
	str r0, [r5, #0x3c]
	b _0807FD06
	.align 2, 0
_0807FCC0: .4byte gUnknown_030059E0
_0807FCC4: .4byte 0x01400082
_0807FCC8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	beq _0807FCFC
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, _0807FD00 @ =gUnknown_03005960
	ldr r2, [r0]
	subs r1, r1, r2
	subs r1, #0x1b
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807FD04
	adds r0, r1, #0
	adds r0, #0x36
	cmp r0, r2
	blt _0807FD04
_0807FCFC:
	movs r0, #1
	b _0807FD06
	.align 2, 0
_0807FD00: .4byte gUnknown_03005960
_0807FD04:
	movs r0, #0
_0807FD06:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807FD0C
sub_807FD0C: @ 0x0807FD0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807FD58 @ =gUnknown_030059E0
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807FDC4
	adds r0, r4, #0
	adds r0, #0xc
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r3, [r4, #0x48]
	asrs r3, r3, #8
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807FDC4
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807FD5C
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807FDC6
	.align 2, 0
_0807FD58: .4byte gUnknown_030059E0
_0807FD5C:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807FD7E
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	b _0807FD9E
_0807FD7E:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807FDAA
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0807FD9E:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807FDC6
_0807FDAA:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807FDC4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #1
	b _0807FDC6
_0807FDC4:
	movs r0, #0
_0807FDC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807FDCC
sub_807FDCC: @ 0x0807FDCC
	push {r4, lr}
	ldr r0, _0807FE0C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FE10 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FDE8
	adds r0, r4, #0
	bl sub_807FF04
_0807FDE8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	bne _0807FDF8
	adds r0, r4, #0
	bl sub_807FE34
_0807FDF8:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FE14
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FE1A
	.align 2, 0
_0807FE0C: .4byte gCurTask
_0807FE10: .4byte gGameMode
_0807FE14:
	adds r0, r4, #0
	bl sub_807FC20
_0807FE1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807FE20
sub_807FE20: @ 0x0807FE20
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807FE34
sub_807FE34: @ 0x0807FE34
	push {r4, lr}
	mov ip, r0
	ldr r3, _0807FE84 @ =gUnknown_030059E0
	ldr r2, [r3, #8]
	ldr r1, [r0, #0x3c]
	lsls r1, r1, #8
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	subs r2, r2, r0
	mov r0, ip
	adds r0, #0x50
	strh r2, [r0]
	ldr r2, [r3, #0xc]
	mov r0, ip
	ldr r1, [r0, #0x40]
	lsls r1, r1, #8
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	subs r2, r2, r0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	lsls r0, r0, #8
	adds r2, r2, r0
	mov r0, ip
	adds r0, #0x52
	strh r2, [r0]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x4c]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807FE88 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FE8C @ =sub_807FF20
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE84: .4byte gUnknown_030059E0
_0807FE88: .4byte gCurTask
_0807FE8C: .4byte sub_807FF20

	thumb_func_start sub_807FE90
sub_807FE90: @ 0x0807FE90
	push {lr}
	ldr r2, [r0, #0x3c]
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	ldr r3, _0807FEE0 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r3, #4]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r2, r2, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _0807FEDA
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807FEDA
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807FEE4
_0807FEDA:
	movs r0, #1
	b _0807FEE6
	.align 2, 0
_0807FEE0: .4byte gUnknown_03005960
_0807FEE4:
	movs r0, #0
_0807FEE6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807FEEC
sub_807FEEC: @ 0x0807FEEC
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807FF00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gCurTask

	thumb_func_start sub_807FF04
sub_807FF04: @ 0x0807FF04
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x48]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start sub_807FF20
sub_807FF20: @ 0x0807FF20
	push {r4, r5, lr}
	ldr r0, _0807FF6C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FF70 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FF3C
	adds r0, r4, #0
	bl sub_807FF04
_0807FF3C:
	ldr r0, _0807FF74 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FF78 @ =0x00024DFF
	cmp r1, r0
	ble _0807FF5A
	adds r0, r4, #0
	bl sub_807FF88
_0807FF5A:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FF7C
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FF82
	.align 2, 0
_0807FF6C: .4byte gCurTask
_0807FF70: .4byte gGameMode
_0807FF74: .4byte IWRAM_START + 0x5C
_0807FF78: .4byte 0x00024DFF
_0807FF7C:
	adds r0, r4, #0
	bl sub_807FC20
_0807FF82:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807FF88
sub_807FF88: @ 0x0807FF88
	ldr r1, _0807FFA4 @ =0x00024E00
	str r1, [r0, #0x44]
	movs r1, #0x90
	lsls r1, r1, #0xa
	str r1, [r0, #0x48]
	adds r0, #0x5e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807FFA8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FFAC @ =sub_807FFB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807FFA4: .4byte 0x00024E00
_0807FFA8: .4byte gCurTask
_0807FFAC: .4byte sub_807FFB0

	thumb_func_start sub_807FFB0
sub_807FFB0: @ 0x0807FFB0
	push {r4, lr}
	ldr r0, _0807FFF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FFF8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FFCC
	adds r0, r4, #0
	bl sub_807FF04
_0807FFCC:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FFFC @ =0x00032DFF
	cmp r1, r0
	ble _0807FFE0
	adds r0, r4, #0
	bl sub_807FA98
_0807FFE0:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _08080000
	adds r0, r4, #0
	bl sub_807FEEC
	b _08080006
	.align 2, 0
_0807FFF4: .4byte gCurTask
_0807FFF8: .4byte gGameMode
_0807FFFC: .4byte 0x00032DFF
_08080000:
	adds r0, r4, #0
	bl sub_807FC20
_08080006:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808000C
sub_808000C: @ 0x0808000C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sl, r3
	ldr r6, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080800C0 @ =sub_80801F8
	ldr r2, _080800C4 @ =0x00002010
	ldr r1, _080800C8 @ =sub_8080230
	str r1, [sp]
	movs r1, #0x2c
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sb
	strh r6, [r2, #0x14]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	str r5, [r2, #0x24]
	ldrb r1, [r5]
	ldr r0, _080800CC @ =IWRAM_START + 0x28
	add r0, sb
	strb r1, [r0]
	ldr r0, _080800D0 @ =IWRAM_START + 0x29
	add sb, r0
	mov r5, sl
	mov r1, sb
	strb r5, [r1]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800C0: .4byte sub_80801F8
_080800C4: .4byte 0x00002010
_080800C8: .4byte sub_8080230
_080800CC: .4byte IWRAM_START + 0x28
_080800D0: .4byte IWRAM_START + 0x29

	thumb_func_start sub_80800D4
sub_80800D4: @ 0x080800D4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x14]
	cmp r0, #1
	beq _08080104
	cmp r0, #1
	bgt _080800E8
	cmp r0, #0
	beq _080800EE
	b _0808015E
_080800E8:
	cmp r0, #2
	beq _08080114
	b _0808015E
_080800EE:
	ldr r2, _080800FC @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08080100 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	b _0808015E
	.align 2, 0
_080800FC: .4byte gUnknown_03005424
_08080100: .4byte 0x0000FF7F
_08080104:
	ldr r0, _08080110 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	b _0808015C
	.align 2, 0
_08080110: .4byte gUnknown_03005424
_08080114:
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	cmp r1, #0
	ble _08080126
	ldr r0, _0808016C @ =gUnknown_030059E0
	movs r3, #0x10
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bgt _08080154
_08080126:
	cmp r1, #0
	bge _08080134
	ldr r0, _0808016C @ =gUnknown_030059E0
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08080154
_08080134:
	movs r3, #0x1a
	ldrsh r1, [r2, r3]
	cmp r1, #0
	ble _08080146
	ldr r0, _0808016C @ =gUnknown_030059E0
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bgt _08080154
_08080146:
	cmp r1, #0
	bge _0808015E
	ldr r0, _0808016C @ =gUnknown_030059E0
	movs r3, #0x12
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0808015E
_08080154:
	ldr r0, _08080170 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	eors r1, r2
_0808015C:
	strh r1, [r0]
_0808015E:
	ldr r0, _08080174 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080178 @ =sub_80801F8
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0808016C: .4byte gUnknown_030059E0
_08080170: .4byte gUnknown_03005424
_08080174: .4byte gCurTask
_08080178: .4byte sub_80801F8

	thumb_func_start sub_808017C
sub_808017C: @ 0x0808017C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _080801E8 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080801F0
	ldr r2, [r5]
	ldrh r0, [r5, #8]
	adds r2, r2, r0
	ldr r3, _080801EC @ =gUnknown_03005960
	ldr r4, [r3]
	subs r2, r2, r4
	ldr r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldr r3, [r3, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _080801F0
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r0, r1
	blt _080801F0
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _080801F0
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r0, r1
	blt _080801F0
	movs r0, #1
	b _080801F2
	.align 2, 0
_080801E8: .4byte gUnknown_030059E0
_080801EC: .4byte gUnknown_03005960
_080801F0:
	movs r0, #0
_080801F2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80801F8
sub_80801F8: @ 0x080801F8
	push {r4, lr}
	ldr r0, _0808022C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_808017C
	cmp r0, #0
	beq _08080216
	adds r0, r4, #0
	bl sub_8080234
_08080216:
	adds r0, r4, #0
	bl sub_8080254
	cmp r0, #0
	beq _08080226
	adds r0, r4, #0
	bl sub_808029C
_08080226:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808022C: .4byte gCurTask

	thumb_func_start sub_8080230
sub_8080230: @ 0x08080230
	bx lr
	.align 2, 0

	thumb_func_start sub_8080234
sub_8080234: @ 0x08080234
	ldr r2, _08080248 @ =gUnknown_030059E0
	ldrh r1, [r2, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [r2, #0x12]
	strh r1, [r0, #0x1a]
	ldr r0, _0808024C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080250 @ =sub_8080318
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08080248: .4byte gUnknown_030059E0
_0808024C: .4byte gCurTask
_08080250: .4byte sub_8080318

	thumb_func_start sub_8080254
sub_8080254: @ 0x08080254
	push {lr}
	ldr r1, [r0]
	ldr r3, _08080290 @ =gUnknown_03005960
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
	bhi _0808028C
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0808028C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08080294
_0808028C:
	movs r0, #1
	b _08080296
	.align 2, 0
_08080290: .4byte gUnknown_03005960
_08080294:
	movs r0, #0
_08080296:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808029C
sub_808029C: @ 0x0808029C
	push {lr}
	ldr r1, [r0, #0x24]
	adds r0, #0x28
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080802B4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080802B4: .4byte gCurTask

	thumb_func_start sub_80802B8
sub_80802B8: @ 0x080802B8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_808000C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80802D8
sub_80802D8: @ 0x080802D8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_808000C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80802F8
sub_80802F8: @ 0x080802F8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_808000C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8080318
sub_8080318: @ 0x08080318
	push {r4, lr}
	ldr r0, _08080360 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08080364 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08080338
	adds r0, r4, #0
	bl sub_80800D4
_08080338:
	adds r0, r4, #0
	bl sub_808017C
	cmp r0, #0
	bne _08080348
	adds r0, r4, #0
	bl sub_80800D4
_08080348:
	adds r0, r4, #0
	bl sub_8080254
	cmp r0, #0
	beq _08080358
	adds r0, r4, #0
	bl sub_808029C
_08080358:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080360: .4byte gCurTask
_08080364: .4byte gUnknown_030059E0

	thumb_func_start sub_8080368
sub_8080368: @ 0x08080368
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080803F4 @ =sub_80806F4
	ldr r2, _080803F8 @ =0x00002010
	movs r5, #0
	str r5, [sp]
	movs r1, #0x24
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	str r5, [r2, #0x14]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	str r5, [r2, #0x1c]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080803F4: .4byte sub_80806F4
_080803F8: .4byte 0x00002010

	thumb_func_start sub_80803FC
sub_80803FC: @ 0x080803FC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #8
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	blt _08080412
	b _08080510
_08080412:
	ldr r0, _08080454 @ =gUnknown_030059E0
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	adds r1, r2, r1
	lsls r1, r1, #8
	ldr r0, [r0, #8]
	cmp r0, r1
	ble _08080510
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _080804F8
	ldrh r0, [r5, #0x18]
	adds r2, r0, #1
	strh r2, [r5, #0x18]
	movs r0, #0x1a
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08080502
	strh r2, [r5, #0x1a]
	ldr r0, _08080458 @ =gUnknown_030053E4
	ldr r0, [r0]
	ldr r1, [r5, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xe1
	lsls r0, r0, #3
	cmp r7, r0
	bls _0808045C
	movs r1, #5
	b _08080468
	.align 2, 0
_08080454: .4byte gUnknown_030059E0
_08080458: .4byte gUnknown_030053E4
_0808045C:
	movs r0, #0x96
	lsls r0, r0, #3
	movs r1, #0xf
	cmp r7, r0
	bls _08080468
	movs r1, #0xa
_08080468:
	ldr r2, _080804D8 @ =gCourseTime
	ldrh r6, [r2]
	adds r0, r1, r6
	strh r0, [r2]
	ldr r0, _080804DC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080804AE
	ldrh r0, [r2]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _080804AE
	ldr r0, _080804E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080804AE
	ldr r1, _080804E4 @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _080804A6
	movs r0, #0xff
_080804A6:
	strb r0, [r1]
	ldr r1, _080804E8 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_080804AE:
	ldr r0, _080804E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080804C2
	ldr r1, _080804D8 @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _080804C2
	movs r0, #0xff
	strh r0, [r1]
_080804C2:
	ldr r0, _080804EC @ =0x0000019B
	bl m4aSongNumStart
	bl sub_8080664
	ldr r0, _080804F0 @ =gUnknown_030053E4
	ldr r0, [r0]
	str r0, [r5, #0x14]
	ldr r0, _080804F4 @ =gUnknown_03005B6C
	str r7, [r0]
	b _08080502
	.align 2, 0
_080804D8: .4byte gCourseTime
_080804DC: .4byte gCurrentLevel
_080804E0: .4byte gGameMode
_080804E4: .4byte gUnknown_03005448
_080804E8: .4byte gUnknown_030054A8
_080804EC: .4byte 0x0000019B
_080804F0: .4byte gUnknown_030053E4
_080804F4: .4byte gUnknown_03005B6C
_080804F8:
	movs r0, #1
	str r0, [r5, #0x1c]
	ldr r0, _08080508 @ =gUnknown_030053E4
	ldr r0, [r0]
	str r0, [r5, #0x14]
_08080502:
	ldr r0, _0808050C @ =gUnknown_030059E0
	ldr r0, [r0, #8]
	b _0808053E
	.align 2, 0
_08080508: .4byte gUnknown_030053E4
_0808050C: .4byte gUnknown_030059E0
_08080510:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	ble _08080540
	ldr r3, _08080550 @ =gUnknown_030059E0
	movs r1, #8
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	bge _08080540
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0808053C
	ldrh r0, [r5, #0x18]
	subs r0, #1
	strh r0, [r5, #0x18]
_0808053C:
	ldr r0, [r3, #8]
_0808053E:
	str r0, [r5, #0x20]
_08080540:
	ldr r0, _08080554 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080558 @ =sub_80806F4
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080550: .4byte gUnknown_030059E0
_08080554: .4byte gCurTask
_08080558: .4byte sub_80806F4

	thumb_func_start sub_808055C
sub_808055C: @ 0x0808055C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _080805C0 @ =gUnknown_03005960
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080805C4 @ =gUnknown_030059E0
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r4, #8
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080805C8
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r1, r0
	bgt _080805C8
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080805C8
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r1, r0
	bgt _080805C8
	movs r0, #1
	b _080805CA
	.align 2, 0
_080805C0: .4byte gUnknown_03005960
_080805C4: .4byte gUnknown_030059E0
_080805C8:
	movs r0, #0
_080805CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80805D0
sub_80805D0: @ 0x080805D0
	push {r4, lr}
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _08080652
	ldr r0, _080805F8 @ =gUnknown_030059E0
	ldr r2, [r0, #8]
	ldr r1, _080805FC @ =0x0000EFFF
	adds r3, r0, #0
	cmp r2, r1
	bgt _08080604
	ldr r1, [r3, #0xc]
	ldr r0, _08080600 @ =0x00011FFF
	cmp r1, r0
	bgt _08080604
	movs r2, #0xb4
	lsls r2, r2, #0xb
	movs r4, #0xd8
	lsls r4, r4, #0xa
	b _0808061C
	.align 2, 0
_080805F8: .4byte gUnknown_030059E0
_080805FC: .4byte 0x0000EFFF
_08080600: .4byte 0x00011FFF
_08080604:
	ldr r1, [r3, #8]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r1, r0
	ble _08080652
	ldr r1, [r3, #0xc]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08080652
	ldr r2, _08080658 @ =0xFFFA6000
	ldr r4, _0808065C @ =0xFFFCA000
_0808061C:
	ldr r0, [r3, #8]
	adds r0, r0, r2
	str r0, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r0, r0, r4
	str r0, [r3, #0xc]
	asrs r2, r2, #8
	asrs r4, r4, #8
	ldr r1, _08080660 @ =gUnknown_03005960
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r2
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r2
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
_08080652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080658: .4byte 0xFFFA6000
_0808065C: .4byte 0xFFFCA000
_08080660: .4byte gUnknown_03005960

	thumb_func_start sub_8080664
sub_8080664: @ 0x08080664
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _080806D4 @ =sub_8080750
	ldr r2, _080806D8 @ =0x00002010
	ldr r1, _080806DC @ =sub_8080790
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r6, #0
	movs r1, #0
	movs r0, #0x78
	strh r0, [r4, #0x30]
	movs r0, #0x40
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _080806E0 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080806E4 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080806E8 @ =IWRAM_START + 0x25
	adds r0, r5, r1
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	movs r0, #0x1a
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _080806EC @ =0x000002DF
	strh r0, [r4, #0xa]
	ldr r0, _080806F0 @ =IWRAM_START + 0x20
	adds r5, r5, r0
	strb r6, [r5]
	adds r0, r4, #0
	bl sub_8004558
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080806D4: .4byte sub_8080750
_080806D8: .4byte 0x00002010
_080806DC: .4byte sub_8080790
_080806E0: .4byte IWRAM_START + 0x21
_080806E4: .4byte IWRAM_START + 0x22
_080806E8: .4byte IWRAM_START + 0x25
_080806EC: .4byte 0x000002DF
_080806F0: .4byte IWRAM_START + 0x20

	thumb_func_start sub_80806F4
sub_80806F4: @ 0x080806F4
	push {r4, r5, lr}
	ldr r0, _08080724 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _08080728 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08080712
	ldrh r0, [r4, #0x1a]
	strh r0, [r4, #0x18]
_08080712:
	adds r0, r4, #0
	bl sub_808055C
	cmp r0, #0
	beq _0808072C
	adds r0, r4, #0
	bl sub_808073C
	b _08080730
	.align 2, 0
_08080724: .4byte gCurTask
_08080728: .4byte gUnknown_030059E0
_0808072C:
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
_08080730:
	adds r0, r4, #0
	bl sub_80805D0
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808073C
sub_808073C: @ 0x0808073C
	ldr r0, _08080748 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808074C @ =sub_80807A4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08080748: .4byte gCurTask
_0808074C: .4byte sub_80807A4

	thumb_func_start sub_8080750
sub_8080750: @ 0x08080750
	push {lr}
	ldr r0, _08080774 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	ldr r1, _08080778 @ =0xFFFF0000
	cmp r0, r1
	bne _0808077C
	adds r0, r3, #0
	bl TaskDestroy
	b _0808078A
	.align 2, 0
_08080774: .4byte gCurTask
_08080778: .4byte 0xFFFF0000
_0808077C:
	movs r0, #0x78
	strh r0, [r2, #0x16]
	movs r0, #0x30
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl sub_80051E8
_0808078A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080790
sub_8080790: @ 0x08080790
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80807A4
sub_80807A4: @ 0x080807A4
	push {r4, lr}
	ldr r0, _080807C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_808055C
	cmp r0, #0
	bne _080807C2
	adds r0, r4, #0
	bl sub_80803FC
_080807C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080807C8: .4byte gCurTask

	thumb_func_start sub_80807CC
sub_80807CC: @ 0x080807CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080808A0 @ =sub_80808DC
	ldr r2, _080808A4 @ =0x00002001
	movs r5, #0
	str r5, [sp]
	movs r1, #0x64
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _080808A8 @ =IWRAM_START + 0x60
	adds r1, r4, r2
	strh r5, [r1]
	adds r2, #2
	adds r1, r4, r2
	strh r5, [r1]
	movs r7, #0x90
	lsls r7, r7, #3
	strh r7, [r0, #0x1a]
	strh r5, [r0, #8]
	strh r5, [r0, #0x14]
	strh r5, [r0, #0x1c]
	ldr r1, _080808AC @ =IWRAM_START + 0x21
	adds r2, r4, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r2, _080808B0 @ =IWRAM_START + 0x22
	adds r1, r4, r2
	movs r2, #0x10
	mov sl, r2
	mov r2, sl
	strb r2, [r1]
	ldr r2, _080808B4 @ =IWRAM_START + 0x25
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	str r1, [r0, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	mov r8, r2
	str r2, [r0, #0x10]
	ldr r1, _080808B8 @ =0x06013040
	str r1, [r0, #4]
	ldr r1, _080808BC @ =0x0000024E
	strh r1, [r0, #0xa]
	ldr r2, _080808C0 @ =IWRAM_START + 0x20
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	bl sub_8004558
	ldr r1, _080808C4 @ =IWRAM_START + 0x30
	adds r0, r4, r1
	strh r7, [r0, #0x1a]
	strh r5, [r0, #8]
	strh r5, [r0, #0x14]
	strh r5, [r0, #0x1c]
	adds r1, #0x21
	adds r2, r4, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	ldr r2, _080808C8 @ =IWRAM_START + 0x52
	adds r1, r4, r2
	mov r2, sl
	strb r2, [r1]
	ldr r2, _080808CC @ =IWRAM_START + 0x55
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	mov r1, sb
	str r1, [r0, #0x28]
	mov r2, r8
	str r2, [r0, #0x10]
	ldr r1, _080808D0 @ =0x06012980
	str r1, [r0, #4]
	ldr r1, _080808D4 @ =0x0000024D
	strh r1, [r0, #0xa]
	ldr r1, _080808D8 @ =IWRAM_START + 0x50
	adds r4, r4, r1
	movs r2, #0
	strb r2, [r4]
	bl sub_8004558
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080808A0: .4byte sub_80808DC
_080808A4: .4byte 0x00002001
_080808A8: .4byte IWRAM_START + 0x60
_080808AC: .4byte IWRAM_START + 0x21
_080808B0: .4byte IWRAM_START + 0x22
_080808B4: .4byte IWRAM_START + 0x25
_080808B8: .4byte 0x06013040
_080808BC: .4byte 0x0000024E
_080808C0: .4byte IWRAM_START + 0x20
_080808C4: .4byte IWRAM_START + 0x30
_080808C8: .4byte IWRAM_START + 0x52
_080808CC: .4byte IWRAM_START + 0x55
_080808D0: .4byte 0x06012980
_080808D4: .4byte 0x0000024D
_080808D8: .4byte IWRAM_START + 0x50

	thumb_func_start sub_80808DC
sub_80808DC: @ 0x080808DC
	push {r4, r5, r6, lr}
	ldr r0, _08080918 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r4, r0
	adds r0, #0x60
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, #0
	beq _080808FA
	adds r0, r1, #0
	bl sub_8004558
_080808FA:
	movs r6, #0
	strh r6, [r5]
	ldr r1, _0808091C @ =IWRAM_START + 0x62
	adds r5, r4, r1
	ldrh r0, [r5]
	cmp r0, #0
	beq _08080910
	subs r1, #0x32
	adds r0, r4, r1
	bl sub_8004558
_08080910:
	strh r6, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080918: .4byte gCurTask
_0808091C: .4byte IWRAM_START + 0x62

	thumb_func_start sub_8080920
sub_8080920: @ 0x08080920
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
	ldr r0, _080809AC @ =sub_8080A5C
	ldr r2, _080809B0 @ =0x00001FF0
	ldr r1, _080809B4 @ =sub_8080A98
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
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
	str r6, [r3, #0x10]
	ldrb r0, [r6]
	strb r0, [r3, #0x14]
	mov r1, r8
	strb r1, [r3, #0x15]
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
_080809AC: .4byte sub_8080A5C
_080809B0: .4byte 0x00001FF0
_080809B4: .4byte sub_8080A98

	thumb_func_start sub_80809B8
sub_80809B8: @ 0x080809B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r6, _08080A44 @ =gUnknown_030059E0
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08080A4C
	ldr r2, [r7]
	ldrh r0, [r7, #8]
	mov sb, r0
	add r2, sb
	ldr r1, _08080A48 @ =gUnknown_03005960
	ldr r4, [r1]
	subs r2, r2, r4
	ldr r0, [r7, #4]
	ldrh r5, [r7, #0xa]
	adds r0, r0, r5
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldrh r0, [r7, #0xc]
	mov r3, sb
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r7, #0xe]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08080A4C
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r2, r0
	cmp r0, r1
	blt _08080A4C
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08080A4C
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r2, r0
	cmp r0, r1
	blt _08080A4C
	movs r0, #1
	b _08080A4E
	.align 2, 0
_08080A44: .4byte gUnknown_030059E0
_08080A48: .4byte gUnknown_03005960
_08080A4C:
	movs r0, #0
_08080A4E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8080A5C
sub_8080A5C: @ 0x08080A5C
	push {r4, lr}
	ldr r0, _08080A90 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80809B8
	cmp r0, #0
	beq _08080A7A
	ldr r0, _08080A94 @ =gUnknown_030059E0
	bl sub_800CBA4
_08080A7A:
	adds r0, r4, #0
	bl sub_8080A9C
	cmp r0, #0
	beq _08080A8A
	adds r0, r4, #0
	bl sub_8080AE4
_08080A8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080A90: .4byte gCurTask
_08080A94: .4byte gUnknown_030059E0

	thumb_func_start sub_8080A98
sub_8080A98: @ 0x08080A98
	bx lr
	.align 2, 0

	thumb_func_start sub_8080A9C
sub_8080A9C: @ 0x08080A9C
	push {lr}
	ldr r1, [r0]
	ldr r3, _08080AD8 @ =gUnknown_03005960
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
	bhi _08080AD4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08080AD4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08080ADC
_08080AD4:
	movs r0, #1
	b _08080ADE
	.align 2, 0
_08080AD8: .4byte gUnknown_03005960
_08080ADC:
	movs r0, #0
_08080ADE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8080AE4
sub_8080AE4: @ 0x08080AE4
	push {lr}
	ldr r1, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	strb r0, [r1]
	ldr r0, _08080AF8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08080AF8: .4byte gCurTask

	thumb_func_start sub_8080AFC
sub_8080AFC: @ 0x08080AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp, #4]
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08080C00 @ =sub_8080DB8
	ldr r2, _08080C04 @ =0x00002010
	ldr r1, _08080C08 @ =sub_8080EF8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	str r6, [r7, #0x30]
	ldr r6, [sp, #4]
	str r6, [r7, #0x34]
	movs r3, #0
	str r3, [r7, #0x38]
	str r3, [r7, #0x3c]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r0, r4, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r6, _08080C0C @ =gSineTable
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r6, _08080C10 @ =IWRAM_START + 0x40
	adds r1, r2, r6
	movs r6, #0
	mov ip, r6
	strh r0, [r1]
	lsls r4, r4, #3
	ldr r0, _08080C0C @ =gSineTable
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r4, _08080C14 @ =IWRAM_START + 0x42
	adds r1, r2, r4
	strh r0, [r1]
	ldr r6, _08080C18 @ =IWRAM_START + 0x44
	adds r0, r2, r6
	mov r1, r8
	strh r1, [r0]
	adds r4, #4
	adds r0, r2, r4
	mov r6, sb
	strh r6, [r0]
	ldr r1, _08080C1C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	mov r4, sl
	strb r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	ldr r6, _08080C20 @ =IWRAM_START + 0x21
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08080C24 @ =IWRAM_START + 0x22
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08080C28 @ =IWRAM_START + 0x25
	adds r2, r2, r1
	mov r4, ip
	strb r4, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	ldr r2, _08080C2C @ =gUnknown_080E0140
	mov r6, sl
	lsls r0, r6, #2
	add r0, sl
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	str r0, [r7, #0x10]
	adds r0, r2, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080C30
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	bl VramMalloc
	b _08080C3C
	.align 2, 0
_08080C00: .4byte sub_8080DB8
_08080C04: .4byte 0x00002010
_08080C08: .4byte sub_8080EF8
_08080C0C: .4byte gSineTable
_08080C10: .4byte IWRAM_START + 0x40
_08080C14: .4byte IWRAM_START + 0x42
_08080C18: .4byte IWRAM_START + 0x44
_08080C1C: .4byte IWRAM_START + 0x48
_08080C20: .4byte IWRAM_START + 0x21
_08080C24: .4byte IWRAM_START + 0x22
_08080C28: .4byte IWRAM_START + 0x25
_08080C2C: .4byte gUnknown_080E0140
_08080C30:
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08080C70 @ =0x06010000
	adds r0, r0, r1
_08080C3C:
	str r0, [r7, #4]
	ldr r2, _08080C74 @ =gUnknown_080E0140
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r7, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080C70: .4byte 0x06010000
_08080C74: .4byte gUnknown_080E0140

	thumb_func_start sub_8080C78
sub_8080C78: @ 0x08080C78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	str r1, [sp, #4]
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08080D4C @ =sub_8080E54
	ldr r2, _08080D50 @ =0x00002010
	ldr r1, _08080D54 @ =sub_8080EF8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov r3, sb
	str r3, [r7, #0x30]
	ldr r0, [sp, #4]
	str r0, [r7, #0x34]
	movs r2, #0
	str r2, [r7, #0x38]
	str r2, [r7, #0x3c]
	ldr r3, _08080D58 @ =IWRAM_START + 0x40
	adds r0, r1, r3
	movs r3, #0
	strh r4, [r0]
	ldr r4, _08080D5C @ =IWRAM_START + 0x42
	adds r0, r1, r4
	strh r5, [r0]
	adds r4, #2
	adds r0, r1, r4
	strh r6, [r0]
	adds r4, #2
	adds r0, r1, r4
	mov r4, r8
	strh r4, [r0]
	ldr r4, _08080D60 @ =IWRAM_START + 0x48
	adds r0, r1, r4
	mov r4, sl
	strb r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _08080D64 @ =IWRAM_START + 0x21
	adds r2, r1, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r4, _08080D68 @ =IWRAM_START + 0x22
	adds r2, r1, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _08080D6C @ =IWRAM_START + 0x25
	adds r1, r1, r0
	strb r3, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	ldr r2, _08080D70 @ =gUnknown_080E0140
	mov r1, sl
	lsls r0, r1, #2
	add r0, sl
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	str r0, [r7, #0x10]
	adds r0, r2, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080D74
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	bl VramMalloc
	b _08080D80
	.align 2, 0
_08080D4C: .4byte sub_8080E54
_08080D50: .4byte 0x00002010
_08080D54: .4byte sub_8080EF8
_08080D58: .4byte IWRAM_START + 0x40
_08080D5C: .4byte IWRAM_START + 0x42
_08080D60: .4byte IWRAM_START + 0x48
_08080D64: .4byte IWRAM_START + 0x21
_08080D68: .4byte IWRAM_START + 0x22
_08080D6C: .4byte IWRAM_START + 0x25
_08080D70: .4byte gUnknown_080E0140
_08080D74:
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08080DB0 @ =0x06010000
	adds r0, r0, r3
_08080D80:
	str r0, [r7, #4]
	ldr r2, _08080DB4 @ =gUnknown_080E0140
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r7, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080DB0: .4byte 0x06010000
_08080DB4: .4byte gUnknown_080E0140

	thumb_func_start sub_8080DB8
sub_8080DB8: @ 0x08080DB8
	push {r4, r5, r6, lr}
	ldr r0, _08080DE0 @ =gCurTask
	ldr r2, [r0]
	ldrh r6, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0x46
	adds r1, r6, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080DE4 @ =0xFFFF0000
	cmp r0, r1
	bne _08080DE8
	adds r0, r2, #0
	bl TaskDestroy
	b _08080E4C
	.align 2, 0
_08080DE0: .4byte gCurTask
_08080DE4: .4byte 0xFFFF0000
_08080DE8:
	ldr r1, _08080E38 @ =IWRAM_START + 0x40
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r5, #0x38]
	adds r2, r2, r0
	str r2, [r5, #0x38]
	ldr r1, _08080E3C @ =IWRAM_START + 0x42
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r3, [r5, #0x3c]
	adds r3, r3, r0
	str r3, [r5, #0x3c]
	ldr r0, [r5, #0x30]
	ldr r4, _08080E40 @ =gUnknown_03005960
	ldr r1, [r4]
	subs r0, r0, r1
	asrs r2, r2, #8
	adds r0, r0, r2
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	asrs r3, r3, #8
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08080E44 @ =IWRAM_START + 0x44
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080E48
	adds r0, r5, #0
	bl sub_80051E8
	b _08080E4C
	.align 2, 0
_08080E38: .4byte IWRAM_START + 0x40
_08080E3C: .4byte IWRAM_START + 0x42
_08080E40: .4byte gUnknown_03005960
_08080E44: .4byte IWRAM_START + 0x44
_08080E48:
	subs r0, #1
	strh r0, [r1]
_08080E4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080E54
sub_8080E54: @ 0x08080E54
	push {r4, r5, lr}
	ldr r0, _08080E7C @ =gCurTask
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x46
	adds r1, r5, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080E80 @ =0xFFFF0000
	cmp r0, r1
	bne _08080E84
	adds r0, r2, #0
	bl TaskDestroy
	b _08080EF0
	.align 2, 0
_08080E7C: .4byte gCurTask
_08080E80: .4byte 0xFFFF0000
_08080E84:
	ldr r1, _08080EDC @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x38]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	ldr r0, _08080EE0 @ =IWRAM_START + 0x42
	adds r1, r5, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r2
	str r0, [r4, #0x3c]
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	ldr r1, [r4, #0x30]
	ldr r2, _08080EE4 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r0, [r4, #0x38]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r4, #0x34]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r2, _08080EE8 @ =IWRAM_START + 0x44
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080EEC
	adds r0, r4, #0
	bl sub_80051E8
	b _08080EF0
	.align 2, 0
_08080EDC: .4byte IWRAM_START + 0x40
_08080EE0: .4byte IWRAM_START + 0x42
_08080EE4: .4byte gUnknown_03005960
_08080EE8: .4byte IWRAM_START + 0x44
_08080EEC:
	subs r0, #1
	strh r0, [r1]
_08080EF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080EF8
sub_8080EF8: @ 0x08080EF8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r2, _08080F24 @ =gUnknown_080E0140
	adds r1, #0x48
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080F20
	ldr r0, [r3, #4]
	bl VramFree
_08080F20:
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_080E0140

	thumb_func_start sub_8080F28
sub_8080F28: @ 0x08080F28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, _08080FE8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08080FDA
	ldr r0, _08080FEC @ =sub_8081084
	ldr r2, _08080FF0 @ =0x00004040
	ldr r1, _08080FF4 @ =sub_80810E8
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	movs r0, #0
	mov sb, r0
	movs r1, #0
	strh r6, [r2, #4]
	strh r4, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r0, r8
	strb r0, [r2, #9]
	ldr r0, _08080FF8 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _08080FFC @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08081000 @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08081004 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08081008 @ =0x000002DA
	strh r0, [r4, #0xa]
	ldr r0, _0808100C @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	mov r1, sb
	strb r1, [r5]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
_08080FDA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080FE8: .4byte gGameMode
_08080FEC: .4byte sub_8081084
_08080FF0: .4byte 0x00004040
_08080FF4: .4byte sub_80810E8
_08080FF8: .4byte IWRAM_START + 0xC
_08080FFC: .4byte IWRAM_START + 0x2D
_08081000: .4byte IWRAM_START + 0x2E
_08081004: .4byte IWRAM_START + 0x31
_08081008: .4byte 0x000002DA
_0808100C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_8081010
sub_8081010: @ 0x08081010
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08081040 @ =gUnknown_030056A4
	ldr r5, [r0]
	ldr r3, _08081044 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0808107C
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	bl sub_800DF38
	adds r3, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r3, r0
	cmp r3, #0
	beq _08081048
	movs r0, #1
	b _0808107E
	.align 2, 0
_08081040: .4byte gUnknown_030056A4
_08081044: .4byte gUnknown_030059E0
_08081048:
	ldr r1, [r5]
	asrs r1, r1, #8
	adds r1, #0x10
	ldr r0, [r4, #0x3c]
	subs r1, r1, r0
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	adds r0, #0x20
	ldr r2, [r4, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bhi _0808107C
	cmp r0, #0x20
	bhi _0808107C
	ldr r0, _08081078 @ =gCurTask
	ldr r0, [r0]
	strb r3, [r0, #0x15]
	movs r0, #1
	b _0808107E
	.align 2, 0
_08081078: .4byte gCurTask
_0808107C:
	movs r0, #0
_0808107E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8081084
sub_8081084: @ 0x08081084
	push {r4, lr}
	ldr r0, _080810C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _080810C4 @ =gUnknown_030059E0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080810AC
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	ldr r1, [r4, #0x40]
	lsls r1, r1, #8
	bl sub_80122DC
_080810AC:
	adds r0, r4, #0
	bl sub_8081010
	cmp r0, #0
	beq _080810C8
	adds r0, r4, #0
	bl sub_80810FC
	b _080810E2
	.align 2, 0
_080810C0: .4byte gCurTask
_080810C4: .4byte gUnknown_030059E0
_080810C8:
	adds r0, r4, #0
	bl sub_8081164
	cmp r0, #0
	beq _080810DC
	adds r0, r4, #0
	movs r1, #1
	bl sub_80811A0
	b _080810E2
_080810DC:
	adds r0, r4, #0
	bl sub_8081134
_080810E2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80810E8
sub_80810E8: @ 0x080810E8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80810FC
sub_80810FC: @ 0x080810FC
	push {lr}
	ldr r2, _08081124 @ =gUnknown_030054F4
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	ldr r1, _08081128 @ =0x000002DA
	strh r1, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x95
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0808112C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08081130 @ =sub_80811BC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081124: .4byte gUnknown_030054F4
_08081128: .4byte 0x000002DA
_0808112C: .4byte gCurTask
_08081130: .4byte sub_80811BC

	thumb_func_start sub_8081134
sub_8081134: @ 0x08081134
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r1, [r0, #0x3c]
	ldr r3, _08081160 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r4, #0x16]
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081160: .4byte gUnknown_03005960

	thumb_func_start sub_8081164
sub_8081164: @ 0x08081164
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08081194 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _0808118E
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _08081198
_0808118E:
	movs r0, #1
	b _0808119A
	.align 2, 0
_08081194: .4byte gUnknown_03005960
_08081198:
	movs r0, #0
_0808119A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80811A0
sub_80811A0: @ 0x080811A0
	push {lr}
	cmp r1, #0
	beq _080811AC
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
_080811AC:
	ldr r0, _080811B8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080811B8: .4byte gCurTask

	thumb_func_start sub_80811BC
sub_80811BC: @ 0x080811BC
	push {r4, lr}
	ldr r0, _080811F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _080811E4
	adds r0, r4, #0
	bl sub_8081164
	cmp r0, #0
	beq _080811F4
_080811E4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80811A0
	b _080811FA
	.align 2, 0
_080811F0: .4byte gCurTask
_080811F4:
	adds r0, r4, #0
	bl sub_8081134
_080811FA:
	pop {r4}
	pop {r0}
	bx r0
