
.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
	
    thumb_func_start sub_08097944
sub_08097944: @ 0x08097944
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _08097984
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08097984
	adds r1, r5, #0
_0809795E:
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
	bhi _0809795E
	cmp r2, #3
	bls _08097982
_08097978:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _08097978
_08097982:
	adds r4, r1, #0
_08097984:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0809799E
	adds r1, r0, #0
_08097990:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _08097990
_0809799E:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start sub_080979A4
sub_080979A4: @ 0x080979A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _080979EA
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _080979EA
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _080979DE
_080979CA:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080979CA
	b _080979DE
_080979DA:
	stm r1!, {r3}
	subs r2, #4
_080979DE:
	cmp r2, #3
	bhi _080979DA
	adds r3, r1, #0
	b _080979EA
_080979E6:
	strb r4, [r3]
	adds r3, #1
_080979EA:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080979E6
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0
	