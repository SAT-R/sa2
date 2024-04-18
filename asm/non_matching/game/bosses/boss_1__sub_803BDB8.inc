.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _0803BE4C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xb4
	adds r0, r0, r1
	mov ip, r0
	ldr r2, _0803BE50 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	movs r3, #0
	str r3, [r0]
	ldr r4, _0803BE54 @ =IWRAM_START + 0x2DC
	adds r2, r1, r4
	movs r0, #5
	strb r0, [r2]
	ldr r5, _0803BE58 @ =IWRAM_START + 0x2DD
	adds r0, r1, r5
	strb r3, [r0]
	ldr r6, _0803BE5C @ =IWRAM_START + 0x2E0
	adds r2, r1, r6
	movs r0, #0x9d
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r2, _0803BE60 @ =IWRAM_START + 0x300
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0803BE64 @ =IWRAM_START + 0x301
	adds r2, r1, r3
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7]
	mov r4, ip
	str r0, [r4, #0xc]
	ldr r0, [r7, #4]
	str r0, [r4, #0x10]
	movs r5, #8
	ldrsh r0, [r7, r5]
	str r0, [r4, #0x14]
	ldr r0, _0803BE68 @ =0xFFFFFD00
	str r0, [r4, #0x18]
	movs r6, #0
	mov r8, r6
	ldr r0, _0803BE6C @ =IWRAM_START + 0x278
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _0803BE70 @ =IWRAM_START + 0x280
	adds r2, r2, r1
	mov sl, r2
	subs r3, #0x85
	adds r3, r1, r3
	str r3, [sp, #0xc]
_0803BE2E:
	mov r4, r8
	lsls r0, r4, #0x18
	asrs r2, r0, #0x18
	adds r3, r0, #0
	cmp r2, #1
	bgt _0803BE78
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r5, [sp, #8]
	adds r1, r5, r1
	ldr r0, [r7]
	ldr r6, _0803BE74 @ =0xFFFFEA00
	adds r0, r0, r6
	b _0803BE8A
	.align 2, 0
_0803BE4C: .4byte gCurTask
_0803BE50: .4byte IWRAM_START + 0xA8
_0803BE54: .4byte IWRAM_START + 0x2DC
_0803BE58: .4byte IWRAM_START + 0x2DD
_0803BE5C: .4byte IWRAM_START + 0x2E0
_0803BE60: .4byte IWRAM_START + 0x300
_0803BE64: .4byte IWRAM_START + 0x301
_0803BE68: .4byte 0xFFFFFD00
_0803BE6C: .4byte IWRAM_START + 0x278
_0803BE70: .4byte IWRAM_START + 0x280
_0803BE74: .4byte 0xFFFFEA00
_0803BE78:
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r0, [sp, #8]
	adds r1, r0, r1
	ldr r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r0, r2
_0803BE8A:
	str r0, [r1]
	asrs r5, r3, #0x18
	lsls r0, r5, #1
	adds r6, r0, r5
	lsls r4, r6, #3
	ldr r0, [sp, #0xc]
	adds r3, r0, r4
	adds r2, r7, #0
	adds r2, #0x98
	ldr r0, [r7, #4]
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3]
	mov sb, r2
	cmp r5, #1
	bgt _0803BEC4
	mov r2, sl
	adds r3, r2, r4
	movs r4, #8
	ldrsh r2, [r7, r4]
	adds r1, r5, #2
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r3]
	b _0803BED2
_0803BEC4:
	mov r5, sl
	adds r0, r5, r4
	movs r2, #8
	ldrsh r1, [r7, r2]
	lsls r2, r6, #4
	adds r1, r1, r2
	str r1, [r0]
_0803BED2:
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #1
	adds r4, r1, r2
	lsls r4, r4, #3
	movs r3, #0xe8
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r4
	movs r0, #0x60
	rsbs r0, r0, #0
	subs r0, r0, r1
	mov r5, sb
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #4
	str r1, [r0]
	movs r0, #0xec
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #0x3c
	str r1, [r0]
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov r8, r6
	asrs r2, r2, #0x18
	cmp r2, #3
	ble _0803BE2E
	movs r0, #0
	mov r8, r0
	mov r1, ip
	adds r1, #0x44
	str r1, [sp, #0x18]
	mov r2, ip
	adds r2, #0x48
	str r2, [sp, #0x1c]
	mov r3, ip
	adds r3, #0x4c
	str r3, [sp, #0x20]
	adds r4, r7, #0
	adds r4, #0x2c
	str r4, [sp, #0x40]
	adds r5, r7, #0
	adds r5, #0xc
	str r5, [sp, #0x3c]
	mov r6, ip
	adds r6, #0x50
	str r6, [sp, #0x24]
	mov r0, ip
	adds r0, #0x54
	str r0, [sp, #0x2c]
	adds r1, #0x14
	str r1, [sp, #0x30]
	adds r2, r7, #0
	adds r2, #0x74
	str r2, [sp, #0x34]
	adds r3, r7, #0
	adds r3, #0x54
	str r3, [sp, #0x28]
	adds r4, #0x5c
	str r4, [sp, #0x38]
	ldr r5, _0803C188 @ =gSineTable
	mov sl, r5
	ldr r6, _0803C18C @ =0x000003FF
	mov sb, r6
_0803BF66:
	mov r0, r8
	lsls r5, r0, #0x18
	asrs r5, r5, #0x18
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r1, [sp, #0x18]
	adds r3, r1, r4
	ldr r0, [r3]
	ldr r2, _0803C190 @ =gCamera
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	ldr r6, [sp, #0x1c]
	adds r2, r6, r4
	ldr r0, [r2]
	ldr r6, _0803C190 @ =gCamera
	ldr r1, [r6, #4]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	lsls r0, r0, #8
	str r0, [r3]
	ldr r0, [r2]
	lsls r0, r0, #8
	str r0, [r2]
	ldr r0, [sp, #0x20]
	adds r0, r0, r4
	mov r8, r0
	movs r2, #8
	ldrsh r1, [r7, r2]
	str r1, [sp, #0x44]
	lsls r2, r5, #2
	ldr r3, [sp, #0x40]
	adds r6, r3, r2
	ldr r0, [r6]
	mov r1, sb
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x3c]
	adds r2, r0, r2
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	ldr r1, [sp, #0x44]
	adds r3, r1, r0
	mov r0, r8
	str r3, [r0]
	ldr r1, [sp, #0x24]
	adds r3, r1, r4
	ldr r0, [r6]
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, sl
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r3]
	ldr r0, [sp, #0x2c]
	adds r1, r0, r4
	movs r0, #3
	str r0, [r1]
	ldr r1, [sp, #0x30]
	adds r4, r1, r4
	movs r0, #0x1e
	str r0, [r4]
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r2, r5, #0x18
	mov r8, r2
	asrs r5, r5, #0x18
	cmp r5, #7
	ble _0803BF66
	ldr r3, [r7]
	str r3, [sp]
	ldr r4, [r7, #4]
	str r4, [sp, #4]
	movs r5, #0
	mov r8, r5
	movs r6, #0x82
	lsls r6, r6, #1
	add r6, ip
	str r6, [sp, #0x10]
	ldr r0, _0803C188 @ =gSineTable
	mov sl, r0
	ldr r1, _0803C18C @ =0x000003FF
	mov sb, r1
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, ip
	str r2, [sp, #0x14]
_0803C02E:
	mov r3, r8
	lsls r4, r3, #0x18
	asrs r4, r4, #0x18
	lsls r5, r4, #1
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r6, [sp, #0x10]
	adds r2, r6, r5
	lsls r6, r4, #2
	ldr r0, [sp, #0x34]
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x28]
	adds r6, r0, r6
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	str r0, [r2]
	ldr r3, [sp, #0x14]
	adds r2, r3, r5
	mov r1, r8
	ldr r0, [r1]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp, #4]
	adds r0, r1, r0
	str r0, [r2]
	movs r3, #0x86
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r5
	str r3, [sp, #0x44]
	movs r3, #8
	ldrsh r2, [r7, r3]
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [sp, #0x44]
	str r2, [r0]
	movs r2, #0x88
	lsls r2, r2, #1
	add r2, ip
	adds r2, r2, r5
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r2]
	movs r0, #0x8a
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #3
	str r1, [r0]
	movs r0, #0x8c
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #0x1e
	str r1, [r0]
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	mov r8, r5
	asrs r4, r4, #0x18
	cmp r4, #7
	ble _0803C02E
	movs r6, #0x87
	lsls r6, r6, #3
	adds r3, r7, r6
	ldr r1, [sp, #0x38]
	ldr r0, [r1]
	ldr r2, _0803C18C @ =0x000003FF
	ands r0, r2
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r5, _0803C188 @ =gSineTable
	adds r0, r0, r5
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	mov r4, ip
	str r0, [r4, #0x1c]
	ldr r5, [sp, #0x38]
	ldr r0, [r5]
	ands r0, r2
	lsls r0, r0, #1
	ldr r6, _0803C188 @ =gSineTable
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r4, [sp, #4]
	adds r0, r4, r0
	mov r5, ip
	str r0, [r5, #0x20]
	movs r6, #8
	ldrsh r0, [r7, r6]
	str r0, [r5, #0x24]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	ldr r2, _0803C194 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r5, #0x28]
	ldrh r1, [r3]
	movs r0, #0x89
	lsls r0, r0, #2
	add r0, ip
	movs r2, #0
	strh r1, [r0]
	movs r0, #1
	str r0, [r5, #0x2c]
	str r2, [r5, #0x30]
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C188: .4byte gSineTable
_0803C18C: .4byte 0x000003FF
_0803C190: .4byte gCamera
_0803C194: .4byte 0xFFFFF800

.syntax divided
