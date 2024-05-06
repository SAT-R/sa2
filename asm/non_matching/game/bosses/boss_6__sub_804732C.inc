
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov ip, r0
	mov r1, ip
	adds r1, #0x6c
	movs r2, #0
	strh r2, [r0, #0x1c]
	ldr r0, [r0, #4]
	mov r3, ip
	str r0, [r3, #0x6c]
	ldr r0, [r3, #8]
	str r0, [r1, #4]
	movs r0, #0xb0
	lsls r0, r0, #3
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r1, #0x10]
	movs r7, #0
	adds r3, #0xd0
	str r3, [sp, #0xc]
	mov r4, ip
	adds r4, #0xd4
	str r4, [sp, #0x14]
	mov r6, ip
	adds r6, #0xd8
	str r6, [sp, #0x1c]
	mov r0, ip
	adds r0, #0xdc
	str r0, [sp, #0x20]
	adds r1, #0x74
	str r1, [sp, #0x24]
	mov r2, ip
	adds r2, #0x80
	str r2, [sp]
	subs r3, #0x4c
	str r3, [sp, #4]
	subs r4, #0x4c
	str r4, [sp, #8]
	subs r6, #0x4c
	str r6, [sp, #0x10]
	subs r0, #0x4c
	str r0, [sp, #0x18]
_0804738C:
	lsls r1, r7, #0x10
	mov r2, ip
	ldr r0, [r2, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x16
	movs r6, #0
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	mov sl, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r5, r3
	lsls r0, r0, #1
	ldr r4, _080474B8 @ =gSineTable
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sb, r1
	lsls r0, r5, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r3, [r0, r4]
	mov r8, r3
_080473BE:
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	add r2, sl
	ldr r0, [sp, #0xc]
	adds r0, r0, r2
	str r0, [sp, #0x28]
	ldr r1, _080474BC @ =gUnknown_080D8030
	adds r0, r6, r1
	ldrb r3, [r0]
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #6
	mov r4, ip
	ldr r0, [r4, #4]
	adds r0, r0, r1
	ldr r1, [sp, #0x28]
	str r0, [r1]
	ldr r0, [sp, #0x14]
	adds r4, r0, r2
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #6
	mov r3, ip
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r4]
	ldr r4, [sp, #0x1c]
	adds r3, r4, r2
	movs r1, #7
	subs r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [r3]
	ldr r0, [sp, #0x20]
	adds r1, r0, r2
	movs r0, #1
	str r0, [r1]
	ldr r1, [sp, #0x24]
	adds r2, r1, r2
	str r5, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080473BE
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0804738C
	movs r7, #0
	ldr r2, _080474BC @ =gUnknown_080D8030
	ldrb r4, [r2, #3]
	ldr r3, _080474B8 @ =gSineTable
	mov r8, r3
	movs r1, #6
	subs r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	mov sb, r0
_0804743C:
	lsls r1, r7, #0x10
	mov r6, ip
	ldr r0, [r6, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x16
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #2
	ldr r0, [sp]
	adds r3, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	lsls r0, r0, #1
	add r0, r8
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r1, r4, #0
	muls r1, r0, r1
	asrs r1, r1, #6
	mov r6, ip
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r3, r0, r2
	lsls r0, r5, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r3]
	ldr r3, [sp, #8]
	adds r0, r3, r2
	mov r6, sb
	str r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	str r0, [r1]
	ldr r1, [sp, #0x18]
	adds r2, r1, r2
	str r5, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0804743C
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080474B8: .4byte gSineTable
_080474BC: .4byte gUnknown_080D8030

	
.syntax divided
