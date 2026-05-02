.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802B168 @ =gUnknown_03005690
	ldr r5, _0802B16C @ =gUnknown_030055F0+0xC
	adds r7, r5, #0
	subs r7, #0xc
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldrh r0, [r4, #0x12]
	adds r0, #0x10
	ldr r2, _0802B170 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4, #0x12]
	ldr r1, _0802B174 @ =gSineTable
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	strh r0, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	beq _0802B0C8
	movs r0, #0xff
	lsls r0, r0, #8
_0802B0C8:
	strh r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_802A068
	adds r0, r4, #0
	bl sub_802A248
	adds r0, r4, #0
	bl sub_802A4C4
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_802BE0C
	adds r0, r5, #0
	bl DisplaySprite
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0xb4
	bne _0802B110
	ldr r1, _0802B178 @ =gSpecialStageTargetRings
	ldr r0, _0802B17C @ =gUnknown_03005070
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, #0x8c
	lsls r0, r0, #5
	ldr r1, _0802B180 @ =0x00001181
	bl TasksDestroyInPriorityRange
	movs r0, #0
	bl sub_805C448
_0802B110:
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802B13C
	subs r0, r1, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802B13C
	adds r2, r4, #0
	adds r2, #0x4a
	movs r1, #1
	movs r0, #1
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0802B13C:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802B160
	ldr r0, _0802B184 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802B188 @ =Task_802A560
	str r0, [r1, #8]
	movs r0, #0
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r1, #0x14
	movs r0, #0xc
	strb r0, [r1]
_0802B160:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B168: .4byte gUnknown_03005690
_0802B16C: .4byte gUnknown_030055F0+0xC
_0802B170: .4byte 0x000003FF
_0802B174: .4byte gSineTable
_0802B178: .4byte gSpecialStageTargetRings
_0802B17C: .4byte gUnknown_03005070
_0802B180: .4byte 0x00001181
_0802B184: .4byte gCurTask
_0802B188: .4byte Task_802A560

.syntax divided
