.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08034A1C @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _08034A20 @ =0x0300000C
	adds r1, r1, r5
	mov r8, r1
	ldr r2, _08034A24 @ =0x0300003C
	adds r2, r2, r5
	mov sb, r2
	ldr r0, [r4, #0x6c]
	ldr r1, [r4, #0x74]
	adds r0, r0, r1
	str r0, [r4, #0x6c]
	ldr r0, [r4, #0x70]
	ldr r1, [r4, #0x78]
	adds r0, r0, r1
	str r0, [r4, #0x70]
	ldr r3, _08034A28 @ =0x03000088
	adds r6, r5, r3
	ldrh r1, [r6]
	subs r1, #4
	ldr r2, _08034A2C @ =0x000003FF
	ands r1, r2
	strh r1, [r6]
	ldr r0, _08034A30 @ =0x000001FF
	ands r0, r1
	movs r7, #0x80
	lsls r7, r7, #1
	cmp r0, r7
	bne _08034980
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	mov r3, r8
	str r0, [r3, #0x10]
	mov r3, sb
	ldr r0, [r3, #0x10]
	eors r0, r1
	str r0, [r3, #0x10]
_08034980:
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r3, _08034A34 @ =gSineTable
	ands r0, r2
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	ldr r0, _08034A38 @ =0x0300007C
	adds r2, r5, r0
	ldr r0, [r4, #0x6c]
	asrs r0, r0, #8
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08034A3C @ =0x0300007E
	adds r2, r5, r0
	ldr r0, [r4, #0x70]
	asrs r0, r0, #8
	ldrh r2, [r2]
	adds r0, r0, r2
	asrs r1, r1, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _08034A40 @ =0x03000080
	adds r0, r5, r1
	mov r1, ip
	strh r1, [r0]
	ldr r1, _08034A44 @ =0x03000082
	adds r0, r5, r1
	strh r2, [r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080349E6
	movs r1, #0xff
_080349E6:
	lsls r0, r1, #0x10
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r0, r0, r3
	lsrs r1, r0, #0x10
	adds r3, #0x8a
	adds r0, r5, r3
	strh r1, [r0]
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_80342A0
	ldr r2, _08034A48 @ =0x03000086
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08034A4C
	bl sub_8034B7C
	b _08034B6C
	.align 2, 0
_08034A1C: .4byte gCurTask
_08034A20: .4byte 0x0300000C
_08034A24: .4byte 0x0300003C
_08034A28: .4byte 0x03000088
_08034A2C: .4byte 0x000003FF
_08034A30: .4byte 0x000001FF
_08034A34: .4byte gSineTable
_08034A38: .4byte 0x0300007C
_08034A3C: .4byte 0x0300007E
_08034A40: .4byte 0x03000080
_08034A44: .4byte 0x03000082
_08034A48: .4byte 0x03000086
_08034A4C:
	mov r0, sl
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	ldr r2, _08034AD4 @ =0x0300000C
	adds r1, r1, r2
	ldr r2, _08034AD8 @ =gCamera
	ldrh r0, [r2]
	subs r0, r6, r0
	strh r0, [r1, #0x16]
	ldrh r0, [r2, #2]
	subs r0, r7, r0
	strh r0, [r1, #0x18]
@ sub_80358C8 - inlined
	ldrh r3, [r3, #6]
	ldr r0, _08034ADC @ =0x0300003C
	adds r1, r3, r0
	adds r0, #0x20
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08034A8C
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08034A8C
	movs r0, #0
	strb r0, [r2]
	ldr r2, _08034AE0 @ =0x0300005D
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
_08034A8C:
	mov r0, r8
	bl UpdateSpriteAnimation
	mov r0, sb
	bl UpdateSpriteAnimation
@ sub_8035904 inlined
	ldr r0, _08034AE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r3, _08034AD4 @ =0x0300000C
	adds r1, r0, r3
	adds r3, #0x30
	adds r2, r0, r3
	ldrh r0, [r1, #0x16]
	movs r5, #0
	strh r0, [r2, #0x16]
	ldrh r3, [r1, #0x18]
	strh r3, [r2, #0x18]
	ldrh r1, [r2, #0xa]
	ldr r0, _08034AE8 @ =0x000002B6
	cmp r1, r0
	bne _08034ABC
	subs r0, r3, #3
	strh r0, [r2, #0x18]
_08034ABC:
	bl sub_80343E0
	adds r2, r4, #0
	adds r2, #0x8d
	ldrb r0, [r2]
	cmp r0, #1
	beq _08034B1C
	cmp r0, #1
	bgt _08034AEC
	cmp r0, #0
	beq _08034AF6
	b _08034B6C
	.align 2, 0
_08034AD4: .4byte 0x0300000C
_08034AD8: .4byte gCamera
_08034ADC: .4byte 0x0300003C
_08034AE0: .4byte 0x0300005D
_08034AE4: .4byte gCurTask
_08034AE8: .4byte 0x000002B6
_08034AEC:
	cmp r0, #2
	beq _08034B36
	cmp r0, #3
	beq _08034B4E
	b _08034B6C
_08034AF6:
	adds r0, r4, #0
	adds r0, #0x88
	ldr r3, _08034B14 @ =0xFFFFFEFF
	adds r1, r3, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r0, _08034B18 @ =0x01FF0000
	cmp r1, r0
	bhi _08034B6C
	str r5, [r4, #0x74]
	ldrb r0, [r2]
	adds r0, #1
	b _08034B6A
	.align 2, 0
_08034B14: .4byte 0xFFFFFEFF
_08034B18: .4byte 0x01FF0000
_08034B1C:
	adds r0, r4, #0
	adds r0, #0x88
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bgt _08034B6C
	movs r0, #0xc0
	str r0, [r4, #0x74]
	ldrb r0, [r2]
	adds r0, #1
	b _08034B6A
_08034B36:
	adds r0, r4, #0
	adds r0, #0x88
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _08034B6C
	str r5, [r4, #0x74]
	ldrb r0, [r2]
	adds r0, #1
	b _08034B6A
_08034B4E:
	adds r0, r4, #0
	adds r0, #0x88
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	beq _08034B62
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	ble _08034B6C
_08034B62:
	movs r0, #0xc0
	rsbs r0, r0, #0
	str r0, [r4, #0x74]
	movs r0, #0
_08034B6A:
	strb r0, [r2]
_08034B6C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
