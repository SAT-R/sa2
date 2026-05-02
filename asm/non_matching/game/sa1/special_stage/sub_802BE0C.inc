.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov sb, r0
	adds r6, r1, #0
	ldr r0, [r0, #0xc]
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _0802BEC6
	mov r1, sp
	ldrh r0, [r6, #2]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r6, #4]
	strh r0, [r1]
	add r4, sp, #0xc
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r4]
	ldr r1, _0802BED4 @ =gUnknown_030057E0
	ldrh r0, [r4]
	adds r0, r0, r1
	movs r7, #0
	ldrsb r7, [r0, r7]
	cmp r7, #0
	bne _0802BE7C
	ldrh r0, [r4]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r4, [r4]
	lsls r4, r4, #5
	ldr r0, _0802BED8 @ =gOamBuffer+0x6
	adds r4, r4, r0
	movs r5, #0x80
	lsls r5, r5, #9
	movs r0, #2
	ldrsh r1, [r6, r0]
	adds r0, r5, #0
	bl Div
	strh r0, [r4]
	strh r7, [r4, #8]
	strh r7, [r4, #0x10]
	movs r0, #4
	ldrsh r1, [r6, r0]
	adds r0, r5, #0
	bl Div
	strh r0, [r4, #0x18]
_0802BE7C:
	movs r1, #6
	ldrsh r2, [r6, r1]
	movs r4, #2
	ldrsh r3, [r6, r4]
	mov r1, r8
	movs r4, #8
	ldrsh r0, [r1, r4]
	ldrh r1, [r1, #4]
	lsrs r1, r1, #1
	subs r0, r0, r1
	muls r0, r3, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	subs r2, r2, r0
	str r2, [sp, #4]
	movs r0, #8
	ldrsh r2, [r6, r0]
	movs r1, #4
	ldrsh r3, [r6, r1]
	mov r4, r8
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #6]
	lsrs r1, r1, #1
	subs r0, r0, r1
	muls r0, r3, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	subs r2, r2, r0
	str r2, [sp, #8]
	ldr r0, [sp, #4]
	mov r4, sb
	strh r0, [r4, #0x16]
	ldr r0, [sp, #8]
	strh r0, [r4, #0x18]
_0802BEC6:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BED4: .4byte gUnknown_030057E0
_0802BED8: .4byte gOamBuffer+0x6

.syntax divided
