.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0         @ r6 = unk48
	ldr r0, [r6, #0x34]
	mov ip, r0              @ ip = unk48->unk34
	adds r4, r6, #4         @ r4 = &unk48[2]
	movs r1, #0x3a
	adds r1, r1, r6
	mov r8, r1              @ r8 = unk48->unk3A
	ldrh r3, [r6, #0x2e]
	mov sb, r3              @ sb = unk48->unk2E
	movs r0, #0
	mov sl, r0              @ sl = result = FALSE
	ldr r5, [r6, #0x30]
	lsrs r2, r5, #0xc       @ r2 = (unk48->unk30 >> 12)
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050062
	movs r1, #1
	mov sl, r1              @ sl = result = TRUE
_08050062:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r7, _080500FC @ =0x00000FFF
	ands r7, r5
	ands r2, r1
	ldrh r0, [r6, #0x2c]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _080500B0
	movs r5, #0             @ r5 = i = 0
	adds r2, r4, #0         @ r2 = r4 = &unk48[2]
	lsls r1, r3, #1
_08050080:
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
	cmp r5, #4
	bls _08050080
	adds r4, r2, #0
_080500B0:
	movs r5, #0
	lsls r7, r7, #0x10
_080500B4:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r7, #0x10
	bl sub_80859F4
	mov r1, r8
	strh r0, [r1]
	movs r3, #2
	add r8, r3
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080500B4
	ldrh r0, [r6, #0x2c]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x2c]
	ldrh r1, [r6, #0x2c]
	ldr r0, [r6, #0x30]
	adds r0, r0, r1
	ldr r1, _08050100 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x30]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080500FC: .4byte 0x00000FFF
_08050100: .4byte 0x00007FFF

.syntax divided
