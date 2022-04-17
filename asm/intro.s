.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_808B3FC_CreateIntro
sub_808B3FC_CreateIntro: @ 0x0808B3FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0808B518 @ =sub_808D598
	ldr r1, _0808B51C @ =0x00000F64
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0808B520 @ =gUnknown_03000F34
	adds r2, r1, r0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	ldr r0, _0808B524 @ =gUnknown_03000F36
	adds r2, r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2]
	ldr r0, _0808B528 @ =gUnknown_03000F38
	adds r2, r1, r0
	movs r0, #2
	strh r0, [r2]
	ldr r2, _0808B52C @ =gUnknown_03000F42
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, #2
	adds r0, r1, r2
	strh r4, [r0]
	subs r2, #2
	adds r0, r1, r2
	strh r4, [r0]
	ldr r0, _0808B530 @ =gUnknown_03000F3A
	adds r2, r1, r0
	movs r0, #0x20
	strh r0, [r2]
	ldr r2, _0808B534 @ =gUnknown_03000F3C
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0808B538 @ =gUnknown_03000F3D
	adds r1, r1, r3
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #9
	mov r8, r0
	movs r7, #8
_0808B46C:
	adds r5, r4, #1
	mov r0, r8
	adds r1, r7, #0
	bl Div
	ldr r2, _0808B53C @ =0x00000F34
	adds r1, r6, r2
	ldrh r1, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	lsls r4, r4, #1
	movs r3, #0xad
	lsls r3, r3, #2
	adds r0, r6, r3
	adds r0, r0, r4
	strh r1, [r0]
	mov r0, r8
	bl Div
	ldr r2, _0808B540 @ =0x00000DF4
	adds r1, r6, r2
	adds r1, r1, r4
	strh r0, [r1]
	adds r7, #8
	adds r4, r5, #0
	cmp r4, #0x9f
	ble _0808B46C
	movs r3, #0x9c
	lsls r3, r3, #2
	adds r4, r6, r3
	movs r2, #0
	movs r1, #0
	movs r0, #1
	strh r0, [r4]
	strh r1, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	adds r0, #0xfe
	strh r0, [r4, #6]
	ldr r0, _0808B544 @ =0x00003FBF
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	movs r0, #0x9f
	lsls r0, r0, #2
	adds r1, r6, r0
	strb r2, [r1]
	strb r2, [r1, #2]
	ldr r3, _0808B548 @ =0x00000F38
	adds r0, r6, r3
	ldrh r0, [r0]
	strh r0, [r1, #0x34]
	movs r0, #0xe
	strb r0, [r1, #1]
	ldr r0, _0808B54C @ =gUnknown_080E1054
	str r0, [r1, #4]
	ldr r0, _0808B550 @ =gUnknown_080E0EF4
	str r0, [r1, #8]
	ldr r3, _0808B554 @ =0x000002B2
	adds r0, r6, r3
	strb r2, [r0]
	ldr r0, _0808B558 @ =gUnknown_03005B80
	str r1, [r0]
	str r6, [r0, #4]
	adds r0, r6, #0
	bl sub_808B768
	movs r0, #1
	bl m4aSongNumStart
	ldr r2, _0808B55C @ =gFlags
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r2]
	adds r0, r4, #0
	bl sub_802D4CC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B518: .4byte sub_808D598
_0808B51C: .4byte 0x00000F64
_0808B520: .4byte gUnknown_03000F34
_0808B524: .4byte gUnknown_03000F36
_0808B528: .4byte gUnknown_03000F38
_0808B52C: .4byte gUnknown_03000F42
_0808B530: .4byte gUnknown_03000F3A
_0808B534: .4byte gUnknown_03000F3C
_0808B538: .4byte gUnknown_03000F3D
_0808B53C: .4byte 0x00000F34
_0808B540: .4byte 0x00000DF4
_0808B544: .4byte 0x00003FBF
_0808B548: .4byte 0x00000F38
_0808B54C: .4byte gUnknown_080E1054
_0808B550: .4byte gUnknown_080E0EF4
_0808B554: .4byte 0x000002B2
_0808B558: .4byte gUnknown_03005B80
_0808B55C: .4byte gFlags

	thumb_func_start sub_808B560
sub_808B560: @ 0x0808B560
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0808B64C @ =0x00000F34
	adds r1, r7, r0
	movs r6, #0
	movs r4, #0
	movs r0, #0xa0
	lsls r0, r0, #4
	strh r0, [r1]
	ldr r3, _0808B650 @ =0x00000F36
	adds r1, r7, r3
	movs r0, #3
	strh r0, [r1]
	ldr r1, _0808B654 @ =0x00000F38
	adds r0, r7, r1
	movs r3, #2
	strh r3, [r0]
	adds r1, #0xa
	adds r0, r7, r1
	strb r6, [r0]
	subs r1, #2
	adds r0, r7, r1
	strh r4, [r0]
	subs r1, #2
	adds r0, r7, r1
	strh r4, [r0]
	ldr r0, _0808B658 @ =0x00000F3A
	adds r1, r7, r0
	movs r5, #0x20
	movs r0, #0x20
	strh r0, [r1]
	ldr r1, _0808B65C @ =0x00000F3C
	adds r0, r7, r1
	strb r6, [r0]
	adds r1, #1
	adds r0, r7, r1
	movs r2, #1
	strb r2, [r0]
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1]
	strh r4, [r1, #4]
	strh r3, [r1, #2]
	movs r3, #0x80
	lsls r3, r3, #2
	mov r8, r3
	mov r0, r8
	strh r0, [r1, #6]
	ldr r0, _0808B660 @ =0x00003FBF
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	adds r0, r7, #0
	bl sub_808B884
	ldr r1, _0808B664 @ =gDispCnt
	ldr r0, _0808B668 @ =0x00001641
	strh r0, [r1]
	ldr r1, _0808B66C @ =gBgCntRegs
	ldr r0, _0808B670 @ =0x00001F04
	strh r0, [r1]
	ldr r0, _0808B674 @ =0x00009D0A
	strh r0, [r1, #2]
	ldr r0, _0808B678 @ =0x00005A81
	strh r0, [r1, #4]
	str r4, [sp]
	ldr r1, _0808B67C @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	str r3, [r1, #4]
	ldr r0, _0808B680 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0808B684 @ =gUnknown_03004D80
	strb r6, [r2]
	ldr r0, _0808B688 @ =gUnknown_03002280
	strb r6, [r0]
	strb r6, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	strb r5, [r0, #3]
	strb r6, [r2, #1]
	strb r6, [r0, #4]
	strb r6, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r5, [r0, #7]
	strb r6, [r2, #2]
	strb r6, [r0, #8]
	strb r6, [r0, #9]
	strb r1, [r0, #0xa]
	strb r5, [r0, #0xb]
	ldr r1, _0808B68C @ =gBgScrollRegs
	movs r0, #8
	strh r0, [r1, #4]
	mov r0, r8
	strh r0, [r1, #6]
	adds r1, r7, #0
	str r3, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808B690 @ =0x0600D000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r0, _0808B694 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bhi _0808B698
	movs r0, #0x84
	lsls r0, r0, #1
	b _0808B69A
	.align 2, 0
_0808B64C: .4byte 0x00000F34
_0808B650: .4byte 0x00000F36
_0808B654: .4byte 0x00000F38
_0808B658: .4byte 0x00000F3A
_0808B65C: .4byte 0x00000F3C
_0808B660: .4byte 0x00003FBF
_0808B664: .4byte gDispCnt
_0808B668: .4byte 0x00001641
_0808B66C: .4byte gBgCntRegs
_0808B670: .4byte 0x00001F04
_0808B674: .4byte 0x00009D0A
_0808B678: .4byte 0x00005A81
_0808B67C: .4byte 0x040000D4
_0808B680: .4byte 0x85004000
_0808B684: .4byte gUnknown_03004D80
_0808B688: .4byte gUnknown_03002280
_0808B68C: .4byte gBgScrollRegs
_0808B690: .4byte 0x0600D000
_0808B694: .4byte gLoadedSaveGame
_0808B698:
	ldr r0, _0808B73C @ =0x00000109
_0808B69A:
	strh r0, [r7, #0x1c]
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x1a
	strh r0, [r1, #0x26]
	movs r0, #0xa
	strh r0, [r1, #0x28]
	adds r0, r1, #0
	adds r0, #0x2a
	strb r5, [r0]
	movs r0, #6
	strh r0, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	ldr r2, _0808B740 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808B744 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0808B748 @ =gBgCntRegs
	ldrh r1, [r2, #4]
	ldr r0, _0808B74C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2, #4]
	ldr r0, _0808B750 @ =gBldRegs
	strh r4, [r0]
	ldr r2, _0808B754 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0808B758 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0808B75C @ =0x06008000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0808B760 @ =0x0600E800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _0808B764 @ =0x00000105
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x20
	strh r1, [r0, #0x26]
	movs r1, #0x40
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0x6a
	strb r5, [r1]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #2
	bl m4aSongNumStart
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r7, r1
	bl sub_802D4CC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B73C: .4byte 0x00000109
_0808B740: .4byte gDispCnt
_0808B744: .4byte 0x0000FEFF
_0808B748: .4byte gBgCntRegs
_0808B74C: .4byte 0x0000DFFF
_0808B750: .4byte gBldRegs
_0808B754: .4byte gFlags
_0808B758: .4byte 0xFFFF7FFF
_0808B75C: .4byte 0x06008000
_0808B760: .4byte 0x0600E800
_0808B764: .4byte 0x00000105

	thumb_func_start sub_808B768
sub_808B768: @ 0x0808B768
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, _0808B84C @ =gDispCnt
	ldr r0, _0808B850 @ =0x00001441
	strh r0, [r1]
	ldr r1, _0808B854 @ =gBgCntRegs
	movs r5, #0
	movs r4, #0
	ldr r0, _0808B858 @ =0x00001F04
	strh r0, [r1]
	ldr r0, _0808B85C @ =0x00009D0A
	strh r0, [r1, #2]
	ldr r0, _0808B860 @ =0x00007A81
	strh r0, [r1, #4]
	ldr r2, _0808B864 @ =gUnknown_03004D80
	strb r5, [r2]
	ldr r0, _0808B868 @ =gUnknown_03002280
	strb r5, [r0]
	strb r5, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r6, #0x20
	strb r6, [r0, #3]
	strb r5, [r2, #1]
	strb r5, [r0, #4]
	strb r5, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r6, [r0, #7]
	strb r5, [r2, #2]
	strb r5, [r0, #8]
	strb r5, [r0, #9]
	strb r1, [r0, #0xa]
	strb r6, [r0, #0xb]
	str r4, [sp]
	ldr r1, _0808B86C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r8, r0
	str r0, [r1, #4]
	ldr r0, _0808B870 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808B874 @ =gBgScrollRegs
	strh r4, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #8
	strh r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	strh r4, [r1]
	strh r4, [r1, #2]
	adds r0, r7, #0
	adds r0, #0x80
	ldr r1, _0808B878 @ =0x06004000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0808B87C @ =0x0600F800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0x60
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0xaa
	strb r5, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	mov r0, r8
	str r0, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808B880 @ =0x0600D000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	movs r0, #0x83
	lsls r0, r0, #1
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	strh r6, [r7, #0x26]
	strh r6, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r5, [r0]
	movs r0, #6
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B84C: .4byte gDispCnt
_0808B850: .4byte 0x00001441
_0808B854: .4byte gBgCntRegs
_0808B858: .4byte 0x00001F04
_0808B85C: .4byte 0x00009D0A
_0808B860: .4byte 0x00007A81
_0808B864: .4byte gUnknown_03004D80
_0808B868: .4byte gUnknown_03002280
_0808B86C: .4byte 0x040000D4
_0808B870: .4byte 0x85004000
_0808B874: .4byte gBgScrollRegs
_0808B878: .4byte 0x06004000
_0808B87C: .4byte 0x0600F800
_0808B880: .4byte 0x0600D000
