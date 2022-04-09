.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start IdentifyFlash512K
IdentifyFlash512K: @ 0x08096C9C
	push {r4, lr}
	ldr r2, _08096CBC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096CC0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bl ReadFlashId
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _08096CC4 @ =gUnknown_08C86E38
	movs r4, #1
	b _08096CCA
	.align 2, 0
_08096CBC: .4byte 0x04000204
_08096CC0: .4byte 0x0000FFFC
_08096CC4: .4byte gUnknown_08C86E38
_08096CC8:
	adds r2, #4
_08096CCA:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096CDE
	ldrh r0, [r1, #0x28]
	cmp r3, r0
	bne _08096CC8
	movs r4, #0
_08096CDE:
	ldr r1, _08096D18 @ =ProgramFlashSector
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08096D1C @ =gUnknown_03005BA8
	ldr r0, [r2]
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _08096D20 @ =gUnknown_03005BAC
	ldr r0, [r2]
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _08096D24 @ =WaitForFlashWrite
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _08096D28 @ =gFlashMaxTime
	ldr r0, [r2]
	ldr r0, [r0, #0x10]
	str r0, [r1]
	ldr r1, _08096D2C @ =gFlash
	ldr r0, [r2]
	adds r0, #0x14
	str r0, [r1]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08096D18: .4byte ProgramFlashSector
_08096D1C: .4byte gUnknown_03005BA8
_08096D20: .4byte gUnknown_03005BAC
_08096D24: .4byte WaitForFlashWrite
_08096D28: .4byte gFlashMaxTime
_08096D2C: .4byte gFlash

	thumb_func_start WaitForFlashWrite512K_Common
WaitForFlashWrite512K_Common: @ 0x08096D30
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
	bl StartFlashTimer
	ldr r7, _08096D58 @ =PollFlashStatus
	movs r0, #0xc0
	lsls r0, r0, #8
	orrs r4, r0
	lsls r4, r4, #0x10
	b _08096D7C
	.align 2, 0
_08096D58: .4byte PollFlashStatus
_08096D5C:
	ldr r0, _08096D74 @ =gFlash
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0xc2
	bne _08096D6C
	ldr r1, _08096D78 @ =0x0E005555
	movs r0, #0xf0
	strb r0, [r1]
_08096D6C:
	lsrs r4, r4, #0x10
	mov r8, r4
	b _08096DA4
	.align 2, 0
_08096D74: .4byte gFlash
_08096D78: .4byte 0x0E005555
_08096D7C:
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	beq _08096DA4
	ldr r0, _08096DB4 @ =gFlashTimeoutFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096D7C
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	bne _08096D5C
_08096DA4:
	bl StopFlashTimer
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096DB4: .4byte gFlashTimeoutFlag

	thumb_func_start EraseFlashChip_MX
EraseFlashChip_MX: @ 0x08096DB8
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r5, _08096E14 @ =0x04000204
	ldrh r1, [r5]
	ldr r6, _08096E18 @ =0x0000FFFC
	ands r1, r6
	ldr r0, _08096E1C @ =gFlash
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, _08096E20 @ =0x0E005555
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _08096E24 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	bl SetReadFlash1
	ldr r0, _08096E28 @ =WaitForFlashWrite
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
_08096E14: .4byte 0x04000204
_08096E18: .4byte 0x0000FFFC
_08096E1C: .4byte gFlash
_08096E20: .4byte 0x0E005555
_08096E24: .4byte 0x0E002AAA
_08096E28: .4byte WaitForFlashWrite

	thumb_func_start EraseFlashSector_MX
EraseFlashSector_MX: @ 0x08096E2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bhi _08096EB4
	ldr r6, _08096E9C @ =0x04000204
	ldrh r1, [r6]
	ldr r0, _08096EA0 @ =0x0000FFFC
	mov r8, r0
	ands r1, r0
	ldr r0, _08096EA4 @ =gFlash
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
	ldr r1, _08096EA8 @ =0x0E005555
	movs r5, #0xaa
	strb r5, [r1]
	ldr r3, _08096EAC @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, #0x30
	strb r0, [r4]
	mov r0, sp
	bl SetReadFlash1
	ldr r0, _08096EB0 @ =WaitForFlashWrite
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
	b _08096EB6
	.align 2, 0
_08096E9C: .4byte 0x04000204
_08096EA0: .4byte 0x0000FFFC
_08096EA4: .4byte gFlash
_08096EA8: .4byte 0x0E005555
_08096EAC: .4byte 0x0E002AAA
_08096EB0: .4byte WaitForFlashWrite
_08096EB4:
	ldr r0, _08096EC4 @ =0x000080FF
_08096EB6:
	add sp, #0x40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096EC4: .4byte 0x000080FF

	thumb_func_start ProgramByte
ProgramByte: @ 0x08096EC8
	push {r4, lr}
	ldr r4, _08096EF4 @ =0x0E005555
	movs r2, #0xaa
	strb r2, [r4]
	ldr r3, _08096EF8 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r2, #0xa0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, _08096EFC @ =WaitForFlashWrite
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
_08096EF4: .4byte 0x0E005555
_08096EF8: .4byte 0x0E002AAA
_08096EFC: .4byte WaitForFlashWrite

	thumb_func_start ProgramFlashSector_MX
ProgramFlashSector_MX: @ 0x08096F00
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
	bls _08096F20
	ldr r0, _08096F1C @ =0x000080FF
	b _0809700E
	.align 2, 0
_08096F1C: .4byte 0x000080FF
_08096F20:
	ldr r0, _08096F40 @ =gFlash
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	mov r7, r8
	lsls r7, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r7, r7, r0
	ldr r1, _08096F44 @ =sub_8097024+1
	movs r0, #1
	adds r3, r1, #0
	eors r3, r0
	mov r2, sp
	ldr r0, _08096F48 @ =sub_8097048
	subs r0, r0, r1
	b _08096F56
	.align 2, 0
_08096F40: .4byte gFlash
_08096F44: .4byte sub_8097024+1
_08096F48: .4byte sub_8097048
_08096F4C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #2
_08096F56:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096F4C
	movs r4, #0
	b _08096F6C
_08096F62:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x51
	beq _0809700C
_08096F6C:
	mov r0, r8
	bl EraseFlashSector_MX
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08096F62
	adds r0, r7, #0
	mov r1, sp
	adds r1, #1
	bl sub_8097048
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08096F62
	movs r6, #1
	cmp r4, #0
	beq _08096F94
	movs r6, #6
_08096F94:
	movs r4, #1
	cmp r4, r6
	bhi _08096FAA
_08096F9A:
	mov r0, r8
	bl EraseFlashSector_MX
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	bls _08096F9A
_08096FAA:
	mov r0, sp
	bl SetReadFlash1
	ldr r3, _08096FCC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _08096FD0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _08096FD4 @ =gFlash
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _08096FD8 @ =gFlashNumRemainingBytes
	ldr r0, [r2, #4]
	strh r0, [r1]
	adds r4, r1, #0
	b _08096FE8
	.align 2, 0
_08096FCC: .4byte 0x04000204
_08096FD0: .4byte 0x0000FFFC
_08096FD4: .4byte gFlash
_08096FD8: .4byte gFlashNumRemainingBytes
_08096FDC:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	movs r0, #1
	add sb, r0
	adds r7, #1
_08096FE8:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08096FFE
	mov r0, sb
	adds r1, r7, #0
	bl ProgramByte
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08096FDC
_08096FFE:
	ldr r2, _0809701C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08097020 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_0809700C:
	adds r0, r5, #0
_0809700E:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809701C: .4byte 0x04000204
_08097020: .4byte 0x0000FFFC

	thumb_func_start sub_8097024
sub_8097024: @ 0x08097024
	push {lr}
	adds r2, r0, #0
	ldr r0, _08097030 @ =0x03005BA0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	b _08097036
	.align 2, 0
_08097030: .4byte 0x03005BA0
_08097034:
	subs r1, #1
_08097036:
	cmp r1, #0
	beq _08097042
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #0xff
	beq _08097034
_08097042:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8097048
sub_8097048: @ 0x08097048
	push {lr}
	bl _call_via_r1
	cmp r0, #0
	bne _08097056
	movs r0, #0
	b _08097058
_08097056:
	ldr r0, _0809705C @ =0x00008004
_08097058:
	pop {r1}
	bx r1
	.align 2, 0
_0809705C: .4byte 0x00008004
