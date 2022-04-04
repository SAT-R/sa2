.include "asm/macros.inc"

.syntax unified
.arm

	thumb_func_start sub_80953F8
sub_80953F8: @ 0x080953F8
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08095424 @ =gMPlayTable
	ldr r1, _08095428 @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _0809541E
	adds r0, r2, #0
	bl sub_8095B44
_0809541E:
	pop {r0}
	bx r0
	.align 2, 0
_08095424: .4byte gMPlayTable
_08095428: .4byte gSongTable

	thumb_func_start sub_809542C
sub_809542C: @ 0x0809542C
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08095458 @ =gMPlayTable
	ldr r1, _0809545C @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _08095452
	adds r0, r2, #0
	bl MPlayContinue
_08095452:
	pop {r0}
	bx r0
	.align 2, 0
_08095458: .4byte gMPlayTable
_0809545C: .4byte gSongTable

	thumb_func_start sub_8095460
sub_8095460: @ 0x08095460
	push {r4, r5, lr}
	ldr r0, _08095484 @ =gNumMusicPlayers
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0809547E
	ldr r5, _08095488 @ =gMPlayTable
	adds r4, r0, #0
_08095470:
	ldr r0, [r5]
	bl sub_8095B44
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _08095470
_0809547E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095484: .4byte gNumMusicPlayers
_08095488: .4byte gMPlayTable

	thumb_func_start sub_809548C
sub_809548C: @ 0x0809548C
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8095498
sub_8095498: @ 0x08095498
	push {r4, r5, lr}
	ldr r0, _080954BC @ =gNumMusicPlayers
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080954B6
	ldr r5, _080954C0 @ =gMPlayTable
	adds r4, r0, #0
_080954A8:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080954A8
_080954B6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080954BC: .4byte gNumMusicPlayers
_080954C0: .4byte gMPlayTable

	thumb_func_start sub_80954C4
