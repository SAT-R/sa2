.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
