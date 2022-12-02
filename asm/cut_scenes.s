.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80932C8
sub_80932C8: @ 0x080932C8
	push {r4, r5, r6, lr}
	ldr r6, _0809333C @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08093340 @ =IWRAM_START + 0x32C
	adds r5, r0, r1
	movs r0, #1
	strh r0, [r5, #2]
	ldr r0, _08093344 @ =0x00003FFF
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl sub_8093FA0
	adds r0, r4, #0
	bl sub_8093FF0
	adds r0, r4, #0
	bl sub_80934B8
	adds r0, r4, #0
	bl sub_8093638
	adds r0, r4, #0
	bl sub_8093740
	adds r0, r4, #0
	bl sub_809401C
	adds r0, r4, #0
	bl sub_8094044
	adds r0, r4, #0
	bl sub_8094060
	adds r0, r4, #0
	bl sub_80940BC
	adds r0, r4, #0
	bl sub_8093868
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08093336
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _08093348 @ =sub_8093F54
	str r0, [r1, #8]
_08093336:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809333C: .4byte gCurTask
_08093340: .4byte IWRAM_START + 0x32C
_08093344: .4byte 0x00003FFF
_08093348: .4byte sub_8093F54

	thumb_func_start sub_809334C
sub_809334C: @ 0x0809334C
	push {r4, r5, r6, lr}
	ldr r0, _0809340C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8093FA0
	adds r0, r5, #0
	bl sub_8093FF0
	adds r0, r5, #0
	bl sub_80934B8
	adds r0, r5, #0
	bl sub_8093638
	adds r0, r5, #0
	bl sub_8093740
	adds r0, r5, #0
	bl sub_809401C
	adds r0, r5, #0
	bl sub_8094044
	adds r0, r5, #0
	bl sub_8094060
	adds r0, r5, #0
	bl sub_80940BC
	adds r0, r5, #0
	bl sub_8093868
	ldr r0, _08093410 @ =IWRAM_START + 0x5E4
	adds r3, r4, r0
	ldr r2, _08093414 @ =gUnknown_080E1944
	ldr r1, _08093418 @ =IWRAM_START + 0x338
	adds r0, r4, r1
	ldrb r6, [r0]
	lsls r0, r6, #1
	adds r1, #3
	adds r4, r4, r1
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _0809341C @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3]
	cmp r1, r0
	beq _080933D4
	adds r1, r4, #0
	cmp r1, #0
	bne _080933CC
	cmp r6, #3
	bhi _080933D4
_080933CC:
	cmp r1, #1
	bne _080934A8
	cmp r6, #4
	bls _080934A8
_080933D4:
	ldr r1, _08093420 @ =0x0000033B
	adds r0, r5, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080933EA
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #5
	bls _080933FA
_080933EA:
	cmp r1, #1
	bne _080934A0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #6
	bhi _080934A0
_080933FA:
	ldr r2, _08093424 @ =0x00000342
	adds r6, r5, r2
	ldrh r0, [r6]
	cmp r0, #0
	beq _08093428
	subs r0, #1
	strh r0, [r6]
	b _080934A8
	.align 2, 0
_0809340C: .4byte gCurTask
_08093410: .4byte IWRAM_START + 0x5E4
_08093414: .4byte gUnknown_080E1944
_08093418: .4byte IWRAM_START + 0x338
_0809341C: .4byte gBgScrollRegs
_08093420: .4byte 0x0000033B
_08093424: .4byte 0x00000342
_08093428:
	ldr r3, _08093464 @ =gUnknown_080E1B14
	movs r0, #0xce
	lsls r0, r0, #2
	adds r2, r5, r0
	ldr r1, _08093468 @ =0x0000033B
	adds r4, r5, r1
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	ldrb r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6]
	ldrb r3, [r2]
	adds r1, r3, #1
	strb r1, [r2]
	ldrb r0, [r4]
	cmp r0, #0
	beq _080934A8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08093470
	ldr r2, _0809346C @ =0x0000033A
	adds r0, r5, r2
	strb r1, [r0]
	b _080934A8
	.align 2, 0
_08093464: .4byte gUnknown_080E1B14
_08093468: .4byte 0x0000033B
_0809346C: .4byte 0x0000033A
_08093470:
	subs r0, r3, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0809348C
	ldr r0, _08093488 @ =0x0000033A
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080934A8
	.align 2, 0
_08093488: .4byte 0x0000033A
_0809348C:
	cmp r1, #4
	bls _080934A8
	ldr r2, _0809349C @ =0x0000033A
	adds r1, r5, r2
	movs r0, #4
	strb r0, [r1]
	b _080934A8
	.align 2, 0
