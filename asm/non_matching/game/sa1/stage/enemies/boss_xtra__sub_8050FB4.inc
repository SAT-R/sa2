.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080510D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, _080510D4 @ =gExtraBossTaskData
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _080510D8 @ =0x03000018
	adds r6, r4, r0
	ldr r1, _080510DC @ =0x0300000C
	adds r1, r4, r1
	str r1, [sp]
	ldr r5, _080510E0 @ =gSineTable
	ldr r2, [r7, #8]
	adds r2, #0x70
	mov r8, r2
	ldrh r1, [r2]
	lsrs r1, r1, #6
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r2, [r7, #0x68]
	adds r3, r2, #0
	muls r3, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [r7, #0x6c]
	mov sl, r1
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	subs r3, r3, r0
	asrs r3, r3, #8
	str r3, [r7, #0x60]
	mov r0, r8
	ldrh r1, [r0]
	lsrs r1, r1, #6
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r2, r0, r2
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [r7, #0x64]
	ldr r1, [r7, #8]
	ldr r0, [r1, #0x50]
	adds r3, r3, r0
	str r3, [r7, #0x50]
	ldr r0, [r1, #0x54]
	adds r2, r2, r0
	str r2, [r7, #0x54]
	ldr r2, _080510E4 @ =0x03000076
	adds r1, r4, r2
	mov r3, r8
	ldrh r0, [r3]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _080510E8 @ =0x03000070
	adds r4, r4, r1
	strh r0, [r4]
	ldr r2, [r7, #0x50]
	asrs r2, r2, #8
	ldr r3, _080510EC @ =gCamera
	movs r4, #0
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, [r7, #0x54]
	asrs r0, r0, #8
	movs r4, #2
	ldrsh r1, [r3, r4]
	subs r0, r0, r1
	ldr r1, [sp]
	strh r2, [r1, #6]
	strh r0, [r1, #8]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _080510F0 @ =gOamMatrixIndex
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	ldr r1, [sp]
	bl TransformSprite
	adds r0, r6, #0
	bl DisplaySprite
	mov r0, sb
	adds r0, #0x6e
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	bls _080510C6
	b _08051324
_080510C6:
	lsls r0, r0, #2
	ldr r1, _080510F4 @ =_080510F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080510D0: .4byte gCurTask
_080510D4: .4byte gExtraBossTaskData
_080510D8: .4byte 0x03000018
_080510DC: .4byte 0x0300000C
_080510E0: .4byte gSineTable
_080510E4: .4byte 0x03000076
_080510E8: .4byte 0x03000070
_080510EC: .4byte gCamera
_080510F0: .4byte gOamMatrixIndex
_080510F4: .4byte _080510F8
_080510F8: @ jump table
	.4byte _0805112C @ case 0
	.4byte _0805113C @ case 1
	.4byte _0805116E @ case 2
	.4byte _080511BC @ case 3
	.4byte _08051204 @ case 4
	.4byte _08051250 @ case 5
	.4byte _080512C8 @ case 6
	.4byte _080512C8 @ case 7
	.4byte _08051324 @ case 8
	.4byte _08051324 @ case 9
	.4byte _08051324 @ case 10
	.4byte _08051300 @ case 11
	.4byte _08051312 @ case 12
_0805112C:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
	b _08051332
_0805113C:
	ldr r1, _08051158 @ =gUnknown_084AE560
	movs r2, #0
	ldrsh r0, [r7, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805115C
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #5
	b _08051164
	.align 2, 0
_08051158: .4byte gUnknown_084AE560
_0805115C:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #6
_08051164:
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_804CFE0
	b _08051332
_0805116E:
	ldr r1, _080511B8 @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08051184
	b _08051332
_08051184:
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r4, r7, #0
	adds r4, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804CFE0
	ldrh r0, [r4]
	cmp r0, r5
	beq _080511A0
	b _08051332
_080511A0:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #1
	str r0, [r7, #4]
	cmp r1, #0x1d
	bgt _080511AE
	b _08051332
_080511AE:
	movs r4, #0
	ldrsh r0, [r7, r4]
	adds r1, r6, #0
	b _080512B2
	.align 2, 0
_080511B8: .4byte gUnknown_084AE560
_080511BC:
	ldr r1, _080511FC @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080511D2
	b _08051332
_080511D2:
	ldr r0, [r7, #4]
	cmp r0, #0x10
	ble _080511DA
	movs r0, #0x10
_080511DA:
	lsls r0, r0, #0x1a
	ldr r1, _08051200 @ =gSineTable
	lsrs r0, r0, #0x16
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0xa
	movs r0, #0xb0
	lsls r0, r0, #7
	b _0805128C
	.align 2, 0
_080511FC: .4byte gUnknown_084AE560
_08051200: .4byte gSineTable
_08051204:
	ldr r1, _0805124C @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0805121A
	b _08051332
_0805121A:
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r4, r7, #0
	adds r4, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804CFE0
	ldrh r0, [r4]
	cmp r0, r5
	beq _08051236
	b _08051332
_08051236:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #1
	str r0, [r7, #4]
	cmp r1, #0x1d
	ble _08051332
	movs r4, #0
	ldrsh r0, [r7, r4]
	adds r1, r6, #0
	b _080512B2
	.align 2, 0
_0805124C: .4byte gUnknown_084AE560
_08051250:
	ldr r1, _080512C0 @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08051332
	ldr r0, [r7, #4]
	cmp r0, #0x10
	ble _0805126C
	movs r0, #0x10
_0805126C:
	lsls r0, r0, #0x1a
	ldr r1, _080512C4 @ =gSineTable
	lsrs r0, r0, #0x16
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0xa
	movs r0, #0xc0
	lsls r0, r0, #7
_0805128C:
	adds r1, r0, #0
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_804CFE0
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #1
	str r0, [r7, #4]
	cmp r1, #0x4b
	ble _08051332
	movs r1, #0
	ldrsh r0, [r7, r1]
	adds r1, r4, #0
_080512B2:
	lsls r1, r0
	mov r2, sb
	ldr r0, [r2, #0x5c]
	orrs r0, r1
	str r0, [r2, #0x5c]
	b _08051332
	.align 2, 0
_080512C0: .4byte gUnknown_084AE560
_080512C4: .4byte gSineTable
_080512C8:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	cmp r0, #0
	beq _08051332
	mov r0, sb
	adds r0, #0x54
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x3b
	ble _08051332
	movs r3, #0
	ldrsh r0, [r7, r3]
	movs r1, #1
	lsls r1, r0
	mov r4, sb
	ldr r0, [r4, #0x5c]
	orrs r0, r1
	str r0, [r4, #0x5c]
	b _08051332
_08051300:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xd0
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_804CFE0
	b _08051332
_08051312:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	b _08051332
_08051324:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
_08051332:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
