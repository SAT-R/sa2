.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r1              @ sl = param1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18      @ r7 = bg
	add r6, sp, #4          @ r6 = sp04
	ldr r1, _080072A8 @ =gUnknown_080984F4
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	add r5, sp, #0xc
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl memset
	add r4, sp, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	ldr r1, _080072AC @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	mov r8, r6              @ r8 = r6 = sp08
	cmp r7, #1
	bls _080072C4
	ldr r1, _080072B0 @ =gHBlankCopySize
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _080072B8
	ldr r0, _080072B4 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r5, r0, #2
	b _080072EC
	.align 2, 0
_080072A8: .4byte gUnknown_080984F4
_080072AC: .4byte gFlags
_080072B0: .4byte gHBlankCopySize
_080072B4: .4byte gBgOffsetsHBlank
_080072B8:
	ldr r0, _080072C0 @ =gBgOffsetsHBlank
	ldr r5, [r0]
	b _080072EC
	.align 2, 0
_080072C0: .4byte gBgOffsetsHBlank
_080072C4:
	ldr r1, _080072DC @ =gHBlankCopySize
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080072E0 @ =gBgOffsetsHBlank
	ldr r5, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _080072EC
	ldr r1, _080072E4 @ =gHBlankCopyTarget
	ldr r0, _080072E8 @ =0x04000042
	b _080072F0
	.align 2, 0
_080072DC: .4byte gHBlankCopySize
_080072E0: .4byte gBgOffsetsHBlank
_080072E4: .4byte gHBlankCopyTarget
_080072E8: .4byte 0x04000042
_080072EC:
	ldr r1, _08007400 @ =gHBlankCopyTarget
	ldr r0, _08007404 @ =0x04000040
_080072F0:
	str r0, [r1]
	mov r1, sl          @ r1 = sl = param1
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #1]
	adds r7, r2, #0
	adds r1, r0, #0
	cmp r0, r7
	bls _08007302
	adds r0, r2, #0
_08007302:
	adds r4, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp sb, r7
	bhs _08007310
	adds r1, r2, #0
_08007310:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]     
	ldr r2, _08007408 @ =gHBlankCopySize
	ldrb r0, [r2]
	muls r0, r4, r0
	adds r5, r5, r0
	mov r2, sp
	mov r3, sl          @ r3 = sl = param1
	ldrb r0, [r3, #2]
	ldrb r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	mov r3, r8          @ r3 = r8 = &sp[1]
	mov r6, sl          @ r6 = sl = param1
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #1]
	subs r0, r0, r1
	strh r0, [r3]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08007342
	rsbs r0, r0, #0
_08007342:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xc]
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r0, #0
	bge _08007352
	rsbs r0, r0, #0