_0809349C: .4byte 0x0000033A
_080934A0:
	ldr r0, _080934B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080934B4 @ =sub_80932C8
	str r0, [r1, #8]
_080934A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080934B0: .4byte gCurTask
_080934B4: .4byte sub_80932C8

	thumb_func_start sub_80934B8
sub_80934B8: @ 0x080934B8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08093500 @ =0x000005E4
	adds r6, r4, r0
	ldr r3, _08093504 @ =gUnknown_080E1944
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r5, [r0]
	lsls r1, r5, #1
	ldr r2, _08093508 @ =0x0000033B
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	ldr r2, _0809350C @ =gBgScrollRegs
	movs r7, #6
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6]
	adds r7, r2, #0
	cmp r1, r0
	bge _08093510
	cmp r5, #0
	bne _08093518
	movs r2, #0xc8
	lsls r2, r2, #2
	adds r0, r1, r2
	str r0, [r6]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r1, r4, r3
	b _08093624
	.align 2, 0
_08093500: .4byte 0x000005E4
_08093504: .4byte gUnknown_080E1944
_08093508: .4byte 0x0000033B
_0809350C: .4byte gBgScrollRegs
_08093510:
	cmp r5, #0
	bne _08093518
	str r0, [r6]
	b _0809361E
_08093518:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
	cmp r1, #1
	bne _08093530
	ldr r5, _0809352C @ =0x000005E4
	adds r2, r4, r5
	b _08093604
	.align 2, 0
_0809352C: .4byte 0x000005E4
_08093530:
	ldr r0, _08093544 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08093548
	cmp r1, #5
	beq _0809354C
	b _080935F8
	.align 2, 0
_08093544: .4byte gSelectedCharacter
_08093548:
	cmp r1, #4
	bne _080935F8
_0809354C:
	ldr r7, _080935B8 @ =0x00000342
	adds r0, r4, r7
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093596
	ldr r0, _080935BC @ =0x0000033E
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0x22
	bhi _08093568
	adds r0, #1
	strb r0, [r3]
_08093568:
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r2, r4, r1
	ldr r1, _080935C0 @ =gUnknown_080E1B30
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r5, #0xf0
	lsls r5, r5, #7
	adds r0, r0, r5
	str r0, [r2]
	ldr r7, _080935C4 @ =0x000005E4
	adds r2, r4, r7
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r2]
_08093596:
	ldr r2, _080935B8 @ =0x00000342
	adds r0, r4, r2
	ldrh r0, [r0]
	cmp r0, #0x31
	bhi _080935C8
	movs r3, #0xd0
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	movs r5, #0xc8
	lsls r5, r5, #2
	adds r1, r4, r5
	ldrh r0, [r1]
	adds r0, #3
	b _080935DE
	.align 2, 0
_080935B8: .4byte 0x00000342
_080935BC: .4byte 0x0000033E
_080935C0: .4byte gUnknown_080E1B30
_080935C4: .4byte 0x000005E4
_080935C8:
	movs r7, #0xd0
	lsls r7, r7, #2
	adds r1, r4, r7
	ldrh r0, [r1]
	adds r0, #8
	strh r0, [r1]
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #0x14
_080935DE:
	strh r0, [r1]
	ldr r1, _080935F4 @ =0x00000342
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, #1
	bne _0809362A
	movs r0, #0xd4
	bl m4aSongNumStart
	b _0809362A
	.align 2, 0
_080935F4: .4byte 0x00000342
_080935F8:
	ldr r5, _08093630 @ =0x000005E4
	adds r2, r4, r5
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
_08093604:
	lsls r1, r1, #1
	ldr r5, _08093634 @ =0x0000033B
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	movs r3, #6
	ldrsh r1, [r7, r3]
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2]
_0809361E:
	movs r5, #0xbc
	lsls r5, r5, #3
	adds r1, r4, r5
_08093624:
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
_0809362A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093630: .4byte 0x000005E4
_08093634: .4byte 0x0000033B

	thumb_func_start sub_8093638
sub_8093638: @ 0x08093638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	movs r6, #0
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r6, r0
	bge _08093728
	movs r0, #0xd5
	lsls r0, r0, #2
	add r0, ip
	mov r8, r0
	movs r7, #0xd7
	lsls r7, r7, #2
	add r7, ip
	ldr r1, _0809369C @ =gSineTable
	mov sl, r1
	mov sb, r6
	movs r2, #0xd3
	lsls r2, r2, #2
	add r2, ip
	str r2, [sp]
_08093674:
	lsls r3, r6, #2
	adds r0, r3, r6
	lsls r4, r0, #2
	mov r0, r8
	adds r2, r0, r4
	ldr r1, _080936A0 @ =gUnknown_080E1964
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bhi _080936A4
	adds r0, r7, r4
	mov r2, sb
	str r2, [r0]
	b _080936AA
	.align 2, 0
_0809369C: .4byte gSineTable
_080936A0: .4byte gUnknown_080E1964
_080936A4:
	adds r1, r7, r4
	movs r0, #1
	str r0, [r1]
_080936AA:
	adds r0, r3, r6
	lsls r3, r0, #2
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	ldr r5, _08093738 @ =0x0003FFFF
	cmp r0, r5
	ble _080936BE
	mov r1, sb
	str r1, [r2]
