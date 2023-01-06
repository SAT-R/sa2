.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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

	thumb_func_start initSprite_Enemy_Mon
initSprite_Enemy_Mon: @ 0x08051214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sb, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08051314 @ =Task_Enemy_Mon
	ldr r2, _08051318 @ =0x00004010
	ldr r1, _0805131C @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sl, r0
	movs r6, #0xc0
	lsls r6, r6, #0x12
	add r6, sl
	ldr r1, _08051320 @ =IWRAM_START + 0xC
	add r1, sl
	mov r8, r1
	strh r4, [r6, #4]
	strh r5, [r6, #6]
	str r7, [r6]
	ldrb r0, [r7]
	strb r0, [r6, #8]
	mov r3, sb
	strb r3, [r6, #9]
	movs r0, #3
	ldrsb r0, [r7, r0]
	rsbs r2, r0, #0
	orrs r2, r0
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r4, r4, #8
	adds r1, r1, r4
	lsls r1, r1, #8
	str r1, [r6, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r6, #0x40]
	asrs r0, r0, #8
	asrs r1, r1, #8
	lsrs r2, r2, #0x1f
	movs r3, #0
	str r3, [sp]
	ldr r3, _08051324 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	ldr r1, [r6, #0x40]
	adds r1, r1, r0
	str r1, [r6, #0x40]
	movs r1, #0
	mov r0, r8
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r7]
	movs r0, #0x19
	bl VramMalloc
	mov r1, r8
	str r0, [r1, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	movs r3, #0
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r1, _08051328 @ =IWRAM_START + 0x2E
	add r1, sl
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805132C @ =IWRAM_START + 0x31
	add r0, sl
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r3, r8
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r3, #0x10]
	ldr r0, _08051330 @ =0xFFFFFA80
	str r0, [r6, #0x48]
	movs r0, #0
	str r0, [r6, #0x44]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	ldr r0, _08051334 @ =IWRAM_START + 0x2C
	add r0, sl
	strb r1, [r0]
	ldr r1, _08051338 @ =IWRAM_START + 0x2D
	add r1, sl
	movs r0, #0xff
	strb r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051314: .4byte Task_Enemy_Mon
_08051318: .4byte 0x00004010
_0805131C: .4byte TaskDestructor_80095E8
_08051320: .4byte IWRAM_START + 0xC
_08051324: .4byte sub_801EE64
_08051328: .4byte IWRAM_START + 0x2E
_0805132C: .4byte IWRAM_START + 0x31
_08051330: .4byte 0xFFFFFA80
_08051334: .4byte IWRAM_START + 0x2C
_08051338: .4byte IWRAM_START + 0x2D

	thumb_func_start Task_Enemy_Mon
Task_Enemy_Mon: @ 0x0805133C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _08051388 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0xc
	adds r4, r6, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r0, [r5, #0x3c]
	asrs r0, r0, #8
	ldr r2, _0805138C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r5, #0x40]
	asrs r2, r2, #8
	adds r0, r4, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051390
	ldr r0, [r7]
	bl TaskDestroy
	b _08051462
	.align 2, 0
_08051388: .4byte gCurTask
_0805138C: .4byte gCamera
_08051390:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080513B4
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _080513B4
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080513C8
_080513B4:
	ldrb r0, [r5, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080513C4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051462
	.align 2, 0
_080513C4: .4byte gCurTask
_080513C8:
	ldr r0, _08051428 @ =gPlayer
	ldr r3, [r5, #0x3c]
	ldr r2, _0805142C @ =0xFFFF8800
	adds r1, r3, r2
	ldr r2, [r0, #8]
	mov ip, r0
	cmp r2, r1
	ble _08051416
	movs r1, #0xf0
	lsls r1, r1, #7
	adds r0, r3, r1
	cmp r2, r0
	bge _08051416
	ldr r2, [r5, #0x40]
	ldr r3, _08051430 @ =0xFFFFCE00
	adds r0, r2, r3
	mov r3, ip
	ldr r1, [r3, #0xc]
	cmp r1, r0
	ble _08051416
	movs r3, #0xc8
	lsls r3, r3, #6
	adds r0, r2, r3
	cmp r1, r0
	bge _08051416
	ldr r1, [r7]
	ldr r0, _08051434 @ =sub_805146C
	str r0, [r1, #8]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	ldr r0, _08051438 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #2
	strb r0, [r1]
	ldr r2, _0805143C @ =IWRAM_START + 0x2D
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
_08051416:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [r5, #0x3c]
	cmp r1, r0
	bge _08051444
	ldr r0, [r4, #0x10]
	ldr r1, _08051440 @ =0xFFFFFBFF
	ands r0, r1
	b _0805144C
	.align 2, 0
_08051428: .4byte gPlayer
_0805142C: .4byte 0xFFFF8800
_08051430: .4byte 0xFFFFCE00
_08051434: .4byte sub_805146C
_08051438: .4byte IWRAM_START + 0x2C
_0805143C: .4byte IWRAM_START + 0x2D
_08051440: .4byte 0xFFFFFBFF
_08051444:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_0805144C:
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08051462:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805146C
sub_805146C: @ 0x0805146C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _080514B8 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, #0xc
	adds r5, r6, r0
	ldr r1, [r4]
	mov r8, r1
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	ldr r2, _080514BC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0x40]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r4, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r4, #0x40]
	asrs r2, r2, #8
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080514C0
	ldr r0, [r7]
	bl TaskDestroy
	b _08051534
	.align 2, 0
_080514B8: .4byte gCurTask
_080514BC: .4byte gCamera
_080514C0:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080514E4
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080514E4
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080514F8
_080514E4:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080514F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051534
	.align 2, 0
_080514F4: .4byte gCurTask
_080514F8:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x40]
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _0805152E
	ldr r0, _08051540 @ =0xFFFFFA80
	str r0, [r4, #0x48]
	str r1, [r4, #0x44]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	ldr r0, _08051544 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08051548 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0805154C @ =sub_8051550
	str r0, [r1, #8]
_0805152E:
	adds r0, r5, #0
	bl sub_80051E8
_08051534:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051540: .4byte 0xFFFFFA80
_08051544: .4byte IWRAM_START + 0x2C
_08051548: .4byte IWRAM_START + 0x2D
_0805154C: .4byte sub_8051550

	thumb_func_start sub_8051550
sub_8051550: @ 0x08051550
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _080515B0 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, #0xc
	adds r5, r6, r0
	ldr r1, [r4]
	mov r8, r1
	ldr r1, [r4, #0x48]
	adds r1, #0x34
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	ldr r2, _080515B4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r4, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x44]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080515B8
	ldr r0, [r7]
	bl TaskDestroy
	b _0805162A
	.align 2, 0
_080515B0: .4byte gCurTask
_080515B4: .4byte gCamera
_080515B8:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080515DC
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080515DC
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080515F0
_080515DC:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080515EC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805162A
	.align 2, 0
_080515EC: .4byte gCurTask
_080515F0:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	blt _08051612
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	ldr r0, _08051634 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08051638 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0805163C @ =sub_8051640
	str r0, [r1, #8]
_08051612:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0805162A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051634: .4byte IWRAM_START + 0x2C
_08051638: .4byte IWRAM_START + 0x2D
_0805163C: .4byte sub_8051640

	thumb_func_start sub_8051640
sub_8051640: @ 0x08051640
	push {r4, r5, r6, r7, lr}
	ldr r6, _08051688 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r4, r1, r0
	ldr r7, [r5]
	ldr r0, [r5, #0x3c]
	asrs r0, r0, #8
	ldr r2, _0805168C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r5, #0x40]
	asrs r2, r2, #8
	adds r0, r4, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051690
	ldr r0, [r6]
	bl TaskDestroy
	b _08051778
	.align 2, 0
_08051688: .4byte gCurTask
_0805168C: .4byte gCamera
_08051690:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080516B4
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080516B4
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080516C8
_080516B4:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, _080516C4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051778
	.align 2, 0
_080516C4: .4byte gCurTask
_080516C8:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08051772
	ldr r2, _08051714 @ =gPlayer
	ldr r1, [r5, #0x3c]
	ldr r6, _08051718 @ =0xFFFF8800
	adds r0, r1, r6
	ldr r3, [r2, #8]
	cmp r3, r0
	ble _08051754
	movs r6, #0xf0
	lsls r6, r6, #7
	adds r0, r1, r6
	cmp r3, r0
	bge _08051754
	ldr r5, [r5, #0x40]
	ldr r6, _0805171C @ =0xFFFFCE00
	adds r0, r5, r6
	ldr r2, [r2, #0xc]
	cmp r2, r0
	ble _08051754
	movs r6, #0xc8
	lsls r6, r6, #6
	adds r0, r5, r6
	cmp r2, r0
	bge _08051754
	cmp r3, r1
	bge _08051724
	ldr r0, [r4, #0x10]
	ldr r1, _08051720 @ =0xFFFFFBFF
	ands r0, r1
	b _0805172C
	.align 2, 0
_08051714: .4byte gPlayer
_08051718: .4byte 0xFFFF8800
_0805171C: .4byte 0xFFFFCE00
_08051720: .4byte 0xFFFFFBFF
_08051724:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_0805172C:
	str r0, [r4, #0x10]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805174C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051750 @ =sub_805146C
	b _08051770
	.align 2, 0
_0805174C: .4byte gCurTask
_08051750: .4byte sub_805146C
_08051754:
	movs r1, #0
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08051780 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051784 @ =Task_Enemy_Mon
_08051770:
	str r0, [r1, #8]
_08051772:
	adds r0, r4, #0
	bl sub_80051E8
_08051778:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051780: .4byte gCurTask
_08051784: .4byte Task_Enemy_Mon

	thumb_func_start initSprite_Enemy_Gohla
initSprite_Enemy_Gohla: @ 0x08051788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, _080517F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080517B6
	ldr r0, _080517F8 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080517B6
	b _0805190C
_080517B6:
	ldr r0, _080517FC @ =sub_8051928
	ldr r2, _08051800 @ =0x00004040
	ldr r1, _08051804 @ =sub_8051E20
	str r1, [sp]
	movs r1, #0x90
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sl, r0
	ldr r0, _08051808 @ =IWRAM_START + 0xC
	adds r7, r1, r0
	mov r2, sl
	strh r5, [r2, #4]
	mov r0, sb
	strh r0, [r2, #6]
	str r6, [r2]
	ldrb r0, [r6]
	strb r0, [r2, #8]
	strb r4, [r2, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08051810
	ldr r2, _0805180C @ =IWRAM_START + 0x8C
	adds r1, r1, r2
	movs r0, #1
	b _08051816
	.align 2, 0
_080517F4: .4byte gGameMode
_080517F8: .4byte gUnknown_030054EC
_080517FC: .4byte sub_8051928
_08051800: .4byte 0x00004040
_08051804: .4byte sub_8051E20
_08051808: .4byte IWRAM_START + 0xC
_0805180C: .4byte IWRAM_START + 0x8C
_08051810:
	ldr r0, _0805191C @ =IWRAM_START + 0x8C
	adds r1, r1, r0
	movs r0, #0
_08051816:
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #3
	lsls r5, r5, #8
	mov r8, r5
	add r1, r8
	lsls r1, r1, #8
	mov r2, sl
	str r1, [r2, #0x74]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r5, r2, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	mov r2, sl
	str r0, [r2, #0x78]
	movs r4, #0
	str r4, [r2, #0x7c]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, #0x8c
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _08051920 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	mov r1, sl
	adds r1, #0x80
	lsls r0, r0, #8
	str r0, [r1]
	mov r0, sl
	adds r0, #0x84
	str r4, [r0]
	adds r0, #4
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, r8
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r0, #9
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08051924 @ =0x000001E3
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r2, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	mov sb, r0
	str r0, [r7, #0x10]
	mov r7, sl
	adds r7, #0x44
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #6
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf2
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x64
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x65
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x66
	movs r2, #0x10
	strb r2, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	mov r2, r8
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
_0805190C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805191C: .4byte IWRAM_START + 0x8C
_08051920: .4byte sub_801EE64
_08051924: .4byte 0x000001E3

	thumb_func_start sub_8051928
sub_8051928: @ 0x08051928
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805195C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r1, [r4]
	mov sl, r1
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08051960
	ldr r0, [r4, #0x7c]
	adds r0, #0x80
	b _08051964
	.align 2, 0
_0805195C: .4byte gCurTask
_08051960:
	ldr r0, [r4, #0x7c]
	subs r0, #0x80
_08051964:
	str r0, [r4, #0x7c]
	movs r2, #0x80
	adds r2, r2, r4
	mov r8, r2
	ldr r0, [r4, #0x78]
	ldr r1, [r2]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x74]
	ldr r2, [r4, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r3, #0x8c
	adds r3, r3, r4
	mov sb, r3
	ldrb r2, [r3]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08051A64 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080519BC
	lsls r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r4, #0x78]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x74]
	ldr r2, [r4, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _08051A68 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_080519BC:
	cmp r0, #0
	ble _080519CA
	lsls r1, r0, #8
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_080519CA:
	ldr r1, [r4, #0x74]
	ldr r0, [r4, #0x7c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r4, #0x78]
	mov r3, r8
	ldr r0, [r3]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r3, _08051A6C @ =gCamera
	ldr r0, [r3]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	adds r0, r4, #0
	str r3, [sp, #8]
	bl sub_8051DC8
	lsls r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #0
	bne _08051A5A
	ldr r0, [r4, #0x74]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _08051A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08051A30
	ldr r0, [r4, #0x78]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08051A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08051A74
_08051A30:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051A54
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051A54
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08051A74
_08051A54:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
_08051A5A:
	ldr r0, _08051A70 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051AD2
	.align 2, 0
_08051A64: .4byte sub_801EE64
_08051A68: .4byte sub_801EC3C
_08051A6C: .4byte gCamera
_08051A70: .4byte gCurTask
_08051A74:
	ldr r0, [r4, #0x7c]
	asrs r2, r0, #8
	mov r0, sl
	movs r1, #3
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	cmp r2, r0
	ble _08051A90
	mov r3, sl
	ldrb r0, [r3, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _08051AAA
_08051A90:
	ldr r0, _08051AE4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051AE8 @ =sub_8051AF0
	str r0, [r1, #8]
	ldr r0, _08051AEC @ =0x000001E3
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08051AAA:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x16
	ldrsh r1, [r5, r0]
	ldrh r2, [r5, #0x18]
	subs r2, #4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r5, #0x10]
	adds r0, r4, #0
	bl sub_8051CB8
_08051AD2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051AE4: .4byte gCurTask
_08051AE8: .4byte sub_8051AF0
_08051AEC: .4byte 0x000001E3

	thumb_func_start sub_8051AF0
sub_8051AF0: @ 0x08051AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08051BB0 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	ldr r2, _08051BB4 @ =IWRAM_START + 0xC
	adds r4, r3, r2
	ldr r0, [r5]
	str r0, [sp, #4]
	ldr r1, _08051BB8 @ =IWRAM_START + 0x80
	adds r1, r1, r3
	mov r8, r1
	ldr r0, [r5, #0x78]
	ldr r1, [r1]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _08051BBC @ =IWRAM_START + 0x8C
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	ldr r3, _08051BC0 @ =sub_801EC3C
	mov sl, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08051B64
	lsls r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5, #0x78]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	mov r3, sl
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08051B64:
	cmp r0, #0
	ble _08051B72
	lsls r1, r0, #8
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08051B72:
	ldr r1, [r5, #0x74]
	ldr r0, [r5, #0x7c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r5, #0x78]
	mov r3, r8
	ldr r0, [r3]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r3, _08051BC4 @ =gCamera
	ldr r0, [r3]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r4, #0x18]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl sub_8051DC8
	lsls r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #0
	beq _08051BC8
	ldr r1, _08051BB0 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08051C9A
	.align 2, 0
_08051BB0: .4byte gCurTask
_08051BB4: .4byte IWRAM_START + 0xC
_08051BB8: .4byte IWRAM_START + 0x80
_08051BBC: .4byte IWRAM_START + 0x8C
_08051BC0: .4byte sub_801EC3C
_08051BC4: .4byte gCamera
_08051BC8:
	ldr r0, [r5, #0x74]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _08051BFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08051BFA
	ldr r0, [r5, #0x78]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08051BFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08051C34
_08051BFA:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051C1E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051C1E
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08051C34
_08051C1E:
	ldrb r0, [r5, #8]
	ldr r3, [sp, #4]
	strb r0, [r3]
	ldr r0, _08051C30 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051C9A
	.align 2, 0
_08051C30: .4byte gCurTask
_08051C34:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08051C80
	ldr r1, [r4, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08051C60
	ldr r0, _08051C5C @ =0xFFFFFBFF
	ands r1, r0
	b _08051C62
	.align 2, 0
_08051C5C: .4byte 0xFFFFFBFF
_08051C60:
	orrs r1, r2
_08051C62:
	str r1, [r4, #0x10]
	movs r1, #0
	ldr r0, _08051CAC @ =0x000001E3
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08051CB0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051CB4 @ =sub_8051928
	str r0, [r1, #8]
_08051C80:
	adds r0, r4, #0
	bl sub_80051E8
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x18]
	subs r2, #4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r4, #0x10]
	adds r0, r5, #0
	bl sub_8051CB8
_08051C9A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051CAC: .4byte 0x000001E3
_08051CB0: .4byte gCurTask
_08051CB4: .4byte sub_8051928

	thumb_func_start sub_8051CB8
sub_8051CB8: @ 0x08051CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r5, r7, #0
	adds r5, #0x44
	adds r0, r5, #0
	bl sub_8004558
	adds r1, r7, #0
	adds r1, #0x88
	ldrh r0, [r1]
	adds r0, #0x18
	ldr r3, _08051D08 @ =0x000003FF
	adds r2, r3, #0
	ands r0, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	adds r0, #0x20
	ands r0, r2
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r4, r1
	cmp r4, #0
	beq _08051D0C
	ldr r0, [r5, #0x10]
	orrs r0, r1
	b _08051D12
	.align 2, 0
_08051D08: .4byte 0x000003FF
_08051D0C:
	ldr r0, [r5, #0x10]
	ldr r1, _08051D8C @ =0xFFFFFBFF
	ands r0, r1
_08051D12:
	str r0, [r5, #0x10]
	movs r6, #0
	adds r0, r7, #0
	adds r0, #0x88
	str r0, [sp, #4]
	adds r7, #0x8a
	mov sl, r7
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	mov r4, sp
	ldr r7, _08051D90 @ =0x000003FF
	adds r3, r7, #0
_08051D32:
	lsls r2, r6, #8
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	adds r2, r2, r0
	ands r2, r3
	strh r2, [r4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #7
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r0, r1
	ands r0, r3
	strh r0, [r4, #2]
	ldrh r0, [r4]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _08051D94 @ =gSineTable
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1a
	mov r7, sb
	asrs r0, r7, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x16]
	ldrh r0, [r4, #2]
	lsls r0, r0, #1
	ldr r1, _08051D94 @ =gSineTable
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1d
	mov r7, r8
	asrs r0, r7, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, _08051D98 @ =0x000001FF
	cmp r2, r0
	bls _08051D9C
	movs r0, #0x88
	lsls r0, r0, #3
	b _08051DA0
	.align 2, 0
_08051D8C: .4byte 0xFFFFFBFF
_08051D90: .4byte 0x000003FF
_08051D94: .4byte gSineTable
_08051D98: .4byte 0x000001FF
_08051D9C:
	movs r0, #0x98
	lsls r0, r0, #3
_08051DA0:
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl sub_80051E8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #8]
	cmp r6, #3
	bls _08051D32
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8051DC8
sub_8051DC8: @ 0x08051DC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r1, #0
	adds r7, r2, #0
	adds r5, r0, #0
	adds r5, #0xc
	movs r0, #0
	mov r8, r0
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051DEE
	movs r0, #1
	mov r8, r0
	b _08051E0C
_08051DEE:
	ldr r4, _08051E1C @ =gPlayer
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
_08051E0C:
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08051E1C: .4byte gPlayer

	thumb_func_start sub_8051E20
sub_8051E20: @ 0x08051E20
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x48]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_KuraKura
initSprite_Enemy_KuraKura: @ 0x08051E3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	mov r8, r2
	mov sl, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sl
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	ldr r0, _08051FD4 @ =sub_8052024
	ldr r2, _08051FD8 @ =0x00004050
	ldr r1, _08051FDC @ =sub_8052264
	str r1, [sp]
	movs r1, #0xb4
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, _08051FE0 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	adds r2, #0xa4
	adds r0, r4, r2
	movs r5, #0
	str r5, [r0]
	subs r2, #4
	adds r0, r4, r2
	str r5, [r0]
	strh r6, [r1, #4]
	mov r0, r8
	strh r0, [r1, #6]
	mov r2, sb
	str r2, [r1]
	ldrb r0, [r2]
	strb r0, [r1, #8]
	mov r0, sl
	strb r0, [r1, #9]
	ldr r2, _08051FE4 @ =IWRAM_START + 0xA4
	adds r1, r4, r2
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	lsls r0, r0, #8
	str r0, [r1]
	ldr r0, _08051FE8 @ =IWRAM_START + 0xA8
	adds r1, r4, r0
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r0, r8
	lsls r0, r0, #8
	str r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r6
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	add r0, r8
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	movs r0, #8
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08051FEC @ =0x000001E5
	strh r0, [r7, #0xa]
	ldr r1, _08051FF0 @ =IWRAM_START + 0x2C
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _08051FF4 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08051FF8 @ =IWRAM_START + 0x2E
	adds r0, r4, r1
	movs r2, #0x10
	mov sb, r2
	mov r1, sb
	strb r1, [r0]
	ldr r2, _08051FFC @ =IWRAM_START + 0x31
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	str r2, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	ldr r0, _08052000 @ =IWRAM_START + 0x3C
	adds r7, r4, r0
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r0, #1
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf3
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r1, _08052004 @ =IWRAM_START + 0x5C
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _08052008 @ =IWRAM_START + 0x5D
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0805200C @ =IWRAM_START + 0x5E
	adds r0, r4, r1
	mov r2, sb
	strb r2, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	mov r0, r8
	str r0, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _08052010 @ =IWRAM_START + 0x6C
	adds r7, r4, r1
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08052014 @ =0x000001E7
	strh r0, [r7, #0xa]
	ldr r2, _08052018 @ =IWRAM_START + 0x8C
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #1
	adds r1, r4, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0805201C @ =IWRAM_START + 0x8E
	adds r0, r4, r1
	mov r2, sb
	strb r2, [r0]
	ldr r0, _08052020 @ =IWRAM_START + 0x91
	adds r4, r4, r0
	movs r1, #0
	strb r1, [r4]
	mov r2, r8
	str r2, [r7, #0x28]
	str r6, [r7, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051FD4: .4byte sub_8052024
_08051FD8: .4byte 0x00004050
_08051FDC: .4byte sub_8052264
_08051FE0: .4byte IWRAM_START + 0xC
_08051FE4: .4byte IWRAM_START + 0xA4
_08051FE8: .4byte IWRAM_START + 0xA8
_08051FEC: .4byte 0x000001E5
_08051FF0: .4byte IWRAM_START + 0x2C
_08051FF4: .4byte IWRAM_START + 0x2D
_08051FF8: .4byte IWRAM_START + 0x2E
_08051FFC: .4byte IWRAM_START + 0x31
_08052000: .4byte IWRAM_START + 0x3C
_08052004: .4byte IWRAM_START + 0x5C
_08052008: .4byte IWRAM_START + 0x5D
_0805200C: .4byte IWRAM_START + 0x5E
_08052010: .4byte IWRAM_START + 0x6C
_08052014: .4byte 0x000001E7
_08052018: .4byte IWRAM_START + 0x8C
_0805201C: .4byte IWRAM_START + 0x8E
_08052020: .4byte IWRAM_START + 0x91

	thumb_func_start sub_8052024
sub_8052024: @ 0x08052024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08052088 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _0805208C @ =IWRAM_START + 0xC
	adds r6, r2, r1
	ldr r0, [r0]
	mov sl, r0
	adds r1, #0x98
	adds r0, r2, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r0, _08052090 @ =IWRAM_START + 0xA8
	adds r2, r2, r0
	ldr r2, [r2]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r7, _08052094 @ =gCamera
	ldr r0, [r7]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r3, _08052098 @ =0xFFFFFBFF
	ands r0, r3
	str r0, [r6, #0x10]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _0805209C
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _0805212E
	.align 2, 0
_08052088: .4byte gCurTask
_0805208C: .4byte IWRAM_START + 0xC
_08052090: .4byte IWRAM_START + 0xA8
_08052094: .4byte gCamera
_08052098: .4byte 0xFFFFFBFF
_0805209C:
	ldr r1, [r7]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _080520C2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _080520C2
	ldr r1, [r7, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _080520C2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _080520FC
_080520C2:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080520E6
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080520E6
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080520FC
_080520E6:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _080520F8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805212E
	.align 2, 0
_080520F8: .4byte gCurTask
_080520FC:
	mov r0, r8
	adds r0, #0xa4
	ldr r0, [r0]
	mov r1, r8
	adds r1, #0xa8
	ldr r1, [r1]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	mov r0, r8
	bl sub_805213C
_0805212E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805213C
sub_805213C: @ 0x0805213C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	adds r0, #0x3c
	str r0, [sp, #0x14]
	movs r2, #0x6c
	adds r2, r2, r4
	mov sb, r2
	adds r3, r4, #0
	adds r3, #0xac
	ldr r2, _08052254 @ =gSineTable
	ldr r0, _08052258 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #2
	ldr r1, _0805225C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	ands r0, r1
	str r0, [r3]
	movs r5, #0
	mov r8, r2
	adds r6, r3, #0
	ldr r3, _08052260 @ =gCamera
	adds r7, r4, #0
	adds r7, #0xa8
	str r7, [sp, #0xc]
	str r6, [sp, #8]
	movs r0, #0xa4
	adds r0, r0, r4
	mov sl, r0
_08052188:
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r6]
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0xb
	subs r2, r2, r5
	asrs r0, r2
	adds r1, r1, r0
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r7, [sp, #0x14]
	strh r1, [r7, #0x16]
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r6]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	asrs r0, r2
	adds r1, r1, r0
	ldr r0, [r3, #4]
	subs r1, r1, r0
	ldr r0, [sp, #0x14]
	strh r1, [r0, #0x18]
	ldr r0, [sp, #0x14]
	str r3, [sp, #0x10]
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x10]
	cmp r5, #1
	bls _08052188
	mov r2, sl
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r4, _08052254 @ =gSineTable
	ldr r7, [sp, #8]
	ldr r3, [r7]
	lsls r0, r3, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x19
	adds r1, r1, r2
	asrs r0, r0, #0x1b
	subs r1, r1, r0
	str r1, [sp]
	ldr r0, [sp, #0xc]
	ldr r2, [r0]
	asrs r2, r2, #8
	movs r7, #0x80
	lsls r7, r7, #1
	adds r3, r3, r7
	lsls r3, r3, #1
	adds r3, r3, r4
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x19
	adds r2, r2, r3
	asrs r0, r0, #0x1b
	subs r2, r2, r0
	str r2, [sp, #4]
	ldr r3, _08052260 @ =gCamera
	ldr r0, [r3]
	adds r4, r1, #0
	subs r0, r4, r0
	mov r7, sb
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	strh r0, [r7, #0x18]
	mov r0, sb
	bl sub_800C84C
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052254: .4byte gSineTable
_08052258: .4byte gUnknown_03005590
_0805225C: .4byte 0x000003FF
_08052260: .4byte gCamera

	thumb_func_start sub_8052264
sub_8052264: @ 0x08052264
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start initSprite_Enemy_Kobinaga
initSprite_Enemy_Kobinaga: @ 0x08052288
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080523C4 @ =sub_80524D0
	ldr r2, _080523C8 @ =0x00004060
	ldr r1, _080523CC @ =sub_8052F70
	str r1, [sp]
	movs r1, #0xc4
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov sl, r0
	ldr r1, _080523D0 @ =IWRAM_START + 0xC
	adds r7, r4, r1
	ldr r2, _080523D4 @ =IWRAM_START + 0xB8
	adds r0, r4, r2
	movs r3, #0
	strh r3, [r0]
	adds r1, #0xae
	adds r0, r4, r1
	strh r3, [r0]
	adds r2, #6
	adds r0, r4, r2
	strh r3, [r0]
	subs r1, #0xa
	adds r0, r4, r1
	str r3, [r0]
	subs r2, #0xa
	adds r0, r4, r2
	str r3, [r0]
	ldr r0, _080523D8 @ =IWRAM_START + 0xC0
	adds r0, r4, r0
	str r0, [sp, #4]
	movs r1, #0
	strb r1, [r0]
	mov r2, sl
	strh r5, [r2, #4]
	strh r6, [r2, #6]
	mov r0, sb
	str r0, [r2]
	ldrb r0, [r0]
	strb r0, [r2, #8]
	mov r1, r8
	strb r1, [r2, #9]
	ldr r2, _080523DC @ =IWRAM_START + 0xA8
	adds r1, r4, r2
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1]
	ldr r0, _080523E0 @ =IWRAM_START + 0xAC
	adds r1, r4, r0
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	lsls r0, r0, #8
	str r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	adds r0, r0, r6
	strh r0, [r7, #0x18]
	movs r0, #6
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r2, _080523E4 @ =gUnknown_080D8F30
	mov r0, sb
	ldrb r1, [r0, #3]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	mov r0, sb
	ldrb r1, [r0, #3]
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _080523E8 @ =IWRAM_START + 0x2C
	adds r0, r4, r2
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	ldr r0, _080523EC @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r4, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080523F0 @ =IWRAM_START + 0x31
	adds r4, r4, r0
	movs r1, #0
	strb r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	mov r2, sb
	ldrb r1, [r2, #3]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080523FA
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080523F4
	ldr r0, [sp, #4]
	strb r5, [r0]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r7, #0x10]
	b _080523FA
	.align 2, 0
_080523C4: .4byte sub_80524D0
_080523C8: .4byte 0x00004060
_080523CC: .4byte sub_8052F70
_080523D0: .4byte IWRAM_START + 0xC
_080523D4: .4byte IWRAM_START + 0xB8
_080523D8: .4byte IWRAM_START + 0xC0
_080523DC: .4byte IWRAM_START + 0xA8
_080523E0: .4byte IWRAM_START + 0xAC
_080523E4: .4byte gUnknown_080D8F30
_080523E8: .4byte IWRAM_START + 0x2C
_080523EC: .4byte IWRAM_START + 0x2D
_080523F0: .4byte IWRAM_START + 0x31
_080523F4:
	movs r0, #2
	ldr r1, [sp, #4]
	strb r0, [r1]
_080523FA:
	adds r0, r7, #0
	bl sub_8004558
	mov r7, sl
	adds r7, #0x6c
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _080524C4 @ =0x000001E9
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x8c
	strb r5, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x8d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x8e
	movs r2, #0x10
	mov r8, r2
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	subs r7, #0x30
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf4
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r1, sl
	adds r1, #0x5c
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, #1
	adds r0, r6, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x5e
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	str r6, [r7, #0x28]
	ldr r2, _080524C8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080524CC @ =0x00002060
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sb
	strb r0, [r2]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080524C4: .4byte 0x000001E9
_080524C8: .4byte gUnknown_030054B8
_080524CC: .4byte 0x00002060

	thumb_func_start sub_80524D0
sub_80524D0: @ 0x080524D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, _0805252C @ =gCurTask
	ldr r0, [r5]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _08052530 @ =IWRAM_START + 0xC
	adds r0, r0, r2
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	mov sl, r1
	ldr r3, _08052534 @ =IWRAM_START + 0xA8
	adds r0, r2, r3
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r0, _08052538 @ =IWRAM_START + 0xAC
	adds r2, r2, r0
	ldr r2, [r2]
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r4, _0805253C @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r3, r8
	strh r0, [r3, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	mov r0, r8
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052540
	ldr r0, [r5]
	bl TaskDestroy
	b _080526BA
	.align 2, 0
_0805252C: .4byte gCurTask
_08052530: .4byte IWRAM_START + 0xC
_08052534: .4byte IWRAM_START + 0xA8
_08052538: .4byte IWRAM_START + 0xAC
_0805253C: .4byte gCamera
_08052540:
	ldr r1, [r4]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r6, r0
	bgt _08052568
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	blt _08052568
	ldr r1, [r4, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r7, r0
	bgt _08052568
	adds r0, r1, #0
	subs r0, #0x80
	cmp r7, r0
	bge _080525A4
_08052568:
	mov r3, r8
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805258E
	movs r5, #0x18
	ldrsh r0, [r3, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0805258E
	movs r0, #0x18
	ldrsh r1, [r3, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080525A4
_0805258E:
	mov r1, sb
	ldrb r0, [r1, #8]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _080525A0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080526BA
	.align 2, 0
_080525A0: .4byte gCurTask
_080525A4:
	mov r5, sb
	adds r5, #0xa8
	ldr r0, [r5]
	mov r4, sb
	adds r4, #0xac
	ldr r1, [r4]
	bl sub_80122DC
	mov r1, sb
	adds r1, #0xb8
	ldrh r0, [r1]
	mov ip, r0
	mov sl, r5
	cmp r0, #0
	beq _080525C8
	subs r0, #1
	strh r0, [r1]
	b _0805267C
_080525C8:
	ldr r3, _0805261C @ =gPlayer
	mov r5, sl
	ldr r2, [r5]
	ldr r1, _08052620 @ =0xFFFF8800
	adds r0, r2, r1
	ldr r1, [r3, #8]
	cmp r1, r0
	ble _0805267C
	movs r5, #0xf0
	lsls r5, r5, #7
	adds r0, r2, r5
	cmp r1, r0
	bge _0805267C
	ldr r2, [r4]
	ldr r1, _08052624 @ =0xFFFF9C00
	adds r0, r2, r1
	ldr r1, [r3, #0xc]
	cmp r1, r0
	ble _0805267C
	movs r5, #0xc8
	lsls r5, r5, #7
	adds r0, r2, r5
	cmp r1, r0
	bge _0805267C
	mov r0, sb
	adds r0, #0xbe
	mov r1, ip
	strh r1, [r0]
	adds r0, #2
	ldrb r1, [r0]
	cmp r1, #0
	bne _08052628
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r7
	adds r0, #0xa
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	subs r1, r1, r6
	b _08052656
	.align 2, 0
_0805261C: .4byte gPlayer
_08052620: .4byte 0xFFFF8800
_08052624: .4byte 0xFFFF9C00
_08052628:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08052644
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	subs r1, r1, r6
	adds r1, #0xa
	b _08052656
_08052644:
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	subs r1, r1, r6
	subs r1, #0xa
_08052656:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	mov r1, sb
	adds r1, #0xba
	strh r0, [r1]
	mov r1, sb
	adds r1, #0xb0
	mov r2, sl
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, _080526A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080526A4 @ =sub_80526C8
	str r0, [r1, #8]
_0805267C:
	mov r0, r8
	bl sub_80051E8
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080526A8
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r3, #0x10]
	mov r0, r8
	bl sub_80051E8
	b _080526BA
	.align 2, 0
_080526A0: .4byte gCurTask
_080526A4: .4byte sub_80526C8
_080526A8:
	mov r5, r8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	eors r0, r1
	str r0, [r5, #0x10]
	mov r0, r8
	bl sub_80051E8
_080526BA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80526C8
sub_80526C8: @ 0x080526C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r1, _08052784 @ =gCurTask
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r2, _08052788 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	ldr r0, _0805278C @ =IWRAM_START + 0x3C
	adds r0, r0, r4
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	adds r2, #0x9c
	adds r0, r4, r2
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r5, r1, #0
	adds r2, #4
	adds r0, r4, r2
	ldr r2, [r0]
	asrs r2, r2, #8
	str r2, [sp, #0x18]
	adds r6, r2, #0
	ldr r2, _08052790 @ =IWRAM_START + 0xB0
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #4]
	adds r2, #4
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, _08052794 @ =gCamera
	mov sl, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r2, sl
	ldr r0, [r2, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	mov r0, sp
	ldrh r2, [r0, #4]
	strh r2, [r0, #0x14]
	mov r0, sl
	ldr r0, [r0]
	mov ip, r0
	mov r0, sp
	ldrh r2, [r0, #0x14]
	mov r0, ip
	subs r2, r2, r0
	mov r0, sb
	strh r2, [r0, #0x16]
	mov r2, sl
	ldr r2, [r2, #4]
	mov ip, r2
	mov r2, sp
	ldrh r0, [r2, #0x14]
	mov r2, ip
	subs r0, r0, r2
	mov r2, sb
	strh r0, [r2, #0x18]
	ldr r0, _08052798 @ =IWRAM_START + 0xBE
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	adds r0, r7, #0
	ldr r2, [sp, #0x18]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _0805279C
	ldr r1, _08052784 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _0805289A
	.align 2, 0
_08052784: .4byte gCurTask
_08052788: .4byte IWRAM_START + 0xC
_0805278C: .4byte IWRAM_START + 0x3C
_08052790: .4byte IWRAM_START + 0xB0
_08052794: .4byte gCamera
_08052798: .4byte IWRAM_START + 0xBE
_0805279C:
	mov r0, sb
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080527BC
	ldr r2, _080527B8 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _0805289A
	.align 2, 0
_080527B8: .4byte gCurTask
_080527BC:
	mov r0, sl
	ldr r1, [r0]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _080527E6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	blt _080527E6
	mov r0, sl
	ldr r1, [r0, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r6, r0
	bgt _080527E6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	bge _08052820
_080527E6:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805280A
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805280A
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08052820
_0805280A:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _0805281C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805289A
	.align 2, 0
_0805281C: .4byte gCurTask
_08052820:
	mov r0, r8
	adds r0, #0xa8
	ldr r0, [r0]
	mov r1, r8
	adds r1, #0xac
	ldr r1, [r1]
	bl sub_80122DC
	mov r2, r8
	adds r2, #0xbe
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _08052878 @ =0x000043FF
	cmp r1, r0
	ble _08052854
	mov r1, r8
	adds r1, #0xb8
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #0x88
	lsls r0, r0, #7
	strh r0, [r2]
	ldr r0, _0805287C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08052880 @ =sub_80528AC
	str r0, [r1, #8]
_08052854:
	adds r0, r7, #0
	bl sub_80051E8
	adds r0, r7, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08052884
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
	b _08052894
	.align 2, 0
_08052878: .4byte 0x000043FF
_0805287C: .4byte gCurTask
_08052880: .4byte sub_80528AC
_08052884:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_08052894:
	mov r0, r8
	bl sub_8052CC8
_0805289A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80528AC
sub_80528AC: @ 0x080528AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _08052944 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov sb, r0
	ldr r2, _08052948 @ =IWRAM_START + 0xC
	adds r2, r2, r3
	mov r8, r2
	ldr r6, _0805294C @ =IWRAM_START + 0x3C
	adds r6, r6, r3
	mov sl, r6
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r1, _08052950 @ =IWRAM_START + 0xA8
	adds r0, r3, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, _08052954 @ =IWRAM_START + 0xAC
	adds r0, r3, r2
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r6, _08052958 @ =IWRAM_START + 0xB0
	ldr r0, [r6, r3]
	mov ip, r0
	mov r6, ip
	asrs r6, r6, #8
	str r6, [sp, #0x18]
	str r6, [sp, #0x20]
	ldr r0, _0805295C @ =IWRAM_START + 0xB4
	adds r3, r3, r0
	ldr r0, [r3]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	str r0, [sp, #0x24]
	ldr r3, _08052960 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	mov r6, r8
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	mov r0, sp
	ldrh r3, [r0, #0x20]
	ldr r6, _08052960 @ =gCamera
	ldr r0, [r6]
	subs r0, r3, r0
	mov r6, sl
	strh r0, [r6, #0x16]
	ldr r6, _08052960 @ =gCamera
	ldr r0, [r6, #4]
	subs r3, r3, r0
	mov r0, sl
	strh r3, [r0, #0x18]
	mov r0, r8
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052964
	ldr r1, _08052944 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08052ADC
	.align 2, 0
_08052944: .4byte gCurTask
_08052948: .4byte IWRAM_START + 0xC
_0805294C: .4byte IWRAM_START + 0x3C
_08052950: .4byte IWRAM_START + 0xA8
_08052954: .4byte IWRAM_START + 0xAC
_08052958: .4byte IWRAM_START + 0xB0
_0805295C: .4byte IWRAM_START + 0xB4
_08052960: .4byte gCamera
_08052964:
	mov r0, sl
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052984
	ldr r2, _08052980 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08052ADC
	.align 2, 0
_08052980: .4byte gCurTask
_08052984:
	ldr r3, _080529E8 @ =gCamera
	ldr r1, [r3]
	movs r6, #0xb8
	lsls r6, r6, #1
	adds r0, r1, r6
	cmp r4, r0
	bgt _080529AE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _080529AE
	ldr r1, [r3, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _080529AE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _080529F0
_080529AE:
	mov r3, r8
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080529D4
	movs r6, #0x18
	ldrsh r0, [r3, r6]
	adds r0, #0x80
	cmp r0, #0
	blt _080529D4
	movs r0, #0x18
	ldrsh r1, [r3, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080529F0
_080529D4:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	ldr r0, _080529EC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08052ADC
	.align 2, 0
_080529E8: .4byte gCamera
_080529EC: .4byte gCurTask
_080529F0:
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	mov r1, sb
	adds r1, #0xac
	ldr r1, [r1]
	bl sub_80122DC
	mov r1, sb
	adds r1, #0xb8
	ldrh r0, [r1]
	cmp r0, #0
	beq _08052A90
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _08052A98
	mov r0, sp
	movs r2, #1
	strh r2, [r0]
	mov r1, sp
	ldr r0, _08052A50 @ =0x000001EB
	strh r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #4]
	mov r0, sb
	adds r0, #0xbc
	ldrh r0, [r0]
	strh r0, [r1, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r1, #8]
	mov r0, sb
	adds r0, #0xc0
	ldrb r1, [r0]
	cmp r1, #0
	bne _08052A58
	subs r0, #0x10
	ldr r0, [r0]
	str r0, [sp, #0xc]
	mov r0, sb
	adds r0, #0xb4
	ldr r0, [r0]
	ldr r3, _08052A54 @ =0xFFFFF600
	adds r0, r0, r3
	b _08052A80
	.align 2, 0
_08052A50: .4byte 0x000001EB
_08052A54: .4byte 0xFFFFF600
_08052A58:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08052A6E
	mov r0, sb
	adds r0, #0xb0
	ldr r0, [r0]
	movs r6, #0xa0
	lsls r6, r6, #4
	adds r0, r0, r6
	b _08052A78
_08052A6E:
	mov r0, sb
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r1, _08052A8C @ =0xFFFFF600
	adds r0, r0, r1
_08052A78:
	str r0, [sp, #0xc]
	mov r0, sb
	adds r0, #0xb4
	ldr r0, [r0]
_08052A80:
	str r0, [sp, #0x10]
	mov r0, sp
	bl sub_8050E04
	b _08052A98
	.align 2, 0
_08052A8C: .4byte 0xFFFFF600
_08052A90:
	ldr r0, _08052ABC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08052AC0 @ =sub_8052AEC
	str r0, [r1, #8]
_08052A98:
	mov r0, r8
	bl sub_80051E8
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08052AC4
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r2, #0x10]
	mov r0, r8
	bl sub_80051E8
	b _08052AD6
	.align 2, 0
_08052ABC: .4byte gCurTask
_08052AC0: .4byte sub_8052AEC
_08052AC4:
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	eors r0, r1
	str r0, [r3, #0x10]
	mov r0, r8
	bl sub_80051E8
_08052AD6:
	mov r0, sb
	bl sub_8052CC8
_08052ADC:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8052AEC
sub_8052AEC: @ 0x08052AEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r1, _08052BA8 @ =gCurTask
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r2, _08052BAC @ =IWRAM_START + 0xC
	adds r7, r4, r2
	ldr r0, _08052BB0 @ =IWRAM_START + 0x3C
	adds r0, r0, r4
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	adds r2, #0x9c
	adds r0, r4, r2
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r5, r1, #0
	adds r2, #4
	adds r0, r4, r2
	ldr r2, [r0]
	asrs r2, r2, #8
	str r2, [sp, #0x18]
	adds r6, r2, #0
	ldr r2, _08052BB4 @ =IWRAM_START + 0xB0
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #4]
	adds r2, #4
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, _08052BB8 @ =gCamera
	mov sl, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r2, sl
	ldr r0, [r2, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	mov r0, sp
	ldrh r2, [r0, #4]
	strh r2, [r0, #0x14]
	mov r0, sl
	ldr r0, [r0]
	mov ip, r0
	mov r0, sp
	ldrh r2, [r0, #0x14]
	mov r0, ip
	subs r2, r2, r0
	mov r0, sb
	strh r2, [r0, #0x16]
	mov r2, sl
	ldr r2, [r2, #4]
	mov ip, r2
	mov r2, sp
	ldrh r0, [r2, #0x14]
	mov r2, ip
	subs r0, r0, r2
	mov r2, sb
	strh r0, [r2, #0x18]
	ldr r0, _08052BBC @ =IWRAM_START + 0xBE
	adds r4, r4, r0
	ldr r2, _08052BC0 @ =0xFFFFFE00
	adds r0, r2, #0
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	adds r0, r7, #0
	ldr r2, [sp, #0x18]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052BC4
	ldr r1, _08052BA8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08052CB6
	.align 2, 0
_08052BA8: .4byte gCurTask
_08052BAC: .4byte IWRAM_START + 0xC
_08052BB0: .4byte IWRAM_START + 0x3C
_08052BB4: .4byte IWRAM_START + 0xB0
_08052BB8: .4byte gCamera
_08052BBC: .4byte IWRAM_START + 0xBE
_08052BC0: .4byte 0xFFFFFE00
_08052BC4:
	mov r0, sb
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052BE4
	ldr r2, _08052BE0 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08052CB6
	.align 2, 0
_08052BE0: .4byte gCurTask
_08052BE4:
	mov r0, sl
	ldr r1, [r0]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _08052C0E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	blt _08052C0E
	mov r0, sl
	ldr r1, [r0, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r6, r0
	bgt _08052C0E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	bge _08052C48
_08052C0E:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08052C32
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08052C32
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08052C48
_08052C32:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08052C44 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08052CB6
	.align 2, 0
_08052C44: .4byte gCurTask
_08052C48:
	mov r0, r8
	adds r0, #0xa8
	ldr r0, [r0]
	mov r1, r8
	adds r1, #0xac
	ldr r1, [r1]
	bl sub_80122DC
	mov r1, r8
	adds r1, #0xbe
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08052C76
	movs r0, #0
	strh r0, [r1]
	subs r1, #6
	movs r0, #0x78
	strh r0, [r1]
	ldr r0, _08052C98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08052C9C @ =sub_80524D0
	str r0, [r1, #8]
_08052C76:
	adds r0, r7, #0
	bl sub_80051E8
	adds r0, r7, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08052CA0
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
	b _08052CB0
	.align 2, 0
_08052C98: .4byte gCurTask
_08052C9C: .4byte sub_80524D0
_08052CA0:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_08052CB0:
	mov r0, r8
	bl sub_8052CC8
_08052CB6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8052CC8
sub_8052CC8: @ 0x08052CC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	movs r0, #0x3c
	adds r0, r0, r7
	mov r8, r0
	adds r4, r7, #0
	adds r4, #0x6c
	adds r1, r7, #0
	adds r1, #0x9c
	str r1, [sp]
	ldr r3, _08052D70 @ =gSineTable
	adds r0, r7, #0
	adds r0, #0xba
	ldrh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r1, r0, r3
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	asrs r0, r0, #5
	str r0, [sp, #4]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	asrs r0, r0, #5
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0xbe
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xe0
	lsls r1, r1, #4
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	cmp r0, sl
	bhs _08052DAE
_08052D30:
	adds r2, r0, #1
	ldr r3, [sp, #4]
	adds r1, r2, #0
	muls r1, r3, r1
	adds r0, r7, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	ldr r0, [sp, #8]
	adds r1, r2, #0
	muls r1, r0, r1
	adds r0, r7, #0
	adds r0, #0xac
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r6, r1, #8
	ldr r1, _08052D74 @ =gCamera
	ldr r0, [r1]
	subs r3, r5, r0
	strh r3, [r4, #0x16]
	adds r0, r7, #0
	adds r0, #0xc0
	ldrb r1, [r0]
	mov sb, r2
	cmp r1, #0
	bne _08052D78
	ldr r2, _08052D74 @ =gCamera
	ldr r0, [r2, #4]
	subs r0, r6, r0
	subs r0, #0xa
	b _08052D92
	.align 2, 0
_08052D70: .4byte gSineTable
_08052D74: .4byte gCamera
_08052D78:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08052D86
	adds r0, r3, #0
	adds r0, #0xa
	b _08052D8A
_08052D86:
	adds r0, r3, #0
	subs r0, #0xa
_08052D8A:
	strh r0, [r4, #0x16]
	ldr r3, _08052E54 @ =gCamera
	ldr r0, [r3, #4]
	subs r0, r6, r0
_08052D92:
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800C84C
	adds r0, r4, #0
	bl sub_80051E8
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	blo _08052D30
_08052DAE:
	adds r4, r7, #0
	adds r4, #0xb0
	ldr r3, _08052E58 @ =gSineTable
	movs r2, #0xba
	adds r2, r2, r7
	mov ip, r2
	ldrh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xbe
	adds r0, r0, r7
	mov sb, r0
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	muls r0, r1, r0
	asrs r0, r0, #6
	adds r1, r7, #0
	adds r1, #0xa8
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r4]
	adds r2, r7, #0
	adds r2, #0xb4
	mov r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r3, sb
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	muls r1, r0, r1
	asrs r1, r1, #6
	adds r0, r7, #0
	adds r0, #0xac
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r4]
	asrs r5, r0, #8
	asrs r6, r1, #8
	adds r3, r5, #0
	ldr r4, _08052E54 @ =gCamera
	ldr r0, [r4]
	subs r1, r3, r0
	mov r0, r8
	strh r1, [r0, #0x16]
	adds r0, r7, #0
	adds r0, #0xc0
	ldrb r2, [r0]
	cmp r2, #0
	bne _08052E60
	adds r2, r6, #0
	ldr r0, [r4, #4]
	subs r0, r2, r0
	subs r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x18]
	ldr r1, _08052E5C @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r2
	adds r0, #0xa
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldr r2, [sp]
	strh r0, [r2]
	b _08052EBE
	.align 2, 0
_08052E54: .4byte gCamera
_08052E58: .4byte gSineTable
_08052E5C: .4byte gPlayer
_08052E60:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08052E8C
	adds r0, r1, #0
	adds r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r1, _08052E88 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	adds r1, #0xa
	b _08052EA8
	.align 2, 0
_08052E88: .4byte gPlayer
_08052E8C:
	adds r0, r1, #0
	subs r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r1, _08052F08 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	subs r1, #0xa
_08052EA8:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldr r2, [sp]
	strh r0, [r2]
	ldr r0, _08052F0C @ =gCamera
	ldr r0, [r0, #4]
	subs r0, r6, r0
	mov r3, r8
	strh r0, [r3, #0x18]
_08052EBE:
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800C84C
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	mov r2, r8
	ldrh r0, [r2, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r2, #0x18]
	strh r0, [r1, #8]
	ldrh r1, [r1]
	adds r0, r7, #0
	adds r0, #0xbc
	strh r1, [r0]
	ldr r3, [sp]
	ldrh r2, [r3]
	ldr r1, _08052F10 @ =0xFFFFFF00
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	bls _08052F14
	movs r0, #0xf4
	lsls r0, r0, #1
	mov r2, r8
	strh r0, [r2, #0xa]
	mov r1, r8
	adds r1, #0x20
	movs r0, #0
	b _08052F28
	.align 2, 0
_08052F08: .4byte gPlayer
_08052F0C: .4byte gCamera
_08052F10: .4byte 0xFFFFFF00
_08052F14:
	adds r0, r1, #0
	eors r0, r2
	ldr r3, [sp]
	strh r0, [r3]
	movs r0, #0xf4
	lsls r0, r0, #1
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
_08052F28:
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08052F68 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08052F6C @ =0x00002060
	orrs r0, r1
	mov r2, r8
	str r0, [r2, #0x10]
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	ldr r1, [sp]
	bl sub_8004860
	mov r0, r8
	bl sub_80051E8
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052F68: .4byte gUnknown_030054B8
_08052F6C: .4byte 0x00002060

	thumb_func_start sub_8052F70
sub_8052F70: @ 0x08052F70
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start initSprite_Enemy_Buzzer
initSprite_Enemy_Buzzer: @ 0x08052F94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, _080530AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _08052FD0
	ldr r0, _080530B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bgt _08052FD0
	ldr r0, _080530B4 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805309A
_08052FD0:
	ldr r0, _080530B8 @ =sub_80530E0
	ldr r2, _080530BC @ =0x00004030
	ldr r1, _080530C0 @ =sub_8053770
	str r1, [sp]
	movs r1, #0x6c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r5, r1
	ldr r0, _080530C4 @ =IWRAM_START + 0xC
	adds r6, r5, r0
	movs r4, #0
	mov r2, sb
	strh r2, [r1, #4]
	mov r0, sl
	strh r0, [r1, #6]
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r2, r8
	strb r2, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sb
	lsls r3, r2, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov sb, r0
	mov r0, sl
	lsls r2, r0, #8
	add sb, r2
	mov r0, sb
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	str r4, [r1, #0x4c]
	str r4, [r1, #0x50]
	str r4, [r1, #0x54]
	str r4, [r1, #0x58]
	str r4, [r1, #0x60]
	ldr r0, _080530C8 @ =IWRAM_START + 0x64
	strh r4, [r0, r5]
	adds r0, #2
	strh r4, [r0, r5]
	str r4, [r1, #0x5c]
	ldr r1, _080530CC @ =IWRAM_START + 0x68
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r6, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	ldr r1, _080530D0 @ =IWRAM_START + 0x2C
	adds r0, r5, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	ldr r0, _080530D4 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _080530D8 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080530DC @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
_0805309A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080530AC: .4byte gGameMode
_080530B0: .4byte gCurrentLevel
_080530B4: .4byte gUnknown_030054EC
_080530B8: .4byte sub_80530E0
_080530BC: .4byte 0x00004030
_080530C0: .4byte sub_8053770
_080530C4: .4byte IWRAM_START + 0xC
_080530C8: .4byte IWRAM_START + 0x64
_080530CC: .4byte IWRAM_START + 0x68
_080530D0: .4byte IWRAM_START + 0x2C
_080530D4: .4byte IWRAM_START + 0x2D
_080530D8: .4byte IWRAM_START + 0x2E
_080530DC: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80530E0
sub_80530E0: @ 0x080530E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805311C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r0, _08053120 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08053124
	mov r2, r8
	ldr r0, [r2, #0x4c]
	adds r0, #0xc0
	str r0, [r2, #0x4c]
	b _0805312C
	.align 2, 0
_0805311C: .4byte gCurTask
_08053120: .4byte IWRAM_START + 0xC
_08053124:
	mov r3, r8
	ldr r0, [r3, #0x4c]
	subs r0, #0xc0
	str r0, [r3, #0x4c]
_0805312C:
	mov r0, r8
	ldr r1, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	mov r3, r8
	ldr r2, [r3, #0x48]
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r4, _080531C8 @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r3, sb
	strh r0, [r3, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	mov r0, sb
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080531BE
	mov r1, r8
	ldr r0, [r1, #0x44]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805318E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805318E
	mov r1, r8
	ldr r0, [r1, #0x48]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805318E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080531D0
_0805318E:
	mov r1, sb
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080531B6
	mov r2, sb
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _080531B6
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080531D0
_080531B6:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
_080531BE:
	ldr r0, _080531CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805339C
	.align 2, 0
_080531C8: .4byte gCamera
_080531CC: .4byte gCurTask
_080531D0:
	mov r0, r8
	adds r0, #0x68
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _080531E8
	subs r0, r1, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080531E8
	b _080532FC
_080531E8:
	mov r3, sb
	ldr r1, [r3, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08053264
	ldr r3, _08053258 @ =gPlayer
	ldr r0, [r3, #8]
	asrs r2, r0, #8
	adds r0, r6, #0
	subs r0, #0x3c
	cmp r2, r0
	ble _08053264
	cmp r2, r6
	bge _08053264
	ldr r0, [r3, #0xc]
	asrs r2, r0, #8
	cmp r2, r7
	ble _08053264
	adds r0, r7, #0
	adds r0, #0x50
	cmp r2, r0
	bge _08053264
	ldr r0, _0805325C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08053260 @ =sub_80534F0
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	mov r1, sb
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3, #0xc]
	mov r2, r8
	str r0, [r2, #0x5c]
	lsls r5, r6, #8
	ldr r0, [r3, #8]
	subs r0, r0, r5
	movs r1, #0x20
	str r3, [sp, #4]
	bl Div
	mov r1, r8
	adds r1, #0x64
	strh r0, [r1]
	lsls r4, r7, #8
	ldr r3, [sp, #4]
	ldr r0, [r3, #0xc]
	b _080532E0
	.align 2, 0
_08053258: .4byte gPlayer
_0805325C: .4byte gCurTask
_08053260: .4byte sub_80534F0
_08053264:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080532FC
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080532FC
	ldr r3, _080532F0 @ =gPlayer
	mov sl, r3
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	cmp r1, r6
	ble _080532FC
	adds r0, r6, #0
	adds r0, #0x3c
	cmp r1, r0
	bge _080532FC
	ldr r0, [r3, #0xc]
	asrs r1, r0, #8
	cmp r1, r7
	ble _080532FC
	adds r0, r7, #0
	adds r0, #0x50
	cmp r1, r0
	bge _080532FC
	ldr r0, _080532F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080532F8 @ =sub_80534F0
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	mov r1, sb
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3, #0xc]
	mov r2, r8
	str r0, [r2, #0x5c]
	lsls r5, r6, #8
	ldr r0, [r3, #8]
	subs r0, r5, r0
	movs r1, #0x20
	bl Div
	mov r4, r8
	adds r4, #0x64
	strh r0, [r4]
	mov r3, sl
	ldr r0, [r3, #8]
	subs r0, r0, r5
	movs r1, #0x20
	bl Div
	strh r0, [r4]
	lsls r4, r7, #8
	mov r1, sl
	ldr r0, [r1, #0xc]
_080532E0:
	subs r0, r0, r4
	movs r1, #0x20
	bl Div
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	b _08053388
	.align 2, 0
_080532F0: .4byte gPlayer
_080532F4: .4byte gCurTask
_080532F8: .4byte sub_80534F0
_080532FC:
	mov r2, r8
	ldr r1, [r2, #0x4c]
	asrs r3, r1, #8
	ldr r2, [sp]
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _0805334C
	mov r3, sb
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0805334C
	ldr r0, _08053344 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08053348 @ =sub_80533B4
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	mov r1, sb
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	lsls r5, r6, #8
	lsls r4, r7, #8
	b _08053388
	.align 2, 0
_08053344: .4byte gCurTask
_08053348: .4byte sub_80533B4
_0805334C:
	asrs r1, r4, #8
	ldr r2, [sp]
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	lsls r5, r6, #8
	lsls r4, r7, #8
	cmp r1, r0
	blt _08053388
	mov r3, sb
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08053388
	ldr r0, _080533AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080533B0 @ =sub_80533B4
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	mov r1, sb
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08053388:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80122DC
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
_0805339C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080533AC: .4byte gCurTask
_080533B0: .4byte sub_80533B4

	thumb_func_start sub_80533B4
sub_80533B4: @ 0x080533B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0805340C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, _08053410 @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r0, [r7]
	mov sl, r0
	ldr r1, [r7, #0x44]
	ldr r0, [r7, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x48]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08053414 @ =gCamera
	mov r8, r3
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08053418
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _080534D8
	.align 2, 0
_0805340C: .4byte gCurTask
_08053410: .4byte IWRAM_START + 0xC
_08053414: .4byte gCamera
_08053418:
	ldr r0, [r7, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805344A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805344A
	ldr r0, [r7, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805344A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08053484
_0805344A:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805346E
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805346E
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08053484
_0805346E:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08053480 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080534D8
	.align 2, 0
_08053480: .4byte gCurTask
_08053484:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _080534D2
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080534B0
	ldr r0, _080534AC @ =0xFFFFFBFF
	ands r1, r0
	b _080534B2
	.align 2, 0
_080534AC: .4byte 0xFFFFFBFF
_080534B0:
	orrs r1, r2
_080534B2:
	str r1, [r6, #0x10]
	movs r1, #0
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080534E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080534EC @ =sub_80530E0
	str r0, [r1, #8]
_080534D2:
	adds r0, r6, #0
	bl sub_80051E8
_080534D8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080534E8: .4byte gCurTask
_080534EC: .4byte sub_80530E0

	thumb_func_start sub_80534F0
sub_80534F0: @ 0x080534F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08053568 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _0805356C @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r6]
	mov sl, r3
	adds r2, #0x58
	adds r0, r1, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r2, [r6, #0x54]
	adds r2, r2, r0
	str r2, [r6, #0x54]
	ldr r0, _08053570 @ =IWRAM_START + 0x66
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r3, [r6, #0x58]
	adds r3, r3, r0
	str r3, [r6, #0x58]
	ldr r1, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r1, r1, r0
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x48]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _08053574 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08053578
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08053608
	.align 2, 0
_08053568: .4byte gCurTask
_0805356C: .4byte IWRAM_START + 0xC
_08053570: .4byte IWRAM_START + 0x66
_08053574: .4byte gCamera
_08053578:
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080535AA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080535AA
	ldr r0, [r6, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080535AA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080535E4
_080535AA:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080535CE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080535CE
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080535E4
_080535CE:
	ldrb r0, [r6, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _080535E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08053608
	.align 2, 0
_080535E0: .4byte gCurTask
_080535E4:
	lsls r0, r4, #8
	lsls r4, r5, #8
	adds r1, r4, #0
	bl sub_80122DC
	ldr r0, [r6, #0x5c]
	cmp r4, r0
	ble _080535FC
	ldr r0, _08053618 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805361C @ =sub_8053620
	str r0, [r1, #8]
_080535FC:
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08053608:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053618: .4byte gCurTask
_0805361C: .4byte sub_8053620

	thumb_func_start sub_8053620
sub_8053620: @ 0x08053620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08053698 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _0805369C @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r4]
	mov sl, r3
	adds r2, #0x58
	adds r0, r1, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r2, [r4, #0x54]
	subs r2, r2, r0
	str r2, [r4, #0x54]
	ldr r0, _080536A0 @ =IWRAM_START + 0x66
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r3, [r4, #0x58]
	subs r3, r3, r0
	str r3, [r4, #0x58]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r1, r1, r0
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r4, #0x48]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r0, _080536A4 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080536A8
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _0805375A
	.align 2, 0
_08053698: .4byte gCurTask
_0805369C: .4byte IWRAM_START + 0xC
_080536A0: .4byte IWRAM_START + 0x66
_080536A4: .4byte gCamera
_080536A8:
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080536DA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080536DA
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080536DA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08053714
_080536DA:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080536FE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080536FE
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08053714
_080536FE:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08053710 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805375A
	.align 2, 0
_08053710: .4byte gCurTask
_08053714:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bgt _0805374E
	movs r0, #0
	str r0, [r4, #0x54]
	str r0, [r4, #0x58]
	movs r1, #0
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x68
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08053768 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805376C @ =sub_80530E0
	str r0, [r1, #8]
_0805374E:
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_0805375A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053768: .4byte gCurTask
_0805376C: .4byte sub_80530E0

	thumb_func_start sub_8053770
sub_8053770: @ 0x08053770
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Kiki
initSprite_Enemy_Kiki: @ 0x08053784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _08053878 @ =sub_80538A0
	ldr r2, _0805387C @ =0x00004020
	ldr r1, _08053880 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r3, _08053884 @ =IWRAM_START + 0xC
	adds r5, r4, r3
	movs r2, #0
	movs r7, #0
	strh r6, [r0, #4]
	mov r1, r8
	strh r1, [r0, #6]
	mov r3, sl
	str r3, [r0]
	ldrb r1, [r3]
	strb r1, [r0, #8]
	mov r1, sb
	strb r1, [r0, #9]
	ldr r3, _08053888 @ =IWRAM_START + 0x3C
	adds r1, r4, r3
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0805388C @ =IWRAM_START + 0x3D
	adds r0, r4, r1
	strb r2, [r0]
	adds r3, #2
	adds r0, r4, r3
	strb r2, [r0]
	adds r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x16]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	mov r1, r8
	lsls r1, r1, #8
	mov r8, r1
	add r0, r8
	strh r0, [r5, #0x18]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x14
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	strh r7, [r5, #8]
	ldr r0, _08053890 @ =0x000001DF
	strh r0, [r5, #0xa]
	ldr r3, _08053894 @ =IWRAM_START + 0x2C
	adds r0, r4, r3
	ldr r2, [sp, #4]
	strb r2, [r0]
	strh r7, [r5, #0x14]
	strh r7, [r5, #0x1c]
	ldr r0, _08053898 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r3, #2
	adds r1, r4, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805389C @ =IWRAM_START + 0x31
	adds r4, r4, r0
	strb r2, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053878: .4byte sub_80538A0
_0805387C: .4byte 0x00004020
_08053880: .4byte TaskDestructor_80095E8
_08053884: .4byte IWRAM_START + 0xC
_08053888: .4byte IWRAM_START + 0x3C
_0805388C: .4byte IWRAM_START + 0x3D
_08053890: .4byte 0x000001DF
_08053894: .4byte IWRAM_START + 0x2C
_08053898: .4byte IWRAM_START + 0x2D
_0805389C: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80538A0
sub_80538A0: @ 0x080538A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08053954 @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov r8, r0
	ldr r1, _08053958 @ =IWRAM_START + 0xC
	adds r6, r5, r1
	ldr r3, [r0]
	mov sb, r3
	ldrb r2, [r0, #8]
	lsls r2, r2, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	mov r4, r8
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r7, _0805395C @ =IWRAM_START + 0x3D
	adds r4, r5, r7
	ldr r0, _08053960 @ =IWRAM_START + 0x3C
	adds r0, r5, r0
	str r0, [sp]
	ldrb r0, [r0]
	ldrb r3, [r4]
	adds r0, r0, r3
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08053964 @ =gCamera
	ldr r0, [r3]
	lsrs r7, r2, #0x10
	mov ip, r7
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	movs r2, #0
	ldrsb r2, [r4, r2]
	mov r0, sb
	movs r1, #4
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _08053978
	ldr r4, _08053968 @ =IWRAM_START + 0x3E
	adds r1, r5, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r2, #1
	ldr r7, [sp]
	strb r2, [r7]
	ldrb r1, [r1]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0805398A
	ldr r0, _0805396C @ =IWRAM_START + 0x3F
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08053970 @ =IWRAM_START + 0x2C
	adds r0, r5, r1
	strb r2, [r0]
	mov r4, sl
	ldr r1, [r4]
	ldr r0, _08053974 @ =sub_8053A38
	str r0, [r1, #8]
	b _0805398A
	.align 2, 0
_08053954: .4byte gCurTask
_08053958: .4byte IWRAM_START + 0xC
_0805395C: .4byte IWRAM_START + 0x3D
_08053960: .4byte IWRAM_START + 0x3C
_08053964: .4byte gCamera
_08053968: .4byte IWRAM_START + 0x3E
_0805396C: .4byte IWRAM_START + 0x3F
_08053970: .4byte IWRAM_START + 0x2C
_08053974: .4byte sub_8053A38
_08053978:
	mov r7, sb
	ldrb r0, [r7, #6]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _0805398A
	movs r0, #0xff
	ldr r1, [sp]
	strb r0, [r1]
_0805398A:
	mov r4, ip
	lsls r5, r4, #0x10
	asrs r7, r5, #0x10
	lsls r4, r3, #0x10
	asrs r2, r4, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080539DA
	ldrh r3, [r6, #0x16]
	adds r0, r3, #0
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080539D2
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	mov r1, r8
	adds r1, #0x3d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080539D2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080539E8
_080539D2:
	mov r3, r8
	ldrb r0, [r3, #8]
	mov r4, sb
	strb r0, [r4]
_080539DA:
	ldr r0, _080539E4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08053A28
	.align 2, 0
_080539E4: .4byte gCurTask
_080539E8:
	ldr r0, _080539FC @ =gPlayer
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	cmp r0, r7
	bge _08053A04
	ldr r0, [r6, #0x10]
	ldr r1, _08053A00 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	b _08053A14
	.align 2, 0
_080539FC: .4byte gPlayer
_08053A00: .4byte 0xFFFFFBFF
_08053A04:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r3, #0
	adds r0, #8
	strh r0, [r6, #0x16]
_08053A14:
	asrs r0, r5, #8
	asrs r1, r4, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08053A28:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8053A38
sub_8053A38: @ 0x08053A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08053AB4 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r1, _08053AB8 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r4]
	mov r8, r2
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r2, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r5, _08053ABC @ =IWRAM_START + 0x3D
	adds r6, r3, r5
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _08053AC0 @ =gCamera
	ldr r0, [r3]
	lsrs r5, r1, #0x10
	str r5, [sp]
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	lsrs r1, r2, #0x10
	mov sl, r1
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08053AC4
	mov r2, sb
	ldr r0, [r2]
	bl TaskDestroy
	b _08053BA2
	.align 2, 0
_08053AB4: .4byte gCurTask
_08053AB8: .4byte IWRAM_START + 0xC
_08053ABC: .4byte IWRAM_START + 0x3D
_08053AC0: .4byte gCamera
_08053AC4:
	ldrh r2, [r7, #0x16]
	adds r0, r2, #0
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08053AEE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08053AEE
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r3, r0
	ble _08053B04
_08053AEE:
	ldrb r0, [r4, #8]
	mov r2, r8
	strb r0, [r2]
	ldr r0, _08053B00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08053BA2
	.align 2, 0
_08053B00: .4byte gCurTask
_08053B04:
	ldr r0, _08053B18 @ =gPlayer
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	cmp r0, r5
	bge _08053B20
	ldr r0, [r7, #0x10]
	ldr r1, _08053B1C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r7, #0x10]
	b _08053B30
	.align 2, 0
_08053B18: .4byte gPlayer
_08053B1C: .4byte 0xFFFFFBFF
_08053B20:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r7, #0x16]
_08053B30:
	adds r4, #0x3f
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r5, [sp]
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	lsls r0, r5, #8
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r6, r1, #0x10
	lsls r1, r6, #8
	bl sub_80122DC
	ldrb r0, [r4]
	cmp r0, #0x12
	bne _08053B82
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08053B70
	subs r0, r5, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8053BBC
	b _08053B82
_08053B70:
	adds r0, r5, #0
	adds r0, #9
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8053BBC
_08053B82:
	adds r0, r7, #0
	bl sub_8004558
	adds r2, r0, #0
	cmp r2, #0
	bne _08053B9C
	ldr r0, _08053BB4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08053BB8 @ =sub_80538A0
	str r0, [r1, #8]
	adds r0, r7, #0
	adds r0, #0x20
	strb r2, [r0]
_08053B9C:
	adds r0, r7, #0
	bl sub_80051E8
_08053BA2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053BB4: .4byte gCurTask
_08053BB8: .4byte sub_80538A0

	thumb_func_start sub_8053BBC
sub_8053BBC: @ 0x08053BBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _08053C2C @ =sub_8053CC0
	ldr r2, _08053C30 @ =0x00004028
	ldr r1, _08053C34 @ =sub_8054054
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r1, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r6, #0x32]
	strh r1, [r6, #0x30]
	strh r1, [r6, #0x36]
	strh r7, [r6, #0x38]
	ldr r0, _08053C38 @ =gPlayer
	ldr r0, [r0, #8]
	asrs r1, r0, #8
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08053C40
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xc8
	lsls r1, r1, #2
	bl Div
	rsbs r0, r0, #0
	strh r0, [r6, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x3c
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08053C62
	ldr r0, _08053C3C @ =0x0000FFC4
	b _08053C60
	.align 2, 0
_08053C2C: .4byte sub_8053CC0
_08053C30: .4byte 0x00004028
_08053C34: .4byte sub_8054054
_08053C38: .4byte gPlayer
_08053C3C: .4byte 0x0000FFC4
_08053C40:
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xc8
	lsls r1, r1, #2
	bl Div
	strh r0, [r6, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08053C62
	movs r0, #0x3c
_08053C60:
	strh r0, [r6, #0x34]
_08053C62:
	movs r5, #0
	movs r4, #0
	strh r7, [r6, #0x16]
	mov r0, r8
	strh r0, [r6, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	movs r0, #0xf0
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8053CC0
sub_8053CC0: @ 0x08053CC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r6, _08053D3C @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x32]
	adds r0, #0x28
	movs r5, #0
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r1, #0x28
	bl Div
	ldrh r1, [r4, #0x38]
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x18
	ldrh r2, [r4, #0x18]
	adds r0, r0, r2
	strh r0, [r4, #0x18]
	cmp r1, #0
	ble _08053D4E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	str r5, [sp]
	ldr r2, _08053D40 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	adds r1, r0, #0
	cmp r1, #0
	bge _08053D4E
	ldrh r0, [r4, #0x18]
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	ldrh r1, [r4, #0x30]
	cmp r1, #0
	bne _08053D44
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r4, #0x32]
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	b _08053D4E
	.align 2, 0
_08053D3C: .4byte gCurTask
_08053D40: .4byte sub_801EE64
_08053D44:
	ldr r1, [r6]
	ldr r0, _08053D90 @ =sub_8053DCC
	str r0, [r1, #8]
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x32]
_08053D4E:
	ldrh r7, [r4, #0x16]
	movs r0, #0x16
	ldrsh r6, [r4, r0]
	ldrh r1, [r4, #0x18]
	mov r8, r1
	movs r2, #0x18
	ldrsh r5, [r4, r2]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_800C84C
	cmp r0, #0
	beq _08053D98
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0
	adds r0, #0xde
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8053E64
	ldr r0, _08053D94 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08053DBC
	.align 2, 0
_08053D90: .4byte sub_8053DCC
_08053D94: .4byte gCurTask
_08053D98:
	ldr r2, _08053DC8 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	strh r7, [r4, #0x16]
	mov r0, r8
	strh r0, [r4, #0x18]
_08053DBC:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053DC8: .4byte gCamera

	thumb_func_start sub_8053DCC
sub_8053DCC: @ 0x08053DCC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r7, _08053E04 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	adds r4, r2, #0
	ldrh r3, [r2, #0x16]
	mov sb, r3
	ldrh r5, [r2, #0x18]
	mov r8, r5
	ldrh r0, [r2, #0x30]
	adds r1, r0, #1
	strh r1, [r2, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5f
	bls _08053E08
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	b _08053E22
	.align 2, 0
_08053E04: .4byte gCurTask
_08053E08:
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r2, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_800C84C
	cmp r0, #0
	beq _08053E2E
	adds r0, r6, #0
	adds r1, r5, #0
_08053E22:
	bl sub_8053E64
	ldr r0, [r7]
	bl TaskDestroy
	b _08053E54
_08053E2E:
	ldr r2, _08053E60 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	mov r0, sb
	strh r0, [r4, #0x16]
	mov r0, r8
	strh r0, [r4, #0x18]
_08053E54:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053E60: .4byte gCamera

	thumb_func_start sub_8053E64
sub_8053E64: @ 0x08053E64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _08053EAC @ =sub_8053F24
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08053EB0 @ =sub_8054054
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r1, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r6, #0x32]
	strh r1, [r6, #0x30]
	ldr r0, _08053EB4 @ =gPlayer
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08053EBC
	ldr r0, _08053EB8 @ =0x0000FFFF
	b _08053EBE
	.align 2, 0
_08053EAC: .4byte sub_8053F24
_08053EB0: .4byte sub_8054054
_08053EB4: .4byte gPlayer
_08053EB8: .4byte 0x0000FFFF
_08053EBC:
	movs r0, #1
_08053EBE:
	strh r0, [r6, #0x34]
	movs r0, #0
	mov r8, r0
	movs r4, #0
	strh r7, [r6, #0x16]
	strh r5, [r6, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	ldr r0, _08053F20 @ =0x000001E1
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	mov r1, r8
	strb r1, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053F20: .4byte 0x000001E1

	thumb_func_start sub_8053F24
sub_8053F24: @ 0x08053F24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08054020 @ =gUnknown_03005AFC
	mov ip, r0
	ldr r0, _08054024 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldrh r1, [r4, #0x16]
	mov r8, r1
	ldrh r2, [r4, #0x18]
	mov sb, r2
	ldr r0, [r4, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08053FFA
	mov r2, ip
	ldr r0, [r2, #0x28]
	cmp r0, r1
	beq _08053FFA
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _08054028 @ =IWRAM_START + 0x2C
	adds r1, r5, r2
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r3, r0, r6
	ldr r2, _0805402C @ =gPlayer
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	mov sl, r2
	cmp r3, r1
	bgt _08053F94
	ldr r2, _08054030 @ =IWRAM_START + 0x2E
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r1
	bge _08053FA6
	cmp r3, r1
	blt _08053FFA
_08053F94:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _08053FFA
_08053FA6:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0x2d
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r2, r0, r5
	mov r1, sl
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _08053FE2
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _08053FF4
	cmp r2, r3
	blt _08053FFA
_08053FE2:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _08053FFA
_08053FF4:
	mov r0, sl
	bl sub_800CBA4
_08053FFA:
	ldr r2, _08054034 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08054038
	ldr r0, _08054024 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054046
	.align 2, 0
_08054020: .4byte gUnknown_03005AFC
_08054024: .4byte gCurTask
_08054028: .4byte IWRAM_START + 0x2C
_0805402C: .4byte gPlayer
_08054030: .4byte IWRAM_START + 0x2E
_08054034: .4byte gCamera
_08054038:
	adds r0, r4, #0
	bl sub_80051E8
	mov r2, r8
	strh r2, [r4, #0x16]
	mov r0, sb
	strh r0, [r4, #0x18]
_08054046:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8054054
sub_8054054: @ 0x08054054
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Koura
initSprite_Enemy_Koura: @ 0x08054068
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080540D0 @ =sub_8054224
	ldr r2, _080540D4 @ =0x000040B0
	ldr r1, _080540D8 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	adds r0, #0xc
	adds r6, r3, r0
	movs r1, #0
	mov r2, r8
	strh r2, [r5, #4]
	mov r0, sl
	strh r0, [r5, #6]
	str r7, [r5]
	ldrb r0, [r7]
	strb r0, [r5, #8]
	strb r4, [r5, #9]
	ldrb r0, [r7, #5]
	ldrb r2, [r7, #6]
	cmp r0, r2
	bls _08054110
	movs r2, #4
	ldrsb r2, [r7, r2]
	cmp r2, #1
	bne _080540E0
	ldr r1, _080540DC @ =IWRAM_START + 0x54
	adds r0, r3, r1
	strb r2, [r0]
	b _080540F8
	.align 2, 0
_080540D0: .4byte sub_8054224
_080540D4: .4byte 0x000040B0
_080540D8: .4byte TaskDestructor_80095E8
_080540DC: .4byte IWRAM_START + 0x54
_080540E0:
	cmp r2, #0
	bne _080540F0
	ldr r2, _080540EC @ =IWRAM_START + 0x54
	adds r0, r3, r2
	strb r1, [r0]
	b _080540F8
	.align 2, 0
_080540EC: .4byte IWRAM_START + 0x54
_080540F0:
	ldr r0, _08054108 @ =IWRAM_START + 0x54
	adds r1, r3, r0
	movs r0, #2
	strb r0, [r1]
_080540F8:
	adds r2, r5, #0
	adds r2, #0x56
	movs r0, #0
	ldr r1, _0805410C @ =0x0000FF80
	strh r1, [r2]
	adds r1, r5, #0
	adds r1, #0x58
	b _08054126
	.align 2, 0
_08054108: .4byte IWRAM_START + 0x54
_0805410C: .4byte 0x0000FF80
_08054110:
	ldr r2, _0805417C @ =IWRAM_START + 0x54
	adds r1, r3, r2
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08054180 @ =IWRAM_START + 0x56
	adds r1, r3, r0
	movs r0, #0
	strh r0, [r1]
	adds r2, #4
	adds r1, r3, r2
	ldr r0, _08054184 @ =0x0000FF80
_08054126:
	strh r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r1, r8
	lsls r3, r1, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	mov sb, r0
	str r0, [r5, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r1, sl
	lsls r2, r1, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	mov ip, r0
	str r0, [r5, #0x48]
	movs r4, #0
	str r4, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x54
	ldrb r1, [r0]
	mov sl, r3
	str r2, [sp, #8]
	mov r8, r0
	cmp r1, #1
	bhi _0805418C
	mov r2, ip
	asrs r0, r2, #8
	mov r3, sb
	asrs r1, r3, #8
	mov r3, r8
	ldrb r2, [r3]
	str r4, [sp]
	ldr r3, _08054188 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r5, #0x50]
	b _0805418E
	.align 2, 0
_0805417C: .4byte IWRAM_START + 0x54
_08054180: .4byte IWRAM_START + 0x56
_08054184: .4byte 0x0000FF80
_08054188: .4byte sub_801EE64
_0805418C:
	str r4, [r5, #0x50]
_0805418E:
	ldrb r0, [r7]
	lsls r0, r0, #3
	add r0, sl
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	movs r0, #0x1e
	bl VramMalloc
	str r0, [r6, #4]
	ldr r3, _08054220 @ =gUnknown_080D8F38
	mov r0, r8
	ldrb r2, [r0]
	movs r1, #2
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	mov r2, r8
	ldrb r0, [r2]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054220: .4byte gUnknown_080D8F38

	thumb_func_start sub_8054224
sub_8054224: @ 0x08054224
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r0, _0805425C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r2, [r4]
	mov r8, r2
	ldr r3, _08054260 @ =IWRAM_START + 0x54
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08054268
	ldr r5, _08054264 @ =IWRAM_START + 0x56
	adds r0, r1, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x4c]
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	b _08054276
	.align 2, 0
_0805425C: .4byte gCurTask
_08054260: .4byte IWRAM_START + 0x54
_08054264: .4byte IWRAM_START + 0x56
_08054268:
	ldr r3, _080542D8 @ =IWRAM_START + 0x58
	adds r0, r1, r3
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
_08054276:
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #1
	bhi _080542E4
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r7]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080542DC @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080542C8
	lsls r0, r0, #8
	ldr r1, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x50]
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r7]
	ldr r3, _080542E0 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_080542C8:
	cmp r0, #0
	ble _08054330
	lsls r1, r0, #8
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
	b _08054330
	.align 2, 0
_080542D8: .4byte IWRAM_START + 0x58
_080542DC: .4byte sub_801EE64
_080542E0: .4byte sub_801EC3C
_080542E4:
	cmp r1, #2
	bne _08054314
	ldr r2, _08054308 @ =gSineTable
	ldr r0, _0805430C @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054310 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #4
	str r0, [r4, #0x50]
	b _08054330
	.align 2, 0
_08054308: .4byte gSineTable
_0805430C: .4byte gUnknown_03005590
_08054310: .4byte 0x000003FF
_08054314:
	ldr r2, _080543E4 @ =gSineTable
	ldr r0, _080543E8 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080543EC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #4
	str r0, [r4, #0x4c]
_08054330:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	asrs r3, r0, #8
	str r3, [sp, #8]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r2, r0, #8
	str r2, [sp, #0xc]
	ldr r1, _080543F0 @ =gCamera
	ldr r0, [r1]
	adds r5, r3, #0
	subs r0, r5, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	ldr r5, _080543F4 @ =gPlayer
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0805440C
	ldr r0, [r5, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0805440C
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _0805441C
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r5, #0x20]
	ldr r1, _080543F8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r0, _080543FC @ =0x0000FC80
	strh r0, [r5, #0x12]
	ldr r0, _08054400 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054404 @ =sub_8054904
	str r0, [r1, #8]
	ldr r2, _08054408 @ =gUnknown_080D8F38
	ldrb r0, [r7]
	movs r1, #4
	cmp r0, #1
	bls _080543AA
	movs r1, #0xc
_080543AA:
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r7]
	movs r1, #4
	cmp r0, #1
	bls _080543BA
	movs r1, #0xc
_080543BA:
	adds r0, r2, #2
	adds r0, r1, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r0, #0x99
	bl m4aSongNumStart
	b _08054610
	.align 2, 0
_080543E4: .4byte gSineTable
_080543E8: .4byte gUnknown_03005590
_080543EC: .4byte 0x000003FF
_080543F0: .4byte gCamera
_080543F4: .4byte gPlayer
_080543F8: .4byte 0xFFFFFEFF
_080543FC: .4byte 0x0000FC80
_08054400: .4byte gCurTask
_08054404: .4byte sub_8054904
_08054408: .4byte gUnknown_080D8F38
_0805440C:
	adds r0, r6, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08054478
_0805441C:
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	ldr r3, _08054484 @ =gCamera
	ldr r1, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _0805444E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805444E
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805444E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805448C
_0805444E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054472
	movs r5, #0x18
	ldrsh r0, [r6, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _08054472
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805448C
_08054472:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
_08054478:
	ldr r0, _08054488 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054610
	.align 2, 0
_08054484: .4byte gCamera
_08054488: .4byte gCurTask
_0805448C:
	ldrb r0, [r7]
	cmp r0, #2
	bhi _08054570
	ldr r1, [r4, #0x4c]
	asrs r3, r1, #8
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r5, r0, #0
	cmp r3, r2
	bgt _08054504
	adds r2, r4, #0
	adds r2, #0x56
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08054504
	ldr r0, _080544F8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080544FC @ =sub_805462C
	str r0, [r1, #8]
	ldr r3, _08054500 @ =gUnknown_080D8F38
	ldrb r0, [r7]
	movs r1, #0x10
	cmp r0, #2
	bne _080544C4
	movs r1, #0x14
_080544C4:
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r7]
	movs r1, #0x10
	cmp r0, #2
	bne _080544D4
	movs r1, #0x14
_080544D4:
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r5, #0
	ldrsh r0, [r2, r5]
	rsbs r0, r0, #0
	strh r0, [r2]
	ldr r0, [sp, #8]
	lsls r2, r0, #8
	b _080545FA
	.align 2, 0
_080544F8: .4byte gCurTask
_080544FC: .4byte sub_805462C
_08054500: .4byte gUnknown_080D8F38
_08054504:
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	ldr r3, [sp, #8]
	lsls r2, r3, #8
	cmp r1, r0
	blt _080545FA
	adds r3, r4, #0
	adds r3, #0x56
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, #0
	ble _080545FA
	ldr r0, _08054564 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054568 @ =sub_805462C
	str r0, [r1, #8]
	ldr r4, _0805456C @ =gUnknown_080D8F38
	ldrb r0, [r7]
	movs r1, #0x10
	cmp r0, #2
	bne _08054536
	movs r1, #0x14
_08054536:
	adds r0, r1, r4
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r7]
	movs r1, #0x10
	cmp r0, #2
	bne _08054546
	movs r1, #0x14
_08054546:
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	strh r0, [r3]
	b _080545FA
	.align 2, 0
_08054564: .4byte gCurTask
_08054568: .4byte sub_805462C
_0805456C: .4byte gUnknown_080D8F38
_08054570:
	ldr r1, [r4, #0x50]
	asrs r3, r1, #8
	mov r2, r8
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r5, r0, #0
	cmp r3, r2
	bgt _08054594
	adds r2, r4, #0
	adds r2, #0x58
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08054594
	rsbs r0, r0, #0
	strh r0, [r2]
	b _080545B2
_08054594:
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2, #6]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080545B2
	adds r1, r4, #0
	adds r1, #0x58
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080545B2
	rsbs r0, r0, #0
	strh r0, [r1]
_080545B2:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080545D0
	ldr r0, _080545CC @ =gPlayer
	ldr r0, [r0, #8]
	ldr r1, [sp, #8]
	lsls r2, r1, #8
	cmp r0, r2
	blt _080545DC
	b _080545FA
	.align 2, 0
_080545CC: .4byte gPlayer
_080545D0:
	ldr r0, _0805461C @ =gPlayer
	ldr r0, [r0, #8]
	ldr r3, [sp, #8]
	lsls r2, r3, #8
	cmp r0, r2
	ble _080545FA
_080545DC:
	ldr r0, _08054620 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054624 @ =sub_805462C
	str r0, [r1, #8]
	ldr r1, _08054628 @ =gUnknown_080D8F38
	ldrh r0, [r1, #0x14]
	strh r0, [r6, #0xa]
	ldrh r1, [r1, #0x16]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_080545FA:
	ldr r5, [sp, #0xc]
	lsls r1, r5, #8
	adds r0, r2, #0
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08054610:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805461C: .4byte gPlayer
_08054620: .4byte gCurTask
_08054624: .4byte sub_805462C
_08054628: .4byte gUnknown_080D8F38

	thumb_func_start sub_805462C
sub_805462C: @ 0x0805462C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _080546A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldr r2, _080546A4 @ =IWRAM_START + 0x54
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r0, #1
	bhi _080546B0
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r4]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080546A8 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08054692
	lsls r0, r0, #8
	ldr r1, [r5, #0x50]
	adds r1, r1, r0
	str r1, [r5, #0x50]
	ldr r0, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r4]
	ldr r3, _080546AC @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08054692:
	cmp r0, #0
	ble _080546FC
	lsls r1, r0, #8
	ldr r0, [r5, #0x50]
	adds r0, r0, r1
	str r0, [r5, #0x50]
	b _080546FC
	.align 2, 0
_080546A0: .4byte gCurTask
_080546A4: .4byte IWRAM_START + 0x54
_080546A8: .4byte sub_801EE64
_080546AC: .4byte sub_801EC3C
_080546B0:
	cmp r0, #2
	bne _080546E0
	ldr r2, _080546D4 @ =gSineTable
	ldr r0, _080546D8 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080546DC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #4
	str r0, [r5, #0x50]
	b _080546FC
	.align 2, 0
_080546D4: .4byte gSineTable
_080546D8: .4byte gUnknown_03005590
_080546DC: .4byte 0x000003FF
_080546E0:
	ldr r2, _08054778 @ =gSineTable
	ldr r0, _0805477C @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054780 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #4
	str r0, [r5, #0x4c]
_080546FC:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	asrs r3, r0, #8
	str r3, [sp, #8]
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x50]
	adds r0, r0, r1
	asrs r2, r0, #8
	str r2, [sp, #0xc]
	ldr r1, _08054784 @ =gCamera
	ldr r0, [r1]
	adds r4, r3, #0
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	ldr r4, _08054788 @ =gPlayer
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080547F8
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080547F8
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r4, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _08054808
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _0805478C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _08054790 @ =0x0000FC80
	strh r0, [r4, #0x12]
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08054798
	ldr r0, _08054794 @ =0xFFFFFBFF
	ands r1, r0
	b _0805479A
	.align 2, 0
_08054778: .4byte gSineTable
_0805477C: .4byte gUnknown_03005590
_08054780: .4byte 0x000003FF
_08054784: .4byte gCamera
_08054788: .4byte gPlayer
_0805478C: .4byte 0xFFFFFEFF
_08054790: .4byte 0x0000FC80
_08054794: .4byte 0xFFFFFBFF
_08054798:
	orrs r1, r2
_0805479A:
	str r1, [r6, #0x10]
	ldr r0, _080547EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080547F0 @ =sub_8054904
	str r0, [r1, #8]
	ldr r3, _080547F4 @ =gUnknown_080D8F38
	adds r1, r5, #0
	adds r1, #0x54
	ldrb r0, [r1]
	movs r2, #4
	cmp r0, #1
	bls _080547B4
	movs r2, #0xc
_080547B4:
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	movs r1, #4
	cmp r0, #1
	bls _080547C4
	movs r1, #0xc
_080547C4:
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r0, #0x99
	bl m4aSongNumStart
	b _080548EE
	.align 2, 0
_080547EC: .4byte gCurTask
_080547F0: .4byte sub_8054904
_080547F4: .4byte gUnknown_080D8F38
_080547F8:
	adds r0, r6, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08054862
_08054808:
	ldr r0, [r5, #0x44]
	asrs r2, r0, #8
	ldr r3, _0805486C @ =gCamera
	ldr r1, [r3]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _0805483A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805483A
	ldr r0, [r5, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805483A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08054874
_0805483A:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805485E
	movs r4, #0x18
	ldrsh r0, [r6, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _0805485E
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054874
_0805485E:
	ldrb r0, [r5, #8]
	strb r0, [r7]
_08054862:
	ldr r0, _08054870 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080548EE
	.align 2, 0
_0805486C: .4byte gCamera
_08054870: .4byte gCurTask
_08054874:
	ldr r1, [sp, #8]
	lsls r0, r1, #8
	ldr r2, [sp, #0xc]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _080548E8
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080548A4
	ldr r0, _080548A0 @ =0xFFFFFBFF
	ands r1, r0
	b _080548A6
	.align 2, 0
_080548A0: .4byte 0xFFFFFBFF
_080548A4:
	orrs r1, r2
_080548A6:
	str r1, [r6, #0x10]
	ldr r3, _080548F8 @ =gUnknown_080D8F38
	adds r4, r5, #0
	adds r4, #0x54
	ldrb r2, [r4]
	movs r1, #2
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r4]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080548FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054900 @ =sub_8054224
	str r0, [r1, #8]
_080548E8:
	adds r0, r6, #0
	bl sub_80051E8
_080548EE:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080548F8: .4byte gUnknown_080D8F38
_080548FC: .4byte gCurTask
_08054900: .4byte sub_8054224

	thumb_func_start sub_8054904
sub_8054904: @ 0x08054904
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08054984 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov r8, r0
	ldr r2, [r4]
	mov sb, r2
	ldr r3, _08054988 @ =IWRAM_START + 0x54
	adds r7, r1, r3
	ldrb r0, [r7]
	cmp r0, #1
	bhi _08054994
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r7]
	movs r3, #0
	str r3, [sp]
	ldr r3, _0805498C @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08054974
	lsls r0, r0, #8
	ldr r1, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x50]
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r7]
	ldr r3, _08054990 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08054974:
	cmp r0, #0
	ble _080549E0
	lsls r1, r0, #8
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
	b _080549E0
	.align 2, 0
_08054984: .4byte gCurTask
_08054988: .4byte IWRAM_START + 0x54
_0805498C: .4byte sub_801EE64
_08054990: .4byte sub_801EC3C
_08054994:
	cmp r0, #2
	bne _080549C4
	ldr r2, _080549B8 @ =gSineTable
	ldr r0, _080549BC @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080549C0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r7, #0
	ldrsh r0, [r0, r7]
	asrs r0, r0, #4
	str r0, [r4, #0x50]
	b _080549E0
	.align 2, 0
_080549B8: .4byte gSineTable
_080549BC: .4byte gUnknown_03005590
_080549C0: .4byte 0x000003FF
_080549C4:
	ldr r2, _08054A68 @ =gSineTable
	ldr r0, _08054A6C @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054A70 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #4
	str r0, [r4, #0x4c]
_080549E0:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r3, _08054A74 @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	mov r2, r8
	strh r0, [r2, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r2, #0x18]
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r1, r7
	cmp r2, r0
	bgt _08054A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08054A30
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08054A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08054A7C
_08054A30:
	mov r7, r8
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054A56
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08054A56
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054A7C
_08054A56:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08054A78 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054AD4
	.align 2, 0
_08054A68: .4byte gSineTable
_08054A6C: .4byte gUnknown_03005590
_08054A70: .4byte 0x000003FF
_08054A74: .4byte gCamera
_08054A78: .4byte gCurTask
_08054A7C:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	cmp r0, #0
	bne _08054ACE
	ldr r3, _08054AE4 @ =gUnknown_080D8F38
	adds r4, #0x54
	ldrb r2, [r4]
	movs r1, #2
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r7, r8
	strh r0, [r7, #0xa]
	ldrb r0, [r4]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08054AE8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054AEC @ =sub_8054224
	str r0, [r1, #8]
_08054ACE:
	mov r0, r8
	bl sub_80051E8
_08054AD4:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054AE4: .4byte gUnknown_080D8F38
_08054AE8: .4byte gCurTask
_08054AEC: .4byte sub_8054224

	thumb_func_start initSprite_Enemy_Bell
initSprite_Enemy_Bell: @ 0x08054AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sb, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08054BD4 @ =sub_8054BF4
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r1, _08054BD8 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _08054BDC @ =IWRAM_START + 0xC
	adds r6, r3, r2
	ldr r0, _08054BE0 @ =IWRAM_START + 0x4C
	adds r2, r3, r0
	movs r0, #0
	mov sl, r0
	movs r0, #0x78
	strb r0, [r2]
	movs r7, #0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r2, r8
	str r2, [r1]
	ldrb r0, [r2]
	strb r0, [r1, #8]
	mov r0, sb
	strb r0, [r1, #9]
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
	movs r0, #0x14
	str r3, [sp, #4]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08054BE4 @ =0x000001ED
	strh r0, [r6, #0xa]
	ldr r3, [sp, #4]
	ldr r2, _08054BE8 @ =IWRAM_START + 0x2C
	adds r0, r3, r2
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	mov r0, sl
	strh r0, [r6, #8]
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x1c]
	adds r2, #1
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08054BEC @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08054BF0 @ =IWRAM_START + 0x31
	adds r3, r3, r1
	strb r7, [r3]
	subs r0, #0x11
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054BD4: .4byte sub_8054BF4
_08054BD8: .4byte TaskDestructor_80095E8
_08054BDC: .4byte IWRAM_START + 0xC
_08054BE0: .4byte IWRAM_START + 0x4C
_08054BE4: .4byte 0x000001ED
_08054BE8: .4byte IWRAM_START + 0x2C
_08054BEC: .4byte IWRAM_START + 0x2E
_08054BF0: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8054BF4
sub_8054BF4: @ 0x08054BF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08054C48 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r1, _08054C4C @ =IWRAM_START + 0xC
	adds r6, r7, r1
	ldr r2, [r0]
	mov sl, r2
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r0, #0x48]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08054C50 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08054C54
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08054D06
	.align 2, 0
_08054C48: .4byte gCurTask
_08054C4C: .4byte IWRAM_START + 0xC
_08054C50: .4byte gCamera
_08054C54:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054C78
	movs r2, #0x18
	ldrsh r0, [r6, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08054C78
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054C90
_08054C78:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _08054C8C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054D06
	.align 2, 0
_08054C8C: .4byte gCurTask
_08054C90:
	ldr r0, _08054CBC @ =IWRAM_START + 0x4C
	adds r3, r7, r0
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08054CF0
	ldr r2, _08054CC0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08054CC4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08054CC8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08054CCC
	movs r0, #0x7c
	b _08054CCE
	.align 2, 0
_08054CBC: .4byte IWRAM_START + 0x4C
_08054CC0: .4byte gPseudoRandom
_08054CC4: .4byte 0x00196225
_08054CC8: .4byte 0x3C6EF35F
_08054CCC:
	movs r0, #0xb4
_08054CCE:
	strb r0, [r3]
	ldr r0, _08054D14 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054D18 @ =sub_8054D20
	str r0, [r1, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	ldr r0, _08054D1C @ =0x000001ED
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08054CF0:
	mov r2, r8
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08054D06:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054D14: .4byte gCurTask
_08054D18: .4byte sub_8054D20
_08054D1C: .4byte 0x000001ED

	thumb_func_start sub_8054D20
sub_8054D20: @ 0x08054D20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08054D98 @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r7, r1, r0
	ldr r6, _08054D9C @ =IWRAM_START + 0xC
	add r6, r8
	ldr r0, [r7]
	mov sb, r0
	ldr r1, [r7, #0x44]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x48]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08054DA0 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_800C84C
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054D88
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08054D88
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054DA4
_08054D88:
	ldrb r0, [r7, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r0, _08054D98 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054DEA
	.align 2, 0
_08054D98: .4byte gCurTask
_08054D9C: .4byte IWRAM_START + 0xC
_08054DA0: .4byte gCamera
_08054DA4:
	ldr r1, _08054DF8 @ =IWRAM_START + 0x4C
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08054DDE
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08054DFC @ =0x000001ED
	strh r0, [r6, #0xa]
	ldr r1, _08054E00 @ =IWRAM_START + 0x2C
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08054E04 @ =IWRAM_START + 0x2D
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x30]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _08054E08 @ =sub_8054BF4
	str r0, [r1, #8]
_08054DDE:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08054DEA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054DF8: .4byte IWRAM_START + 0x4C
_08054DFC: .4byte 0x000001ED
_08054E00: .4byte IWRAM_START + 0x2C
_08054E04: .4byte IWRAM_START + 0x2D
_08054E08: .4byte sub_8054BF4

	thumb_func_start initSprite_Enemy_Yado
initSprite_Enemy_Yado: @ 0x08054E0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08054E60 @ =sub_8054F00
	ldr r2, _08054E64 @ =0x00004090
	ldr r1, _08054E68 @ =sub_80554AC
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	strh r5, [r3, #4]
	mov r0, r8
	strh r0, [r3, #6]
	str r7, [r3]
	ldrb r0, [r7]
	strb r0, [r3, #8]
	strb r4, [r3, #9]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08054E70
	ldr r4, _08054E6C @ =IWRAM_START + 0x4D
	adds r1, r1, r4
	movs r0, #1
	b _08054E76
	.align 2, 0
_08054E60: .4byte sub_8054F00
_08054E64: .4byte 0x00004090
_08054E68: .4byte sub_80554AC
_08054E6C: .4byte IWRAM_START + 0x4D
_08054E70:
	ldr r0, _08054EF8 @ =IWRAM_START + 0x4D
	adds r1, r1, r0
	movs r0, #0
_08054E76:
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r4, r8
	lsls r2, r4, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08054EFC @ =0x000001F1
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054EF8: .4byte IWRAM_START + 0x4D
_08054EFC: .4byte 0x000001F1

	thumb_func_start sub_8054F00
sub_8054F00: @ 0x08054F00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08054FB4 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, sb
	mov sl, r0
	ldr r7, _08054FB8 @ =IWRAM_START + 0xC
	add r7, sb
	ldr r2, [r0]
	str r2, [sp, #8]
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r0, #0x48]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r3, _08054FBC @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	movs r4, #0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r0, _08054FC0 @ =gPlayer
	mov r8, r0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C204
	adds r4, r0, #0
	cmp r4, #1
	bne _08054F7C
	movs r0, #0x99
	bl m4aSongNumStart
	movs r0, #0xf7
	lsls r0, r0, #8
	mov r1, r8
	strh r0, [r1, #0x12]
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	mov r0, r8
	adds r0, #0x6c
	strb r4, [r0]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x99
	bl m4aSongNumStart
_08054F7C:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054FA0
	movs r2, #0x18
	ldrsh r0, [r7, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08054FA0
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054FC4
_08054FA0:
	mov r1, sl
	ldrb r0, [r1, #8]
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, _08054FB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055068
	.align 2, 0
_08054FB4: .4byte gCurTask
_08054FB8: .4byte IWRAM_START + 0xC
_08054FBC: .4byte gCamera
_08054FC0: .4byte gPlayer
_08054FC4:
	ldr r1, _08054FF8 @ =IWRAM_START + 0x4C
	add r1, sb
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08055010
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08054FFC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08055000 @ =sub_8055084
	str r0, [r1, #8]
	ldr r0, _08055004 @ =0x000001F1
	strh r0, [r7, #0xa]
	ldr r1, _08055008 @ =IWRAM_START + 0x2C
	add r1, sb
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0805500C @ =IWRAM_START + 0x2D
	add r1, sb
	ldrb r0, [r1]
	orrs r0, r2
	b _08055050
	.align 2, 0
_08054FF8: .4byte IWRAM_START + 0x4C
_08054FFC: .4byte gCurTask
_08055000: .4byte sub_8055084
_08055004: .4byte 0x000001F1
_08055008: .4byte IWRAM_START + 0x2C
_0805500C: .4byte IWRAM_START + 0x2D
_08055010:
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r2, r0, #8
	cmp r2, r5
	bge _08055026
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08055038
_08055026:
	cmp r2, r5
	ble _08055052
	ldr r0, [r7, #0x10]
	mvns r0, r0
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08055052
_08055038:
	ldr r0, _08055078 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805507C @ =sub_8055378
	str r0, [r1, #8]
	ldr r0, _08055080 @ =0x000001F1
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
_08055050:
	strb r0, [r1]
_08055052:
	mov r2, sl
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08055068:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055078: .4byte gCurTask
_0805507C: .4byte sub_8055378
_08055080: .4byte 0x000001F1

	thumb_func_start sub_8055084
sub_8055084: @ 0x08055084
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r0, _080550F0 @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #0x12
	add r1, r8
	mov sb, r1
	ldr r5, _080550F4 @ =IWRAM_START + 0xC
	add r5, r8
	ldr r2, [r1]
	str r2, [sp, #0x1c]
	ldr r0, [r1, #0x44]
	asrs r7, r0, #8
	str r7, [sp, #0x20]
	ldr r0, [r1, #0x48]
	asrs r6, r0, #8
	str r6, [sp, #0x24]
	ldr r1, _080550F8 @ =gCamera
	ldr r0, [r1]
	adds r2, r7, #0
	subs r0, r2, r0
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #0x24]
	subs r0, r1, r0
	strh r0, [r5, #0x18]
	ldr r4, _080550FC @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0805511C
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #1
	bl sub_800C4FC
	cmp r0, #1
	bne _08055100
	mov r2, sl
	ldr r0, [r2]
	bl TaskDestroy
	b _08055364
	.align 2, 0
_080550F0: .4byte gCurTask
_080550F4: .4byte IWRAM_START + 0xC
_080550F8: .4byte gCamera
_080550FC: .4byte gPlayer
_08055100:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C204
	adds r2, r0, #0
	cmp r2, #1
	beq _0805511A
	b _0805525C
_0805511A:
	b _08055134
_0805511C:
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C204
	adds r2, r0, #0
	cmp r2, #1
	bne _08055156
_08055134:
	movs r0, #0xf7
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6c
	strb r2, [r0]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x99
	bl m4aSongNumStart
	b _0805525C
_08055156:
	adds r4, r7, #0
	str r6, [sp, #0x28]
	ldr r0, _0805524C @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	bne _08055164
	b _0805525C
_08055164:
	mov ip, r0
	mov r2, sl
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	mov r2, ip
	ldr r1, [r2, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805525C
	ldr r0, _08055250 @ =IWRAM_START + 0x38
	add r0, r8
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	mov r1, ip
	ldr r0, [r1]
	asrs r0, r0, #8
	adds r1, #0x50
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _080551B0
	ldr r0, _08055254 @ =IWRAM_START + 0x3A
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _080551C2
	cmp r2, r1
	blt _0805525C
_080551B0:
	mov r0, ip
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0805525C
_080551C2:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r6, #0
	ldrsb r6, [r0, r6]
	ldr r2, [sp, #0x28]
	adds r3, r2, r6
	mov r1, ip
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	adds r1, #0x51
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, r1
	cmp r3, r2
	bgt _080551F8
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r2
	bge _0805520A
	cmp r3, r2
	blt _0805525C
_080551F8:
	mov r0, ip
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	blt _0805525C
_0805520A:
	ldr r0, _08055258 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08055226
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	ldrh r1, [r7, #4]
	strb r1, [r0, #1]
	ldrh r1, [r7, #6]
	strb r1, [r0, #2]
	ldrb r1, [r7, #9]
	strb r1, [r0, #3]
_08055226:
	lsls r5, r4, #0x10
	asrs r5, r5, #0x10
	ldr r2, [sp, #0x28]
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802DB14
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8009530
	b _08055288
	.align 2, 0
_0805524C: .4byte gUnknown_030056A4
_08055250: .4byte IWRAM_START + 0x38
_08055254: .4byte IWRAM_START + 0x3A
_08055258: .4byte gGameMode
_0805525C:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055280
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08055280
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055298
_08055280:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp, #0x1c]
	strb r0, [r2]
_08055288:
	ldr r0, _08055294 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055364
	.align 2, 0
_08055294: .4byte gCurTask
_08055298:
	mov r1, sb
	ldr r0, [r1, #0x44]
	ldr r1, [r1, #0x48]
	bl sub_80122DC
	mov r2, sb
	adds r2, #0x4c
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	movs r3, #0xff
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _080552E4
	movs r0, #0x78
	strb r0, [r2]
	movs r1, #0
	ldr r0, _080552D8 @ =0x000001F1
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _080552DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080552E0 @ =sub_8054F00
	str r0, [r1, #8]
	b _08055358
	.align 2, 0
_080552D8: .4byte 0x000001F1
_080552DC: .4byte gCurTask
_080552E0: .4byte sub_8054F00
_080552E4:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bne _08055340
	add r1, sp, #8
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0xf9
	lsls r0, r0, #1
	strh r0, [r1, #2]
	adds r0, r1, #0
	strb r2, [r0, #4]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08055318
	ldr r0, [sp, #0x20]
	adds r0, #6
	lsls r0, r0, #8
	str r0, [sp, #0x14]
	add r1, sp, #8
	movs r0, #0
	b _08055326
_08055318:
	ldr r0, [sp, #0x20]
	subs r0, #5
	lsls r0, r0, #8
	str r0, [sp, #0x14]
	add r1, sp, #8
	movs r0, #0x80
	lsls r0, r0, #2
_08055326:
	strh r0, [r1, #6]
	ldr r0, [sp, #0x24]
	subs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #0x18]
	add r1, sp, #8
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r1, #8]
	adds r0, r1, #0
	bl sub_8050E04
	b _08055358
_08055340:
	cmp r0, #6
	bne _08055358
	ldr r0, _08055374 @ =0x000001F1
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_08055358:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08055364:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055374: .4byte 0x000001F1

	thumb_func_start sub_8055378
sub_8055378: @ 0x08055378
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08055424 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r0, _08055428 @ =IWRAM_START + 0xC
	adds r7, r1, r0
	mov r1, r8
	ldr r1, [r1]
	mov sb, r1
	mov r2, r8
	ldr r1, [r2, #0x44]
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r2, #0x48]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r3, _0805542C @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	movs r4, #0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r5, _08055430 @ =gPlayer
	str r5, [sp]
	str r4, [sp, #4]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C204
	adds r2, r0, #0
	cmp r2, #1
	bne _080553EC
	movs r0, #0xf7
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6c
	strb r2, [r0]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x99
	bl m4aSongNumStart
_080553EC:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055410
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08055410
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055434
_08055410:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sb
	strb r0, [r2]
	ldr r0, _08055424 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805549E
	.align 2, 0
_08055424: .4byte gCurTask
_08055428: .4byte IWRAM_START + 0xC
_0805542C: .4byte gCamera
_08055430: .4byte gPlayer
_08055434:
	mov r1, r8
	ldr r0, [r1, #0x44]
	ldr r1, [r1, #0x48]
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	cmp r0, #0
	bne _08055498
	adds r0, r7, #0
	bl sub_80051E8
	ldr r1, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08055468
	ldr r0, _08055464 @ =0xFFFFFBFF
	ands r1, r0
	b _0805546A
	.align 2, 0
_08055464: .4byte 0xFFFFFBFF
_08055468:
	orrs r1, r2
_0805546A:
	str r1, [r7, #0x10]
	movs r1, #0
	ldr r0, _0805548C @ =0x000001F1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08055490 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08055494 @ =sub_8054F00
	str r0, [r1, #8]
	b _0805549E
	.align 2, 0
_0805548C: .4byte 0x000001F1
_08055490: .4byte gCurTask
_08055494: .4byte sub_8054F00
_08055498:
	adds r0, r7, #0
	bl sub_80051E8
_0805549E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80554AC
sub_80554AC: @ 0x080554AC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_PikoPiko
initSprite_Enemy_PikoPiko: @ 0x080554C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _0805552C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080554EE
	ldr r0, _08055530 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080554EE
	b _080555F2
_080554EE:
	ldr r0, _08055534 @ =sub_805560C
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r1, _08055538 @ =sub_80557DC
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov sb, r0
	strh r6, [r7, #4]
	mov r2, r8
	strh r2, [r7, #6]
	str r4, [r7]
	ldrb r0, [r4]
	strb r0, [r7, #8]
	strb r5, [r7, #9]
	movs r0, #4
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08055540
	ldr r3, _0805553C @ =IWRAM_START + 0x54
	adds r1, r1, r3
	movs r0, #1
	b _08055546
	.align 2, 0
_0805552C: .4byte gGameMode
_08055530: .4byte gUnknown_030054EC
_08055534: .4byte sub_805560C
_08055538: .4byte sub_80557DC
_0805553C: .4byte IWRAM_START + 0x54
_08055540:
	ldr r0, _08055604 @ =IWRAM_START + 0x54
	adds r1, r1, r0
	movs r0, #0
_08055546:
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x56
	movs r2, #0
	mov sl, r2
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r6, r6, #8
	adds r1, r1, r6
	lsls r1, r1, #8
	str r1, [r7, #0x44]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r5, r3, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	str r2, [r7, #0x4c]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, r7, #0
	adds r2, #0x54
	ldrb r2, [r2]
	mov r3, sl
	str r3, [sp]
	ldr r3, _08055608 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r7, #0x50]
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r6
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r1, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r4]
	movs r0, #0x1e
	bl VramMalloc
	mov r3, sb
	str r0, [r3, #4]
	movs r0, #0xf7
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	mov r0, sb
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r3, #0x1a]
	mov r2, sl
	strh r2, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x1c]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sb
	adds r0, #0x25
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, sb
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
_080555F2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055604: .4byte IWRAM_START + 0x54
_08055608: .4byte sub_801EE64

	thumb_func_start sub_805560C
sub_805560C: @ 0x0805560C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	ldr r0, _080556E4 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r1, _080556E8 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r4]
	mov r8, r2
	ldr r5, _080556EC @ =IWRAM_START + 0x56
	adds r0, r3, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r4, #0x4c]
	adds r2, r2, r0
	str r2, [r4, #0x4c]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080556F0 @ =IWRAM_START + 0x54
	adds r5, r3, r2
	ldrb r2, [r5]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080556F4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08055682
	lsls r0, r0, #8
	ldr r1, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x50]
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r5]
	ldr r3, _080556F8 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08055682:
	cmp r0, #0
	ble _0805568E
	lsls r1, r0, #8
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
_0805568E:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	asrs r6, r0, #8
	str r6, [sp, #8]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r5, r0, #8
	str r5, [sp, #0xc]
	ldr r1, _080556FC @ =gCamera
	ldr r0, [r1]
	adds r3, r6, #0
	subs r0, r3, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	strh r0, [r7, #0x18]
	ldr r0, _08055700 @ =gPlayer
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	beq _08055704
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #1
	bne _08055704
	mov r2, sb
	ldr r0, [r2]
	bl TaskDestroy
	b _080557CE
	.align 2, 0
_080556E4: .4byte gCurTask
_080556E8: .4byte IWRAM_START + 0xC
_080556EC: .4byte IWRAM_START + 0x56
_080556F0: .4byte IWRAM_START + 0x54
_080556F4: .4byte sub_801EE64
_080556F8: .4byte sub_801EC3C
_080556FC: .4byte gCamera
_08055700: .4byte gPlayer
_08055704:
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	ldr r3, _0805576C @ =gCamera
	ldr r1, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08055736
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08055736
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08055736
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08055774
_08055736:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805575A
	movs r5, #0x18
	ldrsh r0, [r7, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0805575A
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055774
_0805575A:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08055770 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080557CE
	.align 2, 0
_0805576C: .4byte gCamera
_08055770: .4byte gCurTask
_08055774:
	ldr r1, [r4, #0x4c]
	asrs r3, r1, #8
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r5, r0, #0
	cmp r3, r2
	bgt _08055798
	adds r2, r4, #0
	adds r2, #0x56
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08055798
	rsbs r0, r0, #0
	strh r0, [r2]
	b _080557B6
_08055798:
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080557B6
	adds r3, r4, #0
	adds r3, #0x56
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, #0
	ble _080557B6
	rsbs r0, r0, #0
	strh r0, [r3]
_080557B6:
	ldr r2, [sp, #8]
	lsls r0, r2, #8
	ldr r3, [sp, #0xc]
	lsls r1, r3, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_080557CE:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80557DC
sub_80557DC: @ 0x080557DC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Circus
initSprite_Enemy_Circus: @ 0x080557F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0805584C @ =sub_8055950
	ldr r2, _08055850 @ =0x00004090
	ldr r1, _08055854 @ =sub_8055EC0
	str r1, [sp]
	movs r1, #0x8c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sl, r0
	ldr r0, _08055858 @ =IWRAM_START + 0xC
	adds r7, r1, r0
	mov r2, sl
	strh r5, [r2, #4]
	mov r0, r8
	strh r0, [r2, #6]
	str r6, [r2]
	ldrb r0, [r6]
	strb r0, [r2, #8]
	strb r4, [r2, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08055860
	ldr r2, _0805585C @ =IWRAM_START + 0x85
	adds r1, r1, r2
	movs r0, #1
	b _08055866
	.align 2, 0
_0805584C: .4byte sub_8055950
_08055850: .4byte 0x00004090
_08055854: .4byte sub_8055EC0
_08055858: .4byte IWRAM_START + 0xC
_0805585C: .4byte IWRAM_START + 0x85
_08055860:
	ldr r4, _08055948 @ =IWRAM_START + 0x85
	adds r1, r1, r4
	movs r0, #0
_08055866:
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r3, r5, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	mov r1, sl
	str r0, [r1, #0x7c]
	adds r1, #0x80
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r4, r8
	lsls r2, r4, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1]
	adds r1, #4
	movs r4, #0
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r5, #0
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0805594C @ =0x000001EF
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r2, #0x90
	lsls r2, r2, #3
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	mov sb, r1
	mov r2, sb
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	mov r7, sl
	adds r7, #0x44
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf8
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r1, sl
	adds r1, #0x64
	movs r0, #2
	strb r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x65
	subs r0, #3
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x66
	mov r2, sb
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	mov r4, r8
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055948: .4byte IWRAM_START + 0x85
_0805594C: .4byte 0x000001EF

	thumb_func_start sub_8055950
sub_8055950: @ 0x08055950
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _080559B8 @ =gCurTask
	ldr r0, [r1]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov r8, r0
	ldr r2, _080559BC @ =IWRAM_START + 0xC
	adds r4, r5, r2
	ldr r0, _080559C0 @ =IWRAM_START + 0x44
	adds r0, r0, r5
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r2, r8
	ldr r0, [r2, #0x7c]
	asrs r0, r0, #8
	mov sl, r0
	mov r6, sl
	ldr r0, _080559C4 @ =IWRAM_START + 0x80
	adds r0, r5, r0
	str r0, [sp, #4]
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r1, _080559C8 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	mov r1, sl
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080559CC
	ldr r1, _080559B8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08055A86
	.align 2, 0
_080559B8: .4byte gCurTask
_080559BC: .4byte IWRAM_START + 0xC
_080559C0: .4byte IWRAM_START + 0x44
_080559C4: .4byte IWRAM_START + 0x80
_080559C8: .4byte gCamera
_080559CC:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080559F0
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _080559F0
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055A08
_080559F0:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055A04 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055A86
	.align 2, 0
_08055A04: .4byte gCurTask
_08055A08:
	ldr r0, _08055A98 @ =IWRAM_START + 0x84
	adds r2, r5, r0
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r3, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08055A50
	ldr r0, _08055A9C @ =IWRAM_START + 0x88
	adds r1, r5, r0
	movs r0, #0xfb
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r0, _08055AA0 @ =IWRAM_START + 0x86
	adds r1, r5, r0
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r1]
	movs r0, #0x1e
	strb r0, [r2]
	ldr r2, _08055AA4 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08055AA8 @ =sub_8055AB8
	str r0, [r1, #8]
	ldr r0, _08055AAC @ =0x000001EF
	strh r0, [r4, #0xa]
	ldr r0, _08055AB0 @ =IWRAM_START + 0x2C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08055AB4 @ =IWRAM_START + 0x2D
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_08055A50:
	mov r1, r8
	ldr r0, [r1, #0x7c]
	ldr r2, [sp, #4]
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r4, #0x16]
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r4, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, sb
	mov r1, sl
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08055A86:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055A98: .4byte IWRAM_START + 0x84
_08055A9C: .4byte IWRAM_START + 0x88
_08055AA0: .4byte IWRAM_START + 0x86
_08055AA4: .4byte gCurTask
_08055AA8: .4byte sub_8055AB8
_08055AAC: .4byte 0x000001EF
_08055AB0: .4byte IWRAM_START + 0x2C
_08055AB4: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_8055AB8
sub_8055AB8: @ 0x08055AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08055B20 @ =gCurTask
	ldr r0, [r1]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _08055B24 @ =IWRAM_START + 0xC
	adds r4, r7, r2
	ldr r0, _08055B28 @ =IWRAM_START + 0x44
	adds r0, r0, r7
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r2, r8
	ldr r0, [r2, #0x7c]
	asrs r0, r0, #8
	mov sl, r0
	mov r5, sl
	ldr r0, _08055B2C @ =IWRAM_START + 0x80
	adds r0, r7, r0
	str r0, [sp, #4]
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r1, _08055B30 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	mov r1, sl
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08055B34
	ldr r1, _08055B20 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08055BFC
	.align 2, 0
_08055B20: .4byte gCurTask
_08055B24: .4byte IWRAM_START + 0xC
_08055B28: .4byte IWRAM_START + 0x44
_08055B2C: .4byte IWRAM_START + 0x80
_08055B30: .4byte gCamera
_08055B34:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055B58
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08055B58
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055B70
_08055B58:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055B6C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055BFC
	.align 2, 0
_08055B6C: .4byte gCurTask
_08055B70:
	mov r1, r8
	ldr r0, [r1, #0x7c]
	ldr r2, [sp, #4]
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08055BD8
	adds r0, r4, #0
	bl sub_80051E8
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	ldr r0, _08055BC0 @ =IWRAM_START + 0x84
	adds r1, r7, r0
	movs r0, #0x32
	strb r0, [r1]
	ldr r0, _08055BC4 @ =0x000001EF
	strh r0, [r4, #0xa]
	ldr r2, _08055BC8 @ =IWRAM_START + 0x2C
	adds r1, r7, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08055BCC @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08055BD0 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08055BD4 @ =sub_8055C0C
	str r0, [r1, #8]
	b _08055BFC
	.align 2, 0
_08055BC0: .4byte IWRAM_START + 0x84
_08055BC4: .4byte 0x000001EF
_08055BC8: .4byte IWRAM_START + 0x2C
_08055BCC: .4byte IWRAM_START + 0x2D
_08055BD0: .4byte gCurTask
_08055BD4: .4byte sub_8055C0C
_08055BD8:
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r4, #0x16]
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r4, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	adds r2, r6, #0
	subs r2, #0x20
	mov r0, sb
	mov r1, sl
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08055BFC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8055C0C
sub_8055C0C: @ 0x08055C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08055C98 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	str r0, [sp, #4]
	ldr r7, _08055C9C @ =IWRAM_START + 0xC
	add r7, r8
	ldr r2, _08055CA0 @ =IWRAM_START + 0x44
	add r2, r8
	mov sl, r2
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x7c]
	asrs r0, r0, #8
	mov sb, r0
	mov r4, sb
	ldr r2, _08055CA4 @ =IWRAM_START + 0x80
	add r2, r8
	str r2, [sp, #8]
	ldr r2, [r2]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r1, _08055CA8 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	ldr r0, _08055CAC @ =IWRAM_START + 0x88
	add r0, r8
	ldrh r1, [r0]
	adds r1, #0x31
	strh r1, [r0]
	ldr r6, _08055CB0 @ =IWRAM_START + 0x86
	add r6, r8
	ldrh r0, [r6]
	adds r0, r0, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r7, #0x18]
	adds r0, r0, r1
	subs r0, #0x20
	mov r1, sl
	strh r0, [r1, #0x18]
	ldrh r0, [r7, #0x16]
	strh r0, [r1, #0x16]
	adds r0, r7, #0
	mov r1, sb
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08055CB4
	ldr r2, _08055C98 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08055D54
	.align 2, 0
_08055C98: .4byte gCurTask
_08055C9C: .4byte IWRAM_START + 0xC
_08055CA0: .4byte IWRAM_START + 0x44
_08055CA4: .4byte IWRAM_START + 0x80
_08055CA8: .4byte gCamera
_08055CAC: .4byte IWRAM_START + 0x88
_08055CB0: .4byte IWRAM_START + 0x86
_08055CB4:
	ldrh r2, [r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	adds r2, r2, r5
	subs r2, #0x20
	mov r0, sl
	mov r1, sb
	bl sub_800C84C
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055CEA
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08055CEA
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055D00
_08055CEA:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055CFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055D54
	.align 2, 0
_08055CFC: .4byte gCurTask
_08055D00:
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x7c]
	ldr r2, [sp, #8]
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, sl
	bl sub_8004558
	mov r0, sl
	bl sub_80051E8
	ldr r1, _08055D64 @ =IWRAM_START + 0x84
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08055D54
	ldr r0, _08055D68 @ =0x000001EF
	strh r0, [r7, #0xa]
	ldr r1, _08055D6C @ =IWRAM_START + 0x2C
	add r1, r8
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08055D70 @ =IWRAM_START + 0x2D
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08055D74 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08055D78 @ =sub_8055D7C
	str r0, [r1, #8]
_08055D54:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055D64: .4byte IWRAM_START + 0x84
_08055D68: .4byte 0x000001EF
_08055D6C: .4byte IWRAM_START + 0x2C
_08055D70: .4byte IWRAM_START + 0x2D
_08055D74: .4byte gCurTask
_08055D78: .4byte sub_8055D7C

	thumb_func_start sub_8055D7C
sub_8055D7C: @ 0x08055D7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08055DE0 @ =gCurTask
	ldr r0, [r1]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _08055DE4 @ =IWRAM_START + 0xC
	adds r6, r7, r2
	ldr r0, _08055DE8 @ =IWRAM_START + 0x44
	adds r0, r0, r7
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r2, r8
	ldr r1, [r2, #0x7c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r0, _08055DEC @ =IWRAM_START + 0x80
	adds r0, r0, r7
	mov sl, r0
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08055DF0 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08055DF4
	ldr r1, _08055DE0 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08055EB0
	.align 2, 0
_08055DE0: .4byte gCurTask
_08055DE4: .4byte IWRAM_START + 0xC
_08055DE8: .4byte IWRAM_START + 0x44
_08055DEC: .4byte IWRAM_START + 0x80
_08055DF0: .4byte gCamera
_08055DF4:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055E18
	movs r2, #0x18
	ldrsh r0, [r6, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08055E18
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055E30
_08055E18:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055E2C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055EB0
	.align 2, 0
_08055E2C: .4byte gCurTask
_08055E30:
	mov r1, r8
	ldr r0, [r1, #0x7c]
	mov r2, sl
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _08055E8C
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, _08055E74 @ =IWRAM_START + 0x84
	adds r1, r7, r0
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08055E78 @ =0x000001EF
	strh r0, [r6, #0xa]
	ldr r2, _08055E7C @ =IWRAM_START + 0x2C
	adds r1, r7, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08055E80 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08055E84 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08055E88 @ =sub_8055950
	str r0, [r1, #8]
	b _08055E92
	.align 2, 0
_08055E74: .4byte IWRAM_START + 0x84
_08055E78: .4byte 0x000001EF
_08055E7C: .4byte IWRAM_START + 0x2C
_08055E80: .4byte IWRAM_START + 0x2D
_08055E84: .4byte gCurTask
_08055E88: .4byte sub_8055950
_08055E8C:
	adds r0, r6, #0
	bl sub_80051E8
_08055E92:
	ldrh r0, [r6, #0x16]
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	adds r2, r5, #0
	subs r2, #0x20
	mov r0, sb
	adds r1, r4, #0
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08055EB0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8055EC0
sub_8055EC0: @ 0x08055EC0
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x48]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Madillo
initSprite_Enemy_Madillo: @ 0x08055EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08055F38 @ =sub_8056014
	ldr r2, _08055F3C @ =0x00004040
	ldr r1, _08055F40 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov r8, r0
	strh r5, [r7, #4]
	mov r2, sl
	strh r2, [r7, #6]
	str r6, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #8]
	strb r4, [r7, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08055F48
	ldr r0, _08055F44 @ =IWRAM_START + 0x50
	adds r1, r1, r0
	movs r0, #1
	b _08055F4E
	.align 2, 0
_08055F38: .4byte sub_8056014
_08055F3C: .4byte 0x00004040
_08055F40: .4byte TaskDestructor_80095E8
_08055F44: .4byte IWRAM_START + 0x50
_08055F48:
	ldr r2, _08056004 @ =IWRAM_START + 0x50
	adds r1, r1, r2
	movs r0, #0
_08055F4E:
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #3
	lsls r5, r5, #8
	mov sb, r5
	add r1, sb
	lsls r1, r1, #8
	str r1, [r7, #0x3c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r2, sl
	lsls r5, r2, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r7, #0x40]
	movs r4, #0
	str r4, [r7, #0x44]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, r7, #0
	adds r2, #0x50
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _08056008 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	ldr r0, _0805600C @ =0xFFFFFE80
	str r0, [r7, #0x4c]
	adds r1, r7, #0
	adds r1, #0x51
	movs r0, #0x78
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, sb
	movs r7, #0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r1, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	movs r0, #0x10
	bl VramMalloc
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, _08056010 @ =0x000001F7
	strh r0, [r1, #0xa]
	mov r0, r8
	adds r0, #0x20
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x25
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, r8
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056004: .4byte IWRAM_START + 0x50
_08056008: .4byte sub_801EE64
_0805600C: .4byte 0xFFFFFE80
_08056010: .4byte 0x000001F7

	thumb_func_start sub_8056014
sub_8056014: @ 0x08056014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _080560C8 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _080560CC @ =IWRAM_START + 0xC
	adds r5, r3, r2
	ldr r0, [r4]
	mov sb, r0
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080560D0 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov r8, r2
	ldrb r2, [r2]
	ldr r3, _080560D4 @ =sub_801EC3C
	mov sl, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08056080
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	mov r3, sl
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08056080:
	cmp r0, #0
	ble _0805608C
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_0805608C:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r0, _080560D8 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080560DC
	ldr r1, _080560C8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08056214
	.align 2, 0
_080560C8: .4byte gCurTask
_080560CC: .4byte IWRAM_START + 0xC
_080560D0: .4byte IWRAM_START + 0x50
_080560D4: .4byte sub_801EC3C
_080560D8: .4byte gCamera
_080560DC:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805610E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805610E
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805610E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056148
_0805610E:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056132
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056132
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056148
_08056132:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08056144 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056214
	.align 2, 0
_08056144: .4byte gCurTask
_08056148:
	adds r1, r7, #0
	subs r1, #0x32
	lsls r1, r1, #8
	ldr r0, _080561A8 @ =gPlayer
	ldr r2, [r0, #0xc]
	adds r3, r0, #0
	lsls r0, r6, #8
	mov r8, r0
	cmp r1, r2
	bge _08056200
	adds r0, r7, #0
	adds r0, #0x32
	lsls r0, r0, #8
	cmp r0, r2
	ble _08056200
	ldr r1, [r3, #8]
	cmp r8, r1
	ble _080561BC
	adds r0, r6, #0
	subs r0, #0x78
	lsls r0, r0, #8
	cmp r0, r1
	bge _080561BC
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	cmp r1, r0
	ble _08056200
	ldr r0, _080561AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080561B0 @ =sub_8056230
	str r0, [r1, #8]
	ldr r0, _080561B4 @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _080561B8 @ =0xFFFFFBFF
	ands r0, r1
	b _080561FE
	.align 2, 0
_080561A8: .4byte gPlayer
_080561AC: .4byte gCurTask
_080561B0: .4byte sub_8056230
_080561B4: .4byte 0x000001F7
_080561B8: .4byte 0xFFFFFBFF
_080561BC:
	adds r0, r6, #0
	adds r0, #0x78
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r0, r1
	ble _08056200
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	mov r3, sb
	movs r0, #3
	ldrsb r0, [r3, r0]
	ldrb r2, [r3, #5]
	adds r0, r0, r2
	lsls r0, r0, #3
	cmp r1, r0
	bge _08056200
	ldr r0, _08056224 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056228 @ =sub_8056230
	str r0, [r1, #8]
	ldr r0, _0805622C @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080561FE:
	str r0, [r5, #0x10]
_08056200:
	lsls r1, r7, #8
	mov r0, r8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08056214:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056224: .4byte gCurTask
_08056228: .4byte sub_8056230
_0805622C: .4byte 0x000001F7

	thumb_func_start sub_8056230
sub_8056230: @ 0x08056230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08056264 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r1, [r4]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08056268
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	subs r0, r0, r1
	b _0805626E
	.align 2, 0
_08056264: .4byte gCurTask
_08056268:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
_0805626E:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	add r3, sp, #8
	str r3, [sp]
	ldr r3, _08056420 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080562BE
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _08056424 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_080562BE:
	cmp r0, #0
	ble _080562CA
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_080562CA:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x44]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r7, r0, #8
	ldr r1, _08056428 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r0, _0805642C @ =gPlayer
	mov sl, r0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	movs r1, #0xc
	add r1, ip
	mov sb, r1
	ldr r1, [r1, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080563B8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r3, r0, r6
	mov r2, sl
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r2, r0, r1
	cmp r3, r2
	bgt _08056340
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	bge _08056354
	cmp r3, r2
	blt _080563B8
_08056340:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	blt _080563B8
_08056354:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r3, r7
	mov r1, sl
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov ip, r0
	mov r1, sb
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	mov r1, ip
	add r1, r8
	cmp r2, r1
	bgt _08056390
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _080563A4
	cmp r2, r1
	blt _080563B8
_08056390:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, r8
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080563B8
_080563A4:
	mov r0, sl
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080563B8
	mov r0, sl
	bl sub_800CBA4
_080563B8:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	ldr r3, _08056428 @ =gCamera
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _080563EC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080563EC
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080563EC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056434
_080563EC:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056410
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056410
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056434
_08056410:
	ldrb r0, [r4, #8]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r0, _08056430 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805649E
	.align 2, 0
_08056420: .4byte sub_801EE64
_08056424: .4byte sub_801EC3C
_08056428: .4byte gCamera
_0805642C: .4byte gPlayer
_08056430: .4byte gCurTask
_08056434:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08056456
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]
	movs r0, #3
	ldrsb r0, [r2, r0]
	ldrb r3, [r2, #5]
	adds r0, r0, r3
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08056466
	b _0805648A
_08056456:
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	cmp r1, r0
	bge _0805648A
_08056466:
	ldr r0, _080564B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080564B4 @ =sub_80564BC
	str r0, [r1, #8]
	movs r1, #0
	ldr r0, _080564B8 @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x51
	movs r0, #0x78
	strb r0, [r1]
_0805648A:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0805649E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080564B0: .4byte gCurTask
_080564B4: .4byte sub_80564BC
_080564B8: .4byte 0x000001F7

	thumb_func_start sub_80564BC
sub_80564BC: @ 0x080564BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r0, _080564F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r7, r1, r0
	ldr r1, [r4]
	mov sb, r1
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080564F4
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	subs r0, r0, r1
	b _080564FA
	.align 2, 0
_080564F0: .4byte gCurTask
_080564F4:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
_080564FA:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	add r3, sp, #8
	str r3, [sp]
	ldr r3, _08056608 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _0805654A
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _0805660C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_0805654A:
	cmp r0, #0
	ble _08056556
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08056556:
	ldr r1, [r4, #0x4c]
	movs r0, #0x5a
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	str r0, [r4, #0x4c]
	adds r0, #0x1f
	cmp r0, #0x3e
	bhi _0805656E
	movs r0, #0
	str r0, [r4, #0x4c]
_0805656E:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r0, _08056610 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080565FC
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080565D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080565D2
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080565D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056618
_080565D2:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080565F6
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080565F6
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056618
_080565F6:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
_080565FC:
	ldr r0, _08056614 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056664
	.align 2, 0
_08056608: .4byte sub_801EE64
_0805660C: .4byte sub_801EC3C
_08056610: .4byte gCamera
_08056614: .4byte gCurTask
_08056618:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056658
	ldr r0, _08056674 @ =0xFFFFFE80
	str r0, [r4, #0x4c]
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08056678 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805667C @ =sub_8056014
	str r0, [r1, #8]
	movs r1, #0
	ldr r0, _08056680 @ =0x000001F7
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08056658:
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056664:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056674: .4byte 0xFFFFFE80
_08056678: .4byte gCurTask
_0805667C: .4byte sub_8056014
_08056680: .4byte 0x000001F7

	thumb_func_start initSprite_Enemy_Straw
initSprite_Enemy_Straw: @ 0x08056684
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldr r0, _080567B8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080566B2
	ldr r0, _080567BC @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _080567A8
_080566B2:
	ldr r0, _080567C0 @ =sub_8056964
	ldr r2, _080567C4 @ =0x00004040
	ldr r1, _080567C8 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, _080567CC @ =IWRAM_START + 0xC
	adds r5, r4, r0
	movs r1, #0
	mov sl, r1
	strh r6, [r2, #4]
	mov r0, r8
	strh r0, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r1, sb
	strb r1, [r2, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r6, r6, #8
	mov sb, r6
	add r0, sb
	lsls r0, r0, #8
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r6, r8
	lsls r6, r6, #8
	mov r8, r6
	add r0, r8
	lsls r0, r0, #8
	str r0, [r2, #0x40]
	movs r0, #0
	str r0, [r2, #0x44]
	str r0, [r2, #0x48]
	ldr r3, _080567D0 @ =gPseudoRandom
	ldr r1, [r3]
	ldr r0, _080567D4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080567D8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	ldr r1, _080567DC @ =0x000003FF
	ands r1, r0
	ldr r3, _080567E0 @ =gSineTable
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	str r0, [r2, #0x4c]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	str r0, [r2, #0x50]
	ldr r0, _080567E4 @ =IWRAM_START + 0x54
	adds r1, r4, r0
	movs r0, #0x64
	strb r0, [r1]
	ldr r6, _080567E8 @ =IWRAM_START + 0x55
	adds r1, r4, r6
	movs r0, #5
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	add r0, sb
	strh r0, [r5, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	add r0, r8
	strh r0, [r5, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0xfc
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	subs r6, #0x29
	adds r0, r4, r6
	mov r1, sl
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	movs r6, #0
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _080567EC @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r6, _080567F0 @ =IWRAM_START + 0x2E
	adds r1, r4, r6
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080567F4 @ =IWRAM_START + 0x31
	adds r4, r4, r0
	mov r1, sl
	strb r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_080567A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080567B8: .4byte gGameMode
_080567BC: .4byte gUnknown_030054EC
_080567C0: .4byte sub_8056964
_080567C4: .4byte 0x00004040
_080567C8: .4byte TaskDestructor_80095E8
_080567CC: .4byte IWRAM_START + 0xC
_080567D0: .4byte gPseudoRandom
_080567D4: .4byte 0x00196225
_080567D8: .4byte 0x3C6EF35F
_080567DC: .4byte 0x000003FF
_080567E0: .4byte gSineTable
_080567E4: .4byte IWRAM_START + 0x54
_080567E8: .4byte IWRAM_START + 0x55
_080567EC: .4byte IWRAM_START + 0x2D
_080567F0: .4byte IWRAM_START + 0x2E
_080567F4: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80567F8
sub_80567F8: @ 0x080567F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056854 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _08056858 @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r6]
	mov sl, r3
	ldr r1, [r6, #0x3c]
	ldr r0, [r6, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x40]
	ldr r0, [r6, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _0805685C @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08056860
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08056938
	.align 2, 0
_08056854: .4byte gCurTask
_08056858: .4byte IWRAM_START + 0xC
_0805685C: .4byte gCamera
_08056860:
	ldr r0, [r6, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056892
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056892
	ldr r0, [r6, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056892
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080568CC
_08056892:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080568B6
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080568B6
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080568CC
_080568B6:
	ldrb r0, [r6, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _080568C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056938
	.align 2, 0
_080568C8: .4byte gCurTask
_080568CC:
	adds r3, r6, #0
	adds r3, #0x54
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056924
	ldr r2, _08056948 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0805694C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08056950 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _08056954 @ =0x000003FF
	ands r1, r0
	ldr r2, _08056958 @ =gSineTable
	mov sb, r2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r8, r0
	add r8, sb
	mov r2, r8
	ldrh r2, [r2]
	mov r8, r2
	mov r0, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	str r0, [r6, #0x4c]
	lsls r1, r1, #1
	add r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	str r0, [r6, #0x50]
	movs r0, #0x64
	strb r0, [r3]
	ldr r0, _0805695C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056960 @ =sub_8056964
	str r0, [r1, #8]
_08056924:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056938:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056948: .4byte gPseudoRandom
_0805694C: .4byte 0x00196225
_08056950: .4byte 0x3C6EF35F
_08056954: .4byte 0x000003FF
_08056958: .4byte gSineTable
_0805695C: .4byte gCurTask
_08056960: .4byte sub_8056964

	thumb_func_start sub_8056964
sub_8056964: @ 0x08056964
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080569BC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r7, r1, r0
	ldr r1, [r4]
	mov sb, r1
	ldr r2, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r2, r2, r0
	str r2, [r4, #0x44]
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r2
	asrs r5, r0, #8
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r1, _080569C0 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r0, _080569C4 @ =gPlayer
	lsls r2, r5, #8
	ldr r1, [r0, #8]
	adds r3, r0, #0
	cmp r1, r2
	bge _080569C8
	ldr r0, [r4, #0x4c]
	subs r0, #0x10
	b _080569CC
	.align 2, 0
_080569BC: .4byte gCurTask
_080569C0: .4byte gCamera
_080569C4: .4byte gPlayer
_080569C8:
	ldr r0, [r4, #0x4c]
	adds r0, #0xb
_080569CC:
	str r0, [r4, #0x4c]
	ldr r0, [r3, #0xc]
	lsls r3, r6, #8
	mov r8, r3
	cmp r0, r8
	bge _080569DE
	ldr r0, [r4, #0x50]
	subs r0, #0x10
	b _080569E2
_080569DE:
	ldr r0, [r4, #0x50]
	adds r0, #0xb
_080569E2:
	str r0, [r4, #0x50]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08056A52
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	ldr r3, _08056A5C @ =gCamera
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov ip, r0
	cmp r2, ip
	bgt _08056A28
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056A28
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056A28
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056A64
_08056A28:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056A4C
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056A4C
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056A64
_08056A4C:
	ldrb r0, [r4, #8]
	mov r1, sb
	strb r0, [r1]
_08056A52:
	ldr r0, _08056A60 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056AE6
	.align 2, 0
_08056A5C: .4byte gCamera
_08056A60: .4byte gCurTask
_08056A64:
	adds r1, r4, #0
	adds r1, #0x54
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #0
	bne _08056AA4
	adds r1, #1
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _08056A98
	ldr r0, _08056A90 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056A94 @ =sub_8056AF4
	b _08056A9E
	.align 2, 0
_08056A90: .4byte gCurTask
_08056A94: .4byte sub_8056AF4
_08056A98:
	ldr r0, _08056AC0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056AC4 @ =sub_80567F8
_08056A9E:
	str r0, [r1, #8]
	movs r0, #0x1e
	strb r0, [r3]
_08056AA4:
	lsls r4, r5, #8
	adds r0, r4, #0
	mov r1, r8
	bl sub_80122DC
	ldr r0, _08056AC8 @ =gPlayer
	ldr r0, [r0, #8]
	cmp r0, r4
	bge _08056AD0
	ldr r0, [r7, #0x10]
	ldr r1, _08056ACC @ =0xFFFFFBFF
	ands r0, r1
	b _08056AD8
	.align 2, 0
_08056AC0: .4byte gCurTask
_08056AC4: .4byte sub_80567F8
_08056AC8: .4byte gPlayer
_08056ACC: .4byte 0xFFFFFBFF
_08056AD0:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_08056AD8:
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056AE6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8056AF4
sub_8056AF4: @ 0x08056AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056B5C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r3, _08056B60 @ =IWRAM_START + 0xC
	adds r7, r1, r3
	ldr r0, [r6]
	mov sl, r0
	ldr r2, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r2, r2, r0
	str r2, [r6, #0x44]
	ldr r3, [r6, #0x48]
	ldr r0, [r6, #0x50]
	adds r3, r3, r0
	str r3, [r6, #0x48]
	ldr r1, [r6, #0x3c]
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x40]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08056B64 @ =gCamera
	mov r8, r3
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08056B68
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08056BE8
	.align 2, 0
_08056B5C: .4byte gCurTask
_08056B60: .4byte IWRAM_START + 0xC
_08056B64: .4byte gCamera
_08056B68:
	ldr r0, [r6, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056B9A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056B9A
	ldr r0, [r6, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056B9A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056BD4
_08056B9A:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056BBE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056BBE
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056BD4
_08056BBE:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08056BD0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056BE8
	.align 2, 0
_08056BD0: .4byte gCurTask
_08056BD4:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056BE8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start initSprite_Enemy_Hammerhead
initSprite_Enemy_Hammerhead: @ 0x08056BF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _08056CE0 @ =sub_8056D08
	ldr r2, _08056CE4 @ =0x00004040
	ldr r1, _08056CE8 @ =sub_8056EEC
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r2, _08056CEC @ =IWRAM_START + 0xC
	adds r6, r5, r2
	movs r7, #0
	strh r4, [r0, #4]
	mov r1, r8
	strh r1, [r0, #6]
	mov r2, sl
	str r2, [r0]
	ldrb r1, [r2]
	strb r1, [r0, #8]
	mov r1, sb
	strb r1, [r0, #9]
	str r7, [r0, #0x48]
	bl sub_8056EDC
	ldr r2, _08056CF0 @ =IWRAM_START + 0x4C
	adds r1, r5, r2
	movs r0, #4
	strh r0, [r1]
	mov r0, sl
	ldrb r1, [r0, #6]
	subs r2, #8
	adds r0, r5, r2
	strh r1, [r0]
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r0, r8
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08056CF4 @ =0x000001F3
	strh r0, [r6, #0xa]
	ldr r1, _08056CF8 @ =IWRAM_START + 0x2C
	adds r0, r5, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r7, [r6, #8]
	strh r7, [r6, #0x14]
	strh r7, [r6, #0x1c]
	ldr r0, _08056CFC @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08056D00 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08056D04 @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056CE0: .4byte sub_8056D08
_08056CE4: .4byte 0x00004040
_08056CE8: .4byte sub_8056EEC
_08056CEC: .4byte IWRAM_START + 0xC
_08056CF0: .4byte IWRAM_START + 0x4C
_08056CF4: .4byte 0x000001F3
_08056CF8: .4byte IWRAM_START + 0x2C
_08056CFC: .4byte IWRAM_START + 0x2D
_08056D00: .4byte IWRAM_START + 0x2E
_08056D04: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8056D08
sub_8056D08: @ 0x08056D08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056DB4 @ =gPlayer
	mov r8, r0
	ldr r0, _08056DB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r1, _08056DBC @ =IWRAM_START + 0xC
	adds r6, r4, r1
	ldr r2, [r5]
	mov sl, r2
	ldr r3, _08056DC0 @ =gGameMode
	mov sb, r3
	ldrb r0, [r3]
	cmp r0, #2
	bls _08056D3A
	adds r0, r5, #0
	bl sub_8056EDC
_08056D3A:
	ldr r1, _08056DC4 @ =IWRAM_START + 0x4C
	adds r0, r4, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, _08056DC8 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r3, _08056DCC @ =IWRAM_START + 0x44
	adds r1, r4, r3
	lsrs r0, r0, #1
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r2, r0
	ldr r2, _08056DD0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	ldr r2, [r5, #0x48]
	ldr r1, _08056DD4 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #3
	str r0, [r5, #0x48]
	subs r0, r0, r2
	mov ip, r0
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r7, r1, r0
	mov r0, sl
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r4, r1, r0
	ldr r1, _08056DD8 @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	mov r3, sb
	ldrb r0, [r3]
	cmp r0, #2
	bls _08056DDC
	ldr r1, [r1, #4]
	subs r1, r4, r1
	ldr r0, [r5, #0x58]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	b _08056DE6
	.align 2, 0
_08056DB4: .4byte gPlayer
_08056DB8: .4byte gCurTask
_08056DBC: .4byte IWRAM_START + 0xC
_08056DC0: .4byte gGameMode
_08056DC4: .4byte IWRAM_START + 0x4C
_08056DC8: .4byte gUnknown_03005590
_08056DCC: .4byte IWRAM_START + 0x44
_08056DD0: .4byte 0x000001FF
_08056DD4: .4byte gSineTable
_08056DD8: .4byte gCamera
_08056DDC:
	ldr r0, [r1, #4]
	subs r0, r4, r0
	asrs r1, r2, #8
	adds r0, r0, r1
	strh r0, [r6, #0x18]
_08056DE6:
	mov r0, r8
	ldr r1, [r0, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08056E06
	mov r2, r8
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08056E06
	ldr r0, [r2, #0xc]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	add r0, ip
	str r0, [r2, #0xc]
_08056E06:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08056E38
	ldr r2, [r5, #0x48]
	asrs r2, r2, #8
	adds r2, r4, r2
	adds r0, r6, #0
	adds r1, r7, #0
	mov r3, r8
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08056E38
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	mov r2, r8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
_08056E38:
	ldr r2, [r5, #0x48]
	asrs r2, r2, #8
	adds r2, r4, r2
	adds r0, r6, #0
	adds r1, r7, #0
	movs r3, #1
	bl sub_800C4FC
	cmp r0, #1
	beq _08056EA2
	ldr r1, _08056EAC @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056E7E
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	blt _08056E7E
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056EB4
_08056E7E:
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08056E9C
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r0, #0
	blt _08056E9C
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r4, r0
	ble _08056EB4
_08056E9C:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
_08056EA2:
	ldr r0, _08056EB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056ECC
	.align 2, 0
_08056EAC: .4byte gCamera
_08056EB0: .4byte gCurTask
_08056EB4:
	lsls r0, r7, #8
	lsls r1, r4, #8
	ldr r2, [r5, #0x48]
	adds r1, r1, r2
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08056ECC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8056EDC
sub_8056EDC: @ 0x08056EDC
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x58]
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x54]
	ldr r1, [r0, #0x48]
	str r1, [r0, #0x50]
	bx lr
	.align 2, 0

	thumb_func_start sub_8056EEC
sub_8056EEC: @ 0x08056EEC
	push {r4, lr}
	ldrh r0, [r0, #6]
	ldr r1, _08056F20 @ =IWRAM_START + 0xC
	adds r4, r0, r1
	ldr r0, [r4, #4]
	bl VramFree
	ldr r2, _08056F24 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08056F18
	ldr r0, [r2, #0x3c]
	cmp r0, r4
	bne _08056F18
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0x20]
	movs r0, #0
	str r0, [r2, #0x3c]
_08056F18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056F20: .4byte IWRAM_START + 0xC
_08056F24: .4byte gPlayer

	thumb_func_start initSprite_Enemy_Spinner
initSprite_Enemy_Spinner: @ 0x08056F28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov sb, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08057004 @ =sub_8057024
	ldr r2, _08057008 @ =0x00004040
	ldr r1, _0805700C @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r3, _08057010 @ =IWRAM_START + 0xC
	adds r5, r2, r3
	movs r7, #0
	movs r0, #0
	mov sl, r0
	strh r4, [r1, #4]
	strh r6, [r1, #6]
	mov r3, r8
	str r3, [r1]
	ldrb r0, [r3]
	strb r0, [r1, #8]
	mov r0, sb
	strb r0, [r1, #9]
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r3]
	movs r0, #0x18
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _08057014 @ =0x00000202
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r3, _08057018 @ =IWRAM_START + 0x2C
	adds r0, r2, r3
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	mov r0, sl
	strh r0, [r5, #8]
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x1c]
	adds r3, #1
	adds r1, r2, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805701C @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08057020 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	strb r7, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057004: .4byte sub_8057024
_08057008: .4byte 0x00004040
_0805700C: .4byte TaskDestructor_80095E8
_08057010: .4byte IWRAM_START + 0xC
_08057014: .4byte 0x00000202
_08057018: .4byte IWRAM_START + 0x2C
_0805701C: .4byte IWRAM_START + 0x2E
_08057020: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8057024
sub_8057024: @ 0x08057024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08057174 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	str r0, [sp, #4]
	ldr r6, _08057178 @ =IWRAM_START + 0xC
	add r6, r8
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x44]
	asrs r4, r0, #8
	ldr r0, [r1, #0x48]
	asrs r5, r0, #8
	ldr r1, _0805717C @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	ldr r2, _08057180 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08057184 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _0805713E
	mov sl, r2
	mov r0, sl
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	movs r0, #0xc
	add r0, ip
	mov sb, r0
	ldr r0, [r0, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805712E
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _0805712E
	ldr r0, _08057188 @ =IWRAM_START + 0x40
	add r0, r8
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r3, r7, r4
	mov r1, sl
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, r1
	cmp r3, r2
	bgt _080570C2
	ldr r0, _0805718C @ =IWRAM_START + 0x42
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r2
	bge _080570D4
	cmp r3, r2
	blt _0805712E
_080570C2:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	blt _0805712E
_080570D4:
	adds r0, r6, #0
	adds r0, #0x35
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r3, r5
	mov r1, sl
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r1, sb
	adds r1, #0x2d
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r2, r1
	bgt _08057108
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0805711A
	cmp r2, r1
	blt _0805712E
_08057108:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _0805712E
_0805711A:
	mov r0, sl
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0805712E
	mov r0, sl
	bl sub_800CBA4
_0805712E:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _0805716A
_0805713E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057162
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057162
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057190
_08057162:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r1, [sp]
	strb r0, [r1]
_0805716A:
	ldr r0, _08057174 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080571A4
	.align 2, 0
_08057174: .4byte gCurTask
_08057178: .4byte IWRAM_START + 0xC
_0805717C: .4byte gCamera
_08057180: .4byte gPlayer
_08057184: .4byte 0x00400080
_08057188: .4byte IWRAM_START + 0x40
_0805718C: .4byte IWRAM_START + 0x42
_08057190:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080571A4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Mouse
initSprite_Enemy_Mouse: @ 0x080571B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, _08057220 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080571E4
	ldr r0, _08057224 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080571E4
	b _0805732E
_080571E4:
	ldr r0, _08057228 @ =sub_8057348
	ldr r2, _0805722C @ =0x00004040
	ldr r1, _08057230 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	mov r2, r8
	strh r2, [r5, #4]
	mov r3, sb
	strh r3, [r5, #6]
	str r7, [r5]
	ldrb r0, [r7]
	strb r0, [r5, #8]
	strb r4, [r5, #9]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08057238
	ldr r0, _08057234 @ =IWRAM_START + 0x50
	adds r1, r1, r0
	movs r0, #1
	b _0805723E
	.align 2, 0
_08057220: .4byte gGameMode
_08057224: .4byte gUnknown_030054EC
_08057228: .4byte sub_8057348
_0805722C: .4byte 0x00004040
_08057230: .4byte TaskDestructor_80095E8
_08057234: .4byte IWRAM_START + 0x50
_08057238:
	ldr r2, _08057278 @ =IWRAM_START + 0x50
	adds r1, r1, r2
	movs r0, #0
_0805723E:
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r3, r8
	lsls r2, r3, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r5, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x40]
	movs r0, #0
	str r0, [r5, #0x44]
	ldrb r3, [r7, #6]
	mov sb, r2
	mov sl, r1
	cmp r3, #0
	beq _0805727C
	adds r1, r5, #0
	adds r1, #0x51
	movs r0, #1
	strb r0, [r1]
	mov r8, r1
	b _08057284
	.align 2, 0
_08057278: .4byte IWRAM_START + 0x50
_0805727C:
	adds r0, r5, #0
	adds r0, #0x51
	strb r3, [r0]
	mov r8, r0
_08057284:
	mov r0, r8
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805729E
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x50
	ldrb r2, [r2]
	movs r3, #0
	b _080572AC
_0805729E:
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x50
	ldrb r2, [r2]
_080572AC:
	str r3, [sp]
	ldr r3, _08057340 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r5, #0x48]
	movs r4, #0
	str r4, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x52
	strb r4, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	add r0, sb
	movs r5, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	add r0, sl
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0xf
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08057344 @ =0x00000201
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805732E
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_0805732E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057340: .4byte sub_801EE64
_08057344: .4byte 0x00000201

	thumb_func_start sub_8057348
sub_8057348: @ 0x08057348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805738C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0xc
	adds r0, r0, r2
	mov r8, r0
	ldr r1, [r5]
	mov sl, r1
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0805739A
	ldr r3, _08057390 @ =IWRAM_START + 0x52
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08057394
	ldr r0, [r5, #0x44]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	b _080573B8
	.align 2, 0
_0805738C: .4byte gCurTask
_08057390: .4byte IWRAM_START + 0x52
_08057394:
	ldr r0, [r5, #0x44]
	adds r0, #0x80
	b _080573B8
_0805739A:
	ldr r3, _080573AC @ =IWRAM_START + 0x52
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080573B4
	ldr r0, [r5, #0x44]
	ldr r1, _080573B0 @ =0xFFFFFE00
	adds r0, r0, r1
	b _080573B8
	.align 2, 0
_080573AC: .4byte IWRAM_START + 0x52
_080573B0: .4byte 0xFFFFFE00
_080573B4:
	ldr r0, [r5, #0x44]
	subs r0, #0x80
_080573B8:
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r3, [r0]
	cmp r3, #0
	beq _08057444
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r5
	mov sb, r2
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _0805743C @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801F07C
	cmp r0, #0
	bge _08057414
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	subs r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _08057440 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057414:
	cmp r0, #0
	ble _08057420
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	subs r0, r0, r1
	str r0, [r5, #0x48]
_08057420:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r6, r0, #0
	adds r6, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #8
	b _080574A8
	.align 2, 0
_0805743C: .4byte sub_801EE64
_08057440: .4byte sub_801EC3C
_08057444:
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r5, #0
	adds r4, #0x50
	ldrb r2, [r4]
	str r3, [sp]
	ldr r3, _08057530 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _0805748C
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	adds r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r4]
	ldr r3, _08057534 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_0805748C:
	cmp r0, #0
	ble _08057498
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	adds r0, r0, r1
	str r0, [r5, #0x48]
_08057498:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r7, r0, #8
_080574A8:
	ldr r4, _08057538 @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r1, #0x18]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08057524
	ldr r0, [r5, #0x3c]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080574F6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080574F6
	ldr r0, [r5, #0x40]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080574F6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057540
_080574F6:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805751E
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _0805751E
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057540
_0805751E:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
_08057524:
	ldr r0, _0805753C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080575F6
	.align 2, 0
_08057530: .4byte sub_801EE64
_08057534: .4byte sub_801EC3C
_08057538: .4byte gCamera
_0805753C: .4byte gCurTask
_08057540:
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0805756C
	ldr r0, _08057568 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r3, r6, #8
	mov ip, r3
	cmp r1, ip
	ble _0805758A
	adds r0, r6, #0
	adds r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	bge _0805758A
	b _08057582
	.align 2, 0
_08057568: .4byte gPlayer
_0805756C:
	ldr r0, _08057608 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r0, r6, #8
	mov ip, r0
	cmp r1, ip
	bge _0805758A
	adds r0, r6, #0
	subs r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	ble _0805758A
_08057582:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_0805758A:
	ldr r1, [r5, #0x44]
	asrs r3, r1, #8
	mov r2, sl
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _080575AC
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080575C8
_080575AC:
	asrs r1, r4, #8
	mov r2, sl
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080575E2
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080575E2
_080575C8:
	ldr r0, _0805760C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057610 @ =sub_8057618
	str r0, [r1, #8]
	ldr r0, _08057614 @ =0x00000201
	strh r0, [r3, #0xa]
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_080575E2:
	lsls r1, r7, #8
	mov r0, ip
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
_080575F6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057608: .4byte gPlayer
_0805760C: .4byte gCurTask
_08057610: .4byte sub_8057618
_08057614: .4byte 0x00000201

	thumb_func_start sub_8057618
sub_8057618: @ 0x08057618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080576BC @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	adds r0, #0xc
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [r5]
	mov sl, r1
	ldr r2, _080576C0 @ =IWRAM_START + 0x51
	adds r0, r3, r2
	ldrb r4, [r0]
	cmp r4, #0
	beq _080576D0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080576C4 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _080576C8 @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801F07C
	cmp r0, #0
	bge _08057694
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	subs r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _080576CC @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057694:
	cmp r0, #0
	ble _080576A0
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	subs r0, r0, r1
	str r0, [r5, #0x48]
_080576A0:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r6, r0, #0
	adds r6, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #8
	b _08057738
	.align 2, 0
_080576BC: .4byte gCurTask
_080576C0: .4byte IWRAM_START + 0x51
_080576C4: .4byte IWRAM_START + 0x50
_080576C8: .4byte sub_801EE64
_080576CC: .4byte sub_801EC3C
_080576D0:
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080577C0 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _080577C4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _0805771C
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	adds r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _080577C8 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_0805771C:
	cmp r0, #0
	ble _08057728
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	adds r0, r0, r1
	str r0, [r5, #0x48]
_08057728:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r7, r0, #8
_08057738:
	ldr r4, _080577CC @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r1, #0x18]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080577B4
	ldr r0, [r5, #0x3c]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057786
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057786
	ldr r0, [r5, #0x40]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057786
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080577D4
_08057786:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080577AE
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _080577AE
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080577D4
_080577AE:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
_080577B4:
	ldr r0, _080577D0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057836
	.align 2, 0
_080577C0: .4byte IWRAM_START + 0x50
_080577C4: .4byte sub_801EE64
_080577C8: .4byte sub_801EC3C
_080577CC: .4byte gCamera
_080577D0: .4byte gCurTask
_080577D4:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _08057830
	adds r0, r5, #0
	adds r0, #0x52
	strb r1, [r0]
	mov r2, r8
	ldr r1, [r2, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0805780C
	ldr r0, _08057808 @ =0xFFFFFBFF
	ands r1, r0
	mov r3, r8
	str r1, [r3, #0x10]
	b _08057812
	.align 2, 0
_08057808: .4byte 0xFFFFFBFF
_0805780C:
	orrs r1, r2
	mov r0, r8
	str r1, [r0, #0x10]
_08057812:
	movs r1, #0
	ldr r0, _08057848 @ =0x00000201
	mov r2, r8
	strh r0, [r2, #0xa]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805784C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057850 @ =sub_8057348
	str r0, [r1, #8]
_08057830:
	mov r0, r8
	bl sub_80051E8
_08057836:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057848: .4byte 0x00000201
_0805784C: .4byte gCurTask
_08057850: .4byte sub_8057348

	thumb_func_start initSprite_Enemy_Pen
initSprite_Enemy_Pen: @ 0x08057854
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080578B0 @ =sub_8057980
	ldr r2, _080578B4 @ =0x00004040
	ldr r1, _080578B8 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov r8, r0
	strh r5, [r7, #4]
	mov r2, sl
	strh r2, [r7, #6]
	str r6, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #8]
	strb r4, [r7, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080578C0
	ldr r0, _080578BC @ =IWRAM_START + 0x50
	adds r1, r1, r0
	movs r0, #1
	b _080578C6
	.align 2, 0
_080578B0: .4byte sub_8057980
_080578B4: .4byte 0x00004040
_080578B8: .4byte TaskDestructor_80095E8
_080578BC: .4byte IWRAM_START + 0x50
_080578C0:
	ldr r2, _08057978 @ =IWRAM_START + 0x50
	adds r1, r1, r2
	movs r0, #0
_080578C6:
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #3
	lsls r5, r5, #8
	mov sb, r5
	add r1, sb
	lsls r1, r1, #8
	str r1, [r7, #0x3c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r2, sl
	lsls r5, r2, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r7, #0x40]
	movs r4, #0
	str r4, [r7, #0x44]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, r7, #0
	adds r2, #0x50
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _0805797C @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	str r4, [r7, #0x4c]
	adds r0, r7, #0
	adds r0, #0x51
	strb r4, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, sb
	movs r7, #0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r1, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	movs r0, #0xc
	bl VramMalloc
	mov r1, r8
	str r0, [r1, #4]
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r1, #0xa]
	mov r0, r8
	adds r0, #0x20
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x25
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, r8
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057978: .4byte IWRAM_START + 0x50
_0805797C: .4byte sub_801EE64

	thumb_func_start sub_8057980
sub_8057980: @ 0x08057980
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _080579C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r0, #0xc
	adds r5, r2, r0
	ldr r1, [r4]
	mov sb, r1
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080579CE
	ldr r3, _080579C4 @ =IWRAM_START + 0x51
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080579C8
	ldr r0, [r4, #0x44]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	b _080579EC
	.align 2, 0
_080579C0: .4byte gCurTask
_080579C4: .4byte IWRAM_START + 0x51
_080579C8:
	ldr r0, [r4, #0x44]
	adds r0, #0x80
	b _080579EC
_080579CE:
	ldr r3, _080579E0 @ =IWRAM_START + 0x51
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080579E8
	ldr r0, [r4, #0x44]
	ldr r1, _080579E4 @ =0xFFFFFE00
	adds r0, r0, r1
	b _080579EC
	.align 2, 0
_080579E0: .4byte IWRAM_START + 0x51
_080579E4: .4byte 0xFFFFFE00
_080579E8:
	ldr r0, [r4, #0x44]
	subs r0, #0x80
_080579EC:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08057AE0 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08057A3C
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _08057AE4 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057A3C:
	cmp r0, #0
	ble _08057A48
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08057A48:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r0, _08057AE8 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08057AD6
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057AAC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057AAC
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057AAC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057AF0
_08057AAC:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057AD0
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057AD0
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057AF0
_08057AD0:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
_08057AD6:
	ldr r0, _08057AEC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057BBA
	.align 2, 0
_08057AE0: .4byte sub_801EE64
_08057AE4: .4byte sub_801EC3C
_08057AE8: .4byte gCamera
_08057AEC: .4byte gCurTask
_08057AF0:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057B18
	ldr r0, _08057B14 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r0, r6, #8
	mov r8, r0
	cmp r1, r8
	ble _08057B50
	adds r0, r6, #0
	adds r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	bge _08057B50
	b _08057B2E
	.align 2, 0
_08057B14: .4byte gPlayer
_08057B18:
	ldr r0, _08057BC8 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r2, r6, #8
	mov r8, r2
	cmp r1, r8
	bge _08057B50
	adds r0, r6, #0
	subs r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	ble _08057B50
_08057B2E:
	adds r2, r4, #0
	adds r2, #0x51
	ldrb r0, [r2]
	cmp r0, #0
	bne _08057B4C
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08057B4C:
	movs r0, #1
	strb r0, [r2]
_08057B50:
	ldr r1, [r4, #0x44]
	asrs r3, r1, #8
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	mov ip, r0
	cmp r3, r2
	bgt _08057B70
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057B8A
_08057B70:
	asrs r1, r4, #8
	mov r3, sb
	ldrb r0, [r3, #5]
	add r0, ip
	lsls r0, r0, #3
	cmp r1, r0
	blt _08057BA6
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057BA6
_08057B8A:
	ldr r0, _08057BCC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057BD0 @ =sub_8057BD4
	str r0, [r1, #8]
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08057BA6:
	lsls r1, r7, #8
	mov r0, r8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08057BBA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057BC8: .4byte gPlayer
_08057BCC: .4byte gCurTask
_08057BD0: .4byte sub_8057BD4

	thumb_func_start sub_8057BD4
sub_8057BD4: @ 0x08057BD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08057C8C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r1, _08057C90 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r4]
	mov sl, r2
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _08057C94 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov r8, r2
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08057C98 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08057C44
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _08057C9C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057C44:
	cmp r0, #0
	ble _08057C50
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08057C50:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r0, _08057CA0 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08057CA4
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08057D6C
	.align 2, 0
_08057C8C: .4byte gCurTask
_08057C90: .4byte IWRAM_START + 0xC
_08057C94: .4byte IWRAM_START + 0x50
_08057C98: .4byte sub_801EE64
_08057C9C: .4byte sub_801EC3C
_08057CA0: .4byte gCamera
_08057CA4:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057CD6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057CD6
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057CD6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057D10
_08057CD6:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057CFA
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057CFA
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057D10
_08057CFA:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08057D0C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057D6C
	.align 2, 0
_08057D0C: .4byte gCurTask
_08057D10:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _08057D66
	adds r0, r4, #0
	adds r0, #0x51
	strb r1, [r0]
	ldr r1, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08057D44
	ldr r0, _08057D40 @ =0xFFFFFBFF
	ands r1, r0
	b _08057D46
	.align 2, 0
_08057D40: .4byte 0xFFFFFBFF
_08057D44:
	orrs r1, r2
_08057D46:
	str r1, [r7, #0x10]
	movs r1, #0
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08057D7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057D80 @ =sub_8057980
	str r0, [r1, #8]
_08057D66:
	adds r0, r7, #0
	bl sub_80051E8
_08057D6C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057D7C: .4byte gCurTask
_08057D80: .4byte sub_8057980

	thumb_func_start initSprite_Enemy_GejiGeji
initSprite_Enemy_GejiGeji: @ 0x08057D84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08057E04 @ =sub_8057F80
	movs r1, #0xa0
	lsls r1, r1, #2
	ldr r2, _08057E08 @ =0x00004040
	ldr r3, _08057E0C @ =sub_8058480
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r5, r0
	adds r0, #0xc
	adds r7, r5, r0
	movs r2, #0
	mov r1, sb
	strh r1, [r3, #4]
	mov r0, r8
	strh r0, [r3, #6]
	str r6, [r3]
	ldrb r0, [r6]
	strb r0, [r3, #8]
	strb r4, [r3, #9]
	ldrb r0, [r6]
	lsls r0, r0, #3
	mov r4, sb
	lsls r1, r4, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x6c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r4, r8
	lsls r1, r4, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x70]
	str r2, [r3, #0x74]
	str r2, [r3, #0x78]
	ldrb r0, [r6, #5]
	ldrb r1, [r6, #6]
	cmp r0, r1
	bls _08057E14
	ldr r2, _08057E10 @ =IWRAM_START + 0x27C
	adds r1, r5, r2
	movs r0, #0
	b _08057E1A
	.align 2, 0
_08057E04: .4byte sub_8057F80
_08057E08: .4byte 0x00004040
_08057E0C: .4byte sub_8058480
_08057E10: .4byte IWRAM_START + 0x27C
_08057E14:
	ldr r4, _08057F70 @ =IWRAM_START + 0x27C
	adds r1, r5, r4
	movs r0, #1
_08057E1A:
	strb r0, [r1]
	ldr r1, _08057F74 @ =0x0000027D
	adds r0, r3, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08057F78 @ =0x0000027E
	adds r0, r3, r2
	strb r1, [r0]
	movs r4, #0
	mov r0, sb
	lsls r0, r0, #8
	mov sb, r0
	mov r1, r8
	lsls r1, r1, #8
	mov ip, r1
	ldr r2, _08057F7C @ =gUnknown_080D8F50
	mov sl, r2
	adds r0, r7, #0
	adds r0, #0x20
	str r0, [sp, #4]
	adds r1, r7, #0
	adds r1, #0x21
	str r1, [sp, #8]
	adds r2, r7, #0
	adds r2, #0x22
	str r2, [sp, #0xc]
	adds r0, #5
	str r0, [sp, #0x10]
	adds r1, r3, #0
	adds r1, #0x3c
	str r1, [sp, #0x14]
	adds r2, r3, #0
	adds r2, #0x5c
	str r2, [sp, #0x18]
	adds r0, r3, #0
	adds r0, #0x5d
	str r0, [sp, #0x1c]
	adds r1, #0x22
	str r1, [sp, #0x20]
	adds r2, #5
	str r2, [sp, #0x24]
	movs r0, #0x7c
	adds r0, r0, r3
	mov r8, r0
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r5, r3, r1
_08057E78:
	lsls r1, r4, #2
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r3, #0x6c]
	asrs r0, r0, #8
	str r0, [r2]
	adds r1, r5, r1
	ldr r0, [r3, #0x70]
	asrs r0, r0, #8
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _08057E78
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, sb
	movs r4, #0
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	add r0, ip
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r5, r3, r2
	ldrb r0, [r5]
	lsls r0, r0, #3
	add r0, sl
	ldr r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	ldrb r0, [r5]
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xa]
	ldrb r0, [r5]
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	ldr r2, [sp, #8]
	strb r0, [r2]
	movs r0, #0x10
	mov sb, r0
	mov r2, sb
	ldr r1, [sp, #0xc]
	strb r2, [r1]
	movs r1, #0
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	str r2, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	ldr r7, [sp, #0x14]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	add r0, sl
	ldr r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xa]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #0x18]
	strb r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x1c]
	strb r0, [r2]
	mov r0, sb
	ldr r4, [sp, #0x20]
	strb r0, [r4]
	movs r2, #0
	ldr r1, [sp, #0x24]
	strb r2, [r1]
	mov r4, r8
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057F70: .4byte IWRAM_START + 0x27C
_08057F74: .4byte 0x0000027D
_08057F78: .4byte 0x0000027E
_08057F7C: .4byte gUnknown_080D8F50

	thumb_func_start sub_8057F80
sub_8057F80: @ 0x08057F80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08057FC8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	adds r1, #0xc
	adds r7, r0, r1
	ldr r2, _08057FCC @ =IWRAM_START + 0x3C
	adds r2, r2, r0
	mov r8, r2
	ldr r3, [r6]
	str r3, [sp, #4]
	ldr r4, _08057FD0 @ =IWRAM_START + 0x27C
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08057FE4
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08057FD4
	ldr r0, [r6, #0x78]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r6, #0x78]
	b _08058002
	.align 2, 0
_08057FC8: .4byte gCurTask
_08057FCC: .4byte IWRAM_START + 0x3C
_08057FD0: .4byte IWRAM_START + 0x27C
_08057FD4:
	ldr r0, [r6, #0x78]
	ldr r2, _08057FE0 @ =0xFFFFFE80
	adds r0, r0, r2
	str r0, [r6, #0x78]
	b _08058002
	.align 2, 0
_08057FE0: .4byte 0xFFFFFE80
_08057FE4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057FFA
	ldr r0, [r6, #0x74]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r0, r3
	b _08058000
_08057FFA:
	ldr r0, [r6, #0x74]
	ldr r4, _080580F8 @ =0xFFFFFE80
	adds r0, r0, r4
_08058000:
	str r0, [r6, #0x74]
_08058002:
	ldr r1, [r6, #0x6c]
	ldr r0, [r6, #0x74]
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #8]
	ldr r2, [r6, #0x70]
	ldr r0, [r6, #0x78]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #0xc]
	ldr r5, _080580FC @ =gCamera
	ldr r0, [r5]
	adds r3, r1, #0
	subs r0, r3, r0
	strh r0, [r7, #0x16]
	ldr r0, [r5, #4]
	ldr r4, [sp, #0xc]
	subs r0, r4, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080580EE
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x7c
	str r0, [sp, #0x10]
	ldr r1, _08058100 @ =0x0000027E
	adds r1, r1, r6
	mov sl, r1
	mov sb, r5
_08058044:
	adds r5, r4, #1
	movs r0, #0xd
	muls r0, r5, r0
	mov r3, sl
	ldrb r2, [r3]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #2
	ldr r0, [sp, #0x10]
	adds r4, r0, r2
	ldr r0, [r4]
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	movs r0, #0xbe
	lsls r0, r0, #1
	adds r3, r6, r0
	adds r3, r3, r2
	ldr r0, [r3]
	mov r2, sb
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x18]
	ldr r1, [r4]
	ldr r2, [r3]
	ldr r0, _08058104 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	movs r3, #0
	bl sub_800CA20
	lsls r5, r5, #0x18
	lsrs r4, r5, #0x18
	cmp r4, #3
	bls _08058044
	ldr r0, [r6, #0x6c]
	asrs r2, r0, #8
	ldr r3, _080580FC @ =gCamera
	ldr r1, [r3]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _080580C4
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080580C4
	ldr r0, [r6, #0x70]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080580C4
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805810C
_080580C4:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080580E8
	movs r4, #0x18
	ldrsh r0, [r7, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _080580E8
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805810C
_080580E8:
	ldrb r0, [r6, #8]
	ldr r1, [sp, #4]
	strb r0, [r1]
_080580EE:
	ldr r0, _08058108 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805823E
	.align 2, 0
_080580F8: .4byte 0xFFFFFE80
_080580FC: .4byte gCamera
_08058100: .4byte 0x0000027E
_08058104: .4byte gPlayer
_08058108: .4byte gCurTask
_0805810C:
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805815A
	ldr r1, [r6, #0x78]
	asrs r3, r1, #8
	ldr r4, [sp, #4]
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _08058144
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08058144
	ldr r0, _08058140 @ =0x0000027D
	adds r1, r6, r0
	b _080581A2
	.align 2, 0
_08058140: .4byte 0x0000027D
_08058144:
	asrs r1, r4, #8
	ldr r2, [sp, #4]
	ldrb r0, [r2, #6]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080581AE
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	b _08058198
_0805815A:
	ldr r1, [r6, #0x74]
	asrs r3, r1, #8
	ldr r4, [sp, #4]
	movs r0, #3
	ldrsb r0, [r4, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _08058184
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08058184
	ldr r0, _08058180 @ =0x0000027D
	adds r1, r6, r0
	b _080581A2
	.align 2, 0
_08058180: .4byte 0x0000027D
_08058184:
	asrs r1, r4, #8
	ldr r2, [sp, #4]
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080581AE
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
_08058198:
	ands r0, r1
	cmp r0, #0
	beq _080581AE
	ldr r3, _08058250 @ =0x0000027D
	adds r1, r6, r3
_080581A2:
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08058254 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058258 @ =sub_8058264
	str r0, [r1, #8]
_080581AE:
	ldr r4, [sp, #8]
	lsls r0, r4, #8
	ldr r2, [sp, #0xc]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, r8
	bl sub_8004558
	movs r4, #0
	ldr r3, _0805825C @ =0x0000027E
	adds r3, r3, r6
	mov sb, r3
	ldr r7, _08058260 @ =gCamera
_080581D6:
	adds r4, #1
	movs r0, #0xd
	muls r0, r4, r0
	mov r1, sb
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r5, #0x3f
	ands r2, r5
	lsls r2, r2, #2
	ldr r3, [sp, #0x10]
	adds r0, r3, r2
	ldr r0, [r0]
	ldr r1, [r7]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	movs r3, #0xbe
	lsls r3, r3, #1
	adds r0, r6, r3
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #3
	bls _080581D6
	ldr r2, _0805825C @ =0x0000027E
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	ands r0, r5
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r4, [sp, #8]
	str r4, [r0]
	ldrb r1, [r1]
	lsls r1, r1, #2
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r3, [sp, #0xc]
	str r3, [r0]
_0805823E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058250: .4byte 0x0000027D
_08058254: .4byte gCurTask
_08058258: .4byte sub_8058264
_0805825C: .4byte 0x0000027E
_08058260: .4byte gCamera

	thumb_func_start sub_8058264
sub_8058264: @ 0x08058264
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _080582E4 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _080582E8 @ =IWRAM_START + 0xC
	adds r6, r4, r1
	ldr r2, [r7]
	mov sl, r2
	ldr r1, [r7, #0x6c]
	ldr r0, [r7, #0x74]
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp]
	ldr r2, [r7, #0x70]
	ldr r0, [r7, #0x78]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #4]
	ldr r3, _080582EC @ =IWRAM_START + 0x27E
	adds r3, r4, r3
	str r3, [sp, #0xc]
	ldrb r3, [r3]
	lsls r3, r3, #2
	mov r8, r3
	ldr r5, _080582F0 @ =IWRAM_START + 0x7C
	adds r0, r4, r5
	add r0, r8
	ldr r0, [r0]
	ldr r3, _080582F4 @ =gCamera
	mov r8, r3
	ldr r5, [r3]
	subs r0, r0, r5
	strh r0, [r6, #0x16]
	ldr r3, [sp, #0xc]
	ldrb r0, [r3]
	lsls r0, r0, #2
	ldr r5, _080582F8 @ =IWRAM_START + 0x17C
	adds r4, r4, r5
	adds r4, r4, r0
	ldr r0, [r4]
	mov r4, r8
	ldr r3, [r4, #4]
	subs r0, r0, r3
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080582FC
	mov r5, sb
	ldr r0, [r5]
	bl TaskDestroy
	b _08058460
	.align 2, 0
_080582E4: .4byte gCurTask
_080582E8: .4byte IWRAM_START + 0xC
_080582EC: .4byte IWRAM_START + 0x27E
_080582F0: .4byte IWRAM_START + 0x7C
_080582F4: .4byte gCamera
_080582F8: .4byte IWRAM_START + 0x17C
_080582FC:
	ldr r0, [r7, #0x6c]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08058330
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08058330
	ldr r0, [r7, #0x70]
	asrs r1, r0, #8
	mov r4, r8
	ldr r3, [r4, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r3, r5
	cmp r1, r0
	bgt _08058330
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bge _08058368
_08058330:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08058354
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08058354
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058368
_08058354:
	ldrb r0, [r7, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08058364 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058460
	.align 2, 0
_08058364: .4byte gCurTask
_08058368:
	ldr r4, [sp]
	lsls r0, r4, #8
	ldr r5, [sp, #4]
	lsls r1, r5, #8
	bl sub_80122DC
	ldr r0, _080583A4 @ =0x0000027D
	adds r1, r7, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080583D0
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080583AC
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080583C4
	ldr r0, _080583A8 @ =0xFFFFF7FF
	ands r1, r0
	b _080583C6
	.align 2, 0
_080583A4: .4byte 0x0000027D
_080583A8: .4byte 0xFFFFF7FF
_080583AC:
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080583C4
	ldr r0, _080583C0 @ =0xFFFFFBFF
	ands r1, r0
	b _080583C6
	.align 2, 0
_080583C0: .4byte 0xFFFFFBFF
_080583C4:
	orrs r1, r2
_080583C6:
	str r1, [r6, #0x10]
	ldr r0, _08058470 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058474 @ =sub_8057F80
	str r0, [r1, #8]
_080583D0:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	adds r6, #0x3c
	adds r0, r6, #0
	bl sub_8004558
	movs r4, #0
	movs r2, #0x7c
	adds r2, r2, r7
	mov sl, r2
	ldr r3, _08058478 @ =0x0000027E
	adds r3, r3, r7
	mov sb, r3
	ldr r5, _0805847C @ =gCamera
	mov r8, r5
_080583F8:
	adds r4, #1
	movs r0, #0xd
	muls r0, r4, r0
	mov r1, sb
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r3, #0x3f
	ands r2, r3
	lsls r2, r2, #2
	mov r5, sl
	adds r0, r5, r2
	ldr r0, [r0]
	mov r5, r8
	ldr r1, [r5]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp, #8]
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r3, [sp, #8]
	cmp r4, #3
	bls _080583F8
	ldr r2, _08058478 @ =0x0000027E
	adds r1, r7, r2
	ldrb r0, [r1]
	adds r0, #1
	ands r0, r3
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r3, [sp]
	str r3, [r0]
	ldrb r1, [r1]
	lsls r1, r1, #2
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r7, r4
	adds r0, r0, r1
	ldr r5, [sp, #4]
	str r5, [r0]
_08058460:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058470: .4byte gCurTask
_08058474: .4byte sub_8057F80
_08058478: .4byte 0x0000027E
_0805847C: .4byte gCamera

	thumb_func_start sub_8058480
sub_8058480: @ 0x08058480
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Balloon
initSprite_Enemy_Balloon: @ 0x0805849C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _080585AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080584CA
	ldr r0, _080585B0 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805859C
_080584CA:
	ldr r0, _080585B4 @ =sub_80585DC
	ldr r2, _080585B8 @ =0x00004040
	ldr r1, _080585BC @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x60
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, _080585C0 @ =IWRAM_START + 0xC
	adds r5, r4, r0
	movs r0, #0
	mov r8, r0
	strh r6, [r1, #4]
	mov r0, sb
	strh r0, [r1, #6]
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, sl
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r3, r6, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r6, sb
	lsls r2, r6, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	movs r0, #0x80
	str r0, [r1, #0x54]
	movs r6, #0
	str r6, [r1, #0x58]
	ldr r0, _080585C4 @ =IWRAM_START + 0x5E
	adds r1, r4, r0
	movs r0, #0x78
	strb r0, [r1]
	ldrb r0, [r7, #5]
	lsls r0, r0, #2
	ldr r6, _080585C8 @ =IWRAM_START + 0x5C
	adds r1, r4, r6
	strb r0, [r1]
	ldrb r0, [r7, #6]
	lsls r0, r0, #2
	adds r6, #1
	adds r1, r4, r6
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r0, [r5, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r5, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0xa
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _080585CC @ =0x000001F5
	strh r0, [r5, #0xa]
	subs r6, #0x31
	adds r0, r4, r6
	mov r1, r8
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	movs r6, #0
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _080585D0 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r6, _080585D4 @ =IWRAM_START + 0x2E
	adds r1, r4, r6
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080585D8 @ =IWRAM_START + 0x31
	adds r4, r4, r0
	mov r1, r8
	strb r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
_0805859C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080585AC: .4byte gGameMode
_080585B0: .4byte gUnknown_030054EC
_080585B4: .4byte sub_80585DC
_080585B8: .4byte 0x00004040
_080585BC: .4byte TaskDestructor_80095E8
_080585C0: .4byte IWRAM_START + 0xC
_080585C4: .4byte IWRAM_START + 0x5E
_080585C8: .4byte IWRAM_START + 0x5C
_080585CC: .4byte 0x000001F5
_080585D0: .4byte IWRAM_START + 0x2D
_080585D4: .4byte IWRAM_START + 0x2E
_080585D8: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80585DC
sub_80585DC: @ 0x080585DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08058684 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r1, _08058688 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r6]
	mov r8, r2
	ldr r1, [r6, #0x58]
	adds r1, #1
	ldr r4, _0805868C @ =0x000003FF
	ands r1, r4
	str r1, [r6, #0x58]
	lsls r0, r1, #2
	adds r0, r0, r1
	ands r0, r4
	ldr r5, _08058690 @ =gSineTable
	mov sl, r5
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r5, [r0, r2]
	mov ip, r5
	ldr r5, _08058694 @ =IWRAM_START + 0x5C
	adds r0, r3, r5
	ldrb r0, [r0]
	mov r2, ip
	muls r2, r0, r2
	asrs r2, r2, #6
	str r2, [r6, #0x4c]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r4
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r5, #1
	adds r3, r3, r5
	ldrb r0, [r3]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	str r1, [sp]
	ldr r2, [r6, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #4]
	ldr r4, _08058698 @ =gCamera
	ldr r0, [r4]
	adds r3, r1, #0
	subs r0, r3, r0
	strh r0, [r7, #0x16]
	ldr r0, [r4, #4]
	ldr r5, [sp, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _0805869C
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08058780
	.align 2, 0
_08058684: .4byte gCurTask
_08058688: .4byte IWRAM_START + 0xC
_0805868C: .4byte 0x000003FF
_08058690: .4byte gSineTable
_08058694: .4byte IWRAM_START + 0x5C
_08058698: .4byte gCamera
_0805869C:
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080586CC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080586CC
	ldr r0, [r6, #0x48]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	movs r4, #0x90
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _080586CC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08058704
_080586CC:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080586F0
	movs r5, #0x18
	ldrsh r0, [r7, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _080586F0
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058704
_080586F0:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08058700 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058780
	.align 2, 0
_08058700: .4byte gCurTask
_08058704:
	ldr r0, [r6, #0x4c]
	asrs r2, r0, #8
	mov r3, r8
	movs r1, #3
	ldrsb r1, [r3, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _08058718
	movs r0, #0x80
	b _08058728
_08058718:
	mov r4, r8
	ldrb r0, [r4, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _0805872A
	movs r0, #0x80
	rsbs r0, r0, #0
_08058728:
	str r0, [r6, #0x54]
_0805872A:
	adds r1, r6, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058758
	ldr r0, _08058790 @ =0x000001F5
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08058794 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058798 @ =sub_805879C
	str r0, [r1, #8]
_08058758:
	ldr r5, [sp]
	lsls r0, r5, #8
	ldr r2, [sp, #4]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_08058780:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058790: .4byte 0x000001F5
_08058794: .4byte gCurTask
_08058798: .4byte sub_805879C

	thumb_func_start sub_805879C
sub_805879C: @ 0x0805879C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _080587FC @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _08058800 @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r6]
	mov sl, r3
	ldr r1, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x48]
	ldr r0, [r6, #0x50]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _08058804 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08058808
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08058904
	.align 2, 0
_080587FC: .4byte gCurTask
_08058800: .4byte IWRAM_START + 0xC
_08058804: .4byte gCamera
_08058808:
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805883A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805883A
	ldr r0, [r6, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805883A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08058874
_0805883A:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805885E
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805885E
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058874
_0805885E:
	ldrb r0, [r6, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08058870 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058904
	.align 2, 0
_08058870: .4byte gCurTask
_08058874:
	adds r6, #0x5e
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2d
	bne _080588B8
	mov r1, sp
	movs r2, #0
	movs r0, #3
	strh r0, [r1]
	movs r0, #0xfb
	lsls r0, r0, #1
	strh r0, [r1, #2]
	mov r0, sp
	strb r2, [r0, #4]
	adds r0, r4, #1
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	movs r0, #0xff
	strh r0, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #8]
	mov r0, sp
	bl sub_8050E04
_080588B8:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	cmp r0, #0
	bne _080588EE
	movs r0, #0x78
	strb r0, [r6]
	movs r1, #0
	ldr r0, _08058914 @ =0x000001F5
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08058918 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805891C @ =sub_80585DC
	str r0, [r1, #8]
_080588EE:
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_08058904:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058914: .4byte 0x000001F5
_08058918: .4byte gCurTask
_0805891C: .4byte sub_80585DC

	thumb_func_start initSprite_Enemy_Flickey
initSprite_Enemy_Flickey: @ 0x08058920
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08058AB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805894C
	ldr r0, _08058ABC @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805894C
	b _08058AA6
_0805894C:
	ldr r0, _08058AC0 @ =sub_8058AF4
	movs r1, #0xaa
	lsls r1, r1, #2
	ldr r2, _08058AC4 @ =0x00004040
	ldr r3, _08058AC8 @ =sub_8059398
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _08058ACC @ =IWRAM_START + 0xC
	adds r7, r2, r0
	movs r1, #0
	mov r8, r1
	movs r1, #0
	mov r3, sl
	strh r6, [r3, #4]
	strh r4, [r3, #6]
	mov r0, sb
	str r0, [r3]
	ldrb r0, [r0]
	strb r0, [r3, #8]
	strb r5, [r3, #9]
	ldr r3, _08058AD0 @ =IWRAM_START + 0x8C
	adds r5, r2, r3
	mov r3, sb
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r6, r6, #8
	mov ip, r6
	add r0, ip
	lsls r0, r0, #8
	str r0, [r5]
	ldr r6, _08058AD4 @ =IWRAM_START + 0x90
	adds r3, r2, r6
	mov r6, sb
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r3]
	ldr r6, _08058AD8 @ =IWRAM_START + 0x94
	adds r0, r2, r6
	str r1, [r0]
	adds r6, #4
	adds r0, r2, r6
	str r1, [r0]
	ldr r0, _08058ADC @ =IWRAM_START + 0x9C
	adds r1, r2, r0
	ldr r0, _08058AE0 @ =0x0000FE80
	strh r0, [r1]
	adds r6, #6
	adds r1, r2, r6
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r1, _08058AE4 @ =IWRAM_START + 0x2A4
	adds r0, r2, r1
	mov r6, r8
	strb r6, [r0]
	ldr r0, [r5]
	lsls r0, r0, #8
	ldr r1, [r3]
	lsls r1, r1, #8
	movs r3, #0
	mov r5, ip
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldr r4, _08058AE8 @ =IWRAM_START + 0xA4
	adds r6, r2, r4
	asrs r5, r0, #0x10
	ldr r0, _08058AEC @ =IWRAM_START + 0xA8
	adds r2, r2, r0
	asrs r4, r1, #0x10
_080589EA:
	lsls r1, r3, #3
	adds r0, r6, r1
	str r5, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x3f
	bls _080589EA
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sb
	strb r0, [r3]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08058AF0 @ =0x000001FB
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	mov r7, sl
	adds r7, #0x4c
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	adds r0, r0, r1
	strh r0, [r7, #0x18]
	movs r0, #8
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xfe
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x6c
	strb r5, [r0]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x6d
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x6e
	movs r3, #0x10
	strb r3, [r0]
	adds r0, #3
	strb r5, [r0]
	mov r4, r8
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
_08058AA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058AB8: .4byte gGameMode
_08058ABC: .4byte gUnknown_030054EC
_08058AC0: .4byte sub_8058AF4
_08058AC4: .4byte 0x00004040
_08058AC8: .4byte sub_8059398
_08058ACC: .4byte IWRAM_START + 0xC
_08058AD0: .4byte IWRAM_START + 0x8C
_08058AD4: .4byte IWRAM_START + 0x90
_08058AD8: .4byte IWRAM_START + 0x94
_08058ADC: .4byte IWRAM_START + 0x9C
_08058AE0: .4byte 0x0000FE80
_08058AE4: .4byte IWRAM_START + 0x2A4
_08058AE8: .4byte IWRAM_START + 0xA4
_08058AEC: .4byte IWRAM_START + 0xA8
_08058AF0: .4byte 0x000001FB

	thumb_func_start sub_8058AF4
sub_8058AF4: @ 0x08058AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	ldr r0, _08058D1C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov sl, r0
	ldr r0, _08058D20 @ =IWRAM_START + 0xC
	adds r0, r0, r4
	mov sb, r0
	mov r1, sl
	ldr r1, [r1]
	str r1, [sp, #0x2c]
	ldr r2, _08058D24 @ =IWRAM_START + 0x9E
	adds r3, r4, r2
	ldrh r0, [r3]
	adds r0, #0x20
	movs r5, #0
	mov r8, r5
	strh r0, [r3]
	ldr r6, _08058D28 @ =IWRAM_START + 0x94
	adds r5, r4, r6
	ldr r7, _08058D2C @ =IWRAM_START + 0x9C
	adds r0, r4, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	adds r6, #4
	adds r2, r4, r6
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r2, _08058D30 @ =IWRAM_START + 0x8C
	adds r0, r4, r2
	ldr r6, [r0]
	ldr r0, [r5]
	adds r6, r6, r0
	asrs r6, r6, #8
	str r6, [sp, #0x30]
	ldr r3, _08058D34 @ =IWRAM_START + 0x90
	adds r0, r4, r3
	ldr r5, [r0]
	adds r5, r5, r1
	asrs r5, r5, #8
	str r5, [sp, #0x34]
	mov r7, r8
	str r7, [sp]
	ldr r0, _08058D38 @ =sub_801EE64
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	mov r8, r0
	ldr r3, _08058D3C @ =gCamera
	ldr r0, [r3]
	ldr r1, [sp, #0x30]
	subs r0, r1, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r3, #4]
	ldr r7, [sp, #0x34]
	subs r0, r7, r0
	strh r0, [r2, #0x18]
	ldr r0, _08058D40 @ =IWRAM_START + 0x2A4
	adds r2, r4, r0
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r7, _08058D44 @ =IWRAM_START + 0xA4
	adds r0, r4, r7
	adds r0, r0, r1
	str r6, [r0]
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r6, _08058D48 @ =IWRAM_START + 0xA8
	adds r0, r4, r6
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r2]
	subs r7, #0x58
	adds r7, r7, r4
	mov sb, r7
	movs r6, #0
	ldr r0, _08058D40 @ =IWRAM_START + 0x2A4
	adds r0, r4, r0
	str r0, [sp, #0x38]
	adds r7, r3, #0
	ldr r1, _08058D44 @ =IWRAM_START + 0xA4
	adds r1, r4, r1
	str r1, [sp, #0x40]
	ldr r2, _08058D48 @ =IWRAM_START + 0xA8
	adds r2, r4, r2
	str r2, [sp, #0x44]
_08058BCE:
	adds r5, r6, #1
	lsls r0, r5, #4
	ldr r3, [sp, #0x38]
	ldrb r2, [r3]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #3
	mov r4, sl
	adds r4, #0xa4
	adds r4, r4, r2
	ldr r0, [r4]
	ldr r1, [r7]
	subs r0, r0, r1
	mov r6, sb
	strh r0, [r6, #0x16]
	mov r3, sl
	adds r3, #0xa8
	adds r3, r3, r2
	ldr r0, [r3]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r1, [r4]
	ldr r2, [r3]
	mov r0, sb
	bl sub_800C84C
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _08058BCE
	movs r7, #0xc
	add r7, sl
	mov sb, r7
	mov r0, sb
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08058C26
	b _08058D50
_08058C26:
	mov r1, sl
	adds r1, #0xa0
	movs r0, #0x78
	strb r0, [r1]
	movs r0, #0x4c
	add r0, sl
	mov sb, r0
	bl sub_8004558
	movs r6, #0
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x48]
	mov r2, sp
	adds r2, #0x10
	str r2, [sp, #0x4c]
	mov r3, sl
	adds r3, #0x9c
	str r3, [sp, #0x3c]
	ldr r4, [sp, #0x44]
	mov r8, r4
_08058C50:
	movs r0, #0xa9
	lsls r0, r0, #2
	add r0, sl
	adds r5, r6, #1
	lsls r1, r5, #4
	ldrb r0, [r0]
	subs r7, r0, r1
	movs r0, #0x3f
	ands r7, r0
	lsls r3, r7, #3
	ldr r0, [sp, #0x40]
	adds r4, r0, r3
	ldr r0, [r4]
	ldr r2, _08058D3C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r1, sb
	strh r0, [r1, #0x16]
	add r3, r8
	ldr r0, [r3]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r2, sb
	strh r0, [r2, #0x18]
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #2
	mov r1, sp
	adds r1, r1, r2
	adds r1, #8
	ldr r0, [r4]
	str r0, [r1]
	ldr r4, [sp, #0x48]
	adds r1, r4, r2
	ldr r0, [r3]
	str r0, [r1]
	ldr r6, [sp, #0x4c]
	adds r2, r6, r2
	subs r0, r7, #1
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldr r1, [r3]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r2]
	mov r0, sb
	bl sub_80051E8
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _08058C50
	movs r6, #0
	ldr r3, [sp, #0x40]
	ldr r7, [sp, #0x44]
_08058CC2:
	lsls r1, r6, #3
	adds r2, r3, r1
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r0, sp
	adds r0, r0, r4
	adds r0, #8
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r2]
	adds r1, r7, r1
	ldr r2, [sp, #0x48]
	adds r0, r2, r4
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	ldr r5, [sp, #0x3c]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r5, r6, #1
	adds r1, r5, #0
	str r3, [sp, #0x50]
	bl Div
	adds r2, r6, #3
	lsls r2, r2, #3
	ldr r3, [sp, #0x50]
	adds r1, r3, r2
	str r0, [r1]
	adds r2, r7, r2
	ldr r6, [sp, #0x4c]
	adds r4, r6, r4
	ldr r0, [r4]
	lsls r0, r0, #8
	str r0, [r2]
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _08058CC2
	ldr r0, _08058D1C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058D4C @ =sub_80591FC
	str r0, [r1, #8]
	b _08058ECA
	.align 2, 0
_08058D1C: .4byte gCurTask
_08058D20: .4byte IWRAM_START + 0xC
_08058D24: .4byte IWRAM_START + 0x9E
_08058D28: .4byte IWRAM_START + 0x94
_08058D2C: .4byte IWRAM_START + 0x9C
_08058D30: .4byte IWRAM_START + 0x8C
_08058D34: .4byte IWRAM_START + 0x90
_08058D38: .4byte sub_801EE64
_08058D3C: .4byte gCamera
_08058D40: .4byte IWRAM_START + 0x2A4
_08058D44: .4byte IWRAM_START + 0xA4
_08058D48: .4byte IWRAM_START + 0xA8
_08058D4C: .4byte sub_80591FC
_08058D50:
	mov r7, sl
	adds r7, #0x9e
	mov r0, r8
	cmp r0, #0
	bge _08058E06
	mov r1, sb
	ldrh r0, [r1, #0x18]
	add r0, r8
	strh r0, [r1, #0x18]
	mov r2, sl
	adds r2, #0x98
	mov r3, r8
	lsls r1, r3, #8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r7]
	ldr r6, _08058DC4 @ =0x000001FB
	mov r4, sb
	strh r6, [r4, #0xa]
	mov r4, sl
	adds r4, #0x2c
	movs r0, #1
	strb r0, [r4]
	mov r3, sl
	adds r3, #0x2d
	movs r5, #1
	rsbs r5, r5, #0
	mov r8, r5
	movs r0, #0xff
	strb r0, [r3]
	subs r2, #4
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r5, [sp, #0x2c]
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08058DC8
	mov r0, sl
	adds r0, #0x9c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08058DC8
	mov r2, sb
	strh r6, [r2, #0xa]
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r3]
	mov r4, r8
	orrs r0, r4
	strb r0, [r3]
	b _08058DFE
	.align 2, 0
_08058DC4: .4byte 0x000001FB
_08058DC8:
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r5, [sp, #0x2c]
	movs r0, #3
	ldrsb r0, [r5, r0]
	ldrb r6, [r5, #5]
	adds r0, r0, r6
	lsls r0, r0, #3
	cmp r1, r0
	blt _08058E06
	mov r0, sl
	adds r0, #0x9c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08058E06
	movs r1, #0
	ldr r0, _08058E9C @ =0x000001FB
	mov r2, sb
	strh r0, [r2, #0xa]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08058DFE:
	ldr r0, _08058EA0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058EA4 @ =sub_8058EDC
	str r0, [r1, #8]
_08058E06:
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _08058E28
	mov r1, sb
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08058E28
	ldr r0, _08058E9C @ =0x000001FB
	mov r4, sb
	strh r0, [r4, #0xa]
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08058E28:
	mov r0, sl
	adds r0, #0x8c
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r3, _08058EA8 @ =gCamera
	ldr r1, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08058E62
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08058E62
	mov r0, sl
	adds r0, #0x90
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r0, r1, r6
	cmp r2, r0
	bgt _08058E62
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08058EAC
_08058E62:
	mov r7, sb
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08058E88
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08058E88
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058EAC
_08058E88:
	mov r3, sl
	ldrb r0, [r3, #8]
	ldr r4, [sp, #0x2c]
	strb r0, [r4]
	ldr r0, _08058EA0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058ECA
	.align 2, 0
_08058E9C: .4byte 0x000001FB
_08058EA0: .4byte gCurTask
_08058EA4: .4byte sub_8058EDC
_08058EA8: .4byte gCamera
_08058EAC:
	ldr r5, [sp, #0x30]
	lsls r0, r5, #8
	ldr r6, [sp, #0x34]
	lsls r1, r6, #8
	bl sub_80122DC
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	mov r0, sl
	bl sub_8059320
_08058ECA:
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8058EDC
sub_8058EDC: @ 0x08058EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _080590C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _080590C8 @ =IWRAM_START + 0xC
	adds r0, r0, r2
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp, #0x24]
	ldr r3, _080590CC @ =IWRAM_START + 0x8C
	adds r0, r2, r3
	ldr r4, _080590D0 @ =IWRAM_START + 0x94
	adds r1, r2, r4
	ldr r5, [r0]
	ldr r0, [r1]
	adds r5, r5, r0
	asrs r5, r5, #8
	str r5, [sp, #0x28]
	ldr r7, _080590D4 @ =IWRAM_START + 0x90
	adds r0, r2, r7
	adds r3, #0xc
	adds r1, r2, r3
	ldr r4, [r0]
	ldr r0, [r1]
	adds r4, r4, r0
	asrs r4, r4, #8
	str r4, [sp, #0x2c]
	ldr r6, _080590D8 @ =gCamera
	ldr r0, [r6]
	adds r7, r5, #0
	subs r0, r7, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r6, #4]
	ldr r3, [sp, #0x2c]
	subs r0, r3, r0
	strh r0, [r1, #0x18]
	ldr r7, _080590DC @ =IWRAM_START + 0x2A4
	adds r3, r2, r7
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r7, _080590E0 @ =IWRAM_START + 0xA4
	adds r0, r2, r7
	adds r0, r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r5, _080590E4 @ =IWRAM_START + 0xA8
	adds r0, r2, r5
	adds r0, r0, r1
	str r4, [r0]
	ldrb r0, [r3]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r3]
	subs r7, #0x58
	adds r7, r7, r2
	mov r8, r7
	movs r7, #0
	ldr r0, _080590DC @ =IWRAM_START + 0x2A4
	adds r0, r0, r2
	mov sl, r0
	ldr r1, _080590E0 @ =IWRAM_START + 0xA4
	adds r1, r2, r1
	str r1, [sp, #0x3c]
	adds r3, r5, #0
	adds r3, r2, r3
	str r3, [sp, #0x40]
_08058F7A:
	adds r5, r7, #1
	lsls r0, r5, #4
	mov r4, sl
	ldrb r2, [r4]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #3
	mov r4, sb
	adds r4, #0xa4
	adds r4, r4, r2
	ldr r0, [r4]
	ldr r1, [r6]
	subs r0, r0, r1
	mov r7, r8
	strh r0, [r7, #0x16]
	mov r3, sb
	adds r3, #0xa8
	adds r3, r3, r2
	ldr r0, [r3]
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldr r1, [r4]
	ldr r2, [r3]
	mov r0, r8
	bl sub_800C84C
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	cmp r7, #2
	bls _08058F7A
	movs r0, #0xc
	add r0, sb
	mov r8, r0
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08058FD0
	b _080590EC
_08058FD0:
	mov r1, sb
	adds r1, #0xa0
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _080590C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080590E8 @ =sub_80591FC
	str r0, [r1, #8]
	movs r1, #0x4c
	add r1, sb
	mov r8, r1
	mov r0, r8
	bl sub_8004558
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0x30]
	mov r3, sp
	adds r3, #8
	str r3, [sp, #0x34]
	mov r4, sb
	adds r4, #0x9c
	str r4, [sp, #0x38]
	ldr r5, [sp, #0x40]
	mov sl, r5
_08059004:
	movs r0, #0xa9
	lsls r0, r0, #2
	add r0, sb
	adds r5, r7, #1
	lsls r1, r5, #4
	ldrb r0, [r0]
	subs r6, r0, r1
	movs r0, #0x3f
	ands r6, r0
	lsls r3, r6, #3
	ldr r0, [sp, #0x3c]
	adds r4, r0, r3
	ldr r0, [r4]
	ldr r2, _080590D8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	add r3, sl
	ldr r0, [r3]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #0x18]
	lsls r2, r7, #1
	adds r2, r2, r7
	lsls r2, r2, #2
	mov r7, sp
	adds r1, r7, r2
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, [sp, #0x30]
	adds r1, r0, r2
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, [sp, #0x34]
	adds r2, r1, r2
	subs r0, r6, #1
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldr r1, [r3]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r2]
	mov r0, r8
	bl sub_80051E8
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	cmp r7, #2
	bls _08059004
	movs r7, #0
	ldr r3, [sp, #0x3c]
	ldr r6, [sp, #0x40]
_08059074:
	lsls r1, r7, #3
	adds r2, r3, r1
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #2
	mov r5, sp
	adds r0, r5, r4
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r2]
	adds r1, r6, r1
	ldr r2, [sp, #0x30]
	adds r0, r2, r4
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	ldr r5, [sp, #0x38]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r5, r7, #1
	adds r1, r5, #0
	str r3, [sp, #0x44]
	bl Div
	adds r2, r7, #3
	lsls r2, r2, #3
	ldr r3, [sp, #0x44]
	adds r1, r3, r2
	str r0, [r1]
	adds r2, r6, r2
	ldr r7, [sp, #0x34]
	adds r4, r7, r4
	ldr r0, [r4]
	lsls r0, r0, #8
	str r0, [r2]
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	cmp r7, #2
	bls _08059074
	b _080591E0
	.align 2, 0
_080590C4: .4byte gCurTask
_080590C8: .4byte IWRAM_START + 0xC
_080590CC: .4byte IWRAM_START + 0x8C
_080590D0: .4byte IWRAM_START + 0x94
_080590D4: .4byte IWRAM_START + 0x90
_080590D8: .4byte gCamera
_080590DC: .4byte IWRAM_START + 0x2A4
_080590E0: .4byte IWRAM_START + 0xA4
_080590E4: .4byte IWRAM_START + 0xA8
_080590E8: .4byte sub_80591FC
_080590EC:
	mov r0, sb
	adds r0, #0x8c
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r3, _08059160 @ =gCamera
	ldr r1, [r3]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _08059126
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08059126
	mov r0, sb
	adds r0, #0x90
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08059126
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08059168
_08059126:
	mov r7, r8
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805914C
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805914C
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059168
_0805914C:
	mov r3, sb
	ldrb r0, [r3, #8]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	ldr r0, _08059164 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080591E0
	.align 2, 0
_08059160: .4byte gCamera
_08059164: .4byte gCurTask
_08059168:
	ldr r5, [sp, #0x28]
	lsls r0, r5, #8
	ldr r7, [sp, #0x2c]
	lsls r1, r7, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	cmp r0, #0
	bne _080591D4
	mov r0, r8
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080591A8
	ldr r0, _080591A0 @ =0xFFFFFBFF
	ands r1, r0
	mov r2, r8
	str r1, [r2, #0x10]
	mov r1, sb
	adds r1, #0x9c
	ldr r0, _080591A4 @ =0x0000FE80
	b _080591B6
	.align 2, 0
_080591A0: .4byte 0xFFFFFBFF
_080591A4: .4byte 0x0000FE80
_080591A8:
	orrs r1, r2
	mov r3, r8
	str r1, [r3, #0x10]
	mov r1, sb
	adds r1, #0x9c
	movs r0, #0xc0
	lsls r0, r0, #1
_080591B6:
	strh r0, [r1]
	ldr r0, _080591F0 @ =0x000001FB
	mov r4, r8
	strh r0, [r4, #0xa]
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080591F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080591F8 @ =sub_8058AF4
	str r0, [r1, #8]
_080591D4:
	mov r0, r8
	bl sub_80051E8
	mov r0, sb
	bl sub_8059320
_080591E0:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080591F0: .4byte 0x000001FB
_080591F4: .4byte gCurTask
_080591F8: .4byte sub_8058AF4

	thumb_func_start sub_80591FC
sub_80591FC: @ 0x080591FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _0805922C @ =gCurTask
	ldr r0, [r2]
	ldrh r4, [r0, #6]
	ldr r0, _08059230 @ =IWRAM_START + 0x4C
	adds r7, r4, r0
	adds r0, #0x54
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059234
	ldr r0, [r2]
	bl TaskDestroy
	b _080592F8
	.align 2, 0
_0805922C: .4byte gCurTask
_08059230: .4byte IWRAM_START + 0x4C
_08059234:
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	mov r8, r0
	ldr r0, _08059308 @ =IWRAM_START + 0xA4
	adds r0, r0, r4
	mov sl, r0
	ldr r0, _0805930C @ =IWRAM_START + 0xA0
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, _08059310 @ =IWRAM_START + 0xA8
	adds r0, r0, r4
	mov sb, r0
_08059250:
	mov r1, r8
	adds r1, #3
	lsls r1, r1, #3
	mov r0, sb
	adds r4, r0, r1
	ldr r0, [r4]
	adds r0, #0x30
	str r0, [r4]
	mov r0, r8
	lsls r2, r0, #3
	mov r0, sl
	adds r6, r0, r2
	add r1, sl
	ldr r0, [r6]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r6]
	mov r0, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r1, [r4]
	adds r0, r0, r1
	str r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r6]
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08059314 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080592A6
	lsls r0, r0, #8
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
_080592A6:
	ldr r0, [sp, #8]
	ldrb r2, [r0]
	cmp r2, #0x2d
	bhi _080592BE
	ldr r0, _08059318 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080592EA
	cmp r2, #0x2c
	bhi _080592EA
_080592BE:
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r2, _0805931C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r7, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_080592EA:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _08059250
_080592F8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059308: .4byte IWRAM_START + 0xA4
_0805930C: .4byte IWRAM_START + 0xA0
_08059310: .4byte IWRAM_START + 0xA8
_08059314: .4byte sub_801EE64
_08059318: .4byte gUnknown_03005590
_0805931C: .4byte gCamera

	thumb_func_start sub_8059320
sub_8059320: @ 0x08059320
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #0
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r7, _08059394 @ =gCamera
_0805933E:
	adds r4, #1
	lsls r0, r4, #4
	mov r1, r8
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #3
	adds r0, r6, #0
	adds r0, #0xa4
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xa8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805933E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059394: .4byte gCamera

	thumb_func_start sub_8059398
sub_8059398: @ 0x08059398
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x50]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Enemy_Kyura
initSprite_Enemy_Kyura: @ 0x080593B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080594B8 @ =sub_80594E0
	ldr r2, _080594BC @ =0x00004040
	ldr r1, _080594C0 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r6, r1
	ldr r7, _080594C4 @ =IWRAM_START + 0xC
	adds r3, r6, r7
	movs r0, #0
	mov sl, r0
	movs r2, #0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, sb
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, r8
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	str r2, [r1, #0x4c]
	str r2, [r1, #0x50]
	str r2, [r1, #0x54]
	ldrb r0, [r7, #5]
	lsls r0, r0, #2
	ldr r4, _080594C8 @ =IWRAM_START + 0x58
	adds r1, r6, r4
	strb r0, [r1]
	ldrb r0, [r7, #6]
	lsls r0, r0, #2
	ldr r7, _080594CC @ =IWRAM_START + 0x59
	adds r1, r6, r7
	strb r0, [r1]
	ldr r0, _080594D0 @ =IWRAM_START + 0x5A
	adds r1, r6, r0
	movs r0, #8
	strb r0, [r1]
	adds r4, #3
	adds r1, r6, r4
	movs r0, #0xc
	strb r0, [r1]
	strh r2, [r3, #0x16]
	strh r2, [r3, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x18
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	ldr r3, [sp, #8]
	str r0, [r3, #4]
	ldr r0, _080594D4 @ =0x000001FD
	strh r0, [r3, #0xa]
	subs r4, #0x2f
	adds r0, r6, r4
	mov r7, sl
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r3, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x1c]
	ldr r0, _080594D8 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r4, #2
	adds r1, r6, r4
	movs r0, #0x10
	strb r0, [r1]
	ldr r7, _080594DC @ =IWRAM_START + 0x31
	adds r6, r6, r7
	mov r0, sl
	strb r0, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r3, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080594B8: .4byte sub_80594E0
_080594BC: .4byte 0x00004040
_080594C0: .4byte TaskDestructor_80095E8
_080594C4: .4byte IWRAM_START + 0xC
_080594C8: .4byte IWRAM_START + 0x58
_080594CC: .4byte IWRAM_START + 0x59
_080594D0: .4byte IWRAM_START + 0x5A
_080594D4: .4byte 0x000001FD
_080594D8: .4byte IWRAM_START + 0x2D
_080594DC: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80594E0
sub_80594E0: @ 0x080594E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08059584 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _08059588 @ =IWRAM_START + 0xC
	adds r1, r1, r4
	mov r8, r1
	ldr r2, [r7]
	mov sl, r2
	ldr r3, [r7, #0x54]
	lsls r0, r3, #2
	adds r0, r0, r3
	ldr r1, _0805958C @ =0x000003FF
	adds r5, r1, #0
	ands r0, r5
	ldr r6, _08059590 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _08059594 @ =IWRAM_START + 0x58
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	muls r2, r0, r2
	asrs r2, r2, #6
	str r2, [r7, #0x4c]
	lsls r0, r3, #1
	adds r0, r0, r3
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08059598 @ =IWRAM_START + 0x59
	adds r4, r4, r0
	ldrb r0, [r4]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r7, #0x50]
	ldr r1, [r7, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	ldr r2, [r7, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #0x18]
	ldr r4, _0805959C @ =gCamera
	ldr r0, [r4]
	adds r3, r1, #0
	subs r0, r3, r0
	mov r3, r8
	strh r0, [r3, #0x16]
	ldr r0, [r4, #4]
	ldr r3, [sp, #0x18]
	subs r0, r3, r0
	mov r3, r8
	strh r0, [r3, #0x18]
	mov r0, r8
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080595A0
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _080596A0
	.align 2, 0
_08059584: .4byte gCurTask
_08059588: .4byte IWRAM_START + 0xC
_0805958C: .4byte 0x000003FF
_08059590: .4byte gSineTable
_08059594: .4byte IWRAM_START + 0x58
_08059598: .4byte IWRAM_START + 0x59
_0805959C: .4byte gCamera
_080595A0:
	ldr r0, [r7, #0x44]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080595CE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080595CE
	ldr r0, [r7, #0x48]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080595CE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805960C
_080595CE:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080595F6
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _080595F6
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805960C
_080595F6:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059608 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080596A0
	.align 2, 0
_08059608: .4byte gCurTask
_0805960C:
	adds r1, r7, #0
	adds r1, #0x5a
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059688
	movs r0, #4
	strb r0, [r1]
	adds r4, r7, #0
	adds r4, #0x5b
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	ands r0, r2
	cmp r0, #0
	bne _08059680
	movs r0, #0xc
	strb r0, [r4]
	ldr r2, _080596B0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _080596B4 @ =0x00196225
	muls r0, r1, r0
	ldr r3, _080596B8 @ =0x3C6EF35F
	adds r0, r0, r3
	str r0, [r2]
	movs r2, #1
	ands r2, r0
	mov r1, sp
	movs r0, #3
	strh r0, [r1]
	movs r0, #0xff
	lsls r0, r0, #1
	strh r0, [r1, #2]
	mov r0, sp
	strb r2, [r0, #4]
	ldr r0, [sp, #0x14]
	adds r0, #1
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #6]
	lsls r2, r2, #8
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	subs r0, r0, r2
	strh r0, [r1, #8]
	mov r0, sp
	bl sub_8050E04
_08059680:
	ldr r0, _080596BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080596C0 @ =sub_80596C4
	str r0, [r1, #8]
_08059688:
	ldr r1, [sp, #0x14]
	lsls r0, r1, #8
	ldr r2, [sp, #0x18]
	lsls r1, r2, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
_080596A0:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080596B0: .4byte gPseudoRandom
_080596B4: .4byte 0x00196225
_080596B8: .4byte 0x3C6EF35F
_080596BC: .4byte gCurTask
_080596C0: .4byte sub_80596C4

	thumb_func_start sub_80596C4
sub_80596C4: @ 0x080596C4
	push {r4, r5, lr}
	ldr r3, _0805970C @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	adds r1, #0xc
	adds r4, r0, r1
	ldr r5, _08059710 @ =IWRAM_START + 0x5A
	adds r1, r0, r5
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080596FA
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r2, #0x54]
	adds r0, #8
	ldr r1, _08059714 @ =0x000003FF
	ands r0, r1
	str r0, [r2, #0x54]
	ldr r1, [r3]
	ldr r0, _08059718 @ =sub_80594E0
	str r0, [r1, #8]
_080596FA:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805970C: .4byte gCurTask
_08059710: .4byte IWRAM_START + 0x5A
_08059714: .4byte 0x000003FF
_08059718: .4byte sub_80594E0

	thumb_func_start initSprite_Enemy_BulletBuzzer
initSprite_Enemy_BulletBuzzer: @ 0x0805971C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov sb, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0805982C @ =sub_8059858
	ldr r2, _08059830 @ =0x00004040
	ldr r1, _08059834 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x60
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r7, _08059838 @ =IWRAM_START + 0xC
	adds r2, r4, r7
	movs r0, #0
	mov sl, r0
	movs r3, #0
	strh r5, [r1, #4]
	strh r6, [r1, #6]
	mov r7, r8
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, sb
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	str r3, [r1, #0x4c]
	str r3, [r1, #0x50]
	str r3, [r1, #0x54]
	ldrb r0, [r7, #5]
	lsls r0, r0, #2
	ldr r7, _0805983C @ =IWRAM_START + 0x5A
	adds r1, r4, r7
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1, #6]
	lsls r0, r0, #2
	adds r7, #1
	adds r1, r4, r7
	strb r0, [r1]
	ldr r1, _08059840 @ =IWRAM_START + 0x5C
	adds r0, r4, r1
	mov r7, sl
	strb r7, [r0]
	adds r1, #2
	adds r0, r4, r1
	strb r7, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r2, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	adds r0, r0, r6
	strh r0, [r2, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	movs r0, #0x18
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	ldr r2, [sp, #4]
	str r0, [r2, #4]
	ldr r0, _08059844 @ =0x000001F9
	strh r0, [r2, #0xa]
	ldr r1, _08059848 @ =IWRAM_START + 0x2C
	adds r0, r4, r1
	mov r7, sl
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r2, #8]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r0, _0805984C @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r7, _08059850 @ =IWRAM_START + 0x2E
	adds r1, r4, r7
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08059854 @ =IWRAM_START + 0x31
	adds r4, r4, r0
	mov r1, sl
	strb r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x90
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805982C: .4byte sub_8059858
_08059830: .4byte 0x00004040
_08059834: .4byte TaskDestructor_80095E8
_08059838: .4byte IWRAM_START + 0xC
_0805983C: .4byte IWRAM_START + 0x5A
_08059840: .4byte IWRAM_START + 0x5C
_08059844: .4byte 0x000001F9
_08059848: .4byte IWRAM_START + 0x2C
_0805984C: .4byte IWRAM_START + 0x2D
_08059850: .4byte IWRAM_START + 0x2E
_08059854: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8059858
sub_8059858: @ 0x08059858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08059904 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r7, r0
	ldr r1, _08059908 @ =IWRAM_START + 0xC
	adds r6, r7, r1
	ldr r2, [r5]
	mov sl, r2
	ldr r3, [r5, #0x4c]
	mov r8, r3
	ldr r1, [r5, #0x54]
	adds r1, #1
	ldr r3, _0805990C @ =0x000003FF
	ands r1, r3
	str r1, [r5, #0x54]
	lsls r0, r1, #2
	adds r0, r0, r1
	ands r0, r3
	ldr r4, _08059910 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov ip, r0
	ldr r2, _08059914 @ =IWRAM_START + 0x5A
	adds r0, r7, r2
	ldrb r0, [r0]
	mov r2, ip
	muls r2, r0, r2
	asrs r2, r2, #6
	str r2, [r5, #0x4c]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, _08059918 @ =IWRAM_START + 0x5B
	adds r0, r7, r4
	ldrb r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r5, #0x50]
	ldr r1, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	str r1, [sp]
	ldr r2, [r5, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #4]
	ldr r3, _0805991C @ =gCamera
	ldr r0, [r3]
	adds r4, r1, #0
	subs r0, r4, r0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08059920
	mov r4, sb
	ldr r0, [r4]
	bl TaskDestroy
	b _08059AEE
	.align 2, 0
_08059904: .4byte gCurTask
_08059908: .4byte IWRAM_START + 0xC
_0805990C: .4byte 0x000003FF
_08059910: .4byte gSineTable
_08059914: .4byte IWRAM_START + 0x5A
_08059918: .4byte IWRAM_START + 0x5B
_0805991C: .4byte gCamera
_08059920:
	ldr r1, _08059944 @ =IWRAM_START + 0x5C
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059954
	ldr r0, [r5, #0x4c]
	cmp r8, r0
	bge _08059988
	ldr r0, _08059948 @ =0x000001F9
	strh r0, [r6, #0xa]
	ldr r2, _0805994C @ =IWRAM_START + 0x2C
	adds r1, r7, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, _08059950 @ =IWRAM_START + 0x2D
	adds r1, r7, r3
	b _0805996A
	.align 2, 0
_08059944: .4byte IWRAM_START + 0x5C
_08059948: .4byte 0x000001F9
_0805994C: .4byte IWRAM_START + 0x2C
_08059950: .4byte IWRAM_START + 0x2D
_08059954:
	ldr r0, [r5, #0x4c]
	cmp r8, r0
	ble _0805996E
	ldr r0, _0805997C @ =0x000001F9
	strh r0, [r6, #0xa]
	ldr r4, _08059980 @ =IWRAM_START + 0x2C
	adds r1, r7, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08059984 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
_0805996A:
	movs r0, #0xff
	strb r0, [r1]
_0805996E:
	ldr r0, [r5, #0x4c]
	cmp r8, r0
	bge _08059988
	adds r1, r5, #0
	adds r1, #0x5c
	movs r0, #0
	b _0805998E
	.align 2, 0
_0805997C: .4byte 0x000001F9
_08059980: .4byte IWRAM_START + 0x2C
_08059984: .4byte IWRAM_START + 0x2D
_08059988:
	adds r1, r5, #0
	adds r1, #0x5c
	movs r0, #1
_0805998E:
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _080599A0
	subs r0, r1, #1
	strb r0, [r4]
_080599A0:
	ldr r0, [r5, #0x44]
	asrs r2, r0, #8
	ldr r3, _08059A08 @ =gCamera
	ldr r1, [r3]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r1, r7
	cmp r2, r0
	bgt _080599D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080599D2
	ldr r0, [r5, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080599D2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08059A10
_080599D2:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080599F6
	movs r7, #0x18
	ldrsh r0, [r6, r7]
	adds r0, #0x80
	cmp r0, #0
	blt _080599F6
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059A10
_080599F6:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059A0C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059AEE
	.align 2, 0
_08059A08: .4byte gCamera
_08059A0C: .4byte gCurTask
_08059A10:
	ldr r1, _08059AB8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r2, [sp, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	ldr r3, [sp]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059A8E
	adds r0, r2, #0
	subs r0, #0x56
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x53
	bhi _08059A50
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08059A68
_08059A50:
	ldr r4, _08059ABC @ =0xFFFFFEAA
	adds r0, r2, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x53
	bhi _08059A8E
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08059A8E
_08059A68:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strh r2, [r0]
	adds r0, #5
	strb r1, [r0]
	ldr r0, _08059AC0 @ =0x000001F9
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08059AC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059AC8 @ =sub_8059B04
	str r0, [r1, #8]
_08059A8E:
	ldr r7, [sp]
	lsls r0, r7, #8
	ldr r2, [sp, #4]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _08059AE8
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08059AD0
	ldr r0, _08059ACC @ =0xFFFFFBFF
	ands r1, r0
	b _08059AD2
	.align 2, 0
_08059AB8: .4byte gPlayer
_08059ABC: .4byte 0xFFFFFEAA
_08059AC0: .4byte 0x000001F9
_08059AC4: .4byte gCurTask
_08059AC8: .4byte sub_8059B04
_08059ACC: .4byte 0xFFFFFBFF
_08059AD0:
	orrs r1, r2
_08059AD2:
	str r1, [r6, #0x10]
	movs r1, #0
	ldr r0, _08059B00 @ =0x000001F9
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08059AE8:
	adds r0, r6, #0
	bl sub_80051E8
_08059AEE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059B00: .4byte 0x000001F9

	thumb_func_start sub_8059B04
sub_8059B04: @ 0x08059B04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08059B60 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, _08059B64 @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r0, [r7]
	mov sl, r0
	ldr r1, [r7, #0x44]
	ldr r0, [r7, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x48]
	ldr r0, [r7, #0x50]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08059B68 @ =gCamera
	mov r8, r3
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08059B6C
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08059C8A
	.align 2, 0
_08059B60: .4byte gCurTask
_08059B64: .4byte IWRAM_START + 0xC
_08059B68: .4byte gCamera
_08059B6C:
	ldr r0, [r7, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08059B9E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08059B9E
	ldr r0, [r7, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08059B9E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08059BD8
_08059B9E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08059BC2
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08059BC2
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059BD8
_08059BC2:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059BD4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059C8A
	.align 2, 0
_08059BD4: .4byte gCurTask
_08059BD8:
	adds r1, r7, #0
	adds r1, #0x5d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x22
	bne _08059C3A
	mov r1, sp
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0xfd
	lsls r0, r0, #1
	strh r0, [r1, #2]
	mov r0, sp
	strb r2, [r0, #4]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08059C0E
	adds r0, r4, #0
	adds r0, #0xa
	b _08059C12
_08059C0E:
	adds r0, r4, #0
	subs r0, #0xa
_08059C12:
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0xe
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	mov r1, sp
	adds r0, r7, #0
	adds r0, #0x58
	ldrh r0, [r0]
	subs r0, #0x10
	strh r0, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #8]
	mov r0, sp
	movs r1, #3
	movs r2, #0x10
	bl sub_8050ED8
_08059C3A:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _08059C84
	adds r0, r6, #0
	bl sub_80051E8
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #0x3c
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08059C78 @ =0x000001F9
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08059C7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059C80 @ =sub_8059858
	str r0, [r1, #8]
	b _08059C8A
	.align 2, 0
_08059C78: .4byte 0x000001F9
_08059C7C: .4byte gCurTask
_08059C80: .4byte sub_8059858
_08059C84:
	adds r0, r6, #0
	bl sub_80051E8
_08059C8A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start initSprite_Enemy_Star
initSprite_Enemy_Star: @ 0x08059C9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08059D7C @ =sub_8059D9C
	ldr r2, _08059D80 @ =0x00004050
	ldr r1, _08059D84 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r7, _08059D88 @ =IWRAM_START + 0xC
	adds r6, r2, r7
	movs r0, #0
	mov sl, r0
	movs r3, #0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, sb
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, r8
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x40]
	ldr r4, _08059D8C @ =IWRAM_START + 0x44
	adds r1, r2, r4
	movs r0, #0x78
	strb r0, [r1]
	strh r3, [r6, #0x16]
	strh r3, [r6, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x19
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08059D90 @ =0x000001FF
	strh r0, [r6, #0xa]
	ldr r2, [sp, #4]
	subs r4, #0x18
	adds r0, r2, r4
	mov r7, sl
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	ldr r0, _08059D94 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r4, #2
	adds r1, r2, r4
	movs r0, #0x10
	strb r0, [r1]
	ldr r7, _08059D98 @ =IWRAM_START + 0x31
	adds r2, r2, r7
	mov r0, sl
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059D7C: .4byte sub_8059D9C
_08059D80: .4byte 0x00004050
_08059D84: .4byte TaskDestructor_80095E8
_08059D88: .4byte IWRAM_START + 0xC
_08059D8C: .4byte IWRAM_START + 0x44
_08059D90: .4byte 0x000001FF
_08059D94: .4byte IWRAM_START + 0x2D
_08059D98: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8059D9C
sub_8059D9C: @ 0x08059D9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08059DF0 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r2, _08059DF4 @ =IWRAM_START + 0xC
	adds r6, r1, r2
	ldr r3, [r7]
	mov sl, r3
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _08059DF8 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08059DFC
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08059EA6
	.align 2, 0
_08059DF0: .4byte gCurTask
_08059DF4: .4byte IWRAM_START + 0xC
_08059DF8: .4byte gCamera
_08059DFC:
	mov r2, r8
	ldr r1, [r2]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r4, r0
	bgt _08059E26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _08059E26
	ldr r1, [r2, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _08059E26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _08059E60
_08059E26:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08059E4A
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _08059E4A
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059E60
_08059E4A:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059E5C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059EA6
	.align 2, 0
_08059E5C: .4byte gCurTask
_08059E60:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059E92
	movs r0, #0x14
	strb r0, [r1]
	ldr r0, _08059EB4 @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08059EB8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059EBC @ =sub_8059EC0
	str r0, [r1, #8]
_08059E92:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08059EA6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059EB4: .4byte 0x000001FF
_08059EB8: .4byte gCurTask
_08059EBC: .4byte sub_8059EC0

	thumb_func_start sub_8059EC0
sub_8059EC0: @ 0x08059EC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08059F5C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r1, [r7]
	mov r8, r1
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08059F60 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_800C84C
	ldr r3, [sp]
	ldr r1, [r3]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _08059F26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _08059F26
	ldr r1, [r3, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _08059F26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _08059F64
_08059F26:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08059F4A
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08059F4A
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059F64
_08059F4A:
	ldrb r0, [r7, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08059F5C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059FAA
	.align 2, 0
_08059F5C: .4byte gCurTask
_08059F60: .4byte gCamera
_08059F64:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059F96
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08059FB8 @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08059FBC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059FC0 @ =sub_8059FC4
	str r0, [r1, #8]
_08059F96:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08059FAA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059FB8: .4byte 0x000001FF
_08059FBC: .4byte gCurTask
_08059FC0: .4byte sub_8059FC4

	thumb_func_start sub_8059FC4
sub_8059FC4: @ 0x08059FC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0805A060 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r1, [r7]
	mov r8, r1
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _0805A064 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_800C84C
	ldr r3, [sp]
	ldr r1, [r3]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _0805A02A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _0805A02A
	ldr r1, [r3, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _0805A02A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _0805A068
_0805A02A:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805A04E
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805A04E
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805A068
_0805A04E:
	ldrb r0, [r7, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0805A060 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805A0AE
	.align 2, 0
_0805A060: .4byte gCurTask
_0805A064: .4byte gCamera
_0805A068:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A09A
	movs r0, #0x14
	strb r0, [r1]
	ldr r0, _0805A0BC @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0805A0C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A0C4 @ =sub_805A0C8
	str r0, [r1, #8]
_0805A09A:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805A0AE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0BC: .4byte 0x000001FF
_0805A0C0: .4byte gCurTask
_0805A0C4: .4byte sub_805A0C8

	thumb_func_start sub_805A0C8
sub_805A0C8: @ 0x0805A0C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0805A164 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r1, [r7]
	mov r8, r1
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _0805A168 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_800C84C
	ldr r3, [sp]
	ldr r1, [r3]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _0805A12E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _0805A12E
	ldr r1, [r3, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _0805A12E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _0805A16C
_0805A12E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805A152
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805A152
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805A16C
_0805A152:
	ldrb r0, [r7, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0805A164 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805A1B4
	.align 2, 0
_0805A164: .4byte gCurTask
_0805A168: .4byte gCamera
_0805A16C:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A1A0
	movs r0, #0x78
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805A1C0 @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0805A1C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A1C8 @ =sub_8059D9C
	str r0, [r1, #8]
_0805A1A0:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805A1B4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A1C0: .4byte 0x000001FF
_0805A1C4: .4byte gCurTask
_0805A1C8: .4byte sub_8059D9C
