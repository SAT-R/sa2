.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	ldr r4, _08059778 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r1, _0805977C @ =0x03000018
	adds r0, r0, r1
	bl sub_805423C
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r2, _08059780 @ =0x030000FC
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov sb, r4
	cmp r0, #0x3c
	bgt _08059618
	b _080597CC
_08059618:
	movs r6, #0
	ldr r3, _08059784 @ =gLoadedSaveGame
	mov r8, r3
	ldr r0, _08059788 @ =gUnknown_08688444
	mov sl, r0
_08059622:
	mov r2, sb
	ldr r1, [r2]
	lsls r0, r6, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ldr r3, _0805978C @ =0x030000C8
	adds r0, r0, r3
	movs r1, #0
	ldrsh r5, [r0, r1]
	ldr r2, _08059790 @ =0xFFFFDFFF
	adds r5, r5, r2
	adds r0, r5, #0
	movs r1, #0x28
	bl __udivsi3
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #1
	adds r0, r5, #0
	movs r1, #0x28
	bl __umodsi3
	lsrs r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r0, #0x10
	adds r1, r6, r0
	add r4, sl
	ldrb r4, [r4]
	ldrb r0, [r1]
	cmp r0, r4
	beq _08059666
	movs r7, #1
	strb r4, [r1]
_08059666:
	adds r6, #1
	cmp r6, #5
	bls _08059622
	cmp r7, #0
	beq _08059740
	ldr r0, _08059794 @ =gFrameCount
	ldr r0, [r0]
	mov r3, r8
	str r0, [r3, #4]
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r0, _08059798 @ =gFlags
	mov sl, r0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	orrs r1, r0
	ldr r2, _0805979C @ =0x04000200
	mov r8, r2
	ldrh r0, [r2]
	str r0, [sp]
	ldr r6, _080597A0 @ =0x04000208
	ldrh r0, [r6]
	adds r7, r0, #0
	ldr r5, _080597A4 @ =0x04000004
	ldrh r3, [r5]
	mov sb, r3
	movs r0, #0
	strh r0, [r2]
	ldrh r2, [r2]
	strh r0, [r6]
	ldrh r2, [r6]
	strh r0, [r5]
	ldrh r0, [r5]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, sl
	str r1, [r0]
	ldr r1, _080597A8 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _080597AC @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _080597B0 @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _080597B4 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	bl WriteSaveGame
	mov r1, sp
	ldrh r2, [r1]
	mov r1, r8
	strh r2, [r1]
	ldrh r0, [r1]
	strh r7, [r6]
	ldrh r0, [r6]
	mov r3, sb
	strh r3, [r5]
	ldrh r0, [r5]
	bl m4aSoundVSyncOn
	mov r1, sl
	ldr r0, [r1]
	ldr r1, _080597B8 @ =0xFFFF7FFF
	ands r0, r1
	mov r2, sl
	str r0, [r2]
_08059740:
	ldr r0, _08059778 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r4, _080597BC @ =gBgSprites_Unknown1
	movs r2, #0
	strb r2, [r4, #1]
	ldr r0, _080597C0 @ =gBgSprites_Unknown2
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	movs r1, #0xff
	strb r1, [r0, #6]
	movs r3, #0x20
	strb r3, [r0, #7]
	strb r2, [r4, #2]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	ldr r0, _080597C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _080597C8
	bl CreateMultiplayerModeSelectScreen
	b _080597CC
	.align 2, 0
_08059778: .4byte gCurTask
_0805977C: .4byte 0x03000018
_08059780: .4byte 0x030000FC
_08059784: .4byte gLoadedSaveGame
_08059788: .4byte gUnknown_08688444
_0805978C: .4byte 0x030000C8
_08059790: .4byte 0xFFFFDFFF
_08059794: .4byte gFrameCount
_08059798: .4byte gFlags
_0805979C: .4byte 0x04000200
_080597A0: .4byte 0x04000208
_080597A4: .4byte 0x04000004
_080597A8: .4byte 0x040000B0
_080597AC: .4byte 0x0000C5FF
_080597B0: .4byte 0x00007FFF
_080597B4: .4byte 0x040000D4
_080597B8: .4byte 0xFFFF7FFF
_080597BC: .4byte gBgSprites_Unknown1
_080597C0: .4byte gBgSprites_Unknown2
_080597C4: .4byte gGameMode
_080597C8:
	bl CreatePlayerDataMenu
_080597CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
