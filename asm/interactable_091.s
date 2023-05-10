.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_EggUtopia_Launcher
initSprite_EggUtopia_Launcher: @ 0x0807D9C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0              @ r8 = me
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10      @ r4 = spriteRegionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sl, r5              @ r5 = spriteRegionY
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0              @ sb = spriteY
	ldr r0, _0807DA8C @ =Task_807DE98
	ldr r2, _0807DA90 @ =0x00002010
	ldr r1, _0807DA94 @ =TaskDestructor_807DF38
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
_0807DA94: .4byte TaskDestructor_807DF38
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
	ldr r2, [sp, #0x30]     @ r2 = launcher->kind
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
    
.if 0
.endif
