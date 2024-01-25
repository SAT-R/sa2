.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

	.global gUnknown_080D7B10
gUnknown_080D7B10:
    .incbin "baserom.gba", 0x000D7B10, 0x3

    .global gUnknown_080D7B13
gUnknown_080D7B13:
    .incbin "baserom.gba", 0x000D7B13, 0x30

    .global gUnknown_080D7B43
gUnknown_080D7B43:
    .incbin "baserom.gba", 0x000D7B43, 0xB

    .global gUnknown_080D7B4E
gUnknown_080D7B4E:
    .incbin "baserom.gba", 0x000D7B4E, 0x2

    .global gUnknown_080D7B50
gUnknown_080D7B50:
    .incbin "baserom.gba", 0x000D7B50, 0x18

    .global gUnknown_080D7B68
gUnknown_080D7B68:
    .incbin "baserom.gba", 0x000D7B68, 0x8

    .global gUnknown_080D7B70
gUnknown_080D7B70:
    .incbin "baserom.gba", 0x000D7B70, 0x20

    .global gUnknown_080D7B90
gUnknown_080D7B90:
    .incbin "baserom.gba", 0x000D7B90, 0x20

.text
.syntax unified
.arm

	thumb_func_start sub_803EAF4
sub_803EAF4: @ 0x0803EAF4
	sub sp, #4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov r8, r1
	mov sb, r2
	str r3, [sp, #0x28]
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r0, _0803EBA0 @ =sub_803EBBC
	movs r2, #0xc4
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0803EBA4 @ =gCamera
	ldr r0, [r2]
	mov r7, r8
	subs r0, r7, r0
	str r0, [r1]
	ldr r0, [r2, #4]
	mov r2, sb
	subs r0, r2, r0
	str r0, [r1, #4]
	movs r7, #0
	mov sl, r7
	strh r6, [r1, #8]
	strh r6, [r1, #0xa]
	ldr r0, [sp, #4]
	str r0, [r1, #0x10]
	ldr r2, _0803EBA8 @ =IWRAM_START + 0x14
	adds r1, r3, r2
	mov r7, r8
	strh r7, [r1, #0x16]
	mov r0, sb
	strh r0, [r1, #0x18]
	str r4, [r1, #4]
	strh r5, [r1, #0xa]
	lsrs r2, r5, #0x10
	ldr r4, _0803EBAC @ =IWRAM_START + 0x34
	adds r0, r3, r4
	strb r2, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r7, _0803EBB0 @ =IWRAM_START + 0x35
	adds r2, r3, r7
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0803EBB4 @ =IWRAM_START + 0x36
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0803EBB8 @ =IWRAM_START + 0x39
	adds r3, r3, r2
	mov r4, sl
	strb r4, [r3]
	subs r0, #0x11
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0
_0803EBA0: .4byte sub_803EBBC
_0803EBA4: .4byte gCamera
_0803EBA8: .4byte IWRAM_START + 0x14
_0803EBAC: .4byte IWRAM_START + 0x34
_0803EBB0: .4byte IWRAM_START + 0x35
_0803EBB4: .4byte IWRAM_START + 0x36
_0803EBB8: .4byte IWRAM_START + 0x39

	thumb_func_start sub_803EBBC
sub_803EBBC: @ 0x0803EBBC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803EC6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r6, _0803EC70 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803EBEE
	ldr r2, _0803EC74 @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2, #0x38]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #4]
_0803EBEE:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EC4C
	ldr r3, _0803EC74 @ =gCamera
	ldr r1, [r4]
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r6, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r6, r0, #0
	cmp r6, #1
	bne _0803EC4C
	ldr r2, [r4, #0x10]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EC4C
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r3, r2, #0
	adds r3, #0x73
	movs r0, #0x1e
	strb r0, [r3]
	ldr r0, _0803EC78 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r2, r1
	strb r6, [r0]
	ldr r0, _0803EC7C @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803EC4C:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _0803EC5E
	ldr r0, _0803EC6C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803EC80 @ =sub_803EC84
	str r0, [r1, #8]
_0803EC5E:
	adds r0, r5, #0
	bl DisplaySprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803EC6C: .4byte gCurTask
_0803EC70: .4byte gPlayer
_0803EC74: .4byte gCamera
_0803EC78: .4byte 0x00000275
_0803EC7C: .4byte 0x000001A5
_0803EC80: .4byte sub_803EC84

	thumb_func_start sub_803EC84
sub_803EC84: @ 0x0803EC84
	push {lr}
	ldr r0, _0803EC94 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0803EC94: .4byte gCurTask
