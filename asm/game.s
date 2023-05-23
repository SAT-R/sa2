.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D650C
gUnknown_080D650C:
    .incbin "baserom.gba", 0x000D650C, 0x110

    .global gUnknown_080D661C
gUnknown_080D661C:
    .incbin "baserom.gba", 0x000D661C, 0x110

    .global gPlayerCharacterIdleAnims
gPlayerCharacterIdleAnims: @ 0x080D672C
    .2byte 0, 91, 182, 273, 364

    .global gUnknown_080D6736
gUnknown_080D6736:
    .incbin "baserom.gba", 0x000D6736, 0x1CC

.text
.syntax unified
.arm

	thumb_func_start sub_801D24C
sub_801D24C: @ 0x0801D24C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r4, _0801D374 @ =gFlags
	ldr r0, [r4]
	movs r3, #4
	orrs r0, r3
	str r0, [r4]
	ldr r2, _0801D378 @ =gUnknown_03002878
	ldr r0, _0801D37C @ =0x04000010
	str r0, [r2]
	ldr r0, _0801D380 @ =gUnknown_03002A80
	strb r3, [r0]
	ldr r2, _0801D384 @ =gWinRegs
	movs r0, #0
	mov sl, r0
	movs r0, #0x3f
	strh r0, [r2, #0xa]
	ldr r3, _0801D388 @ =gBldRegs
	mov r8, r3
	ldr r0, _0801D38C @ =0x00003F41
	strh r0, [r3]
	movs r0, #0x81
	lsls r0, r0, #4
	strh r0, [r3, #2]
	movs r0, #0xa0
	strh r0, [r2, #4]
	ldr r0, _0801D390 @ =gUnknown_03001884
	ldr r3, [r0]
	ldr r0, _0801D394 @ =gUnknown_03005590
	ldr r0, [r0]
	ldr r5, _0801D398 @ =0x000003FF
	mov ip, r5
	adds r5, r0, #0
	mov r6, ip
	ands r5, r6
	lsrs r7, r0, #1
	ands r7, r6
	lsls r2, r1, #0x10
	asrs r1, r2, #0xf
	asrs r0, r2, #0x11
	adds r1, r1, r0
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0801D2C2
	movs r6, #0x9f
_0801D2C2:
	mov r0, sb
	cmp r0, #0
	bne _0801D2CA
	b _0801D3D6
_0801D2CA:
	asrs r0, r2, #0x14
	movs r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #8
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	movs r4, #0
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	mov sl, r0
	cmp r4, r1
	bge _0801D312
	movs r2, #0
	mov sb, r2
	movs r6, #0xf
	rsbs r6, r6, #0
	mov r8, r6
	movs r6, #0xff
	adds r2, r1, #0
_0801D2F2:
	mov r0, sb
	strh r0, [r3]
	adds r3, #2
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	subs r0, r4, r1
	ands r0, r6
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r2
	blt _0801D2F2
_0801D312:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D31C
	b _0801D498
_0801D31C:
	ldr r6, _0801D39C @ =gSineTable
	mov ip, r6
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0801D398 @ =0x000003FF
	mov sb, r0
	movs r2, #0xff
	mov r8, r2
	mov r6, sl
	asrs r5, r6, #0x10
_0801D332:
	asrs r1, r1, #0x10
	lsls r0, r1, #4
	adds r0, r0, r7
	ldr r2, [sp, #4]
	adds r0, r0, r2
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	lsls r2, r1, #1
	subs r0, r0, r2
	mov r6, r8
	ands r0, r6
	strh r0, [r3]
	adds r3, #2
	adds r0, r1, #0
	subs r0, #0xf
	cmp r0, r5
	bge _0801D3A0
	movs r0, #1
	subs r0, r0, r1
	subs r1, r1, r5
	subs r1, #0xf
	lsls r1, r1, #3
	subs r0, r0, r1
	movs r1, #0xfe
	ands r0, r1
	b _0801D3BE
	.align 2, 0
_0801D374: .4byte gFlags
_0801D378: .4byte gUnknown_03002878
_0801D37C: .4byte 0x04000010
_0801D380: .4byte gUnknown_03002A80
_0801D384: .4byte gWinRegs
_0801D388: .4byte gBldRegs
_0801D38C: .4byte 0x00003F41
_0801D390: .4byte gUnknown_03001884
_0801D394: .4byte gUnknown_03005590
_0801D398: .4byte 0x000003FF
_0801D39C: .4byte gSineTable
_0801D3A0:
	lsls r0, r1, #2
	adds r0, r7, r0
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	subs r0, r0, r2
	ldr r2, [sp, #4]
	adds r0, r2, r0
	mov r6, r8
	ands r0, r6
_0801D3BE:
	strh r0, [r3]
	adds r3, #2
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D332
	b _0801D498
_0801D3D6:
	asrs r0, r2, #0x15
	movs r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #8
	orrs r0, r1
	mov r2, r8
	strh r0, [r2, #2]
	lsls r6, r6, #0x10
	movs r4, #0
	mov sl, r6
	cmp r6, #0
	ble _0801D44C
	ldr r0, _0801D478 @ =gSineTable
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	mov r8, ip
	movs r1, #0xff
	mov ip, r1
_0801D3FC:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #4
	adds r0, r0, r7
	adds r0, r0, r5
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	lsls r2, r1, #1
	subs r0, r0, r2
	mov r4, ip
	ands r0, r4
	strh r0, [r3]
	adds r3, #2
	lsls r0, r1, #2
	adds r0, r7, r0
	mov r4, r8
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	subs r0, r0, r2
	adds r0, r5, r0
	mov r2, ip
	ands r0, r2
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r1, r6
	blt _0801D3FC
_0801D44C:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	bgt _0801D498
	mov r5, sl
	asrs r2, r5, #0x10
	movs r5, #0xff
_0801D45A:
	movs r0, #0
	strh r0, [r3]
	adds r3, #2
	asrs r1, r1, #0x10
	adds r0, r1, #0
	subs r0, #0xf
	cmp r0, r2
	bge _0801D47C
	subs r0, r1, r2
	subs r0, #0xf
	lsls r0, r0, #3
	subs r1, #1
	subs r0, r0, r1
	b _0801D480
	.align 2, 0
_0801D478: .4byte gSineTable
_0801D47C:
	rsbs r0, r1, #0
	adds r0, #1
_0801D480:
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	lsls r0, r4, #0x10
	movs r6, #0x80
	lsls r6, r6, #9
	adds r0, r0, r6
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D45A
_0801D498:
	ldr r0, [sp]
	cmp r0, #0x10
	bls _0801D4A2
	movs r1, #0x10
	str r1, [sp]
_0801D4A2:
	movs r5, #0
	ldr r6, _0801D528 @ =gUnknown_080D5C02
	movs r2, #0x1f
	mov ip, r2
	movs r3, #0x32
	adds r3, r3, r6
	mov sb, r3
	ldr r4, _0801D52C @ =gBgPalette
	mov r8, r4
_0801D4B4:
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r1, r3, #1
	adds r1, r1, r3
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrb r7, [r0]
	ldr r5, [sp]
	adds r4, r7, #0
	muls r4, r5, r4
	asrs r4, r4, #4
	mov r0, ip
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x31
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	asrs r2, r2, #4
	mov r5, ip
	ands r2, r5
	add r1, sb
	ldrb r0, [r1]
	ldr r1, [sp]
	muls r0, r1, r0
	asrs r0, r0, #4
	ands r0, r5
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	adds r0, r0, r2
	adds r4, r4, r0
	strh r4, [r1]
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0xf
	ble _0801D4B4
	ldr r2, _0801D530 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D528: .4byte gUnknown_080D5C02
_0801D52C: .4byte gBgPalette
_0801D530: .4byte gFlags

	thumb_func_start sub_801D534
sub_801D534: @ 0x0801D534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0801D568 @ =gUnknown_03005850
	ldr r1, _0801D56C @ =gBgScrollRegs
	asrs r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, _0801D570 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd0
	lsls r1, r1, #3
	bl Mod
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	movs r2, #7
	ldr r0, _0801D574 @ =gUnknown_080D5BF0
	ldrh r0, [r0, #0xe]
	cmp r6, r0
	bls _0801D578
	movs r5, #7
	b _0801D598
	.align 2, 0
_0801D568: .4byte gUnknown_03005850
_0801D56C: .4byte gBgScrollRegs
_0801D570: .4byte gUnknown_03005590
_0801D574: .4byte gUnknown_080D5BF0
_0801D578:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	lsls r3, r2, #0x18
	asrs r0, r3, #0x18
	cmp r0, #0
	blt _0801D598
	ldr r1, _0801D5C4 @ =gUnknown_080D5BF0
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bls _0801D578
	lsrs r5, r3, #0x18
_0801D598:
	ldr r0, _0801D5C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801D5A2
	movs r5, #5
_0801D5A2:
	ldr r1, _0801D5CC @ =gBgPalette
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0801D5D0 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	mov sl, r2
	cmp r5, #7
	bls _0801D5BA
	b _0801D942
_0801D5BA:
	lsls r0, r5, #2
	ldr r1, _0801D5D4 @ =_0801D5D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D5C4: .4byte gUnknown_080D5BF0
_0801D5C8: .4byte gGameMode
_0801D5CC: .4byte gBgPalette
_0801D5D0: .4byte gFlags
_0801D5D4: .4byte _0801D5D8
_0801D5D8: @ jump table
	.4byte _0801D5F8 @ case 0
	.4byte _0801D680 @ case 1
	.4byte _0801D68C @ case 2
	.4byte _0801D6D0 @ case 3
	.4byte _0801D718 @ case 4
	.4byte _0801D7F8 @ case 5
	.4byte _0801D86C @ case 6
	.4byte _0801D90C @ case 7
_0801D5F8:
	cmp r6, #1
	bne _0801D630
	ldr r1, _0801D624 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa7
	strh r0, [r4, #0x1c]
	ldr r0, _0801D628 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D62C @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	b _0801D942
	.align 2, 0
_0801D624: .4byte gUnknown_080D5864
_0801D628: .4byte 0x0600C000
_0801D62C: .4byte 0x0600D000
_0801D630:
	cmp r6, #1
	bhi _0801D636
	b _0801D942
_0801D636:
	ldr r2, _0801D674 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801D678 @ =gBgCntRegs
	ldrh r3, [r2]
	ldr r1, _0801D67C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r3
	movs r3, #3
	orrs r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #6]
	ands r1, r0
	orrs r1, r3
	strh r1, [r2, #6]
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _0801D666
	movs r2, #0x3f
_0801D666:
	lsrs r6, r6, #2
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3f
	subs r1, r1, r2
	b _0801D684
	.align 2, 0
_0801D674: .4byte gDispCnt
_0801D678: .4byte gBgCntRegs
_0801D67C: .4byte 0x0000FFFC
_0801D680:
	movs r0, #0xf
	movs r1, #0
_0801D684:
	movs r2, #0
	bl sub_801D24C
	b _0801D942
_0801D68C:
	ldr r1, _0801D6B4 @ =0xFFFFFDBF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsls r1, r0, #8
	lsrs r2, r1, #0x18
	lsrs r6, r0, #0x12
	movs r0, #0xf
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0801D6B8
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3f
	subs r1, r1, r2
	movs r2, #1
	bl sub_801D24C
	b _0801D942
	.align 2, 0
_0801D6B4: .4byte 0xFFFFFDBF
_0801D6B8:
	mov r2, sl
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801D6CC @ =gBldRegs
	strh r6, [r0]
	b _0801D942
	.align 2, 0
_0801D6CC: .4byte gBldRegs
_0801D6D0:
	ldr r3, _0801D70C @ =gBgCntRegs
	ldrh r2, [r3]
	ldr r1, _0801D710 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	movs r2, #3
	orrs r0, r2
	strh r0, [r3]
	ldrh r0, [r3, #6]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strh r1, [r3, #6]
	movs r2, #0
	ldr r4, _0801D714 @ =gBgPalette
	movs r3, #0
_0801D6F0:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0xf
	ble _0801D6F0
	b _0801D8EE
	.align 2, 0
_0801D70C: .4byte gBgCntRegs
_0801D710: .4byte 0x0000FFFC
_0801D714: .4byte gBgPalette
_0801D718:
	ldr r0, _0801D744 @ =0x00000381
	cmp r6, r0
	bne _0801D754
	ldr r1, _0801D748 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa8
	strh r0, [r4, #0x1c]
	ldr r0, _0801D74C @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D750 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	b _0801D76C
	.align 2, 0
_0801D744: .4byte 0x00000381
_0801D748: .4byte gUnknown_080D5864
_0801D74C: .4byte 0x0600C000
_0801D750: .4byte 0x0600D000
_0801D754:
	ldr r2, _0801D7D8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801D7DC @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
_0801D76C:
	ldr r1, _0801D7E0 @ =0xFFFFFC7F
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r3, _0801D7E4 @ =gBgScrollRegs
	mov r8, r3
	ldr r0, _0801D7E8 @ =gFlags
	mov sl, r0
	ldr r1, _0801D7EC @ =gUnknown_080D5C02
	mov ip, r1
	movs r7, #0x1f
	ldr r3, _0801D7F0 @ =gBgPalette
	mov sb, r3
_0801D788:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r1, r3, #1
	adds r1, r1, r3
	mov r2, ip
	adds r0, r1, r2
	ldrb r4, [r0]
	muls r4, r6, r4
	asrs r4, r4, #5
	ands r4, r7
	mov r0, ip
	adds r0, #1
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r2, r5, #0
	muls r2, r6, r2
	asrs r2, r2, #5
	ands r2, r7
	ldr r0, _0801D7F4 @ =gUnknown_080D5C02+2
	adds r1, r1, r0
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #5
	ands r0, r7
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, sb
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D788
	b _0801D83C
	.align 2, 0
_0801D7D8: .4byte gDispCnt
_0801D7DC: .4byte gBgCntRegs
_0801D7E0: .4byte 0xFFFFFC7F
_0801D7E4: .4byte gBgScrollRegs
_0801D7E8: .4byte gFlags
_0801D7EC: .4byte gUnknown_080D5C02
_0801D7F0: .4byte gBgPalette
_0801D7F4: .4byte gUnknown_080D5C02+2
_0801D7F8:
	movs r2, #0
	ldr r0, _0801D860 @ =gBgScrollRegs
	mov r8, r0
	ldr r6, _0801D864 @ =gUnknown_080D5C02
	adds r1, r6, #2
	mov sb, r1
	ldr r3, _0801D868 @ =gBgPalette
	mov ip, r3
	adds r7, r6, #1
_0801D80A:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r0, r3, #1
	adds r0, r0, r3
	adds r1, r0, r6
	ldrb r4, [r1]
	adds r1, r0, r7
	ldrb r5, [r1]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0xf0
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r0, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D80A
_0801D83C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	str r0, [r2]
	mov r3, r8
	ldrh r0, [r3]
	subs r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r3, #2]
	adds r0, #1
	ands r0, r1
	strh r0, [r3, #2]
	b _0801D942
	.align 2, 0
_0801D860: .4byte gBgScrollRegs
_0801D864: .4byte gUnknown_080D5C02
_0801D868: .4byte gBgPalette
_0801D86C:
	ldr r1, _0801D8FC @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	ldr r1, _0801D900 @ =0xFFFFFA5F
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x1f
	subs r0, r0, r6
	lsls r0, r0, #0xf
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r3, _0801D904 @ =gUnknown_080D5C02
	mov ip, r3
	movs r7, #0x1f
	movs r0, #2
	add r0, ip
	mov sb, r0
	ldr r1, _0801D908 @ =gBgPalette
	mov r8, r1
_0801D8A2:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r1, r3, #1
	adds r1, r1, r3
	mov r2, ip
	adds r0, r1, r2
	ldrb r4, [r0]
	muls r4, r6, r4
	asrs r4, r4, #4
	ands r4, r7
	mov r0, ip
	adds r0, #1
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r2, r5, #0
	muls r2, r6, r2
	asrs r2, r2, #4
	ands r2, r7
	add r1, sb
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #4
	ands r0, r7
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D8A2
_0801D8EE:
	mov r3, sl
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	b _0801D942
	.align 2, 0
_0801D8FC: .4byte gBgScrollRegs
_0801D900: .4byte 0xFFFFFA5F
_0801D904: .4byte gUnknown_080D5C02
_0801D908: .4byte gBgPalette
_0801D90C:
	movs r2, #0
	ldr r5, _0801D950 @ =gDispCnt
	ldr r4, _0801D954 @ =gBgPalette
	movs r3, #0
_0801D914:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0xf
	ble _0801D914
	mov r1, sl
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	str r0, [r2]
	ldrh r1, [r5]
	ldr r0, _0801D958 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r5]
_0801D942:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D950: .4byte gDispCnt
_0801D954: .4byte gBgPalette
_0801D958: .4byte 0x0000FEFF

	thumb_func_start sub_801D95C
sub_801D95C: @ 0x0801D95C
	push {r4, r5, r6, lr}
	ldr r4, _0801D9B0 @ =gUnknown_03005850
	ldr r1, _0801D9B4 @ =gDispCnt
	movs r2, #0xb2
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r5, _0801D9B8 @ =gBgCntRegs
	movs r6, #0
	ldr r0, _0801D9BC @ =0x0000160F
	strh r0, [r5]
	ldr r1, _0801D9C0 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xd1
	strh r0, [r4, #0x1c]
	ldr r0, _0801D9C4 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D9C8 @ =0x0600B000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	ldrh r1, [r5, #6]
	ldr r0, _0801D9CC @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r5, #6]
	ldr r0, _0801D9D0 @ =gBgScrollRegs
	strh r6, [r0]
	strh r6, [r0, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D9B0: .4byte gUnknown_03005850
_0801D9B4: .4byte gDispCnt
_0801D9B8: .4byte gBgCntRegs
_0801D9BC: .4byte 0x0000160F
_0801D9C0: .4byte gUnknown_080D5864
_0801D9C4: .4byte 0x0600C000
_0801D9C8: .4byte 0x0600B000
_0801D9CC: .4byte 0x0000FFFC
_0801D9D0: .4byte gBgScrollRegs

	thumb_func_start sub_801D9D4
sub_801D9D4: @ 0x0801D9D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r5, r1, #0
	ldr r2, _0801DB80 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801DA1A
	ldr r0, _0801DB84 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801DA1A
	ldr r1, _0801DB88 @ =gBgScrollRegs
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0801DA08
	mov r0, sl
	strh r0, [r1, #0xc]
_0801DA08:
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	movs r0, #0xc
	ldrsh r3, [r1, r0]
	mov sl, r3
_0801DA1A:
	ldr r2, _0801DB8C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DB90 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801DB94 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0801DB98 @ =gUnknown_03002878
	ldr r0, _0801DB9C @ =0x0400001C
	str r0, [r1]
	ldr r0, _0801DBA0 @ =gUnknown_03002A80
	strb r2, [r0]
	ldr r0, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r0, #0x2a
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0xc8
	lsls r1, r1, #1
	bl Div
	mov r2, sl
	lsls r0, r2, #1
	asrs r3, r5, #4
	str r3, [sp, #0xc]
	asrs r5, r5, #1
	str r5, [sp, #4]
	asrs r2, r2, #4
	str r2, [sp, #8]
	movs r2, #8
	movs r1, #0x10
	movs r3, #0x27
_0801DA6A:
	strh r2, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DA6A
	add r0, sl
	lsls r0, r0, #3
	add r0, sl
	movs r1, #0xc8
	lsls r1, r1, #1
	bl Div
	mov ip, r0
	movs r0, #0xff
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r0, #0x11
	movs r3, #0x76
_0801DA94:
	mov r2, ip
	strh r2, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DA94
	movs r1, #0
_0801DAA6:
	ldr r3, _0801DBA8 @ =gUnknown_03005590
	ldr r0, [r3]
	add r0, sl
	lsrs r0, r0, #3
	mov ip, r0
	movs r0, #0xff
	mov r2, ip
	ands r2, r0
	mov ip, r2
	movs r0, #0x64
	muls r0, r1, r0
	adds r0, #0x40
	ldr r3, [sp, #0xc]
	subs r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xef
	bhi _0801DBAC
	lsls r0, r5, #2
	mov sb, r0
	adds r1, #1
	str r1, [sp]
	cmp r5, #0x50
	bls _0801DB1C
	ldr r1, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r1]
	adds r0, r5, #0
	subs r0, #0x50
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	subs r0, r5, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r3, r5, #0
	movs r2, #0
	adds r7, r1, #0
	adds r7, #0xa0
	cmp r3, r7
	bge _0801DB1C
	cmp r2, r1
	bhs _0801DB1C
	movs r0, #0
	mov r8, r0
	movs r0, #0xd0
	subs r6, r0, r3
_0801DB02:
	mov r0, r8
	strh r0, [r4]
	adds r4, #2
	strh r6, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, r7
	bge _0801DB1C
	cmp r2, r1
	blo _0801DB02
_0801DB1C:
	ldr r1, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r1]
	add r4, sb
	adds r3, r5, #0
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DB48
	movs r0, #0xf0
	subs r1, r0, r3
_0801DB2E:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DB48
	cmp r2, #0xf
	bls _0801DB2E
_0801DB48:
	cmp r3, #0x4f
	bgt _0801DBEE
	movs r0, #0x50
	subs r0, r0, r3
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DBEE
	cmp r2, r1
	bhs _0801DBEE
	movs r6, #0
	movs r0, #0xb8
	subs r5, r0, r5
_0801DB66:
	strh r6, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DBEE
	cmp r2, r1
	blo _0801DB66
	b _0801DBEE
	.align 2, 0
_0801DB80: .4byte gPlayer
_0801DB84: .4byte gUnknown_030054F4
_0801DB88: .4byte gBgScrollRegs
_0801DB8C: .4byte gDispCnt
_0801DB90: .4byte 0x0000FEFF
_0801DB94: .4byte gFlags
_0801DB98: .4byte gUnknown_03002878
_0801DB9C: .4byte 0x0400001C
_0801DBA0: .4byte gUnknown_03002A80
_0801DBA4: .4byte gUnknown_03001884
_0801DBA8: .4byte gUnknown_03005590
_0801DBAC:
	ldr r2, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r2]
	movs r0, #0xff
	subs r3, r0, r5
	adds r1, #1
	str r1, [sp]
	cmp r3, #0xf
	bgt _0801DBD2
	ldr r1, _0801DCD0 @ =0x000001EF
	adds r0, r1, #0
	subs r0, r0, r5
_0801DBC2:
	mov r2, ip
	strh r2, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _0801DBC2
_0801DBD2:
	movs r2, #0
	movs r3, #0
	ldr r1, _0801DCD4 @ =0x000001B7
	adds r0, r1, #0
	subs r1, r0, r5
_0801DBDC:
	strh r3, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0801DBDC
_0801DBEE:
	ldr r2, [sp]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bhi _0801DBFA
	b _0801DAA6
_0801DBFA:
	ldr r3, _0801DCD8 @ =gUnknown_03005590
	ldr r0, [r3]
	add r0, sl
	lsrs r0, r0, #1
	mov ip, r0
	movs r0, #0xff
	mov r1, ip
	ands r1, r0
	mov ip, r1
	ldr r2, [sp, #4]
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xdf
	bhi _0801DCDC
	lsls r3, r5, #2
	mov sb, r3
	cmp r5, #0x50
	bls _0801DC66
	ldr r0, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r0]
	adds r0, r5, #0
	subs r0, #0x50
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	subs r0, r5, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r3, r5, #0
	movs r2, #0
	adds r6, r1, #0
	adds r6, #0xa0
	cmp r3, r6
	bge _0801DC66
	cmp r2, r1
	bhs _0801DC66
	movs r0, #0
	mov r8, r0
	movs r0, #0xd0
	subs r7, r0, r3
_0801DC4C:
	mov r0, r8
	strh r0, [r4]
	adds r4, #2
	strh r7, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, r6
	bge _0801DC66
	cmp r2, r1
	blo _0801DC4C
_0801DC66:
	ldr r1, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r1]
	add r4, sb
	adds r3, r5, #0
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DC92
	movs r0, #0xd0
	subs r1, r0, r3
_0801DC78:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DC92
	cmp r2, #0x1f
	bls _0801DC78
_0801DC92:
	cmp r3, #0x4f
	bgt _0801DD1A
	movs r0, #0x50
	subs r0, r0, r3
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DD1A
	cmp r2, r1
	bhs _0801DD1A
	movs r6, #0
	movs r0, #0xa8
	subs r5, r0, r5
_0801DCB0:
	strh r6, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DD1A
	cmp r2, r1
	blo _0801DCB0
	b _0801DD1A
	.align 2, 0
_0801DCCC: .4byte gUnknown_03001884
_0801DCD0: .4byte 0x000001EF
_0801DCD4: .4byte 0x000001B7
_0801DCD8: .4byte gUnknown_03005590
_0801DCDC:
	ldr r1, _0801DD64 @ =gUnknown_03001884
	ldr r4, [r1]
	movs r0, #0xff
	subs r3, r0, r5
	cmp r3, #0x1f
	bgt _0801DCFE
	ldr r2, _0801DD68 @ =0x000001CF
	adds r0, r2, #0
	subs r0, r0, r5
_0801DCEE:
	mov r1, ip
	strh r1, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _0801DCEE
_0801DCFE:
	movs r2, #0
	movs r3, #0
	ldr r1, _0801DD6C @ =0x000001A7
	adds r0, r1, #0
	subs r1, r0, r5
_0801DD08:
	strh r3, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0801DD08
_0801DD1A:
	ldr r2, [sp, #8]
	lsls r1, r2, #0x10
	movs r6, #7
	ldr r5, _0801DD70 @ =gUnknown_080D5C82
	ldr r0, _0801DD74 @ =gBgPalette
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r4, r0, r3
	lsrs r1, r1, #0x10
	movs r3, #7
_0801DD2E:
	adds r0, r1, #0
	ands r0, r6
	adds r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0801DD2E
	ldr r1, _0801DD78 @ =gFlags
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	ldr r2, _0801DD78 @ =gFlags
	str r0, [r2]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD64: .4byte gUnknown_03001884
_0801DD68: .4byte 0x000001CF
_0801DD6C: .4byte 0x000001A7
_0801DD70: .4byte gUnknown_080D5C82
_0801DD74: .4byte gBgPalette
_0801DD78: .4byte gFlags

	thumb_func_start sub_801DD7C
sub_801DD7C: @ 0x0801DD7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r2, _0801DED8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DEDC @ =0x0000F7FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801DEE0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801DEE4 @ =gUnknown_03002878
	ldr r0, _0801DEE8 @ =0x04000010
	str r0, [r1]
	ldr r1, _0801DEEC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801DEF0 @ =gUnknown_03001884
	ldr r4, [r0]
	ldr r0, _0801DEF4 @ =gUnknown_03005590
	ldr r5, [r0]
	lsrs r1, r5, #3
	movs r2, #0x1f
	ands r1, r2
	mov sb, r0
	cmp r1, #0xf
	bls _0801DDCA
	subs r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0801DDCA:
	movs r3, #0
	ldr r6, _0801DEF8 @ =gUnknown_080D5C62
	adds r7, r6, #2
	mov r8, r7
	movs r0, #7
	mov ip, r0
	movs r1, #0xff
	mov sl, r1
_0801DDDA:
	lsls r0, r3, #1
	mov r7, sp
	adds r2, r7, r0
	adds r1, r3, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #2
	adds r0, r1, r6
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	add r1, r8
	lsrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, sl
	ands r0, r1
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0801DDDA
	ldr r6, _0801DEFC @ =0x0000507F
	movs r3, #0
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE10:
	mov r7, sb
	ldr r0, [r7]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x4f
	bls _0801DE10
	cmp r3, #0x9e
	bhi _0801DEC6
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE6E:
	mov r1, sb
	ldr r0, [r1]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xa0
	subs r0, r0, r3
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x9e
	bls _0801DE6E
_0801DEC6:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DED8: .4byte gDispCnt
_0801DEDC: .4byte 0x0000F7FF
_0801DEE0: .4byte gFlags
_0801DEE4: .4byte gUnknown_03002878
_0801DEE8: .4byte 0x04000010
_0801DEEC: .4byte gUnknown_03002A80
_0801DEF0: .4byte gUnknown_03001884
_0801DEF4: .4byte gUnknown_03005590
_0801DEF8: .4byte gUnknown_080D5C62
_0801DEFC: .4byte 0x0000507F
_0801DF00: .4byte gSineTable
_0801DF04: .4byte 0x000003FF

	thumb_func_start sub_801DF08
sub_801DF08: @ 0x0801DF08
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r1, _0801DFE0 @ =gDispCnt
	ldr r2, _0801DFE4 @ =0x00001141
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0801DFE8 @ =gUnknown_03004D80
	movs r5, #0
	strb r5, [r0, #2]
	ldr r1, _0801DFEC @ =gUnknown_03002280
	strb r5, [r1, #8]
	strb r5, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	mov sb, r0
	mov r2, sb
	strb r2, [r1, #0xb]
	ldr r4, _0801DFF0 @ =gUnknown_03005850 + 0x80
	ldr r0, _0801DFF4 @ =gBgCntRegs
	mov r8, r0
	ldr r0, _0801DFF8 @ =0x00001A89
	mov r1, r8
	strh r0, [r1, #4]
	ldr r6, _0801DFFC @ =gUnknown_080D5864
	adds r1, r6, #0
	adds r1, #0x80
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	ldr r0, _0801E000 @ =0x00000177
	strh r0, [r4, #0x1c]
	ldr r0, _0801E004 @ =0x06008000
	str r0, [r4, #4]
	ldr r0, _0801E008 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0xa
	strh r0, [r4, #0x26]
	movs r0, #9
	strh r0, [r4, #0x28]
	ldrh r0, [r4, #0x2e]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	subs r4, #0x80
	ldr r0, _0801E00C @ =0x00001E07
	mov r2, r8
	strh r0, [r2]
	adds r6, #0xc0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xba
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _0801E010 @ =0x06004000
	str r0, [r4, #4]
	ldr r0, _0801E014 @ =0x0600F000
	str r0, [r4, #0xc]
	mov r0, sb
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	strh r5, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r0, _0801E018 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r5, [r0, #0xe]
	movs r2, #0
	ldr r4, _0801E01C @ =gBgPalette
	ldr r3, _0801E020 @ =gUnknown_080D5CC2
_0801DFB6:
	lsls r0, r2, #1
	adds r1, r0, r4
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0801DFB6
	ldr r0, _0801E024 @ =gFlags
	ldr r1, [r0]
	movs r2, #1
	orrs r1, r2
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFE0: .4byte gDispCnt
_0801DFE4: .4byte 0x00001141
_0801DFE8: .4byte gUnknown_03004D80
_0801DFEC: .4byte gUnknown_03002280
_0801DFF0: .4byte gUnknown_03005850 + 0x80
_0801DFF4: .4byte gBgCntRegs
_0801DFF8: .4byte 0x00001A89
_0801DFFC: .4byte gUnknown_080D5864
_0801E000: .4byte 0x00000177
_0801E004: .4byte 0x06008000
_0801E008: .4byte 0x0600D000
_0801E00C: .4byte 0x00001E07
_0801E010: .4byte 0x06004000
_0801E014: .4byte 0x0600F000
_0801E018: .4byte gBgScrollRegs
_0801E01C: .4byte gBgPalette
_0801E020: .4byte gUnknown_080D5CC2
_0801E024: .4byte gFlags

	thumb_func_start sub_801E028
sub_801E028: @ 0x0801E028
	push {r4, lr}
	ldr r4, _0801E03C @ =gCamera
	ldr r0, [r4, #0x5c]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E03C: .4byte gCamera

	thumb_func_start sub_801E040
sub_801E040: @ 0x0801E040
	push {r4, lr}
	ldr r1, _0801E090 @ =gCamera
	movs r0, #0
	str r0, [r1, #0x5c]
	ldr r4, _0801E094 @ =gCurrentLevel
	ldr r3, _0801E098 @ =gFlags
	movs r2, #0
	ldr r0, _0801E09C @ =gBgScrollRegs
	movs r1, #3
_0801E052:
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0801E052
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1d
	bne _0801E080
	ldr r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0801E080
	ldr r1, _0801E0A0 @ =gIntrTable
	ldr r0, _0801E0A4 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r3]
_0801E080:
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E090: .4byte gCamera
_0801E094: .4byte gCurrentLevel
_0801E098: .4byte gFlags
_0801E09C: .4byte gBgScrollRegs
_0801E0A0: .4byte gIntrTable
_0801E0A4: .4byte gIntrTableTemplate

	thumb_func_start sub_801E0A8
sub_801E0A8: @ 0x0801E0A8
	push {lr}
	ldr r2, _0801E0E8 @ =gDispCnt
	ldrh r1, [r2]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0801E0EC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0801E0CA
	ldr r0, _0801E0F0 @ =0x0000F7FF
	ands r1, r0
	strh r1, [r2]
_0801E0CA:
	ldr r0, _0801E0F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801E0DA
	ldrh r1, [r2]
	ldr r0, _0801E0F8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
_0801E0DA:
	ldr r0, _0801E0FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801E100 @ =sub_801E104
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0801E0E8: .4byte gDispCnt
_0801E0EC: .4byte gCurrentLevel
_0801E0F0: .4byte 0x0000F7FF
_0801E0F4: .4byte gGameMode
_0801E0F8: .4byte 0x0000DFFF
_0801E0FC: .4byte gCurTask
_0801E100: .4byte sub_801E104

	thumb_func_start sub_801E104
sub_801E104: @ 0x0801E104
	push {lr}
	bl sub_801C394
	ldr r1, _0801E114 @ =gUnknown_030054B8
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E114: .4byte gUnknown_030054B8

	thumb_func_start sub_801E118
sub_801E118: @ 0x0801E118
	ldr r1, _0801E128 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801E128: .4byte gBgScrollRegs

    thumb_func_start sub_801E12C
sub_801E12C:
    bx lr
    .align 2, 0

	thumb_func_start sub_801E130
sub_801E130: @ 0x0801E130
	bx lr
	.align 2, 0

	thumb_func_start sub_801E134
sub_801E134: @ 0x0801E134
	push {lr}
	ldr r3, _0801E184 @ =gCamera
	ldr r0, _0801E188 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E18C @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E14C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E14C:
	ldr r2, _0801E190 @ =gBgScrollRegs
	ldr r0, [r1]
	adds r0, #4
	lsrs r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r3, #4]
	asrs r0, r0, #9
	strh r0, [r2, #2]
	ldr r3, _0801E194 @ =gHBlankCallbacks
	ldr r2, _0801E198 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E19C @ =sub_801E434
	str r1, [r0]
	ldr r2, _0801E1A0 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E184: .4byte gCamera
_0801E188: .4byte gPlayer
_0801E18C: .4byte gUnknown_03005590
_0801E190: .4byte gBgScrollRegs
_0801E194: .4byte gHBlankCallbacks
_0801E198: .4byte gNumHBlankCallbacks
_0801E19C: .4byte sub_801E434
_0801E1A0: .4byte gFlags

	thumb_func_start sub_801E1A4
sub_801E1A4: @ 0x0801E1A4
	push {lr}
	ldr r0, _0801E1C8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E1CC @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E1BA
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E1BA:
	ldr r0, [r1]
	movs r1, #0xfa
	lsls r1, r1, #4
	bl sub_801C94C
	pop {r0}
	bx r0
	.align 2, 0
_0801E1C8: .4byte gPlayer
_0801E1CC: .4byte gUnknown_03005590

	thumb_func_start sub_801E1D0
sub_801E1D0: @ 0x0801E1D0
	ldr r1, _0801E1E0 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #0xe]
	strh r0, [r1]
	strh r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0801E1E0: .4byte gBgScrollRegs

	thumb_func_start sub_801E1E4
sub_801E1E4: @ 0x0801E1E4
	ldr r2, _0801E218 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801E21C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0801E220 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0801E224 @ =gHBlankCallbacks
	ldr r2, _0801E228 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E22C @ =sub_801E498
	str r1, [r0]
	ldr r2, _0801E230 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0801E218: .4byte gDispCnt
_0801E21C: .4byte 0x0000FDFF
_0801E220: .4byte gBgScrollRegs
_0801E224: .4byte gHBlankCallbacks
_0801E228: .4byte gNumHBlankCallbacks
_0801E22C: .4byte sub_801E498
_0801E230: .4byte gFlags

	thumb_func_start sub_801E234
sub_801E234: @ 0x0801E234
	ldr r2, _0801E260 @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2, #6]
	ldr r0, _0801E264 @ =0x0000FFFC
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2, #6]
	ldr r1, _0801E268 @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0801E260: .4byte gBgCntRegs
_0801E264: .4byte 0x0000FFFC
_0801E268: .4byte gBgScrollRegs

	thumb_func_start sub_801E26C
sub_801E26C: @ 0x0801E26C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r7, r1, #0
	ldr r0, _0801E2C0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r4, #0
	movs r2, #0
	ldr r5, _0801E2C4 @ =gUnknown_080D5CA2
	lsls r1, r1, #4
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r3, r0
	blt _0801E2B2
	adds r6, r5, #0
	movs r5, #1
_0801E298:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bhi _0801E2B2
	lsls r0, r2, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r3, r0
	bge _0801E298
	adds r4, r5, #0
	ands r4, r2
_0801E2B2:
	cmp r4, #0
	bne _0801E2C8
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801D9D4
	b _0801E2D0
	.align 2, 0
_0801E2C0: .4byte gCurrentLevel
_0801E2C4: .4byte gUnknown_080D5CA2
_0801E2C8:
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801DD7C
_0801E2D0:
	ldr r0, _0801E2DC @ =gPlayer
	adds r0, #0xa8
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E2DC: .4byte gPlayer

	thumb_func_start sub_801E2E0
sub_801E2E0: @ 0x0801E2E0
	push {lr}
	ldr r0, _0801E304 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E308 @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E2F6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E2F6:
	ldr r0, [r1]
	ldr r1, _0801E30C @ =0x000003B1
	bl sub_801D9D4
	pop {r0}
	bx r0
	.align 2, 0
_0801E304: .4byte gPlayer
_0801E308: .4byte gUnknown_03005590
_0801E30C: .4byte 0x000003B1

	thumb_func_start sub_801E310
sub_801E310: @ 0x0801E310
	push {lr}
	ldr r0, _0801E348 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801E326
	ldr r1, _0801E34C @ =gUnknown_03005590
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E326:
	ldr r3, _0801E350 @ =gHBlankCallbacks
	ldr r2, _0801E354 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E358 @ =sub_801E4C4
	str r1, [r0]
	ldr r2, _0801E35C @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E348: .4byte gPlayer
_0801E34C: .4byte gUnknown_03005590
_0801E350: .4byte gHBlankCallbacks
_0801E354: .4byte gNumHBlankCallbacks
_0801E358: .4byte sub_801E4C4
_0801E35C: .4byte gFlags

	thumb_func_start sub_801E360
sub_801E360: @ 0x0801E360
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r0, _0801E3CC @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _0801E37A
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	movs r1, #1
	ands r1, r0
_0801E37A:
	cmp r1, #0
	beq _0801E3C4
	ldr r2, _0801E3D0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801E3D4 @ =gUnknown_03002878
	ldr r0, _0801E3D8 @ =0x04000014
	str r0, [r1]
	ldr r1, _0801E3DC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801E3E0 @ =gUnknown_03001884
	ldr r3, [r0]
	movs r2, #0
	ldr r6, _0801E3E4 @ =gSineTable
	ldr r5, _0801E3E8 @ =gUnknown_03005590
	ldr r4, _0801E3EC @ =0x000003FF
_0801E3A0:
	ldr r1, [r5]
	adds r1, r2, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9e
	bls _0801E3A0
_0801E3C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E3CC: .4byte gUnknown_03005B4C
_0801E3D0: .4byte gFlags
_0801E3D4: .4byte gUnknown_03002878
_0801E3D8: .4byte 0x04000014
_0801E3DC: .4byte gUnknown_03002A80
_0801E3E0: .4byte gUnknown_03001884
_0801E3E4: .4byte gSineTable
_0801E3E8: .4byte gUnknown_03005590
_0801E3EC: .4byte 0x000003FF

	thumb_func_start sub_801E3F0
sub_801E3F0: @ 0x0801E3F0
	push {lr}
	ldr r3, _0801E420 @ =gCamera
	ldr r0, _0801E424 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801E41A
	ldr r2, _0801E428 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801E42C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801E430 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r0, r1
	lsrs r0, r0, #0x10
	subs r0, #8
	str r0, [r3, #0x1c]
_0801E41A:
	pop {r0}
	bx r0
	.align 2, 0
_0801E420: .4byte gCamera
_0801E424: .4byte gUnknown_03005590
_0801E428: .4byte gPseudoRandom
_0801E42C: .4byte 0x00196225
_0801E430: .4byte 0x3C6EF35F

	thumb_func_start sub_801E434
sub_801E434: @ 0x0801E434
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x49
	bne _0801E448
	ldr r1, _0801E44C @ =0x0400001C
	ldr r0, _0801E450 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r0, r0, #4
	strh r0, [r1]
_0801E448:
	pop {r0}
	bx r0
	.align 2, 0
_0801E44C: .4byte 0x0400001C
_0801E450: .4byte gUnknown_03005590

	thumb_func_start sub_801E454
sub_801E454: @ 0x0801E454
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0801E482
	ldr r0, _0801E488 @ =gUnknown_030022AC
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r1, r0, r1
	subs r0, r1, #2
	ldrh r2, [r1, #2]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0801E474
	ldr r0, _0801E48C @ =0x0400001C
	strh r2, [r0]
_0801E474:
	subs r0, r1, #4
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0801E482
	ldr r0, _0801E490 @ =0x04000010
	strh r1, [r0]
_0801E482:
	pop {r0}
	bx r0
	.align 2, 0
_0801E488: .4byte gUnknown_030022AC
_0801E48C: .4byte 0x0400001C
_0801E490: .4byte 0x04000010

	thumb_func_start sub_801E494
sub_801E494: @ 0x0801E494
	bx lr
	.align 2, 0

	thumb_func_start sub_801E498
sub_801E498: @ 0x0801E498
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x69
	bls _0801E4B4
	ldr r3, _0801E4B8 @ =0x0400001C
	ldr r2, _0801E4BC @ =gCourseTime
	ldr r0, _0801E4C0 @ =gUnknown_080D5B50
	adds r0, r1, r0
	ldrb r1, [r0]
	subs r1, #1
	ldr r0, [r2]
	lsrs r0, r1
	strh r0, [r3]
_0801E4B4:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4B8: .4byte 0x0400001C
_0801E4BC: .4byte gCourseTime
_0801E4C0: .4byte gUnknown_080D5B50

	thumb_func_start sub_801E4C4
sub_801E4C4: @ 0x0801E4C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x58
	bne _0801E4D6
	ldr r0, _0801E4DC @ =0x0400001C
	ldr r1, _0801E4E0 @ =gUnknown_03005590
	ldrb r1, [r1]
	strh r1, [r0]
_0801E4D6:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4DC: .4byte 0x0400001C
_0801E4E0: .4byte gUnknown_03005590

	thumb_func_start sub_801E4E4
sub_801E4E4: @ 0x0801E4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r7, [sp, #0x28]
	cmp r7, #0
	bne _0801E500
	mov r7, sp
_0801E500:
	mov r4, sp
	adds r4, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E5DA
	mov r1, r8
	adds r0, r6, r1
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E59C
	mov r5, r8
	lsls r5, r5, #1
	adds r0, r6, r5
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E55C
	mov r0, r8
	cmp r0, #0
	ble _0801E554
	movs r0, #7
	ands r0, r6
	movs r1, #0x18
	subs r0, r1, r0
	b _0801E6C4
_0801E554:
	movs r0, #7
	ands r0, r6
	adds r0, #0x11
	b _0801E6C4
_0801E55C:
	cmp r1, #8
	bne _0801E57C
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, r8
	cmp r1, #0
	ble _0801E574
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0801E6C4
_0801E574:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0801E6C4
_0801E57C:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E592
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0801E6C4
_0801E592:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0801E6C4
_0801E59C:
	cmp r1, #8
	bne _0801E5BA
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0801E5B4
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0801E6C4
_0801E5B4:
	movs r0, #7
	ands r0, r6
	b _0801E6C4
_0801E5BA:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E5D0
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0801E6C4
_0801E5D0:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0801E6C4
_0801E5DA:
	cmp r1, #8
	bne _0801E6AC
	ldrb r0, [r4]
	strb r0, [r7]
	mov r0, r8
	rsbs r0, r0, #0
	str r0, [sp, #4]
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E672
	ldrb r0, [r4]
	strb r0, [r7]
	ldr r0, [sp, #4]
	mov r1, r8
	subs r0, r0, r1
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E634
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0801E62C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x10
	b _0801E6C4
_0801E62C:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0801E6C4
_0801E634:
	cmp r1, #0
	bne _0801E652
	mov r0, r8
	cmp r0, #0
	ble _0801E64A
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801E6C4
_0801E64A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801E6C4
_0801E652:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E668
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0801E6C4
_0801E668:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801E6C4
_0801E672:
	cmp r1, #0
	bne _0801E68C
	mov r1, r8
	cmp r1, #0
	ble _0801E684
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0801E6C4
_0801E684:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0801E6C4
_0801E68C:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6A2
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0801E6C4
_0801E6A2:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0801E6C4
_0801E6AC:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6BE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0801E6C4
_0801E6BE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0801E6C4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801E6D4
sub_801E6D4: @ 0x0801E6D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0801E6F2
	mov r1, sp
	str r1, [sp, #0x24]
_0801E6F2:
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r4, [sp, #0x28]
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E70C
	b _0801E8E0
_0801E70C:
	mov r7, r8
	adds r0, r6, r7
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E722
	b _0801E89E
_0801E722:
	lsls r4, r7, #1
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E73A
	b _0801E85A
_0801E73A:
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E816
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E7D2
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E78E
	mov r0, r8
	cmp r0, #0
	ble _0801E786
	movs r0, #7
	ands r0, r6
	movs r1, #0x30
	subs r0, r1, r0
	b _0801EB34
_0801E786:
	movs r0, #7
	ands r0, r6
	adds r0, #0x29
	b _0801EB34
_0801E78E:
	cmp r1, #8
	bne _0801E7B0
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	cmp r2, #0
	ble _0801E7A8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x28
	b _0801EB34
_0801E7A8:
	movs r0, #7
	ands r0, r6
	adds r0, #0x20
	b _0801EB34
_0801E7B0:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	cmp r1, #0
	ble _0801E7C8
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x28
	b _0801EB34
_0801E7C8:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x28
	b _0801EB34
_0801E7D2:
	cmp r1, #8
	bne _0801E7F4
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	cmp r0, #0
	ble _0801E7EC
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x20
	b _0801EB34
_0801E7EC:
	movs r0, #7
	ands r0, r6
	adds r0, #0x18
	b _0801EB34
_0801E7F4:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E80C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x20
	b _0801EB34
_0801E80C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x20
	b _0801EB34
_0801E816:
	cmp r1, #8
	bne _0801E838
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E830
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x18
	b _0801EB34
_0801E830:
	movs r0, #7
	ands r0, r6
	adds r0, #0x10
	b _0801EB34
_0801E838:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E850
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x18
	b _0801EB34
_0801E850:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x18
	b _0801EB34
_0801E85A:
	cmp r1, #8
	bne _0801E87C
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E874
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0801EB34
_0801E874:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0801EB34
_0801E87C:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E894
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0801EB34
_0801E894:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0801EB34
_0801E89E:
	cmp r1, #8
	bne _0801E8BE
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E8B8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0801EB34
_0801E8B8:
	movs r0, #7
	ands r0, r6
	b _0801EB34
_0801E8BE:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E8D6
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0801EB34
_0801E8D6:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0801EB34
_0801E8E0:
	cmp r1, #8
	beq _0801E8E6
	b _0801EB1A
_0801E8E6:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	rsbs r4, r7, #0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E906
	b _0801EADE
_0801E906:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E924
	b _0801EAB8
_0801E924:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E944
	b _0801EA78
_0801E944:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801EA38
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E9F8
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E9B8
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E9B0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x28
	b _0801EB34
_0801E9B0:
	movs r0, #7
	ands r0, r6
	subs r0, #0x30
	b _0801EB34
_0801E9B8:
	cmp r1, #0
	bne _0801E9D6
	mov r0, r8
	cmp r0, #0
	ble _0801E9CE
	movs r0, #7
	ands r0, r6
	movs r1, #0x21
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801E9CE:
	movs r0, #7
	ands r0, r6
	subs r0, #0x28
	b _0801EB34
_0801E9D6:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E9EE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x28
	b _0801EB34
_0801E9EE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x28
	b _0801EB34
_0801E9F8:
	cmp r1, #0
	bne _0801EA16
	mov r4, r8
	cmp r4, #0
	ble _0801EA0E
	movs r0, #7
	ands r0, r6
	movs r1, #0x19
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA0E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x20
	b _0801EB34
_0801EA16:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EA2E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x20
	b _0801EB34
_0801EA2E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x20
	b _0801EB34
_0801EA38:
	cmp r1, #0
	bne _0801EA56
	mov r0, r8
	cmp r0, #0
	ble _0801EA4E
	movs r0, #7
	ands r0, r6
	movs r1, #0x11
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA4E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0801EB34
_0801EA56:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801EA6E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x18
	b _0801EB34
_0801EA6E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x18
	b _0801EB34
_0801EA78:
	cmp r1, #0
	bne _0801EA96
	mov r4, r8
	cmp r4, #0
	ble _0801EA8E
_0801EA82:
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA8E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801EB34
_0801EA96:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EAAE
_0801EAA0:
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0801EB34
_0801EAAE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801EB34
_0801EAB8:
	cmp r1, #0
	bne _0801EACA
	mov r0, r8
	cmp r0, #0
	bgt _0801EA82
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801EB34
_0801EACA:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	bgt _0801EAA0
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801EB34
_0801EADE:
	cmp r1, #0
	bne _0801EAF8
	mov r4, r8
	cmp r4, #0
	ble _0801EAF0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0801EB34
_0801EAF0:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0801EB34
_0801EAF8:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EB10
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0801EB34
_0801EB10:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0801EB34
_0801EB1A:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801EB2E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0801EB34
_0801EB2E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0801EB34:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801EB44
sub_801EB44: @ 0x0801EB44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	blt _0801EB6C
	ldr r0, _0801EB68 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0801EB6E
	adds r0, r1, #0
	b _0801EB6E
	.align 2, 0
_0801EB68: .4byte gUnknown_030059C8
_0801EB6C:
	movs r0, #0
_0801EB6E:
	adds r3, r0, #0
	cmp r4, #0
	blt _0801EB8C
	ldr r0, _0801EB88 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r4, #0
	cmp r1, r0
	bls _0801EB8E
	adds r1, r0, #0
	b _0801EB8E
	.align 2, 0
_0801EB88: .4byte gUnknown_030059C8
_0801EB8C:
	movs r1, #0
_0801EB8E:
	adds r4, r1, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r3, #0
	bl sub_801EF94
	adds r5, r0, #0
	ldr r3, _0801EC24 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0801EBB6
	subs r2, r6, r2
_0801EBB6:
	ldr r0, _0801EC28 @ =gUnknown_030059C8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #0xf
	ands r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0801EBD8
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r2, r0
_0801EBD8:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0801EBE2
	movs r2, #8
_0801EBE2:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0801EC04
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EC04
	movs r2, #0
_0801EC04:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0801EC30
	cmp r2, #8
	beq _0801EC2C
	cmp r2, #0
	beq _0801EC2C
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0801EC2E
	subs r0, #0x10
	b _0801EC2E
	.align 2, 0
_0801EC24: .4byte 0x000003FF
_0801EC28: .4byte gUnknown_030059C8
_0801EC2C:
	adds r0, r2, #0
_0801EC2E:
	adds r2, r0, #0
_0801EC30:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801EC3C
sub_801EC3C: @ 0x0801EC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r4, #0
	blt _0801EC64
	ldr r0, _0801EC60 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801EC66
	adds r0, r1, #0
	b _0801EC66
	.align 2, 0
_0801EC60: .4byte gUnknown_030059C8
_0801EC64:
	movs r0, #0
_0801EC66:
	adds r4, r0, #0
	cmp r3, #0
	blt _0801EC84
	ldr r0, _0801EC80 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0801EC86
	adds r0, r1, #0
	b _0801EC86
	.align 2, 0
_0801EC80: .4byte gUnknown_030059C8
_0801EC84:
	movs r0, #0
_0801EC86:
	adds r3, r0, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_801EF94
	adds r5, r0, #0
	ldr r3, _0801ED0C @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0801ECB0
	subs r2, r6, r2
_0801ECB0:
	ldr r0, _0801ED10 @ =gUnknown_030059C8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	asrs r2, r2, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0801ECCC
	movs r2, #8
_0801ECCC:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0801ECEE
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801ECEE
	movs r2, #0
_0801ECEE:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0801ED18
	cmp r2, #8
	beq _0801ED14
	cmp r2, #0
	beq _0801ED14
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0801ED16
	subs r0, #0x10
	b _0801ED16
	.align 2, 0
_0801ED0C: .4byte 0x000003FF
_0801ED10: .4byte gUnknown_030059C8
_0801ED14:
	adds r0, r2, #0
_0801ED16:
	adds r2, r0, #0
_0801ED18:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801ED24
sub_801ED24: @ 0x0801ED24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r4, #0
	blt _0801ED50
	ldr r0, _0801ED4C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801ED52
	adds r0, r1, #0
	b _0801ED52
	.align 2, 0
_0801ED4C: .4byte gUnknown_030059C8
_0801ED50:
	movs r0, #0
_0801ED52:
	adds r4, r0, #0
	cmp r5, #0
	blt _0801ED70
	ldr r0, _0801ED6C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r5, #0
	cmp r1, r0
	bls _0801ED72
	adds r1, r0, #0
	b _0801ED72
	.align 2, 0
_0801ED6C: .4byte gUnknown_030059C8
_0801ED70:
	movs r1, #0
_0801ED72:
	adds r5, r1, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r4, #0
	bl sub_801EF94
	adds r4, r0, #0
	ldr r6, _0801EE0C @ =0x000003FF
	ands r6, r4
	movs r7, #7
	adds r3, r7, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801ED9A
	subs r3, r7, r3
_0801ED9A:
	ldr r2, _0801EE10 @ =gUnknown_030059C8
	ldr r5, [r2]
	lsls r0, r6, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r0, #0xf
	ands r3, r0
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0801EDBC
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r3, r0
_0801EDBC:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801EDC6
	movs r3, #8
_0801EDC6:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EDEC
	lsrs r0, r6, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r7
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0801EDEC
	movs r3, #0
_0801EDEC:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EE18
	cmp r3, #8
	beq _0801EE14
	cmp r3, #0
	beq _0801EE14
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0801EE16
	subs r0, #0x10
	b _0801EE16
	.align 2, 0
_0801EE0C: .4byte 0x000003FF
_0801EE10: .4byte gUnknown_030059C8
_0801EE14:
	adds r0, r3, #0
_0801EE16:
	adds r3, r0, #0
_0801EE18:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EE34
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0801EE34:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EE4E
	cmp r3, #0
	beq _0801EE4A
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801EE4C
_0801EE4A:
	adds r0, r2, #0
_0801EE4C:
	adds r2, r0, #0
_0801EE4E:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801EE64
sub_801EE64: @ 0x0801EE64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r5, #0
	blt _0801EE90
	ldr r0, _0801EE8C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	bls _0801EE92
	adds r0, r1, #0
	b _0801EE92
	.align 2, 0
_0801EE8C: .4byte gUnknown_030059C8
_0801EE90:
	movs r0, #0
_0801EE92:
	adds r5, r0, #0
	cmp r4, #0
	blt _0801EEB0
	ldr r0, _0801EEAC @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801EEB2
	adds r0, r1, #0
	b _0801EEB2
	.align 2, 0
_0801EEAC: .4byte gUnknown_030059C8
_0801EEB0:
	movs r0, #0
_0801EEB2:
	adds r4, r0, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801EF94
	adds r4, r0, #0
	ldr r7, _0801EF3C @ =0x000003FF
	ands r7, r4
	movs r6, #7
	adds r3, r6, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EEDC
	subs r3, r6, r3
_0801EEDC:
	ldr r2, _0801EF40 @ =gUnknown_030059C8
	ldr r5, [r2]
	lsls r0, r7, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	asrs r3, r3, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801EEF8
	movs r3, #8
_0801EEF8:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EF1E
	lsrs r0, r7, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r6
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0801EF1E
	movs r3, #0
_0801EF1E:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EF48
	cmp r3, #8
	beq _0801EF44
	cmp r3, #0
	beq _0801EF44
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0801EF46
	subs r0, #0x10
	b _0801EF46
	.align 2, 0
_0801EF3C: .4byte 0x000003FF
_0801EF40: .4byte gUnknown_030059C8
_0801EF44:
	adds r0, r3, #0
_0801EF46:
	adds r3, r0, #0
_0801EF48:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r7
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EF60
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0801EF60:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EF7E
	cmp r3, #0
	beq _0801EF7A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801EF7C
_0801EF7A:
	adds r0, r2, #0
_0801EF7C:
	adds r2, r0, #0
_0801EF7E:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801EF94
sub_801EF94: @ 0x0801EF94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	mov sb, r2
	asrs r4, r0, #3
	ldr r5, _0801EFB0 @ =IWRAM_START + 0x410
	ldr r0, [r5]
	cmp r0, r4
	bne _0801EFB4
	ldr r7, [r5, #8]
	ldr r0, [r5, #4]
	b _0801EFCC
	.align 2, 0
_0801EFB0: .4byte IWRAM_START + 0x410
_0801EFB4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	str r4, [r5]
	str r0, [r5, #4]
	str r1, [r5, #8]
	adds r7, r1, #0
_0801EFCC:
	mov r8, r0
	asrs r4, r6, #3
	ldr r6, _0801EFE0 @ =IWRAM_START + 0x420
	ldr r0, [r6]
	cmp r0, r4
	bne _0801EFE4
	ldr r5, [r6, #8]
	ldr r3, [r6, #4]
	b _0801EFFE
	.align 2, 0
_0801EFE0: .4byte IWRAM_START + 0x420
_0801EFE4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	adds r3, r0, #0
	str r4, [r6]
	str r3, [r6, #4]
	str r1, [r6, #8]
	adds r5, r1, #0
_0801EFFE:
	ldr r0, _0801F040 @ =gUnknown_030059C8
	ldr r4, [r0]
	mov r1, sb
	lsls r0, r1, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r1, r1, r0
	ldrh r0, [r4, #0x18]
	muls r0, r3, r0
	add r0, r8
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r1, r5, #3
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r3, r2, #8
	lsls r2, r2, #5
	lsls r1, r1, #1
	ldr r0, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F040: .4byte gUnknown_030059C8

	thumb_func_start sub_801F044
sub_801F044: @ 0x0801F044
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	ldr r0, _0801F06C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _0801F070 @ =IWRAM_START + 0x410
	str r1, [r0, #4]
	ldr r2, _0801F074 @ =0x85000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _0801F078 @ =IWRAM_START + 0x420
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0801F06C: .4byte 0x040000D4
_0801F070: .4byte IWRAM_START + 0x410
_0801F074: .4byte 0x85000003
_0801F078: .4byte IWRAM_START + 0x420

	thumb_func_start sub_801F07C
sub_801F07C: @ 0x0801F07C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r3
	ldr r6, [sp, #0x1c]
	cmp r6, #0
	bne _0801F090
	mov r6, sp
_0801F090:
	mov r4, sp
	adds r4, #1
	adds r0, r5, #0
	adds r3, r4, #0
	ldr r7, [sp, #0x20]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801F0BC
	mov r0, r8
	cmp r0, #0
	ble _0801F0B4
	movs r0, #7
	ands r0, r5
	movs r1, #8
	subs r0, r1, r0
	b _0801F0F2
_0801F0B4:
	movs r0, #7
	ands r0, r5
	adds r0, #1
	b _0801F0F2
_0801F0BC:
	cmp r1, #8
	bne _0801F0DA
	ldrb r0, [r4]
	strb r0, [r6]
	mov r7, r8
	cmp r7, #0
	ble _0801F0D2
	movs r0, #7
	ands r0, r5
	mvns r0, r0
	b _0801F0F2
_0801F0D2:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r5
	b _0801F0F2
_0801F0DA:
	ldrb r0, [r4]
	strb r0, [r6]
	cmp r1, #0
	ble _0801F0EC
	subs r1, #1
	movs r0, #7
	ands r0, r5
	subs r0, r1, r0
	b _0801F0F2
_0801F0EC:
	movs r0, #7
	ands r0, r5
	adds r0, r1, r0
_0801F0F2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801F100
sub_801F100: @ 0x0801F100
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r3, [sp, #0xc]
	bl _call_via_r3
	adds r1, r0, #0
	cmp r1, #0
	bne _0801F128
	cmp r5, #0
	ble _0801F120
	movs r0, #7
	ands r0, r4
	movs r1, #8
	subs r0, r1, r0
	b _0801F154
_0801F120:
	movs r0, #7
	ands r0, r4
	adds r0, #1
	b _0801F154
_0801F128:
	cmp r1, #8
	bne _0801F140
	cmp r5, #0
	ble _0801F138
	movs r0, #7
	ands r0, r4
	mvns r0, r0
	b _0801F154
_0801F138:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r4
	b _0801F154
_0801F140:
	cmp r1, #0
	ble _0801F14E
	subs r1, #1
	movs r0, #7
	ands r0, r4
	subs r0, r1, r0
	b _0801F154
_0801F14E:
	movs r0, #7
	ands r0, r4
	adds r0, r1, r0
_0801F154:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801F15C
sub_801F15C: @ 0x0801F15C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r2, _0801F1FC @ =0x00004001
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r6, r1
	ldr r2, _0801F200 @ =IWRAM_START + 0x1C
	adds r2, r2, r6
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r1, #4]
	movs r4, #0
	movs r2, #0
	mov r3, sb
	strh r3, [r1, #0x14]
	mov r3, sl
	strb r3, [r1, #0x1a]
	strh r2, [r1, #0x16]
	strh r2, [r1, #0x18]
	mov r1, r8
	str r2, [r1, #4]
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r3, _0801F204 @ =IWRAM_START + 0x3C
	adds r1, r6, r3
	strb r4, [r1]
	ldr r1, _0801F208 @ =IWRAM_START + 0x3D
	adds r3, r6, r1
	movs r1, #0xff
	strb r1, [r3]
	mov r3, r8
	strh r2, [r3, #0x1a]
	strh r2, [r3, #0x1c]
	ldr r1, _0801F20C @ =IWRAM_START + 0x3E
	adds r3, r6, r1
	movs r1, #0x10
	strb r1, [r3]
	ldr r3, _0801F210 @ =IWRAM_START + 0x41
	adds r6, r6, r3
	strb r4, [r6]
	mov r1, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F1FC: .4byte 0x00004001
_0801F200: .4byte IWRAM_START + 0x1C
_0801F204: .4byte IWRAM_START + 0x3C
_0801F208: .4byte IWRAM_START + 0x3D
_0801F20C: .4byte IWRAM_START + 0x3E
_0801F210: .4byte IWRAM_START + 0x41

	thumb_func_start sub_801F214
sub_801F214: @ 0x0801F214
	push {r4, r5, r6, lr}
	ldr r2, _0801F25C @ =gCurTask
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x1c
	adds r5, r1, r0
	ldr r3, _0801F260 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _0801F254
	ldrh r1, [r4, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801F264
	adds r1, r3, #0
	adds r1, #0x68
	ldrh r0, [r4, #0x16]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801F254
	adds r1, r3, #0
	adds r1, #0x6a
	ldrh r0, [r4, #0x18]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0801F264
_0801F254:
	adds r0, r6, #0
	bl TaskDestroy
	b _0801F398
	.align 2, 0
_0801F25C: .4byte gCurTask
_0801F260: .4byte gPlayer
_0801F264:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F278
	ldr r0, [r2]
	bl TaskDestroy
	b _0801F398
_0801F278:
	ldrh r1, [r4, #0x14]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	beq _0801F310
	cmp r0, #1
	bgt _0801F28C
	cmp r0, #0
	beq _0801F292
	b _0801F334
_0801F28C:
	cmp r0, #2
	beq _0801F32C
	b _0801F334
_0801F292:
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	beq _0801F2EC
	cmp r0, #0x20
	bne _0801F2F4
	ldr r0, _0801F2CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F2E0
	ldr r0, _0801F2D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldr r1, _0801F2D4 @ =gMultiplayerPlayerTasks
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0801F2D8 @ =IWRAM_START + 0x50
	adds r1, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r4]
	ldr r1, _0801F2DC @ =IWRAM_START + 0x52
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0801F2F2
	.align 2, 0
_0801F2CC: .4byte gGameMode
_0801F2D0: .4byte 0x04000128
_0801F2D4: .4byte gMultiplayerPlayerTasks
_0801F2D8: .4byte IWRAM_START + 0x50
_0801F2DC: .4byte IWRAM_START + 0x52
_0801F2E0:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	str r0, [r4]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	b _0801F2F2
_0801F2EC:
	ldr r0, _0801F308 @ =gUnknown_03005660
	movs r1, #4
	ldrsh r0, [r0, r1]
_0801F2F2:
	str r0, [r4, #4]
_0801F2F4:
	ldr r2, _0801F30C @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F308: .4byte gUnknown_03005660
_0801F30C: .4byte gCamera
_0801F310:
	ldr r2, _0801F328 @ =gCamera
	ldr r0, [r4]
	adds r1, r2, #0
	adds r1, #0x52
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	adds r2, #0x54
	ldrh r1, [r2]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F328: .4byte gCamera
_0801F32C:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
_0801F332:
	strh r0, [r5, #0x18]
_0801F334:
	ldrh r1, [r4, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801F35A
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F352
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F358
_0801F352:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F37C @ =0xFFFFFBFF
	ands r0, r1
_0801F358:
	str r0, [r5, #0x10]
_0801F35A:
	ldrh r1, [r4, #0x14]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F38C
	ldr r0, _0801F380 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F384
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F38A
	.align 2, 0
_0801F37C: .4byte 0xFFFFFBFF
_0801F380: .4byte gUnknown_03005424
_0801F384:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F3A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F38A:
	str r0, [r5, #0x10]
_0801F38C:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0801F398:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3A0: .4byte 0xFFFFF7FF

	thumb_func_start sub_801F3A4
sub_801F3A4: @ 0x0801F3A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r7, #0x64
	beq _0801F3D6
	cmp r7, #0xc8
	beq _0801F3D6
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F3D6
	adds r0, #0xc8
	cmp r7, r0
	beq _0801F3D6
	movs r0, #0xc8
	lsls r0, r0, #2
	cmp r7, r0
	beq _0801F3D6
	movs r0, #0
	b _0801F474
_0801F3D6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F410 @ =sub_801F214
	str r2, [sp]
	ldr r2, _0801F414 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0
	bl sub_801F15C
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F432
	cmp r7, r0
	bgt _0801F418
	cmp r7, #0x64
	beq _0801F42A
	cmp r7, #0xc8
	beq _0801F42E
	b _0801F43C
	.align 2, 0
_0801F410: .4byte sub_801F214
_0801F414: .4byte sub_801F550
_0801F418:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F436
	movs r0, #0xc8
	lsls r0, r0, #2
	cmp r7, r0
	beq _0801F43A
	b _0801F43C
_0801F42A:
	movs r7, #0
	b _0801F43C
_0801F42E:
	movs r7, #1
	b _0801F43C
_0801F432:
	movs r7, #2
	b _0801F43C
_0801F436:
	movs r7, #3
	b _0801F43C
_0801F43A:
	movs r7, #4
_0801F43C:
	mov r6, r8
	adds r6, #0x1c
	ldr r5, _0801F484 @ =sAnimData_StageGoalScoreBonus
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	mov r0, r8
	adds r0, #0x3c
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
_0801F474:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F484: .4byte sAnimData_StageGoalScoreBonus

	thumb_func_start sub_801F488
sub_801F488: @ 0x0801F488
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, _0801F52C @ =gPlayer
	ldr r0, _0801F530 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0801F524
	movs r4, #0x17
	ldrsb r4, [r5, r4]
	ldr r0, _0801F534 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801F4AC
	rsbs r4, r4, #0
_0801F4AC:
	ldr r2, _0801F538 @ =gSineTable
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r3, r4, #0
	muls r3, r0, r3
	asrs r3, r3, #8
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r0, r0, r3
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F53C @ =sub_801F214
	str r2, [sp]
	ldr r2, _0801F540 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xc0
	movs r3, #0
	bl sub_801F15C
	ldrh r4, [r0, #6]
	ldr r0, _0801F544 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0x14
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _0801F548 @ =0x00000351
	strh r0, [r5, #0xa]
	ldr r0, _0801F54C @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_0801F524:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F52C: .4byte gPlayer
_0801F530: .4byte gUnknown_03005590
_0801F534: .4byte gUnknown_03005424
_0801F538: .4byte gSineTable
_0801F53C: .4byte sub_801F214
_0801F540: .4byte sub_801F550
_0801F544: .4byte IWRAM_START + 0x1C
_0801F548: .4byte 0x00000351
_0801F54C: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_801F550
sub_801F550: @ 0x0801F550
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _0801F564 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0801F564: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_801F568
sub_801F568: @ 0x0801F568
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F5B8 @ =sub_801F214
	str r2, [sp]
	ldr r2, _0801F5BC @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xc0
	movs r3, #0
	bl sub_801F15C
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	ldr r0, _0801F5C0 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0x14
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _0801F5C4 @ =0x00000351
	strh r0, [r5, #0xa]
	ldr r0, _0801F5C8 @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F5B8: .4byte sub_801F214
_0801F5BC: .4byte sub_801F550
_0801F5C0: .4byte IWRAM_START + 0x1C
_0801F5C4: .4byte 0x00000351
_0801F5C8: .4byte IWRAM_START + 0x3C

    @; This might be a collision function?
    @; Gets called by sub_801350C and gets
    @; the X/Y coords for the bottom pos of a sprite.
	thumb_func_start sub_801F5CC
sub_801F5CC: @ 0x0801F5CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r1, _0801F5F0 @ =gUnknown_030059D0
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0801F5EC
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0801F5F4
_0801F5EC:
	movs r0, #0
	b _0801F6BE
	.align 2, 0
_0801F5F0: .4byte gUnknown_030059D0
_0801F5F4:
	subs r0, r2, #1
	movs r4, #0
	strb r0, [r1]
	ldr r0, _0801F650 @ =sub_801F6E0
	ldr r2, _0801F654 @ =0x00004001
	ldr r1, _0801F658 @ =sub_801F7B8
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	movs r1, #0
	mov r8, r1
	strh r6, [r0]
	strh r7, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0801F65C @ =IWRAM_START + 0x8
	adds r4, r5, r0
	ldr r0, _0801F660 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801F668
	movs r0, #0xf
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xda
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _0801F664 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #6
	b _0801F696
	.align 2, 0
_0801F650: .4byte sub_801F6E0
_0801F654: .4byte 0x00004001
_0801F658: .4byte sub_801F7B8
_0801F65C: .4byte IWRAM_START + 0x8
_0801F660: .4byte gPlayer
_0801F664: .4byte IWRAM_START + 0x28
_0801F668:
	ldr r0, _0801F6CC @ =0x06012300
	str r0, [r4, #4]
	movs r0, #0xd4
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _0801F6D0 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r4, #0x10]
	ldr r2, _0801F6D4 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801F6D8 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801F6DC @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #4
	ands r0, r1
	orrs r0, r3
_0801F696:
	str r0, [r4, #0x10]
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #8]
	adds r3, r4, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	mov r0, sb
_0801F6BE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F6CC: .4byte 0x06012300
_0801F6D0: .4byte IWRAM_START + 0x28
_0801F6D4: .4byte gPseudoRandom
_0801F6D8: .4byte 0x00196225
_0801F6DC: .4byte 0x3C6EF35F

	thumb_func_start sub_801F6E0
sub_801F6E0: @ 0x0801F6E0
	push {r4, r5, lr}
	ldr r2, _0801F714 @ =gUnknown_030059D0
	ldr r0, _0801F718 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #8
	adds r5, r1, r0
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0801F706
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F71C
_0801F706:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r3, #0
	bl TaskDestroy
	b _0801F74A
	.align 2, 0
_0801F714: .4byte gUnknown_030059D0
_0801F718: .4byte gCurTask
_0801F71C:
	ldr r2, _0801F750 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #2]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #6]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
_0801F74A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F750: .4byte gCamera

	thumb_func_start sub_801F754
sub_801F754: @ 0x0801F754
	push {r4, lr}
	sub sp, #4
	ldr r4, _0801F780 @ =gUnknown_030059D0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0801F778
	ldr r0, _0801F784 @ =sub_801F7B4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _0801F788 @ =sub_801F7A8
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r0, [r4, #4]
	movs r0, #0x14
	strb r0, [r4]
_0801F778:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F780: .4byte gUnknown_030059D0
_0801F784: .4byte sub_801F7B4
_0801F788: .4byte sub_801F7A8

	thumb_func_start sub_801F78C
sub_801F78C: @ 0x0801F78C
	push {r4, lr}
	ldr r4, _0801F7A4 @ =gUnknown_030059D0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801F79E
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #4]
_0801F79E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F7A4: .4byte gUnknown_030059D0

	thumb_func_start sub_801F7A8
sub_801F7A8: @ 0x0801F7A8
	ldr r1, _0801F7B0 @ =gUnknown_030059D0
	movs r0, #0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_0801F7B0: .4byte gUnknown_030059D0

	thumb_func_start sub_801F7B4
sub_801F7B4: @ 0x0801F7B4
	bx lr
	.align 2, 0

	thumb_func_start sub_801F7B8
sub_801F7B8: @ 0x0801F7B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r0, #0xda
	lsls r0, r0, #2
	cmp r1, r0
	bne _0801F7D6
	ldr r0, [r2, #0xc]
	bl VramFree
_0801F7D6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F7DC
sub_801F7DC: @ 0x0801F7DC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0801F840 @ =sub_801F860
	ldr r2, _0801F844 @ =0x00004001
	ldr r1, _0801F848 @ =sub_801FAE8
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0x14
	bl VramMalloc
	str r0, [r4, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #8]
	ldr r0, _0801F84C @ =0x0000034E
	strh r0, [r4, #0xa]
	ldr r1, _0801F850 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	strb r3, [r0]
	ldr r0, _0801F854 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	ldr r0, _0801F858 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801F85C @ =IWRAM_START + 0x25
	adds r5, r5, r1
	strb r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F840: .4byte sub_801F860
_0801F844: .4byte 0x00004001
_0801F848: .4byte sub_801FAE8
_0801F84C: .4byte 0x0000034E
_0801F850: .4byte IWRAM_START + 0x20
_0801F854: .4byte IWRAM_START + 0x21
_0801F858: .4byte IWRAM_START + 0x22
_0801F85C: .4byte IWRAM_START + 0x25

	thumb_func_start sub_801F860
sub_801F860: @ 0x0801F860
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801F888 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F87C
	ldr r0, [r5, #0x20]
	movs r1, #0x90
	lsls r1, r1, #3
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _0801F890
_0801F87C:
	ldr r0, _0801F88C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801F998
	.align 2, 0
_0801F888: .4byte gPlayer
_0801F88C: .4byte gCurTask
_0801F890:
	ldr r3, _0801F908 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _0801F8C2
	movs r1, #0
	ldr r0, _0801F90C @ =0x0000034F
	strh r0, [r4, #0xa]
	ldr r6, _0801F910 @ =IWRAM_START + 0x20
	adds r0, r2, r6
	strb r1, [r0]
	ldr r0, _0801F914 @ =IWRAM_START + 0x21
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, _0801F918 @ =sub_801F9A4
	str r0, [r1, #8]
_0801F8C2:
	ldr r6, _0801F91C @ =gCamera
	movs r3, #0x17
	ldrsb r3, [r5, r3]
	ldr r2, _0801F920 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0801F8D8
	rsbs r3, r3, #0
_0801F8D8:
	ldr r0, _0801F924 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F938
	ldr r1, _0801F928 @ =gMultiplayerPlayerTasks
	ldr r0, _0801F92C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0801F930 @ =IWRAM_START + 0x50
	adds r0, r1, r2
	ldr r2, [r6]
	ldrh r0, [r0]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, _0801F934 @ =IWRAM_START + 0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0801F946
	.align 2, 0
_0801F908: .4byte gCurTask
_0801F90C: .4byte 0x0000034F
_0801F910: .4byte IWRAM_START + 0x20
_0801F914: .4byte IWRAM_START + 0x21
_0801F918: .4byte sub_801F9A4
_0801F91C: .4byte gCamera
_0801F920: .4byte gUnknown_03005424
_0801F924: .4byte gGameMode
_0801F928: .4byte gMultiplayerPlayerTasks
_0801F92C: .4byte 0x04000128
_0801F930: .4byte IWRAM_START + 0x50
_0801F934: .4byte IWRAM_START + 0x52
_0801F938:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
_0801F946:
	adds r0, r0, r3
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F962
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F968
_0801F962:
	ldr r0, [r4, #0x10]
	ldr r1, _0801F980 @ =0xFFFFFBFF
	ands r0, r1
_0801F968:
	str r0, [r4, #0x10]
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801F984
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F98A
	.align 2, 0
_0801F980: .4byte 0xFFFFFBFF
_0801F984:
	ldr r0, [r4, #0x10]
	ldr r1, _0801F9A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F98A:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801F998:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F9A0: .4byte 0xFFFFF7FF

	thumb_func_start sub_801F9A4
sub_801F9A4: @ 0x0801F9A4
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801F9CC @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F9C0
	ldr r0, [r5, #0x20]
	movs r1, #0x90
	lsls r1, r1, #3
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _0801F9D4
_0801F9C0:
	ldr r0, _0801F9D0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801FADC
	.align 2, 0
_0801F9CC: .4byte gPlayer
_0801F9D0: .4byte gCurTask
_0801F9D4:
	ldr r3, _0801FA4C @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bgt _0801FA06
	movs r1, #0
	ldr r0, _0801FA50 @ =0x0000034E
	strh r0, [r4, #0xa]
	ldr r6, _0801FA54 @ =IWRAM_START + 0x20
	adds r0, r2, r6
	strb r1, [r0]
	ldr r0, _0801FA58 @ =IWRAM_START + 0x21
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, _0801FA5C @ =sub_801F860
	str r0, [r1, #8]
_0801FA06:
	ldr r6, _0801FA60 @ =gCamera
	movs r3, #0x17
	ldrsb r3, [r5, r3]
	ldr r2, _0801FA64 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0801FA1C
	rsbs r3, r3, #0
_0801FA1C:
	ldr r0, _0801FA68 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801FA7C
	ldr r1, _0801FA6C @ =gMultiplayerPlayerTasks
	ldr r0, _0801FA70 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0801FA74 @ =IWRAM_START + 0x50
	adds r0, r1, r2
	ldr r2, [r6]
	ldrh r0, [r0]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, _0801FA78 @ =IWRAM_START + 0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0801FA8A
	.align 2, 0
_0801FA4C: .4byte gCurTask
_0801FA50: .4byte 0x0000034E
_0801FA54: .4byte IWRAM_START + 0x20
_0801FA58: .4byte IWRAM_START + 0x21
_0801FA5C: .4byte sub_801F860
_0801FA60: .4byte gCamera
_0801FA64: .4byte gUnknown_03005424
_0801FA68: .4byte gGameMode
_0801FA6C: .4byte gMultiplayerPlayerTasks
_0801FA70: .4byte 0x04000128
_0801FA74: .4byte IWRAM_START + 0x50
_0801FA78: .4byte IWRAM_START + 0x52
_0801FA7C:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
_0801FA8A:
	adds r0, r0, r3
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801FAA6
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801FAAC
_0801FAA6:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FAC4 @ =0xFFFFFBFF
	ands r0, r1
_0801FAAC:
	str r0, [r4, #0x10]
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801FAC8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801FACE
	.align 2, 0
_0801FAC4: .4byte 0xFFFFFBFF
_0801FAC8:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FAE4 @ =0xFFFFF7FF
	ands r0, r1
_0801FACE:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801FADC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FAE4: .4byte 0xFFFFF7FF

	thumb_func_start sub_801FAE8
sub_801FAE8: @ 0x0801FAE8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_801FAFC
sub_801FAFC: @ 0x0801FAFC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0801FB60 @ =sub_801FB80
	ldr r2, _0801FB64 @ =0x00002001
	ldr r1, _0801FB68 @ =sub_801FC18
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0x14
	bl VramMalloc
	str r0, [r4, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #8]
	ldr r0, _0801FB6C @ =0x00000351
	strh r0, [r4, #0xa]
	ldr r1, _0801FB70 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	strb r3, [r0]
	ldr r0, _0801FB74 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	ldr r0, _0801FB78 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801FB7C @ =IWRAM_START + 0x25
	adds r5, r5, r1
	strb r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801FB60: .4byte sub_801FB80
_0801FB64: .4byte 0x00002001
_0801FB68: .4byte sub_801FC18
_0801FB6C: .4byte 0x00000351
_0801FB70: .4byte IWRAM_START + 0x20
_0801FB74: .4byte IWRAM_START + 0x21
_0801FB78: .4byte IWRAM_START + 0x22
_0801FB7C: .4byte IWRAM_START + 0x25

	thumb_func_start sub_801FB80
sub_801FB80: @ 0x0801FB80
	push {r4, lr}
	ldr r3, _0801FBA4 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801FB9A
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _0801FBAC
_0801FB9A:
	ldr r0, _0801FBA8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801FC0C
	.align 2, 0
_0801FBA4: .4byte gPlayer
_0801FBA8: .4byte gCurTask
_0801FBAC:
	ldr r0, [r3, #0x68]
	cmp r0, #0x37
	bne _0801FC0C
	ldr r0, _0801FBF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _0801FBF4 @ =gCamera
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801FBF8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801FBFE
	.align 2, 0
_0801FBF0: .4byte gCurTask
_0801FBF4: .4byte gCamera
_0801FBF8:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FC14 @ =0xFFFFFBFF
	ands r0, r1
_0801FBFE:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801FC0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC14: .4byte 0xFFFFFBFF

	thumb_func_start sub_801FC18
sub_801FC18: @ 0x0801FC18
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_801FC2C
sub_801FC2C: @ 0x0801FC2C
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _0801FC44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801FC60
	cmp r0, #2
	bhi _0801FC50
	ldr r4, _0801FC48 @ =gUnknown_030059D8
	ldr r0, _0801FC4C @ =sub_8021368
	b _0801FC64
	.align 2, 0
_0801FC44: .4byte gGameMode
_0801FC48: .4byte gUnknown_030059D8
_0801FC4C: .4byte sub_8021368
_0801FC50:
	ldr r4, _0801FC58 @ =gUnknown_030059D8
	ldr r0, _0801FC5C @ =sub_8021388
	b _0801FC64
	.align 2, 0
_0801FC58: .4byte gUnknown_030059D8
_0801FC5C: .4byte sub_8021388
_0801FC60:
	ldr r4, _0801FCF0 @ =gUnknown_030059D8
	ldr r0, _0801FCF4 @ =sub_80213A8
_0801FC64:
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _0801FCF8 @ =0x00002001
	ldr r3, _0801FCFC @ =sub_80213B4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _0801FD00 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	ldr r0, _0801FD04 @ =0x000002D6
	strh r0, [r1, #0xa]
	ldr r2, _0801FD08 @ =IWRAM_START + 0x20
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0801FD0C @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0801FD10 @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _0801FD14 @ =IWRAM_START + 0x25
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _0801FD18 @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _0801FD1C @ =IWRAM_START + 0x2B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _0801FD20 @ =IWRAM_START + 0x2B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _0801FD24 @ =IWRAM_START + 0x2B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _0801FD28 @ =IWRAM_START + 0x30
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _0801FD2C @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _0801FD30 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FCF0: .4byte gUnknown_030059D8
_0801FCF4: .4byte sub_80213A8
_0801FCF8: .4byte 0x00002001
_0801FCFC: .4byte sub_80213B4
_0801FD00: .4byte 0x06011F00
_0801FD04: .4byte 0x000002D6
_0801FD08: .4byte IWRAM_START + 0x20
_0801FD0C: .4byte IWRAM_START + 0x21
_0801FD10: .4byte IWRAM_START + 0x22
_0801FD14: .4byte IWRAM_START + 0x25
_0801FD18: .4byte 0x00042200
_0801FD1C: .4byte IWRAM_START + 0x2B6
_0801FD20: .4byte IWRAM_START + 0x2B4
_0801FD24: .4byte IWRAM_START + 0x2B0
_0801FD28: .4byte IWRAM_START + 0x30
_0801FD2C: .4byte 0x040000D4
_0801FD30: .4byte 0x81000140

	thumb_func_start sub_801FD34
sub_801FD34: @ 0x0801FD34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _0801FDB8 @ =gUnknown_030059D8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0801FDBC @ =IWRAM_START + 0x30
	adds r4, r0, r1
	ldr r6, _0801FDC0 @ =gPlayer
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	bne _0801FD5E
	b _0801FE5A
_0801FD5E:
	cmp r7, #0x20
	ble _0801FD64
	movs r7, #0x20
_0801FD64:
	ldr r0, _0801FDC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801FD72
	cmp r7, #0x10
	ble _0801FD72
	movs r7, #0x10
_0801FD72:
	movs r0, #0x76
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _0801FDC8 @ =gSineTable
	mov sl, r1
	ldr r0, _0801FDCC @ =gPseudoRandom
	mov sb, r0
_0801FD8A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0801FE4E
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _0801FE00
	asrs r2, r3, #8
	cmp r2, #5
	ble _0801FDD0
	rsbs r0, r2, #0
	adds r0, #9
	b _0801FDD2
	.align 2, 0
_0801FDB8: .4byte gUnknown_030059D8
_0801FDBC: .4byte IWRAM_START + 0x30
_0801FDC0: .4byte gPlayer
_0801FDC4: .4byte gGameMode
_0801FDC8: .4byte gSineTable
_0801FDCC: .4byte gPseudoRandom
_0801FDD0:
	adds r0, r2, #0
_0801FDD2:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r1, #0x80
	orrs r3, r1
_0801FE00:
	movs r2, #0
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	ldr r0, _0801FE6C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801FE16
	rsbs r0, r6, #0
	strh r0, [r4, #0xa]
_0801FE16:
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	strh r2, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0801FE70 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801FE74 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _0801FE3A
	movs r0, #4
	strh r0, [r4, #0x10]
_0801FE3A:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _0801FE5A
_0801FE4E:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _0801FD8A
_0801FE5A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE6C: .4byte gUnknown_03005424
_0801FE70: .4byte 0x00196225
_0801FE74: .4byte 0x3C6EF35F

	thumb_func_start sub_801FE78
sub_801FE78: @ 0x0801FE78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0801FFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _0801FFE0 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _0801FFE4 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _0801FFE8 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl sub_8004558
	movs r2, #0x1f
	str r2, [sp, #0x14]
_0801FEB8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0801FEC0
	b _08020180
_0801FEC0:
	movs r4, #8
	ldrsh r0, [r5, r4]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r0, #0xa
	ldrsh r2, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r7, r1, #8
	asrs r0, r0, #8
	mov r8, r0
	ldr r1, _0801FFEC @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	mov r2, r8
	subs r2, r2, r0
	mov sl, r2
	ldr r4, _0801FFF0 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _0801FEFC
	b _08020008
_0801FEFC:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0801FF12
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801FF12
	b _08020008
_0801FF12:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020008
	adds r6, r2, #0
	adds r6, #0x38
	adds r2, r7, #0
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF3E
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _0801FF4A
	cmp r2, r1
	blt _08020008
_0801FF3E:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF4A:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF64
	cmp r8, r1
	bge _0801FF70
	cmp r2, r1
	blt _08020008
_0801FF64:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF70:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _0801FFF4 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _0801FFF8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0801FFC4
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0801FFC4
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801FFC4
	ldr r1, _08020000 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0801FFBC
	movs r0, #0xff
_0801FFBC:
	strb r0, [r1]
	ldr r1, _08020004 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0801FFC4:
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801FFD8
	ldr r1, _0801FFF4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0801FFD8
	movs r0, #0xff
	strh r0, [r1]
_0801FFD8:
	movs r0, #0
	b _0802017E
	.align 2, 0
_0801FFDC: .4byte gCurTask
_0801FFE0: .4byte IWRAM_START + 0x30
_0801FFE4: .4byte IWRAM_START + 0x2B0
_0801FFE8: .4byte IWRAM_START + 0x2B4
_0801FFEC: .4byte gCamera
_0801FFF0: .4byte gPlayer
_0801FFF4: .4byte gRingCount
_0801FFF8: .4byte gCurrentLevel
_0801FFFC: .4byte gGameMode
_08020000: .4byte gNumLives
_08020004: .4byte gUnknown_030054A8
_08020008:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _08020046
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020046
	mov r0, r8
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _080200EC @ =sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020046
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020046:
	ldr r2, [sp, #4]
	ldr r4, _080200F0 @ =0x000002B6
	adds r0, r2, r4
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020090
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _08020090
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020090
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _080200EC @ =sub_801EC3C
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020090
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020090:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020166
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _08020166
	mov r2, sl
	cmp r2, #0xa7
	bgt _08020166
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080200C0
	ldr r0, _080200F4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020166
_080200C0:
	mov r2, sb
	adds r2, #0x23
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _080200D2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080200F8
_080200D2:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0, #0x18]
	mov r0, sb
	strh r1, [r0, #0x16]
	mov r2, sl
	strh r2, [r0, #0x18]
	bl sub_80051E8
	movs r4, #1
	str r4, [sp, #0x10]
	b _08020166
	.align 2, 0
_080200EC: .4byte sub_801EC3C
_080200F0: .4byte 0x000002B6
_080200F4: .4byte gUnknown_03005590
_080200F8:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080201A0 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _080201A4 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020166
	ldr r1, _080201A8 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _080201AC @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _080201B0 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020166:
	ldrh r1, [r5, #0x10]
	ldr r2, _080201B4 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802017E:
	strh r0, [r5, #0xc]
_08020180:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _0802018E
	b _0801FEB8
_0802018E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080201A0: .4byte gUnknown_030022D0
_080201A4: .4byte iwram_end
_080201A8: .4byte 0x040000D4
_080201AC: .4byte 0x80000003
_080201B0: .4byte 0x000001FF
_080201B4: .4byte 0x0000FFFC

	thumb_func_start sub_80201B8
sub_80201B8: @ 0x080201B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0802032C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020330 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _08020334 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _08020338 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl sub_8004558
	movs r2, #0x1f
	str r2, [sp, #0x14]
_080201F8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020200
	b _080204DC
_08020200:
	movs r4, #8
	ldrsh r1, [r5, r4]
	ldr r0, _0802033C @ =gUnknown_030054FC
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r2, [r5]
	adds r2, r2, r1
	str r2, [r5]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	ldr r0, _08020340 @ =gUnknown_030054E0
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	asrs r2, r2, #8
	mov r8, r2
	mov ip, r8
	asrs r7, r0, #8
	ldr r1, _08020344 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov sl, r0
	ldr r4, _08020348 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _08020248
	b _08020360
_08020248:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0802025E
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0802025E
	b _08020360
_0802025E:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802026A
	b _08020360
_0802026A:
	adds r6, r2, #0
	adds r6, #0x38
	mov r2, r8
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0802028C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020298
	cmp r2, r1
	blt _08020360
_0802028C:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_08020298:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080202B2
	cmp r7, r1
	bge _080202BE
	cmp r2, r1
	blt _08020360
_080202B2:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_080202BE:
	mov r2, ip
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _0802034C @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020350 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020312
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020312
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020312
	ldr r1, _08020358 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802030A
	movs r0, #0xff
_0802030A:
	strb r0, [r1]
	ldr r1, _0802035C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020312:
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020326
	ldr r1, _0802034C @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020326
	movs r0, #0xff
	strh r0, [r1]
_08020326:
	movs r0, #0
	b _080204DA
	.align 2, 0
_0802032C: .4byte gCurTask
_08020330: .4byte IWRAM_START + 0x30
_08020334: .4byte IWRAM_START + 0x2B0
_08020338: .4byte IWRAM_START + 0x2B4
_0802033C: .4byte gUnknown_030054FC
_08020340: .4byte gUnknown_030054E0
_08020344: .4byte gCamera
_08020348: .4byte gPlayer
_0802034C: .4byte gRingCount
_08020350: .4byte gCurrentLevel
_08020354: .4byte gGameMode
_08020358: .4byte gNumLives
_0802035C: .4byte gUnknown_030054A8
_08020360:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	ble _0802039A
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802039A
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	ldr r0, _08020448 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802039A
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802039A:
	ldr r1, [sp, #4]
	ldr r2, _0802044C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080203E8
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _080203E8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080203E8
	adds r0, r7, #0
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _08020448 @ =sub_801EC3C
	str r1, [sp]
	mov r1, r8
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080203E8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080203E8:
	ldrh r0, [r5, #0xa]
	ldr r2, [sp, #8]
	adds r0, r0, r2
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _080204C2
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _080204C2
	mov r4, sl
	cmp r4, #0xa7
	bgt _080204C2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020418
	ldr r0, _08020450 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080204C2
_08020418:
	mov r2, sb
	adds r2, #0x23
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0802042A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020454
_0802042A:
	movs r0, #0xff
	strb r0, [r2]
	mov r1, sp
	ldrh r2, [r1, #0x18]
	mov r1, sb
	strh r2, [r1, #0x16]
	mov r4, sl
	strh r4, [r1, #0x18]
	mov r0, sb
	bl sub_80051E8
	movs r0, #1
	str r0, [sp, #0x10]
	b _080204C2
	.align 2, 0
_08020448: .4byte sub_801EC3C
_0802044C: .4byte 0x000002B6
_08020450: .4byte gUnknown_03005590
_08020454:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080204FC @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _08020500 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _080204C2
	ldr r1, _08020504 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020508 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _0802050C @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_080204C2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020510 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_080204DA:
	strh r0, [r5, #0xc]
_080204DC:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _080204EA
	b _080201F8
_080204EA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080204FC: .4byte gUnknown_030022D0
_08020500: .4byte iwram_end
_08020504: .4byte 0x040000D4
_08020508: .4byte 0x80000003
_0802050C: .4byte 0x000001FF
_08020510: .4byte 0x0000FFFC

	thumb_func_start sub_8020514
sub_8020514: @ 0x08020514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _08020694 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020698 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, _0802069C @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080206A0 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sb
	bl sub_8004558
	movs r1, #0
	mov sl, r1
_08020554:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0802055C
	b _0802068A
_0802055C:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r6, r1, #8
	asrs r7, r0, #8
	ldr r1, _080206A4 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	str r0, [sp, #0x14]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r2, _080206A8 @ =gPlayer
	mov ip, r2
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	ldrh r4, [r5, #0xc]
	mov r8, r4
	mov r0, sl
	adds r0, #1
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r8, r1
	ble _080205A4
	b _080207E8
_080205A4:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _080205BC
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080205BC
	b _080206C0
_080205BC:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080205CA
	b _080206C0
_080205CA:
	adds r4, r2, #0
	adds r4, #0x38
	adds r2, r6, #0
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080205EC
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _080205F8
	cmp r2, r1
	blt _080206C0
_080205EC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_080205F8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020614
	cmp r7, r1
	bge _08020620
	cmp r2, r1
	blt _080206C0
_08020614:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_08020620:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _080206AC @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _080206B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020672
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020672
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020672
	ldr r1, _080206B8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802066A
	movs r0, #0xff
_0802066A:
	strb r0, [r1]
	ldr r1, _080206BC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020672:
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020686
	ldr r1, _080206AC @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020686
	movs r0, #0xff
	strh r0, [r1]
_08020686:
	movs r0, #0
	strh r0, [r5, #0xc]
_0802068A:
	adds r5, #0x14
	mov r2, sl
	adds r2, #1
	str r2, [sp, #0x1c]
	b _08020966
	.align 2, 0
_08020694: .4byte gCurTask
_08020698: .4byte IWRAM_START + 0x30
_0802069C: .4byte IWRAM_START + 0x2B0
_080206A0: .4byte IWRAM_START + 0x2B4
_080206A4: .4byte gCamera
_080206A8: .4byte gPlayer
_080206AC: .4byte gRingCount
_080206B0: .4byte gCurrentLevel
_080206B4: .4byte gGameMode
_080206B8: .4byte gNumLives
_080206BC: .4byte gUnknown_030054A8
_080206C0:
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	mov r4, sl
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	cmp r8, r0
	ble _080206D4
	b _080207E8
_080206D4:
	movs r1, #0
	mov r8, r1
_080206D8:
	ldr r0, _08020708 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r8, r0
	beq _080207D8
	ldr r1, _0802070C @ =gMultiplayerPlayerTasks
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080207D8
	ldrh r4, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r3, r4
	mov ip, r3
	ldr r0, _08020710 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020714
	ldrb r0, [r3, #0xa]
	b _08020738
	.align 2, 0
_08020708: .4byte 0x04000128
_0802070C: .4byte gMultiplayerPlayerTasks
_08020710: .4byte gGameMode
_08020714:
	mov r0, ip
	ldrb r1, [r0, #0xa]
	ldr r2, _080207CC @ =gPlayerCharacterIdleAnims
	mov sl, r2
	ldr r2, _080207D0 @ =gMultiplayerCharacters
	ldr r3, _080207D4 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020738:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020750
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080207D8
_08020750:
	adds r3, r6, #0
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020774
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _08020786
	cmp r3, r1
	blt _080207D8
_08020774:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_08020786:
	adds r3, r7, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _080207A8
	cmp r7, r1
	bge _080207BA
	cmp r3, r1
	blt _080207D8
_080207A8:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_080207BA:
	lsls r0, r6, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _08020962
	.align 2, 0
_080207CC: .4byte gPlayerCharacterIdleAnims
_080207D0: .4byte gMultiplayerCharacters
_080207D4: .4byte IWRAM_START + 0x56
_080207D8:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080207E8
	b _080206D8
_080207E8:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020826
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020826
	adds r0, r7, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _080208D0 @ =sub_801EC3C
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020826
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020826:
	ldr r4, [sp, #4]
	ldr r1, _080208D4 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020870
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020870
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020870
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _080208D0 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020870
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020870:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	subs r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x14]
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802094A
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	cmp r1, r0
	ble _0802094A
	cmp r1, #0xa7
	bgt _0802094A
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080208A0
	ldr r0, _080208D8 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802094A
_080208A0:
	mov r2, sb
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _080208B2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080208DC
_080208B2:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x14]
	mov r4, sb
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x18]
	strh r1, [r4, #0x18]
	mov r0, sb
	bl sub_80051E8
	movs r2, #1
	str r2, [sp, #0x10]
	b _0802094A
	.align 2, 0
_080208D0: .4byte sub_801EC3C
_080208D4: .4byte 0x000002B6
_080208D8: .4byte gUnknown_03005590
_080208DC:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020980 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r3, sb
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _08020984 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0802094A
	ldr r1, _08020988 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0802098C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x18]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r4, _08020990 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_0802094A:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020994 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08020962:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x20]
_08020966:
	ldr r3, [sp, #0x1c]
	mov sl, r3
	cmp r3, #0x1f
	bgt _08020970
	b _08020554
_08020970:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020980: .4byte gUnknown_030022D0
_08020984: .4byte iwram_end
_08020988: .4byte 0x040000D4
_0802098C: .4byte 0x80000003
_08020990: .4byte 0x000001FF
_08020994: .4byte 0x0000FFFC

	thumb_func_start sub_8020998
sub_8020998: @ 0x08020998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _080209E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _080209EC @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sl, r2
	ldr r3, _080209F0 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080209F4 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sl
	bl sub_8004558
	movs r1, #0
	str r1, [sp, #0x14]
_080209D8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _080209F8
	adds r5, #0x14
	ldr r2, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_080209E8: .4byte gCurTask
_080209EC: .4byte IWRAM_START + 0x30
_080209F0: .4byte IWRAM_START + 0x2B0
_080209F4: .4byte IWRAM_START + 0x2B4
_080209F8:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r1, r1, #8
	mov sb, r1
	mov r8, sb
	asrs r6, r0, #8
	ldr r1, _08020B34 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	str r0, [sp, #0x1c]
	ldr r3, _08020B38 @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020A44
	b _08020C70
_08020A44:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020A5C
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020A5C
	b _08020B50
_08020A5C:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020B50
	adds r4, r2, #0
	adds r4, #0x38
	mov r2, sb
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020A8A
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08020A96
	cmp r2, r1
	blt _08020B50
_08020A8A:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020A96:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020AB2
	cmp r6, r1
	bge _08020ABE
	cmp r2, r1
	blt _08020B50
_08020AB2:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020ABE:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08020B3C @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020B40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020B12
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020B12
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020B12
	ldr r1, _08020B48 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020B0A
	movs r0, #0xff
_08020B0A:
	strb r0, [r1]
	ldr r1, _08020B4C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020B12:
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020B26
	ldr r1, _08020B3C @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020B26
	movs r0, #0xff
	strh r0, [r1]
_08020B26:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_08020B34: .4byte gCamera
_08020B38: .4byte gPlayer
_08020B3C: .4byte gRingCount
_08020B40: .4byte gCurrentLevel
_08020B44: .4byte gGameMode
_08020B48: .4byte gNumLives
_08020B4C: .4byte gUnknown_030054A8
_08020B50:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020B64
	b _08020C70
_08020B64:
	movs r7, #0
_08020B66:
	ldr r0, _08020B94 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08020C64
	ldr r1, _08020B98 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08020C64
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08020B9C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020BA0
	ldrb r0, [r2, #0xa]
	b _08020BC2
	.align 2, 0
_08020B94: .4byte 0x04000128
_08020B98: .4byte gMultiplayerPlayerTasks
_08020B9C: .4byte gGameMode
_08020BA0:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _08020C58 @ =gMultiplayerCharacters
	ldr r3, _08020C5C @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08020C60 @ =gPlayerCharacterIdleAnims
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020BC2:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020BDA
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08020C64
_08020BDA:
	mov r3, r8
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020BFE
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020C10
	cmp r3, r1
	blt _08020C64
_08020BFE:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C10:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08020C32
	cmp r6, r1
	bge _08020C44
	cmp r3, r1
	blt _08020C64
_08020C32:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C44:
	mov r1, r8
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _08020DEA
	.align 2, 0
_08020C58: .4byte gMultiplayerCharacters
_08020C5C: .4byte IWRAM_START + 0x56
_08020C60: .4byte gPlayerCharacterIdleAnims
_08020C64:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08020C70
	b _08020B66
_08020C70:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020CAA
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CAA
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08020D58 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sb
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020CAA
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CAA:
	ldr r4, [sp, #4]
	ldr r1, _08020D5C @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020CF8
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020CF8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CF8
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08020D58 @ =sub_801EC3C
	str r1, [sp]
	mov r1, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020CF8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CF8:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020DD2
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	ble _08020DD2
	cmp r1, #0xa7
	bgt _08020DD2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020D28
	ldr r0, _08020D60 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020DD2
_08020D28:
	mov r2, sl
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _08020D3A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020D64
_08020D3A:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x18]
	mov r4, sl
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x1c]
	strh r1, [r4, #0x18]
	mov r0, sl
	bl sub_80051E8
	movs r2, #1
	str r2, [sp, #0x10]
	b _08020DD2
	.align 2, 0
_08020D58: .4byte sub_801EC3C
_08020D5C: .4byte 0x000002B6
_08020D60: .4byte gUnknown_03005590
_08020D64:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020E08 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r3, sl
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _08020E0C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020DD2
	ldr r1, _08020E10 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020E14 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sl
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x1c]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sl
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _08020E18 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020DD2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020E1C @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08020DEA:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_08020DEE:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x14]
	cmp r3, #0x1f
	bgt _08020DF8
	b _080209D8
_08020DF8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020E08: .4byte gUnknown_030022D0
_08020E0C: .4byte iwram_end
_08020E10: .4byte 0x040000D4
_08020E14: .4byte 0x80000003
_08020E18: .4byte 0x000001FF
_08020E1C: .4byte 0x0000FFFC

	thumb_func_start sub_8020E20
sub_8020E20: @ 0x08020E20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _08020E70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020E74 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _08020E78 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _08020E7C @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl sub_8004558
	movs r1, #0
	str r1, [sp, #0x18]
_08020E60:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020E80
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08020E70: .4byte gCurTask
_08020E74: .4byte IWRAM_START + 0x30
_08020E78: .4byte IWRAM_START + 0x2B0
_08020E7C: .4byte IWRAM_START + 0x2B4
_08020E80:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _08020EAE
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _0802131E
_08020EAE:
	ldr r0, _08020ECC @ =0x0000EFFF
	cmp r2, r0
	bgt _08020ED4
	ldr r0, _08020ED0 @ =0x00011FFF
	cmp r3, r0
	bgt _08020ED4
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _08020EF2
	.align 2, 0
_08020ECC: .4byte 0x0000EFFF
_08020ED0: .4byte 0x00011FFF
_08020ED4:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _08020EF4
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08020EF4
	ldr r3, _08021020 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _08021024 @ =0xFFFCA000
	adds r0, r1, r4
_08020EF2:
	str r0, [r5, #4]
_08020EF4:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r6, r0, #8
	ldr r1, _08021028 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r6, r0
	mov r8, r0
	ldr r3, _0802102C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08020F30
	b _08021164
_08020F30:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020F48
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020F48
	b _08021044
_08020F48:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08021044
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F76
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _08020F82
	cmp r2, r1
	blt _08021044
_08020F76:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020F82:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F9E
	cmp r6, r1
	bge _08020FAA
	cmp r2, r1
	blt _08021044
_08020F9E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020FAA:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08021030 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08021034 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020FFE
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020FFE
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020FFE
	ldr r1, _0802103C @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020FF6
	movs r0, #0xff
_08020FF6:
	strb r0, [r1]
	ldr r1, _08021040 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020FFE:
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021012
	ldr r1, _08021030 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08021012
	movs r0, #0xff
	strh r0, [r1]
_08021012:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08021020: .4byte 0xFFFA6000
_08021024: .4byte 0xFFFCA000
_08021028: .4byte gCamera
_0802102C: .4byte gPlayer
_08021030: .4byte gRingCount
_08021034: .4byte gCurrentLevel
_08021038: .4byte gGameMode
_0802103C: .4byte gNumLives
_08021040: .4byte gUnknown_030054A8
_08021044:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08021058
	b _08021164
_08021058:
	movs r7, #0
_0802105A:
	ldr r0, _08021088 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08021158
	ldr r1, _0802108C @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08021158
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08021090 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021094
	ldrb r0, [r2, #0xa]
	b _080210B6
	.align 2, 0
_08021088: .4byte 0x04000128
_0802108C: .4byte gMultiplayerPlayerTasks
_08021090: .4byte gGameMode
_08021094:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _0802114C @ =gMultiplayerCharacters
	ldr r3, _08021150 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08021154 @ =gPlayerCharacterIdleAnims
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_080210B6:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080210CE
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08021158
_080210CE:
	mov r3, sb
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _080210F2
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08021104
	cmp r3, r1
	blt _08021158
_080210F2:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021104:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08021126
	cmp r6, r1
	bge _08021138
	cmp r3, r1
	blt _08021158
_08021126:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021138:
	mov r1, sb
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _0802131A
	.align 2, 0
_0802114C: .4byte gMultiplayerCharacters
_08021150: .4byte IWRAM_START + 0x56
_08021154: .4byte gPlayerCharacterIdleAnims
_08021158:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08021164
	b _0802105A
_08021164:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0802119E
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802119E
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08021220 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802119E
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802119E:
	ldr r4, [sp, #4]
	ldr r1, _08021224 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080211EC
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _080211EC
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080211EC
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08021220 @ =sub_801EC3C
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080211EC
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080211EC:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #0xc]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802120A
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _0802120A
	mov r0, r8
	cmp r0, #0xa7
	ble _0802123C
_0802120A:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08021230
	ldr r1, _08021228 @ =0xFFFFFA60
	add sl, r1
	ldr r2, _0802122C @ =0xFFFFFCA0
	add r8, r2
	b _0802123C
	.align 2, 0
_08021220: .4byte sub_801EC3C
_08021224: .4byte 0x000002B6
_08021228: .4byte 0xFFFFFA60
_0802122C: .4byte 0xFFFFFCA0
_08021230:
	movs r3, #0xb4
	lsls r3, r3, #3
	add sl, r3
	movs r4, #0xd8
	lsls r4, r4, #2
	add r8, r4
_0802123C:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _08021302
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _08021302
	mov r0, r8
	cmp r0, #0xa7
	bgt _08021302
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08021264
	ldr r0, _08021290 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021302
_08021264:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _08021276
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08021294
_08021276:
	movs r0, #0xff
	strb r0, [r2]
	mov r3, sl
	ldr r2, [sp, #8]
	strh r3, [r2, #0x16]
	mov r4, r8
	strh r4, [r2, #0x18]
	ldr r0, [sp, #8]
	bl sub_80051E8
	movs r0, #1
	str r0, [sp, #0x14]
	b _08021302
	.align 2, 0
_08021290: .4byte gUnknown_03005590
_08021294:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08021338 @ =gUnknown_030022D0
	adds r4, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0802133C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08021302
	ldr r1, _08021340 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08021344 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _08021348 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08021302:
	ldrh r1, [r5, #0x10]
	ldr r2, _0802134C @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802131A:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_0802131E:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _08021328
	b _08020E60
_08021328:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021338: .4byte gUnknown_030022D0
_0802133C: .4byte iwram_end
_08021340: .4byte 0x040000D4
_08021344: .4byte 0x80000003
_08021348: .4byte 0x000001FF
_0802134C: .4byte 0x0000FFFC

	thumb_func_start sub_8021350
sub_8021350: @ 0x08021350
	push {r4, lr}
	ldr r4, _08021364 @ =gUnknown_030059D8
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021364: .4byte gUnknown_030059D8

	thumb_func_start sub_8021368
sub_8021368: @ 0x08021368
	push {lr}
	ldr r0, _0802137C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021380
	bl sub_801FE78
	b _08021384
	.align 2, 0
_0802137C: .4byte gUnknown_03005424
_08021380:
	bl sub_80201B8
_08021384:
	pop {r0}
	bx r0

	thumb_func_start sub_8021388
sub_8021388: @ 0x08021388
	push {lr}
	ldr r0, _0802139C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080213A0
	bl sub_8020514
	b _080213A4
	.align 2, 0
_0802139C: .4byte gUnknown_03005424
_080213A0:
	bl sub_8020998
_080213A4:
	pop {r0}
	bx r0

	thumb_func_start sub_80213A8
sub_80213A8: @ 0x080213A8
	push {lr}
	bl sub_8020E20
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80213B4
sub_80213B4: @ 0x080213B4
	ldr r1, _080213BC @ =gUnknown_030059D8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080213BC: .4byte gUnknown_030059D8

	thumb_func_start sub_80213C0
sub_80213C0: @ 0x080213C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r2, #0
	adds r0, r5, #0
	adds r0, #0x60
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, _08021408 @ =sub_8023FC0
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _0802140C @ =TaskDestructor_802A07C
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0
	strb r4, [r0]
	str r1, [r0, #4]
	ldr r0, _08021410 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802141C
	cmp r0, #5
	beq _08021418
	ldr r1, _08021414 @ =gRingCount
	movs r0, #1
	strh r0, [r1]
	b _0802141C
	.align 2, 0
_08021408: .4byte sub_8023FC0
_0802140C: .4byte TaskDestructor_802A07C
_08021410: .4byte gGameMode
_08021414: .4byte gRingCount
_08021418:
	ldr r0, _08021474 @ =gRingCount
	strh r1, [r0]
_0802141C:
	adds r0, r5, #0
	bl sub_8021694
	ldr r1, _08021478 @ =gPlayer
	ldr r0, _0802147C @ =PlayerCB_8025318
	str r0, [r1]
	bl sub_801F754
	bl sub_801FC2C
	ldr r6, _08021480 @ =gInputRecorder
	ldrb r4, [r6, #8]
	cmp r4, #1
	beq _0802143C
	cmp r4, #2
	bne _08021442
_0802143C:
	bl InputRecorderLoadTape
	strb r4, [r6, #8]
_08021442:
	ldr r0, _08021484 @ =gUnknown_030054D0
	movs r1, #0
	str r1, [r0]
	ldr r0, _08021488 @ =gUnknown_030054FC
	str r1, [r0]
	ldr r0, _0802148C @ =gUnknown_030054E0
	str r1, [r0]
	bl sub_800E16C
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8021490
	adds r0, r5, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8021554
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021474: .4byte gRingCount
_08021478: .4byte gPlayer
_0802147C: .4byte PlayerCB_8025318
_08021480: .4byte gInputRecorder
_08021484: .4byte gUnknown_030054D0
_08021488: .4byte gUnknown_030054FC
_0802148C: .4byte gUnknown_030054E0

	thumb_func_start sub_8021490
sub_8021490: @ 0x08021490
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, #0x60
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r6, #0
	adds r4, #0xc
	cmp r7, #0
	bne _080214AC
	ldr r0, _080214A8 @ =0x06010000
	b _080214B2
	.align 2, 0
_080214A8: .4byte 0x06010000
_080214AC:
	movs r0, #0x40
	bl VramMalloc
_080214B2:
	str r0, [r4, #4]
	movs r2, #0
	strh r2, [r4, #8]
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r7, #0
	adds r0, #0x10
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08021508 @ =gGameMode
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #2
	bls _08021510
	ldr r0, _0802150C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r4, #0
	adds r1, #0x25
	b _08021516
	.align 2, 0
_08021508: .4byte gGameMode
_0802150C: .4byte 0x04000128
_08021510:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_08021516:
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r4, #0x10]
	ldrb r0, [r2]
	cmp r0, #2
	bls _0802152C
	movs r0, #0xc0
	lsls r0, r0, #0xc
	orrs r0, r1
	str r0, [r4, #0x10]
_0802152C:
	ldr r0, [r4, #0x10]
	movs r1, #0x20
	orrs r0, r1
	orrs r0, r7
	str r0, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021554
sub_8021554: @ 0x08021554
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, r1, #0
	adds r4, r0, #0
	adds r4, #0xc
	adds r6, r0, #0
	adds r0, r7, #0
	adds r0, #0x85
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #1
	bne _08021580
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x5f
	strh r0, [r4, #0xa]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r5, [r0]
	b _08021598
_08021580:
	cmp r5, #2
	bne _080215F8
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xba
	strh r0, [r4, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
_08021598:
	movs r1, #0
	strh r1, [r4, #8]
	adds r2, r4, #0
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080215D4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080215DC
	ldr r0, _080215D8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #3
	b _080215E2
	.align 2, 0
_080215D4: .4byte gGameMode
_080215D8: .4byte 0x04000128
_080215DC:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_080215E2:
	strb r0, [r1]
	ldr r0, _08021600 @ =0x00042024
	str r0, [r4, #0x10]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
_080215F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021600: .4byte 0x00042024

@ Called by sub_80299F0
	thumb_func_start sub_8021604
sub_8021604: @ 0x08021604
	push {r4, lr}
	adds r4, r1, #0
	mov ip, r3
	mov r1, ip
	adds r1, #0x60
	strb r2, [r1]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _08021638 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08021640
	ldr r1, _0802163C @ =gSpawnPositions
	lsls r2, r4, #2
	adds r0, r2, r1
	ldrh r3, [r0]
	mov r0, ip
	adds r0, #0x74
	strh r3, [r0]
	adds r1, #2
	adds r2, r2, r1
	ldrh r0, [r2]
	mov r3, ip
	adds r3, #0x76
	strh r0, [r3]
	b _0802166A
	.align 2, 0
_08021638: .4byte gGameMode
_0802163C: .4byte gSpawnPositions
_08021640:
	ldr r0, _08021688 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x74
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb1
	strh r0, [r1]
	subs r0, #0xb2
	mov r1, ip
	str r0, [r1, #8]
	str r0, [r1, #0xc]
_0802166A:
	mov r1, ip
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
	mov r2, ip
	str r0, [r2, #0x78]
	subs r1, #8
	ldr r0, _0802168C @ =gUnknown_03005AF0
	str r0, [r1]
	adds r1, #4
	ldr r0, _08021690 @ =gUnknown_03005AA0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021688: .4byte 0x04000128
_0802168C: .4byte gUnknown_03005AF0
_08021690: .4byte gUnknown_03005AA0

@ In:
@  r0: Player*
	thumb_func_start sub_8021694
sub_8021694: @ 0x08021694
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080216B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080216B8
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ands r0, r1
	adds r0, #1
	cmp r0, #0
	beq _080216B8
	movs r0, #0xe6
	lsls r0, r0, #9
	b _080216C2
	.align 2, 0
_080216B4: .4byte gGameMode
_080216B8:
	adds r0, r5, #0
	adds r0, #0x74
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
_080216C2:
	str r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x76
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _0802181C @ =PlayerCB_8025318
	str r0, [r5]
	ldr r0, _08021820 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	orrs r2, r1
	ldrh r0, [r0, #4]
	orrs r2, r0
	adds r0, r5, #0
	adds r0, #0x5c
	movs r3, #0
	movs r4, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
	strh r4, [r5, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xe
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	strb r3, [r0]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	strh r4, [r5, #0x26]
	adds r0, r5, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #4
	str r0, [r5, #0x40]
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r5, #0x44]
	movs r0, #8
	str r0, [r5, #0x48]
	movs r0, #0x40
	str r0, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, #0x2e
	ldr r0, _08021824 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	strh r4, [r5, #0x30]
	strh r4, [r5, #0x32]
	str r4, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r3, [r0]
	strh r4, [r5, #0x2a]
	adds r1, #8
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0x23
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r5, #0
	adds r1, #0x86
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6d
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0x15
	strb r3, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #0x14
	strb r3, [r0]
	adds r0, #5
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	subs r0, #0x3a
	strb r3, [r0]
	bl sub_8015750
	bl sub_801561C
	adds r0, r5, #0
	bl sub_802989C
	adds r1, r5, #0
	adds r1, #0x99
	movs r2, #3
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0x60
	movs r0, #0x85
	adds r0, r0, r5
	mov ip, r0
	movs r3, #0
_080217EA:
	stm r1!, {r3}
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080217EA
	movs r0, #0x7f
	strb r0, [r6]
	movs r2, #0
	ldrsb r2, [r4, r2]
	cmp r2, #0
	bne _08021840
	ldr r0, _08021828 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08021840
	ldr r3, _0802182C @ =gCourseTime
	ldr r1, [r3]
	ldr r0, _08021830 @ =0x00008C9F
	cmp r1, r0
	bls _08021838
	ldr r0, _08021834 @ =gCheckpointTime
	str r2, [r0]
	str r2, [r3]
	str r2, [r5, #0x78]
	b _08021840
	.align 2, 0
_0802181C: .4byte PlayerCB_8025318
_08021820: .4byte gPlayerControls
_08021824: .4byte 0x0000FFFF
_08021828: .4byte gGameMode
_0802182C: .4byte gCourseTime
_08021830: .4byte 0x00008C9F
_08021834: .4byte gCheckpointTime
_08021838:
	ldr r1, _08021854 @ =gCheckpointTime
	ldr r0, [r5, #0x78]
	str r0, [r1]
	str r0, [r3]
_08021840:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	bhi _080218C2
	lsls r0, r0, #2
	ldr r1, _08021858 @ =_0802185C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021854: .4byte gCheckpointTime
_08021858: .4byte _0802185C
_0802185C: @ jump table
	.4byte _08021870 @ case 0
	.4byte _08021882 @ case 1
	.4byte _08021896 @ case 2
	.4byte _080218A8 @ case 3
	.4byte _080218BA @ case 4
_08021870:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080218C2
_08021882:
	adds r0, r5, #0
	adds r0, #0xae
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
	b _080218C2
_08021896:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	str r1, [r0]
	subs r0, #3
	strb r1, [r0]
	b _080218C2
_080218A8:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080218C2
_080218BA:
	adds r1, r5, #0
	adds r1, #0xac
	movs r0, #0
	strb r0, [r1]
_080218C2:
	ldr r1, _080218D8 @ =IWRAM_START + 0x5B7C
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080218DC @ =gUnknown_03005840
	movs r1, #0
	str r1, [r0]
	ldr r0, _080218E0 @ =gUnknown_0300583C
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080218D8: .4byte IWRAM_START + 0x5B7C
_080218DC: .4byte gUnknown_03005840
_080218E0: .4byte gUnknown_0300583C

	thumb_func_start sub_80218E4
sub_80218E4: @ 0x080218E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080218FA
	ldr r0, _08021950 @ =0x00000119
	bl m4aSongNumStop
_080218FA:
	ldr r0, [r4, #0x20]
	ldr r1, _08021954 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x85
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _0802192C
	movs r0, #0x78
	bl m4aSongNumStop
_0802192C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0802193A
	movs r0, #0xe3
	bl m4aSongNumStop
_0802193A:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802194A
	ldr r0, [r4, #0x20]
	ldr r1, _08021958 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
_0802194A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021950: .4byte 0x00000119
_08021954: .4byte 0xCEF118CF
_08021958: .4byte 0xFDFFFFFF

	thumb_func_start sub_802195C
sub_802195C: @ 0x0802195C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021974
	add r6, sp, #8
_08021974:
	cmp r7, #0
	bne _0802197A
	add r7, sp, #0xc
_0802197A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021A10 @ =0x000002FF
	cmp r0, r5
	bgt _080219A6
	movs r0, #0x80
	orrs r2, r0
_080219A6:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021A14 @ =sub_801ED24
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021A10 @ =0x000002FF
	cmp r0, r3
	bgt _080219EA
	movs r0, #0x80
	orrs r2, r0
_080219EA:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021A18
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021A20
	.align 2, 0
_08021A10: .4byte 0x000002FF
_08021A14: .4byte sub_801ED24
_08021A18:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021A20:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021A34
sub_8021A34: @ 0x08021A34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021A4C
	add r6, sp, #8
_08021A4C:
	cmp r7, #0
	bne _08021A52
	add r7, sp, #0xc
_08021A52:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021AE4 @ =0x000002FF
	cmp r0, r5
	bgt _08021A7E
	movs r0, #0x80
	orrs r2, r0
_08021A7E:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021AE8 @ =sub_801ED24
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021AE4 @ =0x000002FF
	cmp r0, r3
	bgt _08021AC0
	movs r0, #0x80
	orrs r2, r0
_08021AC0:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021AEC
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021AF4
	.align 2, 0
_08021AE4: .4byte 0x000002FF
_08021AE8: .4byte sub_801ED24
_08021AEC:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021AF4:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021B08
sub_8021B08: @ 0x08021B08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021B20
	add r6, sp, #8
_08021B20:
	cmp r7, #0
	bne _08021B26
	add r7, sp, #0xc
_08021B26:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021BBC @ =0x000002FF
	cmp r0, r5
	bgt _08021B52
	movs r0, #0x80
	orrs r2, r0
_08021B52:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021BC0 @ =sub_801EE64
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021BBC @ =0x000002FF
	cmp r0, r3
	bgt _08021B96
	movs r0, #0x80
	orrs r2, r0
_08021B96:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021BC4
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021BCC
	.align 2, 0
_08021BBC: .4byte 0x000002FF
_08021BC0: .4byte sub_801EE64
_08021BC4:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021BCC:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021BE0
sub_8021BE0: @ 0x08021BE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _08021C34
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08021C08
	ldr r0, _08021C2C @ =gPlayer
	ldr r1, _08021C30 @ =PlayerCB_8025318
	str r1, [r0]
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08021C08:
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08021C22
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
_08021C22:
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _08021C3C
	.align 2, 0
_08021C2C: .4byte gPlayer
_08021C30: .4byte PlayerCB_8025318
_08021C34:
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08021C3C:
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021C4C
sub_8021C4C: @ 0x08021C4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021CF8 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _08021C7E
	movs r2, #0x80
	orrs r2, r5
_08021C7E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _08021CFC @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021CA2
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021CA2:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _08021CC0
	movs r0, #0x80
	orrs r2, r0
_08021CC0:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021CDE
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021CDE:
	add r2, sp, #0xc
	ldr r0, _08021D00 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021D04
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
	b _08021D0C
	.align 2, 0
_08021CF8: .4byte 0x000002FF
_08021CFC: .4byte sub_801ED24
_08021D00: .4byte gUnknown_03005424
_08021D04:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
_08021D0C:
	adds r2, r0, #0
	cmp r2, #0
	bge _08021DAA
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	adds r1, #6
	rsbs r1, r1, #0
	cmp r2, r1
	bge _08021D26
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _08021DAA
_08021D26:
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _08021D70 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021D3E
	rsbs r2, r2, #0
_08021D3E:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8021BE0
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08021D74
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xbd
	lsls r1, r1, #4
	cmp r0, r1
	ble _08021D8E
	strh r1, [r4, #0x12]
	b _08021D8E
	.align 2, 0
_08021D70: .4byte gUnknown_03005424
_08021D74:
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08021D86
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	b _08021DA8
_08021D86:
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_08021D8E:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08021D98
	rsbs r1, r1, #0
_08021D98:
	strh r1, [r4, #0x14]
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08021DAA
	rsbs r0, r1, #0
_08021DA8:
	strh r0, [r4, #0x14]
_08021DAA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021DB8
sub_8021DB8: @ 0x08021DB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021E64 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _08021DEA
	movs r2, #0x80
	orrs r2, r5
_08021DEA:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _08021E68 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021E0E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021E0E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _08021E2C
	movs r0, #0x80
	orrs r2, r0
_08021E2C:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021E4A
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021E4A:
	add r2, sp, #0xc
	ldr r0, _08021E6C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021E70
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
	b _08021E78
	.align 2, 0
_08021E64: .4byte 0x000002FF
_08021E68: .4byte sub_801ED24
_08021E6C: .4byte gUnknown_03005424
_08021E70:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
_08021E78:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021ED4
	ldr r0, _08021ECC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021E8C
	rsbs r2, r2, #0
_08021E8C:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08021ED0
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #0x40
	cmp r0, #0
	ble _08021ED0
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_8021BE0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08021EC8
	rsbs r0, r0, #0
_08021EC8:
	strh r0, [r4, #0x14]
	b _08021ED4
	.align 2, 0
_08021ECC: .4byte gUnknown_03005424
_08021ED0:
	movs r0, #0
	strh r0, [r4, #0x12]
_08021ED4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021EE4
sub_8021EE4: @ 0x08021EE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov ip, r0
	ldr r0, _08021F20 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08021F28
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r3, #0x88
	movs r2, #0
	str r2, [sp]
	ldr r2, _08021F24 @ =sub_801ED24
	str r2, [sp, #4]
	mov r2, ip
	b _08021F54
	.align 2, 0
_08021F20: .4byte gUnknown_03005424
_08021F24: .4byte sub_801ED24
_08021F28:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r7, r0, r1
	ldr r0, [r5, #0xc]
	asrs r6, r0, #8
	mov r2, ip
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _08021F88 @ =0x000002FF
	cmp r1, r0
	bgt _08021F46
	orrs r2, r3
_08021F46:
	movs r3, #8
	rsbs r3, r3, #0
	str r4, [sp]
	ldr r0, _08021F8C @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
_08021F54:
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021F6E
	lsls r1, r2, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
_08021F6E:
	ldr r0, _08021F90 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r4, sp, #0xc
	cmp r0, #0
	beq _08021F94
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
	b _08021F9E
	.align 2, 0
_08021F88: .4byte 0x000002FF
_08021F8C: .4byte sub_801ED24
_08021F90: .4byte gUnknown_03005424
_08021F94:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
_08021F9E:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021FCC
	ldr r0, _08021FC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021FB2
	rsbs r2, r2, #0
_08021FB2:
	lsls r0, r2, #8
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	str r1, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0802202E
	movs r0, #0
	strh r0, [r5, #0x12]
	b _0802202E
	.align 2, 0
_08021FC8: .4byte gUnknown_03005424
_08021FCC:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0802202E
	ldr r0, _08021FEC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021FF0
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
	b _08021FFA
	.align 2, 0
_08021FEC: .4byte gUnknown_03005424
_08021FF0:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
_08021FFA:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802202E
	ldr r0, _08022038 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802200E
	rsbs r2, r2, #0
_0802200E:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0802202E:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022038: .4byte gUnknown_03005424

	thumb_func_start sub_802203C
sub_802203C: @ 0x0802203C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r7, [r0]
	ldr r0, _08022074 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	mov ip, r0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0802207C
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08022078 @ =sub_801ED24
	str r2, [sp, #4]
	adds r2, r7, #0
	b _080220A6
	.align 2, 0
_08022074: .4byte gUnknown_03005424
_08022078: .4byte sub_801ED24
_0802207C:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r6, r0, r1
	ldr r0, [r5, #0xc]
	asrs r4, r0, #8
	adds r2, r7, #0
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _080220DC @ =0x000002FF
	cmp r1, r0
	bgt _0802209C
	mov r1, ip
	orrs r2, r1
_0802209C:
	str r3, [sp]
	ldr r0, _080220E0 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
_080220A6:
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _080220C2
	lsls r1, r2, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
_080220C2:
	ldr r0, _080220E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r4, sp, #0xc
	cmp r0, #0
	beq _080220E8
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
	b _080220F2
	.align 2, 0
_080220DC: .4byte 0x000002FF
_080220E0: .4byte sub_801ED24
_080220E4: .4byte gUnknown_03005424
_080220E8:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
_080220F2:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022120
	ldr r0, _0802211C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022106
	rsbs r2, r2, #0
_08022106:
	lsls r0, r2, #8
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	str r1, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08022182
	movs r0, #0
	strh r0, [r5, #0x12]
	b _08022182
	.align 2, 0
_0802211C: .4byte gUnknown_03005424
_08022120:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _08022182
	ldr r0, _08022140 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022144
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
	b _0802214E
	.align 2, 0
_08022140: .4byte gUnknown_03005424
_08022144:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
_0802214E:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022182
	ldr r0, _0802218C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022162
	rsbs r2, r2, #0
_08022162:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_08022182:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802218C: .4byte gUnknown_03005424

	thumb_func_start sub_8022190
sub_8022190: @ 0x08022190
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r3, [r4, #0x12]
	adds r5, r3, #0
	ldr r0, _080221E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	asrs r0, r0, #0x1f
	ands r0, r2
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bne _080221B8
	cmp r3, #0
	beq _080221C6
_080221B8:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
_080221C6:
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08022202
	cmp r0, #1
	bgt _080221E8
	cmp r0, #0
	beq _080221F2
	b _08022210
	.align 2, 0
_080221E4: .4byte gUnknown_03005424
_080221E8:
	cmp r0, #2
	beq _080221FA
	cmp r0, #3
	beq _0802220A
	b _08022210
_080221F2:
	adds r0, r4, #0
	bl sub_8021C4C
	b _08022210
_080221FA:
	adds r0, r4, #0
	bl sub_8021DB8
	b _08022210
_08022202:
	adds r0, r4, #0
	bl sub_8021EE4
	b _08022210
_0802220A:
	adds r0, r4, #0
	bl sub_802203C
_08022210:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8022218
sub_8022218: @ 0x08022218
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r2, sp, #4
	ldr r0, _08022238 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802223C
	adds r0, r5, #0
	mov r1, sp
	bl sub_8029AC0
	b _08022244
	.align 2, 0
_08022238: .4byte gUnknown_03005424
_0802223C:
	adds r0, r5, #0
	mov r1, sp
	bl sub_8029B0C
_08022244:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022278
	ldr r0, _08022280 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022258
	rsbs r2, r2, #0
_08022258:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_08022278:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022280: .4byte gUnknown_03005424

	thumb_func_start sub_8022284
sub_8022284: @ 0x08022284
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	ldr r0, _080222A4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080222A8
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029B0C
	b _080222B0
	.align 2, 0
_080222A4: .4byte gUnknown_03005424
_080222A8:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029AC0
_080222B0:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802230A
	ldr r0, _08022314 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080222C4
	rsbs r2, r2, #0
_080222C4:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8021BE0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _080222E6
	rsbs r1, r1, #0
_080222E6:
	strh r1, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080222F8
	rsbs r0, r1, #0
	strh r0, [r4, #0x14]
_080222F8:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802230A
	ldr r0, [r4, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #0x20]
_0802230A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022314: .4byte gUnknown_03005424

	thumb_func_start sub_8022318
sub_8022318: @ 0x08022318
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08022334
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #0xe
	strb r0, [r3, #0x17]
	adds r2, r3, #0
	adds r2, #0x64
	b _0802237A
_08022334:
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3, #0x20]
	adds r2, r3, #0
	adds r2, #0x64
	movs r0, #0
	strh r0, [r2]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	adds r4, r0, #0
	subs r4, #0xe
	ldr r0, _080223B8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802235A
	rsbs r4, r4, #0
_0802235A:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0802236A
	rsbs r4, r4, #0
_0802236A:
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #0xe
	strb r0, [r3, #0x17]
	lsls r1, r4, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
_0802237A:
	ldr r0, [r3, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1e
	ands r0, r1
	adds r1, #0x10
	ands r0, r1
	subs r1, #0xf0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x84
	movs r4, #0
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x61
	strb r4, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x5b
	ble _080223B0
	strh r4, [r2]
_080223B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080223B8: .4byte gUnknown_03005424

	thumb_func_start sub_80223BC
sub_80223BC: @ 0x080223BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08022480 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _080223EE
	movs r2, #0x80
	orrs r2, r5
_080223EE:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _08022484 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802241E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0802241E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0802243C
	movs r0, #0x80
	orrs r2, r0
_0802243C:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022466
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022466:
	add r2, sp, #0xc
	ldr r0, _08022488 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802248C
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
	b _08022494
	.align 2, 0
_08022480: .4byte 0x000002FF
_08022484: .4byte sub_801ED24
_08022488: .4byte gUnknown_03005424
_0802248C:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
_08022494:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080224CA
	ldr r0, _080224D8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080224A8
	rsbs r2, r2, #0
_080224A8:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_080224CA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080224D8: .4byte gUnknown_03005424

	thumb_func_start sub_80224DC
sub_80224DC: @ 0x080224DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _080225A0 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0802250E
	movs r2, #0x80
	orrs r2, r5
_0802250E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _080225A4 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802253E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0802253E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0802255C
	movs r0, #0x80
	orrs r2, r0
_0802255C:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022586
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022586:
	add r2, sp, #0xc
	ldr r0, _080225A8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080225AC
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
	b _080225B4
	.align 2, 0
_080225A0: .4byte 0x000002FF
_080225A4: .4byte sub_801ED24
_080225A8: .4byte gUnknown_03005424
_080225AC:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
_080225B4:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080225D4
	ldr r0, _080225E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080225C8
	rsbs r2, r2, #0
_080225C8:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
_080225D4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080225E4: .4byte gUnknown_03005424

	thumb_func_start sub_80225E8
sub_80225E8: @ 0x080225E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r5, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0802265C @ =0x000002FF
	cmp r1, r0
	bgt _08022612
	movs r0, #0x80
	orrs r2, r0
_08022612:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _08022660 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022642
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022642:
	ldr r0, _08022664 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r5, sp, #0xc
	cmp r0, #0
	beq _08022668
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
	b _08022672
	.align 2, 0
_0802265C: .4byte 0x000002FF
_08022660: .4byte sub_801ED24
_08022664: .4byte gUnknown_03005424
_08022668:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
_08022672:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080226A0
	ldr r0, _0802269C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022686
	rsbs r2, r2, #0
_08022686:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08022704
	movs r0, #0
	strh r0, [r4, #0x12]
	b _08022704
	.align 2, 0
_0802269C: .4byte gUnknown_03005424
_080226A0:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022704
	ldr r0, _080226C0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080226C4
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
	b _080226CE
	.align 2, 0
_080226C0: .4byte gUnknown_03005424
_080226C4:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
_080226CE:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022704
	ldr r0, _0802270C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080226E2
	rsbs r2, r2, #0
_080226E2:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_08022704:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802270C: .4byte gUnknown_03005424

	thumb_func_start sub_8022710
sub_8022710: @ 0x08022710
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r5, r0, r1
	ldr r0, [r4, #0xc]
	asrs r3, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _08022784 @ =0x000002FF
	cmp r1, r0
	bgt _0802273A
	movs r0, #0x80
	orrs r2, r0
_0802273A:
	movs r6, #0
	str r6, [sp]
	ldr r0, _08022788 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022768
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022768:
	ldr r0, _0802278C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r5, sp, #0xc
	cmp r0, #0
	beq _08022790
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
	b _0802279A
	.align 2, 0
_08022784: .4byte 0x000002FF
_08022788: .4byte sub_801ED24
_0802278C: .4byte gUnknown_03005424
_08022790:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
_0802279A:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080227C8
	ldr r0, _080227C4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080227AE
	rsbs r2, r2, #0
_080227AE:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802282C
	movs r0, #0
	strh r0, [r4, #0x12]
	b _0802282C
	.align 2, 0
_080227C4: .4byte gUnknown_03005424
_080227C8:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802282C
	ldr r0, _080227E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080227EC
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
	b _080227F6
	.align 2, 0
_080227E8: .4byte gUnknown_03005424
_080227EC:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
_080227F6:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802282C
	ldr r0, _08022834 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802280A
	rsbs r2, r2, #0
_0802280A:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_0802282C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022834: .4byte gUnknown_03005424

	thumb_func_start sub_8022838
sub_8022838: @ 0x08022838
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x10]
	ldrh r5, [r4, #0x12]
	movs r3, #0
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08022864
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	b _080228BA
_08022864:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080228AC
	cmp r0, #1
	bgt _08022892
	cmp r0, #0
	beq _0802289C
	b _080228BA
_08022892:
	cmp r0, #2
	beq _080228A4
	cmp r0, #3
	beq _080228B4
	b _080228BA
_0802289C:
	adds r0, r4, #0
	bl sub_80223BC
	b _080228BA
_080228A4:
	adds r0, r4, #0
	bl sub_80224DC
	b _080228BA
_080228AC:
	adds r0, r4, #0
	bl sub_80225E8
	b _080228BA
_080228B4:
	adds r0, r4, #0
	bl sub_8022710
_080228BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80228C0
sub_80228C0: @ 0x080228C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	mov r1, sl
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	adds r2, r7, #0
	adds r2, #0x28
	str r2, [sp, #8]
	str r2, [sp]
	ldr r3, _08022954 @ =sub_801EE64
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022954 @ =sub_801EE64
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022936
	adds r1, r6, #0
_08022936:
	cmp r1, #0
	beq _08022996
	cmp r1, #0
	bge _0802295E
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080229D6
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _08022958
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	b _080229A4
	.align 2, 0
_08022954: .4byte sub_801EE64
_08022958:
	mov r3, sb
	ldrb r0, [r3]
	b _080229A4
_0802295E:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022968
	rsbs r0, r0, #0
_08022968:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022972
	movs r0, #0xb
_08022972:
	cmp r1, r0
	bgt _08022988
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _08022982
	ldr r1, [sp, #8]
	b _080229A2
_08022982:
	mov r2, sb
	ldrb r0, [r2]
	b _080229A4
_08022988:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _080229D6
_08022996:
	cmp r6, r2
	bge _080229A0
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	b _080229A4
_080229A0:
	mov r1, sb
_080229A2:
	ldrb r0, [r1]
_080229A4:
	adds r1, r0, #0
	mov r2, sl
	str r2, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080229D6
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _080229E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080229D6
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_080229D6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080229E8: .4byte gUnknown_03005424

	thumb_func_start sub_80229EC
sub_80229EC: @ 0x080229EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _08022A84 @ =sub_801EE64
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _08022A84 @ =sub_801EE64
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022A66
	adds r1, r6, #0
_08022A66:
	cmp r1, #0
	beq _08022AC4
	cmp r1, #0
	bge _08022A88
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022B04
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022AC8
	b _08022ACE
	.align 2, 0
_08022A84: .4byte sub_801EE64
_08022A88:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022A92
	rsbs r0, r0, #0
_08022A92:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022A9C
	movs r0, #0xb
_08022A9C:
	cmp r1, r0
	bgt _08022AB6
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022AB0
	mov r2, r8
	b _08022AD0
_08022AB0:
	mov r3, sl
	ldrb r0, [r3]
	b _08022AD2
_08022AB6:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022B04
_08022AC4:
	cmp r6, r2
	bge _08022ACE
_08022AC8:
	mov r1, r8
	ldrb r0, [r1]
	b _08022AD2
_08022ACE:
	mov r2, sl
_08022AD0:
	ldrb r0, [r2]
_08022AD2:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022B04
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022B14 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022B04
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022B04:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022B14: .4byte gUnknown_03005424

	thumb_func_start sub_8022B18
sub_8022B18: @ 0x08022B18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _08022BB0 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _08022BB0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022B92
	adds r1, r6, #0
_08022B92:
	cmp r1, #0
	beq _08022BF0
	cmp r1, #0
	bge _08022BB4
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022C30
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022BF4
	b _08022BFA
	.align 2, 0
_08022BB0: .4byte sub_801ED24
_08022BB4:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022BBE
	rsbs r0, r0, #0
_08022BBE:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022BC8
	movs r0, #0xb
_08022BC8:
	cmp r1, r0
	bgt _08022BE2
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022BDC
	mov r2, r8
	b _08022BFC
_08022BDC:
	mov r3, sl
	ldrb r0, [r3]
	b _08022BFE
_08022BE2:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022C30
_08022BF0:
	cmp r6, r2
	bge _08022BFA
_08022BF4:
	mov r1, r8
	ldrb r0, [r1]
	b _08022BFE
_08022BFA:
	mov r2, sl
_08022BFC:
	ldrb r0, [r2]
_08022BFE:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022C30
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022C40 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022C30
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022C30:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022C40: .4byte gUnknown_03005424

	thumb_func_start sub_8022C44
sub_8022C44: @ 0x08022C44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov sl, r2
	str r2, [sp]
	ldr r3, _08022CD8 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022CD8 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022CBA
	adds r1, r6, #0
_08022CBA:
	cmp r1, #0
	beq _08022D18
	cmp r1, #0
	bge _08022CDC
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022D58
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022D1C
	b _08022D22
	.align 2, 0
_08022CD8: .4byte sub_801ED24
_08022CDC:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022CE6
	rsbs r0, r0, #0
_08022CE6:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022CF0
	movs r0, #0xb
_08022CF0:
	cmp r1, r0
	bgt _08022D0A
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022D04
	mov r2, sl
	b _08022D24
_08022D04:
	mov r3, sb
	ldrb r0, [r3]
	b _08022D26
_08022D0A:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022D58
_08022D18:
	cmp r6, r2
	bge _08022D22
_08022D1C:
	mov r1, sl
	ldrb r0, [r1]
	b _08022D26
_08022D22:
	mov r2, sb
_08022D24:
	ldrb r0, [r2]
_08022D26:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022D58
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022D68 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022D58
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022D58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022D68: .4byte gUnknown_03005424

	thumb_func_start sub_8022D6C
sub_8022D6C: @ 0x08022D6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r1, #0
	ldr r3, [r4, #0x20]
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08022D8C
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	b _08022F4E
_08022D8C:
	ldr r0, _08022E40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	adds r7, #0x24
	cmp r0, #0
	bne _08022E90
	ldr r0, _08022E44 @ =gUnknown_03005660
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08022E90
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	asrs r5, r0, #0x10
	movs r2, #4
	rsbs r2, r2, #0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	mov r8, r1
	mov r6, ip
	movs r1, #4
	ldrsh r0, [r6, r1]
	mov r6, r8
	subs r0, r0, r6
	ands r0, r2
	lsls r0, r0, #0x10
	ands r5, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	bne _08022E78
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022E78
	ldrb r0, [r7]
	adds r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	bhi _08022E78
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08022E78
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08022DF4
	rsbs r1, r1, #0
_08022DF4:
	ldr r0, _08022E48 @ =0x000005FF
	cmp r1, r0
	ble _08022E78
	adds r0, r4, #0
	bl sub_80228C0
	lsls r1, r5, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	blt _08022E54
	ldr r1, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xa
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08022E26
	orrs r1, r2
	str r1, [r4, #0x20]
	ldr r0, _08022E4C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08022E26
	bl sub_80117F0
_08022E26:
	ldr r0, _08022E50 @ =0x00000119
	bl m4aSongNumStartOrContinue
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strb r0, [r7]
	ldr r0, [r4, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	b _08022E6A
	.align 2, 0
_08022E40: .4byte gCurrentLevel
_08022E44: .4byte gUnknown_03005660
_08022E48: .4byte 0x000005FF
_08022E4C: .4byte gGameMode
_08022E50: .4byte 0x00000119
_08022E54:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E66
	ldr r0, _08022E70 @ =0x00000119
	bl m4aSongNumStop
_08022E66:
	ldr r0, [r4, #0x20]
	ldr r1, _08022E74 @ =0xFFFDFFFF
_08022E6A:
	ands r0, r1
	str r0, [r4, #0x20]
	b _08022F4E
	.align 2, 0
_08022E70: .4byte 0x00000119
_08022E74: .4byte 0xFFFDFFFF
_08022E78:
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E90
	ldr r0, _08022EC0 @ =0xFFFDFFFF
	ands r1, r0
	str r1, [r4, #0x20]
	ldr r0, _08022EC4 @ =0x00000119
	bl m4aSongNumStop
_08022E90:
	ldr r0, _08022EC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022EF4
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r0, r0, #0x18
	subs r0, #0x40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022ECC
	cmp r0, #0
	bgt _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
	.align 2, 0
_08022EC0: .4byte 0xFFFDFFFF
_08022EC4: .4byte 0x00000119
_08022EC8: .4byte gUnknown_03005424
_08022ECC:
	cmp r0, #0
	ble _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
_08022ED4:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022ED8:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	ble _08022F20
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	bne _08022F4E
	adds r0, r4, #0
	bl sub_8022C44
	b _08022F4E
_08022EF4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022F08
	cmp r0, #0
	bgt _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F08:
	cmp r0, #0
	ble _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F10:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022F14:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	bgt _08022F26
_08022F20:
	cmp r0, #0
	beq _08022F30
	b _08022F4E
_08022F26:
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	beq _08022F48
	b _08022F4E
_08022F30:
	adds r0, r4, #0
	bl sub_80228C0
	b _08022F4E
_08022F38:
	adds r0, r4, #0
	bl sub_80229EC
	b _08022F4E
_08022F40:
	adds r0, r4, #0
	bl sub_8022B18
	b _08022F4E
_08022F48:
	adds r0, r4, #0
	bl sub_8022C44
_08022F4E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8022F58
sub_8022F58: @ 0x08022F58
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	adds r1, #0x29
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r4, r0, #6
	cmp r4, #1
	beq _08022FA6
	cmp r4, #1
	bgt _08022F82
	cmp r4, #0
	beq _08022F8C
	b _0802301C
_08022F82:
	cmp r4, #2
	beq _08022FDC
	cmp r4, #3
	beq _08022FEA
	b _0802301C
_08022F8C:
	mov r4, sp
	add r2, sp, #4
	adds r0, r3, #0
	mov r1, sp
	bl sub_8029BB8
_08022F98:
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08023002
	b _08023006
_08022FA6:
	mov r5, sp
	add r2, sp, #8
	adds r0, r3, #0
	mov r1, sp
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r5]
	ands r4, r2
	cmp r4, #0
	beq _08022FC0
	strb r6, [r5]
	b _0802301A
_08022FC0:
	ldr r0, _08022FD8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802301A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r5]
	b _0802301A
	.align 2, 0
_08022FD8: .4byte gUnknown_03005424
_08022FDC:
	mov r4, sp
	add r2, sp, #0xc
	adds r0, r3, #0
	mov r1, sp
	bl sub_8021B08
	b _08022F98
_08022FEA:
	mov r4, sp
	add r2, sp, #0x10
	adds r0, r3, #0
	mov r1, sp
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08023006
_08023002:
	strb r6, [r4]
	b _0802301A
_08023006:
	ldr r0, _08023028 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802301A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r4]
_0802301A:
	adds r6, r3, #0
_0802301C:
	adds r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023028: .4byte gUnknown_03005424

	thumb_func_start sub_802302C
sub_802302C: @ 0x0802302C
	push {r4, r5, lr}
	sub sp, #8
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	ldr r0, [r1, #0xc]
	asrs r4, r0, #8
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	lsls r0, r2, #0x18
	asrs r3, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802305E
	cmp r3, #0
	bgt _08023062
	b _08023068
_0802305E:
	cmp r3, #0
	bgt _08023068
_08023062:
	adds r0, r2, #0
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08023068:
	lsrs r2, r0, #0x18
	lsrs r3, r2, #6
	cmp r3, #1
	beq _080230CC
	cmp r3, #1
	bgt _0802307A
	cmp r3, #0
	beq _08023084
	b _0802311C
_0802307A:
	cmp r3, #2
	beq _080230A4
	cmp r3, #3
	beq _080230F4
	b _0802311C
_08023084:
	adds r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	str r3, [sp]
	ldr r1, _080230A0 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	b _0802310E
	.align 2, 0
_080230A0: .4byte sub_801EE64
_080230A4:
	subs r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230C8 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230C8: .4byte sub_801EE64
_080230CC:
	subs r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230F0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230F0: .4byte sub_801ED24
_080230F4:
	adds r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, _08023118 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
_0802310E:
	movs r3, #8
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_08023118: .4byte sub_801ED24
_0802311C:
	movs r0, #0
_0802311E:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023128
sub_8023128: @ 0x08023128
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080231BA
	movs r1, #0x40
	cmp r0, #0
	blt _0802313C
	movs r1, #0xc0
_0802313C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _080231BA
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _08023182
	cmp r1, #1
	bgt _0802316E
	cmp r1, #0
	beq _08023178
	b _080231AE
_0802316E:
	cmp r1, #2
	beq _08023188
	cmp r1, #3
	beq _0802319A
	b _080231AE
_08023178:
	ldr r0, [r4, #0xc]
	adds r0, r0, r2
	str r0, [r4, #0xc]
	strh r1, [r4, #0x12]
	b _080231AE
_08023182:
	ldr r0, [r4, #8]
	subs r0, r0, r2
	b _0802319E
_08023188:
	ldr r0, [r4, #0xc]
	subs r0, r0, r2
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	orrs r0, r1
	str r0, [r4, #0x20]
	b _080231AE
_0802319A:
	ldr r0, [r4, #8]
	adds r0, r0, r2
_0802319E:
	str r0, [r4, #8]
	movs r2, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	strh r2, [r4, #0x14]
_080231AE:
	adds r0, r4, #0
	adds r0, #0x62
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_080231BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80231C0
sub_80231C0: @ 0x080231C0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08023258
	movs r1, #0x40
	cmp r0, #0
	blt _080231D4
	movs r1, #0xc0
_080231D4:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _08023258
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0802321A
	cmp r1, #1
	bgt _08023206
	cmp r1, #0
	beq _08023210
	b _08023258
_08023206:
	cmp r1, #2
	beq _08023220
	cmp r1, #3
	beq _08023232
	b _08023258
_08023210:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	strh r1, [r5, #0x12]
	b _08023258
_0802321A:
	ldr r0, [r5, #8]
	subs r0, r0, r2
	b _08023236
_08023220:
	ldr r0, [r5, #0xc]
	subs r0, r0, r2
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	orrs r0, r1
	str r0, [r5, #0x20]
	b _08023258
_08023232:
	ldr r0, [r5, #8]
	adds r0, r0, r2
_08023236:
	str r0, [r5, #8]
	movs r4, #0
	strh r4, [r5, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r4, [r5, #0x14]
_08023258:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023260
sub_8023260: @ 0x08023260
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x40]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	ble _08023276
	strh r4, [r2, #0x14]
	b _08023282
_08023276:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmn r0, r3
	bge _08023282
	rsbs r0, r4, #0
	strh r0, [r2, #0x14]
_08023282:
	movs r0, #0x14
	ldrsh r4, [r2, r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldr r5, _080232CC @ =gSineTable
	ldrb r3, [r0]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x10]
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080232B0
	strh r1, [r2, #0x12]
_080232B0:
	lsls r0, r3, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	ldrh r1, [r2, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080232CC: .4byte gSineTable

	thumb_func_start sub_80232D0
sub_80232D0: @ 0x080232D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080233A0 @ =gCamera
	ldr r0, [r7, #8]
	mov r8, r0
	ldr r1, [r7, #0xc]
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080232F4
	b _08023486
_080232F4:
	ldr r1, _080233A4 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _08023316
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08023312
	ldr r0, _080233A8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023316
_08023312:
	cmp r1, #0x1d
	bne _080233C4
_08023316:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023324
	b _08023486
_08023324:
	ldr r0, _080233AC @ =gUnknown_080D650C
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r0, r2, r0
	ldr r1, [r0]
	cmp r1, #0
	bge _08023336
	b _08023486
_08023336:
	lsls r0, r1, #8
	cmp r8, r0
	bge _0802333E
	b _08023486
_0802333E:
	ldr r0, _080233B0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r5, [r1]
	adds r0, #4
	adds r0, r2, r0
	ldr r6, [r0]
	lsls r3, r5, #8
	add r8, r3
	lsls r1, r6, #8
	add sb, r1
	ldr r0, _080233B4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023366
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_08023366:
	ldr r0, _080233B8 @ =gUnknown_030054FC
	str r3, [r0]
	ldr r0, _080233BC @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r3, #0
	bl sub_8039F14
	ldr r1, _080233C0 @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r5
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r5
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	adds r0, r0, r6
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r6
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x14]
	adds r0, r0, r6
	str r0, [r4, #0x14]
	b _08023486
	.align 2, 0
_080233A0: .4byte gCamera
_080233A4: .4byte gCurrentLevel
_080233A8: .4byte gUnknown_030054B0
_080233AC: .4byte gUnknown_080D650C
_080233B0: .4byte gUnknown_080D661C
_080233B4: .4byte gUnknown_030056A4
_080233B8: .4byte gUnknown_030054FC
_080233BC: .4byte gUnknown_030054E0
_080233C0: .4byte gUnknown_03005430
_080233C4:
	ldr r0, _080234B4 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08023486
	ldr r0, _080234B8 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08023486
	ldr r0, _080234BC @ =gUnknown_080D650C
	mov r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r1, r2, r0
	ldr r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	blt _08023432
	lsls r0, r1, #8
	cmp r8, r0
	blt _08023432
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08023432
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08023432
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, #8
	add r8, r3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, _080234C4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023432
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
_08023432:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #3
	adds r0, r5, #4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	blt _08023486
	lsls r0, r0, #8
	cmp sb, r0
	blt _08023486
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08023486
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023486
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	lsls r1, r0, #8
	lsls r3, r0, #0x10
	add sb, r3
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0x24]
	ldr r0, _080234C4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023486
	ldr r0, [r2, #4]
	adds r0, r0, r3
	str r0, [r2, #4]
_08023486:
	ldr r1, [r7, #0x20]
	ldr r0, _080234C8 @ =0x80000080
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0x80
	bne _08023494
	b _08023604
_08023494:
	ldr r5, _080234CC @ =gCamera
	ldr r3, [r7, #0xc]
	cmp r6, #0
	blt _0802351C
	ldr r2, _080234D0 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234D4
	ldr r0, [r5, #0x28]
	lsls r0, r0, #8
	cmp r3, r0
	bgt _080234E0
	b _080234E6
	.align 2, 0
_080234B4: .4byte gPlayer
_080234B8: .4byte gUnknown_030054F4
_080234BC: .4byte gUnknown_080D650C
_080234C0: .4byte gUnknown_080D661C
_080234C4: .4byte gUnknown_030056A4
_080234C8: .4byte 0x80000080
_080234CC: .4byte gCamera
_080234D0: .4byte gUnknown_03005424
_080234D4:
	ldr r0, [r5, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	movs r1, #1
	cmp r3, r0
	bge _080234E2
_080234E0:
	movs r1, #0
_080234E2:
	cmp r1, #0
	beq _0802351C
_080234E6:
	movs r0, #0x80
	orrs r0, r6
	str r0, [r7, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080234FC
	ldr r0, _080234F8 @ =0x0000FD60
	b _080234FE
	.align 2, 0
_080234F8: .4byte 0x0000FD60
_080234FC:
	ldr r0, _08023510 @ =0x0000FB20
_080234FE:
	strh r0, [r7, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023514
	ldr r0, [r4, #0x28]
	lsls r0, r0, #8
	b _0802351A
	.align 2, 0
_08023510: .4byte 0x0000FB20
_08023514:
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
_0802351A:
	mov sb, r0
_0802351C:
	ldr r1, _08023548 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _0802353E
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802353A
	ldr r0, _0802354C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802353E
_0802353A:
	cmp r1, #0x1d
	bne _08023558
_0802353E:
	ldr r0, _08023550 @ =gUnknown_03005440
	ldrh r2, [r0]
	ldr r0, _08023554 @ =gUnknown_030054BC
	ldrh r3, [r0]
	b _0802355C
	.align 2, 0
_08023548: .4byte gCurrentLevel
_0802354C: .4byte gUnknown_030054B0
_08023550: .4byte gUnknown_03005440
_08023554: .4byte gUnknown_030054BC
_08023558:
	ldr r2, [r4, #0x28]
	ldr r3, [r4, #0x2c]
_0802355C:
	mov r5, r8
	mov r6, sb
	ldr r0, [r4, #0x30]
	lsls r0, r0, #8
	cmp r8, r0
	blt _08023576
	ldr r0, [r4, #0x34]
	lsls r0, r0, #8
	subs r1, r0, #1
	mov r0, r8
	cmp r0, r1
	ble _08023576
	adds r0, r1, #0
_08023576:
	mov r8, r0
	lsls r0, r2, #8
	cmp sb, r0
	blt _0802358A
	lsls r0, r3, #8
	subs r1, r0, #1
	mov r0, sb
	cmp r0, r1
	ble _0802358A
	adds r0, r1, #0
_0802358A:
	mov sb, r0
	cmp r8, r5
	beq _08023596
	movs r0, #0
	strh r0, [r7, #0x10]
	strh r0, [r7, #0x14]
_08023596:
	cmp sb, r6
	beq _080235A0
	movs r0, #0
	strh r0, [r7, #0x12]
	strh r0, [r7, #0x14]
_080235A0:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080235C0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080235BC
	ldr r0, _080235E4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080235C0
_080235BC:
	cmp r1, #0x1d
	bne _080235FC
_080235C0:
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r8, r1
	bge _080235E8
	mov r8, r1
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x20]
	b _080235FC
	.align 2, 0
_080235E4: .4byte gUnknown_030054B0
_080235E8:
	movs r1, #0x9c
	lsls r1, r1, #9
	adds r0, r0, r1
	cmp r8, r0
	ble _080235FC
	mov r8, r0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
_080235FC:
	mov r2, r8
	str r2, [r7, #8]
	mov r0, sb
	str r0, [r7, #0xc]
_08023604:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8023610
sub_8023610: @ 0x08023610
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, [r0, #0x48]
	lsls r5, r0, #1
	mov r0, ip
	ldr r6, [r0, #0x44]
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #0x14
	beq _080236C0
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r7, #0x10
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _080236C0
	mov r0, ip
	ldrh r2, [r0, #0x10]
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0802367C
	cmp r4, #0x3f
	beq _0802365A
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0802365A
	movs r0, #1
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0802365A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r6, #0
	cmp r0, r1
	bge _080236BC
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _080236BC
	lsls r0, r1, #0x10
	b _080236BA
_0802367C:
	adds r0, r7, #0
	ands r0, r3
	cmp r0, #0
	beq _080236BC
	cmp r4, #0x3f
	beq _0802369C
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0802369C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0802369C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _080236BC
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	bge _080236BC
	lsls r0, r6, #0x10
_080236BA:
	lsrs r2, r0, #0x10
_080236BC:
	mov r1, ip
	strh r2, [r1, #0x10]
_080236C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80236C8
sub_80236C8: @ 0x080236C8
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _080236EC @ =0x0000BCFF
	cmp r1, r0
	bls _08023702
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x15
	cmp r0, #0
	bge _080236F0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08023700
	b _080236FE
	.align 2, 0
_080236EC: .4byte 0x0000BCFF
_080236F0:
	cmp r0, #0
	ble _08023702
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08023700
_080236FE:
	movs r1, #0
_08023700:
	strh r1, [r2, #0x10]
_08023702:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023708
sub_8023708: @ 0x08023708
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0802372C @ =0x0000BCFF
	cmp r1, r0
	bls _08023742
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _08023730
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08023740
	b _0802373E
	.align 2, 0
_0802372C: .4byte 0x0000BCFF
_08023730:
	cmp r0, #0
	ble _08023742
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08023740
_0802373E:
	movs r1, #0
_08023740:
	strh r1, [r2, #0x10]
_08023742:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023748
sub_8023748: @ 0x08023748
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x37
	ldrb r1, [r4]
	cmp r1, #0
	beq _08023850
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0802377C
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802377C
	ldr r0, _080237E0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	ldrb r1, [r4]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r4]
_0802377C:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _080237AA
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080237AA
	ldr r0, _080237E0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4]
_080237AA:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023822
	ldrh r0, [r5, #0x2e]
	subs r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08023822
	ldrb r0, [r4]
	movs r1, #0xfd
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080237E8
	ldr r0, _080237E4 @ =gPlayer
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A7A8
	b _080237FE
	.align 2, 0
_080237E0: .4byte gMPlayInfo_BGM
_080237E4: .4byte gPlayer
_080237E8:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080237FE
	ldr r0, _08023858 @ =gPlayer
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A8F8
_080237FE:
	ldr r0, _0802385C @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08023860 @ =gSongTable
	adds r0, #0xe8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08023822
	ldr r1, _08023864 @ =gLevelSongs
	ldr r0, _08023868 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08023822:
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08023850
	ldrh r0, [r5, #0x34]
	subs r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08023850
	ldrb r1, [r4]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r4]
	ldr r2, _0802386C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08023870 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08023874 @ =gWinRegs
	movs r0, #0x3f
	strh r0, [r1, #0xa]
_08023850:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023858: .4byte gPlayer
_0802385C: .4byte gMPlayTable
_08023860: .4byte gSongTable
_08023864: .4byte gLevelSongs
_08023868: .4byte gCurrentLevel
_0802386C: .4byte gDispCnt
_08023870: .4byte 0x00007FFF
_08023874: .4byte gWinRegs

	thumb_func_start sub_8023878
sub_8023878: @ 0x08023878
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	ldr r0, _08023944 @ =0xFFFFEFFF
	ands r2, r0
	str r2, [r4, #0x20]
	ldr r0, _08023948 @ =gUnknown_03005660
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	beq _08023890
	b _08023A60
_08023890:
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _0802389A
	b _08023A60
_0802389A:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	subs r0, #4
	movs r5, #4
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080238AA
	b _08023A60
_080238AA:
	movs r1, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x88
	cmp r0, #0
	bne _08023912
	orrs r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
	str r2, [r4, #0x20]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _080238EE
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _08023912
_080238EE:
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bgt _08023912
	movs r0, #0xa
	strb r0, [r5]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #4
	ldrsh r1, [r3, r2]
	bl sub_80118FC
	movs r0, #0x9c
	bl m4aSongNumStart
_08023912:
	adds r1, r4, #0
	adds r1, #0x87
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	adds r7, r1, #0
	cmp r0, #0
	bgt _08023A00
	adds r0, r4, #0
	adds r0, #0x86
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	subs r1, #2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r6, r0, #0
	cmp r1, #0xa
	bhi _080239D2
	lsls r0, r1, #2
	ldr r1, _0802394C @ =_08023950
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023944: .4byte 0xFFFFEFFF
_08023948: .4byte gUnknown_03005660
_0802394C: .4byte _08023950
_08023950: @ jump table
	.4byte _080239CA @ case 0
	.4byte _080239D2 @ case 1
	.4byte _080239C0 @ case 2
	.4byte _080239D2 @ case 3
	.4byte _080239B6 @ case 4
	.4byte _080239D2 @ case 5
	.4byte _080239AC @ case 6
	.4byte _080239D2 @ case 7
	.4byte _080239A2 @ case 8
	.4byte _0802397C @ case 9
	.4byte _08023998 @ case 10
_0802397C:
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080239D2
	ldr r1, _08023994 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #4]
	b _080239D2
	.align 2, 0
_08023994: .4byte gUnknown_030054A8
_08023998:
	adds r0, r4, #0
	movs r1, #5
	bl sub_802AF60
	b _080239D2
_080239A2:
	adds r0, r4, #0
	movs r1, #4
	bl sub_802AF60
	b _080239D2
_080239AC:
	adds r0, r4, #0
	movs r1, #3
	bl sub_802AF60
	b _080239D2
_080239B6:
	adds r0, r4, #0
	movs r1, #2
	bl sub_802AF60
	b _080239D2
_080239C0:
	adds r0, r4, #0
	movs r1, #1
	bl sub_802AF60
	b _080239D2
_080239CA:
	adds r0, r4, #0
	movs r1, #0
	bl sub_802AF60
_080239D2:
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bge _080239FC
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, _08023A48 @ =0xFFFFF400
	adds r1, r1, r2
	movs r2, #0
	movs r3, #1
	bl sub_802B018
	adds r0, r4, #0
	bl sub_802B3BC
_080239FC:
	movs r0, #0x3c
	strb r0, [r7]
_08023A00:
	ldr r0, _08023A4C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023B02
	ldr r2, _08023A50 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08023A54 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08023A58 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023B02
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r0, #0
	beq _08023A34
	ldr r1, _08023A5C @ =0xFFFFFC00
_08023A34:
	ldr r0, [r4, #8]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	ldr r2, _08023A5C @ =0xFFFFFC00
	adds r1, r1, r2
	movs r2, #0
	movs r3, #0
	bl sub_802B018
	b _08023B02
	.align 2, 0
_08023A48: .4byte 0xFFFFF400
_08023A4C: .4byte gUnknown_03005590
_08023A50: .4byte gPseudoRandom
_08023A54: .4byte 0x00196225
_08023A58: .4byte 0x3C6EF35F
_08023A5C: .4byte 0xFFFFFC00
_08023A60:
	ldr r1, [r4, #0x20]
	movs r0, #0x40
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x88
	cmp r0, #0
	beq _08023AC2
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r1, r0
	str r1, [r4, #0x20]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _08023A9E
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _08023AC2
_08023A9E:
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bgt _08023AC2
	movs r0, #0xa
	strb r0, [r5]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #4
	ldrsh r1, [r3, r2]
	bl sub_80118FC
	movs r0, #0x9c
	bl m4aSongNumStart
_08023AC2:
	adds r1, r4, #0
	adds r1, #0x87
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08023B1C @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08023B20 @ =gSongTable
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08023B02
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08023B02
	ldr r1, _08023B24 @ =gLevelSongs
	ldr r0, _08023B28 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08023B02:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08023B2C
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #1
	b _08023B44
	.align 2, 0
_08023B1C: .4byte gMPlayTable
_08023B20: .4byte gSongTable
_08023B24: .4byte gLevelSongs
_08023B28: .4byte gCurrentLevel
_08023B2C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023B46
	ldr r0, [r4, #0x40]
	asrs r0, r0, #2
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #2
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #2
_08023B44:
	str r0, [r4, #0x4c]
_08023B46:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08023B54
	subs r0, r1, #1
	strb r0, [r5]
_08023B54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

    @ Input:
    @  r0 = Player*
    @  r1 = spriteOffsetY
	thumb_func_start sub_8023B5C
sub_8023B5C: @ 0x08023B5C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	cmp r0, r4
	beq _08023C0A
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r2, [r0]
	ldr r0, _08023BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023B8E
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08023B8E:
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0
	ble _08023BA8
	cmp r2, #0
	beq _08023BA4
	subs r0, #1
	b _08023BAC
	.align 2, 0
_08023BA0: .4byte gUnknown_03005424
_08023BA4:
	movs r2, #0x20
	b _08023BB4
_08023BA8:
	cmp r2, #0
	beq _08023BB2
_08023BAC:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08023BB4
_08023BB2:
	movs r2, #0x1f
_08023BB4:
	lsrs r0, r2, #6
	cmp r0, #1
	beq _08023BEE
	cmp r0, #1
	bgt _08023BC4
	cmp r0, #0
	beq _08023BCE
	b _08023C0A
_08023BC4:
	cmp r0, #2
	beq _08023BDE
	cmp r0, #3
	beq _08023BFC
	b _08023C0A
_08023BCE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BDE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BEE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	b _08023C08
_08023BFC:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	subs r0, r0, r1
_08023C08:
	str r0, [r3, #8]
_08023C0A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8023C10
sub_8023C10: @ 0x08023C10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bge _08023CFE
	movs r0, #0x14
	ldrsh r3, [r4, r0]
	ldr r2, _08023C40 @ =gInput
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08023C4A
	adds r3, #0x20
	cmp r3, #0
	blt _08023C44
	adds r0, r3, #0
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	ble _08023C46
	adds r0, r1, #0
	b _08023C46
	.align 2, 0
_08023C40: .4byte gInput
_08023C44:
	movs r0, #0
_08023C46:
	adds r3, r0, #0
	b _08023C4C
_08023C4A:
	movs r3, #0
_08023C4C:
	strh r3, [r4, #0x14]
	ldrh r0, [r2]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _08023C60
	cmp r1, #0x20
	bne _08023C64
	rsbs r0, r3, #0
	b _08023C66
_08023C60:
	strh r3, [r4, #0x10]
	b _08023C68
_08023C64:
	movs r0, #0
_08023C66:
	strh r0, [r4, #0x10]
_08023C68:
	ldrh r0, [r2]
	movs r1, #0xc0
	ands r1, r0
	cmp r1, #0x40
	beq _08023C7C
	cmp r1, #0x80
	beq _08023C82
	movs r0, #0
	strh r0, [r4, #0x12]
	b _08023C84
_08023C7C:
	rsbs r0, r3, #0
	strh r0, [r4, #0x12]
	b _08023C84
_08023C82:
	strh r3, [r4, #0x12]
_08023C84:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08023CCC @ =gUnknown_03005424
	ldr r1, _08023CD0 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023CA6
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08023CA6:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08023CB6
	adds r2, r1, #0
_08023CB6:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023CD4
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08023CDC
	.align 2, 0
_08023CCC: .4byte gUnknown_03005424
_08023CD0: .4byte gUnknown_0300544C
_08023CD4:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08023CDC:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, _08023D04 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023CFE
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_801FD34
_08023CFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023D04: .4byte gPressedKeys

	thumb_func_start sub_8023D08
sub_8023D08: @ 0x08023D08
	push {r4, r5, r6, lr}
	ldr r0, _08023D70 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r5, [r1, #4]
	cmp r5, #0
	beq _08023D1E
	b _08023E84
_08023D1E:
	ldr r0, _08023D74 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08023DA0
	adds r0, r2, #0
	bl TaskDestroy
	ldr r0, _08023D78 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08023D50
	ldr r0, _08023D7C @ =gCourseTime
	ldr r2, [r0]
	ldr r0, _08023D80 @ =0x00008CA0
	cmp r2, r0
	bhi _08023D68
	ldr r0, _08023D84 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08023D50
	cmp r2, #0
	beq _08023D68
_08023D50:
	ldr r0, _08023D74 @ =gGameMode
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08023D88
	ldr r0, _08023D7C @ =gCourseTime
	ldr r1, [r0]
	ldr r0, _08023D80 @ =0x00008CA0
	cmp r1, r0
	bls _08023D88
_08023D68:
	bl sub_801B6B4
	b _08023E88
	.align 2, 0
_08023D70: .4byte gCurTask
_08023D74: .4byte gGameMode
_08023D78: .4byte gLoadedSaveGame
_08023D7C: .4byte gCourseTime
_08023D80: .4byte 0x00008CA0
_08023D84: .4byte gUnknown_03005424
_08023D88:
	ldr r0, _08023D98 @ =gRingCount
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08023D9C @ =gUnknown_030054F4
	strb r1, [r0]
	bl sub_801AE48
	b _08023E88
	.align 2, 0
_08023D98: .4byte gRingCount
_08023D9C: .4byte gUnknown_030054F4
_08023DA0:
	ldr r1, _08023E50 @ =gRingCount
	strh r5, [r1]
	cmp r0, #3
	bne _08023DAC
	movs r0, #1
	strh r0, [r1]
_08023DAC:
	ldr r1, _08023E54 @ =gUnknown_030054F4
	movs r0, #0
	strb r0, [r1]
	ldr r6, _08023E58 @ =gPlayer
	adds r0, r6, #0
	bl sub_8021694
	ldr r4, _08023E5C @ =gCamera
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r4]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r4, #4]
	ldr r0, _08023E60 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r5, [r6, #0x20]
	ldr r2, _08023E64 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08023E68 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r2, r6, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r5, _08023E6C @ =0xFFFFCFFF
	ands r0, r5
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #6
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r2, #4
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ands r0, r5
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r4, #0x50
	ldrh r1, [r4]
	ldr r0, _08023E70 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08023E3E
	ldr r0, _08023E74 @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _08023E3E
	ldr r0, [r6, #8]
	str r0, [r1]
	ldr r0, [r6, #0xc]
	str r0, [r1, #4]
_08023E3E:
	ldr r0, _08023E78 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08023E7C @ =sub_8023FC0
	str r0, [r1, #8]
	ldr r1, _08023E58 @ =gPlayer
	ldr r0, _08023E80 @ =PlayerCB_8025318
	str r0, [r1]
	b _08023E88
	.align 2, 0
_08023E50: .4byte gRingCount
_08023E54: .4byte gUnknown_030054F4
_08023E58: .4byte gPlayer
_08023E5C: .4byte gCamera
_08023E60: .4byte gMPlayInfo_BGM
_08023E64: .4byte gUnknown_03005424
_08023E68: .4byte 0x0000FF7F
_08023E6C: .4byte 0xFFFFCFFF
_08023E70: .4byte 0x0000FFFC
_08023E74: .4byte gUnknown_030056A4
_08023E78: .4byte gCurTask
_08023E7C: .4byte sub_8023FC0
_08023E80: .4byte PlayerCB_8025318
_08023E84:
	subs r5, #1
	str r5, [r1, #4]
_08023E88:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023E90
sub_8023E90: @ 0x08023E90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08023EB4 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r6, [r0]
	adds r0, #4
	ldr r0, [r0]
	mov r8, r0
	ldr r5, _08023EB8 @ =gCamera
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x20]
	adds r7, r4, #0
	cmp r0, #0
	bge _08023EC0
	ldr r2, _08023EBC @ =gUnknown_03005424
	b _08023F34
	.align 2, 0
_08023EB4: .4byte gPlayer
_08023EB8: .4byte gCamera
_08023EBC: .4byte gUnknown_03005424
_08023EC0:
	ldr r2, _08023ED8 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023EDC
	ldr r0, [r5, #4]
	subs r0, #0x50
	lsls r0, r0, #8
	cmp r3, r0
	bgt _08023EEA
	b _08023EF0
	.align 2, 0
_08023ED8: .4byte gUnknown_03005424
_08023EDC:
	ldr r0, [r5, #4]
	lsls r0, r0, #8
	ldr r1, _08023F24 @ =0x0000EFFF
	adds r0, r0, r1
	movs r1, #1
	cmp r3, r0
	bge _08023EEC
_08023EEA:
	movs r1, #0
_08023EEC:
	cmp r1, #0
	beq _08023F34
_08023EF0:
	ldr r5, _08023F28 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0x3c
	str r1, [r0, #4]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r7, #0x20]
	ldr r0, _08023F2C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08023F1A
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8024B10
_08023F1A:
	ldr r1, [r5]
	ldr r0, _08023F30 @ =sub_8023D08
	str r0, [r1, #8]
	b _08023FB6
	.align 2, 0
_08023F24: .4byte 0x0000EFFF
_08023F28: .4byte gCurTask
_08023F2C: .4byte gGameMode
_08023F30: .4byte sub_8023D08
_08023F34:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023F44
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08023F48
_08023F44:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08023F48:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r1, _08023F90 @ =gUnknown_0300544C
	ldrh r0, [r2]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023F6A
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08023F6A:
	ldrh r3, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08023F7A
	adds r3, r1, #0
_08023F7A:
	strh r3, [r4, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023F94
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08023F9C
	.align 2, 0
_08023F90: .4byte gUnknown_0300544C
_08023F94:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08023F9C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_802486C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8024B10
	adds r0, r4, #0
	mov r1, r8
	bl sub_8024F74
_08023FB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8023FC0
sub_8023FC0: @ 0x08023FC0
	push {r4, r5, r6, r7, lr}
	ldr r5, _08024014 @ =gPlayer
	adds r0, r5, #0
	bl sub_802989C
	adds r0, r5, #0
	bl sub_80298DC
	adds r0, r5, #0
	bl sub_802A1C8
	adds r0, r5, #0
	bl sub_8029990
	ldr r0, _08024018 @ =gUnknown_030054FC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0802401C @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r5, #0
	bl sub_802460C
	adds r0, r5, #0
	bl sub_800DF8C
	adds r0, r5, #0
	bl sub_8023878
	adds r0, r5, #0
	bl sub_8024228
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08024020
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	b _08024046
	.align 2, 0
_08024014: .4byte gPlayer
_08024018: .4byte gUnknown_030054FC
_0802401C: .4byte gUnknown_030054E0
_08024020:
	ldr r0, _080240EC @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08024040
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802403C
	ldr r0, _080240F0 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024040
_0802403C:
	cmp r1, #0x1d
	bne _08024046
_08024040:
	adds r0, r5, #0
	bl sub_80232D0
_08024046:
	adds r4, r5, #0
	adds r4, #0x90
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_802486C
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_8024B10
	adds r0, r5, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8024F74
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0x14
	beq _08024082
	ldrh r1, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08024082
	subs r0, r1, #1
	strh r0, [r5, #0x2c]
_08024082:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08024094
	subs r0, r2, #1
	strb r0, [r1]
_08024094:
	adds r0, r5, #0
	bl sub_8023748
	bl sub_8015790
	bl sub_80156D0
	ldr r2, [r5, #0x20]
	ldr r0, _080240F4 @ =0xFFFFF7FF
	ands r2, r0
	str r2, [r5, #0x20]
	ldr r1, _080240F8 @ =gUnknown_030054C0
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1]
	movs r3, #0
	strh r3, [r1, #4]
	ldr r1, _080240FC @ =gUnknown_03005498
	ldr r0, _08024100 @ =0x00009C40
	str r0, [r1]
	str r3, [r1, #4]
	movs r0, #0x80
	ands r2, r0
	cmp r2, #0
	bne _080240C8
	b _08024222
_080240C8:
	ldr r7, _08024104 @ =gCamera
	ldr r0, _08024108 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802410C @ =sub_8023E90
	str r0, [r1, #8]
	movs r0, #0x16
	strh r0, [r6]
	strh r3, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _08024110 @ =0xFFFFFC00
	cmp r1, r0
	bge _08024114
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0802411A
	.align 2, 0
_080240EC: .4byte gCurrentLevel
_080240F0: .4byte gUnknown_030054B0
_080240F4: .4byte 0xFFFFF7FF
_080240F8: .4byte gUnknown_030054C0
_080240FC: .4byte gUnknown_03005498
_08024100: .4byte 0x00009C40
_08024104: .4byte gCamera
_08024108: .4byte gCurTask
_0802410C: .4byte sub_8023E90
_08024110: .4byte 0xFFFFFC00
_08024114:
	cmp r1, #0
	ble _0802411A
	strh r3, [r5, #0x12]
_0802411A:
	movs r1, #0
	movs r2, #0
	movs r0, #2
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
	adds r2, r7, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08024200 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024156
	ldr r0, _08024204 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #1
	orrs r1, r2
	strh r1, [r0]
_08024156:
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	ldr r1, _08024208 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r6, _0802420C @ =gMPlayTable
	ldr r1, [r6]
	ldr r4, _08024210 @ =gSongTable
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _080241A0
	ldr r1, _08024214 @ =gLevelSongs
	ldr r0, _08024218 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_080241A0:
	ldr r0, [r6]
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bne _080241C2
	ldr r1, _08024214 @ =gLevelSongs
	ldr r0, _08024218 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_080241C2:
	movs r0, #0x1f
	bl m4aSongNumStop
	adds r4, r5, #0
	adds r4, #0x85
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #2
	bne _080241DA
	movs r0, #0x78
	bl m4aSongNumStop
_080241DA:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _080241E8
	movs r0, #0xe3
	bl m4aSongNumStop
_080241E8:
	adds r0, r5, #0
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0802421C
	movs r0, #0x9d
	bl m4aSongNumStart
	b _08024222
	.align 2, 0
_08024200: .4byte gGameMode
_08024204: .4byte gUnknown_03005424
_08024208: .4byte 0xFFFFCFFF
_0802420C: .4byte gMPlayTable
_08024210: .4byte gSongTable
_08024214: .4byte gLevelSongs
_08024218: .4byte gCurrentLevel
_0802421C:
	movs r0, #0x77
	bl m4aSongNumStart
_08024222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8024228
sub_8024228: @ 0x08024228
	push {lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x6d
	ldrb r0, [r1]
	cmp r0, #0
	bne _08024238
	b _080245EE
_08024238:
	subs r0, #1
	cmp r0, #0x1b
	bls _08024240
	b _080245EE
_08024240:
	lsls r0, r0, #2
	ldr r1, _0802424C @ =_08024250
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802424C: .4byte _08024250
_08024250: @ jump table
	.4byte _080242C0 @ case 0
	.4byte _080242D0 @ case 1
	.4byte _080242E0 @ case 2
	.4byte _08024300 @ case 3
	.4byte _0802434C @ case 4
	.4byte _08024330 @ case 5
	.4byte _08024320 @ case 6
	.4byte _08024368 @ case 7
	.4byte _08024378 @ case 8
	.4byte _08024388 @ case 9
	.4byte _08024578 @ case 10
	.4byte _08024588 @ case 11
	.4byte _08024598 @ case 12
	.4byte _080243E8 @ case 13
	.4byte _08024414 @ case 14
	.4byte _08024440 @ case 15
	.4byte _0802445C @ case 16
	.4byte _08024478 @ case 17
	.4byte _080244B0 @ case 18
	.4byte _080244E8 @ case 19
	.4byte _08024520 @ case 20
	.4byte _08024558 @ case 21
	.4byte _080245A8 @ case 22
	.4byte _08024568 @ case 23
	.4byte _080245B8 @ case 24
	.4byte _080245D8 @ case 25
	.4byte _080245E8 @ case 26
	.4byte _080245C8 @ case 27
_080242C0:
	ldr r1, _080242C8 @ =gPlayer
	ldr r0, _080242CC @ =PlayerCB_8025318
	b _080245EC
	.align 2, 0
_080242C8: .4byte gPlayer
_080242CC: .4byte PlayerCB_8025318
_080242D0:
	ldr r1, _080242D8 @ =gPlayer
	ldr r0, _080242DC @ =PlayerCB_8025A0C
	b _080245EC
	.align 2, 0
_080242D8: .4byte gPlayer
_080242DC: .4byte PlayerCB_8025A0C
_080242E0:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _080242F4 @ =0xFF9FFFFF
	ands r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _080242F8 @ =gPlayer
	ldr r0, _080242FC @ =PlayerCB_8025D00
	b _080245EC
	.align 2, 0
_080242F4: .4byte 0xFF9FFFFF
_080242F8: .4byte gPlayer
_080242FC: .4byte PlayerCB_8025D00
_08024300:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _08024314 @ =0xFF9FFFFF
	ands r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024318 @ =gPlayer
	ldr r0, _0802431C @ =PlayerCB_8025F84
	b _080245EC
	.align 2, 0
_08024314: .4byte 0xFF9FFFFF
_08024318: .4byte gPlayer
_0802431C: .4byte sub_8025F84
_08024320:
	ldr r1, _08024328 @ =gPlayer
	ldr r0, _0802432C @ =PlayerCB_8028D74
	b _080245EC
	.align 2, 0
_08024328: .4byte gPlayer
_0802432C: .4byte PlayerCB_8028D74
_08024330:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024344 @ =gPlayer
	ldr r0, _08024348 @ =PlayerCB_8026060
	b _080245EC
	.align 2, 0
_08024344: .4byte gPlayer
_08024348: .4byte PlayerCB_8026060
_0802434C:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024360 @ =gPlayer
	ldr r0, _08024364 @ =PlayerCB_802611C
	b _080245EC
	.align 2, 0
_08024360: .4byte gPlayer
_08024364: .4byte PlayerCB_802611C
_08024368:
	ldr r1, _08024370 @ =gPlayer
	ldr r0, _08024374 @ =PlayerCB_801225C
	b _080245EC
	.align 2, 0
_08024370: .4byte gPlayer
_08024374: .4byte PlayerCB_801225C
_08024378:
	ldr r1, _08024380 @ =gPlayer
	ldr r0, _08024384 @ =PlayerCB_8027250
	b _080245EC
	.align 2, 0
_08024380: .4byte gPlayer
_08024384: .4byte PlayerCB_8027250
_08024388:
	ldr r0, _080243C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802439E
	ldr r0, _080243C8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0802439E:
	mov r0, ip
	ldr r1, [r0, #0x20]
	ldr r0, _080243CC @ =0x3000200A
	ands r0, r1
	cmp r0, #0
	beq _080243D0
	movs r0, #0x82
	lsls r0, r0, #0x14
	orrs r1, r0
	mov r3, ip
	str r1, [r3, #0x20]
	mov r0, ip
	adds r0, #0x5c
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080245EE
	.align 2, 0
_080243C4: .4byte gGameMode
_080243C8: .4byte gUnknown_03005424
_080243CC: .4byte 0x3000200A
_080243D0:
	movs r0, #0x80
	lsls r0, r0, #0x14
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
	ldr r1, _080243E0 @ =gPlayer
	ldr r0, _080243E4 @ =PlayerCB_80273D0
	b _080245EC
	.align 2, 0
_080243E0: .4byte gPlayer
_080243E4: .4byte PlayerCB_80273D0
_080243E8:
	ldr r0, _08024408 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024400
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_08024400:
	ldr r1, _0802440C @ =gPlayer
	ldr r0, _08024410 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024408: .4byte gUnknown_03005424
_0802440C: .4byte gPlayer
_08024410: .4byte PlayerCB_8028E24
_08024414:
	ldr r0, _08024434 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802442C
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_0802442C:
	ldr r1, _08024438 @ =gPlayer
	ldr r0, _0802443C @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024434: .4byte gUnknown_03005424
_08024438: .4byte gPlayer
_0802443C: .4byte PlayerCB_8028E24
_08024440:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024454 @ =gPlayer
	ldr r0, _08024458 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024454: .4byte gPlayer
_08024458: .4byte PlayerCB_8028E24
_0802445C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x30
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024470 @ =gPlayer
	ldr r0, _08024474 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024470: .4byte gPlayer
_08024474: .4byte PlayerCB_8028E24
_08024478:
	ldr r0, _08024490 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024494
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
	b _0802449C
	.align 2, 0
_08024490: .4byte gUnknown_03005424
_08024494:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
_0802449C:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080244A8 @ =gPlayer
	ldr r0, _080244AC @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_080244A8: .4byte gPlayer
_080244AC: .4byte PlayerCB_8028E24
_080244B0:
	ldr r0, _080244C8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080244CC
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
	b _080244D4
	.align 2, 0
_080244C8: .4byte gUnknown_03005424
_080244CC:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
_080244D4:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080244E0 @ =gPlayer
	ldr r0, _080244E4 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_080244E0: .4byte gPlayer
_080244E4: .4byte PlayerCB_8028E24
_080244E8:
	ldr r0, _08024500 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024504
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
	b _0802450C
	.align 2, 0
_08024500: .4byte gUnknown_03005424
_08024504:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
_0802450C:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024518 @ =gPlayer
	ldr r0, _0802451C @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024518: .4byte gPlayer
_0802451C: .4byte PlayerCB_8028E24
_08024520:
	ldr r0, _08024538 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802453C
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
	b _08024544
	.align 2, 0
_08024538: .4byte gUnknown_03005424
_0802453C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
_08024544:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024550 @ =gPlayer
	ldr r0, _08024554 @ =PlayerCB_8028E24
	b _080245EC
	.align 2, 0
_08024550: .4byte gPlayer
_08024554: .4byte PlayerCB_8028E24
_08024558:
	ldr r1, _08024560 @ =gPlayer
	ldr r0, _08024564 @ =PlayerCB_8029158
	b _080245EC
	.align 2, 0
_08024560: .4byte gPlayer
_08024564: .4byte PlayerCB_8029158
_08024568:
	ldr r1, _08024570 @ =gPlayer
	ldr r0, _08024574 @ =PlayerCB_802A300
	b _080245EC
	.align 2, 0
_08024570: .4byte gPlayer
_08024574: .4byte PlayerCB_802A300
_08024578:
	ldr r1, _08024580 @ =gPlayer
	ldr r0, _08024584 @ =PlayerCB_8026764
	b _080245EC
	.align 2, 0
_08024580: .4byte gPlayer
_08024584: .4byte PlayerCB_8026764
_08024588:
	ldr r1, _08024590 @ =gPlayer
	ldr r0, _08024594 @ =PlayerCB_80269C0
	b _080245EC
	.align 2, 0
_08024590: .4byte gPlayer
_08024594: .4byte PlayerCB_80269C0
_08024598:
	ldr r1, _080245A0 @ =gPlayer
	ldr r0, _080245A4 @ =PlayerCB_8026A4C
	b _080245EC
	.align 2, 0
_080245A0: .4byte gPlayer
_080245A4: .4byte PlayerCB_8026A4C
_080245A8:
	ldr r1, _080245B0 @ =gPlayer
	ldr r0, _080245B4 @ =PlayerCB_802A258
	b _080245EC
	.align 2, 0
_080245B0: .4byte gPlayer
_080245B4: .4byte PlayerCB_802A258
_080245B8:
	ldr r1, _080245C0 @ =gPlayer
	ldr r0, _080245C4 @ =PlayerCB_8026E24
	b _080245EC
	.align 2, 0
_080245C0: .4byte gPlayer
_080245C4: .4byte PlayerCB_8026E24
_080245C8:
	ldr r1, _080245D0 @ =gPlayer
	ldr r0, _080245D4 @ =PlayerCB_8026F10
	b _080245EC
	.align 2, 0
_080245D0: .4byte gPlayer
_080245D4: .4byte PlayerCB_8026F10
_080245D8:
	ldr r1, _080245E0 @ =gPlayer
	ldr r0, _080245E4 @ =PlayerCB_8026FC8
	b _080245EC
	.align 2, 0
_080245E0: .4byte gPlayer
_080245E4: .4byte PlayerCB_8026FC8
_080245E8:
	ldr r1, _08024604 @ =gPlayer
	ldr r0, _08024608 @ =PlayerCB_8027114
_080245EC:
	str r0, [r1]
_080245EE:
	mov r3, ip
	adds r3, #0x6d
	ldrb r0, [r3]
	mov r1, ip
	adds r1, #0x6f
	movs r2, #0
	strb r0, [r1]
	strb r2, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08024604: .4byte gPlayer
_08024608: .4byte PlayerCB_8027114

	thumb_func_start sub_802460C
sub_802460C: @ 0x0802460C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _0802463C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024648
	ldr r0, _08024640 @ =0x04000128
	ldr r1, [r0]
	lsls r1, r1, #0x1a
	ldr r0, _08024644 @ =gCamera
	adds r0, #0x66
	lsrs r1, r1, #0x1e
	ldrb r0, [r0]
	cmp r1, r0
	beq _08024648
	adds r1, r3, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	movs r6, #0
	adds r5, r1, #0
	b _080246BE
	.align 2, 0
_0802463C: .4byte gGameMode
_08024640: .4byte 0x04000128
_08024644: .4byte gCamera
_08024648:
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r6, [r0]
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xe
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _080246BE
	ldr r0, _080246D0 @ =gInput
	ldrh r4, [r0]
	strh r4, [r5]
	ldrb r0, [r7]
	cmp r0, #2
	bls _080246BE
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080246BE
	movs r0, #0xf0
	ands r0, r4
	lsrs r2, r0, #4
	ldr r0, _080246D4 @ =gUnknown_03005590
	ldr r1, [r0]
	ldrh r0, [r3, #0x32]
	adds r1, r0, r1
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _08024690
	movs r1, #1
_08024690:
	lsls r2, r1
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x1c
	lsrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x18
	ldr r0, _080246D8 @ =0x0000FF0F
	ands r0, r4
	orrs r0, r2
	strh r0, [r5]
	ldrh r0, [r3, #0x32]
	subs r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080246BE
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xbf
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
_080246BE:
	ldrh r0, [r5]
	eors r6, r0
	ands r6, r0
	adds r0, r3, #0
	adds r0, #0x5e
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080246D0: .4byte gInput
_080246D4: .4byte gUnknown_03005590
_080246D8: .4byte 0x0000FF0F

	thumb_func_start sub_80246DC
sub_80246DC: @ 0x080246DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r5, [r0]
	mov sb, r5
	movs r0, #0x68
	adds r0, r0, r4
	mov r8, r0
	ldrh r3, [r0]
	movs r1, #0x6a
	adds r1, r1, r4
	mov ip, r1
	ldrh r2, [r1]
	mov sl, r2
	ldr r1, _0802476C @ =gPlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	subs r0, r3, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080247CC
	cmp r2, #0
	bne _08024770
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08024770
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08024770
	movs r0, #1
	mov r1, ip
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	b _0802485C
	.align 2, 0
_0802476C: .4byte gPlayerCharacterIdleAnims
_08024770:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	adds r5, r4, #0
	adds r5, #0x6a
	ldrh r0, [r5]
	cmp r0, #1
	bne _0802485C
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802485C
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080247C4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E6D4
	adds r1, r0, #0
	ldr r0, _080247C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802485C
	cmp r1, #0x20
	bgt _0802485C
	movs r0, #2
	strh r0, [r5]
	b _0802485C
	.align 2, 0
_080247C4: .4byte sub_801EE64
_080247C8: .4byte gGameMode
_080247CC:
	cmp r5, #0x26
	bne _080247EA
	cmp r3, #0x34
	bne _0802485C
	cmp r2, #0
	bne _080247E4
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_080247E4:
	cmp r2, #1
	bne _0802485C
	b _0802484A
_080247EA:
	cmp r5, #0x27
	bne _0802480C
	cmp r3, #0x35
	bne _0802485C
	cmp r2, #0
	bne _0802485C
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802485C
	adds r0, r7, #0
	adds r0, #0x34
	mov r1, r8
	strh r0, [r1]
	b _08024856
_0802480C:
	cmp r5, #0x25
	bne _0802482A
	cmp r3, #0x41
	bne _0802485C
	cmp r2, #0
	bne _08024824
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_08024824:
	cmp r2, #1
	bne _0802485C
	b _0802484A
_0802482A:
	mov r0, sb
	cmp r0, #0x39
	bne _0802485C
	cmp r3, #0x42
	bne _0802485C
	cmp r2, #0
	bne _08024844
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_08024844:
	mov r0, sl
	cmp r0, #1
	bne _0802485C
_0802484A:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802485C
_08024856:
	movs r0, #2
_08024858:
	mov r1, ip
	strh r0, [r1]
_0802485C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802486C
sub_802486C: @ 0x0802486C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080248E0
	adds r0, r3, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	beq _080248E0
	ldr r7, _08024908 @ =gUnknown_080D6736
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r5, r3, #0
	adds r5, #0x68
	strh r4, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _080248C6
	ldr r0, _0802490C @ =gPlayerCharacterIdleAnims
	adds r1, r3, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r4, r0
	strh r0, [r5]
_080248C6:
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r1, r7, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_080248E0:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r1
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #0x34
	bls _080248FC
	b _08024A96
_080248FC:
	lsls r0, r0, #2
	ldr r1, _08024910 @ =_08024914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024908: .4byte gUnknown_080D6736
_0802490C: .4byte gPlayerCharacterIdleAnims
_08024910: .4byte _08024914
_08024914: @ jump table
	.4byte _080249E8 @ case 0
	.4byte _08024A96 @ case 1
	.4byte _08024A96 @ case 2
	.4byte _08024A96 @ case 3
	.4byte _08024A96 @ case 4
	.4byte _08024A96 @ case 5
	.4byte _08024A96 @ case 6
	.4byte _08024A3A @ case 7
	.4byte _08024A96 @ case 8
	.4byte _08024A96 @ case 9
	.4byte _08024A96 @ case 10
	.4byte _08024A96 @ case 11
	.4byte _08024A96 @ case 12
	.4byte _08024A96 @ case 13
	.4byte _08024A96 @ case 14
	.4byte _08024A96 @ case 15
	.4byte _08024A96 @ case 16
	.4byte _08024A96 @ case 17
	.4byte _08024A96 @ case 18
	.4byte _08024A96 @ case 19
	.4byte _08024A96 @ case 20
	.4byte _08024A96 @ case 21
	.4byte _08024A96 @ case 22
	.4byte _08024A96 @ case 23
	.4byte _08024A96 @ case 24
	.4byte _08024A96 @ case 25
	.4byte _08024A96 @ case 26
	.4byte _08024A96 @ case 27
	.4byte _08024A96 @ case 28
	.4byte _08024A96 @ case 29
	.4byte _08024A96 @ case 30
	.4byte _08024A96 @ case 31
	.4byte _08024A96 @ case 32
	.4byte _08024A96 @ case 33
	.4byte _08024A96 @ case 34
	.4byte _08024A96 @ case 35
	.4byte _08024A96 @ case 36
	.4byte _08024A96 @ case 37
	.4byte _08024A96 @ case 38
	.4byte _08024A96 @ case 39
	.4byte _08024A96 @ case 40
	.4byte _08024A96 @ case 41
	.4byte _08024A70 @ case 42
	.4byte _08024A70 @ case 43
	.4byte _08024A76 @ case 44
	.4byte _08024A76 @ case 45
	.4byte _08024A96 @ case 46
	.4byte _08024A96 @ case 47
	.4byte _08024A96 @ case 48
	.4byte _08024A96 @ case 49
	.4byte _08024A10 @ case 50
	.4byte _08024A10 @ case 51
	.4byte _08024A10 @ case 52
_080249E8:
	ldr r1, _08024A2C @ =gPlayerCharacterIdleAnims
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #9
	adds r1, r3, #0
	adds r1, #0x68
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r4, r1, #0
_08024A10:
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A20
	rsbs r0, r0, #0
_08024A20:
	cmp r0, #7
	ble _08024A30
	cmp r0, #0x80
	ble _08024A32
	movs r0, #0x80
	b _08024A32
	.align 2, 0
_08024A2C: .4byte gPlayerCharacterIdleAnims
_08024A30:
	movs r0, #8
_08024A32:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	b _08024A96
_08024A3A:
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #1
	bne _08024A96
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A60
	rsbs r0, r0, #0
_08024A60:
	cmp r0, #7
	ble _08024A6C
	cmp r0, #0x80
	ble _08024A88
	movs r0, #0x80
	b _08024A88
_08024A6C:
	movs r0, #8
	b _08024A88
_08024A70:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	b _08024A7A
_08024A76:
	movs r4, #0x14
	ldrsh r0, [r3, r4]
_08024A7A:
	cmp r0, #0
	bge _08024A80
	rsbs r0, r0, #0
_08024A80:
	asrs r1, r0, #8
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #8
_08024A88:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
_08024A96:
	ldr r0, _08024B0C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024AA8
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
_08024AA8:
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r1, [r0]
	adds r6, r0, #0
	mov r5, ip
	adds r5, #0x20
	cmp r1, #0
	bne _08024ACA
	mov r1, ip
	ldrh r0, [r1, #0xa]
	ldrh r1, [r4]
	cmp r0, r1
	bne _08024ACA
	ldrb r0, [r5]
	ldrh r1, [r2]
	cmp r0, r1
	beq _08024AF6
_08024ACA:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r2]
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	ldrb r0, [r7]
	cmp r0, #2
	bls _08024AF6
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #1
	strb r0, [r1]
_08024AF6:
	mov r0, r8
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024B0C: .4byte gGameMode

	thumb_func_start sub_8024B10
sub_8024B10: @ 0x08024B10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r5, #0xc
	adds r6, r1, #0
	ldr r0, _08024BBC @ =gCamera
	ldrh r3, [r0]
	ldrh r4, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08024B3A
	ldrh r1, [r5, #0x1e]
	ldr r0, _08024BC0 @ =0x0000FFFF
	cmp r1, r0
	bne _08024B3C
_08024B3A:
	movs r2, #1
_08024B3C:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _08024B84
	cmp r0, #0x29
	beq _08024B84
	cmp r0, #0x3e
	beq _08024B84
	cmp r0, #0x3f
	beq _08024B84
	cmp r0, #0x57
	bne _08024C68
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08024C68
_08024B84:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r5, #0x10]
	ldr r0, _08024BC4 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024BC8
	movs r0, #0xff
	lsls r0, r0, #8
	b _08024BCC
	.align 2, 0
_08024BBC: .4byte gCamera
_08024BC0: .4byte 0x0000FFFF
_08024BC4: .4byte 0xFFFFF3FF
_08024BC8:
	movs r0, #0x80
	lsls r0, r0, #1
_08024BCC:
	strh r0, [r6, #2]
	ldr r2, _08024C14 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024BE2
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
_08024BE2:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08024BF0
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_08024BF0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldrh r1, [r6]
	adds r1, r1, r0
	ldr r2, _08024C18 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _08024C1C @ =0x000003FF
	ands r0, r1
	strh r0, [r6]
	b _08024C26
	.align 2, 0
_08024C14: .4byte gUnknown_03005424
_08024C18: .4byte 0xFFFFFF00
_08024C1C: .4byte 0x000003FF
_08024C20:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
_08024C26:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08024C64 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08024CC2
	.align 2, 0
_08024C64: .4byte gGameMode
_08024C68:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r5, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024C88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r5, #0x10]
	b _08024C94
_08024C88:
	ldr r0, _08024CAC @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r5, #0x10]
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
_08024C94:
	ldr r0, _08024CB0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024CB4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08024CBA
	.align 2, 0
_08024CAC: .4byte 0xFFFFFBFF
_08024CB0: .4byte gUnknown_03005424
_08024CB4:
	ldr r0, [r5, #0x10]
	ldr r1, _08024D9C @ =0xFFFFF7FF
	ands r0, r1
_08024CBA:
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
_08024CC2:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08024CF2
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08024CF8
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024CF2
	ldr r0, _08024DA4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08024CF8
_08024CF2:
	adds r0, r5, #0
	bl sub_80051E8
_08024CF8:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	b _08024F5C
_08024D02:
	ldr r4, _08024DA8 @ =gMultiSioSend
	ldr r2, _08024DAC @ =gMultiplayerPlayerTasks
	ldr r0, _08024DB0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r4]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #4]
	ldrh r3, [r5, #0xa]
	strh r3, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #5
	bne _08024D6C
	ldr r1, _08024DB4 @ =gPlayerCharacterIdleAnims
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, r3, r1
	ldr r0, _08024DB8 @ =gRingCount
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4, #6]
_08024D6C:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r4, #0xb]
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024DBC
	ldrh r0, [r4, #8]
	movs r1, #1
	orrs r0, r1
	b _08024DC2
	.align 2, 0
_08024D9C: .4byte 0xFFFFF7FF
_08024DA0: .4byte gGameMode
_08024DA4: .4byte gUnknown_03005590
_08024DA8: .4byte gMultiSioSend
_08024DAC: .4byte gMultiplayerPlayerTasks
_08024DB0: .4byte 0x04000128
_08024DB4: .4byte gPlayerCharacterIdleAnims
_08024DB8: .4byte gRingCount
_08024DBC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DD8 @ =0x0000FFFE
	ands r0, r1
_08024DC2:
	strh r0, [r4, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	bne _08024DDC
	ldrh r1, [r4, #8]
	movs r0, #2
	orrs r0, r1
	b _08024DE2
	.align 2, 0
_08024DD8: .4byte 0x0000FFFE
_08024DDC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DF8 @ =0x0000FFFD
	ands r0, r1
_08024DE2:
	strh r0, [r4, #8]
	ldr r0, _08024DFC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024E00
	ldrh r1, [r4, #8]
	movs r0, #8
	orrs r0, r1
	b _08024E06
	.align 2, 0
_08024DF8: .4byte 0x0000FFFD
_08024DFC: .4byte gUnknown_03005424
_08024E00:
	ldrh r1, [r4, #8]
	ldr r0, _08024E38 @ =0x0000FFF7
	ands r0, r1
_08024E06:
	strh r0, [r4, #8]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024E2E
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024E3C
_08024E2E:
	ldrh r1, [r4, #8]
	movs r0, #4
	orrs r0, r1
	b _08024E42
	.align 2, 0
_08024E38: .4byte 0x0000FFF7
_08024E3C:
	ldrh r1, [r4, #8]
	ldr r0, _08024E5C @ =0x0000FFFB
	ands r0, r1
_08024E42:
	strh r0, [r4, #8]
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08024E60
	ldrh r1, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	b _08024E66
	.align 2, 0
_08024E5C: .4byte 0x0000FFFB
_08024E60:
	ldrh r1, [r4, #8]
	ldr r0, _08024E7C @ =0x0000FEFF
	ands r0, r1
_08024E66:
	strh r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08024E80
	ldrh r1, [r4, #8]
	movs r0, #0x40
	orrs r0, r1
	b _08024E86
	.align 2, 0
_08024E7C: .4byte 0x0000FEFF
_08024E80:
	ldrh r1, [r4, #8]
	ldr r0, _08024EB8 @ =0x0000FFBF
	ands r0, r1
_08024E86:
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldr r2, _08024EBC @ =0x0000FFCF
	ands r2, r0
	strh r2, [r4, #8]
	ldr r3, _08024EC0 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024EC4
	movs r0, #0x80
	orrs r1, r0
	b _08024EC8
	.align 2, 0
_08024EB8: .4byte 0x0000FFBF
_08024EBC: .4byte 0x0000FFCF
_08024EC0: .4byte gPlayer
_08024EC4:
	ldr r0, _08024EDC @ =0x0000FF7F
	ands r1, r0
_08024EC8:
	strh r1, [r4, #8]
	mov r0, sb
	cmp r0, #0
	beq _08024EE0
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _08024EE6
	.align 2, 0
_08024EDC: .4byte 0x0000FF7F
_08024EE0:
	ldrh r1, [r4, #8]
	ldr r0, _08024F68 @ =0x0000F7FF
	ands r0, r1
_08024EE6:
	strh r0, [r4, #8]
	ldr r6, _08024F6C @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08024F4C
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08024F2C
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _08024F4C
_08024F16:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _08024F2C
	strb r2, [r5]
_08024F2C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08024F4C
	ldr r0, _08024F6C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08024F2C
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _08024F16
_08024F4C:
	ldrh r0, [r4, #8]
	ldr r1, _08024F70 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r4, #8]
	ldrb r0, [r5]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r4, #8]
_08024F5C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F68: .4byte 0x0000F7FF
_08024F6C: .4byte 0x04000128
_08024F70: .4byte 0x0000F9FF

	thumb_func_start sub_8024F74
sub_8024F74: @ 0x08024F74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r6, #0xc
	adds r4, r1, #0
	ldr r0, _08024FB4 @ =gCamera
	ldrh r3, [r0]
	ldrh r7, [r0, #4]
	ldr r0, _08024FB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08024FC4
	ldr r0, _08024FBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08024FC0 @ =gMultiSioRecv
	adds r1, r1, r0
	ldrh r2, [r1, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #6]
	ldrh r1, [r1, #4]
	b _08024FD4
	.align 2, 0
_08024FB4: .4byte gCamera
_08024FB8: .4byte gGameMode
_08024FBC: .4byte 0x04000128
_08024FC0: .4byte gMultiSioRecv
_08024FC4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #6]
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
_08024FD4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #8]
	adds r2, r6, #0
	adds r2, #0x22
	movs r0, #0x10
	strb r0, [r2]
	ldr r1, [r5, #0x20]
	movs r0, #0x40
	ands r0, r1
	mov sl, r1
	cmp r0, #0
	beq _08024FF4
	movs r0, #8
	strb r0, [r2]
_08024FF4:
	adds r0, r5, #0
	adds r0, #0x85
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #4
	bls _08025004
	b _08025306
_08025004:
	lsls r0, r1, #2
	ldr r1, _08025010 @ =_08025014
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025010: .4byte _08025014
_08025014: @ jump table
	.4byte _08025306 @ case 0
	.4byte _08025028 @ case 1
	.4byte _08025180 @ case 2
	.4byte _08025306 @ case 3
	.4byte _08025306 @ case 4
_08025028:
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov ip, r2
	ldr r1, _080250B0 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08025058
	cmp r2, #1
	beq _0802506E
_08025058:
	cmp r1, #4
	bne _08025060
	cmp r2, #0
	beq _0802506E
_08025060:
	cmp r3, #0x46
	beq _08025066
	b _08025306
_08025066:
	mov r0, ip
	cmp r0, #0
	beq _0802506E
	b _08025306
_0802506E:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0xb0
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _080250B4 @ =gUnknown_030054B8
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
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080250B8
	movs r0, #0xff
	lsls r0, r0, #8
	b _080250BC
	.align 2, 0
_080250B0: .4byte gPlayerCharacterIdleAnims
_080250B4: .4byte gUnknown_030054B8
_080250B8:
	movs r0, #0x80
	lsls r0, r0, #1
_080250BC:
	strh r0, [r4, #2]
	ldr r2, _08025104 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080250D2
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_080250D2:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080250E0
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_080250E0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025110
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025108 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802510C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _08025116
	.align 2, 0
_08025104: .4byte gUnknown_03005424
_08025108: .4byte 0xFFFFFF00
_0802510C: .4byte 0x000003FF
_08025110:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_08025116:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025174
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	beq _0802515E
	b _08025306
_0802515E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025174
	ldr r0, _0802517C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025174
	b _08025306
_08025174:
	adds r0, r6, #0
	bl sub_80051E8
	b _08025306
	.align 2, 0
_0802517C: .4byte gUnknown_03005590
_08025180:
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	mov ip, r2
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	mov sb, r0
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov r8, r2
	ldr r1, _080251F4 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080251BC
	cmp r2, #1
	beq _080251D2
_080251BC:
	cmp r1, #4
	bne _080251C4
	cmp r2, #0
	beq _080251D2
_080251C4:
	cmp r3, #0x46
	beq _080251CA
	b _08025306
_080251CA:
	mov r2, r8
	cmp r2, #0
	beq _080251D2
	b _08025306
_080251D2:
	mov r3, ip
	cmp r3, #0
	bne _080251DE
	mov r0, sb
	cmp r0, #0
	beq _080251F8
_080251DE:
	mov r0, ip
	mov r1, sb
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08025208
	.align 2, 0
_080251F4: .4byte gPlayerCharacterIdleAnims
_080251F8:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	movs r1, #0x40
	cmp r0, #0
	beq _08025206
	movs r1, #0xc0
_08025206:
	adds r0, r1, #0
_08025208:
	adds r1, r5, #0
	adds r1, #0xad
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08025244 @ =gUnknown_030054B8
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
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08025248
	movs r0, #0xff
	lsls r0, r0, #8
	b _0802524C
	.align 2, 0
_08025244: .4byte gUnknown_030054B8
_08025248:
	movs r0, #0x80
	lsls r0, r0, #1
_0802524C:
	strh r0, [r4, #2]
	ldr r2, _08025294 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025262
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_08025262:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08025270
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_08025270:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080252A0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025298 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802529C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _080252A6
	.align 2, 0
_08025294: .4byte gUnknown_03005424
_08025298: .4byte 0xFFFFFF00
_0802529C: .4byte 0x000003FF
_080252A0:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_080252A6:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025300
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08025306
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025300
	ldr r0, _08025314 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025306
_08025300:
	adds r0, r6, #0
	bl sub_80051E8
_08025306:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025314: .4byte gUnknown_03005590
