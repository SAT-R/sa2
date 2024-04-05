.include "constants/constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r5, #0
	ldr r6, _0804082C @ =gSineTable
_080407AC:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, ip
	adds r2, r1, r0         @ r2 = t3c
	ldrb r4, [r2, #0x13]
	cmp r4, #0
	beq _080408AE
	ldr r1, _08040830 @ =gUnknown_080D7E78
	ldrb r0, [r2, #0x12]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrb r0, [r2, #0x13]
	lsls r0, r0, #3
	adds r3, r3, r0         @ r3 = ptr
	ldrh r0, [r2, #0xe]
	subs r0, #1
	movs r1, #0
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040838
__middle:
	ldrh r0, [r3, #2]
	ldrh r4, [r2, #0x10]
	adds r0, r0, r4
	ldr r7, _08040834 @ =0x000003FF
	adds r4, r7, #0
	ands r0, r4
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0xa]
	ldr r0, [r3]
	cmp r0, #0x20
	bne _0804088C
	ldrh r0, [r3, #4]
	cmp r0, #0
	bne _0804088C
	ldrh r0, [r2, #0xc]
	adds r0, #0x10
	ands r0, r4
	strh r0, [r2, #0xc]
	b _0804088C
	.align 2, 0
_0804082C: .4byte gSineTable
_08040830: .4byte gUnknown_080D7E78
_08040834: .4byte 0x000003FF
_08040838:
	adds r3, #8
	ldrh r0, [r3]
	cmp r0, #0
	bne _0804084C
	strh r0, [r2, #0xe]
	strb r1, [r2, #0x13]
	strb r1, [r2, #0x12]
	strh r0, [r2, #0x10]
	strh r0, [r2, #8]
	b _0804088A
_0804084C:
	adds r0, r4, #1
	strb r0, [r2, #0x13]
	ldrh r0, [r3]
	strh r0, [r2, #0xe]
	ldrh r0, [r3, #2]
	ldrh r1, [r2, #0x10]
	adds r0, r0, r1
	ldr r4, _080408C0 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x10]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
_0804088A:
	strh r0, [r2, #0xa]
_0804088C:
	ldr r0, [r2]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	str r0, [r2]
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	mov r7, ip
	movs r3, #0x30
	ldrsh r0, [r7, r3]
	subs r1, r1, r0
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_080408AE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bhi _080408BA
	b _080407AC
_080408BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080408C0: .4byte 0x000003FF

.syntax divided
