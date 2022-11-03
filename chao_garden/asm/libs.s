.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_0201199c
sub_0201199c: @ 0x0201199C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _020119B8 @ =0x0E005555
	movs r1, #0xaa
	strb r1, [r3]
	ldr r2, _020119BC @ =0x0E002AAA
	movs r1, #0x55
	strb r1, [r2]
	movs r1, #0xb0
	strb r1, [r3]
	movs r1, #0xe0
	lsls r1, r1, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_020119B8: .4byte 0x0E005555
_020119BC: .4byte 0x0E002AAA

	thumb_func_start sub_020119c0
sub_020119c0: @ 0x020119C0
	push {r4, r5, lr}
	sub sp, #0x44
	mov r0, sp
	bl sub_02011bb0
	mov r5, sp
	adds r5, #1
	ldr r2, _020119E8 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _020119EC @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0x90
	strb r0, [r2]
	add r1, sp, #0x40
	ldr r2, _020119F0 @ =0x00004E20
	adds r0, r2, #0
	b _020119F8
	.align 2, 0
_020119E8: .4byte 0x0E005555
_020119EC: .4byte 0x0E002AAA
_020119F0: .4byte 0x00004E20
_020119F4:
	ldrh r0, [r1]
	subs r0, #1
_020119F8:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _020119F4
	ldr r0, _02011A34 @ =0x0E000001
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0x14
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r4, r0
	ldr r1, _02011A38 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r1]
	ldr r2, _02011A3C @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r2]
	movs r0, #0xf0
	strb r0, [r1]
	strb r0, [r1]
	add r1, sp, #0x40
	ldr r2, _02011A40 @ =0x00004E20
	adds r0, r2, #0
	b _02011A48
	.align 2, 0
_02011A34: .4byte 0x0E000001
_02011A38: .4byte 0x0E005555
_02011A3C: .4byte 0x0E002AAA
_02011A40: .4byte 0x00004E20
_02011A44:
	ldrh r0, [r1]
	subs r0, #1
_02011A48:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _02011A44
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011A5C
sub_02011A5C: @ 0x02011A5C
	push {lr}
	ldr r1, _02011A7C @ =gUnknown_03002F22
	ldrh r0, [r1]
	cmp r0, #0
	beq _02011A78
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02011A78
	ldr r1, _02011A80 @ =gUnknown_030064D0
	movs r0, #1
	strb r0, [r1]
_02011A78:
	pop {r0}
	bx r0
	.align 2, 0
_02011A7C: .4byte gUnknown_03002F22
_02011A80: .4byte gUnknown_030064D0

	thumb_func_start sub_02011a84
sub_02011a84: @ 0x02011A84
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _02011AB8
	ldr r0, _02011AA8 @ =gUnknown_03002F20
	strb r1, [r0]
	ldr r1, _02011AAC @ =gUnknown_03002F24
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _02011AB0 @ =0x04000100
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _02011AB4 @ =sub_02011A5C
	str r0, [r2]
	movs r0, #0
	b _02011ABA
	.align 2, 0
_02011AA8: .4byte gUnknown_03002F20
_02011AAC: .4byte gUnknown_03002F24
_02011AB0: .4byte 0x04000100
_02011AB4: .4byte sub_02011A5C
_02011AB8:
	movs r0, #1
