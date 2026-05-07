.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r4, r1, #0 @ r4 = (sub_8052C84*)
	movs r7, #0
	strh r7, [r4, #0xe] @ param1->byteCount = 0;
	movs r5, #9
_08052EFE:
	adds r0, r6, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10  @ r0 = divRes
	mov r1, sp
	adds r3, r1, r5
	lsls r1, r0, #3
	lsls r2, r0, #1
	adds r1, r1, r2
	subs r1, r6, r1
	adds r1, #0x30
	strb r1, [r3]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldrh r1, [r4, #0xe]
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	subs r5, #1
	cmp r5, #0
	bge _08052EFE
	movs r5, #0
	mov r0, sp
	ldrb r0, [r0]
	ldrh r2, [r4]
	ldrh r3, [r4, #0xa]
	cmp r0, #0x30
	bne _08052F56
	adds r7, #1
	strh r1, [r4, #0xe]
_08052F3C:
	adds r5, #1
	cmp r5, #9
	bgt _08052F56
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0x30
	bne _08052F56
	adds r7, #1
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	b _08052F3C
_08052F56:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	subs r0, #1
	muls r0, r2, r0
	asrs r0, r0, #5
	subs r0, r3, r0
	strh r0, [r4, #0xa]
	mov r1, sp
	adds r0, r1, r7
	adds r1, r4, #0
	bl sub_8052C84
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
