.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _0803247C @ =gCurTask
	ldr r0, [r1]
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r6, r1
	ldr r2, _08032480 @ =0x0300000C
	adds r2, r2, r6
	mov r8, r2
	ldr r3, _08032484 @ =0x03000044
	adds r3, r3, r6
	mov sl, r3
	ldr r4, [r5]
	mov ip, r4
	ldr r0, [r5, #0x74]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp]
	ldr r0, _08032488 @ =0x030000A2
	adds r1, r6, r0
	ldr r2, _0803248C @ =0x030000A4
	adds r0, r6, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	ldr r4, _08032490 @ =0x030000A0
	adds r2, r6, r4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2]
	subs r1, r1, r0
	ldr r0, _08032494 @ =0x000003FF
	ands r1, r0
	strh r1, [r2]
	ldr r1, _08032498 @ =gSineTable
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r7, [r0, r4]
	lsls r0, r7, #4
	subs r0, r0, r7
	asrs r7, r0, #0xb
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r5, #0x78]
	asrs r0, r0, #8
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	cmp r3, #0
	bge _080323FE
	adds r1, #0x1f
_080323FE:
	asrs r1, r1, #5
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #5
	subs r1, r3, r1
	ldr r3, _0803249C @ =gUnknown_03005870
	lsls r2, r4, #1
	adds r2, r2, r3
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r4, #0
	ldrsh r3, [r2, r4]
	subs r0, r0, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0803242A
	adds r0, #0x1f
_0803242A:
	asrs r2, r0, #5
	adds r2, r3, r2
	lsls r2, r2, #0x10
	mov r0, ip
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r5, #0x7c]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsrs r3, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r1
	ldr r1, _080324A0 @ =0x03000090
	adds r0, r6, r1
	strh r7, [r0]
	ldr r4, _080324A4 @ =0x03000092
	adds r0, r6, r4
	strh r3, [r0]
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sb, r2
	adds r0, r4, #0
	mov r1, sb
	bl sub_8031D88
	ldr r2, _080324A8 @ =0x0300009A
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _080324AC
	bl sub_80327C4
	b _080327B0
	.align 2, 0
