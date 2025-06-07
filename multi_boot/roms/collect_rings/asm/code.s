.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start Player_Jumping
Player_Jumping: @ 0x0200FADC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200FB0E
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xfd
	lsls r0, r0, #8
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	bge _0200FB0E
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _0200FB68 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0200FB0E
	strh r3, [r4, #0x12]
_0200FB0E:
	adds r0, r4, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl Player_AirInputControls
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FB46
	adds r2, r1, #0
_0200FB46:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FB6C
	adds r1, #2
	cmp r1, #0
	ble _0200FB78
	b _0200FB76
	.align 2, 0
_0200FB68: .4byte gPlayerControls
_0200FB6C:
	cmp r1, #0
	ble _0200FB78
	subs r1, #2
	cmp r1, #0
	bge _0200FB78
_0200FB76:
	movs r1, #0
_0200FB78:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _0200FB8C
	cmp r2, #0
	beq _0200FB98
_0200FB8C:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FB98:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FBD0
	cmp r0, #1
	bgt _0200FBB6
	cmp r0, #0
	beq _0200FBC0
	b _0200FBDE
_0200FBB6:
	cmp r0, #2
	beq _0200FBC8
	cmp r0, #3
	beq _0200FBD8
	b _0200FBDE
_0200FBC0:
	adds r0, r4, #0
	bl sub_8021C4C
	b _0200FBDE
_0200FBC8:
	adds r0, r4, #0
	bl sub_8021DB8
	b _0200FBDE
_0200FBD0:
	adds r0, r4, #0
	bl sub_8021EE4
	b _0200FBDE
_0200FBD8:
	adds r0, r4, #0
	bl sub_802203C
_0200FBDE:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0200FBF6
	ldr r1, _0200FBFC @ =gPlayer
	ldr r0, _0200FC00 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0200FBF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200FBFC: .4byte gPlayer
_0200FC00: .4byte Player_TouchGround

	thumb_func_start Player_InitUncurl
Player_InitUncurl: @ 0x0200FC04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200FC88 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0200FC8C @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _0200FC44
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _0200FC54
_0200FC44:
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
_0200FC54:
	adds r1, r4, #0
	adds r1, #0x70
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	strb r3, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200FC90 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x24
	strb r3, [r0]
	ldr r0, _0200FC94 @ =gPlayer
	ldr r1, _0200FC98 @ =sub_0200FC9C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200FC88: .4byte 0xCEF118CF
_0200FC8C: .4byte 0xFEFFFFDF
_0200FC90: .4byte 0xFFFFBFFF
_0200FC94: .4byte gPlayer
_0200FC98: .4byte sub_0200FC9C

	thumb_func_start sub_0200FC9C
sub_0200FC9C: @ 0x0200FC9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl Player_AirInputControls
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FCD6
	adds r2, r1, #0
_0200FCD6:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FCF8
	adds r1, #2
	cmp r1, #0
	ble _0200FD04
	b _0200FD02
_0200FCF8:
	cmp r1, #0
	ble _0200FD04
	subs r1, #2
	cmp r1, #0
	bge _0200FD04
_0200FD02:
	movs r1, #0
_0200FD04:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _0200FD18
	cmp r2, #0
	beq _0200FD24
_0200FD18:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FD24:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FD5C
	cmp r0, #1
	bgt _0200FD42
	cmp r0, #0
	beq _0200FD4C
	b _0200FD6A
_0200FD42:
	cmp r0, #2
	beq _0200FD54
	cmp r0, #3
	beq _0200FD64
	b _0200FD6A
_0200FD4C:
	adds r0, r4, #0
	bl sub_8021C4C
	b _0200FD6A
_0200FD54:
	adds r0, r4, #0
	bl sub_8021DB8
	b _0200FD6A
_0200FD5C:
	adds r0, r4, #0
	bl sub_8021EE4
	b _0200FD6A
_0200FD64:
	adds r0, r4, #0
	bl sub_802203C
_0200FD6A:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0200FD82
	ldr r1, _0200FD88 @ =gPlayer
	ldr r0, _0200FD8C @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0200FD82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200FD88: .4byte gPlayer
_0200FD8C: .4byte Player_TouchGround

	thumb_func_start sub_0200FD90
sub_0200FD90: @ 0x0200FD90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x68
	ldr r1, _0200FE00 @ =gPlayerCharacterIdleAnims
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0200FE14
	ldr r2, [r6, #0x20]
	ldr r0, _0200FE04 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r6, #0x20]
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0200FDD8
	movs r1, #8
_0200FDD8:
	ldr r0, _0200FE08 @ =gUnknown_02015E3C
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _0200FDEE
	rsbs r1, r1, #0
_0200FDEE:
	strh r1, [r6, #0x14]
	ldr r1, _0200FE0C @ =gPlayer
	ldr r0, _0200FE10 @ =Player_SpinAttack
	str r0, [r1]
	movs r0, #0xc
	bl m4aSongNumStart
	b _0200FEBA
	.align 2, 0
_0200FE00: .4byte gPlayerCharacterIdleAnims
_0200FE04: .4byte 0xFFFFFBFF
_0200FE08: .4byte gUnknown_02015E3C
_0200FE0C: .4byte gPlayer
_0200FE10: .4byte Player_SpinAttack
_0200FE14:
	ldrh r4, [r6, #0x26]
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0200FE2C
	asrs r0, r0, #0x15
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bgt _0200FE2C
	movs r4, #0
_0200FE2C:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0200FF14 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0200FE98
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r2, _0200FF18 @ =gMPlayTable
	ldr r0, _0200FF1C @ =gSongTable
	adds r0, #0x5c
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _0200FF20 @ =0x0000FFFF
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x80
	rsbs r2, r2, #0
	ands r2, r4
	adds r0, r5, #0
	bl m4aMPlayPitchControl
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bge _0200FE86
	adds r2, r1, #0
_0200FE86:
	adds r4, r2, #0
	adds r2, r6, #0
	adds r2, #0x6a
	movs r0, #1
	movs r1, #1
	strh r1, [r2]
	adds r1, r6, #0
	adds r1, #0x6c
	strb r0, [r1]
_0200FE98:
	strh r4, [r6, #0x26]
	cmp r7, #3
	bne _0200FEBA
	adds r2, r6, #0
	adds r2, #0x6a
	ldrh r0, [r2]
	cmp r0, #1
	bne _0200FEBA
	mov r4, r8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200FEBA
	movs r0, #0
	strh r0, [r2]
_0200FEBA:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200FFB8
	adds r0, r6, #0
	bl sub_80236C8
	adds r0, r6, #0
	bl sub_80232D0
	ldrh r0, [r6, #0x12]
	adds r0, #0x2a
	strh r0, [r6, #0x12]
	movs r1, #0x10
	ldrsh r2, [r6, r1]
	ldr r1, [r6, #8]
	adds r1, r1, r2
	str r1, [r6, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FEF0
	adds r2, r1, #0
_0200FEF0:
	strh r2, [r6, #0x12]
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FF24
	adds r1, #2
	cmp r1, #0
	ble _0200FF30
	b _0200FF2E
	.align 2, 0
_0200FF14: .4byte gPlayerControls
_0200FF18: .4byte gMPlayTable
_0200FF1C: .4byte gSongTable
_0200FF20: .4byte 0x0000FFFF
_0200FF24:
	cmp r1, #0
	ble _0200FF30
	subs r1, #2
	cmp r1, #0
	bge _0200FF30
_0200FF2E:
	movs r1, #0
_0200FF30:
	strb r1, [r5]
	ldrh r2, [r6, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r4, #0x10
	ldrsh r0, [r6, r4]
	cmp r0, #0
	bne _0200FF44
	cmp r2, #0
	beq _0200FF50
_0200FF44:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FF50:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FF88
	cmp r0, #1
	bgt _0200FF6E
	cmp r0, #0
	beq _0200FF78
	b _0200FF96
_0200FF6E:
	cmp r0, #2
	beq _0200FF80
	cmp r0, #3
	beq _0200FF90
	b _0200FF96
_0200FF78:
	adds r0, r6, #0
	bl sub_8021C4C
	b _0200FF96
_0200FF80:
	adds r0, r6, #0
	bl sub_8021DB8
	b _0200FF96
_0200FF88:
	adds r0, r6, #0
	bl sub_8021EE4
	b _0200FF96
_0200FF90:
	adds r0, r6, #0
	bl sub_802203C
_0200FF96:
	ldr r0, [r6, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010078
	ldr r1, _0200FFB0 @ =gPlayer
	ldr r0, _0200FFB4 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r6, #0x10]
	movs r1, #0
	strh r0, [r6, #0x14]
	strb r1, [r5]
	b _02010078
	.align 2, 0
_0200FFB0: .4byte gPlayer
_0200FFB4: .4byte Player_TouchGround
_0200FFB8:
	movs r4, #0x14
	ldrsh r3, [r6, r4]
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r4, [r0]
	adds r1, r4, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _02010002
	cmp r3, #0
	beq _02010002
	ldr r1, _0200FFF4 @ =gSineTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _0200FFF8
	cmp r2, #0
	bgt _0200FFFE
	b _0200FFFC
	.align 2, 0
_0200FFF4: .4byte gSineTable
_0200FFF8:
	cmp r2, #0
	blt _0200FFFE
_0200FFFC:
	asrs r2, r0, #0xa
_0200FFFE:
	adds r3, r3, r2
	strh r3, [r6, #0x14]
_02010002:
	adds r0, r6, #0
	bl sub_80232D0
	adds r0, r6, #0
	bl sub_8023260
	adds r0, r6, #0
	bl sub_8023128
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	ldrh r2, [r6, #0x12]
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0201002E
	adds r2, r1, #0
_0201002E:
	strh r2, [r6, #0x12]
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	adds r0, r6, #0
	bl sub_8022D6C
	ldrh r0, [r6, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r6, r1]
	cmp r2, #0
	beq _0201004E
	subs r0, #1
	b _02010076
_0201004E:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _02010078
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _02010064
	rsbs r1, r1, #0
_02010064:
	ldr r0, _02010084 @ =0x000001DF
	cmp r1, r0
	bgt _02010078
	strh r2, [r6, #0x14]
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x1e
_02010076:
	strh r0, [r6, #0x2a]
_02010078:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02010084: .4byte 0x000001DF

	thumb_func_start sub_02010088
sub_02010088: @ 0x02010088
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x38
	movs r4, #0
	strb r4, [r5]
	adds r0, #0x24
	strb r4, [r0]
	adds r3, r6, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010104 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r6, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldrb r2, [r5]
	str r4, [sp]
	ldr r3, _02010108 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E6D4
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r2, _0201010C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r2, #0x20]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010104: .4byte 0xFFFFCFFF
_02010108: .4byte sub_801EE64
_0201010C: .4byte gPlayer

	thumb_func_start Player_InitGrinding
Player_InitGrinding: @ 0x02010110
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _02010188 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #5
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #0x11
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x29
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _02010190
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	ldr r2, _0201018C @ =0xFFFFFF00
	cmp r0, r2
	ble _0201017A
	adds r1, r2, #0
_0201017A:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _020101B4
	b _020101B2
	.align 2, 0
_02010188: .4byte 0xCEF118CF
_0201018C: .4byte 0xFFFFFF00
_02010190:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	asrs r2, r5, #0x10
	cmp r0, r2
	bge _020101A8
	adds r1, r2, #0
_020101A8:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bge _020101B4
_020101B2:
	adds r1, r2, #0
_020101B4:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_02010088
	movs r0, #0x1a
	bl m4aSongNumStart
	ldr r0, _020101D4 @ =gPlayer
	ldr r1, _020101D8 @ =sub_020101DC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020101D4: .4byte gPlayer
_020101D8: .4byte sub_020101DC

	thumb_func_start sub_020101DC
sub_020101DC: @ 0x020101DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl Player_TryJump
	cmp r0, #0
	beq _02010234
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010228 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0201022C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02010230 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	b _02010318
	.align 2, 0
_02010228: .4byte 0xFFFFCFFF
_0201022C: .4byte gPlayer
_02010230: .4byte 0xBFFFFFFF
_02010234:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, #0x14]
	cmp r0, #0
	blt _02010248
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0201024E
_02010248:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_0201024E:
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _02010278
	ldr r1, _02010320 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	adds r0, r3, r0
	strh r0, [r4, #0x14]
_02010278:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	ldr r0, [r4, #0x20]
	movs r5, #2
	ands r0, r5
	cmp r0, #0
	beq _02010294
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
_02010294:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020102AE
	adds r2, r1, #0
_020102AE:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	movs r0, #0x1a
	bl m4aSongNumStartOrContinue
	ldr r0, [r4, #0x20]
	ands r0, r5
	cmp r0, #0
	beq _02010318
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010324 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _02010328 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _0201032C @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	ldr r0, _02010330 @ =Player_Jumping
	str r0, [r4]
_02010318:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010320: .4byte gSineTable
_02010324: .4byte 0xFFFFCFFF
_02010328: .4byte gPlayer
_0201032C: .4byte 0xBFFFFFFF
_02010330: .4byte Player_Jumping

	thumb_func_start Player_InitGrindRailEndGround
Player_InitGrindRailEndGround: @ 0x02010334
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	ldr r1, _020103CC @ =0xCEF118CF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	subs r1, #5
	ands r0, r1
	subs r1, #0xfe
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r3, r5, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _020103D0 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _020103D4 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _020103D8 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	ldr r1, _020103DC @ =Player_Idle
	str r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020103CC: .4byte 0xCEF118CF
_020103D0: .4byte 0xFFFFCFFF
_020103D4: .4byte gPlayer
_020103D8: .4byte 0xBFFFFFFF
_020103DC: .4byte Player_Idle

	thumb_func_start Player_GrindRailEndAir
Player_GrindRailEndAir: @ 0x020103E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _020104A4 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #5
	ands r0, r1
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
	strh r0, [r1]
	ldr r0, _020104A8 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _020104AC @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x38
	movs r6, #1
	strb r6, [r0]
	ldr r5, _020104B0 @ =gPlayer
	ldr r0, [r5, #0x20]
	ldr r1, _020104B4 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0201047E
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_0201047E:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0201048C
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
_0201048C:
	movs r0, #0xe
	bl m4aSongNumStart
	ldr r1, _020104B8 @ =sub_02010984
	str r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020104A4: .4byte 0xCEF118CF
_020104A8: .4byte 0x0000FB20
_020104AC: .4byte 0xFFFFCFFF
_020104B0: .4byte gPlayer
_020104B4: .4byte 0xBFFFFFFF
_020104B8: .4byte sub_02010984

	thumb_func_start Player_802A258
Player_802A258: @ 0x020104BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02010528
	movs r6, #4
	ands r1, r6
	cmp r1, #0
	beq _02010520
	adds r0, r5, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010514 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x64
	movs r4, #0
	strh r6, [r0]
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	orrs r0, r6
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x99
	strb r4, [r0]
	ldr r0, _02010518 @ =gPlayer
	ldr r1, _0201051C @ =Player_Rolling
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _02010540
	.align 2, 0
_02010514: .4byte 0xFFFFBFFF
_02010518: .4byte gPlayer
_0201051C: .4byte Player_Rolling
_02010520:
	adds r0, r5, #0
	bl Player_TouchGround
	b _02010540
_02010528:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _02010548 @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r5, #0x20]
	ldr r0, _0201054C @ =gPlayer
	ldr r1, _02010550 @ =sub_02010554
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_02010540:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010548: .4byte 0xFEFFFFDF
_0201054C: .4byte gPlayer
_02010550: .4byte sub_02010554

	thumb_func_start sub_02010554
sub_02010554: @ 0x02010554
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl Player_AirInputControls
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0201058E
	adds r2, r1, #0
_0201058E:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _020105B0
	adds r1, #2
	cmp r1, #0
	ble _020105BC
	b _020105BA
_020105B0:
	cmp r1, #0
	ble _020105BC
	subs r1, #2
	cmp r1, #0
	bge _020105BC
_020105BA:
	movs r1, #0
_020105BC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_0200DBE0
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _020105DC
	ldr r1, _020105E4 @ =gPlayer
	ldr r0, _020105E8 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_020105DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020105E4: .4byte gPlayer
_020105E8: .4byte Player_TouchGround

	thumb_func_start Player_InitHurt
Player_InitHurt: @ 0x020105EC
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	movs r0, #0x78
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02010606
	rsbs r1, r1, #0
_02010606:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	bgt _02010644
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0xa0
	bgt _02010634
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	bge _02010624
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010636
_02010624:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010634
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010636
_02010634:
	ldr r0, _02010640 @ =0x0000FE80
_02010636:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	b _0201065C
	.align 2, 0
_02010640: .4byte 0x0000FE80
_02010644:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _02010652
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010654
_02010652:
	ldr r0, _020106B4 @ =0x0000FE80
_02010654:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x15
_0201065C:
	strh r0, [r1]
	movs r2, #0
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	ldr r1, _020106B8 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #0xe
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _020106BC @ =0xFFFFFDF3
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _020106C0 @ =gPlayer
	ldr r1, _020106C4 @ =sub_020106C8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020106B4: .4byte 0x0000FE80
_020106B8: .4byte 0xCEF118CF
_020106BC: .4byte 0xFFFFFDF3
_020106C0: .4byte gPlayer
_020106C4: .4byte sub_020106C8

	thumb_func_start sub_020106C8
sub_020106C8: @ 0x020106C8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020106F0
	adds r2, r1, #0
_020106F0:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r1, [r4, #0x12]
	movs r2, #0
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0201070C
	cmp r1, #0
	beq _02010718
_0201070C:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x18
_02010718:
	adds r0, r2, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010750
	cmp r0, #1
	bgt _02010736
	cmp r0, #0
	beq _02010740
	b _0201075E
_02010736:
	cmp r0, #2
	beq _02010748
	cmp r0, #3
	beq _02010758
	b _0201075E
_02010740:
	adds r0, r4, #0
	bl sub_8021C4C
	b _0201075E
_02010748:
	adds r0, r4, #0
	bl sub_8021DB8
	b _0201075E
_02010750:
	adds r0, r4, #0
	bl sub_8021EE4
	b _0201075E
_02010758:
	adds r0, r4, #0
	bl sub_802203C
_0201075E:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0201077A
	ldr r1, _02010780 @ =gPlayer
	ldr r0, _02010784 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
_0201077A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02010780: .4byte gPlayer
_02010784: .4byte Player_TouchGround

	thumb_func_start Player_TouchNormalSpring
Player_TouchNormalSpring: @ 0x02010788
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	lsrs r6, r0, #4
	movs r5, #3
	ands r5, r0
	ldr r0, [r4, #0x20]
	ldr r1, _020107D4 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _020107DC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _020107DC
	ldr r0, _020107D8 @ =0xFFFFFEFD
	ands r1, r0
	str r1, [r4, #0x20]
	b _020107E6
	.align 2, 0
_020107D4: .4byte 0xCEF118CF
_020107D8: .4byte 0xFFFFFEFD
_020107DC:
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_020107E6:
	ldr r0, [r4, #0x20]
	ldr r1, _02010818 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02010808
	rsbs r1, r1, #0
_02010808:
	ldr r0, _0201081C @ =0x0000027F
	cmp r1, r0
	bgt _02010820
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x26
	b _02010826
	.align 2, 0
_02010818: .4byte 0xFEFFFFDF
_0201081C: .4byte 0x0000027F
_02010820:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
_02010826:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x66
	ldr r0, _02010840 @ =0x0000FFFF
	strh r0, [r1]
	cmp r6, #7
	bls _02010836
	b _0201093A
_02010836:
	lsls r0, r6, #2
	ldr r1, _02010844 @ =_02010848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010840: .4byte 0x0000FFFF
_02010844: .4byte _02010848
_02010848: @ jump table
	.4byte _02010868 @ case 0
	.4byte _02010878 @ case 1
	.4byte _02010884 @ case 2
	.4byte _020108B0 @ case 3
	.4byte _020108DC @ case 4
	.4byte _020108FC @ case 5
	.4byte _02010918 @ case 6
	.4byte _02010928 @ case 7
_02010868:
	ldr r0, _02010874 @ =gUnknown_02015E56
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_02010874: .4byte gUnknown_02015E56
_02010878:
	ldr r0, _02010880 @ =gUnknown_02015E56
	lsls r1, r5, #1
	b _02010934
	.align 2, 0
_02010880: .4byte gUnknown_02015E56
_02010884:
	ldr r1, _020108A8 @ =gUnknown_02015E5E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r2, r0, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0201093A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r1, _020108AC @ =0xFFFFF700
	cmp r0, r1
	bge _0201093A
	b _020108CE
	.align 2, 0
_020108A8: .4byte gUnknown_02015E5E
_020108AC: .4byte 0xFFFFF700
_020108B0:
	ldr r1, _020108D8 @ =gUnknown_02015E5E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0201093A
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x14
	cmp r1, r0
	ble _0201093A
_020108CE:
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #1
	strb r0, [r1]
	b _0201093A
	.align 2, 0
_020108D8: .4byte gUnknown_02015E5E
_020108DC:
	ldr r0, _020108F4 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _020108F8 @ =gUnknown_02015E56
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_020108F4: .4byte gUnknown_02015E5E
_020108F8: .4byte gUnknown_02015E56
_020108FC:
	ldr r0, _02010910 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	ldr r0, _02010914 @ =gUnknown_02015E56
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_02010910: .4byte gUnknown_02015E5E
_02010914: .4byte gUnknown_02015E56
_02010918:
	ldr r0, _02010924 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	b _02010930
	.align 2, 0
_02010924: .4byte gUnknown_02015E5E
_02010928:
	ldr r0, _02010970 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
_02010930:
	strh r0, [r4, #0x10]
	ldr r0, _02010974 @ =gUnknown_02015E56
_02010934:
	adds r1, r1, r0
	ldrh r0, [r1]
_02010938:
	strh r0, [r4, #0x12]
_0201093A:
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	ble _02010950
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_02010950:
	ldr r0, _02010978 @ =0xFFFFFEC0
	cmp r2, r0
	bge _0201095E
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_0201095E:
	ldr r0, _0201097C @ =gPlayer
	ldr r1, _02010980 @ =sub_02010984
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010970: .4byte gUnknown_02015E5E
_02010974: .4byte gUnknown_02015E56
_02010978: .4byte 0xFFFFFEC0
_0201097C: .4byte gPlayer
_02010980: .4byte sub_02010984

	thumb_func_start sub_02010984
sub_02010984: @ 0x02010984
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl Player_AirInputControls
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020109BE
	adds r2, r1, #0
_020109BE:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _020109E0
	adds r1, #2
	cmp r1, #0
	ble _020109EC
	b _020109EA
_020109E0:
	cmp r1, #0
	ble _020109EC
	subs r1, #2
	cmp r1, #0
	bge _020109EC
_020109EA:
	movs r1, #0
_020109EC:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _02010A00
	cmp r2, #0
	beq _02010A0C
_02010A00:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_02010A0C:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010A44
	cmp r0, #1
	bgt _02010A2A
	cmp r0, #0
	beq _02010A34
	b _02010A52
_02010A2A:
	cmp r0, #2
	beq _02010A3C
	cmp r0, #3
	beq _02010A4C
	b _02010A52
_02010A34:
	adds r0, r4, #0
	bl sub_8021C4C
	b _02010A52
_02010A3C:
	adds r0, r4, #0
	bl sub_8021DB8
	b _02010A52
_02010A44:
	adds r0, r4, #0
	bl sub_8021EE4
	b _02010A52
_02010A4C:
	adds r0, r4, #0
	bl sub_802203C
_02010A52:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010A6A
	ldr r1, _02010A70 @ =gPlayer
	ldr r0, _02010A74 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_02010A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010A70: .4byte gPlayer
_02010A74: .4byte Player_TouchGround

	thumb_func_start Player_InitRampOrDashRing
Player_InitRampOrDashRing: @ 0x02010A78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _02010B04 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _02010B08 @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	adds r1, #2
	ldr r0, _02010B0C @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _02010ADC
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_02010ADC:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, _02010B10 @ =0xFFFFFEC0
	cmp r1, r0
	bge _02010AEE
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_02010AEE:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #5
	bls _02010AFA
	b _02010C0C
_02010AFA:
	lsls r0, r0, #2
	ldr r1, _02010B14 @ =_02010B18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010B04: .4byte 0xCEF118CF
_02010B08: .4byte 0xFEFFFFD7
_02010B0C: .4byte 0x0000FFFF
_02010B10: .4byte 0xFFFFFEC0
_02010B14: .4byte _02010B18
_02010B18: @ jump table
	.4byte _02010B30 @ case 0
	.4byte _02010B6C @ case 1
	.4byte _02010B6C @ case 2
	.4byte _02010BA8 @ case 3
	.4byte _02010BD4 @ case 4
	.4byte _02010BD4 @ case 5
_02010B30:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010B3E
	adds r0, #7
_02010B3E:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010B4A
	rsbs r0, r0, #0
_02010B4A:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010B68 @ =0xFFFFFC40
	b _02010C08
	.align 2, 0
_02010B68: .4byte 0xFFFFFC40
_02010B6C:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010B7A
	adds r0, #7
_02010B7A:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010B86
	rsbs r0, r0, #0
_02010B86:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010BA4 @ =0xFFFFF880
	b _02010C08
	.align 2, 0
_02010BA4: .4byte 0xFFFFF880
_02010BA8:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010BB6
	adds r0, #7
_02010BB6:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010BC2
	rsbs r0, r0, #0
_02010BC2:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #3
	b _02010BFE
_02010BD4:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010BE2
	adds r0, #7
_02010BE2:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010BEE
	rsbs r0, r0, #0
_02010BEE:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #4
_02010BFE:
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010C34 @ =0xFFFFFD80
_02010C08:
	adds r0, r0, r1
	strh r0, [r4, #0x12]
_02010C0C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010C1C
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_02010C1C:
	movs r0, #0x19
	bl m4aSongNumStart
	ldr r0, _02010C38 @ =gPlayer
	ldr r1, _02010C3C @ =sub_02010C40
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010C34: .4byte 0xFFFFFD80
_02010C38: .4byte gPlayer
_02010C3C: .4byte sub_02010C40

	thumb_func_start sub_02010C40
sub_02010C40: @ 0x02010C40
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x28
	bne _02010C64
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _02010C64
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _02010C64
	movs r0, #1
	strh r0, [r1]
_02010C64:
	adds r0, r4, #0
	bl sub_8023708
	adds r0, r4, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r6, #0x10
	ldrsh r2, [r4, r6]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _02010C90
	adds r2, r1, #0
_02010C90:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _02010CB2
	adds r1, #2
	cmp r1, #0
	ble _02010CBE
	b _02010CBC
_02010CB2:
	cmp r1, #0
	ble _02010CBE
	subs r1, #2
	cmp r1, #0
	bge _02010CBE
_02010CBC:
	movs r1, #0
_02010CBE:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _02010CD2
	cmp r2, #0
	beq _02010CDE
_02010CD2:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_02010CDE:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010D16
	cmp r0, #1
	bgt _02010CFC
	cmp r0, #0
	beq _02010D06
	b _02010D24
_02010CFC:
	cmp r0, #2
	beq _02010D0E
	cmp r0, #3
	beq _02010D1E
	b _02010D24
_02010D06:
	adds r0, r4, #0
	bl sub_8021C4C
	b _02010D24
_02010D0E:
	adds r0, r4, #0
	bl sub_8021DB8
	b _02010D24
_02010D16:
	adds r0, r4, #0
	bl sub_8021EE4
	b _02010D24
_02010D1E:
	adds r0, r4, #0
	bl sub_802203C
_02010D24:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010D3C
	ldr r1, _02010D44 @ =gPlayer
	ldr r0, _02010D48 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_02010D3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010D44: .4byte gPlayer
_02010D48: .4byte Player_TouchGround

	thumb_func_start Player_TryInitSpindash
Player_TryInitSpindash: @ 0x02010D4C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r2, r5, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #2
	bne _02010DC8
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _02010DB4 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02010DC8
	ldr r4, _02010DB8 @ =gPlayer
	ldr r0, _02010DBC @ =sub_020118F8
	str r0, [r4]
	movs r0, #3
	strh r0, [r2]
	ldr r0, [r5, #0x20]
	ldr r1, _02010DC0 @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x26]
	strh r6, [r5, #0x10]
	strh r6, [r5, #0x12]
	strh r6, [r5, #0x14]
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r1, _02010DC4 @ =sub_0200FD90
	str r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
	movs r0, #1
	b _02010DCA
	.align 2, 0
_02010DB4: .4byte gPlayerControls
_02010DB8: .4byte gPlayer
_02010DBC: .4byte sub_020118F8
_02010DC0: .4byte 0x00000404
_02010DC4: .4byte sub_0200FD90
_02010DC8:
	movs r0, #0
_02010DCA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Player_HandleGroundMovement
Player_HandleGroundMovement: @ 0x02010DD0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0xff
	ldr r5, [r4, #0x48]
	ldr r7, [r4, #0x4c]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _02010DE4
	b _02010F80
_02010DE4:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _02010DF4
	b _02010F80
_02010DF4:
	ldrh r3, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov ip, r3
	cmp r1, #0
	ble _02010E8A
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _02010E36
	adds r0, r1, #0
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bge _02010E20
	adds r0, r3, r5
	strh r0, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, r1
	ble _02010E2A
	strh r1, [r4, #0x14]
	b _02010E2A
_02010E20:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_02010E2A:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _02010FBA
_02010E36:
	ldr r0, _02010E54 @ =0x000001FF
	cmp r1, r0
	ble _02010E6C
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r0, r2, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #1
	bhi _02010E58
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _02010E66
	.align 2, 0
_02010E54: .4byte 0x000001FF
_02010E58:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _02010E66
	movs r6, #8
_02010E66:
	mov r1, ip
	subs r0, r1, r7
	b _02010EFA
_02010E6C:
	subs r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, #0
	bgt _02010E7C
	b _02010FBE
_02010E7C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010E88
	b _02010FBE
_02010E88:
	b _02010F1C
_02010E8A:
	cmp r1, #0
	bge _02010F3C
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _02010EC6
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0x44]
	rsbs r2, r0, #0
	cmp r1, r2
	ble _02010EB2
	subs r0, r3, r5
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _02010EBC
	strh r2, [r4, #0x14]
	b _02010EBC
_02010EB2:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_02010EBC:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _02010FBA
_02010EC6:
	ldr r0, _02010EE4 @ =0xFFFFFE00
	cmp r1, r0
	bgt _02010F04
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r0, r2, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #1
	bhi _02010EE8
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _02010EF6
	.align 2, 0
_02010EE4: .4byte 0xFFFFFE00
_02010EE8:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _02010EF6
	movs r6, #8
_02010EF6:
	mov r2, ip
	adds r0, r2, r7
_02010EFA:
	strh r0, [r4, #0x14]
	movs r0, #0xd
	bl m4aSongNumStart
	b _02010FBE
_02010F04:
	adds r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, #0
	bge _02010FBE
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010FBE
_02010F1C:
	ldrh r0, [r5]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02010F2A
	movs r6, #7
_02010F2A:
	ldr r1, _02010F34 @ =gPlayer
	ldr r0, _02010F38 @ =sub_020119F4
	str r0, [r1]
	b _02010FBE
	.align 2, 0
_02010F34: .4byte gPlayer
_02010F38: .4byte sub_020119F4
_02010F3C:
	ldr r1, [r4, #0x20]
	movs r0, #1
	ands r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	cmp r1, r0
	beq _02010F6E
	cmp r1, #0
	beq _02010F56
	subs r0, r3, r5
	b _02010F58
_02010F56:
	adds r0, r3, r5
_02010F58:
	strh r0, [r4, #0x14]
	movs r6, #9
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _02010FBA
_02010F6E:
	ldr r1, _02010F78 @ =gPlayer
	ldr r0, _02010F7C @ =sub_020119F4
	str r0, [r1]
	b _02010FBA
	.align 2, 0
_02010F78: .4byte gPlayer
_02010F7C: .4byte sub_020119F4
_02010F80:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _02010F9E
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bgt _02010F98
	movs r1, #0
	movs r6, #0
	b _02010F9A
_02010F98:
	movs r6, #9
_02010F9A:
	strh r1, [r4, #0x14]
	b _02010FBA
_02010F9E:
	cmp r0, #0
	bge _02010FB8
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	blt _02010FB2
	movs r1, #0
	movs r6, #0
	b _02010FB4
_02010FB2:
	movs r6, #9
_02010FB4:
	strh r1, [r4, #0x14]
	b _02010FBA
_02010FB8:
	movs r6, #0
_02010FBA:
	adds r5, r4, #0
	adds r5, #0x64
_02010FBE:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _02010FD6
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r1
	beq _02010FE6
	strh r1, [r5]
	b _02010FE6
_02010FD6:
	ldrh r0, [r5]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02010FE6
	movs r0, #9
	strh r0, [r5]
_02010FE6:
	adds r0, r4, #0
	bl sub_8023128
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Player_HandleBoostThreshold
Player_HandleBoostThreshold: @ 0x02010FF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _02011008 @ =gRingCount
	ldrh r0, [r0]
	cmp r0, #0x95
	bls _0201100C
	adds r1, #0x52
	movs r0, #4
	b _0201102E
	.align 2, 0
_02011008: .4byte gRingCount
_0201100C:
	cmp r0, #0x63
	bls _02011016
	adds r1, #0x52
	movs r0, #3
	b _0201102E
_02011016:
	cmp r0, #0x31
	bls _02011020
	adds r1, #0x52
	movs r0, #2
	b _0201102E
_02011020:
	cmp r0, #0xa
	bls _0201102A
	adds r1, #0x52
	movs r0, #1
	b _0201102E
_0201102A:
	adds r1, #0x52
	movs r0, #0
_0201102E:
	strh r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start Player_HandleBoostState
Player_HandleBoostState: @ 0x02011034
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x5a
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	cmp r2, #0
	beq _02011084
	ldr r4, [r3, #0x20]
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	bne _020110DA
	ldr r0, _0201107C @ =gUnknown_02015E32
	adds r1, r3, #0
	adds r1, #0x52
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0x14
	ldrsh r2, [r3, r0]
	cmp r2, #0
	bge _0201106C
	rsbs r2, r2, #0
_0201106C:
	ldr r0, _02011080 @ =0x0000047F
	cmp r2, r0
	bgt _020110DA
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	strh r4, [r1]
	b _020110DA
	.align 2, 0
_0201107C: .4byte gUnknown_02015E32
_02011080: .4byte 0x0000047F
_02011084:
	ldr r0, [r3, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020110D4
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _02011098
	rsbs r1, r1, #0
_02011098:
	ldr r0, [r3, #0x44]
	cmp r1, r0
	blt _020110D4
	adds r2, r3, #0
	adds r2, #0x58
	ldr r1, _020110CC @ =gUnknown_02015E32
	adds r0, r3, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _020110DA
	movs r0, #1
	mov r3, ip
	strb r0, [r3]
	ldr r1, _020110D0 @ =gCamera
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	b _020110DA
	.align 2, 0
_020110CC: .4byte gUnknown_02015E32
_020110D0: .4byte gCamera
_020110D4:
	adds r0, r3, #0
	adds r0, #0x58
	strh r2, [r0]
_020110DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Player_HandleWalkAnim
Player_HandleWalkAnim: @ 0x020110E0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _020110EE
	rsbs r2, r2, #0
_020110EE:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	bgt _020110FC
	adds r1, #0x54
	movs r0, #0
	b _02011138
_020110FC:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r2, r0
	bgt _0201110A
	adds r1, #0x54
	movs r0, #1
	b _02011138
_0201110A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _02011118
	adds r1, #0x54
	movs r0, #2
	b _02011138
_02011118:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	bgt _02011126
	adds r1, #0x54
	movs r0, #3
	b _02011138
_02011126:
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _02011134
	adds r1, #0x54
	movs r0, #4
	b _02011138
_02011134:
	adds r1, #0x54
	movs r0, #5
_02011138:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011140
sub_02011140: @ 0x02011140
	push {lr}
	bl sub_02011704
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CreatePlayer
CreatePlayer: @ 0x0201114C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r2, #0
	adds r0, r5, #0
	adds r0, #0x60
	movs r6, #0
	ldrsb r6, [r0, r6]
	ldr r0, _020111B0 @ =Task_PlayerMain
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _020111B4 @ =TaskDestructor_Player
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r4, #0
	strb r6, [r0]
	str r4, [r0, #4]
	adds r0, r5, #0
	bl InitializePlayer
	ldr r1, _020111B8 @ =gPlayer
	ldr r0, _020111BC @ =Player_TouchGround
	str r0, [r1]
	bl sub_02011B44
	ldr r0, _020111C0 @ =gUnknown_03005448
	str r4, [r0]
	ldr r0, _020111C4 @ =gUnknown_030054FC
	str r4, [r0]
	ldr r0, _020111C8 @ =gUnknown_030054E0
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r5, #0
	bl AllocateCharacterStageGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020111B0: .4byte Task_PlayerMain
_020111B4: .4byte TaskDestructor_Player
_020111B8: .4byte gPlayer
_020111BC: .4byte Player_TouchGround
_020111C0: .4byte gUnknown_03005448
_020111C4: .4byte gUnknown_030054FC
_020111C8: .4byte gUnknown_030054E0

	thumb_func_start sub_020111CC
sub_020111CC: @ 0x020111CC
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
	bne _020111EC
	bl sub_02012248
_020111EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020111F4
sub_020111F4: @ 0x020111F4
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	ldr r1, _02011218 @ =0xCEF118CF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_02011218: .4byte 0xCEF118CF

	thumb_func_start sub_0201121C
sub_0201121C: @ 0x0201121C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bne _02011232
	cmp r2, #0
	beq _0201123E
_02011232:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0201123E:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02011276
	cmp r0, #1
	bgt _0201125C
	cmp r0, #0
	beq _02011266
	b _02011284
_0201125C:
	cmp r0, #2
	beq _0201126E
	cmp r0, #3
	beq _0201127E
	b _02011284
_02011266:
	adds r0, r4, #0
	bl sub_8021C4C
	b _02011284
_0201126E:
	adds r0, r4, #0
	bl sub_8021DB8
	b _02011284
_02011276:
	adds r0, r4, #0
	bl sub_8021EE4
	b _02011284
_0201127E:
	adds r0, r4, #0
	bl sub_802203C
_02011284:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201128C
sub_0201128C: @ 0x0201128C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _02011298
	mov r4, sp
_02011298:
	cmp r2, #0
	bne _0201129E
	add r2, sp, #4
_0201129E:
	adds r1, r4, #0
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _020112B4
	movs r0, #0
	b _020112C6
_020112B4:
	ldr r0, _020112D4 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020112C8
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_020112C6:
	strb r0, [r4]
_020112C8:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020112D4: .4byte gStageFlags

	thumb_func_start sub_020112D8
sub_020112D8: @ 0x020112D8
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _020112E4
	mov r4, sp
_020112E4:
	cmp r2, #0
	bne _020112EA
	add r2, sp, #4
_020112EA:
	adds r1, r4, #0
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _02011300
	movs r0, #0
	b _02011312
_02011300:
	ldr r0, _02011320 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02011314
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_02011312:
	strb r0, [r4]
_02011314:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02011320: .4byte gStageFlags

	thumb_func_start sub_8029AC0
sub_8029AC0: @ 0x02011324
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _02011330
	mov r4, sp
_02011330:
	cmp r2, #0
	bne _02011336
	add r2, sp, #4
_02011336:
	adds r1, r4, #0
	bl sub_8021B08
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0201134C
	movs r0, #0
	b _0201135E
_0201134C:
	ldr r0, _0201136C @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02011360
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_0201135E:
	strb r0, [r4]
_02011360:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0201136C: .4byte gStageFlags

	thumb_func_start sub_8029B0C
sub_8029B0C: @ 0x02011370
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _0201137C
	mov r4, sp
_0201137C:
	cmp r2, #0
	bne _02011382
	add r2, sp, #4
_02011382:
	adds r1, r4, #0
	bl sub_8029BB8
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _02011398
	movs r0, #0
	b _020113AA
_02011398:
	ldr r0, _020113B8 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020113AC
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_020113AA:
	strb r0, [r4]
_020113AC:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020113B8: .4byte gStageFlags

	thumb_func_start sub_020113BC
sub_020113BC: @ 0x020113BC
	push {lr}
	bl sub_8029AC0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020113C8
sub_020113C8: @ 0x020113C8
	push {lr}
	bl sub_8029B0C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029BB8
sub_8029BB8: @ 0x020113D4
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
	bne _020113EC
	add r6, sp, #8
_020113EC:
	cmp r7, #0
	bne _020113F2
	add r7, sp, #0xc
_020113F2:
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
	bge _0201141C
	movs r0, #0x80
	orrs r2, r0
_0201141C:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _02011480 @ =sub_801EE64
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
	bge _0201145C
	movs r0, #0x80
	orrs r2, r0
_0201145C:
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
	bge _02011484
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0201148C
	.align 2, 0
_02011480: .4byte sub_801EE64
_02011484:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0201148C:
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

	thumb_func_start sub_020114A0
sub_020114A0: @ 0x020114A0
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _020114D4
	ldr r1, _020114DC @ =gSineTable
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
	beq _020114D4
	adds r0, r1, r2
	strh r0, [r3, #0x14]
_020114D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020114DC: .4byte gSineTable

	thumb_func_start sub_020114E0
sub_020114E0: @ 0x020114E0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _0201150C
	ldr r1, _02011510 @ =gSineTable
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
_0201150C:
	pop {r0}
	bx r0
	.align 2, 0
_02011510: .4byte gSineTable

	thumb_func_start sub_02011514
sub_02011514: @ 0x02011514
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
	bgt _0201155E
	cmp r2, #0
	beq _0201155E
	ldr r1, _02011550 @ =gSineTable
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
	ble _02011554
	cmp r1, #0
	bgt _0201155A
	b _02011558
	.align 2, 0
_02011550: .4byte gSineTable
_02011554:
	cmp r1, #0
	blt _0201155A
_02011558:
	asrs r1, r0, #0xa
_0201155A:
	adds r2, r2, r1
	strh r2, [r4, #0x14]
_0201155E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_02011564
sub_02011564: @ 0x02011564
	push {lr}
	adds r2, r0, #0
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	ldr r1, [r2, #8]
	adds r1, r1, r0
	str r1, [r2, #8]
	ldrh r3, [r2, #0x12]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _02011582
	adds r3, r1, #0
_02011582:
	strh r3, [r2, #0x12]
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011594
sub_02011594: @ 0x02011594
	ldrh r1, [r0, #0x12]
	adds r1, #0x2a
	strh r1, [r0, #0x12]
	bx lr

	thumb_func_start sub_0201159C
sub_0201159C: @ 0x0201159C
	push {lr}
	ldr r2, _020115B8 @ =gCamera
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _020115B2
	ldr r0, [r2, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	cmp r1, r0
	bge _020115BC
_020115B2:
	movs r0, #0
	b _020115BE
	.align 2, 0
_020115B8: .4byte gCamera
_020115BC:
	movs r0, #1
_020115BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020115C4
sub_020115C4: @ 0x020115C4
	push {lr}
	ldr r2, _020115E0 @ =gCamera
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _020115DC
	ldr r0, [r2, #4]
	lsls r0, r0, #8
	ldr r2, _020115E4 @ =0x0000EFFF
	adds r0, r0, r2
	cmp r1, r0
	bge _020115E8
_020115DC:
	movs r0, #0
	b _020115EA
	.align 2, 0
_020115E0: .4byte gCamera
_020115E4: .4byte 0x0000EFFF
_020115E8:
	movs r0, #1
_020115EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Player_TryJump
Player_TryJump: @ 0x020115F0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _02011624 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02011630
	adds r0, r3, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	bl sub_8022F58
	cmp r0, #3
	ble _02011630
	ldr r1, _02011628 @ =gPlayer
	ldr r0, _0201162C @ =Player_InitJump
	str r0, [r1]
	movs r0, #1
	b _02011632
	.align 2, 0
_02011624: .4byte gPlayerControls
_02011628: .4byte gPlayer
_0201162C: .4byte Player_InitJump
_02011630:
	movs r0, #0
_02011632:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011638
sub_02011638: @ 0x02011638
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _0201164A
	subs r0, #1
	b _02011676
_0201164A:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _02011678
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _02011664
	rsbs r1, r1, #0
_02011664:
	ldr r0, _0201167C @ =0x000001DF
	cmp r1, r0
	bgt _02011678
	strh r3, [r2, #0x14]
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1e
_02011676:
	strh r0, [r2, #0x2a]
_02011678:
	pop {r0}
	bx r0
	.align 2, 0
_0201167C: .4byte 0x000001DF

	thumb_func_start sub_02011680
sub_02011680: @ 0x02011680
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _02011696
	adds r1, #2
	cmp r1, #0
	ble _020116A2
	b _020116A0
_02011696:
	cmp r1, #0
	ble _020116A2
	subs r1, #2
	cmp r1, #0
	bge _020116A2
_020116A0:
	movs r1, #0
_020116A2:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	pop {r0}
	bx r0

	thumb_func_start sub_020116AC
sub_020116AC: @ 0x020116AC
	ldr r0, _020116BC @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0x17
	orrs r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020116BC: .4byte gPlayer

	thumb_func_start sub_020116C0
sub_020116C0: @ 0x020116C0
	ldr r0, _020116CC @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _020116D0 @ =0xBFFFFFFF
	ands r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020116CC: .4byte gPlayer
_020116D0: .4byte 0xBFFFFFFF

	thumb_func_start TaskDestructor_Player
TaskDestructor_Player: @ 0x020116D4
	push {lr}
	ldr r2, _02011700 @ =gPlayer
	adds r1, r2, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _020116FA
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_020116FA:
	pop {r0}
	bx r0
	.align 2, 0
_02011700: .4byte gPlayer

	thumb_func_start sub_02011704
sub_02011704: @ 0x02011704
	mov ip, r3
	mov r1, ip
	adds r1, #0x60
	movs r3, #0
	strb r2, [r1]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _02011750 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x74
	movs r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb1
	strh r0, [r1]
	subs r0, #0xb2
	mov r1, ip
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	mov r0, ip
	adds r0, #0x98
	strb r2, [r0]
	str r3, [r1, #0x78]
	adds r1, #0x90
	ldr r0, _02011754 @ =gUnknown_03005780
	str r0, [r1]
	bx lr
	.align 2, 0
_02011750: .4byte 0x04000128
_02011754: .4byte gUnknown_03005780

	thumb_func_start Player_TryTaunt
Player_TryTaunt: @ 0x02011758
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _02011784
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02011784
	ldr r1, _0201177C @ =gPlayer
	ldr r0, _02011780 @ =sub_02011A50
	str r0, [r1]
	movs r0, #1
	b _02011786
	.align 2, 0
_0201177C: .4byte gPlayer
_02011780: .4byte sub_02011A50
_02011784:
	movs r0, #0
_02011786:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Player_TryCrouchOrSpinAttack
Player_TryCrouchOrSpinAttack: @ 0x0201178C
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0201180C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _020117D8
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _020117D8
	ldr r0, [r2, #0x20]
	ldr r1, _020117CC @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _020117D8
	ldr r1, _020117D0 @ =gPlayer
	ldr r0, _020117D4 @ =sub_020118C8
	str r0, [r1]
	movs r0, #1
	b _0201180E
	.align 2, 0
_020117CC: .4byte 0x01000006
_020117D0: .4byte gPlayer
_020117D4: .4byte sub_020118C8
_020117D8:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0201180C
	ldr r0, [r2, #0x20]
	ldr r1, _02011800 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0201180C
	ldr r1, _02011804 @ =gPlayer
	ldr r0, _02011808 @ =Player_SpinAttack
	str r0, [r1]
	movs r0, #0xb
	bl m4aSongNumStart
	movs r0, #1
	b _0201180E
	.align 2, 0
_02011800: .4byte 0x01000006
_02011804: .4byte gPlayer
_02011808: .4byte Player_SpinAttack
_0201180C:
	movs r0, #0
_0201180E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Player_ApplyBoostPhysics
Player_ApplyBoostPhysics: @ 0x02011814
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _02011830
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _02011850
_02011830:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _02011846
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _02011850
_02011846:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_02011850:
	str r0, [r3, #0x40]
	ldr r1, _02011870 @ =gUnknown_02015E1E
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
_02011870: .4byte gUnknown_02015E1E

	thumb_func_start Player_SpinAttack
Player_SpinAttack: @ 0x02011874
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _020118BC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x64
	movs r6, #0
	movs r5, #4
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x99
	strb r6, [r0]
	ldr r0, _020118C0 @ =gPlayer
	ldr r1, _020118C4 @ =Player_Rolling
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020118BC: .4byte 0xFFFFBFFF
_020118C0: .4byte gPlayer
_020118C4: .4byte Player_Rolling

	thumb_func_start sub_020118C8
sub_020118C8: @ 0x020118C8
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
	ldr r1, _020118F0 @ =gPlayer
	ldr r2, _020118F4 @ =Player_Crouch
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_020118F0: .4byte gPlayer
_020118F4: .4byte Player_Crouch

	thumb_func_start sub_020118F8
sub_020118F8: @ 0x020118F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _02011944 @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r0, _02011948 @ =gPlayer
	ldr r1, _0201194C @ =sub_0200FD90
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011944: .4byte 0x00000404
_02011948: .4byte gPlayer
_0201194C: .4byte sub_0200FD90

	thumb_func_start sub_02011950
sub_02011950: @ 0x02011950
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r2, sp, #4
	mov r1, sp
	bl sub_8029B0C
	cmp r0, #0
	bgt _02011982
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_02011982:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201198C
sub_0201198C: @ 0x0201198C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _020119AC
	ldr r1, _020119B0 @ =gPlayer
	ldr r0, _020119B4 @ =Player_TouchGround
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_020119AC:
	pop {r0}
	bx r0
	.align 2, 0
_020119B0: .4byte gPlayer
_020119B4: .4byte Player_TouchGround

	thumb_func_start sub_020119B8
sub_020119B8: @ 0x020119B8
	push {r4, lr}
	adds r1, r0, #0
	movs r3, #0x2a
	ldrh r2, [r1, #0x12]
	movs r4, #0x12
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bge _020119CA
	movs r3, #0x15
_020119CA:
	adds r0, r2, r3
	strh r0, [r1, #0x12]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_020119D4
sub_020119D4: @ 0x020119D4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _020119F0
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _020119F0
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_020119F0:
	pop {r0}
	bx r0

	thumb_func_start sub_020119F4
sub_020119F4: @ 0x020119F4
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
	bhi _02011A16
	movs r0, #6
	b _02011A18
_02011A16:
	movs r0, #5
_02011A18:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _02011A44 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _02011A48 @ =gPlayer
	ldr r1, _02011A4C @ =Player_8025548
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02011A44: .4byte 0xFFFFBFFF
_02011A48: .4byte gPlayer
_02011A4C: .4byte Player_8025548

	thumb_func_start sub_02011A50
sub_02011A50: @ 0x02011A50
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
	ldr r2, _02011A84 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _02011A88 @ =gPlayer
	ldr r2, _02011A8C @ =Player_Taunt
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_02011A84: .4byte 0xFFFFBFFF
_02011A88: .4byte gPlayer
_02011A8C: .4byte Player_Taunt

	thumb_func_start sub_02011A90
sub_02011A90: @ 0x02011A90
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02011AEA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _02011ACC
	cmp r1, #0x20
	bne _02011AEA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _02011AC0
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _02011AEA
_02011AC0:
	subs r0, #0x18
	cmp r0, #0
	bge _02011AE8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _02011AE8
_02011ACC:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _02011AE0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _02011AEA
_02011AE0:
	adds r0, #0x18
	cmp r0, #0
	ble _02011AE8
	movs r0, #0x60
_02011AE8:
	strh r0, [r2, #0x14]
_02011AEA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011AF0
sub_02011AF0: @ 0x02011AF0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02011B38 @ =0xFFFFCFFF
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
	ldr r2, _02011B3C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02011B40 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_02011B38: .4byte 0xFFFFCFFF
_02011B3C: .4byte gPlayer
_02011B40: .4byte 0xBFFFFFFF

	thumb_func_start sub_02011B44
sub_02011B44: @ 0x02011B44
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _02011BD8 @ =gUnknown_030057C4
	ldr r0, _02011BDC @ =sub_02012260
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _02011BE0 @ =0x00002001
	ldr r3, _02011BE4 @ =sub_0201226C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _02011BE8 @ =0x06012E40
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	movs r0, #0x6a
	strh r0, [r1, #0xa]
	ldr r2, _02011BEC @ =gUnknown_03000020
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _02011BF0 @ =gUnknown_03000021
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _02011BF4 @ =gUnknown_03000022
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _02011BF8 @ =gUnknown_03000025
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _02011BFC @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _02011C00 @ =gUnknown_030002B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _02011C04 @ =gUnknown_030002B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _02011C08 @ =gUnknown_030002B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _02011C0C @ =gUnknown_03000030
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _02011C10 @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _02011C14 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011BD8: .4byte gUnknown_030057C4
_02011BDC: .4byte sub_02012260
_02011BE0: .4byte 0x00002001
_02011BE4: .4byte sub_0201226C
_02011BE8: .4byte 0x06012E40
_02011BEC: .4byte gUnknown_03000020
_02011BF0: .4byte gUnknown_03000021
_02011BF4: .4byte gUnknown_03000022
_02011BF8: .4byte gUnknown_03000025
_02011BFC: .4byte 0x00042200
_02011C00: .4byte gUnknown_030002B6
_02011C04: .4byte gUnknown_030002B4
_02011C08: .4byte gUnknown_030002B0
_02011C0C: .4byte gUnknown_03000030
_02011C10: .4byte 0x040000D4
_02011C14: .4byte 0x81000140

	thumb_func_start InitScatteringRings
InitScatteringRings: @ 0x02011C18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _02011C9C @ =gUnknown_030057C4
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _02011CA0 @ =gUnknown_03000030
	adds r4, r0, r1
	ldr r6, _02011CA4 @ =gPlayer
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	beq _02011D2E
	cmp r7, #0x20
	ble _02011C46
	movs r7, #0x20
_02011C46:
	ldr r0, _02011CA8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _02011C54
	cmp r7, #0x10
	ble _02011C54
	movs r7, #0x10
_02011C54:
	movs r0, #0x10
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _02011CAC @ =gSineTable
	mov sl, r1
	ldr r0, _02011CB0 @ =gPseudoRandom
	mov sb, r0
_02011C6C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _02011D22
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _02011CE4
	asrs r2, r3, #8
	cmp r2, #5
	ble _02011CB4
	rsbs r0, r2, #0
	adds r0, #9
	b _02011CB6
	.align 2, 0
_02011C9C: .4byte gUnknown_030057C4
_02011CA0: .4byte gUnknown_03000030
_02011CA4: .4byte gPlayer
_02011CA8: .4byte gGameMode
_02011CAC: .4byte gSineTable
_02011CB0: .4byte gPseudoRandom
_02011CB4:
	adds r0, r2, #0
_02011CB6:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r0, #0x80
	orrs r3, r0
_02011CE4:
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	movs r1, #0
	strh r1, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _02011D40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02011D44 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _02011D0E
	movs r0, #4
	strh r0, [r4, #0x10]
_02011D0E:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _02011D2E
_02011D22:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _02011C6C
_02011D2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02011D40: .4byte 0x00196225
_02011D44: .4byte 0x3C6EF35F

	thumb_func_start sub_02011D48
sub_02011D48: @ 0x02011D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _02011D98 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _02011D9C @ =gUnknown_03000030
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _02011DA0 @ =gUnknown_030002B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _02011DA4 @ =gUnknown_030002B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x18]
_02011D88:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _02011DA8
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011D98: .4byte gCurTask
_02011D9C: .4byte gUnknown_03000030
_02011DA0: .4byte gUnknown_030002B0
_02011DA4: .4byte gUnknown_030002B4
_02011DA8:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _02011DD6
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _02012216
_02011DD6:
	ldr r0, _02011DF4 @ =0x0000EFFF
	cmp r2, r0
	bgt _02011DFC
	ldr r0, _02011DF8 @ =0x00011FFF
	cmp r3, r0
	bgt _02011DFC
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _02011E1A
	.align 2, 0
_02011DF4: .4byte 0x0000EFFF
_02011DF8: .4byte 0x00011FFF
_02011DFC:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _02011E1C
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02011E1C
	ldr r3, _02011F40 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _02011F44 @ =0xFFFCA000
	adds r0, r1, r4
_02011E1A:
	str r0, [r5, #4]
_02011E1C:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r7, r0, #8
	ldr r1, _02011F48 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov r8, r0
	ldr r3, _02011F4C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	ble _02011E58
	b _0201205E
_02011E58:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _02011E6E
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _02011F60
_02011E6E:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02011F60
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011E9C
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _02011EA8
	cmp r2, r1
	blt _02011F60
_02011E9C:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011EA8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011EC4
	cmp r7, r1
	bge _02011ED0
	cmp r2, r1
	blt _02011F60
_02011EC4:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011ED0:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _02011F50 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _02011F54 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02011F1C
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _02011F1C
	ldr r0, _02011F58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _02011F1C
	ldr r1, _02011F5C @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _02011F1C
	adds r0, #1
	strb r0, [r1]
_02011F1C:
	ldr r0, _02011F58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02011F30
	ldr r1, _02011F50 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _02011F30
	movs r0, #0xff
	strh r0, [r1]
_02011F30:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011F40: .4byte 0xFFFA6000
_02011F44: .4byte 0xFFFCA000
_02011F48: .4byte gCamera
_02011F4C: .4byte gPlayer
_02011F50: .4byte gRingCount
_02011F54: .4byte gCurrentLevel
_02011F58: .4byte gGameMode
_02011F5C: .4byte gNumLives
_02011F60:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	bgt _0201205E
	movs r2, #0
	mov ip, r2
_02011F76:
	ldr r0, _02012034 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp ip, r0
	beq _02012050
	ldr r1, _02012038 @ =gMultiplayerPlayerTasks
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _02012050
	ldrh r2, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r6, r2, r4
	ldr r1, _0201203C @ =gUnknown_0300006A
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02011FB6
	ldr r3, _02012040 @ =gUnknown_03000054
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _02012050
_02011FB6:
	mov r4, sb
	subs r4, #8
	ldr r1, _02012044 @ =gUnknown_03000050
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _02012048 @ =gUnknown_0300002C
	adds r0, r2, r3
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r1, r1, r3
	cmp r4, r1
	bgt _02011FDC
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _02011FEC
	cmp r4, r1
	blt _02012050
_02011FDC:
	ldr r0, _0201204C @ =gUnknown_0300002E
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r4
	blt _02012050
_02011FEC:
	adds r3, r7, #0
	subs r3, #0x10
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _0201200E
	cmp r7, r1
	bge _02012020
	cmp r3, r1
	blt _02012050
_0201200E:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _02012050
_02012020:
	mov r2, sb
	lsls r0, r2, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _02012212
	.align 2, 0
_02012034: .4byte 0x04000128
_02012038: .4byte gMultiplayerPlayerTasks
_0201203C: .4byte gUnknown_0300006A
_02012040: .4byte gUnknown_03000054
_02012044: .4byte gUnknown_03000050
_02012048: .4byte gUnknown_0300002C
_0201204C: .4byte gUnknown_0300002E
_02012050:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #3
	bls _02011F76
_0201205E:
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _02012098
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _02012098
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _02012118 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _02012098
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_02012098:
	ldr r1, [sp, #4]
	ldr r2, _0201211C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _020120E6
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bge _020120E6
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _020120E6
	adds r0, r7, #0
	subs r0, #0x10
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r1, _02012118 @ =sub_801EC3C
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _020120E6
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_020120E6:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _02012104
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _02012104
	mov r2, r8
	cmp r2, #0xa7
	ble _02012134
_02012104:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02012128
	ldr r3, _02012120 @ =0xFFFFFA60
	add sl, r3
	ldr r4, _02012124 @ =0xFFFFFCA0
	add r8, r4
	b _02012134
	.align 2, 0
_02012118: .4byte sub_801EC3C
_0201211C: .4byte 0x000002B6
_02012120: .4byte 0xFFFFFA60
_02012124: .4byte 0xFFFFFCA0
_02012128:
	movs r0, #0xb4
	lsls r0, r0, #3
	add sl, r0
	movs r1, #0xd8
	lsls r1, r1, #2
	add r8, r1
_02012134:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _020121FA
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _020121FA
	mov r2, r8
	cmp r2, #0xa7
	bgt _020121FA
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _0201215C
	ldr r0, _02012188 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020121FA
_0201215C:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r3, [sp, #0x14]
	cmp r3, #0
	beq _0201216E
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0201218C
_0201216E:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sl
	ldr r4, [sp, #8]
	strh r0, [r4, #0x16]
	mov r1, r8
	strh r1, [r4, #0x18]
	ldr r0, [sp, #8]
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x14]
	b _020121FA
	.align 2, 0
_02012188: .4byte gStageTime
_0201218C:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _02012230 @ =gOamBuffer2
	adds r4, r0, r1
	ldr r3, [sp, #8]
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _02012234 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _020121FA
	ldr r1, _02012238 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0201223C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _02012240 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_020121FA:
	ldrh r1, [r5, #0x10]
	ldr r2, _02012244 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_02012212:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_02012216:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _02012220
	b _02011D88
_02012220:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012230: .4byte gOamBuffer2
_02012234: .4byte iwram_end
_02012238: .4byte 0x040000D4
_0201223C: .4byte 0x80000003
_02012240: .4byte 0x000001FF
_02012244: .4byte 0x0000FFFC

	thumb_func_start sub_02012248
sub_02012248: @ 0x02012248
	push {r4, lr}
	ldr r4, _0201225C @ =gUnknown_030057C4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0201225C: .4byte gUnknown_030057C4

	thumb_func_start sub_02012260
sub_02012260: @ 0x02012260
	push {lr}
	bl sub_02011D48
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201226C
sub_0201226C: @ 0x0201226C
	ldr r1, _02012274 @ =gUnknown_030057C4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012274: .4byte gUnknown_030057C4

	thumb_func_start sub_02012278
sub_02012278: @ 0x02012278
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _020122AC @ =gPlayerControls
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_02012292:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _020122C6
	cmp r1, #1
	bgt _020122B0
	cmp r1, #0
	beq _020122B6
	b _020122E2
	.align 2, 0
_020122AC: .4byte gPlayerControls
_020122B0:
	cmp r1, #2
	beq _020122D4
	b _020122E2
_020122B6:
	cmp r2, #2
	bne _020122BE
	strh r5, [r4]
	b _020122E2
_020122BE:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _020122E2
_020122C6:
	cmp r2, #2
	bne _020122CE
	strh r5, [r4, #2]
	b _020122E2
_020122CE:
	lsls r1, r2
	strh r1, [r4, #2]
	b _020122E2
_020122D4:
	cmp r2, #2
	bne _020122DC
	strh r5, [r4, #4]
	b _020122E2
_020122DC:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_020122E2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _02012292
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_020122F8
sub_020122F8: @ 0x020122F8
	ldr r3, _02012304 @ =gPlayerControls
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_02012304: .4byte gPlayerControls

	thumb_func_start CreateGameStage
CreateGameStage: @ 0x02012308
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _02012424 @ =Task_GameStage
	movs r2, #0xff
	lsls r2, r2, #8
	ldr r1, _02012428 @ =TaskDestructor_GameStage
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _0201242C @ =gUnknown_030057D0
	str r0, [r1]
	ldr r0, _02012430 @ =gActiveCollectRingEffectCount
	movs r4, #0
	strb r4, [r0]
	ldr r0, _02012434 @ =gSpecialRingCount
	strb r4, [r0]
	ldr r0, _02012438 @ =gUnknown_030054B0
	strb r4, [r0]
	ldr r5, _0201243C @ =gStageFlags
	ldrh r0, [r5]
	movs r1, #0x21
	orrs r0, r1
	ldr r1, _02012440 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r5]
	ldr r0, _02012444 @ =gUnknown_030053E4
	strb r4, [r0]
	ldr r1, _02012448 @ =gUnknown_030053E0_old
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _0201244C @ =gUnknown_03005530
	strb r4, [r0]
	bl sub_801F044
	ldr r0, _02012450 @ =gUnknown_030053E0
	strb r4, [r0]
	ldr r1, _02012454 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012372
	ldr r0, _02012458 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0201245C @ =gPlayer
	bl CreatePlayer
_02012372:
	movs r0, #0
	bl InitCamera
	bl StageInit_CollectRings
	bl CreateCollectRingsTimeDisplay
	ldr r2, _0201245C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02012460 @ =0xFF9FFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrh r0, [r5]
	ldr r2, _02012464 @ =0x0000FFFE
	ands r2, r0
	ldr r0, _02012468 @ =0x0000FFFD
	ands r2, r0
	subs r0, #2
	ands r2, r0
	strh r2, [r5]
	ldr r6, _0201246C @ =gGameMode
	ldrb r0, [r6]
	cmp r0, #5
	bne _020123AA
	movs r1, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_020123AA:
	bl CreateStageRingsManager
	bl CreateStageEntitiesManager
	ldr r0, _02012470 @ =gUnknown_03001944
	movs r4, #0
	strh r4, [r0]
	ldr r0, _02012474 @ =gUnknown_030017F0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _02012478 @ =gUnknown_03005394
	strh r1, [r0]
	ldr r0, _0201247C @ =gUnknown_03002A8C
	movs r2, #0x78
	strh r2, [r0]
	ldr r0, _02012480 @ =gUnknown_03004D58
	movs r1, #0x50
	strh r1, [r0]
	ldr r0, _02012484 @ =gUnknown_0300194C
	strh r2, [r0]
	ldr r0, _02012488 @ =gUnknown_03002820
	strh r1, [r0]
	ldr r1, _0201248C @ =gUnknown_03005398
	movs r0, #0x80
	strh r0, [r1]
	ldrb r0, [r6]
	cmp r0, #2
	bls _020124D6
	bl CreateMultiplayerReceiveEventMgr
	bl CreateMultiplayerSendEventMgr
	ldr r0, _02012490 @ =gRandomItemBox
	strb r4, [r0]
	movs r4, #0
_020123F4:
	ldr r0, _02012494 @ =gMultiplayerCharRings
	adds r0, r4, r0
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012498 @ =gMultiplayerConnections
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020124A4
	adds r0, r4, #0
	bl CreateMultiplayerPlayer
	ldr r0, _0201249C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _020124A0
	adds r0, r4, #0
	bl CreateOpponentPositionIndicator
	b _020124A4
	.align 2, 0
_02012424: .4byte Task_GameStage
_02012428: .4byte TaskDestructor_GameStage
_0201242C: .4byte gUnknown_030057D0
_02012430: .4byte gActiveCollectRingEffectCount
_02012434: .4byte gSpecialRingCount
_02012438: .4byte gUnknown_030054B0
_0201243C: .4byte gStageFlags
_02012440: .4byte 0x0000FF7F
_02012444: .4byte gUnknown_030053E4
_02012448: .4byte gUnknown_030053E0_old
_0201244C: .4byte gUnknown_03005530
_02012450: .4byte gUnknown_030053E0
_02012454: .4byte gCurrentLevel
_02012458: .4byte gSelectedCharacter
_0201245C: .4byte gPlayer
_02012460: .4byte 0xFF9FFFFF
_02012464: .4byte 0x0000FFFE
_02012468: .4byte 0x0000FFFD
_0201246C: .4byte gGameMode
_02012470: .4byte gUnknown_03001944
_02012474: .4byte gUnknown_030017F0
_02012478: .4byte gUnknown_03005394
_0201247C: .4byte gUnknown_03002A8C
_02012480: .4byte gUnknown_03004D58
_02012484: .4byte gUnknown_0300194C
_02012488: .4byte gUnknown_03002820
_0201248C: .4byte gUnknown_03005398
_02012490: .4byte gRandomItemBox
_02012494: .4byte gMultiplayerCharRings
_02012498: .4byte gMultiplayerConnections
_0201249C: .4byte 0x04000128
_020124A0:
	bl CreateSelfPositionIndicator
_020124A4:
	ldr r0, _020124E0 @ =gUnknown_030054B4
	adds r0, r4, r0
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, _020124E4 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #5
	bne _020124BA
	ldr r0, _020124E8 @ =gMultiplayerCharacters
	adds r0, r4, r0
	strb r4, [r0]
_020124BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _020123F4
	ldrb r0, [r1]
	cmp r0, #5
	beq _020124D6
	ldr r0, _020124EC @ =gPlayer
	adds r0, #0x37
	ldrb r2, [r0]
	movs r1, #0x80
	orrs r1, r2
	strb r1, [r0]
_020124D6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020124E0: .4byte gUnknown_030054B4
_020124E4: .4byte gGameMode
_020124E8: .4byte gMultiplayerCharacters
_020124EC: .4byte gPlayer

	thumb_func_start Task_GameStage
Task_GameStage: @ 0x020124F0
	push {r4, r5, r6, r7, lr}
	ldr r0, _02012564 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1e
	ldr r0, _02012568 @ =gFrameCount
	ldr r1, _0201256C @ =gUnknown_03005418
	ldr r2, [r0]
	ldr r0, [r1]
	subs r3, r2, r0
	ldr r1, _02012570 @ =gStageTime
	ldr r0, [r1]
	subs r0, r3, r0
	mov ip, r0
	str r3, [r1]
	ldr r0, _02012574 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02012590
	ldr r2, _02012578 @ =0xFFFFFE00
	adds r1, r3, #0
	ands r1, r2
	mov r0, ip
	subs r4, r3, r0
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r5, _0201257C @ =gMultiplayerPseudoRandom
	ldr r1, [r5]
	ldr r0, _02012580 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02012584 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, _02012588 @ =0xFFFFF000
	ands r3, r0
	ands r4, r0
	ldr r6, _0201258C @ =gRandomItemBox
	cmp r3, r4
	beq _02012552
	ldrb r2, [r6]
	lsrs r1, r2, #4
	adds r1, #1
	movs r0, #0xf
	ands r0, r2
	lsls r1, r1, #4
	orrs r0, r1
	strb r0, [r6]
_02012552:
	ldr r1, [r5]
	movs r3, #7
	ldrb r2, [r6]
	movs r0, #0xf8
	ands r0, r2
	ands r1, r3
	orrs r0, r1
	strb r0, [r6]
	b _020125B0
	.align 2, 0
_02012564: .4byte 0x04000128
_02012568: .4byte gFrameCount
_0201256C: .4byte gUnknown_03005418
_02012570: .4byte gStageTime
_02012574: .4byte gGameMode
_02012578: .4byte 0xFFFFFE00
_0201257C: .4byte gMultiplayerPseudoRandom
_02012580: .4byte 0x00196225
_02012584: .4byte 0x3C6EF35F
_02012588: .4byte 0xFFFFF000
_0201258C: .4byte gRandomItemBox
_02012590:
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r3, #0
	ands r1, r2
	mov r4, ip
	subs r0, r3, r4
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r2, _020125E0 @ =gMultiplayerPseudoRandom
	ldr r1, [r2]
	ldr r0, _020125E4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _020125E8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
_020125B0:
	ldr r2, _020125EC @ =gCamera
	adds r0, r2, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0201262E
	ldr r0, _020125F0 @ =gInput
	ldrh r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r3
	cmp r0, r1
	bne _020125F4
	cmp r7, #3
	beq _0201261A
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #3
	strb r0, [r1]
	b _02012634
	.align 2, 0
_020125E0: .4byte gMultiplayerPseudoRandom
_020125E4: .4byte 0x00196225
_020125E8: .4byte 0x3C6EF35F
_020125EC: .4byte gCamera
_020125F0: .4byte gInput
_020125F4:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0201260C
	cmp r7, #0
	beq _02012624
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	b _02012634
_0201260C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0201262E
	cmp r7, #1
	bhi _02012624
_0201261A:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #2
	strb r0, [r1]
	b _02012634
_02012624:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #1
	strb r0, [r1]
	b _02012634
_0201262E:
	adds r0, r2, #0
	adds r0, #0x66
	strb r7, [r0]
_02012634:
	ldr r0, _02012694 @ =gMultiplayerConnections
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x66
	ldrb r2, [r1]
	asrs r0, r2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _0201264A
	strb r7, [r1]
_0201264A:
	ldr r1, _02012698 @ =gUnknown_030053E0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02012656
	subs r0, #1
	strb r0, [r1]
_02012656:
	ldr r0, _0201269C @ =gUnknown_03005400
	ldr r4, _020126A0 @ =gStageFlags
	ldrh r2, [r4]
	strh r2, [r0]
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	bne _0201268E
	ldr r0, _020126A4 @ =gCheckpointTime
	ldr r1, [r0]
	add r1, ip
	str r1, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0201268E
	ldr r1, _020126A8 @ =gCourseTime
	ldr r0, [r1]
	mov r3, ip
	subs r0, r0, r3
	str r0, [r1]
	cmp r0, #0
	bgt _0201268E
	movs r0, #1
	orrs r0, r2
	strh r0, [r4]
	bl CreateMultiplayerFinishHandler
_0201268E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012694: .4byte gMultiplayerConnections
_02012698: .4byte gUnknown_030053E0
_0201269C: .4byte gUnknown_03005400
_020126A0: .4byte gStageFlags
_020126A4: .4byte gCheckpointTime
_020126A8: .4byte gCourseTime

	thumb_func_start sub_020126AC
sub_020126AC: @ 0x020126AC
	push {lr}
	ldr r0, _020126DC @ =gUnknown_03005404
	movs r1, #0
	str r1, [r0]
	ldr r0, _020126E0 @ =gUnknown_030054B0
	strb r1, [r0]
	ldr r1, _020126E4 @ =gNumLives
	movs r0, #3
	strb r0, [r1]
	ldr r0, _020126E8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _020126CA
	movs r0, #1
	strb r0, [r1]
_020126CA:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #1
	movs r1, #2
	bl sub_020122F8
	pop {r0}
	bx r0
	.align 2, 0
_020126DC: .4byte gUnknown_03005404
_020126E0: .4byte gUnknown_030054B0
_020126E4: .4byte gNumLives
_020126E8: .4byte gGameMode

	thumb_func_start GameStageStart
GameStageStart: @ 0x020126EC
	push {lr}
	ldr r0, _02012750 @ =gUnknown_030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012754 @ =gUnknown_03005520
	strb r1, [r0]
	ldr r1, _02012758 @ =gRingCount
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0201275C @ =gUnknown_03005470
	movs r0, #1
	strb r0, [r1]
	ldr r1, _02012760 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012724
	ldr r0, _02012764 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _02012768 @ =gPlayer
	movs r2, #0
	bl sub_02011140
_02012724:
	ldr r0, _0201276C @ =gStageTime
	movs r3, #0
	str r3, [r0]
	ldr r2, _02012770 @ =gStageFlags
	ldrh r1, [r2]
	ldr r0, _02012774 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _02012778 @ =gUnknown_03005418
	ldr r0, _0201277C @ =gFrameCount
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _02012780 @ =gCheckpointTime
	str r3, [r0]
	ldr r1, _02012784 @ =gCourseTime
	ldr r0, _02012788 @ =0x00002A30
	str r0, [r1]
	bl CreateGameStage
	pop {r0}
	bx r0
	.align 2, 0
_02012750: .4byte gUnknown_030053F8
_02012754: .4byte gUnknown_03005520
_02012758: .4byte gRingCount
_0201275C: .4byte gUnknown_03005470
_02012760: .4byte gCurrentLevel
_02012764: .4byte gSelectedCharacter
_02012768: .4byte gPlayer
_0201276C: .4byte gStageTime
_02012770: .4byte gStageFlags
_02012774: .4byte 0x0000FF7F
_02012778: .4byte gUnknown_03005418
_0201277C: .4byte gFrameCount
_02012780: .4byte gCheckpointTime
_02012784: .4byte gCourseTime
_02012788: .4byte 0x00002A30

	thumb_func_start sub_0201278C
sub_0201278C: @ 0x0201278C
	push {r4, lr}
	ldr r4, _020127AC @ =gUnknown_030057D0
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	ldr r0, _020127B0 @ =gPlayer
	bl sub_020111CC
	bl DestroyCameraMovementTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020127AC: .4byte gUnknown_030057D0
_020127B0: .4byte gPlayer

	thumb_func_start TaskDestructor_GameStage
TaskDestructor_GameStage: @ 0x020127B4
	ldr r1, _020127BC @ =gUnknown_030057D0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_020127BC: .4byte gUnknown_030057D0

	thumb_func_start StageInit_CollectRings
StageInit_CollectRings: @ 0x020127C0
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start sub_020127CC
sub_020127CC: @ 0x020127CC
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start MultiPakCommunicationError
MultiPakCommunicationError: @ 0x020127D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _020128D0 @ =gMultiplayerMissingHeartbeats
	movs r4, #0
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	ldr r0, _020128D4 @ =gMultiSioEnabled
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r0, _020128D8 @ =0x0201299D
	movs r2, #0x80
	lsls r2, r2, #5
	str r4, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sb, r0
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r2, _020128DC @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _020128E0 @ =gDispCnt
	movs r2, #0x8d
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020128E4 @ =gBldRegs
	movs r6, #0
	strh r4, [r0]
	strh r4, [r0, #4]
	str r4, [sp, #4]
	ldr r2, _020128E8 @ =0x040000D4
	add r0, sp, #4
	str r0, [r2]
	ldr r1, _020128EC @ =gBgCntRegs
	mov r8, r1
	ldrh r1, [r1]
	movs r0, #0xc
	ands r0, r1
	lsls r0, r0, #0xc
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	str r0, [r2, #4]
	ldr r0, _020128F0 @ =0x85000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _020128F4 @ =gUnknown_03004D80
	strb r6, [r0]
	ldr r1, _020128F8 @ =gUnknown_03002280
	strb r6, [r1]
	strb r6, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _020128FC @ =0x00001E01
	mov r2, r8
	strh r0, [r2]
	ldr r7, _02012900 @ =gBgScrollRegs
	strh r4, [r7]
	strh r4, [r7, #2]
	ldr r0, _02012904 @ =gUnknown_03000040
	adds r2, r5, r0
	str r3, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _02012908 @ =0x0600F000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	movs r0, #4
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	ldr r1, _0201290C @ =gUnknown_0300006A
	adds r5, r5, r1
	strb r6, [r5]
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r0, _02012910 @ =0x00001F04
	mov r2, r8
	strh r0, [r2, #2]
	strh r4, [r7, #4]
	strh r4, [r7, #6]
	ldr r0, _02012914 @ =gMultiplayerLanguage
	ldrb r0, [r0]
	cmp r0, #1
	beq _0201291C
	cmp r0, #1
	bgt _02012928
	cmp r0, #0
	bne _02012928
	ldr r0, _02012918 @ =0x0000FFF8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_020128D0: .4byte gMultiplayerMissingHeartbeats
_020128D4: .4byte gMultiSioEnabled
_020128D8: .4byte 0x0201299D
_020128DC: .4byte gFlags
_020128E0: .4byte gDispCnt
_020128E4: .4byte gBldRegs
_020128E8: .4byte 0x040000D4
_020128EC: .4byte gBgCntRegs
_020128F0: .4byte 0x85000010
_020128F4: .4byte gUnknown_03004D80
_020128F8: .4byte gUnknown_03002280
_020128FC: .4byte 0x00001E01
_02012900: .4byte gBgScrollRegs
_02012904: .4byte gUnknown_03000040
_02012908: .4byte 0x0600F000
_0201290C: .4byte gUnknown_0300006A
_02012910: .4byte 0x00001F04
_02012914: .4byte gMultiplayerLanguage
_02012918: .4byte 0x0000FFF8
_0201291C:
	ldr r0, _02012924 @ =0x0000FFC8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_02012924: .4byte 0x0000FFC8
_02012928:
	ldr r1, _02012984 @ =gBgScrollRegs
	ldr r0, _02012988 @ =0x0000FFF8
	strh r0, [r1, #6]
_0201292E:
	mov r2, sb
	ldr r0, _0201298C @ =0x06004000
	str r0, [r2, #4]
	movs r4, #0
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _02012990 @ =0x0600F800
	str r1, [r2, #0xc]
	strh r0, [r2, #0x18]
	strh r0, [r2, #0x1a]
	movs r5, #3
	strh r5, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r0, [r2, #0x22]
	strh r0, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0xc
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r4, [r0]
	movs r4, #1
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r1, _02012994 @ =gWinRegs
	strh r5, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _02012998 @ =0x00003868
	strh r0, [r1, #4]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012984: .4byte gBgScrollRegs
_02012988: .4byte 0x0000FFF8
_0201298C: .4byte 0x06004000
_02012990: .4byte 0x0600F800
_02012994: .4byte gWinRegs
_02012998: .4byte 0x00003868
_0201299C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_8081200
sub_8081200: @ 0x020129A0
	push {lr}
	ldr r1, _020129F8 @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r0, _020129FC @ =gUnknown_030057C4
	movs r1, #0
	str r1, [r0]
	ldr r0, _02012A00 @ =gUnknown_030057D4
	str r1, [r0]
	ldr r0, _02012A04 @ =gUnknown_030057D0
	str r1, [r0]
	ldr r0, _02012A08 @ =gPlayer
	adds r0, #0x8c
	str r1, [r0]
	ldr r0, _02012A0C @ =gCamera
	str r1, [r0, #0x5c]
	ldr r0, _02012A10 @ =gUnknown_030053F0
	strb r1, [r0]
	ldr r0, _02012A14 @ =gEntitiesManagerTask
	str r1, [r0]
	ldr r3, _02012A18 @ =gMultiplayerPlayerTasks
	movs r2, #0
_020129CC:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _020129CC
	bl sub_020126AC
	ldr r2, _02012A08 @ =gPlayer
	adds r2, #0x5c
	ldr r1, _02012A1C @ =gPlayerControls
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_020129F8: .4byte gGameMode
_020129FC: .4byte gUnknown_030057C4
_02012A00: .4byte gUnknown_030057D4
_02012A04: .4byte gUnknown_030057D0
_02012A08: .4byte gPlayer
_02012A0C: .4byte gCamera
_02012A10: .4byte gUnknown_030053F0
_02012A14: .4byte gEntitiesManagerTask
_02012A18: .4byte gMultiplayerPlayerTasks
_02012A1C: .4byte gPlayerControls

	thumb_func_start GameInit
GameInit: @ 0x02012A20
	push {r4, r5, r6, r7, lr}
	ldr r1, _02012A7C @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02012A80 @ =gUnknown_03004D54
	ldr r0, _02012A84 @ =gBgOffsetsBuffer
	str r0, [r1]
	ldr r1, _02012A88 @ =gUnknown_030022C0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #0
	ldr r7, _02012A8C @ =gMultiSioEnabled
	ldr r0, _02012A90 @ =gMultiSioStatusFlags
	mov ip, r0
	ldr r6, _02012A94 @ =gMultiplayerCharacters
	movs r2, #0
	ldr r5, _02012A98 @ =gMPRingCollectWins
	ldr r4, _02012A9C @ =gUnknown_030054B4
	ldr r3, _02012AA0 @ =gMultiplayerMissingHeartbeats
_02012A4A:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r1, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _02012A4A
	movs r0, #1
	strb r0, [r7]
	mov r1, ip
	ldr r0, [r1]
	bl MultiSioInit
	bl MultiSioStart
	movs r0, #0
	bl CreateMultiplayerSinglePakResultsScreen
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012A7C: .4byte gGameMode
_02012A80: .4byte gUnknown_03004D54
_02012A84: .4byte gBgOffsetsBuffer
_02012A88: .4byte gUnknown_030022C0
_02012A8C: .4byte gMultiSioEnabled
_02012A90: .4byte gMultiSioStatusFlags
_02012A94: .4byte gMultiplayerCharacters
_02012A98: .4byte gMPRingCollectWins
_02012A9C: .4byte gUnknown_030054B4
_02012AA0: .4byte gMultiplayerMissingHeartbeats

	thumb_func_start sub_02012AA4
sub_02012AA4: @ 0x02012AA4
	push {lr}
	sub sp, #4
	ldr r0, _02012AC4 @ =sub_02012AE8
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, _02012AC8 @ =sub_02012AEC
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _02012ACC @ =gUnknown_030057D4
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02012AC4: .4byte sub_02012AE8
_02012AC8: .4byte sub_02012AEC
_02012ACC: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AD0
sub_02012AD0: @ 0x02012AD0
	push {r4, lr}
	ldr r4, _02012AE4 @ =gUnknown_030057D4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02012AE4: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AE8
sub_02012AE8: @ 0x02012AE8
	bx lr
	.align 2, 0

	thumb_func_start sub_02012AEC
sub_02012AEC: @ 0x02012AEC
	ldr r1, _02012AF4 @ =gUnknown_030057D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012AF4: .4byte gUnknown_030057D4
