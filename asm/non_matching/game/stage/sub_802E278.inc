.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r3, #0
	cmp r3, r5
	bge _0802E2B6
	mov r6, sp
	adds r6, #2
_0802E294:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2     @ r2 = i*4
	mov r0, sp
	adds r4, r0, r2     @ r4 = &sp[i+0]
	adds r3, r7, r2     @ r3 = &p0[i]
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2     
	ldrh r0, [r3, #2]
	strh r0, [r2]       @ r2 = &sp[i+1]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E294
_0802E2B6:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge sub_802E278_return
	movs r1, #2
	add r1, sp
	mov sl, r1          @ sl = &sp[][1]
_0802E2C6:
	ldr r0, _0802E310 @ =gBgOffsetsHBlank
	ldr r5, [r0]        @ r5 = bgOffsets
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl          @ r3 = sl = sp[][1]
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]  @ r3 = yVal
	lsls r0, r3, #1
	adds r5, r5, r0     @ r5 = &bgOffsets[yVal];
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]  @ r2 = xVal
	lsls r6, r2, #8     @ r6 = xVal2 = xVal << 8;
	adds r1, #1
	lsls r1, r1, #2     @ r1 = (i+1) * 4
	mov r7, sl          @ r7 = sl = sp[][1]
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0     @ r3 = yVal -= sp[i+1][1];
	mov r8, r4          @ r8 = r4 = i << 16
	cmp r3, #0
	beq _0802E314
	mov r4, sp
	adds r0, r4, r1     @ r0 = sp[i+1][0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0     @ r4 = Div(Q_24_8(xVal - sp[i+1][0]), yVal);
	b _0802E320
	.align 2, 0
_0802E310: .4byte gBgOffsetsHBlank
_0802E314:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8     @ r4 = Q_24_8(xVal - sp[i+1][0]);
_0802E320:
	mov r7, r8          @ r7 = r8 = i << 16
	asrs r0, r7, #0x10  @ r0 = i
	lsls r1, r0, #2
	add r1, sl          @ r1 = sp[i][1]
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl          @ r3 = sp[i+1][1]
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E366
_0802E340:
	asrs r0, r6, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	ble _0802E34C
	movs r0, #0xf0
_0802E34C:
	strb r0, [r5]
	adds r5, #2
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E340
_0802E366:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E2C6
sub_802E278_return:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
