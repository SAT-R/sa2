.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

	thumb_func_start sub_802D650
sub_802D650: @ 0x0802D650
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D6E4 @ =sub_802D6FC
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x3c
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r1, #0x38]
	ldr r0, _0802D6E8 @ =IWRAM_START + 0x3A
	adds r2, r3, r0
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D6EC @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D6F0 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D6F4 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D6F8 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D6E4: .4byte sub_802D6FC
_0802D6E8: .4byte IWRAM_START + 0x3A
_0802D6EC: .4byte 0x06010000
_0802D6F0: .4byte IWRAM_START + 0x20
_0802D6F4: .4byte IWRAM_START + 0x21
_0802D6F8: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D6FC
sub_802D6FC: @ 0x0802D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802D738 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r7, r6, #0
	ldr r5, [r6, #0x30]
	ldr r0, [r6, #0x34]
	mov r8, r0
	ldr r0, _0802D73C @ =IWRAM_START + 0x3A
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0802D740
	ldrh r0, [r6, #0x38]
	adds r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x12
	cmp r0, r1
	ble _0802D752
	movs r0, #0
	b _0802D750
	.align 2, 0
_0802D738: .4byte gCurTask
_0802D73C: .4byte IWRAM_START + 0x3A
_0802D740:
	ldrh r0, [r6, #0x38]
	subs r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	ldr r1, _0802D7D0 @ =0x01FF0000
	cmp r0, r1
	bgt _0802D752
	movs r0, #1
_0802D750:
	strb r0, [r2]
_0802D752:
	ldr r1, _0802D7D4 @ =gSineTable
	mov sb, r1
	ldrh r1, [r7, #0x38]
	ldr r4, _0802D7D8 @ =0x000003FF
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #3
	adds r5, r5, r0
	ldrh r0, [r7, #0x38]
	ands r4, r0
	lsls r4, r4, #1
	add r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #1
	add r8, r0
	str r5, [r7, #0x30]
	mov r0, r8
	str r0, [r7, #0x34]
	asrs r0, r5, #8
	ldr r3, _0802D7DC @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	mov r1, r8
	asrs r2, r1, #8
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r6, #0x18]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802D7C4
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D7C4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D7E4
_0802D7C4:
	ldr r0, _0802D7E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D7F0
	.align 2, 0
_0802D7D0: .4byte 0x01FF0000
_0802D7D4: .4byte gSineTable
_0802D7D8: .4byte 0x000003FF
_0802D7DC: .4byte gCamera
_0802D7E0: .4byte gCurTask
_0802D7E4:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0802D7F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

@; trapped animals

	thumb_func_start sub_802D7FC
sub_802D7FC: @ 0x0802D7FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D89C @ =sub_802D8B8
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #1
	strh r0, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r2, _0802D8A0 @ =IWRAM_START + 0x3C
	adds r0, r3, r2
	strb r6, [r0]
	ldr r0, _0802D8A4 @ =IWRAM_START + 0x3D
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D8A8 @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D8AC @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D8B0 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D8B4 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D89C: .4byte sub_802D8B8
_0802D8A0: .4byte IWRAM_START + 0x3C
_0802D8A4: .4byte IWRAM_START + 0x3D
_0802D8A8: .4byte 0x06010000
_0802D8AC: .4byte IWRAM_START + 0x20
_0802D8B0: .4byte IWRAM_START + 0x21
_0802D8B4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D8B8
sub_802D8B8: @ 0x0802D8B8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802D8F8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r5, r0, r1
	str r5, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802D8FC @ =IWRAM_START + 0x3D
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r2, r0, #0
	cmp r2, #0
	beq _0802D900
	subs r0, #1
	strb r0, [r3]
	b _0802D93A
	.align 2, 0
_0802D8F8: .4byte gCurTask
_0802D8FC: .4byte IWRAM_START + 0x3D
_0802D900:
	asrs r0, r5, #8
	asrs r1, r1, #8
	str r2, [sp]
	ldr r2, _0802D978 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r5, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802D93A
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r4, #0x3a]
	str r1, [r4, #0x34]
	ldr r0, _0802D97C @ =IWRAM_START + 0x3C
	adds r1, r6, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D936
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0x38]
_0802D936:
	movs r0, #1
	strb r0, [r1]
_0802D93A:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802D980 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802D96E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D96E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D988
_0802D96E:
	ldr r0, _0802D984 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D994
	.align 2, 0
_0802D978: .4byte sub_801EE64
_0802D97C: .4byte IWRAM_START + 0x3C
_0802D980: .4byte gCamera
_0802D984: .4byte gCurTask
_0802D988:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802D994:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

@; trapped animals

	thumb_func_start sub_802D99C
sub_802D99C: @ 0x0802D99C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802DA34 @ =sub_802DA4C
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	strh r5, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r0, _0802DA38 @ =IWRAM_START + 0x3C
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802DA3C @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802DA40 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802DA44 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802DA48 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA34: .4byte sub_802DA4C
_0802DA38: .4byte IWRAM_START + 0x3C
_0802DA3C: .4byte 0x06010000
_0802DA40: .4byte IWRAM_START + 0x20
_0802DA44: .4byte IWRAM_START + 0x21
_0802DA48: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802DA4C
sub_802DA4C: @ 0x0802DA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802DA8C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r6, r0, r1
	str r6, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802DA90 @ =IWRAM_START + 0x3C
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	beq _0802DA94
	subs r0, #1
	strb r0, [r2]
	b _0802DAB4
	.align 2, 0
_0802DA8C: .4byte gCurTask
_0802DA90: .4byte IWRAM_START + 0x3C
_0802DA94:
	asrs r0, r6, #8
	asrs r1, r1, #8
	str r5, [sp]
	ldr r2, _0802DAF4 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r6, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802DAB4
	strh r5, [r4, #0x3a]
	str r1, [r4, #0x34]
_0802DAB4:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802DAF8 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802DAE8
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802DAE8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802DB00
_0802DAE8:
	ldr r0, _0802DAFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802DB0C
	.align 2, 0
_0802DAF4: .4byte sub_801EE64
_0802DAF8: .4byte gCamera
_0802DAFC: .4byte gCurTask
_0802DB00:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802DB0C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

    @ Maybe called "SpawnTrappedAnimal"?
	thumb_func_start sub_802DB14
sub_802DB14: @ 0x0802DB14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0802DBB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0802DB34
	movs r2, #6
_0802DB34:
	ldr r3, _0802DBB4 @ =gAnimsTrappedAnimals
	ldr r4, _0802DBB8 @ =gUnknown_03005444
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [sp]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r1, r3, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r3, #8
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0802DB96
	movs r0, #0
	strb r0, [r4]
_0802DB96:
	ldr r0, _0802DBBC @ =gUnknown_080D6DD8
	lsls r1, r5, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov r0, sp
	bl _call_via_r1
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBB0: .4byte gCurrentLevel
_0802DBB4: .4byte gAnimsTrappedAnimals
_0802DBB8: .4byte gUnknown_03005444
_0802DBBC: .4byte gUnknown_080D6DD8
