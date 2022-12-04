.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable098
initSprite_Interactable098: @ 0x0808000C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sl, r3
	ldr r6, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080800C0 @ =sub_80801F8
	ldr r2, _080800C4 @ =0x00002010
	ldr r1, _080800C8 @ =sub_8080230
	str r1, [sp]
	movs r1, #0x2c
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sb
	strh r6, [r2, #0x14]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	str r5, [r2, #0x24]
	ldrb r1, [r5]
	ldr r0, _080800CC @ =IWRAM_START + 0x28
	add r0, sb
	strb r1, [r0]
	ldr r0, _080800D0 @ =IWRAM_START + 0x29
	add sb, r0
	mov r5, sl
	mov r1, sb
	strb r5, [r1]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800C0: .4byte sub_80801F8
_080800C4: .4byte 0x00002010
_080800C8: .4byte sub_8080230
_080800CC: .4byte IWRAM_START + 0x28
_080800D0: .4byte IWRAM_START + 0x29

	thumb_func_start sub_80800D4
sub_80800D4: @ 0x080800D4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x14]
	cmp r0, #1
	beq _08080104
	cmp r0, #1
	bgt _080800E8
	cmp r0, #0
	beq _080800EE
	b _0808015E
_080800E8:
	cmp r0, #2
	beq _08080114
	b _0808015E
_080800EE:
	ldr r2, _080800FC @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08080100 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	b _0808015E
	.align 2, 0
_080800FC: .4byte gUnknown_03005424
_08080100: .4byte 0x0000FF7F
_08080104:
	ldr r0, _08080110 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	b _0808015C
	.align 2, 0
_08080110: .4byte gUnknown_03005424
_08080114:
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	cmp r1, #0
	ble _08080126
	ldr r0, _0808016C @ =gPlayer
	movs r3, #0x10
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bgt _08080154
_08080126:
	cmp r1, #0
	bge _08080134
	ldr r0, _0808016C @ =gPlayer
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08080154
_08080134:
	movs r3, #0x1a
	ldrsh r1, [r2, r3]
	cmp r1, #0
	ble _08080146
	ldr r0, _0808016C @ =gPlayer
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bgt _08080154
_08080146:
	cmp r1, #0
	bge _0808015E
	ldr r0, _0808016C @ =gPlayer
	movs r3, #0x12
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0808015E
_08080154:
	ldr r0, _08080170 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	eors r1, r2
_0808015C:
	strh r1, [r0]
_0808015E:
	ldr r0, _08080174 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080178 @ =sub_80801F8
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0808016C: .4byte gPlayer
_08080170: .4byte gUnknown_03005424
_08080174: .4byte gCurTask
_08080178: .4byte sub_80801F8

	thumb_func_start sub_808017C
sub_808017C: @ 0x0808017C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _080801E8 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080801F0
	ldr r2, [r5]
	ldrh r0, [r5, #8]
	adds r2, r2, r0
	ldr r3, _080801EC @ =gCamera
	ldr r4, [r3]
	subs r2, r2, r4
	ldr r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldr r3, [r3, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _080801F0
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r0, r1
	blt _080801F0
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _080801F0
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r0, r1
	blt _080801F0
	movs r0, #1
	b _080801F2
	.align 2, 0
_080801E8: .4byte gPlayer
_080801EC: .4byte gCamera
_080801F0:
	movs r0, #0
_080801F2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80801F8
sub_80801F8: @ 0x080801F8
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

	thumb_func_start sub_8080234
sub_8080234: @ 0x08080234
	ldr r2, _08080248 @ =gPlayer
	ldrh r1, [r2, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [r2, #0x12]
	strh r1, [r0, #0x1a]
	ldr r0, _0808024C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080250 @ =sub_8080318
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08080248: .4byte gPlayer
_0808024C: .4byte gCurTask
_08080250: .4byte sub_8080318

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

	thumb_func_start sub_8080318
sub_8080318: @ 0x08080318
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
