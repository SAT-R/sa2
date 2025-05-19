.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_02014CAC
sub_02014CAC: @ 0x02014CAC
	svc #0xa
	bx lr

	thumb_func_start sub_02014CB0
sub_02014CB0: @ 0x02014CB0
	svc #0xc
	bx lr

	thumb_func_start CpuSet
CpuSet: @ 0x02014CB4
	svc #0xb
	bx lr

	thumb_func_start sub_02014CB8
sub_02014CB8: @ 0x02014CB8
	svc #6
	bx lr

	thumb_func_start sub_02014CBC
sub_02014CBC: @ 0x02014CBC
	svc #0x14
	bx lr

	thumb_func_start sub_02014CC0
sub_02014CC0: @ 0x02014CC0
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

	thumb_func_start sub_02014CC8
sub_02014CC8: @ 0x02014CC8
	bx r0
	nop

	thumb_func_start sub_02014CCC
sub_02014CCC: @ 0x02014CCC
	bx r1
	nop

	thumb_func_start sub_02014CD0
sub_02014CD0: @ 0x02014CD0
	bx r2
	nop

	thumb_func_start sub_02014CD4
sub_02014CD4: @ 0x02014CD4
	bx r3
	nop

	thumb_func_start sub_02014CD8
sub_02014CD8: @ 0x02014CD8
	bx r4
	nop

	thumb_func_start sub_02014CDC
sub_02014CDC: @ 0x02014CDC
	bx r5
	nop
_02014CE0:
	.byte 0x30, 0x47, 0xC0, 0x46

	thumb_func_start sub_02014CE4
sub_02014CE4: @ 0x02014CE4
	bx r7
	nop

	thumb_func_start sub_02014CE8
sub_02014CE8: @ 0x02014CE8
	bx r8
	nop

	thumb_func_start sub_02014CEC
sub_02014CEC: @ 0x02014CEC
	bx sb
	nop

	thumb_func_start sub_02014CF0
sub_02014CF0: @ 0x02014CF0
	bx sl
	nop
_02014CF4:
	.byte 0x58, 0x47, 0xC0, 0x46

	thumb_func_start sub_02014CF8
sub_02014CF8: @ 0x02014CF8
	bx ip
	nop

	thumb_func_start sub_02014CFC
sub_02014CFC: @ 0x02014CFC
	bx sp
	nop
_02014D00:
	.byte 0x70, 0x47, 0xC0, 0x46

	thumb_func_start sub_02014D04
sub_02014D04: @ 0x02014D04
	cmp r1, #0
	beq _02014D8C
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _02014D1A
	rsbs r1, r1, #0
_02014D1A:
	cmp r0, #0
	bpl _02014D20
	rsbs r0, r0, #0
_02014D20:
	cmp r0, r1
	blo _02014D7E
	movs r4, #1
	lsls r4, r4, #0x1c
_02014D28:
	cmp r1, r4
	bhs _02014D36
	cmp r1, r0
	bhs _02014D36
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _02014D28
_02014D36:
	lsls r4, r4, #3
_02014D38:
	cmp r1, r4
	bhs _02014D46
	cmp r1, r0
	bhs _02014D46
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _02014D38
_02014D46:
	cmp r0, r1
	blo _02014D4E
	subs r0, r0, r1
	orrs r2, r3
_02014D4E:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _02014D5A
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_02014D5A:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _02014D66
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_02014D66:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _02014D72
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_02014D72:
	cmp r0, #0
	beq _02014D7E
	lsrs r3, r3, #4
	beq _02014D7E
	lsrs r1, r1, #4
	b _02014D46
_02014D7E:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _02014D88
	rsbs r0, r0, #0
_02014D88:
	pop {r4}
	mov pc, lr
_02014D8C:
	push {lr}
	bl sub_02014D98
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start sub_02014D98
sub_02014D98: @ 0x02014D98
	mov pc, lr
	.align 2, 0

	thumb_func_start sub_02014D9C
sub_02014D9C: @ 0x02014D9C
	cmp r1, #0
	beq _02014E52
	movs r3, #1
	cmp r0, r1
	bhs _02014DA8
	mov pc, lr
_02014DA8:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_02014DAE:
	cmp r1, r4
	bhs _02014DBC
	cmp r1, r0
	bhs _02014DBC
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _02014DAE
_02014DBC:
	lsls r4, r4, #3
_02014DBE:
	cmp r1, r4
	bhs _02014DCC
	cmp r1, r0
	bhs _02014DCC
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _02014DBE
_02014DCC:
	movs r2, #0
	cmp r0, r1
	blo _02014DD4
	subs r0, r0, r1
_02014DD4:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _02014DE6
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_02014DE6:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _02014DF8
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_02014DF8:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _02014E0A
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_02014E0A:
	mov ip, r3
	cmp r0, #0
	beq _02014E18
	lsrs r3, r3, #4
	beq _02014E18
	lsrs r1, r1, #4
	b _02014DCC
_02014E18:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _02014E24
	pop {r4}
	mov pc, lr
_02014E24:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _02014E32
	lsrs r4, r1, #3
	adds r0, r0, r4
_02014E32:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _02014E40
	lsrs r4, r1, #2
	adds r0, r0, r4
_02014E40:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _02014E4E
	lsrs r4, r1, #1
	adds r0, r0, r4
_02014E4E:
	pop {r4}
	mov pc, lr
_02014E52:
	push {lr}
	bl sub_02014D98
	movs r0, #0
	pop {pc}

	thumb_func_start sub_02014E5C
sub_02014E5C: @ 0x02014E5C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _02014E9C
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _02014E9C
	adds r1, r5, #0
_02014E76:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _02014E76
	cmp r2, #3
	bls _02014E9A
_02014E90:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _02014E90
_02014E9A:
	adds r4, r1, #0
_02014E9C:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _02014EB6
	adds r1, r0, #0
_02014EA8:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _02014EA8
_02014EB6:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start sub_02014EBC
sub_02014EBC: @ 0x02014EBC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _02014F02
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _02014F02
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _02014EF6
_02014EE2:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _02014EE2
	b _02014EF6
_02014EF2:
	stm r1!, {r3}
	subs r2, #4
_02014EF6:
	cmp r2, #3
	bhi _02014EF2
	adds r3, r1, #0
	b _02014F02
_02014EFE:
	strb r4, [r3]
	adds r3, #1
_02014F02:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _02014EFE
	adds r0, r5, #0
	pop {r4, r5, pc}
.align 2, 0
