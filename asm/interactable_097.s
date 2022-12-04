.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable097
initSprite_Interactable097: @ 0x0807F8DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807F9D8 @ =Task_Interactable097
	ldr r2, _0807F9DC @ =0x00002010
	ldr r1, _0807F9E0 @ =TaskDestructor_Interactable097
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	movs r1, #0
	str r1, [r7, #0x54]
	ldr r3, _0807F9E4 @ =IWRAM_START + 0x58
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _0807F9E8 @ =IWRAM_START + 0x5E
	adds r1, r2, r0
	movs r0, #0x20
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r7, #0x3c]
	mov r3, r8
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r7, #0x40]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x44]
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [r7, #0x48]
	strh r4, [r7, #4]
	strh r5, [r7, #6]
	str r3, [r7]
	ldrb r0, [r3]
	strb r0, [r7, #8]
	strb r6, [r7, #9]
	movs r1, #0
	ldr r0, _0807F9EC @ =IWRAM_START + 0x60
	adds r2, r2, r0
_0807F964:
	ldr r0, [r7, #0x44]
	str r0, [r2]
	ldr r0, [r7, #0x48]
	str r0, [r2, #4]
	adds r2, #8
	adds r1, #1
	cmp r1, #2
	bls _0807F964
	adds r4, r7, #0
	adds r4, #0xc
	movs r5, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x99
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	strb r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F9D8: .4byte Task_Interactable097
_0807F9DC: .4byte 0x00002010
_0807F9E0: .4byte TaskDestructor_Interactable097
_0807F9E4: .4byte IWRAM_START + 0x58
_0807F9E8: .4byte IWRAM_START + 0x5E
_0807F9EC: .4byte IWRAM_START + 0x60

	thumb_func_start sub_807F9F0
sub_807F9F0: @ 0x0807F9F0
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0807FA74 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FA78 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FA0E
	adds r0, r4, #0
	bl sub_807FF04
_0807FA0E:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FA60
	ldr r1, _0807FA7C @ =IWRAM_START + 0x5A
	adds r0, r5, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _0807FA60
	ldr r1, [r4, #0x48]
	asrs r1, r1, #8
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r2, _0807FA80 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807FA60
	movs r3, #0
	str r3, [r4, #0x4c]
	ldr r2, _0807FA84 @ =gPlayer
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	str r3, [r2, #0x3c]
_0807FA60:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FA88
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FA8E
	.align 2, 0
_0807FA74: .4byte gCurTask
_0807FA78: .4byte gGameMode
_0807FA7C: .4byte IWRAM_START + 0x5A
_0807FA80: .4byte sub_801EC3C
_0807FA84: .4byte gPlayer
_0807FA88:
	adds r0, r4, #0
	bl sub_807FC20
_0807FA8E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807FA98
sub_807FA98: @ 0x0807FA98
	push {r4, lr}
	mov ip, r0
	ldr r0, _0807FB0C @ =0x00032E00
	mov r1, ip
	str r0, [r1, #0x44]
	movs r0, #0x90
	lsls r0, r0, #0xa
	str r0, [r1, #0x48]
	mov r4, ip
	adds r4, #0x5e
	movs r0, #0xe0
	strb r0, [r4]
	mov r2, ip
	adds r2, #0x5c
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r2]
	ldr r3, _0807FB10 @ =gSineTable
	ldrb r0, [r4]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x54]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807FB14 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FB18 @ =sub_807F9F0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB0C: .4byte 0x00032E00
_0807FB10: .4byte gSineTable
_0807FB14: .4byte gCurTask
_0807FB18: .4byte sub_807F9F0

	thumb_func_start sub_807FB1C
sub_807FB1C: @ 0x0807FB1C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807FB88
	adds r5, r4, #0
	adds r5, #0x5c
	ldrh r2, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0807FB3A
	adds r2, r1, #0
_0807FB3A:
	strh r2, [r5]
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _0807FB84 @ =gSineTable
	movs r0, #0x5e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r4, #0
	adds r2, #0x58
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r5, ip
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r3, r1, #0
	b _0807FBAA
	.align 2, 0
_0807FB84: .4byte gSineTable
_0807FB88:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	adds r5, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #4
	adds r3, r1, #0
	cmp r0, r2
	ble _0807FBA4
	adds r5, r2, #0
_0807FBA4:
	strh r5, [r3]
	adds r2, r4, #0
	adds r2, #0x58
_0807FBAA:
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4, #0x44]
	adds r6, r0, r1
	str r6, [r4, #0x44]
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r4, #0x48]
	adds r7, r0, r1
	str r7, [r4, #0x48]
	ldr r5, _0807FC1C @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807FC0C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FC0C
	adds r2, r4, #0
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	adds r0, r0, r6
	adds r1, r1, r0
	str r1, [r5, #8]
	adds r3, r4, #0
	adds r3, #0x52
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0x40]
	lsls r0, r0, #8
	adds r0, r0, r7
	adds r1, r1, r0
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	lsls r0, r0, #8
	subs r1, r1, r0
	str r1, [r5, #0xc]
	ldrh r0, [r5, #0x10]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r5, #0x12]
	ldrh r2, [r3]
	adds r0, r0, r2
	strh r0, [r3]
_0807FC0C:
	adds r0, r4, #0
	bl sub_807FC9C
	str r0, [r4, #0x4c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC1C: .4byte gPlayer

	thumb_func_start sub_807FC20
sub_807FC20: @ 0x0807FC20
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807FC48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FC50
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC4C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x6c]
	b _0807FC64
	.align 2, 0
_0807FC48: .4byte gGameMode
_0807FC4C: .4byte gCamera
_0807FC50:
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC94 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x48]
_0807FC64:
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _0807FC98 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC94: .4byte gCamera
_0807FC98: .4byte 0xFFFFFBFF

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 0x0807FC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FD04
	ldr r5, _0807FCC0 @ =gPlayer
	ldr r1, [r5, #0x20]
	ldr r0, _0807FCC4 @ =0x01400082
	ands r0, r1
	cmp r0, #0
	beq _0807FCC8
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r0, #0
	str r0, [r5, #0x3c]
	b _0807FD06
	.align 2, 0
_0807FCC0: .4byte gPlayer
_0807FCC4: .4byte 0x01400082
_0807FCC8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	beq _0807FCFC
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, _0807FD00 @ =gCamera
	ldr r2, [r0]
	subs r1, r1, r2
	subs r1, #0x1b
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807FD04
	adds r0, r1, #0
	adds r0, #0x36
	cmp r0, r2
	blt _0807FD04
_0807FCFC:
	movs r0, #1
	b _0807FD06
	.align 2, 0
_0807FD00: .4byte gCamera
_0807FD04:
	movs r0, #0
_0807FD06:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807FD0C
sub_807FD0C: @ 0x0807FD0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807FD58 @ =gPlayer
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807FDC4
	adds r0, r4, #0
	adds r0, #0xc
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r3, [r4, #0x48]
	asrs r3, r3, #8
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807FDC4
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807FD5C
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807FDC6
	.align 2, 0
_0807FD58: .4byte gPlayer
_0807FD5C:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807FD7E
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	b _0807FD9E
_0807FD7E:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807FDAA
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0807FD9E:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807FDC6
_0807FDAA:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807FDC4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #1
	b _0807FDC6
_0807FDC4:
	movs r0, #0
_0807FDC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable097
Task_Interactable097: @ 0x0807FDCC
	push {r4, lr}
	ldr r0, _0807FE0C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FE10 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FDE8
	adds r0, r4, #0
	bl sub_807FF04
_0807FDE8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	bne _0807FDF8
	adds r0, r4, #0
	bl sub_807FE34
_0807FDF8:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FE14
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FE1A
	.align 2, 0
_0807FE0C: .4byte gCurTask
_0807FE10: .4byte gGameMode
_0807FE14:
	adds r0, r4, #0
	bl sub_807FC20
_0807FE1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable097
TaskDestructor_Interactable097: @ 0x0807FE20
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807FE34
sub_807FE34: @ 0x0807FE34
	push {r4, lr}
	mov ip, r0
	ldr r3, _0807FE84 @ =gPlayer
	ldr r2, [r3, #8]
	ldr r1, [r0, #0x3c]
	lsls r1, r1, #8
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	subs r2, r2, r0
	mov r0, ip
	adds r0, #0x50
	strh r2, [r0]
	ldr r2, [r3, #0xc]
	mov r0, ip
	ldr r1, [r0, #0x40]
	lsls r1, r1, #8
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	subs r2, r2, r0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	lsls r0, r0, #8
	adds r2, r2, r0
	mov r0, ip
	adds r0, #0x52
	strh r2, [r0]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x4c]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807FE88 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FE8C @ =sub_807FF20
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE84: .4byte gPlayer
_0807FE88: .4byte gCurTask
_0807FE8C: .4byte sub_807FF20

	thumb_func_start sub_807FE90
sub_807FE90: @ 0x0807FE90
	push {lr}
	ldr r2, [r0, #0x3c]
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	ldr r3, _0807FEE0 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r3, #4]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r2, r2, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _0807FEDA
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807FEDA
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807FEE4
_0807FEDA:
	movs r0, #1
	b _0807FEE6
	.align 2, 0
_0807FEE0: .4byte gCamera
_0807FEE4:
	movs r0, #0
_0807FEE6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807FEEC
sub_807FEEC: @ 0x0807FEEC
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807FF00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gCurTask

	thumb_func_start sub_807FF04
sub_807FF04: @ 0x0807FF04
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x48]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start sub_807FF20
sub_807FF20: @ 0x0807FF20
	push {r4, r5, lr}
	ldr r0, _0807FF6C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FF70 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FF3C
	adds r0, r4, #0
	bl sub_807FF04
_0807FF3C:
	ldr r0, _0807FF74 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FF78 @ =0x00024DFF
	cmp r1, r0
	ble _0807FF5A
	adds r0, r4, #0
	bl sub_807FF88
_0807FF5A:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FF7C
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FF82
	.align 2, 0
_0807FF6C: .4byte gCurTask
_0807FF70: .4byte gGameMode
_0807FF74: .4byte IWRAM_START + 0x5C
_0807FF78: .4byte 0x00024DFF
_0807FF7C:
	adds r0, r4, #0
	bl sub_807FC20
_0807FF82:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807FF88
sub_807FF88: @ 0x0807FF88
	ldr r1, _0807FFA4 @ =0x00024E00
	str r1, [r0, #0x44]
	movs r1, #0x90
	lsls r1, r1, #0xa
	str r1, [r0, #0x48]
	adds r0, #0x5e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807FFA8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FFAC @ =sub_807FFB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807FFA4: .4byte 0x00024E00
_0807FFA8: .4byte gCurTask
_0807FFAC: .4byte sub_807FFB0

	thumb_func_start sub_807FFB0
sub_807FFB0: @ 0x0807FFB0
	push {r4, lr}
	ldr r0, _0807FFF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FFF8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FFCC
	adds r0, r4, #0
	bl sub_807FF04
_0807FFCC:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FFFC @ =0x00032DFF
	cmp r1, r0
	ble _0807FFE0
	adds r0, r4, #0
	bl sub_807FA98
_0807FFE0:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _08080000
	adds r0, r4, #0
	bl sub_807FEEC
	b _08080006
	.align 2, 0
_0807FFF4: .4byte gCurTask
_0807FFF8: .4byte gGameMode
_0807FFFC: .4byte 0x00032DFF
_08080000:
	adds r0, r4, #0
	bl sub_807FC20
_08080006:
	pop {r4}
	pop {r0}
	bx r0
