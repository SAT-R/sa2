.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	cmp r0, r4
	beq _08023C0A
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r2, [r0]
	ldr r0, _08023BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023B8E
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08023B8E:
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0
	ble _08023BA8
	cmp r2, #0
	beq _08023BA4
	subs r0, #1
	b _08023BAC
	.align 2, 0
_08023BA0: .4byte gUnknown_03005424
_08023BA4:
	movs r2, #0x20
	b _08023BB4
_08023BA8:
	cmp r2, #0
	beq _08023BB2
_08023BAC:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08023BB4
_08023BB2:
	movs r2, #0x1f
_08023BB4:
	lsrs r0, r2, #6
	cmp r0, #1
	beq _08023BEE
	cmp r0, #1
	bgt _08023BC4
	cmp r0, #0
	beq _08023BCE
	b _08023C0A
_08023BC4:
	cmp r0, #2
	beq _08023BDE
	cmp r0, #3
	beq _08023BFC
	b _08023C0A
_08023BCE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BDE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BEE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	b _08023C08
_08023BFC:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	subs r0, r0, r1
_08023C08:
	str r0, [r3, #8]
_08023C0A:
	pop {r4}
	pop {r0}
	bx r0

	
.syntax divided
