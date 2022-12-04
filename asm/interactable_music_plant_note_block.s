.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_MusicPlant_Note_Block
initSprite_Interactable_MusicPlant_Note_Block: @ 0x0807593C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	mov sb, r2
	adds r6, r3, #0
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08075A5C @ =sub_8075C6C
	ldr r2, _08075A60 @ =0x00002010
	ldr r1, _08075A64 @ =sub_8075CC0
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r3, r5
	ldr r2, _08075A68 @ =IWRAM_START + 0xC
	adds r0, r3, r2
	ldr r1, _08075A6C @ =IWRAM_START + 0x4B
	adds r2, r3, r1
	movs r4, #0
	movs r1, #3
	strb r1, [r2]
	ldr r2, _08075A70 @ =IWRAM_START + 0x44
	adds r1, r3, r2
	movs r2, #0
	mov ip, r2
	strh r4, [r1]
	ldr r2, _08075A74 @ =IWRAM_START + 0x46
	adds r1, r3, r2
	strh r4, [r1]
	ldrb r1, [r7, #3]
	adds r2, #2
	adds r2, r2, r3
	mov sl, r2
	strb r1, [r2]
	mov r1, r8
	strh r1, [r5, #4]
	mov r2, sb
	strh r2, [r5, #6]
	str r7, [r5]
	ldrb r1, [r7]
	strb r1, [r5, #8]
	strb r6, [r5, #9]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	ldr r1, _08075A78 @ =IWRAM_START + 0x2D
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _08075A7C @ =IWRAM_START + 0x2E
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _08075A80 @ =IWRAM_START + 0x31
	adds r1, r3, r2
	mov r2, ip
	strb r2, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r4, _08075A84 @ =gUnknown_080DFC40
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r2, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _08075A88 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #4]
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r4, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	ldr r2, _08075A8C @ =IWRAM_START + 0x2C
	adds r3, r3, r2
	strb r1, [r3]
	ldrb r1, [r7]
	lsls r1, r1, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r1, r8
	str r1, [r5, #0x3c]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	mov r2, sb
	lsls r2, r2, #8
	mov sb, r2
	add r1, sb
	str r1, [r5, #0x40]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r7]
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
_08075A5C: .4byte sub_8075C6C
_08075A60: .4byte 0x00002010
_08075A64: .4byte sub_8075CC0
_08075A68: .4byte IWRAM_START + 0xC
_08075A6C: .4byte IWRAM_START + 0x4B
_08075A70: .4byte IWRAM_START + 0x44
_08075A74: .4byte IWRAM_START + 0x46
_08075A78: .4byte IWRAM_START + 0x2D
_08075A7C: .4byte IWRAM_START + 0x2E
_08075A80: .4byte IWRAM_START + 0x31
_08075A84: .4byte gUnknown_080DFC40
_08075A88: .4byte 0x06010000
_08075A8C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_8075A90
sub_8075A90: @ 0x08075A90
	push {r4, r5, r6, lr}
	ldr r0, _08075AB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x4a
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08075ABC
	cmp r0, #4
	beq _08075B04
	b _08075B32
	.align 2, 0
_08075AB8: .4byte gCurTask
_08075ABC:
	ldr r3, _08075AF4 @ =gSineTable
	ldr r1, _08075AF8 @ =IWRAM_START + 0x49
	adds r2, r4, r1
	ldrb r0, [r2]
	lsls r0, r0, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r6, _08075AFC @ =IWRAM_START + 0x44
	adds r1, r4, r6
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r2, _08075B00 @ =IWRAM_START + 0x46
	adds r1, r4, r2
	strh r0, [r1]
	b _08075B32
	.align 2, 0
_08075AF4: .4byte gSineTable
_08075AF8: .4byte IWRAM_START + 0x49
_08075AFC: .4byte IWRAM_START + 0x44
_08075B00: .4byte IWRAM_START + 0x46
_08075B04:
	ldr r6, _08075B24 @ =IWRAM_START + 0x44
	adds r0, r4, r6
	movs r1, #0
	strh r1, [r0]
	ldr r2, _08075B28 @ =IWRAM_START + 0x46
	adds r0, r4, r2
	strh r1, [r0]
	adds r6, #7
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _08075B2C
	adds r0, r5, #0
	bl sub_8075DE8
	b _08075B48
	.align 2, 0
_08075B24: .4byte IWRAM_START + 0x44
_08075B28: .4byte IWRAM_START + 0x46
_08075B2C:
	adds r0, r5, #0
	bl sub_8075CC4
_08075B32:
	adds r0, r5, #0
	bl sub_8075CF0
	adds r0, r5, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075B48
	adds r0, r5, #0
	bl sub_8075D28
_08075B48:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075B50
sub_8075B50: @ 0x08075B50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #0
	mov ip, r0
	movs r0, #0xc0
	strb r0, [r1]
	ldr r3, _08075C4C @ =gPlayer
	ldr r4, _08075C50 @ =gUnknown_080DFC6A
	adds r7, r6, #0
	adds r7, #0x48
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	movs r2, #0
	strh r0, [r3, #0x12]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #0x39
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	subs r1, #7
	ldr r0, _08075C54 @ =0x0000FFFF
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4a
	strb r2, [r0]
	ldr r0, [r6, #0x3c]
	ldr r1, [r6, #0x40]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	str r2, [sp]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r5, #0
	ldrsh r3, [r2, r5]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, ip
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r0, [r6, #0x3c]
	ldr r1, [r6, #0x40]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	rsbs r2, r2, #0
	asrs r2, r2, #3
	str r2, [sp]
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	adds r1, r6, #0
	adds r1, #0x4b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08075C2C
	ldr r1, _08075C58 @ =gUnknown_080DFC40
	ldrh r0, [r1, #0x28]
	lsls r0, r0, #5
	ldr r5, _08075C5C @ =0x06010000
	adds r0, r0, r5
	str r0, [r6, #0x10]
	ldrh r0, [r1, #0x24]
	strh r0, [r6, #0x16]
	ldrh r1, [r1, #0x26]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
_08075C2C:
	ldr r1, _08075C60 @ =gUnknown_080DFC78
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08075C64 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075C68 @ =sub_8075A90
	str r0, [r1, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C4C: .4byte gPlayer
_08075C50: .4byte gUnknown_080DFC6A
_08075C54: .4byte 0x0000FFFF
_08075C58: .4byte gUnknown_080DFC40
_08075C5C: .4byte 0x06010000
_08075C60: .4byte gUnknown_080DFC78
_08075C64: .4byte gCurTask
_08075C68: .4byte sub_8075A90

	thumb_func_start sub_8075C6C
sub_8075C6C: @ 0x08075C6C
	push {r4, r5, lr}
	ldr r0, _08075C9C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8075D98
	cmp r0, #0
	beq _08075C8A
	adds r0, r4, #0
	bl sub_8075B50
_08075C8A:
	adds r0, r4, #0
	bl sub_8075D58
	cmp r0, #0
	beq _08075CA0
	adds r0, r4, #0
	bl sub_8075DE8
	b _08075CB6
	.align 2, 0
_08075C9C: .4byte gCurTask
_08075CA0:
	adds r0, r4, #0
	bl sub_8075CF0
	ldr r1, _08075CBC @ =IWRAM_START + 0x4B
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075CB6
	adds r0, r4, #0
	bl sub_8075D28
_08075CB6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075CBC: .4byte IWRAM_START + 0x4B

	thumb_func_start sub_8075CC0
sub_8075CC0: @ 0x08075CC0
	bx lr
	.align 2, 0

	thumb_func_start sub_8075CC4
sub_8075CC4: @ 0x08075CC4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075CE4
	ldr r0, _08075CDC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075CE0 @ =sub_8075C6C
	str r0, [r1, #8]
	b _08075CEA
	.align 2, 0
_08075CDC: .4byte gCurTask
_08075CE0: .4byte sub_8075C6C
_08075CE4:
	adds r0, r1, #0
	bl sub_8075DE8
_08075CEA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075CF0
sub_8075CF0: @ 0x08075CF0
	mov ip, r0
	mov r3, ip
	adds r3, #0xc
	ldr r1, [r0, #0x3c]
	ldr r2, _08075D24 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	mov r0, ip
	ldr r1, [r0, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x18]
	bx lr
	.align 2, 0
_08075D24: .4byte gCamera

	thumb_func_start sub_8075D28
sub_8075D28: @ 0x08075D28
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
	ldr r1, _08075D54 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075D54: .4byte 0xFFFFFBFF

	thumb_func_start sub_8075D58
sub_8075D58: @ 0x08075D58
	push {r4, lr}
	ldr r2, [r0, #0x3c]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r1, #0
	adds r2, r2, r4
	ldr r3, _08075D8C @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, r0, r4
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xbc
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _08075D88
	movs r0, #0xa8
	lsls r0, r0, #2
	cmp r1, r0
	bls _08075D90
_08075D88:
	movs r0, #1
	b _08075D92
	.align 2, 0
_08075D8C: .4byte gCamera
_08075D90:
	movs r0, #0
_08075D92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8075D98
sub_8075D98: @ 0x08075D98
	push {lr}
	adds r2, r0, #0
	ldr r3, _08075DDC @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08075DE0
	adds r0, r2, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075DE0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	adds r1, #0x10
	ldr r0, [r2, #0x3c]
	subs r1, r1, r0
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	adds r0, #0x18
	ldr r2, [r2, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bhi _08075DE0
	cmp r0, #0x18
	bhi _08075DE0
	movs r0, #1
	b _08075DE2
	.align 2, 0
_08075DDC: .4byte gPlayer
_08075DE0:
	movs r0, #0
_08075DE2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075DE8
sub_8075DE8: @ 0x08075DE8
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08075DFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08075DFC: .4byte gCurTask
