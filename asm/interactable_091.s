.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable091
initSprite_Interactable091: @ 0x0807D9C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sl, r5
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0807DA8C @ =Task_807DE98
	ldr r2, _0807DA90 @ =0x00002010
	ldr r1, _0807DA94 @ =sub_807DF38
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r1, _0807DA98 @ =IWRAM_START + 0x44
	adds r3, r2, r1
	mov r5, sp
	ldrh r5, [r5, #0x30]
	strh r5, [r3]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	mov r5, ip
	str r0, [r5, #0x3c]
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r5, sl
	lsls r1, r5, #8
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x40]
	mov r5, r8
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _0807DA9C @ =IWRAM_START + 0x4C
	adds r7, r2, r1
	strh r0, [r7]
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r5, _0807DAA0 @ =IWRAM_START + 0x4E
	adds r6, r2, r5
	strh r0, [r6]
	mov r1, r8
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	ldrh r5, [r7]
	adds r0, r0, r5
	ldr r5, _0807DAA4 @ =IWRAM_START + 0x50
	adds r1, r2, r5
	strh r0, [r1]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r5, [r6]
	adds r0, r0, r5
	ldr r5, _0807DAA8 @ =IWRAM_START + 0x52
	adds r2, r2, r5
	strh r0, [r2]
	mov r0, ip
	strh r4, [r0, #4]
	mov r4, sl
	strh r4, [r0, #6]
	mov r5, r8
	str r5, [r0]
	ldrb r0, [r5]
	mov r4, ip
	strb r0, [r4, #8]
	mov r5, sb
	strb r5, [r4, #9]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DABC
	cmp r0, #1
	bgt _0807DAAC
	cmp r0, #0
	beq _0807DAB6
	b _0807DB0E
	.align 2, 0
_0807DA8C: .4byte Task_807DE98
_0807DA90: .4byte 0x00002010
_0807DA94: .4byte sub_807DF38
_0807DA98: .4byte IWRAM_START + 0x44
_0807DA9C: .4byte IWRAM_START + 0x4C
_0807DAA0: .4byte IWRAM_START + 0x4E
_0807DAA4: .4byte IWRAM_START + 0x50
_0807DAA8: .4byte IWRAM_START + 0x52
_0807DAAC:
	cmp r0, #2
	beq _0807DAD8
	cmp r0, #3
	beq _0807DAF4
	b _0807DB0E
_0807DAB6:
	movs r0, #0
	ldrsh r1, [r1, r0]
	b _0807DAC0
_0807DABC:
	movs r5, #0
	ldrsh r1, [r7, r5]
_0807DAC0:
	mov r3, ip
	ldr r0, [r3, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x54]
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x58]
	b _0807DB0E
_0807DAD8:
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov r2, ip
	ldr r0, [r2, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x54]
	movs r3, #0
	ldrsh r1, [r6, r3]
	ldr r0, [r2, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x58]
	b _0807DB0E
_0807DAF4:
	movs r4, #0
	ldrsh r1, [r7, r4]
	mov r5, ip
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x54]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x58]
_0807DB0E:
	movs r3, #0
	mov r4, ip
	adds r4, #0xc
	mov r6, ip
	adds r6, #0x2d
	mov r7, ip
	adds r7, #0x2e
	movs r1, #0x31
	add r1, ip
	mov sb, r1
	movs r2, #0x2c
	add r2, ip
	mov sl, r2
	mov r5, ip
	adds r5, #0x44
	str r5, [sp, #0xc]
	mov r2, ip
	adds r2, #0x64
	mov r1, ip
	adds r1, #0x60
_0807DB36:
	mov r5, ip
	ldr r0, [r5, #0x54]
	str r0, [r1]
	ldr r0, [r5, #0x58]
	str r0, [r2]
	adds r2, #8
	adds r1, #8
	adds r3, #1
	cmp r3, #2
	bls _0807DB36
	adds r5, r4, #0
	movs r4, #0
	movs r1, #0
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	movs r0, #0xff
	strb r0, [r6]
	movs r0, #0x10
	strb r0, [r7]
	mov r0, sb
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xf
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807DBA8 @ =0x00000266
	strh r0, [r5, #0xa]
	mov r1, sl
	strb r4, [r1]
	ldr r2, [sp, #0x30]
	cmp r2, #0
	bne _0807DB94
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DB94:
	ldr r3, [sp, #0xc]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DBD0
	cmp r0, #1
	bgt _0807DBAC
	cmp r0, #0
	beq _0807DBB6
	b _0807DBD0
	.align 2, 0
_0807DBA8: .4byte 0x00000266
_0807DBAC:
	cmp r0, #2
	beq _0807DBBE
	cmp r0, #3
	beq _0807DBC6
	b _0807DBD0
_0807DBB6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807DBCC
_0807DBBE:
	ldr r0, [r5, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	b _0807DBCC
_0807DBC6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
_0807DBCC:
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DBD0:
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807DBF0
sub_807DBF0: @ 0x0807DBF0
	push {r4, r5, lr}
	ldr r0, _0807DC38 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807DC3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DC0C
	adds r0, r4, #0
	bl sub_807E0D0
_0807DC0C:
	adds r0, r4, #0
	bl sub_807DF60
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807DC1E
	adds r0, r4, #0
	bl sub_807DD04
_0807DC1E:
	adds r0, r4, #0
	bl sub_807DFBC
	ldr r3, _0807DC40 @ =gPlayer
	ldr r2, [r3, #0x20]
	movs r5, #0x80
	ands r5, r2
	cmp r5, #0
	beq _0807DC44
	movs r0, #0
	str r0, [r4, #0x48]
	b _0807DC6C
	.align 2, 0
_0807DC38: .4byte gCurTask
_0807DC3C: .4byte gGameMode
_0807DC40: .4byte gPlayer
_0807DC44:
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	cmp r0, #0x78
	beq _0807DC64
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0807DC78 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807DC6C
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
_0807DC64:
	ldr r0, _0807DC7C @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r3, #0x20]
	str r5, [r4, #0x48]
_0807DC6C:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DC78: .4byte gPlayerControls
_0807DC7C: .4byte 0xFFBFFFFF

	thumb_func_start sub_807DC80
sub_807DC80: @ 0x0807DC80
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x8f
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r4, _0807DCDC @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r2, r4, #0
	adds r2, #0x64
	movs r1, #0
	movs r0, #0x40
	strh r0, [r2]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r1, [r4, #0x20]
	subs r0, #0x13
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807DCD4
	cmp r0, #2
	bne _0807DCE0
_0807DCD4:
	movs r0, #1
	orrs r1, r0
	b _0807DCE6
	.align 2, 0
_0807DCDC: .4byte gPlayer
_0807DCE0:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
_0807DCE6:
	str r1, [r4, #0x20]
	movs r0, #1
	str r0, [r5, #0x48]
	ldr r0, _0807DCFC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DD00 @ =sub_807DBF0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DCFC: .4byte gCurTask
_0807DD00: .4byte sub_807DBF0

	thumb_func_start sub_807DD04
sub_807DD04: @ 0x0807DD04
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0807DD44 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807DD78
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _0807DD78
	ldr r0, _0807DD48 @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x41
	strh r0, [r1]
	adds r1, #9
	movs r0, #7
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807DD5C
	cmp r0, #1
	bgt _0807DD4C
	cmp r0, #0
	beq _0807DD56
	b _0807DD68
	.align 2, 0
_0807DD44: .4byte gPlayer
_0807DD48: .4byte 0xFFBFFFFF
_0807DD4C:
	cmp r0, #2
	beq _0807DD56
	cmp r0, #3
	beq _0807DD5C
	b _0807DD68
_0807DD56:
	movs r0, #0xf1
	lsls r0, r0, #8
	b _0807DD60
_0807DD5C:
	movs r0, #0xf0
	lsls r0, r0, #4
_0807DD60:
	strh r0, [r2, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
_0807DD68:
	movs r0, #0
	str r0, [r4, #0x48]
	ldr r0, _0807DD74 @ =0x0000011F
	bl m4aSongNumStart
	b _0807DD80
	.align 2, 0
_0807DD74: .4byte 0x0000011F
_0807DD78:
	movs r0, #0x8f
	lsls r0, r0, #1
	bl m4aSongNumStop
_0807DD80:
	adds r1, r4, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807DD98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DD9C @ =sub_807DEEC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DD98: .4byte gCurTask
_0807DD9C: .4byte sub_807DEEC

	thumb_func_start sub_807DDA0
sub_807DDA0: @ 0x0807DDA0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807DDC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DDC8
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	ldr r2, _0807DDC4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x6c]
	b _0807DDD6
	.align 2, 0
_0807DDC0: .4byte gGameMode
_0807DDC4: .4byte gCamera
_0807DDC8:
	ldr r0, [r3, #0x54]
	asrs r0, r0, #8
	ldr r2, _0807DDEC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x58]
_0807DDD6:
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DDEC: .4byte gCamera

	thumb_func_start sub_807DDF0
sub_807DDF0: @ 0x0807DDF0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r1, _0807DE1C @ =gPlayer
	ldr r0, [r1, #0x20]
	movs r2, #0x80
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	bne _0807DE90
	ldr r0, _0807DE20 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807DE24
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
_0807DE14:
	cmp r0, #1
	bhi _0807DE32
	b _0807DE90
	.align 2, 0
_0807DE1C: .4byte gPlayer
_0807DE20: .4byte gUnknown_03005424
_0807DE24:
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0807DE14
_0807DE32:
	ldr r2, [r3, #0x54]
	asrs r2, r2, #8
	ldr r1, _0807DE8C @ =gCamera
	ldr r4, [r1]
	subs r2, r2, r4
	ldr r0, [r3, #0x58]
	asrs r0, r0, #8
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807DE90
	adds r0, #0x20
	cmp r0, r1
	blt _0807DE90
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x10
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807DE90
	adds r0, r3, #0
	adds r0, #0x10
	cmp r0, r2
	blt _0807DE90
	movs r0, #1
	b _0807DE92
	.align 2, 0
_0807DE8C: .4byte gCamera
_0807DE90:
	movs r0, #0
_0807DE92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Task_807DE98
Task_807DE98: @ 0x0807DE98
	push {r4, lr}
	ldr r0, _0807DED8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807DEDC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DEB4
	adds r0, r4, #0
	bl sub_807E0D0
_0807DEB4:
	adds r0, r4, #0
	bl sub_807DDF0
	cmp r0, #0
	beq _0807DEC4
	adds r0, r4, #0
	bl sub_807DC80
_0807DEC4:
	adds r0, r4, #0
	bl sub_807E044
	cmp r0, #0
	beq _0807DEE0
	adds r0, r4, #0
	bl sub_807E0B8
	b _0807DEE6
	.align 2, 0
_0807DED8: .4byte gCurTask
_0807DEDC: .4byte gGameMode
_0807DEE0:
	adds r0, r4, #0
	bl sub_807DDA0
_0807DEE6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807DEEC
sub_807DEEC: @ 0x0807DEEC
	push {r4, r5, lr}
	ldr r0, _0807DF2C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807DF30 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DF08
	adds r0, r4, #0
	bl sub_807E0D0
_0807DF08:
	ldr r0, _0807DF34 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0807DF20
	adds r0, r4, #0
	bl sub_807DF4C
_0807DF20:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF2C: .4byte gCurTask
_0807DF30: .4byte gGameMode
_0807DF34: .4byte IWRAM_START + 0x5C

	thumb_func_start sub_807DF38
sub_807DF38: @ 0x0807DF38
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807DF4C
sub_807DF4C: @ 0x0807DF4C
	ldr r0, _0807DF58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DF5C @ =sub_807E16C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807DF58: .4byte gCurTask
_0807DF5C: .4byte sub_807E16C

	thumb_func_start sub_807DF60
sub_807DF60: @ 0x0807DF60
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807DF72
	cmp r0, #2
	bne _0807DF94
_0807DF72:
	ldr r1, [r3, #0x54]
	ldr r0, _0807DF90 @ =0xFFFFF100
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807DFB4
	b _0807DFB0
	.align 2, 0
_0807DF90: .4byte 0xFFFFF100
_0807DF94:
	ldr r1, [r3, #0x54]
	movs r0, #0xf0
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	blt _0807DFB4
_0807DFB0:
	str r0, [r3, #0x54]
	movs r4, #1
_0807DFB4:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807DFBC
sub_807DFBC: @ 0x0807DFBC
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807DFE8 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E040
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _0807E040
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807E00C
	cmp r0, #1
	bgt _0807DFEC
	cmp r0, #0
	beq _0807DFF6
	b _0807E040
	.align 2, 0
_0807DFE8: .4byte gPlayer
_0807DFEC:
	cmp r0, #2
	beq _0807E020
	cmp r0, #3
	beq _0807E02C
	b _0807E040
_0807DFF6:
	ldr r0, [r2, #0x54]
	ldr r1, _0807E004 @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	ldr r1, _0807E008 @ =0xFFFFF000
	b _0807E03C
	.align 2, 0
_0807E004: .4byte 0xFFFFF800
_0807E008: .4byte 0xFFFFF000
_0807E00C:
	ldr r0, [r2, #0x54]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	ldr r1, _0807E01C @ =0xFFFFF000
	b _0807E03C
	.align 2, 0
_0807E01C: .4byte 0xFFFFF000
_0807E020:
	ldr r0, [r2, #0x54]
	ldr r1, _0807E028 @ =0xFFFFF800
	b _0807E032
	.align 2, 0
_0807E028: .4byte 0xFFFFF800
_0807E02C:
	ldr r0, [r2, #0x54]
	movs r1, #0x80
	lsls r1, r1, #4
_0807E032:
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	movs r1, #0x80
	lsls r1, r1, #5
_0807E03C:
	adds r0, r0, r1
	str r0, [r3, #0xc]
_0807E040:
	pop {r0}
	bx r0

	thumb_func_start sub_807E044
sub_807E044: @ 0x0807E044
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807E0AC @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807E0A6
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807E0A6
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807E0A6
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807E0B0
_0807E0A6:
	movs r0, #1
	b _0807E0B2
	.align 2, 0
_0807E0AC: .4byte gCamera
_0807E0B0:
	movs r0, #0
_0807E0B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807E0B8
sub_807E0B8: @ 0x0807E0B8
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807E0CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807E0CC: .4byte gCurTask

	thumb_func_start sub_807E0D0
sub_807E0D0: @ 0x0807E0D0
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x58]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start initSprite_Interactable091_0
initSprite_Interactable091_0: @ 0x0807E0EC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl initSprite_Interactable091
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable091_1
initSprite_Interactable091_1: @ 0x0807E10C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl initSprite_Interactable091
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable091_2
initSprite_Interactable091_2: @ 0x0807E12C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl initSprite_Interactable091
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable091_3
initSprite_Interactable091_3: @ 0x0807E14C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl initSprite_Interactable091
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E16C
sub_807E16C: @ 0x0807E16C
	push {r4, lr}
	ldr r0, _0807E1A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807E1AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807E188
	adds r0, r4, #0
	bl sub_807E0D0
_0807E188:
	adds r0, r4, #0
	bl sub_807E1C4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807E19A
	adds r0, r4, #0
	bl sub_807E1B0
_0807E19A:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1A8: .4byte gCurTask
_0807E1AC: .4byte gGameMode

	thumb_func_start sub_807E1B0
sub_807E1B0: @ 0x0807E1B0
	ldr r0, _0807E1BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E1C0 @ =Task_807DE98
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E1BC: .4byte gCurTask
_0807E1C0: .4byte Task_807DE98

	thumb_func_start sub_807E1C4
sub_807E1C4: @ 0x0807E1C4
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807E1D6
	cmp r0, #2
	bne _0807E1F4
_0807E1D6:
	ldr r1, [r3, #0x54]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	blt _0807E212
	b _0807E20E
_0807E1F4:
	ldr r1, [r3, #0x54]
	ldr r0, _0807E21C @ =0xFFFFFF00
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807E212
_0807E20E:
	str r0, [r3, #0x54]
	movs r4, #1
_0807E212:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807E21C: .4byte 0xFFFFFF00
