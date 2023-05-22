.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_BulletBuzzer
CreateEntity_BulletBuzzer: @ 0x0805971C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov sb, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0805982C @ =sub_8059858
	ldr r2, _08059830 @ =0x00004040
	ldr r1, _08059834 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x60
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r7, _08059838 @ =IWRAM_START + 0xC
	adds r2, r4, r7
	movs r0, #0
	mov sl, r0
	movs r3, #0
	strh r5, [r1, #4]
	strh r6, [r1, #6]
	mov r7, r8
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, sb
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	str r3, [r1, #0x4c]
	str r3, [r1, #0x50]
	str r3, [r1, #0x54]
	ldrb r0, [r7, #5]
	lsls r0, r0, #2
	ldr r7, _0805983C @ =IWRAM_START + 0x5A
	adds r1, r4, r7
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1, #6]
	lsls r0, r0, #2
	adds r7, #1
	adds r1, r4, r7
	strb r0, [r1]
	ldr r1, _08059840 @ =IWRAM_START + 0x5C
	adds r0, r4, r1
	mov r7, sl
	strb r7, [r0]
	adds r1, #2
	adds r0, r4, r1
	strb r7, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r2, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	adds r0, r0, r6
	strh r0, [r2, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	movs r0, #0x18
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	ldr r2, [sp, #4]
	str r0, [r2, #4]
	ldr r0, _08059844 @ =0x000001F9
	strh r0, [r2, #0xa]
	ldr r1, _08059848 @ =IWRAM_START + 0x2C
	adds r0, r4, r1
	mov r7, sl
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r2, #8]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r0, _0805984C @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r7, _08059850 @ =IWRAM_START + 0x2E
	adds r1, r4, r7
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08059854 @ =IWRAM_START + 0x31
	adds r4, r4, r0
	mov r1, sl
	strb r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x90
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805982C: .4byte sub_8059858
_08059830: .4byte 0x00004040
_08059834: .4byte TaskDestructor_80095E8
_08059838: .4byte IWRAM_START + 0xC
_0805983C: .4byte IWRAM_START + 0x5A
_08059840: .4byte IWRAM_START + 0x5C
_08059844: .4byte 0x000001F9
_08059848: .4byte IWRAM_START + 0x2C
_0805984C: .4byte IWRAM_START + 0x2D
_08059850: .4byte IWRAM_START + 0x2E
_08059854: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8059858
sub_8059858: @ 0x08059858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08059904 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r7, r0
	ldr r1, _08059908 @ =IWRAM_START + 0xC
	adds r6, r7, r1
	ldr r2, [r5]
	mov sl, r2
	ldr r3, [r5, #0x4c]
	mov r8, r3
	ldr r1, [r5, #0x54]
	adds r1, #1
	ldr r3, _0805990C @ =0x000003FF
	ands r1, r3
	str r1, [r5, #0x54]
	lsls r0, r1, #2
	adds r0, r0, r1
	ands r0, r3
	ldr r4, _08059910 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov ip, r0
	ldr r2, _08059914 @ =IWRAM_START + 0x5A
	adds r0, r7, r2
	ldrb r0, [r0]
	mov r2, ip
	muls r2, r0, r2
	asrs r2, r2, #6
	str r2, [r5, #0x4c]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, _08059918 @ =IWRAM_START + 0x5B
	adds r0, r7, r4
	ldrb r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r5, #0x50]
	ldr r1, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	str r1, [sp]
	ldr r2, [r5, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #4]
	ldr r3, _0805991C @ =gCamera
	ldr r0, [r3]
	adds r4, r1, #0
	subs r0, r4, r0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08059920
	mov r4, sb
	ldr r0, [r4]
	bl TaskDestroy
	b _08059AEE
	.align 2, 0
_08059904: .4byte gCurTask
_08059908: .4byte IWRAM_START + 0xC
_0805990C: .4byte 0x000003FF
_08059910: .4byte gSineTable
_08059914: .4byte IWRAM_START + 0x5A
_08059918: .4byte IWRAM_START + 0x5B
_0805991C: .4byte gCamera
_08059920:
	ldr r1, _08059944 @ =IWRAM_START + 0x5C
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059954
	ldr r0, [r5, #0x4c]
	cmp r8, r0
	bge _08059988
	ldr r0, _08059948 @ =0x000001F9
	strh r0, [r6, #0xa]
	ldr r2, _0805994C @ =IWRAM_START + 0x2C
	adds r1, r7, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, _08059950 @ =IWRAM_START + 0x2D
	adds r1, r7, r3
	b _0805996A
	.align 2, 0
_08059944: .4byte IWRAM_START + 0x5C
_08059948: .4byte 0x000001F9
_0805994C: .4byte IWRAM_START + 0x2C
_08059950: .4byte IWRAM_START + 0x2D
_08059954:
	ldr r0, [r5, #0x4c]
	cmp r8, r0
	ble _0805996E
	ldr r0, _0805997C @ =0x000001F9
	strh r0, [r6, #0xa]
	ldr r4, _08059980 @ =IWRAM_START + 0x2C
	adds r1, r7, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08059984 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
_0805996A:
	movs r0, #0xff
	strb r0, [r1]
_0805996E:
	ldr r0, [r5, #0x4c]
	cmp r8, r0
	bge _08059988
	adds r1, r5, #0
	adds r1, #0x5c
	movs r0, #0
	b _0805998E
	.align 2, 0
_0805997C: .4byte 0x000001F9
_08059980: .4byte IWRAM_START + 0x2C
_08059984: .4byte IWRAM_START + 0x2D
_08059988:
	adds r1, r5, #0
	adds r1, #0x5c
	movs r0, #1
_0805998E:
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _080599A0
	subs r0, r1, #1
	strb r0, [r4]
_080599A0:
	ldr r0, [r5, #0x44]
	asrs r2, r0, #8
	ldr r3, _08059A08 @ =gCamera
	ldr r1, [r3]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r1, r7
	cmp r2, r0
	bgt _080599D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080599D2
	ldr r0, [r5, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080599D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08059A10
_080599D2:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080599F6
	movs r7, #0x18
	ldrsh r0, [r6, r7]
	adds r0, #0x80
	cmp r0, #0
	blt _080599F6
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059A10
_080599F6:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059A0C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059AEE
	.align 2, 0
_08059A08: .4byte gCamera
_08059A0C: .4byte gCurTask
_08059A10:
	ldr r1, _08059AB8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r2, [sp, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	ldr r3, [sp]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059A8E
	adds r0, r2, #0
	subs r0, #0x56
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x53
	bhi _08059A50
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08059A68
_08059A50:
	ldr r4, _08059ABC @ =0xFFFFFEAA
	adds r0, r2, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x53
	bhi _08059A8E
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08059A8E
_08059A68:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strh r2, [r0]
	adds r0, #5
	strb r1, [r0]
	ldr r0, _08059AC0 @ =0x000001F9
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08059AC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059AC8 @ =sub_8059B04
	str r0, [r1, #8]
_08059A8E:
	ldr r7, [sp]
	lsls r0, r7, #8
	ldr r2, [sp, #4]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _08059AE8
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08059AD0
	ldr r0, _08059ACC @ =0xFFFFFBFF
	ands r1, r0
	b _08059AD2
	.align 2, 0
_08059AB8: .4byte gPlayer
_08059ABC: .4byte 0xFFFFFEAA
_08059AC0: .4byte 0x000001F9
_08059AC4: .4byte gCurTask
_08059AC8: .4byte sub_8059B04
_08059ACC: .4byte 0xFFFFFBFF
_08059AD0:
	orrs r1, r2
_08059AD2:
	str r1, [r6, #0x10]
	movs r1, #0
	ldr r0, _08059B00 @ =0x000001F9
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08059AE8:
	adds r0, r6, #0
	bl sub_80051E8
_08059AEE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059B00: .4byte 0x000001F9

	thumb_func_start sub_8059B04
sub_8059B04: @ 0x08059B04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08059B60 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, _08059B64 @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r0, [r7]
	mov sl, r0
	ldr r1, [r7, #0x44]
	ldr r0, [r7, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x48]
	ldr r0, [r7, #0x50]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08059B68 @ =gCamera
	mov r8, r3
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
	beq _08059B6C
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08059C8A
	.align 2, 0
_08059B60: .4byte gCurTask
_08059B64: .4byte IWRAM_START + 0xC
_08059B68: .4byte gCamera
_08059B6C:
	ldr r0, [r7, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08059B9E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08059B9E
	ldr r0, [r7, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08059B9E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08059BD8
_08059B9E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08059BC2
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08059BC2
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059BD8
_08059BC2:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059BD4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059C8A
	.align 2, 0
_08059BD4: .4byte gCurTask
_08059BD8:
	adds r1, r7, #0
	adds r1, #0x5d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x22
	bne _08059C3A
	mov r1, sp
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0xfd
	lsls r0, r0, #1
	strh r0, [r1, #2]
	mov r0, sp
	strb r2, [r0, #4]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08059C0E
	adds r0, r4, #0
	adds r0, #0xa
	b _08059C12
_08059C0E:
	adds r0, r4, #0
	subs r0, #0xa
_08059C12:
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0xe
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	mov r1, sp
	adds r0, r7, #0
	adds r0, #0x58
	ldrh r0, [r0]
	subs r0, #0x10
	strh r0, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #8]
	mov r0, sp
	movs r1, #3
	movs r2, #0x10
	bl sub_8050ED8
_08059C3A:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _08059C84
	adds r0, r6, #0
	bl sub_80051E8
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #0x3c
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08059C78 @ =0x000001F9
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08059C7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059C80 @ =sub_8059858
	str r0, [r1, #8]
	b _08059C8A
	.align 2, 0
_08059C78: .4byte 0x000001F9
_08059C7C: .4byte gCurTask
_08059C80: .4byte sub_8059858
_08059C84:
	adds r0, r6, #0
	bl sub_80051E8
_08059C8A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
