.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable070
initSprite_Interactable070: @ 0x080798C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080799D0 @ =Task_Interactable070
	ldr r2, _080799D4 @ =0x00002010
	ldr r1, _080799D8 @ =TaskDestructor_Interactable070
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r5, r3
	ldr r1, _080799DC @ =IWRAM_START + 0xC
	adds r0, r5, r1
	movs r2, #0
	str r2, [r3, #0x44]
	str r2, [r3, #0x48]
	mov r7, sl
	ldrb r1, [r7, #3]
	ldr r7, _080799E0 @ =IWRAM_START + 0x4C
	adds r7, r7, r5
	mov sb, r7
	strb r1, [r7]
	movs r1, #0
	mov ip, r1
	strh r6, [r3, #4]
	mov r7, r8
	strh r7, [r3, #6]
	mov r1, sl
	str r1, [r3]
	ldrb r1, [r1]
	strb r1, [r3, #8]
	strb r4, [r3, #9]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	ldr r7, _080799E4 @ =IWRAM_START + 0x2D
	adds r2, r5, r7
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _080799E8 @ =IWRAM_START + 0x2E
	adds r2, r5, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _080799EC @ =IWRAM_START + 0x31
	adds r1, r5, r2
	mov r7, ip
	strb r7, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r4, _080799F0 @ =gUnknown_080E0008
	mov r1, sb
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r2, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _080799F4 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #4]
	mov r7, sb
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r4, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	ldr r2, _080799F8 @ =IWRAM_START + 0x2C
	adds r5, r5, r2
	strb r1, [r5]
	mov r7, sl
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r6, r6, #8
	adds r1, r1, r6
	str r1, [r3, #0x3c]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r1, r8
	str r1, [r3, #0x40]
	movs r7, #2
	rsbs r7, r7, #0
	adds r1, r7, #0
	mov r2, sl
	strb r1, [r2]
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080799D0: .4byte Task_Interactable070
_080799D4: .4byte 0x00002010
_080799D8: .4byte TaskDestructor_Interactable070
_080799DC: .4byte IWRAM_START + 0xC
_080799E0: .4byte IWRAM_START + 0x4C
_080799E4: .4byte IWRAM_START + 0x2D
_080799E8: .4byte IWRAM_START + 0x2E
_080799EC: .4byte IWRAM_START + 0x31
_080799F0: .4byte gUnknown_080E0008
_080799F4: .4byte 0x06010000
_080799F8: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_80799FC
sub_80799FC: @ 0x080799FC
	push {r4, lr}
	ldr r0, _08079A28 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x4e
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _08079A68
	cmp r0, #4
	bgt _08079A2C
	cmp r0, #0
	beq _08079A32
	b _08079AB2
	.align 2, 0
_08079A28: .4byte gCurTask
_08079A2C:
	cmp r0, #6
	beq _08079AA4
	b _08079AB2
_08079A32:
	ldr r2, _08079A60 @ =gSineTable
	ldr r0, _08079A64 @ =IWRAM_START + 0x4D
	adds r1, r3, r0
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r4, #0x44]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r4, #0x48]
	b _08079AB2
	.align 2, 0
_08079A60: .4byte gSineTable
_08079A64: .4byte IWRAM_START + 0x4D
_08079A68:
	ldr r2, _08079A9C @ =gSineTable
	ldr r0, _08079AA0 @ =IWRAM_START + 0x4D
	adds r1, r3, r0
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x44]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x48]
	b _08079AB2
	.align 2, 0
_08079A9C: .4byte gSineTable
_08079AA0: .4byte IWRAM_START + 0x4D
_08079AA4:
	movs r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	adds r0, r4, #0
	bl sub_8079D9C
	b _08079ABE
_08079AB2:
	adds r0, r4, #0
	bl sub_8079D00
	adds r0, r4, #0
	bl sub_8079D30
_08079ABE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8079AC4
sub_8079AC4: @ 0x08079AC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r5, _08079B58 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r7, #0x80
	ands r0, r7
	cmp r0, #0
	beq _08079ADA
	b _08079C74
_08079ADA:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r1, #0x18
	ldr r3, [r6, #0x3c]
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #0x10
	ldr r2, [r6, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x30
	bls _08079AFC
	b _08079C74
_08079AFC:
	cmp r0, #0x20
	bls _08079B02
	b _08079C74
_08079B02:
	ldrh r0, [r5, #0x14]
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	adds r1, r3, #0
	adds r3, r5, #0
	bl sub_800CDBC
	adds r1, r0, #0
	cmp r1, #0
	bne _08079B1C
	b _08079C74
_08079B1C:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08079B60
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldr r1, _08079B5C @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x4d
	movs r0, #0xc0
	b _08079C24
	.align 2, 0
_08079B58: .4byte gPlayer
_08079B5C: .4byte gUnknown_080E001A
_08079B60:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08079BA8
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, _08079BA4 @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4d
	strb r7, [r0]
	b _08079C26
	.align 2, 0
_08079BA4: .4byte gUnknown_080E001A
_08079BA8:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08079BF4
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, _08079BF0 @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4d
	strb r2, [r0]
	b _08079C26
	.align 2, 0
_08079BF0: .4byte gUnknown_080E001A
_08079BF4:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldr r1, _08079C3C @ =gUnknown_080E001A
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x4d
	movs r0, #0x40
_08079C24:
	strb r0, [r1]
_08079C26:
	ldr r2, _08079C40 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08079C48
	ldr r0, _08079C44 @ =0xFFFFFEFF
	ands r1, r0
	str r1, [r2, #0x20]
	b _08079C5C
	.align 2, 0
_08079C3C: .4byte gUnknown_080E001A
_08079C40: .4byte gPlayer
_08079C44: .4byte 0xFFFFFEFF
_08079C48:
	mov r0, r8
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #4
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
_08079C5C:
	ldr r0, [r2, #0x3c]
	cmp r0, r4
	bne _08079C70
	movs r0, #0
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
_08079C70:
	movs r0, #1
	b _08079C76
_08079C74:
	movs r0, #0
_08079C76:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable070
Task_Interactable070: @ 0x08079C80
	push {r4, lr}
	ldr r0, _08079CB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8079AC4
	cmp r0, #0
	beq _08079C9E
	adds r0, r4, #0
	bl sub_8079CCC
_08079C9E:
	adds r0, r4, #0
	bl sub_8079D60
	cmp r0, #0
	beq _08079CB4
	adds r0, r4, #0
	bl sub_8079D9C
	b _08079CC0
	.align 2, 0
_08079CB0: .4byte gCurTask
_08079CB4:
	adds r0, r4, #0
	bl sub_8079D00
	adds r0, r4, #0
	bl sub_8079D30
_08079CC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_Interactable070
TaskDestructor_Interactable070: @ 0x08079CC8
	bx lr
	.align 2, 0

	thumb_func_start sub_8079CCC
sub_8079CCC: @ 0x08079CCC
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4e
	movs r1, #0
	strb r1, [r2]
	ldr r1, _08079CF4 @ =gUnknown_080E0032
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08079CF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08079CFC @ =sub_80799FC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08079CF4: .4byte gUnknown_080E0032
_08079CF8: .4byte gCurTask
_08079CFC: .4byte sub_80799FC

	thumb_func_start sub_8079D00
sub_8079D00: @ 0x08079D00
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r2, [r0, #0x3c]
	ldr r3, _08079D2C @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	strh r2, [r4, #0x16]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	ldr r0, [r0, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079D2C: .4byte gCamera

	thumb_func_start sub_8079D30
sub_8079D30: @ 0x08079D30
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _08079D5C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079D5C: .4byte 0xFFFFFBFF

	thumb_func_start sub_8079D60
sub_8079D60: @ 0x08079D60
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08079D90 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _08079D8A
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _08079D94
_08079D8A:
	movs r0, #1
	b _08079D96
	.align 2, 0
_08079D90: .4byte gCamera
_08079D94:
	movs r0, #0
_08079D96:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8079D9C
sub_8079D9C: @ 0x08079D9C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08079DB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08079DB0: .4byte gCurTask