_080936BE:
	ldr r0, [sp]
	adds r1, r0, r3
	ldr r0, [r2]
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	movs r0, #0xd6
	lsls r0, r0, #2
	add r0, ip
	adds r4, r0, r3
	ldr r1, _0809373C @ =gUnknown_080E1968
	adds r0, r3, r1
	ldr r1, [r0]
	lsls r1, r1, #3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	cmp r0, r5
	ble _080936F4
	mov r2, sb
	str r2, [r4]
_080936F4:
	movs r2, #0xd4
	lsls r2, r2, #2
	add r2, ip
	adds r2, r2, r3
	ldr r0, [r4]
	asrs r0, r0, #8
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r6, r0
	blt _08093674
_08093728:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093738: .4byte 0x0003FFFF
_0809373C: .4byte gUnknown_080E1968

	thumb_func_start sub_8093740
sub_8093740: @ 0x08093740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	movs r5, #0
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r5, r0
	bge _0809384E
	movs r0, #0x9c
	lsls r0, r0, #3
	add r0, ip
	mov r8, r0
	ldr r1, _080937B4 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r1, r2]
	movs r3, #0xbe
	mov sl, r3
	subs r0, r3, r0
	lsls r0, r0, #8
	str r0, [sp]
	ldr r4, _080937B8 @ =gUnknown_030053B8
	mov sb, r4
	ldr r6, _080937BC @ =0x000004EC
	add r6, ip
	ldr r7, _080937C0 @ =0x000004DC
	add r7, ip
_08093786:
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r2, r0, #2
	mov r3, r8
	adds r0, r3, r2
	ldr r0, [r0]
	adds r4, r1, #0
	ldr r1, [sp]
	cmp r0, r1
	bne _080937D2
	mov r3, sb
	ldr r1, [r3]
	ldr r0, _080937C4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080937C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	cmp r0, #0
	bge _080937CC
	adds r1, r6, r2
	movs r0, #1
	rsbs r0, r0, #0
	b _080937D0
	.align 2, 0
_080937B4: .4byte gBgScrollRegs
_080937B8: .4byte gUnknown_030053B8
_080937BC: .4byte 0x000004EC
_080937C0: .4byte 0x000004DC
_080937C4: .4byte 0x00196225
_080937C8: .4byte 0x3C6EF35F
_080937CC:
	adds r1, r6, r2
	movs r0, #1
_080937D0:
	str r0, [r1]
_080937D2:
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r2, r7, r0
	adds r0, r6, r0
	ldr r0, [r0]
	lsls r0, r0, #7
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #9
	cmp r1, r3
	ble _080937F4
	movs r0, #0xa
	rsbs r0, r0, #0
	str r0, [r2]
	b _080937FE
_080937F4:
	movs r0, #0xa
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080937FE
	str r3, [r2]
_080937FE:
	adds r1, r4, r5
	lsls r1, r1, #2
	mov r2, r8
	adds r3, r2, r1
	ldr r4, _08093860 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r4, r2]
	mov r4, sl
	subs r0, r4, r0
	lsls r2, r0, #8
	adds r1, r7, r1
	ldr r0, [r1]
	asrs r0, r0, #7
	lsls r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, _08093864 @ =gSineTable
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _08093830
	rsbs r0, r0, #0
_08093830:
	lsls r0, r0, #3
	subs r0, r2, r0
	str r0, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r5, r0
	blt _08093786
_0809384E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093860: .4byte gBgScrollRegs
_08093864: .4byte gSineTable

	thumb_func_start sub_8093868
sub_8093868: @ 0x08093868
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r0, r0, r5
	mov ip, r0
	ldr r0, _08093894 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #1
	bne _08093898
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #4
	bls _080938A4
	b _08093970
	.align 2, 0
_08093894: .4byte gSelectedCharacter
_08093898:
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0809394E
_080938A4:
	adds r6, r5, #0
	adds r6, #0x80
	movs r3, #0xce
	lsls r3, r3, #2
	adds r4, r5, r3
	ldrb r1, [r4]
	cmp r1, #2
	bhi _080938C4
	ldr r3, _080938BC @ =gUnknown_080E17A4
	ldr r2, _080938C0 @ =gUnknown_080E1C48
	b _0809390E
	.align 2, 0
_080938BC: .4byte gUnknown_080E17A4
_080938C0: .4byte gUnknown_080E1C48
_080938C4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	bne _08093908
	cmp r1, #4
	bhi _080938F8
	ldr r2, _080938F0 @ =gUnknown_080E17A4
	ldr r1, _080938F4 @ =gUnknown_080E1C4E
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	b _08093930
	.align 2, 0
_080938F0: .4byte gUnknown_080E17A4
_080938F4: .4byte gUnknown_080E1C4E
_080938F8:
	ldr r3, _08093900 @ =gUnknown_080E17A4
	ldr r2, _08093904 @ =gUnknown_080E1C4E
	b _0809390C
	.align 2, 0
_08093900: .4byte gUnknown_080E17A4
_08093904: .4byte gUnknown_080E1C4E
_08093908:
	ldr r3, _08093964 @ =gUnknown_080E17A4
	ldr r2, _08093968 @ =gUnknown_080E1C48
_0809390C:
	ldrb r1, [r4]
