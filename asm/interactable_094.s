.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable094
initSprite_Interactable094: @ 0x0807E9B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r0, _0807EA78 @ =Task_Interactable094
	ldr r2, _0807EA7C @ =0x00002010
	ldr r1, _0807EA80 @ =TaskDestructor_Interactable094
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sl, r0
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sl
	mov r0, r8
	ldrb r6, [r0]
	lsls r6, r6, #3
	lsls r4, r4, #8
	adds r6, r6, r4
	str r6, [r2]
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	mov sb, r1
	lsls r5, r5, #8
	add sb, r5
	mov r3, sb
	str r3, [r2, #4]
	movs r4, #3
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r0, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r0, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	ldrb r0, [r0, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r6
	str r0, [r2, #0x14]
	movs r5, #0xa
	ldrsh r0, [r2, r5]
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, sb
	str r0, [r2, #0x18]
	mov r5, r8
	str r5, [r2, #0x20]
	ldrb r1, [r5]
	ldr r0, _0807EA84 @ =IWRAM_START + 0x24
	add r0, sl
	strb r1, [r0]
	ldr r0, _0807EA88 @ =IWRAM_START + 0x25
	add sl, r0
	mov r1, sl
	strb r7, [r1]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA78: .4byte Task_Interactable094
_0807EA7C: .4byte 0x00002010
_0807EA80: .4byte TaskDestructor_Interactable094
_0807EA84: .4byte IWRAM_START + 0x24
_0807EA88: .4byte IWRAM_START + 0x25

	thumb_func_start sub_807EA8C
sub_807EA8C: @ 0x0807EA8C
	push {r4, lr}
	ldr r0, _0807EAB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r1, _0807EAB4 @ =gPlayer
	ldr r0, [r1, #0x20]
	movs r3, #0x80
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq _0807EAB8
	adds r0, r4, #0
	bl sub_807ED68
	b _0807EB40
	.align 2, 0
_0807EAB0: .4byte gCurTask
_0807EAB4: .4byte gPlayer
_0807EAB8:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _0807EAC8
	adds r0, r4, #0
	bl sub_807ED88
	b _0807EB40
_0807EAC8:
	ldr r0, _0807EADC @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807EAE4
	ldr r0, [r2, #0xc]
	ldr r1, _0807EAE0 @ =0xFFFFFF00
	b _0807EAEA
	.align 2, 0
_0807EADC: .4byte gUnknown_03005424
_0807EAE0: .4byte 0xFFFFFF00
_0807EAE4:
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
_0807EAEA:
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0807EB1C @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807EB20
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0807EB12
	movs r0, #1
_0807EB12:
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl sub_807EB48
	b _0807EB30
	.align 2, 0
_0807EB1C: .4byte gPlayerControls
_0807EB20:
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	bne _0807EB30
	adds r0, r4, #0
	bl sub_807ED00
_0807EB30:
	adds r0, r4, #0
	bl sub_807EDB8
	cmp r0, #0
	beq _0807EB40
	adds r0, r4, #0
	bl sub_807EE1C
_0807EB40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EB48
sub_807EB48: @ 0x0807EB48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0807EB6C @ =gPlayer
	ldr r3, [r1, #0x20]
	movs r0, #0x80
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _0807EBA4
	ldr r1, _0807EB70 @ =0xFFBFFFFF
	ands r1, r3
	str r1, [r2, #0x20]
	ldr r3, [r4, #0x1c]
	cmp r3, #0
	beq _0807EB74
	movs r0, #1
	orrs r1, r0
	b _0807EB7A
	.align 2, 0
_0807EB6C: .4byte gPlayer
_0807EB70: .4byte 0xFFBFFFFF
_0807EB74:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
_0807EB7A:
	str r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #4
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	cmp r3, #0
	beq _0807EB96
	movs r0, #0xfb
	lsls r0, r0, #8
	b _0807EB9A
_0807EB96:
	movs r0, #0xa0
	lsls r0, r0, #3
_0807EB9A:
	strh r0, [r2, #0x10]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
_0807EBA4:
	ldr r0, _0807EBB4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807EBB8 @ =sub_807EC70
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBB4: .4byte gCurTask
_0807EBB8: .4byte sub_807EC70

	thumb_func_start sub_807EBBC
sub_807EBBC: @ 0x0807EBBC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0807EC28 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807EC30
	ldr r2, [r5]
	ldrh r0, [r5, #8]
	adds r2, r2, r0
	ldr r3, _0807EC2C @ =gCamera
	ldr r4, [r3]
	subs r2, r2, r4
	ldr r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldr r3, [r3, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _0807EC30
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r0, r1
	blt _0807EC30
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807EC30
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r0, r1
	blt _0807EC30
	movs r0, #1
	b _0807EC32
	.align 2, 0
_0807EC28: .4byte gPlayer
_0807EC2C: .4byte gCamera
_0807EC30:
	movs r0, #0
_0807EC32:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable094
Task_Interactable094: @ 0x0807EC38
	push {r4, lr}
	ldr r0, _0807EC6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	beq _0807EC56
	adds r0, r4, #0
	bl sub_807ECB8
_0807EC56:
	adds r0, r4, #0
	bl sub_807EDB8
	cmp r0, #0
	beq _0807EC66
	adds r0, r4, #0
	bl sub_807EE1C
_0807EC66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC6C: .4byte gCurTask

	thumb_func_start sub_807EC70
sub_807EC70: @ 0x0807EC70
	push {r4, lr}
	ldr r0, _0807EC90 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807EC94 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807EC9C
	ldr r0, _0807EC98 @ =Task_Interactable094
	str r0, [r2, #8]
	b _0807ECAC
	.align 2, 0
_0807EC90: .4byte gCurTask
_0807EC94: .4byte gPlayer
_0807EC98: .4byte Task_Interactable094
_0807EC9C:
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	bne _0807ECAC
	adds r0, r4, #0
	bl sub_807ED48
_0807ECAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_Interactable094
TaskDestructor_Interactable094: @ 0x0807ECB4
	bx lr
	.align 2, 0

	thumb_func_start sub_807ECB8
sub_807ECB8: @ 0x0807ECB8
	push {r4, lr}
	ldr r3, _0807ECF4 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xf
	orrs r1, r2
	str r1, [r3, #0x20]
	adds r4, r3, #0
	adds r4, #0x64
	movs r2, #0
	movs r1, #0x42
	strh r1, [r4]
	ldr r0, [r0, #0x14]
	lsls r0, r0, #8
	str r0, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x10]
	strh r2, [r3, #0x12]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807ECF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ECFC @ =sub_807EA8C
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ECF4: .4byte gPlayer
_0807ECF8: .4byte gCurTask
_0807ECFC: .4byte sub_807EA8C

	thumb_func_start sub_807ED00
sub_807ED00: @ 0x0807ED00
	push {lr}
	ldr r2, _0807ED38 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807ED2C
	ldr r0, _0807ED3C @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, #0xfb
	strh r0, [r2, #0x12]
	adds r0, #0x22
	bl m4aSongNumStop
_0807ED2C:
	ldr r0, _0807ED40 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED44 @ =Task_Interactable094
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED38: .4byte gPlayer
_0807ED3C: .4byte 0xFFBFFFFF
_0807ED40: .4byte gCurTask
_0807ED44: .4byte Task_Interactable094

	thumb_func_start sub_807ED48
sub_807ED48: @ 0x0807ED48
	push {lr}
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807ED60 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED64 @ =Task_Interactable094
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED60: .4byte gCurTask
_0807ED64: .4byte Task_Interactable094

	thumb_func_start sub_807ED68
sub_807ED68: @ 0x0807ED68
	push {lr}
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807ED80 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED84 @ =Task_Interactable094
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED80: .4byte gCurTask
_0807ED84: .4byte Task_Interactable094

	thumb_func_start sub_807ED88
sub_807ED88: @ 0x0807ED88
	push {lr}
	ldr r2, _0807EDA8 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807EDAC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807EDB0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807EDB4 @ =sub_807EC70
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807EDA8: .4byte gPlayer
_0807EDAC: .4byte 0xFFBFFFFF
_0807EDB0: .4byte gCurTask
_0807EDB4: .4byte sub_807EC70

	thumb_func_start sub_807EDB8
sub_807EDB8: @ 0x0807EDB8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _0807EE10 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807EE0A
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807EE0A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807EE0A
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807EE14
_0807EE0A:
	movs r0, #1
	b _0807EE16
	.align 2, 0
_0807EE10: .4byte gCamera
_0807EE14:
	movs r0, #0
_0807EE16:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807EE1C
sub_807EE1C: @ 0x0807EE1C
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807EE34 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807EE34: .4byte gCurTask
