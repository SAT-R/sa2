.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

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
	ldr r0, _0801D390 @ =gComputedBgBuffer
	ldr r3, [r0]
	ldr r0, _0801D394 @ =gStageTime
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
_0801D390: .4byte gComputedBgBuffer
_0801D394: .4byte gStageTime
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

@ type: CameraMain
	thumb_func_start StageBgUpdate_Zone6Acts12
StageBgUpdate_Zone6Acts12: @ 0x0801D534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0801D568 @ =gUnknown_03005850
	ldr r1, _0801D56C @ =gBgScrollRegs
	asrs r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, _0801D570 @ =gStageTime
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
_0801D570: .4byte gStageTime
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
