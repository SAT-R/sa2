.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Task_Interactable_IceParadise_SlidyIce
Task_Interactable_IceParadise_SlidyIce: @ 0x0801121C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080112D0 @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldrb r1, [r0, #8]
	mov r8, r1
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, r8
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r5, r0, r2
	ldr r3, _080112D4 @ =gPlayer
	ldr r4, [r3, #0x20]
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	bne _08011292
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08011292
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08011292
	movs r0, #4
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r5, r0
	ldr r0, [r3, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08011292
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08011292
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	str r4, [r3, #0x20]
_08011292:
	ldr r1, _080112D8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080112B8
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080112B8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _080112C4
_080112B8:
	mov r0, r8
	strb r0, [r6]
	mov r1, ip
	ldr r0, [r1]
	bl TaskDestroy
_080112C4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080112D0: .4byte gCurTask
_080112D4: .4byte gPlayer
_080112D8: .4byte gCamera

	thumb_func_start initSprite_Interactable_IceParadise_SlidyIce
initSprite_Interactable_IceParadise_SlidyIce: @ 0x080112DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08011320 @ =Task_Interactable_IceParadise_SlidyIce
	ldr r2, _08011324 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011320: .4byte Task_Interactable_IceParadise_SlidyIce
_08011324: .4byte 0x00002010
