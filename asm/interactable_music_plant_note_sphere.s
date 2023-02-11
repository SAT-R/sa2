.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_Interactable_MusicPlant_Note_Sphere
Task_Interactable_MusicPlant_Note_Sphere: @ 0x08075834
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

	thumb_func_start TaskDestructor_Interactable_MusicPlant_Note_Sphere
TaskDestructor_Interactable_MusicPlant_Note_Sphere: @ 0x0807587C
	bx lr
	.align 2, 0

	thumb_func_start sub_8075880
sub_8075880: @ 0x08075880
	mov ip, r0
	mov r3, ip
	adds r3, #0xc
	ldr r1, [r0, #0x3c]
	ldr r2, _080758B4 @ =gCamera
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
_080758B4: .4byte gCamera

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
	ldr r3, _08075918 @ =gCamera
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
_08075918: .4byte gCamera
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
