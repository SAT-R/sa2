.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8039B54
sub_8039B54: @ 0x08039B54
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08039B72
	ldrb r0, [r6]
	cmp r0, #0xf
	bhi _08039C22
_08039B72:
	ldr r0, _08039C30 @ =Task_8039C4C
	ldr r2, _08039C34 @ =0x00005432
	movs r1, #0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, [r7, #0x14]
	lsls r0, r0, #8
	str r0, [r2, #0x30]
	ldr r0, [r7, #0x18]
	lsls r0, r0, #8
	str r0, [r2, #0x34]
	ldr r3, _08039C38 @ =gSineTable
	mov sb, r3
	ldrh r3, [r7, #0xc]
	ldr r1, _08039C3C @ =0x000003FF
	adds r0, r1, #0
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #1
	mov r8, r5
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov ip, r3
	ldrh r0, [r7, #0xe]
	mov r3, ip
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xe
	movs r3, #0
	strh r0, [r2, #0x38]
	ldrh r0, [r7, #0xc]
	ands r1, r0
	lsls r1, r1, #1
	add r1, sb
	movs r5, #0
	ldrsh r1, [r1, r5]
	ldrh r0, [r7, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0x3a]
	ldrh r0, [r7, #0x1c]
	strh r0, [r2, #0x3c]
	str r6, [r2, #0x40]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	ldr r0, [r7]
	str r0, [r2, #4]
	mov r0, r8
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	ldrh r0, [r7, #8]
	strh r0, [r2, #0xa]
	ldrh r1, [r7, #0xa]
	ldr r5, _08039C40 @ =IWRAM_START + 0x20
	adds r0, r4, r5
	strb r1, [r0]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r0, _08039C44 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r5, #2
	adds r1, r4, r5
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08039C48 @ =IWRAM_START + 0x25
	adds r4, r4, r0
	strb r3, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
_08039C22:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039C30: .4byte Task_8039C4C
_08039C34: .4byte 0x00005432
_08039C38: .4byte gSineTable
_08039C3C: .4byte 0x000003FF
_08039C40: .4byte IWRAM_START + 0x20
_08039C44: .4byte IWRAM_START + 0x21
_08039C48: .4byte IWRAM_START + 0x25

	thumb_func_start Task_8039C4C
Task_8039C4C: @ 0x08039C4C
	push {r4, r5, r6, r7, lr}
	ldr r2, _08039CF4 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r1, [r4, #0xa]
	ldr r0, _08039CF8 @ =0x0000026B
	adds r6, r2, #0
	cmp r1, r0
	bne _08039C6E
	ldr r1, _08039CFC @ =0xFFFFFF00
	adds r0, r1, #0
	ldrh r2, [r4, #0x38]
	adds r0, r0, r2
	strh r0, [r4, #0x38]
_08039C6E:
	ldrh r0, [r4, #0x3c]
	ldrh r7, [r4, #0x3a]
	adds r3, r0, r7
	strh r3, [r4, #0x3a]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #0x34]
	adds r1, r1, r2
	str r1, [r4, #0x34]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	asrs r1, r1, #8
	strh r1, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r2, r5
	bge _08039CA6
	movs r7, #0x38
	ldrsh r0, [r4, r7]
	cmp r0, #0
	blt _08039CCE
_08039CA6:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	ble _08039CB6
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _08039CCE
_08039CB6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, r5
	bge _08039CC4
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _08039CCE
_08039CC4:
	cmp r1, #0xc0
	ble _08039CD4
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _08039CD4
_08039CCE:
	ldr r1, [r6]
	ldr r0, _08039D00 @ =Task_8039F80
	str r0, [r1, #8]
_08039CD4:
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08039CE6
	ldr r0, _08039CF4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08039D00 @ =Task_8039F80
	str r0, [r1, #8]
_08039CE6:
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039CF4: .4byte gCurTask
_08039CF8: .4byte 0x0000026B
_08039CFC: .4byte 0xFFFFFF00
_08039D00: .4byte Task_8039F80

	thumb_func_start sub_8039D04
sub_8039D04: @ 0x08039D04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08039D22
	ldrb r0, [r6]
	cmp r0, #0xf
	bhi _08039DD2
_08039D22:
	ldr r0, _08039DE0 @ =Task_8039DFC
	ldr r2, _08039DE4 @ =0x00005432
	movs r1, #0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, [r7, #0x14]
	lsls r0, r0, #8
	str r0, [r2, #0x30]
	ldr r0, [r7, #0x18]
	lsls r0, r0, #8
	str r0, [r2, #0x34]
	ldr r3, _08039DE8 @ =gSineTable
	mov sb, r3
	ldrh r3, [r7, #0xc]
	ldr r1, _08039DEC @ =0x000003FF
	adds r0, r1, #0
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #1
	mov r8, r5
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov ip, r3
	ldrh r0, [r7, #0xe]
	mov r3, ip
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xe
	movs r3, #0
	strh r0, [r2, #0x38]
	ldrh r0, [r7, #0xc]
	ands r1, r0
	lsls r1, r1, #1
	add r1, sb
	movs r5, #0
	ldrsh r1, [r1, r5]
	ldrh r0, [r7, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0x3a]
	ldrh r0, [r7, #0x1c]
	strh r0, [r2, #0x3c]
	str r6, [r2, #0x40]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	ldr r0, [r7]
	str r0, [r2, #4]
	mov r0, r8
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	ldrh r0, [r7, #8]
	strh r0, [r2, #0xa]
	ldrh r1, [r7, #0xa]
	ldr r5, _08039DF0 @ =IWRAM_START + 0x20
	adds r0, r4, r5
	strb r1, [r0]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r0, _08039DF4 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r5, #2
	adds r1, r4, r5
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08039DF8 @ =IWRAM_START + 0x25
	adds r4, r4, r0
	strb r3, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
_08039DD2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039DE0: .4byte Task_8039DFC
_08039DE4: .4byte 0x00005432
_08039DE8: .4byte gSineTable
_08039DEC: .4byte 0x000003FF
_08039DF0: .4byte IWRAM_START + 0x20
_08039DF4: .4byte IWRAM_START + 0x21
_08039DF8: .4byte IWRAM_START + 0x25

	thumb_func_start Task_8039DFC
Task_8039DFC: @ 0x08039DFC
	push {r4, r5, r6, r7, lr}
	ldr r4, _08039E98 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x3a]
	adds r6, r0, r1
	strh r6, [r5, #0x3a]
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x30]
	adds r0, r0, r1
	str r0, [r5, #0x30]
	movs r3, #0x3a
	ldrsh r1, [r5, r3]
	ldr r2, [r5, #0x34]
	adds r2, r2, r1
	str r2, [r5, #0x34]
	asrs r0, r0, #8
	ldr r3, _08039E9C @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	asrs r2, r2, #8
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r5, #0x18]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r3, r1
	bge _08039E4C
	movs r7, #0x38
	ldrsh r0, [r5, r7]
	cmp r0, #0
	blt _08039E74
_08039E4C:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r3, r0
	ble _08039E5C
	movs r3, #0x38
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bgt _08039E74
_08039E5C:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r2, r1
	bge _08039E6A
	lsls r0, r6, #0x10
	cmp r0, #0
	blt _08039E74
_08039E6A:
	cmp r2, #0xc0
	ble _08039E7A
	lsls r0, r6, #0x10
	cmp r0, #0
	ble _08039E7A
_08039E74:
	ldr r1, [r4]
	ldr r0, _08039EA0 @ =Task_8039F80
	str r0, [r1, #8]
_08039E7A:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _08039E8C
	ldr r0, _08039E98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08039EA0 @ =Task_8039F80
	str r0, [r1, #8]
_08039E8C:
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039E98: .4byte gCurTask
_08039E9C: .4byte gCamera
_08039EA0: .4byte Task_8039F80

@; R0 = Zone/Boss index
	thumb_func_start sub_8039EA4
sub_8039EA4: @ 0x08039EA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bhi _08039EC4
	ldr r2, _08039EC8 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08039ECC @ =0x0000FFDE
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08039ED0 @ =gUnknown_080D798C
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08039EC4:
	pop {r0}
	bx r0
	.align 2, 0
_08039EC8: .4byte gUnknown_03005424
_08039ECC: .4byte 0x0000FFDE
_08039ED0: .4byte gUnknown_080D798C

@ XX - Called on init of every boss (except for 1st?)
	thumb_func_start sub_8039ED4
sub_8039ED4: @ 0x08039ED4
	push {lr}
	ldr r0, _08039F00 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #28
	bne _08039EFA
	ldr r2, _08039F04 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08039F08 @ =0xF7FFFFFF
	ands r0, r1
	ldr r1, _08039F0C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _08039F10 @ =PlayerCB_8025318
	str r0, [r2]
	adds r2, #0x6d
	movs r0, #0
	strb r0, [r2]
_08039EFA:
	pop {r0}
	bx r0
	.align 2, 0
_08039F00: .4byte gCurrentLevel
_08039F04: .4byte gPlayer
_08039F08: .4byte 0xF7FFFFFF
_08039F0C: .4byte 0xFFDFFFFF
_08039F10: .4byte PlayerCB_8025318

	thumb_func_start sub_8039F14
sub_8039F14: @ 0x08039F14
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08039F44 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	cmp r0, #0x1c
	beq _08039F3E
	ldr r0, _08039F48 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08039F3E
	ldr r0, _08039F4C @ =gUnknown_080D79B0
	asrs r1, r1, #0x1a
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
_08039F3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039F44: .4byte gCurrentLevel
_08039F48: .4byte gActiveBossTask
_08039F4C: .4byte gUnknown_080D79B0

	thumb_func_start sub_8039F50
sub_8039F50: @ 0x08039F50
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #6
	bhi _08039F74
	ldr r0, _08039F78 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08039F74
	ldr r0, _08039F7C @ =gUnknown_080D79B0
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	movs r1, #0
	bl _call_via_r2
_08039F74:
	pop {r0}
	bx r0
	.align 2, 0
_08039F78: .4byte gActiveBossTask
_08039F7C: .4byte gUnknown_080D79B0

	thumb_func_start Task_8039F80
Task_8039F80: @ 0x08039F80
	push {lr}
	ldr r2, _08039FA0 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0, #0x40]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08039FA0: .4byte gCurTask

	thumb_func_start sub_8039FA4
sub_8039FA4: @ 0x08039FA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	str r2, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _0803A0B4 @ =Task_803A10C
	movs r2, #0xe0
	lsls r2, r2, #6
	ldr r1, _0803A0B8 @ =TaskDestructor_803A230
	str r1, [sp]
	movs r1, #0x64
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r7, r5
	movs r0, #237     @ Eggmobile 
	bl m4aSongNumStart
	ldr r0, _0803A0BC @ =gMPlayInfo_SE2
	movs r1, #9
	bl m4aMPlayFadeOutTemporarily
	ldr r0, _0803A0C0 @ =IWRAM_START + 0x60
	adds r1, r7, r0
	movs r6, #0
	movs r0, #0x3c
	strh r0, [r1]
	ldr r1, _0803A0C4 @ =IWRAM_START + 0x30
	adds r4, r7, r1
	mov r0, r8
	strh r0, [r4, #0x16]
	mov r1, sb
	strh r1, [r4, #0x18]
	movs r0, #8
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0803A0C8 @ =0x0000027D
	strh r0, [r4, #0xa]
	ldr r1, _0803A0CC @ =IWRAM_START + 0x50
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _0803A0D0 @ =IWRAM_START + 0x51
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0803A0D4 @ =IWRAM_START + 0x52
	adds r0, r7, r1
	movs r1, #0x10
	strb r1, [r0]
	ldr r1, _0803A0D8 @ =IWRAM_START + 0x55
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r4, #0x28]
	ldr r1, [sp, #4]
	str r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	mov r0, r8
	strh r0, [r5, #0x16]
	mov r1, sb
	strh r1, [r5, #0x18]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x9f
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r1, _0803A0DC @ =IWRAM_START + 0x20
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _0803A0E0 @ =IWRAM_START + 0x21
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0803A0E4 @ =IWRAM_START + 0x22
	adds r0, r7, r1
	movs r1, #0x10
	strb r1, [r0]
	ldr r1, _0803A0E8 @ =IWRAM_START + 0x25
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	mov r0, sl
	str r0, [r5, #0x28]
	ldr r1, [sp, #4]
	str r1, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r0, #0x80
	lsls r0, r0, #3
	ldr r1, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _0803A0F0
	ldr r0, _0803A0EC @ =IWRAM_START + 0x62
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
	b _0803A0F8
	.align 2, 0
_0803A0B4: .4byte Task_803A10C
_0803A0B8: .4byte TaskDestructor_803A230
_0803A0BC: .4byte gMPlayInfo_SE2
_0803A0C0: .4byte IWRAM_START + 0x60
_0803A0C4: .4byte IWRAM_START + 0x30
_0803A0C8: .4byte 0x0000027D
_0803A0CC: .4byte IWRAM_START + 0x50
_0803A0D0: .4byte IWRAM_START + 0x51
_0803A0D4: .4byte IWRAM_START + 0x52
_0803A0D8: .4byte IWRAM_START + 0x55
_0803A0DC: .4byte IWRAM_START + 0x20
_0803A0E0: .4byte IWRAM_START + 0x21
_0803A0E4: .4byte IWRAM_START + 0x22
_0803A0E8: .4byte IWRAM_START + 0x25
_0803A0EC: .4byte IWRAM_START + 0x62
_0803A0F0:
	ldr r1, _0803A108 @ =IWRAM_START + 0x62
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
_0803A0F8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A108: .4byte IWRAM_START + 0x62

@; XX - One boss destroyed -> Eggmobile moves upwards (until his Y-pos is <= 50)
	thumb_func_start Task_803A10C
Task_803A10C: @ 0x0803A10C
	push {r4, r5, r6, lr}
	ldr r6, _0803A158 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r0, _0803A15C @ =IWRAM_START + 0x30
	adds r4, r4, r0
	ldrh r0, [r4, #0x18]
	subs r0, #2
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r5, #0x18]
	subs r0, #2
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	cmp r0, #0x32
	bgt _0803A150
	ldr r1, [r6]
	ldr r0, _0803A160 @ =Task_803A164
	str r0, [r1, #8]
_0803A150:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A158: .4byte gCurTask
_0803A15C: .4byte IWRAM_START + 0x30
_0803A160: .4byte Task_803A164

@; XX - One boss destroyed -> Eggman flees to the next
	thumb_func_start Task_803A164
Task_803A164: @ 0x0803A164
	push {r4, r5, lr}
	ldr r3, _0803A1C4 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0x60
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803A1A2
	ldr r1, _0803A1C8 @ =IWRAM_START + 0x62
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A19C
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r0, [r5, #0x40]
	orrs r0, r1
	str r0, [r5, #0x40]
_0803A19C:
	ldr r1, [r3]
	ldr r0, _0803A1CC @ =Task_803A1D0
	str r0, [r1, #8]
_0803A1A2:
	adds r4, r5, #0
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A1C4: .4byte gCurTask
_0803A1C8: .4byte IWRAM_START + 0x62
_0803A1CC: .4byte Task_803A1D0

	thumb_func_start Task_803A1D0
Task_803A1D0: @ 0x0803A1D0
	push {r4, r5, r6, lr}
	ldr r6, _0803A200 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0x30
	adds r4, r1, r0
	ldrh r2, [r4, #0x16]
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	movs r0, #0x87
	lsls r0, r0, #1
	cmp r1, r0
	ble _0803A204
	movs r0, #0xed
	bl m4aSongNumStop
	ldr r0, [r6]
	bl TaskDestroy
	b _0803A228
	.align 2, 0
_0803A200: .4byte gCurTask
_0803A204:
	adds r0, r2, #2
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, r5, #0
	ldrh r0, [r4, #0x16]
	adds r0, #2
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803A228:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_803A230
TaskDestructor_803A230: @ 0x0803A230
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
