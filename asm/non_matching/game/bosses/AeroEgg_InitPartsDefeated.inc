.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0         @ r7 = boss
	movs r0, #0x18
	adds r0, r0, r7
	mov ip, r0              @ ip = sub
	movs r1, #0
	str r1, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x82
	movs r0, #0x30
	strb r0, [r2]
	adds r2, #1
	movs r0, #3
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x84
	strb r1, [r0]
	adds r5, r7, #0
	adds r5, #0x88          @ r5 = s
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	ldr r2, _0804216C @ =gCamera
	ldr r4, [r2]
	adds r0, r0, r4
	lsls r0, r0, #8
	mov r3, ip              @ r3 = ip = sub
	str r0, [r3, #4]
	movs r6, #0x18
	ldrsh r0, [r5, r6]
	ldr r3, [r2, #4]        @ r3 = gCamera.y
	adds r0, r0, r3
	lsls r0, r0, #8
	mov r2, ip
	str r0, [r2, #8]
	movs r2, #0xb8
	lsls r2, r2, #3
	mov r6, ip
	str r2, [r6, #0xc]
	str r1, [r6, #0x10]
	str r1, [r6, #0x14]
	movs r0, #0x90
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r6, #0x16
	ldrsh r0, [r5, r6]
	adds r0, r0, r4
	lsls r0, r0, #8
	mov r4, ip
	str r0, [r4, #0x54]
	movs r6, #0x18
	ldrsh r0, [r5, r6]
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r4, #0x58]
	str r2, [r4, #0x5c]
	str r1, [r4, #0x60]
	str r1, [r4, #0x64]
	movs r6, #0
	ldr r0, _08042170 @ =gSineTable
	mov r8, r0              @ r8 = &gSineTable
	ldr r0, _08042174 @ =gStageTime
	ldr r1, [r0]            @ r1 = gStageTime
	ldr r2, _08042178 @ =0x000003FF
	mov sl, r2              @ sl = ONE_CYCLE
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [sp]            @ sp00 = 12 * gStageTime
	mov sb, r6              @ sb = 0
_080420C2:
	lsls r0, r6, #7         @ r0 = i << 7
	ldr r3, [sp]            @ r3 = 12 * gStageTime
	adds r0, r3, r0
	mov r4, sl
	ands r0, r4
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10      @ r1 = period = SIN_24_8(((i << 7) + (12 * gStageTime)) & ONE_CYCLE) >> 3;
	ldr r4, [r7, #4]
	asrs r4, r4, #8         @ r4 = bossX = Q_24_8_TO_INT(boss->main.worldX);
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0
	mov r2, sl
	ands r1, r2             @ r1 = (period + 500) & ONE_CYCLE
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r2, [r0, r3]      @ r2 = COS(period)
	lsls r0, r2, #4
	adds r0, r0, r2
	adds r5, r6, #1
	muls r0, r5, r0
	asrs r0, r0, #0xe
	adds r4, r4, r0         @ r4 = bossX += ((COS(period) * 17) * (i + 1)) >> 14
	ldr r3, [r7, #8]
	asrs r3, r3, #8
	lsls r1, r1, #1
	add r1, r8
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	muls r0, r5, r0
	asrs r0, r0, #0xe
	adds r0, #0x14
	adds r3, r3, r0         @ r3 = bossY += (((SIN(period) * 17) * (i + 1)) >> 14) + 0x14;
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2         @ r2 = i * 20
	mov r0, ip
	adds r0, #0x18
	adds r0, r0, r2
	lsls r4, r4, #8
	str r4, [r0]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r0, r2
	lsls r3, r3, #8
	str r3, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r0, r2
	movs r1, #0xb8
	lsls r1, r1, #3
	str r1, [r0]
	mov r0, ip
	adds r0, #0x24
	adds r0, r0, r2
	mov r1, sb
	str r1, [r0]
	mov r0, ip
	adds r0, #0x28
	adds r0, r0, r2
	str r1, [r0]
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _080420C2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804216C: .4byte gCamera
_08042170: .4byte gSineTable
_08042174: .4byte gStageTime
_08042178: .4byte 0x000003FF	
.syntax divided
