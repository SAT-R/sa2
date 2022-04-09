.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
