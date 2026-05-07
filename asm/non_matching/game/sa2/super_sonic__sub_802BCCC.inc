.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0     @ r6 = sonic
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BCEE
	ldr r0, [r6, #4]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r6, #4]
_0802BCEE:
	ldr r7, [r6, #4]
	ldrh r1, [r6, #0x20]
	movs r2, #0x20
	ldrsh r0, [r6, r2]
	cmp r0, #0
	beq _0802BD04
	subs r0, r1, #1
	strh r0, [r6, #0x20]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802BD0E
_0802BD04:
	ldr r0, [r6]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6]
_0802BD0E:
	ldr r1, _0802BDC8 @ =gUnknown_080D650C
	ldr r0, _0802BDCC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #3
	adds r1, r2, r1
	ldr r0, [r1]
	lsls r0, r0, #8
	adds r3, r6, #0
	adds r3, #0x28
	str r3, [sp, #4]        @ sp04 = &sonic->unk28
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp, #8]        @ sp04 = &sonic->unk2C
	movs r3, #0x94
	lsls r3, r3, #1
	adds r3, r6, r3
	str r3, [sp]            @ sp00 = &sonic->unk128
	cmp r7, r0
	blt _0802BDAA
	ldr r0, _0802BDD0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r1, [r1]
	mov r8, r1
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	mov sb, r0
	lsls r4, r1, #8
	adds r7, r7, r4
	lsls r5, r0, #8
	adds r0, r4, #0
	adds r1, r5, #0
	bl TrueArea53BossMove
	movs r3, #0
	ldr r0, [sp, #4]
	mov sl, r0
	mov ip, r4
	ldr r4, [sp, #8]
_0802BD60:
	lsls r1, r3, #3
	mov r0, sl
	adds r2, r0, r1
	ldr r0, [r2]
	add r0, ip
	str r0, [r2]
	adds r1, r4, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0802BD60
	ldr r1, _0802BDD4 @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802BDD8 @ =gCamera
	ldr r0, [r1]
	add r0, r8
	str r0, [r1]
	ldr r0, [r1, #0x20]
	add r0, r8
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	add r0, r8
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	add r0, sb
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	add r0, sb
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	add r0, sb
	str r0, [r1, #0x14]
_0802BDAA:
	ldr r1, [r6, #0x24]
	ldr r0, _0802BDDC @ =sub_802C8A0
	cmp r1, r0
	beq _0802BDEC
	ldr r0, _0802BDD8 @ =gCamera
	ldr r0, [r0, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r7, r1
	bge _0802BDE0
	adds r7, r1, #0
	b _0802BDEC
	.align 2, 0
_0802BDC8: .4byte gUnknown_080D650C
_0802BDCC: .4byte gCurrentLevel
_0802BDD0: .4byte gUnknown_080D661C
_0802BDD4: .4byte gBossRingsShallRespawn
_0802BDD8: .4byte gCamera
_0802BDDC: .4byte sub_802C8A0
_0802BDE0:
	movs r3, #0x9c
	lsls r3, r3, #9
	adds r0, r0, r3
	cmp r7, r0
	ble _0802BDEC
	adds r7, r0, #0
_0802BDEC:
	str r7, [r6, #4]
	ldr r0, [sp]
	ldrb r2, [r0]
	lsls r0, r2, #3
	ldr r3, [sp, #4]
	adds r1, r3, r0
	str r7, [r1]
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldr r1, [r6, #8]
	str r1, [r0]
	adds r2, #1
	movs r0, #0x1f
	ands r2, r0
	ldr r3, [sp]
	strb r2, [r3]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
