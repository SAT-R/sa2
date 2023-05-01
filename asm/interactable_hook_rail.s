.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807319C
sub_807319C: @ 0x0807319C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080731B8 @ =gPlayer
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
_080731B8: .4byte gPlayer
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
	ldr r1, _08073214 @ =gPlayer
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
_08073214: .4byte gPlayer
_08073218: .4byte gSineTable

	thumb_func_start sub_807321C
sub_807321C: @ 0x0807321C
	ldr r2, _08073230 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08073234 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x6d
	movs r0, #3
	strb r0, [r2]
	bx lr
	.align 2, 0
_08073230: .4byte gPlayer
_08073234: .4byte 0xFFBFFFFF

	thumb_func_start sub_8073238
sub_8073238: @ 0x08073238
	push {lr}
	ldr r1, [r0]
	ldr r3, _08073274 @ =gCamera
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
_08073274: .4byte gCamera
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

	thumb_func_start initSprite_Interactable048
initSprite_Interactable048: @ 0x0807329C
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
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_HookRail_Start
initSprite_Interactable_HookRail_Start: @ 0x080732C8
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
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_HookRail_End
initSprite_Interactable_HookRail_End: @ 0x080732F4
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
	bl initSprite_Interactable_HookRail
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
	ldr r0, _08073348 @ =gPlayer
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
_08073348: .4byte gPlayer
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
