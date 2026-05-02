.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0804482C @ =gCamera
	adds r6, r4, #0
	adds r6, #0x40
	movs r0, #2
	strb r0, [r6]
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08044868
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080447FE
	subs r0, #1
	strb r0, [r4, #0x15]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804484C
_080447FE:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080448CA
	ldr r0, _08044830 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08044834
	movs r2, #0x22
	ldrsh r0, [r5, r2]
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	adds r0, r0, r1
	cmp r0, #0x3b
	bgt _080448CA
	ldrh r0, [r5, #0x22]
	b _080448C6
	.align 2, 0
_0804482C: .4byte gCamera
_08044830: .4byte gStageFlags
_08044834:
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	movs r1, #0x3c
	rsbs r1, r1, #0
	cmp r0, r1
	ble _080448CA
	ldrh r0, [r5, #0x22]
	subs r0, #2
	b _080448C8
_0804484C:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080448CA
	ldrh r0, [r5, #0x22]
	movs r3, #0x22
	ldrsh r1, [r5, r3]
	cmp r1, #0
	ble _080448C2
	subs r0, #2
	b _080448C8
_08044868:
	adds r0, r4, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _080448CA
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r0, [r4, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #9
	strb r0, [r4, #0xf]
	movs r0, #5
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080448CA
	movs r0, #0x78
	strb r0, [r4, #0x15]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080448CA
	adds r2, r5, #0
	ldrh r0, [r2, #0x22]
	movs r3, #0x22
	ldrsh r1, [r2, r3]
	cmp r1, #0
	ble _080448C2
	subs r0, #2
	strh r0, [r2, #0x22]
	b _080448CA
_080448C2:
	cmp r1, #0
	bge _080448CA
_080448C6:
	adds r0, #2
_080448C8:
	strh r0, [r5, #0x22]
_080448CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

.syntax divided
