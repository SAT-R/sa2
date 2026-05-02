.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0          @ r8 = s
	mov sb, r2          @ r2 = y
	adds r7, r3, #0     @ r7 = rectPlayer
	ldr r4, [sp, #0x2c] @ r4 = p
	ldr r0, _0800CA1C @ =gStageFlags
	ldrh r2, [r0]
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18  @ r0 = hbTop = HB_TOP(s->hitboxes[0])
	mov r2, r8
	adds r2, #0x2f
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18  @ r2 hbBottom = HB_BOTTOM(s->hitboxes[0])
	adds r0, r0, r2
	asrs r0, r0, #1
	add r0, sb          @ r0 = y + (hbBottom - hbTop) / 2
	mov sl, r0          @ sl = middleY
	mov r0, r8
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]  @ r3 = HB_LEFT(s->hitboxes[0].b)
	adds r1, r1, r3     @ r1 = x += HB_LEFT(s->hitboxes[0].b)
	ldr r0, [r4]
	asrs r0, r0, #8     @ r0 = I(p->qWorldX)
	movs r5, #0
	ldrsb r5, [r7, r5]  @ r5 = rectPlayer
	adds r2, r0, r5     @ r2 = I(p->qWorldX) + HB_LEFT(rectPlayer)
	cmp r1, r2
	bgt _0800C9A2
	mov r0, r8
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18  @ r0 = HB_RIGHT(s->hitboxes[0].b.right)
	subs r0, r0, r3     @ r0 = HB_WIDTH(s->hitboxes[0].b.right)
	adds r0, r1, r0
	cmp r0, r2
	bge _0800C9B0
	cmp r1, r2
	bge _0800C9A2
	b _0800CBA8_return_0
_0800C9A2:
	movs r0, #2
	ldrsb r0, [r7, r0]  @ r0 = r7+2 = rectPlayer
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C9B0
	b _0800CBA8_return_0
_0800C9B0:
	mov r3, r8
	adds r3, #0x2d
	movs r0, #0
	ldrsb r0, [r3, r0]
	mov ip, r0
	mov r6, sb
	add r6, ip
	ldr r2, [r4, #4]
	asrs r0, r2, #8     @ r0 = I(p->qWorldY)
	movs r1, #1
	ldrsb r1, [r7, r1]
	adds r5, r0, r1
	str r3, [sp, #4]
	cmp r6, r5
	bgt _0800C9E8
	mov r0, r8
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	subs r0, r0, r3
	adds r0, r6, r0
	cmp r0, r5
	bge _0800C9F6
	cmp r6, r5
	bge _0800C9E8
	b _0800CBA8_return_0
_0800C9E8:
	movs r0, #3
	ldrsb r0, [r7, r0]
	subs r0, r0, r1
	adds r0, r5, r0
	cmp r0, r6
	bge _0800C9F6
	b _0800CBA8_return_0
_0800C9F6:
	ldr r0, [sp]
	cmp r0, #0
	bne _0800CA20
	asrs r0, r2, #8
	cmp r0, sl
	ble _0800CA28
	mov r0, r8
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	subs r0, r0, r1
	lsls r0, r0, #8
	ldrb r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	b _0800CB4C
	.align 2, 0
_0800CA1C: .4byte gStageFlags
_0800CA20:
	asrs r0, r2, #8
	cmp r0, sl
	bge _0800CA28
	b _0800CB38
_0800CA28:
	ldr r1, [sp]
	cmp r1, #0
	bne _0800CA3E
	ldr r2, [sp, #4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	add r0, sb
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	b _0800CA50
_0800CA3E:
	mov r0, r8
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
_0800CA50:
	lsls r0, r0, #8
	ldrb r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	ldr r3, _0800CA6C @ =gCamera
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	ldr r1, [r4, #4]
	cmp r1, r0
	bge _0800CA70
_0800CA66:
	str r0, [r4, #4]
	b _0800CBA8_return_0
	.align 2, 0
_0800CA6C: .4byte gCamera
_0800CA70:
	ldr r2, _0800CB34 @ =gCamera
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	cmp r1, r0
	bge _0800CA66
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0800CA86
	b _0800CBA8_return_0
_0800CA86:
	ldrb r0, [r4, #0xf]
	rsbs r0, r0, #0
	strb r0, [r7, #1]
	ldrb r0, [r4, #0xf]
	strb r0, [r7, #3]
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r2, [r4, #0x10]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0800CAAC
	ldrb r0, [r4, #0x14]
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800CAAC
	strh r2, [r4, #0xc]
_0800CAAC:
	ldr r0, [r4, #0x10]
	movs r1, #8
	orrs r0, r1
	str r0, [r4, #0x10]
	ldr r2, [sp, #0x30]
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	adds r0, r4, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r4, #0x10]
	adds r3, r0, #0
	cmp r2, #2
	bne _0800CADC
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800CB00
	cmp r0, #3
	beq _0800CB00
_0800CADC:
	cmp r2, #3
	bne _0800CAF8
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _0800CAF8
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800CB00
_0800CAF8:
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x10]
_0800CB00:
	mov r0, r8
	str r0, [r4, #0x28]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _0800CB9A_return_1
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	bne _0800CB24
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800CB2E
	cmp r0, #3
	beq _0800CB2E
_0800CB24:
	adds r0, r4, #0
	bl sa2__sub_8021BE0
	ldrh r0, [r4, #8]
	strh r0, [r4, #0xc]
_0800CB2E:
	movs r0, #0
	strb r0, [r4, #0x14]
	b _0800CB9A_return_1
	.align 2, 0
_0800CB34: .4byte gCamera
_0800CB38:
	ldr r3, [sp, #4]
	movs r0, #0
	ldrsb r0, [r3, r0]
	add r0, sb
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, _0800CBA0 @ =0xFFFFFF00
	bics r2, r1
	adds r0, r2, r0
	str r0, [r4, #4]
_0800CB4C:
	ldr r1, _0800CBA4 @ =gCamera
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r1, [r4, #4]
	cmp r1, r0
	bge _0800CB5C
	b _0800CA66
_0800CB5C:
	ldr r3, _0800CBA4 @ =gCamera
	movs r2, #0x16
	ldrsh r0, [r3, r2]
	lsls r0, r0, #8
	cmp r1, r0
	blt _0800CB6A
	b _0800CA66
_0800CB6A:
	ldr r3, [sp, #0x30]
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r3]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0800CBA8_return_0
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r2, [r4, #0x10]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0800CB9A_return_1
	ldrb r0, [r4, #0x14]
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800CB9A_return_1
	strh r2, [r4, #0xc]
_0800CB9A_return_1:
	movs r0, #1
	b _0800CBAA
	.align 2, 0
_0800CBA0: .4byte 0xFFFFFF00
_0800CBA4: .4byte gCamera
_0800CBA8_return_0:
	movs r0, #0
_0800CBAA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
