.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    @ Used in math_1.c
	thumb_func_start sub_80835E0
sub_80835E0: @ 0x080835E0
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

    @ Unused (code similar to sub_80835E0)
	thumb_func_start sub_80836BC
sub_80836BC: @ 0x080836BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _080836E4
	ldr r0, [r6, #8]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	b _080836E6
_080836E4:
	ldr r4, [r6, #8]
_080836E6:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083704
	ldr r0, [r6, #0xc]
	muls r0, r1, r0
	asrs r7, r0, #0xa
	movs r2, #4
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	b _08083706
_08083704:
	ldr r7, [r6, #0xc]
_08083706:
	ldrh r0, [r5]
	mov ip, r0
	mov r0, ip
	cmp r0, #0
	beq _08083770
	ldr r3, _0808376C @ =gSineTable
	ldrh r1, [r5]
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
	ldr r0, [r5, #8]
	adds r0, r0, r2
	str r0, [r5, #8]
	ldrh r1, [r5]
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
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	b _0808377A
	.align 2, 0
_0808376C: .4byte gSineTable
_08083770:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r7
_0808377A:
	str r0, [r5, #0xc]
	ldrh r0, [r6]
	add r0, ip
	ldr r2, _08083794 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083794: .4byte 0x000003FF

    @ Unused
	thumb_func_start sub_8083798
sub_8083798: @ 0x08083798
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
	thumb_func_start sub_8083858
sub_8083858: @ 0x08083858
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
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
	movs r2, #0
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #4]
	movs r2, #6
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
    
    @ Unused
	thumb_func_start sub_80838CC
sub_80838CC: @ 0x080838CC
	push {r4, r5, r6, lr}
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #0
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #2
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #4
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #4]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r5, #4
	ldrsh r4, [r0, r5]
	movs r6, #4
	ldrsh r0, [r1, r6]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xa
	strh r3, [r2, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
    
    @ Unused
	thumb_func_start sub_808399C
sub_808399C: @ 0x0808399C
	push {r4, r5, r6, r7, lr}
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #0
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r6, [r0, r7]
	movs r4, #6
	ldrsh r3, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r5, [r0, r7]
	movs r4, #4
	ldrsh r3, [r1, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #2
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #4
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #2]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #4
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #6
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r6, #2
	ldrsh r3, [r1, r6]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #4
	ldrsh r1, [r1, r7]
	muls r1, r4, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	strh r2, [r0, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
    
    @ Unused
	thumb_func_start sub_8083A48
sub_8083A48: @ 0x08083A48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #6
	ldrsh r2, [r0, r3]
	movs r5, #0
	ldrsh r4, [r1, r5]
	mov r8, r4
	mov r7, r8
	muls r7, r2, r7
	adds r2, r7, #0
	movs r3, #0
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	movs r4, #4
	ldrsh r6, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r5, #4
	ldrsh r3, [r0, r5]
	movs r7, #2
	ldrsh r5, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r5, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #2
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r4, #4
	ldrsh r3, [r0, r4]
	mov r7, r8
	muls r7, r3, r7
	adds r3, r7, #0
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #2]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r6, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #6
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r3, #4
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	subs r2, r2, r0
	asrs r2, r2, #0xa
	strh r2, [r1, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
    
    @ Unused
	thumb_func_start sub_8083B10
sub_8083B10: @ 0x08083B10
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
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
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #4]
	movs r2, #6
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0
