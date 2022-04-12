.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
	
	thumb_func_start sub_8071944
sub_8071944: @ 0x08071944
	push {r4, r5, r6, r7, lr}
	ldr r0, _080719B8 @ =gUnknown_03005B64
	ldr r5, [r0]
	ldr r0, _080719BC @ =gUnknown_03005B60
	ldr r6, [r0]
	ldr r0, _080719C0 @ =gUnknown_03005B68
	ldr r7, [r0]
	ldr r0, [r5]
	cmp r0, #0
	bne _0807196C
	bl sub_80854DC
	adds r4, r0, #0
	bl sub_80854DC
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	str r4, [r5]
_0807196C:
	movs r2, #0xde
	lsls r2, r2, #2
	adds r0, r6, #0
	adds r1, r5, #0
	bl memcpy
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_80719D0
	ldr r0, _080719C4 @ =gUnknown_03001840
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080719C8
	bl sub_8071C60
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080719A2
	movs r2, #0
_080719A2:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r7, #0
	bl sub_8071D24
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080719C8
	movs r0, #1
	b _080719CA
	.align 2, 0
_080719B8: .4byte gUnknown_03005B64
_080719BC: .4byte gUnknown_03005B60
_080719C0: .4byte gUnknown_03005B68
_080719C4: .4byte gUnknown_03001840
_080719C8:
	movs r0, #0
