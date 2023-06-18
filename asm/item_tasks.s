.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

.if 0
.endif


	thumb_func_start Task_Item_Shield_Normal
Task_Item_Shield_Normal: @ 0x0802AA48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802AA7C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	ldr r3, _0802AA80 @ =IWRAM_START + 0x30
	adds r0, r1, r3
	ldrb r7, [r0]
	orrs r4, r1
	ldr r6, _0802AA84 @ =gCamera
	ldr r3, _0802AA88 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r5, #3
	ands r5, r1
	cmp r5, #1
	beq _0802AA8C
	adds r0, r2, #0
	bl TaskDestroy
	b _0802AAFA
	.align 2, 0
_0802AA7C: .4byte gCurTask
_0802AA80: .4byte IWRAM_START + 0x30
_0802AA84: .4byte gCamera
_0802AA88: .4byte gPlayer
_0802AA8C:
	movs r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _0802AAFA
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802AAE8 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r1, r5, #0
	ands r1, r7
	ldr r0, _0802AAEC @ =gUnknown_03005590
	ldr r0, [r0]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _0802AAF0
	cmp r1, r5
	bne _0802AAF4
	b _0802AAFA
	.align 2, 0
_0802AAE8: .4byte 0xFFFFCFFF
_0802AAEC: .4byte gUnknown_03005590
_0802AAF0:
	cmp r1, #0
	beq _0802AAFA
_0802AAF4:
	adds r0, r4, #0
	bl sub_80051E8
_0802AAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Task_Item_Shield_Magnetic
Task_Item_Shield_Magnetic: @ 0x0802AB04
	push {r4, r5, r6, lr}
	ldr r0, _0802AB3C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	ldr r3, _0802AB40 @ =IWRAM_START + 0x30
	adds r0, r1, r3
	ldrb r6, [r0]
	orrs r4, r1
	ldr r5, _0802AB44 @ =gCamera
	ldr r0, _0802AB48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AB8E
	ldr r3, _0802AB4C @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #8
	beq _0802AB50
	adds r0, r2, #0
	bl TaskDestroy
	b _0802ABC2
	.align 2, 0
_0802AB3C: .4byte gCurTask
_0802AB40: .4byte IWRAM_START + 0x30
_0802AB44: .4byte gCamera
_0802AB48: .4byte gGameMode
_0802AB4C: .4byte gPlayer
_0802AB50:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ABC2
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r5]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802ABB0 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
_0802AB8E:
	adds r0, r4, #0
	bl sub_8004558
	lsls r0, r6, #0x18
	asrs r2, r0, #0x18
	movs r3, #1
	ands r2, r3
	ldr r0, _0802ABB4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802ABB8
	cmp r2, r3
	bne _0802ABBC
	b _0802ABC2
	.align 2, 0
_0802ABB0: .4byte 0xFFFFCFFF
_0802ABB4: .4byte gUnknown_03005590
_0802ABB8:
	cmp r2, #0
	beq _0802ABC2
_0802ABBC:
	adds r0, r4, #0
	bl sub_80051E8
_0802ABC2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

    @ Unused?
	thumb_func_start sub_802ABC8
sub_802ABC8: @ 0x0802ABC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ABEC @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r7, _0802ABF0 @ =gCamera
	ldr r3, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r3
	cmp r0, #0
	beq _0802ABF4
	adds r0, r2, #0
	bl TaskDestroy
	b _0802AC4E
	.align 2, 0
