.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_Checkpoint
initSprite_Interactable_Checkpoint: @ 0x08062E90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _08062ECC @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062EDC
	ldr r0, _08062ED0 @ =sub_8062FD8
	ldr r2, _08062ED4 @ =0x00002010
	ldr r1, _08062ED8 @ =TaskDestructor_8063214
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	b _08062EEC
	.align 2, 0
_08062ECC: .4byte gUnknown_030055B0
_08062ED0: .4byte sub_8062FD8
_08062ED4: .4byte 0x00002010
_08062ED8: .4byte TaskDestructor_8063214
_08062EDC:
	ldr r0, _08062FA8 @ =Task_806319C
	ldr r2, _08062FAC @ =0x00002010
	ldr r1, _08062FB0 @ =TaskDestructor_8063214
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
_08062EEC:
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r0, _08062FB4 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r1, #0
	mov r8, r1
	mov r2, sl
	strh r2, [r6, #4]
	mov r0, sb
	strh r0, [r6, #6]
	str r7, [r6]
	ldrb r0, [r7]
	strb r0, [r6, #8]
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r6, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #4
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08062FB8 @ =0x00000213
	strh r0, [r4, #0xa]
	ldr r2, _08062FBC @ =IWRAM_START + 0x2C
	adds r0, r5, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	mov r2, r8
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08062FC0 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08062FC4 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08062FC8 @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	ldr r1, _08062FCC @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r2, r2, #0x18
	ldr r3, _08062FD0 @ =gUnknown_080D94F8
	lsrs r2, r2, #0x16
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r2, [r2]
	ldr r3, _08062FD4 @ =sub_8063228
	bl sub_8009628
	str r0, [r6, #0x3c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062FA8: .4byte Task_806319C
_08062FAC: .4byte 0x00002010
_08062FB0: .4byte TaskDestructor_8063214
_08062FB4: .4byte IWRAM_START + 0xC
_08062FB8: .4byte 0x00000213
_08062FBC: .4byte IWRAM_START + 0x2C
_08062FC0: .4byte IWRAM_START + 0x2D
_08062FC4: .4byte IWRAM_START + 0x2E
_08062FC8: .4byte IWRAM_START + 0x31
_08062FCC: .4byte gCurrentLevel
_08062FD0: .4byte gUnknown_080D94F8
_08062FD4: .4byte sub_8063228

	thumb_func_start sub_8062FD8
sub_8062FD8: @ 0x08062FD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08063048 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r5, r0
	ldr r1, _0806304C @ =IWRAM_START + 0xC
	adds r4, r5, r1
	ldr r6, [r3]
	ldrb r1, [r3, #8]
	lsls r1, r1, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r7, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r1, _08063050 @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	subs r2, r2, r1
	strh r2, [r4, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08063034
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08063034
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08063054
_08063034:
	ldrb r0, [r3, #8]
	strb r0, [r6]
	ldr r0, [r3, #0x3c]
	bl TaskDestroy
	ldr r0, _08063048 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080630D4
	.align 2, 0
_08063048: .4byte gCurTask
_0806304C: .4byte IWRAM_START + 0xC
_08063050: .4byte gCamera
_08063054:
	ldr r0, _080630E0 @ =gPlayer
	mov ip, r0
	ldr r0, [r0, #0x20]
	ldr r1, _080630E4 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _080630C8
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	cmp r7, r0
	bgt _080630C8
	ldr r2, _080630E8 @ =gUnknown_080D63FC
	ldr r3, _080630EC @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r0]
	mov r0, ip
	adds r0, #0x74
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	mov r1, ip
	adds r1, #0x76
	strh r0, [r1]
	ldr r0, _080630F0 @ =gUnknown_030053E4
	ldr r0, [r0]
	mov r1, ip
	str r0, [r1, #0x78]
	ldr r1, _080630F4 @ =gUnknown_030055B0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080630A6
	adds r0, #1
	strb r0, [r1]
_080630A6:
	ldr r0, _080630F8 @ =0x00000213
	strh r0, [r4, #0xa]
	ldr r0, _080630FC @ =IWRAM_START + 0x2C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08063100 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _08063104 @ =sub_8063108
	str r0, [r1, #8]
	movs r0, #152 @ SE_CHECKPOINT
	bl m4aSongNumStart
_080630C8:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080630D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080630E0: .4byte gPlayer
_080630E4: .4byte 0x00400080
_080630E8: .4byte gUnknown_080D63FC
_080630EC: .4byte gCurrentLevel
_080630F0: .4byte gUnknown_030053E4
_080630F4: .4byte gUnknown_030055B0
_080630F8: .4byte 0x00000213
_080630FC: .4byte IWRAM_START + 0x2C
_08063100: .4byte IWRAM_START + 0x2D
_08063104: .4byte sub_8063108

	thumb_func_start sub_8063108
sub_8063108: @ 0x08063108
	push {r4, r5, r6, r7, lr}
	ldr r7, _08063174 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _08063178 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0806315E
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0806315E
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0806317C
_0806315E:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, [r4, #0x3c]
	bl TaskDestroy
	ldr r0, _08063174 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08063192
	.align 2, 0
_08063174: .4byte gCurTask
_08063178: .4byte gCamera
_0806317C:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0806318C
	ldr r1, [r7]
	ldr r0, _08063198 @ =Task_806319C
	str r0, [r1, #8]
_0806318C:
	adds r0, r5, #0
	bl sub_80051E8
_08063192:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063198: .4byte Task_806319C

	thumb_func_start Task_806319C
Task_806319C: @ 0x0806319C
	push {r4, r5, r6, lr}
	ldr r0, _0806320C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _08063210 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _080631F2
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080631F2
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08063204
_080631F2:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, [r4, #0x3c]
	bl TaskDestroy
	ldr r0, _0806320C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08063204:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806320C: .4byte gCurTask
_08063210: .4byte gCamera

.if 0
.endif
