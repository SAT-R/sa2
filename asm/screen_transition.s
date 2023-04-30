.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start RunTransition
RunTransition: @ 0x0802D4CC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D504
	ldr r2, _0802D4FC @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D500 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D520
	.align 2, 0
_0802D4FC: .4byte gDispCnt
_0802D500: .4byte gWinRegs
_0802D504:
	ldr r2, _0802D54C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D550 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D520:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D554 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D558
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D562
	.align 2, 0
_0802D54C: .4byte gDispCnt
_0802D550: .4byte gWinRegs
_0802D554: .4byte gBldRegs
_0802D558:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D562:
	strh r0, [r2, #4]
	ldrh r4, [r3, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D572
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D572:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r3, #6]
	adds r0, r4, r0
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	ldr r1, _0802D58C @ =0x1FFF0000
	cmp r0, r1
	bgt _0802D590
	movs r0, #0
	b _0802D598
	.align 2, 0
_0802D58C: .4byte 0x1FFF0000
_0802D590:
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #1
_0802D598:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802D5A0
sub_802D5A0: @ 0x0802D5A0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D5D8
	ldr r2, _0802D5D0 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D5D4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D5F4
	.align 2, 0
_0802D5D0: .4byte gDispCnt
_0802D5D4: .4byte gWinRegs
_0802D5D8:
	ldr r2, _0802D620 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D624 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D5F4:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D628 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D62C
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D636
	.align 2, 0
_0802D620: .4byte gDispCnt
_0802D624: .4byte gWinRegs
_0802D628: .4byte gBldRegs
_0802D62C:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D636:
	strh r0, [r2, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D644
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D644:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
