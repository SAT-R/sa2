

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r7, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, ip
	movs r0, #0
	ldr r4, _08084B50 @ =gSineTable
	movs r3, #0
_08084A3A:
	stm r2!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084A3A
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	mov r3, r8
	strh r3, [r2, #0x12]
	strh r3, [r2, #0xa]
	strh r3, [r2, #2]
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r5, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r6, [r0]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x14
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #2
	ldrsh r4, [r7, r1]
	adds r0, r3, #0
	muls r0, r4, r0
	asrs r0, r0, #0xa
	mov r2, r8
	subs r2, r2, r6
	mov r8, r2
	mov r1, r8
	muls r1, r0, r1
	lsls r1, r1, #6
	movs r0, #4
	ldrsh r2, [r7, r0]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r4, r8
	muls r4, r0, r4
	lsls r4, r4, #6
	adds r0, r3, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	lsls r2, r2, #6
	adds r0, r3, #0
	muls r0, r3, r0
	asrs r0, r0, #0xa
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #2]
	movs r3, #4
	ldrsh r0, [r7, r3]
	asrs r5, r5, #0x14
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r1, r1, #0x10
	adds r0, r1, r0
	mov r3, ip
	strh r0, [r3, #4]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r2, r2, #0x10
	subs r0, r2, r0
	mov r3, ip
	strh r0, [r3, #6]
	movs r3, #4
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r1, r1, r0
	mov r0, ip
	strh r1, [r0, #8]
	movs r1, #2
	ldrsh r0, [r7, r1]
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #0xa]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r4, r4, #0x10
	adds r0, r4, r0
	strh r0, [r3, #0xc]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0, #0xe]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r4, r4, r0
	mov r2, ip
	strh r4, [r2, #0x10]
	movs r3, #4
	ldrsh r0, [r7, r3]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xa
	adds r6, r6, r0
	mov r3, ip
	strh r6, [r3, #0x12]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B50: .4byte gSineTable

.syntax divided
