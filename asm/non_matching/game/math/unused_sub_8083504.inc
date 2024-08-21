.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0808352E
	ldr r0, [r6, #8]
	muls r0, r1, r0
	asrs r3, r0, #0xa
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r7, #2]
	b _08083530
_0808352E:
	ldr r3, [r6, #8]
_08083530:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0808354E
	ldr r0, [r6, #0xc]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #4
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r7, #4]
	b _08083550
_0808354E:
	ldr r4, [r6, #0xc]
_08083550:
	ldrh r0, [r5]
	cmp r0, #0
	beq _080835B8
	ldr r0, _080835B4 @ =gSineTable
	mov ip, r0
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r3, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r5, #8]
	adds r0, r0, r2
	str r0, [r7, #8]
	ldrh r1, [r5]
	lsls r0, r1, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r3, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	b _080835C2
	.align 2, 0
_080835B4: .4byte gSineTable
_080835B8:
	ldr r0, [r5, #8]
	adds r0, r0, r3
	str r0, [r7, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r4
_080835C2:
	str r0, [r7, #0xc]
	ldrh r0, [r5]
	ldrh r6, [r6]
	adds r0, r0, r6
	ldr r2, _080835DC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080835DC: .4byte 0x000003FF

.syntax divided
