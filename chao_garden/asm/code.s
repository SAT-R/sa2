.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_02000248
sub_02000248: @ 0x02000248
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl IdentifyFlash
	ldr r1, _020002A8 @ =gIntrTable+2*4
	movs r0, #2
	bl SetFlashTimerIntr
	movs r6, #0
	movs r0, #0xff
	mov r8, r0
	movs r7, #0
	ldr r4, _020002AC @ =gUnknown_03003B80
	ldr r1, _020002B0 @ =0x00001965
	mov sb, r1
	movs r5, #0
_0200026C:
	adds r0, r7, #0
	adds r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	adds r2, r4, #0
	ldr r3, _020002B4 @ =0x00000858
	bl ReadFlash
	ldrh r0, [r4, #2]
	cmp r0, sb
	bne _020002C8
	adds r0, r4, #2
	ldr r1, _020002B8 @ =0x00000856
	bl sub_0200185c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	cmp r0, r1
	bne _020002C8
	mov r1, r8
	lsls r0, r1, #0x18
	cmp r0, #0
	bge _020002BC
	lsrs r0, r5, #0x18
	mov r8, r0
	ldr r6, [r4, #4]
	b _020002C8
	.align 2, 0
_020002A8: .4byte gIntrTable+2*4
_020002AC: .4byte gUnknown_03003B80
_020002B0: .4byte 0x00001965
_020002B4: .4byte 0x00000858
_020002B8: .4byte 0x00000856
_020002BC:
	ldr r0, [r4, #4]
	cmp r0, r6
	bls _020002C8
	lsrs r1, r5, #0x18
	mov r8, r1
	adds r6, r0, #0
_020002C8:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r7, #1
	cmp r7, #5
	ble _0200026C
	mov r1, r8
	lsls r0, r1, #0x18
	cmp r0, #0
	bge _0200030C
	ldr r1, _02000300 @ =IWRAM_START + 0x80
	movs r0, #6
	strb r0, [r1]
	ldr r0, _02000304 @ =IWRAM_START + 0x84
	movs r4, #0
	str r4, [r0]
	bl sub_0200043c
	ldr r1, _02000308 @ =gUnknown_03003B80
	adds r0, r1, #0
	adds r0, #0x59
	strb r4, [r0]
	movs r0, #0x58
	strb r0, [r1, #0x1f]
	adds r1, #0x20
	movs r0, #0x68
	strb r0, [r1]
	b _0200032C
	.align 2, 0
_02000300: .4byte IWRAM_START + 0x80
_02000304: .4byte IWRAM_START + 0x84
_02000308: .4byte gUnknown_03003B80
_0200030C:
	ldr r1, _02000344 @ =IWRAM_START + 0x80
	mov r0, r8
	strb r0, [r1]
	ldr r0, _02000348 @ =IWRAM_START + 0x84
	str r6, [r0]
	ldrb r0, [r1]
	adds r0, #0xa
	ldr r4, _0200034C @ =gUnknown_03003B80
	ldr r3, _02000350 @ =0x00000858
	movs r1, #0
	adds r2, r4, #0
	bl ReadFlash
	ldr r0, [r4, #0x18]
	bl sub_02001528
_0200032C:
	ldr r1, _0200034C @ =gUnknown_03003B80
	ldr r0, _02000354 @ =gUnknown_02000008
	ldr r2, [r1, #8]
	ldr r3, [r0]
	adds r4, r1, #0
	cmp r2, r3
	blo _0200035C
	ldr r1, _02000358 @ =gUnknown_03005274
	ldr r0, [r4, #0xc]
	str r0, [r1]
	adds r0, r1, #0
	b _02000370
	.align 2, 0
_02000344: .4byte IWRAM_START + 0x80
_02000348: .4byte IWRAM_START + 0x84
_0200034C: .4byte gUnknown_03003B80
_02000350: .4byte 0x00000858
_02000354: .4byte gUnknown_02000008
_02000358: .4byte gUnknown_03005274
_0200035C:
	subs r1, r3, r2
	ldr r0, [r4, #0xc]
	adds r6, r0, r1
	ldr r0, _020003A4 @ =0x0001869F
	cmp r6, r0
	bls _0200036A
	adds r6, r0, #0
_0200036A:
	ldr r0, _020003A8 @ =gUnknown_03005274
	str r6, [r0]
	str r3, [r4, #8]
_02000370:
	ldr r2, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r2
	lsrs r0, r0, #8
	orrs r1, r0
	lsrs r2, r2, #0x18
	orrs r1, r2
	str r1, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x68
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020003A4: .4byte 0x0001869F
_020003A8: .4byte gUnknown_03005274

	thumb_func_start sub_020003ac
sub_020003ac: @ 0x020003ac
	push {r4, r5, lr}
	ldr r4, _02000420 @ =gUnknown_03003B80
	ldr r0, _02000424 @ =0x00001965
	strh r0, [r4, #2]
	ldr r1, _02000428 @ =IWRAM_START + 0x84
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	str r0, [r4, #4]
	ldr r0, _0200042C @ =gUnknown_03005274
	ldr r0, [r0]
	str r0, [r4, #0xc]
	bl sub_0200151c
	str r0, [r4, #0x18]
	adds r0, r4, #2
	ldr r1, _02000430 @ =0x00000856
	bl sub_0200185c
	strh r0, [r4]
	bl m4aMPlayAllStop
	bl m4aSoundMain
	bl VBlankIntrWait
	bl m4aSoundVSyncOff
	movs r5, #0
	ldr r4, _02000434 @ =IWRAM_START + 0x80
_020003E8:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _020003FA
	movs r0, #0
	strb r0, [r4]
_020003FA:
	ldrb r0, [r4]
	adds r0, #0xa
	ldr r1, _02000420 @ =gUnknown_03003B80
	ldr r2, _02000438 @ =0x00000858
	bl ProgramFlashSectorAndVerifyNBytes
	cmp r0, #0
	beq _02000410
	adds r5, #1
	cmp r5, #4
	ble _020003E8
_02000410:
	bl m4aSoundVSyncOn
	bl VBlankIntrWait
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02000420: .4byte gUnknown_03003B80
_02000424: .4byte 0x00001965
_02000428: .4byte IWRAM_START + 0x84
_0200042C: .4byte gUnknown_03005274
_02000430: .4byte 0x00000856
_02000434: .4byte IWRAM_START + 0x80
_02000438: .4byte 0x00000858

	thumb_func_start sub_0200043c
sub_0200043c: @ 0x0200043c
	push {lr}
	ldr r2, _02000474 @ =gUnknown_03003B88
	movs r0, #0
	movs r1, #0x50
	cmp r0, r1
	bhs _02000454
	movs r3, #0
_0200044A:
	strb r3, [r2]
	adds r2, #1
	adds r0, #1
	cmp r0, r1
	blo _0200044A
_02000454:
	ldr r1, _02000478 @ =gUnknown_03003BD8
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x11
_0200045C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0200045C
	bl sub_02008810
	ldr r1, _0200047C @ =gUnknown_03003B80
	str r0, [r1, #0x10]
	movs r0, #0xff
	strb r0, [r1, #0x1c]
	pop {r0}
	bx r0
	.align 2, 0
_02000474: .4byte gUnknown_03003B88
_02000478: .4byte gUnknown_03003BD8
_0200047C: .4byte gUnknown_03003B80

	thumb_func_start sub_02000480
sub_02000480: @ 0x02000480
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r0, _0200052C @ =0x04000208
	mov sb, r0
	movs r5, #0
	strh r5, [r0]
	ldr r6, _02000530 @ =0x04000200
	ldrh r1, [r6]
	ldr r0, _02000534 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r6]
	ldr r1, _02000538 @ =0x04000134
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0200053C @ =0x04000158
	strh r5, [r0]
	subs r0, #8
	ldr r0, [r0]
	ldr r0, _02000540 @ =0x04000154
	movs r1, #0
	mov r8, r1
	str r1, [r0]
	ldr r1, _02000544 @ =0x04000140
	movs r0, #0x47
	strh r0, [r1]
	ldr r0, _02000548 @ =sub_020006b8
	ldr r4, _0200054C @ =IWRAM_START + 0x88
	ldr r2, _02000550 @ =0x04000148
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _02000554 @ =gIntrTable
	adds r4, #1
	str r4, [r0]
	ldr r0, _02000558 @ =gUnknown_030043DC
	strb r5, [r0]
	ldr r0, _0200055C @ =gUnknown_030043EC
	strb r5, [r0]
	ldr r1, _02000560 @ =IWRAM_START + 0x5B1
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _02000564 @ =gUnknown_030043E8
	strb r5, [r0]
	ldr r1, _02000568 @ =gUnknown_030043D8
	ldr r0, _0200056C @ =gUnknown_030043E4
	strb r5, [r0]
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _02000570 @ =IWRAM_START + 0x5B0
	strb r5, [r0]
	ldr r0, _02000574 @ =IWRAM_START + 0x5BC
	mov r2, r8
	str r2, [r0]
	ldr r3, _02000578 @ =IWRAM_START + 0x5A8
	ldr r2, _0200057C @ =0x080000AF
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	ldr r1, _02000580 @ =0x004F5341
	orrs r0, r1
	str r0, [r3]
	ldr r3, _02000584 @ =IWRAM_START + 0x5AC
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	ldr r1, _02000588 @ =0x00425347
	orrs r0, r1
	str r0, [r3]
	ldr r0, _0200058C @ =0x04000202
	movs r1, #0x80
	strh r1, [r0]
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	movs r0, #1
	mov r1, sb
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200052C: .4byte 0x04000208
_02000530: .4byte 0x04000200
_02000534: .4byte 0x0000FF7F
_02000538: .4byte 0x04000134
_0200053C: .4byte 0x04000158
_02000540: .4byte 0x04000154
_02000544: .4byte 0x04000140
_02000548: .4byte sub_020006b8
_0200054C: .4byte IWRAM_START + 0x88
_02000550: .4byte 0x04000148
_02000554: .4byte gIntrTable
_02000558: .4byte gUnknown_030043DC
_0200055C: .4byte gUnknown_030043EC
_02000560: .4byte IWRAM_START + 0x5B1
_02000564: .4byte gUnknown_030043E8
_02000568: .4byte gUnknown_030043D8
_0200056C: .4byte gUnknown_030043E4
_02000570: .4byte IWRAM_START + 0x5B0
_02000574: .4byte IWRAM_START + 0x5BC
_02000578: .4byte IWRAM_START + 0x5A8
_0200057C: .4byte 0x080000AF
_02000580: .4byte 0x004F5341
_02000584: .4byte IWRAM_START + 0x5AC
_02000588: .4byte 0x00425347
_0200058C: .4byte 0x04000202

	thumb_func_start sub_02000590
sub_02000590: @ 0x02000590
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r6, _020005AC @ =0x04000208
	movs r4, #0
	strh r4, [r6]
	ldr r7, _020005B0 @ =IWRAM_START + 0x5B1
	ldrb r0, [r7]
	cmp r0, #9
	bhi _020005B4
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _0200068A
	.align 2, 0
_020005AC: .4byte 0x04000208
_020005B0: .4byte IWRAM_START + 0x5B1
_020005B4:
	ldr r0, _0200060C @ =gUnknown_030043EC
	mov ip, r0
	ldrb r0, [r0]
	adds r3, r0, #0
	cmp r3, #0
	beq _0200062C
	ldrh r2, [r6]
	strh r4, [r6]
	ldr r1, _02000610 @ =0x04000134
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _02000614 @ =0x04000158
	strh r4, [r0]
	subs r0, #8
	ldr r0, [r0]
	ldr r0, _02000618 @ =0x04000154
	movs r3, #0
	str r3, [r0]
	adds r1, #0xc
	movs r0, #0x47
	strh r0, [r1]
	ldr r0, _0200061C @ =gUnknown_030043DC
	strb r4, [r0]
	mov r0, ip
	strb r4, [r0]
	movs r0, #0xa
	strb r0, [r7]
	ldr r0, _02000620 @ =gUnknown_030043E8
	strb r4, [r0]
	ldr r0, _02000624 @ =IWRAM_START + 0x5B0
	strb r4, [r0]
	ldr r0, _02000628 @ =IWRAM_START + 0x5BC
	str r3, [r0]
	adds r1, #0xc2
	movs r0, #0x80
	strh r0, [r1]
	strh r2, [r6]
	b _0200068A
	.align 2, 0
_0200060C: .4byte gUnknown_030043EC
_02000610: .4byte 0x04000134
_02000614: .4byte 0x04000158
_02000618: .4byte 0x04000154
_0200061C: .4byte gUnknown_030043DC
_02000620: .4byte gUnknown_030043E8
_02000624: .4byte IWRAM_START + 0x5B0
_02000628: .4byte IWRAM_START + 0x5BC
_0200062C:
	ldr r5, _0200063C @ =IWRAM_START + 0x5B0
	ldrb r0, [r5]
	cmp r0, #0xa
	bhi _02000640
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0200068A
	.align 2, 0
_0200063C: .4byte IWRAM_START + 0x5B0
_02000640:
	ldrh r2, [r6]
	mov r8, r2
	strh r3, [r6]
	ldr r1, _0200069C @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020006A0 @ =0x04000158
	strh r3, [r0]
	subs r0, #8
	ldr r0, [r0]
	ldr r0, _020006A4 @ =0x04000154
	str r3, [r0]
	adds r1, #0xc
	movs r0, #0x47
	strh r0, [r1]
	ldr r0, _020006A8 @ =gUnknown_030043DC
	strb r4, [r0]
	mov r0, ip
	strb r4, [r0]
	movs r0, #0xa
	strb r0, [r7]
	ldr r0, _020006AC @ =gUnknown_030043E8
	strb r4, [r0]
	strb r4, [r5]
	ldr r0, _020006B0 @ =IWRAM_START + 0x5BC
	str r3, [r0]
	adds r1, #0xc2
	movs r0, #0x80
	strh r0, [r1]
	mov r1, r8
	strh r1, [r6]
_0200068A:
	ldr r1, _020006B4 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200069C: .4byte 0x04000134
_020006A0: .4byte 0x04000158
_020006A4: .4byte 0x04000154
_020006A8: .4byte gUnknown_030043DC
_020006AC: .4byte gUnknown_030043E8
_020006B0: .4byte IWRAM_START + 0x5BC
_020006B4: .4byte 0x04000208

	thumb_func_start sub_020006b8
sub_020006b8: @ 0x020006b8
	push {r4, r5, lr}
	ldr r0, _020006D4 @ =0x04000140
	ldrh r0, [r0]
	adds r5, r0, #0
	ldr r1, _020006D8 @ =gUnknown_030043DC
	ldrb r0, [r1]
	adds r3, r1, #0
	cmp r0, #9
	bhi _02000708
	lsls r0, r0, #2
	ldr r1, _020006DC @ =_020006E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_020006D4: .4byte 0x04000140
_020006D8: .4byte gUnknown_030043DC
_020006DC: .4byte _020006E0
_020006E0: @ jump table
	.4byte _02000708 @ case 0
	.4byte _02000724 @ case 1
	.4byte _0200073A @ case 2
	.4byte _02000784 @ case 3
	.4byte _0200078A @ case 4
	.4byte _020007CC @ case 5
	.4byte _0200087C @ case 6
	.4byte _020008C8 @ case 7
	.4byte _020008E8 @ case 8
	.4byte _0200092C @ case 9
_02000708:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _02000712
	b _02000962
_02000712:
	bl sub_02000bb0
	ldr r1, _02000720 @ =gUnknown_030043DC
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _02000962
	.align 2, 0
_02000720: .4byte gUnknown_030043DC
_02000724:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	bne _02000784
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _02000766
	bl sub_02000bb0
	b _02000962
_0200073A:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200076A
	ldr r0, _02000758 @ =0x04000150
	ldr r1, _0200075C @ =IWRAM_START + 0x5AC
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bne _02000764
	ldr r1, _02000760 @ =0x04000158
	movs r0, #0x30
	strh r0, [r1]
	b _02000784
	.align 2, 0
_02000758: .4byte 0x04000150
_0200075C: .4byte IWRAM_START + 0x5AC
_02000760: .4byte 0x04000158
_02000764:
	movs r0, #0
_02000766:
	strb r0, [r3]
	b _02000962
_0200076A:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _02000766
	bl sub_02000bb0
	ldr r1, _02000780 @ =gUnknown_030043DC
	movs r0, #1
	strb r0, [r1]
	b _02000962
	.align 2, 0
_02000780: .4byte gUnknown_030043DC
_02000784:
	ldrb r0, [r3]
	adds r0, #1
	b _02000766
_0200078A:
	movs r0, #4
	ands r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _02000798
	b _02000934
_02000798:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _020007A2
	b _02000962
_020007A2:
	ldr r0, _020007B8 @ =0x04000150
	ldr r4, [r0]
	ldr r0, _020007BC @ =0x6F616843
	cmp r4, r0
	bne _020007C8
	ldr r0, _020007C0 @ =IWRAM_START + 0x5B1
	strb r1, [r0]
	ldr r1, _020007C4 @ =gUnknown_030043EC
	movs r0, #1
	strb r0, [r1]
	b _0200095A
	.align 2, 0
_020007B8: .4byte 0x04000150
_020007BC: .4byte 0x6F616843
_020007C0: .4byte IWRAM_START + 0x5B1
_020007C4: .4byte gUnknown_030043EC
_020007C8:
	movs r4, #0
	b _0200095A
_020007CC:
	movs r0, #4
	ands r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _020007DA
	b _02000934
_020007DA:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _020007E4
	b _02000962
_020007E4:
	ldr r0, _020007F8 @ =0x04000150
	ldr r4, [r0]
	ldr r0, _020007FC @ =0x6F616843
	cmp r4, r0
	bne _02000808
	ldr r0, _02000800 @ =IWRAM_START + 0x5B1
	strb r1, [r0]
	ldr r0, _02000804 @ =gUnknown_030043E8
	strb r1, [r0]
	b _02000818
	.align 2, 0
_020007F8: .4byte 0x04000150
_020007FC: .4byte 0x6F616843
_02000800: .4byte IWRAM_START + 0x5B1
_02000804: .4byte gUnknown_030043E8
_02000808:
	ldr r0, _02000830 @ =0x4F414843
	cmp r4, r0
	bne _02000844
	ldr r0, _02000834 @ =IWRAM_START + 0x5B1
	strb r1, [r0]
	ldr r1, _02000838 @ =gUnknown_030043E8
	movs r0, #1
	strb r0, [r1]
_02000818:
	ldr r0, _0200083C @ =gUnknown_030043F0
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsls r4, r0, #8
	lsls r1, r1, #0x18
	ldr r0, _02000840 @ =0x00004B43
	orrs r1, r0
	orrs r4, r1
	b _0200095A
	.align 2, 0
_02000830: .4byte 0x4F414843
_02000834: .4byte IWRAM_START + 0x5B1
_02000838: .4byte gUnknown_030043E8
_0200083C: .4byte gUnknown_030043F0
_02000840: .4byte 0x00004B43
_02000844:
	movs r0, #0xff
	ands r0, r4
	cmp r0, #0x2a
	bne _02000860
	adds r0, r4, #0
	bl sub_02000b0c
	ldr r1, _0200085C @ =gUnknown_030043DC
	movs r0, #6
	strb r0, [r1]
	b _0200095A
	.align 2, 0
_0200085C: .4byte gUnknown_030043DC
_02000860:
	cmp r0, #0x22
	bne _02000878
	adds r0, r4, #0
	bl sub_02000b64
	ldr r1, _02000874 @ =gUnknown_030043DC
	movs r0, #8
	strb r0, [r1]
	b _0200095A
	.align 2, 0
_02000874: .4byte gUnknown_030043DC
_02000878:
	movs r4, #0
	b _0200095A
_0200087C:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	bne _02000934
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _02000962
	ldr r0, _020008A8 @ =0x04000150
	ldr r4, [r0]
	ldr r0, _020008AC @ =0x0000FFFF
	ands r0, r4
	cmp r0, #0
	bne _020008B4
	adds r0, r4, #0
	bl sub_02000988
	adds r4, r0, #0
	ldr r1, _020008B0 @ =gUnknown_030043DC
	movs r0, #7
	strb r0, [r1]
	b _0200095A
	.align 2, 0
_020008A8: .4byte 0x04000150
_020008AC: .4byte 0x0000FFFF
_020008B0: .4byte gUnknown_030043DC
_020008B4:
	movs r0, #0xff
	ands r0, r4
	cmp r0, #0x2a
	bne _020008C4
	adds r0, r4, #0
	bl sub_02000b0c
	b _0200095A
_020008C4:
	movs r4, #0
	b _0200095A
_020008C8:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	bne _02000934
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _02000962
	ldr r0, _020008E4 @ =0x04000150
	ldr r0, [r0]
	bl sub_02000988
	b _02000958
	.align 2, 0
_020008E4: .4byte 0x04000150
_020008E8:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	bne _02000934
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _02000962
	ldr r0, _0200090C @ =0x04000150
	ldr r4, [r0]
	movs r0, #0xff
	ands r0, r4
	cmp r0, #0x22
	bne _02000910
	adds r0, r4, #0
	bl sub_02000b64
	b _0200095A
	.align 2, 0
_0200090C: .4byte 0x04000150
_02000910:
	cmp r0, #0x26
	bne _02000928
	adds r0, r4, #0
	bl sub_02000a40
	adds r4, r0, #0
	ldr r1, _02000924 @ =gUnknown_030043DC
	movs r0, #9
	strb r0, [r1]
	b _0200095A
	.align 2, 0
_02000924: .4byte gUnknown_030043DC
_02000928:
	movs r4, #0
	b _0200095A
_0200092C:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _02000948
_02000934:
	ldr r0, _02000940 @ =0x04000154
	ldr r1, _02000944 @ =IWRAM_START + 0x5BC
	ldr r1, [r1]
	str r1, [r0]
	b _02000962
	.align 2, 0
_02000940: .4byte 0x04000154
_02000944: .4byte IWRAM_START + 0x5BC
_02000948:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _02000962
	ldr r0, _02000974 @ =0x04000150
	ldr r0, [r0]
	bl sub_02000a40
_02000958:
	adds r4, r0, #0
_0200095A:
	ldr r0, _02000978 @ =0x04000154
	str r4, [r0]
	ldr r0, _0200097C @ =IWRAM_START + 0x5BC
	str r4, [r0]
_02000962:
	ldr r0, _02000980 @ =IWRAM_START + 0x5B0
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02000984 @ =0x04000140
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02000974: .4byte 0x04000150
_02000978: .4byte 0x04000154
_0200097C: .4byte IWRAM_START + 0x5BC
_02000980: .4byte IWRAM_START + 0x5B0
_02000984: .4byte 0x04000140

	thumb_func_start sub_02000988
sub_02000988: @ 0x02000988
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _020009CC @ =IWRAM_START + 0x5B8
	ldrh r2, [r0]
	ldr r1, _020009D0 @ =IWRAM_START + 0x5BA
	ldrh r0, [r1]
	adds r0, #1
	adds r5, r1, #0
	cmp r2, r0
	bne _020009EC
	ldr r0, _020009D4 @ =0x6F616843
	cmp r3, r0
	bne _020009EC
	ldr r1, _020009D8 @ =IWRAM_START + 0x5B1
	movs r0, #0
	strb r0, [r1]
	ldr r0, _020009DC @ =gUnknown_030043F0
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsls r3, r0, #8
	lsls r1, r1, #0x18
	ldr r0, _020009E0 @ =0x00004B43
	orrs r1, r0
	orrs r3, r1
	ldr r1, _020009E4 @ =gUnknown_030043DC
	movs r0, #5
	strb r0, [r1]
	ldr r1, _020009E8 @ =gUnknown_030043D8
	movs r0, #2
	strb r0, [r1]
	b _02000A36
	.align 2, 0
_020009CC: .4byte IWRAM_START + 0x5B8
_020009D0: .4byte IWRAM_START + 0x5BA
_020009D4: .4byte 0x6F616843
_020009D8: .4byte IWRAM_START + 0x5B1
_020009DC: .4byte gUnknown_030043F0
_020009E0: .4byte 0x00004B43
_020009E4: .4byte gUnknown_030043DC
_020009E8: .4byte gUnknown_030043D8
_020009EC:
	movs r1, #0xff
	adds r0, r3, #0
	ands r0, r1
	lsls r2, r0, #8
	lsrs r0, r3, #8
	ands r0, r1
	orrs r2, r0
	adds r4, r2, #0
	adds r1, r5, #0
	ldrh r0, [r1]
	subs r0, r2, r0
	cmp r0, #1
	bne _02000A10
	strh r2, [r1]
	ldr r1, _02000A2C @ =IWRAM_START + 0x5B4
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
_02000A10:
	ldrh r5, [r5]
	cmp r4, r5
	bne _02000A34
	ldr r1, _02000A30 @ =IWRAM_START + 0x5B1
	movs r0, #0
	strb r0, [r1]
	ldr r2, _02000A2C @ =IWRAM_START + 0x5B4
	ldr r1, [r2]
	lsrs r0, r3, #0x10
	strb r0, [r1]
	ldr r1, [r2]
	lsrs r0, r3, #0x18
	strb r0, [r1, #1]
	b _02000A36
	.align 2, 0
_02000A2C: .4byte IWRAM_START + 0x5B4
_02000A30: .4byte IWRAM_START + 0x5B1
_02000A34:
	movs r3, #0
_02000A36:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02000a40
sub_02000a40: @ 0x02000a40
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _02000A84 @ =IWRAM_START + 0x5B8
	ldrh r2, [r0]
	ldr r1, _02000A88 @ =IWRAM_START + 0x5BA
	ldrh r0, [r1]
	adds r0, #1
	adds r4, r1, #0
	cmp r2, r0
	bne _02000AA4
	ldr r0, _02000A8C @ =IWRAM_START + 0x5BC
	ldr r0, [r0]
	cmp r0, r3
	bne _02000AC0
	ldr r1, _02000A90 @ =IWRAM_START + 0x5B1
	movs r0, #0
	strb r0, [r1]
	ldr r0, _02000A94 @ =gUnknown_030043F0
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsls r3, r0, #8
	lsls r1, r1, #0x18
	ldr r0, _02000A98 @ =0x00004B43
	orrs r1, r0
	orrs r3, r1
	ldr r1, _02000A9C @ =gUnknown_030043DC
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02000AA0 @ =gUnknown_030043E4
	movs r0, #2
	strb r0, [r1]
	b _02000ADC
	.align 2, 0
_02000A84: .4byte IWRAM_START + 0x5B8
_02000A88: .4byte IWRAM_START + 0x5BA
_02000A8C: .4byte IWRAM_START + 0x5BC
_02000A90: .4byte IWRAM_START + 0x5B1
_02000A94: .4byte gUnknown_030043F0
_02000A98: .4byte 0x00004B43
_02000A9C: .4byte gUnknown_030043DC
_02000AA0: .4byte gUnknown_030043E4
_02000AA4:
	ldr r0, _02000AE4 @ =IWRAM_START + 0x5BC
	ldr r0, [r0]
	cmp r0, r3
	bne _02000AC0
	ldr r1, _02000AE8 @ =IWRAM_START + 0x5B1
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r1, _02000AEC @ =IWRAM_START + 0x5B4
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
_02000AC0:
	ldr r0, _02000AEC @ =IWRAM_START + 0x5B4
	ldr r1, [r0]
	ldrb r0, [r1]
	lsls r3, r0, #0x10
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x18
	orrs r3, r0
	ldrh r1, [r4]
	lsrs r0, r1, #8
	orrs r3, r0
	movs r0, #0xff
	ands r0, r1
	lsls r0, r0, #8
	orrs r3, r0
_02000ADC:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02000AE4: .4byte IWRAM_START + 0x5BC
_02000AE8: .4byte IWRAM_START + 0x5B1
_02000AEC: .4byte IWRAM_START + 0x5B4

	thumb_func_start sub_02000af0
sub_02000af0: @ 0x02000af0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _02000B04 @ =0x04000208
	movs r1, #0
	strh r1, [r2]
	ldr r1, _02000B08 @ =gUnknown_030043DC
	strb r0, [r1]
	movs r0, #1
	strh r0, [r2]
	bx lr
	.align 2, 0
_02000B04: .4byte 0x04000208
_02000B08: .4byte gUnknown_030043DC

	thumb_func_start sub_02000b0c
sub_02000b0c: @ 0x02000b0c
	push {r4, lr}
	ldr r2, _02000B48 @ =IWRAM_START + 0x5B1
	movs r1, #0
	strb r1, [r2]
	ldr r2, _02000B4C @ =IWRAM_START + 0x5B4
	ldr r1, _02000B50 @ =gUnknown_03003350
	str r1, [r2]
	ldr r3, _02000B54 @ =IWRAM_START + 0x5B8
	lsrs r1, r0, #8
	movs r4, #0xff
	lsls r4, r4, #8
	adds r2, r4, #0
	ands r1, r2
	lsrs r0, r0, #0x18
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _02000B58 @ =IWRAM_START + 0x5BA
	movs r0, #0
	strh r0, [r1]
	ldr r1, _02000B5C @ =gUnknown_030043E0
	ldrh r0, [r3]
	lsls r0, r0, #1
	str r0, [r1]
	ldr r1, _02000B60 @ =gUnknown_030043D8
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000B48: .4byte IWRAM_START + 0x5B1
_02000B4C: .4byte IWRAM_START + 0x5B4
_02000B50: .4byte gUnknown_03003350
_02000B54: .4byte IWRAM_START + 0x5B8
_02000B58: .4byte IWRAM_START + 0x5BA
_02000B5C: .4byte gUnknown_030043E0
_02000B60: .4byte gUnknown_030043D8

	thumb_func_start sub_02000b64
sub_02000b64: @ 0x02000b64
	push {r4, lr}
	ldr r2, _02000B98 @ =IWRAM_START + 0x5B1
	movs r1, #0
	strb r1, [r2]
	ldr r2, _02000B9C @ =IWRAM_START + 0x5B4
	ldr r1, _02000BA0 @ =gUnknown_03003BD8
	str r1, [r2]
	ldr r3, _02000BA4 @ =IWRAM_START + 0x5B8
	lsrs r1, r0, #8
	movs r4, #0xff
	lsls r4, r4, #8
	adds r2, r4, #0
	ands r1, r2
	lsrs r0, r0, #0x18
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _02000BA8 @ =IWRAM_START + 0x5BA
	movs r0, #0
	strh r0, [r1]
	ldr r1, _02000BAC @ =gUnknown_030043E4
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000B98: .4byte IWRAM_START + 0x5B1
_02000B9C: .4byte IWRAM_START + 0x5B4
_02000BA0: .4byte gUnknown_03003BD8
_02000BA4: .4byte IWRAM_START + 0x5B8
_02000BA8: .4byte IWRAM_START + 0x5BA
_02000BAC: .4byte gUnknown_030043E4

	thumb_func_start sub_02000bb0
sub_02000bb0: @ 0x02000bb0
	ldr r0, _02000BC4 @ =0x04000150
	ldr r0, [r0]
	ldr r1, _02000BC8 @ =0x04000154
	ldr r0, _02000BCC @ =IWRAM_START + 0x5A8
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	movs r0, #0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_02000BC4: .4byte 0x04000150
_02000BC8: .4byte 0x04000154
_02000BCC: .4byte IWRAM_START + 0x5A8

	thumb_func_start sub_02000bd0
sub_02000bd0: @ 0x02000bd0
	push {r4, r5, r6, lr}
	ldr r1, _02000C40 @ =gUnknown_030043F0
	ldrh r5, [r1]
	ldrh r6, [r1, #2]
	ldr r0, _02000C44 @ =0x04000130
	ldrh r2, [r0]
	movs r3, #0xfc
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1, #2]
	mvns r2, r0
	strh r2, [r1]
	ldr r0, _02000C48 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _02000C20
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0xf
	bne _02000C20
	bl m4aMPlayAllStop
	bl m4aSoundMain
	bl VBlankIntrWait
	bl m4aSoundVSyncOff
	ldr r0, _02000C4C @ =0x04000208
	strh r4, [r0]
	subs r0, #8
	strh r4, [r0]
	movs r0, #0x20
	bl SoftResetRom
_02000C20:
	ldr r1, _02000C40 @ =gUnknown_030043F0
	ldrh r2, [r1]
	ands r6, r2
	movs r3, #0
	strh r6, [r1, #4]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _02000C5C
	cmp r0, r5
	bls _02000C50
	eors r5, r2
	strh r5, [r1, #6]
	ldrb r0, [r1, #9]
	b _02000C64
	.align 2, 0
_02000C40: .4byte gUnknown_030043F0
_02000C44: .4byte 0x04000130
_02000C48: .4byte gUnknown_03003330
_02000C4C: .4byte 0x04000208
_02000C50:
	ldrb r0, [r1, #8]
	subs r0, #1
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02000C60
_02000C5C:
	strh r3, [r1, #6]
	b _02000C66
_02000C60:
	strh r2, [r1, #6]
	ldrb r0, [r1, #0xa]
_02000C64:
	strb r0, [r1, #8]
_02000C66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_02000c6c
sub_02000c6c: @ 0x02000c6c
	ldr r1, _02000C88 @ =gUnknown_030043F0
	movs r0, #0
	strh r0, [r1, #6]
	strh r0, [r1, #4]
	strh r0, [r1]
	ldr r0, _02000C8C @ =0x0000FFFF
	strh r0, [r1, #2]
	movs r0, #0xf
	strb r0, [r1, #9]
	strb r0, [r1, #8]
	movs r0, #7
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_02000C88: .4byte gUnknown_030043F0
_02000C8C: .4byte 0x0000FFFF

	thumb_func_start sub_02000c90
sub_02000c90: @ 0x02000c90
	push {r4, lr}
	bl sub_02001290
	ldr r3, _02000CE4 @ =gUnknown_03004400
	ldr r0, _02000CE8 @ =sub_020013DC
	str r0, [r3]
	movs r1, #0
	strb r1, [r3, #5]
	strb r1, [r3, #4]
	movs r2, #1
	strb r2, [r3, #6]
	ldr r0, _02000CEC @ =0x02000F31
	str r0, [r3, #0x24]
	adds r0, r3, #0
	adds r0, #0x28
	strb r2, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r2, _02000CF0 @ =IWRAM_START + 0x5C0
	movs r1, #0x47
	adds r0, r2, #0
	adds r0, #0x45
_02000CC0:
	strb r1, [r0]
	subs r1, #1
	subs r0, #1
	cmp r0, r2
	bge _02000CC0
	movs r1, #0
	ldr r4, _02000CF4 @ =IWRAM_START + 0x606
	ldr r3, _02000CF8 @ =IWRAM_START + 0x607
	ldr r2, _02000CFC @ =IWRAM_START + 0x608
	ldr r0, _02000D00 @ =gUnknown_03005270
	strb r1, [r0]
	strb r1, [r2]
	strb r1, [r3]
	strb r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000CE4: .4byte gUnknown_03004400
_02000CE8: .4byte sub_020013DC
_02000CEC: .4byte 0x02000F31
_02000CF0: .4byte IWRAM_START + 0x5C0
_02000CF4: .4byte IWRAM_START + 0x606
_02000CF8: .4byte IWRAM_START + 0x607
_02000CFC: .4byte IWRAM_START + 0x608
_02000D00: .4byte gUnknown_03005270

	thumb_func_start sub_02000d04
sub_02000d04: @ 0x02000d04
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _02000D1C @ =IWRAM_START + 0x606
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #0x45
	bls _02000D20
	movs r0, #0
	b _02000DAA
	.align 2, 0
_02000D1C: .4byte IWRAM_START + 0x606
_02000D20:
	ldr r0, _02000D68 @ =IWRAM_START + 0x5C0
	ldr r5, _02000D6C @ =IWRAM_START + 0x607
	ldrb r1, [r5]
	adds r2, r1, #1
	strb r2, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r1, r0
	ldrb r3, [r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0x45
	bls _02000D3E
	movs r0, #0
	strb r0, [r5]
_02000D3E:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r5, _02000D70 @ =gUnknown_03004400
	adds r2, r0, r5
	str r7, [r2]
	strb r3, [r2, #4]
	cmp r6, #0
	beq _02000D74
	ldrb r0, [r4, #5]
	strb r0, [r2, #5]
	ldrb r0, [r4, #4]
	strb r0, [r2, #6]
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strb r3, [r0, #6]
	strb r3, [r4, #5]
	b _02000D8A
	.align 2, 0
_02000D68: .4byte IWRAM_START + 0x5C0
_02000D6C: .4byte IWRAM_START + 0x607
_02000D70: .4byte gUnknown_03004400
_02000D74:
	ldrb r0, [r4, #4]
	strb r0, [r2, #5]
	ldrb r0, [r4, #6]
	strb r0, [r2, #6]
	ldrb r1, [r4, #6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strb r3, [r0, #5]
	strb r3, [r4, #6]
_02000D8A:
	movs r0, #0
	strb r0, [r2, #0x19]
	strb r0, [r2, #0x18]
	strb r0, [r2, #0x17]
	strb r0, [r2, #0x16]
	movs r1, #0
	strh r0, [r2, #0xc]
	strh r0, [r2, #8]
	strb r1, [r2, #7]
	movs r0, #0xff
	strb r0, [r2, #0x1c]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r2, #0
_02000DAA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_02000db0
sub_02000db0: @ 0x02000db0
	push {r4, lr}
	bl sub_02000f34
	ldr r0, _02000DFC @ =gUnknown_03004400
	ldr r1, _02000E00 @ =IWRAM_START + 0x610
	ldr r2, _02000E04 @ =0x04000288
	bl CpuSet
	movs r1, #0
	ldr r4, _02000E08 @ =gUnknown_03001030
	ldr r3, _02000E0C @ =IWRAM_START + 0x5C0
_02000DC6:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r4
	adds r1, r0, r3
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	ble _02000DC6
	ldr r1, _02000E10 @ =gUnknown_03001076
	ldr r0, _02000E14 @ =IWRAM_START + 0x606
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02000E18 @ =gUnknown_03001077
	ldr r0, _02000E1C @ =IWRAM_START + 0x607
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02000E20 @ =gUnknown_03001078
	ldr r0, _02000E24 @ =IWRAM_START + 0x608
	ldrb r0, [r0]
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000DFC: .4byte gUnknown_03004400
_02000E00: .4byte IWRAM_START + 0x610
_02000E04: .4byte 0x04000288
_02000E08: .4byte gUnknown_03001030
_02000E0C: .4byte IWRAM_START + 0x5C0
_02000E10: .4byte gUnknown_03001076
_02000E14: .4byte IWRAM_START + 0x606
_02000E18: .4byte gUnknown_03001077
_02000E1C: .4byte IWRAM_START + 0x607
_02000E20: .4byte gUnknown_03001078
_02000E24: .4byte IWRAM_START + 0x608

	thumb_func_start sub_02000e28
sub_02000e28: @ 0x02000e28
	push {r4, lr}
	bl sub_02000fd4
	ldr r0, _02000E7C @ =IWRAM_START + 0x610
	ldr r1, _02000E80 @ =gUnknown_03004400
	ldr r2, _02000E84 @ =0x04000288
	bl CpuSet
	movs r1, #0
	ldr r4, _02000E88 @ =IWRAM_START + 0x5C0
	ldr r3, _02000E8C @ =gUnknown_03001030
_02000E3E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r4
	adds r1, r0, r3
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	ble _02000E3E
	ldr r1, _02000E90 @ =IWRAM_START + 0x606
	ldr r0, _02000E94 @ =gUnknown_03001076
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02000E98 @ =IWRAM_START + 0x607
	ldr r0, _02000E9C @ =gUnknown_03001077
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02000EA0 @ =IWRAM_START + 0x608
	ldr r0, _02000EA4 @ =gUnknown_03001078
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02000EA8 @ =gUnknown_03005270
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000E7C: .4byte IWRAM_START + 0x610
_02000E80: .4byte gUnknown_03004400
_02000E84: .4byte 0x04000288
_02000E88: .4byte IWRAM_START + 0x5C0
_02000E8C: .4byte gUnknown_03001030
_02000E90: .4byte IWRAM_START + 0x606
_02000E94: .4byte gUnknown_03001076
_02000E98: .4byte IWRAM_START + 0x607
_02000E9C: .4byte gUnknown_03001077
_02000EA0: .4byte IWRAM_START + 0x608
_02000EA4: .4byte gUnknown_03001078
_02000EA8: .4byte gUnknown_03005270

	thumb_func_start sub_02000eac
sub_02000eac: @ 0x02000eac
	push {r4, r5, lr}
	movs r0, #0
	ldr r5, _02000ED0 @ =gUnknown_03004400
_02000EB2:
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r5
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _02000EB2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02000ED0: .4byte gUnknown_03004400

	thumb_func_start sub_02000ed4
sub_02000ed4: @ 0x02000ed4
	push {r4, lr}
	ldr r3, _02000F20 @ =gUnknown_03004400
	ldrb r2, [r0, #5]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r0, #6]
	strb r2, [r1, #6]
	ldrb r2, [r0, #6]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r0, #5]
	strb r2, [r1, #5]
	ldr r3, _02000F24 @ =IWRAM_START + 0x5C0
	ldr r4, _02000F28 @ =IWRAM_START + 0x608
	ldrb r1, [r4]
	adds r2, r1, #1
	strb r2, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r1, r3
	ldrb r0, [r0, #4]
	strb r0, [r1]
	ldrb r0, [r4]
	cmp r0, #0x45
	bls _02000F12
	movs r0, #0
	strb r0, [r4]
_02000F12:
	ldr r1, _02000F2C @ =IWRAM_START + 0x606
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000F20: .4byte gUnknown_03004400
_02000F24: .4byte IWRAM_START + 0x5C0
_02000F28: .4byte IWRAM_START + 0x608
_02000F2C: .4byte IWRAM_START + 0x606
_02000F30:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_02000f34
sub_02000f34: @ 0x02000f34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r2, #0
	ldr r0, _02000FAC @ =gUnknown_030013A0
	mov ip, r0
	ldr r5, _02000FB0 @ =gUnknown_03001140
	ldr r1, _02000FB4 @ =gUnknown_030013A1
	mov r8, r1
	ldr r6, _02000FB8 @ =gUnknown_03001141
	ldr r0, _02000FBC @ =gUnknown_030013A2
	mov sb, r0
	ldr r7, _02000FC0 @ =gUnknown_03001142
	ldr r4, _02000FC4 @ =gUnknown_03001280
	ldr r3, _02000FC8 @ =gUnknown_03004E76
_02000F54:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #1
	adds r2, r2, r4
	lsls r0, r1, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _02000F54
	movs r2, #0
	ldr r4, _02000FCC @ =gUnknown_03001380
	ldr r3, _02000FD0 @ =gUnknown_03001120
_02000F76:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r4
	adds r1, r0, r3
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _02000F76
	ldrb r0, [r5]
	mov r1, ip
	strb r0, [r1]
	ldrb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r7]
	mov r1, sb
	strb r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02000FAC: .4byte gUnknown_030013A0
_02000FB0: .4byte gUnknown_03001140
_02000FB4: .4byte gUnknown_030013A1
_02000FB8: .4byte gUnknown_03001141
_02000FBC: .4byte gUnknown_030013A2
_02000FC0: .4byte gUnknown_03001142
_02000FC4: .4byte gUnknown_03001280
_02000FC8: .4byte gUnknown_03004E76
_02000FCC: .4byte gUnknown_03001380
_02000FD0: .4byte gUnknown_03001120

	thumb_func_start sub_02000fd4
sub_02000fd4: @ 0x02000fd4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0
	ldr r0, _02001060 @ =gUnknown_03001140
	mov sl, r0
	ldr r1, _02001064 @ =gUnknown_030013A0
	mov ip, r1
	ldr r0, _02001068 @ =gUnknown_030013A1
	mov r8, r0
	ldr r1, _0200106C @ =gUnknown_03001142
	mov sb, r1
	ldr r7, _02001070 @ =gUnknown_030013A2
	ldr r3, _02001074 @ =gUnknown_03004E70
	movs r6, #0x80
	lsls r6, r6, #2
	adds r5, r3, #6
	ldr r4, _02001078 @ =gUnknown_03001280
_02000FFC:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #3
	adds r0, r2, r3
	strh r6, [r0]
	adds r2, r2, r5
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _02000FFC
	movs r2, #0
	ldr r4, _0200107C @ =gUnknown_03001120
	ldr r3, _02001080 @ =gUnknown_03001380
_02001022:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r4
	adds r1, r0, r3
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _02001022
	mov r1, ip
	ldrb r0, [r1]
	mov r1, sl
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldr r1, _02001084 @ =gUnknown_03001141
	strb r0, [r1]
	ldrb r0, [r7]
	mov r1, sb
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02001060: .4byte gUnknown_03001140
_02001064: .4byte gUnknown_030013A0
_02001068: .4byte gUnknown_030013A1
_0200106C: .4byte gUnknown_03001142
_02001070: .4byte gUnknown_030013A2
_02001074: .4byte gUnknown_03004E70
_02001078: .4byte gUnknown_03001280
_0200107C: .4byte gUnknown_03001120
_02001080: .4byte gUnknown_03001380
_02001084: .4byte gUnknown_03001141

	thumb_func_start sub_02001088
sub_02001088: @ 0x02001088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r5, _02001128 @ =gUnknown_03004E70
	movs r6, #0x80
	movs r0, #0
	mov ip, r0
	ldr r1, _0200112C @ =gUnknown_03001088
	mov sl, r1
_020010A0:
	mov r2, ip
	lsls r0, r2, #1
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _02001142
	mov r8, sl
	movs r7, #1
	add r7, r8
	mov sb, r7
_020010B4:
	lsls r2, r0, #1
	mov r1, sb
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02001130 @ =gUnknown_03004400
	adds r4, r0, r1
	ldr r3, [r4, #0x10]
	str r2, [sp]
_020010CA:
	ldrb r0, [r3, #2]
	ldrb r2, [r4, #0x16]
	orrs r2, r0
	lsls r2, r2, #8
	movs r0, #6
	ldrsb r0, [r3, r0]
	ldrh r7, [r4, #0xe]
	adds r0, r0, r7
	movs r1, #0xff
	ands r0, r1
	orrs r2, r0
	strh r2, [r5]
	adds r5, #2
	ldrb r0, [r3, #3]
	ldrb r2, [r4, #0x17]
	orrs r2, r0
	lsls r2, r2, #8
	movs r0, #5
	ldrsb r0, [r3, r0]
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	ldr r7, _02001134 @ =0x000001FF
	adds r1, r7, #0
	ands r0, r1
	orrs r2, r0
	strh r2, [r5]
	adds r5, #2
	ldrb r0, [r3, #4]
	ldrb r1, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #8
	ldrh r0, [r4, #0x14]
	ldrh r2, [r3]
	adds r0, r0, r2
	orrs r1, r0
	strh r1, [r5]
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0200116A
	adds r5, #4
	ldrb r0, [r3, #7]
	cmp r0, #0
	beq _02001138
	adds r3, #8
	b _020010CA
	.align 2, 0
_02001128: .4byte gUnknown_03004E70
_0200112C: .4byte gUnknown_03001088
_02001130: .4byte gUnknown_03004400
_02001134: .4byte 0x000001FF
_02001138:
	ldr r0, [sp]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _020010B4
_02001142:
	movs r7, #1
	add ip, r7
	mov r0, ip
	cmp r0, #3
	ble _020010A0
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	beq _0200116A
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
_0200115C:
	strh r1, [r5]
	adds r5, #8
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _0200115C
_0200116A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200117c
sub_0200117c: @ 0x0200117c
	push {r4, r5, r6, r7, lr}
	ldr r2, _02001234 @ =gUnknown_03005270
	ldr r1, _02001238 @ =gUnknown_0300127A
	ldrb r0, [r1]
	strb r0, [r2]
	lsls r0, r0, #0x18
	adds r6, r1, #0
	cmp r0, #0
	beq _0200122C
	movs r3, #0
	ldrb r0, [r6]
	cmp r3, r0
	bge _020011B0
	ldr r5, _0200123C @ =gUnknown_030011D8
	adds r4, r6, #0
	ldr r2, _02001240 @ =gUnknown_03001148
_0200119C:
	ldrb r1, [r2]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r2, #2
	adds r3, #1
	ldrb r1, [r4]
	cmp r3, r1
	blt _0200119C
_020011B0:
	ldr r1, _0200123C @ =gUnknown_030011D8
	movs r3, #0xa0
_020011B4:
	ldrb r0, [r1]
	ldrb r2, [r1, #1]
	adds r0, r0, r2
	strb r0, [r1, #1]
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _020011B4
	ldrb r0, [r6]
	subs r3, r0, #1
	cmp r3, #0
	blt _020011F2
	ldr r7, _02001244 @ =gUnknown_03004E20
	ldr r5, _0200123C @ =gUnknown_030011D8
	ldr r1, _02001240 @ =gUnknown_03001148
	lsls r0, r3, #1
	adds r2, r0, r1
	movs r4, #0xff
_020011D8:
	ldrb r0, [r2]
	adds r0, r0, r5
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	ands r1, r4
	adds r1, r1, r7
	ldrb r0, [r2, #1]
	strb r0, [r1]
	subs r2, #2
	subs r3, #1
	cmp r3, #0
	bge _020011D8
_020011F2:
	ldrb r0, [r6]
	subs r3, r0, #1
	cmp r3, #0
	blt _0200122C
	ldr r0, _02001244 @ =gUnknown_03004E20
	mov ip, r0
	ldr r6, _02001248 @ =gUnknown_03001088
	ldr r5, _0200124C @ =gUnknown_03001080
	ldr r4, _02001250 @ =gUnknown_0300111C
	adds r7, r6, #1
_02001206:
	mov r1, ip
	adds r0, r3, r1
	ldrb r2, [r0]
	ldrb r0, [r5, #3]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	strb r2, [r0]
	ldrb r1, [r4]
	adds r0, r1, #1
	strb r0, [r4]
	strb r1, [r5, #3]
	subs r3, #1
	cmp r3, #0
	bge _02001206
_0200122C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02001234: .4byte gUnknown_03005270
_02001238: .4byte gUnknown_0300127A
_0200123C: .4byte gUnknown_030011D8
_02001240: .4byte gUnknown_03001148
_02001244: .4byte gUnknown_03004E20
_02001248: .4byte gUnknown_03001088
_0200124C: .4byte gUnknown_03001080
_02001250: .4byte gUnknown_0300111C

	thumb_func_start sub_02001254
sub_02001254: @ 0x02001254
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r5, _02001284 @ =gUnknown_03001088
	ldr r2, _02001288 @ =gUnknown_03001080
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r2, r2, #1
	adds r2, r2, r5
	ldr r4, _0200128C @ =gUnknown_0300111C
	ldrb r3, [r4]
	strb r3, [r2]
	ldrb r2, [r4]
	lsls r2, r2, #1
	adds r5, #1
	adds r2, r2, r5
	strb r0, [r2]
	ldrb r2, [r4]
	adds r0, r2, #1
	strb r0, [r4]
	strb r2, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02001284: .4byte gUnknown_03001088
_02001288: .4byte gUnknown_03001080
_0200128C: .4byte gUnknown_0300111C

	thumb_func_start sub_02001290
sub_02001290: @ 0x02001290
	push {r4, r5, r6, lr}
	ldr r5, _020012CC @ =gUnknown_03001140
	ldr r4, _020012D0 @ =gUnknown_03001141
	ldr r3, _020012D4 @ =gUnknown_03001142
	ldr r1, _020012D8 @ =gUnknown_03004E70
	movs r2, #0x80
	lsls r2, r2, #2
	movs r6, #0xfe
	lsls r6, r6, #2
	adds r0, r1, r6
_020012A4:
	strh r2, [r0]
	subs r0, #8
	cmp r0, r1
	bge _020012A4
	ldr r2, _020012DC @ =gUnknown_03001120
	movs r1, #0x3e
	adds r0, r2, #0
	adds r0, #0x1f
_020012B4:
	strb r1, [r0]
	subs r1, #2
	subs r0, #1
	cmp r0, r2
	bge _020012B4
	movs r0, #0
	strb r0, [r3]
	strb r0, [r4]
	strb r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020012CC: .4byte gUnknown_03001140
_020012D0: .4byte gUnknown_03001141
_020012D4: .4byte gUnknown_03001142
_020012D8: .4byte gUnknown_03004E70
_020012DC: .4byte gUnknown_03001120

	thumb_func_start sub_020012e0
sub_020012e0: @ 0x020012e0
	push {lr}
	ldr r0, _020012F4 @ =gUnknown_03004E70
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_020012F4: .4byte gUnknown_03004E70

	thumb_func_start sub_020012f8
sub_020012f8: @ 0x020012f8
	push {r4, r5, lr}
	ldr r5, _02001324 @ =gUnknown_03001140
	ldrb r4, [r5]
	cmp r4, #0x1f
	bhi _02001330
	ldr r1, _02001328 @ =gUnknown_03001120
	ldr r3, _0200132C @ =gUnknown_03001141
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r2, r1
	strb r2, [r3]
	adds r1, r4, #1
	strb r1, [r5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _02001334
	.align 2, 0
_02001324: .4byte gUnknown_03001140
_02001328: .4byte gUnknown_03001120
_0200132C: .4byte gUnknown_03001141
_02001330:
	movs r0, #1
	rsbs r0, r0, #0
_02001334:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200133c
sub_0200133c: @ 0x0200133c
	push {r4, lr}
	ldr r4, _02001368 @ =gUnknown_03001120
	ldr r3, _0200136C @ =gUnknown_03001142
	ldrb r1, [r3]
	adds r2, r1, #1
	strb r2, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r3]
	ldr r1, _02001370 @ =gUnknown_03001140
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02001368: .4byte gUnknown_03001120
_0200136C: .4byte gUnknown_03001142
_02001370: .4byte gUnknown_03001140

	thumb_func_start sub_02001374
sub_02001374: @ 0x02001374
	push {lr}
	ldr r3, _02001390 @ =gUnknown_0300127A
	ldr r1, _02001394 @ =gUnknown_030011D8
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xa1
_02001380:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _02001380
	movs r0, #0
	strb r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_02001390: .4byte gUnknown_0300127A
_02001394: .4byte gUnknown_030011D8

	thumb_func_start sub_02001398
sub_02001398: @ 0x02001398
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xd0
	bls _020013AA
	movs r1, #0
	b _020013B0
_020013AA:
	cmp r1, #0xa1
	bls _020013B0
	movs r1, #0xa1
_020013B0:
	ldr r3, _020013D4 @ =gUnknown_03001148
	ldr r2, _020013D8 @ =gUnknown_0300127A
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	strb r1, [r0]
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r3, #1
	adds r0, r0, r3
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020013D4: .4byte gUnknown_03001148
_020013D8: .4byte gUnknown_0300127A

	thumb_func_start sub_020013DC
sub_020013DC: @ 0x020013DC
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _02001414 @ =gUnknown_0300111C
	ldr r4, _02001418 @ =gUnknown_03001080
	movs r3, #0
	ldr r1, _0200141C @ =gUnknown_03001088
_020013E8:
	adds r0, r2, r4
	strb r2, [r0]
	strb r3, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #3
	ble _020013E8
	strb r2, [r5]
	cmp r2, #0x49
	bgt _0200140E
	ldr r1, _0200141C @ =gUnknown_03001088
	movs r3, #0
	lsls r0, r2, #1
	adds r0, r0, r1
_02001404:
	strb r3, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, #0x49
	ble _02001404
_0200140E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02001414: .4byte gUnknown_0300111C
_02001418: .4byte gUnknown_03001080
_0200141C: .4byte gUnknown_03001088

	thumb_func_start sub_02001420
sub_02001420: @ 0x02001420
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _0200149C @ =gUnknown_030014F8
	ldrb r0, [r1]
	cmp r0, #0
	beq _02001506
	mov r8, r1
	ldr r3, _020014A0 @ =gUnknown_030013D8
	mov sl, r3
	movs r4, #4
	add r4, sl
	mov sb, r4
_02001440:
	mov r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #2
	mov r3, sl
	adds r1, r2, r3
	ldr r3, [r1]
	cmp r3, #0
	bne _020014C4
	ldrb r0, [r1, #8]
	cmp r0, #0xff
	beq _020014A4
	mov r4, sb
	adds r0, r2, r4
	ldr r2, [r0]
	ldrb r4, [r1, #8]
	ldrb r0, [r1, #9]
	ldrh r5, [r1, #0xa]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _020014FE
_02001476:
	adds r1, r2, #0
	subs r3, r0, #1
	adds r0, r1, #0
	adds r0, #0x40
	cmp r4, #0
	beq _0200148E
	adds r2, r4, #0
_02001484:
	strh r5, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _02001484
_0200148E:
	adds r2, r0, #0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _02001476
	b _020014FE
	.align 2, 0
_0200149C: .4byte gUnknown_030014F8
_020014A0: .4byte gUnknown_030013D8
_020014A4:
	ldrh r0, [r1, #0xa]
	str r0, [sp]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldr r1, [r0]
	mov r0, sp
	ldr r2, _020014C0 @ =0x01000200
	bl CpuFastSet
	b _020014FE
	.align 2, 0
_020014C0: .4byte 0x01000200
_020014C4:
	mov r4, sb
	adds r0, r2, r4
	ldr r2, [r0]
	ldrb r5, [r1, #8]
	ldrb r0, [r1, #9]
	ldrh r7, [r1, #0xa]
	subs r0, #1
	lsls r0, r0, #0x18
	b _020014F8
_020014D6:
	adds r1, r2, #0
	subs r6, r0, #1
	adds r4, r1, #0
	adds r4, #0x40
	cmp r5, #0
	beq _020014F4
	adds r2, r5, #0
_020014E4:
	ldrh r0, [r3]
	adds r0, r7, r0
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _020014E4
_020014F4:
	adds r2, r4, #0
	lsls r0, r6, #0x18
_020014F8:
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _020014D6
_020014FE:
	ldr r1, _02001518 @ =gUnknown_030014F8
	ldrb r0, [r1]
	cmp r0, #0
	bne _02001440
_02001506:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02001518: .4byte gUnknown_030014F8

	thumb_func_start sub_0200151c
sub_0200151c: @ 0x0200151c
	ldr r0, _02001524 @ =gUnknown_030013A8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_02001524: .4byte gUnknown_030013A8

	thumb_func_start sub_02001528
sub_02001528: @ 0x02001528
	ldr r1, _02001530 @ =gUnknown_030013A8
	str r0, [r1]
	bx lr
	.align 2, 0
_02001530: .4byte gUnknown_030013A8

	thumb_func_start sub_02001534
sub_02001534: @ 0x02001534
	ldr r2, _02001548 @ =gUnknown_030013A8
	ldr r1, [r2]
	ldr r0, _0200154C @ =0x41C64E6D
	muls r0, r1, r0
	ldr r1, _02001550 @ =0x00003039
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #1
	lsrs r0, r0, #0x11
	bx lr
	.align 2, 0
_02001548: .4byte gUnknown_030013A8
_0200154C: .4byte 0x41C64E6D
_02001550: .4byte 0x00003039

	thumb_func_start sub_02001554
sub_02001554: @ 0x02001554
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0200157C @ =gUnknown_030013A8
	ldr r2, [r3]
	ldr r0, _02001580 @ =0x41C64E6D
	muls r0, r2, r0
	ldr r2, _02001584 @ =0x00003039
	adds r0, r0, r2
	str r0, [r3]
	lsls r0, r0, #1
	lsrs r0, r0, #0x11
	bl Mod
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0200157C: .4byte gUnknown_030013A8
_02001580: .4byte 0x41C64E6D
_02001584: .4byte 0x00003039

	thumb_func_start sub_02001588
sub_02001588: @ 0x02001588
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r4, r4, r2
	adds r5, r2, #0
	b _020015A2
_02001596:
	movs r1, #0xa
	bl Div
	subs r4, #1
	strb r1, [r4]
	subs r5, #1
_020015A2:
	cmp r5, #0
	ble _020015AE
	cmp r0, #9
	bgt _02001596
	subs r4, #1
	strb r0, [r4]
_020015AE:
	movs r0, #0
	cmp r5, #1
	ble _020015C6
	movs r1, #0
_020015B6:
	subs r4, #1
	strb r1, [r4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r5, #1
	cmp r5, #1
	bgt _020015B6
_020015C6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_020015cc
sub_020015cc: @ 0x020015cc
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r4, r6, r7
	adds r5, r7, #0
	cmp r7, #0
	ble _02001600
	b _020015F8
_020015E8:
	movs r1, #0xa
	bl Div
	subs r4, #1
	strb r1, [r4]
	subs r5, #1
	cmp r5, #0
	ble _02001600
_020015F8:
	cmp r0, #9
	bgt _020015E8
	subs r4, #1
	strb r0, [r4]
_02001600:
	movs r0, #0
	cmp r5, #1
	ble _02001618
	movs r1, #0
_02001608:
	subs r4, #1
	strb r1, [r4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r5, #1
	cmp r5, #1
	bgt _02001608
_02001618:
	adds r6, r6, r0
	subs r0, r7, r0
	cmp r0, #0
	ble _02001630
	adds r2, r0, #0
_02001622:
	ldrb r0, [r6]
	add r0, r8
	strb r0, [r6]
	adds r6, #1
	subs r2, #1
	cmp r2, #0
	bne _02001622
_02001630:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200163c
sub_0200163c: @ 0x0200163c
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r3, r1, #0x18
	cmp r3, #0xff
	beq _02001668
	movs r4, #0x80
	lsls r4, r4, #0x13
_02001652:
	ldrh r1, [r2]
	adds r2, #2
	adds r1, r1, r4
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xff
	bne _02001652
_02001668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02001670
sub_02001670: @ 0x02001670
	ldr r1, _02001678 @ =gUnknown_030013D0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_02001678: .4byte gUnknown_030013D0

	thumb_func_start sub_0200167c
sub_0200167c: @ 0x0200167c
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _02001694 @ =gUnknown_030013D0
	movs r2, #0
	strb r2, [r3]
	bl sub_02001698
	pop {r0}
	bx r0
	.align 2, 0
_02001694: .4byte gUnknown_030013D0

	thumb_func_start sub_02001698
sub_02001698: @ 0x02001698
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r3, _020016C8 @ =gUnknown_030013D0
	ldrb r0, [r3]
	cmp r0, #7
	bhi _020016D0
	ldr r2, _020016CC @ =gUnknown_030013B0
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0]
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r2, #2
	adds r0, r0, r2
	strh r5, [r0]
	movs r0, #1
	b _020016D2
	.align 2, 0
_020016C8: .4byte gUnknown_030013D0
_020016CC: .4byte gUnknown_030013B0
_020016D0:
	movs r0, #0
_020016D2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_020016d8
sub_020016d8: @ 0x020016d8
	push {r4, r5, r6, lr}
	ldr r1, _02001710 @ =gUnknown_030013D0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02001708
	adds r3, r1, #0
	ldr r4, _02001714 @ =gUnknown_030013B0
	adds r6, r4, #2
	movs r5, #0x80
	lsls r5, r5, #0x13
_020016EC:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r0, r1, r4
	ldrh r2, [r0]
	adds r2, r2, r5
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r0, [r3]
	cmp r0, #0
	bne _020016EC
_02001708:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02001710: .4byte gUnknown_030013D0
_02001714: .4byte gUnknown_030013B0

	thumb_func_start sub_02001718
sub_02001718: @ 0x02001718
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r3, r3, r0
	lsrs r0, r3, #0x18
	cmp r0, #0xff
	beq _0200175A
_02001734:
	subs r5, r0, #1
	adds r3, r1, #0
	adds r3, #0x40
	cmp r6, #0
	beq _02001750
	adds r2, r6, #0
_02001740:
	ldrh r0, [r4]
	adds r0, r7, r0
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _02001740
_02001750:
	adds r1, r3, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _02001734
_0200175A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_02001760
sub_02001760: @ 0x02001760
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	cmp r2, #0xff
	beq _0200179C
_0200177A:
	adds r0, r4, #0
	subs r3, r2, #1
	adds r2, r0, #0
	adds r2, #0x40
	cmp r5, #0
	beq _02001792
	adds r1, r5, #0
_02001788:
	strh r6, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _02001788
_02001792:
	adds r4, r2, #0
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0200177A
_0200179C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020017a4
sub_020017a4: @ 0x020017a4
	ldr r1, _020017AC @ =gUnknown_030014F8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_020017AC: .4byte gUnknown_030014F8

	thumb_func_start sub_020017b0
sub_020017b0: @ 0x020017b0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r3, _0200181C @ =gUnknown_030014F8
	ldrb r0, [r3]
	cmp r0, #0x17
	bhi _02001824
	ldr r2, _02001820 @ =gUnknown_030013D8
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r6, [r0, #8]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r7, [r0, #9]
	ldrb r1, [r3]
	adds r0, r1, #1
	strb r0, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r1, ip
	strh r1, [r0, #0xa]
	movs r0, #1
	b _02001826
	.align 2, 0
_0200181C: .4byte gUnknown_030014F8
_02001820: .4byte gUnknown_030013D8
_02001824:
	movs r0, #0
_02001826:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200182c
sub_0200182c: @ 0x0200182c
	lsls r0, r0, #0x18
	ldr r1, _0200183C @ =gUnknown_0201FB74
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0200183C: .4byte gUnknown_0201FB74

	thumb_func_start sub_02001840
sub_02001840: @ 0x02001840
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _02001858 @ =gUnknown_0201FB74
	adds r0, #0xc0
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_02001858: .4byte gUnknown_0201FB74

	thumb_func_start sub_0200185c
sub_0200185c: @ 0x0200185c
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _02001898 @ =0x0000FFFF
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0200188C
	ldr r6, _0200189C @ =gUnknown_0201FD74
	adds r5, r0, #0
_02001872:
	lsrs r1, r3, #8
	ldrb r0, [r4]
	eors r3, r0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r3, r0, #0
	eors r3, r1
	adds r4, #1
	subs r2, #1
	cmp r2, r5
	bne _02001872
_0200188C:
	mvns r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_02001898: .4byte 0x0000FFFF
_0200189C: .4byte gUnknown_0201FD74

	thumb_func_start sub_020018a0
sub_020018a0: @ 0x020018a0
	push {lr}
	bl m4aSoundInit
	ldr r0, _020018B0 @ =sub_020018B4
	bl SetVBlankIntr
	pop {r0}
	bx r0
	.align 2, 0
_020018B0: .4byte sub_020018B4

	thumb_func_start sub_020018B4
sub_020018B4: @ 0x020018B4
	push {lr}
	bl m4aSoundVSync
	ldr r1, _020018C4 @ =gUnknown_03003330
	movs r0, #0
	strb r0, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
_020018C4: .4byte gUnknown_03003330

	thumb_func_start sub_020018c8
sub_020018c8: @ 0x020018c8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	bl sub_02001c60
	bl sub_020017a4
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _0200190C @ =0x0600E000
	ldr r2, _02001910 @ =0x01000800
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, _02001914 @ =gUnknown_02024618
	ldr r4, _02001918 @ =0x0203F800
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0200191C @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _02001924
	ldr r1, _02001920 @ =0x0600F000
	movs r0, #0xe0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #9
	movs r3, #0x14
	bl sub_02001718
	b _02001934
	.align 2, 0
_0200190C: .4byte 0x0600E000
_02001910: .4byte 0x01000800
_02001914: .4byte gUnknown_02024618
_02001918: .4byte 0x0203F800
_0200191C: .4byte gUnknown_03003330
_02001920: .4byte 0x0600F000
_02001924:
	ldr r0, _02001ACC @ =0x0203F968
	ldr r1, _02001AD0 @ =0x0600F000
	movs r2, #0xe0
	str r2, [sp]
	movs r2, #9
	movs r3, #0x14
	bl sub_02001718
_02001934:
	ldr r0, _02001AD4 @ =gUnknown_02021BC4
	ldr r1, _02001AD8 @ =0x0600F800
	movs r2, #0x80
	lsls r2, r2, #2
	str r2, [sp]
	movs r2, #0x16
	movs r3, #0x14
	bl sub_02001718
	ldr r0, _02001ADC @ =gUnknown_030015A8
	movs r4, #0
	strb r4, [r0, #6]
	strb r4, [r0, #2]
	strb r4, [r0, #4]
	strb r4, [r0]
	bl sub_02000c90
	ldr r0, _02001AE0 @ =sub_02003424
	ldr r1, _02001AE4 @ =gUnknown_03004424
	movs r2, #1
	bl sub_02000d04
	ldr r1, _02001AE8 @ =gUnknown_0300159B
	strb r4, [r1]
	movs r5, #0
	ldr r0, _02001AEC @ =gUnknown_03003B80
	adds r4, r0, #0
	adds r4, #0x37
	adds r6, r1, #0
_0200196E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _02001988
	ldr r0, _02001AF0 @ =sub_020035CC
	ldr r1, _02001AE4 @ =gUnknown_03004424
	movs r2, #1
	bl sub_02000d04
	adds r1, r0, #0
	strb r5, [r1, #0x1a]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_02001988:
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	ble _0200196E
	ldr r1, _02001AF4 @ =gUnknown_0300152F
	ldr r0, _02001AEC @ =gUnknown_03003B80
	mov r8, r0
	adds r0, #0x58
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r5, _02001AF8 @ =sub_020074c0
	ldr r4, _02001AFC @ =gUnknown_03004400
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r6, #0
	movs r0, #1
	strb r0, [r1, #0x1a]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r6, [r1, #0x1a]
	ldr r0, _02001B00 @ =gUnknown_0300152D
	strb r6, [r0]
	ldr r0, _02001B04 @ =sub_020041E0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r1, _02001B08 @ =gUnknown_03001510
	str r0, [r1]
	ldr r0, _02001B0C @ =sub_020089B0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	movs r5, #0
	mov r4, r8
	adds r4, #0x31
_020019E2:
	ldrb r0, [r4]
	cmp r0, #0
	beq _020019F6
	ldr r0, _02001B10 @ =sub_020083e4
	ldr r1, _02001AFC @ =gUnknown_03004400
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r5, [r1, #0x1a]
_020019F6:
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _020019E2
	ldr r1, _02001B14 @ =gUnknown_0300159A
	movs r0, #0
	strb r0, [r1]
	movs r5, #0
	ldr r7, _02001B18 @ =gUnknown_03003BDA
	adds r6, r1, #0
_02001A0A:
	adds r4, r5, r7
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _02001A2A
	ldr r0, _02001B1C @ =sub_02008324
	ldr r1, _02001AFC @ =gUnknown_03004400
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r5, [r1, #0x19]
	ldrb r0, [r4]
	strb r0, [r1, #0x1a]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_02001A2A:
	adds r5, #1
	cmp r5, #7
	ble _02001A0A
	ldr r1, _02001B20 @ =gUnknown_03001530
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _02001AEC @ =gUnknown_03003B80
	adds r4, r0, #0
	adds r4, #0x59
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _02001A52
	ldr r0, _02001B24 @ =sub_02003e04
	ldr r1, _02001AFC @ =gUnknown_03004400
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	ldrb r0, [r4]
	strb r0, [r1, #0x1a]
_02001A52:
	ldr r0, _02001B28 @ =sub_02007500
	ldr r4, _02001AFC @ =gUnknown_03004400
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _02001B2C @ =sub_02008A04
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r1, _02001B30 @ =gUnknown_0300150C
	str r0, [r1]
	ldr r0, _02001B34 @ =sub_0200218c
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _02001B38 @ =sub_020089D4
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _02001B3C @ =sub_020088b0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1, #0x1a]
	ldr r0, _02001B40 @ =gUnknown_03001509
	strb r4, [r0]
	ldr r1, _02001B44 @ =gUnknown_0300152A
	movs r2, #0xfa
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, #0
	bl sub_0200167c
	movs r0, #1         @ MUS_GARDEN
	bl m4aSongNumStart
	ldr r1, _02001B48 @ =gUnknown_03003330
	movs r0, #1
	strb r0, [r1, #0xf]
	ldr r0, _02001B4C @ =sub_02001D68
	str r0, [r1]
	ldr r1, _02001B50 @ =gUnknown_03001500
	ldr r0, _02001B54 @ =gUnknown_03001501
	strb r4, [r0]
	strb r4, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02001ACC: .4byte 0x0203F968
_02001AD0: .4byte 0x0600F000
_02001AD4: .4byte gUnknown_02021BC4
_02001AD8: .4byte 0x0600F800
_02001ADC: .4byte gUnknown_030015A8
_02001AE0: .4byte sub_02003424
_02001AE4: .4byte gUnknown_03004424
_02001AE8: .4byte gUnknown_0300159B
_02001AEC: .4byte gUnknown_03003B80
_02001AF0: .4byte sub_020035CC
_02001AF4: .4byte gUnknown_0300152F
_02001AF8: .4byte sub_020074c0
_02001AFC: .4byte gUnknown_03004400
_02001B00: .4byte gUnknown_0300152D
_02001B04: .4byte sub_020041E0
_02001B08: .4byte gUnknown_03001510
_02001B0C: .4byte sub_020089B0
_02001B10: .4byte sub_020083e4
_02001B14: .4byte gUnknown_0300159A
_02001B18: .4byte gUnknown_03003BDA
_02001B1C: .4byte sub_02008324
_02001B20: .4byte gUnknown_03001530
_02001B24: .4byte sub_02003e04
_02001B28: .4byte sub_02007500
_02001B2C: .4byte sub_02008A04
_02001B30: .4byte gUnknown_0300150C
_02001B34: .4byte sub_0200218c
_02001B38: .4byte sub_020089D4
_02001B3C: .4byte sub_020088b0
_02001B40: .4byte gUnknown_03001509
_02001B44: .4byte gUnknown_0300152A
_02001B48: .4byte gUnknown_03003330
_02001B4C: .4byte sub_02001D68
_02001B50: .4byte gUnknown_03001500
_02001B54: .4byte gUnknown_03001501

	thumb_func_start sub_02001b58
sub_02001b58: @ 0x02001b58
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _02001BCC @ =gUnknown_02020E9C
	movs r1, #0xd
	bl sub_0200163c
	ldr r0, _02001BD0 @ =gUnknown_02020EDC
	movs r1, #3
	bl sub_0200163c
	movs r1, #0
	ldr r4, _02001BD4 @ =gUnknown_03003BEA
	ldr r0, _02001BD8 @ =0x000002AF
	adds r3, r0, #0
	ldr r5, _02001BDC @ =gUnknown_03001538
	adds r2, r5, #0
_02001B78:
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #6
	ble _02001B78
	ldr r1, _02001BE0 @ =0x0600F042
	movs r0, #0xa0
	lsls r0, r0, #8
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #7
	movs r3, #1
	bl sub_02001718
	ldr r0, _02001BE4 @ =sub_020088f8
	ldr r1, _02001BE8 @ =gUnknown_03004400
	movs r2, #0
	bl sub_02000d04
	movs r1, #0x10
	strb r1, [r0, #0x1a]
	ldr r1, _02001BEC @ =gUnknown_0300152A
	movs r2, #0xfa
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, #0
	bl sub_0200167c
	ldr r1, _02001BF0 @ =gUnknown_03003330
	movs r0, #1
	strb r0, [r1, #0xf]
	ldr r0, _02001BF4 @ =sub_02001D68
	str r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02001BCC: .4byte gUnknown_02020E9C
_02001BD0: .4byte gUnknown_02020EDC
_02001BD4: .4byte gUnknown_03003BEA
_02001BD8: .4byte 0x000002AF
_02001BDC: .4byte gUnknown_03001538
_02001BE0: .4byte 0x0600F042
_02001BE4: .4byte sub_020088f8
_02001BE8: .4byte gUnknown_03004400
_02001BEC: .4byte gUnknown_0300152A
_02001BF0: .4byte gUnknown_03003330
_02001BF4: .4byte sub_02001D68

	thumb_func_start sub_02001BF8
sub_02001BF8: @ 0x02001BF8
	push {lr}
	bl sub_02001c60
	ldr r0, _02001C44 @ =gUnknown_030015A8
	ldrb r1, [r0, #2]
	strb r1, [r0]
	ldrb r1, [r0, #6]
	strb r1, [r0, #4]
	ldr r1, _02001C48 @ =gUnknown_03001530
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _02001C4C @ =sub_020088b0
	ldr r1, _02001C50 @ =gUnknown_03004400
	movs r2, #0
	bl sub_02000d04
	movs r1, #0x10
	strb r1, [r0, #0x1a]
	ldr r1, _02001C54 @ =gUnknown_0300152A
	movs r2, #0xfa
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, #0
	bl sub_0200167c
	movs r0, #1         @ MUS_GARDEN
	bl m4aSongNumStart
	ldr r1, _02001C58 @ =gUnknown_03003330
	movs r0, #1
	strb r0, [r1, #0xf]
	ldr r0, _02001C5C @ =sub_02001D68
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_02001C44: .4byte gUnknown_030015A8
_02001C48: .4byte gUnknown_03001530
_02001C4C: .4byte sub_020088b0
_02001C50: .4byte gUnknown_03004400
_02001C54: .4byte gUnknown_0300152A
_02001C58: .4byte gUnknown_03003330
_02001C5C: .4byte sub_02001D68

	thumb_func_start sub_02001c60
sub_02001c60: @ 0x02001c60
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _02001D14 @ =gUnknown_02020E9C
	movs r1, #0xd
	bl sub_0200163c
	ldr r0, _02001D18 @ =gUnknown_02020ED0
	movs r1, #3
	bl sub_0200163c
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _02001D1C @ =0x01000010
	mov r0, sp
	bl CpuFastSet
	ldr r0, _02001D20 @ =gUnknown_020233FC
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, _02001D24 @ =gUnknown_020235FC
	ldr r1, _02001D28 @ =0x06001C00
	bl LZ77UnCompVram
	ldr r0, _02001D2C @ =gUnknown_02022C44
	ldr r1, _02001D30 @ =0x060041E0
	bl LZ77UnCompVram
	ldr r0, _02001D34 @ =gUnknown_020220EC
	ldr r1, _02001D38 @ =0x060055E0
	bl LZ77UnCompVram
	ldr r0, _02001D3C @ =gUnknown_020211C8
	ldr r1, _02001D40 @ =0x06008000
	bl LZ77UnCompVram
	ldr r6, _02001D44 @ =0x06000F80
	movs r4, #0
_02001CB4:
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #6
	ldr r0, _02001D44 @ =0x06000F80
	adds r1, r1, r0
	ldr r0, _02001D48 @ =0x06002980
	movs r2, #0x50
	bl CpuFastSet
	lsls r0, r4, #5
	ldr r1, _02001D4C @ =0x06002AC0
	adds r3, r0, r1
	movs r0, #0
	adds r5, r4, #1
_02001CD0:
	adds r4, r0, #1
	movs r2, #7
_02001CD4:
	ldr r1, [r6]
	ldm r3!, {r0}
	orrs r1, r0
	stm r6!, {r1}
	subs r2, #1
	cmp r2, #0
	bge _02001CD4
	subs r3, #0x20
	adds r0, r4, #0
	cmp r0, #9
	ble _02001CD0
	adds r4, r5, #0
	cmp r4, #9
	ble _02001CB4
	ldr r0, _02001D50 @ =gUnknown_020246E4
	ldr r1, _02001D54 @ =0x05000200
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, _02001D58 @ =gUnknown_02024C24
	ldr r1, _02001D5C @ =0x06012D80
	bl LZ77UnCompVram
	ldr r0, _02001D60 @ =gUnknown_020268B4
	ldr r1, _02001D64 @ =0x06011580
	bl LZ77UnCompVram
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02001D14: .4byte gUnknown_02020E9C
_02001D18: .4byte gUnknown_02020ED0
_02001D1C: .4byte 0x01000010
_02001D20: .4byte gUnknown_020233FC
_02001D24: .4byte gUnknown_020235FC
_02001D28: .4byte 0x06001C00
_02001D2C: .4byte gUnknown_02022C44
_02001D30: .4byte 0x060041E0
_02001D34: .4byte gUnknown_020220EC
_02001D38: .4byte 0x060055E0
_02001D3C: .4byte gUnknown_020211C8
_02001D40: .4byte 0x06008000
_02001D44: .4byte 0x06000F80
_02001D48: .4byte 0x06002980
_02001D4C: .4byte 0x06002AC0
_02001D50: .4byte gUnknown_020246E4
_02001D54: .4byte 0x05000200
_02001D58: .4byte gUnknown_02024C24
_02001D5C: .4byte 0x06012D80
_02001D60: .4byte gUnknown_020268B4
_02001D64: .4byte 0x06011580

	thumb_func_start sub_02001D68
sub_02001D68: @ 0x02001D68
	push {lr}
	bl sub_020016d8
	bl sub_020012e0
	bl sub_02001420
	ldr r1, _02001D98 @ =gUnknown_030015A8
	ldrb r0, [r1]
	cmp r0, #0
	beq _02001DB4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r1, #2]
	ldrb r0, [r1, #1]
	cmp r0, #0xd
	bls _02001DA4
	ldr r0, _02001D9C @ =gUnknown_030015B0
	ldr r1, _02001DA0 @ =0x05000200
	movs r2, #0x10
	bl CpuSet
	b _02001DB4
	.align 2, 0
_02001D98: .4byte gUnknown_030015A8
_02001D9C: .4byte gUnknown_030015B0
_02001DA0: .4byte 0x05000200
_02001DA4:
	ldrb r0, [r1, #1]
	lsls r0, r0, #5
	ldr r1, _02001DEC @ =gUnknown_020248E4
	adds r0, r0, r1
	ldr r1, _02001DF0 @ =0x05000200
	movs r2, #0x10
	bl CpuSet
_02001DB4:
	ldr r1, _02001DF4 @ =gUnknown_030015A8
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _02001DD4
	movs r0, #0
	strb r0, [r1, #4]
	movs r0, #1
	strb r0, [r1, #6]
	ldrb r0, [r1, #5]
	lsls r0, r0, #5
	ldr r1, _02001DF8 @ =gUnknown_02024AA4
	adds r0, r0, r1
	ldr r1, _02001DFC @ =0x050003C0
	movs r2, #0x10
	bl CpuSet
_02001DD4:
	bl sub_02000590
	bl sub_02001374
	bl sub_02000eac
	bl sub_0200117c
	bl sub_02001088
	pop {r0}
	bx r0
	.align 2, 0
_02001DEC: .4byte gUnknown_020248E4
_02001DF0: .4byte 0x05000200
_02001DF4: .4byte gUnknown_030015A8
_02001DF8: .4byte gUnknown_02024AA4
_02001DFC: .4byte 0x050003C0

	thumb_func_start sub_02001e00
sub_02001e00: @ 0x02001e00
	push {r4, r5, lr}
	ldr r1, _02001E54 @ =0x04000050
	ldr r2, _02001E58 @ =0x000008BF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _02001E5C @ =0x04000054
	ldr r5, _02001E60 @ =gUnknown_03003330
	ldrh r1, [r5, #0xc]
	adds r1, #1
	strh r1, [r5, #0xc]
	strh r1, [r0]
	ldr r3, _02001E64 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r1
	movs r2, #0xfe
	ands r0, r2
	lsls r0, r0, #7
	orrs r0, r1
	strh r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf
	ble _02001E6E
	ldr r4, [r5, #4]
	cmp r4, #0
	bne _02001E6C
	bl m4aMPlayAllStop
	bl m4aSoundMain
	bl VBlankIntrWait
	bl m4aSoundVSyncOff
	ldr r0, _02001E68 @ =0x04000208
	strh r4, [r0]
	subs r0, #8
	strh r4, [r0]
	movs r0, #0x20
	bl SoftResetRom
	b _02001E6E
	.align 2, 0
_02001E54: .4byte 0x04000050
_02001E58: .4byte 0x000008BF
_02001E5C: .4byte 0x04000054
_02001E60: .4byte gUnknown_03003330
_02001E64: .4byte 0x04000052
_02001E68: .4byte 0x04000208
_02001E6C:
	str r4, [r5]
_02001E6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_02001e74
sub_02001e74: @ 0x02001e74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r0, sp, #8
	movs r4, #0
	strh r4, [r0]
	ldr r5, _02001F0C @ =gUnknown_03003BEA
	ldr r2, _02001F10 @ =0x010003F7
	adds r1, r5, #0
	bl CpuSet
	adds r3, r5, #0
	subs r3, #0x11
	ldrb r0, [r3]
	strb r0, [r5, #8]
	ldr r2, _02001F14 @ =gUnknown_03001501
	movs r1, #0xff
	orrs r0, r1
	strb r0, [r3]
	strb r1, [r2]
	ldr r1, _02001F18 @ =gUnknown_0300152F
	subs r0, r5, #1
	strb r4, [r0]
	subs r0, #7
	strb r4, [r0]
	strb r4, [r1]
	subs r0, #0xa
	strb r4, [r0]
	ldr r1, _02001F1C @ =gUnknown_0300152D
	movs r0, #9
	strb r0, [r1]
	ldr r0, _02001F20 @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	movs r0, #0xa
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	movs r6, #0
	ldr r2, _02001F24 @ =gUnknown_020202B6
	lsls r0, r3, #3
	subs r0, r0, r3
	adds r7, r5, #0
	subs r7, #0x6a
	movs r1, #0x46
	muls r1, r4, r1
	adds r0, r0, r1
	adds r2, r0, r2
_02001ED8:
	adds r1, r6, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r6, #1
	cmp r6, #6
	ble _02001ED8
	adds r0, r7, #0
	adds r0, #0x74
	movs r1, #0x64
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	movs r0, #3
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _02001F88
	cmp r0, #1
	bgt _02001F28
	cmp r0, #0
	beq _02001F2E
	b _02001FF8
	.align 2, 0
_02001F0C: .4byte gUnknown_03003BEA
_02001F10: .4byte 0x010003F7
_02001F14: .4byte gUnknown_03001501
_02001F18: .4byte gUnknown_0300152F
_02001F1C: .4byte gUnknown_0300152D
_02001F20: .4byte gUnknown_03003330
_02001F24: .4byte gUnknown_020202B6
_02001F28:
	cmp r0, #2
	beq _02001FA2
	b _02001FF8
_02001F2E:
	movs r6, #4
	add r0, sp, #4
_02001F32:
	strb r6, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _02001F32
	movs r6, #0
_02001F3E:
	movs r0, #5
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	ldr r1, _02001F80 @ =gUnknown_03003C00
	adds r1, r6, r1
	mov r0, sp
	adds r2, r0, r3
	ldrb r0, [r2]
	strb r0, [r1]
	cmp r3, #3
	bgt _02001F6C
	adds r1, r2, #0
_02001F60:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	cmp r3, #3
	ble _02001F60
_02001F6C:
	adds r6, #1
	cmp r6, #3
	ble _02001F3E
	ldr r0, _02001F84 @ =gUnknown_03003B80
	mov r1, sp
	ldrb r1, [r1]
	adds r0, #0x84
	strb r1, [r0]
	b _02001FF8
	.align 2, 0
_02001F80: .4byte gUnknown_03003C00
_02001F84: .4byte gUnknown_03003B80
_02001F88:
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x80
_02001F8E:
	movs r0, #3
	bl sub_02001554
	adds r1, r6, r4
	adds r0, #1
	strb r0, [r1]
	adds r6, #1
	cmp r6, #4
	ble _02001F8E
	b _02001FF8
_02001FA2:
	adds r1, r7, #0
	adds r1, #0x80
	adds r3, r1, #0
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x84
_02001FAE:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r3
	bge _02001FAE
	movs r4, #0xc
_02001FB8:
	movs r6, #0
_02001FBA:
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #4
	bhi _02001FEC
	cmp r4, #4
	bls _02001FCA
	movs r0, #6
	b _02001FCC
_02001FCA:
	adds r0, r4, #1
_02001FCC:
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	ldr r1, _02001FF4 @ =gUnknown_03003C00
	adds r2, r6, r1
	ldrb r0, [r2]
	adds r0, r0, r3
	cmp r0, #5
	bgt _02001FEC
	strb r0, [r2]
	subs r0, r4, r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _02001FF8
_02001FEC:
	adds r6, #1
	cmp r6, #4
	ble _02001FBA
	b _02001FB8
	.align 2, 0
_02001FF4: .4byte gUnknown_03003C00
_02001FF8:
	ldr r0, _02002170 @ =gUnknown_0202071C
	ldr r4, _02002174 @ =gUnknown_03003C58
	adds r3, r4, #0
	subs r3, #0x53
	movs r2, #0xff
	adds r1, r4, #0
	subs r1, #0x51
_02002006:
	strb r2, [r1]
	subs r1, #1
	cmp r1, r3
	bge _02002006
	ldr r2, _02002178 @ =gUnknown_03003C08
	movs r3, #1
	adds r1, r2, #7
_02002014:
	strb r3, [r1]
	subs r1, #1
	cmp r1, r2
	bge _02002014
	adds r2, r0, #0
	adds r1, r4, #0
	movs r6, #0xf0
	lsls r6, r6, #3
_02002024:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r6, #1
	cmp r6, #0
	bne _02002024
	bl sub_02001534
	adds r4, r0, #0
	bl sub_02001534
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r4, r0
	ldr r5, _0200217C @ =gUnknown_03003330
	ldr r0, [r5, #8]
	adds r4, r4, r0
	ldr r7, _02002180 @ =gUnknown_03003B80
	lsrs r1, r4, #0x18
	adds r0, r7, #0
	adds r0, #0xe8
	strb r1, [r0]
	lsrs r0, r4, #0x10
	adds r1, r7, #0
	adds r1, #0xe9
	strb r0, [r1]
	lsrs r0, r4, #8
	adds r1, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xeb
	strb r4, [r0]
	bl sub_02001534
	adds r4, r0, #0
	bl sub_02001534
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r4, r0
	ldr r0, [r5, #8]
	adds r4, r4, r0
	lsrs r1, r4, #0x18
	adds r0, r7, #0
	adds r0, #0xec
	strb r1, [r0]
	lsrs r0, r4, #0x10
	adds r1, r7, #0
	adds r1, #0xed
	strb r0, [r1]
	lsrs r0, r4, #8
	adds r1, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xef
	strb r4, [r0]
	bl sub_02001534
	adds r4, r0, #0
	bl sub_02001534
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r4, r0
	ldr r0, [r5, #8]
	adds r4, r4, r0
	lsrs r1, r4, #0x18
	adds r0, r7, #0
	adds r0, #0xf0
	strb r1, [r0]
	lsrs r0, r4, #0x10
	adds r1, r7, #0
	adds r1, #0xf1
	strb r0, [r1]
	lsrs r0, r4, #8
	adds r1, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xf3
	strb r4, [r0]
	bl sub_02001534
	adds r4, r0, #0
	bl sub_02001534
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r4, r0
	ldr r0, [r5, #8]
	adds r4, r4, r0
	lsrs r1, r4, #0x18
	adds r0, r7, #0
	adds r0, #0xf4
	strb r1, [r0]
	lsrs r0, r4, #0x10
	adds r1, r7, #0
	adds r1, #0xf5
	strb r0, [r1]
	lsrs r0, r4, #8
	adds r1, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xf7
	strb r4, [r0]
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #8]
	adds r0, r0, r1
	lsls r4, r0, #0x10
	lsrs r1, r4, #0x18
	adds r0, r7, #0
	adds r0, #0xf8
	strb r1, [r0]
	lsrs r0, r4, #0x10
	adds r1, r7, #0
	adds r1, #0xf9
	strb r0, [r1]
	lsrs r0, r4, #8
	adds r1, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xfb
	strb r4, [r0]
	subs r0, #0x89
	ldrb r1, [r0]
	ldr r2, _02002184 @ =0x00000529
	adds r0, r7, r2
	strb r1, [r0]
	movs r0, #0xff
	ands r0, r1
	subs r2, #1
	adds r1, r7, r2
	strb r0, [r1]
	movs r2, #0x99
	lsls r2, r2, #1
	adds r1, r7, r2
	strb r0, [r1]
	movs r6, #0
	adds r3, r7, #0
	adds r3, #0x80
	movs r4, #0xff
	ldr r0, _02002188 @ =0x000004EC
	adds r2, r7, r0
_02002150:
	adds r1, r6, r3
	ldrb r0, [r1]
	strb r0, [r2, #1]
	ldrb r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, #2
	adds r6, #1
	cmp r6, #4
	ble _02002150
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02002170: .4byte gUnknown_0202071C
_02002174: .4byte gUnknown_03003C58
_02002178: .4byte gUnknown_03003C08
_0200217C: .4byte gUnknown_03003330
_02002180: .4byte gUnknown_03003B80
_02002184: .4byte 0x00000529
_02002188: .4byte 0x000004EC

	thumb_func_start sub_0200218c
sub_0200218c: @ 0x0200218c
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _020021D8 @ =gUnknown_03003330
	ldrb r5, [r1, #0xf]
	movs r0, #0x81
	rsbs r0, r0, #0
	ands r5, r0
	adds r6, r1, #0
	cmp r5, #0
	bne _020021EC
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _020021B0
	subs r0, #1
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020021E4
_020021B0:
	ldr r0, _020021DC @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _020021E4
	bl m4aMPlayAllStop
	movs r0, #0xe       @ SE_MSGBOX
	bl m4aSongNumStart
	strh r5, [r4, #0xe]
	movs r0, #8
	strb r0, [r4, #0x19]
	ldr r0, _020021E0 @ =sub_020021F4
	str r0, [r4]
	ldrb r1, [r6, #0xf]
	movs r0, #0x80
	orrs r0, r1
	b _020021EA
	.align 2, 0
_020021D8: .4byte gUnknown_03003330
_020021DC: .4byte gUnknown_030043F0
_020021E0: .4byte sub_020021F4
_020021E4:
	ldrb r1, [r6, #0xf]
	movs r0, #0x7f
	ands r0, r1
_020021EA:
	strb r0, [r6, #0xf]
_020021EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020021F4
sub_020021F4: @ 0x020021F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x19]
	cmp r0, #0
	beq _0200220C
	subs r0, #1
	strb r0, [r5, #0x19]
	lsls r0, r0, #0x18
	ldr r2, _02002228 @ =gUnknown_030043F0
	cmp r0, #0
	bne _02002278
_0200220C:
	ldr r2, _02002228 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _02002278
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200222C
	movs r4, #0xd
	b _0200224A
	.align 2, 0
_02002228: .4byte gUnknown_030043F0
_0200222C:
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _02002248
	movs r0, #0xc       @ SE_CONFIRM
	bl m4aSongNumStart
	movs r0, #0x2d
	strb r0, [r5, #0x19]
	ldr r0, _02002244 @ =sub_02008940
	str r0, [r5]
	b _02002332
	.align 2, 0
_02002244: .4byte sub_02008940
_02002248:
	movs r4, #0xc       @ SE_CONFIRM
_0200224A:
	bl m4aMPlayAllContinue
	adds r0, r4, #0
	bl m4aSongNumStart
	movs r2, #0
	movs r0, #8
	strb r0, [r5, #0x19]
	ldr r0, _02002270 @ =sub_0200218c
	str r0, [r5]
	ldr r1, _02002274 @ =0x0600E000
	str r2, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	b _02002332
	.align 2, 0
_02002270: .4byte sub_0200218c
_02002274: .4byte 0x0600E000
_02002278:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _020022A2
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0200229A
	movs r0, #1
	strh r0, [r5, #0xe]
	b _020022C0
_0200229A:
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
	b _020022C0
_020022A2:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _020022C0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _020022BA
	strh r2, [r5, #0xe]
	b _020022C0
_020022BA:
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_020022C0:
	ldr r4, _0200233C @ =gUnknown_03003330
	ldrb r1, [r4, #0x10]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	lsls r1, r0, #1
	adds r6, r1, r0
	lsls r0, r6, #5
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r2, r1, r2
	lsls r2, r2, #4
	ldr r3, _02002340 @ =gUnknown_020201BE
	adds r2, r2, r3
	adds r0, r0, r2
	adds r1, #1
	lsls r1, r1, #6
	ldr r2, _02002344 @ =0x0600E014
	adds r1, r1, r2
	ldr r2, _02002348 @ =0x0000416B
	str r2, [sp]
	movs r2, #0xc
	movs r3, #2
	bl sub_020017b0
	ldr r2, _0200234C @ =gUnknown_0202027E
	ldr r0, [r4, #8]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02002302
	adds r2, #8
_02002302:
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #6
	ldr r0, _02002350 @ =0x0600E010
	adds r1, r1, r0
	ldr r0, _02002354 @ =0x000031E5
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #2
	movs r3, #2
	bl sub_020017b0
	lsls r0, r6, #6
	ldr r1, _02002358 @ =gUnknown_0202003E
	adds r0, r0, r1
	ldr r1, _0200235C @ =0x0600E00E
	ldr r2, _02002360 @ =0x0000316B
	str r2, [sp]
	movs r2, #0x10
	movs r3, #6
	bl sub_020017b0
_02002332:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200233C: .4byte gUnknown_03003330
_02002340: .4byte gUnknown_020201BE
_02002344: .4byte 0x0600E014
_02002348: .4byte 0x0000416B
_0200234C: .4byte gUnknown_0202027E
_02002350: .4byte 0x0600E010
_02002354: .4byte 0x000031E5
_02002358: .4byte gUnknown_0202003E
_0200235C: .4byte 0x0600E00E
_02002360: .4byte 0x0000316B

	thumb_func_start sub_02002364
sub_02002364: @ 0x02002364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r1
	str r2, [sp]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r4, #0
	ldr r2, _02002398 @ =gUnknown_020277C0
	ldrb r0, [r2]
	ldr r3, _0200239C @ =gUnknown_03003330
	cmp r0, r1
	beq _02002392
_02002384:
	adds r4, #1
	cmp r4, #4
	bgt _02002396
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, r1
	bne _02002384
_02002392:
	cmp r4, #4
	ble _020023A0
_02002396:
	b _02002396
	.align 2, 0
_02002398: .4byte gUnknown_020277C0
_0200239C: .4byte gUnknown_03003330
_020023A0:
	ldrb r0, [r3, #0x10]
	cmp r0, #1
	bhi _020023BC
	ldr r0, _020023B8 @ =gUnknown_02027798
	ldrb r1, [r3, #0x10]
	lsls r1, r1, #2
	lsls r2, r4, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r2, [r1]
	b _020023CE
	.align 2, 0
_020023B8: .4byte gUnknown_02027798
_020023BC:
	ldr r2, _02002484 @ =gUnknown_0202A2DC
	ldrb r1, [r3, #0x10]
	subs r1, #2
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
_020023CE:
	ldrb r5, [r2]
	adds r2, #1
	ldrb r7, [r2]
	adds r2, #1
	ldr r3, _02002488 @ =0x0203F800
	ldr r1, _0200248C @ =0x000001ED
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	cmp r5, #0
	beq _020023F6
	movs r4, #0xf7
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r4, r5, #0
_020023EC:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _020023EC
_020023F6:
	ldr r1, _02002490 @ =0x000005ED
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	movs r0, #0
	adds r4, r5, #2
	mov ip, r4
	adds r1, r7, #2
	mov sb, r1
	cmp r0, r7
	bge _0200243C
	ldr r4, _02002494 @ =0x000001EF
	mov r8, r4
	ldr r1, _02002498 @ =0x000005EF
	adds r6, r1, #0
_02002414:
	mov r4, r8
	strh r4, [r3]
	adds r3, #2
	adds r1, r0, #1
	cmp r5, #0
	beq _02002432
	movs r4, #0xf8
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r4, r5, #0
_02002428:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _02002428
_02002432:
	strh r6, [r3]
	adds r3, #2
	adds r0, r1, #0
	cmp r0, r7
	blt _02002414
_0200243C:
	ldr r1, _0200249C @ =0x000009ED
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	cmp r5, #0
	beq _02002458
	ldr r4, _020024A0 @ =0x000009EE
	adds r0, r4, #0
	adds r4, r5, #0
_0200244E:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _0200244E
_02002458:
	ldr r1, _020024A4 @ =0x00000DED
	adds r0, r1, #0
	strh r0, [r3]
	mov r3, ip
	lsls r0, r3, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	mov r8, r4
	movs r6, #0
	movs r1, #0
	cmp r1, r7
	bge _020024F0
_02002470:
	adds r1, #1
	adds r0, r1, #0
	muls r0, r5, r0
	lsls r0, r0, #1
	ldr r3, _020024A8 @ =0x0203F802
	adds r4, r0, r3
	ldrb r3, [r2]
	adds r2, #1
	mov ip, r1
	b _020024DC
	.align 2, 0
_02002484: .4byte gUnknown_0202A2DC
_02002488: .4byte 0x0203F800
_0200248C: .4byte 0x000001ED
_02002490: .4byte 0x000005ED
_02002494: .4byte 0x000001EF
_02002498: .4byte 0x000005EF
_0200249C: .4byte 0x000009ED
_020024A0: .4byte 0x000009EE
_020024A4: .4byte 0x00000DED
_020024A8: .4byte 0x0203F802
_020024AC:
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x10
	mov r8, r0
	b _020024D8
_020024B4:
	cmp r3, #0xff
	bne _020024C6
	movs r0, #0
	cmp r6, #0
	bne _020024C2
	movs r0, #0x80
	lsls r0, r0, #1
_020024C2:
	adds r6, r0, #0
	b _020024D8
_020024C6:
	adds r1, r6, r3
	ldr r0, _0200250C @ =0x000002AF
	adds r1, r1, r0
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
_020024D8:
	ldrb r3, [r2]
	adds r2, #1
_020024DC:
	cmp r3, #0x5f
	bne _020024B4
	ldrb r3, [r2]
	adds r2, #1
	lsls r0, r3, #0x18
	cmp r0, #0
	bge _020024AC
	mov r1, ip
	cmp r1, r7
	blt _02002470
_020024F0:
	mov r4, sl
	strb r5, [r4]
	mov r1, sb
	ldr r0, [sp]
	strb r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200250C: .4byte 0x000002AF

	thumb_func_start sub_02002510
sub_02002510: @ 0x02002510
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp]
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r4, #0
	ldr r2, _02002544 @ =gUnknown_020277C0
	ldrb r0, [r2]
	ldr r3, _02002548 @ =gUnknown_03003330
	cmp r0, r1
	beq _0200253E
_02002530:
	adds r4, #1
	cmp r4, #4
	bgt _02002542
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, r1
	bne _02002530
_0200253E:
	cmp r4, #4
	ble _0200254C
_02002542:
	b _02002542
	.align 2, 0
_02002544: .4byte gUnknown_020277C0
_02002548: .4byte gUnknown_03003330
_0200254C:
	ldrb r0, [r3, #0x10]
	cmp r0, #1
	bhi _02002568
	ldr r0, _02002564 @ =gUnknown_02027798
	ldrb r1, [r3, #0x10]
	lsls r1, r1, #2
	lsls r2, r4, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r6, [r1]
	b _0200257A
	.align 2, 0
_02002564: .4byte gUnknown_02027798
_02002568:
	ldr r2, _0200268C @ =gUnknown_0202A2DC
	ldrb r1, [r3, #0x10]
	subs r1, #2
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r6, [r0]
_0200257A:
	ldrb r5, [r6]
	adds r6, #1
	ldrb r0, [r6]
	mov ip, r0
	adds r6, #1
	ldr r3, _02002690 @ =0x0203F800
	ldr r1, _02002694 @ =0x000001F1
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	adds r0, r5, #1
	cmp r0, #0
	beq _020025A6
	movs r2, #0xf9
	lsls r2, r2, #1
	adds r0, r2, #0
	adds r4, r5, #1
_0200259C:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _0200259C
_020025A6:
	ldr r4, _02002698 @ =0x000001F3
	adds r0, r4, #0
	strh r0, [r3]
	adds r3, #2
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	adds r7, r5, #1
	adds r2, r5, #3
	mov sb, r2
	movs r4, #4
	add r4, ip
	mov sl, r4
	cmp r7, #0
	ble _020025D8
	adds r1, #1
	adds r0, r1, #0
	adds r4, r7, #0
_020025CE:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _020025CE
_020025D8:
	movs r2, #0xfb
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r3]
	adds r3, #2
	movs r0, #0
	cmp r0, ip
	bge _02002618
	ldr r4, _0200269C @ =0x000001F7
	mov r8, r4
	adds r2, r7, #0
	adds r5, r1, #0
_020025F0:
	mov r1, r8
	strh r1, [r3]
	adds r3, #2
	adds r1, r0, #1
	cmp r2, #0
	beq _0200260E
	movs r4, #0xfc
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r4, r2, #0
_02002604:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _02002604
_0200260E:
	strh r5, [r3]
	adds r3, #2
	adds r0, r1, #0
	cmp r0, ip
	blt _020025F0
_02002618:
	ldr r1, _020026A0 @ =0x000001F9
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	cmp r7, #0
	beq _02002636
	movs r2, #0xfd
	lsls r2, r2, #1
	adds r0, r2, #0
	adds r4, r7, #0
_0200262C:
	strh r0, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _0200262C
_02002636:
	movs r4, #0xfb
	lsls r4, r4, #1
	adds r0, r4, #0
	strh r0, [r3]
	adds r3, #2
	ldr r1, _020026A4 @ =0x000001FB
	adds r0, r1, #0
	strh r0, [r3]
	adds r3, #2
	adds r0, r7, #0
	cmp r0, #0
	ble _02002660
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r4, r0, #0
_02002656:
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _02002656
_02002660:
	ldr r4, _020026A8 @ =0x000001FD
	adds r0, r4, #0
	strh r0, [r3]
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	adds r2, r6, #0
	movs r7, #0
	movs r6, #0
	movs r3, #0
	cmp r3, ip
	bge _020026EE
_02002678:
	adds r0, r3, #2
	muls r0, r5, r0
	lsls r0, r0, #1
	ldr r1, _020026AC @ =0x0203F802
	adds r4, r0, r1
	ldrb r1, [r2]
	adds r2, #1
	adds r3, #1
	b _020026DC
	.align 2, 0
_0200268C: .4byte gUnknown_0202A2DC
_02002690: .4byte 0x0203F800
_02002694: .4byte 0x000001F1
_02002698: .4byte 0x000001F3
_0200269C: .4byte 0x000001F7
_020026A0: .4byte 0x000001F9
_020026A4: .4byte 0x000001FB
_020026A8: .4byte 0x000001FD
_020026AC: .4byte 0x0203F802
_020026B0:
	lsls r0, r1, #0x1c
	lsrs r7, r0, #0x10
	b _020026D8
_020026B6:
	cmp r1, #0xff
	bne _020026C8
	movs r0, #0
	cmp r6, #0
	bne _020026C4
	movs r0, #0x80
	lsls r0, r0, #1
_020026C4:
	adds r6, r0, #0
	b _020026D8
_020026C8:
	adds r1, r6, r1
	ldr r0, _02002708 @ =0x000002AF
	adds r1, r1, r0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
_020026D8:
	ldrb r1, [r2]
	adds r2, #1
_020026DC:
	cmp r1, #0x5f
	bne _020026B6
	ldrb r1, [r2]
	adds r2, #1
	lsls r0, r1, #0x18
	cmp r0, #0
	bge _020026B0
	cmp r3, ip
	blt _02002678
_020026EE:
	ldr r1, [sp]
	strb r5, [r1]
	mov r4, sl
	ldr r2, [sp, #4]
	strb r4, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02002708: .4byte 0x000002AF

	thumb_func_start sub_0200270c
sub_0200270c: @ 0x0200270c
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r3, #0
	ldr r2, _02002740 @ =gUnknown_02029F70
	ldrb r0, [r2]
	cmp r0, r1
	beq _02002738
_0200272A:
	adds r3, #1
	cmp r3, #0x71
	bgt _0200273C
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, r1
	bne _0200272A
_02002738:
	cmp r3, #0x71
	ble _02002744
_0200273C:
	movs r0, #0
	b _02002916
	.align 2, 0
_02002740: .4byte gUnknown_02029F70
_02002744:
	ldr r1, _0200275C @ =gUnknown_03003330
	ldrb r0, [r1, #0x10]
	cmp r0, #1
	bhi _02002764
	ldr r0, _02002760 @ =gUnknown_02029BE0
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #2
	lsls r2, r3, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r4, [r1]
	b _02002776
	.align 2, 0
_0200275C: .4byte gUnknown_03003330
_02002760: .4byte gUnknown_02029BE0
_02002764:
	ldr r2, _02002830 @ =gUnknown_0202DF70
	ldrb r1, [r1, #0x10]
	subs r1, #2
	lsls r0, r3, #1
	adds r0, r0, r3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
_02002776:
	ldrb r5, [r4]
	adds r4, #1
	ldrb r0, [r4]
	mov r8, r0
	adds r4, #1
	ldr r1, _02002834 @ =0x0203F800
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	cmp r5, #0
	beq _020027A0
	ldr r3, _02002838 @ =0x00000161
	adds r0, r3, #0
	adds r3, r5, #0
_02002796:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _02002796
_020027A0:
	ldr r2, _0200283C @ =0x00000163
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0
	lsrs r3, r5, #1
	mov sb, r3
	adds r2, r5, #2
	mov sl, r2
	mov r3, r8
	adds r3, #2
	str r3, [sp, #8]
	cmp r0, r8
	bge _020027EC
	movs r2, #0xb2
	lsls r2, r2, #1
	adds r7, r2, #0
	movs r3, #0xb3
	lsls r3, r3, #1
	adds r6, r3, #0
_020027C8:
	strh r7, [r1]
	adds r1, #2
	adds r2, r0, #1
	cmp r5, #0
	beq _020027E2
	ldr r3, _02002840 @ =0x00000165
	adds r0, r3, #0
	adds r3, r5, #0
_020027D8:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _020027D8
_020027E2:
	strh r6, [r1]
	adds r1, #2
	adds r0, r2, #0
	cmp r0, r8
	blt _020027C8
_020027EC:
	ldr r2, _02002844 @ =0x00000167
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	cmp r5, #0
	beq _0200280A
	movs r3, #0xb4
	lsls r3, r3, #1
	adds r0, r3, #0
	adds r3, r5, #0
_02002800:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _02002800
_0200280A:
	movs r2, #0xb5
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _02002848 @ =gUnknown_03001510
	ldr r0, [r0]
	movs r3, #0xa
	ldrsh r0, [r0, r3]
	subs r0, #0x58
	movs r1, #8
	bl Div
	mov r1, sb
	adds r3, r1, r0
	cmp r3, #0
	bge _0200284C
	movs r3, #0
	b _02002852
	.align 2, 0
_02002830: .4byte gUnknown_0202DF70
_02002834: .4byte 0x0203F800
_02002838: .4byte 0x00000161
_0200283C: .4byte 0x00000163
_02002840: .4byte 0x00000165
_02002844: .4byte 0x00000167
_02002848: .4byte gUnknown_03001510
_0200284C:
	cmp r3, r5
	blt _02002852
	subs r3, r5, #1
_02002852:
	adds r3, #1
	ldr r0, _02002878 @ =gUnknown_03001510
	ldr r0, [r0]
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	cmp r0, #0x5f
	ble _02002884
	mov r0, r8
	adds r0, #1
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r3
	lsls r0, r0, #1
	ldr r2, _0200287C @ =0x0203F800
	adds r0, r0, r2
	ldr r3, _02002880 @ =0x00000169
	adds r1, r3, #0
	b _02002890
	.align 2, 0
_02002878: .4byte gUnknown_03001510
_0200287C: .4byte 0x0203F800
_02002880: .4byte 0x00000169
_02002884:
	lsls r0, r3, #1
	ldr r1, _020028BC @ =0x0203F800
	adds r0, r0, r1
	movs r2, #0xb1
	lsls r2, r2, #1
	adds r1, r2, #0
_02002890:
	strh r1, [r0]
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r5, r0, #0x18
	adds r2, r4, #0
	movs r0, #0
	mov ip, r0
	movs r6, #0
	movs r1, #0
	cmp r1, r8
	bge _02002908
_020028A6:
	adds r1, #1
	adds r0, r1, #0
	muls r0, r5, r0
	lsls r0, r0, #1
	ldr r3, _020028C0 @ =0x0203F802
	adds r4, r0, r3
	ldrb r3, [r2]
	adds r2, #1
	adds r7, r1, #0
	b _020028F4
	.align 2, 0
_020028BC: .4byte 0x0203F800
_020028C0: .4byte 0x0203F802
_020028C4:
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x10
	mov ip, r0
	b _020028F0
_020028CC:
	cmp r3, #0xff
	bne _020028DE
	movs r0, #0
	cmp r6, #0
	bne _020028DA
	movs r0, #0x80
	lsls r0, r0, #1
_020028DA:
	adds r6, r0, #0
	b _020028F0
_020028DE:
	adds r1, r6, r3
	ldr r0, _02002928 @ =0x000002AF
	adds r1, r1, r0
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
_020028F0:
	ldrb r3, [r2]
	adds r2, #1
_020028F4:
	cmp r3, #0x5f
	bne _020028CC
	ldrb r3, [r2]
	adds r2, #1
	lsls r0, r3, #0x18
	cmp r0, #0
	bge _020028C4
	adds r1, r7, #0
	cmp r1, r8
	blt _020028A6
_02002908:
	ldr r0, [sp]
	strb r5, [r0]
	mov r1, sp
	ldrb r2, [r1, #8]
	ldr r1, [sp, #4]
	strb r2, [r1]
	movs r0, #1
_02002916:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02002928: .4byte 0x000002AF

	thumb_func_start sub_0200292c
sub_0200292c: @ 0x0200292c
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #0x1a]
	subs r0, #1
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0200296A
	movs r0, #6
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x19]
	adds r0, #1
	strb r0, [r4, #0x19]
	ands r0, r2
	cmp r0, #5
	bls _02002954
	strb r1, [r4, #0x19]
_02002954:
	ldrb r0, [r4, #0x19]
	lsls r0, r0, #3
	ldr r1, _020029BC @ =gUnknown_0202000E
	adds r0, r0, r1
	ldr r1, _020029C0 @ =0x0600F482
	ldr r2, _020029C4 @ =0x0000712A
	str r2, [sp]
	movs r2, #2
	movs r3, #2
	bl sub_020017b0
_0200296A:
	ldr r0, _020029C8 @ =gUnknown_03005274
	ldr r3, [r0]
	ldr r0, [r4, #0x20]
	subs r5, r3, r0
	cmp r5, #0
	beq _02002A56
	ldr r2, _020029CC @ =gUnknown_03003B80
	lsls r1, r3, #0x18
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r3
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r3
	lsrs r0, r0, #8
	orrs r1, r0
	lsrs r0, r3, #0x18
	orrs r1, r0
	str r1, [r2, #0x64]
	cmp r5, #0
	ble _020029D4
	ldr r0, _020029D0 @ =gUnknown_02020EE8
	adds r3, r0, #2
	adds r2, r0, #0
	movs r6, #4
_020029A0:
	ldrh r0, [r2]
	cmp r5, r0
	blt _020029B0
	ldrh r1, [r3]
	subs r5, r5, r1
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	str r0, [r4, #0x20]
_020029B0:
	adds r3, #4
	adds r2, #4
	subs r6, #1
	cmp r6, #0
	bge _020029A0
	b _020029F8
	.align 2, 0
_020029BC: .4byte gUnknown_0202000E
_020029C0: .4byte 0x0600F482
_020029C4: .4byte 0x0000712A
_020029C8: .4byte gUnknown_03005274
_020029CC: .4byte gUnknown_03003B80
_020029D0: .4byte gUnknown_02020EE8
_020029D4:
	rsbs r5, r5, #0
	ldr r0, _02002A20 @ =gUnknown_02020EE8
	adds r3, r0, #2
	adds r2, r0, #0
	movs r6, #4
_020029DE:
	ldrh r1, [r2]
	cmp r5, r1
	blt _020029EE
	ldrh r1, [r3]
	subs r5, r5, r1
	ldr r0, [r4, #0x20]
	subs r0, r0, r1
	str r0, [r4, #0x20]
_020029EE:
	adds r3, #4
	adds r2, #4
	subs r6, #1
	cmp r6, #0
	bge _020029DE
_020029F8:
	ldr r0, [r4, #0x20]
	add r1, sp, #4
	movs r2, #5
	movs r3, #1
	bl sub_020015cc
	ldr r2, _02002A24 @ =gUnknown_03001590
	add r1, sp, #4
	ldr r3, _02002A28 @ =0x00002141
	adds r7, r3, #0
	movs r6, #0xe1
	movs r5, #4
_02002A10:
	ldrb r0, [r1]
	cmp r0, #0
	beq _02002A2C
	ldrb r3, [r1]
	adds r0, r7, r3
	strh r0, [r2]
	b _02002A2E
	.align 2, 0
_02002A20: .4byte gUnknown_02020EE8
_02002A24: .4byte gUnknown_03001590
_02002A28: .4byte 0x00002141
_02002A2C:
	strh r6, [r2]
_02002A2E:
	ldr r3, _02002B2C @ =gUnknown_03001590
	adds r2, #2
	adds r1, #1
	subs r5, #1
	cmp r5, #0
	bge _02002A10
	adds r1, r3, #0
	ldrh r0, [r1]
	cmp r0, #0xe1
	bne _02002A46
	adds r0, #0x20
	strh r0, [r1]
_02002A46:
	ldr r1, _02002B30 @ =0x0600F4C6
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r2, #5
	movs r3, #1
	bl sub_020017b0
_02002A56:
	ldr r0, _02002B34 @ =gUnknown_0300152F
	ldrb r0, [r0]
	adds r1, r0, #0
	ldrb r2, [r4, #7]
	cmp r1, r2
	beq _02002A64
	b _02002C34
_02002A64:
	cmp r1, #0xff
	bne _02002A6A
	b _02002D86
_02002A6A:
	ldr r0, _02002B38 @ =gUnknown_03003330
	ldrb r2, [r0, #0xf]
	movs r0, #0x95
	ands r0, r2
	cmp r0, #0
	bne _02002AF2
	ldr r0, _02002B3C @ =gUnknown_0300150C
	ldr r0, [r0]
	movs r3, #0xa
	ldrsh r1, [r0, r3]
	cmp r1, #0xb5
	ble _02002AF2
	movs r5, #0
	cmp r1, #0xba
	ble _02002AA4
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #7
	bgt _02002AA4
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _02002AA4
	ldr r0, _02002B40 @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	bne _02002AA4
	movs r5, #0xa0
	lsls r5, r5, #8
_02002AA4:
	ldr r0, _02002B44 @ =gUnknown_03001538
	ldr r1, _02002B48 @ =0x0600F042
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #7
	movs r3, #1
	bl sub_020017b0
	cmp r5, #0
	beq _02002AF2
	ldr r2, _02002B4C @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02002AF2
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02002AF2
	ldr r4, _02002B38 @ =gUnknown_03003330
	ldrb r1, [r4, #0xf]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02002AF2
	movs r0, #0xc       @ SE_CONFIRM
	bl m4aSongNumStart
	ldr r0, _02002B50 @ =sub_02008e0c
	str r0, [r4, #4]
	ldr r0, _02002B54 @ =sub_02008848
	str r0, [r4]
	ldrb r1, [r4, #0xf]
	movs r0, #3
	orrs r0, r1
	strb r0, [r4, #0xf]
_02002AF2:
	ldr r0, _02002B38 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0xd3
	ands r0, r1
	cmp r0, #0
	beq _02002B00
	b _02002D86
_02002B00:
	ldr r1, _02002B58 @ =gUnknown_03001500
	ldrb r0, [r1]
	cmp r0, #0
	beq _02002B0C
	subs r0, #1
	strb r0, [r1]
_02002B0C:
	movs r5, #0
_02002B0E:
	ldr r0, _02002B5C @ =gUnknown_03003BF3
	adds r0, r5, r0
	ldr r2, _02002B60 @ =gUnknown_03001558
	lsls r1, r5, #3
	adds r1, r1, r2
	ldrb r2, [r1, #3]
	ldrb r3, [r0]
	adds r0, r2, #0
	cmp r3, r0
	beq _02002B84
	cmp r3, r0
	bls _02002B64
	adds r0, r2, #1
	b _02002B66
	.align 2, 0
_02002B2C: .4byte gUnknown_03001590
_02002B30: .4byte 0x0600F4C6
_02002B34: .4byte gUnknown_0300152F
_02002B38: .4byte gUnknown_03003330
_02002B3C: .4byte gUnknown_0300150C
_02002B40: .4byte gUnknown_03001509
_02002B44: .4byte gUnknown_03001538
_02002B48: .4byte 0x0600F042
_02002B4C: .4byte gUnknown_030043F0
_02002B50: .4byte sub_02008e0c
_02002B54: .4byte sub_02008848
_02002B58: .4byte gUnknown_03001500
_02002B5C: .4byte gUnknown_03003BF3
_02002B60: .4byte gUnknown_03001558
_02002B64:
	subs r0, r2, #1
_02002B66:
	strb r0, [r1, #3]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_02002d94
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02002B84
	ldr r0, _02002BD8 @ =gUnknown_03001500
	ldrb r0, [r0]
	cmp r0, #0
	bne _02002B84
	movs r0, #0x16      @ SE_GAUGE_EXPANDS
	bl m4aSongNumStart
_02002B84:
	adds r5, #1
	cmp r5, #1
	ble _02002B0E
	cmp r5, #6
	ble _02002B90
	b _02002D86
_02002B90:
	movs r7, #1
	lsls r6, r5, #3
_02002B94:
	ldr r0, _02002BDC @ =gUnknown_03003330
	ldr r0, [r0, #8]
	ands r0, r7
	cmp r0, #0
	beq _02002C08
	ldr r3, _02002BE0 @ =gUnknown_03003C06
	adds r0, r5, r3
	ldr r1, _02002BE4 @ =gUnknown_03001558
	adds r4, r6, r1
	ldrh r2, [r4]
	ldrb r0, [r0]
	cmp r0, r2
	bls _02002BE8
	ldrb r0, [r4, #3]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bls _02002BD4
	strb r1, [r4, #3]
	adds r0, r2, #1
	strh r0, [r4]
	movs r0, #0x78
	strb r0, [r4, #2]
	movs r0, #0x23      @ SE_GAUGE_LVL_UP
	bl m4aSongNumStart
	ldr r1, _02002BD8 @ =gUnknown_03001500
	movs r0, #0x48
	strb r0, [r1]
_02002BD4:
	strb r7, [r4, #4]
	b _02002C08
	.align 2, 0
_02002BD8: .4byte gUnknown_03001500
_02002BDC: .4byte gUnknown_03003330
_02002BE0: .4byte gUnknown_03003C06
_02002BE4: .4byte gUnknown_03001558
_02002BE8:
	adds r0, r3, #0
	subs r0, #0x10
	adds r0, r5, r0
	ldrb r3, [r4, #3]
	ldrb r0, [r0]
	adds r2, r3, #0
	cmp r0, r2
	beq _02002C08
	cmp r0, r2
	bls _02002C00
	adds r0, r3, #1
	b _02002C02
_02002C00:
	subs r0, r3, #1
_02002C02:
	strb r0, [r4, #3]
	adds r0, r6, r1
	strb r7, [r0, #4]
_02002C08:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_02002d94
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02002C24
	ldr r0, _02002C30 @ =gUnknown_03001500
	ldrb r0, [r0]
	cmp r0, #0
	bne _02002C24
	movs r0, #0x16
	bl m4aSongNumStart
_02002C24:
	adds r6, #8
	adds r5, #1
	cmp r5, #6
	ble _02002B94
	b _02002D86
	.align 2, 0
_02002C30: .4byte gUnknown_03001500
_02002C34:
	strb r0, [r4, #7]
	cmp r1, #0xff
	bne _02002C78
	ldr r1, _02002C70 @ =0x0600F042
	movs r0, #0xe1
	str r0, [sp]
	movs r0, #0
	movs r2, #7
	movs r3, #2
	bl sub_020017b0
	movs r5, #0
	movs r7, #0
	ldr r4, _02002C74 @ =gUnknown_03001558
	movs r6, #1
_02002C52:
	strb r7, [r4, #3]
	strh r7, [r4]
	strb r6, [r4, #4]
	strb r6, [r4, #2]
	movs r0, #0xff
	strb r0, [r4, #5]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_02002d94
	adds r4, #8
	adds r5, #1
	cmp r5, #6
	ble _02002C52
	b _02002D86
	.align 2, 0
_02002C70: .4byte 0x0600F042
_02002C74: .4byte gUnknown_03001558
_02002C78:
	movs r5, #0
	ldr r4, _02002D28 @ =gUnknown_03001538
	ldr r3, _02002D2C @ =gUnknown_03003BEA
	ldr r0, _02002D30 @ =0x000002AF
	adds r2, r0, #0
	adds r1, r4, #0
_02002C84:
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	adds r5, #1
	cmp r5, #6
	ble _02002C84
	ldr r1, _02002D34 @ =0x0600F042
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #7
	movs r3, #1
	bl sub_020017b0
	ldr r0, _02002D38 @ =gUnknown_03003B80
	adds r0, #0x71
	ldrb r5, [r0]
	cmp r5, #0x12
	ble _02002CB0
	movs r5, #0x13
_02002CB0:
	cmp r5, #0
	beq _02002CB6
	adds r5, #2
_02002CB6:
	ldr r0, _02002D3C @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	adds r0, r5, #0
	movs r1, #3
	bl Div
	adds r6, r0, #0
	ldr r3, _02002D40 @ =gUnknown_02020342
	lsls r2, r6, #3
	subs r2, r2, r6
	lsls r0, r4, #3
	subs r0, r0, r4
	ldr r6, _02002D44 @ =gUnknown_03001548
	adds r4, r6, #0
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r2, r2, r3
	ldr r0, _02002D48 @ =0x00001E68
	adds r3, r0, #0
	movs r5, #6
_02002CE4:
	ldrb r0, [r2]
	strh r0, [r4]
	cmp r0, #0
	bne _02002CF4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r3
	strh r0, [r4]
_02002CF4:
	adds r4, #2
	adds r2, #1
	subs r5, #1
	cmp r5, #0
	bge _02002CE4
	ldr r1, _02002D4C @ =0x0600F082
	ldr r0, _02002D30 @ =0x000002AF
	str r0, [sp]
	adds r0, r6, #0
	movs r2, #7
	movs r3, #1
	bl sub_020017b0
	movs r5, #0
	ldr r0, _02002D50 @ =gUnknown_03003C06
	movs r7, #0
	adds r6, r0, #0
	subs r6, #0x10
	ldr r4, _02002D54 @ =gUnknown_03001558
_02002D1A:
	cmp r5, #1
	bgt _02002D5C
	ldr r0, _02002D58 @ =gUnknown_03003BF3
	adds r0, r5, r0
	ldrb r0, [r0]
	b _02002D62
	.align 2, 0
_02002D28: .4byte gUnknown_03001538
_02002D2C: .4byte gUnknown_03003BEA
_02002D30: .4byte 0x000002AF
_02002D34: .4byte 0x0600F042
_02002D38: .4byte gUnknown_03003B80
_02002D3C: .4byte gUnknown_03003330
_02002D40: .4byte gUnknown_02020342
_02002D44: .4byte gUnknown_03001548
_02002D48: .4byte 0x00001E68
_02002D4C: .4byte 0x0600F082
_02002D50: .4byte gUnknown_03003C06
_02002D54: .4byte gUnknown_03001558
_02002D58: .4byte gUnknown_03003BF3
_02002D5C:
	ldrb r0, [r6, #0x10]
	strh r0, [r4]
	ldrb r0, [r6]
_02002D62:
	strb r0, [r4, #3]
	ldr r1, _02002D90 @ =gUnknown_03001558
	adds r1, r7, r1
	movs r0, #1
	strb r0, [r1, #4]
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #5]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_02002d94
	adds r7, #8
	adds r6, #1
	adds r4, #8
	adds r5, #1
	cmp r5, #6
	ble _02002D1A
_02002D86:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02002D90: .4byte gUnknown_03001558

	thumb_func_start sub_02002d94
sub_02002d94: @ 0x02002d94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov r8, r0
	cmp r6, #1
	bhi _02002DFC
	ldr r1, _02002DEC @ =gUnknown_03001558
	lsls r0, r6, #3
	adds r5, r0, r1
	ldrb r0, [r5, #3]
	adds r0, #0xa
	movs r1, #0x14
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r2, [r5, #5]
	cmp r4, r2
	beq _02002EA4
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _02002DF0 @ =gUnknown_0201FF74
	adds r0, r0, r1
	lsls r1, r6, #7
	ldr r2, _02002DF4 @ =0x0600F142
	adds r1, r1, r2
	ldr r2, _02002DF8 @ =0x0000211A
	str r2, [sp]
	movs r2, #7
	movs r3, #1
	bl sub_020017b0
	ldrb r0, [r5, #5]
	cmp r4, r0
	bls _02002DE8
	movs r2, #1
	mov r8, r2
_02002DE8:
	strb r4, [r5, #5]
	b _02002EA4
	.align 2, 0
_02002DEC: .4byte gUnknown_03001558
_02002DF0: .4byte gUnknown_0201FF74
_02002DF4: .4byte 0x0600F142
_02002DF8: .4byte 0x0000211A
_02002DFC:
	ldr r0, _02002E7C @ =gUnknown_03001558
	lsls r1, r6, #3
	adds r5, r1, r0
	ldrb r0, [r5, #4]
	adds r7, r1, #0
	cmp r0, #0
	beq _02002E4A
	mov r0, r8
	strb r0, [r5, #4]
	ldrb r0, [r5, #3]
	adds r0, #9
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r2, [r5, #5]
	cmp r4, r2
	beq _02002E4A
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _02002E80 @ =gUnknown_0201FF74
	adds r0, r0, r1
	lsls r1, r6, #7
	ldr r2, _02002E84 @ =0x0600F142
	adds r1, r1, r2
	ldr r2, _02002E88 @ =0x0000111A
	str r2, [sp]
	movs r2, #7
	movs r3, #1
	bl sub_020017b0
	ldrb r0, [r5, #5]
	cmp r4, r0
	bls _02002E48
	movs r2, #1
	mov r8, r2
_02002E48:
	strb r4, [r5, #5]
_02002E4A:
	ldr r0, _02002E7C @ =gUnknown_03001558
	adds r2, r7, r0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _02002EA4
	subs r0, #1
	strb r0, [r2, #2]
	movs r1, #0xff
	ands r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _02002E90
	lsls r1, r6, #7
	ldr r0, _02002E8C @ =0x0600F10E
	adds r1, r1, r0
	movs r0, #0xe1
	str r0, [sp]
	movs r0, #0
	movs r2, #1
	movs r3, #1
	bl sub_020017b0
	b _02002EA4
	.align 2, 0
_02002E7C: .4byte gUnknown_03001558
_02002E80: .4byte gUnknown_0201FF74
_02002E84: .4byte 0x0600F142
_02002E88: .4byte 0x0000111A
_02002E8C: .4byte 0x0600F10E
_02002E90:
	lsls r1, r6, #7
	ldr r0, _02002EB4 @ =0x0600F10E
	adds r1, r1, r0
	movs r0, #0x7c
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #1
	movs r3, #1
	bl sub_020017b0
_02002EA4:
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02002EB4: .4byte 0x0600F10E

	thumb_func_start sub_02002eb8
sub_02002eb8: @ 0x02002eb8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _02002EDC @ =gUnknown_03003330
	mov ip, r0
	ldrb r2, [r0, #0xf]
	movs r5, #0x93
	ands r5, r2
	cmp r5, #0
	beq _02002EE0
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	b _02003356
	.align 2, 0
_02002EDC: .4byte gUnknown_03003330
_02002EE0:
	ldr r3, _02002F4C @ =0x04000208
	mov sl, r3
	movs r6, #0
	strh r5, [r3]
	ldr r0, _02002F50 @ =gUnknown_030043DC
	ldrb r0, [r0]
	ldr r0, _02002F54 @ =gUnknown_030043EC
	ldrb r0, [r0]
	adds r4, r0, #0
	ldr r0, _02002F58 @ =gUnknown_030043E8
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _02002F5C @ =gUnknown_030043D8
	ldrb r0, [r1]
	str r0, [sp, #8]
	ldr r3, _02002F60 @ =gUnknown_030043E4
	mov r8, r3
	ldrb r0, [r3]
	movs r3, #1
	mov r1, sl
	strh r3, [r1]
	cmp r4, #0
	bne _02002F10
	b _02003234
_02002F10:
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _02002F6C
	ldr r0, _02002F64 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _02002F26
	b _02003352
_02002F26:
	strb r6, [r7, #0x19]
	movs r0, #0xf
	strh r0, [r7, #0xe]
	ldr r1, _02002F68 @ =0x0600E800
	str r5, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	mov r2, sl
	strh r5, [r2]
	mov r3, r8
	strb r6, [r3]
	ldrb r0, [r3]
	ldr r1, _02002F5C @ =gUnknown_030043D8
	strb r0, [r1]
	strh r4, [r2]
	b _02003352
	.align 2, 0
_02002F4C: .4byte 0x04000208
_02002F50: .4byte gUnknown_030043DC
_02002F54: .4byte gUnknown_030043EC
_02002F58: .4byte gUnknown_030043E8
_02002F5C: .4byte gUnknown_030043D8
_02002F60: .4byte gUnknown_030043E4
_02002F64: .4byte gUnknown_030043F0
_02002F68: .4byte 0x0600E800
_02002F6C:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _02002F76
	b _0200312C
_02002F76:
	mov r2, sb
	cmp r2, #0
	beq _02003030
	movs r4, #0x1f
	ldrsb r4, [r7, r4]
	mov sl, r4
	cmp r4, #0
	beq _02002F88
	b _02003096
_02002F88:
	strb r6, [r7, #0x1e]
	strb r3, [r7, #0x1f]
	movs r0, #5
	add r0, sp
	mov sb, r0
	movs r0, #0x38
	add r1, sp, #4
	mov r2, sb
	bl sub_02002510
	ldr r0, _02003014 @ =0x0203F800
	mov r1, sb
	ldrb r3, [r1]
	adds r1, r3, #6
	movs r2, #0xfe
	mov r8, r2
	ands r1, r2
	movs r6, #0x14
	subs r1, r6, r1
	lsls r1, r1, #5
	add r2, sp, #4
	ldrb r2, [r2]
	subs r5, r2, #1
	mov r4, r8
	ands r5, r4
	movs r4, #0x1e
	subs r4, r4, r5
	ldr r5, _02003018 @ =0x0600E800
	adds r4, r4, r5
	adds r1, r1, r4
	movs r4, #0xd0
	lsls r4, r4, #8
	str r4, [sp]
	bl sub_020017b0
	ldr r0, _0200301C @ =gUnknown_0202028E
	mov r1, sb
	ldrb r2, [r1]
	adds r1, r2, #6
	mov r3, r8
	ands r1, r3
	subs r6, r6, r1
	asrs r6, r6, #1
	adds r6, r6, r2
	lsls r6, r6, #6
	ldr r4, _02003020 @ =0x0600E81E
	adds r6, r6, r4
	ldr r1, _02003024 @ =0x0000D1F1
	str r1, [sp]
	adds r1, r6, #0
	movs r2, #4
	movs r3, #5
	bl sub_020017b0
	mov r0, sl
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	ldr r0, _02003028 @ =gUnknown_0300152A
	ldrh r0, [r0]
	ldr r1, _0200302C @ =0x0000E2FF
	ands r1, r0
	movs r0, #0
	bl sub_02001698
	b _02003096
	.align 2, 0
_02003014: .4byte 0x0203F800
_02003018: .4byte 0x0600E800
_0200301C: .4byte gUnknown_0202028E
_02003020: .4byte 0x0600E81E
_02003024: .4byte 0x0000D1F1
_02003028: .4byte gUnknown_0300152A
_0200302C: .4byte 0x0000E2FF
_02003030:
	movs r1, #0x1e
	ldrsb r1, [r7, r1]
	mov r8, r1
	cmp r1, #0
	bne _02003096
	strb r3, [r7, #0x1e]
	strb r6, [r7, #0x1f]
	mov r4, sp
	adds r4, #5
	movs r0, #0x35
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_02002364
	ldr r0, _02003190 @ =0x0203F800
	ldrb r1, [r4]
	movs r3, #0xfe
	adds r2, r3, #0
	ands r2, r1
	movs r1, #0x14
	subs r1, r1, r2
	lsls r1, r1, #5
	add r2, sp, #4
	ldrb r2, [r2]
	ands r3, r2
	movs r2, #0x1e
	subs r2, r2, r3
	ldr r5, _02003194 @ =0x0600E800
	adds r2, r2, r5
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xa0
	lsls r4, r4, #7
	str r4, [sp]
	bl sub_020017b0
	mov r2, r8
	str r2, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	ldr r0, _02003198 @ =gUnknown_0300152A
	ldrh r1, [r0]
	movs r0, #0
	bl sub_02001698
_02003096:
	ldr r3, _0200319C @ =0x04000208
	mov sb, r3
	movs r5, #0
	strh r5, [r3]
	ldr r1, _020031A0 @ =gUnknown_030043E4
	ldrb r0, [r1]
	cmp r0, #2
	bne _020030A8
	strb r5, [r1]
_020030A8:
	ldr r4, _020031A4 @ =gUnknown_030043D8
	mov r8, r4
	ldrb r0, [r4]
	cmp r0, #2
	bne _02003126
	add r1, sp, #4
	ldr r4, _020031A8 @ =gUnknown_03003B80
	adds r6, r4, #0
	adds r6, #0x58
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r0, _020031AC @ =gUnknown_03003350
	ldr r1, _020031B0 @ =gUnknown_030043E0
	ldr r2, [r1]
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r1, r6, #0
	bl CpuSet
	mov r0, r8
	strb r5, [r0]
	movs r0, #1
	mov r1, sb
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x68
	strb r5, [r0]
	ldr r3, _020031B4 @ =gUnknown_03005274
	ldr r2, [r4, #0x64]
	lsls r1, r2, #0x18
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r2
	lsrs r0, r0, #8
	orrs r1, r0
	lsrs r2, r2, #0x18
	orrs r1, r2
	str r1, [r3]
	add r0, sp, #4
	ldrb r0, [r0]
	cmp r0, #0
	beq _02003122
	ldrb r0, [r6]
	cmp r0, #0
	bne _02003122
	ldr r1, _020031B8 @ =gUnknown_0300152D
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x58
	strb r0, [r4, #0x1d]
	movs r0, #0x68
	strb r0, [r4, #0x1e]
	adds r1, r4, #0
	adds r1, #0xd0
	ldr r0, _020031BC @ =0x00034BC0
	str r0, [r1]
_02003122:
	bl sub_020003ac
_02003126:
	ldr r1, _0200319C @ =0x04000208
	movs r0, #1
	strh r0, [r1]
_0200312C:
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	cmp r1, #0xf
	ble _02003136
	b _02003352
_02003136:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _02003168
	movs r4, #0
	ldr r5, _020031C0 @ =0x0000014B
_02003142:
	ldr r0, _020031C4 @ =sub_0200338c
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	ldr r1, _020031C8 @ =gUnknown_020206F4
	str r1, [r0, #0x10]
	strh r5, [r0, #0x14]
	movs r1, #0x2a
	muls r1, r4, r1
	strb r1, [r0, #0x1a]
	ldrb r1, [r7, #4]
	strb r1, [r0, #0x1b]
	adds r4, #1
	cmp r4, #5
	ble _02003142
	movs r0, #0x22
	bl m4aSongNumStart
_02003168:
	ldr r3, _020031CC @ =gUnknown_03003330
	ldrb r1, [r3, #0xf]
	movs r0, #0x20
	movs r4, #0
	orrs r1, r0
	strb r1, [r3, #0xf]
	ldrh r2, [r7, #0xe]
	adds r0, r2, #1
	strh r0, [r7, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bgt _02003184
	b _02003352
_02003184:
	ldr r0, _020031D0 @ =gUnknown_0300152C
	ldrb r0, [r0]
	cmp r0, #0
	beq _020031D4
	strh r2, [r7, #0xe]
	b _02003352
	.align 2, 0
_02003190: .4byte 0x0203F800
_02003194: .4byte 0x0600E800
_02003198: .4byte gUnknown_0300152A
_0200319C: .4byte 0x04000208
_020031A0: .4byte gUnknown_030043E4
_020031A4: .4byte gUnknown_030043D8
_020031A8: .4byte gUnknown_03003B80
_020031AC: .4byte gUnknown_03003350
_020031B0: .4byte gUnknown_030043E0
_020031B4: .4byte gUnknown_03005274
_020031B8: .4byte gUnknown_0300152D
_020031BC: .4byte 0x00034BC0
_020031C0: .4byte 0x0000014B
_020031C4: .4byte sub_0200338c
_020031C8: .4byte gUnknown_020206F4
_020031CC: .4byte gUnknown_03003330
_020031D0: .4byte gUnknown_0300152C
_020031D4:
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r3, #0xf]
	movs r0, #1
	strb r0, [r7, #0x1e]
	mov r4, sp
	adds r4, #5
	movs r0, #0x35
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_02002364
	ldr r0, _0200322C @ =0x0203F800
	ldrb r1, [r4]
	movs r3, #0xfe
	adds r2, r3, #0
	ands r2, r1
	movs r1, #0x14
	subs r1, r1, r2
	lsls r1, r1, #5
	add r2, sp, #4
	ldrb r2, [r2]
	ands r3, r2
	ldr r2, _02003230 @ =0x0600E81E
	subs r2, r2, r3
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xa0
	lsls r4, r4, #7
	str r4, [sp]
	bl sub_020017b0
	bl m4aMPlayAllStop
	movs r0, #0xe
	bl m4aSongNumStart
	movs r0, #5
	bl sub_02000af0
	b _02003352
	.align 2, 0
_0200322C: .4byte 0x0203F800
_02003230: .4byte 0x0600E81E
_02003234:
	ldr r1, [sp, #8]
	cmp r1, #1
	beq _0200323E
	cmp r0, #1
	bne _020032E4
_0200323E:
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _02003290
	strb r3, [r7, #0x19]
	mov r4, sp
	adds r4, #5
	movs r0, #0x37
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_02002364
	ldr r0, _02003288 @ =0x0203F800
	ldrb r1, [r4]
	movs r3, #0xfe
	adds r2, r3, #0
	ands r2, r1
	movs r1, #0x14
	subs r1, r1, r2
	lsls r1, r1, #5
	add r2, sp, #4
	ldrb r2, [r2]
	ands r3, r2
	ldr r2, _0200328C @ =0x0600E81E
	subs r2, r2, r3
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xa0
	lsls r4, r4, #7
	str r4, [sp]
	bl sub_020017b0
	movs r0, #0xe
	bl m4aSongNumStart
	b _020032CE
	.align 2, 0
_02003288: .4byte 0x0203F800
_0200328C: .4byte 0x0600E81E
_02003290:
	ldr r0, _020032D8 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _020032CE
	strb r6, [r7, #0x1e]
	strb r6, [r7, #0x19]
	movs r0, #0xbf
	ands r0, r2
	mov r2, ip
	strb r0, [r2, #0xf]
	ldr r1, _020032DC @ =0x0600E800
	str r4, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	movs r0, #1
	bl m4aSongNumStartOrContinue
	mov r3, sl
	strh r4, [r3]
	mov r4, r8
	strb r6, [r4]
	ldrb r0, [r4]
	ldr r1, _020032E0 @ =gUnknown_030043D8
	strb r0, [r1]
	strh r5, [r3]
_020032CE:
	ldrb r0, [r7, #4]
	movs r1, #0xa0
	bl sub_02001398
	b _02003366
	.align 2, 0
_020032D8: .4byte gUnknown_030043F0
_020032DC: .4byte 0x0600E800
_020032E0: .4byte gUnknown_030043D8
_020032E4:
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _02003322
	movs r0, #0x1e
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _020032F6
	strb r6, [r7, #0x1e]
	b _02003302
_020032F6:
	strb r6, [r7, #0x1f]
	ldr r0, _0200337C @ =gUnknown_0300152A
	ldrh r1, [r0]
	movs r0, #0
	bl sub_02001698
_02003302:
	ldr r3, _02003380 @ =gUnknown_03003330
	ldrb r1, [r3, #0xf]
	movs r0, #0xbf
	ands r0, r1
	movs r2, #0
	strb r0, [r3, #0xf]
	ldr r1, _02003384 @ =0x0600E800
	str r2, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	movs r0, #1         @ MUS_GARDEN
	bl m4aSongNumStartOrContinue
_02003322:
	ldrh r1, [r7, #0xe]
	movs r2, #0xe
	ldrsh r0, [r7, r2]
	movs r2, #0x30
	rsbs r2, r2, #0
	cmp r0, r2
	ble _02003366
	cmp r0, #0xf
	ble _0200333C
	ldr r0, _02003388 @ =gUnknown_0300152C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02003352
_0200333C:
	subs r0, r1, #1
	strh r0, [r7, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bgt _0200335E
	ldr r2, _02003380 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r2, #0xf]
_02003352:
	movs r3, #0xe
	ldrsh r1, [r7, r3]
_02003356:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	ble _02003366
_0200335E:
	ldrb r0, [r7, #4]
	movs r1, #0xa0
	bl sub_02001398
_02003366:
	ldr r1, _02003388 @ =gUnknown_0300152C
	movs r0, #0
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200337C: .4byte gUnknown_0300152A
_02003380: .4byte gUnknown_03003330
_02003384: .4byte 0x0600E800
_02003388: .4byte gUnknown_0300152C

	thumb_func_start sub_0200338c
sub_0200338c: @ 0x0200338c
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, _020033A4 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _020033A8
	adds r0, r5, #0
	bl sub_02000ed4
	b _02003418
	.align 2, 0
_020033A4: .4byte gUnknown_03003330
_020033A8:
	ldr r0, [r2, #8]
	movs r1, #0x28
	ands r0, r1
	cmp r0, #0
	beq _020033B6
	movs r0, #0xac
	b _020033B8
_020033B6:
	movs r0, #0x8c
_020033B8:
	strb r0, [r5, #0x18]
	ldrb r0, [r5, #0x1a]
	adds r0, #1
	strb r0, [r5, #0x1a]
	lsls r0, r0, #0x18
	movs r6, #0xa1
	cmp r0, #0
	bge _020033CA
	movs r6, #0x9f
_020033CA:
	ldrb r0, [r5, #0x1a]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xa
	ldr r4, _02003420 @ =gUnknown_03004400
	ldrb r2, [r5, #0x1b]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r2, r4, #0
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r5, #8]
	ldrb r0, [r5, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #5
	ldrb r2, [r5, #0x1b]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	adds r1, #0x17
	lsls r1, r1, #0x10
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrb r0, [r5, #4]
	adds r1, r6, #0
	bl sub_02001398
_02003418:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02003420: .4byte gUnknown_03004400

	thumb_func_start sub_02003424
sub_02003424: @ 0x02003424
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _0200349C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	bne _02003514
	ldr r0, _020034A0 @ =gUnknown_0300159B
	ldrb r0, [r0]
	cmp r0, #0xf
	bhi _02003514
	ldr r4, _020034A4 @ =gUnknown_03003B80
	ldr r0, [r4, #0x10]
	subs r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0
	bne _02003514
	movs r0, #0x1e
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #0x3c
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	str r1, [r4, #0x10]
	ldr r6, _020034A8 @ =gUnknown_02021BC4
_02003462:
	movs r0, #0xa0
	bl sub_02001554
	adds r4, r0, #0
	adds r4, #8
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	movs r0, #0x88
	bl sub_02001554
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsrs r0, r0, #0x13
	movs r1, #0x16
	muls r0, r1, r0
	lsrs r4, r4, #0x13
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #9
	beq _020034AC
	cmp r0, #0xd
	beq _020034AC
	bl sub_02001534
	b _02003462
	.align 2, 0
_0200349C: .4byte gUnknown_03003330
_020034A0: .4byte gUnknown_0300159B
_020034A4: .4byte gUnknown_03003B80
_020034A8: .4byte gUnknown_02021BC4
_020034AC:
	movs r6, #0
	ldr r0, _02003520 @ =gUnknown_03003B80
	adds r1, r0, #0
	adds r1, #0x37
	ldrb r0, [r1]
	ldr r2, _02003524 @ =sub_02003534
	cmp r0, #0
	beq _020034CA
_020034BC:
	adds r1, #2
	adds r6, #1
	cmp r6, #0xf
	bgt _020034CA
	ldrb r0, [r1]
	cmp r0, #0
	bne _020034BC
_020034CA:
	adds r0, r2, #0
	mov r1, r8
	movs r2, #0
	bl sub_02000d04
	adds r4, r0, #0
	ldr r1, _02003520 @ =gUnknown_03003B80
	lsls r2, r6, #1
	adds r0, r1, #0
	adds r0, #0x37
	adds r0, r2, r0
	strb r5, [r0]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0xa]
	adds r1, #0x38
	adds r2, r2, r1
	strb r7, [r2]
	strb r7, [r4, #0x1d]
	ldr r0, _02003528 @ =gUnknown_020205E4
	str r0, [r4, #0x10]
	ldr r0, _0200352C @ =0x00000109
	strh r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #0x16]
	bl sub_020012f8
	strb r0, [r4, #0x17]
	movs r0, #0x1c
	strb r0, [r4, #0x18]
	strb r6, [r4, #0x1a]
	strb r5, [r4, #0x1f]
	ldr r1, _02003530 @ =gUnknown_0300159B
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_02003514:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02003520: .4byte gUnknown_03003B80
_02003524: .4byte sub_02003534
_02003528: .4byte gUnknown_020205E4
_0200352C: .4byte 0x00000109
_02003530: .4byte gUnknown_0300159B

	thumb_func_start sub_02003534
sub_02003534: @ 0x02003534
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _02003578 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020035BE
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _020035B6
	ldrb r0, [r4, #0x1f]
	adds r0, #1
	strb r0, [r4, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3f
	ble _02003580
	ldrb r0, [r4, #0x17]
	bl sub_0200133c
	ldrb r0, [r4, #0x1d]
	movs r1, #0
	strh r0, [r4, #0xe]
	strb r1, [r4, #0x17]
	strb r1, [r4, #0x16]
	movs r0, #3
	strb r0, [r4, #0x1c]
	ldr r0, _0200357C @ =sub_02003614
	str r0, [r4]
	b _020035B6
	.align 2, 0
_02003578: .4byte gUnknown_03003330
_0200357C: .4byte sub_02003614
_02003580:
	movs r1, #0x1f
	ldrsb r1, [r4, r1]
	movs r0, #0x40
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrb r1, [r4, #0x1d]
	adds r0, r0, r1
	strh r0, [r4, #0xe]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0x1f
	ldrsb r1, [r4, r1]
	bl Div
	adds r1, r0, #0
	ldr r0, _020035C4 @ =gUnknown_030015A0
	strh r1, [r0, #2]
	strh r1, [r0]
	strh r5, [r0, #4]
	ldrb r1, [r4, #0x17]
	lsls r1, r1, #4
	ldr r2, _020035C8 @ =gUnknown_03004E76
	adds r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
_020035B6:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
_020035BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020035C4: .4byte gUnknown_030015A0
_020035C8: .4byte gUnknown_03004E76

	thumb_func_start sub_020035CC
sub_020035CC: @ 0x020035CC
	ldr r3, _02003604 @ =gUnknown_03003B80
	ldrb r1, [r0, #0x1a]
	lsls r1, r1, #1
	adds r2, r3, #0
	adds r2, #0x37
	adds r1, r1, r2
	ldrb r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r1, [r0, #0x1a]
	lsls r1, r1, #1
	adds r3, #0x38
	adds r1, r1, r3
	ldrb r2, [r1]
	strb r2, [r0, #0x1d]
	ldrb r1, [r1]
	strh r1, [r0, #0xe]
	ldr r1, _02003608 @ =gUnknown_020205E4
	str r1, [r0, #0x10]
	ldr r1, _0200360C @ =0x00000109
	strh r1, [r0, #0x14]
	movs r1, #0x1c
	strb r1, [r0, #0x18]
	movs r1, #3
	strb r1, [r0, #0x1c]
	ldr r1, _02003610 @ =sub_02003614
	str r1, [r0]
	bx lr
	.align 2, 0
_02003604: .4byte gUnknown_03003B80
_02003608: .4byte gUnknown_020205E4
_0200360C: .4byte 0x00000109
_02003610: .4byte sub_02003614

	thumb_func_start sub_02003614
sub_02003614: @ 0x02003614
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0200363C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020036E4
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _020036DC
	ldrb r0, [r4, #0x19]
	cmp r0, #4
	bhi _020036DC
	lsls r0, r0, #2
	ldr r1, _02003640 @ =_02003644
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200363C: .4byte gUnknown_03003330
_02003640: .4byte _02003644
_02003644: @ jump table
	.4byte _020036DC @ case 0
	.4byte _02003658 @ case 1
	.4byte _020036DC @ case 2
	.4byte _02003694 @ case 3
	.4byte _020036AA @ case 4
_02003658:
	ldr r0, _0200368C @ =sub_020036EC
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #0xe]
	strb r1, [r0, #0x1d]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r0, #0xe]
	ldr r1, _02003690 @ =gUnknown_020205FC
	str r1, [r0, #0x10]
	movs r1, #0xc7
	lsls r1, r1, #1
	strh r1, [r0, #0x14]
	movs r1, #0x8c
	strb r1, [r0, #0x18]
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x1b]
	ldrb r0, [r4, #0x19]
	adds r0, #1
	strb r0, [r4, #0x19]
	b _020036DC
	.align 2, 0
_0200368C: .4byte sub_020036EC
_02003690: .4byte gUnknown_020205FC
_02003694:
	ldr r2, _020036D0 @ =gUnknown_03004400
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #7]
	ldrb r0, [r4, #0x19]
	adds r0, #1
	strb r0, [r4, #0x19]
_020036AA:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _020036DC
	ldr r1, _020036D4 @ =gUnknown_03003B80
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #1
	adds r1, #0x37
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r1, _020036D8 @ =gUnknown_0300159B
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_02000ed4
	b _020036E4
	.align 2, 0
_020036D0: .4byte gUnknown_03004400
_020036D4: .4byte gUnknown_03003B80
_020036D8: .4byte gUnknown_0300159B
_020036DC:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
_020036E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020036EC
sub_020036EC: @ 0x020036EC
	push {lr}
	adds r2, r0, #0
	ldr r0, _02003734 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02003744
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0200373C
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _0200373C
	ldrb r0, [r2, #0x19]
	adds r0, #1
	strb r0, [r2, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bls _0200373C
	strb r1, [r2, #0x19]
	ldrh r0, [r2, #0x14]
	adds r0, #2
	strh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	ldr r1, _02003738 @ =0x01930000
	cmp r0, r1
	bls _0200373C
	adds r0, r2, #0
	bl sub_02000ed4
	b _02003744
	.align 2, 0
_02003734: .4byte gUnknown_03003330
_02003738: .4byte 0x01930000
_0200373C:
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	bl sub_02001398
_02003744:
	pop {r0}
	bx r0

	thumb_func_start sub_02003748
sub_02003748: @ 0x02003748
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _020037BC @ =gUnknown_03003330
	ldrb r1, [r5, #0xf]
	movs r0, #0x50
	ands r0, r1
	cmp r0, #0
	beq _02003764
	b _02003C14
_02003764:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02003774
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _02003774
	b _02003C14
_02003774:
	ldr r0, _020037C0 @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200377E
	b _02003C14
_0200377E:
	movs r0, #0x14
	strb r0, [r4, #0x18]
	ldrb r0, [r4, #4]
	movs r1, #1
	bl sub_02001254
	ldrb r1, [r5, #0xf]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _02003796
	b _02003C14
_02003796:
	ldr r2, _020037C4 @ =gUnknown_030043F0
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _020037A6
	b _020038D8
_020037A6:
	ldrb r0, [r4, #7]
	adds r5, r0, #0
	cmp r5, #0
	beq _020037CC
	movs r0, #0xb0
	strh r0, [r4, #0x14]
	ldr r1, _020037C8 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	b _020037D0
	.align 2, 0
_020037BC: .4byte gUnknown_03003330
_020037C0: .4byte gUnknown_03001509
_020037C4: .4byte gUnknown_030043F0
_020037C8: .4byte gUnknown_0300152C
_020037CC:
	movs r0, #0xac
	strh r0, [r4, #0x14]
_020037D0:
	ldrh r1, [r4, #0x22]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r4, #0x22]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #2
	cmp r0, r1
	bls _020037EC
	strh r1, [r4, #0x22]
_020037EC:
	ldrh r1, [r4, #0x20]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _02003828 @ =0x00000279
	cmp r0, r1
	bls _02003806
	strh r1, [r4, #0x20]
_02003806:
	movs r3, #0
	movs r1, #0
	ldrh r0, [r6]
	movs r2, #0xf0
	ands r2, r0
	cmp r2, #0x50
	beq _02003864
	cmp r2, #0x50
	bgt _02003832
	cmp r2, #0x20
	beq _02003854
	cmp r2, #0x20
	bgt _0200382C
	cmp r2, #0x10
	beq _0200385A
	b _02003876
	.align 2, 0
_02003828: .4byte 0x00000279
_0200382C:
	cmp r2, #0x40
	beq _0200384A
	b _02003876
_02003832:
	cmp r2, #0x80
	beq _02003850
	cmp r2, #0x80
	bgt _02003840
	cmp r2, #0x60
	beq _0200385E
	b _02003876
_02003840:
	cmp r2, #0x90
	beq _02003872
	cmp r2, #0xa0
	beq _0200386A
	b _02003876
_0200384A:
	ldrh r0, [r4, #0x22]
	rsbs r3, r0, #0
	b _02003876
_02003850:
	ldrh r3, [r4, #0x22]
	b _02003876
_02003854:
	ldrh r0, [r4, #0x22]
	rsbs r1, r0, #0
	b _02003876
_0200385A:
	ldrh r1, [r4, #0x22]
	b _02003876
_0200385E:
	ldrh r0, [r4, #0x20]
	rsbs r3, r0, #0
	b _02003874
_02003864:
	ldrh r1, [r4, #0x20]
	rsbs r3, r1, #0
	b _02003876
_0200386A:
	ldrh r0, [r4, #0x20]
	rsbs r1, r0, #0
	adds r3, r0, #0
	b _02003876
_02003872:
	ldrh r3, [r4, #0x20]
_02003874:
	adds r1, r3, #0
_02003876:
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	lsls r1, r3, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bgt _02003892
	movs r0, #0x10
	b _02003898
_02003892:
	cmp r0, #0xdf
	ble _0200389A
	movs r0, #0xdf
_02003898:
	strh r0, [r4, #0xa]
_0200389A:
	lsls r0, r5, #0x18
	cmp r0, #0
	beq _020038AC
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0xa0
	ble _020038AC
	movs r0, #0xa0
	strh r0, [r4, #0xa]
_020038AC:
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #3
	bgt _020038B8
	movs r0, #4
	b _020038BE
_020038B8:
	cmp r0, #0x8f
	ble _020038C0
	movs r0, #0x8f
_020038BE:
	strh r0, [r4, #0xe]
_020038C0:
	lsls r0, r5, #0x18
	cmp r0, #0
	bne _020038C8
	b _02003C14
_020038C8:
	movs r6, #0xe
	ldrsh r0, [r4, r6]
	cmp r0, #0x8c
	bgt _020038D2
	b _02003C14
_020038D2:
	movs r0, #0x8c
	strh r0, [r4, #0xe]
	b _02003C14
_020038D8:
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r4, #0x22]
	subs r0, #0x71
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _020039CC
	movs r0, #0xb0
	strh r0, [r4, #0x14]
	b _02003916
_020038EE:
	movs r0, #0x15
	bl m4aSongNumStart
	ldrh r0, [r5, #0xa]
	movs r1, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #0xe]
	subs r0, #0x10
	strh r0, [r4, #0xe]
	ldrb r0, [r5, #0x1d]
	adds r0, #1
	strb r0, [r4, #0x1d]
	movs r0, #0xb0
	strh r0, [r4, #0x14]
	strb r1, [r4, #0x1a]
	strb r1, [r4, #0x19]
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x1b]
	ldr r0, _02003920 @ =sub_02003c24
	str r0, [r4]
_02003916:
	ldr r1, _02003924 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	b _02003C14
	.align 2, 0
_02003920: .4byte sub_02003c24
_02003924: .4byte gUnknown_0300152C
_02003928:
	movs r0, #0x15
	bl m4aSongNumStart
	movs r1, #1
	strb r1, [r4, #7]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #0xe]
	subs r0, #0x13
	strh r0, [r4, #0xe]
	ldr r0, _0200394C @ =sub_02008d04
	str r0, [r5]
	ldr r0, _02003950 @ =gUnknown_0300152C
	strb r1, [r0]
	ldr r2, _02003954 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	ldr r0, _02003958 @ =0x0000FFFE
	b _02003B50
	.align 2, 0
_0200394C: .4byte sub_02008d04
_02003950: .4byte gUnknown_0300152C
_02003954: .4byte gUnknown_030043F0
_02003958: .4byte 0x0000FFFE
_0200395C:
	movs r0, #0x15
	bl m4aSongNumStart
	movs r1, #1
	strb r1, [r4, #7]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #0xe]
	subs r0, #0x13
	strh r0, [r4, #0xe]
	ldr r0, _02003980 @ =sub_02008c9c
	str r0, [r5]
	ldr r0, _02003984 @ =gUnknown_0300152C
	strb r1, [r0]
	ldr r2, _02003988 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	ldr r0, _0200398C @ =0x0000FFFE
	b _02003B50
	.align 2, 0
_02003980: .4byte sub_02008c9c
_02003984: .4byte gUnknown_0300152C
_02003988: .4byte gUnknown_030043F0
_0200398C: .4byte 0x0000FFFE
_02003990:
	movs r1, #0
	mov r0, r8
	strh r0, [r4, #0xa]
	movs r0, #0x11
	strb r0, [r4, #0x1f]
	ldrh r0, [r5, #0xe]
	subs r0, #0x11
	strh r0, [r4, #0xe]
	ldrb r0, [r5, #0x1d]
	adds r0, #1
	strb r0, [r4, #0x1d]
	movs r0, #0xb8
	strh r0, [r4, #0x14]
	strb r1, [r4, #0x1e]
	strb r1, [r4, #0x1a]
	strb r1, [r4, #0x19]
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x1b]
	ldr r0, _020039C4 @ =sub_02003D58
	str r0, [r4]
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
	ldr r0, _020039C8 @ =gUnknown_0300152C
	strb r6, [r0]
	b _02003C14
	.align 2, 0
_020039C4: .4byte sub_02003D58
_020039C8: .4byte gUnknown_0300152C
_020039CC:
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _020039D8
	b _02003C14
_020039D8:
	ldr r0, _02003AB8 @ =gUnknown_03001528
	ldrh r2, [r4, #0xa]
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bgt _020039EC
	b _02003C14
_020039EC:
	ldr r1, _02003ABC @ =gUnknown_03005270
	ldrb r0, [r1]
	cmp r0, #0
	bne _020039F6
	b _02003C14
_020039F6:
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #0xe]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrb r0, [r1]
	subs r7, r0, #1
	cmp r7, #0
	bge _02003A14
	b _02003C14
_02003A14:
	movs r6, #1
	mov sb, r6
_02003A18:
	ldr r0, _02003AC0 @ =gUnknown_03004E20
	adds r0, r7, r0
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02003AC4 @ =gUnknown_03004400
	adds r5, r0, r1
	ldrb r0, [r5, #0x1c]
	cmp r0, #0xff
	bne _02003A30
	b _02003C0C
_02003A30:
	mov ip, r0
	lsls r1, r0, #2
	ldr r0, _02003AC8 @ =gUnknown_020206FC
	adds r3, r1, r0
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldrh r2, [r5, #0xa]
	adds r1, r2, r1
	adds r3, #1
	ldr r6, [sp]
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r2
	cmp r6, r1
	bge _02003A54
	b _02003C0C
_02003A54:
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	adds r3, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	bge _02003A66
	b _02003C0C
_02003A66:
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldrh r0, [r5, #0xe]
	adds r1, r1, r0
	adds r3, #1
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bge _02003A80
	b _02003C0C
_02003A80:
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bge _02003A90
	b _02003C0C
_02003A90:
	mov r1, ip
	cmp r1, #4
	bne _02003AF8
	ldr r6, _02003ACC @ =gUnknown_03003330
	ldrb r0, [r6, #0xf]
	ands r1, r0
	cmp r1, #0
	bne _02003AF8
	ldr r0, _02003AD0 @ =gMPlayInfo_BGM
	movs r1, #1
	bl m4aMPlayFadeOut
	movs r0, #0xc           @ SE_CONFIRM
	bl m4aSongNumStart
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	beq _02003AD8
	ldr r0, _02003AD4 @ =sub_0200d294
	b _02003ADA
	.align 2, 0
_02003AB8: .4byte gUnknown_03001528
_02003ABC: .4byte gUnknown_03005270
_02003AC0: .4byte gUnknown_03004E20
_02003AC4: .4byte gUnknown_03004400
_02003AC8: .4byte gUnknown_020206FC
_02003ACC: .4byte gUnknown_03003330
_02003AD0: .4byte gMPlayInfo_BGM
_02003AD4: .4byte sub_0200d294
_02003AD8:
	ldr r0, _02003AEC @ =sub_0200a8a4
_02003ADA:
	str r0, [r6, #4]
	ldr r1, _02003AF0 @ =gUnknown_03003330
	ldr r0, _02003AF4 @ =sub_0200882C
	str r0, [r1]
	ldrb r2, [r1, #0xf]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1, #0xf]
	b _02003C14
	.align 2, 0
_02003AEC: .4byte sub_0200a8a4
_02003AF0: .4byte gUnknown_03003330
_02003AF4: .4byte sub_0200882C
_02003AF8:
	ldrb r0, [r5, #0x1c]
	adds r6, r0, #0
	cmp r6, #3
	bne _02003B02
	b _020038EE
_02003B02:
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _02003B0E
	b _02003928
_02003B0E:
	cmp r6, #2
	bne _02003B14
	b _0200395C
_02003B14:
	cmp r6, #1
	bne _02003B70
	ldr r0, _02003B58 @ =gUnknown_0300152F
	ldrb r0, [r0]
	cmp r0, #0
	beq _02003B2C
	ldr r0, _02003B5C @ =gUnknown_03003B80
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	beq _02003B2C
	b _02003990
_02003B2C:
	movs r0, #0x15
	bl m4aSongNumStart
	mov r3, sb
	strb r3, [r4, #7]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #0xe]
	subs r0, #0x13
	strh r0, [r4, #0xe]
	ldr r0, _02003B60 @ =sub_02008cd4
	str r0, [r5]
	ldr r0, _02003B64 @ =gUnknown_0300152C
	strb r3, [r0]
	ldr r2, _02003B68 @ =gUnknown_030043F0
	ldrh r0, [r2, #4]
	ldr r6, _02003B6C @ =0x0000FFFE
	adds r1, r6, #0
_02003B50:
	ands r0, r1
	strh r0, [r2, #4]
	b _02003C14
	.align 2, 0
_02003B58: .4byte gUnknown_0300152F
_02003B5C: .4byte gUnknown_03003B80
_02003B60: .4byte sub_02008cd4
_02003B64: .4byte gUnknown_0300152C
_02003B68: .4byte gUnknown_030043F0
_02003B6C: .4byte 0x0000FFFE
_02003B70:
	cmp r6, #0
	bne _02003C0C
	ldr r2, _02003BB0 @ =gUnknown_03001510
	ldr r3, [r2]
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	mov ip, r0
	ands r0, r1
	cmp r0, #0
	beq _02003C0C
	strb r6, [r4, #0x1e]
	movs r0, #0x17
	strb r0, [r4, #0x1f]
	ldrb r0, [r5, #0x1d]
	adds r0, #1
	strb r0, [r4, #0x1d]
	movs r1, #0
	movs r0, #0xb8
	strh r0, [r4, #0x14]
	strb r1, [r4, #0x1a]
	strb r1, [r4, #0x19]
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x1b]
	ldr r0, _02003BB4 @ =sub_02003D58
	str r0, [r4]
	ldrb r0, [r3, #0x17]
	cmp r0, #0x22
	bne _02003BB8
	movs r0, #0x3c
	strb r0, [r3, #0x19]
	b _02003BEA
	.align 2, 0
_02003BB0: .4byte gUnknown_03001510
_02003BB4: .4byte sub_02003D58
_02003BB8:
	cmp r0, #0x17
	beq _02003BC6
	strb r1, [r3, #7]
	ldr r1, [r2]
	movs r0, #0x10
	strb r0, [r1, #0x17]
	b _02003BEA
_02003BC6:
	movs r0, #0x13
	strb r0, [r4, #0x1f]
	ldrb r1, [r3, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02003BDA
	mov r1, ip
	strb r1, [r4, #0x1e]
	b _02003BDE
_02003BDA:
	movs r0, #0xfe
	strb r0, [r4, #0x1e]
_02003BDE:
	ldr r1, [r2]
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	bne _02003BEA
	movs r0, #0x3c
	strb r0, [r1, #0x19]
_02003BEA:
	movs r0, #0x1e
	ldrsb r0, [r4, r0]
	ldrh r2, [r5, #0xa]
	adds r0, r0, r2
	strh r0, [r4, #0xa]
	movs r1, #0x1f
	ldrsb r1, [r4, r1]
	ldrh r0, [r5, #0xe]
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _02003C08 @ =gUnknown_0300152C
	mov r3, sb
	strb r3, [r0]
	b _02003C14
	.align 2, 0
_02003C08: .4byte gUnknown_0300152C
_02003C0C:
	subs r7, #1
	cmp r7, #0
	blt _02003C14
	b _02003A18
_02003C14:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_02003c24
sub_02003c24: @ 0x02003c24
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _02003C58 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	ldr r0, _02003C5C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02003C3C
	b _02003D42
_02003C3C:
	ldrb r0, [r4, #0x1b]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _02003C60 @ =gUnknown_03004400
	adds r5, r1, r0
	ldrb r0, [r4, #0x19]
	cmp r0, #7
	bhi _02003D42
	lsls r0, r0, #2
	ldr r1, _02003C64 @ =_02003C68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02003C58: .4byte gUnknown_0300152C
_02003C5C: .4byte gUnknown_03003330
_02003C60: .4byte gUnknown_03004400
_02003C64: .4byte _02003C68
_02003C68: @ jump table
	.4byte _02003C88 @ case 0
	.4byte _02003CA8 @ case 1
	.4byte _02003CC6 @ case 2
	.4byte _02003C88 @ case 3
	.4byte _02003CA8 @ case 4
	.4byte _02003CC6 @ case 5
	.4byte _02003CFA @ case 6
	.4byte _02003D2C @ case 7
_02003C88:
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _02003D42
	movs r0, #0
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _02003D24
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
	b _02003D24
_02003CA8:
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02003D42
	movs r0, #0
	strb r0, [r4, #0x1a]
	b _02003D24
_02003CC6:
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _02003D42
	movs r0, #0
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	bne _02003CEC
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	b _02003D24
_02003CEC:
	movs r0, #0xd
	bl m4aSongNumStart
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
	b _02003D24
_02003CFA:
	ldrb r0, [r4, #0x1a]
	bl sub_02001840
	ldrb r1, [r5, #0x1d]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	strh r1, [r5, #0xe]
	subs r1, #0x10
	strh r1, [r4, #0xe]
	ldrb r0, [r4, #0x1a]
	adds r0, #5
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _02003D42
	movs r0, #0
	strb r0, [r4, #0x1a]
	movs r0, #0xb4
	strh r0, [r4, #0x14]
_02003D24:
	ldrb r0, [r4, #0x19]
	adds r0, #1
	strb r0, [r4, #0x19]
	b _02003D42
_02003D2C:
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _02003D42
	ldr r0, _02003D54 @ =sub_02003748
	str r0, [r4]
	movs r0, #1
	strb r0, [r5, #7]
_02003D42:
	movs r0, #0x1c
	strb r0, [r4, #0x18]
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02003D54: .4byte sub_02003748

	thumb_func_start sub_02003D58
sub_02003D58: @ 0x02003D58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _02003DF4 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	ldr r0, _02003DF8 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02003DE0
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	beq _02003D7C
	cmp r0, #0x42
	beq _02003D7C
	cmp r0, #0x81
	bne _02003D82
_02003D7C:
	movs r0, #0x13
	bl m4aSongNumStart
_02003D82:
	ldrb r0, [r5, #0x1b]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _02003DFC @ =gUnknown_03004400
	adds r4, r4, r0
	ldrb r0, [r5, #0x1a]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x41
	bl Div
	ldrh r1, [r4, #0xa]
	subs r1, r1, r0
	movs r0, #0x1e
	ldrsb r0, [r5, r0]
	adds r0, r0, r1
	strh r0, [r5, #0xa]
	ldrb r0, [r5, #0x1a]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	bl Div
	ldrh r1, [r4, #0xe]
	subs r1, r1, r0
	movs r0, #0x1f
	ldrsb r0, [r5, r0]
	subs r1, r1, r0
	strh r1, [r5, #0xe]
	ldrb r0, [r5, #0x1a]
	adds r0, #3
	strb r0, [r5, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbf
	bls _02003DE0
	ldr r0, _02003E00 @ =sub_02003748
	str r0, [r5]
_02003DE0:
	movs r0, #0x1c
	strb r0, [r5, #0x18]
	ldrb r0, [r5, #4]
	ldrb r1, [r5, #0x1d]
	bl sub_02001398
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02003DF4: .4byte gUnknown_0300152C
_02003DF8: .4byte gUnknown_03003330
_02003DFC: .4byte gUnknown_03004400
_02003E00: .4byte sub_02003748

	thumb_func_start sub_02003e04
sub_02003e04: @ 0x02003e04
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _02003EA0 @ =gUnknown_03003B80
	ldrb r1, [r0, #0x1f]
	strh r1, [r3, #0xa]
	adds r2, r0, #0
	adds r2, #0x20
	ldrb r1, [r2]
	adds r7, r0, #0
	cmp r1, #0x9f
	bls _02003E1E
	movs r0, #0x9f
	strb r0, [r2]
_02003E1E:
	ldrb r0, [r2]
	strb r0, [r3, #0x1d]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	strh r1, [r3, #0xe]
	ldr r0, _02003EA4 @ =gUnknown_020205E4
	str r0, [r3, #0x10]
	ldrb r0, [r3, #0x1a]
	movs r2, #0xd8
	adds r4, r0, #0
	cmp r4, #0
	beq _02003E38
	movs r2, #0xdc
_02003E38:
	strh r2, [r3, #0x14]
	movs r0, #0xec
	strb r0, [r3, #0x18]
	movs r0, #1
	strb r0, [r3, #0x1c]
	lsrs r1, r1, #3
	movs r0, #0x16
	muls r1, r0, r1
	ldrh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _02003EA8 @ =gUnknown_02021F34
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r5, _02003EAC @ =gUnknown_030015A8
	ldr r6, _02003EB0 @ =sub_02003eb4
	cmp r0, #0
	beq _02003E78
_02003E62:
	adds r0, r1, #0
	subs r0, #0x16
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #0xe]
	subs r0, #8
	strh r0, [r3, #0xe]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _02003E62
_02003E78:
	ldrh r1, [r3, #0xe]
	movs r2, #0
	strb r1, [r3, #0x1d]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	strb r2, [r3, #0x19]
	movs r0, #0xe1
	lsls r0, r0, #3
	strh r0, [r3, #8]
	strb r4, [r5, #5]
	movs r0, #1
	strb r0, [r5, #4]
	str r6, [r3]
	adds r0, r3, #0
	bl _call_via_r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02003EA0: .4byte gUnknown_03003B80
_02003EA4: .4byte gUnknown_020205E4
_02003EA8: .4byte gUnknown_02021F34
_02003EAC: .4byte gUnknown_030015A8
_02003EB0: .4byte sub_02003eb4

	thumb_func_start sub_02003eb4
sub_02003eb4: @ 0x02003eb4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _02003EDC @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02003F62
	ldr r0, _02003EE0 @ =gUnknown_03003B80
	adds r1, r0, #0
	adds r1, #0x59
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0xff
	bne _02003EE4
	adds r0, r4, #0
	bl sub_020085e0
	b _02003F62
	.align 2, 0
_02003EDC: .4byte gUnknown_03003330
_02003EE0: .4byte gUnknown_03003B80
_02003EE4:
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	bls _02003EF4
	ldrh r0, [r4, #8]
	cmp r0, #0x3c
	bls _02003EF4
	movs r0, #0x3c
	strh r0, [r4, #8]
_02003EF4:
	ldrb r1, [r2, #0xf]
	movs r0, #0xe3
	ands r0, r1
	cmp r0, #0
	bne _02003F5A
	ldr r0, _02003F44 @ =gUnknown_0300152F
	ldrb r0, [r0]
	cmp r0, #0
	beq _02003F50
	adds r0, r3, #0
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	beq _02003F50
	ldrh r0, [r4, #8]
	subs r0, #1
	movs r5, #0
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02003F5A
	ldr r0, _02003F48 @ =gUnknown_020205EC
	str r0, [r4, #0x10]
	bl sub_020012f8
	strb r0, [r4, #0x17]
	strb r5, [r4, #0x1f]
	strb r5, [r4, #0x1e]
	strb r5, [r4, #0x19]
	movs r0, #0xff
	strb r0, [r4, #0x1c]
	ldr r1, _02003F4C @ =sub_02003f68
	str r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	movs r0, #0x21          @ SE_HATCH
	bl m4aSongNumStart
	b _02003F62
	.align 2, 0
_02003F44: .4byte gUnknown_0300152F
_02003F48: .4byte gUnknown_020205EC
_02003F4C: .4byte sub_02003f68
_02003F50:
	movs r0, #0
	strb r0, [r4, #0x19]
	movs r0, #0xe1
	lsls r0, r0, #3
	strh r0, [r4, #8]
_02003F5A:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
_02003F62:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_02003f68
sub_02003f68: @ 0x02003f68
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r2, _02003FDC @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _02003FE8
	ldrb r0, [r7, #7]
	cmp r0, #0
	bne _02003F88
	movs r0, #1
	strb r0, [r7, #7]
	movs r0, #0x21
	bl m4aSongNumStop
_02003F88:
	ldrb r1, [r7, #0x1e]
	movs r0, #0x1e
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _02003F96
	subs r0, r1, #1
	strb r0, [r7, #0x1e]
_02003F96:
	ldrb r1, [r7, #0x1f]
	movs r0, #0x1f
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _02003FA4
	subs r0, r1, #1
	strb r0, [r7, #0x1f]
_02003FA4:
	ldrb r0, [r7, #0x1e]
	ldrb r1, [r7, #0x1f]
	orrs r0, r1
	cmp r0, #0
	beq _02003FB0
	b _020040D4
_02003FB0:
	ldrb r0, [r7, #0x17]
	bl sub_0200133c
	ldrb r0, [r7, #0x1d]
	movs r1, #0
	strh r0, [r7, #0xe]
	ldr r0, _02003FE0 @ =gUnknown_020205E4
	str r0, [r7, #0x10]
	strb r1, [r7, #0x19]
	strb r1, [r7, #0x17]
	strb r1, [r7, #7]
	movs r0, #0xe1
	lsls r0, r0, #3
	strh r0, [r7, #8]
	movs r0, #1
	strb r0, [r7, #0x1c]
	ldr r1, _02003FE4 @ =sub_02003eb4
	str r1, [r7]
	adds r0, r7, #0
	bl _call_via_r1
	b _02004120
	.align 2, 0
_02003FDC: .4byte gUnknown_03003330
_02003FE0: .4byte gUnknown_020205E4
_02003FE4: .4byte sub_02003eb4
_02003FE8:
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _020040D4
	ldrb r1, [r7, #0x19]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _02004018
	ldr r0, [r2, #8]
	ands r0, r6
	cmp r0, #0
	beq _020040D4
	ldrb r0, [r7, #0x1e]
	adds r0, #1
	strb r0, [r7, #0x1e]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	beq _0200402E
	cmp r0, #0x10
	bne _020040D4
	b _0200402E
_02004018:
	ldr r0, [r2, #8]
	ands r0, r6
	cmp r0, #0
	beq _020040D4
	ldrb r0, [r7, #0x1f]
	adds r0, #1
	strb r0, [r7, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	bne _02004034
_0200402E:
	adds r0, r1, #1
	strb r0, [r7, #0x19]
	b _020040D4
_02004034:
	cmp r0, #0x11
	bne _020040D4
	ldr r4, _020040CC @ =sub_02004130
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r6, [r5, #7]
	ldrh r0, [r7, #0xa]
	strh r0, [r5, #0xa]
	ldrh r0, [r7, #0xa]
	strh r0, [r1, #0xa]
	ldrb r0, [r7, #0x1d]
	subs r0, #6
	strh r0, [r1, #0xe]
	ldrb r0, [r7, #0x1d]
	subs r0, #8
	strh r0, [r5, #0xe]
	ldrb r0, [r7, #0x1d]
	strb r0, [r5, #0x1d]
	ldrb r0, [r7, #0x1d]
	strb r0, [r1, #0x1d]
	ldr r0, [r7, #0x10]
	str r0, [r5, #0x10]
	str r0, [r1, #0x10]
	ldrb r0, [r7, #0x17]
	strb r0, [r5, #0x17]
	ldrb r0, [r7, #0x17]
	strb r0, [r1, #0x17]
	ldrb r0, [r7, #0x18]
	strb r0, [r5, #0x18]
	ldrb r0, [r7, #0x18]
	strb r0, [r1, #0x18]
	movs r0, #0x14
	strb r0, [r5, #0x1e]
	strb r0, [r1, #0x1e]
	movs r0, #6
	strb r0, [r5, #0x1f]
	strb r0, [r1, #0x1f]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r5, #0x22]
	movs r0, #0x10
	strh r0, [r5, #0x20]
	movs r2, #0xca
	lsls r2, r2, #1
	ldr r3, _020040D0 @ =gUnknown_03003B80
	adds r0, r3, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _020040AE
	adds r2, #8
_020040AE:
	adds r0, r2, #4
	strh r0, [r1, #0x14]
	strh r2, [r5, #0x14]
	ldrh r0, [r7, #0xa]
	strb r0, [r3, #0x1d]
	ldrb r0, [r7, #0x1d]
	subs r0, #1
	strb r0, [r3, #0x1e]
	bl sub_02001e74
	adds r0, r7, #0
	bl sub_02000ed4
	b _02004120
	.align 2, 0
_020040CC: .4byte sub_02004130
_020040D0: .4byte gUnknown_03003B80
_020040D4:
	movs r5, #0x80
	lsls r5, r5, #5
	movs r1, #0x1e
	ldrsb r1, [r7, r1]
	adds r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r4, _02004128 @ =gUnknown_030015A0
	movs r6, #0
	strh r0, [r4]
	movs r1, #0x1f
	ldrsb r1, [r7, r1]
	adds r1, #0x10
	adds r0, r5, #0
	bl Div
	strh r0, [r4, #2]
	strh r6, [r4, #4]
	ldrb r1, [r7, #0x17]
	lsls r1, r1, #4
	ldr r0, _0200412C @ =gUnknown_03004E76
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
	ldrb r1, [r7, #0x1d]
	ldrb r0, [r7, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x19
	subs r1, r1, r0
	strh r1, [r7, #0xe]
	ldrb r0, [r7, #4]
	ldrb r1, [r7, #0x1d]
	bl sub_02001398
_02004120:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02004128: .4byte gUnknown_030015A0
_0200412C: .4byte gUnknown_03004E76

	thumb_func_start sub_02004130
sub_02004130: @ 0x02004130
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _02004180 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020041D8
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02004174
	ldrb r2, [r4, #7]
	cmp r2, #0
	beq _02004162
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x22]
	ldrh r1, [r4, #0x20]
	subs r0, r0, r1
	strh r0, [r4, #0x22]
_02004162:
	ldrb r0, [r4, #0x1e]
	subs r1, r0, #1
	strb r1, [r4, #0x1e]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _0200419C
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _02004184
_02004174:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	b _020041D8
	.align 2, 0
_02004180: .4byte gUnknown_03003330
_02004184:
	ldrb r0, [r4, #0x1f]
	strb r0, [r4, #0x1e]
	subs r0, #2
	strb r0, [r4, #0x1f]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020041D8
	movs r0, #1
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x1f]
	strb r0, [r4, #0x1e]
	b _020041D8
_0200419C:
	lsls r0, r1, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _020041D8
	ldrb r0, [r4, #0x1f]
	strb r0, [r4, #0x1e]
	adds r0, #2
	strb r0, [r4, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _020041D0
	cmp r2, #0
	beq _020041C2
	ldrb r0, [r4, #0x17]
	bl sub_0200133c
	ldr r0, _020041CC @ =gUnknown_03001501
	strb r5, [r0]
_020041C2:
	adds r0, r4, #0
	bl sub_02000ed4
	b _020041D8
	.align 2, 0
_020041CC: .4byte gUnknown_03001501
_020041D0:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
_020041D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020041E0
sub_020041E0: @ 0x020041E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _02004200 @ =gUnknown_03003B80
	mov sb, r0
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _02004208
	ldr r1, _02004204 @ =gUnknown_0300152E
	movs r0, #0
	strb r0, [r1]
	b _020043E2
	.align 2, 0
_02004200: .4byte gUnknown_03003B80
_02004204: .4byte gUnknown_0300152E
_02004208:
	ldr r1, _020042CC @ =gUnknown_0300152E
	movs r0, #1
	strb r0, [r1]
	ldr r0, _020042D0 @ =sub_02008a74
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	movs r1, #0
	mov r8, r1
	movs r1, #0
	movs r0, #0xb0
	strh r0, [r2, #0xa]
	ldr r0, _020042D4 @ =gUnknown_02020464
	str r0, [r2, #0x10]
	strh r1, [r2, #0x14]
	movs r0, #0xc
	strb r0, [r2, #0x18]
	ldrb r0, [r7, #4]
	strb r0, [r2, #0x1b]
	ldr r0, _020042D8 @ =sub_02008ab8
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldr r0, _020042DC @ =gUnknown_020203F4
	str r0, [r2, #0x10]
	movs r5, #0xb6
	lsls r5, r5, #1
	strh r5, [r2, #0x14]
	movs r0, #4
	strb r0, [r2, #0x16]
	movs r0, #0x1c
	strb r0, [r2, #0x18]
	ldrb r0, [r7, #4]
	strb r0, [r2, #0x1b]
	ldr r0, _020042E0 @ =sub_02007240
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r6, r0, #0
	strh r5, [r6, #0x14]
	movs r1, #0xc
	strb r1, [r6, #0x18]
	movs r0, #1
	strb r0, [r6, #0x19]
	ldr r0, _020042E4 @ =sub_020073a8
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r4, r0, #0
	strh r5, [r4, #0x14]
	movs r0, #0xc
	strb r0, [r4, #0x18]
	ldr r0, _020042E8 @ =sub_02006a54
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	movs r1, #0xc
	strb r1, [r2, #0x18]
	ldrb r0, [r7, #4]
	strb r0, [r2, #0x1b]
	mov r0, r8
	strb r0, [r2, #0x1c]
	ldrb r0, [r2, #4]
	strb r0, [r6, #0x1b]
	ldrb r0, [r2, #4]
	strb r0, [r4, #0x1b]
	mov r0, sb
	adds r0, #0x72
	ldrb r2, [r0]
	cmp r2, #0
	beq _020042F0
	cmp r2, #0xb
	ble _02004312
	mov r3, sb
	adds r3, #0xa0
	ldr r4, _020042EC @ =gUnknown_030015B0
	movs r2, #0xf
_020042B2:
	ldrb r1, [r3]
	lsls r1, r1, #8
	ldrb r0, [r3, #1]
	orrs r0, r1
	strh r0, [r4]
	adds r3, #2
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _020042B2
	movs r2, #0xe
	b _02004312
	.align 2, 0
_020042CC: .4byte gUnknown_0300152E
_020042D0: .4byte sub_02008a74
_020042D4: .4byte gUnknown_02020464
_020042D8: .4byte sub_02008ab8
_020042DC: .4byte gUnknown_020203F4
_020042E0: .4byte sub_02007240
_020042E4: .4byte sub_020073a8
_020042E8: .4byte sub_02006a54
_020042EC: .4byte gUnknown_030015B0
_020042F0:
	mov r0, sb
	adds r0, #0x71
	ldrb r2, [r0]
	cmp r2, #0x12
	ble _020042FC
	movs r2, #1
_020042FC:
	cmp r2, #0
	beq _02004302
	adds r2, #2
_02004302:
	adds r0, r2, #0
	movs r1, #3
	bl Mod
	adds r2, r0, #0
	cmp r2, #0
	beq _02004312
	adds r2, #0xb
_02004312:
	ldr r1, _020043F0 @ =gUnknown_030015A8
	strb r2, [r1, #1]
	movs r0, #1
	strb r0, [r1]
	ldr r0, _020043F4 @ =gUnknown_03003B80
	ldrb r1, [r0, #0x1d]
	adds r3, r0, #0
	cmp r1, #0
	bne _0200432C
	movs r0, #0x58
	strb r0, [r3, #0x1d]
	movs r0, #0x68
	strb r0, [r3, #0x1e]
_0200432C:
	ldrb r0, [r3, #0x1e]
	lsrs r0, r0, #3
	movs r1, #0x16
	muls r1, r0, r1
	ldrb r0, [r3, #0x1d]
	lsrs r0, r0, #3
	adds r1, r0, r1
	ldr r4, _020043F8 @ =gUnknown_02021F34
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200435C
	adds r2, r3, #0
_02004346:
	adds r0, r1, #0
	subs r0, #0x16
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r0, [r2, #0x1e]
	subs r0, #8
	strb r0, [r2, #0x1e]
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _02004346
_0200435C:
	ldrb r0, [r3, #0x1d]
	movs r5, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r7, #0xa]
	ldrb r0, [r3, #0x1e]
	strb r0, [r7, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0xe]
	movs r0, #0xc
	str r3, [sp]
	bl sub_02001554
	strb r0, [r7, #0x16]
	ldr r0, _020043FC @ =gUnknown_0300152D
	ldrb r0, [r0]
	strb r0, [r7, #0x17]
	strb r5, [r7, #0x1f]
	ldrh r0, [r7, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	ldrh r0, [r7, #0xe]
	subs r0, #0x17
	strh r0, [r6, #0x22]
	ldr r4, _02004400 @ =gUnknown_03001518
	movs r1, #0xb4
	strh r1, [r4]
	movs r0, #0x3c
	strh r0, [r4, #2]
	strh r1, [r4, #4]
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r4, #6]
	ldr r3, [sp]
	adds r0, r3, #0
	adds r0, #0x74
	ldrb r0, [r0]
	movs r1, #0x14
	bl Div
	adds r0, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	strh r1, [r4, #8]
	ldr r0, _02004404 @ =gUnknown_0300159B
	ldrb r0, [r0]
	lsrs r0, r0, #1
	movs r1, #0xc
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _02004408 @ =gUnknown_03001526
	mov r1, r8
	strh r1, [r0]
	ldr r1, _0200440C @ =gUnknown_03001506
	ldr r0, _02004410 @ =gUnknown_03001507
	strb r5, [r0]
	strb r5, [r1]
	ldr r1, _02004414 @ =sub_02004418
	str r1, [r7]
	adds r0, r7, #0
	bl _call_via_r1
_020043E2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020043F0: .4byte gUnknown_030015A8
_020043F4: .4byte gUnknown_03003B80
_020043F8: .4byte gUnknown_02021F34
_020043FC: .4byte gUnknown_0300152D
_02004400: .4byte gUnknown_03001518
_02004404: .4byte gUnknown_0300159B
_02004408: .4byte gUnknown_03001526
_0200440C: .4byte gUnknown_03001506
_02004410: .4byte gUnknown_03001507
_02004414: .4byte sub_02004418

	thumb_func_start sub_02004418
sub_02004418: @ 0x02004418
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _02004504 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x92
	ands r0, r1
	cmp r0, #0
	beq _02004436
	bl sub_02005e36
_02004436:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004440
	b _020045B8
_02004440:
	ldr r1, _02004508 @ =gUnknown_03001518
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	adds r4, r1, #0
	ldr r5, _0200450C @ =gUnknown_03003B80
	cmp r0, #0
	bne _02004464
	movs r0, #0xb4
	strh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x76
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _02004464
	adds r0, #1
	strb r0, [r1]
_02004464:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02004482
	movs r0, #0x3c
	strh r0, [r4, #2]
	adds r1, r5, #0
	adds r1, #0x75
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _02004482
	adds r0, #1
	strb r0, [r1]
_02004482:
	ldrh r0, [r4, #4]
	subs r0, #1
	strh r0, [r4, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _020044A0
	movs r0, #0xb4
	strh r0, [r4, #4]
	adds r1, r5, #0
	adds r1, #0x74
	ldrb r0, [r1]
	cmp r0, #0
	beq _020044A0
	subs r0, #1
	strb r0, [r1]
_020044A0:
	adds r0, r5, #0
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0xbd
	bls _020044CA
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _020044CA
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r4, #6]
	adds r1, r5, #0
	adds r1, #0x73
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _020044CA
	adds r0, #1
	strb r0, [r1]
_020044CA:
	ldr r5, _0200450C @ =gUnknown_03003B80
	adds r1, r5, #0
	adds r1, #0x74
	ldrb r0, [r1]
	cmp r0, #0x6d
	bls _02004514
	ldr r4, _02004510 @ =gUnknown_0300159B
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02004540
	ldrb r0, [r1]
	movs r1, #0x14
	bl Div
	ldr r2, _02004508 @ =gUnknown_03001518
	adds r0, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	strh r1, [r2, #8]
	ldrb r0, [r4]
	lsrs r0, r0, #1
	movs r1, #0xc
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	b _02004578
	.align 2, 0
_02004504: .4byte gUnknown_03003330
_02004508: .4byte gUnknown_03001518
_0200450C: .4byte gUnknown_03003B80
_02004510: .4byte gUnknown_0300159B
_02004514:
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02004540
	ldrb r0, [r1]
	movs r1, #0x14
	bl Div
	adds r0, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	strh r1, [r4, #8]
	adds r1, r5, #0
	adds r1, #0x73
	ldrb r0, [r1]
	cmp r0, #0
	beq _02004540
	subs r0, #1
	strb r0, [r1]
_02004540:
	ldr r0, _02004598 @ =gUnknown_0300159B
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #3
	bls _02004578
	ldr r2, _0200459C @ =gUnknown_03001518
	ldrh r0, [r2, #0xa]
	subs r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02004578
	lsrs r0, r1, #0x19
	movs r1, #0xc
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r0, _020045A0 @ =gUnknown_03003B80
	adds r1, r0, #0
	adds r1, #0x73
	ldrb r0, [r1]
	cmp r0, #0
	beq _02004578
	subs r0, #1
	strb r0, [r1]
_02004578:
	ldr r1, _020045A4 @ =gUnknown_03001526
	ldrh r0, [r1]
	cmp r0, #0
	beq _02004584
	subs r0, #1
	strh r0, [r1]
_02004584:
	ldr r1, _020045A0 @ =gUnknown_03003B80
	adds r0, r1, #0
	adds r0, #0x73
	ldrb r0, [r0]
	cmp r0, #0
	beq _020045AC
	adds r1, #0xd0
	ldr r0, _020045A8 @ =0x00034BC0
	b _020045B6
	.align 2, 0
_02004598: .4byte gUnknown_0300159B
_0200459C: .4byte gUnknown_03001518
_020045A0: .4byte gUnknown_03003B80
_020045A4: .4byte gUnknown_03001526
_020045A8: .4byte 0x00034BC0
_020045AC:
	adds r1, #0xd0
	ldr r0, [r1]
	cmp r0, #0
	beq _020045B8
	subs r0, #1
_020045B6:
	str r0, [r1]
_020045B8:
	movs r0, #3
	strb r0, [r6, #0x1e]
	ldrb r0, [r6, #0x17]
	cmp r0, #0x3f
	bls _020045C4
	b _020046D4
_020045C4:
	lsls r0, r0, #2
	ldr r1, _020045D0 @ =_020045D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_020045D0: .4byte _020045D4
_020045D4: @ jump table
	.4byte _020046D4 @ case 0
	.4byte _020046E0 @ case 1
	.4byte _020046E0 @ case 2
	.4byte _02004756 @ case 3
	.4byte _020047AC @ case 4
	.4byte _02004808 @ case 5
	.4byte _0200482A @ case 6
	.4byte _0200484A @ case 7
	.4byte _0200487C @ case 8
	.4byte _020048AC @ case 9
	.4byte _020048BA @ case 10
	.4byte _020048E0 @ case 11
	.4byte _02004910 @ case 12
	.4byte _0200493C @ case 13
	.4byte _02004A68 @ case 14
	.4byte _02004A9C @ case 15
	.4byte _02004AC0 @ case 16
	.4byte _02004ACA @ case 17
	.4byte _02004B44 @ case 18
	.4byte _02004B52 @ case 19
	.4byte _02004B90 @ case 20
	.4byte _02004BC6 @ case 21
	.4byte _02004C94 @ case 22
	.4byte _02004D94 @ case 23
	.4byte _02004E40 @ case 24
	.4byte _02004E68 @ case 25
	.4byte _02004E68 @ case 26
	.4byte _02004E68 @ case 27
	.4byte _02004E90 @ case 28
	.4byte _02004E9E @ case 29
	.4byte _02004EE4 @ case 30
	.4byte _0200508A @ case 31
	.4byte _020050E8 @ case 32
	.4byte _020051C4 @ case 33
	.4byte _020051F4 @ case 34
	.4byte _020052E4 @ case 35
	.4byte _02005350 @ case 36
	.4byte _0200545C @ case 37
	.4byte _02005540 @ case 38
	.4byte _020055F0 @ case 39
	.4byte _0200508A @ case 40
	.4byte _020055F0 @ case 41
	.4byte _0200508A @ case 42
	.4byte _02005676 @ case 43
	.4byte _02005676 @ case 44
	.4byte _02005698 @ case 45
	.4byte _020056D0 @ case 46
	.4byte _020056D0 @ case 47
	.4byte _02005708 @ case 48
	.4byte _02005708 @ case 49
	.4byte _02005676 @ case 50
	.4byte _02005740 @ case 51
	.4byte _02005774 @ case 52
	.4byte _02005868 @ case 53
	.4byte _020058A0 @ case 54
	.4byte _020058DC @ case 55
	.4byte _02005908 @ case 56
	.4byte _02005A3C @ case 57
	.4byte _02005A3C @ case 58
	.4byte _02005B08 @ case 59
	.4byte _02005B08 @ case 60
	.4byte _02005B3E @ case 61
	.4byte _02005BF8 @ case 62
	.4byte _02005D6E @ case 63
_020046D4:
	movs r0, #0
	strb r0, [r6, #7]
	movs r0, #0x5a
	strh r0, [r6, #0x14]
	movs r0, #2
	strb r0, [r6, #0x17]
_020046E0:
	ldr r0, _02004700 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _02004704
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020046FC
	bl _02005E10
_020046FC:
	bl _02005B36
	.align 2, 0
_02004700: .4byte gUnknown_03003330
_02004704:
	ldr r0, _0200473C @ =gUnknown_03003B80
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _02004712
	bl _02005E10
_02004712:
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	subs r0, #0x58
	lsls r0, r0, #8
	movs r1, #0x40
	bl Div
	strh r0, [r6, #0x22]
	ldrh r1, [r6, #0xe]
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	cmp r0, #0x67
	bgt _02004740
	strh r1, [r6, #0xc]
	movs r0, #0x68
	subs r0, r0, r1
	strh r0, [r6, #0x20]
	movs r0, #0
	strb r0, [r6, #0x1a]
	movs r0, #3
	b _0200474C
	.align 2, 0
_0200473C: .4byte gUnknown_03003B80
_02004740:
	adds r0, r1, #0
	subs r0, #0x2e
	strh r0, [r6, #0x20]
	movs r0, #0x40
	strb r0, [r6, #0x1a]
	movs r0, #4
_0200474C:
	strb r0, [r6, #0x17]
	movs r0, #0x20
	bl m4aSongNumStart
	b _020047FA
_02004756:
	ldrb r0, [r6, #0x1a]
	adds r0, #2
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x80
	bhi _020047BA
	movs r7, #0x22
	ldrsh r1, [r6, r7]
	lsls r1, r1, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	cmp r2, #0x40
	bls _0200478C
	ldrb r0, [r6, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x3a
	muls r0, r1, r0
	adds r1, #0xc6
	bl Div
	movs r1, #0x3a
	b _020047F6
_0200478C:
	ldrb r0, [r6, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	ldrh r1, [r6, #0xc]
	adds r1, r1, r0
	strh r1, [r6, #0xe]
	b _020047FA
_020047AC:
	ldrb r0, [r6, #0x1a]
	adds r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bls _020047D0
_020047BA:
	ldr r0, _020047C8 @ =gUnknown_0300152F
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _020047CC @ =sub_020041E0
	str r0, [r6]
	bl sub_02005e36
	.align 2, 0
_020047C8: .4byte gUnknown_0300152F
_020047CC: .4byte sub_020041E0
_020047D0:
	movs r7, #0x22
	ldrsh r1, [r6, r7]
	lsls r1, r1, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	ldrb r0, [r6, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	ldrh r1, [r6, #0x20]
_020047F6:
	subs r1, r1, r0
	strb r1, [r6, #0x1f]
_020047FA:
	ldr r1, _02004804 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	bl _02005E10
	.align 2, 0
_02004804: .4byte gUnknown_0300152C
_02004808:
	movs r0, #0x21          @ SE_HATCH
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r6, #7]
	movs r0, #0x58
	strh r0, [r6, #0xa]
	movs r0, #0x68
	strb r0, [r6, #0x1d]
	strh r0, [r6, #0xe]
	movs r0, #0x46
	strb r0, [r6, #0x1a]
	movs r0, #0x3a
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_0200482A:
	ldr r1, _020048A4 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _02004842
	bl _02005E10
_02004842:
	strb r0, [r6, #7]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_0200484A:
	ldrb r0, [r6, #0x1a]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x3a
	muls r0, r1, r0
	asrs r0, r0, #8
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x1a]
	adds r0, #2
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _0200486E
	bl _02005E10
_0200486E:
	movs r0, #0x40
	strb r0, [r6, #7]
	movs r0, #1
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_0200487C:
	ldrb r0, [r6, #0x1a]
	bl sub_02001840
	lsrs r0, r0, #6
	movs r1, #0
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x1a]
	adds r0, #8
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _02004898
	bl _02005E10
_02004898:
	ldr r0, _020048A8 @ =gUnknown_0300152F
	strb r1, [r6, #0x1f]
	strb r1, [r0]
	strb r1, [r6, #0x17]
	bl _02005E10
	.align 2, 0
_020048A4: .4byte gUnknown_0300152C
_020048A8: .4byte gUnknown_0300152F
_020048AC:
	movs r0, #0
	strb r0, [r6, #7]
	movs r0, #0x5a
	strh r0, [r6, #0x14]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_020048BA:
	ldr r1, _020048DC @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020048D4
	bl _02005E10
_020048D4:
	movs r0, #0
	strb r0, [r6, #0x17]
	bl _02005E10
	.align 2, 0
_020048DC: .4byte gUnknown_0300152C
_020048E0:
	ldr r0, _0200490C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020048F0
	bl _02005B18
_020048F0:
	movs r0, #2
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004904
	bl _02005E10
_02004904:
	movs r0, #0x54
	strh r0, [r6, #0x14]
	bl _02005860
	.align 2, 0
_0200490C: .4byte gUnknown_03003330
_02004910:
	ldr r0, _02004938 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004920
	bl _02005B18
_02004920:
	movs r0, #2
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004934
	bl _02005E10
_02004934:
	bl _02005B36
	.align 2, 0
_02004938: .4byte gUnknown_03003330
_0200493C:
	movs r7, #0
	ldr r4, _02004964 @ =gUnknown_03003BF8
	ldr r3, _02004968 @ =gUnknown_02012510
	subs r2, r4, #5
_02004944:
	ldrb r1, [r6, #0x1b]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, r7, r0
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrb r1, [r2]
	adds r5, r0, r1
	cmp r5, #0
	bge _0200496C
	movs r5, #0
	b _02004972
	.align 2, 0
_02004964: .4byte gUnknown_03003BF8
_02004968: .4byte gUnknown_02012510
_0200496C:
	cmp r5, #0xc8
	ble _02004972
	movs r5, #0xc8
_02004972:
	strb r5, [r2]
	adds r2, #1
	adds r7, #1
	cmp r7, #1
	ble _02004944
	movs r7, #0
	ldr r2, _020049B8 @ =gUnknown_03003BF8
	mov r8, r2
	movs r0, #5
	rsbs r0, r0, #0
	add r0, r8
	mov sl, r0
	movs r1, #0
	mov sb, r1
_0200498E:
	mov r2, r8
	adds r3, r7, r2
	ldr r2, _020049BC @ =gUnknown_02012510
	ldrb r1, [r6, #0x1b]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, #2
	adds r0, r7, r0
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r3, [r3]
	adds r5, r0, r3
	cmp r5, #0
	bge _020049C0
	movs r5, #0
	b _02004A3C
	.align 2, 0
_020049B8: .4byte gUnknown_03003BF8
_020049BC: .4byte gUnknown_02012510
_020049C0:
	cmp r5, #0x63
	ble _02004A3C
	subs r5, #0x64
	mov r0, r8
	adds r0, #0x10
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, #0x62
	bls _020049D6
	movs r5, #0x63
	b _02004A3C
_020049D6:
	adds r0, #1
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x18
	add r0, sb
	ldrh r4, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #8
	lsrs r4, r4, #8
	orrs r4, r0
	movs r0, #5
	bl sub_02001554
	mov r1, r8
	adds r1, #8
	adds r1, r7, r1
	ldrb r1, [r1]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	adds r1, r0, #0
	adds r1, #0xb
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0xb4
	bls _02004A14
	adds r0, r4, #1
	adds r4, r0, r1
	b _02004A16
_02004A14:
	adds r4, r4, r1
_02004A16:
	ldr r0, _02004A8C @ =0x0000270F
	cmp r4, r0
	ble _02004A1E
	adds r4, r0, #0
_02004A1E:
	ldr r2, _02004A90 @ =gUnknown_03003C10
	mov r0, sb
	adds r3, r0, r2
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #8
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	asrs r0, r0, #8
	orrs r1, r0
	strh r1, [r3]
	adds r4, r2, #0
	subs r4, #0x18
_02004A3C:
	adds r0, r7, r4
	strb r5, [r0]
	movs r1, #2
	add sb, r1
	adds r7, #1
	cmp r7, #4
	ble _0200498E
	ldr r0, _02004A94 @ =sub_020086b4
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldrb r0, [r6, #0x1b]
	strb r0, [r2, #0x1a]
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	movs r0, #0x10
	strh r0, [r6, #0x14]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_02004A68:
	ldr r1, _02004A98 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004A82
	bl _02005E10
_02004A82:
	movs r0, #0xf0
	strh r0, [r6, #0x14]
	bl _02005860
	.align 2, 0
_02004A8C: .4byte 0x0000270F
_02004A90: .4byte gUnknown_03003C10
_02004A94: .4byte sub_020086b4
_02004A98: .4byte gUnknown_0300152C
_02004A9C:
	ldr r1, _02004ABC @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004AB6
	bl _02005E10
_02004AB6:
	bl _02005B36
	.align 2, 0
_02004ABC: .4byte gUnknown_0300152C
_02004AC0:
	movs r0, #0x3f
	strh r0, [r6, #0x14]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_02004ACA:
	ldr r0, _02004B0C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _02004ADE
	bl _02005B18
_02004ADE:
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004AF0
	bl _02005E10
_02004AF0:
	ldr r2, _02004B10 @ =gUnknown_03003B80
	adds r1, r2, #0
	adds r1, #0x76
	movs r0, #0
	strb r0, [r1]
	ldr r0, _02004B14 @ =gUnknown_03001526
	ldrh r0, [r0]
	cmp r0, #0
	beq _02004B18
	adds r0, r6, #0
	bl sub_02005efc
	b _02004B32
	.align 2, 0
_02004B0C: .4byte gUnknown_03003330
_02004B10: .4byte gUnknown_03003B80
_02004B14: .4byte gUnknown_03001526
_02004B18:
	adds r1, r2, #0
	adds r1, #0x73
	ldrb r0, [r1]
	adds r0, #0x14
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc8
	bls _02004B2E
	movs r0, #0xc8
	strb r0, [r1]
_02004B2E:
	movs r0, #0x12
	strb r0, [r6, #0x17]
_02004B32:
	ldr r1, _02004B40 @ =gUnknown_03001526
	movs r2, #0xe1
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	bl _02005E10
	.align 2, 0
_02004B40: .4byte gUnknown_03001526
_02004B44:
	movs r0, #0
	strb r0, [r6, #0x19]
	movs r0, #0x14
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_02004B52:
	ldr r0, _02004B8C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004B62
	bl _02005B18
_02004B62:
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02004B74
	bl _02005E10
_02004B74:
	movs r0, #0x14
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x19]
	adds r0, #1
	strb r0, [r6, #0x19]
	ands r0, r1
	cmp r0, #5
	bhi _02004B88
	bl _02005E10
_02004B88:
	bl _02005B36
	.align 2, 0
_02004B8C: .4byte gUnknown_03003330
_02004B90:
	ldr r0, _02004BAC @ =gUnknown_03003B80
	adds r2, r0, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #3
	bls _02004BA0
	movs r0, #0
	strb r0, [r2]
_02004BA0:
	ldrb r1, [r2]
	cmp r1, #3
	bne _02004BB0
	movs r0, #0x90
	strh r0, [r6, #0x14]
	b _02004BB8
	.align 2, 0
_02004BAC: .4byte gUnknown_03003B80
_02004BB0:
	movs r0, #0x50
	strh r0, [r6, #0x14]
	adds r0, r1, #1
	strb r0, [r2]
_02004BB8:
	movs r0, #0
	strb r0, [r6, #0x19]
	movs r0, #0x10
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_02004BC6:
	ldr r1, _02004BFC @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _02004C06
	movs r0, #0x14
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x19]
	adds r0, #1
	strb r0, [r6, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _02004C06
	ldrh r0, [r6, #0x14]
	cmp r0, #0x50
	bls _02004C00
	movs r0, #0x1a      @ SE_TOY_TRUMPET
	bl m4aSongNumStart
	b _02004C06
	.align 2, 0
_02004BFC: .4byte gUnknown_0300152C
_02004C00:
	movs r0, #0x24      @ SE_TOY_TRUMPET_NOVICE
	bl m4aSongNumStart
_02004C06:
	ldrb r1, [r6, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02004C28 @ =gUnknown_03004400
	adds r2, r0, r1
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	bne _02004C2C
	ldrh r0, [r6, #0xe]
	subs r0, #1
	strh r0, [r2, #0xe]
	adds r1, r6, #0
	adds r1, #0x23
	movs r0, #0xf
	b _02004C52
	.align 2, 0
_02004C28: .4byte gUnknown_03004400
_02004C2C:
	ldrb r0, [r6, #0x19]
	subs r0, #1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02004C46
	ldrh r0, [r6, #0xe]
	subs r0, #3
	strh r0, [r2, #0xe]
	adds r1, r6, #0
	adds r1, #0x23
	movs r0, #0xf
	b _02004C52
_02004C46:
	ldrh r0, [r6, #0xe]
	subs r0, #3
	strh r0, [r2, #0xe]
	adds r1, r6, #0
	adds r1, #0x23
	movs r0, #0xe
_02004C52:
	strb r0, [r1]
	adds r3, r1, #0
	ldrb r1, [r6, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02004C6C
	ldrh r0, [r6, #0xa]
	ldrb r3, [r3]
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	movs r0, #0x10
	b _02004C76
_02004C6C:
	ldrb r0, [r3]
	ldrh r1, [r6, #0xa]
	subs r1, r1, r0
	movs r0, #0
	strh r1, [r2, #0xa]
_02004C76:
	strb r0, [r2, #0x17]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004C88
	bl _02005E10
_02004C88:
	ldr r0, _02004C90 @ =sub_020083e4
	str r0, [r2]
	bl _02005B36
	.align 2, 0
_02004C90: .4byte sub_020083e4
_02004C94:
	ldr r0, _02004D40 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _02004CA8
	bl _02005B18
_02004CA8:
	adds r0, r6, #0
	bl sub_02005e58
	ldr r2, _02004D44 @ =gUnknown_02021F34
	ldrh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _02004D80
	movs r7, #0x22
	ldrsh r1, [r6, r7]
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	ldrh r1, [r6, #0xa]
	movs r0, #0x28
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #0xe]
	movs r1, #0x90
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsrs r0, r0, #8
	strb r0, [r6, #0x19]
	ldrb r0, [r6, #0x19]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	movs r4, #0
	strh r1, [r6, #0x22]
	ldrb r0, [r6, #0x19]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	strh r1, [r6, #0x20]
	movs r0, #0x1e
	strb r0, [r6, #0x1a]
	ldr r0, _02004D48 @ =gUnknown_03001502
	strh r5, [r0]
	ldr r1, _02004D4C @ =gUnknown_03001504
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	movs r7, #0xa
	ldrsh r0, [r6, r7]
	cmp r0, #0x47
	bgt _02004D50
	movs r0, #9
	strb r0, [r6, #0x16]
	b _02004D6E
	.align 2, 0
_02004D40: .4byte gUnknown_03003330
_02004D44: .4byte gUnknown_02021F34
_02004D48: .4byte gUnknown_03001502
_02004D4C: .4byte gUnknown_03001504
_02004D50:
	cmp r0, #0x57
	bgt _02004D5A
	movs r0, #0xa
	strb r0, [r6, #0x16]
	b _02004D6E
_02004D5A:
	cmp r0, #0x67
	bgt _02004D6C
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	cmp r0, #0x8f
	bgt _02004D6C
	movs r0, #0xb
	strb r0, [r6, #0x16]
	b _02004D6E
_02004D6C:
	strb r4, [r6, #0x16]
_02004D6E:
	ldr r0, _02004D7C @ =gUnknown_03001507
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x37
	strb r0, [r6, #0x17]
	bl _02005E10
	.align 2, 0
_02004D7C: .4byte gUnknown_03001507
_02004D80:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004D90
	bl _02005E10
_02004D90:
	bl _02005B36
_02004D94:
	movs r0, #2
	strb r0, [r6, #0x1e]
	ldr r2, _02004DB0 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004DB4
	movs r1, #1
	movs r0, #1
	strh r0, [r6, #0x14]
	strb r1, [r6, #0x17]
	bl _02005E10
	.align 2, 0
_02004DB0: .4byte gUnknown_03003330
_02004DB4:
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _02004DFC
	subs r0, #1
	strb r0, [r6, #0x19]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _02004E1C
	ldr r4, _02004DF0 @ =gUnknown_03003B80
	adds r0, r4, #0
	adds r0, #0x75
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _02004DF4
	adds r4, #0x73
	ldrb r0, [r4]
	movs r1, #5
	bl Div
	ldrb r1, [r4]
	subs r1, r1, r0
	strb r1, [r4]
	movs r0, #0x5a
	strh r0, [r6, #0x14]
	movs r0, #0x18
	strb r0, [r6, #0x17]
	movs r0, #0xc
	strb r0, [r6, #7]
	b _02004E1C
	.align 2, 0
_02004DF0: .4byte gUnknown_03003B80
_02004DF4:
	adds r0, r6, #0
	bl sub_02005efc
	b _02004E1C
_02004DFC:
	ldr r0, [r2, #8]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _02004E1C
	ldr r1, _02004E38 @ =gUnknown_03003B80
	adds r1, #0x75
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _02004E1C
	adds r0, r6, #0
	bl sub_02005efc
_02004E1C:
	ldrb r0, [r6, #0x1a]
	adds r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bhi _02004E2E
	bl _02005E10
_02004E2E:
	movs r0, #0
	strb r0, [r6, #0x1a]
	ldr r0, _02004E3C @ =sub_020069F8
	bl sub_020059ae
	.align 2, 0
_02004E38: .4byte gUnknown_03003B80
_02004E3C: .4byte sub_020069F8
_02004E40:
	ldr r0, _02004E64 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004E50
	bl _02005B18
_02004E50:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004E60
	bl _02005E10
_02004E60:
	bl _02005B36
	.align 2, 0
_02004E64: .4byte gUnknown_03003330
_02004E68:
	ldr r0, _02004E8C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004E78
	bl _02005B18
_02004E78:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004E88
	bl _02005E10
_02004E88:
	bl _02005B36
	.align 2, 0
_02004E8C: .4byte gUnknown_03003330
_02004E90:
	movs r0, #0
	strb r0, [r6, #0x19]
	movs r0, #0x3c
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_02004E9E:
	ldr r0, _02004EE0 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004EAE
	bl _02005B18
_02004EAE:
	ldrb r0, [r6, #0x1a]
	cmp r0, #0
	beq _02004ECA
	subs r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _02004ECA
	movs r0, #1
	strb r0, [r6, #0x19]
	ldrb r0, [r6, #7]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6, #7]
_02004ECA:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02004EDA
	bl _02005E10
_02004EDA:
	bl _02005B36
	.align 2, 0
_02004EE0: .4byte gUnknown_03003330
_02004EE4:
	ldr r0, _02004F70 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02004EF4
	bl _02005B18
_02004EF4:
	ldr r0, _02004F74 @ =gUnknown_03003B80
	adds r2, r0, #0
	adds r2, #0xcc
	ldrb r0, [r2]
	cmp r0, #0x5d
	bls _02004F10
	movs r1, #0
	movs r7, #0xc
	adds r0, r2, #0
_02004F06:
	strb r1, [r0]
	subs r0, #1
	subs r7, #1
	cmp r7, #0
	bge _02004F06
_02004F10:
	ldr r4, _02004F74 @ =gUnknown_03003B80
	adds r2, r4, #0
	adds r2, #0xc3
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x5e
	bl sub_02001554
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #4
	strb r0, [r1]
	cmp r0, #0x1c
	bls _02004F36
	adds r1, r0, #1
	add r0, sp, #4
	strb r1, [r0]
_02004F36:
	movs r7, #0
	add r0, sp, #4
	ldrb r2, [r0]
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x1b
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	ands r0, r2
	lsrs r3, r0, #0x18
	asrs r1, r3
	movs r0, #1
	ands r1, r0
	adds r5, r4, #0
	cmp r1, #0
	beq _02004FDC
	mov r2, sp
	adds r2, #5
	strb r3, [r2]
	add r0, sp, #4
	ldrb r0, [r0]
	lsrs r0, r0, #3
	add r1, sp, #4
	strb r0, [r1]
	adds r4, r2, #0
	b _02004FBA
	.align 2, 0
_02004F70: .4byte gUnknown_03003330
_02004F74: .4byte gUnknown_03003B80
_02004F78:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r4]
	cmp r0, #7
	bls _02004F9E
	movs r2, #0
	strb r2, [r4]
	add r0, sp, #4
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #4
	strb r0, [r1]
	cmp r0, #0xb
	bls _02004F9E
	adds r0, r1, #0
	strb r2, [r0]
_02004F9E:
	add r0, sp, #4
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _02004FBA
	ldrb r0, [r4]
	cmp r0, #7
	bne _02004FBA
	movs r1, #0
	strb r1, [r4]
	add r0, sp, #4
	strb r1, [r0]
	adds r7, #1
	cmp r7, #2
	bgt _02004FDC
_02004FBA:
	adds r1, r5, #0
	adds r1, #0xc0
	add r0, sp, #4
	ldrb r3, [r0]
	adds r1, r3, r1
	ldrb r1, [r1]
	ldrb r2, [r4]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _02004F78
	lsls r0, r3, #3
	orrs r2, r0
	add r0, sp, #4
	strb r2, [r0]
	movs r7, #0
_02004FDC:
	cmp r7, #0
	beq _02004FF0
	ldr r0, _02004FEC @ =gUnknown_03003B80
	adds r0, #0xcc
	movs r1, #0x5e
	strb r1, [r0]
	bl _02005B36
	.align 2, 0
_02004FEC: .4byte gUnknown_03003B80
_02004FF0:
	ldr r3, _02005050 @ =gUnknown_03003B80
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x1b
	adds r0, r3, #0
	adds r0, #0xc0
	adds r2, r2, r0
	movs r0, #0xe0
	lsls r0, r0, #0x13
	ands r0, r1
	lsrs r0, r0, #0x18
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r3, #0xcc
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	add r0, sp, #4
	ldrb r0, [r0]
	adds r0, #0x39
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sp
	adds r4, #5
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_0200270c
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0200503A
	bl _02005B36
_0200503A:
	ldrh r0, [r6, #0xe]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x5f
	ble _02005054
	asrs r1, r1, #0x13
	ldrb r0, [r4]
	adds r0, #3
	subs r7, r1, r0
	b _02005058
	.align 2, 0
_02005050: .4byte gUnknown_03003B80
_02005054:
	asrs r0, r1, #0x13
	adds r7, r0, #1
_02005058:
	ldr r0, _020050D0 @ =0x0203F800
	lsls r1, r7, #6
	add r2, sp, #4
	ldrb r2, [r2]
	movs r3, #0xfe
	ands r3, r2
	ldr r2, _020050D4 @ =0x0600E816
	subs r2, r2, r3
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xc0
	lsls r4, r4, #8
	str r4, [sp]
	bl sub_020017b0
	movs r0, #0x1f      @ SE_SPEECH_BUBBLE
	bl m4aSongNumStart
	movs r0, #0x1e
	strh r0, [r6, #0x14]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
_0200508A:
	ldr r0, _020050D8 @ =gUnknown_0300152C
	movs r1, #1
	strb r1, [r0]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldr r5, _020050DC @ =gUnknown_03001509
	strb r1, [r5]
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	beq _020050A2
	subs r0, #1
	strh r0, [r6, #0x14]
_020050A2:
	ldr r0, _020050E0 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _020050B2
	bl _02005E10
_020050B2:
	ldrh r4, [r6, #0x14]
	cmp r4, #0
	beq _020050BC
	bl _02005E10
_020050BC:
	ldr r1, _020050E4 @ =0x0600E800
	str r4, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	strb r4, [r5]
	bl _02005B36
	.align 2, 0
_020050D0: .4byte 0x0203F800
_020050D4: .4byte 0x0600E816
_020050D8: .4byte gUnknown_0300152C
_020050DC: .4byte gUnknown_03001509
_020050E0: .4byte gUnknown_030043F0
_020050E4: .4byte 0x0600E800
_020050E8:
	ldr r0, _02005110 @ =gUnknown_0300152C
	movs r1, #1
	strb r1, [r0]
	movs r0, #2
	strb r0, [r6, #0x1e]
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	cmp r0, #0x57
	beq _0200512A
	cmp r0, #0x57
	ble _02005118
	movs r0, #9
	strb r0, [r6, #0x16]
	ldr r0, [r6, #0xc]
	ldr r7, _02005114 @ =0xFFFFD000
	adds r0, r0, r7
	str r0, [r6, #0xc]
	bl _02005E10
	.align 2, 0
_02005110: .4byte gUnknown_0300152C
_02005114: .4byte 0xFFFFD000
_02005118:
	movs r0, #3
	strb r0, [r6, #0x16]
	ldr r0, [r6, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	str r0, [r6, #0xc]
	bl _02005E10
_0200512A:
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	cmp r0, #0x58
	beq _0200515E
	cmp r0, #0x58
	ble _0200514C
	movs r0, #6
	strb r0, [r6, #0x16]
	ldr r0, [r6, #8]
	ldr r7, _02005148 @ =0xFFFFD000
	adds r0, r0, r7
	str r0, [r6, #8]
	bl _02005E10
	.align 2, 0
_02005148: .4byte 0xFFFFD000
_0200514C:
	movs r0, #0
	strb r0, [r6, #0x16]
	ldr r0, [r6, #8]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	str r0, [r6, #8]
	bl _02005E10
_0200515E:
	movs r0, #3
	strb r0, [r6, #0x16]
	mov r4, sp
	adds r4, #5
	movs r0, #0xbc
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_0200270c
	ldr r0, _020051B8 @ =0x0203F800
	ldrh r1, [r6, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	adds r1, #1
	lsls r1, r1, #6
	add r2, sp, #4
	ldrb r2, [r2]
	movs r3, #0xfe
	ands r3, r2
	ldr r2, _020051BC @ =0x0600E816
	subs r2, r2, r3
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xc0
	lsls r4, r4, #8
	str r4, [sp]
	bl sub_020017b0
	movs r0, #0x3c
	strh r0, [r6, #0x14]
	movs r0, #2         @ MUS_GOODBYE_CHAO
	bl m4aSongNumStart
	movs r0, #0x1f      @ SE_SPEECH_BUBBLE
	bl m4aSongNumStart
	ldr r2, _020051C0 @ =gUnknown_03003330
	ldrb r0, [r2, #0xf]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #0xf]
	b _02005860
	.align 2, 0
_020051B8: .4byte 0x0203F800
_020051BC: .4byte 0x0600E816
_020051C0: .4byte gUnknown_03003330
_020051C4:
	ldr r1, _020051F0 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020051DE
	bl _02005E10
_020051DE:
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0
	strb r0, [r6, #0x19]
	movs r0, #0x22
	strb r0, [r6, #0x17]
	bl _02005E10
	.align 2, 0
_020051F0: .4byte gUnknown_0300152C
_020051F4:
	ldr r0, _02005264 @ =gUnknown_0300152C
	movs r1, #1
	strb r1, [r0]
	movs r0, #2
	strb r0, [r6, #0x1e]
	ldrb r4, [r6, #0x19]
	cmp r4, #0
	beq _02005270
	movs r0, #3
	strb r0, [r6, #0x16]
	mov r4, sp
	adds r4, #5
	movs r0, #0xc0
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_0200270c
	ldr r0, _02005268 @ =0x0203F800
	ldrh r1, [r6, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	adds r1, #1
	lsls r1, r1, #6
	add r2, sp, #4
	ldrb r2, [r2]
	movs r3, #0xfe
	ands r3, r2
	movs r2, #0x16
	subs r2, r2, r3
	ldr r5, _0200526C @ =0x0600E800
	adds r2, r2, r5
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xc0
	lsls r4, r4, #8
	str r4, [sp]
	bl sub_020017b0
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	movs r0, #0x1e
	strh r0, [r6, #0x14]
	movs r0, #0x23
	strb r0, [r6, #0x17]
	movs r0, #1         @ MUS_GARDEN
	bl m4aSongNumStart
	bl _02005E10
	.align 2, 0
_02005264: .4byte gUnknown_0300152C
_02005268: .4byte 0x0203F800
_0200526C: .4byte 0x0600E800
_02005270:
	ldr r0, [r6, #8]
	ldr r2, _020052C8 @ =0xFFFFEC00
	adds r0, r0, r2
	str r0, [r6, #8]
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	movs r0, #0xc
	rsbs r0, r0, #0
	cmp r1, r0
	blt _02005288
	bl _02005E10
_02005288:
	ldr r1, _020052CC @ =gUnknown_03003B80
	ldr r0, _020052D0 @ =gUnknown_0300152F
	movs r2, #0xff
	strb r2, [r0]
	adds r1, #0x58
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _020052D4 @ =sub_020041E0
	str r0, [r6]
	ldr r2, _020052D8 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2, #0xf]
	movs r0, #1         @ MUS_GARDEN
	bl m4aSongNumStart
	ldr r1, _020052DC @ =0x0600E800
	str r4, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	ldr r1, _020052E0 @ =gUnknown_030015A8
	strb r4, [r1, #1]
	movs r0, #1
	strb r0, [r1]
	bl _02005E10
	.align 2, 0
_020052C8: .4byte 0xFFFFEC00
_020052CC: .4byte gUnknown_03003B80
_020052D0: .4byte gUnknown_0300152F
_020052D4: .4byte sub_020041E0
_020052D8: .4byte gUnknown_03003330
_020052DC: .4byte 0x0600E800
_020052E0: .4byte gUnknown_030015A8
_020052E4:
	ldr r0, _02005338 @ =gUnknown_0300152C
	movs r1, #1
	strb r1, [r0]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	beq _020052F8
	subs r0, #1
	strh r0, [r6, #0x14]
_020052F8:
	ldr r0, _0200533C @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _02005308
	bl _02005E10
_02005308:
	ldrh r4, [r6, #0x14]
	cmp r4, #0
	beq _02005312
	bl _02005E10
_02005312:
	ldr r1, _02005340 @ =0x0600E800
	str r4, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	ldr r2, _02005344 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2, #0xf]
	ldr r0, _02005348 @ =gUnknown_03003B80
	adds r0, #0xd0
	ldr r1, _0200534C @ =0x00034BC0
	str r1, [r0]
	strb r4, [r6, #0x16]
	bl _02005B36
	.align 2, 0
_02005338: .4byte gUnknown_0300152C
_0200533C: .4byte gUnknown_030043F0
_02005340: .4byte 0x0600E800
_02005344: .4byte gUnknown_03003330
_02005348: .4byte gUnknown_03003B80
_0200534C: .4byte 0x00034BC0
_02005350:
	ldr r0, _020053B0 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02005360
	bl _02005B18
_02005360:
	ldr r0, _020053B4 @ =gUnknown_03001940
	ldrb r1, [r6, #0x1b]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0200536E
	b _02005472
_0200536E:
	movs r0, #0x22
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #8]
	adds r4, r0, r1
	str r4, [r6, #8]
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	ldr r0, [r6, #0xc]
	adds r3, r0, r1
	str r3, [r6, #0xc]
	ldr r2, _020053B8 @ =gUnknown_02021F34
	ldrh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _020053BC
	movs r7, #0x22
	ldrsh r0, [r6, r7]
	subs r0, r4, r0
	str r0, [r6, #8]
	movs r1, #0x20
	ldrsh r0, [r6, r1]
	subs r0, r3, r0
	str r0, [r6, #0xc]
	b _02005B36
	.align 2, 0
_020053B0: .4byte gUnknown_03003330
_020053B4: .4byte gUnknown_03001940
_020053B8: .4byte gUnknown_02021F34
_020053BC:
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _020053D4
	subs r0, #1
	strb r0, [r6, #0x19]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020053D4
	ldrb r1, [r6, #7]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r6, #7]
_020053D4:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020053E4
	bl _02005E10
_020053E4:
	movs r0, #0xd
	strb r0, [r6, #0x17]
	movs r0, #0x10
	strb r0, [r6, #7]
	ldrb r0, [r6, #0x1a]
	subs r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _020053FA
	movs r0, #0x90
	strb r0, [r6, #7]
_020053FA:
	add r1, sp, #4
	ldr r0, _02005448 @ =gUnknown_03001508
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r3, _0200544C @ =gUnknown_03004400
	adds r0, r1, #0
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0x1a]
	strb r0, [r6, #0x1b]
	ldr r2, _02005450 @ =gUnknown_03003B80
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, #0x5a
	ldrb r0, [r0, #0x19]
	adds r2, r2, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _02005454 @ =gUnknown_0300159A
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _02005458 @ =sub_02000ed4
	str r1, [r0]
	bl _02005E10
	.align 2, 0
_02005448: .4byte gUnknown_03001508
_0200544C: .4byte gUnknown_03004400
_02005450: .4byte gUnknown_03003B80
_02005454: .4byte gUnknown_0300159A
_02005458: .4byte sub_02000ed4
_0200545C:
	ldr r0, _0200548C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0200546A
	b _02005B18
_0200546A:
	ldr r0, _02005490 @ =gUnknown_03001514
	ldr r0, [r0]
	cmp r0, #0
	bne _02005494
_02005472:
	ldrb r1, [r6, #7]
	movs r0, #0xbf
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6, #7]
	movs r0, #0x1a
	strb r0, [r6, #0x17]
	movs r0, #0x3c
	strh r0, [r6, #0x14]
	bl _02005E10
	.align 2, 0
_0200548C: .4byte gUnknown_03003330
_02005490: .4byte gUnknown_03001514
_02005494:
	movs r2, #0x22
	ldrsh r1, [r6, r2]
	ldr r0, [r6, #8]
	adds r4, r0, r1
	str r4, [r6, #8]
	movs r7, #0x20
	ldrsh r1, [r6, r7]
	ldr r0, [r6, #0xc]
	adds r3, r0, r1
	str r3, [r6, #0xc]
	ldr r2, _020054D8 @ =gUnknown_02021F34
	ldrh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _020054DC
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	subs r0, r4, r0
	str r0, [r6, #8]
	movs r2, #0x20
	ldrsh r0, [r6, r2]
	subs r0, r3, r0
	str r0, [r6, #0xc]
	b _02005B36
	.align 2, 0
_020054D8: .4byte gUnknown_02021F34
_020054DC:
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _020054F4
	subs r0, #1
	strb r0, [r6, #0x19]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020054F4
	ldrb r1, [r6, #7]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r6, #7]
_020054F4:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02005504
	bl _02005E10
_02005504:
	movs r0, #0x26
	strb r0, [r6, #0x17]
	movs r0, #3
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	strh r1, [r6, #0x14]
	movs r0, #0
	strb r0, [r6, #7]
	ldr r0, _0200553C @ =gUnknown_03001514
	ldr r0, [r0]
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _02005534
	bl _02005E10
_02005534:
	movs r0, #0x80
	strb r0, [r6, #7]
	bl _02005E10
	.align 2, 0
_0200553C: .4byte gUnknown_03001514
_02005540:
	ldr r0, _02005564 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0200554E
	b _02005B18
_0200554E:
	ldr r0, _02005568 @ =gUnknown_03001514
	ldr r1, [r0]
	cmp r1, #0
	bne _0200556C
	movs r0, #0x2f
	strb r0, [r6, #0x17]
	movs r0, #0xf
	strb r0, [r6, #0x1a]
	strb r1, [r6, #0x19]
	bl _02005E10
	.align 2, 0
_02005564: .4byte gUnknown_03003330
_02005568: .4byte gUnknown_03001514
_0200556C:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	movs r4, #0
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0200557E
	bl _02005E10
_0200557E:
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, _020055B0 @ =0xFFFFF334
	adds r7, r7, r0
	cmp r7, #0
	bge _020055B8
	strb r4, [r6, #0x1a]
	strb r4, [r6, #0x19]
	movs r0, #0x17
	strb r0, [r6, #0x17]
	ldr r0, _020055B4 @ =gUnknown_03003B80
	adds r1, r0, #0
	adds r1, #0x75
	ldrb r0, [r1]
	cmp r0, #0x59
	bls _020055A6
	bl _02005E10
_020055A6:
	movs r0, #0x5a
	strb r0, [r1]
	bl _02005E10
	.align 2, 0
_020055B0: .4byte 0xFFFFF334
_020055B4: .4byte gUnknown_03003B80
_020055B8:
	ldr r1, _020055C4 @ =0xFFFFF334
	adds r7, r7, r1
	cmp r7, #0
	bge _020055C8
	movs r0, #0x79
	b _020055E6
	.align 2, 0
_020055C4: .4byte 0xFFFFF334
_020055C8:
	adds r7, r7, r0
	cmp r7, #0
	bge _020055D2
	movs r0, #0x7b
	b _020055E6
_020055D2:
	adds r7, r7, r0
	cmp r7, #0
	bge _020055DC
	movs r0, #0x7d
	b _020055E6
_020055DC:
	adds r7, r7, r0
	cmp r7, #0
	blt _020055E4
	b _02005B36
_020055E4:
	movs r0, #0x7f
_020055E6:
	strb r0, [r6, #0x19]
	movs r0, #0x27
	strb r0, [r6, #0x17]
	bl _02005E10
_020055F0:
	ldr r0, _02005628 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020055FE
	b _02005B18
_020055FE:
	ldrb r0, [r6, #0x19]
	adds r0, #0x39
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sp
	adds r4, #5
	add r1, sp, #4
	adds r2, r4, #0
	bl sub_0200270c
	ldrh r0, [r6, #0xe]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x5f
	ble _0200562C
	asrs r1, r1, #0x13
	ldrb r0, [r4]
	adds r0, #3
	subs r7, r1, r0
	b _02005630
	.align 2, 0
_02005628: .4byte gUnknown_03003330
_0200562C:
	asrs r0, r1, #0x13
	adds r7, r0, #1
_02005630:
	ldr r0, _02005668 @ =0x0203F800
	lsls r1, r7, #6
	add r2, sp, #4
	ldrb r2, [r2]
	movs r3, #0xfe
	ands r3, r2
	ldr r2, _0200566C @ =0x0600E816
	subs r2, r2, r3
	adds r1, r1, r2
	add r2, sp, #4
	ldrb r2, [r2]
	ldrb r3, [r4]
	movs r4, #0xc0
	lsls r4, r4, #8
	str r4, [sp]
	bl sub_020017b0
	movs r0, #0x1f      @ SE_SPEECH_BUBBLE
	bl m4aSongNumStart
	movs r0, #0x1e
	strh r0, [r6, #0x14]
	ldrb r0, [r6, #0x17]
	cmp r0, #0x27
	bne _02005670
	movs r0, #0x28
	strb r0, [r6, #0x17]
	b _02005E10
	.align 2, 0
_02005668: .4byte 0x0203F800
_0200566C: .4byte 0x0600E816
_02005670:
	movs r0, #0x2a
	strb r0, [r6, #0x17]
	b _02005E10
_02005676:
	ldr r0, _02005694 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02005684
	b _02005B18
_02005684:
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _02005692
	b _02005E10
_02005692:
	b _02005B36
	.align 2, 0
_02005694: .4byte gUnknown_03003330
_02005698:
	ldr r0, _020056CC @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020056A6
	b _02005B18
_020056A6:
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _020056B6
	b _02005E10
_020056B6:
	movs r0, #0x14
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x19]
	adds r0, #1
	strb r0, [r6, #0x19]
	ands r0, r1
	cmp r0, #5
	bhi _020056C8
	b _02005E10
_020056C8:
	b _02005B36
	.align 2, 0
_020056CC: .4byte gUnknown_03003330
_020056D0:
	ldr r0, _02005704 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020056DE
	b _02005B18
_020056DE:
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _020056EE
	b _02005E10
_020056EE:
	movs r0, #0xf
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x19]
	adds r0, #1
	strb r0, [r6, #0x19]
	ands r0, r1
	cmp r0, #7
	bhi _02005700
	b _02005E10
_02005700:
	b _02005B36
	.align 2, 0
_02005704: .4byte gUnknown_03003330
_02005708:
	ldr r0, _0200573C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02005716
	b _02005B18
_02005716:
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02005726
	b _02005E10
_02005726:
	movs r0, #0x1e
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x19]
	adds r0, #1
	strb r0, [r6, #0x19]
	ands r0, r1
	cmp r0, #3
	bhi _02005738
	b _02005E10
_02005738:
	b _02005B36
	.align 2, 0
_0200573C: .4byte gUnknown_03003330
_02005740:
	ldr r1, _0200576C @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldr r0, _02005770 @ =gUnknown_03003330
	ldr r0, [r0, #8]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0200575C
	ldrb r0, [r6, #0x1f]
	adds r0, #1
	strb r0, [r6, #0x1f]
_0200575C:
	movs r0, #0x1f
	ldrsb r0, [r6, r0]
	cmp r0, #0xf
	bgt _02005766
	b _02005E10
_02005766:
	movs r0, #4
	strb r0, [r6, #0x1a]
	b _02005860
	.align 2, 0
_0200576C: .4byte gUnknown_0300152C
_02005770: .4byte gUnknown_03003330
_02005774:
	ldr r1, _020057D8 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r4, #0
	strb r4, [r6, #0x1e]
	ldr r0, _020057DC @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020057E4
	ldr r2, _020057E0 @ =gUnknown_02021F34
	ldrh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _020057D2
	movs r0, #9
	strb r0, [r6, #0x16]
	movs r0, #0xc0
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x22]
	movs r0, #0xc0
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x20]
	strh r4, [r6, #0xc]
	strh r4, [r6, #8]
_020057D2:
	movs r0, #0x36
	strb r0, [r6, #0x17]
	b _02005E10
	.align 2, 0
_020057D8: .4byte gUnknown_0300152C
_020057DC: .4byte gUnknown_03003330
_020057E0: .4byte gUnknown_02021F34
_020057E4:
	adds r0, r6, #0
	bl sub_02005e58
	ldrh r0, [r6, #0x14]
	subs r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020057F8
	b _02005E10
_020057F8:
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02005820
	movs r0, #3
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	strh r1, [r6, #0x14]
	adds r0, r6, #0
	bl sub_02006570
	b _02005E10
_02005820:
	ldr r2, _0200585C @ =gUnknown_02021F34
	ldrh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _02005860
	movs r0, #3
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	strh r1, [r6, #0x14]
	adds r0, r6, #0
	bl sub_02006570
	movs r0, #1
	strb r0, [r6, #0x1a]
	b _02005E10
	.align 2, 0
_0200585C: .4byte gUnknown_02021F34
_02005860:
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
	b _02005E10
_02005868:
	ldr r1, _02005898 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldr r0, _0200589C @ =gUnknown_03003330
	ldr r0, [r0, #8]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _02005884
	ldrb r0, [r6, #0x1f]
	subs r0, #1
	strb r0, [r6, #0x1f]
_02005884:
	movs r0, #0x1f
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0200588E
	b _02005E10
_0200588E:
	movs r0, #0xf
	strh r0, [r6, #0x14]
	movs r0, #0x1a
	strb r0, [r6, #0x17]
	b _02005B00
	.align 2, 0
_02005898: .4byte gUnknown_0300152C
_0200589C: .4byte gUnknown_03003330
_020058A0:
	ldr r1, _020058D4 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	adds r0, r6, #0
	bl sub_02005e58
	ldr r2, _020058D8 @ =gUnknown_02021F34
	ldrh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _020058CE
	b _02005E10
_020058CE:
	movs r0, #0x35
	strb r0, [r6, #0x17]
	b _02005E10
	.align 2, 0
_020058D4: .4byte gUnknown_0300152C
_020058D8: .4byte gUnknown_02021F34
_020058DC:
	ldr r0, _02005904 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020058EA
	b _02005B18
_020058EA:
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _020058F8
	b _02005E10
_020058F8:
	movs r0, #0x38
	strb r0, [r6, #0x17]
	movs r0, #0x12
	bl m4aSongNumStart
	b _02005E10
	.align 2, 0
_02005904: .4byte gUnknown_03003330
_02005908:
	ldr r0, _020059C0 @ =gUnknown_0300152C
	movs r4, #1
	strb r4, [r0]
	movs r5, #0
	strb r5, [r6, #0x1e]
	movs r2, #0x22
	ldrsh r1, [r6, r2]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r7, #0x20
	ldrsh r1, [r6, r7]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	ldr r2, _020059C4 @ =gUnknown_03001502
	ldr r3, _020059C8 @ =gUnknown_03001504
	ldrh r1, [r3]
	ldrh r7, [r2]
	adds r0, r1, r7
	strh r0, [r2]
	subs r1, #0x10
	strh r1, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strb r0, [r6, #0x1f]
	cmp r0, #0
	blt _02005942
	b _02005E10
_02005942:
	ldr r1, _020059CC @ =gUnknown_03001506
	ldrb r0, [r1]
	cmp r0, #0
	bne _0200597E
	strb r4, [r1]
	ldr r4, _020059D0 @ =sub_02008a2c
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	adds r0, #0x23
	strb r5, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	movs r0, #1
	strb r0, [r2, #7]
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	adds r0, #0x23
	strb r5, [r0]
_0200597E:
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	movs r0, #0x18
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0200598C
	b _02005E10
_0200598C:
	ldr r0, _020059D4 @ =gUnknown_03003B80
	adds r0, #0x90
	ldrh r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #8
	lsrs r1, r1, #8
	orrs r0, r1
	cmp r0, #0x63
	bgt _020059DC
	ldrb r0, [r6, #7]
	movs r1, #8
	orrs r0, r1
	strb r0, [r6, #7]
	strb r5, [r6, #0x1a]
	movs r0, #0x3d
	strb r0, [r6, #0x17]
	ldr r0, _020059D8 @ =sub_02006798
sub_020059ae:
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	b _02005E10
	.align 2, 0
_020059C0: .4byte gUnknown_0300152C
_020059C4: .4byte gUnknown_03001502
_020059C8: .4byte gUnknown_03001504
_020059CC: .4byte gUnknown_03001506
_020059D0: .4byte sub_02008a2c
_020059D4: .4byte gUnknown_03003B80
_020059D8: .4byte sub_02006798
_020059DC:
	strb r5, [r6, #0x1a]
	movs r0, #0x3e
	strb r0, [r6, #0x17]
	ldr r0, _02005A38 @ =sub_020068D8
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	movs r0, #0x18
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x22]
	movs r0, #0x18
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x20]
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	cmp r0, #0x27
	ble _02005A24
	ldrh r0, [r6, #0x22]
	rsbs r0, r0, #0
	strh r0, [r6, #0x22]
_02005A24:
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	cmp r0, #0x90
	bgt _02005A2E
	b _02005E10
_02005A2E:
	ldrh r0, [r6, #0x20]
	rsbs r0, r0, #0
	strh r0, [r6, #0x20]
	b _02005E10
	.align 2, 0
_02005A38: .4byte sub_020068D8
_02005A3C:
	ldr r1, _02005AC0 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r4, #0
	strb r4, [r6, #0x1e]
	movs r7, #0x22
	ldrsh r1, [r6, r7]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	cmp r0, #0x13
	bgt _02005A68
	ldrh r0, [r6, #0x22]
	rsbs r0, r0, #0
	strh r0, [r6, #0x22]
_02005A68:
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	cmp r0, #0x98
	ble _02005A76
	ldrh r0, [r6, #0x20]
	rsbs r0, r0, #0
	strh r0, [r6, #0x20]
_02005A76:
	ldr r0, _02005AC4 @ =gUnknown_03001502
	ldr r3, _02005AC8 @ =gUnknown_03001504
	ldrh r1, [r0]
	ldrh r2, [r3]
	subs r1, r1, r2
	strh r1, [r0]
	adds r2, #0x10
	strh r2, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strb r1, [r6, #0x1f]
	cmp r1, #0
	blt _02005A94
	ldr r0, _02005ACC @ =gUnknown_03001506
	strb r4, [r0]
_02005A94:
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, #0
	bge _02005A9E
	b _02005E10
_02005A9E:
	movs r0, #0x1f
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _02005AA8
	b _02005E10
_02005AA8:
	ldrb r0, [r6, #7]
	movs r1, #0xfb
	ands r1, r0
	strb r1, [r6, #7]
	strb r4, [r6, #0x1a]
	strb r4, [r6, #0x1f]
	ldrb r0, [r6, #0x17]
	cmp r0, #0x39
	bne _02005AD0
	movs r0, #0x3b
	strb r0, [r6, #0x17]
	b _02005B00
	.align 2, 0
_02005AC0: .4byte gUnknown_0300152C
_02005AC4: .4byte gUnknown_03001502
_02005AC8: .4byte gUnknown_03001504
_02005ACC: .4byte gUnknown_03001506
_02005AD0:
	movs r0, #0x3c
	strb r0, [r6, #0x17]
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	cmp r0, #0x47
	bgt _02005AE2
	movs r0, #9
	strb r0, [r6, #0x16]
	b _02005B00
_02005AE2:
	cmp r0, #0x57
	bgt _02005AEC
	movs r0, #0xa
	strb r0, [r6, #0x16]
	b _02005B00
_02005AEC:
	cmp r0, #0x67
	bgt _02005AFE
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	cmp r0, #0x8f
	bgt _02005AFE
	movs r0, #0xb
	strb r0, [r6, #0x16]
	b _02005B00
_02005AFE:
	strb r4, [r6, #0x16]
_02005B00:
	movs r0, #0xf       @ SE_CHAO_WALK
	bl m4aSongNumStart
	b _02005E10
_02005B08:
	ldr r0, _02005B20 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _02005B24
_02005B18:
	movs r0, #0
	strb r0, [r6, #0x17]
	b _02005E10
	.align 2, 0
_02005B20: .4byte gUnknown_03003330
_02005B24:
	strb r0, [r6, #0x1e]
	ldrb r0, [r6, #0x1a]
	adds r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bhi _02005B36
	b _02005E10
_02005B36:
	adds r0, r6, #0
	bl sub_02005efc
	b _02005E10
_02005B3E:
	ldr r1, _02005B70 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldr r0, _02005B74 @ =gUnknown_03003330
	ldr r0, [r0, #8]
	movs r7, #1
	ands r0, r7
	cmp r0, #0
	beq _02005B56
	b _02005E10
_02005B56:
	ldrb r3, [r6, #0x1a]
	cmp r3, #0x3b
	bhi _02005B7E
	ldrb r2, [r6, #0x1f]
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	blt _02005B78
	adds r0, r3, #1
	strb r0, [r6, #0x1a]
	b _02005E10
	.align 2, 0
_02005B70: .4byte gUnknown_0300152C
_02005B74: .4byte gUnknown_03003330
_02005B78:
	adds r0, r2, #1
	strb r0, [r6, #0x1f]
	b _02005E10
_02005B7E:
	ldr r0, _02005BF0 @ =gUnknown_03001502
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _02005B90
	b _02005D94
_02005B90:
	ldrb r0, [r6, #0x19]
	adds r0, #0x80
	strb r0, [r6, #0x19]
	ldrb r0, [r6, #0x19]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x22]
	ldrb r0, [r6, #0x19]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x20]
	ldrb r0, [r6, #7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r6, #7]
	movs r0, #0x39
	strb r0, [r6, #0x17]
	ldr r4, _02005BF4 @ =sub_02008a2c
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	adds r0, #0x23
	movs r5, #5
	strb r5, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	strb r7, [r2, #7]
	b _02005E06
	.align 2, 0
_02005BF0: .4byte gUnknown_03001502
_02005BF4: .4byte sub_02008a2c
_02005BF8:
	ldr r1, _02005CC4 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r6, #0x1e]
	ldr r4, _02005CC8 @ =gUnknown_03003330
	ldrb r1, [r4, #0xf]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02005C36
	movs r0, #0xe0
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x22]
	movs r0, #0xe0
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x20]
	movs r0, #2
	strb r0, [r6, #0x1a]
_02005C36:
	ldrb r2, [r6, #0x1f]
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _02005C52
	ldr r0, [r4, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02005C52
	adds r0, r2, #1
	strb r0, [r6, #0x1f]
_02005C52:
	movs r7, #0x22
	ldrsh r1, [r6, r7]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	ldrh r1, [r6, #0xa]
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	cmp r0, #0x13
	bgt _02005C7A
	adds r0, r1, #1
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0x22]
	rsbs r0, r0, #0
	strh r0, [r6, #0x22]
_02005C7A:
	ldrh r1, [r6, #0xe]
	movs r7, #0xe
	ldrsh r0, [r6, r7]
	cmp r0, #0x98
	ble _02005C8E
	subs r0, r1, #1
	strh r0, [r6, #0xe]
	ldrh r0, [r6, #0x20]
	rsbs r0, r0, #0
	strh r0, [r6, #0x20]
_02005C8E:
	add r2, sp, #4
	movs r0, #0x22
	ldrsh r1, [r6, r0]
	lsls r1, r1, #6
	ldr r0, [r6, #8]
	adds r0, r0, r1
	asrs r0, r0, #0x10
	strb r0, [r2]
	adds r2, #1
	movs r7, #0x20
	ldrsh r1, [r6, r7]
	lsls r1, r1, #6
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	asrs r0, r0, #0x10
	strb r0, [r2]
	movs r7, #0
	ldrh r3, [r6, #0x20]
	movs r1, #0x20
	ldrsh r0, [r6, r1]
	adds r4, r2, #0
	cmp r0, #0
	bge _02005CD0
	ldr r2, _02005CCC @ =gUnknown_02021F34
	ldrb r0, [r4]
	subs r0, #1
	b _02005CD6
	.align 2, 0
_02005CC4: .4byte gUnknown_0300152C
_02005CC8: .4byte gUnknown_03003330
_02005CCC: .4byte gUnknown_02021F34
_02005CD0:
	ldr r2, _02005D20 @ =gUnknown_02021F34
	ldrb r0, [r4]
	adds r0, #1
_02005CD6:
	asrs r0, r0, #3
	movs r1, #0x16
	muls r1, r0, r1
	add r0, sp, #4
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _02005CF2
	rsbs r0, r3, #0
	strh r0, [r6, #0x20]
	movs r7, #1
_02005CF2:
	ldrh r3, [r6, #0x22]
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _02005D24
	ldrb r0, [r4]
	lsrs r0, r0, #3
	movs r1, #0x16
	muls r1, r0, r1
	add r0, sp, #4
	ldrb r0, [r0]
	subs r0, #1
	asrs r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _02005D44
	rsbs r0, r3, #0
	strh r0, [r6, #0x22]
	movs r7, #2
	b _02005D48
	.align 2, 0
_02005D20: .4byte gUnknown_02021F34
_02005D24:
	ldrb r0, [r4]
	lsrs r0, r0, #3
	movs r1, #0x16
	muls r1, r0, r1
	add r0, sp, #4
	ldrb r0, [r0]
	adds r0, #1
	asrs r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _02005D44
	rsbs r0, r3, #0
	strh r0, [r6, #0x22]
	movs r7, #2
_02005D44:
	cmp r7, #0
	beq _02005E10
_02005D48:
	ldrb r0, [r6, #0x1a]
	adds r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _02005E10
	cmp r7, #1
	bne _02005D62
	ldrh r0, [r6, #0x20]
	rsbs r0, r0, #0
	strh r0, [r6, #0x20]
	b _02005D68
_02005D62:
	ldrh r0, [r6, #0x22]
	rsbs r0, r0, #0
	strh r0, [r6, #0x22]
_02005D68:
	movs r0, #0x3f
	strb r0, [r6, #0x17]
	b _02005E10
_02005D6E:
	ldr r1, _02005D9C @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
	movs r2, #0
	strb r2, [r6, #0x1e]
	ldr r0, _02005DA0 @ =gUnknown_03001502
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _02005DA8
	ldr r0, _02005DA4 @ =gUnknown_03003330
	ldr r0, [r0, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02005E10
_02005D94:
	ldrb r0, [r6, #0x1f]
	subs r0, #1
	strb r0, [r6, #0x1f]
	b _02005E10
	.align 2, 0
_02005D9C: .4byte gUnknown_0300152C
_02005DA0: .4byte gUnknown_03001502
_02005DA4: .4byte gUnknown_03003330
_02005DA8:
	movs r7, #0x22
	ldrsh r0, [r6, r7]
	cmp r0, #0
	bge _02005DB6
	movs r0, #0x80
	strb r0, [r6, #0x19]
	b _02005DB8
_02005DB6:
	strb r2, [r6, #0x19]
_02005DB8:
	movs r0, #0x22
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r1, #2
	bl Div
	strh r0, [r6, #0x22]
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r1, #2
	bl Div
	strh r0, [r6, #0x20]
	movs r0, #0x3a
	strb r0, [r6, #0x17]
	ldr r4, _02005E48 @ =sub_02008a2c
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	adds r0, #0x23
	movs r5, #5
	strb r5, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r2, r0, #0
	movs r0, #1
	strb r0, [r2, #7]
_02005E06:
	ldrb r0, [r6, #4]
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	adds r0, #0x23
	strb r5, [r0]
_02005E10:
	ldrh r1, [r6, #0xe]
	ldrb r0, [r6, #0x1f]
	subs r0, r1, r0
	strb r0, [r6, #0x18]
	strb r1, [r6, #0x1d]
	ldr r2, _02005E4C @ =gUnknown_03003B80
	ldrh r0, [r6, #0xa]
	strb r0, [r2, #0x1d]
	strb r1, [r2, #0x1e]
	ldr r3, _02005E50 @ =gUnknown_03001514
	ldr r1, _02005E54 @ =gUnknown_03001940
	movs r2, #0
	adds r0, r1, #7
_02005E2A:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _02005E2A
	movs r0, #0
	str r0, [r3]
sub_02005e36:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02005E48: .4byte sub_02008a2c
_02005E4C: .4byte gUnknown_03003B80
_02005E50: .4byte gUnknown_03001514
_02005E54: .4byte gUnknown_03001940

	thumb_func_start sub_02005e58
sub_02005e58: @ 0x02005e58
	push {lr}
	adds r2, r0, #0
	movs r0, #0x22
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	ldrh r1, [r2, #0xa]
	adds r0, r1, #0
	subs r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x88
	bls _02005EB4
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	bgt _02005E8A
	adds r0, r1, #1
	b _02005E8C
_02005E8A:
	subs r0, r1, #1
_02005E8C:
	strh r0, [r2, #0xa]
	ldrh r0, [r2, #0x22]
	rsbs r0, r0, #0
	strh r0, [r2, #0x22]
	ldrb r1, [r2, #0x16]
	movs r0, #6
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _02005EA8
	adds r0, #0xc
	b _02005EAE
_02005EA8:
	cmp r0, #0xb
	ble _02005EB2
	subs r0, #0xc
_02005EAE:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_02005EB2:
	strb r1, [r2, #0x16]
_02005EB4:
	ldrh r1, [r2, #0xe]
	adds r0, r1, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x78
	bls _02005EF8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _02005ECE
	adds r0, r1, #1
	b _02005ED0
_02005ECE:
	subs r0, r1, #1
_02005ED0:
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #0x20]
	rsbs r0, r0, #0
	strh r0, [r2, #0x20]
	ldrb r1, [r2, #0x16]
	movs r0, #0xc
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _02005EEC
	adds r0, #0xc
	b _02005EF2
_02005EEC:
	cmp r0, #0xb
	ble _02005EF6
	subs r0, #0xc
_02005EF2:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_02005EF6:
	strb r1, [r2, #0x16]
_02005EF8:
	pop {r0}
	bx r0

	thumb_func_start sub_02005efc
sub_02005efc: @ 0x02005efc
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	movs r0, #0
	strb r0, [r7, #7]
	ldr r0, _02005F20 @ =gUnknown_03003B80
	str r0, [sp, #0x10]
	adds r0, #0xd0
	ldr r0, [r0]
	cmp r0, #0
	bne _02005F24
	movs r0, #0x20
	b _0200655C
	.align 2, 0
_02005F20: .4byte gUnknown_03003B80
_02005F24:
	movs r0, #3
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	movs r5, #0
	strh r1, [r7, #0x14]
	ldrb r4, [r7, #0x17]
	cmp r4, #0x17
	bne _02005F44
	movs r0, #0x19
	b _0200655C
_02005F44:
	cmp r4, #0x16
	beq _02005F4A
	b _02006554
_02005F4A:
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r1, _02005F64 @ =0xD99A0000
	adds r0, r0, r1
	cmp r0, #0
	bge _02005F68
	adds r0, r7, #0
	bl sub_02006570
	strb r4, [r7, #0x17]
	b _0200655E
	.align 2, 0
_02005F64: .4byte 0xD99A0000
_02005F68:
	ldr r0, [sp, #0x10]
	adds r0, #0x75
	ldrb r0, [r0]
	cmp r0, #0xc7
	bls _02005F7A
	strb r5, [r7, #0x1a]
	strb r5, [r7, #0x19]
	movs r0, #0x17
	b _0200655C
_02005F7A:
	ldr r0, [sp, #0x10]
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0x42
	bls _02005F86
	b _020060BC
_02005F86:
	ldrb r1, [r7, #0x16]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _02005F9A
	adds r0, #0xc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_02005F9A:
	adds r6, r1, #2
	adds r0, r6, #0
	cmp r0, #0xb
	ble _02005FA8
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_02005FA8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r2, [r7, #0xa]
	mov r8, r2
	ldrh r3, [r7, #0xe]
	mov sb, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_0200182c
	mov r1, r8
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	bl sub_02001840
	mov r2, sb
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r6, #0
	bl sub_0200182c
	adds r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	adds r0, r6, #0
	bl sub_02001840
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	movs r3, #0
	mov sl, r3
	ldr r4, [sp, #0x10]
	str r4, [sp, #0x18]
_02006020:
	ldr r0, _02006234 @ =gUnknown_03001940
	add r0, sl
	str r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #0
	beq _020060B2
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	subs r1, r6, r1
	mov r3, sl
	lsls r2, r3, #1
	ldr r0, [sp, #0x18]
	adds r0, #0x22
	adds r0, r2, r0
	ldrb r0, [r0]
	mov ip, r0
	mov r4, sb
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	mov r5, ip
	subs r4, r5, r3
	muls r1, r4, r1
	ldr r5, [sp, #4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r3, r0
	ldr r5, _02006238 @ =gUnknown_03003BA1
	adds r2, r2, r5
	ldrb r5, [r2]
	subs r2, r6, r5
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bgt _020060B2
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	subs r0, r6, r0
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r4, [sp, #0xc]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r3, r0
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	blt _020060B2
	mov r6, r8
	subs r0, r5, r6
	mov r2, ip
	mov r3, sb
	subs r1, r2, r3
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	muls r0, r4, r0
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	adds r1, r6, #0
	muls r1, r6, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x27
	bhi _020060B2
	b _020064F8
_020060B2:
	movs r4, #1
	add sl, r4
	mov r5, sl
	cmp r5, #7
	ble _02006020
_020060BC:
	ldr r1, _0200623C @ =gUnknown_03003B80
	ldr r6, _02006240 @ =gUnknown_03003BB5
	ldrb r0, [r6]
	cmp r0, #0
	bne _020060C8
	b _02006248
_020060C8:
	adds r1, #0x36
	mov sl, r1
	ldrb r0, [r1]
	cmp r0, #0x8f
	bls _020060D4
	b _02006248
_020060D4:
	ldrb r1, [r7, #0x16]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _020060E8
	adds r0, #0xc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_020060E8:
	adds r6, r1, #2
	adds r0, r6, #0
	cmp r0, #0xb
	ble _020060F6
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_020060F6:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r7, #0xa]
	mov r8, r0
	ldrh r1, [r7, #0xe]
	mov sb, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_0200182c
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	bl sub_02001840
	mov r3, sb
	lsls r1, r3, #0x10
	asrs r5, r1, #0x10
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_0200182c
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	bl sub_02001840
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r4, sl
	ldrb r0, [r4]
	adds r3, r0, #4
	movs r6, #0xa
	ldrsh r0, [r7, r6]
	ldr r1, _02006240 @ =gUnknown_03003BB5
	ldrb r2, [r1]
	movs r1, #8
	cmp r0, r2
	bge _0200617E
	ldr r1, _02006244 @ =0x0000FFF8
_0200617E:
	adds r2, r2, r1
	ldr r4, [sp]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r6, r8
	subs r1, r6, r1
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r3, r0, r5
	muls r1, r3, r1
	ldr r4, [sp, #4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r5, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r4, r6, r2
	muls r0, r4, r0
	adds r1, r1, r0
	cmp r1, #0
	bgt _02006248
	ldr r6, [sp, #8]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r1, r8
	subs r0, r1, r0
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r6, [sp, #0xc]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r5, r0
	muls r0, r4, r0
	adds r1, r1, r0
	cmp r1, #0
	blt _02006248
	mov r1, r8
	subs r0, r2, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r5, #0
	muls r0, r5, r0
	lsls r1, r3, #0x10
	asrs r4, r1, #0x10
	adds r1, r4, #0
	muls r1, r4, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x27
	bhi _02006248
	movs r0, #0x25
	strb r0, [r7, #0x17]
	movs r0, #0x40
	strb r0, [r7, #7]
	lsls r0, r1, #0x10
	movs r1, #0xc0
	lsls r1, r1, #6
	bl Div
	strh r0, [r7, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ArcTan2
	lsrs r0, r0, #8
	strb r0, [r7, #0x1a]
	movs r0, #0x3c
	strb r0, [r7, #0x19]
	ldrb r0, [r7, #0x1a]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r7, #0x22]
	ldrb r0, [r7, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r7, #0x20]
	b _0200655E
	.align 2, 0
_02006234: .4byte gUnknown_03001940
_02006238: .4byte gUnknown_03003BA1
_0200623C: .4byte gUnknown_03003B80
_02006240: .4byte gUnknown_03003BB5
_02006244: .4byte 0x0000FFF8
_02006248:
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r2, _0200625C @ =0xF3340000
	adds r0, r0, r2
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _02006260
	movs r0, #0x1e
	b _0200655C
	.align 2, 0
_0200625C: .4byte 0xF3340000
_02006260:
	ldr r3, _02006278 @ =0xFFFFF99A
	adds r1, r3, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _0200627C
	movs r0, #0x1b
	b _0200655C
	.align 2, 0
_02006278: .4byte 0xFFFFF99A
_0200627C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _0200628E
	movs r0, #0x1a
	b _0200655C
_0200628E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _020062A0
	movs r0, #0x19
	b _0200655C
_020062A0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _020062B0
	movs r0, #0x1c
	b _0200655C
_020062B0:
	ldr r0, _020062C8 @ =gUnknown_03003B80
	adds r0, #0x92
	ldrh r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #8
	lsrs r1, r1, #8
	orrs r0, r1
	cmp r0, #0x85
	ble _020062CC
	movs r6, #0xc8
	movs r5, #0xc8
	b _020062D0
	.align 2, 0
_020062C8: .4byte gUnknown_03003B80
_020062CC:
	movs r5, #0
	movs r6, #0xfa
_020062D0:
	bl sub_02001534
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0xf
	subs r0, r0, r6
	movs r1, #0xfa
	lsls r1, r1, #2
	mov r8, r1
	bl __divsi3
	adds r1, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _02006318
	ldr r0, _02006304 @ =gUnknown_03003B80
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	bne _02006308
	movs r0, #0x2b
	b _020063F0
	.align 2, 0
_02006304: .4byte gUnknown_03003B80
_02006308:
	cmp r0, #0x42
	bls _0200630E
	b _02006554
_0200630E:
	movs r0, #0
	movs r1, #0x2d
	strb r1, [r7, #0x17]
	movs r1, #0x14
	b _02006394
_02006318:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _0200633C
	ldr r0, _02006338 @ =gUnknown_03003B80
	adds r0, #0x75
	ldrb r0, [r0]
	cmp r0, #0x95
	bhi _02006332
	b _02006554
_02006332:
	movs r0, #0
	movs r1, #0x2e
	b _02006390
	.align 2, 0
_02006338: .4byte gUnknown_03003B80
_0200633C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _020063A0
	ldr r0, _02006360 @ =gUnknown_03003B80
	adds r0, #0x73
	ldrb r1, [r0]
	cmp r1, #0xbd
	bls _02006364
	movs r0, #0
	movs r1, #0x30
	strb r1, [r7, #0x17]
	movs r1, #0x1e
	b _02006394
	.align 2, 0
_02006360: .4byte gUnknown_03003B80
_02006364:
	cmp r1, #0xa5
	bls _0200636C
	movs r0, #0x12
	b _0200655C
_0200636C:
	cmp r1, #0
	bne _0200637C
	movs r0, #0x31
	strb r0, [r7, #0x17]
	movs r0, #0x1e
	strb r0, [r7, #0x1a]
	strb r1, [r7, #0x19]
	b _0200655E
_0200637C:
	cmp r1, #0x32
	bls _02006382
	b _02006554
_02006382:
	ldr r0, _0200639C @ =gUnknown_0300159B
	ldrb r0, [r0]
	cmp r0, #9
	bhi _0200638C
	b _02006554
_0200638C:
	movs r0, #0
	movs r1, #0x2f
_02006390:
	strb r1, [r7, #0x17]
	movs r1, #0xf
_02006394:
	strb r1, [r7, #0x1a]
	strb r0, [r7, #0x19]
	b _0200655E
	.align 2, 0
_0200639C: .4byte gUnknown_0300159B
_020063A0:
	lsls r0, r5, #0xf
	subs r0, r0, r5
	mov r1, r8
	bl __divsi3
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r1, #0
	bge _020063BC
	movs r0, #0x33
	b _0200655C
_020063BC:
	adds r1, r6, #0
	subs r1, #0x32
	lsls r0, r1, #0xf
	subs r0, r0, r1
	mov r1, r8
	bl __divsi3
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _020063F8
	ldr r0, _020063E4 @ =gUnknown_03003B80
	adds r0, #0x76
	ldrb r0, [r0]
	cmp r0, #0x84
	bls _020063E8
	movs r0, #0x2c
	b _020063F0
	.align 2, 0
_020063E4: .4byte gUnknown_03003B80
_020063E8:
	cmp r0, #0x63
	bhi _020063EE
	b _02006554
_020063EE:
	movs r0, #0x32
_020063F0:
	strb r0, [r7, #0x17]
	movs r0, #0x78
	strh r0, [r7, #0x14]
	b _0200655E
_020063F8:
	bl sub_02001534
	ldr r2, _0200641C @ =0xFFFFECCD
	adds r1, r2, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _02006440
	ldr r0, _02006420 @ =gUnknown_03003B80
	adds r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	beq _02006424
	movs r0, #0x65
	b _0200643A
	.align 2, 0
_0200641C: .4byte 0xFFFFECCD
_02006420: .4byte gUnknown_03003B80
_02006424:
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r1, _02006434 @ =0x3FFF0000
	cmp r0, r1
	bgt _02006438
	movs r0, #0x63
	b _0200643A
	.align 2, 0
_02006434: .4byte 0x3FFF0000
_02006438:
	movs r0, #0x61
_0200643A:
	strb r0, [r7, #0x19]
	movs r0, #0x27
	b _0200655C
_02006440:
	lsls r0, r4, #0x10
	ldr r3, _0200645C @ =0xF3340000
	adds r0, r0, r3
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _0200646C
	ldr r0, _02006460 @ =gUnknown_03003B80
	adds r0, #0xce
	ldrb r0, [r0]
	cmp r0, #0
	beq _02006464
	movs r0, #0x77
	b _02006466
	.align 2, 0
_0200645C: .4byte 0xF3340000
_02006460: .4byte gUnknown_03003B80
_02006464:
	movs r0, #0x67
_02006466:
	strb r0, [r7, #0x19]
	movs r0, #0x27
	b _0200655C
_0200646C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _02006498
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r1, _0200648C @ =0x3FFF0000
	cmp r0, r1
	bgt _02006490
	movs r0, #0x69
	b _02006492
	.align 2, 0
_0200648C: .4byte 0x3FFF0000
_02006490:
	movs r0, #0x6b
_02006492:
	strb r0, [r7, #0x19]
	movs r0, #0x27
	b _0200655C
_02006498:
	lsls r0, r4, #0x10
	ldr r4, _020064B0 @ =0xC0010000
	adds r0, r0, r4
	cmp r0, #0
	bge _020064E0
	ldr r0, _020064B4 @ =gUnknown_03003B80
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	bne _020064B8
	movs r0, #0x75
	b _020064DA
	.align 2, 0
_020064B0: .4byte 0xC0010000
_020064B4: .4byte gUnknown_03003B80
_020064B8:
	cmp r0, #0x10
	bhi _020064C0
	movs r0, #0x73
	b _020064DA
_020064C0:
	cmp r0, #0x21
	bhi _020064C8
	movs r0, #0x71
	b _020064DA
_020064C8:
	cmp r0, #0x32
	bls _020064D8
	cmp r0, #0x42
	bhi _02006554
	movs r0, #0x6d
	strb r0, [r7, #0x19]
	movs r0, #0x27
	b _0200655C
_020064D8:
	movs r0, #0x6f
_020064DA:
	strb r0, [r7, #0x19]
	movs r0, #0x29
	b _0200655C
_020064E0:
	ldr r0, _020064F4 @ =gUnknown_03003B80
	adds r0, #0xcf
	ldrb r0, [r0]
	cmp r0, #0
	beq _02006554
	movs r0, #0x81
	strb r0, [r7, #0x19]
	movs r0, #0x27
	b _0200655C
	.align 2, 0
_020064F4: .4byte gUnknown_03003B80
_020064F8:
	movs r0, #0x24
	strb r0, [r7, #0x17]
	movs r0, #0x40
	strb r0, [r7, #7]
	lsls r0, r1, #0x10
	movs r1, #0xc0
	lsls r1, r1, #6
	bl Div
	strh r0, [r7, #0x14]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ArcTan2
	lsrs r0, r0, #8
	strb r0, [r7, #0x1a]
	movs r0, #0x3c
	strb r0, [r7, #0x19]
	ldrb r0, [r7, #0x1a]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r7, #0x22]
	ldrb r0, [r7, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r7, #0x20]
	mov r5, sl
	strb r5, [r7, #0x1b]
	ldr r1, _02006550 @ =gUnknown_03001508
	ldr r6, [sp, #0x14]
	ldrb r0, [r6]
	strb r0, [r1]
	b _0200655E
	.align 2, 0
_02006550: .4byte gUnknown_03001508
_02006554:
	adds r0, r7, #0
	bl sub_02006570
	movs r0, #0x16
_0200655C:
	strb r0, [r7, #0x17]
_0200655E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02006570
sub_02006570: @ 0x02006570
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _02006584 @ =gUnknown_03001507
	ldrb r0, [r1]
	cmp r0, #0
	beq _02006588
	ldrb r4, [r6, #0x16]
	movs r0, #0
	strb r0, [r1]
	b _020065AC
	.align 2, 0
_02006584: .4byte gUnknown_03001507
_02006588:
	movs r0, #5
	bl sub_02001554
	ldrb r1, [r6, #0x16]
	adds r0, r0, r1
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	ble _020065A2
	subs r0, #0xc
	b _020065A8
_020065A2:
	cmp r0, #0
	bge _020065AC
	adds r0, #0xc
_020065A8:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_020065AC:
	movs r5, #0
	strb r4, [r6, #0x16]
	ldr r0, _020065E8 @ =gUnknown_02020F06
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r4, r4, r0
	ldrb r0, [r4]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x22]
	ldrb r0, [r4]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r6, #0x20]
	strh r5, [r6, #0xc]
	strh r5, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020065E8: .4byte gUnknown_02020F06

	thumb_func_start sub_020065ec
sub_020065ec: @ 0x020065ec
	push {lr}
	adds r2, r0, #0
	ldr r0, _02006618 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020066BC
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200661C
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _020066BC
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	bl sub_02001398
	b _020066BC
	.align 2, 0
_02006618: .4byte gUnknown_03003330
_0200661C:
	adds r1, r2, #0
	adds r1, #0x23
	ldrb r0, [r1]
	cmp r0, #0
	beq _02006630
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020066BC
_02006630:
	ldrb r0, [r2, #0x1b]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _02006670 @ =gUnknown_03004400
	adds r1, r1, r0
	movs r0, #0x1e
	ldrsb r0, [r2, r0]
	ldrh r3, [r1, #0xa]
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	ldrb r0, [r1, #0xe]
	adds r0, #1
	strb r0, [r2, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r2, #0xe]
	ldrb r0, [r2, #0x1f]
	adds r0, #1
	strb r0, [r2, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0200667A
	movs r0, #0
	strb r0, [r2, #0x1f]
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _02006674
	ldrb r0, [r2, #0x1e]
	subs r0, #1
	b _02006678
	.align 2, 0
_02006670: .4byte gUnknown_03004400
_02006674:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
_02006678:
	strb r0, [r2, #0x1e]
_0200667A:
	ldrb r0, [r2, #0x1a]
	adds r0, #1
	strb r0, [r2, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _020066A2
	movs r0, #0
	strb r0, [r2, #0x1a]
	ldrb r0, [r2, #0x19]
	adds r0, #1
	strb r0, [r2, #0x19]
	ands r0, r1
	cmp r0, #2
	bls _020066A2
	adds r0, r2, #0
	bl sub_02000ed4
	b _020066BC
_020066A2:
	ldr r0, _020066C0 @ =gUnknown_02020F12
	ldrb r1, [r2, #0x19]
	adds r1, r1, r0
	movs r3, #0xb6
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #0x14]
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	bl sub_02001398
_020066BC:
	pop {r0}
	bx r0
	.align 2, 0
_020066C0: .4byte gUnknown_02020F12

	thumb_func_start sub_020066c4
sub_020066c4: @ 0x020066c4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _020066EC @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0200678E
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020066F0
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0200678E
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	b _0200678E
	.align 2, 0
_020066EC: .4byte gUnknown_03003330
_020066F0:
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02006718 @ =gUnknown_03004400
	adds r1, r0, r1
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _0200671C
	ldrb r1, [r1, #0x1f]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200678E
	movs r0, #1
	strb r0, [r4, #7]
	ldrb r2, [r4, #0x19]
	b _0200674C
	.align 2, 0
_02006718: .4byte gUnknown_03004400
_0200671C:
	ldrb r1, [r1, #0x1f]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0200672E
	movs r0, #2
	strb r0, [r4, #7]
_0200672E:
	ldrb r0, [r4, #7]
	ldrb r2, [r4, #0x19]
	cmp r0, #1
	bls _0200674C
	ldrh r1, [r4, #0x14]
	movs r0, #0xbc
	lsls r0, r0, #1
	cmp r1, r0
	bne _0200674C
	cmp r2, #4
	bls _0200674C
	adds r0, r4, #0
	bl sub_02000ed4
	b _0200678E
_0200674C:
	adds r0, r2, #1
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _02006770
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrh r0, [r4, #0x14]
	adds r0, #4
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	ldr r1, _02006794 @ =0x017B0000
	cmp r0, r1
	bls _02006770
	movs r0, #0xb6
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
_02006770:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	ldrb r0, [r4, #0x1a]
	subs r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0200678E
	movs r0, #0x10
	strb r0, [r4, #0x1a]
	movs r0, #0x1d
	bl m4aSongNumStart
_0200678E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02006794: .4byte 0x017B0000

	thumb_func_start sub_02006798
sub_02006798: @ 0x02006798
	ldrb r2, [r0, #0x1b]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _020067CC @ =gUnknown_03004400
	adds r1, r1, r2
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #0xa]
	ldrb r1, [r1, #0xe]
	adds r1, #1
	strb r1, [r0, #0x1d]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r0, #0xe]
	ldr r1, _020067D0 @ =gUnknown_02020454
	str r1, [r0, #0x10]
	movs r1, #0xb6
	lsls r1, r1, #1
	strh r1, [r0, #0x14]
	movs r1, #0x8c
	strb r1, [r0, #0x18]
	movs r1, #1
	strb r1, [r0, #0x1a]
	ldr r1, _020067D4 @ =sub_020066c4
	str r1, [r0]
	bx lr
	.align 2, 0
_020067CC: .4byte gUnknown_03004400
_020067D0: .4byte gUnknown_02020454
_020067D4: .4byte sub_020066c4

	thumb_func_start sub_020067d8
sub_020067d8: @ 0x020067d8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02006800 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020068D0
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006804
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _020068D0
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	b _020068D0
	.align 2, 0
_02006800: .4byte gUnknown_03003330
_02006804:
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0200682C @ =gUnknown_03004400
	adds r3, r0, r1
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _02006830
	movs r1, #0x1f
	ldrsb r1, [r3, r1]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _020068D0
	movs r0, #1
	strb r0, [r4, #7]
	ldrb r2, [r4, #0x19]
	b _0200685E
	.align 2, 0
_0200682C: .4byte gUnknown_03004400
_02006830:
	movs r1, #0x1f
	ldrsb r1, [r3, r1]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _02006840
	movs r0, #2
	strb r0, [r4, #7]
_02006840:
	ldrb r0, [r4, #7]
	ldrb r2, [r4, #0x19]
	cmp r0, #1
	bls _0200685E
	ldrh r1, [r4, #0x14]
	movs r0, #0xbc
	lsls r0, r0, #1
	cmp r1, r0
	bne _0200685E
	cmp r2, #4
	bls _0200685E
	adds r0, r4, #0
	bl sub_02000ed4
	b _020068D0
_0200685E:
	adds r0, r2, #1
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _02006882
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrh r0, [r4, #0x14]
	adds r0, #4
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	ldr r1, _020068A4 @ =0x017B0000
	cmp r0, r1
	bls _02006882
	movs r0, #0xb6
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
_02006882:
	ldrh r1, [r3, #0xa]
	strh r1, [r4, #0xa]
	ldrb r0, [r3, #0xe]
	adds r0, #1
	strb r0, [r4, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xe]
	movs r2, #0x22
	ldrsh r0, [r3, r2]
	cmp r0, #0
	blt _020068A8
	movs r0, #0x10
	strb r0, [r4, #0x17]
	adds r0, r1, #0
	subs r0, #0xc
	b _020068B0
	.align 2, 0
_020068A4: .4byte 0x017B0000
_020068A8:
	movs r0, #0
	strb r0, [r4, #0x17]
	adds r0, r1, #0
	adds r0, #0xc
_020068B0:
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	ldrb r0, [r4, #0x1a]
	subs r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020068D0
	movs r0, #0x18
	strb r0, [r4, #0x1a]
	movs r0, #0x1d
	bl m4aSongNumStart
_020068D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020068D8
sub_020068D8: @ 0x020068D8
	push {r4, lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0200691C @ =gUnknown_03004400
	adds r1, r1, r0
	ldrh r3, [r1, #0xa]
	strh r3, [r2, #0xa]
	ldrb r0, [r1, #0xe]
	adds r0, #1
	strb r0, [r2, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r2, #0xe]
	ldr r0, _02006920 @ =gUnknown_0202044C
	str r0, [r2, #0x10]
	movs r0, #0xb6
	lsls r0, r0, #1
	strh r0, [r2, #0x14]
	movs r0, #0x8c
	strb r0, [r2, #0x18]
	movs r0, #1
	strb r0, [r2, #0x1a]
	movs r4, #0x22
	ldrsh r0, [r1, r4]
	cmp r0, #0
	blt _02006924
	movs r0, #0x10
	strb r0, [r2, #0x17]
	adds r0, r3, #0
	subs r0, #0xc
	b _02006928
	.align 2, 0
_0200691C: .4byte gUnknown_03004400
_02006920: .4byte gUnknown_0202044C
_02006924:
	adds r0, r3, #0
	adds r0, #0xc
_02006928:
	strh r0, [r2, #0xa]
	ldr r0, _02006934 @ =sub_020067d8
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02006934: .4byte sub_020067d8

	thumb_func_start sub_02006938
sub_02006938: @ 0x02006938
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0200695C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020069EE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006960
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	b _020069EE
	.align 2, 0
_0200695C: .4byte gUnknown_03003330
_02006960:
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02006988 @ =gUnknown_03004400
	adds r0, r0, r1
	ldrb r0, [r0, #0x17]
	cmp r0, #0x17
	bne _02006980
	ldrb r0, [r4, #0x1a]
	adds r1, r0, #1
	strb r1, [r4, #0x1a]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x59
	bls _0200698C
_02006980:
	adds r0, r4, #0
	bl sub_02000ed4
	b _020069EE
	.align 2, 0
_02006988: .4byte gUnknown_03004400
_0200698C:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x12
	bhi _0200699A
	movs r0, #0xb6
	lsls r0, r0, #1
	b _020069B4
_0200699A:
	cmp r0, #0x26
	bhi _020069A8
	ldr r0, _020069A4 @ =0x0000016D
	b _020069B4
	.align 2, 0
_020069A4: .4byte 0x0000016D
_020069A8:
	cmp r0, #0x3c
	bhi _020069B2
	movs r0, #0xb7
	lsls r0, r0, #1
	b _020069B4
_020069B2:
	ldr r0, _020069F4 @ =0x0000016F
_020069B4:
	strh r0, [r4, #0x14]
	ldrh r1, [r4, #0x20]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x20]
	adds r0, #0xa0
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #0x19]
	adds r0, #3
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r4, #0x1a]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #5
	bl Div
	ldrh r1, [r4, #0x22]
	adds r1, r1, r0
	strh r1, [r4, #0xa]
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
_020069EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020069F4: .4byte 0x0000016F

	thumb_func_start sub_020069F8
sub_020069F8: @ 0x020069F8
	push {lr}
	ldrb r2, [r0, #0x1b]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _02006A44 @ =gUnknown_03004400
	adds r1, r1, r2
	ldrh r2, [r1, #0xa]
	movs r3, #0
	strh r2, [r0, #0xa]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #0x22]
	ldrh r1, [r1, #0xe]
	adds r2, r1, #1
	strb r2, [r0, #0x1d]
	subs r1, #0x11
	strh r1, [r0, #0xe]
	ldr r1, _02006A48 @ =gUnknown_0202048C
	str r1, [r0, #0x10]
	movs r1, #0xb6
	lsls r1, r1, #1
	strh r1, [r0, #0x14]
	movs r1, #0x9c
	strb r1, [r0, #0x18]
	ldr r1, _02006A4C @ =gUnknown_03003330
	ldr r1, [r1, #8]
	strb r1, [r0, #0x19]
	strb r3, [r0, #0x1a]
	movs r1, #0x88
	lsls r1, r1, #6
	strh r1, [r0, #0x20]
	ldr r1, _02006A50 @ =sub_02006938
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02006A44: .4byte gUnknown_03004400
_02006A48: .4byte gUnknown_0202048C
_02006A4C: .4byte gUnknown_03003330
_02006A50: .4byte sub_02006938

	thumb_func_start sub_02006a54
sub_02006a54: @ 0x02006a54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _02006A80 @ =gUnknown_03003330
	ldrb r2, [r1, #0xf]
	movs r0, #0x10
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _02006A6E
	b _0200722E
_02006A6E:
	ldr r0, _02006A84 @ =gUnknown_0300152E
	ldrb r0, [r0]
	cmp r0, #0
	bne _02006A88
	adds r0, r6, #0
	bl sub_02000ed4
	b _0200722E
	.align 2, 0
_02006A80: .4byte gUnknown_03003330
_02006A84: .4byte gUnknown_0300152E
_02006A88:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _02006A92
	b _0200721C
_02006A92:
	ldrb r1, [r6, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02006ACC @ =gUnknown_03004400
	adds r4, r0, r1
	ldrb r0, [r4, #7]
	strb r0, [r6, #7]
	ldrh r0, [r4, #0xa]
	strh r0, [r6, #0xa]
	ldrb r0, [r4, #0x18]
	strh r0, [r6, #0xe]
	ldrb r0, [r4, #0x1d]
	strb r0, [r6, #0x1d]
	mov r1, sp
	adds r1, #1
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r4, #0x17]
	subs r0, #1
	mov r8, r1
	cmp r0, #0x3e
	bls _02006AC2
	b _02006BD0
_02006AC2:
	lsls r0, r0, #2
	ldr r1, _02006AD0 @ =_02006AD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02006ACC: .4byte gUnknown_03004400
_02006AD0: .4byte _02006AD4
_02006AD4: @ jump table
	.4byte _02006D44 @ case 0
	.4byte _02006BD0 @ case 1
	.4byte _02006BD0 @ case 2
	.4byte _02006BD0 @ case 3
	.4byte _02006BD0 @ case 4
	.4byte _02006BD0 @ case 5
	.4byte _02006BD0 @ case 6
	.4byte _02006BD0 @ case 7
	.4byte _02006BD0 @ case 8
	.4byte _02006BD4 @ case 9
	.4byte _02006BD8 @ case 10
	.4byte _02006BEA @ case 11
	.4byte _02006BD0 @ case 12
	.4byte _02006C20 @ case 13
	.4byte _02006C40 @ case 14
	.4byte _02006BD0 @ case 15
	.4byte _02006C6A @ case 16
	.4byte _02006BD0 @ case 17
	.4byte _02006C8C @ case 18
	.4byte _02006BD0 @ case 19
	.4byte _02006C96 @ case 20
	.4byte _02006CBA @ case 21
	.4byte _02006D44 @ case 22
	.4byte _02006BD0 @ case 23
	.4byte _02006DAC @ case 24
	.4byte _02006DEE @ case 25
	.4byte _02006E2C @ case 26
	.4byte _02006BD0 @ case 27
	.4byte _02006E30 @ case 28
	.4byte _02006BD0 @ case 29
	.4byte _02006E3E @ case 30
	.4byte _02006CBA @ case 31
	.4byte _02006DEE @ case 32
	.4byte _02006CBA @ case 33
	.4byte _02006DEE @ case 34
	.4byte _02006E46 @ case 35
	.4byte _02006E46 @ case 36
	.4byte _02006EB8 @ case 37
	.4byte _02006E3E @ case 38
	.4byte _02006E3E @ case 39
	.4byte _02006E42 @ case 40
	.4byte _02006E42 @ case 41
	.4byte _02006ECC @ case 42
	.4byte _02006EDE @ case 43
	.4byte _02006EF0 @ case 44
	.4byte _02006F0A @ case 45
	.4byte _02006F4C @ case 46
	.4byte _02006F8C @ case 47
	.4byte _02006FA6 @ case 48
	.4byte _02006FC0 @ case 49
	.4byte _02006FC4 @ case 50
	.4byte _02006FC4 @ case 51
	.4byte _02006FC4 @ case 52
	.4byte _02006FC4 @ case 53
	.4byte _0200703C @ case 54
	.4byte _0200706A @ case 55
	.4byte _020070A0 @ case 56
	.4byte _020070A0 @ case 57
	.4byte _02007108 @ case 58
	.4byte _02007108 @ case 59
	.4byte _0200716C @ case 60
	.4byte _020071A8 @ case 61
	.4byte _020071A8 @ case 62
_02006BD0:
	movs r1, #0x1b
	b _02007030
_02006BD4:
	movs r1, #0x28
	b _02007030
_02006BD8:
	movs r1, #0
	mov r0, sp
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x23
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	b _020071E6
_02006BEA:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #0xb
	bls _02006C0A
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_02006C0A:
	ldr r2, _02006C1C @ =gUnknown_02020F15
	ldrb r1, [r5]
	movs r0, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x2d
	b _02006F04
	.align 2, 0
_02006C1C: .4byte gUnknown_02020F15
_02006C20:
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006C30
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_02006C30:
	movs r0, #0x24
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x22
	movs r0, #0x30
	strb r0, [r1]
	b _020071E6
_02006C40:
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006C50
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_02006C50:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x30
	ands r0, r1
	movs r1, #0x25
	cmp r0, #0
	beq _02006C66
	b _02007030
_02006C66:
	movs r1, #0x26
	b _02007030
_02006C6A:
	ldr r2, _02006C84 @ =gUnknown_02020F15
	ldr r0, _02006C88 @ =gUnknown_0300150C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	adds r0, #0x10
	asrs r0, r0, #5
	movs r1, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x31
	b _02006F04
	.align 2, 0
_02006C84: .4byte gUnknown_02020F15
_02006C88: .4byte gUnknown_0300150C
_02006C8C:
	ldrb r0, [r4, #0x19]
	movs r1, #1
	ands r1, r0
	adds r1, #0x27
	b _02007030
_02006C96:
	ldrb r1, [r6, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006CA6
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_02006CA6:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _02006CB0
	movs r1, #0x25
	b _02007030
_02006CB0:
	subs r0, #1
	movs r1, #1
	ands r0, r1
	adds r0, #0x3a
	b _02006F04
_02006CBA:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #0x11
	bls _02006CF2
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r2, #3
	ands r0, r2
	cmp r0, #0
	bne _02006CF2
	ldrb r1, [r3, #0xf]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _02006CF2
	movs r0, #0xf       @ SE_CHAO_WALK
	bl m4aSongNumStart
_02006CF2:
	ldrb r1, [r4, #0x16]
	cmp r1, #1
	bls _02006D10
	cmp r1, #4
	bhi _02006D00
	movs r1, #1
	b _02006D12
_02006D00:
	cmp r1, #7
	bhi _02006D08
	movs r1, #2
	b _02006D12
_02006D08:
	cmp r1, #0xa
	bhi _02006D10
	movs r1, #3
	b _02006D12
_02006D10:
	movs r1, #0
_02006D12:
	mov r0, sp
	strb r1, [r0]
	cmp r1, #0
	bne _02006D24
	mov r0, r8
	strb r1, [r0]
	movs r1, #2
	mov r0, sp
	strb r1, [r0]
_02006D24:
	mov r0, sp
	ldrb r2, [r0]
	subs r2, #1
	lsls r1, r2, #1
	ldr r4, _02006D40 @ =gUnknown_02020F15
	ldrb r3, [r5]
	movs r0, #3
	ands r0, r3
	adds r0, r0, r4
	adds r1, r1, r2
	ldrb r0, [r0]
	adds r1, r1, r0
	b _02007030
	.align 2, 0
_02006D40: .4byte gUnknown_02020F15
_02006D44:
	ldrb r0, [r4, #0x16]
	cmp r0, #1
	bls _02006D62
	cmp r0, #4
	bhi _02006D52
	movs r0, #1
	b _02006D64
_02006D52:
	cmp r0, #7
	bhi _02006D5A
	movs r0, #2
	b _02006D64
_02006D5A:
	cmp r0, #0xa
	bhi _02006D62
	movs r0, #3
	b _02006D64
_02006D62:
	movs r0, #0
_02006D64:
	cmp r0, #0
	bne _02006D74
	mov r1, r8
	strb r0, [r1]
	ldrb r1, [r4, #7]
	movs r0, #0x80
	orrs r0, r1
	b _02006D7A
_02006D74:
	ldrb r1, [r4, #7]
	movs r0, #0x7f
	ands r0, r1
_02006D7A:
	strb r0, [r4, #7]
	ldr r1, [r3, #8]
	movs r0, #0x60
	ands r0, r1
	movs r2, #0x35
	cmp r0, #0
	beq _02006D8A
	movs r2, #0x36
_02006D8A:
	mov r0, sp
	strb r2, [r0]
	movs r0, #0x7f
	ands r1, r0
	cmp r1, #0x20
	beq _02006D98
	b _020071E6
_02006D98:
	ldrb r1, [r3, #0xf]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _02006DA4
	b _020071E6
_02006DA4:
	movs r0, #0x14      @ SE_SNORE
	bl m4aSongNumStart
	b _020071E6
_02006DAC:
	ldrb r1, [r4, #0x16]
	cmp r1, #1
	bls _02006DCA
	cmp r1, #4
	bhi _02006DBA
	movs r1, #1
	b _02006DCC
_02006DBA:
	cmp r1, #7
	bhi _02006DC2
	movs r1, #2
	b _02006DCC
_02006DC2:
	cmp r1, #0xa
	bhi _02006DCA
	movs r1, #3
	b _02006DCC
_02006DCA:
	movs r1, #0
_02006DCC:
	mov r0, sp
	strb r1, [r0]
	cmp r1, #0
	bne _02006DDC
	mov r0, r8
	strb r1, [r0]
	movs r1, #2
	b _02006DE2
_02006DDC:
	cmp r1, #3
	bne _02006DE6
	movs r1, #1
_02006DE2:
	mov r0, sp
	strb r1, [r0]
_02006DE6:
	mov r0, sp
	ldrb r0, [r0]
	adds r0, #0x1a
	b _02006F04
_02006DEE:
	ldrb r1, [r4, #0x16]
	cmp r1, #1
	bls _02006E0C
	cmp r1, #4
	bhi _02006DFC
	movs r1, #1
	b _02006E0E
_02006DFC:
	cmp r1, #7
	bhi _02006E04
	movs r1, #2
	b _02006E0E
_02006E04:
	cmp r1, #0xa
	bhi _02006E0C
	movs r1, #3
	b _02006E0E
_02006E0C:
	movs r1, #0
_02006E0E:
	mov r0, sp
	strb r1, [r0]
	cmp r1, #0
	bne _02006E20
	mov r0, r8
	strb r1, [r0]
	movs r1, #2
	mov r0, sp
	strb r1, [r0]
_02006E20:
	mov r0, sp
	ldrb r0, [r0]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	b _02007030
_02006E2C:
	movs r1, #0x30
	b _02007030
_02006E30:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02006E3A
	movs r1, #0x42
	b _02007030
_02006E3A:
	movs r1, #0x30
	b _02007030
_02006E3E:
	movs r1, #0
	b _02007030
_02006E42:
	movs r1, #0x2c
	b _02007030
_02006E46:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #0x11
	bls _02006E7E
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r2, #3
	ands r0, r2
	cmp r0, #0
	bne _02006E7E
	ldrb r1, [r3, #0xf]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _02006E7E
	movs r0, #0xf       @ SE_CHAO_WALK
	bl m4aSongNumStart
_02006E7E:
	ldrb r0, [r4, #0x1a]
	adds r0, #0x20
	movs r1, #0xff
	ands r0, r1
	lsrs r0, r0, #6
	mov r1, sp
	strb r0, [r1]
	cmp r0, #0
	bne _02006E9A
	mov r1, r8
	strb r0, [r1]
	movs r1, #2
	mov r0, sp
	strb r1, [r0]
_02006E9A:
	mov r0, sp
	ldrb r2, [r0]
	subs r2, #1
	lsls r1, r2, #1
	ldr r4, _02006EB4 @ =gUnknown_02020F15
	ldrb r3, [r5]
	movs r0, #3
	ands r0, r3
	adds r0, r0, r4
	adds r1, r1, r2
	ldrb r0, [r0]
	adds r1, r1, r0
	b _02007030
	.align 2, 0
_02006EB4: .4byte gUnknown_02020F15
_02006EB8:
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006EC8
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_02006EC8:
	movs r1, #0x1c
	b _02007030
_02006ECC:
	ldr r0, [r3, #8]
	movs r1, #0x18
	ands r0, r1
	movs r1, #0x3e
	cmp r0, #0
	bne _02006EDA
	b _02007030
_02006EDA:
	movs r1, #0x3f
	b _02007030
_02006EDE:
	ldr r0, [r3, #8]
	movs r1, #0x18
	ands r0, r1
	movs r1, #0x40
	cmp r0, #0
	bne _02006EEC
	b _02007030
_02006EEC:
	movs r1, #0x41
	b _02007030
_02006EF0:
	ldrb r1, [r4, #0x19]
	adds r2, r1, #0
	cmp r2, #0
	bne _02006EFE
	mov r0, sp
	strb r2, [r0]
	b _020071E6
_02006EFE:
	movs r0, #1
	ands r0, r1
	adds r0, #0x2b
_02006F04:
	mov r1, sp
	strb r0, [r1]
	b _020071E6
_02006F0A:
	ldrb r0, [r4, #0x19]
	cmp r0, #7
	bhi _02006F40
	lsls r0, r0, #2
	ldr r1, _02006F1C @ =_02006F20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02006F1C: .4byte _02006F20
_02006F20: @ jump table
	.4byte _02006F40 @ case 0
	.4byte _02006F44 @ case 1
	.4byte _02006F48 @ case 2
	.4byte _02006F48 @ case 3
	.4byte _02006F48 @ case 4
	.4byte _02006F48 @ case 5
	.4byte _02006F44 @ case 6
	.4byte _02006F44 @ case 7
_02006F40:
	movs r1, #0
	b _02007030
_02006F44:
	movs r1, #0x3c
	b _02007030
_02006F48:
	movs r1, #0x3d
	b _02007030
_02006F4C:
	ldrb r0, [r4, #0x19]
	cmp r0, #7
	bhi _02006F80
	lsls r0, r0, #2
	ldr r1, _02006F5C @ =_02006F60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02006F5C: .4byte _02006F60
_02006F60: @ jump table
	.4byte _02006F80 @ case 0
	.4byte _02006F80 @ case 1
	.4byte _02006F80 @ case 2
	.4byte _02006F84 @ case 3
	.4byte _02006F88 @ case 4
	.4byte _02006F84 @ case 5
	.4byte _02006F88 @ case 6
	.4byte _02006F84 @ case 7
_02006F80:
	movs r1, #0x1d
	b _02007030
_02006F84:
	movs r1, #0x1e
	b _02007030
_02006F88:
	movs r1, #0x1f
	b _02007030
_02006F8C:
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	beq _02006F9E
	cmp r0, #1
	ble _02006F9A
	cmp r0, #3
	ble _02006FA2
_02006F9A:
	movs r1, #0
	b _02007030
_02006F9E:
	movs r1, #0x29
	b _02007030
_02006FA2:
	movs r1, #0x2a
	b _02007030
_02006FA6:
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	beq _02006FB8
	cmp r0, #1
	ble _02006FB4
	cmp r0, #3
	ble _02006FBC
_02006FB4:
	movs r1, #0
	b _02007030
_02006FB8:
	movs r1, #0x20
	b _02007030
_02006FBC:
	movs r1, #0x21
	b _02007030
_02006FC0:
	movs r1, #0x34
	b _02007030
_02006FC4:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #9
	bls _02006FE4
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_02006FE4:
	ldrb r1, [r4, #0x16]
	cmp r1, #1
	bls _02007002
	cmp r1, #4
	bhi _02006FF2
	movs r1, #1
	b _02007004
_02006FF2:
	cmp r1, #7
	bhi _02006FFA
	movs r1, #2
	b _02007004
_02006FFA:
	cmp r1, #0xa
	bhi _02007002
	movs r1, #3
	b _02007004
_02007002:
	movs r1, #0
_02007004:
	mov r0, sp
	strb r1, [r0]
	cmp r1, #0
	bne _02007016
	mov r0, r8
	strb r1, [r0]
	movs r1, #2
	mov r0, sp
	strb r1, [r0]
_02007016:
	mov r0, sp
	ldrb r2, [r0]
	subs r2, #1
	lsls r1, r2, #1
	ldr r4, _02007038 @ =gUnknown_02020F15
	ldrb r3, [r5]
	movs r0, #3
	ands r0, r3
	adds r0, r0, r4
	adds r1, r1, r2
	ldrb r0, [r0]
	adds r1, r1, r0
	adds r1, #9
_02007030:
	mov r0, sp
	strb r1, [r0]
	b _020071E6
	.align 2, 0
_02007038: .4byte gUnknown_02020F15
_0200703C:
	ldrb r0, [r4, #0x19]
	mov r1, sp
	cmp r0, #0x1f
	bls _0200705E
	cmp r0, #0x60
	bhi _0200704A
	b _02007162
_0200704A:
	cmp r0, #0x9f
	bhi _02007054
	movs r0, #3
	strb r0, [r1]
	b _020071E6
_02007054:
	cmp r0, #0xe0
	bhi _0200705E
	movs r0, #6
	strb r0, [r1]
	b _020071E6
_0200705E:
	movs r0, #3
	strb r0, [r1]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	b _020071E6
_0200706A:
	ldrb r0, [r4, #0x19]
	mov r1, sp
	cmp r0, #0x1f
	bls _0200708A
	cmp r0, #0x60
	bhi _0200707A
	movs r0, #0
	b _02007092
_0200707A:
	cmp r0, #0x9f
	bhi _02007082
	movs r0, #3
	b _02007092
_02007082:
	cmp r0, #0xe0
	bhi _0200708A
	movs r0, #6
	b _02007092
_0200708A:
	movs r0, #3
	strb r0, [r1]
	movs r0, #0
	mov r1, r8
_02007092:
	strb r0, [r1]
	mov r1, sp
	mov r0, sp
	ldrb r0, [r0]
	adds r0, #1
	strb r0, [r1]
	b _020071E6
_020070A0:
	ldrb r0, [r4, #0x19]
	mov r1, sp
	cmp r0, #0x1f
	bls _020070C0
	cmp r0, #0x60
	bhi _020070B0
	movs r0, #0
	b _020070C8
_020070B0:
	cmp r0, #0x9f
	bhi _020070B8
	movs r0, #3
	b _020070C8
_020070B8:
	cmp r0, #0xe0
	bhi _020070C0
	movs r0, #6
	b _020070C8
_020070C0:
	movs r0, #3
	strb r0, [r1]
	movs r0, #0
	mov r1, r8
_020070C8:
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #3
	bls _020070EA
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_020070EA:
	mov r4, sp
	mov r3, sp
	ldr r2, _02007104 @ =gUnknown_02020F15
	ldrb r1, [r5]
	movs r0, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r3, [r3]
	adds r0, r0, r3
	strb r0, [r4]
	b _020071E6
	.align 2, 0
_02007104: .4byte gUnknown_02020F15
_02007108:
	ldrb r1, [r4, #0x1a]
	adds r5, r6, #0
	adds r5, #0x23
	cmp r1, #0
	bne _0200711E
	movs r0, #1
	strb r0, [r4, #0x1a]
	strb r1, [r5]
	adds r0, r6, #0
	adds r0, #0x22
	strb r1, [r0]
_0200711E:
	ldrb r0, [r5]
	cmp r0, #0xb
	bhi _02007140
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _02007140
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_02007140:
	mov r3, sp
	ldr r2, _02007168 @ =gUnknown_02020F15
	ldrb r1, [r5]
	movs r0, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x2d
	strb r0, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xb
	bls _020071E6
	ldrb r0, [r4, #0x17]
	cmp r0, #0x3c
	bne _020071E6
	mov r1, sp
_02007162:
	movs r0, #0
	strb r0, [r1]
	b _020071E6
	.align 2, 0
_02007168: .4byte gUnknown_02020F15
_0200716C:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	movs r4, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #7
	bls _0200718C
	strb r4, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0200718C:
	mov r2, sp
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	adds r0, #0x22
	strb r0, [r2]
	ldr r0, [r3, #8]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _020071E6
	mov r0, r8
	strb r4, [r0]
	b _020071E6
_020071A8:
	adds r1, r6, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	movs r7, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r6, #0
	adds r5, #0x23
	cmp r0, #9
	bls _020071C8
	strb r7, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_020071C8:
	mov r3, sp
	ldr r2, _020071F4 @ =gUnknown_02020F15
	ldrb r1, [r5]
	movs r0, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x37
	strb r0, [r3]
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _020071E6
	mov r0, r8
	strb r7, [r0]
_020071E6:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _020071FC
	ldr r0, _020071F8 @ =gUnknown_020203B4
	b _020071FE
	.align 2, 0
_020071F4: .4byte gUnknown_02020F15
_020071F8: .4byte gUnknown_020203B4
_020071FC:
	ldr r0, _0200723C @ =gUnknown_020203D4
_020071FE:
	str r0, [r6, #0x10]
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r6, #0x14]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r6, #0x19]
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r6, #0x1e]
_0200721C:
	ldrb r1, [r6, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200722E
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #0x1d]
	bl sub_02001398
_0200722E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200723C: .4byte gUnknown_020203D4

	thumb_func_start sub_02007240
sub_02007240: @ 0x02007240
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _02007268 @ =gUnknown_03003330
	ldrb r2, [r1, #0xf]
	movs r3, #0x10
	adds r0, r3, #0
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _02007256
	b _02007396
_02007256:
	ldr r0, _0200726C @ =gUnknown_0300152E
	ldrb r0, [r0]
	cmp r0, #0
	bne _02007270
	adds r0, r4, #0
	bl sub_02000ed4
	b _02007396
	.align 2, 0
_02007268: .4byte gUnknown_03003330
_0200726C: .4byte gUnknown_0300152E
_02007270:
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _020072A0 @ =gUnknown_03004400
	adds r5, r0, r1
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0200728A
	b _02007384
_0200728A:
	strb r0, [r4, #0x17]
	ldrb r0, [r5, #7]
	movs r1, #0x78
	ands r1, r0
	cmp r1, #0x10
	beq _020072B8
	cmp r1, #0x10
	bgt _020072A4
	cmp r1, #8
	beq _020072C6
	b _020072AC
	.align 2, 0
_020072A0: .4byte gUnknown_03004400
_020072A4:
	cmp r1, #0x20
	beq _020072B4
	cmp r1, #0x40
	beq _020072B0
_020072AC:
	movs r1, #0
	b _0200730C
_020072B0:
	movs r1, #1
	b _0200730C
_020072B4:
	movs r1, #2
	b _0200730C
_020072B8:
	ldr r0, [r6, #8]
	ands r0, r3
	movs r1, #4
	cmp r0, #0
	beq _0200730C
	movs r1, #3
	b _0200730C
_020072C6:
	ldr r0, _020072DC @ =gUnknown_03001510
	ldr r0, [r0]
	ldrb r0, [r0, #0x17]
	cmp r0, #0x3d
	bne _020072E0
	movs r0, #0x1e
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _020072FE
	b _020072FC
	.align 2, 0
_020072DC: .4byte gUnknown_03001510
_020072E0:
	cmp r0, #0x39
	bne _020072FE
	movs r0, #0x1e
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _020072FC
	ldr r1, _0200739C @ =0xFFFFFE26
	adds r0, r1, #0
	ldrh r1, [r5, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x12
	bhi _020072FE
_020072FC:
	strb r3, [r4, #0x17]
_020072FE:
	ldr r0, [r6, #8]
	movs r1, #8
	ands r0, r1
	movs r1, #6
	cmp r0, #0
	beq _0200730C
	movs r1, #5
_0200730C:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x15
	ldr r1, _020073A0 @ =gUnknown_020203FC
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r2, _020073A4 @ =gUnknown_02020494
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r2, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	movs r0, #0x1e
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0200733C
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	subs r0, #6
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0200733C:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #3
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	ldrh r1, [r4, #0x22]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #2
	ldr r1, [r4, #0x20]
	adds r1, r1, r0
	str r1, [r4, #0x20]
	ldrb r0, [r4, #0x19]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	bl Div
	ldrh r1, [r4, #0x22]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	ldrb r0, [r4, #0x19]
	adds r0, #4
	strb r0, [r4, #0x19]
_02007384:
	ldrb r1, [r5, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _02007396
	ldrb r0, [r4, #4]
	ldrb r1, [r5, #0x1d]
	bl sub_02001398
_02007396:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200739C: .4byte 0xFFFFFE26
_020073A0: .4byte gUnknown_020203FC
_020073A4: .4byte gUnknown_02020494

	thumb_func_start sub_020073a8
sub_020073a8: @ 0x020073a8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _020073CC @ =gUnknown_03003330
	ldrb r3, [r0, #0xf]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _020073BA
	b _020074B0
_020073BA:
	ldr r0, _020073D0 @ =gUnknown_0300152E
	ldrb r0, [r0]
	cmp r0, #0
	bne _020073D4
	adds r0, r2, #0
	bl sub_02000ed4
	b _020074B0
	.align 2, 0
_020073CC: .4byte gUnknown_03003330
_020073D0: .4byte gUnknown_0300152E
_020073D4:
	ldrb r1, [r2, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _020073FC @ =gUnknown_03004400
	adds r5, r0, r1
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _02007442
	ldrb r1, [r5, #7]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _02007400
	movs r0, #1
	strb r0, [r2, #7]
	b _02007442
	.align 2, 0
_020073FC: .4byte gUnknown_03004400
_02007400:
	ldrb r0, [r2, #7]
	cmp r0, #0
	bne _0200742A
	ldrb r1, [r2, #0x19]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	movs r4, #0xb4
	cmp r0, #0
	beq _02007416
	movs r4, #0xb
_02007416:
	ldrb r0, [r2, #0x1a]
	adds r0, #1
	strb r0, [r2, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	blo _020074B0
	strb r3, [r2, #0x1a]
	strb r5, [r2, #7]
	b _020074B0
_0200742A:
	ldrb r0, [r2, #0x1a]
	adds r0, #1
	strb r0, [r2, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _02007442
	strb r3, [r2, #0x1a]
	strb r3, [r2, #7]
	ldrb r0, [r2, #0x19]
	adds r0, #1
	strb r0, [r2, #0x19]
_02007442:
	ldrb r4, [r5, #0x19]
	ldr r1, _020074B8 @ =gUnknown_02020494
	lsls r0, r4, #2
	adds r3, r0, r4
	adds r0, r1, #2
	adds r0, r3, r0
	ldrb r7, [r0]
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _020074B0
	adds r0, r1, #4
	adds r0, r3, r0
	ldrb r3, [r0]
	movs r0, #0x1e
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _02007472
	rsbs r0, r6, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r3, #0
	beq _02007472
	movs r3, #1
_02007472:
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	ldrh r6, [r5, #0xa]
	adds r0, r0, r6
	strh r0, [r2, #0xa]
	lsls r0, r4, #2
	adds r0, r0, r4
	adds r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	lsls r0, r3, #3
	ldr r1, _020074BC @ =gUnknown_02020434
	adds r0, r0, r1
	str r0, [r2, #0x10]
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _020074B0
	ldrb r1, [r5, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _020074B0
	ldrb r0, [r2, #4]
	ldrb r1, [r5, #0x1d]
	bl sub_02001398
_020074B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020074B8: .4byte gUnknown_02020494
_020074BC: .4byte gUnknown_02020434

	thumb_func_start sub_020074c0
sub_020074c0: @ 0x020074c0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x13
	strb r0, [r1, #0x1d]
	strh r0, [r1, #0xe]
	ldr r0, _020074E0 @ =gUnknown_02020634
	str r0, [r1, #0x10]
	ldr r0, _020074E4 @ =0x0000010D
	strh r0, [r1, #0x14]
	ldrb r0, [r1, #0x1a]
	cmp r0, #0
	beq _020074E8
	movs r0, #0x7c
	strh r0, [r1, #0xa]
	movs r0, #0xcc
	b _020074EE
	.align 2, 0
_020074E0: .4byte gUnknown_02020634
_020074E4: .4byte 0x0000010D
_020074E8:
	movs r0, #0x9c
	strh r0, [r1, #0xa]
	movs r0, #0xbc
_020074EE:
	strb r0, [r1, #0x18]
	movs r0, #4
	strb r0, [r1, #0x1c]
	ldr r0, _020074FC @ =Task_8019898
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_020074FC: .4byte Task_8019898

	thumb_func_start sub_02007500
sub_02007500: @ 0x02007500
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	movs r5, #0
	ldr r0, _02007564 @ =gUnknown_030015D0
	mov sb, r0
	ldr r7, _02007568 @ =gUnknown_0202069C
	movs r4, #0
_02007516:
	adds r3, r7, #0
	mov r1, sb
	adds r2, r4, r1
	movs r6, #4
_0200751E:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, #1
	cmp r6, #0
	bge _0200751E
	adds r4, #0x28
	adds r5, #1
	cmp r5, #0x15
	ble _02007516
	movs r5, #0
	ldr r2, _02007564 @ =gUnknown_030015D0
	mov sb, r2
_02007536:
	ldr r0, _0200756C @ =gUnknown_02012548
	lsls r4, r5, #2
	adds r0, r4, r0
	ldr r0, [r0]
	mov r1, sp
	movs r2, #5
	movs r3, #1
	bl sub_020015cc
	movs r6, #4
	adds r7, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	add r2, sp, #4
	mov r0, sb
	adds r3, r0, r4
_02007556:
	ldrb r1, [r2]
	cmp r1, #0
	beq _02007570
	adds r0, r1, #0
	subs r0, #1
	strh r0, [r3]
	b _0200757C
	.align 2, 0
_02007564: .4byte gUnknown_030015D0
_02007568: .4byte gUnknown_0202069C
_0200756C: .4byte gUnknown_02012548
_02007570:
	movs r0, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r4
	add r0, sb
	strb r1, [r0, #7]
_0200757C:
	subs r2, #1
	adds r3, #8
	subs r6, #1
	cmp r6, #0
	bge _02007556
	adds r5, r7, #0
	cmp r5, #6
	ble _02007536
	cmp r5, #0x12
	bgt _020075EC
	ldr r1, _020075C8 @ =gUnknown_030015D0
	mov sb, r1
_02007594:
	ldr r1, _020075CC @ =gUnknown_02012564
	subs r0, r5, #7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, sp
	movs r2, #5
	movs r3, #1
	bl sub_020015cc
	movs r6, #4
	lsls r0, r5, #2
	adds r7, r5, #1
	adds r0, r0, r5
	lsls r4, r0, #3
	add r2, sp, #4
	mov r0, sb
	adds r3, r0, r4
_020075B8:
	ldrb r1, [r2]
	cmp r1, #0
	beq _020075D0
	adds r0, r1, #0
	subs r0, #1
	strh r0, [r3]
	b _020075DC
	.align 2, 0
_020075C8: .4byte gUnknown_030015D0
_020075CC: .4byte gUnknown_02012564
_020075D0:
	movs r0, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r4
	add r0, sb
	strb r1, [r0, #7]
_020075DC:
	subs r2, #1
	adds r3, #8
	subs r6, #1
	cmp r6, #0
	bge _020075B8
	adds r5, r7, #0
	cmp r5, #0x12
	ble _02007594
_020075EC:
	cmp r5, #0x15
	bgt _0200764C
	ldr r1, _02007628 @ =gUnknown_030015D0
	mov sb, r1
_020075F4:
	ldr r1, _0200762C @ =gUnknown_02012594
	adds r0, r5, #0
	subs r0, #0x13
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, sp
	movs r2, #5
	movs r3, #1
	bl sub_020015cc
	movs r6, #4
	lsls r0, r5, #2
	adds r7, r5, #1
	adds r0, r0, r5
	lsls r4, r0, #3
	add r2, sp, #4
	mov r0, sb
	adds r3, r0, r4
_0200761A:
	ldrb r1, [r2]
	cmp r1, #0
	beq _02007630
	adds r0, r1, #0
	subs r0, #1
	strh r0, [r3]
	b _0200763C
	.align 2, 0
_02007628: .4byte gUnknown_030015D0
_0200762C: .4byte gUnknown_02012594
_02007630:
	movs r0, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r4
	add r0, sb
	strb r1, [r0, #7]
_0200763C:
	subs r2, #1
	adds r3, #8
	subs r6, #1
	cmp r6, #0
	bge _0200761A
	adds r5, r7, #0
	cmp r5, #0x15
	ble _020075F4
_0200764C:
	movs r1, #0
	ldr r0, _02007678 @ =0x0000FFD0
	mov r2, r8
	strh r0, [r2, #0xa]
	movs r0, #0x50
	strh r0, [r2, #0xe]
	ldr r0, _0200767C @ =gUnknown_0202063C
	str r0, [r2, #0x10]
	ldr r0, _02007680 @ =0x00000115
	strh r0, [r2, #0x14]
	movs r0, #0xfc
	strb r0, [r2, #0x18]
	strb r1, [r2, #0x1e]
	ldr r0, _02007684 @ =sub_02007688
	str r0, [r2]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02007678: .4byte 0x0000FFD0
_0200767C: .4byte gUnknown_0202063C
_02007680: .4byte 0x00000115
_02007684: .4byte sub_02007688

	thumb_func_start sub_02007688
sub_02007688: @ 0x02007688
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r5, _020076CC @ =gUnknown_03003330
	ldrb r1, [r5, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0200769C
	b _02007962
_0200769C:
	ldr r4, _020076D0 @ =gUnknown_03003B80
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _020076A8
	subs r0, #1
	str r0, [r4, #0x14]
_020076A8:
	ldrb r2, [r5, #0xf]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _020076B4
	b _02007944
_020076B4:
	movs r0, #0x1e
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _02007704
	ldrh r1, [r6, #0xa]
	movs r3, #0xa
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bge _020076D4
	adds r0, r1, #4
	strh r0, [r6, #0xa]
	b _02007944
	.align 2, 0
_020076CC: .4byte gUnknown_03003330
_020076D0: .4byte gUnknown_03003B80
_020076D4:
	ldr r0, _020076FC @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _020076F6
	movs r0, #0x24
	ands r0, r2
	cmp r0, #0
	bne _020076F6
	ldr r0, _02007700 @ =gUnknown_0300150C
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _020076F6
	b _02007944
_020076F6:
	movs r0, #0
	strb r0, [r6, #0x1e]
	b _02007944
	.align 2, 0
_020076FC: .4byte gUnknown_030043F0
_02007700: .4byte gUnknown_0300150C
_02007704:
	ldrh r3, [r6, #0xa]
	movs r0, #0xa
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	ble _02007718
	subs r0, r3, #4
	strh r0, [r6, #0xa]
	b _02007944
_02007718:
	ldr r0, _020077A4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02007728
	b _02007944
_02007728:
	movs r0, #0x24
	ands r0, r2
	cmp r0, #0
	beq _02007732
	b _02007944
_02007732:
	ldr r0, _020077A8 @ =gUnknown_0300150C
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0200773E
	b _02007944
_0200773E:
	movs r0, #1
	strb r0, [r6, #0x1e]
	adds r0, r3, #4
	strh r0, [r6, #0xa]
	ldrb r0, [r4, #0x1c]
	cmp r0, #0xff
	bne _02007756
	ldr r0, [r5, #8]
	movs r1, #5
	bl Mod
	strb r0, [r4, #0x1c]
_02007756:
	movs r4, #0
	movs r5, #0x1a
_0200775A:
	ldr r0, _020077AC @ =sub_02008b3c
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strh r5, [r1, #0xe]
	ldr r0, _020077B0 @ =gUnknown_02012541
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1, #0x1a]
	ldrb r0, [r6, #4]
	strb r0, [r1, #0x1b]
	adds r5, #0x10
	adds r4, #1
	cmp r4, #6
	ble _0200775A
	ldr r5, _020077B4 @ =gUnknown_03003B80
	adds r0, r5, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0200778A
	b _020078CC
_0200778A:
	ldr r0, _020077B8 @ =gUnknown_03001501
	ldrb r0, [r0]
	cmp r0, #0
	beq _02007794
	b _020078CC
_02007794:
	adds r0, r5, #0
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _020077BC
	movs r4, #0
	b _020078BA
	.align 2, 0
_020077A4: .4byte gUnknown_030043F0
_020077A8: .4byte gUnknown_0300150C
_020077AC: .4byte sub_02008b3c
_020077B0: .4byte gUnknown_02012541
_020077B4: .4byte gUnknown_03003B80
_020077B8: .4byte gUnknown_03001501
_020077BC:
	ldr r1, _020077C8 @ =gUnknown_03001530
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _020077CC
	adds r4, r0, #0
	b _020078BA
	.align 2, 0
_020077C8: .4byte gUnknown_03001530
_020077CC:
	adds r0, r5, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200784C
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r1, _0200780C @ =0x1FFF0000
	cmp r0, r1
	bgt _0200784C
	movs r4, #0
	ldrb r2, [r5, #0x1c]
_020077E6:
	adds r1, r4, r2
	cmp r1, #4
	ble _020077EE
	subs r1, #5
_020077EE:
	mov r3, sp
	adds r0, r3, r4
	strb r1, [r0]
	adds r4, #1
	cmp r4, #4
	ble _020077E6
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, _02007810 @ =0x000040A3
	cmp r4, r0
	bgt _02007814
	movs r1, #1
	b _0200783E
	.align 2, 0
_0200780C: .4byte 0x1FFF0000
_02007810: .4byte 0x000040A3
_02007814:
	ldr r0, _02007820 @ =0x00004147
	cmp r4, r0
	bgt _02007824
	movs r1, #0
	b _0200783E
	.align 2, 0
_02007820: .4byte 0x00004147
_02007824:
	ldr r0, _02007830 @ =0x00004B84
	cmp r4, r0
	bgt _02007834
	movs r1, #3
	b _0200783E
	.align 2, 0
_02007830: .4byte 0x00004B84
_02007834:
	ldr r0, _02007848 @ =0x000065C1
	movs r1, #2
	cmp r4, r0
	bgt _0200783E
	movs r1, #4
_0200783E:
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r4, r0, #7
	b _020078B6
	.align 2, 0
_02007848: .4byte 0x000065C1
_0200784C:
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, _02007860 @ =0x00001999
	cmp r4, r0
	bgt _02007864
	movs r4, #0
	b _020078B6
	.align 2, 0
_02007860: .4byte 0x00001999
_02007864:
	ldr r0, _02007870 @ =0x00003332
	cmp r4, r0
	bgt _02007874
	movs r4, #2
	b _020078B6
	.align 2, 0
_02007870: .4byte 0x00003332
_02007874:
	ldr r0, _02007880 @ =0x00004665
	cmp r4, r0
	bgt _02007884
	movs r4, #1
	b _020078B6
	.align 2, 0
_02007880: .4byte 0x00004665
_02007884:
	ldr r0, _02007890 @ =0x00005998
	cmp r4, r0
	bgt _02007894
	movs r4, #3
	b _020078B6
	.align 2, 0
_02007890: .4byte 0x00005998
_02007894:
	ldr r0, _020078A0 @ =0x00006665
	cmp r4, r0
	bgt _020078A4
	movs r4, #4
	b _020078B6
	.align 2, 0
_020078A0: .4byte 0x00006665
_020078A4:
	ldr r0, _020078B0 @ =0x00007332
	cmp r4, r0
	bgt _020078B4
	movs r4, #6
	b _020078B6
	.align 2, 0
_020078B0: .4byte 0x00007332
_020078B4:
	movs r4, #5
_020078B6:
	ldr r0, _020078E8 @ =gUnknown_03001530
	strb r4, [r0]
_020078BA:
	ldr r0, _020078EC @ =sub_02008b7c
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r4, [r1, #0x1a]
	ldrb r0, [r6, #4]
	strb r0, [r1, #0x1b]
_020078CC:
	ldr r1, _020078F0 @ =gUnknown_03003B80
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r4, [r0]
	cmp r4, #0
	bne _020078F8
	ldr r0, _020078F4 @ =sub_02008bc4
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r4, [r1, #0x1a]
	b _02007938
	.align 2, 0
_020078E8: .4byte gUnknown_03001530
_020078EC: .4byte sub_02008b7c
_020078F0: .4byte gUnknown_03003B80
_020078F4: .4byte sub_02008bc4
_020078F8:
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r0, [r0]
	cmp r0, #0
	bne _02007918
	ldr r0, _02007914 @ =sub_02008bc4
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r0, #1
	b _02007936
	.align 2, 0
_02007914: .4byte sub_02008bc4
_02007918:
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200793C
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0200793C
	ldr r0, _0200796C @ =sub_02008bc4
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r0, #2
_02007936:
	strb r0, [r1, #0x1a]
_02007938:
	ldrb r0, [r6, #4]
	strb r0, [r1, #0x1b]
_0200793C:
	ldr r0, _02007970 @ =gUnknown_03003B80
	adds r0, #0xce
	movs r1, #1
	strb r1, [r0]
_02007944:
	ldr r2, _02007974 @ =gUnknown_03001528
	ldrh r0, [r6, #0xa]
	adds r1, r0, #0
	adds r1, #0x3b
	strb r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	rsbs r1, r1, #0
	cmp r0, r1
	ble _02007962
	ldrb r0, [r6, #4]
	movs r1, #0xa0
	bl sub_02001398
_02007962:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200796C: .4byte sub_02008bc4
_02007970: .4byte gUnknown_03003B80
_02007974: .4byte gUnknown_03001528

	thumb_func_start sub_02007978
sub_02007978: @ 0x02007978
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _020079B0 @ =gUnknown_03003330
	ldrb r3, [r1, #0xf]
	movs r0, #0x10
	ands r0, r3
	adds r6, r1, #0
	cmp r0, #0
	beq _0200798C
	b _02007AFA
_0200798C:
	ldr r2, _020079B4 @ =gUnknown_03004400
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r5, [r0, #0xa]
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _020079B8
	adds r0, r4, #0
	bl sub_02000ed4
	b _02007AFA
	.align 2, 0
_020079B0: .4byte gUnknown_03003330
_020079B4: .4byte gUnknown_03004400
_020079B8:
	cmp r1, #0
	bge _020079BE
	b _02007AEA
_020079BE:
	ldr r0, _02007A38 @ =gUnknown_0300150C
	ldr r1, [r0]
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0x33
	ble _020079CC
	b _02007AEA
_020079CC:
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _020079D4
	b _02007AEA
_020079D4:
	ldr r0, _02007A3C @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	beq _020079DE
	b _02007AEA
_020079DE:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _020079E8
	b _02007AEA
_020079E8:
	ldrh r0, [r1, #0xe]
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _02007AEA
	subs r0, #0x10
	cmp r0, r1
	bge _02007AEA
	ldr r2, _02007A40 @ =gUnknown_03005274
	ldr r1, _02007A44 @ =gUnknown_02012548
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	blo _02007A18
	ldr r0, _02007A48 @ =gUnknown_0300159A
	ldrb r0, [r0]
	cmp r0, #7
	bls _02007A50
_02007A18:
	ldr r2, _02007A4C @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007AEA
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02007AEA
	movs r0, #0x1c
	bl m4aSongNumStart
	b _02007AEA
	.align 2, 0
_02007A38: .4byte gUnknown_0300150C
_02007A3C: .4byte gUnknown_03001509
_02007A40: .4byte gUnknown_03005274
_02007A44: .4byte gUnknown_02012548
_02007A48: .4byte gUnknown_0300159A
_02007A4C: .4byte gUnknown_030043F0
_02007A50:
	ldr r2, _02007AC4 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007AE0
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02007AE0
	movs r0, #0x19
	bl m4aSongNumStart
	movs r2, #0
	ldr r0, _02007AC8 @ =gUnknown_03003B80
	adds r1, r0, #0
	adds r1, #0x5a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _02007A88
_02007A7A:
	adds r2, #1
	cmp r2, #7
	bgt _02007A88
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _02007A7A
_02007A88:
	ldr r0, _02007AC8 @ =gUnknown_03003B80
	adds r0, #0x5a
	adds r0, r2, r0
	ldrb r1, [r4, #0x1a]
	strb r1, [r0]
	strb r2, [r4, #0x19]
	ldr r1, _02007ACC @ =gUnknown_0300159A
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, _02007AD0 @ =gUnknown_03005274
	ldr r1, _02007AD4 @ =gUnknown_02012548
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r2]
	ldr r0, _02007AD8 @ =gUnknown_0300150C
	ldr r0, [r0]
	movs r1, #1
	strb r1, [r0, #7]
	ldr r0, _02007ADC @ =gUnknown_0300152C
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_02008c9c
	b _02007AFA
	.align 2, 0
_02007AC4: .4byte gUnknown_030043F0
_02007AC8: .4byte gUnknown_03003B80
_02007ACC: .4byte gUnknown_0300159A
_02007AD0: .4byte gUnknown_03005274
_02007AD4: .4byte gUnknown_02012548
_02007AD8: .4byte gUnknown_0300150C
_02007ADC: .4byte gUnknown_0300152C
_02007AE0:
	ldr r0, [r6, #8]
	movs r1, #0x18
	ands r0, r1
	cmp r0, #0
	beq _02007AFA
_02007AEA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, #8
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	movs r1, #0xa1
	bl sub_02001398
_02007AFA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_02007b00
sub_02007b00: @ 0x02007b00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r1, _02007B40 @ =gUnknown_03003330
	ldrb r3, [r1, #0xf]
	movs r0, #0x10
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _02007B1A
	b _02007C3E
_02007B1A:
	ldr r2, _02007B44 @ =gUnknown_03004400
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0xa]
	mov r8, r1
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _02007B48
	adds r0, r4, #0
	bl sub_02000ed4
	b _02007C3E
	.align 2, 0
_02007B40: .4byte gUnknown_03003330
_02007B44: .4byte gUnknown_03004400
_02007B48:
	cmp r1, #0
	blt _02007C2C
	ldr r0, _02007BB8 @ =gUnknown_0300150C
	mov sb, r0
	ldr r1, [r0]
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0x33
	bgt _02007C2C
	ldrb r0, [r1, #7]
	cmp r0, #0
	bne _02007C2C
	ldr r0, _02007BBC @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	bne _02007C2C
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _02007C2C
	ldrh r0, [r1, #0xe]
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _02007C2C
	subs r0, #0x10
	cmp r0, r1
	bge _02007C2C
	ldr r5, _02007BC0 @ =gUnknown_03005274
	ldr r7, _02007BC4 @ =gUnknown_02012564
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r5]
	ldr r0, [r0]
	cmp r1, r0
	bhs _02007BCC
	ldr r2, _02007BC8 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007C2C
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02007C2C
	movs r0, #0x1c
	bl m4aSongNumStart
	b _02007C2C
	.align 2, 0
_02007BB8: .4byte gUnknown_0300150C
_02007BBC: .4byte gUnknown_03001509
_02007BC0: .4byte gUnknown_03005274
_02007BC4: .4byte gUnknown_02012564
_02007BC8: .4byte gUnknown_030043F0
_02007BCC:
	ldr r2, _02007C14 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r6, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007C20
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02007C20
	movs r0, #0x19
	bl m4aSongNumStart
	ldr r0, _02007C18 @ =gUnknown_03003B80
	ldrb r1, [r4, #0x1a]
	adds r0, #0x59
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r5]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r5]
	mov r1, sb
	ldr r0, [r1]
	strb r6, [r0, #7]
	ldr r0, _02007C1C @ =gUnknown_0300152C
	strb r6, [r0]
	adds r0, r4, #0
	bl sub_02008cd4
	b _02007C3E
	.align 2, 0
_02007C14: .4byte gUnknown_030043F0
_02007C18: .4byte gUnknown_03003B80
_02007C1C: .4byte gUnknown_0300152C
_02007C20:
	mov r2, ip
	ldr r0, [r2, #8]
	movs r1, #0x18
	ands r0, r1
	cmp r0, #0
	beq _02007C3E
_02007C2C:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, #8
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	movs r1, #0xa1
	bl sub_02001398
_02007C3E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02007C4C
sub_02007C4C: @ 0x02007C4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r1, _02007C8C @ =gUnknown_03003330
	ldrb r3, [r1, #0xf]
	movs r0, #0x10
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _02007C66
	b _02007D92
_02007C66:
	ldr r2, _02007C90 @ =gUnknown_03004400
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0xa]
	mov r8, r1
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _02007C94
	adds r0, r4, #0
	bl sub_02000ed4
	b _02007D92
	.align 2, 0
_02007C8C: .4byte gUnknown_03003330
_02007C90: .4byte gUnknown_03004400
_02007C94:
	cmp r1, #0
	blt _02007D80
	ldr r0, _02007D04 @ =gUnknown_0300150C
	mov sb, r0
	ldr r1, [r0]
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0x33
	bgt _02007D80
	ldrb r0, [r1, #7]
	cmp r0, #0
	bne _02007D80
	ldr r0, _02007D08 @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	bne _02007D80
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _02007D80
	ldrh r0, [r1, #0xe]
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _02007D80
	subs r0, #0x10
	cmp r0, r1
	bge _02007D80
	ldr r5, _02007D0C @ =gUnknown_03005274
	ldr r7, _02007D10 @ =gUnknown_02012594
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r5]
	ldr r0, [r0]
	cmp r1, r0
	bhs _02007D18
	ldr r2, _02007D14 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007D80
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02007D80
	movs r0, #0x1c
	bl m4aSongNumStart
	b _02007D80
	.align 2, 0
_02007D04: .4byte gUnknown_0300150C
_02007D08: .4byte gUnknown_03001509
_02007D0C: .4byte gUnknown_03005274
_02007D10: .4byte gUnknown_02012594
_02007D14: .4byte gUnknown_030043F0
_02007D18:
	ldr r2, _02007D64 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r6, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007D74
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _02007D74
	movs r0, #0x19
	bl m4aSongNumStart
	ldrb r0, [r4, #0x1a]
	cmp r0, #1
	bne _02007D42
	ldr r1, _02007D68 @ =gUnknown_03003B80
	ldr r0, _02007D6C @ =0x00034BC0
	str r0, [r1, #0x14]
_02007D42:
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r5]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r5]
	mov r1, sb
	ldr r0, [r1]
	strb r6, [r0, #7]
	ldr r0, _02007D70 @ =gUnknown_0300152C
	strb r6, [r0]
	adds r0, r4, #0
	bl sub_02008d04
	b _02007D92
	.align 2, 0
_02007D64: .4byte gUnknown_030043F0
_02007D68: .4byte gUnknown_03003B80
_02007D6C: .4byte 0x00034BC0
_02007D70: .4byte gUnknown_0300152C
_02007D74:
	mov r2, ip
	ldr r0, [r2, #8]
	movs r1, #0x18
	ands r0, r1
	cmp r0, #0
	beq _02007D92
_02007D80:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, #8
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	movs r1, #0xa1
	bl sub_02001398
_02007D92:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02007DA0
sub_02007DA0: @ 0x02007DA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _02007EE4 @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	beq _02007DB4
	b _02008002
_02007DB4:
	ldr r0, _02007EE8 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02007DC2
	b _02007FFA
_02007DC2:
	ldr r3, _02007EEC @ =gUnknown_03003B80
	ldrb r1, [r5, #0x19]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x21
	adds r1, r1, r0
	ldr r0, _02007EF0 @ =gUnknown_0300150C
	mov r8, r0
	ldr r2, [r0]
	ldrh r0, [r2, #0xa]
	movs r4, #0
	mov sb, r4
	strh r0, [r5, #0xa]
	ldrh r0, [r2, #0xa]
	strb r0, [r1]
	ldrb r1, [r5, #0x19]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x22
	adds r1, r1, r0
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #0xe]
	adds r0, #0x13
	strh r0, [r5, #0xe]
	strb r0, [r1]
	ldr r4, _02007EF4 @ =gUnknown_030043F0
	ldrh r1, [r4, #4]
	movs r0, #1
	mov ip, r0
	ands r0, r1
	adds r7, r3, #0
	cmp r0, #0
	bne _02007E08
	b _02007FFA
_02007E08:
	ldr r0, [r2]
	ldr r1, _02007EF8 @ =gUnknown_03001528
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bgt _02007E1A
	b _02007FFA
_02007E1A:
	ldrh r1, [r4]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _02007E26
	b _02007FFA
_02007E26:
	adds r0, r7, #0
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	beq _02007E32
	b _02007F9C
_02007E32:
	ldr r0, _02007EFC @ =gUnknown_0300152F
	ldrb r0, [r0]
	cmp r0, #0
	beq _02007E3C
	b _02007F9C
_02007E3C:
	ldr r6, _02007F00 @ =gUnknown_03001510
	ldr r2, [r6]
	ldrb r1, [r2, #0x1e]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _02007E4C
	b _02007F9C
_02007E4C:
	movs r4, #0xa
	ldrsh r3, [r2, r4]
	adds r0, r3, #0
	subs r0, #0xb
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	cmp r0, r1
	blt _02007E5E
	b _02007F9C
_02007E5E:
	adds r0, #0x16
	cmp r1, r0
	blt _02007E66
	b _02007F9C
_02007E66:
	movs r0, #0xe
	ldrsh r2, [r2, r0]
	adds r0, r2, #0
	subs r0, #0x12
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _02007E78
	b _02007F9C
_02007E78:
	adds r0, #0x1c
	cmp r1, r0
	blt _02007E80
	b _02007F9C
_02007E80:
	movs r0, #0x16      @ SE_GAUGE_EXPANDS
	bl m4aSongNumStart
	mov r4, r8
	ldr r0, [r4]
	mov r1, sb
	strb r1, [r0, #7]
	ldr r1, [r4]
	movs r0, #0xb4
	strh r0, [r1, #0x14]
	adds r0, r7, #0
	adds r0, #0x74
	ldrb r4, [r0]
	movs r3, #0xc8
	ldr r1, _02007F04 @ =gUnknown_02012510
	ldrb r2, [r5, #0x1a]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r3, r3, r4
	cmp r0, r3
	ble _02007F4C
	ldr r1, [r6]
	movs r0, #8
	strb r0, [r1, #7]
	ldr r1, [r6]
	movs r0, #0xb
	strb r0, [r1, #0x17]
	ldr r1, [r6]
	movs r0, #0x10
	strh r0, [r1, #0x14]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #0x67
	bgt _02007F08
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x57
	bgt _02007F18
	adds r0, r2, #0
	adds r0, #0x10
	b _02007F1C
	.align 2, 0
_02007EE4: .4byte gUnknown_03001509
_02007EE8: .4byte gUnknown_03003330
_02007EEC: .4byte gUnknown_03003B80
_02007EF0: .4byte gUnknown_0300150C
_02007EF4: .4byte gUnknown_030043F0
_02007EF8: .4byte gUnknown_03001528
_02007EFC: .4byte gUnknown_0300152F
_02007F00: .4byte gUnknown_03001510
_02007F04: .4byte gUnknown_02012510
_02007F08:
	ldrh r2, [r1, #0xa]
	movs r4, #0xa
	ldrsh r0, [r1, r4]
	cmp r0, #0x8b
	bgt _02007F18
	adds r0, r2, #0
	adds r0, #0x10
	b _02007F1C
_02007F18:
	adds r0, r2, #0
	subs r0, #0x10
_02007F1C:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _02007F44 @ =gUnknown_03003B80
	ldrb r0, [r5, #0x19]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x21
	adds r0, r0, r1
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r1, r1, #1
	adds r2, #0x22
	adds r1, r1, r2
	ldr r0, _02007F48 @ =gUnknown_03001510
	ldr r0, [r0]
	ldrb r0, [r0, #0xe]
	subs r0, #2
	strb r0, [r1]
	b _02007FE2
	.align 2, 0
_02007F44: .4byte gUnknown_03003B80
_02007F48: .4byte gUnknown_03001510
_02007F4C:
	ldr r1, [r6]
	movs r0, #0xd
	strb r0, [r1, #0x17]
	ldr r1, [r6]
	movs r0, #0x10
	strb r0, [r1, #7]
	ldr r1, [r6]
	ldrb r0, [r5, #0x1a]
	strb r0, [r1, #0x1b]
	ldr r2, [r6]
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bge _02007F74
	ldrb r0, [r2, #7]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #7]
_02007F74:
	adds r0, r7, #0
	adds r0, #0x76
	mov r4, sb
	strb r4, [r0]
	subs r0, #0x1c
	ldrb r1, [r5, #0x19]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, _02007F98 @ =gUnknown_0300159A
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_02000ed4
	b _02008002
	.align 2, 0
_02007F98: .4byte gUnknown_0300159A
_02007F9C:
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	cmp r0, #0x9f
	ble _02007FB4
	ldrb r0, [r5, #0x19]
	lsls r0, r0, #1
	adds r1, r7, #0
	adds r1, #0x22
	adds r0, r0, r1
	movs r1, #0x9f
	strh r1, [r5, #0xe]
	strb r1, [r0]
_02007FB4:
	ldr r2, _02007FEC @ =gUnknown_02021F34
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r4, [r1]
	cmp r4, #0
	bne _02007FF4
	movs r0, #0x16      @ SE_GAUGE_EXPANDS
	bl m4aSongNumStart
	ldr r1, _02007FF0 @ =gUnknown_0300150C
	ldr r0, [r1]
	strb r4, [r0, #7]
	ldr r1, [r1]
	movs r0, #0xb4
	strh r0, [r1, #0x14]
_02007FE2:
	adds r0, r5, #0
	bl sub_02008324
	b _02008002
	.align 2, 0
_02007FEC: .4byte gUnknown_02021F34
_02007FF0: .4byte gUnknown_0300150C
_02007FF4:
	movs r0, #0x1c
	bl m4aSongNumStart
_02007FFA:
	ldrb r0, [r5, #4]
	movs r1, #1
	bl sub_02001254
_02008002:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02008010
sub_02008010: @ 0x02008010
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _020080B0 @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	bne _020080DA
	ldr r0, _020080B4 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _020080D2
	ldr r1, _020080B8 @ =gUnknown_03003B80
	ldr r6, _020080BC @ =gUnknown_0300150C
	ldr r2, [r6]
	ldrh r0, [r2, #0xa]
	strh r0, [r4, #0xa]
	ldrh r0, [r2, #0xa]
	strb r0, [r1, #0x1f]
	ldrh r0, [r2, #0xe]
	adds r3, r0, #0
	adds r3, #0x13
	strh r3, [r4, #0xe]
	adds r1, #0x20
	mov ip, r1
	strb r3, [r1]
	ldr r5, _020080C0 @ =gUnknown_030043F0
	ldrh r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _020080D2
	ldr r0, _020080C4 @ =gUnknown_03001528
	movs r7, #0xa
	ldrsh r1, [r2, r7]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _020080D2
	ldrh r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _020080D2
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0200807A
	movs r0, #0x9f
	strh r0, [r4, #0xe]
	mov r1, ip
	strb r0, [r1]
_0200807A:
	ldr r2, _020080C8 @ =gUnknown_02021F34
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0

	non_word_aligned_thumb_func_start sub_0200808e
sub_0200808e: @ 0x0200808e
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _020080CC
	movs r0, #0x16
	bl m4aSongNumStart
	ldr r1, [r6]
	movs r0, #0
	strb r0, [r1, #7]
	ldr r1, [r6]
	movs r0, #0xb4
	strh r0, [r1, #0x14]
	adds r0, r4, #0
	bl sub_02003e04
	b _020080DA
	.align 2, 0
_020080B0: .4byte gUnknown_03001509
_020080B4: .4byte gUnknown_03003330
_020080B8: .4byte gUnknown_03003B80
_020080BC: .4byte gUnknown_0300150C
_020080C0: .4byte gUnknown_030043F0
_020080C4: .4byte gUnknown_03001528
_020080C8: .4byte gUnknown_02021F34
_020080CC:
	movs r0, #0x1c
	bl m4aSongNumStart
_020080D2:
	ldrb r0, [r4, #4]
	movs r1, #1
	bl sub_02001254
_020080DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_020080e0
sub_020080e0: @ 0x020080e0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrb r0, [r5, #0x1a]
	cmp r0, #1
	bne _020080F6
	ldr r0, _020081F0 @ =gUnknown_03003B80
	adds r0, #0xcf
	movs r1, #0
	strb r1, [r0]
_020080F6:
	ldr r0, _020081F4 @ =gUnknown_03001509
	ldrb r0, [r0]
	cmp r0, #0
	beq _02008100
	b _0200831A
_02008100:
	ldr r0, _020081F8 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200810E
	b _02008312
_0200810E:
	ldr r3, _020081F0 @ =gUnknown_03003B80
	ldrb r1, [r5, #0x1a]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x31
	adds r1, r1, r0
	ldr r6, _020081FC @ =gUnknown_0300150C
	ldr r2, [r6]
	ldrh r0, [r2, #0xa]
	strh r0, [r5, #0xa]
	ldrh r0, [r2, #0xa]
	strb r0, [r1]
	ldrb r1, [r5, #0x1a]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x32
	adds r1, r1, r0
	ldr r0, [r6]
	ldrh r0, [r0, #0xe]
	adds r0, #0x13
	strh r0, [r5, #0xe]
	strb r0, [r1]
	ldr r4, _02008200 @ =gUnknown_030043F0
	ldrh r1, [r4, #4]
	movs r0, #1
	mov ip, r0
	ands r0, r1
	cmp r0, #0
	bne _0200814A
	b _02008312
_0200814A:
	ldr r0, [r6]
	ldr r1, _02008204 @ =gUnknown_03001528
	movs r7, #0xa
	ldrsh r2, [r0, r7]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bgt _0200815C
	b _02008312
_0200815C:
	ldrh r1, [r4]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _02008168
	b _02008312
_02008168:
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	beq _02008170
	b _020082A4
_02008170:
	adds r0, r3, #0
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200817C
	b _020082A4
_0200817C:
	ldr r0, _02008208 @ =gUnknown_0300152F
	ldrb r0, [r0]
	cmp r0, #0
	beq _02008186
	b _020082A4
_02008186:
	ldr r0, _0200820C @ =gUnknown_03001510
	mov r8, r0
	ldr r2, [r0]
	ldrb r1, [r2, #0x1e]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _02008198
	b _020082A4
_02008198:
	movs r1, #0xa
	ldrsh r4, [r2, r1]
	adds r0, r4, #0
	subs r0, #0xb
	movs r7, #0xa
	ldrsh r1, [r5, r7]
	cmp r0, r1
	blt _020081AA
	b _020082A4
_020081AA:
	adds r0, #0x16
	cmp r1, r0
	bge _020082A4
	movs r0, #0xe
	ldrsh r2, [r2, r0]
	adds r0, r2, #0
	subs r0, #0x12
	movs r4, #0xe
	ldrsh r1, [r5, r4]
	cmp r0, r1
	bge _020082A4
	adds r0, #0x1c
	cmp r1, r0
	bge _020082A4
	movs r0, #0x16
	bl m4aSongNumStart
	ldr r1, [r6]
	movs r0, #0
	strb r0, [r1, #7]
	ldr r1, [r6]
	movs r0, #0xb4
	strh r0, [r1, #0x14]
	mov r7, r8
	ldr r1, [r7]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #0x67
	bgt _02008210
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x57
	ble _0200821A
	b _02008226
	.align 2, 0
_020081F0: .4byte gUnknown_03003B80
_020081F4: .4byte gUnknown_03001509
_020081F8: .4byte gUnknown_03003330
_020081FC: .4byte gUnknown_0300150C
_02008200: .4byte gUnknown_030043F0
_02008204: .4byte gUnknown_03001528
_02008208: .4byte gUnknown_0300152F
_0200820C: .4byte gUnknown_03001510
_02008210:
	ldrh r2, [r1, #0xa]
	movs r4, #0xa
	ldrsh r0, [r1, r4]
	cmp r0, #0x8b
	bgt _02008226
_0200821A:
	adds r0, r2, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r4, #0x80
	b _02008230
_02008226:
	adds r0, r2, #0
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r4, #0
_02008230:
	ldr r3, _02008294 @ =gUnknown_03003B80
	ldrb r0, [r5, #0x1a]
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #0x31
	adds r0, r0, r1
	strb r2, [r0]
	ldrb r1, [r5, #0x1a]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x32
	adds r1, r1, r0
	ldr r2, _02008298 @ =gUnknown_03001510
	ldr r0, [r2]
	ldrb r0, [r0, #0xe]
	subs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x73
	ldrb r0, [r0]
	cmp r0, #0x31
	bls _020082FA
	ldr r1, [r2]
	movs r0, #0x14
	strb r0, [r1, #0x17]
	ldr r1, [r2]
	ldrb r0, [r5, #4]
	strb r0, [r1, #0x1b]
	ldr r0, [r2]
	strb r4, [r0, #7]
	ldr r0, [r2]
	ldrb r0, [r0, #0x1d]
	subs r0, #1
	strb r0, [r5, #0x1d]
	ldr r1, _0200829C @ =gUnknown_02020F03
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0xff
	strb r0, [r5, #0x1c]
	ldr r1, _020082A0 @ =sub_02008dec
	str r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	b _0200831A
	.align 2, 0
_02008294: .4byte gUnknown_03003B80
_02008298: .4byte gUnknown_03001510
_0200829C: .4byte gUnknown_02020F03
_020082A0: .4byte sub_02008dec
_020082A4:
	movs r7, #0xe
	ldrsh r0, [r5, r7]
	cmp r0, #0x9f
	ble _020082BC
	ldrb r0, [r5, #0x1a]
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #0x32
	adds r0, r0, r1
	movs r1, #0x9f
	strh r1, [r5, #0xe]
	strb r1, [r0]
_020082BC:
	ldr r2, _02008304 @ =gUnknown_02021F34
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #0x16
	muls r1, r0, r1
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r4, [r1]
	ldrb r0, [r5, #0x1a]
	cmp r0, #1
	bne _020082E4
	movs r0, #0
	cmp r4, #0
	bne _020082E2
	movs r0, #1
_020082E2:
	adds r4, r0, #0
_020082E4:
	cmp r4, #0
	bne _0200830C
	movs r0, #0x16
	bl m4aSongNumStart
	ldr r1, _02008308 @ =gUnknown_0300150C
	ldr r0, [r1]
	strb r4, [r0, #7]
	ldr r1, [r1]
	movs r0, #0xb4
	strh r0, [r1, #0x14]
_020082FA:
	adds r0, r5, #0
	bl sub_020083e4
	b _0200831A
	.align 2, 0
_02008304: .4byte gUnknown_02021F34
_02008308: .4byte gUnknown_0300150C
_0200830C:
	movs r0, #0x1c
	bl m4aSongNumStart
_02008312:
	ldrb r0, [r5, #4]
	movs r1, #1
	bl sub_02001254
_0200831A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_02008324
sub_02008324: @ 0x02008324
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, _020083D0 @ =gUnknown_03003B80
	ldrb r0, [r3, #0x19]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x21
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #0x19]
	lsls r0, r0, #1
	adds r4, r2, #0
	adds r4, #0x22
	adds r1, r0, r4
	ldrb r0, [r1]
	adds r6, r2, #0
	cmp r0, #0x9f
	bls _0200834E
	movs r0, #0x9f
	strb r0, [r1]
_0200834E:
	ldrb r0, [r3, #0x19]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	strb r1, [r3, #0x1d]
	ldrb r2, [r0]
	strh r2, [r3, #0xe]
	ldr r0, _020083D4 @ =gUnknown_020205E4
	str r0, [r3, #0x10]
	ldrb r0, [r3, #0x1a]
	lsls r0, r0, #2
	adds r0, #0xbc
	strh r0, [r3, #0x14]
	ldr r1, _020083D8 @ =gUnknown_02020EFC
	ldrb r0, [r3, #0x1a]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #2
	strb r0, [r3, #0x1c]
	lsrs r2, r2, #3
	movs r0, #0x16
	adds r1, r2, #0
	muls r1, r0, r1
	ldrh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _020083DC @ =gUnknown_02021F34
	adds r0, r1, r2
	ldrb r0, [r0]
	ldrb r4, [r3, #0x19]
	ldr r5, _020083E0 @ =sub_02008d3c
	cmp r0, #0
	beq _020083B4
_0200839E:
	adds r0, r1, #0
	subs r0, #0x16
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #0xe]
	subs r0, #8
	strh r0, [r3, #0xe]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200839E
_020083B4:
	lsls r0, r4, #1
	adds r1, r6, #0
	adds r1, #0x22
	adds r0, r0, r1
	ldrh r1, [r3, #0xe]
	strb r1, [r3, #0x1d]
	strb r1, [r0]
	str r5, [r3]
	adds r0, r3, #0
	bl _call_via_r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020083D0: .4byte gUnknown_03003B80
_020083D4: .4byte gUnknown_020205E4
_020083D8: .4byte gUnknown_02020EFC
_020083DC: .4byte gUnknown_02021F34
_020083E0: .4byte sub_02008d3c

	thumb_func_start sub_020083e4
sub_020083e4: @ 0x020083e4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _02008490 @ =gUnknown_020125A0
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r2, _02008494 @ =gUnknown_03003B80
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x31
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #1
	adds r3, r2, #0
	adds r3, #0x32
	adds r1, r0, r3
	ldrb r0, [r1]
	adds r6, r2, #0
	cmp r0, #0x9f
	bls _02008418
	movs r0, #0x9f
	strb r0, [r1]
_02008418:
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	strb r1, [r4, #0x1d]
	ldrb r3, [r0]
	strh r3, [r4, #0xe]
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	str r0, [r4, #0x10]
	movs r0, #0xe0
	strh r0, [r4, #0x14]
	ldr r1, _02008498 @ =gUnknown_02020F03
	ldrb r0, [r4, #0x1a]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r2, [r4, #0x1a]
	adds r0, r2, #5
	strb r0, [r4, #0x1c]
	lsrs r3, r3, #3
	movs r0, #0x16
	adds r1, r3, #0
	muls r1, r0, r1
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #0x1a]
	cmp r2, #1
	bne _020084A4
	ldr r0, _0200849C @ =gUnknown_02021F34
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _02008486
	adds r1, r6, #0
	adds r1, #0x33
	movs r0, #0x40
	strb r0, [r1]
	strh r0, [r4, #0xa]
	adds r1, #1
	movs r0, #0x9f
	strb r0, [r1]
	strb r0, [r4, #0x1d]
	strh r0, [r4, #0xe]
_02008486:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x22]
	ldr r5, _020084A0 @ =sub_020084ec
	b _020084D4
	.align 2, 0
_02008490: .4byte gUnknown_020125A0
_02008494: .4byte gUnknown_03003B80
_02008498: .4byte gUnknown_02020F03
_0200849C: .4byte gUnknown_02021F34
_020084A0: .4byte sub_020084ec
_020084A4:
	ldr r2, _020084E4 @ =gUnknown_02021F34
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r5, _020084E8 @ =sub_020084ec
	cmp r0, #0
	beq _020084C6
_020084B0:
	adds r0, r1, #0
	subs r0, #0x16
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #0xe]
	subs r0, #8
	strh r0, [r4, #0xe]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _020084B0
_020084C6:
	lsls r0, r3, #1
	adds r1, r6, #0
	adds r1, #0x32
	adds r0, r0, r1
	ldrh r1, [r4, #0xe]
	strb r1, [r4, #0x1d]
	strb r1, [r0]
_020084D4:
	str r5, [r4]
	adds r0, r4, #0
	bl _call_via_r5
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020084E4: .4byte gUnknown_02021F34
_020084E8: .4byte sub_020084ec

	thumb_func_start sub_020084ec
sub_020084ec: @ 0x020084ec
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _02008524 @ =gUnknown_03003330
	ldrb r2, [r1, #0xf]
	movs r0, #0x10
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	bne _020085D4
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _020085CC
	ldrb r0, [r4, #0x1a]
	cmp r0, #1
	beq _0200853C
	cmp r0, #2
	bne _020085CC
	ldr r0, _02008528 @ =gUnknown_03001514
	str r4, [r0]
	ldr r0, [r5, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _02008530
	ldr r0, _0200852C @ =gUnknown_0202060C
	str r0, [r4, #0x10]
	b _020085CC
	.align 2, 0
_02008524: .4byte gUnknown_03003330
_02008528: .4byte gUnknown_03001514
_0200852C: .4byte gUnknown_0202060C
_02008530:
	ldr r0, _02008538 @ =gUnknown_02020614
	str r0, [r4, #0x10]
	b _020085CC
	.align 2, 0
_02008538: .4byte gUnknown_02020614
_0200853C:
	ldrh r3, [r4, #0x22]
	movs r0, #0x22
	ldrsh r2, [r4, r0]
	cmp r2, #0x40
	beq _02008566
	ldr r0, [r5, #8]
	adds r0, #0x39
	movs r1, #0x7f
	ands r0, r1
	cmp r0, #0
	bne _02008566
	cmp r2, #0x40
	ble _0200855A
	subs r0, r3, #1
	b _0200855C
_0200855A:
	adds r0, r3, #1
_0200855C:
	strh r0, [r4, #0x22]
	ldr r0, _02008584 @ =gUnknown_03003B80
	ldrh r1, [r4, #0x22]
	adds r0, #0x33
	strb r1, [r0]
_02008566:
	ldrb r2, [r4, #0x1d]
	adds r3, r2, #0
	cmp r3, #0x9f
	beq _02008594
	ldr r0, [r5, #8]
	adds r0, #0x9b
	movs r1, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _02008594
	cmp r3, #0x9f
	bls _02008588
	subs r0, r2, #1
	b _0200858A
	.align 2, 0
_02008584: .4byte gUnknown_03003B80
_02008588:
	adds r0, r2, #1
_0200858A:
	strb r0, [r4, #0x1d]
	ldr r0, _020085DC @ =gUnknown_03003B80
	ldrb r1, [r4, #0x1d]
	adds r0, #0x34
	strb r1, [r0]
_02008594:
	ldrb r0, [r5, #8]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x81
	bl Div
	ldrh r1, [r4, #0x22]
	adds r1, r1, r0
	strh r1, [r4, #0xa]
	ldr r0, [r5, #8]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x81
	bl Div
	ldrb r1, [r4, #0x1d]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	ldr r0, _020085DC @ =gUnknown_03003B80
	adds r0, #0xcf
	movs r1, #1
	strb r1, [r0]
_020085CC:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
_020085D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020085DC: .4byte gUnknown_03003B80

	thumb_func_start sub_020085e0
sub_020085e0: @ 0x020085e0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xff
	strb r0, [r4, #0x1c]
	movs r0, #0x9f
	strb r0, [r4, #0x1d]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	subs r0, #0x58
	lsls r0, r0, #8
	movs r1, #0x40
	bl Div
	strh r0, [r4, #0x22]
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0x67
	bgt _02008624
	strh r1, [r4, #0xc]
	movs r0, #0x68
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	movs r0, #0
	strb r0, [r4, #0x1a]
	ldr r1, _02008620 @ =sub_02008648
	str r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	b _02008638
	.align 2, 0
_02008620: .4byte sub_02008648
_02008624:
	adds r0, r1, #0
	subs r0, #0x2e
	strh r0, [r4, #0x20]
	movs r0, #0x40
	strb r0, [r4, #0x1a]
	ldr r1, _02008644 @ =sub_02008d90
	str r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
_02008638:
	movs r0, #0x20
	bl m4aSongNumStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02008644: .4byte sub_02008d90

	thumb_func_start sub_02008648
sub_02008648: @ 0x02008648
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x1a]
	adds r0, #2
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bls _02008662
	adds r0, r4, #0
	bl sub_02000ed4
	b _020086A8
_02008662:
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	ldrb r0, [r4, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	ldrh r1, [r4, #0xc]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	ldrb r0, [r4, #0x1a]
	cmp r0, #0x40
	bne _0200869A
	movs r0, #0x2e
	strh r0, [r4, #0xc]
	movs r0, #0x3a
	strh r0, [r4, #0x20]
_0200869A:
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	ldr r1, _020086B0 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
_020086A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020086B0: .4byte gUnknown_0300152C

	thumb_func_start sub_020086b4
sub_020086b4: @ 0x020086b4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _020086D4 @ =gUnknown_03004400
	adds r2, r0, r1
	ldrb r1, [r2, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020086D8
	ldrh r0, [r2, #0xa]
	adds r0, #0xc
	b _020086DC
	.align 2, 0
_020086D4: .4byte gUnknown_03004400
_020086D8:
	ldrh r0, [r2, #0xa]
	subs r0, #0xc
_020086DC:
	strh r0, [r5, #0xa]
	ldrb r0, [r2, #0xe]
	subs r0, #1
	movs r4, #0
	strb r0, [r5, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xe]
	ldr r0, _02008744 @ =gUnknown_020205E4
	str r0, [r5, #0x10]
	ldrb r0, [r5, #0x1a]
	lsls r0, r0, #2
	adds r0, #0xbc
	strh r0, [r5, #0x14]
	movs r0, #1
	strb r0, [r5, #0x16]
	bl sub_020012f8
	strb r0, [r5, #0x17]
	ldr r1, _02008748 @ =gUnknown_02020EFC
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0x20
	strb r0, [r5, #0x1a]
	ldr r0, _0200874C @ =gUnknown_030015A0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0]
	strh r4, [r0, #4]
	ldrb r1, [r5, #0x17]
	lsls r1, r1, #4
	ldr r2, _02008750 @ =gUnknown_03004E76
	adds r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
	ldr r1, _02008754 @ =sub_02008758
	str r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02008744: .4byte gUnknown_020205E4
_02008748: .4byte gUnknown_02020EFC
_0200874C: .4byte gUnknown_030015A0
_02008750: .4byte gUnknown_03004E76
_02008754: .4byte sub_02008758

	thumb_func_start sub_02008758
sub_02008758: @ 0x02008758
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _020087A0 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008802
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _020087FA
	ldrb r0, [r5, #0x1a]
	subs r0, #1
	strb r0, [r5, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020087FA
	movs r0, #0x40
	strb r0, [r5, #0x1a]
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
	ands r0, r1
	cmp r0, #3
	bls _020087A4
	ldrb r0, [r5, #0x17]
	bl sub_0200133c
	adds r0, r5, #0
	bl sub_02000ed4
	b _02008802
	.align 2, 0
_020087A0: .4byte gUnknown_03003330
_020087A4:
	ldr r2, _020087C0 @ =gUnknown_03004400
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #7]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _020087C4
	ldrh r0, [r5, #0xa]
	subs r0, #1
	b _020087C8
	.align 2, 0
_020087C0: .4byte gUnknown_03004400
_020087C4:
	ldrh r0, [r5, #0xa]
	adds r0, #1
_020087C8:
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	movs r4, #0
	strh r0, [r5, #0xe]
	movs r0, #0x80
	lsls r0, r0, #3
	ldrb r2, [r5, #0x19]
	movs r1, #4
	subs r1, r1, r2
	bl Div
	adds r1, r0, #0
	ldr r0, _02008808 @ =gUnknown_030015A0
	strh r1, [r0, #2]
	strh r1, [r0]
	strh r4, [r0, #4]
	ldrb r1, [r5, #0x17]
	lsls r1, r1, #4
	ldr r2, _0200880C @ =gUnknown_03004E76
	adds r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
_020087FA:
	ldrb r0, [r5, #4]
	ldrb r1, [r5, #0x1d]
	bl sub_02001398
_02008802:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02008808: .4byte gUnknown_030015A0
_0200880C: .4byte gUnknown_03004E76

	thumb_func_start sub_02008810
sub_02008810: @ 0x02008810
	push {lr}
	movs r0, #0x1e
	bl sub_02001554
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #0x3c
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200882C
sub_0200882C: @ 0x0200882C
	push {lr}
	ldr r0, _02008840 @ =gUnknown_03003330
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _02008844 @ =sub_02001e00
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02008840: .4byte gUnknown_03003330
_02008844: .4byte sub_02001e00

	thumb_func_start sub_02008848
sub_02008848: @ 0x02008848
	push {lr}
	ldr r0, _0200885C @ =gUnknown_03003330
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _02008860 @ =sub_02008864
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0200885C: .4byte gUnknown_03003330
_02008860: .4byte sub_02008864

	thumb_func_start sub_02008864
sub_02008864: @ 0x02008864
	push {r4, lr}
	ldr r1, _0200889C @ =0x04000050
	ldr r2, _020088A0 @ =0x000008FF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020088A4 @ =0x04000054
	ldr r4, _020088A8 @ =gUnknown_03003330
	ldrh r1, [r4, #0xc]
	adds r1, #1
	strh r1, [r4, #0xc]
	strh r1, [r0]
	ldr r3, _020088AC @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r1
	movs r2, #0xfe
	ands r0, r2
	lsls r0, r0, #7
	strh r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf
	ble _02008894
	ldr r0, [r4, #4]
	str r0, [r4]
_02008894:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200889C: .4byte 0x04000050
_020088A0: .4byte 0x000008FF
_020088A4: .4byte 0x04000054
_020088A8: .4byte gUnknown_03003330
_020088AC: .4byte 0x04000052

	thumb_func_start sub_020088b0
sub_020088b0: @ 0x020088b0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x1a]
	subs r1, #1
	strb r1, [r4, #0x1a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x54
	bl sub_02001698
	ldrb r1, [r4, #0x1a]
	movs r0, #0x10
	subs r0, r0, r1
	movs r2, #0xfe
	ands r0, r2
	lsls r0, r0, #7
	orrs r1, r0
	movs r0, #0x52
	bl sub_02001698
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _020088EE
	adds r0, r4, #0
	bl sub_02000ed4
	ldr r2, _020088F4 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #0xf]
_020088EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020088F4: .4byte gUnknown_03003330

	thumb_func_start sub_020088f8
sub_020088f8: @ 0x020088f8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x1a]
	subs r1, #1
	strb r1, [r4, #0x1a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x54
	bl sub_02001698
	ldrb r0, [r4, #0x1a]
	movs r1, #0x10
	subs r1, r1, r0
	movs r0, #0xfe
	ands r1, r0
	lsls r1, r1, #7
	movs r0, #0x52
	bl sub_02001698
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _02008934
	adds r0, r4, #0
	bl sub_02000ed4
	ldr r2, _0200893C @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #0xf]
_02008934:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200893C: .4byte gUnknown_03003330

	thumb_func_start sub_02008940
sub_02008940: @ 0x02008940
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _02008980 @ =gUnknown_0202027E
	ldr r6, _02008984 @ =gUnknown_03003330
	ldr r0, [r6, #8]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008956
	adds r2, #8
_02008956:
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #6
	ldr r0, _02008988 @ =0x0600E010
	adds r1, r1, r0
	ldr r0, _0200898C @ =0x000031E5
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #2
	movs r3, #2
	bl sub_020017b0
	ldrb r0, [r5, #0x19]
	adds r4, r0, #0
	cmp r4, #0
	beq _02008990
	subs r0, #1
	strb r0, [r5, #0x19]
	b _020089A2
	.align 2, 0
_02008980: .4byte gUnknown_0202027E
_02008984: .4byte gUnknown_03003330
_02008988: .4byte 0x0600E010
_0200898C: .4byte 0x000031E5
_02008990:
	bl sub_020003ac
	str r4, [r6, #4]
	ldr r0, _020089AC @ =sub_0200882C
	str r0, [r6]
	ldrb r1, [r6, #0xf]
	movs r0, #3
	orrs r0, r1
	strb r0, [r6, #0xf]
_020089A2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020089AC: .4byte sub_0200882C

	thumb_func_start sub_020089B0
sub_020089B0: @ 0x020089B0
	movs r1, #0x80
	strb r1, [r0, #7]
	ldr r1, _020089CC @ =gUnknown_03005274
	ldr r1, [r1]
	adds r1, #1
	str r1, [r0, #0x20]
	movs r1, #6
	strb r1, [r0, #0x19]
	movs r1, #1
	strb r1, [r0, #0x1a]
	ldr r1, _020089D0 @ =sub_0200292c
	str r1, [r0]
	bx lr
	.align 2, 0
_020089CC: .4byte gUnknown_03005274
_020089D0: .4byte sub_0200292c

	thumb_func_start sub_020089D4
sub_020089D4: @ 0x020089D4
	movs r2, #0
	movs r1, #0x58
	strh r1, [r0, #0xa]
	ldr r1, _020089F4 @ =0x0000FFD0
	strh r1, [r0, #0xe]
	ldr r1, _020089F8 @ =gUnknown_020206C4
	str r1, [r0, #0x10]
	ldr r1, _020089FC @ =0x0000014B
	strh r1, [r0, #0x14]
	movs r1, #0xc
	strb r1, [r0, #0x18]
	strb r2, [r0, #0x1f]
	strb r2, [r0, #0x1e]
	ldr r1, _02008A00 @ =sub_02002eb8
	str r1, [r0]
	bx lr
	.align 2, 0
_020089F4: .4byte 0x0000FFD0
_020089F8: .4byte gUnknown_020206C4
_020089FC: .4byte 0x0000014B
_02008A00: .4byte sub_02002eb8

	thumb_func_start sub_02008A04
sub_02008A04: @ 0x02008A04
	movs r1, #0x5f
	strh r1, [r0, #0xa]
	movs r1, #0x3a
	strh r1, [r0, #0xe]
	ldr r1, _02008A24 @ =gUnknown_020205F4
	str r1, [r0, #0x10]
	movs r1, #0xac
	strh r1, [r0, #0x14]
	adds r1, #0xd4
	strh r1, [r0, #0x22]
	subs r1, #0x71
	strh r1, [r0, #0x20]
	ldr r1, _02008A28 @ =sub_02003748
	str r1, [r0]
	bx lr
	.align 2, 0
_02008A24: .4byte gUnknown_020205F4
_02008A28: .4byte sub_02003748

	thumb_func_start sub_02008a2c
sub_02008a2c: @ 0x02008a2c
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02008A50 @ =gUnknown_0202044C
	str r0, [r4, #0x10]
	movs r1, #0
	movs r0, #0x8c
	strb r0, [r4, #0x18]
	strb r1, [r4, #0x1f]
	strb r1, [r4, #0x1a]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _02008A54
	movs r0, #0xf8
	strb r0, [r4, #0x1e]
	movs r0, #0x10
	strb r0, [r4, #0x17]
	b _02008A5E
	.align 2, 0
_02008A50: .4byte gUnknown_0202044C
_02008A54:
	movs r0, #8
	strb r0, [r4, #0x1e]
	movs r0, #0xd
	bl m4aSongNumStart
_02008A5E:
	ldr r1, _02008A70 @ =sub_020065ec
	str r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02008A70: .4byte sub_020065ec

	thumb_func_start sub_02008a74
sub_02008a74: @ 0x02008a74
	push {lr}
	adds r2, r0, #0
	ldr r0, _02008AAC @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008AA6
	ldr r0, _02008AB0 @ =gUnknown_03001506
	ldrb r0, [r0]
	cmp r0, #0
	beq _02008AA6
	ldrb r0, [r2, #0x1b]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _02008AB4 @ =gUnknown_03004400
	adds r1, r1, r0
	ldrh r0, [r1, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrb r0, [r2, #4]
	ldrb r1, [r1, #0x1d]
	bl sub_02001398
_02008AA6:
	pop {r0}
	bx r0
	.align 2, 0
_02008AAC: .4byte gUnknown_03003330
_02008AB0: .4byte gUnknown_03001506
_02008AB4: .4byte gUnknown_03004400

	thumb_func_start sub_02008ab8
sub_02008ab8: @ 0x02008ab8
	push {lr}
	adds r2, r0, #0
	ldr r0, _02008AE0 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008B12
	ldr r0, _02008AE4 @ =gUnknown_03001506
	ldrb r0, [r0]
	cmp r0, #0
	bne _02008B12
	ldr r0, _02008AE8 @ =gUnknown_0300152E
	ldrb r0, [r0]
	cmp r0, #0
	bne _02008AEC
	adds r0, r2, #0
	bl sub_02000ed4
	b _02008B12
	.align 2, 0
_02008AE0: .4byte gUnknown_03003330
_02008AE4: .4byte gUnknown_03001506
_02008AE8: .4byte gUnknown_0300152E
_02008AEC:
	ldrb r1, [r2, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _02008B18 @ =gUnknown_03004400
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #0x1d]
	strh r1, [r2, #0xe]
	ldrb r1, [r0, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _02008B12
	ldrb r0, [r2, #4]
	movs r1, #0
	bl sub_02001398
_02008B12:
	pop {r0}
	bx r0
	.align 2, 0
_02008B18: .4byte gUnknown_03004400

	thumb_func_start Task_8019898
Task_8019898: @ 0x02008b1c
	push {lr}
	adds r2, r0, #0
	ldr r0, _02008B38 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008B34
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	bl sub_02001398
_02008B34:
	pop {r0}
	bx r0
	.align 2, 0
_02008B38: .4byte gUnknown_03003330

	thumb_func_start sub_02008b3c
sub_02008b3c: @ 0x02008b3c
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02008B70 @ =gUnknown_020205E4
	str r0, [r4, #0x10]
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, #0xbc
	strh r0, [r4, #0x14]
	ldr r1, _02008B74 @ =gUnknown_02020EFC
	ldrb r0, [r4, #0x1a]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x1a]
	adds r0, r4, #0
	bl sub_02008c0c
	ldr r0, _02008B78 @ =sub_02007978
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02008B70: .4byte gUnknown_020205E4
_02008B74: .4byte gUnknown_02020EFC
_02008B78: .4byte sub_02007978

	thumb_func_start sub_02008b7c
sub_02008b7c: @ 0x02008b7c
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8a
	strh r0, [r4, #0xe]
	ldr r0, _02008BB8 @ =gUnknown_020205E4
	str r0, [r4, #0x10]
	ldrb r1, [r4, #0x1a]
	movs r0, #0xd8
	cmp r1, #0
	beq _02008B92
	movs r0, #0xdc
_02008B92:
	strh r0, [r4, #0x14]
	movs r0, #0xec
	strb r0, [r4, #0x18]
	adds r1, #7
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_02008c0c
	ldr r1, _02008BBC @ =gUnknown_030015A8
	ldrb r0, [r4, #0x1a]
	strb r0, [r1, #5]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, _02008BC0 @ =sub_02007b00
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02008BB8: .4byte gUnknown_020205E4
_02008BBC: .4byte gUnknown_030015A8
_02008BC0: .4byte sub_02007b00

	thumb_func_start sub_02008bc4
sub_02008bc4: @ 0x02008bc4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x9a
	strh r0, [r4, #0xe]
	ldr r0, _02008C00 @ =gUnknown_020205E4
	str r0, [r4, #0x10]
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, #0xe0
	strh r0, [r4, #0x14]
	ldr r1, _02008C04 @ =gUnknown_02020F03
	ldrb r0, [r4, #0x1a]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x1a]
	adds r1, #0x13
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_02008c0c
	ldr r0, _02008C08 @ =sub_02007C4C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02008C00: .4byte gUnknown_020205E4
_02008C04: .4byte gUnknown_02020F03
_02008C08: .4byte sub_02007C4C

	thumb_func_start sub_02008c0c
sub_02008c0c: @ 0x02008c0c
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _02008C44 @ =sub_02008c50
	adds r1, r5, #0
	movs r2, #0
	bl sub_02000d04
	ldrh r1, [r5, #0xe]
	subs r1, #0xa
	strh r1, [r0, #0xe]
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	ldr r2, _02008C48 @ =gUnknown_030015D0
	adds r1, r1, r2
	str r1, [r0, #0x10]
	ldr r1, _02008C4C @ =0x00000141
	strh r1, [r0, #0x14]
	movs r1, #0x1c
	strb r1, [r0, #0x18]
	ldrb r1, [r5, #0x1b]
	strb r1, [r0, #0x1b]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02008C44: .4byte sub_02008c50
_02008C48: .4byte gUnknown_030015D0
_02008C4C: .4byte 0x00000141

	thumb_func_start sub_02008c50
sub_02008c50: @ 0x02008c50
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _02008C84 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008C96
	ldr r2, _02008C88 @ =gUnknown_03004400
	ldrb r1, [r3, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r2, [r0, #0xa]
	movs r4, #0xa
	ldrsh r1, [r0, r4]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _02008C8C
	adds r0, r3, #0
	bl sub_02000ed4
	b _02008C96
	.align 2, 0
_02008C84: .4byte gUnknown_03003330
_02008C88: .4byte gUnknown_03004400
_02008C8C:
	strh r2, [r3, #0xa]
	ldrb r0, [r3, #4]
	movs r1, #0xa1
	bl sub_02001398
_02008C96:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_02008c9c
sub_02008c9c: @ 0x02008c9c
	push {lr}
	ldr r1, _02008CC8 @ =gUnknown_020205E4
	str r1, [r0, #0x10]
	ldrb r1, [r0, #0x1a]
	lsls r1, r1, #2
	adds r1, #0xbc
	strh r1, [r0, #0x14]
	ldr r2, _02008CCC @ =gUnknown_02020EFC
	ldrb r1, [r0, #0x1a]
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #4
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #0x18]
	ldr r1, _02008CD0 @ =sub_02007DA0
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02008CC8: .4byte gUnknown_020205E4
_02008CCC: .4byte gUnknown_02020EFC
_02008CD0: .4byte sub_02007DA0

	thumb_func_start sub_02008cd4
sub_02008cd4: @ 0x02008cd4
	push {lr}
	adds r2, r0, #0
	ldr r0, _02008CFC @ =gUnknown_020205E4
	str r0, [r2, #0x10]
	ldrb r0, [r2, #0x1a]
	movs r1, #0xd8
	cmp r0, #0
	beq _02008CE6
	movs r1, #0xdc
_02008CE6:
	strh r1, [r2, #0x14]
	movs r0, #0xe4
	strb r0, [r2, #0x18]
	ldr r1, _02008D00 @ =sub_02008010
	str r1, [r2]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02008CFC: .4byte gUnknown_020205E4
_02008D00: .4byte sub_02008010

	thumb_func_start sub_02008d04
sub_02008d04: @ 0x02008d04
	push {lr}
	ldr r1, _02008D30 @ =gUnknown_020205E4
	str r1, [r0, #0x10]
	ldrb r1, [r0, #0x1a]
	lsls r1, r1, #2
	adds r1, #0xe0
	strh r1, [r0, #0x14]
	ldr r2, _02008D34 @ =gUnknown_02020F03
	ldrb r1, [r0, #0x1a]
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #4
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #0x18]
	ldr r1, _02008D38 @ =sub_020080e0
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02008D30: .4byte gUnknown_020205E4
_02008D34: .4byte gUnknown_02020F03
_02008D38: .4byte sub_020080e0

	thumb_func_start sub_02008d3c
sub_02008d3c: @ 0x02008d3c
	push {lr}
	adds r2, r0, #0
	ldr r0, _02008D6C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008D88
	ldr r0, _02008D70 @ =gUnknown_03003B80
	ldrb r1, [r2, #0x19]
	adds r0, #0x5a
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _02008D78
	ldr r1, _02008D74 @ =gUnknown_0300159A
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_020085e0
	b _02008D88
	.align 2, 0
_02008D6C: .4byte gUnknown_03003330
_02008D70: .4byte gUnknown_03003B80
_02008D74: .4byte gUnknown_0300159A
_02008D78:
	ldr r0, _02008D8C @ =gUnknown_03001940
	adds r0, r1, r0
	ldrb r1, [r2, #4]
	strb r1, [r0]
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	bl sub_02001398
_02008D88:
	pop {r0}
	bx r0
	.align 2, 0
_02008D8C: .4byte gUnknown_03001940

	thumb_func_start sub_02008d90
sub_02008d90: @ 0x02008d90
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bls _02008DAA
	adds r0, r4, #0
	bl sub_02000ed4
	b _02008DE0
_02008DAA:
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	ldrb r0, [r4, #0x1a]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r0, #0x2e
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #0x1d]
	bl sub_02001398
	ldr r1, _02008DE8 @ =gUnknown_0300152C
	movs r0, #1
	strb r0, [r1]
_02008DE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02008DE8: .4byte gUnknown_0300152C

	thumb_func_start sub_02008dec
sub_02008dec: @ 0x02008dec
	push {lr}
	adds r2, r0, #0
	ldr r0, _02008E08 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02008E04
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	bl sub_02001398
_02008E04:
	pop {r0}
	bx r0
	.align 2, 0
_02008E08: .4byte gUnknown_03003330

	thumb_func_start sub_02008e0c
sub_02008e0c: @ 0x02008e0c
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _02008E4C @ =gUnknown_02021180
	movs r1, #6
	bl sub_0200163c
	ldr r4, _02008E50 @ =0x05000220
	ldr r1, _02008E54 @ =gUnknown_03001948
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuSet
	ldr r0, _02008E58 @ =gUnknown_02012870
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	ldr r0, _02008E5C @ =gUnknown_020125AC
	ldr r1, _02008E60 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _02008E64 @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _02008E70
	ldr r0, _02008E68 @ =gUnknown_02012684
	ldr r1, _02008E6C @ =0x06010200
	bl LZ77UnCompVram
	b _02008E78
	.align 2, 0
_02008E4C: .4byte gUnknown_02021180
_02008E50: .4byte 0x05000220
_02008E54: .4byte gUnknown_03001948
_02008E58: .4byte gUnknown_02012870
_02008E5C: .4byte gUnknown_020125AC
_02008E60: .4byte 0x06010000
_02008E64: .4byte gUnknown_03003330
_02008E68: .4byte gUnknown_02012684
_02008E6C: .4byte 0x06010200
_02008E70:
	ldr r0, _02008F08 @ =gUnknown_0201276C
	ldr r1, _02008F0C @ =0x06010200
	bl LZ77UnCompVram
_02008E78:
	ldr r0, _02008F10 @ =gUnknown_02023310
	ldr r4, _02008F14 @ =0x0203F800
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _02008F18 @ =0x0000820F
	adds r1, r0, #0
	movs r2, #0xa8
	lsls r2, r2, #2
_02008E8A:
	ldrh r3, [r4]
	adds r0, r1, r3
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne _02008E8A
	ldr r0, _02008F1C @ =gUnknown_0202100C
	ldr r1, _02008F20 @ =0x0203F86A
	ldr r4, _02008F24 @ =0x0000920F
	str r4, [sp]
	movs r2, #7
	movs r3, #6
	bl sub_02001718
	ldr r0, _02008F28 @ =gUnknown_02021060
	ldr r1, _02008F2C @ =0x0203F9E8
	str r4, [sp]
	movs r2, #0xa
	movs r3, #3
	bl sub_02001718
	ldr r0, _02008F30 @ =gUnknown_0202109C
	ldr r1, _02008F34 @ =0x0203FAA8
	ldr r4, _02008F38 @ =0x0000A20F
	str r4, [sp]
	movs r2, #3
	movs r3, #2
	bl sub_02001718
	ldr r0, _02008F3C @ =gUnknown_020210A8
	ldr r1, _02008F40 @ =0x0203FAB4
	str r4, [sp]
	movs r2, #3
	movs r3, #2
	bl sub_02001718
	ldr r0, _02008F44 @ =gUnknown_020210B4
	ldr r1, _02008F48 @ =0x0203FB28
	str r4, [sp]
	movs r2, #3
	movs r3, #2
	bl sub_02001718
	ldr r0, _02008F4C @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _02008F60
	ldr r0, _02008F50 @ =gUnknown_020210C0
	ldr r1, _02008F54 @ =0x0203FB2E
	str r4, [sp]
	movs r2, #6
	movs r3, #2
	bl sub_02001718
	ldr r0, _02008F58 @ =gUnknown_020210F0
	ldr r1, _02008F5C @ =0x0203FBE8
	str r4, [sp]
	movs r2, #9
	movs r3, #4
	bl sub_02001718
	b _02008F7C
	.align 2, 0
_02008F08: .4byte gUnknown_0201276C
_02008F0C: .4byte 0x06010200
_02008F10: .4byte gUnknown_02023310
_02008F14: .4byte 0x0203F800
_02008F18: .4byte 0x0000820F
_02008F1C: .4byte gUnknown_0202100C
_02008F20: .4byte 0x0203F86A
_02008F24: .4byte 0x0000920F
_02008F28: .4byte gUnknown_02021060
_02008F2C: .4byte 0x0203F9E8
_02008F30: .4byte gUnknown_0202109C
_02008F34: .4byte 0x0203FAA8
_02008F38: .4byte 0x0000A20F
_02008F3C: .4byte gUnknown_020210A8
_02008F40: .4byte 0x0203FAB4
_02008F44: .4byte gUnknown_020210B4
_02008F48: .4byte 0x0203FB28
_02008F4C: .4byte gUnknown_03003330
_02008F50: .4byte gUnknown_020210C0
_02008F54: .4byte 0x0203FB2E
_02008F58: .4byte gUnknown_020210F0
_02008F5C: .4byte 0x0203FBE8
_02008F60:
	ldr r0, _02009018 @ =gUnknown_020210D8
	ldr r1, _0200901C @ =0x0203FB2E
	str r4, [sp]
	movs r2, #6
	movs r3, #2
	bl sub_02001718
	ldr r0, _02009020 @ =gUnknown_02021138
	ldr r1, _02009024 @ =0x0203FBE8
	str r4, [sp]
	movs r2, #9
	movs r3, #4
	bl sub_02001718
_02008F7C:
	ldr r4, _02009028 @ =0x0203F8C4
	movs r1, #0
	ldr r6, _0200902C @ =sub_02009850
	mov ip, r6
	ldr r7, _02009030 @ =gUnknown_03004400
	ldr r0, _02009034 @ =gUnknown_02020F1C
	mov r8, r0
	ldr r2, _02009038 @ =0x000082AF
	adds r5, r2, #0
_02008F8E:
	lsls r0, r1, #4
	adds r3, r1, #1
	mov r6, r8
	adds r1, r0, r6
	movs r2, #0xf
_02008F98:
	ldrb r6, [r1]
	adds r0, r5, r6
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bge _02008F98
	adds r4, #0x20
	adds r1, r3, #0
	cmp r1, #0xe
	ble _02008F8E
	ldr r4, _0200903C @ =0x0203FA2A
	movs r2, #0
	ldr r6, _02009040 @ =gUnknown_03003BEA
	ldr r5, _02009044 @ =gUnknown_03001968
	ldr r0, _02009048 @ =0xFFFF92AF
	adds r3, r0, #0
_02008FBC:
	adds r0, r2, r6
	ldrb r1, [r0]
	cmp r1, #0
	bne _02008FC6
	movs r1, #0x5f
_02008FC6:
	adds r0, r2, r5
	strb r1, [r0]
	adds r0, r1, r3
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, #6
	ble _02008FBC
	mov r0, ip
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _0200904C @ =sub_0200905c
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _02009050 @ =sub_0200979c
	adds r1, r7, #0
	movs r2, #0
	bl sub_02000d04
	movs r1, #0x10
	strb r1, [r0, #0x1a]
	movs r1, #0xc2
	lsls r1, r1, #5
	movs r0, #0
	bl sub_0200167c
	ldr r1, _02009054 @ =gUnknown_03003330
	movs r0, #0x91
	strb r0, [r1, #0xf]
	ldr r0, _02009058 @ =sub_0200969C
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009018: .4byte gUnknown_020210D8
_0200901C: .4byte 0x0203FB2E
_02009020: .4byte gUnknown_02021138
_02009024: .4byte 0x0203FBE8
_02009028: .4byte 0x0203F8C4
_0200902C: .4byte sub_02009850
_02009030: .4byte gUnknown_03004400
_02009034: .4byte gUnknown_02020F1C
_02009038: .4byte 0x000082AF
_0200903C: .4byte 0x0203FA2A
_02009040: .4byte gUnknown_03003BEA
_02009044: .4byte gUnknown_03001968
_02009048: .4byte 0xFFFF92AF
_0200904C: .4byte sub_0200905c
_02009050: .4byte sub_0200979c
_02009054: .4byte gUnknown_03003330
_02009058: .4byte sub_0200969C

	thumb_func_start sub_0200905c
sub_0200905c: @ 0x0200905c
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r0, #2
	strh r0, [r4, #0xa]
	movs r0, #1
	strh r0, [r4, #0xe]
	movs r0, #7
	strh r0, [r4, #0xc]
	strb r1, [r4, #0x1a]
	movs r0, #6
	strb r0, [r4, #0x19]
	ldr r1, _020090CC @ =gUnknown_03001968
	ldrb r0, [r1, #6]
	ldr r2, _020090D0 @ =sub_020097d0
	cmp r0, #0x5f
	bne _0200909A
	movs r5, #5
	ldrb r0, [r1, #5]
	cmp r0, #0x5f
	bne _0200909A
_02009086:
	ldrb r0, [r4, #0x19]
	subs r0, #1
	strb r0, [r4, #0x19]
	subs r5, #1
	cmp r5, #0
	blt _0200909A
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0x5f
	beq _02009086
_0200909A:
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldrb r5, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x20
	strb r5, [r0]
	ldr r0, _020090D4 @ =sub_02009800
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	strb r5, [r0, #0x1b]
	ldrb r0, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x23
	strb r0, [r1]
	ldr r0, _020090D8 @ =sub_020090dc
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020090CC: .4byte gUnknown_03001968
_020090D0: .4byte sub_020097d0
_020090D4: .4byte sub_02009800
_020090D8: .4byte sub_020090dc

	thumb_func_start sub_020090dc
sub_020090dc: @ 0x020090dc
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _02009110 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _020090F0
	b _020092F6
_020090F0:
	ldr r0, _02009114 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _02009118
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _0200913A
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq _02009152
	b _0200913A
	.align 2, 0
_02009110: .4byte gUnknown_03003330
_02009114: .4byte gUnknown_030043F0
_02009118:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02009142
	ands r1, r2
	cmp r1, #0
	beq _020091B2
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200917E
	cmp r0, #1
	bne _0200914A
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _02009142
_0200913A:
	adds r0, r4, #0
	bl sub_02009528
	b _020092F6
_02009142:
	adds r0, r4, #0
	bl sub_02009724
	b _020091B2
_0200914A:
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0200915A
_02009152:
	adds r0, r4, #0
	bl sub_02009778
	b _020092F6
_0200915A:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	bne _02009174
	ldr r0, _02009170 @ =gUnknown_03001968
	ldrb r0, [r0, #6]
	cmp r0, #0x5f
	bne _02009174
	movs r0, #0xe       @ SE_MSGBOX
	bl m4aSongNumStart
	b _020091B2
	.align 2, 0
_02009170: .4byte gUnknown_03001968
_02009174:
	adds r0, r4, #0
	movs r1, #0x5f
	bl sub_020093c0
	b _020091B2
_0200917E:
	ldrh r0, [r4, #8]
	cmp r0, #0xd
	bne _0200919E
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _0200919E
	ldr r2, _020091FC @ =gUnknown_03004400
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #7]
_0200919E:
	ldr r0, _02009200 @ =gUnknown_02020F1C
	ldrh r1, [r4, #0xc]
	lsls r1, r1, #4
	ldrh r3, [r4, #8]
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r4, #0
	bl sub_020093c0
_020091B2:
	adds r0, r4, #0
	movs r1, #0
	bl sub_02009310
	ldr r0, _02009204 @ =gUnknown_030043F0
	ldrh r1, [r0, #6]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _02009224
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _020091DC
	movs r2, #0
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _020091DA
	movs r2, #1
_020091DA:
	strh r2, [r4, #0xe]
_020091DC:
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _02009208
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02009290
	movs r0, #0xf
	strh r0, [r4, #8]
	b _02009290
	.align 2, 0
_020091FC: .4byte gUnknown_03004400
_02009200: .4byte gUnknown_02020F1C
_02009204: .4byte gUnknown_030043F0
_02009208:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _02009290
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _02009290
	strh r2, [r4, #8]
	strh r2, [r4, #0xa]
	b _02009290
_02009224:
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _02009244
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bls _0200925C
	movs r0, #0xe
	strh r0, [r4, #0xc]
	b _0200925C
_02009244:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200925C
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bls _0200925C
	strh r2, [r4, #0xc]
_0200925C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02009276
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bls _02009290
	movs r0, #2
	b _0200928E
_02009276:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _02009290
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bls _02009290
	movs r0, #1
_0200928E:
	strh r0, [r4, #0xa]
_02009290:
	movs r0, #0xf0
	ands r1, r0
	cmp r1, #0
	beq _020092A2
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
	movs r0, #0
	strb r0, [r4, #0x1a]
_020092A2:
	ldrb r1, [r4, #0x1a]
	adds r0, r1, #1
	strb r0, [r4, #0x1a]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _020092B8
	adds r0, r4, #0
	movs r1, #1
	bl sub_02009310
_020092B8:
	ldr r2, _020092FC @ =0x0203FA2A
	movs r1, #0
	ldr r6, _02009300 @ =gUnknown_03003330
	ldr r5, _02009304 @ =gUnknown_03001968
	ldr r0, _02009308 @ =0x000092AF
	adds r3, r0, #0
_020092C4:
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #6
	ble _020092C4
	ldr r0, [r6, #8]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _020092F6
	ldrb r0, [r4, #0x19]
	lsls r0, r0, #1
	ldr r1, _020092FC @ =0x0203FA2A
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r0, _0200930C @ =0x00000FFF
	ands r0, r1
	movs r3, #0xa0
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_020092F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020092FC: .4byte 0x0203FA2A
_02009300: .4byte gUnknown_03003330
_02009304: .4byte gUnknown_03001968
_02009308: .4byte 0x000092AF
_0200930C: .4byte 0x00000FFF

	thumb_func_start sub_02009310
sub_02009310: @ 0x02009310
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0xa
	ldrsh r3, [r2, r0]
	cmp r3, #0
	beq _02009356
	movs r5, #0x14
	movs r0, #3
	mov ip, r0
	movs r4, #2
	movs r0, #0xa0
	lsls r0, r0, #8
	cmp r1, #0
	beq _02009334
	movs r0, #0xb0
	lsls r0, r0, #8
_02009334:
	adds r7, r0, #0
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0200934C
	movs r2, #0xc
	cmp r3, #2
	bne _02009378
	movs r5, #0x17
	movs r0, #6
	mov ip, r0
	b _02009378
_0200934C:
	movs r2, #0xa
	cmp r3, #2
	bne _02009378
	movs r5, #0x1a
	b _02009378
_02009356:
	ldrb r0, [r2, #8]
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r2, #0xc]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r4, #1
	mov ip, r4
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, #0
	beq _02009376
	movs r0, #0xa0
	lsls r0, r0, #8
_02009376:
	adds r7, r0, #0
_02009378:
	lsls r2, r2, #6
	lsls r0, r5, #1
	ldr r1, _02009388 @ =0x0203F800
	adds r0, r0, r1
	adds r6, r2, r0
	subs r0, r4, #1
	lsls r0, r0, #0x18
	b _020093B0
	.align 2, 0
_02009388: .4byte 0x0203F800
_0200938C:
	adds r3, r6, #0
	adds r6, #0x40
	subs r4, #1
	mov r1, ip
	cmp r1, #0
	beq _020093AE
	ldr r5, _020093BC @ =0x00000FFF
	mov r2, ip
_0200939C:
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r7
	strh r0, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _0200939C
_020093AE:
	lsls r0, r4, #0x18
_020093B0:
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	bne _0200938C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020093BC: .4byte 0x00000FFF

	thumb_func_start sub_020093c0
sub_020093c0: @ 0x020093c0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	adds r0, r1, #0
	adds r0, #0x11
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0200940C
	ldr r0, _020093F0 @ =gUnknown_03001968
	ldrb r2, [r4, #0x19]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0x5f
	beq _020093F4
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	bl sub_02009458
	b _02009448
	.align 2, 0
_020093F0: .4byte gUnknown_03001968
_020093F4:
	cmp r2, #0
	bne _02009400
	movs r0, #0xe       @ SE_MSGBOX
	bl m4aSongNumStart
	b _02009448
_02009400:
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl sub_02009458
	b _02009448
_0200940C:
	movs r3, #0xd       @ SE_13
	cmp r1, #0x5f
	beq _02009428
	movs r3, #0xc       @ SE_CONFIRM
	ldr r2, _02009450 @ =gUnknown_03004400
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x14
	strb r1, [r0, #7]
_02009428:
	adds r0, r3, #0
	bl m4aSongNumStart
	ldr r2, _02009454 @ =gUnknown_03001968
	ldrb r0, [r4, #0x19]
	adds r1, r0, #1
	strb r1, [r4, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r2
	strb r5, [r0]
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	bls _02009448
	movs r0, #6
	strb r0, [r4, #0x19]
_02009448:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02009450: .4byte gUnknown_03004400
_02009454: .4byte gUnknown_03001968

	thumb_func_start sub_02009458
sub_02009458: @ 0x02009458
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r2, _0200949C @ =gUnknown_03001968
	ldrb r0, [r5, #0x19]
	subs r0, r0, r6
	adds r0, r0, r2
	ldrb r4, [r0]
	cmp r1, #0xef
	bne _020094B0
	movs r1, #0
	ldr r0, _020094A0 @ =gUnknown_02021198
	ldrb r2, [r0]
	cmp r4, r2
	beq _02009490
	adds r2, r0, #0
_02009482:
	adds r1, #1
	cmp r1, #0x14
	bgt _020094CE
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r4, r0
	bne _02009482
_02009490:
	cmp r1, #0x14
	bgt _020094CE
	cmp r4, #0xa5
	bne _020094A4
	movs r4, #0xfe
	b _020094E2
	.align 2, 0
_0200949C: .4byte gUnknown_03001968
_020094A0: .4byte gUnknown_02021198
_020094A4:
	cmp r4, #0xc2
	bne _020094AC
	movs r4, #0xc4
	b _020094E2
_020094AC:
	adds r0, r4, #1
	b _020094DE
_020094B0:
	movs r1, #0x10
	ldr r0, _020094D8 @ =gUnknown_02021198
	ldrb r2, [r0, #0x10]
	cmp r4, r2
	beq _020094CA
	adds r2, r0, #0
_020094BC:
	adds r1, #1
	cmp r1, #0x14
	bgt _020094CE
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r4, r0
	bne _020094BC
_020094CA:
	cmp r1, #0x14
	ble _020094DC
_020094CE:
	movs r0, #0xe       @ SE_MSGBOX
	bl m4aSongNumStart
	b _02009518
	.align 2, 0
_020094D8: .4byte gUnknown_02021198
_020094DC:
	adds r0, r4, #2
_020094DE:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_020094E2:
	movs r0, #0xc       @ SE_CONFIRM
	bl m4aSongNumStart
	ldr r2, _02009520 @ =gUnknown_03004400
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x14
	strb r1, [r0, #7]
	ldr r1, _02009524 @ =gUnknown_03001968
	ldrb r0, [r5, #0x19]
	subs r0, r0, r6
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r5, #0x19]
	adds r0, r7, r0
	strb r0, [r5, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bls _02009518
	movs r0, #6
	strb r0, [r5, #0x19]
_02009518:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009520: .4byte gUnknown_03004400
_02009524: .4byte gUnknown_03001968

	thumb_func_start sub_02009528
sub_02009528: @ 0x02009528
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #6
	ldr r0, _02009588 @ =gUnknown_03001968
	ldrb r1, [r0, #6]
	adds r3, r0, #0
	cmp r1, #0x5f
	bne _0200954E
	adds r4, r3, #0
	movs r1, #0
_0200953C:
	adds r0, r2, r4
	strb r1, [r0]
	subs r2, #1
	cmp r2, #0
	blt _0200954E
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x5f
	beq _0200953C
_0200954E:
	movs r2, #0
	ldr r4, _0200958C @ =gUnknown_03003BEA
	ldr r3, _02009588 @ =gUnknown_03001968
_02009554:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _02009554
	movs r0, #0xc       @ SE_CONFIRM
	bl m4aSongNumStart
	adds r0, r5, #0
	bl sub_02000ed4
	ldr r2, _02009590 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #0xf]
	ldr r0, _02009594 @ =gUnknown_03003B80
	adds r0, #0xcd
	movs r1, #1
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02009588: .4byte gUnknown_03001968
_0200958C: .4byte gUnknown_03003BEA
_02009590: .4byte gUnknown_03003330
_02009594: .4byte gUnknown_03003B80

	thumb_func_start sub_02009598
sub_02009598: @ 0x02009598
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _020095F0 @ =gUnknown_02012890
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r5, sp, #4
	ldr r1, _020095F4 @ =gUnknown_02012894
	adds r0, r5, #0
	movs r2, #4
	bl memcpy
	add r4, sp, #8
	ldr r1, _020095F8 @ =gUnknown_02012898
	adds r0, r4, #0
	movs r2, #0x10
	bl memcpy
	ldrb r0, [r6, #7]
	adds r7, r4, #0
	cmp r0, #0
	beq _020095E0
	movs r2, #0
	strb r2, [r6, #7]
	adds r1, r6, #0
	adds r1, #0x23
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _020095E0
	strb r2, [r1]
_020095E0:
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #3
	bne _02009600
	ldr r0, _020095FC @ =gUnknown_020203D4
	b _02009602
	.align 2, 0
_020095F0: .4byte gUnknown_02012890
_020095F4: .4byte gUnknown_02012894
_020095F8: .4byte gUnknown_02012898
_020095FC: .4byte gUnknown_020203D4
_02009600:
	ldr r0, _02009694 @ =gUnknown_020203B4
_02009602:
	str r0, [r6, #0x10]
	ldrb r0, [r6, #0x1a]
	subs r0, #1
	strb r0, [r6, #0x1a]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _02009626
	movs r0, #0x12
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #0x19]
	adds r0, #1
	strb r0, [r6, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _02009626
	strb r1, [r6, #0x19]
_02009626:
	ldrb r0, [r6, #0x19]
	add r0, sp
	ldrb r2, [r0]
	ldrb r1, [r4]
	adds r1, r5, r1
	movs r3, #0xd2
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r2, r2, r0
	strh r2, [r6, #0x14]
	ldrb r0, [r6, #0x1b]
	lsls r3, r0, #3
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r0, _02009698 @ =gUnknown_03004400
	adds r3, r3, r0
	ldrb r1, [r6, #0x19]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #1
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r6, #0xa]
	adds r0, r0, r1
	strh r0, [r3, #0xa]
	ldrb r0, [r6, #0x19]
	ands r2, r0
	lsls r2, r2, #1
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r2, r2, r0
	mov r0, sp
	adds r0, #9
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r6, #0xe]
	adds r0, r0, r1
	strh r0, [r3, #0xe]
	adds r0, r6, #0
	bl sub_02009828
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009694: .4byte gUnknown_020203B4
_02009698: .4byte gUnknown_03004400

	thumb_func_start sub_0200969C
sub_0200969C: @ 0x0200969C
	push {lr}
	bl sub_020016d8
	bl sub_020012e0
	ldr r0, _020096D4 @ =0x0203F800
	ldr r1, _020096D8 @ =0x0600D800
	movs r2, #0xa8
	lsls r2, r2, #1
	bl CpuFastSet
	bl sub_02000eac
	bl sub_02001088
	ldr r2, _020096DC @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _020096CE
	movs r0, #0
	strh r0, [r2, #0xc]
	ldr r0, _020096E0 @ =sub_020096e4
	str r0, [r2]
_020096CE:
	pop {r0}
	bx r0
	.align 2, 0
_020096D4: .4byte 0x0203F800
_020096D8: .4byte 0x0600D800
_020096DC: .4byte gUnknown_03003330
_020096E0: .4byte sub_020096e4

	thumb_func_start sub_020096e4
sub_020096e4: @ 0x020096e4
	push {r4, lr}
	ldr r1, _02009710 @ =0x04000054
	ldr r4, _02009714 @ =gUnknown_03003330
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _02009708
	ldr r0, _02009718 @ =gUnknown_03001948
	ldr r1, _0200971C @ =0x05000220
	movs r2, #0x10
	bl CpuSet
	ldr r0, _02009720 @ =sub_02001b58
	str r0, [r4]
_02009708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02009710: .4byte 0x04000054
_02009714: .4byte gUnknown_03003330
_02009718: .4byte gUnknown_03001948
_0200971C: .4byte 0x05000220
_02009720: .4byte sub_02001b58

	thumb_func_start sub_02009724
sub_02009724: @ 0x02009724
	push {r4, lr}
	adds r3, r0, #0
	movs r4, #0xd       @ SE_13
	ldrb r0, [r3, #0x19]
	cmp r0, #0
	bne _02009748
	ldr r1, _02009740 @ =gUnknown_03001968
	ldrb r0, [r1]
	cmp r0, #0x5f
	beq _02009744
	movs r0, #0x5f
	strb r0, [r1]
	b _02009768
	.align 2, 0
_02009740: .4byte gUnknown_03001968
_02009744:
	movs r4, #0xe       @ SE_MSGBOX
	b _02009768
_02009748:
	ldr r2, _02009774 @ =gUnknown_03001968
	ldrb r0, [r3, #0x19]
	subs r1, r0, #1
	adds r1, r1, r2
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r3, #0x19]
	adds r1, r0, #0
	adds r1, #0xff
	strb r1, [r3, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r2
	movs r1, #0x5f
	strb r1, [r0]
_02009768:
	adds r0, r4, #0
	bl m4aSongNumStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02009774: .4byte gUnknown_03001968

	thumb_func_start sub_02009778
sub_02009778: @ 0x02009778
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	bl m4aSongNumStart
	adds r0, r4, #0
	bl sub_02000ed4
	ldr r2, _02009798 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #0xf]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02009798: .4byte gUnknown_03003330

	thumb_func_start sub_0200979c
sub_0200979c: @ 0x0200979c
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x1a]
	subs r1, #1
	strb r1, [r4, #0x1a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x54
	bl sub_02001698
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _020097C6
	adds r0, r4, #0
	bl sub_02000ed4
	ldr r2, _020097CC @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #0xf]
_020097C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020097CC: .4byte gUnknown_03003330

	thumb_func_start sub_020097d0
sub_020097d0: @ 0x020097d0
	push {lr}
	adds r1, r0, #0
	movs r0, #0xb6
	lsls r0, r0, #1
	strh r0, [r1, #0x14]
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _020097EC
	subs r0, #1
	strb r0, [r1, #7]
	ldr r0, _020097E8 @ =gUnknown_02020404
	b _020097EE
	.align 2, 0
_020097E8: .4byte gUnknown_02020404
_020097EC:
	ldr r0, _020097FC @ =gUnknown_020203FC
_020097EE:
	str r0, [r1, #0x10]
	adds r0, r1, #0
	bl sub_02009828
	pop {r0}
	bx r0
	.align 2, 0
_020097FC: .4byte gUnknown_020203FC

	thumb_func_start sub_02009800
sub_02009800: @ 0x02009800
	push {lr}
	movs r2, #0
	movs r1, #0xc5
	strh r1, [r0, #0xa]
	movs r1, #0x2b
	strh r1, [r0, #0xe]
	movs r1, #1
	strb r1, [r0, #0x1a]
	adds r1, r0, #0
	adds r1, #0x23
	strb r2, [r1]
	ldr r1, _02009824 @ =sub_02009598
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02009824: .4byte sub_02009598

	thumb_func_start sub_02009828
sub_02009828: @ 0x02009828
	push {lr}
	adds r2, r0, #0
	ldr r0, _02009848 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200983C
	ldr r0, _0200984C @ =sub_02000ed4
	str r0, [r2]
_0200983C:
	ldrb r0, [r2, #4]
	movs r1, #0
	bl sub_02001254
	pop {r0}
	bx r0
	.align 2, 0
_02009848: .4byte gUnknown_03003330
_0200984C: .4byte sub_02000ed4

	thumb_func_start sub_02009850
sub_02009850: @ 0x02009850
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r0, #0xa0
	strh r0, [r2, #0xa]
	movs r0, #0x74
	strh r0, [r2, #0xe]
	ldr r0, _02009884 @ =gUnknown_020211B0
	str r0, [r2, #0x10]
	strh r1, [r2, #0x14]
	ldr r0, _02009888 @ =sub_02009828
	str r0, [r2]
	ldr r0, _0200988C @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02009878
	ldr r0, _02009890 @ =sub_02000ed4
	str r0, [r2]
_02009878:
	ldrb r0, [r2, #4]
	movs r1, #0
	bl sub_02001254
	pop {r0}
	bx r0
	.align 2, 0
_02009884: .4byte gUnknown_020211B0
_02009888: .4byte sub_02009828
_0200988C: .4byte gUnknown_03003330
_02009890: .4byte sub_02000ed4

	thumb_func_start sub_02009894
sub_02009894: @ 0x02009894
	push {r4, r5, lr}
	ldr r0, _020098C0 @ =gUnknown_03001971
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r5, #9
	bne _020098C8
	ldr r0, _020098C4 @ =gUnknown_03001973
	movs r1, #0
	ldrsb r1, [r0, r1]
	b _020098CA
	.align 2, 0
_020098C0: .4byte gUnknown_03001971
_020098C4: .4byte gUnknown_03001973
_020098C8:
	movs r1, #0
_020098CA:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r4, _02009900 @ =gUnknown_02015C00
	adds r1, r1, r4
	adds r0, r0, r1
	ldr r1, _02009904 @ =0x06000070
	movs r2, #0x18
	bl CpuSet
	ldr r0, _02009908 @ =gUnknown_03001973
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r0, r0, r1
	ldr r1, _0200990C @ =0x06000030
	movs r2, #0x18
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02009900: .4byte gUnknown_02015C00
_02009904: .4byte 0x06000070
_02009908: .4byte gUnknown_03001973
_0200990C: .4byte 0x06000030

	thumb_func_start sub_02009910
sub_02009910: @ 0x02009910
	push {r4, lr}
	ldr r3, _02009968 @ =gUnknown_03001974
	ldr r1, [r3]
	lsls r1, r1, #3
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r2, r4, #0
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r3]
	lsls r1, r1, #3
	ldr r0, _0200996C @ =0x07000008
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r3]
	lsls r1, r1, #3
	ldr r4, _02009970 @ =0x07000010
	adds r1, r1, r4
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r3]
	lsls r1, r1, #3
	ldr r0, _02009974 @ =0x07000018
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r3]
	lsls r1, r1, #3
	adds r4, #0x10
	adds r1, r1, r4
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02009968: .4byte gUnknown_03001974
_0200996C: .4byte 0x07000008
_02009970: .4byte 0x07000010
_02009974: .4byte 0x07000018

	thumb_func_start sub_02009978
sub_02009978: @ 0x02009978
	push {r4, lr}
	ldr r1, _020099DC @ =gUnknown_03001978
	str r0, [r1]
	ldr r4, _020099E0 @ =gUnknown_03001974
	ldr r2, [r4]
	lsls r2, r2, #3
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	ldr r1, [r2]
	ldr r3, _020099E4 @ =0xC1FFFCFF
	ands r1, r3
	lsls r0, r0, #0x1c
	orrs r1, r0
	str r1, [r2]
	ldr r2, [r4]
	lsls r2, r2, #3
	ldr r1, _020099E8 @ =0x07000008
	adds r2, r2, r1
	ldr r1, [r2]
	ands r1, r3
	orrs r1, r0
	str r1, [r2]
	ldr r2, [r4]
	lsls r2, r2, #3
	ldr r1, _020099EC @ =0x07000010
	adds r2, r2, r1
	ldr r1, [r2]
	ands r1, r3
	orrs r1, r0
	str r1, [r2]
	ldr r2, [r4]
	lsls r2, r2, #3
	ldr r1, _020099F0 @ =0x07000018
	adds r2, r2, r1
	ldr r1, [r2]
	ands r1, r3
	orrs r1, r0
	str r1, [r2]
	ldr r2, [r4]
	lsls r2, r2, #3
	ldr r1, _020099F4 @ =0x07000020
	adds r2, r2, r1
	ldr r1, [r2]
	ands r1, r3
	orrs r1, r0
	str r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020099DC: .4byte gUnknown_03001978
_020099E0: .4byte gUnknown_03001974
_020099E4: .4byte 0xC1FFFCFF
_020099E8: .4byte 0x07000008
_020099EC: .4byte 0x07000010
_020099F0: .4byte 0x07000018
_020099F4: .4byte 0x07000020

	thumb_func_start sub_020099f8
sub_020099f8: @ 0x020099f8
	push {r4, r5, lr}
	ldr r1, _02009A58 @ =gUnknown_0300197C
	str r0, [r1]
	ldr r5, _02009A5C @ =gUnknown_03001974
	ldr r2, [r5]
	lsls r2, r2, #3
	ldr r1, _02009A60 @ =0x07000004
	adds r2, r2, r1
	ldrh r3, [r2]
	movs r4, #0xfc
	lsls r4, r4, #8
	adds r1, r4, #0
	ands r1, r3
	orrs r1, r0
	strh r1, [r2]
	ldr r3, [r5]
	lsls r3, r3, #3
	ldr r2, _02009A64 @ =0x0700000C
	adds r3, r3, r2
	ldrh r2, [r3]
	adds r1, r4, #0
	ands r1, r2
	adds r2, r0, #4
	orrs r1, r2
	strh r1, [r3]
	ldr r3, [r5]
	lsls r3, r3, #3
	ldr r1, _02009A68 @ =0x07000014
	adds r3, r3, r1
	ldrh r2, [r3]
	adds r1, r4, #0
	ands r1, r2
	adds r2, r0, #6
	orrs r1, r2
	strh r1, [r3]
	ldr r1, [r5]
	lsls r1, r1, #3
	ldr r2, _02009A6C @ =0x0700001C
	adds r1, r1, r2
	ldrh r2, [r1]
	ands r4, r2
	adds r0, #8
	orrs r4, r0
	strh r4, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02009A58: .4byte gUnknown_0300197C
_02009A5C: .4byte gUnknown_03001974
_02009A60: .4byte 0x07000004
_02009A64: .4byte 0x0700000C
_02009A68: .4byte 0x07000014
_02009A6C: .4byte 0x0700001C

	thumb_func_start sub_02009a70
sub_02009a70: @ 0x02009a70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	mov ip, r1
	ldr r0, _02009B20 @ =gUnknown_03001978
	ldr r0, [r0]
	cmp r0, #0
	beq _02009B40
	ldr r6, _02009B24 @ =gUnknown_03001974
	ldr r2, [r6]
	lsls r2, r2, #3
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r2, r2, r0
	ldr r1, [r2]
	ldr r5, _02009B28 @ =0xFE00FF00
	ands r1, r5
	adds r4, r7, #0
	adds r4, #8
	ldr r0, _02009B2C @ =0x000001FF
	mov r8, r0
	ands r4, r0
	lsls r4, r4, #0x10
	movs r0, #0xff
	mov sb, r0
	mov r3, ip
	ands r3, r0
	adds r0, r4, #0
	orrs r0, r3
	orrs r1, r0
	str r1, [r2]
	ldr r1, [r6]
	lsls r1, r1, #3
	ldr r0, _02009B30 @ =0x07000008
	adds r0, r0, r1
	mov sl, r0
	ldr r0, [r0]
	ands r0, r5
	adds r2, r7, #0
	mov r1, r8
	ands r2, r1
	lsls r2, r2, #0x10
	orrs r3, r2
	orrs r0, r3
	mov r1, sl
	str r0, [r1]
	ldr r1, [r6]
	lsls r1, r1, #3
	ldr r0, _02009B34 @ =0x07000010
	adds r0, r0, r1
	mov sl, r0
	ldr r0, [r0]
	ands r0, r5
	mov r3, ip
	adds r3, #0x10
	mov r1, sb
	ands r3, r1
	orrs r4, r3
	orrs r0, r4
	mov r4, sl
	str r0, [r4]
	ldr r1, [r6]
	lsls r1, r1, #3
	ldr r0, _02009B38 @ =0x07000018
	adds r1, r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r2, r3
	orrs r0, r2
	str r0, [r1]
	ldr r3, [r6]
	lsls r3, r3, #3
	ldr r1, _02009B3C @ =0x07000020
	adds r3, r3, r1
	ldr r2, [r3]
	ands r2, r5
	adds r0, r7, #4
	mov r4, r8
	ands r0, r4
	lsls r0, r0, #0x10
	mov r1, ip
	adds r1, #0xf8
	mov r4, sb
	b _02009BDA
	.align 2, 0
_02009B20: .4byte gUnknown_03001978
_02009B24: .4byte gUnknown_03001974
_02009B28: .4byte 0xFE00FF00
_02009B2C: .4byte 0x000001FF
_02009B30: .4byte 0x07000008
_02009B34: .4byte 0x07000010
_02009B38: .4byte 0x07000018
_02009B3C: .4byte 0x07000020
_02009B40:
	ldr r6, _02009BF0 @ =gUnknown_03001974
	ldr r2, [r6]
	lsls r2, r2, #3
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r2, r2, r0
	ldr r1, [r2]
	ldr r5, _02009BF4 @ =0xFE00FF00
	ands r1, r5
	ldr r4, _02009BF8 @ =0x000001FF
	mov sb, r4
	adds r4, r7, #0
	mov r0, sb
	ands r4, r0
	lsls r4, r4, #0x10
	movs r0, #0xff
	mov r8, r0
	mov r3, ip
	ands r3, r0
	adds r0, r4, #0
	orrs r0, r3
	orrs r1, r0
	str r1, [r2]
	ldr r1, [r6]
	lsls r1, r1, #3
	ldr r0, _02009BFC @ =0x07000008
	adds r0, r0, r1
	mov sl, r0
	ldr r0, [r0]
	ands r0, r5
	adds r2, r7, #0
	adds r2, #0x10
	mov r1, sb
	ands r2, r1
	lsls r2, r2, #0x10
	orrs r3, r2
	orrs r0, r3
	mov r1, sl
	str r0, [r1]
	ldr r1, [r6]
	lsls r1, r1, #3
	ldr r0, _02009C00 @ =0x07000010
	adds r0, r0, r1
	mov sl, r0
	ldr r0, [r0]
	ands r0, r5
	mov r3, ip
	adds r3, #0x10
	mov r1, r8
	ands r3, r1
	orrs r4, r3
	orrs r0, r4
	mov r4, sl
	str r0, [r4]
	ldr r1, [r6]
	lsls r1, r1, #3
	ldr r0, _02009C04 @ =0x07000018
	adds r1, r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r2, r3
	orrs r0, r2
	str r0, [r1]
	ldr r3, [r6]
	lsls r3, r3, #3
	ldr r1, _02009C08 @ =0x07000020
	adds r3, r3, r1
	ldr r2, [r3]
	ands r2, r5
	adds r0, r7, #0
	adds r0, #0xc
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #0x10
	mov r1, ip
	adds r1, #0xf8
	mov r4, r8
_02009BDA:
	ands r1, r4
	orrs r0, r1
	orrs r2, r0
	str r2, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009BF0: .4byte gUnknown_03001974
_02009BF4: .4byte 0xFE00FF00
_02009BF8: .4byte 0x000001FF
_02009BFC: .4byte 0x07000008
_02009C00: .4byte 0x07000010
_02009C04: .4byte 0x07000018
_02009C08: .4byte 0x07000020

	thumb_func_start sub_02009c0c
sub_02009c0c: @ 0x02009c0c
	push {r4, r5, r6, r7, lr}
	ldr r4, _02009CB0 @ =gUnknown_03001985
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #7
	ldr r1, _02009CB4 @ =0x0600C0C2
	subs r2, r1, r0
	ldr r0, _02009CB8 @ =0x0000306F
	adds r1, r0, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r3, r0, #7
	ldr r0, _02009CBC @ =0x0600C042
	adds r2, r3, r0
	ldr r1, _02009CC0 @ =0x00003070
	ldr r0, _02009CC4 @ =gUnknown_03001984
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	ble _02009C46
	adds r1, #4
_02009C46:
	strh r1, [r2]
	adds r1, #1
	strh r1, [r2, #2]
	adds r1, #1
	ldr r2, _02009CC8 @ =0x0600C082
	adds r0, r3, r2
	strh r1, [r0]
	adds r1, #1
	adds r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	ldr r3, _02009CCC @ =0x0600C046
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _02009CD4
	ldr r4, _02009CD0 @ =0x00000FFF
	movs r0, #0x80
	lsls r0, r0, #7
	adds r7, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r6, r2, #0
	movs r5, #7
_02009C76:
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r7
	strh r0, [r3]
	adds r2, r3, #0
	adds r2, #0x40
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r7
	strh r0, [r2]
	adds r2, #0x40
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r2, #0x40
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r3, #2
	subs r5, #1
	cmp r5, #0
	bge _02009C76
	b _02009D1C
	.align 2, 0
_02009CB0: .4byte gUnknown_03001985
_02009CB4: .4byte 0x0600C0C2
_02009CB8: .4byte 0x0000306F
_02009CBC: .4byte 0x0600C042
_02009CC0: .4byte 0x00003070
_02009CC4: .4byte gUnknown_03001984
_02009CC8: .4byte 0x0600C082
_02009CCC: .4byte 0x0600C046
_02009CD0: .4byte 0x00000FFF
_02009CD4:
	ldr r4, _02009D24 @ =0x00000FFF
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r6, r2, #0
	movs r5, #7
_02009CE4:
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r7
	strh r0, [r3]
	adds r2, r3, #0
	adds r2, #0x40
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r7
	strh r0, [r2]
	adds r2, #0x40
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r2, #0x40
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r3, #2
	subs r5, #1
	cmp r5, #0
	bge _02009CE4
_02009D1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009D24: .4byte 0x00000FFF

	thumb_func_start sub_02009d28
sub_02009d28: @ 0x02009d28
	push {r4, lr}
	movs r4, #0
	ldr r1, _02009D44 @ =gUnknown_03001984
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3c
	bne _02009D48
	strb r4, [r1]
	bl sub_02009c0c
	b _02009D50
	.align 2, 0
_02009D44: .4byte gUnknown_03001984
_02009D48:
	cmp r0, #0x1e
	bne _02009D50
	bl sub_02009c0c
_02009D50:
	ldr r2, _02009D78 @ =gUnknown_03001985
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _02009D80
	ldr r0, _02009D7C @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02009D9A
	movs r0, #1
	strb r0, [r2]
	bl sub_02009c0c
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
	b _02009D9A
	.align 2, 0
_02009D78: .4byte gUnknown_03001985
_02009D7C: .4byte gUnknown_030043F0
_02009D80:
	ldr r0, _02009DC0 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _02009D9A
	movs r0, #0
	strb r0, [r2]
	bl sub_02009c0c
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_02009D9A:
	ldr r0, _02009DC0 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _02009DC8
	movs r0, #0xc       @ SE_CONFIRM
	bl m4aSongNumStart
	ldr r0, _02009DC4 @ =gUnknown_03001985
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0
	beq _02009DD8
	movs r4, #1
	b _02009DDC
	.align 2, 0
_02009DC0: .4byte gUnknown_030043F0
_02009DC4: .4byte gUnknown_03001985
_02009DC8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02009DD8
	movs r0, #0xd
	bl m4aSongNumStart
	movs r4, #2
_02009DD8:
	cmp r4, #0
	beq _02009DE8
_02009DDC:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _02009DF0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
_02009DE8:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02009DF0: .4byte 0x0000FEFF

	thumb_func_start sub_02009df4
sub_02009df4: @ 0x02009df4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _02009E14 @ =gUnknown_03001986
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r1, #5
	bls _02009E08
	b _0200A0B4
_02009E08:
	lsls r0, r1, #2
	ldr r1, _02009E18 @ =_02009E1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02009E14: .4byte gUnknown_03001986
_02009E18: .4byte _02009E1C
_02009E1C: @ jump table
	.4byte _0200A0B4 @ case 0
	.4byte _0200A11C @ case 1
	.4byte _02009E34 @ case 2
	.4byte _02009F48 @ case 3
	.4byte _0200A0C4 @ case 4
	.4byte _0200A100 @ case 5
_02009E34:
	ldr r0, _02009E4C @ =gUnknown_03001987
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r1, #4
	bls _02009E42
	b _0200A14E
_02009E42:
	lsls r0, r1, #2
	ldr r1, _02009E50 @ =_02009E54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02009E4C: .4byte gUnknown_03001987
_02009E50: .4byte _02009E54
_02009E54: @ jump table
	.4byte _02009E68 @ case 0
	.4byte _02009EEC @ case 1
	.4byte _0200A03C @ case 2
	.4byte _0200A078 @ case 3
	.4byte _02009F18 @ case 4
_02009E68:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _02009ED4 @ =0x0600C000
	ldr r2, _02009ED8 @ =0x01000400
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r3, _02009EDC @ =0x00005009
	movs r1, #0
	ldr r6, _02009EE0 @ =gUnknown_03001987
	ldr r7, _02009EE4 @ =gUnknown_03001988
_02009E82:
	lsls r0, r1, #6
	adds r2, r1, #1
	adds r0, r0, r4
	movs r1, #0x13
_02009E8A:
	strh r3, [r0]
	adds r3, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _02009E8A
	adds r1, r2, #0
	cmp r1, #2
	ble _02009E82
	movs r3, #0
	ldr r1, _02009EE8 @ =0x04000008
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #8
	movs r0, #0xf0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x18
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strb r0, [r6]
	strh r3, [r7]
	movs r0, #0x17      @ SE_MINIGAME_LOST
	bl m4aSongNumStart
	b _0200A14E
	.align 2, 0
_02009ED4: .4byte 0x0600C000
_02009ED8: .4byte 0x01000400
_02009EDC: .4byte 0x00005009
_02009EE0: .4byte gUnknown_03001987
_02009EE4: .4byte gUnknown_03001988
_02009EE8: .4byte 0x04000008
_02009EEC:
	ldr r2, _02009F14 @ =gUnknown_03001988
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	cmp r0, #0
	bge _02009EFE
	adds r0, #3
_02009EFE:
	asrs r1, r0, #2
	movs r0, #0x8c
	lsls r0, r0, #1
	subs r1, r0, r1
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	cmp r1, #0xb7
	ble _02009F12
	b _0200A02C
_02009F12:
	b _0200A022
	.align 2, 0
_02009F14: .4byte gUnknown_03001988
_02009F18:
	ldr r1, _02009F3C @ =0x04000054
	ldr r2, _02009F40 @ =gUnknown_03001988
	ldrh r0, [r2]
	strh r0, [r1]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _02009F2C
	b _0200A14E
_02009F2C:
	ldr r0, _02009F44 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	movs r0, #4
	strb r0, [r3]
	strh r1, [r2]
	b _0200A14E
	.align 2, 0
_02009F3C: .4byte 0x04000054
_02009F40: .4byte gUnknown_03001988
_02009F44: .4byte 0x04000050
_02009F48:
	ldr r0, _02009F60 @ =gUnknown_03001987
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r1, #4
	bls _02009F56
	b _0200A14E
_02009F56:
	lsls r0, r1, #2
	ldr r1, _02009F64 @ =_02009F68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02009F60: .4byte gUnknown_03001987
_02009F64: .4byte _02009F68
_02009F68: @ jump table
	.4byte _02009F7C @ case 0
	.4byte _0200A000 @ case 1
	.4byte _0200A03C @ case 2
	.4byte _0200A078 @ case 3
	.4byte _0200A09C @ case 4
_02009F7C:
	mov r0, sp
	adds r0, #2
	movs r1, #0
	strh r1, [r0]
	ldr r4, _02009FE8 @ =0x0600C000
	ldr r2, _02009FEC @ =0x01000400
	adds r1, r4, #0
	bl CpuSet
	ldr r3, _02009FF0 @ =0x00006045
	movs r1, #0
	ldr r6, _02009FF4 @ =gUnknown_03001987
	ldr r7, _02009FF8 @ =gUnknown_03001988
_02009F96:
	lsls r0, r1, #6
	adds r2, r1, #1
	adds r0, r0, r4
	movs r1, #0xc
_02009F9E:
	strh r3, [r0]
	adds r3, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _02009F9E
	adds r1, r2, #0
	cmp r1, #2
	ble _02009F96
	movs r3, #0
	ldr r1, _02009FFC @ =0x04000008
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #8
	movs r0, #0xd0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x60
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strb r0, [r6]
	strh r3, [r7]
	movs r0, #0x23      @ SE_GAUGE_LVL_UP
	bl m4aSongNumStart
	b _0200A14E
	.align 2, 0
_02009FE8: .4byte 0x0600C000
_02009FEC: .4byte 0x01000400
_02009FF0: .4byte 0x00006045
_02009FF4: .4byte gUnknown_03001987
_02009FF8: .4byte gUnknown_03001988
_02009FFC: .4byte 0x04000008
_0200A000:
	ldr r2, _0200A034 @ =gUnknown_03001988
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	cmp r0, #0
	bge _0200A012
	adds r0, #3
_0200A012:
	asrs r0, r0, #2
	adds r1, r0, #0
	adds r1, #0x60
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	cmp r1, #0xb8
	ble _0200A02C
_0200A022:
	movs r1, #0xb8
	movs r0, #2
	strb r0, [r6]
	movs r0, #0
	strh r0, [r2]
_0200A02C:
	ldr r0, _0200A038 @ =0x04000012
	strh r1, [r0]
	b _0200A14E
	.align 2, 0
_0200A034: .4byte gUnknown_03001988
_0200A038: .4byte 0x04000012
_0200A03C:
	ldr r3, _0200A06C @ =gUnknown_03001988
	movs r1, #0
	ldrsh r0, [r3, r1]
	adds r0, #0xb8
	ldr r1, _0200A070 @ =0x04000012
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	beq _0200A058
	b _0200A14E
_0200A058:
	ldr r0, _0200A074 @ =0x04000054
	movs r2, #0
	strh r2, [r0]
	adds r1, #0x3e
	movs r0, #0x81
	strh r0, [r1]
	movs r0, #3
	strb r0, [r6]
	strh r2, [r3]
	b _0200A14E
	.align 2, 0
_0200A06C: .4byte gUnknown_03001988
_0200A070: .4byte 0x04000012
_0200A074: .4byte 0x04000054
_0200A078:
	ldr r2, _0200A094 @ =0x04000054
	ldr r1, _0200A098 @ =gUnknown_03001988
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0200A14E
	movs r0, #4
	strb r0, [r6]
	b _0200A14E
	.align 2, 0
_0200A094: .4byte 0x04000054
_0200A098: .4byte gUnknown_03001988
_0200A09C:
	ldr r2, _0200A0B8 @ =0x04000054
	ldr r1, _0200A0BC @ =gUnknown_03001988
	ldrh r0, [r1]
	strh r0, [r2]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0200A14E
	ldr r1, _0200A0C0 @ =0x04000050
	movs r0, #0
	strh r0, [r1]
_0200A0B4:
	movs r5, #1
	b _0200A14E
	.align 2, 0
_0200A0B8: .4byte 0x04000054
_0200A0BC: .4byte gUnknown_03001988
_0200A0C0: .4byte 0x04000050
_0200A0C4:
	ldr r0, _0200A0F4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	ldr r7, _0200A0F8 @ =gUnknown_03001988
	cmp r0, #0
	bne _0200A0E0
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb4
	bne _0200A14E
_0200A0E0:
	movs r0, #5
	strb r0, [r3]
	movs r0, #0
	strh r0, [r7]
	ldr r0, _0200A0FC @ =gMPlayInfo_BGM
	movs r1, #1
	bl m4aMPlayFadeOut
	b _0200A14E
	.align 2, 0
_0200A0F4: .4byte gUnknown_030043F0
_0200A0F8: .4byte gUnknown_03001988
_0200A0FC: .4byte gMPlayInfo_BGM
_0200A100:
	ldr r0, _0200A114 @ =0x04000054
	ldr r2, _0200A118 @ =gUnknown_03001988
	ldrh r1, [r2]
	strh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r7, r2, #0
	cmp r1, #0x10
	bne _0200A13A
	b _0200A138
	.align 2, 0
_0200A114: .4byte 0x04000054
_0200A118: .4byte gUnknown_03001988
_0200A11C:
	ldr r3, _0200A158 @ =0x04000054
	ldr r2, _0200A15C @ =gUnknown_03001988
	ldrh r1, [r2]
	movs r0, #0x10
	subs r0, r0, r1
	strh r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r7, r2, #0
	cmp r1, #0x10
	bne _0200A13A
	ldr r1, _0200A160 @ =0x04000050
	movs r0, #0
	strh r0, [r1]
_0200A138:
	movs r5, #1
_0200A13A:
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bne _0200A148
	ldr r1, _0200A160 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
_0200A148:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0200A14E:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200A158: .4byte 0x04000054
_0200A15C: .4byte gUnknown_03001988
_0200A160: .4byte 0x04000050

	thumb_func_start sub_0200a164
sub_0200a164: @ 0x0200a164
	push {lr}
	lsls r0, r0, #7
	adds r0, r0, r1
	lsls r1, r1, #1
	bl __divsi3
	adds r2, r0, #0
	movs r0, #0xff
	ands r2, r0
	cmp r2, #0x3f
	bgt _0200A184
	ldr r1, _0200A180 @ =gUnknown_02015B7E
	b _0200A1B4
	.align 2, 0
_0200A180: .4byte gUnknown_02015B7E
_0200A184:
	cmp r2, #0x7f
	bgt _0200A194
	ldr r1, _0200A190 @ =gUnknown_02015B7E
	movs r0, #0x7f
	b _0200A19C
	.align 2, 0
_0200A190: .4byte gUnknown_02015B7E
_0200A194:
	cmp r2, #0xbf
	bgt _0200A1B0
	ldr r1, _0200A1AC @ =gUnknown_02015B7E
	movs r0, #0x80
_0200A19C:
	eors r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _0200A1BC
	.align 2, 0
_0200A1AC: .4byte gUnknown_02015B7E
_0200A1B0:
	ldr r1, _0200A1C0 @ =gUnknown_02015B7E
	eors r2, r0
_0200A1B4:
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
_0200A1BC:
	pop {r1}
	bx r1
	.align 2, 0
_0200A1C0: .4byte gUnknown_02015B7E

	thumb_func_start sub_0200a1c4
sub_0200a1c4: @ 0x0200a1c4
	push {lr}
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	lsls r2, r2, #2
	ldr r1, _0200A1E8 @ =gUnknown_02015C00
	adds r2, r2, r1
	adds r0, r0, r2
	lsls r3, r3, #5
	ldr r1, _0200A1EC @ =0x06000010
	adds r3, r3, r1
	adds r1, r3, #0
	movs r2, #0x18
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_0200A1E8: .4byte gUnknown_02015C00
_0200A1EC: .4byte 0x06000010

	thumb_func_start sub_0200a1f0
sub_0200a1f0: @ 0x0200a1f0
	push {lr}
	ldr r0, _0200A20C @ =gUnknown_03001970
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0200A210 @ =gUnknown_03001971
	strb r1, [r0]
	ldr r0, _0200A214 @ =gUnknown_03001972
	strb r1, [r0]
	ldr r0, _0200A218 @ =gUnknown_03001973
	strb r1, [r0]
	bl sub_02009894
	pop {r0}
	bx r0
	.align 2, 0
_0200A20C: .4byte gUnknown_03001970
_0200A210: .4byte gUnknown_03001971
_0200A214: .4byte gUnknown_03001972
_0200A218: .4byte gUnknown_03001973

	thumb_func_start sub_0200a21c
sub_0200a21c: @ 0x0200a21c
	push {r4, r5, lr}
	ldr r3, _0200A274 @ =gUnknown_03001971
	ldr r4, _0200A278 @ =gUnknown_03001970
	ldrb r5, [r3]
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _0200A26C
	ldr r2, _0200A27C @ =gUnknown_03001972
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _0200A24E
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #6
	cmp r1, r0
	blt _0200A26C
_0200A24E:
	movs r4, #0
	strb r4, [r2]
	ldr r1, _0200A280 @ =gUnknown_03001973
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	bne _0200A268
	strb r4, [r1]
	adds r0, r5, #1
	strb r0, [r3]
_0200A268:
	bl sub_02009894
_0200A26C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200A274: .4byte gUnknown_03001971
_0200A278: .4byte gUnknown_03001970
_0200A27C: .4byte gUnknown_03001972
_0200A280: .4byte gUnknown_03001973

	thumb_func_start sub_0200a284
sub_0200a284: @ 0x0200a284
	push {lr}
	ldr r2, _0200A2A0 @ =gUnknown_03001970
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0x63
	ble _0200A29A
	movs r0, #0x63
	strb r0, [r2]
_0200A29A:
	pop {r0}
	bx r0
	.align 2, 0
_0200A2A0: .4byte gUnknown_03001970

	thumb_func_start sub_0200a2a4
sub_0200a2a4: @ 0x0200a2a4
	push {lr}
	ldr r2, _0200A2D0 @ =gUnknown_03001970
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0x63
	ble _0200A2BA
	movs r0, #0x63
	strb r0, [r2]
_0200A2BA:
	ldr r1, _0200A2D4 @ =gUnknown_03001971
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _0200A2D8 @ =gUnknown_03001973
	movs r0, #0
	strb r0, [r1]
	bl sub_02009894
	pop {r0}
	bx r0
	.align 2, 0
_0200A2D0: .4byte gUnknown_03001970
_0200A2D4: .4byte gUnknown_03001971
_0200A2D8: .4byte gUnknown_03001973

	thumb_func_start sub_0200a2dc
sub_0200a2dc: @ 0x0200a2dc
	push {lr}
	ldr r2, _0200A2F8 @ =gUnknown_03005274
	ldr r0, _0200A2FC @ =gUnknown_03001970
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0200A300 @ =0x0001869F
	cmp r0, r1
	bls _0200A2F4
	str r1, [r2]
_0200A2F4:
	pop {r0}
	bx r0
	.align 2, 0
_0200A2F8: .4byte gUnknown_03005274
_0200A2FC: .4byte gUnknown_03001970
_0200A300: .4byte 0x0001869F

	thumb_func_start sub_0200a304
sub_0200a304: @ 0x0200a304
	ldr r1, _0200A30C @ =gUnknown_03001974
	str r0, [r1]
	bx lr
	.align 2, 0
_0200A30C: .4byte gUnknown_03001974

	thumb_func_start sub_0200a310
sub_0200a310: @ 0x0200a310
	ldr r1, _0200A32C @ =gUnknown_03001980
	str r0, [r1]
	ldr r1, _0200A330 @ =gUnknown_03001974
	ldr r2, [r1]
	lsls r2, r2, #3
	ldr r1, _0200A334 @ =0x07000024
	adds r2, r2, r1
	ldrh r3, [r2]
	movs r1, #0xfc
	lsls r1, r1, #8
	ands r1, r3
	orrs r1, r0
	strh r1, [r2]
	bx lr
	.align 2, 0
_0200A32C: .4byte gUnknown_03001980
_0200A330: .4byte gUnknown_03001974
_0200A334: .4byte 0x07000024

	thumb_func_start sub_0200a338
sub_0200a338: @ 0x0200a338
	push {r4, r5, r6, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r5, _0200A3B8 @ =0x0600C000
	ldr r2, _0200A3BC @ =0x01000400
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	ldr r0, _0200A3C0 @ =gUnknown_02013CEC
	ldr r4, _0200A3C4 @ =gUnknown_03007000
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r6, r5, #0
	adds r5, r4, #0
	movs r4, #5
_0200A35E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xc
	bl CpuSet
	adds r6, #0x40
	adds r5, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0200A35E
	movs r3, #0
	ldr r1, _0200A3C8 @ =0x04000008
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #8
	movs r0, #0xc0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc8
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0200A3CC @ =gUnknown_03001984
	strb r3, [r0]
	ldr r0, _0200A3D0 @ =gUnknown_03001985
	strb r3, [r0]
	bl sub_02009c0c
	bl m4aMPlayAllStop
	movs r0, #0xe       @ SE_MSGBOX
	bl m4aSongNumStart
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200A3B8: .4byte 0x0600C000
_0200A3BC: .4byte 0x01000400
_0200A3C0: .4byte gUnknown_02013CEC
_0200A3C4: .4byte gUnknown_03007000
_0200A3C8: .4byte 0x04000008
_0200A3CC: .4byte gUnknown_03001984
_0200A3D0: .4byte gUnknown_03001985

	thumb_func_start sub_0200a3d4
sub_0200a3d4: @ 0x0200a3d4
	ldr r1, _0200A3E4 @ =gUnknown_03001986
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0200A3E8 @ =gUnknown_03001988
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200A3E4: .4byte gUnknown_03001986
_0200A3E8: .4byte gUnknown_03001988

	thumb_func_start sub_0200a3ec
sub_0200a3ec: @ 0x0200a3ec
	ldr r1, _0200A3FC @ =gUnknown_03001986
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0200A400 @ =gUnknown_03001987
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0200A3FC: .4byte gUnknown_03001986
_0200A400: .4byte gUnknown_03001987

	thumb_func_start sub_0200a404
sub_0200a404: @ 0x0200a404
	ldr r1, _0200A414 @ =gUnknown_03001986
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0200A418 @ =gUnknown_03001987
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0200A414: .4byte gUnknown_03001986
_0200A418: .4byte gUnknown_03001987

	thumb_func_start sub_0200a41c
sub_0200a41c: @ 0x0200a41c
	ldr r1, _0200A42C @ =gUnknown_03001986
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0200A430 @ =gUnknown_03001988
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200A42C: .4byte gUnknown_03001986
_0200A430: .4byte gUnknown_03001988

	thumb_func_start sub_0200a434
sub_0200a434: @ 0x0200a434
	push {lr}
	ldr r1, _0200A450 @ =gUnknown_03001986
	movs r0, #5
	strb r0, [r1]
	ldr r1, _0200A454 @ =gUnknown_03001988
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0200A458 @ =gMPlayInfo_BGM
	movs r1, #1
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_0200A450: .4byte gUnknown_03001986
_0200A454: .4byte gUnknown_03001988
_0200A458: .4byte gMPlayInfo_BGM

	thumb_func_start sub_0200a45c
sub_0200a45c: @ 0x0200a45c
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, #0xb
	cmp r7, #0xe
	bgt _0200A4C4
	lsls r5, r0, #3
	ldr r0, _0200A490 @ =0x07000004
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	ldr r3, _0200A494 @ =0x0000506F
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	cmp r7, #0
	bne _0200A498
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r0, r5, r1
	b _0200A4F0
	.align 2, 0
_0200A490: .4byte 0x07000004
_0200A494: .4byte 0x0000506F
_0200A498:
	lsls r4, r6, #5
	ldr r3, _0200A4BC @ =0x07000006
	adds r4, r4, r3
	ldr r0, _0200A4C0 @ =gUnknown_02015AFC
	mov r8, r0
	lsls r0, r7, #7
	adds r0, #0xf
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r2, r5, r1
	b _0200A52A
	.align 2, 0
_0200A4BC: .4byte 0x07000006
_0200A4C0: .4byte gUnknown_02015AFC
_0200A4C4:
	lsls r0, r0, #3
	mov r8, r0
	ldr r3, _0200A4FC @ =0x07000004
	add r3, r8
	ldrh r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #4
	ands r2, r0
	asrs r1, r6, #2
	adds r1, #2
	lsls r1, r1, #0xc
	asrs r0, r6, #1
	lsls r0, r0, #4
	adds r0, #0x7f
	orrs r1, r0
	orrs r2, r1
	strh r2, [r3]
	cmp r7, #0x1d
	bne _0200A504
	movs r0, #0xe0
	lsls r0, r0, #0x13
	add r0, r8
_0200A4F0:
	ldr r1, [r0]
	ldr r2, _0200A500 @ =0xC1FFFCFF
	ands r1, r2
	str r1, [r0]
	b _0200A53C
	.align 2, 0
_0200A4FC: .4byte 0x07000004
_0200A500: .4byte 0xC1FFFCFF
_0200A504:
	lsls r4, r6, #5
	ldr r3, _0200A548 @ =0x07000006
	adds r4, r4, r3
	ldr r0, _0200A54C @ =gUnknown_02015AFC
	mov sb, r0
	movs r0, #0x1d
	subs r0, r0, r7
	lsls r0, r0, #7
	adds r0, #0xf
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r4]
	movs r2, #0xe0
	lsls r2, r2, #0x13
	add r2, r8
_0200A52A:
	ldr r0, [r2]
	ldr r1, _0200A550 @ =0xC1FFFCFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	lsls r1, r6, #0x19
	orrs r0, r1
	str r0, [r2]
_0200A53C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A548: .4byte 0x07000006
_0200A54C: .4byte gUnknown_02015AFC
_0200A550: .4byte 0xC1FFFCFF

	thumb_func_start sub_0200a554
sub_0200a554: @ 0x0200a554
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r5, _0200A628 @ =gUnknown_03001990
	movs r4, #0xff
_0200A564:
	lsls r0, r1, #1
	adds r3, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r0, r5
	movs r2, #5
_0200A570:
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bge _0200A570
	adds r1, r3, #0
	cmp r1, #4
	ble _0200A564
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r2, _0200A628 @ =gUnknown_03001990
	mov sl, r2
_0200A590:
	lsls r1, r6, #5
	ldr r3, _0200A62C @ =0x07000006
	adds r0, r1, r3
	mov r2, sb
	strh r2, [r0]
	adds r3, #8
	adds r0, r1, r3
	movs r2, #0
	strh r2, [r0]
	adds r3, #8
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _0200A630 @ =0x0700001E
	adds r1, r1, r0
	mov r2, sb
	strh r2, [r1]
	adds r7, r6, #0
	adds r7, #0xb
	adds r3, r6, #1
	mov r8, r3
_0200A5B8:
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	movs r1, #5
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, sl
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0200A5B8
	strb r6, [r1]
	lsls r3, r4, #5
	lsls r2, r7, #3
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r2, r2, r0
	ldr r1, [r2]
	ldr r0, _0200A634 @ =0xFE00FF00
	ands r1, r0
	lsls r0, r5, #0x15
	orrs r0, r3
	orrs r1, r0
	str r1, [r2]
	adds r0, r6, #0
	movs r1, #0x1d
	bl sub_0200a45c
	mov r6, r8
	cmp r6, #0xd
	ble _0200A590
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A628: .4byte gUnknown_03001990
_0200A62C: .4byte 0x07000006
_0200A630: .4byte 0x0700001E
_0200A634: .4byte 0xFE00FF00

	thumb_func_start sub_0200a638
sub_0200a638: @ 0x0200a638
	push {r4, r5, r6, r7, lr}
	ldr r5, _0200A670 @ =gUnknown_030019B2
	movs r0, #0
	ldrsh r4, [r5, r0]
	ldr r0, _0200A674 @ =gUnknown_030019AE
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #5
	adds r3, r2, #0
	adds r3, #0x14
	ldr r0, _0200A678 @ =gUnknown_030019B0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r5, #0
	adds r6, r0, #0
	cmp r1, #0
	beq _0200A65E
	subs r3, #1
_0200A65E:
	adds r1, r4, #0
	subs r2, r1, r3
	cmp r2, #0
	beq _0200A698
	adds r0, r2, #4
	cmp r0, #8
	bhi _0200A67C
	adds r1, r3, #0
	b _0200A698
	.align 2, 0
_0200A670: .4byte gUnknown_030019B2
_0200A674: .4byte gUnknown_030019AE
_0200A678: .4byte gUnknown_030019B0
_0200A67C:
	cmp r2, #0x20
	ble _0200A684
	subs r1, #0x10
	b _0200A698
_0200A684:
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r2, r0
	bge _0200A690
	adds r1, #0x10
	b _0200A698
_0200A690:
	adds r0, r3, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
_0200A698:
	strh r1, [r5]
	ldr r4, _0200A6D0 @ =gUnknown_030019B4
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r3, #0
	ldr r1, _0200A6D4 @ =gUnknown_030019AF
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r5, r4, #0
	cmp r0, #0
	ble _0200A6B4
	lsls r0, r0, #5
	adds r3, r0, #0
	subs r3, #8
_0200A6B4:
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0200A6BE
	adds r3, #4
_0200A6BE:
	adds r1, r2, #0
	subs r2, r1, r3
	cmp r2, #0
	beq _0200A6F4
	adds r0, r2, #4
	cmp r0, #8
	bhi _0200A6D8
	adds r1, r3, #0
	b _0200A6F4
	.align 2, 0
_0200A6D0: .4byte gUnknown_030019B4
_0200A6D4: .4byte gUnknown_030019AF
_0200A6D8:
	cmp r2, #0x20
	ble _0200A6E0
	subs r1, #0x10
	b _0200A6F4
_0200A6E0:
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r2, r0
	bge _0200A6EC
	adds r1, #0x10
	b _0200A6F4
_0200A6EC:
	adds r0, r3, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
_0200A6F4:
	strh r1, [r4]
	movs r3, #0xe0
	lsls r3, r3, #0x13
	ldr r2, [r3]
	ldr r0, _0200A714 @ =0xFE00FF00
	ands r2, r0
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #0x10
	ldrb r1, [r5]
	orrs r0, r1
	orrs r2, r0
	str r2, [r3]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A714: .4byte 0xFE00FF00

	thumb_func_start sub_0200a718
sub_0200a718: @ 0x0200a718
	push {r4, lr}
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r4, r0, #0x17
	ldr r0, _0200A738 @ =gUnknown_030019C0
	ldr r0, [r0]
	cmp r0, #1
	beq _0200A74C
	cmp r0, #1
	blo _0200A73C
	cmp r0, #2
	beq _0200A760
	cmp r0, #3
	beq _0200A784
	b _0200A79E
	.align 2, 0
_0200A738: .4byte gUnknown_030019C0
_0200A73C:
	ldr r1, _0200A744 @ =gUnknown_030019BA
	ldr r0, _0200A748 @ =gUnknown_030019B8
	b _0200A76A
	.align 2, 0
_0200A744: .4byte gUnknown_030019BA
_0200A748: .4byte gUnknown_030019B8
_0200A74C:
	ldr r2, _0200A758 @ =gUnknown_030019BA
	ldr r0, _0200A75C @ =gUnknown_030019B8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #4
	b _0200A794
	.align 2, 0
_0200A758: .4byte gUnknown_030019BA
_0200A75C: .4byte gUnknown_030019B8
_0200A760:
	movs r0, #0
	bl sub_02009978
	ldr r1, _0200A77C @ =gUnknown_030019BA
	ldr r0, _0200A780 @ =gUnknown_030019B7
_0200A76A:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r0, #1
	strb r0, [r1]
	b _0200A79E
	.align 2, 0
_0200A77C: .4byte gUnknown_030019BA
_0200A780: .4byte gUnknown_030019B7
_0200A784:
	movs r0, #1
	bl sub_02009978
	ldr r2, _0200A7A4 @ =gUnknown_030019BA
	ldr r0, _0200A7A8 @ =gUnknown_030019B7
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #5
_0200A794:
	subs r0, r0, r1
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r0, #1
	strb r0, [r2]
_0200A79E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200A7A4: .4byte gUnknown_030019BA
_0200A7A8: .4byte gUnknown_030019B7

	thumb_func_start sub_0200a7ac
sub_0200a7ac: @ 0x0200a7ac
	push {r4, lr}
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	movs r1, #0x16
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #5
	bgt _0200A7E4
	ldr r1, _0200A7D8 @ =gUnknown_030019C0
	movs r0, #1
	str r0, [r1]
	ldr r1, _0200A7DC @ =gUnknown_030019B8
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0200A7E0 @ =gUnknown_030019B7
	strb r2, [r0]
	b _0200A840
	.align 2, 0
_0200A7D8: .4byte gUnknown_030019C0
_0200A7DC: .4byte gUnknown_030019B8
_0200A7E0: .4byte gUnknown_030019B7
_0200A7E4:
	cmp r2, #0xb
	bgt _0200A808
	ldr r1, _0200A7FC @ =gUnknown_030019C0
	movs r0, #0
	str r0, [r1]
	ldr r1, _0200A800 @ =gUnknown_030019B8
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0200A804 @ =gUnknown_030019B7
	subs r0, r2, #6
	b _0200A83E
	.align 2, 0
_0200A7FC: .4byte gUnknown_030019C0
_0200A800: .4byte gUnknown_030019B8
_0200A804: .4byte gUnknown_030019B7
_0200A808:
	cmp r2, #0x10
	bgt _0200A82C
	ldr r1, _0200A820 @ =gUnknown_030019C0
	movs r0, #3
	str r0, [r1]
	ldr r1, _0200A824 @ =gUnknown_030019B8
	adds r0, r2, #0
	subs r0, #0xc
	strb r0, [r1]
	ldr r1, _0200A828 @ =gUnknown_030019B7
	movs r0, #0
	b _0200A83E
	.align 2, 0
_0200A820: .4byte gUnknown_030019C0
_0200A824: .4byte gUnknown_030019B8
_0200A828: .4byte gUnknown_030019B7
_0200A82C:
	ldr r1, _0200A884 @ =gUnknown_030019C0
	movs r0, #2
	str r0, [r1]
	ldr r1, _0200A888 @ =gUnknown_030019B8
	adds r0, r2, #0
	subs r0, #0x11
	strb r0, [r1]
	ldr r1, _0200A88C @ =gUnknown_030019B7
	movs r0, #5
_0200A83E:
	strb r0, [r1]
_0200A840:
	ldr r1, _0200A890 @ =gUnknown_030019B9
	movs r0, #0xf
	strb r0, [r1]
	ldr r1, _0200A894 @ =gUnknown_030019BC
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, _0200A898 @ =gUnknown_030019BE
	movs r4, #0
	strb r4, [r0]
	movs r0, #6
	bl sub_0200a304
	movs r0, #0x6c
	bl sub_0200a310
	movs r0, #0
	movs r1, #0xa0
	bl sub_02009a70
	movs r0, #0
	bl sub_02009978
	bl sub_0200a718
	ldr r1, _0200A89C @ =gUnknown_030019C8
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _0200A8A0 @ =gUnknown_030019BF
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200A884: .4byte gUnknown_030019C0
_0200A888: .4byte gUnknown_030019B8
_0200A88C: .4byte gUnknown_030019B7
_0200A890: .4byte gUnknown_030019B9
_0200A894: .4byte gUnknown_030019BC
_0200A898: .4byte gUnknown_030019BE
_0200A89C: .4byte gUnknown_030019C8
_0200A8A0: .4byte gUnknown_030019BF

	thumb_func_start sub_0200a8a4
sub_0200a8a4: @ 0x0200a8a4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, _0200A8CC @ =gUnknown_030019D4
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0200A8FC
	bl sub_02009d28
	cmp r0, #1
	beq _0200A8D0
	cmp r0, #2
	beq _0200A8F0
	bl sub_0200bdf8
	.align 2, 0
_0200A8CC: .4byte gUnknown_030019D4
_0200A8D0:
	movs r1, #0
	strb r1, [r4]
	ldr r0, _0200A8E8 @ =gUnknown_030019D5
	strb r1, [r0]
	ldr r1, _0200A8EC @ =gUnknown_030019D8
	movs r0, #9
	str r0, [r1]
	bl sub_0200a434
	bl sub_0200bdf8
	.align 2, 0
_0200A8E8: .4byte gUnknown_030019D5
_0200A8EC: .4byte gUnknown_030019D8
_0200A8F0:
	movs r0, #0
	strb r0, [r4]
	bl m4aMPlayAllContinue
	bl sub_0200bdf8
_0200A8FC:
	ldr r0, _0200A914 @ =gUnknown_030019D8
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #9
	bls _0200A90A
	bl _0200BDD2
_0200A90A:
	lsls r0, r1, #2
	ldr r1, _0200A918 @ =_0200A91C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200A914: .4byte gUnknown_030019D8
_0200A918: .4byte _0200A91C
_0200A91C: @ jump table
	.4byte _0200A944 @ case 0
	.4byte _0200ABB8 @ case 1
	.4byte _0200ABE8 @ case 2
	.4byte _0200B054 @ case 3
	.4byte _0200B078 @ case 4
	.4byte _0200B154 @ case 5
	.4byte _0200B6A4 @ case 6
	.4byte _0200BC54 @ case 7
	.4byte _0200BD44 @ case 8
	.4byte _0200BDB4 @ case 9
_0200A944:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xf2
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0200A9A4 @ =0x0600C000
	ldr r2, _0200A9A8 @ =0x01001000
	mov r0, sp
	bl CpuSet
	ldr r1, _0200A9AC @ =0x04000054
	movs r0, #0x10
	strh r0, [r1]
	subs r1, #4
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _0200A9B0 @ =gUnknown_02013D58
	movs r1, #0xa0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0200A9B4 @ =gUnknown_020128A8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0200A9B8 @ =gUnknown_02013E50
	ldr r1, _0200A9BC @ =0x06001300
	bl LZ77UnCompVram
	ldr r0, _0200A9C0 @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _0200A9D4
	ldr r0, _0200A9C4 @ =gUnknown_020134C8
	ldr r1, _0200A9C8 @ =0x06000F00
	bl LZ77UnCompVram
	ldr r0, _0200A9CC @ =gUnknown_02014210
	ldr r1, _0200A9D0 @ =0x060019A0
	bl LZ77UnCompVram
	b _0200A9E4
	.align 2, 0
_0200A9A4: .4byte 0x0600C000
_0200A9A8: .4byte 0x01001000
_0200A9AC: .4byte 0x04000054
_0200A9B0: .4byte gUnknown_02013D58
_0200A9B4: .4byte gUnknown_020128A8
_0200A9B8: .4byte gUnknown_02013E50
_0200A9BC: .4byte 0x06001300
_0200A9C0: .4byte gUnknown_03003330
_0200A9C4: .4byte gUnknown_020134C8
_0200A9C8: .4byte 0x06000F00
_0200A9CC: .4byte gUnknown_02014210
_0200A9D0: .4byte 0x060019A0
_0200A9D4:
	ldr r0, _0200AB40 @ =gUnknown_02013348
	ldr r1, _0200AB44 @ =0x06000F00
	bl LZ77UnCompVram
	ldr r0, _0200AB48 @ =gUnknown_02014050
	ldr r1, _0200AB4C @ =0x060019A0
	bl LZ77UnCompVram
_0200A9E4:
	ldr r1, _0200AB50 @ =0x0400000E
	ldr r3, _0200AB54 @ =0x00001B03
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0200AB58 @ =0x0400001C
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r4, #0
	mov r8, r4
	mov r6, sp
	adds r6, #2
	str r6, [sp, #4]
_0200AA00:
	movs r0, #0
	mov r1, r8
	subs r1, #1
	str r1, [sp, #8]
	mov r2, r8
	lsls r2, r2, #2
	mov sl, r2
	mov r3, r8
	adds r3, #1
	str r3, [sp, #0xc]
_0200AA14:
	movs r7, #0x98
	ldr r4, [sp, #8]
	cmp r4, #2
	bhi _0200AA36
	cmp r0, #0
	ble _0200AA36
	cmp r0, #4
	bgt _0200AA36
	movs r7, #0xa1
	mov r6, r8
	cmp r6, #2
	bne _0200AA36
	cmp r0, #1
	ble _0200AA36
	cmp r0, #3
	bgt _0200AA36
	movs r7, #0xaa
_0200AA36:
	movs r1, #0
	adds r2, r0, #1
	mov ip, r2
	mov r3, sl
	str r3, [sp, #0x10]
	lsls r5, r0, #2
	ldr r4, _0200AB5C @ =gUnknown_02015E10
	mov sb, r4
_0200AA46:
	movs r3, #0
	adds r4, r1, #1
	ldr r6, [sp, #0x10]
	adds r0, r6, r1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r1, r1, #2
	add r1, sb
	lsls r0, r0, #1
	ldr r6, _0200AB60 @ =0x0600D800
	adds r2, r0, r6
_0200AA5C:
	ldrb r0, [r1]
	adds r0, r0, r7
	strh r0, [r2]
	adds r1, #1
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _0200AA5C
	adds r1, r4, #0
	cmp r1, #3
	ble _0200AA46
	mov r0, ip
	cmp r0, #5
	ble _0200AA14
	ldr r0, [sp, #0xc]
	mov r8, r0
	cmp r0, #4
	ble _0200AA00
	ldr r1, _0200AB64 @ =0x0400000C
	ldr r2, _0200AB68 @ =0x00001A02
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0200AB6C @ =0x04000018
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r4, _0200AB70 @ =gUnknown_03007000
	ldr r0, _0200AB74 @ =gUnknown_02014408
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r6, _0200AB78 @ =0x0600D030
	movs r5, #0x13
_0200AAA0:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl CpuSet
	adds r6, #0x40
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0200AAA0
	ldr r1, _0200AB7C @ =0x0400000A
	ldr r3, _0200AB80 @ =0x00001901
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0200AB84 @ =0x04000014
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _0200AB88 @ =gUnknown_02014478
	ldr r4, _0200AB70 @ =gUnknown_03007000
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r6, _0200AB8C @ =0x0600C830
	movs r5, #0x13
_0200AAD4:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl CpuSet
	adds r6, #0x40
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0200AAD4
	ldr r0, _0200AB90 @ =gUnknown_020144D8
	ldr r1, _0200AB94 @ =0x05000240
	bl LZ77UnCompVram
	ldr r0, _0200AB98 @ =gUnknown_02013620
	ldr r1, _0200AB9C @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _0200ABA0 @ =gUnknown_02014574
	ldr r1, _0200ABA4 @ =0x06010DE0
	bl LZ77UnCompVram
	movs r4, #0xa8
	lsls r4, r4, #2
	adds r0, r4, #0
	ldr r6, [sp, #4]
	strh r0, [r6]
	movs r4, #0xe0
	lsls r4, r4, #0x13
	ldr r2, _0200ABA8 @ =0x01000200
	ldr r0, [sp, #4]
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _0200ABAC @ =gUnknown_02014D6C
	adds r1, r4, #0
	bl LZ77UnCompVram
	bl sub_0200a1f0
	bl sub_0200a3d4
	ldr r1, _0200ABB0 @ =gUnknown_030019D8
	movs r0, #1
	str r0, [r1]
	ldr r1, _0200ABB4 @ =gUnknown_030019D5
	movs r0, #0
	strb r0, [r1]
	movs r0, #4         @ MUS_MINIGAME
	bl m4aSongNumStart
	bl _0200BDD2
	.align 2, 0
_0200AB40: .4byte gUnknown_02013348
_0200AB44: .4byte 0x06000F00
_0200AB48: .4byte gUnknown_02014050
_0200AB4C: .4byte 0x060019A0
_0200AB50: .4byte 0x0400000E
_0200AB54: .4byte 0x00001B03
_0200AB58: .4byte 0x0400001C
_0200AB5C: .4byte gUnknown_02015E10
_0200AB60: .4byte 0x0600D800
_0200AB64: .4byte 0x0400000C
_0200AB68: .4byte 0x00001A02
_0200AB6C: .4byte 0x04000018
_0200AB70: .4byte gUnknown_03007000
_0200AB74: .4byte gUnknown_02014408
_0200AB78: .4byte 0x0600D030
_0200AB7C: .4byte 0x0400000A
_0200AB80: .4byte 0x00001901
_0200AB84: .4byte 0x04000014
_0200AB88: .4byte gUnknown_02014478
_0200AB8C: .4byte 0x0600C830
_0200AB90: .4byte gUnknown_020144D8
_0200AB94: .4byte 0x05000240
_0200AB98: .4byte gUnknown_02013620
_0200AB9C: .4byte 0x06010000
_0200ABA0: .4byte gUnknown_02014574
_0200ABA4: .4byte 0x06010DE0
_0200ABA8: .4byte 0x01000200
_0200ABAC: .4byte gUnknown_02014D6C
_0200ABB0: .4byte gUnknown_030019D8
_0200ABB4: .4byte gUnknown_030019D5
_0200ABB8:
	bl sub_02009df4
	cmp r0, #0
	bne _0200ABC4
	bl _0200BDD2
_0200ABC4:
	ldr r1, _0200ABDC @ =gUnknown_030019D5
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0200ABE0 @ =gUnknown_030019D8
	movs r0, #2
	str r0, [r1]
	ldr r0, _0200ABE4 @ =gUnknown_030019E0
	movs r1, #0
	str r1, [r0]
	bl _0200B674
	.align 2, 0
_0200ABDC: .4byte gUnknown_030019D5
_0200ABE0: .4byte gUnknown_030019D8
_0200ABE4: .4byte gUnknown_030019E0
_0200ABE8:
	ldr r0, _0200AC00 @ =gUnknown_030019E0
	ldr r1, [r0]
	mov r8, r0
	cmp r1, #5
	bls _0200ABF6
	bl _0200BDD2
_0200ABF6:
	lsls r0, r1, #2
	ldr r1, _0200AC04 @ =_0200AC08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200AC00: .4byte gUnknown_030019E0
_0200AC04: .4byte _0200AC08
_0200AC08: @ jump table
	.4byte _0200AC20 @ case 0
	.4byte _0200ACC4 @ case 1
	.4byte _0200AC54 @ case 2
	.4byte _0200ADE8 @ case 3
	.4byte _0200AC8C @ case 4
	.4byte _0200AF0E @ case 5
_0200AC20:
	ldr r2, _0200AC44 @ =0x07000018
	ldr r0, [r2]
	ldr r1, _0200AC48 @ =0xFE00FF00
	ands r0, r1
	movs r1, #0xa0
	lsls r1, r1, #0xf
	orrs r0, r1
	ldr r1, _0200AC4C @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r1, _0200AC50 @ =gUnknown_030019E4
	movs r0, #0
	str r0, [r1]
	movs r0, #1
	mov r1, r8
	bl _0200BDD0
	.align 2, 0
_0200AC44: .4byte 0x07000018
_0200AC48: .4byte 0xFE00FF00
_0200AC4C: .4byte 0xC1FFFCFF
_0200AC50: .4byte gUnknown_030019E4
_0200AC54:
	ldr r2, _0200AC78 @ =0x07000020
	ldr r0, [r2]
	ldr r1, _0200AC7C @ =0xFE00FF00
	ands r0, r1
	ldr r1, _0200AC80 @ =0x00500020
	orrs r0, r1
	ldr r1, _0200AC84 @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r1, _0200AC88 @ =gUnknown_030019E4
	movs r0, #0
	str r0, [r1]
	movs r0, #3
	mov r2, r8
	str r0, [r2]
	bl _0200BDD2
	.align 2, 0
_0200AC78: .4byte 0x07000020
_0200AC7C: .4byte 0xFE00FF00
_0200AC80: .4byte 0x00500020
_0200AC84: .4byte 0xC1FFFCFF
_0200AC88: .4byte gUnknown_030019E4
_0200AC8C:
	ldr r2, _0200ACB0 @ =0x07000028
	ldr r0, [r2]
	ldr r1, _0200ACB4 @ =0xFE00FF00
	ands r0, r1
	ldr r1, _0200ACB8 @ =0x00500040
	orrs r0, r1
	ldr r1, _0200ACBC @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r1, _0200ACC0 @ =gUnknown_030019E4
	movs r0, #0
	str r0, [r1]
	movs r0, #5
	mov r3, r8
	str r0, [r3]
	bl _0200BDD2
	.align 2, 0
_0200ACB0: .4byte 0x07000028
_0200ACB4: .4byte 0xFE00FF00
_0200ACB8: .4byte 0x00500040
_0200ACBC: .4byte 0xC1FFFCFF
_0200ACC0: .4byte gUnknown_030019E4
_0200ACC4:
	ldr r0, _0200ACE0 @ =gUnknown_030019E4
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	subs r0, r2, #7
	cmp r0, #0x28
	bls _0200ACD6
	bl _0200BDD2
_0200ACD6:
	lsls r0, r0, #2
	ldr r1, _0200ACE4 @ =_0200ACE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200ACE0: .4byte gUnknown_030019E4
_0200ACE4: .4byte _0200ACE8
_0200ACE8: @ jump table
	.4byte _0200AD8C @ case 0
	.4byte _0200BDD2 @ case 1
	.4byte _0200BDD2 @ case 2
	.4byte _0200BDD2 @ case 3
	.4byte _0200BDD2 @ case 4
	.4byte _0200BDD2 @ case 5
	.4byte _0200BDD2 @ case 6
	.4byte _0200BDD2 @ case 7
	.4byte _0200ADB4 @ case 8
	.4byte _0200BDD2 @ case 9
	.4byte _0200BDD2 @ case 10
	.4byte _0200BDD2 @ case 11
	.4byte _0200BDD2 @ case 12
	.4byte _0200BDD2 @ case 13
	.4byte _0200BDD2 @ case 14
	.4byte _0200BDD2 @ case 15
	.4byte _0200AD8C @ case 16
	.4byte _0200BDD2 @ case 17
	.4byte _0200BDD2 @ case 18
	.4byte _0200BDD2 @ case 19
	.4byte _0200BDD2 @ case 20
	.4byte _0200BDD2 @ case 21
	.4byte _0200BDD2 @ case 22
	.4byte _0200BDD2 @ case 23
	.4byte _0200ADB4 @ case 24
	.4byte _0200BDD2 @ case 25
	.4byte _0200BDD2 @ case 26
	.4byte _0200BDD2 @ case 27
	.4byte _0200BDD2 @ case 28
	.4byte _0200BDD2 @ case 29
	.4byte _0200BDD2 @ case 30
	.4byte _0200BDD2 @ case 31
	.4byte _0200BDD2 @ case 32
	.4byte _0200BDD2 @ case 33
	.4byte _0200BDD2 @ case 34
	.4byte _0200BDD2 @ case 35
	.4byte _0200BDD2 @ case 36
	.4byte _0200BDD2 @ case 37
	.4byte _0200BDD2 @ case 38
	.4byte _0200BDD2 @ case 39
	.4byte _0200ADE0 @ case 40
_0200AD8C:
	ldr r1, _0200ADA4 @ =0x05000004
	ldr r4, _0200ADA8 @ =0x00007E07
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	ldr r6, _0200ADAC @ =0x00007EAF
	adds r0, r6, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0200ADB0 @ =0x00007F59
	b _0200AFEA
	.align 2, 0
_0200ADA4: .4byte 0x05000004
_0200ADA8: .4byte 0x00007E07
_0200ADAC: .4byte 0x00007EAF
_0200ADB0: .4byte 0x00007F59
_0200ADB4:
	ldr r1, _0200ADD0 @ =0x05000004
	ldr r3, _0200ADD4 @ =0x00007E8D
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r4, _0200ADD8 @ =0x00007F35
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	ldr r6, _0200ADDC @ =0x00007FDD
	adds r0, r6, #0
	strh r0, [r1]
	bl _0200BDD2
	.align 2, 0
_0200ADD0: .4byte 0x05000004
_0200ADD4: .4byte 0x00007E8D
_0200ADD8: .4byte 0x00007F35
_0200ADDC: .4byte 0x00007FDD
_0200ADE0:
	movs r0, #2
	mov r1, r8
	bl _0200BDD0
_0200ADE8:
	ldr r0, _0200AE04 @ =gUnknown_030019E4
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	subs r0, r2, #7
	cmp r0, #0x28
	bls _0200ADFA
	bl _0200BDD2
_0200ADFA:
	lsls r0, r0, #2
	ldr r1, _0200AE08 @ =_0200AE0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200AE04: .4byte gUnknown_030019E4
_0200AE08: .4byte _0200AE0C
_0200AE0C: @ jump table
	.4byte _0200AEB0 @ case 0
	.4byte _0200BDD2 @ case 1
	.4byte _0200BDD2 @ case 2
	.4byte _0200BDD2 @ case 3
	.4byte _0200BDD2 @ case 4
	.4byte _0200BDD2 @ case 5
	.4byte _0200BDD2 @ case 6
	.4byte _0200BDD2 @ case 7
	.4byte _0200AED8 @ case 8
	.4byte _0200BDD2 @ case 9
	.4byte _0200BDD2 @ case 10
	.4byte _0200BDD2 @ case 11
	.4byte _0200BDD2 @ case 12
	.4byte _0200BDD2 @ case 13
	.4byte _0200BDD2 @ case 14
	.4byte _0200BDD2 @ case 15
	.4byte _0200AEB0 @ case 16
	.4byte _0200BDD2 @ case 17
	.4byte _0200BDD2 @ case 18
	.4byte _0200BDD2 @ case 19
	.4byte _0200BDD2 @ case 20
	.4byte _0200BDD2 @ case 21
	.4byte _0200BDD2 @ case 22
	.4byte _0200BDD2 @ case 23
	.4byte _0200AED8 @ case 24
	.4byte _0200BDD2 @ case 25
	.4byte _0200BDD2 @ case 26
	.4byte _0200BDD2 @ case 27
	.4byte _0200BDD2 @ case 28
	.4byte _0200BDD2 @ case 29
	.4byte _0200BDD2 @ case 30
	.4byte _0200BDD2 @ case 31
	.4byte _0200BDD2 @ case 32
	.4byte _0200BDD2 @ case 33
	.4byte _0200BDD2 @ case 34
	.4byte _0200BDD2 @ case 35
	.4byte _0200BDD2 @ case 36
	.4byte _0200BDD2 @ case 37
	.4byte _0200BDD2 @ case 38
	.4byte _0200BDD2 @ case 39
	.4byte _0200AF04 @ case 40
_0200AEB0:
	ldr r1, _0200AEC8 @ =0x0500000A
	ldr r2, _0200AECC @ =0x00005439
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0200AED0 @ =0x00006CBF
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r4, _0200AED4 @ =0x00007E3F
	b _0200B012
	.align 2, 0
_0200AEC8: .4byte 0x0500000A
_0200AECC: .4byte 0x00005439
_0200AED0: .4byte 0x00006CBF
_0200AED4: .4byte 0x00007E3F
_0200AED8:
	ldr r1, _0200AEF4 @ =0x0500000A
	ldr r6, _0200AEF8 @ =0x00005CBD
	adds r0, r6, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0200AEFC @ =0x000071BF
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0200AF00 @ =0x00007EDF
	adds r0, r3, #0
	strh r0, [r1]
	bl _0200BDD2
	.align 2, 0
_0200AEF4: .4byte 0x0500000A
_0200AEF8: .4byte 0x00005CBD
_0200AEFC: .4byte 0x000071BF
_0200AF00: .4byte 0x00007EDF
_0200AF04:
	movs r0, #4
	mov r4, r8
	str r0, [r4]
	bl _0200BDD2
_0200AF0E:
	ldr r0, _0200AF2C @ =gUnknown_030019E4
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	subs r0, r2, #7
	cmp r0, #0x28
	bls _0200AF20
	bl _0200BDD2
_0200AF20:
	lsls r0, r0, #2
	ldr r1, _0200AF30 @ =_0200AF34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200AF2C: .4byte gUnknown_030019E4
_0200AF30: .4byte _0200AF34
_0200AF34: @ jump table
	.4byte _0200AFD8 @ case 0
	.4byte _0200BDD2 @ case 1
	.4byte _0200BDD2 @ case 2
	.4byte _0200BDD2 @ case 3
	.4byte _0200BDD2 @ case 4
	.4byte _0200BDD2 @ case 5
	.4byte _0200BDD2 @ case 6
	.4byte _0200BDD2 @ case 7
	.4byte _0200B000 @ case 8
	.4byte _0200BDD2 @ case 9
	.4byte _0200BDD2 @ case 10
	.4byte _0200BDD2 @ case 11
	.4byte _0200BDD2 @ case 12
	.4byte _0200BDD2 @ case 13
	.4byte _0200BDD2 @ case 14
	.4byte _0200BDD2 @ case 15
	.4byte _0200AFD8 @ case 16
	.4byte _0200BDD2 @ case 17
	.4byte _0200BDD2 @ case 18
	.4byte _0200BDD2 @ case 19
	.4byte _0200BDD2 @ case 20
	.4byte _0200BDD2 @ case 21
	.4byte _0200BDD2 @ case 22
	.4byte _0200BDD2 @ case 23
	.4byte _0200B000 @ case 24
	.4byte _0200BDD2 @ case 25
	.4byte _0200BDD2 @ case 26
	.4byte _0200BDD2 @ case 27
	.4byte _0200BDD2 @ case 28
	.4byte _0200BDD2 @ case 29
	.4byte _0200BDD2 @ case 30
	.4byte _0200BDD2 @ case 31
	.4byte _0200BDD2 @ case 32
	.4byte _0200BDD2 @ case 33
	.4byte _0200BDD2 @ case 34
	.4byte _0200BDD2 @ case 35
	.4byte _0200BDD2 @ case 36
	.4byte _0200BDD2 @ case 37
	.4byte _0200BDD2 @ case 38
	.4byte _0200BDD2 @ case 39
	.4byte _0200B028 @ case 40
_0200AFD8:
	ldr r1, _0200AFF4 @ =0x05000010
	ldr r6, _0200AFF8 @ =0x00001016
	adds r0, r6, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x1b
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0200AFFC @ =0x000021FD
_0200AFEA:
	adds r0, r2, #0
	strh r0, [r1]
	bl _0200BDD2
	.align 2, 0
_0200AFF4: .4byte 0x05000010
_0200AFF8: .4byte 0x00001016
_0200AFFC: .4byte 0x000021FD
_0200B000:
	ldr r1, _0200B01C @ =0x05000010
	ldr r3, _0200B020 @ =0x00001018
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	ldr r4, _0200B024 @ =0x0000467E
_0200B012:
	adds r0, r4, #0
	strh r0, [r1]
	bl _0200BDD2
	.align 2, 0
_0200B01C: .4byte 0x05000010
_0200B020: .4byte 0x00001018
_0200B024: .4byte 0x0000467E
_0200B028:
	ldr r1, _0200B050 @ =0x07000018
	ldrh r0, [r1]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r2, r6, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #8
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, #8
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #3
	str r0, [r4]
	bl _0200BDD2
	.align 2, 0
_0200B050: .4byte 0x07000018
_0200B054:
	bl sub_0200a554
	ldr r1, _0200B06C @ =gUnknown_030019D8
	movs r0, #4
	str r0, [r1]
	ldr r1, _0200B070 @ =gUnknown_030019D5
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200B074 @ =gUnknown_030019E0
	movs r0, #0
	bl _0200BDD0
	.align 2, 0
_0200B06C: .4byte gUnknown_030019D8
_0200B070: .4byte gUnknown_030019D5
_0200B074: .4byte gUnknown_030019E0
_0200B078:
	ldr r0, _0200B08C @ =gUnknown_030019E0
	ldr r1, [r0]
	mov r8, r0
	cmp r1, #3
	beq _0200B0B8
	cmp r1, #3
	bgt _0200B090
	cmp r1, #1
	beq _0200B0B8
	b _0200B094
	.align 2, 0
_0200B08C: .4byte gUnknown_030019E0
_0200B090:
	cmp r1, #5
	beq _0200B0B8
_0200B094:
	ldr r1, _0200B0B4 @ =gUnknown_030019E4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3c
	beq _0200B0A4
	bl _0200BDD2
_0200B0A4:
	movs r0, #0
	str r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	bl _0200BDD0
	.align 2, 0
_0200B0B4: .4byte gUnknown_030019E4
_0200B0B8:
	ldr r5, _0200B138 @ =gUnknown_02015E90
	movs r2, #2
	ldr r0, _0200B13C @ =gUnknown_030019E4
	ldr r1, [r0]
	movs r0, #0x1d
	subs r6, r0, r1
	mov r3, r8
	ldr r0, [r3]
	cmp r0, #5
	bne _0200B0D0
	ldr r5, _0200B140 @ =gUnknown_02015E20
	movs r2, #0x12
_0200B0D0:
	cmp r0, #3
	bne _0200B0D8
	ldr r5, _0200B144 @ =gUnknown_02015E68
	movs r2, #0xa
_0200B0D8:
	cmp r2, #0
	beq _0200B108
	ldr r7, _0200B148 @ =gUnknown_03001990
	adds r4, r2, #0
_0200B0E0:
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r1, #1
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	adds r2, r2, r7
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _0200B100
	adds r1, r6, #0
	bl sub_0200a45c
_0200B100:
	adds r5, #4
	subs r4, #1
	cmp r4, #0
	bne _0200B0E0
_0200B108:
	ldr r1, _0200B13C @ =gUnknown_030019E4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x1e
	beq _0200B118
	bl _0200BDD2
_0200B118:
	movs r3, #0
	str r3, [r1]
	ldr r2, _0200B14C @ =gUnknown_030019E0
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	cmp r0, #6
	beq _0200B12C
	bl _0200BDD2
_0200B12C:
	ldr r1, _0200B150 @ =gUnknown_030019D8
	movs r0, #5
	str r0, [r1]
	str r3, [r2]
	bl _0200BDD2
	.align 2, 0
_0200B138: .4byte gUnknown_02015E90
_0200B13C: .4byte gUnknown_030019E4
_0200B140: .4byte gUnknown_02015E20
_0200B144: .4byte gUnknown_02015E68
_0200B148: .4byte gUnknown_03001990
_0200B14C: .4byte gUnknown_030019E0
_0200B150: .4byte gUnknown_030019D8
_0200B154:
	ldr r5, _0200B198 @ =gUnknown_030019E0
	ldr r4, [r5]
	cmp r4, #0
	bne _0200B16E
	bl sub_0200a7ac
	ldr r1, _0200B19C @ =gUnknown_030019D5
	movs r0, #1
	strb r0, [r1]
	movs r0, #1
	str r0, [r5]
	ldr r0, _0200B1A0 @ =gUnknown_030019E4
	str r4, [r0]
_0200B16E:
	ldr r1, _0200B1A4 @ =gUnknown_030019BF
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _0200B17A
	b _0200B270
_0200B17A:
	ldr r0, _0200B1A0 @ =gUnknown_030019E4
	ldr r0, [r0]
	cmp r0, #0x50
	beq _0200B208
	cmp r0, #0x50
	bgt _0200B1BC
	cmp r0, #0x28
	beq _0200B202
	cmp r0, #0x28
	bgt _0200B1A8
	cmp r0, #0
	beq _0200B1EC
	cmp r0, #0x14
	beq _0200B1FA
	b _0200B22A
	.align 2, 0
_0200B198: .4byte gUnknown_030019E0
_0200B19C: .4byte gUnknown_030019D5
_0200B1A0: .4byte gUnknown_030019E4
_0200B1A4: .4byte gUnknown_030019BF
_0200B1A8:
	cmp r0, #0x3c
	beq _0200B208
	cmp r0, #0x3c
	bgt _0200B1B6
	cmp r0, #0x32
	beq _0200B210
	b _0200B22A
_0200B1B6:
	cmp r0, #0x46
	beq _0200B210
	b _0200B22A
_0200B1BC:
	cmp r0, #0x78
	beq _0200B208
	cmp r0, #0x78
	bgt _0200B1D8
	cmp r0, #0x64
	beq _0200B208
	cmp r0, #0x64
	bgt _0200B1D2
	cmp r0, #0x5a
	beq _0200B210
	b _0200B22A
_0200B1D2:
	cmp r0, #0x6e
	beq _0200B210
	b _0200B22A
_0200B1D8:
	cmp r0, #0x96
	beq _0200B218
	cmp r0, #0x96
	bgt _0200B1E6
	cmp r0, #0x82
	beq _0200B210
	b _0200B22A
_0200B1E6:
	cmp r0, #0xbe
	beq _0200B226
	b _0200B22A
_0200B1EC:
	movs r0, #0x11
	bl m4aSongNumStart
	movs r0, #0x51
	bl sub_020099f8
	b _0200B22A
_0200B1FA:
	movs r0, #0x5a
	bl sub_020099f8
	b _0200B22A
_0200B202:
	movs r0, #0x63
	bl sub_020099f8
_0200B208:
	movs r0, #0x6d
	bl sub_0200a310
	b _0200B22A
_0200B210:
	movs r0, #0x6e
	bl sub_0200a310
	b _0200B22A
_0200B218:
	movs r0, #0x36
	bl sub_020099f8
	movs r0, #0x6c
	bl sub_0200a310
	b _0200B22A
_0200B226:
	movs r0, #2
	strb r0, [r1]
_0200B22A:
	ldr r4, _0200B268 @ =gUnknown_030019C8
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0200B25E
	ldr r5, _0200B26C @ =gUnknown_030019E4
	ldr r0, [r5]
	adds r1, r0, #0
	subs r1, #0xa
	cmp r1, #0x1d
	bhi _0200B248
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_0200a45c
_0200B248:
	ldr r2, [r5]
	adds r0, r2, #0
	subs r0, #0x96
	cmp r0, #0x1d
	bhi _0200B25E
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #0xb3
	subs r1, r1, r2
	bl sub_0200a45c
_0200B25E:
	ldr r1, _0200B26C @ =gUnknown_030019E4
	ldr r0, [r1]
	adds r0, #1
	bl _0200BDD0
	.align 2, 0
_0200B268: .4byte gUnknown_030019C8
_0200B26C: .4byte gUnknown_030019E4
_0200B270:
	ldr r1, _0200B2A0 @ =gUnknown_030019BC
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, [r5]
	cmp r1, #1
	beq _0200B284
	cmp r1, #2
	bne _0200B284
	b _0200B44C
_0200B284:
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0200B35E
	ldr r1, _0200B2A4 @ =gUnknown_030019B9
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0200B2A8
	movs r0, #2
	str r0, [r5]
	b _0200B35E
	.align 2, 0
_0200B2A0: .4byte gUnknown_030019BC
_0200B2A4: .4byte gUnknown_030019B9
_0200B2A8:
	ldr r1, _0200B2E0 @ =gUnknown_030019BA
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0200B314
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0200B2E4 @ =gUnknown_030019C0
	ldr r1, [r2]
	cmp r1, #1
	bls _0200B2EC
	cmp r1, #3
	bhi _0200B310
	lsls r1, r0, #2
	ldr r0, _0200B2E8 @ =gUnknown_030019B8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0xf
	cmp r1, r0
	bge _0200B30C
	str r4, [r2]
	b _0200B310
	.align 2, 0
_0200B2E0: .4byte gUnknown_030019BA
_0200B2E4: .4byte gUnknown_030019C0
_0200B2E8: .4byte gUnknown_030019B8
_0200B2EC:
	lsls r1, r0, #2
	adds r1, r1, r0
	ldr r0, _0200B304 @ =gUnknown_030019B7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0xf
	cmp r1, r0
	bge _0200B308
	movs r0, #2
	b _0200B30E
	.align 2, 0
_0200B304: .4byte gUnknown_030019B7
_0200B308:
	movs r0, #3
	b _0200B30E
_0200B30C:
	movs r0, #1
_0200B30E:
	str r0, [r2]
_0200B310:
	bl sub_0200a718
_0200B314:
	ldr r0, _0200B32C @ =gUnknown_030019C0
	ldr r0, [r0]
	cmp r0, #1
	beq _0200B33C
	cmp r0, #1
	blo _0200B330
	cmp r0, #2
	beq _0200B344
	cmp r0, #3
	beq _0200B350
	b _0200B358
	.align 2, 0
_0200B32C: .4byte gUnknown_030019C0
_0200B330:
	ldr r1, _0200B338 @ =gUnknown_030019B8
	ldrb r0, [r1]
	subs r0, #1
	b _0200B356
	.align 2, 0
_0200B338: .4byte gUnknown_030019B8
_0200B33C:
	ldr r1, _0200B340 @ =gUnknown_030019B8
	b _0200B352
	.align 2, 0
_0200B340: .4byte gUnknown_030019B8
_0200B344:
	ldr r1, _0200B34C @ =gUnknown_030019B7
	ldrb r0, [r1]
	subs r0, #1
	b _0200B356
	.align 2, 0
_0200B34C: .4byte gUnknown_030019B7
_0200B350:
	ldr r1, _0200B3B8 @ =gUnknown_030019B7
_0200B352:
	ldrb r0, [r1]
	adds r0, #1
_0200B356:
	strb r0, [r1]
_0200B358:
	ldr r1, _0200B3BC @ =gUnknown_030019BC
	movs r0, #0x20
	strh r0, [r1]
_0200B35E:
	ldr r0, _0200B3BC @ =gUnknown_030019BC
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0x14
	beq _0200B36A
	b _0200B4B4
_0200B36A:
	ldr r0, _0200B3B8 @ =gUnknown_030019B7
	movs r7, #0
	ldrsb r7, [r0, r7]
	ldr r0, _0200B3C0 @ =gUnknown_030019B8
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r1, _0200B3C4 @ =gUnknown_03001990
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r7, r0
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r6, r7, #0
	adds r5, r4, #0
	cmp r0, #0
	bge _0200B394
	b _0200B4B4
_0200B394:
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r1, _0200B3C8 @ =0x5FFF0000
	cmp r0, r1
	ble _0200B3A2
	b _0200B4B4
_0200B3A2:
	ldr r0, _0200B3CC @ =gUnknown_030019C0
	ldr r0, [r0]
	cmp r0, #1
	beq _0200B3D4
	cmp r0, #1
	blo _0200B3D0
	cmp r0, #2
	beq _0200B3D8
	cmp r0, #3
	beq _0200B3DC
	b _0200B3DE
	.align 2, 0
_0200B3B8: .4byte gUnknown_030019B7
_0200B3BC: .4byte gUnknown_030019BC
_0200B3C0: .4byte gUnknown_030019B8
_0200B3C4: .4byte gUnknown_03001990
_0200B3C8: .4byte 0x5FFF0000
_0200B3CC: .4byte gUnknown_030019C0
_0200B3D0:
	subs r5, r4, #1
	b _0200B3DE
_0200B3D4:
	adds r5, r4, #1
	b _0200B3DE
_0200B3D8:
	subs r6, r7, #1
	b _0200B3DE
_0200B3DC:
	adds r6, r7, #1
_0200B3DE:
	cmp r5, #4
	bhi _0200B4B4
	cmp r6, #0
	blt _0200B4B4
	cmp r6, #5
	bgt _0200B4B4
	ldr r3, _0200B430 @ =gUnknown_03001990
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r6, r0
	adds r2, r0, r3
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0200B4B4
	ldr r0, _0200B434 @ =gUnknown_030019C8
	mov r6, r8
	strb r6, [r0]
	ldr r1, _0200B438 @ =gUnknown_030019CA
	lsls r0, r7, #5
	strh r0, [r1]
	ldr r1, _0200B43C @ =gUnknown_030019CC
	lsls r0, r4, #5
	strh r0, [r1]
	ldr r1, _0200B440 @ =gUnknown_030019C9
	movs r0, #0x20
	strb r0, [r1]
	ldr r1, _0200B444 @ =gUnknown_030019D0
	ldr r0, _0200B448 @ =gUnknown_030019C0
	ldr r0, [r0]
	str r0, [r1]
	strb r6, [r2]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r7, r0
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0]
	b _0200B4B4
	.align 2, 0
_0200B430: .4byte gUnknown_03001990
_0200B434: .4byte gUnknown_030019C8
_0200B438: .4byte gUnknown_030019CA
_0200B43C: .4byte gUnknown_030019CC
_0200B440: .4byte gUnknown_030019C9
_0200B444: .4byte gUnknown_030019D0
_0200B448: .4byte gUnknown_030019C0
_0200B44C:
	ldr r0, _0200B4FC @ =gUnknown_030019C4
	ldrh r0, [r0]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xde
	bhi _0200B46C
	ldr r0, _0200B500 @ =gUnknown_030019C6
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0200B46C
	cmp r1, #0x9f
	ble _0200B4B4
_0200B46C:
	bl sub_02009910
	ldr r1, _0200B504 @ =gUnknown_030019D8
	movs r0, #6
	str r0, [r1]
	ldr r0, _0200B508 @ =gUnknown_030019DC
	movs r4, #0
	str r4, [r0]
	ldr r0, _0200B50C @ =gUnknown_030019B0
	strb r4, [r0]
	ldr r0, _0200B510 @ =gUnknown_030019AE
	movs r1, #2
	strb r1, [r0]
	ldr r0, _0200B514 @ =gUnknown_030019AF
	strb r1, [r0]
	ldr r1, _0200B518 @ =gUnknown_030019B2
	movs r0, #0x54
	strh r0, [r1]
	ldr r1, _0200B51C @ =gUnknown_030019B4
	movs r0, #0x38
	strh r0, [r1]
	bl sub_0200a638
	movs r2, #0xe0
	lsls r2, r2, #0x13
	ldr r0, [r2]
	ldr r1, _0200B520 @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r0, _0200B524 @ =gUnknown_030019B6
	strb r4, [r0]
	ldr r0, _0200B528 @ =gUnknown_030019F8
	strb r4, [r0]
	ldr r1, _0200B52C @ =gUnknown_030019D5
	movs r0, #1
	strb r0, [r1]
_0200B4B4:
	ldr r6, _0200B530 @ =gUnknown_030019BC
	ldrh r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0200B4C6
	movs r0, #0xf       @ SE_CHAO_WALK
	bl m4aSongNumStart
_0200B4C6:
	ldr r0, _0200B534 @ =gUnknown_030019B7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #5
	adds r5, r0, #4
	ldr r0, _0200B538 @ =gUnknown_030019B8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #5
	adds r4, r0, #4
	ldr r0, _0200B53C @ =gUnknown_030019C0
	ldr r0, [r0]
	cmp r0, #1
	beq _0200B540
	cmp r0, #1
	blo _0200B4F2
	cmp r0, #2
	beq _0200B54A
	cmp r0, #3
	beq _0200B552
_0200B4F2:
	movs r3, #0
	ldrsh r0, [r6, r3]
	adds r4, r4, r0
	movs r2, #0x1b
	b _0200B55A
	.align 2, 0
_0200B4FC: .4byte gUnknown_030019C4
_0200B500: .4byte gUnknown_030019C6
_0200B504: .4byte gUnknown_030019D8
_0200B508: .4byte gUnknown_030019DC
_0200B50C: .4byte gUnknown_030019B0
_0200B510: .4byte gUnknown_030019AE
_0200B514: .4byte gUnknown_030019AF
_0200B518: .4byte gUnknown_030019B2
_0200B51C: .4byte gUnknown_030019B4
_0200B520: .4byte 0xC1FFFCFF
_0200B524: .4byte gUnknown_030019B6
_0200B528: .4byte gUnknown_030019F8
_0200B52C: .4byte gUnknown_030019D5
_0200B530: .4byte gUnknown_030019BC
_0200B534: .4byte gUnknown_030019B7
_0200B538: .4byte gUnknown_030019B8
_0200B53C: .4byte gUnknown_030019C0
_0200B540:
	movs r1, #0
	ldrsh r0, [r6, r1]
	subs r4, r4, r0
	movs r2, #0
	b _0200B55A
_0200B54A:
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r5, r5, r0
	b _0200B558
_0200B552:
	movs r3, #0
	ldrsh r0, [r6, r3]
	subs r5, r5, r0
_0200B558:
	movs r2, #0x36
_0200B55A:
	ldr r0, _0200B570 @ =gUnknown_030019BE
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x1b
	movs r0, #3
	ands r1, r0
	cmp r1, #1
	beq _0200B574
	cmp r1, #3
	beq _0200B578
	b _0200B57A
	.align 2, 0
_0200B570: .4byte gUnknown_030019BE
_0200B574:
	adds r2, #9
	b _0200B57A
_0200B578:
	adds r2, #0x12
_0200B57A:
	adds r0, r2, #0
	bl sub_020099f8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_02009a70
	ldr r1, _0200B5BC @ =gUnknown_030019BE
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0200B5C0 @ =gUnknown_030019C4
	strh r5, [r0]
	ldr r0, _0200B5C4 @ =gUnknown_030019C6
	strh r4, [r0]
	ldr r0, _0200B5C8 @ =gUnknown_030019C8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0200B64A
	ldr r0, _0200B5CC @ =gUnknown_030019D0
	ldr r0, [r0]
	cmp r0, #1
	beq _0200B5E0
	cmp r0, #1
	blo _0200B5D4
	cmp r0, #2
	beq _0200B5F4
	cmp r0, #3
	beq _0200B600
	ldr r0, _0200B5D0 @ =gUnknown_030019CA
	b _0200B60A
	.align 2, 0
_0200B5BC: .4byte gUnknown_030019BE
_0200B5C0: .4byte gUnknown_030019C4
_0200B5C4: .4byte gUnknown_030019C6
_0200B5C8: .4byte gUnknown_030019C8
_0200B5CC: .4byte gUnknown_030019D0
_0200B5D0: .4byte gUnknown_030019CA
_0200B5D4:
	ldr r1, _0200B5DC @ =gUnknown_030019CC
	ldrh r0, [r1]
	subs r0, #1
	b _0200B5E6
	.align 2, 0
_0200B5DC: .4byte gUnknown_030019CC
_0200B5E0:
	ldr r1, _0200B5EC @ =gUnknown_030019CC
	ldrh r0, [r1]
	adds r0, #1
_0200B5E6:
	strh r0, [r1]
	ldr r0, _0200B5F0 @ =gUnknown_030019CA
	b _0200B60C
	.align 2, 0
_0200B5EC: .4byte gUnknown_030019CC
_0200B5F0: .4byte gUnknown_030019CA
_0200B5F4:
	ldr r1, _0200B5FC @ =gUnknown_030019CA
	ldrh r0, [r1]
	subs r0, #1
	b _0200B606
	.align 2, 0
_0200B5FC: .4byte gUnknown_030019CA
_0200B600:
	ldr r1, _0200B67C @ =gUnknown_030019CA
	ldrh r0, [r1]
	adds r0, #1
_0200B606:
	strh r0, [r1]
	adds r0, r1, #0
_0200B60A:
	ldr r1, _0200B680 @ =gUnknown_030019CC
_0200B60C:
	ldr r5, _0200B684 @ =gUnknown_030019C8
	movs r3, #0
	ldrsb r3, [r5, r3]
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	lsls r3, r3, #3
	ldr r0, _0200B688 @ =0x07000058
	adds r3, r3, r0
	ldr r0, [r3]
	ldr r1, _0200B68C @ =0xFE00FF00
	ands r0, r1
	lsls r2, r2, #0x10
	orrs r2, r4
	orrs r0, r2
	str r0, [r3]
	ldr r1, _0200B690 @ =gUnknown_030019C9
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _0200B64A
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r5]
	ldr r0, _0200B694 @ =gUnknown_030019E4
	str r1, [r0]
_0200B64A:
	ldr r0, _0200B698 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0200B658
	b _0200BDD2
_0200B658:
	ldr r0, _0200B69C @ =gUnknown_030019C0
	ldr r0, [r0]
	subs r0, #2
	cmp r0, #1
	bls _0200B664
	b _0200BDD2
_0200B664:
	ldr r2, _0200B6A0 @ =gUnknown_030019BF
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	beq _0200B670
	b _0200BDD2
_0200B670:
	movs r0, #1
	strb r0, [r2]
_0200B674:
	ldr r0, _0200B694 @ =gUnknown_030019E4
	str r1, [r0]
	b _0200BDD2
	.align 2, 0
_0200B67C: .4byte gUnknown_030019CA
_0200B680: .4byte gUnknown_030019CC
_0200B684: .4byte gUnknown_030019C8
_0200B688: .4byte 0x07000058
_0200B68C: .4byte 0xFE00FF00
_0200B690: .4byte gUnknown_030019C9
_0200B694: .4byte gUnknown_030019E4
_0200B698: .4byte gUnknown_030043F0
_0200B69C: .4byte gUnknown_030019C0
_0200B6A0: .4byte gUnknown_030019BF
_0200B6A4:
	ldr r0, _0200B6B8 @ =gUnknown_030019DC
	ldr r0, [r0]
	cmp r0, #8
	bls _0200B6AE
	b _0200BBB2
_0200B6AE:
	lsls r0, r0, #2
	ldr r1, _0200B6BC @ =_0200B6C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200B6B8: .4byte gUnknown_030019DC
_0200B6BC: .4byte _0200B6C0
_0200B6C0: @ jump table
	.4byte _0200B6E4 @ case 0
	.4byte _0200B6E4 @ case 1
	.4byte _0200B80C @ case 2
	.4byte _0200B864 @ case 3
	.4byte _0200B93C @ case 4
	.4byte _0200B990 @ case 5
	.4byte _0200BAD0 @ case 6
	.4byte _0200BB58 @ case 7
	.4byte _0200BB80 @ case 8
_0200B6E4:
	ldr r0, _0200B7C4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200B708
	ldr r1, _0200B7C8 @ =gUnknown_030019AF
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0200B702
	movs r0, #4
	strb r0, [r1]
_0200B702:
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_0200B708:
	ldr r0, _0200B7C4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B72E
	ldr r1, _0200B7C8 @ =gUnknown_030019AF
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	ble _0200B728
	movs r0, #0
	strb r0, [r1]
_0200B728:
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_0200B72E:
	ldr r0, _0200B7C4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0200B752
	ldr r1, _0200B7CC @ =gUnknown_030019AE
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0200B74C
	movs r0, #5
	strb r0, [r1]
_0200B74C:
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_0200B752:
	ldr r0, _0200B7C4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0200B778
	ldr r1, _0200B7CC @ =gUnknown_030019AE
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _0200B772
	movs r0, #0
	strb r0, [r1]
_0200B772:
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_0200B778:
	ldr r0, _0200B7C4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0200B788
	b _0200BBB2
_0200B788:
	ldr r3, _0200B7D0 @ =gUnknown_03001990
	ldr r5, _0200B7CC @ =gUnknown_030019AE
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r6, _0200B7C8 @ =gUnknown_030019AF
	movs r2, #0
	ldrsb r2, [r6, r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	movs r2, #0
	ldrsb r2, [r1, r2]
	cmp r2, #0
	bge _0200B7AA
	b _0200BBB2
_0200B7AA:
	ldr r4, _0200B7D4 @ =gUnknown_030019DC
	ldr r1, [r4]
	cmp r1, #0
	bne _0200B7DC
	ldr r0, _0200B7D8 @ =gUnknown_030019E8
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r1, [r5]
	strb r1, [r0, #2]
	ldrb r1, [r6]
	strb r1, [r0, #3]
	str r7, [r4]
	b _0200B7FE
	.align 2, 0
_0200B7C4: .4byte gUnknown_030043F0
_0200B7C8: .4byte gUnknown_030019AF
_0200B7CC: .4byte gUnknown_030019AE
_0200B7D0: .4byte gUnknown_03001990
_0200B7D4: .4byte gUnknown_030019DC
_0200B7D8: .4byte gUnknown_030019E8
_0200B7DC:
	ldr r3, _0200B808 @ =gUnknown_030019E8
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _0200B7E8
	b _0200BBB2
_0200B7E8:
	adds r1, r3, #0
	adds r1, #8
	movs r0, #0
	strb r2, [r3, #8]
	strb r0, [r1, #1]
	ldrb r0, [r5]
	strb r0, [r1, #2]
	ldrb r0, [r6]
	strb r0, [r1, #3]
	movs r0, #2
	str r0, [r4]
_0200B7FE:
	movs r0, #0x1d
	bl m4aSongNumStart
	b _0200BBB2
	.align 2, 0
_0200B808: .4byte gUnknown_030019E8
_0200B80C:
	ldr r3, _0200B84C @ =gUnknown_030019E8
	movs r0, #9
	ldrsb r0, [r3, r0]
	cmp r0, #0x1e
	beq _0200B818
	b _0200BBB2
_0200B818:
	movs r2, #0xe0
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0200B850 @ =gUnknown_030019DC
	movs r0, #3
	str r0, [r2]
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x18
	asrs r1, r1, #0x19
	asrs r0, r0, #0x19
	cmp r1, r0
	bne _0200B854
	movs r0, #5
	str r0, [r2]
	movs r0, #0x1b
	bl m4aSongNumStart
	b _0200B85A
	.align 2, 0
_0200B84C: .4byte gUnknown_030019E8
_0200B850: .4byte gUnknown_030019DC
_0200B854:
	movs r0, #0x1c
	bl m4aSongNumStart
_0200B85A:
	ldr r1, _0200B860 @ =gUnknown_030019E4
	b _0200BBAE
	.align 2, 0
_0200B860: .4byte gUnknown_030019E4
_0200B864:
	ldr r0, _0200B87C @ =gUnknown_030019E4
	ldr r1, [r0]
	mov sl, r0
	cmp r1, #0x28
	beq _0200B89A
	cmp r1, #0x28
	bgt _0200B880
	cmp r1, #0
	beq _0200B88A
	cmp r1, #0x14
	beq _0200B8DC
	b _0200B914
	.align 2, 0
_0200B87C: .4byte gUnknown_030019E4
_0200B880:
	cmp r1, #0x3c
	beq _0200B8DC
	cmp r1, #0x50
	beq _0200B89A
	b _0200B914
_0200B88A:
	movs r0, #0xe0
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r2, r6, #0
	orrs r1, r2
	strh r1, [r0]
_0200B89A:
	ldr r0, _0200B8D4 @ =gUnknown_030019B6
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	ldr r1, _0200B8D8 @ =0x0600CC76
	subs r1, r1, r0
	movs r4, #0xc4
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r0, #0
_0200B8B4:
	lsls r0, r2, #6
	adds r5, r2, #1
	adds r2, r0, r1
	movs r3, #2
_0200B8BC:
	adds r0, r4, #0
	orrs r0, r6
	strh r0, [r2]
	adds r4, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0200B8BC
	adds r2, r5, #0
	cmp r2, #2
	ble _0200B8B4
	b _0200B914
	.align 2, 0
_0200B8D4: .4byte gUnknown_030019B6
_0200B8D8: .4byte 0x0600CC76
_0200B8DC:
	ldr r0, _0200B930 @ =gUnknown_030019B6
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	ldr r1, _0200B934 @ =0x0600CC76
	subs r1, r1, r0
	movs r4, #0xbb
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #6
	adds r6, r3, #0
_0200B8F6:
	lsls r0, r2, #6
	adds r5, r2, #1
	adds r2, r0, r1
	movs r3, #2
_0200B8FE:
	adds r0, r4, #0
	orrs r0, r6
	strh r0, [r2]
	adds r4, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0200B8FE
	adds r2, r5, #0
	cmp r2, #2
	ble _0200B8F6
_0200B914:
	mov r4, sl
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	cmp r0, #0x54
	beq _0200B922
	b _0200BBB2
_0200B922:
	ldr r1, _0200B930 @ =gUnknown_030019B6
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0200B938 @ =gUnknown_030019DC
	movs r0, #4
	b _0200BBB0
	.align 2, 0
_0200B930: .4byte gUnknown_030019B6
_0200B934: .4byte 0x0600CC76
_0200B938: .4byte gUnknown_030019DC
_0200B93C:
	ldr r0, _0200B964 @ =gUnknown_030019E8
	movs r3, #1
	ldrsb r3, [r0, r3]
	cmp r3, #0
	beq _0200B948
	b _0200BBB2
_0200B948:
	ldr r0, _0200B968 @ =gUnknown_030019B6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0200B974
	movs r0, #8
	str r0, [r4]
	ldr r0, _0200B96C @ =gUnknown_030019E0
	str r3, [r0]
	ldr r0, _0200B970 @ =gUnknown_030019E4
	str r3, [r0]
	b _0200BBB2
	.align 2, 0
_0200B964: .4byte gUnknown_030019E8
_0200B968: .4byte gUnknown_030019B6
_0200B96C: .4byte gUnknown_030019E0
_0200B970: .4byte gUnknown_030019E4
_0200B974:
	movs r2, #0xe0
	lsls r2, r2, #0x13
	ldr r0, [r2]
	ldr r1, _0200B988 @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r0, _0200B98C @ =gUnknown_030019DC
	str r3, [r0]
	b _0200BBB2
	.align 2, 0
_0200B988: .4byte 0xC1FFFCFF
_0200B98C: .4byte gUnknown_030019DC
_0200B990:
	ldr r0, _0200BA58 @ =gUnknown_030019E4
	ldr r2, [r0]
	mov sl, r0
	cmp r2, #0
	bne _0200BA7C
	ldr r0, _0200BA5C @ =0x070003E6
	ldr r6, _0200BA60 @ =0x0000FFFF
	adds r1, r6, #0
	strh r1, [r0]
	adds r0, #0x18
	strh r1, [r0]
	subs r0, #0x10
	strh r2, [r0]
	adds r0, #8
	strh r2, [r0]
	movs r0, #0
	ldr r1, _0200BA64 @ =gUnknown_030019E8
	mov r8, r1
	ldr r7, _0200BA68 @ =gUnknown_03001990
	movs r2, #0xfc
	lsls r2, r2, #8
	mov sb, r2
_0200B9BC:
	adds r3, r0, #1
	lsls r0, r0, #3
	mov r6, r8
	adds r4, r0, r6
	movs r5, #1
	ldrb r2, [r4, #2]
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r3, #0
	cmp r0, #3
	bhi _0200B9F6
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r1, #0
	ble _0200B9F6
	cmp r1, #3
	bgt _0200B9F6
	movs r5, #3
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0200B9F6
	cmp r1, #1
	ble _0200B9F6
	cmp r1, #2
	bgt _0200B9F6
	movs r5, #5
_0200B9F6:
	strb r5, [r4, #4]
	movs r2, #2
	ldrsb r2, [r4, r2]
	movs r1, #3
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	adds r2, r2, r7
	movs r0, #0xff
	strb r0, [r2]
	lsls r3, r3, #3
	ldr r0, _0200BA6C @ =0x07000004
	adds r2, r3, r0
	ldrh r0, [r2]
	mov r1, sb
	ands r1, r0
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, #0xeb
	orrs r1, r0
	strh r1, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r3, r3, r1
	ldr r2, [r3]
	ldr r0, _0200BA70 @ =0xFE00FF00
	ands r2, r0
	movs r1, #2
	ldrsb r1, [r4, r1]
	lsls r1, r1, #5
	adds r1, #6
	lsls r1, r1, #0x10
	movs r0, #3
	ldrsb r0, [r4, r0]
	lsls r0, r0, #5
	orrs r1, r0
	orrs r2, r1
	ldr r0, _0200BA74 @ =0xC1FFFCFF
	ands r2, r0
	ldr r0, _0200BA78 @ =0x3E000100
	orrs r2, r0
	str r2, [r3]
	adds r0, r6, #0
	cmp r0, #1
	ble _0200B9BC
	b _0200BA8E
	.align 2, 0
_0200BA58: .4byte gUnknown_030019E4
_0200BA5C: .4byte 0x070003E6
_0200BA60: .4byte 0x0000FFFF
_0200BA64: .4byte gUnknown_030019E8
_0200BA68: .4byte gUnknown_03001990
_0200BA6C: .4byte 0x07000004
_0200BA70: .4byte 0xFE00FF00
_0200BA74: .4byte 0xC1FFFCFF
_0200BA78: .4byte 0x3E000100
_0200BA7C:
	ldr r4, _0200BABC @ =0x070003E6
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r4]
	ldr r1, _0200BAC0 @ =0x070003FE
	strh r0, [r1]
_0200BA8E:
	mov r2, sl
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	cmp r0, #0x11
	beq _0200BA9C
	b _0200BBB2
_0200BA9C:
	ldr r1, _0200BAC4 @ =0x07000008
	ldr r0, [r1]
	ldr r2, _0200BAC8 @ =0xC1FFFCFF
	ands r0, r2
	str r0, [r1]
	adds r1, #8
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	movs r0, #0
	mov r3, sl
	str r0, [r3]
	ldr r1, _0200BACC @ =gUnknown_030019DC
	movs r0, #6
	b _0200BBB0
	.align 2, 0
_0200BABC: .4byte 0x070003E6
_0200BAC0: .4byte 0x070003FE
_0200BAC4: .4byte 0x07000008
_0200BAC8: .4byte 0xC1FFFCFF
_0200BACC: .4byte gUnknown_030019DC
_0200BAD0:
	ldr r4, _0200BB48 @ =gUnknown_030019E4
	ldr r0, [r4]
	lsls r0, r0, #0x10
	movs r1, #0x14
	bl __divsi3
	adds r7, r0, #0
	movs r2, #0
	mov sl, r4
	ldr r4, _0200BB4C @ =gUnknown_030019E8
	mov r8, r4
_0200BAE6:
	adds r6, r2, #1
	lsls r0, r2, #3
	add r0, r8
	movs r1, #2
	ldrsb r1, [r0, r1]
	lsls r1, r1, #5
	adds r4, r1, #6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r5, r0, #5
	movs r1, #0xc2
	cmp r2, #0
	bne _0200BB04
	movs r1, #0xda
_0200BB04:
	lsls r3, r6, #3
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r3, r3, r0
	ldr r2, [r3]
	ldr r0, _0200BB50 @ =0xFE00FF00
	ands r2, r0
	subs r0, r1, r4
	adds r1, r7, #0
	muls r1, r0, r1
	asrs r1, r1, #0x10
	adds r1, r4, r1
	lsls r1, r1, #0x10
	movs r0, #0x10
	subs r0, r0, r5
	muls r0, r7, r0
	asrs r0, r0, #0x10
	adds r0, r5, r0
	orrs r1, r0
	orrs r2, r1
	str r2, [r3]
	adds r2, r6, #0
	cmp r2, #1
	ble _0200BAE6
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x15
	bne _0200BBB2
	ldr r1, _0200BB54 @ =gUnknown_030019DC
	movs r0, #7
	b _0200BBB0
	.align 2, 0
_0200BB48: .4byte gUnknown_030019E4
_0200BB4C: .4byte gUnknown_030019E8
_0200BB50: .4byte 0xFE00FF00
_0200BB54: .4byte gUnknown_030019DC
_0200BB58:
	ldr r1, _0200BB78 @ =gUnknown_030019E8
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0xc]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	bl sub_0200a284
	ldr r1, _0200BB7C @ =gUnknown_030019DC
	movs r0, #8
	str r0, [r1]
	movs r0, #0x18
	bl m4aSongNumStart
	b _0200BBB2
	.align 2, 0
_0200BB78: .4byte gUnknown_030019E8
_0200BB7C: .4byte gUnknown_030019DC
_0200BB80:
	ldr r1, _0200BB98 @ =gUnknown_030019F8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	bne _0200BBA0
	str r0, [r4]
	ldr r1, _0200BB9C @ =gUnknown_030019E0
	b _0200BBAE
	.align 2, 0
_0200BB98: .4byte gUnknown_030019F8
_0200BB9C: .4byte gUnknown_030019E0
_0200BBA0:
	movs r2, #0xe0
	lsls r2, r2, #0x13
	ldr r0, [r2]
	ldr r1, _0200BBC4 @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r1, _0200BBC8 @ =gUnknown_030019DC
_0200BBAE:
	movs r0, #0
_0200BBB0:
	str r0, [r1]
_0200BBB2:
	ldr r0, _0200BBC8 @ =gUnknown_030019DC
	ldr r0, [r0]
	cmp r0, #2
	beq _0200BBD2
	cmp r0, #2
	bhi _0200BBCC
	cmp r0, #1
	beq _0200BBEC
	b _0200BC34
	.align 2, 0
_0200BBC4: .4byte 0xC1FFFCFF
_0200BBC8: .4byte gUnknown_030019DC
_0200BBCC:
	cmp r0, #4
	beq _0200BC0C
	b _0200BC34
_0200BBD2:
	ldr r2, _0200BC08 @ =gUnknown_030019E8
	ldrb r1, [r2, #9]
	movs r3, #9
	ldrsb r3, [r2, r3]
	cmp r3, #0x1d
	bgt _0200BBEC
	movs r0, #8
	ldrsb r0, [r2, r0]
	adds r1, #1
	strb r1, [r2, #9]
	adds r1, r3, #0
	bl sub_0200a45c
_0200BBEC:
	ldr r2, _0200BC08 @ =gUnknown_030019E8
	ldrb r1, [r2, #1]
	movs r3, #1
	ldrsb r3, [r2, r3]
	cmp r3, #0x1d
	bgt _0200BC34
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r1, #1
	strb r1, [r2, #1]
	adds r1, r3, #0
	bl sub_0200a45c
	b _0200BC34
	.align 2, 0
_0200BC08: .4byte gUnknown_030019E8
_0200BC0C:
	movs r4, #0
_0200BC0E:
	lsls r1, r4, #3
	ldr r0, _0200BC48 @ =gUnknown_030019E8
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _0200BC2E
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_0200a45c
_0200BC2E:
	adds r4, #1
	cmp r4, #1
	ble _0200BC0E
_0200BC34:
	ldr r0, _0200BC4C @ =gUnknown_030043F0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r1, _0200BC50 @ =gUnknown_030019B0
	strb r0, [r1]
	bl sub_0200a638
	b _0200BDD2
	.align 2, 0
_0200BC48: .4byte gUnknown_030019E8
_0200BC4C: .4byte gUnknown_030043F0
_0200BC50: .4byte gUnknown_030019B0
_0200BC54:
	ldr r4, _0200BC78 @ =gUnknown_030019E0
	ldr r1, [r4]
	cmp r1, #0
	bne _0200BC68
	movs r0, #1
	str r0, [r4]
	ldr r0, _0200BC7C @ =gUnknown_030019D5
	strb r1, [r0]
	bl sub_0200a404
_0200BC68:
	ldr r0, [r4]
	cmp r0, #4
	bgt _0200BC80
	cmp r0, #2
	bge _0200BCAC
	cmp r0, #1
	beq _0200BC86
	b _0200BDD2
	.align 2, 0
_0200BC78: .4byte gUnknown_030019E0
_0200BC7C: .4byte gUnknown_030019D5
_0200BC80:
	cmp r0, #5
	beq _0200BD34
	b _0200BDD2
_0200BC86:
	bl sub_02009df4
	cmp r0, #0
	bne _0200BC90
	b _0200BDD2
_0200BC90:
	ldr r0, _0200BCA4 @ =gUnknown_030019B6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #2
	str r0, [r4]
	ldr r1, _0200BCA8 @ =gUnknown_030019E4
	movs r0, #0
	b _0200BDD0
	.align 2, 0
_0200BCA4: .4byte gUnknown_030019B6
_0200BCA8: .4byte gUnknown_030019E4
_0200BCAC:
	ldr r1, _0200BD08 @ =gUnknown_030019E4
	ldr r6, [r1]
	adds r0, r6, #1
	str r0, [r1]
	cmp r6, #0
	bne _0200BD18
	movs r0, #0x18
	bl m4aSongNumStart
	ldr r0, [r4]
	subs r0, #2
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #6
	ldr r0, _0200BD0C @ =0x0600CC76
	subs r7, r0, r1
	movs r3, #0xc4
	movs r1, #0
	mov r8, r4
	movs r2, #0x80
	lsls r2, r2, #6
	adds r5, r2, #0
_0200BCD8:
	lsls r0, r1, #6
	adds r4, r1, #1
	adds r1, r0, r7
	movs r2, #2
_0200BCE0:
	adds r0, r3, #0
	orrs r0, r5
	strh r0, [r1]
	adds r3, #1
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0200BCE0
	adds r1, r4, #0
	cmp r1, #2
	ble _0200BCD8
	mov r3, r8
	ldr r0, [r3]
	cmp r0, #2
	beq _0200BD10
	movs r1, #0xa
	cmp r0, #3
	bne _0200BD12
	movs r1, #0x14
	b _0200BD12
	.align 2, 0
_0200BD08: .4byte gUnknown_030019E4
_0200BD0C: .4byte 0x0600CC76
_0200BD10:
	movs r1, #0x1e
_0200BD12:
	adds r0, r1, #0
	bl sub_0200a2a4
_0200BD18:
	cmp r6, #0x28
	bne _0200BDD2
	ldr r1, _0200BD2C @ =gUnknown_030019E4
	movs r0, #0
	str r0, [r1]
	ldr r1, _0200BD30 @ =gUnknown_030019E0
	ldr r0, [r1]
	adds r0, #1
	b _0200BDD0
	.align 2, 0
_0200BD2C: .4byte gUnknown_030019E4
_0200BD30: .4byte gUnknown_030019E0
_0200BD34:
	bl sub_0200a41c
	ldr r1, _0200BD40 @ =gUnknown_030019D8
	movs r0, #9
	b _0200BDD0
	.align 2, 0
_0200BD40: .4byte gUnknown_030019D8
_0200BD44:
	ldr r1, _0200BD74 @ =gUnknown_030019E0
	ldr r4, [r1]
	cmp r4, #0
	bne _0200BD58
	movs r0, #1
	str r0, [r1]
	bl sub_0200a3ec
	ldr r0, _0200BD78 @ =gUnknown_030019D5
	strb r4, [r0]
_0200BD58:
	ldr r1, _0200BD7C @ =gUnknown_030019E4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3a
	bne _0200BD68
	movs r0, #0
	str r0, [r1]
_0200BD68:
	ldr r1, [r1]
	cmp r1, #0x1c
	bgt _0200BD80
	adds r7, r1, #0
	b _0200BD84
	.align 2, 0
_0200BD74: .4byte gUnknown_030019E0
_0200BD78: .4byte gUnknown_030019D5
_0200BD7C: .4byte gUnknown_030019E4
_0200BD80:
	movs r0, #0x3a
	subs r7, r0, r1
_0200BD84:
	movs r1, #0
	ldr r4, _0200BE08 @ =gUnknown_03001990
	mov r8, r4
_0200BD8A:
	lsls r0, r1, #1
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r1, r8
	adds r4, r0, r1
	movs r5, #5
_0200BD98:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0200BDA6
	adds r1, r7, #0
	bl sub_0200a45c
_0200BDA6:
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bge _0200BD98
	adds r1, r6, #0
	cmp r1, #4
	ble _0200BD8A
_0200BDB4:
	bl sub_02009df4
	cmp r0, #0
	beq _0200BDD2
	bl sub_0200a2dc
	ldr r1, _0200BE0C @ =gUnknown_030019D4
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200BE10 @ =gUnknown_030019D8
	movs r0, #0
	str r0, [r1]
	ldr r1, _0200BE14 @ =gUnknown_03003330
	ldr r0, _0200BE18 @ =sub_02001BF8
_0200BDD0:
	str r0, [r1]
_0200BDD2:
	ldr r0, _0200BE1C @ =gUnknown_030019D5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0200BDF4
	ldr r0, _0200BE20 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200BDF4
	ldr r1, _0200BE0C @ =gUnknown_030019D4
	movs r0, #1
	strb r0, [r1]
	bl sub_0200a338
_0200BDF4:
	bl sub_0200a21c
sub_0200bdf8:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BE08: .4byte gUnknown_03001990
_0200BE0C: .4byte gUnknown_030019D4
_0200BE10: .4byte gUnknown_030019D8
_0200BE14: .4byte gUnknown_03003330
_0200BE18: .4byte sub_02001BF8
_0200BE1C: .4byte gUnknown_030019D5
_0200BE20: .4byte gUnknown_030043F0

	thumb_func_start sub_0200be24
sub_0200be24: @ 0x0200be24
	ldr r1, _0200BE34 @ =gUnknown_030019D4
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200BE38 @ =gUnknown_030019D8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0200BE34: .4byte gUnknown_030019D4
_0200BE38: .4byte gUnknown_030019D8

	thumb_func_start sub_0200be3c
sub_0200be3c: @ 0x0200be3c
	push {r4, lr}
	ldr r0, _0200BE50 @ =gUnknown_03001A04
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0200BE54
	cmp r0, #1
	beq _0200BE60
	b _0200BE9E
	.align 2, 0
_0200BE50: .4byte gUnknown_03001A04
_0200BE54:
	ldr r1, _0200BE5C @ =gUnknown_03001A00
	ldrh r0, [r1]
	subs r0, #1
	b _0200BE66
	.align 2, 0
_0200BE5C: .4byte gUnknown_03001A00
_0200BE60:
	ldr r1, _0200BE8C @ =gUnknown_03001A00
	ldrh r0, [r1]
	adds r0, #1
_0200BE66:
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2f
	bl sub_02009a70
	ldr r0, _0200BE90 @ =gUnknown_03001A02
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x13
	movs r0, #3
	ands r1, r0
	cmp r1, #1
	beq _0200BE94
	cmp r1, #3
	beq _0200BE98
	movs r0, #0x36
	b _0200BE9A
	.align 2, 0
_0200BE8C: .4byte gUnknown_03001A00
_0200BE90: .4byte gUnknown_03001A02
_0200BE94:
	movs r0, #0x3f
	b _0200BE9A
_0200BE98:
	movs r0, #0x48
_0200BE9A:
	bl sub_020099f8
_0200BE9E:
	ldr r1, _0200BED4 @ =gUnknown_03001A02
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0200BEAE
	b _0200BFA4
_0200BEAE:
	ldr r4, _0200BED8 @ =gUnknown_03001A04
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0200BEDC @ =0x00001556
	bl __divsi3
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bhi _0200BF98
	lsls r0, r0, #2
	ldr r1, _0200BEE0 @ =_0200BEE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200BED4: .4byte gUnknown_03001A02
_0200BED8: .4byte gUnknown_03001A04
_0200BEDC: .4byte 0x00001556
_0200BEE0: .4byte _0200BEE4
_0200BEE4: @ jump table
	.4byte _0200BEFC @ case 0
	.4byte _0200BEFC @ case 1
	.4byte _0200BF68 @ case 2
	.4byte _0200BF70 @ case 3
	.4byte _0200BF7E @ case 4
	.4byte _0200BF78 @ case 5
_0200BEFC:
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xe4
	lsls r1, r1, #1
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	adds r2, #0x2c
	ldr r3, _0200BF3C @ =gUnknown_03001A00
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq _0200BEFC
	adds r4, r3, #0
	cmp r2, r0
	bge _0200BF48
	ldr r1, _0200BF40 @ =gUnknown_03001A04
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200BF44 @ =gUnknown_03001A02
	ldrh r0, [r4]
	subs r0, r0, r2
	strh r0, [r1]
	movs r0, #0
	bl sub_02009978
	b _0200BF98
	.align 2, 0
_0200BF3C: .4byte gUnknown_03001A00
_0200BF40: .4byte gUnknown_03001A04
_0200BF44: .4byte gUnknown_03001A02
_0200BF48:
	ldr r1, _0200BF60 @ =gUnknown_03001A04
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0200BF64 @ =gUnknown_03001A02
	ldrh r0, [r3]
	subs r0, r2, r0
	strh r0, [r1]
	movs r0, #1
	bl sub_02009978
	b _0200BF98
	.align 2, 0
_0200BF60: .4byte gUnknown_03001A04
_0200BF64: .4byte gUnknown_03001A02
_0200BF68:
	movs r0, #0
	bl sub_020099f8
	b _0200BF84
_0200BF70:
	movs r0, #0x1b
	bl sub_020099f8
	b _0200BF84
_0200BF78:
	movs r0, #1
	bl sub_02009978
_0200BF7E:
	movs r0, #0x36
	bl sub_020099f8
_0200BF84:
	ldr r4, _0200BFAC @ =gUnknown_03001A02
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb6
	bl __divsi3
	adds r0, #0x3c
	strh r0, [r4]
_0200BF98:
	ldr r0, _0200BFB0 @ =gUnknown_03001A00
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x2f
	bl sub_02009a70
_0200BFA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BFAC: .4byte gUnknown_03001A02
_0200BFB0: .4byte gUnknown_03001A00

	thumb_func_start sub_0200bfb4
sub_0200bfb4: @ 0x0200bfb4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	movs r3, #0
	ldrb r0, [r2, #4]
	adds r0, #1
	strb r0, [r2, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0200BFCE
	strb r3, [r2, #4]
_0200BFCE:
	movs r1, #4
	ldrsb r1, [r2, r1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	blt _0200BFDC
	movs r3, #1
_0200BFDC:
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r0, r3
	beq _0200C022
	strb r3, [r2, #3]
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #1
	cmp r3, #0
	beq _0200BFF2
	movs r1, #8
_0200BFF2:
	adds r7, r0, #0
	lsls r5, r1, #0xc
	movs r1, #0
	ldr r6, _0200C028 @ =0x00000FFF
	ldr r0, _0200C02C @ =0x0600D82E
	mov ip, r0
_0200BFFE:
	adds r0, r7, r1
	adds r4, r1, #1
	lsls r0, r0, #6
	mov r1, ip
	adds r2, r0, r1
	movs r3, #5
_0200C00A:
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0200C00A
	adds r1, r4, #0
	cmp r1, #4
	ble _0200BFFE
_0200C022:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200C028: .4byte 0x00000FFF
_0200C02C: .4byte 0x0600D82E

	thumb_func_start sub_0200c030
sub_0200c030: @ 0x0200c030
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r1, _0200C0A0 @ =gUnknown_03001A06
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	ldr r2, _0200C0A4 @ =gUnknown_03001A05
	cmp r0, #0
	bge _0200C05A
	movs r0, #0x3b
	strb r0, [r1]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0200C05A
	strb r7, [r1]
	strb r7, [r2]
	movs r7, #1
_0200C05A:
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r4, #0
	ldrsb r4, [r2, r4]
	cmp r5, #0xb
	ble _0200C06A
	movs r5, #0
	adds r4, #1
_0200C06A:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r6, #9
	bne _0200C086
	adds r2, r5, #0
_0200C086:
	movs r0, #0x9e
	bl sub_0200a1c4
	movs r0, #0x9c
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0200a1c4
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200C0A0: .4byte gUnknown_03001A06
_0200C0A4: .4byte gUnknown_03001A05

	thumb_func_start sub_0200c0a8
sub_0200c0a8: @ 0x0200c0a8
	push {r4, r5, r6, r7, lr}
	ldr r1, _0200C17C @ =gUnknown_03001A80
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0200C180 @ =gUnknown_03001A82
	movs r1, #0xa
	strb r1, [r0]
	ldr r0, _0200C184 @ =gUnknown_03001A83
	strb r1, [r0]
	movs r6, #0
	ldr r5, _0200C188 @ =0x07000048
	movs r7, #0
_0200C0C2:
	ldr r4, _0200C18C @ =gUnknown_03001A08
	adds r4, r7, r4
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0200C190 @ =gUnknown_03001A81
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r6, #5
	rsbs r0, r0, #0
	subs r0, r0, r1
	strh r0, [r4, #4]
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0200C194 @ =0x00002AAB
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	strb r0, [r4, #2]
	ldrh r2, [r5, #4]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	ands r2, r1
	ldr r1, _0200C198 @ =gUnknown_02015E98
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0xc
	ldrb r0, [r0, #1]
	orrs r0, r1
	orrs r2, r0
	ldr r1, _0200C19C @ =0x0000F3FF
	adds r0, r1, #0
	ands r2, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r5, #4]
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r7, #0xc
	adds r6, #1
	cmp r6, #9
	ble _0200C0C2
	ldr r0, _0200C17C @ =gUnknown_03001A80
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bne _0200C1A8
	movs r0, #0x1e
	ldr r1, _0200C1A0 @ =gUnknown_03001A05
	strb r0, [r1]
	ldr r0, _0200C1A4 @ =gUnknown_03001A06
	strb r2, [r0]
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r4, #0x1e
	cmp r5, #0xb
	ble _0200C14E
	movs r5, #0
	movs r4, #0x1f
_0200C14E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r6, #9
	bne _0200C16A
	adds r2, r5, #0
_0200C16A:
	movs r0, #0x9e
	bl sub_0200a1c4
	movs r0, #0x9c
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0200a1c4
	b _0200C1FC
	.align 2, 0
_0200C17C: .4byte gUnknown_03001A80
_0200C180: .4byte gUnknown_03001A82
_0200C184: .4byte gUnknown_03001A83
_0200C188: .4byte 0x07000048
_0200C18C: .4byte gUnknown_03001A08
_0200C190: .4byte gUnknown_03001A81
_0200C194: .4byte 0x00002AAB
_0200C198: .4byte gUnknown_02015E98
_0200C19C: .4byte 0x0000F3FF
_0200C1A0: .4byte gUnknown_03001A05
_0200C1A4: .4byte gUnknown_03001A06
_0200C1A8:
	ldr r3, _0200C204 @ =gUnknown_03001A05
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r0, #0
	adds r1, #0xa
	ldr r2, _0200C208 @ =gUnknown_03001A06
	cmp r1, #0x62
	ble _0200C1BE
	movs r1, #0x63
	movs r0, #0
	strb r0, [r2]
_0200C1BE:
	strb r1, [r3]
	movs r5, #0
	ldrsb r5, [r2, r5]
	movs r4, #0
	ldrsb r4, [r3, r4]
	cmp r5, #0xb
	ble _0200C1D0
	movs r5, #0
	adds r4, #1
_0200C1D0:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r6, #9
	bne _0200C1EC
	adds r2, r5, #0
_0200C1EC:
	movs r0, #0x9e
	bl sub_0200a1c4
	movs r0, #0x9c
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0200a1c4
_0200C1FC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200C204: .4byte gUnknown_03001A05
_0200C208: .4byte gUnknown_03001A06

	thumb_func_start sub_0200c20c
sub_0200c20c: @ 0x0200c20c
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	ldr r6, _0200C2A8 @ =0x07000048
	movs r1, #0x80
	lsls r1, r1, #2
	mov r8, r1
	ldr r2, _0200C2AC @ =0x0000F3FF
	adds r7, r2, #0
	mov sb, r0
_0200C228:
	ldr r0, _0200C2B0 @ =gUnknown_03001A08
	mov r3, sb
	adds r5, r3, r0
	ldrb r1, [r5, #1]
	adds r0, r1, #1
	strb r0, [r5, #1]
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #2
	beq _0200C30A
	cmp r0, #2
	ble _0200C250
	cmp r0, #3
	bne _0200C24A
	b _0200C3B8
_0200C24A:
	cmp r0, #4
	bne _0200C250
	b _0200C416
_0200C250:
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0200C274
	ldr r1, _0200C2B4 @ =gUnknown_03001A81
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r0, #0
	blt _0200C274
	movs r0, #0x1d
	bl m4aSongNumStart
	ldr r0, [r6]
	ldr r1, _0200C2B8 @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r6]
_0200C274:
	ldr r0, _0200C2B4 @ =gUnknown_03001A81
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r5, #4]
	adds r1, r0, r3
	strh r1, [r5, #4]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0200C300
	movs r0, #0xc4
	lsls r0, r0, #1
	cmp r2, r0
	ble _0200C298
	ldr r2, _0200C2BC @ =0xFFFFFE78
	adds r0, r1, r2
	strh r0, [r5, #4]
_0200C298:
	movs r3, #4
	ldrsh r1, [r5, r3]
	cmp r1, #0x3f
	bgt _0200C2C0
	movs r3, #0xa
	adds r2, r1, #0
	adds r2, #8
	b _0200C2E8
	.align 2, 0
_0200C2A8: .4byte 0x07000048
_0200C2AC: .4byte 0x0000F3FF
_0200C2B0: .4byte gUnknown_03001A08
_0200C2B4: .4byte gUnknown_03001A81
_0200C2B8: .4byte 0xC1FFFCFF
_0200C2BC: .4byte 0xFFFFFE78
_0200C2C0:
	cmp r1, #0xc3
	bgt _0200C2CC
	adds r3, r1, #0
	subs r3, #0x36
	movs r2, #0x48
	b _0200C2E8
_0200C2CC:
	ldr r0, _0200C2DC @ =0x00000103
	cmp r1, r0
	bgt _0200C2E0
	movs r3, #0x8e
	adds r0, #9
	subs r2, r0, r1
	b _0200C2E8
	.align 2, 0
_0200C2DC: .4byte 0x00000103
_0200C2E0:
	movs r0, #0xc9
	lsls r0, r0, #1
	subs r3, r0, r1
	movs r2, #8
_0200C2E8:
	strh r3, [r5, #6]
	strh r2, [r5, #8]
	ldr r1, [r6]
	ldr r0, _0200C2FC @ =0xFE00FF00
	ands r1, r0
	lsls r0, r3, #0x10
	orrs r0, r2
	orrs r1, r0
	str r1, [r6]
	b _0200C416
	.align 2, 0
_0200C2FC: .4byte 0xFE00FF00
_0200C300:
	ldrh r0, [r6]
	mov r1, r8
	orrs r0, r1
	strh r0, [r6]
	b _0200C416
_0200C30A:
	cmp r2, #0
	bne _0200C31C
	ldrh r0, [r6, #4]
	ands r0, r7
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r6, #4]
_0200C31C:
	cmp r2, #0x1d
	ble _0200C35C
	ldrh r0, [r6, #4]
	ands r0, r7
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #4]
	ldrh r0, [r6]
	mov r3, r8
	orrs r0, r3
	strh r0, [r6]
	movs r0, #4
	strb r0, [r5]
	ldr r1, _0200C3A4 @ =gUnknown_03001A82
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, _0200C3A8 @ =gUnknown_03001A80
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #1
	bl sub_0200a284
	movs r0, #0x18
	bl m4aSongNumStart
_0200C35C:
	movs r0, #6
	ldrsh r4, [r5, r0]
	movs r1, #8
	ldrsh r3, [r5, r1]
	adds r1, r4, #0
	adds r1, #0x20
	ldr r0, _0200C3AC @ =0x0000010F
	cmp r1, r0
	bhi _0200C416
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r3, r0
	blt _0200C416
	cmp r3, #0x9f
	bgt _0200C416
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	adds r4, r4, r0
	strh r4, [r5, #6]
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	adds r3, r3, r0
	strh r3, [r5, #8]
	ldr r2, [r6]
	ldr r0, _0200C3B0 @ =0xFE00FF00
	ands r2, r0
	ldr r0, _0200C3B4 @ =0x000001FF
	ands r4, r0
	lsls r1, r4, #0x10
	movs r0, #0xff
	ands r3, r0
	orrs r1, r3
	orrs r2, r1
	str r2, [r6]
	b _0200C416
	.align 2, 0
_0200C3A4: .4byte gUnknown_03001A82
_0200C3A8: .4byte gUnknown_03001A80
_0200C3AC: .4byte 0x0000010F
_0200C3B0: .4byte 0xFE00FF00
_0200C3B4: .4byte 0x000001FF
_0200C3B8:
	cmp r2, #0
	bne _0200C3CA
	ldrh r0, [r6, #4]
	ands r0, r7
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r6, #4]
_0200C3CA:
	cmp r2, #0x1d
	ble _0200C3F0
	ldrh r0, [r6, #4]
	ands r0, r7
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r6, #4]
	ldrh r0, [r6]
	mov r1, r8
	orrs r0, r1
	strh r0, [r6]
	movs r0, #4
	strb r0, [r5]
	ldr r1, _0200C400 @ =gUnknown_03001A82
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0200C3F0:
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	beq _0200C404
	cmp r0, #3
	beq _0200C40E
	b _0200C416
	.align 2, 0
_0200C400: .4byte gUnknown_03001A82
_0200C404:
	ldrh r0, [r6]
	mov r2, r8
	orrs r0, r2
	strh r0, [r6]
	b _0200C416
_0200C40E:
	ldr r0, [r6]
	ldr r1, _0200C44C @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r6]
_0200C416:
	adds r6, #8
	movs r3, #0xc
	add sb, r3
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #9
	bgt _0200C428
	b _0200C228
_0200C428:
	ldr r0, _0200C450 @ =gUnknown_03001A82
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0200C438
	bl sub_0200c0a8
_0200C438:
	ldr r0, _0200C454 @ =gUnknown_03001A83
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _0200C45C
	ldr r1, _0200C458 @ =gUnknown_03001A81
	movs r0, #4
	b _0200C460
	.align 2, 0
_0200C44C: .4byte 0xC1FFFCFF
_0200C450: .4byte gUnknown_03001A82
_0200C454: .4byte gUnknown_03001A83
_0200C458: .4byte gUnknown_03001A81
_0200C45C:
	ldr r1, _0200C470 @ =gUnknown_03001A81
	movs r0, #2
_0200C460:
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200C470: .4byte gUnknown_03001A81

	thumb_func_start sub_0200c474
sub_0200c474: @ 0x0200c474
	push {r4, lr}
	ldr r2, _0200C4E0 @ =gUnknown_03001AAD
	ldr r0, _0200C4E4 @ =gUnknown_03001AAC
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0200C496
	ldr r0, _0200C4E8 @ =gUnknown_03001AAE
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0200C4DA
_0200C496:
	ldr r1, _0200C4EC @ =gUnknown_03001AAF
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _0200C4DA
	movs r0, #0
	strb r0, [r1]
	ldr r4, _0200C4E8 @ =gUnknown_03001AAE
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0200C4C0
	movs r0, #0xb
	strb r0, [r4]
	subs r0, r3, #1
	strb r0, [r2]
_0200C4C0:
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r0, #0x98
	bl sub_0200a1c4
_0200C4DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200C4E0: .4byte gUnknown_03001AAD
_0200C4E4: .4byte gUnknown_03001AAC
_0200C4E8: .4byte gUnknown_03001AAE
_0200C4EC: .4byte gUnknown_03001AAF

	thumb_func_start sub_0200c4f0
sub_0200c4f0: @ 0x0200c4f0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	ldr r6, _0200C5B0 @ =0x07000006
	ldr r5, _0200C5B4 @ =0x07000028
	movs r3, #0xc0
	lsls r3, r3, #0xc
	mov sb, r3
	mov r8, r0
	movs r7, #2
_0200C50C:
	ldr r4, _0200C5B8 @ =gUnknown_03001A88
	add r4, r8
	mov r0, sl
	strb r0, [r4]
	movs r0, #0x74
	strh r0, [r4, #6]
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0200C5BC @ =0x00002AAB
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	strb r0, [r4, #2]
	ldr r2, [r5]
	ldr r1, _0200C5C0 @ =0xFE00FF00
	ands r2, r1
	movs r3, #6
	ldrsh r1, [r4, r3]
	mov r4, sb
	orrs r1, r4
	orrs r2, r1
	str r2, [r5]
	ldrh r3, [r5, #4]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r1, r4, #0
	ands r3, r1
	ldr r1, _0200C5C4 @ =gUnknown_02015ED4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0xc
	ldrb r0, [r0, #1]
	orrs r0, r1
	orrs r3, r0
	strh r3, [r5, #4]
	ldr r0, _0200C5C8 @ =0xC1FFFCFF
	ands r2, r0
	str r2, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6]
	mov r3, sl
	strh r3, [r6, #8]
	strh r3, [r6, #0x10]
	strh r0, [r6, #0x18]
	adds r6, #0x20
	adds r5, #8
	movs r4, #0x80
	lsls r4, r4, #0xf
	add sb, r4
	movs r0, #0xc
	add r8, r0
	subs r7, #1
	cmp r7, #0
	bge _0200C50C
	movs r2, #0
	ldr r0, _0200C5CC @ =gUnknown_03001AAC
	movs r1, #5
	strb r1, [r0]
	ldr r0, _0200C5D0 @ =gUnknown_03001AAD
	strb r1, [r0]
	ldr r1, _0200C5D4 @ =gUnknown_03001AAE
	strb r2, [r1]
	ldr r0, _0200C5D8 @ =gUnknown_03001AAF
	strb r2, [r0]
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #0x98
	movs r1, #5
	bl sub_0200a1c4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200C5B0: .4byte 0x07000006
_0200C5B4: .4byte 0x07000028
_0200C5B8: .4byte gUnknown_03001A88
_0200C5BC: .4byte 0x00002AAB
_0200C5C0: .4byte 0xFE00FF00
_0200C5C4: .4byte gUnknown_02015ED4
_0200C5C8: .4byte 0xC1FFFCFF
_0200C5CC: .4byte gUnknown_03001AAC
_0200C5D0: .4byte gUnknown_03001AAD
_0200C5D4: .4byte gUnknown_03001AAE
_0200C5D8: .4byte gUnknown_03001AAF

	thumb_func_start sub_0200c5dc
sub_0200c5dc: @ 0x0200c5dc
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0
	str r0, [sp, #0xc]
_0200C5EC:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0200C624 @ =gUnknown_03001A88
	adds r7, r0, r1
	ldr r6, [sp, #0xc]
	adds r6, #5
	ldrb r1, [r7, #1]
	adds r0, r1, #1
	strb r0, [r7, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sl, r1
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldr r2, [sp, #0xc]
	adds r2, #1
	mov r8, r2
	cmp r0, #9
	bls _0200C618
	b _0200CCA6
_0200C618:
	lsls r0, r0, #2
	ldr r1, _0200C628 @ =_0200C62C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200C624: .4byte gUnknown_03001A88
_0200C628: .4byte _0200C62C
_0200C62C: @ jump table
	.4byte _0200CCA6 @ case 0
	.4byte _0200C654 @ case 1
	.4byte _0200C84E @ case 2
	.4byte _0200C862 @ case 3
	.4byte _0200C920 @ case 4
	.4byte _0200C9BC @ case 5
	.4byte _0200CA18 @ case 6
	.4byte _0200CA9A @ case 7
	.4byte _0200CB60 @ case 8
	.4byte _0200CCA6 @ case 9
_0200C654:
	ldrh r2, [r7, #6]
	subs r2, #4
	strh r2, [r7, #6]
	lsls r0, r6, #3
	movs r6, #0xe0
	lsls r6, r6, #0x13
	adds r3, r0, r6
	ldrh r0, [r3]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	orrs r1, r2
	strh r1, [r3]
	movs r0, #6
	ldrsh r1, [r7, r0]
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0200C6B2
	movs r2, #7
	strb r2, [r7]
	ldr r1, _0200C698 @ =gUnknown_03001AAC
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0200C69C
	strb r2, [r7]
	b _0200C6AC
	.align 2, 0
_0200C698: .4byte gUnknown_03001AAC
_0200C69C:
	movs r0, #9
	strb r0, [r7]
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
_0200C6AC:
	movs r0, #0
	strb r0, [r7, #1]
	b _0200C8A6
_0200C6B2:
	ldr r6, [sp, #0xc]
	lsls r0, r6, #6
	adds r0, #0xc
	mov sb, r0
	movs r1, #6
	ldrsh r0, [r7, r1]
	str r0, [sp, #0x10]
	movs r0, #2
	ldrsb r0, [r7, r0]
	adds r0, #2
	mov sl, r0
	movs r3, #0
	ldr r2, _0200C734 @ =gUnknown_03001A08
	mov ip, r2
	adds r6, #1
	mov r8, r6
_0200C6D2:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	mov r6, ip
	adds r5, r0, r6
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0200C6E6
	b _0200C844
_0200C6E6:
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0200C6F0
	b _0200C844
_0200C6F0:
	movs r2, #8
	ldrsh r0, [r5, r2]
	ldr r6, [sp, #0x10]
	subs r4, r0, r6
	adds r1, r4, #0
	adds r1, #0x19
	cmp r1, #0x2e
	bls _0200C702
	b _0200C844
_0200C702:
	ldr r0, _0200C738 @ =gUnknown_02015EA4
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #6
	ldrsh r0, [r5, r2]
	mov r6, sb
	subs r2, r0, r6
	cmn r2, r1
	bge _0200C718
	b _0200C844
_0200C718:
	cmp r2, r1
	blt _0200C71E
	b _0200C844
_0200C71E:
	movs r0, #2
	ldrsb r0, [r5, r0]
	mov r1, sl
	subs r0, r1, r0
	cmp r0, #4
	bhi _0200C754
	lsls r0, r0, #2
	ldr r1, _0200C73C @ =_0200C740
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200C734: .4byte gUnknown_03001A08
_0200C738: .4byte gUnknown_02015EA4
_0200C73C: .4byte _0200C740
_0200C740: @ jump table
	.4byte _0200C754 @ case 0
	.4byte _0200C7B8 @ case 1
	.4byte _0200C820 @ case 2
	.4byte _0200C754 @ case 3
	.4byte _0200C7B8 @ case 4
_0200C754:
	movs r0, #5
	strb r0, [r7]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	eors r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #7
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0200a164
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0200C788
	ldr r3, _0200C7B4 @ =0x000007FF
	adds r0, r0, r3
_0200C788:
	asrs r0, r0, #0xb
	strb r0, [r7, #8]
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r4, r1
	adds r1, r6, #0
	bl sub_0200a164
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0200C7A4
	ldr r2, _0200C7B4 @ =0x000007FF
	adds r0, r0, r2
_0200C7A4:
	asrs r0, r0, #0xb
	strb r0, [r7, #9]
	mov r3, sb
	strh r3, [r7, #4]
	movs r0, #0xd
	bl m4aSongNumStart
	b _0200C836
	.align 2, 0
_0200C7B4: .4byte 0x000007FF
_0200C7B8:
	movs r0, #2
	strb r0, [r7]
	strb r0, [r5]
	ldr r1, _0200C818 @ =gUnknown_03001A83
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #7
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0200a164
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0200C7EE
	ldr r1, _0200C81C @ =0x000007FF
	adds r0, r0, r1
_0200C7EE:
	asrs r0, r0, #0xb
	strb r0, [r5, #0xa]
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r4, r2
	adds r1, r6, #0
	bl sub_0200a164
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0200C80A
	ldr r3, _0200C81C @ =0x000007FF
	adds r0, r0, r3
_0200C80A:
	asrs r0, r0, #0xb
	strb r0, [r5, #0xb]
	movs r0, #0xc       @ SE_CONFIRM
	bl m4aSongNumStart
	b _0200C836
	.align 2, 0
_0200C818: .4byte gUnknown_03001A83
_0200C81C: .4byte 0x000007FF
_0200C820:
	movs r0, #2
	strb r0, [r7]
	movs r0, #3
	strb r0, [r5]
	ldr r1, _0200C840 @ =gUnknown_03001A83
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #0x14      @ SE_SNORE
	bl m4aSongNumStart
_0200C836:
	movs r0, #0
	strb r0, [r7, #1]
	strb r0, [r5, #1]
	b _0200CCA6
	.align 2, 0
_0200C840: .4byte gUnknown_03001A83
_0200C844:
	adds r3, #1
	cmp r3, #9
	bgt _0200C84C
	b _0200C6D2
_0200C84C:
	b _0200CCA6
_0200C84E:
	ldr r6, [sp, #0xc]
	adds r6, #1
	mov r8, r6
	mov r0, sl
	cmp r0, #0x1e
	beq _0200C85C
	b _0200CCA6
_0200C85C:
	movs r1, #0
	movs r0, #3
	b _0200CB40
_0200C862:
	mov r1, sl
	cmp r1, #9
	bgt _0200C8BC
	cmp r1, #0
	bne _0200C888
	lsls r2, r6, #3
	movs r3, #0xe0
	lsls r3, r3, #0x13
	adds r2, r2, r3
	ldr r0, [r2]
	ldr r1, _0200C8B0 @ =0xC1FFFCFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	ldr r6, [sp, #0xc]
	lsls r1, r6, #0x19
	orrs r0, r1
	str r0, [r2]
_0200C888:
	ldr r0, [sp, #0xc]
	lsls r4, r0, #5
	ldr r1, _0200C8B4 @ =0x07000006
	adds r4, r4, r1
	ldr r5, _0200C8B8 @ =gUnknown_02015AFC
	mov r2, sl
	lsls r0, r2, #7
	adds r0, #0xa
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r4]
_0200C8A6:
	ldr r3, [sp, #0xc]
	adds r3, #1
	mov r8, r3
	b _0200CCA6
	.align 2, 0
_0200C8B0: .4byte 0xC1FFFCFF
_0200C8B4: .4byte 0x07000006
_0200C8B8: .4byte gUnknown_02015AFC
_0200C8BC:
	mov r0, sl
	cmp r0, #0x13
	bgt _0200C910
	cmp r0, #0xa
	bne _0200C8DC
	lsls r2, r6, #3
	ldr r1, _0200C900 @ =0x07000004
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	ldr r3, _0200C904 @ =0x000030AF
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0200C8DC:
	ldr r6, [sp, #0xc]
	lsls r4, r6, #5
	ldr r0, _0200C908 @ =0x07000006
	adds r4, r4, r0
	ldr r5, _0200C90C @ =gUnknown_02015AFC
	movs r0, #0x13
	mov r1, sl
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r0, #0xa
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r4]
	b _0200CB84
	.align 2, 0
_0200C900: .4byte 0x07000004
_0200C904: .4byte 0x000030AF
_0200C908: .4byte 0x07000006
_0200C90C: .4byte gUnknown_02015AFC
_0200C910:
	movs r1, #0
	movs r0, #4
	strb r0, [r7]
	strb r1, [r7, #1]
	ldr r2, [sp, #0xc]
	adds r2, #1
	mov r8, r2
	b _0200CCA6
_0200C920:
	ldr r3, [sp, #0xc]
	lsls r4, r3, #6
	movs r1, #6
	ldrsh r0, [r7, r1]
	mov sb, r0
	mov r2, sl
	lsls r0, r2, #7
	movs r3, #0x14
	mov r8, r3
	movs r1, #0x14
	bl __divsi3
	movs r1, #0x80
	lsls r1, r1, #1
	subs r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	ldr r1, [sp, #0xc]
	lsls r2, r1, #5
	ldr r3, _0200C9B0 @ =0x07000006
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _0200C9B4 @ =0x0700001E
	adds r2, r2, r1
	strh r0, [r2]
	lsls r6, r6, #3
	movs r2, #0xe0
	lsls r2, r2, #0x13
	adds r6, r6, r2
	ldr r5, [r6]
	ldr r0, _0200C9B8 @ =0xFE00FF00
	ands r5, r0
	subs r4, #0xab
	mov r3, r8
	mov r0, sl
	subs r3, r3, r0
	mov r8, r3
	mov r0, r8
	muls r0, r4, r0
	movs r1, #0x14
	bl __divsi3
	adds r4, r0, #0
	adds r4, #0xb7
	lsls r4, r4, #0x10
	movs r1, #0x79
	rsbs r1, r1, #0
	add sb, r1
	mov r2, r8
	mov r0, sb
	muls r0, r2, r0
	movs r1, #0x14
	bl __divsi3
	adds r0, #0x79
	movs r1, #0xff
	ands r0, r1
	orrs r4, r0
	orrs r5, r4
	str r5, [r6]
	ldr r3, [sp, #0xc]
	adds r3, #1
	mov r8, r3
	mov r6, sl
	cmp r6, #0x14
	beq _0200C9AA
	b _0200CCA6
_0200C9AA:
	movs r1, #0
	movs r0, #7
	b _0200CB40
	.align 2, 0
_0200C9B0: .4byte 0x07000006
_0200C9B4: .4byte 0x0700001E
_0200C9B8: .4byte 0xFE00FF00
_0200C9BC:
	movs r0, #4
	ldrsh r5, [r7, r0]
	movs r1, #6
	ldrsh r4, [r7, r1]
	adds r1, r5, #0
	adds r1, #0x20
	ldr r0, _0200CA0C @ =0x0000010F
	cmp r1, r0
	bhi _0200CA4E
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r4, r0
	blt _0200CA4E
	cmp r4, #0x9f
	bgt _0200CA4E
	movs r0, #8
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	strh r5, [r7, #4]
	movs r0, #9
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	strh r4, [r7, #6]
	lsls r3, r6, #3
	movs r2, #0xe0
	lsls r2, r2, #0x13
	adds r3, r3, r2
	ldr r2, [r3]
	ldr r0, _0200CA10 @ =0xFE00FF00
	ands r2, r0
	ldr r0, _0200CA14 @ =0x000001FF
	ands r5, r0
	lsls r1, r5, #0x10
	movs r0, #0xff
	ands r4, r0
	orrs r1, r4
	orrs r2, r1
	str r2, [r3]
	b _0200CA4E
	.align 2, 0
_0200CA0C: .4byte 0x0000010F
_0200CA10: .4byte 0xFE00FF00
_0200CA14: .4byte 0x000001FF
_0200CA18:
	movs r0, #7
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	beq _0200CA28
	cmp r0, #3
	beq _0200CA3E
	b _0200CA4E
_0200CA28:
	lsls r0, r6, #3
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0200CA4E
_0200CA3E:
	lsls r0, r6, #3
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _0200CA74 @ =0xC1FFFCFF
	ands r1, r2
	str r1, [r0]
_0200CA4E:
	ldr r2, [sp, #0xc]
	adds r2, #1
	mov r8, r2
	mov r3, sl
	cmp r3, #0x1e
	beq _0200CA5C
	b _0200CCA6
_0200CA5C:
	ldr r1, _0200CA78 @ =gUnknown_03001AAC
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0200CA7C
	movs r0, #7
	strb r0, [r7]
	b _0200CA94
	.align 2, 0
_0200CA74: .4byte 0xC1FFFCFF
_0200CA78: .4byte gUnknown_03001AAC
_0200CA7C:
	movs r0, #9
	strb r0, [r7]
	lsls r2, r6, #3
	movs r6, #0xe0
	lsls r6, r6, #0x13
	adds r2, r2, r6
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0200CA94:
	movs r0, #0
	strb r0, [r7, #1]
	b _0200CB82
_0200CA9A:
	lsls r6, r6, #3
	mov r0, sl
	cmp r0, #0
	bne _0200CAD0
	ldr r1, _0200CB48 @ =0x07000004
	adds r2, r6, r1
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	ldr r3, _0200CB4C @ =0x000030AF
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	adds r2, r6, r0
	ldr r0, [r2]
	ldr r1, _0200CB50 @ =0xC1FFFCFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	ldr r3, [sp, #0xc]
	lsls r1, r3, #0x19
	orrs r0, r1
	str r0, [r2]
_0200CAD0:
	ldr r0, [sp, #0xc]
	lsls r4, r0, #6
	mov r1, sl
	lsls r0, r1, #7
	movs r1, #0x14
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x80
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	ldr r3, [sp, #0xc]
	lsls r2, r3, #5
	ldr r3, _0200CB54 @ =0x07000006
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _0200CB58 @ =0x0700001E
	adds r2, r2, r1
	strh r0, [r2]
	movs r2, #0xe0
	lsls r2, r2, #0x13
	adds r6, r6, r2
	ldr r5, [r6]
	ldr r0, _0200CB5C @ =0xFE00FF00
	ands r5, r0
	subs r4, #0xab
	mov r0, sl
	muls r0, r4, r0
	movs r1, #0x14
	bl __divsi3
	adds r4, r0, #0
	adds r4, #0xb7
	lsls r4, r4, #0x10
	mov r3, sl
	lsls r0, r3, #2
	add r0, sl
	rsbs r0, r0, #0
	movs r1, #0x14
	bl __divsi3
	adds r0, #0x79
	orrs r4, r0
	orrs r5, r4
	str r5, [r6]
	ldr r6, [sp, #0xc]
	adds r6, #1
	mov r8, r6
	mov r0, sl
	cmp r0, #0x14
	beq _0200CB3C
	b _0200CCA6
_0200CB3C:
	movs r1, #0
	movs r0, #8
_0200CB40:
	strb r0, [r7]
	strb r1, [r7, #1]
	b _0200CCA6
	.align 2, 0
_0200CB48: .4byte 0x07000004
_0200CB4C: .4byte 0x000030AF
_0200CB50: .4byte 0xC1FFFCFF
_0200CB54: .4byte 0x07000006
_0200CB58: .4byte 0x0700001E
_0200CB5C: .4byte 0xFE00FF00
_0200CB60:
	mov r1, sl
	cmp r1, #9
	bgt _0200CB94
	ldr r2, [sp, #0xc]
	lsls r4, r2, #5
	ldr r3, _0200CB8C @ =0x07000006
	adds r4, r4, r3
	ldr r5, _0200CB90 @ =gUnknown_02015AFC
	lsls r0, r1, #7
	adds r0, #0xa
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r4]
_0200CB82:
	ldr r6, [sp, #0xc]
_0200CB84:
	adds r6, #1
	mov r8, r6
	b _0200CCA6
	.align 2, 0
_0200CB8C: .4byte 0x07000006
_0200CB90: .4byte gUnknown_02015AFC
_0200CB94:
	mov r0, sl
	cmp r0, #0x13
	bgt _0200CC88
	ldr r1, [sp, #0xc]
	lsls r1, r1, #5
	mov sb, r1
	ldr r2, [sp, #0xc]
	adds r2, #1
	mov r8, r2
	cmp r0, #0xa
	bne _0200CC46
	bl sub_02001534
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0200CC68 @ =0x00002AAB
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	bl sub_02001534
	lsls r0, r0, #0x10
	ldr r1, _0200CC6C @ =0x1FFF0000
	lsls r6, r6, #3
	cmp r0, r1
	bgt _0200CC26
	movs r5, #0
	movs r2, #0
	ldr r1, _0200CC70 @ =gUnknown_03001A08
_0200CBD0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0200CBE0
	mov r3, sp
	adds r0, r3, r5
	strb r2, [r0]
	adds r5, #1
_0200CBE0:
	adds r1, #0xc
	adds r2, #1
	cmp r2, #9
	ble _0200CBD0
	cmp r5, #0
	ble _0200CC26
	bl sub_02001534
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _0200CC74 @ =0x00007FFE
	adds r0, r5, r1
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsi3
	add r0, sp
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, _0200CC70 @ =gUnknown_03001A08
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r0, #2
	cmp r4, #2
	ble _0200CC26
	subs r4, r0, #1
_0200CC26:
	strb r4, [r7, #2]
	ldr r2, _0200CC78 @ =0x07000004
	adds r3, r6, r2
	ldrh r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #4
	ands r2, r0
	ldr r1, _0200CC7C @ =gUnknown_02015ED4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0xc
	ldrb r0, [r0, #1]
	orrs r0, r1
	orrs r2, r0
	strh r2, [r3]
_0200CC46:
	ldr r5, _0200CC80 @ =0x07000006
	add r5, sb
	ldr r4, _0200CC84 @ =gUnknown_02015AFC
	movs r0, #0x13
	mov r3, sl
	subs r0, r0, r3
	lsls r0, r0, #7
	adds r0, #0xa
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r5]
	b _0200CCA6
	.align 2, 0
_0200CC68: .4byte 0x00002AAB
_0200CC6C: .4byte 0x1FFF0000
_0200CC70: .4byte gUnknown_03001A08
_0200CC74: .4byte 0x00007FFE
_0200CC78: .4byte 0x07000004
_0200CC7C: .4byte gUnknown_02015ED4
_0200CC80: .4byte 0x07000006
_0200CC84: .4byte gUnknown_02015AFC
_0200CC88:
	movs r0, #0
	strb r0, [r7]
	movs r0, #0x74
	strh r0, [r7, #6]
	lsls r2, r6, #3
	movs r6, #0xe0
	lsls r6, r6, #0x13
	adds r2, r2, r6
	ldr r0, [r2]
	ldr r1, _0200CCC0 @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	ldr r0, [sp, #0xc]
	adds r0, #1
	mov r8, r0
_0200CCA6:
	mov r1, r8
	str r1, [sp, #0xc]
	cmp r1, #2
	bgt _0200CCB0
	b _0200C5EC
_0200CCB0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200CCC0: .4byte 0xC1FFFCFF

	thumb_func_start sub_0200ccc4
sub_0200ccc4: @ 0x0200ccc4
	push {r4, r5, r6, r7, lr}
	ldr r2, _0200CD0C @ =gUnknown_030043F0
	ldrh r3, [r2, #4]
	ldr r1, _0200CD10 @ =gUnknown_03001AB0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #0x20
	ands r0, r3
	adds r7, r2, #0
	cmp r0, #0
	beq _0200CCE0
	cmp r5, #0
	ble _0200CCE0
	subs r5, #1
_0200CCE0:
	movs r0, #0x10
	ands r3, r0
	cmp r3, #0
	beq _0200CCEE
	cmp r5, #1
	bgt _0200CCEE
	adds r5, #1
_0200CCEE:
	strb r5, [r1]
	ldr r1, _0200CD14 @ =gUnknown_03001AB1
	ldrb r3, [r1]
	lsls r0, r5, #6
	adds r4, r0, #0
	adds r4, #0xc
	subs r2, r3, r4
	adds r6, r1, #0
	cmp r2, #0
	beq _0200CD34
	adds r0, r2, #2
	cmp r0, #4
	bhi _0200CD18
	adds r3, r4, #0
	b _0200CD34
	.align 2, 0
_0200CD0C: .4byte gUnknown_030043F0
_0200CD10: .4byte gUnknown_03001AB0
_0200CD14: .4byte gUnknown_03001AB1
_0200CD18:
	cmp r2, #0x20
	ble _0200CD20
	subs r3, #0x10
	b _0200CD34
_0200CD20:
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r2, r0
	bge _0200CD2C
	adds r3, #0x10
	b _0200CD34
_0200CD2C:
	adds r0, r3, r4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r3, r0, #1
_0200CD34:
	strb r3, [r6]
	ldr r2, _0200CD70 @ =0x07000042
	ldrh r1, [r2]
	movs r0, #0xfe
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	ldrh r1, [r7, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0200CD6A
	ldr r0, _0200CD74 @ =gUnknown_03001A88
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0200CD6A
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x1d
	bl m4aSongNumStart
_0200CD6A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200CD70: .4byte 0x07000042
_0200CD74: .4byte gUnknown_03001A88

	thumb_func_start sub_0200cd78
sub_0200cd78: @ 0x0200cd78
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _0200CD94 @ =gUnknown_03001AB2
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0200CDBE
	bl sub_02009d28
	cmp r0, #1
	beq _0200CD98
	cmp r0, #2
	beq _0200CDB4
	b _0200D274
	.align 2, 0
_0200CD94: .4byte gUnknown_03001AB2
_0200CD98:
	movs r1, #0
	strb r1, [r4]
	ldr r0, _0200CDAC @ =gUnknown_03001AB3
	strb r1, [r0]
	ldr r1, _0200CDB0 @ =gUnknown_03001AB4
	movs r0, #5
	str r0, [r1]
	bl sub_0200a434
	b _0200D274
	.align 2, 0
_0200CDAC: .4byte gUnknown_03001AB3
_0200CDB0: .4byte gUnknown_03001AB4
_0200CDB4:
	movs r0, #0
	strb r0, [r4]
	bl m4aMPlayAllContinue
	b _0200D274
_0200CDBE:
	ldr r0, _0200CDD4 @ =gUnknown_03001AB4
	ldr r0, [r0]
	cmp r0, #5
	bls _0200CDC8
	b _0200D196
_0200CDC8:
	lsls r0, r0, #2
	ldr r1, _0200CDD8 @ =_0200CDDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200CDD4: .4byte gUnknown_03001AB4
_0200CDD8: .4byte _0200CDDC
_0200CDDC: @ jump table
	.4byte _0200CDF4 @ case 0
	.4byte _0200D0F0 @ case 1
	.4byte _0200D120 @ case 2
	.4byte _0200D164 @ case 3
	.4byte _0200D196 @ case 4
	.4byte _0200D174 @ case 5
_0200CDF4:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe2
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0200CE54 @ =0x0600C000
	ldr r2, _0200CE58 @ =0x01001000
	mov r0, sp
	bl CpuSet
	ldr r1, _0200CE5C @ =0x04000054
	movs r0, #0x10
	strh r0, [r1]
	subs r1, #4
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _0200CE60 @ =gUnknown_02014DB4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0200CE64 @ =gUnknown_020128A8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0200CE68 @ =gUnknown_02014EC4
	ldr r1, _0200CE6C @ =0x06001300
	bl LZ77UnCompVram
	ldr r0, _0200CE70 @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _0200CE84
	ldr r0, _0200CE74 @ =gUnknown_020134C8
	ldr r1, _0200CE78 @ =0x06000F00
	bl LZ77UnCompVram
	ldr r0, _0200CE7C @ =gUnknown_02015218
	ldr r1, _0200CE80 @ =0x060019A0
	bl LZ77UnCompVram
	b _0200CE94
	.align 2, 0
_0200CE54: .4byte 0x0600C000
_0200CE58: .4byte 0x01001000
_0200CE5C: .4byte 0x04000054
_0200CE60: .4byte gUnknown_02014DB4
_0200CE64: .4byte gUnknown_020128A8
_0200CE68: .4byte gUnknown_02014EC4
_0200CE6C: .4byte 0x06001300
_0200CE70: .4byte gUnknown_03003330
_0200CE74: .4byte gUnknown_020134C8
_0200CE78: .4byte 0x06000F00
_0200CE7C: .4byte gUnknown_02015218
_0200CE80: .4byte 0x060019A0
_0200CE84:
	ldr r0, _0200D03C @ =gUnknown_02013348
	ldr r1, _0200D040 @ =0x06000F00
	bl LZ77UnCompVram
	ldr r0, _0200D044 @ =gUnknown_0201510C
	ldr r1, _0200D048 @ =0x060019A0
	bl LZ77UnCompVram
_0200CE94:
	ldr r1, _0200D04C @ =0x0400000E
	ldr r2, _0200D050 @ =0x00001B03
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0200D054 @ =0x0400001C
	movs r5, #0
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r0, _0200D058 @ =gUnknown_02015344
	ldr r1, _0200D05C @ =0x0600D800
	bl LZ77UnCompVram
	ldr r1, _0200D060 @ =0x0400000C
	ldr r2, _0200D064 @ =0x00001A02
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0200D068 @ =0x04000018
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r1, _0200D06C @ =0x0600D0F0
	ldr r2, _0200D070 @ =0x00007005
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x3e
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x3c
	ldr r2, _0200D074 @ =0x00002001
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x42
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0200D078 @ =0x0600D270
	ldr r2, _0200D07C @ =0x000010C9
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x3e
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x3c
	ldr r2, _0200D080 @ =0x0000209C
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x42
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0200D084 @ =0x0600D430
	ldr r2, _0200D088 @ =0x000010C5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x3e
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x3c
	ldr r2, _0200D08C @ =0x00002098
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0200D090 @ =gUnknown_02015498
	ldr r1, _0200D094 @ =0x05000220
	bl LZ77UnCompVram
	ldr r0, _0200D098 @ =gUnknown_02013620
	ldr r1, _0200D09C @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _0200D0A0 @ =gUnknown_02015500
	ldr r1, _0200D0A4 @ =0x06010DE0
	bl LZ77UnCompVram
	mov r0, sp
	adds r0, #2
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r2, #0
	strh r1, [r0]
	movs r4, #0xe0
	lsls r4, r4, #0x13
	ldr r2, _0200D0A8 @ =0x01000200
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _0200D0AC @ =gUnknown_02015ACC
	adds r1, r4, #0
	bl LZ77UnCompVram
	ldr r0, _0200D0B0 @ =gUnknown_03001AB4
	movs r6, #1
	str r6, [r0]
	ldr r1, _0200D0B4 @ =gUnknown_03001ABC
	movs r0, #0
	str r0, [r1]
	ldr r0, _0200D0B8 @ =gUnknown_03001AB3
	strb r5, [r0]
	ldr r1, _0200D0BC @ =gUnknown_03001AC0
	movs r0, #7
	strb r0, [r1]
	strb r5, [r1, #3]
	ldr r1, _0200D0C0 @ =gUnknown_03001AC8
	movs r0, #0xe
	strb r0, [r1]
	strb r5, [r1, #3]
	bl sub_0200a1f0
	bl sub_0200a3d4
	ldr r1, _0200D0C4 @ =gUnknown_03001A00
	movs r0, #0x50
	strh r0, [r1]
	ldr r1, _0200D0C8 @ =gUnknown_03001A02
	movs r0, #0x3c
	strh r0, [r1]
	ldr r0, _0200D0CC @ =gUnknown_03001A04
	movs r4, #2
	strb r4, [r0]
	movs r0, #0
	bl sub_0200a304
	movs r0, #0x6c
	bl sub_0200a310
	movs r0, #0
	bl sub_020099f8
	movs r0, #0
	bl sub_02009978
	movs r0, #0x50
	movs r1, #0x2f
	bl sub_02009a70
	ldr r1, _0200D0D0 @ =gUnknown_03001A80
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _0200D0D4 @ =gUnknown_03001A81
	strb r4, [r0]
	bl sub_0200c0a8
	bl sub_0200c4f0
	ldr r0, _0200D0D8 @ =gUnknown_03001AB0
	strb r6, [r0]
	ldr r1, _0200D0DC @ =gUnknown_03001AB1
	movs r0, #0x4c
	strb r0, [r1]
	ldr r2, _0200D0E0 @ =0x07000040
	ldr r0, [r2]
	ldr r1, _0200D0E4 @ =0xFE00FF00
	ands r0, r1
	ldr r1, _0200D0E8 @ =0x004C0074
	orrs r0, r1
	ldr r1, _0200D0EC @ =0xC1FFFCFF
	ands r0, r1
	str r0, [r2]
	movs r0, #4     @ MUS_MINIGAME
	bl m4aSongNumStart
	b _0200D196
	.align 2, 0
_0200D03C: .4byte gUnknown_02013348
_0200D040: .4byte 0x06000F00
_0200D044: .4byte gUnknown_0201510C
_0200D048: .4byte 0x060019A0
_0200D04C: .4byte 0x0400000E
_0200D050: .4byte 0x00001B03
_0200D054: .4byte 0x0400001C
_0200D058: .4byte gUnknown_02015344
_0200D05C: .4byte 0x0600D800
_0200D060: .4byte 0x0400000C
_0200D064: .4byte 0x00001A02
_0200D068: .4byte 0x04000018
_0200D06C: .4byte 0x0600D0F0
_0200D070: .4byte 0x00007005
_0200D074: .4byte 0x00002001
_0200D078: .4byte 0x0600D270
_0200D07C: .4byte 0x000010C9
_0200D080: .4byte 0x0000209C
_0200D084: .4byte 0x0600D430
_0200D088: .4byte 0x000010C5
_0200D08C: .4byte 0x00002098
_0200D090: .4byte gUnknown_02015498
_0200D094: .4byte 0x05000220
_0200D098: .4byte gUnknown_02013620
_0200D09C: .4byte 0x06010000
_0200D0A0: .4byte gUnknown_02015500
_0200D0A4: .4byte 0x06010DE0
_0200D0A8: .4byte 0x01000200
_0200D0AC: .4byte gUnknown_02015ACC
_0200D0B0: .4byte gUnknown_03001AB4
_0200D0B4: .4byte gUnknown_03001ABC
_0200D0B8: .4byte gUnknown_03001AB3
_0200D0BC: .4byte gUnknown_03001AC0
_0200D0C0: .4byte gUnknown_03001AC8
_0200D0C4: .4byte gUnknown_03001A00
_0200D0C8: .4byte gUnknown_03001A02
_0200D0CC: .4byte gUnknown_03001A04
_0200D0D0: .4byte gUnknown_03001A80
_0200D0D4: .4byte gUnknown_03001A81
_0200D0D8: .4byte gUnknown_03001AB0
_0200D0DC: .4byte gUnknown_03001AB1
_0200D0E0: .4byte 0x07000040
_0200D0E4: .4byte 0xFE00FF00
_0200D0E8: .4byte 0x004C0074
_0200D0EC: .4byte 0xC1FFFCFF
_0200D0F0:
	bl sub_02009df4
	cmp r0, #0
	beq _0200D196
	ldr r1, _0200D110 @ =gUnknown_03001AB3
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0200D114 @ =gUnknown_03001AB4
	movs r0, #2
	str r0, [r1]
	ldr r0, _0200D118 @ =gUnknown_03001AB8
	movs r1, #0
	str r1, [r0]
	ldr r0, _0200D11C @ =gUnknown_03001ABC
	str r1, [r0]
	b _0200D196
	.align 2, 0
_0200D110: .4byte gUnknown_03001AB3
_0200D114: .4byte gUnknown_03001AB4
_0200D118: .4byte gUnknown_03001AB8
_0200D11C: .4byte gUnknown_03001ABC
_0200D120:
	bl sub_0200be3c
	bl sub_0200c20c
	bl sub_0200c5dc
	bl sub_0200ccc4
	ldr r0, _0200D158 @ =gUnknown_03001AAC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0200D150
	bl sub_0200c030
	cmp r0, #0
	beq _0200D196
	ldr r0, _0200D15C @ =gUnknown_03001A83
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0200D196
_0200D150:
	ldr r1, _0200D160 @ =gUnknown_03001AB4
	movs r0, #3
	b _0200D194
	.align 2, 0
_0200D158: .4byte gUnknown_03001AAC
_0200D15C: .4byte gUnknown_03001A83
_0200D160: .4byte gUnknown_03001AB4
_0200D164:
	bl sub_0200a3ec
	ldr r1, _0200D204 @ =gUnknown_03001AB4
	movs r0, #5
	str r0, [r1]
	ldr r1, _0200D208 @ =gUnknown_03001AB3
	movs r0, #0
	strb r0, [r1]
_0200D174:
	bl sub_0200c20c
	bl sub_02009df4
	cmp r0, #0
	beq _0200D196
	bl sub_0200a2dc
	ldr r1, _0200D20C @ =gUnknown_03001AB2
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200D204 @ =gUnknown_03001AB4
	movs r0, #0
	str r0, [r1]
	ldr r1, _0200D210 @ =gUnknown_03003330
	ldr r0, _0200D214 @ =sub_02001BF8
_0200D194:
	str r0, [r1]
_0200D196:
	ldr r0, _0200D208 @ =gUnknown_03001AB3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0200D1B8
	ldr r0, _0200D218 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200D1B8
	ldr r1, _0200D20C @ =gUnknown_03001AB2
	movs r0, #1
	strb r0, [r1]
	bl sub_0200a338
_0200D1B8:
	bl sub_0200a21c
	bl sub_0200c474
	ldr r3, _0200D21C @ =gUnknown_03001A07
	ldr r0, _0200D220 @ =gUnknown_03001A05
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldrb r2, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _0200D1E0
	strb r2, [r3]
	cmp r0, #2
	bgt _0200D1E0
	movs r0, #0x1f      @ SE_SPEECH_BUBBLE
	bl m4aSongNumStart
_0200D1E0:
	ldr r2, _0200D224 @ =gUnknown_03001AC0
	ldr r0, _0200D220 @ =gUnknown_03001A05
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r1, #0
	bne _0200D22C
	ldr r0, _0200D228 @ =gUnknown_03001A06
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0200D22C
	movs r0, #6
	strb r0, [r2, #1]
	movs r0, #0xc
	b _0200D240
	.align 2, 0
_0200D204: .4byte gUnknown_03001AB4
_0200D208: .4byte gUnknown_03001AB3
_0200D20C: .4byte gUnknown_03001AB2
_0200D210: .4byte gUnknown_03003330
_0200D214: .4byte sub_02001BF8
_0200D218: .4byte gUnknown_030043F0
_0200D21C: .4byte gUnknown_03001A07
_0200D220: .4byte gUnknown_03001A05
_0200D224: .4byte gUnknown_03001AC0
_0200D228: .4byte gUnknown_03001A06
_0200D22C:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	bgt _0200D23C
	movs r0, #0xf
	strb r0, [r2, #1]
	movs r0, #0x1e
	b _0200D240
_0200D23C:
	movs r0, #1
	strb r0, [r2, #1]
_0200D240:
	strb r0, [r2, #2]
	adds r0, r2, #0
	bl sub_0200bfb4
	ldr r1, _0200D260 @ =gUnknown_03001AC8
	ldr r0, _0200D264 @ =gUnknown_03001AAC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0200D268
	movs r0, #6
	strb r0, [r1, #1]
	movs r0, #0xc
	b _0200D26C
	.align 2, 0
_0200D260: .4byte gUnknown_03001AC8
_0200D264: .4byte gUnknown_03001AAC
_0200D268:
	movs r0, #1
	strb r0, [r1, #1]
_0200D26C:
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl sub_0200bfb4
_0200D274:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801F100
sub_801F100: @ 0x0200d27c
	ldr r1, _0200D28C @ =gUnknown_03001AB2
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200D290 @ =gUnknown_03001AB4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0200D28C: .4byte gUnknown_03001AB2
_0200D290: .4byte gUnknown_03001AB4

	thumb_func_start sub_0200d294
sub_0200d294: @ 0x0200d294
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	ldr r0, _0200D404 @ =gUnknown_0202EAFE
	movs r1, #0x10
	bl sub_0200163c
	ldr r5, _0200D408 @ =gUnknown_03001AD0
	ldr r0, _0200D40C @ =gUnknown_03003330
	ldrb r0, [r0, #0x10]
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	strb r0, [r5]
	ldr r2, _0200D410 @ =gUnknown_03001AE8
	ldr r1, _0200D414 @ =gUnknown_03001AD1
	ldr r0, _0200D418 @ =gUnknown_03001AD4
	movs r3, #0
	mov sb, r3
	strh r3, [r0]
	mov r0, sb
	strb r0, [r1]
	mov r1, sb
	strh r1, [r2]
	ldr r1, _0200D41C @ =gUnknown_03001AD2
	movs r0, #3
	strb r0, [r1]
	movs r3, #0
	mov r8, r3
	str r3, [sp, #4]
	ldr r1, _0200D420 @ =0x0600B800
	ldr r2, _0200D424 @ =0x01000600
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, _0200D428 @ =gUnknown_02017524
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0xa0
	bl CpuSet
	ldr r0, _0200D42C @ =gUnknown_02017664
	ldr r1, _0200D430 @ =0x06000040
	bl LZ77UnCompVram
	mov r0, r8
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _0200D434 @ =0x06001C40
	ldr r2, _0200D438 @ =0x01000040
	bl CpuFastSet
	ldr r0, _0200D43C @ =gUnknown_0202EB4A
	ldr r1, _0200D440 @ =0x0600C0B4
	movs r4, #0x80
	lsls r4, r4, #8
	str r4, [sp]
	movs r2, #3
	movs r3, #2
	bl sub_02001718
	ldr r0, _0200D444 @ =gUnknown_0202EB56
	ldr r1, _0200D448 @ =0x0600C1F8
	str r4, [sp]
	movs r2, #1
	movs r3, #2
	bl sub_02001718
	ldr r6, _0200D44C @ =gUnknown_0202E806
	ldr r7, _0200D450 @ =0x0600C830
	adds r4, #0x9c
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #6
	movs r3, #0x14
	bl sub_02001718
	ldr r0, _0200D454 @ =gUnknown_0202E90E
	ldr r1, _0200D458 @ =0x0600C9B2
	ldr r2, _0200D45C @ =0x000090DA
	str r2, [sp]
	movs r2, #2
	movs r3, #4
	bl sub_02001718
	ldrb r0, [r5]
	cmp r0, #0
	beq _0200D358
	adds r0, r6, #0
	adds r0, #0xf0
	str r4, [sp]
	adds r1, r7, #0
	movs r2, #6
	movs r3, #2
	bl sub_02001718
_0200D358:
	ldr r0, _0200D460 @ =gUnknown_020188D8
	ldr r1, _0200D464 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _0200D468 @ =gUnknown_02018624
	ldr r4, _0200D46C @ =0x0203F800
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0200D470 @ =0x0600D000
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0x18
	movs r3, #0x28
	bl sub_02001718
	mov r1, r8
	str r1, [sp, #0xc]
	add r0, sp, #0xc
	ldr r2, _0200D474 @ =0x01000030
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _0200D478 @ =gUnknown_02015EE0
	ldr r1, _0200D47C @ =0x05000200
	movs r2, #0x70
	bl CpuSet
	ldr r0, _0200D480 @ =gUnknown_02015FC0
	ldr r1, _0200D484 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _0200D488 @ =gUnknown_020199D0
	ldr r1, _0200D48C @ =0x06017EE0
	bl LZ77UnCompVram
	bl sub_02000db0
	ldr r0, _0200D490 @ =gUnknown_03001B0A
	mov r3, sb
	strb r3, [r0]
	movs r2, #0
	ldr r6, _0200D494 @ =gUnknown_03001AF0
	movs r7, #0xd
	adds r4, r0, #0
	movs r5, #1
_0200D3B8:
	movs r1, #0
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	adds r3, r0, #0
	muls r3, r7, r3
_0200D3C2:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r3
	adds r1, r1, r6
	strb r5, [r1]
	ldrb r1, [r4]
	adds r1, #1
	strb r1, [r4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0200D3C2
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r2, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0200D3B8
	movs r0, #4     @ MUS_MINIGAME
	bl m4aSongNumStartOrChange
	bl sub_0200d538
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200D404: .4byte gUnknown_0202EAFE
_0200D408: .4byte gUnknown_03001AD0
_0200D40C: .4byte gUnknown_03003330
_0200D410: .4byte gUnknown_03001AE8
_0200D414: .4byte gUnknown_03001AD1
_0200D418: .4byte gUnknown_03001AD4
_0200D41C: .4byte gUnknown_03001AD2
_0200D420: .4byte 0x0600B800
_0200D424: .4byte 0x01000600
_0200D428: .4byte gUnknown_02017524
_0200D42C: .4byte gUnknown_02017664
_0200D430: .4byte 0x06000040
_0200D434: .4byte 0x06001C40
_0200D438: .4byte 0x01000040
_0200D43C: .4byte gUnknown_0202EB4A
_0200D440: .4byte 0x0600C0B4
_0200D444: .4byte gUnknown_0202EB56
_0200D448: .4byte 0x0600C1F8
_0200D44C: .4byte gUnknown_0202E806
_0200D450: .4byte 0x0600C830
_0200D454: .4byte gUnknown_0202E90E
_0200D458: .4byte 0x0600C9B2
_0200D45C: .4byte 0x000090DA
_0200D460: .4byte gUnknown_020188D8
_0200D464: .4byte 0x06008000
_0200D468: .4byte gUnknown_02018624
_0200D46C: .4byte 0x0203F800
_0200D470: .4byte 0x0600D000
_0200D474: .4byte 0x01000030
_0200D478: .4byte gUnknown_02015EE0
_0200D47C: .4byte 0x05000200
_0200D480: .4byte gUnknown_02015FC0
_0200D484: .4byte 0x06010000
_0200D488: .4byte gUnknown_020199D0
_0200D48C: .4byte 0x06017EE0
_0200D490: .4byte gUnknown_03001B0A
_0200D494: .4byte gUnknown_03001AF0

	thumb_func_start sub_0200d498
sub_0200d498: @ 0x0200d498
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0200D524 @ =gUnknown_0202EB3E
	movs r1, #3
	bl sub_0200163c
	ldr r1, _0200D528 @ =gUnknown_03001AD1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, _0200D52C @ =gUnknown_03001B0A
	movs r0, #0
	strb r0, [r2]
	movs r3, #0
	mov r8, r1
	ldr r0, _0200D530 @ =gUnknown_03001AF0
	mov ip, r0
	ldr r1, _0200D534 @ =gUnknown_03001AE8
	mov sb, r1
	mov r6, ip
	movs r7, #0xd
	adds r4, r2, #0
	movs r5, #1
_0200D4CA:
	movs r1, #0
	lsls r3, r3, #0x10
	asrs r0, r3, #0x10
	adds r2, r0, #0
	muls r2, r7, r2
_0200D4D4:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r2
	adds r1, r1, r6
	strb r5, [r1]
	ldrb r1, [r4]
	adds r1, #1
	strb r1, [r4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0200D4D4
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0200D4CA
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #2
	bls _0200D50C
	movs r0, #2
	mov r1, ip
	strb r0, [r1, #6]
_0200D50C:
	movs r0, #0
	mov r1, sb
	strh r0, [r1]
	bl sub_0200d538
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200D524: .4byte gUnknown_0202EB3E
_0200D528: .4byte gUnknown_03001AD1
_0200D52C: .4byte gUnknown_03001B0A
_0200D530: .4byte gUnknown_03001AF0
_0200D534: .4byte gUnknown_03001AE8

	thumb_func_start sub_0200d538
sub_0200d538: @ 0x0200d538
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	str r7, [sp]
	ldr r1, _0200D618 @ =0x0600B800
	ldr r2, _0200D61C @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0200D620 @ =gUnknown_03001AD2
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0200D55A
	movs r1, #9
_0200D55A:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, _0200D624 @ =gUnknown_0202E91E
	adds r0, r0, r1
	ldr r1, _0200D628 @ =0x06001C50
	movs r2, #0x18
	bl CpuSet
	bl sub_02000c90
	ldr r6, _0200D62C @ =gUnknown_03001AD1
	ldrb r0, [r6]
	cmp r0, #1
	bls _0200D5A0
	ldr r4, _0200D630 @ =sub_0200f4c0
	ldr r5, _0200D634 @ =gUnknown_03004400
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	strb r7, [r1, #0x1c]
	ldrb r0, [r6]
	cmp r0, #2
	bls _0200D5A0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r0, #1
	strb r0, [r1, #0x1c]
_0200D5A0:
	ldr r0, _0200D638 @ =sub_0200f048
	ldr r4, _0200D634 @ =gUnknown_03004400
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _0200D63C @ =sub_0200ebb0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r1, _0200D640 @ =gUnknown_03001AD8
	str r0, [r1]
	ldr r0, _0200D644 @ =sub_0200deec
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _0200D648 @ =sub_0200DC6C
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r1, _0200D64C @ =gUnknown_03001ADC
	str r0, [r1]
	ldr r0, _0200D650 @ =sub_0200d664
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r0, #4
	strb r0, [r1, #0x1a]
	ldr r0, _0200D654 @ =sub_0200F6D0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	ldr r0, _0200D658 @ =Player_Crouch
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r1, r0, #0
	movs r0, #0x10
	strb r0, [r1, #0x1a]
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl sub_0200167c
	ldr r1, _0200D65C @ =gUnknown_03003330
	movs r0, #1
	strb r0, [r1, #0xf]
	ldr r0, _0200D660 @ =sub_0200f5aC
	str r0, [r1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200D618: .4byte 0x0600B800
_0200D61C: .4byte 0x01000200
_0200D620: .4byte gUnknown_03001AD2
_0200D624: .4byte gUnknown_0202E91E
_0200D628: .4byte 0x06001C50
_0200D62C: .4byte gUnknown_03001AD1
_0200D630: .4byte sub_0200f4c0
_0200D634: .4byte gUnknown_03004400
_0200D638: .4byte sub_0200f048
_0200D63C: .4byte sub_0200ebb0
_0200D640: .4byte gUnknown_03001AD8
_0200D644: .4byte sub_0200deec
_0200D648: .4byte sub_0200DC6C
_0200D64C: .4byte gUnknown_03001ADC
_0200D650: .4byte sub_0200d664
_0200D654: .4byte sub_0200F6D0
_0200D658: .4byte Player_Crouch
_0200D65C: .4byte gUnknown_03003330
_0200D660: .4byte sub_0200f5aC

	thumb_func_start sub_0200d664
sub_0200d664: @ 0x0200d664
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _0200D6BC @ =gUnknown_03003330
	ldrb r1, [r4, #0xf]
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0200D678
	b _0200D7E2
_0200D678:
	ldrb r0, [r6, #0x1a]
	cmp r0, #0
	beq _0200D682
	subs r0, #1
	strb r0, [r6, #0x1a]
_0200D682:
	ldrb r3, [r4, #0xf]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0200D6C4
	ldr r0, _0200D6C0 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0200D69A
	b _0200D7E2
_0200D69A:
	ldrb r0, [r6, #0x1a]
	cmp r0, #0
	beq _0200D6A2
	b _0200D7E2
_0200D6A2:
	strb r0, [r6, #0x19]
	movs r0, #4
	strb r0, [r6, #0x1a]
	movs r0, #0x80
	orrs r0, r3
	strb r0, [r4, #0xf]
	bl m4aMPlayAllStop
	movs r0, #0xe       @ SE_MSGBOX
	bl m4aSongNumStart
	b _0200D7E2
	.align 2, 0
_0200D6BC: .4byte gUnknown_03003330
_0200D6C0: .4byte gUnknown_030043F0
_0200D6C4:
	ldr r2, _0200D6F4 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0200D748
	ldrb r0, [r6, #0x1a]
	cmp r0, #0
	bne _0200D748
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0200D6F8
	movs r5, #0xd       @ SE_13
	movs r0, #0x7f
	ands r0, r3
	strb r0, [r4, #0xf]
	bl m4aMPlayAllContinue
	b _0200D714
	.align 2, 0
_0200D6F4: .4byte gUnknown_030043F0
_0200D6F8:
	movs r5, #0xc       @ SE_CONFIRM
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _0200D70A
	movs r0, #2
	orrs r0, r3
	strb r0, [r4, #0xf]
	str r1, [r4, #4]
	b _0200D714
_0200D70A:
	movs r0, #0x7f
	ands r0, r3
	strb r0, [r4, #0xf]
	bl m4aMPlayAllContinue
_0200D714:
	movs r4, #0
	movs r0, #4
	strb r0, [r6, #0x1a]
	adds r0, r5, #0
	bl m4aSongNumStart
	ldr r1, _0200D73C @ =0x0600B800
	str r4, [sp]
	movs r0, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_020017b0
	ldr r2, _0200D740 @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	ldr r0, _0200D744 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #4]
	b _0200D7E2
	.align 2, 0
_0200D73C: .4byte 0x0600B800
_0200D740: .4byte gUnknown_030043F0
_0200D744: .4byte 0x0000FFFE
_0200D748:
	ldrh r1, [r2, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200D764
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _0200D764
	movs r0, #0
	strb r0, [r6, #0x19]
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
	b _0200D77E
_0200D764:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200D77E
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	bne _0200D77E
	movs r0, #1
	strb r0, [r6, #0x19]
	movs r0, #0xb       @ SE_MSGBOX_SELECT
	bl m4aSongNumStart
_0200D77E:
	ldr r5, _0200D7EC @ =gUnknown_03001AD0
	ldrb r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	ldrb r1, [r6, #0x19]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	ldr r3, _0200D7F0 @ =gUnknown_0202E6A0
	adds r2, r2, r3
	adds r0, r0, r2
	lsls r1, r1, #7
	ldr r2, _0200D7F4 @ =0x0600BA16
	adds r1, r1, r2
	ldr r2, _0200D7F8 @ =0x00005002
	str r2, [sp]
	movs r2, #9
	movs r3, #2
	bl sub_020017b0
	ldr r0, _0200D7FC @ =gUnknown_03003330
	ldr r0, [r0, #8]
	lsrs r0, r0, #4
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, _0200D800 @ =gUnknown_0202E730
	adds r0, r0, r1
	ldrb r1, [r6, #0x19]
	lsls r1, r1, #7
	ldr r2, _0200D804 @ =0x0600BA12
	adds r1, r1, r2
	ldr r4, _0200D808 @ =0x00004002
	str r4, [sp]
	movs r2, #2
	movs r3, #2
	bl sub_020017b0
	ldrb r1, [r5]
	movs r0, #0x9c
	muls r0, r1, r0
	ldr r1, _0200D80C @ =gUnknown_0202E568
	adds r0, r0, r1
	ldr r1, _0200D810 @ =0x0600B9D0
	str r4, [sp]
	movs r2, #0xd
	movs r3, #6
	bl sub_020017b0
_0200D7E2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200D7EC: .4byte gUnknown_03001AD0
_0200D7F0: .4byte gUnknown_0202E6A0
_0200D7F4: .4byte 0x0600BA16
_0200D7F8: .4byte 0x00005002
_0200D7FC: .4byte gUnknown_03003330
_0200D800: .4byte gUnknown_0202E730
_0200D804: .4byte 0x0600BA12
_0200D808: .4byte 0x00004002
_0200D80C: .4byte gUnknown_0202E568
_0200D810: .4byte 0x0600B9D0

	thumb_func_start sub_0200d814
sub_0200d814: @ 0x0200d814
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r1, [r4, #7]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0200D848
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4, #7]
	ldr r0, _0200D858 @ =gUnknown_0202E740
	ldr r1, _0200D85C @ =0x0600B804
	ldr r2, _0200D860 @ =0x0000603A
	str r2, [sp]
	movs r2, #0x14
	movs r3, #3
	bl sub_020017b0
	strb r5, [r4, #0x1d]
	strh r5, [r4, #0x20]
	movs r0, #0x17      @ SE_MINIGAME_LOST
	bl m4aSongNumStart
_0200D848:
	ldrb r5, [r4, #0x1d]
	cmp r5, #1
	beq _0200D8AA
	cmp r5, #1
	bgt _0200D864
	cmp r5, #0
	beq _0200D86E
	b _0200D916
	.align 2, 0
_0200D858: .4byte gUnknown_0202E740
_0200D85C: .4byte 0x0600B804
_0200D860: .4byte 0x0000603A
_0200D864:
	cmp r5, #2
	beq _0200D8D8
	cmp r5, #3
	beq _0200D8F6
	b _0200D916
_0200D86E:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r1, #4
	bl Div
	movs r2, #0x8c
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xb7
	bgt _0200D8A0
	movs r2, #0xb8
	ldrb r0, [r4, #0x1d]
	adds r0, #1
	strb r0, [r4, #0x1d]
	strh r5, [r4, #0x20]
_0200D8A0:
	adds r1, r2, #0
	movs r0, #0x12
	bl sub_02001698
	b _0200D93E
_0200D8AA:
	ldrh r1, [r4, #0x20]
	adds r1, #0xb8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl sub_02001698
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0200D93E
	movs r0, #0x54
	movs r1, #0
	bl sub_02001698
	movs r0, #0x50
	movs r1, #0x81
	bl sub_02001698
	b _0200D90A
_0200D8D8:
	ldrh r1, [r4, #0x20]
	movs r0, #0x54
	bl sub_02001698
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0200D93E
	ldrb r0, [r4, #0x1d]
	adds r0, #1
	strb r0, [r4, #0x1d]
	b _0200D93E
_0200D8F6:
	ldrh r1, [r4, #0x20]
	movs r0, #0x54
	bl sub_02001698
	ldrh r0, [r4, #0x20]
	subs r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0200D93E
_0200D90A:
	ldrb r0, [r4, #0x1d]
	adds r0, #1
	strb r0, [r4, #0x1d]
	movs r0, #0
	strh r0, [r4, #0x20]
	b _0200D93E
_0200D916:
	ldr r0, _0200D950 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0200D930
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb3
	ble _0200D93E
_0200D930:
	ldr r1, _0200D954 @ =gUnknown_03003330
	ldrb r2, [r1, #0xf]
	movs r0, #2
	movs r3, #0
	orrs r0, r2
	strb r0, [r1, #0xf]
	str r3, [r1, #4]
_0200D93E:
	ldrb r0, [r4, #4]
	movs r1, #0x50
	bl sub_02001398
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200D950: .4byte gUnknown_030043F0
_0200D954: .4byte gUnknown_03003330

	thumb_func_start sub_0200d958
sub_0200d958: @ 0x0200d958
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0200D980 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200D984
	ldrh r0, [r4, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0200D976
	b _0200DC5E
_0200D976:
	ldrb r0, [r4, #4]
	movs r1, #0x50
	bl sub_02001398
	b _0200DC5E
	.align 2, 0
_0200D980: .4byte gUnknown_03003330
_0200D984:
	ldrb r1, [r4, #7]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	bne _0200D9B6
	ldr r0, _0200D9F0 @ =gUnknown_03001B18
	ldr r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r1, r3
	str r2, [r0]
	ldr r0, [r4, #0x20]
	adds r0, r0, r2
	str r0, [r4, #0x20]
	cmp r1, #0
	bge _0200D9B6
	cmp r2, #0
	blt _0200D9B6
	ldr r0, _0200D9F4 @ =gUnknown_03001B0B
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200D9B6
	movs r0, #0x14      @ SE_SNORE
	bl m4aSongNumStart
_0200D9B6:
	ldrb r1, [r4, #7]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0200DA04
	ldr r0, _0200D9F8 @ =gUnknown_03001AE8
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r5, r0, #0
	cmp r1, #0x9f
	bgt _0200DA3E
	adds r0, r2, #1
	strh r0, [r5]
	ldr r2, _0200D9FC @ =gUnknown_030043F0
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0200DA3E
	movs r0, #0xa0
	strh r0, [r5]
	ldr r0, _0200DA00 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #4]
	b _0200DA3E
	.align 2, 0
_0200D9F0: .4byte gUnknown_03001B18
_0200D9F4: .4byte gUnknown_03001B0B
_0200D9F8: .4byte gUnknown_03001AE8
_0200D9FC: .4byte gUnknown_030043F0
_0200DA00: .4byte 0x0000FFFE
_0200DA04:
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r0, #0x3f
	bgt _0200DA18
	ldr r0, _0200DA14 @ =gUnknown_03001AE8
	strh r1, [r0]
	adds r5, r0, #0
	b _0200DA3E
	.align 2, 0
_0200DA14: .4byte gUnknown_03001AE8
_0200DA18:
	cmp r0, #0xaf
	ble _0200DA2C
	ldr r1, _0200DA28 @ =gUnknown_03001AE8
	movs r0, #0xa0
	strh r0, [r1]
	adds r5, r1, #0
	b _0200DA3E
	.align 2, 0
_0200DA28: .4byte gUnknown_03001AE8
_0200DA2C:
	ldr r2, _0200DA64 @ =gUnknown_03001AE8
	movs r3, #0x22
	ldrsh r0, [r4, r3]
	subs r0, #0x40
	ldr r1, _0200DA68 @ =0x0000016D
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r5, r2, #0
_0200DA3E:
	ldrh r1, [r5]
	movs r0, #0x1e
	bl sub_02001698
	ldrh r1, [r4, #0x22]
	ldrh r0, [r5]
	subs r0, r1, r0
	movs r5, #0
	strh r0, [r4, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0200DA70
	ldr r1, _0200DA6C @ =gUnknown_03001AE0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	b _0200DC5E
	.align 2, 0
_0200DA64: .4byte gUnknown_03001AE8
_0200DA68: .4byte 0x0000016D
_0200DA6C: .4byte gUnknown_03001AE0
_0200DA70:
	ldrb r2, [r4, #7]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0200DA7C
	b _0200DBB8
_0200DA7C:
	lsls r1, r1, #0x10
	movs r0, #0x9f
	lsls r0, r0, #0x11
	cmp r1, r0
	bgt _0200DADA
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	ldr r2, _0200DABC @ =gUnknown_0202E4D8
	adds r0, r0, r2
	str r0, [r4, #0x10]
	movs r0, #0xa3
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
	ldr r3, _0200DAC0 @ =gUnknown_03001B1C
	ldr r0, [r4, #8]
	ldr r1, [r3]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r6, #0xa
	ldrsh r0, [r4, r6]
	cmp r0, #5
	bgt _0200DAC4
	movs r0, #6
	strh r0, [r4, #0xa]
	movs r0, #1
	strb r0, [r4, #0x1d]
	adds r0, r2, #0
	subs r0, #8
	str r0, [r4, #0x10]
	rsbs r0, r1, #0
	b _0200DC3A
	.align 2, 0
_0200DABC: .4byte gUnknown_0202E4D8
_0200DAC0: .4byte gUnknown_03001B1C
_0200DAC4:
	cmp r0, #0xb9
	bgt _0200DACA
	b _0200DC3C
_0200DACA:
	movs r0, #0xb9
	strh r0, [r4, #0xa]
	strb r5, [r4, #0x1d]
	adds r0, r2, #0
	subs r0, #0x10
	str r0, [r4, #0x10]
	rsbs r0, r1, #0
	b _0200DC3A
_0200DADA:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0200DB30
	ldr r0, _0200DB24 @ =gUnknown_0202E4E8
	str r0, [r4, #0x10]
	movs r0, #0xa9
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2d
	bne _0200DB10
	ldr r1, _0200DB28 @ =gUnknown_03001AD8
	ldr r2, [r1]
	movs r0, #0xff
	strb r0, [r2, #0x1e]
	ldr r0, [r1]
	strb r5, [r0, #0x1f]
	ldr r0, [r1]
	strb r5, [r0, #0x1c]
	ldr r1, [r1]
	ldr r0, _0200DB2C @ =sub_0200dff8
	str r0, [r1]
_0200DB10:
	ldrb r0, [r4, #0x1a]
	cmp r0, #0x2c
	bls _0200DB9A
	movs r0, #0xad
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
	movs r0, #0x2e
	strb r0, [r4, #0x1a]
	b _0200DB9A
	.align 2, 0
_0200DB24: .4byte gUnknown_0202E4E8
_0200DB28: .4byte gUnknown_03001AD8
_0200DB2C: .4byte sub_0200dff8
_0200DB30:
	ldrb r1, [r4, #0x1a]
	adds r0, r1, #0
	cmp r0, #0xf
	bhi _0200DB50
	cmp r0, #0
	bne _0200DB42
	movs r0, #0x1c
	bl m4aSongNumStart
_0200DB42:
	movs r0, #0xa5
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	b _0200DB9A
_0200DB50:
	movs r0, #0xa7
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
	adds r0, r1, #1
	movs r2, #0
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x59
	bls _0200DB9A
	ldr r1, _0200DB80 @ =gUnknown_03001AD2
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0200DB8C
	ldr r2, _0200DB84 @ =gUnknown_03003330
	ldr r0, _0200DB88 @ =sub_0200f58c
	str r0, [r2, #4]
	ldrb r0, [r2, #0xf]
	movs r1, #2
	b _0200DB96
	.align 2, 0
_0200DB80: .4byte gUnknown_03001AD2
_0200DB84: .4byte gUnknown_03003330
_0200DB88: .4byte sub_0200f58c
_0200DB8C:
	ldr r0, _0200DBAC @ =sub_0200d814
	str r0, [r4]
	ldr r2, _0200DBB0 @ =gUnknown_03003330
	ldrb r0, [r2, #0xf]
	movs r1, #0x10
_0200DB96:
	orrs r0, r1
	strb r0, [r2, #0xf]
_0200DB9A:
	movs r1, #0
	movs r0, #0x9f
	strh r0, [r4, #0xe]
	adds r0, #0xa0
	strh r0, [r4, #0x22]
	ldr r0, _0200DBB4 @ =gUnknown_03001B18
	str r1, [r0]
	b _0200DC3C
	.align 2, 0
_0200DBAC: .4byte sub_0200d814
_0200DBB0: .4byte gUnknown_03003330
_0200DBB4: .4byte gUnknown_03001B18
_0200DBB8:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0200DC3C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _0200DBDC
	strb r5, [r4, #0x1a]
	ldrb r0, [r4, #0x19]
	movs r1, #0
	cmp r0, #0
	bne _0200DBDA
	movs r1, #4
_0200DBDA:
	strb r1, [r4, #0x19]
_0200DBDC:
	ldr r0, _0200DBF0 @ =gUnknown_03001B18
	ldr r0, [r0]
	cmp r0, #0
	ble _0200DBF4
	movs r1, #0x9f
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrb r2, [r4, #0x19]
	adds r0, r0, r2
	b _0200DBFE
	.align 2, 0
_0200DBF0: .4byte gUnknown_03001B18
_0200DBF4:
	movs r3, #0x9b
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrb r6, [r4, #0x19]
	adds r0, r0, r6
_0200DBFE:
	strh r0, [r4, #0x14]
	ldr r3, _0200DC20 @ =gUnknown_03001B1C
	ldr r0, [r4, #8]
	ldr r2, [r3]
	adds r0, r0, r2
	str r0, [r4, #8]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _0200DC28
	movs r0, #6
	strh r0, [r4, #0xa]
	movs r0, #1
	strb r0, [r4, #0x1d]
	ldr r0, _0200DC24 @ =gUnknown_0202E4C8
	adds r0, #8
	b _0200DC36
	.align 2, 0
_0200DC20: .4byte gUnknown_03001B1C
_0200DC24: .4byte gUnknown_0202E4C8
_0200DC28:
	cmp r0, #0xb9
	ble _0200DC3C
	movs r1, #0
	movs r0, #0xb9
	strh r0, [r4, #0xa]
	strb r1, [r4, #0x1d]
	ldr r0, _0200DC64 @ =gUnknown_0202E4C8
_0200DC36:
	str r0, [r4, #0x10]
	rsbs r0, r2, #0
_0200DC3A:
	str r0, [r3]
_0200DC3C:
	ldr r2, _0200DC68 @ =gUnknown_03001AE0
	ldrh r0, [r4, #0xa]
	adds r1, r0, #0
	subs r1, #0xb
	strh r1, [r2]
	adds r0, #0xc
	strh r0, [r2, #2]
	ldrh r0, [r4, #0xe]
	adds r1, r0, #0
	subs r1, #0x14
	strh r1, [r2, #4]
	adds r0, #6
	strh r0, [r2, #6]
	ldrb r0, [r4, #4]
	movs r1, #0x50
	bl sub_02001398
_0200DC5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200DC64: .4byte gUnknown_0202E4C8
_0200DC68: .4byte gUnknown_03001AE0

	thumb_func_start sub_0200DC6C
sub_0200DC6C: @ 0x0200DC6C
	movs r3, #0
	movs r1, #5
	strb r1, [r0, #7]
	movs r2, #0
	movs r1, #0x7a
	strh r1, [r0, #0xa]
	movs r1, #0x89
	strh r1, [r0, #0xe]
	ldr r1, _0200DCA8 @ =gUnknown_0202E4E8
	str r1, [r0, #0x10]
	movs r1, #0xad
	lsls r1, r1, #1
	strh r1, [r0, #0x14]
	movs r1, #0xc
	strb r1, [r0, #0x18]
	strb r2, [r0, #0x1d]
	ldr r1, _0200DCAC @ =0x00000129
	strh r1, [r0, #0x22]
	ldr r2, _0200DCB0 @ =gUnknown_03001B18
	ldr r1, _0200DCB4 @ =gUnknown_03001B1C
	str r3, [r1]
	str r3, [r2]
	strh r3, [r0, #0x20]
	ldr r2, _0200DCB8 @ =gUnknown_03001AE0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r2]
	ldr r1, _0200DCBC @ =sub_0200d958
	str r1, [r0]
	bx lr
	.align 2, 0
_0200DCA8: .4byte gUnknown_0202E4E8
_0200DCAC: .4byte 0x00000129
_0200DCB0: .4byte gUnknown_03001B18
_0200DCB4: .4byte gUnknown_03001B1C
_0200DCB8: .4byte gUnknown_03001AE0
_0200DCBC: .4byte sub_0200d958

	thumb_func_start sub_0200dcc0
sub_0200dcc0: @ 0x0200dcc0
	push {lr}
	adds r3, r0, #0
	ldr r0, _0200DCE8 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200DCEC
	ldrh r0, [r3, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200DD56
	ldrb r0, [r3, #4]
	movs r1, #0x52
	bl sub_02001398
	b _0200DD56
	.align 2, 0
_0200DCE8: .4byte gUnknown_03003330
_0200DCEC:
	ldr r2, _0200DD2C @ =gUnknown_03004400
	ldrb r1, [r3, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x1f
	ldrsb r1, [r3, r1]
	ldrh r0, [r0, #0xe]
	adds r1, r1, r0
	strh r1, [r3, #0xe]
	ldrb r0, [r3, #0x1a]
	adds r0, #1
	strb r0, [r3, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _0200DD38
	movs r0, #0
	strb r0, [r3, #0x1a]
	ldrb r0, [r3, #0x19]
	adds r0, #1
	strb r0, [r3, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _0200DD30
	adds r0, r3, #0
	bl sub_02000ed4
	b _0200DD56
	.align 2, 0
_0200DD2C: .4byte gUnknown_03004400
_0200DD30:
	cmp r0, #1
	bls _0200DD38
	movs r0, #0x10
	strb r0, [r3, #0x17]
_0200DD38:
	ldr r1, _0200DD5C @ =gUnknown_0202EB5A
	ldrb r0, [r3, #0x19]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r3, #0x14]
	ldrh r0, [r3, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200DD56
	ldrb r0, [r3, #4]
	movs r1, #0x52
	bl sub_02001398
_0200DD56:
	pop {r0}
	bx r0
	.align 2, 0
_0200DD5C: .4byte gUnknown_0202EB5A

	thumb_func_start sub_0200dd60
sub_0200dd60: @ 0x0200dd60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0200DD88 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200DD8C
	ldrh r0, [r5, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0200DD7E
	b _0200DE90
_0200DD7E:
	ldrb r0, [r5, #4]
	movs r1, #0x51
	bl sub_02001398
	b _0200DE90
	.align 2, 0
_0200DD88: .4byte gUnknown_03003330
_0200DD8C:
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0200DDB8 @ =gUnknown_03004400
	adds r4, r0, r1
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	adds r0, r0, r1
	str r0, [r5, #8]
	cmp r1, #0
	bge _0200DDBC
	ldrh r2, [r5, #0xa]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0200DDCC
	adds r0, r2, #0
	adds r0, #0xd0
	b _0200DDCA
	.align 2, 0
_0200DDB8: .4byte gUnknown_03004400
_0200DDBC:
	ldrh r1, [r5, #0xa]
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0xc8
	ble _0200DDCC
	adds r0, r1, #0
	subs r0, #0xd0
_0200DDCA:
	strh r0, [r5, #0xa]
_0200DDCC:
	movs r0, #0x1f
	ldrsb r0, [r5, r0]
	ldrh r6, [r4, #0xe]
	adds r1, r0, r6
	strh r1, [r5, #0xe]
	adds r0, r1, #0
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200DE90
	ldr r3, _0200DE2C @ =gUnknown_03001AE0
	movs r0, #0xa
	ldrsh r2, [r5, r0]
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r2, r0
	blt _0200DE80
	movs r6, #2
	ldrsh r0, [r3, r6]
	cmp r2, r0
	bgt _0200DE80
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	movs r2, #4
	ldrsh r0, [r3, r2]
	cmp r1, r0
	blt _0200DE80
	movs r6, #6
	ldrsh r0, [r3, r6]
	cmp r1, r0
	bgt _0200DE80
	ldr r1, _0200DE30 @ =gUnknown_03001AF0
	ldrb r2, [r5, #0x1a]
	ldrb r3, [r5, #0x19]
	movs r0, #0xd
	muls r0, r3, r0
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #1
	bls _0200DE38
	ldr r1, _0200DE34 @ =gUnknown_03001AD4
	ldrh r0, [r1]
	adds r0, #0xa
	b _0200DE3E
	.align 2, 0
_0200DE2C: .4byte gUnknown_03001AE0
_0200DE30: .4byte gUnknown_03001AF0
_0200DE34: .4byte gUnknown_03001AD4
_0200DE38:
	ldr r1, _0200DE70 @ =gUnknown_03001AD4
	ldrh r0, [r1]
	adds r0, #1
_0200DE3E:
	strh r0, [r1]
	movs r0, #0xd
	muls r0, r3, r0
	adds r0, r2, r0
	adds r0, r0, r4
	movs r4, #0
	strb r4, [r0]
	ldr r1, _0200DE74 @ =gUnknown_03001B0A
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #0x1b
	bl m4aSongNumStart
	ldr r1, _0200DE78 @ =gUnknown_03001B0B
	movs r0, #0x1e
	strb r0, [r1]
	strb r4, [r5, #0x1a]
	strb r4, [r5, #0x19]
	ldr r1, _0200DE7C @ =sub_0200dcc0
	str r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	b _0200DE90
	.align 2, 0
_0200DE70: .4byte gUnknown_03001AD4
_0200DE74: .4byte gUnknown_03001B0A
_0200DE78: .4byte gUnknown_03001B0B
_0200DE7C: .4byte sub_0200dcc0
_0200DE80:
	ldrb r0, [r4, #0x1a]
	ldrb r1, [r5, #0x1d]
	adds r0, r0, r1
	strh r0, [r5, #0x14]
	ldrb r0, [r5, #4]
	movs r1, #0x51
	bl sub_02001398
_0200DE90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DE98
sub_0200DE98: @ 0x0200DE98
	push {lr}
	adds r2, r0, #0
	ldr r0, _0200DEE0 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0200DEDC
	ldrb r0, [r2, #0x19]
	adds r0, #1
	strb r0, [r2, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bls _0200DEC6
	strb r1, [r2, #0x19]
	ldrb r0, [r2, #0x1a]
	adds r0, #4
	movs r1, #0xc
	ands r0, r1
	strb r0, [r2, #0x1a]
_0200DEC6:
	ldr r0, _0200DEE4 @ =gUnknown_03001AE8
	ldrh r1, [r2, #0x22]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2, #0xe]
	ldr r1, _0200DEE8 @ =gUnknown_03001B0B
	ldrb r0, [r1]
	cmp r0, #0
	beq _0200DEDC
	subs r0, #1
	strb r0, [r1]
_0200DEDC:
	pop {r0}
	bx r0
	.align 2, 0
_0200DEE0: .4byte gUnknown_03003330
_0200DEE4: .4byte gUnknown_03001AE8
_0200DEE8: .4byte gUnknown_03001B0B

	thumb_func_start sub_0200deec
sub_0200deec: @ 0x0200deec
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _0200DF10 @ =gUnknown_03001AD1
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #1
	beq _0200DF1E
	cmp r2, #1
	bgt _0200DF14
	cmp r2, #0
	beq _0200DF1A
	b _0200DF26
	.align 2, 0
_0200DF10: .4byte gUnknown_03001AD1
_0200DF14:
	cmp r2, #2
	beq _0200DF22
	b _0200DF26
_0200DF1A:
	movs r0, #0xa8
	b _0200DF28
_0200DF1E:
	movs r0, #0x68
	b _0200DF28
_0200DF22:
	movs r0, #0x48
	b _0200DF28
_0200DF26:
	movs r0, #0x18
_0200DF28:
	strh r0, [r7, #0x22]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	ldrb r1, [r1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0200DF40
	ldr r1, [sp]
	rsbs r1, r1, #0
	str r1, [sp]
_0200DF40:
	movs r2, #0
	mov sl, r2
_0200DF44:
	movs r6, #0
	ldr r0, [sp]
	rsbs r0, r0, #0
	str r0, [sp, #4]
	mov r1, sl
	lsls r3, r1, #0x10
	asrs r0, r3, #0x10
	lsls r2, r0, #4
	mov sb, r2
	movs r2, #0xd
	adds r1, r0, #0
	muls r1, r2, r1
	mov r8, r1
_0200DF5E:
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	mov r1, r8
	adds r0, r5, r1
	ldr r2, _0200DFE4 @ =gUnknown_03001AF0
	adds r4, r0, r2
	ldrb r0, [r4]
	cmp r0, #0
	beq _0200DFA6
	ldr r0, _0200DFE8 @ =sub_0200dd60
	adds r1, r7, #0
	movs r2, #0
	str r3, [sp, #8]
	bl sub_02000d04
	lsls r1, r5, #4
	adds r1, #8
	strh r1, [r0, #0xa]
	ldr r1, _0200DFEC @ =gUnknown_0202E4F8
	str r1, [r0, #0x10]
	movs r1, #0xc
	strb r1, [r0, #0x18]
	mov r1, sl
	strb r1, [r0, #0x19]
	strb r6, [r0, #0x1a]
	ldrb r1, [r7, #4]
	strb r1, [r0, #0x1b]
	ldrb r1, [r4]
	subs r1, #1
	lsls r1, r1, #4
	strb r1, [r0, #0x1d]
	mov r2, sb
	strb r2, [r0, #0x1f]
	ldr r1, [sp]
	str r1, [r0, #0x20]
	ldr r3, [sp, #8]
_0200DFA6:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0200DF5E
	ldr r2, [sp, #4]
	str r2, [sp]
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r2, r0, #0x10
	mov sl, r2
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0200DF44
	ldr r1, _0200DFF0 @ =gUnknown_03001B0B
	movs r0, #0
	strb r0, [r7, #0x1a]
	strb r0, [r1]
	ldr r0, _0200DFF4 @ =sub_0200DE98
	str r0, [r7]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200DFE4: .4byte gUnknown_03001AF0
_0200DFE8: .4byte sub_0200dd60
_0200DFEC: .4byte gUnknown_0202E4F8
_0200DFF0: .4byte gUnknown_03001B0B
_0200DFF4: .4byte sub_0200DE98

	thumb_func_start sub_0200dff8
sub_0200dff8: @ 0x0200dff8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, _0200E028 @ =gUnknown_03003330
	ldrb r5, [r3, #0xf]
	movs r0, #0x80
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0200E010
	b _0200E1B4
_0200E010:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _0200E018
	b _0200E138
_0200E018:
	subs r0, #1
	cmp r0, #4
	bhi _0200E10E
	lsls r0, r0, #2
	ldr r1, _0200E02C @ =_0200E030
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200E028: .4byte gUnknown_03003330
_0200E02C: .4byte _0200E030
_0200E030: @ jump table
	.4byte _0200E044 @ case 0
	.4byte _0200E05E @ case 1
	.4byte _0200E0A0 @ case 2
	.4byte _0200E0D0 @ case 3
	.4byte _0200E0EE @ case 4
_0200E044:
	ldr r0, _0200E094 @ =gUnknown_0202E7B8
	ldr r1, _0200E098 @ =0x0600B80C
	ldr r2, _0200E09C @ =0x00007076
	str r2, [sp]
	movs r2, #0xd
	movs r3, #3
	bl sub_020017b0
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0x1c]
	strh r1, [r4, #0x20]
_0200E05E:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #4
	bl Div
	adds r0, #0x60
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x20]
	adds r1, #1
	strh r1, [r4, #0x20]
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb8
	ble _0200E08C
	movs r1, #0xb8
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	strb r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x20]
_0200E08C:
	movs r0, #0x12
	bl sub_02001698
	b _0200E1B4
	.align 2, 0
_0200E094: .4byte gUnknown_0202E7B8
_0200E098: .4byte 0x0600B80C
_0200E09C: .4byte 0x00007076
_0200E0A0:
	ldrh r1, [r4, #0x20]
	adds r1, #0xb8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl sub_02001698
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _0200E0BE
	b _0200E1B4
_0200E0BE:
	movs r0, #0x54
	movs r1, #0
	bl sub_02001698
	movs r0, #0x50
	movs r1, #0x81
	bl sub_02001698
	b _0200E102
_0200E0D0:
	ldrh r1, [r4, #0x20]
	movs r0, #0x54
	bl sub_02001698
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0200E1B4
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	strb r0, [r4, #0x1c]
	b _0200E1B4
_0200E0EE:
	ldrh r1, [r4, #0x20]
	movs r0, #0x54
	bl sub_02001698
	ldrh r0, [r4, #0x20]
	subs r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0200E1B4
_0200E102:
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	strb r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x20]
	b _0200E1B4
_0200E10E:
	ldr r0, _0200E134 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0200E128
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb3
	ble _0200E1B4
_0200E128:
	ldrb r1, [r3, #0xf]
	movs r0, #2
	orrs r0, r1
	strb r0, [r3, #0xf]
	str r2, [r3, #4]
	b _0200E1B4
	.align 2, 0
_0200E134: .4byte gUnknown_030043F0
_0200E138:
	movs r1, #0x1e
	ldrsb r1, [r4, r1]
	cmp r1, #0
	blt _0200E148
	adds r0, r4, #0
	bl sub_0200ee7c
	b _0200E1B4
_0200E148:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200E19C
	ldr r2, _0200E190 @ =gUnknown_03004400
	ldrb r1, [r4, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0
	movs r1, #0x93
	lsls r1, r1, #1
	strh r1, [r0, #0x14]
	ldr r0, _0200E194 @ =gUnknown_03001ADC
	ldr r1, [r0]
	movs r0, #0xad
	lsls r0, r0, #1
	strh r0, [r1, #0x14]
	strb r2, [r4, #0x1a]
	movs r0, #0xf8
	strb r0, [r4, #0x1e]
	ldr r0, _0200E198 @ =gUnknown_03001AD1
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200E188
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r0, [r3, #0xf]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #0xf]
_0200E188:
	movs r0, #0x23      @ SE_GAUGE_LVL_UP
	bl m4aSongNumStart
	b _0200E1B4
	.align 2, 0
_0200E190: .4byte gUnknown_03004400
_0200E194: .4byte gUnknown_03001ADC
_0200E198: .4byte gUnknown_03001AD1
_0200E19C:
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x59
	bls _0200E1B4
	ldr r0, _0200E1BC @ =sub_0200d498
	str r0, [r3, #4]
	movs r0, #2
	orrs r0, r5
	strb r0, [r3, #0xf]
_0200E1B4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200E1BC: .4byte sub_0200d498

	thumb_func_start sub_0200e1c0
sub_0200e1c0: @ 0x0200e1c0
	push {lr}
	adds r3, r0, #0
	ldr r2, _0200E22C @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200E1D6
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0200E228
_0200E1D6:
	ldr r0, _0200E230 @ =gUnknown_03001ADC
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0200E228
	ldr r0, _0200E234 @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200E228
	ldrb r0, [r3, #0x1b]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0200E238 @ =gUnknown_03004400
	adds r1, r1, r0
	ldrh r0, [r1, #0xa]
	strh r0, [r3, #0xa]
	ldrh r0, [r1, #0xe]
	ldr r2, _0200E23C @ =gUnknown_03001AE8
	subs r0, #0xa0
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r3, #0xe]
	ldr r0, [r1, #0x10]
	str r0, [r3, #0x10]
	ldrh r0, [r1, #0x14]
	strh r0, [r3, #0x14]
	ldrb r2, [r1, #0x16]
	movs r0, #4
	orrs r0, r2
	strb r0, [r3, #0x16]
	ldrb r0, [r1, #0x17]
	strb r0, [r3, #0x17]
	ldrb r0, [r1, #0x18]
	strb r0, [r3, #0x18]
	ldrb r0, [r3, #4]
	movs r1, #0
	bl sub_02001398
_0200E228:
	pop {r0}
	bx r0
	.align 2, 0
_0200E22C: .4byte gUnknown_03003330
_0200E230: .4byte gUnknown_03001ADC
_0200E234: .4byte gUnknown_03001B0A
_0200E238: .4byte gUnknown_03004400
_0200E23C: .4byte gUnknown_03001AE8

	thumb_func_start sub_0200e240
sub_0200e240: @ 0x0200e240
	push {r4, lr}
	adds r2, r0, #0
	ldrb r1, [r2, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0200E294 @ =gUnknown_03004400
	adds r3, r0, r1
	ldrh r0, [r3, #0xa]
	strh r0, [r2, #0xa]
	ldrh r4, [r3, #0xe]
	strh r4, [r2, #0xe]
	ldrb r1, [r3, #7]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0200E26A
	movs r0, #0x1f
	ldrsb r0, [r3, r0]
	subs r0, r4, r0
	strh r0, [r2, #0xe]
_0200E26A:
	ldrb r1, [r3, #7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200E27A
	ldrh r0, [r2, #0xe]
	subs r0, #5
	strh r0, [r2, #0xe]
_0200E27A:
	ldrh r0, [r3, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200E28E
	ldrb r0, [r2, #4]
	movs r1, #0x4f
	bl sub_02001398
_0200E28E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200E294: .4byte gUnknown_03004400

	thumb_func_start sub_0200e298
sub_0200e298: @ 0x0200e298
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0200E2C8 @ =gUnknown_03004400
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	ldrh r2, [r4, #0xe]
	strh r2, [r5, #0xe]
	ldrb r1, [r4, #7]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0200E2D0
	ldr r1, _0200E2CC @ =gUnknown_03001B10
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _0200E32A
	.align 2, 0
_0200E2C8: .4byte gUnknown_03004400
_0200E2CC: .4byte gUnknown_03001B10
_0200E2D0:
	movs r0, #0x1f
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r2, r2, r0
	strh r2, [r5, #0xe]
	ldrb r1, [r4, #7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200E2EC
	subs r0, r2, #5
	strh r0, [r5, #0xe]
_0200E2EC:
	movs r0, #0x1f
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _0200E304
	ldr r1, _0200E300 @ =gUnknown_03001B10
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	b _0200E318
	.align 2, 0
_0200E300: .4byte gUnknown_03001B10
_0200E304:
	ldr r2, _0200E35C @ =gUnknown_03001B10
	movs r1, #0x1f
	ldrsb r1, [r4, r1]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r2]
_0200E318:
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x1f
	ldrsb r1, [r4, r1]
	adds r1, #8
	bl Div
	ldr r1, _0200E35C @ =gUnknown_03001B10
	strh r0, [r1, #2]
_0200E32A:
	ldr r0, _0200E35C @ =gUnknown_03001B10
	movs r1, #0
	strh r1, [r0, #4]
	ldrb r1, [r5, #0x17]
	lsls r1, r1, #4
	ldr r2, _0200E360 @ =gUnknown_03004E76
	adds r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
	ldrh r0, [r4, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200E354
	ldrb r0, [r5, #4]
	movs r1, #0x4f
	bl sub_02001398
_0200E354:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200E35C: .4byte gUnknown_03001B10
_0200E360: .4byte gUnknown_03004E76

	thumb_func_start sub_0200e364
sub_0200e364: @ 0x0200e364
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0200E3A0 @ =gUnknown_03004400
	adds r6, r0, r1
	ldr r0, _0200E3A4 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	mov sb, r0
	ands r0, r1
	cmp r0, #0
	beq _0200E3A8
	ldrh r0, [r6, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0200E396
	b _0200E5FA
_0200E396:
	ldrb r0, [r5, #4]
	movs r1, #0x4f
	bl sub_02001398
	b _0200E5FA
	.align 2, 0
_0200E3A0: .4byte gUnknown_03004400
_0200E3A4: .4byte gUnknown_03003330
_0200E3A8:
	ldrh r0, [r6, #0xa]
	adds r0, #0x20
	movs r4, #0
	strh r0, [r5, #0xa]
	ldrh r0, [r6, #0xe]
	strh r0, [r5, #0xe]
	ldrb r2, [r5, #7]
	movs r1, #1
	mov r8, r1
	mov r0, r8
	ands r0, r2
	cmp r0, #0
	bne _0200E4A8
	ldr r3, _0200E400 @ =gUnknown_03001ADC
	ldr r2, [r3]
	ldrb r1, [r2, #7]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0200E430
	movs r0, #0xf6
	strh r0, [r5, #0x14]
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	adds r0, #8
	cmp r1, r0
	ble _0200E3E6
	movs r0, #0x10
	strb r0, [r5, #0x17]
_0200E3E6:
	ldr r2, [r3]
	ldrb r1, [r2, #7]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200E416
	ldrh r1, [r2, #0x14]
	movs r0, #0xa9
	lsls r0, r0, #1
	cmp r1, r0
	bne _0200E404
	subs r0, #0x3c
	b _0200E410
	.align 2, 0
_0200E400: .4byte gUnknown_03001ADC
_0200E404:
	movs r0, #0xad
	lsls r0, r0, #1
	cmp r1, r0
	beq _0200E40E
	b _0200E5E6
_0200E40E:
	subs r0, #0x34
_0200E410:
	strh r0, [r5, #0x14]
	strb r4, [r5, #0x17]
	b _0200E5E6
_0200E416:
	ldrb r1, [r5, #0x1d]
	adds r0, r1, #1
	strb r0, [r5, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	bhi _0200E426
	b _0200E5E6
_0200E426:
	ldrh r0, [r5, #0x14]
	adds r0, #0x10
	strh r0, [r5, #0x14]
	strb r1, [r5, #0x1d]
	b _0200E5E6
_0200E430:
	ldrb r1, [r6, #7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200E43E
	movs r0, #0xc6
	b _0200E448
_0200E43E:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0200E452
	movs r0, #0x66
_0200E448:
	strh r0, [r5, #0x14]
	movs r0, #0xc
	strb r0, [r5, #0x1a]
	strb r4, [r5, #0x19]
	b _0200E5E6
_0200E452:
	ldrb r0, [r5, #0x1a]
	adds r2, r0, #1
	strb r2, [r5, #0x1a]
	ldrb r1, [r6, #7]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200E46A
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _0200E472
_0200E46A:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _0200E47C
_0200E472:
	movs r0, #0
	strb r0, [r5, #0x1a]
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
_0200E47C:
	ldr r2, _0200E4A4 @ =gUnknown_0202EB60
	ldrb r1, [r5, #0x19]
	movs r0, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	strh r0, [r5, #0x14]
	ldrb r1, [r6, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200E49A
	b _0200E5E6
_0200E49A:
	adds r0, r2, #0
	adds r0, #0x96
	strh r0, [r5, #0x14]
	b _0200E5E6
	.align 2, 0
_0200E4A4: .4byte gUnknown_0202EB60
_0200E4A8:
	ldrb r7, [r5, #0x1c]
	cmp r7, #0
	beq _0200E50C
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0200E4D0
	movs r0, #2
	orrs r0, r2
	strb r0, [r5, #7]
	ldrb r0, [r5, #0x17]
	bl sub_0200133c
	ldr r0, _0200E508 @ =gUnknown_0202E540
	str r0, [r5, #0x10]
	strb r4, [r5, #0x17]
	strb r4, [r5, #0x16]
	movs r0, #0xff
	strb r0, [r6, #0x1e]
	strb r4, [r6, #0x1f]
_0200E4D0:
	ldrb r0, [r5, #0x1c]
	adds r0, #6
	strb r0, [r5, #0x1c]
	ldrb r0, [r5, #0x1c]
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x33
	bl Div
	ldrh r1, [r6, #0xe]
	subs r1, r1, r0
	strh r1, [r5, #0xe]
	movs r0, #0x1c
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _0200E4F6
	b _0200E5E6
_0200E4F6:
	movs r0, #0x66
	strh r0, [r5, #0x14]
	strb r4, [r5, #0x1c]
	strb r4, [r5, #7]
	ldrb r1, [r6, #7]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r6, #7]
	b _0200E5E6
	.align 2, 0
_0200E508: .4byte gUnknown_0202E540
_0200E50C:
	ldrb r1, [r6, #7]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0200E5E6
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0200E52A
	movs r0, #2
	orrs r0, r2
	strb r0, [r5, #7]
	bl sub_020012f8
	strb r0, [r5, #0x17]
_0200E52A:
	movs r0, #0x1f
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bgt _0200E584
	movs r0, #0xd6
	strh r0, [r5, #0x14]
	mov r0, r8
	strb r0, [r5, #0x16]
	movs r0, #0x1f
	ldrsb r0, [r6, r0]
	subs r0, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r5, #0xe]
	subs r1, r1, r0
	strh r1, [r5, #0xe]
	ldr r4, _0200E57C @ =gUnknown_03001B10
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	adds r1, #0x18
	bl Div
	strh r0, [r4, #2]
	strh r7, [r4, #4]
	ldrb r1, [r5, #0x17]
	lsls r1, r1, #4
	ldr r0, _0200E580 @ =gUnknown_03004E76
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
	b _0200E5E6
	.align 2, 0
_0200E57C: .4byte gUnknown_03001B10
_0200E580: .4byte gUnknown_03004E76
_0200E584:
	ldr r0, _0200E608 @ =gUnknown_0202E548
	str r0, [r5, #0x10]
	movs r0, #0xe6
	strh r0, [r5, #0x14]
	movs r0, #3
	strb r0, [r5, #0x16]
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	movs r0, #8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r4, _0200E60C @ =gUnknown_03001B10
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4]
	movs r0, #0xe8
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrsb r1, [r6, r1]
	adds r1, #0x1b
	bl Div
	strh r0, [r4, #2]
	strh r7, [r4, #4]
	ldrb r1, [r5, #0x17]
	lsls r1, r1, #4
	ldr r0, _0200E610 @ =gUnknown_03004E76
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
	ldrb r1, [r6, #7]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0200E5E6
	ldrb r1, [r5, #7]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r5, #7]
	mov r2, r8
	strb r2, [r5, #0x1c]
_0200E5E6:
	ldrh r0, [r6, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200E5FA
	ldrb r0, [r5, #4]
	movs r1, #0x4f
	bl sub_02001398
_0200E5FA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200E608: .4byte gUnknown_0202E548
_0200E60C: .4byte gUnknown_03001B10
_0200E610: .4byte gUnknown_03004E76

	thumb_func_start sub_0200e614
sub_0200e614: @ 0x0200e614
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #7]
	movs r4, #0xfb
	ands r4, r0
	movs r6, #0
	strb r4, [r3, #7]
	ldr r0, _0200E650 @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200E67E
	ldr r0, _0200E654 @ =gUnknown_03001ADC
	ldr r0, [r0]
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	movs r0, #0xa
	ldrsh r1, [r3, r0]
	subs r0, r1, #3
	cmp r2, r0
	bge _0200E660
	ldrh r0, [r3, #0xa]
	subs r0, #3
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bgt _0200E658
	movs r0, #0xc
	b _0200E706
	.align 2, 0
_0200E650: .4byte gUnknown_03001B0A
_0200E654: .4byte gUnknown_03001ADC
_0200E658:
	movs r0, #0xfe
	ands r0, r4
	movs r1, #0xc
	b _0200E678
_0200E660:
	adds r0, r1, #2
	cmp r2, r0
	ble _0200E708
	ldrh r0, [r3, #0xa]
	adds r0, #3
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb4
	bgt _0200E704
	movs r1, #0xd
	adds r0, r4, #0
_0200E678:
	orrs r0, r1
	strb r0, [r3, #7]
	b _0200E708
_0200E67E:
	ldr r1, _0200E6B0 @ =gUnknown_030043F0
	ldrh r5, [r1]
	movs r0, #0x30
	ands r0, r5
	cmp r0, #0
	beq _0200E708
	movs r0, #0x92
	ands r0, r4
	cmp r0, #0
	bne _0200E708
	movs r0, #4
	adds r2, r4, #0
	orrs r2, r0
	orrs r2, r6
	strb r2, [r3, #7]
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200E6B4
	movs r0, #8
	orrs r2, r0
	strb r2, [r3, #7]
	movs r2, #0xc0
	lsls r2, r2, #0xa
	b _0200E6BE
	.align 2, 0
_0200E6B0: .4byte gUnknown_030043F0
_0200E6B4:
	movs r0, #0xf7
	ands r2, r0
	strb r2, [r3, #7]
	movs r2, #0xc0
	lsls r2, r2, #9
_0200E6BE:
	ldrh r1, [r1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0200E6E8
	ldrb r0, [r3, #7]
	movs r1, #0xfe
	ands r1, r0
	strb r1, [r3, #7]
	ldr r0, [r3, #8]
	subs r0, r0, r2
	str r0, [r3, #8]
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	cmp r0, #0xb
	bgt _0200E708
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r3, #7]
	movs r0, #0xc
	b _0200E706
_0200E6E8:
	ldrb r1, [r3, #7]
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #7]
	ldr r0, [r3, #8]
	adds r0, r0, r2
	str r0, [r3, #8]
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	cmp r0, #0xb4
	ble _0200E708
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3, #7]
_0200E704:
	movs r0, #0xb4
_0200E706:
	strh r0, [r3, #0xa]
_0200E708:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200e710
sub_0200e710: @ 0x0200e710
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	adds r7, r6, #0
	movs r0, #0
	mov ip, r0
	ldr r1, _0200E74C @ =gUnknown_03001ADC
	ldr r4, [r1]
	movs r0, #0xa
	ldrsh r2, [r4, r0]
	movs r0, #0xa
	ldrsh r3, [r5, r0]
	adds r0, r3, #0
	subs r0, #8
	mov r8, r1
	cmp r2, r0
	bge _0200E750
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, #7
	cmp r1, r0
	ble _0200E7B4
	mov r1, ip
	strb r1, [r5, #0x1d]
	b _0200E7BA
	.align 2, 0
_0200E74C: .4byte gUnknown_03001ADC
_0200E750:
	subs r0, r3, #2
	cmp r2, r0
	bge _0200E76A
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, #8
	cmp r1, r0
	ble _0200E7B4
	movs r0, #1
	strb r0, [r5, #0x1d]
	b _0200E7BA
_0200E76A:
	adds r0, r3, #7
	cmp r2, r0
	ble _0200E784
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, #7
	cmp r1, r0
	ble _0200E7B4
	movs r0, #4
	strb r0, [r5, #0x1d]
	b _0200E7BA
_0200E784:
	adds r0, r3, #1
	cmp r2, r0
	ble _0200E79E
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, #8
	cmp r1, r0
	ble _0200E7B4
	movs r0, #3
	strb r0, [r5, #0x1d]
	b _0200E7BA
_0200E79E:
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #9
	cmp r1, r0
	ble _0200E7B4
	movs r0, #2
	strb r0, [r5, #0x1d]
	movs r1, #1
	mov ip, r1
_0200E7B4:
	mov r0, ip
	cmp r0, #0
	beq _0200E834
_0200E7BA:
	mov r1, r8
	ldr r2, [r1]
	ldrb r1, [r2, #7]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #7]
	mov r0, r8
	ldr r1, [r0]
	ldrb r0, [r1, #0x1d]
	lsls r0, r0, #3
	ldr r3, _0200E840 @ =gUnknown_0202E4E8
	adds r0, r0, r3
	str r0, [r1, #0x10]
	movs r4, #0
	movs r0, #0xa9
	lsls r0, r0, #1
	strh r0, [r1, #0x14]
	ldrb r1, [r5, #7]
	movs r0, #0xef
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5, #7]
	movs r0, #0xbf
	strh r0, [r5, #0x14]
	strb r4, [r5, #0x1a]
	movs r0, #8
	strb r0, [r5, #0x1e]
	ldr r0, _0200E844 @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200E82E
	ldr r2, _0200E848 @ =gUnknown_03004400
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #7]
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x8b
	lsls r1, r1, #1
	strh r1, [r0, #0x14]
	mov r1, r8
	ldr r0, [r1]
	str r3, [r0, #0x10]
	ldrb r1, [r5, #7]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r5, #7]
	strb r4, [r5, #0x1c]
	ldr r0, _0200E84C @ =sub_0200dff8
	str r0, [r5]
_0200E82E:
	movs r0, #0x19
	bl m4aSongNumStart
_0200E834:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200E840: .4byte gUnknown_0202E4E8
_0200E844: .4byte gUnknown_03001B0A
_0200E848: .4byte gUnknown_03004400
_0200E84C: .4byte sub_0200dff8

	thumb_func_start sub_0200e850
sub_0200e850: @ 0x0200e850
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r7, r5, #0
	movs r0, #0
	mov ip, r0
	ldr r1, _0200E88C @ =gUnknown_03001ADC
	ldr r4, [r1]
	movs r0, #0xa
	ldrsh r2, [r4, r0]
	movs r0, #0xa
	ldrsh r3, [r6, r0]
	adds r0, r3, #0
	adds r0, #0x19
	mov r8, r1
	cmp r2, r0
	bge _0200E890
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #7
	cmp r1, r0
	ble _0200E8FA
	mov r0, ip
	strb r0, [r6, #0x1d]
	b _0200E900
	.align 2, 0
_0200E88C: .4byte gUnknown_03001ADC
_0200E890:
	adds r0, r3, #0
	adds r0, #0x1d
	cmp r2, r0
	bge _0200E8AC
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #8
	cmp r1, r0
	ble _0200E8FA
	movs r0, #1
	strb r0, [r6, #0x1d]
	b _0200E900
_0200E8AC:
	adds r0, r3, #0
	adds r0, #0x26
	cmp r2, r0
	ble _0200E8C8
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #7
	cmp r1, r0
	ble _0200E8FA
	movs r0, #4
	strb r0, [r6, #0x1d]
	b _0200E900
_0200E8C8:
	adds r0, r3, #0
	adds r0, #0x22
	cmp r2, r0
	ble _0200E8E4
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #8
	cmp r1, r0
	ble _0200E8FA
	movs r0, #3
	strb r0, [r6, #0x1d]
	b _0200E900
_0200E8E4:
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #9
	cmp r1, r0
	ble _0200E8FA
	movs r0, #2
	strb r0, [r6, #0x1d]
	movs r0, #1
	mov ip, r0
_0200E8FA:
	mov r0, ip
	cmp r0, #0
	beq _0200E950
_0200E900:
	mov r0, r8
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #7]
	mov r0, r8
	ldr r2, [r0]
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	ldr r1, _0200E95C @ =gUnknown_0202E4E8
	adds r0, r0, r1
	str r0, [r2, #0x10]
	movs r3, #0
	movs r0, #0xa9
	lsls r0, r0, #1
	strh r0, [r2, #0x14]
	ldrb r0, [r6, #7]
	movs r1, #0x90
	orrs r1, r0
	movs r0, #0xbf
	strh r0, [r6, #0x14]
	strb r3, [r6, #0x1a]
	movs r0, #8
	strb r0, [r6, #0x1e]
	movs r0, #0xfd
	ands r1, r0
	strb r1, [r6, #7]
	strb r3, [r6, #0x19]
	ldr r2, _0200E960 @ =gUnknown_03004400
	ldrb r1, [r6, #0x1b]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #7]
	movs r0, #0x19
	bl m4aSongNumStart
_0200E950:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200E95C: .4byte gUnknown_0202E4E8
_0200E960: .4byte gUnknown_03004400

	thumb_func_start sub_0200e964
sub_0200e964: @ 0x0200e964
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0200E9DC @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r5, #0x80
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0200E978
	b _0200EB0E
_0200E978:
	ldr r0, _0200E9E0 @ =gUnknown_03001ADC
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0200E988
	b _0200EB0E
_0200E988:
	ldr r0, _0200E9E4 @ =gUnknown_03001AE8
	ldrh r1, [r0]
	ldr r2, _0200E9E8 @ =0x0000013F
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	adds r0, r4, #0
	bl sub_0200e614
	ldrb r2, [r4, #7]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0200E9F8
	ldr r0, _0200E9EC @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0200EA2E
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0200EA2E
	ldr r0, _0200E9F0 @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200EA2E
	movs r0, #2
	orrs r0, r2
	strb r0, [r4, #7]
	movs r0, #0xc
	strb r0, [r4, #0x19]
	ldr r0, _0200E9F4 @ =gUnknown_03001B0B
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200EA2E
	movs r0, #0x15
	bl m4aSongNumStart
	b _0200EA2E
	.align 2, 0
_0200E9DC: .4byte gUnknown_03003330
_0200E9E0: .4byte gUnknown_03001ADC
_0200E9E4: .4byte gUnknown_03001AE8
_0200E9E8: .4byte 0x0000013F
_0200E9EC: .4byte gUnknown_030043F0
_0200E9F0: .4byte gUnknown_03001B0A
_0200E9F4: .4byte gUnknown_03001B0B
_0200E9F8:
	ldr r0, _0200EA78 @ =gUnknown_030043F0
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0200EA08
	movs r0, #0xc
	strb r0, [r4, #0x19]
_0200EA08:
	ldrb r1, [r4, #7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0200EA18
	ldrb r0, [r4, #0x19]
	subs r0, #1
	strb r0, [r4, #0x19]
_0200EA18:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _0200EA26
	ldr r0, _0200EA7C @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200EA2E
_0200EA26:
	ldrb r1, [r4, #7]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4, #7]
_0200EA2E:
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	adds r7, r1, #0
	cmp r0, #0
	beq _0200EA42
	ldr r0, _0200EA80 @ =gUnknown_03001B18
	ldr r0, [r0]
	cmp r0, #0
	bgt _0200EB00
_0200EA42:
	ldr r5, _0200EA84 @ =0x0000012F
	movs r0, #2
	ands r0, r7
	cmp r0, #0
	beq _0200EA4E
	subs r5, #5
_0200EA4E:
	ldr r0, _0200EA88 @ =gUnknown_03001ADC
	ldr r1, [r0]
	movs r2, #0xa
	ldrsh r3, [r1, r2]
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	adds r1, r2, #0
	subs r1, #0x10
	adds r6, r0, #0
	cmp r3, r1
	blt _0200EA8C
	adds r0, r2, #0
	adds r0, #0xf
	cmp r3, r0
	bgt _0200EA8C
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_0200e710
	b _0200EB00
	.align 2, 0
_0200EA78: .4byte gUnknown_030043F0
_0200EA7C: .4byte gUnknown_03001B0A
_0200EA80: .4byte gUnknown_03001B18
_0200EA84: .4byte 0x0000012F
_0200EA88: .4byte gUnknown_03001ADC
_0200EA8C:
	ldr r0, [r6]
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x14
	cmp r2, r0
	blt _0200EAC2
	adds r0, #0x17
	cmp r2, r0
	bgt _0200EAC2
	movs r0, #2
	ands r0, r7
	cmp r0, #0
	beq _0200EAB6
	lsls r0, r5, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xb
	adds r0, r0, r1
	lsrs r5, r0, #0x10
_0200EAB6:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_0200e850
	b _0200EB00
_0200EAC2:
	ldr r3, [r6]
	movs r2, #0x22
	ldrsh r1, [r3, r2]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0200EB00
	ldrb r1, [r3, #7]
	movs r0, #0x80
	movs r5, #0
	movs r2, #0
	orrs r0, r1
	strb r0, [r3, #7]
	ldr r0, [r6]
	strb r2, [r0, #0x1a]
	ldr r0, _0200EAFC @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200EAF2
	ldr r0, [r6]
	ldrb r1, [r0, #7]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0, #7]
_0200EAF2:
	ldrb r1, [r4, #7]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4, #7]
	b _0200EB0E
	.align 2, 0
_0200EAFC: .4byte gUnknown_03001B0A
_0200EB00:
	movs r0, #0x1e
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0200EB0E
	adds r0, r4, #0
	bl sub_0200ee7c
_0200EB0E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200eb14
sub_0200eb14: @ 0x0200eb14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0200EB94 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0200EB8C
	ldr r0, _0200EB98 @ =gUnknown_03001AE8
	ldrh r1, [r0]
	ldr r2, _0200EB9C @ =0x0000013F
	adds r0, r2, #0
	subs r0, r0, r1
	movs r5, #0
	strh r0, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x9f
	ble _0200EB8C
	adds r0, r4, #0
	bl sub_0200e614
	ldr r2, _0200EBA0 @ =gUnknown_03001ADC
	ldr r1, [r2]
	ldrh r0, [r4, #0xa]
	subs r0, #6
	strh r0, [r1, #0xa]
	ldr r0, _0200EBA4 @ =gUnknown_030043F0
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200EB64
	ldrb r0, [r4, #0x19]
	adds r0, #1
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xef
	bls _0200EB8C
_0200EB64:
	ldr r2, [r2]
	ldrb r1, [r2, #7]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2, #7]
	ldrb r1, [r4, #7]
	movs r0, #0xa0
	orrs r0, r1
	strb r0, [r4, #7]
	ldr r0, _0200EBA8 @ =0x00000141
	strh r0, [r4, #0x14]
	strb r5, [r4, #0x1a]
	strb r5, [r4, #0x19]
	movs r0, #8
	strb r0, [r4, #0x1e]
	adds r0, r4, #0
	bl sub_0200ee7c
	ldr r0, _0200EBAC @ =sub_0200e964
	str r0, [r4]
_0200EB8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200EB94: .4byte gUnknown_03003330
_0200EB98: .4byte gUnknown_03001AE8
_0200EB9C: .4byte 0x0000013F
_0200EBA0: .4byte gUnknown_03001ADC
_0200EBA4: .4byte gUnknown_030043F0
_0200EBA8: .4byte 0x00000141
_0200EBAC: .4byte sub_0200e964

	thumb_func_start sub_0200ebb0
sub_0200ebb0: @ 0x0200ebb0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r5, _0200ECD4 @ =sub_0200e1c0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r6, r0, #0
	ldr r0, _0200ECD8 @ =sub_0200e364
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r7, r0, #0
	ldr r0, _0200ECDC @ =gUnknown_0202E540
	str r0, [r7, #0x10]
	movs r0, #0
	mov r8, r0
	movs r0, #0x3c
	strb r0, [r7, #0x18]
	ldrb r0, [r4, #4]
	strb r0, [r7, #0x1b]
	mov r0, r8
	strb r0, [r7, #0x1d]
	strb r0, [r7, #0x1c]
	ldrb r0, [r7, #4]
	strb r0, [r4, #0x1b]
	ldrb r0, [r7, #4]
	strb r0, [r6, #0x1b]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r6, r0, #0
	ldr r0, _0200ECE0 @ =sub_0200f6fc
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r7, r0, #0
	ldr r0, _0200ECE4 @ =gUnknown_0202E530
	str r0, [r7, #0x10]
	movs r0, #0x2c
	mov sl, r0
	mov r0, sl
	strb r0, [r7, #0x18]
	ldrb r0, [r4, #4]
	strb r0, [r7, #0x1b]
	ldrb r0, [r7, #4]
	strb r0, [r6, #0x1b]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r6, r0, #0
	ldr r0, _0200ECE8 @ =sub_0200f740
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	mov r0, r8
	strh r0, [r7, #0x14]
	mov r0, sl
	strb r0, [r7, #0x18]
	ldrb r0, [r4, #4]
	strb r0, [r7, #0x1b]
	ldrb r0, [r7, #4]
	strb r0, [r6, #0x1b]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r6, r0, #0
	ldr r0, _0200ECEC @ =sub_0200e240
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r7, r0, #0
	ldr r0, _0200ECF0 @ =gUnknown_0202E500
	str r0, [r7, #0x10]
	mov r0, r8
	strh r0, [r7, #0x14]
	mov r0, sl
	strb r0, [r7, #0x18]
	ldrb r0, [r4, #4]
	strb r0, [r7, #0x1b]
	ldrb r0, [r7, #4]
	strb r0, [r6, #0x1b]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r6, r0, #0
	ldr r0, _0200ECF4 @ =sub_0200e298
	adds r1, r4, #0
	movs r2, #0
	bl sub_02000d04
	adds r7, r0, #0
	ldr r0, _0200ECF8 @ =gUnknown_0202E508
	str r0, [r7, #0x10]
	mov r0, r8
	strh r0, [r7, #0x14]
	movs r5, #1
	strb r5, [r7, #0x16]
	bl sub_020012f8
	strb r0, [r7, #0x17]
	mov r0, sl
	strb r0, [r7, #0x18]
	ldrb r0, [r4, #4]
	strb r0, [r7, #0x1b]
	ldrb r0, [r7, #4]
	strb r0, [r6, #0x1b]
	movs r0, #0x80
	strh r0, [r4, #0xa]
	strb r5, [r4, #0x1d]
	movs r0, #0xff
	strb r0, [r4, #0x1e]
	mov r0, r8
	strh r0, [r4, #0x22]
	mov r0, sb
	strb r0, [r4, #0x1f]
	ldr r0, _0200ECFC @ =sub_0200eb14
	str r0, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200ECD4: .4byte sub_0200e1c0
_0200ECD8: .4byte sub_0200e364
_0200ECDC: .4byte gUnknown_0202E540
_0200ECE0: .4byte sub_0200f6fc
_0200ECE4: .4byte gUnknown_0202E530
_0200ECE8: .4byte sub_0200f740
_0200ECEC: .4byte sub_0200e240
_0200ECF0: .4byte gUnknown_0202E500
_0200ECF4: .4byte sub_0200e298
_0200ECF8: .4byte gUnknown_0202E508
_0200ECFC: .4byte sub_0200eb14

	thumb_func_start sub_0200ed00
sub_0200ed00: @ 0x0200ed00
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrb r1, [r7, #7]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0200ED18
	ldr r6, _0200ED14 @ =0x0001EED9
	b _0200EDDE
	.align 2, 0
_0200ED14: .4byte 0x0001EED9
_0200ED18:
	ldrh r0, [r7, #0x22]
	cmp r0, #0
	beq _0200ED22
	cmp r0, #0xc5
	bne _0200ED2C
_0200ED22:
	ldr r6, _0200ED28 @ =0x000293CE
	b _0200EDDE
	.align 2, 0
_0200ED28: .4byte 0x000293CE
_0200ED2C:
	ldrh r1, [r7, #0x22]
	cmp r1, #0xf5
	beq _0200EDB0
	cmp r1, #0xf5
	bgt _0200ED60
	cmp r1, #0xdd
	beq _0200EDC0
	cmp r1, #0xdd
	bgt _0200ED4C
	cmp r1, #0xd1
	beq _0200EDC8
	cmp r1, #0xd1
	ble _0200EDCC
	cmp r1, #0xd7
	beq _0200EDC4
	b _0200EDCC
_0200ED4C:
	cmp r1, #0xe9
	beq _0200EDB8
	cmp r1, #0xe9
	bgt _0200ED5A
	cmp r1, #0xe3
	beq _0200EDBC
	b _0200EDCC
_0200ED5A:
	cmp r1, #0xef
	beq _0200EDB4
	b _0200EDCC
_0200ED60:
	ldr r0, _0200ED7C @ =0x00000125
	cmp r1, r0
	beq _0200EDAC
	cmp r1, r0
	bgt _0200ED88
	subs r0, #0x24
	cmp r1, r0
	beq _0200EDAC
	cmp r1, r0
	bgt _0200ED80
	cmp r1, #0xfb
	beq _0200EDAC
	b _0200EDCC
	.align 2, 0
_0200ED7C: .4byte 0x00000125
_0200ED80:
	ldr r0, _0200ED84 @ =0x00000113
	b _0200ED94
	.align 2, 0
_0200ED84: .4byte 0x00000113
_0200ED88:
	ldr r0, _0200ED9C @ =0x00000149
	cmp r1, r0
	beq _0200EDB4
	cmp r1, r0
	bgt _0200EDA0
	subs r0, #0x12
_0200ED94:
	cmp r1, r0
	beq _0200EDAC
	b _0200EDCC
	.align 2, 0
_0200ED9C: .4byte 0x00000149
_0200EDA0:
	ldr r0, _0200EDA8 @ =0x0000015B
	cmp r1, r0
	beq _0200EDC0
	b _0200EDCC
	.align 2, 0
_0200EDA8: .4byte 0x0000015B
_0200EDAC:
	movs r1, #0
	b _0200EDCE
_0200EDB0:
	movs r1, #0x1c
	b _0200EDCE
_0200EDB4:
	movs r1, #0x38
	b _0200EDCE
_0200EDB8:
	movs r1, #0x54
	b _0200EDCE
_0200EDBC:
	movs r1, #0x70
	b _0200EDCE
_0200EDC0:
	movs r1, #0x8c
	b _0200EDCE
_0200EDC4:
	movs r1, #0xa8
	b _0200EDCE
_0200EDC8:
	movs r1, #0xc5
	b _0200EDCE
_0200EDCC:
	movs r1, #0xe1
_0200EDCE:
	ldr r0, _0200EE2C @ =0x0001782A
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	ldr r1, _0200EE30 @ =0x00040BF8
	subs r6, r1, r0
_0200EDDE:
	ldrb r4, [r7, #0x1d]
	lsls r4, r4, #0x1a
	movs r0, #0xb8
	lsls r0, r0, #0x18
	adds r4, r4, r0
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r6, r0
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	ldr r1, _0200EE34 @ =gUnknown_03001B18
	str r0, [r1]
	adds r0, r4, #0
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r6, r0
	adds r1, r5, #0
	bl Div
	ldr r1, _0200EE38 @ =gUnknown_03001B1C
	str r0, [r1]
	ldrb r0, [r7, #0x1d]
	cmp r0, #1
	bhi _0200EE40
	ldr r2, _0200EE3C @ =gUnknown_03001ADC
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #0x1d]
	adds r3, r2, #0
	b _0200EE4C
	.align 2, 0
_0200EE2C: .4byte 0x0001782A
_0200EE30: .4byte 0x00040BF8
_0200EE34: .4byte gUnknown_03001B18
_0200EE38: .4byte gUnknown_03001B1C
_0200EE3C: .4byte gUnknown_03001ADC
_0200EE40:
	ldr r3, _0200EE74 @ =gUnknown_03001ADC
	cmp r0, #2
	bls _0200EE4C
	ldr r1, [r3]
	movs r0, #1
	strb r0, [r1, #0x1d]
_0200EE4C:
	ldr r2, [r3]
	ldrb r1, [r2, #7]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #7]
	ldr r2, [r3]
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	ldr r1, _0200EE78 @ =gUnknown_0202E4C8
	adds r0, r0, r1
	str r0, [r2, #0x10]
	movs r0, #0x9b
	lsls r0, r0, #1
	strh r0, [r2, #0x14]
	movs r0, #0x12
	bl m4aSongNumStart
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200EE74: .4byte gUnknown_03001ADC
_0200EE78: .4byte gUnknown_0202E4C8

	thumb_func_start sub_0200ee7c
sub_0200ee7c: @ 0x0200ee7c
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r0, _0200EEA0 @ =gUnknown_03001B0A
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200EEA4
	ldrh r0, [r4, #0x14]
	adds r0, #0x10
	strh r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0200EF20
	b _0200EEEE
	.align 2, 0
_0200EEA0: .4byte gUnknown_03001B0A
_0200EEA4:
	ldrh r2, [r4, #0x14]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0200EEFA
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200EEDA
	adds r0, r2, #0
	adds r0, #0x12
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	movs r1, #0xbf
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0200EF20
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl sub_0200ed00
	movs r6, #1
	b _0200EF20
_0200EEDA:
	adds r0, r2, #0
	adds r0, #0x19
	strh r0, [r4, #0x14]
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0200EF20
_0200EEEE:
	movs r0, #0
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	b _0200EF20
_0200EEFA:
	cmp r1, #0xfa
	bls _0200EF1C
	ldrb r1, [r4, #7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0200EF14
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0200EF20
_0200EF14:
	strb r6, [r4, #0x1a]
	ldrh r0, [r4, #0x14]
	adds r0, #6
	b _0200EF1E
_0200EF1C:
	adds r0, r2, #6
_0200EF1E:
	strh r0, [r4, #0x14]
_0200EF20:
	ldrb r0, [r4, #0x14]
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x1e
	ldrsb r1, [r4, r1]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	rsbs r0, r0, #0
	strb r0, [r4, #0x1f]
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200EF90
	ldr r2, _0200EF98 @ =gUnknown_03001ADC
	ldr r5, [r2]
	ldr r1, _0200EF9C @ =gUnknown_0202EB64
	ldrb r0, [r4, #0x1d]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x9f
	subs r0, r0, r1
	movs r1, #0x1f
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	strh r3, [r5, #0xe]
	ldrb r1, [r4, #7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200EF76
	subs r0, r3, #5
	strh r0, [r5, #0xe]
	ldrh r0, [r4, #0x22]
	cmp r0, #0
	bne _0200EF76
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x22]
_0200EF76:
	ldr r2, [r2]
	ldrh r0, [r2, #0xe]
	adds r0, #0xa0
	movs r3, #0
	strh r0, [r2, #0x22]
	cmp r6, #0
	beq _0200EF90
	ldrb r1, [r4, #7]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #7]
	strh r3, [r2, #0x20]
	strh r3, [r4, #0x22]
_0200EF90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200EF98: .4byte gUnknown_03001ADC
_0200EF9C: .4byte gUnknown_0202EB64

	thumb_func_start sub_0200efa0
sub_0200efa0: @ 0x0200efa0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _0200EFD0 @ =gUnknown_03001AE8
	ldrh r1, [r2, #0x22]
	ldrh r0, [r0]
	subs r3, r1, r0
	strh r3, [r2, #0xe]
	ldr r0, _0200EFD4 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200EFD8
	adds r0, r3, #0
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200F042
	ldrb r0, [r2, #4]
	movs r1, #1
	bl sub_02001398
	b _0200F042
	.align 2, 0
_0200EFD0: .4byte gUnknown_03001AE8
_0200EFD4: .4byte gUnknown_03003330
_0200EFD8:
	ldrb r1, [r2, #0x19]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	movs r3, #0xc8
	lsls r3, r3, #5
	cmp r0, #0
	beq _0200EFEC
	movs r3, #0xa4
	lsls r3, r3, #6
_0200EFEC:
	ldr r0, _0200F014 @ =gUnknown_03001AD1
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0200F018
	ldr r0, [r2, #8]
	subs r0, r0, r3
	str r0, [r2, #8]
	ldrh r3, [r2, #0xa]
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	movs r0, #0x18
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0200F02E
	adds r0, r3, #0
	adds r0, #0xf0
	b _0200F02C
	.align 2, 0
_0200F014: .4byte gUnknown_03001AD1
_0200F018:
	ldr r0, [r2, #8]
	adds r0, r0, r3
	str r0, [r2, #8]
	ldrh r1, [r2, #0xa]
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0xd8
	ble _0200F02E
	adds r0, r1, #0
	subs r0, #0xf0
_0200F02C:
	strh r0, [r2, #0xa]
_0200F02E:
	ldrh r0, [r2, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200F042
	ldrb r0, [r2, #4]
	movs r1, #1
	bl sub_02001398
_0200F042:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200f048
sub_0200f048: @ 0x0200f048
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0200F060 @ =gUnknown_03001AD1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0200F078
	cmp r0, #1
	bgt _0200F064
	cmp r0, #0
	beq _0200F06A
	b _0200F094
	.align 2, 0
_0200F060: .4byte gUnknown_03001AD1
_0200F064:
	cmp r0, #2
	beq _0200F086
	b _0200F094
_0200F06A:
	mov r1, sp
	movs r0, #0xcc
	strb r0, [r1, #1]
	movs r0, #0xe8
	strb r0, [r1]
	movs r0, #0xe4
	b _0200F0A0
_0200F078:
	mov r1, sp
	movs r0, #0xc2
	strb r0, [r1, #1]
	movs r0, #0xe4
	strb r0, [r1]
	movs r0, #0xdd
	b _0200F0A0
_0200F086:
	mov r1, sp
	movs r0, #0xb8
	strb r0, [r1, #1]
	movs r0, #0xe1
	strb r0, [r1]
	movs r0, #0xd7
	b _0200F0A0
_0200F094:
	mov r1, sp
	movs r0, #0xae
	strb r0, [r1, #1]
	movs r0, #0xde
	strb r0, [r1]
	movs r0, #0xd0
_0200F0A0:
	strb r0, [r1, #2]
	movs r5, #0
_0200F0A4:
	ldr r0, _0200F110 @ =sub_0200efa0
	adds r1, r6, #0
	movs r2, #0
	bl sub_02000d04
	adds r3, r0, #0
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	lsls r2, r4, #4
	subs r2, r2, r4
	lsls r2, r2, #2
	ldr r0, _0200F114 @ =gUnknown_03001AD1
	ldrb r0, [r0]
	movs r1, #3
	ands r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	adds r0, r2, #0
	adds r0, #0x10
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd8
	ble _0200F0DE
	adds r0, r2, #0
	subs r0, #0xe0
	strh r0, [r3, #0xa]
_0200F0DE:
	ldr r0, _0200F118 @ =gUnknown_0202E558
	str r0, [r3, #0x10]
	movs r0, #0x3c
	strh r0, [r3, #0x14]
	movs r0, #0x1c
	strb r0, [r3, #0x18]
	strb r5, [r3, #0x19]
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	strh r0, [r3, #0x22]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0200F0A4
	adds r0, r6, #0
	bl sub_02000ed4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200F110: .4byte sub_0200efa0
_0200F114: .4byte gUnknown_03001AD1
_0200F118: .4byte gUnknown_0202E558

	thumb_func_start sub_0200f11c
sub_0200f11c: @ 0x0200f11c
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0200F150 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200F154
	ldrh r0, [r7, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0200F144
	b _0200F4A6
_0200F144:
	ldrb r0, [r7, #4]
	movs r1, #0x51
	bl sub_02001398
	b _0200F4A6
	.align 2, 0
_0200F150: .4byte gUnknown_03003330
_0200F154:
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _0200F15E
	subs r0, #1
	strb r0, [r7, #0x19]
_0200F15E:
	ldrb r0, [r7, #0x1c]
	cmp r0, #0
	beq _0200F184
	ldr r0, [r7, #8]
	ldr r1, _0200F180 @ =0xFFFFB000
	adds r0, r0, r1
	str r0, [r7, #8]
	ldrh r2, [r7, #0xa]
	movs r0, #0xa
	ldrsh r1, [r7, r0]
	movs r0, #0x18
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0200F19E
	adds r0, r2, #0
	adds r0, #0xf0
	b _0200F19C
	.align 2, 0
_0200F180: .4byte 0xFFFFB000
_0200F184:
	ldr r0, [r7, #8]
	movs r1, #0xa0
	lsls r1, r1, #7
	adds r0, r0, r1
	str r0, [r7, #8]
	ldrh r1, [r7, #0xa]
	movs r2, #0xa
	ldrsh r0, [r7, r2]
	cmp r0, #0xd8
	ble _0200F19E
	adds r0, r1, #0
	subs r0, #0xf0
_0200F19C:
	strh r0, [r7, #0xa]
_0200F19E:
	ldrb r2, [r7, #0x1e]
	ldrb r0, [r7, #0x1f]
	adds r1, r2, r0
	strb r1, [r7, #0x1f]
	lsls r0, r2, #0x18
	cmp r0, #0
	ble _0200F1B6
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3f
	ble _0200F1C6
	b _0200F1C2
_0200F1B6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x40
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _0200F1C6
_0200F1C2:
	rsbs r0, r2, #0
	strb r0, [r7, #0x1e]
_0200F1C6:
	ldrh r0, [r7, #0x22]
	strh r0, [r7, #0xe]
	movs r1, #0x1f
	ldrsb r1, [r7, r1]
	lsls r1, r1, #8
	ldr r0, [r7, #0xc]
	adds r0, r0, r1
	str r0, [r7, #0xc]
	ldrh r0, [r7, #0xe]
	strh r0, [r7, #0x22]
	ldr r1, _0200F1F8 @ =gUnknown_03001AE8
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r7, #0xe]
	ldrb r0, [r7, #7]
	cmp r0, #0
	bne _0200F200
	ldr r0, _0200F1FC @ =gUnknown_03001B10
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	adds r3, r0, #0
	b _0200F29C
	.align 2, 0
_0200F1F8: .4byte gUnknown_03001AE8
_0200F1FC: .4byte gUnknown_03001B10
_0200F200:
	ldrh r0, [r7, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r7, #0x1d]
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrb r0, [r7, #7]
	cmp r0, #1
	bne _0200F248
	movs r6, #0x80
	lsls r6, r6, #6
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	adds r1, #0x20
	adds r0, r6, #0
	bl Div
	ldr r5, _0200F244 @ =gUnknown_03001B10
	strh r0, [r5]
	movs r1, #0x20
	subs r1, r1, r4
	adds r0, r6, #0
	b _0200F264
	.align 2, 0
_0200F244: .4byte gUnknown_03001B10
_0200F248:
	movs r6, #0x80
	lsls r6, r6, #6
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	movs r1, #0x20
	subs r1, r1, r4
	adds r0, r6, #0
	bl Div
	ldr r5, _0200F360 @ =gUnknown_03001B10
	strh r0, [r5]
	adds r4, #0x20
	adds r0, r6, #0
	adds r1, r4, #0
_0200F264:
	bl Div
	strh r0, [r5, #2]
	ldrh r0, [r7, #0x20]
	adds r0, #9
	movs r2, #0
	strh r0, [r7, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _0200F360 @ =gUnknown_03001B10
	cmp r0, #0xff
	bls _0200F29C
	ldrb r0, [r7, #0x1a]
	adds r0, #1
	strb r0, [r7, #0x1a]
	movs r1, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _0200F29C
	strb r2, [r7, #0x1a]
	ldrb r0, [r7, #0x1d]
	subs r0, #1
	strb r0, [r7, #0x1d]
	ands r0, r1
	cmp r0, #0
	bne _0200F29C
	strb r2, [r7, #7]
_0200F29C:
	movs r0, #0
	strh r0, [r3, #4]
	ldrb r1, [r7, #0x17]
	lsls r1, r1, #4
	ldr r0, _0200F364 @ =gUnknown_03004E76
	adds r1, r1, r0
	adds r0, r3, #0
	movs r2, #1
	movs r3, #8
	bl ObjAffineSet
	ldrh r3, [r7, #0xe]
	adds r0, r3, #0
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0200F2C2
	b _0200F4A6
_0200F2C2:
	ldr r6, _0200F368 @ =gUnknown_03001ADC
	ldr r1, [r6]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r7, #0xa]
	subs r2, r2, r0
	adds r0, r3, #7
	ldrh r1, [r1, #0xe]
	subs r1, r1, r0
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	adds r0, r5, #0
	muls r0, r5, r0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r1, r4, #0
	muls r1, r4, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bls _0200F2F2
	b _0200F49E
_0200F2F2:
	lsls r0, r5, #0x12
	asrs r0, r0, #0x10
	lsls r1, r4, #0x12
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	mov sb, r0
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x16
	muls r0, r4, r0
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	ldr r2, [r6]
	ldrh r1, [r7, #0xa]
	adds r1, r1, r0
	strh r1, [r2, #0xa]
	mov r0, sb
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r4, r0
	adds r1, r5, #0
	bl Div
	ldr r2, [r6]
	ldrh r1, [r7, #0xe]
	adds r1, r1, r0
	adds r1, #7
	strh r1, [r2, #0xe]
	ldrh r0, [r7, #8]
	strh r0, [r2, #8]
	ldrh r0, [r7, #0xc]
	strh r0, [r2, #0xc]
	ldr r0, _0200F36C @ =gUnknown_03001AE8
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #0x22]
	mov r1, sb
	cmp r1, #0x1f
	bls _0200F380
	mov r2, sb
	cmp r2, #0x60
	bhi _0200F370
	movs r0, #1
	b _0200F382
	.align 2, 0
_0200F360: .4byte gUnknown_03001B10
_0200F364: .4byte gUnknown_03004E76
_0200F368: .4byte gUnknown_03001ADC
_0200F36C: .4byte gUnknown_03001AE8
_0200F370:
	mov r0, sb
	cmp r0, #0x9f
	bls _0200F380
	mov r1, sb
	cmp r1, #0xe0
	bhi _0200F380
	movs r0, #1
	b _0200F382
_0200F380:
	movs r0, #2
_0200F382:
	strb r0, [r7, #7]
	ldr r2, _0200F41C @ =gUnknown_03001B1C
	mov sl, r2
	ldr r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0200F420 @ =gUnknown_03001B18
	mov r8, r0
	ldr r0, [r0]
	adds r1, r4, #0
	str r2, [sp]
	bl Div
	adds r5, r0, #0
	ldr r2, [sp]
	lsls r6, r2, #0x10
	asrs r6, r6, #0x10
	lsls r0, r6, #0x12
	asrs r0, r0, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r1, r5, #0x12
	asrs r1, r1, #0x10
	bl ArcTan2
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	muls r0, r6, r0
	adds r1, r5, #0
	muls r1, r5, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sb
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r4, r0, r4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	mov r0, sb
	bl sub_0200182c
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r5, r0
	mov r1, sl
	str r0, [r1]
	mov r0, sb
	bl sub_02001840
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r5, r0
	mov r2, r8
	str r0, [r2]
	ldrb r0, [r7, #0x1c]
	cmp r0, #0
	beq _0200F428
	mov r1, sl
	ldr r0, [r1]
	ldr r2, _0200F424 @ =0xFFFFB000
	b _0200F430
	.align 2, 0
_0200F41C: .4byte gUnknown_03001B1C
_0200F420: .4byte gUnknown_03001B18
_0200F424: .4byte 0xFFFFB000
_0200F428:
	mov r1, sl
	ldr r0, [r1]
	movs r2, #0xa0
	lsls r2, r2, #7
_0200F430:
	adds r0, r0, r2
	str r0, [r1]
	ldr r2, _0200F454 @ =gUnknown_03001B18
	movs r1, #0x1f
	ldrsb r1, [r7, r1]
	lsls r1, r1, #8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0200F458 @ =gUnknown_03001B1C
	ldr r0, [r0]
	cmp r0, #0
	bge _0200F460
	ldr r2, _0200F45C @ =gUnknown_03001ADC
	ldr r1, [r2]
	movs r0, #0
	b _0200F466
	.align 2, 0
_0200F454: .4byte gUnknown_03001B18
_0200F458: .4byte gUnknown_03001B1C
_0200F45C: .4byte gUnknown_03001ADC
_0200F460:
	ldr r2, _0200F4B8 @ =gUnknown_03001ADC
	ldr r1, [r2]
	movs r0, #1
_0200F466:
	strb r0, [r1, #0x1d]
	ldr r2, [r2]
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	ldr r1, _0200F4BC @ =gUnknown_0202E4C8
	adds r0, r0, r1
	str r0, [r2, #0x10]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _0200F484
	movs r0, #0xd
	bl m4aSongNumStart
	movs r0, #0xf
	strb r0, [r7, #0x19]
_0200F484:
	movs r0, #0
	strb r0, [r7, #0x1a]
	strh r0, [r7, #0x20]
	lsrs r0, r5, #8
	lsls r0, r0, #1
	adds r0, #2
	strb r0, [r7, #0x1d]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	bls _0200F49E
	movs r0, #0xc
	strb r0, [r7, #0x1d]
_0200F49E:
	ldrb r0, [r7, #4]
	movs r1, #0x51
	bl sub_02001398
_0200F4A6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F4B8: .4byte gUnknown_03001ADC
_0200F4BC: .4byte gUnknown_0202E4C8

	thumb_func_start sub_0200f4c0
sub_0200f4c0: @ 0x0200f4c0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r0, #0x60
	strh r0, [r4, #0xa]
	ldr r0, _0200F4E8 @ =gUnknown_0202E550
	str r0, [r4, #0x10]
	strh r1, [r4, #0x14]
	bl sub_020012f8
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	beq _0200F4EC
	movs r0, #0x40
	strb r0, [r4, #0x1f]
	movs r0, #0xff
	strb r0, [r4, #0x1e]
	movs r0, #0xb0
	b _0200F50A
	.align 2, 0
_0200F4E8: .4byte gUnknown_0202E550
_0200F4EC:
	movs r0, #0xc0
	strb r0, [r4, #0x1f]
	movs r0, #1
	strb r0, [r4, #0x1e]
	ldr r0, _0200F500 @ =gUnknown_03001AD1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0200F504
	movs r0, #0x98
	b _0200F50A
	.align 2, 0
_0200F500: .4byte gUnknown_03001AD1
_0200F504:
	movs r0, #0x78
	strh r0, [r4, #0xa]
	movs r0, #0x50
_0200F50A:
	strh r0, [r4, #0x22]
	ldr r0, _0200F518 @ =sub_0200f11c
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200F518: .4byte sub_0200f11c

	thumb_func_start sub_0200f51c
sub_0200f51c: @ 0x0200f51c
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0200F580 @ =gUnknown_03001AD4
	ldrh r0, [r0]
	mov r1, sp
	movs r2, #3
	movs r3, #1
	bl sub_020015cc
	ldr r5, _0200F584 @ =0x0203F810
	movs r1, #0
_0200F532:
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	mov r3, sp
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r4, r1, #0
	cmp r0, #0
	beq _0200F566
	subs r0, #2
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bls _0200F552
	movs r0, #9
	strb r0, [r2]
_0200F552:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, _0200F588 @ =gUnknown_0202E91E
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0x18
	bl CpuSet
_0200F566:
	adds r5, #0x40
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0200F532
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200F580: .4byte gUnknown_03001AD4
_0200F584: .4byte 0x0203F810
_0200F588: .4byte gUnknown_0202E91E

	thumb_func_start sub_0200f58c
sub_0200f58c: @ 0x0200f58c
	push {lr}
	ldr r0, _0200F5A4 @ =gUnknown_0202EB3E
	movs r1, #3
	bl sub_0200163c
	ldr r1, _0200F5A8 @ =gUnknown_03001AE8
	movs r0, #0xa0
	strh r0, [r1]
	bl sub_0200d538
	pop {r0}
	bx r0
	.align 2, 0
_0200F5A4: .4byte gUnknown_0202EB3E
_0200F5A8: .4byte gUnknown_03001AE8

	thumb_func_start sub_0200f5aC
sub_0200f5aC: @ 0x0200f5aC
	push {lr}
	bl sub_020016d8
	bl sub_020012e0
	bl sub_02001420
	bl sub_0200f6b8
	bl sub_02001374
	bl sub_02000eac
	bl sub_0200117c
	bl sub_02001088
	bl sub_0200f51c
	ldr r2, _0200F5F0 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F60E
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0200F5F4
	movs r0, #0x50
	movs r1, #0xff
	bl sub_02001698
	b _0200F604
	.align 2, 0
_0200F5F0: .4byte gUnknown_03003330
_0200F5F4:
	movs r0, #0x50
	movs r1, #0xbf
	bl sub_02001698
	ldr r0, _0200F614 @ =gMPlayInfo_BGM
	movs r1, #1
	bl m4aMPlayFadeOut
_0200F604:
	ldr r0, _0200F618 @ =gUnknown_03003330
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _0200F61C @ =sub_0200F620
	str r1, [r0]
_0200F60E:
	pop {r0}
	bx r0
	.align 2, 0
_0200F614: .4byte gMPlayInfo_BGM
_0200F618: .4byte gUnknown_03003330
_0200F61C: .4byte sub_0200F620

	thumb_func_start sub_0200F620
sub_0200F620: @ 0x0200F620
	push {r4, lr}
	bl sub_020016d8
	bl sub_020012e0
	bl sub_0200f6b8
	ldr r1, _0200F66C @ =0x04000054
	ldr r4, _0200F670 @ =gUnknown_03003330
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0200F664
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0200F662
	ldr r2, _0200F674 @ =gUnknown_03005274
	ldr r0, _0200F678 @ =gUnknown_03001AD4
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0200F67C @ =0x0001869F
	cmp r0, r1
	bls _0200F65C
	str r1, [r2]
_0200F65C:
	bl sub_02000e28
	ldr r0, _0200F680 @ =sub_02001BF8
_0200F662:
	str r0, [r4]
_0200F664:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200F66C: .4byte 0x04000054
_0200F670: .4byte gUnknown_03003330
_0200F674: .4byte gUnknown_03005274
_0200F678: .4byte gUnknown_03001AD4
_0200F67C: .4byte 0x0001869F
_0200F680: .4byte sub_02001BF8

	thumb_func_start Player_Crouch
Player_Crouch: @ 0x0200f684
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x1a]
	subs r1, #1
	strb r1, [r4, #0x1a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x54
	bl sub_02001698
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _0200F6AE
	adds r0, r4, #0
	bl sub_02000ed4
	ldr r2, _0200F6B4 @ =gUnknown_03003330
	ldrb r1, [r2, #0xf]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #0xf]
_0200F6AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200F6B4: .4byte gUnknown_03003330

	thumb_func_start sub_0200f6b8
sub_0200f6b8: @ 0x0200f6b8
	push {lr}
	ldr r0, _0200F6C8 @ =0x0203F800
	ldr r1, _0200F6CC @ =0x06001C80
	movs r2, #0x30
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_0200F6C8: .4byte 0x0203F800
_0200F6CC: .4byte 0x06001C80

	thumb_func_start sub_0200F6D0
sub_0200F6D0: @ 0x0200F6D0
	push {lr}
	movs r2, #0
	movs r1, #0xc1
	strh r1, [r0, #0xa]
	movs r1, #0x80
	strh r1, [r0, #0xe]
	ldr r1, _0200F6F4 @ =gUnknown_0202E560
	str r1, [r0, #0x10]
	strh r2, [r0, #0x14]
	ldr r1, _0200F6F8 @ =sub_0200F78C
	str r1, [r0]
	ldrb r0, [r0, #4]
	movs r1, #0
	bl sub_02001254
	pop {r0}
	bx r0
	.align 2, 0
_0200F6F4: .4byte gUnknown_0202E560
_0200F6F8: .4byte sub_0200F78C

	thumb_func_start sub_0200f6fc
sub_0200f6fc: @ 0x0200f6fc
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x1b]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0200F73C @ =gUnknown_03004400
	adds r4, r4, r0
	ldrh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0xe]
	strh r1, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #3
	bl Mod
	lsls r0, r0, #2
	strh r0, [r5, #0x14]
	ldrh r0, [r4, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200F736
	ldrb r0, [r5, #4]
	movs r1, #0x4f
	bl sub_02001398
_0200F736:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200F73C: .4byte gUnknown_03004400

	thumb_func_start sub_0200f740
sub_0200f740: @ 0x0200f740
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x1b]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0200F784 @ =gUnknown_03004400
	adds r2, r2, r0
	ldrh r0, [r2, #0xa]
	strh r0, [r3, #0xa]
	ldrh r0, [r2, #0xe]
	strh r0, [r3, #0xe]
	ldrb r1, [r2, #7]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0200F788 @ =gUnknown_0202E510
	adds r0, r0, r1
	str r0, [r3, #0x10]
	ldrh r0, [r2, #0xe]
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0200F77E
	ldrb r0, [r3, #4]
	movs r1, #0x4f
	bl sub_02001398
_0200F77E:
	pop {r0}
	bx r0
	.align 2, 0
_0200F784: .4byte gUnknown_03004400
_0200F788: .4byte gUnknown_0202E510

	thumb_func_start sub_0200F78C
sub_0200F78C: @ 0x0200F78C
	push {lr}
	ldrb r0, [r0, #4]
	movs r1, #0
	bl sub_02001254
	pop {r0}
	bx r0
	.align 2, 0
