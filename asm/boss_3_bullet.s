.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

@ TODO: Integrate this into boss_3.c !

	thumb_func_start CreateEggTotemBullet
CreateEggTotemBullet: @ 0x080412F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _080413FC @ =Task_EggTotemBullet
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r7, #0
	str r7, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r1, _08041400 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r0, r6, r0
	str r0, [r4]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, r8
	subs r0, r1, r0
	str r0, [r4, #4]
	ldr r1, _08041404 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r2, r8
	asrs r2, r2, #8
	mov r8, r2
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	asrs r6, r6, #8
	str r6, [sp, #4]
	subs r1, r1, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08041408 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r6, #0
	ldrsh r1, [r1, r6]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	asrs r1, r1, #0xe
	movs r3, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	adds r1, r1, r6
	strh r1, [r4, #8]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0xa]
	mov r6, sl
	str r6, [r4, #0xc]
	ldr r0, _0804140C @ =IWRAM_START + 0x10
	adds r1, r5, r0
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r1, #0x16]
	mov r6, r8
	strh r6, [r1, #0x18]
	movs r0, #0xe6
	lsls r0, r0, #2
	add sl, r0
	mov r2, sl
	ldr r0, [r2]
	str r0, [r1, #4]
	ldr r0, _08041410 @ =0x00000292
	strh r0, [r1, #0xa]
	ldr r6, _08041414 @ =IWRAM_START + 0x30
	adds r0, r5, r6
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r7, [r1, #8]
	strh r7, [r1, #0x14]
	strh r7, [r1, #0x1c]
	ldr r0, _08041418 @ =IWRAM_START + 0x31
	adds r2, r5, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r6, #2
	adds r2, r5, r6
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0804141C @ =IWRAM_START + 0x35
	adds r5, r5, r0
	strb r3, [r5]
	movs r0, #1
	rsbs r0, r0, #0
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
	pop {r0}
	bx r0
	.align 2, 0
_080413FC: .4byte Task_EggTotemBullet
_08041400: .4byte gCamera
_08041404: .4byte gPlayer
_08041408: .4byte gSineTable
_0804140C: .4byte IWRAM_START + 0x10
_08041410: .4byte 0x00000292
_08041414: .4byte IWRAM_START + 0x30
_08041418: .4byte IWRAM_START + 0x31
_0804141C: .4byte IWRAM_START + 0x35

	thumb_func_start Task_EggTotemBullet
Task_EggTotemBullet: @ 0x08041420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08041458 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x10
	adds r6, r1, r0
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
