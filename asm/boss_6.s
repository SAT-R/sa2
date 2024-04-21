.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

  	.global gUnknown_080D8030
gUnknown_080D8030:
    .incbin "baserom.gba", 0x000D8030, 0x4

    .global gUnknown_080D8034
gUnknown_080D8034:
    .incbin "baserom.gba", 0x000D8034, 0x10

    .global gUnknown_080D8044
gUnknown_080D8044:
    .incbin "baserom.gba", 0x000D8044, 0xA

    .global gUnknown_080D804E
gUnknown_080D804E:
    .incbin "baserom.gba", 0x000D804E, 0x28

    .global gUnknown_080D8076
gUnknown_080D8076:
    .incbin "baserom.gba", 0x000D8076, 0x28

    .global gUnknown_080D809E
gUnknown_080D809E:
    .incbin "baserom.gba", 0x000D809E, 0x28

    .global gUnknown_080D80C6
gUnknown_080D80C6:
    .incbin "baserom.gba", 0x000D80C6, 0x20

    .global gUnknown_080D80E6
gUnknown_080D80E6:
    .incbin "baserom.gba", 0x000D80E6, 0x22

.text
.syntax unified
.arm

	thumb_func_start sub_8045E78
sub_8045E78: @ 0x08045E78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x22]
	subs r1, r2, #1
	strh r1, [r4, #0x22]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x69
	bhi _08045F78
	adds r0, r2, #0
	subs r0, #0x5c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bhi _08045ED8
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r5, r4, r0
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r2, _08045ED0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldrh r0, [r4, #0x22]
	cmp r0, #0x2d
	bne _08045EC0
	ldr r2, _08045ED4 @ =0x0000038D
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
_08045EC0:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	b _08045F78
	.align 2, 0
_08045ED0: .4byte gCamera
_08045ED4: .4byte 0x0000038D
_08045ED8:
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _08045F36
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08045F30
	movs r0, #0xa0
	lsls r0, r0, #1
	b _08045F34
_08045EEE:
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r4, #8]
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r0, r0, r4
	str r0, [r3, #8]
	ldr r2, _08045F28 @ =gSineTable
	ldr r1, _08045F2C @ =0x000003FF
	ands r1, r5
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #5
	strh r0, [r3, #0xc]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r0, r0, #5
	strh r0, [r3, #0xe]
	movs r0, #0xff
	strb r0, [r3]
	b _08045F78
	.align 2, 0
_08045F28: .4byte gSineTable
_08045F2C: .4byte 0x000003FF
_08045F30:
	movs r0, #0xe1
	lsls r0, r0, #1
_08045F34:
	strh r0, [r4, #0x22]
_08045F36:
	ldrh r0, [r4, #0x22]
	movs r1, #0x1e
	bl Mod
	cmp r0, #0
	bne _08045F78
	ldr r2, _08045F80 @ =gPlayer
	ldr r0, [r2, #0xc]
	ldr r1, [r4, #8]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r2, #8]
	ldr r2, [r4, #4]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0
_08045F62:
	lsls r0, r1, #4
	adds r0, #0x3c
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08045EEE
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _08045F62
_08045F78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045F80: .4byte gPlayer

	thumb_func_start sub_8045F84
sub_8045F84: @ 0x08045F84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0xe7
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r1, #0
	mov r8, r1
	movs r6, #0
	ldr r2, _08045FC4 @ =gCamera
	mov sb, r2
_08045F9E:
	lsls r0, r6, #4
	adds r0, #0x3c
	adds r4, r7, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804602A
	subs r0, #1
	strb r0, [r4]
	ldr r0, _08045FC8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08045FCC
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #4]
	b _08045FD8
	.align 2, 0
_08045FC4: .4byte gCamera
_08045FC8: .4byte gPlayer
_08045FCC:
	ldr r0, [r4, #4]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0xc
	ldrsh r1, [r4, r2]
_08045FD8:
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	mov r1, r8
	cmp r1, #0
	bne _08045FF6
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	movs r2, #1
	mov r8, r2
_08045FF6:
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804600E
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	adds r0, r5, #0
	bl sub_800C84C
_0804600E:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	mov r2, sb
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl DisplaySprite
_0804602A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _08045F9E
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8046040
sub_8046040: @ 0x08046040
	push {r4, r5, r6, lr}
	ldr r6, _080460C4 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_80478D4
	adds r0, r4, #0
	bl sub_804683C
	adds r0, r4, #0
	bl sub_8046C28
	adds r0, r4, #0
	bl sub_8047700
	adds r0, r4, #0
	bl sub_8045E78
	adds r0, r4, #0
	bl sub_8045F84
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046328
	adds r0, r4, #0
	bl sub_804766C
	ldr r1, _080460C8 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080460BC
	ldr r2, _080460CC @ =IWRAM_START + 0x2B
	adds r0, r5, r2
	strb r1, [r0]
	str r1, [r4, #0x10]
	movs r0, #0x80
	str r0, [r4]
	ldr r2, _080460D0 @ =IWRAM_START + 0x1C0
	adds r0, r5, r2
	strb r1, [r0]
	ldr r2, _080460D4 @ =gPlayer
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	bl Player_DisableInputAndBossTimer
	ldr r1, [r6]
	ldr r0, _080460D8 @ =sub_80460DC
	str r0, [r1, #8]
_080460BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080460C4: .4byte gCurTask
_080460C8: .4byte IWRAM_START + 0x28
_080460CC: .4byte IWRAM_START + 0x2B
_080460D0: .4byte IWRAM_START + 0x1C0
_080460D4: .4byte gPlayer
_080460D8: .4byte sub_80460DC

	thumb_func_start sub_80460DC
sub_80460DC: @ 0x080460DC
	push {r4, r5, r6, lr}
	ldr r0, _08046110 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _08046114 @ =gStageTime
	ldr r0, [r0]
	movs r1, #0x15
	bl Mod
	cmp r0, #0
	bne _080460FE
	movs r0, #0x90
	bl m4aSongNumStart
_080460FE:
	ldr r0, [r5]
	cmp r0, #0x3f
	bls _0804611C
	subs r0, #0x40
	lsls r2, r0, #8
	ldr r1, _08046118 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	b _0804611E
	.align 2, 0
_08046110: .4byte gCurTask
_08046114: .4byte gStageTime
_08046118: .4byte 0x000003FF
_0804611C:
	movs r2, #0
_0804611E:
	ldr r1, _08046188 @ =gSineTable
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	adds r6, r5, #0
	adds r6, #0x2b
	movs r4, #0
	strb r0, [r6]
	adds r0, r5, #0
	bl sub_80478D4
	adds r0, r5, #0
	bl sub_8045F84
	adds r0, r5, #0
	bl sub_80475D0
	adds r0, r5, #0
	movs r1, #0
	bl sub_804655C
	adds r0, r5, #0
	bl sub_804766C
	adds r0, r5, #0
	bl sub_8047060
	ldr r2, _0804618C @ =gPlayer
	str r4, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _08046180
	strb r0, [r6]
	str r0, [r5, #0x10]
	movs r0, #0x80
	str r0, [r5]
	ldr r0, _08046190 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08046194 @ =sub_8046198
	str r0, [r1, #8]
_08046180:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046188: .4byte gSineTable
_0804618C: .4byte gPlayer
_08046190: .4byte gCurTask
_08046194: .4byte sub_8046198

	thumb_func_start sub_8046198
sub_8046198: @ 0x08046198
	push {r4, r5, r6, lr}
	ldr r6, _08046228 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0804622C @ =gStageTime
	ldr r0, [r0]
	movs r1, #0x11
	bl Mod
	cmp r0, #0
	bne _080461BA
	movs r0, #0x90
	bl m4aSongNumStart
_080461BA:
	ldr r0, [r4]
	lsls r0, r0, #8
	ldr r2, _08046230 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08046234 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldr r2, _08046238 @ =IWRAM_START + 0x2B
	adds r1, r5, r2
	movs r2, #0
	strb r0, [r1]
	str r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80478D4
	adds r0, r4, #0
	bl sub_8045F84
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	movs r1, #1
	bl sub_804655C
	adds r0, r4, #0
	bl sub_804766C
	adds r0, r4, #0
	bl sub_8046F00
	adds r0, r4, #0
	bl sub_8047060
	ldr r0, [r4]
	subs r2, r0, #1
	str r2, [r4]
	cmp r2, #0
	bne _08046222
	ldr r1, _0804623C @ =IWRAM_START + 0x1C1
	adds r0, r5, r1
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_804732C
	ldr r1, [r6]
	ldr r0, _08046240 @ =sub_8046244
	str r0, [r1, #8]
_08046222:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046228: .4byte gCurTask
_0804622C: .4byte gStageTime
_08046230: .4byte 0x000003FF
_08046234: .4byte gSineTable
_08046238: .4byte IWRAM_START + 0x2B
_0804623C: .4byte IWRAM_START + 0x1C1
_08046240: .4byte sub_8046244

	thumb_func_start sub_8046244
sub_8046244: @ 0x08046244
	push {r4, r5, r6, r7, lr}
	ldr r0, _0804630C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x6c
	adds r6, r5, r0
	adds r0, r4, #0
	bl sub_804797C
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046E90
	adds r0, r4, #0
	bl sub_804766C
	adds r0, r4, #0
	bl sub_8047138
	ldr r0, _08046310 @ =gStageTime
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _08046288
	movs r0, #0x90
	bl m4aSongNumStart
_08046288:
	ldr r1, _08046314 @ =IWRAM_START + 0x1C1
	adds r7, r5, r1
	ldrb r0, [r7]
	cmp r0, #0
	bne _080462D4
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r3, _08046318 @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _080462D4
	ldr r1, _0804631C @ =IWRAM_START + 0x20C
	adds r0, r5, r1
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
	movs r0, #1
	strb r0, [r7]
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r3, [r3, #4]
	subs r1, r1, r3
	subs r1, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CreateEggmobileEscapeSequence
_080462D4:
	ldr r0, [r4, #0x6c]
	asrs r0, r0, #8
	ldr r1, _08046318 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08046304
	ldr r1, _08046320 @ =0x000001C1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046304
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x96
	movs r2, #5
	bl sub_802EF68
	ldr r0, _0804630C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08046324 @ =sub_8047868
	str r0, [r1, #8]
_08046304:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804630C: .4byte gCurTask
_08046310: .4byte gStageTime
_08046314: .4byte IWRAM_START + 0x1C1
_08046318: .4byte gCamera
_0804631C: .4byte IWRAM_START + 0x20C
_08046320: .4byte 0x000001C1
_08046324: .4byte sub_8047868

	thumb_func_start sub_8046328
sub_8046328: @ 0x08046328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r5, r7, r0
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r4, _0804651C @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r5, r7, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	movs r2, #0
	mov r8, r2
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r5, r7, r3
	movs r0, #0x2b
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _08046520 @ =gSineTable
	mov sl, r1
_08046398:
	mov r2, r8
	lsls r1, r2, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r4, r0, #0x16
	movs r6, #0
_080463A6:
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r0, _08046524 @ =gUnknown_080D8030
	adds r0, r6, r0
	ldrb r2, [r0]
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r6, r0
	adds r0, r4, r0
	ldr r3, _08046528 @ =0x000003FF
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3, #4]
	subs r1, r1, r0
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r6, r0
	adds r0, r4, r0
	ldr r3, _08046528 @ =0x000003FF
	ands r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	adds r0, r5, #0
	bl DisplaySprite
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080463A6
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046398
	movs r0, #0
	mov r8, r0
_08046424:
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r7, r0
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046424
	movs r3, #0
	mov r8, r3
	ldr r0, _08046524 @ =gUnknown_080D8030
	ldrb r6, [r0, #3]
	movs r0, #0x80
	lsls r0, r0, #1
	mov sl, r0
_08046456:
	mov r2, r8
	lsls r1, r2, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r4, r0, #0x16
	mov r3, sb
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r1, _08046528 @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	lsls r0, r2, #4
	add r0, r8
	lsls r0, r0, #2
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r7, r0
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov r2, sl
	adds r0, r4, r2
	lsls r0, r0, #1
	ldr r3, _08046520 @ =gSineTable
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3, #4]
	subs r1, r1, r0
	lsls r0, r4, #1
	ldr r2, _08046520 @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _08046530
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046530
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046530
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046530
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, [r7, #0x18]
	lsrs r0, r0, #8
	strh r0, [r5, #0x38]
	mov r2, sl
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	ldr r3, _0804652C @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x81
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004860
	b _08046536
	.align 2, 0
_0804651C: .4byte gCamera
_08046520: .4byte gSineTable
_08046524: .4byte gUnknown_080D8030
_08046528: .4byte 0x000003FF
_0804652C: .4byte gUnknown_030054B8
_08046530:
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_08046536:
	adds r0, r5, #0
	bl DisplaySprite
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046456
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804655C
sub_804655C: @ 0x0804655C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r5, r7, r0
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r4, _080465DC @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r5, r7, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	ldr r1, [r7]
	cmp r1, #0x2f
	bhi _080465E0
	cmp r6, #0
	beq _080465E0
	movs r0, #0x30
	subs r0, r0, r1
	movs r1, #0x10
	bl Div
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	b _080465E4
	.align 2, 0
_080465DC: .4byte gCamera
_080465E0:
	movs r2, #0
	str r2, [sp]
_080465E4:
	movs r0, #0
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x2b
	str r1, [sp, #4]
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r5, r7, r2
_080465F4:
	mov r0, r8
	lsls r1, r0, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r6, r0, #0x16
	ldr r4, [sp]
	cmp r4, #2
	bhi _080466EE
	ldr r1, _08046668 @ =gSineTable
	mov sl, r1
	ldr r3, [sp, #4]
	ldr r2, _0804666C @ =0x000003FF
	mov sb, r2
_08046610:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08046678
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r2, _08046670 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov ip, r1
	ldr r0, _08046674 @ =gUnknown_080D8030
	adds r0, r4, r0
	ldrb r2, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	adds r0, r6, r0
	mov r1, sb
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	add r0, ip
	strh r0, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08046670 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	adds r0, r6, r0
	b _080466C4
	.align 2, 0
_08046668: .4byte gSineTable
_0804666C: .4byte 0x000003FF
_08046670: .4byte gCamera
_08046674: .4byte gUnknown_080D8030
_08046678:
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r2, _080467FC @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov ip, r1
	ldr r0, _08046800 @ =gUnknown_080D8030
	adds r0, r4, r0
	ldrb r2, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	subs r0, r6, r0
	mov r1, sb
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	add r0, ip
	strh r0, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080467FC @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	subs r0, r6, r0
_080466C4:
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	mov r2, ip
	adds r1, r2, r0
	strh r1, [r5, #0x18]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl DisplaySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #8]
	cmp r4, #2
	bls _08046610
_080466EE:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080466FE
	b _080465F4
_080466FE:
	movs r0, #0
	mov r8, r0
_08046702:
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r7, r0
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046702
	movs r0, #0
	mov r8, r0
	ldr r0, _08046800 @ =gUnknown_080D8030
	ldrb r4, [r0, #3]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	ldr r2, _08046804 @ =gSineTable
	mov sl, r2
_08046738:
	mov r0, r8
	lsls r1, r0, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r6, r0, #0x16
	ldr r2, [sp, #4]
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r6, r6, r0
	ldr r1, _08046808 @ =0x000003FF
	adds r0, r1, #0
	ands r6, r0
	mov r2, r8
	lsls r0, r2, #4
	add r0, r8
	lsls r0, r0, #2
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r5, r7, r0
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r2, _080467FC @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov r2, sb
	adds r0, r6, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r2, _080467FC @ =gCamera
	ldr r0, [r2, #4]
	subs r1, r1, r0
	lsls r0, r6, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _08046810
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046810
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046810
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046810
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, [r7, #0x18]
	lsrs r0, r0, #8
	strh r0, [r5, #0x38]
	mov r2, sb
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	ldr r3, _0804680C @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x81
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004860
	b _08046816
	.align 2, 0
_080467FC: .4byte gCamera
_08046800: .4byte gUnknown_080D8030
_08046804: .4byte gSineTable
_08046808: .4byte 0x000003FF
_0804680C: .4byte gUnknown_030054B8
_08046810:
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_08046816:
	adds r0, r5, #0
	bl DisplaySprite
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046738
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804683C
sub_804683C: @ 0x0804683C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	bne _0804684E
	b _08046A84
_0804684E:
	adds r1, r7, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804685A
	b _08046990
_0804685A:
	subs r0, #1
	strb r0, [r1]
	movs r5, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046868
	b _08046A18
_08046868:
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r4, [r0]
	cmp r4, #1
	beq _080468C8
	cmp r4, #1
	bgt _0804687C
	cmp r4, #0
	beq _08046882
	b _08046A18
_0804687C:
	cmp r4, #2
	beq _08046904
	b _08046A18
_08046882:
	movs r0, #0xff
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _080468BC @ =0x000002B2
	strh r3, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #3
	strb r2, [r0]
	ldr r0, _080468C0 @ =0x0000027D
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _080468C4 @ =0x00000305
	b _08046972
	.align 2, 0
_080468BC: .4byte 0x000002B2
_080468C0: .4byte 0x0000027D
_080468C4: .4byte 0x00000305
_080468C8:
	movs r0, #0xff
	bl m4aSongNumStart
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r2, _080468FC @ =0x000002B3
	strh r2, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046900 @ =0x000002C1
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	b _08046970
	.align 2, 0
_080468FC: .4byte 0x000002B3
_08046900: .4byte 0x000002C1
_08046904:
	movs r0, #0xff
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _0804697C @ =0x000002B2
	strh r3, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #3
	strb r2, [r0]
	ldr r0, _08046980 @ =0x0000027D
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _08046984 @ =0x00000305
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r3, #1
	strh r3, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #1
	strb r2, [r0]
	ldr r0, _08046988 @ =0x000002C1
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
_08046970:
	ldr r0, _0804698C @ =0x00000349
_08046972:
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	b _08046A18
	.align 2, 0
_0804697C: .4byte 0x000002B2
_08046980: .4byte 0x0000027D
_08046984: .4byte 0x00000305
_08046988: .4byte 0x000002C1
_0804698C: .4byte 0x00000349
_08046990:
	adds r0, r7, #0
	adds r0, #0x27
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _080469E4
	ldr r2, _080469DC @ =gUnknown_080D809E
	adds r4, r7, #0
	adds r4, #0x26
	ldrb r1, [r4]
	adds r3, r7, #0
	adds r3, #0x28
	ldrb r0, [r3]
	lsls r1, r1, #1
	cmp r0, #4
	bhi _080469B2
	adds r1, #0x14
_080469B2:
	adds r0, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r7, #0x20]
	adds r2, r0, r1
	strh r2, [r7, #0x20]
	ldr r6, _080469E0 @ =gUnknown_080D8076
	ldrb r0, [r4]
	ldrb r1, [r3]
	lsls r0, r0, #1
	cmp r1, #4
	bhi _080469CA
	adds r0, #0x14
_080469CA:
	adds r1, r0, r6
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bne _08046A18
	movs r0, #1
	strb r0, [r5]
	b _08046A18
	.align 2, 0
_080469DC: .4byte gUnknown_080D809E
_080469E0: .4byte gUnknown_080D8076
_080469E4:
	cmp r1, #1
	bne _08046A18
	ldr r2, _08046A78 @ =gUnknown_080D809E
	adds r0, r7, #0
	adds r0, #0x26
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x28
	ldrb r1, [r1]
	lsls r0, r0, #1
	cmp r1, #4
	bhi _080469FE
	adds r0, #0x14
_080469FE:
	adds r0, r0, r2
	ldrh r1, [r7, #0x20]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r7, #0x20]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _08046A18
	movs r0, #2
	strb r0, [r5]
	str r1, [r7, #0x18]
	strh r1, [r7, #0x20]
_08046A18:
	ldrh r1, [r7, #0x20]
	ldr r0, [r7, #0x18]
	adds r0, r0, r1
	ldr r1, _08046A7C @ =0x0003FFFF
	ands r0, r1
	str r0, [r7, #0x18]
	ldrh r0, [r7, #0x1e]
	subs r0, #1
	strh r0, [r7, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046A32
	b _08046C08
_08046A32:
	movs r2, #0
	adds r5, r7, #0
	adds r5, #0x27
	ldr r6, _08046A80 @ =gUnknown_080D8034
	movs r4, #0
	movs r3, #0x97
	lsls r3, r3, #2
_08046A40:
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r7, r0
	movs r0, #1
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	strh r0, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08046A40
	movs r0, #0
	strb r0, [r5]
	str r0, [r7, #0x18]
	strh r0, [r7, #0x20]
	b _08046C08
	.align 2, 0
_08046A78: .4byte gUnknown_080D809E
_08046A7C: .4byte 0x0003FFFF
_08046A80: .4byte gUnknown_080D8034
_08046A84:
	ldr r4, _08046B00 @ =gPseudoRandom
	ldr r0, [r4]
	ldr r1, _08046B04 @ =0x00196225
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r6, _08046B08 @ =0x3C6EF35F
	adds r0, r0, r6
	str r0, [r4]
	movs r5, #0xff
	ands r0, r5
	movs r1, #0xa
	bl Mod
	ldr r1, _08046B0C @ =gUnknown_080D8044
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x25
	adds r1, r1, r7
	mov sb, r1
	strb r0, [r1]
	ldr r0, [r4]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	str r0, [r4]
	ands r0, r5
	movs r1, #0xa
	bl Mod
	adds r1, r7, #0
	adds r1, #0x26
	strb r0, [r1]
	ldr r2, _08046B10 @ =gUnknown_080D804E
	ldrb r1, [r1]
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r1, r1, #1
	cmp r0, #4
	bhi _08046ADC
	adds r1, #0x14
_08046ADC:
	adds r0, r1, r2
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r7, #0x1e]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	mov r0, sb
	ldrb r4, [r0]
	cmp r4, #1
	beq _08046B5C
	cmp r4, #1
	bgt _08046B14
	cmp r4, #0
	beq _08046B1A
	b _08046C08
	.align 2, 0
_08046B00: .4byte gPseudoRandom
_08046B04: .4byte 0x00196225
_08046B08: .4byte 0x3C6EF35F
_08046B0C: .4byte gUnknown_080D8044
_08046B10: .4byte gUnknown_080D804E
_08046B14:
	cmp r4, #2
	beq _08046B98
	b _08046C08
_08046B1A:
	movs r0, #0xfe
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _08046B50 @ =0x000002B2
	strh r3, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #2
	strb r2, [r0]
	ldr r0, _08046B54 @ =0x0000027D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _08046B58 @ =0x00000305
	b _08046C00
	.align 2, 0
_08046B50: .4byte 0x000002B2
_08046B54: .4byte 0x0000027D
_08046B58: .4byte 0x00000305
_08046B5C:
	movs r0, #0xfe
	bl m4aSongNumStart
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _08046B90 @ =0x000002B3
	strh r3, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #2
	strb r2, [r0]
	ldr r0, _08046B94 @ =0x000002C1
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	b _08046BFE
	.align 2, 0
_08046B90: .4byte 0x000002B3
_08046B94: .4byte 0x000002C1
_08046B98:
	movs r0, #0xfe
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r2, _08046C14 @ =0x000002B2
	strh r2, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046C18 @ =0x0000027D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046C1C @ =0x00000305
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r2, #1
	strh r2, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046C20 @ =0x000002C1
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
_08046BFE:
	ldr r0, _08046C24 @ =0x00000349
_08046C00:
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_08046C08:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046C14: .4byte 0x000002B2
_08046C18: .4byte 0x0000027D
_08046C1C: .4byte 0x00000305
_08046C20: .4byte 0x000002C1
_08046C24: .4byte 0x00000349

	thumb_func_start sub_8046C28
sub_8046C28: @ 0x08046C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046C40
	b _08046E78
_08046C40:
	movs r0, #0
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x2b
	str r1, [sp]
	ldr r0, _08046D24 @ =gUnknown_080D8030
	ldrb r0, [r0, #3]
	mov sl, r0
_08046C50:
	mov r2, r8
	lsls r0, r2, #0x10
	ldr r2, [r4, #0x14]
	adds r2, r2, r0
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x16
	ldr r3, [sp]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r2, r2, r0
	ldr r5, _08046D28 @ =0x000003FF
	adds r0, r5, #0
	ands r2, r0
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	movs r3, #0x97
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r4, r0
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r3, _08046D2C @ =gSineTable
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r5, #0
	ldrsh r0, [r0, r5]
	mov r5, sl
	muls r5, r0, r5
	adds r0, r5, #0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	mov sb, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r0, [r2, r3]
	mov r5, sl
	muls r5, r0, r5
	adds r0, r5, #0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	mov ip, r1
	ldrh r0, [r4, #0x1e]
	adds r5, r0, #0
	cmp r5, #0
	beq _08046D5C
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r7, r0, #0
	cmp r2, #0
	bne _08046D34
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046D34
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046D34
	ldr r3, _08046D30 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08046D34
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _08046D34
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0xf8
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r3, #0x20]
	str r2, [r3, #0x3c]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r2, #0
	ldrh r5, [r3, #0x10]
	adds r0, r1, r5
	strh r0, [r3, #0x10]
	ldrh r0, [r3, #0x14]
	adds r1, r1, r0
	strh r1, [r3, #0x14]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r3, #0x12]
	b _08046E68
	.align 2, 0
_08046D24: .4byte gUnknown_080D8030
_08046D28: .4byte 0x000003FF
_08046D2C: .4byte gSineTable
_08046D30: .4byte gPlayer
_08046D34:
	lsls r0, r5, #0x10
	cmp r0, #0
	beq _08046D5C
	ldrb r0, [r7]
	cmp r0, #0
	bne _08046D5C
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046D5C
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046D5C
	b _08046E5A
_08046D5C:
	ldr r3, _08046D90 @ =gPlayer
	ldr r2, [r3, #0x3c]
	movs r5, #0
	cmp r2, r6
	bne _08046D68
	movs r5, #1
_08046D68:
	movs r0, #0x12
	ldrsh r7, [r3, r0]
	ldr r1, [r3, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08046D82
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08046D94
	cmp r2, r6
	bne _08046D94
_08046D82:
	adds r0, r6, #0
	mov r1, sb
	mov r2, ip
	bl sub_800CCB8
	adds r3, r0, #0
	b _08046D96
	.align 2, 0
_08046D90: .4byte gPlayer
_08046D94:
	movs r3, #0
_08046D96:
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r3
	cmp r2, #0
	beq _08046E34
	cmp r5, #0
	bne _08046DC0
	ldr r2, _08046DF8 @ =gPlayer
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08046DC0
	cmp r7, #0
	ble _08046DC0
	ldr r5, _08046DFC @ =0xFFFFFB00
	adds r1, r5, #0
	ldrh r5, [r2, #0x10]
	adds r0, r1, r5
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x14]
	adds r1, r1, r0
	strh r1, [r2, #0x14]
_08046DC0:
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08046E00
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046E00
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _08046E00
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046DE8
	cmp r0, #2
	bne _08046E00
_08046DE8:
	adds r0, r4, #0
	bl sub_8047940
	ldr r0, _08046DF8 @ =gPlayer
	bl sub_800CBA4
	b _08046E78
	.align 2, 0
_08046DF8: .4byte gPlayer
_08046DFC: .4byte 0xFFFFFB00
_08046E00:
	ldr r2, _08046E30 @ =gPlayer
	ldr r1, [r2, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r1, r5
	lsls r0, r3, #0x18
	asrs r0, r0, #0x10
	adds r1, r1, r0
	str r1, [r2, #0xc]
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08046E5A
	mov r3, sb
	subs r1, r3, r0
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	b _08046E5A
	.align 2, 0
_08046E30: .4byte gPlayer
_08046E34:
	cmp r5, #0
	beq _08046E5A
	ldr r3, _08046E88 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3, #0x20]
	str r2, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08046E5A
	ldr r0, _08046E8C @ =0xFFFFFEFF
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r3, #0x20]
_08046E5A:
	mov r5, r8
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	mov r1, sb
	str r1, [r0]
_08046E68:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _08046E78
	b _08046C50
_08046E78:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046E88: .4byte gPlayer
_08046E8C: .4byte 0xFFFFFEFF

	thumb_func_start sub_8046E90
sub_8046E90: @ 0x08046E90
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r5, #0
	adds r7, #0x6c
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, [r5, #0x6c]
	asrs r0, r0, #8
	ldr r6, _08046EF8 @ =gCamera
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	ldr r1, _08046EFC @ =0x000001C1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046EF0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, [r5, #0x6c]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_08046EF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046EF8: .4byte gCamera
_08046EFC: .4byte 0x000001C1

	thumb_func_start sub_8046F00
sub_8046F00: @ 0x08046F00
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

	thumb_func_start sub_8047060
sub_8047060: @ 0x08047060
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	mov ip, r0
	ldr r0, _08047114 @ =gStageTime
	ldr r7, [r0]
	movs r0, #0xf
	ands r7, r0
	cmp r7, #0
	bne _08047106
	mov r0, ip
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r3, _08047118 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov r0, ip
	ldr r2, [r0, #8]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	subs r2, r2, r0
	ldr r3, _0804711C @ =gPseudoRandom
	mov r8, r3
	ldr r0, [r3]
	ldr r6, _08047120 @ =0x00196225
	adds r3, r0, #0
	muls r3, r6, r3
	ldr r5, _08047124 @ =0x3C6EF35F
	adds r3, r3, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x3f
	adds r0, r3, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	adds r1, r3, #0
	muls r1, r6, r1
	adds r1, r1, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r1, #0
	ands r0, r4
	adds r2, r2, r0
	subs r2, #0x1f
	str r2, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	adds r2, r1, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r4
	ldr r0, _08047128 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r0, r8
	str r1, [r0]
	ldr r0, _0804712C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _08047130 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08047134 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, ip
	bl CreateBossParticleWithExplosionUpdate
_08047106:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047114: .4byte gStageTime
_08047118: .4byte gCamera
_0804711C: .4byte gPseudoRandom
_08047120: .4byte 0x00196225
_08047124: .4byte 0x3C6EF35F
_08047128: .4byte 0x00000407
_0804712C: .4byte 0x000001FF
_08047130: .4byte 0x06012980
_08047134: .4byte 0x0000026B

	thumb_func_start sub_8047138
sub_8047138: @ 0x08047138
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	mov sb, r0
	mov r4, sb
	adds r4, #0x6c
	ldr r0, _080471FC @ =gStageTime
	ldr r0, [r0]
	movs r1, #0xa
	bl Mod
	cmp r0, #0
	bne _080471EE
	ldr r0, _08047200 @ =0x000001C1
	add r0, sb
	ldrb r7, [r0]
	cmp r7, #0
	bne _080471EE
	mov r0, sb
	ldr r1, [r0, #0x6c]
	asrs r1, r1, #8
	ldr r3, _08047204 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	subs r2, r2, r0
	ldr r3, _08047208 @ =gPseudoRandom
	mov r8, r3
	ldr r0, [r3]
	ldr r6, _0804720C @ =0x00196225
	adds r3, r0, #0
	muls r3, r6, r3
	ldr r5, _08047210 @ =0x3C6EF35F
	adds r3, r3, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x3f
	adds r0, r3, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	adds r1, r3, #0
	muls r1, r6, r1
	adds r1, r1, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r1, #0
	ands r0, r4
	adds r2, r2, r0
	subs r2, #0x1f
	str r2, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	adds r2, r1, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r4
	ldr r0, _08047214 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r0, r8
	str r1, [r0]
	ldr r0, _08047218 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0804721C @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08047220 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sb
	bl CreateBossParticleWithExplosionUpdate
_080471EE:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080471FC: .4byte gStageTime
_08047200: .4byte 0x000001C1
_08047204: .4byte gCamera
_08047208: .4byte gPseudoRandom
_0804720C: .4byte 0x00196225
_08047210: .4byte 0x3C6EF35F
_08047214: .4byte 0x00000407
_08047218: .4byte 0x000001FF
_0804721C: .4byte 0x06012980
_08047220: .4byte 0x0000026B

	thumb_func_start sub_8047224
sub_8047224: @ 0x08047224
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08047310 @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _08047314 @ =IWRAM_START + 0x6C
	adds r2, r1, r0
	mov r3, sb
	ldr r0, [r3, #4]
	adds r0, r0, r7
	str r0, [r3, #4]
	ldr r0, [r3, #8]
	adds r0, r0, r6
	str r0, [r3, #8]
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #0
	ldr r5, _08047318 @ =IWRAM_START + 0xD0
	adds r5, r5, r1
	mov r8, r5
	ldr r0, _0804731C @ =IWRAM_START + 0xD4
	adds r0, r0, r1
	mov ip, r0
	ldr r3, _08047320 @ =IWRAM_START + 0x80
	adds r3, r1, r3
	str r3, [sp, #4]
	ldr r5, _08047324 @ =IWRAM_START + 0x84
	adds r5, r5, r1
	mov sl, r5
	ldr r0, _08047328 @ =IWRAM_START + 0x2C
	adds r0, r1, r0
	str r0, [sp]
_08047280:
	movs r3, #0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r5, r0, #2
_08047288:
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r5
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	add r1, ip
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08047288
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08047280
	movs r4, #0
	ldr r3, [sp, #4]
	mov r8, r3
	ldr r3, [sp]
	mov ip, r4
_080472C0:
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #2
	mov r5, r8
	adds r1, r5, r0
	str r7, [r1]
	add r0, sl
	str r6, [r0]
	adds r2, r3, r2
	mov r0, ip
	str r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080472C0
	movs r4, #0
_080472E2:
	lsls r1, r4, #4
	adds r1, #0x3c
	add r1, sb
	ldr r0, [r1, #4]
	adds r0, r0, r7
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080472E2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047310: .4byte gActiveBossTask
_08047314: .4byte IWRAM_START + 0x6C
_08047318: .4byte IWRAM_START + 0xD0
_0804731C: .4byte IWRAM_START + 0xD4
_08047320: .4byte IWRAM_START + 0x80
_08047324: .4byte IWRAM_START + 0x84
_08047328: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_804732C
sub_804732C: @ 0x0804732C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov ip, r0
	mov r1, ip
	adds r1, #0x6c
	movs r2, #0
	strh r2, [r0, #0x1c]
	ldr r0, [r0, #4]
	mov r3, ip
	str r0, [r3, #0x6c]
	ldr r0, [r3, #8]
	str r0, [r1, #4]
	movs r0, #0xb0
	lsls r0, r0, #3
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r1, #0x10]
	movs r7, #0
	adds r3, #0xd0
	str r3, [sp, #0xc]
	mov r4, ip
	adds r4, #0xd4
	str r4, [sp, #0x14]
	mov r6, ip
	adds r6, #0xd8
	str r6, [sp, #0x1c]
	mov r0, ip
	adds r0, #0xdc
	str r0, [sp, #0x20]
	adds r1, #0x74
	str r1, [sp, #0x24]
	mov r2, ip
	adds r2, #0x80
	str r2, [sp]
	subs r3, #0x4c
	str r3, [sp, #4]
	subs r4, #0x4c
	str r4, [sp, #8]
	subs r6, #0x4c
	str r6, [sp, #0x10]
	subs r0, #0x4c
	str r0, [sp, #0x18]
_0804738C:
	lsls r1, r7, #0x10
	mov r2, ip
	ldr r0, [r2, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x16
	movs r6, #0
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	mov sl, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r5, r3
	lsls r0, r0, #1
	ldr r4, _080474B8 @ =gSineTable
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sb, r1
	lsls r0, r5, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r3, [r0, r4]
	mov r8, r3
_080473BE:
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	add r2, sl
	ldr r0, [sp, #0xc]
	adds r0, r0, r2
	str r0, [sp, #0x28]
	ldr r1, _080474BC @ =gUnknown_080D8030
	adds r0, r6, r1
	ldrb r3, [r0]
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #6
	mov r4, ip
	ldr r0, [r4, #4]
	adds r0, r0, r1
	ldr r1, [sp, #0x28]
	str r0, [r1]
	ldr r0, [sp, #0x14]
	adds r4, r0, r2
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #6
	mov r3, ip
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r4]
	ldr r4, [sp, #0x1c]
	adds r3, r4, r2
	movs r1, #7
	subs r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [r3]
	ldr r0, [sp, #0x20]
	adds r1, r0, r2
	movs r0, #1
	str r0, [r1]
	ldr r1, [sp, #0x24]
	adds r2, r1, r2
	str r5, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080473BE
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0804738C
	movs r7, #0
	ldr r2, _080474BC @ =gUnknown_080D8030
	ldrb r4, [r2, #3]
	ldr r3, _080474B8 @ =gSineTable
	mov r8, r3
	movs r1, #6
	subs r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	mov sb, r0
_0804743C:
	lsls r1, r7, #0x10
	mov r6, ip
	ldr r0, [r6, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x16
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #2
	ldr r0, [sp]
	adds r3, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	lsls r0, r0, #1
	add r0, r8
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r1, r4, #0
	muls r1, r0, r1
	asrs r1, r1, #6
	mov r6, ip
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r3, r0, r2
	lsls r0, r5, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r3]
	ldr r3, [sp, #8]
	adds r0, r3, r2
	mov r6, sb
	str r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	str r0, [r1]
	ldr r1, [sp, #0x18]
	adds r2, r1, r2
	str r5, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0804743C
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080474B8: .4byte gSineTable
_080474BC: .4byte gUnknown_080D8030

	thumb_func_start sub_80474C0
sub_80474C0: @ 0x080474C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	movs r7, #0xfe
	lsls r7, r7, #1
	add r7, r8
	movs r0, #0
	mov sb, r0
	mov r1, r8
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _08047598
	subs r0, #1
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080474F2
	movs r0, #0x8f
	bl m4aSongNumStart
	b _080474F8
_080474F2:
	movs r0, #0xeb
	bl m4aSongNumStart
_080474F8:
	mov r1, r8
	adds r1, #0x2a
	movs r0, #0x1e
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804757C
	ldr r0, _08047564 @ =0x000002B5
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08047568 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0804756C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08047588
	ldr r0, _08047570 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047588
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08047574 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08047558
	movs r0, #0xff
_08047558:
	strb r0, [r1]
	ldr r1, _08047578 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08047588
	.align 2, 0
_08047564: .4byte 0x000002B5
_08047568: .4byte gLevelScore
_0804756C: .4byte 0x0000C350
_08047570: .4byte gGameMode
_08047574: .4byte gNumLives
_08047578: .4byte gUnknown_030054A8
_0804757C:
	movs r0, #0
	ldr r1, _08047594 @ =0x000002B5
	strh r1, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
_08047588:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	b _0804759C
	.align 2, 0
_08047594: .4byte 0x000002B5
_08047598:
	movs r0, #1
	mov sb, r0
_0804759C:
	ldr r0, _080475C8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _080475B8
	mov r0, r8
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bne _080475B8
	ldr r1, _080475CC @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_080475B8:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080475C8: .4byte gCurrentLevel
_080475CC: .4byte gUnknown_030054A8

	thumb_func_start sub_80475D0
sub_80475D0: @ 0x080475D0
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r4, r3, r0
	adds r1, r3, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0
	beq _08047630
	adds r2, r3, #0
	adds r2, #0x29
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804765E
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047614
	ldr r0, _08047610 @ =0x000002B5
	strh r0, [r4, #0xa]
	movs r2, #0x87
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _08047620
	.align 2, 0
_08047610: .4byte 0x000002B5
_08047614:
	movs r0, #0
	ldr r1, _0804762C @ =0x000002B5
	strh r1, [r4, #0xa]
	movs r2, #0x87
	lsls r2, r2, #2
	adds r1, r3, r2
_08047620:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _0804765C
	.align 2, 0
_0804762C: .4byte 0x000002B5
_08047630:
	adds r1, r3, #0
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804765E
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804765E
	movs r1, #0
	ldr r0, _08047664 @ =0x000002B5
	strh r0, [r4, #0xa]
	movs r4, #0x87
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _08047668 @ =0x0000021D
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_0804765C:
	strb r0, [r1]
_0804765E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047664: .4byte 0x000002B5
_08047668: .4byte 0x0000021D

	thumb_func_start sub_804766C
sub_804766C: @ 0x0804766C
	push {r4, r5, r6, r7, lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080476BC
	movs r3, #0
	ldr r0, _080476AC @ =gFlags
	mov ip, r0
	ldr r7, _080476B0 @ =gObjPalette
	ldr r6, _080476B4 @ =gUnknown_080D80C6
	ldr r5, _080476B8 @ =gStageTime
	movs r4, #2
_08047684:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08047684
	b _080476E0
	.align 2, 0
_080476AC: .4byte gFlags
_080476B0: .4byte gObjPalette
_080476B4: .4byte gUnknown_080D80C6
_080476B8: .4byte gStageTime
_080476BC:
	movs r3, #0
	ldr r1, _080476F4 @ =gFlags
	mov ip, r1
	ldr r4, _080476F8 @ =gObjPalette
	ldr r2, _080476FC @ =gUnknown_080D80E6
_080476C6:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _080476C6
_080476E0:
	mov r1, ip
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080476F4: .4byte gFlags
_080476F8: .4byte gObjPalette
_080476FC: .4byte gUnknown_080D80E6

	thumb_func_start sub_8047700
sub_8047700: @ 0x08047700
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r0, r0, r4
	mov r8, r0
	ldr r0, [r4, #4]
	asrs r7, r0, #8
	ldr r1, [r4, #8]
	asrs r6, r1, #8
	bl Player_UpdateHomingPosition
	ldr r5, _08047760 @ =gPlayer
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #1
	bl sub_800C320
	cmp r0, #0
	beq _08047764
	ldr r1, [r5, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	ble _08047750
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r2, [r5, #0x10]
	adds r0, r0, r2
	strh r0, [r5, #0x10]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	str r0, [r5, #8]
_08047750:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r5, #0x12]
	adds r0, r0, r2
	strh r0, [r5, #0x12]
	b _080477DA
	.align 2, 0
_08047760: .4byte gPlayer
_08047764:
	movs r0, #0x2a
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080477DA
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl IsColliding_Cheese
	cmp r0, #1
	beq _08047794
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0804779C
_08047794:
	adds r0, r4, #0
	bl sub_80474C0
	b _080477DA
_0804779C:
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r2, r0, #0
	cmp r2, #1
	bne _080477DA
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r3, r4, r1
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0x1e
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _080477DA
	ldr r0, _080477E8 @ =0x000002B5
	strh r0, [r3, #0xa]
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _080477EC @ =0x0000021D
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
_080477DA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080477E8: .4byte 0x000002B5
_080477EC: .4byte 0x0000021D

	thumb_func_start Task_EggGoRound
Task_EggGoRound: @ 0x080477F0
	push {r4, r5, lr}
	ldr r0, _0804785C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_804787C
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046328
	ldr r1, [r4]
	cmp r1, #0x3f
	bhi _08047836
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08047828
	ldr r0, _08047860 @ =IWRAM_START + 0x2B
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08047828:
	ldr r1, [r4, #0x10]
	subs r1, #0x2c
	ldr r0, [r4]
	subs r0, #0x20
	lsls r0, r0, #2
	subs r1, r1, r0
	str r1, [r4, #0x10]
_08047836:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _08047854
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, _0804785C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08047864 @ =sub_8046040
	str r0, [r1, #8]
_08047854:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804785C: .4byte gCurTask
_08047860: .4byte IWRAM_START + 0x2B
_08047864: .4byte sub_8046040

	thumb_func_start sub_8047868
sub_8047868: @ 0x08047868
	push {lr}
	ldr r0, _08047878 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08047878: .4byte gCurTask

	thumb_func_start sub_804787C
sub_804787C: @ 0x0804787C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	ldr r0, [r4]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r1, [r4, #4]
	adds r1, r1, r2
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _080478CC @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	adds r0, r0, r1
	ldr r1, _080478D0 @ =0x0003FFFF
	ands r0, r1
	str r0, [r4, #0x14]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080478CC: .4byte sub_801EE64
_080478D0: .4byte 0x0003FFFF

	thumb_func_start sub_80478D4
sub_80478D4: @ 0x080478D4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08047934 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x10]
	adds r0, r0, r2
	ldr r1, _08047938 @ =0x0003FFFF
	ands r0, r1
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0804792A
	ldr r0, _0804793C @ =0xFFFFFF00
	cmp r2, r0
	beq _0804792A
	subs r0, r2, #1
	str r0, [r4, #0x10]
_0804792A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047934: .4byte sub_801EE64
_08047938: .4byte 0x0003FFFF
_0804793C: .4byte 0xFFFFFF00

	thumb_func_start sub_8047940
sub_8047940: @ 0x08047940
	push {lr}
	adds r2, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047970
	ldr r0, _08047974 @ =0x000002B5
	strh r0, [r3, #0xa]
	subs r0, #0x99
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08047978 @ =0x0000021D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_08047970:
	pop {r0}
	bx r0
	.align 2, 0
_08047974: .4byte 0x000002B5
_08047978: .4byte 0x0000021D

	thumb_func_start sub_804797C
sub_804797C: @ 0x0804797C
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x6c
	ldr r0, [r4, #0xc]
	adds r0, #0x30
	str r0, [r4, #0xc]
	ldr r0, [r2, #0x6c]
	ldr r1, [r4, #8]
	adds r0, r0, r1
	str r0, [r2, #0x6c]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #0x14
	ldr r1, [r2, #0x6c]
	asrs r1, r1, #8
	ldr r2, _080479EC @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _080479E2
	ldr r0, [r4, #8]
	subs r0, #0x40
	str r0, [r4, #8]
	cmp r0, #0
	bge _080479C4
	movs r0, #0
	str r0, [r4, #8]
_080479C4:
	ldr r1, [r4, #0xc]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	str r0, [r4, #0xc]
	lsls r1, r5, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_080479E2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080479EC: .4byte sub_801EC3C

	thumb_func_start TaskDestructor_EggGoRound
TaskDestructor_EggGoRound: @ 0x080479F0
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08047A48 @ =IWRAM_START + 0x3A0
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A4C @ =IWRAM_START + 0x370
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A50 @ =IWRAM_START + 0x1C8
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A54 @ =IWRAM_START + 0x200
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A58 @ =IWRAM_START + 0x260
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A5C @ =IWRAM_START + 0x2A4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _08047A60 @ =IWRAM_START + 0x230
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _08047A64 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047A48: .4byte IWRAM_START + 0x3A0
_08047A4C: .4byte IWRAM_START + 0x370
_08047A50: .4byte IWRAM_START + 0x1C8
_08047A54: .4byte IWRAM_START + 0x200
_08047A58: .4byte IWRAM_START + 0x260
_08047A5C: .4byte IWRAM_START + 0x2A4
_08047A60: .4byte IWRAM_START + 0x230
_08047A64: .4byte gActiveBossTask
