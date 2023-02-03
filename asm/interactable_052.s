.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable052
initSprite_Interactable052: @ 0x08073374
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
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r2, _080734AC @ =gPlayer
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
_080734AC: .4byte gPlayer
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
	ldr r4, _08073510 @ =gPlayer
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
_08073510: .4byte gPlayer
_08073514: .4byte 0x00000237
_08073518: .4byte gCurTask
_0807351C: .4byte sub_8073600

	thumb_func_start sub_8073520
sub_8073520: @ 0x08073520
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08073598 @ =gPlayer
	ldr r5, [r6, #0x20]
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _080735A4
	ldr r2, [r4, #0x3c]
	ldr r1, _0807359C @ =gCamera
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
_08073598: .4byte gPlayer
_0807359C: .4byte gCamera
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
	ldr r0, _0807362C @ =gPlayer
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
_0807362C: .4byte gPlayer
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
	bl Player_SetMovestate_IsInScriptedSequence
	ldr r1, _080736D0 @ =gPlayer
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
_080736D0: .4byte gPlayer
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
	bl Player_ClearMovestate_IsInScriptedSequence
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
	ldr r3, _08073780 @ =gCamera
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
_08073780: .4byte gCamera

	thumb_func_start sub_8073784
sub_8073784: @ 0x08073784
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _080737C0 @ =gCamera
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
_080737C0: .4byte gCamera
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
	ldr r0, _080737EC @ =gPlayer
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
_080737EC: .4byte gPlayer
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
	ldr r0, _08073844 @ =gPlayer
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
_08073844: .4byte gPlayer
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
