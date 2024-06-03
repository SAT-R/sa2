.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 01
	thumb_func_start sub_804BC44
sub_804BC44: @ 0x0804BC44
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
.endif

	thumb_func_start sub_804BE6C
sub_804BE6C: @ 0x0804BE6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r3, r0, r2
	ldr r0, _0804BFCC @ =gSineTable
	mov sb, r0
	lsls r7, r1, #1
	mov r0, r8
	adds r0, #0x28
	adds r6, r0, r7
	ldrh r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #9
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r0, r8
	adds r0, #0x1c
	adds r5, r0, r2
	ldrh r0, [r6]
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #9
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]
	movs r2, #0x30
	add r2, r8
	mov sl, r2
	adds r4, r2, r7
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BEE0
	b _0804C034
_0804BEE0:
	mov r0, r8
	ldr r4, [r0]
	ldr r3, [r3]
	ldr r0, _0804BFD0 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	mov r2, r8
	ldr r3, [r2, #4]
	ldr r2, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r3, r3, r2
	ldrh r1, [r1]
	adds r3, r3, r1
	ldrh r2, [r6]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r4, r4, r0
	lsls r2, r2, #1
	add r2, sb
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r3, r3, r0
	movs r0, #0
	str r7, [sp, #0x30]
	mov r1, sl
	str r1, [sp, #0x3c]
	mov r2, r8
	adds r2, #0xc
	str r2, [sp, #0x2c]
	mov r5, r8
	adds r5, #0x3c
	str r5, [sp, #0x40]
	asrs r4, r4, #8
	str r4, [sp, #0x34]
	asrs r3, r3, #8
	str r3, [sp, #0x38]
	adds r7, r6, #0
	ldr r1, _0804BFD4 @ =0x000003FF
	mov sl, r1
	mov r4, sp
_0804BF50:
	movs r6, #0
	subs r2, r0, #1
	mov sb, r2
	adds r5, r0, #1
	str r5, [sp, #0x28]
	movs r1, #1
	subs r3, r1, r0
	lsls r5, r3, #5
	str r5, [sp, #0x24]
_0804BF62:
	ldrh r0, [r7]
	ldr r1, _0804BFD8 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r5, _0804BFCC @ =gSineTable
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xb
	ldr r5, [sp, #0x34]
	subs r0, r5, r0
	str r0, [sp, #0x14]
	ldrh r0, [r7]
	ldr r1, _0804BFD8 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	lsls r0, r0, #1
	ldr r1, _0804BFCC @ =gSineTable
	adds r0, r0, r1
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r2, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x38]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	movs r0, #0x12
	strh r0, [r4, #0x1c]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ldrh r1, [r7]
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	strh r0, [r4, #0xc]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #5
	adds r1, r0, #0
	adds r1, #0x80
	cmp r3, #0
	blt _0804BFDC
	ldr r5, [sp, #0x24]
	subs r0, r1, r5
	b _0804BFE2
	.align 2, 0
_0804BFCC: .4byte gSineTable
_0804BFD0: .4byte gUnknown_080D8888
_0804BFD4: .4byte 0x000003FF
_0804BFD8: .4byte 0xFFFFFF00
_0804BFDC:
	mov r5, sb
	lsls r0, r5, #5
	subs r0, r1, r0
_0804BFE2:
	movs r5, #0
	strh r0, [r4, #0xe]
	mov r1, r8
	ldr r0, [r1, #0x44]
	str r0, [sp]
	ldr r0, _0804C030 @ =0x000002C3
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	str r5, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x2c]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	bl CreateBossParticleStatic
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x48]
	cmp r6, #2
	bls _0804BF62
	ldr r2, [sp, #0x28]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0804BF50
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	strb r5, [r0]
	ldr r5, [sp, #0x3c]
	ldr r0, [sp, #0x30]
	adds r1, r5, r0
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
	b _0804C06C
	.align 2, 0
_0804C030: .4byte 0x000002C3
_0804C034:
	mov r0, r8
	ldr r1, [sp, #0x20]
	bl sub_804B2EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C06C
	ldr r1, [sp, #0x20]
	lsls r2, r1, #2
	mov r0, r8
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804C07C @ =0x0000FE80
	strh r1, [r0]
	mov r0, r8
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	mov r0, r8
	adds r0, #0x3c
	ldr r2, [sp, #0x20]
	adds r0, r0, r2
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	strh r0, [r4]
_0804C06C:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C07C: .4byte 0x0000FE80

	thumb_func_start sub_804C080
sub_804C080: @ 0x0804C080
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	ldr r0, _0804C20C @ =gStageTime
	mov sb, r0
	ldr r7, [r0]
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0804C116
	ldr r1, _0804C210 @ =gPseudoRandom
	mov r8, r1
	ldr r0, [r1]
	ldr r5, _0804C214 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0804C218 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r6, _0804C21C @ =gCamera
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x12
	strh r0, [r1, #0x1c]
	mov r3, sp
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	ldr r0, _0804C220 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r2, sp
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r4
	mov r3, r8
	str r0, [r3]
	ldr r1, _0804C224 @ =0x000001FF
	ands r0, r1
	adds r1, #1
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _0804C228 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _0804C22C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0xc
	bl CreateBossParticleStatic
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r0, _0804C230 @ =gMPlayInfo_SE3
	bl m4aMPlayImmInit
_0804C116:
	ldr r0, _0804C230 @ =gMPlayInfo_SE3
	ldr r1, _0804C234 @ =0x0000FFFF
	mov r3, sl
	ldrh r2, [r3, #0x14]
	bl m4aMPlayVolumeControl
	mov r0, sl
	ldr r2, [r0, #0x14]
	cmp r2, #0
	beq _0804C13C
	mov r1, sb
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C13C
	subs r0, r2, #1
	mov r3, sl
	str r0, [r3, #0x14]
_0804C13C:
	ldr r0, _0804C20C @ =gStageTime
	ldr r0, [r0]
	adds r7, r0, #3
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0804C1FC
	ldr r0, _0804C210 @ =gPseudoRandom
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0804C214 @ =0x00196225
	mov r8, r1
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	ldr r6, _0804C218 @ =0x3C6EF35F
	adds r0, r0, r6
	mov r1, sb
	str r0, [r1]
	lsls r0, r0, #0x18
	movs r4, #0xf0
	lsls r4, r4, #0x14
	ands r4, r0
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r4, r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r3, sb
	ldr r0, [r3]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r6
	ldr r5, _0804C21C @ =gCamera
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, r8
	muls r0, r2, r0
	adds r2, r0, #0
	adds r2, r2, r6
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x20
	strh r0, [r1, #0x1c]
	mov r3, sp
	mov r0, r8
	muls r0, r2, r0
	adds r0, r0, r6
	mov r1, sb
	str r0, [r1]
	ldr r1, _0804C220 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	ldr r2, _0804C238 @ =gTileInfoBossScrews
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0804C23C @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0xc
	mov r0, sp
	bl CreateBossParticleStatic
_0804C1FC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C20C: .4byte gStageTime
_0804C210: .4byte gPseudoRandom
_0804C214: .4byte 0x00196225
_0804C218: .4byte 0x3C6EF35F
_0804C21C: .4byte gCamera
_0804C220: .4byte 0x000003FF
_0804C224: .4byte 0x000001FF
_0804C228: .4byte 0x06012980
_0804C22C: .4byte 0x0000026B
_0804C230: .4byte gMPlayInfo_SE3
_0804C234: .4byte 0x0000FFFF
_0804C238: .4byte gTileInfoBossScrews
_0804C23C: .4byte 0x06010000

.if 01
	thumb_func_start sub_804C240
sub_804C240: @ 0x0804C240
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
.endif
