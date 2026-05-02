.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08051B0C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7, #8]
	str r0, [sp]
	ldr r0, _08051B10 @ =gExtraBossTaskData
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r1, _08051B14 @ =0x03000018
	adds r6, r4, r1
	ldr r2, _08051B18 @ =0x0300000C
	adds r2, r2, r4
	mov sl, r2
	ldr r5, _08051B1C @ =gSineTable
	ldr r3, [sp]
	adds r3, #0x70
	mov r8, r3
	ldrh r1, [r3]
	lsrs r1, r1, #6
	movs r0, #0x80
	lsls r0, r0, #1
	mov ip, r0
	adds r0, r1, r0
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
	mov sb, r1
	mov r1, sb
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
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [r7, #0x64]
	ldr r5, [sp]
	ldr r0, [r5, #0x50]
	adds r3, r3, r0
	str r3, [r7, #0x50]
	ldr r0, [r5, #0x54]
	adds r2, r2, r0
	str r2, [r7, #0x54]
	ldr r0, _08051B20 @ =0x03000076
	adds r1, r4, r0
	mov r2, r8
	ldrh r0, [r2]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r3, _08051B24 @ =0x03000070
	adds r4, r4, r3
	strh r0, [r4]
	ldr r2, [r7, #0x50]
	asrs r2, r2, #8
	ldr r5, _08051B28 @ =gCamera
	movs r1, #0
	ldrsh r0, [r5, r1]
	subs r2, r2, r0
	ldr r0, [r7, #0x54]
	asrs r0, r0, #8
	movs r3, #2
	ldrsh r1, [r5, r3]
	subs r0, r0, r1
	mov r5, sl
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
	ldr r2, _08051B2C @ =gOamMatrixIndex
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
	mov r1, sl
	bl TransformSprite
	adds r0, r6, #0
	bl DisplaySprite
	ldr r0, [sp, #4]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bls _08051B02
	b _08051C28
_08051B02:
	lsls r0, r0, #2
	ldr r1, _08051B30 @ =_08051B34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051B0C: .4byte gCurTask
_08051B10: .4byte gExtraBossTaskData
_08051B14: .4byte 0x03000018
_08051B18: .4byte 0x0300000C
_08051B1C: .4byte gSineTable
_08051B20: .4byte 0x03000076
_08051B24: .4byte 0x03000070
_08051B28: .4byte gCamera
_08051B2C: .4byte gOamMatrixIndex
_08051B30: .4byte _08051B34
_08051B34: @ jump table
	.4byte _08051BCC @ case 0
	.4byte _08051C28 @ case 1
	.4byte _08051B70 @ case 2
	.4byte _08051B70 @ case 3
	.4byte _08051B80 @ case 4
	.4byte _08051B8C @ case 5
	.4byte _08051C34 @ case 6
	.4byte _08051BA4 @ case 7
	.4byte _08051C28 @ case 8
	.4byte _08051C28 @ case 9
	.4byte _08051C28 @ case 10
	.4byte _08051C28 @ case 11
	.4byte _08051C28 @ case 12
	.4byte _08051BDC @ case 13
	.4byte _08051C16 @ case 14
_08051B70:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl sub_804CFE0
	b _08051C34
_08051B80:
	adds r0, r7, #0
	adds r0, #0x76
	ldr r1, [sp]
	adds r1, #0x76
	ldrh r1, [r1]
	b _08051C1E
_08051B8C:
	ldr r1, _08051BA0 @ =gUnknown_084AE560
	movs r2, #0
	ldrsh r0, [r7, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08051C34
	b _08051BB6
	.align 2, 0
_08051BA0: .4byte gUnknown_084AE560
_08051BA4:
	ldr r1, _08051BC8 @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08051C34
_08051BB6:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_804CFE0
	b _08051C34
	.align 2, 0
_08051BC8: .4byte gUnknown_084AE560
_08051BCC:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #5
	movs r2, #0x80
	bl sub_804CFE0
	b _08051C34
_08051BDC:
	adds r4, r7, #0
	adds r4, #0x76
	movs r5, #0x80
	lsls r5, r5, #7
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804CFE0
	ldr r0, [sp, #4]
	adds r0, #0x69
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08051C34
	ldrh r0, [r4]
	cmp r0, r5
	bne _08051C34
	movs r5, #0
	ldrsh r0, [r7, r5]
	movs r1, #1
	lsls r1, r0
	ldr r2, [sp, #4]
	ldr r0, [r2, #0x5c]
	orrs r0, r1
	str r0, [r2, #0x5c]
	b _08051C34
_08051C16:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xe8
	lsls r1, r1, #8
_08051C1E:
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	b _08051C34
_08051C28:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0
	movs r2, #0x80
	bl sub_804CFE0
_08051C34:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
