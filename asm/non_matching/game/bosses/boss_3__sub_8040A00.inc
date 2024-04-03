.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0          @ sl = totem
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040A18
	b _08040B16
_08040A18:
	movs r0, #0
	mov r8, r0
	ldr r1, _08040AD8 @ =gPlayer
	mov sb, r1
_08040A20:
	mov r3, r8          @ r3 = r8 = i
	lsls r0, r3, #6
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r3, sl          @ r3 = sl = totem
	adds r6, r3, r0     @ r6 = s = &totem->spr188[i]
	mov r1, r8          @ r1 = r8 = i
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r3, r0     @ r4 = t3c
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r3, sb
	str r3, [sp]
	adds r0, r6, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #0
	bne _08040B08_cont
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r0, sb
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #2
	bl sub_800CA20
	cmp r0, #0
	bne _08040B08_cont
	mov r3, sb          @ r3 = sb = &gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r1, r0
	movs r7, #0
	cmp r1, #0
	beq _08040A80
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _08040A80
	movs r7, #1
_08040A80:
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r5, _08040AD8 @ =gPlayer
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08040AE0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08040AE0
	ldr r0, [r5, #8]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r4, r3]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r1, r1, r0
	str r1, [r5, #0xc]
	cmp r7, #0
	bne _08040B08_cont
	ldr r1, _08040ADC @ =0xFFFFFB00
	adds r0, r1, #0
	ldrh r3, [r5, #0x10]
	adds r0, r0, r3
	strh r0, [r5, #0x10]
	b _08040B08_cont
	.align 2, 0
_08040AD8: .4byte gPlayer
_08040ADC: .4byte 0xFFFFFB00
_08040AE0:
	cmp r7, #0
	beq _08040B08_cont
	ldr r2, _08040B28 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0x20]
	movs r0, #0
	str r0, [r2, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08040B08_cont
	ldr r0, _08040B2C @ =0xFFFFFEFF
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08040B08_cont:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _08040A20
_08040B16:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040B28: .4byte gPlayer
_08040B2C: .4byte 0xFFFFFEFF

.syntax divided
