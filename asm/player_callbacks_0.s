.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

@ NOTE: We consider Player Callbacks to be all those procedures
@       that are passed to the first member of the Player struct.
@       So even if there are procedures that only take a Player,
@       if they are only called directly in the code, those are NOT callbacks.

.if 00
.endif

	thumb_func_start PlayerCB_8013B6C
PlayerCB_8013B6C: @ 0x08013B6C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013BA8
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08013BA0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	b _08013BA6
_08013BA0:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08013BA6:
	strb r0, [r1]
_08013BA8:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013BB4
PlayerCB_8013BB4: @ 0x08013BB4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80139B0
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_80131B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013BD4
PlayerCB_8013BD4: @ 0x08013BD4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_8013498
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013BF0
PlayerCB_8013BF0: @ 0x08013BF0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013C0C
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013C0C:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013C18
PlayerCB_8013C18: @ 0x08013C18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80135BC
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013C34
PlayerCB_8013C34: @ 0x08013C34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80136E8
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C50
sub_8013C50: @ 0x08013C50
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x68
	strh r0, [r1]
	ldr r0, _08013C74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013C78
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	b _08013C82
	.align 2, 0
_08013C74: .4byte gUnknown_03005424
_08013C78:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
_08013C82:
	str r0, [r2, #0xc]
	ldr r1, _08013C98 @ =gPlayer
	ldr r0, _08013C9C @ =PlayerCB_8013E64
	str r0, [r1]
	adds r1, r2, #0
	adds r1, #0xad
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013C98: .4byte gPlayer
_08013C9C: .4byte PlayerCB_8013E64

	thumb_func_start sub_8013CA0
sub_8013CA0: @ 0x08013CA0
	ldr r2, _08013CB8 @ =gPlayer
	ldr r1, _08013CBC @ =PlayerCB_8013BD4
	str r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0x64
	movs r1, #0x5d
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013CB8: .4byte gPlayer
_08013CBC: .4byte PlayerCB_8013BD4

	thumb_func_start sub_8013CC0
sub_8013CC0: @ 0x08013CC0
	push {lr}
	adds r2, r0, #0
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08013CCE
	rsbs r1, r1, #0
_08013CCE:
	ldr r0, _08013CE4 @ =0x000002FF
	cmp r1, r0
	bgt _08013CEE
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013CE8
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08013CEC
	.align 2, 0
_08013CE4: .4byte 0x000002FF
_08013CE8:
	movs r0, #0xc0
	lsls r0, r0, #2
_08013CEC:
	strh r0, [r2, #0x14]
_08013CEE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013CF4
sub_8013CF4: @ 0x08013CF4
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013D06
	subs r1, #0x60
	cmp r1, #0
	bge _08013D12
	b _08013D10
_08013D06:
	cmp r1, #0
	bge _08013D14
	adds r1, #0x60
	cmp r1, #0
	ble _08013D12
_08013D10:
	movs r1, #0
_08013D12:
	strh r1, [r0, #0x14]
_08013D14:
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013D18
PlayerCB_8013D18: @ 0x08013D18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r3, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _08013D6C @ =0x20000100
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013D70 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6a
	strh r0, [r1]
	strh r3, [r4, #0x10]
	strh r3, [r4, #0x12]
	movs r0, #0xe2
	bl m4aSongNumStart
	ldr r0, _08013D74 @ =gPlayer
	ldr r1, _08013D78 @ =PlayerCB_8013DA8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D6C: .4byte 0x20000100
_08013D70: .4byte 0xFFFFBFFF
_08013D74: .4byte gPlayer
_08013D78: .4byte PlayerCB_8013DA8

	thumb_func_start sub_8013D7C
sub_8013D7C: @ 0x08013D7C
	ldr r2, _08013DA0 @ =gPlayer
	ldr r1, _08013DA4 @ =PlayerCB_8013BD4
	str r1, [r2]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x5d
	strh r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0xac
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08013DA0: .4byte gPlayer
_08013DA4: .4byte PlayerCB_8013BD4

	thumb_func_start PlayerCB_8013DA8
PlayerCB_8013DA8: @ 0x08013DA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80283C4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013DEC
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x6b
	strh r0, [r1]
	strh r2, [r4, #0x10]
	adds r0, #0x95
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8012DF8
	ldr r0, _08013DF4 @ =gPlayer
	ldr r1, _08013DF8 @ =PlayerCB_8013DFC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_08013DEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DF4: .4byte gPlayer
_08013DF8: .4byte PlayerCB_8013DFC

	thumb_func_start PlayerCB_8013DFC
PlayerCB_8013DFC: @ 0x08013DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80283C4
	ldr r2, [r4, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _08013E26
	ldr r1, _08013E2C @ =gPlayer
	ldr r0, _08013E30 @ =PlayerCB_8013E34
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6c
	strh r0, [r1]
	strh r2, [r4, #0x12]
_08013E26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013E2C: .4byte gPlayer
_08013E30: .4byte PlayerCB_8013E34

	thumb_func_start PlayerCB_8013E34
PlayerCB_8013E34: @ 0x08013E34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013E5E
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013E5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013E64
PlayerCB_8013E64: @ 0x08013E64
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013ECE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08013E98 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013E9C
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	b _08013EA6
	.align 2, 0
_08013E98: .4byte gUnknown_03005424
_08013E9C:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
_08013EA6:
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013EBC
	ldr r0, [r4, #8]
	ldr r1, _08013EB8 @ =0xFFFFF000
	b _08013EC2
	.align 2, 0
_08013EB8: .4byte 0xFFFFF000
_08013EBC:
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #5
_08013EC2:
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl PlayerCB_8025318
	b _08013EDA
_08013ECE:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
_08013EDA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013EE0
sub_8013EE0: @ 0x08013EE0
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013EF2
	subs r1, #0x60
	cmp r1, #0
	bge _08013EFE
	b _08013EFC
_08013EF2:
	cmp r1, #0
	bge _08013F00
	adds r1, #0x60
	cmp r1, #0
	ble _08013EFE
_08013EFC:
	movs r1, #0
_08013EFE:
	strh r1, [r0, #0x14]
_08013F00:
	pop {r0}
	bx r0

	thumb_func_start sub_8013F04
sub_8013F04: @ 0x08013F04
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013F54 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	bl sub_8015BD4
	ldr r0, _08013F58 @ =gPlayer
	ldr r1, _08013F5C @ =PlayerCB_8013F60
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F54: .4byte 0xFFFFBFFF
_08013F58: .4byte gPlayer
_08013F5C: .4byte PlayerCB_8013F60

	thumb_func_start PlayerCB_8013F60
PlayerCB_8013F60: @ 0x08013F60
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08013F74
	subs r0, #0x60
	cmp r0, #0
	bge _08013F80
	b _08013F7E
_08013F74:
	cmp r0, #0
	bge _08013F82
	adds r0, #0x60
	cmp r0, #0
	ble _08013F80
_08013F7E:
	movs r0, #0
_08013F80:
	strh r0, [r2, #0x14]
_08013F82:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013F9A
	ldr r1, _08013FA4 @ =gPlayer
	ldr r0, _08013FA8 @ =PlayerCB_8025318
	str r0, [r1]
_08013F9A:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_08013FA4: .4byte gPlayer
_08013FA8: .4byte PlayerCB_8025318
