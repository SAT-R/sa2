.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
.align 2 , 0
    .global gUnknown_080D69C8
gUnknown_080D69C8:
    .incbin "baserom.gba", 0x000D69C8, 0xB8

    .global gUnknown_080D6A80
gUnknown_080D6A80:
    .incbin "baserom.gba", 0x000D6A80, 0x30

    .global gUnknown_080D6AB0
gUnknown_080D6AB0:
    .incbin "baserom.gba", 0x000D6AB0, 0x1E

    .global gUnknown_080D6ACE
gUnknown_080D6ACE:
    .incbin "baserom.gba", 0x000D6ACE, 0x22

    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .incbin "baserom.gba", 0x000D6AF0, 0x18

.arm
.syntax unified
.text

@ NOTE: We consider Player Callbacks to be all those procedures
@       that are passed to the first member of the Player struct.
@       So even if there are procedures that only take a Player,
@       if they are only called directly in the code, those are NOT callbacks.

.if 000
.endif

	thumb_func_start sub_8029990
sub_8029990: @ 0x08029990
	push {lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0802999E
	rsbs r2, r2, #0
_0802999E:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	bgt _080299AC
	adds r1, #0x54
	movs r0, #0
	b _080299E8
_080299AC:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r2, r0
	bgt _080299BA
	adds r1, #0x54
	movs r0, #1
	b _080299E8
_080299BA:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080299C8
	adds r1, #0x54
	movs r0, #2
	b _080299E8
_080299C8:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080299D6
	adds r1, #0x54
	movs r0, #3
	b _080299E8
_080299D6:
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080299E4
	adds r1, #0x54
	movs r0, #4
	b _080299E8
_080299E4:
	adds r1, #0x54
	movs r0, #5
_080299E8:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
@ (4 params!)
	thumb_func_start sub_80299F0
sub_80299F0: @ 0x080299F0
	push {lr}
	bl sub_8021604
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80299FC
sub_80299FC: @ 0x080299FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x8c
	ldr r0, [r5]
	bl TaskDestroy
	movs r0, #0
	str r0, [r5]
	adds r4, #0x60
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08029A20
	bl sub_801F78C
	bl sub_8021350
_08029A20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029A28
sub_8029A28: @ 0x08029A28
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029A34
	mov r4, sp
_08029A34:
	cmp r2, #0
	bne _08029A3A
	add r2, sp, #4
_08029A3A:
	adds r1, r4, #0
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029A50
	movs r0, #0
	b _08029A62
_08029A50:
	ldr r0, _08029A70 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029A64
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029A62:
	strb r0, [r4]
_08029A64:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029A70: .4byte gUnknown_03005424

	thumb_func_start sub_8029A74
sub_8029A74: @ 0x08029A74
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029A80
	mov r4, sp
_08029A80:
	cmp r2, #0
	bne _08029A86
	add r2, sp, #4
_08029A86:
	adds r1, r4, #0
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029A9C
	movs r0, #0
	b _08029AAE
_08029A9C:
	ldr r0, _08029ABC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029AB0
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029AAE:
	strb r0, [r4]
_08029AB0:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029ABC: .4byte gUnknown_03005424

	thumb_func_start sub_8029AC0
sub_8029AC0: @ 0x08029AC0
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029ACC
	mov r4, sp
_08029ACC:
	cmp r2, #0
	bne _08029AD2
	add r2, sp, #4
_08029AD2:
	adds r1, r4, #0
	bl sub_8021B08
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029AE8
	movs r0, #0
	b _08029AFA
_08029AE8:
	ldr r0, _08029B08 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029AFC
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029AFA:
	strb r0, [r4]
_08029AFC:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029B08: .4byte gUnknown_03005424

	thumb_func_start sub_8029B0C
sub_8029B0C: @ 0x08029B0C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029B18
	mov r4, sp
_08029B18:
	cmp r2, #0
	bne _08029B1E
	add r2, sp, #4
_08029B1E:
	adds r1, r4, #0
	bl sub_8029BB8
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029B34
	movs r0, #0
	b _08029B46
_08029B34:
	ldr r0, _08029B54 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029B48
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029B46:
	strb r0, [r4]
_08029B48:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029B54: .4byte gUnknown_03005424

	thumb_func_start sub_8029B58
sub_8029B58: @ 0x08029B58
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08029B74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029B78
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029B0C
	b _08029B80
	.align 2, 0
_08029B74: .4byte gUnknown_03005424
_08029B78:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029AC0
_08029B80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029B88
sub_8029B88: @ 0x08029B88
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08029BA4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029BA8
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029AC0
	b _08029BB0
	.align 2, 0
_08029BA4: .4byte gUnknown_03005424
_08029BA8:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029B0C
_08029BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029BB8
sub_8029BB8: @ 0x08029BB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08029BD0
	add r6, sp, #8
_08029BD0:
	cmp r7, #0
	bne _08029BD6
	add r7, sp, #0xc
_08029BD6:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _08029C00
	movs r0, #0x80
	orrs r2, r0
_08029C00:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08029C64 @ =sub_801EE64
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _08029C40
	movs r0, #0x80
	orrs r2, r0
_08029C40:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08029C68
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08029C70
	.align 2, 0
_08029C64: .4byte sub_801EE64
_08029C68:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08029C70:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029C84
sub_8029C84: @ 0x08029C84
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0x7f
	ble _08029C9A
	movs r0, #0
	strh r0, [r2, #0x14]
_08029C9A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029CA0
sub_8029CA0: @ 0x08029CA0
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029CD4
	ldr r1, _08029CDC @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r2, r0, #5
	ldrh r1, [r3, #0x14]
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _08029CD4
	adds r0, r1, r2
	strh r0, [r3, #0x14]
_08029CD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029CDC: .4byte gSineTable

	thumb_func_start sub_8029CE0
sub_8029CE0: @ 0x08029CE0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029D0C
	ldr r1, _08029D10 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	ldrh r1, [r3, #0x14]
	adds r0, r0, r1
	strh r0, [r3, #0x14]
_08029D0C:
	pop {r0}
	bx r0
	.align 2, 0
_08029D10: .4byte gSineTable

	thumb_func_start sub_8029D14
sub_8029D14: @ 0x08029D14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029D5E
	cmp r2, #0
	beq _08029D5E
	ldr r1, _08029D50 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r1, r0, #8
	cmp r2, #0
	ble _08029D54
	cmp r1, #0
	bgt _08029D5A
	b _08029D58
	.align 2, 0
_08029D50: .4byte gSineTable
_08029D54:
	cmp r1, #0
	blt _08029D5A
_08029D58:
	asrs r1, r0, #0xa
_08029D5A:
	adds r2, r2, r1
	strh r2, [r4, #0x14]
_08029D5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029D64
sub_8029D64: @ 0x08029D64
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r4, _08029DB0 @ =gUnknown_03005424
	ldr r1, _08029DB4 @ =gUnknown_0300544C
	ldrh r0, [r4]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029D8A
	ldrh r0, [r2, #0x12]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
_08029D8A:
	ldrh r3, [r2, #0x12]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029D9A
	adds r3, r1, #0
_08029D9A:
	strh r3, [r2, #0x12]
	ldrh r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029DB8
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	b _08029DC0
	.align 2, 0
_08029DB0: .4byte gUnknown_03005424
_08029DB4: .4byte gUnknown_0300544C
_08029DB8:
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
_08029DC0:
	str r0, [r2, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029DC8
sub_8029DC8: @ 0x08029DC8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08029DDC
	ldrh r0, [r2, #0x12]
	adds r0, #0xc
	b _08029DE0
_08029DDC:
	ldrh r0, [r2, #0x12]
	adds r0, #0x2a
_08029DE0:
	strh r0, [r2, #0x12]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029DE8
sub_8029DE8: @ 0x08029DE8
	push {lr}
	ldr r3, _08029E0C @ =gCamera
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _08029E1E
	ldr r0, _08029E10 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029E14
	ldr r0, [r3, #0x28]
	lsls r0, r0, #8
	cmp r2, r0
	bgt _08029E1E
_08029E08:
	movs r0, #1
	b _08029E20
	.align 2, 0
_08029E0C: .4byte gCamera
_08029E10: .4byte gUnknown_03005424
_08029E14:
	ldr r0, [r3, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	cmp r2, r0
	bge _08029E08
_08029E1E:
	movs r0, #0
_08029E20:
	pop {r1}
	bx r1

	thumb_func_start sub_8029E24
sub_8029E24: @ 0x08029E24
	push {lr}
	ldr r3, _08029E4C @ =gCamera
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _08029E60
	ldr r0, _08029E50 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029E54
	ldr r0, [r3, #4]
	subs r0, #0x50
	lsls r0, r0, #8
	cmp r2, r0
	bgt _08029E60
_08029E46:
	movs r0, #1
	b _08029E62
	.align 2, 0
_08029E4C: .4byte gCamera
_08029E50: .4byte gUnknown_03005424
_08029E54:
	ldr r0, [r3, #4]
	lsls r0, r0, #8
	ldr r1, _08029E68 @ =0x0000EFFF
	adds r0, r0, r1
	cmp r2, r0
	bge _08029E46
_08029E60:
	movs r0, #0
_08029E62:
	pop {r1}
	bx r1
	.align 2, 0
_08029E68: .4byte 0x0000EFFF

	thumb_func_start sub_8029E6C
sub_8029E6C: @ 0x08029E6C
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08029EC0 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08029ED0
	ldr r0, _08029EC4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029EA2
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08029EA2:
	adds r0, r2, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r3, #0
	bl sub_8022F58
	cmp r0, #3
	ble _08029ED0
	ldr r1, _08029EC8 @ =gPlayer
	ldr r0, _08029ECC @ =PlayerCB_8025D00
	str r0, [r1]
	movs r0, #1
	b _08029ED2
	.align 2, 0
_08029EC0: .4byte gPlayerControls
_08029EC4: .4byte gUnknown_03005424
_08029EC8: .4byte gPlayer
_08029ECC: .4byte PlayerCB_8025D00
_08029ED0:
	movs r0, #0
_08029ED2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029ED8
sub_8029ED8: @ 0x08029ED8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _08029EEA
	subs r0, #1
	b _08029F16
_08029EEA:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08029F18
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08029F04
	rsbs r1, r1, #0
_08029F04:
	ldr r0, _08029F1C @ =0x000001DF
	cmp r1, r0
	bgt _08029F18
	strh r3, [r2, #0x14]
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1e
_08029F16:
	strh r0, [r2, #0x2a]
_08029F18:
	pop {r0}
	bx r0
	.align 2, 0
_08029F1C: .4byte 0x000001DF

	thumb_func_start sub_8029F20
sub_8029F20: @ 0x08029F20
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08029F36
	adds r1, #2
	cmp r1, #0
	ble _08029F42
	b _08029F40
_08029F36:
	cmp r1, #0
	ble _08029F42
	subs r1, #2
	cmp r1, #0
	bge _08029F42
_08029F40:
	movs r1, #0
_08029F42:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	pop {r0}
	bx r0

	thumb_func_start sub_8029F4C
sub_8029F4C: @ 0x08029F4C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x87
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08029F94 @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08029F98 @ =gSongTable
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08029F90
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08029F90
	ldr r1, _08029F9C @ =gLevelSongs
	ldr r0, _08029FA0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08029F90:
	pop {r0}
	bx r0
	.align 2, 0
_08029F94: .4byte gMPlayTable
_08029F98: .4byte gSongTable
_08029F9C: .4byte gLevelSongs
_08029FA0: .4byte gCurrentLevel

	thumb_func_start sub_8029FA4
sub_8029FA4: @ 0x08029FA4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	movs r1, #3
	cmp r0, #0
	beq _08029FB8
	movs r1, #7
_08029FB8:
	ldr r0, _08029FE8 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08029FE2
	movs r2, #0x17
	ldrsb r2, [r3, r2]
	ldr r0, _08029FEC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029FD4
	rsbs r2, r2, #0
_08029FD4:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	adds r1, r1, r2
	bl sub_801F5CC
_08029FE2:
	pop {r0}
	bx r0
	.align 2, 0
_08029FE8: .4byte gUnknown_03005590
_08029FEC: .4byte gUnknown_03005424

	thumb_func_start Player_SetMovestate_IsInScriptedSequence
Player_SetMovestate_IsInScriptedSequence: @ 0x08029FF0
	ldr r0, _0802A000 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0x17
	orrs r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0802A000: .4byte gPlayer

	thumb_func_start Player_ClearMovestate_IsInScriptedSequence
Player_ClearMovestate_IsInScriptedSequence: @ 0x0802A004
	ldr r0, _0802A010 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802A014 @ =0xBFFFFFFF
	ands r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0802A010: .4byte gPlayer
_0802A014: .4byte 0xBFFFFFFF

	thumb_func_start sub_802A018
sub_802A018: @ 0x0802A018
	push {lr}
	ldr r0, _0802A044 @ =gPlayer
	adds r0, #0x6d
	movs r1, #0xa
	strb r1, [r0]
	ldr r2, _0802A048 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x23
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0802A04C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802A03E
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0802A03E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A044: .4byte gPlayer
_0802A048: .4byte gUnknown_03005424
_0802A04C: .4byte gGameMode

	thumb_func_start sub_802A050
sub_802A050: @ 0x0802A050
	push {lr}
	ldr r2, _0802A074 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x23
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0802A078 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802A06E
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0802A06E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A074: .4byte gUnknown_03005424
_0802A078: .4byte gGameMode

	thumb_func_start sub_802A07C
sub_802A07C: @ 0x0802A07C
	push {r4, lr}
	ldr r4, _0802A0C4 @ =gPlayer
	adds r1, r4, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A0A2
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0A2:
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802A0BE
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A0C4: .4byte gPlayer

	thumb_func_start sub_802A0C8
sub_802A0C8: @ 0x0802A0C8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _0802A0F4
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A0F4
	ldr r1, _0802A0EC @ =gPlayer
	ldr r0, _0802A0F0 @ =PlayerCB_802A620
	str r0, [r1]
	movs r0, #1
	b _0802A0F6
	.align 2, 0
_0802A0EC: .4byte gPlayer
_0802A0F0: .4byte PlayerCB_802A620
_0802A0F4:
	movs r0, #0
_0802A0F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A0FC
sub_802A0FC: @ 0x0802A0FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0802A17C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _0802A148
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r0, [r2, #0x20]
	ldr r1, _0802A13C @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r1, _0802A140 @ =gPlayer
	ldr r0, _0802A144 @ =PlayerCB_802A228
	str r0, [r1]
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A13C: .4byte 0x01000006
_0802A140: .4byte gPlayer
_0802A144: .4byte PlayerCB_802A228
_0802A148:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0802A17C
	ldr r0, [r2, #0x20]
	ldr r1, _0802A170 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A17C
	ldr r1, _0802A174 @ =gPlayer
	ldr r0, _0802A178 @ =PlayerCB_8025A0C
	str r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A170: .4byte 0x01000006
_0802A174: .4byte gPlayer
_0802A178: .4byte PlayerCB_8025A0C
_0802A17C:
	movs r0, #0
_0802A17E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A184
sub_802A184: @ 0x0802A184
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0802A1C0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0802A1B4 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A1C0
	ldr r0, _0802A1B8 @ =gPlayer
	ldr r1, _0802A1BC @ =PlayerCB_802631C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	movs r0, #1
	b _0802A1C2
	.align 2, 0
_0802A1B4: .4byte gPlayerControls
_0802A1B8: .4byte gPlayer
_0802A1BC: .4byte PlayerCB_802631C
_0802A1C0:
	movs r0, #0
_0802A1C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A1C8
sub_802A1C8: @ 0x0802A1C8
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A1E4
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1E4:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A1FA
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1FA:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_0802A204:
	str r0, [r3, #0x40]
	ldr r1, _0802A224 @ =gUnknown_080D6902
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [r3, #0x48]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	str r0, [r3, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A224: .4byte gUnknown_080D6902

	thumb_func_start PlayerCB_802A228
PlayerCB_802A228: @ 0x0802A228
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #2
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A250 @ =gPlayer
	ldr r2, _0802A254 @ =PlayerCB_8025854
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A250: .4byte gPlayer
_0802A254: .4byte PlayerCB_8025854

	thumb_func_start PlayerCB_802A258
PlayerCB_802A258: @ 0x0802A258
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A27E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0802A276
	adds r0, r2, #0
	bl PlayerCB_8025A0C
	b _0802A296
_0802A276:
	adds r0, r2, #0
	bl PlayerCB_8025318
	b _0802A296
_0802A27E:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _0802A29C @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r2, #0x20]
	ldr r0, _0802A2A0 @ =gPlayer
	ldr r1, _0802A2A4 @ =PlayerCB_8026D2C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
_0802A296:
	pop {r0}
	bx r0
	.align 2, 0
_0802A29C: .4byte 0xFEFFFFDF
_0802A2A0: .4byte gPlayer
_0802A2A4: .4byte PlayerCB_8026D2C

	thumb_func_start sub_802A2A8
sub_802A2A8: @ 0x0802A2A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802A2E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802A2DE
	ldr r0, [r2, #0x20]
	movs r1, #0x84
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0802A2DE
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802A2DE
	adds r0, r2, #0
	adds r0, #0x5e
	ldr r1, _0802A2E8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A2EC
_0802A2DE:
	movs r0, #0
	b _0802A2F4
	.align 2, 0
_0802A2E4: .4byte gGameMode
_0802A2E8: .4byte gPlayerControls
_0802A2EC:
	ldr r1, _0802A2F8 @ =gPlayer
	ldr r0, _0802A2FC @ =PlayerCB_802A714
	str r0, [r1]
	movs r0, #1
_0802A2F4:
	pop {r1}
	bx r1
	.align 2, 0
_0802A2F8: .4byte gPlayer
_0802A2FC: .4byte PlayerCB_802A714

	thumb_func_start PlayerCB_802A300
PlayerCB_802A300: @ 0x0802A300
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0802A34C @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0x66
	ldr r0, _0802A350 @ =0x0000FFFF
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _0802A354 @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _0802A358 @ =gPlayer
	ldr r1, _0802A35C @ =PlayerCB_802940C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A34C: .4byte 0xFEFFFFD7
_0802A350: .4byte 0x0000FFFF
_0802A354: .4byte 0x00000115
_0802A358: .4byte gPlayer
_0802A35C: .4byte PlayerCB_802940C

	thumb_func_start sub_802A360
sub_802A360: @ 0x0802A360
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x3e
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x92
	lsls r0, r0, #1     @ SE_ICE_PARADISE_SLIDE
	bl m4aSongNumStart
	ldr r0, _0802A3B0 @ =gPlayer
	ldr r1, _0802A3B4 @ =PlayerCB_8026BCC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3B0: .4byte gPlayer
_0802A3B4: .4byte PlayerCB_8026BCC

	thumb_func_start PlayerCB_802A3B8
PlayerCB_802A3B8: @ 0x0802A3B8
	push {lr}
	bl sub_802808C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_802A3C4
PlayerCB_802A3C4: @ 0x0802A3C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	adds r4, #0x90
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A3E2
	ldr r1, _0802A3E8 @ =gPlayer
	ldr r0, _0802A3EC @ =PlayerCB_8025A0C
	str r0, [r1]
_0802A3E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E8: .4byte gPlayer
_0802A3EC: .4byte PlayerCB_8025A0C

	thumb_func_start PlayerCB_802A3F0
PlayerCB_802A3F0: @ 0x0802A3F0
	push {lr}
	ldr r2, _0802A408 @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0802A402
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_0802A402:
	pop {r0}
	bx r0
	.align 2, 0
_0802A408: .4byte gCamera

	thumb_func_start sub_802A40C
sub_802A40C: @ 0x0802A40C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x72
	strh r2, [r0]
	ldr r0, _0802A460 @ =gPlayer
	ldr r1, _0802A464 @ =PlayerCB_80279F8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A460: .4byte gPlayer
_0802A464: .4byte PlayerCB_80279F8

	thumb_func_start sub_802A468
sub_802A468: @ 0x0802A468
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0802A4B0 @ =gPlayer
	ldr r1, _0802A4B4 @ =PlayerCB_8027C5C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4B0: .4byte gPlayer
_0802A4B4: .4byte PlayerCB_8027C5C

	thumb_func_start sub_802A4B8
sub_802A4B8: @ 0x0802A4B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _0802A4F4 @ =gPlayer
	ldr r1, _0802A4F8 @ =PlayerCB_8027D3C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4F4: .4byte gPlayer
_0802A4F8: .4byte PlayerCB_8027D3C

	thumb_func_start PlayerCB_802A4FC
PlayerCB_802A4FC: @ 0x0802A4FC
	bx lr
	.align 2, 0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A500
sub_802A500: @ 0x0802A500
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802A51A
	adds r0, r4, #0
	bl sub_8022218
	adds r0, r4, #0
	bl sub_8022284
	b _0802A526
_0802A51A:
	adds r0, r4, #0
	bl sub_8022284
	adds r0, r4, #0
	bl sub_8022218
_0802A526:
	pop {r4}
	pop {r0}
	bx r0
    
@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A52C
sub_802A52C: @ 0x0802A52C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0802A54C
	ldr r1, _0802A550 @ =gPlayer
	ldr r0, _0802A554 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_0802A54C:
	pop {r0}
	bx r0
	.align 2, 0
_0802A550: .4byte gPlayer
_0802A554: .4byte PlayerCB_8025318

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A558
sub_802A558: @ 0x0802A558
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _0802A56A
	movs r1, #0xc
_0802A56A:
	ldrh r3, [r2, #0x12]
	movs r4, #0x12
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _0802A57C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0802A57C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	strh r0, [r2, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A58C
sub_802A58C: @ 0x0802A58C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _0802A5A8
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _0802A5A8
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_0802A5A8:
	pop {r0}
	bx r0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A5AC
sub_802A5AC: @ 0x0802A5AC
	push {lr}
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802A5C0
	subs r0, r2, #1
	strb r0, [r1]
_0802A5C0:
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_802A5C4
PlayerCB_802A5C4: @ 0x0802A5C4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802A5E6
	movs r0, #6
	b _0802A5E8
_0802A5E6:
	movs r0, #5
_0802A5E8:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A614 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _0802A618 @ =gPlayer
	ldr r1, _0802A61C @ =PlayerCB_8025548
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0802A614: .4byte 0xFFFFBFFF
_0802A618: .4byte gPlayer
_0802A61C: .4byte PlayerCB_8025548

	thumb_func_start PlayerCB_802A620
PlayerCB_802A620: @ 0x0802A620
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x90
	ldr r3, [r1]
	ldr r1, [r3, #0x1c]
	ldr r2, _0802A654 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A658 @ =gPlayer
	ldr r2, _0802A65C @ =PlayerCB_802569C
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A654: .4byte 0xFFFFBFFF
_0802A658: .4byte gPlayer
_0802A65C: .4byte PlayerCB_802569C

@ Unused?
	thumb_func_start sub_802A660
sub_802A660: @ 0x0802A660
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A6BA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _0802A69C
	cmp r1, #0x20
	bne _0802A6BA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0802A690
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A690:
	subs r0, #0x18
	cmp r0, #0
	bge _0802A6B8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _0802A6B8
_0802A69C:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0802A6B0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A6B0:
	adds r0, #0x18
	cmp r0, #0
	ble _0802A6B8
	movs r0, #0x60
_0802A6B8:
	strh r0, [r2, #0x14]
_0802A6BA:
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
	thumb_func_start sub_802A6C0
sub_802A6C0: @ 0x0802A6C0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A708 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r2, ip
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0802A70C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802A710 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_0802A708: .4byte 0xFFFFCFFF
_0802A70C: .4byte gPlayer
_0802A710: .4byte 0xBFFFFFFF

	thumb_func_start PlayerCB_802A714
PlayerCB_802A714: @ 0x0802A714
	push {lr}
	adds r2, r0, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _0802A7A4
	lsls r0, r0, #2
	ldr r1, _0802A730 @ =_0802A734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A730: .4byte _0802A734
_0802A734: @ jump table
	.4byte _0802A748 @ case 0
	.4byte _0802A750 @ case 1
	.4byte _0802A76A @ case 2
	.4byte _0802A772 @ case 3
	.4byte _0802A78C @ case 4
_0802A748:
	adds r0, r2, #0
	bl sub_8011D48
	b _0802A7A4
_0802A750:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A762
	adds r0, r2, #0
	bl sub_8012548
	b _0802A7A4
_0802A762:
	adds r0, r2, #0
	bl sub_8012830
	b _0802A7A4
_0802A76A:
	adds r0, r2, #0
	bl sub_8012D3C
	b _0802A7A4
_0802A772:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A784
	adds r0, r2, #0
	bl sub_8012EEC
	b _0802A7A4
_0802A784:
	adds r0, r2, #0
	bl sub_8013070
	b _0802A7A4
_0802A78C:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A79E
	adds r0, r2, #0
	bl sub_8013F04
	b _0802A7A4
_0802A79E:
	adds r0, r2, #0
	bl sub_8011D48
_0802A7A4:
	pop {r0}
	bx r0
