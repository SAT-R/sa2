.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0

	thumb_func_start Task_80801F8
Task_80801F8: @ 0x080801F8
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
.endif

	thumb_func_start sub_8080234
sub_8080234: @ 0x08080234
	ldr r2, _08080248 @ =gPlayer
	ldrh r1, [r2, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [r2, #0x12]
	strh r1, [r0, #0x1a]
	ldr r0, _0808024C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080250 @ =Task_8080318
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08080248: .4byte gPlayer
_0808024C: .4byte gCurTask
_08080250: .4byte Task_8080318

	thumb_func_start sub_8080254
sub_8080254: @ 0x08080254
	push {lr}
	ldr r1, [r0]
	ldr r3, _08080290 @ =gCamera
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
_08080290: .4byte gCamera
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

	thumb_func_start initSprite_Interactable098_0
initSprite_Interactable098_0: @ 0x080802B8
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
	bl initSprite_Interactable098
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable098_1
initSprite_Interactable098_1: @ 0x080802D8
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
	bl initSprite_Interactable098
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable098_2
initSprite_Interactable098_2: @ 0x080802F8
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
	bl initSprite_Interactable098
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Task_8080318
Task_8080318: @ 0x08080318
	push {r4, lr}
	ldr r0, _08080360 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08080364 @ =gPlayer
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
_08080364: .4byte gPlayer
