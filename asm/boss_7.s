.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.align 2, 0

 	.global gUnknown_080D8108
gUnknown_080D8108:
    .incbin "baserom.gba", 0x000D8108, 0x40

    .global gUnknown_080D8148
gUnknown_080D8148:
    .incbin "baserom.gba", 0x000D8148, 0x2

    .global gUnknown_080D814A
gUnknown_080D814A:
    .incbin "baserom.gba", 0x000D814A, 0x452

    .global gUnknown_080D859C
gUnknown_080D859C:
    .incbin "baserom.gba", 0x000D859C, 0x138

    .global gUnknown_080D86D4
gUnknown_080D86D4:
    .incbin "baserom.gba", 0x000D86D4, 0x3C

    .global gUnknown_080D8710
gUnknown_080D8710:
    .incbin "baserom.gba", 0x000D8710, 0x3C

    .global gUnknown_080D874C
gUnknown_080D874C:
    .incbin "baserom.gba", 0x000D874C, 0x3C

    .global gUnknown_080D8788
gUnknown_080D8788:
    .incbin "baserom.gba", 0x000D8788, 0xE

    .global gUnknown_080D8796
gUnknown_080D8796:
    .incbin "baserom.gba", 0x000D8796, 0x42

    .global gUnknown_080D87D8
gUnknown_080D87D8:
    .incbin "baserom.gba", 0x000D87D8, 0xE

    .global gUnknown_080D87E6
gUnknown_080D87E6:
    .incbin "baserom.gba", 0x000D87E6, 0x22

    .global gUnknown_080D8808
gUnknown_080D8808:
    .incbin "baserom.gba", 0x000D8808, 0x38

    .global gUnknown_080D8840
gUnknown_080D8840:
    .incbin "baserom.gba", 0x000D8840, 0x18

    .global gUnknown_080D8858
gUnknown_080D8858:
    .incbin "baserom.gba", 0x000D8858, 0xC

    .global gUnknown_080D8864
gUnknown_080D8864:
    .incbin "baserom.gba", 0x000D8864, 0x10

    .global gUnknown_080D8874
gUnknown_080D8874:
    .incbin "baserom.gba", 0x000D8874, 0x14

.text
.syntax unified
.arm

	thumb_func_start sub_8047E28
sub_8047E28: @ 0x08047E28
	push {r4, r5, r6, r7, lr}
	ldr r7, _08047EAC @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r1, _08047EB0 @ =gUnknown_080D874C
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_8048408
	adds r0, r4, #0
	bl sub_80492B8
	adds r0, r4, #0
	bl sub_8048858
	adds r0, r4, #0
	bl sub_8048E64
	adds r0, r4, #0
	bl sub_80480E8
	adds r0, r4, #0
	bl sub_804931C
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _08047EC8
	ldr r5, _08047EB4 @ =gUnknown_03005424
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08047E86
	ldr r0, _08047EB8 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0x20]
