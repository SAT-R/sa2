.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _080611E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r4, r1
	ldr r2, _080611E4 @ =0x030000CC
	adds r0, r4, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov r8, r0
	ldr r3, _080611E8 @ =0x030000D0
	adds r0, r4, r3
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sl, r0
	ldr r0, _080611EC @ =0x030000D8
	adds r2, r4, r0
	ldr r1, [r2]
	adds r3, #4
	adds r0, r4, r3
	ldr r3, [r0]
	mov sb, r3
	movs r3, #1
	add sb, r3
	mov r3, sb
	str r3, [r0]
	mov r0, r8
	str r3, [r0, #0x48]
	mov r0, sl
	str r3, [r0, #0x48]
	str r1, [r2]
	mov r2, r8
	str r1, [r2, #0x4c]
	str r1, [r0, #0x4c]
	ldr r3, _080611F0 @ =0x030000DE
	adds r5, r4, r3
	ldrh r0, [r5]
	cmp r0, #0
	bne _0806126C
	ldr r0, _080611F4 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08061200
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r0, #2
	strb r0, [r5]
	ldr r0, _080611F8 @ =0x030000DC
	adds r2, r4, r0
	ldrb r1, [r2]
	ldr r3, _080611FC @ =0x030000DD
	adds r0, r4, r3
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0806122E
	.align 2, 0
_080611E0: .4byte gCurTask
_080611E4: .4byte 0x030000CC
_080611E8: .4byte 0x030000D0
_080611EC: .4byte 0x030000D8
_080611F0: .4byte 0x030000DE
_080611F4: .4byte gRepeatedKeys
_080611F8: .4byte 0x030000DC
_080611FC: .4byte 0x030000DD
_08061200:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0806122E
	movs r0, #0x6c
	bl m4aSongNumStart
	movs r0, #2
	strb r0, [r5]
	ldr r0, _08061260 @ =0x030000DC
	adds r2, r4, r0
	ldrb r1, [r2]
	ldr r3, _08061264 @ =0x030000DD
	adds r0, r4, r3
	strb r1, [r0]
	ldrb r0, [r2]
	subs r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x6c
	bl m4aSongNumStart
_0806122E:
	ldr r0, _08061268 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r4, r6, #0
	adds r4, #0xdf
	cmp r0, #0
	beq _0806127A
	movs r0, #0x6b
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r4]
	strh r0, [r6, #4]
	ldrh r1, [r6, #6]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r6, #6]
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0806127A
	.align 2, 0
_08061260: .4byte 0x030000DC
_08061264: .4byte 0x030000DD
_08061268: .4byte gPressedKeys
_0806126C:
	ldrb r0, [r5]
	ldr r3, _0806131C @ =0x030000DF
	adds r4, r4, r3
	cmp r0, #0
	beq _0806127A
	subs r0, #1
	strb r0, [r5]
_0806127A:
	adds r0, r6, #0
	bl sub_805423C
	adds r2, r6, #0
	adds r2, #0xde
	ldrb r0, [r2]
	mov r1, r8
	adds r1, #0x52
	movs r5, #0
	strb r0, [r1]
	ldrb r0, [r2]
	mov r1, sl
	adds r1, #0x52
	strb r0, [r1]
	adds r3, r6, #0
	adds r3, #0xdd
	ldrb r0, [r3]
	mov r1, r8
	adds r1, #0x51
	strb r0, [r1]
	subs r2, #2
	ldrb r1, [r2]
	mov r0, r8
	adds r0, #0x50
	strb r1, [r0]
	ldrb r0, [r3]
	mov r1, sl
	adds r1, #0x51
	strb r0, [r1]
	ldrb r1, [r2]
	mov r0, sl
	adds r0, #0x50
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08061334
	movs r0, #6
	ldrsh r1, [r6, r0]
	movs r0, #0xc0
	lsls r0, r0, #5
	cmp r1, r0
	ble _08061334
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _08061334
	ldr r2, _08061320 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r0, #0xa
	bl m4aSongNumStop
	ldr r2, _08061324 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08061328 @ =0x00001FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0806132C @ =gBldRegs
	strh r5, [r0]
	strh r5, [r0, #4]
	adds r0, r6, #0
	adds r0, #0xcc
	ldr r0, [r0]
	bl TaskDestroy
	adds r0, r6, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl TaskDestroy
	ldr r0, _08061330 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	movs r0, #1
	bl CreateCourseSelect
	b _080613A8
	.align 2, 0
_0806131C: .4byte 0x030000DF
_08061320: .4byte gFlags
_08061324: .4byte gDispCnt
_08061328: .4byte 0x00001FFF
_0806132C: .4byte gBldRegs
_08061330: .4byte gCurTask
_08061334:
	movs r0, #0xff
	mov r3, sb
	ands r3, r0
	ldr r1, _080613B8 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _080613BC @ =gHBlankCopyTarget
	ldr r0, _080613C0 @ =0x04000010
	str r0, [r1]
	ldr r0, _080613C4 @ =gHBlankCopySize
	strb r2, [r0]
	ldr r0, _080613C8 @ =gBgOffsetsHBlankPrimary
	lsls r1, r7, #2
	ldr r0, [r0]
	adds r2, r0, r1
	cmp r7, #0xa0
	bhs _080613A4
_0806135A:
	movs r1, #0
	ldr r6, [sp]
	lsls r5, r6, #0x18
	lsls r4, r3, #0x10
	cmp r7, #0xa0
	bhs _0806138C
	adds r3, #0
	ldr r6, _080613CC @ =0x000001FF
	adds r0, r6, #0
	ands r3, r0
_0806136E:
	strh r3, [r2]
	adds r2, #2
	movs r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x17
	bhi _0806138C
	cmp r7, #0xa0
	blo _0806136E
_0806138C:
	asrs r1, r5, #0x18
	asrs r0, r4, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	rsbs r1, r1, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	cmp r7, #0xa0
	blo _0806135A
_080613A4:
	bl sub_80613D0
_080613A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080613B8: .4byte gFlags
_080613BC: .4byte gHBlankCopyTarget
_080613C0: .4byte 0x04000010
_080613C4: .4byte gHBlankCopySize
_080613C8: .4byte gBgOffsetsHBlankPrimary
_080613CC: .4byte 0x000001FF

.syntax divided
