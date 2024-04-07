.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sb, r0              @ sb = totem
	movs r3, #0
	mov r5, sb
	adds r5, #0xc           @ r5 = totem->qDiscPos
	mov r4, sb
	adds r4, #0x24          @ r4 = totem->unk24
_0803FC2C:
	lsls r1, r3, #3
	adds r1, r5, r1
	lsls r0, r3, #2
	adds r0, r4, r0
	movs r6, #0
	ldrsh r2, [r0, r6]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0803FC2C
	movs r0, #0x9c
	add r0, sb
	mov sl, r0              @ sl = totem->unk9C
	mov r0, sb
	adds r0, #0xa4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	mov r6, sb
	adds r6, #0x90          @ r6 = totem->qUnk90
	mov r0, sb
	adds r0, #0x98
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldr r3, _0803FDCC @ =gStageTime
	ldr r0, [r3]
	movs r1, #0xe
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0803FD04
	ldr r0, _0803FDD0 @ =gPseudoRandom
	mov r8, r0
	ldr r0, [r0]
	ldr r5, _0803FDD4 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0803FDD8 @ =0x3C6EF35F
	adds r2, r2, r4     @ r2 = rnd
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r3, _0803FDDC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18] @ info.spawnX = ((I(totem->qUnk90) - gCamera.x) + (PseudoRandom32() % 64u)) - 31;
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sb
	adds r0, #0x94
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x4b
	str r1, [sp, #0x1c] @ info.spawnY = ((I(totem->qUnk94) - gCamera.y) + (PseudoRandom32() % 32u)) - 75;
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8      @ r2 = r8 = gPseudoRandom
	str r1, [r2]
	ldr r0, _0803FDE0 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0803FDE4 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _0803FDE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	mov r1, sb
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_0803FD04:
	ldr r3, _0803FDCC @ =gStageTime
	ldr r0, [r3]
	movs r1, #0xd
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0803FD9A
	ldr r6, _0803FDD0 @ =gPseudoRandom
	mov r8, r6
	ldr r0, [r6]
	ldr r5, _0803FDD4 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0803FDD8 @ =0x3C6EF35F
	adds r2, r2, r4
	mov r0, sl
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r3, _0803FDDC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sb
	adds r0, #0xa0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x10
	str r1, [sp, #0x1c]
	add r0, sp, #4          @ sp04 = info
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0803FDE0 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0803FDE4 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _0803FDE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	mov r1, sb
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_0803FD9A:
	mov r2, sb
	adds r2, #0xa8          @ r2 = &totem->unkA8
	mov r0, sb
	adds r0, #0xb0          @ r0 = &totem->unkB0
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
_0803FDAE:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r6, sb
	adds r4, r6, r0         @ r4 = t3c
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _0803FDEC
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	strh r0, [r4, #0xa]
	adds r3, #1
	str r3, [sp, #0x28] @ i++
	b _0803FEA8
	.align 2, 0
_0803FDCC: .4byte gStageTime
_0803FDD0: .4byte gPseudoRandom
_0803FDD4: .4byte 0x00196225
_0803FDD8: .4byte 0x3C6EF35F
_0803FDDC: .4byte gCamera
_0803FDE0: .4byte 0x000001FF
_0803FDE4: .4byte 0x06012980
_0803FDE8: .4byte 0x0000026B
_0803FDEC:
	subs r0, #1
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	adds r3, #1
	str r3, [sp, #0x28]
	cmp r0, #0
	bne _0803FEA8
	movs r3, #0
	mov r0, sb
	adds r0, #0x39
	str r0, [sp, #0x24]     @ sp24 = totem->unk39
	ldr r1, _0803FF20 @ =gPseudoRandom
	mov sl, r1
	ldr r7, _0803FF24 @ =0x00196225
	ldr r6, _0803FF28 @ =0x3C6EF35F
	movs r2, #0x3f
	mov r8, r2
	add r5, sp, #4
_0803FE10:
	mov r1, sl              @ r1 = sl = gPseudoRandom
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _0803FF2C @ =gCamera
	ldr r0, [r1]            @ gCamera.x
	mov r1, ip              @ r1 = ip = I(t3c->qWorldX)
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	mov r1, r8              @ r1 = r8 = 64u - 1
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _0803FF2C @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #7
	ands r0, r2
	add r0, ip
	subs r1, r0, #3
	str r1, [sp, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x1c]
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r7, r1
	adds r1, r1, r6
	mov r2, sl
	str r1, [r2]
	ldr r0, _0803FF30 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _0803FF34 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803FF38 @ =0x0000026B
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r1, #0
	str r1, [sp, #8]
	add r0, sp, #4
	ldr r1, [sp, #0x24]
	str r3, [sp, #0x2c]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x2c]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803FE10
_0803FEA8:
	movs r2, #8
	ldrsh r0, [r4, r2]      @ r0 = t3c->unk8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r3, #0xa
	ldrsh r2, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #3
	asrs r1, r1, #8
	ldr r2, _0803FF3C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0803FF02
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r6, #0xa
	ldrsh r1, [r4, r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0803FF02
	ldr r3, _0803FF40 @ =0xFFFFFF00
	adds r0, r1, r3
	strh r0, [r4, #8]
_0803FF02:
	ldr r6, [sp, #0x28]
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bhi _0803FF0E
	b _0803FDAE
_0803FF0E:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF20: .4byte gPseudoRandom
_0803FF24: .4byte 0x00196225
_0803FF28: .4byte 0x3C6EF35F
_0803FF2C: .4byte gCamera
_0803FF30: .4byte 0x000001FF
_0803FF34: .4byte 0x06012980
_0803FF38: .4byte 0x0000026B
_0803FF3C: .4byte sub_801EC3C
_0803FF40: .4byte 0xFFFFFF00

.syntax divided