_0803247C: .4byte gCurTask
_08032480: .4byte 0x0300000C
_08032484: .4byte 0x03000044
_08032488: .4byte 0x030000A2
_0803248C: .4byte 0x030000A4
_08032490: .4byte 0x030000A0
_08032494: .4byte 0x000003FF
_08032498: .4byte gSineTable
_0803249C: .4byte gUnknown_03005870
_080324A0: .4byte 0x03000090
_080324A4: .4byte 0x03000092
_080324A8: .4byte 0x0300009A
_080324AC:
	ldr r3, _08032510 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r0, _08032514 @ =0x0300000C
	adds r1, r1, r0
	ldr r2, _08032518 @ =gCamera
	ldrh r0, [r2]
	subs r0, r4, r0
	strh r0, [r1, #0x16]
	ldrh r0, [r2, #2]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r1, #0x18]
	bl sub_8031F74
	mov r0, r8
	bl UpdateSpriteAnimation
	ldr r3, _0803251C @ =0x030000AA
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080324E0
	mov r0, sl
	bl UpdateSpriteAnimation
_080324E0:
	ldr r4, _08032510 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r1, _08032514 @ =0x0300000C
	adds r2, r0, r1
	ldr r3, _08032520 @ =0x03000044
	adds r0, r0, r3
	ldrh r1, [r2, #0x16]
	strh r1, [r0, #0x16]
	ldrh r1, [r2, #0x18]
	strh r1, [r0, #0x18]
	bl sub_8031ED0
	ldr r4, _08032524 @ =0x030000A9
	adds r0, r6, r4
	ldrb r0, [r0]
	cmp r0, #5
	bls _08032506
	b _080327B0
_08032506:
	lsls r0, r0, #2
	ldr r1, _08032528 @ =_0803252C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08032510: .4byte gCurTask
_08032514: .4byte 0x0300000C
_08032518: .4byte gCamera
_0803251C: .4byte 0x030000AA
_08032520: .4byte 0x03000044
_08032524: .4byte 0x030000A9
_08032528: .4byte _0803252C
_0803252C: @ jump table
	.4byte _08032544 @ case 0
	.4byte _080325CC @ case 1
	.4byte _08032670 @ case 2
	.4byte _080326CE @ case 3
	.4byte _0803274C @ case 4
	.4byte _08032790 @ case 5
_08032544:
	adds r6, r5, #0
	adds r6, #0xa2
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _080325C8 @ =0x000001FF
	cmp r1, r0
	bgt _08032560
	movs r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r6]
	adds r1, r5, #0
	adds r1, #0xa4
	strh r0, [r1]
_08032560:
	adds r0, r7, #0
	adds r0, #0x90
	cmp r0, #0
	bge _0803256A
	adds r0, #0x1f
_0803256A:
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08032576
	b _080327B0
_08032576:
	cmp r4, #8
	bne _0803257C
	b _080327B0
_0803257C:
	ldr r0, [sp]
	adds r0, #0x55
	ldrb r2, [r0]
	adds r0, r2, #0
	cmp r0, #0
	bne _0803258A
	b _080327B0
_0803258A:
	cmp r0, #8
	bne _08032590
	b _080327B0
_08032590:
	subs r0, r2, #2
	lsls r1, r4, #0x18
	lsls r0, r0, #0x18
	asrs r3, r1, #0x18
	cmp r1, r0
	bge _0803259E
	b _080327B0
_0803259E:
	adds r0, r2, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	ble _080325AA
	b _080327B0
_080325AA:
	ldr r0, [sp]
	adds r0, #0x57
	ldrb r0, [r0]
	cmp r0, #0
	bne _080325B6
	b _080327B0
_080325B6:
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
	adds r0, r5, #0
	adds r0, #0xa4
	strh r1, [r0]
	b _08032740
	.align 2, 0
_080325C8: .4byte 0x000001FF
_080325CC:
	mov r3, r8
	adds r3, #0x20
	ldrb r0, [r3]
	cmp r0, #1
	beq _080325FC
	ldr r0, [sp]
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _080325E4
	b _080327B0
_080325E4:
	movs r0, #1
	strb r0, [r3]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0xaa
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	b _080327B0
_080325FC:
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0803260C
	b _080327B0
_0803260C:
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x20
	strb r2, [r0]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xaa
	strb r2, [r0]
	ldr r3, _0803265C @ =gUnknown_084ACF08
	ldr r2, _08032660 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08032664 @ =0x00196225
	muls r0, r1, r0
	ldr r4, _08032668 @ =0x3C6EF35F
	adds r0, r0, r4
	str r0, [r2]
	ldr r1, _0803266C @ =gStageTime
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x98
	strh r1, [r0]
	adds r0, #2
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x9b
	strb r0, [r1]
	adds r1, #0xe
	b _08032744
	.align 2, 0
_0803265C: .4byte gUnknown_084ACF08
_08032660: .4byte gPseudoRandom
_08032664: .4byte 0x00196225
_08032668: .4byte 0x3C6EF35F
_0803266C: .4byte gStageTime
_08032670:
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080326A0
	cmp r0, #0x10
	ble _08032684
	b _080327B0
_08032684:
	mov r1, r8
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0xaa
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	subs r1, #1
	b _08032744
_080326A0:
	adds r1, r5, #0
	adds r1, #0x98
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080326B2
	b _080327B0
_080326B2:
	mov r1, r8
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0xaa
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	subs r1, #1
	b _08032744
_080326CE:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080327B0
	mov r0, r8
	adds r0, #0x20
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	mov r0, sl
	adds r0, #0x20
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xaa
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0xa4
	movs r0, #0x40
	strh r0, [r1]
	ldr r1, _0803273C @ =gUnknown_084ACEE4
	adds r2, r5, #0
	adds r2, #0x9a
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0xa6
	strh r0, [r1]
	subs r1, #0xe
	movs r0, #0x78
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x9b
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08032740
	adds r1, r5, #0
	adds r1, #0xa9
	ldrb r0, [r1]
	adds r0, #2
	strb r0, [r1]
	b _080327B0
	.align 2, 0
_0803273C: .4byte gUnknown_084ACEE4
_08032740:
	adds r1, r5, #0
	adds r1, #0xa9
_08032744:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080327B0
_0803274C:
	adds r2, r5, #0
	adds r2, #0xa2
	adds r0, r5, #0
	adds r0, #0xa6
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldrh r3, [r0]
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	blt _0803276C
	movs r1, #0
	strh r3, [r2]
	adds r0, r5, #0
	adds r0, #0xa4
	strh r1, [r0]
_0803276C:
	adds r1, r5, #0
	adds r1, #0x98
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080327B0
	adds r1, #0xc
	ldr r0, _0803278C @ =0x0000FFC0
	strh r0, [r1]
	adds r1, #5
	movs r0, #0
	strb r0, [r1]
	b _080327B0
	.align 2, 0
_0803278C: .4byte 0x0000FFC0
_08032790:
	adds r3, r5, #0
	adds r3, #0xa2
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _080327C0 @ =0x000001FF
	cmp r1, r0
	ble _080327B0
	movs r2, #0
	movs r1, #0
	adds r0, #1
	strh r0, [r3]
	adds r0, r5, #0
	adds r0, #0xa4
	strh r1, [r0]
	adds r0, #5
	strb r2, [r0]
_080327B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080327C0: .4byte 0x000001FF

.syntax divided
