.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
	thumb_func_start sub_8061C70
sub_8061C70: @ 0x08061C70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061CC0 @ =gCurTask
	mov sb, r0
	ldr r1, [r0]
	mov r8, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r7, [r3]
	ldrh r0, [r3, #4]
	ldrh r2, [r3, #6]
	ldr r4, _08061CC4 @ =gPlayer
	ldrb r6, [r3, #8]
	lsls r1, r6, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov ip, r0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	mov sl, r0
	adds r5, r2, #0
	ands r5, r0
	cmp r5, #0
	beq _08061CC8
	strb r6, [r7]
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08061D96
	.align 2, 0
_08061CC0: .4byte gCurTask
_08061CC4: .4byte gPlayer
_08061CC8:
	ldrh r0, [r4, #0x14]
	adds r6, r0, #1
	strh r6, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x8c
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r5, [r4, #0x12]
	asrs r0, r0, #8
	mov r1, ip
	subs r0, r0, r1
	cmp r0, #0xbe
	ble _08061D14
	mov r0, ip
	adds r0, #0xbe
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	bne _08061D04
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x2f
	strh r0, [r1]
_08061D04:
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _08061D10 @ =sub_8061DA4
	str r0, [r1, #8]
	b _08061D96
	.align 2, 0
_08061D10: .4byte sub_8061DA4
_08061D14:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r3, #0xc]
	cmp r1, r0
	bge _08061D2C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	strh r6, [r4, #0x12]
	b _08061D4A
_08061D2C:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061D58 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08061D64
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	ldr r0, _08061D5C @ =0x0000FB20
	strh r0, [r4, #0x12]
_08061D4A:
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061D60 @ =Task_8061914
	mov r1, r8
	str r0, [r1, #8]
	b _08061D96
	.align 2, 0
_08061D58: .4byte gPlayerControls
_08061D5C: .4byte 0x0000FB20
_08061D60: .4byte Task_8061914
_08061D64:
	movs r5, #4
	ands r2, r5
	cmp r2, #0
	bne _08061D96
	mov r0, sl
	ands r0, r1
	cmp r0, #0
	beq _08061D96
	adds r0, r4, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
_08061D96:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.endif

	thumb_func_start sub_8061DA4
sub_8061DA4: @ 0x08061DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061DF8 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, [r7]
	mov r8, r3
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _08061DFC @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r5, r8
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r2, r0, r2
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	mov sl, ip
	cmp r6, #0
	beq _08061E00
	mov r1, r8
	strb r3, [r1]
	mov r3, ip
	ldr r0, [r3]
	bl TaskDestroy
	b _08061F4A
	.align 2, 0
_08061DF8: .4byte gCurTask
_08061DFC: .4byte gPlayer
_08061E00:
	ldr r0, [r4, #8]
	mov r8, r0
	asrs r0, r0, #8
	subs r3, r0, r1
	movs r0, #0xd4
	lsls r0, r0, #1
	cmp r3, r0
	ble _08061E38
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _08061E20
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _08061E26
_08061E20:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08061E26:
	strb r0, [r1]
	mov r3, sl
	ldr r1, [r3]
	ldr r0, _08061E34 @ =Task_8061914
	str r0, [r1, #8]
	b _08061F4A
	.align 2, 0
_08061E34: .4byte Task_8061914
_08061E38:
	adds r2, #0xbe
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r1, _08061E9C @ =0x000003FF
	mov sl, r1
	ands r3, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	add r0, r8
	str r0, [r4, #8]
	lsls r2, r2, #8
	ldr r1, _08061EA0 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061EA4 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	bge _08061EAC
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061EA8 @ =Task_8061914
	mov r1, sb
	str r0, [r1, #8]
	b _08061F4A
	.align 2, 0
_08061E9C: .4byte 0x000003FF
_08061EA0: .4byte gSineTable
_08061EA4: .4byte 0xFFFFE400
_08061EA8: .4byte Task_8061914
_08061EAC:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061EDC @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08061EE8
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08061EE0 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061EE4 @ =Task_8061914
	mov r3, sb
	str r0, [r3, #8]
	b _08061F4A
	.align 2, 0
_08061EDC: .4byte gPlayerControls
_08061EE0: .4byte 0x0000FB20
_08061EE4: .4byte Task_8061914
_08061EE8:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _08061F4A
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08061F1C
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _08061F4A
_08061F1C:
	ldr r1, _08061F58 @ =PlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r5, _08061F5C @ =0xFFFFFEE6
	adds r0, r3, r5
	mov r1, sl
	ands r0, r1
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_08061F4A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061F58: .4byte PlayerCharacterIdleAnims
_08061F5C: .4byte 0xFFFFFEE6

	thumb_func_start sub_8061F60
sub_8061F60: @ 0x08061F60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _08062050 @ =gCurTask
	ldr r0, [r3]
	str r0, [sp]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, [r5]
	mov sb, r1
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	mov ip, r0
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _08062054 @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r2, #0x80
	mov sl, r2
	mov r0, sl
	ands r0, r6
	mov sl, r0
	cmp r0, #0
	beq _08061FAC
	b _080620AA
_08061FAC:
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r2, r0
	ldr r3, [r7, #8]
	str r3, [sp, #4]
	asrs r4, r3, #8
	cmp r1, r4
	bgt _080620A2
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r4
	blt _080620A2
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080620A2
	mov r3, sb
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080620A2
	cmp ip, r4
	ble _08062068
	ldrb r1, [r5, #9]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _0806209C
	adds r1, r7, #0
	adds r1, #0x6d
	movs r0, #0x1b
	strb r0, [r1]
	mov r1, ip
	subs r0, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08062058 @ =0x000003FF
	ands r0, r1
	movs r3, #0x14
	ldrsh r1, [r7, r3]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	str r1, [r7, #8]
	mov r3, r8
	lsls r2, r3, #8
	ldr r1, _0806205C @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08062060 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r7, #0xc]
	mov r2, sl
	strh r2, [r7, #0x12]
	ldr r0, _08062064 @ =sub_8062100
	ldr r3, [sp]
	str r0, [r3, #8]
	b _080620AA
	.align 2, 0
_08062050: .4byte gCurTask
_08062054: .4byte gPlayer
_08062058: .4byte 0x000003FF
_0806205C: .4byte gSineTable
_08062060: .4byte 0xFFFFE400
_08062064: .4byte sub_8062100
_08062068:
	movs r0, #0x14
	ldrsh r1, [r7, r0]
	ldr r0, _08062094 @ =0xFFFFFC00
	ldrb r3, [r5, #9]
	cmp r1, r0
	bge _0806209C
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	bne _0806209C
	adds r0, r7, #0
	adds r0, #0x5e
	ldr r1, _08062098 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0806209C
	movs r0, #1
	orrs r0, r3
	b _080620A8
	.align 2, 0
_08062094: .4byte 0xFFFFFC00
_08062098: .4byte gPlayerControls
_0806209C:
	movs r0, #0xfe
	ands r0, r3
	b _080620A8
_080620A2:
	ldrb r1, [r5, #9]
	movs r0, #0xfe
	ands r0, r1
_080620A8:
	strb r0, [r5, #9]
_080620AA:
	ldr r1, _080620F8 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r2, r2, r0
	mov ip, r2
	ldr r0, [r1, #4]
	mov r3, r8
	subs r3, r3, r0
	mov r8, r3
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080620D8
	mov r0, r8
	adds r0, #0x80
	cmp r0, #0
	blt _080620D8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r8, r0
	ble _080620E6
_080620D8:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r2, _080620FC @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
_080620E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080620F8: .4byte gCamera
_080620FC: .4byte gCurTask

	thumb_func_start sub_8062100
sub_8062100: @ 0x08062100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062150 @ =gCurTask
	ldr r0, [r0]
	mov sl, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r7, [r1]
	ldrh r0, [r1, #4]
	ldrh r2, [r1, #6]
	ldr r4, _08062154 @ =gPlayer
	ldrb r3, [r1, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sb, r0
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r1, #0x80
	ands r6, r1
	cmp r6, #0
	beq _08062158
	strb r3, [r7]
	ldr r2, _08062150 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _080622AE
	.align 2, 0
_08062150: .4byte gCurTask
_08062154: .4byte gPlayer
_08062158:
	ldr r2, [r4, #8]
	asrs r0, r2, #8
	mov r1, r8
	subs r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r7, r0, #8
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	ldr r1, _080621CC @ =0x000003FF
	ands r7, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	str r2, [r4, #8]
	mov r0, sb
	lsls r3, r0, #8
	ldr r1, _080621D0 @ =gSineTable
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r1, _080621D4 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	asrs r2, r2, #8
	mov r0, r8
	subs r2, r2, r0
	ldr r0, _080621D8 @ =0xFFFFFEE0
	cmp r2, r0
	bge _080621E4
	add r0, r8
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	bne _080621C0
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x31
	strh r0, [r1]
_080621C0:
	ldr r2, _080621DC @ =gCurTask
	ldr r1, [r2]
	ldr r0, _080621E0 @ =sub_80622C8
	str r0, [r1, #8]
	b _080622AE
	.align 2, 0
_080621CC: .4byte 0x000003FF
_080621D0: .4byte gSineTable
_080621D4: .4byte 0xFFFFE400
_080621D8: .4byte 0xFFFFFEE0
_080621DC: .4byte gCurTask
_080621E0: .4byte sub_80622C8
_080621E4:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov r2, ip
	ldr r0, [r2, #0xc]
	cmn r1, r0
	ble _08062210
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806220C @ =sub_8061F60
	mov r1, sl
	str r0, [r1, #8]
	b _080622AE
	.align 2, 0
_0806220C: .4byte sub_8061F60
_08062210:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08062240 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0806224C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08062244 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08062248 @ =sub_8061F60
	mov r2, sl
	str r0, [r2, #8]
	b _080622AE
	.align 2, 0
_08062240: .4byte gPlayerControls
_08062244: .4byte 0x0000FB20
_08062248: .4byte sub_8061F60
_0806224C:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _080622AE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08062280
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _080622AE
_08062280:
	ldr r1, _080622BC @ =PlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r1, _080622C0 @ =0xFFFFFEE6
	adds r0, r7, r1
	ldr r2, _080622C4 @ =0x000003FF
	ands r0, r2
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_080622AE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080622BC: .4byte PlayerCharacterIdleAnims
_080622C0: .4byte 0xFFFFFEE6
_080622C4: .4byte 0x000003FF

	thumb_func_start sub_80622C8
sub_80622C8: @ 0x080622C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062318 @ =gCurTask
	mov sb, r0
	ldr r1, [r0]
	mov r8, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r7, [r3]
	ldrh r0, [r3, #4]
	ldrh r2, [r3, #6]
	ldr r4, _0806231C @ =gPlayer
	ldrb r6, [r3, #8]
	lsls r1, r6, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov ip, r0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	mov sl, r0
	adds r5, r2, #0
	ands r5, r0
	cmp r5, #0
	beq _08062320
	strb r6, [r7]
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08062406
	.align 2, 0
_08062318: .4byte gCurTask
_0806231C: .4byte gPlayer
_08062320:
	ldrh r0, [r4, #0x14]
	adds r6, r0, #1
	strh r6, [r4, #0x14]
	ldr r7, _0806236C @ =0xFFFFFEE0
	adds r0, r1, r7
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r5, [r4, #0x12]
	asrs r0, r0, #8
	mov r1, ip
	subs r0, r0, r1
	movs r1, #0xff
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08062374
	mov r0, ip
	subs r0, #0xff
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	bne _08062360
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x2f
	strh r0, [r1]
_08062360:
	mov r7, sb
	ldr r1, [r7]
	ldr r0, _08062370 @ =sub_8062414
	str r0, [r1, #8]
	b _08062406
	.align 2, 0
_0806236C: .4byte 0xFFFFFEE0
_08062370: .4byte sub_8062414
_08062374:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r3, #0xc]
	cmn r1, r0
	ble _0806239C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08062398 @ =sub_8061F60
	mov r1, r8
	str r0, [r1, #8]
	b _08062406
	.align 2, 0
_08062398: .4byte sub_8061F60
_0806239C:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _080623C8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080623D4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	ldr r0, _080623CC @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _080623D0 @ =sub_8061F60
	mov r7, r8
	str r0, [r7, #8]
	b _08062406
	.align 2, 0
_080623C8: .4byte gPlayerControls
_080623CC: .4byte 0x0000FB20
_080623D0: .4byte sub_8061F60
_080623D4:
	movs r5, #4
	ands r2, r5
	cmp r2, #0
	bne _08062406
	mov r0, sl
	ands r0, r1
	cmp r0, #0
	beq _08062406
	adds r0, r4, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
_08062406:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8062414
sub_8062414: @ 0x08062414
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062468 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, [r7]
	mov r8, r3
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _0806246C @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r5, r8
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r2, r0, r2
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	mov sl, ip
	cmp r6, #0
	beq _08062470
	mov r1, r8
	strb r3, [r1]
	mov r3, ip
	ldr r0, [r3]
	bl TaskDestroy
	b _080625BE
	.align 2, 0
_08062468: .4byte gCurTask
_0806246C: .4byte gPlayer
_08062470:
	ldr r0, [r4, #8]
	mov r8, r0
	asrs r0, r0, #8
	subs r3, r0, r1
	ldr r0, _08062490 @ =0xFFFFFE58
	cmp r3, r0
	bge _080624AC
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _08062494
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _0806249A
	.align 2, 0
_08062490: .4byte 0xFFFFFE58
_08062494:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_0806249A:
	strb r0, [r1]
	mov r3, sl
	ldr r1, [r3]
	ldr r0, _080624A8 @ =sub_8061F60
	str r0, [r1, #8]
	b _080625BE
	.align 2, 0
_080624A8: .4byte sub_8061F60
_080624AC:
	subs r2, #0xc3
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r1, _08062510 @ =0x000003FF
	mov sl, r1
	ands r3, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	add r0, r8
	str r0, [r4, #8]
	lsls r2, r2, #8
	ldr r1, _08062514 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08062518 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0xc]
	cmn r1, r0
	ble _08062520
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806251C @ =sub_8061F60
	mov r1, sb
	str r0, [r1, #8]
	b _080625BE
	.align 2, 0
_08062510: .4byte 0x000003FF
_08062514: .4byte gSineTable
_08062518: .4byte 0xFFFFE400
_0806251C: .4byte sub_8061F60
_08062520:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08062550 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0806255C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08062554 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08062558 @ =sub_8061F60
	mov r3, sb
	str r0, [r3, #8]
	b _080625BE
	.align 2, 0
_08062550: .4byte gPlayerControls
_08062554: .4byte 0x0000FB20
_08062558: .4byte sub_8061F60
_0806255C:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _080625BE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08062590
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _080625BE
_08062590:
	ldr r1, _080625CC @ =PlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r5, _080625D0 @ =0xFFFFFEE6
	adds r0, r3, r5
	mov r1, sl
	ands r0, r1
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_080625BE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080625CC: .4byte PlayerCharacterIdleAnims
_080625D0: .4byte 0xFFFFFEE6

	thumb_func_start initSprite_Interactable_Corkscrew3D_Start
initSprite_Interactable_Corkscrew3D_Start: @ 0x080625D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062624 @ =Task_8061914
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r6]
	strb r2, [r0, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	str r1, [r0, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062624: .4byte Task_8061914

	thumb_func_start initSprite_Interactable_Corkscrew3D_End
initSprite_Interactable_Corkscrew3D_End: @ 0x08062628
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062678 @ =sub_8061F60
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r6]
	strb r2, [r0, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	str r1, [r0, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062678: .4byte sub_8061F60

    @; Possibly part of 'StageGoal' - Unused.
	thumb_func_start sub_806267C
sub_806267C: @ 0x0806267C
	push {r4, r5, r6, lr}
	ldr r6, _080626CC @ =gPlayer
	ldr r5, [r6, #8]
	asrs r3, r5, #8
	subs r3, r3, r0
	lsls r4, r3, #4
	subs r4, r4, r3
	lsls r0, r4, #5
	subs r0, r0, r4
	lsls r0, r0, #1
	asrs r0, r0, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r0, r2
	ldr r2, _080626D0 @ =0x000003FF
	ands r0, r2
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	adds r5, r5, r2
	str r5, [r6, #8]
	lsls r1, r1, #8
	ldr r3, _080626D4 @ =gSineTable
	lsls r2, r0, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r2, r1
	ldr r1, _080626D8 @ =0xFFFFE400
	adds r2, r2, r1
	str r2, [r6, #0xc]
	movs r1, #0
	strh r1, [r6, #0x12]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080626CC: .4byte gPlayer
_080626D0: .4byte 0x000003FF
_080626D4: .4byte gSineTable
_080626D8: .4byte 0xFFFFE400
