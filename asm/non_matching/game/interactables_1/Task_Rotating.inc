.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805ED20 @ =gCurTask
	ldr r2, [r0]
	ldrh r7, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sl, r0
	ldr r1, _0805ED24 @ =IWRAM_START + 0xC
	adds r1, r1, r7
	mov sb, r1
	ldr r3, [r0]
	str r3, [sp]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	mov r3, sl
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #8]
	ldrh r0, [r3, #0x3e]
	ldrh r1, [r3, #0x3c]
	adds r0, r0, r1
	ldr r3, _0805ED28 @ =0x00003FF0
	adds r1, r3, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1, #0x3c]
	ldr r3, _0805ED2C @ =0x000003FF
	mov r8, r3
	lsrs r6, r0, #4
	ldr r1, _0805ED30 @ =gCamera
	ldr r0, [r1]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	mov r3, sb
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	strh r0, [r3, #0x18]
	ldr r5, _0805ED34 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805ED3C
	ldr r0, _0805ED38 @ =Task_AfterJump
	str r0, [r2, #8]
	mov r0, sb
	bl DisplaySprite
	b _0805EF80
	.align 2, 0
_0805ED20: .4byte gCurTask
_0805ED24: .4byte IWRAM_START + 0xC
_0805ED28: .4byte 0x00003FF0
_0805ED2C: .4byte 0x000003FF
_0805ED30: .4byte gCamera
_0805ED34: .4byte gPlayer
_0805ED38: .4byte Task_AfterJump
_0805ED3C:
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0805ED98 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r4, [r0]
	ands r4, r1
	cmp r4, #0
	bne _0805ED4E
	b _0805EEC8
_0805ED4E:
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	mov r2, sl
	ldrb r0, [r2, #8]
	ldr r3, [sp]
	strb r0, [r3]
	adds r0, r5, #0
	bl Player_TransitionCancelFlyingAndBoost
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	ldr r1, _0805ED9C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r0, _0805EDA0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805EDA4 @ =Task_AfterJump
	str r0, [r1, #8]
	ldr r1, _0805EDA8 @ =IWRAM_START + 0x40
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805EDEC
	cmp r0, #1
	bgt _0805EDAC
	cmp r0, #0
	beq _0805EDB6
	b _0805EE80
	.align 2, 0
_0805ED98: .4byte gPlayerControls
_0805ED9C: .4byte 0xFFBFFFFF
_0805EDA0: .4byte gCurTask
_0805EDA4: .4byte Task_AfterJump
_0805EDA8: .4byte IWRAM_START + 0x40
_0805EDAC:
	cmp r0, #2
	beq _0805EE0C
	cmp r0, #3
	beq _0805EE44
	b _0805EE80
_0805EDB6:
	movs r0, #0x20
	subs r4, r0, r6
	mov r2, r8
	ands r4, r2
	ldr r2, _0805EDE8 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	b _0805EE76
	.align 2, 0
_0805EDE8: .4byte gSineTable
_0805EDEC:
	adds r4, r6, #0
	adds r4, #0x20
	mov r0, r8
	ands r4, r0
	ldr r2, _0805EE08 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	adds r0, r0, r1
	b _0805EE60
	.align 2, 0
_0805EE08: .4byte gSineTable
_0805EE0C:
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r4, r6, r0
	mov r1, r8
	ands r4, r1
	ldr r2, _0805EE40 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	b _0805EE76
	.align 2, 0
_0805EE40: .4byte gSineTable
_0805EE44:
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r1, #0
	subs r4, r0, r6
	mov r2, r8
	ands r4, r2
	ldr r2, _0805EE7C @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	subs r0, r0, r1
_0805EE60:
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
_0805EE76:
	str r0, [r5, #0xc]
	adds r6, r2, #0
	b _0805EE84
	.align 2, 0
_0805EE7C: .4byte gSineTable
_0805EE80:
	movs r4, #0
	ldr r6, _0805EEC0 @ =gSineTable
_0805EE84:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	movs r1, #0x11
	bl Div
	ldr r5, _0805EEC4 @ =gPlayer
	strh r0, [r5, #0x10]
	lsls r4, r4, #1
	adds r4, r4, r6
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	movs r1, #0x11
	bl Div
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r5, #0x6c
	movs r0, #1
	strb r0, [r5]
	b _0805EF2A
	.align 2, 0
_0805EEC0: .4byte gSineTable
_0805EEC4: .4byte gPlayer
_0805EEC8:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x2d
	bne _0805EEE6
	adds r0, r6, #0
	movs r1, #0x56
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EEF8
	b _0805EEF6
_0805EEE6:
	adds r0, r6, #0
	movs r1, #0x56
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EEF8
_0805EEF6:
	movs r2, #0xb
_0805EEF8:
	ldr r0, _0805EF64 @ =0x00000222
	mov r3, sb
	strh r0, [r3, #0xa]
	ldr r1, _0805EF68 @ =IWRAM_START + 0x2C
	adds r0, r7, r1
	strb r2, [r0]
	ldr r3, _0805EF6C @ =IWRAM_START + 0x2D
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x6c
	movs r0, #1
	strb r0, [r1]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r5, #8]
	ldr r2, [sp, #8]
	lsls r0, r2, #8
	str r0, [r5, #0xc]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
_0805EF2A:
	mov r3, sb
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805EF50
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805EF50
	movs r2, #0x18
	ldrsh r1, [r3, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805EF74
_0805EF50:
	mov r3, sl
	ldrb r0, [r3, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0805EF70 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805EF80
	.align 2, 0
_0805EF64: .4byte 0x00000222
_0805EF68: .4byte IWRAM_START + 0x2C
_0805EF6C: .4byte IWRAM_START + 0x2D
_0805EF70: .4byte gCurTask
_0805EF74:
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
_0805EF80:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
