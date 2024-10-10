.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083608
	ldr r0, [r5, #8]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	b _0808360A
_08083608:
	ldr r4, [r5, #8]
_0808360A:
	movs r0, #4
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083628
	ldr r0, [r5, #0xc]
	muls r0, r1, r0
	asrs r7, r0, #0xa
	movs r2, #4
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	b _0808362A
_08083628:
	ldr r7, [r5, #0xc]
_0808362A:
	ldrh r0, [r6]
	mov ip, r0
	mov r0, ip
	cmp r0, #0
	beq _08083694
	ldr r3, _08083690 @ =gSineTable
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r6, #8]
	adds r0, r0, r2
	str r0, [r5, #8]
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r6, #0xc]
	adds r0, r0, r2
	b _0808369E
	.align 2, 0
_08083690: .4byte gSineTable
_08083694:
	ldr r0, [r6, #8]
	adds r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r6, #0xc]
	adds r0, r0, r7
_0808369E:
	str r0, [r5, #0xc]
	ldrh r0, [r5]
	add r0, ip
	ldr r2, _080836B8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080836B8: .4byte 0x000003FF
	
.syntax divided
