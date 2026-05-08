.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	mov r8, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r1, [r0, #0x64]
	mov ip, r1
	mov r7, ip
	adds r7, #0xc
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C2AA
	ldr r1, [r7, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C2AA
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x18
	asrs r3, r1, #0x18
	adds r2, r0, r3
	mov r1, r8
	ldr r0, [r1]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C24C
	lsls r0, r5, #8
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C25E
	cmp r2, r1
	blt _0800C2AA
_0800C24C:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C2AA
_0800C25E:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r4, r5, #0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x18
	adds r3, r0, r1
	mov r2, r8
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	adds r2, r7, #0
	adds r2, #0x2d
	movs r5, #0
	ldrsb r5, [r2, r5]
	adds r2, r0, r5
	cmp r3, r2
	bgt _0800C28E
	asrs r0, r4, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	bge _0800C2A0
	cmp r3, r2
	blt _0800C2AA
_0800C28E:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	blt _0800C2AA
_0800C2A0:
	mov r0, r8
	bl Coll_DamagePlayer
	movs r0, #2
	b _0800C2AC
_0800C2AA:
	movs r0, #0
_0800C2AC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

.syntax divided
