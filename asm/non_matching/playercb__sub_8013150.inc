
.syntax unified
.text
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r0, #0xad
	ldrb r2, [r0]
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x1f
	ands r0, r1
	str r0, [r3, #0x20]
	lsls r4, r2, #0x18
	asrs r1, r4, #0x18
	movs r5, #0x7f
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _0801318C
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0x5c
	strh r1, [r0]
	lsrs r0, r4, #0x18
	cmp r0, #0x80
	bne _080131A8
	ldr r0, [r3, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r3, #0x20]
	b _080131A8
_0801318C:
	cmp r1, #0
	bge _08013196
	rsbs r0, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013196:
	ldr r1, _080131B0 @ =gUnknown_080D5538
	ands r2, r5
	lsrs r0, r2, #5
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r3, #0
	adds r0, #0x64
	strh r1, [r0]
_080131A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080131B0: .4byte gUnknown_080D5538

.syntax divided
