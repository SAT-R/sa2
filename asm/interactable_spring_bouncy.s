.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
.if 1

	thumb_func_start sub_805DE60
sub_805DE60: @ 0x0805DE60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0805DF44 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sl, r0
	ldr r0, _0805DF48 @ =IWRAM_START + 0xC
	adds r0, r0, r7
	mov sb, r0
	mov r1, sl
	ldr r1, [r1]
	str r1, [sp]
	mov r2, sl
	ldrb r1, [r2, #8]
	lsls r1, r1, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r1, r0
	ldr r4, [sp]
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r2, r1, r0
	ldr r1, _0805DF4C @ =gCamera
	ldr r0, [r1]
	subs r0, r3, r0
	mov r4, sb
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r2, r0
	strh r0, [r4, #0x18]
	ldr r4, _0805DF50 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _0805DF54 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	beq _0805DEBC
	b _0805DFBA
_0805DEBC:
	ldrh r5, [r4, #0x12]
	mov r0, sb
	adds r1, r3, #0
	adds r3, r4, #0
	bl sub_800CCB8
	cmp r0, #0
	beq _0805DFBA
	lsls r6, r5, #0x10
	asrs r5, r6, #0x10
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0805DEE8
	movs r0, #2
	mov r8, r0
_0805DEE8:
	asrs r0, r6, #0x13
	adds r0, r5, r0
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0805DF58 @ =0xFFFFF880
	cmp r0, r1
	ble _0805DEFC
	strh r1, [r4, #0x12]
_0805DEFC:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, _0805DF5C @ =0xFFFFF400
	cmp r0, r1
	bge _0805DF08
	strh r1, [r4, #0x12]
_0805DF08:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0805DF60 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0805DF64 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0805DF6C
	ldr r1, _0805DF68 @ =gUnknown_080D94A4
	b _0805DF7A
	.align 2, 0
_0805DF44: .4byte gCurTask
_0805DF48: .4byte IWRAM_START + 0xC
_0805DF4C: .4byte gCamera
_0805DF50: .4byte gPlayer
_0805DF54: .4byte 0x00400080
_0805DF58: .4byte 0xFFFFF880
_0805DF5C: .4byte 0xFFFFF400
_0805DF60: .4byte 0xFFFFFEFF
_0805DF64: .4byte gCurrentLevel
_0805DF68: .4byte gUnknown_080D94A4
_0805DF6C:
	cmp r0, #5
	bne _0805DF78
	ldr r1, _0805DF74 @ =gUnknown_080D94BC
	b _0805DF7A
	.align 2, 0
_0805DF74: .4byte gUnknown_080D94BC
_0805DF78:
	ldr r1, _0805DFF4 @ =gUnknown_080D948C
_0805DF7A:
	mov r2, r8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	mov r4, sb
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	ldr r2, _0805DFF8 @ =IWRAM_START + 0x2C
	adds r0, r7, r2
	strb r1, [r0]
	ldr r4, _0805DFFC @ =IWRAM_START + 0x2D
	adds r1, r7, r4
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _0805E000 @ =gPlayer
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #9
	movs r0, #7
	strb r0, [r1]
	subs r1, #7
	ldr r0, _0805E004 @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #0xaa
	bl m4aSongNumStart
	ldr r0, _0805E008 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805E00C @ =sub_805E02C
	str r0, [r1, #8]
_0805DFBA:
	mov r1, sb
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805DFE2
	mov r2, sb
	movs r4, #0x18
	ldrsh r0, [r2, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _0805DFE2
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805E010
_0805DFE2:
	mov r1, sl
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _0805E008 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805E01C
	.align 2, 0
_0805DFF4: .4byte gUnknown_080D948C
_0805DFF8: .4byte IWRAM_START + 0x2C
_0805DFFC: .4byte IWRAM_START + 0x2D
_0805E000: .4byte gPlayer
_0805E004: .4byte 0x0000FFFF
_0805E008: .4byte gCurTask
_0805E00C: .4byte sub_805E02C
_0805E010:
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
_0805E01C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.endif

	thumb_func_start sub_805E02C
sub_805E02C: @ 0x0805E02C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0805E0A0 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0xc
	adds r4, r6, r0
	ldr r1, [r5]
	mov ip, r1
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r0, ip
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805E0A4 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r0, #0
	mov r8, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r4, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	adds r3, r7, #0
	cmp r1, r0
	bhi _0805E090
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805E090
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0805E0A8
_0805E090:
	ldrb r0, [r5, #8]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r3]
	bl TaskDestroy
	b _0805E0FA
	.align 2, 0
_0805E0A0: .4byte gCurTask
_0805E0A4: .4byte gCamera
_0805E0A8:
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0805E0F4
	ldr r1, [r7]
	ldr r0, _0805E0C8 @ =sub_805DE60
	str r0, [r1, #8]
	ldr r0, _0805E0CC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0805E0D4
	ldr r0, _0805E0D0 @ =0x0000023A
	b _0805E0E2
	.align 2, 0
_0805E0C8: .4byte sub_805DE60
_0805E0CC: .4byte gCurrentLevel
_0805E0D0: .4byte 0x0000023A
_0805E0D4:
	cmp r0, #5
	bne _0805E0E0
	ldr r0, _0805E0DC @ =0x0000025B
	b _0805E0E2
	.align 2, 0
_0805E0DC: .4byte 0x0000025B
_0805E0E0:
	ldr r0, _0805E104 @ =0x00000219
_0805E0E2:
	strh r0, [r4, #0xa]
	ldr r1, _0805E108 @ =IWRAM_START + 0x2C
	adds r0, r6, r1
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0805E0F4:
	adds r0, r4, #0
	bl sub_80051E8
_0805E0FA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E104: .4byte 0x00000219
_0805E108: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_805E10C
sub_805E10C: @ 0x0805E10C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
