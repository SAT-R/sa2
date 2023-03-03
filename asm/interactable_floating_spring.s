.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8074EF4
sub_8074EF4: @ 0x08074EF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08074F38 @ =gPlayer
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _08074FD0
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r3, r5, #0
	bl sub_800CDBC
	adds r2, r0, #0
	cmp r2, #0
	beq _08074FD0
	ldr r3, [r5, #0xc]
	asrs r1, r3, #8
	ldr r0, [r4, #0x40]
	cmp r1, r0
	bge _08074F3C
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #8
	adds r0, r3, r0
	str r0, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	b _08074F52
	.align 2, 0
_08074F38: .4byte gPlayer
_08074F3C:
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r2
	cmp r1, #0
	beq _08074F5C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r0, r3, r0
	str r0, [r5, #0xc]
	movs r2, #0x12
	ldrsh r0, [r5, r2]
_08074F52:
	cmp r0, #0
	ble _08074F58
	strh r6, [r5, #0x12]
_08074F58:
	movs r0, #2
	b _08074FD2
_08074F5C:
	movs r4, #0x80
	lsls r4, r4, #0xa
	ands r4, r2
	cmp r4, #0
	beq _08074F7A
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r0, r3, r0
	str r0, [r5, #0xc]
	movs r2, #0x12
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08074FCC
	strh r1, [r5, #0x12]
	b _08074FCC
_08074F7A:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r2
	cmp r3, #0
	beq _08074FA4
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08074FCC
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x14]
	b _08074FCC
_08074FA4:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _08074FD0
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08074FCC
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_08074FCC:
	movs r0, #1
	b _08074FD2
_08074FD0:
	movs r0, #0
_08074FD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8074FD8
sub_8074FD8: @ 0x08074FD8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08075012
	ldr r0, _08074FFC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _08075004
	movs r0, #0
	ldr r1, _08075000 @ =0x0000023B
	strh r1, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2c
	b _08075040
	.align 2, 0
_08074FFC: .4byte gCurrentLevel
_08075000: .4byte 0x0000023B
_08075004:
	movs r0, #0
	movs r1, #0x8e
	lsls r1, r1, #2
	strh r1, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2c
	b _08075040
_08075012:
	ldr r0, _0807502C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x1a
	cmp r1, #2
	bne _08075034
	ldr r0, _08075030 @ =0x0000023B
	strh r0, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _08075042
	.align 2, 0
_0807502C: .4byte gCurrentLevel
_08075030: .4byte 0x0000023B
_08075034:
	movs r0, #0x8e
	lsls r0, r0, #2
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #2
_08075040:
	strb r0, [r1]
_08075042:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075048
sub_8075048: @ 0x08075048
	push {lr}
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08075080
	ldr r0, _0807506C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _08075074
	ldr r0, _08075070 @ =0x0000023B
	strh r0, [r1, #0x16]
	adds r1, #0x2c
	movs r0, #1
	b _080750A2
	.align 2, 0
_0807506C: .4byte gCurrentLevel
_08075070: .4byte 0x0000023B
_08075074:
	movs r0, #0x8e
	lsls r0, r0, #2
	strh r0, [r1, #0x16]
	adds r1, #0x2c
	movs r0, #1
	b _080750A2
_08075080:
	ldr r0, _08075090 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _08075098
	ldr r0, _08075094 @ =0x0000023B
	b _0807509C
	.align 2, 0
_08075090: .4byte gCurrentLevel
_08075094: .4byte 0x0000023B
_08075098:
	movs r0, #0x8e
	lsls r0, r0, #2
_0807509C:
	strh r0, [r1, #0x16]
	adds r1, #0x2c
	movs r0, #3
_080750A2:
	strb r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_80750A8
sub_80750A8: @ 0x080750A8
	push {r4, r5, lr}
	ldr r0, _080750D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8074E44
	adds r0, r4, #0
	bl sub_8075228
	cmp r0, #0
	beq _080750D8
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080750F2
	adds r0, r4, #0
	bl sub_80752BC
	b _080750F2
	.align 2, 0
_080750D4: .4byte gCurTask
_080750D8:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080750F2
	adds r0, r4, #0
	bl sub_8075284
	adds r0, r4, #0
	bl sub_8074FD8
	ldr r1, _0807511C @ =IWRAM_START + 0xC
	adds r0, r5, r1
	bl sub_8004558
_080750F2:
	adds r0, r4, #0
	bl sub_8074EF4
	cmp r0, #2
	bne _08075102
	adds r0, r4, #0
	bl sub_8075154
_08075102:
	adds r0, r4, #0
	bl sub_80751CC
	cmp r0, #0
	beq _08075124
	ldr r1, [r4]
	ldrb r0, [r4, #8]
	strb r0, [r1]
	ldr r0, _08075120 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08075138
	.align 2, 0
_0807511C: .4byte IWRAM_START + 0xC
_08075120: .4byte gCurTask
_08075124:
	adds r0, r4, #0
	bl sub_80751B4
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08075138
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_08075138:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075140
sub_8075140: @ 0x08075140
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_80752BC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075154
sub_8075154: @ 0x08075154
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08075174 @ =gPlayer
	adds r2, r1, #0
	adds r2, #0x6d
	movs r0, #0xe
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r2, [r0]
	cmp r2, #0
	beq _08075178
	adds r1, #0x6e
	movs r0, #3
	strb r0, [r1]
	b _0807517E
	.align 2, 0
_08075174: .4byte gPlayer
_08075178:
	adds r0, r1, #0
	adds r0, #0x6e
	strb r2, [r0]
_0807517E:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _0807518A
	adds r0, r4, #0
	bl sub_8075284
_0807518A:
	adds r0, r4, #0
	bl sub_8075048
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	movs r0, #0x99
	bl m4aSongNumStart
	ldr r0, _080751AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080751B0 @ =sub_80752D8
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080751AC: .4byte gCurTask
_080751B0: .4byte sub_80752D8

	thumb_func_start sub_80751B4
sub_80751B4: @ 0x080751B4
	ldr r1, [r0, #0x3c]
	ldr r3, _080751C8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_080751C8: .4byte gCamera

	thumb_func_start sub_80751CC
sub_80751CC: @ 0x080751CC
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _0807521C @ =gCamera
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
	blt _08075216
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08075216
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _08075216
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r1, r3
	cmp r2, r0
	ble _08075220
_08075216:
	movs r0, #1
	b _08075222
	.align 2, 0
_0807521C: .4byte gCamera
_08075220:
	movs r0, #0
_08075222:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8075228
sub_8075228: @ 0x08075228
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _08075278 @ =gCamera
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
	blt _08075272
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08075272
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _08075272
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	ble _0807527C
_08075272:
	movs r0, #1
	b _0807527E
	.align 2, 0
_08075278: .4byte gCamera
_0807527C:
	movs r0, #0
_0807527E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8075284
sub_8075284: @ 0x08075284
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080752AE
	ldr r0, _080752B4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	movs r0, #0x1c
	bl VramMalloc
	str r0, [r4, #0x10]
	ldr r0, _080752B8 @ =0x0000FFFF
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	str r0, [r4, #0x4c]
_080752AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080752B4: .4byte gCurrentLevel
_080752B8: .4byte 0x0000FFFF

	thumb_func_start sub_80752BC
sub_80752BC: @ 0x080752BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080752D2
	ldr r0, [r4, #0x10]
	bl VramFree
	movs r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x4c]
_080752D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80752D8
sub_80752D8: @ 0x080752D8
	push {r4, r5, lr}
	ldr r0, _0807530C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8074E44
	adds r0, r4, #0
	bl sub_80751B4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08075310
	adds r0, r5, #0
	bl sub_8004558
	b _08075316
	.align 2, 0
_0807530C: .4byte gCurTask
_08075310:
	adds r0, r4, #0
	bl sub_8075334
_08075316:
	adds r0, r4, #0
	bl sub_8074EF4
	cmp r0, #2
	bne _08075326
	adds r0, r4, #0
	bl sub_8075154
_08075326:
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075334
sub_8075334: @ 0x08075334
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #1
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	bl sub_8074FD8
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08075368 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807536C @ =sub_80750A8
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075368: .4byte gCurTask
_0807536C: .4byte sub_80750A8
