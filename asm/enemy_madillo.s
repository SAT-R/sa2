.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_8056230
Task_8056230: @ 0x08056230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08056264 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r1, [r4]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08056268
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	subs r0, r0, r1
	b _0805626E
	.align 2, 0
_08056264: .4byte gCurTask
_08056268:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
_0805626E:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	add r3, sp, #8
	str r3, [sp]
	ldr r3, _08056420 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080562BE
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _08056424 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_080562BE:
	cmp r0, #0
	ble _080562CA
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_080562CA:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x44]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r7, r0, #8
	ldr r1, _08056428 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r0, _0805642C @ =gPlayer
	mov sl, r0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	movs r1, #0xc
	add r1, ip
	mov sb, r1
	ldr r1, [r1, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080563B8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r3, r0, r6
	mov r2, sl
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r2, r0, r1
	cmp r3, r2
	bgt _08056340
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	bge _08056354
	cmp r3, r2
	blt _080563B8
_08056340:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	blt _080563B8
_08056354:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r3, r7
	mov r1, sl
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov ip, r0
	mov r1, sb
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	mov r1, ip
	add r1, r8
	cmp r2, r1
	bgt _08056390
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _080563A4
	cmp r2, r1
	blt _080563B8
_08056390:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, r8
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080563B8
_080563A4:
	mov r0, sl
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080563B8
	mov r0, sl
	bl sub_800CBA4
_080563B8:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	ldr r3, _08056428 @ =gCamera
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _080563EC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080563EC
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080563EC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056434
_080563EC:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056410
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056410
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056434
_08056410:
	ldrb r0, [r4, #8]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r0, _08056430 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805649E
	.align 2, 0
_08056420: .4byte sub_801EE64
_08056424: .4byte sub_801EC3C
_08056428: .4byte gCamera
_0805642C: .4byte gPlayer
_08056430: .4byte gCurTask
_08056434:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08056456
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]
	movs r0, #3
	ldrsb r0, [r2, r0]
	ldrb r3, [r2, #5]
	adds r0, r0, r3
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08056466
	b _0805648A
_08056456:
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	cmp r1, r0
	bge _0805648A
_08056466:
	ldr r0, _080564B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080564B4 @ =Task_80564BC
	str r0, [r1, #8]
	movs r1, #0
	ldr r0, _080564B8 @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x51
	movs r0, #0x78
	strb r0, [r1]
_0805648A:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0805649E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080564B0: .4byte gCurTask
_080564B4: .4byte Task_80564BC
_080564B8: .4byte 0x000001F7

	thumb_func_start Task_80564BC
Task_80564BC: @ 0x080564BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r0, _080564F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r7, r1, r0
	ldr r1, [r4]
	mov sb, r1
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080564F4
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	subs r0, r0, r1
	b _080564FA
	.align 2, 0
_080564F0: .4byte gCurTask
_080564F4:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
_080564FA:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	add r3, sp, #8
	str r3, [sp]
	ldr r3, _08056608 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _0805654A
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _0805660C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_0805654A:
	cmp r0, #0
	ble _08056556
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08056556:
	ldr r1, [r4, #0x4c]
	movs r0, #0x5a
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	str r0, [r4, #0x4c]
	adds r0, #0x1f
	cmp r0, #0x3e
	bhi _0805656E
	movs r0, #0
	str r0, [r4, #0x4c]
_0805656E:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r0, _08056610 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080565FC
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080565D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080565D2
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080565D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056618
_080565D2:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080565F6
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080565F6
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056618
_080565F6:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
_080565FC:
	ldr r0, _08056614 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056664
	.align 2, 0
_08056608: .4byte sub_801EE64
_0805660C: .4byte sub_801EC3C
_08056610: .4byte gCamera
_08056614: .4byte gCurTask
_08056618:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056658
	ldr r0, _08056674 @ =0xFFFFFE80
	str r0, [r4, #0x4c]
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08056678 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805667C @ =Task_MadilloMain
	str r0, [r1, #8]
	movs r1, #0
	ldr r0, _08056680 @ =0x000001F7
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08056658:
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056664:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056674: .4byte 0xFFFFFE80
_08056678: .4byte gCurTask
_0805667C: .4byte Task_MadilloMain
_08056680: .4byte 0x000001F7
