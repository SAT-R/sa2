.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Enemy_Bell
initSprite_Enemy_Bell: @ 0x08054AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sb, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08054BD4 @ =sub_8054BF4
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r1, _08054BD8 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _08054BDC @ =IWRAM_START + 0xC
	adds r6, r3, r2
	ldr r0, _08054BE0 @ =IWRAM_START + 0x4C
	adds r2, r3, r0
	movs r0, #0
	mov sl, r0
	movs r0, #0x78
	strb r0, [r2]
	movs r7, #0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r2, r8
	str r2, [r1]
	ldrb r0, [r2]
	strb r0, [r1, #8]
	mov r0, sb
	strb r0, [r1, #9]
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
	movs r0, #0x14
	str r3, [sp, #4]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08054BE4 @ =0x000001ED
	strh r0, [r6, #0xa]
	ldr r3, [sp, #4]
	ldr r2, _08054BE8 @ =IWRAM_START + 0x2C
	adds r0, r3, r2
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	mov r0, sl
	strh r0, [r6, #8]
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x1c]
	adds r2, #1
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08054BEC @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08054BF0 @ =IWRAM_START + 0x31
	adds r3, r3, r1
	strb r7, [r3]
	subs r0, #0x11
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054BD4: .4byte sub_8054BF4
_08054BD8: .4byte TaskDestructor_80095E8
_08054BDC: .4byte IWRAM_START + 0xC
_08054BE0: .4byte IWRAM_START + 0x4C
_08054BE4: .4byte 0x000001ED
_08054BE8: .4byte IWRAM_START + 0x2C
_08054BEC: .4byte IWRAM_START + 0x2E
_08054BF0: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8054BF4
sub_8054BF4: @ 0x08054BF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08054C48 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r1, _08054C4C @ =IWRAM_START + 0xC
	adds r6, r7, r1
	ldr r2, [r0]
	mov sl, r2
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r0, #0x48]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08054C50 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08054C54
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08054D06
	.align 2, 0
_08054C48: .4byte gCurTask
_08054C4C: .4byte IWRAM_START + 0xC
_08054C50: .4byte gCamera
_08054C54:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054C78
	movs r2, #0x18
	ldrsh r0, [r6, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08054C78
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054C90
_08054C78:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _08054C8C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054D06
	.align 2, 0
_08054C8C: .4byte gCurTask
_08054C90:
	ldr r0, _08054CBC @ =IWRAM_START + 0x4C
	adds r3, r7, r0
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08054CF0
	ldr r2, _08054CC0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08054CC4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08054CC8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08054CCC
	movs r0, #0x7c
	b _08054CCE
	.align 2, 0
_08054CBC: .4byte IWRAM_START + 0x4C
_08054CC0: .4byte gPseudoRandom
_08054CC4: .4byte 0x00196225
_08054CC8: .4byte 0x3C6EF35F
_08054CCC:
	movs r0, #0xb4
_08054CCE:
	strb r0, [r3]
	ldr r0, _08054D14 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054D18 @ =sub_8054D20
	str r0, [r1, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	ldr r0, _08054D1C @ =0x000001ED
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08054CF0:
	mov r2, r8
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08054D06:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054D14: .4byte gCurTask
_08054D18: .4byte sub_8054D20
_08054D1C: .4byte 0x000001ED

	thumb_func_start sub_8054D20
sub_8054D20: @ 0x08054D20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08054D98 @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r7, r1, r0
	ldr r6, _08054D9C @ =IWRAM_START + 0xC
	add r6, r8
	ldr r0, [r7]
	mov sb, r0
	ldr r1, [r7, #0x44]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x48]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08054DA0 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_800C84C
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054D88
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08054D88
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054DA4
_08054D88:
	ldrb r0, [r7, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r0, _08054D98 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054DEA
	.align 2, 0
_08054D98: .4byte gCurTask
_08054D9C: .4byte IWRAM_START + 0xC
_08054DA0: .4byte gCamera
_08054DA4:
	ldr r1, _08054DF8 @ =IWRAM_START + 0x4C
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08054DDE
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08054DFC @ =0x000001ED
	strh r0, [r6, #0xa]
	ldr r1, _08054E00 @ =IWRAM_START + 0x2C
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08054E04 @ =IWRAM_START + 0x2D
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x30]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _08054E08 @ =sub_8054BF4
	str r0, [r1, #8]
_08054DDE:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08054DEA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054DF8: .4byte IWRAM_START + 0x4C
_08054DFC: .4byte 0x000001ED
_08054E00: .4byte IWRAM_START + 0x2C
_08054E04: .4byte IWRAM_START + 0x2D
_08054E08: .4byte sub_8054BF4
