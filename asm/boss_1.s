.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

   .global gUnknown_080D7A18
gUnknown_080D7A18:
    .incbin "baserom.gba", 0x000D7A18, 0x10

    .global gUnknown_080D7A28
gUnknown_080D7A28:
    .incbin "baserom.gba", 0x000D7A28, 0x10

    .global gUnknown_080D7A38
gUnknown_080D7A38:
    .incbin "baserom.gba", 0x000D7A38, 0x20

    .global gUnknown_080D7A58
gUnknown_080D7A58:
    .incbin "baserom.gba", 0x000D7A58, 0x20

    .global gUnknown_080D7A78
gUnknown_080D7A78:
    .incbin "baserom.gba", 0x000D7A78, 0x20

    .global gUnknown_080D7A98
gUnknown_080D7A98:
    .incbin "baserom.gba", 0x000D7A98, 0xA

    .global gUnknown_080D7AA2
gUnknown_080D7AA2:
    .incbin "baserom.gba", 0x000D7AA2, 0x6

    .global gUnknown_080D7AA8
gUnknown_080D7AA8:
    .4byte sub_803CAC8, sub_803B018

    .global gUnknown_080D7AB0
gUnknown_080D7AB0:
    .4byte sub_803B17C, sub_803B264, sub_803CB84, sub_803B2F8
    .4byte sub_803CBA4, sub_803B4A0, sub_803B57C, sub_803B62C

    .global gUnknown_080D7AD0
gUnknown_080D7AD0:
    .incbin "baserom.gba", 0x000D7AD0, 0x40

.text
.syntax unified
.arm

	thumb_func_start sub_803C198
sub_803C198: @ 0x0803C198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	mov r5, sb
	adds r5, #0xa8
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r1, #0x3c
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	bne _0803C256
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	mov r8, r1
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	ldr r2, _0803C310 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803C318 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0803C31C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r2, _0803C320 @ =gUnknown_080D79D0
	mov r3, r8
	lsls r1, r3, #1
	add r1, r8
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0803C324 @ =0x06010000
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
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, _0803C328 @ =0x000002DD
	add r1, sb
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_0803C256:
	ldr r2, _0803C310 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803C318 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0803C278
	movs r0, #0x90
	bl m4aSongNumStart
_0803C278:
	movs r6, #0xb8
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	mov r1, sb
	adds r1, #0xb3
	str r1, [sp, #0x20]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x24]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x28]
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x2c]
	mov r5, sp
	movs r2, #0
	movs r1, #1
	mov r8, r1
	ldr r3, _0803C32C @ =0x06012980
	mov sl, r3
_0803C2C6:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C338
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C330 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C334 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C344
	.align 2, 0
_0803C30C: .4byte gCamera
_0803C310: .4byte gPseudoRandom
_0803C314: .4byte 0x00196225
_0803C318: .4byte 0x3C6EF35F
_0803C31C: .4byte 0x000003FF
_0803C320: .4byte gUnknown_080D79D0
_0803C324: .4byte 0x06010000
_0803C328: .4byte 0x000002DD
_0803C32C: .4byte 0x06012980
_0803C330: .4byte 0x0000026B
_0803C334: .4byte 0x00000229
_0803C338:
	cmp r4, #0x3c
	bls _0803C344
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C344:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C398
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C390 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C394 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C3A4
	.align 2, 0
_0803C390: .4byte 0x0000026B
_0803C394: .4byte 0x00000229
_0803C398:
	cmp r4, #0x3c
	bls _0803C3A4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C3A4:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C3F8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C3F0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C3F4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C404
	.align 2, 0
_0803C3F0: .4byte 0x0000026B
_0803C3F4: .4byte 0x00000229
_0803C3F8:
	cmp r4, #0x3c
	bls _0803C404
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C404:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C458
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C450 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C454 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C464
	.align 2, 0
_0803C450: .4byte 0x0000026B
_0803C454: .4byte 0x00000229
_0803C458:
	cmp r4, #0x3c
	bls _0803C464
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C464:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C4B8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C4B0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C4B4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl CreateBossParticleWithExplosionUpdate
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C4C4
	.align 2, 0
