.include "include/gba.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0800145C @ =0x04000204
	ldr r2, _08001460 @ =0x00004014
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08001464 @ =gUnknown_03001840
	movs r1, #0
	str r1, [r2]
	ldr r0, _08001468 @ =gUnknown_03002790
	str r1, [r0]
	ldr r0, _0800146C @ =0x04000134
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	cmp r0, r1
	beq _0800144A
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r2]
	ldr r1, _08001470 @ =0x040000D4
	ldr r0, _08001474 @ =0x06010000
	str r0, [r1]
	ldr r0, _08001478 @ =gUnknown_0203B000
	str r0, [r1, #4]
	ldr r0, _0800147C @ =0x80002800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0800144A:
	ldr r0, _08001480 @ =gInput
	ldrh r0, [r0]
	cmp r0, #0xf
	bne _08001484
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	b _0800148A
	.align 2, 0
_0800145C: .4byte 0x04000204
_08001460: .4byte 0x00004014
_08001464: .4byte gUnknown_03001840
_08001468: .4byte gUnknown_03002790
_0800146C: .4byte 0x04000134
_08001470: .4byte 0x040000D4
_08001474: .4byte 0x06010000
_08001478: .4byte gUnknown_0203B000
_0800147C: .4byte 0x80002800
_08001480: .4byte gInput
_08001484:
	ldr r0, [r2]
	ldr r1, _08001700 @ =0xFFFFEFFF
	ands r0, r1
_0800148A:
	str r0, [r2]
	movs r2, #0
	str r2, [sp]
	ldr r0, _08001704 @ =0x040000D4
	mov r3, sp
	str r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08001708 @ =0x85006000
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	str r3, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r3, _0800170C @ =0x85000100
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r3, _08001710 @ =gUnknown_030026F4
	movs r1, #0xff
	strb r1, [r3]
	ldr r1, _08001714 @ =gUnknown_03002AE4
	strb r2, [r1]
	ldr r1, _08001718 @ =gUnknown_0300287C
	strb r2, [r1]
	ldr r1, _0800171C @ =gUnknown_03005390
	strb r2, [r1]
	ldr r1, _08001720 @ =gUnknown_03004D5C
	strb r2, [r1]
	ldr r1, _08001724 @ =gUnknown_03002A84
	strb r2, [r1]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _08001728 @ =gUnknown_03002280
	str r1, [r0, #4]
	ldr r3, _0800172C @ =0x85000004
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08001730 @ =gUnknown_03004D80
	str r2, [r1]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001734 @ =gUnknown_03002830
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08001738 @ =gUnknown_030017F4
	movs r4, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	ldr r3, _0800173C @ =gUnknown_03002840
	movs r1, #0x80
	strh r1, [r3]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _08001740 @ =gUnknown_030027A0
	str r1, [r0, #4]
	ldr r1, _08001744 @ =0x85000020
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08001748 @ =gUnknown_030018F0
	strb r4, [r1]
	ldr r1, _0800174C @ =gUnknown_03002AE0
	strb r4, [r1]
	add r3, sp, #4
	movs r1, #0x80
	lsls r1, r1, #2
	adds r5, r1, #0
	strh r5, [r3]
	str r3, [r0]
	ldr r1, _08001750 @ =gOamBuffer
	str r1, [r0, #4]
	ldr r4, _08001754 @ =0x81000200
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	strh r5, [r3]
	str r3, [r0]
	ldr r1, _08001758 @ =gUnknown_030022D0
	str r1, [r0, #4]
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _0800175C @ =gUnknown_03001850
	str r1, [r0, #4]
	ldr r3, _08001760 @ =0x85000008
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001764 @ =gUnknown_03004D60
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _08001768 @ =gUnknown_03002060
	str r1, [r0, #4]
	ldr r3, _0800176C @ =0x85000080
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001770 @ =gUnknown_03002880
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _08001774 @ =gUnknown_03001920
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strh r1, [r0, #0x16]
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldr r0, _08001778 @ =gUnknown_03001944
	strh r2, [r0]
	ldr r0, _0800177C @ =gUnknown_030017F0
	strh r1, [r0]
	ldr r0, _08001780 @ =gUnknown_03005394
	strh r1, [r0]
	ldr r0, _08001784 @ =gUnknown_03002A8C
	strh r2, [r0]
	ldr r0, _08001788 @ =gUnknown_03004D58
	strh r2, [r0]
	ldr r0, _0800178C @ =gUnknown_0300194C
	strh r2, [r0]
	ldr r0, _08001790 @ =gUnknown_03002820
	strh r2, [r0]
	ldr r0, _08001794 @ =gUnknown_03005398
	strh r1, [r0]
	ldr r0, _08001798 @ =gUnknown_03002270
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r0, _0800179C @ =gUnknown_030018E8
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, _080017A0 @ =gUnknown_030026D0
	strh r2, [r0]
	ldr r0, _080017A4 @ =gUnknown_030053B8
	str r2, [r0]
	ldr r3, _080017A8 @ =gUnknown_030053C0
	mov sb, r3
	ldr r0, _080017AC @ =gUnknown_03001880
	mov sl, r0
	ldr r1, _080017B0 @ =gUnknown_030053B0
	mov ip, r1
	ldr r3, _080017B4 @ =gUnknown_03002264
	mov r8, r3
	ldr r7, _080017B8 @ =gUnknown_03001B60
	ldr r6, _080017BC @ =gUnknown_03002700
	movs r5, #0x14
	ldr r4, _080017C0 @ =gUnknown_03002850
	movs r3, #8
_080015FC:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r6
	strb r5, [r1]
	adds r1, r0, r4
	strb r3, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _080015FC
	movs r0, #0
	mov r1, sb
	strb r0, [r1, #8]
	mov r2, sl
	strh r0, [r2]
	mov r3, ip
	str r0, [r3]
	mov r1, r8
	str r0, [r1]
	movs r2, #0
	ldr r4, _080017C4 @ =gIntrTable
	ldr r3, _080017C8 @ =gIntrTableTemplate
_0800162C:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r2, r0, r4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xe
	ble _0800162C
	movs r2, #0
	str r2, [sp]
	ldr r0, _08001704 @ =0x040000D4
	mov r3, sp
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _080017CC @ =0x85000140
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080017D0 @ =gUnknown_03001884
	str r7, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r1, r7, r3
	ldr r3, _080017D4 @ =gUnknown_030022AC
	str r1, [r3]
	ldr r1, _080017D8 @ =gUnknown_03002878
	str r2, [r1]
	ldr r3, _080017DC @ =gUnknown_03002A80
	strb r2, [r3]
	ldr r1, _080017E0 @ =gUnknown_0300188C
	strb r2, [r1]
	ldr r3, _080017E4 @ =gUnknown_030018E0
	strb r2, [r3]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r3, _080017E8 @ =gUnknown_030026E0
	str r3, [r0, #4]
	ldr r1, _0800172C @ =0x85000004
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r3, _080017EC @ =gUnknown_03002AF0
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	ldr r3, _080017F0 @ =gUnknown_03004D50
	strb r2, [r3]
	ldr r3, _080017F4 @ =gUnknown_03001948
	strb r2, [r3]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r3, _080017F8 @ =gUnknown_03001870
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	str r2, [sp]
	mov r2, sp
	str r2, [r0]
	ldr r3, _080017FC @ =gUnknown_030053A0
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl sub_80952A8
	ldr r0, _08001800 @ =0x0093F500
	bl sub_8095844
	ldr r1, _08001804 @ =gUnknown_030053B4
	movs r0, #1
	strb r0, [r1]
	bl sub_8002504
	bl sub_8007B2C
	ldr r1, _08001808 @ =gUnknown_03001888
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0800180C @ =gUnknown_03001940
	ldr r0, _08001810 @ =0x06013A00
	str r0, [r1]
	bl sub_8007CC8
	bl sub_8096C9C
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080016F0
	b _08001818
_080016F0:
	ldr r0, _08001814 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r1, r2
	str r1, [r0]
	b _08001820
	.align 2, 0
_08001700: .4byte 0xFFFFEFFF
_08001704: .4byte 0x040000D4
_08001708: .4byte 0x85006000
_0800170C: .4byte 0x85000100
_08001710: .4byte gUnknown_030026F4
_08001714: .4byte gUnknown_03002AE4
_08001718: .4byte gUnknown_0300287C
_0800171C: .4byte gUnknown_03005390
_08001720: .4byte gUnknown_03004D5C
_08001724: .4byte gUnknown_03002A84
_08001728: .4byte gUnknown_03002280
_0800172C: .4byte 0x85000004
_08001730: .4byte gUnknown_03004D80
_08001734: .4byte gUnknown_03002830
_08001738: .4byte gUnknown_030017F4
_0800173C: .4byte gUnknown_03002840
_08001740: .4byte gUnknown_030027A0
_08001744: .4byte 0x85000020
_08001748: .4byte gUnknown_030018F0
_0800174C: .4byte gUnknown_03002AE0
_08001750: .4byte gOamBuffer
_08001754: .4byte 0x81000200
_08001758: .4byte gUnknown_030022D0
_0800175C: .4byte gUnknown_03001850
_08001760: .4byte 0x85000008
_08001764: .4byte gUnknown_03004D60
_08001768: .4byte gUnknown_03002060
_0800176C: .4byte 0x85000080
_08001770: .4byte gUnknown_03002880
_08001774: .4byte gUnknown_03001920
_08001778: .4byte gUnknown_03001944
_0800177C: .4byte gUnknown_030017F0
_08001780: .4byte gUnknown_03005394
_08001784: .4byte gUnknown_03002A8C
_08001788: .4byte gUnknown_03004D58
_0800178C: .4byte gUnknown_0300194C
_08001790: .4byte gUnknown_03002820
_08001794: .4byte gUnknown_03005398
_08001798: .4byte gUnknown_03002270
_0800179C: .4byte gUnknown_030018E8
_080017A0: .4byte gUnknown_030026D0
_080017A4: .4byte gUnknown_030053B8
_080017A8: .4byte gUnknown_030053C0
_080017AC: .4byte gUnknown_03001880
_080017B0: .4byte gUnknown_030053B0
_080017B4: .4byte gUnknown_03002264
_080017B8: .4byte gUnknown_03001B60
_080017BC: .4byte gUnknown_03002700
_080017C0: .4byte gUnknown_03002850
_080017C4: .4byte gIntrTable
_080017C8: .4byte gIntrTableTemplate
_080017CC: .4byte 0x85000140
_080017D0: .4byte gUnknown_03001884
_080017D4: .4byte gUnknown_030022AC
_080017D8: .4byte gUnknown_03002878
_080017DC: .4byte gUnknown_03002A80
_080017E0: .4byte gUnknown_0300188C
_080017E4: .4byte gUnknown_030018E0
_080017E8: .4byte gUnknown_030026E0
_080017EC: .4byte gUnknown_03002AF0
_080017F0: .4byte gUnknown_03004D50
_080017F4: .4byte gUnknown_03001948
_080017F8: .4byte gUnknown_03001870
_080017FC: .4byte gUnknown_030053A0
_08001800: .4byte 0x0093F500
_08001804: .4byte gUnknown_030053B4
_08001808: .4byte gUnknown_03001888
_0800180C: .4byte gUnknown_03001940
_08001810: .4byte 0x06013A00
_08001814: .4byte gUnknown_03001840
_08001818:
	ldr r1, _08001884 @ =gUnknown_030007C4
	movs r0, #1
	bl sub_8096884
_08001820:
	ldr r1, _08001888 @ =0x040000D4
	ldr r0, _0800188C @ =IntrMain
	str r0, [r1]
	ldr r2, _08001890 @ =gUnknown_030007F0
	str r2, [r1, #4]
	ldr r0, _08001894 @ =0x84000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08001898 @ =INTR_VECTOR
	str r2, [r0]
	ldr r0, _0800189C @ =0x04000208
	movs r2, #1
	strh r2, [r0]
	subs r0, #8
	strh r2, [r0]
	ldr r2, _080018A0 @ =0x04000004
	movs r0, #0x18
	strh r0, [r2]
	movs r2, #0
	str r2, [sp]
	mov r3, sp
	str r3, [r1]
	ldr r0, _080018A4 @ =gUnknown_03002860
	str r0, [r1, #4]
	ldr r0, _080018A8 @ =0x85000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp]
	str r3, [r1]
	ldr r0, _080018AC @ =gUnknown_03001890
	str r0, [r1, #4]
	ldr r0, _080018B0 @ =0x85000014
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080018B4 @ =gUnknown_03001950
	str r2, [r0]
	ldr r0, _080018B8 @ =gUnknown_03001954
	strb r2, [r0]
	movs r0, #0
	bl sub_800032C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001884: .4byte gUnknown_030007C4
_08001888: .4byte 0x040000D4
_0800188C: .4byte IntrMain
_08001890: .4byte gUnknown_030007F0
_08001894: .4byte 0x84000080
_08001898: .4byte INTR_VECTOR
_0800189C: .4byte 0x04000208
_080018A0: .4byte 0x04000004
_080018A4: .4byte gUnknown_03002860
_080018A8: .4byte 0x85000005
_080018AC: .4byte gUnknown_03001890
_080018B0: .4byte 0x85000014
_080018B4: .4byte gUnknown_03001950
_080018B8: .4byte gUnknown_03001954

	.syntax divided
