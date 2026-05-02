.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	ldr r0, _08056814 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0         @ r6 = overD
	ldrh r7, [r6, #0x24]    @ r7 = unk24
	mov r1, sp
	movs r0, #0
	mov r8, r0
	movs r0, #0x5b
	strh r0, [r1, #0xc]
	movs r0, #6
	strh r0, [r1, #0x12]
	mov r0, sp
	mov r1, r8
	strh r1, [r0, #8]
	mov r1, sp
	movs r0, #4
	strh r0, [r1, #0x10]
	movs r2, #1
	movs r0, #1
	strh r0, [r1, #0xe]
	mov r0, sp
	strb r2, [r0, #0x16]
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x78
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x29
	subs r0, r0, r1
	add r5, sp, #0x18       @ r5 = sp18 = arr
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #0x78
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x50
	ble _0805681C
	adds r0, r1, #0
	subs r0, #0x50
	mov r4, sp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x74
	muls r0, r1, r0
	movs r1, #0x12
	bl __divsi3
	adds r0, #0x74
	strh r0, [r4, #0xa]
	ldrb r0, [r5]
	cmp r0, #0x1f
	bls _0805689E
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r3, r8
	strh r3, [r0, #4]
	mov r3, sp
	ldr r2, _08056818 @ =gOamMatrixIndex
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r3, #6]
	adds r0, r5, #0
	mov r1, sp
	bl sub_8052C84
	b _0805689E
	.align 2, 0
_08056814: .4byte gCurTask
_08056818: .4byte gOamMatrixIndex
_0805681C:
	cmp r1, #0x14
	ble _08056864
	subs r1, #0x14
	mov r2, sp
	lsls r1, r1, #0x10
	asrs r1, r1, #0xe
	ldr r3, _0805685C @ =0x000001F1
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r2]
	mov r1, sp
	strh r0, [r1, #2]
	mov r0, sp
	mov r1, r8
	strh r1, [r0, #4]
	mov r3, sp
	ldr r2, _08056860 @ =gOamMatrixIndex
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r3, #6]
	mov r1, sp
	movs r0, #0x68
	strh r0, [r1, #0xa]
	movs r0, #0x53
	strh r0, [r1, #0xc]
	adds r0, r5, #0
	bl sub_8052C84
	b _0805689E
	.align 2, 0
_0805685C: .4byte 0x000001F1
_08056860: .4byte gOamMatrixIndex
_08056864:
	mov r4, sp
	movs r0, #0x74
	muls r0, r1, r0
	movs r1, #0x14
	bl __divsi3
	strh r0, [r4, #0xa]
	ldrb r0, [r5]
	cmp r0, #0x1f
	bls _0805689E
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r3, r8
	strh r3, [r0, #4]
	mov r3, sp
	ldr r2, _08056918 @ =gOamMatrixIndex
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r3, #6]
	adds r0, r5, #0
	mov r1, sp
	bl sub_8052C84
_0805689E:
	lsls r0, r7, #0x10      @ r0 = unk24 << 16
	asrs r2, r0, #0x10
	ldr r0, _0805691C @ =0x000004AF
	cmp r2, r0
	ble _080568B0
	ldr r0, _08056920 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056924 @ =Task_DestroyGameOverD
	str r0, [r1, #8]
_080568B0:
	ldr r5, _08056928 @ =gPressedKeys
	ldrh r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080568F8
	adds r0, r2, #0
	movs r1, #0x78
	bl Div
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	asrs r2, r0, #0x10  @ r2_s16 = (unk24 / 120) + 1;
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #0x13
	lsrs r7, r1, #0x10  @ r7 = unk24 = r2_s16 * 45;
	ldr r4, [r6, #0x1c] @ r4 = overB = overD->unk1C
	movs r3, #0x96
	lsls r3, r3, #3     @ r3 = 1200
	adds r0, r2, #0
	movs r1, #0xa
	subs r1, r1, r0
	lsls r2, r1, #4
	subs r2, r2, r1
	lsls r2, r2, #3
	subs r3, r3, r2
	str r3, [r4, #0x18]
	ldr r1, [r6, #0x20] @ r1 = (GameOverC*)overD->unk20
	ldr r0, _0805692C @ =0x00000566
	subs r0, r0, r2
	str r0, [r1, #0x18]
	ldr r1, [r6, #0x18]
	str r0, [r1, #0x78]
_080568F8:
	ldrh r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08056934
	ldr r0, _08056920 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056930 @ =Task_8056970
	str r0, [r1, #8]
	movs r0, #0
	str r0, [r6, #0x24]
	ldr r1, [r6, #0x18]
	adds r1, #0x80
	movs r0, #1
	strb r0, [r1]
	b _08056940
	.align 2, 0
_08056918: .4byte gOamMatrixIndex
_0805691C: .4byte 0x000004AF
_08056920: .4byte gCurTask
_08056924: .4byte Task_DestroyGameOverD
_08056928: .4byte gPressedKeys
_0805692C: .4byte 0x00000566
_08056930: .4byte Task_8056970
_08056934:
	lsls r0, r7, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	asrs r0, r0, #0x10
	str r0, [r6, #0x24]
_08056940:
	ldr r0, [r6, #0x24]
	movs r1, #0x78
	bl Mod
	cmp r0, #0x3c
	bne _08056960
	ldr r4, _0805696C @ =gUnknown_086883E4
	ldr r0, [r6, #0x24]
	movs r1, #0x78
	bl Div
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	bl m4aSongNumStart
_08056960:
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805696C: .4byte gUnknown_086883E4

.syntax divided