_08007352:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x10]
	mov r2, sp
	mov r6, sl          @ r6 = sl = param1
	ldrb r0, [r6, #6]
	ldrb r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrb r0, [r6, #7]
	ldrb r1, [r6, #5]
	subs r0, r0, r1
	strh r0, [r3, #2]
	mov r0, sp
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08007378
	rsbs r0, r0, #0
_08007378:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xe]
	movs r6, #2
	ldrsh r0, [r3, r6]
	cmp r0, #0
	bge _08007388
	rsbs r0, r0, #0
_08007388:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x12]
	add r2, sp, #0x14
	mov r3, sl          @ r3 = sl = param1
	ldrb r0, [r3]
	strb r0, [r2]
	ldrb r0, [r3, #4]
	strb r0, [r2, #1]
	add r1, sp, #8
	mov r6, r8
	ldrh r0, [r6]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	mov r8, r2          @ r8 = sp14
	mov ip, r1          @ ip = r1 = sp08
	ldr r0, [sp, #0x18]
	cmp r4, r0
	bne _080073B6
	b _080074C8
_080073B6:
	cmp r7, sb
	bhs _08007448
	cmp r4, r0
	blo _080073C0
	b _080074C8
_080073C0:
	movs r0, #0xf0
	strb r0, [r5]
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r5, #1]
	add r2, sp, #8
	mov r3, sp
	ldrh r0, [r3, #0xc]
	ldrh r6, [r2]
	adds r0, r0, r6
	strh r0, [r2]
	lsls r0, r0, #0x10
	adds r4, #1
	mov sb, r4
	cmp r0, #0
	blt _08007430
	mov r3, r8
	add r4, sp, #0x10
	mov r6, ip          @ r6 = ip = sp08
_080073E6:
	mov r0, sp
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #0
	ble _0800740C
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	b _08007426
	.align 2, 0
_08007400: .4byte gHBlankCopyTarget
_08007404: .4byte 0x04000040
_08007408: .4byte gHBlankCopySize
_0800740C:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrh r0, [r6]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007426
	mov r1, r8          @ r1 = r8 = sp14
	ldrb r0, [r1]
	strb r0, [r5, #1]
_08007426:
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0
	bge _080073E6
_08007430:
	ldr r1, _08007444 @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r5, r5, r0
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x18]
	cmp r4, r3
	blo _080073C0
	b _080074C8
	.align 2, 0
_08007444: .4byte gHBlankCopySize
_08007448:
	ldr r6, [sp, #0x18]
	cmp r4, r6
	bhs _080074C8
	mov r7, ip          @ r7 = ip = sp08
_08007450:
	mov r1, r8
	ldrb r0, [r1, #1]
	strb r0, [r5]
	movs r0, #0
	strb r0, [r5, #1]
	adds r2, r7, #0
	ldrh r1, [r2, #2]
	mov r3, sp
	ldrh r0, [r3, #0xe]
	adds r1, r1, r0
	strh r1, [r2, #2]
	lsls r1, r1, #0x10
	adds r4, #1
	mov sb, r4
	cmp r1, #0
	blt _080074B6
	mov r3, r8
	add r4, sp, #0x10
	mov r6, ip
_08007476:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800749E
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080074AC
	mov r1, r8
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r5]
	b _080074AC
_0800749E:
	ldrb r0, [r3, #1]
	subs r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r6, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r6, #2]
_080074AC:
	mov r2, ip
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08007476
_080074B6:
	ldr r2, _0800752C @ =gHBlankCopySize
	ldrb r0, [r2]
	adds r5, r5, r0
	mov r3, sb
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r6, [sp, #0x18]
	cmp r4, r6
	blo _08007450
_080074C8:
	mov r7, sl          @ r7 = sl = param1
	ldrb r0, [r7, #7]
	ldrb r1, [r7, #3]
	cmp r0, r1
	bls _080074D4
	adds r0, r1, #0
_080074D4:
	str r0, [sp, #0x18]
	cmp r4, r0
	bhs _080075BA
	mov r7, ip          @ r7 = ip = sp08
	add r0, sp, #0xc
	mov sl, r0          @ sl = sp0C
_080074E0:
	mov r1, r8          @ r1 = r8 = sp14
	ldrb r0, [r1, #1]
	strb r0, [r5]
	ldrb r0, [r1]
	strb r0, [r5, #1]
	adds r3, r7, #0     @ r3 = r7 = sp08
	mov r6, sl          @ r6 = sl = sp0C
	ldrh r2, [r6]
	ldrh r0, [r7]
	adds r2, r2, r0
	strh r2, [r7]
	ldrh r0, [r7, #2]
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r7, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sb, r4
	cmp r2, #0
	blt _08007558
	mov r2, r8          @ r2 = r8 = sp14
	add r4, sp, #0x10   @ r4 = sp10
	mov r1, ip          @ r1 = ip = sp08
	str r1, [sp, #0x1c]
_08007510:
	mov r0, sp
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	ble _08007530
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _0800754E
	.align 2, 0
_0800752C: .4byte gHBlankCopySize
_08007530:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	ldrh r1, [r4]
	subs r0, r0, r1
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800754E
	mov r6, r8
	ldrb r0, [r6]
	strb r0, [r5, #1]
_0800754E:
	mov r3, ip
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08007510
_08007558:
	adds r2, r7, #0     @ r2 = r7 = sp08
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080075A8
	mov r3, r8          @ r3 = r8 = sp14
	add r4, sp, #0x10   @ r4 = sp10
	mov r6, ip          @ r6 = ip = sp08
_08007568:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08007590
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800759E
	mov r2, r8
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r5]
	b _0800759E
_08007590:
	ldrb r0, [r3, #1]
	subs r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r6, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r6, #2]
_0800759E:
	mov r2, ip
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08007568
_080075A8:
	ldr r3, _080075CC @ =gHBlankCopySize
	ldrb r0, [r3]
	adds r5, r5, r0
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x18]
	cmp r4, r0
	blo _080074E0
_080075BA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080075CC: .4byte gHBlankCopySize

.syntax divided
