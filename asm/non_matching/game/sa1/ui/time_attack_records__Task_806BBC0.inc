.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	movs r0, #0xa0
	mov ip, r0
	movs r4, #0
	mov sb, r4
	ldr r5, _0806BC30 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r1, _0806BC34 @ =0x030000D8
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0806BC38 @ =0x03000104
	adds r1, r0, r2
	ldr r7, [r1]
	adds r7, #1
	ldr r1, _0806BC3C @ =0x03000108
	adds r0, r0, r1
	ldr r2, [r0]
	adds r2, #1
	str r2, [r0]
	cmp r7, #0xf0
	bls _0806BC50
	ldr r2, _0806BC40 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r0, #4         @ MUS_COURSE_SELECTION
	bl m4aSongNumStop
	ldr r2, _0806BC44 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0806BC48 @ =0x00001FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0806BC4C @ =gBldRegs
	strh r6, [r0]
	strh r6, [r0, #4]
	ldr r0, [r5]
	bl TaskDestroy
	bl ApplyGameStageSettingsAndStart
	b _0806BCF6
	.align 2, 0
_0806BC30: .4byte gCurTask
_0806BC34: .4byte 0x030000D8
_0806BC38: .4byte 0x03000104
_0806BC3C: .4byte 0x03000108
_0806BC40: .4byte gFlags
_0806BC44: .4byte gDispCnt
_0806BC48: .4byte 0x00001FFF
_0806BC4C: .4byte gBldRegs
_0806BC50:
	cmp r7, #0xd0
	bne _0806BC5E
	movs r0, #1
	mov r5, r8
	strh r0, [r5, #4]
	strh r6, [r5, #6]
	b _0806BC74
_0806BC5E:
	ldr r0, _0806BD08 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0806BC74
	cmp r7, #0x20
	bls _0806BC74
	cmp r7, #0xcf
	bhi _0806BC74
	movs r7, #0xcf
_0806BC74:
	movs r0, #0xff
	adds r3, r0, #0
	ands r3, r2
	ldr r1, _0806BD0C @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0806BD10 @ =gHBlankCopyTarget
	ldr r0, _0806BD14 @ =0x04000010
	str r0, [r1]
	ldr r0, _0806BD18 @ =gHBlankCopySize
	strb r2, [r0]
	ldr r0, _0806BD1C @ =gBgOffsetsHBlankPrimary
	lsls r1, r6, #2
	ldr r0, [r0]
	adds r2, r0, r1
	cmp r6, ip
	bhs _0806BCE0
_0806BC9A:
	movs r1, #0
	lsls r4, r4, #0x18
	str r4, [sp]
	lsls r4, r3, #0x10
	cmp r6, ip
	bhs _0806BCC8
	adds r3, #0
	ldr r5, _0806BD20 @ =0x000001FF
	adds r0, r5, #0
	ands r3, r0
_0806BCAE:
	strh r3, [r2]
	adds r2, #2
	mov r0, sb
	strh r0, [r2]
	adds r2, #2
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r1, #1
	cmp r1, #0x17
	bhi _0806BCC8
	cmp r6, ip
	blo _0806BCAE
_0806BCC8:
	ldr r5, [sp]
	asrs r1, r5, #0x18
	asrs r0, r4, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	rsbs r1, r1, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r6, ip
	blo _0806BC9A
_0806BCE0:
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sl
	str r7, [r0]
	mov r0, r8
	bl sub_805423C
	bl sub_806BF04
	bl sub_806BD24
_0806BCF6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD08: .4byte gPressedKeys
_0806BD0C: .4byte gFlags
_0806BD10: .4byte gHBlankCopyTarget
_0806BD14: .4byte 0x04000010
_0806BD18: .4byte gHBlankCopySize
_0806BD1C: .4byte gBgOffsetsHBlankPrimary
_0806BD20: .4byte 0x000001FF

.syntax divided
