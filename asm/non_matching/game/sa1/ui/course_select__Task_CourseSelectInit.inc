.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r5, #0
	ldr r0, _08061EE0 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r2, r1
	mov sl, r0
	ldr r0, [r0, #0x10]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #0x30]
	mov r3, sl
	ldr r0, [r3, #0x14]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #0x34]
	ldr r0, [r3, #0x18]
	ldrh r0, [r0, #6]
	adds r6, r0, r1
	ldr r7, [r3, #0x4c]
	mov r8, r7
	adds r1, #0x58
	adds r0, r2, r1
	ldrb r0, [r0]
	movs r3, #1
	add r8, r3
	mov r7, r8
	cmp r7, #0x3f
	bne _08061EE4
	cmp r0, #1
	bne _08061EE4
	subs r1, #6
	adds r0, r2, r1
	strh r5, [r0]
	adds r3, r1, #0
	adds r3, r3, r2
	mov sb, r3
	b _08061EEE
	.align 2, 0
_08061EE0: .4byte gCurTask
_08061EE4:
	mov r1, sl
	adds r1, #0x52
	movs r0, #0x14
	strh r0, [r1]
	mov sb, r1
_08061EEE:
	mov r4, sl
	adds r4, #0x50
	movs r0, #0x14
	strh r0, [r4]
	mov r7, r8
	cmp r7, #0xa
	bhi _08061F64
	add r1, sp, #0x2c
	movs r0, #0x3e
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080620FC @ =gUiGraphics
	movs r1, #0xd9
	lsls r1, r1, #3
	adds r0, r2, r1
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r3, _08062100 @ =0x000006CC
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0x20
	str r0, [sp, #0x18]
	str r0, [sp, #0x24]
	add r1, sp, #0x28
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08062104 @ =0x06010020
	str r0, [sp, #0xc]
	adds r1, #2
	movs r0, #0xc
	strb r0, [r1]
	movs r7, #0xda
	lsls r7, r7, #3
	adds r0, r2, r7
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r1, sp
	adds r3, #8
	adds r0, r2, r3
	ldr r0, [r0]
	strb r0, [r1, #8]
	adds r7, #8
	adds r0, r2, r7
	ldr r0, [r0]
	strb r0, [r1, #9]
	adds r3, #8
	adds r0, r2, r3
	ldr r0, [r0]
	strb r0, [r1, #0xa]
	adds r7, #8
	adds r2, r2, r7
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
_08061F64:
	mov r0, r8
	mov r1, sl
	str r0, [r1, #0x4c]
	movs r0, #0xb4
	lsls r0, r0, #2
	ldr r2, [sp, #0x30]
	adds r1, r2, r0
	mov r3, r8
	str r3, [r1]
	ldr r7, [sp, #0x34]
	adds r0, r7, r0
	str r3, [r0]
	str r3, [r6, #0x48]
	mov r3, sl
	adds r3, #0x55
	ldrb r2, [r3]
	ldr r0, _08062108 @ =0x000002D7
	ldr r7, [sp, #0x30]
	adds r1, r7, r0
	strb r2, [r1]
	ldrb r1, [r3]
	ldr r2, [sp, #0x34]
	adds r0, r2, r0
	strb r1, [r0]
	ldrb r0, [r3]
	adds r3, r6, #0
	adds r3, #0x4f
	strb r0, [r3]
	mov r3, sb
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldrh r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa
	bl Div
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r3, [sp, #0x30]
	adds r2, r3, r0
	strh r1, [r2]
	ldrh r1, [r4]
	ldr r7, [sp, #0x34]
	adds r0, r7, r0
	strh r1, [r0]
	ldrh r1, [r4]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r1, [r0]
	mov r0, sl
	adds r0, #0x57
	ldrb r1, [r0]
	ldr r2, _0806210C @ =0x000002D9
	adds r0, r3, r2
	strb r1, [r0]
	mov r0, sl
	bl sub_805423C
	ldr r1, _08062110 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _08062114 @ =gHBlankCopyTarget
	ldr r0, _08062118 @ =0x04000010
	str r0, [r1]
	ldr r0, _0806211C @ =gHBlankCopySize
	strb r2, [r0]
	ldr r0, _08062120 @ =gBgOffsetsHBlankPrimary
	ldr r1, [r0]
	movs r2, #0
	movs r4, #0
	movs r3, #0x14
_08061FFE:
	strh r4, [r1]
	adds r1, #2
	strh r3, [r1]
	adds r1, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r2, #0xb
	bls _08061FFE
	movs r2, #0
	cmp r5, #0x9f
	bhi _080620A4
	movs r0, #0x40
	mov r3, r8
	subs r3, r0, r3
	str r3, [sp, #0x38]
_08062024:
	movs r3, #0
	adds r6, r2, #1
	mov sb, r6
	lsls r7, r2, #1
	str r7, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	cmp r3, r0
	bhs _08062068
	cmp r5, #0x9f
	bhi _08062068
	movs r6, #0
	mov ip, r6
	ldr r0, _08062124 @ =0x000001FF
	adds r7, r0, #0
	movs r0, #0x40
	mov r6, r8
	subs r4, r0, r6
_08062046:
	mov r0, ip
	strh r0, [r1]
	adds r1, #2
	rsbs r0, r5, #0
	ands r0, r7
	strh r0, [r1]
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	bhs _08062068
	cmp r5, #0x9f
	bls _08062046
_08062068:
	ldr r3, [sp, #0x3c]
	adds r0, r3, r2
	lsls r0, r0, #3
	subs r0, r0, r5
	adds r0, #0x20
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	cmp r5, #0x9f
	bhi _0806209A
	movs r4, #0
_0806207E:
	strh r4, [r1]
	adds r1, #2
	strh r3, [r1]
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x17
	bhi _0806209A
	cmp r5, #0x9f
	bls _0806207E
_0806209A:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	cmp r5, #0x9f
	bls _08062024
_080620A4:
	mov r7, r8
	cmp r7, #0x3f
	beq _080620B6
	ldr r0, _08062128 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080620EC
_080620B6:
	ldr r1, _0806212C @ =gBgScrollRegs
	movs r0, #0x14
	strh r0, [r1, #2]
	movs r2, #0x3f
	mov r0, sl
	str r2, [r0, #0x4c]
	movs r0, #0xb4
	lsls r0, r0, #2
	ldr r3, [sp, #0x30]
	adds r1, r3, r0
	str r2, [r1]
	ldr r6, [sp, #0x34]
	adds r0, r6, r0
	str r2, [r0]
	ldr r1, _08062130 @ =gBgCntRegs
	ldr r0, _08062134 @ =0x00009D83
	strh r0, [r1]
	ldr r2, _08062110 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _08062138 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806213C @ =Task_8062140
	str r0, [r1, #8]
_080620EC:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080620FC: .4byte gUiGraphics
_08062100: .4byte 0x000006CC
_08062104: .4byte 0x06010020
_08062108: .4byte 0x000002D7
_0806210C: .4byte 0x000002D9
_08062110: .4byte gFlags
_08062114: .4byte gHBlankCopyTarget
_08062118: .4byte 0x04000010
_0806211C: .4byte gHBlankCopySize
_08062120: .4byte gBgOffsetsHBlankPrimary
_08062124: .4byte 0x000001FF
_08062128: .4byte gPressedKeys
_0806212C: .4byte gBgScrollRegs
_08062130: .4byte gBgCntRegs
_08062134: .4byte 0x00009D83
_08062138: .4byte gCurTask
_0806213C: .4byte Task_8062140

.syntax divided
