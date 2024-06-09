
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2              @ ip = arm
	adds r0, #0x42
	adds r3, r0, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _0804C260
	b _0804C37C
_0804C260:
	lsls r7, r2, #3         @ r7 = arm * 8
	adds r0, r4, #0
	adds r0, #0x1c
	adds r6, r0, r7         @ r6 = boss->qUnk18[arm].y
	ldr r1, [r4, #4]
	ldr r0, [r6]
	adds r1, r1, r0         @ r1 = boss->pos.y + boss->qUnk18[arm].y
	ldr r0, _0804C290 @ =gUnknown_080D8888
	mov sb, r0              @ sb = gUnknown_080D8888
	lsls r5, r2, #2         @ r5 = arm * 4
	adds r0, #2
	adds r0, r5, r0
	ldrh r0, [r0]           @ r0 = gUnknown_080D8888[arm][1]
	mov r8, r0              @ r8 = r0
	add r1, r8
	asrs r1, r1, #8
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	ble _0804C294
	movs r0, #1
	strb r0, [r3]
	b _0804C37C
	.align 2, 0
_0804C290: .4byte gUnknown_080D8888
_0804C294:
	mov r1, ip              @ r1 = ip = arm
	lsls r0, r1, #1
	adds r2, r4, #0
	adds r2, #0x28
	adds r2, r2, r0         @ r2 = &boss->rotation[arm]
	movs r3, #0xc8
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r1, [r2]
	adds r0, r0, r1
	adds r3, #0xdf
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	adds r3, r0, r5
	ldrh r0, [r3]
	adds r0, #0x20
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x18
	adds r2, r0, r7         @ r2 = &boss->qUnk18[arm]
	adds r0, #0x1c
	adds r0, r0, r5
	mov ip, r0
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [sp, #0x20]     @ r0 = boss->qUnk18[arm].y
	str r0, [r6]
	ldr r1, _0804C38C @ =gStageTime
	mov sl, r1              @ sl = gStageTime
	ldr r6, [r1]
	movs r0, #3
	ands r6, r0
	cmp r6, #0
	bne _0804C37C
	ldr r1, [r4]            @ r1 = *r4 = boss->pos.x
	ldr r0, [r2]            @ r0 = *r2 = boss->qUnk18[arm]
	mov r7, sb              @ r7 = sb = gUnknown_080D8888
	adds r2, r5, r7         @ r2 = gUnknown_080D8888[arm][0]
	adds r1, r1, r0         @ r1 += boss->qUnk18[arm]
	ldrh r2, [r2]
	adds r1, r1, r2         @ r1 = boss->pos.x + boss->qUnk18[arm] + gUnknown_080D8888[arm][0]
	ldr r0, [r4, #4]        @ r0 = boss->pos.y
	ldr r2, [sp, #0x20]     @ r2 = boss->qUnk18[arm].y
	adds r0, r0, r2
	add r0, r8
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	rsbs r0, r0, #0
	mov r3, ip
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	rsbs r1, r1, #0
	bl sub_8004418
	mov r1, sp
	strh r0, [r1, #0xc]
	mov r3, sp
	ldr r2, _0804C390 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804C394 @ =0x00196225
	muls r0, r1, r0
	ldr r5, _0804C398 @ =0x3C6EF35F
	adds r0, r0, r5
	str r0, [r2]
	mov r2, sp
	movs r1, #0x1f
	ands r0, r1
	ldrh r2, [r2, #0xc]
	adds r0, r0, r2
	subs r0, #0x10
	ldr r1, _0804C39C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	ldr r2, _0804C3A0 @ =gSineTable
	mov r7, sl              @ r7 = sl = &gStageTime
	ldr r0, [r7]
	lsls r0, r0, #4
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r1, #0xff
	adds r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0804C3A4 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _0804C3A8 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r1, #0xc
	bl CreateBossParticleStatic
_0804C37C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C38C: .4byte gStageTime
_0804C390: .4byte gPseudoRandom
_0804C394: .4byte 0x00196225
_0804C398: .4byte 0x3C6EF35F
_0804C39C: .4byte 0x000003FF
_0804C3A0: .4byte gSineTable
_0804C3A4: .4byte 0x06012980
_0804C3A8: .4byte 0x0000026B

.syntax divided
