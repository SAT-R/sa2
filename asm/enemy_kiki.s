.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8053F24
sub_8053F24: @ 0x08053F24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08054020 @ =gUnknown_03005AFC
	mov ip, r0
	ldr r0, _08054024 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldrh r1, [r4, #0x16]
	mov r8, r1
	ldrh r2, [r4, #0x18]
	mov sb, r2
	ldr r0, [r4, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08053FFA
	mov r2, ip
	ldr r0, [r2, #0x28]
	cmp r0, r1
	beq _08053FFA
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _08054028 @ =IWRAM_START + 0x2C
	adds r1, r5, r2
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r3, r0, r6
	ldr r2, _0805402C @ =gPlayer
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	mov sl, r2
	cmp r3, r1
	bgt _08053F94
	ldr r2, _08054030 @ =IWRAM_START + 0x2E
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r1
	bge _08053FA6
	cmp r3, r1
	blt _08053FFA
_08053F94:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _08053FFA
_08053FA6:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0x2d
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r2, r0, r5
	mov r1, sl
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _08053FE2
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _08053FF4
	cmp r2, r3
	blt _08053FFA
_08053FE2:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _08053FFA
_08053FF4:
	mov r0, sl
	bl sub_800CBA4
_08053FFA:
	ldr r2, _08054034 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _08054038
	ldr r0, _08054024 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054046
	.align 2, 0
_08054020: .4byte gUnknown_03005AFC
_08054024: .4byte gCurTask
_08054028: .4byte IWRAM_START + 0x2C
_0805402C: .4byte gPlayer
_08054030: .4byte IWRAM_START + 0x2E
_08054034: .4byte gCamera
_08054038:
	adds r0, r4, #0
	bl DisplaySprite
	mov r2, r8
	strh r2, [r4, #0x16]
	mov r0, sb
	strh r0, [r4, #0x18]
_08054046:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8054054
sub_8054054: @ 0x08054054
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
