.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0805E954 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x30
	adds r0, r0, r1
	mov sb, r0
	ldr r5, [r4, #0x78]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0805E8BC
	ldr r0, _0805E958 @ =0x00143000
	ldr r1, _0805E95C @ =0x0000201C
	bl Div
	adds r0, #1
	muls r0, r5, r0
	str r0, [r4, #0x7c]
_0805E8BC:
	ldr r0, [r4, #0x7c]
	lsrs r2, r0, #8
	adds r0, r2, #0
	subs r0, #0xc
	cmp r0, #0x9a
	bls _0805E9A2
	subs r0, #0x8a
	lsrs r6, r0, #4
	subs r0, #0x10
	movs r1, #0x10
	bl Mod
	adds r0, #4
	mov sl, r0
	movs r5, #0xff
	movs r3, #0
	ldr r1, _0805E960 @ =gUnknown_086886A0
	mov ip, r1
	mov r7, ip
_0805E8E2:
	movs r2, #0
_0805E8E4:
	lsls r0, r2, #2
	adds r0, r0, r7
	adds r1, r6, r3
	ldr r0, [r0]
	cmp r0, r1
	bne _0805E8F8
	adds r5, r2, #0
	mov r8, r3
	movs r3, #0xa
	movs r2, #5
_0805E8F8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0805E8E4
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bls _0805E8E2
	mov r2, ip
	ldr r0, [r2, #0xc]
	subs r0, #3
	cmp r6, r0
	blo _0805E91C
	movs r5, #3
	movs r0, #0
	mov r8, r0
_0805E91C:
	cmp r5, #0xff
	beq _0805E9A2
	movs r0, #0x18
	mov r1, sl
	subs r0, r0, r1
	mov r2, r8
	lsls r1, r2, #4
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9a
	bgt _0805E9A2
	movs r2, #0x78
	strh r2, [r4, #0x16]
	cmp r5, #0
	beq _0805E996
	cmp r5, #1
	beq _0805E946
	cmp r5, #2
	bne _0805E964
_0805E946:
	movs r0, #0xb9
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r5, [r0]
	b _0805E996
	.align 2, 0
_0805E954: .4byte gCurTask
_0805E958: .4byte 0x00143000
_0805E95C: .4byte 0x0000201C
_0805E960: .4byte gUnknown_086886A0
_0805E964:
	movs r0, #0xb9
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	cmp r0, #0x4f
	bgt _0805E97E
	movs r0, #0x50
	strh r0, [r4, #0x18]
_0805E97E:
	mov r0, sb
	strh r2, [r0, #0x16]
	ldrh r0, [r4, #0x18]
	adds r0, #0x28
	mov r1, sb
	strh r0, [r1, #0x18]
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
_0805E996:
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_0805E9A2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
