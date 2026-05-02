.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08055594 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r5, r1     @ r4 = strcMain
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #6]
	adds r6, r0, r1     @ r6 = strc1
	ldr r0, [r4, #0x10]
	ldrh r0, [r0, #6]
	adds r7, r0, r1     @ r7 = strc2
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov r8, r0          @ r8 = strc3
	ldr r0, [r4, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sb, r0          @ sb = strc4
	ldr r0, [r4, #0x1c]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sl, r0          @ sl = strc5
	ldr r0, [r4, #0x20]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp]        @ sp00 = strc6
	ldr r0, _08055598 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080554E8
	ldr r0, _0805559C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080554E8
	ldrh r0, [r4, #0x24]
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb2
	bhi _080554E8
	movs r0, #0xd7
	strh r0, [r4, #0x24]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #6
	subs r0, r0, r1
	movs r1, #0xa
	bl Div
	strh r0, [r4, #8]
	ldr r1, _080555A0 @ =0x03000027
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080554E8
	adds r0, r4, #0
	bl sub_805423C
	ldr r2, _080555A4 @ =0x03000026
	adds r1, r5, r2
	strb r0, [r1]
_080554E8:
	ldrh r0, [r4, #0x24]
	strh r0, [r6, #0x18]
	ldrh r0, [r4, #0x24]
	strh r0, [r7, #0x18]
	ldrh r0, [r4, #0x24]
	mov r1, r8
	strh r0, [r1, #0x18]
	ldrh r0, [r4, #0x24]
	mov r2, sb
	strh r0, [r2, #0x18]
	ldrh r0, [r4, #0x24]
	mov r1, sl
	strh r0, [r1, #0x18]
	ldrh r0, [r4, #0x24]
	ldr r2, [sp]
	strh r0, [r2, #0x18]
	adds r5, r4, #0
	adds r5, #0x26
	ldrb r1, [r5]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]       @ strc1->unk20 = strcMain->unk26;
	ldrb r1, [r5]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrb r1, [r5]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	ldrb r1, [r5]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
	ldrb r1, [r5]
	mov r0, sl
	adds r0, #0x20
	strb r1, [r0]
	ldrb r1, [r5]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	ldrb r2, [r1]
	adds r0, r6, #0
	adds r0, #0x21
	strb r2, [r0]
	ldrb r2, [r1]
	adds r0, r7, #0
	adds r0, #0x21
	strb r2, [r0]
	ldrb r2, [r1]
	mov r0, r8
	adds r0, #0x21
	strb r2, [r0]
	ldrb r2, [r1]
	mov r0, sb
	adds r0, #0x21
	strb r2, [r0]
	ldrb r2, [r1]
	mov r0, sl
	adds r0, #0x21
	strb r2, [r0]
	ldrb r2, [r1]
	ldr r0, [sp]
	adds r0, #0x21
	strb r2, [r0]
	ldrb r0, [r1]
	adds r6, r1, #0
	cmp r0, #0
	bne _080555AE
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	cmp r1, #0x69
	ble _08055586
	ldrb r0, [r5]
	cmp r0, #0
	bne _080555AE
_08055586:
	cmp r1, #0x14
	ble _080555A8
	adds r0, r4, #0
	bl sub_805423C
	strb r0, [r5]
	b _080555AE
	.align 2, 0
_08055594: .4byte gCurTask
_08055598: .4byte gPressedKeys
_0805559C: .4byte gGameMode
_080555A0: .4byte 0x03000027
_080555A4: .4byte 0x03000026
_080555A8:
	adds r0, r4, #0
	bl sub_80543A4
_080555AE:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe1
	bgt _080555BE
	b _08055708
_080555BE:
	ldrb r3, [r6]
	cmp r3, #0
	bne _080555D4
	ldr r2, _080556AC @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080556B0 @ =0x00001FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080556B4 @ =gBldRegs
	strh r3, [r0]
	strh r3, [r0, #4]
_080555D4:
	ldr r0, _080556B8 @ =gGameMode
	ldrb r0, [r0]
	ldr r1, _080556BC @ =gPlayer
	mov r8, r1
	ldr r2, _080556C0 @ =gStageFlags
	mov sb, r2
	ldr r1, _080556C4 @ =gPartner
	mov sl, r1
	ldr r2, _080556C8 @ =gFinalBossActive
	mov ip, r2
	cmp r0, #1      @ IS_MULTI_PLAYER
	bls _08055622
	ldr r1, _080556CC @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	cmp r0, #0
	beq _0805561C
	movs r7, #0xc0
	lsls r7, r7, #0x12
	movs r6, #3
	rsbs r6, r6, #0
	adds r3, r1, #0
	adds r5, r3, #0
	adds r2, r3, #0
	adds r2, #0xc
_08055604_loop:
	ldm r5!, {r0}
	ldrh r1, [r0, #6]
	adds r1, r1, r7
	ldr r0, [r1, #0x5c]
	ands r0, r6
	str r0, [r1, #0x5c]
	adds r3, #4
	cmp r5, r2
	bhi _0805561C
	ldr r0, [r3]
	cmp r0, #0
	bne _08055604_loop
_0805561C:
	movs r0, #0x78
	mov r1, r8
	strh r0, [r1, #0x1c]
_08055622:
	mov r2, sb      @ r2 = sb = gStageFlags
	ldrh r1, [r2]
	ldr r0, _080556D0 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2]
	mov r1, r8
	ldr r0, [r1, #0x10]
	ldr r1, _080556D4 @ =0xFFDFFFFF
	ands r0, r1
	mov r2, r8
	str r0, [r2, #0x10]
	mov r2, sl
	ldr r0, [r2, #0x10]
	ands r0, r1
	str r0, [r2, #0x10]
	ldr r3, _080556D8 @ =gCurrentLevel
	ldrb r0, [r3]
	mov r1, ip
	strb r0, [r1]
	mov r2, r8
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r2, sb
	ldrh r1, [r2]
	ldr r0, _080556DC @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r3]
	subs r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08055672
	bl LoadPalette423Anim
	bl InitWaterPalettes
_08055672:
	ldr r0, [r4, #0x20]
	bl TaskDestroy
	ldr r0, [r4, #0x1c]
	bl TaskDestroy
	ldr r0, [r4, #0x18]
	bl TaskDestroy
	ldr r0, [r4, #0x14]
	bl TaskDestroy
	ldr r0, [r4, #0x10]
	bl TaskDestroy
	ldr r0, [r4, #0xc]
	bl TaskDestroy
	ldr r0, _080556E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r0, _080556B8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	bhi _080556E4
	bl CreateStageUI
	b _080556E8
	.align 2, 0
_080556AC: .4byte gDispCnt
_080556B0: .4byte 0x00001FFF
_080556B4: .4byte gBldRegs
_080556B8: .4byte gGameMode
_080556BC: .4byte gPlayer
_080556C0: .4byte gStageFlags
_080556C4: .4byte gPartner
_080556C8: .4byte gFinalBossActive
_080556CC: .4byte gMultiplayerPlayerTasks
_080556D0: .4byte 0x0000FFFE
_080556D4: .4byte 0xFFDFFFFF
_080556D8: .4byte gCurrentLevel
_080556DC: .4byte 0x0000FFDF
_080556E0: .4byte gCurTask
_080556E4:
	bl CreateChaoHuntHUD
_080556E8:
	ldr r0, _08055704 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	bne _0805571A
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #0xa0
	lsls r1, r1, #7
	bl sub_804A5D8
	b _0805571A
	.align 2, 0
_08055704: .4byte gCurrentLevel
_08055708:
	ldr r0, _0805572C @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0805571A
	bl InitWaterPalettes
_0805571A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805572C: .4byte gCurrentLevel

.syntax divided
