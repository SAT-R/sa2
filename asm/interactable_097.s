.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807FC20
sub_807FC20: @ 0x0807FC20
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807FC48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FC50
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC4C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x6c]
	b _0807FC64
	.align 2, 0
_0807FC48: .4byte gGameMode
_0807FC4C: .4byte gCamera
_0807FC50:
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC94 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x48]
_0807FC64:
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _0807FC98 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC94: .4byte gCamera
_0807FC98: .4byte 0xFFFFFBFF

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 0x0807FC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FD04
	ldr r5, _0807FCC0 @ =gPlayer
	ldr r1, [r5, #0x20]
	ldr r0, _0807FCC4 @ =0x01400082
	ands r0, r1
	cmp r0, #0
	beq _0807FCC8
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r0, #0
	str r0, [r5, #0x3c]
	b _0807FD06
	.align 2, 0
_0807FCC0: .4byte gPlayer
_0807FCC4: .4byte 0x01400082
_0807FCC8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	beq _0807FCFC
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, _0807FD00 @ =gCamera
	ldr r2, [r0]
	subs r1, r1, r2
	subs r1, #0x1b
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807FD04
	adds r0, r1, #0
	adds r0, #0x36
	cmp r0, r2
	blt _0807FD04
_0807FCFC:
	movs r0, #1
	b _0807FD06
	.align 2, 0
_0807FD00: .4byte gCamera
_0807FD04:
	movs r0, #0
_0807FD06:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807FD0C
sub_807FD0C: @ 0x0807FD0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807FD58 @ =gPlayer
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807FDC4
	adds r0, r4, #0
	adds r0, #0xc
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r3, [r4, #0x48]
	asrs r3, r3, #8
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807FDC4
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807FD5C
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807FDC6
	.align 2, 0
_0807FD58: .4byte gPlayer
_0807FD5C:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807FD7E
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	b _0807FD9E
_0807FD7E:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807FDAA
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0807FD9E:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807FDC6
_0807FDAA:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807FDC4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #1
	b _0807FDC6
_0807FDC4:
	movs r0, #0
_0807FDC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable097
Task_Interactable097: @ 0x0807FDCC
	push {r4, lr}
	ldr r0, _0807FE0C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FE10 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FDE8
	adds r0, r4, #0
	bl sub_807FF04
_0807FDE8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	bne _0807FDF8
	adds r0, r4, #0
	bl sub_807FE34
_0807FDF8:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FE14
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FE1A
	.align 2, 0
_0807FE0C: .4byte gCurTask
_0807FE10: .4byte gGameMode
_0807FE14:
	adds r0, r4, #0
	bl sub_807FC20
_0807FE1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable097
TaskDestructor_Interactable097: @ 0x0807FE20
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807FE34
sub_807FE34: @ 0x0807FE34
	push {r4, lr}
	mov ip, r0
	ldr r3, _0807FE84 @ =gPlayer
	ldr r2, [r3, #8]
	ldr r1, [r0, #0x3c]
	lsls r1, r1, #8
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	subs r2, r2, r0
	mov r0, ip
	adds r0, #0x50
	strh r2, [r0]
	ldr r2, [r3, #0xc]
	mov r0, ip
	ldr r1, [r0, #0x40]
	lsls r1, r1, #8
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	subs r2, r2, r0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	lsls r0, r0, #8
	adds r2, r2, r0
	mov r0, ip
	adds r0, #0x52
	strh r2, [r0]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x4c]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807FE88 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FE8C @ =sub_807FF20
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE84: .4byte gPlayer
_0807FE88: .4byte gCurTask
_0807FE8C: .4byte sub_807FF20

	thumb_func_start sub_807FE90
sub_807FE90: @ 0x0807FE90
	push {lr}
	ldr r2, [r0, #0x3c]
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	ldr r3, _0807FEE0 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r3, #4]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r2, r2, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _0807FEDA
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807FEDA
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807FEE4
_0807FEDA:
	movs r0, #1
	b _0807FEE6
	.align 2, 0
_0807FEE0: .4byte gCamera
_0807FEE4:
	movs r0, #0
_0807FEE6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807FEEC
sub_807FEEC: @ 0x0807FEEC
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807FF00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gCurTask

	thumb_func_start sub_807FF04
sub_807FF04: @ 0x0807FF04
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x48]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start sub_807FF20
sub_807FF20: @ 0x0807FF20
	push {r4, r5, lr}
	ldr r0, _0807FF6C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FF70 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FF3C
	adds r0, r4, #0
	bl sub_807FF04
_0807FF3C:
	ldr r0, _0807FF74 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FF78 @ =0x00024DFF
	cmp r1, r0
	ble _0807FF5A
	adds r0, r4, #0
	bl sub_807FF88
_0807FF5A:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FF7C
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FF82
	.align 2, 0
_0807FF6C: .4byte gCurTask
_0807FF70: .4byte gGameMode
_0807FF74: .4byte IWRAM_START + 0x5C
_0807FF78: .4byte 0x00024DFF
_0807FF7C:
	adds r0, r4, #0
	bl sub_807FC20
_0807FF82:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807FF88
sub_807FF88: @ 0x0807FF88
	ldr r1, _0807FFA4 @ =0x00024E00
	str r1, [r0, #0x44]
	movs r1, #0x90
	lsls r1, r1, #0xa
	str r1, [r0, #0x48]
	adds r0, #0x5e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807FFA8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FFAC @ =sub_807FFB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807FFA4: .4byte 0x00024E00
_0807FFA8: .4byte gCurTask
_0807FFAC: .4byte sub_807FFB0

	thumb_func_start sub_807FFB0
sub_807FFB0: @ 0x0807FFB0
	push {r4, lr}
	ldr r0, _0807FFF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FFF8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FFCC
	adds r0, r4, #0
	bl sub_807FF04
_0807FFCC:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FFFC @ =0x00032DFF
	cmp r1, r0
	ble _0807FFE0
	adds r0, r4, #0
	bl sub_807FA98
_0807FFE0:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _08080000
	adds r0, r4, #0
	bl sub_807FEEC
	b _08080006
	.align 2, 0
_0807FFF4: .4byte gCurTask
_0807FFF8: .4byte gGameMode
_0807FFFC: .4byte 0x00032DFF
_08080000:
	adds r0, r4, #0
	bl sub_807FC20
_08080006:
	pop {r4}
	pop {r0}
	bx r0
