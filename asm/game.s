.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

@; NOTE / FIXME(?): These are only used by player_super_sonic.
@;                  But that already includes .rodata, which is 
@                   away from gUnknown_080D650C & gUnknown_080D661C
    .global gUnknown_080D650C
gUnknown_080D650C:
    .incbin "baserom.gba", 0x000D650C, 0x110

    .global gUnknown_080D661C
gUnknown_080D661C:
    .incbin "baserom.gba", 0x000D661C, 0x110

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

@ type: CameraMain
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

	thumb_func_start StageInit_Zone7
StageInit_Zone7: @ 0x0801D95C
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

	thumb_func_start StageInit_ZoneFinal_0
StageInit_ZoneFinal_0: @ 0x0801DF08
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

	thumb_func_start DestroyCameraMovementTask
DestroyCameraMovementTask: @ 0x0801E028
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

	thumb_func_start TaskDestructor_801E040
TaskDestructor_801E040: @ 0x0801E040
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

	thumb_func_start Task_801E0A8
Task_801E0A8: @ 0x0801E0A8
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
	ldr r0, _0801E100 @ =Task_801E104
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
_0801E100: .4byte Task_801E104

	thumb_func_start Task_801E104
Task_801E104: @ 0x0801E104
	push {lr}
	bl sub_801C394
	ldr r1, _0801E114 @ =gUnknown_030054B8
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E114: .4byte gUnknown_030054B8

	thumb_func_start StageInit_Zone2
StageInit_Zone2: @ 0x0801E118
	ldr r1, _0801E128 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801E128: .4byte gBgScrollRegs

    thumb_func_start nullsub_801E12C
nullsub_801E12C:
    bx lr
    .align 2, 0


	thumb_func_start nullsub_801E130
nullsub_801E130: @ 0x0801E130
	bx lr
	.align 2, 0

@ type: CameraMain
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
	ldr r1, _0801E19C @ =HBlankCB_801E434
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
_0801E19C: .4byte HBlankCB_801E434
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

@ type: CameraMain
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
	ldr r0, _0801E3CC @ =gActiveBossTask
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
_0801E3CC: .4byte gActiveBossTask
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

	thumb_func_start HBlankCB_801E434
HBlankCB_801E434: @ 0x0801E434
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
