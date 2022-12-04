.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_MusicPlant_Keyboard
initSprite_Interactable_MusicPlant_Keyboard: @ 0x08076368
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
	ldr r0, _08076434 @ =Task_Interactable_MusicPlant_Keyboard
	ldr r2, _08076438 @ =0x00002010
	ldr r1, _0807643C @ =TaskDestructor_Interactable_MusicPlant_Keyboard
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
_08076434: .4byte Task_Interactable_MusicPlant_Keyboard
_08076438: .4byte 0x00002010
_0807643C: .4byte TaskDestructor_Interactable_MusicPlant_Keyboard
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
	ldr r1, _0807647C @ =gPlayer
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
_0807647C: .4byte gPlayer
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
	ldr r2, _080764D8 @ =gPlayer
	ldr r1, _080764DC @ =gUnknown_080DFC94
	b _080764E4
	.align 2, 0
_080764D4: .4byte gCurrentLevel
_080764D8: .4byte gPlayer
_080764DC: .4byte gUnknown_080DFC94
_080764E0:
	ldr r2, _080764F0 @ =gPlayer
	ldr r1, _080764F4 @ =gUnknown_080DFC88
_080764E4:
	ldrh r0, [r1]
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	b _0807670C
	.align 2, 0
_080764F0: .4byte gPlayer
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
	ldr r2, _08076514 @ =gPlayer
	ldr r1, _08076518 @ =gUnknown_080DFC94
	b _08076520
	.align 2, 0
_08076510: .4byte gCurrentLevel
_08076514: .4byte gPlayer
_08076518: .4byte gUnknown_080DFC94
_0807651C:
	ldr r2, _08076538 @ =gPlayer
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
_08076538: .4byte gPlayer
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
	ldr r1, _08076564 @ =gPlayer
	strh r2, [r1, #0x10]
	ldr r0, _08076568 @ =gUnknown_080DFC94
	b _08076572
	.align 2, 0
_08076560: .4byte gCurrentLevel
_08076564: .4byte gPlayer
_08076568: .4byte gUnknown_080DFC94
_0807656C:
	ldr r1, _0807657C @ =gPlayer
	strh r2, [r1, #0x10]
	ldr r0, _08076580 @ =gUnknown_080DFC88
_08076572:
	ldrh r0, [r0, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #0x12]
	b _0807670C
	.align 2, 0
_0807657C: .4byte gPlayer
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
	ldr r2, _080765A4 @ =gPlayer
	ldr r1, _080765A8 @ =gUnknown_080DFC94
	b _080765B0
	.align 2, 0
_080765A0: .4byte gCurrentLevel
_080765A4: .4byte gPlayer
_080765A8: .4byte gUnknown_080DFC94
_080765AC:
	ldr r2, _080765BC @ =gPlayer
	ldr r1, _080765C0 @ =gUnknown_080DFC88
_080765B0:
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #6]
	b _0807667A
	.align 2, 0
_080765BC: .4byte gPlayer
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
	ldr r2, _080765E0 @ =gPlayer
	ldr r1, _080765E4 @ =gUnknown_080DFC94
	b _080765EC
	.align 2, 0
_080765DC: .4byte gCurrentLevel
_080765E0: .4byte gPlayer
_080765E4: .4byte gUnknown_080DFC94
_080765E8:
	ldr r2, _08076604 @ =gPlayer
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
_08076604: .4byte gPlayer
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
	ldr r2, _0807662C @ =gPlayer
	ldr r0, _08076630 @ =gUnknown_080DFC94
	b _08076638
	.align 2, 0
_08076628: .4byte gCurrentLevel
_0807662C: .4byte gPlayer
_08076630: .4byte gUnknown_080DFC94
_08076634:
	ldr r2, _08076640 @ =gPlayer
	ldr r0, _08076644 @ =gUnknown_080DFC88
_08076638:
	ldrh r0, [r0, #4]
	rsbs r0, r0, #0
	b _08076706
	.align 2, 0
_08076640: .4byte gPlayer
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
	ldr r2, _08076668 @ =gPlayer
	ldr r1, _0807666C @ =gUnknown_080DFC94
	b _08076674
	.align 2, 0
_08076664: .4byte gCurrentLevel
_08076668: .4byte gPlayer
_0807666C: .4byte gUnknown_080DFC94
_08076670:
	ldr r2, _08076688 @ =gPlayer
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
_08076688: .4byte gPlayer
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
	ldr r2, _080766B0 @ =gPlayer
	ldr r1, _080766B4 @ =gUnknown_080DFC94
	b _080766BC
	.align 2, 0
_080766AC: .4byte gCurrentLevel
_080766B0: .4byte gPlayer
_080766B4: .4byte gUnknown_080DFC94
_080766B8:
	ldr r2, _080766D0 @ =gPlayer
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
_080766D0: .4byte gPlayer
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
	ldr r2, _080766F8 @ =gPlayer
	ldr r0, _080766FC @ =gUnknown_080DFC94
	b _08076704
	.align 2, 0
_080766F4: .4byte gCurrentLevel
_080766F8: .4byte gPlayer
_080766FC: .4byte gUnknown_080DFC94
_08076700:
	ldr r2, _08076770 @ =gPlayer
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
	ldr r4, _08076770 @ =gPlayer
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
_08076770: .4byte gPlayer
_08076774: .4byte gUnknown_080DFC88
_08076778: .4byte 0x0000FB80
_0807677C: .4byte 0x0000FF20

	thumb_func_start sub_8076780
sub_8076780: @ 0x08076780
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _080767F8 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076804
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _08076800
	ldr r2, [r5, #4]
	ldr r1, _080767FC @ =gCamera
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
_080767F8: .4byte gPlayer
_080767FC: .4byte gCamera
_08076800:
	subs r0, #1
	strb r0, [r5, #1]
_08076804:
	movs r0, #0
_08076806:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable_MusicPlant_Keyboard
Task_Interactable_MusicPlant_Keyboard: @ 0x0807680C
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

	thumb_func_start TaskDestructor_Interactable_MusicPlant_Keyboard
TaskDestructor_Interactable_MusicPlant_Keyboard: @ 0x08076844
	bx lr
	.align 2, 0

	thumb_func_start sub_8076848
sub_8076848: @ 0x08076848
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #4]
	ldr r1, _080768A0 @ =gCamera
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
_080768A0: .4byte gCamera
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

	thumb_func_start initSprite_Interactable_MusicPlant_Keyboard_Vertical
initSprite_Interactable_MusicPlant_Keyboard_Vertical: @ 0x080768C8
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
	bl initSprite_Interactable_MusicPlant_Keyboard
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushLeft
initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushLeft: @ 0x080768E8
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
	bl initSprite_Interactable_MusicPlant_Keyboard
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushRight
initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushRight: @ 0x08076908
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
	bl initSprite_Interactable_MusicPlant_Keyboard
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
