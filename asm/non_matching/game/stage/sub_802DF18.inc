.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DF64 @ =gBgOffsetsHBlank
	ldr r4, [r0]
	movs r7, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DF68 @ =0xFFFFFEFF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DF38
	b _0802E03A
_0802DF38:
	ldr r3, _0802DF6C @ =0xFFFFFE00
	adds r0, r6, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DF70
	movs r1, #0
	cmp r1, r5
	bge _0802E03A
	movs r2, #0xf0
_0802DF4C:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DF4C
	b _0802E03A
	.align 2, 0
_0802DF64: .4byte gBgOffsetsHBlank
_0802DF68: .4byte 0xFFFFFEFF
_0802DF6C: .4byte 0xFFFFFE00
_0802DF70:
	ldr r2, _0802DFAC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DF98
	rsbs r3, r3, #0
_0802DF98:
	cmp r1, #0
	bge _0802DF9E
	rsbs r1, r1, #0
_0802DF9E:
	cmp r3, #0
	beq _0802DFB0
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DFB2
	.align 2, 0
_0802DFAC: .4byte gSineTable
_0802DFB0:
	mov r3, ip
_0802DFB2:
	ldr r0, _0802E004 @ =0x000001FF
	cmp r6, r0
	bhi _0802E008
	movs r1, #0
	cmp r1, r5
	bge _0802DFD6
	movs r2, #0xf0
_0802DFC0:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DFC0
_0802DFD6:
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802E03A
	movs r2, #0xf0
_0802DFDE:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bhi _0802E03A
	adds r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DFDE
	b _0802E03A
	.align 2, 0
_0802E004: .4byte 0x000001FF
_0802E008:
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802E03A
	movs r2, #0xf0
_0802E016:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802E028
	movs r3, #0
	movs r7, #0xf0
	lsls r7, r7, #8
	movs r0, #0xf0
_0802E028:
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802E040 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802E016
_0802E03A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E040: .4byte 0xFFFF0000

.syntax divided
