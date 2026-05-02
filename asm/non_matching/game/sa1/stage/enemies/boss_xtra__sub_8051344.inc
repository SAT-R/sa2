.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08051460 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, _08051464 @ =gExtraBossTaskData
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _08051468 @ =0x03000018
	adds r6, r4, r0
	ldr r1, _0805146C @ =0x0300000C
	adds r1, r1, r4
	mov sb, r1
	ldr r5, _08051470 @ =gSineTable
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
	ldr r2, _08051474 @ =0x03000076
	adds r1, r4, r2
	mov r3, r8
	ldrh r0, [r3]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08051478 @ =0x03000070
	adds r4, r4, r1
	strh r0, [r4]
	ldr r2, [r7, #0x50]
	asrs r2, r2, #8
	ldr r3, _0805147C @ =gCamera
	movs r4, #0
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, [r7, #0x54]
	asrs r0, r0, #8
	movs r4, #2
	ldrsh r1, [r3, r4]
	subs r0, r0, r1
	mov r1, sb
	strh r2, [r1, #6]
	strh r0, [r1, #8]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08051480 @ =gOamMatrixIndex
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
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	bls _08051456
	b _080515E4
_08051456:
	lsls r0, r0, #2
	ldr r1, _08051484 @ =_08051488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051460: .4byte gCurTask
_08051464: .4byte gExtraBossTaskData
_08051468: .4byte 0x03000018
_0805146C: .4byte 0x0300000C
_08051470: .4byte gSineTable
_08051474: .4byte 0x03000076
_08051478: .4byte 0x03000070
_0805147C: .4byte gCamera
_08051480: .4byte gOamMatrixIndex
_08051484: .4byte _08051488
_08051488: @ jump table
	.4byte _080514BC @ case 0
	.4byte _080514CC @ case 1
	.4byte _080514F6 @ case 2
	.4byte _08051518 @ case 3
	.4byte _08051538 @ case 4
	.4byte _08051558 @ case 5
	.4byte _08051578 @ case 6
	.4byte _0805158A @ case 7
	.4byte _080515E4 @ case 8
	.4byte _080515E4 @ case 9
	.4byte _080515E4 @ case 10
	.4byte _080515C0 @ case 11
	.4byte _080515D2 @ case 12
_080514BC:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
	b _080515F2
_080514CC:
	ldr r1, _080514E8 @ =gUnknown_084AE560
	movs r2, #0
	ldrsh r0, [r7, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080514EC
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xc0
	lsls r1, r1, #7
	b _08051580
	.align 2, 0
_080514E8: .4byte gUnknown_084AE560
_080514EC:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xd0
	lsls r1, r1, #7
	b _08051580
_080514F6:
	ldr r1, _08051514 @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080515F2
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xc0
	lsls r1, r1, #7
	b _080515DA
	.align 2, 0
_08051514: .4byte gUnknown_084AE560
_08051518:
	ldr r1, _08051534 @ =gUnknown_084AE560
	movs r4, #0
	ldrsh r0, [r7, r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080515F2
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #5
	b _080515C8
	.align 2, 0
_08051534: .4byte gUnknown_084AE560
_08051538:
	ldr r1, _08051554 @ =gUnknown_084AE560
	movs r2, #0
	ldrsh r0, [r7, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080515F2
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xc0
	lsls r1, r1, #7
	b _080515DA
	.align 2, 0
_08051554: .4byte gUnknown_084AE560
_08051558:
	ldr r1, _08051574 @ =gUnknown_084AE560
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080515F2
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #5
	b _080515C8
	.align 2, 0
_08051574: .4byte gUnknown_084AE560
_08051578:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #7
_08051580:
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_804CFE0
	b _080515F2
_0805158A:
	movs r1, #0x80
	lsls r1, r1, #7
	ldr r3, _080515B4 @ =gPseudoRandom
	ldr r2, [r3]
	ldr r0, _080515B8 @ =0x00196225
	muls r0, r2, r0
	ldr r4, _080515BC @ =0x3C6EF35F
	adds r0, r0, r4
	str r0, [r3]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_804CFE0
	b _080515F2
	.align 2, 0
_080515B4: .4byte gPseudoRandom
_080515B8: .4byte 0x00196225
_080515BC: .4byte 0x3C6EF35F
_080515C0:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #6
_080515C8:
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_804CFE0
	b _080515F2
_080515D2:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #5
_080515DA:
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	b _080515F2
_080515E4:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
_080515F2:
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
