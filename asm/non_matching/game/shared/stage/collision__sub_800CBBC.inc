.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0     @ r6 = s
	mov sb, r1          @ sb = x
	mov sl, r2          @ sl = y
	adds r7, r3, #0     @ r7 = rectPlayer
	ldr r4, [sp, #0x3c] @ r4 = p
	ldr r0, [sp, #0x40]
	mov r8, r0          @ r8 = param6
	adds r0, r6, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]  @ r5 = shbLeft = s->hitboxes[0].b.left
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0          @ ip = shbRight = s->hitboxes[0].b.right
	adds r0, r5, r0
	asrs r0, r0, #1
	add r0, sb
	str r0, [sp, #8]    @ sp08 = shbMiddleH
	ldrb r0, [r4, #0x14]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CC04
	b _0800CE20_return_FALSE
_0800CC04:
	mov r1, sb          @ r1 = x
	adds r3, r1, r5     @ r3 = x + shbLeft
	ldr r0, [r4]
	asrs r1, r0, #8
	movs r2, #0
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	str r0, [sp, #0x10] @ sp10 = p->x
	str r2, [sp, #0xc]  @ sp0C = rectPlayer.left
	cmp r3, r1
	bgt _0800CC2A       @ (x + shbLeft) > (I(p->x) + rectPlayer->left))
	mov r2, ip          @ r2 = ip = shbRight
	subs r0, r2, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800CC3A
	cmp r3, r1
	bge _0800CC2A
	b _0800CE20_return_FALSE
_0800CC2A:
	movs r0, #2
	ldrsb r0, [r7, r0]
	ldr r5, [sp, #0xc]
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	bge _0800CC3A
	b _0800CE20_return_FALSE
_0800CC3A:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x14]
	adds r2, r0, #0
	add r2, sl
	ldr r1, [r4, #4]
	asrs r0, r1, #8
	movs r3, #1
	ldrsb r3, [r7, r3]
	mov ip, r3
	adds r3, r0, r3
	mov sl, r1
	cmp r2, r3
	bgt _0800CC76
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r5, [sp, #0x14]
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800CC86
	cmp r2, r3
	bge _0800CC76
	b _0800CE20_return_FALSE
_0800CC76:
	movs r0, #3
	ldrsb r0, [r7, r0]
	mov r1, ip
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	bge _0800CC86
	b _0800CE20_return_FALSE
_0800CC86:
	ldr r2, [sp, #0x10]
	asrs r0, r2, #8
	ldr r3, [sp, #8]
	cmp r0, r3
	bgt _0800CD58
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	movs r1, #2
	ldrsb r1, [r7, r1]
	subs r5, r0, r1
	mov r0, sl
	asrs r1, r0, #8
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r2, [r0]
	movs r3, #8
	rsbs r3, r3, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0800CCC8 @ =sa2__sub_801ED24
	str r0, [sp, #4]
	adds r0, r5, #0
	bl sa2__sub_801E4E4
	cmp r0, #0
	blt _0800CCCC
	lsls r0, r5, #8
	b _0800CCE2
	.align 2, 0
_0800CCC8: .4byte sa2__sub_801ED24
_0800CCCC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	movs r1, #0
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #8
_0800CCE2:
	str r0, [r4]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0800CCEE
	b _0800CE20_return_FALSE
_0800CCEE:
	mov r2, r8
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xa
	orrs r0, r1
	str r0, [r2]
	ldr r2, [r4, #0x10]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0800CDD0
	adds r0, r4, #0
	adds r0, #0x3e
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #0
	bne _0800CDD0
	movs r5, #8
	ldrsh r0, [r4, r5]
	cmp r0, #0
	ble _0800CDD4
	movs r1, #0x20
	orrs r2, r1
	str r2, [r4, #0x10]
	mov r2, r8
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	subs r1, #0x25
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	adds r1, #3
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	strh r3, [r4, #0xc]
	strh r3, [r4, #8]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	b _0800CDD4
_0800CD58:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	ldr r3, [sp, #0xc]
	subs r0, r0, r3
	adds r5, r0, #1
	mov r0, sl
	asrs r1, r0, #8
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r2, [r0]
	movs r0, #0
	str r0, [sp]
	ldr r0, _0800CD8C @ =sa2__sub_801ED24
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #8
	bl sa2__sub_801E4E4
	cmp r0, #0
	blt _0800CD90
	lsls r0, r5, #8
	b _0800CDA4
	.align 2, 0
_0800CD8C: .4byte sa2__sub_801ED24
_0800CD90:
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	movs r1, #2
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
_0800CDA4:
	str r0, [r4]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0800CE20_return_FALSE
	mov r2, r8
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r2]
	ldr r2, [r4, #0x10]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0800CDD0
	adds r0, r4, #0
	adds r0, #0x3e
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #0
	beq _0800CDD8
_0800CDD0:
	movs r0, #0
	strh r0, [r4, #8]
_0800CDD4:
	movs r0, #1
	b _0800CE22
_0800CDD8:
	movs r5, #8
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _0800CDD4
	movs r1, #0x20
	orrs r2, r1
	str r2, [r4, #0x10]
	mov r2, r8
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	subs r1, #0x25
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	strh r3, [r4, #0xc]
	strh r3, [r4, #8]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	b _0800CDD4
_0800CE20_return_FALSE:
	movs r0, #0
_0800CE22:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