_080719CA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80719D0
sub_80719D0: @ 0x080719D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, [r5, #4]
	movs r2, #0xde
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	ldr r0, _08071B08 @ =0x4547474D
	str r0, [r5]
	adds r4, #1
	str r4, [r5, #4]
	ldr r0, [r6]
	str r0, [r5, #8]
	adds r1, r5, #0
	adds r1, #0xc
	adds r0, r6, #0
	adds r0, #0x20
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldrb r0, [r6, #6]
	movs r2, #0
	strb r0, [r5, #0x18]
	strb r2, [r5, #0x19]
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _08071A16
	movs r0, #1
	strb r0, [r5, #0x19]
_08071A16:
	ldrb r0, [r6, #5]
	cmp r0, #0
	beq _08071A24
	ldrb r0, [r5, #0x19]
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x19]
_08071A24:
	strb r2, [r5, #0x1a]
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _08071A30
	movs r0, #1
	strb r0, [r5, #0x1a]
_08071A30:
	ldrb r0, [r6, #0x1a]
	cmp r0, #0
	beq _08071A42
	lsls r0, r0, #1
	movs r1, #6
	ands r0, r1
	ldrb r1, [r5, #0x1a]
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08071A42:
	ldrb r0, [r6, #0x1b]
	cmp r0, #0
	beq _08071A50
	ldrb r0, [r5, #0x1a]
	movs r1, #8
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08071A50:
	ldrb r0, [r6, #0x15]
	cmp r0, #0
	beq _08071A5E
	ldrb r0, [r5, #0x1a]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08071A5E:
	ldrb r0, [r6, #0x16]
	cmp r0, #0
	beq _08071A6C
	ldrb r0, [r5, #0x1a]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08071A6C:
	ldrb r0, [r6, #0x17]
	cmp r0, #0
	beq _08071A7A
	ldrb r0, [r5, #0x1a]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08071A7A:
	ldrb r0, [r6, #0x18]
	cmp r0, #0
	beq _08071A88
	ldrb r0, [r5, #0x1a]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08071A88:
	strb r2, [r5, #0x1b]
	ldrb r2, [r6, #0x13]
	movs r0, #2
	ands r0, r2
	adds r3, r2, #0
	cmp r0, #0
	beq _08071A9A
	movs r0, #1
	strb r0, [r5, #0x1b]
_08071A9A:
	movs r4, #4
	adds r0, r4, #0
	ands r0, r3
	cmp r0, #0
	beq _08071AAC
	ldrb r0, [r5, #0x1b]
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x1b]
_08071AAC:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08071ABC
	ldrb r0, [r5, #0x1b]
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #0x1b]
_08071ABC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08071ACC
	ldrb r0, [r5, #0x1b]
	movs r1, #8
	orrs r0, r1
	strb r0, [r5, #0x1b]
_08071ACC:
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	beq _08071ADA
	ldrb r0, [r5, #0x1b]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #0x1b]
_08071ADA:
	ldrb r0, [r6, #0x12]
	cmp r0, #0
	beq _08071AE8
	ldrb r0, [r5, #0x1b]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #0x1b]
_08071AE8:
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	beq _08071AF6
	ldrb r0, [r5, #0x1b]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5, #0x1b]
_08071AF6:
	ldrh r1, [r6, #0x2c]
	cmp r1, #2
	beq _08071B16
	cmp r1, #2
	bgt _08071B0C
	cmp r1, #1
	beq _08071B16
	b _08071B1C
	.align 2, 0
_08071B08: .4byte 0x4547474D
_08071B0C:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08071B1A
	b _08071B1C
_08071B16:
	strb r1, [r5, #0x1c]
	b _08071B1C
_08071B1A:
	strb r4, [r5, #0x1c]
_08071B1C:
	ldrh r1, [r6, #0x2e]
	cmp r1, #2
	beq _08071B36
	cmp r1, #2
	bgt _08071B2C
	cmp r1, #1
	beq _08071B36
	b _08071B3E
_08071B2C:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08071B3A
	b _08071B3E
_08071B36:
	strb r1, [r5, #0x1d]
	b _08071B3E
_08071B3A:
	movs r0, #4
	strb r0, [r5, #0x1d]
_08071B3E:
	ldrh r1, [r6, #0x30]
	cmp r1, #2
	beq _08071B58
	cmp r1, #2
	bgt _08071B4E
	cmp r1, #1
	beq _08071B58
	b _08071B60
_08071B4E:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08071B5C
	b _08071B60
_08071B58:
	strb r1, [r5, #0x1e]
	b _08071B60
_08071B5C:
	movs r0, #4
	strb r0, [r5, #0x1e]
_08071B60:
	movs r1, #0
	movs r0, #0x24
	adds r0, r0, r5
	mov ip, r0
	adds r7, r6, #0
	adds r7, #0xc
	ldrb r3, [r6, #0x1c]
	mov r2, sp
	strb r3, [r2]
	adds r4, r5, #0
	adds r4, #0x29
	str r4, [sp, #4]
	ldrb r0, [r6, #0x1d]
	strb r0, [r2, #1]
	movs r2, #0x2a
	adds r2, r2, r5
	mov sl, r2
	ldrb r3, [r6, #0x1e]
	mov sb, r3
	movs r4, #0x2b
	adds r4, r4, r5
	mov r8, r4
	adds r0, r5, #0
	adds r0, #0x2c
	str r0, [sp, #8]
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0xc]
	adds r4, r5, #0
	adds r4, #0x1f
	adds r3, r6, #7
_08071B9E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r4, r0
	adds r1, r3, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08071B9E
	movs r1, #0
	mov r4, ip
	adds r3, r7, #0
_08071BBC:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r4, r0
	adds r1, r3, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08071BBC
	mov r3, sp
	ldrb r4, [r3]
	ldr r3, [sp, #4]
	strb r4, [r3]
	mov r0, sp
	ldrb r1, [r0, #1]
	mov r0, sl
	strb r1, [r0]
	mov r3, sb
	mov r2, r8
	strb r3, [r2]
	movs r2, #0x9e
	lsls r2, r2, #2
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl memcpy
	movs r4, #0xa9
	lsls r4, r4, #2
	adds r0, r5, r4
	movs r2, #0xab
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r2, #0xc8
	bl memcpy
	bl sub_80854DC
	adds r4, r0, #0
	bl sub_80854DC
	movs r3, #0xdb
	lsls r3, r3, #2
	adds r1, r5, r3
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	str r4, [r1]
	movs r4, #0xdc
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r2, #0xdd
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	str r0, [r1]
	movs r2, #0
	movs r1, #0
	adds r3, #7
_08071C38:
	adds r0, r5, r1
	ldr r0, [r0]
	adds r2, r2, r0
	adds r1, #4
	cmp r1, r3
	bls _08071C38
	movs r3, #0xdd
	lsls r3, r3, #2
	adds r0, r5, r3
	str r2, [r0]
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8071C60
sub_8071C60: @ 0x08071C60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	movs r0, #0
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
	ldr r4, _08071CFC @ =0x0000FFFF
	mov sl, r4
	movs r1, #0
_08071C7C:
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	asrs r6, r0, #0x10
	lsls r5, r6, #3
	mov r0, sp
	adds r4, r0, r5
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #8
	bl ReadFlash
	ldr r1, [r4]
	ldr r0, _08071D00 @ =0x4547474D
	cmp r1, r0
	bne _08071D08
	add r2, sp, #4
	adds r0, r2, r5
	ldr r0, [r0]
	cmp r0, sb
	bls _08071CA8
	mov sb, r0
_08071CA8:
	cmp r0, r8
	bhs _08071CB0
	mov sl, r7
	mov r8, r0
_08071CB0:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071C7C
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	bne _08071D0C
	ldr r4, _08071D04 @ =0xFFFF0000
	mov r8, r4
	movs r1, #0
	mov r3, r8
_08071CCC:
	lsls r1, r1, #0x10
	cmp r8, r3
	bls _08071CE2
	asrs r0, r1, #0xd
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, r8
	bhs _08071CE2
	lsrs r4, r1, #0x10
	mov sl, r4
	mov r8, r0
_08071CE2:
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r1, r4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071CCC
	ldr r0, _08071D04 @ =0xFFFF0000
	cmp r8, r0
	bne _08071D0C
	movs r0, #1
	rsbs r0, r0, #0
	b _08071D12
	.align 2, 0
_08071CFC: .4byte 0x0000FFFF
_08071D00: .4byte 0x4547474D
_08071D04: .4byte 0xFFFF0000
_08071D08:
	adds r0, r6, #0
	b _08071D12
_08071D0C:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
_08071D12:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8071D24
sub_8071D24: @ 0x08071D24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r0, _08071E04 @ =gUnknown_03001840
	mov r8, r0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	orrs r1, r0
	ldr r2, _08071E08 @ =0x04000200
	ldrh r0, [r2]
	str r0, [sp, #4]
	ldr r7, _08071E0C @ =0x04000208
	ldrh r0, [r7]
	mov sl, r0
	ldr r2, _08071E10 @ =0x04000004
	mov sb, r2
	ldrh r6, [r2]
	movs r0, #0
	ldr r2, _08071E08 @ =0x04000200
	strh r0, [r2]
	strh r0, [r7]
	mov r2, sb
	strh r0, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, r8
	str r1, [r0]
	ldr r1, _08071E14 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _08071E18 @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _08071E1C @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _08071E20 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	movs r2, #0xde
	lsls r2, r2, #2
	adds r0, r5, #0
	ldr r1, [sp]
	bl ProgramFlashSectorAndVerifyNBytes
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r1, sp
	ldrh r2, [r1, #4]
	ldr r1, _08071E08 @ =0x04000200
	strh r2, [r1]
	mov r0, sl
	strh r0, [r7]
	mov r1, sb
	strh r6, [r1]
	bl m4aSoundVSyncOn
	mov r2, r8
	ldr r0, [r2]
	ldr r1, _08071E24 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071E04: .4byte gUnknown_03001840
_08071E08: .4byte 0x04000200
_08071E0C: .4byte 0x04000208
_08071E10: .4byte 0x04000004
_08071E14: .4byte 0x040000B0
_08071E18: .4byte 0x0000C5FF
_08071E1C: .4byte 0x00007FFF
_08071E20: .4byte 0x040000D4
_08071E24: .4byte 0xFFFF7FFF

	thumb_func_start sub_8071E28
sub_8071E28: @ 0x08071E28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08071E64 @ =gUnknown_03005B64
	ldr r7, [r0]
	ldr r0, _08071E68 @ =gUnknown_03005B60
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _08071E6C @ =gUnknown_03005B68
	ldr r6, [r0]
	movs r5, #0
	movs r2, #0xde
	lsls r2, r2, #2
	mov r0, sb
	adds r1, r7, #0
	bl memcpy
	ldr r0, _08071E70 @ =gUnknown_03001840
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08071ED0
	bl sub_8071EE0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08071E7C
	.align 2, 0
_08071E64: .4byte gUnknown_03005B64
_08071E68: .4byte gUnknown_03005B60
_08071E6C: .4byte gUnknown_03005B68
_08071E70: .4byte gUnknown_03001840
_08071E74:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bgt _08071EB2
_08071E7C:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8072538
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	cmp r0, #0
	bne _08071EB8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl sub_8072244
	cmp r4, #0
	bne _08071EAA
	movs r1, #9
	b _08071E74
_08071EAA:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08071E74
_08071EB2:
	mov r0, r8
	cmp r0, #0
	beq _08071ED0
_08071EB8:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8071F8C
	movs r2, #0xde
	lsls r2, r2, #2
	mov r0, sb
	adds r1, r7, #0
	bl memcpy
	movs r0, #1
	b _08071ED2
_08071ED0:
	movs r0, #0
_08071ED2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8071EE0
sub_8071EE0: @ 0x08071EE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	movs r0, #0
	mov r8, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	mov sl, r0
	movs r4, #0
_08071EFA:
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	asrs r6, r4, #0xd
	mov r3, sp
	adds r5, r3, r6
	adds r0, r7, #0
	movs r1, #0
	adds r2, r5, #0
	movs r3, #8
	bl ReadFlash
	ldr r1, [r5]
	ldr r0, _08071F84 @ =0x4547474D
	cmp r1, r0
	bne _08071F2C
	add r0, sp, #4
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, r8
	bls _08071F26
	mov sl, r7
	mov r8, r0
_08071F26:
	cmp r0, sb
	bhs _08071F2C
	mov sb, r0
_08071F2C:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071EFA
	mov r3, sb
	cmp r3, #0
	bne _08071F6E
	movs r3, #0
	mov r8, r3
	movs r4, #0
	ldr r2, _08071F88 @ =0x0000FFFF
	add r1, sp, #4
_08071F4A:
	lsls r4, r4, #0x10
	cmp r8, r2
	bhi _08071F60
	asrs r0, r4, #0xd
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, r8
	bls _08071F60
	lsrs r3, r4, #0x10
	mov sl, r3
	mov r8, r0
_08071F60:
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r4, r3
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071F4A
_08071F6E:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071F84: .4byte 0x4547474D
_08071F88: .4byte 0x0000FFFF

	thumb_func_start sub_8071F8C
sub_8071F8C: @ 0x08071F8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #0xde
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	adds r1, r4, #0
	adds r1, #0x20
	adds r0, r5, #0
	adds r0, #0xc
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r5, #8]
	str r0, [r4]
	ldrb r0, [r5, #0x18]
	strb r0, [r4, #6]
	ldrb r1, [r5, #0x19]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08071FC8
	strb r2, [r4, #4]
_08071FC8:
	ldrb r1, [r5, #0x19]
	movs r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _08071FD6
	strb r2, [r4, #5]
_08071FD6:
	ldrb r3, [r5, #0x1a]
	adds r0, r2, #0
	ands r0, r3
	adds r1, r3, #0
	cmp r0, #0
	beq _08071FE4
	strb r2, [r4, #0x19]
_08071FE4:
	movs r0, #6
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08071FF2
	lsrs r0, r0, #0x19
	strb r0, [r4, #0x1a]
_08071FF2:
	movs r7, #8
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08071FFE
	strb r2, [r4, #0x1b]
_08071FFE:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08072008
	strb r2, [r4, #0x15]
_08072008:
	movs r6, #0x20
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08072014
	strb r2, [r4, #0x16]
_08072014:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807201E
	strb r2, [r4, #0x17]
_0807201E:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08072028
	strb r2, [r4, #0x18]
_08072028:
	movs r3, #1
	strb r3, [r4, #0x13]
	ldrb r1, [r5, #0x1b]
	adds r0, r3, #0
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _0807203C
	movs r0, #3
	strb r0, [r4, #0x13]
_0807203C:
	mov r0, r8
	ands r0, r2
	cmp r0, #0
	beq _0807204C
	ldrb r0, [r4, #0x13]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #0x13]
_0807204C:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0807205C
	ldrb r0, [r4, #0x13]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #0x13]
_0807205C:
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	beq _0807206C
	ldrb r0, [r4, #0x13]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #0x13]
_0807206C:
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0807207C
	strb r3, [r4, #0x11]
	b _0807207E
_0807207C:
	strb r0, [r4, #0x11]
_0807207E:
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0807208C
	movs r0, #1
_0807208C:
	strb r0, [r4, #0x12]
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0807209C
	movs r0, #1
_0807209C:
	strb r0, [r4, #0x14]
	ldrb r0, [r5, #0x1c]
	cmp r0, #2
	beq _080720B6
	cmp r0, #2
	bgt _080720AE
	cmp r0, #1
	beq _080720B6
	b _080720B8
_080720AE:
	cmp r0, #4
	bne _080720B8
	movs r0, #0x80
	lsls r0, r0, #1
_080720B6:
	strh r0, [r4, #0x2c]
_080720B8:
	ldrb r0, [r5, #0x1d]
	cmp r0, #2
	beq _080720D0
	cmp r0, #2
	bgt _080720C8
	cmp r0, #1
	beq _080720D0
	b _080720D2
_080720C8:
	cmp r0, #4
	bne _080720D2
	movs r0, #0x80
	lsls r0, r0, #1
_080720D0:
	strh r0, [r4, #0x2e]
_080720D2:
	ldrb r0, [r5, #0x1e]
	cmp r0, #2
	beq _080720EA
	cmp r0, #2
	bgt _080720E2
	cmp r0, #1
	beq _080720EA
	b _080720EC
_080720E2:
	cmp r0, #4
	bne _080720EC
	movs r0, #0x80
	lsls r0, r0, #1
_080720EA:
	strh r0, [r4, #0x30]
_080720EC:
	movs r1, #0
	adds r7, r4, #0
	adds r7, #0xc
	movs r2, #0x24
	adds r2, r2, r5
	mov ip, r2
	movs r3, #0x29
	adds r3, r3, r5
	mov r8, r3
	movs r6, #0x2a
	adds r6, r6, r5
	mov sb, r6
	movs r0, #0x2b
	adds r0, r0, r5
	mov sl, r0
	adds r2, r4, #0
	adds r2, #0x34
	str r2, [sp, #4]
	adds r3, r5, #0
	adds r3, #0x2c
	str r3, [sp]
	adds r6, r4, #7
	subs r3, #0xd
_0807211A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r6, r0
	adds r1, r3, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0807211A
	movs r1, #0
	adds r6, r7, #0
	mov r3, ip
_08072138:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r6, r0
	adds r1, r3, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08072138
	mov r6, r8
	ldrb r0, [r6]
	strb r0, [r4, #0x1c]
	mov r1, sb
	ldrb r0, [r1]
	strb r0, [r4, #0x1d]
	mov r2, sl
	ldrb r0, [r2]
	strb r0, [r4, #0x1e]
	movs r2, #0x9e
	lsls r2, r2, #2
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl memcpy
	movs r3, #0xab
	lsls r3, r3, #2
	adds r0, r4, r3
	movs r6, #0xa9
	lsls r6, r6, #2
	adds r1, r5, r6
	movs r2, #0xc8
	bl memcpy
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r0, r5, r2
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80721A4
sub_80721A4: @ 0x080721A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08072208 @ =gUnknown_03005B64
	ldr r4, [r0]
	ldr r0, _0807220C @ =gUnknown_03005B60
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _08072210 @ =gUnknown_03005B68
	ldr r7, [r0]
	ldrb r0, [r4, #6]
	mov r8, r0
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r5, r4, r0
	ldr r6, [r5]
	adds r0, r4, #0
	bl sub_80717EC
	mov r0, r8
	strb r0, [r4, #6]
	str r6, [r5]
	movs r2, #0xde
	lsls r2, r2, #2
	mov r0, sb
	adds r1, r4, #0
	bl memcpy
	ldr r0, _08072214 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08072204
	str r1, [r7, #4]
	adds r0, r7, #0
	mov r1, sb
	bl sub_80719D0
	adds r0, r7, #0
	movs r1, #0
	bl sub_8071D24
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08072218
_08072204:
	movs r0, #0
	b _08072238
	.align 2, 0
_08072208: .4byte gUnknown_03005B64
_0807220C: .4byte gUnknown_03005B60
_08072210: .4byte gUnknown_03005B68
_08072214: .4byte gUnknown_03001840
_08072218:
	movs r1, #1
_0807221A:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_8072244
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08072204
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _0807221A
	movs r0, #1
_08072238:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8072244
sub_8072244: @ 0x08072244
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r0, _08072324 @ =gUnknown_03001840
	mov r8, r0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	orrs r1, r0
	ldr r2, _08072328 @ =0x04000200
	ldrh r0, [r2]
	str r0, [sp]
	ldr r7, _0807232C @ =0x04000208
	ldrh r0, [r7]
	mov sl, r0
	ldr r2, _08072330 @ =0x04000004
	mov sb, r2
	ldrh r6, [r2]
	movs r0, #0
	ldr r2, _08072328 @ =0x04000200
	strh r0, [r2]
	strh r0, [r7]
	mov r2, sb
	strh r0, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, r8
	str r1, [r0]
	ldr r1, _08072334 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _08072338 @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _0807233C @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _08072340 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	ldr r0, _08072344 @ =EraseFlashSector
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r1, sp
	ldrh r2, [r1]
	ldr r1, _08072328 @ =0x04000200
	strh r2, [r1]
	mov r0, sl
	strh r0, [r7]
	mov r1, sb
	strh r6, [r1]
	bl m4aSoundVSyncOn
	mov r2, r8
	ldr r0, [r2]
	ldr r1, _08072348 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08072324: .4byte gUnknown_03001840
_08072328: .4byte 0x04000200
_0807232C: .4byte 0x04000208
_08072330: .4byte 0x04000004
_08072334: .4byte 0x040000B0
_08072338: .4byte 0x0000C5FF
_0807233C: .4byte 0x00007FFF
_08072340: .4byte 0x040000D4
_08072344: .4byte EraseFlashSector
_08072348: .4byte 0xFFFF7FFF

	thumb_func_start sub_807234C
sub_807234C: @ 0x0807234C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _0807236A
	bl sub_80854DC
	adds r4, r0, #0
	bl sub_80854DC
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	str r4, [r5]
_0807236A:
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r1, #0
	adds r4, r5, #7
	adds r3, r5, #0
	adds r3, #0xc
	movs r6, #0xff
_0807237E:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, r2
	movs r1, #0x1d
	cmp r2, #0
	bne _0807238C
	movs r1, #0x1e
_0807238C:
	strb r1, [r0]
	adds r0, r3, r2
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0807237E
	movs r0, #0x1f
	strb r0, [r5, #0x13]
	movs r0, #1
	strb r0, [r5, #0x11]
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x19]
	movs r1, #2
	strb r1, [r5, #0x1a]
	strb r0, [r5, #0x1b]
	strb r0, [r5, #0x15]
	strb r0, [r5, #0x16]
	strb r0, [r5, #0x17]
	strb r0, [r5, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80723C4
sub_80723C4: @ 0x080723C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08072410 @ =gUnknown_03005B64
	mov r8, r0
	movs r4, #0xde
	lsls r4, r4, #2
	adds r0, r4, #0
	bl EwramMalloc
	mov r1, r8
	str r0, [r1]
	ldr r6, _08072414 @ =gUnknown_03005B60
	adds r0, r4, #0
	bl EwramMalloc
	str r0, [r6]
	ldr r5, _08072418 @ =gUnknown_03005B68
	adds r0, r4, #0
	bl EwramMalloc
	str r0, [r5]
	mov r1, r8
	ldr r0, [r1]
	bl sub_80717EC
	ldr r0, [r6]
	bl sub_80717EC
	ldr r0, [r5]
	bl sub_8071898
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072410: .4byte gUnknown_03005B64
_08072414: .4byte gUnknown_03005B60
_08072418: .4byte gUnknown_03005B68

    thumb_func_start sub_8063940_HasProfile
sub_8063940_HasProfile: @ 0x0807241C
	push {r4, r5, lr}
	sub sp, #0x80
	ldr r0, _08072430 @ =gUnknown_03001840
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08072438
	b _08072464
	.align 2, 0
_08072430: .4byte gUnknown_03001840
_08072434:
	movs r0, #1
	b _08072466
_08072438:
	movs r1, #0
_0807243A:
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r5, r1, #0x10
	lsls r1, r5, #3
	mov r2, sp
	adds r4, r2, r1
	movs r1, #0
	adds r2, r4, #0
	movs r3, #8
	bl ReadFlash
	ldr r1, [r4]
	ldr r0, _08072470 @ =0x4547474D
	cmp r1, r0
	beq _08072434
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _0807243A
_08072464:
	movs r0, #0
_08072466:
	add sp, #0x80
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08072470: .4byte 0x4547474D

	thumb_func_start sub_8072474
sub_8072474: @ 0x08072474
	push {lr}
	bl sub_8071E28
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8072484
sub_8072484: @ 0x08072484
	push {lr}
	bl sub_80724D4
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080724A4
	ldr r0, _080724A0 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _080724A4
	movs r0, #1
	b _080724AC
	.align 2, 0
_080724A0: .4byte gUnknown_03005B64
_080724A4:
	bl sub_8071944
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_080724AC:
	pop {r1}
	bx r1

	thumb_func_start sub_80724B0
sub_80724B0: @ 0x080724B0
	push {lr}
	bl sub_80721A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80724C0
sub_80724C0: @ 0x080724C0
	push {lr}
	ldr r0, _080724D0 @ =gUnknown_03005B64
	ldr r0, [r0]
	bl sub_807234C
	pop {r0}
	bx r0
	.align 2, 0
_080724D0: .4byte gUnknown_03005B64

	thumb_func_start sub_80724D4
sub_80724D4: @ 0x080724D4
	push {r4, r5, lr}
	ldr r0, _080724F0 @ =gUnknown_03005B64
	ldr r2, [r0]
	ldr r0, _080724F4 @ =gUnknown_03005B60
	ldr r1, [r0]
	movs r3, #0
	movs r4, #0xde
	lsls r4, r4, #1
_080724E4:
	ldrh r0, [r2]
	ldrh r5, [r1]
	cmp r0, r5
	beq _080724F8
	movs r0, #1
	b _0807250E
	.align 2, 0
_080724F0: .4byte gUnknown_03005B64
_080724F4: .4byte gUnknown_03005B60
_080724F8:
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r2, #2
	adds r1, #2
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	blt _080724E4
	movs r0, #0
_0807250E:
	pop {r4, r5}
	pop {r1}
	bx r1
