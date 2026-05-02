.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov ip, r0          @ ip = r0 = s
	mov sb, r1          @ sb = r1 = worldX
	mov sl, r2          @ sl = r2 = worldY
	adds r6, r3, #0     @ r6 = r3 = unk08
	ldr r4, [sp, #0x2c] @ r4 = sp2C = p
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r1, r3     @ r2 = worldX + s->hitboxes[0].left
	ldr r0, [r4]
	asrs r0, r0, #8
	movs r5, #0
	ldrsb r5, [r6, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0807E958
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0807E966
	cmp r2, r1
	bge _0807E958
	b _0807EA5C_return_0
_0807E958:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	bge _0807E966
	b _0807EA5C_return_0
_0807E966:
	mov r2, ip
	adds r2, #0x2d
	movs r0, #0
	ldrsb r0, [r2, r0]
	str r0, [sp, #8]
	adds r5, r0, #0
	add r5, sl
	ldr r1, [r4, #4]
	asrs r0, r1, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	mov r8, r3
	adds r3, r0, r3
	cmp r5, r3
	bgt _0807E99C
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r7, [sp, #8]
	subs r0, r0, r7
	adds r0, r5, r0
	cmp r0, r3
	bge _0807E9AA
	cmp r5, r3
	blt _0807EA5C_return_0
_0807E99C:
	movs r0, #3
	ldrsb r0, [r6, r0]
	mov r7, r8
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r5
	blt _0807EA5C_return_0
_0807E9AA:
	asrs r5, r1, #8     @ r5 = I(p->qWorldY)
	movs r0, #0
	ldrsb r0, [r2, r0]
	add r0, sl
	movs r1, #3
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	adds r0, #2
	cmp r5, r0
	ble _0807EA5C_return_0
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	movs r1, #2
	ldrsb r1, [r6, r1]
	subs r2, r0, r1
	adds r1, r2, #0
	adds r1, #8
	ldr r0, [r4]
	asrs r3, r0, #8
	cmp r3, r1
	bgt _0807E9E0
	lsls r1, r2, #8
	b _0807E9FC
_0807E9E0:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	subs r1, r0, #7
	cmp r3, r1
	blt _0807EA5C_return_0
	adds r1, r0, #1
	lsls r1, r1, #8
_0807E9FC:
	str r1, [r4]
	adds r0, r5, #0
	adds r0, #9
	asrs r1, r1, #8
	adds r5, r4, #0
	adds r5, #0x27
	ldrb r2, [r5]
	movs r7, #0
	str r7, [sp]
	ldr r6, _0807EA58 @ =sa2__sub_801EE64
	str r6, [sp, #4]
	movs r3, #8
	bl sa2__sub_801E4E4
	cmp r0, #0
	bge _0807EA24
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_0807EA24:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	asrs r1, r1, #8
	ldrb r2, [r5]
	movs r3, #8
	rsbs r3, r3, #0
	str r7, [sp]
	str r6, [sp, #4]
	bl sa2__sub_801E4E4
	cmp r0, #0
	bge _0807EA46
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_0807EA46:
	ldr r0, [r4, #0x10]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r4, #0x10]
	movs r0, #1
	b _0807EA5E
	.align 2, 0
_0807EA58: .4byte sa2__sub_801EE64
_0807EA5C_return_0:
	movs r0, #0
_0807EA5E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
