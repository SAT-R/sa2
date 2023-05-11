.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
