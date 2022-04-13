.include "asm/macros.inc"
.syntax unified
.text
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _0807236A
	bl sub_80854DC
	adds r4, r0, #0
	bl sub_80854DC
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	str r4, [r5]
_0807236A:
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r1, #0
	adds r4, r5, #7
	adds r3, r5, #0
	adds r3, #0xc
	movs r6, #0xff
_0807237E:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, r2
	movs r1, #0x1d
	cmp r2, #0
	bne _0807238C
	movs r1, #0x1e
_0807238C:
	strb r1, [r0]
	adds r0, r3, r2
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0807237E
	movs r0, #0x1f
	strb r0, [r5, #0x13]
	movs r0, #1
	strb r0, [r5, #0x11]
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x19]
	movs r1, #2
	strb r1, [r5, #0x1a]
	strb r0, [r5, #0x1b]
	strb r0, [r5, #0x15]
	strb r0, [r5, #0x16]
	strb r0, [r5, #0x17]
	strb r0, [r5, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
.syntax divided