_0802ABEC: .4byte gCurTask
_0802ABF0: .4byte gCamera
_0802ABF4:
	movs r5, #0
	movs r6, #0
	movs r2, #0
	ldr r0, _0802AC54 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AC26
	ldr r1, _0802AC58 @ =gPlayer
	ldr r0, [r1, #8]
	adds r2, r1, #0
	adds r2, #0x7c
	asrs r0, r0, #8
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r1, #0xc]
	lsls r0, r0, #8
	lsrs r6, r0, #0x10
	adds r1, #0x90
	ldr r0, [r1]
	ldr r2, [r0, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
_0802AC26:
	ldr r1, [r7]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r7, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, _0802AC5C @ =0xFFFFCFFF
	ands r3, r0
	orrs r3, r2
	str r3, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802AC4E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC54: .4byte gGameMode
_0802AC58: .4byte gPlayer
_0802AC5C: .4byte 0xFFFFCFFF

	thumb_func_start Task_Item_Invincibility
Task_Item_Invincibility: @ 0x0802AC60
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ACB0 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r2, _0802ACB4 @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldrb r7, [r0]
	orrs r5, r1
	ldr r0, _0802ACB8 @ =gCamera
	mov ip, r0
	ldr r0, _0802ACBC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802ACC8
	ldr r1, _0802ACC0 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #0x18
	asrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r2, r1
	adds r1, #0x57
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802ACD8
	ldr r1, _0802ACC4 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	ldrh r4, [r0]
	adds r1, #2
	adds r0, r2, r1
	ldrh r3, [r0]
	ldr r2, [r6, #0x10]
	b _0802AD02
	.align 2, 0
_0802ACB0: .4byte gCurTask
_0802ACB4: .4byte IWRAM_START + 0x30
_0802ACB8: .4byte gCamera
_0802ACBC: .4byte gGameMode
_0802ACC0: .4byte gMultiplayerPlayerTasks
_0802ACC4: .4byte IWRAM_START + 0x50
_0802ACC8:
	ldr r2, _0802ACE0 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ACE4
_0802ACD8:
	adds r0, r3, #0
	bl TaskDestroy
	b _0802AD5A
	.align 2, 0
_0802ACE0: .4byte gPlayer
_0802ACE4:
	ldr r0, [r2, #8]
	adds r1, r2, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r2, #0xc]
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r2, [r0, #0x1c]
_0802AD02:
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
	mov r0, ip
	ldr r1, [r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r0, ip
	ldr r1, [r0, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, [r5, #0x10]
	ldr r1, _0802AD48 @ =0xFFFFCFFF
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r3, #1
	adds r2, r3, #0
	bics r2, r7
	ldr r0, _0802AD4C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AD50
	cmp r2, r3
	bne _0802AD54
	b _0802AD5A
	.align 2, 0
_0802AD48: .4byte 0xFFFFCFFF
_0802AD4C: .4byte gUnknown_03005590
_0802AD50:
	cmp r2, #0
	beq _0802AD5A
_0802AD54:
	adds r0, r5, #0
	bl sub_80051E8
_0802AD5A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Task_Item_Confusion
Task_Item_Confusion: @ 0x0802AD60
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ADAC @ =gCurTask
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r2, _0802ADB0 @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldrb r2, [r0]
	orrs r5, r1
	ldr r0, _0802ADB4 @ =gCamera
	mov ip, r0
	ldr r0, _0802ADB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802AE4C
	ldr r1, _0802ADBC @ =gMultiplayerPlayerTasks
	lsls r2, r2, #0x18
	asrs r0, r2, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r3, r1
	adds r1, #0x57
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r0, #0x50
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _0802ADC0
	adds r0, r4, #0
	bl TaskDestroy
	b _0802AE52
	.align 2, 0
_0802ADAC: .4byte gCurTask
_0802ADB0: .4byte IWRAM_START + 0x30
_0802ADB4: .4byte gCamera
_0802ADB8: .4byte gGameMode
_0802ADBC: .4byte gMultiplayerPlayerTasks
_0802ADC0:
	ldr r2, _0802AE04 @ =IWRAM_START + 0x50
	adds r0, r3, r2
	mov r2, ip
	ldr r1, [r2]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, _0802AE08 @ =IWRAM_START + 0x52
	adds r0, r3, r1
	ldr r1, [r2, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r5, #0x10]
	ldr r0, _0802AE0C @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r5, #0x10]
	ldr r2, [r6, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
	orrs r2, r1
	str r2, [r5, #0x10]
	ldr r0, _0802AE10 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802AE14
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	b _0802AE18
	.align 2, 0
_0802AE04: .4byte IWRAM_START + 0x50
_0802AE08: .4byte IWRAM_START + 0x52
_0802AE0C: .4byte 0xFFFFCFFF
_0802AE10: .4byte gUnknown_03005424
_0802AE14:
	ldr r0, _0802AE38 @ =0xFFFFF7FF
	ands r2, r0
_0802AE18:
	str r2, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	asrs r2, r7, #0x18
	movs r3, #1
	ands r2, r3
	ldr r0, _0802AE3C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AE40
	cmp r2, r3
	bne _0802AE44
	b _0802AE52
	.align 2, 0
_0802AE38: .4byte 0xFFFFF7FF
_0802AE3C: .4byte gUnknown_03005590
_0802AE40:
	cmp r2, #0
	beq _0802AE52
_0802AE44:
	adds r0, r5, #0
	bl sub_80051E8
	b _0802AE52
_0802AE4C:
	adds r0, r4, #0
	bl TaskDestroy
_0802AE52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_ItemTasks
TaskDestructor_ItemTasks: @ 0x0802AE58
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
