.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_808D8A0
sub_808D8A0: @ 0x0808D8A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0808D984 @ =0xFFFFFE00
	add sp, r4
	adds r5, r0, #0
	movs r0, #0xc
	adds r0, r0, r5
	mov ip, r0
	movs r6, #0
	movs r1, #0xf8
	lsls r1, r1, #2
	mov sb, r1
	movs r2, #0xf8
	lsls r2, r2, #7
	mov r8, r2
_0808D8C2:
	movs r0, #1
	ands r0, r6
	lsls r1, r6, #1
	mov r2, ip
	adds r0, r1, r2
	ldrh r2, [r0]
	adds r7, r1, #0
	movs r0, #0x1f
	ands r0, r2
	movs r1, #6
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D8EA
	movs r1, #0x1f
_0808D8EA:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D8F2
	movs r1, #0
_0808D8F2:
	adds r4, r1, #0
	adds r0, r2, #0
	mov r1, sb
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #7
	ldrsb r1, [r5, r1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D910
	movs r1, #0x1f
_0808D910:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D918
	movs r1, #0
_0808D918:
	lsls r0, r1, #0x10
	asrs r0, r0, #0xb
	orrs r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, r8
	ands r2, r0
	lsrs r0, r2, #0xa
	movs r1, #8
	ldrsb r1, [r5, r1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D93C
	movs r1, #0x1f
_0808D93C:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D944
	movs r1, #0
_0808D944:
	lsls r0, r1, #0x10
	asrs r0, r0, #6
	orrs r0, r4
	mov r2, sp
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xff
	bls _0808D8C2
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	movs r2, #0x80
	bl CpuFastSet
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r5, #4]
	lsrs r0, r0, #8
	strb r0, [r5, #1]
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D984: .4byte 0xFFFFFE00
