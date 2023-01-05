.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    thumb_func_start sub_8036670
sub_8036670: @ 0x08036670
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080366D4 @ =sub_80366F0
	ldr r2, _080366D8 @ =0x00002220
	movs r5, #0
	str r5, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	strh r5, [r0, #4]
	strh r1, [r0, #2]
	movs r1, #0x40
	strh r1, [r0, #6]
	ldr r1, _080366DC @ =0x00003FFF
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	strb r4, [r0, #0xc]
	movs r1, #0xa
	strb r1, [r0, #0xd]
	ldr r0, _080366E0 @ =gMPlayInfo_BGM
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _080366E4 @ =gMPlayInfo_SE1
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _080366E8 @ =gMPlayInfo_SE2
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _080366EC @ =gMPlayInfo_SE3
	movs r1, #8
	bl m4aMPlayFadeOut
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080366D4: .4byte sub_80366F0
_080366D8: .4byte 0x00002220
_080366DC: .4byte 0x00003FFF
_080366E0: .4byte gMPlayInfo_BGM
_080366E4: .4byte gMPlayInfo_SE1
_080366E8: .4byte gMPlayInfo_SE2
_080366EC: .4byte gMPlayInfo_SE3

	thumb_func_start sub_80366F0
sub_80366F0: @ 0x080366F0
	push {r4, r5, lr}
	ldr r0, _0803670C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrb r5, [r1, #0xc]
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08036710
	subs r0, #1
	strb r0, [r1, #0xd]
	b _0803677A
	.align 2, 0
_0803670C: .4byte gCurTask
_08036710:
	adds r0, r1, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803677A
	ldr r1, _08036758 @ =gBldRegs
	movs r4, #0
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r1, _0803675C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08036760 @ =gUnknown_03002AE4
	ldr r0, _08036764 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08036768 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0803676C @ =gVramGraphicsCopyCursor
	ldr r0, _08036770 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8036780
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	beq _08036774
	movs r0, #0x29
	bl m4aSongNumStart
	b _0803677A
	.align 2, 0
_08036758: .4byte gBldRegs
_0803675C: .4byte 0x0000FFFF
_08036760: .4byte gUnknown_03002AE4
_08036764: .4byte gUnknown_0300287C
_08036768: .4byte gUnknown_03005390
_0803676C: .4byte gVramGraphicsCopyCursor
_08036770: .4byte gVramGraphicsCopyQueueIndex
_08036774:
	movs r0, #0x95
	bl m4aSongNumStart
_0803677A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8036780
sub_8036780: @ 0x08036780
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080367E4 @ =gWinRegs
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r1, _080367E8 @ =gBldRegs
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #2]
	ldr r4, _080367EC @ =gFlags
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	ldr r0, _080367F0 @ =gBgPalette
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	ldr r0, [r4]
	movs r1, #1
	orrs r0, r1
	str r0, [r4]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080367FC
	ldr r0, _080367F4 @ =sub_8036918
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r1, _080367F8 @ =sub_8036C38
	str r1, [sp]
	movs r1, #0x70
	movs r3, #0
	bl TaskCreate
	b _0803680E
	.align 2, 0
_080367E4: .4byte gWinRegs
_080367E8: .4byte gBldRegs
_080367EC: .4byte gFlags
_080367F0: .4byte gBgPalette
_080367F4: .4byte sub_8036918
_080367F8: .4byte sub_8036C38
_080367FC:
	ldr r0, _08036824 @ =sub_8036A44
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r1, _08036828 @ =sub_8036C38
	str r1, [sp]
	movs r1, #0x70
	movs r3, #0
	bl TaskCreate
_0803680E:
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0803682C
	movs r0, #0x8c
	b _0803682E
	.align 2, 0
_08036824: .4byte sub_8036A44
_08036828: .4byte sub_8036C38
_0803682C:
	movs r0, #0xb4
_0803682E:
	str r0, [r2, #0x6c]
	adds r7, r2, #0
	adds r7, #0xc
	movs r0, #0x40
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #1
	ands r0, r5
	ldr r2, [sp, #4]
	cmp r0, #0
	beq _08036858
	movs r0, #0
	ldr r1, _08036854 @ =0x000002DB
	strh r1, [r7, #0xa]
	adds r1, r2, #0
	adds r1, #0x2c
	b _08036862
	.align 2, 0
_08036854: .4byte 0x000002DB
_08036858:
	ldr r0, _08036910 @ =0x000002DB
	strh r0, [r7, #0xa]
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #4
_08036862:
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0
	mov sl, r0
	movs r4, #0
	strh r4, [r7, #0x16]
	movs r1, #0x50
	mov r8, r1
	mov r0, r8
	strh r0, [r7, #0x18]
	movs r1, #0xc0
	mov sb, r1
	mov r0, sb
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x1c]
	adds r0, r7, #0
	adds r0, #0x22
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	mov r1, sl
	strb r1, [r0]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #4]
	bl sub_8004558
	ldr r2, [sp, #4]
	adds r7, r2, #0
	adds r7, #0x3c
	movs r0, #0x40
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08036910 @ =0x000002DB
	strh r0, [r7, #0xa]
	ldr r2, [sp, #4]
	adds r0, r2, #0
	adds r0, #0x5c
	movs r5, #1
	strb r5, [r0]
	adds r1, r2, #0
	adds r1, #0x5d
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r4, [r7, #0x16]
	mov r0, r8
	strh r0, [r7, #0x18]
	strh r4, [r7, #8]
	mov r1, sb
	strh r1, [r7, #0x1a]
	strh r4, [r7, #0x1c]
	adds r0, r2, #0
	adds r0, #0x5e
	strb r6, [r0]
	adds r0, #3
	mov r1, sl
	strb r1, [r0]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #4]
	bl sub_8004558
	ldr r2, [sp, #4]
	strh r5, [r2]
	strh r4, [r2, #4]
	movs r0, #2
	strh r0, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2, #6]
	ldr r0, _08036914 @ =0x00003FD0
	strh r0, [r2, #8]
	strh r4, [r2, #0xa]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036910: .4byte 0x000002DB
_08036914: .4byte 0x00003FD0

	thumb_func_start sub_8036918
sub_8036918: @ 0x08036918
	push {r4, r5, lr}
	ldr r0, _0803697C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0xc
	adds r3, r0, r1
	adds r1, #0x30
	adds r5, r0, r1
	ldr r1, _08036980 @ =gBldRegs
	movs r2, #0
	ldr r0, _08036984 @ =0x00003FEF
	strh r0, [r1]
	ldr r0, [r4, #0x6c]
	cmp r0, #0x3c
	bne _08036950
	movs r0, #1
	strh r0, [r4]
	strh r2, [r4, #4]
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #6]
	ldr r0, _08036988 @ =0x00003F90
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
_08036950:
	ldr r1, [r4, #0x6c]
	cmp r1, #0x32
	bne _0803696C
	movs r0, #1
	strh r0, [r4]
	strh r2, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #6]
	ldr r0, _08036988 @ =0x00003F90
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
_0803696C:
	cmp r1, #0x3c
	bls _0803698C
	adds r0, r1, #0
	adds r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0803698E
	.align 2, 0
_0803697C: .4byte gCurTask
_08036980: .4byte gBldRegs
_08036984: .4byte 0x00003FEF
_08036988: .4byte 0x00003F90
_0803698C:
	movs r0, #0x78
_0803698E:
	strh r0, [r3, #0x16]
	strh r0, [r5, #0x16]
	adds r0, r4, #0
	bl sub_802D4CC
	ldr r0, [r4, #0x6c]
	subs r1, r0, #1
	str r1, [r4, #0x6c]
	cmp r1, #0
	bne _080369C0
	movs r0, #1
	strh r0, [r4]
	strh r1, [r4, #4]
	strh r0, [r4, #2]
	movs r0, #0x40
	strh r0, [r4, #6]
	ldr r0, _080369CC @ =0x00003FAF
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	movs r0, #0x78
	str r0, [r4, #0x6c]
	ldr r0, _080369D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080369D4 @ =sub_80369D8
	str r0, [r1, #8]
_080369C0:
	adds r0, r4, #0
	bl sub_8036BD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080369CC: .4byte 0x00003FAF
_080369D0: .4byte gCurTask
_080369D4: .4byte sub_80369D8

	thumb_func_start sub_80369D8
sub_80369D8: @ 0x080369D8
	push {r4, r5, r6, lr}
	ldr r6, _08036A30 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, r5, #0
	bl sub_802D4CC
	ldr r0, [r5, #0x6c]
	subs r1, r0, #1
	str r1, [r5, #0x6c]
	cmp r1, #0
	bne _08036A24
	movs r4, #1
	strh r4, [r5]
	strh r1, [r5, #4]
	strh r4, [r5, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #6]
	ldr r0, _08036A34 @ =0x00003FBF
	strh r0, [r5, #8]
	strh r1, [r5, #0xa]
	ldr r0, _08036A38 @ =gBgPalette
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0xff
	bl memset
	ldr r1, _08036A3C @ =gFlags
	ldr r0, [r1]
	orrs r0, r4
	str r0, [r1]
	ldr r1, [r6]
	ldr r0, _08036A40 @ =sub_8036B30
	str r0, [r1, #8]
_08036A24:
	adds r0, r5, #0
	bl sub_8036BD4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036A30: .4byte gCurTask
_08036A34: .4byte 0x00003FBF
_08036A38: .4byte gBgPalette
_08036A3C: .4byte gFlags
_08036A40: .4byte sub_8036B30

	thumb_func_start sub_8036A44
sub_8036A44: @ 0x08036A44
	push {r4, r5, lr}
	ldr r0, _08036AE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r1, _08036AEC @ =gBldRegs
	movs r2, #0
	ldr r0, _08036AF0 @ =0x00003FEF
	strh r0, [r1]
	ldr r0, [r4, #0x6c]
	cmp r0, #0x96
	bne _08036A74
	movs r0, #1
	strh r0, [r4]
	strh r2, [r4, #4]
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #6]
	ldr r0, _08036AF4 @ =0x00003F90
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
_08036A74:
	ldr r1, [r4, #0x6c]
	cmp r1, #0x8c
	bne _08036A90
	movs r0, #1
	strh r0, [r4]
	strh r2, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #6]
	ldr r0, _08036AF4 @ =0x00003F90
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
_08036A90:
	cmp r1, #0x1e
	bne _08036AA8
	movs r0, #1
	strh r0, [r4]
	strh r2, [r4, #4]
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #6]
	ldr r0, _08036AF8 @ =0x00003FD0
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
_08036AA8:
	adds r0, r4, #0
	bl sub_802D4CC
	ldr r0, [r4, #0x6c]
	subs r5, r0, #1
	str r5, [r4, #0x6c]
	cmp r5, #0
	bne _08036B22
	ldr r1, _08036AFC @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08036B00 @ =gUnknown_03002AE4
	ldr r0, _08036B04 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08036B08 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08036B0C @ =gVramGraphicsCopyCursor
	ldr r0, _08036B10 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08036B14 @ =gCourseTime
	strh r5, [r0]
	ldr r0, _08036B18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _08036B1C
	bl CreateTimeAttackLobbyScreen
	b _08036B28
	.align 2, 0
_08036AE8: .4byte gCurTask
_08036AEC: .4byte gBldRegs
_08036AF0: .4byte 0x00003FEF
_08036AF4: .4byte 0x00003F90
_08036AF8: .4byte 0x00003FD0
_08036AFC: .4byte 0x0000FFFF
_08036B00: .4byte gUnknown_03002AE4
_08036B04: .4byte gUnknown_0300287C
_08036B08: .4byte gUnknown_03005390
_08036B0C: .4byte gVramGraphicsCopyCursor
_08036B10: .4byte gVramGraphicsCopyQueueIndex
_08036B14: .4byte gCourseTime
_08036B18: .4byte gGameMode
_08036B1C:
	bl CreateGameStage
	b _08036B28
_08036B22:
	adds r0, r4, #0
	bl sub_8036BEC
_08036B28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036B30
sub_8036B30: @ 0x08036B30
	push {r4, r5, lr}
	ldr r5, _08036B68 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08036B5A
	movs r0, #0x8c
	str r0, [r4, #0x6c]
	adds r0, r4, #0
	bl sub_802D4CC
	ldr r1, [r5]
	ldr r0, _08036B6C @ =sub_8036B70
	str r0, [r1, #8]
_08036B5A:
	adds r0, r4, #0
	bl sub_8036BD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036B68: .4byte gCurTask
_08036B6C: .4byte sub_8036B70

	thumb_func_start sub_8036B70
sub_8036B70: @ 0x08036B70
	push {r4, lr}
	ldr r0, _08036BAC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r1, #0x6c]
	subs r4, r0, #1
	str r4, [r1, #0x6c]
	cmp r4, #0
	bne _08036BC8
	ldr r1, _08036BB0 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08036BB4 @ =gUnknown_03002AE4
	ldr r0, _08036BB8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08036BBC @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08036BC0 @ =gVramGraphicsCopyCursor
	ldr r0, _08036BC4 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTitleScreen
	b _08036BCE
	.align 2, 0
_08036BAC: .4byte gCurTask
_08036BB0: .4byte 0x0000FFFF
_08036BB4: .4byte gUnknown_03002AE4
_08036BB8: .4byte gUnknown_0300287C
_08036BBC: .4byte gUnknown_03005390
_08036BC0: .4byte gVramGraphicsCopyCursor
_08036BC4: .4byte gVramGraphicsCopyQueueIndex
_08036BC8:
	adds r0, r1, #0
	bl sub_8036BD4
_08036BCE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8036BD4
sub_8036BD4: @ 0x08036BD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc
	adds r4, #0x3c
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8036BEC
sub_8036BEC: @ 0x08036BEC
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0xc
	adds r4, r0, #0
	adds r4, #0x3c
	ldr r0, [r0, #0x6c]
	cmp r0, #0x8c
	bls _08036C08
	lsls r0, r0, #0x11
	ldr r1, _08036C04 @ =0xFF600000
	adds r0, r0, r1
	b _08036C20
	.align 2, 0
_08036C04: .4byte 0xFF600000
_08036C08:
	cmp r0, #0x28
	bls _08036C10
	movs r0, #0x78
	b _08036C22
_08036C10:
	cmp r0, #0
	beq _08036C32
	movs r1, #0x28
	subs r1, r1, r0
	lsls r1, r1, #1
	movs r0, #0x78
	subs r0, r0, r1
	lsls r0, r0, #0x10
_08036C20:
	lsrs r0, r0, #0x10
_08036C22:
	strh r0, [r2, #0x16]
	strh r0, [r4, #0x16]
	adds r0, r2, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
_08036C32:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8036C38
sub_8036C38: @ 0x08036C38
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
