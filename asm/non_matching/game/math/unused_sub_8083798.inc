

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	movs r4, #0x80
	lsls r4, r4, #3
	cmp r0, r4
	beq _080837C2
	movs r0, #0x80
	lsls r0, r0, #0xd
	movs r2, #2
	ldrsh r1, [r7, r2]
	bl Div
	strh r0, [r7, #2]
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #8]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	str r0, [r7, #8]
_080837C2:
	movs r1, #4
	ldrsh r0, [r7, r1]
	cmp r0, r4
	beq _080837E4
	movs r0, #0x80
	lsls r0, r0, #0xd
	movs r2, #4
	ldrsh r1, [r7, r2]
	bl Div
	strh r0, [r7, #4]
	movs r0, #4
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #0xc]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	str r0, [r7, #0xc]
_080837E4:
	ldrh r0, [r7]
	subs r0, r4, r0
	ldr r2, _0808383C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r7]
	cmp r0, #0
	beq _08083844
	ldr r5, [r7, #8]
	rsbs r5, r5, #0
	ldr r6, _08083840 @ =gSineTable
	ldrh r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r3, [r0]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	adds r4, r5, #0
	muls r4, r3, r4
	asrs r4, r4, #8
	ldr r2, [r7, #0xc]
	rsbs r2, r2, #0
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r0, r2, #0
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r4, r4, r0
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r2, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r7, #0xc]
	str r4, [r7, #8]
	b _08083850
	.align 2, 0
_0808383C: .4byte 0x000003FF
_08083840: .4byte gSineTable
_08083844:
	ldr r0, [r7, #8]
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsbs r0, r0, #0
	str r0, [r7, #0xc]
_08083850:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
    
    @ Unused
	
.syntax divided
