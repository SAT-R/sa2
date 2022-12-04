.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80106E8
sub_80106E8: @ 0x080106E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080107DC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
	mov r8, r1
	ldrb r3, [r0, #8]
	mov sb, r3
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r6, r0, r1
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r5, r0, r2
	ldr r4, _080107E0 @ =gPlayer
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0801079A
	ldr r0, [r4, #8]
	asrs r1, r0, #8
	cmp r6, r1
	bgt _0801079A
	adds r0, r6, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801079A
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	cmp r5, r1
	bgt _0801079A
	adds r0, r5, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801079A
	movs r7, #0x80
	lsls r7, r7, #0xc
	ands r7, r2
	cmp r7, #0
	bne _0801079A
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0x19
	strb r0, [r1]
	mov r3, r8
	ldrb r0, [r3, #3]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3, #4]
	movs r0, #0xf
	ands r0, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x6e
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	lsls r0, r0, #8
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r0, #0xc
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	bl sub_8029FF0
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2]
	strh r7, [r4, #0x30]
	ldr r0, _080107E4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
_0801079A:
	ldr r1, _080107E8 @ =gCamera
	ldr r0, [r1]
	subs r6, r6, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080107C0
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080107C0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _080107CE
_080107C0:
	mov r1, sb
	mov r0, r8
	strb r1, [r0]
	ldr r0, _080107DC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080107CE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080107DC: .4byte gCurTask
_080107E0: .4byte gPlayer
_080107E4: .4byte gMPlayInfo_BGM
_080107E8: .4byte gCamera

	thumb_func_start sub_80107EC
sub_80107EC: @ 0x080107EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080108D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r7, [r0]
	ldrb r1, [r0, #8]
	mov r8, r1
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, r8
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r4, r0, r2
	ldr r0, _080108DC @ =gPlayer
	mov ip, r0
	ldr r2, [r0, #0x20]
	movs r6, #0x80
	ands r6, r2
	cmp r6, #0
	bne _0801089C
	ldr r0, [r0, #8]
	asrs r1, r0, #8
	cmp r5, r1
	bgt _0801089C
	adds r0, r5, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801089C
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0801089C
	adds r0, r4, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801089C
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0801089C
	ldr r0, _080108E0 @ =0xFFF7FDFD
	ands r2, r0
	mov r3, ip
	str r2, [r3, #0x20]
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _080108E4 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	adds r1, #0x38
	strb r6, [r1]
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08010884
	movs r0, #1
	strb r0, [r1]
_08010884:
	mov r3, ip
	adds r3, #0x6d
	movs r0, #0x1c
	strb r0, [r3]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08010898
	movs r0, #5
	strb r0, [r3]
_08010898:
	bl sub_802A004
_0801089C:
	ldr r1, _080108E8 @ =gCamera
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080108C2
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080108C2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _080108CE
_080108C2:
	mov r0, r8
	strb r0, [r7]
	ldr r0, _080108D8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080108CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080108D8: .4byte gCurTask
_080108DC: .4byte gPlayer
_080108E0: .4byte 0xFFF7FDFD
_080108E4: .4byte 0xFFFFCFFF
_080108E8: .4byte gCamera

	thumb_func_start initSprite_Interactable_ClearPipe_Start
initSprite_Interactable_ClearPipe_Start: @ 0x080108EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08010930 @ =sub_80106E8
	ldr r2, _08010934 @ =0x00002010
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
_08010930: .4byte sub_80106E8
_08010934: .4byte 0x00002010

	thumb_func_start initSprite_Interactable_ClearPipe_End
initSprite_Interactable_ClearPipe_End: @ 0x08010938
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0801097C @ =sub_80107EC
	ldr r2, _08010980 @ =0x00002010
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
_0801097C: .4byte sub_80107EC
_08010980: .4byte 0x00002010
