.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8076928
sub_8076928: @ 0x08076928
	push {r4, r5, r6, lr}
	ldr r0, _0807694C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _08076950 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076954
	adds r0, r5, #0
	bl sub_8076CF4
	b _080769D8
	.align 2, 0
_0807694C: .4byte gCurTask
_08076950: .4byte gPlayer
_08076954:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _08076964
	adds r0, r5, #0
	bl sub_8076D08
	b _080769D8
_08076964:
	ldr r0, [r5]
	lsls r3, r0, #8
	ldr r0, [r5, #4]
	lsls r0, r0, #8
	movs r6, #0xc0
	lsls r6, r6, #5
	adds r4, r0, r6
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _08076990
	cmp r0, r3
	ble _08076986
	subs r0, #0x80
	str r0, [r2, #8]
	cmp r0, r3
	bge _08076990
	b _0807698E
_08076986:
	adds r0, #0x80
	str r0, [r2, #8]
	cmp r0, r3
	ble _08076990
_0807698E:
	str r3, [r2, #8]
_08076990:
	ldr r0, [r2, #8]
	subs r1, r0, r3
	cmp r1, #0
	blt _080769A2
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _080769AC
	b _080769C6
_080769A2:
	subs r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bgt _080769C6
_080769AC:
	ldr r1, [r2, #0xc]
	cmp r1, r4
	beq _080769C6
	ldrh r0, [r2, #0x12]
	adds r0, #0x2a
	strh r0, [r2, #0x12]
	movs r6, #0x12
	ldrsh r0, [r2, r6]
	adds r0, r1, r0
	str r0, [r2, #0xc]
	cmp r0, r4
	ble _080769C6
	str r4, [r2, #0xc]
_080769C6:
	ldr r0, [r2, #8]
	cmp r0, r3
	bne _080769D8
	ldr r0, [r2, #0xc]
	cmp r0, r4
	bne _080769D8
	adds r0, r5, #0
	bl sub_8076C58
_080769D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80769E0
sub_80769E0: @ 0x080769E0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08076A60 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r5, _08076A64 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076A02
	adds r0, r6, #0
	bl sub_8076CF4
_08076A02:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08076A10
	adds r0, r6, #0
	bl sub_8076D08
_08076A10:
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r1, [r5, #0x12]
	adds r1, #0x2a
	strh r1, [r5, #0x12]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08076A68 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08076A4A
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
_08076A4A:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _08076A58
	adds r0, r6, #0
	bl sub_8076C70
_08076A58:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076A60: .4byte gCurTask
_08076A64: .4byte gPlayer
_08076A68: .4byte sub_801EC3C

	thumb_func_start sub_8076A6C
sub_8076A6C: @ 0x08076A6C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08076B70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r5, _08076B74 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076A8E
	adds r0, r6, #0
	bl sub_8076CF4
_08076A8E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08076A9C
	adds r0, r6, #0
	bl sub_8076D08
_08076A9C:
	movs r2, #8
	ldrsh r1, [r6, r2]
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r6, #8]
	ldr r1, _08076B78 @ =gSineTable
	ldrb r0, [r6, #0xe]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r6, #0xa]
	ldr r1, [r5, #8]
	movs r0, #0xa
	ldrsh r2, [r6, r0]
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r2, #0x17
	ldrsb r2, [r5, r2]
	subs r0, r0, r2
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08076B7C @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08076AFA
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
_08076AFA:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r2, r5, #0
	adds r2, #0x5c
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08076B1E
	ldr r0, [r5, #8]
	adds r0, #0x80
	str r0, [r5, #8]
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
_08076B1E:
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08076B36
	ldr r0, [r5, #8]
	subs r0, #0x80
	str r0, [r5, #8]
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x20]
_08076B36:
	ldr r0, [r6]
	lsls r1, r0, #8
	ldr r2, _08076B80 @ =0xFFFFF000
	adds r0, r1, r2
	ldr r2, [r5, #8]
	cmp r0, r2
	bgt _08076B4E
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r1, r3
	cmp r0, r2
	bge _08076B54
_08076B4E:
	adds r0, r6, #0
	bl sub_8076C88
_08076B54:
	ldrh r0, [r6, #0xe]
	adds r1, r0, #1
	strh r1, [r6, #0xe]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb3
	bls _08076B68
	adds r0, r6, #0
	bl sub_8076CC0
_08076B68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076B70: .4byte gCurTask
_08076B74: .4byte gPlayer
_08076B78: .4byte gSineTable
_08076B7C: .4byte sub_801EC3C
_08076B80: .4byte 0xFFFFF000

	thumb_func_start sub_8076B84
sub_8076B84: @ 0x08076B84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08076BD8 @ =gPlayer
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r5, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	ldr r0, [r6, #4]
	subs r0, #8
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldr r0, _08076BDC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076BE0 @ =sub_8076928
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076BD8: .4byte gPlayer
_08076BDC: .4byte gCurTask
_08076BE0: .4byte sub_8076928

	thumb_func_start sub_8076BE4
sub_8076BE4: @ 0x08076BE4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r5, _08076C48 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076C50
	ldr r2, [r3]
	ldr r1, _08076C4C @ =gCamera
	ldr r4, [r1]
	adds r0, r4, #0
	adds r0, #0x14
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r3, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _08076C50
	adds r0, #0x28
	cmp r1, r0
	bge _08076C50
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08076C50
	adds r0, r2, #0
	adds r0, #0x20
	cmp r1, r0
	bge _08076C50
	movs r0, #1
	b _08076C52
	.align 2, 0
_08076C48: .4byte gPlayer
_08076C4C: .4byte gCamera
_08076C50:
	movs r0, #0
_08076C52:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
    
.if 0
.endif
