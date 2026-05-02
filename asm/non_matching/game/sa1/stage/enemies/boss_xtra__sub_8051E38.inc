.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08051F58 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, _08051F5C @ =gExtraBossTaskData
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _08051F60 @ =0x03000018
	adds r6, r4, r0
	ldr r1, _08051F64 @ =0x0300000C
	adds r1, r1, r4
	mov sb, r1
	ldr r5, _08051F68 @ =gSineTable
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
	ldr r5, [r7, #8]
	ldr r0, [r5, #0x50]
	adds r3, r3, r0
	str r3, [r7, #0x50]
	ldr r0, [r5, #0x54]
	adds r2, r2, r0
	str r2, [r7, #0x54]
	ldr r0, _08051F6C @ =0x03000076
	adds r1, r4, r0
	mov r2, r8
	ldrh r0, [r2]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r3, _08051F70 @ =0x03000070
	adds r4, r4, r3
	strh r0, [r4]
	ldr r2, [r7, #0x50]
	asrs r2, r2, #8
	ldr r5, _08051F74 @ =gCamera
	movs r1, #0
	ldrsh r0, [r5, r1]
	subs r2, r2, r0
	ldr r0, [r7, #0x54]
	asrs r0, r0, #8
	movs r3, #2
	ldrsh r1, [r5, r3]
	subs r0, r0, r1
	mov r5, sb
	strh r2, [r5, #6]
	strh r0, [r5, #8]
	ldrh r0, [r4]
	lsrs r0, r0, #6
	strh r0, [r5]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08051F78 @ =gOamMatrixIndex
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
	mov r1, sb
	bl TransformSprite
	adds r0, r6, #0
	bl DisplaySprite
	ldr r0, [sp]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bhi _0805200C
	lsls r0, r0, #2
	ldr r1, _08051F7C @ =_08051F80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051F58: .4byte gCurTask
_08051F5C: .4byte gExtraBossTaskData
_08051F60: .4byte 0x03000018
_08051F64: .4byte 0x0300000C
_08051F68: .4byte gSineTable
_08051F6C: .4byte 0x03000076
_08051F70: .4byte 0x03000070
_08051F74: .4byte gCamera
_08051F78: .4byte gOamMatrixIndex
_08051F7C: .4byte _08051F80
_08051F80: @ jump table
	.4byte _08051FD8 @ case 0
	.4byte _0805200C @ case 1
	.4byte _0805201A @ case 2
	.4byte _0805201A @ case 3
	.4byte _08051FBC @ case 4
	.4byte _08051FBC @ case 5
	.4byte _08051FBC @ case 6
	.4byte _08051FBC @ case 7
	.4byte _0805200C @ case 8
	.4byte _0805200C @ case 9
	.4byte _0805200C @ case 10
	.4byte _08051FD8 @ case 11
	.4byte _08051FD8 @ case 12
	.4byte _08051FEA @ case 13
	.4byte _08051FFC @ case 14
_08051FBC:
	adds r0, r7, #0
	adds r0, #0x70
	ldrh r1, [r0]
	ldr r0, _08051FD4 @ =0x00000FFF
	cmp r1, r0
	bhi _08051FFC
	adds r0, r7, #0
	adds r0, #0x76
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _08051FE0
	.align 2, 0
_08051FD4: .4byte 0x00000FFF
_08051FD8:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xe0
	lsls r1, r1, #8
_08051FE0:
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	b _0805201A
_08051FEA:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xf8
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_804CFE0
	b _0805201A
_08051FFC:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
	b _0805201A
_0805200C:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
_0805201A:
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
