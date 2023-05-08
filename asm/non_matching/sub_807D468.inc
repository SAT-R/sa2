.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807D478
	cmp r0, #2
	bne _0807D494
_0807D478:
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r2, _0807D490 @ =gPlayer
	ldr r1, [r2, #8]
	subs r3, r0, r1
	b _0807D4A8
	.align 2, 0
_0807D490: .4byte gPlayer
_0807D494:
	ldr r2, _0807D4CC @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x48
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r2, #8]
	subs r3, r1, r0
_0807D4A8:
	adds r6, r2, #0
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	lsls r0, r1, #8
	subs r0, r0, r3
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0
	blt _0807D4D0
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807D4D2
	adds r0, r1, #0
	b _0807D4D2
	.align 2, 0
_0807D4CC: .4byte gPlayer
_0807D4D0:
	movs r0, #0
_0807D4D2:
	lsls r0, r0, #4
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r4, #0
	adds r0, #0x52
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r5, [r0]
	cmp r5, #0
	beq _0807D4FA
	cmp r5, #2
	bne _0807D558
_0807D4FA:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _0807D516
	ldrh r0, [r6, #0x14]
	subs r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl ClampPlayerSpeed
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x10]
	subs r0, #0x40
	b _0807D572
_0807D516:
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r6, #8]
	subs r2, r0, r1
	str r2, [r6, #8]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, _0807D554 @ =0xFFFFD000
	adds r3, r0, r1
	cmp r5, #2
	beq _0807D53C
	cmp r2, r3
	ble _0807D53C
	str r3, [r6, #8]
_0807D53C:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807D5C4
	ldr r0, [r6, #0x20]
	movs r1, #1
	orrs r0, r1
	b _0807D5BC
	.align 2, 0
_0807D554: .4byte 0xFFFFD000
_0807D558:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	ble _0807D57E
	ldrh r0, [r6, #0x14]
	adds r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl ClampPlayerSpeed
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x10]
	adds r0, #0x40
_0807D572:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl ClampPlayerSpeed
	strh r0, [r6, #0x10]
	b _0807D5C4
_0807D57E:
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r6, #8]
	adds r2, r0, r1
	str r2, [r6, #8]
	adds r0, r4, #0
	adds r0, #0x48
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r3, r0, r1
	cmp r5, #3
	beq _0807D5A6
	cmp r2, r3
	bge _0807D5A6
	str r3, [r6, #8]
_0807D5A6:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807D5C4
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_0807D5BC:
	str r0, [r6, #0x20]
	ldrh r0, [r6, #0x14]
	rsbs r0, r0, #0
	strh r0, [r6, #0x14]
_0807D5C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	
.syntax divided
