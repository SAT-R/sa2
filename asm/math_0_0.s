.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    @ Unused
	thumb_func_start sub_80832FC
sub_80832FC: @ 0x080832FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r6, [sp, #0x54]
	ldr r0, [sp, #0x58]
	mov sb, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	str r6, [sp, #8]
	asrs r2, r6, #0x1f
	str r2, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r1, #0
	adds r2, r0, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x14]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	str r3, [sp, #0x10]
	movs r4, #1
	mov r0, sb
	lsls r4, r0
	subs r4, r4, r6
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x2c]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	mov r2, sl
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r2, r0, #0x1f
	mov r8, r2
	lsls r6, r1, #1
	mov r3, r8
	orrs r3, r6
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	ldr r2, [sp]
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r5, r0, #0x1f
	lsls r4, r1, #1
	adds r3, r5, #0
	orrs r3, r4
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	asrs r1, r2, #0x1f
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	ldr r3, [sp, #0x24]
	ldr r4, [sp, #0x28]
	adds r3, r3, r0
	adcs r4, r1
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	adds r1, r4, #0
	adds r0, r3, #0
	mov r2, sb
	bl __ashrdi3
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

    @ Unused
	thumb_func_start sub_808343C
sub_808343C: @ 0x0808343C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r4, [sp, #0x28]
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r6, r2, #0
	adds r0, r2, #0
	asrs r1, r6, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r7, r0, #0
	mov r4, sb
	asrs r5, r4, #0x1f
	subs r2, r7, r6
	lsls r2, r2, #1
	subs r2, r2, r6
	movs r0, #1
	mov r3, r8
	lsls r0, r3
	adds r2, r2, r0
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, sl
	asrs r1, r0, #0x1f
	subs r2, r7, r6
	mov sb, r2
	subs r2, r2, r6
	ldr r3, [sp, #0x28]
	adds r2, r2, r3
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp, #4]
	asrs r1, r0, #0x1f
	lsls r2, r6, #1
	adds r2, r2, r6
	subs r2, r2, r7
	subs r2, r2, r7
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp]
	asrs r1, r0, #0x1f
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	adds r1, r5, #0
	adds r0, r4, #0
	mov r2, r8
	bl __ashrdi3
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

    @ Unused
	thumb_func_start sub_8083504
sub_8083504: @ 0x08083504
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
