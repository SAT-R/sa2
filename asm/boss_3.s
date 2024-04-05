.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

	.global gUnknown_080D7BB0
gUnknown_080D7BB0:
    .incbin "baserom.gba", 0x000D7BB0, 0x18

    .global gUnknown_080D7BC8
gUnknown_080D7BC8:
    .incbin "baserom.gba", 0x000D7BC8, 0x10

    .global sOamOrderIds
sOamOrderIds: @ 0x080D7BD8
    .byte 21, 25, 24, 0

    .global gUnknown_080D7BDC
gUnknown_080D7BDC:
    .2byte 0x1600, 0x0D00, 0xF000

    .global sTotemDiscYs
sTotemDiscYs:
    .2byte 0xE000, 0xD000, 0xC000
    
    .global gUnknown_080D7BE8
gUnknown_080D7BE8:
    .incbin "baserom.gba", 0x000D7BE8, 0x290

    .global gUnknown_080D7E78
gUnknown_080D7E78:
    .4byte gUnknown_080D7BE8 + 0*0x40
    .4byte gUnknown_080D7BE8 + 1*0x40
    .4byte gUnknown_080D7BE8 + 2*0x40
    .4byte gUnknown_080D7BE8 + 3*0x40
    .4byte gUnknown_080D7BE8 + 4*0x40
    .4byte gUnknown_080D7BE8 + 5*0x40 - 0x8
    .4byte gUnknown_080D7BE8 + 6*0x40 - 0x10
    .4byte gUnknown_080D7BE8 + 7*0x40 + 0x8
    .4byte gUnknown_080D7BE8 + 8*0x40 + 0x10
    .4byte gUnknown_080D7BE8 + 9*0x40 + 0x10

    .global gUnknown_080D7EA0
gUnknown_080D7EA0:
    .incbin "baserom.gba", 0x000D7EA0, 0x34

    .global gUnknown_080D7ED4
gUnknown_080D7ED4:
    .4byte gUnknown_080D7EA0 + 0*3
    .4byte gUnknown_080D7EA0 + 1*3
    .4byte gUnknown_080D7EA0 + 2*3
    .4byte gUnknown_080D7EA0 + 3*3
    .4byte gUnknown_080D7EA0 + 4*3
    .4byte gUnknown_080D7EA0 + 5*3
    .4byte gUnknown_080D7EA0 + 6*3
    .4byte gUnknown_080D7EA0 + 7*3
    .4byte gUnknown_080D7EA0 + 8*3
    .4byte gUnknown_080D7EA0 + 9*3
    .4byte gUnknown_080D7EA0 + 10*3
    .4byte gUnknown_080D7EA0 + 11*3
    .4byte gUnknown_080D7EA0 + 12*3
    .4byte gUnknown_080D7EA0 + 13*3 + 0x2
    .4byte gUnknown_080D7EA0 + 14*3 + 0x4

    .global gUnknown_080D7F10
gUnknown_080D7F10:
    .byte 14, 14, 8, 0

    .global gUnknown_080D7F14
gUnknown_080D7F14:
    .incbin "graphics/boss_3_a.gbapal"
    .incbin "graphics/boss_3_b.gbapal"

.text
.syntax unified
.arm

	thumb_func_start sub_803FF44
