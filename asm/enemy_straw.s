.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80567F8
sub_80567F8: @ 0x080567F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056854 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _08056858 @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r6]
	mov sl, r3
	ldr r1, [r6, #0x3c]
	ldr r0, [r6, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x40]
	ldr r0, [r6, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _0805685C @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08056860
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08056938
	.align 2, 0
_08056854: .4byte gCurTask
_08056858: .4byte IWRAM_START + 0xC
_0805685C: .4byte gCamera
_08056860:
	ldr r0, [r6, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056892
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056892
	ldr r0, [r6, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056892
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080568CC
_08056892:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080568B6
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080568B6
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080568CC
_080568B6:
	ldrb r0, [r6, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _080568C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056938
	.align 2, 0
_080568C8: .4byte gCurTask
_080568CC:
	adds r3, r6, #0
	adds r3, #0x54
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056924
	ldr r2, _08056948 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0805694C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08056950 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _08056954 @ =0x000003FF
	ands r1, r0
	ldr r2, _08056958 @ =gSineTable
	mov sb, r2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r8, r0
	add r8, sb
	mov r2, r8
	ldrh r2, [r2]
	mov r8, r2
	mov r0, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	str r0, [r6, #0x4c]
	lsls r1, r1, #1
	add r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	str r0, [r6, #0x50]
	movs r0, #0x64
	strb r0, [r3]
	ldr r0, _0805695C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056960 @ =sub_8056964
	str r0, [r1, #8]
_08056924:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056938:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056948: .4byte gPseudoRandom
_0805694C: .4byte 0x00196225
_08056950: .4byte 0x3C6EF35F
_08056954: .4byte 0x000003FF
_08056958: .4byte gSineTable
_0805695C: .4byte gCurTask
_08056960: .4byte sub_8056964

	thumb_func_start sub_8056964
sub_8056964: @ 0x08056964
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080569BC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r7, r1, r0
	ldr r1, [r4]
	mov sb, r1
	ldr r2, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r2, r2, r0
	str r2, [r4, #0x44]
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r2
	asrs r5, r0, #8
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r1, _080569C0 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r0, _080569C4 @ =gPlayer
	lsls r2, r5, #8
	ldr r1, [r0, #8]
	adds r3, r0, #0
	cmp r1, r2
	bge _080569C8
	ldr r0, [r4, #0x4c]
	subs r0, #0x10
	b _080569CC
	.align 2, 0
_080569BC: .4byte gCurTask
_080569C0: .4byte gCamera
_080569C4: .4byte gPlayer
_080569C8:
	ldr r0, [r4, #0x4c]
	adds r0, #0xb
_080569CC:
	str r0, [r4, #0x4c]
	ldr r0, [r3, #0xc]
	lsls r3, r6, #8
	mov r8, r3
	cmp r0, r8
	bge _080569DE
	ldr r0, [r4, #0x50]
	subs r0, #0x10
	b _080569E2
_080569DE:
	ldr r0, [r4, #0x50]
	adds r0, #0xb
_080569E2:
	str r0, [r4, #0x50]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08056A52
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	ldr r3, _08056A5C @ =gCamera
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov ip, r0
	cmp r2, ip
	bgt _08056A28
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056A28
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056A28
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056A64
_08056A28:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056A4C
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056A4C
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056A64
_08056A4C:
	ldrb r0, [r4, #8]
	mov r1, sb
	strb r0, [r1]
_08056A52:
	ldr r0, _08056A60 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056AE6
	.align 2, 0
_08056A5C: .4byte gCamera
_08056A60: .4byte gCurTask
_08056A64:
	adds r1, r4, #0
	adds r1, #0x54
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #0
	bne _08056AA4
	adds r1, #1
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _08056A98
	ldr r0, _08056A90 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056A94 @ =sub_8056AF4
	b _08056A9E
	.align 2, 0
_08056A90: .4byte gCurTask
_08056A94: .4byte sub_8056AF4
_08056A98:
	ldr r0, _08056AC0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056AC4 @ =sub_80567F8
_08056A9E:
	str r0, [r1, #8]
	movs r0, #0x1e
	strb r0, [r3]
_08056AA4:
	lsls r4, r5, #8
	adds r0, r4, #0
	mov r1, r8
	bl sub_80122DC
	ldr r0, _08056AC8 @ =gPlayer
	ldr r0, [r0, #8]
	cmp r0, r4
	bge _08056AD0
	ldr r0, [r7, #0x10]
	ldr r1, _08056ACC @ =0xFFFFFBFF
	ands r0, r1
	b _08056AD8
	.align 2, 0
_08056AC0: .4byte gCurTask
_08056AC4: .4byte sub_80567F8
_08056AC8: .4byte gPlayer
_08056ACC: .4byte 0xFFFFFBFF
_08056AD0:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_08056AD8:
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056AE6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8056AF4
sub_8056AF4: @ 0x08056AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056B5C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r3, _08056B60 @ =IWRAM_START + 0xC
	adds r7, r1, r3
	ldr r0, [r6]
	mov sl, r0
	ldr r2, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r2, r2, r0
	str r2, [r6, #0x44]
	ldr r3, [r6, #0x48]
	ldr r0, [r6, #0x50]
	adds r3, r3, r0
	str r3, [r6, #0x48]
	ldr r1, [r6, #0x3c]
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x40]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08056B64 @ =gCamera
	mov r8, r3
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08056B68
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08056BE8
	.align 2, 0
_08056B5C: .4byte gCurTask
_08056B60: .4byte IWRAM_START + 0xC
_08056B64: .4byte gCamera
_08056B68:
	ldr r0, [r6, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056B9A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056B9A
	ldr r0, [r6, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056B9A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056BD4
_08056B9A:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056BBE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056BBE
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056BD4
_08056BBE:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08056BD0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056BE8
	.align 2, 0
_08056BD0: .4byte gCurTask
_08056BD4:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056BE8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
