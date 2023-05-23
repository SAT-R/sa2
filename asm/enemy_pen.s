.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Pen
CreateEntity_Pen: @ 0x08057854
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
	ldr r0, _080578B0 @ =sub_8057980
	ldr r2, _080578B4 @ =0x00004040
	ldr r1, _080578B8 @ =TaskDestructor_80095E8
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
	beq _080578C0
	ldr r0, _080578BC @ =IWRAM_START + 0x50
	adds r1, r1, r0
	movs r0, #1
	b _080578C6
	.align 2, 0
_080578B0: .4byte sub_8057980
_080578B4: .4byte 0x00004040
_080578B8: .4byte TaskDestructor_80095E8
_080578BC: .4byte IWRAM_START + 0x50
_080578C0:
	ldr r2, _08057978 @ =IWRAM_START + 0x50
	adds r1, r1, r2
	movs r0, #0
_080578C6:
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
	ldr r3, _0805797C @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	str r4, [r7, #0x4c]
	adds r0, r7, #0
	adds r0, #0x51
	strb r4, [r0]
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
	movs r0, #0xc
	bl VramMalloc
	mov r1, r8
	str r0, [r1, #4]
	movs r0, #0xfa
	lsls r0, r0, #1
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
_08057978: .4byte IWRAM_START + 0x50
_0805797C: .4byte sub_801EE64

	thumb_func_start sub_8057980
sub_8057980: @ 0x08057980
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _080579C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r0, #0xc
	adds r5, r2, r0
	ldr r1, [r4]
	mov sb, r1
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080579CE
	ldr r3, _080579C4 @ =IWRAM_START + 0x51
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080579C8
	ldr r0, [r4, #0x44]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	b _080579EC
	.align 2, 0
_080579C0: .4byte gCurTask
_080579C4: .4byte IWRAM_START + 0x51
_080579C8:
	ldr r0, [r4, #0x44]
	adds r0, #0x80
	b _080579EC
_080579CE:
	ldr r3, _080579E0 @ =IWRAM_START + 0x51
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080579E8
	ldr r0, [r4, #0x44]
	ldr r1, _080579E4 @ =0xFFFFFE00
	adds r0, r0, r1
	b _080579EC
	.align 2, 0
_080579E0: .4byte IWRAM_START + 0x51
_080579E4: .4byte 0xFFFFFE00
_080579E8:
	ldr r0, [r4, #0x44]
	subs r0, #0x80
_080579EC:
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
	movs r3, #0
	str r3, [sp]
	ldr r3, _08057AE0 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08057A3C
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
	ldr r3, _08057AE4 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057A3C:
	cmp r0, #0
	ble _08057A48
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08057A48:
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
	ldr r0, _08057AE8 @ =gCamera
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
	bne _08057AD6
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057AAC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057AAC
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057AAC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057AF0
_08057AAC:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057AD0
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057AD0
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057AF0
_08057AD0:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
_08057AD6:
	ldr r0, _08057AEC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057BBA
	.align 2, 0
_08057AE0: .4byte sub_801EE64
_08057AE4: .4byte sub_801EC3C
_08057AE8: .4byte gCamera
_08057AEC: .4byte gCurTask
_08057AF0:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057B18
	ldr r0, _08057B14 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r0, r6, #8
	mov r8, r0
	cmp r1, r8
	ble _08057B50
	adds r0, r6, #0
	adds r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	bge _08057B50
	b _08057B2E
	.align 2, 0
_08057B14: .4byte gPlayer
_08057B18:
	ldr r0, _08057BC8 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r2, r6, #8
	mov r8, r2
	cmp r1, r8
	bge _08057B50
	adds r0, r6, #0
	subs r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	ble _08057B50
_08057B2E:
	adds r2, r4, #0
	adds r2, #0x51
	ldrb r0, [r2]
	cmp r0, #0
	bne _08057B4C
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08057B4C:
	movs r0, #1
	strb r0, [r2]
_08057B50:
	ldr r1, [r4, #0x44]
	asrs r3, r1, #8
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	mov ip, r0
	cmp r3, r2
	bgt _08057B70
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057B8A
_08057B70:
	asrs r1, r4, #8
	mov r3, sb
	ldrb r0, [r3, #5]
	add r0, ip
	lsls r0, r0, #3
	cmp r1, r0
	blt _08057BA6
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057BA6
_08057B8A:
	ldr r0, _08057BCC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057BD0 @ =sub_8057BD4
	str r0, [r1, #8]
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08057BA6:
	lsls r1, r7, #8
	mov r0, r8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08057BBA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057BC8: .4byte gPlayer
_08057BCC: .4byte gCurTask
_08057BD0: .4byte sub_8057BD4

	thumb_func_start sub_8057BD4
sub_8057BD4: @ 0x08057BD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08057C8C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r1, _08057C90 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r4]
	mov sl, r2
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _08057C94 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov r8, r2
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08057C98 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08057C44
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
	ldr r3, _08057C9C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057C44:
	cmp r0, #0
	ble _08057C50
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08057C50:
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
	ldr r0, _08057CA0 @ =gCamera
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
	beq _08057CA4
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08057D6C
	.align 2, 0
_08057C8C: .4byte gCurTask
_08057C90: .4byte IWRAM_START + 0xC
_08057C94: .4byte IWRAM_START + 0x50
_08057C98: .4byte sub_801EE64
_08057C9C: .4byte sub_801EC3C
_08057CA0: .4byte gCamera
_08057CA4:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057CD6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057CD6
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057CD6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057D10
_08057CD6:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057CFA
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057CFA
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057D10
_08057CFA:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08057D0C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057D6C
	.align 2, 0
_08057D0C: .4byte gCurTask
_08057D10:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _08057D66
	adds r0, r4, #0
	adds r0, #0x51
	strb r1, [r0]
	ldr r1, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08057D44
	ldr r0, _08057D40 @ =0xFFFFFBFF
	ands r1, r0
	b _08057D46
	.align 2, 0
_08057D40: .4byte 0xFFFFFBFF
_08057D44:
	orrs r1, r2
_08057D46:
	str r1, [r7, #0x10]
	movs r1, #0
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08057D7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057D80 @ =sub_8057980
	str r0, [r1, #8]
_08057D66:
	adds r0, r7, #0
	bl sub_80051E8
_08057D6C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057D7C: .4byte gCurTask
_08057D80: .4byte sub_8057980