_0803C4B0: .4byte 0x0000026B
_0803C4B4: .4byte 0x00000229
_0803C4B8:
	cmp r4, #0x3c
	bls _0803C4C4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C4C4:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	blt _0803C4D2
	b _0803C2C6
_0803C4D2:
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	cmp r0, #0x31
	bgt _0803C4F6
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C4F6
	movs r0, #1
	strb r0, [r3]
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r2, #0x80
	lsls r2, r2, #6
	bl CreateEggmobileEscapeSequence
_0803C4F6:
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r4, _0803C7C0 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0803C528
	movs r1, #0
	strh r1, [r7]
	strh r1, [r7, #4]
	movs r0, #2
	strh r0, [r7, #2]
	strh r1, [r7, #6]
	movs r0, #0xbf
	strh r0, [r7, #8]
	strh r1, [r7, #0xa]
	mov r0, sb
	adds r0, #0xa8
	str r1, [r0]
	ldr r0, _0803C7C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803C7C8 @ =sub_803AA40
	str r0, [r1, #8]
_0803C528:
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C556
	movs r6, #0xde
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803C556:
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C572
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5A4
_0803C572:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803C5A4:
	movs r2, #0xf6
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C5C0
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5EE
_0803C5C0:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl DisplaySprite
_0803C5EE:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C60A
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C63E
_0803C60A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xfa
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803C63E:
	movs r2, #0x87
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C65A
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C688
_0803C65A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl DisplaySprite
_0803C688:
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	movs r0, #6
	mov r8, r0
	ldr r1, _0803C7C0 @ =gCamera
	mov sl, r1
	ldr r2, [sp, #0x2c]
	adds r2, #0x90
	ldr r5, [sp, #0x28]
	adds r5, #0x90
	ldr r4, [sp, #0x24]
	adds r4, #0x90
	movs r3, #0x90
_0803C6AA:
	ldr r0, [r4]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0, #4]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	ldr r0, [r2]
	cmp r0, #0
	bne _0803C6EA
	adds r0, r7, #0
	adds r0, #0x58
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C6F8
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C6F8
_0803C6EA:
	adds r0, r6, #0
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	bl DisplaySprite
	ldr r3, [sp, #0x34]
	ldr r2, [sp, #0x30]
_0803C6F8:
	subs r2, #0x18
	subs r5, #0x18
	subs r4, #0x18
	subs r3, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C6AA
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r5, _0803C7C0 @ =gCamera
	movs r4, #0
	movs r2, #5
	mov r8, r2
_0803C720:
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C76C
	adds r3, #0x14
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C772
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C772
_0803C76C:
	adds r0, r6, #0
	bl DisplaySprite
_0803C772:
	adds r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C720
	movs r6, #0x81
	lsls r6, r6, #3
	add r6, sb
	movs r3, #0x87
	lsls r3, r3, #3
	add r3, sb
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r2, _0803C7CC @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803C7D0 @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803C7D4
	movs r0, #2
	str r0, [r7, #0x30]
	b _0803C7FC
	.align 2, 0
_0803C7C0: .4byte gCamera
_0803C7C4: .4byte gCurTask
_0803C7C8: .4byte sub_803AA40
_0803C7CC: .4byte gUnknown_030054B8
_0803C7D0: .4byte 0x00002060
_0803C7D4:
	movs r2, #0x89
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r3, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r3, #8]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_8004860
	adds r0, r6, #0
	bl DisplaySprite
_0803C7FC:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803C80C
sub_803C80C: @ 0x0803C80C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0803C8D4 @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _0803C8D8 @ =IWRAM_START + 0xB4
	adds r0, r0, r2
	mov ip, r0
	ldr r0, [r0, #0xc]
	adds r0, r0, r4
	mov r3, ip
	str r0, [r3, #0xc]
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r3, #0x10]
	adds r0, r0, r5
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r5
	str r0, [r1, #4]
	movs r3, #0
	ldr r0, _0803C8DC @ =IWRAM_START + 0x278
	adds r7, r2, r0
	ldr r1, _0803C8E0 @ =IWRAM_START + 0x27C
	adds r6, r2, r1
_0803C848:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C848
	movs r3, #0
	mov r7, ip
	adds r7, #0x44
	mov r6, ip
	adds r6, #0x48
_0803C872:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803C872
	movs r3, #0
	movs r7, #0x82
	lsls r7, r7, #1
	add r7, ip
	movs r6, #0x84
	lsls r6, r6, #1
	add r6, ip
_0803C8A0:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803C8A0
	mov r3, ip
	ldr r0, [r3, #0x1c]
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	adds r0, r0, r5
	str r0, [r3, #0x20]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C8D4: .4byte gActiveBossTask
_0803C8D8: .4byte IWRAM_START + 0xB4
_0803C8DC: .4byte IWRAM_START + 0x278
_0803C8E0: .4byte IWRAM_START + 0x27C

	thumb_func_start TaskDestructor_EggHammerTankIIMain
TaskDestructor_EggHammerTankIIMain: @ 0x0803C8E4
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _0803C958 @ =IWRAM_START + 0x2E4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C95C @ =IWRAM_START + 0x31C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C960 @ =IWRAM_START + 0x34C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C964 @ =IWRAM_START + 0x37C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C968 @ =IWRAM_START + 0x3AC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C96C @ =IWRAM_START + 0x3DC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C970 @ =IWRAM_START + 0x40C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C974 @ =IWRAM_START + 0x448
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C93C
	bl VramFree
_0803C93C:
	ldr r1, _0803C978 @ =IWRAM_START + 0x478
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C94A
	bl VramFree
_0803C94A:
	ldr r1, _0803C97C @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C958: .4byte IWRAM_START + 0x2E4
_0803C95C: .4byte IWRAM_START + 0x31C
_0803C960: .4byte IWRAM_START + 0x34C
_0803C964: .4byte IWRAM_START + 0x37C
_0803C968: .4byte IWRAM_START + 0x3AC
_0803C96C: .4byte IWRAM_START + 0x3DC
_0803C970: .4byte IWRAM_START + 0x40C
_0803C974: .4byte IWRAM_START + 0x448
_0803C978: .4byte IWRAM_START + 0x478
_0803C97C: .4byte gActiveBossTask

	thumb_func_start Task_803C980
Task_803C980: @ 0x0803C980
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803CA04 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r5, _0803CA08 @ =gUnknown_080D7AA8
	bl sub_803CA40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0803CA0C @ =gUnknown_080D7AB0
	ldr r2, _0803CA10 @ =IWRAM_START + 0xA0
	adds r0, r6, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_803CB18
	adds r0, r4, #0
	bl sub_803A8E4
	adds r0, r4, #0
	bl sub_803B7B0
	adds r0, r4, #0
	bl sub_803AC2C
	adds r0, r4, #0
	bl sub_803CC3C
	ldr r0, _0803CA14 @ =IWRAM_START + 0xB0
	adds r6, r6, r0
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803C9FE
	bl sub_803BDB8
	ldr r1, [r7]
	ldr r0, _0803CA18 @ =Task_803CA1C
	str r0, [r1, #8]
	bl sub_802A018
_0803C9FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA04: .4byte gCurTask
_0803CA08: .4byte gUnknown_080D7AA8
_0803CA0C: .4byte gUnknown_080D7AB0
_0803CA10: .4byte IWRAM_START + 0xA0
_0803CA14: .4byte IWRAM_START + 0xB0
_0803CA18: .4byte Task_803CA1C

	thumb_func_start Task_803CA1C
Task_803CA1C: @ 0x0803CA1C
	push {r4, lr}
	ldr r0, _0803CA3C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_803B84C
	adds r0, r4, #0
	bl sub_803C198
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA3C: .4byte gCurTask

	thumb_func_start sub_803CA40
sub_803CA40: @ 0x0803CA40
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r2, r0, r1
	ldr r0, _0803CAAC @ =IWRAM_START + 0x9C
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r6, _0803CAB0 @ =sub_801EC3C
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	ldr r0, [r4]
	ldr r1, _0803CAB4 @ =0xFFFFEA00
	adds r2, r0, r1
	ldr r0, _0803CAB8 @ =IWRAM_START + 0x98
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	movs r0, #0
	b _0803CABE
	.align 2, 0
_0803CAA8: .4byte gCurTask
_0803CAAC: .4byte IWRAM_START + 0x9C
_0803CAB0: .4byte sub_801EC3C
_0803CAB4: .4byte 0xFFFFEA00
_0803CAB8: .4byte IWRAM_START + 0x98
_0803CABC:
	movs r0, #1
_0803CABE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@; Refd in gUnknown_080D7AA8
	thumb_func_start sub_803CAC8
sub_803CAC8: @ 0x0803CAC8
	push {lr}
	ldr r0, _0803CB0C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldrh r0, [r1, #0xa]
	adds r0, #0x40
	strh r0, [r1, #0xa]
	ldr r0, _0803CB10 @ =IWRAM_START + 0x9C
	adds r3, r2, r0
	ldr r0, [r3]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0803CB14 @ =IWRAM_START + 0x98
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803CB00
	str r1, [r3]
_0803CB00:
	ldr r0, [r2]
	cmp r0, r1
	ble _0803CB08
	str r1, [r2]
_0803CB08:
	pop {r0}
	bx r0
	.align 2, 0
_0803CB0C: .4byte gCurTask
_0803CB10: .4byte IWRAM_START + 0x9C
_0803CB14: .4byte IWRAM_START + 0x98

	thumb_func_start sub_803CB18
sub_803CB18: @ 0x0803CB18
	push {r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x4c]
	adds r1, #8
	ldr r2, _0803CB74 @ =0x000003FF
	ands r1, r2
	str r1, [r0, #0x4c]
	ldr r2, _0803CB78 @ =gSineTable
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [r0, #0x50]
	str r1, [r0, #0x2c]
	movs r4, #1
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r0, _0803CB7C @ =gUnknown_080D7A28
	mov ip, r0
	ldr r6, _0803CB80 @ =0xFFFFF400
_0803CB40:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	adds r0, r0, r6
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803CB40
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB74: .4byte 0x000003FF
_0803CB78: .4byte gSineTable
_0803CB7C: .4byte gUnknown_080D7A28
_0803CB80: .4byte 0xFFFFF400

	thumb_func_start sub_803CB84
sub_803CB84: @ 0x0803CB84
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0xac
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _0803CBA0
	movs r0, #0x3c
	str r0, [r2]
	adds r1, #0xa0
	movs r0, #3
	str r0, [r1]
_0803CBA0:
	pop {r0}
	bx r0

	thumb_func_start sub_803CBA4
sub_803CBA4: @ 0x0803CBA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xac
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803CBF6
	ldr r2, _0803CBD8 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803CBDC @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803CBE0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803CBE4
	movs r0, #0x44
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #5
	b _0803CBF4
	.align 2, 0
_0803CBD8: .4byte gPseudoRandom
_0803CBDC: .4byte 0x00196225
_0803CBE0: .4byte 0x3C6EF35F
_0803CBE4:
	movs r0, #0xef
	bl m4aSongNumStart
	movs r0, #0x3c
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #6
_0803CBF4:
	str r0, [r1]
_0803CBF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803CBFC
sub_803CBFC: @ 0x0803CBFC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0xb2
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CC2E
	movs r0, #0xde
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0803CC34 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803CC38 @ =0x00000399
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803CC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0803CC34: .4byte 0x00000275
_0803CC38: .4byte 0x00000399

	thumb_func_start sub_803CC3C
sub_803CC3C: @ 0x0803CC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r2, #0xb1
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803CC90
	movs r4, #0
	ldr r0, _0803CC9C @ =gFlags
	mov r8, r0
	ldr r1, _0803CCA0 @ =gObjPalette
	mov ip, r1
	ldr r7, _0803CCA4 @ =gUnknown_080D7AD0
	adds r5, r2, #0
	movs r6, #4
_0803CC5C:
	adds r3, r4, #0
	adds r3, #0x80
	lsls r3, r3, #1
	add r3, ip
	lsls r1, r4, #1
	ldrb r2, [r5]
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0803CC5C
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
_0803CC90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC9C: .4byte gFlags
_0803CCA0: .4byte gObjPalette
_0803CCA4: .4byte gUnknown_080D7AD0
