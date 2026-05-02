.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0804DBFC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0     @ r6 = bridge
	movs r0, #0
	mov sl, r0          @ sl = i = 0
_0804DB92_loop:
	ldr r5, _0804DC00 @ =gPlayer
	mov r1, sl
	cmp r1, #0
	beq _0804DB9C
	ldr r5, _0804DC04 @ =gPartner
_0804DB9C:
	ldr r0, [r5]
	asrs r0, r0, #8
	mov sb, r0          @ sb = playerWorldX
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	movs r1, #0xf
	ldrsb r1, [r5, r1]
	adds r7, r0, r1     @ r7 = playerWorldY
	ldr r3, _0804DC08 @ =gCamera
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r6, #4]
	cmp r1, r0
	bgt _0804DBDE
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0804DBDE
	movs r0, #2
	ldrsh r2, [r3, r0]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r6, #8]
	cmp r1, r0
	bgt _0804DBDE
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	bge _0804DC10
_0804DBDE:
	ldr r1, [r6]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _0804DC0C @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r0, _0804DBFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0804DDA6_return
	.align 2, 0
_0804DBFC: .4byte gCurTask
_0804DC00: .4byte gPlayer
_0804DC04: .4byte gPartner
_0804DC08: .4byte gCamera
_0804DC0C: .4byte 0xFFFF7FFF
_0804DC10:
	ldr r2, [r6, #0xc]
	cmp r2, sb
	ble _0804DC18
	b _0804DD6C
_0804DC18:
	ldr r0, [r6, #0x10]
	cmp sb, r0
	blt _0804DC20
	b _0804DD6C
_0804DC20:
	ldr r0, [r6, #0x14]
	cmp r0, r7
	ble _0804DC28
	b _0804DD6C
_0804DC28:
	ldr r4, [r6, #0x18]
	cmp r7, r4
	ble _0804DC30
	b _0804DD6C
_0804DC30:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804DC3C
	b _0804DDA6_return
_0804DC3C:
	mov r1, sb          @ r1 = sb = playerWorldX
	subs r0, r1, r2
	lsls r0, r0, #9
	ldr r1, [r6, #0x1c]
	bl __divsi3
	adds r2, r0, #0     @ r2 = theta
	cmp r2, #0
	blt _0804DC5C
	ldr r1, _0804DC58 @ =0x000001FF
	cmp r0, r1
	ble _0804DC5E
	adds r0, r1, #0
	b _0804DC5E
	.align 2, 0
_0804DC58: .4byte 0x000001FF
_0804DC5C:
	movs r0, #0
_0804DC5E:
	adds r2, r0, #0     @ r2 = theta
	ldr r3, _0804DCBC @ =gSineTable
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [r6, #0x20]
	muls r1, r0, r1
	lsls r0, r4, #8
	subs r0, r0, r1
	asrs r0, r0, #8     @ r0 = x = (Q(bridge->bottom) - ((SIN_24_8(theta) * bridge->height))) >> 8;
	cmp r7, r0
	blt _0804DD6C
	adds r0, #0x20
	cmp r7, r0
	bgt _0804DD6C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r8, r0          @ r8 = r8
	ldr r0, [r5, #0x10]
	movs r4, #0x80
	lsls r4, r4, #8
	ands r0, r4
	cmp r0, #0
	bne _0804DCAA
	movs r0, #0xb1
	bl m4aSongNumStartOrChange
	ldr r0, [r5, #0x10]
	orrs r0, r4
	str r0, [r5, #0x10]
_0804DCAA:
	ldr r0, [r5, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0804DCC0
	movs r2, #8
	ldrsh r1, [r5, r2]
	b _0804DCC4
	.align 2, 0
_0804DCBC: .4byte gSineTable
_0804DCC0:
	movs r0, #0xc
	ldrsh r1, [r5, r0]
_0804DCC4:
	adds r1, #0x40
	ldr r0, _0804DD00 @ =0xFFFFF800
	cmp r1, r0
	blt _0804DCD8
	adds r0, r1, #0
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	ble _0804DCD8
	adds r0, r1, #0
_0804DCD8:
	adds r1, r0, #0
	strh r1, [r5, #0xc]
	strh r1, [r5, #8]
	ldr r0, [r6, #0x20]
	rsbs r0, r0, #0
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	muls r0, r1, r0
	asrs r0, r0, #0x10
	subs r0, #0x2a
	ldr r1, _0804DD00 @ =0xFFFFF800
	cmp r0, r1
	blt _0804DD04
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	ble _0804DD06
	adds r0, r1, #0
	b _0804DD06
	.align 2, 0
_0804DD00: .4byte 0xFFFFF800
_0804DD04:
	adds r0, r1, #0
_0804DD06:
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	bl Player_TransitionCancelFlyingAndBoost
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xf
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #9
	strb r0, [r5, #0xf]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x10]
	movs r0, #0
	strh r0, [r5, #0x3a]
	strh r0, [r5, #0x38]
	adds r4, r6, #0     @ r4 = r6 = bridge
	adds r4, #0x24
	ldr r1, _0804DD68 @ =gCamera
	ldrh r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r4, #0x16]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	subs r0, r7, r0
	ldrh r1, [r1, #2]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	b _0804DD94_continue
	.align 2, 0
_0804DD68: .4byte gCamera
_0804DD6C:
	ldr r1, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _0804DD8C
	ldr r0, _0804DDB4 @ =0xFFDFFFFF
	ands r1, r0
	str r1, [r5, #0x10]
	ldr r0, _0804DDB8 @ =gPlayerControls
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	orrs r1, r0
	ldrh r0, [r5, #0x38]
	orrs r1, r0
	strh r1, [r5, #0x38]
_0804DD8C:
	ldr r0, [r5, #0x10]
	ldr r1, _0804DDBC @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r5, #0x10]
_0804DD94_continue:
	movs r0, #1
	add sl, r0
	ldr r0, _0804DDC0 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sl, r0
	bge _0804DDA6_return
	b _0804DB92_loop
_0804DDA6_return:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DDB4: .4byte 0xFFDFFFFF
_0804DDB8: .4byte gPlayerControls
_0804DDBC: .4byte 0xFFFF7FFF
_0804DDC0: .4byte gNumSingleplayerCharacters

.syntax divided
