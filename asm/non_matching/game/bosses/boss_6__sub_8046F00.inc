.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	adds r0, #0x6c
	str r0, [sp, #0x20]
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0x31
	bls _08046F1C
	b _0804702E
_08046F1C:
	movs r4, #0x31
	subs r0, r4, r0
	movs r1, #0x10
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	lsls r0, r0, #4
	subs r4, r4, r0
	mov r2, r8
	ldr r0, [r2]
	cmp r4, r0
	bne _0804702E
	movs r0, #0x90
	bl m4aSongNumStart
	movs r7, #0
	mov r4, sp
_08046F42:
	lsls r1, r7, #0x10
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r6, r0, #0x16
	ldr r2, [r3, #4]
	asrs r2, r2, #8
	ldr r5, _08047040 @ =gCamera
	ldr r0, [r5]
	subs r2, r2, r0
	ldr r0, _08047044 @ =gUnknown_080D8030
	ldr r1, [sp, #0x24]
	adds r0, r1, r0
	ldrb r3, [r0]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r6, r5
	lsls r0, r0, #1
	ldr r1, _08047048 @ =gSineTable
	adds r0, r0, r1
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	adds r2, r2, r0
	mov r0, r8
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r5, _08047040 @ =gCamera
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r0, r6, #1
	ldr r5, _08047048 @ =gSineTable
	adds r0, r0, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r5, #0
	adds r7, #1
	mov sl, r7
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
_08046FA2:
	ldr r1, _0804704C @ =gPseudoRandom
	ldr r0, [r1]
	ldr r2, _08047050 @ =0x00196225
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r3, _08047054 @ =0x3C6EF35F
	adds r1, r1, r3
	adds r0, r1, #0
	movs r2, #0xf
	ands r0, r2
	adds r0, r7, r0
	subs r0, #8
	str r0, [sp, #0x14]
	ldr r3, _08047050 @ =0x00196225
	adds r2, r1, #0
	muls r2, r3, r2
	ldr r0, _08047054 @ =0x3C6EF35F
	adds r2, r2, r0
	mov r3, sb
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	movs r3, #0xf
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	movs r3, #0
	strh r3, [r4, #0x1c]
	ldr r1, _08047050 @ =0x00196225
	adds r0, r2, #0
	muls r0, r1, r0
	ldr r2, _08047054 @ =0x3C6EF35F
	adds r0, r0, r2
	ldr r1, _0804704C @ =gPseudoRandom
	str r0, [r1]
	movs r1, #0x3f
	ands r0, r1
	subs r0, r6, r0
	adds r0, #0x1f
	strh r0, [r4, #0xc]
	lsls r1, r5, #9
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _08047058 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804705C @ =0x0000026B
	strh r0, [r4, #8]
	strh r3, [r4, #0xa]
	str r3, [sp, #4]
	mov r0, sp
	ldr r3, [sp, #0x20]
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r1, r3, r2
	bl CreateBossParticleWithExplosionUpdate
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08046FA2
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _08046F42
_0804702E:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047040: .4byte gCamera
_08047044: .4byte gUnknown_080D8030
_08047048: .4byte gSineTable
_0804704C: .4byte gPseudoRandom
_08047050: .4byte 0x00196225
_08047054: .4byte 0x3C6EF35F
_08047058: .4byte 0x06012980
_0804705C: .4byte 0x0000026B

	
.syntax divided
