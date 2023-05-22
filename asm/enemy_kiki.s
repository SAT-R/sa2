.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Kiki
CreateEntity_Kiki: @ 0x08053784
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
