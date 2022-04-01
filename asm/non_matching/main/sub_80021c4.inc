	.syntax unified

	.text
	push {r4, r5, r6, r7, lr}
	ldr r2, _08002210 @ =gUnknown_03004D5C
	ldr r0, _08002214 @ =gUnknown_03002A84
	ldrb r1, [r2]
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r1, r0
	beq _08002272
	ldr r1, _08002218 @ =gUnknown_030027A0
	mov ip, r1
	adds r6, r2, #0
_080021DA:
	ldrb r0, [r6]
	lsls r0, r0, #2
	add r0, ip
	ldr r2, [r0]
	ldrh r0, [r2, #8]
	cmp r0, #0
	beq _0800224E
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #3
	ldr r3, _0800221C @ =0x040000D4
_080021F0:
	cmp r0, r5
	bls _08002228
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldr r0, _08002220 @ =0x80000200
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _08002224 @ =0xFFFFFC00
	adds r0, r1, #0
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	b _08002244
	.align 2, 0
_08002210: .4byte gUnknown_03004D5C
_08002214: .4byte gUnknown_03002A84
_08002218: .4byte gUnknown_030027A0
_0800221C: .4byte 0x040000D4
_08002220: .4byte 0x80000200
_08002224: .4byte 0xFFFFFC00
_08002228:
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldrh r0, [r2, #8]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r0, #0
_08002244:
	strh r0, [r2, #8]
	adds r4, r4, r5
	ldrh r0, [r2, #8]
	cmp r0, #0
	bne _080021F0
_0800224E:
	ldrb r0, [r6]
	adds r2, r0, #1
	movs r0, #0x1f
	ands r2, r0
	strb r2, [r6]
	ldr r0, _08002268 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800226C
	movs r0, #0
	b _08002274
	.align 2, 0
_08002268: .4byte 0x04000004
_0800226C:
	ldrb r0, [r7]
	cmp r2, r0
	bne _080021DA
_08002272:
	movs r0, #1
_08002274:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	.syntax divided
