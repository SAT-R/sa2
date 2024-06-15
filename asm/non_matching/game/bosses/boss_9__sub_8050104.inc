.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	mov ip, r0
	adds r4, r6, #4
	adds r7, r6, #0
	adds r7, #0x20
	ldrh r1, [r6, #0x16]
	mov sb, r1
	movs r3, #0
	mov sl, r3
	ldr r5, [r6, #0x18]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050134
	movs r0, #1
	mov sl, r0
_08050134:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r0, _080501CC @ =0x00000FFF
	mov r8, r0
	ands r0, r5
	mov r8, r0
	ands r2, r1
	ldrh r0, [r6, #0x14]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _08050186
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050156:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050156
	adds r4, r2, #0
_08050186:
	movs r5, #0
_08050188:
	lsls r0, r5, #3
	adds r0, r4, r0
	mov r1, r8
	bl sub_8085968
	strh r0, [r7]
	adds r7, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050188
	ldrh r0, [r6, #0x14]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x14]
	ldrh r1, [r6, #0x14]
	ldr r0, [r6, #0x18]
	adds r0, r0, r1
	ldr r1, _080501D0 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x18]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080501CC: .4byte 0x00000FFF
_080501D0: .4byte 0x00007FFF

.syntax divided