_08047E86:
	bl Player_DisableInputAndBossTimer
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	strb r1, [r4, #0x18]
	ldr r2, _08047EBC @ =IWRAM_START + 0x64
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r1, [r5]
	ldr r0, _08047EC0 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r5]
	ldr r1, [r7]
	ldr r0, _08047EC4 @ =sub_8047F0C
	str r0, [r1, #8]
	b _08047EFE
	.align 2, 0
_08047EAC: .4byte gCurTask
_08047EB0: .4byte gUnknown_080D874C
_08047EB4: .4byte gUnknown_03005424
_08047EB8: .4byte gPlayer
_08047EBC: .4byte IWRAM_START + 0x64
_08047EC0: .4byte 0x0000FF7F
_08047EC4: .4byte sub_8047F0C
_08047EC8:
	ldr r0, _08047EE4 @ =gPlayer
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08047EEC
	ldr r0, _08047EE8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	b _08047EFE
	.align 2, 0
_08047EE4: .4byte gPlayer
_08047EE8: .4byte gUnknown_03005424
_08047EEC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08047EFE
	ldr r2, _08047F04 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08047F08 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
_08047EFE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047F04: .4byte gUnknown_03005424
_08047F08: .4byte 0x0000FF7F

	thumb_func_start sub_8047F0C
sub_8047F0C: @ 0x08047F0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _080480A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, sb
	adds r7, r1, r0
	ldr r2, _080480A4 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _080480A8 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r0, r7, #0
	bl sub_8048654
	adds r0, r7, #0
	bl sub_8048E64
	adds r0, r7, #0
	bl sub_80480E8
	adds r0, r7, #0
	bl sub_804931C
	ldr r4, _080480AC @ =gStageTime
	ldr r0, [r4]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _08047F5E
	movs r0, #0x90
	bl m4aSongNumStart
_08047F5E:
	ldr r0, [r4]
	movs r1, #7
	bl Mod
	ldr r1, _080480B0 @ =IWRAM_START + 0x65
	add r1, sb
	mov sl, r1
	cmp r0, #0
	bne _0804800A
	ldrb r6, [r1]
	cmp r6, #0
	bne _08048060
	ldr r0, _080480B4 @ =gPseudoRandom
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _080480B8 @ =0x00196225
	mov ip, r1
	mov r2, ip
	muls r2, r0, r2
	ldr r5, _080480BC @ =0x3C6EF35F
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r4, _080480C0 @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0x3f
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	mov r1, ip
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	mov r4, sp
	mov r1, ip
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r3
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	mov r3, sp
	mov r1, ip
	muls r1, r2, r1
	adds r1, r1, r5
	mov r0, r8
	str r1, [r0]
	ldr r0, _080480C4 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080480C8 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _080480CC @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	str r6, [sp, #4]
	ldr r1, _080480D0 @ =IWRAM_START + 0x64
	add r1, sb
	bl CreateBossParticleWithExplosionUpdate
_0804800A:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _08048060
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r2, _080480C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _08048060
	ldr r1, _080480D4 @ =IWRAM_START + 0x68
	add r1, sb
	ldr r0, _080480D8 @ =0x000002B6
	strh r0, [r1, #0xa]
	ldr r1, _080480DC @ =IWRAM_START + 0x88
	add r1, sb
	movs r0, #4
	strb r0, [r1]
	ldr r1, _080480E0 @ =IWRAM_START + 0x89
	add r1, sb
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	mov r1, sl
	strb r0, [r1]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	subs r1, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x90
	lsls r2, r2, #6
	bl CreateEggmobileEscapeSequence
_08048060:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, _080480C0 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08048090
	adds r0, r7, #0
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _08048090
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x96
	movs r2, #6
	bl sub_802EF68
	ldr r0, _080480A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080480E4 @ =sub_8048F44
	str r0, [r1, #8]
_08048090:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080480A0: .4byte gCurTask
_080480A4: .4byte gUnknown_03005424
_080480A8: .4byte 0x0000FF7F
_080480AC: .4byte gStageTime
_080480B0: .4byte IWRAM_START + 0x65
_080480B4: .4byte gPseudoRandom
_080480B8: .4byte 0x00196225
_080480BC: .4byte 0x3C6EF35F
_080480C0: .4byte gCamera
_080480C4: .4byte 0x000001FF
_080480C8: .4byte 0x06012980
_080480CC: .4byte 0x0000026B
_080480D0: .4byte IWRAM_START + 0x64
_080480D4: .4byte IWRAM_START + 0x68
_080480D8: .4byte 0x000002B6
_080480DC: .4byte IWRAM_START + 0x88
_080480E0: .4byte IWRAM_START + 0x89
_080480E4: .4byte sub_8048F44

	thumb_func_start sub_80480E8
sub_80480E8: @ 0x080480E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x68
	movs r4, #0x20
	movs r0, #0x20
	strh r0, [r6, #0x16]
	movs r5, #0x28
	movs r0, #0x28
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl sub_8003914
	ldr r3, _08048148 @ =gBgScrollRegs
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	ldr r1, _0804814C @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	subs r4, r4, r2
	strh r4, [r3]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	subs r5, r5, r0
	strh r5, [r3, #2]
	str r2, [sp, #4]
	adds r1, r2, #0
	adds r1, #0x32
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bls _08048158
	ldr r2, _08048150 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08048154 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08048166
	.align 2, 0
_08048148: .4byte gBgScrollRegs
_0804814C: .4byte gCamera
_08048150: .4byte gDispCnt
_08048154: .4byte 0x0000FEFF
_08048158:
	ldr r0, _0804827C @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_08048166:
	movs r4, #0
	str r4, [sp, #0xc]
	adds r6, r7, #0
	adds r6, #0x1e
	str r6, [sp, #0x2c]
	adds r0, r7, #0
	adds r0, #0x20
	str r0, [sp, #0x30]
_08048176:
	movs r1, #0
	mov r8, r1
	ldr r2, [sp, #0xc]
	lsls r2, r2, #1
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	adds r3, #1
	str r3, [sp, #0x1c]
	ldr r4, [sp, #0xc]
	adds r0, r2, r4
	lsls r0, r0, #1
	str r0, [sp, #0x10]
	ldr r6, [sp, #0x2c]
	adds r6, r6, r0
	mov sl, r6
	ldr r1, [sp, #0x30]
	adds r0, r1, r0
	str r0, [sp, #0x18]
_0804819A:
	mov r2, r8
	cmp r2, #0
	bne _0804828C
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r3, _08048280 @ =gCamera
	ldr r1, [r3]
	subs r1, r0, r1
	str r1, [sp, #4]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r1, r0, r1
	str r1, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	lsls r0, r0, #1
	ldr r1, _08048284 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #0xe
	ldr r4, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #4]
	lsls r2, r2, #1
	ldr r6, _08048284 @ =gSineTable
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #0xe
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	movs r4, #0
	movs r2, #0
	str r2, [sp, #0x28]
	movs r3, #1
	str r3, [sp, #0x20]
	ldr r6, _08048288 @ =gUnknown_080D8788
	mov sb, r6
	mov r0, sp
	ldrh r3, [r0, #4]
	ldr r5, _08048284 @ =gSineTable
	ldrh r2, [r0, #8]
_08048210:
	ldr r1, [sp, #0x28]
	mov r6, r8
	subs r0, r1, r6
	adds r0, r4, r0
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x98
	adds r6, r7, r0
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	muls r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xd
	adds r0, r3, r0
	strh r0, [r6, #0x16]
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	muls r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xd
	adds r0, r2, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r2, [sp, #0x34]
	str r3, [sp, #0x38]
	bl DisplaySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, [sp, #0x34]
	ldr r3, [sp, #0x38]
	cmp r4, #2
	bls _08048210
	b _08048358
	.align 2, 0
_0804827C: .4byte gDispCnt
_08048280: .4byte gCamera
_08048284: .4byte gSineTable
_08048288: .4byte gUnknown_080D8788
_0804828C:
	mov r2, sl
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	ldr r4, _080483C8 @ =gSineTable
	adds r0, r0, r4
	movs r6, #0
	ldrsh r0, [r0, r6]
	asrs r0, r0, #9
	ldr r2, [sp, #4]
	adds r0, r2, r0
	str r0, [sp, #4]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	asrs r0, r0, #9
	ldr r4, [sp, #8]
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r4, #0
	mov r6, r8
	lsls r6, r6, #3
	str r6, [sp, #0x28]
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x20]
	mov r1, sp
	ldrh r2, [r1, #4]
	strh r2, [r1, #0x14]
	ldr r5, _080483C8 @ =gSineTable
	ldrh r3, [r1, #8]
	mov sb, r3
_080482D2:
	ldr r1, _080483CC @ =gUnknown_080D8788
	ldr r6, [sp, #0x28]
	mov r2, r8
	subs r0, r6, r2
	adds r0, r4, r0
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x98
	adds r6, r7, r0
	ldr r3, [sp, #0x18]
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xb
	mov r3, sp
	ldrh r3, [r3, #0x14]
	adds r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xb
	add r0, sb
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl DisplaySprite
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	beq _0804834E
	ldr r0, [r7]
	cmp r0, #0
	bne _0804834E
	movs r3, #0x16
	ldrsh r1, [r6, r3]
	ldr r2, _080483D0 @ =gCamera
	ldr r0, [r2]
	adds r1, r1, r0
	movs r3, #0x18
	ldrsh r2, [r6, r3]
	ldr r3, _080483D0 @ =gCamera
	ldr r0, [r3, #4]
	adds r2, r2, r0
	ldr r0, _080483D4 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
_0804834E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080482D2
_08048358:
	ldr r4, [sp, #0x20]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bhi _08048366
	b _0804819A
_08048366:
	ldr r6, [sp, #0x24]
	ldr r0, [sp, #0xc]
	adds r2, r6, r0
	lsls r0, r2, #1
	ldr r1, [sp, #0x30]
	adds r0, r1, r0
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	ldr r4, _080483C8 @ =gSineTable
	adds r0, r0, r4
	movs r6, #0
	ldrsh r0, [r0, r6]
	movs r3, #0x32
	muls r0, r3, r0
	asrs r0, r0, #0xe
	ldr r4, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #4]
	lsls r1, r1, #1
	ldr r6, _080483C8 @ =gSineTable
	adds r1, r1, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	ldr r6, [sp, #8]
	adds r0, r6, r0
	str r0, [sp, #8]
	lsls r2, r2, #4
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r2, r2, r0
	adds r6, r7, r2
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r6, #0x16]
	mov r2, sp
	ldrh r2, [r2, #8]
	strh r2, [r6, #0x18]
	ldrb r0, [r7, #0x18]
	cmp r0, #0
	beq _080483D8
	movs r0, #0xa0
	lsls r0, r0, #6
	b _080483DC
	.align 2, 0
_080483C8: .4byte gSineTable
_080483CC: .4byte gUnknown_080D8788
_080483D0: .4byte gCamera
_080483D4: .4byte gPlayer
_080483D8:
	movs r0, #0x80
	lsls r0, r0, #6
_080483DC:
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	ldr r3, [sp, #0x1c]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #1
	bhi _080483F8
	b _08048176
_080483F8:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8048408
sub_8048408: @ 0x08048408
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x68
	adds r0, r0, r6
	mov sb, r0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	mov r8, r0
	mov r4, r8
	ldr r0, [r6, #8]
	asrs r7, r0, #8
	adds r5, r7, #0
	ldr r1, _08048460 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r2, #0x18]
	ldrb r0, [r6, #0x16]
	cmp r0, #0
	bne _080484B0
	ldr r0, _08048464 @ =gPlayer
	mov sl, r0
	str r0, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08048468
	adds r0, r6, #0
	bl sub_8048D78
	b _08048482
	.align 2, 0
_08048460: .4byte gCamera
_08048464: .4byte gPlayer
_08048468:
	mov r1, sl
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _08048482
	adds r0, r6, #0
	bl sub_804928C
_08048482:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl Player_UpdateHomingPosition
	ldrb r7, [r6, #0x16]
	cmp r7, #0
	bne _080484B0
	ldr r0, _080484C0 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl IsColliding_Cheese
	cmp r0, #1
	bne _080484B0
	adds r0, r6, #0
	bl sub_8048D78
	ldr r0, _080484C4 @ =gUnknown_03005498
	ldr r0, [r0, #4]
	strb r7, [r0, #0x15]
_080484B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080484C0: .4byte gPlayer
_080484C4: .4byte gUnknown_03005498

	thumb_func_start sub_80484C8
sub_80484C8: @ 0x080484C8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _080484D4
	b _08048642
_080484D4:
	ldr r0, _080484E4 @ =gCourseTime
	ldr r0, [r0]
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _080484E8
	movs r1, #0
	b _080484FA
	.align 2, 0
_080484E4: .4byte gCourseTime
_080484E8:
	ldr r2, _08048534 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08048538 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804853C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	adds r1, r3, #0
	ands r1, r0
_080484FA:
	strb r1, [r4, #0x1a]
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080485A8
	cmp r1, #0
	bne _08048578
	movs r2, #1
	strb r2, [r4, #0x17]
	ldr r0, _08048540 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08048550
	movs r0, #6
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048544 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048548 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x18]
	str r0, [r4, #0x60]
	ldr r1, _0804854C @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1a]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1b]
	b _08048640
	.align 2, 0
_08048534: .4byte gPseudoRandom
_08048538: .4byte 0x00196225
_0804853C: .4byte 0x3C6EF35F
_08048540: .4byte gUnknown_03005424
_08048544: .4byte 0x00000FFF
_08048548: .4byte gUnknown_080D86D4
_0804854C: .4byte gUnknown_080D8710
_08048550:
	strb r2, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804856C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048570 @ =gUnknown_080D86D4
	ldr r0, [r0, #4]
	str r0, [r4, #0x60]
	ldr r1, _08048574 @ =gUnknown_080D8710
	ldrb r0, [r1, #6]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #7]
	b _08048640
	.align 2, 0
_0804856C: .4byte 0x00000FFF
_08048570: .4byte gUnknown_080D86D4
_08048574: .4byte gUnknown_080D8710
_08048578:
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
	movs r0, #4
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804859C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080485A0 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x10]
	str r0, [r4, #0x60]
	ldr r1, _080485A4 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x13]
	b _08048640
	.align 2, 0
_0804859C: .4byte 0x00000FFF
_080485A0: .4byte gUnknown_080D86D4
_080485A4: .4byte gUnknown_080D8710
_080485A8:
	cmp r1, #0
	bne _08048618
	movs r0, #1
	strb r0, [r4, #0x17]
	ldr r0, _080485DC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080485EC
	movs r0, #8
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _080485E0 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080485E4 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x20]
	str r0, [r4, #0x60]
	ldr r0, _080485E8 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x22
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x23
	b _0804863E
	.align 2, 0
_080485DC: .4byte gUnknown_03005424
_080485E0: .4byte 0x00000FFF
_080485E4: .4byte gUnknown_080D86D4
_080485E8: .4byte gUnknown_080D8710
_080485EC:
	movs r0, #0xd
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804860C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048610 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x34]
	str r0, [r4, #0x60]
	ldr r0, _08048614 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x37
	b _0804863E
	.align 2, 0
_0804860C: .4byte 0x00000FFF
_08048610: .4byte gUnknown_080D86D4
_08048614: .4byte gUnknown_080D8710
_08048618:
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
	movs r0, #0xb
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048648 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _0804864C @ =gUnknown_080D86D4
	ldr r0, [r0, #0x2c]
	str r0, [r4, #0x60]
	ldr r0, _08048650 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x2f
_0804863E:
	ldrb r0, [r0]
_08048640:
	strb r0, [r4, #0x19]
_08048642:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048648: .4byte 0x00000FFF
_0804864C: .4byte gUnknown_080D86D4
_08048650: .4byte gUnknown_080D8710

	thumb_func_start sub_8048654
sub_8048654: @ 0x08048654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _08048764 @ =gUnknown_080D814A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r7, #0xe]
	adds r0, r0, r1
	strh r0, [r7, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0804867E
	strh r1, [r7, #0xe]
_0804867E:
	movs r2, #0xc
	ldrsh r0, [r7, r2]
	ldr r1, [r7, #4]
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	ldr r0, [r7, #8]
	adds r0, r0, r2
	str r0, [r7, #8]
	asrs r0, r0, #8
	adds r0, #0x1e
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08048768 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _080486D6
	lsls r1, r0, #8
	ldr r0, [r7, #8]
	adds r0, r0, r1
	str r0, [r7, #8]
	movs r4, #0xe
	ldrsh r1, [r7, r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	rsbs r0, r0, #0
	movs r1, #0xa
	bl Div
	strh r0, [r7, #0xe]
	movs r0, #0xc
	ldrsh r1, [r7, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	movs r1, #0xa
	bl Div
	strh r0, [r7, #0xc]
_080486D6:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	str r0, [sp, #8]
	movs r1, #0
	mov r8, r1
	adds r2, r7, #0
	adds r2, #0x1c
	str r2, [sp, #0xc]
	adds r3, r7, #0
	adds r3, #0x1e
	str r3, [sp, #0x10]
	adds r4, r7, #0
	adds r4, #0x20
	str r4, [sp, #0x14]
	ldr r0, _0804876C @ =0xFFFFFF00
	mov sl, r0
_080486F6:
	ldr r0, [r7, #8]
	asrs r6, r0, #8
	mov r1, r8
	lsls r4, r1, #1
	adds r2, r4, r1
	lsls r2, r2, #1
	ldr r3, [sp, #0xc]
	adds r0, r3, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	ldr r1, _08048770 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #0xe
	adds r6, r6, r0
	ldr r0, [sp, #0x10]
	adds r5, r0, r2
	ldrh r0, [r5]
	lsls r0, r0, #1
	ldr r1, _08048770 @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #9
	adds r6, r6, r0
	adds r0, r6, #6
	movs r3, #0
	str r3, [sp]
	ldr r1, _08048768 @ =sub_801EE64
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	mov sb, r4
	cmp r0, #0
	ble _08048774
	ldrh r1, [r5]
	mov r4, sl
	adds r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r0, r2
	bls _0804878A
	adds r0, r1, #2
	b _0804878C
	.align 2, 0
_08048764: .4byte gUnknown_080D814A
_08048768: .4byte sub_801EE64
_0804876C: .4byte 0xFFFFFF00
_08048770: .4byte gSineTable
_08048774:
	ldrh r1, [r5]
	mov r3, sl
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0x80
	lsls r4, r4, #2
	cmp r0, r4
	bls _0804878A
	adds r0, r1, #2
	b _0804878C
_0804878A:
	subs r0, r1, #2
_0804878C:
	strh r0, [r5]
	mov r2, sb
	add r2, r8
	lsls r2, r2, #1
	ldr r0, [sp, #0x10]
	adds r3, r0, r2
	ldrh r0, [r3]
	ldr r4, _080487F4 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _080487F8 @ =gUnknown_080D8148
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r6, r0
	ldr r0, [sp, #0x14]
	adds r4, r0, r2
	ldrh r0, [r4]
	lsls r0, r0, #1
	ldr r1, _080487FC @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x32
	muls r0, r1, r0
	asrs r0, r0, #0xe
	adds r6, r6, r0
	movs r3, #0
	str r3, [sp]
	ldr r0, _08048800 @ =sub_801EE64
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #8]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	ble _08048804
	ldrh r1, [r4]
	mov r2, sl
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	bhi _0804881A
	subs r0, r1, #2
	b _0804881C
	.align 2, 0
_080487F4: .4byte 0x000003FF
_080487F8: .4byte gUnknown_080D8148
_080487FC: .4byte gSineTable
_08048800: .4byte sub_801EE64
_08048804:
	ldrh r1, [r4]
	mov r2, sl
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	bls _0804881A
	subs r0, r1, #2
	b _0804881C
_0804881A:
	adds r0, r1, #2
_0804881C:
	strh r0, [r4]
	mov r2, sb
	add r2, r8
	lsls r2, r2, #1
	ldr r4, [sp, #0x14]
	adds r2, r4, r2
	ldrh r0, [r2]
	ldr r3, _08048854 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bhi _08048842
	b _080486F6
_08048842:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048854: .4byte 0x000003FF

	thumb_func_start sub_8048858
sub_8048858: @ 0x08048858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	movs r1, #8
	rsbs r1, r1, #0
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _0804887C
	movs r2, #8
	str r2, [sp, #0xc]
_0804887C:
	movs r5, #0
	movs r3, #0x1c
	adds r3, r3, r4
	mov sl, r3
	movs r7, #0x1e
	adds r7, r7, r4
	mov sb, r7
	movs r0, #0x20
	adds r0, r0, r4
	mov r8, r0
	ldr r6, _08048910 @ =gSineTable
_08048892:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r2, _08048914 @ =gUnknown_080D8148
	ldrb r1, [r4, #0x18]
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #1
	mov r2, sl
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r7, #0
	ldrsh r2, [r1, r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	subs r1, r1, r2
	asrs r1, r1, #0xe
	adds r0, r0, r1
	mov r2, sb
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r7, #0
	ldrsh r1, [r1, r7]
	asrs r1, r1, #9
	adds r0, r0, r1
	add r3, r8
	ldrh r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #0x32
	muls r1, r2, r1
	asrs r1, r1, #0xe
	adds r0, r0, r1
	movs r1, #0
	str r1, [sp]
	ldr r1, _08048918 @ =sub_801EE64
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #1
	ldr r3, [sp, #0xc]
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bge _08048922
	ldr r2, [r4, #8]
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	beq _0804891C
	lsls r0, r1, #8
	subs r0, r2, r0
	b _08048920
	.align 2, 0
_08048910: .4byte gSineTable
_08048914: .4byte gUnknown_080D8148
_08048918: .4byte sub_801EE64
_0804891C:
	lsls r0, r1, #8
	adds r0, r2, r0
_08048920:
	str r0, [r4, #8]
_08048922:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08048892
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_804893C
sub_804893C: @ 0x0804893C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048998 @ =0x000023FF
	cmp r1, r0
	bls _08048970
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804899C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080489A0 @ =gUnknown_080D86D4
	ldr r0, [r0, #0xc]
	str r0, [r4, #0x60]
	ldr r1, _080489A4 @ =gUnknown_080D8710
	ldrb r0, [r1, #0xe]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0xf]
	strb r0, [r4, #0x19]
_08048970:
	ldr r1, [r4, #0x5c]
	ldr r0, _080489A8 @ =0x00001FFF
	cmp r1, r0
	bls _08048992
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0804898E
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #0
	bl sub_80493F8
	movs r0, #0
	strb r0, [r4, #0x17]
_0804898E:
	ldr r0, _080489AC @ =0x0000FC80
	strh r0, [r4, #0xe]
_08048992:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048998: .4byte 0x000023FF
_0804899C: .4byte 0x00000FFF
_080489A0: .4byte gUnknown_080D86D4
_080489A4: .4byte gUnknown_080D8710
_080489A8: .4byte 0x00001FFF
_080489AC: .4byte 0x0000FC80

	thumb_func_start sub_80489B0
sub_80489B0: @ 0x080489B0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	adds r5, r4, #0
	adds r5, #0x66
	ldrb r0, [r5]
	cmp r0, #0
	bne _080489D4
	ldr r1, [r4, #0x5c]
	ldr r0, _08048A04 @ =0x000035AC
	cmp r1, r0
	bls _080489D4
	ldr r0, _08048A08 @ =0x00000101
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r5]
_080489D4:
	ldr r1, [r4, #0x5c]
	ldr r0, _08048A0C @ =0x000043FF
	cmp r1, r0
	bls _08048A38
	ldr r0, _08048A08 @ =0x00000101
	bl m4aSongNumStart
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _08048A1C
	movs r0, #7
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048A10 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048A14 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x1c]
	str r0, [r4, #0x60]
	ldr r1, _08048A18 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1e]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1f]
	b _08048A36
	.align 2, 0
_08048A04: .4byte 0x000035AC
_08048A08: .4byte 0x00000101
_08048A0C: .4byte 0x000043FF
_08048A10: .4byte 0x00000FFF
_08048A14: .4byte gUnknown_080D86D4
_08048A18: .4byte gUnknown_080D8710
_08048A1C:
	movs r0, #5
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048A40 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048A44 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x60]
	ldr r1, _08048A48 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x16]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x17]
_08048A36:
	strb r0, [r4, #0x19]
_08048A38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048A40: .4byte 0x00000FFF
_08048A44: .4byte gUnknown_080D86D4
_08048A48: .4byte gUnknown_080D8710

	thumb_func_start sub_8048A4C
sub_8048A4C: @ 0x08048A4C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048ACC
	ldr r0, _08048A88 @ =gCourseTime
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08048A98
	movs r0, #0
	strb r0, [r4, #0x17]
	movs r0, #1
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048A8C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048A90 @ =gUnknown_080D86D4
	ldr r0, [r0, #4]
	str r0, [r4, #0x60]
	ldr r1, _08048A94 @ =gUnknown_080D8710
	ldrb r0, [r1, #6]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #7]
	b _08048AB8
	.align 2, 0
_08048A88: .4byte gCourseTime
_08048A8C: .4byte 0x00000FFF
_08048A90: .4byte gUnknown_080D86D4
_08048A94: .4byte gUnknown_080D8710
_08048A98:
	movs r0, #0xc
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048AC0 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048AC4 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x30]
	str r0, [r4, #0x60]
	ldr r0, _08048AC8 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x33
	ldrb r0, [r0]
_08048AB8:
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	b _08048AD0
	.align 2, 0
_08048AC0: .4byte 0x00000FFF
_08048AC4: .4byte gUnknown_080D86D4
_08048AC8: .4byte gUnknown_080D8710
_08048ACC:
	ldrh r0, [r4, #0xc]
	subs r0, #0xc
_08048AD0:
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8048AD8
sub_8048AD8: @ 0x08048AD8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048B3C @ =0x000023FF
	cmp r1, r0
	bls _08048B12
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xa
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048B40 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048B44 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x28]
	str r0, [r4, #0x60]
	ldr r0, _08048B48 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x2b
	ldrb r0, [r0]
	strb r0, [r4, #0x19]
_08048B12:
	ldr r1, [r4, #0x5c]
	ldr r0, _08048B4C @ =0x00001FFF
	cmp r1, r0
	bls _08048B36
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _08048B30
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #1
	bl sub_80493F8
	movs r0, #0
	strb r0, [r4, #0x17]
_08048B30:
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #0xe]
_08048B36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048B3C: .4byte 0x000023FF
_08048B40: .4byte 0x00000FFF
_08048B44: .4byte gUnknown_080D86D4
_08048B48: .4byte gUnknown_080D8710
_08048B4C: .4byte 0x00001FFF

	thumb_func_start sub_8048B50
sub_8048B50: @ 0x08048B50
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	adds r5, r4, #0
	adds r5, #0x66
	ldrb r0, [r5]
	cmp r0, #0
	bne _08048B74
	ldr r1, [r4, #0x5c]
	ldr r0, _08048BA4 @ =0x000035AC
	cmp r1, r0
	bls _08048B74
	ldr r0, _08048BA8 @ =0x00000101
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r5]
_08048B74:
	ldr r1, [r4, #0x5c]
	ldr r0, _08048BAC @ =0x000043FF
	cmp r1, r0
	bls _08048BDE
	ldr r0, _08048BA8 @ =0x00000101
	bl m4aSongNumStart
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _08048BBC
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048BB0 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048BB4 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08048BB8 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	b _08048BDC
	.align 2, 0
_08048BA4: .4byte 0x000035AC
_08048BA8: .4byte 0x00000101
_08048BAC: .4byte 0x000043FF
_08048BB0: .4byte 0x00000FFF
_08048BB4: .4byte gUnknown_080D86D4
_08048BB8: .4byte gUnknown_080D8710
_08048BBC:
	movs r0, #0xc
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048BE4 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048BE8 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x30]
	str r0, [r4, #0x60]
	ldr r0, _08048BEC @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x33
	ldrb r0, [r0]
_08048BDC:
	strb r0, [r4, #0x19]
_08048BDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048BE4: .4byte 0x00000FFF
_08048BE8: .4byte gUnknown_080D86D4
_08048BEC: .4byte gUnknown_080D8710

	thumb_func_start sub_8048BF0
sub_8048BF0: @ 0x08048BF0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048C70
	ldr r0, _08048C30 @ =gCourseTime
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08048C40
	movs r0, #0
	strb r0, [r4, #0x17]
	movs r0, #8
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048C34 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048C38 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x20]
	str r0, [r4, #0x60]
	ldr r0, _08048C3C @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x22
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x23
	ldrb r0, [r0]
	b _08048C5A
	.align 2, 0
_08048C30: .4byte gCourseTime
_08048C34: .4byte 0x00000FFF
_08048C38: .4byte gUnknown_080D86D4
_08048C3C: .4byte gUnknown_080D8710
_08048C40:
	movs r0, #5
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048C64 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048C68 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x60]
	ldr r1, _08048C6C @ =gUnknown_080D8710
	ldrb r0, [r1, #0x16]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x17]
_08048C5A:
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	b _08048C74
	.align 2, 0
_08048C64: .4byte 0x00000FFF
_08048C68: .4byte gUnknown_080D86D4
_08048C6C: .4byte gUnknown_080D8710
_08048C70:
	ldrh r0, [r4, #0xc]
	subs r0, #0xc
_08048C74:
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8048C7C
sub_8048C7C: @ 0x08048C7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x60]
	mov sb, r0
	adds r4, r7, #0
	adds r4, #0x28
	adds r2, r7, #0
	adds r2, #0x1c
	ldr r0, _08048D6C @ =gUnknown_080D8710
	ldrb r1, [r7, #0x1b]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	movs r1, #0
	str r1, [sp]
	ldr r5, [r7, #0x5c]
	lsrs r3, r5, #0xc
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _08048CB8
	movs r0, #1
	str r0, [sp]
_08048CB8:
	movs r1, #7
	mov r8, r1
	movs r0, #7
	ands r6, r0
	ldr r0, _08048D70 @ =0x00000FFF
	mov ip, r0
	mov r1, ip
	ands r1, r5
	mov ip, r1
	mov r0, r8
	ands r3, r0
	adds r1, r7, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	mov r5, r8
	ands r0, r5
	mov r8, r1
	cmp r3, r0
	beq _08048D18
	movs r5, #0
	adds r3, r4, #0
	lsls r1, r6, #1
_08048CE8:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r6, sb
	adds r6, #4
	mov sb, r6
	subs r6, #4
	ldm r6!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08048CE8
	adds r4, r3, #0
_08048D18:
	movs r5, #0
	mov r0, ip
	lsls r6, r0, #0x10
_08048D1E:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r6, #0x10
	str r2, [sp, #4]
	bl sub_80859F4
	ldr r2, [sp, #4]
	strh r0, [r2]
	adds r2, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08048D1E
	mov r1, r8
	ldrh r0, [r1]
	mov r5, sl
	subs r0, r0, r5
	movs r1, #0xe6
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sl
	mov r6, r8
	strh r0, [r6]
	ldrh r1, [r6]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	ldr r1, _08048D74 @ =0x00007FFF
	ands r0, r1
	str r0, [r7, #0x5c]
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048D6C: .4byte gUnknown_080D8710
_08048D70: .4byte 0x00000FFF
_08048D74: .4byte 0x00007FFF

	thumb_func_start sub_8048D78
sub_8048D78: @ 0x08048D78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0x68
	adds r0, r0, r6
	mov r8, r0
	ldrb r0, [r6, #0x14]
	subs r0, #1
	strb r0, [r6, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08048D9C
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08048DA2
_08048D9C:
	movs r0, #0xeb
	bl m4aSongNumStart
_08048DA2:
	movs r0, #0
	movs r1, #0x1e
	strb r1, [r6, #0x16]
	strb r0, [r6, #0x15]
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _08048E20
	ldr r0, _08048E08 @ =0x000002B6
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08048E0C @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08048E10 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08048E2C
	ldr r0, _08048E14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08048E2C
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08048E18 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08048DFE
	movs r0, #0xff
_08048DFE:
	strb r0, [r1]
	ldr r1, _08048E1C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08048E2C
	.align 2, 0
_08048E08: .4byte 0x000002B6
_08048E0C: .4byte gLevelScore
_08048E10: .4byte 0x0000C350
_08048E14: .4byte gGameMode
_08048E18: .4byte gNumLives
_08048E1C: .4byte gUnknown_030054A8
_08048E20:
	ldr r0, _08048E58 @ =0x000002B6
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_08048E2C:
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08048E5C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08048E4C
	ldrb r0, [r6, #0x14]
	cmp r0, #4
	bne _08048E4C
	ldr r1, _08048E60 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08048E4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048E58: .4byte 0x000002B6
_08048E5C: .4byte gCurrentLevel
_08048E60: .4byte gUnknown_030054A8

	thumb_func_start sub_8048E64
sub_8048E64: @ 0x08048E64
	push {lr}
	adds r3, r0, #0
	movs r1, #0
	ldrb r0, [r3, #0x16]
	cmp r0, #0
	beq _08048E7A
	subs r0, #1
	strb r0, [r3, #0x16]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048E90
_08048E7A:
	ldrb r0, [r3, #0x15]
	cmp r0, #0
	beq _08048E8C
	subs r0, #1
	strb r0, [r3, #0x15]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08048E8C
	movs r1, #1
_08048E8C:
	cmp r1, #0
	beq _08048EAC
_08048E90:
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	beq _08048EAC
	adds r1, r3, #0
	adds r1, #0x68
	movs r2, #0
	ldr r0, _08048EB0 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r3, #0
	adds r0, #0x88
	strb r2, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08048EAC:
	pop {r0}
	bx r0
	.align 2, 0
_08048EB0: .4byte 0x000002B6

	thumb_func_start sub_8048EB4
sub_8048EB4: @ 0x08048EB4
	ldr r2, _08048ED4 @ =gActiveBossTask
	ldr r2, [r2]
	ldrh r3, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r3, r3, r2
	ldr r2, [r3, #4]
	adds r2, r2, r0
	str r2, [r3, #4]
	ldr r2, [r3, #8]
	adds r2, r2, r1
	str r2, [r3, #8]
	ldr r1, [r3, #0x10]
	adds r1, r1, r0
	str r1, [r3, #0x10]
	bx lr
	.align 2, 0
_08048ED4: .4byte gActiveBossTask

	thumb_func_start Task_EggFrogMain
Task_EggFrogMain: @ 0x08048ED8
	push {r4, r5, lr}
	ldr r5, _08048F34 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r1, _08048F38 @ =gUnknown_080D874C
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_80492B8
	adds r0, r4, #0
	bl sub_804920C
	adds r0, r4, #0
	bl sub_8048E64
	adds r0, r4, #0
	bl sub_80480E8
	movs r0, #1
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_804931C
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	ldr r1, _08048F3C @ =0x0000012B
	cmp r0, r1
	bls _08048F2E
	movs r0, #0
	str r0, [r4]
	ldr r1, [r5]
	ldr r0, _08048F40 @ =sub_8047E28
	str r0, [r1, #8]
_08048F2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048F34: .4byte gCurTask
_08048F38: .4byte gUnknown_080D874C
_08048F3C: .4byte 0x0000012B
_08048F40: .4byte sub_8047E28

	thumb_func_start sub_8048F44
sub_8048F44: @ 0x08048F44
	push {lr}
	ldr r0, _08048F68 @ =gCurTask
	ldr r0, [r0]
	ldr r3, _08048F6C @ =gDispCnt
	ldrh r2, [r3]
	ldr r1, _08048F70 @ =0x0000FEFF
	ands r1, r2
	strh r1, [r3]
	ldr r3, _08048F74 @ =gUnknown_03005424
	ldrh r2, [r3]
	ldr r1, _08048F78 @ =0x0000FF7F
	ands r1, r2
	strh r1, [r3]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08048F68: .4byte gCurTask
_08048F6C: .4byte gDispCnt
_08048F70: .4byte 0x0000FEFF
_08048F74: .4byte gUnknown_03005424
_08048F78: .4byte 0x0000FF7F

	thumb_func_start sub_8048F7C
sub_8048F7C: @ 0x08048F7C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048FA0 @ =0x00001FFF
	cmp r1, r0
	bls _08048F98
	adds r0, r4, #0
	bl sub_80484C8
_08048F98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048FA0: .4byte 0x00001FFF

	thumb_func_start sub_8048FA4
sub_8048FA4: @ 0x08048FA4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048FE4 @ =0x000043FF
	cmp r1, r0
	bls _08048FDE
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x77
	strh r0, [r1]
	adds r0, #0x89
	bl m4aSongNumStart
	movs r0, #2
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048FE8 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048FEC @ =gUnknown_080D86D4
	ldr r0, [r0, #8]
	str r0, [r4, #0x60]
	ldr r1, _08048FF0 @ =gUnknown_080D8710
	ldrb r0, [r1, #0xa]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0xb]
	strb r0, [r4, #0x19]
_08048FDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048FE4: .4byte 0x000043FF
_08048FE8: .4byte 0x00000FFF
_08048FEC: .4byte gUnknown_080D86D4
_08048FF0: .4byte gUnknown_080D8710

	thumb_func_start sub_8048FF4
sub_8048FF4: @ 0x08048FF4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804900A
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ble _08049040
_0804900A:
	movs r0, #7
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049034 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049038 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x1c]
	str r0, [r4, #0x60]
	ldr r1, _0804903C @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1e]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1f]
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	str r0, [r4, #4]
	b _08049046
	.align 2, 0
_08049034: .4byte 0x00000FFF
_08049038: .4byte gUnknown_080D86D4
_0804903C: .4byte gUnknown_080D8710
_08049040:
	ldrh r0, [r4, #0xc]
	adds r0, #0xf
	strh r0, [r4, #0xc]
_08049046:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_804904C
sub_804904C: @ 0x0804904C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _0804908C @ =0x000023FF
	cmp r1, r0
	bls _08049084
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #1
	bl sub_80493F8
	movs r0, #0
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049090 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049094 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08049098 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	strb r0, [r4, #0x19]
_08049084:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804908C: .4byte 0x000023FF
_08049090: .4byte 0x00000FFF
_08049094: .4byte gUnknown_080D86D4
_08049098: .4byte gUnknown_080D8710

	thumb_func_start sub_804909C
sub_804909C: @ 0x0804909C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _080490C0 @ =0x00001FFF
	cmp r1, r0
	bls _080490B8
	adds r0, r4, #0
	bl sub_80484C8
_080490B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080490C0: .4byte 0x00001FFF

	thumb_func_start sub_80490C4
sub_80490C4: @ 0x080490C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _0804910C @ =0x000043FF
	cmp r1, r0
	bls _08049104
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x77
	strh r0, [r1]
	adds r0, #0x89
	bl m4aSongNumStart
	movs r0, #9
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049110 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049114 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x60]
	ldr r0, _08049118 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x27
	ldrb r0, [r0]
	strb r0, [r4, #0x19]
_08049104:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804910C: .4byte 0x000043FF
_08049110: .4byte 0x00000FFF
_08049114: .4byte gUnknown_080D86D4
_08049118: .4byte gUnknown_080D8710

	thumb_func_start sub_804911C
sub_804911C: @ 0x0804911C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049132
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ble _08049168
_08049132:
	movs r0, #0
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804915C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049160 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08049164 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	str r0, [r4, #4]
	b _0804916E
	.align 2, 0
_0804915C: .4byte 0x00000FFF
_08049160: .4byte gUnknown_080D86D4
_08049164: .4byte gUnknown_080D8710
_08049168:
	ldrh r0, [r4, #0xc]
	adds r0, #0xf
	strh r0, [r4, #0xc]
_0804916E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8049174
sub_8049174: @ 0x08049174
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _080491B4 @ =0x000023FF
	cmp r1, r0
	bls _080491AC
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #0
	bl sub_80493F8
	movs r0, #7
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _080491B8 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080491BC @ =gUnknown_080D86D4
	ldr r0, [r0, #0x1c]
	str r0, [r4, #0x60]
	ldr r1, _080491C0 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1e]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1f]
	strb r0, [r4, #0x19]
_080491AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080491B4: .4byte 0x000023FF
_080491B8: .4byte 0x00000FFF
_080491BC: .4byte gUnknown_080D86D4
_080491C0: .4byte gUnknown_080D8710

	thumb_func_start sub_80491C4
sub_80491C4: @ 0x080491C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080491FA
	movs r0, #0
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049200 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049204 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08049208 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	strb r0, [r4, #0x19]
_080491FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049200: .4byte 0x00000FFF
_08049204: .4byte gUnknown_080D86D4
_08049208: .4byte gUnknown_080D8710

	thumb_func_start sub_804920C
sub_804920C: @ 0x0804920C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #4]
	asrs r1, r1, #8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r2, _08049280 @ =gUnknown_080D8148
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r0, r2
	ldr r4, _08049284 @ =gSineTable
	ldrh r2, [r5, #0x22]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r6, #0
	ldrsh r3, [r2, r6]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	subs r2, r2, r3
	asrs r2, r2, #0xe
	adds r0, r0, r2
	ldrh r2, [r5, #0x24]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	asrs r2, r2, #9
	adds r0, r0, r2
	ldrh r2, [r5, #0x26]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r2, #0x32
	muls r2, r3, r2
	asrs r2, r2, #0xe
	adds r0, r0, r2
	movs r2, #0
	str r2, [sp]
	ldr r2, _08049288 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08049278
	lsls r1, r0, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
_08049278:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049280: .4byte gUnknown_080D8148
_08049284: .4byte gSineTable
_08049288: .4byte sub_801EE64

	thumb_func_start sub_804928C
sub_804928C: @ 0x0804928C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x68
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _080492AE
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _080492B4 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_080492AE:
	pop {r0}
	bx r0
	.align 2, 0
_080492B4: .4byte 0x000002B6

	thumb_func_start sub_80492B8
sub_80492B8: @ 0x080492B8
	push {lr}
	adds r2, r0, #0
	ldr r1, _080492E4 @ =gUnknown_080D814A
	ldrb r0, [r2, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r2, #0xe]
	adds r1, r0, r3
	strh r1, [r2, #0xe]
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _080492E8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb0
	lsls r1, r1, #2
	cmp r0, r1
	ble _080492F4
	b _080492F2
	.align 2, 0
_080492E4: .4byte gUnknown_080D814A
_080492E8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08049318 @ =0xFFFFFD40
	cmp r0, r1
	bge _080492F4
_080492F2:
	strh r1, [r2, #0xe]
_080492F4:
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #0x10]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08049318: .4byte 0xFFFFFD40

	thumb_func_start sub_804931C
sub_804931C: @ 0x0804931C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrb r0, [r5, #0x16]
	ldr r6, _08049374 @ =gFlags
	cmp r0, #0
	beq _08049360
	movs r4, #0
	ldr r0, _08049378 @ =gBgPalette
	mov r8, r0
	ldr r7, _0804937C @ =gUnknown_080D8796
	movs r0, #2
	mov ip, r0
_08049338:
	adds r3, r4, #0
	adds r3, #0xb0
	lsls r3, r3, #1
	add r3, r8
	lsls r1, r4, #1
	ldrb r2, [r5, #0x16]
	mov r0, ip
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08049338
_08049360:
	ldr r0, [r6]
	movs r1, #1
	orrs r0, r1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049374: .4byte gFlags
_08049378: .4byte gBgPalette
_0804937C: .4byte gUnknown_080D8796

	thumb_func_start TaskDestructor_EggFrogMain
TaskDestructor_EggFrogMain: @ 0x08049380
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _080493D8 @ =IWRAM_START + 0x1E8
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493DC @ =IWRAM_START + 0x9C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493E0 @ =IWRAM_START + 0xCC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493E4 @ =IWRAM_START + 0xFC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493E8 @ =IWRAM_START + 0x12C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493EC @ =IWRAM_START + 0x15C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _080493F0 @ =IWRAM_START + 0x18C
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _080493F4 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080493D8: .4byte IWRAM_START + 0x1E8
_080493DC: .4byte IWRAM_START + 0x9C
_080493E0: .4byte IWRAM_START + 0xCC
_080493E4: .4byte IWRAM_START + 0xFC
_080493E8: .4byte IWRAM_START + 0x12C
_080493EC: .4byte IWRAM_START + 0x15C
_080493F0: .4byte IWRAM_START + 0x18C
_080493F4: .4byte gActiveBossTask

	thumb_func_start sub_80493F8
sub_80493F8: @ 0x080493F8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sl, r0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080494CC @ =sub_80494EC
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	ldr r1, _080494D0 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r0, r5, r0
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [r2]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, r8
	subs r0, r1, r0
	str r0, [r2, #4]
	movs r0, #0
	mov ip, r0
	strh r4, [r2, #8]
	strh r6, [r2, #0xa]
	mov r1, sb
	strb r1, [r2, #0xc]
	mov r0, sl
	str r0, [r2, #0x10]
	ldr r1, _080494D4 @ =IWRAM_START + 0x14
	adds r4, r3, r1
	asrs r5, r5, #8
	strh r5, [r4, #0x16]
	mov r0, r8
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #0xf4
	lsls r1, r1, #1
	add sl, r1
	mov r1, sl
	ldr r0, [r1]
	str r0, [r4, #4]
	ldr r0, _080494D8 @ =0x000002BA
	strh r0, [r4, #0xa]
	ldr r1, _080494DC @ =IWRAM_START + 0x34
	adds r0, r3, r1
	mov r1, ip
	strb r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _080494E0 @ =IWRAM_START + 0x35
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080494E4 @ =IWRAM_START + 0x36
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080494E8 @ =IWRAM_START + 0x39
	adds r3, r3, r1
	mov r0, ip
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r1, #0xc0
	lsls r1, r1, #6
	str r1, [r4, #0x10]
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _080494BC
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r1
	str r0, [r4, #0x10]
_080494BC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080494CC: .4byte sub_80494EC
_080494D0: .4byte gCamera
_080494D4: .4byte IWRAM_START + 0x14
_080494D8: .4byte 0x000002BA
_080494DC: .4byte IWRAM_START + 0x34
_080494E0: .4byte IWRAM_START + 0x35
_080494E4: .4byte IWRAM_START + 0x36
_080494E8: .4byte IWRAM_START + 0x39

	thumb_func_start sub_80494EC
sub_80494EC: @ 0x080494EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08049510 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r6, r1, r0
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	bne _08049514
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	b _08049518
	.align 2, 0
_08049510: .4byte gCurTask
_08049514:
	ldrh r0, [r4, #0xa]
	subs r0, #0x20
_08049518:
	strh r0, [r4, #0xa]
	ldr r0, _08049540 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08049548
	movs r2, #8
	ldrsh r1, [r4, r2]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, _08049544 @ =gCamera
	mov r8, r0
	b _0804956C
	.align 2, 0
_08049540: .4byte gPlayer
_08049544: .4byte gCamera
_08049548:
	movs r2, #8
	ldrsh r1, [r4, r2]
	ldr r2, _080495B8 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	mov r8, r2
_0804956C:
	movs r3, #8
	rsbs r3, r3, #0
	cmp r5, #0
	bne _08049576
	movs r3, #8
_08049576:
	ldr r1, [r4]
	asrs r1, r1, #8
	mov r2, r8
	ldr r0, [r2]
	adds r1, r1, r0
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	adds r0, r0, r2
	movs r7, #0
	str r7, [sp]
	ldr r2, _080495BC @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bge _080495DC
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	strh r7, [r4, #0xa]
	ldr r1, [r4, #4]
	cmp r5, #0
	bne _080495C0
	lsls r0, r2, #8
	adds r0, r1, r0
	b _080495C4
	.align 2, 0
_080495B8: .4byte gCamera
_080495BC: .4byte sub_801EE64
_080495C0:
	lsls r0, r2, #8
	subs r0, r1, r0
_080495C4:
	str r0, [r4, #4]
	movs r0, #0x3d
	strb r0, [r4, #0xd]
	ldr r0, _080495D4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080495D8 @ =sub_8049658
	str r0, [r1, #8]
	b _08049642
	.align 2, 0
_080495D4: .4byte gCurTask
_080495D8: .4byte sub_8049658
_080495DC:
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _08049636
	ldr r1, [r4]
	asrs r1, r1, #8
	mov r2, r8
	ldr r0, [r2]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r3, r8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	ldr r0, _08049650 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _08049636
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _08049636
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _08049654 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0x88
	strb r3, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08049636:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_08049642:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049650: .4byte gPlayer
_08049654: .4byte 0x000002B6

	thumb_func_start sub_8049658
sub_8049658: @ 0x08049658
	push {r4, lr}
	ldr r2, _08049684 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08049688 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _0804968C
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _080496A8
	.align 2, 0
_08049684: .4byte gCurTask
_08049688: .4byte gPlayer
_0804968C:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, _080496C4 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_080496A8:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrb r0, [r4, #0xd]
	subs r1, r0, #1
	strb r1, [r4, #0xd]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _080496C8
	ldr r0, [r3]
	bl TaskDestroy
	b _080496F0
	.align 2, 0
_080496C4: .4byte gCamera
_080496C8:
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _080496F0
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r2, _080496F8 @ =gCamera
	ldr r0, [r2]
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, [r2, #4]
	lsls r0, r0, #8
	ldr r2, [r4, #4]
	adds r2, r2, r0
	ldr r0, [r4, #0x10]
	ldrb r3, [r4, #0xc]
	bl sub_80496FC
_080496F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080496F8: .4byte gCamera

	thumb_func_start sub_80496FC
sub_80496FC: @ 0x080496FC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080497C0 @ =Task_80497E0
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r3, _080497C4 @ =gCamera
	ldr r0, [r3]
	lsls r0, r0, #8
	subs r4, r4, r0
	str r4, [r1]
	ldr r0, [r3, #4]
	lsls r0, r0, #8
	subs r5, r5, r0
	str r5, [r1, #4]
	movs r3, #0
	strh r6, [r1, #8]
	strh r6, [r1, #0xa]
	movs r0, #0x2e
	strb r0, [r1, #0xd]
	mov r0, r8
	str r0, [r1, #0x10]
	ldr r0, _080497C8 @ =IWRAM_START + 0x14
	adds r5, r2, r0
	asrs r4, r4, #8
	strh r4, [r5, #0x16]
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	movs r1, #0xf4
	lsls r1, r1, #1
	add r8, r1
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xc0
	str r0, [r5, #4]
	ldr r0, _080497CC @ =0x000002BB
	strh r0, [r5, #0xa]
	ldr r1, _080497D0 @ =IWRAM_START + 0x34
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _080497D4 @ =IWRAM_START + 0x35
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080497D8 @ =IWRAM_START + 0x36
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080497DC @ =IWRAM_START + 0x39
	adds r2, r2, r1
	strb r3, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r5, #0x10]
	mov r0, sb
	cmp r0, #0
	beq _080497B0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r1
	str r0, [r5, #0x10]
_080497B0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080497C0: .4byte Task_80497E0
_080497C4: .4byte gCamera
_080497C8: .4byte IWRAM_START + 0x14
_080497CC: .4byte 0x000002BB
_080497D0: .4byte IWRAM_START + 0x34
_080497D4: .4byte IWRAM_START + 0x35
_080497D8: .4byte IWRAM_START + 0x36
_080497DC: .4byte IWRAM_START + 0x39

	thumb_func_start Task_80497E0
Task_80497E0: @ 0x080497E0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08049814 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r2, _08049818 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	adds r7, r2, #0
	cmp r1, #0
	beq _0804981C
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08049838
	.align 2, 0
_08049814: .4byte gCurTask
_08049818: .4byte gPlayer
_0804981C:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, _08049854 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08049838:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r6, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049858
	ldr r0, [r3]
	bl TaskDestroy
	b _080498BC
	.align 2, 0
_08049854: .4byte gCamera
_08049858:
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _080498B0
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _080498C4 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r7, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _080498B0
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _080498B0
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _080498C8 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0x88
	strb r3, [r0]
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
_080498B0:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080498BC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080498C4: .4byte gCamera
_080498C8: .4byte 0x000002B6

	thumb_func_start sub_80498CC
sub_80498CC: @ 0x080498CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080499B4 @ =sub_80499D8
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _080499B8 @ =sub_8049D1C
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r0, #0
	strb r4, [r6, #4]
	strb r0, [r6, #5]
	strb r0, [r6, #6]
	ldr r1, _080499BC @ =gUnknown_080D5964
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6]
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r3, r1, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6, #2]
	ldr r2, _080499C0 @ =gUnknown_03005440
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, _080499C4 @ =gUnknown_030054BC
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r4, #0
	beq _080499AC
	bl Player_DisableInputAndBossTimer
	ldr r3, _080499C8 @ =gPlayer
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	ldr r1, _080499CC @ =gUnknown_080D87E6
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r2, [r3, #8]
	asrs r0, r2, #8
	subs r5, r5, r0
	lsls r0, r4, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r3, #0xc]
	asrs r0, r1, #8
	subs r4, r4, r0
	lsls r7, r5, #8
	adds r2, r2, r7
	str r2, [r3, #8]
	lsls r2, r4, #8
	adds r1, r1, r2
	str r1, [r3, #0xc]
	ldr r1, _080499D0 @ =gCamera
	ldr r0, [r1]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #0x14]
	ldr r0, _080499D4 @ =gCheese
	ldr r1, [r0]
	cmp r1, #0
	beq _080499A6
	ldr r0, [r1]
	adds r0, r0, r7
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
_080499A6:
	ldrb r0, [r6, #4]
	subs r0, #1
	strb r0, [r6, #4]
_080499AC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080499B4: .4byte sub_80499D8
_080499B8: .4byte sub_8049D1C
_080499BC: .4byte gUnknown_080D5964
_080499C0: .4byte gUnknown_03005440
_080499C4: .4byte gUnknown_030054BC
_080499C8: .4byte gPlayer
_080499CC: .4byte gUnknown_080D87E6
_080499D0: .4byte gCamera
_080499D4: .4byte gCheese

	thumb_func_start sub_80499D8
sub_80499D8: @ 0x080499D8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08049A64 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldrb r0, [r7, #4]
	cmp r0, #6
	bls _080499EE
	b _08049C4C
_080499EE:
	cmp r0, #6
	beq _080499F4
	b _08049BAC
_080499F4:
	ldr r1, _08049A68 @ =gUnknown_03005440
	ldr r2, _08049A6C @ =gUnknown_080D5964
	ldrh r0, [r2, #0x1c]
	strh r0, [r1]
	ldr r1, _08049A70 @ =gUnknown_030054BC
	ldrh r0, [r2, #0x1e]
	strh r0, [r1]
	ldr r1, _08049A74 @ =gPlayer
	ldr r2, [r1, #8]
	ldr r0, _08049A78 @ =0x00A7CFFF
	adds r3, r1, #0
	cmp r2, r0
	bgt _08049A96
	ldr r0, _08049A7C @ =gUnknown_080D8808
	ldr r0, [r0, #0x30]
	adds r0, #0x1e
	lsls r0, r0, #8
	cmp r2, r0
	ble _08049A96
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r3, #0x20]
	movs r2, #0
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x5e
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #0x38
	strb r2, [r0]
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	subs r0, #0x78
	ldr r1, _08049A80 @ =gCamera
	ldr r2, [r1]
	cmp r0, r2
	bne _08049A4C
	b _08049C4C
_08049A4C:
	cmp r0, r2
	ble _08049A84
	ldr r0, [r1, #0x20]
	adds r0, #1
	str r0, [r1, #0x20]
	adds r0, r2, #1
	str r0, [r1]
	ldr r0, [r1, #0x10]
	adds r0, #1
	str r0, [r1, #0x10]
	b _08049C4C
	.align 2, 0
_08049A64: .4byte gCurTask
_08049A68: .4byte gUnknown_03005440
_08049A6C: .4byte gUnknown_080D5964
_08049A70: .4byte gUnknown_030054BC
_08049A74: .4byte gPlayer
_08049A78: .4byte 0x00A7CFFF
_08049A7C: .4byte gUnknown_080D8808
_08049A80: .4byte gCamera
_08049A84:
	ldr r0, [r1, #0x20]
	subs r0, #1
	str r0, [r1, #0x20]
	subs r0, r2, #1
	str r0, [r1]
	ldr r0, [r1, #0x10]
	subs r0, #1
	str r0, [r1, #0x10]
	b _08049C4C
_08049A96:
	ldr r1, [r3, #8]
	ldr r0, _08049ADC @ =0x00A6CBFF
	cmp r1, r0
	bgt _08049AF4
	ldr r0, _08049AE0 @ =gUnknown_080D8808
	ldr r0, [r0, #0x30]
	adds r0, #0x14
	lsls r0, r0, #8
	cmp r1, r0
	ble _08049AF4
	ldr r0, _08049AE4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08049AB4
	b _08049C4C
_08049AB4:
	ldr r4, _08049AE8 @ =gUnknown_03005424
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049AC4
	b _08049C4C
_08049AC4:
	ldr r0, _08049AEC @ =gCourseTime
	ldr r0, [r0]
	str r0, [r3, #0x78]
	movs r0, #7
	bl CreateZoneBoss
	ldrh r1, [r4]
	ldr r0, _08049AF0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r4]
	b _08049C4C
	.align 2, 0
_08049ADC: .4byte 0x00A6CBFF
_08049AE0: .4byte gUnknown_080D8808
_08049AE4: .4byte gActiveBossTask
_08049AE8: .4byte gUnknown_03005424
_08049AEC: .4byte gCourseTime
_08049AF0: .4byte 0x0000FFFD
_08049AF4:
	adds r2, r3, #0
	ldr r5, [r2, #8]
	ldr r0, _08049B1C @ =0x00A7D000
	cmp r5, r0
	ble _08049B24
	ldr r0, [r2, #0x20]
	ldr r1, _08049B20 @ =0xF7FFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x6d
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r7, #4]
	adds r0, #1
	strb r0, [r7, #4]
	strb r1, [r7, #6]
	b _08049C4C
	.align 2, 0
_08049B1C: .4byte 0x00A7D000
_08049B20: .4byte 0xF7FFFFFF
_08049B24:
	ldr r0, _08049B90 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08049B2E
	b _08049C4C
_08049B2E:
	ldr r0, _08049B94 @ =0x00A53BFF
	cmp r5, r0
	ble _08049B36
	b _08049C4C
_08049B36:
	ldr r4, _08049B98 @ =gUnknown_080D8808
	ldrb r0, [r7, #4]
	lsls r2, r0, #3
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	bge _08049B46
	b _08049C4C
_08049B46:
	lsls r0, r1, #8
	cmp r5, r0
	bge _08049B4E
	b _08049C4C
_08049B4E:
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r4, [r0]
	lsls r6, r4, #8
	adds r0, r5, r6
	str r0, [r3, #8]
	ldr r0, _08049B9C @ =gUnknown_030054FC
	str r6, [r0]
	ldrb r1, [r7, #4]
	adds r0, r6, #0
	bl sub_8039F50
	ldr r1, _08049BA0 @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08049BA4 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r4
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r4
	str r0, [r1, #0x10]
	ldr r0, _08049BA8 @ =gCheese
	ldr r1, [r0]
	cmp r1, #0
	beq _08049C4C
	ldr r0, [r1]
	adds r0, r0, r6
	b _08049C4A
	.align 2, 0
_08049B90: .4byte gActiveBossTask
_08049B94: .4byte 0x00A53BFF
_08049B98: .4byte gUnknown_080D8808
_08049B9C: .4byte gUnknown_030054FC
_08049BA0: .4byte gBossRingsShallRespawn
_08049BA4: .4byte gCamera
_08049BA8: .4byte gCheese
_08049BAC:
	cmp r0, #5
	bhi _08049C4C
	ldr r6, _08049C84 @ =gCamera
	ldr r0, _08049C88 @ =gUnknown_080D87D8
	ldrb r1, [r7, #4]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x10]
	ldrh r1, [r1]
	cmp r0, r1
	ble _08049BEE
	ldr r1, _08049C8C @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08049C90 @ =gBossRingsRespawnCount
	movs r0, #0xa @ BOSS_RINGS_DEFAULT_RESPAWN_COUNT
	strb r0, [r1]
	ldr r1, _08049C94 @ =gPlayer
	ldr r0, _08049C98 @ =gCourseTime
	ldr r0, [r0]
	str r0, [r1, #0x78]
	ldrb r0, [r7, #4]
	adds r0, #1
	strb r0, [r7, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CreateZoneBoss
	ldr r2, _08049C9C @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08049CA0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
_08049BEE:
	ldr r4, _08049CA4 @ =gUnknown_080D8808
	ldrb r0, [r7, #4]
	lsls r2, r0, #3
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	blt _08049C4C
	ldr r0, _08049CA8 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08049C4C
	ldr r3, _08049C94 @ =gPlayer
	lsls r0, r1, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	blt _08049C4C
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r4, [r0]
	lsls r5, r4, #8
	adds r0, r1, r5
	str r0, [r3, #8]
	ldr r0, _08049CAC @ =gUnknown_030054FC
	str r5, [r0]
	ldrb r1, [r7, #4]
	adds r0, r5, #0
	bl sub_8039F50
	ldr r1, _08049C8C @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	ldr r0, [r6, #0x20]
	adds r0, r0, r4
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x10]
	adds r0, r0, r4
	str r0, [r6, #0x10]
	ldr r0, _08049CB0 @ =gCheese
	ldr r1, [r0]
	cmp r1, #0
	beq _08049C4C
	ldr r0, [r1]
	adds r0, r0, r5
_08049C4A:
	str r0, [r1]
_08049C4C:
	ldrb r0, [r7, #5]
	cmp r0, #6
	bhi _08049CC0
	ldr r3, _08049C84 @ =gCamera
	ldr r1, _08049C88 @ =gUnknown_080D87D8
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08049CB4 @ =0xFFFFFDA8
	adds r0, r0, r1
	ldr r1, [r3, #0x10]
	cmp r1, r0
	ble _08049CC0
	cmp r2, #6
	bne _08049CBC
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _08049C7C
	movs r0, #1
	str r0, [r3, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #3
	str r0, [r3, #8]
_08049C7C:
	ldr r1, _08049CB8 @ =gUnknown_030054B0
	movs r0, #1
	strb r0, [r1]
	b _08049CC0
	.align 2, 0
_08049C84: .4byte gCamera
_08049C88: .4byte gUnknown_080D87D8
_08049C8C: .4byte gBossRingsShallRespawn
_08049C90: .4byte gBossRingsRespawnCount
_08049C94: .4byte gPlayer
_08049C98: .4byte gCourseTime
_08049C9C: .4byte gUnknown_03005424
_08049CA0: .4byte 0x0000FFFD
_08049CA4: .4byte gUnknown_080D8808
_08049CA8: .4byte gActiveBossTask
_08049CAC: .4byte gUnknown_030054FC
_08049CB0: .4byte gCheese
_08049CB4: .4byte 0xFFFFFDA8
_08049CB8: .4byte gUnknown_030054B0
_08049CBC:
	adds r0, r2, #1
	strb r0, [r7, #5]
_08049CC0:
	ldr r0, _08049CDC @ =gUnknown_080D5964
	ldrb r2, [r7, #5]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrh r3, [r7]
	adds r5, r3, #0
	ldrh r4, [r1]
	adds r6, r0, #0
	cmp r5, r4
	beq _08049CE4
	cmp r5, r4
	bhs _08049CE0
	adds r0, r3, #1
	b _08049CE2
	.align 2, 0
_08049CDC: .4byte gUnknown_080D5964
_08049CE0:
	subs r0, r3, #1
_08049CE2:
	strh r0, [r7]
_08049CE4:
	lsls r1, r2, #2
	adds r0, r6, #2
	adds r1, r1, r0
	ldrh r2, [r7, #2]
	adds r3, r2, #0
	ldrh r0, [r1]
	cmp r3, r0
	beq _08049D00
	cmp r3, r0
	bhs _08049CFC
	adds r0, r2, #1
	b _08049CFE
_08049CFC:
	subs r0, r2, #1
_08049CFE:
	strh r0, [r7, #2]
_08049D00:
	ldr r1, _08049D14 @ =gUnknown_03005440
	ldrh r0, [r7]
	strh r0, [r1]
	ldr r1, _08049D18 @ =gUnknown_030054BC
	ldrh r0, [r7, #2]
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049D14: .4byte gUnknown_03005440
_08049D18: .4byte gUnknown_030054BC

	thumb_func_start sub_8049D1C
sub_8049D1C: @ 0x08049D1C
	bx lr
	.align 2, 0

	thumb_func_start sub_8049D20
sub_8049D20: @ 0x08049D20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08049E74 @ =sub_8049E90
	movs r1, #0xb2
	lsls r1, r1, #1
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r3, _08049E78 @ =sub_804A6B4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r2, _08049E7C @ =IWRAM_START + 0x15D
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _08049E80 @ =IWRAM_START + 0x120
	adds r1, r0, r3
	str r4, [r1]
	adds r3, #0x40
	adds r1, r0, r3
	str r5, [r1]
	subs r3, #2
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _08049E84 @ =IWRAM_START + 0x15F
	adds r0, r0, r1
	strb r2, [r0]
	movs r0, #0x2f
	bl VramMalloc
	str r0, [sp, #4]
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r5, #0
	ldr r3, _08049E88 @ =gUnknown_080D8840
	mov sb, r3
	movs r0, #4
	add r0, sb
	mov sl, r0
	movs r6, #0
_08049D8A:
	lsls r2, r5, #3
	movs r3, #0x92
	lsls r3, r3, #1
	adds r1, r7, r3
	adds r1, r1, r2
	mov r3, sb
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r7, r0
	adds r1, r1, r2
	mov r3, sl
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r2
	str r6, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r2
	str r6, [r0]
	lsls r3, r5, #1
	movs r0, #0xaa
	lsls r0, r0, #1
	adds r2, r7, r0
	adds r2, r2, r3
	adds r0, r5, #2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r2]
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r5
	strb r6, [r0]
	movs r4, #0
	adds r2, r5, #1
	mov r8, r2
	adds r3, r3, r5
	lsls r3, r3, #5
	adds r5, r7, r3
_08049DF2:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r2, r5, r0
	movs r0, #0x50
	strh r0, [r2, #0x16]
	strh r0, [r2, #0x18]
	lsls r0, r4, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _08049E8C @ =gUnknown_080D8864
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r6, [r2, #8]
	strh r6, [r2, #0x14]
	strh r6, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08049DF2
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08049D8A
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049E74: .4byte sub_8049E90
_08049E78: .4byte sub_804A6B4
_08049E7C: .4byte IWRAM_START + 0x15D
_08049E80: .4byte IWRAM_START + 0x120
_08049E84: .4byte IWRAM_START + 0x15F
_08049E88: .4byte gUnknown_080D8840
_08049E8C: .4byte gUnknown_080D8864

	thumb_func_start sub_8049E90
sub_8049E90: @ 0x08049E90
	push {r4, r5, r6, lr}
	ldr r0, _08049EB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _08049EB4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08049EB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08049F08
	.align 2, 0
_08049EB0: .4byte gCurTask
_08049EB4: .4byte gActiveBossTask
_08049EB8:
	movs r4, #0
	ldr r6, _08049F10 @ =gUnknown_080D8874
_08049EBC:
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08049EBC
	ldr r1, _08049F14 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	cmp r0, #0x84
	bgt _08049EEE
	adds r0, r1, #0
	bl sub_800CBA4
_08049EEE:
	ldr r2, _08049F18 @ =0x0000015F
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08049F08
	adds r2, #1
	adds r0, r5, r2
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08049F08
	movs r0, #1
	strb r0, [r1]
_08049F08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049F10: .4byte gUnknown_080D8874
_08049F14: .4byte gPlayer
_08049F18: .4byte 0x0000015F

	thumb_func_start sub_8049F1C
sub_8049F1C: @ 0x08049F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r0, r8
	lsls r0, r0, #1
	str r0, [sp]
	add r0, r8
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov sl, r0
	mov r1, r8
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	mov sb, r0
	ldr r6, _0804A060 @ =0x0000015F
	add r6, ip
	ldrb r0, [r6]
	cmp r0, #0
	bne _08049F62
	str r0, [r2]
_08049F62:
	ldr r2, [r2]
	add sb, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r4, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r5, r0, #8
	ldr r1, _0804A064 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r6]
	cmp r0, #0
	bne _08049FD6
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r6, r0, r1
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08049FD6
	ldr r3, _0804A068 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r6]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_08049FD6:
	ldr r0, _0804A06C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0804A008
	ldr r0, [r6, #0x3c]
	cmp r0, r7
	bne _0804A008
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	add r0, sb
	str r0, [r6, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A008
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
_0804A008:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A036
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A036
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
_0804A036:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r1, sl
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, sl
	bl DisplaySprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A060: .4byte 0x0000015F
_0804A064: .4byte gCamera
_0804A068: .4byte gUnknown_080D8858
_0804A06C: .4byte gPlayer

	thumb_func_start sub_804A070
sub_804A070: @ 0x0804A070
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #5
	adds r6, r5, r0
	movs r0, #0x30
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _0804A1A8 @ =0x0000015F
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A0A8
	lsls r0, r7, #3
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	adds r1, r1, r0
	ldr r0, _0804A1AC @ =0xFFFFF800
	str r0, [r1]
_0804A0A8:
	lsls r2, r7, #3
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov ip, r1
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov sl, r0
	mov r0, ip
	ldr r0, [r0]
	mov sb, r0
	mov r1, sl
	ldr r0, [r1]
	add r0, sb
	asrs r0, r0, #8
	mov ip, r0
	mov r3, ip
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov sb, r1
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov r2, sb
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r2, r1, #8
	adds r4, r2, #0
	ldr r1, _0804A1B0 @ =gCamera
	ldr r0, [r1]
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	subs r0, r4, r0
	strh r0, [r6, #0x18]
	ldr r4, _0804A1B4 @ =gPlayer
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0804A136
	str r4, [sp]
	str r1, [sp, #4]
	adds r0, r6, #0
	mov r1, ip
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	beq _0804A136
	ldr r0, [r4, #0xc]
	ldr r1, _0804A1AC @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldr r0, _0804A1B8 @ =0x0000FC80
	strh r0, [r4, #0x12]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r1, #9
	movs r0, #6
	strb r0, [r1]
_0804A136:
	ldr r2, _0804A1A8 @ =0x0000015F
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A17E
	movs r0, #0x84
	lsls r0, r0, #1
	bl m4aSongNumStart
	lsls r1, r7, #1
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A17E
	ldr r3, _0804A1BC @ =gUnknown_080D8858
	movs r0, #0xad
	lsls r0, r0, #1
	adds r2, r5, r0
	adds r2, r2, r7
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A17E:
	adds r0, r6, #0
	bl DisplaySprite
	ldrh r0, [r6, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1A8: .4byte 0x0000015F
_0804A1AC: .4byte 0xFFFFF800
_0804A1B0: .4byte gCamera
_0804A1B4: .4byte gPlayer
_0804A1B8: .4byte 0x0000FC80
_0804A1BC: .4byte gUnknown_080D8858

	thumb_func_start sub_804A1C0
sub_804A1C0: @ 0x0804A1C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #5
	add r0, r8
	mov sb, r0
	adds r0, #0x30
	str r0, [sp, #0x20]
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	str r0, [sp, #0x24]
	ldr r7, _0804A378 @ =0x0000015F
	add r7, r8
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A200
	ldr r0, _0804A37C @ =0xFFFFF800
	str r0, [r2]
_0804A200:
	ldr r2, [r2]
	ldr r1, [sp, #0x24]
	adds r1, r1, r2
	str r1, [sp, #0x24]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, r8
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A380 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r2, #0x18]
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A2EC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x3c
	beq _0804A258
	str r4, [sp, #0x28]
	cmp r0, #0x32
	bne _0804A2B6
_0804A258:
	movs r7, #0
	str r4, [sp, #0x28]
	adds r3, r6, #0
	subs r3, #0x10
	str r3, [sp, #0x2c]
	mov r4, sp
	movs r2, #0
_0804A266:
	lsls r0, r7, #6
	ldr r1, _0804A384 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r0, r0, r5
	subs r0, #0x14
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r4, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	movs r0, #0x30
	strh r0, [r4, #0x1c]
	adds r0, #0xd0
	strh r0, [r4, #0xe]
	adds r0, #0x20
	add r0, r8
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _0804A388 @ =0x000002C3
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	str r2, [sp, #4]
	mov r0, sp
	ldr r1, _0804A38C @ =0x0000015D
	add r1, r8
	str r2, [sp, #0x30]
	bl CreateBossParticleStatic
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [sp, #0x30]
	cmp r7, #7
	bls _0804A266
_0804A2B6:
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	ldr r2, [sp, #0x28]
	adds r4, r0, r2
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A2EC
	ldr r3, _0804A390 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, r8
	add r2, sl
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A2EC:
	ldr r0, _0804A394 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A320
	ldr r0, [r4, #0x3c]
	cmp r0, sb
	bne _0804A320
	ldr r0, [r4, #0xc]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A320
	ldr r0, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #8]
_0804A320:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A34E
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A34E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A34E:
	mov r0, sb
	bl DisplaySprite
	mov r2, sb
	ldrh r0, [r2, #0x16]
	ldr r3, [sp, #0x20]
	strh r0, [r3, #0x16]
	ldrh r0, [r2, #0x18]
	adds r0, #0x40
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x20]
	bl DisplaySprite
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A378: .4byte 0x0000015F
_0804A37C: .4byte 0xFFFFF800
_0804A380: .4byte gCamera
_0804A384: .4byte gSineTable
_0804A388: .4byte 0x000002C3
_0804A38C: .4byte 0x0000015D
_0804A390: .4byte gUnknown_080D8858
_0804A394: .4byte gPlayer

	thumb_func_start sub_804A398
sub_804A398: @ 0x0804A398
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	mov sl, r0
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r4, #0x30
	adds r4, r4, r7
	mov r8, r4
	mov r0, sb
	lsls r3, r0, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	str r1, [sp, #0xc]
	rsbs r4, r1, #0
	str r4, [sp]
	ldr r0, _0804A528 @ =0x0000015F
	add r0, ip
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A406
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r4, _0804A52C @ =gSineTable
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #7
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	str r0, [r2]
_0804A406:
	ldr r2, [r2]
	ldr r4, [sp]
	adds r4, r4, r2
	str r4, [sp]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A530 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804A480
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	mov r1, sl
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A480
	ldr r3, _0804A534 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A480:
	ldr r0, _0804A538 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A4B8
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A4B8
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A4B8
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A4B8:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A4E6
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A4E6
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A4E6:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r4, r8
	strh r0, [r4, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A528: .4byte 0x0000015F
_0804A52C: .4byte gSineTable
_0804A530: .4byte gCamera
_0804A534: .4byte gUnknown_080D8858
_0804A538: .4byte gPlayer

	thumb_func_start sub_804A53C
sub_804A53C: @ 0x0804A53C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	str r0, [sp]
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	mov r1, sb
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	rsbs r0, r1, #0
	mov sl, r0
	ldr r4, _0804A6A4 @ =0x0000015F
	add r4, ip
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A588
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r2]
_0804A588:
	ldr r2, [r2]
	add sl, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A6A8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A5FC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A5FC
	ldr r3, _0804A6AC @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A5FC:
	ldr r0, _0804A6B0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A632
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A632
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	add r0, sl
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A632
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A632:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A660
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A660
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A660:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A6A4: .4byte 0x0000015F
_0804A6A8: .4byte gCamera
_0804A6AC: .4byte gUnknown_080D8858
_0804A6B0: .4byte gPlayer

	thumb_func_start sub_804A6B4
sub_804A6B4: @ 0x0804A6B4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
