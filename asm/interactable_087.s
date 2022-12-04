.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable087
initSprite_Interactable087: @ 0x0807D2F4
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
	ldr r0, _0807D430 @ =Task_Interactable087
	ldr r2, _0807D434 @ =0x00002010
	ldr r1, _0807D438 @ =TaskDestructor_Interactable087
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
_0807D430: .4byte Task_Interactable087
_0807D434: .4byte 0x00002010
_0807D438: .4byte TaskDestructor_Interactable087
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
	ldr r2, _0807D490 @ =gPlayer
	ldr r1, [r2, #8]
	subs r3, r0, r1
	b _0807D4A8
	.align 2, 0
_0807D490: .4byte gPlayer
_0807D494:
	ldr r2, _0807D4CC @ =gPlayer
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
_0807D4CC: .4byte gPlayer
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
	ldr r2, _0807D6F8 @ =gCamera
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
_0807D6F8: .4byte gCamera

	thumb_func_start sub_807D6FC
sub_807D6FC: @ 0x0807D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	ldr r5, _0807D798 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D7A0
	mov r0, ip
	ldr r3, [r0, #0x3c]
	ldr r1, _0807D79C @ =gCamera
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
_0807D798: .4byte gPlayer
_0807D79C: .4byte gCamera
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

	thumb_func_start Task_Interactable087
Task_Interactable087: @ 0x0807D7B0
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

	thumb_func_start TaskDestructor_Interactable087
TaskDestructor_Interactable087: @ 0x0807D7F8
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
	ldr r0, _0807D81C @ =Task_807D978
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D818: .4byte gCurTask
_0807D81C: .4byte Task_807D978

	thumb_func_start sub_807D820
sub_807D820: @ 0x0807D820
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0807D840 @ =gPlayer
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
_0807D840: .4byte gPlayer
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
	ldr r1, _0807D8D4 @ =gCamera
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
_0807D8D4: .4byte gCamera
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

	thumb_func_start initSprite_Interactable087_0
initSprite_Interactable087_0: @ 0x0807D8F8
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
	bl initSprite_Interactable087
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable087_1
initSprite_Interactable087_1: @ 0x0807D918
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
	bl initSprite_Interactable087
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable087_2
initSprite_Interactable087_2: @ 0x0807D938
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
	bl initSprite_Interactable087
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable087_3
initSprite_Interactable087_3: @ 0x0807D958
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
	bl initSprite_Interactable087
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Task_807D978
Task_807D978: @ 0x0807D978
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
	ldr r0, _0807D9C4 @ =Task_Interactable087
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D9C0: .4byte gCurTask
_0807D9C4: .4byte Task_Interactable087
