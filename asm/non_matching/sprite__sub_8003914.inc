.include "constants/constants.inc"

@ sub_08003914
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, _08003994 @ =gUnknown_03004D10
	ldr r1, _08003998 @ =gUnknown_03005390
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	str r6, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080039D6
	mov r8, r1
	ldr r0, [r6, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #9
	ands r0, r1
	lsrs r7, r0, #0xf
	cmp r7, #1
	bls _080039A4
	ldr r0, _0800399C @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080039A4
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #0x10
	bl Mod
	ldr r5, _080039A0 @ =gBgAffineRegs
	subs r4, r7, #2
	lsls r4, r4, #4
	adds r1, r5, #0
	adds r1, #8
	adds r1, r4, r1
	lsls r0, r0, #8
	str r0, [r1]
	mov r1, r8
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #8
	bl Mod
	adds r5, #0xc
	adds r4, r4, r5
	lsls r0, r0, #8
	str r0, [r4]
	b _080039D6
	.align 2, 0
_08003994: .4byte gUnknown_03004D10
_08003998: .4byte gUnknown_03005390
_0800399C: .4byte gDispCnt
_080039A0: .4byte gBgAffineRegs
_080039A4:
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #0x10
	bl Mod
	ldr r4, _080039E0 @ =gBgScrollRegs
	lsls r5, r7, #2
	adds r1, r5, r4
	strh r0, [r1]
	mov r1, r8
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #8
	bl Mod
	adds r4, #2
	adds r5, r5, r4
	strh r0, [r5]
_080039D6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080039E0: .4byte gBgScrollRegs

.syntax divided
