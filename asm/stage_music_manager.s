.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D5254
gUnknown_080D5254:
    .incbin "baserom.gba", 0x000D5254, 0x0E

    .global gUnknown_080D5262
gUnknown_080D5262:
    .incbin "baserom.gba", 0x000D5262, 0x0E

    .global gUnknown_080D5270
gUnknown_080D5270:
    .incbin "baserom.gba", 0x000D5270, 0x0E

    .global gUnknown_080D527E
gUnknown_080D527E:
    .incbin "baserom.gba", 0x000D527E, 0x0E

    .global gUnknown_080D528C
gUnknown_080D528C:
    .incbin "baserom.gba", 0x000D528C, 0x0E

    .global gUnknown_080D529A
gUnknown_080D529A:
    .incbin "baserom.gba", 0x000D529A, 0x0E

    .global gUnknown_080D52A8
gUnknown_080D52A8:
    .incbin "baserom.gba", 0x000D52A8, 0x0E

    .global gUnknown_080D52B6
gUnknown_080D52B6:
    .incbin "baserom.gba", 0x000D52B6, 0x0E

    .global gUnknown_080D52C4
gUnknown_080D52C4:
    .incbin "baserom.gba", 0x000D52C4, 0x0E

    .global gUnknown_080D52D2
gUnknown_080D52D2:
    .incbin "baserom.gba", 0x000D52D2, 0x0E

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start CreateStageMusicManager
CreateStageMusicManager: @ 0x0800BEF8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0800BF28 @ =Task_StageMusicManager
	movs r2, #0x80
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r0, _0800BF2C @ =gUnknown_030054A8
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strh r4, [r0, #6]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF28: .4byte Task_StageMusicManager
_0800BF2C: .4byte gUnknown_030054A8

	thumb_func_start sub_800BF30
sub_800BF30: @ 0x0800BF30
	push {r4, lr}
	ldr r4, _0800BF6C @ =gMPlayInfo_BGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #4
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	movs r1, #4
	bl m4aMPlayFadeIn
	ldr r0, _0800BF70 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF64
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF6C: .4byte gMPlayInfo_BGM
_0800BF70: .4byte gPlayer

	thumb_func_start sub_800BF74
sub_800BF74: @ 0x0800BF74
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r4, _0800BFA4 @ =gMPlayInfo_BGM
	lsrs r1, r1, #0x14
	adds r0, r4, #0
	bl m4aMPlayFadeOutTemporarily
	ldr r0, _0800BFA8 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF9C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFA4: .4byte gMPlayInfo_BGM
_0800BFA8: .4byte gPlayer

	thumb_func_start sub_800BFAC
sub_800BFAC: @ 0x0800BFAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	movs r7, #0
	ldr r1, [r0, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BFD2
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800BFD6
_0800BFD2:
	movs r0, #0
	b _0800C054
_0800BFD6:
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r4, #0
	ldrsb r4, [r6, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C004
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C010
	cmp r2, r1
	blt _0800C052
_0800C004:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C052
_0800C010:
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r4, #1
	ldrsb r4, [r6, r4]
	adds r3, r0, r4
	cmp r2, r3
	bgt _0800C040
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C04C
	cmp r2, r3
	blt _0800C052
_0800C040:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C052
_0800C04C:
	movs r0, #0x80
	lsls r0, r0, #0xc
	orrs r7, r0
_0800C052:
	adds r0, r7, #0
_0800C054:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
