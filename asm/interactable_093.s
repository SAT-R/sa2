.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable093
initSprite_Interactable093: @ 0x0807E220
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
	ldr r0, _0807E294 @ =Task_Interactable093
	ldr r2, _0807E298 @ =0x00002010
	ldr r1, _0807E29C @ =TaskDestructor_Interactable093
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
_0807E294: .4byte Task_Interactable093
_0807E298: .4byte 0x00002010
_0807E29C: .4byte TaskDestructor_Interactable093
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
	ldr r2, _0807E360 @ =gPlayer
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
	ldr r1, _0807E36C @ =gPlayerControls
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
_0807E360: .4byte gPlayer
_0807E364: .4byte IWRAM_START + 0x6C
_0807E368: .4byte 0xFFFF0000
_0807E36C: .4byte gPlayerControls
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
	bl Player_SetMovestate_IsInScriptedSequence
	ldr r4, _0807E3C8 @ =gPlayer
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
_0807E3C8: .4byte gPlayer
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
	ldr r1, _0807E3FC @ =gPlayer
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
_0807E3FC: .4byte gPlayer
_0807E400: .4byte gCurTask
_0807E404: .4byte sub_807E7B0

	thumb_func_start sub_807E408
sub_807E408: @ 0x0807E408
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r0, _0807E4C8 @ =gPlayer
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
_0807E4C8: .4byte gPlayer
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
	ldr r0, _0807E508 @ =gPlayer
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
_0807E508: .4byte gPlayer
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
	ldr r1, _0807E660 @ =gCamera
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
_0807E660: .4byte gCamera
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
	ldr r0, _0807E758 @ =gPlayer
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
	ldr r2, _0807E75C @ =gCamera
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
_0807E758: .4byte gPlayer
_0807E75C: .4byte gCamera
_0807E760: .4byte gUnknown_03005AF0
_0807E764:
	movs r0, #0
_0807E766:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable093
Task_Interactable093: @ 0x0807E770
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
	ldr r0, _0807E7D8 @ =gPlayer
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
_0807E7D8: .4byte gPlayer
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

	thumb_func_start TaskDestructor_Interactable093
TaskDestructor_Interactable093: @ 0x0807E830
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
	ldr r3, _0807E8D4 @ =gCamera
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
_0807E8D4: .4byte gCamera
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
	ldr r0, _0807E950 @ =Task_Interactable093
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E94C: .4byte gCurTask
_0807E950: .4byte Task_Interactable093

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
