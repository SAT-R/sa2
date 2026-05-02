.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0806F3F8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov sb, r0          @ sb = wamu
	ldr r1, _0806F3FC @ =0x0300000C
	adds r1, r1, r6
	mov sl, r1          @ sl = s
	ldr r2, _0806F400 @ =0x03000048
	adds r2, r2, r6
	mov r8, r2          @ r8 = s2
	ldr r3, _0806F404 @ =0x03000084
	adds r7, r6, r3     @ r7 = s3
	ldr r4, [r0]
	str r4, [sp]        @ sp00 = me
	ldrb r2, [r0, #8]
	lsls r2, r2, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r5, sb
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #0x10] @ sp10 = worldX
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #0x14] @ sp14 = worldY
	ldr r4, _0806F408 @ =gSineTable
	ldr r0, _0806F40C @ =0x030000BC
	adds r5, r6, r0
	ldrh r1, [r5]
	ldr r0, _0806F410 @ =0x000003FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, [sp]
	ldrb r2, [r3, #6]
	lsls r2, r2, #2
	movs r1, #0x50
	subs r1, r1, r2
	bl Div
	ldr r1, _0806F414 @ =0x030000B4
	adds r2, r6, r1
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	asrs r1, r1, #8
	ldr r2, [sp, #0x10] @ r2 = worldX
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]    @ sp04 = worldX + unkB4
	ldrh r1, [r5]
	ldr r0, _0806F410 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r1, #0x50
	bl Div
	ldr r4, _0806F418 @ =0x030000B8
	adds r2, r6, r4
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	asrs r1, r1, #8
	ldr r0, [sp, #0x14] @ sp14 = worldY
	adds r1, r0, r1
	lsls r1, r1, #0x10
	ldr r3, _0806F41C @ =gCamera
	ldrh r2, [r3]
	ldr r4, [sp, #4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	movs r4, #0
	mov r2, sl
	strh r0, [r2, #0x16]
	ldrh r0, [r3, #2]
	lsrs r3, r1, #0x10
	str r3, [sp, #8]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r2, #0x18]
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0806F44C
	ldr r0, _0806F420 @ =0x030001C0
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0806F428
	ldrh r0, [r5]
	adds r0, #5
	strh r0, [r5]
	subs r1, #1
	ands r0, r1
	subs r0, #0x65
	lsls r0, r0, #0x10
	ldr r1, _0806F424 @ =0x03360000
	cmp r0, r1
	bhi _0806F49A
	movs r0, #0x64
	strh r0, [r5]
	b _0806F46A
	.align 2, 0
_0806F3F8: .4byte gCurTask
_0806F3FC: .4byte 0x0300000C
_0806F400: .4byte 0x03000048
_0806F404: .4byte 0x03000084
_0806F408: .4byte gSineTable
_0806F40C: .4byte 0x030000BC
_0806F410: .4byte 0x000003FF
_0806F414: .4byte 0x030000B4
_0806F418: .4byte 0x030000B8
_0806F41C: .4byte gCamera
_0806F420: .4byte 0x030001C0
_0806F424: .4byte 0x03360000
_0806F428:
	ldrh r0, [r5]
	subs r0, #5
	strh r0, [r5]
	ldr r3, _0806F444 @ =0x000003FF
	ands r0, r3
	subs r0, #0x65
	lsls r0, r0, #0x10
	ldr r1, _0806F448 @ =0x03360000
	cmp r0, r1
	bhi _0806F49A
	movs r0, #0xe7
	lsls r0, r0, #2
	b _0806F490
	.align 2, 0
_0806F444: .4byte 0x000003FF
_0806F448: .4byte 0x03360000
_0806F44C:
	ldr r0, _0806F474 @ =0x030001C0
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0806F47C
	ldrh r0, [r5]
	adds r0, #5
	strh r0, [r5]
	ldr r1, _0806F478 @ =0x000003FF
	ands r0, r1
	movs r1, #0x99
	lsls r1, r1, #2
	cmp r0, r1
	bls _0806F49A
	strh r1, [r5]
_0806F46A:
	strb r4, [r2]
	movs r2, #1
	str r2, [sp, #0xc]  @ sp0C = 1
	b _0806F49A
	.align 2, 0
_0806F474: .4byte 0x030001C0
_0806F478: .4byte 0x000003FF
_0806F47C:
	ldrh r0, [r5]
	subs r0, #8
	strh r0, [r5]
	ldr r3, _0806F52C @ =0x000003FF
	ands r0, r3
	ldr r1, _0806F530 @ =0x0000019B
	cmp r0, r1
	bhi _0806F49A
	movs r0, #0xce
	lsls r0, r0, #1
_0806F490:
	strh r0, [r5]
	movs r0, #1
	strb r0, [r2]
	movs r4, #1
	str r4, [sp, #0xc]  @ sp0C = 1
_0806F49A:
	ldr r3, _0806F534 @ =0x000001C1
	add r3, sb
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #1
	mov r2, sb
	adds r2, #0xc0
	adds r0, r2, r0
	mov r5, sp
	ldrh r5, [r5, #4]
	strh r5, [r0]
	ldrb r0, [r3]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, sb
	adds r0, r0, r1
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r0]
	ldr r3, _0806F538 @ =gCamera
	movs r4, #0
	ldrsh r1, [r3, r4]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x10] @ r2 = worldX
	cmp r2, r0
	bgt _0806F4FC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0806F4FC
	movs r4, #2
	ldrsh r1, [r3, r4]
	subs r5, #0x50
	adds r0, r1, r5
	ldr r2, [sp, #0x14] @ r2 = worldY
	cmp r2, r0
	bgt _0806F4FC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0806F53C
_0806F4FC:
	mov r3, sl
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0806F522
	movs r4, #0x18
	ldrsh r0, [r3, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _0806F522
	movs r5, #0x18
	ldrsh r1, [r3, r5]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0806F53C
_0806F522:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	b _0806F552
	.align 2, 0
_0806F52C: .4byte 0x000003FF
_0806F530: .4byte 0x0000019B
_0806F534: .4byte 0x000001C1
_0806F538: .4byte gCamera
_0806F53C:
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	ldr r4, [sp, #8]
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	mov r0, sl
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	beq _0806F560
_0806F552:
	ldr r0, _0806F55C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0806FA64
	.align 2, 0
_0806F55C: .4byte gCurTask
_0806F560:
	mov r0, sb
	adds r0, #0xb4
	ldr r0, [r0]        @ r0 = wamu->qUnkB4
	asrs r2, r0, #8
	ldr r5, [sp]        @ r5 = sp00 = me
	movs r1, #3
	ldrsb r1, [r5, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _0806F5A8
	mov r1, sl          @ r1 = sl = s
	ldr r0, [r1, #0x10]
	mvns r0, r0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r0, r2
	cmp r0, #0
	beq _0806F5F6
	ldr r3, [sp, #0xc]  @ r3 = sp0C = sp0C
	cmp r3, #0
	beq _0806F5F6
	mov r1, sb
	adds r1, #0xbe
	movs r0, #0xa0
	strh r0, [r1]
	mov r4, sl
	ldr r0, [r4, #0x10]
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r5, r8          @ r5 = r8 = s2
	ldr r0, [r5, #0x10]
	orrs r0, r2
	str r0, [r5, #0x10]
	ldr r0, [r7, #0x10] @ r7 = s3
	orrs r0, r2
	b _0806F5E4
_0806F5A8:
	ldr r4, [sp]        @ r4 = sp00 = me
	ldrb r0, [r4, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _0806F5F6
	mov r5, sl
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0806F5F6
	ldr r0, [sp, #0xc]  @ r0 = sp0C = sp0C
	cmp r0, #0
	beq _0806F5F6
	mov r1, sb
	adds r1, #0xbe
	ldr r0, _0806F934 @ =0x0000FF60
	strh r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _0806F938 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
	mov r2, r8
	ldr r0, [r2, #0x10]
	ands r0, r1
	str r0, [r2, #0x10]
	ldr r0, [r7, #0x10]
	ands r0, r1
_0806F5E4:
	str r0, [r7, #0x10]
	mov r2, sb
	adds r2, #0xbc
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
_0806F5F6:
	mov r0, sl
	bl UpdateSpriteAnimation
	mov r0, sl
	bl DisplaySprite
	ldr r4, _0806F93C @ =0x000001C1
	add r4, sb
	ldrb r0, [r4]
	subs r0, #0x18
	movs r2, #0x3f
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, [sp, #0x18]     @ r5 = sp18 = &wamu->worldXs[]
	adds r0, r5, r0
	ldr r3, _0806F940 @ =gCamera
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	mov r5, sl              @ r5 = sl = s
	ldrh r1, [r5, #0x16]
	subs r1, r1, r0
	strh r1, [r7, #0x16]    @ r7 = s3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11      @ r1 = (s->y >> 1)
	ldrb r0, [r4]
	subs r0, #0x18
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, [sp, #0x18]     @ r5 = sp18 = worldXs
	adds r0, r5, r0
	ldrh r0, [r0]
	subs r0, r0, r1
	ldrh r1, [r3]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10      @ r5 = ???
	subs r1, r5, r1
	strh r1, [r7, #0x16]    @ s->x =
	ldrb r0, [r4]
	subs r0, #0x28
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sb
	adds r1, r1, r0
	ldrh r2, [r3, #2]
	ldrh r0, [r1]
	str r0, [sp, #8]
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, r0, r2
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	ldr r1, [r7, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806F716
	adds r0, r7, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r5, r5, r6
	ldr r2, _0806F944 @ =gPlayer
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r3, _0806F948 @ =gPlayerBodyPSI
	adds r0, r3, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	adds r4, r3, #0
	cmp r5, r1
	bgt _0806F6B2
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r5, r0
	cmp r0, r1
	bge _0806F6C6
	cmp r5, r1
	blt _0806F716
_0806F6B2:
	adds r0, r4, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r5
	blt _0806F716
_0806F6C6:
	ldr r5, [sp, #8]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r3, r7, #0
	adds r3, #0x2d
	movs r5, #0
	ldrsb r5, [r3, r5]
	adds r1, r0, r5
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	adds r3, r4, #0
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	cmp r1, r3
	bgt _0806F6FE
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	bge _0806F710
	cmp r1, r3
	blt _0806F716
_0806F6FE:
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r1
	blt _0806F716
_0806F710:
	adds r0, r2, #0
	bl Coll_DamagePlayer
_0806F716:
	ldr r4, _0806F93C @ =0x000001C1
	add r4, sb
	ldrb r0, [r4]
	subs r0, #0x13
	movs r2, #0x3f
	ands r0, r2
	lsls r0, r0, #1
	ldr r1, [sp, #0x18]
	adds r0, r1, r0
	ldr r3, _0806F940 @ =gCamera
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	mov r5, sl
	ldrh r1, [r5, #0x16]
	subs r1, r1, r0
	strh r1, [r7, #0x16]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r4]
	subs r0, #0x13
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, [sp, #0x18]
	adds r0, r5, r0
	ldrh r0, [r0]
	subs r0, r0, r1
	ldrh r1, [r3]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	subs r1, r5, r1
	strh r1, [r7, #0x16]
	ldrb r0, [r4]
	subs r0, #0x1e
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sb
	adds r1, r1, r0
	ldrh r2, [r3, #2]
	ldrh r0, [r1]
	str r0, [sp, #8]
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, r0, r2
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	ldr r1, [r7, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806F824
	adds r0, r7, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r5, r5, r6
	ldr r2, _0806F944 @ =gPlayer
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r3, _0806F948 @ =gPlayerBodyPSI
	adds r0, r3, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	adds r4, r3, #0
	cmp r5, r1
	bgt _0806F7C0
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r5, r0
	cmp r0, r1
	bge _0806F7D4
	cmp r5, r1
	blt _0806F824
_0806F7C0:
	adds r0, r4, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r5
	blt _0806F824
_0806F7D4:
	ldr r5, [sp, #8]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r3, r7, #0
	adds r3, #0x2d
	movs r5, #0
	ldrsb r5, [r3, r5]
	adds r1, r0, r5
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	adds r3, r4, #0
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	cmp r1, r3
	bgt _0806F80C
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	bge _0806F81E
	cmp r1, r3
	blt _0806F824
_0806F80C:
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r1
	blt _0806F824
_0806F81E:
	adds r0, r2, #0
	bl Coll_DamagePlayer
_0806F824:
	ldr r4, _0806F93C @ =0x000001C1
	add r4, sb
	ldrb r0, [r4]
	subs r0, #0xe
	movs r2, #0x3f
	ands r0, r2
	lsls r0, r0, #1
	ldr r1, [sp, #0x18]
	adds r0, r1, r0
	ldr r3, _0806F940 @ =gCamera
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	mov r5, sl
	ldrh r1, [r5, #0x16]
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #0x16]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r4]
	subs r0, #0xe
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, [sp, #0x18]
	adds r0, r5, r0
	ldrh r0, [r0]
	subs r0, r0, r1
	ldrh r1, [r3]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	subs r1, r5, r1
	mov r0, r8
	strh r1, [r0, #0x16]
	ldrb r0, [r4]
	subs r0, #0x14
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sb
	adds r1, r1, r0
	ldrh r2, [r3, #2]
	ldrh r3, [r1]
	str r3, [sp, #8]
	movs r4, #0
	ldrsh r0, [r1, r4]
	subs r0, r0, r2
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl UpdateSpriteAnimation
	mov r0, r8
	bl DisplaySprite
	mov r2, r8
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806F954
	mov r0, r8
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r5, r5, r6
	ldr r2, _0806F944 @ =gPlayer
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r3, _0806F948 @ =gPlayerBodyPSI
	adds r0, r3, #0
	adds r0, #0x38
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	adds r4, r3, #0
	cmp r5, r1
	bgt _0806F8D8
	mov r0, r8
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r5, r0
	cmp r0, r1
	bge _0806F8EA
	cmp r5, r1
	blt _0806F954
_0806F8D8:
	adds r0, r4, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r5
	blt _0806F954
_0806F8EA:
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	adds r3, #0x2d
	movs r5, #0
	ldrsb r5, [r3, r5]
	adds r1, r0, r5
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	adds r3, r4, #0
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	cmp r1, r3
	bgt _0806F922
	mov r0, r8
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	bge _0806F94E
	cmp r1, r3
	blt _0806F954
_0806F922:
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r1
	b _0806F94C
	.align 2, 0
_0806F934: .4byte 0x0000FF60
_0806F938: .4byte 0xFFFFFBFF
_0806F93C: .4byte 0x000001C1
_0806F940: .4byte gCamera
_0806F944: .4byte gPlayer
_0806F948: .4byte gPlayerBodyPSI
_0806F94C:
	blt _0806F954
_0806F94E:
	adds r0, r2, #0
	bl Coll_DamagePlayer
_0806F954:
	ldr r4, _0806FA74 @ =0x000001C1
	add r4, sb
	ldrb r0, [r4]
	subs r0, #7
	movs r2, #0x3f
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, [sp, #0x18]
	adds r0, r5, r0
	ldr r3, _0806FA78 @ =gCamera
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	mov r5, sl
	ldrh r1, [r5, #0x16]
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #0x16]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r4]
	subs r0, #7
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, [sp, #0x18]
	adds r0, r5, r0
	ldrh r0, [r0]
	subs r0, r0, r1
	ldrh r1, [r3]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	subs r1, r5, r1
	mov r0, r8
	strh r1, [r0, #0x16]
	ldrb r0, [r4]
	subs r0, #0xa
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sb
	adds r1, r1, r0
	ldrh r2, [r3, #2]
	ldrh r3, [r1]
	str r3, [sp, #8]
	movs r4, #0
	ldrsh r0, [r1, r4]
	subs r0, r0, r2
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	mov r2, r8
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806FA64
	mov r0, r8
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r5, r5, r6
	ldr r2, _0806FA7C @ =gPlayer
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r3, _0806FA80 @ =gPlayerBodyPSI
	adds r0, r3, #0
	adds r0, #0x38
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	adds r4, r3, #0
	cmp r5, r1
	bgt _0806FA02
	mov r0, r8
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r5, r0
	cmp r0, r1
	bge _0806FA14
	cmp r5, r1
	blt _0806FA64
_0806FA02:
	adds r0, r4, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r5
	blt _0806FA64
_0806FA14:
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	adds r3, #0x2d
	movs r5, #0
	ldrsb r5, [r3, r5]
	adds r1, r0, r5
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	adds r3, r4, #0
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	cmp r1, r3
	bgt _0806FA4C
	mov r0, r8
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	bge _0806FA5E
	cmp r1, r3
	blt _0806FA64
_0806FA4C:
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r1
	blt _0806FA64
_0806FA5E:
	adds r0, r2, #0
	bl Coll_DamagePlayer
_0806FA64:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA74: .4byte 0x000001C1
_0806FA78: .4byte gCamera
_0806FA7C: .4byte gPlayer
_0806FA80: .4byte gPlayerBodyPSI

.syntax divided
