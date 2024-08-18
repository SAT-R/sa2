

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r3, #0
	ldr r3, [r1]
	str r3, [r5, #0x14]
	ldr r4, [r1, #4]
	str r4, [r5, #0x18]
	ldr r1, [r1, #8]
	str r1, [r5, #0x1c]
	adds r6, r5, #0
	adds r6, #0xe
	ldr r0, [r2]
	subs r0, r0, r3
	movs r3, #0
	strh r0, [r5, #0xe]
	ldr r0, [r2, #4]
	subs r0, r0, r4
	strh r0, [r6, #2]
	ldr r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0x12
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084CB0
	rsbs r0, r0, #0
_08084CB0:
	cmp r0, #0x20
	ble _08084D02
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #0xe]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084D0C
_08084D02:
	strh r3, [r5, #0xe]
	strh r3, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0x12]
_08084D0C:
	adds r3, r5, #0
	adds r3, #0xe
	adds r4, r5, #2
	movs r6, #2
	ldrsh r1, [r7, r6]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r1, r0, r1
	movs r6, #4
	ldrsh r2, [r7, r6]
	movs r6, #2
	ldrsh r0, [r3, r6]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r0, #0
	mov ip, r0
	strh r1, [r5, #2]
	movs r2, #4
	ldrsh r1, [r7, r2]
	movs r6, #0xe
	ldrsh r0, [r5, r6]
	muls r0, r1, r0
	movs r1, #0
	ldrsh r2, [r7, r1]
	movs r6, #4
	ldrsh r1, [r3, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	movs r6, #2
	ldrsh r2, [r7, r6]
	movs r6, #0xe
	ldrsh r1, [r5, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r1, #4
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r6, #6
	ldrsh r1, [r5, r6]
	adds r0, r0, r1
	adds r7, r3, #0
	cmp r0, #0
	bge _08084D7C
	rsbs r0, r0, #0
_08084D7C:
	cmp r0, #0x20
	ble _08084DCE
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #2
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #2]
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	b _08084DDA
_08084DCE:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #2]
	mov r3, ip
	strh r3, [r5, #4]
	strh r3, [r5, #6]
_08084DDA:
	adds r6, r5, #0
	adds r6, #8
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r2, #4
	ldrsh r0, [r4, r2]
	muls r1, r0, r1
	movs r3, #4
	ldrsh r2, [r7, r3]
	movs r3, #2
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r3, #0
	strh r1, [r5, #8]
	movs r0, #4
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	mov ip, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	mov r2, ip
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r4, #2
	ldrsh r2, [r7, r4]
	movs r4, #2
	ldrsh r1, [r5, r4]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r0, #8
	ldrsh r2, [r5, r0]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0xc
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084E4A
	rsbs r0, r0, #0
_08084E4A:
	cmp r0, #0x20
	ble _08084E9C
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #8]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084EA6
_08084E9C:
	strh r3, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0xa]
	strh r3, [r5, #0xc]
_08084EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
    
    @ Called in math_0.s (unused sub_80851E0)
	
.syntax divided