sub_803FF44: @ 0x0803FF44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	str r0, [sp, #0x24]
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FF5C
	b _080401C0
_0803FF5C:
	movs r6, #0
	ldr r0, [sp, #0x24]
	adds r0, #0x26
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x24]
	adds r1, #0xc
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	adds r2, #0x24
	str r2, [sp, #0x34]
	ldr r3, [sp, #0x24]
	adds r3, #0x10
	str r3, [sp, #0x2c]
	ldr r7, [sp, #0x24]
	adds r7, #0xa6
	mov sl, r7
	ldr r0, [sp, #0x24]
	adds r0, #0x9c
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	adds r1, #0xa4
	str r1, [sp, #0x50]
	ldr r2, [sp, #0x24]
	adds r2, #0xa0
	mov sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #0x90
	str r3, [sp, #0x40]
	ldr r7, [sp, #0x24]
	adds r7, #0x94
	str r7, [sp, #0x44]
_0803FF9A:
	lsls r0, r6, #2
	mov r8, r0
	ldr r5, [sp, #0x38]
	add r5, r8
	ldrh r0, [r5]
	adds r0, #0x20
	strh r0, [r5]
	lsls r2, r6, #3
	ldr r1, [sp, #0x28]
	adds r3, r1, r2
	ldr r7, [sp, #0x34]
	add r7, r8
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r1, [sp, #0x2c]
	adds r4, r1, r2
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	ldr r1, _080400AC @ =gUnknown_080D7F10
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	subs r0, #1
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _080400B0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _0804002E
	lsls r1, r2, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080400B4 @ =0xFFFFFF00
	cmp r0, r1
	ble _0804001A
	movs r2, #0
	strh r2, [r5]
_0804001A:
	ldrh r1, [r7]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _0804002E
	adds r0, r1, #0
	subs r0, #0x20
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r7]
_0804002E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0803FF9A
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x20
	strh r0, [r2]
	ldr r3, [sp, #0x50]
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r2, [sp, #0x4c]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r3, sl
	movs r7, #0
	ldrsh r1, [r3, r7]
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	asrs r0, r0, #8
	subs r0, #8
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _080400B0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _080400E2
	lsls r1, r2, #8
	mov r7, sb
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	mov r3, sl
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, _080400B4 @ =0xFFFFFF00
	cmp r1, r0
	ble _080400B8
	movs r0, #0
	strh r0, [r3]
	b _080400D0
	.align 2, 0
_080400AC: .4byte gUnknown_080D7F10
_080400B0: .4byte sub_801EC3C
_080400B4: .4byte 0xFFFFFF00
_080400B8:
	ldr r0, _0804019C @ =0xFFFFFE90
	cmp r1, r0
	bge _080400D0
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl CreateScreenShake
_080400D0:
	ldr r7, [sp, #0x50]
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	ble _080400E2
	adds r0, r1, #0
	subs r0, #0x30
	strh r0, [r7]
_080400E2:
	ldr r3, [sp, #0x4c]
	ldr r0, [r3]
	ldr r7, [sp, #0x40]
	str r0, [r7]
	mov r1, sb
	ldr r0, [r1]
	movs r2, #0xc8
	lsls r2, r2, #6
	adds r0, r0, r2
	ldr r3, [sp, #0x44]
	str r0, [r3]
	ldr r0, _080401A0 @ =gStageTime
	ldr r0, [r0]
	movs r1, #6
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	beq _0804010A
	b _0804049E
_0804010A:
	ldr r0, _080401A4 @ =gPseudoRandom
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _080401A8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r5, _080401AC @ =0x3C6EF35F
	adds r2, r2, r5
	mov r1, r8
	str r2, [r1]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r4, _080401B0 @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0x3f
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	mov r0, sb
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x2d
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r4, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r3
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	adds r3, r4, #0
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r2, r8
	str r1, [r2]
	ldr r0, _080401B4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080401B8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080401BC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
	b _0804049E
	.align 2, 0
_0804019C: .4byte 0xFFFFFE90
_080401A0: .4byte gStageTime
_080401A4: .4byte gPseudoRandom
_080401A8: .4byte 0x00196225
_080401AC: .4byte 0x3C6EF35F
_080401B0: .4byte gCamera
_080401B4: .4byte 0x000001FF
_080401B8: .4byte 0x06012980
_080401BC: .4byte 0x0000026B
_080401C0:
	movs r6, #0
	ldr r3, _080404C0 @ =sub_801EC3C
	mov r8, r3
	ldr r7, [sp, #0x24]
	adds r7, #0x9c
	str r7, [sp, #0x4c]
	ldr r0, [sp, #0x24]
	adds r0, #0xa4
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x24]
	adds r1, #0x90
	str r1, [sp, #0x40]
	ldr r2, [sp, #0x24]
	adds r2, #0x94
	str r2, [sp, #0x44]
	ldr r3, [sp, #0x24]
	adds r3, #0x9a
	str r3, [sp, #0x48]
	ldr r5, [sp, #0x24]
	adds r5, #0x98
	ldr r4, [sp, #0x24]
	adds r4, #0xc
	ldr r3, [sp, #0x24]
	adds r3, #0x24
_080401F0:
	lsls r1, r6, #3
	adds r1, r4, r1
	lsls r0, r6, #2
	adds r0, r3, r0
	movs r7, #0
	ldrsh r2, [r0, r7]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080401F0
	ldr r0, [sp, #0x50]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x4c]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r7, [sp, #0x48]
	ldrh r0, [r7]
	adds r0, #0x20
	strh r0, [r7]
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, [sp, #0x40]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
	ldrsh r1, [r7, r3]
	ldr r7, [sp, #0x44]
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	asrs r0, r0, #8
	subs r0, #0x32
	ldr r1, [r2]
	asrs r1, r1, #8
	mov r2, r8
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	blt _08040256
	b _08040360
_08040256:
	ldr r1, [sp, #0x24]
	adds r1, #0x38
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	str r1, [sp, #0x3c]
	lsls r2, r2, #8
	str r2, [sp, #0x30]
	cmp r0, #0
	bne _08040324
	movs r3, #0
	ldr r7, [sp, #0x24]
	adds r7, #0xa0
	mov sb, r7
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	mov sl, r0
	ldr r7, _080404C4 @ =gPseudoRandom
	ldr r6, _080404C8 @ =0x00196225
	ldr r5, _080404CC @ =0x3C6EF35F
	add r4, sp, #4
	mov r8, r3
_08040284:
	ldr r0, [r7]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	str r2, [r7]
	ldr r0, [sp, #0x4c]
	ldr r1, [r0]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080404D0 @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	movs r1, #0x3f
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r5
	str r2, [r7]
	mov r0, sb
	ldr r1, [r0]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080404D0 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	movs r1, #0x3f
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x2d
	str r1, [sp, #0x1c]
	mov r0, r8
	strh r0, [r4, #0x1c]
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	str r1, [r7]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xc0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r4, #8]
	mov r1, r8
	strh r1, [r4, #0xa]
	mov r2, r8
	str r2, [sp, #8]
	add r0, sp, #4
	mov r1, sl
	str r3, [sp, #0x58]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x58]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bls _08040284
_08040324:
	ldr r3, [sp, #0x3c]
	ldrb r0, [r3]
	cmp r0, #2
	bls _0804033E
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl CreateScreenShake
_0804033E:
	ldr r7, [sp, #0x44]
	ldr r0, [r7]
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	str r0, [r7]
	ldr r2, [sp, #0x48]
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	ldr r7, [sp, #0x48]
	strh r0, [r7]
_08040360:
	ldr r0, _080404E0 @ =gStageTime
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0xe
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08040400
	ldr r6, _080404C4 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r5, _080404C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _080404CC @ =0x3C6EF35F
	adds r2, r2, r4
	str r2, [r6]
	ldr r3, [sp, #0x40]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _080404D0 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0x3f
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, sl
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	str r2, [r6]
	ldr r0, [sp, #0x44]
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x4b
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	str r1, [r6]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_08040400:
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0xd
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0804049E
	ldr r6, _080404C4 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r5, _080404C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _080404CC @ =0x3C6EF35F
	adds r2, r2, r4
	str r2, [r6]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _080404D0 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov sb, r1
	movs r0, #0x3f
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, sb
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	ldr r0, [sp, #0x24]
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
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	str r1, [r6]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl CreateBossParticleWithExplosionUpdate
_0804049E:
	movs r6, #0
_080404A0:
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x3c
	ldr r1, [sp, #0x24]
	adds r4, r1, r0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080404E4
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	strh r0, [r4, #0xa]
	adds r6, #1
	str r6, [sp, #0x54]
	b _080405A0
	.align 2, 0
_080404C0: .4byte sub_801EC3C
_080404C4: .4byte gPseudoRandom
_080404C8: .4byte 0x00196225
_080404CC: .4byte 0x3C6EF35F
_080404D0: .4byte gCamera
_080404D4: .4byte 0x000001FF
_080404D8: .4byte 0x06012980
_080404DC: .4byte 0x0000026B
_080404E0: .4byte gStageTime
_080404E4:
	subs r0, #1
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	adds r6, #1
	str r6, [sp, #0x54]
	cmp r0, #0
	bne _080405A0
	movs r3, #0
	ldr r2, [sp, #0x24]
	adds r2, #0x39
	mov sl, r2
	ldr r7, _08040618 @ =gPseudoRandom
	mov sb, r7
	ldr r7, _0804061C @ =0x00196225
	ldr r6, _08040620 @ =0x3C6EF35F
	movs r0, #0x3f
	mov r8, r0
	add r5, sp, #4
_08040508:
	mov r1, sb
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08040624 @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	mov r1, r8
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
	ldr r1, _08040624 @ =gCamera
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
	mov r2, sb
	str r1, [r2]
	ldr r0, _08040628 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _0804062C @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _08040630 @ =0x0000026B
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r1, #0
	str r1, [sp, #8]
	add r0, sp, #4
	mov r1, sl
	str r3, [sp, #0x58]
	bl CreateBossParticleWithExplosionUpdate
	ldr r3, [sp, #0x58]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08040508
_080405A0:
	movs r2, #8
	ldrsh r0, [r4, r2]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r3, #0xa
	ldrsh r2, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #4
	asrs r1, r1, #8
	ldr r2, _08040634 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _080405FC
	lsls r1, r2, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
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
	ble _080405FC
	ldr r3, _08040638 @ =0xFFFFFF00
	adds r0, r1, r3
	strh r0, [r4, #8]
_080405FC:
	ldr r7, [sp, #0x54]
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhi _08040608
	b _080404A0
_08040608:
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040618: .4byte gPseudoRandom
_0804061C: .4byte 0x00196225
_08040620: .4byte 0x3C6EF35F
_08040624: .4byte gCamera
_08040628: .4byte 0x000001FF
_0804062C: .4byte 0x06012980
_08040630: .4byte 0x0000026B
_08040634: .4byte sub_801EC3C
_08040638: .4byte 0xFFFFFF00

@ First attempt of matching sub_804063C in boss_3_2.c
	thumb_func_start sub_804063C
sub_804063C: @ 0x0804063C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r6, _080406C0 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r1, _080406C4 @ =0x00196225
	mov sb, r1
	mov r4, sb          @ r4 = sb = 0x00196225
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, _080406C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl Mod
	lsls r0, r0, #0x18
	ldr r1, _080406CC @ =gStageTime
	ldr r4, [r1]
	movs r1, #3
	ands r4, r1         @ r4 = gStageTime % 4u
	lsrs r7, r0, #0x18
	asrs r5, r0, #0x18
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, r8
	adds r3, r1, r0
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	beq _08040686
	b _0804078A
_08040686:
	movs r0, #0xf6
	bl m4aSongNumStart
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r6]
	mov r4, sb
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, _080406C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080406F8
	cmp r5, #0
	bne _080406D0
	mov r0, r8
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406D0
	movs r2, #0xc
	b _080406F8
	.align 2, 0
_080406C0: .4byte gPseudoRandom
_080406C4: .4byte 0x00196225
_080406C8: .4byte 0x3C6EF35F
_080406CC: .4byte gStageTime
_080406D0:
	lsls r0, r7, #0x18
	asrs r1, r0, #0x18
	adds r3, r0, #0
	cmp r1, #1
	bne _080406E8
	mov r0, r8
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406E8
	movs r2, #0xd
	b _080406F8
_080406E8:
	cmp r3, #0
	bne _080406F8
	mov r0, r8
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406F8
	movs r2, #0xe
_080406F8:
	ldr r0, _08040798 @ =gUnknown_080D7ED4
	lsls r1, r2, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r5, [r1]
	ldrb r6, [r5]
	adds r5, #1
	lsls r0, r6, #0x18
	movs r4, #0xff
	lsls r4, r4, #0x18
	adds r0, r0, r4
	lsrs r6, r0, #0x18
	cmp r0, #0
	blt _0804078A
	ldr r0, _0804079C @ r0 = gUnknown_080D7E78
	mov sb, r0          @ sb = r0 (EggTotemDataA*)
	ldr r1, _080407A0 @ =gSineTable
	mov ip, r1
_0804071C:
	ldrb r7, [r5]
	adds r5, #1
	ldrb r4, [r5]
	adds r5, #1
	lsls r0, r4, #0x18
	asrs r0, r0, #0x16
	add r0, sb
	ldr r2, [r0]        @ &gUnknown_080D7E78[r4]
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, r8
	adds r3, r1, r0         @ r3 = t3c2 = &totem->unk3C[r7]
	movs r0, #1
	strb r0, [r3, #0x13]
	strb r4, [r3, #0x12]
	ldrh r0, [r2, #2]
	strh r0, [r3, #0x10]
	adds r2, #8
	ldrh r0, [r2]
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0x10]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, ip              @ COS(t3c2->unk10)
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r2, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3, #8]
	ldrh r0, [r3, #0x10]
	lsls r0, r0, #1
	add r0, ip              @ SIN(t3c2->unk10)
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r2, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3, #0xa]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r3, #0xc]
	lsls r0, r6, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r6, r0, #0x18
	cmp r0, #0
	bge _0804071C
_0804078A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040798: .4byte gUnknown_080D7ED4
_0804079C: .4byte gUnknown_080D7E78
_080407A0: .4byte gSineTable

.if 01
.endif
