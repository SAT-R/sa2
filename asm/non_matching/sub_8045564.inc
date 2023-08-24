.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0804557A
	b _08045858
_0804557A:
	ldr r1, _08045868 @ =gUnknown_03005590
	ldr r0, [r1]
	movs r1, #7
	bl Mod
	adds r5, r0, #0
	cmp r5, #0
	bne _0804563E
	ldr r2, _0804586C @ =gPseudoRandom
	ldr r0, [r2]
	ldr r3, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r3, r2
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r0, _0804586C @ =gPseudoRandom
	str r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r6, r0, #0
	adds r6, #0x18
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r7, r0, #2
	ldr r4, _08045878 @ =0x000003FF
	adds r0, r4, #0
	ands r7, r0
	mov r0, sb
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r3, _0804587C @ =gCamera
	mov ip, r3
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r4, _08045880 @ =gSineTable
	mov sl, r4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r7, r3
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	lsls r0, r7, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x18]
	mov r0, sp
	strh r5, [r0, #0x1c]
	str r0, [sp, #0x20]
	ldr r3, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	ldr r0, _0804586C @ =gPseudoRandom
	str r1, [r0]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	ldr r1, [sp, #0x20]
	strh r0, [r1, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r5, [r0, #0xa]
	str r5, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl CreateBossParticleWithExplosionUpdate
_0804563E:
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #0xa
	bl Mod
	str r0, [sp, #0x24]
	cmp r0, #0
	bne _0804572E
	ldr r3, _0804586C @ =gPseudoRandom
	mov r8, r3
	ldr r0, [r3]
	ldr r4, _08045870 @ =0x00196225
	muls r0, r4, r0
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	adds r6, r0, #0
	adds r6, #0x18
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r7, r1, #2
	ldr r3, _08045878 @ =0x000003FF
	adds r1, r3, #0
	ands r7, r1
	movs r1, #6
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sb
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r1, _0804587C @ =gCamera
	mov sl, r1
	ldr r1, [r1]
	subs r2, r2, r1
	str r2, [sp, #0x14]
	ldr r3, _08045880 @ =gSineTable
	mov ip, r3
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r7, r4
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	ldrsh r1, [r1, r3]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x14]
	mov r4, sb
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	mov r3, sl
	ldr r1, [r3, #4]
	subs r2, r2, r1
	str r2, [sp, #0x18]
	lsls r1, r7, #1
	add r1, ip
	movs r4, #0
	ldrsh r1, [r1, r4]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x18]
	mov r2, sp
	movs r1, #0x40
	strh r1, [r2, #0x1c]
	mov r1, sp
	str r1, [sp, #0x28]
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _08045870 @ =0x00196225
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	str r1, [r2]
	ldr r2, _08045878 @ =0x000003FF
	ands r1, r2
	ldr r2, [sp, #0x28]
	strh r1, [r2, #0xc]
	mov r2, sp
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r2, #0xe]
	ldr r2, _08045890 @ =gUnknown_080D79D0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08045894 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r4, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r4, #8]
	mov r0, sp
	str r0, [sp, #0x30]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, [sp, #0x30]
	strh r0, [r1, #0xa]
	ldr r2, [sp, #0x24]
	str r2, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_0804572E:
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #9
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _080457C4
	ldr r4, _0804586C @ =gPseudoRandom
	mov sl, r4
	ldr r0, [r4]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc4
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	mov ip, r4
	ldr r0, [r4]
	subs r1, r1, r0
	movs r4, #0xf
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r4, sp
	ldr r0, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r2, _08045874 @ =0x3C6EF35F
	adds r1, r1, r2
	mov r3, sl
	str r1, [r3]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl CreateBossParticleWithExplosionUpdate
_080457C4:
	ldr r4, _08045868 @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xb
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08045858
	ldr r0, _0804586C @ =gPseudoRandom
	mov sl, r0
	ldr r0, [r0]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xcc
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0xf
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r2, r2, r1
	mov r0, sb
	adds r0, #0xd0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	ldr r4, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r4, r1
	ldr r0, _08045874 @ =0x3C6EF35F
	adds r1, r1, r0
	mov r2, sl
	str r1, [r2]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl CreateBossParticleWithExplosionUpdate
_08045858:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045868: .4byte gUnknown_03005590
_0804586C: .4byte gPseudoRandom
_08045870: .4byte 0x00196225
_08045874: .4byte 0x3C6EF35F
_08045878: .4byte 0x000003FF
_0804587C: .4byte gCamera
_08045880: .4byte gSineTable
_08045884: .4byte 0x00000407
_08045888: .4byte 0x06012980
_0804588C: .4byte 0x0000026B
_08045890: .4byte gUnknown_080D79D0
_08045894: .4byte 0x06010000

	
.syntax divided
