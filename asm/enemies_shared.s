.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; CreateProjectile?
	thumb_func_start sub_8050E04
sub_8050E04: @ 0x08050E04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _08050EC0 @ =sub_805102C
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _08050EC4 @ =sub_80511EC
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x30]
	ldr r0, [r5, #0x10]
	str r0, [r4, #0x34]
	ldr r3, _08050EC8 @ =gSineTable
	ldrh r0, [r5, #6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #8
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	movs r1, #0
	mov r8, r1
	movs r2, #0
	strh r0, [r4, #0x38]
	ldrh r0, [r5, #6]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #8
	ldrsh r0, [r5, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r4, #0x3a]
	ldrh r0, [r5]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0xa]
	ldrb r1, [r5, #4]
	ldr r3, _08050ECC @ =IWRAM_START + 0x20
	adds r0, r6, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r4, #8]
	strh r2, [r4, #0x16]
	strh r2, [r4, #0x18]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08050ED0 @ =IWRAM_START + 0x21
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08050ED4 @ =IWRAM_START + 0x22
	adds r1, r6, r2
	movs r0, #0x10
	strb r0, [r1]
	adds r3, #5
	adds r6, r6, r3
	mov r0, r8
	strb r0, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050EC0: .4byte sub_805102C
_08050EC4: .4byte sub_80511EC
_08050EC8: .4byte gSineTable
_08050ECC: .4byte IWRAM_START + 0x20
_08050ED0: .4byte IWRAM_START + 0x21
_08050ED4: .4byte IWRAM_START + 0x22

	thumb_func_start sub_8050ED8
sub_8050ED8: @ 0x08050ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	ldr r0, _0805100C @ =sub_80510B0
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _08051010 @ =sub_8051200
	str r1, [sp]
	movs r1, #0x68
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	mov r0, r8
	cmp r0, #4
	bls _08050F14
	movs r2, #4
	mov r8, r2
_08050F14:
	ldr r3, _08051014 @ =IWRAM_START + 0x60
	adds r0, r1, r3
	mov r2, r8
	strb r2, [r0]
	movs r6, #0
	subs r3, #0x40
	adds r3, r3, r1
	mov sl, r3
	ldr r0, _08051018 @ =IWRAM_START + 0x21
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r2, _0805101C @ =IWRAM_START + 0x22
	adds r2, r1, r2
	str r2, [sp, #8]
	ldr r3, _08051020 @ =IWRAM_START + 0x25
	adds r3, r1, r3
	str r3, [sp, #0xc]
	cmp r6, r8
	bhs _08050FBA
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08051024 @ =gSineTable
	mov ip, r0
_08050F44:
	lsls r2, r6, #3
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldr r1, [r7, #0xc]
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, [r7, #0x10]
	str r1, [r0]
	lsls r4, r6, #2
	adds r3, r5, #0
	adds r3, #0x50
	adds r3, r3, r4
	mov r1, sb
	muls r1, r6, r1
	ldrh r2, [r7, #6]
	adds r1, r1, r2
	ldr r2, _08051028 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	strh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, ip
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x10]
	movs r2, #8
	ldrsh r0, [r7, r2]
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x52
	adds r2, r2, r4
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #8
	ldrsh r0, [r7, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x61
	adds r0, r0, r6
	movs r1, #1
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r8
	blo _08050F44
_08050FBA:
	ldrh r0, [r7]
	bl VramMalloc
	str r0, [r5, #4]
	ldrh r0, [r7, #2]
	movs r2, #0
	movs r1, #0
	strh r0, [r5, #0xa]
	ldrb r0, [r7, #4]
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x16]
	strh r1, [r5, #0x18]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	movs r0, #0xff
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0x10
	ldr r3, [sp, #8]
	strb r0, [r3]
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805100C: .4byte sub_80510B0
_08051010: .4byte sub_8051200
_08051014: .4byte IWRAM_START + 0x60
_08051018: .4byte IWRAM_START + 0x21
_0805101C: .4byte IWRAM_START + 0x22
_08051020: .4byte IWRAM_START + 0x25
_08051024: .4byte gSineTable
_08051028: .4byte 0x000003FF

	thumb_func_start sub_805102C
sub_805102C: @ 0x0805102C
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805108C @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r5, r4, #0
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #0x34]
	adds r1, r1, r2
	str r1, [r4, #0x34]
	asrs r7, r0, #8
	ldr r2, _08051090 @ =gCamera
	ldr r0, [r2]
	subs r0, r7, r0
	strh r0, [r4, #0x16]
	asrs r6, r1, #8
	ldr r1, [r2, #4]
	subs r2, r6, r1
	strh r2, [r4, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051082
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051082
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08051094
_08051082:
	ldr r0, [r3]
	bl TaskDestroy
	b _080510AA
	.align 2, 0
_0805108C: .4byte gCurTask
_08051090: .4byte gCamera
_08051094:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_800C84C
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_080510AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80510B0
sub_80510B0: @ 0x080510B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080511C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	mov sb, r7
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	ldr r1, _080511C8 @ =IWRAM_START + 0x60
	adds r0, r4, r1
	ldr r2, [sp]
	ldrb r0, [r0]
	cmp r2, r0
	bhs _080511A4
	ldr r3, _080511CC @ =IWRAM_START + 0x61
	adds r3, r4, r3
	str r3, [sp, #4]
_080510E8:
	ldr r0, [sp, #4]
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051190
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	mov r4, sl
	lsls r5, r4, #3
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	adds r2, r0, r5
	lsls r4, r4, #2
	adds r0, r7, #0
	adds r0, #0x50
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r6, r7, #0
	adds r6, #0x34
	adds r3, r6, r5
	adds r0, r7, #0
	adds r0, #0x52
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r2, [r2]
	asrs r2, r2, #8
	ldr r1, _080511D0 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	mov r0, sb
	strh r2, [r0, #0x16]
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r1, r0, r1
	mov r3, sb
	strh r1, [r3, #0x18]
	adds r2, #0x80
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r3, r8
	movs r4, #0xf8
	lsls r4, r4, #1
	cmp r2, r4
	bhi _08051170
	mov r2, sb
	movs r4, #0x18
	ldrsh r0, [r2, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _08051170
	lsls r1, r1, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08051178
_08051170:
	ldr r1, [sp, #4]
	add r1, sl
	movs r0, #0
	strb r0, [r1]
_08051178:
	adds r0, r3, r5
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r0, r6, r5
	ldr r2, [r0]
	asrs r2, r2, #8
	mov r0, sb
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08051190:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp sl, r0
	blo _080510E8
_080511A4:
	ldr r0, [sp]
	cmp r0, #0
	bne _080511B2
	ldr r0, _080511C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080511D4 @ =sub_80511D8
	str r0, [r1, #8]
_080511B2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080511C4: .4byte gCurTask
_080511C8: .4byte IWRAM_START + 0x60
_080511CC: .4byte IWRAM_START + 0x61
_080511D0: .4byte gCamera
_080511D4: .4byte sub_80511D8

	thumb_func_start sub_80511D8
sub_80511D8: @ 0x080511D8
	push {lr}
	ldr r0, _080511E8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080511E8: .4byte gCurTask

	thumb_func_start sub_80511EC
sub_80511EC: @ 0x080511EC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8051200
sub_8051200: @ 0x08051200
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
