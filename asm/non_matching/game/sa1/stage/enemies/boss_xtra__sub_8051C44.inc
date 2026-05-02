.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08051D64 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, _08051D68 @ =gExtraBossTaskData
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _08051D6C @ =0x03000018
	adds r6, r4, r0
	ldr r1, _08051D70 @ =0x0300000C
	adds r1, r1, r4
	mov sb, r1
	ldr r5, _08051D74 @ =gSineTable
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
	ldr r0, _08051D78 @ =0x03000076
	adds r1, r4, r0
	mov r2, r8
	ldrh r0, [r2]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r3, _08051D7C @ =0x03000070
	adds r4, r4, r3
	strh r0, [r4]
	ldr r2, [r7, #0x50]
	asrs r2, r2, #8
	ldr r5, _08051D80 @ =gCamera
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
	ldr r2, _08051D84 @ =gOamMatrixIndex
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
	bhi _08051E18
	lsls r0, r0, #2
	ldr r1, _08051D88 @ =_08051D8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051D64: .4byte gCurTask
_08051D68: .4byte gExtraBossTaskData
_08051D6C: .4byte 0x03000018
_08051D70: .4byte 0x0300000C
_08051D74: .4byte gSineTable
_08051D78: .4byte 0x03000076
_08051D7C: .4byte 0x03000070
_08051D80: .4byte gCamera
_08051D84: .4byte gOamMatrixIndex
_08051D88: .4byte _08051D8C
_08051D8C: @ jump table
	.4byte _08051DDC @ case 0
	.4byte _08051DE6 @ case 1
	.4byte _08051DC8 @ case 2
	.4byte _08051E18 @ case 3
	.4byte _08051E18 @ case 4
	.4byte _08051E18 @ case 5
	.4byte _08051E18 @ case 6
	.4byte _08051E18 @ case 7
	.4byte _08051DD2 @ case 8
	.4byte _08051DD2 @ case 9
	.4byte _08051E18 @ case 10
	.4byte _08051E18 @ case 11
	.4byte _08051E18 @ case 12
	.4byte _08051DF6 @ case 13
	.4byte _08051E06 @ case 14
_08051DC8:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #2
	b _08051DFE
_08051DD2:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #2
	b _08051DFE
_08051DDC:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #6
	b _08051DEE
_08051DE6:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xe0
	lsls r1, r1, #8
_08051DEE:
	movs r2, #0x80
	bl sub_804CFE0
	b _08051E28
_08051DF6:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #3
_08051DFE:
	movs r1, #0
	bl sub_804CFE0
	b _08051E28
_08051E06:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xc0
	lsls r1, r1, #5
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	b _08051E28
_08051E18:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #6
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
_08051E28:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
