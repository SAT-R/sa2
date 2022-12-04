.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_805F098
sub_805F098: @ 0x0805F098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805F188 @ =gCurTask
	ldr r0, [r0]
	mov sb, r0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov sl, r1
	adds r4, r0, r1
	ldr r7, [r4]
	ldrb r2, [r4, #8]
	str r2, [sp]
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	lsls r2, r2, #3
	lsls r0, r0, #8
	adds r6, r2, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldr r3, _0805F18C @ =gPlayer
	ldr r2, [r3, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0805F144
	ldr r0, [r3, #8]
	mov r8, r0
	asrs r1, r0, #8
	cmp r6, r1
	bgt _0805F144
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	adds r0, r6, r0
	cmp r0, r1
	blt _0805F144
	ldr r1, [r3, #0xc]
	mov ip, r1
	asrs r1, r1, #8
	cmp r5, r1
	bgt _0805F144
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r1
	blt _0805F144
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	str r0, [sp, #4]
	mov r1, sl
	asrs r0, r1, #0x10
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _0805F144
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0805F144
	ldr r0, _0805F190 @ =sub_805F19C
	mov r1, sb
	str r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r2, r0
	str r2, [r3, #0x20]
	ldr r0, [r4, #0x10]
	mov r2, ip
	subs r0, r2, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r4, #0xc]
	mov r3, r8
	subs r1, r3, r1
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0x14]
	ldr r0, _0805F194 @ =0x0000FFF8
	strh r0, [r4, #0x16]
_0805F144:
	ldr r1, _0805F198 @ =gCamera
	ldr r0, [r1]
	subs r6, r6, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F16A
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F16A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F178
_0805F16A:
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r0, _0805F188 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0805F178:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F188: .4byte gCurTask
_0805F18C: .4byte gPlayer
_0805F190: .4byte sub_805F19C
_0805F194: .4byte 0x0000FFF8
_0805F198: .4byte gCamera

	thumb_func_start sub_805F19C
sub_805F19C: @ 0x0805F19C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _0805F1E0 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4]
	mov r8, r0
	ldrb r1, [r4, #8]
	mov ip, r1
	ldrh r5, [r4, #4]
	ldrh r6, [r4, #6]
	ldr r2, _0805F1E4 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov sl, r3
	mov sb, r2
	cmp r1, #0
	beq _0805F1E8
	mov r3, ip
	mov r2, r8
	strb r3, [r2]
	mov r6, sl
	ldr r0, [r6]
	bl TaskDestroy
	b _0805F2BC
	.align 2, 0
_0805F1E0: .4byte gCurTask
_0805F1E4: .4byte gPlayer
_0805F1E8:
	mov r0, ip
	lsls r1, r0, #3
	lsls r0, r5, #8
	adds r7, r1, r0
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r5, r0, r1
	ldrh r2, [r4, #0x16]
	ldrh r3, [r4, #0x14]
	adds r0, r2, r3
	ldr r6, _0805F2CC @ =0x000003FF
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r4, #0x14]
	mov r1, sb
	adds r1, #0x24
	ldrb r0, [r1]
	adds r2, r2, r0
	strb r2, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	subs r0, r0, r1
	cmp r0, #0
	bge _0805F224
	ldr r2, _0805F2D0 @ =0xFFFFFD00
	adds r0, r1, r2
_0805F224:
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0805F2D4 @ =gSineTable
	movs r6, #0x14
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r1, [r0, r6]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x87
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1, #0xc]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #6
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	mov r3, sb
	str r1, [r3, #8]
	ldr r1, _0805F2D8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	movs r6, #0x14
	ldrsh r1, [r4, r6]
	ldr r0, _0805F2DC @ =0x0000024A
	cmp r1, r0
	bgt _0805F292
	ldr r0, [r3, #0x20]
	ldr r1, _0805F2E0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0805F2E4 @ =sub_805F098
	str r0, [r1, #8]
_0805F292:
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F2AE
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F2AE
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F2BC
_0805F2AE:
	mov r2, ip
	mov r1, r8
	strb r2, [r1]
	mov r3, sl
	ldr r0, [r3]
	bl TaskDestroy
_0805F2BC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2CC: .4byte 0x000003FF
_0805F2D0: .4byte 0xFFFFFD00
_0805F2D4: .4byte gSineTable
_0805F2D8: .4byte gCamera
_0805F2DC: .4byte 0x0000024A
_0805F2E0: .4byte 0xFFBFFFFF
_0805F2E4: .4byte sub_805F098

	thumb_func_start sub_805F2E8
sub_805F2E8: @ 0x0805F2E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0805F3E8 @ =gCurTask
	ldr r0, [r0]
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r6, [r4]
	ldrb r0, [r4, #8]
	mov sl, r0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	mov r3, sl
	lsls r2, r3, #3
	lsls r0, r0, #8
	adds r7, r2, r0
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldr r0, _0805F3EC @ =gPlayer
	mov ip, r0
	ldr r3, [r0, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0805F3A4
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	mov r1, ip
	ldr r1, [r1, #8]
	mov r8, r1
	asrs r1, r1, #8
	cmp r2, r1
	bgt _0805F3A4
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _0805F3A4
	mov r0, ip
	ldr r2, [r0, #0xc]
	asrs r1, r2, #8
	cmp r5, r1
	bgt _0805F3A4
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r1
	blt _0805F3A4
	mov r1, ip
	movs r0, #0x14
	ldrsh r1, [r1, r0]
	ldr r0, _0805F3F0 @ =0xFFFFFD00
	cmp r1, r0
	bge _0805F3A4
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0805F3A4
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	bne _0805F3A4
	ldr r0, _0805F3F4 @ =sub_805F3FC
	mov r1, sb
	str r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r3, r0
	mov r0, ip
	str r3, [r0, #0x20]
	ldr r0, [r4, #0x10]
	subs r0, r2, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r4, #0xc]
	mov r2, r8
	subs r1, r2, r1
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0x14]
	movs r0, #8
	strh r0, [r4, #0x16]
_0805F3A4:
	ldr r1, _0805F3F8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F3CA
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F3CA
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F3D6
_0805F3CA:
	mov r3, sl
	strb r3, [r6]
	ldr r0, _0805F3E8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0805F3D6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F3E8: .4byte gCurTask
_0805F3EC: .4byte gPlayer
_0805F3F0: .4byte 0xFFFFFD00
_0805F3F4: .4byte sub_805F3FC
_0805F3F8: .4byte gCamera

	thumb_func_start sub_805F3FC
sub_805F3FC: @ 0x0805F3FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _0805F440 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4]
	mov r8, r0
	ldrb r1, [r4, #8]
	mov ip, r1
	ldrh r5, [r4, #4]
	ldrh r6, [r4, #6]
	ldr r2, _0805F444 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov sl, r3
	mov sb, r2
	cmp r1, #0
	beq _0805F448
	mov r3, ip
	mov r2, r8
	strb r3, [r2]
	mov r6, sl
	ldr r0, [r6]
	bl TaskDestroy
	b _0805F51C
	.align 2, 0
_0805F440: .4byte gCurTask
_0805F444: .4byte gPlayer
_0805F448:
	mov r0, ip
	lsls r1, r0, #3
	lsls r0, r5, #8
	adds r7, r1, r0
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r5, r0, r1
	ldrh r2, [r4, #0x16]
	ldrh r3, [r4, #0x14]
	adds r0, r2, r3
	ldr r6, _0805F52C @ =0x000003FF
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r4, #0x14]
	mov r1, sb
	adds r1, #0x24
	ldrb r0, [r1]
	adds r2, r2, r0
	strb r2, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	subs r0, r0, r1
	cmp r0, #0
	bge _0805F484
	ldr r2, _0805F530 @ =0xFFFFFD00
	adds r0, r1, r2
_0805F484:
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0805F534 @ =gSineTable
	movs r6, #0x14
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r1, [r0, r6]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x87
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1, #0xc]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #6
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	mov r3, sb
	str r1, [r3, #8]
	ldr r1, _0805F538 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	movs r6, #0x14
	ldrsh r1, [r4, r6]
	ldr r0, _0805F53C @ =0x000003B6
	cmp r1, r0
	ble _0805F4F2
	ldr r0, [r3, #0x20]
	ldr r1, _0805F540 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0805F544 @ =sub_805F2E8
	str r0, [r1, #8]
_0805F4F2:
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F50E
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F50E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F51C
_0805F50E:
	mov r2, ip
	mov r1, r8
	strb r2, [r1]
	mov r3, sl
	ldr r0, [r3]
	bl TaskDestroy
_0805F51C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F52C: .4byte 0x000003FF
_0805F530: .4byte 0xFFFFFD00
_0805F534: .4byte gSineTable
_0805F538: .4byte gCamera
_0805F53C: .4byte 0x000003B6
_0805F540: .4byte 0xFFBFFFFF
_0805F544: .4byte sub_805F2E8

	thumb_func_start initSprite_Interactable_LoopGap_Start
initSprite_Interactable_LoopGap_Start: @ 0x0805F548
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0805F5AC @ =sub_805F098
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	str r6, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #8]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	ldrb r0, [r1, #8]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	subs r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	adds r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F5AC: .4byte sub_805F098

	thumb_func_start initSprite_Interactable_LoopGap_End
initSprite_Interactable_LoopGap_End: @ 0x0805F5B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0805F614 @ =sub_805F2E8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	str r6, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #8]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	ldrb r0, [r1, #8]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	adds r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	adds r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F614: .4byte sub_805F2E8