_02011ABA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011ac0
sub_02011ac0: @ 0x02011AC0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _02011B44 @ =gUnknown_030064F0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r1, _02011B48 @ =gUnknown_03002F28
	ldr r0, _02011B4C @ =0x04000208
	mov sb, r0
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, #0
	mov r1, sb
	strh r3, [r1]
	ldr r0, _02011B50 @ =gUnknown_03002F24
	mov r8, r0
	ldr r4, [r0]
	strh r3, [r4, #2]
	ldr r6, _02011B54 @ =0x04000200
	ldr r1, _02011B58 @ =gUnknown_03002F20
	mov sl, r1
	ldrb r1, [r1]
	movs r5, #8
	adds r0, r5, #0
	lsls r0, r1
	adds r1, r0, #0
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _02011B5C @ =gUnknown_030064D0
	strb r3, [r0]
	ldr r1, _02011B60 @ =gUnknown_03002F22
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	ldrh r0, [r2]
	strh r0, [r4]
	adds r0, r4, #2
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	str r4, [r1]
	ldr r1, _02011B64 @ =0x04000202
	mov r2, sl
	ldrb r0, [r2]
	lsls r5, r0
	strh r5, [r1]
	movs r0, #1
	mov r3, sb
	strh r0, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02011B44: .4byte gUnknown_030064F0
_02011B48: .4byte gUnknown_03002F28
_02011B4C: .4byte 0x04000208
_02011B50: .4byte gUnknown_03002F24
_02011B54: .4byte 0x04000200
_02011B58: .4byte gUnknown_03002F20
_02011B5C: .4byte gUnknown_030064D0
_02011B60: .4byte gUnknown_03002F22
_02011B64: .4byte 0x04000202

	thumb_func_start sub_02011b68
sub_02011b68: @ 0x02011B68
	ldr r3, _02011B98 @ =0x04000208
	movs r1, #0
	strh r1, [r3]
	ldr r2, _02011B9C @ =gUnknown_03002F24
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, #2
	str r0, [r2]
	strh r1, [r0]
	subs r0, #2
	str r0, [r2]
	ldr r2, _02011BA0 @ =0x04000200
	ldr r0, _02011BA4 @ =gUnknown_03002F20
	ldrb r0, [r0]
	movs r1, #8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, _02011BA8 @ =gUnknown_03002F28
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.align 2, 0
_02011B98: .4byte 0x04000208
_02011B9C: .4byte gUnknown_03002F24
_02011BA0: .4byte 0x04000200
_02011BA4: .4byte gUnknown_03002F20
_02011BA8: .4byte gUnknown_03002F28

	thumb_func_start sub_02011BAC
sub_02011BAC: @ 0x02011BAC
	ldrb r0, [r0]
	bx lr

	thumb_func_start sub_02011bb0
sub_02011bb0: @ 0x02011BB0
	push {lr}
	adds r2, r0, #0
	ldr r1, _02011BCC @ =gUnknown_030064D4
	adds r0, r2, #1
	str r0, [r1]
	ldr r3, _02011BD0 @ =sub_02011BAC
	movs r0, #1
	eors r3, r0
	ldr r0, _02011BD4 @ =sub_02011bb0
	ldr r1, _02011BD0 @ =sub_02011BAC
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _02011BE4
	.align 2, 0
_02011BCC: .4byte gUnknown_030064D4
_02011BD0: .4byte sub_02011BAC
_02011BD4: .4byte sub_02011bb0
_02011BD8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_02011BE4:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _02011BD8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011BF0
sub_02011BF0: @ 0x02011BF0
	push {r4, lr}
	adds r4, r0, #0
	subs r3, r2, #1
	cmp r2, #0
	beq _02011C0C
	movs r2, #1
	rsbs r2, r2, #0
_02011BFE:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r2
	bne _02011BFE
_02011C0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011c14
sub_02011c14: @ 0x02011C14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _02011C60 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _02011C64 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _02011C68 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _02011C4C
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0201199c
	movs r0, #0xf
	ands r4, r0
_02011C4C:
	ldr r3, _02011C6C @ =sub_02011BF0
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _02011C70 @ =sub_02011c14
	ldr r1, _02011C6C @ =sub_02011BF0
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _02011C80
	.align 2, 0
_02011C60: .4byte 0x04000204
_02011C64: .4byte 0x0000FFFC
_02011C68: .4byte gUnknown_030064E0
_02011C6C: .4byte sub_02011BF0
_02011C70: .4byte sub_02011c14
_02011C74:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_02011C80:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _02011C74
	mov r3, sp
	adds r3, #1
	ldr r0, _02011CAC @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r4, r0
	adds r0, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r5, r2
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02011CAC: .4byte gUnknown_030064E0

	thumb_func_start sub_02011cb0
sub_02011cb0: @ 0x02011CB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r4, r2, #1
	cmp r2, #0
	beq _02011CD6
	movs r2, #1
	rsbs r2, r2, #0
_02011CC0:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, #1
	adds r3, #1
	cmp r1, r0
	beq _02011CD0
	subs r0, r3, #1
	b _02011CD8
_02011CD0:
	subs r4, #1
	cmp r4, r2
	bne _02011CC0
_02011CD6:
	movs r0, #0
_02011CD8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011ce0
sub_02011ce0: @ 0x02011CE0
	push {r4, r5, lr}
	sub sp, #0x100
	adds r5, r1, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _02011D28 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _02011D2C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _02011D30 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _02011D14
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0201199c
	movs r0, #0xf
	ands r4, r0
_02011D14:
	ldr r3, _02011D34 @ =sub_02011cb0
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _02011D38 @ =sub_02011ce0
	ldr r1, _02011D34 @ =sub_02011cb0
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _02011D48
	.align 2, 0
_02011D28: .4byte 0x04000204
_02011D2C: .4byte 0x0000FFFC
_02011D30: .4byte gUnknown_030064E0
_02011D34: .4byte sub_02011cb0
_02011D38: .4byte sub_02011ce0
_02011D3C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_02011D48:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _02011D3C
	mov r3, sp
	adds r3, #1
	ldr r0, _02011D74 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	ldrh r2, [r0, #4]
	adds r0, r5, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_02011D74: .4byte gUnknown_030064E0

	thumb_func_start sub_02011d78
sub_02011d78: @ 0x02011D78
	push {r4, r5, r6, lr}
	sub sp, #0x100
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r2, r0, #0x10
	lsrs r4, r2, #0x10
	ldr r0, _02011DC0 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _02011DA0
	lsrs r0, r2, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0201199c
	movs r0, #0xf
	ands r4, r0
_02011DA0:
	ldr r2, _02011DC4 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _02011DC8 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _02011DCC @ =sub_02011cb0
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _02011DD0 @ =sub_02011ce0
	ldr r1, _02011DCC @ =sub_02011cb0
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _02011DE0
	.align 2, 0
_02011DC0: .4byte gUnknown_030064E0
_02011DC4: .4byte 0x04000204
_02011DC8: .4byte 0x0000FFFC
_02011DCC: .4byte sub_02011cb0
_02011DD0: .4byte sub_02011ce0
_02011DD4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_02011DE0:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _02011DD4
	mov r3, sp
	adds r3, #1
	ldr r0, _02011E0C @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r1, r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_02011E0C: .4byte gUnknown_030064E0

	thumb_func_start sub_02011e10
sub_02011e10: @ 0x02011E10
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _02011E22
_02011E1C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_02011E22:
	cmp r6, #2
	bhi _02011E48
	ldr r0, _02011E50 @ =gUnknown_030064DC
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _02011E1C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_02011ce0
	adds r2, r0, #0
	cmp r2, #0
	bne _02011E1C
_02011E48:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_02011E50: .4byte gUnknown_030064DC

	thumb_func_start sub_02011e54
sub_02011e54: @ 0x02011E54
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _02011E68
_02011E62:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_02011E68:
	cmp r6, #2
	bhi _02011E90
	ldr r0, _02011E98 @ =gUnknown_030064DC
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _02011E62
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_02011d78
	adds r3, r0, #0
	cmp r3, #0
	bne _02011E62
_02011E90:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02011E98: .4byte gUnknown_030064DC

	thumb_func_start sub_02011e9c
sub_02011e9c: @ 0x02011E9C
	push {r4, lr}
	ldr r2, _02011EBC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _02011EC0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bl sub_020119c0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _02011EC4 @ =gUnknown_0201F914
	movs r4, #1
	b _02011ECA
	.align 2, 0
_02011EBC: .4byte 0x04000204
_02011EC0: .4byte 0x0000FFFC
_02011EC4: .4byte gUnknown_0201F914
_02011EC8:
	adds r2, #4
_02011ECA:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _02011EDE
	ldrh r0, [r1, #0x28]
	cmp r3, r0
	bne _02011EC8
	movs r4, #0
_02011EDE:
	ldr r1, _02011F18 @ =gUnknown_030064DC
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _02011F1C @ =gUnknown_030064E8
	ldr r0, [r2]
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _02011F20 @ =gUnknown_030064EC
	ldr r0, [r2]
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _02011F24 @ =gUnknown_030064D8
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _02011F28 @ =gUnknown_030064F0
	ldr r0, [r2]
	ldr r0, [r0, #0x10]
	str r0, [r1]
	ldr r1, _02011F2C @ =gUnknown_030064E0
	ldr r0, [r2]
	adds r0, #0x14
	str r0, [r1]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02011F18: .4byte gUnknown_030064DC
_02011F1C: .4byte gUnknown_030064E8
_02011F20: .4byte gUnknown_030064EC
_02011F24: .4byte gUnknown_030064D8
_02011F28: .4byte gUnknown_030064F0
_02011F2C: .4byte gUnknown_030064E0

	thumb_func_start sub_02011f30
sub_02011f30: @ 0x02011F30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0
	mov r8, r0
	adds r0, r4, #0
	bl sub_02011ac0
	ldr r7, _02011F58 @ =gUnknown_030064D4
	movs r0, #0xc0
	lsls r0, r0, #8
	orrs r4, r0
	lsls r4, r4, #0x10
	b _02011F7C
	.align 2, 0
_02011F58: .4byte gUnknown_030064D4
_02011F5C:
	ldr r0, _02011F74 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0xc2
	bne _02011F6C
	ldr r1, _02011F78 @ =0x0E005555
	movs r0, #0xf0
	strb r0, [r1]
_02011F6C:
	lsrs r4, r4, #0x10
	mov r8, r4
	b _02011FA4
	.align 2, 0
_02011F74: .4byte gUnknown_030064E0
_02011F78: .4byte 0x0E005555
_02011F7C:
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	beq _02011FA4
	ldr r0, _02011FB4 @ =gUnknown_030064D0
	ldrb r0, [r0]
	cmp r0, #0
	beq _02011F7C
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	bne _02011F5C
_02011FA4:
	bl sub_02011b68
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02011FB4: .4byte gUnknown_030064D0

	thumb_func_start sub_02011fb8
sub_02011fb8: @ 0x02011FB8
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r5, _02012014 @ =0x04000204
	ldrh r1, [r5]
	ldr r6, _02012018 @ =0x0000FFFC
	ands r1, r6
	ldr r0, _0201201C @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, _02012020 @ =0x0E005555
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _02012024 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	bl sub_02011bb0
	ldr r0, _02012028 @ =gUnknown_030064D8
	movs r1, #0xe0
	lsls r1, r1, #0x14
	ldr r3, [r0]
	movs r0, #3
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5]
	ands r1, r6
	movs r2, #3
	orrs r1, r2
	strh r1, [r5]
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_02012014: .4byte 0x04000204
_02012018: .4byte 0x0000FFFC
_0201201C: .4byte gUnknown_030064E0
_02012020: .4byte 0x0E005555
_02012024: .4byte 0x0E002AAA
_02012028: .4byte gUnknown_030064D8

	thumb_func_start sub_0201202c
sub_0201202c: @ 0x0201202C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bhi _020120B4
	ldr r6, _0201209C @ =0x04000204
	ldrh r1, [r6]
	ldr r0, _020120A0 @ =0x0000FFFC
	mov r8, r0
	ands r1, r0
	ldr r0, _020120A4 @ =gUnknown_030064E0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r6]
	ldrb r4, [r2, #8]
	lsls r3, r4
	adds r4, r3, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r4, r4, r2
	ldr r1, _020120A8 @ =0x0E005555
	movs r5, #0xaa
	strb r5, [r1]
	ldr r3, _020120AC @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, #0x30
	strb r0, [r4]
	mov r0, sp
	bl sub_02011bb0
	ldr r0, _020120B0 @ =gUnknown_030064D8
	ldr r3, [r0]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	mov r2, r8
	ands r1, r2
	movs r2, #3
	orrs r1, r2
	strh r1, [r6]
	b _020120B6
	.align 2, 0
_0201209C: .4byte 0x04000204
_020120A0: .4byte 0x0000FFFC
_020120A4: .4byte gUnknown_030064E0
_020120A8: .4byte 0x0E005555
_020120AC: .4byte 0x0E002AAA
_020120B0: .4byte gUnknown_030064D8
_020120B4:
	ldr r0, _020120C4 @ =0x000080FF
_020120B6:
	add sp, #0x40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_020120C4: .4byte 0x000080FF

	thumb_func_start sub_020120c8
sub_020120c8: @ 0x020120C8
	push {r4, lr}
	ldr r4, _020120F4 @ =0x0E005555
	movs r2, #0xaa
	strb r2, [r4]
	ldr r3, _020120F8 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r2, #0xa0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, _020120FC @ =gUnknown_030064D8
	ldrb r2, [r0]
	ldr r3, [r3]
	movs r0, #1
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020120F4: .4byte 0x0E005555
_020120F8: .4byte 0x0E002AAA
_020120FC: .4byte gUnknown_030064D8

	thumb_func_start sub_02012100
sub_02012100: @ 0x02012100
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x60
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0xf
	bls _02012120
	ldr r0, _0201211C @ =0x000080FF
	b _0201220E
	.align 2, 0
_0201211C: .4byte 0x000080FF
_02012120:
	ldr r0, _02012140 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	mov r7, r8
	lsls r7, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r7, r7, r0
	ldr r1, _02012144 @ =sub_02012224
	movs r0, #1
	adds r3, r1, #0
	eors r3, r0
	mov r2, sp
	ldr r0, _02012148 @ =sub_02012248
	subs r0, r0, r1
	b _02012156
	.align 2, 0
_02012140: .4byte gUnknown_030064E0
_02012144: .4byte sub_02012224
_02012148: .4byte sub_02012248
_0201214C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #2
_02012156:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0201214C
	movs r4, #0
	b _0201216C
_02012162:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x51
	beq _0201220C
_0201216C:
	mov r0, r8
	bl sub_0201202c
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _02012162
	adds r0, r7, #0
	mov r1, sp
	adds r1, #1
	bl sub_02012248
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _02012162
	movs r6, #1
	cmp r4, #0
	beq _02012194
	movs r6, #6
_02012194:
	movs r4, #1
	cmp r4, r6
	bhi _020121AA
_0201219A:
	mov r0, r8
	bl sub_0201202c
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	bls _0201219A
_020121AA:
	mov r0, sp
	bl sub_02011bb0
	ldr r3, _020121CC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _020121D0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _020121D4 @ =gUnknown_030064E0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _020121D8 @ =gUnknown_030064E4
	ldr r0, [r2, #4]
	strh r0, [r1]
	adds r4, r1, #0
	b _020121E8
	.align 2, 0
_020121CC: .4byte 0x04000204
_020121D0: .4byte 0x0000FFFC
_020121D4: .4byte gUnknown_030064E0
_020121D8: .4byte gUnknown_030064E4
_020121DC:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	movs r0, #1
	add sb, r0
	adds r7, #1
_020121E8:
	ldrh r0, [r4]
	cmp r0, #0
	beq _020121FE
	mov r0, sb
	adds r1, r7, #0
	bl sub_020120c8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _020121DC
_020121FE:
	ldr r2, _0201221C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _02012220 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_0201220C:
	adds r0, r5, #0
_0201220E:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0201221C: .4byte 0x04000204
_02012220: .4byte 0x0000FFFC

	thumb_func_start sub_02012224
sub_02012224: @ 0x02012224
	push {lr}
	adds r2, r0, #0
	ldr r0, _02012230 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	b _02012236
	.align 2, 0
_02012230: .4byte gUnknown_030064E0
_02012234:
	subs r1, #1
_02012236:
	cmp r1, #0
	beq _02012242
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #0xff
	beq _02012234
_02012242:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_02012248
sub_02012248: @ 0x02012248
	push {lr}
	bl _call_via_r1
	cmp r0, #0
	bne _02012256
	movs r0, #0
	b _02012258
_02012256:
	ldr r0, _0201225C @ =0x00008004
_02012258:
	pop {r1}
	bx r1
	.align 2, 0
_0201225C: .4byte 0x00008004

	thumb_func_start sub_02012260
sub_02012260: @ 0x02012260
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _02012278 @ =gUnknown_030064E0
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r4, r0
	blo _02012280
	ldr r0, _0201227C @ =0x000080FF
	b _020122FC
	.align 2, 0
_02012278: .4byte gUnknown_030064E0
_0201227C: .4byte 0x000080FF
_02012280:
	adds r0, r4, #0
	bl sub_0201202c
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _020122FA
	mov r0, sp
	bl sub_02011bb0
	ldr r3, _020122BC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _020122C0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _020122C4 @ =gUnknown_030064E0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _020122C8 @ =gUnknown_030064E4
	ldr r0, [r2, #4]
	strh r0, [r1]
	ldrb r0, [r2, #8]
	lsls r4, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	adds r6, r1, #0
	b _020122D6
	.align 2, 0
_020122BC: .4byte 0x04000204
_020122C0: .4byte 0x0000FFFC
_020122C4: .4byte gUnknown_030064E0
_020122C8: .4byte gUnknown_030064E4
_020122CC:
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	adds r7, #1
	adds r4, #1
_020122D6:
	ldrh r0, [r6]
	cmp r0, #0
	beq _020122EC
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_020120c8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _020122CC
_020122EC:
	ldr r2, _02012304 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _02012308 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_020122FA:
	adds r0, r5, #0
_020122FC:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02012304: .4byte 0x04000204
_02012308: .4byte 0x0000FFFC
