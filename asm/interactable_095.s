.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable095
initSprite_Interactable095: @ 0x0807EE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807EF08 @ =Task_Interactable095
	ldr r2, _0807EF0C @ =0x00002010
	ldr r1, _0807EF10 @ =TaskDestructor_Interactable095
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sb, r0
	movs r2, #0
	str r2, [r0, #0x44]
	str r2, [r0, #0x48]
	mov r1, sl
	str r1, [r0]
	movs r3, #0
	mov r8, r3
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	ldrb r0, [r1]
	mov r1, sb
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	ldr r3, _0807EF14 @ =IWRAM_START + 0xC
	adds r4, r7, r3
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _0807EF18 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r3, #0x22
	adds r1, r7, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807EF1C @ =IWRAM_START + 0x31
	adds r0, r7, r1
	mov r3, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x12
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807EF20 @ =0x0000026A
	strh r0, [r4, #0xa]
	ldr r1, _0807EF24 @ =IWRAM_START + 0x2C
	adds r0, r7, r1
	mov r3, r8
	strb r3, [r0]
	adds r0, r4, #0
	bl sub_8004558
	mov r1, sl
	ldrb r0, [r1, #5]
	ldr r2, [sp, #4]
	ldrb r3, [r1, #6]
	cmp r0, r3
	bls _0807EF54
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0807EF34
	ldr r0, _0807EF28 @ =IWRAM_START + 0x4C
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF2C @ =IWRAM_START + 0x4E
	adds r0, r7, r1
	strh r2, [r0]
	ldr r3, _0807EF30 @ =IWRAM_START + 0x50
	adds r0, r7, r3
	strh r2, [r0]
	b _0807EF96
	.align 2, 0
_0807EF08: .4byte Task_Interactable095
_0807EF0C: .4byte 0x00002010
_0807EF10: .4byte TaskDestructor_Interactable095
_0807EF14: .4byte IWRAM_START + 0xC
_0807EF18: .4byte IWRAM_START + 0x2D
_0807EF1C: .4byte IWRAM_START + 0x31
_0807EF20: .4byte 0x0000026A
_0807EF24: .4byte IWRAM_START + 0x2C
_0807EF28: .4byte IWRAM_START + 0x4C
_0807EF2C: .4byte IWRAM_START + 0x4E
_0807EF30: .4byte IWRAM_START + 0x50
_0807EF34:
	ldr r0, _0807EF48 @ =IWRAM_START + 0x4C
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF4C @ =IWRAM_START + 0x4E
	adds r0, r7, r1
	strh r2, [r0]
	ldr r3, _0807EF50 @ =IWRAM_START + 0x50
	b _0807EF90
	.align 2, 0
_0807EF48: .4byte IWRAM_START + 0x4C
_0807EF4C: .4byte IWRAM_START + 0x4E
_0807EF50: .4byte IWRAM_START + 0x50
_0807EF54:
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0807EF80
	ldr r3, _0807EF74 @ =IWRAM_START + 0x4C
	adds r0, r7, r3
	strh r2, [r0]
	ldr r0, _0807EF78 @ =IWRAM_START + 0x4E
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF7C @ =IWRAM_START + 0x50
	adds r0, r7, r1
	strh r2, [r0]
	b _0807EF96
	.align 2, 0
_0807EF74: .4byte IWRAM_START + 0x4C
_0807EF78: .4byte IWRAM_START + 0x4E
_0807EF7C: .4byte IWRAM_START + 0x50
_0807EF80:
	ldr r3, _0807EFBC @ =IWRAM_START + 0x4C
	adds r0, r7, r3
	strh r2, [r0]
	ldr r0, _0807EFC0 @ =IWRAM_START + 0x4E
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	adds r3, #4
_0807EF90:
	adds r1, r7, r3
	movs r0, #0x80
	strh r0, [r1]
_0807EF96:
	mov r0, sb
	bl sub_807EFC4
	mov r0, sb
	bl sub_807F0D8
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sl
	strb r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFBC: .4byte IWRAM_START + 0x4C
_0807EFC0: .4byte IWRAM_START + 0x4E

	thumb_func_start sub_807EFC4
sub_807EFC4: @ 0x0807EFC4
	push {r4, r5, r6, lr}
	mov ip, r0
	ldr r6, [r0]
	mov r1, ip
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807F004
	ldrb r3, [r6, #5]
	lsls r3, r3, #0xb
	ldr r5, _0807F06C @ =gSineTable
	adds r4, r0, #0
	ldr r2, _0807F070 @ =gUnknown_03005590
	mov r0, ip
	adds r0, #0x50
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _0807F074 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x44]
_0807F004:
	mov r1, ip
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807F03E
	ldrb r3, [r6, #6]
	lsls r3, r3, #0xb
	ldr r5, _0807F06C @ =gSineTable
	adds r4, r0, #0
	ldr r2, _0807F070 @ =gUnknown_03005590
	mov r0, ip
	adds r0, #0x50
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _0807F074 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x48]
_0807F03E:
	mov r0, ip
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r2, ip
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldrb r1, [r6, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F06C: .4byte gSineTable
_0807F070: .4byte gUnknown_03005590
_0807F074: .4byte 0x000003FF

	thumb_func_start Task_Interactable095
Task_Interactable095: @ 0x0807F078
	push {r4, lr}
	ldr r0, _0807F0B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807EFC4
	adds r0, r4, #0
	bl sub_807F17C
	cmp r0, #0
	beq _0807F09C
	ldr r0, _0807F0B4 @ =gPlayer
	bl sub_800CBA4
_0807F09C:
	adds r0, r4, #0
	bl sub_807F120
	cmp r0, #0
	beq _0807F0B8
	adds r0, r4, #0
	bl sub_807F1B4
	b _0807F0BE
	.align 2, 0
_0807F0B0: .4byte gCurTask
_0807F0B4: .4byte gPlayer
_0807F0B8:
	adds r0, r4, #0
	bl sub_807F0D8
_0807F0BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable095
TaskDestructor_Interactable095: @ 0x0807F0C4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807F0D8
sub_807F0D8: @ 0x0807F0D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	ldr r2, _0807F118 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, [r4, #0x40]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	ldr r0, [r4, #0x1c]
	ldr r1, _0807F11C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x1c]
	adds r5, r4, #0
	adds r5, #0xc
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, [r4, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x1c]
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F118: .4byte gCamera
_0807F11C: .4byte 0xFFFFFBFF

	thumb_func_start sub_807F120
sub_807F120: @ 0x0807F120
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _0807F170 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r0, [r4, #5]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _0807F16A
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _0807F16A
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _0807F16A
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	ble _0807F174
_0807F16A:
	movs r0, #1
	b _0807F176
	.align 2, 0
_0807F170: .4byte gCamera
_0807F174:
	movs r0, #0
_0807F176:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807F17C
sub_807F17C: @ 0x0807F17C
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807F1A8 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F1A2
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	bl sub_800DF38
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _0807F1AC
_0807F1A2:
	movs r0, #0
	b _0807F1AE
	.align 2, 0
_0807F1A8: .4byte gPlayer
_0807F1AC:
	movs r0, #1
_0807F1AE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807F1B4
sub_807F1B4: @ 0x0807F1B4
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807F1C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807F1C8: .4byte gCurTask
