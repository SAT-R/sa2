.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Madillo
CreateEntity_Madillo: @ 0x08055EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08055F38 @ =sub_8056014
	ldr r2, _08055F3C @ =0x00004040
	ldr r1, _08055F40 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov r8, r0
	strh r5, [r7, #4]
	mov r2, sl
	strh r2, [r7, #6]
	str r6, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #8]
	strb r4, [r7, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08055F48
	ldr r0, _08055F44 @ =IWRAM_START + 0x50
	adds r1, r1, r0
	movs r0, #1
	b _08055F4E
	.align 2, 0
_08055F38: .4byte sub_8056014
_08055F3C: .4byte 0x00004040
_08055F40: .4byte TaskDestructor_80095E8
_08055F44: .4byte IWRAM_START + 0x50
_08055F48:
	ldr r2, _08056004 @ =IWRAM_START + 0x50
	adds r1, r1, r2
	movs r0, #0
_08055F4E:
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #3
	lsls r5, r5, #8
	mov sb, r5
	add r1, sb
	lsls r1, r1, #8
	str r1, [r7, #0x3c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r2, sl
	lsls r5, r2, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r7, #0x40]
	movs r4, #0
	str r4, [r7, #0x44]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, r7, #0
	adds r2, #0x50
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _08056008 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	ldr r0, _0805600C @ =0xFFFFFE80
	str r0, [r7, #0x4c]
	adds r1, r7, #0
	adds r1, #0x51
	movs r0, #0x78
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, sb
	movs r7, #0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r1, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	movs r0, #0x10
	bl VramMalloc
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, _08056010 @ =0x000001F7
	strh r0, [r1, #0xa]
	mov r0, r8
	adds r0, #0x20
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x25
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, r8
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056004: .4byte IWRAM_START + 0x50
_08056008: .4byte sub_801EE64
_0805600C: .4byte 0xFFFFFE80
_08056010: .4byte 0x000001F7

	thumb_func_start sub_8056014
sub_8056014: @ 0x08056014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _080560C8 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _080560CC @ =IWRAM_START + 0xC
	adds r5, r3, r2
	ldr r0, [r4]
	mov sb, r0
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080560D0 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov r8, r2
	ldrb r2, [r2]
	ldr r3, _080560D4 @ =sub_801EC3C
	mov sl, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08056080
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
	mov r3, sl
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08056080:
	cmp r0, #0
	ble _0805608C
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_0805608C:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r0, _080560D8 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080560DC
	ldr r1, _080560C8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08056214
	.align 2, 0
_080560C8: .4byte gCurTask
_080560CC: .4byte IWRAM_START + 0xC
_080560D0: .4byte IWRAM_START + 0x50
_080560D4: .4byte sub_801EC3C
_080560D8: .4byte gCamera
_080560DC:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805610E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805610E
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805610E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056148
_0805610E:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056132
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056132
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056148
_08056132:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08056144 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056214
	.align 2, 0
_08056144: .4byte gCurTask
_08056148:
	adds r1, r7, #0
	subs r1, #0x32
	lsls r1, r1, #8
	ldr r0, _080561A8 @ =gPlayer
	ldr r2, [r0, #0xc]
	adds r3, r0, #0
	lsls r0, r6, #8
	mov r8, r0
	cmp r1, r2
	bge _08056200
	adds r0, r7, #0
	adds r0, #0x32
	lsls r0, r0, #8
	cmp r0, r2
	ble _08056200
	ldr r1, [r3, #8]
	cmp r8, r1
	ble _080561BC
	adds r0, r6, #0
	subs r0, #0x78
	lsls r0, r0, #8
	cmp r0, r1
	bge _080561BC
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	cmp r1, r0
	ble _08056200
	ldr r0, _080561AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080561B0 @ =sub_8056230
	str r0, [r1, #8]
	ldr r0, _080561B4 @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _080561B8 @ =0xFFFFFBFF
	ands r0, r1
	b _080561FE
	.align 2, 0
_080561A8: .4byte gPlayer
_080561AC: .4byte gCurTask
_080561B0: .4byte sub_8056230
_080561B4: .4byte 0x000001F7
_080561B8: .4byte 0xFFFFFBFF
_080561BC:
	adds r0, r6, #0
	adds r0, #0x78
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r0, r1
	ble _08056200
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	mov r3, sb
	movs r0, #3
	ldrsb r0, [r3, r0]
	ldrb r2, [r3, #5]
	adds r0, r0, r2
	lsls r0, r0, #3
	cmp r1, r0
	bge _08056200
	ldr r0, _08056224 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056228 @ =sub_8056230
	str r0, [r1, #8]
	ldr r0, _0805622C @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080561FE:
	str r0, [r5, #0x10]
_08056200:
	lsls r1, r7, #8
	mov r0, r8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08056214:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056224: .4byte gCurTask
_08056228: .4byte sub_8056230
_0805622C: .4byte 0x000001F7

	thumb_func_start sub_8056230
sub_8056230: @ 0x08056230
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
	ldr r0, _080564B4 @ =sub_80564BC
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
_080564B4: .4byte sub_80564BC
_080564B8: .4byte 0x000001F7

	thumb_func_start sub_80564BC
sub_80564BC: @ 0x080564BC
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
	ldr r0, _0805667C @ =sub_8056014
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
_0805667C: .4byte sub_8056014
_08056680: .4byte 0x000001F7
