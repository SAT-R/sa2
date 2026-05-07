.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #9]
	movs r4, #8
_08052BB4:
	adds r0, r5, #0
	movs r1, #0xa
	bl Div
	mov r1, sp
	adds r3, r1, r4
	lsls r1, r0, #3
	lsls r2, r0, #1
	adds r1, r1, r2
	subs r1, r5, r1
	adds r1, #0x30
	strb r1, [r3]
	adds r5, r0, #0
	subs r4, #1
	cmp r4, #0
	bge _08052BB4
	movs r1, #0
	movs r4, #0
	mov r0, sp
	ldrb r0, [r0]
	ldr r2, _08052BFC @ =gUnknown_030063F0
	mov ip, r2
	cmp r0, #0x30
	bne _08052C00
	movs r1, #1
_08052BE6:
	adds r4, #1
	cmp r4, #9
	bgt _08052C00
	mov r2, sp
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0x30
	bne _08052C00
	adds r1, #1
	b _08052BE6
	.align 2, 0
_08052BFC: .4byte gUnknown_030063F0
_08052C00:
	mov r0, sp
	adds r6, r0, r1
	mov r1, ip
	ldr r0, [r1]
	cmp r0, #0
	beq _08052C74
	adds r3, r0, #0
	movs r1, #0
	ldrb r0, [r6]
	cmp r0, #0x20
	beq _08052C24
_08052C16:
	adds r1, #1
	cmp r1, #9
	bgt _08052C24
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _08052C16
_08052C24:
	adds r4, r3, #0
	adds r4, #0x20
	strb r1, [r4]
	cmp r1, #0
	ble _08052C74
	movs r2, #0
	ldr r7, _08052C5C @ =gUnknown_030063C0
	cmp r2, r1
	bge _08052C48
	adds r5, r3, #4
_08052C38:
	adds r0, r5, r2
	adds r1, r6, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08052C38
_08052C48:
	ldr r1, [sp, #0xc]
	str r1, [r3, #0x10]
	mov r2, sl
	str r2, [r3, #0x14]
	mov r0, sb
	str r0, [r3, #0x18]
	mov r1, r8
	str r1, [r3, #0x1c]
	adds r1, r7, #0
	b _08052C62
	.align 2, 0
_08052C5C: .4byte gUnknown_030063C0
_08052C60:
	ldr r1, [r1]
_08052C62:
	ldr r0, [r1]
	cmp r0, #0
	bne _08052C60
	str r3, [r1]
	ldr r0, [r3]
	mov r2, ip
	str r0, [r2]
	movs r0, #0
	str r0, [r3]
_08052C74:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
