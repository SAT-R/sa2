.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

@ TODO: Integrate this into boss_3.c !

.if 01
	thumb_func_start Task_EggTotemBullet_
Task_EggTotemBullet_: @ 0x08041420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08041458 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0         @ r4 = bullet
	adds r0, #0x10
	adds r6, r1, r0         @ r6 = s
	ldr r2, _0804145C @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov ip, r2
	cmp r1, #0
	beq _08041464
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r7, _08041460 @ =0xFFFFFB00
	adds r0, r0, r7
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08041480
	.align 2, 0
_08041458: .4byte gCurTask
_0804145C: .4byte gPlayer
_08041460: .4byte 0xFFFFFB00
_08041464:
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r2, _080414E8 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08041480:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	strh r1, [r6, #0x18]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r2, r5
	bge _080414A6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	blt _080414E0
_080414A6:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	ble _080414B6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414B6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, r5
	bge _080414C6
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	cmp r0, #0
	blt _080414E0
_080414C6:
	cmp r1, #0xc0
	ble _080414D2
	movs r7, #0xa
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414D2:
	ldr r0, _080414EC @ =0xFFFFFE00
	cmp r2, r0
	blt _080414E0
	movs r0, #0xbc
	lsls r0, r0, #2
	cmp r2, r0
	ble _080414F0
_080414E0:
	ldr r0, [r3]
	bl TaskDestroy
	b _08041558
	.align 2, 0
_080414E8: .4byte gCamera
_080414EC: .4byte 0xFFFFFE00
_080414F0:
	ldr r0, [r4, #0xc]
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804154C
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _08041560 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	mov r0, ip
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r5, r0, #0
	cmp r5, #1
	bne _0804154C
	ldr r3, [r4, #0xc]
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804154C
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r2, r3, r1
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08041564 @ =0x00000275
	strh r0, [r2, #0xa]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r0, r3, r7
	strb r5, [r0]
	ldr r0, _08041568 @ =0x000002C9
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
_0804154C:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_08041558:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041560: .4byte gCamera
_08041564: .4byte 0x00000275
_08041568: .4byte 0x000002C9
.endif
