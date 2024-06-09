
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	mov sb, r0              @ sb = boss
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]     @ sp20 = arm
	lsls r2, r1, #3
	adds r0, #0x18
	adds r6, r0, r2
	ldr r0, _0804BDE0 @ =gSineTable
	mov ip, r0              @ ip =gSineTable
	lsls r7, r1, #1         @ r7 = arm * 2
	mov r1, sb
	adds r1, #0x2c
	str r1, [sp, #0x24]     @ sp24 = &boss->rotation2
	adds r1, r1, r7
	mov sl, r1              @ sl = &boss->rotation2[arm]
	ldrh r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r0, [r0, r4]      @ r0 = COS(boss->rotation2[arm])
	lsls r1, r0, #5
	subs r1, r1, r0
	asrs r1, r1, #0xa
	ldr r0, [r6]
	subs r0, r0, r1
	str r0, [r6]            @ boss->qUnk18[arm].x -= ((COS(boss->rotation2[arm]) * 31) >> 10)
	mov r0, sb
	adds r0, #0x1c
	adds r5, r0, r2         @ r5 = &boss->qUnk18[arm].y
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #1
	add r0, ip
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r1, r0, #5
	subs r1, r1, r0
	asrs r1, r1, #0xa
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]            @ boss->qUnk18[arm].y -= ((SIN(boss->rotation2[arm]) * 31) >> 10)
	mov r3, sb
	adds r3, #0x28
	str r3, [sp, #0x28]     @ sp28 = &boss->rotation
	adds r3, r3, r7         @ r3 = &boss->rotation[arm]
	mov r4, sb
	adds r4, #0x30
	str r4, [sp, #0x2c]     @ sp2C = &boss->unk30
	adds r2, r4, r7         @ r2 = &boss->unk30[arm]
	ldrh r0, [r2]
	lsls r0, r0, #2
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r4, _0804BDE4 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BCD6
	b _0804BE56
_0804BCD6:
	mov r0, sb              @ r0 = sb = boss
	ldr r4, [r0]            @ r4 = boss->pos.x
	ldr r3, [r6]            @ r3 = boss->qUnk18[arm].x
	ldr r0, _0804BDE8 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]     @ r2 = arm
	lsls r1, r2, #2         @ r1 = arm * 4
	adds r2, r1, r0         @ r2 = &gUnknown_080D8888[arm]
	adds r4, r4, r3         @ r4 += boss->qUnk18[arm].x
	ldrh r2, [r2]
	adds r4, r4, r2         @ r4 = x = boss->pos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0]
	mov r2, sb              @ r2 = boss
	ldr r3, [r2, #4]        @ r3 = boss->pos.y
	ldr r2, [r5]
	adds r0, #2
	adds r1, r1, r0         @ r1 += gUnknown_080D8888[arm][1]
	adds r3, r3, r2         @ r3 += boss->qUnk18[arm].y
	ldrh r1, [r1]
	adds r3, r3, r1         @ r3 = y = boss->pos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1]
	mov r5, sl              @ r5 = sl = &boss->rotation2[arm]
	ldrh r2, [r5]           @ r2 = boss->rotation2[arm]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	add r0, ip
	movs r5, #0
	ldrsh r1, [r0, r5]      @ r1 = COS(boss->rotation2[arm])
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r4, r4, r0         @ r4 = x -= ((COS(boss->rotation2[arm]) * 15) >> 6);
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r3, r3, r0
	movs r1, #0
	mov r8, r1
	str r7, [sp, #0x38]     @ sp38 = arm * 2
	ldr r2, [sp, #0x24]
	str r2, [sp, #0x4c]     @ sp4C = &boss->rotation2
	ldr r5, [sp, #0x28]
	str r5, [sp, #0x48]     @ sp48 = &boss->rotation
	ldr r7, [sp, #0x2c]
	str r7, [sp, #0x50]     @ sp50 = &boss->unk30
	mov r0, sb
	adds r0, #0xc
	str r0, [sp, #0x34]     @ sp34 = &boss->unkC
	mov r1, sb
	adds r1, #0x3c
	str r1, [sp, #0x54]     @ sp54 = &boss->unk3C
	asrs r4, r4, #8
	str r4, [sp, #0x40]     @ sp40 = I(x)
	asrs r3, r3, #8
	str r3, [sp, #0x44]     @ sp44 = I(y)
	mov r2, sl              @ r2 = sl = &boss->rotation2[arm]
	mov r4, sp              @ r4 = sp = info
	movs r3, #0
	mov sl, r3              @ sl = 0
_0804BD52:
	movs r6, #0
	mov r5, r8              @ r5 = r8 = 
	subs r5, #1
	str r5, [sp, #0x60]
	mov r7, r8
	lsls r7, r7, #1
	str r7, [sp, #0x3c]     @ sp3C = 
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x30]
	adds r3, r5, #0
	movs r1, #1
	mov r7, r8
	subs r5, r1, r7
_0804BD6E:
	ldrh r0, [r2]
	ldr r1, _0804BDEC @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r7, _0804BDE4 @ =0x000003FF
	ands r0, r7
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r7, _0804BDE0 @ =gSineTable
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r7, [sp, #0x40]
	subs r0, r7, r0
	str r0, [sp, #0x14]
	ldrh r0, [r2]
	ldr r1, _0804BDEC @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r7, _0804BDE4 @ =0x000003FF
	ands r0, r7
	lsls r0, r0, #1
	ldr r1, _0804BDE0 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x44]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	mov r7, sl
	strh r7, [r4, #0x1c]
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r0, #0
	ldrh r7, [r2]
	adds r1, r1, r7
	ldr r0, [sp, #0x3c]
	add r0, r8
	adds r0, r0, r6
	lsls r0, r0, #5
	subs r1, r1, r0
	ldr r0, _0804BDE4 @ =0x000003FF
	ands r1, r0
	strh r1, [r4, #0xc]
	lsls r0, r6, #7
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r0, r7
	cmp r5, #0
	blt _0804BDF0
	lsls r0, r5, #1
	adds r0, r0, r5
	b _0804BDF6
	.align 2, 0
_0804BDE0: .4byte gSineTable
_0804BDE4: .4byte 0x000003FF
_0804BDE8: .4byte gUnknown_080D8888
_0804BDEC: .4byte 0xFFFFFF00
_0804BDF0:
	ldr r7, [sp, #0x60]
	lsls r0, r7, #1
	adds r0, r0, r7
_0804BDF6:
	lsls r0, r0, #5
	subs r0, r1, r0
	strh r0, [r4, #0xe]
	mov r1, sb
	ldr r0, [r1, #0x44]
	str r0, [sp]
	ldr r0, _0804BE68 @ =0x000002C3
	strh r0, [r4, #8]
	mov r7, sl
	strh r7, [r4, #0xa]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x34]
	str r2, [sp, #0x58]
	str r3, [sp, #0x5c]
	bl CreateBossParticleStatic
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	cmp r6, #2
	bls _0804BD6E
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0804BD52
	ldr r3, [sp, #0x48]
	ldr r4, [sp, #0x38]
	adds r2, r3, r4
	ldr r5, [sp, #0x4c]
	adds r0, r5, r4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2]
	ldr r7, [sp, #0x54]
	ldr r2, [sp, #0x20]
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, [sp, #0x50]
	adds r1, r3, r4
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
_0804BE56:
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE68: .4byte 0x000002C3

.syntax divided
