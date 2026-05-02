.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, _08026518 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov r8, r0
	ldr r2, _0802651C @ =0x0300000C
	adds r7, r3, r2
	ldr r4, _08026520 @ =0x03000044
	adds r4, r3, r4
	str r4, [sp, #4]
	ldr r5, [r0]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08026528
	ldr r6, _08026524 @ =0x0300009A
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	subs r0, #2
	adds r2, #0x8a
	adds r1, r3, r2
	strh r0, [r1]
	b _08026544
	.align 2, 0
_08026518: .4byte gCurTask
_0802651C: .4byte 0x0300000C
_08026520: .4byte 0x03000044
_08026524: .4byte 0x0300009A
_08026528:
	ldr r4, _08026588 @ =0x0300009A
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #3
	lsls r0, r0, #1
	movs r6, #4
	rsbs r6, r6, #0
	adds r1, r6, #0
	subs r1, r1, r0
	ldr r2, _0802658C @ =0x03000096
	adds r0, r3, r2
	strh r1, [r0]
_08026544:
	mov r1, r8
	adds r1, #0x94
	mov r0, r8
	adds r0, #0x96
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r2, r0, r3
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	ldr r0, _08026590 @ =0xFFFFFD00
	str r1, [sp, #0x10]
	cmp r3, r0
	bge _08026598
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r2, r4
	strh r0, [r1]
	mov r2, r8
	adds r2, #0x8c
	ldr r0, _08026594 @ =gSineTable
	movs r6, #0x9c
	lsls r6, r6, #2
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, [r2]
	subs r0, r0, r1
	str r0, [r2]
	mov sb, r2
	b _080265C4
	.align 2, 0
_08026588: .4byte 0x0300009A
_0802658C: .4byte 0x03000096
_08026590: .4byte 0xFFFFFD00
_08026594: .4byte gSineTable
_08026598:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r4, #0x8c
	add r4, r8
	mov sb, r4
	cmp r3, r0
	ble _080265C4
	ldr r6, _08026634 @ =0xFFFFFC00
	adds r0, r2, r6
	ldr r1, [sp, #0x10]
	strh r0, [r1]
	ldr r0, _08026638 @ =gSineTable
	movs r2, #0x9c
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
_080265C4:
	ldr r4, [sp, #0x10]
	movs r6, #0
	ldrsh r1, [r4, r6]
	ldr r0, _0802663C @ =0xFFFFFDC8
	cmp r1, r0
	bgt _08026644
	mov r1, r8
	adds r1, #0x9c
	ldrb r0, [r1]
	cmp r0, #0
	bne _080265FA
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x91
	bl m4aSongNumStart
	movs r0, #0x80
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0x80
	str r1, [sp]
	movs r1, #0x40
	bl CreateScreenShake
_080265FA:
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	ldr r3, _08026640 @ =0x000003FF
	adds r4, r3, #0
	ldr r3, _08026638 @ =gSineTable
	movs r6, #0x9c
	lsls r6, r6, #2
	adds r0, r3, r6
	movs r6, #0
	ldrsh r2, [r0, r6]
	ands r1, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	subs r2, r2, r0
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #9
	rsbs r0, r0, #0
	b _0802669C
	.align 2, 0
_08026634: .4byte 0xFFFFFC00
_08026638: .4byte gSineTable
_0802663C: .4byte 0xFFFFFDC8
_08026640: .4byte 0x000003FF
_08026644:
	cmp r1, #0x37
	ble _080266C4
	mov r1, r8
	adds r1, #0x9c
	ldrb r0, [r1]
	cmp r0, #0
	bne _08026672
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x91
	bl m4aSongNumStart
	movs r0, #0x80
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0x80
	str r1, [sp]
	movs r1, #0x40
	bl CreateScreenShake
_08026672:
	ldr r3, [sp, #0x10]
	ldrh r4, [r3]
	ldr r1, _080266BC @ =0x000003FF
	ldr r3, _080266C0 @ =gSineTable
	movs r6, #0x9c
	lsls r6, r6, #2
	adds r0, r3, r6
	movs r6, #0
	ldrsh r2, [r0, r6]
	ands r1, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	subs r2, r2, r0
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #9
_0802669C:
	str r0, [sp, #8]
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r3, #0x70
	movs r2, #0
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #9
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	b _080266F6
	.align 2, 0
_080266BC: .4byte 0x000003FF
_080266C0: .4byte gSineTable
_080266C4:
	mov r1, r8
	adds r1, #0x9c
	ldrb r0, [r1]
	cmp r0, #1
	bne _080266D2
	movs r0, #0
	strb r0, [r1]
_080266D2:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080266EC
	mov r3, sb
	ldr r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [r3]
	b _080266F6
_080266EC:
	mov r6, sb
	ldr r0, [r6]
	ldr r1, _08026790 @ =0xFFFFFF00
	adds r0, r0, r1
	str r0, [r6]
_080266F6:
	mov r2, r8
	ldrb r1, [r2, #8]
	lsls r1, r1, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r3, sb
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r4, [sp, #8]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	ldrh r1, [r2, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	ldr r5, [sp, #0xc]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r7, #0x10]
	ldr r1, _08026794 @ =0xFFFFFE7F
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r3, _08026798 @ =gPlayer
	ldr r4, [r3, #0x10]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	bne _0802674C
	ldr r2, _0802679C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080267A0 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080267A4 @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _080267A8 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #4]
_0802674C:
	mov r0, r8
	adds r0, #0x9b
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r0
	lsls r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	cmp r1, #0
	beq _08026764
	b _08026A78
_08026764:
	asrs r4, r6, #0x10
	asrs r5, r5, #0x10
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl Coll_Player_Boss_1
	adds r6, r0, #0
	ldr r0, _080267AC @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _080267B4
	ldr r3, _080267B0 @ =gPartner
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl Coll_Player_Boss_1
	b _080267B6
	.align 2, 0
_08026790: .4byte 0xFFFFFF00
_08026794: .4byte 0xFFFFFE7F
_08026798: .4byte gPlayer
_0802679C: .4byte gDispCnt
_080267A0: .4byte 0x00007FFF
_080267A4: .4byte gWinRegs
_080267A8: .4byte gBldRegs
_080267AC: .4byte gNumSingleplayerCharacters
_080267B0: .4byte gPartner
_080267B4:
	movs r0, #0
_080267B6:
	cmp r6, #1
	beq _080267C0
	cmp r0, #1
	beq _080267C0
	b _08026A78
_080267C0:
	mov r1, r8
	adds r1, #0x9a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x20
	mov r6, sl
	strb r0, [r6]
	ldr r1, [sp, #4]
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	adds r1, #0x9e
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r1, _080268BC @ =gLevelScore
	ldr r6, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r6, r2
	str r0, [r1]
	ldr r4, _080268C0 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl Div
	cmp r5, r0
	beq _08026814
	ldr r0, _080268C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08026814
	ldr r1, _080268C8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08026814:
	movs r0, #0x90
	bl m4aSongNumStart
	movs r1, #0
	ldr r3, [sp, #8]
	lsls r4, r3, #8
	mov r6, r8
	adds r6, #0x90
	ldr r0, [sp, #0xc]
	lsls r5, r0, #8
	movs r2, #0x98
	add r2, r8
	mov sl, r2
	movs r3, #0x20
	adds r3, r3, r7
	mov ip, r3
	mov r2, r8
	adds r2, #0x78
	ldr r3, _080268CC @ =Task_80271E4
_0802683A:
	lsls r0, r1, #2
	adds r0, r2, r0
	ldr r0, [r0]
	str r3, [r0, #8]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0802683A
	mov r0, r8
	ldr r1, [r0, #0x74]
	ldr r0, _080268D0 @ =Task_8027600
	str r0, [r1, #8]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	str r5, [r6]
	movs r1, #0
	movs r4, #0
	mov r2, sl
	strh r4, [r2]
	movs r0, #0x99
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	mov r3, ip
	strb r1, [r3]
	ldr r5, [sp, #0x14]
	asrs r0, r5, #0x10
	ldr r6, [sp, #0x18]
	asrs r1, r6, #0x10
	ldr r3, _080268D4 @ =0x00000265
	str r4, [sp]
	movs r2, #0x10
	bl sub_80168F0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	adds r0, #0x46
	adds r1, r2, r0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r1, _080268D8 @ =0x03000048
	adds r0, r2, r1
	strh r4, [r0]
	ldr r5, _080268DC @ =0x03000042
	adds r0, r2, r5
	strh r4, [r0]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080268E4
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r3, #0x32]
	ldr r6, _080268E0 @ =0x03000044
	adds r0, r2, r6
	strh r1, [r0]
	b _080268EE
	.align 2, 0
_080268BC: .4byte gLevelScore
_080268C0: .4byte 0x0000C350
_080268C4: .4byte gGameMode
_080268C8: .4byte gNumLives
_080268CC: .4byte Task_80271E4
_080268D0: .4byte Task_8027600
_080268D4: .4byte 0x00000265
_080268D8: .4byte 0x03000048
_080268DC: .4byte 0x03000042
_080268E0: .4byte 0x03000044
_080268E4:
	ldr r0, _08026944 @ =0x03000044
	adds r1, r2, r0
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
_080268EE:
	adds r1, r3, #0
	adds r1, #0x40
	movs r4, #0
	movs r0, #0x3c
	strh r0, [r1]
	ldr r1, [sp, #0x14]
	asrs r0, r1, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	ldr r3, _08026948 @ =0x00000266
	str r4, [sp]
	movs r2, #0x10
	bl sub_80168F0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	ldr r5, _0802694C @ =0x03000046
	adds r1, r2, r5
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r6, _08026950 @ =0x03000048
	adds r0, r2, r6
	strh r4, [r0]
	ldr r1, _08026954 @ =0x03000042
	adds r0, r2, r1
	strh r4, [r0]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08026958
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r3, #0x32]
	ldr r4, _08026944 @ =0x03000044
	adds r0, r2, r4
	strh r1, [r0]
	b _08026962
	.align 2, 0
_08026944: .4byte 0x03000044
_08026948: .4byte 0x00000266
_0802694C: .4byte 0x03000046
_08026950: .4byte 0x03000048
_08026954: .4byte 0x03000042
_08026958:
	ldr r5, _080269BC @ =0x03000044
	adds r1, r2, r5
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
_08026962:
	adds r1, r3, #0
	adds r1, #0x40
	movs r4, #0
	movs r0, #0x3c
	strh r0, [r1]
	ldr r6, [sp, #0x14]
	asrs r0, r6, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	ldr r3, _080269C0 @ =0x00000267
	str r4, [sp]
	movs r2, #0x10
	bl sub_80168F0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	ldr r5, _080269C4 @ =0x03000046
	adds r1, r2, r5
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r6, _080269C8 @ =0x03000048
	adds r0, r2, r6
	strh r4, [r0]
	ldr r1, _080269CC @ =0x03000042
	adds r0, r2, r1
	strh r4, [r0]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080269D0
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r3, #0x32]
	ldr r4, _080269BC @ =0x03000044
	adds r1, r2, r4
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	b _080269D6
	.align 2, 0
_080269BC: .4byte 0x03000044
_080269C0: .4byte 0x00000267
_080269C4: .4byte 0x03000046
_080269C8: .4byte 0x03000048
_080269CC: .4byte 0x03000042
_080269D0:
	ldr r5, _08026A30 @ =0x03000044
	adds r0, r2, r5
	strh r1, [r0]
_080269D6:
	adds r1, r3, #0
	adds r1, #0x40
	movs r4, #0
	movs r0, #0x3c
	strh r0, [r1]
	ldr r6, [sp, #0x14]
	asrs r0, r6, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	movs r3, #0x9a
	lsls r3, r3, #2
	str r4, [sp]
	movs r2, #0x10
	bl sub_80168F0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	ldr r5, _08026A34 @ =0x03000046
	adds r1, r2, r5
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r6, _08026A38 @ =0x03000048
	adds r0, r2, r6
	strh r4, [r0]
	ldr r1, _08026A3C @ =0x03000042
	adds r0, r2, r1
	strh r4, [r0]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08026A40
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r3, #0x32]
	ldr r4, _08026A30 @ =0x03000044
	adds r1, r2, r4
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	b _08026A46
	.align 2, 0
_08026A30: .4byte 0x03000044
_08026A34: .4byte 0x03000046
_08026A38: .4byte 0x03000048
_08026A3C: .4byte 0x03000042
_08026A40:
	ldr r5, _08026A68 @ =0x03000044
	adds r0, r2, r5
	strh r1, [r0]
_08026A46:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #0x3c
	strh r0, [r1]
	ldr r1, _08026A6C @ =gCamera
	ldrh r0, [r1]
	strh r0, [r1, #0x18]
	adds r0, #0xf0
	strh r0, [r1, #0x1a]
	ldr r0, _08026A70 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08026A74 @ =Task_8026C44
	str r0, [r1, #8]
	bl _call_via_r0
	b _08026C12
	.align 2, 0
_08026A68: .4byte 0x03000044
_08026A6C: .4byte gCamera
_08026A70: .4byte gCurTask
_08026A74: .4byte Task_8026C44
_08026A78:
	ldr r4, _08026AB8 @ =gCamera
	ldrh r1, [r4]
	ldr r6, [sp, #0x14]
	asrs r3, r6, #0x10
	subs r1, r3, r1
	strh r1, [r7, #0x16]
	ldrh r2, [r4, #2]
	ldr r5, [sp, #0x18]
	asrs r0, r5, #0x10
	subs r0, r0, r2
	strh r0, [r7, #0x18]
	ldr r6, [sp, #4]
	strh r1, [r6, #0x16]
	ldrh r0, [r7, #0x18]
	strh r0, [r6, #0x18]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08026AD6
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	subs r0, #0x40
	cmp r3, r0
	bge _08026ABC
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	b _08026AD6
	.align 2, 0
_08026AB8: .4byte gCamera
_08026ABC:
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	adds r0, #0x40
	cmp r3, r0
	ble _08026AD6
	ldr r0, [r7, #0x10]
	ldr r1, _08026B48 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x10]
	ands r0, r1
	str r0, [r3, #0x10]
_08026AD6:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	ldr r0, [sp, #4]
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #2
	bne _08026AF4
	ldr r4, [sp, #4]
	ldrh r0, [r4, #0x18]
	subs r0, #1
	strh r0, [r4, #0x18]
_08026AF4:
	mov r5, sl
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08026B76
	subs r1, #1
	strb r1, [r5]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x10
	ble _08026B60
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08026B68
	ldr r0, _08026B4C @ =gPlayer
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08026B68
	ldr r0, [r7, #0x10]
	adds r1, #0x80
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r2, _08026B50 @ =gDispCnt
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #8
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08026B54 @ =gWinRegs
	ldr r0, _08026B58 @ =0x00003F1F
	strh r0, [r1, #0xa]
	ldr r1, _08026B5C @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	movs r0, #0x10
	strh r0, [r1, #4]
	b _08026B68
	.align 2, 0
_08026B48: .4byte 0xFFFFFBFF
_08026B4C: .4byte gPlayer
_08026B50: .4byte gDispCnt
_08026B54: .4byte gWinRegs
_08026B58: .4byte 0x00003F1F
_08026B5C: .4byte gBldRegs
_08026B60:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08026B82
_08026B68:
	adds r0, r7, #0
	bl DisplaySprite
	ldr r0, [sp, #4]
	bl DisplaySprite
	b _08026B82
_08026B76:
	adds r0, r7, #0
	bl DisplaySprite
	ldr r0, [sp, #4]
	bl DisplaySprite
_08026B82:
	ldr r3, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r3, r0
	cmp r3, #0
	beq _08026BE0
	ldr r2, _08026BC0 @ =gSpriteTransformRotation
	ldr r0, [sp, #0x10]
	ldrh r1, [r0]
	ldr r0, _08026BC4 @ =0x000003FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08026BC8 @ =gSpriteTransformScaleX
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08026BCC @ =gSpriteTransformScaleY
	strh r1, [r0]
	ldr r0, _08026BD0 @ =sa2__gUnknown_03002A8C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08026BD4 @ =sa2__gUnknown_03004D58
	strh r1, [r0]
	ldr r1, _08026BD8 @ =gSpriteTransformX
	mov r3, r8
	ldrh r0, [r3, #0x22]
	strh r0, [r1]
	ldr r1, _08026BDC @ =gSpriteTransformY
	ldrh r0, [r3, #0x24]
	b _08026C0E
	.align 2, 0
_08026BC0: .4byte gSpriteTransformRotation
_08026BC4: .4byte 0x000003FF
_08026BC8: .4byte gSpriteTransformScaleX
_08026BCC: .4byte gSpriteTransformScaleY
_08026BD0: .4byte sa2__gUnknown_03002A8C
_08026BD4: .4byte sa2__gUnknown_03004D58
_08026BD8: .4byte gSpriteTransformX
_08026BDC: .4byte gSpriteTransformY
_08026BE0:
	ldr r2, _08026C24 @ =gSpriteTransformRotation
	ldr r4, [sp, #0x10]
	ldrh r1, [r4]
	ldr r0, _08026C28 @ =0x000003FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08026C2C @ =gSpriteTransformScaleX
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	strh r1, [r0]
	ldr r0, _08026C30 @ =gSpriteTransformScaleY
	strh r1, [r0]
	ldr r0, _08026C34 @ =sa2__gUnknown_03002A8C
	strh r3, [r0]
	ldr r0, _08026C38 @ =sa2__gUnknown_03004D58
	strh r3, [r0]
	ldr r1, _08026C3C @ =gSpriteTransformX
	mov r6, r8
	ldrh r0, [r6, #0x22]
	strh r0, [r1]
	ldr r1, _08026C40 @ =gSpriteTransformY
	ldrh r0, [r6, #0x24]
_08026C0E:
	subs r0, #0x24
	strh r0, [r1]
_08026C12:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026C24: .4byte gSpriteTransformRotation
_08026C28: .4byte 0x000003FF
_08026C2C: .4byte gSpriteTransformScaleX
_08026C30: .4byte gSpriteTransformScaleY
_08026C34: .4byte sa2__gUnknown_03002A8C
_08026C38: .4byte sa2__gUnknown_03004D58
_08026C3C: .4byte gSpriteTransformX
_08026C40: .4byte gSpriteTransformY

.syntax divided
