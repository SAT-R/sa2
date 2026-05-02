.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	ldr r0, _080588A8 @ =gPressedKeys
	ldrh r7, [r0]
	ldr r3, _080588AC @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r0, _080588B0 @ =0x03000018
	adds r0, r1, r0
	str r0, [sp, #0x30]
	ldr r2, _080588B4 @ =0x0300002C
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r1, r0, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x20
	ble _08058868
	movs r0, #0
	strh r0, [r1]
_08058868:
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r2, _080588B8 @ =0x03000030
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r1, r0, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0x2e
	ble _08058888
	movs r0, #0
	strh r0, [r1]
_08058888:
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r5, _080588BC @ =0x030000FC
	adds r1, r1, r5
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	bgt _080588C0
	ldr r0, [sp, #0x30]
	bl sub_805423C
	b _080588CC
	.align 2, 0
_080588A8: .4byte gPressedKeys
_080588AC: .4byte gCurTask
_080588B0: .4byte 0x03000018
_080588B4: .4byte 0x0300002C
_080588B8: .4byte 0x03000030
_080588BC: .4byte 0x030000FC
_080588C0:
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r1, _080588F0 @ =0x030000FC
	adds r0, r0, r1
	movs r1, #0x3c
	strh r1, [r0]
_080588CC:
	ldr r2, _080588F4 @ =gInput
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r4, r2, #0
	cmp r3, #0
	beq _08058900
	ldr r2, _080588F8 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r3, _080588FC @ =0x03000058
	adds r1, r1, r3
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0805890C
	.align 2, 0
_080588F0: .4byte 0x030000FC
_080588F4: .4byte gInput
_080588F8: .4byte gCurTask
_080588FC: .4byte 0x03000058
_08058900:
	ldr r1, _0805892C @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	ldr r5, _08058930 @ =0x03000058
	adds r0, r0, r5
	strh r3, [r0]
_0805890C:
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08058938
	ldr r1, _0805892C @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _08058934 @ =0x0300005C
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _08058944
	.align 2, 0
_0805892C: .4byte gCurTask
_08058930: .4byte 0x03000058
_08058934: .4byte 0x0300005C
_08058938:
	ldr r3, _08058964 @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r5, _08058968 @ =0x0300005C
	adds r0, r0, r5
	strh r1, [r0]
_08058944:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08058970
	ldr r1, _08058964 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0805896C @ =0x03000064
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0805897C
	.align 2, 0
_08058964: .4byte gCurTask
_08058968: .4byte 0x0300005C
_0805896C: .4byte 0x03000064
_08058970:
	ldr r3, _0805899C @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r5, _080589A0 @ =0x03000064
	adds r0, r0, r5
	strh r1, [r0]
_0805897C:
	ldrh r1, [r4]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080589A8
	ldr r1, _0805899C @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _080589A4 @ =0x03000060
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080589B4
	.align 2, 0
_0805899C: .4byte gCurTask
_080589A0: .4byte 0x03000064
_080589A4: .4byte 0x03000060
_080589A8:
	ldr r3, _08058A20 @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r4, _08058A24 @ =0x03000060
	adds r0, r0, r4
	strh r1, [r0]
_080589B4:
	ldr r4, _08058A20 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r6, _08058A28 @ =0x03000024
	adds r0, r1, r6
	ldrh r0, [r0]
	mov sb, r0
	ldr r5, _08058A2C @ =0x03000028
	adds r0, r1, r5
	ldrh r0, [r0]
	mov sl, r0
	ldr r2, _08058A30 @ =0x03000054
	adds r0, r1, r2
	ldrh r0, [r0]
	mov r8, r0
	ldr r0, _08058A34 @ =gPressedKeys
	ldrh r2, [r0]
	movs r5, #0x10
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _080589EC
	ldr r3, _08058A38 @ =0x03000058
	adds r0, r1, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0xf
	ble _08058A3C
_080589EC:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _08058A38 @ =0x03000058
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #5
	strh r0, [r1]
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	adds r1, r1, r6
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	adds r1, r0, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #9
	ble _08058A84
	movs r0, #0
	b _08058A82
	.align 2, 0
_08058A20: .4byte gCurTask
_08058A24: .4byte 0x03000060
_08058A28: .4byte 0x03000024
_08058A2C: .4byte 0x03000028
_08058A30: .4byte 0x03000054
_08058A34: .4byte gPressedKeys
_08058A38: .4byte 0x03000058
_08058A3C:
	movs r5, #0x20
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _08058A52
	ldr r3, _08058B10 @ =0x0300005C
	adds r0, r1, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xf
	ble _08058A86
_08058A52:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r2, _08058B10 @ =0x0300005C
	adds r1, r1, r2
	ldrh r0, [r1]
	subs r0, #5
	strh r0, [r1]
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	adds r1, r1, r6
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	adds r1, r0, r6
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _08058A84
	movs r0, #9
_08058A82:
	strh r0, [r1]
_08058A84:
	orrs r7, r5
_08058A86:
	ldr r0, _08058B14 @ =gPressedKeys
	ldrh r2, [r0]
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08058AA8
	ldr r1, _08058B18 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	ldr r5, _08058B1C @ =0x03000060
	adds r0, r3, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r0, #0xf
	ble _08058B28
_08058AA8:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r3, _08058B18 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r0, _08058B1C @ =0x03000060
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #5
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r4, _08058B20 @ =0x03000028
	adds r1, r1, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r1, r0, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #5
	ble _08058B0A
	movs r0, #5
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r2, _08058B24 @ =0x03000054
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	adds r2, r1, r2
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #2
	ble _08058B0A
	adds r0, r1, r4
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r2, _08058B24 @ =0x03000054
	adds r0, r0, r2
	strh r1, [r0]
_08058B0A:
	movs r0, #0x80
	b _08058BA4
	.align 2, 0
_08058B10: .4byte 0x0300005C
_08058B14: .4byte gPressedKeys
_08058B18: .4byte gCurTask
_08058B1C: .4byte 0x03000060
_08058B20: .4byte 0x03000028
_08058B24: .4byte 0x03000054
_08058B28:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08058B3C
	ldr r5, _08058BEC @ =0x03000064
	adds r0, r3, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xf
	ble _08058BA6
_08058B3C:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r2, _08058BF0 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r3, _08058BEC @ =0x03000064
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #5
	strh r0, [r1]
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	subs r3, #0x3c
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	adds r1, r0, r3
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge _08058BA2
	strh r4, [r1]
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r2, _08058BF4 @ =0x03000054
	adds r1, r1, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, _08058BF0 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	adds r2, r1, r2
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _08058BA2
	adds r1, r1, r3
	movs r0, #5
	strh r0, [r1]
	ldr r5, _08058BF0 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08058BF4 @ =0x03000054
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_08058BA2:
	movs r0, #0x40
_08058BA4:
	orrs r7, r0
_08058BA6:
	ldr r2, _08058BF0 @ =gCurTask
	ldr r3, [r2]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r5, _08058BF8 @ =0x0300002C
	adds r1, r0, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xf
	bgt _08058BFC
	adds r1, r0, #0
	movs r2, #0x10
	subs r1, r2, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r3, #6]
	ldr r3, _08058BF8 @ =0x0300002C
	adds r0, r0, r3
	movs r5, #0
	ldrsh r0, [r0, r5]
	subs r2, r2, r0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	b _08058C26
	.align 2, 0
_08058BEC: .4byte 0x03000064
_08058BF0: .4byte gCurTask
_08058BF4: .4byte 0x03000054
_08058BF8: .4byte 0x0300002C
_08058BFC:
	movs r0, #0
	ldrsh r1, [r1, r0]
	subs r1, #0xf
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r1, #0
	adds r0, r0, r2
	strh r0, [r4]
	ldrh r0, [r3, #6]
	ldr r3, _08058E94 @ =0x0300002C
	adds r0, r0, r3
	movs r5, #0
	ldrsh r1, [r0, r5]
	subs r1, #0xf
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
_08058C26:
	strh r0, [r4, #2]
	ldr r0, _08058E98 @ =gCurTask
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldr r2, _08058E9C @ =0x03000024
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x20
	movs r3, #0
	strh r2, [r4, #0xa]
	ldrh r0, [r1, #6]
	ldr r5, _08058EA0 @ =0x03000028
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x28
	ldrh r0, [r4]
	subs r0, #0xf0
	asrs r0, r0, #7
	subs r2, r2, r0
	strh r2, [r4, #0xa]
	ldrh r0, [r4, #2]
	subs r0, #0xf0
	asrs r0, r0, #7
	subs r1, r1, r0
	strh r1, [r4, #0xc]
	strh r3, [r4, #4]
	movs r0, #2
	strh r0, [r4, #6]
	ldr r0, _08058EA4 @ =gUnknown_08688568
	adds r1, r4, #0
	bl sub_8052D64
	ldr r0, _08058EA8 @ =gPrevInput
	ldrh r0, [r0]
	orrs r0, r7
	movs r1, #0xf9
	ands r0, r1
	mov r7, r8
	lsls r7, r7, #0x10
	str r7, [sp, #0x60]
	cmp r0, #0
	beq _08058D32
	ldr r0, _08058E98 @ =gCurTask
	ldr r0, [r0]
	str r0, [sp, #0x34]
	ldrh r0, [r0, #6]
	ldr r1, _08058EAC @ =0x03000080
	adds r7, r0, r1
	mov r3, sb
	lsls r2, r3, #0x10
	asrs r2, r2, #0xe
	adds r1, r2, #0
	adds r1, #0xa
	mov r4, sl
	lsls r4, r4, #0x10
	asrs r5, r4, #0x10
	ldr r3, [sp, #0x60]
	asrs r0, r3, #0x10
	adds r0, r5, r0
	lsls r4, r0, #7
	str r4, [sp, #0x44]
	adds r1, r1, r4
	ldr r5, _08058EB0 @ =0x000007FF
	ands r1, r5
	str r1, [r7, #4]
	adds r0, r1, #0
	ldr r3, _08058EB4 @ =0x000003FF
	ands r0, r3
	ldr r4, _08058EB8 @ =gUnknown_08685D3C
	adds r0, r0, r4
	str r0, [r7]
	movs r5, #0xc0
	lsls r5, r5, #0x13
	mov sl, r5
	add r1, sl
	ldr r0, _08058EBC @ =gBgCntRegs
	mov sb, r0
	ldrh r4, [r0, #2]
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r0, r3, #0
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r1, #4
	strh r1, [r7, #8]
	ldr r4, _08058EC0 @ =gVramGraphicsCopyQueue
	mov r8, r4
	ldr r1, _08058EC4 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, r8
	str r7, [r0]
	ldrb r0, [r1]
	adds r0, #1
	movs r4, #0x1f
	ands r0, r4
	strb r0, [r1]
	ldr r5, [sp, #0x34]
	ldrh r0, [r5, #6]
	ldr r5, _08058EC8 @ =0x0300008C
	adds r7, r0, r5
	adds r2, #0x4a
	ldr r0, [sp, #0x44]
	adds r2, r2, r0
	ldr r5, _08058EB0 @ =0x000007FF
	ands r2, r5
	str r2, [r7, #4]
	adds r0, r2, #0
	ldr r5, _08058EB4 @ =0x000003FF
	ands r0, r5
	ldr r5, _08058EB8 @ =gUnknown_08685D3C
	adds r0, r0, r5
	str r0, [r7]
	add r2, sl
	mov r5, sb
	ldrh r0, [r5, #2]
	ands r3, r0
	lsls r3, r3, #3
	adds r2, r2, r3
	str r2, [r7, #4]
	movs r0, #4
	strh r0, [r7, #8]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, r8
	str r7, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ands r0, r4
	strb r0, [r1]
_08058D32:
	ldr r1, _08058E98 @ =gCurTask
	ldr r1, [r1]
	mov ip, r1
	ldrh r3, [r1, #6]
	ldr r4, _08058EA0 @ =0x03000028
	adds r2, r3, r4
	ldr r5, _08058ECC @ =0x03000054
	adds r0, r3, r5
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	lsrs r6, r0, #0x10
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #0x12
	ldr r7, _08058E9C @ =0x03000024
	adds r1, r3, r7
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r6, r0, #0x10
	ldr r0, _08058ED0 @ =gPressedKeys
	ldrh r1, [r0]
	cmp r1, #0
	bne _08058E62
	ldr r1, _08058ED4 @ =0x030000F8
	adds r0, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #5
	bgt _08058E62
	adds r4, #0x40
	adds r7, r3, r4
	movs r0, #0xa
	str r0, [r7, #4]
	mov r5, ip
	ldrh r0, [r5, #6]
	subs r1, #0xd4
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #2
	adds r2, #0xa
	str r2, [r7, #4]
	ldrh r0, [r5, #6]
	subs r4, #0x40
	adds r1, r0, r4
	movs r5, #0
	ldrsh r1, [r1, r5]
	ldr r3, _08058ECC @ =0x03000054
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r1, r1, r0
	lsls r1, r1, #7
	adds r2, r2, r1
	ldr r5, _08058EB0 @ =0x000007FF
	ands r2, r5
	str r2, [r7, #4]
	adds r0, r2, #0
	ldr r1, _08058EB4 @ =0x000003FF
	ands r0, r1
	ldr r3, _08058ED8 @ =gUnknown_0868653C
	adds r0, r0, r3
	str r0, [r7]
	movs r4, #0xc0
	lsls r4, r4, #0x13
	mov sl, r4
	add r2, sl
	ldr r5, _08058EBC @ =gBgCntRegs
	mov sb, r5
	ldrh r1, [r5, #2]
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	str r2, [r7, #4]
	movs r0, #4
	strh r0, [r7, #8]
	ldr r1, _08058EC0 @ =gVramGraphicsCopyQueue
	mov r8, r1
	ldr r4, _08058EC4 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r4]
	lsls r0, r0, #2
	add r0, r8
	str r7, [r0]
	ldrb r0, [r4]
	adds r0, #1
	movs r2, #0x1f
	ands r0, r2
	strb r0, [r4]
	mov r5, ip
	ldrh r0, [r5, #6]
	ldr r1, _08058EDC @ =0x03000074
	adds r7, r0, r1
	movs r0, #0x4a
	str r0, [r7, #4]
	ldrh r0, [r5, #6]
	ldr r2, _08058E9C @ =0x03000024
	adds r0, r0, r2
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r1, r1, #2
	adds r1, #0x4a
	str r1, [r7, #4]
	mov r2, ip
	ldrh r0, [r2, #6]
	ldr r5, _08058EA0 @ =0x03000028
	adds r2, r0, r5
	movs r5, #0
	ldrsh r2, [r2, r5]
	ldr r5, _08058ECC @ =0x03000054
	adds r0, r0, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	adds r2, r2, r0
	lsls r2, r2, #7
	adds r1, r1, r2
	ldr r0, _08058EB0 @ =0x000007FF
	ands r1, r0
	str r1, [r7, #4]
	adds r0, r1, #0
	ldr r2, _08058EB4 @ =0x000003FF
	ands r0, r2
	ldr r5, _08058ED8 @ =gUnknown_0868653C
	adds r0, r0, r5
	str r0, [r7]
	add r1, sl
	mov r2, sb
	ldrh r0, [r2, #2]
	ands r3, r0
	lsls r3, r3, #3
	adds r1, r1, r3
	str r1, [r7, #4]
	movs r3, #4
	strh r3, [r7, #8]
	ldrb r0, [r4]
	lsls r0, r0, #2
	add r0, r8
	str r7, [r0]
	ldrb r0, [r4]
	adds r0, #1
	movs r5, #0x1f
	ands r0, r5
	strb r0, [r4]
_08058E62:
	ldr r7, _08058ED0 @ =gPressedKeys
	ldrh r1, [r7]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08058EF8
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08058EE0
	ldr r0, _08058E98 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _08058ED4 @ =0x030000F8
	adds r1, r0, r2
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08058EF8
	subs r0, r2, #1
	b _08058EF6
	.align 2, 0
_08058E94: .4byte 0x0300002C
_08058E98: .4byte gCurTask
_08058E9C: .4byte 0x03000024
_08058EA0: .4byte 0x03000028
_08058EA4: .4byte gUnknown_08688568
_08058EA8: .4byte gPrevInput
_08058EAC: .4byte 0x03000080
_08058EB0: .4byte 0x000007FF
_08058EB4: .4byte 0x000003FF
_08058EB8: .4byte gUnknown_08685D3C
_08058EBC: .4byte gBgCntRegs
_08058EC0: .4byte gVramGraphicsCopyQueue
_08058EC4: .4byte gVramGraphicsCopyQueueIndex
_08058EC8: .4byte 0x0300008C
_08058ECC: .4byte 0x03000054
_08058ED0: .4byte gPressedKeys
_08058ED4: .4byte 0x030000F8
_08058ED8: .4byte gUnknown_0868653C
_08058EDC: .4byte 0x03000074
_08058EE0:
	ldr r0, _08058F50 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r4, _08058F54 @ =0x030000F8
	adds r1, r0, r4
	ldrh r2, [r1]
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #4
	bgt _08058EF8
	adds r0, r2, #1
_08058EF6:
	strh r0, [r1]
_08058EF8:
	ldr r7, _08058F58 @ =gPressedKeys
	ldrh r1, [r7]
	movs r0, #1
	ands r0, r1
	add r2, sp, #0x2c
	mov r8, r2
	movs r3, #0x2b
	add r3, sp
	mov sb, r3
	add r4, sp, #0x28
	mov sl, r4
	mov r5, sp
	adds r5, #0x29
	str r5, [sp, #0x58]
	mov r7, sp
	adds r7, #0x2a
	str r7, [sp, #0x5c]
	cmp r0, #0
	bne _08058F20
	b _0805905C
_08058F20:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08058F2A
	b _0805905C
_08058F2A:
	movs r0, #0x93
	lsls r0, r0, #1
	cmp r6, r0
	bne _08058F5C
	ldr r0, _08058F50 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _08058F54 @ =0x030000F8
	adds r1, r0, r2
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08058F48
	b _08059056
_08058F48:
	subs r0, r2, #1
	strh r0, [r1]
	b _08059056
	.align 2, 0
_08058F50: .4byte gCurTask
_08058F54: .4byte 0x030000F8
_08058F58: .4byte gPressedKeys
_08058F5C:
	movs r0, #0x94
	lsls r0, r0, #1
	cmp r6, r0
	bne _08058F88
	ldr r0, _08058F80 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r4, _08058F84 @ =0x030000F8
	adds r1, r0, r4
	ldrh r2, [r1]
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #5
	bgt _08059056
	adds r0, r2, #1
	strh r0, [r1]
	b _08059056
	.align 2, 0
_08058F80: .4byte gCurTask
_08058F84: .4byte 0x030000F8
_08058F88:
	movs r0, #0x95
	lsls r0, r0, #1
	cmp r6, r0
	bne _08058FFC
	movs r1, #0
	movs r6, #0
	ldr r7, _08058FE4 @ =gCurTask
	ldr r0, [r7]
	ldrh r2, [r0, #6]
	ldr r5, _08058FE8 @ =0x030000C8
	ldr r4, _08058FEC @ =0xFFFFF000
	ldr r3, _08058FF0 @ =0x000010DB
_08058FA0:
	lsls r0, r6, #2
	adds r0, r0, r2
	adds r0, r0, r5
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r0, r0, r4
	cmp r0, r3
	beq _08058FB4
	movs r0, #1
	orrs r1, r0
_08058FB4:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _08058FA0
	cmp r1, #0
	beq _08059056
	movs r1, #0
	ldr r0, [sp, #0x30]
	strh r1, [r0, #6]
	movs r0, #1
	ldr r2, [sp, #0x30]
	strh r0, [r2, #4]
	ldr r3, _08058FE4 @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r4, _08058FF4 @ =0x030000FC
	adds r0, r0, r4
	strh r1, [r0]
	ldr r1, [r3]
	ldr r0, _08058FF8 @ =Task_80595DC
	str r0, [r1, #8]
	b _08059056
	.align 2, 0
_08058FE4: .4byte gCurTask
_08058FE8: .4byte 0x030000C8
_08058FEC: .4byte 0xFFFFF000
_08058FF0: .4byte 0x000010DB
_08058FF4: .4byte 0x030000FC
_08058FF8: .4byte Task_80595DC
_08058FFC:
	ldr r3, _080590B4 @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r5, _080590B8 @ =0x030000F8
	adds r1, r0, r5
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, #5
	bgt _08059056
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	lsls r2, r2, #2
	adds r0, r2, r0
	ldr r1, _080590BC @ =0x030000C8
	adds r0, r0, r1
	ldr r4, _080590C0 @ =0x00002001
	adds r1, r6, r4
	strh r1, [r0]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r0, r2, r0
	subs r5, #0x2e
	adds r0, r0, r5
	ldr r7, _080590C4 @ =0x00002002
	adds r1, r6, r7
	strh r1, [r0]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r0, r2, r0
	ldr r1, _080590C8 @ =0x030000E0
	adds r0, r0, r1
	adds r4, #0x14
	adds r1, r6, r4
	strh r1, [r0]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r2, r2, r0
	adds r5, #0x18
	adds r2, r2, r5
	adds r7, #0x14
	adds r0, r6, r7
	strh r0, [r2]
_08059056:
	movs r0, #0x6a
	bl m4aSongNumStart
_0805905C:
	ldr r1, _080590CC @ =gPressedKeys
	ldrh r2, [r1]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _08059082
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080590F2
	ldr r0, _080590B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _080590B8 @ =0x030000F8
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #6
	bne _080590F2
_08059082:
	ldr r3, _080590B4 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r4, _080590D0 @ =0x03000054
	adds r2, r1, r4
	ldrh r0, [r2]
	movs r6, #7
	ands r6, r0
	cmp r6, #1
	bhi _080590DC
	movs r0, #2
	strh r0, [r2]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r5, _080590D4 @ =0x03000024
	adds r0, r0, r5
	movs r1, #9
	strh r1, [r0]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	ldr r7, _080590D8 @ =0x03000028
	adds r0, r0, r7
	movs r1, #5
	strh r1, [r0]
	b _080590F2
	.align 2, 0
_080590B4: .4byte gCurTask
_080590B8: .4byte 0x030000F8
_080590BC: .4byte 0x030000C8
_080590C0: .4byte 0x00002001
_080590C4: .4byte 0x00002002
_080590C8: .4byte 0x030000E0
_080590CC: .4byte gPressedKeys
_080590D0: .4byte 0x03000054
_080590D4: .4byte 0x03000024
_080590D8: .4byte 0x03000028
_080590DC:
	ldr r0, _080591E8 @ =0x03000024
	adds r1, r1, r0
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r2, _080591EC @ =0x03000028
	adds r1, r1, r2
	movs r0, #7
	subs r0, r0, r6
	strh r0, [r1]
_080590F2:
	ldr r3, _080591F0 @ =gPressedKeys
	ldrh r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _080591C8
	ldr r1, _080591F4 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	ldr r4, _080591F8 @ =0x030000F8
	adds r3, r0, r4
	ldrh r4, [r3]
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, #0
	ble _080591C8
	subs r0, r4, #1
	strh r0, [r3]
	adds r7, r1, #0
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	ldr r1, _080591F8 @ =0x030000F8
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r6, #4
	bhi _0805917C
	adds r3, r7, #0
_08059128:
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	lsls r1, r6, #2
	adds r0, r1, r0
	ldr r4, _080591FC @ =0x030000C8
	adds r2, r0, r4
	ldr r5, _08059200 @ =0x030000CC
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r0, r1, r0
	ldr r7, _08059204 @ =0x030000CA
	adds r2, r0, r7
	adds r4, #6
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r0, r1, r0
	adds r5, #0x14
	adds r2, r0, r5
	adds r7, #0x1a
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	adds r1, r1, r0
	ldr r0, _08059208 @ =0x030000E2
	adds r2, r1, r0
	adds r4, #0x18
	adds r1, r1, r4
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _08059128
_0805917C:
	ldr r5, _080591F4 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	lsls r2, r6, #2
	adds r0, r2, r0
	ldr r7, _080591FC @ =0x030000C8
	adds r0, r0, r7
	ldr r3, _0805920C @ =0x000020DB
	adds r1, r3, #0
	strh r1, [r0]
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	adds r0, r2, r0
	ldr r4, _08059204 @ =0x030000CA
	adds r0, r0, r4
	ldr r5, _08059210 @ =0x000020DC
	adds r1, r5, #0
	strh r1, [r0]
	ldr r7, _080591F4 @ =gCurTask
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	adds r0, r2, r0
	ldr r1, _08059214 @ =0x030000E0
	adds r0, r0, r1
	adds r3, #0x14
	adds r1, r3, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	adds r2, r2, r0
	adds r4, #0x18
	adds r2, r2, r4
	adds r5, #0x14
	adds r0, r5, #0
	strh r0, [r2]
	movs r0, #0x6b
	bl m4aSongNumStart
_080591C8:
	bl UiGfxStackInit
	ldr r0, _080591F4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r7, _08059218 @ =0x03000030
	adds r1, r0, r7
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x16
	bgt _0805921C
	adds r1, r0, #0
	movs r0, #0x17
	subs r0, r0, r1
	b _08059222
	.align 2, 0
_080591E8: .4byte 0x03000024
_080591EC: .4byte 0x03000028
_080591F0: .4byte gPressedKeys
_080591F4: .4byte gCurTask
_080591F8: .4byte 0x030000F8
_080591FC: .4byte 0x030000C8
_08059200: .4byte 0x030000CC
_08059204: .4byte 0x030000CA
_08059208: .4byte 0x030000E2
_0805920C: .4byte 0x000020DB
_08059210: .4byte 0x000020DC
_08059214: .4byte 0x030000E0
_08059218: .4byte 0x03000030
_0805921C:
	movs r4, #0
	ldrsh r0, [r1, r4]
	subs r0, #0x17
_08059222:
	lsls r0, r0, #5
	movs r1, #0x17
	bl __divsi3
	adds r7, r0, #0
	ldr r4, _080593B8 @ =gSineTable
	lsls r0, r7, #5
	movs r1, #0x3c
	bl __udivsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	movs r1, #0x1f
	subs r7, r1, r0
	cmp r7, #0x1f
	bls _0805924A
	movs r7, #0x1f
_0805924A:
	movs r6, #0
_0805924C:
	lsls r5, r6, #1
	str r5, [sp, #0x48]
	ldr r1, _080593BC @ =gUiGraphics + ((37 * 0x1C) + 0x4)
	ldr r0, [r1]
	adds r0, r0, r5
	ldrh r0, [r0]
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #0xa
	muls r0, r7, r0
	movs r1, #0x20
	bl Div
	adds r4, r0, #0
	ldr r3, _080593BC @ =gUiGraphics + ((37 * 0x1C) + 0x4)
	ldr r0, [r3]
	adds r0, r0, r5
	ldrh r0, [r0]
	movs r5, #0xf8
	lsls r5, r5, #2
	adds r1, r5, #0
	ands r0, r1
	lsrs r0, r0, #5
	muls r0, r7, r0
	movs r1, #0x20
	bl Div
	adds r5, r0, #0
	ldr r1, _080593BC @ =gUiGraphics + ((37 * 0x1C) + 0x4)
	ldr r0, [r1]
	ldr r2, [sp, #0x48]
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	muls r0, r7, r0
	movs r1, #0x20
	bl Div
	ldr r3, _080593C0 @ =gCurTask
	ldr r1, [r3]
	ldrh r1, [r1, #6]
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	ldr r3, _080593C4 @ =0x03000034
	adds r3, r1, r3
	lsls r4, r4, #0xa
	lsls r5, r5, #5
	adds r4, r4, r5
	adds r4, r4, r0
	strh r4, [r3]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xf
	bls _0805924C
	movs r0, #0x25
	mov r4, r8
	strb r0, [r4]
	movs r1, #1
	mov r5, sb
	strb r1, [r5]
	ldr r7, _080593C0 @ =gCurTask
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	ldr r2, _080593C4 @ =0x03000034
	adds r0, r0, r2
	str r0, [sp, #0x20]
	movs r0, #0x20
	str r0, [sp, #0x24]
	mov r3, sl
	strb r1, [r3]
	ldr r4, [sp, #0x58]
	strb r1, [r4]
	movs r0, #4
	ldr r5, [sp, #0x5c]
	strb r0, [r5]
	ldr r3, _080593C8 @ =gUiGraphics
	mov r7, r8
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r2, sp
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	mov r0, sp
	bl sub_80528AC
	ldr r0, _080593C0 @ =gCurTask
	ldr r5, [r0]
	ldrh r3, [r5, #6]
	ldr r1, _080593CC @ =0x030000F8
	adds r0, r3, r1
	ldrh r7, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #5
	bgt _080593F2
	ldr r4, _080593D0 @ =0x03000028
	adds r2, r3, r4
	subs r1, #0xa4
	adds r0, r3, r1
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	lsrs r6, r0, #0x10
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #0x12
	ldr r2, _080593D4 @ =0x03000024
	adds r1, r3, r2
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x11
	movs r1, #0x95
	lsls r1, r1, #0x11
	cmp r0, r1
	beq _080593F2
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	lsls r0, r7, #4
	adds r0, #0x78
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #6]
	ldr r3, _080593D8 @ =0x0300002C
	adds r1, r0, r3
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0x10
	ble _080593DC
	movs r1, #0x10
	subs r1, r1, r0
	b _080593E2
	.align 2, 0
_080593B8: .4byte gSineTable
_080593BC: .4byte gUiGraphics + ((37 * 0x1C) + 0x4)
_080593C0: .4byte gCurTask
_080593C4: .4byte 0x03000034
_080593C8: .4byte gUiGraphics
_080593CC: .4byte 0x030000F8
_080593D0: .4byte 0x03000028
_080593D4: .4byte 0x03000024
_080593D8: .4byte 0x0300002C
_080593DC:
	movs r0, #0
	ldrsh r1, [r1, r0]
	subs r1, #0x10
_080593E2:
	asrs r1, r1, #2
	movs r0, #0xd
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	ldr r0, _08059520 @ =gUnknown_0868856C
	adds r1, r4, #0
	bl sub_805321C
_080593F2:
	ldr r1, _08059524 @ =gCurTask
	ldr r2, [r1]
	mov sl, r2
	ldrh r0, [r2, #6]
	ldr r3, _08059528 @ =0x03000098
	adds r7, r0, r3
	ldr r4, _0805952C @ =0x030000C8
	adds r0, r0, r4
	str r0, [r7]
	movs r0, #0x1e
	str r0, [r7, #4]
	ldrh r0, [r2, #6]
	subs r4, #0x74
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	subs r1, #2
	lsls r1, r1, #7
	adds r1, #0x1e
	ldr r0, _08059530 @ =0x000007FF
	ands r1, r0
	str r1, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	mov r8, r2
	add r1, r8
	ldr r3, _08059534 @ =gBgCntRegs
	ldrh r2, [r3, #2]
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r5, #0x18
	strh r5, [r7, #8]
	ldr r0, _08059538 @ =gVramGraphicsCopyQueue
	mov ip, r0
	ldr r3, _0805953C @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, ip
	str r7, [r0]
	ldrb r0, [r3]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r3]
	mov r2, sl
	ldrh r0, [r2, #6]
	ldr r5, _08059540 @ =0x030000A4
	adds r7, r0, r5
	ldr r1, _08059544 @ =0x030000E0
	adds r0, r0, r1
	str r0, [r7]
	movs r0, #0x5e
	str r0, [r7, #4]
	ldrh r0, [r2, #6]
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r1, #2
	lsls r1, r1, #7
	adds r1, #0x5e
	ldr r5, _08059530 @ =0x000007FF
	ands r1, r5
	str r1, [r7, #4]
	add r1, r8
	ldr r0, _08059534 @ =gBgCntRegs
	ldrh r2, [r0, #2]
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r1, #0x18
	strh r1, [r7, #8]
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, ip
	str r7, [r0]
	ldrb r0, [r3]
	adds r0, #1
	movs r2, #0x1f
	ands r0, r2
	strb r0, [r3]
	mov r5, sl
	ldrh r2, [r5, #6]
	adds r4, r2, r4
	ldr r7, [sp, #0x60]
	asrs r1, r7, #0x10
	movs r5, #0
	ldrsh r0, [r4, r5]
	ldr r7, _08059534 @ =gBgCntRegs
	mov r8, r7
	mov sb, ip
	adds r5, r3, #0
	cmp r1, r0
	beq _0805959E
	ldr r0, _08059548 @ =0x030000B0
	adds r7, r2, r0
	adds r0, r1, #6
	lsls r6, r0, #7
	adds r0, r6, #0
	ldr r2, _08059530 @ =0x000007FF
	ands r0, r2
	ldr r3, _0805954C @ =gUnknown_08685D3C + 0x1E
	adds r0, r0, r3
	str r0, [r7]
	subs r0, r1, #2
	lsls r4, r0, #7
	adds r1, r4, #0
	adds r1, #0x1e
	ands r1, r2
	str r1, [r7, #4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	mov r0, r8
	ldrh r2, [r0, #2]
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r1, #0x18
	strh r1, [r7, #8]
	ldrb r0, [r5]
	lsls r0, r0, #2
	add r0, sb
	str r7, [r0]
	ldrb r0, [r5]
	adds r0, #1
	movs r2, #0x1f
	ands r0, r2
	strb r0, [r5]
	mov r7, sl
	ldrh r0, [r7, #6]
	ldr r1, _08059550 @ =0x030000BC
	adds r7, r0, r1
	ldr r2, _08059554 @ =0x03000028
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08059558
	adds r0, r4, #0
	b _0805955A
	.align 2, 0
_08059520: .4byte gUnknown_0868856C
_08059524: .4byte gCurTask
_08059528: .4byte 0x03000098
_0805952C: .4byte 0x030000C8
_08059530: .4byte 0x000007FF
_08059534: .4byte gBgCntRegs
_08059538: .4byte gVramGraphicsCopyQueue
_0805953C: .4byte gVramGraphicsCopyQueueIndex
_08059540: .4byte 0x030000A4
_08059544: .4byte 0x030000E0
_08059548: .4byte 0x030000B0
_0805954C: .4byte gUnknown_08685D3C + 0x1E
_08059550: .4byte 0x030000BC
_08059554: .4byte 0x03000028
_08059558:
	adds r0, r6, #0
_0805955A:
	adds r0, #0x40
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, _080595C8 @ =0x000007FF
	ands r0, r2
	adds r0, r0, r3
	str r0, [r7]
	ldr r3, [sp, #0x60]
	asrs r1, r3, #9
	subs r1, #0xa2
	ands r1, r2
	str r1, [r7, #4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	mov r4, r8
	ldrh r2, [r4, #2]
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r0, #0x18
	strh r0, [r7, #8]
	ldrb r0, [r5]
	lsls r0, r0, #2
	add r0, sb
	str r7, [r0]
	ldrb r0, [r5]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r5]
_0805959E:
	ldr r2, _080595CC @ =gBgScrollRegs
	ldr r5, _080595D0 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r7, _080595D4 @ =0x03000054
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x30
	ldr r3, _080595D8 @ =0x000001FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2, #6]
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080595C8: .4byte 0x000007FF
_080595CC: .4byte gBgScrollRegs
_080595D0: .4byte gCurTask
_080595D4: .4byte 0x03000054
_080595D8: .4byte 0x000001FF

.syntax divided
