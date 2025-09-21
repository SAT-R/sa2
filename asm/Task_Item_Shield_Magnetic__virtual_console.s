.syntax unified
.text
    push {r4, r5, r6, r7, lr}
	ldr r0, _0802ABA4 @ =0x030026F0
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r3, r4, #0
	adds r3, #0x30
	adds r0, r1, r3
	ldrb r6, [r0]
	orrs r4, r1
	ldr r5, _0802ABA8 @ =0x03005960
	ldr r0, _0802ABAC @ =0x030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AB7C
	adds r3, r5, #0
	adds r3, #0x80
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #8
	beq _0802AB3E
	adds r0, r2, #0
	bl TaskDestroy
	b _0802ABC2
_0802AB3E:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ABC2
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r5]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802ABB0 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
_0802AB7C:
	ldr r0, _0802ABB4 @ =0x03005590
	ldr r0, [r0]
	movs r1, #6
	bl Mod
	adds r7, r0, #0
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	lsls r0, r6, #0x18
	asrs r2, r0, #0x18
	movs r3, #1
	ands r2, r3
	movs r0, #6
	ands r0, r7
	cmp r0, #0
	bne _0802ABB8
	cmp r2, r3
	bne _0802ABBC
	b _0802ABC2
	.align 2, 0
_0802ABA4: .4byte 0x030026F0
_0802ABA8: .4byte 0x03005960
_0802ABAC: .4byte 0x030054CC
_0802ABB0: .4byte 0xFFFFCFFF
_0802ABB4: .4byte 0x03005590
_0802ABB8:
	cmp r2, #0
	beq _0802ABC2
_0802ABBC:
	adds r0, r4, #0
	bl DisplaySprite
_0802ABC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