_0809390E:
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r4]
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
_08093930:
	ldrb r1, [r0, #6]
	adds r0, r5, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r2, _0809396C @ =0x000005E4
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
_0809394E:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	beq _08093970
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	beq _0809397C
	b _080939B6
	.align 2, 0
_08093964: .4byte gUnknown_080E17A4
_08093968: .4byte gUnknown_080E1C48
_0809396C: .4byte 0x000005E4
_08093970:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _080939B6
_0809397C:
	adds r6, r5, #0
	adds r6, #0xb0
	movs r2, #0xbc
	lsls r2, r2, #3
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r3, _080939DC @ =0x000005E4
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	movs r0, #0xd0
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	mov r2, ip
	strh r0, [r2, #2]
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r2, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r2, #8]
	adds r0, r6, #0
	mov r1, ip
	bl sub_8004860
_080939B6:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, _080939E0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080939E4
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080939F0
	b _08093A7E
	.align 2, 0
_080939DC: .4byte 0x000005E4
_080939E0: .4byte gSelectedCharacter
_080939E4:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #5
	bls _08093A7E
_080939F0:
	adds r6, r5, #0
	adds r6, #0xe0
	ldr r3, _08093A28 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	beq _08093A34
	ldr r2, _08093A2C @ =gUnknown_080E17A4
	ldr r0, _08093A30 @ =gUnknown_080E1C48
	ldrb r1, [r0, #5]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	b _08093A5A
	.align 2, 0
_08093A28: .4byte gSelectedCharacter
_08093A2C: .4byte gUnknown_080E17A4
_08093A30: .4byte gUnknown_080E1C48
_08093A34:
	ldr r2, _08093B5C @ =gUnknown_080E17A4
	ldr r0, _08093B60 @ =gUnknown_080E1C4E
	ldrb r1, [r0, #6]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r5, r3
_08093A5A:
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r2, _08093B64 @ =0x000005E4
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093A7E:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08093B00
	ldr r0, _08093B68 @ =0x0000033D
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093B00
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r1, _08093B5C @ =gUnknown_080E17A4
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r3, #0x8f
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrb r1, [r0]
	adds r2, #0xa4
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r7, r5, #0
	adds r7, #0x96
	ldrh r0, [r7]
	strh r0, [r6, #0x16]
	adds r4, r5, #0
	adds r4, #0x98
	ldrh r0, [r4]
	adds r0, #0x19
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	ldr r1, _08093B6C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	ldrh r0, [r7]
	strh r0, [r6, #0x16]
	ldrh r0, [r4]
	adds r0, #0x19
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #1
	beq _08093AFA
	movs r0, #1
	mov r3, r8
	strb r0, [r3]
_08093AFA:
	adds r0, r6, #0
	bl sub_80051E8
_08093B00:
	movs r4, #0
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r4, r0
	bge _08093BD4
	ldr r7, _08093B70 @ =gUnknown_080E1964
	movs r2, #0x10
	adds r2, r2, r7
	mov r8, r2
_08093B1A:
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r3, #0x98
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r5, r0
	ldr r0, _08093B5C @ =gUnknown_080E17A4
	adds r1, #0x24
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #2
	adds r3, #0xfc
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08093B74
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _08093B7A
	.align 2, 0
_08093B5C: .4byte gUnknown_080E17A4
_08093B60: .4byte gUnknown_080E1C4E
_08093B64: .4byte 0x000005E4
_08093B68: .4byte 0x0000033D
_08093B6C: .4byte 0xFFFFFBFF
_08093B70: .4byte gUnknown_080E1964
_08093B74:
	ldr r0, [r6, #0x10]
	ldr r1, _08093BE0 @ =0xFFFFFBFF
	ands r0, r1
_08093B7A:
	str r0, [r6, #0x10]
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r0, r7, #0
	adds r0, #0xc
	adds r0, r2, r0
	ldr r1, [r0]
	movs r3, #0xd3
	lsls r3, r3, #2
	adds r0, r5, r3
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x16]
	mov r1, r8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08093BE4 @ =gBgScrollRegs
	ldrh r0, [r0, #6]
	subs r1, r1, r0
	adds r3, #4
	adds r0, r5, r3
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r4, r0
	blt _08093B1A
_08093BD4:
	movs r4, #0
	movs r2, #0xcf
	lsls r2, r2, #2
	adds r0, r5, r2
	b _08093C72
	.align 2, 0
_08093BE0: .4byte 0xFFFFFBFF
_08093BE4: .4byte gBgScrollRegs
_08093BE8:
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r5, r0
	ldr r0, _08093C2C @ =gUnknown_080E17A4
	adds r1, #0x26
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #2
	ldr r3, _08093C30 @ =0x000004EC
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	ble _08093C34
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _08093C3A
	.align 2, 0
_08093C2C: .4byte gUnknown_080E17A4
_08093C30: .4byte 0x000004EC
_08093C34:
	ldr r0, [r6, #0x10]
	ldr r1, _08093CD4 @ =0xFFFFFBFF
	ands r0, r1
_08093C3A:
	str r0, [r6, #0x10]
	adds r1, r2, r4
	lsls r1, r1, #2
	ldr r2, _08093CD8 @ =0x000004DC
	adds r0, r5, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	movs r3, #0x9c
	lsls r3, r3, #3
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
_08093C72:
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r4, r0
	blt _08093BE8
	ldr r2, _08093CDC @ =0x0000034A
	adds r4, r5, r2
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r2, [r4, r3]
	cmp r2, #0
	ble _08093CE8
	movs r0, #0xe8
	lsls r0, r0, #1
	adds r6, r5, r0
	ldr r1, _08093CE0 @ =gUnknown_080E17A4
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r3, #0xa3
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrb r1, [r0]
	adds r2, #0xac
	adds r0, r5, r2
	strb r1, [r0]
	movs r3, #0xbe
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r1, _08093CE4 @ =0x000005F4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r0, [r4]
	subs r0, #1
	b _08093D02
	.align 2, 0
_08093CD4: .4byte 0xFFFFFBFF
_08093CD8: .4byte 0x000004DC
_08093CDC: .4byte 0x0000034A
_08093CE0: .4byte gUnknown_080E17A4
_08093CE4: .4byte 0x000005F4
_08093CE8:
	adds r0, r1, #0
	adds r0, #0x1d
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08093CF8
	subs r0, r1, #1
	b _08093D02
_08093CF8:
	movs r0, #0x1e
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _08093D04
	movs r0, #0x32
_08093D02:
	strh r0, [r4]
_08093D04:
	ldr r0, _08093D20 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08093D24
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08093D30
	b _08093DBE
	.align 2, 0
_08093D20: .4byte gSelectedCharacter
_08093D24:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	bls _08093DB0
_08093D30:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r4, _08093E60 @ =gUnknown_080E17A4
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r2, #0xa7
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r1, [r0]
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r2, _08093E64 @ =0x000005FC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r3, #0x8c
	lsls r3, r3, #2
	adds r6, r5, r3
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r2, #0xab
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r3, #0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r2, _08093E68 @ =0x00000604
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093DB0:
	ldr r0, _08093E6C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08093DBE
	b _08093EC8
_08093DBE:
	movs r3, #0x88
	lsls r3, r3, #1
	adds r6, r5, r3
	ldr r4, _08093E60 @ =gUnknown_080E17A4
	ldr r2, _08093E70 @ =gUnknown_080E1C55
	ldr r0, _08093E74 @ =0x0000033A
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	movs r3, #0xbd
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r1, _08093E78 @ =0x000005EC
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r2, #0xce
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #5
	bhi _08093E80
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r6, r5, r3
	adds r0, #0x2b
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	adds r0, #0x2b
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	subs r0, #0x14
	strh r0, [r6, #0x16]
	ldr r1, _08093E7C @ =0x000005E4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	subs r0, #0x14
	b _08093EBA
	.align 2, 0
_08093E60: .4byte gUnknown_080E17A4
_08093E64: .4byte 0x000005FC
_08093E68: .4byte 0x00000604
_08093E6C: .4byte gSelectedCharacter
_08093E70: .4byte gUnknown_080E1C55
_08093E74: .4byte 0x0000033A
_08093E78: .4byte 0x000005EC
_08093E7C: .4byte 0x000005E4
_08093E80:
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r6, r5, r2
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r1, #0xc7
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r2, #0x20
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	ldr r1, _08093ED4 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, _08093ED8 @ =0x000005E4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
_08093EBA:
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093EC8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093ED4: .4byte 0xFFFFFBFF
_08093ED8: .4byte 0x000005E4

	thumb_func_start sub_8093EDC
sub_8093EDC: @ 0x08093EDC
	push {r4, r5, r6, lr}
	ldr r6, _08093F48 @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08093F4C @ =IWRAM_START + 0x32C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8093FA0
	adds r0, r4, #0
	bl sub_8093FF0
	adds r0, r4, #0
	bl sub_80934B8
	adds r0, r4, #0
	bl sub_8093638
	adds r0, r4, #0
	bl sub_8093740
	adds r0, r4, #0
	bl sub_809401C
	adds r0, r4, #0
	bl sub_8094044
	adds r0, r4, #0
	bl sub_8094060
	adds r0, r4, #0
	bl sub_80940BC
	adds r0, r4, #0
	bl sub_8093868
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08093F42
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _08093F50 @ =sub_809334C
	str r0, [r1, #8]
_08093F42:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093F48: .4byte gCurTask
_08093F4C: .4byte IWRAM_START + 0x32C
_08093F50: .4byte sub_809334C

	thumb_func_start sub_8093F54
sub_8093F54: @ 0x08093F54
	push {r4, lr}
	ldr r4, _08093F7C @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _08093F80 @ =IWRAM_START + 0x344
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _08093F84
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08093F94
	movs r0, #0x2c
	bl m4aSongNumStart
	b _08093F94
	.align 2, 0
_08093F7C: .4byte gCurTask
_08093F80: .4byte IWRAM_START + 0x344
_08093F84:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
_08093F94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8093F9C
sub_8093F9C: @ 0x08093F9C
	bx lr
	.align 2, 0

	thumb_func_start sub_8093FA0
sub_8093FA0: @ 0x08093FA0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _08093FBC @ =gBgScrollRegs
	movs r3, #2
	ldrsh r1, [r0, r3]
	adds r3, r0, #0
	cmp r1, #0x4b
	bgt _08093FC4
	ldr r4, _08093FC0 @ =0x00000614
	adds r1, r2, r4
	ldr r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #2
	b _08093FCE
	.align 2, 0
_08093FBC: .4byte gBgScrollRegs
_08093FC0: .4byte 0x00000614
_08093FC4:
	ldr r0, _08093FEC @ =0x00000614
	adds r1, r2, r0
	ldr r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #1
_08093FCE:
	adds r0, r0, r4
	str r0, [r1]
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0x5f
	bgt _08093FE4
	ldr r4, _08093FEC @ =0x00000614
	adds r0, r2, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r3, #2]
_08093FE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093FEC: .4byte 0x00000614

	thumb_func_start sub_8093FF0
sub_8093FF0: @ 0x08093FF0
	push {lr}
	ldr r1, _08094014 @ =0x0000060C
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r0]
	ldr r2, _08094018 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0x41
	bgt _0809400E
	asrs r0, r1, #8
	strh r0, [r2, #6]
_0809400E:
	pop {r0}
	bx r0
	.align 2, 0
_08094014: .4byte 0x0000060C
_08094018: .4byte gBgScrollRegs

	thumb_func_start sub_809401C
sub_809401C: @ 0x0809401C
	movs r1, #0xbd
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x78
	str r1, [r2]
	ldr r3, _0809403C @ =0x000005EC
	adds r0, r0, r3
	ldr r1, _08094040 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r2, [r1, r3]
	movs r1, #0xc2
	subs r1, r1, r2
	lsls r1, r1, #8
	str r1, [r0]
	bx lr
	.align 2, 0
_0809403C: .4byte 0x000005EC
_08094040: .4byte gBgScrollRegs

	thumb_func_start sub_8094044
sub_8094044: @ 0x08094044
	movs r1, #0xbe
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x78
	str r1, [r2]
	ldr r1, _0809405C @ =0x000005F4
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #4
	str r1, [r0]
	bx lr
	.align 2, 0
_0809405C: .4byte 0x000005F4

	thumb_func_start sub_8094060
sub_8094060: @ 0x08094060
	push {lr}
	adds r2, r0, #0
	ldr r0, _08094080 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08094084
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _08094090
	b _080940AE
	.align 2, 0
_08094080: .4byte gSelectedCharacter
_08094084:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _080940AE
_08094090:
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #0x78
	str r1, [r0]
	ldr r3, _080940B4 @ =0x000005FC
	adds r2, r2, r3
	ldr r1, [r2]
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r1, r0
	ble _080940AE
	ldr r3, _080940B8 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_080940AE:
	pop {r0}
	bx r0
	.align 2, 0
_080940B4: .4byte 0x000005FC
_080940B8: .4byte 0xFFFFFD00

	thumb_func_start sub_80940BC
sub_80940BC: @ 0x080940BC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080940DC @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080940E0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _080940EC
	b _0809410A
	.align 2, 0
_080940DC: .4byte gSelectedCharacter
_080940E0:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _0809410A
_080940EC:
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #0x78
	str r1, [r0]
	ldr r3, _08094110 @ =0x00000604
	adds r2, r2, r3
	ldr r1, [r2]
	movs r0, #0x96
	lsls r0, r0, #8
	cmp r1, r0
	ble _0809410A
	ldr r3, _08094114 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0809410A:
	pop {r0}
	bx r0
	.align 2, 0
_08094110: .4byte 0x00000604
_08094114: .4byte 0xFFFFFD00

@; CreateMissingChaosEmaraldsCutScene
	thumb_func_start sub_8094118
sub_8094118: @ 0x08094118
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	ldr r1, _08094204 @ =gDispCnt
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08094208 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0809420C @ =0x00001E03
	strh r0, [r1]
	ldr r0, _08094210 @ =0x00001C05
	strh r0, [r1, #2]
	ldr r3, _08094214 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _08094218 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	str r6, [sp, #4]
	ldr r1, _0809421C @ =0x040000D4
	add r5, sp, #4
	str r5, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08094220 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08094224 @ =sub_8094360
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _08094228 @ =sub_80945A0
	str r1, [sp]
	movs r1, #0xc8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	adds r0, #0xbc
	adds r2, r3, r0
	strb r4, [r2]
	ldr r5, _0809422C @ =IWRAM_START + 0xC0
	adds r1, r3, r5
	movs r0, #0xf0
	str r0, [r1]
	ldr r1, _08094230 @ =IWRAM_START + 0xBD
	adds r0, r3, r1
	strb r4, [r0]
	subs r5, #1
	adds r1, r3, r5
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	subs r5, #1
	adds r0, r3, r5
	strb r4, [r0]
	ldr r4, _08094234 @ =gLoadedSaveGame
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r1]
	ldr r0, [r4]
	ldr r1, _08094238 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080941EC
	movs r0, #1
	strb r0, [r2]
	movs r2, #0
	ldr r0, _08094230 @ =IWRAM_START + 0xBD
	adds r1, r3, r0
_080941D0:
	ldr r0, [r4]
	adds r0, #0x15
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080941E2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080941E2:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080941D0
_080941EC:
	bl m4aMPlayAllStop
	adds r0, r6, #0
	adds r0, #0xbd
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _08094240
	ldr r0, _0809423C @ =0x0000019F
	bl m4aSongNumStart
	b _08094248
	.align 2, 0
_08094204: .4byte gDispCnt
_08094208: .4byte gBgCntRegs
_0809420C: .4byte 0x00001E03
_08094210: .4byte 0x00001C05
_08094214: .4byte gUnknown_03004D80
_08094218: .4byte gUnknown_03002280
_0809421C: .4byte 0x040000D4
_08094220: .4byte 0x85004000
_08094224: .4byte sub_8094360
_08094228: .4byte sub_80945A0
_0809422C: .4byte IWRAM_START + 0xC0
_08094230: .4byte IWRAM_START + 0xBD
_08094234: .4byte gLoadedSaveGame
_08094238: .4byte gSelectedCharacter
_0809423C: .4byte 0x0000019F
_08094240:
	movs r0, #0xcc
	lsls r0, r0, #1
	bl m4aSongNumStart
_08094248:
	adds r1, r6, #0
	adds r1, #0xb0
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	strh r2, [r1, #4]
	movs r0, #0x80
	strh r0, [r1, #6]
	ldr r0, _08094290 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	adds r4, r6, #0
	adds r4, #0xc4
	ldr r0, _08094294 @ =0x06010000
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x80
	str r0, [r3, #4]
	ldrb r0, [r7]
	cmp r0, #3
	bhi _0809429C
	ldr r2, _08094298 @ =gUnknown_080E1CA0
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r2, #4]
	strh r0, [r3, #0xa]
	ldrb r1, [r2, #6]
	adds r0, r6, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r0, #0x55
	b _080942B6
	.align 2, 0
_08094290: .4byte 0x00003FFF
_08094294: .4byte 0x06010000
_08094298: .4byte gUnknown_080E1CA0
_0809429C:
	ldr r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _08094338 @ =gUnknown_080E1CA0
	ldrh r0, [r1, #0xc]
	strh r0, [r3, #0xa]
	ldrb r1, [r1, #0xe]
	adds r0, r6, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r0, #0x5a
_080942B6:
	strh r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r5, #0
	movs r4, #0
	movs r0, #0x78
	strh r0, [r3, #0x16]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r5, [r0]
	str r4, [r3, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	adds r0, r3, #0
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r6, #4]
	strh r4, [r6, #0xa]
	ldr r0, _0809433C @ =0x0600F000
	str r0, [r6, #0xc]
	strh r4, [r6, #0x18]
	strh r4, [r6, #0x1a]
	strh r4, [r6, #0x1e]
	strh r4, [r6, #0x20]
	strh r4, [r6, #0x22]
	strh r4, [r6, #0x24]
	movs r1, #0x1e
	strh r1, [r6, #0x26]
	movs r0, #0x14
	strh r0, [r6, #0x28]
	adds r0, r6, #0
	adds r0, #0x2a
	strb r5, [r0]
	strh r4, [r6, #0x2e]
	adds r2, r6, #0
	adds r2, #0x40
	ldr r0, _08094340 @ =0x06004000
	str r0, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _08094344 @ =0x0600E000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	strh r1, [r2, #0x26]
	ldrb r0, [r7]
	cmp r0, #0
	beq _08094348
	movs r0, #7
	b _0809434A
	.align 2, 0
_08094338: .4byte gUnknown_080E1CA0
_0809433C: .4byte 0x0600F000
_08094340: .4byte 0x06004000
_08094344: .4byte 0x0600E000
_08094348:
	movs r0, #6
_0809434A:
	strh r0, [r2, #0x28]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strh r0, [r2, #0x2e]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094360
sub_8094360: @ 0x08094360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #0
	ldr r0, _080943E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, _080943E8 @ =IWRAM_START + 0xBD
	adds r6, r4, r0
	ldrb r5, [r6]
	cmp r5, #0
	bne _08094400
	ldr r1, _080943EC @ =IWRAM_START + 0xBF
	adds r6, r4, r1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #1
	ble _080943BE
	ldr r2, _080943F0 @ =gDispCnt
	ldrh r0, [r2]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080943F4 @ =gBgScrollRegs
	strh r3, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldr r0, _080943F8 @ =IWRAM_START + 0x40
	adds r3, r4, r0
	ldr r1, _080943FC @ =gUnknown_080E1C5C
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
_080943BE:
	ldr r2, _080943F0 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080943F4 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	mov r3, r8
	ldr r0, _080943FC @ =gUnknown_080E1C5C
	ldrh r0, [r0]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
	b _0809446E
	.align 2, 0
_080943E4: .4byte gCurTask
_080943E8: .4byte IWRAM_START + 0xBD
_080943EC: .4byte IWRAM_START + 0xBF
_080943F0: .4byte gDispCnt
_080943F4: .4byte gBgScrollRegs
_080943F8: .4byte IWRAM_START + 0x40
_080943FC: .4byte gUnknown_080E1C5C
_08094400:
	ldr r7, _08094480 @ =gDispCnt
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r5, _08094484 @ =gBgScrollRegs
	strh r3, [r5]
	strh r3, [r5, #2]
	mov r3, r8
	ldr r0, _08094488 @ =gUnknown_080E1C5C
	mov r8, r0
	ldrh r0, [r0, #0xe]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
	ldrb r0, [r6]
	ldr r1, _0809448C @ =IWRAM_START + 0xBF
	adds r2, r4, r1
	cmp r0, #1
	bhi _08094436
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	ble _0809446E
_08094436:
	ldrh r0, [r7]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7]
	movs r0, #0
	strh r0, [r5, #4]
	movs r0, #0xa0
	strh r0, [r5, #6]
	ldr r7, _08094490 @ =IWRAM_START + 0x40
	adds r3, r4, r7
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, #6
	ldrb r2, [r6]
	subs r2, #1
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xf
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
_0809446E:
	ldr r0, _08094494 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08094498 @ =sub_809449C
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094480: .4byte gDispCnt
_08094484: .4byte gBgScrollRegs
_08094488: .4byte gUnknown_080E1C5C
_0809448C: .4byte IWRAM_START + 0xBF
_08094490: .4byte IWRAM_START + 0x40
_08094494: .4byte gCurTask
_08094498: .4byte sub_809449C

	thumb_func_start sub_809449C
sub_809449C: @ 0x0809449C
	push {r4, r5, r6, lr}
	ldr r6, _080944DC @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r1, _080944E0 @ =IWRAM_START + 0xB0
	adds r4, r5, r1
	movs r1, #2
	strh r1, [r4, #2]
	bl sub_80945A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080944D4
	movs r0, #0
	strh r0, [r4, #4]
	ldr r2, _080944E4 @ =IWRAM_START + 0xBE
	adds r0, r5, r2
	strb r1, [r0]
	ldr r1, [r6]
	ldr r0, _080944E8 @ =sub_8094530
	str r0, [r1, #8]
_080944D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080944DC: .4byte gCurTask
_080944E0: .4byte IWRAM_START + 0xB0
_080944E4: .4byte IWRAM_START + 0xBE
_080944E8: .4byte sub_8094530

	thumb_func_start sub_80944EC
sub_80944EC: @ 0x080944EC
	push {r4, r5, lr}
	ldr r5, _08094524 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r2, _08094528 @ =IWRAM_START + 0xB0
	adds r4, r1, r2
	movs r1, #1
	strh r1, [r4, #2]
	bl sub_80945A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809451E
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _0809452C @ =sub_8094570
	str r0, [r1, #8]
_0809451E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094524: .4byte gCurTask
_08094528: .4byte IWRAM_START + 0xB0
_0809452C: .4byte sub_8094570

	thumb_func_start sub_8094530
sub_8094530: @ 0x08094530
	push {r4, r5, lr}
	ldr r5, _08094554 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_80945A4
	ldr r0, _08094558 @ =IWRAM_START + 0xC0
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0809455C
	subs r0, #1
	str r0, [r4]
	b _08094566
	.align 2, 0
_08094554: .4byte gCurTask
_08094558: .4byte IWRAM_START + 0xC0
_0809455C:
	movs r0, #0xb4
	str r0, [r4]
	ldr r1, [r5]
	ldr r0, _0809456C @ =sub_80944EC
	str r0, [r1, #8]
_08094566:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809456C: .4byte sub_80944EC

	thumb_func_start sub_8094570
sub_8094570: @ 0x08094570
	push {r4, lr}
	ldr r4, _08094588 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _0809458C @ =IWRAM_START + 0xC0
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, #0
	beq _08094590
	subs r0, #1
	str r0, [r1]
	b _0809459A
	.align 2, 0
_08094588: .4byte gCurTask
_0809458C: .4byte IWRAM_START + 0xC0
_08094590:
	bl CreateTitleScreen
	ldr r0, [r4]
	bl TaskDestroy
_0809459A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80945A0
sub_80945A0: @ 0x080945A0
	bx lr
	.align 2, 0

	thumb_func_start sub_80945A4
sub_80945A4: @ 0x080945A4
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0xbd
	ldrb r0, [r0]
	cmp r0, #0
	beq _080945DC
	adds r4, r2, #0
	adds r4, #0x80
	cmp r0, #3
	bls _080945D0
	adds r0, r2, #0
	adds r0, #0xbe
	ldrb r0, [r0]
	cmp r0, #0
	beq _080945D0
	ldr r1, _080945E4 @ =gUnknown_080E1CA0
	ldrh r0, [r1, #0x14]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	adds r0, r2, #0
	adds r0, #0xa0
	strb r1, [r0]
_080945D0:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080945DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080945E4: .4byte gUnknown_080E1CA0
