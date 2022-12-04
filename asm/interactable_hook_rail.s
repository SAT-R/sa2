.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_HookRail
initSprite_Interactable_HookRail: @ 0x08072AD8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r6, #1
	beq _08072B0C
	cmp r6, #1
	blo _08072B0C
	cmp r6, #2
	beq _08072B2C
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	b _08072B94
_08072B0C:
	ldr r0, _08072B20 @ =sub_8072F38
	ldr r2, _08072B24 @ =0x00002010
	ldr r1, _08072B28 @ =sub_8072FD4
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
	b _08072B3C
	.align 2, 0
_08072B20: .4byte sub_8072F38
_08072B24: .4byte 0x00002010
_08072B28: .4byte sub_8072FD4
_08072B2C:
	ldr r0, _08072BA4 @ =sub_8072F8C
	ldr r2, _08072BA8 @ =0x00002010
	ldr r1, _08072BAC @ =sub_8072FD4
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
_08072B3C:
	ldrh r4, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r4, r3
	strb r6, [r3, #0x10]
	ldrb r0, [r5]
	lsls r0, r0, #3
	lsls r1, r7, #8
	adds r0, r0, r1
	str r0, [r3]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	mov r2, r8
	lsls r1, r2, #8
	adds r0, r0, r1
	str r0, [r3, #4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	lsls r1, r1, #3
	strh r1, [r3, #8]
	movs r2, #4
	ldrsb r2, [r5, r2]
	lsls r2, r2, #3
	strh r2, [r3, #0xa]
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #0xc]
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #0xe]
	str r5, [r3, #0x20]
	ldrb r1, [r5]
	ldr r2, _08072BB0 @ =IWRAM_START + 0x24
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08072BB4 @ =IWRAM_START + 0x25
	adds r4, r4, r0
	mov r1, sb
	strb r1, [r4]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
_08072B94:
	strb r0, [r5]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072BA4: .4byte sub_8072F8C
_08072BA8: .4byte 0x00002010
_08072BAC: .4byte sub_8072FD4
_08072BB0: .4byte IWRAM_START + 0x24
_08072BB4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8072BB8
sub_8072BB8: @ 0x08072BB8
	push {r4, r5, lr}
	ldr r0, _08072BDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _08072BE0 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08072BE4
	adds r0, r5, #0
	bl sub_8073068
	b _08072C88
	.align 2, 0
_08072BDC: .4byte gCurTask
_08072BE0: .4byte gPlayer
_08072BE4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08072BF4
	adds r0, r5, #0
	bl sub_8073088
	b _08072C88
_08072BF4:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08072C10 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08072C14
	bl sub_807321C
	adds r0, r5, #0
	bl sub_8073048
	b _08072C88
	.align 2, 0
_08072C10: .4byte gPlayerControls
_08072C14:
	bl sub_80731D4
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	bl sub_807319C
	strh r0, [r4, #0x14]
	ldr r0, [r5]
	ldr r1, _08072C6C @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _08072C70
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r3, #8
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	cmp r0, r1
	bge _08072C88
	adds r0, r5, #0
	bl sub_8072FD8
	b _08072C88
	.align 2, 0
_08072C6C: .4byte gCamera
_08072C70:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	cmp r0, r1
	ble _08072C88
	adds r0, r5, #0
	bl sub_8072FD8
_08072C88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8072C90
sub_8072C90: @ 0x08072C90
	push {r4, r5, lr}
	ldr r0, _08072CB4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08072CB8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08072CBC
	adds r0, r4, #0
	bl sub_8073068
	b _08072D36
	.align 2, 0
_08072CB4: .4byte gCurTask
_08072CB8: .4byte gPlayer
_08072CBC:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _08072CCC
	adds r0, r4, #0
	bl sub_8073088
	b _08072D36
_08072CCC:
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _08072CE8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08072CEC
	bl sub_807321C
	adds r0, r4, #0
	bl sub_8073048
	b _08072D36
	.align 2, 0
_08072CE8: .4byte gPlayerControls
_08072CEC:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x6d
	beq _08072D02
	cmp r0, #0x13
	beq _08072D02
	adds r0, r4, #0
	bl sub_8073034
	b _08072D36
_08072D02:
	bl sub_80731D4
	ldr r5, _08072D3C @ =gPlayer
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	str r1, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bge _08072D20
	rsbs r1, r1, #0
_08072D20:
	asrs r1, r1, #1
	ldr r0, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #0x14]
	adds r0, #0x15
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807319C
	strh r0, [r5, #0x14]
_08072D36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072D3C: .4byte gPlayer

	thumb_func_start sub_8072D40
sub_8072D40: @ 0x08072D40
	push {r4, r5, lr}
	ldr r0, _08072D6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _08072D70 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08072D88
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08072D74
	adds r0, r5, #0
	bl sub_8073168
	b _08072DC6
	.align 2, 0
_08072D6C: .4byte gCurTask
_08072D70: .4byte gPlayer
_08072D74:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08072D90 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08072D94
	bl sub_807321C
_08072D88:
	adds r0, r5, #0
	bl sub_8073148
	b _08072DC6
	.align 2, 0
_08072D90: .4byte gPlayerControls
_08072D94:
	bl sub_80731D4
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	bl sub_807319C
	strh r0, [r4, #0x14]
	adds r0, r5, #0
	bl sub_8072E84
	cmp r0, #0
	bne _08072DC6
	adds r0, r5, #0
	bl sub_80730F0
_08072DC6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8072DCC
sub_8072DCC: @ 0x08072DCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08072E38 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x20]
	adds r1, r6, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #0x37
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_80218E4
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	ldr r1, [r6, #0x20]
	subs r0, #0x13
	ands r1, r0
	str r1, [r6, #0x20]
	ldr r0, [r4, #4]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [r6, #0xc]
	str r5, [r4, #0x1c]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _08072E40
	movs r0, #1
	orrs r1, r0
	str r1, [r6, #0x20]
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08072E3C @ =0xFFFFFF00
	cmp r0, r1
	ble _08072E2E
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r6, #0x14]
_08072E2E:
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x80
	b _08072E60
	.align 2, 0
_08072E38: .4byte gPlayer
_08072E3C: .4byte 0xFFFFFF00
_08072E40:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt _08072E5A
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x14]
_08072E5A:
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
_08072E60:
	strb r0, [r1]
	ldr r0, _08072E78 @ =0x0000011B
	bl m4aSongNumStart
	ldr r0, _08072E7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08072E80 @ =sub_8072BB8
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072E78: .4byte 0x0000011B
_08072E7C: .4byte gCurTask
_08072E80: .4byte sub_8072BB8

	thumb_func_start sub_8072E84
sub_8072E84: @ 0x08072E84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r5, _08072F1C @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08072F28
	ldr r2, [r6]
	ldr r1, _08072F20 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r6, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	movs r0, #8
	ldrsh r5, [r6, r0]
	adds r3, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r3, r1
	bgt _08072F28
	movs r7, #0xc
	ldrsh r2, [r6, r7]
	mov sl, r2
	subs r0, r2, r5
	adds r0, r3, r0
	cmp r0, r1
	blt _08072F28
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xa
	ldrsh r2, [r6, r3]
	adds r4, r0, r2
	mov r7, r8
	lsls r0, r7, #0x10
	asrs r3, r0, #0x10
	cmp r4, r3
	bgt _08072F28
	movs r7, #0xe
	ldrsh r0, [r6, r7]
	subs r0, r0, r2
	adds r0, r4, r0
	cmp r0, r3
	blt _08072F28
	mov r2, sl
	adds r0, r2, r5
	asrs r0, r0, #1
	add r0, ip
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08072F24
	movs r0, #1
	b _08072F2A
	.align 2, 0
_08072F1C: .4byte gPlayer
_08072F20: .4byte gCamera
_08072F24:
	movs r0, #2
	b _08072F2A
_08072F28:
	movs r0, #0
_08072F2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8072F38
sub_8072F38: @ 0x08072F38
	push {r4, lr}
	ldr r0, _08072F68 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8072E84
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	beq _08072F76
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _08072F6C
	cmp r1, #1
	bne _08072F76
	adds r0, r4, #0
	bl sub_8072DCC
	b _08072F76
	.align 2, 0
_08072F68: .4byte gCurTask
_08072F6C:
	cmp r2, #2
	bne _08072F76
	adds r0, r4, #0
	bl sub_8072DCC
_08072F76:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _08072F86
	adds r0, r4, #0
	bl sub_8073280
_08072F86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8072F8C
sub_8072F8C: @ 0x08072F8C
	push {r4, lr}
	ldr r0, _08072FCC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8072E84
	cmp r0, #0
	beq _08072FB6
	ldr r0, _08072FD0 @ =gPlayer
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x37
	bne _08072FB6
	adds r0, r4, #0
	bl sub_80730BC
_08072FB6:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _08072FC6
	adds r0, r4, #0
	bl sub_8073280
_08072FC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072FCC: .4byte gCurTask
_08072FD0: .4byte gPlayer

	thumb_func_start sub_8072FD4
sub_8072FD4: @ 0x08072FD4
	bx lr
	.align 2, 0

	thumb_func_start sub_8072FD8
sub_8072FD8: @ 0x08072FD8
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	bne _08073000
	ldr r1, _08072FFC @ =gPlayer
	movs r0, #8
	ldrsh r2, [r3, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r0, [r3, #0x14]
	ldr r0, [r1, #0xc]
	str r0, [r3, #0x18]
	adds r1, #0x24
	movs r0, #0x6d
	b _08073018
	.align 2, 0
_08072FFC: .4byte gPlayer
_08073000:
	ldr r1, _08073028 @ =gPlayer
	movs r0, #0xc
	ldrsh r2, [r3, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r0, [r3, #0x14]
	ldr r0, [r1, #0xc]
	str r0, [r3, #0x18]
	adds r1, #0x24
	movs r0, #0x13
_08073018:
	strb r0, [r1]
	ldr r0, _0807302C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073030 @ =sub_8072C90
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08073028: .4byte gPlayer
_0807302C: .4byte gCurTask
_08073030: .4byte sub_8072C90

	thumb_func_start sub_8073034
sub_8073034: @ 0x08073034
	ldr r0, _08073040 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073044 @ =sub_8072F38
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08073040: .4byte gCurTask
_08073044: .4byte sub_8072F38

	thumb_func_start sub_8073048
sub_8073048: @ 0x08073048
	push {lr}
	ldr r0, _0807305C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073060 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073064 @ =sub_8073320
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807305C: .4byte 0x0000011B
_08073060: .4byte gCurTask
_08073064: .4byte sub_8073320

	thumb_func_start sub_8073068
sub_8073068: @ 0x08073068
	push {lr}
	ldr r0, _0807307C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073080 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073084 @ =sub_8072F38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807307C: .4byte 0x0000011B
_08073080: .4byte gCurTask
_08073084: .4byte sub_8072F38

	thumb_func_start sub_8073088
sub_8073088: @ 0x08073088
	push {lr}
	ldr r2, _080730A8 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _080730AC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _080730B0 @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _080730B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080730B8 @ =sub_8073320
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080730A8: .4byte gPlayer
_080730AC: .4byte 0xFFBFFFFF
_080730B0: .4byte 0x0000011B
_080730B4: .4byte gCurTask
_080730B8: .4byte sub_8073320

	thumb_func_start sub_80730BC
sub_80730BC: @ 0x080730BC
	push {lr}
	ldr r1, _080730D4 @ =gPlayer
	ldr r0, [r0, #4]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x6d
	bne _080730D8
	movs r0, #0x80
	b _080730DA
	.align 2, 0
_080730D4: .4byte gPlayer
_080730D8:
	movs r0, #0
_080730DA:
	strb r0, [r1]
	ldr r0, _080730E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080730EC @ =sub_8072D40
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080730E8: .4byte gCurTask
_080730EC: .4byte sub_8072D40

	thumb_func_start sub_80730F0
sub_80730F0: @ 0x080730F0
	push {lr}
	ldr r2, _08073118 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807311C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	subs r1, #0x49
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08073120
	movs r0, #0x6d
	b _08073122
	.align 2, 0
_08073118: .4byte gPlayer
_0807311C: .4byte 0xFFBFFFFF
_08073120:
	movs r0, #0x13
_08073122:
	strb r0, [r1]
	bl sub_80731D4
	ldr r0, _0807313C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073140 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073144 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807313C: .4byte 0x0000011B
_08073140: .4byte gCurTask
_08073144: .4byte sub_8072F8C

	thumb_func_start sub_8073148
sub_8073148: @ 0x08073148
	push {lr}
	ldr r0, _0807315C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073160 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073164 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807315C: .4byte 0x0000011B
_08073160: .4byte gCurTask
_08073164: .4byte sub_8072F8C

	thumb_func_start sub_8073168
sub_8073168: @ 0x08073168
	push {lr}
	ldr r2, _08073188 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807318C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _08073190 @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073194 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073198 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08073188: .4byte gPlayer
_0807318C: .4byte 0xFFBFFFFF
_08073190: .4byte 0x0000011B
_08073194: .4byte gCurTask
_08073198: .4byte sub_8072F8C

	thumb_func_start sub_807319C
sub_807319C: @ 0x0807319C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080731B8 @ =gPlayer
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080731BC
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xf0
	lsls r2, r2, #4
	b _080731C4
	.align 2, 0
_080731B8: .4byte gPlayer
_080731BC:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x90
	lsls r2, r2, #4
_080731C4:
	cmp r0, r2
	ble _080731CA
	adds r1, r2, #0
_080731CA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80731D4
sub_80731D4: @ 0x080731D4
	push {r4, r5, lr}
	ldr r1, _08073214 @ =gPlayer
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	ldr r4, _08073218 @ =gSineTable
	adds r3, r1, #0
	adds r3, #0x24
	ldrb r0, [r3]
	lsls r0, r0, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r1, #0x10]
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r1, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073214: .4byte gPlayer
_08073218: .4byte gSineTable

	thumb_func_start sub_807321C
sub_807321C: @ 0x0807321C
	ldr r2, _08073230 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08073234 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x6d
	movs r0, #3
	strb r0, [r2]
	bx lr
	.align 2, 0
_08073230: .4byte gPlayer
_08073234: .4byte 0xFFBFFFFF

	thumb_func_start sub_8073238
sub_8073238: @ 0x08073238
	push {lr}
	ldr r1, [r0]
	ldr r3, _08073274 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08073270
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08073270
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08073278
_08073270:
	movs r0, #1
	b _0807327A
	.align 2, 0
_08073274: .4byte gCamera
_08073278:
	movs r0, #0
_0807327A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8073280
sub_8073280: @ 0x08073280
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08073298 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08073298: .4byte gCurTask

	thumb_func_start initSprite_Interactable048
initSprite_Interactable048: @ 0x0807329C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_HookRail_Start
initSprite_Interactable_HookRail_Start: @ 0x080732C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_HookRail_End
initSprite_Interactable_HookRail_End: @ 0x080732F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8073320
sub_8073320: @ 0x08073320
	push {r4, lr}
	ldr r0, _08073344 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08073348 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807334C
	adds r0, r4, #0
	bl sub_8073068
	b _0807336C
	.align 2, 0
_08073344: .4byte gCurTask
_08073348: .4byte gPlayer
_0807334C:
	adds r0, r4, #0
	bl sub_8072E84
	cmp r0, #0
	bne _0807335C
	adds r0, r4, #0
	bl sub_8073068
_0807335C:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _0807336C
	adds r0, r4, #0
	bl sub_8073280
_0807336C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
