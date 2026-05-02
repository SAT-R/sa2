.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	ldr r4, _08045994   @ r4 = gPartner
	ldr r6, [r4, #0x64] @ r6 = gPartner.spriteInfoBody
	ldr r7, [r4, #0x68] @ r7 = gPartner.spriteInfoLimbs
	ldr r5, [r4, #4]    @ r5 = gPartner.qWorldY
	ldr r0, [r4, #0x10] @ r0 = gPartner.moveState
	ldr r3, _08045998   @ r3 = gCamera
	cmp r0, #0
	bge _080459A0
	ldr r2, _0804599C @ =gStageFlags
	b _08045A60
	.align 2, 0
_08045994: .4byte gPartner
_08045998: .4byte gCamera
_0804599C: .4byte gStageFlags
_080459A0:
	ldr r2, _080459BC @ =gStageFlags
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080459C4
	movs r1, #2
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	ldr r1, _080459C0 @ =0x0000EFFF
	adds r0, r0, r1
	cmp r5, r0
	blt _080459D2
	b _080459D8
	.align 2, 0
_080459BC: .4byte gStageFlags
_080459C0: .4byte 0x0000EFFF
_080459C4:
	movs r1, #2
	ldrsh r0, [r3, r1]
	subs r0, #0x50
	lsls r0, r0, #8
	movs r1, #1
	cmp r5, r0
	ble _080459D4
_080459D2:
	movs r1, #0
_080459D4:
	cmp r1, #0
	beq _08045A60
_080459D8:
	movs r2, #0
	ldrsh r0, [r3, r2]
	ldr r1, _08045A1C @ =0xFFFFFF00
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r4]
	movs r2, #2
	ldrsh r0, [r3, r2]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r4, #4]
	ldr r2, [r4, #0x64]
	ldr r0, [r2, #0x1c]
	ldr r1, _08045A20 @ =0xFFFFCFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r4, #0x10]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x60
	ands r0, r1
	str r0, [r4, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08045A24
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x39
	b _08045A2A
	.align 2, 0
_08045A1C: .4byte 0xFFFFFF00
_08045A20: .4byte 0xFFFFCFFF
_08045A24:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x35
_08045A2A:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x5b
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08045A4E
	movs r0, #0x1b
	bl m4aSongNumStop
_08045A4E:
	ldr r0, _08045A58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08045A5C @ =Task_8045AD8
	str r0, [r1, #8]
	b _08045AD0
	.align 2, 0
_08045A58: .4byte gCurTask
_08045A5C: .4byte Task_8045AD8
_08045A60:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _08045A94 @ =gPrevStageFlags
	ldrh r0, [r2]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08045A80
	ldrh r0, [r4, #0xa]
	rsbs r0, r0, #0
	strh r0, [r4, #0xa]
_08045A80:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08045A98
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #4]
	subs r0, r0, r1
	b _08045AA0
	.align 2, 0
_08045A94: .4byte gPrevStageFlags
_08045A98:
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #4]
	adds r0, r0, r1
_08045AA0:
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08045AB2
	ldrh r0, [r4, #0xa]
	adds r0, #0x2a
	b _08045AB6
_08045AB2:
	ldrh r0, [r4, #0xa]
	adds r0, #0xc
_08045AB6:
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sa2__sub_802486C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sa2__sub_8024B10
	adds r0, r4, #0
	adds r1, r7, #0
	bl sa2__sub_8024F74
_08045AD0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
