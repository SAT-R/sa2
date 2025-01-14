
.syntax unified
.text
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r6, _08084C6C @ =gSineTable
	lsls r4, r2, #1
	adds r4, r4, r6
	ldrh r4, [r4]
	mov sl, r4
	mov r4, sl
	lsls r4, r4, #0x10
	mov sl, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov ip, r2
	mov r2, ip
	lsls r2, r2, #0x10
	mov ip, r2
	lsls r2, r1, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov r8, r2
	mov r2, r8
	lsls r2, r2, #0x10
	mov r8, r2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	mov sb, r1
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	lsls r1, r3, #1
	adds r1, r1, r6
	ldrh r5, [r1]
	lsls r5, r5, #0x10
	adds r3, r3, r4
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r4, [r3]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	mov r2, sb
	asrs r2, r2, #0x14
	mov sb, r2
	mov r2, sb
	muls r2, r4, r2
	asrs r2, r2, #0xa
	asrs r5, r5, #0x14
	mov r1, sl
	asrs r1, r1, #0x14
	mov sl, r1
	mov r3, sl
	muls r3, r5, r3
	asrs r3, r3, #0xa
	mov r1, r8
	asrs r1, r1, #0x14
	mov r8, r1
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	movs r6, #0
	strh r2, [r0, #2]
	mov r2, ip
	asrs r2, r2, #0x14
	mov ip, r2
	mov r1, ip
	muls r1, r5, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #4]
	rsbs r1, r4, #0
	mov r2, r8
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #6]
	rsbs r1, r5, #0
	mov r2, sb
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r3, sl
	muls r3, r4, r3
	asrs r3, r3, #0xa
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #8]
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xa]
	mov r2, r8
	muls r2, r5, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #0xc]
	mov r4, r8
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xe]
	mov r1, sl
	rsbs r1, r1, #0
	strh r1, [r0, #0x10]
	mov r2, sb
	mov r1, ip
	muls r1, r2, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0x12]
	str r6, [r0, #0x1c]
	str r6, [r0, #0x18]
	str r6, [r0, #0x14]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084C6C: .4byte gSineTable

    @ Unused
	
.syntax divided