sub_80954C4: @ 0x080954C4
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8095288
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80954D4
sub_80954D4: @ 0x080954D4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080954EC @ =0x68736D53
	cmp r3, r0
	bne _080954EA
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _080954F0 @ =0x00000101
	strh r0, [r2, #0x28]
_080954EA:
	bx lr
	.align 2, 0
_080954EC: .4byte 0x68736D53
_080954F0: .4byte 0x00000101

	thumb_func_start sub_80954F4
sub_80954F4: @ 0x080954F4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _08095514 @ =0x68736D53
	cmp r3, r0
	bne _08095512
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _08095518 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_08095512:
	bx lr
	.align 2, 0
_08095514: .4byte 0x68736D53
_08095518: .4byte 0x7FFFFFFF

	thumb_func_start sub_809551C
sub_809551C: @ 0x0809551C
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _0809555E
	movs r7, #0x80
_08095528:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08095556
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08095556
	adds r0, r4, #0
	bl sub_8095694
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_08095556:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08095528
_0809555E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MPlayExtender
MPlayExtender: @ 0x08095564
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0809562C @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _08095630 @ =0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _08095634 @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _08095638 @ =gUnknown_03007FF0
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _0809563C @ =0x68736D53
	cmp r6, r0
	bne _08095624
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _08095640 @ =gUnknown_020023B0
	ldr r0, _08095644 @ =sub_8096520
	str r0, [r1, #0x20]
	ldr r0, _08095648 @ =sub_80951DC
	str r0, [r1, #0x44]
	ldr r0, _0809564C @ =sub_80951F0
	str r0, [r1, #0x4c]
	ldr r0, _08095650 @ =sub_8096678
	str r0, [r1, #0x70]
	ldr r0, _08095654 @ =sub_8095174
	str r0, [r1, #0x74]
	ldr r0, _08095658 @ =sub_80957A0
	str r0, [r1, #0x78]
	ldr r0, _0809565C @ =sub_8094F00
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _08095660 @ =sub_8095B84
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _08095664 @ =sub_8095C4C
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _08095668 @ =sub_8095E60
	str r0, [r4, #0x28]
	ldr r0, _0809566C @ =sub_8095DA8
	str r0, [r4, #0x2c]
	ldr r0, _08095670 @ =sub_8095D00
	str r0, [r4, #0x30]
	ldr r0, _08095674 @ =0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _08095678 @ =0x05000040
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_08095624:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809562C: .4byte 0x04000084
_08095630: .4byte 0x04000080
_08095634: .4byte 0x04000063
_08095638: .4byte gUnknown_03007FF0
_0809563C: .4byte 0x68736D53
_08095640: .4byte gUnknown_020023B0
_08095644: .4byte sub_8096520
_08095648: .4byte sub_80951DC
_0809564C: .4byte sub_80951F0
_08095650: .4byte sub_8096678
_08095654: .4byte sub_8095174
_08095658: .4byte sub_80957A0
_0809565C: .4byte sub_8094F00
_08095660: .4byte sub_8095B84
_08095664: .4byte sub_8095C4C
_08095668: .4byte sub_8095E60
_0809566C: .4byte sub_8095DA8
_08095670: .4byte sub_8095D00
_08095674: .4byte 0x00000000
_08095678: .4byte 0x05000040

	thumb_func_start SoundGetJumpList
SoundGetJumpList: @ 0x0809567C
	svc #0x2a
	bx lr

	thumb_func_start sub_8095680
sub_8095680: @ 0x08095680
	push {lr}
	ldr r1, _08095690 @ =gUnknown_02002438
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08095690: .4byte gUnknown_02002438

	thumb_func_start sub_8095694
sub_8095694: @ 0x08095694
	push {lr}
	ldr r1, _080956A4 @ =gUnknown_0200243C
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080956A4: .4byte gUnknown_0200243C

	thumb_func_start SoundInit
SoundInit: @ 0x080956A8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _08095760 @ =0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _080956C4
	ldr r0, _08095764 @ =0x84400004
	str r0, [r1]
_080956C4:
	ldr r1, _08095768 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080956D2
	ldr r0, _08095764 @ =0x84400004
	str r0, [r1]
_080956D2:
	ldr r0, _0809576C @ =0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _08095770 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _08095774 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08095778 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0809577C @ =0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _08095780 @ =0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _08095784 @ =0x040000A4
	str r0, [r1]
	ldr r0, _08095788 @ =gUnknown_03007FF0
	str r5, [r0]
	str r3, [sp]
	ldr r2, _0809578C @ =0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _08095790 @ =sub_8094F74
	str r0, [r5, #0x38]
	ldr r0, _08095794 @ =sub_8096798
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _08095798 @ =gUnknown_020023B0
	adds r0, r4, #0
	bl sub_8094A88
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl sub_80957A0
	ldr r0, _0809579C @ =0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095760: .4byte 0x040000C4
_08095764: .4byte 0x84400004
_08095768: .4byte 0x040000D0
_0809576C: .4byte 0x040000C6
_08095770: .4byte 0x04000084
_08095774: .4byte 0x0000A90E
_08095778: .4byte 0x04000089
_0809577C: .4byte 0x040000BC
_08095780: .4byte 0x040000A0
_08095784: .4byte 0x040000A4
_08095788: .4byte gUnknown_03007FF0
_0809578C: .4byte 0x050003EC
_08095790: .4byte sub_8094F74
_08095794: .4byte sub_8096798
_08095798: .4byte gUnknown_020023B0
_0809579C: .4byte 0x68736D53

	thumb_func_start sub_80957A0
sub_80957A0: @ 0x080957A0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _08095820 @ =gUnknown_03007FF0
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _08095824 @ =gUnknown_08ACDDEC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _08095828 @ =0x00091D1B
	muls r0, r5, r0
	ldr r1, _0809582C @ =0x00001388
	adds r0, r0, r1
	ldr r1, _08095830 @ =0x00002710
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _08095834 @ =0x04000102
	strh r6, [r0]
	ldr r4, _08095838 @ =0x04000100
	ldr r0, _0809583C @ =0x00044940
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	bl sub_80959AC
	ldr r1, _08095840 @ =0x04000006
_08095804:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _08095804
	ldr r1, _08095840 @ =0x04000006
_0809580C:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _0809580C
	ldr r1, _08095834 @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095820: .4byte gUnknown_03007FF0
_08095824: .4byte gUnknown_08ACDDEC
_08095828: .4byte 0x00091D1B
_0809582C: .4byte 0x00001388
_08095830: .4byte 0x00002710
_08095834: .4byte 0x04000102
_08095838: .4byte 0x04000100
_0809583C: .4byte 0x00044940
_08095840: .4byte 0x04000006

	thumb_func_start m4aSoundMode
m4aSoundMode: @ 0x08095844
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _080958D0 @ =gUnknown_03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080958D4 @ =0x68736D53
	cmp r1, r0
	bne _080958CA
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _08095866
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_08095866:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _08095886
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_0809587C:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _0809587C
_08095886:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _08095894
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_08095894:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _080958B2
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _080958D8 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_080958B2:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _080958C6
	bl sub_8095930
	adds r0, r4, #0
	bl sub_80957A0
_080958C6:
	ldr r0, _080958D4 @ =0x68736D53
	str r0, [r5]
_080958CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080958D0: .4byte gUnknown_03007FF0
_080958D4: .4byte 0x68736D53
_080958D8: .4byte 0x04000089

	thumb_func_start sub_80958DC
sub_80958DC: @ 0x080958DC
	push {r4, r5, r6, r7, lr}
	ldr r0, _08095928 @ =gUnknown_03007FF0
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _0809592C @ =0x68736D53
	cmp r1, r0
	bne _08095922
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_080958F6:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _080958F6
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _0809591E
	movs r5, #1
	movs r7, #0
_0809590A:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _0809590A
_0809591E:
	ldr r0, _0809592C @ =0x68736D53
	str r0, [r6]
_08095922:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095928: .4byte gUnknown_03007FF0
_0809592C: .4byte 0x68736D53

	thumb_func_start sub_8095930
sub_8095930: @ 0x08095930
	push {lr}
	sub sp, #4
	ldr r0, _08095990 @ =gUnknown_03007FF0
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _08095994 @ =0x978C92AD
	adds r0, r1, r3
	cmp r0, #1
	bhi _08095988
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _08095998 @ =0x040000C4
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _0809595A
	ldr r0, _0809599C @ =0x84400004
	str r0, [r1]
_0809595A:
	ldr r1, _080959A0 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _08095968
	ldr r0, _0809599C @ =0x84400004
	str r0, [r1]
_08095968:
	ldr r0, _080959A4 @ =0x040000C6
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _080959A8 @ =0x05000318
	mov r0, sp
	bl CpuSet
_08095988:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08095990: .4byte gUnknown_03007FF0
_08095994: .4byte 0x978C92AD
_08095998: .4byte 0x040000C4
_0809599C: .4byte 0x84400004
_080959A0: .4byte 0x040000D0
_080959A4: .4byte 0x040000C6
_080959A8: .4byte 0x05000318

	thumb_func_start sub_80959AC
sub_80959AC: @ 0x080959AC
	push {r4, lr}
	ldr r0, _080959DC @ =gUnknown_03007FF0
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _080959E0 @ =0x68736D53
	cmp r3, r0
	beq _080959D4
	ldr r0, _080959E4 @ =0x040000C6
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_080959D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080959DC: .4byte gUnknown_03007FF0
_080959E0: .4byte 0x68736D53
_080959E4: .4byte 0x040000C6

	thumb_func_start MPlayOpen
MPlayOpen: @ 0x080959E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _08095A4C
	cmp r4, #0x10
	bls _080959FC
	movs r4, #0x10
_080959FC:
	ldr r0, _08095A54 @ =gUnknown_03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _08095A58 @ =0x68736D53
	cmp r1, r0
	bne _08095A4C
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl sub_8095694
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _08095A30
	movs r1, #0
_08095A22:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _08095A22
_08095A30:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _08095A40
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_08095A40:
	str r7, [r5, #0x24]
	ldr r0, _08095A5C @ =sub_8094C98
	str r0, [r5, #0x20]
	ldr r0, _08095A58 @ =0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_08095A4C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095A54: .4byte gUnknown_03007FF0
_08095A58: .4byte 0x68736D53
_08095A5C: .4byte sub_8094C98

	thumb_func_start MPlayStart
MPlayStart: @ 0x08095A60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _08095B40 @ =0x68736D53
	cmp r1, r0
	bne _08095B36
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _08095AA2
	ldr r0, [r5]
	cmp r0, #0
	beq _08095A8C
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08095A98
_08095A8C:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _08095AA2
	cmp r1, #0
	blt _08095AA2
_08095A98:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _08095B36
_08095AA2:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _08095B02
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _08095B22
	mov r8, r6
_08095AD6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8094F00
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _08095B02
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _08095AD6
_08095B02:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _08095B22
	movs r1, #0
	mov r8, r1
_08095B0C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8094F00
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _08095B0C
_08095B22:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _08095B32
	ldrb r0, [r7, #3]
	bl m4aSoundMode
_08095B32:
	ldr r0, _08095B40 @ =0x68736D53
	str r0, [r5, #0x34]
_08095B36:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B40: .4byte 0x68736D53
