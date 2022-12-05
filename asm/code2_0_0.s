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
	ldr r1, _0803676C @ =gUnknown_03004D5C
	ldr r0, _08036770 @ =gUnknown_03002A84
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
_0803676C: .4byte gUnknown_03004D5C
_08036770: .4byte gUnknown_03002A84
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
	ldr r1, _08036B0C @ =gUnknown_03004D5C
	ldr r0, _08036B10 @ =gUnknown_03002A84
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
_08036B0C: .4byte gUnknown_03004D5C
_08036B10: .4byte gUnknown_03002A84
_08036B14: .4byte gCourseTime
_08036B18: .4byte gGameMode
_08036B1C:
	bl sub_801A838
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
	ldr r1, _08036BC0 @ =gUnknown_03004D5C
	ldr r0, _08036BC4 @ =gUnknown_03002A84
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
_08036BC0: .4byte gUnknown_03004D5C
_08036BC4: .4byte gUnknown_03002A84
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

	thumb_func_start CreateTrueArea53
CreateTrueArea53: @ 0x08036C54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08036DE8 @ =gBldRegs
	movs r4, #0
	movs r3, #0
	ldr r0, _08036DEC @ =0x00003FFF
	strh r0, [r1]
	strh r3, [r1, #2]
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r0, _08036DF0 @ =sub_80392AC
	movs r1, #0x9f
	lsls r1, r1, #2
	movs r2, #0xe0
	lsls r2, r2, #7
	str r3, [sp]
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	strb r4, [r6]
	movs r0, #0xb9
	lsls r0, r0, #1
	str r0, [r6, #4]
	movs r0, #0xe8
	str r0, [r6, #8]
	strb r4, [r6, #0xe]
	strb r4, [r6, #0xf]
	movs r5, #0
	mov ip, r5
	ldr r0, _08036DF4 @ =gUnknown_080D7830
	mov r8, r0
	ldr r4, _08036DF8 @ =IWRAM_START + 0x130
	adds r4, r4, r1
	mov sl, r4
	ldr r7, _08036DFC @ =IWRAM_START + 0x132
	adds r7, r7, r1
	mov sb, r7
_08036CAC:
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	lsls r4, r5, #3
	adds r1, r6, #0
	adds r1, #0x30
	adds r1, r1, r4
	lsls r3, r5, #2
	adds r2, r3, r5
	lsls r2, r2, #1
	mov r7, r8
	adds r0, r2, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	lsls r0, r0, #8
	str r0, [r1]
	adds r1, r6, #0
	adds r1, #0x34
	adds r1, r1, r4
	ldr r0, _08036E00 @ =gUnknown_080D7832
	adds r2, r2, r0
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #8
	str r0, [r1]
	mov r7, sl
	adds r0, r7, r3
	mov r1, ip
	strh r1, [r0]
	add r3, sb
	strh r1, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x1f
	bls _08036CAC
	movs r4, #0xd8
	lsls r4, r4, #1
	adds r0, r6, r4
	movs r2, #0
	movs r5, #1
	strb r5, [r0]
	movs r7, #0xda
	lsls r7, r7, #1
	adds r1, r6, r7
	movs r0, #0xc8
	lsls r0, r0, #7
	str r0, [r1]
	movs r0, #0xdc
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #0xb4
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0xde
	lsls r1, r1, #1
	adds r1, r1, r6
	mov ip, r1
	strh r2, [r1, #0x16]
	strh r2, [r1, #0x18]
	ldr r3, _08036E04 @ =gUnknown_080D7560
	ldr r0, [r3]
	str r0, [r1, #4]
	ldrh r0, [r3, #0x24]
	strh r0, [r1, #0xa]
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r1, [r0]
	adds r4, #0x2c
	adds r0, r6, r4
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	mov r5, ip
	strh r0, [r5, #0x1a]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	adds r7, #0x29
	adds r1, r6, r7
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0xdf
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r4, #5
	adds r1, r6, r4
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r5, #0x10]
	movs r5, #0
	movs r4, #0
_08036D6E:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r7, #0xf6
	lsls r7, r7, #1
	adds r0, r0, r7
	adds r0, r0, r6
	mov ip, r0
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	adds r2, r5, #1
	lsls r1, r2, #3
	adds r1, r1, r3
	ldr r0, [r1]
	mov r5, ip
	str r0, [r5, #4]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r4, [r5, #0x10]
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	cmp r5, #2
	bls _08036D6E
	bl sub_803986C
	bl sub_8039A4C
	movs r0, #0x30
	bl m4aSongNumStart
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036DE8: .4byte gBldRegs
_08036DEC: .4byte 0x00003FFF
_08036DF0: .4byte sub_80392AC
_08036DF4: .4byte gUnknown_080D7830
_08036DF8: .4byte IWRAM_START + 0x130
_08036DFC: .4byte IWRAM_START + 0x132
_08036E00: .4byte gUnknown_080D7832
_08036E04: .4byte gUnknown_080D7560

	thumb_func_start sub_8036E08
sub_8036E08: @ 0x08036E08
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08036ED8 @ =sub_8036EF8
	movs r1, #0xe4
	lsls r1, r1, #1
	movs r2, #0xe0
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	str r0, [r1, #0x34]
	ldr r0, _08036EDC @ =IWRAM_START + 0x188
	adds r1, r2, r0
	ldr r0, _08036EE0 @ =0x06008000
	str r0, [r1, #4]
	movs r3, #0
	strh r4, [r1, #0xa]
	ldr r0, _08036EE4 @ =0x0600E000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	ldr r0, _08036EE8 @ =0x0000017B
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	movs r0, #9
	strh r0, [r1, #0x22]
	movs r0, #1
	strh r0, [r1, #0x24]
	movs r0, #0xd
	strh r0, [r1, #0x26]
	movs r0, #0x12
	strh r0, [r1, #0x28]
	ldr r0, _08036EEC @ =IWRAM_START + 0x1B2
	adds r2, r2, r0
	strb r3, [r2]
	movs r0, #2
	strh r0, [r1, #0x2e]
	movs r3, #0
	movs r6, #0
	ldr r5, _08036EF0 @ =0x00000345
_08036E6C:
	lsls r2, r3, #1
	mov r0, ip
	adds r0, #8
	adds r0, r0, r2
	strh r4, [r0]
	lsls r1, r3, #2
	mov r0, ip
	adds r0, #0x18
	adds r0, r0, r1
	movs r1, #0xb4
	lsls r1, r1, #8
	str r1, [r0]
	adds r2, r2, r3
	lsls r2, r2, #4
	adds r2, #0x38
	mov r0, ip
	adds r1, r0, r2
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	lsls r0, r3, #9
	ldr r2, _08036EF4 @ =0x06013000
	adds r0, r0, r2
	str r0, [r1, #4]
	strh r5, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	strb r3, [r0]
	adds r2, r1, #0
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x25
	strb r6, [r0]
	str r4, [r1, #0x10]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #6
	bls _08036E6C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036ED8: .4byte sub_8036EF8
_08036EDC: .4byte IWRAM_START + 0x188
_08036EE0: .4byte 0x06008000
_08036EE4: .4byte 0x0600E000
_08036EE8: .4byte 0x0000017B
_08036EEC: .4byte IWRAM_START + 0x1B2
_08036EF0: .4byte 0x00000345
_08036EF4: .4byte 0x06013000

	thumb_func_start sub_8036EF8
sub_8036EF8: @ 0x08036EF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08036FD4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r7, #0
	ldr r0, _08036FD8 @ =0x000003FF
	mov sl, r0
	ldr r1, _08036FDC @ =gSineTable
	mov sb, r1
_08036F1C:
	lsls r0, r7, #1
	adds r4, r0, r7
	lsls r4, r4, #4
	adds r4, #0x38
	add r4, r8
	mov r1, r8
	adds r1, #8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	lsls r2, r7, #2
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r2
	ldrh r2, [r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xf
	muls r0, r1, r0
	lsrs r0, r0, #9
	mov r2, sl
	ands r2, r0
	str r2, [sp]
	adds r0, r7, #0
	adds r0, #0xd
	muls r1, r0, r1
	lsrs r1, r1, #9
	mov r3, sl
	ands r1, r3
	str r1, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r3, [r0, r2]
	mov r2, r8
	ldr r0, [r2, #0x34]
	movs r2, #0x20
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r5, r0, #0xe
	lsls r1, r1, #1
	add r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x64
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #6
	bls _08036F1C
	mov r1, r8
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	cmp r0, #0
	bne _08036FC2
	movs r0, #0xb4
	lsls r0, r0, #1
	str r0, [r1, #0x34]
	ldr r0, _08036FD4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08036FE0 @ =sub_8036FE4
	str r0, [r1, #8]
_08036FC2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036FD4: .4byte gCurTask
_08036FD8: .4byte 0x000003FF
_08036FDC: .4byte gSineTable
_08036FE0: .4byte sub_8036FE4

	thumb_func_start sub_8036FE4
sub_8036FE4: @ 0x08036FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080370B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r7, #0
	ldr r0, _080370B4 @ =0x000003FF
	mov sl, r0
	ldr r1, _080370B8 @ =gSineTable
	mov sb, r1
_08037008:
	lsls r0, r7, #1
	adds r4, r0, r7
	lsls r4, r4, #4
	adds r4, #0x38
	add r4, r8
	mov r1, r8
	adds r1, #8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	lsls r2, r7, #2
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r2
	ldrh r2, [r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xf
	muls r0, r1, r0
	lsrs r0, r0, #9
	mov r2, sl
	ands r2, r0
	str r2, [sp]
	adds r0, r7, #0
	adds r0, #0xd
	muls r1, r0, r1
	lsrs r1, r1, #9
	mov r3, sl
	ands r1, r3
	str r1, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r5, r0, #9
	lsls r1, r1, #1
	add r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	asrs r6, r0, #0xb
	adds r0, r5, #0
	adds r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x64
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #6
	bls _08037008
	mov r1, r8
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	cmp r0, #0
	bne _0803709E
	movs r0, #0x20
	str r0, [r1, #0x34]
	ldr r0, _080370B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080370BC @ =sub_80370C0
	str r0, [r1, #8]
_0803709E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080370B0: .4byte gCurTask
_080370B4: .4byte 0x000003FF
_080370B8: .4byte gSineTable
_080370BC: .4byte sub_80370C0

	thumb_func_start sub_80370C0
sub_80370C0: @ 0x080370C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r7, _0803712C @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, [r0, #0x34]
	subs r3, r0, #1
	mov r0, r8
	str r3, [r0, #0x34]
	cmp r3, #0
	bne _08037158
	movs r0, #0x78
	mov r1, r8
	str r0, [r1, #0x34]
	ldr r1, _08037130 @ =gBgCntRegs
	movs r2, #0
	ldr r0, _08037134 @ =0x00001C08
	strh r0, [r1, #4]
	ldr r1, _08037138 @ =gBldRegs
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r1, _0803713C @ =gDispCnt
	ldr r0, _08037140 @ =0x00005540
	strh r0, [r1]
	ldr r0, _08037144 @ =gBgScrollRegs
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	ldr r0, _08037148 @ =gUnknown_03004D80
	strb r2, [r0, #2]
	ldr r1, _0803714C @ =gUnknown_03002280
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x14
	strb r0, [r1, #0xb]
	ldr r2, _08037150 @ =IWRAM_START + 0x188
	adds r0, r4, r2
	bl sub_8002A3C
	ldr r1, [r7]
	ldr r0, _08037154 @ =sub_8037254
	str r0, [r1, #8]
	b _08037226
	.align 2, 0
_0803712C: .4byte gCurTask
_08037130: .4byte gBgCntRegs
_08037134: .4byte 0x00001C08
_08037138: .4byte gBldRegs
_0803713C: .4byte gDispCnt
_08037140: .4byte 0x00005540
_08037144: .4byte gBgScrollRegs
_08037148: .4byte gUnknown_03004D80
_0803714C: .4byte gUnknown_03002280
_08037150: .4byte IWRAM_START + 0x188
_08037154: .4byte sub_8037254
_08037158:
	cmp r3, #0xf
	bhi _0803718E
	ldr r2, _08037238 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0803723C @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r2]
	mov r0, r8
	ldr r1, [r0, #0x34]
	movs r0, #0x10
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldr r1, _08037240 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1, #8]
	movs r0, #0xff
	strh r0, [r1, #0xa]
_0803718E:
	movs r7, #0
	ldr r1, _08037244 @ =IWRAM_START + 0x8
	adds r1, r4, r1
	str r1, [sp, #8]
	ldr r2, _08037248 @ =IWRAM_START + 0x18
	adds r2, r4, r2
	str r2, [sp, #0xc]
	ldr r3, _0803724C @ =0x000003FF
	mov sl, r3
	ldr r0, _08037250 @ =gSineTable
	mov sb, r0
_080371A4:
	lsls r1, r7, #1
	adds r4, r1, r7
	lsls r4, r4, #4
	adds r4, #0x38
	add r4, r8
	ldr r2, [sp, #8]
	adds r1, r2, r1
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	lsls r0, r7, #2
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	ldrh r2, [r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xf
	muls r0, r1, r0
	lsrs r0, r0, #9
	mov r2, sl
	ands r2, r0
	str r2, [sp]
	adds r0, r7, #0
	adds r0, #0xd
	muls r1, r0, r1
	lsrs r1, r1, #9
	mov r3, sl
	ands r1, r3
	str r1, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r3, r8
	ldr r2, [r3, #0x34]
	muls r0, r2, r0
	lsrs r5, r0, #0xe
	lsls r1, r1, #1
	add r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x64
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #6
	bls _080371A4
_08037226:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037238: .4byte gDispCnt
_0803723C: .4byte gBldRegs
_08037240: .4byte gWinRegs
_08037244: .4byte IWRAM_START + 0x8
_08037248: .4byte IWRAM_START + 0x18
_0803724C: .4byte 0x000003FF
_08037250: .4byte gSineTable

	thumb_func_start sub_8037254
sub_8037254: @ 0x08037254
	push {lr}
	ldr r0, _08037284 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0, #0x34]
	subs r1, #1
	str r1, [r0, #0x34]
	cmp r1, #0
	bne _08037294
	ldr r1, _08037288 @ =gDispCnt
	movs r3, #0x8a
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _0803728C @ =gBgCntRegs
	ldr r0, _08037290 @ =0x00001C0B
	strh r0, [r1, #4]
	adds r0, r2, #0
	bl TaskDestroy
	b _080372BC
	.align 2, 0
_08037284: .4byte gCurTask
_08037288: .4byte gDispCnt
_0803728C: .4byte gBgCntRegs
_08037290: .4byte 0x00001C0B
_08037294:
	cmp r1, #0x74
	bhi _080372BC
	ldr r1, _080372C0 @ =gBldRegs
	ldrh r2, [r1, #4]
	cmp r2, #0
	beq _080372BC
	movs r0, #0xbf
	strh r0, [r1]
	subs r0, r2, #1
	strh r0, [r1, #4]
	ldr r1, _080372C4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1, #8]
	movs r0, #0xff
	strh r0, [r1, #0xa]
_080372BC:
	pop {r0}
	bx r0
	.align 2, 0
_080372C0: .4byte gBldRegs
_080372C4: .4byte gWinRegs

	thumb_func_start sub_80372C8
sub_80372C8: @ 0x080372C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	str r1, [sp, #4]
	ldr r0, _080373A8 @ =sub_80373CC
	movs r2, #0xe0
	lsls r2, r2, #7
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldr r6, _080373AC @ =gUnknown_030053B8
	ldr r1, [r6]
	ldr r2, _080373B0 @ =0x00196225
	mov sb, r2
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	ldr r7, _080373B4 @ =0x3C6EF35F
	mov r8, r7
	add r1, r8
	str r1, [r6]
	movs r3, #1
	ands r3, r1
	adds r3, #2
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	movs r0, #0
	mov ip, r0
	movs r0, #0x28
	strh r0, [r2]
	mov r7, sb
	muls r7, r1, r7
	adds r1, r7, #0
	add r1, r8
	str r1, [r6]
	movs r0, #0x1f
	mov sl, r0
	adds r0, r1, #0
	mov r7, sl
	ands r0, r7
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	ldr r7, [sp, #8]
	adds r0, r7, r0
	str r0, [r2, #4]
	mov r0, sb
	muls r0, r1, r0
	add r0, r8
	str r0, [r6]
	mov r1, sl
	ands r0, r1
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	ldr r6, [sp, #4]
	adds r1, r6, r0
	str r1, [r2, #8]
	strh r5, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldr r7, _080373B8 @ =IWRAM_START + 0x10
	adds r1, r4, r7
	strh r5, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _080373BC @ =gUnknown_080D7540
	lsls r3, r3, #3
	adds r3, r3, r0
	ldr r0, [r3]
	str r0, [r1, #4]
	ldrh r0, [r3, #4]
	strh r0, [r1, #0xa]
	ldrb r2, [r3, #6]
	ldr r3, _080373C0 @ =IWRAM_START + 0x30
	adds r0, r4, r3
	strb r2, [r0]
	ldr r6, _080373C4 @ =IWRAM_START + 0x31
	adds r2, r4, r6
	movs r0, #0xff
	strb r0, [r2]
	adds r0, #1
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	adds r7, #0x22
	adds r2, r4, r7
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, _080373C8 @ =IWRAM_START + 0x35
	adds r4, r4, r0
	mov r2, ip
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r1, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080373A8: .4byte sub_80373CC
_080373AC: .4byte gUnknown_030053B8
_080373B0: .4byte 0x00196225
_080373B4: .4byte 0x3C6EF35F
_080373B8: .4byte IWRAM_START + 0x10
_080373BC: .4byte gUnknown_080D7540
_080373C0: .4byte IWRAM_START + 0x30
_080373C4: .4byte IWRAM_START + 0x31
_080373C8: .4byte IWRAM_START + 0x35

	thumb_func_start sub_80373CC
sub_80373CC: @ 0x080373CC
	push {r4, r5, lr}
	ldr r0, _0803740C @ =gCurTask
	ldr r5, [r0]
	ldrh r1, [r5, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	adds r0, #0x10
	adds r4, r1, r0
	ldrh r0, [r2, #0xe]
	adds r0, #0x10
	strh r0, [r2, #0xe]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #4]
	adds r3, r0, r1
	str r3, [r2, #4]
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037410
	adds r0, r5, #0
	bl TaskDestroy
	b _0803742C
	.align 2, 0
_0803740C: .4byte gCurTask
_08037410:
	asrs r0, r3, #8
	strh r0, [r4, #0x16]
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, _08037434 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803742C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037434: .4byte gCamera

	thumb_func_start sub_8037438
sub_8037438: @ 0x08037438
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08037520 @ =gUnknown_080D7970
	lsls r4, r7, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r2, #0xe0
	lsls r2, r2, #7
	movs r5, #0
	str r5, [sp]
	movs r1, #0x74
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0
	strb r7, [r0]
	strb r5, [r0, #1]
	ldr r2, _08037524 @ =gUnknown_080D7704
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #2]
	ldr r2, _08037528 @ =gUnknown_080D77D0
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1, #8]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r3, r2, #4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r1, #0xc]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x10]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x12]
	ldr r0, _0803752C @ =gUnknown_080D76F0
	adds r4, r4, r0
	ldr r1, [r4]
	ldr r0, _08037530 @ =IWRAM_START + 0x14
	adds r4, r6, r0
	mov r0, ip
	ldrb r0, [r0]
	lsls r0, r0, #4
	mov r8, r0
	add r2, r8
	ldr r0, [r2]
	lsls r0, r0, #8
	strh r0, [r4, #0x16]
	mov r2, ip
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	strh r0, [r4, #0x18]
	ldr r0, [r1]
	str r0, [r4, #4]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037534 @ =IWRAM_START + 0x34
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _08037538 @ =IWRAM_START + 0x35
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0803753C @ =gUnknown_080D7984
	adds r0, r7, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r5, [r4, #8]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x1c]
	adds r2, #2
	adds r1, r6, r2
	movs r0, #0x20
	strb r0, [r1]
	cmp r7, #3
	bhi _08037544
	ldr r1, _08037540 @ =IWRAM_START + 0x39
	adds r0, r6, r1
	strb r7, [r0]
	b _0803754C
	.align 2, 0
_08037520: .4byte gUnknown_080D7970
_08037524: .4byte gUnknown_080D7704
_08037528: .4byte gUnknown_080D77D0
_0803752C: .4byte gUnknown_080D76F0
_08037530: .4byte IWRAM_START + 0x14
_08037534: .4byte IWRAM_START + 0x34
_08037538: .4byte IWRAM_START + 0x35
_0803753C: .4byte gUnknown_080D7984
_08037540: .4byte IWRAM_START + 0x39
_08037544:
	ldr r2, _080375AC @ =IWRAM_START + 0x39
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
_0803754C:
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	cmp r7, #3
	bhi _0803759E
	mov r4, ip
	adds r4, #0x44
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #0x16]
	strh r2, [r4, #0x18]
	ldr r1, _080375B0 @ =gUnknown_080D7540
	lsls r0, r7, #3
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r4, #4]
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	mov r0, ip
	adds r0, #0x64
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x65
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x69
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
_0803759E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080375AC: .4byte IWRAM_START + 0x39
_080375B0: .4byte gUnknown_080D7540

	thumb_func_start sub_80375B4
sub_80375B4: @ 0x080375B4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037658 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037634
	ldr r3, _0803765C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037660 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037664 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037668 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803766C @ =sub_8037674
	str r0, [r1, #8]
_08037634:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037670 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037658: .4byte gCurTask
_0803765C: .4byte gUnknown_080D7704
_08037660: .4byte gUnknown_080D76F0
_08037664: .4byte IWRAM_START + 0x34
_08037668: .4byte IWRAM_START + 0x35
_0803766C: .4byte sub_8037674
_08037670: .4byte gCamera

	thumb_func_start sub_8037674
sub_8037674: @ 0x08037674
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037728 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08037696
	movs r0, #0
	strh r0, [r4, #0x10]
_08037696:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037704
	ldr r3, _0803772C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037730 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037734 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037738 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803773C @ =sub_8037744
	str r0, [r1, #8]
_08037704:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037740 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037728: .4byte gCurTask
_0803772C: .4byte gUnknown_080D7704
_08037730: .4byte gUnknown_080D76F0
_08037734: .4byte IWRAM_START + 0x34
_08037738: .4byte IWRAM_START + 0x35
_0803773C: .4byte sub_8037744
_08037740: .4byte gCamera

	thumb_func_start sub_8037744
sub_8037744: @ 0x08037744
	push {r4, r5, r6, r7, lr}
	ldr r7, _080377FC @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08037766
	movs r0, #0
	strh r0, [r4, #0x10]
_08037766:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080377D8
	strh r0, [r4, #0x10]
	ldr r3, _08037800 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037804 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037808 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803780C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08037810 @ =sub_8037818
	str r0, [r1, #8]
_080377D8:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037814 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080377FC: .4byte gCurTask
_08037800: .4byte gUnknown_080D7704
_08037804: .4byte gUnknown_080D76F0
_08037808: .4byte IWRAM_START + 0x34
_0803780C: .4byte IWRAM_START + 0x35
_08037810: .4byte sub_8037818
_08037814: .4byte gCamera

	thumb_func_start sub_8037818
sub_8037818: @ 0x08037818
	push {r4, r5, r6, r7, lr}
	ldr r7, _080378A0 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803787C
	ldr r3, _080378A4 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080378A8 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080378AC @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080378B0 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080378B4 @ =sub_80378BC
	str r0, [r1, #8]
_0803787C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080378B8 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080378A0: .4byte gCurTask
_080378A4: .4byte gUnknown_080D7704
_080378A8: .4byte gUnknown_080D76F0
_080378AC: .4byte IWRAM_START + 0x34
_080378B0: .4byte IWRAM_START + 0x35
_080378B4: .4byte sub_80378BC
_080378B8: .4byte gCamera

	thumb_func_start sub_80378BC
sub_80378BC: @ 0x080378BC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803794C @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _08037950 @ =IWRAM_START + 0x14
	adds r6, r5, r1
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _08037928
	ldr r3, _08037954 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037958 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803795C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037960 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	str r7, [r4, #4]
	mov r2, ip
	ldr r1, [r2]
	ldr r0, _08037964 @ =sub_803796C
	str r0, [r1, #8]
_08037928:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037968 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803794C: .4byte gCurTask
_08037950: .4byte IWRAM_START + 0x14
_08037954: .4byte gUnknown_080D7704
_08037958: .4byte gUnknown_080D76F0
_0803795C: .4byte IWRAM_START + 0x34
_08037960: .4byte IWRAM_START + 0x35
_08037964: .4byte sub_803796C
_08037968: .4byte gCamera

	thumb_func_start sub_803796C
sub_803796C: @ 0x0803796C
	push {r4, r5, lr}
	ldr r0, _08037A24 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldrh r1, [r4, #2]
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080379A4
	cmp r1, #0xf0
	bne _08037996
	bl sub_8036E08
	movs r0, #0x31
	bl m4aSongNumStart
_08037996:
	ldr r1, [r4, #0xc]
	asrs r0, r1, #8
	cmp r0, #0x9c
	ble _080379A4
	adds r0, r1, #0
	subs r0, #0x18
	str r0, [r4, #0xc]
_080379A4:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080379FE
	ldr r3, _08037A28 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037A2C @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08037A24 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08037A30 @ =sub_8037A38
	str r0, [r1, #8]
_080379FE:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037A34 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037A24: .4byte gCurTask
_08037A28: .4byte gUnknown_080D7704
_08037A2C: .4byte gUnknown_080D76F0
_08037A30: .4byte sub_8037A38
_08037A34: .4byte gCamera

	thumb_func_start sub_8037A38
sub_8037A38: @ 0x08037A38
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037AE4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r1, [r4, #2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08037A5E
	ldr r2, _08037AE8 @ =IWRAM_START + 0x36
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08037A5E:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037ABE
	ldr r3, _08037AEC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037AF0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037AF4 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037AF8 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #0x72
	bl m4aSongNumStart
	ldr r1, [r7]
	ldr r0, _08037AFC @ =sub_8037B04
	str r0, [r1, #8]
_08037ABE:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037B00 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037AE4: .4byte gCurTask
_08037AE8: .4byte IWRAM_START + 0x36
_08037AEC: .4byte gUnknown_080D7704
_08037AF0: .4byte gUnknown_080D76F0
_08037AF4: .4byte IWRAM_START + 0x34
_08037AF8: .4byte IWRAM_START + 0x35
_08037AFC: .4byte sub_8037B04
_08037B00: .4byte gCamera

	thumb_func_start sub_8037B04
sub_8037B04: @ 0x08037B04
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037BAC @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldr r2, _08037BB0 @ =gSineTable
	ldr r1, [r4, #4]
	adds r1, #1
	str r1, [r4, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037BB4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037B88
	ldr r3, _08037BB8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037BBC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037BC0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037BC4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08037BC8 @ =sub_8037BD0
	str r0, [r1, #8]
_08037B88:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037BCC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037BAC: .4byte gCurTask
_08037BB0: .4byte gSineTable
_08037BB4: .4byte 0x000003FF
_08037BB8: .4byte gUnknown_080D7704
_08037BBC: .4byte gUnknown_080D76F0
_08037BC0: .4byte IWRAM_START + 0x34
_08037BC4: .4byte IWRAM_START + 0x35
_08037BC8: .4byte sub_8037BD0
_08037BCC: .4byte gCamera

	thumb_func_start sub_8037BD0
sub_8037BD0: @ 0x08037BD0
	push {r4, r5, r6, r7, lr}
	ldr r4, _08037CC0 @ =gCurTask
	ldr r0, [r4]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r7, r0
	adds r0, #0x14
	adds r6, r7, r0
	ldr r2, _08037CC4 @ =gSineTable
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037CC8 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037C54
	ldr r3, _08037CCC @ =gUnknown_080D7704
	ldrb r1, [r5, #1]
	adds r1, #1
	strb r1, [r5, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r5]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5, #2]
	ldr r1, _08037CD0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037CD4 @ =IWRAM_START + 0x34
	adds r0, r7, r2
	strb r1, [r0]
	ldr r0, _08037CD8 @ =IWRAM_START + 0x35
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r4]
	ldr r0, _08037CDC @ =sub_8037CEC
	str r0, [r1, #8]
_08037C54:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, _08037CE0 @ =gCamera
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r2, _08037CE4 @ =IWRAM_START + 0x44
	adds r6, r7, r2
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r1, _08037CE8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08037CBA
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_08037CBA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037CC0: .4byte gCurTask
_08037CC4: .4byte gSineTable
_08037CC8: .4byte 0x000003FF
_08037CCC: .4byte gUnknown_080D7704
_08037CD0: .4byte gUnknown_080D76F0
_08037CD4: .4byte IWRAM_START + 0x34
_08037CD8: .4byte IWRAM_START + 0x35
_08037CDC: .4byte sub_8037CEC
_08037CE0: .4byte gCamera
_08037CE4: .4byte IWRAM_START + 0x44
_08037CE8: .4byte 0xFFFFFBFF

	thumb_func_start sub_8037CEC
sub_8037CEC: @ 0x08037CEC
	push {r4, r5, r6, r7, lr}
	ldr r4, _08037DDC @ =gCurTask
	ldr r0, [r4]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r7, r0
	adds r0, #0x14
	adds r6, r7, r0
	ldr r2, _08037DE0 @ =gSineTable
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037DE4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037D70
	ldr r3, _08037DE8 @ =gUnknown_080D7704
	ldrb r1, [r5, #1]
	adds r1, #1
	strb r1, [r5, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r5]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5, #2]
	ldr r1, _08037DEC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037DF0 @ =IWRAM_START + 0x34
	adds r0, r7, r2
	strb r1, [r0]
	ldr r0, _08037DF4 @ =IWRAM_START + 0x35
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r4]
	ldr r0, _08037DF8 @ =sub_8037E08
	str r0, [r1, #8]
_08037D70:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, _08037DFC @ =gCamera
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r2, _08037E00 @ =IWRAM_START + 0x44
	adds r6, r7, r2
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r1, _08037E04 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08037DD6
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_08037DD6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DDC: .4byte gCurTask
_08037DE0: .4byte gSineTable
_08037DE4: .4byte 0x000003FF
_08037DE8: .4byte gUnknown_080D7704
_08037DEC: .4byte gUnknown_080D76F0
_08037DF0: .4byte IWRAM_START + 0x34
_08037DF4: .4byte IWRAM_START + 0x35
_08037DF8: .4byte sub_8037E08
_08037DFC: .4byte gCamera
_08037E00: .4byte IWRAM_START + 0x44
_08037E04: .4byte 0xFFFFFBFF

	thumb_func_start sub_8037E08
sub_8037E08: @ 0x08037E08
	push {r4, r5, r6, r7, lr}
	ldr r0, _08037F2C @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r1, _08037F30 @ =IWRAM_START + 0x14
	adds r6, r4, r1
	ldr r2, _08037F34 @ =IWRAM_START + 0x44
	adds r7, r4, r2
	ldr r2, _08037F38 @ =gSineTable
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037F3C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08037EC0
	ldr r0, _08037F40 @ =gBldRegs
	strh r1, [r0, #4]
	ldr r3, _08037F44 @ =gUnknown_080D7704
	ldrb r1, [r5, #1]
	adds r1, #1
	strb r1, [r5, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r5]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5, #2]
	ldr r1, _08037F48 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037F4C @ =IWRAM_START + 0x34
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08037F50 @ =IWRAM_START + 0x35
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08037F54 @ =gUnknown_080D7540
	ldr r0, [r1, #8]
	str r0, [r7, #4]
	ldrh r0, [r1, #0xc]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #0xe]
	adds r2, #0x30
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08037F58 @ =IWRAM_START + 0x65
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	mov r2, ip
	ldr r1, [r2]
	ldr r0, _08037F5C @ =sub_8037F68
	str r0, [r1, #8]
	movs r0, #0x72
	bl m4aSongNumStop
	movs r0, #0xdd
	bl m4aSongNumStart
_08037EC0:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, _08037F60 @ =gCamera
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r1, _08037F64 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08037F24
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_08037F24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037F2C: .4byte gCurTask
_08037F30: .4byte IWRAM_START + 0x14
_08037F34: .4byte IWRAM_START + 0x44
_08037F38: .4byte gSineTable
_08037F3C: .4byte 0x000003FF
_08037F40: .4byte gBldRegs
_08037F44: .4byte gUnknown_080D7704
_08037F48: .4byte gUnknown_080D76F0
_08037F4C: .4byte IWRAM_START + 0x34
_08037F50: .4byte IWRAM_START + 0x35
_08037F54: .4byte gUnknown_080D7540
_08037F58: .4byte IWRAM_START + 0x65
_08037F5C: .4byte sub_8037F68
_08037F60: .4byte gCamera
_08037F64: .4byte 0xFFFFFBFF

	thumb_func_start sub_8037F68
sub_8037F68: @ 0x08037F68
	push {r4, r5, r6, lr}
	ldr r0, _08037FF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0x14
	adds r4, r1, r0
	ldr r1, [r5, #0xc]
	ldr r0, _08037FF4 @ =0xFFFFE000
	cmp r1, r0
	ble _08037F88
	ldr r2, _08037FF8 @ =0xFFFFF800
	adds r0, r1, r2
	str r0, [r5, #0xc]
_08037F88:
	ldr r2, _08037FFC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08038000 @ =gBldRegs
	movs r6, #0
	movs r2, #0xff
	strh r2, [r3]
	ldr r1, _08038004 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _08038032
	ldrh r0, [r3, #4]
	cmp r0, #0x10
	bne _0803802C
	ldr r1, _08038008 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0803800C @ =gUnknown_03002AE4
	ldr r0, _08038010 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08038014 @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _08038018 @ =gUnknown_03004D5C
	ldr r0, _0803801C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08038020 @ =gGameMode
	strb r6, [r0]
	ldr r0, _08038024 @ =gSelectedCharacter
	strb r6, [r0]
	ldr r1, _08038028 @ =gCurrentLevel
	movs r0, #0x1d
	strb r0, [r1]
	bl sub_801A6D8
	bl sub_801A770
	b _080380A2
	.align 2, 0
_08037FF0: .4byte gCurTask
_08037FF4: .4byte 0xFFFFE000
_08037FF8: .4byte 0xFFFFF800
_08037FFC: .4byte gDispCnt
_08038000: .4byte gBldRegs
_08038004: .4byte gWinRegs
_08038008: .4byte 0x0000FFFF
_0803800C: .4byte gUnknown_03002AE4
_08038010: .4byte gUnknown_0300287C
_08038014: .4byte gUnknown_03005390
_08038018: .4byte gUnknown_03004D5C
_0803801C: .4byte gUnknown_03002A84
_08038020: .4byte gGameMode
_08038024: .4byte gSelectedCharacter
_08038028: .4byte gCurrentLevel
_0803802C:
	adds r0, #1
	strh r0, [r3, #4]
	b _08038036
_08038032:
	subs r0, #1
	strh r0, [r5, #2]
_08038036:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r6, _080380A8 @ =gCamera
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r5, #2]
	cmp r0, #0x99
	bls _08038090
	adds r4, r5, #0
	adds r4, #0x44
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r1, [r6, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	ldr r1, _080380AC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_08038090:
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080380A2
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_080380A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080380A8: .4byte gCamera
_080380AC: .4byte 0xFFFFFBFF

	thumb_func_start sub_80380B0
sub_80380B0: @ 0x080380B0
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803814C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038128
	ldr r3, _08038150 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038154 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038158 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803815C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038160 @ =sub_8038168
	str r0, [r1, #8]
_08038128:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038164 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803814C: .4byte gCurTask
_08038150: .4byte gUnknown_080D7704
_08038154: .4byte gUnknown_080D76F0
_08038158: .4byte IWRAM_START + 0x34
_0803815C: .4byte IWRAM_START + 0x35
_08038160: .4byte sub_8038168
_08038164: .4byte gCamera

	thumb_func_start sub_8038168
sub_8038168: @ 0x08038168
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803821C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0803818A
	movs r0, #0
	strh r0, [r4, #0x10]
_0803818A:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080381F8
	ldr r3, _08038220 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038224 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038228 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803822C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038230 @ =sub_8038238
	str r0, [r1, #8]
_080381F8:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038234 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803821C: .4byte gCurTask
_08038220: .4byte gUnknown_080D7704
_08038224: .4byte gUnknown_080D76F0
_08038228: .4byte IWRAM_START + 0x34
_0803822C: .4byte IWRAM_START + 0x35
_08038230: .4byte sub_8038238
_08038234: .4byte gCamera

	thumb_func_start sub_8038238
sub_8038238: @ 0x08038238
	push {r4, r5, r6, r7, lr}
	ldr r7, _080382D4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080382B0
	ldr r3, _080382D8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080382DC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080382E0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080382E4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080382E8 @ =sub_80382F0
	str r0, [r1, #8]
_080382B0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080382EC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080382D4: .4byte gCurTask
_080382D8: .4byte gUnknown_080D7704
_080382DC: .4byte gUnknown_080D76F0
_080382E0: .4byte IWRAM_START + 0x34
_080382E4: .4byte IWRAM_START + 0x35
_080382E8: .4byte sub_80382F0
_080382EC: .4byte gCamera

	thumb_func_start sub_80382F0
sub_80382F0: @ 0x080382F0
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803839C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038312
	movs r0, #0
	strh r0, [r4, #0x10]
_08038312:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038378
	ldr r3, _080383A0 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080383A4 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080383A8 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080383AC @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080383B0 @ =sub_80383B8
	str r0, [r1, #8]
_08038378:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080383B4 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803839C: .4byte gCurTask
_080383A0: .4byte gUnknown_080D7704
_080383A4: .4byte gUnknown_080D76F0
_080383A8: .4byte IWRAM_START + 0x34
_080383AC: .4byte IWRAM_START + 0x35
_080383B0: .4byte sub_80383B8
_080383B4: .4byte gCamera

	thumb_func_start sub_80383B8
sub_80383B8: @ 0x080383B8
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038440 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803841C
	ldr r3, _08038444 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038448 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803844C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038450 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038454 @ =sub_803845C
	str r0, [r1, #8]
_0803841C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038458 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038440: .4byte gCurTask
_08038444: .4byte gUnknown_080D7704
_08038448: .4byte gUnknown_080D76F0
_0803844C: .4byte IWRAM_START + 0x34
_08038450: .4byte IWRAM_START + 0x35
_08038454: .4byte sub_803845C
_08038458: .4byte gCamera

	thumb_func_start sub_803845C
sub_803845C: @ 0x0803845C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080384E4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080384C0
	ldr r3, _080384E8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080384EC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080384F0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080384F4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080384F8 @ =sub_8038500
	str r0, [r1, #8]
_080384C0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080384FC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080384E4: .4byte gCurTask
_080384E8: .4byte gUnknown_080D7704
_080384EC: .4byte gUnknown_080D76F0
_080384F0: .4byte IWRAM_START + 0x34
_080384F4: .4byte IWRAM_START + 0x35
_080384F8: .4byte sub_8038500
_080384FC: .4byte gCamera

	thumb_func_start sub_8038500
sub_8038500: @ 0x08038500
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038588 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038564
	ldr r3, _0803858C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038590 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038594 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038598 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803859C @ =sub_803997C
	str r0, [r1, #8]
_08038564:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080385A0 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038588: .4byte gCurTask
_0803858C: .4byte gUnknown_080D7704
_08038590: .4byte gUnknown_080D76F0
_08038594: .4byte IWRAM_START + 0x34
_08038598: .4byte IWRAM_START + 0x35
_0803859C: .4byte sub_803997C
_080385A0: .4byte gCamera

	thumb_func_start sub_80385A4
sub_80385A4: @ 0x080385A4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038648 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038624
	ldr r3, _0803864C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038650 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038654 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038658 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803865C @ =sub_8038664
	str r0, [r1, #8]
_08038624:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038660 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038648: .4byte gCurTask
_0803864C: .4byte gUnknown_080D7704
_08038650: .4byte gUnknown_080D76F0
_08038654: .4byte IWRAM_START + 0x34
_08038658: .4byte IWRAM_START + 0x35
_0803865C: .4byte sub_8038664
_08038660: .4byte gCamera

	thumb_func_start sub_8038664
sub_8038664: @ 0x08038664
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038710 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038686
	movs r0, #0
	strh r0, [r4, #0x10]
_08038686:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080386EC
	ldr r3, _08038714 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038718 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803871C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038720 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038724 @ =sub_803872C
	str r0, [r1, #8]
_080386EC:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038728 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038710: .4byte gCurTask
_08038714: .4byte gUnknown_080D7704
_08038718: .4byte gUnknown_080D76F0
_0803871C: .4byte IWRAM_START + 0x34
_08038720: .4byte IWRAM_START + 0x35
_08038724: .4byte sub_803872C
_08038728: .4byte gCamera

	thumb_func_start sub_803872C
sub_803872C: @ 0x0803872C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080387D8 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0803874E
	movs r0, #0
	strh r0, [r4, #0x10]
_0803874E:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080387B4
	ldr r3, _080387DC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080387E0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080387E4 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080387E8 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080387EC @ =sub_80387F4
	str r0, [r1, #8]
_080387B4:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080387F0 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080387D8: .4byte gCurTask
_080387DC: .4byte gUnknown_080D7704
_080387E0: .4byte gUnknown_080D76F0
_080387E4: .4byte IWRAM_START + 0x34
_080387E8: .4byte IWRAM_START + 0x35
_080387EC: .4byte sub_80387F4
_080387F0: .4byte gCamera

	thumb_func_start sub_80387F4
sub_80387F4: @ 0x080387F4
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803887C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038858
	ldr r3, _08038880 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038884 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038888 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803888C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038890 @ =sub_8038898
	str r0, [r1, #8]
_08038858:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038894 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803887C: .4byte gCurTask
_08038880: .4byte gUnknown_080D7704
_08038884: .4byte gUnknown_080D76F0
_08038888: .4byte IWRAM_START + 0x34
_0803888C: .4byte IWRAM_START + 0x35
_08038890: .4byte sub_8038898
_08038894: .4byte gCamera

	thumb_func_start sub_8038898
sub_8038898: @ 0x08038898
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038920 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080388FC
	ldr r3, _08038924 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038928 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803892C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038930 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038934 @ =sub_803893C
	str r0, [r1, #8]
_080388FC:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038938 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038920: .4byte gCurTask
_08038924: .4byte gUnknown_080D7704
_08038928: .4byte gUnknown_080D76F0
_0803892C: .4byte IWRAM_START + 0x34
_08038930: .4byte IWRAM_START + 0x35
_08038934: .4byte sub_803893C
_08038938: .4byte gCamera

	thumb_func_start sub_803893C
sub_803893C: @ 0x0803893C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080389C4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080389A0
	ldr r3, _080389C8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080389CC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080389D0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080389D4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080389D8 @ =sub_80399A4
	str r0, [r1, #8]
_080389A0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080389DC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080389C4: .4byte gCurTask
_080389C8: .4byte gUnknown_080D7704
_080389CC: .4byte gUnknown_080D76F0
_080389D0: .4byte IWRAM_START + 0x34
_080389D4: .4byte IWRAM_START + 0x35
_080389D8: .4byte sub_80399A4
_080389DC: .4byte gCamera

	thumb_func_start sub_80389E0
sub_80389E0: @ 0x080389E0
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038A84 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038A60
	ldr r3, _08038A88 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038A8C @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038A90 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038A94 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038A98 @ =sub_8038AA0
	str r0, [r1, #8]
_08038A60:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038A9C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038A84: .4byte gCurTask
_08038A88: .4byte gUnknown_080D7704
_08038A8C: .4byte gUnknown_080D76F0
_08038A90: .4byte IWRAM_START + 0x34
_08038A94: .4byte IWRAM_START + 0x35
_08038A98: .4byte sub_8038AA0
_08038A9C: .4byte gCamera

	thumb_func_start sub_8038AA0
sub_8038AA0: @ 0x08038AA0
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038B50 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038AC2
	movs r0, #0
	strh r0, [r4, #0x10]
_08038AC2:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08038B2C
	strh r0, [r4, #0x10]
	ldr r3, _08038B54 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038B58 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038B5C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038B60 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038B64 @ =sub_8038B6C
	str r0, [r1, #8]
_08038B2C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038B68 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038B50: .4byte gCurTask
_08038B54: .4byte gUnknown_080D7704
_08038B58: .4byte gUnknown_080D76F0
_08038B5C: .4byte IWRAM_START + 0x34
_08038B60: .4byte IWRAM_START + 0x35
_08038B64: .4byte sub_8038B6C
_08038B68: .4byte gCamera

	thumb_func_start sub_8038B6C
sub_8038B6C: @ 0x08038B6C
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038C18 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038B8E
	movs r0, #0
	strh r0, [r4, #0x10]
_08038B8E:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038BF4
	ldr r3, _08038C1C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038C20 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038C24 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038C28 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038C2C @ =sub_8038C34
	str r0, [r1, #8]
_08038BF4:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038C30 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038C18: .4byte gCurTask
_08038C1C: .4byte gUnknown_080D7704
_08038C20: .4byte gUnknown_080D76F0
_08038C24: .4byte IWRAM_START + 0x34
_08038C28: .4byte IWRAM_START + 0x35
_08038C2C: .4byte sub_8038C34
_08038C30: .4byte gCamera

	thumb_func_start sub_8038C34
sub_8038C34: @ 0x08038C34
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038CBC @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038C98
	ldr r3, _08038CC0 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038CC4 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038CC8 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038CCC @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038CD0 @ =sub_8038CD8
	str r0, [r1, #8]
_08038C98:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038CD4 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038CBC: .4byte gCurTask
_08038CC0: .4byte gUnknown_080D7704
_08038CC4: .4byte gUnknown_080D76F0
_08038CC8: .4byte IWRAM_START + 0x34
_08038CCC: .4byte IWRAM_START + 0x35
_08038CD0: .4byte sub_8038CD8
_08038CD4: .4byte gCamera

	thumb_func_start sub_8038CD8
sub_8038CD8: @ 0x08038CD8
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038D60 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038D3C
	ldr r3, _08038D64 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038D68 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038D6C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038D70 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038D74 @ =sub_8038D7C
	str r0, [r1, #8]
_08038D3C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038D78 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038D60: .4byte gCurTask
_08038D64: .4byte gUnknown_080D7704
_08038D68: .4byte gUnknown_080D76F0
_08038D6C: .4byte IWRAM_START + 0x34
_08038D70: .4byte IWRAM_START + 0x35
_08038D74: .4byte sub_8038D7C
_08038D78: .4byte gCamera

	thumb_func_start sub_8038D7C
sub_8038D7C: @ 0x08038D7C
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038E04 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038DE0
	ldr r3, _08038E08 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038E0C @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038E10 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038E14 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038E18 @ =sub_80399CC
	str r0, [r1, #8]
_08038DE0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038E1C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038E04: .4byte gCurTask
_08038E08: .4byte gUnknown_080D7704
_08038E0C: .4byte gUnknown_080D76F0
_08038E10: .4byte IWRAM_START + 0x34
_08038E14: .4byte IWRAM_START + 0x35
_08038E18: .4byte sub_80399CC
_08038E1C: .4byte gCamera

	thumb_func_start sub_8038E20
sub_8038E20: @ 0x08038E20
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038EC4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldr r2, _08038EC8 @ =IWRAM_START + 0x36
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038EA0
	ldr r3, _08038ECC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038ED0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038ED4 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038ED8 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038EDC @ =sub_8038EE4
	str r0, [r1, #8]
_08038EA0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038EE0 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038EC4: .4byte gCurTask
_08038EC8: .4byte IWRAM_START + 0x36
_08038ECC: .4byte gUnknown_080D7704
_08038ED0: .4byte gUnknown_080D76F0
_08038ED4: .4byte IWRAM_START + 0x34
_08038ED8: .4byte IWRAM_START + 0x35
_08038EDC: .4byte sub_8038EE4
_08038EE0: .4byte gCamera

	thumb_func_start sub_8038EE4
sub_8038EE4: @ 0x08038EE4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038F9C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038F06
	movs r0, #0
	strh r0, [r4, #0x10]
_08038F06:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	adds r2, r0, r1
	str r2, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08038F76
	ldr r3, _08038FA0 @ =0xFFFFFE00
	adds r0, r2, r3
	str r0, [r4, #0xc]
	strh r1, [r4, #0x10]
	ldr r3, _08038FA4 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038FA8 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038FAC @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _08038FB0 @ =IWRAM_START + 0x35
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038FB4 @ =sub_8038FBC
	str r0, [r1, #8]
_08038F76:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038FB8 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038F9C: .4byte gCurTask
_08038FA0: .4byte 0xFFFFFE00
_08038FA4: .4byte gUnknown_080D7704
_08038FA8: .4byte gUnknown_080D76F0
_08038FAC: .4byte IWRAM_START + 0x34
_08038FB0: .4byte IWRAM_START + 0x35
_08038FB4: .4byte sub_8038FBC
_08038FB8: .4byte gCamera

	thumb_func_start sub_8038FBC
sub_8038FBC: @ 0x08038FBC
	push {r4, r5, r6, r7, lr}
	ldr r7, _08039068 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038FDE
	movs r0, #0
	strh r0, [r4, #0x10]
_08038FDE:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08039044
	ldr r3, _0803906C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08039070 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08039074 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08039078 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803907C @ =sub_8039084
	str r0, [r1, #8]
_08039044:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039080 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039068: .4byte gCurTask
_0803906C: .4byte gUnknown_080D7704
_08039070: .4byte gUnknown_080D76F0
_08039074: .4byte IWRAM_START + 0x34
_08039078: .4byte IWRAM_START + 0x35
_0803907C: .4byte sub_8039084
_08039080: .4byte gCamera

	thumb_func_start sub_8039084
sub_8039084: @ 0x08039084
	push {r4, r5, r6, lr}
	ldr r2, _080390A8 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r1, [r4, #8]
	ldr r0, _080390AC @ =0x0000B7FF
	adds r6, r2, #0
	cmp r1, r0
	bgt _080390B0
	adds r0, r1, #0
	adds r0, #0x80
	str r0, [r4, #8]
	b _080390B8
	.align 2, 0
_080390A8: .4byte gCurTask
_080390AC: .4byte 0x0000B7FF
_080390B0:
	ldr r0, [r5, #0x10]
	ldr r1, _08039130 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
_080390B8:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803910A
	ldr r3, _08039134 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08039138 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r6]
	ldr r0, _0803913C @ =sub_8039144
	str r0, [r1, #8]
_0803910A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039140 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039130: .4byte 0xFFFFFBFF
_08039134: .4byte gUnknown_080D7704
_08039138: .4byte gUnknown_080D76F0
_0803913C: .4byte sub_8039144
_08039140: .4byte gCamera

	thumb_func_start sub_8039144
sub_8039144: @ 0x08039144
	push {r4, r5, r6, r7, lr}
	ldr r7, _080391E4 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, #0x14
	adds r5, r6, r0
	ldr r1, [r4, #8]
	ldr r0, _080391E8 @ =0x000097FF
	cmp r1, r0
	bgt _08039164
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r4, #8]
_08039164:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080391BE
	ldr r3, _080391EC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080391F0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080391F4 @ =IWRAM_START + 0x34
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080391F8 @ =IWRAM_START + 0x35
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _080391FC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r1, [r7]
	ldr r0, _08039200 @ =sub_8039208
	str r0, [r1, #8]
_080391BE:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039204 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080391E4: .4byte gCurTask
_080391E8: .4byte 0x000097FF
_080391EC: .4byte gUnknown_080D7704
_080391F0: .4byte gUnknown_080D76F0
_080391F4: .4byte IWRAM_START + 0x34
_080391F8: .4byte IWRAM_START + 0x35
_080391FC: .4byte 0xFFFFFBFF
_08039200: .4byte sub_8039208
_08039204: .4byte gCamera

	thumb_func_start sub_8039208
sub_8039208: @ 0x08039208
	push {r4, r5, r6, r7, lr}
	ldr r7, _08039290 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803926C
	ldr r3, _08039294 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08039298 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803929C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080392A0 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080392A4 @ =sub_8039A10
	str r0, [r1, #8]
_0803926C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080392A8 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039290: .4byte gCurTask
_08039294: .4byte gUnknown_080D7704
_08039298: .4byte gUnknown_080D76F0
_0803929C: .4byte IWRAM_START + 0x34
_080392A0: .4byte IWRAM_START + 0x35
_080392A4: .4byte sub_8039A10
_080392A8: .4byte gCamera

	thumb_func_start sub_80392AC
sub_80392AC: @ 0x080392AC
	push {r4, r5, lr}
	ldr r0, _08039340 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08039344 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #3
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _080392D2
	ldrb r0, [r4]
	cmp r0, #0x2b
	bhi _080392D2
	adds r0, #1
	strb r0, [r4]
_080392D2:
	ldr r0, [r4, #8]
	adds r0, #2
	str r0, [r4, #8]
	ldr r1, _08039348 @ =gCamera
	movs r0, #0
	str r0, [r1]
	ldrb r0, [r4]
	str r0, [r1, #4]
	adds r1, r5, #0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	bl sub_803959C
	ldr r1, [r4, #4]
	movs r0, #0xb9
	lsls r0, r0, #1
	cmp r1, r0
	beq _0803937C
	subs r3, r1, #1
	str r3, [r4, #4]
	cmp r3, #0
	bne _08039332
	subs r0, #0x72
	str r0, [r4, #8]
	ldr r0, _08039340 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803934C @ =sub_80393A4
	str r0, [r1, #8]
	movs r0, #0xde
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r1, _08039350 @ =gUnknown_080D7560
	ldr r0, [r1]
	str r0, [r2, #4]
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	movs r5, #0xee
	lsls r5, r5, #1
	adds r0, r4, r5
	strb r1, [r0]
	str r3, [r2, #0x10]
	ldr r0, _08039354 @ =0x000001DD
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
_08039332:
	ldr r2, [r4, #4]
	cmp r2, #0x3c
	bne _08039358
	bl sub_804CD50
	b _0803939C
	.align 2, 0
_08039340: .4byte gCurTask
_08039344: .4byte gUnknown_03005590
_08039348: .4byte gCamera
_0803934C: .4byte sub_80393A4
_08039350: .4byte gUnknown_080D7560
_08039354: .4byte 0x000001DD
_08039358:
	cmp r2, #0x3b
	bhi _0803939C
	ldr r1, _08039374 @ =gSineTable
	ldr r0, _08039378 @ =0x000003FF
	ands r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	b _0803939C
	.align 2, 0
_08039374: .4byte gSineTable
_08039378: .4byte 0x000003FF
_0803937C:
	ldr r3, _08039394 @ =gBldRegs
	ldrh r2, [r3, #4]
	cmp r2, #0
	beq _08039398
	ldr r0, [r5]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0803939C
	subs r0, r2, #1
	strh r0, [r3, #4]
	b _0803939C
	.align 2, 0
_08039394: .4byte gBldRegs
_08039398:
	subs r0, r1, #1
	str r0, [r4, #4]
_0803939C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80393A4
sub_80393A4: @ 0x080393A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0803951C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7, #8]
	adds r0, #1
	str r0, [r7, #8]
	ldr r1, _08039520 @ =gUnknown_03005590
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08039524 @ =gUnknown_030054B8
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r0, #7
	str r0, [r7, #4]
	cmp r0, #0xfa
	bhi _080393DC
	b _08039500
_080393DC:
	add r1, sp, #8
	add r0, sp, #4
	bl sub_8050B2C
	ldr r0, [sp, #4]
	movs r1, #0xa0
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r3, #0
	mov sl, r3
	ldr r0, _08039528 @ =IWRAM_START + 0x10
	adds r0, r4, r0
	str r0, [sp, #0x10]
_08039402:
	ldr r1, [sp, #0x10]
	add r1, sl
	str r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803948E
	mov r2, sl
	lsls r2, r2, #3
	mov sb, r2
	adds r6, r7, #0
	adds r6, #0x30
	add r6, sb
	ldr r0, [r6]
	ldr r1, [sp, #4]
	ldr r2, [r7, #4]
	mov r3, sl
	lsls r3, r3, #2
	mov r8, r3
	add r3, sl
	lsls r3, r3, #1
	ldr r4, _0803952C @ =gUnknown_080D7838
	adds r3, r3, r4
	ldrb r4, [r3]
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	str r0, [r6]
	adds r5, r7, #0
	adds r5, #0x34
	add r5, sb
	ldr r0, [r5]
	ldr r1, [sp, #8]
	ldr r2, [r7, #4]
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5]
	movs r0, #0x98
	lsls r0, r0, #1
	adds r2, r7, r0
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	subs r1, r1, r0
	movs r3, #0
	strh r1, [r2]
	movs r1, #0x99
	lsls r1, r1, #1
	adds r2, r7, r1
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	subs r1, r1, r0
	strh r1, [r2]
	ldr r0, [r6]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r1, [sp, #4]
	cmp r0, r1
	ble _0803948E
	ldr r4, [sp, #0xc]
	strb r3, [r4]
_0803948E:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0x1f
	bls _08039402
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r6, r7, r0
	ldrb r0, [r6]
	cmp r0, #0
	beq _08039500
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	movs r0, #0xc8
	lsls r0, r0, #7
	ldr r1, [sp, #4]
	ldr r2, [r7, #4]
	adds r2, #0x20
	movs r4, #3
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	movs r1, #0xda
	lsls r1, r1, #1
	adds r5, r7, r1
	str r0, [r5]
	movs r0, #0xb4
	lsls r0, r0, #8
	ldr r1, [sp, #8]
	ldr r2, [r7, #4]
	adds r2, #0x60
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r7, r2
	str r0, [r1]
	ldr r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	ldr r1, [sp, #4]
	cmp r0, r1
	ble _08039500
	movs r0, #0
	strb r0, [r6]
	ldr r0, _08039530 @ =gMPlayInfo_SE2
	movs r1, #4
	bl m4aMPlayFadeOutTemporarily
_08039500:
	ldr r2, [r7, #4]
	ldr r0, _08039534 @ =0x00000AEF
	cmp r2, r0
	bhi _08039540
	ldr r1, _08039538 @ =gSineTable
	ldr r0, _0803953C @ =0x000003FF
	ands r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	b _08039582
	.align 2, 0
_0803951C: .4byte gCurTask
_08039520: .4byte gUnknown_03005590
_08039524: .4byte gUnknown_030054B8
_08039528: .4byte IWRAM_START + 0x10
_0803952C: .4byte gUnknown_080D7838
_08039530: .4byte gMPlayInfo_SE2
_08039534: .4byte 0x00000AEF
_08039538: .4byte gSineTable
_0803953C: .4byte 0x000003FF
_08039540:
	ldr r0, _08039578 @ =0x00000BB8
	cmp r2, r0
	bls _08039580
	movs r0, #0
	bl sub_8037438
	movs r0, #1
	bl sub_8037438
	movs r0, #2
	bl sub_8037438
	movs r0, #3
	bl sub_8037438
	movs r0, #4
	bl sub_8037438
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0803957C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0803958C
	.align 2, 0
_08039578: .4byte 0x00000BB8
_0803957C: .4byte gCurTask
_08039580:
	movs r0, #0
_08039582:
	strb r0, [r7, #0xe]
	strb r0, [r7, #0xf]
	movs r0, #1
	bl sub_803959C
_0803958C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803959C
sub_803959C: @ 0x0803959C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080396BC @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _080396C0 @ =gBgScrollRegs
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	ldrb r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	mov r3, r8
	movs r0, #0xf
	ldrsb r0, [r3, r0]
	ldrb r5, [r3]
	adds r0, r0, r5
	strh r0, [r1, #6]
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	strh r0, [r1, #4]
	ldr r1, _080396C4 @ =IWRAM_START + 0x1EC
	adds r0, r6, r1
	bl sub_8004558
	ldr r2, _080396C8 @ =IWRAM_START + 0x21C
	adds r0, r6, r2
	bl sub_8004558
	ldr r3, _080396CC @ =IWRAM_START + 0x24C
	adds r0, r6, r3
	bl sub_8004558
	mov r5, r8
	ldr r1, [r5, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r2, _080396D0 @ =0x000003FF
	ands r0, r2
	str r0, [sp]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r2
	str r0, [sp, #4]
	cmp r4, #0
	beq _080396E0
	movs r0, #0
	mov sb, r0
	ldr r1, _080396D4 @ =IWRAM_START + 0x10
	adds r1, r1, r6
	mov sl, r1
_08039620:
	mov r0, sl
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _080396AA
	mov r2, sb
	lsls r6, r2, #2
	adds r0, r6, r2
	lsls r0, r0, #1
	ldr r3, _080396D8 @ =gUnknown_080D7838
	adds r0, r0, r3
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xf6
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r2, r8
	adds r7, r2, r0
	mov r3, sb
	lsls r2, r3, #3
	mov r5, r8
	adds r5, #0x30
	adds r5, r5, r2
	movs r3, #0x98
	lsls r3, r3, #1
	add r3, r8
	adds r3, r3, r6
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	mov r4, r8
	adds r4, #0x34
	adds r4, r4, r2
	movs r2, #0x99
	lsls r2, r2, #1
	add r2, r8
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r3]
	subs r0, #0x28
	strh r0, [r3]
	ldrh r0, [r2]
	subs r0, #0x10
	strh r0, [r2]
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldrb r1, [r2]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	ldr r1, _080396DC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_080396AA:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x1f
	bls _08039620
	b _08039816
	.align 2, 0
_080396BC: .4byte gCurTask
_080396C0: .4byte gBgScrollRegs
_080396C4: .4byte IWRAM_START + 0x1EC
_080396C8: .4byte IWRAM_START + 0x21C
_080396CC: .4byte IWRAM_START + 0x24C
_080396D0: .4byte 0x000003FF
_080396D4: .4byte IWRAM_START + 0x10
_080396D8: .4byte gUnknown_080D7838
_080396DC: .4byte 0xFFFFFBFF
_080396E0:
	movs r3, #0
	mov sb, r3
	ldr r5, _080397CC @ =IWRAM_START + 0x30
	adds r5, r6, r5
	str r5, [sp, #0x10]
	ldr r0, _080397D0 @ =IWRAM_START + 0x34
	adds r0, r6, r0
	str r0, [sp, #0x14]
	ldr r6, _080397D4 @ =gUnknown_080D7830
	ldr r1, _080397D8 @ =gSineTable
	mov sl, r1
_080396F6:
	mov r2, sb
	lsls r2, r2, #2
	mov ip, r2
	add r2, sb
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #8
	adds r0, r2, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xf6
	lsls r5, r5, #1
	adds r0, r0, r5
	mov r1, r8
	adds r7, r1, r0
	mov r5, sb
	lsls r3, r5, #3
	ldr r0, [sp, #0x10]
	adds r4, r0, r3
	ldr r1, [r4]
	str r1, [sp, #8]
	ldr r5, [sp, #0x14]
	adds r3, r5, r3
	ldr r0, [r3]
	str r0, [sp, #0xc]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r1, [sp]
	adds r5, r1, r5
	lsls r0, r5, #1
	add r0, sl
	movs r5, #0
	ldrsh r1, [r0, r5]
	str r1, [sp, #0x1c]
	adds r0, r6, #4
	adds r0, r2, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r5, [sp, #0x1c]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #4
	str r1, [r4]
	adds r0, r2, r6
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	add r0, sl
	movs r1, #0
	ldrsh r5, [r0, r1]
	str r5, [sp, #0x1c]
	adds r0, r6, #6
	adds r0, r2, r0
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r5, [sp, #0x1c]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #4
	str r1, [r3]
	ldr r0, _080397DC @ =gUnknown_080D7832
	adds r2, r2, r0
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3]
	movs r2, #0x98
	lsls r2, r2, #1
	add r2, r8
	add r2, ip
	ldr r0, [r4]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r2]
	movs r1, #0x99
	lsls r1, r1, #1
	add r1, r8
	add r1, ip
	ldr r0, [r3]
	ldr r5, [sp, #0xc]
	subs r0, r0, r5
	strh r0, [r1]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	ldr r0, [r3]
	asrs r0, r0, #8
	mov r3, r8
	ldrb r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _080397E4
	ldr r0, [r7, #0x10]
	ldr r1, _080397E0 @ =0xFFFFFBFF
	ands r0, r1
	b _080397EC
	.align 2, 0
_080397CC: .4byte IWRAM_START + 0x30
_080397D0: .4byte IWRAM_START + 0x34
_080397D4: .4byte gUnknown_080D7830
_080397D8: .4byte gSineTable
_080397DC: .4byte gUnknown_080D7832
_080397E0: .4byte 0xFFFFFBFF
_080397E4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080397EC:
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [sp]
	subs r0, #0x40
	ldr r1, _08039868 @ =0x000003FF
	ands r0, r1
	str r0, [sp]
	ldr r0, [sp, #4]
	subs r0, #0x40
	ands r0, r1
	str r0, [sp, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x1f
	bhi _08039816
	b _080396F6
_08039816:
	movs r0, #0xd8
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039858
	movs r7, #0xde
	lsls r7, r7, #1
	add r7, r8
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, r8
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0xdc
	lsls r0, r0, #1
	add r0, r8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2]
	subs r1, r1, r0
	movs r0, #0xf
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08039858:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039868: .4byte 0x000003FF

	thumb_func_start sub_803986C
sub_803986C: @ 0x0803986C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r1, _0803993C @ =gDispCnt
	ldr r2, _08039940 @ =0x00001341
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08039944 @ =gBgCntRegs
	movs r0, #0
	mov r8, r0
	movs r4, #0
	ldr r0, _08039948 @ =0x00005C09
	strh r0, [r1, #4]
	ldr r0, _0803994C @ =0x00001E06
	strh r0, [r1, #2]
	adds r0, #0xfd
	strh r0, [r1]
	ldr r0, _08039950 @ =gBgScrollRegs
	strh r4, [r0]
	movs r1, #0x48
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r1, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	ldr r0, _08039954 @ =gUnknown_03004D80
	mov r1, r8
	strb r1, [r0, #2]
	ldr r1, _08039958 @ =gUnknown_03002280
	mov r2, r8
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r6, #0x20
	strb r6, [r1, #0xb]
	ldr r0, _0803995C @ =sub_8039A38
	movs r2, #0x81
	lsls r2, r2, #8
	str r4, [sp]
	movs r1, #0xc0
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08039960 @ =0x0600F800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _08039964 @ =0x00000179
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r6, [r0, #0x26]
	strh r6, [r0, #0x28]
	ldr r2, _08039968 @ =IWRAM_START + 0x2A
	adds r1, r5, r2
	mov r2, r8
	strb r2, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0803996C @ =IWRAM_START + 0x40
	adds r0, r5, r1
	ldr r1, _08039970 @ =0x06004000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08039974 @ =0x0600F000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0xbd
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r6, [r0, #0x26]
	strh r6, [r0, #0x28]
	ldr r2, _08039978 @ =IWRAM_START + 0x6A
	adds r5, r5, r2
	mov r1, r8
	strb r1, [r5]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803993C: .4byte gDispCnt
_08039940: .4byte 0x00001341
_08039944: .4byte gBgCntRegs
_08039948: .4byte 0x00005C09
_0803994C: .4byte 0x00001E06
_08039950: .4byte gBgScrollRegs
_08039954: .4byte gUnknown_03004D80
_08039958: .4byte gUnknown_03002280
_0803995C: .4byte sub_8039A38
_08039960: .4byte 0x0600F800
_08039964: .4byte 0x00000179
_08039968: .4byte IWRAM_START + 0x2A
_0803996C: .4byte IWRAM_START + 0x40
_08039970: .4byte 0x06004000
_08039974: .4byte 0x0600F000
_08039978: .4byte IWRAM_START + 0x6A

	thumb_func_start sub_803997C
sub_803997C: @ 0x0803997C
	push {r4, lr}
	ldr r0, _0803999C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080399A0 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803999C: .4byte gCurTask
_080399A0: .4byte IWRAM_START + 0x14

	thumb_func_start sub_80399A4
sub_80399A4: @ 0x080399A4
	push {r4, lr}
	ldr r0, _080399C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080399C8 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080399C4: .4byte gCurTask
_080399C8: .4byte IWRAM_START + 0x14

	thumb_func_start sub_80399CC
sub_80399CC: @ 0x080399CC
	push {r4, lr}
	ldr r0, _08039A04 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, _08039A08 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039A0C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039A04: .4byte gCurTask
_08039A08: .4byte IWRAM_START + 0x14
_08039A0C: .4byte gCamera

	thumb_func_start sub_8039A10
sub_8039A10: @ 0x08039A10
	push {r4, lr}
	ldr r0, _08039A30 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _08039A34 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039A30: .4byte gCurTask
_08039A34: .4byte IWRAM_START + 0x14

	thumb_func_start sub_8039A38
sub_8039A38: @ 0x08039A38
	push {lr}
	ldr r0, _08039A48 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08039A48: .4byte gCurTask

	thumb_func_start sub_8039A4C
sub_8039A4C: @ 0x08039A4C
	push {lr}
	sub sp, #4
	ldr r0, _08039A68 @ =sub_8039A6C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r3, #0
	bl TaskCreate
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039A68: .4byte sub_8039A6C

	thumb_func_start sub_8039A6C
sub_8039A6C: @ 0x08039A6C
	push {lr}
	sub sp, #4
	ldr r0, _08039AB0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039AA8
	movs r0, #0
	ldr r1, _08039AB4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08039AB8 @ =gUnknown_03002AE4
	ldr r0, _08039ABC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08039AC0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08039AC4 @ =gUnknown_03004D5C
	ldr r0, _08039AC8 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08039ACC @ =sub_8039AD4
	movs r1, #0
	str r1, [sp]
	ldr r2, _08039AD0 @ =0x00008888
	movs r3, #0
	bl TaskCreate
_08039AA8:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039AB0: .4byte gPressedKeys
_08039AB4: .4byte 0x0000FFFF
_08039AB8: .4byte gUnknown_03002AE4
_08039ABC: .4byte gUnknown_0300287C
_08039AC0: .4byte gUnknown_03005390
_08039AC4: .4byte gUnknown_03004D5C
_08039AC8: .4byte gUnknown_03002A84
_08039ACC: .4byte sub_8039AD4
_08039AD0: .4byte 0x00008888

	thumb_func_start sub_8039AD4
sub_8039AD4: @ 0x08039AD4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08039B2C @ =gUnknown_030018F0
	movs r4, #0
	strb r4, [r0]
	ldr r0, _08039B30 @ =gUnknown_03002AE0
	strb r4, [r0]
	mov r0, sp
	ldr r1, _08039B34 @ =0x0000FFFF
	adds r5, r1, #0
	strh r5, [r0]
	ldr r1, _08039B38 @ =gUnknown_03001850
	ldr r6, _08039B3C @ =0x01000010
	adds r2, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r5, [r0]
	ldr r1, _08039B40 @ =gUnknown_03004D60
	adds r2, r6, #0
	bl CpuSet
	bl m4aMPlayAllStop
	ldr r0, _08039B44 @ =gGameMode
	strb r4, [r0]
	ldr r0, _08039B48 @ =gSelectedCharacter
	strb r4, [r0]
	ldr r1, _08039B4C @ =gCurrentLevel
	movs r0, #0x1d
	strb r0, [r1]
	bl sub_801A6D8
	bl sub_801A770
	ldr r0, _08039B50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039B2C: .4byte gUnknown_030018F0
_08039B30: .4byte gUnknown_03002AE0
_08039B34: .4byte 0x0000FFFF
_08039B38: .4byte gUnknown_03001850
_08039B3C: .4byte 0x01000010
_08039B40: .4byte gUnknown_03004D60
_08039B44: .4byte gGameMode
_08039B48: .4byte gSelectedCharacter
_08039B4C: .4byte gCurrentLevel
_08039B50: .4byte gCurTask

	thumb_func_start sub_8039B54
sub_8039B54: @ 0x08039B54
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08039B72
	ldrb r0, [r6]
	cmp r0, #0xf
	bhi _08039C22
_08039B72:
	ldr r0, _08039C30 @ =sub_8039C4C
	ldr r2, _08039C34 @ =0x00005432
	movs r1, #0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, [r7, #0x14]
	lsls r0, r0, #8
	str r0, [r2, #0x30]
	ldr r0, [r7, #0x18]
	lsls r0, r0, #8
	str r0, [r2, #0x34]
	ldr r3, _08039C38 @ =gSineTable
	mov sb, r3
	ldrh r3, [r7, #0xc]
	ldr r1, _08039C3C @ =0x000003FF
	adds r0, r1, #0
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #1
	mov r8, r5
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov ip, r3
	ldrh r0, [r7, #0xe]
	mov r3, ip
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xe
	movs r3, #0
	strh r0, [r2, #0x38]
	ldrh r0, [r7, #0xc]
	ands r1, r0
	lsls r1, r1, #1
	add r1, sb
	movs r5, #0
	ldrsh r1, [r1, r5]
	ldrh r0, [r7, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0x3a]
	ldrh r0, [r7, #0x1c]
	strh r0, [r2, #0x3c]
	str r6, [r2, #0x40]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	ldr r0, [r7]
	str r0, [r2, #4]
	mov r0, r8
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	ldrh r0, [r7, #8]
	strh r0, [r2, #0xa]
	ldrh r1, [r7, #0xa]
	ldr r5, _08039C40 @ =IWRAM_START + 0x20
	adds r0, r4, r5
	strb r1, [r0]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r0, _08039C44 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r5, #2
	adds r1, r4, r5
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08039C48 @ =IWRAM_START + 0x25
	adds r4, r4, r0
	strb r3, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
_08039C22:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039C30: .4byte sub_8039C4C
_08039C34: .4byte 0x00005432
_08039C38: .4byte gSineTable
_08039C3C: .4byte 0x000003FF
_08039C40: .4byte IWRAM_START + 0x20
_08039C44: .4byte IWRAM_START + 0x21
_08039C48: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8039C4C
sub_8039C4C: @ 0x08039C4C
	push {r4, r5, r6, r7, lr}
	ldr r2, _08039CF4 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r1, [r4, #0xa]
	ldr r0, _08039CF8 @ =0x0000026B
	adds r6, r2, #0
	cmp r1, r0
	bne _08039C6E
	ldr r1, _08039CFC @ =0xFFFFFF00
	adds r0, r1, #0
	ldrh r2, [r4, #0x38]
	adds r0, r0, r2
	strh r0, [r4, #0x38]
_08039C6E:
	ldrh r0, [r4, #0x3c]
	ldrh r7, [r4, #0x3a]
	adds r3, r0, r7
	strh r3, [r4, #0x3a]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #0x34]
	adds r1, r1, r2
	str r1, [r4, #0x34]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	asrs r1, r1, #8
	strh r1, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r2, r5
	bge _08039CA6
	movs r7, #0x38
	ldrsh r0, [r4, r7]
	cmp r0, #0
	blt _08039CCE
_08039CA6:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	ble _08039CB6
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _08039CCE
_08039CB6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, r5
	bge _08039CC4
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _08039CCE
_08039CC4:
	cmp r1, #0xc0
	ble _08039CD4
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _08039CD4
_08039CCE:
	ldr r1, [r6]
	ldr r0, _08039D00 @ =sub_8039F80
	str r0, [r1, #8]
_08039CD4:
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08039CE6
	ldr r0, _08039CF4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08039D00 @ =sub_8039F80
	str r0, [r1, #8]
_08039CE6:
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039CF4: .4byte gCurTask
_08039CF8: .4byte 0x0000026B
_08039CFC: .4byte 0xFFFFFF00
_08039D00: .4byte sub_8039F80

	thumb_func_start sub_8039D04
sub_8039D04: @ 0x08039D04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08039D22
	ldrb r0, [r6]
	cmp r0, #0xf
	bhi _08039DD2
_08039D22:
	ldr r0, _08039DE0 @ =sub_8039DFC
	ldr r2, _08039DE4 @ =0x00005432
	movs r1, #0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, [r7, #0x14]
	lsls r0, r0, #8
	str r0, [r2, #0x30]
	ldr r0, [r7, #0x18]
	lsls r0, r0, #8
	str r0, [r2, #0x34]
	ldr r3, _08039DE8 @ =gSineTable
	mov sb, r3
	ldrh r3, [r7, #0xc]
	ldr r1, _08039DEC @ =0x000003FF
	adds r0, r1, #0
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #1
	mov r8, r5
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov ip, r3
	ldrh r0, [r7, #0xe]
	mov r3, ip
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xe
	movs r3, #0
	strh r0, [r2, #0x38]
	ldrh r0, [r7, #0xc]
	ands r1, r0
	lsls r1, r1, #1
	add r1, sb
	movs r5, #0
	ldrsh r1, [r1, r5]
	ldrh r0, [r7, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0x3a]
	ldrh r0, [r7, #0x1c]
	strh r0, [r2, #0x3c]
	str r6, [r2, #0x40]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	ldr r0, [r7]
	str r0, [r2, #4]
	mov r0, r8
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	ldrh r0, [r7, #8]
	strh r0, [r2, #0xa]
	ldrh r1, [r7, #0xa]
	ldr r5, _08039DF0 @ =IWRAM_START + 0x20
	adds r0, r4, r5
	strb r1, [r0]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r0, _08039DF4 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r5, #2
	adds r1, r4, r5
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08039DF8 @ =IWRAM_START + 0x25
	adds r4, r4, r0
	strb r3, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
_08039DD2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039DE0: .4byte sub_8039DFC
_08039DE4: .4byte 0x00005432
_08039DE8: .4byte gSineTable
_08039DEC: .4byte 0x000003FF
_08039DF0: .4byte IWRAM_START + 0x20
_08039DF4: .4byte IWRAM_START + 0x21
_08039DF8: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8039DFC
sub_8039DFC: @ 0x08039DFC
	push {r4, r5, r6, r7, lr}
	ldr r4, _08039E98 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x3a]
	adds r6, r0, r1
	strh r6, [r5, #0x3a]
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x30]
	adds r0, r0, r1
	str r0, [r5, #0x30]
	movs r3, #0x3a
	ldrsh r1, [r5, r3]
	ldr r2, [r5, #0x34]
	adds r2, r2, r1
	str r2, [r5, #0x34]
	asrs r0, r0, #8
	ldr r3, _08039E9C @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	asrs r2, r2, #8
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r5, #0x18]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r3, r1
	bge _08039E4C
	movs r7, #0x38
	ldrsh r0, [r5, r7]
	cmp r0, #0
	blt _08039E74
_08039E4C:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r3, r0
	ble _08039E5C
	movs r3, #0x38
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bgt _08039E74
_08039E5C:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r2, r1
	bge _08039E6A
	lsls r0, r6, #0x10
	cmp r0, #0
	blt _08039E74
_08039E6A:
	cmp r2, #0xc0
	ble _08039E7A
	lsls r0, r6, #0x10
	cmp r0, #0
	ble _08039E7A
_08039E74:
	ldr r1, [r4]
	ldr r0, _08039EA0 @ =sub_8039F80
	str r0, [r1, #8]
_08039E7A:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _08039E8C
	ldr r0, _08039E98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08039EA0 @ =sub_8039F80
	str r0, [r1, #8]
_08039E8C:
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039E98: .4byte gCurTask
_08039E9C: .4byte gCamera
_08039EA0: .4byte sub_8039F80

	thumb_func_start sub_8039EA4
sub_8039EA4: @ 0x08039EA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bhi _08039EC4
	ldr r2, _08039EC8 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08039ECC @ =0x0000FFDE
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08039ED0 @ =gUnknown_080D798C
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08039EC4:
	pop {r0}
	bx r0
	.align 2, 0
_08039EC8: .4byte gUnknown_03005424
_08039ECC: .4byte 0x0000FFDE
_08039ED0: .4byte gUnknown_080D798C

	thumb_func_start sub_8039ED4
sub_8039ED4: @ 0x08039ED4
	push {lr}
	ldr r0, _08039F00 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _08039EFA
	ldr r2, _08039F04 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08039F08 @ =0xF7FFFFFF
	ands r0, r1
	ldr r1, _08039F0C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _08039F10 @ =sub_8025318
	str r0, [r2]
	adds r2, #0x6d
	movs r0, #0
	strb r0, [r2]
_08039EFA:
	pop {r0}
	bx r0
	.align 2, 0
_08039F00: .4byte gCurrentLevel
_08039F04: .4byte gPlayer
_08039F08: .4byte 0xF7FFFFFF
_08039F0C: .4byte 0xFFDFFFFF
_08039F10: .4byte sub_8025318

	thumb_func_start sub_8039F14
sub_8039F14: @ 0x08039F14
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08039F44 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	cmp r0, #0x1c
	beq _08039F3E
	ldr r0, _08039F48 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _08039F3E
	ldr r0, _08039F4C @ =gUnknown_080D79B0
	asrs r1, r1, #0x1a
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
_08039F3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039F44: .4byte gCurrentLevel
_08039F48: .4byte gUnknown_03005B4C
_08039F4C: .4byte gUnknown_080D79B0

	thumb_func_start sub_8039F50
sub_8039F50: @ 0x08039F50
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #6
	bhi _08039F74
	ldr r0, _08039F78 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _08039F74
	ldr r0, _08039F7C @ =gUnknown_080D79B0
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	movs r1, #0
	bl _call_via_r2
_08039F74:
	pop {r0}
	bx r0
	.align 2, 0
_08039F78: .4byte gUnknown_03005B4C
_08039F7C: .4byte gUnknown_080D79B0

	thumb_func_start sub_8039F80
sub_8039F80: @ 0x08039F80
	push {lr}
	ldr r2, _08039FA0 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0, #0x40]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08039FA0: .4byte gCurTask

	thumb_func_start sub_8039FA4
sub_8039FA4: @ 0x08039FA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	str r2, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _0803A0B4 @ =sub_803A10C
	movs r2, #0xe0
	lsls r2, r2, #6
	ldr r1, _0803A0B8 @ =sub_803A230
	str r1, [sp]
	movs r1, #0x64
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r7, r5
	movs r0, #0xed
	bl m4aSongNumStart
	ldr r0, _0803A0BC @ =gMPlayInfo_SE2
	movs r1, #9
	bl m4aMPlayFadeOutTemporarily
	ldr r0, _0803A0C0 @ =IWRAM_START + 0x60
	adds r1, r7, r0
	movs r6, #0
	movs r0, #0x3c
	strh r0, [r1]
	ldr r1, _0803A0C4 @ =IWRAM_START + 0x30
	adds r4, r7, r1
	mov r0, r8
	strh r0, [r4, #0x16]
	mov r1, sb
	strh r1, [r4, #0x18]
	movs r0, #8
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0803A0C8 @ =0x0000027D
	strh r0, [r4, #0xa]
	ldr r1, _0803A0CC @ =IWRAM_START + 0x50
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _0803A0D0 @ =IWRAM_START + 0x51
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0803A0D4 @ =IWRAM_START + 0x52
	adds r0, r7, r1
	movs r1, #0x10
	strb r1, [r0]
	ldr r1, _0803A0D8 @ =IWRAM_START + 0x55
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r4, #0x28]
	ldr r1, [sp, #4]
	str r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	mov r0, r8
	strh r0, [r5, #0x16]
	mov r1, sb
	strh r1, [r5, #0x18]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x9f
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r1, _0803A0DC @ =IWRAM_START + 0x20
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _0803A0E0 @ =IWRAM_START + 0x21
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0803A0E4 @ =IWRAM_START + 0x22
	adds r0, r7, r1
	movs r1, #0x10
	strb r1, [r0]
	ldr r1, _0803A0E8 @ =IWRAM_START + 0x25
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	mov r0, sl
	str r0, [r5, #0x28]
	ldr r1, [sp, #4]
	str r1, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r0, #0x80
	lsls r0, r0, #3
	ldr r1, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _0803A0F0
	ldr r0, _0803A0EC @ =IWRAM_START + 0x62
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
	b _0803A0F8
	.align 2, 0
_0803A0B4: .4byte sub_803A10C
_0803A0B8: .4byte sub_803A230
_0803A0BC: .4byte gMPlayInfo_SE2
_0803A0C0: .4byte IWRAM_START + 0x60
_0803A0C4: .4byte IWRAM_START + 0x30
_0803A0C8: .4byte 0x0000027D
_0803A0CC: .4byte IWRAM_START + 0x50
_0803A0D0: .4byte IWRAM_START + 0x51
_0803A0D4: .4byte IWRAM_START + 0x52
_0803A0D8: .4byte IWRAM_START + 0x55
_0803A0DC: .4byte IWRAM_START + 0x20
_0803A0E0: .4byte IWRAM_START + 0x21
_0803A0E4: .4byte IWRAM_START + 0x22
_0803A0E8: .4byte IWRAM_START + 0x25
_0803A0EC: .4byte IWRAM_START + 0x62
_0803A0F0:
	ldr r1, _0803A108 @ =IWRAM_START + 0x62
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
_0803A0F8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A108: .4byte IWRAM_START + 0x62

	thumb_func_start sub_803A10C
sub_803A10C: @ 0x0803A10C
	push {r4, r5, r6, lr}
	ldr r6, _0803A158 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r0, _0803A15C @ =IWRAM_START + 0x30
	adds r4, r4, r0
	ldrh r0, [r4, #0x18]
	subs r0, #2
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r5, #0x18]
	subs r0, #2
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	cmp r0, #0x32
	bgt _0803A150
	ldr r1, [r6]
	ldr r0, _0803A160 @ =sub_803A164
	str r0, [r1, #8]
_0803A150:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A158: .4byte gCurTask
_0803A15C: .4byte IWRAM_START + 0x30
_0803A160: .4byte sub_803A164

	thumb_func_start sub_803A164
sub_803A164: @ 0x0803A164
	push {r4, r5, lr}
	ldr r3, _0803A1C4 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0x60
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803A1A2
	ldr r1, _0803A1C8 @ =IWRAM_START + 0x62
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A19C
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r0, [r5, #0x40]
	orrs r0, r1
	str r0, [r5, #0x40]
_0803A19C:
	ldr r1, [r3]
	ldr r0, _0803A1CC @ =sub_803A1D0
	str r0, [r1, #8]
_0803A1A2:
	adds r4, r5, #0
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A1C4: .4byte gCurTask
_0803A1C8: .4byte IWRAM_START + 0x62
_0803A1CC: .4byte sub_803A1D0

	thumb_func_start sub_803A1D0
sub_803A1D0: @ 0x0803A1D0
	push {r4, r5, r6, lr}
	ldr r6, _0803A200 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0x30
	adds r4, r1, r0
	ldrh r2, [r4, #0x16]
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	movs r0, #0x87
	lsls r0, r0, #1
	cmp r1, r0
	ble _0803A204
	movs r0, #0xed
	bl m4aSongNumStop
	ldr r0, [r6]
	bl TaskDestroy
	b _0803A228
	.align 2, 0
_0803A200: .4byte gCurTask
_0803A204:
	adds r0, r2, #2
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, r5, #0
	ldrh r0, [r4, #0x16]
	adds r0, #2
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803A228:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803A230
sub_803A230: @ 0x0803A230
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_803A24C
sub_803A24C: @ 0x0803A24C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x7c
	ldr r2, _0803A2A4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	ldr r1, _0803A2A8 @ =gUnknown_030053B8
	ldr r0, _0803A2AC @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803A2B0 @ =sub_803A818
	ldr r1, _0803A2B4 @ =0x000004A4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803A2B8 @ =sub_803C8E4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _0803A2BC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _0803A2D4
	ldr r0, _0803A2C0 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A2C8
	ldr r0, _0803A2C4 @ =IWRAM_START + 0xB0
	adds r1, r1, r0
	movs r0, #3
	b _0803A2FE
	.align 2, 0
_0803A2A4: .4byte gPlayer
_0803A2A8: .4byte gUnknown_030053B8
_0803A2AC: .4byte gUnknown_03005590
_0803A2B0: .4byte sub_803A818
_0803A2B4: .4byte 0x000004A4
_0803A2B8: .4byte sub_803C8E4
_0803A2BC: .4byte gCurrentLevel
_0803A2C0: .4byte gUnknown_030054EC
_0803A2C4: .4byte IWRAM_START + 0xB0
_0803A2C8:
	ldr r2, _0803A2D0 @ =IWRAM_START + 0xB0
	adds r1, r1, r2
	movs r0, #4
	b _0803A2FE
	.align 2, 0
_0803A2D0: .4byte IWRAM_START + 0xB0
_0803A2D4:
	ldr r0, _0803A2EC @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A2F8
	ldr r0, _0803A2F0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803A2F8
	ldr r3, _0803A2F4 @ =IWRAM_START + 0xB0
	adds r1, r1, r3
	movs r0, #6
	b _0803A2FE
	.align 2, 0
_0803A2EC: .4byte gUnknown_030054EC
_0803A2F0: .4byte gGameMode
_0803A2F4: .4byte IWRAM_START + 0xB0
_0803A2F8:
	adds r1, r7, #0
	adds r1, #0xb0
	movs r0, #8
_0803A2FE:
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xa8
	movs r2, #0
	str r2, [r0]
	adds r1, r7, #0
	adds r1, #0xa4
	movs r0, #2
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xa0
	str r2, [r0]
	adds r1, #8
	movs r0, #0x78
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xb1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #0xf5
	lsls r1, r1, #0xa
	str r1, [r7]
	movs r0, #0x9b
	lsls r0, r0, #8
	str r0, [r7, #4]
	ldr r0, _0803A70C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #8]
	strh r2, [r7, #0xa]
	movs r1, #0
	movs r0, #0x74
	adds r0, r0, r7
	mov r8, r0
	adds r6, r7, #0
	adds r6, #0x54
	movs r2, #0x94
	adds r2, r2, r7
	mov sb, r2
	movs r3, #0x98
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x9c
	adds r0, r0, r7
	mov ip, r0
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r2, r7, r2
	str r2, [sp, #0x58]
	ldr r3, _0803A710 @ =0x00000301
	adds r3, r7, r3
	str r3, [sp, #0x5c]
	ldr r0, _0803A714 @ =0x00000302
	adds r0, r7, r0
	str r0, [sp, #0x60]
	ldr r2, _0803A718 @ =0x00000305
	adds r2, r7, r2
	str r2, [sp, #0x64]
	movs r3, #0xce
	lsls r3, r3, #2
	adds r3, r7, r3
	str r3, [sp, #0x78]
	ldr r0, _0803A71C @ =0x00000339
	adds r0, r7, r0
	str r0, [sp, #0xc]
	ldr r2, _0803A720 @ =0x0000033A
	adds r2, r7, r2
	str r2, [sp, #0x10]
	ldr r3, _0803A724 @ =0x0000033D
	adds r3, r7, r3
	str r3, [sp, #0x14]
	movs r0, #0xf2
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x48]
	ldr r2, _0803A728 @ =0x000003C9
	adds r2, r7, r2
	str r2, [sp, #0x4c]
	ldr r3, _0803A72C @ =0x000003CA
	adds r3, r7, r3
	str r3, [sp, #0x50]
	ldr r0, _0803A730 @ =0x000003CD
	adds r0, r7, r0
	str r0, [sp, #0x54]
	movs r2, #0xfe
	lsls r2, r2, #2
	adds r2, r7, r2
	str r2, [sp, #0x68]
	ldr r3, _0803A734 @ =0x000003F9
	adds r3, r7, r3
	str r3, [sp, #0x6c]
	ldr r0, _0803A738 @ =0x000003FA
	adds r0, r7, r0
	str r0, [sp, #0x70]
	ldr r2, _0803A73C @ =0x000003FD
	adds r2, r7, r2
	str r2, [sp, #0x74]
	movs r3, #0xda
	lsls r3, r3, #2
	adds r3, r7, r3
	str r3, [sp, #0x28]
	ldr r0, _0803A740 @ =0x00000369
	adds r0, r7, r0
	str r0, [sp, #0x2c]
	ldr r2, _0803A744 @ =0x0000036A
	adds r2, r7, r2
	str r2, [sp, #0x30]
	ldr r3, _0803A748 @ =0x0000036D
	adds r3, r7, r3
	str r3, [sp, #0x34]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x38]
	ldr r2, _0803A74C @ =0x00000399
	adds r2, r7, r2
	str r2, [sp, #0x3c]
	ldr r3, _0803A750 @ =0x0000039A
	adds r3, r7, r3
	str r3, [sp, #0x40]
	ldr r0, _0803A754 @ =0x0000039D
	adds r0, r7, r0
	str r0, [sp, #0x44]
	movs r2, #0x85
	lsls r2, r2, #3
	adds r2, r7, r2
	str r2, [sp, #0x18]
	ldr r3, _0803A758 @ =0x00000429
	adds r3, r7, r3
	str r3, [sp, #0x1c]
	ldr r0, _0803A75C @ =0x0000042A
	adds r0, r7, r0
	str r0, [sp, #0x20]
	ldr r2, _0803A760 @ =0x0000042D
	adds r2, r7, r2
	str r2, [sp, #0x24]
	movs r4, #0
	ldr r5, _0803A764 @ =gUnknown_080D7A38
	adds r3, r7, #0
	adds r3, #0xc
	adds r2, r7, #0
	adds r2, #0x2c
_0803A426:
	stm r2!, {r4}
	ldm r5!, {r0}
	stm r3!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _0803A426
	movs r0, #0
	str r0, [r7, #0x4c]
	str r0, [r7, #0x50]
	movs r1, #0
	movs r4, #0xc0
	lsls r4, r4, #2
	ldr r5, _0803A768 @ =gUnknown_080D7A58
	adds r3, r6, #0
	mov r2, r8
_0803A444:
	stm r2!, {r4}
	ldm r5!, {r0}
	stm r3!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _0803A444
	movs r0, #0xc0
	lsls r0, r0, #2
	mov r3, sb
	str r0, [r3]
	movs r0, #0x94
	lsls r0, r0, #5
	mov r1, sl
	str r0, [r1]
	mov r2, ip
	str r0, [r2]
	movs r3, #0xb8
	lsls r3, r3, #2
	adds r6, r7, r3
	movs r0, #0
	mov r8, r0
	movs r4, #0
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x48
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x9e
	lsls r0, r0, #2
	strh r0, [r6, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x58]
	strb r2, [r1]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x5c]
	strb r0, [r3]
	movs r0, #0x10
	mov sb, r0
	mov r2, sb
	ldr r1, [sp, #0x60]
	strb r2, [r1]
	mov r0, r8
	ldr r3, [sp, #0x64]
	strb r0, [r3]
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	str r1, [r6, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	str r2, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	movs r3, #0xc6
	lsls r3, r3, #2
	adds r6, r7, r3
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A76C @ =0x00000279
	strh r0, [r6, #0xa]
	mov r1, r8
	ldr r0, [sp, #0x78]
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	mov r0, sb
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	ldr r2, [sp, #0x14]
	strb r1, [r2]
	mov r3, sl
	str r3, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	movs r1, #0xea
	lsls r1, r1, #2
	adds r6, r7, r1
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A770 @ =0x0000027B
	strh r0, [r6, #0xa]
	mov r3, r8
	ldr r2, [sp, #0x48]
	strb r3, [r2]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x4c]
	strb r0, [r1]
	mov r3, sb
	ldr r2, [sp, #0x50]
	strb r3, [r2]
	mov r1, r8
	ldr r0, [sp, #0x54]
	strb r1, [r0]
	mov r2, sl
	str r2, [r6, #0x28]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r6, #0x10]
	movs r0, #0xf6
	lsls r0, r0, #2
	adds r6, r7, r0
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A774 @ =0x0000027A
	strh r0, [r6, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x68]
	strb r2, [r1]
	movs r5, #0xa8
	lsls r5, r5, #3
	strh r5, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #0x6c]
	strb r0, [r3]
	mov r1, sb
	ldr r0, [sp, #0x70]
	strb r1, [r0]
	ldr r3, [sp, #0x74]
	strb r2, [r3]
	mov r0, sl
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	movs r2, #0xd2
	lsls r2, r2, #2
	adds r6, r7, r2
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A778 @ =0x00000277
	strh r0, [r6, #0xa]
	mov r0, r8
	ldr r3, [sp, #0x28]
	strb r0, [r3]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x2c]
	strb r0, [r1]
	mov r3, sb
	ldr r2, [sp, #0x30]
	strb r3, [r2]
	mov r1, r8
	ldr r0, [sp, #0x34]
	strb r1, [r0]
	mov r2, sl
	str r2, [r6, #0x28]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	movs r0, #0xde
	lsls r0, r0, #2
	adds r6, r7, r0
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A77C @ =0x00000275
	strh r0, [r6, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x38]
	strb r2, [r1]
	strh r5, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #0x3c]
	strb r0, [r3]
	mov r1, sb
	ldr r0, [sp, #0x40]
	strb r1, [r0]
	ldr r3, [sp, #0x44]
	strb r2, [r3]
	mov r0, sl
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	movs r2, #0x81
	lsls r2, r2, #3
	adds r6, r7, r2
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A780 @ =0x00000276
	strh r0, [r6, #0xa]
	mov r0, r8
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r2, #1
	rsbs r2, r2, #0
	mov r1, sp
	strb r2, [r1, #8]
	adds r0, r2, #0
	ldr r3, [sp, #0x1c]
	strb r0, [r3]
	mov r1, sb
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	mov r3, r8
	ldr r2, [sp, #0x24]
	strb r3, [r2]
	mov r0, sl
	str r0, [r6, #0x28]
	ldr r2, _0803A784 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803A788 @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r2, _0803A70C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	bne _0803A682
	b _0803A7EC
_0803A682:
	ldr r0, _0803A78C @ =gSelectedCharacter
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0803A68E
	b _0803A7EC
_0803A68E:
	ldr r0, _0803A790 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _0803A69E
	b _0803A7EC
_0803A69E:
	ldr r1, _0803A794 @ =0x00000444
	adds r6, r7, r1
	strh r5, [r6, #0x16]
	strh r5, [r6, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x81
	strh r0, [r6, #0xa]
	ldr r2, _0803A798 @ =0x00000464
	adds r0, r7, r2
	mov r3, r8
	strb r3, [r0]
	movs r4, #0x80
	strh r4, [r6, #0x1a]
	strh r5, [r6, #8]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x1c]
	ldr r0, _0803A79C @ =0x00000465
	adds r1, r7, r0
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #8]
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _0803A7A0 @ =0x00000466
	adds r0, r7, r3
	mov r1, sb
	strb r1, [r0]
	ldr r2, _0803A7A4 @ =0x00000469
	adds r0, r7, r2
	mov r3, r8
	strb r3, [r0]
	mov r0, sl
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	adds r2, #0xb
	adds r6, r7, r2
	strh r5, [r6, #0x16]
	strh r5, [r6, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0xe9
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	ldr r3, _0803A7A8 @ =0x00000494
	adds r0, r7, r3
	mov r1, r8
	strb r1, [r0]
	b _0803A7AC
	.align 2, 0
_0803A70C: .4byte gCurrentLevel
_0803A710: .4byte 0x00000301
_0803A714: .4byte 0x00000302
_0803A718: .4byte 0x00000305
_0803A71C: .4byte 0x00000339
_0803A720: .4byte 0x0000033A
_0803A724: .4byte 0x0000033D
_0803A728: .4byte 0x000003C9
_0803A72C: .4byte 0x000003CA
_0803A730: .4byte 0x000003CD
_0803A734: .4byte 0x000003F9
_0803A738: .4byte 0x000003FA
_0803A73C: .4byte 0x000003FD
_0803A740: .4byte 0x00000369
_0803A744: .4byte 0x0000036A
_0803A748: .4byte 0x0000036D
_0803A74C: .4byte 0x00000399
_0803A750: .4byte 0x0000039A
_0803A754: .4byte 0x0000039D
_0803A758: .4byte 0x00000429
_0803A75C: .4byte 0x0000042A
_0803A760: .4byte 0x0000042D
_0803A764: .4byte gUnknown_080D7A38
_0803A768: .4byte gUnknown_080D7A58
_0803A76C: .4byte 0x00000279
_0803A770: .4byte 0x0000027B
_0803A774: .4byte 0x0000027A
_0803A778: .4byte 0x00000277
_0803A77C: .4byte 0x00000275
_0803A780: .4byte 0x00000276
_0803A784: .4byte gUnknown_030054B8
_0803A788: .4byte 0x00002060
_0803A78C: .4byte gSelectedCharacter
_0803A790: .4byte gLoadedSaveGame
_0803A794: .4byte 0x00000444
_0803A798: .4byte 0x00000464
_0803A79C: .4byte 0x00000465
_0803A7A0: .4byte 0x00000466
_0803A7A4: .4byte 0x00000469
_0803A7A8: .4byte 0x00000494
_0803A7AC:
	strh r4, [r6, #0x1a]
	strh r5, [r6, #8]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x1c]
	ldr r2, _0803A7E0 @ =0x00000495
	adds r1, r7, r2
	ldrb r0, [r1]
	mov r3, sp
	ldrb r3, [r3, #8]
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803A7E4 @ =0x00000496
	adds r0, r7, r1
	mov r2, sb
	strb r2, [r0]
	ldr r3, _0803A7E8 @ =0x00000499
	adds r0, r7, r3
	mov r1, r8
	strb r1, [r0]
	mov r2, sl
	str r2, [r6, #0x28]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r6, #0x10]
	b _0803A7FE
	.align 2, 0
_0803A7E0: .4byte 0x00000495
_0803A7E4: .4byte 0x00000496
_0803A7E8: .4byte 0x00000499
_0803A7EC:
	movs r1, #0x89
	lsls r1, r1, #3
	adds r0, r7, r1
	movs r1, #0
	str r1, [r0]
	movs r2, #0x8f
	lsls r2, r2, #3
	adds r0, r7, r2
	str r1, [r0]
_0803A7FE:
	ldr r0, _0803A814 @ =gUnknown_03005B4C
	ldr r3, [sp, #4]
	str r3, [r0]
	add sp, #0x7c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A814: .4byte gUnknown_03005B4C

	thumb_func_start sub_803A818
sub_803A818: @ 0x0803A818
	push {r4, r5, r6, lr}
	ldr r2, _0803A840 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0xa8
	adds r0, r0, r1
	ldr r4, [r0]
	adds r1, r4, #1
	str r1, [r0]
	adds r3, r1, #0
	adds r6, r2, #0
	cmp r3, #0x14
	bhi _0803A844
	movs r0, #0
	strh r0, [r5, #8]
	b _0803A8C6
	.align 2, 0
_0803A840: .4byte gCurTask
_0803A844:
	cmp r3, #0x7e
	bhi _0803A87A
	adds r1, r4, #0
	subs r1, #0x3c
	ldr r0, _0803A8CC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #8
	ldr r4, _0803A8D0 @ =0x0004BA00
	adds r2, r0, r4
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	lsrs r0, r0, #1
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	lsrs r0, r0, #1
	subs r2, r2, r0
	lsrs r0, r1, #1
	adds r2, r2, r0
	str r2, [r5]
_0803A87A:
	movs r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	cmp r3, #0x7e
	bls _0803A8A8
	ldr r2, _0803A8D4 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0803A8D8 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r5, #8]
	ldr r1, [r6]
	ldr r0, _0803A8DC @ =sub_803C980
	str r0, [r1, #8]
_0803A8A8:
	ldr r4, _0803A8E0 @ =gUnknown_080D7AA8
	bl sub_803CA40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r5, #0
	bl sub_803CB18
	adds r0, r5, #0
	bl sub_803AC2C
_0803A8C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A8CC: .4byte gCurrentLevel
_0803A8D0: .4byte 0x0004BA00
_0803A8D4: .4byte gPlayer
_0803A8D8: .4byte 0xFFDFFFFF
_0803A8DC: .4byte sub_803C980
_0803A8E0: .4byte gUnknown_080D7AA8

	thumb_func_start sub_803A8E4
sub_803A8E4: @ 0x0803A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A8FA
	b _0803AA2E
_0803A8FA:
	adds r0, r7, #0
	adds r0, #0xa0
	ldr r0, [r0]
	cmp r0, #4
	bls _0803A908
	cmp r0, #6
	bne _0803A96C
_0803A908:
	ldr r2, [r7]
	asrs r2, r2, #8
	ldr r4, _0803A9E8 @ =gSineTable
	adds r0, r7, #0
	adds r0, #0x88
	ldr r1, [r0]
	ldr r0, _0803A9EC @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r3, [r7, #0x68]
	muls r0, r3, r0
	asrs r0, r0, #0x17
	subs r0, #8
	adds r5, r2, r0
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #0x17
	adds r6, r2, r0
	ldr r4, _0803A9F0 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r5, r5, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	subs r6, r6, r0
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r6, #0
	muls r1, r6, r1
	adds r0, r0, r1
	ldr r1, _0803A9F4 @ =0x000001A3
	cmp r0, r1
	bgt _0803A96C
	adds r0, r7, #0
	bl sub_803CBFC
	adds r0, r4, #0
	bl sub_800CBA4
_0803A96C:
	movs r0, #0xb8
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r1, [r7]
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r3, _0803A9F8 @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r4, #0x18]
	ldr r3, _0803A9F0 @ =gPlayer
	mov r8, r3
	str r3, [sp]
	adds r0, r4, #0
	movs r3, #1
	bl sub_800CA20
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r0, r7, #0
	adds r0, #0xb1
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #0
	beq _0803A9CA
	mov r1, r8
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	ldr r1, [r1, #0x20]
	cmp r0, #0
	bgt _0803A9C2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0803AA2E
_0803A9C2:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0803AA2E
_0803A9CA:
	ldr r3, _0803A9F0 @ =gPlayer
	mov r8, r3
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0803A9FC
	adds r0, r7, #0
	bl sub_803B6AC
	b _0803AA0C
	.align 2, 0
_0803A9E8: .4byte gSineTable
_0803A9EC: .4byte 0x000003FF
_0803A9F0: .4byte gPlayer
_0803A9F4: .4byte 0x000001A3
_0803A9F8: .4byte gCamera
_0803A9FC:
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800CA20
_0803AA0C:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803AA2E
	ldr r0, _0803AA3C @ =gPlayer
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _0803AA2E
	adds r0, r7, #0
	bl sub_803B6AC
_0803AA2E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AA3C: .4byte gPlayer

	thumb_func_start sub_803AA40
sub_803AA40: @ 0x0803AA40
	push {r4, r5, r6, lr}
	ldr r0, _0803AA9C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0xb4
	adds r4, r0, r1
	subs r1, #0xc
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	cmp r1, #8
	bls _0803AA76
	cmp r1, #9
	bne _0803AA76
	ldr r2, _0803AAA0 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0803AAA4 @ =0x0000014D
	bl m4aSongNumStart
_0803AA76:
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r1, [r0]
	adds r5, r0, #0
	cmp r1, #0x20
	bhi _0803AAA8
	cmp r1, #1
	bne _0803AA92
	strh r1, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r4, #4]
	movs r0, #0xc0
	strh r0, [r4, #6]
_0803AA92:
	adds r0, r4, #0
	bl sub_802D4CC
	b _0803AC18
	.align 2, 0
_0803AA9C: .4byte gCurTask
_0803AAA0: .4byte gFlags
_0803AAA4: .4byte 0x0000014D
_0803AAA8:
	cmp r1, #0x78
	bhi _0803AB84
	movs r0, #0
	movs r1, #2
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	adds r0, r4, #0
	bl sub_802D4CC
	ldr r2, _0803AB64 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803AAF6
	ldr r0, _0803AB68 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803AAE8
	ldr r0, _0803AB6C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803AAE8
	ldr r0, _0803AB70 @ =gPlayer
	adds r0, #0x64
	movs r1, #0x51
	strh r1, [r0]
_0803AAE8:
	ldr r0, _0803AB64 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803AAF6
	b _0803AC18
_0803AAF6:
	ldr r0, [r5]
	cmp r0, #0x22
	beq _0803AAFE
	b _0803AC18
_0803AAFE:
	ldr r1, _0803AB74 @ =gUnknown_080D6DE4
	ldrh r5, [r1]
	ldr r3, _0803AB70 @ =gPlayer
	ldr r2, [r3, #8]
	asrs r0, r2, #8
	subs r5, r5, r0
	ldrh r4, [r1, #2]
	ldr r1, [r3, #0xc]
	asrs r0, r1, #8
	subs r4, r4, r0
	lsls r6, r5, #8
	adds r2, r2, r6
	str r2, [r3, #8]
	lsls r2, r4, #8
	adds r1, r1, r2
	str r1, [r3, #0xc]
	ldr r1, _0803AB78 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
	ldr r0, _0803AB7C @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _0803AB58
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
_0803AB58:
	ldr r1, _0803AB80 @ =gUnknown_030055B0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803AC18
	.align 2, 0
_0803AB64: .4byte gCurrentLevel
_0803AB68: .4byte gSelectedCharacter
_0803AB6C: .4byte gLoadedSaveGame
_0803AB70: .4byte gPlayer
_0803AB74: .4byte gUnknown_080D6DE4
_0803AB78: .4byte gCamera
_0803AB7C: .4byte gUnknown_030056A4
_0803AB80: .4byte gUnknown_030055B0
_0803AB84:
	movs r0, #0x28
	strh r0, [r4, #6]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803AC18
	ldr r2, _0803ABB4 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803ABFC
	ldr r0, _0803ABB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803ABC0
	ldr r0, _0803ABBC @ =gUnknown_03005490
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _0803ABFC
	.align 2, 0
_0803ABB4: .4byte gCurrentLevel
_0803ABB8: .4byte gGameMode
_0803ABBC: .4byte gUnknown_03005490
_0803ABC0:
	ldr r0, _0803ABE4 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803ABEC
	ldr r0, _0803ABE8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803ABEC
	movs r0, #0
	bl CreateCourseResultsCutScene
	b _0803ABFC
	.align 2, 0
_0803ABE4: .4byte gSelectedCharacter
_0803ABE8: .4byte gLoadedSaveGame
_0803ABEC:
	ldr r0, _0803AC08 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0803AC0C @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _0803AC10 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0803ABFC:
	ldr r0, _0803AC14 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0803AC22
	.align 2, 0
_0803AC08: .4byte gUnknown_03005490
_0803AC0C: .4byte gCourseTime
_0803AC10: .4byte gUnknown_030054F4
_0803AC14: .4byte gCurTask
_0803AC18:
	ldr r0, _0803AC28 @ =gWinRegs
	movs r1, #0x3f
	strh r1, [r0, #8]
	movs r1, #0x1f
	strh r1, [r0, #0xa]
_0803AC22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803AC28: .4byte gWinRegs

	thumb_func_start sub_803AC2C
sub_803AC2C: @ 0x0803AC2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	adds r0, #0xb4
	str r0, [sp]
	movs r7, #0xb8
	lsls r7, r7, #2
	add r7, sl
	mov r1, sl
	ldr r0, [r1]
	asrs r0, r0, #8
	ldr r4, _0803AFF8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	mov r2, sl
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xde
	lsls r7, r7, #2
	add r7, sl
	mov r3, sl
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	adds r0, #4
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xea
	lsls r7, r7, #2
	add r7, sl
	mov r5, sl
	ldr r0, [r5]
	ldr r1, _0803AFFC @ =0xFFFFEA00
	mov sb, r1
	add r0, sb
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	adds r5, #0x98
	str r5, [sp, #4]
	mov r2, sl
	ldr r0, [r2, #4]
	ldr r1, [r5]
	adds r0, r0, r1
	movs r5, #0xe8
	lsls r5, r5, #4
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r3, sl
	ldr r0, [r3]
	movs r6, #0xc0
	lsls r6, r6, #5
	adds r0, r0, r6
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	movs r0, #0x9c
	add r0, sl
	mov r8, r0
	ldr r0, [r3, #4]
	mov r2, r8
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xf6
	lsls r7, r7, #2
	add r7, sl
	mov r3, sl
	ldr r0, [r3]
	add r0, sb
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	ldr r2, [sp, #4]
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r6
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	mov r2, r8
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xc6
	lsls r7, r7, #2
	add r7, sl
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r3, sl
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r1, #6
	mov r4, sb
	lsls r4, r4, #0x10
	str r4, [sp, #8]
	mov r5, r8
	lsls r5, r5, #0x10
	str r5, [sp, #0xc]
_0803AD92:
	lsls r0, r1, #0x18
	asrs r5, r0, #0x18
	lsls r4, r5, #2
	mov r3, sl
	adds r3, #0x2c
	adds r3, r3, r4
	ldr r0, [r3]
	adds r0, #0x50
	ldr r1, _0803B000 @ =0x000003FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _0803B004 @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r2, sl
	adds r2, #0xc
	adds r2, r2, r4
	ldr r0, [r2]
	muls r1, r0, r1
	asrs r1, r1, #0x17
	mov r4, sb
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	adds r1, r6, r1
	strh r1, [r7, #0x16]
	ldr r0, [r3]
	adds r0, #0x50
	ldr r1, _0803B000 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	ldr r3, _0803B004 @ =gSineTable
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r2]
	muls r1, r0, r1
	asrs r1, r1, #0x17
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r1, r4, r1
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, sl
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AE1C
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r2, r2, #3
	ldr r0, [sp]
	adds r0, #0x44
	adds r0, r0, r2
	movs r3, #0x16
	ldrsh r1, [r7, r3]
	str r1, [r0]
	ldr r0, [sp]
	adds r0, #0x48
	adds r0, r0, r2
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	str r1, [r0]
_0803AE1C:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _0803AD92
	movs r7, #0xd2
	lsls r7, r7, #2
	add r7, sl
	ldr r3, _0803B004 @ =gSineTable
	mov sb, r3
	mov r5, sl
	ldr r0, [r5, #0x48]
	adds r0, #0x50
	ldr r1, _0803B000 @ =0x000003FF
	mov r8, r1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r5, #0x28]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	adds r0, r6, r0
	strh r0, [r7, #0x16]
	ldr r0, [r5, #0x48]
	adds r0, #0x50
	mov r5, r8
	ands r0, r5
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, sl
	ldr r0, [r3, #0x28]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	adds r0, r4, r0
	strh r0, [r7, #0x18]
	ldrh r5, [r7, #0x16]
	ldrh r4, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #0x89
	lsls r0, r0, #3
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	beq _0803AEBA
	ldr r7, _0803B008 @ =0x00000444
	add r7, sl
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r5, #5
	strh r5, [r7, #0x16]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #0x14
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	ldr r7, _0803B00C @ =0x00000474
	add r7, sl
	strh r5, [r7, #0x16]
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_0803AEBA:
	movs r7, #0xc6
	lsls r7, r7, #2
	add r7, sl
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r1, #0
	mov r4, sl
	adds r4, #0x74
	str r4, [sp, #0x14]
	mov r5, sl
	adds r5, #0x54
	str r5, [sp, #0x10]
	mov r0, sl
	adds r0, #0x88
	str r0, [sp, #0x18]
	mov r2, sl
	adds r2, #0x94
	str r2, [sp, #0x1c]
_0803AEE0:
	lsls r4, r1, #0x18
	asrs r4, r4, #0x18
	lsls r2, r4, #2
	ldr r5, [sp, #0x14]
	adds r3, r5, r2
	ldr r0, [r3]
	mov r1, r8
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, [sp, #0x10]
	adds r2, r0, r2
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	subs r0, #8
	ldr r1, [sp, #8]
	asrs r6, r1, #0x10
	adds r0, r6, r0
	strh r0, [r7, #0x16]
	ldr r0, [r3]
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	ldr r1, [sp, #0xc]
	asrs r5, r1, #0x10
	adds r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #5
	ble _0803AEE0
	movs r7, #0x81
	lsls r7, r7, #3
	add r7, sl
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sl
	ldr r2, _0803B004 @ =gSineTable
	ldr r3, [sp, #0x18]
	ldr r0, [r3]
	ldr r3, _0803B000 @ =0x000003FF
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov sb, r0
	mov r1, sl
	ldr r0, [r1, #0x68]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0x17
	subs r0, #8
	adds r0, r6, r0
	strh r0, [r7, #0x16]
	ldr r1, [sp, #0x18]
	ldr r0, [r1]
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r2, sl
	ldr r0, [r2, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	adds r0, r5, r0
	strh r0, [r7, #0x18]
	ldr r2, _0803B010 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803B014 @ =0x00002060
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r5, [sp, #0x18]
	ldr r1, [r5]
	ldr r2, [sp, #0x1c]
	ldr r0, [r2]
	subs r0, r1, r0
	adds r1, r1, r0
	ands r1, r3
	strh r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r1, r0
	beq _0803AFC4
	adds r0, r1, #0
	adds r0, #0xa
	strh r0, [r4]
_0803AFC4:
	mov r3, r8
	strh r3, [r4, #2]
	strh r3, [r4, #4]
	ldrh r0, [r7, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r7, #0x18]
	strh r0, [r4, #8]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r7, #0
	bl sub_80051E8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AFF8: .4byte gCamera
_0803AFFC: .4byte 0xFFFFEA00
_0803B000: .4byte 0x000003FF
_0803B004: .4byte gSineTable
_0803B008: .4byte 0x00000444
_0803B00C: .4byte 0x00000474
_0803B010: .4byte gUnknown_030054B8
_0803B014: .4byte 0x00002060

	thumb_func_start sub_803B018
sub_803B018: @ 0x0803B018
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803B084 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r0, #0
	strh r0, [r5, #0xa]
	ldr r6, [r5, #4]
	ldr r0, [r5]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r2, r0, r3
	ldr r0, _0803B088 @ =IWRAM_START + 0x9C
	adds r4, r1, r0
	ldr r0, [r4]
	adds r0, r6, r0
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r2, _0803B08C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bgt _0803B094
	lsls r1, r2, #6
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	rsbs r2, r2, #0
	cmp r2, #7
	ble _0803B06A
	movs r2, #7
_0803B06A:
	ldr r1, _0803B090 @ =gUnknown_080D7A18
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	muls r1, r0, r1
	lsls r0, r2, #6
	subs r1, r1, r0
	ldr r0, [r4]
	subs r0, r0, r1
	b _0803B09C
	.align 2, 0
_0803B084: .4byte gCurTask
_0803B088: .4byte IWRAM_START + 0x9C
_0803B08C: .4byte sub_801EC3C
_0803B090: .4byte gUnknown_080D7A18
_0803B094:
	ldr r0, [r4]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
_0803B09C:
	str r0, [r4]
	adds r2, r5, #0
	adds r2, #0x9c
	ldr r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #5
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r1, r1, r0
	str r1, [r5, #4]
	ldr r1, [r2]
	ldr r0, _0803B124 @ =0x00000E7F
	cmp r1, r0
	bgt _0803B0C4
	adds r0, #1
	str r0, [r2]
_0803B0C4:
	ldr r0, [r2]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803B0D0
	str r1, [r2]
_0803B0D0:
	ldr r0, [r5]
	ldr r3, _0803B128 @ =0xFFFFEA00
	adds r2, r0, r3
	adds r4, r5, #0
	adds r4, #0x98
	ldr r0, [r4]
	adds r0, r6, r0
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r2, _0803B12C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bgt _0803B134
	lsls r1, r2, #6
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	rsbs r2, r2, #0
	cmp r2, #7
	ble _0803B10A
	movs r2, #7
_0803B10A:
	ldr r1, _0803B130 @ =gUnknown_080D7A18
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	muls r1, r0, r1
	lsls r0, r2, #6
	subs r1, r1, r0
	ldr r0, [r4]
	subs r0, r0, r1
	b _0803B13C
	.align 2, 0
_0803B124: .4byte 0x00000E7F
_0803B128: .4byte 0xFFFFEA00
_0803B12C: .4byte sub_801EC3C
_0803B130: .4byte gUnknown_080D7A18
_0803B134:
	ldr r0, [r4]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
_0803B13C:
	str r0, [r4]
	adds r2, r4, #0
	ldr r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #5
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r1, r1, r0
	str r1, [r5, #4]
	ldr r1, [r2]
	ldr r0, _0803B178 @ =0x00000E7F
	cmp r1, r0
	bgt _0803B162
	adds r0, #1
	str r0, [r2]
_0803B162:
	ldr r0, [r4]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803B16E
	str r1, [r4]
_0803B16E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B178: .4byte 0x00000E7F

	thumb_func_start sub_803B17C
sub_803B17C: @ 0x0803B17C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	mov r2, ip
	adds r2, #0x94
	ldr r0, [r2]
	subs r0, #8
	str r0, [r2]
	ldr r1, _0803B244 @ =0x000002FF
	cmp r0, r1
	bgt _0803B19E
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [r2]
_0803B19E:
	ldr r0, [r2]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	movs r2, #0x74
	add r2, ip
	mov sl, r2
	mov r6, ip
	adds r6, #0xac
	mov r5, sl
	ldr r7, _0803B248 @ =gUnknown_080D7A78
	mov r8, r7
_0803B1B6:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B1B6
	ldr r0, [r6]
	subs r0, #1
	str r0, [r6]
	cmp r0, #0
	bne _0803B254
	movs r0, #0xa
	str r0, [r6]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #1
	str r0, [r1]
	movs r4, #0
	movs r0, #0x94
	add r0, ip
	mov sb, r0
	mov r3, ip
	adds r3, #0xa4
	mov r6, sl
	movs r1, #0xc0
	lsls r1, r1, #2
	mov r8, r1
	mov r5, ip
	adds r5, #0x54
	ldr r7, _0803B24C @ =gUnknown_080D7A58
_0803B214:
	lsls r1, r4, #2
	adds r0, r6, r1
	mov r2, r8
	str r2, [r0]
	adds r2, r5, r1
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B214
	movs r0, #0xc0
	lsls r0, r0, #2
	mov r7, sb
	str r0, [r7]
	ldr r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B250
	movs r0, #1
	b _0803B252
	.align 2, 0
_0803B244: .4byte 0x000002FF
_0803B248: .4byte gUnknown_080D7A78
_0803B24C: .4byte gUnknown_080D7A58
_0803B250:
	lsls r0, r1, #1
_0803B252:
	str r0, [r3]
_0803B254:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803B264
sub_803B264: @ 0x0803B264
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r3, #0
	movs r2, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	beq _0803B280
	ldr r0, _0803B27C @ =gUnknown_080D7A98
	b _0803B2A4
	.align 2, 0
_0803B27C: .4byte gUnknown_080D7A98
_0803B280:
	lsls r0, r2, #0x11
	lsrs r2, r0, #0x10
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #4
	bhi _0803B2A6
	mov r0, ip
	adds r0, #0xa4
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0803B280
	ldr r1, _0803B2F4 @ =gUnknown_080D7A98
	lsls r0, r3, #1
	adds r0, r0, r1
_0803B2A4:
	ldrh r2, [r0]
_0803B2A6:
	movs r5, #0
	movs r3, #0
	lsls r0, r2, #0x10
	mov r4, ip
	adds r4, #0xac
	asrs r7, r0, #0x10
	mov r6, ip
	adds r6, #0x54
_0803B2B6:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r7
	lsls r1, r1, #0x10
	lsls r2, r3, #2
	adds r2, r6, r2
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803B2B6
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803B2EC
	movs r0, #0xf
	str r0, [r4]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #2
	str r0, [r1]
_0803B2EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B2F4: .4byte gUnknown_080D7A98

	thumb_func_start sub_803B2F8
sub_803B2F8: @ 0x0803B2F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r4, #0
	movs r7, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r7
	ldr r1, _0803B31C @ =gSineTable
	mov sb, r1
	cmp r0, #0
	beq _0803B324
	ldr r0, _0803B320 @ =gUnknown_080D7AA2
	b _0803B342
	.align 2, 0
_0803B31C: .4byte gSineTable
_0803B320: .4byte gUnknown_080D7AA2
_0803B324:
	lsls r0, r7, #0x19
	lsrs r7, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B344
	adds r0, r6, #0
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r7
	cmp r0, #0
	beq _0803B324
	ldr r0, _0803B468 @ =gUnknown_080D7AA2
	adds r0, r4, r0
_0803B342:
	ldrb r7, [r0]
_0803B344:
	adds r2, r6, #0
	adds r2, #0x94
	adds r3, r6, #0
	adds r3, #0xac
	ldr r1, [r3]
	movs r0, #0x3c
	subs r0, r0, r1
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	ldr r1, [r2]
	subs r1, r1, r0
	ldr r0, _0803B46C @ =0x000003FF
	ands r1, r0
	str r1, [r2]
	str r1, [r6, #0x74]
	movs r4, #1
	str r2, [sp, #8]
	mov r8, r3
	subs r2, #0x20
	str r2, [sp, #0xc]
	movs r3, #0x90
	adds r3, r3, r6
	mov sl, r3
	str r2, [sp, #0x10]
	ldr r5, _0803B470 @ =gUnknown_080D7A78
	mov ip, r5
_0803B37E:
	lsls r3, r4, #2
	ldr r0, [sp, #0x10]
	adds r3, r0, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B37E
	ldr r1, [r6]
	asrs r1, r1, #8
	mov r0, sl
	ldr r2, [r0]
	subs r2, r2, r7
	ldr r4, _0803B46C @ =0x000003FF
	ands r2, r4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r3, [r6, #0x70]
	muls r0, r3, r0
	asrs r0, r0, #0x17
	adds r1, r1, r0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	lsls r2, r2, #1
	add r2, sb
	movs r5, #0
	ldrsh r2, [r2, r5]
	muls r2, r3, r2
	asrs r2, r2, #0x17
	adds r0, r0, r2
	movs r2, #0
	str r2, [sp]
	ldr r2, _0803B474 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E6D4
	adds r5, r0, #0
	cmp r5, #0
	bgt _0803B478
	movs r0, #0xee
	bl m4aSongNumStart
	movs r0, #0x1e
	mov r3, r8
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0xa0
	movs r0, #4
	str r0, [r1]
	mov r0, sl
	ldr r1, [r0]
	adds r1, r1, r7
	ands r1, r4
	lsls r0, r1, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	add r1, sb
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r1, r1, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r4, #0
	ldr r1, [sp, #0xc]
_0803B440:
	lsls r0, r4, #2
	adds r0, r1, r0
	str r5, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B440
	ldr r3, [sp, #8]
	str r5, [r3]
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x10
	movs r2, #0x80
	movs r3, #0x14
	bl sub_802B4F8
	b _0803B490
	.align 2, 0
_0803B468: .4byte gUnknown_080D7AA2
_0803B46C: .4byte 0x000003FF
_0803B470: .4byte gUnknown_080D7A78
_0803B474: .4byte sub_801EE64
_0803B478:
	mov r5, r8
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _0803B490
	movs r0, #0x1e
	str r0, [r5]
	adds r1, r6, #0
	adds r1, #0xa0
	movs r0, #4
	str r0, [r1]
_0803B490:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803B4A0
sub_803B4A0: @ 0x0803B4A0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x94
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	mov r5, ip
	adds r5, #0x74
	ldr r6, _0803B504 @ =gUnknown_080D7A78
_0803B4BA:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B4BA
	movs r4, #0
	movs r3, #1
	mov r1, ip
	adds r1, #0xa4
	ldr r0, [r1]
	ands r0, r3
	mov r5, ip
	adds r5, #0xac
	cmp r0, #0
	beq _0803B50C
	ldr r0, _0803B508 @ =gUnknown_080D7A98
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0803B52A
	.align 2, 0
_0803B504: .4byte gUnknown_080D7A78
_0803B508: .4byte gUnknown_080D7A98
_0803B50C:
	lsls r3, r3, #1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B52C
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _0803B50C
	ldr r0, _0803B574 @ =gUnknown_080D7A98
	lsls r1, r4, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
_0803B52A:
	lsls r3, r0, #1
_0803B52C:
	ldr r0, [r5]
	cmp r0, #0x39
	bhi _0803B558
	movs r4, #0
	mov r6, ip
	adds r6, #0x54
	ldr r7, _0803B578 @ =gUnknown_080D7A58
_0803B53A:
	lsls r1, r4, #2
	adds r2, r6, r1
	ldr r0, [r2]
	subs r0, r0, r3
	str r0, [r2]
	adds r1, r1, r7
	ldr r1, [r1]
	cmp r0, r1
	bge _0803B54E
	str r1, [r2]
_0803B54E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B53A
_0803B558:
	ldr r0, [r5]
	subs r2, r0, #1
	str r2, [r5]
	cmp r2, #0
	bne _0803B56C
	movs r0, #0x50
	str r0, [r5]
	mov r0, ip
	adds r0, #0xa0
	str r2, [r0]
_0803B56C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B574: .4byte gUnknown_080D7A98
_0803B578: .4byte gUnknown_080D7A58

	thumb_func_start sub_803B57C
sub_803B57C: @ 0x0803B57C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	movs r1, #0
	movs r5, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0803B5A0
	ldr r0, _0803B59C @ =gUnknown_080D7A98
	ldrh r0, [r0]
	b _0803B5BC
	.align 2, 0
_0803B59C: .4byte gUnknown_080D7A98
_0803B5A0:
	lsls r5, r5, #1
	adds r1, #1
	cmp r1, #4
	bgt _0803B5C0
	mov r0, ip
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0803B5A0
	ldr r0, _0803B624 @ =gUnknown_080D7A98
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0803B5BC:
	lsls r0, r0, #0x10
	asrs r5, r0, #0x12
_0803B5C0:
	adds r4, r5, #0
	mov r7, ip
	adds r7, #0xac
	mov sb, r7
	movs r0, #0xa0
	add r0, ip
	mov r8, r0
	mov r3, ip
	adds r3, #0x54
	ldr r6, _0803B628 @ =gUnknown_080D7A58
	movs r2, #5
	mov sl, r2
	movs r1, #7
_0803B5DA:
	adds r4, r4, r5
	ldr r0, [r3]
	subs r0, r0, r4
	str r0, [r3]
	ldr r2, [r6]
	cmp r0, r2
	bge _0803B5F6
	str r2, [r3]
	movs r0, #0x44
	mov r2, sb
	str r0, [r2]
	mov r0, sl
	mov r2, r8
	str r0, [r2]
_0803B5F6:
	adds r3, #4
	adds r6, #4
	subs r1, #1
	cmp r1, #0
	bge _0803B5DA
	ldr r0, [r7]
	subs r0, #1
	str r0, [r7]
	cmp r0, #0
	bne _0803B616
	movs r0, #0x44
	str r0, [r7]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #5
	str r0, [r1]
_0803B616:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B624: .4byte gUnknown_080D7A98
_0803B628: .4byte gUnknown_080D7A58

	thumb_func_start sub_803B62C
sub_803B62C: @ 0x0803B62C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	mov r1, ip
	adds r1, #0x94
	ldr r0, [r1]
	adds r0, #0xc
	str r0, [r1]
	mov r3, ip
	adds r3, #0xac
	ldr r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #2
	cmp r0, r2
	bls _0803B64E
	str r2, [r1]
_0803B64E:
	ldr r0, [r1]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	adds r6, r3, #0
	mov r5, ip
	adds r5, #0x74
	ldr r7, _0803B6A8 @ =gUnknown_080D7A78
	mov r8, r7
_0803B660:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B660
	ldr r0, [r6]
	subs r1, r0, #1
	str r1, [r6]
	cmp r1, #0
	bne _0803B69E
	movs r0, #0x50
	str r0, [r6]
	mov r0, ip
	adds r0, #0xa0
	str r1, [r0]
_0803B69E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B6A8: .4byte gUnknown_080D7A78

	thumb_func_start sub_803B6AC
sub_803B6AC: @ 0x0803B6AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0xb0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B77C
	subs r0, #1
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B6D2
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0803B6D8
_0803B6D2:
	movs r0, #0xeb
	bl m4aSongNumStart
_0803B6D8:
	adds r1, r6, #0
	adds r1, #0xb1
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #0xde
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B764
	ldr r0, _0803B74C @ =0x00000275
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0803B750 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r2, #0x50
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0803B754 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _0803B774
	ldr r0, _0803B758 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B774
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _0803B75C @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0803B742
	movs r0, #0xff
_0803B742:
	strb r0, [r1]
	ldr r1, _0803B760 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0803B774
	.align 2, 0
_0803B74C: .4byte 0x00000275
_0803B750: .4byte gUnknown_03005450
_0803B754: .4byte 0x0000C350
_0803B758: .4byte gGameMode
_0803B75C: .4byte gUnknown_03005448
_0803B760: .4byte gUnknown_030054A8
_0803B764:
	ldr r0, _0803B7A4 @ =0x00000275
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
_0803B774:
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0803B77C:
	ldr r0, _0803B7A8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803B798
	adds r0, r6, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #4
	bne _0803B798
	ldr r1, _0803B7AC @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_0803B798:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B7A4: .4byte 0x00000275
_0803B7A8: .4byte gCurrentLevel
_0803B7AC: .4byte gUnknown_030054A8

	thumb_func_start sub_803B7B0
sub_803B7B0: @ 0x0803B7B0
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xde
	lsls r0, r0, #2
	adds r4, r3, r0
	adds r1, r3, #0
	adds r1, #0xb1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B810
	adds r2, r3, #0
	adds r2, #0xb2
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B83E
	adds r0, r3, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B7F4
	ldr r0, _0803B7F0 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _0803B800
	.align 2, 0
_0803B7F0: .4byte 0x00000275
_0803B7F4:
	movs r0, #0
	ldr r1, _0803B80C @ =0x00000275
	strh r1, [r4, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r3, r2
_0803B800:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _0803B83C
	.align 2, 0
_0803B80C: .4byte 0x00000275
_0803B810:
	adds r1, r3, #0
	adds r1, #0xb2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B83E
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B83E
	movs r1, #0
	ldr r0, _0803B844 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r4, #0xe6
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0803B848 @ =0x00000399
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_0803B83C:
	strb r0, [r1]
_0803B83E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B844: .4byte 0x00000275
_0803B848: .4byte 0x00000399

	thumb_func_start sub_803B84C
sub_803B84C: @ 0x0803B84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _0803B868
	movs r0, #0
	str r0, [r7, #0x14]
_0803B868:
	ldr r2, [r7, #0x18]
	adds r2, #0x40
	str r2, [r7, #0x18]
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x14]
	adds r1, r1, r0
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	adds r0, r0, r2
	str r0, [r7, #0x10]
	asrs r0, r0, #8
	adds r0, #0x1c
	asrs r1, r1, #8
	ldr r2, _0803B94C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	movs r0, #0xb7
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B954
	movs r1, #0x9e
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	ldr r6, _0803B950 @ =0xFFFFEA00
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #0x9f
	lsls r2, r2, #2
	add r2, sb
	movs r0, #0x98
	add r0, sb
	mov r8, r0
	ldr r0, [r7, #0x10]
	mov r3, r8
	ldr r1, [r3]
	adds r0, r0, r1
	movs r3, #0xe8
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xa4
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r0, r0, r4
	str r0, [r1]
	movs r2, #0xa5
	lsls r2, r2, #2
	add r2, sb
	mov r5, sb
	adds r5, #0x9c
	ldr r0, [r7, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xaa
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #0xab
	lsls r2, r2, #2
	add r2, sb
	ldr r0, [r7, #0x10]
	mov r6, r8
	ldr r1, [r6]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xb0
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	adds r0, r0, r4
	str r0, [r1]
	movs r2, #0xb1
	lsls r2, r2, #2
	add r2, sb
	ldr r0, [r7, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	str r1, [sp, #0x30]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x28]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x2c]
	movs r5, #0x84
	lsls r5, r5, #1
	add r5, sb
	str r5, [sp, #0x38]
	b _0803BA42
	.align 2, 0
_0803B94C: .4byte sub_801EC3C
_0803B950: .4byte 0xFFFFEA00
_0803B954:
	movs r6, #0
	mov sl, r6
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	str r1, [sp, #0x30]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x28]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x2c]
	movs r5, #0x84
	lsls r5, r5, #1
	add r5, sb
	str r5, [sp, #0x38]
_0803B97C:
	mov r6, sl
	lsls r0, r6, #1
	add r0, sl
	lsls r6, r0, #3
	movs r1, #0xe6
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r0, r6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	cmp r0, #0x7f
	bgt _0803B99A
	movs r0, #0x80
	str r0, [r1]
_0803B99A:
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r5, r0, r6
	ldr r0, [r5]
	adds r0, #0x28
	str r0, [r5]
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r2, r7, r3
	adds r2, r2, r6
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r4, r0, r6
	ldr r0, [r4]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r2, _0803BA60 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r1, r0, #0
	cmp r1, #0
	bge _0803BA0C
	movs r2, #0xea
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r2, r0, r6
	ldr r0, [r2]
	cmp r0, #0
	beq _0803B9F2
	subs r0, #1
	str r0, [r2]
_0803B9F2:
	lsls r1, r1, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	asrs r0, r0, #8
	str r0, [r5]
_0803BA0C:
	mov r3, sl
	lsls r0, r3, #1
	add r0, sl
	lsls r1, r0, #3
	movs r5, #0xea
	lsls r5, r5, #1
	adds r0, r7, r5
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BA34
	movs r6, #0xec
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BA34
	subs r0, #1
	str r0, [r1]
_0803BA34:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #3
	bls _0803B97C
_0803BA42:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BA94
	movs r2, #0x8a
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803BA64
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r7, #0x18]
	rsbs r0, r0, #0
	b _0803BA7A
	.align 2, 0
_0803BA60: .4byte sub_801EC3C
_0803BA64:
	ldr r0, [r7, #0x14]
	subs r0, #0x20
	str r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	asrs r0, r0, #8
_0803BA7A:
	str r0, [r7, #0x18]
	ldr r1, [r7, #0x18]
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0803BA8A
	movs r0, #0
	str r0, [r7, #0x18]
_0803BA8A:
	ldr r3, [sp, #0x24]
	lsls r1, r3, #8
	ldr r0, [r7, #0x10]
	adds r0, r0, r1
	str r0, [r7, #0x10]
_0803BA94:
	movs r5, #0
	mov sl, r5
_0803BA98:
	mov r6, sl
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r4, r0, #3
	ldr r0, [sp, #0x34]
	adds r5, r0, r4
	ldr r0, [r5]
	adds r0, #0x20
	str r0, [r5]
	ldr r2, [sp, #0x30]
	adds r2, r2, r4
	mov r8, r2
	ldr r2, [r2]
	mov sb, r1
	cmp r2, #0
	ble _0803BAC2
	ldr r3, [sp, #0x28]
	adds r1, r3, r4
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0803BAC2:
	ldr r0, [sp, #0x2c]
	adds r6, r0, r4
	ldr r0, [r6]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r6]
	asrs r0, r0, #8
	adds r0, #5
	ldr r2, [sp, #0x28]
	adds r1, r2, r4
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BB1A
	ldr r3, [sp, #0x38]
	adds r1, r3, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BAFA
	subs r0, #1
	str r0, [r1]
_0803BAFA:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x20
	str r0, [r1]
	ldr r2, [sp, #0x24]
	lsls r1, r2, #8
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r3, sl
	lsls r0, r3, #2
	subs r0, #0x40
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r5]
_0803BB1A:
	mov r0, sb
	add r0, sl
	lsls r1, r0, #3
	ldr r5, [sp, #0x38]
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BB3A
	adds r0, r7, #0
	adds r0, #0x58
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BB3A
	subs r0, #1
	str r0, [r1]
_0803BB3A:
	mov r0, sb
	add r0, sl
	lsls r4, r0, #3
	movs r6, #0x88
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r5, r0, r4
	ldr r0, [r5]
	adds r0, #0x28
	str r0, [r5]
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	mov r8, r0
	ldr r2, [r0]
	cmp r2, #0
	ble _0803BB6C
	movs r3, #0x82
	lsls r3, r3, #1
	adds r1, r7, r3
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0803BB6C:
	movs r6, #0x84
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r6, r0, r4
	ldr r0, [r6]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r6]
	asrs r0, r0, #8
	adds r0, #5
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r7, r2
	adds r1, r1, r4
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BBD2
	movs r3, #0x8a
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r1, r0, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BBB0
	subs r0, #1
	str r0, [r1]
_0803BBB0:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x20
	str r0, [r1]
	ldr r2, [sp, #0x24]
	lsls r1, r2, #8
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r3, sl
	lsls r0, r3, #2
	adds r0, #0x40
	rsbs r0, r0, #0
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r5]
_0803BBD2:
	mov r0, sb
	add r0, sl
	lsls r1, r0, #3
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r0, r7, r5
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BBF8
	movs r6, #0x8c
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BBF8
	subs r0, #1
	str r0, [r1]
_0803BBF8:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #7
	bhi _0803BC08
	b _0803BA98
_0803BC08:
	ldr r2, [r7, #0x28]
	adds r2, #0x60
	str r2, [r7, #0x28]
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x24]
	adds r1, r1, r0
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x20]
	adds r0, r0, r2
	str r0, [r7, #0x20]
	asrs r0, r0, #8
	adds r0, #0x18
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	blt _0803BC36
	b _0803BD76
_0803BC36:
	ldr r2, [r7, #0x30]
	cmp r2, #0
	bne _0803BD06
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r1, _0803BD2C @ =gCamera
	mov r8, r1
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	str r0, [sp, #0x1c]
	add r0, sp, #4
	strh r2, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	subs r0, #0xe8
	strh r0, [r1, #0xe]
	ldr r0, _0803BD30 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803BD34 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r2, [r0, #0xa]
	str r2, [sp, #8]
	ldr r5, _0803BD38 @ =0x00000229
	adds r5, r5, r7
	mov sb, r5
	mov r1, sb
	bl sub_8039B54
	ldr r3, _0803BD3C @ =gUnknown_030053B8
	ldr r0, [r3]
	ldr r6, _0803BD40 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r4, _0803BD44 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r1, [r7, #0x1c]
	asrs r1, r1, #8
	mov r5, r8
	ldr r0, [r5]
	subs r1, r1, r0
	movs r5, #0xf
	adds r0, r2, #0
	ands r0, r5
	adds r1, r1, r0
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r4
	str r2, [r3]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov ip, r0
	mov r0, r8
	ldr r0, [r0, #4]
	mov r1, ip
	subs r1, r1, r0
	ands r2, r5
	adds r0, r1, r2
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	str r3, [sp, #0x3c]
	bl sub_8039B54
	ldr r3, [sp, #0x3c]
	ldr r0, [r3]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r4
	ldr r1, [r7, #0x1c]
	asrs r1, r1, #8
	mov sl, r1
	mov r1, r8
	ldr r0, [r1]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	adds r0, r2, #0
	ands r0, r5
	add r0, sl
	str r0, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r4
	str r2, [r3]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	ands r2, r5
	adds r0, r0, r2
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	bl sub_8039B54
_0803BD06:
	ldr r1, [r7, #0x28]
	ldr r0, _0803BD48 @ =0x000002FF
	cmp r1, r0
	bgt _0803BD1C
	ldr r0, [r7, #0x30]
	cmp r0, #0
	bne _0803BD18
	movs r0, #1
	str r0, [r7, #0x30]
_0803BD18:
	movs r0, #0
	str r0, [r7, #0x28]
_0803BD1C:
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0803BD4C
	movs r0, #0
	b _0803BD4E
	.align 2, 0
_0803BD28: .4byte sub_801EC3C
_0803BD2C: .4byte gCamera
_0803BD30: .4byte 0x06012980
_0803BD34: .4byte 0x0000026B
_0803BD38: .4byte 0x00000229
_0803BD3C: .4byte gUnknown_030053B8
_0803BD40: .4byte 0x00196225
_0803BD44: .4byte 0x3C6EF35F
_0803BD48: .4byte 0x000002FF
_0803BD4C:
	movs r0, #1
_0803BD4E:
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x24]
	subs r0, #0x20
	str r0, [r7, #0x24]
	cmp r0, #0
	bge _0803BD5E
	movs r0, #0
	str r0, [r7, #0x24]
_0803BD5E:
	ldr r5, [sp, #0x24]
	lsls r1, r5, #8
	ldr r0, [r7, #0x20]
	adds r0, r0, r1
	str r0, [r7, #0x20]
	ldr r1, [r7, #0x28]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	rsbs r0, r0, #0
	asrs r0, r0, #8
	str r0, [r7, #0x28]
_0803BD76:
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0803BD90
	movs r6, #0x89
	lsls r6, r6, #2
	adds r0, r7, r6
	ldrh r1, [r0]
	adds r1, #0x30
	ldr r3, _0803BD8C @ =0x000003FF
	adds r2, r3, #0
	b _0803BD9E
	.align 2, 0
_0803BD8C: .4byte 0x000003FF
_0803BD90:
	movs r5, #0x89
	lsls r5, r5, #2
	adds r0, r7, r5
	ldrh r1, [r0]
	subs r1, #0x30
	ldr r6, _0803BDB4 @ =0x000003FF
	adds r2, r6, #0
_0803BD9E:
	ands r1, r2
	strh r1, [r0]
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BDB4: .4byte 0x000003FF

	thumb_func_start sub_803BDB8
sub_803BDB8: @ 0x0803BDB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _0803BE4C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xb4
	adds r0, r0, r1
	mov ip, r0
	ldr r2, _0803BE50 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	movs r3, #0
	str r3, [r0]
	ldr r4, _0803BE54 @ =IWRAM_START + 0x2DC
	adds r2, r1, r4
	movs r0, #5
	strb r0, [r2]
	ldr r5, _0803BE58 @ =IWRAM_START + 0x2DD
	adds r0, r1, r5
	strb r3, [r0]
	ldr r6, _0803BE5C @ =IWRAM_START + 0x2E0
	adds r2, r1, r6
	movs r0, #0x9d
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r2, _0803BE60 @ =IWRAM_START + 0x300
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0803BE64 @ =IWRAM_START + 0x301
	adds r2, r1, r3
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7]
	mov r4, ip
	str r0, [r4, #0xc]
	ldr r0, [r7, #4]
	str r0, [r4, #0x10]
	movs r5, #8
	ldrsh r0, [r7, r5]
	str r0, [r4, #0x14]
	ldr r0, _0803BE68 @ =0xFFFFFD00
	str r0, [r4, #0x18]
	movs r6, #0
	mov r8, r6
	ldr r0, _0803BE6C @ =IWRAM_START + 0x278
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _0803BE70 @ =IWRAM_START + 0x280
	adds r2, r2, r1
	mov sl, r2
	subs r3, #0x85
	adds r3, r1, r3
	str r3, [sp, #0xc]
_0803BE2E:
	mov r4, r8
	lsls r0, r4, #0x18
	asrs r2, r0, #0x18
	adds r3, r0, #0
	cmp r2, #1
	bgt _0803BE78
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r5, [sp, #8]
	adds r1, r5, r1
	ldr r0, [r7]
	ldr r6, _0803BE74 @ =0xFFFFEA00
	adds r0, r0, r6
	b _0803BE8A
	.align 2, 0
_0803BE4C: .4byte gCurTask
_0803BE50: .4byte IWRAM_START + 0xA8
_0803BE54: .4byte IWRAM_START + 0x2DC
_0803BE58: .4byte IWRAM_START + 0x2DD
_0803BE5C: .4byte IWRAM_START + 0x2E0
_0803BE60: .4byte IWRAM_START + 0x300
_0803BE64: .4byte IWRAM_START + 0x301
_0803BE68: .4byte 0xFFFFFD00
_0803BE6C: .4byte IWRAM_START + 0x278
_0803BE70: .4byte IWRAM_START + 0x280
_0803BE74: .4byte 0xFFFFEA00
_0803BE78:
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r0, [sp, #8]
	adds r1, r0, r1
	ldr r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r0, r2
_0803BE8A:
	str r0, [r1]
	asrs r5, r3, #0x18
	lsls r0, r5, #1
	adds r6, r0, r5
	lsls r4, r6, #3
	ldr r0, [sp, #0xc]
	adds r3, r0, r4
	adds r2, r7, #0
	adds r2, #0x98
	ldr r0, [r7, #4]
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3]
	mov sb, r2
	cmp r5, #1
	bgt _0803BEC4
	mov r2, sl
	adds r3, r2, r4
	movs r4, #8
	ldrsh r2, [r7, r4]
	adds r1, r5, #2
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r3]
	b _0803BED2
_0803BEC4:
	mov r5, sl
	adds r0, r5, r4
	movs r2, #8
	ldrsh r1, [r7, r2]
	lsls r2, r6, #4
	adds r1, r1, r2
	str r1, [r0]
_0803BED2:
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #1
	adds r4, r1, r2
	lsls r4, r4, #3
	movs r3, #0xe8
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r4
	movs r0, #0x60
	rsbs r0, r0, #0
	subs r0, r0, r1
	mov r5, sb
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #4
	str r1, [r0]
	movs r0, #0xec
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #0x3c
	str r1, [r0]
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov r8, r6
	asrs r2, r2, #0x18
	cmp r2, #3
	ble _0803BE2E
	movs r0, #0
	mov r8, r0
	mov r1, ip
	adds r1, #0x44
	str r1, [sp, #0x18]
	mov r2, ip
	adds r2, #0x48
	str r2, [sp, #0x1c]
	mov r3, ip
	adds r3, #0x4c
	str r3, [sp, #0x20]
	adds r4, r7, #0
	adds r4, #0x2c
	str r4, [sp, #0x40]
	adds r5, r7, #0
	adds r5, #0xc
	str r5, [sp, #0x3c]
	mov r6, ip
	adds r6, #0x50
	str r6, [sp, #0x24]
	mov r0, ip
	adds r0, #0x54
	str r0, [sp, #0x2c]
	adds r1, #0x14
	str r1, [sp, #0x30]
	adds r2, r7, #0
	adds r2, #0x74
	str r2, [sp, #0x34]
	adds r3, r7, #0
	adds r3, #0x54
	str r3, [sp, #0x28]
	adds r4, #0x5c
	str r4, [sp, #0x38]
	ldr r5, _0803C188 @ =gSineTable
	mov sl, r5
	ldr r6, _0803C18C @ =0x000003FF
	mov sb, r6
_0803BF66:
	mov r0, r8
	lsls r5, r0, #0x18
	asrs r5, r5, #0x18
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r1, [sp, #0x18]
	adds r3, r1, r4
	ldr r0, [r3]
	ldr r2, _0803C190 @ =gCamera
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	ldr r6, [sp, #0x1c]
	adds r2, r6, r4
	ldr r0, [r2]
	ldr r6, _0803C190 @ =gCamera
	ldr r1, [r6, #4]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	lsls r0, r0, #8
	str r0, [r3]
	ldr r0, [r2]
	lsls r0, r0, #8
	str r0, [r2]
	ldr r0, [sp, #0x20]
	adds r0, r0, r4
	mov r8, r0
	movs r2, #8
	ldrsh r1, [r7, r2]
	str r1, [sp, #0x44]
	lsls r2, r5, #2
	ldr r3, [sp, #0x40]
	adds r6, r3, r2
	ldr r0, [r6]
	mov r1, sb
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x3c]
	adds r2, r0, r2
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	ldr r1, [sp, #0x44]
	adds r3, r1, r0
	mov r0, r8
	str r3, [r0]
	ldr r1, [sp, #0x24]
	adds r3, r1, r4
	ldr r0, [r6]
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, sl
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r3]
	ldr r0, [sp, #0x2c]
	adds r1, r0, r4
	movs r0, #3
	str r0, [r1]
	ldr r1, [sp, #0x30]
	adds r4, r1, r4
	movs r0, #0x1e
	str r0, [r4]
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r2, r5, #0x18
	mov r8, r2
	asrs r5, r5, #0x18
	cmp r5, #7
	ble _0803BF66
	ldr r3, [r7]
	str r3, [sp]
	ldr r4, [r7, #4]
	str r4, [sp, #4]
	movs r5, #0
	mov r8, r5
	movs r6, #0x82
	lsls r6, r6, #1
	add r6, ip
	str r6, [sp, #0x10]
	ldr r0, _0803C188 @ =gSineTable
	mov sl, r0
	ldr r1, _0803C18C @ =0x000003FF
	mov sb, r1
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, ip
	str r2, [sp, #0x14]
_0803C02E:
	mov r3, r8
	lsls r4, r3, #0x18
	asrs r4, r4, #0x18
	lsls r5, r4, #1
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r6, [sp, #0x10]
	adds r2, r6, r5
	lsls r6, r4, #2
	ldr r0, [sp, #0x34]
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x28]
	adds r6, r0, r6
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	str r0, [r2]
	ldr r3, [sp, #0x14]
	adds r2, r3, r5
	mov r1, r8
	ldr r0, [r1]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp, #4]
	adds r0, r1, r0
	str r0, [r2]
	movs r3, #0x86
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r5
	str r3, [sp, #0x44]
	movs r3, #8
	ldrsh r2, [r7, r3]
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [sp, #0x44]
	str r2, [r0]
	movs r2, #0x88
	lsls r2, r2, #1
	add r2, ip
	adds r2, r2, r5
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r2]
	movs r0, #0x8a
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #3
	str r1, [r0]
	movs r0, #0x8c
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #0x1e
	str r1, [r0]
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	mov r8, r5
	asrs r4, r4, #0x18
	cmp r4, #7
	ble _0803C02E
	movs r6, #0x87
	lsls r6, r6, #3
	adds r3, r7, r6
	ldr r1, [sp, #0x38]
	ldr r0, [r1]
	ldr r2, _0803C18C @ =0x000003FF
	ands r0, r2
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r5, _0803C188 @ =gSineTable
	adds r0, r0, r5
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	mov r4, ip
	str r0, [r4, #0x1c]
	ldr r5, [sp, #0x38]
	ldr r0, [r5]
	ands r0, r2
	lsls r0, r0, #1
	ldr r6, _0803C188 @ =gSineTable
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r4, [sp, #4]
	adds r0, r4, r0
	mov r5, ip
	str r0, [r5, #0x20]
	movs r6, #8
	ldrsh r0, [r7, r6]
	str r0, [r5, #0x24]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	ldr r2, _0803C194 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r5, #0x28]
	ldrh r1, [r3]
	movs r0, #0x89
	lsls r0, r0, #2
	add r0, ip
	movs r2, #0
	strh r1, [r0]
	movs r0, #1
	str r0, [r5, #0x2c]
	str r2, [r5, #0x30]
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C188: .4byte gSineTable
_0803C18C: .4byte 0x000003FF
_0803C190: .4byte gCamera
_0803C194: .4byte 0xFFFFF800

	thumb_func_start sub_803C198
sub_803C198: @ 0x0803C198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	mov r5, sb
	adds r5, #0xa8
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r1, #0x3c
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	bne _0803C256
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	mov r8, r1
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	ldr r2, _0803C310 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803C318 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0803C31C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r2, _0803C320 @ =gUnknown_080D79D0
	mov r3, r8
	lsls r1, r3, #1
	add r1, r8
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0803C324 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, _0803C328 @ =0x000002DD
	add r1, sb
	mov r0, sp
	bl sub_8039B54
_0803C256:
	ldr r2, _0803C310 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803C318 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0803C278
	movs r0, #0x90
	bl m4aSongNumStart
_0803C278:
	movs r6, #0xb8
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	mov r1, sb
	adds r1, #0xb3
	str r1, [sp, #0x20]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x24]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x28]
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x2c]
	mov r5, sp
	movs r2, #0
	movs r1, #1
	mov r8, r1
	ldr r3, _0803C32C @ =0x06012980
	mov sl, r3
_0803C2C6:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C338
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C330 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C334 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C344
	.align 2, 0
_0803C30C: .4byte gCamera
_0803C310: .4byte gUnknown_030053B8
_0803C314: .4byte 0x00196225
_0803C318: .4byte 0x3C6EF35F
_0803C31C: .4byte 0x000003FF
_0803C320: .4byte gUnknown_080D79D0
_0803C324: .4byte 0x06010000
_0803C328: .4byte 0x000002DD
_0803C32C: .4byte 0x06012980
_0803C330: .4byte 0x0000026B
_0803C334: .4byte 0x00000229
_0803C338:
	cmp r4, #0x3c
	bls _0803C344
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C344:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C398
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C390 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C394 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C3A4
	.align 2, 0
_0803C390: .4byte 0x0000026B
_0803C394: .4byte 0x00000229
_0803C398:
	cmp r4, #0x3c
	bls _0803C3A4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C3A4:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C3F8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C3F0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C3F4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C404
	.align 2, 0
_0803C3F0: .4byte 0x0000026B
_0803C3F4: .4byte 0x00000229
_0803C3F8:
	cmp r4, #0x3c
	bls _0803C404
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C404:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C458
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C450 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C454 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C464
	.align 2, 0
_0803C450: .4byte 0x0000026B
_0803C454: .4byte 0x00000229
_0803C458:
	cmp r4, #0x3c
	bls _0803C464
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C464:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C4B8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C4B0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C4B4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C4C4
	.align 2, 0
_0803C4B0: .4byte 0x0000026B
_0803C4B4: .4byte 0x00000229
_0803C4B8:
	cmp r4, #0x3c
	bls _0803C4C4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C4C4:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	blt _0803C4D2
	b _0803C2C6
_0803C4D2:
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	cmp r0, #0x31
	bgt _0803C4F6
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C4F6
	movs r0, #1
	strb r0, [r3]
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
_0803C4F6:
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r4, _0803C7C0 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0803C528
	movs r1, #0
	strh r1, [r7]
	strh r1, [r7, #4]
	movs r0, #2
	strh r0, [r7, #2]
	strh r1, [r7, #6]
	movs r0, #0xbf
	strh r0, [r7, #8]
	strh r1, [r7, #0xa]
	mov r0, sb
	adds r0, #0xa8
	str r1, [r0]
	ldr r0, _0803C7C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803C7C8 @ =sub_803AA40
	str r0, [r1, #8]
_0803C528:
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C556
	movs r6, #0xde
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803C556:
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C572
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5A4
_0803C572:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803C5A4:
	movs r2, #0xf6
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C5C0
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5EE
_0803C5C0:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
_0803C5EE:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C60A
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C63E
_0803C60A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xfa
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803C63E:
	movs r2, #0x87
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C65A
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C688
_0803C65A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
_0803C688:
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	movs r0, #6
	mov r8, r0
	ldr r1, _0803C7C0 @ =gCamera
	mov sl, r1
	ldr r2, [sp, #0x2c]
	adds r2, #0x90
	ldr r5, [sp, #0x28]
	adds r5, #0x90
	ldr r4, [sp, #0x24]
	adds r4, #0x90
	movs r3, #0x90
_0803C6AA:
	ldr r0, [r4]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0, #4]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	ldr r0, [r2]
	cmp r0, #0
	bne _0803C6EA
	adds r0, r7, #0
	adds r0, #0x58
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C6F8
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C6F8
_0803C6EA:
	adds r0, r6, #0
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	bl sub_80051E8
	ldr r3, [sp, #0x34]
	ldr r2, [sp, #0x30]
_0803C6F8:
	subs r2, #0x18
	subs r5, #0x18
	subs r4, #0x18
	subs r3, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C6AA
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r5, _0803C7C0 @ =gCamera
	movs r4, #0
	movs r2, #5
	mov r8, r2
_0803C720:
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C76C
	adds r3, #0x14
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C772
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C772
_0803C76C:
	adds r0, r6, #0
	bl sub_80051E8
_0803C772:
	adds r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C720
	movs r6, #0x81
	lsls r6, r6, #3
	add r6, sb
	movs r3, #0x87
	lsls r3, r3, #3
	add r3, sb
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r2, _0803C7CC @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803C7D0 @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803C7D4
	movs r0, #2
	str r0, [r7, #0x30]
	b _0803C7FC
	.align 2, 0
_0803C7C0: .4byte gCamera
_0803C7C4: .4byte gCurTask
_0803C7C8: .4byte sub_803AA40
_0803C7CC: .4byte gUnknown_030054B8
_0803C7D0: .4byte 0x00002060
_0803C7D4:
	movs r2, #0x89
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r3, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r3, #8]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_0803C7FC:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803C80C
sub_803C80C: @ 0x0803C80C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0803C8D4 @ =gUnknown_03005B4C
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _0803C8D8 @ =IWRAM_START + 0xB4
	adds r0, r0, r2
	mov ip, r0
	ldr r0, [r0, #0xc]
	adds r0, r0, r4
	mov r3, ip
	str r0, [r3, #0xc]
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r3, #0x10]
	adds r0, r0, r5
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r5
	str r0, [r1, #4]
	movs r3, #0
	ldr r0, _0803C8DC @ =IWRAM_START + 0x278
	adds r7, r2, r0
	ldr r1, _0803C8E0 @ =IWRAM_START + 0x27C
	adds r6, r2, r1
_0803C848:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C848
	movs r3, #0
	mov r7, ip
	adds r7, #0x44
	mov r6, ip
	adds r6, #0x48
_0803C872:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803C872
	movs r3, #0
	movs r7, #0x82
	lsls r7, r7, #1
	add r7, ip
	movs r6, #0x84
	lsls r6, r6, #1
	add r6, ip
_0803C8A0:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803C8A0
	mov r3, ip
	ldr r0, [r3, #0x1c]
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	adds r0, r0, r5
	str r0, [r3, #0x20]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C8D4: .4byte gUnknown_03005B4C
_0803C8D8: .4byte IWRAM_START + 0xB4
_0803C8DC: .4byte IWRAM_START + 0x278
_0803C8E0: .4byte IWRAM_START + 0x27C

	thumb_func_start sub_803C8E4
sub_803C8E4: @ 0x0803C8E4
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _0803C958 @ =IWRAM_START + 0x2E4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C95C @ =IWRAM_START + 0x31C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C960 @ =IWRAM_START + 0x34C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C964 @ =IWRAM_START + 0x37C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C968 @ =IWRAM_START + 0x3AC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C96C @ =IWRAM_START + 0x3DC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C970 @ =IWRAM_START + 0x40C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C974 @ =IWRAM_START + 0x448
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C93C
	bl VramFree
_0803C93C:
	ldr r1, _0803C978 @ =IWRAM_START + 0x478
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C94A
	bl VramFree
_0803C94A:
	ldr r1, _0803C97C @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C958: .4byte IWRAM_START + 0x2E4
_0803C95C: .4byte IWRAM_START + 0x31C
_0803C960: .4byte IWRAM_START + 0x34C
_0803C964: .4byte IWRAM_START + 0x37C
_0803C968: .4byte IWRAM_START + 0x3AC
_0803C96C: .4byte IWRAM_START + 0x3DC
_0803C970: .4byte IWRAM_START + 0x40C
_0803C974: .4byte IWRAM_START + 0x448
_0803C978: .4byte IWRAM_START + 0x478
_0803C97C: .4byte gUnknown_03005B4C

	thumb_func_start sub_803C980
sub_803C980: @ 0x0803C980
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803CA04 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r5, _0803CA08 @ =gUnknown_080D7AA8
	bl sub_803CA40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0803CA0C @ =gUnknown_080D7AB0
	ldr r2, _0803CA10 @ =IWRAM_START + 0xA0
	adds r0, r6, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_803CB18
	adds r0, r4, #0
	bl sub_803A8E4
	adds r0, r4, #0
	bl sub_803B7B0
	adds r0, r4, #0
	bl sub_803AC2C
	adds r0, r4, #0
	bl sub_803CC3C
	ldr r0, _0803CA14 @ =IWRAM_START + 0xB0
	adds r6, r6, r0
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803C9FE
	bl sub_803BDB8
	ldr r1, [r7]
	ldr r0, _0803CA18 @ =sub_803CA1C
	str r0, [r1, #8]
	bl sub_802A018
_0803C9FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA04: .4byte gCurTask
_0803CA08: .4byte gUnknown_080D7AA8
_0803CA0C: .4byte gUnknown_080D7AB0
_0803CA10: .4byte IWRAM_START + 0xA0
_0803CA14: .4byte IWRAM_START + 0xB0
_0803CA18: .4byte sub_803CA1C

	thumb_func_start sub_803CA1C
sub_803CA1C: @ 0x0803CA1C
	push {r4, lr}
	ldr r0, _0803CA3C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_803B84C
	adds r0, r4, #0
	bl sub_803C198
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA3C: .4byte gCurTask

	thumb_func_start sub_803CA40
sub_803CA40: @ 0x0803CA40
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r2, r0, r1
	ldr r0, _0803CAAC @ =IWRAM_START + 0x9C
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r6, _0803CAB0 @ =sub_801EC3C
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	ldr r0, [r4]
	ldr r1, _0803CAB4 @ =0xFFFFEA00
	adds r2, r0, r1
	ldr r0, _0803CAB8 @ =IWRAM_START + 0x98
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	movs r0, #0
	b _0803CABE
	.align 2, 0
_0803CAA8: .4byte gCurTask
_0803CAAC: .4byte IWRAM_START + 0x9C
_0803CAB0: .4byte sub_801EC3C
_0803CAB4: .4byte 0xFFFFEA00
_0803CAB8: .4byte IWRAM_START + 0x98
_0803CABC:
	movs r0, #1
_0803CABE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_803CAC8
sub_803CAC8: @ 0x0803CAC8
	push {lr}
	ldr r0, _0803CB0C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldrh r0, [r1, #0xa]
	adds r0, #0x40
	strh r0, [r1, #0xa]
	ldr r0, _0803CB10 @ =IWRAM_START + 0x9C
	adds r3, r2, r0
	ldr r0, [r3]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0803CB14 @ =IWRAM_START + 0x98
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803CB00
	str r1, [r3]
_0803CB00:
	ldr r0, [r2]
	cmp r0, r1
	ble _0803CB08
	str r1, [r2]
_0803CB08:
	pop {r0}
	bx r0
	.align 2, 0
_0803CB0C: .4byte gCurTask
_0803CB10: .4byte IWRAM_START + 0x9C
_0803CB14: .4byte IWRAM_START + 0x98

	thumb_func_start sub_803CB18
sub_803CB18: @ 0x0803CB18
	push {r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x4c]
	adds r1, #8
	ldr r2, _0803CB74 @ =0x000003FF
	ands r1, r2
	str r1, [r0, #0x4c]
	ldr r2, _0803CB78 @ =gSineTable
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [r0, #0x50]
	str r1, [r0, #0x2c]
	movs r4, #1
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r0, _0803CB7C @ =gUnknown_080D7A28
	mov ip, r0
	ldr r6, _0803CB80 @ =0xFFFFF400
_0803CB40:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	adds r0, r0, r6
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803CB40
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB74: .4byte 0x000003FF
_0803CB78: .4byte gSineTable
_0803CB7C: .4byte gUnknown_080D7A28
_0803CB80: .4byte 0xFFFFF400

	thumb_func_start sub_803CB84
sub_803CB84: @ 0x0803CB84
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0xac
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _0803CBA0
	movs r0, #0x3c
	str r0, [r2]
	adds r1, #0xa0
	movs r0, #3
	str r0, [r1]
_0803CBA0:
	pop {r0}
	bx r0

	thumb_func_start sub_803CBA4
sub_803CBA4: @ 0x0803CBA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xac
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803CBF6
	ldr r2, _0803CBD8 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803CBDC @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803CBE0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803CBE4
	movs r0, #0x44
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #5
	b _0803CBF4
	.align 2, 0
_0803CBD8: .4byte gUnknown_030053B8
_0803CBDC: .4byte 0x00196225
_0803CBE0: .4byte 0x3C6EF35F
_0803CBE4:
	movs r0, #0xef
	bl m4aSongNumStart
	movs r0, #0x3c
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #6
_0803CBF4:
	str r0, [r1]
_0803CBF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803CBFC
sub_803CBFC: @ 0x0803CBFC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0xb2
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CC2E
	movs r0, #0xde
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0803CC34 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803CC38 @ =0x00000399
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803CC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0803CC34: .4byte 0x00000275
_0803CC38: .4byte 0x00000399

	thumb_func_start sub_803CC3C
sub_803CC3C: @ 0x0803CC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r2, #0xb1
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803CC90
	movs r4, #0
	ldr r0, _0803CC9C @ =gFlags
	mov r8, r0
	ldr r1, _0803CCA0 @ =gObjPalette
	mov ip, r1
	ldr r7, _0803CCA4 @ =gUnknown_080D7AD0
	adds r5, r2, #0
	movs r6, #4
_0803CC5C:
	adds r3, r4, #0
	adds r3, #0x80
	lsls r3, r3, #1
	add r3, ip
	lsls r1, r4, #1
	ldrb r2, [r5]
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0803CC5C
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
_0803CC90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC9C: .4byte gFlags
_0803CCA0: .4byte gObjPalette
_0803CCA4: .4byte gUnknown_080D7AD0

	thumb_func_start sub_803CCA8
sub_803CCA8: @ 0x0803CCA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	ldr r2, _0803CD0C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _0803CD10 @ =gUnknown_030053B8
	ldr r0, _0803CD14 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803CD18 @ =sub_803E43C
	movs r1, #0xda
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803CD1C @ =sub_803E768
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _0803CD20 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803CD30
	ldr r0, _0803CD24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803CD30
	ldr r0, _0803CD28 @ =IWRAM_START + 0x71
	adds r1, r2, r0
	movs r0, #6
	strb r0, [r1]
	ldr r0, _0803CD2C @ =IWRAM_START + 0x70
	adds r1, r2, r0
	movs r0, #2
	b _0803CD3C
	.align 2, 0
_0803CD0C: .4byte gPlayer
_0803CD10: .4byte gUnknown_030053B8
_0803CD14: .4byte gUnknown_03005590
_0803CD18: .4byte sub_803E43C
_0803CD1C: .4byte sub_803E768
_0803CD20: .4byte gUnknown_030054EC
_0803CD24: .4byte gGameMode
_0803CD28: .4byte IWRAM_START + 0x71
_0803CD2C: .4byte IWRAM_START + 0x70
_0803CD30:
	mov r1, sl
	adds r1, #0x71
	movs r0, #8
	strb r0, [r1]
	subs r1, #1
	movs r0, #4
_0803CD3C:
	strb r0, [r1]
	ldr r2, _0803CD74 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	bne _0803CD78
	mov r1, sl
	adds r1, #0x70
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	bne _0803CD78
	movs r0, #0xc5
	lsls r0, r0, #0xd
	mov r1, sl
	str r0, [r1]
	movs r0, #0xaa
	lsls r0, r0, #8
	str r0, [r1, #4]
	b _0803CD86
	.align 2, 0
_0803CD74: .4byte gCurrentLevel
_0803CD78:
	movs r0, #0xf0
	lsls r0, r0, #9
	mov r2, sl
	str r0, [r2]
	movs r0, #0xaa
	lsls r0, r0, #8
	str r0, [r2, #4]
_0803CD86:
	movs r2, #0
	movs r3, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	mov r1, sl
	strh r0, [r1, #8]
	strh r3, [r1, #0xa]
	str r3, [r1, #0x54]
	str r3, [r1, #0x58]
	adds r1, #0x5c
	movs r0, #0x80
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	mov r0, sl
	adds r0, #0x60
	strh r3, [r0]
	mov r0, sl
	str r3, [r0, #0x64]
	movs r0, #0x96
	mov r1, sl
	str r0, [r1, #0x68]
	mov r0, sl
	adds r0, #0x72
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r1, #0x77
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x78
	strb r2, [r0]
	mov r2, sl
	str r3, [r2, #0x7c]
	mov r7, sl
	adds r7, #0x80
	movs r0, #0xa0
	add r0, sl
	mov r8, r0
	adds r2, #0xa1
	str r2, [sp, #0x28]
	adds r1, #0x2b
	str r1, [sp, #0x30]
	adds r2, #4
	str r2, [sp, #0x3c]
	mov r6, sl
	adds r6, #0xb8
	mov r0, sl
	adds r0, #0xd8
	str r0, [sp, #0x54]
	adds r1, #0x37
	str r1, [sp, #0x58]
	adds r2, #0x35
	str r2, [sp, #0x5c]
	adds r0, #5
	str r0, [sp, #0x60]
	movs r1, #0xe8
	add r1, sl
	mov sb, r1
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #8]
	ldr r0, _0803D04C @ =0x00000109
	add r0, sl
	str r0, [sp, #0xc]
	movs r1, #0x85
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x10]
	ldr r2, _0803D050 @ =0x0000010D
	add r2, sl
	str r2, [sp, #0x14]
	movs r0, #0x9c
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x2c]
	ldr r1, _0803D054 @ =0x00000139
	add r1, sl
	str r1, [sp, #0x34]
	movs r2, #0x9d
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x38]
	ldr r0, _0803D058 @ =0x0000013D
	add r0, sl
	str r0, [sp, #0x40]
	movs r1, #0xb4
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x44]
	ldr r2, _0803D05C @ =0x00000169
	add r2, sl
	str r2, [sp, #0x48]
	movs r0, #0xb5
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x4c]
	ldr r1, _0803D060 @ =0x0000016D
	add r1, sl
	str r1, [sp, #0x50]
	movs r2, #0xd2
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x18]
	ldr r0, _0803D064 @ =0x000001A5
	add r0, sl
	str r0, [sp, #0x1c]
	movs r1, #0xd3
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x20]
	ldr r2, _0803D068 @ =0x000001A9
	add r2, sl
	str r2, [sp, #0x24]
	movs r2, #0xaa
	lsls r2, r2, #8
	mov r1, sl
	adds r1, #0x10
	mov r0, sl
	adds r0, #0xc
_0803CE8A:
	str r2, [r0]
	str r2, [r1]
	adds r1, #8
	adds r0, #8
	adds r3, #1
	cmp r3, #2
	bls _0803CE8A
	movs r0, #0xef
	bl VramMalloc
	adds r5, r0, #0
	mov r0, sl
	str r5, [r0, #0x6c]
	movs r1, #0xb4
	lsls r1, r1, #4
	adds r5, r5, r1
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x63
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0803D06C @ =0x00000281
	strh r0, [r7, #0xa]
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	movs r0, #0xb8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	movs r2, #0x10
	mov r8, r2
	mov r1, r8
	ldr r0, [sp, #0x30]
	strb r1, [r0]
	movs r0, #0
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov ip, r1
	str r1, [r7, #0x10]
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	str r5, [r6, #4]
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r5, r5, r2
	ldr r0, _0803D070 @ =0x00000282
	strh r0, [r6, #0xa]
	movs r1, #0
	ldr r0, [sp, #0x54]
	strb r1, [r0]
	adds r2, #0xe0
	strh r2, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r0, r3, #0
	ldr r1, [sp, #0x58]
	strb r0, [r1]
	mov r0, r8
	ldr r2, [sp, #0x5c]
	strb r0, [r2]
	movs r2, #0
	ldr r1, [sp, #0x60]
	strb r2, [r1]
	str r3, [r6, #0x28]
	mov r0, ip
	str r0, [r6, #0x10]
	mov r1, sb
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	str r5, [r1, #4]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r5, r5, r1
	movs r0, #0xa1
	lsls r0, r0, #2
	mov r2, sb
	strh r0, [r2, #0xa]
	movs r2, #0
	ldr r0, [sp, #8]
	strb r2, [r0]
	movs r0, #0xb0
	lsls r0, r0, #3
	mov r2, sb
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	adds r0, r3, #0
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	mov r2, r8
	ldr r0, [sp, #0x10]
	strb r2, [r0]
	movs r2, #0
	ldr r0, [sp, #0x14]
	strb r2, [r0]
	mov r0, sb
	str r3, [r0, #0x28]
	mov r2, ip
	str r2, [r0, #0x10]
	movs r7, #0x8c
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r5, [r7, #4]
	adds r5, r5, r1
	ldr r0, _0803D074 @ =0x00000285
	strh r0, [r7, #0xa]
	movs r1, #0
	ldr r0, [sp, #0x2c]
	strb r1, [r0]
	movs r0, #0xd8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r3, #0
	ldr r2, [sp, #0x34]
	strb r0, [r2]
	mov r1, r8
	ldr r0, [sp, #0x38]
	strb r1, [r0]
	movs r0, #0
	ldr r2, [sp, #0x40]
	strb r0, [r2]
	str r3, [r7, #0x28]
	mov r1, ip
	str r1, [r7, #0x10]
	movs r7, #0xa4
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r5, [r7, #4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r5, r5, r2
	ldr r0, _0803D078 @ =0x00000286
	strh r0, [r7, #0xa]
	movs r1, #0
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r3, #0
	ldr r2, [sp, #0x48]
	strb r0, [r2]
	mov r1, r8
	ldr r0, [sp, #0x4c]
	strb r1, [r0]
	movs r0, #0
	ldr r2, [sp, #0x50]
	strb r0, [r2]
	str r3, [r7, #0x28]
	ldr r2, _0803D07C @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D080 @ =0x00002060
	orrs r0, r1
	str r0, [r7, #0x10]
	movs r7, #0xc2
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r5, [r7, #4]
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r2, #0
	ldr r1, [sp, #0x18]
	strb r2, [r1]
	movs r0, #0xd0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r3, #0
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	mov r0, r8
	ldr r2, [sp, #0x20]
	strb r0, [r2]
	movs r2, #0
	ldr r1, [sp, #0x24]
	strb r2, [r1]
	str r3, [r7, #0x28]
	mov r0, ip
	str r0, [r7, #0x10]
	ldr r0, _0803D084 @ =gUnknown_03005B4C
	ldr r1, [sp, #4]
	str r1, [r0]
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D04C: .4byte 0x00000109
_0803D050: .4byte 0x0000010D
_0803D054: .4byte 0x00000139
_0803D058: .4byte 0x0000013D
_0803D05C: .4byte 0x00000169
_0803D060: .4byte 0x0000016D
_0803D064: .4byte 0x000001A5
_0803D068: .4byte 0x000001A9
_0803D06C: .4byte 0x00000281
_0803D070: .4byte 0x00000282
_0803D074: .4byte 0x00000285
_0803D078: .4byte 0x00000286
_0803D07C: .4byte gUnknown_030054B8
_0803D080: .4byte 0x00002060
_0803D084: .4byte gUnknown_03005B4C

	thumb_func_start sub_803D088
sub_803D088: @ 0x0803D088
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0803D1B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r7, r0
	ldr r0, _0803D1BC @ =IWRAM_START + 0x148
	adds r0, r0, r7
	mov r8, r0
	movs r2, #8
	ldrsh r1, [r6, r2]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	adds r0, r6, #0
	bl sub_803E63C
	ldr r0, [r6, #0x68]
	cmp r0, #0
	beq _0803D0BA
	subs r0, #1
	str r0, [r6, #0x68]
_0803D0BA:
	adds r0, r6, #0
	bl sub_803DF34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D0C8
	b _0803D212
_0803D0C8:
	ldr r0, [r6]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	bl Div
	subs r0, #8
	lsls r0, r0, #8
	str r0, [r6, #0x54]
	ldr r0, [r6, #4]
	adds r1, r4, #0
	bl Div
	subs r0, #0x16
	lsls r0, r0, #8
	str r0, [r6, #0x58]
	ldr r5, _0803D1C0 @ =gSineTable
	ldr r1, _0803D1C4 @ =IWRAM_START + 0x60
	adds r3, r7, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r1, #4
	subs r2, r2, r1
	asrs r2, r2, #5
	ldr r1, [r6, #0x54]
	adds r1, r1, r2
	str r1, [r6, #0x54]
	movs r2, #0
	ldrsh r1, [r3, r2]
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r1, r2, #4
	subs r1, r1, r2
	asrs r1, r1, #5
	adds r0, r0, r1
	str r0, [r6, #0x58]
	ldr r0, _0803D1C8 @ =0x00000286
	mov r1, r8
	strh r0, [r1, #0xa]
	ldr r2, _0803D1CC @ =IWRAM_START + 0x168
	adds r1, r7, r2
	movs r0, #2
	strb r0, [r1]
	ldr r3, _0803D1D0 @ =IWRAM_START + 0x169
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0803D1D4 @ =IWRAM_START + 0x80
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _0803D1D8 @ =0x00000281
	mov r1, r8
	strh r0, [r1, #0xa]
	subs r2, #0xc8
	adds r0, r7, r2
	movs r2, #1
	strb r2, [r0]
	subs r3, #0xc8
	adds r1, r7, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _0803D1DC @ =IWRAM_START + 0xB8
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _0803D1E0 @ =0x00000282
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r3, #0x37
	adds r0, r7, r3
	strb r2, [r0]
	ldr r0, _0803D1E4 @ =IWRAM_START + 0xD9
	adds r1, r7, r0
	subs r2, #2
	mov r8, r2
	adds r0, r2, #0
	strb r0, [r1]
	ldr r1, _0803D1E8 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r3, #0xfa
	lsls r3, r3, #1
	adds r0, r5, r3
	str r0, [r1]
	ldr r4, _0803D1EC @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _0803D200
	ldr r0, _0803D1F0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803D200
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _0803D1F4 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0803D1F8
	mov r3, r8
	strb r3, [r1]
	b _0803D1FA
	.align 2, 0
_0803D1B8: .4byte gCurTask
_0803D1BC: .4byte IWRAM_START + 0x148
_0803D1C0: .4byte gSineTable
_0803D1C4: .4byte IWRAM_START + 0x60
_0803D1C8: .4byte 0x00000286
_0803D1CC: .4byte IWRAM_START + 0x168
_0803D1D0: .4byte IWRAM_START + 0x169
_0803D1D4: .4byte IWRAM_START + 0x80
_0803D1D8: .4byte 0x00000281
_0803D1DC: .4byte IWRAM_START + 0xB8
_0803D1E0: .4byte 0x00000282
_0803D1E4: .4byte IWRAM_START + 0xD9
_0803D1E8: .4byte gUnknown_03005450
_0803D1EC: .4byte 0x0000C350
_0803D1F0: .4byte gGameMode
_0803D1F4: .4byte gUnknown_03005448
_0803D1F8:
	strb r0, [r1]
_0803D1FA:
	ldr r1, _0803D29C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0803D200:
	ldr r0, _0803D2A0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803D212
	ldr r1, _0803D29C @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_0803D212:
	adds r0, r6, #0
	bl sub_803DB1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D22A
	movs r0, #0x96
	str r0, [r6, #0x68]
	ldr r0, _0803D2A4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803D2A8 @ =sub_803E494
	str r0, [r1, #8]
_0803D22A:
	adds r0, r6, #0
	bl sub_803DA8C
	adds r0, r6, #0
	bl sub_803D430
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D26E
	adds r0, r6, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D262
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r2, #0
	ldr r0, _0803D2AC @ =0x00000286
	strh r0, [r1, #0xa]
	movs r1, #0xb4
	lsls r1, r1, #1
	adds r0, r6, r1
	strb r2, [r0]
	ldr r2, _0803D2B0 @ =0x00000169
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
_0803D262:
	movs r0, #0x96
	str r0, [r6, #0x68]
	ldr r0, _0803D2A4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803D2A8 @ =sub_803E494
	str r0, [r1, #8]
_0803D26E:
	adds r0, r6, #0
	bl sub_803D978
	ldr r1, _0803D2B4 @ =gPlayer
	adds r0, r6, #0
	bl sub_803E0D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D292
	bl sub_802A018
	ldr r0, _0803D2B8 @ =0x00000103
	str r0, [r6, #0x68]
	ldr r0, _0803D2A4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803D2BC @ =sub_803E520
	str r0, [r1, #8]
_0803D292:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D29C: .4byte gUnknown_030054A8
_0803D2A0: .4byte gCurrentLevel
_0803D2A4: .4byte gCurTask
_0803D2A8: .4byte sub_803E494
_0803D2AC: .4byte 0x00000286
_0803D2B0: .4byte 0x00000169
_0803D2B4: .4byte gPlayer
_0803D2B8: .4byte 0x00000103
_0803D2BC: .4byte sub_803E520

	thumb_func_start sub_803D2C0
sub_803D2C0: @ 0x0803D2C0
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803D34C @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r5, _0803D350 @ =gCamera
	ldr r1, [r5]
	subs r6, r0, r1
	adds r0, r4, #0
	bl sub_803D754
	adds r0, r4, #0
	movs r1, #1
	bl sub_803D640
	adds r0, r4, #0
	bl sub_803D978
	adds r0, r4, #0
	bl sub_803E214
	ldr r2, _0803D354 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803D358 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803D35C @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0803D360 @ =gUnknown_03005590
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x11
	bl Mod
	cmp r0, #0
	bne _0803D316
	movs r0, #0x90
	bl m4aSongNumStart
_0803D316:
	cmp r6, #0x31
	bgt _0803D344
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r1, [r5]
	subs r0, r0, r1
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r2, [r5, #4]
	subs r1, r1, r2
	subs r1, #0x21
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
	ldr r1, [r7]
	ldr r0, _0803D364 @ =sub_803E5B0
	str r0, [r1, #8]
_0803D344:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D34C: .4byte gCurTask
_0803D350: .4byte gCamera
_0803D354: .4byte gUnknown_030053B8
_0803D358: .4byte 0x00196225
_0803D35C: .4byte 0x3C6EF35F
_0803D360: .4byte gUnknown_03005590
_0803D364: .4byte sub_803E5B0

	thumb_func_start sub_803D368
sub_803D368: @ 0x0803D368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov ip, r0
	movs r0, #0xfd
	lsls r0, r0, #8
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r2, #0
_0803D380:
	movs r0, #0xf4
	cmp r2, #0
	bne _0803D388
	movs r0, #0
_0803D388:
	movs r5, #0
	lsls r1, r2, #1
	mov r3, ip
	adds r3, #0xc
	str r3, [sp]
	lsls r0, r0, #0x18
	movs r7, #0x3c
	add r7, ip
	mov sl, r7
	movs r3, #0x3e
	add r3, ip
	mov sb, r3
	adds r7, r2, #1
	str r7, [sp, #4]
	adds r1, r1, r2
	mov r8, r1
	asrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r6, ip
	adds r6, #0x10
_0803D3B0:
	mov r0, r8
	adds r2, r5, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r2, #3
	ldr r1, [sp]
	adds r4, r1, r3
	ldr r7, _0803D424 @ =gUnknown_080D7B10
	adds r0, r5, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r0, r0, r1
	lsls r0, r0, #8
	mov r7, ip
	ldr r1, [r7]
	adds r1, r1, r0
	str r1, [r4]
	adds r3, r6, r3
	lsls r0, r5, #3
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r3]
	lsls r2, r2, #2
	mov r3, sl
	adds r1, r3, r2
	ldr r7, _0803D428 @ =gUnknown_080D7B4E
	adds r0, r2, r7
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sb
	adds r1, r0, r2
	ldr r3, _0803D42C @ =gUnknown_080D7B50
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803D3B0
	ldr r7, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bls _0803D380
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D424: .4byte gUnknown_080D7B10
_0803D428: .4byte gUnknown_080D7B4E
_0803D42C: .4byte gUnknown_080D7B50

	thumb_func_start sub_803D430
sub_803D430: @ 0x0803D430
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x80
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r4, _0803D628 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	adds r0, #4
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, #0x38
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	adds r0, #9
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r6, r7, r0
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	subs r0, #1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0x2a
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r5, #0
_0803D4B6:
	lsls r5, r5, #0x18
	asrs r4, r5, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xe8
	adds r6, r7, r0
	adds r0, r6, #0
	bl sub_8004558
	movs r0, #0xf4
	mov sb, r5
	cmp r4, #0
	bne _0803D4D4
	movs r0, #0
_0803D4D4:
	movs r1, #0
	lsls r0, r0, #0x18
	mov r8, r0
	adds r3, r7, #0
	adds r3, #0x10
	adds r2, r7, #0
	adds r2, #0x71
	str r2, [sp, #4]
	ldr r0, _0803D62C @ =gUnknown_080D7B10
	mov sl, r0
	ldr r5, _0803D628 @ =gCamera
_0803D4EA:
	ldr r2, [r7]
	asrs r2, r2, #8
	lsls r4, r1, #0x18
	asrs r4, r4, #0x18
	mov r1, sl
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r1, r2
	ldr r0, [r5]
	subs r1, r1, r0
	mov r2, r8
	asrs r0, r2, #0x18
	adds r0, r0, r1
	strh r0, [r6, #0x16]
	lsls r0, r4, #3
	adds r0, r3, r0
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	adds r0, #4
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp, #8]
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	asrs r4, r4, #0x18
	ldr r3, [sp, #8]
	cmp r4, #2
	ble _0803D4EA
	movs r0, #0x80
	lsls r0, r0, #0x11
	add r0, sb
	lsrs r5, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _0803D4B6
	movs r0, #0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803D616
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r6, r7, r2
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r0, r0, r7
	mov sb, r0
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sl, r1
	bl Div
	ldr r4, _0803D628 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	subs r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	mov r1, sl
	bl Div
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0x16
	strh r0, [r6, #0x18]
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r7, r2
	ldrb r0, [r0]
	movs r1, #0x60
	adds r1, r1, r7
	mov r8, r1
	cmp r0, #1
	bne _0803D5D2
	ldr r5, _0803D630 @ =gSineTable
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	ldr r4, _0803D634 @ =0x000061A8
	adds r1, r4, #0
	bl Div
	ldrh r1, [r6, #0x16]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	adds r1, r4, #0
	bl Div
	ldrh r1, [r6, #0x18]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
_0803D5D2:
	ldr r2, _0803D638 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D63C @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	mov r1, r8
	ldrh r0, [r1]
	mov r2, sb
	strh r0, [r2]
	mov r0, sl
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r2, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r2, #8]
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _0803D608
	movs r1, #1
	str r1, [sp]
_0803D608:
	adds r0, r6, #0
	mov r1, sb
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_0803D616:
	ldr r0, [sp]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D628: .4byte gCamera
_0803D62C: .4byte gUnknown_080D7B10
_0803D630: .4byte gSineTable
_0803D634: .4byte 0x000061A8
_0803D638: .4byte gUnknown_030054B8
_0803D63C: .4byte 0x00002060

	thumb_func_start sub_803D640
sub_803D640: @ 0x0803D640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	adds r6, r7, #0
	adds r6, #0x80
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, _0803D750 @ =gCamera
	mov r8, r1
	ldr r1, [r1]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	adds r0, #4
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, #0x38
	ldr r0, [r7]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	adds r0, #9
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	cmp r4, #0
	beq _0803D6D2
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r6, r7, r0
	ldr r0, [r7]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	subs r0, r0, r1
	subs r0, #1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	subs r0, #0x2a
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803D6D2:
	movs r5, #0
	movs r3, #0xc
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x10
	adds r0, r0, r7
	mov sb, r0
_0803D6E0:
	lsls r5, r5, #0x18
	asrs r0, r5, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r0, r4, #4
	adds r0, #0xe8
	adds r6, r7, r0
	adds r0, r6, #0
	bl sub_8004558
	movs r0, #0
	mov r8, r5
	adds r5, r4, #0
_0803D6FA:
	lsls r4, r0, #0x18
	asrs r4, r4, #0x18
	adds r2, r4, r5
	lsls r2, r2, #0x18
	asrs r2, r2, #0x15
	mov r1, sl
	adds r0, r1, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r3, _0803D750 @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	add r2, sb
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	subs r0, #0x12
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r0, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #2
	ble _0803D6FA
	movs r0, #0x80
	lsls r0, r0, #0x11
	add r0, r8
	lsrs r5, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _0803D6E0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D750: .4byte gCamera

	thumb_func_start sub_803D754
sub_803D754: @ 0x0803D754
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	adds r0, #0x40
	movs r5, #0
	strh r0, [r4, #0xa]
	movs r1, #8
	ldrsh r0, [r4, r1]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r0, #0xa
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	asrs r1, r1, #8
	str r5, [sp]
	ldr r2, _0803D888 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _0803D7C2
	lsls r0, r0, #8
	ldr r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	ldrh r0, [r4, #8]
	subs r0, #0x10
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0803D7AA
	strh r5, [r4, #8]
_0803D7AA:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0xa]
_0803D7C2:
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	adds r0, #0x3e
	str r0, [sp, #0xc]
	adds r1, r4, #0
	adds r1, #0xc
	str r1, [sp, #0x10]
	adds r2, r4, #0
	adds r2, #0x3c
	str r2, [sp, #8]
	adds r4, #0x10
	str r4, [sp, #0x14]
_0803D7DC:
	movs r7, #0
	mov r0, r8
	lsls r0, r0, #1
	mov sb, r0
	movs r1, #1
	add r1, r8
	mov sl, r1
_0803D7EA:
	mov r1, sb
	add r1, r8
	adds r1, r7, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r1, #2
	ldr r0, [sp, #0xc]
	adds r5, r0, r2
	ldrh r0, [r5]
	adds r0, #0x40
	strh r0, [r5]
	lsls r1, r1, #3
	ldr r0, [sp, #0x10]
	adds r3, r0, r1
	ldr r0, [sp, #8]
	adds r6, r0, r2
	movs r0, #0
	ldrsh r2, [r6, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	str r0, [r3]
	ldr r2, [sp, #0x14]
	adds r4, r2, r1
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	subs r0, #8
	ldr r1, [r3]
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _0803D888 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _0803D860
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r6]
	subs r0, #0x20
	strh r0, [r6]
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
_0803D860:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0803D7EA
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bls _0803D7DC
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D888: .4byte sub_801EE64

	thumb_func_start sub_803D88C
sub_803D88C: @ 0x0803D88C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r7, r4, r0
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D8AC
	movs r0, #0
	b _0803D96E
_0803D8AC:
	adds r0, r4, #0
	adds r0, #0x70
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _0803D968
	subs r0, r1, #1
	strb r0, [r5]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D8CC
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0803D8D2
_0803D8CC:
	movs r0, #0xeb
	bl m4aSongNumStart
_0803D8D2:
	adds r0, r4, #0
	adds r0, #0x72
	movs r1, #0x1e
	strb r1, [r0]
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803D950
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0803D93C @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0803D940 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0803D95E
	ldr r0, _0803D944 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803D95E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _0803D948 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0803D930
	movs r0, #0xff
_0803D930:
	strb r0, [r1]
	ldr r1, _0803D94C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0803D95E
	.align 2, 0
_0803D93C: .4byte gUnknown_03005450
_0803D940: .4byte 0x0000C350
_0803D944: .4byte gGameMode
_0803D948: .4byte gUnknown_03005448
_0803D94C: .4byte gUnknown_030054A8
_0803D950:
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_0803D95E:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	b _0803D96C
_0803D968:
	movs r0, #1
	mov r8, r0
_0803D96C:
	mov r0, r8
_0803D96E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_803D978
sub_803D978: @ 0x0803D978
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D9D4
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x78
	ldr r0, _0803D9C4 @ =gFlags
	mov r8, r0
	ldr r1, _0803D9C8 @ =gObjPalette
	mov ip, r1
	ldr r7, _0803D9CC @ =gUnknown_080D7B70
	ldr r6, _0803D9D0 @ =gUnknown_03005590
	movs r5, #2
_0803D99C:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r3, #1
	ldr r0, [r6]
	ands r0, r5
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0803D99C
	b _0803D9FC
	.align 2, 0
_0803D9C4: .4byte gFlags
_0803D9C8: .4byte gObjPalette
_0803D9CC: .4byte gUnknown_080D7B70
_0803D9D0: .4byte gUnknown_03005590
_0803D9D4:
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x78
	ldr r0, _0803DA38 @ =gFlags
	mov r8, r0
	ldr r5, _0803DA3C @ =gObjPalette
	ldr r2, _0803DA40 @ =gUnknown_080D7B90
_0803D9E2:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0803D9E2
_0803D9FC:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803DA4C
	subs r0, #1
	strb r0, [r4]
	movs r3, #0
	ldr r7, _0803DA3C @ =gObjPalette
	ldr r6, _0803DA44 @ =gUnknown_080D7B70
	ldr r5, _0803DA48 @ =gUnknown_03005590
	movs r4, #2
_0803DA10:
	adds r2, r3, #0
	adds r2, #0xd0
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0803DA10
	b _0803DA6C
	.align 2, 0
_0803DA38: .4byte gFlags
_0803DA3C: .4byte gObjPalette
_0803DA40: .4byte gUnknown_080D7B90
_0803DA44: .4byte gUnknown_080D7B70
_0803DA48: .4byte gUnknown_03005590
_0803DA4C:
	movs r3, #0
	ldr r4, _0803DA84 @ =gObjPalette
	ldr r2, _0803DA88 @ =gUnknown_080D7B90
_0803DA52:
	adds r1, r3, #0
	adds r1, #0xd0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0803DA52
_0803DA6C:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA84: .4byte gObjPalette
_0803DA88: .4byte gUnknown_080D7B90

	thumb_func_start sub_803DA8C
sub_803DA8C: @ 0x0803DA8C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r4, r3, r0
	adds r1, r3, #0
	adds r1, #0x72
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803DAE4
	adds r2, r3, #0
	adds r2, #0x73
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803DB10
	adds r0, r3, #0
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803DACE
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r0, #3
	b _0803DADC
_0803DACE:
	movs r0, #0
	movs r1, #0xa2
	lsls r1, r1, #2
	strh r1, [r4, #0xa]
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r1, r3, r2
_0803DADC:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	b _0803DB0C
_0803DAE4:
	adds r1, r3, #0
	adds r1, #0x73
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803DB10
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803DB10
	movs r1, #0
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r3, r2
	strb r1, [r0]
	ldr r0, _0803DB18 @ =0x000001A5
	adds r1, r3, r0
_0803DB0C:
	movs r0, #0xff
	strb r0, [r1]
_0803DB10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB18: .4byte 0x000001A5

	thumb_func_start sub_803DB1C
sub_803DB1C: @ 0x0803DB1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r5, r0, #0
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r0, r0, r5
	mov r8, r0
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r1, r1, r5
	mov sl, r1
	movs r6, #0
	adds r7, r5, #0
	adds r7, #0x77
	ldrb r0, [r7]
	cmp r0, #0
	beq _0803DB50
	adds r0, r5, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803DB54
_0803DB50:
	movs r0, #0
	b _0803DCCC
_0803DB54:
	adds r4, r5, #0
	adds r4, #0x60
	ldrh r0, [r4]
	adds r0, #0x52
	ldr r2, _0803DC0C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0
	mov sb, r1
	strh r0, [r4]
	adds r2, r5, #0
	adds r2, #0x5e
	ldrh r0, [r2]
	adds r0, #0x40
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [r5, #0x54]
	adds r1, r1, r0
	str r1, [r5, #0x54]
	movs r0, #0
	ldrsh r2, [r2, r0]
	ldr r0, [r5, #0x58]
	adds r0, r0, r2
	str r0, [r5, #0x58]
	asrs r0, r0, #8
	adds r0, #0x18
	asrs r1, r1, #8
	ldr r2, _0803DC10 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r4, [sp, #0x24]
	cmp r0, #0
	bge _0803DC24
	movs r0, #0x8f
	bl m4aSongNumStart
	mov r1, sb
	strb r1, [r7]
	add r0, sp, #4
	strh r6, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _0803DC14 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803DC18 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #8]
	movs r2, #0x76
	adds r2, r2, r5
	mov sb, r2
	ldr r7, _0803DC1C @ =gCamera
	ldr r4, _0803DC20 @ =gUnknown_080D7B43
	movs r6, #4
_0803DBD8:
	ldr r0, [r5, #0x54]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x58]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	bl sub_8039B54
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _0803DBD8
	movs r6, #1
	b _0803DC6E
	.align 2, 0
_0803DC0C: .4byte 0x000003FF
_0803DC10: .4byte sub_801EC3C
_0803DC14: .4byte 0x06012980
_0803DC18: .4byte 0x0000026B
_0803DC1C: .4byte gCamera
_0803DC20: .4byte gUnknown_080D7B43
_0803DC24:
	ldr r0, _0803DCDC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0803DC6E
	ldr r0, [r5, #0x54]
	asrs r0, r0, #8
	ldr r2, _0803DCE0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x1c]
	add r0, sp, #4
	strh r6, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	ldr r0, _0803DCE4 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803DCE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #8]
	adds r1, r5, #0
	adds r1, #0x76
	bl sub_8039B54
_0803DC6E:
	ldr r0, [r5, #0x54]
	asrs r0, r0, #8
	ldr r2, _0803DCE0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r5, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #0x18]
	ldr r2, _0803DCEC @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803DCF0 @ =0x00002060
	orrs r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
	ldr r2, [sp, #0x24]
	ldrh r0, [r2]
	mov r1, sl
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	mov r2, r8
	ldrh r0, [r2, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r2, #0x18]
	strh r0, [r1, #8]
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	mov r1, sl
	bl sub_8004860
	mov r0, r8
	bl sub_80051E8
	adds r0, r6, #0
_0803DCCC:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DCDC: .4byte gUnknown_03005590
_0803DCE0: .4byte gCamera
_0803DCE4: .4byte 0x06012980
_0803DCE8: .4byte 0x0000026B
_0803DCEC: .4byte gUnknown_030054B8
_0803DCF0: .4byte 0x00002060

	thumb_func_start sub_803DCF4
sub_803DCF4: @ 0x0803DCF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r0, r0, r7
	mov sb, r0
	adds r0, r7, #0
	bl sub_803DF34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803DD16
	b _0803DE50
_0803DD16:
	ldr r0, [r7]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	bl Div
	subs r0, #8
	lsls r0, r0, #8
	str r0, [r7, #0x54]
	ldr r0, [r7, #4]
	adds r1, r4, #0
	bl Div
	subs r0, #0x16
	lsls r0, r0, #8
	str r0, [r7, #0x58]
	ldr r5, _0803DE08 @ =gSineTable
	adds r3, r7, #0
	adds r3, #0x60
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r1, #4
	subs r2, r2, r1
	asrs r2, r2, #5
	ldr r1, [r7, #0x54]
	adds r1, r1, r2
	str r1, [r7, #0x54]
	movs r2, #0
	ldrsh r1, [r3, r2]
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r1, r2, #4
	subs r1, r1, r2
	asrs r1, r1, #5
	adds r0, r0, r1
	str r0, [r7, #0x58]
	ldr r0, _0803DE0C @ =0x00000286
	mov r1, sb
	strh r0, [r1, #0xa]
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r1, r7, r2
	movs r0, #2
	strb r0, [r1]
	ldr r3, _0803DE10 @ =0x00000169
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_803DB1C
	movs r0, #0x80
	adds r0, r0, r7
	mov sb, r0
	ldr r0, _0803DE14 @ =0x00000281
	mov r1, sb
	strh r0, [r1, #0xa]
	adds r0, r7, #0
	adds r0, #0xa0
	movs r1, #1
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0xa1
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r2]
	movs r2, #0xc2
	ldr r0, _0803DE18 @ =0x00000282
	strh r0, [r2, r7]
	adds r0, r7, #0
	adds r0, #0xd8
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0xd9
	movs r3, #1
	rsbs r3, r3, #0
	adds r7, r3, #0
	adds r0, r3, #0
	strb r0, [r1]
	ldr r1, _0803DE1C @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0803DE20 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0803DE34
	ldr r0, _0803DE24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803DE34
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _0803DE28 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0803DE2C
	strb r7, [r1]
	b _0803DE2E
	.align 2, 0
_0803DE08: .4byte gSineTable
_0803DE0C: .4byte 0x00000286
_0803DE10: .4byte 0x00000169
_0803DE14: .4byte 0x00000281
_0803DE18: .4byte 0x00000282
_0803DE1C: .4byte gUnknown_03005450
_0803DE20: .4byte 0x0000C350
_0803DE24: .4byte gGameMode
_0803DE28: .4byte gUnknown_03005448
_0803DE2C:
	strb r0, [r1]
_0803DE2E:
	ldr r1, _0803DE48 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0803DE34:
	ldr r0, _0803DE4C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803DF24
	ldr r1, _0803DE48 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
	b _0803DF24
	.align 2, 0
_0803DE48: .4byte gUnknown_030054A8
_0803DE4C: .4byte gCurrentLevel
_0803DE50:
	ldr r0, [r7, #0x68]
	cmp r0, #0
	bne _0803DF20
	ldr r0, [r7]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	subs r6, #8
	lsls r6, r6, #8
	ldr r0, [r7, #4]
	adds r1, r4, #0
	bl Div
	adds r5, r0, #0
	subs r5, #0x16
	lsls r5, r5, #8
	ldr r3, _0803DEFC @ =gSineTable
	movs r0, #0x60
	adds r0, r0, r7
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r4, r1, r4
	lsls r4, r4, #1
	adds r4, r4, r3
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r2, #0x32
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r6, r6, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r5, r5, r0
	ldr r0, _0803DF00 @ =0x00000286
	mov r1, sb
	strh r0, [r1, #0xa]
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r1, r7, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, _0803DF04 @ =0x00000169
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xc
	str r0, [r7, #0x68]
	ldr r0, _0803DF08 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803DF0C @ =sub_803D088
	str r0, [r1, #8]
	movs r0, #0xf1
	bl m4aSongNumStart
	mov r0, r8
	ldrh r3, [r0]
	movs r0, #0x40
	str r0, [sp]
	ldr r4, _0803DF10 @ =gUnknown_080D7B13
	ldr r2, _0803DF14 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803DF18 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803DF1C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xf
	ands r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_803E7D4
	b _0803DF24
	.align 2, 0
_0803DEFC: .4byte gSineTable
_0803DF00: .4byte 0x00000286
_0803DF04: .4byte 0x00000169
_0803DF08: .4byte gCurTask
_0803DF0C: .4byte sub_803D088
_0803DF10: .4byte gUnknown_080D7B13
_0803DF14: .4byte gUnknown_030053B8
_0803DF18: .4byte 0x00196225
_0803DF1C: .4byte 0x3C6EF35F
_0803DF20:
	subs r0, #1
	str r0, [r7, #0x68]
_0803DF24:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803DF34
sub_803DF34: @ 0x0803DF34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r0, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	bl Div
	subs r0, #8
	lsls r7, r0, #8
	ldr r0, _0803DFC4 @ =gSineTable
	mov sl, r0
	mov r5, r8
	adds r5, #0x60
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r6, r7, r0
	ldr r3, _0803DFC8 @ =gPlayer
	mov sb, r3
	ldr r0, [r3, #8]
	subs r7, r6, r0
	asrs r7, r7, #8
	mov r1, r8
	ldr r0, [r1, #4]
	adds r1, r4, #0
	bl Div
	subs r0, #0x16
	lsls r2, r0, #8
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r5, r2, r0
	mov r1, sb
	ldr r0, [r1, #0xc]
	subs r2, r5, r0
	asrs r2, r2, #8
	adds r1, r2, #0
	muls r1, r2, r1
	adds r0, r7, #0
	muls r0, r7, r0
	adds r4, r1, r0
	movs r7, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80122DC
	mov r0, r8
	adds r0, #0x78
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803DFCC
	movs r0, #0
	b _0803E0C4
	.align 2, 0
_0803DFC4: .4byte gSineTable
_0803DFC8: .4byte gPlayer
_0803DFCC:
	ldr r0, _0803DFFC @ =0x00000257
	cmp r4, r0
	bgt _0803E042
	mov r0, sb
	adds r0, #0x90
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0xc
	mov r3, sb
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803DFF2
	ldr r1, [r2, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803E000
_0803DFF2:
	mov r0, sb
	bl sub_800CBA4
	movs r0, #0
	b _0803E0C4
	.align 2, 0
_0803DFFC: .4byte 0x00000257
_0803E000:
	mov r0, r8
	adds r0, #0x71
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _0803E010
	subs r0, r1, #1
	strb r0, [r4]
_0803E010:
	mov r0, r8
	adds r0, #0x70
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803E026
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0803E02C
_0803E026:
	movs r0, #0xeb
	bl m4aSongNumStart
_0803E02C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803E034
	movs r7, #1
_0803E034:
	ldr r0, _0803E098 @ =gPlayer
	bl sub_800CB18
	mov r1, r8
	adds r1, #0x78
	movs r0, #0x1e
	strb r0, [r1]
_0803E042:
	ldr r0, _0803E09C @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _0803E0C2
	ldr r1, [r2, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803E0C2
	ldr r0, [r2]
	subs r6, r6, r0
	asrs r6, r6, #8
	ldr r0, [r2, #4]
	subs r5, r5, r0
	asrs r5, r5, #8
	adds r1, r5, #0
	muls r1, r5, r1
	adds r0, r6, #0
	muls r0, r6, r0
	adds r4, r1, r0
	ldr r0, _0803E0A0 @ =0x00000383
	cmp r4, r0
	bgt _0803E0C2
	mov r0, r8
	adds r0, #0x71
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _0803E080
	subs r0, r1, #1
	strb r0, [r4]
_0803E080:
	mov r0, r8
	adds r0, #0x70
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803E0A4
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0803E0AA
	.align 2, 0
_0803E098: .4byte gPlayer
_0803E09C: .4byte gUnknown_030056A4
_0803E0A0: .4byte 0x00000383
_0803E0A4:
	movs r0, #0xeb
	bl m4aSongNumStart
_0803E0AA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803E0B2
	movs r7, #1
_0803E0B2:
	ldr r0, _0803E0D4 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
	mov r1, r8
	adds r1, #0x78
	movs r0, #0x1e
	strb r0, [r1]
_0803E0C2:
	adds r0, r7, #0
_0803E0C4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E0D4: .4byte gUnknown_03005498

	thumb_func_start sub_803E0D8
sub_803E0D8: @ 0x0803E0D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r4, #0
	adds r7, #0x80
	movs r0, #0
	mov r8, r0
	adds r0, r4, #0
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E0FA
	movs r0, #1
	b _0803E202
_0803E0FA:
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	str r6, [sp]
	adds r0, r7, #0
	movs r3, #1
	bl sub_800CA20
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	str r6, [sp]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C320
	adds r3, r0, #0
	cmp r3, #1
	bne _0803E17A
	adds r0, r4, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E168
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r2, r4, r1
	adds r1, r4, #0
	adds r1, #0x73
	movs r0, #0x1e
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	bne _0803E15C
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r3, [r0]
	ldr r0, _0803E164 @ =0x000001A5
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
_0803E15C:
	adds r0, r6, #0
	bl sub_800CBA4
	b _0803E1C6
	.align 2, 0
_0803E164: .4byte 0x000001A5
_0803E168:
	adds r0, r4, #0
	bl sub_803D88C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r5, r4, #0
	adds r5, #0x72
	b _0803E1C6
_0803E17A:
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	str r6, [sp]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	adds r5, r4, #0
	adds r5, #0x72
	cmp r3, #1
	bne _0803E1C6
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r2, r4, r1
	adds r1, r4, #0
	adds r1, #0x73
	movs r0, #0x1e
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803E1C0
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r3, [r0]
	ldr r0, _0803E210 @ =0x000001A5
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
_0803E1C0:
	adds r0, r6, #0
	bl sub_800CBA4
_0803E1C6:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl sub_80122DC
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803E200
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	str r6, [sp]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _0803E200
	adds r0, r4, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E200
	adds r0, r4, #0
	bl sub_803D88C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0803E200:
	mov r0, r8
_0803E202:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E210: .4byte 0x000001A5

	thumb_func_start sub_803E214
sub_803E214: @ 0x0803E214
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	mov ip, r0
	ldr r0, _0803E2BC @ =gUnknown_03005590
	ldr r7, [r0]
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0803E2DC
	mov r0, ip
	ldr r1, [r0, #0x68]
	ldr r0, _0803E2C0 @ =0x00000103
	subs r0, r0, r1
	lsrs r0, r0, #5
	movs r1, #0x76
	add r1, ip
	mov sb, r1
	ldrb r2, [r1]
	cmp r0, r2
	bhi _0803E244
	b _0803E3BC
_0803E244:
	ldr r3, _0803E2C4 @ =gUnknown_030053B8
	mov r8, r3
	ldr r0, [r3]
	ldr r6, _0803E2C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r4, _0803E2CC @ =0x3C6EF35F
	adds r2, r2, r4
	mov r0, ip
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r5, _0803E2D0 @ =gCamera
	ldr r0, [r5]
	subs r1, r1, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	movs r3, #0x3f
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x34
	str r1, [sp, #0x14]
	muls r2, r6, r2
	adds r2, r2, r4
	mov r1, r8
	str r2, [r1]
	mov r0, ip
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r0, [r5, #4]
	subs r1, r1, r0
	movs r0, #0x34
	muls r0, r2, r0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x30
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r1, sp
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _0803E2D4 @ =0x06012980
	str r0, [sp]
	ldr r0, _0803E2D8 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	mov r1, sb
	bl sub_8039B54
	b _0803E3BC
	.align 2, 0
_0803E2BC: .4byte gUnknown_03005590
_0803E2C0: .4byte 0x00000103
_0803E2C4: .4byte gUnknown_030053B8
_0803E2C8: .4byte 0x00196225
_0803E2CC: .4byte 0x3C6EF35F
_0803E2D0: .4byte gCamera
_0803E2D4: .4byte 0x06012980
_0803E2D8: .4byte 0x0000026B
_0803E2DC:
	ldr r1, _0803E3CC @ =gUnknown_030053B8
	mov r8, r1
	ldr r0, [r1]
	ldr r7, _0803E3D0 @ =0x00196225
	muls r0, r7, r0
	ldr r6, _0803E3D4 @ =0x3C6EF35F
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #5
	ands r2, r0
	cmp r2, #0
	bne _0803E3BC
	mov r3, ip
	ldr r1, [r3, #0x68]
	ldr r0, _0803E3D8 @ =0x00000103
	subs r0, r0, r1
	lsrs r0, r0, #5
	movs r1, #0x74
	add r1, ip
	mov sb, r1
	ldrb r3, [r1]
	cmp r0, r3
	bls _0803E3BC
	mov r5, ip
	adds r5, #0x75
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _0803E31E
	strb r2, [r5]
_0803E31E:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	mov r3, ip
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _0803E3DC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r4, #0x3f
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #0x20
	str r1, [sp, #0x14]
	muls r2, r7, r2
	adds r2, r2, r6
	mov r0, ip
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #0x20
	str r1, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, r8
	str r0, [r1]
	ldr r1, _0803E3E0 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r2, _0803E3E4 @ =gUnknown_080D79D0
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0803E3E8 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r3, #8]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r3, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	mov r1, sb
	bl sub_8039B54
_0803E3BC:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E3CC: .4byte gUnknown_030053B8
_0803E3D0: .4byte 0x00196225
_0803E3D4: .4byte 0x3C6EF35F
_0803E3D8: .4byte 0x00000103
_0803E3DC: .4byte gCamera
_0803E3E0: .4byte 0x000003FF
_0803E3E4: .4byte gUnknown_080D79D0
_0803E3E8: .4byte 0x06010000

	thumb_func_start sub_803E3EC
sub_803E3EC: @ 0x0803E3EC
	ldr r2, _0803E438 @ =gUnknown_03005B4C
	ldr r2, [r2]
	ldrh r3, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r3, r3, r2
	ldr r2, [r3]
	adds r2, r2, r0
	str r2, [r3]
	ldr r2, [r3, #4]
	adds r2, r2, r1
	str r2, [r3, #4]
	ldr r2, [r3, #0xc]
	adds r2, r2, r0
	str r2, [r3, #0xc]
	ldr r2, [r3, #0x10]
	adds r2, r2, r1
	str r2, [r3, #0x10]
	ldr r2, [r3, #0x14]
	adds r2, r2, r0
	str r2, [r3, #0x14]
	ldr r2, [r3, #0x18]
	adds r2, r2, r1
	str r2, [r3, #0x18]
	ldr r2, [r3, #0x1c]
	adds r2, r2, r0
	str r2, [r3, #0x1c]
	ldr r2, [r3, #0x20]
	adds r2, r2, r1
	str r2, [r3, #0x20]
	ldr r2, [r3, #0x54]
	adds r2, r2, r0
	str r2, [r3, #0x54]
	ldr r0, [r3, #0x58]
	adds r0, r0, r1
	str r0, [r3, #0x58]
	bx lr
	.align 2, 0
_0803E438: .4byte gUnknown_03005B4C

	thumb_func_start sub_803E43C
sub_803E43C: @ 0x0803E43C
	push {r4, r5, lr}
	ldr r5, _0803E48C @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r4, #0
	bl sub_803E63C
	adds r0, r4, #0
	bl sub_803E6A8
	adds r0, r4, #0
	bl sub_803DA8C
	adds r0, r4, #0
	bl sub_803D430
	ldr r0, [r4, #0x7c]
	adds r0, #1
	str r0, [r4, #0x7c]
	cmp r0, #0x59
	bls _0803E486
	movs r0, #0
	str r0, [r4, #0x7c]
	ldr r1, [r5]
	ldr r0, _0803E490 @ =sub_803E494
	str r0, [r1, #8]
_0803E486:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E48C: .4byte gCurTask
_0803E490: .4byte sub_803E494

	thumb_func_start sub_803E494
sub_803E494: @ 0x0803E494
	push {r4, r5, r6, lr}
	ldr r6, _0803E508 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	movs r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	adds r0, r5, #0
	bl sub_803E63C
	adds r0, r5, #0
	bl sub_803E6A8
	ldr r2, _0803E50C @ =gUnknown_080D7B68
	ldr r0, _0803E510 @ =IWRAM_START + 0x71
	adds r4, r4, r0
	ldrb r0, [r4]
	movs r1, #0
	cmp r0, #0
	bne _0803E4C8
	movs r1, #4
_0803E4C8:
	adds r0, r1, r2
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_803DA8C
	adds r0, r5, #0
	bl sub_803D430
	adds r0, r5, #0
	bl sub_803D978
	ldr r1, _0803E514 @ =gPlayer
	adds r0, r5, #0
	bl sub_803E0D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E500
	bl sub_802A018
	ldr r0, _0803E518 @ =0x00000103
	str r0, [r5, #0x68]
	ldr r1, [r6]
	ldr r0, _0803E51C @ =sub_803E520
	str r0, [r1, #8]
_0803E500:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E508: .4byte gCurTask
_0803E50C: .4byte gUnknown_080D7B68
_0803E510: .4byte IWRAM_START + 0x71
_0803E514: .4byte gPlayer
_0803E518: .4byte 0x00000103
_0803E51C: .4byte sub_803E520

	thumb_func_start sub_803E520
sub_803E520: @ 0x0803E520
	push {r4, r5, lr}
	ldr r5, _0803E598 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r4, #0
	bl sub_803E63C
	adds r0, r4, #0
	bl sub_803DA8C
	adds r0, r4, #0
	bl sub_803D430
	adds r0, r4, #0
	bl sub_803D978
	adds r0, r4, #0
	bl sub_803E214
	ldr r2, _0803E59C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803E5A0 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803E5A4 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0803E5A8 @ =gUnknown_03005590
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x15
	bl Mod
	cmp r0, #0
	bne _0803E57A
	movs r0, #0x90
	bl m4aSongNumStart
_0803E57A:
	ldr r0, [r4, #0x68]
	subs r0, #1
	str r0, [r4, #0x68]
	cmp r0, #0
	bne _0803E590
	adds r0, r4, #0
	bl sub_803D368
	ldr r1, [r5]
	ldr r0, _0803E5AC @ =sub_803D2C0
	str r0, [r1, #8]
_0803E590:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E598: .4byte gCurTask
_0803E59C: .4byte gUnknown_030053B8
_0803E5A0: .4byte 0x00196225
_0803E5A4: .4byte 0x3C6EF35F
_0803E5A8: .4byte gUnknown_03005590
_0803E5AC: .4byte sub_803D2C0

	thumb_func_start sub_803E5B0
sub_803E5B0: @ 0x0803E5B0
	push {r4, r5, r6, lr}
	ldr r6, _0803E624 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r1, _0803E628 @ =gCamera
	ldr r1, [r1]
	subs r5, r0, r1
	adds r0, r4, #0
	bl sub_803D754
	adds r0, r4, #0
	movs r1, #0
	bl sub_803D640
	adds r0, r4, #0
	bl sub_803D978
	adds r0, r4, #0
	bl sub_803E214
	ldr r2, _0803E62C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0803E630 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803E634 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0803E638 @ =gUnknown_03005590
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0803E606
	movs r0, #0x90
	bl m4aSongNumStart
_0803E606:
	movs r0, #0xc8
	rsbs r0, r0, #0
	cmp r5, r0
	bge _0803E61E
	adds r0, #0xb4
	movs r1, #0x8c
	movs r2, #1
	bl sub_802EF68
	ldr r0, [r6]
	bl TaskDestroy
_0803E61E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E624: .4byte gCurTask
_0803E628: .4byte gCamera
_0803E62C: .4byte gUnknown_030053B8
_0803E630: .4byte 0x00196225
_0803E634: .4byte 0x3C6EF35F
_0803E638: .4byte gUnknown_03005590

	thumb_func_start sub_803E63C
sub_803E63C: @ 0x0803E63C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r5, #0
_0803E646:
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r0, _0803E69C @ =gUnknown_080D7B10
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r0, r5, #3
	adds r4, r6, #0
	adds r4, #0x10
	adds r4, r4, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	adds r0, #0x12
	adds r7, r7, r0
	ldr r2, _0803E6A0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803E646
	adds r0, r7, #0
	movs r1, #3
	bl Div
	lsls r0, r0, #8
	ldr r1, _0803E6A4 @ =0xFFFFEE00
	adds r0, r0, r1
	str r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E69C: .4byte gUnknown_080D7B10
_0803E6A0: .4byte sub_801EC3C
_0803E6A4: .4byte 0xFFFFEE00

	thumb_func_start sub_803E6A8
sub_803E6A8: @ 0x0803E6A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x64]
	lsls r1, r0, #2
	adds r2, r1, r0
	ldr r3, _0803E6E8 @ =0x000003FF
	adds r1, r3, #0
	ands r2, r1
	adds r0, #1
	str r0, [r4, #0x64]
	adds r0, r4, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E6E2
	ldr r1, _0803E6EC @ =gSineTable
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xc0
	bl Div
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
_0803E6E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E6E8: .4byte 0x000003FF
_0803E6EC: .4byte gSineTable

	thumb_func_start sub_803E6F0
sub_803E6F0: @ 0x0803E6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	bl sub_803DB1C
	ldr r0, [r7, #0x68]
	cmp r0, #0
	bne _0803E750
	ldr r1, [r7]
	ldr r0, _0803E738 @ =0xFFFFF800
	adds r1, r1, r0
	ldr r2, [r7, #4]
	ldr r4, _0803E73C @ =0xFFFFEA00
	adds r2, r2, r4
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #8
	str r0, [sp]
	ldr r6, _0803E740 @ =gUnknown_080D7B13
	ldr r5, _0803E744 @ =gUnknown_030053B8
	ldr r4, [r5]
	ldr r0, _0803E748 @ =0x00196225
	muls r0, r4, r0
	ldr r4, _0803E74C @ =0x3C6EF35F
	adds r0, r0, r4
	str r0, [r5]
	movs r4, #0xf
	ands r0, r4
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_803E7D4
	movs r0, #0x71
	b _0803E75C
	.align 2, 0
_0803E738: .4byte 0xFFFFF800
_0803E73C: .4byte 0xFFFFEA00
_0803E740: .4byte gUnknown_080D7B13
_0803E744: .4byte gUnknown_030053B8
_0803E748: .4byte 0x00196225
_0803E74C: .4byte 0x3C6EF35F
_0803E750:
	cmp r0, #0x96
	bls _0803E758
	movs r0, #0x96
	str r0, [r7, #0x68]
_0803E758:
	ldr r0, [r7, #0x68]
	subs r0, #1
_0803E75C:
	str r0, [r7, #0x68]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803E768
sub_803E768: @ 0x0803E768
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #0x6c]
	bl VramFree
	ldr r0, _0803E790 @ =IWRAM_START + 0x84
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _0803E794 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E790: .4byte IWRAM_START + 0x84
_0803E794: .4byte gUnknown_03005B4C

	thumb_func_start sub_803E798
sub_803E798: @ 0x0803E798
	push {lr}
	adds r2, r0, #0
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r1, r2, #0
	adds r1, #0x73
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E7CA
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	subs r0, #0xe4
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803E7D0 @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803E7CA:
	pop {r0}
	bx r0
	.align 2, 0
_0803E7D0: .4byte 0x000001A5

	thumb_func_start sub_803E7D4
sub_803E7D4: @ 0x0803E7D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0803E864 @ =sub_803E8DC
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r1, #0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r1, _0803E868 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	mov r2, r8
	subs r0, r2, r0
	str r0, [r7]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, sb
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, _0803E86C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r5, r0
	asrs r0, r0, #0xe
	strh r0, [r7, #8]
	lsls r0, r4, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xd
	strh r0, [r7, #0xa]
	strb r6, [r7, #0xc]
	mov r2, sl
	str r2, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bls _0803E870
	movs r0, #0xf5
	bl m4aSongNumStart
	b _0803E876
	.align 2, 0
_0803E864: .4byte sub_803E8DC
_0803E868: .4byte gCamera
_0803E86C: .4byte gSineTable
_0803E870:
	movs r0, #0xf4
	bl m4aSongNumStart
_0803E876:
	adds r1, r7, #0
	adds r1, #0x14
	mov r4, r8
	asrs r0, r4, #8
	movs r3, #0
	movs r2, #0
	strh r0, [r1, #0x16]
	mov r4, sb
	asrs r0, r4, #8
	strh r0, [r1, #0x18]
	mov r4, sl
	ldr r0, [r4, #0x6c]
	str r0, [r1, #4]
	ldr r0, _0803E8D8 @ =0x00000287
	strh r0, [r1, #0xa]
	adds r0, r7, #0
	adds r0, #0x34
	strb r3, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	strh r2, [r1, #0x14]
	strh r2, [r1, #0x1c]
	adds r2, r7, #0
	adds r2, #0x35
	movs r0, #0xff
	strb r0, [r2]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E8D8: .4byte 0x00000287

	thumb_func_start sub_803E8DC
sub_803E8DC: @ 0x0803E8DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r0, _0803E920 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0x14
	adds r6, r1, r0
	ldrh r0, [r7, #0xa]
	adds r0, #0x20
	strh r0, [r7, #0xa]
	ldr r0, _0803E924 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803E92C
	movs r2, #8
	ldrsh r1, [r7, r2]
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	movs r0, #0xa
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
	ldr r4, _0803E928 @ =gCamera
	b _0803E950
	.align 2, 0
_0803E920: .4byte gCurTask
_0803E924: .4byte gPlayer
_0803E928: .4byte gCamera
_0803E92C:
	movs r2, #8
	ldrsh r1, [r7, r2]
	ldr r2, _0803EA5C @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	subs r1, r1, r0
	ldr r0, [r7]
	subs r0, r0, r1
	str r0, [r7]
	movs r0, #0xa
	ldrsh r1, [r7, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
	adds r4, r2, #0
_0803E950:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	adds r2, r4, #0
	ldr r1, [r2, #4]
	adds r1, #0xc
	adds r0, r0, r1
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r2, [r2]
	adds r1, r1, r2
	add r2, sp, #8
	str r2, [sp]
	ldr r2, _0803EA60 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0803E998
	lsls r1, r0, #8
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
	movs r2, #0xa
	ldrsh r0, [r7, r2]
	lsls r0, r0, #3
	rsbs r0, r0, #0
	movs r1, #0xa
	bl Div
	strh r0, [r7, #0xa]
_0803E998:
	ldr r0, [r7]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldr r0, [r7, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EA00
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	ldr r0, [r4, #4]
	adds r2, r2, r0
	ldr r0, _0803EA64 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r5, r0, #0
	cmp r5, #1
	bne _0803EA00
	ldr r2, [r7, #0x10]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E9FE
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r3, r2, #0
	adds r3, #0x73
	movs r0, #0x1e
	strb r0, [r3]
	ldr r0, _0803EA68 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r2, r1
	strb r5, [r0]
	ldr r0, _0803EA6C @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803E9FE:
	strb r5, [r7, #0xc]
_0803EA00:
	ldrb r0, [r7, #0xc]
	subs r0, #1
	strb r0, [r7, #0xc]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EA16
	ldr r0, [r7, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EADC
_0803EA16:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0xf
	ble _0803EA7C
	movs r0, #0xf2
	bl m4aSongNumStart
	ldr r3, [r6, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r3, r3, r2
	str r3, [sp, #0xc]
	ldr r5, _0803EA70 @ =0xFFFF0000
	ldr r0, [sp, #0x10]
	ands r5, r0
	ldr r0, _0803EA74 @ =0x0000027E
	orrs r5, r0
	ldr r0, _0803EA78 @ =0xFF00FFFF
	ands r5, r0
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r4, _0803EA5C @ =gCamera
	ldr r2, [r4]
	adds r1, r1, r2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	ldr r4, [r4, #4]
	adds r2, r2, r4
	str r5, [sp]
	bl sub_803EAF4
	b _0803EAB8
	.align 2, 0
_0803EA5C: .4byte gCamera
_0803EA60: .4byte sub_801EE64
_0803EA64: .4byte gPlayer
_0803EA68: .4byte 0x00000275
_0803EA6C: .4byte 0x000001A5
_0803EA70: .4byte 0xFFFF0000
_0803EA74: .4byte 0x0000027E
_0803EA78: .4byte 0xFF00FFFF
_0803EA7C:
	movs r0, #0xf3
	bl m4aSongNumStart
	ldr r3, [r6, #4]
	movs r1, #0xe8
	lsls r1, r1, #3
	adds r3, r3, r1
	str r3, [sp, #0xc]
	ldr r5, _0803EAC4 @ =0xFFFF0000
	ldr r2, [sp, #0x10]
	ands r5, r2
	ldr r0, _0803EAC8 @ =0x0000027F
	orrs r5, r0
	ldr r0, _0803EACC @ =0xFF00FFFF
	ands r5, r0
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r6, _0803EAD0 @ =gCamera
	ldr r2, [r6]
	adds r1, r1, r2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	adds r4, #0xf
	adds r2, r2, r4
	ldr r4, [r6, #4]
	adds r2, r2, r4
	str r5, [sp]
	bl sub_803EAF4
_0803EAB8:
	ldr r0, _0803EAD4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803EAD8 @ =sub_803EC84
	str r0, [r1, #8]
	b _0803EAE8
	.align 2, 0
_0803EAC4: .4byte 0xFFFF0000
_0803EAC8: .4byte 0x0000027F
_0803EACC: .4byte 0xFF00FFFF
_0803EAD0: .4byte gCamera
_0803EAD4: .4byte gCurTask
_0803EAD8: .4byte sub_803EC84
_0803EADC:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803EAE8:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803EAF4
sub_803EAF4: @ 0x0803EAF4
	sub sp, #4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov r8, r1
	mov sb, r2
	str r3, [sp, #0x28]
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r0, _0803EBA0 @ =sub_803EBBC
	movs r2, #0xc4
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0803EBA4 @ =gCamera
	ldr r0, [r2]
	mov r7, r8
	subs r0, r7, r0
	str r0, [r1]
	ldr r0, [r2, #4]
	mov r2, sb
	subs r0, r2, r0
	str r0, [r1, #4]
	movs r7, #0
	mov sl, r7
	strh r6, [r1, #8]
	strh r6, [r1, #0xa]
	ldr r0, [sp, #4]
	str r0, [r1, #0x10]
	ldr r2, _0803EBA8 @ =IWRAM_START + 0x14
	adds r1, r3, r2
	mov r7, r8
	strh r7, [r1, #0x16]
	mov r0, sb
	strh r0, [r1, #0x18]
	str r4, [r1, #4]
	strh r5, [r1, #0xa]
	lsrs r2, r5, #0x10
	ldr r4, _0803EBAC @ =IWRAM_START + 0x34
	adds r0, r3, r4
	strb r2, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r7, _0803EBB0 @ =IWRAM_START + 0x35
	adds r2, r3, r7
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0803EBB4 @ =IWRAM_START + 0x36
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0803EBB8 @ =IWRAM_START + 0x39
	adds r3, r3, r2
	mov r4, sl
	strb r4, [r3]
	subs r0, #0x11
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0
_0803EBA0: .4byte sub_803EBBC
_0803EBA4: .4byte gCamera
_0803EBA8: .4byte IWRAM_START + 0x14
_0803EBAC: .4byte IWRAM_START + 0x34
_0803EBB0: .4byte IWRAM_START + 0x35
_0803EBB4: .4byte IWRAM_START + 0x36
_0803EBB8: .4byte IWRAM_START + 0x39

	thumb_func_start sub_803EBBC
sub_803EBBC: @ 0x0803EBBC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803EC6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r6, _0803EC70 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803EBEE
	ldr r2, _0803EC74 @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2, #0x38]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #4]
_0803EBEE:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EC4C
	ldr r3, _0803EC74 @ =gCamera
	ldr r1, [r4]
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r6, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r6, r0, #0
	cmp r6, #1
	bne _0803EC4C
	ldr r2, [r4, #0x10]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EC4C
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r3, r2, #0
	adds r3, #0x73
	movs r0, #0x1e
	strb r0, [r3]
	ldr r0, _0803EC78 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r2, r1
	strb r6, [r0]
	ldr r0, _0803EC7C @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803EC4C:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0803EC5E
	ldr r0, _0803EC6C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803EC80 @ =sub_803EC84
	str r0, [r1, #8]
_0803EC5E:
	adds r0, r5, #0
	bl sub_80051E8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803EC6C: .4byte gCurTask
_0803EC70: .4byte gPlayer
_0803EC74: .4byte gCamera
_0803EC78: .4byte 0x00000275
_0803EC7C: .4byte 0x000001A5
_0803EC80: .4byte sub_803EC84

	thumb_func_start sub_803EC84
sub_803EC84: @ 0x0803EC84
	push {lr}
	ldr r0, _0803EC94 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0803EC94: .4byte gCurTask

	thumb_func_start sub_803EC98
sub_803EC98: @ 0x0803EC98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	ldr r2, _0803ECFC @ =gPlayer
	movs r0, #0
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _0803ED00 @ =gUnknown_030053B8
	ldr r0, _0803ED04 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803ED08 @ =sub_80410E0
	movs r1, #0xe7
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803ED0C @ =sub_8041028
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0803ED10 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ED1C
	ldr r0, _0803ED14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803ED1C
	ldr r0, _0803ED18 @ =IWRAM_START + 0x32
	adds r1, r1, r0
	movs r0, #6
	b _0803ED22
	.align 2, 0
_0803ECFC: .4byte gPlayer
_0803ED00: .4byte gUnknown_030053B8
_0803ED04: .4byte gUnknown_03005590
_0803ED08: .4byte sub_80410E0
_0803ED0C: .4byte sub_8041028
_0803ED10: .4byte gUnknown_030054EC
_0803ED14: .4byte gGameMode
_0803ED18: .4byte IWRAM_START + 0x32
_0803ED1C:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #8
_0803ED22:
	strb r0, [r1]
	ldr r0, _0803EE80 @ =gCurrentLevel
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r0
	cmp r1, #0x1c
	beq _0803ED32
	b _0803EEB0
_0803ED32:
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	beq _0803ED48
	b _0803EEB0
_0803ED48:
	ldr r0, _0803EE84 @ =0x00359200
	str r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #8
	str r1, [r6, #4]
	movs r5, #0
	movs r2, #0x3c
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x40
	adds r3, r3, r6
	mov r8, r3
	adds r7, r6, #0
	adds r7, #0x33
	str r7, [sp, #0x3c]
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0x40]
	adds r3, r6, #0
	adds r3, #0x35
	str r3, [sp, #0x44]
	adds r7, #3
	str r7, [sp, #0x48]
	movs r2, #0xb4
	adds r2, r2, r6
	mov ip, r2
	adds r3, #0x8b
	str r3, [sp, #8]
	adds r7, #0xaa
	str r7, [sp, #0xc]
	adds r2, r6, #0
	adds r2, #0xe1
	str r2, [sp, #0x10]
	adds r3, #0x22
	str r3, [sp, #0x14]
	adds r7, #5
	str r7, [sp, #0x18]
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r2, r6, r2
	str r2, [sp, #0x2c]
	ldr r3, _0803EE88 @ =0x00000389
	adds r3, r6, r3
	str r3, [sp, #0x30]
	ldr r7, _0803EE8C @ =0x0000038A
	adds r7, r6, r7
	str r7, [sp, #0x34]
	ldr r2, _0803EE90 @ =0x0000038D
	adds r2, r6, r2
	str r2, [sp, #0x38]
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r3, r6, r3
	str r3, [sp, #0x1c]
	ldr r7, _0803EE94 @ =0x00000359
	adds r7, r6, r7
	str r7, [sp, #0x20]
	ldr r2, _0803EE98 @ =0x0000035A
	adds r2, r6, r2
	str r2, [sp, #0x24]
	ldr r3, _0803EE9C @ =0x0000035D
	adds r3, r6, r3
	str r3, [sp, #0x28]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r7, r6, r7
	str r7, [sp, #0x4c]
	ldr r2, _0803EEA0 @ =0x000002C9
	adds r2, r6, r2
	str r2, [sp, #0x50]
	ldr r3, _0803EEA4 @ =0x000002CA
	adds r3, r6, r3
	str r3, [sp, #0x54]
	ldr r7, _0803EEA8 @ =0x000002CD
	adds r7, r6, r7
	str r7, [sp, #0x58]
	adds r3, r6, #0
	adds r3, #0xc
	adds r7, r0, #0
	adds r2, r6, #0
	adds r2, #0x10
	adds r4, r1, #0
_0803EDEC:
	lsls r1, r5, #3
	adds r0, r3, r1
	str r7, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EDEC
	movs r5, #0
	movs r3, #0
	movs r4, #0
_0803EE06:
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	mov r0, sb
	adds r2, r0, r1
	ldr r0, _0803EE84 @ =0x00359200
	str r0, [r2]
	mov r7, r8
	adds r2, r7, r1
	lsls r0, r5, #1
	ldr r7, _0803EEAC @ =gUnknown_080D7BE2
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r7, #0xaa
	lsls r7, r7, #8
	adds r0, r0, r7
	str r0, [r2]
	adds r2, r6, r1
	adds r0, r2, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4e
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #5
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0803EE64
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_0803EE64:
	adds r0, r2, #0
	adds r0, #0x53
	strb r3, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EE06
	b _0803F038
	.align 2, 0
_0803EE80: .4byte gCurrentLevel
_0803EE84: .4byte 0x00359200
_0803EE88: .4byte 0x00000389
_0803EE8C: .4byte 0x0000038A
_0803EE90: .4byte 0x0000038D
_0803EE94: .4byte 0x00000359
_0803EE98: .4byte 0x0000035A
_0803EE9C: .4byte 0x0000035D
_0803EEA0: .4byte 0x000002C9
_0803EEA4: .4byte 0x000002CA
_0803EEA8: .4byte 0x000002CD
_0803EEAC: .4byte gUnknown_080D7BE2
_0803EEB0:
	movs r0, #0xaa
	lsls r0, r0, #0xa
	str r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #8
	str r1, [r6, #4]
	movs r5, #0
	movs r2, #0x3c
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x40
	adds r3, r3, r6
	mov r8, r3
	adds r7, r6, #0
	adds r7, #0x33
	str r7, [sp, #0x3c]
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0x40]
	adds r3, r6, #0
	adds r3, #0x35
	str r3, [sp, #0x44]
	adds r7, #3
	str r7, [sp, #0x48]
	movs r2, #0xb4
	adds r2, r2, r6
	mov ip, r2
	adds r3, #0x8b
	str r3, [sp, #8]
	adds r7, #0xaa
	str r7, [sp, #0xc]
	adds r2, r6, #0
	adds r2, #0xe1
	str r2, [sp, #0x10]
	adds r3, #0x22
	str r3, [sp, #0x14]
	adds r7, #5
	str r7, [sp, #0x18]
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r2, r6, r2
	str r2, [sp, #0x2c]
	ldr r3, _0803EFDC @ =0x00000389
	adds r3, r6, r3
	str r3, [sp, #0x30]
	ldr r7, _0803EFE0 @ =0x0000038A
	adds r7, r6, r7
	str r7, [sp, #0x34]
	ldr r2, _0803EFE4 @ =0x0000038D
	adds r2, r6, r2
	str r2, [sp, #0x38]
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r3, r6, r3
	str r3, [sp, #0x1c]
	ldr r7, _0803EFE8 @ =0x00000359
	adds r7, r6, r7
	str r7, [sp, #0x20]
	ldr r2, _0803EFEC @ =0x0000035A
	adds r2, r6, r2
	str r2, [sp, #0x24]
	ldr r3, _0803EFF0 @ =0x0000035D
	adds r3, r6, r3
	str r3, [sp, #0x28]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r7, r6, r7
	str r7, [sp, #0x4c]
	ldr r2, _0803EFF4 @ =0x000002C9
	adds r2, r6, r2
	str r2, [sp, #0x50]
	ldr r3, _0803EFF8 @ =0x000002CA
	adds r3, r6, r3
	str r3, [sp, #0x54]
	ldr r7, _0803EFFC @ =0x000002CD
	adds r7, r6, r7
	str r7, [sp, #0x58]
	adds r3, r6, #0
	adds r3, #0xc
	adds r7, r0, #0
	adds r2, r6, #0
	adds r2, #0x10
	adds r4, r1, #0
_0803EF56:
	lsls r1, r5, #3
	adds r0, r3, r1
	str r7, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EF56
	movs r5, #0
	movs r4, #0
	ldr r0, _0803F000 @ =gGameMode
	mov sl, r0
_0803EF72:
	lsls r3, r5, #3
	subs r2, r3, r5
	lsls r2, r2, #2
	mov r7, sb
	adds r1, r7, r2
	movs r0, #0xaa
	lsls r0, r0, #0xa
	str r0, [r1]
	mov r0, r8
	adds r1, r0, r2
	lsls r0, r5, #1
	ldr r7, _0803F004 @ =gUnknown_080D7BE2
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r7, #0xaa
	lsls r7, r7, #8
	adds r0, r0, r7
	str r0, [r1]
	adds r2, r6, r2
	adds r0, r2, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #5
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r7, _0803F008 @ =gUnknown_030054EC
	ldrb r0, [r7]
	cmp r0, #0
	beq _0803F00C
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #2
	beq _0803F00C
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
	b _0803F018
	.align 2, 0
_0803EFDC: .4byte 0x00000389
_0803EFE0: .4byte 0x0000038A
_0803EFE4: .4byte 0x0000038D
_0803EFE8: .4byte 0x00000359
_0803EFEC: .4byte 0x0000035A
_0803EFF0: .4byte 0x0000035D
_0803EFF4: .4byte 0x000002C9
_0803EFF8: .4byte 0x000002CA
_0803EFFC: .4byte 0x000002CD
_0803F000: .4byte gGameMode
_0803F004: .4byte gUnknown_080D7BE2
_0803F008: .4byte gUnknown_030054EC
_0803F00C:
	subs r0, r3, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r0, #0x50
	movs r1, #3
	strb r1, [r0]
_0803F018:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r1, r0, #0
	adds r1, #0x53
	strb r4, [r1]
	subs r1, #2
	strb r4, [r1]
	adds r0, #0x52
	strb r4, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EF72
_0803F038:
	movs r5, #0
	movs r4, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r6, #8]
	strh r4, [r6, #0xa]
	movs r0, #0xf0
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	strh r4, [r6, #0x30]
	ldr r3, [sp, #0x40]
	strb r5, [r3]
	ldr r7, [sp, #0x44]
	strb r5, [r7]
	ldr r0, [sp, #0x48]
	strb r5, [r0]
	movs r0, #0x78
	mov r1, ip
	str r0, [r1]
	movs r0, #8
	bl VramMalloc
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	str r0, [r1]
	ldr r7, [sp, #8]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x78
	bl VramMalloc
	str r0, [r7, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r3, r3, r0
	mov ip, r3
	ldr r1, _0803F37C @ =0x0000028B
	strh r1, [r7, #0xa]
	ldr r1, [sp, #0xc]
	strb r5, [r1]
	movs r2, #0xb8
	lsls r2, r2, #3
	mov r8, r2
	mov r3, r8
	strh r3, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r1, #0xff
	ldr r2, [sp, #0x10]
	strb r1, [r2]
	movs r3, #0x10
	mov sb, r3
	mov r2, sb
	ldr r1, [sp, #0x14]
	strb r2, [r1]
	ldr r3, [sp, #0x18]
	strb r5, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r3, #0xda
	lsls r3, r3, #2
	adds r7, r6, r3
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r3, ip
	str r3, [r7, #4]
	movs r3, #0x88
	lsls r3, r3, #4
	adds r3, r3, r0
	mov ip, r3
	ldr r0, _0803F380 @ =0x0000028A
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x2c]
	strb r5, [r0]
	mov r3, r8
	strh r3, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov sl, r2
	mov r3, sl
	ldr r0, [sp, #0x30]
	strb r3, [r0]
	mov r3, sb
	ldr r0, [sp, #0x34]
	strb r3, [r0]
	ldr r0, [sp, #0x38]
	strb r5, [r0]
	str r2, [r7, #0x28]
	str r1, [r7, #0x10]
	movs r3, #0xce
	lsls r3, r3, #2
	adds r7, r6, r3
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r0, ip
	str r0, [r7, #4]
	movs r0, #0xa5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r3, [sp, #0x1c]
	strb r5, [r3]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r2, #0
	ldr r3, [sp, #0x20]
	strb r0, [r3]
	mov r3, sb
	ldr r0, [sp, #0x24]
	strb r3, [r0]
	ldr r0, [sp, #0x28]
	strb r5, [r0]
	str r2, [r7, #0x28]
	str r1, [r7, #0x10]
	movs r5, #0
	movs r1, #0
	mov r8, r1
	movs r2, #0
_0803F136:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r7, r6, r0
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	ldr r0, _0803F384 @ =gUnknown_080D7BB0
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _0803F388 @ =gUnknown_080D7BD8
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #6
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x5c]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	mov r3, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803F136
	movs r5, #0
	movs r2, #0
	movs r4, #0
	ldr r7, _0803F38C @ =0x0000028F
	mov r8, r7
_0803F1A8:
	lsls r0, r5, #6
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r7, r6, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x1e
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	mov r3, r8
	strh r3, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r2, [sp, #0x5c]
	strb r2, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803F1A8
	movs r5, #0
	movs r2, #0
_0803F206:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r7, #0x92
	lsls r7, r7, #2
	adds r0, r0, r7
	adds r7, r6, r0
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	ldr r0, _0803F390 @ =gUnknown_080D7BC8
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x5c]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	str r1, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _0803F206
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r7, r6, r2
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0803F394 @ =0x00000275
	strh r0, [r7, #0xa]
	ldr r3, [sp, #0x4c]
	strb r5, [r3]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x50]
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x10
	ldr r3, [sp, #0x54]
	strb r0, [r3]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	mov r3, sb
	str r3, [r7, #0x10]
	ldr r2, _0803F398 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803F3BC
	ldr r0, _0803F39C @ =gSelectedCharacter
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	bne _0803F3BC
	ldr r0, _0803F3A0 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803F3BC
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r7, r6, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x1e
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xde
	strh r0, [r7, #0xa]
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r5, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, _0803F3A4 @ =0x000002F9
	adds r1, r6, r2
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803F3A8 @ =0x000002FA
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _0803F3AC @ =0x000002FD
	adds r0, r6, r3
	strb r5, [r0]
	mov r0, sl
	str r0, [r7, #0x28]
	mov r1, sb
	str r1, [r7, #0x10]
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r7, r6, r2
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xa4
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r3, #0xca
	lsls r3, r3, #2
	adds r0, r6, r3
	strb r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, _0803F3B0 @ =0x00000329
	adds r1, r6, r2
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803F3B4 @ =0x0000032A
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _0803F3B8 @ =0x0000032D
	adds r0, r6, r3
	strb r5, [r0]
	mov r0, sl
	str r0, [r7, #0x28]
	mov r1, sb
	str r1, [r7, #0x10]
	b _0803F3CE
	.align 2, 0
_0803F37C: .4byte 0x0000028B
_0803F380: .4byte 0x0000028A
_0803F384: .4byte gUnknown_080D7BB0
_0803F388: .4byte gUnknown_080D7BD8
_0803F38C: .4byte 0x0000028F
_0803F390: .4byte gUnknown_080D7BC8
_0803F394: .4byte 0x00000275
_0803F398: .4byte gCurrentLevel
_0803F39C: .4byte gSelectedCharacter
_0803F3A0: .4byte gLoadedSaveGame
_0803F3A4: .4byte 0x000002F9
_0803F3A8: .4byte 0x000002FA
_0803F3AC: .4byte 0x000002FD
_0803F3B0: .4byte 0x00000329
_0803F3B4: .4byte 0x0000032A
_0803F3B8: .4byte 0x0000032D
_0803F3BC:
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r6, r2
	movs r1, #0
	str r1, [r0]
	movs r3, #0xc3
	lsls r3, r3, #2
	adds r0, r6, r3
	str r1, [r0]
_0803F3CE:
	ldr r0, _0803F3E4 @ =gUnknown_03005B4C
	ldr r7, [sp, #4]
	str r7, [r0]
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F3E4: .4byte gUnknown_03005B4C

	thumb_func_start sub_803F3E8
sub_803F3E8: @ 0x0803F3E8
	push {r4, r5, lr}
	ldr r0, _0803F408 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x33
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F40C
	subs r0, #1
	strb r0, [r1]
	b _0803F416
	.align 2, 0
_0803F408: .4byte gCurTask
_0803F40C:
	movs r0, #0x50
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_804063C
_0803F416:
	adds r0, r4, #0
	bl sub_803FB88
	adds r0, r4, #0
	bl sub_80407A4
	adds r0, r4, #0
	bl sub_8041264
	adds r0, r4, #0
	bl sub_80408C4
	adds r0, r4, #0
	bl sub_8040A00
	adds r0, r4, #0
	bl sub_803F5E0
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F698
	adds r0, r4, #0
	bl sub_8040F14
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r5, [r0]
	cmp r5, #0
	bne _0803F4A4
	bl sub_802A018
	ldr r2, _0803F4AC @ =gPlayer
	ldr r0, [r2, #0x3c]
	cmp r0, #0
	bne _0803F46C
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0803F47C
_0803F46C:
	str r5, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
_0803F47C:
	adds r0, r4, #0
	bl sub_803F4B8
	adds r0, r4, #0
	adds r0, #0x37
	movs r1, #0
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x38
	movs r0, #5
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x39
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0803F4B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803F4B4 @ =sub_8041138
	str r0, [r1, #8]
_0803F4A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F4AC: .4byte gPlayer
_0803F4B0: .4byte gCurTask
_0803F4B4: .4byte sub_8041138

	thumb_func_start sub_803F4B8
sub_803F4B8: @ 0x0803F4B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldr r4, _0803F5C8 @ =gUnknown_080D7BDC
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, ip
	ldr r5, [r2]
	adds r0, r5, r0
	str r0, [r2, #0xc]
	ldr r2, [r2, #4]
	ldr r3, _0803F5CC @ =0xFFFFF400
	adds r6, r2, r3
	mov r7, ip
	str r6, [r7, #0x10]
	movs r0, #0
	mov r8, r0
	movs r3, #0xa0
	lsls r3, r3, #3
	strh r3, [r7, #0x24]
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r7, #0x26]
	movs r7, #2
	ldrsh r0, [r4, r7]
	adds r0, r5, r0
	mov r7, ip
	str r0, [r7, #0x14]
	str r6, [r7, #0x18]
	strh r3, [r7, #0x28]
	strh r1, [r7, #0x2a]
	movs r6, #4
	ldrsh r0, [r4, r6]
	adds r0, r5, r0
	str r0, [r7, #0x1c]
	ldr r7, _0803F5D0 @ =0xFFFFFA00
	adds r2, r2, r7
	mov r0, ip
	str r2, [r0, #0x20]
	strh r3, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, #0x9c
	str r5, [r0]
	mov r1, ip
	adds r1, #0xa0
	mov r2, ip
	ldr r0, [r2, #4]
	str r0, [r1]
	mov r0, ip
	adds r0, #0xa4
	strh r3, [r0]
	adds r1, #6
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	subs r1, #0x16
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	mov r0, ip
	adds r0, #0x98
	strh r3, [r0]
	adds r0, #2
	movs r2, #0xff
	lsls r2, r2, #8
	strh r2, [r0]
	adds r1, #0x14
	mov r4, ip
	ldr r0, [r4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r4, #4]
	ldr r6, _0803F5D4 @ =0xFFFFE600
	adds r0, r0, r6
	str r0, [r1]
	mov r0, ip
	adds r0, #0xb0
	strh r3, [r0]
	adds r0, #2
	mov r7, r8
	strh r7, [r0]
	movs r4, #0
_0803F562:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x3c
	add r0, ip
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #1
	strb r1, [r0, #0x18]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803F562
	movs r0, #0xb7
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	cmp r0, #0
	beq _0803F5BC
	movs r2, #0xb6
	lsls r2, r2, #2
	add r2, ip
	mov r1, ip
	adds r1, #0xb8
	mov r3, ip
	ldr r0, [r3]
	ldr r4, _0803F5D8 @ =0xFFFFD800
	adds r0, r0, r4
	str r0, [r1]
	adds r1, #4
	ldr r0, [r3, #4]
	ldr r6, _0803F5DC @ =0xFFFF9E00
	adds r0, r0, r6
	str r0, [r1]
	movs r0, #0xde
	strh r0, [r2, #0xa]
	movs r1, #0xbe
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	strb r0, [r1]
_0803F5BC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F5C8: .4byte gUnknown_080D7BDC
_0803F5CC: .4byte 0xFFFFF400
_0803F5D0: .4byte 0xFFFFFA00
_0803F5D4: .4byte 0xFFFFE600
_0803F5D8: .4byte 0xFFFFD800
_0803F5DC: .4byte 0xFFFF9E00

	thumb_func_start sub_803F5E0
sub_803F5E0: @ 0x0803F5E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r8, r0
	ldr r0, [r4, #4]
	asrs r7, r0, #8
	ldr r1, _0803F634 @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r6, _0803F638 @ =gPlayer
	str r6, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	str r6, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0803F63C
	adds r0, r4, #0
	bl sub_8040D74
	b _0803F654
	.align 2, 0
_0803F634: .4byte gCamera
_0803F638: .4byte gPlayer
_0803F63C:
	str r6, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _0803F654
	adds r0, r4, #0
	bl sub_80412B4
_0803F654:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, _0803F690 @ =0xFFFFB000
	adds r1, r1, r2
	bl sub_80122DC
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F684
	ldr r0, _0803F694 @ =gPlayer
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _0803F684
	adds r0, r4, #0
	bl sub_8040D74
_0803F684:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F690: .4byte 0xFFFFB000
_0803F694: .4byte gPlayer

	thumb_func_start sub_803F698
sub_803F698: @ 0x0803F698
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0xc0
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r4, _0803F7B8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0x52
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r7, #0
_0803F6F0:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r5, r6, r0
	lsls r2, r7, #3
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	subs r0, #0xe
	strh r0, [r5, #0x18]
	cmp r7, #2
	bne _0803F728
	adds r0, #6
	strh r0, [r5, #0x18]
_0803F728:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0803F6F0
	movs r7, #0
	ldr r1, _0803F7B8 @ =gCamera
	mov r8, r1
_0803F744:
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r6, r0
	lsls r0, r7, #6
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r5, r6, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, _0803F7BC @ =gSineTable
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	cmp r1, #0
	beq _0803F7FE
	ldrb r0, [r4, #0x14]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r5, r6, r2
	cmp r0, #0
	beq _0803F7AA
	movs r0, #0x92
	lsls r0, r0, #2
	adds r5, r6, r0
_0803F7AA:
	cmp r1, #0
	ble _0803F7C4
	movs r3, #0
	ldr r0, [r5, #0x10]
	ldr r1, _0803F7C0 @ =0xFFFFF7FF
	ands r0, r1
	b _0803F7CE
	.align 2, 0
_0803F7B8: .4byte gCamera
_0803F7BC: .4byte gSineTable
_0803F7C0: .4byte 0xFFFFF7FF
_0803F7C4:
	movs r3, #0xff
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
_0803F7CE:
	str r0, [r5, #0x10]
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	adds r2, r2, r1
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0803F7FE:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0803F744
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803F868
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r5, r6, r2
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r4, _0803F874 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	subs r0, #0x10
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	subs r0, #0x28
	strh r0, [r5, #0x16]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0x62
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0803F868:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F874: .4byte gCamera

	thumb_func_start sub_803F878
sub_803F878: @ 0x0803F878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r7, _0803FA7C @ =gCamera
_0803F888:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r5, r6, r0
	lsls r2, r4, #3
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803F888
	movs r0, #0
	mov sl, r0
	adds r4, r6, #0
	adds r4, #0x37
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803F914
	movs r1, #0xce
	lsls r1, r1, #2
	adds r5, r6, r1
	adds r0, r6, #0
	adds r0, #0xa8
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803FA7C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xac
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0803F90E
	movs r2, #1
	mov sl, r2
	mov r3, sl
	strb r3, [r4]
_0803F90E:
	adds r0, r5, #0
	bl sub_80051E8
_0803F914:
	movs r0, #0xda
	lsls r0, r0, #2
	adds r5, r6, r0
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, _0803FA7C @ =gCamera
	mov r8, r1
	ldr r1, [r1]
	subs r0, r0, r1
	movs r4, #0
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	asrs r0, r0, #8
	mov r2, r8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, r6, #0
	adds r5, #0xc0
	ldr r0, _0803FA80 @ =0x00000289
	strh r0, [r5, #0xa]
	adds r0, r6, #0
	adds r0, #0xe0
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0xe1
	movs r0, #0xff
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x90
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r7, r6, #0
	adds r7, #0x94
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x3a
	adds r0, r0, r6
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F9F4
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r5, r6, r1
	ldr r1, [r4]
	asrs r1, r1, #8
	mov r2, r8
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r7]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r0, r0, r2
	subs r0, #0x51
	strh r0, [r5, #0x18]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x31
	bgt _0803F9E8
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3]
	subs r0, r0, r1
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r2, [r3, #4]
	subs r1, r1, r2
	subs r1, #0x4f
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
_0803F9E8:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0803F9F4:
	movs r4, #0
	ldr r7, _0803FA7C @ =gCamera
_0803F9F8:
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #2
	adds r2, #0x3c
	adds r2, r6, r2
	lsls r0, r4, #6
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r0, r0, r3
	adds r5, r6, r0
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803F9F8
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803FA6C
	movs r2, #0xb6
	lsls r2, r2, #2
	adds r5, r6, r2
	adds r0, r6, #0
	adds r0, #0xb8
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803FA7C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xbc
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0803FA6C:
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FA7C: .4byte gCamera
_0803FA80: .4byte 0x00000289

	thumb_func_start sub_803FA84
sub_803FA84: @ 0x0803FA84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0803FB7C @ =gUnknown_03005B4C
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r3]
	adds r0, r0, r5
	str r0, [r3]
	ldr r0, [r3, #4]
	adds r0, r0, r6
	str r0, [r3, #4]
	movs r4, #0
	ldr r0, _0803FB80 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov ip, r0
	ldr r0, _0803FB84 @ =IWRAM_START + 0x10
	adds r7, r1, r0
_0803FAB8:
	lsls r1, r4, #3
	mov r0, ip
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803FAB8
	movs r4, #0
	movs r1, #0x9c
	adds r1, r1, r3
	mov ip, r1
	movs r0, #0xa0
	adds r0, r0, r3
	mov r8, r0
	movs r1, #0x90
	adds r1, r1, r3
	mov sb, r1
	movs r0, #0x94
	adds r0, r0, r3
	mov sl, r0
	adds r1, r3, #0
	adds r1, #0xa8
	str r1, [sp, #4]
	adds r0, r3, #0
	adds r0, #0xac
	str r0, [sp, #8]
	adds r1, #0x10
	str r1, [sp, #0xc]
	adds r0, #0x10
	str r0, [sp]
	adds r7, r3, #0
	adds r7, #0x3c
	adds r3, #0x40
_0803FB0A:
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803FB0A
	mov r1, ip
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, [sp, #8]
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r1, [sp, #0xc]
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, [sp]
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FB7C: .4byte gUnknown_03005B4C
_0803FB80: .4byte IWRAM_START + 0xC
_0803FB84: .4byte IWRAM_START + 0x10

	thumb_func_start sub_803FB88
sub_803FB88: @ 0x0803FB88
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_804124C
	movs r7, #0
	movs r6, #0
_0803FB96:
	lsls r2, r6, #3
	adds r0, r5, #0
	adds r0, #0xc
	adds r3, r0, r2
	ldr r1, _0803FC08 @ =gUnknown_080D7BDC
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r3]
	cmp r6, #0
	bne _0803FBB8
	ldr r0, [r5, #0x10]
	adds r0, #6
	str r0, [r5, #0x10]
_0803FBB8:
	adds r4, r5, #0
	adds r4, #0x10
	adds r4, r4, r2
	ldr r1, [r4]
	adds r7, r7, r1
	asrs r0, r1, #8
	subs r0, #1
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _0803FC0C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r0, #1
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0803FB96
	adds r0, r7, #0
	movs r1, #3
	bl Div
	ldr r2, _0803FC10 @ =0xFFFFFE00
	adds r1, r0, r2
	ldr r0, [r5, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
	str r1, [r5, #4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FC08: .4byte gUnknown_080D7BDC
_0803FC0C: .4byte sub_801EC3C
_0803FC10: .4byte 0xFFFFFE00

	thumb_func_start sub_803FC14
sub_803FC14: @ 0x0803FC14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sb, r0
	movs r3, #0
	mov r5, sb
	adds r5, #0xc
	mov r4, sb
	adds r4, #0x24
_0803FC2C:
	lsls r1, r3, #3
	adds r1, r5, r1
	lsls r0, r3, #2
	adds r0, r4, r0
	movs r6, #0
	ldrsh r2, [r0, r6]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0803FC2C
	movs r0, #0x9c
	add r0, sb
	mov sl, r0
	mov r0, sb
	adds r0, #0xa4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	mov r6, sb
	adds r6, #0x90
	mov r0, sb
	adds r0, #0x98
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldr r3, _0803FDCC @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #0xe
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0803FD04
	ldr r0, _0803FDD0 @ =gUnknown_030053B8
	mov r8, r0
	ldr r0, [r0]
	ldr r5, _0803FDD4 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0803FDD8 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r3, _0803FDDC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sb
	adds r0, #0x94
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x4b
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0803FDE0 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0803FDE4 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _0803FDE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	mov r1, sb
	adds r1, #0x39
	bl sub_8039B54
_0803FD04:
	ldr r3, _0803FDCC @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #0xd
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0803FD9A
	ldr r6, _0803FDD0 @ =gUnknown_030053B8
	mov r8, r6
	ldr r0, [r6]
	ldr r5, _0803FDD4 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0803FDD8 @ =0x3C6EF35F
	adds r2, r2, r4
	mov r0, sl
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r3, _0803FDDC @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sb
	adds r0, #0xa0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x10
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0803FDE0 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0803FDE4 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _0803FDE8 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	mov r1, sb
	adds r1, #0x39
	bl sub_8039B54
_0803FD9A:
	mov r2, sb
	adds r2, #0xa8
	mov r0, sb
	adds r0, #0xb0
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
_0803FDAE:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r6, sb
	adds r4, r6, r0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _0803FDEC
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	strh r0, [r4, #0xa]
	adds r3, #1
	str r3, [sp, #0x28]
	b _0803FEA8
	.align 2, 0
_0803FDCC: .4byte gUnknown_03005590
_0803FDD0: .4byte gUnknown_030053B8
_0803FDD4: .4byte 0x00196225
_0803FDD8: .4byte 0x3C6EF35F
_0803FDDC: .4byte gCamera
_0803FDE0: .4byte 0x000001FF
_0803FDE4: .4byte 0x06012980
_0803FDE8: .4byte 0x0000026B
_0803FDEC:
	subs r0, #1
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	adds r3, #1
	str r3, [sp, #0x28]
	cmp r0, #0
	bne _0803FEA8
	movs r3, #0
	mov r0, sb
	adds r0, #0x39
	str r0, [sp, #0x24]
	ldr r1, _0803FF20 @ =gUnknown_030053B8
	mov sl, r1
	ldr r7, _0803FF24 @ =0x00196225
	ldr r6, _0803FF28 @ =0x3C6EF35F
	movs r2, #0x3f
	mov r8, r2
	add r5, sp, #4
_0803FE10:
	mov r1, sl
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _0803FF2C @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _0803FF2C @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #7
	ands r0, r2
	add r0, ip
	subs r1, r0, #3
	str r1, [sp, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x1c]
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r7, r1
	adds r1, r1, r6
	mov r2, sl
	str r1, [r2]
	ldr r0, _0803FF30 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _0803FF34 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803FF38 @ =0x0000026B
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r1, #0
	str r1, [sp, #8]
	add r0, sp, #4
	ldr r1, [sp, #0x24]
	str r3, [sp, #0x2c]
	bl sub_8039B54
	ldr r3, [sp, #0x2c]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803FE10
_0803FEA8:
	movs r2, #8
	ldrsh r0, [r4, r2]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r3, #0xa
	ldrsh r2, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #3
	asrs r1, r1, #8
	ldr r2, _0803FF3C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0803FF02
	lsls r1, r0, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r6, #0xa
	ldrsh r1, [r4, r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0803FF02
	ldr r3, _0803FF40 @ =0xFFFFFF00
	adds r0, r1, r3
	strh r0, [r4, #8]
_0803FF02:
	ldr r6, [sp, #0x28]
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bhi _0803FF0E
	b _0803FDAE
_0803FF0E:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF20: .4byte gUnknown_030053B8
_0803FF24: .4byte 0x00196225
_0803FF28: .4byte 0x3C6EF35F
_0803FF2C: .4byte gCamera
_0803FF30: .4byte 0x000001FF
_0803FF34: .4byte 0x06012980
_0803FF38: .4byte 0x0000026B
_0803FF3C: .4byte sub_801EC3C
_0803FF40: .4byte 0xFFFFFF00

	thumb_func_start sub_803FF44
sub_803FF44: @ 0x0803FF44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	str r0, [sp, #0x24]
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FF5C
	b _080401C0
_0803FF5C:
	movs r6, #0
	ldr r0, [sp, #0x24]
	adds r0, #0x26
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x24]
	adds r1, #0xc
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	adds r2, #0x24
	str r2, [sp, #0x34]
	ldr r3, [sp, #0x24]
	adds r3, #0x10
	str r3, [sp, #0x2c]
	ldr r7, [sp, #0x24]
	adds r7, #0xa6
	mov sl, r7
	ldr r0, [sp, #0x24]
	adds r0, #0x9c
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	adds r1, #0xa4
	str r1, [sp, #0x50]
	ldr r2, [sp, #0x24]
	adds r2, #0xa0
	mov sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #0x90
	str r3, [sp, #0x40]
	ldr r7, [sp, #0x24]
	adds r7, #0x94
	str r7, [sp, #0x44]
_0803FF9A:
	lsls r0, r6, #2
	mov r8, r0
	ldr r5, [sp, #0x38]
	add r5, r8
	ldrh r0, [r5]
	adds r0, #0x20
	strh r0, [r5]
	lsls r2, r6, #3
	ldr r1, [sp, #0x28]
	adds r3, r1, r2
	ldr r7, [sp, #0x34]
	add r7, r8
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r1, [sp, #0x2c]
	adds r4, r1, r2
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	ldr r1, _080400AC @ =gUnknown_080D7F10
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	subs r0, #1
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _080400B0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _0804002E
	lsls r1, r2, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080400B4 @ =0xFFFFFF00
	cmp r0, r1
	ble _0804001A
	movs r2, #0
	strh r2, [r5]
_0804001A:
	ldrh r1, [r7]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _0804002E
	adds r0, r1, #0
	subs r0, #0x20
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r7]
_0804002E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0803FF9A
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x20
	strh r0, [r2]
	ldr r3, [sp, #0x50]
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r2, [sp, #0x4c]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r3, sl
	movs r7, #0
	ldrsh r1, [r3, r7]
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	asrs r0, r0, #8
	subs r0, #8
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _080400B0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _080400E2
	lsls r1, r2, #8
	mov r7, sb
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	mov r3, sl
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, _080400B4 @ =0xFFFFFF00
	cmp r1, r0
	ble _080400B8
	movs r0, #0
	strh r0, [r3]
	b _080400D0
	.align 2, 0
_080400AC: .4byte gUnknown_080D7F10
_080400B0: .4byte sub_801EC3C
_080400B4: .4byte 0xFFFFFF00
_080400B8:
	ldr r0, _0804019C @ =0xFFFFFE90
	cmp r1, r0
	bge _080400D0
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl sub_802B4F8
_080400D0:
	ldr r7, [sp, #0x50]
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	ble _080400E2
	adds r0, r1, #0
	subs r0, #0x30
	strh r0, [r7]
_080400E2:
	ldr r3, [sp, #0x4c]
	ldr r0, [r3]
	ldr r7, [sp, #0x40]
	str r0, [r7]
	mov r1, sb
	ldr r0, [r1]
	movs r2, #0xc8
	lsls r2, r2, #6
	adds r0, r0, r2
	ldr r3, [sp, #0x44]
	str r0, [r3]
	ldr r0, _080401A0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #6
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	beq _0804010A
	b _0804049E
_0804010A:
	ldr r0, _080401A4 @ =gUnknown_030053B8
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _080401A8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r5, _080401AC @ =0x3C6EF35F
	adds r2, r2, r5
	mov r1, r8
	str r2, [r1]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r4, _080401B0 @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0x3f
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	mov r0, sb
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x2d
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r4, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r3
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	adds r3, r4, #0
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r2, r8
	str r1, [r2]
	ldr r0, _080401B4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080401B8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080401BC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl sub_8039B54
	b _0804049E
	.align 2, 0
_0804019C: .4byte 0xFFFFFE90
_080401A0: .4byte gUnknown_03005590
_080401A4: .4byte gUnknown_030053B8
_080401A8: .4byte 0x00196225
_080401AC: .4byte 0x3C6EF35F
_080401B0: .4byte gCamera
_080401B4: .4byte 0x000001FF
_080401B8: .4byte 0x06012980
_080401BC: .4byte 0x0000026B
_080401C0:
	movs r6, #0
	ldr r3, _080404C0 @ =sub_801EC3C
	mov r8, r3
	ldr r7, [sp, #0x24]
	adds r7, #0x9c
	str r7, [sp, #0x4c]
	ldr r0, [sp, #0x24]
	adds r0, #0xa4
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x24]
	adds r1, #0x90
	str r1, [sp, #0x40]
	ldr r2, [sp, #0x24]
	adds r2, #0x94
	str r2, [sp, #0x44]
	ldr r3, [sp, #0x24]
	adds r3, #0x9a
	str r3, [sp, #0x48]
	ldr r5, [sp, #0x24]
	adds r5, #0x98
	ldr r4, [sp, #0x24]
	adds r4, #0xc
	ldr r3, [sp, #0x24]
	adds r3, #0x24
_080401F0:
	lsls r1, r6, #3
	adds r1, r4, r1
	lsls r0, r6, #2
	adds r0, r3, r0
	movs r7, #0
	ldrsh r2, [r0, r7]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080401F0
	ldr r0, [sp, #0x50]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x4c]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r7, [sp, #0x48]
	ldrh r0, [r7]
	adds r0, #0x20
	strh r0, [r7]
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, [sp, #0x40]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
	ldrsh r1, [r7, r3]
	ldr r7, [sp, #0x44]
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	asrs r0, r0, #8
	subs r0, #0x32
	ldr r1, [r2]
	asrs r1, r1, #8
	mov r2, r8
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	blt _08040256
	b _08040360
_08040256:
	ldr r1, [sp, #0x24]
	adds r1, #0x38
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	str r1, [sp, #0x3c]
	lsls r2, r2, #8
	str r2, [sp, #0x30]
	cmp r0, #0
	bne _08040324
	movs r3, #0
	ldr r7, [sp, #0x24]
	adds r7, #0xa0
	mov sb, r7
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	mov sl, r0
	ldr r7, _080404C4 @ =gUnknown_030053B8
	ldr r6, _080404C8 @ =0x00196225
	ldr r5, _080404CC @ =0x3C6EF35F
	add r4, sp, #4
	mov r8, r3
_08040284:
	ldr r0, [r7]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	str r2, [r7]
	ldr r0, [sp, #0x4c]
	ldr r1, [r0]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080404D0 @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	movs r1, #0x3f
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r5
	str r2, [r7]
	mov r0, sb
	ldr r1, [r0]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080404D0 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	movs r1, #0x3f
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x2d
	str r1, [sp, #0x1c]
	mov r0, r8
	strh r0, [r4, #0x1c]
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	str r1, [r7]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xc0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r4, #8]
	mov r1, r8
	strh r1, [r4, #0xa]
	mov r2, r8
	str r2, [sp, #8]
	add r0, sp, #4
	mov r1, sl
	str r3, [sp, #0x58]
	bl sub_8039B54
	ldr r3, [sp, #0x58]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bls _08040284
_08040324:
	ldr r3, [sp, #0x3c]
	ldrb r0, [r3]
	cmp r0, #2
	bls _0804033E
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl sub_802B4F8
_0804033E:
	ldr r7, [sp, #0x44]
	ldr r0, [r7]
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	str r0, [r7]
	ldr r2, [sp, #0x48]
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	ldr r7, [sp, #0x48]
	strh r0, [r7]
_08040360:
	ldr r0, _080404E0 @ =gUnknown_03005590
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0xe
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08040400
	ldr r6, _080404C4 @ =gUnknown_030053B8
	ldr r0, [r6]
	ldr r5, _080404C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _080404CC @ =0x3C6EF35F
	adds r2, r2, r4
	str r2, [r6]
	ldr r3, [sp, #0x40]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _080404D0 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0x3f
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, sl
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	str r2, [r6]
	ldr r0, [sp, #0x44]
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x4b
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	str r1, [r6]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl sub_8039B54
_08040400:
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0xd
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _0804049E
	ldr r6, _080404C4 @ =gUnknown_030053B8
	ldr r0, [r6]
	ldr r5, _080404C8 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _080404CC @ =0x3C6EF35F
	adds r2, r2, r4
	str r2, [r6]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r3, _080404D0 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov sb, r1
	movs r0, #0x3f
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, sb
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r5, r2
	adds r2, r2, r4
	ldr r0, [sp, #0x24]
	adds r0, #0xa0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x10
	str r1, [sp, #0x1c]
	add r0, sp, #4
	strh r7, [r0, #0x1c]
	adds r3, r0, #0
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	str r1, [r6]
	ldr r0, _080404D4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xb0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080404D8 @ =0x06012980
	str r0, [sp, #4]
	adds r1, r3, #0
	ldr r0, _080404DC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r7, [r0, #0xa]
	str r7, [sp, #8]
	ldr r1, [sp, #0x24]
	adds r1, #0x39
	bl sub_8039B54
_0804049E:
	movs r6, #0
_080404A0:
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x3c
	ldr r1, [sp, #0x24]
	adds r4, r1, r0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080404E4
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	strh r0, [r4, #0xa]
	adds r6, #1
	str r6, [sp, #0x54]
	b _080405A0
	.align 2, 0
_080404C0: .4byte sub_801EC3C
_080404C4: .4byte gUnknown_030053B8
_080404C8: .4byte 0x00196225
_080404CC: .4byte 0x3C6EF35F
_080404D0: .4byte gCamera
_080404D4: .4byte 0x000001FF
_080404D8: .4byte 0x06012980
_080404DC: .4byte 0x0000026B
_080404E0: .4byte gUnknown_03005590
_080404E4:
	subs r0, #1
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	adds r6, #1
	str r6, [sp, #0x54]
	cmp r0, #0
	bne _080405A0
	movs r3, #0
	ldr r2, [sp, #0x24]
	adds r2, #0x39
	mov sl, r2
	ldr r7, _08040618 @ =gUnknown_030053B8
	mov sb, r7
	ldr r7, _0804061C @ =0x00196225
	ldr r6, _08040620 @ =0x3C6EF35F
	movs r0, #0x3f
	mov r8, r0
	add r5, sp, #4
_08040508:
	mov r1, sb
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08040624 @ =gCamera
	ldr r0, [r1]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	adds r0, r2, #0
	mov r1, r8
	ands r0, r1
	add r0, ip
	adds r1, r0, #0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	muls r2, r7, r2
	adds r2, r2, r6
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08040624 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #7
	ands r0, r2
	add r0, ip
	subs r1, r0, #3
	str r1, [sp, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x1c]
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, r8
	ands r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r7, r1
	adds r1, r1, r6
	mov r2, sb
	str r1, [r2]
	ldr r0, _08040628 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _0804062C @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _08040630 @ =0x0000026B
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r1, #0
	str r1, [sp, #8]
	add r0, sp, #4
	mov r1, sl
	str r3, [sp, #0x58]
	bl sub_8039B54
	ldr r3, [sp, #0x58]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08040508
_080405A0:
	movs r2, #8
	ldrsh r0, [r4, r2]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	movs r3, #0xa
	ldrsh r2, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #4
	asrs r1, r1, #8
	ldr r2, _08040634 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bge _080405FC
	lsls r1, r2, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080405FC
	ldr r3, _08040638 @ =0xFFFFFF00
	adds r0, r1, r3
	strh r0, [r4, #8]
_080405FC:
	ldr r7, [sp, #0x54]
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhi _08040608
	b _080404A0
_08040608:
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040618: .4byte gUnknown_030053B8
_0804061C: .4byte 0x00196225
_08040620: .4byte 0x3C6EF35F
_08040624: .4byte gCamera
_08040628: .4byte 0x000001FF
_0804062C: .4byte 0x06012980
_08040630: .4byte 0x0000026B
_08040634: .4byte sub_801EC3C
_08040638: .4byte 0xFFFFFF00

	thumb_func_start sub_804063C
sub_804063C: @ 0x0804063C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r6, _080406C0 @ =gUnknown_030053B8
	ldr r0, [r6]
	ldr r1, _080406C4 @ =0x00196225
	mov sb, r1
	mov r4, sb
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, _080406C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl Mod
	lsls r0, r0, #0x18
	ldr r1, _080406CC @ =gUnknown_03005590
	ldr r4, [r1]
	movs r1, #3
	ands r4, r1
	lsrs r7, r0, #0x18
	asrs r5, r0, #0x18
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, r8
	adds r3, r1, r0
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	beq _08040686
	b _0804078A
_08040686:
	movs r0, #0xf6
	bl m4aSongNumStart
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r6]
	mov r4, sb
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, _080406C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080406F8
	cmp r5, #0
	bne _080406D0
	mov r0, r8
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406D0
	movs r2, #0xc
	b _080406F8
	.align 2, 0
_080406C0: .4byte gUnknown_030053B8
_080406C4: .4byte 0x00196225
_080406C8: .4byte 0x3C6EF35F
_080406CC: .4byte gUnknown_03005590
_080406D0:
	lsls r0, r7, #0x18
	asrs r1, r0, #0x18
	adds r3, r0, #0
	cmp r1, #1
	bne _080406E8
	mov r0, r8
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406E8
	movs r2, #0xd
	b _080406F8
_080406E8:
	cmp r3, #0
	bne _080406F8
	mov r0, r8
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080406F8
	movs r2, #0xe
_080406F8:
	ldr r0, _08040798 @ =gUnknown_080D7ED4
	lsls r1, r2, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r5, [r1]
	ldrb r6, [r5]
	adds r5, #1
	lsls r0, r6, #0x18
	movs r4, #0xff
	lsls r4, r4, #0x18
	adds r0, r0, r4
	lsrs r6, r0, #0x18
	cmp r0, #0
	blt _0804078A
	ldr r0, _0804079C @ =gUnknown_080D7E78
	mov sb, r0
	ldr r1, _080407A0 @ =gSineTable
	mov ip, r1
_0804071C:
	ldrb r7, [r5]
	adds r5, #1
	ldrb r4, [r5]
	adds r5, #1
	lsls r0, r4, #0x18
	asrs r0, r0, #0x16
	add r0, sb
	ldr r2, [r0]
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, r8
	adds r3, r1, r0
	movs r0, #1
	strb r0, [r3, #0x13]
	strb r4, [r3, #0x12]
	ldrh r0, [r2, #2]
	strh r0, [r3, #0x10]
	adds r2, #8
	ldrh r0, [r2]
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0x10]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r2, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3, #8]
	ldrh r0, [r3, #0x10]
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r2, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3, #0xa]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r3, #0xc]
	lsls r0, r6, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r6, r0, #0x18
	cmp r0, #0
	bge _0804071C
_0804078A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040798: .4byte gUnknown_080D7ED4
_0804079C: .4byte gUnknown_080D7E78
_080407A0: .4byte gSineTable

	thumb_func_start sub_80407A4
sub_80407A4: @ 0x080407A4
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r5, #0
	ldr r6, _0804082C @ =gSineTable
_080407AC:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, ip
	adds r2, r1, r0
	ldrb r4, [r2, #0x13]
	cmp r4, #0
	beq _080408AE
	ldr r1, _08040830 @ =gUnknown_080D7E78
	ldrb r0, [r2, #0x12]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrb r0, [r2, #0x13]
	lsls r0, r0, #3
	adds r3, r3, r0
	ldrh r0, [r2, #0xe]
	subs r0, #1
	movs r1, #0
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040838
	ldrh r0, [r3, #2]
	ldrh r4, [r2, #0x10]
	adds r0, r0, r4
	ldr r7, _08040834 @ =0x000003FF
	adds r4, r7, #0
	ands r0, r4
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #0xa]
	ldr r0, [r3]
	cmp r0, #0x20
	bne _0804088C
	ldrh r0, [r3, #4]
	cmp r0, #0
	bne _0804088C
	ldrh r0, [r2, #0xc]
	adds r0, #0x10
	ands r0, r4
	strh r0, [r2, #0xc]
	b _0804088C
	.align 2, 0
_0804082C: .4byte gSineTable
_08040830: .4byte gUnknown_080D7E78
_08040834: .4byte 0x000003FF
_08040838:
	adds r3, #8
	ldrh r0, [r3]
	cmp r0, #0
	bne _0804084C
	strh r0, [r2, #0xe]
	strb r1, [r2, #0x13]
	strb r1, [r2, #0x12]
	strh r0, [r2, #0x10]
	strh r0, [r2, #8]
	b _0804088A
_0804084C:
	adds r0, r4, #1
	strb r0, [r2, #0x13]
	ldrh r0, [r3]
	strh r0, [r2, #0xe]
	ldrh r0, [r3, #2]
	ldrh r1, [r2, #0x10]
	adds r0, r0, r1
	ldr r4, _080408C0 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x10]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldrh r0, [r3, #4]
	muls r0, r1, r0
	asrs r0, r0, #0xe
_0804088A:
	strh r0, [r2, #0xa]
_0804088C:
	ldr r0, [r2]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	str r0, [r2]
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	mov r7, ip
	movs r3, #0x30
	ldrsh r0, [r7, r3]
	subs r1, r1, r0
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_080408AE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bhi _080408BA
	b _080407AC
_080408BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080408C0: .4byte 0x000003FF

	thumb_func_start sub_80408C4
sub_80408C4: @ 0x080408C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
_080408CA:
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r6, r0
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	bne _080408DC
	b _080409EC
_080408DC:
	ldr r1, _08040914 @ =gUnknown_080D7E78
	ldrb r0, [r4, #0x12]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0x3c
	beq _080408F4
	b _080409EC
_080408F4:
	ldrh r2, [r1, #4]
	cmp r2, #0
	bne _080409EC
	ldrh r0, [r4, #0xe]
	adds r3, r0, #0
	cmp r3, #0x3c
	bne _08040926
	ldr r0, _08040918 @ =gPlayer
	ldr r1, [r0, #0xc]
	ldr r0, [r4, #4]
	cmp r1, r0
	bge _0804091C
	movs r0, #1
	strb r0, [r4, #0x15]
	b _0804091E
	.align 2, 0
_08040914: .4byte gUnknown_080D7E78
_08040918: .4byte gPlayer
_0804091C:
	strb r2, [r4, #0x15]
_0804091E:
	ldrb r1, [r4, #0x16]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r4, #0x16]
_08040926:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2f
	bls _08040940
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _0804093A
	ldrb r0, [r4, #0x17]
	subs r0, #1
	b _080409BE
_0804093A:
	ldrb r0, [r4, #0x17]
	adds r0, #1
	b _080409BE
_08040940:
	cmp r0, #0x1e
	bne _080409A0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _080409A0
	ldrb r1, [r4, #0x16]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804098A
	ldr r2, _08040994 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _08040998 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804099C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0804098A
	ldr r1, [r4]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r0, r0, #8
	ldr r2, [r4, #4]
	adds r2, r2, r0
	ldrb r3, [r4, #0x15]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #8
	subs r2, r2, r0
	adds r0, r6, #0
	movs r3, #0x80
	lsls r3, r3, #2
	bl sub_80412F0
_0804098A:
	ldrb r1, [r4, #0x16]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #0x16]
	b _080409C0
	.align 2, 0
_08040994: .4byte gUnknown_030053B8
_08040998: .4byte 0x00196225
_0804099C: .4byte 0x3C6EF35F
_080409A0:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x11
	bhi _080409C0
	ldrb r1, [r4, #0x17]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080409EC
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080409BC
	adds r0, r1, #1
	b _080409BE
_080409BC:
	subs r0, r1, #1
_080409BE:
	strb r0, [r4, #0x17]
_080409C0:
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080409EC
	adds r5, r6, #0
	adds r5, #0x36
	ldrb r0, [r5]
	cmp r0, #0
	bne _080409EC
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8040B30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080409EC
	ldrb r0, [r4, #0x16]
	movs r1, #0x7f
	ands r1, r0
	strb r1, [r4, #0x16]
	movs r0, #0x1e
	strb r0, [r5]
_080409EC:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bhi _080409F8
	b _080408CA
_080409F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8040A00
sub_8040A00: @ 0x08040A00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040A18
	b _08040B16
_08040A18:
	movs r0, #0
	mov r8, r0
	ldr r1, _08040AD8 @ =gPlayer
	mov sb, r1
_08040A20:
	mov r3, r8
	lsls r0, r3, #6
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r3, sl
	adds r6, r3, r0
	mov r1, r8
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r4, r3, r0
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r3, sb
	str r3, [sp]
	adds r0, r6, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #0
	bne _08040B08
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r0, sb
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #2
	bl sub_800CA20
	cmp r0, #0
	bne _08040B08
	mov r3, sb
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r1, r0
	movs r7, #0
	cmp r1, #0
	beq _08040A80
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _08040A80
	movs r7, #1
_08040A80:
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r5, _08040AD8 @ =gPlayer
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08040AE0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08040AE0
	ldr r0, [r5, #8]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r4, r3]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	adds r1, r1, r0
	str r1, [r5, #0xc]
	cmp r7, #0
	bne _08040B08
	ldr r1, _08040ADC @ =0xFFFFFB00
	adds r0, r1, #0
	ldrh r3, [r5, #0x10]
	adds r0, r0, r3
	strh r0, [r5, #0x10]
	b _08040B08
	.align 2, 0
_08040AD8: .4byte gPlayer
_08040ADC: .4byte 0xFFFFFB00
_08040AE0:
	cmp r7, #0
	beq _08040B08
	ldr r2, _08040B28 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0x20]
	movs r0, #0
	str r0, [r2, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08040B08
	ldr r0, _08040B2C @ =0xFFFFFEFF
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08040B08:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _08040A20
_08040B16:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040B28: .4byte gPlayer
_08040B2C: .4byte 0xFFFFFEFF

	thumb_func_start sub_8040B30
sub_8040B30: @ 0x08040B30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r6, #0
	cmp r1, #3
	bhi _08040B62
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r7, r2, r0
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	beq _08040B62
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040B66
_08040B62:
	movs r0, #0
	b _08040D62
_08040B66:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r0, r2
	mov sb, r0
	ldr r2, [r7]
	lsls r2, r2, #8
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r0, r2, #0x10
	str r0, [sp, #0x44]
	asrs r4, r2, #0x10
	lsrs r2, r1, #0x10
	mov sl, r2
	asrs r5, r1, #0x10
	ldr r0, _08040C38 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08040C64
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040C5C
	ldr r1, _08040C3C @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	str r0, [sp, #0x1c]
	add r0, sp, #4
	strh r6, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08040C40 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _08040C44 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #8]
	adds r1, r7, #0
	adds r1, #0x16
	bl sub_8039B54
	ldr r1, _08040C48 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040C4C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040C2E
	ldr r0, _08040C50 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040C2E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040C54 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040C26
	mov r0, r8
_08040C26:
	strb r0, [r1]
	ldr r1, _08040C58 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08040C2E:
	movs r0, #0x90
	bl m4aSongNumStart
	b _08040C62
	.align 2, 0
_08040C38: .4byte gPlayer
_08040C3C: .4byte gCamera
_08040C40: .4byte 0x06012980
_08040C44: .4byte 0x0000026B
_08040C48: .4byte gUnknown_03005450
_08040C4C: .4byte 0x0000C350
_08040C50: .4byte gGameMode
_08040C54: .4byte gUnknown_03005448
_08040C58: .4byte gUnknown_030054A8
_08040C5C:
	movs r0, #0x8f
	bl m4aSongNumStart
_08040C62:
	movs r6, #1
_08040C64:
	ldr r1, [sp, #0x44]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #8
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r5, r1, #0x10
	lsls r1, r5, #8
	bl sub_80122DC
	ldr r0, _08040D30 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _08040D60
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08040D58
	add r0, sp, #0x24
	ldr r2, _08040D34 @ =gCamera
	ldr r1, [r2]
	subs r1, r4, r1
	str r1, [r0, #0x14]
	ldr r1, [r2, #4]
	subs r1, r5, r1
	str r1, [r0, #0x18]
	strh r3, [r0, #0x1c]
	movs r1, #0xf0
	lsls r1, r1, #2
	strh r1, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r0, #0xe]
	ldr r1, _08040D38 @ =0x06012980
	str r1, [sp, #0x24]
	ldr r1, _08040D3C @ =0x0000026B
	strh r1, [r0, #8]
	strh r3, [r0, #0xa]
	str r3, [r0, #4]
	adds r1, r7, #0
	adds r1, #0x16
	bl sub_8039B54
	ldr r1, _08040D40 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040D44 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040D1A
	ldr r0, _08040D48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040D1A
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040D4C @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040D12
	mov r0, r8
_08040D12:
	strb r0, [r1]
	ldr r1, _08040D50 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08040D1A:
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r0, _08040D30 @ =gPlayer
	bl sub_800CB18
	ldr r0, _08040D54 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
	b _08040D5E
	.align 2, 0
_08040D30: .4byte gPlayer
_08040D34: .4byte gCamera
_08040D38: .4byte 0x06012980
_08040D3C: .4byte 0x0000026B
_08040D40: .4byte gUnknown_03005450
_08040D44: .4byte 0x0000C350
_08040D48: .4byte gGameMode
_08040D4C: .4byte gUnknown_03005448
_08040D50: .4byte gUnknown_030054A8
_08040D54: .4byte gUnknown_03005498
_08040D58:
	movs r0, #0x8f
	bl m4aSongNumStart
_08040D5E:
	movs r6, #1
_08040D60:
	adds r0, r6, #0
_08040D62:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8040D74
sub_8040D74: @ 0x08040D74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r7, r4, r0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040E62
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	beq _08040E48
	subs r0, r1, #1
	mov r1, r8
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08040DAE
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08040DB4
_08040DAE:
	movs r0, #0xeb
	bl m4aSongNumStart
_08040DB4:
	adds r0, r4, #0
	adds r0, #0x35
	movs r1, #0x1e
	strb r1, [r0]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08040E34
	ldr r0, _08040E1C @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08040E20 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040E24 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040E40
	ldr r0, _08040E28 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040E40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040E2C @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040E12
	movs r0, #0xff
_08040E12:
	strb r0, [r1]
	ldr r1, _08040E30 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08040E40
	.align 2, 0
_08040E1C: .4byte 0x00000275
_08040E20: .4byte gUnknown_03005450
_08040E24: .4byte 0x0000C350
_08040E28: .4byte gGameMode
_08040E2C: .4byte gUnknown_03005448
_08040E30: .4byte gUnknown_030054A8
_08040E34:
	ldr r0, _08040E6C @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_08040E40:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08040E48:
	ldr r0, _08040E70 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08040E62
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #4
	bne _08040E62
	ldr r1, _08040E74 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08040E62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040E6C: .4byte 0x00000275
_08040E70: .4byte gCurrentLevel
_08040E74: .4byte gUnknown_030054A8

	thumb_func_start sub_8040E78
sub_8040E78: @ 0x08040E78
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r4, r3, r0
	adds r2, r3, #0
	adds r2, #0x35
	ldrb r0, [r2]
	cmp r0, #0
	beq _08040ED8
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F06
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040EBC
	ldr r0, _08040EB8 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r2, #0xb2
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _08040EC8
	.align 2, 0
_08040EB8: .4byte 0x00000275
_08040EBC:
	movs r0, #0
	ldr r1, _08040ED4 @ =0x00000275
	strh r1, [r4, #0xa]
	movs r2, #0xb2
	lsls r2, r2, #2
	adds r1, r3, r2
_08040EC8:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _08040F04
	.align 2, 0
_08040ED4: .4byte 0x00000275
_08040ED8:
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040F06
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F06
	movs r1, #0
	ldr r0, _08040F0C @ =0x00000275
	strh r0, [r4, #0xa]
	movs r4, #0xb2
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _08040F10 @ =0x000002C9
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_08040F04:
	strb r0, [r1]
_08040F06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040F0C: .4byte 0x00000275
_08040F10: .4byte 0x000002C9

	thumb_func_start sub_8040F14
sub_8040F14: @ 0x08040F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040F70
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x36
	ldr r0, _08040F60 @ =gFlags
	mov r8, r0
	ldr r1, _08040F64 @ =gObjPalette
	mov ip, r1
	ldr r7, _08040F68 @ =gUnknown_080D7F14
	ldr r6, _08040F6C @ =gUnknown_03005590
	movs r5, #2
_08040F38:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r3, #1
	ldr r0, [r6]
	ands r0, r5
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040F38
	b _08040F98
	.align 2, 0
_08040F60: .4byte gFlags
_08040F64: .4byte gObjPalette
_08040F68: .4byte gUnknown_080D7F14
_08040F6C: .4byte gUnknown_03005590
_08040F70:
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x36
	ldr r0, _08040FD4 @ =gFlags
	mov r8, r0
	ldr r5, _08040FD8 @ =gObjPalette
	ldr r2, _08040FDC @ =gUnknown_080D7F34
_08040F7E:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040F7E
_08040F98:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08040FE8
	subs r0, #1
	strb r0, [r4]
	movs r3, #0
	ldr r7, _08040FD8 @ =gObjPalette
	ldr r6, _08040FE0 @ =gUnknown_080D7F14
	ldr r5, _08040FE4 @ =gUnknown_03005590
	movs r4, #2
_08040FAC:
	adds r2, r3, #0
	adds r2, #0xb0
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040FAC
	b _08041008
	.align 2, 0
_08040FD4: .4byte gFlags
_08040FD8: .4byte gObjPalette
_08040FDC: .4byte gUnknown_080D7F34
_08040FE0: .4byte gUnknown_080D7F14
_08040FE4: .4byte gUnknown_03005590
_08040FE8:
	movs r3, #0
	ldr r4, _08041020 @ =gObjPalette
	ldr r2, _08041024 @ =gUnknown_080D7F34
_08040FEE:
	adds r1, r3, #0
	adds r1, #0xb0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040FEE
_08041008:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041020: .4byte gObjPalette
_08041024: .4byte gUnknown_080D7F34

	thumb_func_start sub_8041028
sub_8041028: @ 0x08041028
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _080410D4 @ =IWRAM_START + 0xC4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	movs r5, #0
	ldr r0, _080410D8 @ =IWRAM_START + 0xFC
	adds r4, r4, r0
_08041042:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041042
	movs r5, #0
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r4, r6, r1
_08041062:
	lsls r0, r5, #6
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041062
	movs r1, #0x93
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe6
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc3
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080410B6
	bl VramFree
_080410B6:
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080410C6
	bl VramFree
_080410C6:
	ldr r1, _080410DC @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410D4: .4byte IWRAM_START + 0xC4
_080410D8: .4byte IWRAM_START + 0xFC
_080410DC: .4byte gUnknown_03005B4C

	thumb_func_start sub_80410E0
sub_80410E0: @ 0x080410E0
	push {r4, r5, r6, lr}
	ldr r6, _0804112C @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0xf4
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r4, #0
	bl sub_803FB88
	adds r0, r4, #0
	bl sub_8041264
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F698
	ldr r0, _08041130 @ =IWRAM_START + 0xB4
	adds r5, r5, r0
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _08041124
	ldr r1, [r6]
	ldr r0, _08041134 @ =sub_803F3E8
	str r0, [r1, #8]
_08041124:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804112C: .4byte gCurTask
_08041130: .4byte IWRAM_START + 0xB4
_08041134: .4byte sub_803F3E8

	thumb_func_start sub_8041138
sub_8041138: @ 0x08041138
	push {r4, r5, lr}
	ldr r0, _080411AC @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r0, _080411B0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0804115A
	movs r0, #0x90
	bl m4aSongNumStart
_0804115A:
	ldr r1, _080411B4 @ =IWRAM_START + 0x2DC
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08041184
	ldr r2, _080411B8 @ =IWRAM_START + 0xB8
	adds r0, r4, r2
	ldr r1, [r0]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r1, r3
	str r1, [r0]
	ldr r0, _080411BC @ =IWRAM_START + 0xBC
	adds r2, r4, r0
	ldr r1, [r2]
	ldr r0, _080411C0 @ =0xFFFFD000
	cmp r1, r0
	ble _08041184
	ldr r3, _080411C4 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_08041184:
	adds r0, r5, #0
	bl sub_803FC14
	adds r0, r5, #0
	bl sub_8040E78
	adds r0, r5, #0
	bl sub_803F878
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080411A4
	ldr r0, _080411AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080411C8 @ =sub_80411CC
	str r0, [r1, #8]
_080411A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080411AC: .4byte gCurTask
_080411B0: .4byte gUnknown_03005590
_080411B4: .4byte IWRAM_START + 0x2DC
_080411B8: .4byte IWRAM_START + 0xB8
_080411BC: .4byte IWRAM_START + 0xBC
_080411C0: .4byte 0xFFFFD000
_080411C4: .4byte 0xFFFFFD00
_080411C8: .4byte sub_80411CC

	thumb_func_start sub_80411CC
sub_80411CC: @ 0x080411CC
	push {r4, r5, r6, lr}
	ldr r6, _08041228 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0804122C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _080411EE
	movs r0, #0x90
	bl m4aSongNumStart
_080411EE:
	adds r0, r4, #0
	bl sub_803FF44
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F878
	ldr r1, _08041230 @ =IWRAM_START + 0xD6
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xc8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08041220
	adds r0, #0xa0
	movs r1, #0x96
	movs r2, #2
	bl sub_802EF68
	ldr r1, [r6]
	ldr r0, _08041234 @ =sub_8041238
	str r0, [r1, #8]
_08041220:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041228: .4byte gCurTask
_0804122C: .4byte gUnknown_03005590
_08041230: .4byte IWRAM_START + 0xD6
_08041234: .4byte sub_8041238

	thumb_func_start sub_8041238
sub_8041238: @ 0x08041238
	push {lr}
	ldr r0, _08041248 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08041248: .4byte gCurTask

	thumb_func_start sub_804124C
sub_804124C: @ 0x0804124C
	movs r1, #8
	ldrsh r2, [r0, r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	ldr r1, [r0, #4]
	adds r1, r1, r2
	str r1, [r0, #4]
	bx lr
	.align 2, 0

	thumb_func_start sub_8041264
sub_8041264: @ 0x08041264
	push {r4, r5, lr}
	mov ip, r0
	movs r4, #0
	ldr r5, _080412B0 @ =gUnknown_080D7BE2
_0804126C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r3, r0, #2
	mov r1, ip
	adds r0, r1, r3
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804129E
	mov r0, ip
	adds r0, #0x3c
	adds r0, r0, r3
	ldr r1, [r1]
	str r1, [r0]
	mov r2, ip
	adds r2, #0x40
	adds r2, r2, r3
	lsls r0, r4, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r3, ip
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r2]
_0804129E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804126C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080412B0: .4byte gUnknown_080D7BE2

	thumb_func_start sub_80412B4
sub_80412B4: @ 0x080412B4
	push {lr}
	adds r2, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r3, r2, r0
	adds r0, r2, #0
	adds r0, #0x34
	movs r1, #0x1e
	strb r1, [r0]
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080412E2
	ldr r0, _080412E8 @ =0x00000275
	strh r0, [r3, #0xa]
	adds r0, #0x53
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080412EC @ =0x000002C9
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_080412E2:
	pop {r0}
	bx r0
	.align 2, 0
_080412E8: .4byte 0x00000275
_080412EC: .4byte 0x000002C9

	thumb_func_start sub_80412F0
sub_80412F0: @ 0x080412F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _080413FC @ =sub_8041420
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r7, #0
	str r7, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r1, _08041400 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r0, r6, r0
	str r0, [r4]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, r8
	subs r0, r1, r0
	str r0, [r4, #4]
	ldr r1, _08041404 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r2, r8
	asrs r2, r2, #8
	mov r8, r2
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	asrs r6, r6, #8
	str r6, [sp, #4]
	subs r1, r1, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08041408 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r6, #0
	ldrsh r1, [r1, r6]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	asrs r1, r1, #0xe
	movs r3, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	adds r1, r1, r6
	strh r1, [r4, #8]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0xa]
	mov r6, sl
	str r6, [r4, #0xc]
	ldr r0, _0804140C @ =IWRAM_START + 0x10
	adds r1, r5, r0
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r1, #0x16]
	mov r6, r8
	strh r6, [r1, #0x18]
	movs r0, #0xe6
	lsls r0, r0, #2
	add sl, r0
	mov r2, sl
	ldr r0, [r2]
	str r0, [r1, #4]
	ldr r0, _08041410 @ =0x00000292
	strh r0, [r1, #0xa]
	ldr r6, _08041414 @ =IWRAM_START + 0x30
	adds r0, r5, r6
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r7, [r1, #8]
	strh r7, [r1, #0x14]
	strh r7, [r1, #0x1c]
	ldr r0, _08041418 @ =IWRAM_START + 0x31
	adds r2, r5, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r6, #2
	adds r2, r5, r6
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0804141C @ =IWRAM_START + 0x35
	adds r5, r5, r0
	strb r3, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080413FC: .4byte sub_8041420
_08041400: .4byte gCamera
_08041404: .4byte gPlayer
_08041408: .4byte gSineTable
_0804140C: .4byte IWRAM_START + 0x10
_08041410: .4byte 0x00000292
_08041414: .4byte IWRAM_START + 0x30
_08041418: .4byte IWRAM_START + 0x31
_0804141C: .4byte IWRAM_START + 0x35

	thumb_func_start sub_8041420
sub_8041420: @ 0x08041420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08041458 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x10
	adds r6, r1, r0
	ldr r2, _0804145C @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov ip, r2
	cmp r1, #0
	beq _08041464
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r7, _08041460 @ =0xFFFFFB00
	adds r0, r0, r7
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08041480
	.align 2, 0
_08041458: .4byte gCurTask
_0804145C: .4byte gPlayer
_08041460: .4byte 0xFFFFFB00
_08041464:
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r2, _080414E8 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08041480:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	strh r1, [r6, #0x18]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r2, r5
	bge _080414A6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	blt _080414E0
_080414A6:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	ble _080414B6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414B6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, r5
	bge _080414C6
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	cmp r0, #0
	blt _080414E0
_080414C6:
	cmp r1, #0xc0
	ble _080414D2
	movs r7, #0xa
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414D2:
	ldr r0, _080414EC @ =0xFFFFFE00
	cmp r2, r0
	blt _080414E0
	movs r0, #0xbc
	lsls r0, r0, #2
	cmp r2, r0
	ble _080414F0
_080414E0:
	ldr r0, [r3]
	bl TaskDestroy
	b _08041558
	.align 2, 0
_080414E8: .4byte gCamera
_080414EC: .4byte 0xFFFFFE00
_080414F0:
	ldr r0, [r4, #0xc]
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804154C
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _08041560 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	mov r0, ip
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r5, r0, #0
	cmp r5, #1
	bne _0804154C
	ldr r3, [r4, #0xc]
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804154C
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r2, r3, r1
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08041564 @ =0x00000275
	strh r0, [r2, #0xa]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r0, r3, r7
	strb r5, [r0]
	ldr r0, _08041568 @ =0x000002C9
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
_0804154C:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08041558:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041560: .4byte gCamera
_08041564: .4byte 0x00000275
_08041568: .4byte 0x000002C9

	thumb_func_start sub_804156C
sub_804156C: @ 0x0804156C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _080415C8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _080415CC @ =gUnknown_030053B8
	ldr r0, _080415D0 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _080415D4 @ =sub_8042670
	movs r1, #0xaa
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _080415D8 @ =sub_80427A0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _080415DC @ =gUnknown_03005B4C
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r0, _080415E0 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080415E8
	ldr r0, _080415E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _080415E8
	movs r0, #6
	b _080415EC
	.align 2, 0
_080415C8: .4byte gPlayer
_080415CC: .4byte gUnknown_030053B8
_080415D0: .4byte gUnknown_03005590
_080415D4: .4byte sub_8042670
_080415D8: .4byte sub_80427A0
_080415DC: .4byte gUnknown_03005B4C
_080415E0: .4byte gUnknown_030054EC
_080415E4: .4byte gGameMode
_080415E8:
	movs r0, #8
	mov r1, sl
_080415EC:
	strb r0, [r1, #0x14]
	ldr r1, _08041614 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0804161C
	mov r2, sl
	ldrb r0, [r2, #0x14]
	lsrs r0, r0, #1
	strb r0, [r2, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0804161C
	ldr r0, _08041618 @ =0x00466E00
	str r0, [r2, #4]
	movs r0, #0xb4
	lsls r0, r0, #7
	str r0, [r2, #8]
	b _0804162A
	.align 2, 0
_08041614: .4byte gCurrentLevel
_08041618: .4byte 0x00466E00
_0804161C:
	movs r0, #0xdc
	lsls r0, r0, #0xa
	mov r1, sl
	str r0, [r1, #4]
	movs r0, #0xb4
	lsls r0, r0, #7
	str r0, [r1, #8]
_0804162A:
	movs r5, #0
	movs r4, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	mov r2, sl
	strh r6, [r2, #0xc]
	strh r4, [r2, #0xe]
	strb r5, [r2, #0x15]
	strb r5, [r2, #0x16]
	strh r4, [r2, #0x12]
	movs r0, #0x78
	str r0, [r2]
	strh r4, [r2, #0x10]
	strb r5, [r2, #0x17]
	movs r0, #0x2d
	bl VramMalloc
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, sl
	str r0, [r1]
	mov r7, sl
	adds r7, #0x88
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041780 @ =0x00000295
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0xa8
	strb r5, [r0]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0xa9
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xaa
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	movs r0, #0x90
	lsls r0, r0, #6
	mov sb, r0
	str r0, [r7, #0x10]
	adds r7, #0x38
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041784 @ =0x00000275
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0xe0
	strb r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0xe1
	adds r0, r6, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe2
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	strb r5, [r0]
	str r6, [r7, #0x28]
	mov r2, sb
	str r2, [r7, #0x10]
	adds r7, #0x30
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #8
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041788 @ =0x00000299
	strh r0, [r7, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, _0804178C @ =0x00000111
	add r1, sl
	adds r0, r6, #0
	strb r0, [r1]
	movs r0, #0x89
	lsls r0, r0, #1
	add r0, sl
	mov r1, r8
	strb r1, [r0]
	ldr r0, _08041790 @ =0x00000115
	add r0, sl
	strb r5, [r0]
	str r6, [r7, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	mov sb, r2
	str r2, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0x90
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x19
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041794 @ =0x00000296
	strh r0, [r7, #0xa]
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, _08041798 @ =0x00000141
	add r1, sl
	adds r0, r6, #0
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #1
	add r0, sl
	mov r1, r8
	strb r1, [r0]
	ldr r0, _0804179C @ =0x00000145
	add r0, sl
	strb r5, [r0]
	str r6, [r7, #0x28]
	mov r2, sb
	str r2, [r7, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041780: .4byte 0x00000295
_08041784: .4byte 0x00000275
_08041788: .4byte 0x00000299
_0804178C: .4byte 0x00000111
_08041790: .4byte 0x00000115
_08041794: .4byte 0x00000296
_08041798: .4byte 0x00000141
_0804179C: .4byte 0x00000145

	thumb_func_start sub_80417A0
sub_80417A0: @ 0x080417A0
	push {r4, r5, r6, lr}
	ldr r0, _08041868 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x18
	adds r6, r5, r0
	adds r0, r4, #0
	bl sub_804217C
	adds r0, r4, #0
	bl sub_80424EC
	adds r0, r4, #0
	bl sub_8041C48
	adds r0, r4, #0
	bl sub_8042560
	adds r0, r4, #0
	bl sub_8041D34
	ldr r0, _0804186C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _080417E4
	movs r0, #0x90
	bl m4aSongNumStart
_080417E4:
	ldr r1, _08041870 @ =IWRAM_START + 0x84
	adds r3, r5, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _08041830
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r2, _08041874 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _08041830
	ldr r1, _08041878 @ =IWRAM_START + 0x80
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08041830
	movs r0, #1
	strb r0, [r3]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	subs r1, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
_08041830:
	ldr r0, [r4, #0x1c]
	asrs r0, r0, #8
	ldr r1, _08041874 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08041860
	adds r0, r4, #0
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041860
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x96
	movs r2, #3
	bl sub_802EF68
	ldr r0, _08041868 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0804187C @ =sub_8042748
	str r0, [r1, #8]
_08041860:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041868: .4byte gCurTask
_0804186C: .4byte gUnknown_03005590
_08041870: .4byte IWRAM_START + 0x84
_08041874: .4byte gCamera
_08041878: .4byte IWRAM_START + 0x80
_0804187C: .4byte sub_8042748

	thumb_func_start sub_8041880
sub_8041880: @ 0x08041880
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x88
	mov r1, r8
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r4, _080419F8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	adds r7, #0x38
	mov r6, r8
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	movs r5, #0
	ldr r0, _080419FC @ =gSineTable
	mov sb, r0
	adds r7, #0x30
	mov sl, r4
_080418E6:
	ldr r3, _08041A00 @ =gUnknown_03005590
	ldr r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	lsls r1, r5, #7
	adds r0, r0, r1
	ldr r4, _08041A04 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	ldr r2, [r0, #4]
	asrs r2, r2, #8
	mov r1, sl
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0xfa
	lsls r4, r4, #1
	adds r3, r6, r4
	ldr r6, _08041A04 @ =0x000003FF
	ands r3, r6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	add r0, sb
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r4, r5, #1
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r2, r2, r0
	strh r2, [r7, #0x16]
	mov r6, r8
	ldr r2, [r6, #8]
	asrs r2, r2, #8
	mov r1, sl
	ldr r0, [r1, #4]
	subs r2, r2, r0
	lsls r3, r3, #1
	add r3, sb
	movs r6, #0
	ldrsh r1, [r3, r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r0, #0x14
	adds r2, r2, r0
	strh r2, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	cmp r5, #2
	bls _080418E6
	ldr r4, _080419FC @ =gSineTable
	ldr r0, _08041A00 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r3, _08041A04 @ =0x000003FF
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r7, #0x90
	lsls r7, r7, #1
	add r7, r8
	mov r0, r8
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r5, _080419F8 @ =gCamera
	ldr r0, [r5]
	subs r1, r1, r0
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r2, r6, r0
	ands r2, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r0, r0, #0xc
	adds r1, r1, r0
	strh r1, [r7, #0x16]
	mov r0, r8
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r0, r0, #0xc
	adds r0, #0x14
	adds r1, r1, r0
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080419F8: .4byte gCamera
_080419FC: .4byte gSineTable
_08041A00: .4byte gUnknown_03005590
_08041A04: .4byte 0x000003FF

	thumb_func_start sub_8041A08
sub_8041A08: @ 0x08041A08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r4, _08041AEC @ =gSineTable
	ldr r0, _08041AF0 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _08041AF4 @ =0x000003FF
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r6, r5, r3
	ldr r3, [r5, #4]
	asrs r3, r3, #8
	mov ip, r3
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r0, r0, #0xc
	mov r2, ip
	adds r3, r2, r0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #0xc
	adds r0, #0x14
	adds r2, r2, r0
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	bne _08041B08
	ldr r4, _08041AF8 @ =gPlayer
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08041ABA
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08041ABA
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r4, #0
	bl sub_800DF38
	cmp r0, #0
	beq _08041ABA
	ldr r0, _08041AFC @ =0x0000FB40
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	ldr r1, _08041B00 @ =0xFFFFFEF7
	ands r0, r1
	str r0, [r4, #0x20]
	str r7, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r7, #1
_08041ABA:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0x96
	lsls r2, r2, #1
	cmp r0, r2
	bls _08041ACE
	movs r7, #1
_08041ACE:
	cmp r7, #0
	beq _08041B36
	ldr r0, _08041B04 @ =0x00000296
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	strh r2, [r5, #0x10]
	movs r0, #1
	b _08041B34
	.align 2, 0
_08041AEC: .4byte gSineTable
_08041AF0: .4byte gUnknown_03005590
_08041AF4: .4byte 0x000003FF
_08041AF8: .4byte gPlayer
_08041AFC: .4byte 0x0000FB40
_08041B00: .4byte 0xFFFFFEF7
_08041B04: .4byte 0x00000296
_08041B08:
	ldrh r0, [r5, #0x10]
	subs r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x12
	bne _08041B2C
	ldr r0, _08041B3C @ =0x00000296
	strh r0, [r6, #0xa]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #3
	strb r0, [r1]
	ldr r3, _08041B40 @ =0x00000141
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
_08041B2C:
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	bne _08041B36
	movs r0, #0
_08041B34:
	strb r0, [r5, #0x17]
_08041B36:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041B3C: .4byte 0x00000296
_08041B40: .4byte 0x00000141

	thumb_func_start sub_8041B44
sub_8041B44: @ 0x08041B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _08041BE8
	ldr r0, [r4, #4]
	asrs r7, r0, #8
	ldr r0, [r4, #8]
	asrs r5, r0, #8
	movs r0, #0x88
	adds r0, r0, r4
	mov r8, r0
	ldr r6, _08041B98 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08041BC0
	str r6, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08041BA4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	cmp r0, r5
	ble _08041B9C
	adds r0, r4, #0
	bl sub_8042774
	adds r0, r6, #0
	bl sub_800CBA4
	b _08041BC0
	.align 2, 0
_08041B98: .4byte gPlayer
_08041B9C:
	adds r0, r4, #0
	bl sub_80423EC
	b _08041BC0
_08041BA4:
	str r6, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800CA20
	str r6, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #1
	bl sub_800CA20
_08041BC0:
	lsls r0, r7, #8
	lsls r1, r5, #8
	bl sub_80122DC
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _08041BE8
	ldr r0, _08041BF4 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _08041BE8
	adds r0, r4, #0
	bl sub_80423EC
_08041BE8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041BF4: .4byte gPlayer

	thumb_func_start sub_8041BF8
sub_8041BF8: @ 0x08041BF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	beq _08041C08
	subs r0, #1
	strh r0, [r4, #0x12]
	b _08041C3C
_08041C08:
	adds r5, r4, #0
	adds r5, #0x88
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	movs r0, #0xd0
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r0, r4, #0
	bl sub_80427FC
	ldrb r0, [r4, #0x14]
	cmp r0, #4
	bhi _08041C26
	movs r0, #0x50
	b _08041C28
_08041C26:
	movs r0, #0x8c
_08041C28:
	strh r0, [r4, #0x12]
	ldr r0, _08041C44 @ =0x00000295
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08041C3C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041C44: .4byte 0x00000295

	thumb_func_start sub_8041C48
sub_8041C48: @ 0x08041C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0x18
	adds r0, r0, r6
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x88
	ldr r0, [r0, #4]
	asrs r0, r0, #8
	ldr r7, _08041D30 @ =gCamera
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r6, #0
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	bne _08041CB4
	adds r4, #0x38
	mov r1, r8
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	subs r0, #0xe
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08041CB4:
	adds r4, r6, #0
	adds r4, #0xf0
	movs r5, #0
	movs r0, #0x30
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x34
	adds r1, r1, r6
	mov sb, r1
_08041CC6:
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #2
	mov r1, sl
	adds r0, r1, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	add r2, sb
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041CC6
	movs r0, #0x90
	lsls r0, r0, #1
	adds r4, r6, r0
	mov r1, r8
	ldr r0, [r1, #0x54]
	asrs r0, r0, #8
	ldr r2, _08041D30 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	mov r1, r8
	ldr r0, [r1, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041D30: .4byte gCamera

	thumb_func_start sub_8041D34
sub_8041D34: @ 0x08041D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x20]
	adds r0, #0x18
	mov sl, r0
	ldr r1, [sp, #0x20]
	adds r1, #0x82
	mov sb, r1
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	str r2, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041D62
	b _08041FEA
_08041D62:
	adds r0, r2, #0
	movs r1, #0xc
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08041DFA
	movs r0, #0x30
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08041FFC @ =gUnknown_030053B8
	mov r8, r0
	ldr r0, [r0]
	ldr r5, _08042000 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _08042004 @ =0x3C6EF35F
	adds r2, r2, r4
	mov r3, sl
	ldr r1, [r3, #4]
	asrs r1, r1, #8
	ldr r3, _08042008 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sl
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x30
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r1, #0x81
	bl sub_8039B54
_08041DFA:
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08041ED0
	ldr r0, _08041FFC @ =gUnknown_030053B8
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _08042000 @ =0x00196225
	mov r8, r1
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r6, _08042004 @ =0x3C6EF35F
	adds r0, r0, r6
	mov r3, sb
	str r0, [r3]
	movs r5, #0xf
	adds r4, r5, #0
	ands r4, r0
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	mov r1, sl
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r3, _08042008 @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r1, r4, #1
	subs r0, r0, r1
	lsls r4, r4, #2
	adds r0, r0, r4
	str r0, [sp, #0x14]
	mov r2, sb
	ldr r0, [r2]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r6
	ands r5, r2
	mov r1, sl
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r1, r5, #1
	subs r0, r0, r1
	lsls r5, r5, #2
	adds r0, r0, r5
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	mov r1, r8
	muls r1, r2, r1
	adds r1, r1, r6
	ldr r0, _08042018 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r2, sp
	mov r3, r8
	muls r3, r1, r3
	adds r1, r3, #0
	adds r1, r1, r6
	mov r0, sb
	str r1, [r0]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0xe0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r2, _0804201C @ =gUnknown_080D79D0
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08042020 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r1, #0x81
	mov r0, sp
	bl sub_8039B54
_08041ED0:
	movs r7, #0
	ldr r0, [sp, #0x20]
	adds r0, #0x40
	str r0, [sp, #0x28]
	ldr r1, _08042008 @ =gCamera
	mov sb, r1
	mov r5, sp
	ldr r2, _08041FFC @ =gUnknown_030053B8
	mov r8, r2
	ldr r6, _08042000 @ =0x00196225
_08041EE4:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #2
	ldr r3, [sp, #0x28]
	adds r0, r3, r2
	ldr r4, [r0]
	cmp r4, #0
	bne _08041F6A
	adds r0, r7, #4
	ldr r1, [sp, #0x24]
	cmp r1, r0
	beq _08041F02
	adds r0, #0x1a
	cmp r1, r0
	bne _08041F6A
_08041F02:
	mov r0, sl
	adds r0, #0x18
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, sl
	adds r0, #0x1c
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	strh r4, [r5, #0x1c]
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r3, _08042004 @ =0x3C6EF35F
	adds r2, r2, r3
	movs r1, #0x3f
	ands r1, r2
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r3
	mov r2, r8
	str r1, [r2]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x90
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r5, #8]
	strh r4, [r5, #0xa]
	str r4, [sp, #4]
	mov r0, sp
	mov r1, sl
	adds r1, #0x69
	bl sub_8039B54
_08041F6A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _08041EE4
	ldr r3, [sp, #0x24]
	cmp r3, #0x29
	beq _08041F7E
	cmp r3, #0x12
	bne _08041FEA
_08041F7E:
	mov r0, sl
	ldr r7, [r0, #0x64]
	cmp r7, #0
	bne _08041FEA
	ldr r0, [r0, #0x54]
	asrs r0, r0, #8
	ldr r2, _08042008 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	mov r1, sl
	ldr r0, [r1, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r5, sp
	ldr r6, _08041FFC @ =gUnknown_030053B8
	ldr r0, [r6]
	ldr r4, _08042000 @ =0x00196225
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, _08042004 @ =0x3C6EF35F
	adds r2, r2, r3
	movs r1, #0x3f
	ands r1, r2
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r4, r1
	adds r1, r1, r3
	str r1, [r6]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0x69
	bl sub_8039B54
_08041FEA:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041FFC: .4byte gUnknown_030053B8
_08042000: .4byte 0x00196225
_08042004: .4byte 0x3C6EF35F
_08042008: .4byte gCamera
_0804200C: .4byte 0x000001FF
_08042010: .4byte 0x06012980
_08042014: .4byte 0x0000026B
_08042018: .4byte 0x000003FF
_0804201C: .4byte gUnknown_080D79D0
_08042020: .4byte 0x06010000

	thumb_func_start sub_8042024
sub_8042024: @ 0x08042024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x18
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0
	str r1, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x82
	movs r0, #0x30
	strb r0, [r2]
	adds r2, #1
	movs r0, #3
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x84
	strb r1, [r0]
	adds r5, r7, #0
	adds r5, #0x88
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	ldr r2, _0804216C @ =gCamera
	ldr r4, [r2]
	adds r0, r0, r4
	lsls r0, r0, #8
	mov r3, ip
	str r0, [r3, #4]
	movs r6, #0x18
	ldrsh r0, [r5, r6]
	ldr r3, [r2, #4]
	adds r0, r0, r3
	lsls r0, r0, #8
	mov r2, ip
	str r0, [r2, #8]
	movs r2, #0xb8
	lsls r2, r2, #3
	mov r6, ip
	str r2, [r6, #0xc]
	str r1, [r6, #0x10]
	str r1, [r6, #0x14]
	movs r0, #0x90
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r6, #0x16
	ldrsh r0, [r5, r6]
	adds r0, r0, r4
	lsls r0, r0, #8
	mov r4, ip
	str r0, [r4, #0x54]
	movs r6, #0x18
	ldrsh r0, [r5, r6]
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r4, #0x58]
	str r2, [r4, #0x5c]
	str r1, [r4, #0x60]
	str r1, [r4, #0x64]
	movs r6, #0
	ldr r0, _08042170 @ =gSineTable
	mov r8, r0
	ldr r0, _08042174 @ =gUnknown_03005590
	ldr r1, [r0]
	ldr r2, _08042178 @ =0x000003FF
	mov sl, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [sp]
	mov sb, r6
_080420C2:
	lsls r0, r6, #7
	ldr r3, [sp]
	adds r0, r3, r0
	mov r4, sl
	ands r0, r4
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, [r7, #4]
	asrs r4, r4, #8
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0
	mov r2, sl
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r0, r2, #4
	adds r0, r0, r2
	adds r5, r6, #1
	muls r0, r5, r0
	asrs r0, r0, #0xe
	adds r4, r4, r0
	ldr r3, [r7, #8]
	asrs r3, r3, #8
	lsls r1, r1, #1
	add r1, r8
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	muls r0, r5, r0
	asrs r0, r0, #0xe
	adds r0, #0x14
	adds r3, r3, r0
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	mov r0, ip
	adds r0, #0x18
	adds r0, r0, r2
	lsls r4, r4, #8
	str r4, [r0]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r0, r2
	lsls r3, r3, #8
	str r3, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r0, r2
	movs r1, #0xb8
	lsls r1, r1, #3
	str r1, [r0]
	mov r0, ip
	adds r0, #0x24
	adds r0, r0, r2
	mov r1, sb
	str r1, [r0]
	mov r0, ip
	adds r0, #0x28
	adds r0, r0, r2
	str r1, [r0]
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _080420C2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804216C: .4byte gCamera
_08042170: .4byte gSineTable
_08042174: .4byte gUnknown_03005590
_08042178: .4byte 0x000003FF

	thumb_func_start sub_804217C
sub_804217C: @ 0x0804217C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x18
	adds r1, r2, #0
	adds r1, #0x80
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x18]
	adds r0, #1
	str r0, [r2, #0x18]
	cmp r0, #0xa
	bls _080421AC
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _080421AC
	ldr r0, [r5, #0x10]
	adds r0, #0x10
	str r0, [r5, #0x10]
_080421AC:
	ldr r1, [r5, #4]
	ldr r0, [r5, #0xc]
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r5, #8]
	ldr r2, [r5, #0x10]
	adds r0, r0, r2
	str r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #0xd
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08042238 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bgt _0804223C
	ldr r2, [r5, #0x10]
	cmp r2, #0
	blt _0804223C
	lsls r1, r1, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	str r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x6b
	ldrb r0, [r1]
	cmp r0, #0
	beq _08042228
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08042216
	str r0, [r5, #0x10]
	movs r0, #1
	str r0, [r5, #0x14]
_08042216:
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x80
	movs r3, #0x14
	bl sub_802B4F8
_08042228:
	ldr r0, [r5, #0xc]
	subs r0, #8
	str r0, [r5, #0xc]
	cmp r0, #0
	bge _0804224A
	movs r0, #0
	str r0, [r5, #0xc]
	b _0804224A
	.align 2, 0
_08042238: .4byte sub_801EE64
_0804223C:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0804224A
	lsls r1, r1, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
_0804224A:
	movs r0, #0
	str r0, [sp, #8]
	adds r1, r5, #0
	adds r1, #0x24
	str r1, [sp, #0x1c]
	adds r2, r5, #0
	adds r2, #0x18
	str r2, [sp, #0x10]
	adds r3, r5, #0
	adds r3, #0x20
	str r3, [sp, #0x18]
	adds r0, r5, #0
	adds r0, #0x1c
	str r0, [sp, #0x14]
	adds r1, #4
	str r1, [sp, #0xc]
_0804226A:
	ldr r0, [r5]
	ldr r2, [sp, #8]
	lsls r2, r2, #2
	mov sb, r2
	cmp r0, #0xa
	bls _08042290
	ldr r0, [sp, #8]
	add r0, sb
	lsls r1, r0, #2
	ldr r3, [sp, #0xc]
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08042290
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
_08042290:
	ldr r0, [sp, #8]
	add r0, sb
	lsls r7, r0, #2
	ldr r1, [sp, #0x10]
	adds r2, r1, r7
	ldr r3, [sp, #0x18]
	adds r3, r3, r7
	mov r8, r3
	ldr r0, [r2]
	ldr r1, [r3]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [sp, #0x14]
	adds r4, r0, r7
	ldr r1, [sp, #0x1c]
	adds r6, r1, r7
	ldr r0, [r4]
	ldr r1, [r6]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	adds r0, #7
	ldr r1, [r2]
	asrs r1, r1, #8
	movs r2, #0
	mov sl, r2
	str r2, [sp]
	ldr r2, _08042320 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bgt _08042324
	ldr r0, [r6]
	cmp r0, #0
	blt _08042324
	lsls r1, r1, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0xa
	bl Div
	str r0, [r6]
	movs r1, #0x30
	rsbs r1, r1, #0
	cmp r0, r1
	ble _0804230C
	mov r3, sl
	str r3, [r6]
	ldr r0, [sp, #0xc]
	adds r1, r0, r7
	movs r0, #1
	str r0, [r1]
_0804230C:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #8
	str r0, [r1]
	cmp r0, #0
	bge _08042340
	mov r2, sl
	str r2, [r1]
	b _08042340
	.align 2, 0
_08042320: .4byte sub_801EE64
_08042324:
	ldr r0, [sp, #8]
	add r0, sb
	lsls r2, r0, #2
	ldr r3, [sp, #0xc]
	adds r0, r3, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08042340
	ldr r0, [sp, #0x14]
	adds r2, r0, r2
	lsls r1, r1, #8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08042340:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #2
	bls _0804226A
	ldr r0, [r5]
	cmp r0, #0xa
	bls _08042360
	ldr r0, [r5, #0x64]
	cmp r0, #0
	bne _08042360
	ldr r0, [r5, #0x60]
	adds r0, #0x10
	str r0, [r5, #0x60]
_08042360:
	ldr r1, [r5, #0x54]
	ldr r0, [r5, #0x5c]
	adds r1, r1, r0
	str r1, [r5, #0x54]
	ldr r0, [r5, #0x58]
	ldr r2, [r5, #0x60]
	adds r0, r0, r2
	str r0, [r5, #0x58]
	asrs r0, r0, #8
	adds r0, #9
	asrs r1, r1, #8
	movs r4, #0
	str r4, [sp]
	ldr r2, _080423C8 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bgt _080423CC
	ldr r2, [r5, #0x60]
	cmp r2, #0
	blt _080423CC
	lsls r1, r1, #8
	ldr r0, [r5, #0x58]
	adds r0, r0, r1
	str r0, [r5, #0x58]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0xa
	bl Div
	str r0, [r5, #0x60]
	movs r1, #0x30
	rsbs r1, r1, #0
	cmp r0, r1
	ble _080423B8
	str r4, [r5, #0x60]
	movs r0, #1
	str r0, [r5, #0x64]
_080423B8:
	ldr r0, [r5, #0x5c]
	subs r0, #8
	str r0, [r5, #0x5c]
	cmp r0, #0
	bge _080423DA
	str r4, [r5, #0x5c]
	b _080423DA
	.align 2, 0
_080423C8: .4byte sub_801EE64
_080423CC:
	ldr r0, [r5, #0x64]
	cmp r0, #0
	beq _080423DA
	lsls r1, r1, #8
	ldr r0, [r5, #0x58]
	adds r0, r0, r1
	str r0, [r5, #0x58]
_080423DA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80423EC
sub_80423EC: @ 0x080423EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0xc0
	movs r0, #0
	mov sb, r0
	mov r1, r8
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	beq _080424B8
	subs r0, #1
	strb r0, [r1, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804241A
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08042420
_0804241A:
	movs r0, #0xeb
	bl m4aSongNumStart
_08042420:
	movs r0, #0x1e
	mov r2, r8
	strb r0, [r2, #0x16]
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0804249C
	movs r0, #0xa7
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #4
	strb r0, [r1]
	ldr r1, _08042488 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0804248C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _080424A8
	ldr r0, _08042490 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080424A8
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08042494 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0804247C
	movs r0, #0xff
_0804247C:
	strb r0, [r1]
	ldr r1, _08042498 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _080424A8
	.align 2, 0
_08042488: .4byte gUnknown_03005450
_0804248C: .4byte 0x0000C350
_08042490: .4byte gGameMode
_08042494: .4byte gUnknown_03005448
_08042498: .4byte gUnknown_030054A8
_0804249C:
	ldr r0, _080424B4 @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_080424A8:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	b _080424BC
	.align 2, 0
_080424B4: .4byte 0x00000275
_080424B8:
	movs r0, #1
	mov sb, r0
_080424BC:
	ldr r0, _080424E4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _080424D6
	mov r1, r8
	ldrb r0, [r1, #0x14]
	cmp r0, #4
	bne _080424D6
	ldr r1, _080424E8 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_080424D6:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080424E4: .4byte gCurrentLevel
_080424E8: .4byte gUnknown_030054A8

	thumb_func_start sub_80424EC
sub_80424EC: @ 0x080424EC
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0xc0
	ldrb r1, [r2, #0x16]
	cmp r1, #0
	beq _08042534
	movs r0, #0
	strb r0, [r2, #0x15]
	subs r0, r1, #1
	strb r0, [r2, #0x16]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042558
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0804251C
	movs r0, #0xa7
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r2, #0
	adds r1, #0xe0
	movs r0, #4
	b _08042526
_0804251C:
	movs r0, #0
	ldr r1, _08042530 @ =0x00000275
	strh r1, [r3, #0xa]
	adds r1, r2, #0
	adds r1, #0xe0
_08042526:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	b _08042554
	.align 2, 0
_08042530: .4byte 0x00000275
_08042534:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	beq _08042558
	subs r0, #1
	strb r0, [r2, #0x15]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042558
	movs r1, #0
	ldr r0, _0804255C @ =0x00000275
	strh r0, [r3, #0xa]
	adds r0, r2, #0
	adds r0, #0xe0
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0xe1
_08042554:
	movs r0, #0xff
	strb r0, [r1]
_08042558:
	pop {r0}
	bx r0
	.align 2, 0
_0804255C: .4byte 0x00000275

	thumb_func_start sub_8042560
sub_8042560: @ 0x08042560
	push {r4, r5, r6, r7, lr}
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _080425AC
	movs r3, #0
	ldr r0, _0804259C @ =gFlags
	mov ip, r0
	ldr r7, _080425A0 @ =gObjPalette
	ldr r6, _080425A4 @ =gUnknown_080D7F54
	ldr r5, _080425A8 @ =gUnknown_03005590
	movs r4, #2
_08042576:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08042576
	b _080425D0
	.align 2, 0
_0804259C: .4byte gFlags
_080425A0: .4byte gObjPalette
_080425A4: .4byte gUnknown_080D7F54
_080425A8: .4byte gUnknown_03005590
_080425AC:
	movs r3, #0
	ldr r1, _080425E4 @ =gFlags
	mov ip, r1
	ldr r4, _080425E8 @ =gObjPalette
	ldr r2, _080425EC @ =gUnknown_080D7F74
_080425B6:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _080425B6
_080425D0:
	mov r1, ip
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080425E4: .4byte gFlags
_080425E8: .4byte gObjPalette
_080425EC: .4byte gUnknown_080D7F74

	thumb_func_start sub_80425F0
sub_80425F0: @ 0x080425F0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08042660 @ =gUnknown_03005B4C
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _08042664 @ =IWRAM_START + 0x18
	adds r4, r2, r0
	ldr r0, [r1, #4]
	adds r0, r0, r5
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	ldr r0, [r4, #4]
	adds r0, r0, r5
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	adds r0, r0, r6
	str r0, [r4, #8]
	movs r3, #0
	ldr r0, _08042668 @ =IWRAM_START + 0x30
	adds r0, r0, r2
	mov ip, r0
	ldr r0, _0804266C @ =IWRAM_START + 0x34
	adds r7, r2, r0
_0804262A:
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	mov r0, ip
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0804262A
	ldr r0, [r4, #0x54]
	adds r0, r0, r5
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	adds r0, r0, r6
	str r0, [r4, #0x58]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042660: .4byte gUnknown_03005B4C
_08042664: .4byte IWRAM_START + 0x18
_08042668: .4byte IWRAM_START + 0x30
_0804266C: .4byte IWRAM_START + 0x34

	thumb_func_start sub_8042670
sub_8042670: @ 0x08042670
	push {r4, r5, lr}
	ldr r5, _080426BC @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_80424EC
	adds r0, r4, #0
	bl sub_8041880
	adds r0, r4, #0
	bl sub_8042560
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _080426B4
	movs r0, #0xb4
	strh r0, [r4, #0x12]
	ldr r1, [r5]
	ldr r0, _080426C0 @ =sub_80426C4
	str r0, [r1, #8]
_080426B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080426BC: .4byte gCurTask
_080426C0: .4byte sub_80426C4

	thumb_func_start sub_80426C4
sub_80426C4: @ 0x080426C4
	push {r4, r5, r6, lr}
	ldr r6, _08042730 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_804275C
	adds r0, r4, #0
	bl sub_8041B44
	adds r0, r4, #0
	bl sub_80424EC
	adds r0, r4, #0
	bl sub_8041BF8
	adds r0, r4, #0
	bl sub_8041880
	adds r0, r4, #0
	bl sub_8042560
	adds r0, r4, #0
	bl sub_8041A08
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0804272A
	ldr r0, _08042734 @ =IWRAM_START + 0x88
	adds r1, r5, r0
	ldr r0, _08042738 @ =0x00000295
	strh r0, [r1, #0xa]
	ldr r0, _0804273C @ =IWRAM_START + 0xA8
	adds r1, r5, r0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08042740 @ =IWRAM_START + 0xA9
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	bl sub_802A018
	adds r0, r4, #0
	bl sub_8042024
	ldr r1, [r6]
	ldr r0, _08042744 @ =sub_80417A0
	str r0, [r1, #8]
_0804272A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042730: .4byte gCurTask
_08042734: .4byte IWRAM_START + 0x88
_08042738: .4byte 0x00000295
_0804273C: .4byte IWRAM_START + 0xA8
_08042740: .4byte IWRAM_START + 0xA9
_08042744: .4byte sub_80417A0

	thumb_func_start sub_8042748
sub_8042748: @ 0x08042748
	push {lr}
	ldr r0, _08042758 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08042758: .4byte gCurTask

	thumb_func_start sub_804275C
sub_804275C: @ 0x0804275C
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	ldr r1, [r0, #4]
	adds r1, r1, r2
	str r1, [r0, #4]
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	ldr r1, [r0, #8]
	adds r1, r1, r2
	str r1, [r0, #8]
	bx lr
	.align 2, 0

	thumb_func_start sub_8042774
sub_8042774: @ 0x08042774
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0xc0
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _08042796
	ldr r0, _0804279C @ =0x00000275
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08042796:
	pop {r0}
	bx r0
	.align 2, 0
_0804279C: .4byte 0x00000275

	thumb_func_start sub_80427A0
sub_80427A0: @ 0x080427A0
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _080427E4 @ =IWRAM_START + 0x150
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080427E8 @ =IWRAM_START + 0x8C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080427EC @ =IWRAM_START + 0xC4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080427F0 @ =IWRAM_START + 0xF4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _080427F4 @ =IWRAM_START + 0x124
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _080427F8 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080427E4: .4byte IWRAM_START + 0x150
_080427E8: .4byte IWRAM_START + 0x8C
_080427EC: .4byte IWRAM_START + 0xC4
_080427F0: .4byte IWRAM_START + 0xF4
_080427F4: .4byte IWRAM_START + 0x124
_080427F8: .4byte gUnknown_03005B4C

	thumb_func_start sub_80427FC
sub_80427FC: @ 0x080427FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080428BC @ =sub_80428D8
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	ldr r1, _080428C0 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r4, r4, r0
	str r4, [r2, #4]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	subs r5, r5, r0
	str r5, [r2, #8]
	movs r5, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0xe]
	mov r0, r8
	str r0, [r2]
	str r6, [r2, #0x10]
	ldr r0, _080428C4 @ =IWRAM_START + 0x14
	adds r4, r3, r0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r1]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #0xa8
	lsls r1, r1, #1
	adds r6, r6, r1
	ldr r0, [r6]
	str r0, [r4, #4]
	movs r0, #0xa6
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _080428C8 @ =IWRAM_START + 0x34
	adds r0, r3, r1
	strb r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r0, _080428CC @ =IWRAM_START + 0x35
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080428D0 @ =IWRAM_START + 0x36
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080428D4 @ =IWRAM_START + 0x39
	adds r3, r3, r1
	strb r5, [r3]
	subs r0, #0x11
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080428BC: .4byte sub_80428D8
_080428C0: .4byte gCamera
_080428C4: .4byte IWRAM_START + 0x14
_080428C8: .4byte IWRAM_START + 0x34
_080428CC: .4byte IWRAM_START + 0x35
_080428D0: .4byte IWRAM_START + 0x36
_080428D4: .4byte IWRAM_START + 0x39

	thumb_func_start sub_80428D8
sub_80428D8: @ 0x080428D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _08042930 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0x14
	adds r6, r1, r0
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	cmp r0, #0xf
	bhi _08042938
	ldr r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #4]
	asrs r0, r0, #8
	ldr r4, _08042934 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldr r0, [r5]
	cmp r0, #0xf
	bne _0804298E
	movs r0, #0xf8
	bl m4aSongNumStart
	ldr r0, [r5, #0x10]
	ldr r1, [r4]
	lsls r1, r1, #8
	ldr r0, [r0, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	b _0804298E
	.align 2, 0
_08042930: .4byte gCurTask
_08042934: .4byte gCamera
_08042938:
	ldrh r0, [r5, #0xe]
	adds r0, #0x10
	strh r0, [r5, #0xe]
	ldr r0, _0804295C @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08042960
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	b _0804297C
	.align 2, 0
_0804295C: .4byte gPlayer
_08042960:
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	ldr r2, _08042A8C @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_0804297C:
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
_0804298E:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r7, _08042A8C @ =gCamera
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r1, [r5, #4]
	asrs r1, r1, #8
	ldr r2, [r7]
	adds r1, r1, r2
	movs r4, #0
	str r4, [sp]
	ldr r2, _08042A90 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08042A2C
	movs r0, #0xf9
	bl m4aSongNumStart
	movs r1, #0
	strh r4, [r5, #0xc]
	ldr r0, _08042A94 @ =0x00000297
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x10
	movs r2, #0x80
	movs r3, #0x14
	bl sub_802B4F8
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	movs r4, #0xc0
	lsls r4, r4, #3
	ldr r3, _08042A98 @ =0x000002E2
	str r3, [sp]
	adds r3, r4, #0
	bl sub_8042B8C
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	ldr r3, _08042A9C @ =0x0000031E
	str r3, [sp]
	adds r3, r4, #0
	bl sub_8042B8C
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	subs r4, #0x80
	movs r3, #0xb1
	lsls r3, r3, #2
	str r3, [sp]
	adds r3, r4, #0
	bl sub_8042B8C
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	movs r3, #0xcf
	lsls r3, r3, #2
	str r3, [sp]
	adds r3, r4, #0
	bl sub_8042B8C
	ldr r0, _08042AA0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08042AA4 @ =sub_8042AB0
	str r0, [r1, #8]
_08042A2C:
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _08042A76
	ldr r1, [r5, #4]
	asrs r1, r1, #8
	ldr r0, [r7]
	adds r1, r1, r0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	ldr r0, [r7, #4]
	adds r2, r2, r0
	ldr r0, _08042AA8 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _08042A76
	ldr r2, [r5, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _08042A76
	adds r1, r2, #0
	adds r1, #0xc0
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _08042AAC @ =0x00000275
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0xe0
	strb r3, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08042A76:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042A8C: .4byte gCamera
_08042A90: .4byte sub_801EE64
_08042A94: .4byte 0x00000297
_08042A98: .4byte 0x000002E2
_08042A9C: .4byte 0x0000031E
_08042AA0: .4byte gCurTask
_08042AA4: .4byte sub_8042AB0
_08042AA8: .4byte gPlayer
_08042AAC: .4byte 0x00000275

	thumb_func_start sub_8042AB0
sub_8042AB0: @ 0x08042AB0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08042AE0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r2, _08042AE4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08042AE8
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	b _08042B04
	.align 2, 0
_08042AE0: .4byte gCurTask
_08042AE4: .4byte gPlayer
_08042AE8:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r2, _08042B7C @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r1, [r2, #0x3c]
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_08042B04:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _08042B5A
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r3, _08042B7C @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r6, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _08042B5A
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _08042B5A
	adds r1, r2, #0
	adds r1, #0xc0
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _08042B80 @ =0x00000275
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0xe0
	strb r3, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08042B5A:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _08042B6C
	ldr r0, _08042B84 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08042B88 @ =sub_8042DF4
	str r0, [r1, #8]
_08042B6C:
	adds r0, r5, #0
	bl sub_80051E8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042B7C: .4byte gCamera
_08042B80: .4byte 0x00000275
_08042B84: .4byte gCurTask
_08042B88: .4byte sub_8042DF4

	thumb_func_start sub_8042B8C
sub_8042B8C: @ 0x08042B8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sl, r1
	mov sb, r2
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08042C40 @ =sub_8042CCC
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	mov r2, sl
	str r2, [r1, #4]
	mov r5, sb
	str r5, [r1, #8]
	ldr r2, _08042C44 @ =gSineTable
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r6, [sp, #4]
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	muls r0, r5, r0
	asrs r0, r0, #0xe
	movs r6, #0
	mov sb, r6
	strh r0, [r1, #0xc]
	lsls r4, r4, #1
	adds r4, r4, r2
	movs r2, #0
	ldrsh r0, [r4, r2]
	muls r0, r5, r0
	asrs r0, r0, #0xe
	strh r0, [r1, #0xe]
	mov r5, r8
	str r5, [r1]
	str r7, [r1, #0x10]
	ldr r6, _08042C48 @ =IWRAM_START + 0x14
	adds r4, r3, r6
	mov r0, sl
	asrs r6, r0, #8
	strh r6, [r4, #0x16]
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	ldr r2, _08042C4C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _08042C50 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08042C54 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08042C5C
	movs r2, #0xa8
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r0, r5
	str r0, [r4, #4]
	ldr r0, _08042C58 @ =0x0000029A
	b _08042C6E
	.align 2, 0
_08042C40: .4byte sub_8042CCC
_08042C44: .4byte gSineTable
_08042C48: .4byte IWRAM_START + 0x14
_08042C4C: .4byte gUnknown_030053B8
_08042C50: .4byte 0x00196225
_08042C54: .4byte 0x3C6EF35F
_08042C58: .4byte 0x0000029A
_08042C5C:
	movs r2, #0xa8
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	movs r5, #0xa4
	lsls r5, r5, #3
	adds r0, r0, r5
	str r0, [r4, #4]
	ldr r0, _08042CC4 @ =0x0000029B
_08042C6E:
	strh r0, [r4, #0xa]
	ldr r6, _08042CC8 @ =IWRAM_START + 0x34
	adds r0, r3, r6
	mov r1, sb
	strb r1, [r0]
	movs r2, #0
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042CC4: .4byte 0x0000029B
_08042CC8: .4byte IWRAM_START + 0x34

	thumb_func_start sub_8042CCC
sub_8042CCC: @ 0x08042CCC
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _08042D0C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldrh r0, [r4, #0xe]
	adds r0, #0x50
	strh r0, [r4, #0xe]
	ldr r0, _08042D10 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08042D18
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r2, _08042D14 @ =gCamera
	b _08042D3A
	.align 2, 0
_08042D0C: .4byte gCurTask
_08042D10: .4byte gPlayer
_08042D14: .4byte gCamera
_08042D18:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r2, _08042D7C @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_08042D3A:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	movs r3, #0
	strh r0, [r5, #0x16]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	adds r0, r0, r1
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r2, [r2]
	adds r1, r1, r2
	str r3, [sp]
	ldr r2, _08042D80 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08042D88
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08042D88
	ldr r0, _08042D84 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08042DE0
	.align 2, 0
_08042D7C: .4byte gCamera
_08042D80: .4byte sub_801EE64
_08042D84: .4byte gCurTask
_08042D88:
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _08042DD4
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r3, _08042DE8 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	ldr r0, _08042DEC @ =gPlayer
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _08042DD4
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _08042DD4
	adds r1, r2, #0
	adds r1, #0xc0
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _08042DF0 @ =0x00000275
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0xe0
	strb r3, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08042DD4:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08042DE0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042DE8: .4byte gCamera
_08042DEC: .4byte gPlayer
_08042DF0: .4byte 0x00000275

	thumb_func_start sub_8042DF4
sub_8042DF4: @ 0x08042DF4
	push {lr}
	ldr r0, _08042E04 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08042E04: .4byte gCurTask

	thumb_func_start sub_8042E08
sub_8042E08: @ 0x08042E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	ldr r2, _08042ED0 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08042ED4 @ =gBgCntRegs
	movs r4, #0
	movs r5, #0
	ldr r0, _08042ED8 @ =0x0000560D
	strh r0, [r1]
	ldr r0, _08042EDC @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	ldr r0, _08042EE0 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _08042EE4 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x40
	strb r0, [r1, #3]
	ldr r2, _08042EE8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _08042EEC @ =gUnknown_030053B8
	ldr r0, _08042EF0 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0xfd
	bl m4aSongNumStart
	ldr r1, _08042EF4 @ =gUnknown_03005AF0
	ldr r0, [r1, #0x1c]
	ldr r3, _08042EF8 @ =0xFFFFCFFF
	ands r0, r3
	movs r2, #0x80
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r1, _08042EFC @ =gUnknown_03005AA0
	ldr r0, [r1, #0x1c]
	ands r0, r3
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _08042F00 @ =sub_80434AC
	movs r1, #0x96
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _08042F04 @ =sub_80459CC
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _08042F08 @ =gUnknown_03005B4C
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r4, _08042F0C @ =IWRAM_START + 0x134
	adds r0, r0, r4
	strh r5, [r0]
	strh r5, [r0, #4]
	movs r1, #2
	strh r1, [r0, #2]
	strh r5, [r0, #6]
	ldr r1, _08042F10 @ =0x000030EF
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	ldr r0, _08042F14 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042F1C
	ldr r0, _08042F18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _08042F1C
	movs r0, #6
	mov r6, sl
	strb r0, [r6, #0x10]
	movs r0, #2
	strb r0, [r6, #0x11]
	b _08042F26
	.align 2, 0
_08042ED0: .4byte gDispCnt
_08042ED4: .4byte gBgCntRegs
_08042ED8: .4byte 0x0000560D
_08042EDC: .4byte gBgScrollRegs
_08042EE0: .4byte gUnknown_03004D80
_08042EE4: .4byte gUnknown_03002280
_08042EE8: .4byte gPlayer
_08042EEC: .4byte gUnknown_030053B8
_08042EF0: .4byte gUnknown_03005590
_08042EF4: .4byte gUnknown_03005AF0
_08042EF8: .4byte 0xFFFFCFFF
_08042EFC: .4byte gUnknown_03005AA0
_08042F00: .4byte sub_80434AC
_08042F04: .4byte sub_80459CC
_08042F08: .4byte gUnknown_03005B4C
_08042F0C: .4byte IWRAM_START + 0x134
_08042F10: .4byte 0x000030EF
_08042F14: .4byte gUnknown_030054EC
_08042F18: .4byte gGameMode
_08042F1C:
	movs r0, #8
	mov r1, sl
	strb r0, [r1, #0x10]
	movs r0, #4
	strb r0, [r1, #0x11]
_08042F26:
	ldr r1, _08042F54 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _08042F5C
	mov r2, sl
	ldrb r0, [r2, #0x10]
	lsrs r0, r0, #1
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x11]
	lsrs r0, r0, #1
	strb r0, [r2, #0x11]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _08042F5C
	ldr r0, _08042F58 @ =0x005A0400
	str r0, [r2, #4]
	movs r0, #0x8c
	lsls r0, r0, #8
	str r0, [r2, #8]
	b _08042F6A
	.align 2, 0
_08042F54: .4byte gCurrentLevel
_08042F58: .4byte 0x005A0400
_08042F5C:
	movs r0, #0x87
	lsls r0, r0, #0xa
	mov r3, sl
	str r0, [r3, #4]
	movs r0, #0x8c
	lsls r0, r0, #8
	str r0, [r3, #8]
_08042F6A:
	movs r3, #0x98
	lsls r3, r3, #1
	add r3, sl
	movs r2, #0
	movs r1, #0
	movs r0, #0x50
	strh r0, [r3]
	movs r3, #0xa0
	lsls r3, r3, #3
	mov r4, sl
	strh r3, [r4, #0xc]
	strh r1, [r4, #0xe]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x13]
	ldr r0, _0804316C @ =0x00000155
	strh r0, [r4, #0x16]
	strh r1, [r4, #0x18]
	ldr r0, _08043170 @ =0x000002AA
	strh r0, [r4, #0x30]
	subs r0, #0xaa
	strh r0, [r4, #0x1a]
	ldr r0, _08043174 @ =gUnknown_080D7F94
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	strb r2, [r4, #0x1e]
	strh r1, [r4, #0x34]
	mov r0, sl
	adds r0, #0xb6
	strb r2, [r0]
	strh r1, [r4, #0x32]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strb r2, [r4, #0x1f]
	strh r3, [r4, #0x22]
	strh r1, [r4, #0x24]
	str r1, [r4, #0x28]
	str r1, [r4, #0x2c]
	subs r0, #0xa0
	strb r2, [r0]
	strb r2, [r4, #0x14]
	strb r2, [r4, #0x15]
	movs r2, #0
	movs r6, #0xb0
	lsls r6, r6, #1
	add r6, sl
	ldr r0, _08043178 @ =0x00000161
	add r0, sl
	mov r8, r0
	movs r1, #0xb1
	lsls r1, r1, #1
	add r1, sl
	mov sb, r1
	ldr r3, _0804317C @ =0x00000165
	add r3, sl
	str r3, [sp, #0x48]
	movs r4, #0xc8
	lsls r4, r4, #1
	add r4, sl
	str r4, [sp, #0x5c]
	ldr r0, _08043180 @ =0x00000191
	add r0, sl
	str r0, [sp, #0x60]
	movs r1, #0xc9
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x64]
	ldr r3, _08043184 @ =0x00000195
	add r3, sl
	str r3, [sp, #0x68]
	movs r4, #0x8e
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x38]
	ldr r0, _08043188 @ =0x00000239
	add r0, sl
	str r0, [sp, #0x3c]
	ldr r1, _0804318C @ =0x0000023A
	add r1, sl
	str r1, [sp, #0x40]
	ldr r3, _08043190 @ =0x0000023D
	add r3, sl
	str r3, [sp, #0x44]
	movs r4, #0x80
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x18]
	ldr r0, _08043194 @ =0x00000201
	add r0, sl
	str r0, [sp, #0x1c]
	ldr r1, _08043198 @ =0x00000202
	add r1, sl
	str r1, [sp, #0x20]
	ldr r3, _0804319C @ =0x00000205
	add r3, sl
	str r3, [sp, #0x24]
	movs r4, #0x9f
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x4c]
	ldr r0, _080431A0 @ =0x0000027D
	add r0, sl
	str r0, [sp, #0x50]
	ldr r1, _080431A4 @ =0x0000027E
	add r1, sl
	str r1, [sp, #0x54]
	ldr r3, _080431A8 @ =0x00000281
	add r3, sl
	str r3, [sp, #0x58]
	movs r4, #0xab
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x6c]
	ldr r0, _080431AC @ =0x000002AD
	add r0, sl
	str r0, [sp, #0x70]
	ldr r1, _080431B0 @ =0x000002AE
	add r1, sl
	str r1, [sp, #0x74]
	ldr r3, _080431B4 @ =0x000002B1
	add r3, sl
	str r3, [sp, #0x78]
	movs r4, #0xb9
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #8]
	ldr r0, _080431B8 @ =0x000002E5
	add r0, sl
	str r0, [sp, #0xc]
	ldr r1, _080431BC @ =0x000002E6
	add r1, sl
	str r1, [sp, #0x10]
	ldr r3, _080431C0 @ =0x000002E9
	add r3, sl
	str r3, [sp, #0x14]
	movs r4, #0xc5
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x28]
	ldr r0, _080431C4 @ =0x00000315
	add r0, sl
	str r0, [sp, #0x2c]
	ldr r1, _080431C8 @ =0x00000316
	add r1, sl
	str r1, [sp, #0x30]
	ldr r3, _080431CC @ =0x00000319
	add r3, sl
	str r3, [sp, #0x34]
	mov r5, sl
	adds r5, #0x36
	movs r3, #0
	mov r4, sl
	adds r4, #0x76
_080430B0:
	lsls r1, r2, #1
	adds r0, r5, r1
	strh r3, [r0]
	adds r1, r4, r1
	strh r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _080430B0
	movs r0, #0xea
	bl VramMalloc
	adds r3, r0, #0
	ldr r0, _080431D0 @ =0x000004AC
	add r0, sl
	str r3, [r0]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r3, r3, r4
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r7, #0xa0
	lsls r7, r7, #1
	add r7, sl
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r0, _080431D4 @ =0x0600C000
	str r0, [r7, #4]
	ldr r0, _080431AC @ =0x000002AD
	strh r0, [r7, #0xa]
	strb r5, [r6]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	mov r6, r8
	strb r0, [r6]
	movs r0, #0x10
	mov r1, sb
	strb r0, [r1]
	ldr r2, [sp, #0x48]
	strb r5, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r0, #0x86
	lsls r0, r0, #0xb
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_80036E0
	adds r0, r7, #0
	bl sub_8003914
	movs r7, #0xd8
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r3, r3, r4
	ldr r2, _080431D8 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _080431E8
	ldr r0, _080431DC @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080431E8
	ldr r0, _080431E0 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _080431E8
	ldr r0, _080431E4 @ =0x0000013B
	strh r0, [r7, #0xa]
	adds r0, #0x95
	add r0, sl
	strb r5, [r0]
	b _080431F6
	.align 2, 0
_0804316C: .4byte 0x00000155
_08043170: .4byte 0x000002AA
_08043174: .4byte gUnknown_080D7F94
_08043178: .4byte 0x00000161
_0804317C: .4byte 0x00000165
_08043180: .4byte 0x00000191
_08043184: .4byte 0x00000195
_08043188: .4byte 0x00000239
_0804318C: .4byte 0x0000023A
_08043190: .4byte 0x0000023D
_08043194: .4byte 0x00000201
_08043198: .4byte 0x00000202
_0804319C: .4byte 0x00000205
_080431A0: .4byte 0x0000027D
_080431A4: .4byte 0x0000027E
_080431A8: .4byte 0x00000281
_080431AC: .4byte 0x000002AD
_080431B0: .4byte 0x000002AE
_080431B4: .4byte 0x000002B1
_080431B8: .4byte 0x000002E5
_080431BC: .4byte 0x000002E6
_080431C0: .4byte 0x000002E9
_080431C4: .4byte 0x00000315
_080431C8: .4byte 0x00000316
_080431CC: .4byte 0x00000319
_080431D0: .4byte 0x000004AC
_080431D4: .4byte 0x0600C000
_080431D8: .4byte gCurrentLevel
_080431DC: .4byte gSelectedCharacter
_080431E0: .4byte gLoadedSaveGame
_080431E4: .4byte 0x0000013B
_080431E8:
	movs r0, #0
	movs r1, #0xab
	lsls r1, r1, #2
	strh r1, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
_080431F6:
	movs r5, #0
	movs r4, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	mov sb, r0
	str r0, [r7, #0x10]
	movs r7, #0xb8
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	movs r1, #0x90
	lsls r1, r1, #3
	adds r3, r3, r1
	ldr r0, _0804348C @ =0x0000029D
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x5c]
	strb r5, [r2]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r6, #0
	ldr r6, [sp, #0x60]
	strb r0, [r6]
	mov r1, r8
	ldr r0, [sp, #0x64]
	strb r1, [r0]
	ldr r2, [sp, #0x68]
	strb r5, [r2]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_8004558
	movs r7, #0x86
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r3, r3, r1
	ldr r0, _08043490 @ =0x0000029F
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x38]
	strb r5, [r2]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r6, #0
	ldr r6, [sp, #0x3c]
	strb r0, [r6]
	mov r1, r8
	ldr r0, [sp, #0x40]
	strb r1, [r0]
	ldr r2, [sp, #0x44]
	strb r5, [r2]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	movs r7, #0xf0
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r3, r1
	ldr r0, _08043494 @ =0x000002AA
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x18]
	strb r5, [r2]
	movs r0, #0xb8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r6, #0
	ldr r6, [sp, #0x1c]
	strb r0, [r6]
	mov r1, r8
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	ldr r2, [sp, #0x24]
	strb r5, [r2]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	ldr r2, _08043498 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r7, #0x10]
	movs r7, #0x97
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	adds r3, #0x80
	ldr r0, _0804349C @ =0x000002AB
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x4c]
	strb r5, [r0]
	movs r6, #0x98
	lsls r6, r6, #3
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x50]
	strb r0, [r1]
	mov r0, r8
	ldr r2, [sp, #0x54]
	strb r0, [r2]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	movs r7, #0xa3
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r3, r3, r1
	ldr r0, _080434A0 @ =0x0000029E
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x6c]
	strb r5, [r2]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x70]
	strb r0, [r1]
	mov r0, r8
	ldr r2, [sp, #0x74]
	strb r0, [r2]
	ldr r1, [sp, #0x78]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_8004558
	movs r7, #0xb1
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	adds r3, #0x80
	ldr r0, _080434A4 @ =0x000002A9
	strh r0, [r7, #0xa]
	ldr r1, [sp, #8]
	strb r5, [r1]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	mov r0, r8
	ldr r6, [sp, #0x10]
	strb r0, [r6]
	ldr r1, [sp, #0x14]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r6, sb
	str r6, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_8004558
	movs r7, #0xbd
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x28]
	strb r5, [r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x2c]
	strb r0, [r1]
	mov r3, r8
	ldr r2, [sp, #0x30]
	strb r3, [r2]
	ldr r4, [sp, #0x34]
	strb r5, [r4]
	str r0, [r7, #0x28]
	str r0, [r7, #0x30]
	str r6, [r7, #0x10]
	movs r2, #0
	movs r3, #0
	ldr r4, _080434A8 @ =gUnknown_080D7FB0
_08043414:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r6, #0xcb
	lsls r6, r6, #2
	adds r0, r0, r6
	mov r1, sl
	adds r7, r1, r0
	strh r3, [r7, #0x16]
	strh r3, [r7, #0x18]
	ldr r6, [sp, #4]
	str r6, [r7, #4]
	lsls r1, r2, #3
	adds r1, r1, r4
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r6, r6, r0
	str r6, [sp, #4]
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xb0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _08043414
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804348C: .4byte 0x0000029D
_08043490: .4byte 0x0000029F
_08043494: .4byte 0x000002AA
_08043498: .4byte gUnknown_030054B8
_0804349C: .4byte 0x000002AB
_080434A0: .4byte 0x0000029E
_080434A4: .4byte 0x000002A9
_080434A8: .4byte gUnknown_080D7FB0

	thumb_func_start sub_80434AC
sub_80434AC: @ 0x080434AC
	push {r4, r5, r6, lr}
	ldr r6, _08043518 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_80444DC
	adds r0, r4, #0
	bl sub_8044784
	ldr r1, _0804351C @ =gUnknown_080D7F98
	ldr r2, _08043520 @ =IWRAM_START + 0xBF
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_80459A0
	adds r0, r4, #0
	bl sub_80454A4
	adds r0, r4, #0
	bl sub_80438C4
	adds r0, r4, #0
	bl sub_8045898
	ldr r0, _08043524 @ =IWRAM_START + 0x130
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08043512
	ldr r1, [r6]
	ldr r0, _08043528 @ =sub_804352C
	str r0, [r1, #8]
_08043512:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043518: .4byte gCurTask
_0804351C: .4byte gUnknown_080D7F98
_08043520: .4byte IWRAM_START + 0xBF
_08043524: .4byte IWRAM_START + 0x130
_08043528: .4byte sub_804352C

	thumb_func_start sub_804352C
sub_804352C: @ 0x0804352C
	push {r4, r5, r6, lr}
	ldr r6, _080435A8 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80444DC
	adds r0, r5, #0
	bl sub_8044784
	ldr r1, _080435AC @ =gUnknown_080D7F98
	ldr r0, _080435B0 @ =IWRAM_START + 0xBF
	adds r4, r4, r0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_80459A0
	adds r0, r5, #0
	bl sub_8044088
	adds r0, r5, #0
	bl sub_80454A4
	adds r0, r5, #0
	bl sub_80438C4
	adds r0, r5, #0
	bl sub_8043E2C
	adds r0, r5, #0
	bl sub_8045898
	ldrb r1, [r5, #0x10]
	cmp r1, #0
	bne _080435A2
	ldr r0, _080435B4 @ =gBldRegs
	movs r4, #0
	strh r1, [r0]
	bl sub_802A018
	adds r0, r5, #0
	bl sub_80436E4
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r5, #0xc]
	strb r4, [r5, #0x11]
	ldr r1, [r6]
	ldr r0, _080435B8 @ =sub_80435BC
	str r0, [r1, #8]
_080435A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080435A8: .4byte gCurTask
_080435AC: .4byte gUnknown_080D7F98
_080435B0: .4byte IWRAM_START + 0xBF
_080435B4: .4byte gBldRegs
_080435B8: .4byte sub_80435BC

	thumb_func_start sub_80435BC
sub_80435BC: @ 0x080435BC
	push {r4, r5, lr}
	ldr r0, _08043644 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8044540
	adds r0, r4, #0
	bl sub_8043BEC
	adds r0, r4, #0
	bl sub_8043E2C
	adds r0, r4, #0
	bl sub_8045564
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080435EC
	subs r0, #1
	strb r0, [r4, #0x13]
_080435EC:
	ldr r0, _08043648 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _08043600
	movs r0, #0x90
	bl m4aSongNumStart
_08043600:
	ldr r2, _0804364C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _08043660
	ldr r0, _08043650 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08043660
	ldr r0, _08043654 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _08043660
	ldrb r0, [r4, #0x15]
	ldr r1, _08043658 @ =IWRAM_START + 0xC4
	adds r5, r5, r1
	cmp r0, #0
	bne _080436A0
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, _0804365C @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _080436A0
	movs r0, #1
	strb r0, [r4, #0x15]
	b _080436A0
	.align 2, 0
_08043644: .4byte gCurTask
_08043648: .4byte gUnknown_03005590
_0804364C: .4byte gCurrentLevel
_08043650: .4byte gSelectedCharacter
_08043654: .4byte gLoadedSaveGame
_08043658: .4byte IWRAM_START + 0xC4
_0804365C: .4byte gCamera
_08043660:
	ldrb r0, [r4, #0x15]
	adds r5, r4, #0
	adds r5, #0xc4
	cmp r0, #0
	bne _080436A0
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r2, _080436D8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _080436A0
	movs r0, #1
	strb r0, [r4, #0x15]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0xc8
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
_080436A0:
	adds r0, r4, #0
	bl sub_8045898
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, _080436D8 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080436D2
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080436D2
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x8c
	movs r2, #4
	bl sub_802EF68
	ldr r0, _080436DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080436E0 @ =sub_804598C
	str r0, [r1, #8]
_080436D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080436D8: .4byte gCamera
_080436DC: .4byte gCurTask
_080436E0: .4byte sub_804598C

	thumb_func_start sub_80436E4
sub_80436E4: @ 0x080436E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov ip, r0
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	mov r2, ip
	adds r2, #0xc4
	ldr r4, _080438A4 @ =gSineTable
	mov r1, ip
	ldrh r0, [r1, #0x16]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r0, r6, r0
	str r0, [r2]
	adds r2, #4
	mov r1, ip
	ldrh r0, [r1, #0x16]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r0, r7, r0
	str r0, [r2]
	mov r1, ip
	adds r1, #0xd4
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080438A8 @ =0x0000FB80
	strh r0, [r1]
	mov r0, ip
	ldrh r2, [r0, #0x30]
	adds r3, r2, r3
	lsls r3, r3, #1
	adds r3, r3, r4
	movs r5, #0
	ldrsh r1, [r3, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r6, r6, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r7, r7, r0
	mov r0, ip
	adds r0, #0xcc
	str r6, [r0]
	adds r0, #4
	str r7, [r0]
	mov r1, ip
	adds r1, #0xd8
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r6, r6, r1
	ldr r2, _080438AC @ =0xFFFFEF00
	adds r7, r7, r2
	movs r3, #0
	mov r8, r3
	mov sb, r3
	movs r5, #0
	movs r0, #0x86
	lsls r0, r0, #1
	add r0, ip
	str r0, [sp]
	subs r1, #0xf2
	add r1, ip
	str r1, [sp, #4]
	mov r2, ip
	adds r2, #0xb6
	str r2, [sp, #8]
	mov r3, ip
	adds r3, #0x36
	str r3, [sp, #0x10]
	mov r0, ip
	adds r0, #0x76
	str r0, [sp, #0xc]
_080437B4:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	subs r1, #1
	adds r4, r5, #1
	lsls r0, r4, #2
	subs r1, r1, r0
	movs r2, #0x1f
	mov sl, r2
	mov r3, sl
	ands r1, r3
	lsls r1, r1, #1
	mov r0, ip
	adds r0, #0x36
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	add r8, r0
	mov r0, ip
	adds r0, #0x76
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #8
	add sb, r0
	lsls r2, r5, #3
	mov r1, ip
	adds r1, #0xdc
	adds r1, r1, r2
	mov r3, r8
	asrs r0, r3, #3
	adds r0, r6, r0
	str r0, [r1]
	mov r1, ip
	adds r1, #0xe0
	adds r1, r1, r2
	mov r2, sb
	asrs r0, r2, #3
	adds r0, r7, r0
	str r0, [r1]
	lsls r2, r5, #2
	ldr r0, [sp]
	adds r3, r0, r2
	ldr r0, _080438B0 @ =gUnknown_030053B8
	ldr r1, [r0]
	ldr r0, _080438B4 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _080438B8 @ =0x3C6EF35F
	adds r1, r1, r0
	ldr r0, _080438B0 @ =gUnknown_030053B8
	str r1, [r0]
	movs r0, #0xff
	ands r1, r0
	movs r0, #0xa8
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3]
	ldr r1, [sp, #4]
	adds r2, r1, r2
	lsls r1, r5, #6
	ldr r3, _080438BC @ =0xFFFFFC00
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r2]
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	cmp r5, #5
	bls _080437B4
	ldr r5, [sp, #8]
	ldrb r1, [r5]
	adds r1, #0xe5
	mov r0, sl
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, [sp, #0x10]
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #7
	add r8, r0
	ldr r5, [sp, #0xc]
	adds r1, r5, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #7
	add sb, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	mov r3, r8
	asrs r0, r3, #3
	adds r0, r6, r0
	str r0, [r1]
	movs r1, #0x94
	lsls r1, r1, #1
	add r1, ip
	mov r5, sb
	asrs r0, r5, #3
	adds r0, r7, r0
	str r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1]
	movs r1, #0x97
	lsls r1, r1, #1
	add r1, ip
	ldr r0, _080438C0 @ =0x0000FA40
	strh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080438A4: .4byte gSineTable
_080438A8: .4byte 0x0000FB80
_080438AC: .4byte 0xFFFFEF00
_080438B0: .4byte gUnknown_030053B8
_080438B4: .4byte 0x00196225
_080438B8: .4byte 0x3C6EF35F
_080438BC: .4byte 0xFFFFFC00
_080438C0: .4byte 0x0000FA40

	thumb_func_start sub_80438C4
sub_80438C4: @ 0x080438C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r2, _08043914 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp]
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	ldr r1, _08043918 @ =gBgScrollRegs
	movs r0, #0x3c
	ldr r2, [sp]
	subs r0, r0, r2
	strh r0, [r1]
	movs r0, #0x36
	ldr r3, [sp, #4]
	subs r0, r0, r3
	strh r0, [r1, #2]
	adds r1, r2, #0
	adds r1, #0x32
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bls _08043924
	ldr r2, _0804391C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08043920 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08043932
	.align 2, 0
_08043914: .4byte gCamera
_08043918: .4byte gBgScrollRegs
_0804391C: .4byte gDispCnt
_08043920: .4byte 0x0000FEFF
_08043924:
	ldr r0, _08043BDC @ =gDispCnt
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r0]
_08043932:
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r5, r6, r0
	ldr r7, _08043BE0 @ =gSineTable
	ldrh r0, [r6, #0x16]
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp]
	adds r0, r3, r0
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r5, r6, r2
	ldrh r0, [r6, #0x16]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r4, [sp]
	adds r0, r4, r0
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp, #4]
	adds r0, r3, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	beq _08043AAA
	movs r4, #0x86
	lsls r4, r4, #2
	adds r5, r6, r4
	ldrh r0, [r6, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp]
	adds r0, r3, r0
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r5, r6, r2
	movs r3, #0x94
	lsls r3, r3, #2
	adds r4, r6, r3
	ldrh r0, [r6, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp]
	adds r0, r3, r0
	subs r0, #2
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp, #4]
	adds r0, r3, r0
	subs r0, #0x13
	strh r0, [r5, #0x18]
	ldr r2, _08043BE4 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0x10]
	ldrh r0, [r6, #0x1a]
	strh r0, [r4]
	mov r0, r8
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08043BE8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043AAA
	ldrh r0, [r6, #0x1c]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa
	bhi _08043AAA
	movs r1, #0x97
	lsls r1, r1, #2
	adds r5, r6, r1
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08043AAA:
	movs r2, #0xa3
	lsls r2, r2, #2
	adds r5, r6, r2
	ldr r3, _08043BE0 @ =gSineTable
	ldrh r2, [r6, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r1, [sp]
	adds r1, r1, r0
	str r1, [sp]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r4, [sp, #4]
	adds r4, r4, r0
	str r4, [sp, #4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	strh r4, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r2, [sp]
	adds r2, #2
	str r2, [sp]
	ldr r3, [sp, #4]
	subs r3, #0x11
	str r3, [sp, #4]
	movs r7, #0
	movs r3, #0
	movs r4, #0xb1
	lsls r4, r4, #2
	adds r5, r6, r4
	movs r2, #0
	movs r0, #0xb6
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x36
	adds r1, r1, r6
	mov sb, r1
	movs r4, #0x76
	adds r4, r4, r6
	mov sl, r4
	adds r0, r6, #0
	adds r0, #0xc0
	str r0, [sp, #8]
_08043B20:
	adds r1, r2, #1
	str r1, [sp, #0x10]
	lsls r1, r1, #2
	mov r4, r8
	ldrb r0, [r4]
	subs r0, r0, r1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #1
	mov r4, sb
	adds r4, r4, r0
	mov ip, r4
	movs r1, #0
	ldrsh r4, [r4, r1]
	mov ip, r4
	add r7, ip
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r3, r3, r0
	asrs r0, r7, #3
	ldr r1, [sp]
	adds r0, r1, r0
	strh r0, [r5, #0x16]
	asrs r0, r3, #3
	ldr r4, [sp, #4]
	adds r0, r4, r0
	strh r0, [r5, #0x18]
	movs r0, #0x13
	subs r0, r0, r2
	lsls r0, r0, #6
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	str r3, [sp, #0xc]
	bl sub_80051E8
	ldr r0, [sp, #0x10]
	lsls r4, r0, #0x18
	lsrs r2, r4, #0x18
	ldr r3, [sp, #0xc]
	cmp r2, #5
	bls _08043B20
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r5, r6, r1
	mov r2, r8
	ldrb r1, [r2]
	subs r1, #0x1c
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #1
	mov r2, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r7, r7, r0
	add r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r3, r3, r0
	asrs r0, r7, #3
	ldr r1, [sp]
	adds r4, r1, r0
	strh r4, [r5, #0x16]
	asrs r0, r3, #3
	ldr r2, [sp, #4]
	adds r7, r2, r0
	strh r7, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	cmp r0, #0
	beq _08043BCC
	adds r1, r4, #0
	subs r1, #0x10
	adds r0, r6, #0
	adds r2, r7, #0
	bl sub_8043D94
_08043BCC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043BDC: .4byte gDispCnt
_08043BE0: .4byte gSineTable
_08043BE4: .4byte gUnknown_030054B8
_08043BE8: .4byte gPlayer

	thumb_func_start sub_8043BEC
sub_8043BEC: @ 0x08043BEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r3, _08043C2C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	subs r2, r2, r0
	ldr r3, _08043C30 @ =gBgScrollRegs
	movs r0, #0x3c
	subs r0, r0, r1
	strh r0, [r3]
	movs r0, #0x36
	subs r0, r0, r2
	strh r0, [r3, #2]
	adds r1, #0x32
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bls _08043C3C
	ldr r2, _08043C34 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08043C38 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08043C4A
	.align 2, 0
_08043C2C: .4byte gCamera
_08043C30: .4byte gBgScrollRegs
_08043C34: .4byte gDispCnt
_08043C38: .4byte 0x0000FEFF
_08043C3C:
	ldr r0, _08043D80 @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_08043C4A:
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r1, #0xc4
	adds r1, r1, r7
	mov r8, r1
	ldr r0, [r1]
	asrs r0, r0, #8
	ldr r4, _08043D84 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r6, r7, #0
	adds r6, #0xc8
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrb r0, [r7, #0x15]
	cmp r0, #0
	beq _08043CA6
	ldr r2, _08043D88 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _08043CCE
	ldr r0, _08043D8C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08043CCE
	ldr r0, _08043D90 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _08043CCE
_08043CA6:
	movs r3, #0xd8
	lsls r3, r3, #1
	adds r5, r7, r3
	mov r1, r8
	ldr r0, [r1]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08043CCE:
	movs r3, #0xa3
	lsls r3, r3, #2
	adds r5, r7, r3
	adds r0, r7, #0
	adds r0, #0xcc
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r4, _08043D84 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r7, #0
	adds r0, #0xd0
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r6, #0
	movs r1, #0xdc
	adds r1, r1, r7
	mov sb, r1
	movs r3, #0xe0
	adds r3, r3, r7
	mov r8, r3
_08043D0C:
	lsls r2, r6, #3
	mov r1, sb
	adds r0, r1, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	add r2, r8
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	movs r0, #0x13
	subs r0, r0, r6
	lsls r0, r0, #6
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08043D0C
	movs r3, #0xbd
	lsls r3, r3, #2
	adds r5, r7, r3
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _08043D84 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	movs r3, #0x94
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043D80: .4byte gDispCnt
_08043D84: .4byte gCamera
_08043D88: .4byte gCurrentLevel
_08043D8C: .4byte gSelectedCharacter
_08043D90: .4byte gLoadedSaveGame

	thumb_func_start sub_8043D94
sub_8043D94: @ 0x08043D94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	mov r1, r8
	adds r1, #0xc0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r2, _08043E28 @ =gSineTable
	ldrb r0, [r1]
	lsls r0, r0, #5
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #0xd
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	adds r7, r2, #0
_08043DD0:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	movs r0, #0xcb
	lsls r0, r0, #2
	adds r4, r4, r0
	add r4, r8
	lsls r0, r5, #8
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r7
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	add r0, sl
	strh r0, [r4, #0x16]
	lsls r0, r5, #8
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	add r0, sb
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08043DD0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043E28: .4byte gSineTable

	thumb_func_start sub_8043E2C
sub_8043E2C: @ 0x08043E2C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	ldrb r0, [r7, #0x11]
	cmp r0, #0
	beq _08043E40
	b _08043F9A
_08043E40:
	adds r4, r7, #0
	adds r4, #0x20
	ldrb r3, [r4]
	cmp r3, #0
	beq _08043E4C
	b _08043F9A
_08043E4C:
	ldrh r0, [r7, #0x24]
	adds r0, #0x10
	strh r0, [r7, #0x24]
	movs r1, #0x22
	ldrsh r0, [r7, r1]
	ldr r1, [r7, #0x28]
	adds r1, r1, r0
	str r1, [r7, #0x28]
	movs r0, #0x24
	ldrsh r2, [r7, r0]
	ldr r0, [r7, #0x2c]
	adds r0, r0, r2
	str r0, [r7, #0x2c]
	asrs r5, r1, #8
	asrs r0, r0, #8
	mov sb, r0
	adds r0, #0xa
	str r3, [sp]
	ldr r1, _08043FA8 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08043EA2
	lsls r1, r0, #8
	ldr r0, [r7, #0x2c]
	adds r0, r0, r1
	str r0, [r7, #0x2c]
	movs r2, #0x22
	ldrsh r1, [r7, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r7, #0x22]
	movs r0, #1
	strb r0, [r4]
_08043EA2:
	movs r0, #0x86
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r1, _08043FAC @ =gCamera
	mov r8, r1
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r4, r7, r0
	movs r2, #0x94
	lsls r2, r2, #2
	adds r1, r7, r2
	mov r2, r8
	ldr r0, [r2]
	subs r0, r5, r0
	subs r0, #2
	strh r0, [r4, #0x16]
	ldr r0, [r2, #4]
	mov r2, sb
	subs r0, r2, r0
	subs r0, #0x13
	strh r0, [r4, #0x18]
	ldr r3, _08043FB0 @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x83
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r4, #0x10]
	ldrh r0, [r7, #0x1a]
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r4, #0x18]
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_8004860
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08043FB4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	bl Mod
	adds r6, r0, #0
	cmp r6, #0
	bne _08043F9A
	ldr r0, _08043FB8 @ =gUnknown_030053B8
	mov ip, r0
	ldr r0, [r0]
	ldr r4, _08043FBC @ =0x00196225
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, _08043FC0 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, r8
	ldr r1, [r0]
	subs r1, r5, r1
	movs r5, #0xf
	adds r0, r2, #0
	ands r0, r5
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x1c]
	muls r2, r4, r2
	adds r2, r2, r3
	mov r1, r8
	ldr r0, [r1, #4]
	mov r1, sb
	subs r0, r1, r0
	adds r1, r2, #0
	ands r1, r5
	adds r0, r0, r1
	subs r0, #8
	str r0, [sp, #0x20]
	add r0, sp, #8
	strh r6, [r0, #0x1c]
	adds r5, r0, #0
	adds r1, r2, #0
	muls r1, r4, r1
	adds r1, r1, r3
	mov r2, ip
	str r1, [r2]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08043FC4 @ =0x0000041F
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r5, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08043FC8 @ =0x06012980
	str r0, [sp, #8]
	ldr r0, _08043FCC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #0xc]
	adds r1, r7, #0
	adds r1, #0x14
	bl sub_8039B54
_08043F9A:
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043FA8: .4byte sub_801EE64
_08043FAC: .4byte gCamera
_08043FB0: .4byte gUnknown_030054B8
_08043FB4: .4byte gUnknown_03005590
_08043FB8: .4byte gUnknown_030053B8
_08043FBC: .4byte 0x00196225
_08043FC0: .4byte 0x3C6EF35F
_08043FC4: .4byte 0x0000041F
_08043FC8: .4byte 0x06012980
_08043FCC: .4byte 0x0000026B

	thumb_func_start sub_8043FD0
sub_8043FD0: @ 0x08043FD0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804406C @ =gUnknown_03005B4C
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r0, [r0, #4]
	adds r0, r0, r4
	mov r1, ip
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r5
	str r0, [r1, #8]
	ldr r0, [r1, #0x28]
	adds r0, r0, r4
	str r0, [r1, #0x28]
	ldr r0, [r1, #0x2c]
	adds r0, r0, r5
	str r0, [r1, #0x2c]
	ldr r0, _08044070 @ =IWRAM_START + 0xC4
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, _08044074 @ =IWRAM_START + 0xC8
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, _08044078 @ =IWRAM_START + 0xCC
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, _0804407C @ =IWRAM_START + 0xD0
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	movs r3, #0
	ldr r1, _08044080 @ =IWRAM_START + 0xDC
	adds r7, r2, r1
	ldr r0, _08044084 @ =IWRAM_START + 0xE0
	adds r6, r2, r0
_08044030:
	lsls r1, r3, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08044030
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	movs r1, #0x94
	lsls r1, r1, #1
	add r1, ip
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804406C: .4byte gUnknown_03005B4C
_08044070: .4byte IWRAM_START + 0xC4
_08044074: .4byte IWRAM_START + 0xC8
_08044078: .4byte IWRAM_START + 0xCC
_0804407C: .4byte IWRAM_START + 0xD0
_08044080: .4byte IWRAM_START + 0xDC
_08044084: .4byte IWRAM_START + 0xE0

	thumb_func_start sub_8044088
sub_8044088: @ 0x08044088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r8, r0
	ldr r3, [r6, #4]
	asrs r3, r3, #8
	ldr r4, _0804412C @ =gSineTable
	ldrh r2, [r6, #0x16]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r3, r0
	mov sb, r3
	ldr r3, [r6, #8]
	asrs r3, r3, #8
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r7, r3, r0
	ldr r1, _08044130 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	mov r5, r8
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r4, _08044134 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #2
	bl sub_800CA20
	cmp r0, #1
	bne _080440FE
	adds r0, r6, #0
	bl sub_80452F8
_080440FE:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #1
	bl sub_800C320
	ldrb r0, [r6, #0x13]
	cmp r0, #0
	bne _08044150
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08044138
	adds r0, r6, #0
	bl sub_8045368
	b _08044150
	.align 2, 0
_0804412C: .4byte gSineTable
_08044130: .4byte gCamera
_08044134: .4byte gPlayer
_08044138:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _08044150
	adds r0, r6, #0
	bl sub_80452F8
_08044150:
	mov r1, sb
	lsls r0, r1, #8
	lsls r1, r7, #8
	bl sub_80122DC
	ldrb r4, [r6, #0x13]
	cmp r4, #0
	bne _08044180
	ldr r0, _08044228 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _08044180
	adds r0, r6, #0
	bl sub_8045368
	ldr r0, _0804422C @ =gUnknown_03005498
	ldr r0, [r0, #4]
	strb r4, [r0, #0x15]
_08044180:
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044188
	b _08044372
_08044188:
	ldrb r0, [r6, #0x1f]
	cmp r0, #0
	beq _08044190
	b _08044372
_08044190:
	movs r2, #0x86
	lsls r2, r2, #2
	adds r2, r2, r6
	mov r8, r2
	ldr r3, [r6, #4]
	asrs r3, r3, #8
	ldr r4, _08044230 @ =gSineTable
	ldrh r2, [r6, #0x18]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r3, r0
	mov sb, r3
	ldr r3, [r6, #8]
	asrs r3, r3, #8
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r7, r3, r0
	ldr r1, _08044234 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	mov r5, r8
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r4, _08044228 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	bne _080441F8
	adds r0, r6, #0
	bl sub_80452F8
_080441F8:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	adds r1, r0, #0
	cmp r1, #1
	bne _080442A8
	movs r0, #0x1e
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x11]
	subs r0, #1
	strb r0, [r6, #0x11]
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044238
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804423E
	.align 2, 0
_08044228: .4byte gPlayer
_0804422C: .4byte gUnknown_03005498
_08044230: .4byte gSineTable
_08044234: .4byte gCamera
_08044238:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804423E:
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _080442C0
	ldr r1, _08044294 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08044298 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	mov sl, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp sl, r1
	beq _080442C0
	ldr r0, _0804429C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080442C0
	mov r5, sl
	subs r0, r5, r1
	lsls r0, r0, #0x10
	ldr r1, _080442A0 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08044288
	movs r0, #0xff
_08044288:
	strb r0, [r1]
	ldr r1, _080442A4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _080442C0
	.align 2, 0
_08044294: .4byte gUnknown_03005450
_08044298: .4byte 0x0000C350
_0804429C: .4byte gGameMode
_080442A0: .4byte gUnknown_03005448
_080442A4: .4byte gUnknown_030054A8
_080442A8:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _080442C0
	adds r0, r6, #0
	bl sub_80452F8
_080442C0:
	mov r5, sb
	lsls r0, r5, #8
	lsls r1, r7, #8
	bl sub_80122DC
	ldrb r0, [r6, #0x1f]
	cmp r0, #0
	bne _08044364
	ldr r0, _08044300 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C418
	adds r1, r0, #0
	cmp r1, #1
	bne _08044364
	movs r0, #0x1e
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x11]
	subs r0, #1
	strb r0, [r6, #0x11]
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044304
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804430A
	.align 2, 0
_08044300: .4byte gPlayer
_08044304:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804430A:
	ldr r0, _080444B8 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044364
	ldr r1, _080444BC @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _080444C0 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	mov r8, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r8, r1
	beq _08044364
	ldr r0, _080444C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044364
	mov r5, r8
	subs r0, r5, r1
	lsls r0, r0, #0x10
	ldr r1, _080444C8 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0804435C
	movs r0, #0xff
_0804435C:
	strb r0, [r1]
	ldr r1, _080444CC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08044364:
	mov r0, sb
	subs r0, #5
	lsls r0, r0, #8
	str r0, [r6, #0x28]
	adds r0, r7, #1
	lsls r0, r0, #8
	str r0, [r6, #0x2c]
_08044372:
	movs r5, #0xa3
	lsls r5, r5, #2
	adds r5, r5, r6
	mov r8, r5
	ldr r3, [r6, #4]
	asrs r3, r3, #8
	ldr r4, _080444D0 @ =gSineTable
	ldrh r2, [r6, #0x30]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r3, r0
	mov sb, r3
	ldr r3, [r6, #8]
	asrs r3, r3, #8
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r7, r3, r0
	ldr r5, _080444D4 @ =gCamera
	ldr r0, [r5]
	mov r1, sb
	subs r0, r1, r0
	mov r2, r8
	strh r0, [r2, #0x16]
	ldr r0, [r5, #4]
	subs r0, r7, r0
	strh r0, [r2, #0x18]
	ldr r4, _080444D8 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _080443D8
	adds r0, r6, #0
	bl sub_80452F8
_080443D8:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	bne _080443F0
	adds r0, r6, #0
	bl sub_80452F8
_080443F0:
	movs r0, #2
	add sb, r0
	subs r7, #0x11
	movs r2, #0
	mov ip, r5
	movs r1, #0xb6
	adds r1, r1, r6
	mov sl, r1
	adds r3, r6, #0
	adds r3, #0x36
	adds r4, r6, #0
	adds r4, #0x76
	ldrb r5, [r1]
	mov r8, r5
_0804440C:
	adds r2, #1
	lsls r1, r2, #2
	mov r0, r8
	subs r1, r0, r1
	movs r5, #0x1f
	ands r1, r5
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	add sb, r0
	adds r1, r4, r1
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r7, r7, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #5
	bls _0804440C
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r1, r1, r6
	mov r8, r1
	mov r2, sl
	ldrb r1, [r2]
	subs r1, #0x1c
	ands r1, r5
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	add sb, r0
	adds r1, r4, r1
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r7, r7, r0
	mov r5, ip
	ldr r0, [r5]
	mov r1, sb
	subs r0, r1, r0
	mov r2, r8
	strh r0, [r2, #0x16]
	ldr r0, [r5, #4]
	subs r0, r7, r0
	strh r0, [r2, #0x18]
	ldr r4, _080444D8 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	bne _0804448E
	adds r0, r6, #0
	bl sub_80452F8
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r4, #0x20]
_0804448E:
	ldr r5, _080444D8 @ =gPlayer
	str r5, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _080444A8
	adds r0, r6, #0
	bl sub_80452F8
_080444A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080444B8: .4byte gUnknown_03005498
_080444BC: .4byte gUnknown_03005450
_080444C0: .4byte 0x0000C350
_080444C4: .4byte gGameMode
_080444C8: .4byte gUnknown_03005448
_080444CC: .4byte gUnknown_030054A8
_080444D0: .4byte gSineTable
_080444D4: .4byte gCamera
_080444D8: .4byte gPlayer

	thumb_func_start sub_80444DC
sub_80444DC: @ 0x080444DC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r1, r1, #8
	asrs r0, r0, #8
	adds r0, #0x32
	movs r2, #0
	str r2, [sp]
	ldr r2, _08044538 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r0, [r4, #0x16]
	adds r0, #2
	ldr r1, _0804453C @ =0x000003FF
	ands r0, r1
	strh r0, [r4, #0x16]
	ldrh r0, [r4, #0x18]
	adds r0, #2
	ands r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x30]
	adds r0, #2
	ands r0, r1
	strh r0, [r4, #0x30]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044538: .4byte sub_801EE64
_0804453C: .4byte 0x000003FF

	thumb_func_start sub_8044540
sub_8044540: @ 0x08044540
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r1, [r6, #0xc]
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	cmp r0, #0
	ble _0804455C
	subs r0, r1, #2
	strh r0, [r6, #0xc]
_0804455C:
	movs r4, #0xc
	ldrsh r0, [r6, r4]
	ldr r1, [r6, #4]
	adds r1, r1, r0
	str r1, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r2
	str r0, [r6, #8]
	asrs r2, r1, #8
	asrs r0, r0, #8
	adds r0, #0x32
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	ldr r4, _0804477C @ =sub_801EE64
	mov r8, r4
	str r4, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	adds r5, r6, #0
	adds r5, #0xd6
	ldrh r0, [r5]
	adds r0, #0x30
	strh r0, [r5]
	adds r2, r6, #0
	adds r2, #0xc4
	adds r7, r6, #0
	adds r7, #0xd4
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0xc8
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08044600
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x18
	strh r0, [r7]
_08044600:
	adds r5, r6, #0
	adds r5, #0xda
	ldrh r0, [r5]
	adds r0, #0x3d
	strh r0, [r5]
	adds r2, r6, #0
	adds r2, #0xcc
	adds r7, r6, #0
	adds r7, #0xd8
	movs r4, #0
	ldrsh r1, [r7, r4]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0xd0
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08044666
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #6
	adds r0, r0, r1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x22
	strh r0, [r7]
_08044666:
	movs r4, #0
	mov r8, r4
	adds r0, r6, #0
	adds r0, #0xdc
	str r0, [sp, #8]
	movs r1, #0xe0
	adds r1, r1, r6
	mov sl, r1
_08044676:
	mov r2, r8
	lsls r1, r2, #2
	movs r4, #0x87
	lsls r4, r4, #1
	adds r0, r6, r4
	adds r5, r0, r1
	ldrh r0, [r5]
	adds r0, #0x38
	strh r0, [r5]
	lsls r3, r2, #3
	ldr r0, [sp, #8]
	adds r2, r0, r3
	subs r4, #2
	adds r0, r6, r4
	adds r7, r0, r1
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r1, sl
	adds r4, r1, r3
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r0, [r2]
	asrs r2, r0, #8
	asrs r0, r1, #8
	movs r1, #0
	str r1, [sp]
	ldr r1, _0804477C @ =sub_801EE64
	mov sb, r1
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _080446EE
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r0, r8
	subs r0, #0x41
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldr r0, _08044780 @ =0x0000FFCD
	add r0, r8
	ldrh r4, [r7]
	adds r0, r0, r4
	strh r0, [r7]
_080446EE:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #5
	bls _08044676
	movs r0, #0x97
	lsls r0, r0, #1
	adds r5, r6, r0
	ldrh r0, [r5]
	adds r0, #0x40
	movs r3, #0
	strh r0, [r5]
	movs r1, #0x92
	lsls r1, r1, #1
	adds r2, r6, r1
	movs r4, #0x96
	lsls r4, r4, #1
	adds r7, r6, r4
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r4, r6, r1
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	str r3, [sp]
	mov r1, sb
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _0804476C
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x34
	strh r0, [r7]
_0804476C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804477C: .4byte sub_801EE64
_08044780: .4byte 0x0000FFCD

	thumb_func_start sub_8044784
sub_8044784: @ 0x08044784
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _080447CC @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080447D4
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #6
	cmp r0, r1
	beq _080447BC
	mov r4, r8
	strh r1, [r4, #4]
	mov r0, r8
	bl sub_802D4CC
_080447BC:
	ldr r0, _080447D0 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _08044A00
	.align 2, 0
_080447CC: .4byte gPlayer
_080447D0: .4byte gFlags
_080447D4:
	ldrb r0, [r7, #0x11]
	cmp r0, #0
	bne _080447FC
	movs r0, #0x80
	lsls r0, r0, #6
	mov r5, r8
	strh r0, [r5, #4]
	mov r0, r8
	bl sub_802D4CC
	ldr r2, _080447F8 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	b _08044A00
	.align 2, 0
_080447F8: .4byte gFlags
_080447FC:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r6, _080448C0 @ =gCamera
	ldr r1, [r6]
	subs r5, r0, r1
	ldrh r3, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	ldr r2, _080448C4 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #0xb
	adds r5, r5, r0
	ldrh r2, [r7, #0x1a]
	adds r1, r2, r1
	lsls r1, r1, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r1, r1, r0
	movs r4, #0
	ldrsh r1, [r1, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r5, r5, r0
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r6, r0, r1
	lsls r3, r3, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r3, r3, r0
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r6, r6, r0
	subs r6, #0x12
	lsls r2, r2, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r2, r2, r0
	movs r4, #0
	ldrsh r1, [r2, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r6, r6, r0
	movs r0, #0
	mov sb, r0
	ldrb r1, [r7, #0x1e]
	cmp r1, #0
	beq _080448CC
	ldrh r0, [r7, #0x1c]
	cmp r0, #0
	bne _080448CC
	subs r1, #1
	strb r1, [r7, #0x1e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	subs r0, r0, r1
	mov r4, r8
	strh r0, [r4, #4]
	ldrh r0, [r7, #0x1a]
	ldrb r1, [r7, #0x1e]
	adds r1, #8
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #0x20
	str r2, [sp, #4]
	movs r2, #6
	bl sub_802E784
	movs r5, #1
	mov sb, r5
	ldrb r0, [r7, #0x1e]
	cmp r0, #0
	bne _08044946
	ldr r2, _080448C8 @ =gUnknown_080D7F94
	ldrb r0, [r7, #0x10]
	movs r1, #0
	cmp r0, #4
	bls _080448B8
	movs r1, #2
_080448B8:
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	b _08044946
	.align 2, 0
_080448C0: .4byte gCamera
_080448C4: .4byte gSineTable
_080448C8: .4byte gUnknown_080D7F94
_080448CC:
	movs r2, #0x80
	lsls r2, r2, #6
	mov r0, r8
	strh r2, [r0, #4]
	ldrh r1, [r7, #0x1c]
	subs r0, r1, #1
	strh r0, [r7, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080448EC
	movs r0, #0xfc
	bl m4aSongNumStart
	movs r0, #0x10
	strb r0, [r7, #0x1e]
	b _0804491C
_080448EC:
	adds r0, r1, #0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1c
	bhi _0804491C
	adds r0, r1, #0
	subs r0, #0xb
	lsls r0, r0, #7
	subs r0, r2, r0
	mov r1, r8
	strh r0, [r1, #4]
	ldrh r0, [r7, #0x1a]
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0x20
	str r1, [sp, #4]
	movs r1, #0xa
	movs r2, #6
	bl sub_802E784
_0804491C:
	ldrh r0, [r7, #0x1c]
	cmp r0, #0xc
	bhi _08044946
	movs r4, #0x97
	lsls r4, r4, #2
	adds r2, r7, r4
	strh r5, [r2, #0x16]
	strh r6, [r2, #0x18]
	ldrh r0, [r7, #0x1c]
	cmp r0, #0xc
	bne _08044946
	ldr r5, _080449C0 @ =0x0000027D
	adds r1, r7, r5
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080449C4 @ =0x000002AB
	strh r0, [r2, #0xa]
	subs r0, #0x2f
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
_08044946:
	mov r0, r8
	bl sub_802D4CC
	ldr r1, _080449C8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r6, r0, #8
	adds r6, #0x13
	ldr r3, [r7, #8]
	asrs r3, r3, #8
	ldr r4, _080449CC @ =gSineTable
	ldrh r1, [r7, #0x18]
	lsls r0, r1, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r2, [r0, r5]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #0xb
	adds r3, r3, r0
	subs r6, r6, r3
	ldr r2, _080449C8 @ =gPlayer
	ldr r0, [r2, #8]
	asrs r5, r0, #8
	adds r3, r5, #2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r2, r2, r0
	subs r5, r3, r2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080449D0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080449E4
	ldrh r2, [r7, #0x1a]
	adds r1, r2, #0
	cmp r1, r3
	bhs _080449D8
	ldr r0, _080449D4 @ =0x0000023F
	cmp r1, r0
	bhi _080449E4
	adds r0, r2, #1
	b _080449E2
	.align 2, 0
_080449C0: .4byte 0x0000027D
_080449C4: .4byte 0x000002AB
_080449C8: .4byte gPlayer
_080449CC: .4byte gSineTable
_080449D0: .4byte gUnknown_03005590
_080449D4: .4byte 0x0000023F
_080449D8:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r1, r0
	bls _080449E4
	subs r0, r2, #1
_080449E2:
	strh r0, [r7, #0x1a]
_080449E4:
	mov r1, sb
	cmp r1, #0
	beq _08044A00
	ldrh r1, [r7, #0x1a]
	adds r0, r1, #0
	subs r0, #0x10
	cmp r0, r3
	bge _08044A00
	adds r0, #0x20
	cmp r0, r3
	ble _08044A00
	ldr r0, _08044A10 @ =gPlayer
	bl sub_800CBA4
_08044A00:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A10: .4byte gPlayer

	thumb_func_start sub_8044A14
sub_8044A14: @ 0x08044A14
	push {r4, lr}
	mov ip, r0
	ldr r2, _08044A90 @ =gSineTable
	ldr r0, _08044A94 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08044A98 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #9
	movs r3, #0xfa
	lsls r3, r3, #2
	adds r0, r0, r3
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x32]
	mov r3, ip
	adds r3, #0xb6
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r1, #0x36
	adds r1, r1, r0
	mov r4, ip
	adds r4, #0xb8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	mov r3, ip
	ldrh r0, [r3, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xb
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044A9C
	ldrh r0, [r4]
	adds r0, #2
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08044AAC
	b _08044AAA
	.align 2, 0
_08044A90: .4byte gSineTable
_08044A94: .4byte gUnknown_03005590
_08044A98: .4byte 0x000003FF
_08044A9C:
	ldrh r0, [r4]
	subs r0, #2
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044AAC
_08044AAA:
	strh r3, [r4]
_08044AAC:
	mov r3, ip
	ldrh r0, [r3, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xb
	mov r1, ip
	adds r1, #0xba
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044ADA
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08044AEA
	b _08044AE8
_08044ADA:
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044AEA
_08044AE8:
	strh r3, [r1]
_08044AEA:
	mov r1, ip
	adds r1, #0xbc
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x77
	bls _08044B06
	movs r0, #0
	strh r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
_08044B06:
	mov r2, ip
	adds r2, #0xb6
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8044B28
sub_8044B28: @ 0x08044B28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08044BA4 @ =gSineTable
	ldr r3, _08044BA8 @ =gUnknown_03005590
	ldr r0, [r3]
	lsls r0, r0, #4
	ldr r1, _08044BAC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #9
	movs r4, #0xfa
	lsls r4, r4, #2
	adds r0, r0, r4
	ands r0, r1
	strh r0, [r6, #0x32]
	adds r4, r6, #0
	adds r4, #0xb6
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x36
	adds r1, r1, r0
	adds r5, r6, #0
	adds r5, #0xb8
	ldrh r0, [r5]
	strh r0, [r1]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x76
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r4, r0, #0xa
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bge _08044BB0
	ldrh r0, [r5]
	adds r0, #2
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	ble _08044BC0
	b _08044BBE
	.align 2, 0
_08044BA4: .4byte gSineTable
_08044BA8: .4byte gUnknown_03005590
_08044BAC: .4byte 0x000003FF
_08044BB0:
	ldrh r0, [r5]
	subs r0, #2
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bge _08044BC0
_08044BBE:
	strh r4, [r5]
_08044BC0:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r4, r0, #0xa
	adds r1, r6, #0
	adds r1, #0xba
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bge _08044BEC
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	ble _08044BFC
	b _08044BFA
_08044BEC:
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bge _08044BFC
_08044BFA:
	strh r4, [r1]
_08044BFC:
	adds r4, r6, #0
	adds r4, #0xbc
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bls _08044C98
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044C2A
	ldr r2, _08044C3C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _08044C40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08044C44 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08044C48
_08044C2A:
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	b _08044C70
	.align 2, 0
_08044C3C: .4byte gUnknown_030053B8
_08044C40: .4byte 0x00196225
_08044C44: .4byte 0x3C6EF35F
_08044C48:
	ldr r3, [r3]
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	beq _08044C62
	strh r1, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	b _08044C70
_08044C62:
	strh r3, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x60
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
_08044C70:
	strb r0, [r1]
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r4, #0xc5
	lsls r4, r4, #2
	adds r1, r6, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08044C94 @ =0x00000315
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	b _08044CA6
	.align 2, 0
_08044C94: .4byte 0x00000315
_08044C98:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x46
	bne _08044CA6
	movs r0, #0xfa
	bl m4aSongNumStart
_08044CA6:
	adds r0, r6, #0
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044CBC
sub_8044CBC: @ 0x08044CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xbe
	ldrb r0, [r7]
	cmp r0, #0x40
	bne _08044D26
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r5, _08044DE0 @ =gSineTable
	ldrh r4, [r6, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r3, r2, r5
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r1, r1, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r2, #0
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r0, r0, r2
	adds r1, #2
	subs r0, #0x11
	ldr r3, _08044DE4 @ =gPlayer
	ldr r2, [r3, #8]
	asrs r2, r2, #8
	subs r1, r2, r1
	ldr r2, [r3, #0xc]
	asrs r2, r2, #8
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r6, #0x32]
_08044D26:
	ldrb r0, [r7]
	str r7, [sp]
	movs r3, #0xb6
	adds r3, r3, r6
	mov r8, r3
	movs r1, #0x36
	adds r1, r1, r6
	mov sl, r1
	adds r5, r6, #0
	adds r5, #0xb8
	adds r2, r6, #0
	adds r2, #0x76
	str r2, [sp, #4]
	adds r7, r6, #0
	adds r7, #0xba
	cmp r0, #0x1b
	bne _08044D92
	movs r0, #0xfb
	bl m4aSongNumStart
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0x10
	strb r0, [r1]
	movs r3, #0
	movs r0, #0xcb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _08044DE8 @ =gUnknown_080D7FB0
	mov ip, r1
	movs r4, #0xff
_08044D64:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	add r0, sb
	adds r2, r6, r0
	lsls r1, r3, #3
	add r1, ip
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08044D64
_08044D92:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	adds r4, r5, #0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r1, [r7]
	strh r1, [r0]
	ldr r2, _08044DE0 @ =gSineTable
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xa
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044DEC
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08044DFC
	strh r3, [r4]
	b _08044DFC
	.align 2, 0
_08044DE0: .4byte gSineTable
_08044DE4: .4byte gPlayer
_08044DE8: .4byte gUnknown_080D7FB0
_08044DEC:
	ldrh r0, [r5]
	subs r0, #0xa
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r3
	bge _08044DFC
	strh r3, [r5]
_08044DFC:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xa
	adds r1, r7, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044E28
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08044E38
	strh r3, [r1]
	b _08044E38
_08044E28:
	ldrh r0, [r7]
	subs r0, #0xa
	strh r0, [r7]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, r3
	bge _08044E38
	strh r3, [r7]
_08044E38:
	ldr r1, [sp]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r3, #0xff
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08044E92
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	beq _08044E84
	adds r0, r6, #0
	adds r0, #0xbf
	strb r1, [r0]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	str r0, [r2, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08044E80 @ =0x00000315
	adds r1, r6, r0
	ldrb r0, [r1]
	orrs r0, r3
	b _08044E90
	.align 2, 0
_08044E80: .4byte 0x00000315
_08044E84:
	adds r0, r6, #0
	adds r0, #0xbf
	movs r1, #3
	strb r1, [r0]
	movs r0, #0x7f
	ldr r1, [sp]
_08044E90:
	strb r0, [r1]
_08044E92:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044EB0
sub_8044EB0: @ 0x08044EB0
	push {r4, lr}
	mov ip, r0
	adds r0, #0xbe
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08044F34 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	ldr r3, _08044F38 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	mov r1, ip
	ldrh r1, [r1, #0x32]
	adds r0, r0, r1
	ands r0, r2
	mov r2, ip
	strh r0, [r2, #0x32]
	adds r2, #0xb6
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x36
	adds r1, r1, r0
	mov r4, ip
	adds r4, #0xb8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, ip
	ldrh r0, [r1, #0x32]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r2, r0, #0xa
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08044F3C
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _08044F4C
	b _08044F4A
	.align 2, 0
_08044F34: .4byte 0x000003FF
_08044F38: .4byte gSineTable
_08044F3C:
	ldrh r0, [r4]
	subs r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08044F4C
_08044F4A:
	strh r2, [r4]
_08044F4C:
	mov r2, ip
	ldrh r0, [r2, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r2, r0, #0xa
	mov r1, ip
	adds r1, #0xba
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bge _08044F7A
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _08044F8A
	b _08044F88
_08044F7A:
	ldrh r0, [r1]
	subs r0, #0xa
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bge _08044F8A
_08044F88:
	strh r2, [r1]
_08044F8A:
	mov r1, ip
	adds r1, #0xbe
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08044FCA
	adds r1, #1
	strb r0, [r1]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r1, #0xc5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08044FE0 @ =0x00000315
	add r1, ip
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08044FCA:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044FE0: .4byte 0x00000315

	thumb_func_start sub_8044FE4
sub_8044FE4: @ 0x08044FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xbe
	ldrb r0, [r7]
	cmp r0, #0x40
	bne _0804504E
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r5, _08045108 @ =gSineTable
	ldrh r4, [r6, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r3, r2, r5
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r1, r1, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r2, #0
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r0, r0, r2
	adds r1, #2
	subs r0, #0x11
	ldr r3, _0804510C @ =gPlayer
	ldr r2, [r3, #8]
	asrs r2, r2, #8
	subs r1, r2, r1
	ldr r2, [r3, #0xc]
	asrs r2, r2, #8
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r6, #0x32]
_0804504E:
	ldrb r0, [r7]
	str r7, [sp]
	movs r3, #0xb6
	adds r3, r3, r6
	mov r8, r3
	movs r1, #0x36
	adds r1, r1, r6
	mov sl, r1
	adds r5, r6, #0
	adds r5, #0xb8
	adds r2, r6, #0
	adds r2, #0x76
	str r2, [sp, #4]
	adds r7, r6, #0
	adds r7, #0xba
	cmp r0, #0x1b
	bne _080450BA
	movs r0, #0xfb
	bl m4aSongNumStart
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0x10
	strb r0, [r1]
	movs r3, #0
	movs r0, #0xcb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _08045110 @ =gUnknown_080D7FB0
	mov ip, r1
	movs r4, #0xff
_0804508C:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	add r0, sb
	adds r2, r6, r0
	lsls r1, r3, #3
	add r1, ip
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0804508C
_080450BA:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	adds r4, r5, #0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r1, [r7]
	strh r1, [r0]
	ldr r2, _08045108 @ =gSineTable
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08045114
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08045124
	strh r3, [r4]
	b _08045124
	.align 2, 0
_08045108: .4byte gSineTable
_0804510C: .4byte gPlayer
_08045110: .4byte gUnknown_080D7FB0
_08045114:
	ldrh r0, [r5]
	subs r0, #0xa
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r3
	bge _08045124
	strh r3, [r5]
_08045124:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #9
	adds r1, r7, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08045150
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08045160
	strh r3, [r1]
	b _08045160
_08045150:
	ldrh r0, [r7]
	subs r0, #0xa
	strh r0, [r7]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, r3
	bge _08045160
	strh r3, [r7]
_08045160:
	ldr r2, [sp]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r3, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080451A0
	adds r1, r6, #0
	adds r1, #0xbf
	strb r0, [r1]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	str r0, [r2, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080451C0 @ =0x00000315
	adds r1, r6, r0
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_080451A0:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080451C0: .4byte 0x00000315

	thumb_func_start sub_80451C4
sub_80451C4: @ 0x080451C4
	push {r4, lr}
	mov ip, r0
	ldrh r0, [r0, #0x32]
	subs r0, #0xc
	ldr r1, _0804523C @ =0x000003FF
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x32]
	mov r2, ip
	adds r2, #0xb6
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #0x36
	adds r1, r1, r0
	mov r3, ip
	adds r3, #0xb8
	ldrh r0, [r3]
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08045240 @ =gSineTable
	mov r4, ip
	ldrh r0, [r4, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0xbe
	ldrb r0, [r0]
	lsrs r0, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #0xb
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045244
	ldrh r0, [r3]
	adds r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	ble _08045254
	b _08045252
	.align 2, 0
_0804523C: .4byte 0x000003FF
_08045240: .4byte gSineTable
_08045244:
	ldrh r0, [r3]
	subs r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045254
_08045252:
	strh r1, [r3]
_08045254:
	mov r1, ip
	ldrh r0, [r1, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	mov r2, ip
	adds r2, #0xbe
	ldrb r0, [r2]
	lsrs r0, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #0xb
	mov r3, ip
	adds r3, #0xba
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045290
	ldrh r0, [r3]
	adds r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	ble _080452A0
	b _0804529E
_08045290:
	ldrh r0, [r3]
	subs r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _080452A0
_0804529E:
	strh r1, [r3]
_080452A0:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080452DE
	mov r1, ip
	adds r1, #0xbf
	strb r0, [r1]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r1, #0xc5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	ldr r1, _080452F4 @ =0x00000315
	add r1, ip
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_080452DE:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080452F4: .4byte 0x00000315

	thumb_func_start sub_80452F8
sub_80452F8: @ 0x080452F8
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r3, r2, r0
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	bne _08045362
	movs r0, #0x1e
	strb r0, [r2, #0x12]
	ldr r4, _0804533C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	beq _0804534C
	ldr r0, _08045340 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804534C
	ldr r0, _08045344 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0804534C
	ldr r0, _08045348 @ =0x0000013B
	strh r0, [r3, #0xa]
	adds r0, #0x95
	adds r1, r2, r0
	b _08045356
	.align 2, 0
_0804533C: .4byte gCurrentLevel
_08045340: .4byte gSelectedCharacter
_08045344: .4byte gLoadedSaveGame
_08045348: .4byte 0x0000013B
_0804534C:
	movs r0, #0xab
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
_08045356:
	movs r0, #1
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08045362:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045368
sub_8045368: @ 0x08045368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0xd8
	lsls r7, r7, #1
	add r7, r8
	ldrb r0, [r0, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1, #0x10]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804538E
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08045394
_0804538E:
	movs r0, #0xeb
	bl m4aSongNumStart
_08045394:
	movs r0, #0
	movs r1, #0x1e
	mov r2, r8
	strb r1, [r2, #0x13]
	strb r0, [r2, #0x12]
	ldr r2, _080453D0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _080453E8
	ldr r0, _080453D4 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080453E8
	ldr r0, _080453D8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _080453E8
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _080453E0
	ldr r0, _080453DC @ =0x0000013B
	b _080453F4
	.align 2, 0
_080453D0: .4byte gCurrentLevel
_080453D4: .4byte gSelectedCharacter
_080453D8: .4byte gLoadedSaveGame
_080453DC: .4byte 0x0000013B
_080453E0:
	ldr r0, _080453E4 @ =0x0000013B
	b _08045464
	.align 2, 0
_080453E4: .4byte 0x0000013B
_080453E8:
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _08045460
	movs r0, #0xab
	lsls r0, r0, #2
_080453F4:
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0804544C @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08045450 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0804546E
	ldr r0, _08045454 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804546E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08045458 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08045440
	movs r0, #0xff
_08045440:
	strb r0, [r1]
	ldr r1, _0804545C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0804546E
	.align 2, 0
_0804544C: .4byte gUnknown_03005450
_08045450: .4byte 0x0000C350
_08045454: .4byte gGameMode
_08045458: .4byte gUnknown_03005448
_0804545C: .4byte gUnknown_030054A8
_08045460:
	movs r0, #0xab
	lsls r0, r0, #2
_08045464:
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_0804546E:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0804549C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08045490
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #4
	bne _08045490
	ldr r1, _080454A0 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08045490:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804549C: .4byte gCurrentLevel
_080454A0: .4byte gUnknown_030054A8

	thumb_func_start sub_80454A4
sub_80454A4: @ 0x080454A4
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _080454BA
	subs r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080454D0
_080454BA:
	ldrb r0, [r2, #0x12]
	cmp r0, #0
	beq _080454CC
	subs r0, #1
	strb r0, [r2, #0x12]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080454CC
	movs r1, #1
_080454CC:
	cmp r1, #0
	beq _0804555E
_080454D0:
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r3, r2, r0
	ldr r4, _08045510 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	beq _08045534
	ldr r0, _08045514 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08045534
	ldr r0, _08045518 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _08045534
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08045520
	ldr r0, _0804551C @ =0x0000013B
	strh r0, [r3, #0xa]
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r0, #3
	b _08045554
	.align 2, 0
_08045510: .4byte gCurrentLevel
_08045514: .4byte gSelectedCharacter
_08045518: .4byte gLoadedSaveGame
_0804551C: .4byte 0x0000013B
_08045520:
	movs r0, #0
	ldr r1, _08045530 @ =0x0000013B
	strh r1, [r3, #0xa]
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r1, r2, r4
	b _08045554
	.align 2, 0
_08045530: .4byte 0x0000013B
_08045534:
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08045548
	movs r0, #0xab
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #3
	b _08045554
_08045548:
	movs r0, #0
	movs r1, #0xab
	lsls r1, r1, #2
	strh r1, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
_08045554:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804555E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045564
sub_8045564: @ 0x08045564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0804557A
	b _08045858
_0804557A:
	ldr r1, _08045868 @ =gUnknown_03005590
	ldr r0, [r1]
	movs r1, #7
	bl Mod
	adds r5, r0, #0
	cmp r5, #0
	bne _0804563E
	ldr r2, _0804586C @ =gUnknown_030053B8
	ldr r0, [r2]
	ldr r3, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r3, r2
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r0, _0804586C @ =gUnknown_030053B8
	str r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r6, r0, #0
	adds r6, #0x18
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r7, r0, #2
	ldr r4, _08045878 @ =0x000003FF
	adds r0, r4, #0
	ands r7, r0
	mov r0, sb
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r3, _0804587C @ =gCamera
	mov ip, r3
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r4, _08045880 @ =gSineTable
	mov sl, r4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r7, r3
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	lsls r0, r7, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x18]
	mov r0, sp
	strh r5, [r0, #0x1c]
	str r0, [sp, #0x20]
	ldr r3, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	ldr r0, _0804586C @ =gUnknown_030053B8
	str r1, [r0]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	ldr r1, [sp, #0x20]
	strh r0, [r1, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r5, [r0, #0xa]
	str r5, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl sub_8039B54
_0804563E:
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #0xa
	bl Mod
	str r0, [sp, #0x24]
	cmp r0, #0
	bne _0804572E
	ldr r3, _0804586C @ =gUnknown_030053B8
	mov r8, r3
	ldr r0, [r3]
	ldr r4, _08045870 @ =0x00196225
	muls r0, r4, r0
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	adds r6, r0, #0
	adds r6, #0x18
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r7, r1, #2
	ldr r3, _08045878 @ =0x000003FF
	adds r1, r3, #0
	ands r7, r1
	movs r1, #6
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sb
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r1, _0804587C @ =gCamera
	mov sl, r1
	ldr r1, [r1]
	subs r2, r2, r1
	str r2, [sp, #0x14]
	ldr r3, _08045880 @ =gSineTable
	mov ip, r3
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r7, r4
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	ldrsh r1, [r1, r3]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x14]
	mov r4, sb
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	mov r3, sl
	ldr r1, [r3, #4]
	subs r2, r2, r1
	str r2, [sp, #0x18]
	lsls r1, r7, #1
	add r1, ip
	movs r4, #0
	ldrsh r1, [r1, r4]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x18]
	mov r2, sp
	movs r1, #0x40
	strh r1, [r2, #0x1c]
	mov r1, sp
	str r1, [sp, #0x28]
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _08045870 @ =0x00196225
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	str r1, [r2]
	ldr r2, _08045878 @ =0x000003FF
	ands r1, r2
	ldr r2, [sp, #0x28]
	strh r1, [r2, #0xc]
	mov r2, sp
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r2, #0xe]
	ldr r2, _08045890 @ =gUnknown_080D79D0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08045894 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r4, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r4, #8]
	mov r0, sp
	str r0, [sp, #0x30]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, [sp, #0x30]
	strh r0, [r1, #0xa]
	ldr r2, [sp, #0x24]
	str r2, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	mov r0, sp
	bl sub_8039B54
_0804572E:
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #9
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _080457C4
	ldr r4, _0804586C @ =gUnknown_030053B8
	mov sl, r4
	ldr r0, [r4]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc4
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	mov ip, r4
	ldr r0, [r4]
	subs r1, r1, r0
	movs r4, #0xf
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r4, sp
	ldr r0, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r2, _08045874 @ =0x3C6EF35F
	adds r1, r1, r2
	mov r3, sl
	str r1, [r3]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl sub_8039B54
_080457C4:
	ldr r4, _08045868 @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xb
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08045858
	ldr r0, _0804586C @ =gUnknown_030053B8
	mov sl, r0
	ldr r0, [r0]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xcc
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0xf
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r2, r2, r1
	mov r0, sb
	adds r0, #0xd0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	ldr r4, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r4, r1
	ldr r0, _08045874 @ =0x3C6EF35F
	adds r1, r1, r0
	mov r2, sl
	str r1, [r2]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl sub_8039B54
_08045858:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045868: .4byte gUnknown_03005590
_0804586C: .4byte gUnknown_030053B8
_08045870: .4byte 0x00196225
_08045874: .4byte 0x3C6EF35F
_08045878: .4byte 0x000003FF
_0804587C: .4byte gCamera
_08045880: .4byte gSineTable
_08045884: .4byte 0x00000407
_08045888: .4byte 0x06012980
_0804588C: .4byte 0x0000026B
_08045890: .4byte gUnknown_080D79D0
_08045894: .4byte 0x06010000

	thumb_func_start sub_8045898
sub_8045898: @ 0x08045898
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0804597C
	ldr r0, _080458DC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	lsrs r7, r0, #1
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080458EC
	movs r2, #0
	ldr r0, _080458E0 @ =gFlags
	mov ip, r0
	ldr r6, _080458E4 @ =gObjPalette
	ldr r5, _080458E8 @ =gUnknown_080D7FF0
	lsls r3, r7, #5
_080458BE:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080458BE
	b _08045910
	.align 2, 0
_080458DC: .4byte gUnknown_03005590
_080458E0: .4byte gFlags
_080458E4: .4byte gObjPalette
_080458E8: .4byte gUnknown_080D7FF0
_080458EC:
	movs r2, #0
	ldr r1, _08045940 @ =gFlags
	mov ip, r1
	ldr r5, _08045944 @ =gObjPalette
	ldr r3, _08045948 @ =gUnknown_080D8010
_080458F6:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080458F6
_08045910:
	ldrb r0, [r4, #0x1f]
	cmp r0, #0
	beq _08045950
	subs r0, #1
	strb r0, [r4, #0x1f]
	movs r2, #0
	ldr r5, _08045944 @ =gObjPalette
	ldr r4, _0804594C @ =gUnknown_080D7FF0
	lsls r3, r7, #5
_08045922:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08045922
	b _08045970
	.align 2, 0
_08045940: .4byte gFlags
_08045944: .4byte gObjPalette
_08045948: .4byte gUnknown_080D8010
_0804594C: .4byte gUnknown_080D7FF0
_08045950:
	movs r2, #0
	ldr r4, _08045984 @ =gObjPalette
	ldr r3, _08045988 @ =gUnknown_080D8010
_08045956:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08045956
_08045970:
	mov r1, ip
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	str r0, [r1]
_0804597C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045984: .4byte gObjPalette
_08045988: .4byte gUnknown_080D8010

	thumb_func_start sub_804598C
sub_804598C: @ 0x0804598C
	push {lr}
	ldr r0, _0804599C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0804599C: .4byte gCurTask

	thumb_func_start sub_80459A0
sub_80459A0: @ 0x080459A0
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	bne _080459C2
	ldrh r2, [r1, #0x30]
	ldrh r0, [r1, #0x16]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _080459C8 @ =0x000003FF
	ands r0, r3
	cmp r2, r0
	beq _080459C2
	adds r0, r2, #1
	ands r0, r3
	strh r0, [r1, #0x30]
_080459C2:
	pop {r0}
	bx r0
	.align 2, 0
_080459C8: .4byte 0x000003FF

	thumb_func_start sub_80459CC
sub_80459CC: @ 0x080459CC
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _080459E4 @ =IWRAM_START + 0x4AC
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080459E8 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080459E4: .4byte IWRAM_START + 0x4AC
_080459E8: .4byte gUnknown_03005B4C

	thumb_func_start sub_80459EC
sub_80459EC: @ 0x080459EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	ldr r4, _08045A70 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x20]
	bl sub_8039ED4
	ldr r1, _08045A74 @ =gUnknown_030053B8
	ldr r0, _08045A78 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08045A7C @ =gUnknown_03005AF0
	ldr r0, [r1, #0x1c]
	ldr r3, _08045A80 @ =0xFFFFCFFF
	ands r0, r3
	movs r2, #0x80
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r1, _08045A84 @ =gUnknown_03005AA0
	ldr r0, [r1, #0x1c]
	ands r0, r3
	orrs r0, r2
	str r0, [r1, #0x1c]
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _08045A88 @ =sub_80477F0
	movs r1, #0xf3
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _08045A8C @ =sub_80479F0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _08045A90 @ =gUnknown_03005B4C
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, _08045A94 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045AA0
	ldr r0, _08045A98 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _08045AA0
	ldr r0, _08045A9C @ =IWRAM_START + 0x28
	adds r1, r1, r0
	movs r0, #6
	b _08045AA6
	.align 2, 0
_08045A70: .4byte gPlayer
_08045A74: .4byte gUnknown_030053B8
_08045A78: .4byte gUnknown_03005590
_08045A7C: .4byte gUnknown_03005AF0
_08045A80: .4byte 0xFFFFCFFF
_08045A84: .4byte gUnknown_03005AA0
_08045A88: .4byte sub_80477F0
_08045A8C: .4byte sub_80479F0
_08045A90: .4byte gUnknown_03005B4C
_08045A94: .4byte gUnknown_030054EC
_08045A98: .4byte gGameMode
_08045A9C: .4byte IWRAM_START + 0x28
_08045AA0:
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #8
_08045AA6:
	strb r0, [r1]
	ldr r2, _08045AD0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	bne _08045AD8
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsrs r1, r1, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	bne _08045AD8
	ldr r0, _08045AD4 @ =0x00719400
	str r0, [r3, #4]
	movs r0, #0xc8
	lsls r0, r0, #7
	b _08045AE2
	.align 2, 0
_08045AD0: .4byte gCurrentLevel
_08045AD4: .4byte 0x00719400
_08045AD8:
	movs r0, #0xe1
	lsls r0, r0, #0xa
	str r0, [r3, #4]
	movs r0, #0x96
	lsls r0, r0, #8
_08045AE2:
	str r0, [r3, #8]
	movs r2, #0
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [r3, #0x14]
	str r1, [r3, #0x18]
	subs r0, #3
	strb r2, [r0]
	strh r1, [r3, #0x1e]
	subs r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x20]
	subs r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [r3, #0x2c]
	str r1, [r3, #0x30]
	str r1, [r3, #0x34]
	str r1, [r3, #0x38]
	movs r0, #0x80
	str r0, [r3]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x2b
	movs r0, #0xe0
	strb r0, [r1]
	adds r0, #0xe2
	strh r0, [r3, #0x22]
	movs r5, #0
	movs r1, #0xef
	lsls r1, r1, #2
	adds r6, r3, r1
	ldr r0, _08045E34 @ =0x000003BD
	adds r0, r0, r3
	mov r8, r0
	adds r1, #2
	adds r1, r1, r3
	mov sl, r1
	ldr r0, _08045E38 @ =0x000003C1
	adds r0, r0, r3
	mov sb, r0
	movs r1, #0xe3
	lsls r1, r1, #2
	adds r1, r3, r1
	str r1, [sp, #0x2c]
	ldr r0, _08045E3C @ =0x0000038D
	adds r0, r3, r0
	str r0, [sp, #0x30]
	ldr r1, _08045E40 @ =0x0000038E
	adds r1, r3, r1
	str r1, [sp, #0x34]
	ldr r0, _08045E44 @ =0x00000391
	adds r0, r3, r0
	str r0, [sp, #0x38]
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r1, r3, r1
	str r1, [sp, #0x1c]
	ldr r0, _08045E48 @ =0x000001E5
	adds r0, r3, r0
	str r0, [sp, #0x20]
	movs r1, #0xf3
	lsls r1, r1, #1
	adds r1, r3, r1
	str r1, [sp, #0x24]
	ldr r0, _08045E4C @ =0x000001E9
	adds r0, r3, r0
	str r0, [sp, #0x28]
	movs r1, #0x87
	lsls r1, r1, #2
	adds r1, r3, r1
	str r1, [sp, #0x3c]
	ldr r0, _08045E50 @ =0x0000021D
	adds r0, r3, r0
	str r0, [sp, #0x40]
	ldr r1, _08045E54 @ =0x0000021E
	adds r1, r3, r1
	str r1, [sp, #0x44]
	ldr r0, _08045E58 @ =0x00000221
	adds r0, r3, r0
	str r0, [sp, #0x48]
	movs r1, #0x93
	lsls r1, r1, #2
	adds r1, r3, r1
	str r1, [sp, #0xc]
	ldr r0, _08045E5C @ =0x0000024D
	adds r0, r3, r0
	str r0, [sp, #0x10]
	ldr r1, _08045E60 @ =0x0000024E
	adds r1, r3, r1
	str r1, [sp, #0x14]
	ldr r0, _08045E64 @ =0x00000251
	adds r0, r3, r0
	str r0, [sp, #0x18]
	movs r1, #0
_08045BB6:
	lsls r0, r5, #4
	adds r0, #0x3c
	adds r0, r3, r0
	strb r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08045BB6
	movs r1, #0xe7
	lsls r1, r1, #2
	adds r7, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08045E68 @ =0x000002B1
	strh r0, [r7, #0xa]
	strb r5, [r6]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1]
	movs r1, #0x10
	mov r0, sl
	strb r1, [r0]
	mov r0, sb
	strb r5, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
	str r1, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #5
	str r6, [r7, #0x10]
	ldr r3, [sp, #0x4c]
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r7, r3, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xac
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0x2c]
	strb r5, [r1]
	subs r0, #0xf0
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x30]
	strb r0, [r1]
	movs r1, #0x10
	ldr r0, [sp, #0x34]
	strb r1, [r0]
	ldr r0, [sp, #0x38]
	strb r5, [r0]
	mov r1, r8
	str r1, [r7, #0x28]
	str r6, [r7, #0x10]
	ldr r3, [sp, #0x4c]
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r7, r3, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x2a
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08045E6C @ =0x000002AF
	strh r0, [r7, #0xa]
	movs r0, #1
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x20]
	strb r0, [r1]
	movs r1, #0x10
	ldr r0, [sp, #0x24]
	strb r1, [r0]
	ldr r0, [sp, #0x28]
	strb r5, [r0]
	mov r1, r8
	str r1, [r7, #0x28]
	str r6, [r7, #0x10]
	ldr r3, [sp, #0x4c]
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r7, r3, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #8
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08045E70 @ =0x000002B5
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0x3c]
	strb r5, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r1, #0x10
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	ldr r0, [sp, #0x48]
	strb r5, [r0]
	mov r1, r8
	str r1, [r7, #0x28]
	str r6, [r7, #0x10]
	ldr r3, [sp, #0x4c]
	movs r0, #0x8b
	lsls r0, r0, #2
	adds r7, r3, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xad
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0xc]
	strb r5, [r1]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	movs r1, #0x10
	ldr r0, [sp, #0x14]
	strb r1, [r0]
	ldr r0, [sp, #0x18]
	strb r5, [r0]
	mov r1, r8
	str r1, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r5, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r3, [sp, #0x4c]
_08045D34:
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r7, r3, r0
	strh r6, [r7, #0x16]
	strh r6, [r7, #0x18]
	ldr r0, _08045E74 @ =gUnknown_080D8034
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r7, #4]
	lsls r1, r5, #2
	add r1, sp
	adds r1, #4
	str r0, [r1]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x4c]
	cmp r5, #1
	bls _08045D34
	cmp r5, #3
	bhi _08045E24
	movs r6, #0
	movs r4, #0
_08045DB2:
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r7, r3, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r1, #1
	ands r1, r5
	lsls r0, r1, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	str r0, [r7, #4]
	ldr r0, _08045E74 @ =gUnknown_080D8034
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x4c]
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x4c]
	cmp r5, #3
	bls _08045DB2
_08045E24:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045E34: .4byte 0x000003BD
_08045E38: .4byte 0x000003C1
_08045E3C: .4byte 0x0000038D
_08045E40: .4byte 0x0000038E
_08045E44: .4byte 0x00000391
_08045E48: .4byte 0x000001E5
_08045E4C: .4byte 0x000001E9
_08045E50: .4byte 0x0000021D
_08045E54: .4byte 0x0000021E
_08045E58: .4byte 0x00000221
_08045E5C: .4byte 0x0000024D
_08045E60: .4byte 0x0000024E
_08045E64: .4byte 0x00000251
_08045E68: .4byte 0x000002B1
_08045E6C: .4byte 0x000002AF
_08045E70: .4byte 0x000002B5
_08045E74: .4byte gUnknown_080D8034

	thumb_func_start sub_8045E78
sub_8045E78: @ 0x08045E78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x22]
	subs r1, r2, #1
	strh r1, [r4, #0x22]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x69
	bhi _08045F78
	adds r0, r2, #0
	subs r0, #0x5c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bhi _08045ED8
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r5, r4, r0
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r2, _08045ED0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldrh r0, [r4, #0x22]
	cmp r0, #0x2d
	bne _08045EC0
	ldr r2, _08045ED4 @ =0x0000038D
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
_08045EC0:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	b _08045F78
	.align 2, 0
_08045ED0: .4byte gCamera
_08045ED4: .4byte 0x0000038D
_08045ED8:
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _08045F36
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08045F30
	movs r0, #0xa0
	lsls r0, r0, #1
	b _08045F34
_08045EEE:
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r4, #8]
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r0, r0, r4
	str r0, [r3, #8]
	ldr r2, _08045F28 @ =gSineTable
	ldr r1, _08045F2C @ =0x000003FF
	ands r1, r5
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #5
	strh r0, [r3, #0xc]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r0, r0, #5
	strh r0, [r3, #0xe]
	movs r0, #0xff
	strb r0, [r3]
	b _08045F78
	.align 2, 0
_08045F28: .4byte gSineTable
_08045F2C: .4byte 0x000003FF
_08045F30:
	movs r0, #0xe1
	lsls r0, r0, #1
_08045F34:
	strh r0, [r4, #0x22]
_08045F36:
	ldrh r0, [r4, #0x22]
	movs r1, #0x1e
	bl Mod
	cmp r0, #0
	bne _08045F78
	ldr r2, _08045F80 @ =gPlayer
	ldr r0, [r2, #0xc]
	ldr r1, [r4, #8]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r2, #8]
	ldr r2, [r4, #4]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0
_08045F62:
	lsls r0, r1, #4
	adds r0, #0x3c
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08045EEE
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _08045F62
_08045F78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045F80: .4byte gPlayer

	thumb_func_start sub_8045F84
sub_8045F84: @ 0x08045F84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0xe7
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r1, #0
	mov r8, r1
	movs r6, #0
	ldr r2, _08045FC4 @ =gCamera
	mov sb, r2
_08045F9E:
	lsls r0, r6, #4
	adds r0, #0x3c
	adds r4, r7, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804602A
	subs r0, #1
	strb r0, [r4]
	ldr r0, _08045FC8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08045FCC
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #4]
	b _08045FD8
	.align 2, 0
_08045FC4: .4byte gCamera
_08045FC8: .4byte gPlayer
_08045FCC:
	ldr r0, [r4, #4]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0xc
	ldrsh r1, [r4, r2]
_08045FD8:
	adds r0, r0, r1
	str r0, [r4, #4]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	mov r1, r8
	cmp r1, #0
	bne _08045FF6
	adds r0, r5, #0
	bl sub_8004558
	movs r2, #1
	mov r8, r2
_08045FF6:
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804600E
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	adds r0, r5, #0
	bl sub_800C84C
_0804600E:
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	mov r2, sb
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_0804602A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _08045F9E
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8046040
sub_8046040: @ 0x08046040
	push {r4, r5, r6, lr}
	ldr r6, _080460C4 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_80478D4
	adds r0, r4, #0
	bl sub_804683C
	adds r0, r4, #0
	bl sub_8046C28
	adds r0, r4, #0
	bl sub_8047700
	adds r0, r4, #0
	bl sub_8045E78
	adds r0, r4, #0
	bl sub_8045F84
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046328
	adds r0, r4, #0
	bl sub_804766C
	ldr r1, _080460C8 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080460BC
	ldr r2, _080460CC @ =IWRAM_START + 0x2B
	adds r0, r5, r2
	strb r1, [r0]
	str r1, [r4, #0x10]
	movs r0, #0x80
	str r0, [r4]
	ldr r2, _080460D0 @ =IWRAM_START + 0x1C0
	adds r0, r5, r2
	strb r1, [r0]
	ldr r2, _080460D4 @ =gPlayer
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_802A018
	ldr r1, [r6]
	ldr r0, _080460D8 @ =sub_80460DC
	str r0, [r1, #8]
_080460BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080460C4: .4byte gCurTask
_080460C8: .4byte IWRAM_START + 0x28
_080460CC: .4byte IWRAM_START + 0x2B
_080460D0: .4byte IWRAM_START + 0x1C0
_080460D4: .4byte gPlayer
_080460D8: .4byte sub_80460DC

	thumb_func_start sub_80460DC
sub_80460DC: @ 0x080460DC
	push {r4, r5, r6, lr}
	ldr r0, _08046110 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _08046114 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x15
	bl Mod
	cmp r0, #0
	bne _080460FE
	movs r0, #0x90
	bl m4aSongNumStart
_080460FE:
	ldr r0, [r5]
	cmp r0, #0x3f
	bls _0804611C
	subs r0, #0x40
	lsls r2, r0, #8
	ldr r1, _08046118 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	b _0804611E
	.align 2, 0
_08046110: .4byte gCurTask
_08046114: .4byte gUnknown_03005590
_08046118: .4byte 0x000003FF
_0804611C:
	movs r2, #0
_0804611E:
	ldr r1, _08046188 @ =gSineTable
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	adds r6, r5, #0
	adds r6, #0x2b
	movs r4, #0
	strb r0, [r6]
	adds r0, r5, #0
	bl sub_80478D4
	adds r0, r5, #0
	bl sub_8045F84
	adds r0, r5, #0
	bl sub_80475D0
	adds r0, r5, #0
	movs r1, #0
	bl sub_804655C
	adds r0, r5, #0
	bl sub_804766C
	adds r0, r5, #0
	bl sub_8047060
	ldr r2, _0804618C @ =gPlayer
	str r4, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _08046180
	strb r0, [r6]
	str r0, [r5, #0x10]
	movs r0, #0x80
	str r0, [r5]
	ldr r0, _08046190 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08046194 @ =sub_8046198
	str r0, [r1, #8]
_08046180:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046188: .4byte gSineTable
_0804618C: .4byte gPlayer
_08046190: .4byte gCurTask
_08046194: .4byte sub_8046198

	thumb_func_start sub_8046198
sub_8046198: @ 0x08046198
	push {r4, r5, r6, lr}
	ldr r6, _08046228 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0804622C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x11
	bl Mod
	cmp r0, #0
	bne _080461BA
	movs r0, #0x90
	bl m4aSongNumStart
_080461BA:
	ldr r0, [r4]
	lsls r0, r0, #8
	ldr r2, _08046230 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08046234 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldr r2, _08046238 @ =IWRAM_START + 0x2B
	adds r1, r5, r2
	movs r2, #0
	strb r0, [r1]
	str r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80478D4
	adds r0, r4, #0
	bl sub_8045F84
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	movs r1, #1
	bl sub_804655C
	adds r0, r4, #0
	bl sub_804766C
	adds r0, r4, #0
	bl sub_8046F00
	adds r0, r4, #0
	bl sub_8047060
	ldr r0, [r4]
	subs r2, r0, #1
	str r2, [r4]
	cmp r2, #0
	bne _08046222
	ldr r1, _0804623C @ =IWRAM_START + 0x1C1
	adds r0, r5, r1
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_804732C
	ldr r1, [r6]
	ldr r0, _08046240 @ =sub_8046244
	str r0, [r1, #8]
_08046222:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046228: .4byte gCurTask
_0804622C: .4byte gUnknown_03005590
_08046230: .4byte 0x000003FF
_08046234: .4byte gSineTable
_08046238: .4byte IWRAM_START + 0x2B
_0804623C: .4byte IWRAM_START + 0x1C1
_08046240: .4byte sub_8046244

	thumb_func_start sub_8046244
sub_8046244: @ 0x08046244
	push {r4, r5, r6, r7, lr}
	ldr r0, _0804630C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x6c
	adds r6, r5, r0
	adds r0, r4, #0
	bl sub_804797C
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046E90
	adds r0, r4, #0
	bl sub_804766C
	adds r0, r4, #0
	bl sub_8047138
	ldr r0, _08046310 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _08046288
	movs r0, #0x90
	bl m4aSongNumStart
_08046288:
	ldr r1, _08046314 @ =IWRAM_START + 0x1C1
	adds r7, r5, r1
	ldrb r0, [r7]
	cmp r0, #0
	bne _080462D4
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r3, _08046318 @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _080462D4
	ldr r1, _0804631C @ =IWRAM_START + 0x20C
	adds r0, r5, r1
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
	movs r0, #1
	strb r0, [r7]
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r3, [r3, #4]
	subs r1, r1, r3
	subs r1, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8039FA4
_080462D4:
	ldr r0, [r4, #0x6c]
	asrs r0, r0, #8
	ldr r1, _08046318 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08046304
	ldr r1, _08046320 @ =0x000001C1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046304
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x96
	movs r2, #5
	bl sub_802EF68
	ldr r0, _0804630C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08046324 @ =sub_8047868
	str r0, [r1, #8]
_08046304:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804630C: .4byte gCurTask
_08046310: .4byte gUnknown_03005590
_08046314: .4byte IWRAM_START + 0x1C1
_08046318: .4byte gCamera
_0804631C: .4byte IWRAM_START + 0x20C
_08046320: .4byte 0x000001C1
_08046324: .4byte sub_8047868

	thumb_func_start sub_8046328
sub_8046328: @ 0x08046328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r5, r7, r0
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r4, _0804651C @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r5, r7, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r2, #0
	mov r8, r2
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r5, r7, r3
	movs r0, #0x2b
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _08046520 @ =gSineTable
	mov sl, r1
_08046398:
	mov r2, r8
	lsls r1, r2, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r4, r0, #0x16
	movs r6, #0
_080463A6:
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r0, _08046524 @ =gUnknown_080D8030
	adds r0, r6, r0
	ldrb r2, [r0]
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r6, r0
	adds r0, r4, r0
	ldr r3, _08046528 @ =0x000003FF
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3, #4]
	subs r1, r1, r0
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r6, r0
	adds r0, r4, r0
	ldr r3, _08046528 @ =0x000003FF
	ands r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080463A6
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046398
	movs r0, #0
	mov r8, r0
_08046424:
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r7, r0
	adds r0, r5, #0
	bl sub_8004558
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046424
	movs r3, #0
	mov r8, r3
	ldr r0, _08046524 @ =gUnknown_080D8030
	ldrb r6, [r0, #3]
	movs r0, #0x80
	lsls r0, r0, #1
	mov sl, r0
_08046456:
	mov r2, r8
	lsls r1, r2, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r4, r0, #0x16
	mov r3, sb
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r1, _08046528 @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	lsls r0, r2, #4
	add r0, r8
	lsls r0, r0, #2
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r7, r0
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov r2, sl
	adds r0, r4, r2
	lsls r0, r0, #1
	ldr r3, _08046520 @ =gSineTable
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r3, _0804651C @ =gCamera
	ldr r0, [r3, #4]
	subs r1, r1, r0
	lsls r0, r4, #1
	ldr r2, _08046520 @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _08046530
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046530
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046530
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046530
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, [r7, #0x18]
	lsrs r0, r0, #8
	strh r0, [r5, #0x38]
	mov r2, sl
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	ldr r3, _0804652C @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x81
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004860
	b _08046536
	.align 2, 0
_0804651C: .4byte gCamera
_08046520: .4byte gSineTable
_08046524: .4byte gUnknown_080D8030
_08046528: .4byte 0x000003FF
_0804652C: .4byte gUnknown_030054B8
_08046530:
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_08046536:
	adds r0, r5, #0
	bl sub_80051E8
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046456
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804655C
sub_804655C: @ 0x0804655C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r5, r7, r0
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r4, _080465DC @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r5, r7, r1
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldr r1, [r7]
	cmp r1, #0x2f
	bhi _080465E0
	cmp r6, #0
	beq _080465E0
	movs r0, #0x30
	subs r0, r0, r1
	movs r1, #0x10
	bl Div
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	b _080465E4
	.align 2, 0
_080465DC: .4byte gCamera
_080465E0:
	movs r2, #0
	str r2, [sp]
_080465E4:
	movs r0, #0
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x2b
	str r1, [sp, #4]
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r5, r7, r2
_080465F4:
	mov r0, r8
	lsls r1, r0, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r6, r0, #0x16
	ldr r4, [sp]
	cmp r4, #2
	bhi _080466EE
	ldr r1, _08046668 @ =gSineTable
	mov sl, r1
	ldr r3, [sp, #4]
	ldr r2, _0804666C @ =0x000003FF
	mov sb, r2
_08046610:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08046678
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r2, _08046670 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov ip, r1
	ldr r0, _08046674 @ =gUnknown_080D8030
	adds r0, r4, r0
	ldrb r2, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	adds r0, r6, r0
	mov r1, sb
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	add r0, ip
	strh r0, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _08046670 @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	adds r0, r6, r0
	b _080466C4
	.align 2, 0
_08046668: .4byte gSineTable
_0804666C: .4byte 0x000003FF
_08046670: .4byte gCamera
_08046674: .4byte gUnknown_080D8030
_08046678:
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r2, _080467FC @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov ip, r1
	ldr r0, _08046800 @ =gUnknown_080D8030
	adds r0, r4, r0
	ldrb r2, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	subs r0, r6, r0
	mov r1, sb
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	add r0, ip
	strh r0, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	mov ip, r1
	ldr r1, _080467FC @ =gCamera
	ldr r0, [r1, #4]
	mov r1, ip
	subs r1, r1, r0
	mov ip, r1
	movs r0, #0
	ldrsb r0, [r3, r0]
	muls r0, r4, r0
	subs r0, r6, r0
_080466C4:
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	mov r2, ip
	adds r1, r2, r0
	strh r1, [r5, #0x18]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #8]
	cmp r4, #2
	bls _08046610
_080466EE:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080466FE
	b _080465F4
_080466FE:
	movs r0, #0
	mov r8, r0
_08046702:
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r7, r0
	adds r0, r5, #0
	bl sub_8004558
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046702
	movs r0, #0
	mov r8, r0
	ldr r0, _08046800 @ =gUnknown_080D8030
	ldrb r4, [r0, #3]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	ldr r2, _08046804 @ =gSineTable
	mov sl, r2
_08046738:
	mov r0, r8
	lsls r1, r0, #0x10
	ldr r0, [r7, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r6, r0, #0x16
	ldr r2, [sp, #4]
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r6, r6, r0
	ldr r1, _08046808 @ =0x000003FF
	adds r0, r1, #0
	ands r6, r0
	mov r2, r8
	lsls r0, r2, #4
	add r0, r8
	lsls r0, r0, #2
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r5, r7, r0
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r2, _080467FC @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov r2, sb
	adds r0, r6, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r2, _080467FC @ =gCamera
	ldr r0, [r2, #4]
	subs r1, r1, r0
	lsls r0, r6, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _08046810
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046810
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046810
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046810
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, [r7, #0x18]
	lsrs r0, r0, #8
	strh r0, [r5, #0x38]
	mov r2, sb
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	ldr r3, _0804680C @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x81
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004860
	b _08046816
	.align 2, 0
_080467FC: .4byte gCamera
_08046800: .4byte gUnknown_080D8030
_08046804: .4byte gSineTable
_08046808: .4byte 0x000003FF
_0804680C: .4byte gUnknown_030054B8
_08046810:
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_08046816:
	adds r0, r5, #0
	bl sub_80051E8
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _08046738
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804683C
sub_804683C: @ 0x0804683C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	bne _0804684E
	b _08046A84
_0804684E:
	adds r1, r7, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804685A
	b _08046990
_0804685A:
	subs r0, #1
	strb r0, [r1]
	movs r5, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046868
	b _08046A18
_08046868:
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r4, [r0]
	cmp r4, #1
	beq _080468C8
	cmp r4, #1
	bgt _0804687C
	cmp r4, #0
	beq _08046882
	b _08046A18
_0804687C:
	cmp r4, #2
	beq _08046904
	b _08046A18
_08046882:
	movs r0, #0xff
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _080468BC @ =0x000002B2
	strh r3, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #3
	strb r2, [r0]
	ldr r0, _080468C0 @ =0x0000027D
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _080468C4 @ =0x00000305
	b _08046972
	.align 2, 0
_080468BC: .4byte 0x000002B2
_080468C0: .4byte 0x0000027D
_080468C4: .4byte 0x00000305
_080468C8:
	movs r0, #0xff
	bl m4aSongNumStart
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r2, _080468FC @ =0x000002B3
	strh r2, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046900 @ =0x000002C1
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	b _08046970
	.align 2, 0
_080468FC: .4byte 0x000002B3
_08046900: .4byte 0x000002C1
_08046904:
	movs r0, #0xff
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _0804697C @ =0x000002B2
	strh r3, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #3
	strb r2, [r0]
	ldr r0, _08046980 @ =0x0000027D
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _08046984 @ =0x00000305
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r3, #1
	strh r3, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #1
	strb r2, [r0]
	ldr r0, _08046988 @ =0x000002C1
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
_08046970:
	ldr r0, _0804698C @ =0x00000349
_08046972:
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	b _08046A18
	.align 2, 0
_0804697C: .4byte 0x000002B2
_08046980: .4byte 0x0000027D
_08046984: .4byte 0x00000305
_08046988: .4byte 0x000002C1
_0804698C: .4byte 0x00000349
_08046990:
	adds r0, r7, #0
	adds r0, #0x27
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _080469E4
	ldr r2, _080469DC @ =gUnknown_080D809E
	adds r4, r7, #0
	adds r4, #0x26
	ldrb r1, [r4]
	adds r3, r7, #0
	adds r3, #0x28
	ldrb r0, [r3]
	lsls r1, r1, #1
	cmp r0, #4
	bhi _080469B2
	adds r1, #0x14
_080469B2:
	adds r0, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r7, #0x20]
	adds r2, r0, r1
	strh r2, [r7, #0x20]
	ldr r6, _080469E0 @ =gUnknown_080D8076
	ldrb r0, [r4]
	ldrb r1, [r3]
	lsls r0, r0, #1
	cmp r1, #4
	bhi _080469CA
	adds r0, #0x14
_080469CA:
	adds r1, r0, r6
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bne _08046A18
	movs r0, #1
	strb r0, [r5]
	b _08046A18
	.align 2, 0
_080469DC: .4byte gUnknown_080D809E
_080469E0: .4byte gUnknown_080D8076
_080469E4:
	cmp r1, #1
	bne _08046A18
	ldr r2, _08046A78 @ =gUnknown_080D809E
	adds r0, r7, #0
	adds r0, #0x26
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x28
	ldrb r1, [r1]
	lsls r0, r0, #1
	cmp r1, #4
	bhi _080469FE
	adds r0, #0x14
_080469FE:
	adds r0, r0, r2
	ldrh r1, [r7, #0x20]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r7, #0x20]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _08046A18
	movs r0, #2
	strb r0, [r5]
	str r1, [r7, #0x18]
	strh r1, [r7, #0x20]
_08046A18:
	ldrh r1, [r7, #0x20]
	ldr r0, [r7, #0x18]
	adds r0, r0, r1
	ldr r1, _08046A7C @ =0x0003FFFF
	ands r0, r1
	str r0, [r7, #0x18]
	ldrh r0, [r7, #0x1e]
	subs r0, #1
	strh r0, [r7, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046A32
	b _08046C08
_08046A32:
	movs r2, #0
	adds r5, r7, #0
	adds r5, #0x27
	ldr r6, _08046A80 @ =gUnknown_080D8034
	movs r4, #0
	movs r3, #0x97
	lsls r3, r3, #2
_08046A40:
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r7, r0
	movs r0, #1
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	strh r0, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08046A40
	movs r0, #0
	strb r0, [r5]
	str r0, [r7, #0x18]
	strh r0, [r7, #0x20]
	b _08046C08
	.align 2, 0
_08046A78: .4byte gUnknown_080D809E
_08046A7C: .4byte 0x0003FFFF
_08046A80: .4byte gUnknown_080D8034
_08046A84:
	ldr r4, _08046B00 @ =gUnknown_030053B8
	ldr r0, [r4]
	ldr r1, _08046B04 @ =0x00196225
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r6, _08046B08 @ =0x3C6EF35F
	adds r0, r0, r6
	str r0, [r4]
	movs r5, #0xff
	ands r0, r5
	movs r1, #0xa
	bl Mod
	ldr r1, _08046B0C @ =gUnknown_080D8044
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x25
	adds r1, r1, r7
	mov sb, r1
	strb r0, [r1]
	ldr r0, [r4]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	str r0, [r4]
	ands r0, r5
	movs r1, #0xa
	bl Mod
	adds r1, r7, #0
	adds r1, #0x26
	strb r0, [r1]
	ldr r2, _08046B10 @ =gUnknown_080D804E
	ldrb r1, [r1]
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r1, r1, #1
	cmp r0, #4
	bhi _08046ADC
	adds r1, #0x14
_08046ADC:
	adds r0, r1, r2
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r7, #0x1e]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	mov r0, sb
	ldrb r4, [r0]
	cmp r4, #1
	beq _08046B5C
	cmp r4, #1
	bgt _08046B14
	cmp r4, #0
	beq _08046B1A
	b _08046C08
	.align 2, 0
_08046B00: .4byte gUnknown_030053B8
_08046B04: .4byte 0x00196225
_08046B08: .4byte 0x3C6EF35F
_08046B0C: .4byte gUnknown_080D8044
_08046B10: .4byte gUnknown_080D804E
_08046B14:
	cmp r4, #2
	beq _08046B98
	b _08046C08
_08046B1A:
	movs r0, #0xfe
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _08046B50 @ =0x000002B2
	strh r3, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #2
	strb r2, [r0]
	ldr r0, _08046B54 @ =0x0000027D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _08046B58 @ =0x00000305
	b _08046C00
	.align 2, 0
_08046B50: .4byte 0x000002B2
_08046B54: .4byte 0x0000027D
_08046B58: .4byte 0x00000305
_08046B5C:
	movs r0, #0xfe
	bl m4aSongNumStart
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r3, _08046B90 @ =0x000002B3
	strh r3, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r2, #2
	strb r2, [r0]
	ldr r0, _08046B94 @ =0x000002C1
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r3, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r2, [r0]
	b _08046BFE
	.align 2, 0
_08046B90: .4byte 0x000002B3
_08046B94: .4byte 0x000002C1
_08046B98:
	movs r0, #0xfe
	bl m4aSongNumStart
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r2, _08046C14 @ =0x000002B2
	strh r2, [r1, #0xa]
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046C18 @ =0x0000027D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1, #0xa]
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046C1C @ =0x00000305
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r2, #1
	strh r2, [r1, #0xa]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
	ldr r0, _08046C20 @ =0x000002C1
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r7, r1
	strb r4, [r0]
_08046BFE:
	ldr r0, _08046C24 @ =0x00000349
_08046C00:
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_08046C08:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046C14: .4byte 0x000002B2
_08046C18: .4byte 0x0000027D
_08046C1C: .4byte 0x00000305
_08046C20: .4byte 0x000002C1
_08046C24: .4byte 0x00000349

	thumb_func_start sub_8046C28
sub_8046C28: @ 0x08046C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046C40
	b _08046E78
_08046C40:
	movs r0, #0
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x2b
	str r1, [sp]
	ldr r0, _08046D24 @ =gUnknown_080D8030
	ldrb r0, [r0, #3]
	mov sl, r0
_08046C50:
	mov r2, r8
	lsls r0, r2, #0x10
	ldr r2, [r4, #0x14]
	adds r2, r2, r0
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x16
	ldr r3, [sp]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r2, r2, r0
	ldr r5, _08046D28 @ =0x000003FF
	adds r0, r5, #0
	ands r2, r0
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	movs r3, #0x97
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r4, r0
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	ldr r3, _08046D2C @ =gSineTable
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r5, #0
	ldrsh r0, [r0, r5]
	mov r5, sl
	muls r5, r0, r5
	adds r0, r5, #0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	mov sb, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r0, [r2, r3]
	mov r5, sl
	muls r5, r0, r5
	adds r0, r5, #0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	mov ip, r1
	ldrh r0, [r4, #0x1e]
	adds r5, r0, #0
	cmp r5, #0
	beq _08046D5C
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r7, r0, #0
	cmp r2, #0
	bne _08046D34
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046D34
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046D34
	ldr r3, _08046D30 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08046D34
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _08046D34
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0xf8
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r3, #0x20]
	str r2, [r3, #0x3c]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r2, #0
	ldrh r5, [r3, #0x10]
	adds r0, r1, r5
	strh r0, [r3, #0x10]
	ldrh r0, [r3, #0x14]
	adds r1, r1, r0
	strh r1, [r3, #0x14]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r3, #0x12]
	b _08046E68
	.align 2, 0
_08046D24: .4byte gUnknown_080D8030
_08046D28: .4byte 0x000003FF
_08046D2C: .4byte gSineTable
_08046D30: .4byte gPlayer
_08046D34:
	lsls r0, r5, #0x10
	cmp r0, #0
	beq _08046D5C
	ldrb r0, [r7]
	cmp r0, #0
	bne _08046D5C
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046D5C
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08046D5C
	b _08046E5A
_08046D5C:
	ldr r3, _08046D90 @ =gPlayer
	ldr r2, [r3, #0x3c]
	movs r5, #0
	cmp r2, r6
	bne _08046D68
	movs r5, #1
_08046D68:
	movs r0, #0x12
	ldrsh r7, [r3, r0]
	ldr r1, [r3, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08046D82
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08046D94
	cmp r2, r6
	bne _08046D94
_08046D82:
	adds r0, r6, #0
	mov r1, sb
	mov r2, ip
	bl sub_800CCB8
	adds r3, r0, #0
	b _08046D96
	.align 2, 0
_08046D90: .4byte gPlayer
_08046D94:
	movs r3, #0
_08046D96:
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r3
	cmp r2, #0
	beq _08046E34
	cmp r5, #0
	bne _08046DC0
	ldr r2, _08046DF8 @ =gPlayer
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08046DC0
	cmp r7, #0
	ble _08046DC0
	ldr r5, _08046DFC @ =0xFFFFFB00
	adds r1, r5, #0
	ldrh r5, [r2, #0x10]
	adds r0, r1, r5
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x14]
	adds r1, r1, r0
	strh r1, [r2, #0x14]
_08046DC0:
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08046E00
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046E00
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _08046E00
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046DE8
	cmp r0, #2
	bne _08046E00
_08046DE8:
	adds r0, r4, #0
	bl sub_8047940
	ldr r0, _08046DF8 @ =gPlayer
	bl sub_800CBA4
	b _08046E78
	.align 2, 0
_08046DF8: .4byte gPlayer
_08046DFC: .4byte 0xFFFFFB00
_08046E00:
	ldr r2, _08046E30 @ =gPlayer
	ldr r1, [r2, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r1, r5
	lsls r0, r3, #0x18
	asrs r0, r0, #0x10
	adds r1, r1, r0
	str r1, [r2, #0xc]
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08046E5A
	mov r3, sb
	subs r1, r3, r0
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	b _08046E5A
	.align 2, 0
_08046E30: .4byte gPlayer
_08046E34:
	cmp r5, #0
	beq _08046E5A
	ldr r3, _08046E88 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3, #0x20]
	str r2, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08046E5A
	ldr r0, _08046E8C @ =0xFFFFFEFF
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r3, #0x20]
_08046E5A:
	mov r5, r8
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	mov r1, sb
	str r1, [r0]
_08046E68:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _08046E78
	b _08046C50
_08046E78:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046E88: .4byte gPlayer
_08046E8C: .4byte 0xFFFFFEFF

	thumb_func_start sub_8046E90
sub_8046E90: @ 0x08046E90
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r5, #0
	adds r7, #0x6c
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, [r5, #0x6c]
	asrs r0, r0, #8
	ldr r6, _08046EF8 @ =gCamera
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r1, _08046EFC @ =0x000001C1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046EF0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, [r5, #0x6c]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08046EF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046EF8: .4byte gCamera
_08046EFC: .4byte 0x000001C1

	thumb_func_start sub_8046F00
sub_8046F00: @ 0x08046F00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	adds r0, #0x6c
	str r0, [sp, #0x20]
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0x31
	bls _08046F1C
	b _0804702E
_08046F1C:
	movs r4, #0x31
	subs r0, r4, r0
	movs r1, #0x10
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	lsls r0, r0, #4
	subs r4, r4, r0
	mov r2, r8
	ldr r0, [r2]
	cmp r4, r0
	bne _0804702E
	movs r0, #0x90
	bl m4aSongNumStart
	movs r7, #0
	mov r4, sp
_08046F42:
	lsls r1, r7, #0x10
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r6, r0, #0x16
	ldr r2, [r3, #4]
	asrs r2, r2, #8
	ldr r5, _08047040 @ =gCamera
	ldr r0, [r5]
	subs r2, r2, r0
	ldr r0, _08047044 @ =gUnknown_080D8030
	ldr r1, [sp, #0x24]
	adds r0, r1, r0
	ldrb r3, [r0]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r6, r5
	lsls r0, r0, #1
	ldr r1, _08047048 @ =gSineTable
	adds r0, r0, r1
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	adds r2, r2, r0
	mov r0, r8
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r5, _08047040 @ =gCamera
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r0, r6, #1
	ldr r5, _08047048 @ =gSineTable
	adds r0, r0, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r5, #0
	adds r7, #1
	mov sl, r7
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
_08046FA2:
	ldr r1, _0804704C @ =gUnknown_030053B8
	ldr r0, [r1]
	ldr r2, _08047050 @ =0x00196225
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r3, _08047054 @ =0x3C6EF35F
	adds r1, r1, r3
	adds r0, r1, #0
	movs r2, #0xf
	ands r0, r2
	adds r0, r7, r0
	subs r0, #8
	str r0, [sp, #0x14]
	ldr r3, _08047050 @ =0x00196225
	adds r2, r1, #0
	muls r2, r3, r2
	ldr r0, _08047054 @ =0x3C6EF35F
	adds r2, r2, r0
	mov r3, sb
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	movs r3, #0xf
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	movs r3, #0
	strh r3, [r4, #0x1c]
	ldr r1, _08047050 @ =0x00196225
	adds r0, r2, #0
	muls r0, r1, r0
	ldr r2, _08047054 @ =0x3C6EF35F
	adds r0, r0, r2
	ldr r1, _0804704C @ =gUnknown_030053B8
	str r0, [r1]
	movs r1, #0x3f
	ands r0, r1
	subs r0, r6, r0
	adds r0, #0x1f
	strh r0, [r4, #0xc]
	lsls r1, r5, #9
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _08047058 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804705C @ =0x0000026B
	strh r0, [r4, #8]
	strh r3, [r4, #0xa]
	str r3, [sp, #4]
	mov r0, sp
	ldr r3, [sp, #0x20]
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r1, r3, r2
	bl sub_8039B54
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08046FA2
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _08046F42
_0804702E:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047040: .4byte gCamera
_08047044: .4byte gUnknown_080D8030
_08047048: .4byte gSineTable
_0804704C: .4byte gUnknown_030053B8
_08047050: .4byte 0x00196225
_08047054: .4byte 0x3C6EF35F
_08047058: .4byte 0x06012980
_0804705C: .4byte 0x0000026B

	thumb_func_start sub_8047060
sub_8047060: @ 0x08047060
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	mov ip, r0
	ldr r0, _08047114 @ =gUnknown_03005590
	ldr r7, [r0]
	movs r0, #0xf
	ands r7, r0
	cmp r7, #0
	bne _08047106
	mov r0, ip
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r3, _08047118 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	mov r0, ip
	ldr r2, [r0, #8]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	subs r2, r2, r0
	ldr r3, _0804711C @ =gUnknown_030053B8
	mov r8, r3
	ldr r0, [r3]
	ldr r6, _08047120 @ =0x00196225
	adds r3, r0, #0
	muls r3, r6, r3
	ldr r5, _08047124 @ =0x3C6EF35F
	adds r3, r3, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x3f
	adds r0, r3, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	adds r1, r3, #0
	muls r1, r6, r1
	adds r1, r1, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r1, #0
	ands r0, r4
	adds r2, r2, r0
	subs r2, #0x1f
	str r2, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	adds r2, r1, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r4
	ldr r0, _08047128 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r0, r8
	str r1, [r0]
	ldr r0, _0804712C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _08047130 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08047134 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, ip
	bl sub_8039B54
_08047106:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047114: .4byte gUnknown_03005590
_08047118: .4byte gCamera
_0804711C: .4byte gUnknown_030053B8
_08047120: .4byte 0x00196225
_08047124: .4byte 0x3C6EF35F
_08047128: .4byte 0x00000407
_0804712C: .4byte 0x000001FF
_08047130: .4byte 0x06012980
_08047134: .4byte 0x0000026B

	thumb_func_start sub_8047138
sub_8047138: @ 0x08047138
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	mov sb, r0
	mov r4, sb
	adds r4, #0x6c
	ldr r0, _080471FC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xa
	bl Mod
	cmp r0, #0
	bne _080471EE
	ldr r0, _08047200 @ =0x000001C1
	add r0, sb
	ldrb r7, [r0]
	cmp r7, #0
	bne _080471EE
	mov r0, sb
	ldr r1, [r0, #0x6c]
	asrs r1, r1, #8
	ldr r3, _08047204 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	subs r2, r2, r0
	ldr r3, _08047208 @ =gUnknown_030053B8
	mov r8, r3
	ldr r0, [r3]
	ldr r6, _0804720C @ =0x00196225
	adds r3, r0, #0
	muls r3, r6, r3
	ldr r5, _08047210 @ =0x3C6EF35F
	adds r3, r3, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x3f
	adds r0, r3, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	adds r1, r3, #0
	muls r1, r6, r1
	adds r1, r1, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r1, #0
	ands r0, r4
	adds r2, r2, r0
	subs r2, #0x1f
	str r2, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	adds r2, r1, #0
	muls r2, r6, r2
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r4
	ldr r0, _08047214 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r5
	mov r0, r8
	str r1, [r0]
	ldr r0, _08047218 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0804721C @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08047220 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sb
	bl sub_8039B54
_080471EE:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080471FC: .4byte gUnknown_03005590
_08047200: .4byte 0x000001C1
_08047204: .4byte gCamera
_08047208: .4byte gUnknown_030053B8
_0804720C: .4byte 0x00196225
_08047210: .4byte 0x3C6EF35F
_08047214: .4byte 0x00000407
_08047218: .4byte 0x000001FF
_0804721C: .4byte 0x06012980
_08047220: .4byte 0x0000026B

	thumb_func_start sub_8047224
sub_8047224: @ 0x08047224
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08047310 @ =gUnknown_03005B4C
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _08047314 @ =IWRAM_START + 0x6C
	adds r2, r1, r0
	mov r3, sb
	ldr r0, [r3, #4]
	adds r0, r0, r7
	str r0, [r3, #4]
	ldr r0, [r3, #8]
	adds r0, r0, r6
	str r0, [r3, #8]
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #0
	ldr r5, _08047318 @ =IWRAM_START + 0xD0
	adds r5, r5, r1
	mov r8, r5
	ldr r0, _0804731C @ =IWRAM_START + 0xD4
	adds r0, r0, r1
	mov ip, r0
	ldr r3, _08047320 @ =IWRAM_START + 0x80
	adds r3, r1, r3
	str r3, [sp, #4]
	ldr r5, _08047324 @ =IWRAM_START + 0x84
	adds r5, r5, r1
	mov sl, r5
	ldr r0, _08047328 @ =IWRAM_START + 0x2C
	adds r0, r1, r0
	str r0, [sp]
_08047280:
	movs r3, #0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r5, r0, #2
_08047288:
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r5
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	add r1, ip
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08047288
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08047280
	movs r4, #0
	ldr r3, [sp, #4]
	mov r8, r3
	ldr r3, [sp]
	mov ip, r4
_080472C0:
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #2
	mov r5, r8
	adds r1, r5, r0
	str r7, [r1]
	add r0, sl
	str r6, [r0]
	adds r2, r3, r2
	mov r0, ip
	str r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080472C0
	movs r4, #0
_080472E2:
	lsls r1, r4, #4
	adds r1, #0x3c
	add r1, sb
	ldr r0, [r1, #4]
	adds r0, r0, r7
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080472E2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047310: .4byte gUnknown_03005B4C
_08047314: .4byte IWRAM_START + 0x6C
_08047318: .4byte IWRAM_START + 0xD0
_0804731C: .4byte IWRAM_START + 0xD4
_08047320: .4byte IWRAM_START + 0x80
_08047324: .4byte IWRAM_START + 0x84
_08047328: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_804732C
sub_804732C: @ 0x0804732C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov ip, r0
	mov r1, ip
	adds r1, #0x6c
	movs r2, #0
	strh r2, [r0, #0x1c]
	ldr r0, [r0, #4]
	mov r3, ip
	str r0, [r3, #0x6c]
	ldr r0, [r3, #8]
	str r0, [r1, #4]
	movs r0, #0xb0
	lsls r0, r0, #3
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r1, #0x10]
	movs r7, #0
	adds r3, #0xd0
	str r3, [sp, #0xc]
	mov r4, ip
	adds r4, #0xd4
	str r4, [sp, #0x14]
	mov r6, ip
	adds r6, #0xd8
	str r6, [sp, #0x1c]
	mov r0, ip
	adds r0, #0xdc
	str r0, [sp, #0x20]
	adds r1, #0x74
	str r1, [sp, #0x24]
	mov r2, ip
	adds r2, #0x80
	str r2, [sp]
	subs r3, #0x4c
	str r3, [sp, #4]
	subs r4, #0x4c
	str r4, [sp, #8]
	subs r6, #0x4c
	str r6, [sp, #0x10]
	subs r0, #0x4c
	str r0, [sp, #0x18]
_0804738C:
	lsls r1, r7, #0x10
	mov r2, ip
	ldr r0, [r2, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x16
	movs r6, #0
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	mov sl, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r5, r3
	lsls r0, r0, #1
	ldr r4, _080474B8 @ =gSineTable
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sb, r1
	lsls r0, r5, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r3, [r0, r4]
	mov r8, r3
_080473BE:
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	add r2, sl
	ldr r0, [sp, #0xc]
	adds r0, r0, r2
	str r0, [sp, #0x28]
	ldr r1, _080474BC @ =gUnknown_080D8030
	adds r0, r6, r1
	ldrb r3, [r0]
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #6
	mov r4, ip
	ldr r0, [r4, #4]
	adds r0, r0, r1
	ldr r1, [sp, #0x28]
	str r0, [r1]
	ldr r0, [sp, #0x14]
	adds r4, r0, r2
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #6
	mov r3, ip
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r4]
	ldr r4, [sp, #0x1c]
	adds r3, r4, r2
	movs r1, #7
	subs r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [r3]
	ldr r0, [sp, #0x20]
	adds r1, r0, r2
	movs r0, #1
	str r0, [r1]
	ldr r1, [sp, #0x24]
	adds r2, r1, r2
	str r5, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _080473BE
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0804738C
	movs r7, #0
	ldr r2, _080474BC @ =gUnknown_080D8030
	ldrb r4, [r2, #3]
	ldr r3, _080474B8 @ =gSineTable
	mov r8, r3
	movs r1, #6
	subs r1, r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	mov sb, r0
_0804743C:
	lsls r1, r7, #0x10
	mov r6, ip
	ldr r0, [r6, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x16
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #2
	ldr r0, [sp]
	adds r3, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	lsls r0, r0, #1
	add r0, r8
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r1, r4, #0
	muls r1, r0, r1
	asrs r1, r1, #6
	mov r6, ip
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r3, r0, r2
	lsls r0, r5, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r3]
	ldr r3, [sp, #8]
	adds r0, r3, r2
	mov r6, sb
	str r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	str r0, [r1]
	ldr r1, [sp, #0x18]
	adds r2, r1, r2
	str r5, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0804743C
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080474B8: .4byte gSineTable
_080474BC: .4byte gUnknown_080D8030

	thumb_func_start sub_80474C0
sub_80474C0: @ 0x080474C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	movs r7, #0xfe
	lsls r7, r7, #1
	add r7, r8
	movs r0, #0
	mov sb, r0
	mov r1, r8
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _08047598
	subs r0, #1
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080474F2
	movs r0, #0x8f
	bl m4aSongNumStart
	b _080474F8
_080474F2:
	movs r0, #0xeb
	bl m4aSongNumStart
_080474F8:
	mov r1, r8
	adds r1, #0x2a
	movs r0, #0x1e
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804757C
	ldr r0, _08047564 @ =0x000002B5
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08047568 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0804756C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08047588
	ldr r0, _08047570 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047588
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08047574 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08047558
	movs r0, #0xff
_08047558:
	strb r0, [r1]
	ldr r1, _08047578 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08047588
	.align 2, 0
_08047564: .4byte 0x000002B5
_08047568: .4byte gUnknown_03005450
_0804756C: .4byte 0x0000C350
_08047570: .4byte gGameMode
_08047574: .4byte gUnknown_03005448
_08047578: .4byte gUnknown_030054A8
_0804757C:
	movs r0, #0
	ldr r1, _08047594 @ =0x000002B5
	strh r1, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
_08047588:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	b _0804759C
	.align 2, 0
_08047594: .4byte 0x000002B5
_08047598:
	movs r0, #1
	mov sb, r0
_0804759C:
	ldr r0, _080475C8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _080475B8
	mov r0, r8
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bne _080475B8
	ldr r1, _080475CC @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_080475B8:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080475C8: .4byte gCurrentLevel
_080475CC: .4byte gUnknown_030054A8

	thumb_func_start sub_80475D0
sub_80475D0: @ 0x080475D0
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r4, r3, r0
	adds r1, r3, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0
	beq _08047630
	adds r2, r3, #0
	adds r2, #0x29
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804765E
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047614
	ldr r0, _08047610 @ =0x000002B5
	strh r0, [r4, #0xa]
	movs r2, #0x87
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _08047620
	.align 2, 0
_08047610: .4byte 0x000002B5
_08047614:
	movs r0, #0
	ldr r1, _0804762C @ =0x000002B5
	strh r1, [r4, #0xa]
	movs r2, #0x87
	lsls r2, r2, #2
	adds r1, r3, r2
_08047620:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _0804765C
	.align 2, 0
_0804762C: .4byte 0x000002B5
_08047630:
	adds r1, r3, #0
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804765E
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804765E
	movs r1, #0
	ldr r0, _08047664 @ =0x000002B5
	strh r0, [r4, #0xa]
	movs r4, #0x87
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _08047668 @ =0x0000021D
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_0804765C:
	strb r0, [r1]
_0804765E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047664: .4byte 0x000002B5
_08047668: .4byte 0x0000021D

	thumb_func_start sub_804766C
sub_804766C: @ 0x0804766C
	push {r4, r5, r6, r7, lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080476BC
	movs r3, #0
	ldr r0, _080476AC @ =gFlags
	mov ip, r0
	ldr r7, _080476B0 @ =gObjPalette
	ldr r6, _080476B4 @ =gUnknown_080D80C6
	ldr r5, _080476B8 @ =gUnknown_03005590
	movs r4, #2
_08047684:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08047684
	b _080476E0
	.align 2, 0
_080476AC: .4byte gFlags
_080476B0: .4byte gObjPalette
_080476B4: .4byte gUnknown_080D80C6
_080476B8: .4byte gUnknown_03005590
_080476BC:
	movs r3, #0
	ldr r1, _080476F4 @ =gFlags
	mov ip, r1
	ldr r4, _080476F8 @ =gObjPalette
	ldr r2, _080476FC @ =gUnknown_080D80E6
_080476C6:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _080476C6
_080476E0:
	mov r1, ip
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080476F4: .4byte gFlags
_080476F8: .4byte gObjPalette
_080476FC: .4byte gUnknown_080D80E6

	thumb_func_start sub_8047700
sub_8047700: @ 0x08047700
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #1
	adds r0, r0, r4
	mov r8, r0
	ldr r0, [r4, #4]
	asrs r7, r0, #8
	ldr r1, [r4, #8]
	asrs r6, r1, #8
	bl sub_80122DC
	ldr r5, _08047760 @ =gPlayer
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #1
	bl sub_800C320
	cmp r0, #0
	beq _08047764
	ldr r1, [r5, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	ble _08047750
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r2, [r5, #0x10]
	adds r0, r0, r2
	strh r0, [r5, #0x10]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	str r0, [r5, #8]
_08047750:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r5, #0x12]
	adds r0, r0, r2
	strh r0, [r5, #0x12]
	b _080477DA
	.align 2, 0
_08047760: .4byte gPlayer
_08047764:
	movs r0, #0x2a
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080477DA
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	beq _08047794
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0804779C
_08047794:
	adds r0, r4, #0
	bl sub_80474C0
	b _080477DA
_0804779C:
	str r5, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r2, r0, #0
	cmp r2, #1
	bne _080477DA
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r3, r4, r1
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0x1e
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _080477DA
	ldr r0, _080477E8 @ =0x000002B5
	strh r0, [r3, #0xa]
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _080477EC @ =0x0000021D
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
_080477DA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080477E8: .4byte 0x000002B5
_080477EC: .4byte 0x0000021D

	thumb_func_start sub_80477F0
sub_80477F0: @ 0x080477F0
	push {r4, r5, lr}
	ldr r0, _0804785C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_804787C
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046328
	ldr r1, [r4]
	cmp r1, #0x3f
	bhi _08047836
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08047828
	ldr r0, _08047860 @ =IWRAM_START + 0x2B
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08047828:
	ldr r1, [r4, #0x10]
	subs r1, #0x2c
	ldr r0, [r4]
	subs r0, #0x20
	lsls r0, r0, #2
	subs r1, r1, r0
	str r1, [r4, #0x10]
_08047836:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _08047854
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, _0804785C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08047864 @ =sub_8046040
	str r0, [r1, #8]
_08047854:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804785C: .4byte gCurTask
_08047860: .4byte IWRAM_START + 0x2B
_08047864: .4byte sub_8046040

	thumb_func_start sub_8047868
sub_8047868: @ 0x08047868
	push {lr}
	ldr r0, _08047878 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08047878: .4byte gCurTask

	thumb_func_start sub_804787C
sub_804787C: @ 0x0804787C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	ldr r0, [r4]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r1, [r4, #4]
	adds r1, r1, r2
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _080478CC @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	adds r0, r0, r1
	ldr r1, _080478D0 @ =0x0003FFFF
	ands r0, r1
	str r0, [r4, #0x14]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080478CC: .4byte sub_801EE64
_080478D0: .4byte 0x0003FFFF

	thumb_func_start sub_80478D4
sub_80478D4: @ 0x080478D4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08047934 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x10]
	adds r0, r0, r2
	ldr r1, _08047938 @ =0x0003FFFF
	ands r0, r1
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0804792A
	ldr r0, _0804793C @ =0xFFFFFF00
	cmp r2, r0
	beq _0804792A
	subs r0, r2, #1
	str r0, [r4, #0x10]
_0804792A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047934: .4byte sub_801EE64
_08047938: .4byte 0x0003FFFF
_0804793C: .4byte 0xFFFFFF00

	thumb_func_start sub_8047940
sub_8047940: @ 0x08047940
	push {lr}
	adds r2, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047970
	ldr r0, _08047974 @ =0x000002B5
	strh r0, [r3, #0xa]
	subs r0, #0x99
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08047978 @ =0x0000021D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_08047970:
	pop {r0}
	bx r0
	.align 2, 0
_08047974: .4byte 0x000002B5
_08047978: .4byte 0x0000021D

	thumb_func_start sub_804797C
sub_804797C: @ 0x0804797C
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x6c
	ldr r0, [r4, #0xc]
	adds r0, #0x30
	str r0, [r4, #0xc]
	ldr r0, [r2, #0x6c]
	ldr r1, [r4, #8]
	adds r0, r0, r1
	str r0, [r2, #0x6c]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #0x14
	ldr r1, [r2, #0x6c]
	asrs r1, r1, #8
	ldr r2, _080479EC @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _080479E2
	ldr r0, [r4, #8]
	subs r0, #0x40
	str r0, [r4, #8]
	cmp r0, #0
	bge _080479C4
	movs r0, #0
	str r0, [r4, #8]
_080479C4:
	ldr r1, [r4, #0xc]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	str r0, [r4, #0xc]
	lsls r1, r5, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_080479E2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080479EC: .4byte sub_801EC3C

	thumb_func_start sub_80479F0
sub_80479F0: @ 0x080479F0
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08047A48 @ =IWRAM_START + 0x3A0
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A4C @ =IWRAM_START + 0x370
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A50 @ =IWRAM_START + 0x1C8
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A54 @ =IWRAM_START + 0x200
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A58 @ =IWRAM_START + 0x260
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A5C @ =IWRAM_START + 0x2A4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _08047A60 @ =IWRAM_START + 0x230
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _08047A64 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047A48: .4byte IWRAM_START + 0x3A0
_08047A4C: .4byte IWRAM_START + 0x370
_08047A50: .4byte IWRAM_START + 0x1C8
_08047A54: .4byte IWRAM_START + 0x200
_08047A58: .4byte IWRAM_START + 0x260
_08047A5C: .4byte IWRAM_START + 0x2A4
_08047A60: .4byte IWRAM_START + 0x230
_08047A64: .4byte gUnknown_03005B4C

	thumb_func_start sub_8047A68
sub_8047A68: @ 0x08047A68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r2, _08047B00 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08047B04 @ =gBgCntRegs
	movs r2, #0
	movs r1, #0
	ldr r0, _08047B08 @ =0x00005A0D
	strh r0, [r3]
	ldr r0, _08047B0C @ =gBgScrollRegs
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r0, _08047B10 @ =gUnknown_03004D80
	strb r2, [r0]
	ldr r1, _08047B14 @ =gUnknown_03002280
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x40
	strb r0, [r1, #3]
	ldr r2, _08047B18 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _08047B1C @ =gUnknown_030053B8
	ldr r0, _08047B20 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08047B24 @ =gUnknown_03005AF0
	ldr r0, [r2, #0x1c]
	ldr r1, _08047B28 @ =0xFFFFCFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, _08047B2C @ =sub_8048ED8
	movs r1, #0xf6
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _08047B30 @ =sub_8049380
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _08047B34 @ =gUnknown_03005B4C
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, _08047B38 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08047B40
	ldr r0, _08047B3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _08047B40
	movs r0, #6
	b _08047B42
	.align 2, 0
_08047B00: .4byte gDispCnt
_08047B04: .4byte gBgCntRegs
_08047B08: .4byte 0x00005A0D
_08047B0C: .4byte gBgScrollRegs
_08047B10: .4byte gUnknown_03004D80
_08047B14: .4byte gUnknown_03002280
_08047B18: .4byte gPlayer
_08047B1C: .4byte gUnknown_030053B8
_08047B20: .4byte gUnknown_03005590
_08047B24: .4byte gUnknown_03005AF0
_08047B28: .4byte 0xFFFFCFFF
_08047B2C: .4byte sub_8048ED8
_08047B30: .4byte sub_8049380
_08047B34: .4byte gUnknown_03005B4C
_08047B38: .4byte gUnknown_030054EC
_08047B3C: .4byte gGameMode
_08047B40:
	movs r0, #8
_08047B42:
	strb r0, [r3, #0x14]
	ldr r1, _08047B6C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _08047B78
	ldrb r0, [r3, #0x14]
	lsrs r0, r0, #1
	strb r0, [r3, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _08047B78
	ldr r0, _08047B70 @ =0x00942E00
	str r0, [r3, #4]
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r3, #8]
	ldr r0, _08047B74 @ =0x00958C00
	b _08047B86
	.align 2, 0
_08047B6C: .4byte gCurrentLevel
_08047B70: .4byte 0x00942E00
_08047B74: .4byte 0x00958C00
_08047B78:
	movs r0, #0x82
	lsls r0, r0, #0xa
	str r0, [r3, #4]
	movs r0, #0x8c
	lsls r0, r0, #8
	str r0, [r3, #8]
	ldr r0, _08047DF8 @ =0x00033E00
_08047B86:
	str r0, [r3, #0x10]
	movs r2, #0
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strb r2, [r3, #0x15]
	strb r2, [r3, #0x16]
	strh r1, [r3, #0x1c]
	strh r1, [r3, #0x1e]
	strh r1, [r3, #0x20]
	strh r1, [r3, #0x22]
	strh r1, [r3, #0x2a]
	strh r1, [r3, #0x32]
	strb r2, [r3, #0x18]
	strb r2, [r3, #0x17]
	strb r2, [r3, #0x19]
	strb r2, [r3, #0x1a]
	str r1, [r3]
	adds r0, r3, #0
	adds r0, #0x65
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r4, r3, #0
	adds r4, #0x28
	movs r5, #0
	ldr r6, _08047DFC @ =gUnknown_080D8710
	movs r0, #0x58
	adds r0, r0, r3
	mov r8, r0
	ldr r1, _08047E00 @ =gUnknown_080D86D4
	mov ip, r1
	movs r2, #0x68
	adds r2, r2, r3
	mov sb, r2
	movs r0, #0x88
	adds r0, r0, r3
	mov sl, r0
	adds r1, r3, #0
	adds r1, #0x89
	str r1, [sp, #0x14]
	adds r2, r3, #0
	adds r2, #0x8a
	str r2, [sp, #0x18]
	adds r0, r3, #0
	adds r0, #0x8d
	str r0, [sp, #0x1c]
	movs r1, #0xd4
	lsls r1, r1, #1
	adds r1, r3, r1
	str r1, [sp, #4]
	ldr r2, _08047E04 @ =0x000001A9
	adds r2, r3, r2
	str r2, [sp, #8]
	movs r0, #0xd5
	lsls r0, r0, #1
	adds r0, r3, r0
	str r0, [sp, #0xc]
	ldr r1, _08047E08 @ =0x000001AD
	adds r1, r3, r1
	str r1, [sp, #0x10]
	movs r2, #0xec
	lsls r2, r2, #1
	adds r2, r3, r2
	str r2, [sp, #0x20]
	ldr r0, _08047E0C @ =0x000001D9
	adds r0, r3, r0
	str r0, [sp, #0x24]
	movs r1, #0xed
	lsls r1, r1, #1
	adds r1, r3, r1
	str r1, [sp, #0x28]
	ldr r2, _08047E10 @ =0x000001DD
	adds r2, r3, r2
	str r2, [sp, #0x2c]
	ldr r7, _08047E14 @ =gUnknown_080D859C
_08047C22:
	lsls r0, r5, #2
	adds r0, r0, r7
	ldr r1, [r0]
	adds r1, #2
	movs r2, #0
_08047C2C:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08047C2C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08047C22
	movs r4, #0
	str r4, [r3, #0x5c]
	ldrh r0, [r6, #0x38]
	movs r5, #0
	mov r1, r8
	strh r0, [r1]
	movs r0, #0xe
	strb r0, [r3, #0x1b]
	ldr r0, [r3, #0x5c]
	ldr r1, _08047E18 @ =0x00000FFF
	ands r0, r1
	str r0, [r3, #0x5c]
	mov r2, ip
	ldr r0, [r2, #0x38]
	str r0, [r3, #0x60]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r3, #0x18]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	strb r0, [r3, #0x19]
	movs r0, #0x27
	str r3, [sp, #0x30]
	bl VramMalloc
	ldr r3, [sp, #0x30]
	movs r2, #0xf4
	lsls r2, r2, #1
	adds r1, r3, r2
	str r0, [r1]
	mov r7, sb
	movs r0, #0x20
	strh r0, [r7, #0x16]
	movs r0, #0x28
	strh r0, [r7, #0x18]
	ldr r0, _08047E1C @ =0x0600C000
	str r0, [r7, #4]
	ldr r0, _08047E20 @ =0x000002B6
	strh r0, [r7, #0xa]
	mov r0, sl
	strb r5, [r0]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	ldr r0, [sp, #0x1c]
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x86
	lsls r0, r0, #0xb
	str r0, [r7, #0x10]
	movs r5, #0
	movs r1, #0
	mov r8, r1
	movs r6, #0
_08047CCE:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x98
	adds r7, r3, r0
	strh r6, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r4, r5, #3
	lsls r4, r4, #3
	ldr r2, _08047E24 @ =gUnknown_080D8108
	adds r4, r4, r2
	ldr r0, [r4]
	str r3, [sp, #0x30]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x1b
	lsls r0, r0, #6
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	mov r2, r8
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r5, #4
	bls _08047CCE
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r7, r3, r2
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r1, _08047E24 @ =gUnknown_080D8108
	ldr r0, [r1, #0x10]
	str r3, [sp, #0x30]
	bl VramMalloc
	mov sb, r0
	str r0, [r7, #4]
	ldr r2, _08047E24 @ =gUnknown_080D8108
	ldrh r2, [r2, #0x14]
	mov r8, r2
	strh r2, [r7, #0xa]
	ldr r0, _08047E24 @ =gUnknown_080D8108
	ldrb r6, [r0, #0x16]
	ldr r1, [sp, #4]
	strb r6, [r1]
	movs r5, #0xc8
	lsls r5, r5, #3
	strh r5, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	mov r1, sl
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r2, #0
	ldr r1, [sp, #0x10]
	strb r2, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r3, [sp, #0x30]
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r7, r3, r2
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r3, sb
	str r3, [r7, #4]
	mov r0, r8
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0x20]
	strb r6, [r1]
	strh r5, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, [sp, #0x24]
	ldrb r0, [r2]
	mov r3, sl
	orrs r0, r3
	strb r0, [r2]
	movs r1, #0x10
	ldr r0, [sp, #0x28]
	strb r1, [r0]
	movs r3, #0
	ldr r2, [sp, #0x2c]
	strb r3, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047DF8: .4byte 0x00033E00
_08047DFC: .4byte gUnknown_080D8710
_08047E00: .4byte gUnknown_080D86D4
_08047E04: .4byte 0x000001A9
_08047E08: .4byte 0x000001AD
_08047E0C: .4byte 0x000001D9
_08047E10: .4byte 0x000001DD
_08047E14: .4byte gUnknown_080D859C
_08047E18: .4byte 0x00000FFF
_08047E1C: .4byte 0x0600C000
_08047E20: .4byte 0x000002B6
_08047E24: .4byte gUnknown_080D8108

	thumb_func_start sub_8047E28
sub_8047E28: @ 0x08047E28
	push {r4, r5, r6, r7, lr}
	ldr r7, _08047EAC @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r1, _08047EB0 @ =gUnknown_080D874C
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_8048408
	adds r0, r4, #0
	bl sub_80492B8
	adds r0, r4, #0
	bl sub_8048858
	adds r0, r4, #0
	bl sub_8048E64
	adds r0, r4, #0
	bl sub_80480E8
	adds r0, r4, #0
	bl sub_804931C
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _08047EC8
	ldr r5, _08047EB4 @ =gUnknown_03005424
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08047E86
	ldr r0, _08047EB8 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0x20]
_08047E86:
	bl sub_802A018
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	strb r1, [r4, #0x18]
	ldr r2, _08047EBC @ =IWRAM_START + 0x64
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r1, [r5]
	ldr r0, _08047EC0 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r5]
	ldr r1, [r7]
	ldr r0, _08047EC4 @ =sub_8047F0C
	str r0, [r1, #8]
	b _08047EFE
	.align 2, 0
_08047EAC: .4byte gCurTask
_08047EB0: .4byte gUnknown_080D874C
_08047EB4: .4byte gUnknown_03005424
_08047EB8: .4byte gPlayer
_08047EBC: .4byte IWRAM_START + 0x64
_08047EC0: .4byte 0x0000FF7F
_08047EC4: .4byte sub_8047F0C
_08047EC8:
	ldr r0, _08047EE4 @ =gPlayer
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08047EEC
	ldr r0, _08047EE8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	b _08047EFE
	.align 2, 0
_08047EE4: .4byte gPlayer
_08047EE8: .4byte gUnknown_03005424
_08047EEC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08047EFE
	ldr r2, _08047F04 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08047F08 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
_08047EFE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047F04: .4byte gUnknown_03005424
_08047F08: .4byte 0x0000FF7F

	thumb_func_start sub_8047F0C
sub_8047F0C: @ 0x08047F0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _080480A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, sb
	adds r7, r1, r0
	ldr r2, _080480A4 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _080480A8 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r0, r7, #0
	bl sub_8048654
	adds r0, r7, #0
	bl sub_8048E64
	adds r0, r7, #0
	bl sub_80480E8
	adds r0, r7, #0
	bl sub_804931C
	ldr r4, _080480AC @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _08047F5E
	movs r0, #0x90
	bl m4aSongNumStart
_08047F5E:
	ldr r0, [r4]
	movs r1, #7
	bl Mod
	ldr r1, _080480B0 @ =IWRAM_START + 0x65
	add r1, sb
	mov sl, r1
	cmp r0, #0
	bne _0804800A
	ldrb r6, [r1]
	cmp r6, #0
	bne _08048060
	ldr r0, _080480B4 @ =gUnknown_030053B8
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _080480B8 @ =0x00196225
	mov ip, r1
	mov r2, ip
	muls r2, r0, r2
	ldr r5, _080480BC @ =0x3C6EF35F
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r4, _080480C0 @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0x3f
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	mov r1, ip
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, r2, r5
	mov r0, r8
	str r2, [r0]
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	mov r4, sp
	mov r1, ip
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, r2, r5
	adds r1, r2, #0
	ands r1, r3
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	mov r3, sp
	mov r1, ip
	muls r1, r2, r1
	adds r1, r1, r5
	mov r0, r8
	str r1, [r0]
	ldr r0, _080480C4 @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _080480C8 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _080480CC @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	str r6, [sp, #4]
	ldr r1, _080480D0 @ =IWRAM_START + 0x64
	add r1, sb
	bl sub_8039B54
_0804800A:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _08048060
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r2, _080480C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _08048060
	ldr r1, _080480D4 @ =IWRAM_START + 0x68
	add r1, sb
	ldr r0, _080480D8 @ =0x000002B6
	strh r0, [r1, #0xa]
	ldr r1, _080480DC @ =IWRAM_START + 0x88
	add r1, sb
	movs r0, #4
	strb r0, [r1]
	ldr r1, _080480E0 @ =IWRAM_START + 0x89
	add r1, sb
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	mov r1, sl
	strb r0, [r1]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	subs r1, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x90
	lsls r2, r2, #6
	bl sub_8039FA4
_08048060:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, _080480C0 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08048090
	adds r0, r7, #0
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _08048090
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x96
	movs r2, #6
	bl sub_802EF68
	ldr r0, _080480A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080480E4 @ =sub_8048F44
	str r0, [r1, #8]
_08048090:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080480A0: .4byte gCurTask
_080480A4: .4byte gUnknown_03005424
_080480A8: .4byte 0x0000FF7F
_080480AC: .4byte gUnknown_03005590
_080480B0: .4byte IWRAM_START + 0x65
_080480B4: .4byte gUnknown_030053B8
_080480B8: .4byte 0x00196225
_080480BC: .4byte 0x3C6EF35F
_080480C0: .4byte gCamera
_080480C4: .4byte 0x000001FF
_080480C8: .4byte 0x06012980
_080480CC: .4byte 0x0000026B
_080480D0: .4byte IWRAM_START + 0x64
_080480D4: .4byte IWRAM_START + 0x68
_080480D8: .4byte 0x000002B6
_080480DC: .4byte IWRAM_START + 0x88
_080480E0: .4byte IWRAM_START + 0x89
_080480E4: .4byte sub_8048F44

	thumb_func_start sub_80480E8
sub_80480E8: @ 0x080480E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x68
	movs r4, #0x20
	movs r0, #0x20
	strh r0, [r6, #0x16]
	movs r5, #0x28
	movs r0, #0x28
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_8003914
	ldr r3, _08048148 @ =gBgScrollRegs
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	ldr r1, _0804814C @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	subs r4, r4, r2
	strh r4, [r3]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	subs r5, r5, r0
	strh r5, [r3, #2]
	str r2, [sp, #4]
	adds r1, r2, #0
	adds r1, #0x32
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bls _08048158
	ldr r2, _08048150 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08048154 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08048166
	.align 2, 0
_08048148: .4byte gBgScrollRegs
_0804814C: .4byte gCamera
_08048150: .4byte gDispCnt
_08048154: .4byte 0x0000FEFF
_08048158:
	ldr r0, _0804827C @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_08048166:
	movs r4, #0
	str r4, [sp, #0xc]
	adds r6, r7, #0
	adds r6, #0x1e
	str r6, [sp, #0x2c]
	adds r0, r7, #0
	adds r0, #0x20
	str r0, [sp, #0x30]
_08048176:
	movs r1, #0
	mov r8, r1
	ldr r2, [sp, #0xc]
	lsls r2, r2, #1
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	adds r3, #1
	str r3, [sp, #0x1c]
	ldr r4, [sp, #0xc]
	adds r0, r2, r4
	lsls r0, r0, #1
	str r0, [sp, #0x10]
	ldr r6, [sp, #0x2c]
	adds r6, r6, r0
	mov sl, r6
	ldr r1, [sp, #0x30]
	adds r0, r1, r0
	str r0, [sp, #0x18]
_0804819A:
	mov r2, r8
	cmp r2, #0
	bne _0804828C
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r3, _08048280 @ =gCamera
	ldr r1, [r3]
	subs r1, r0, r1
	str r1, [sp, #4]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r1, r0, r1
	str r1, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	lsls r0, r0, #1
	ldr r1, _08048284 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #0xe
	ldr r4, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #4]
	lsls r2, r2, #1
	ldr r6, _08048284 @ =gSineTable
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #0xe
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	movs r4, #0
	movs r2, #0
	str r2, [sp, #0x28]
	movs r3, #1
	str r3, [sp, #0x20]
	ldr r6, _08048288 @ =gUnknown_080D8788
	mov sb, r6
	mov r0, sp
	ldrh r3, [r0, #4]
	ldr r5, _08048284 @ =gSineTable
	ldrh r2, [r0, #8]
_08048210:
	ldr r1, [sp, #0x28]
	mov r6, r8
	subs r0, r1, r6
	adds r0, r4, r0
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x98
	adds r6, r7, r0
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	muls r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xd
	adds r0, r3, r0
	strh r0, [r6, #0x16]
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	muls r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xd
	adds r0, r2, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r2, [sp, #0x34]
	str r3, [sp, #0x38]
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, [sp, #0x34]
	ldr r3, [sp, #0x38]
	cmp r4, #2
	bls _08048210
	b _08048358
	.align 2, 0
_0804827C: .4byte gDispCnt
_08048280: .4byte gCamera
_08048284: .4byte gSineTable
_08048288: .4byte gUnknown_080D8788
_0804828C:
	mov r2, sl
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	ldr r4, _080483C8 @ =gSineTable
	adds r0, r0, r4
	movs r6, #0
	ldrsh r0, [r0, r6]
	asrs r0, r0, #9
	ldr r2, [sp, #4]
	adds r0, r2, r0
	str r0, [sp, #4]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	asrs r0, r0, #9
	ldr r4, [sp, #8]
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r4, #0
	mov r6, r8
	lsls r6, r6, #3
	str r6, [sp, #0x28]
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x20]
	mov r1, sp
	ldrh r2, [r1, #4]
	strh r2, [r1, #0x14]
	ldr r5, _080483C8 @ =gSineTable
	ldrh r3, [r1, #8]
	mov sb, r3
_080482D2:
	ldr r1, _080483CC @ =gUnknown_080D8788
	ldr r6, [sp, #0x28]
	mov r2, r8
	subs r0, r6, r2
	adds r0, r4, r0
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x98
	adds r6, r7, r0
	ldr r3, [sp, #0x18]
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xb
	mov r3, sp
	ldrh r3, [r3, #0x14]
	adds r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xb
	add r0, sb
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	beq _0804834E
	ldr r0, [r7]
	cmp r0, #0
	bne _0804834E
	movs r3, #0x16
	ldrsh r1, [r6, r3]
	ldr r2, _080483D0 @ =gCamera
	ldr r0, [r2]
	adds r1, r1, r0
	movs r3, #0x18
	ldrsh r2, [r6, r3]
	ldr r3, _080483D0 @ =gCamera
	ldr r0, [r3, #4]
	adds r2, r2, r0
	ldr r0, _080483D4 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
_0804834E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080482D2
_08048358:
	ldr r4, [sp, #0x20]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bhi _08048366
	b _0804819A
_08048366:
	ldr r6, [sp, #0x24]
	ldr r0, [sp, #0xc]
	adds r2, r6, r0
	lsls r0, r2, #1
	ldr r1, [sp, #0x30]
	adds r0, r1, r0
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	ldr r4, _080483C8 @ =gSineTable
	adds r0, r0, r4
	movs r6, #0
	ldrsh r0, [r0, r6]
	movs r3, #0x32
	muls r0, r3, r0
	asrs r0, r0, #0xe
	ldr r4, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #4]
	lsls r1, r1, #1
	ldr r6, _080483C8 @ =gSineTable
	adds r1, r1, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	ldr r6, [sp, #8]
	adds r0, r6, r0
	str r0, [sp, #8]
	lsls r2, r2, #4
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r2, r2, r0
	adds r6, r7, r2
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r6, #0x16]
	mov r2, sp
	ldrh r2, [r2, #8]
	strh r2, [r6, #0x18]
	ldrb r0, [r7, #0x18]
	cmp r0, #0
	beq _080483D8
	movs r0, #0xa0
	lsls r0, r0, #6
	b _080483DC
	.align 2, 0
_080483C8: .4byte gSineTable
_080483CC: .4byte gUnknown_080D8788
_080483D0: .4byte gCamera
_080483D4: .4byte gPlayer
_080483D8:
	movs r0, #0x80
	lsls r0, r0, #6
_080483DC:
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r3, [sp, #0x1c]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #1
	bhi _080483F8
	b _08048176
_080483F8:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8048408
sub_8048408: @ 0x08048408
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x68
	adds r0, r0, r6
	mov sb, r0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	mov r8, r0
	mov r4, r8
	ldr r0, [r6, #8]
	asrs r7, r0, #8
	adds r5, r7, #0
	ldr r1, _08048460 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r2, #0x18]
	ldrb r0, [r6, #0x16]
	cmp r0, #0
	bne _080484B0
	ldr r0, _08048464 @ =gPlayer
	mov sl, r0
	str r0, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08048468
	adds r0, r6, #0
	bl sub_8048D78
	b _08048482
	.align 2, 0
_08048460: .4byte gCamera
_08048464: .4byte gPlayer
_08048468:
	mov r1, sl
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _08048482
	adds r0, r6, #0
	bl sub_804928C
_08048482:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	ldrb r7, [r6, #0x16]
	cmp r7, #0
	bne _080484B0
	ldr r0, _080484C0 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _080484B0
	adds r0, r6, #0
	bl sub_8048D78
	ldr r0, _080484C4 @ =gUnknown_03005498
	ldr r0, [r0, #4]
	strb r7, [r0, #0x15]
_080484B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080484C0: .4byte gPlayer
_080484C4: .4byte gUnknown_03005498

	thumb_func_start sub_80484C8
sub_80484C8: @ 0x080484C8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _080484D4
	b _08048642
_080484D4:
	ldr r0, _080484E4 @ =gUnknown_03005490
	ldr r0, [r0]
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _080484E8
	movs r1, #0
	b _080484FA
	.align 2, 0
_080484E4: .4byte gUnknown_03005490
_080484E8:
	ldr r2, _08048534 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _08048538 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804853C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	adds r1, r3, #0
	ands r1, r0
_080484FA:
	strb r1, [r4, #0x1a]
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080485A8
	cmp r1, #0
	bne _08048578
	movs r2, #1
	strb r2, [r4, #0x17]
	ldr r0, _08048540 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08048550
	movs r0, #6
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048544 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048548 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x18]
	str r0, [r4, #0x60]
	ldr r1, _0804854C @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1a]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1b]
	b _08048640
	.align 2, 0
_08048534: .4byte gUnknown_030053B8
_08048538: .4byte 0x00196225
_0804853C: .4byte 0x3C6EF35F
_08048540: .4byte gUnknown_03005424
_08048544: .4byte 0x00000FFF
_08048548: .4byte gUnknown_080D86D4
_0804854C: .4byte gUnknown_080D8710
_08048550:
	strb r2, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804856C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048570 @ =gUnknown_080D86D4
	ldr r0, [r0, #4]
	str r0, [r4, #0x60]
	ldr r1, _08048574 @ =gUnknown_080D8710
	ldrb r0, [r1, #6]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #7]
	b _08048640
	.align 2, 0
_0804856C: .4byte 0x00000FFF
_08048570: .4byte gUnknown_080D86D4
_08048574: .4byte gUnknown_080D8710
_08048578:
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
	movs r0, #4
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804859C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080485A0 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x10]
	str r0, [r4, #0x60]
	ldr r1, _080485A4 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x13]
	b _08048640
	.align 2, 0
_0804859C: .4byte 0x00000FFF
_080485A0: .4byte gUnknown_080D86D4
_080485A4: .4byte gUnknown_080D8710
_080485A8:
	cmp r1, #0
	bne _08048618
	movs r0, #1
	strb r0, [r4, #0x17]
	ldr r0, _080485DC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080485EC
	movs r0, #8
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _080485E0 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080485E4 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x20]
	str r0, [r4, #0x60]
	ldr r0, _080485E8 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x22
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x23
	b _0804863E
	.align 2, 0
_080485DC: .4byte gUnknown_03005424
_080485E0: .4byte 0x00000FFF
_080485E4: .4byte gUnknown_080D86D4
_080485E8: .4byte gUnknown_080D8710
_080485EC:
	movs r0, #0xd
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804860C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048610 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x34]
	str r0, [r4, #0x60]
	ldr r0, _08048614 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x37
	b _0804863E
	.align 2, 0
_0804860C: .4byte 0x00000FFF
_08048610: .4byte gUnknown_080D86D4
_08048614: .4byte gUnknown_080D8710
_08048618:
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
	movs r0, #0xb
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048648 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _0804864C @ =gUnknown_080D86D4
	ldr r0, [r0, #0x2c]
	str r0, [r4, #0x60]
	ldr r0, _08048650 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x2f
_0804863E:
	ldrb r0, [r0]
_08048640:
	strb r0, [r4, #0x19]
_08048642:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048648: .4byte 0x00000FFF
_0804864C: .4byte gUnknown_080D86D4
_08048650: .4byte gUnknown_080D8710

	thumb_func_start sub_8048654
sub_8048654: @ 0x08048654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _08048764 @ =gUnknown_080D814A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r7, #0xe]
	adds r0, r0, r1
	strh r0, [r7, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0804867E
	strh r1, [r7, #0xe]
_0804867E:
	movs r2, #0xc
	ldrsh r0, [r7, r2]
	ldr r1, [r7, #4]
	adds r1, r1, r0
	str r1, [r7, #4]
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	ldr r0, [r7, #8]
	adds r0, r0, r2
	str r0, [r7, #8]
	asrs r0, r0, #8
	adds r0, #0x1e
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08048768 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _080486D6
	lsls r1, r0, #8
	ldr r0, [r7, #8]
	adds r0, r0, r1
	str r0, [r7, #8]
	movs r4, #0xe
	ldrsh r1, [r7, r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	rsbs r0, r0, #0
	movs r1, #0xa
	bl Div
	strh r0, [r7, #0xe]
	movs r0, #0xc
	ldrsh r1, [r7, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	movs r1, #0xa
	bl Div
	strh r0, [r7, #0xc]
_080486D6:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	str r0, [sp, #8]
	movs r1, #0
	mov r8, r1
	adds r2, r7, #0
	adds r2, #0x1c
	str r2, [sp, #0xc]
	adds r3, r7, #0
	adds r3, #0x1e
	str r3, [sp, #0x10]
	adds r4, r7, #0
	adds r4, #0x20
	str r4, [sp, #0x14]
	ldr r0, _0804876C @ =0xFFFFFF00
	mov sl, r0
_080486F6:
	ldr r0, [r7, #8]
	asrs r6, r0, #8
	mov r1, r8
	lsls r4, r1, #1
	adds r2, r4, r1
	lsls r2, r2, #1
	ldr r3, [sp, #0xc]
	adds r0, r3, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	ldr r1, _08048770 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #0xe
	adds r6, r6, r0
	ldr r0, [sp, #0x10]
	adds r5, r0, r2
	ldrh r0, [r5]
	lsls r0, r0, #1
	ldr r1, _08048770 @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #9
	adds r6, r6, r0
	adds r0, r6, #6
	movs r3, #0
	str r3, [sp]
	ldr r1, _08048768 @ =sub_801EE64
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	mov sb, r4
	cmp r0, #0
	ble _08048774
	ldrh r1, [r5]
	mov r4, sl
	adds r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r0, r2
	bls _0804878A
	adds r0, r1, #2
	b _0804878C
	.align 2, 0
_08048764: .4byte gUnknown_080D814A
_08048768: .4byte sub_801EE64
_0804876C: .4byte 0xFFFFFF00
_08048770: .4byte gSineTable
_08048774:
	ldrh r1, [r5]
	mov r3, sl
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0x80
	lsls r4, r4, #2
	cmp r0, r4
	bls _0804878A
	adds r0, r1, #2
	b _0804878C
_0804878A:
	subs r0, r1, #2
_0804878C:
	strh r0, [r5]
	mov r2, sb
	add r2, r8
	lsls r2, r2, #1
	ldr r0, [sp, #0x10]
	adds r3, r0, r2
	ldrh r0, [r3]
	ldr r4, _080487F4 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _080487F8 @ =gUnknown_080D8148
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r6, r0
	ldr r0, [sp, #0x14]
	adds r4, r0, r2
	ldrh r0, [r4]
	lsls r0, r0, #1
	ldr r1, _080487FC @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x32
	muls r0, r1, r0
	asrs r0, r0, #0xe
	adds r6, r6, r0
	movs r3, #0
	str r3, [sp]
	ldr r0, _08048800 @ =sub_801EE64
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #8]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	ble _08048804
	ldrh r1, [r4]
	mov r2, sl
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	bhi _0804881A
	subs r0, r1, #2
	b _0804881C
	.align 2, 0
_080487F4: .4byte 0x000003FF
_080487F8: .4byte gUnknown_080D8148
_080487FC: .4byte gSineTable
_08048800: .4byte sub_801EE64
_08048804:
	ldrh r1, [r4]
	mov r2, sl
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	bls _0804881A
	subs r0, r1, #2
	b _0804881C
_0804881A:
	adds r0, r1, #2
_0804881C:
	strh r0, [r4]
	mov r2, sb
	add r2, r8
	lsls r2, r2, #1
	ldr r4, [sp, #0x14]
	adds r2, r4, r2
	ldrh r0, [r2]
	ldr r3, _08048854 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bhi _08048842
	b _080486F6
_08048842:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048854: .4byte 0x000003FF

	thumb_func_start sub_8048858
sub_8048858: @ 0x08048858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	movs r1, #8
	rsbs r1, r1, #0
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _0804887C
	movs r2, #8
	str r2, [sp, #0xc]
_0804887C:
	movs r5, #0
	movs r3, #0x1c
	adds r3, r3, r4
	mov sl, r3
	movs r7, #0x1e
	adds r7, r7, r4
	mov sb, r7
	movs r0, #0x20
	adds r0, r0, r4
	mov r8, r0
	ldr r6, _08048910 @ =gSineTable
_08048892:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r2, _08048914 @ =gUnknown_080D8148
	ldrb r1, [r4, #0x18]
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #1
	mov r2, sl
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r7, #0
	ldrsh r2, [r1, r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	subs r1, r1, r2
	asrs r1, r1, #0xe
	adds r0, r0, r1
	mov r2, sb
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r7, #0
	ldrsh r1, [r1, r7]
	asrs r1, r1, #9
	adds r0, r0, r1
	add r3, r8
	ldrh r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #0x32
	muls r1, r2, r1
	asrs r1, r1, #0xe
	adds r0, r0, r1
	movs r1, #0
	str r1, [sp]
	ldr r1, _08048918 @ =sub_801EE64
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #1
	ldr r3, [sp, #0xc]
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bge _08048922
	ldr r2, [r4, #8]
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	beq _0804891C
	lsls r0, r1, #8
	subs r0, r2, r0
	b _08048920
	.align 2, 0
_08048910: .4byte gSineTable
_08048914: .4byte gUnknown_080D8148
_08048918: .4byte sub_801EE64
_0804891C:
	lsls r0, r1, #8
	adds r0, r2, r0
_08048920:
	str r0, [r4, #8]
_08048922:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08048892
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_804893C
sub_804893C: @ 0x0804893C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048998 @ =0x000023FF
	cmp r1, r0
	bls _08048970
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804899C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080489A0 @ =gUnknown_080D86D4
	ldr r0, [r0, #0xc]
	str r0, [r4, #0x60]
	ldr r1, _080489A4 @ =gUnknown_080D8710
	ldrb r0, [r1, #0xe]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0xf]
	strb r0, [r4, #0x19]
_08048970:
	ldr r1, [r4, #0x5c]
	ldr r0, _080489A8 @ =0x00001FFF
	cmp r1, r0
	bls _08048992
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0804898E
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #0
	bl sub_80493F8
	movs r0, #0
	strb r0, [r4, #0x17]
_0804898E:
	ldr r0, _080489AC @ =0x0000FC80
	strh r0, [r4, #0xe]
_08048992:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048998: .4byte 0x000023FF
_0804899C: .4byte 0x00000FFF
_080489A0: .4byte gUnknown_080D86D4
_080489A4: .4byte gUnknown_080D8710
_080489A8: .4byte 0x00001FFF
_080489AC: .4byte 0x0000FC80

	thumb_func_start sub_80489B0
sub_80489B0: @ 0x080489B0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	adds r5, r4, #0
	adds r5, #0x66
	ldrb r0, [r5]
	cmp r0, #0
	bne _080489D4
	ldr r1, [r4, #0x5c]
	ldr r0, _08048A04 @ =0x000035AC
	cmp r1, r0
	bls _080489D4
	ldr r0, _08048A08 @ =0x00000101
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r5]
_080489D4:
	ldr r1, [r4, #0x5c]
	ldr r0, _08048A0C @ =0x000043FF
	cmp r1, r0
	bls _08048A38
	ldr r0, _08048A08 @ =0x00000101
	bl m4aSongNumStart
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _08048A1C
	movs r0, #7
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048A10 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048A14 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x1c]
	str r0, [r4, #0x60]
	ldr r1, _08048A18 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1e]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1f]
	b _08048A36
	.align 2, 0
_08048A04: .4byte 0x000035AC
_08048A08: .4byte 0x00000101
_08048A0C: .4byte 0x000043FF
_08048A10: .4byte 0x00000FFF
_08048A14: .4byte gUnknown_080D86D4
_08048A18: .4byte gUnknown_080D8710
_08048A1C:
	movs r0, #5
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048A40 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048A44 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x60]
	ldr r1, _08048A48 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x16]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x17]
_08048A36:
	strb r0, [r4, #0x19]
_08048A38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048A40: .4byte 0x00000FFF
_08048A44: .4byte gUnknown_080D86D4
_08048A48: .4byte gUnknown_080D8710

	thumb_func_start sub_8048A4C
sub_8048A4C: @ 0x08048A4C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048ACC
	ldr r0, _08048A88 @ =gUnknown_03005490
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08048A98
	movs r0, #0
	strb r0, [r4, #0x17]
	movs r0, #1
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048A8C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048A90 @ =gUnknown_080D86D4
	ldr r0, [r0, #4]
	str r0, [r4, #0x60]
	ldr r1, _08048A94 @ =gUnknown_080D8710
	ldrb r0, [r1, #6]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #7]
	b _08048AB8
	.align 2, 0
_08048A88: .4byte gUnknown_03005490
_08048A8C: .4byte 0x00000FFF
_08048A90: .4byte gUnknown_080D86D4
_08048A94: .4byte gUnknown_080D8710
_08048A98:
	movs r0, #0xc
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048AC0 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048AC4 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x30]
	str r0, [r4, #0x60]
	ldr r0, _08048AC8 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x33
	ldrb r0, [r0]
_08048AB8:
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	b _08048AD0
	.align 2, 0
_08048AC0: .4byte 0x00000FFF
_08048AC4: .4byte gUnknown_080D86D4
_08048AC8: .4byte gUnknown_080D8710
_08048ACC:
	ldrh r0, [r4, #0xc]
	subs r0, #0xc
_08048AD0:
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8048AD8
sub_8048AD8: @ 0x08048AD8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048B3C @ =0x000023FF
	cmp r1, r0
	bls _08048B12
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xa
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048B40 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048B44 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x28]
	str r0, [r4, #0x60]
	ldr r0, _08048B48 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x2b
	ldrb r0, [r0]
	strb r0, [r4, #0x19]
_08048B12:
	ldr r1, [r4, #0x5c]
	ldr r0, _08048B4C @ =0x00001FFF
	cmp r1, r0
	bls _08048B36
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _08048B30
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #1
	bl sub_80493F8
	movs r0, #0
	strb r0, [r4, #0x17]
_08048B30:
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #0xe]
_08048B36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048B3C: .4byte 0x000023FF
_08048B40: .4byte 0x00000FFF
_08048B44: .4byte gUnknown_080D86D4
_08048B48: .4byte gUnknown_080D8710
_08048B4C: .4byte 0x00001FFF

	thumb_func_start sub_8048B50
sub_8048B50: @ 0x08048B50
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	adds r5, r4, #0
	adds r5, #0x66
	ldrb r0, [r5]
	cmp r0, #0
	bne _08048B74
	ldr r1, [r4, #0x5c]
	ldr r0, _08048BA4 @ =0x000035AC
	cmp r1, r0
	bls _08048B74
	ldr r0, _08048BA8 @ =0x00000101
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r5]
_08048B74:
	ldr r1, [r4, #0x5c]
	ldr r0, _08048BAC @ =0x000043FF
	cmp r1, r0
	bls _08048BDE
	ldr r0, _08048BA8 @ =0x00000101
	bl m4aSongNumStart
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _08048BBC
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048BB0 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048BB4 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08048BB8 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	b _08048BDC
	.align 2, 0
_08048BA4: .4byte 0x000035AC
_08048BA8: .4byte 0x00000101
_08048BAC: .4byte 0x000043FF
_08048BB0: .4byte 0x00000FFF
_08048BB4: .4byte gUnknown_080D86D4
_08048BB8: .4byte gUnknown_080D8710
_08048BBC:
	movs r0, #0xc
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048BE4 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048BE8 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x30]
	str r0, [r4, #0x60]
	ldr r0, _08048BEC @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x33
	ldrb r0, [r0]
_08048BDC:
	strb r0, [r4, #0x19]
_08048BDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048BE4: .4byte 0x00000FFF
_08048BE8: .4byte gUnknown_080D86D4
_08048BEC: .4byte gUnknown_080D8710

	thumb_func_start sub_8048BF0
sub_8048BF0: @ 0x08048BF0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048C70
	ldr r0, _08048C30 @ =gUnknown_03005490
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08048C40
	movs r0, #0
	strb r0, [r4, #0x17]
	movs r0, #8
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048C34 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048C38 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x20]
	str r0, [r4, #0x60]
	ldr r0, _08048C3C @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x22
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x23
	ldrb r0, [r0]
	b _08048C5A
	.align 2, 0
_08048C30: .4byte gUnknown_03005490
_08048C34: .4byte 0x00000FFF
_08048C38: .4byte gUnknown_080D86D4
_08048C3C: .4byte gUnknown_080D8710
_08048C40:
	movs r0, #5
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048C64 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048C68 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x60]
	ldr r1, _08048C6C @ =gUnknown_080D8710
	ldrb r0, [r1, #0x16]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x17]
_08048C5A:
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	b _08048C74
	.align 2, 0
_08048C64: .4byte 0x00000FFF
_08048C68: .4byte gUnknown_080D86D4
_08048C6C: .4byte gUnknown_080D8710
_08048C70:
	ldrh r0, [r4, #0xc]
	subs r0, #0xc
_08048C74:
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8048C7C
sub_8048C7C: @ 0x08048C7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x60]
	mov sb, r0
	adds r4, r7, #0
	adds r4, #0x28
	adds r2, r7, #0
	adds r2, #0x1c
	ldr r0, _08048D6C @ =gUnknown_080D8710
	ldrb r1, [r7, #0x1b]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	movs r1, #0
	str r1, [sp]
	ldr r5, [r7, #0x5c]
	lsrs r3, r5, #0xc
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _08048CB8
	movs r0, #1
	str r0, [sp]
_08048CB8:
	movs r1, #7
	mov r8, r1
	movs r0, #7
	ands r6, r0
	ldr r0, _08048D70 @ =0x00000FFF
	mov ip, r0
	mov r1, ip
	ands r1, r5
	mov ip, r1
	mov r0, r8
	ands r3, r0
	adds r1, r7, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	mov r5, r8
	ands r0, r5
	mov r8, r1
	cmp r3, r0
	beq _08048D18
	movs r5, #0
	adds r3, r4, #0
	lsls r1, r6, #1
_08048CE8:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r6, sb
	adds r6, #4
	mov sb, r6
	subs r6, #4
	ldm r6!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08048CE8
	adds r4, r3, #0
_08048D18:
	movs r5, #0
	mov r0, ip
	lsls r6, r0, #0x10
_08048D1E:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r6, #0x10
	str r2, [sp, #4]
	bl sub_80859F4
	ldr r2, [sp, #4]
	strh r0, [r2]
	adds r2, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08048D1E
	mov r1, r8
	ldrh r0, [r1]
	mov r5, sl
	subs r0, r0, r5
	movs r1, #0xe6
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sl
	mov r6, r8
	strh r0, [r6]
	ldrh r1, [r6]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	ldr r1, _08048D74 @ =0x00007FFF
	ands r0, r1
	str r0, [r7, #0x5c]
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048D6C: .4byte gUnknown_080D8710
_08048D70: .4byte 0x00000FFF
_08048D74: .4byte 0x00007FFF

	thumb_func_start sub_8048D78
sub_8048D78: @ 0x08048D78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0x68
	adds r0, r0, r6
	mov r8, r0
	ldrb r0, [r6, #0x14]
	subs r0, #1
	strb r0, [r6, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08048D9C
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08048DA2
_08048D9C:
	movs r0, #0xeb
	bl m4aSongNumStart
_08048DA2:
	movs r0, #0
	movs r1, #0x1e
	strb r1, [r6, #0x16]
	strb r0, [r6, #0x15]
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _08048E20
	ldr r0, _08048E08 @ =0x000002B6
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08048E0C @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08048E10 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08048E2C
	ldr r0, _08048E14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08048E2C
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08048E18 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08048DFE
	movs r0, #0xff
_08048DFE:
	strb r0, [r1]
	ldr r1, _08048E1C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08048E2C
	.align 2, 0
_08048E08: .4byte 0x000002B6
_08048E0C: .4byte gUnknown_03005450
_08048E10: .4byte 0x0000C350
_08048E14: .4byte gGameMode
_08048E18: .4byte gUnknown_03005448
_08048E1C: .4byte gUnknown_030054A8
_08048E20:
	ldr r0, _08048E58 @ =0x000002B6
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_08048E2C:
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08048E5C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08048E4C
	ldrb r0, [r6, #0x14]
	cmp r0, #4
	bne _08048E4C
	ldr r1, _08048E60 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08048E4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048E58: .4byte 0x000002B6
_08048E5C: .4byte gCurrentLevel
_08048E60: .4byte gUnknown_030054A8

	thumb_func_start sub_8048E64
sub_8048E64: @ 0x08048E64
	push {lr}
	adds r3, r0, #0
	movs r1, #0
	ldrb r0, [r3, #0x16]
	cmp r0, #0
	beq _08048E7A
	subs r0, #1
	strb r0, [r3, #0x16]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048E90
_08048E7A:
	ldrb r0, [r3, #0x15]
	cmp r0, #0
	beq _08048E8C
	subs r0, #1
	strb r0, [r3, #0x15]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08048E8C
	movs r1, #1
_08048E8C:
	cmp r1, #0
	beq _08048EAC
_08048E90:
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	beq _08048EAC
	adds r1, r3, #0
	adds r1, #0x68
	movs r2, #0
	ldr r0, _08048EB0 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r3, #0
	adds r0, #0x88
	strb r2, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08048EAC:
	pop {r0}
	bx r0
	.align 2, 0
_08048EB0: .4byte 0x000002B6

	thumb_func_start sub_8048EB4
sub_8048EB4: @ 0x08048EB4
	ldr r2, _08048ED4 @ =gUnknown_03005B4C
	ldr r2, [r2]
	ldrh r3, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r3, r3, r2
	ldr r2, [r3, #4]
	adds r2, r2, r0
	str r2, [r3, #4]
	ldr r2, [r3, #8]
	adds r2, r2, r1
	str r2, [r3, #8]
	ldr r1, [r3, #0x10]
	adds r1, r1, r0
	str r1, [r3, #0x10]
	bx lr
	.align 2, 0
_08048ED4: .4byte gUnknown_03005B4C

	thumb_func_start sub_8048ED8
sub_8048ED8: @ 0x08048ED8
	push {r4, r5, lr}
	ldr r5, _08048F34 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r1, _08048F38 @ =gUnknown_080D874C
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_80492B8
	adds r0, r4, #0
	bl sub_804920C
	adds r0, r4, #0
	bl sub_8048E64
	adds r0, r4, #0
	bl sub_80480E8
	movs r0, #1
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_804931C
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	ldr r1, _08048F3C @ =0x0000012B
	cmp r0, r1
	bls _08048F2E
	movs r0, #0
	str r0, [r4]
	ldr r1, [r5]
	ldr r0, _08048F40 @ =sub_8047E28
	str r0, [r1, #8]
_08048F2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048F34: .4byte gCurTask
_08048F38: .4byte gUnknown_080D874C
_08048F3C: .4byte 0x0000012B
_08048F40: .4byte sub_8047E28

	thumb_func_start sub_8048F44
sub_8048F44: @ 0x08048F44
	push {lr}
	ldr r0, _08048F68 @ =gCurTask
	ldr r0, [r0]
	ldr r3, _08048F6C @ =gDispCnt
	ldrh r2, [r3]
	ldr r1, _08048F70 @ =0x0000FEFF
	ands r1, r2
	strh r1, [r3]
	ldr r3, _08048F74 @ =gUnknown_03005424
	ldrh r2, [r3]
	ldr r1, _08048F78 @ =0x0000FF7F
	ands r1, r2
	strh r1, [r3]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08048F68: .4byte gCurTask
_08048F6C: .4byte gDispCnt
_08048F70: .4byte 0x0000FEFF
_08048F74: .4byte gUnknown_03005424
_08048F78: .4byte 0x0000FF7F

	thumb_func_start sub_8048F7C
sub_8048F7C: @ 0x08048F7C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048FA0 @ =0x00001FFF
	cmp r1, r0
	bls _08048F98
	adds r0, r4, #0
	bl sub_80484C8
_08048F98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048FA0: .4byte 0x00001FFF

	thumb_func_start sub_8048FA4
sub_8048FA4: @ 0x08048FA4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _08048FE4 @ =0x000043FF
	cmp r1, r0
	bls _08048FDE
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x77
	strh r0, [r1]
	adds r0, #0x89
	bl m4aSongNumStart
	movs r0, #2
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08048FE8 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08048FEC @ =gUnknown_080D86D4
	ldr r0, [r0, #8]
	str r0, [r4, #0x60]
	ldr r1, _08048FF0 @ =gUnknown_080D8710
	ldrb r0, [r1, #0xa]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0xb]
	strb r0, [r4, #0x19]
_08048FDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048FE4: .4byte 0x000043FF
_08048FE8: .4byte 0x00000FFF
_08048FEC: .4byte gUnknown_080D86D4
_08048FF0: .4byte gUnknown_080D8710

	thumb_func_start sub_8048FF4
sub_8048FF4: @ 0x08048FF4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804900A
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ble _08049040
_0804900A:
	movs r0, #7
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049034 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049038 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x1c]
	str r0, [r4, #0x60]
	ldr r1, _0804903C @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1e]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1f]
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	str r0, [r4, #4]
	b _08049046
	.align 2, 0
_08049034: .4byte 0x00000FFF
_08049038: .4byte gUnknown_080D86D4
_0804903C: .4byte gUnknown_080D8710
_08049040:
	ldrh r0, [r4, #0xc]
	adds r0, #0xf
	strh r0, [r4, #0xc]
_08049046:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_804904C
sub_804904C: @ 0x0804904C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _0804908C @ =0x000023FF
	cmp r1, r0
	bls _08049084
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #1
	bl sub_80493F8
	movs r0, #0
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049090 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049094 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08049098 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	strb r0, [r4, #0x19]
_08049084:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804908C: .4byte 0x000023FF
_08049090: .4byte 0x00000FFF
_08049094: .4byte gUnknown_080D86D4
_08049098: .4byte gUnknown_080D8710

	thumb_func_start sub_804909C
sub_804909C: @ 0x0804909C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _080490C0 @ =0x00001FFF
	cmp r1, r0
	bls _080490B8
	adds r0, r4, #0
	bl sub_80484C8
_080490B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080490C0: .4byte 0x00001FFF

	thumb_func_start sub_80490C4
sub_80490C4: @ 0x080490C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _0804910C @ =0x000043FF
	cmp r1, r0
	bls _08049104
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x77
	strh r0, [r1]
	adds r0, #0x89
	bl m4aSongNumStart
	movs r0, #9
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049110 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049114 @ =gUnknown_080D86D4
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x60]
	ldr r0, _08049118 @ =gUnknown_080D8710
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r1, [r1]
	strb r1, [r4, #0x18]
	adds r0, #0x27
	ldrb r0, [r0]
	strb r0, [r4, #0x19]
_08049104:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804910C: .4byte 0x000043FF
_08049110: .4byte 0x00000FFF
_08049114: .4byte gUnknown_080D86D4
_08049118: .4byte gUnknown_080D8710

	thumb_func_start sub_804911C
sub_804911C: @ 0x0804911C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049132
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ble _08049168
_08049132:
	movs r0, #0
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _0804915C @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049160 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08049164 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	strb r0, [r4, #0x19]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	str r0, [r4, #4]
	b _0804916E
	.align 2, 0
_0804915C: .4byte 0x00000FFF
_08049160: .4byte gUnknown_080D86D4
_08049164: .4byte gUnknown_080D8710
_08049168:
	ldrh r0, [r4, #0xc]
	adds r0, #0xf
	strh r0, [r4, #0xc]
_0804916E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8049174
sub_8049174: @ 0x08049174
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8048C7C
	ldr r1, [r4, #0x5c]
	ldr r0, _080491B4 @ =0x000023FF
	cmp r1, r0
	bls _080491AC
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	movs r3, #0
	bl sub_80493F8
	movs r0, #7
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _080491B8 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _080491BC @ =gUnknown_080D86D4
	ldr r0, [r0, #0x1c]
	str r0, [r4, #0x60]
	ldr r1, _080491C0 @ =gUnknown_080D8710
	ldrb r0, [r1, #0x1e]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x1f]
	strb r0, [r4, #0x19]
_080491AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080491B4: .4byte 0x000023FF
_080491B8: .4byte 0x00000FFF
_080491BC: .4byte gUnknown_080D86D4
_080491C0: .4byte gUnknown_080D8710

	thumb_func_start sub_80491C4
sub_80491C4: @ 0x080491C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_8048C7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080491FA
	movs r0, #0
	strb r0, [r4, #0x1b]
	ldr r0, [r4, #0x5c]
	ldr r1, _08049200 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x5c]
	ldr r0, _08049204 @ =gUnknown_080D86D4
	ldr r0, [r0]
	str r0, [r4, #0x60]
	ldr r1, _08049208 @ =gUnknown_080D8710
	ldrb r0, [r1, #2]
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #3]
	strb r0, [r4, #0x19]
_080491FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049200: .4byte 0x00000FFF
_08049204: .4byte gUnknown_080D86D4
_08049208: .4byte gUnknown_080D8710

	thumb_func_start sub_804920C
sub_804920C: @ 0x0804920C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #4]
	asrs r1, r1, #8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r2, _08049280 @ =gUnknown_080D8148
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r0, r2
	ldr r4, _08049284 @ =gSineTable
	ldrh r2, [r5, #0x22]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r6, #0
	ldrsh r3, [r2, r6]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	subs r2, r2, r3
	asrs r2, r2, #0xe
	adds r0, r0, r2
	ldrh r2, [r5, #0x24]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	asrs r2, r2, #9
	adds r0, r0, r2
	ldrh r2, [r5, #0x26]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r2, #0x32
	muls r2, r3, r2
	asrs r2, r2, #0xe
	adds r0, r0, r2
	movs r2, #0
	str r2, [sp]
	ldr r2, _08049288 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08049278
	lsls r1, r0, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
_08049278:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049280: .4byte gUnknown_080D8148
_08049284: .4byte gSineTable
_08049288: .4byte sub_801EE64

	thumb_func_start sub_804928C
sub_804928C: @ 0x0804928C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x68
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _080492AE
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _080492B4 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_080492AE:
	pop {r0}
	bx r0
	.align 2, 0
_080492B4: .4byte 0x000002B6

	thumb_func_start sub_80492B8
sub_80492B8: @ 0x080492B8
	push {lr}
	adds r2, r0, #0
	ldr r1, _080492E4 @ =gUnknown_080D814A
	ldrb r0, [r2, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r2, #0xe]
	adds r1, r0, r3
	strh r1, [r2, #0xe]
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _080492E8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb0
	lsls r1, r1, #2
	cmp r0, r1
	ble _080492F4
	b _080492F2
	.align 2, 0
_080492E4: .4byte gUnknown_080D814A
_080492E8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08049318 @ =0xFFFFFD40
	cmp r0, r1
	bge _080492F4
_080492F2:
	strh r1, [r2, #0xe]
_080492F4:
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #0x10]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08049318: .4byte 0xFFFFFD40

	thumb_func_start sub_804931C
sub_804931C: @ 0x0804931C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrb r0, [r5, #0x16]
	ldr r6, _08049374 @ =gFlags
	cmp r0, #0
	beq _08049360
	movs r4, #0
	ldr r0, _08049378 @ =gBgPalette
	mov r8, r0
	ldr r7, _0804937C @ =gUnknown_080D8796
	movs r0, #2
	mov ip, r0
_08049338:
	adds r3, r4, #0
	adds r3, #0xb0
	lsls r3, r3, #1
	add r3, r8
	lsls r1, r4, #1
	ldrb r2, [r5, #0x16]
	mov r0, ip
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08049338
_08049360:
	ldr r0, [r6]
	movs r1, #1
	orrs r0, r1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049374: .4byte gFlags
_08049378: .4byte gBgPalette
_0804937C: .4byte gUnknown_080D8796

	thumb_func_start sub_8049380
sub_8049380: @ 0x08049380
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _080493D8 @ =IWRAM_START + 0x1E8
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493DC @ =IWRAM_START + 0x9C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493E0 @ =IWRAM_START + 0xCC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493E4 @ =IWRAM_START + 0xFC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493E8 @ =IWRAM_START + 0x12C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080493EC @ =IWRAM_START + 0x15C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _080493F0 @ =IWRAM_START + 0x18C
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _080493F4 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080493D8: .4byte IWRAM_START + 0x1E8
_080493DC: .4byte IWRAM_START + 0x9C
_080493E0: .4byte IWRAM_START + 0xCC
_080493E4: .4byte IWRAM_START + 0xFC
_080493E8: .4byte IWRAM_START + 0x12C
_080493EC: .4byte IWRAM_START + 0x15C
_080493F0: .4byte IWRAM_START + 0x18C
_080493F4: .4byte gUnknown_03005B4C

	thumb_func_start sub_80493F8
sub_80493F8: @ 0x080493F8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sl, r0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080494CC @ =sub_80494EC
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	ldr r1, _080494D0 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r0, r5, r0
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [r2]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, r8
	subs r0, r1, r0
	str r0, [r2, #4]
	movs r0, #0
	mov ip, r0
	strh r4, [r2, #8]
	strh r6, [r2, #0xa]
	mov r1, sb
	strb r1, [r2, #0xc]
	mov r0, sl
	str r0, [r2, #0x10]
	ldr r1, _080494D4 @ =IWRAM_START + 0x14
	adds r4, r3, r1
	asrs r5, r5, #8
	strh r5, [r4, #0x16]
	mov r0, r8
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #0xf4
	lsls r1, r1, #1
	add sl, r1
	mov r1, sl
	ldr r0, [r1]
	str r0, [r4, #4]
	ldr r0, _080494D8 @ =0x000002BA
	strh r0, [r4, #0xa]
	ldr r1, _080494DC @ =IWRAM_START + 0x34
	adds r0, r3, r1
	mov r1, ip
	strb r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _080494E0 @ =IWRAM_START + 0x35
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080494E4 @ =IWRAM_START + 0x36
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080494E8 @ =IWRAM_START + 0x39
	adds r3, r3, r1
	mov r0, ip
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r1, #0xc0
	lsls r1, r1, #6
	str r1, [r4, #0x10]
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _080494BC
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r1
	str r0, [r4, #0x10]
_080494BC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080494CC: .4byte sub_80494EC
_080494D0: .4byte gCamera
_080494D4: .4byte IWRAM_START + 0x14
_080494D8: .4byte 0x000002BA
_080494DC: .4byte IWRAM_START + 0x34
_080494E0: .4byte IWRAM_START + 0x35
_080494E4: .4byte IWRAM_START + 0x36
_080494E8: .4byte IWRAM_START + 0x39

	thumb_func_start sub_80494EC
sub_80494EC: @ 0x080494EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08049510 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r6, r1, r0
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	bne _08049514
	ldrh r0, [r4, #0xa]
	adds r0, #0x20
	b _08049518
	.align 2, 0
_08049510: .4byte gCurTask
_08049514:
	ldrh r0, [r4, #0xa]
	subs r0, #0x20
_08049518:
	strh r0, [r4, #0xa]
	ldr r0, _08049540 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08049548
	movs r2, #8
	ldrsh r1, [r4, r2]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, _08049544 @ =gCamera
	mov r8, r0
	b _0804956C
	.align 2, 0
_08049540: .4byte gPlayer
_08049544: .4byte gCamera
_08049548:
	movs r2, #8
	ldrsh r1, [r4, r2]
	ldr r2, _080495B8 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	mov r8, r2
_0804956C:
	movs r3, #8
	rsbs r3, r3, #0
	cmp r5, #0
	bne _08049576
	movs r3, #8
_08049576:
	ldr r1, [r4]
	asrs r1, r1, #8
	mov r2, r8
	ldr r0, [r2]
	adds r1, r1, r0
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	adds r0, r0, r2
	movs r7, #0
	str r7, [sp]
	ldr r2, _080495BC @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bge _080495DC
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	strh r7, [r4, #0xa]
	ldr r1, [r4, #4]
	cmp r5, #0
	bne _080495C0
	lsls r0, r2, #8
	adds r0, r1, r0
	b _080495C4
	.align 2, 0
_080495B8: .4byte gCamera
_080495BC: .4byte sub_801EE64
_080495C0:
	lsls r0, r2, #8
	subs r0, r1, r0
_080495C4:
	str r0, [r4, #4]
	movs r0, #0x3d
	strb r0, [r4, #0xd]
	ldr r0, _080495D4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080495D8 @ =sub_8049658
	str r0, [r1, #8]
	b _08049642
	.align 2, 0
_080495D4: .4byte gCurTask
_080495D8: .4byte sub_8049658
_080495DC:
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _08049636
	ldr r1, [r4]
	asrs r1, r1, #8
	mov r2, r8
	ldr r0, [r2]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	mov r3, r8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	ldr r0, _08049650 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _08049636
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _08049636
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _08049654 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0x88
	strb r3, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08049636:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08049642:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049650: .4byte gPlayer
_08049654: .4byte 0x000002B6

	thumb_func_start sub_8049658
sub_8049658: @ 0x08049658
	push {r4, lr}
	ldr r2, _08049684 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08049688 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _0804968C
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _080496A8
	.align 2, 0
_08049684: .4byte gCurTask
_08049688: .4byte gPlayer
_0804968C:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, _080496C4 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_080496A8:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrb r0, [r4, #0xd]
	subs r1, r0, #1
	strb r1, [r4, #0xd]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _080496C8
	ldr r0, [r3]
	bl TaskDestroy
	b _080496F0
	.align 2, 0
_080496C4: .4byte gCamera
_080496C8:
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _080496F0
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r2, _080496F8 @ =gCamera
	ldr r0, [r2]
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, [r2, #4]
	lsls r0, r0, #8
	ldr r2, [r4, #4]
	adds r2, r2, r0
	ldr r0, [r4, #0x10]
	ldrb r3, [r4, #0xc]
	bl sub_80496FC
_080496F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080496F8: .4byte gCamera

	thumb_func_start sub_80496FC
sub_80496FC: @ 0x080496FC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080497C0 @ =sub_80497E0
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r3, _080497C4 @ =gCamera
	ldr r0, [r3]
	lsls r0, r0, #8
	subs r4, r4, r0
	str r4, [r1]
	ldr r0, [r3, #4]
	lsls r0, r0, #8
	subs r5, r5, r0
	str r5, [r1, #4]
	movs r3, #0
	strh r6, [r1, #8]
	strh r6, [r1, #0xa]
	movs r0, #0x2e
	strb r0, [r1, #0xd]
	mov r0, r8
	str r0, [r1, #0x10]
	ldr r0, _080497C8 @ =IWRAM_START + 0x14
	adds r5, r2, r0
	asrs r4, r4, #8
	strh r4, [r5, #0x16]
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	movs r1, #0xf4
	lsls r1, r1, #1
	add r8, r1
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xc0
	str r0, [r5, #4]
	ldr r0, _080497CC @ =0x000002BB
	strh r0, [r5, #0xa]
	ldr r1, _080497D0 @ =IWRAM_START + 0x34
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _080497D4 @ =IWRAM_START + 0x35
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080497D8 @ =IWRAM_START + 0x36
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080497DC @ =IWRAM_START + 0x39
	adds r2, r2, r1
	strb r3, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r5, #0x10]
	mov r0, sb
	cmp r0, #0
	beq _080497B0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r1
	str r0, [r5, #0x10]
_080497B0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080497C0: .4byte sub_80497E0
_080497C4: .4byte gCamera
_080497C8: .4byte IWRAM_START + 0x14
_080497CC: .4byte 0x000002BB
_080497D0: .4byte IWRAM_START + 0x34
_080497D4: .4byte IWRAM_START + 0x35
_080497D8: .4byte IWRAM_START + 0x36
_080497DC: .4byte IWRAM_START + 0x39

	thumb_func_start sub_80497E0
sub_80497E0: @ 0x080497E0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08049814 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r2, _08049818 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	adds r7, r2, #0
	cmp r1, #0
	beq _0804981C
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08049838
	.align 2, 0
_08049814: .4byte gCurTask
_08049818: .4byte gPlayer
_0804981C:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, _08049854 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08049838:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r6, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049858
	ldr r0, [r3]
	bl TaskDestroy
	b _080498BC
	.align 2, 0
_08049854: .4byte gCamera
_08049858:
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _080498B0
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _080498C4 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r7, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _080498B0
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _080498B0
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _080498C8 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0x88
	strb r3, [r0]
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
_080498B0:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_080498BC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080498C4: .4byte gCamera
_080498C8: .4byte 0x000002B6

	thumb_func_start sub_80498CC
sub_80498CC: @ 0x080498CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080499B4 @ =sub_80499D8
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _080499B8 @ =sub_8049D1C
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r0, #0
	strb r4, [r6, #4]
	strb r0, [r6, #5]
	strb r0, [r6, #6]
	ldr r1, _080499BC @ =gUnknown_080D5964
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6]
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r3, r1, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6, #2]
	ldr r2, _080499C0 @ =gUnknown_03005440
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, _080499C4 @ =gUnknown_030054BC
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r4, #0
	beq _080499AC
	bl sub_802A018
	ldr r3, _080499C8 @ =gPlayer
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	ldr r1, _080499CC @ =gUnknown_080D87E6
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r2, [r3, #8]
	asrs r0, r2, #8
	subs r5, r5, r0
	lsls r0, r4, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r3, #0xc]
	asrs r0, r1, #8
	subs r4, r4, r0
	lsls r7, r5, #8
	adds r2, r2, r7
	str r2, [r3, #8]
	lsls r2, r4, #8
	adds r1, r1, r2
	str r1, [r3, #0xc]
	ldr r1, _080499D0 @ =gCamera
	ldr r0, [r1]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #0x14]
	ldr r0, _080499D4 @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _080499A6
	ldr r0, [r1]
	adds r0, r0, r7
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
_080499A6:
	ldrb r0, [r6, #4]
	subs r0, #1
	strb r0, [r6, #4]
_080499AC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080499B4: .4byte sub_80499D8
_080499B8: .4byte sub_8049D1C
_080499BC: .4byte gUnknown_080D5964
_080499C0: .4byte gUnknown_03005440
_080499C4: .4byte gUnknown_030054BC
_080499C8: .4byte gPlayer
_080499CC: .4byte gUnknown_080D87E6
_080499D0: .4byte gCamera
_080499D4: .4byte gUnknown_030056A4

	thumb_func_start sub_80499D8
sub_80499D8: @ 0x080499D8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08049A64 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldrb r0, [r7, #4]
	cmp r0, #6
	bls _080499EE
	b _08049C4C
_080499EE:
	cmp r0, #6
	beq _080499F4
	b _08049BAC
_080499F4:
	ldr r1, _08049A68 @ =gUnknown_03005440
	ldr r2, _08049A6C @ =gUnknown_080D5964
	ldrh r0, [r2, #0x1c]
	strh r0, [r1]
	ldr r1, _08049A70 @ =gUnknown_030054BC
	ldrh r0, [r2, #0x1e]
	strh r0, [r1]
	ldr r1, _08049A74 @ =gPlayer
	ldr r2, [r1, #8]
	ldr r0, _08049A78 @ =0x00A7CFFF
	adds r3, r1, #0
	cmp r2, r0
	bgt _08049A96
	ldr r0, _08049A7C @ =gUnknown_080D8808
	ldr r0, [r0, #0x30]
	adds r0, #0x1e
	lsls r0, r0, #8
	cmp r2, r0
	ble _08049A96
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r3, #0x20]
	movs r2, #0
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x5e
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #0x38
	strb r2, [r0]
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	subs r0, #0x78
	ldr r1, _08049A80 @ =gCamera
	ldr r2, [r1]
	cmp r0, r2
	bne _08049A4C
	b _08049C4C
_08049A4C:
	cmp r0, r2
	ble _08049A84
	ldr r0, [r1, #0x20]
	adds r0, #1
	str r0, [r1, #0x20]
	adds r0, r2, #1
	str r0, [r1]
	ldr r0, [r1, #0x10]
	adds r0, #1
	str r0, [r1, #0x10]
	b _08049C4C
	.align 2, 0
_08049A64: .4byte gCurTask
_08049A68: .4byte gUnknown_03005440
_08049A6C: .4byte gUnknown_080D5964
_08049A70: .4byte gUnknown_030054BC
_08049A74: .4byte gPlayer
_08049A78: .4byte 0x00A7CFFF
_08049A7C: .4byte gUnknown_080D8808
_08049A80: .4byte gCamera
_08049A84:
	ldr r0, [r1, #0x20]
	subs r0, #1
	str r0, [r1, #0x20]
	subs r0, r2, #1
	str r0, [r1]
	ldr r0, [r1, #0x10]
	subs r0, #1
	str r0, [r1, #0x10]
	b _08049C4C
_08049A96:
	ldr r1, [r3, #8]
	ldr r0, _08049ADC @ =0x00A6CBFF
	cmp r1, r0
	bgt _08049AF4
	ldr r0, _08049AE0 @ =gUnknown_080D8808
	ldr r0, [r0, #0x30]
	adds r0, #0x14
	lsls r0, r0, #8
	cmp r1, r0
	ble _08049AF4
	ldr r0, _08049AE4 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _08049AB4
	b _08049C4C
_08049AB4:
	ldr r4, _08049AE8 @ =gUnknown_03005424
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049AC4
	b _08049C4C
_08049AC4:
	ldr r0, _08049AEC @ =gUnknown_03005490
	ldr r0, [r0]
	str r0, [r3, #0x78]
	movs r0, #7
	bl sub_8039EA4
	ldrh r1, [r4]
	ldr r0, _08049AF0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r4]
	b _08049C4C
	.align 2, 0
_08049ADC: .4byte 0x00A6CBFF
_08049AE0: .4byte gUnknown_080D8808
_08049AE4: .4byte gUnknown_03005B4C
_08049AE8: .4byte gUnknown_03005424
_08049AEC: .4byte gUnknown_03005490
_08049AF0: .4byte 0x0000FFFD
_08049AF4:
	adds r2, r3, #0
	ldr r5, [r2, #8]
	ldr r0, _08049B1C @ =0x00A7D000
	cmp r5, r0
	ble _08049B24
	ldr r0, [r2, #0x20]
	ldr r1, _08049B20 @ =0xF7FFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x6d
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r7, #4]
	adds r0, #1
	strb r0, [r7, #4]
	strb r1, [r7, #6]
	b _08049C4C
	.align 2, 0
_08049B1C: .4byte 0x00A7D000
_08049B20: .4byte 0xF7FFFFFF
_08049B24:
	ldr r0, _08049B90 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	bne _08049B2E
	b _08049C4C
_08049B2E:
	ldr r0, _08049B94 @ =0x00A53BFF
	cmp r5, r0
	ble _08049B36
	b _08049C4C
_08049B36:
	ldr r4, _08049B98 @ =gUnknown_080D8808
	ldrb r0, [r7, #4]
	lsls r2, r0, #3
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	bge _08049B46
	b _08049C4C
_08049B46:
	lsls r0, r1, #8
	cmp r5, r0
	bge _08049B4E
	b _08049C4C
_08049B4E:
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r4, [r0]
	lsls r6, r4, #8
	adds r0, r5, r6
	str r0, [r3, #8]
	ldr r0, _08049B9C @ =gUnknown_030054FC
	str r6, [r0]
	ldrb r1, [r7, #4]
	adds r0, r6, #0
	bl sub_8039F50
	ldr r1, _08049BA0 @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08049BA4 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r4
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r4
	str r0, [r1, #0x10]
	ldr r0, _08049BA8 @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _08049C4C
	ldr r0, [r1]
	adds r0, r0, r6
	b _08049C4A
	.align 2, 0
_08049B90: .4byte gUnknown_03005B4C
_08049B94: .4byte 0x00A53BFF
_08049B98: .4byte gUnknown_080D8808
_08049B9C: .4byte gUnknown_030054FC
_08049BA0: .4byte gUnknown_03005430
_08049BA4: .4byte gCamera
_08049BA8: .4byte gUnknown_030056A4
_08049BAC:
	cmp r0, #5
	bhi _08049C4C
	ldr r6, _08049C84 @ =gCamera
	ldr r0, _08049C88 @ =gUnknown_080D87D8
	ldrb r1, [r7, #4]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x10]
	ldrh r1, [r1]
	cmp r0, r1
	ble _08049BEE
	ldr r1, _08049C8C @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08049C90 @ =gUnknown_0300542C
	movs r0, #0xa
	strb r0, [r1]
	ldr r1, _08049C94 @ =gPlayer
	ldr r0, _08049C98 @ =gUnknown_03005490
	ldr r0, [r0]
	str r0, [r1, #0x78]
	ldrb r0, [r7, #4]
	adds r0, #1
	strb r0, [r7, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_8039EA4
	ldr r2, _08049C9C @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08049CA0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
_08049BEE:
	ldr r4, _08049CA4 @ =gUnknown_080D8808
	ldrb r0, [r7, #4]
	lsls r2, r0, #3
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	blt _08049C4C
	ldr r0, _08049CA8 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _08049C4C
	ldr r3, _08049C94 @ =gPlayer
	lsls r0, r1, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	blt _08049C4C
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r4, [r0]
	lsls r5, r4, #8
	adds r0, r1, r5
	str r0, [r3, #8]
	ldr r0, _08049CAC @ =gUnknown_030054FC
	str r5, [r0]
	ldrb r1, [r7, #4]
	adds r0, r5, #0
	bl sub_8039F50
	ldr r1, _08049C8C @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	ldr r0, [r6, #0x20]
	adds r0, r0, r4
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x10]
	adds r0, r0, r4
	str r0, [r6, #0x10]
	ldr r0, _08049CB0 @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _08049C4C
	ldr r0, [r1]
	adds r0, r0, r5
_08049C4A:
	str r0, [r1]
_08049C4C:
	ldrb r0, [r7, #5]
	cmp r0, #6
	bhi _08049CC0
	ldr r3, _08049C84 @ =gCamera
	ldr r1, _08049C88 @ =gUnknown_080D87D8
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08049CB4 @ =0xFFFFFDA8
	adds r0, r0, r1
	ldr r1, [r3, #0x10]
	cmp r1, r0
	ble _08049CC0
	cmp r2, #6
	bne _08049CBC
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _08049C7C
	movs r0, #1
	str r0, [r3, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #3
	str r0, [r3, #8]
_08049C7C:
	ldr r1, _08049CB8 @ =gUnknown_030054B0
	movs r0, #1
	strb r0, [r1]
	b _08049CC0
	.align 2, 0
_08049C84: .4byte gCamera
_08049C88: .4byte gUnknown_080D87D8
_08049C8C: .4byte gUnknown_03005430
_08049C90: .4byte gUnknown_0300542C
_08049C94: .4byte gPlayer
_08049C98: .4byte gUnknown_03005490
_08049C9C: .4byte gUnknown_03005424
_08049CA0: .4byte 0x0000FFFD
_08049CA4: .4byte gUnknown_080D8808
_08049CA8: .4byte gUnknown_03005B4C
_08049CAC: .4byte gUnknown_030054FC
_08049CB0: .4byte gUnknown_030056A4
_08049CB4: .4byte 0xFFFFFDA8
_08049CB8: .4byte gUnknown_030054B0
_08049CBC:
	adds r0, r2, #1
	strb r0, [r7, #5]
_08049CC0:
	ldr r0, _08049CDC @ =gUnknown_080D5964
	ldrb r2, [r7, #5]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrh r3, [r7]
	adds r5, r3, #0
	ldrh r4, [r1]
	adds r6, r0, #0
	cmp r5, r4
	beq _08049CE4
	cmp r5, r4
	bhs _08049CE0
	adds r0, r3, #1
	b _08049CE2
	.align 2, 0
_08049CDC: .4byte gUnknown_080D5964
_08049CE0:
	subs r0, r3, #1
_08049CE2:
	strh r0, [r7]
_08049CE4:
	lsls r1, r2, #2
	adds r0, r6, #2
	adds r1, r1, r0
	ldrh r2, [r7, #2]
	adds r3, r2, #0
	ldrh r0, [r1]
	cmp r3, r0
	beq _08049D00
	cmp r3, r0
	bhs _08049CFC
	adds r0, r2, #1
	b _08049CFE
_08049CFC:
	subs r0, r2, #1
_08049CFE:
	strh r0, [r7, #2]
_08049D00:
	ldr r1, _08049D14 @ =gUnknown_03005440
	ldrh r0, [r7]
	strh r0, [r1]
	ldr r1, _08049D18 @ =gUnknown_030054BC
	ldrh r0, [r7, #2]
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049D14: .4byte gUnknown_03005440
_08049D18: .4byte gUnknown_030054BC

	thumb_func_start sub_8049D1C
sub_8049D1C: @ 0x08049D1C
	bx lr
	.align 2, 0

	thumb_func_start sub_8049D20
sub_8049D20: @ 0x08049D20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08049E74 @ =sub_8049E90
	movs r1, #0xb2
	lsls r1, r1, #1
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r3, _08049E78 @ =sub_804A6B4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r2, _08049E7C @ =IWRAM_START + 0x15D
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _08049E80 @ =IWRAM_START + 0x120
	adds r1, r0, r3
	str r4, [r1]
	adds r3, #0x40
	adds r1, r0, r3
	str r5, [r1]
	subs r3, #2
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _08049E84 @ =IWRAM_START + 0x15F
	adds r0, r0, r1
	strb r2, [r0]
	movs r0, #0x2f
	bl VramMalloc
	str r0, [sp, #4]
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r5, #0
	ldr r3, _08049E88 @ =gUnknown_080D8840
	mov sb, r3
	movs r0, #4
	add r0, sb
	mov sl, r0
	movs r6, #0
_08049D8A:
	lsls r2, r5, #3
	movs r3, #0x92
	lsls r3, r3, #1
	adds r1, r7, r3
	adds r1, r1, r2
	mov r3, sb
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r7, r0
	adds r1, r1, r2
	mov r3, sl
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r2
	str r6, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r2
	str r6, [r0]
	lsls r3, r5, #1
	movs r0, #0xaa
	lsls r0, r0, #1
	adds r2, r7, r0
	adds r2, r2, r3
	adds r0, r5, #2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r2]
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r5
	strb r6, [r0]
	movs r4, #0
	adds r2, r5, #1
	mov r8, r2
	adds r3, r3, r5
	lsls r3, r3, #5
	adds r5, r7, r3
_08049DF2:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r2, r5, r0
	movs r0, #0x50
	strh r0, [r2, #0x16]
	strh r0, [r2, #0x18]
	lsls r0, r4, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _08049E8C @ =gUnknown_080D8864
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r6, [r2, #8]
	strh r6, [r2, #0x14]
	strh r6, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08049DF2
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08049D8A
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049E74: .4byte sub_8049E90
_08049E78: .4byte sub_804A6B4
_08049E7C: .4byte IWRAM_START + 0x15D
_08049E80: .4byte IWRAM_START + 0x120
_08049E84: .4byte IWRAM_START + 0x15F
_08049E88: .4byte gUnknown_080D8840
_08049E8C: .4byte gUnknown_080D8864

	thumb_func_start sub_8049E90
sub_8049E90: @ 0x08049E90
	push {r4, r5, r6, lr}
	ldr r0, _08049EB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _08049EB4 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	bne _08049EB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08049F08
	.align 2, 0
_08049EB0: .4byte gCurTask
_08049EB4: .4byte gUnknown_03005B4C
_08049EB8:
	movs r4, #0
	ldr r6, _08049F10 @ =gUnknown_080D8874
_08049EBC:
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08049EBC
	ldr r1, _08049F14 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	cmp r0, #0x84
	bgt _08049EEE
	adds r0, r1, #0
	bl sub_800CBA4
_08049EEE:
	ldr r2, _08049F18 @ =0x0000015F
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08049F08
	adds r2, #1
	adds r0, r5, r2
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08049F08
	movs r0, #1
	strb r0, [r1]
_08049F08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049F10: .4byte gUnknown_080D8874
_08049F14: .4byte gPlayer
_08049F18: .4byte 0x0000015F

	thumb_func_start sub_8049F1C
sub_8049F1C: @ 0x08049F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r0, r8
	lsls r0, r0, #1
	str r0, [sp]
	add r0, r8
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov sl, r0
	mov r1, r8
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	mov sb, r0
	ldr r6, _0804A060 @ =0x0000015F
	add r6, ip
	ldrb r0, [r6]
	cmp r0, #0
	bne _08049F62
	str r0, [r2]
_08049F62:
	ldr r2, [r2]
	add sb, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r4, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r5, r0, #8
	ldr r1, _0804A064 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r6]
	cmp r0, #0
	bne _08049FD6
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r6, r0, r1
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08049FD6
	ldr r3, _0804A068 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r6]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_08049FD6:
	ldr r0, _0804A06C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0804A008
	ldr r0, [r6, #0x3c]
	cmp r0, r7
	bne _0804A008
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	add r0, sb
	str r0, [r6, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A008
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
_0804A008:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A036
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A036
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
_0804A036:
	adds r0, r7, #0
	bl sub_80051E8
	ldrh r0, [r7, #0x16]
	mov r1, sl
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, sl
	bl sub_80051E8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A060: .4byte 0x0000015F
_0804A064: .4byte gCamera
_0804A068: .4byte gUnknown_080D8858
_0804A06C: .4byte gPlayer

	thumb_func_start sub_804A070
sub_804A070: @ 0x0804A070
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #5
	adds r6, r5, r0
	movs r0, #0x30
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _0804A1A8 @ =0x0000015F
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A0A8
	lsls r0, r7, #3
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	adds r1, r1, r0
	ldr r0, _0804A1AC @ =0xFFFFF800
	str r0, [r1]
_0804A0A8:
	lsls r2, r7, #3
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov ip, r1
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov sl, r0
	mov r0, ip
	ldr r0, [r0]
	mov sb, r0
	mov r1, sl
	ldr r0, [r1]
	add r0, sb
	asrs r0, r0, #8
	mov ip, r0
	mov r3, ip
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov sb, r1
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov r2, sb
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r2, r1, #8
	adds r4, r2, #0
	ldr r1, _0804A1B0 @ =gCamera
	ldr r0, [r1]
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	subs r0, r4, r0
	strh r0, [r6, #0x18]
	ldr r4, _0804A1B4 @ =gPlayer
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0804A136
	str r4, [sp]
	str r1, [sp, #4]
	adds r0, r6, #0
	mov r1, ip
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	beq _0804A136
	ldr r0, [r4, #0xc]
	ldr r1, _0804A1AC @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldr r0, _0804A1B8 @ =0x0000FC80
	strh r0, [r4, #0x12]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r1, #9
	movs r0, #6
	strb r0, [r1]
_0804A136:
	ldr r2, _0804A1A8 @ =0x0000015F
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A17E
	movs r0, #0x84
	lsls r0, r0, #1
	bl m4aSongNumStart
	lsls r1, r7, #1
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A17E
	ldr r3, _0804A1BC @ =gUnknown_080D8858
	movs r0, #0xad
	lsls r0, r0, #1
	adds r2, r5, r0
	adds r2, r2, r7
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A17E:
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r0, [r6, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_80051E8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1A8: .4byte 0x0000015F
_0804A1AC: .4byte 0xFFFFF800
_0804A1B0: .4byte gCamera
_0804A1B4: .4byte gPlayer
_0804A1B8: .4byte 0x0000FC80
_0804A1BC: .4byte gUnknown_080D8858

	thumb_func_start sub_804A1C0
sub_804A1C0: @ 0x0804A1C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #5
	add r0, r8
	mov sb, r0
	adds r0, #0x30
	str r0, [sp, #0x20]
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	str r0, [sp, #0x24]
	ldr r7, _0804A378 @ =0x0000015F
	add r7, r8
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A200
	ldr r0, _0804A37C @ =0xFFFFF800
	str r0, [r2]
_0804A200:
	ldr r2, [r2]
	ldr r1, [sp, #0x24]
	adds r1, r1, r2
	str r1, [sp, #0x24]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, r8
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A380 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r2, #0x18]
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A2EC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x3c
	beq _0804A258
	str r4, [sp, #0x28]
	cmp r0, #0x32
	bne _0804A2B6
_0804A258:
	movs r7, #0
	str r4, [sp, #0x28]
	adds r3, r6, #0
	subs r3, #0x10
	str r3, [sp, #0x2c]
	mov r4, sp
	movs r2, #0
_0804A266:
	lsls r0, r7, #6
	ldr r1, _0804A384 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r0, r0, r5
	subs r0, #0x14
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r4, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	movs r0, #0x30
	strh r0, [r4, #0x1c]
	adds r0, #0xd0
	strh r0, [r4, #0xe]
	adds r0, #0x20
	add r0, r8
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _0804A388 @ =0x000002C3
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	str r2, [sp, #4]
	mov r0, sp
	ldr r1, _0804A38C @ =0x0000015D
	add r1, r8
	str r2, [sp, #0x30]
	bl sub_8039D04
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [sp, #0x30]
	cmp r7, #7
	bls _0804A266
_0804A2B6:
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	ldr r2, [sp, #0x28]
	adds r4, r0, r2
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A2EC
	ldr r3, _0804A390 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, r8
	add r2, sl
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A2EC:
	ldr r0, _0804A394 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A320
	ldr r0, [r4, #0x3c]
	cmp r0, sb
	bne _0804A320
	ldr r0, [r4, #0xc]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A320
	ldr r0, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #8]
_0804A320:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A34E
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A34E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A34E:
	mov r0, sb
	bl sub_80051E8
	mov r2, sb
	ldrh r0, [r2, #0x16]
	ldr r3, [sp, #0x20]
	strh r0, [r3, #0x16]
	ldrh r0, [r2, #0x18]
	adds r0, #0x40
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x20]
	bl sub_80051E8
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A378: .4byte 0x0000015F
_0804A37C: .4byte 0xFFFFF800
_0804A380: .4byte gCamera
_0804A384: .4byte gSineTable
_0804A388: .4byte 0x000002C3
_0804A38C: .4byte 0x0000015D
_0804A390: .4byte gUnknown_080D8858
_0804A394: .4byte gPlayer

	thumb_func_start sub_804A398
sub_804A398: @ 0x0804A398
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	mov sl, r0
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r4, #0x30
	adds r4, r4, r7
	mov r8, r4
	mov r0, sb
	lsls r3, r0, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	str r1, [sp, #0xc]
	rsbs r4, r1, #0
	str r4, [sp]
	ldr r0, _0804A528 @ =0x0000015F
	add r0, ip
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A406
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r4, _0804A52C @ =gSineTable
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #7
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	str r0, [r2]
_0804A406:
	ldr r2, [r2]
	ldr r4, [sp]
	adds r4, r4, r2
	str r4, [sp]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A530 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804A480
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	mov r1, sl
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A480
	ldr r3, _0804A534 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A480:
	ldr r0, _0804A538 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A4B8
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A4B8
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A4B8
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A4B8:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A4E6
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A4E6
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A4E6:
	adds r0, r7, #0
	bl sub_80051E8
	ldrh r0, [r7, #0x16]
	mov r4, r8
	strh r0, [r4, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r4, #0x18]
	mov r0, r8
	bl sub_80051E8
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	strh r0, [r4, #0x18]
	mov r0, r8
	bl sub_80051E8
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	strh r0, [r4, #0x18]
	mov r0, r8
	bl sub_80051E8
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A528: .4byte 0x0000015F
_0804A52C: .4byte gSineTable
_0804A530: .4byte gCamera
_0804A534: .4byte gUnknown_080D8858
_0804A538: .4byte gPlayer

	thumb_func_start sub_804A53C
sub_804A53C: @ 0x0804A53C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	str r0, [sp]
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	mov r1, sb
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	rsbs r0, r1, #0
	mov sl, r0
	ldr r4, _0804A6A4 @ =0x0000015F
	add r4, ip
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A588
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r2]
_0804A588:
	ldr r2, [r2]
	add sl, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A6A8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A5FC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A5FC
	ldr r3, _0804A6AC @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A5FC:
	ldr r0, _0804A6B0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A632
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A632
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	add r0, sl
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A632
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A632:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A660
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A660
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A660:
	adds r0, r7, #0
	bl sub_80051E8
	ldrh r0, [r7, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_80051E8
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_80051E8
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_80051E8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A6A4: .4byte 0x0000015F
_0804A6A8: .4byte gCamera
_0804A6AC: .4byte gUnknown_080D8858
_0804A6B0: .4byte gPlayer

	thumb_func_start sub_804A6B4
sub_804A6B4: @ 0x0804A6B4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_804A6C8
sub_804A6C8: @ 0x0804A6C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	ldr r1, _0804A764 @ =gBgCntRegs
	movs r2, #0
	movs r3, #0
	ldr r0, _0804A768 @ =0x0000D40E
	strh r0, [r1]
	ldr r0, _0804A76C @ =0x00001F01
	strh r0, [r1, #4]
	ldr r0, _0804A770 @ =gBgScrollRegs
	strh r3, [r0]
	strh r3, [r0, #2]
	ldr r0, _0804A774 @ =gUnknown_03004D80
	strb r2, [r0]
	ldr r1, _0804A778 @ =gUnknown_03002280
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x40
	strb r0, [r1, #3]
	ldr r2, _0804A77C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _0804A780 @ =gUnknown_030053B8
	ldr r0, _0804A784 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0804A788 @ =gUnknown_03005AF0
	ldr r0, [r1, #0x1c]
	ldr r3, _0804A78C @ =0xFFFFCFFF
	ands r0, r3
	movs r2, #0x80
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r1, _0804A790 @ =gUnknown_03005AA0
	ldr r0, [r1, #0x1c]
	ands r0, r3
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _0804A794 @ =sub_804CBC8
	movs r1, #0xa4
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0804A798 @ =sub_804CD0C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _0804A79C @ =gUnknown_03005B4C
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0x48
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _0804A7A0 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A7A4
	movs r0, #6
	strb r0, [r7, #8]
	movs r0, #4
	b _0804A7AA
	.align 2, 0
_0804A764: .4byte gBgCntRegs
_0804A768: .4byte 0x0000D40E
_0804A76C: .4byte 0x00001F01
_0804A770: .4byte gBgScrollRegs
_0804A774: .4byte gUnknown_03004D80
_0804A778: .4byte gUnknown_03002280
_0804A77C: .4byte gPlayer
_0804A780: .4byte gUnknown_030053B8
_0804A784: .4byte gUnknown_03005590
_0804A788: .4byte gUnknown_03005AF0
_0804A78C: .4byte 0xFFFFCFFF
_0804A790: .4byte gUnknown_03005AA0
_0804A794: .4byte sub_804CBC8
_0804A798: .4byte sub_804CD0C
_0804A79C: .4byte gUnknown_03005B4C
_0804A7A0: .4byte gUnknown_030054EC
_0804A7A4:
	movs r0, #8
	strb r0, [r7, #8]
	movs r0, #6
_0804A7AA:
	strb r0, [r7, #9]
	strb r0, [r7, #0xa]
	ldr r0, _0804A8B0 @ =0x00A77C00
	str r0, [r7]
	movs r0, #0xb9
	lsls r0, r0, #9
	str r0, [r7, #4]
	movs r1, #0
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r7, #0xe]
	adds r0, #0x98
	strh r0, [r7, #0x10]
	strb r1, [r7, #0xb]
	strb r1, [r7, #0xc]
	movs r0, #0x1e
	str r0, [r7, #0x14]
	movs r0, #0x20
	bl VramMalloc
	str r0, [r7, #0x44]
	adds r1, r7, #0
	bl sub_8049D20
	movs r4, #0
	adds r1, r7, #0
	adds r1, #0x28
	str r1, [sp, #0x24]
	adds r2, r7, #0
	adds r2, #0x2c
	str r2, [sp, #0x28]
	adds r6, r7, #0
	adds r6, #0x18
	str r6, [sp, #0x18]
	adds r0, r7, #0
	adds r0, #0x1c
	str r0, [sp, #0x1c]
	adds r1, #0x14
	str r1, [sp, #0x38]
	adds r2, #4
	str r2, [sp, #0x2c]
	adds r6, #0x26
	str r6, [sp, #0x3c]
	adds r0, #0x24
	str r0, [sp, #0x40]
	adds r1, #6
	str r1, [sp, #0x44]
	adds r2, #4
	str r2, [sp, #0x30]
	subs r6, #8
	str r6, [sp, #0x34]
	movs r0, #0x99
	lsls r0, r0, #1
	adds r0, r7, r0
	str r0, [sp, #0x20]
	adds r1, #0x12
	str r1, [sp, #0x48]
	adds r2, #0x40
	str r2, [sp, #8]
	adds r6, #0x3f
	str r6, [sp, #0xc]
	adds r0, r7, #0
	adds r0, #0x76
	str r0, [sp, #0x10]
	adds r1, #0x25
	str r1, [sp, #0x14]
	movs r3, #0
	movs r5, #0
_0804A832:
	lsls r2, r4, #1
	ldr r6, [sp, #0x24]
	adds r0, r6, r2
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	ldr r6, [sp, #0x28]
	adds r0, r6, r2
	strh r1, [r0]
	lsls r1, r4, #3
	ldr r6, [sp, #0x18]
	adds r0, r6, r1
	str r5, [r0]
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	str r5, [r1]
	ldr r1, [sp, #0x38]
	adds r0, r1, r4
	strb r3, [r0]
	ldr r6, [sp, #0x2c]
	adds r1, r6, r2
	adds r2, r2, r4
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #3
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r1]
	ldr r6, [sp, #0x3c]
	adds r0, r6, r4
	strb r3, [r0]
	ldr r1, [sp, #0x40]
	adds r0, r1, r4
	strb r3, [r0]
	ldr r2, [sp, #0x44]
	adds r0, r2, r4
	strb r3, [r0]
	lsls r1, r4, #2
	ldr r6, [sp, #0x30]
	adds r0, r6, r1
	strh r5, [r0]
	ldr r2, [sp, #0x34]
	adds r0, r2, r1
	strh r5, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x90
	adds r6, r7, r0
	strh r5, [r6, #0x16]
	strh r5, [r6, #0x18]
	mov r8, r1
	cmp r4, #0
	beq _0804A8B4
	movs r0, #0x40
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804A8C0
	.align 2, 0
_0804A8B0: .4byte 0x00A77C00
_0804A8B4:
	movs r0, #0x40
	str r3, [sp, #0x4c]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0804A9BC @ =0x000002BF
_0804A8C0:
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	ldr r3, [sp, #0x4c]
	strb r3, [r0]
	mov r0, r8
	adds r0, #0x1b
	lsls r0, r0, #6
	strh r0, [r6, #0x1a]
	strh r5, [r6, #8]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sp
	strb r2, [r0, #4]
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x22
	movs r1, #0x10
	mov sl, r1
	mov r2, sl
	strb r2, [r0]
	adds r0, #3
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0804A832
	movs r5, #0
	movs r4, #0
	mov r1, sb
	strh r4, [r1]
	strh r4, [r1, #4]
	movs r0, #2
	strh r0, [r1, #2]
	strh r4, [r1, #6]
	ldr r0, _0804A9C0 @ =0x000037BF
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r1, _0804A9C4 @ =0x0600C000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0804A9C8 @ =0x0600A000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0xb8
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r6, [sp, #0x20]
	strb r5, [r6]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	ldr r6, [sp, #0x48]
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0804A9CC @ =0x000002C1
	strh r0, [r6, #0xa]
	ldr r0, [sp, #8]
	strb r5, [r0]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r0, r2
	strb r0, [r1]
	mov r1, sl
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	ldr r2, [sp, #0x14]
	strb r5, [r2]
	mov r0, r8
	str r0, [r6, #0x28]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r1, _0804A9D0 @ =gUnknown_030054A8
	movs r0, #0xc8
	strh r0, [r1, #6]
	ldr r2, _0804A9D4 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A9BC: .4byte 0x000002BF
_0804A9C0: .4byte 0x000037BF
_0804A9C4: .4byte 0x0600C000
_0804A9C8: .4byte 0x0600A000
_0804A9CC: .4byte 0x000002C1
_0804A9D0: .4byte gUnknown_030054A8
_0804A9D4: .4byte gUnknown_03005424

	thumb_func_start sub_804A9D8
sub_804A9D8: @ 0x0804A9D8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0804AAE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, [r5, #0x14]
	cmp r0, #0x3c
	bls _0804AA68
	ldr r0, [r5, #4]
	ldr r1, _0804AAE8 @ =0xFFFFFF00
	adds r0, r0, r1
	str r0, [r5, #4]
	ldr r4, _0804AAEC @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0804AA0A
	movs r0, #0x82
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804AA0A:
	ldr r0, [r4]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0804AA26
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x10
	movs r2, #0x80
	movs r3, #0x14
	bl sub_802B4F8
_0804AA26:
	ldr r0, [r5, #0x14]
	movs r1, #0x1e
	bl Mod
	cmp r0, #0
	bne _0804AA68
	ldr r4, _0804AAF0 @ =gPlayer
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x14]
	subs r0, #0x3c
	movs r1, #0x1e
	bl __udivsi3
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _0804AA4E
	movs r1, #3
_0804AA4E:
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #3
	bhi _0804AA68
	asrs r1, r1, #0x18
	movs r0, #0x46
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0804AAF4 @ =0x0000FFFF
	strh r0, [r1]
_0804AA68:
	movs r0, #1
	strb r0, [r5, #0xb]
	adds r0, r5, #0
	bl sub_804C3AC
	ldr r6, _0804AAF0 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0xc0
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r5, #0x14]
	subs r4, r0, #1
	str r4, [r5, #0x14]
	cmp r4, #0
	bne _0804AADC
	ldr r2, _0804AAF8 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _0804AAFC @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x20]
	ldr r1, _0804AB00 @ =0xFF9FFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x82
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r1, _0804AB04 @ =gUnknown_030054A8
	strb r4, [r1]
	movs r0, #0x12
	strb r0, [r1, #1]
	ldr r1, _0804AB08 @ =gCamera
	ldr r0, _0804AB0C @ =0x0000A744
	str r0, [r1, #0x30]
	strb r4, [r5, #0xb]
	ldr r0, [r6, #0x20]
	ldr r1, _0804AB10 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r1, _0804AB14 @ =gUnknown_03005AF0
	ldr r0, [r1, #0x1c]
	ldr r3, _0804AB18 @ =0xFFFFCFFF
	ands r0, r3
	movs r2, #0x80
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r1, _0804AB1C @ =gUnknown_03005AA0
	ldr r0, [r1, #0x1c]
	ands r0, r3
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _0804AAE4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0804AB20 @ =sub_804AB24
	str r0, [r1, #8]
_0804AADC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAE4: .4byte gCurTask
_0804AAE8: .4byte 0xFFFFFF00
_0804AAEC: .4byte gUnknown_03005590
_0804AAF0: .4byte gPlayer
_0804AAF4: .4byte 0x0000FFFF
_0804AAF8: .4byte gUnknown_03005424
_0804AAFC: .4byte 0x0000FFDF
_0804AB00: .4byte 0xFF9FFFFF
_0804AB04: .4byte gUnknown_030054A8
_0804AB08: .4byte gCamera
_0804AB0C: .4byte 0x0000A744
_0804AB10: .4byte 0xFFDFFFFF
_0804AB14: .4byte gUnknown_03005AF0
_0804AB18: .4byte 0xFFFFCFFF
_0804AB1C: .4byte gUnknown_03005AA0
_0804AB20: .4byte sub_804AB24

	thumb_func_start sub_804AB24
sub_804AB24: @ 0x0804AB24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0804AC44 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	adds r0, #0x48
	adds r6, r4, r0
	adds r0, r7, #0
	bl sub_804CC98
	adds r0, r7, #0
	bl sub_804CA08
	adds r0, r7, #0
	bl sub_804AE40
	ldr r5, _0804AC48 @ =gUnknown_080D8890
	ldr r1, _0804AC4C @ =IWRAM_START + 0x3C
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	bl _call_via_r2
	ldr r2, _0804AC50 @ =IWRAM_START + 0x3D
	adds r4, r4, r2
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r7, #0
	movs r1, #1
	bl _call_via_r2
	adds r0, r7, #0
	bl sub_804C5B8
	adds r0, r7, #0
	bl sub_804C830
	adds r0, r7, #0
	bl sub_804CA70
	ldr r4, _0804AC54 @ =gPlayer
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	cmp r0, #0xb8
	ble _0804ABC0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, _0804AC58 @ =0x0000A819
	cmp r0, r1
	ble _0804ABC0
	adds r0, r4, #0
	bl sub_800CBA4
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABB4
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_0804ABB4:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABC0
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_0804ABC0:
	ldr r4, _0804AC54 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, _0804AC5C @ =0x0000A84F
	cmp r0, r1
	ble _0804ABEA
	adds r0, r4, #0
	bl sub_800CBA4
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABDE
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_0804ABDE:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABEA
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_0804ABEA:
	ldrb r4, [r7, #8]
	cmp r4, #0
	beq _0804ABF2
	b _0804AD54
_0804ABF2:
	ldr r2, _0804AC60 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0804AC44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0804AC64 @ =sub_804AD68
	str r0, [r1, #8]
	movs r0, #0xff
	str r0, [r7, #0x14]
	bl sub_802A050
	ldr r2, _0804AC54 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x5c
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0804AC68
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r2, #0x10]
	strh r4, [r2, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	b _0804AC6E
	.align 2, 0
_0804AC44: .4byte gCurTask
_0804AC48: .4byte gUnknown_080D8890
_0804AC4C: .4byte IWRAM_START + 0x3C
_0804AC50: .4byte IWRAM_START + 0x3D
_0804AC54: .4byte gPlayer
_0804AC58: .4byte 0x0000A819
_0804AC5C: .4byte 0x0000A84F
_0804AC60: .4byte gFlags
_0804AC64: .4byte sub_804AD68
_0804AC68:
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x12]
_0804AC6E:
	movs r1, #0
	strh r1, [r6]
	strh r1, [r6, #4]
	movs r0, #1
	strh r0, [r6, #2]
	movs r0, #0x10
	strh r0, [r6, #6]
	ldr r0, _0804AD2C @ =0x00003FBF
	strh r0, [r6, #8]
	strh r1, [r6, #0xa]
	movs r6, #0
	adds r0, r7, #0
	adds r0, #0x18
	str r0, [sp]
	adds r1, r7, #0
	adds r1, #0x28
	str r1, [sp, #8]
	adds r2, r7, #0
	adds r2, #0x1c
	str r2, [sp, #4]
	adds r0, #0x1c
	str r0, [sp, #0xc]
	adds r1, #0xe
	str r1, [sp, #0x10]
	movs r2, #0x3c
	adds r2, r2, r7
	mov sl, r2
	movs r0, #0x30
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _0804AD30 @ =gSineTable
	mov r8, r1
	movs r2, #2
	mov ip, r2
_0804ACB2:
	lsls r2, r6, #3
	ldr r0, [sp]
	adds r3, r0, r2
	lsls r5, r6, #1
	ldr r1, [sp, #8]
	adds r4, r1, r5
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldrh r0, [r4]
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	lsls r1, r6, #2
	ldr r2, [sp, #0xc]
	adds r0, r2, r1
	ldr r2, _0804AD34 @ =0xFFFFFE80
	strh r2, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r1]
	mov r2, sl
	adds r1, r2, r6
	movs r0, #7
	strb r0, [r1]
	add r5, sb
	movs r0, #0x3c
	strh r0, [r5]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r1, r7, r0
	cmp r6, #0
	beq _0804AD38
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804AD3A
	.align 2, 0
_0804AD2C: .4byte 0x00003FBF
_0804AD30: .4byte gSineTable
_0804AD34: .4byte 0xFFFFFE80
_0804AD38:
	ldr r0, _0804AD64 @ =0x000002BF
_0804AD3A:
	strh r0, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	mov r2, ip
	strb r2, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _0804ACB2
_0804AD54:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD64: .4byte 0x000002BF

	thumb_func_start sub_804AD68
sub_804AD68: @ 0x0804AD68
	push {r4, r5, r6, lr}
	ldr r4, _0804ADC0 @ =gCurTask
	ldr r0, [r4]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	ldr r1, _0804ADC4 @ =IWRAM_START + 0x48
	adds r0, r6, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0804ADE4
	ldr r0, _0804ADC8 @ =0x00005010
	ldr r1, _0804ADCC @ =0x00005011
	bl TasksDestroyInPriorityRange
	ldr r0, _0804ADD0 @ =0x00005431
	ldr r1, _0804ADD4 @ =0x00005434
	bl TasksDestroyInPriorityRange
	ldr r2, _0804ADD8 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0804ADDC @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	ldr r1, [r4]
	ldr r0, _0804ADE0 @ =sub_804CC30
	str r0, [r1, #8]
	b _0804AE2C
	.align 2, 0
_0804ADC0: .4byte gCurTask
_0804ADC4: .4byte IWRAM_START + 0x48
_0804ADC8: .4byte 0x00005010
_0804ADCC: .4byte 0x00005011
_0804ADD0: .4byte 0x00005431
_0804ADD4: .4byte 0x00005434
_0804ADD8: .4byte gUnknown_03005424
_0804ADDC: .4byte gPlayer
_0804ADE0: .4byte sub_804CC30
_0804ADE4:
	adds r0, r5, #0
	bl sub_804CC98
	adds r0, r5, #0
	bl sub_804CA08
	ldr r4, _0804AE34 @ =gUnknown_080D8890
	ldr r1, _0804AE38 @ =IWRAM_START + 0x3C
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r5, #0
	movs r1, #0
	bl _call_via_r2
	ldr r3, _0804AE3C @ =IWRAM_START + 0x3D
	adds r0, r6, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r5, #0
	movs r1, #1
	bl _call_via_r2
	adds r0, r5, #0
	bl sub_804C5B8
	adds r0, r5, #0
	bl sub_804CA70
	adds r0, r5, #0
	bl sub_804C080
_0804AE2C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE34: .4byte gUnknown_080D8890
_0804AE38: .4byte IWRAM_START + 0x3C
_0804AE3C: .4byte IWRAM_START + 0x3D

	thumb_func_start sub_804AE40
sub_804AE40: @ 0x0804AE40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0804AE94 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804AE7A
	ldrh r1, [r5, #0xe]
	cmp r1, #0
	bne _0804AE76
	ldr r0, _0804AE98 @ =gBldRegs
	strh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r2, _0804AE9C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
_0804AE76:
	movs r0, #2
	strh r0, [r5, #0xe]
_0804AE7A:
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	beq _0804AEA0
	subs r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804AE8C
	b _0804B0CE
_0804AE8C:
	movs r0, #0x78
	strb r0, [r5, #0x12]
	b _0804B0CE
	.align 2, 0
_0804AE94: .4byte gPlayer
_0804AE98: .4byte gBldRegs
_0804AE9C: .4byte gFlags
_0804AEA0:
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _0804AED4
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	beq _0804AEC2
	movs r0, #0x78
	strb r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl sub_802D4CC
_0804AEC2:
	ldr r0, _0804AED0 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _0804B0CE
	.align 2, 0
_0804AED0: .4byte gFlags
_0804AED4:
	ldrb r0, [r5, #0x12]
	subs r4, r0, #1
	strb r4, [r5, #0x12]
	movs r0, #0xff
	mov sb, r0
	lsls r0, r4, #0x18
	cmp r0, #0
	bne _0804AF34
	ldr r2, _0804AF2C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl sub_802D4CC
	ldrb r0, [r5, #8]
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r1, r2, #0
	cmp r0, #4
	bhi _0804AF10
	movs r1, #0x8c
_0804AF10:
	strh r1, [r5, #0xe]
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, _0804AF30 @ =0x000002C1
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	mov r6, sb
	orrs r0, r6
	strb r0, [r1]
	b _0804B0CE
	.align 2, 0
_0804AF2C: .4byte gFlags
_0804AF30: .4byte 0x000002C1
_0804AF34:
	ldr r0, [r5]
	movs r7, #0xbe
	lsls r7, r7, #8
	adds r0, r0, r7
	asrs r0, r0, #8
	mov r8, r0
	ldr r0, _0804AFF4 @ =gSineTable
	mov sl, r0
	ldrh r1, [r5, #0x10]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	movs r6, #0
	ldrsh r0, [r0, r6]
	movs r3, #0xb
	muls r0, r3, r0
	asrs r0, r0, #0xe
	add r8, r0
	ldr r2, _0804AFF8 @ =gCamera
	ldr r0, [r2]
	mov r7, r8
	subs r7, r7, r0
	mov r8, r7
	ldr r0, [r5, #4]
	movs r6, #0xa0
	lsls r6, r6, #6
	adds r0, r0, r6
	asrs r6, r0, #8
	lsls r1, r1, #1
	add r1, sl
	movs r7, #0
	ldrsh r0, [r1, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	adds r6, r6, r0
	ldr r0, [r2, #4]
	subs r6, r6, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x5a
	bls _0804B008
	movs r0, #0
	bl sub_802EFDC
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r4, _0804AFFC @ =gUnknown_030053B8
	ldr r1, [r4]
	ldr r0, _0804B000 @ =0x00196225
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, _0804B004 @ =0x3C6EF35F
	adds r2, r2, r1
	str r2, [r4]
	ldrb r0, [r5, #0x12]
	subs r0, #0x5a
	lsls r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r1, #7
	ands r2, r1
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xa0
	bl sub_80075D0
	ldrb r1, [r5, #0x12]
	subs r1, #0x5a
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4c
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl sub_802D4CC
	b _0804B0CE
	.align 2, 0
_0804AFF4: .4byte gSineTable
_0804AFF8: .4byte gCamera
_0804AFFC: .4byte gUnknown_030053B8
_0804B000: .4byte 0x00196225
_0804B004: .4byte 0x3C6EF35F
_0804B008:
	cmp r0, #0x5a
	bne _0804B02A
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, _0804B060 @ =0x000002C1
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0804B064 @ =0x00000105
	bl m4aSongNumStart
_0804B02A:
	ldrb r0, [r5, #0x12]
	lsls r3, r0, #0x18
	lsrs r7, r3, #0x18
	cmp r7, #0x45
	bhi _0804B074
	ldr r2, _0804B068 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0804B06C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804B070 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsrs r2, r3, #0x19
	movs r1, #7
	ands r0, r1
	adds r0, #8
	adds r4, r2, r0
	cmp r7, #0x3c
	bls _0804B096
	adds r1, r4, #0
	subs r1, #0xa
	lsls r1, r1, #8
	adds r0, r5, #0
	bl sub_804CCD0
	b _0804B096
	.align 2, 0
_0804B060: .4byte 0x000002C1
_0804B064: .4byte 0x00000105
_0804B068: .4byte gUnknown_030053B8
_0804B06C: .4byte 0x00196225
_0804B070: .4byte 0x3C6EF35F
_0804B074:
	ldr r2, _0804B0E0 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0804B0E4 @ =0x00196225
	muls r1, r0, r1
	ldr r7, _0804B0E8 @ =0x3C6EF35F
	adds r1, r1, r7
	str r1, [r2]
	ldrb r2, [r5, #0x12]
	movs r0, #0x74
	subs r0, r0, r2
	asrs r0, r0, #2
	movs r2, #7
	ands r1, r2
	adds r1, #0x1e
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0804B096:
	ldrh r0, [r5, #0x10]
	mov r1, r8
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	adds r1, r6, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0x20
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #6
	bl sub_802E784
	ldrb r1, [r5, #0x12]
	movs r0, #0x5b
	muls r1, r0, r1
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4c
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl sub_802D4CC
_0804B0CE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B0E0: .4byte gUnknown_030053B8
_0804B0E4: .4byte 0x00196225
_0804B0E8: .4byte 0x3C6EF35F

	thumb_func_start sub_804B0EC
sub_804B0EC: @ 0x0804B0EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	adds r0, #0x3e
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B114
_0804B110:
	movs r0, #0
	b _0804B2CE
_0804B114:
	mov r1, sb
	lsls r4, r1, #3
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r4
	mov r2, r8
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [sp, #4]
	ldr r2, _0804B1CC @ =gUnknown_080D8888
	mov r0, sb
	lsls r3, r0, #2
	adds r0, r3, r2
	ldrh r0, [r0]
	mov sl, r0
	adds r5, r1, #0
	add r5, sl
	mov r0, r8
	adds r0, #0x1c
	adds r0, r0, r4
	mov r4, r8
	ldr r1, [r4, #4]
	ldr r0, [r0]
	adds r1, r1, r0
	mov ip, r1
	adds r2, #2
	adds r3, r3, r2
	ldrh r7, [r3]
	adds r4, r1, r7
	ldr r3, _0804B1D0 @ =gSineTable
	mov r0, sb
	lsls r1, r0, #1
	mov r0, r8
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r6, [r0, r2]
	movs r2, #0xbe
	adds r0, r6, #0
	muls r0, r2, r0
	asrs r0, r0, #9
	adds r5, r5, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r0, #0
	ldrsh r3, [r1, r0]
	adds r0, r3, #0
	muls r0, r2, r0
	asrs r0, r0, #9
	adds r4, r4, r0
	ldr r2, _0804B1D4 @ =gPlayer
	ldr r0, [r2, #8]
	subs r0, r0, r5
	asrs r5, r0, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r4
	asrs r4, r0, #8
	adds r1, r5, #0
	muls r1, r5, r1
	adds r5, r1, #0
	adds r0, r4, #0
	muls r0, r4, r0
	adds r4, r0, #0
	adds r0, r5, r4
	cmp r0, #0xc7
	bgt _0804B1DC
	adds r0, r2, #0
	bl sub_800CBA4
	mov r0, r8
	adds r0, #0x40
	add r0, sb
	movs r1, #1
	strb r1, [r0]
	mov r0, r8
	adds r0, #0x3c
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #3
	bne _0804B110
	ldr r0, _0804B1D8 @ =0x00000107
	bl m4aSongNumStart
	b _0804B110
	.align 2, 0
_0804B1CC: .4byte gUnknown_080D8888
_0804B1D0: .4byte gSineTable
_0804B1D4: .4byte gPlayer
_0804B1D8: .4byte 0x00000107
_0804B1DC:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [sp, #8]
	ldr r5, [sp, #4]
	add r5, sl
	mov r1, ip
	adds r4, r1, r7
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #5
	subs r1, r1, r6
	asrs r1, r1, #9
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	subs r0, r0, r3
	asrs r0, r0, #9
	adds r6, r5, r1
	adds r7, r4, r0
	ldr r0, _0804B280 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804B21E
	adds r0, r6, #0
	adds r1, r7, #0
	str r2, [sp, #0xc]
	bl sub_80122DC
	ldr r2, [sp, #0xc]
_0804B21E:
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804B288
	ldr r4, [sp, #8]
	ldr r1, [r4, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804B288
	ldr r0, [r2, #8]
	subs r0, r0, r6
	asrs r5, r0, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r7
	asrs r4, r0, #8
	adds r0, r5, #0
	muls r0, r5, r0
	adds r5, r0, #0
	adds r1, r4, #0
	muls r1, r4, r1
	adds r4, r1, #0
	adds r1, r5, r4
	ldr r0, _0804B284 @ =0x00000177
	cmp r1, r0
	bgt _0804B288
	mov r0, r8
	mov r1, sb
	str r2, [sp, #0xc]
	bl sub_804C9B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r2, [sp, #0xc]
	movs r4, #0x10
	ldrsh r0, [r2, r4]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	movs r4, #0x14
	ldrsh r0, [r2, r4]
	rsbs r0, r0, #0
	strh r0, [r2, #0x14]
	b _0804B2CC
	.align 2, 0
_0804B280: .4byte gSelectedCharacter
_0804B284: .4byte 0x00000177
_0804B288:
	ldr r0, _0804B2E0 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _0804B2CC
	ldr r1, [r2, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804B2CC
	ldr r0, [r2]
	subs r6, r6, r0
	asrs r6, r6, #8
	ldr r0, [r2, #4]
	subs r7, r7, r0
	asrs r7, r7, #8
	adds r0, r6, #0
	muls r0, r6, r0
	adds r1, r7, #0
	muls r1, r7, r1
	adds r0, r0, r1
	ldr r1, _0804B2E4 @ =0x00000177
	cmp r0, r1
	bgt _0804B2CC
	mov r0, r8
	mov r1, sb
	bl sub_804C9B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _0804B2E8 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
_0804B2CC:
	ldr r0, [sp]
_0804B2CE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B2E0: .4byte gUnknown_030056A4
_0804B2E4: .4byte 0x00000177
_0804B2E8: .4byte gUnknown_03005498

	thumb_func_start sub_804B2EC
sub_804B2EC: @ 0x0804B2EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x3e
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B314
	movs r0, #0
	b _0804B41E
_0804B314:
	ldr r1, _0804B3C8 @ =gPlayer
	mov r8, r1
	mov r0, r8
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov sl, r0
	mov r2, sb
	lsls r4, r2, #3
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r0, r4
	ldr r3, [r7]
	ldr r0, [r0]
	ldr r1, _0804B3CC @ =gUnknown_080D8888
	lsls r2, r2, #2
	adds r5, r2, r1
	adds r6, r3, r0
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r0, r4
	ldr r3, [r7, #4]
	ldr r0, [r0]
	adds r1, #2
	adds r2, r2, r1
	adds r0, r3, r0
	ldrh r5, [r5]
	adds r4, r6, r5
	ldrh r2, [r2]
	adds r5, r0, r2
	ldr r0, _0804B3D0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804B364
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80122DC
_0804B364:
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804B3D8
	mov r2, sl
	ldr r1, [r2, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804B3D8
	mov r1, r8
	ldr r0, [r1, #8]
	subs r0, r0, r4
	asrs r6, r0, #8
	ldr r0, [r1, #0xc]
	subs r0, r0, r5
	asrs r0, r0, #8
	adds r2, r6, #0
	muls r2, r6, r2
	adds r6, r2, #0
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r6, r0
	ldr r0, _0804B3D4 @ =0x00000177
	cmp r1, r0
	bgt _0804B3D8
	adds r0, r7, #0
	mov r1, sb
	bl sub_804C9B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	mov r2, r8
	movs r5, #0x10
	ldrsh r0, [r2, r5]
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	movs r5, #0x14
	ldrsh r0, [r2, r5]
	rsbs r0, r0, #0
	strh r0, [r2, #0x14]
	b _0804B41C
	.align 2, 0
_0804B3C8: .4byte gPlayer
_0804B3CC: .4byte gUnknown_080D8888
_0804B3D0: .4byte gSelectedCharacter
_0804B3D4: .4byte 0x00000177
_0804B3D8:
	ldr r0, _0804B430 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _0804B41C
	ldr r1, [r2, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804B41C
	ldr r0, [r2]
	subs r4, r4, r0
	asrs r4, r4, #8
	ldr r0, [r2, #4]
	subs r5, r5, r0
	asrs r5, r5, #8
	adds r0, r4, #0
	muls r0, r4, r0
	adds r1, r5, #0
	muls r1, r5, r1
	adds r0, r0, r1
	ldr r1, _0804B434 @ =0x00000177
	cmp r0, r1
	bgt _0804B41C
	adds r0, r7, #0
	mov r1, sb
	bl sub_804C9B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _0804B438 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
_0804B41C:
	ldr r0, [sp]
_0804B41E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B430: .4byte gUnknown_030056A4
_0804B434: .4byte 0x00000177
_0804B438: .4byte gUnknown_03005498

	thumb_func_start sub_804B43C
sub_804B43C: @ 0x0804B43C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r6, #3
	adds r0, #0x18
	adds r0, r0, r2
	movs r1, #0
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r0, r2
	str r1, [r0]
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804B498
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r6, #0
	beq _0804B484
	movs r0, #0
	movs r1, #0xb0
	lsls r1, r1, #2
	b _0804B488
_0804B484:
	movs r0, #0
	ldr r1, _0804B564 @ =0x000002BF
_0804B488:
	strh r1, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B498:
	lsls r5, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r0, r0, r5
	mov r8, r0
	ldrh r0, [r0]
	subs r0, #1
	movs r1, #0
	mov sb, r1
	mov r1, r8
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804B4CE
	adds r0, r7, #0
	adds r0, #0x3c
	adds r0, r0, r6
	movs r1, #1
	strb r1, [r0]
	movs r0, #0xb4
	mov r1, r8
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x40
	adds r0, r0, r6
	mov r1, sb
	strb r1, [r0]
_0804B4CE:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B584
	lsls r4, r6, #3
	adds r2, r7, #0
	adds r2, #0x18
	adds r2, r2, r4
	ldr r0, _0804B568 @ =gSineTable
	mov ip, r0
	adds r3, r7, #0
	adds r3, #0x28
	adds r3, r3, r5
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r7, #0
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	lsls r2, r6, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804B56C @ =0x0000FE80
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3c
	adds r0, r0, r6
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	mov r1, r8
	strh r0, [r1]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r6, #0
	beq _0804B570
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B572
	.align 2, 0
_0804B564: .4byte 0x000002BF
_0804B568: .4byte gSineTable
_0804B56C: .4byte 0x0000FE80
_0804B570:
	ldr r0, _0804B590 @ =0x000002BF
_0804B572:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B584:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B590: .4byte 0x000002BF

	thumb_func_start sub_804B594
sub_804B594: @ 0x0804B594
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r3, r1, #3
	adds r1, r7, #0
	adds r1, #0x18
	adds r1, r1, r3
	movs r2, #0
	str r2, [r1]
	adds r0, #0x1c
	adds r0, r0, r3
	str r2, [r0]
	ldr r2, [r7]
	ldr r4, [r1]
	ldr r0, _0804B608 @ =gUnknown_080D8888
	mov r3, r8
	lsls r1, r3, #2
	adds r3, r1, r0
	adds r2, r2, r4
	ldrh r3, [r3]
	adds r5, r2, r3
	ldr r2, [r7, #4]
	adds r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r6, r2, r0
	ldr r1, _0804B60C @ =gPlayer
	ldr r0, [r1, #0xc]
	subs r0, r0, r6
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	subs r1, r1, r5
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x28
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r3, r1
	beq _0804B614
	cmp r3, r1
	bhs _0804B610
	subs r0, #1
	b _0804B612
	.align 2, 0
_0804B608: .4byte gUnknown_080D8888
_0804B60C: .4byte gPlayer
_0804B610:
	adds r0, #1
_0804B612:
	strh r0, [r2]
_0804B614:
	mov r1, r8
	lsls r2, r1, #1
	adds r3, r7, #0
	adds r3, #0x30
	adds r1, r3, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	adds r6, r2, #0
	mov sb, r3
	cmp r0, #0
	bne _0804B66A
	mov r3, r8
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r3, #0
	beq _0804B644
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B646
_0804B644:
	ldr r0, _0804B704 @ =0x000002BF
_0804B646:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	add r0, r8
	movs r1, #2
	strb r1, [r0]
	mov r0, sb
	adds r1, r0, r6
	movs r0, #0x1e
	strh r0, [r1]
_0804B66A:
	adds r0, r7, #0
	mov r1, r8
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B724
	mov r1, r8
	lsls r4, r1, #3
	adds r2, r7, #0
	adds r2, #0x18
	adds r2, r2, r4
	ldr r5, _0804B708 @ =gSineTable
	adds r3, r7, #0
	adds r3, #0x28
	adds r3, r3, r6
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r7, #0
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r0, r8
	lsls r2, r0, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804B70C @ =0x0000FE80
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3c
	add r0, r8
	movs r1, #7
	strb r1, [r0]
	mov r3, sb
	adds r1, r3, r6
	movs r0, #0x3c
	strh r0, [r1]
	mov r1, r8
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	cmp r1, #0
	beq _0804B710
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B712
	.align 2, 0
_0804B704: .4byte 0x000002BF
_0804B708: .4byte gSineTable
_0804B70C: .4byte 0x0000FE80
_0804B710:
	ldr r0, _0804B730 @ =0x000002BF
_0804B712:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B724:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B730: .4byte 0x000002BF

	thumb_func_start sub_804B734
sub_804B734: @ 0x0804B734
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r3, r0, r2
	movs r1, #0
	str r1, [r3]
	adds r0, #4
	adds r5, r0, r2
	str r1, [r5]
	ldr r0, [sp, #0x20]
	lsls r6, r0, #1
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	adds r1, r1, r6
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804B772
	b _0804B8AC
_0804B772:
	ldr r4, [r7]
	ldr r3, [r3]
	ldr r0, _0804B840 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	ldr r2, [r7, #4]
	ldr r3, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r2, r2, r3
	ldrh r1, [r1]
	adds r2, r2, r1
	movs r1, #0
	str r6, [sp, #0x2c]
	mov r3, r8
	str r3, [sp, #0x38]
	adds r0, r7, #0
	adds r0, #0x28
	adds r6, r7, #0
	adds r6, #0xc
	str r6, [sp, #0x28]
	adds r3, r7, #0
	adds r3, #0x3c
	str r3, [sp, #0x3c]
	asrs r4, r4, #8
	str r4, [sp, #0x30]
	asrs r2, r2, #8
	str r2, [sp, #0x34]
	ldr r6, [sp, #0x2c]
	adds r2, r0, r6
	ldr r0, _0804B844 @ =0x000003FF
	mov sl, r0
	mov r5, sp
	mov sb, r1
_0804B7BE:
	movs r3, #0
	mov r8, r3
	subs r4, r1, #1
	adds r6, r1, #1
	str r6, [sp, #0x24]
	adds r3, r4, #0
	movs r0, #1
	subs r1, r0, r1
	str r1, [sp, #0x48]
_0804B7D0:
	ldrh r0, [r2]
	ldr r1, _0804B848 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r6, sl
	ands r0, r6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r6, _0804B84C @ =gSineTable
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r6, [sp, #0x30]
	subs r0, r6, r0
	str r0, [sp, #0x14]
	ldrh r0, [r2]
	ldr r1, _0804B848 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r6, sl
	ands r0, r6
	lsls r0, r0, #1
	ldr r1, _0804B84C @ =gSineTable
	adds r0, r0, r1
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x34]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	mov r6, sb
	strh r6, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r6, [r2]
	adds r0, r0, r6
	mov r1, sl
	ands r0, r1
	strh r0, [r5, #0xc]
	mov r6, r8
	lsls r0, r6, #7
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r0, r6
	ldr r0, [sp, #0x48]
	cmp r0, #0
	blt _0804B850
	lsls r0, r0, #1
	ldr r6, [sp, #0x48]
	adds r0, r0, r6
	b _0804B854
	.align 2, 0
_0804B840: .4byte gUnknown_080D8888
_0804B844: .4byte 0x000003FF
_0804B848: .4byte 0xFFFFFF00
_0804B84C: .4byte gSineTable
_0804B850:
	lsls r0, r4, #1
	adds r0, r0, r4
_0804B854:
	lsls r0, r0, #5
	subs r0, r1, r0
	strh r0, [r5, #0xe]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	ldr r0, _0804B950 @ =0x000002C3
	strh r0, [r5, #8]
	mov r0, sb
	strh r0, [r5, #0xa]
	mov r1, sb
	str r1, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x28]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	bl sub_8039D04
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	cmp r0, #2
	bls _0804B7D0
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _0804B7BE
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x20]
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x2c]
	adds r1, r2, r3
	movs r0, #0xa
	strh r0, [r1]
	adds r0, #0xfc
	bl m4aSongNumStart
_0804B8AC:
	adds r0, r7, #0
	ldr r1, [sp, #0x20]
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B970
	ldr r6, [sp, #0x20]
	lsls r4, r6, #3
	adds r2, r7, #0
	adds r2, #0x18
	adds r2, r2, r4
	ldr r5, _0804B954 @ =gSineTable
	lsls r6, r6, #1
	adds r3, r7, #0
	adds r3, #0x28
	adds r3, r3, r6
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r7, #0
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [sp, #0x20]
	lsls r2, r0, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804B958 @ =0x0000FE80
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3c
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #7
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x30
	adds r0, r0, r6
	movs r1, #0x3c
	strh r1, [r0]
	ldr r2, [sp, #0x20]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r7, r0
	ldr r3, [sp, #0x20]
	cmp r3, #0
	beq _0804B95C
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804B95E
	.align 2, 0
_0804B950: .4byte 0x000002C3
_0804B954: .4byte gSineTable
_0804B958: .4byte 0x0000FE80
_0804B95C:
	ldr r0, _0804B980 @ =0x000002BF
_0804B95E:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804B970:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B980: .4byte 0x000002BF

	thumb_func_start sub_804B984
sub_804B984: @ 0x0804B984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov sl, r5
	lsls r2, r5, #3
	adds r0, #0x18
	adds r0, r0, r2
	mov sb, r0
	lsls r3, r5, #1
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r3
	mov r8, r0
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r6, _0804BA90 @ =gSineTable
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	mov r6, sb
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	adds r0, r4, #0
	adds r0, #0x1c
	adds r6, r0, r2
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #1
	ldr r2, _0804BA90 @ =gSineTable
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	adds r0, r4, #0
	adds r0, #0x30
	adds r7, r0, r3
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804BA08
	adds r0, r4, #0
	adds r0, #0x3c
	adds r0, r0, r5
	movs r1, #6
	strb r1, [r0]
	movs r0, #0x1e
	strh r0, [r7]
_0804BA08:
	adds r0, r4, #0
	mov r1, sl
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BAAC
	mov r2, r8
	ldrh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _0804BA90 @ =gSineTable
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #1
	ldr r2, _0804BA90 @ =gSineTable
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r6, sl
	lsls r2, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804BA94 @ =0x0000FE80
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	add r0, sl
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	strh r0, [r7]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r4, r0
	cmp r6, #0
	beq _0804BA98
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804BA9A
	.align 2, 0
_0804BA90: .4byte gSineTable
_0804BA94: .4byte 0x0000FE80
_0804BA98:
	ldr r0, _0804BABC @ =0x000002BF
_0804BA9A:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804BAAC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BABC: .4byte 0x000002BF

	thumb_func_start sub_804BAC0
sub_804BAC0: @ 0x0804BAC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r7, r5, #0
	lsls r0, r5, #1
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x30
	add r0, r8
	mov sb, r0
	ldrh r0, [r0]
	subs r0, #1
	mov r1, sb
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804BB84
	lsls r3, r5, #3
	adds r2, r6, #0
	adds r2, #0x18
	adds r2, r2, r3
	ldr r0, _0804BB5C @ =gSineTable
	mov ip, r0
	adds r0, r6, #0
	adds r0, #0x28
	mov r1, r8
	adds r4, r0, r1
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r6, #0
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r0, [r4]
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BB60
	adds r0, r6, #0
	adds r0, #0x2c
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r5
	movs r1, #4
	strb r1, [r0]
	movs r0, #0x32
	b _0804BB6C
	.align 2, 0
_0804BB5C: .4byte gSineTable
_0804BB60:
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r5
	movs r1, #5
	strb r1, [r0]
	movs r0, #0xa0
_0804BB6C:
	mov r1, sb
	strh r0, [r1]
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r6, r0
	cmp r7, #0
	beq _0804BC20
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804BC22
_0804BB84:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_804B0EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BC34
	lsls r0, r7, #3
	mov ip, r0
	adds r2, r6, #0
	adds r2, #0x18
	add r2, ip
	ldr r5, _0804BC18 @ =gSineTable
	adds r3, r6, #0
	adds r3, #0x28
	add r3, r8
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r2, r6, #0
	adds r2, #0x1c
	add r2, ip
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	lsls r2, r7, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804BC1C @ =0x0000FE80
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r7
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	mov r1, sb
	strh r0, [r1]
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x90
	adds r2, r6, r0
	cmp r7, #0
	beq _0804BC20
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804BC22
	.align 2, 0
_0804BC18: .4byte gSineTable
_0804BC1C: .4byte 0x0000FE80
_0804BC20:
	ldr r0, _0804BC40 @ =0x000002BF
_0804BC22:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804BC34:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC40: .4byte 0x000002BF

	thumb_func_start sub_804BC44
sub_804BC44: @ 0x0804BC44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r6, r0, r2
	ldr r0, _0804BDE0 @ =gSineTable
	mov ip, r0
	lsls r7, r1, #1
	mov r1, sb
	adds r1, #0x2c
	str r1, [sp, #0x24]
	adds r1, r1, r7
	mov sl, r1
	ldrh r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #5
	subs r1, r1, r0
	asrs r1, r1, #0xa
	ldr r0, [r6]
	subs r0, r0, r1
	str r0, [r6]
	mov r0, sb
	adds r0, #0x1c
	adds r5, r0, r2
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #1
	add r0, ip
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r1, r0, #5
	subs r1, r1, r0
	asrs r1, r1, #0xa
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]
	mov r3, sb
	adds r3, #0x28
	str r3, [sp, #0x28]
	adds r3, r3, r7
	mov r4, sb
	adds r4, #0x30
	str r4, [sp, #0x2c]
	adds r2, r4, r7
	ldrh r0, [r2]
	lsls r0, r0, #2
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r4, _0804BDE4 @ =0x000003FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BCD6
	b _0804BE56
_0804BCD6:
	mov r0, sb
	ldr r4, [r0]
	ldr r3, [r6]
	ldr r0, _0804BDE8 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	mov r2, sb
	ldr r3, [r2, #4]
	ldr r2, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r3, r3, r2
	ldrh r1, [r1]
	adds r3, r3, r1
	mov r5, sl
	ldrh r2, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	add r0, ip
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r4, r4, r0
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r3, r3, r0
	movs r1, #0
	mov r8, r1
	str r7, [sp, #0x38]
	ldr r2, [sp, #0x24]
	str r2, [sp, #0x4c]
	ldr r5, [sp, #0x28]
	str r5, [sp, #0x48]
	ldr r7, [sp, #0x2c]
	str r7, [sp, #0x50]
	mov r0, sb
	adds r0, #0xc
	str r0, [sp, #0x34]
	mov r1, sb
	adds r1, #0x3c
	str r1, [sp, #0x54]
	asrs r4, r4, #8
	str r4, [sp, #0x40]
	asrs r3, r3, #8
	str r3, [sp, #0x44]
	mov r2, sl
	mov r4, sp
	movs r3, #0
	mov sl, r3
_0804BD52:
	movs r6, #0
	mov r5, r8
	subs r5, #1
	str r5, [sp, #0x60]
	mov r7, r8
	lsls r7, r7, #1
	str r7, [sp, #0x3c]
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x30]
	adds r3, r5, #0
	movs r1, #1
	mov r7, r8
	subs r5, r1, r7
_0804BD6E:
	ldrh r0, [r2]
	ldr r1, _0804BDEC @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r7, _0804BDE4 @ =0x000003FF
	ands r0, r7
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r7, _0804BDE0 @ =gSineTable
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r7, [sp, #0x40]
	subs r0, r7, r0
	str r0, [sp, #0x14]
	ldrh r0, [r2]
	ldr r1, _0804BDEC @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r7, _0804BDE4 @ =0x000003FF
	ands r0, r7
	lsls r0, r0, #1
	ldr r1, _0804BDE0 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x44]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	mov r7, sl
	strh r7, [r4, #0x1c]
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r0, #0
	ldrh r7, [r2]
	adds r1, r1, r7
	ldr r0, [sp, #0x3c]
	add r0, r8
	adds r0, r0, r6
	lsls r0, r0, #5
	subs r1, r1, r0
	ldr r0, _0804BDE4 @ =0x000003FF
	ands r1, r0
	strh r1, [r4, #0xc]
	lsls r0, r6, #7
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r0, r7
	cmp r5, #0
	blt _0804BDF0
	lsls r0, r5, #1
	adds r0, r0, r5
	b _0804BDF6
	.align 2, 0
_0804BDE0: .4byte gSineTable
_0804BDE4: .4byte 0x000003FF
_0804BDE8: .4byte gUnknown_080D8888
_0804BDEC: .4byte 0xFFFFFF00
_0804BDF0:
	ldr r7, [sp, #0x60]
	lsls r0, r7, #1
	adds r0, r0, r7
_0804BDF6:
	lsls r0, r0, #5
	subs r0, r1, r0
	strh r0, [r4, #0xe]
	mov r1, sb
	ldr r0, [r1, #0x44]
	str r0, [sp]
	ldr r0, _0804BE68 @ =0x000002C3
	strh r0, [r4, #8]
	mov r7, sl
	strh r7, [r4, #0xa]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x34]
	str r2, [sp, #0x58]
	str r3, [sp, #0x5c]
	bl sub_8039D04
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	cmp r6, #2
	bls _0804BD6E
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0804BD52
	ldr r3, [sp, #0x48]
	ldr r4, [sp, #0x38]
	adds r2, r3, r4
	ldr r5, [sp, #0x4c]
	adds r0, r5, r4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2]
	ldr r7, [sp, #0x54]
	ldr r2, [sp, #0x20]
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, [sp, #0x50]
	adds r1, r3, r4
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
_0804BE56:
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE68: .4byte 0x000002C3

	thumb_func_start sub_804BE6C
sub_804BE6C: @ 0x0804BE6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsls r2, r1, #3
	adds r0, #0x18
	adds r3, r0, r2
	ldr r0, _0804BFCC @ =gSineTable
	mov sb, r0
	lsls r7, r1, #1
	mov r0, r8
	adds r0, #0x28
	adds r6, r0, r7
	ldrh r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #9
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	mov r0, r8
	adds r0, #0x1c
	adds r5, r0, r2
	ldrh r0, [r6]
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #9
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]
	movs r2, #0x30
	add r2, r8
	mov sl, r2
	adds r4, r2, r7
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BEE0
	b _0804C034
_0804BEE0:
	mov r0, r8
	ldr r4, [r0]
	ldr r3, [r3]
	ldr r0, _0804BFD0 @ =gUnknown_080D8888
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r2, r1, r0
	adds r4, r4, r3
	ldrh r2, [r2]
	adds r4, r4, r2
	mov r2, r8
	ldr r3, [r2, #4]
	ldr r2, [r5]
	adds r0, #2
	adds r1, r1, r0
	adds r3, r3, r2
	ldrh r1, [r1]
	adds r3, r3, r1
	ldrh r2, [r6]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r4, r4, r0
	lsls r2, r2, #1
	add r2, sb
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #6
	subs r3, r3, r0
	movs r0, #0
	str r7, [sp, #0x30]
	mov r1, sl
	str r1, [sp, #0x3c]
	mov r2, r8
	adds r2, #0xc
	str r2, [sp, #0x2c]
	mov r5, r8
	adds r5, #0x3c
	str r5, [sp, #0x40]
	asrs r4, r4, #8
	str r4, [sp, #0x34]
	asrs r3, r3, #8
	str r3, [sp, #0x38]
	adds r7, r6, #0
	ldr r1, _0804BFD4 @ =0x000003FF
	mov sl, r1
	mov r4, sp
_0804BF50:
	movs r6, #0
	subs r2, r0, #1
	mov sb, r2
	adds r5, r0, #1
	str r5, [sp, #0x28]
	movs r1, #1
	subs r3, r1, r0
	lsls r5, r3, #5
	str r5, [sp, #0x24]
_0804BF62:
	ldrh r0, [r7]
	ldr r1, _0804BFD8 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r5, _0804BFCC @ =gSineTable
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xb
	ldr r5, [sp, #0x34]
	subs r0, r5, r0
	str r0, [sp, #0x14]
	ldrh r0, [r7]
	ldr r1, _0804BFD8 @ =0xFFFFFF00
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	lsls r0, r0, #1
	ldr r1, _0804BFCC @ =gSineTable
	adds r0, r0, r1
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r2, r0
	asrs r0, r0, #0xb
	ldr r1, [sp, #0x38]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	movs r0, #0x12
	strh r0, [r4, #0x1c]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ldrh r1, [r7]
	adds r0, r0, r1
	mov r5, sl
	ands r0, r5
	strh r0, [r4, #0xc]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #5
	adds r1, r0, #0
	adds r1, #0x80
	cmp r3, #0
	blt _0804BFDC
	ldr r5, [sp, #0x24]
	subs r0, r1, r5
	b _0804BFE2
	.align 2, 0
_0804BFCC: .4byte gSineTable
_0804BFD0: .4byte gUnknown_080D8888
_0804BFD4: .4byte 0x000003FF
_0804BFD8: .4byte 0xFFFFFF00
_0804BFDC:
	mov r5, sb
	lsls r0, r5, #5
	subs r0, r1, r0
_0804BFE2:
	movs r5, #0
	strh r0, [r4, #0xe]
	mov r1, r8
	ldr r0, [r1, #0x44]
	str r0, [sp]
	ldr r0, _0804C030 @ =0x000002C3
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	str r5, [sp, #4]
	mov r0, sp
	ldr r1, [sp, #0x2c]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	bl sub_8039D04
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x48]
	cmp r6, #2
	bls _0804BF62
	ldr r2, [sp, #0x28]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0804BF50
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	strb r5, [r0]
	ldr r5, [sp, #0x3c]
	ldr r0, [sp, #0x30]
	adds r1, r5, r0
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
	b _0804C06C
	.align 2, 0
_0804C030: .4byte 0x000002C3
_0804C034:
	mov r0, r8
	ldr r1, [sp, #0x20]
	bl sub_804B2EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C06C
	ldr r1, [sp, #0x20]
	lsls r2, r1, #2
	mov r0, r8
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, _0804C07C @ =0x0000FE80
	strh r1, [r0]
	mov r0, r8
	adds r0, #0x36
	adds r0, r0, r2
	movs r1, #0xfd
	lsls r1, r1, #8
	strh r1, [r0]
	mov r0, r8
	adds r0, #0x3c
	ldr r2, [sp, #0x20]
	adds r0, r0, r2
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x3c
	strh r0, [r4]
_0804C06C:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C07C: .4byte 0x0000FE80

	thumb_func_start sub_804C080
sub_804C080: @ 0x0804C080
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	ldr r0, _0804C20C @ =gUnknown_03005590
	mov sb, r0
	ldr r7, [r0]
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0804C116
	ldr r1, _0804C210 @ =gUnknown_030053B8
	mov r8, r1
	ldr r0, [r1]
	ldr r5, _0804C214 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _0804C218 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r6, _0804C21C @ =gCamera
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x12
	strh r0, [r1, #0x1c]
	mov r3, sp
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	ldr r0, _0804C220 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r2, sp
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r4
	mov r3, r8
	str r0, [r3]
	ldr r1, _0804C224 @ =0x000001FF
	ands r0, r1
	adds r1, #1
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _0804C228 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _0804C22C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0xc
	bl sub_8039D04
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r0, _0804C230 @ =gMPlayInfo_SE3
	bl m4aMPlayImmInit
_0804C116:
	ldr r0, _0804C230 @ =gMPlayInfo_SE3
	ldr r1, _0804C234 @ =0x0000FFFF
	mov r3, sl
	ldrh r2, [r3, #0x14]
	bl m4aMPlayVolumeControl
	mov r0, sl
	ldr r2, [r0, #0x14]
	cmp r2, #0
	beq _0804C13C
	mov r1, sb
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C13C
	subs r0, r2, #1
	mov r3, sl
	str r0, [r3, #0x14]
_0804C13C:
	ldr r0, _0804C20C @ =gUnknown_03005590
	ldr r0, [r0]
	adds r7, r0, #3
	movs r0, #7
	ands r7, r0
	cmp r7, #0
	bne _0804C1FC
	ldr r0, _0804C210 @ =gUnknown_030053B8
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0804C214 @ =0x00196225
	mov r8, r1
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	ldr r6, _0804C218 @ =0x3C6EF35F
	adds r0, r0, r6
	mov r1, sb
	str r0, [r1]
	lsls r0, r0, #0x18
	movs r4, #0xf0
	lsls r4, r4, #0x14
	ands r4, r0
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r4, r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r3, sb
	ldr r0, [r3]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r6
	ldr r5, _0804C21C @ =gCamera
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, r8
	muls r0, r2, r0
	adds r2, r0, #0
	adds r2, r2, r6
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x20
	strh r0, [r1, #0x1c]
	mov r3, sp
	mov r0, r8
	muls r0, r2, r0
	adds r0, r0, r6
	mov r1, sb
	str r0, [r1]
	ldr r1, _0804C220 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	ldr r2, _0804C238 @ =gUnknown_080D79D0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0804C23C @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0xc
	mov r0, sp
	bl sub_8039D04
_0804C1FC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C20C: .4byte gUnknown_03005590
_0804C210: .4byte gUnknown_030053B8
_0804C214: .4byte 0x00196225
_0804C218: .4byte 0x3C6EF35F
_0804C21C: .4byte gCamera
_0804C220: .4byte 0x000003FF
_0804C224: .4byte 0x000001FF
_0804C228: .4byte 0x06012980
_0804C22C: .4byte 0x0000026B
_0804C230: .4byte gMPlayInfo_SE3
_0804C234: .4byte 0x0000FFFF
_0804C238: .4byte gUnknown_080D79D0
_0804C23C: .4byte 0x06010000

	thumb_func_start sub_804C240
sub_804C240: @ 0x0804C240
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2
	adds r0, #0x42
	adds r3, r0, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _0804C260
	b _0804C37C
_0804C260:
	lsls r7, r2, #3
	adds r0, r4, #0
	adds r0, #0x1c
	adds r6, r0, r7
	ldr r1, [r4, #4]
	ldr r0, [r6]
	adds r1, r1, r0
	ldr r0, _0804C290 @ =gUnknown_080D8888
	mov sb, r0
	lsls r5, r2, #2
	adds r0, #2
	adds r0, r5, r0
	ldrh r0, [r0]
	mov r8, r0
	add r1, r8
	asrs r1, r1, #8
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	ble _0804C294
	movs r0, #1
	strb r0, [r3]
	b _0804C37C
	.align 2, 0
_0804C290: .4byte gUnknown_080D8888
_0804C294:
	mov r1, ip
	lsls r0, r1, #1
	adds r2, r4, #0
	adds r2, #0x28
	adds r2, r2, r0
	movs r3, #0xc8
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r1, [r2]
	adds r0, r0, r1
	adds r3, #0xdf
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	adds r3, r0, r5
	ldrh r0, [r3]
	adds r0, #0x20
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x18
	adds r2, r0, r7
	adds r0, #0x1c
	adds r0, r0, r5
	mov ip, r0
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [sp, #0x20]
	str r0, [r6]
	ldr r1, _0804C38C @ =gUnknown_03005590
	mov sl, r1
	ldr r6, [r1]
	movs r0, #3
	ands r6, r0
	cmp r6, #0
	bne _0804C37C
	ldr r1, [r4]
	ldr r0, [r2]
	mov r7, sb
	adds r2, r5, r7
	adds r1, r1, r0
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x20]
	adds r0, r0, r2
	add r0, r8
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	rsbs r0, r0, #0
	mov r3, ip
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	rsbs r1, r1, #0
	bl sub_8004418
	mov r1, sp
	strh r0, [r1, #0xc]
	mov r3, sp
	ldr r2, _0804C390 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0804C394 @ =0x00196225
	muls r0, r1, r0
	ldr r5, _0804C398 @ =0x3C6EF35F
	adds r0, r0, r5
	str r0, [r2]
	mov r2, sp
	movs r1, #0x1f
	ands r0, r1
	ldrh r2, [r2, #0xc]
	adds r0, r0, r2
	subs r0, #0x10
	ldr r1, _0804C39C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	ldr r2, _0804C3A0 @ =gSineTable
	mov r7, sl
	ldr r0, [r7]
	lsls r0, r0, #4
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r1, #0xff
	adds r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _0804C3A4 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _0804C3A8 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r1, #0xc
	bl sub_8039D04
_0804C37C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C38C: .4byte gUnknown_03005590
_0804C390: .4byte gUnknown_030053B8
_0804C394: .4byte 0x00196225
_0804C398: .4byte 0x3C6EF35F
_0804C39C: .4byte 0x000003FF
_0804C3A0: .4byte gSineTable
_0804C3A4: .4byte 0x06012980
_0804C3A8: .4byte 0x0000026B

	thumb_func_start sub_804C3AC
sub_804C3AC: @ 0x0804C3AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	ldr r5, _0804C42C @ =gUnknown_030053B8
	ldr r0, [r5]
	ldr r4, _0804C430 @ =0x00196225
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r2, _0804C434 @ =0x3C6EF35F
	adds r1, r1, r2
	movs r3, #7
	adds r0, r1, #0
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	str r0, [sp]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r5]
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	str r0, [sp, #4]
	ldr r3, _0804C438 @ =gBgScrollRegs
	ldr r1, _0804C43C @ =gCamera
	ldr r4, [r1]
	mov r0, sl
	ldr r2, [r0]
	ldr r5, [sp]
	adds r0, r2, r5
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r3]
	ldr r1, [r1, #4]
	mov r5, sl
	ldr r0, [r5, #4]
	ldr r5, [sp, #4]
	adds r0, r0, r5
	asrs r0, r0, #8
	subs r1, r1, r0
	strh r1, [r3, #2]
	movs r0, #0xbe
	lsls r0, r0, #8
	adds r2, r2, r0
	asrs r2, r2, #8
	subs r6, r2, r4
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r1, r0
	bls _0804C448
	ldr r2, _0804C440 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804C444 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _0804C456
	.align 2, 0
_0804C42C: .4byte gUnknown_030053B8
_0804C430: .4byte 0x00196225
_0804C434: .4byte 0x3C6EF35F
_0804C438: .4byte gBgScrollRegs
_0804C43C: .4byte gCamera
_0804C440: .4byte gDispCnt
_0804C444: .4byte 0x0000FEFF
_0804C448:
	ldr r0, _0804C5A0 @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0804C456:
	mov r5, sl
	adds r5, #0x54
	movs r4, #0x84
	add r4, sl
	mov r8, r4
	mov r1, sl
	ldr r0, [r1]
	ldr r2, [sp]
	adds r0, r0, r2
	movs r3, #0xbe
	lsls r3, r3, #8
	adds r6, r0, r3
	ldr r0, [r1, #4]
	ldr r4, [sp, #4]
	adds r0, r0, r4
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r7, r0, r1
	asrs r0, r6, #8
	ldr r2, _0804C5A4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, _0804C5A8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0804C5AC @ =0x00003060
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r2, sl
	ldrh r0, [r2, #0x10]
	mov r3, r8
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r3, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r3, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	mov r1, r8
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	movs r4, #0
	mov sb, r4
	subs r5, #0x3c
	str r5, [sp, #0xc]
	mov r0, sl
	adds r0, #0x1c
	str r0, [sp, #0x10]
	mov r1, sl
	adds r1, #0x28
	str r1, [sp, #8]
_0804C4DE:
	mov r2, sb
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, #0x90
	mov r3, sl
	adds r5, r3, r0
	movs r4, #0x30
	adds r4, r4, r5
	mov r8, r4
	ldr r1, [r3]
	ldr r0, [sp]
	adds r1, r1, r0
	lsls r2, r2, #3
	ldr r3, [sp, #0xc]
	adds r0, r3, r2
	ldr r0, [r0]
	mov ip, r0
	mov r4, sb
	lsls r3, r4, #2
	ldr r4, _0804C5B0 @ =gUnknown_080D8888
	adds r0, r3, r4
	add r1, ip
	ldrh r0, [r0]
	adds r6, r1, r0
	mov r1, sl
	ldr r0, [r1, #4]
	ldr r4, [sp, #4]
	adds r0, r0, r4
	ldr r1, [sp, #0x10]
	adds r2, r1, r2
	ldr r1, [r2]
	ldr r2, _0804C5B4 @ =gUnknown_080D888A
	adds r3, r3, r2
	adds r0, r0, r1
	ldrh r3, [r3]
	adds r7, r0, r3
	asrs r1, r6, #8
	ldr r2, _0804C5A4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, _0804C5A8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r3, sb
	lsls r0, r3, #1
	ldr r4, [sp, #8]
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r5, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	mov r1, r8
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	mov r1, r8
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #1
	bls _0804C4DE
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5A0: .4byte gDispCnt
_0804C5A4: .4byte gCamera
_0804C5A8: .4byte gUnknown_030054B8
_0804C5AC: .4byte 0x00003060
_0804C5B0: .4byte gUnknown_080D8888
_0804C5B4: .4byte gUnknown_080D888A

	thumb_func_start sub_804C5B8
sub_804C5B8: @ 0x0804C5B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _0804C640
	cmp r0, #0x1f
	bhi _0804C608
	ldr r5, _0804C5FC @ =gUnknown_030053B8
	ldr r0, [r5]
	ldr r4, _0804C600 @ =0x00196225
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r2, _0804C604 @ =0x3C6EF35F
	adds r1, r1, r2
	movs r3, #7
	adds r0, r1, #0
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	str r0, [sp, #8]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r5]
	ands r0, r3
	subs r0, #3
	lsls r0, r0, #8
	b _0804C644
	.align 2, 0
_0804C5FC: .4byte gUnknown_030053B8
_0804C600: .4byte 0x00196225
_0804C604: .4byte 0x3C6EF35F
_0804C608:
	ldr r5, _0804C634 @ =gUnknown_030053B8
	ldr r0, [r5]
	ldr r4, _0804C638 @ =0x00196225
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r2, _0804C63C @ =0x3C6EF35F
	adds r1, r1, r2
	movs r3, #0xf
	adds r0, r1, #0
	ands r0, r3
	subs r0, #7
	lsls r0, r0, #8
	str r0, [sp, #8]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r5]
	ands r0, r3
	subs r0, #7
	lsls r0, r0, #8
	b _0804C644
	.align 2, 0
_0804C634: .4byte gUnknown_030053B8
_0804C638: .4byte 0x00196225
_0804C63C: .4byte 0x3C6EF35F
_0804C640:
	movs r0, #0
	str r0, [sp, #8]
_0804C644:
	str r0, [sp, #0xc]
	ldr r5, _0804C694 @ =gBgScrollRegs
	ldr r3, _0804C698 @ =gCamera
	ldr r6, [r3]
	mov r1, r8
	ldr r2, [r1]
	ldr r7, [sp, #8]
	adds r0, r2, r7
	asrs r0, r0, #8
	subs r0, r6, r0
	strh r0, [r5]
	ldr r1, [r3, #4]
	mov r0, r8
	ldr r4, [r0, #4]
	ldr r7, [sp, #0xc]
	adds r0, r4, r7
	asrs r0, r0, #8
	subs r1, r1, r0
	strh r1, [r5, #2]
	movs r1, #0xbe
	lsls r1, r1, #8
	adds r0, r2, r1
	asrs r0, r0, #8
	subs r6, r0, r6
	str r6, [sp]
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0xa5
	lsls r0, r0, #1
	mov sb, r3
	adds r7, r2, #0
	cmp r1, r0
	bls _0804C6A4
	ldr r2, _0804C69C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804C6A0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _0804C6B2
	.align 2, 0
_0804C694: .4byte gBgScrollRegs
_0804C698: .4byte gCamera
_0804C69C: .4byte gDispCnt
_0804C6A0: .4byte 0x0000FEFF
_0804C6A4:
	ldr r0, _0804C6CC @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0804C6B2:
	mov r5, r8
	adds r5, #0x54
	mov r6, r8
	adds r6, #0x84
	mov r1, r8
	ldrb r0, [r1, #0xb]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x1f
	bhi _0804C6D0
	lsrs r3, r1, #0x1b
	b _0804C6DE
	.align 2, 0
_0804C6CC: .4byte gDispCnt
_0804C6D0:
	mov r2, r8
	ldrb r1, [r2, #0xb]
	movs r0, #0x40
	subs r0, r0, r1
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0804C6DE:
	ldr r1, [sp, #8]
	adds r0, r7, r1
	movs r2, #0xbe
	lsls r2, r2, #8
	adds r2, r0, r2
	str r2, [sp]
	ldr r7, [sp, #0xc]
	adds r0, r4, r7
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r1, r0, r1
	str r1, [sp, #4]
	asrs r0, r2, #8
	mov r7, sb
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [sp, #4]
	asrs r0, r1, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	ldr r2, _0804C81C @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0804C820 @ =0x00003060
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r2, r8
	ldrh r0, [r2, #0x10]
	strh r0, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	movs r7, #0
	movs r3, #0x42
	add r3, r8
	mov sl, r3
	ldr r0, _0804C824 @ =gUnknown_080D8888
	mov sb, r0
_0804C754:
	mov r1, sl
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C802
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x90
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x30
	ldr r1, [r2]
	ldr r3, [sp, #8]
	adds r1, r1, r3
	lsls r4, r7, #3
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r4
	ldr r0, [r0]
	mov ip, r0
	lsls r2, r7, #2
	mov r3, sb
	adds r0, r2, r3
	add r1, ip
	ldrh r0, [r0]
	adds r0, r1, r0
	str r0, [sp]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r3, [sp, #0xc]
	adds r1, r1, r3
	adds r0, #0x1c
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r3, _0804C828 @ =gUnknown_080D888A
	adds r2, r2, r3
	adds r1, r1, r0
	ldrh r2, [r2]
	adds r2, r1, r2
	str r2, [sp, #4]
	ldr r0, [sp]
	asrs r1, r0, #8
	ldr r2, _0804C82C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [sp, #4]
	asrs r0, r1, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, _0804C81C @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0x10]
	lsls r1, r7, #1
	mov r0, r8
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_0804C802:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #1
	bls _0804C754
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C81C: .4byte gUnknown_030054B8
_0804C820: .4byte 0x00003060
_0804C824: .4byte gUnknown_080D8888
_0804C828: .4byte gUnknown_080D888A
_0804C82C: .4byte gCamera

	thumb_func_start sub_804C830
sub_804C830: @ 0x0804C830
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	bne _0804C8CC
	ldr r0, [r5]
	movs r1, #0xbe
	lsls r1, r1, #8
	adds r0, r0, r1
	asrs r7, r0, #8
	str r7, [sp, #4]
	ldr r0, [r5, #4]
	movs r2, #0xa0
	lsls r2, r2, #6
	adds r0, r0, r2
	asrs r4, r0, #8
	str r4, [sp, #8]
	adds r6, r5, #0
	adds r6, #0x54
	ldr r0, _0804C87C @ =gPlayer
	mov r8, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _0804C880
	adds r0, r5, #0
	bl sub_804C8F4
	b _0804C8E4
	.align 2, 0
_0804C87C: .4byte gPlayer
_0804C880:
	mov r1, r8
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0804C8AA
	adds r0, r5, #0
	bl sub_804C8F4
	mov r2, r8
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0804C8CC
	rsbs r0, r0, #0
	strh r0, [r2, #0x10]
	b _0804C8CC
_0804C8AA:
	mov r2, r8
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _0804C8CC
	mov r1, r8
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _0804C8CC
	rsbs r0, r0, #0
	strh r0, [r1, #0x10]
_0804C8CC:
	ldr r0, _0804C8F0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804C8E4
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	ldr r2, [sp, #8]
	lsls r1, r2, #8
	bl sub_80122DC
_0804C8E4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C8F0: .4byte gSelectedCharacter

	thumb_func_start sub_804C8F4
sub_804C8F4: @ 0x0804C8F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x54
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r7, #8]
	subs r0, #1
	strb r0, [r7, #8]
	movs r1, #0xff
	ands r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C91C
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804C922
_0804C91C:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804C922:
	ldrb r2, [r7, #8]
	cmp r2, #3
	bne _0804C92E
	ldr r1, _0804C99C @ =gUnknown_030054A8
	movs r0, #0x13
	strb r0, [r1, #1]
_0804C92E:
	cmp r2, #0
	bne _0804C97C
	ldr r1, _0804C9A0 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0804C9A4 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0804C976
	ldr r0, _0804C9A8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C976
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _0804C9AC @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0804C974
	movs r0, #0xff
_0804C974:
	strb r0, [r1]
_0804C976:
	ldr r1, _0804C99C @ =gUnknown_030054A8
	movs r0, #0x30
	strb r0, [r1, #1]
_0804C97C:
	movs r0, #0x40
	strb r0, [r7, #0xb]
	ldr r0, _0804C9B0 @ =0x000002C1
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C99C: .4byte gUnknown_030054A8
_0804C9A0: .4byte gUnknown_03005450
_0804C9A4: .4byte 0x0000C350
_0804C9A8: .4byte gGameMode
_0804C9AC: .4byte gUnknown_03005448
_0804C9B0: .4byte 0x000002C1

	thumb_func_start sub_804C9B4
sub_804C9B4: @ 0x0804C9B4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, #9
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804C9EE
	subs r0, #1
	strb r0, [r1]
	movs r1, #0xff
	ands r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804C9DE
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804C9E4
_0804C9DE:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804C9E4:
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r4
	movs r1, #0x40
	strb r1, [r0]
_0804C9EE:
	movs r1, #0
	adds r0, r5, #0
	adds r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C9FE
	movs r1, #1
_0804C9FE:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804CA08
sub_804CA08: @ 0x0804CA08
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _0804CA4C
	subs r0, #1
	strb r0, [r2, #0xb]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804CA4C
	adds r3, r2, #0
	adds r3, #0x54
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _0804CA38
	movs r0, #0
	ldr r1, _0804CA34 @ =0x000002C1
	strh r1, [r3, #0xa]
	adds r1, r2, #0
	adds r1, #0x74
	b _0804CA42
	.align 2, 0
_0804CA34: .4byte 0x000002C1
_0804CA38:
	ldr r0, _0804CA6C @ =0x000002C1
	strh r0, [r3, #0xa]
	adds r1, r2, #0
	adds r1, #0x74
	movs r0, #3
_0804CA42:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804CA4C:
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CA5A
	subs r0, #1
	strb r0, [r1]
_0804CA5A:
	adds r1, r2, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CA68
	subs r0, #1
	strb r0, [r1]
_0804CA68:
	pop {r0}
	bx r0
	.align 2, 0
_0804CA6C: .4byte 0x000002C1

	thumb_func_start sub_804CA70
sub_804CA70: @ 0x0804CA70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	ldr r0, _0804CABC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	lsrs r6, r0, #1
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0804CACC
	movs r2, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	adds r7, r3, #0
	adds r7, #0x3f
	ldr r1, _0804CAC0 @ =gFlags
	mov r8, r1
	ldr r5, _0804CAC4 @ =gObjPalette
	ldr r4, _0804CAC8 @ =gUnknown_080D88B0
	lsls r3, r6, #5
_0804CA9E:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CA9E
	b _0804CAFA
	.align 2, 0
_0804CABC: .4byte gUnknown_03005590
_0804CAC0: .4byte gFlags
_0804CAC4: .4byte gObjPalette
_0804CAC8: .4byte gUnknown_080D88B0
_0804CACC:
	movs r2, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	adds r7, r3, #0
	adds r7, #0x3f
	ldr r1, _0804CB28 @ =gFlags
	mov r8, r1
	ldr r4, _0804CB2C @ =gObjPalette
	ldr r3, _0804CB30 @ =gUnknown_080D88B0
_0804CAE0:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CAE0
_0804CAFA:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CB34
	movs r2, #0
	ldr r5, _0804CB2C @ =gObjPalette
	ldr r4, _0804CB30 @ =gUnknown_080D88B0
	lsls r3, r6, #5
_0804CB0A:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB0A
	b _0804CB54
	.align 2, 0
_0804CB28: .4byte gFlags
_0804CB2C: .4byte gObjPalette
_0804CB30: .4byte gUnknown_080D88B0
_0804CB34:
	movs r2, #0
	ldr r4, _0804CB80 @ =gObjPalette
	ldr r3, _0804CB84 @ =gUnknown_080D88B0
_0804CB3A:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB3A
_0804CB54:
	ldrb r0, [r7]
	cmp r0, #0
	beq _0804CB88
	movs r2, #0
	ldr r5, _0804CB80 @ =gObjPalette
	ldr r4, _0804CB84 @ =gUnknown_080D88B0
	lsls r3, r6, #5
_0804CB62:
	adds r1, r2, #0
	adds r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB62
	b _0804CBA8
	.align 2, 0
_0804CB80: .4byte gObjPalette
_0804CB84: .4byte gUnknown_080D88B0
_0804CB88:
	movs r2, #0
	ldr r4, _0804CBC0 @ =gObjPalette
	ldr r3, _0804CBC4 @ =gUnknown_080D88B0
_0804CB8E:
	adds r1, r2, #0
	adds r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0804CB8E
_0804CBA8:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CBC0: .4byte gObjPalette
_0804CBC4: .4byte gUnknown_080D88B0

	thumb_func_start sub_804CBC8
sub_804CBC8: @ 0x0804CBC8
	push {r4, r5, r6, r7, lr}
	ldr r7, _0804CC24 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, r5, #0
	bl sub_804C5B8
	ldr r6, _0804CC28 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r1, #0x14
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0804CC1C
	ldr r0, [r5, #0x14]
	subs r4, r0, #1
	str r4, [r5, #0x14]
	cmp r4, #0
	bne _0804CC1C
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r5, #0x14]
	ldr r1, [r7]
	ldr r0, _0804CC2C @ =sub_804A9D8
	str r0, [r1, #8]
	movs r0, #0x82
	lsls r0, r0, #1
	bl m4aSongNumStart
	adds r0, r6, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_0804CC1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC24: .4byte gCurTask
_0804CC28: .4byte gPlayer
_0804CC2C: .4byte sub_804A9D8

	thumb_func_start sub_804CC30
sub_804CC30: @ 0x0804CC30
	push {r4, lr}
	ldr r4, _0804CC78 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r1, _0804CC7C @ =IWRAM_START + 0x4C
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #6
	strh r1, [r2]
	ldr r1, _0804CC80 @ =IWRAM_START + 0x48
	adds r0, r0, r1
	bl sub_802D4CC
	ldr r0, _0804CC84 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0804CC88 @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _0804CC8C @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	movs r0, #0x90
	bl m4aSongNumStop
	ldr r0, _0804CC90 @ =gMPlayInfo_SE3
	ldr r1, _0804CC94 @ =0x0000FFFF
	movs r2, #0xff
	bl m4aMPlayVolumeControl
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC78: .4byte gCurTask
_0804CC7C: .4byte IWRAM_START + 0x4C
_0804CC80: .4byte IWRAM_START + 0x48
_0804CC84: .4byte gUnknown_03005490
_0804CC88: .4byte gCourseTime
_0804CC8C: .4byte gUnknown_030054F4
_0804CC90: .4byte gMPlayInfo_SE3
_0804CC94: .4byte 0x0000FFFF

	thumb_func_start sub_804CC98
sub_804CC98: @ 0x0804CC98
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _0804CCC4
	ldr r1, _0804CCBC @ =gSineTable
	lsls r0, r0, #4
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #7
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0804CCC0 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	b _0804CCC8
	.align 2, 0
_0804CCBC: .4byte gSineTable
_0804CCC0: .4byte 0x000003FF
_0804CCC4:
	movs r0, #0x80
	lsls r0, r0, #2
_0804CCC8:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804CCD0
sub_804CCD0: @ 0x0804CCD0
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r0]
	movs r5, #0xbe
	lsls r5, r5, #8
	adds r2, r1, r5
	ldr r0, [r0, #4]
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r3, r0, r1
	ldr r5, _0804CD08 @ =gPlayer
	ldr r1, [r5, #0xc]
	asrs r0, r1, #8
	cmp r0, r2
	bge _0804CD00
	subs r0, r3, r4
	cmp r1, r0
	blt _0804CD00
	adds r0, r4, r3
	cmp r1, r0
	bgt _0804CD00
	adds r0, r5, #0
	bl sub_800CBA4
_0804CD00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD08: .4byte gPlayer

	thumb_func_start sub_804CD0C
sub_804CD0C: @ 0x0804CD0C
	push {r4, r5, lr}
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r0, [r5, #0x44]
	bl VramFree
	ldr r1, _0804CD44 @ =IWRAM_START + 0x94
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _0804CD48 @ =IWRAM_START + 0xD0
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r0, [r5, #0x58]
	bl VramFree
	ldr r1, _0804CD4C @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD44: .4byte IWRAM_START + 0x94
_0804CD48: .4byte IWRAM_START + 0xD0
_0804CD4C: .4byte gUnknown_03005B4C

	thumb_func_start sub_804CD50
sub_804CD50: @ 0x0804CD50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0804CE7C @ =sub_804D6AC
	movs r1, #0x94
	lsls r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0804CE80 @ =sub_8050A7C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r4, _0804CE84 @ =gUnknown_03005B4C
	str r0, [r4]
	bl sub_804CEC4
	ldr r0, [r4]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _0804CE88 @ =IWRAM_START + 0x1C
	adds r3, r2, r0
	ldr r7, _0804CE8C @ =IWRAM_START + 0x48
	adds r4, r2, r7
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r1, #0x12]
	ldr r0, [r4, #0x30]
	ldr r1, _0804CE90 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r1, _0804CE94 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x30]
	str r0, [r4]
	ldr r0, [r1, #0x34]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #0x38]
	strh r0, [r4, #0x2e]
	movs r0, #0xa5
	lsls r0, r0, #9
	str r0, [r3, #0x24]
	movs r0, #0xb4
	lsls r0, r0, #7
	str r0, [r3, #0x28]
	ldr r0, _0804CE98 @ =gUnknown_080D8DCC
	ldrh r0, [r0, #0x38]
	strh r0, [r3, #0x14]
	movs r3, #0
	ldr r0, _0804CE9C @ =IWRAM_START + 0x20
	adds r6, r2, r0
	ldr r1, _0804CEA0 @ =gUnknown_080D8C7C
	mov ip, r1
	subs r7, #0x20
	adds r5, r2, r7
	ldr r0, _0804CEA4 @ =gUnknown_080D8C94
	mov r8, r0
_0804CDCA:
	lsls r1, r3, #1
	adds r2, r6, r1
	mov r7, ip
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r5, r1
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0804CDCA
	ldr r0, [r4, #0x30]
	ldr r1, _0804CE90 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r0, _0804CE94 @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x3c]
	str r1, [r4]
	ldr r1, [r0, #0x40]
	str r1, [r4, #0x34]
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	movs r3, #0
	adds r0, r4, #4
	mov ip, r0
	adds r1, r4, #0
	adds r1, #0xc
	str r1, [sp, #4]
	adds r6, r4, #0
	adds r6, #0x14
	ldr r7, _0804CEA8 @ =gUnknown_080D8AC4
	mov sl, r7
	adds r5, r4, #0
	adds r5, #0x1c
	ldr r0, _0804CEAC @ =gUnknown_080D8ADC
	mov sb, r0
	adds r4, #0x24
	ldr r1, _0804CEB0 @ =gUnknown_080D8AF4
	mov r8, r1
_0804CE24:
	lsls r1, r3, #1
	mov r7, ip
	adds r2, r7, r1
	ldr r7, _0804CEB4 @ =gUnknown_080D8A94
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [sp, #4]
	adds r2, r0, r1
	ldr r7, _0804CEB8 @ =gUnknown_080D8AAC
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r6, r1
	mov r7, sl
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r5, r1
	mov r7, sb
	adds r0, r1, r7
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r4, r1
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0804CE24
	ldr r1, _0804CEBC @ =0x00001341
	adds r0, r1, #0
	ldr r7, _0804CEC0 @ =gDispCnt
	strh r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE7C: .4byte sub_804D6AC
_0804CE80: .4byte sub_8050A7C
_0804CE84: .4byte gUnknown_03005B4C
_0804CE88: .4byte IWRAM_START + 0x1C
_0804CE8C: .4byte IWRAM_START + 0x48
_0804CE90: .4byte 0x00000FFF
_0804CE94: .4byte gUnknown_080D8D6C
_0804CE98: .4byte gUnknown_080D8DCC
_0804CE9C: .4byte IWRAM_START + 0x20
_0804CEA0: .4byte gUnknown_080D8C7C
_0804CEA4: .4byte gUnknown_080D8C94
_0804CEA8: .4byte gUnknown_080D8AC4
_0804CEAC: .4byte gUnknown_080D8ADC
_0804CEB0: .4byte gUnknown_080D8AF4
_0804CEB4: .4byte gUnknown_080D8A94
_0804CEB8: .4byte gUnknown_080D8AAC
_0804CEBC: .4byte 0x00001341
_0804CEC0: .4byte gDispCnt

	thumb_func_start sub_804CEC4
sub_804CEC4: @ 0x0804CEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc8
	ldr r2, _0804D2A8 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _0804D2AC @ =gUnknown_03005B4C
	ldr r0, [r4]
	cmp r0, #0
	bne _0804CEF8
	ldr r0, _0804D2B0 @ =sub_804D7A0
	movs r1, #0x94
	lsls r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0804D2B4 @ =sub_8050A7C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
_0804CEF8:
	ldr r0, [r4]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	str r0, [sp, #4]
	ldr r0, _0804D2B8 @ =IWRAM_START + 0x1C
	adds r2, r4, r0
	ldr r1, _0804D2BC @ =IWRAM_START + 0x48
	adds r6, r4, r1
	ldr r5, _0804D2C0 @ =IWRAM_START + 0x98
	adds r5, r4, r5
	str r5, [sp, #8]
	ldr r7, _0804D2C4 @ =IWRAM_START + 0x558
	adds r7, r7, r4
	mov r8, r7
	ldr r0, _0804D2C8 @ =IWRAM_START + 0x594
	adds r7, r4, r0
	ldr r1, _0804D2CC @ =IWRAM_START + 0x654
	adds r1, r4, r1
	str r1, [sp, #0xc]
	movs r3, #0
	movs r0, #0xc
	ldr r5, [sp, #4]
	strb r0, [r5, #0xc]
	strb r3, [r5, #0xd]
	movs r1, #0
	movs r0, #1
	mov sb, r0
	mov r0, sb
	strh r0, [r5, #0x10]
	movs r0, #0x50
	strh r0, [r5, #0x12]
	strb r1, [r5, #0xe]
	strb r1, [r5, #0xf]
	str r3, [r5, #0x14]
	str r3, [r5, #0x18]
	strh r3, [r5]
	strh r3, [r5, #4]
	mov r0, sb
	strh r0, [r5, #2]
	movs r0, #0x14
	strh r0, [r5, #6]
	movs r0, #0xbf
	strh r0, [r5, #8]
	strh r3, [r5, #0xa]
	ldr r0, _0804D2D0 @ =sub_8050DC8
	mov r5, r8
	str r0, [r5]
	movs r0, #0xc8
	strh r0, [r5, #6]
	strb r1, [r5, #4]
	ldr r0, [r2, #0x18]
	ldr r1, _0804D2D4 @ =0x00000FFF
	ands r0, r1
	str r0, [r2, #0x18]
	ldr r1, _0804D2D8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #0x1c]
	ldrh r1, [r1, #8]
	strh r1, [r2, #0x16]
	ldr r0, _0804D2DC @ =0x0004F300
	str r0, [r2, #0x24]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [r2, #0x28]
	strh r3, [r2, #0x20]
	strh r3, [r2, #0x22]
	strh r1, [r2, #0x14]
	str r3, [r2, #0x18]
	movs r0, #0
	mov ip, r0
	ldr r3, _0804D2E0 @ =gUnknown_080D8D6C
	ldr r2, _0804D2E4 @ =gUnknown_080D8C64
	ldr r1, _0804D2E8 @ =gUnknown_080D8C4C
	ldr r5, _0804D2EC @ =IWRAM_START + 0x20
	adds r4, r4, r5
_0804CF96:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r2]
	strh r0, [r4, #8]
	adds r2, #2
	adds r1, #2
	adds r4, #2
	movs r0, #1
	add ip, r0
	mov r5, ip
	cmp r5, #3
	bls _0804CF96
	ldr r0, [r6, #0x30]
	ldr r1, _0804D2D4 @ =0x00000FFF
	ands r0, r1
	str r0, [r6, #0x30]
	ldr r0, [r3, #0xc]
	str r0, [r6]
	ldr r0, [r3, #0x10]
	str r0, [r6, #0x34]
	ldrh r0, [r3, #0x14]
	movs r1, #0
	strh r0, [r6, #0x2e]
	adds r2, r6, #0
	adds r2, #0x4c
	movs r0, #1
	strb r0, [r2]
	strh r1, [r6, #0x38]
	str r1, [r6, #0x44]
	str r1, [r6, #0x48]
	ldrh r0, [r3, #8]
	strh r0, [r6, #0x2c]
	str r1, [r6, #0x30]
	mov ip, r1
	adds r0, r6, #4
	mov sl, r0
	movs r1, #0xc
	adds r1, r1, r6
	mov sb, r1
	adds r5, r6, #0
	adds r5, #0x14
	adds r3, r6, #0
	adds r3, #0x1c
	adds r4, r6, #0
	adds r4, #0x24
	adds r2, r7, #4
	str r2, [sp, #0x1c]
	adds r6, r7, #0
	adds r6, #0xe
	str r6, [sp, #0x34]
	adds r0, r7, #0
	adds r0, #0x18
	str r0, [sp, #0x3c]
	adds r1, r7, #0
	adds r1, #0x1a
	str r1, [sp, #0x40]
	adds r2, #0x3c
	str r2, [sp, #0x60]
	adds r6, #0x36
	str r6, [sp, #0xc0]
	ldr r0, [sp, #0xc]
	adds r0, #0xe
	str r0, [sp, #0x38]
	ldr r1, [sp, #0xc]
	adds r1, #0x1e
	str r1, [sp, #0x44]
	ldr r2, [sp, #0xc]
	adds r2, #0x2e
	str r2, [sp, #0x54]
	ldr r6, [sp, #0xc]
	adds r6, #0x30
	str r6, [sp, #0x5c]
	ldr r0, [sp, #0xc]
	adds r0, #0x70
	str r0, [sp, #0x74]
	ldr r1, [sp, #0xc]
	adds r1, #0x74
	str r1, [sp, #0x78]
	ldr r6, _0804D2F0 @ =0x000007D4
	ldr r2, [sp, #4]
	adds r6, r2, r6
	str r6, [sp, #0x7c]
	ldr r0, _0804D2F4 @ =0x000007D5
	adds r0, r2, r0
	str r0, [sp, #0x80]
	ldr r1, _0804D2F8 @ =0x000007D6
	adds r1, r2, r1
	str r1, [sp, #0x88]
	ldr r6, _0804D2FC @ =0x000007D9
	adds r6, r2, r6
	str r6, [sp, #0x8c]
	mov r0, r8
	adds r0, #0xc
	str r0, [sp, #0x2c]
	mov r1, r8
	adds r1, #0x2c
	str r1, [sp, #0x48]
	mov r2, r8
	adds r2, #0x2d
	str r2, [sp, #0x4c]
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x50]
	adds r0, #0x25
	str r0, [sp, #0x58]
	adds r1, r7, #0
	adds r1, #0x90
	str r1, [sp, #0x84]
	adds r2, r7, #0
	adds r2, #0xb0
	str r2, [sp, #0x90]
	adds r6, r7, #0
	adds r6, #0xb1
	str r6, [sp, #0x94]
	adds r0, r7, #0
	adds r0, #0xb2
	str r0, [sp, #0x98]
	adds r1, #0x25
	str r1, [sp, #0x9c]
	ldr r2, [sp, #0xc]
	adds r2, #0xf0
	str r2, [sp, #0xa0]
	movs r0, #0x88
	lsls r0, r0, #1
	ldr r6, [sp, #0xc]
	adds r0, r6, r0
	str r0, [sp, #0x20]
	ldr r1, _0804D300 @ =0x00000111
	adds r1, r6, r1
	str r1, [sp, #0x24]
	movs r2, #0x89
	lsls r2, r2, #1
	adds r2, r6, r2
	str r2, [sp, #0x28]
	ldr r0, _0804D304 @ =0x00000115
	adds r0, r6, r0
	str r0, [sp, #0x30]
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r1, r6, r1
	str r1, [sp, #0x64]
	ldr r2, _0804D308 @ =0x00000149
	adds r2, r6, r2
	str r2, [sp, #0x68]
	movs r0, #0xa5
	lsls r0, r0, #1
	adds r0, r6, r0
	str r0, [sp, #0x6c]
	ldr r1, _0804D30C @ =0x0000014D
	adds r1, r6, r1
	str r1, [sp, #0x70]
_0804D0C4:
	mov r2, ip
	lsls r1, r2, #1
	mov r6, sl
	adds r2, r6, r1
	ldr r6, _0804D310 @ =gUnknown_080D8A1C
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	mov r0, sb
	adds r2, r0, r1
	ldr r6, _0804D314 @ =gUnknown_080D8A34
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r5, r1
	ldr r6, _0804D318 @ =gUnknown_080D8A4C
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r3, r1
	ldr r6, _0804D31C @ =gUnknown_080D8A64
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, r4, r1
	ldr r0, _0804D320 @ =gUnknown_080D8A7C
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #3
	bls _0804D0C4
	ldr r5, _0804D324 @ =sub_804DFB0
	str r5, [r7]
	movs r6, #0
	mov sb, r6
	ldr r5, [sp, #0x1c]
	movs r2, #0
	ldr r4, [sp, #0x34]
	ldr r3, [sp, #0x3c]
_0804D118:
	mov r7, sb
	adds r0, r5, r7
	strb r2, [r0]
	adds r0, r4, r7
	strb r2, [r0]
	lsls r0, r7, #2
	strh r2, [r3]
	ldr r1, [sp, #0x40]
	adds r0, r1, r0
	strh r2, [r0]
	lsls r1, r7, #3
	ldr r6, [sp, #0x60]
	adds r0, r6, r1
	str r2, [r0]
	ldr r7, [sp, #0xc0]
	adds r1, r7, r1
	str r2, [r1]
	adds r3, #4
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #9
	bls _0804D118
	ldr r2, _0804D328 @ =sub_804FF9C
	ldr r5, [sp, #0xc]
	str r2, [r5]
	ldr r6, _0804D32C @ =sub_804F768
	str r6, [r5, #4]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #8]
	adds r0, #0xd4
	strh r0, [r5, #0xa]
	movs r7, #0
	mov sb, r7
	ldr r5, [sp, #0x38]
	movs r2, #0
	ldr r4, [sp, #0x44]
	ldr r3, [sp, #0x54]
_0804D166:
	mov r1, sb
	adds r0, r5, r1
	strb r2, [r0]
	adds r0, r4, r1
	strb r2, [r0]
	lsls r0, r1, #2
	strh r2, [r3]
	ldr r6, [sp, #0x5c]
	adds r0, r6, r0
	strh r2, [r0]
	lsls r1, r1, #3
	ldr r7, [sp, #0x74]
	adds r0, r7, r1
	str r2, [r0]
	ldr r0, [sp, #0x78]
	adds r1, r0, r1
	str r2, [r1]
	adds r3, #4
	movs r1, #1
	add sb, r1
	mov r6, sb
	cmp r6, #0xf
	bls _0804D166
	ldr r7, _0804D330 @ =sub_804E66C
	ldr r0, [sp, #8]
	str r7, [r0]
	movs r0, #0
	movs r1, #0x96
	lsls r1, r1, #1
	ldr r2, [sp, #8]
	strh r1, [r2, #4]
	adds r1, #0xd4
	strh r1, [r2, #6]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	movs r0, #0x20
	bl VramMalloc
	str r0, [sp, #0x10]
	movs r5, #0
	mov sb, r5
	movs r4, #0
	ldr r6, [sp, #8]
	adds r6, #0x8c
	str r6, [sp, #0xa4]
	ldr r7, [sp, #8]
	adds r7, #0x88
	str r7, [sp, #0xa8]
	ldr r0, [sp, #8]
	adds r0, #0x74
	str r0, [sp, #0xac]
	ldr r1, [sp, #8]
	adds r1, #0x72
	str r1, [sp, #0xb0]
	ldr r2, [sp, #8]
	adds r2, #0x6c
	str r2, [sp, #0xb4]
	ldr r5, [sp, #8]
	adds r5, #0x68
	str r5, [sp, #0xb8]
	ldr r6, [sp, #8]
	adds r6, #0x51
	mov sl, r6
	ldr r7, [sp, #8]
	adds r7, #0x14
	mov r8, r7
	ldr r0, [sp, #8]
	adds r0, #0x10
	str r0, [sp, #0xbc]
_0804D1F0:
	ldr r7, [sp, #0xbc]
	adds r7, #0x20
	mov r1, r8
	strb r4, [r1]
	strh r4, [r1, #6]
	strh r4, [r1, #0xa]
	strh r4, [r1, #0xc]
	str r4, [r1, #0x10]
	str r4, [r1, #0x14]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0804D334 @ =gUnknown_080D8918
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xff
	mov r2, sl
	strb r0, [r2]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	strb r0, [r2, #1]
	movs r0, #6
	strb r0, [r2, #4]
	subs r0, #7
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r0, _0804D338 @ =sub_804DD9C
	mov r5, r8
	str r0, [r5, #0x54]
	movs r6, #0
	mov ip, r6
	ldr r1, [sp, #0xb8]
	adds r1, #0x50
	ldr r7, [sp, #0xb8]
	adds r7, #0x48
	str r7, [sp, #0xc4]
	ldr r6, [sp, #0xa4]
	ldr r5, [sp, #0xa8]
	ldr r3, [sp, #0xac]
	ldr r2, [sp, #0xb0]
_0804D25C:
	ldr r0, [sp, #0xb4]
	add r0, ip
	strb r4, [r0]
	strh r4, [r2]
	strh r4, [r3]
	str r4, [r5]
	str r4, [r6]
	strh r4, [r1, #0xe]
	strh r4, [r1, #0x10]
	ldr r0, [sp, #0x10]
	ldr r7, [sp, #0xc4]
	str r0, [r7, #4]
	ldr r0, _0804D33C @ =0x000002CA
	strh r0, [r1, #2]
	strb r4, [r1, #0x18]
	movs r0, #1
	rsbs r0, r0, #0
	mov r7, sp
	strb r0, [r7, #0x14]
	movs r0, #0xff
	strb r0, [r1, #0x19]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r4, [r1]
	strh r4, [r1, #0xc]
	strh r4, [r1, #0x14]
	movs r7, #0x10
	strb r7, [r1, #0x1a]
	movs r0, #6
	strb r0, [r1, #0x1d]
	subs r0, #7
	str r0, [r1, #0x20]
	movs r7, #0x80
	lsls r7, r7, #6
	str r7, [r1, #8]
	b _0804D340
	.align 2, 0
_0804D2A8: .4byte gUnknown_03005424
_0804D2AC: .4byte gUnknown_03005B4C
_0804D2B0: .4byte sub_804D7A0
_0804D2B4: .4byte sub_8050A7C
_0804D2B8: .4byte IWRAM_START + 0x1C
_0804D2BC: .4byte IWRAM_START + 0x48
_0804D2C0: .4byte IWRAM_START + 0x98
_0804D2C4: .4byte IWRAM_START + 0x558
_0804D2C8: .4byte IWRAM_START + 0x594
_0804D2CC: .4byte IWRAM_START + 0x654
_0804D2D0: .4byte sub_8050DC8
_0804D2D4: .4byte 0x00000FFF
_0804D2D8: .4byte gUnknown_080D8DCC
_0804D2DC: .4byte 0x0004F300
_0804D2E0: .4byte gUnknown_080D8D6C
_0804D2E4: .4byte gUnknown_080D8C64
_0804D2E8: .4byte gUnknown_080D8C4C
_0804D2EC: .4byte IWRAM_START + 0x20
_0804D2F0: .4byte 0x000007D4
_0804D2F4: .4byte 0x000007D5
_0804D2F8: .4byte 0x000007D6
_0804D2FC: .4byte 0x000007D9
_0804D300: .4byte 0x00000111
_0804D304: .4byte 0x00000115
_0804D308: .4byte 0x00000149
_0804D30C: .4byte 0x0000014D
_0804D310: .4byte gUnknown_080D8A1C
_0804D314: .4byte gUnknown_080D8A34
_0804D318: .4byte gUnknown_080D8A4C
_0804D31C: .4byte gUnknown_080D8A64
_0804D320: .4byte gUnknown_080D8A7C
_0804D324: .4byte sub_804DFB0
_0804D328: .4byte sub_804FF9C
_0804D32C: .4byte sub_804F768
_0804D330: .4byte sub_804E66C
_0804D334: .4byte gUnknown_080D8918
_0804D338: .4byte sub_804DD9C
_0804D33C: .4byte 0x000002CA
_0804D340:
	adds r1, #0x30
	ldr r0, [sp, #0xc4]
	adds r0, #0x30
	str r0, [sp, #0xc4]
	adds r6, #8
	adds r5, #8
	adds r3, #4
	adds r2, #4
	movs r7, #1
	add ip, r7
	mov r0, ip
	cmp r0, #4
	bhi _0804D35C
	b _0804D25C
_0804D35C:
	ldr r1, [sp, #0xa4]
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [sp, #0xa4]
	ldr r5, [sp, #0xa8]
	adds r5, r5, r2
	str r5, [sp, #0xa8]
	ldr r6, [sp, #0xac]
	adds r6, r6, r2
	str r6, [sp, #0xac]
	ldr r7, [sp, #0xb0]
	adds r7, r7, r2
	str r7, [sp, #0xb0]
	ldr r0, [sp, #0xb4]
	adds r0, r0, r2
	str r0, [sp, #0xb4]
	ldr r1, [sp, #0xb8]
	adds r1, r1, r2
	str r1, [sp, #0xb8]
	add sl, r2
	add r8, r2
	ldr r5, [sp, #0xbc]
	adds r5, r5, r2
	str r5, [sp, #0xbc]
	movs r6, #1
	add sb, r6
	mov r7, sb
	cmp r7, #2
	bhi _0804D39A
	b _0804D1F0
_0804D39A:
	ldr r0, [sp, #4]
	ldr r1, _0804D57C @ =0x000007B4
	adds r7, r0, r1
	movs r6, #0
	movs r5, #0
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	ldr r4, _0804D580 @ =gUnknown_080D88F0
	ldr r0, [r4, #0x20]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #0x24]
	strh r0, [r7, #0xa]
	adds r4, #0x26
	ldrb r0, [r4]
	ldr r2, [sp, #0x7c]
	strb r0, [r2]
	ldr r1, [sp, #0x80]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x14]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	movs r0, #0x10
	ldr r5, [sp, #0x88]
	strb r0, [r5]
	ldr r1, [sp, #0x8c]
	strb r6, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r5, #0x80
	lsls r5, r5, #6
	str r5, [r7, #0x10]
	movs r6, #0
	mov sb, r6
	movs r7, #0
	mov r8, r7
	ldr r0, [sp, #4]
	movs r1, #0xff
	lsls r1, r1, #3
	adds r5, r0, r1
	movs r2, #0xfe
	lsls r2, r2, #3
	adds r7, r0, r2
_0804D402:
	strh r6, [r5, #0xe]
	strh r6, [r5, #0x10]
	ldr r0, _0804D580 @ =gUnknown_080D88F0
	mov r1, sb
	lsls r4, r1, #3
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r5, #2]
	ldrb r0, [r4, #6]
	strb r0, [r5, #0x18]
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, sp
	strb r0, [r2, #0x18]
	movs r0, #0xff
	strb r0, [r5, #0x19]
	mov r0, sb
	adds r0, #0x14
	lsls r0, r0, #6
	strh r0, [r5, #0x12]
	strh r6, [r5]
	strh r6, [r5, #0xc]
	strh r6, [r5, #0x14]
	movs r1, #0x10
	strb r1, [r5, #0x1a]
	mov r2, r8
	strb r2, [r5, #0x1d]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r5, #0x20]
	movs r0, #0x84
	lsls r0, r0, #6
	str r0, [r5, #8]
	adds r5, #0x44
	adds r7, #0x44
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #3
	bls _0804D402
	movs r4, #0
	ldr r7, [sp, #0x2c]
	movs r5, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D584 @ =0x000002CE
	strh r0, [r7, #0xa]
	ldr r6, [sp, #0x48]
	strb r5, [r6]
	ldr r1, [sp, #0x4c]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	ldr r6, [sp, #0x50]
	strb r0, [r6]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r7, [sp, #0x84]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D588 @ =0x00000467
	strh r0, [r7, #0xa]
	movs r0, #8
	ldr r6, [sp, #0x90]
	strb r0, [r6]
	ldr r1, [sp, #0x94]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	ldr r6, [sp, #0x98]
	strb r0, [r6]
	ldr r1, [sp, #0x9c]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #5
	str r6, [r7, #0x10]
	ldr r7, [sp, #0xa0]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D58C @ =0x000002CD
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x20]
	strb r5, [r0]
	ldr r1, [sp, #0x24]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #1
	mov r8, r0
	mov r1, r8
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x10
	ldr r2, [sp, #0x28]
	strb r0, [r2]
	ldr r1, [sp, #0x30]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	str r6, [r7, #0x10]
	ldr r0, [sp, #0xc]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r7, r0, r1
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0804D590 @ =0x000002CF
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x64]
	strb r5, [r2]
	ldr r1, [sp, #0x68]
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x18]
	orrs r0, r2
	strb r0, [r1]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r2, #0x10
	ldr r1, [sp, #0x6c]
	strb r2, [r1]
	ldr r0, [sp, #0x70]
	strb r5, [r0]
	mov r1, sl
	str r1, [r7, #0x28]
	str r6, [r7, #0x10]
	add sp, #0xc8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D57C: .4byte 0x000007B4
_0804D580: .4byte gUnknown_080D88F0
_0804D584: .4byte 0x000002CE
_0804D588: .4byte 0x00000467
_0804D58C: .4byte 0x000002CD
_0804D590: .4byte 0x000002CF

	thumb_func_start sub_804D594
sub_804D594: @ 0x0804D594
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0804D694 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _0804D684
	ldrh r2, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r2, r3
	ldr r0, _0804D698 @ =IWRAM_START + 0x1C
	adds r1, r2, r0
	adds r0, #0x7c
	adds r0, r0, r2
	mov sb, r0
	ldr r0, [r1, #0x24]
	adds r0, r0, r7
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x28]
	adds r0, r0, r6
	str r0, [r1, #0x28]
	ldr r0, [r3, #0x14]
	adds r0, r0, r7
	str r0, [r3, #0x14]
	ldr r0, [r3, #0x18]
	adds r0, r0, r6
	str r0, [r3, #0x18]
	movs r4, #0
	ldr r0, _0804D69C @ =IWRAM_START + 0x5D4
	adds r0, r2, r0
	str r0, [sp, #4]
	ldr r0, _0804D6A0 @ =IWRAM_START + 0x5D8
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _0804D6A4 @ =IWRAM_START + 0x6C4
	adds r0, r2, r0
	str r0, [sp, #8]
	ldr r0, _0804D6A8 @ =IWRAM_START + 0x6C8
	adds r0, r2, r0
	str r0, [sp]
	asrs r0, r7, #8
	mov r8, r0
	asrs r0, r6, #8
	mov ip, r0
_0804D5F8:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, #0x10
	add r1, sb
	ldr r0, [r1, #0x14]
	adds r0, r0, r7
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x18]
	adds r0, r0, r6
	str r0, [r1, #0x18]
	movs r5, #0
	lsls r2, r4, #3
	adds r0, r1, #0
	adds r0, #0x78
	adds r3, r0, r2
	adds r1, #0x7c
	adds r1, r1, r2
_0804D620:
	ldr r0, [r3]
	add r0, r8
	str r0, [r3]
	ldr r0, [r1]
	add r0, ip
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _0804D620
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804D5F8
	movs r4, #0
	ldr r5, [sp, #4]
	mov r3, sl
_0804D646:
	lsls r1, r4, #3
	adds r2, r5, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0804D646
	movs r4, #0
	ldr r5, [sp, #8]
	ldr r3, [sp]
_0804D668:
	lsls r1, r4, #3
	adds r2, r5, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0804D668
_0804D684:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D694: .4byte gUnknown_03005B4C
_0804D698: .4byte IWRAM_START + 0x1C
_0804D69C: .4byte IWRAM_START + 0x5D4
_0804D6A0: .4byte IWRAM_START + 0x5D8
_0804D6A4: .4byte IWRAM_START + 0x6C4
_0804D6A8: .4byte IWRAM_START + 0x6C8

	thumb_func_start sub_804D6AC
sub_804D6AC: @ 0x0804D6AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0804D6F0 @ =gCurTask
	ldr r7, [r0]
	ldrh r0, [r7, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x1c
	adds r5, r0, r1
	adds r1, #0x2c
	adds r6, r0, r1
	ldr r1, _0804D6F4 @ =IWRAM_START + 0x558
	adds r3, r0, r1
	ldr r2, _0804D6F8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804D6FC @ =0x00009FFF
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x12]
	subs r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804D704
	ldr r0, _0804D700 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	adds r0, r7, #0
	bl TaskDestroy
	b _0804D770
	.align 2, 0
_0804D6F0: .4byte gCurTask
_0804D6F4: .4byte IWRAM_START + 0x558
_0804D6F8: .4byte gDispCnt
_0804D6FC: .4byte 0x00009FFF
_0804D700: .4byte gFlags
_0804D704:
	ldr r1, [r3]
	adds r0, r3, #0
	bl _call_via_r1
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	ldr r1, [r6]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_80505B8
	ldr r1, _0804D778 @ =gWinRegs
	ldr r0, _0804D77C @ =0x00002735
	strh r0, [r1, #0xa]
	ldr r2, _0804D780 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0804D784 @ =gUnknown_03002878
	ldr r0, _0804D788 @ =0x04000016
	str r0, [r1]
	ldr r1, _0804D78C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804D790 @ =gUnknown_03001884
	ldr r3, [r0]
	movs r2, #0
	ldr r6, _0804D794 @ =gSineTable
	ldr r5, _0804D798 @ =gUnknown_03005590
	ldr r4, _0804D79C @ =0x000003FF
_0804D74A:
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
	adds r0, #0x2c
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9e
	bls _0804D74A
_0804D770:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D778: .4byte gWinRegs
_0804D77C: .4byte 0x00002735
_0804D780: .4byte gFlags
_0804D784: .4byte gUnknown_03002878
_0804D788: .4byte 0x04000016
_0804D78C: .4byte gUnknown_03002A80
_0804D790: .4byte gUnknown_03001884
_0804D794: .4byte gSineTable
_0804D798: .4byte gUnknown_03005590
_0804D79C: .4byte 0x000003FF

	thumb_func_start sub_804D7A0
sub_804D7A0: @ 0x0804D7A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0804D858 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r5, #0xc0
	lsls r5, r5, #0x12
	add r5, r8
	ldr r4, _0804D85C @ =IWRAM_START + 0x1C
	add r4, r8
	ldr r6, _0804D860 @ =IWRAM_START + 0x48
	add r6, r8
	ldr r0, _0804D864 @ =IWRAM_START + 0x98
	add r0, r8
	ldr r3, _0804D868 @ =gUnknown_03005424
	ldrh r1, [r3]
	movs r2, #0x20
	orrs r1, r2
	strh r1, [r3]
	ldr r3, _0804D86C @ =gDispCnt
	ldrh r2, [r3]
	ldr r1, _0804D870 @ =0x00009FFF
	ands r1, r2
	strh r1, [r3]
	ldr r1, [r4, #0x24]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r4, #0x24]
	ldrh r2, [r6, #0x3a]
	movs r7, #0
	strh r2, [r0, #6]
	ldr r1, [r6, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	movs r3, #0xd7
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r3, #0xa3
	adds r1, r3, #0
	ands r2, r1
	strh r2, [r0, #6]
	movs r1, #0x20
	ldrsh r2, [r4, r1]
	lsls r2, r2, #8
	ldr r1, [r4, #0x24]
	adds r1, r1, r2
	str r1, [r0, #8]
	movs r3, #0x22
	ldrsh r2, [r4, r3]
	lsls r2, r2, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r2
	str r1, [r0, #0xc]
	ldr r1, [r0]
	bl _call_via_r1
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r1, [r6]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_80501D4
	adds r0, r5, #0
	bl sub_8050958
	ldr r0, [r4, #0x24]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #0x24]
	ldrh r0, [r5, #0x12]
	subs r1, r0, #1
	strh r1, [r5, #0x12]
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _0804D878
	mov r2, sb
	ldr r1, [r2]
	ldr r0, _0804D874 @ =sub_804D9DC
	str r0, [r1, #8]
	b _0804D8C0
	.align 2, 0
_0804D858: .4byte gCurTask
_0804D85C: .4byte IWRAM_START + 0x1C
_0804D860: .4byte IWRAM_START + 0x48
_0804D864: .4byte IWRAM_START + 0x98
_0804D868: .4byte gUnknown_03005424
_0804D86C: .4byte gDispCnt
_0804D870: .4byte 0x00009FFF
_0804D874: .4byte sub_804D9DC
_0804D878:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bne _0804D8C0
	ldr r0, _0804D8CC @ =IWRAM_START + 0x900
	add r0, r8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _0804D8D0 @ =0x0600E000
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	movs r1, #0xbc
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	movs r1, #0x20
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r2, _0804D8D4 @ =IWRAM_START + 0x92A
	add r2, r8
	movs r1, #0
	strb r1, [r2]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0804D8D8 @ =gBgCntRegs
	ldr r0, _0804D8DC @ =0x00001C02
	strh r0, [r1, #2]
_0804D8C0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D8CC: .4byte IWRAM_START + 0x900
_0804D8D0: .4byte 0x0600E000
_0804D8D4: .4byte IWRAM_START + 0x92A
_0804D8D8: .4byte gBgCntRegs
_0804D8DC: .4byte 0x00001C02

	thumb_func_start sub_804D8E0
sub_804D8E0: @ 0x0804D8E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp]
	adds r7, r5, #0
	adds r7, #0x98
	movs r1, #0xab
	lsls r1, r1, #3
	adds r1, r5, r1
	str r1, [sp, #4]
	ldr r2, _0804D9C4 @ =0x00000654
	adds r2, r2, r5
	mov sb, r2
	bl sub_802C6E4
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0804D91A
	bl sub_802BA8C
_0804D91A:
	movs r4, #0
	ldr r0, _0804D9C8 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r0, _0804D9CC @ =gUnknown_080D8918
	mov ip, r0
	movs r1, #0x86
	add r1, ip
	mov sl, r1
_0804D92C:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	adds r2, r7, r0
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r1, [r2, #4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, [r2]
	cmp r0, r8
	beq _0804D970
	mov r0, ip
	adds r0, #0x84
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r3, #0x10]
	movs r0, #0x10
	strh r0, [r2, #8]
_0804D970:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804D92C
	ldr r1, _0804D9D0 @ =sub_804E66C
	str r1, [r7]
	ldr r2, _0804D9D4 @ =sub_804FF9C
	mov r0, sb
	str r2, [r0]
	movs r1, #0
	movs r0, #0x96
	lsls r0, r0, #1
	mov r2, sb
	strh r0, [r2, #8]
	ldr r0, _0804D9D8 @ =sub_8050DC8
	ldr r2, [sp, #4]
	str r0, [r2]
	ldr r0, [sp]
	strh r1, [r0, #0x2c]
	strh r1, [r6, #0x14]
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	lsls r1, r1, #8
	ldr r0, [r6, #0x24]
	adds r0, r0, r1
	str r0, [r5, #0x14]
	movs r0, #0x22
	ldrsh r1, [r6, r0]
	lsls r1, r1, #8
	ldr r0, [r6, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0x18]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D9C4: .4byte 0x00000654
_0804D9C8: .4byte gUnknown_080D8E14
_0804D9CC: .4byte gUnknown_080D8918
_0804D9D0: .4byte sub_804E66C
_0804D9D4: .4byte sub_804FF9C
_0804D9D8: .4byte sub_8050DC8

	thumb_func_start sub_804D9DC
sub_804D9DC: @ 0x0804D9DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0804DAA4 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r2, _0804DAA8 @ =IWRAM_START + 0x1C
	adds r4, r0, r2
	adds r1, #0x48
	adds r7, r0, r1
	adds r2, #0x7c
	adds r5, r0, r2
	ldr r1, _0804DAAC @ =IWRAM_START + 0x558
	adds r1, r1, r0
	mov sb, r1
	ldr r2, _0804DAB0 @ =IWRAM_START + 0x594
	adds r2, r2, r0
	mov sl, r2
	ldr r1, _0804DAB4 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0804DAB8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804DABC @ =0x00009FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x24]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r4, #0x24]
	ldrh r1, [r7, #0x3a]
	strh r1, [r5, #6]
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, _0804DAC0 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	strh r1, [r5, #6]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	lsls r1, r1, #8
	ldr r0, [r4, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _0804DAE0
	ldr r0, _0804DAC4 @ =gMPlayInfo_SE1
	bl MPlayStop
	ldr r0, _0804DAC8 @ =gMPlayInfo_SE2
	bl MPlayStop
	ldr r0, _0804DACC @ =gMPlayInfo_SE3
	bl MPlayStop
	ldr r2, _0804DAD0 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x23
	orrs r0, r1
	strh r0, [r2]
	bl sub_802B81C
	adds r0, r6, #0
	bl sub_804D8E0
	adds r0, r6, #0
	bl sub_80501D4
	adds r0, r6, #0
	bl sub_8050958
	ldr r0, _0804DAD4 @ =sub_8050DC4
	str r0, [r5]
	ldr r0, _0804DAD8 @ =sub_8050DF8
	mov r1, r8
	str r0, [r1]
	movs r0, #0x78
	strh r0, [r6, #0x12]
	ldr r2, _0804DAA4 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _0804DADC @ =sub_804DB34
	str r0, [r1, #8]
	b _0804DB24
	.align 2, 0
_0804DAA4: .4byte gCurTask
_0804DAA8: .4byte IWRAM_START + 0x1C
_0804DAAC: .4byte IWRAM_START + 0x558
_0804DAB0: .4byte IWRAM_START + 0x594
_0804DAB4: .4byte IWRAM_START + 0x654
_0804DAB8: .4byte gDispCnt
_0804DABC: .4byte 0x00009FFF
_0804DAC0: .4byte 0x000003FF
_0804DAC4: .4byte gMPlayInfo_SE1
_0804DAC8: .4byte gMPlayInfo_SE2
_0804DACC: .4byte gMPlayInfo_SE3
_0804DAD0: .4byte gUnknown_03005424
_0804DAD4: .4byte sub_8050DC4
_0804DAD8: .4byte sub_8050DF8
_0804DADC: .4byte sub_804DB34
_0804DAE0:
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	mov r0, sb
	ldr r1, [r0]
	bl _call_via_r1
	mov r2, sl
	ldr r1, [r2]
	mov r0, sl
	bl _call_via_r1
	mov r0, r8
	ldr r1, [r0]
	bl _call_via_r1
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r1, [r7]
	adds r0, r7, #0
	bl _call_via_r1
	adds r0, r6, #0
	bl sub_804ECC4
	adds r0, r6, #0
	bl sub_80501D4
	adds r0, r6, #0
	bl sub_8050958
_0804DB24:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804DB34
sub_804DB34: @ 0x0804DB34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0804DC08 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r5, r0
	ldr r1, _0804DC0C @ =IWRAM_START + 0x1C
	adds r4, r5, r1
	ldr r2, _0804DC10 @ =IWRAM_START + 0x98
	adds r0, r5, r2
	ldr r1, _0804DC14 @ =IWRAM_START + 0x594
	adds r6, r5, r1
	ldr r2, _0804DC18 @ =IWRAM_START + 0x654
	adds r2, r2, r5
	mov r8, r2
	ldr r3, _0804DC1C @ =gDispCnt
	ldrh r2, [r3]
	ldr r1, _0804DC20 @ =0x00009FFF
	ands r1, r2
	strh r1, [r3]
	ldr r1, [r4, #0x24]
	movs r2, #0x98
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r4, #0x24]
	ldr r1, [r4, #0x28]
	adds r1, #0x40
	str r1, [r4, #0x28]
	ldr r1, [r0]
	bl _call_via_r1
	ldr r1, [r6]
	adds r0, r6, #0
	bl _call_via_r1
	mov r0, r8
	ldr r1, [r0]
	bl _call_via_r1
	adds r0, r7, #0
	bl sub_80501D4
	adds r0, r7, #0
	bl sub_8050958
	adds r0, r7, #0
	bl sub_804DCF8
	ldr r1, _0804DC24 @ =gIntrTable + 4
	adds r5, r5, r1
	ldr r6, _0804DC28 @ =gCamera
	ldr r0, [r6]
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #8
	ldr r4, [r6, #4]
	adds r4, #0x3c
	lsls r4, r4, #8
	ldr r1, [r7, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0x64
	bl Div
	ldr r1, [r7, #0x14]
	adds r1, r1, r0
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x18]
	subs r4, r4, r0
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r1, #0x64
	bl Div
	ldr r1, [r7, #0x18]
	adds r1, r1, r0
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x14]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r7, #0x18]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r7, #0x12]
	cmp r0, #0
	beq _0804DC2C
	subs r0, #1
	strh r0, [r7, #0x12]
	b _0804DC4C
	.align 2, 0
_0804DC08: .4byte gCurTask
_0804DC0C: .4byte IWRAM_START + 0x1C
_0804DC10: .4byte IWRAM_START + 0x98
_0804DC14: .4byte IWRAM_START + 0x594
_0804DC18: .4byte IWRAM_START + 0x654
_0804DC1C: .4byte gDispCnt
_0804DC20: .4byte 0x00009FFF
_0804DC24: .4byte gIntrTable + 4
_0804DC28: .4byte gCamera
_0804DC2C:
	adds r0, r7, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0804DC4C
	movs r0, #2
	strh r0, [r7, #0x12]
	ldr r1, _0804DC58 @ =gBldRegs
	movs r0, #0x10
	strh r0, [r1, #4]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0804DC5C @ =sub_804DC60
	str r0, [r1, #8]
_0804DC4C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC58: .4byte gBldRegs
_0804DC5C: .4byte sub_804DC60

	thumb_func_start sub_804DC60
sub_804DC60: @ 0x0804DC60
	push {lr}
	ldr r0, _0804DCC4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1, #0x12]
	subs r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804DCC0
	ldr r1, _0804DCC8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0804DCCC @ =gUnknown_03002AE4
	ldr r0, _0804DCD0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0804DCD4 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0804DCD8 @ =gUnknown_03004D5C
	ldr r0, _0804DCDC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _0804DCE0 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bl sub_802C9E4
	ldr r0, _0804DCE4 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0804DCE8 @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _0804DCEC @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	ldr r1, _0804DCF0 @ =gBldRegs
	ldr r0, _0804DCF4 @ =0x00003FBF
	strh r0, [r1]
_0804DCC0:
	pop {r0}
	bx r0
	.align 2, 0
_0804DCC4: .4byte gCurTask
_0804DCC8: .4byte 0x0000FFFF
_0804DCCC: .4byte gUnknown_03002AE4
_0804DCD0: .4byte gUnknown_0300287C
_0804DCD4: .4byte gUnknown_03005390
_0804DCD8: .4byte gUnknown_03004D5C
_0804DCDC: .4byte gUnknown_03002A84
_0804DCE0: .4byte gUnknown_03005424
_0804DCE4: .4byte gUnknown_03005490
_0804DCE8: .4byte gCourseTime
_0804DCEC: .4byte gUnknown_030054F4
_0804DCF0: .4byte gBldRegs
_0804DCF4: .4byte 0x00003FBF

	thumb_func_start sub_804DCF8
sub_804DCF8: @ 0x0804DCF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r4, _0804DD80 @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0804DD12
	movs r0, #0x90
	bl m4aSongNumStart
_0804DD12:
	ldr r6, [r4]
	movs r0, #3
	ands r6, r0
	cmp r6, #0
	bne _0804DD76
	ldr r5, _0804DD84 @ =gUnknown_030053B8
	ldr r0, [r5]
	ldr r3, _0804DD88 @ =0x00196225
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r2, _0804DD8C @ =0x3C6EF35F
	adds r1, r1, r2
	movs r4, #0x7f
	adds r0, r1, #0
	ands r0, r4
	adds r0, #0x40
	str r0, [sp, #0x14]
	muls r1, r3, r1
	adds r1, r1, r2
	adds r0, r1, #0
	ands r0, r4
	adds r0, #0x10
	str r0, [sp, #0x18]
	mov r0, sp
	strh r6, [r0, #0x1c]
	mov r4, sp
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r0, r2
	str r0, [r5]
	ldr r1, _0804DD90 @ =0x000003FF
	ands r0, r1
	strh r0, [r4, #0xc]
	mov r1, sp
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	ldr r0, _0804DD94 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804DD98 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r6, [r0, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	adds r1, r7, #0
	adds r1, #0xe
	mov r0, sp
	bl sub_8039B54
_0804DD76:
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DD80: .4byte gUnknown_03005590
_0804DD84: .4byte gUnknown_030053B8
_0804DD88: .4byte 0x00196225
_0804DD8C: .4byte 0x3C6EF35F
_0804DD90: .4byte 0x000003FF
_0804DD94: .4byte 0x06012980
_0804DD98: .4byte 0x0000026B

	thumb_func_start sub_804DD9C
sub_804DD9C: @ 0x0804DD9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r2, _0804DE58 @ =gCamera
	mov sl, r2
_0804DDB0:
	adds r0, r7, #4
	mov r5, sb
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DE3A
	lsls r4, r5, #1
	add r4, sb
	lsls r4, r4, #4
	adds r4, #0x48
	adds r4, r7, r4
	subs r0, #1
	strb r0, [r1]
	lsls r2, r5, #3
	adds r6, r7, #0
	adds r6, #0x20
	adds r6, r6, r2
	ldr r1, [r6]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r6]
	lsls r5, r5, #2
	mov r8, r5
	adds r3, r7, #0
	adds r3, #0xa
	add r3, r8
	movs r5, #0
	ldrsh r0, [r3, r5]
	adds r1, r1, r0
	str r1, [r6]
	adds r5, r7, #0
	adds r5, #0x24
	adds r5, r5, r2
	adds r2, r7, #0
	adds r2, #0xc
	add r2, r8
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	ldrh r1, [r3]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	strh r1, [r3]
	ldrh r1, [r2]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	strh r1, [r2]
	ldr r0, [r6]
	asrs r0, r0, #8
	mov r2, sl
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0804DE3A:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #4
	bls _0804DDB0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE58: .4byte gCamera

	thumb_func_start sub_804DE5C
sub_804DE5C: @ 0x0804DE5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	mov ip, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r4, #0
	ldr r1, _0804DED4 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r5, r0, r1
	lsls r3, r3, #1
	adds r6, r3, r1
_0804DE7E:
	mov r0, ip
	adds r0, #4
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804DED8
	lsls r2, r4, #2
	mov r1, ip
	adds r1, #0xa
	adds r1, r1, r2
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	rsbs r0, r0, #0
	strh r0, [r1]
	mov r1, ip
	adds r1, #0xc
	adds r1, r1, r2
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	rsbs r0, r0, #0
	strh r0, [r1]
	lsls r1, r4, #3
	mov r0, ip
	adds r0, #0x20
	adds r0, r0, r1
	str r7, [r0]
	mov r0, ip
	adds r0, #0x24
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	movs r0, #0x10
	strb r0, [r3]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, ip
	adds r0, #0x69
	movs r1, #0xff
	strb r1, [r0]
	b _0804DEE2
	.align 2, 0
_0804DED4: .4byte gSineTable
_0804DED8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0804DE7E
_0804DEE2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_804DEEC
sub_804DEEC: @ 0x0804DEEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	str r1, [sp]
	ldr r0, _0804DF7C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804DF80 @ =IWRAM_START + 0x594
	adds r1, r1, r0
	mov ip, r1
	movs r4, #0
	ldr r5, _0804DF84 @ =gUnknown_030053B8
	ldr r6, _0804DF88 @ =0x00196225
	movs r2, #0xff
	mov r8, r2
	ldr r7, _0804DF8C @ =0xFFFFFE00
	mov sb, r7
_0804DF16:
	mov r0, ip
	adds r0, #4
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DF94
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0xe
	adds r0, r0, r4
	movs r1, #0x3c
	strb r1, [r0]
	lsls r3, r4, #2
	mov r2, ip
	adds r2, #0x18
	adds r2, r2, r3
	ldr r0, [r5]
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r0, _0804DF90 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r5]
	adds r0, r1, #0
	mov r7, r8
	ands r0, r7
	add r0, sb
	strh r0, [r2]
	mov r2, ip
	adds r2, #0x1a
	adds r2, r2, r3
	adds r0, r1, #0
	muls r0, r6, r0
	ldr r1, _0804DF90 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ands r0, r7
	add r0, sb
	strh r0, [r2]
	lsls r1, r4, #3
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r1
	mov r2, sl
	str r2, [r0]
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r1
	ldr r7, [sp]
	str r7, [r0]
	b _0804DF9E
	.align 2, 0
_0804DF7C: .4byte gCurTask
_0804DF80: .4byte IWRAM_START + 0x594
_0804DF84: .4byte gUnknown_030053B8
_0804DF88: .4byte 0x00196225
_0804DF8C: .4byte 0xFFFFFE00
_0804DF90: .4byte 0x3C6EF35F
_0804DF94:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0804DF16
_0804DF9E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804DFB0
sub_804DFB0: @ 0x0804DFB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x90
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r1, _0804E074 @ =gCamera
	mov sl, r1
_0804DFCA:
	adds r0, r6, #4
	mov r3, r8
	adds r2, r0, r3
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804E058
	adds r1, r6, #0
	adds r1, #0xe
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0804DFEC
	strb r0, [r2]
_0804DFEC:
	mov r0, r8
	lsls r2, r0, #2
	adds r4, r6, #0
	adds r4, #0x1a
	adds r4, r4, r2
	ldrh r0, [r4]
	adds r0, #0x20
	strh r0, [r4]
	mov r1, r8
	lsls r5, r1, #3
	adds r3, r6, #0
	adds r3, #0x40
	adds r3, r3, r5
	ldr r1, [r3]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x18
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	str r1, [r3]
	adds r2, r6, #0
	adds r2, #0x44
	adds r2, r2, r5
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	asrs r0, r0, #8
	mov r3, sl
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	mov r0, sb
	cmp r0, #0
	bne _0804E052
	adds r0, r7, #0
	bl sub_8004558
	movs r1, #1
	mov sb, r1
_0804E052:
	adds r0, r7, #0
	bl sub_80051E8
_0804E058:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #9
	bls _0804DFCA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E074: .4byte gCamera

	thumb_func_start sub_804E078
sub_804E078: @ 0x0804E078
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804E0B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x1c
	adds r6, r1, r0
	adds r0, r5, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804E112
	ldrb r0, [r4, #0xc]
	cmp r0, #4
	bls _0804E0C4
	ldr r0, [r5, #0x30]
	ldr r1, _0804E0BC @ =0x00000FFF
	ands r0, r1
	str r0, [r5, #0x30]
	ldr r1, _0804E0C0 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x30]
	str r0, [r5]
	ldr r0, [r1, #0x34]
	str r0, [r5, #0x34]
	ldrh r0, [r1, #0x38]
	strh r0, [r5, #0x2e]
	b _0804E112
	.align 2, 0
_0804E0B8: .4byte gCurTask
_0804E0BC: .4byte 0x00000FFF
_0804E0C0: .4byte gUnknown_080D8D6C
_0804E0C4:
	ldr r0, _0804E134 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	bl Mod
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r5, #0x30]
	ldr r2, _0804E138 @ =0x00000FFF
	ands r1, r2
	str r1, [r5, #0x30]
	ldr r3, _0804E13C @ =gUnknown_080D8D6C
	ldr r1, [r3, #0x18]
	str r1, [r5]
	ldr r1, [r3, #0x1c]
	str r1, [r5, #0x34]
	ldrh r1, [r3, #0x20]
	strh r1, [r5, #0x2e]
	ldr r1, [r6, #0x18]
	ands r1, r2
	str r1, [r6, #0x18]
	ldr r2, _0804E140 @ =gUnknown_080D8DCC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	ldr r0, [r4]
	str r0, [r6]
	adds r0, r2, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r6, #0x1c]
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x16]
	ldrh r0, [r3, #8]
	strh r0, [r5, #0x2c]
	ldrh r0, [r2, #8]
	strh r0, [r6, #0x14]
_0804E112:
	movs r0, #0
	str r0, [r5, #0x44]
	str r0, [r5, #0x48]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0804E14A
	movs r1, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E144
	ldrh r0, [r5, #0x38]
	subs r0, #1
	b _0804E148
	.align 2, 0
_0804E134: .4byte gUnknown_03005590
_0804E138: .4byte 0x00000FFF
_0804E13C: .4byte gUnknown_080D8D6C
_0804E140: .4byte gUnknown_080D8DCC
_0804E144:
	ldrh r0, [r5, #0x38]
	adds r0, #1
_0804E148:
	strh r0, [r5, #0x38]
_0804E14A:
	ldrh r1, [r5, #0x38]
	ldr r0, _0804E158 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E158: .4byte 0x000003FF

	thumb_func_start sub_804E15C
sub_804E15C: @ 0x0804E15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	ldr r0, _0804E1B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804E1BC @ =IWRAM_START + 0x558
	adds r1, r0, r1
	str r1, [sp, #0x10]
	ldr r2, _0804E1C0 @ =IWRAM_START + 0x1C
	adds r4, r0, r2
	adds r0, r7, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804E1DC
	ldr r0, [r7, #0x30]
	ldr r1, _0804E1C4 @ =0x00000FFF
	ands r0, r1
	str r0, [r7, #0x30]
	ldr r1, _0804E1C8 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r7]
	ldr r0, [r1, #4]
	str r0, [r7, #0x34]
	ldrh r0, [r1, #8]
	movs r2, #0
	strh r0, [r7, #0x2e]
	ldr r3, _0804E1CC @ =gDispCnt
	ldrh r1, [r3]
	ldr r0, _0804E1D0 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0804E1D4 @ =gWinRegs
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r0, _0804E1D8 @ =gBldRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	b _0804E4B2
	.align 2, 0
_0804E1B8: .4byte gCurTask
_0804E1BC: .4byte IWRAM_START + 0x558
_0804E1C0: .4byte IWRAM_START + 0x1C
_0804E1C4: .4byte 0x00000FFF
_0804E1C8: .4byte gUnknown_080D8D6C
_0804E1CC: .4byte gDispCnt
_0804E1D0: .4byte 0x0000DFFF
_0804E1D4: .4byte gWinRegs
_0804E1D8: .4byte gBldRegs
_0804E1DC:
	ldr r0, [r7, #0x30]
	lsrs r0, r0, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #2
	bhi _0804E1EC
	b _0804E4B2
_0804E1EC:
	movs r3, #0x20
	ldrsh r0, [r4, r3]
	lsls r0, r0, #8
	ldr r1, [r4, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r6, #0x22
	ldrsh r0, [r4, r6]
	lsls r0, r0, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r5, r0, r1
	ldr r2, _0804E3F8 @ =0x000003FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _0804E3FC @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	ldr r4, _0804E400 @ =gUnknown_080D89A5
	ldrb r1, [r4]
	muls r0, r1, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r5, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r1, r0
	asrs r0, r0, #6
	add r8, r0
	adds r5, #0x8c
	ldr r0, _0804E404 @ =0xFFFFFF00
	adds r1, r5, r0
	ldr r0, _0804E3F8 @ =0x000003FF
	ands r1, r0
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r6, #0
	ldrsh r0, [r2, r6]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r0, r0, #2
	add r8, r0
	movs r0, #0
	mov sl, r4
	adds r3, r7, #0
	adds r3, #0x3a
	str r3, [sp, #0x1c]
	adds r4, r7, #0
	adds r4, #0x42
	str r4, [sp, #0x20]
	mov r6, sp
	adds r6, #0xc
	str r6, [sp, #0x18]
	ldr r1, _0804E3FC @ =gSineTable
	mov ip, r1
_0804E278:
	adds r3, r0, #1
	lsls r0, r3, #1
	ldr r2, [sp, #0x1c]
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r5, r5, r0
	ldr r4, _0804E3F8 @ =0x000003FF
	ands r5, r4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r5, r6
	lsls r6, r0, #1
	mov r1, ip
	adds r0, r6, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r4, sl
	adds r0, r3, r4
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r4, r5, #1
	mov r1, ip
	adds r0, r4, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #6
	add r8, r0
	lsls r3, r3, #0x18
	lsrs r0, r3, #0x18
	cmp r0, #2
	bls _0804E278
	ldr r2, _0804E3FC @ =gSineTable
	adds r0, r6, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	mov r6, sl
	ldrb r1, [r6, #4]
	muls r0, r1, r0
	asrs r0, r0, #6
	add sb, r0
	adds r0, r4, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #6
	add r8, r0
	ldr r3, [sp, #0x20]
	ldrh r0, [r3]
	adds r5, r5, r0
	ldr r4, _0804E3F8 @ =0x000003FF
	ands r5, r4
	ldr r6, [sp, #0x14]
	cmp r6, #5
	bhi _0804E2EE
	b _0804E43C
_0804E2EE:
	ldr r0, _0804E408 @ =gMPlayTable
	ldr r1, [r0, #0x18]
	ldr r0, _0804E40C @ =gSongTable
	ldr r2, _0804E410 @ =0x00000868
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _0804E30A
	cmp r6, #6
	bne _0804E30A
	ldr r0, _0804E414 @ =0x0000010D
	bl m4aSongNumStart
_0804E30A:
	add r0, sp, #8
	ldr r1, [sp, #0x18]
	bl sub_802C668
	ldrh r0, [r7, #0x38]
	adds r6, r5, r0
	ldr r3, _0804E3F8 @ =0x000003FF
	adds r0, r3, #0
	ands r6, r0
	ldr r0, [sp, #0xc]
	mov r4, r8
	subs r0, r0, r4
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	mov r2, sb
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x10
	cmp r6, r0
	bge _0804E350
	subs r0, #0x20
	cmp r6, r0
	ble _0804E350
	bl sub_802BB54
	ldr r0, _0804E418 @ =sub_804F1EC
	ldr r3, [sp, #0x10]
	str r0, [r3]
_0804E350:
	ldr r2, _0804E41C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0804E420 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	movs r0, #0x3f
	strh r0, [r1, #8]
	movs r0, #0x15
	strh r0, [r1, #0xa]
	ldr r1, _0804E424 @ =gBldRegs
	ldr r0, _0804E428 @ =0x00003FBF
	strh r0, [r1]
	movs r5, #8
	strh r5, [r1, #2]
	strh r5, [r1, #4]
	ldr r2, _0804E42C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0804E430 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804E434 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #8
	bl Mod
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bge _0804E39A
	rsbs r4, r4, #0
_0804E39A:
	ldr r3, _0804E3FC @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0804E400 @ =gUnknown_080D89A5
	ldrb r2, [r0, #5]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r6, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add r8, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x1a
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r4, sb
	asrs r3, r4, #8
	ldr r2, _0804E438 @ =gCamera
	ldr r0, [r2]
	subs r3, r3, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r4, r8
	asrs r0, r4, #8
	ldr r2, [r2, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x10
	bl sub_802E784
	b _0804E4B2
	.align 2, 0
_0804E3F8: .4byte 0x000003FF
_0804E3FC: .4byte gSineTable
_0804E400: .4byte gUnknown_080D89A5
_0804E404: .4byte 0xFFFFFF00
_0804E408: .4byte gMPlayTable
_0804E40C: .4byte gSongTable
_0804E410: .4byte 0x00000868
_0804E414: .4byte 0x0000010D
_0804E418: .4byte sub_804F1EC
_0804E41C: .4byte gDispCnt
_0804E420: .4byte gWinRegs
_0804E424: .4byte gBldRegs
_0804E428: .4byte 0x00003FBF
_0804E42C: .4byte gUnknown_030053B8
_0804E430: .4byte 0x00196225
_0804E434: .4byte 0x3C6EF35F
_0804E438: .4byte gCamera
_0804E43C:
	movs r0, #8
	add r1, sp, #8
	ldr r2, [sp, #0x18]
	bl sub_802C704
	ldr r0, [sp, #0xc]
	mov r6, r8
	subs r0, r0, r6
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	mov r2, sb
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r7, #0x38]
	adds r0, r5, r0
	ldr r3, _0804E490 @ =0x000003FF
	ands r0, r3
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E498
	ldrh r1, [r7, #0x38]
	adds r2, r1, #0
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r2, r0
	bls _0804E494
	movs r0, #0xe0
	lsls r0, r0, #2
	cmp r2, r0
	bls _0804E4AA
	subs r0, r1, #4
	b _0804E4A8
	.align 2, 0
_0804E490: .4byte 0x000003FF
_0804E494:
	subs r0, r1, #4
	b _0804E4A8
_0804E498:
	ldrh r1, [r7, #0x38]
	adds r2, r1, #0
	ldr r0, _0804E4C4 @ =0x000001FF
	cmp r2, r0
	bhi _0804E4A6
	cmp r2, #0x7f
	bhi _0804E4AA
_0804E4A6:
	adds r0, r1, #4
_0804E4A8:
	strh r0, [r7, #0x38]
_0804E4AA:
	ldrh r1, [r7, #0x38]
	ldr r0, _0804E4C8 @ =0x000003FF
	ands r0, r1
	strh r0, [r7, #0x38]
_0804E4B2:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E4C4: .4byte 0x000001FF
_0804E4C8: .4byte 0x000003FF

	thumb_func_start sub_804E4CC
sub_804E4CC: @ 0x0804E4CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl sub_8050030
	ldr r0, [r4, #0x30]
	ldr r6, _0804E504 @ =0x00000FFF
	adds r1, r0, #0
	ands r1, r6
	adds r3, r1, #0
	adds r5, r3, #0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #4
	bne _0804E50C
	str r1, [r4, #0x30]
	ldr r1, _0804E508 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	b _0804E64A
	.align 2, 0
_0804E504: .4byte 0x00000FFF
_0804E508: .4byte gUnknown_080D8D6C
_0804E50C:
	cmp r0, #3
	bne _0804E5B0
	ldr r2, _0804E598 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804E59C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	adds r6, r3, #0
	movs r5, #0
	adds r4, #0x4c
	mov r8, r4
	ldr r0, _0804E5A0 @ =gUnknown_080D8E20
	mov ip, r0
	movs r7, #0x1f
	movs r1, #0x92
	add r1, ip
	mov sl, r1
	ldr r2, _0804E5A4 @ =gObjPalette
	mov sb, r2
_0804E532:
	lsls r4, r5, #1
	adds r1, r4, r5
	mov r0, ip
	adds r0, #0x90
	adds r0, r1, r0
	ldrb r3, [r0]
	muls r3, r6, r3
	asrs r3, r3, #0xc
	ands r3, r7
	mov r0, ip
	adds r0, #0x91
	adds r0, r1, r0
	ldrb r2, [r0]
	muls r2, r6, r2
	asrs r2, r2, #0xc
	ands r2, r7
	add r1, sl
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	ands r0, r7
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	strh r0, [r1]
	ldr r3, _0804E5A8 @ =gBgPalette
	adds r4, r4, r3
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804E532
	ldr r1, _0804E5AC @ =gFlags
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	ldr r2, _0804E5AC @ =gFlags
	str r0, [r2]
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
	b _0804E64A
	.align 2, 0
_0804E598: .4byte gDispCnt
_0804E59C: .4byte 0x0000FDFF
_0804E5A0: .4byte gUnknown_080D8E20
_0804E5A4: .4byte gObjPalette
_0804E5A8: .4byte gBgPalette
_0804E5AC: .4byte gFlags
_0804E5B0:
	cmp r2, #2
	bne _0804E64A
	movs r0, #0xe0
	lsls r0, r0, #4
	cmp r5, r0
	bls _0804E64A
	ldr r2, _0804E658 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	subs r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r0, _0804E65C @ =gUnknown_080D8E20
	mov r8, r0
	movs r4, #0x1f
	ldr r1, _0804E660 @ =gBgPalette
	mov sl, r1
_0804E5DC:
	movs r5, #0
	lsls r0, r2, #1
	lsls r1, r2, #4
	adds r3, r2, #1
	mov sb, r3
	adds r0, r0, r2
	lsls r0, r0, #4
	mov ip, r0
	adds r7, r1, #0
	adds r7, #0x70
_0804E5F0:
	lsls r1, r5, #1
	adds r1, r1, r5
	add r1, ip
	mov r2, r8
	adds r0, r1, r2
	ldrb r3, [r0]
	muls r3, r6, r3
	asrs r3, r3, #9
	ands r3, r4
	mov r0, r8
	adds r0, #1
	adds r0, r1, r0
	ldrb r2, [r0]
	muls r2, r6, r2
	asrs r2, r2, #9
	ands r2, r4
	ldr r0, _0804E664 @ =gUnknown_080D8E22
	adds r1, r1, r0
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #9
	ands r0, r4
	adds r1, r5, r7
	lsls r1, r1, #1
	add r1, sl
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804E5F0
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _0804E5DC
	ldr r2, _0804E668 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
_0804E64A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E658: .4byte gDispCnt
_0804E65C: .4byte gUnknown_080D8E20
_0804E660: .4byte gBgPalette
_0804E664: .4byte gUnknown_080D8E22
_0804E668: .4byte gFlags

	thumb_func_start sub_804E66C
sub_804E66C: @ 0x0804E66C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #4]
	subs r0, #1
	strh r0, [r7, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804E68C
	ldr r0, _0804E738 @ =sub_804E74C
	str r0, [r7]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r7, #4]
_0804E68C:
	ldr r0, _0804E73C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #4
	bl Mod
	movs r1, #0
	mov sb, r1
	cmp r0, #0
	bne _0804E6A2
	movs r2, #1
	mov sb, r2
_0804E6A2:
	movs r5, #0
	ldr r0, _0804E740 @ =gSineTable
	mov r8, r0
_0804E6A8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x10
	adds r4, r7, r0
	adds r6, r4, #0
	adds r6, #0x58
	ldr r1, [r4, #0x58]
	adds r0, r6, #0
	bl _call_via_r1
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E71C
	mov r1, sb
	cmp r1, #0
	beq _0804E714
	ldr r1, [r4]
	ldr r0, _0804E744 @ =sub_804EC6C
	cmp r1, r0
	beq _0804E714
	ldrh r3, [r4, #0xc]
	adds r3, #0x20
	ldr r2, _0804E748 @ =0x000003FF
	adds r0, r2, #0
	ands r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	ldr r0, [r4, #0x14]
	subs r0, r0, r1
	lsls r1, r3, #1
	add r1, r8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r1, #2
	adds r2, r2, r1
	asrs r2, r2, #5
	ldr r1, [r4, #0x18]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_804DE5C
_0804E714:
	ldr r1, [r4]
	adds r0, r4, #0
	bl _call_via_r1
_0804E71C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0804E6A8
	adds r0, r7, #0
	bl sub_804E8E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E738: .4byte sub_804E74C
_0804E73C: .4byte gUnknown_03005590
_0804E740: .4byte gSineTable
_0804E744: .4byte sub_804EC6C
_0804E748: .4byte 0x000003FF

	thumb_func_start sub_804E74C
sub_804E74C: @ 0x0804E74C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #4]
	subs r0, #1
	strh r0, [r7, #4]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	movs r4, #3
	cmp r1, #0
	bne _0804E778
	ldr r0, _0804E774 @ =sub_804E66C
	str r0, [r7]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r7, #4]
	b _0804E792
	.align 2, 0
_0804E774: .4byte sub_804E66C
_0804E778:
	movs r0, #0x87
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804E784
	movs r4, #0
	b _0804E792
_0804E784:
	cmp r1, #0xd2
	bne _0804E78C
	movs r4, #1
	b _0804E792
_0804E78C:
	cmp r2, #0x96
	bne _0804E792
	movs r4, #2
_0804E792:
	cmp r4, #2
	bhi _0804E836
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	adds r5, r7, r0
	ldr r0, _0804E8D4 @ =gUnknown_080D8E14
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #3
	strb r0, [r5, #4]
	movs r4, #0
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r5, #8]
	ldrh r1, [r7, #6]
	ldr r0, _0804E8D8 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0xa]
	ldr r1, _0804E8DC @ =gSineTable
	ldrh r0, [r7, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	strh r0, [r5, #0xe]
	ldrh r0, [r7, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	strh r0, [r5, #0x10]
	ldr r1, [r7, #8]
	str r1, [r5, #0x14]
	ldr r2, [r7, #0xc]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	movs r3, #0xd
	muls r0, r3, r0
	adds r1, r1, r0
	str r1, [r5, #0x14]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	muls r0, r3, r0
	adds r2, r2, r0
	str r2, [r5, #0x18]
	movs r0, #0x80
	str r0, [r5, #0x1c]
	strb r4, [r5, #6]
	movs r0, #5
	strb r0, [r5, #5]
	adds r2, r5, #0
	adds r2, #0x20
	ldr r1, _0804E8E0 @ =gUnknown_080D8918
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	adds r1, #4
	movs r0, #6
	strb r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804E836:
	ldr r0, _0804E8E4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #4
	bl Mod
	movs r2, #0
	mov sb, r2
	cmp r0, #0
	bne _0804E84C
	movs r3, #1
	mov sb, r3
_0804E84C:
	movs r4, #0
	ldr r0, _0804E8DC @ =gSineTable
	mov r8, r0
_0804E852:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	adds r5, r7, r0
	adds r6, r5, #0
	adds r6, #0x58
	ldr r1, [r5, #0x58]
	adds r0, r6, #0
	bl _call_via_r1
	ldrb r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E8B6
	mov r1, sb
	cmp r1, #0
	beq _0804E8AE
	ldrh r3, [r5, #0xa]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #5
	ldr r0, [r5, #0x14]
	subs r0, r0, r1
	lsls r1, r3, #1
	add r1, r8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r1, #2
	adds r2, r2, r1
	asrs r2, r2, #5
	ldr r1, [r5, #0x18]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_804DE5C
_0804E8AE:
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
_0804E8B6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804E852
	adds r0, r7, #0
	bl sub_804E8E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E8D4: .4byte gUnknown_080D8E14
_0804E8D8: .4byte 0x000003FF
_0804E8DC: .4byte gSineTable
_0804E8E0: .4byte gUnknown_080D8918
_0804E8E4: .4byte gUnknown_03005590

	thumb_func_start sub_804E8E8
sub_804E8E8: @ 0x0804E8E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r5, #0
	ldr r6, _0804E968 @ =gCamera
_0804E8F4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x10
	mov r1, r8
	adds r2, r1, r0
	ldrb r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E952
	adds r4, r2, #0
	adds r4, #0x20
	ldrh r0, [r2, #0xc]
	adds r0, #0x20
	ldr r1, _0804E96C @ =0x000003FF
	ands r0, r1
	lsrs r1, r0, #6
	ldr r3, _0804E970 @ =gUnknown_080D8918
	ldrh r0, [r4, #0xa]
	ldrh r7, [r3, #4]
	cmp r0, r7
	bne _0804E932
	lsls r0, r1, #3
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_0804E932:
	ldr r0, [r2, #0x14]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r2, #0x18]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0804E952:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0804E8F4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E968: .4byte gCamera
_0804E96C: .4byte 0x000003FF
_0804E970: .4byte gUnknown_080D8918

	thumb_func_start sub_804E974
sub_804E974: @ 0x0804E974
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x20
	movs r0, #0
	mov r8, r0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	ldr r0, [sp]
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [sp]
	ldrh r0, [r5, #8]
	subs r1, r0, #1
	strh r1, [r5, #8]
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _0804E9AC
	movs r2, #1
	mov r8, r2
	b _0804E9BC
_0804E9AC:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa9
	bhi _0804E9BC
	ldrb r1, [r5, #4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r5, #4]
_0804E9BC:
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x18]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	ldr r2, [r5, #0x14]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	strh r1, [r5, #0xc]
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0804E9E6
	subs r0, #1
	strb r0, [r5, #5]
	b _0804EA00
_0804E9E6:
	ldrh r0, [r5, #0xa]
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E9FA
	ldrh r0, [r5, #0xa]
	subs r0, #5
	b _0804E9FE
_0804E9FA:
	ldrh r0, [r5, #0xa]
	adds r0, #5
_0804E9FE:
	strh r0, [r5, #0xa]
_0804EA00:
	ldrh r1, [r5, #0xa]
	ldr r0, _0804EAD8 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0xa]
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	movs r1, #0x28
	bl Div
	ldrh r1, [r5, #0xe]
	subs r1, r1, r0
	strh r1, [r5, #0xe]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	movs r1, #0x28
	bl Div
	ldrh r1, [r5, #0x10]
	subs r1, r1, r0
	strh r1, [r5, #0x10]
	ldr r7, _0804EADC @ =gSineTable
	ldrh r0, [r5, #0xa]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r4, _0804EAE0 @ =0x00000352
	adds r1, r4, #0
	bl Div
	ldrh r1, [r5, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #0xe]
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	bl Div
	ldrh r1, [r5, #0x10]
	adds r1, r1, r0
	strh r1, [r5, #0x10]
	ldr r0, [r5, #0x14]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	str r0, [r5, #0x14]
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x18]
	adds r0, r0, r1
	str r0, [r5, #0x18]
	bl sub_802C6E4
	movs r1, #0x82
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0804EB50
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	adds r0, r6, #0
	bl sub_804EE84
	cmp r0, #1
	bne _0804EAE8
	ldr r0, _0804EAE4 @ =gUnknown_080D8E14
	ldr r0, [r0, #4]
	str r0, [r5]
	bl sub_802C770
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	adds r1, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r5, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	movs r0, #0
	mov r8, r0
	movs r0, #0x86
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _0804EB08
	.align 2, 0
_0804EAD8: .4byte 0x000003FF
_0804EADC: .4byte gSineTable
_0804EAE0: .4byte 0x00000352
_0804EAE4: .4byte gUnknown_080D8E14
_0804EAE8:
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	adds r0, r6, #0
	movs r3, #1
	bl sub_804F010
	cmp r0, #1
	bne _0804EB08
	bl sub_802BA8C
	cmp r0, #1
	bne _0804EB08
	movs r1, #1
	mov r8, r1
_0804EB08:
	mov r2, r8
	cmp r2, #0
	beq _0804EB50
	ldrb r1, [r5, #4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r5, #4]
	ldr r0, _0804EB60 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	str r0, [r5]
	movs r2, #0
	movs r0, #0x10
	strh r0, [r5, #8]
	ldr r0, _0804EB64 @ =gUnknown_080D8918
	adds r1, r0, #0
	adds r1, #0x84
	ldrh r1, [r1]
	strh r1, [r6, #0xa]
	adds r0, #0x86
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0804EB68 @ =0x0000010B
	bl m4aSongNumStart
_0804EB50:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EB60: .4byte gUnknown_080D8E14
_0804EB64: .4byte gUnknown_080D8918
_0804EB68: .4byte 0x0000010B

	thumb_func_start sub_804EB6C
sub_804EB6C: @ 0x0804EB6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x20
	ldr r0, _0804EBBC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804EBC8
	ldr r0, _0804EBC0 @ =gUnknown_080D8918
	adds r1, r0, #0
	adds r1, #0x84
	ldrh r1, [r1]
	strh r1, [r5, #0xa]
	adds r0, #0x86
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804EBC4 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
	b _0804EC5E
	.align 2, 0
_0804EBBC: .4byte gCurTask
_0804EBC0: .4byte gUnknown_080D8918
_0804EBC4: .4byte gUnknown_080D8E14
_0804EBC8:
	ldrh r0, [r4, #0xa]
	adds r0, #0x8c
	ldr r1, _0804EC18 @ =0x000003FF
	ands r0, r1
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x14]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	adds r2, r0, r1
	str r2, [r4, #0x14]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x18]
	adds r1, r0, r1
	str r1, [r4, #0x18]
	ldrb r0, [r6, #0xd]
	cmp r0, #0
	bne _0804EC5E
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0804EC5E
	asrs r0, r2, #8
	asrs r1, r1, #8
	bl sub_804ED98
	cmp r0, #0
	beq _0804EC5E
	ldrb r1, [r6, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804EC1C
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804EC22
	.align 2, 0
_0804EC18: .4byte 0x000003FF
_0804EC1C:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804EC22:
	ldr r1, _0804EC64 @ =gUnknown_080D8918
	adds r0, r1, #0
	adds r0, #0x84
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r5, #0xa]
	adds r1, #0x86
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0804EC68 @ =gUnknown_080D8E14
	ldr r0, [r0, #8]
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
	movs r0, #0x30
	strb r0, [r6, #0xd]
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	beq _0804EC5E
	subs r0, #1
	strb r0, [r6, #0xc]
_0804EC5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EC64: .4byte gUnknown_080D8918
_0804EC68: .4byte gUnknown_080D8E14

	thumb_func_start sub_804EC6C
sub_804EC6C: @ 0x0804EC6C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804EC82
	movs r0, #0
	strb r0, [r4, #4]
	b _0804ECBC
_0804EC82:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl Div
	ldrh r1, [r4, #0xe]
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl Div
	ldrh r1, [r4, #0x10]
	subs r1, r1, r0
	strh r1, [r4, #0x10]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	str r0, [r4, #0x18]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r4, #0x14]
_0804ECBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804ECC4
sub_804ECC4: @ 0x0804ECC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	adds r1, r6, #0
	adds r1, #0x1c
	adds r6, #0x48
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r4, [r1, #0x24]
	adds r4, r4, r0
	movs r7, #0x22
	ldrsh r0, [r1, r7]
	lsls r0, r0, #8
	ldr r5, [r1, #0x28]
	adds r5, r5, r0
	ldr r1, [r6, #0x44]
	asrs r1, r1, #8
	ldrh r6, [r6, #0x3a]
	adds r1, r1, r6
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	add r1, sb
	ldr r2, _0804ED8C @ =0x000003FF
	mov r8, r2
	mov r7, r8
	ands r1, r7
	ldr r6, _0804ED90 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r2, [r0, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #4
	adds r4, r4, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r2, [r0, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #4
	adds r5, r5, r0
	add r1, sb
	mov r0, r8
	ands r1, r0
	adds r3, r1, r3
	lsls r3, r3, #1
	adds r3, r3, r6
	movs r7, #0
	ldrsh r2, [r3, r7]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #5
	adds r4, r4, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	adds r5, r5, r0
	ldr r0, [sp]
	subs r4, r4, r0
	ldr r0, [sp, #4]
	subs r5, r5, r0
	asrs r4, r4, #8
	asrs r5, r5, #8
	adds r2, r4, #0
	muls r2, r4, r2
	adds r4, r2, #0
	adds r7, r5, #0
	muls r7, r5, r7
	adds r5, r7, #0
	adds r4, r4, r5
	ldr r0, _0804ED94 @ =0x0000063F
	cmp r4, r0
	bgt _0804ED7E
	bl sub_802BA8C
_0804ED7E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED8C: .4byte 0x000003FF
_0804ED90: .4byte gSineTable
_0804ED94: .4byte 0x0000063F

	thumb_func_start sub_804ED98
sub_804ED98: @ 0x0804ED98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	ldr r2, _0804EE6C @ =gCurTask
	ldr r2, [r2]
	ldrh r4, [r2, #6]
	ldr r5, _0804EE70 @ =IWRAM_START + 0x1C
	adds r3, r4, r5
	ldr r7, _0804EE74 @ =IWRAM_START + 0x48
	adds r4, r4, r7
	movs r5, #0x20
	ldrsh r2, [r3, r5]
	lsls r2, r2, #8
	ldr r6, [r3, #0x24]
	adds r6, r6, r2
	movs r7, #0x22
	ldrsh r2, [r3, r7]
	lsls r2, r2, #8
	ldr r3, [r3, #0x28]
	mov r8, r3
	add r8, r2
	ldr r3, [r4, #0x44]
	asrs r3, r3, #8
	ldrh r4, [r4, #0x3a]
	adds r3, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #2
	mov ip, r2
	add r3, ip
	ldr r5, _0804EE78 @ =0x000003FF
	mov sl, r5
	mov r7, sl
	ands r3, r7
	ldr r2, _0804EE7C @ =gSineTable
	mov sb, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r3, r5
	lsls r2, r2, #1
	add r2, sb
	movs r7, #0
	ldrsh r4, [r2, r7]
	lsls r2, r4, #2
	adds r2, r2, r4
	asrs r2, r2, #4
	adds r6, r6, r2
	lsls r2, r3, #1
	add r2, sb
	movs r7, #0
	ldrsh r4, [r2, r7]
	lsls r2, r4, #2
	adds r2, r2, r4
	asrs r2, r2, #4
	add r8, r2
	add r3, ip
	mov r2, sl
	ands r3, r2
	adds r5, r3, r5
	lsls r5, r5, #1
	add r5, sb
	movs r7, #0
	ldrsh r4, [r5, r7]
	lsls r2, r4, #2
	adds r2, r2, r4
	asrs r2, r2, #5
	adds r6, r6, r2
	lsls r3, r3, #1
	add r3, sb
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #5
	add r8, r2
	asrs r6, r6, #8
	mov r5, r8
	asrs r5, r5, #8
	subs r6, r6, r0
	subs r5, r5, r1
	mov r8, r5
	adds r7, r6, #0
	muls r7, r6, r7
	adds r6, r7, #0
	mov r0, r8
	muls r0, r5, r0
	mov r8, r0
	add r6, r8
	ldr r0, _0804EE80 @ =0x0000063F
	cmp r6, r0
	bgt _0804EE5A
	movs r1, #1
	str r1, [sp]
_0804EE5A:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804EE6C: .4byte gCurTask
_0804EE70: .4byte IWRAM_START + 0x1C
_0804EE74: .4byte IWRAM_START + 0x48
_0804EE78: .4byte 0x000003FF
_0804EE7C: .4byte gSineTable
_0804EE80: .4byte 0x0000063F

	thumb_func_start sub_804EE84
sub_804EE84: @ 0x0804EE84
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	bl sub_802C750
	adds r6, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	bl sub_802C6E4
	movs r1, #0x82
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0804EF5C
	ldr r0, _0804EF58 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804EF5C
	ldr r0, [r5, #0x30]
	subs r1, #0x81
	cmp r0, r1
	beq _0804EF5C
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _0804EF5C
	adds r0, r5, #0
	adds r0, #0x34
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	ldr r0, [sp]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0804EEFC
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0804EF0E
	cmp r2, r1
	blt _0804EF5C
_0804EEFC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0804EF5C
_0804EF0E:
	adds r0, r5, #0
	adds r0, #0x35
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r7, r4
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0804EF42
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0804EF54
	cmp r2, r3
	blt _0804EF5C
_0804EF42:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0804EF5C
_0804EF54:
	movs r0, #1
	b _0804EF5E
	.align 2, 0
_0804EF58: .4byte gPlayer
_0804EF5C:
	movs r0, #0
_0804EF5E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804EF68
sub_804EF68: @ 0x0804EF68
	push {r4, r5, r6, lr}
	mov ip, r0
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, [r0, #0x30]
	movs r3, #1
	rsbs r3, r3, #0
	cmp r0, r3
	beq _0804F008
	ldr r0, [r4, #0x28]
	cmp r0, r3
	beq _0804F008
	mov r0, ip
	adds r0, #0x34
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp, #0x10]
	adds r3, r0, r5
	cmp r1, r3
	bgt _0804EFB0
	mov r0, ip
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _0804EFC2
	cmp r1, r3
	blt _0804F008
_0804EFB0:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	blt _0804F008
_0804EFC2:
	mov r0, ip
	adds r0, #0x35
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r6, r3
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp, #0x14]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0804EFF2
	mov r0, ip
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0804F004
	cmp r2, r1
	blt _0804F008
_0804EFF2:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0804F008
_0804F004:
	movs r0, #1
	b _0804F00A
_0804F008:
	movs r0, #0
_0804F00A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_804F010
sub_804F010: @ 0x0804F010
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	bl sub_802C750
	adds r6, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	bl sub_802C6E4
	ldr r0, _0804F0F4 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804F0F8
	lsls r0, r4, #3
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r0
	ldr r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	mov ip, r0
	cmp r1, r2
	beq _0804F0F8
	ldr r0, [r6, #0x28]
	cmp r0, r2
	beq _0804F0F8
	mov r0, ip
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	ldr r0, [sp]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2c
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0804F096
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0804F0A8
	cmp r2, r1
	blt _0804F0F8
_0804F096:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0804F0F8
_0804F0A8:
	mov r1, ip
	adds r3, r7, r1
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r2, r0, r4
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	movs r1, #0x2d
	ldrsb r5, [r1, r6]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0804F0DC
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0804F0EE
	cmp r2, r1
	blt _0804F0F8
_0804F0DC:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0804F0F8
_0804F0EE:
	movs r0, #1
	b _0804F0FA
	.align 2, 0
_0804F0F4: .4byte gPlayer
_0804F0F8:
	movs r0, #0
_0804F0FA:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804F108
sub_804F108: @ 0x0804F108
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _0804F1D8 @ =gCurTask
	ldr r1, [r1]
	ldrh r1, [r1, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r1, r2
	ldr r4, _0804F1DC @ =IWRAM_START + 0x1C
	adds r3, r1, r4
	adds r4, #0x2c
	adds r6, r1, r4
	adds r7, r0, #0
	adds r7, #0xc
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _0804F1CA
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	ldr r4, [r3, #0x24]
	adds r4, r4, r0
	movs r2, #0x22
	ldrsh r0, [r3, r2]
	lsls r0, r0, #8
	ldr r5, [r3, #0x28]
	adds r5, r5, r0
	ldr r1, [r6, #0x44]
	asrs r1, r1, #8
	ldrh r6, [r6, #0x3a]
	adds r1, r1, r6
	movs r3, #0xc0
	lsls r3, r3, #2
	mov sb, r3
	add r1, sb
	ldr r0, _0804F1E0 @ =0x000003FF
	mov r8, r0
	mov r2, r8
	ands r1, r2
	ldr r6, _0804F1E4 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r2, r0, r6
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r4, r4, r0
	lsls r0, r1, #1
	adds r2, r0, r6
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r5, r5, r0
	add r1, sb
	mov r2, r8
	ands r1, r2
	adds r3, r1, r3
	lsls r3, r3, #1
	adds r3, r3, r6
	movs r2, #0
	ldrsh r0, [r3, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r4, r4, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r5, r5, r0
	asrs r4, r4, #8
	ldr r1, _0804F1E8 @ =gCamera
	ldr r0, [r1]
	subs r4, r4, r0
	subs r4, #6
	strh r4, [r7, #0x16]
	asrs r5, r5, #8
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r5, #5
	strh r5, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_0804F1CA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F1D8: .4byte gCurTask
_0804F1DC: .4byte IWRAM_START + 0x1C
_0804F1E0: .4byte 0x000003FF
_0804F1E4: .4byte gSineTable
_0804F1E8: .4byte gCamera

	thumb_func_start sub_804F1EC
sub_804F1EC: @ 0x0804F1EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	ldr r0, _0804F348 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r2, _0804F34C @ =IWRAM_START + 0x1C
	adds r4, r0, r2
	ldr r3, _0804F350 @ =IWRAM_START + 0x48
	adds r5, r0, r3
	ldr r6, _0804F354 @ =IWRAM_START + 0x98
	adds r6, r0, r6
	str r6, [sp, #0x10]
	mov r0, r8
	adds r0, #0xc
	str r0, [sp, #0x14]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _0804F222
	b _0804F462
_0804F222:
	mov r1, r8
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F23C
	ldr r0, _0804F358 @ =sub_8050DC8
	str r0, [r1]
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStop
_0804F23C:
	mov r2, r8
	ldr r0, [r2, #8]
	adds r7, r0, #2
	movs r0, #0xe8
	lsls r0, r0, #1
	cmp r7, r0
	ble _0804F24C
	adds r7, r0, #0
_0804F24C:
	mov r3, r8
	str r7, [r3, #8]
	movs r6, #0x20
	ldrsh r0, [r4, r6]
	lsls r0, r0, #8
	ldr r1, [r4, #0x24]
	adds r1, r1, r0
	mov sl, r1
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r0
	mov sb, r1
	ldr r1, [r5, #0x44]
	asrs r1, r1, #8
	ldrh r5, [r5, #0x3a]
	adds r1, r1, r5
	movs r2, #0xc0
	lsls r2, r2, #2
	mov ip, r2
	add r1, ip
	ldr r3, _0804F35C @ =0x000003FF
	adds r4, r3, #0
	ands r1, r4
	ldr r3, _0804F360 @ =gSineTable
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	add sl, r0
	lsls r0, r1, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	add sb, r0
	add r1, ip
	ands r1, r4
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_802C668
	ldr r0, [sp, #8]
	movs r1, #0xa0
	lsls r1, r1, #4
	add r1, sl
	movs r4, #2
	str r4, [sp]
	adds r2, r7, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r5, r7, r5
	str r4, [sp]
	mov r1, sb
	adds r2, r5, #0
	movs r3, #0xa
	bl sub_8085698
	adds r1, r0, #0
	str r1, [sp, #0xc]
	ldr r0, [sp, #8]
	bl sub_802C6B4
	mov r6, sl
	asrs r4, r6, #8
	mov r0, sb
	asrs r5, r0, #8
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_804F010
	cmp r0, #1
	bne _0804F36C
	bl sub_802C798
	ldr r0, _0804F364 @ =sub_804F47C
	mov r1, r8
	str r0, [r1]
	movs r0, #0x78
	strh r0, [r1, #6]
	movs r0, #0xa
	strb r0, [r1, #4]
	ldr r0, _0804F368 @ =0x000002CB
	ldr r2, [sp, #0x14]
	strh r0, [r2, #0xa]
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	b _0804F462
	.align 2, 0
_0804F348: .4byte gCurTask
_0804F34C: .4byte IWRAM_START + 0x1C
_0804F350: .4byte IWRAM_START + 0x48
_0804F354: .4byte IWRAM_START + 0x98
_0804F358: .4byte sub_8050DC8
_0804F35C: .4byte 0x000003FF
_0804F360: .4byte gSineTable
_0804F364: .4byte sub_804F47C
_0804F368: .4byte 0x000002CB
_0804F36C:
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, _0804F474 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	ldr r3, [sp, #0x14]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x14]
	bl sub_8004558
	ldr r0, [sp, #0x14]
	bl sub_80051E8
	movs r6, #0
	movs r4, #2
	mov r8, r4
_0804F396:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, #0x10
	ldr r1, [sp, #0x10]
	adds r5, r1, r0
	ldrb r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F458
	ldr r0, [r5, #0x18]
	mov r2, sb
	subs r0, r0, r2
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x14]
	mov r3, sl
	subs r1, r1, r3
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	ldr r4, _0804F478 @ =0xFED30000
	adds r0, r0, r4
	movs r1, #0xd3
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0804F3DC
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0804F430
_0804F3DC:
	ldr r4, [r5, #0x1c]
	adds r7, r4, #0
	adds r7, #0xa
	movs r0, #1
	strb r0, [r5, #6]
	str r7, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	mov r1, r8
	str r1, [sp]
	movs r1, #0xb0
	lsls r1, r1, #5
	add r1, sl
	adds r2, r7, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x18]
	adds r4, #0xaa
	mov r2, r8
	str r2, [sp]
	mov r1, sb
	adds r2, r4, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5, #0x18]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	movs r4, #0x5a
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0xe]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0x10]
_0804F430:
	adds r0, r5, #0
	adds r0, #0x20
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	mov r4, sl
	asrs r3, r4, #8
	adds r3, #0x10
	str r3, [sp]
	mov r4, sb
	asrs r3, r4, #8
	str r3, [sp, #4]
	ldr r3, [sp, #0x14]
	bl sub_804EF68
	cmp r0, #1
	bne _0804F458
	movs r0, #0
	strb r0, [r5, #4]
_0804F458:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0804F396
_0804F462:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F474: .4byte gCamera
_0804F478: .4byte 0xFED30000

	thumb_func_start sub_804F47C
sub_804F47C: @ 0x0804F47C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #6]
	subs r0, #1
	strh r0, [r7, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F496
	ldr r0, _0804F594 @ =sub_8050DC8
	str r0, [r7]
_0804F496:
	ldr r0, _0804F598 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1
	ldr r3, _0804F59C @ =IWRAM_START + 0x1C
	adds r2, r0, r3
	ldr r4, _0804F5A0 @ =IWRAM_START + 0x48
	adds r3, r0, r4
	movs r0, #0xc
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0804F588
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	lsls r0, r0, #8
	ldr r1, [r2, #0x24]
	adds r5, r1, r0
	movs r4, #0x22
	ldrsh r0, [r2, r4]
	lsls r0, r0, #8
	ldr r1, [r2, #0x28]
	adds r6, r1, r0
	ldr r1, [r3, #0x44]
	asrs r1, r1, #8
	ldrh r3, [r3, #0x3a]
	adds r1, r1, r3
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	add r1, sb
	ldr r2, _0804F5A4 @ =0x000003FF
	mov ip, r2
	mov r3, ip
	ands r1, r3
	ldr r4, _0804F5A8 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r2, r0, r4
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r5, r5, r0
	lsls r0, r1, #1
	adds r2, r0, r4
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	adds r6, r6, r0
	add r1, sb
	mov r2, ip
	ands r1, r2
	adds r3, r1, r3
	lsls r3, r3, #1
	adds r3, r3, r4
	movs r2, #0
	ldrsh r0, [r3, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r5, r5, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	adds r6, r6, r0
	asrs r0, r5, #8
	ldr r2, _0804F5AC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r4, r8
	strh r0, [r4, #0x16]
	asrs r0, r6, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
	ldrh r0, [r7, #6]
	movs r1, #0xa
	bl Mod
	cmp r0, #0
	bne _0804F588
	ldrh r0, [r7, #6]
	cmp r0, #0x64
	bhi _0804F588
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _0804F588
	subs r0, #1
	strb r0, [r7, #4]
	ldr r0, _0804F5B0 @ =0x0000010F
	bl m4aSongNumStart
	ldr r1, _0804F5B4 @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0
	beq _0804F588
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0804F5B8 @ =0xFFFFF800
	adds r0, r5, r1
	adds r1, r6, #0
	bl sub_804DEEC
_0804F588:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F594: .4byte sub_8050DC8
_0804F598: .4byte gCurTask
_0804F59C: .4byte IWRAM_START + 0x1C
_0804F5A0: .4byte IWRAM_START + 0x48
_0804F5A4: .4byte 0x000003FF
_0804F5A8: .4byte gSineTable
_0804F5AC: .4byte gCamera
_0804F5B0: .4byte 0x0000010F
_0804F5B4: .4byte gCourseTime
_0804F5B8: .4byte 0xFFFFF800

	thumb_func_start sub_804F5BC
sub_804F5BC: @ 0x0804F5BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0x94
	lsls r0, r0, #1
	adds r7, r6, r0
	movs r1, #0
	mov r8, r1
	mov sl, r1
	ldr r2, _0804F6A8 @ =gCamera
	mov sb, r2
_0804F5D8:
	adds r0, r6, #0
	adds r0, #0xe
	mov r3, r8
	adds r2, r0, r3
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804F68A
	adds r1, r6, #0
	adds r1, #0x1e
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0804F5FC
	strb r0, [r2]
_0804F5FC:
	mov r0, r8
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x70
	adds r4, r0, r2
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	adds r0, r6, #0
	adds r0, #0x74
	adds r5, r0, r2
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	mov r0, sl
	cmp r0, #0
	bne _0804F632
	movs r1, #1
	mov sl, r1
	adds r0, r7, #0
	bl sub_8004558
_0804F632:
	adds r0, r7, #0
	bl sub_80051E8
	ldr r1, [r4]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r4]
	mov r3, r8
	lsls r2, r3, #2
	adds r0, r6, #0
	adds r0, #0x2e
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	bl sub_802C6E4
	movs r1, #0x82
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0804F68A
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r2, [r5]
	asrs r2, r2, #8
	adds r0, r7, #0
	movs r3, #0
	bl sub_804F010
	cmp r0, #1
	bne _0804F68A
	bl sub_802BA8C
_0804F68A:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bls _0804F5D8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F6A8: .4byte gCamera

	thumb_func_start sub_804F6AC
sub_804F6AC: @ 0x0804F6AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	ldr r0, _0804F740 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F744 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	lsls r3, r3, #0x16
	lsrs r5, r3, #0x16
	movs r3, #0
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	lsls r0, r0, #1
	ldr r6, _0804F748 @ =gSineTable
	adds r0, r0, r6
	mov sl, r0
_0804F6DE:
	mov r0, ip
	adds r0, #0xe
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804F750
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0]
	lsls r2, r3, #2
	mov r1, ip
	adds r1, #0x2e
	adds r1, r1, r2
	mov r7, sl
	movs r6, #0
	ldrsh r0, [r7, r6]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	mov r1, ip
	adds r1, #0x30
	adds r1, r1, r2
	lsls r0, r5, #1
	ldr r7, _0804F748 @ =gSineTable
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r4, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	lsls r1, r3, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r6, r8
	str r6, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r7, sb
	str r7, [r0]
	ldr r0, _0804F74C @ =0x00000129
	bl m4aSongNumStart
	b _0804F75A
	.align 2, 0
_0804F740: .4byte gCurTask
_0804F744: .4byte IWRAM_START + 0x654
_0804F748: .4byte gSineTable
_0804F74C: .4byte 0x00000129
_0804F750:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0804F6DE
_0804F75A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_804F768
sub_804F768: @ 0x0804F768
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	ldr r0, _0804F7B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F7B4 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r4, #0
	ldr r3, _0804F7B8 @ =IWRAM_START + 0x662
	adds r5, r0, r3
	ldr r7, _0804F7BC @ =gSineTable
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
_0804F78C:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F838
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0804F7C0
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #1
	mov r2, ip
	ldrh r2, [r2, #0xc]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, r1, #0
	b _0804F7D0
	.align 2, 0
_0804F7B0: .4byte gCurTask
_0804F7B4: .4byte IWRAM_START + 0x654
_0804F7B8: .4byte IWRAM_START + 0x662
_0804F7BC: .4byte gSineTable
_0804F7C0:
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #1
	mov r3, ip
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0804F7D0:
	ldr r1, _0804F834 @ =0x000003FF
	adds r0, r1, #0
	ands r3, r0
	adds r1, r5, r4
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x2e
	adds r1, r1, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	mov r1, ip
	adds r1, #0x30
	adds r1, r1, r2
	lsls r0, r3, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	strh r0, [r1]
	lsls r1, r4, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r3, r8
	str r3, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r5, sb
	str r5, [r0]
	movs r0, #0xf3
	bl m4aSongNumStart
	b _0804F842
	.align 2, 0
_0804F834: .4byte 0x000003FF
_0804F838:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0804F78C
_0804F842:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804F850
sub_804F850: @ 0x0804F850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r0, _0804F8C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F8C8 @ =IWRAM_START + 0x654
	adds r4, r0, r1
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r7, _0804F8CC @ =IWRAM_START + 0x662
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804F886:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804F8AA
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804F886
_0804F8AA:
	cmp r3, #8
	bne _0804F8B0
	movs r5, #1
_0804F8B0:
	cmp r5, #0
	beq _0804F9A2
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804F8D0
	adds r0, r6, #0
	adds r0, #0x3c
	b _0804F8D4
	.align 2, 0
_0804F8C4: .4byte gCurTask
_0804F8C8: .4byte IWRAM_START + 0x654
_0804F8CC: .4byte IWRAM_START + 0x662
_0804F8D0:
	adds r0, r6, #0
	subs r0, #0x3c
_0804F8D4:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0804F9B4 @ =0x000003FF
	ands r6, r0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0xe
	str r0, [sp, #0x10]
	adds r1, r4, #0
	adds r1, #0x1e
	str r1, [sp, #0x14]
	adds r2, r4, #0
	adds r2, #0x2e
	str r2, [sp, #0x18]
	adds r7, r4, #0
	adds r7, #0x30
	str r7, [sp, #0x1c]
	movs r0, #0x70
	adds r0, r0, r4
	mov sl, r0
	adds r4, #0x74
	mov sb, r4
	movs r1, #0x80
	lsls r1, r1, #1
	mov ip, r1
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r2, _0804F9B8 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	mov r8, r0
_0804F91A:
	mov r7, sp
	adds r0, r7, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r4, [sp, #0x14]
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r3, r2, #2
	ldr r7, [sp, #0x18]
	adds r4, r7, r3
	mov r0, r8
	strh r0, [r4]
	ldr r1, [sp, #0x1c]
	adds r3, r1, r3
	lsls r0, r6, #1
	ldr r7, _0804F9B8 @ =gSineTable
	adds r0, r0, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r0, r5, #7
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _0804F9B8 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	lsls r0, r5, #8
	ldr r4, _0804F9B8 @ =gSineTable
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r2, r2, #3
	mov r4, sl
	adds r0, r4, r2
	ldr r7, [sp, #8]
	str r7, [r0]
	add r2, sb
	ldr r0, [sp, #0xc]
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804F91A
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804F9A2:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9B4: .4byte 0x000003FF
_0804F9B8: .4byte gSineTable

	thumb_func_start sub_804F9BC
sub_804F9BC: @ 0x0804F9BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r0, _0804F9FC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FA00 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r5, #0
	ldr r3, _0804FA04 @ =IWRAM_START + 0x662
	adds r2, r0, r3
	ldr r6, _0804FA08 @ =gSineTable
_0804F9DC:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FA8C
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0804FA0C
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r7, ip
	ldrh r7, [r7, #0xc]
	adds r0, r0, r7
	b _0804FA18
	.align 2, 0
_0804F9FC: .4byte gCurTask
_0804FA00: .4byte IWRAM_START + 0x654
_0804FA04: .4byte IWRAM_START + 0x662
_0804FA08: .4byte gSineTable
_0804FA0C:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	mov r3, ip
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
_0804FA18:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r7, _0804FA84 @ =0x000003FF
	adds r0, r7, #0
	ands r4, r0
	adds r1, r2, r5
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	lsls r3, r5, #2
	mov r2, ip
	adds r2, #0x2e
	adds r2, r2, r3
	adds r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
	mov r2, ip
	adds r2, #0x30
	adds r2, r2, r3
	lsls r0, r4, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
	lsls r1, r5, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r7, sb
	str r7, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	ldr r0, _0804FA88 @ =0x00000115
	bl m4aSongNumStart
	b _0804FA96
	.align 2, 0
_0804FA84: .4byte 0x000003FF
_0804FA88: .4byte 0x00000115
_0804FA8C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804F9DC
_0804FA96:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804FAA4
sub_804FAA4: @ 0x0804FAA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0804FB18 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FB1C @ =IWRAM_START + 0x654
	adds r4, r0, r1
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x16
	mov ip, r3
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r6, _0804FB20 @ =IWRAM_START + 0x662
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804FADC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FB00
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FADC
_0804FB00:
	cmp r3, #8
	bne _0804FB06
	movs r5, #1
_0804FB06:
	cmp r5, #0
	beq _0804FBFC
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FB24
	mov r0, ip
	adds r0, #0x46
	b _0804FB28
	.align 2, 0
_0804FB18: .4byte gCurTask
_0804FB1C: .4byte IWRAM_START + 0x654
_0804FB20: .4byte IWRAM_START + 0x662
_0804FB24:
	mov r0, ip
	subs r0, #0x46
_0804FB28:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _0804FB88 @ =0x000003FF
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r7, #0
	adds r2, r4, #0
	adds r2, #0xe
	str r2, [sp, #0x10]
	adds r3, r4, #0
	adds r3, #0x1e
	str r3, [sp, #0x14]
	adds r6, r4, #0
	adds r6, #0x2e
	str r6, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x30
	str r1, [sp, #0x1c]
	movs r2, #0x70
	adds r2, r2, r4
	mov sl, r2
	adds r4, #0x74
	mov sb, r4
	ldr r3, _0804FB8C @ =gSineTable
	mov r8, r3
_0804FB5E:
	mov r6, sp
	adds r0, r6, r7
	ldrb r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r6
	movs r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	cmp r7, #3
	bhi _0804FB90
	lsls r0, r7, #4
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r5, r0, #4
	b _0804FBA4
	.align 2, 0
_0804FB88: .4byte 0x000003FF
_0804FB8C: .4byte gSineTable
_0804FB90:
	subs r0, r7, #4
	lsls r1, r0, #4
	mov r3, ip
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x14
	lsrs r5, r1, #0x10
_0804FBA4:
	ldr r0, _0804FC0C @ =0x000003FF
	ands r4, r0
	lsls r2, r6, #2
	ldr r1, [sp, #0x18]
	adds r3, r1, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r5
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	ldr r3, [sp, #0x1c]
	adds r2, r3, r2
	lsls r0, r4, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2]
	lsls r1, r6, #3
	mov r6, sl
	adds r0, r6, r1
	ldr r2, [sp, #8]
	str r2, [r0]
	add r1, sb
	ldr r3, [sp, #0xc]
	str r3, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _0804FB5E
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804FBFC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC0C: .4byte 0x000003FF

	thumb_func_start sub_804FC10
sub_804FC10: @ 0x0804FC10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x10]
	ldr r0, _0804FC88 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FC8C @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r6, #0
_0804FC34:
	mov r1, sp
	movs r4, #0
	movs r3, #0
	movs r2, #0
	mov r5, ip
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _0804FC4A
	strb r4, [r1]
	adds r1, #1
	movs r3, #1
_0804FC4A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FC6E
	mov r0, ip
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FC4A
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FC4A
_0804FC6E:
	cmp r3, #8
	bne _0804FC74
	movs r4, #1
_0804FC74:
	cmp r4, #0
	beq _0804FD40
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FC90
	ldr r0, [sp, #0x10]
	adds r0, #0x28
	b _0804FC94
	.align 2, 0
_0804FC88: .4byte gCurTask
_0804FC8C: .4byte IWRAM_START + 0x654
_0804FC90:
	ldr r0, [sp, #0x10]
	subs r0, #0x28
_0804FC94:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0804FD50 @ =0x000003FF
	ands r2, r0
	movs r5, #0
	mov r0, ip
	adds r0, #0xe
	str r0, [sp, #0x1c]
	mov r1, ip
	adds r1, #0x1e
	str r1, [sp, #0x20]
	mov r3, ip
	adds r3, #0x2e
	str r3, [sp, #0x14]
	movs r0, #0x30
	add r0, ip
	mov sl, r0
	movs r1, #0x70
	add r1, ip
	mov sb, r1
	movs r3, #0x74
	add r3, ip
	mov r8, r3
	adds r6, #1
	str r6, [sp, #0x18]
	ldr r1, _0804FD54 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r7, [r0, r3]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r6, [r0, r1]
_0804FCDE:
	mov r3, sp
	adds r0, r3, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x1c]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, [sp, #0x20]
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r5, #6
	lsls r3, r2, #2
	ldr r1, [sp, #0x14]
	adds r4, r1, r3
	movs r1, #0x80
	lsls r1, r1, #3
	subs r1, r1, r0
	adds r0, r7, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r4]
	add r3, sl
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	lsls r2, r2, #3
	mov r3, sb
	adds r0, r3, r2
	ldr r1, [sp, #8]
	str r1, [r0]
	add r2, r8
	ldr r3, [sp, #0xc]
	str r3, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804FCDE
	ldr r5, [sp, #0x18]
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bhi _0804FD3A
	b _0804FC34
_0804FD3A:
	movs r0, #0x9c
	bl m4aSongNumStart
_0804FD40:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD50: .4byte 0x000003FF
_0804FD54: .4byte gSineTable

	thumb_func_start sub_804FD58
sub_804FD58: @ 0x0804FD58
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r0, _0804FDF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FDF8 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r5, #0
	ldr r6, _0804FDFC @ =gSineTable
_0804FD74:
	mov r0, ip
	adds r0, #0xe
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804FE0C
	ldr r0, _0804FE00 @ =gUnknown_080D8EE0
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r2, r2, #5
	ldr r3, _0804FE04 @ =0x0000FFC0
	adds r2, r2, r3
	mov r7, ip
	ldrh r7, [r7, #0xc]
	adds r2, r2, r7
	lsls r2, r2, #0x16
	lsrs r2, r2, #0x16
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	lsls r4, r5, #2
	mov r3, ip
	adds r3, #0x2e
	adds r3, r3, r4
	adds r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	mov r3, ip
	adds r3, #0x30
	adds r3, r3, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r1, r5, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r2, sb
	str r2, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r3, r8
	str r3, [r0]
	ldr r0, _0804FE08 @ =0x0000011F
	bl m4aSongNumStart
	b _0804FE16
	.align 2, 0
_0804FDF4: .4byte gCurTask
_0804FDF8: .4byte IWRAM_START + 0x654
_0804FDFC: .4byte gSineTable
_0804FE00: .4byte gUnknown_080D8EE0
_0804FE04: .4byte 0x0000FFC0
_0804FE08: .4byte 0x0000011F
_0804FE0C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804FD74
_0804FE16:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804FE24
sub_804FE24: @ 0x0804FE24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804FED4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FED8 @ =IWRAM_START + 0x1C
	adds r6, r0, r1
	ldrh r0, [r5, #8]
	subs r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804FE9A
	ldr r0, _0804FEDC @ =sub_804FEFC
	str r0, [r5]
	movs r0, #0x65
	strh r0, [r5, #8]
	ldr r2, _0804FEE0 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0804FEE4 @ =0x00196225
	muls r0, r1, r0
	ldr r3, _0804FEE8 @ =0x3C6EF35F
	adds r0, r0, r3
	str r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0804FEEC @ =gUnknown_080D89AC
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r5, #4]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r4, r5, r1
	ldr r2, _0804FEF0 @ =gUnknown_080D89C8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r2, [r1, #6]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r5, r3
	strb r2, [r0]
	ldrb r0, [r1, #8]
	ldr r2, _0804FEF4 @ =0x0000014D
	adds r1, r5, r2
	strb r0, [r1]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
_0804FE9A:
	adds r4, r5, #0
	adds r4, #0xf0
	ldr r0, [r6, #0x24]
	asrs r0, r0, #8
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	ldr r2, _0804FEF8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r6, #0x28]
	asrs r0, r0, #8
	ldrh r6, [r6, #0x22]
	adds r0, r0, r6
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #0
	bl sub_804F5BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FED4: .4byte gCurTask
_0804FED8: .4byte IWRAM_START + 0x1C
_0804FEDC: .4byte sub_804FEFC
_0804FEE0: .4byte gUnknown_030053B8
_0804FEE4: .4byte 0x00196225
_0804FEE8: .4byte 0x3C6EF35F
_0804FEEC: .4byte gUnknown_080D89AC
_0804FEF0: .4byte gUnknown_080D89C8
_0804FEF4: .4byte 0x0000014D
_0804FEF8: .4byte gCamera

	thumb_func_start sub_804FEFC
sub_804FEFC: @ 0x0804FEFC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0804FF90 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FF94 @ =IWRAM_START + 0x1C
	adds r4, r0, r1
	ldrh r0, [r7, #8]
	subs r0, #1
	strh r0, [r7, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804FF22
	ldr r0, _0804FF98 @ =sub_804FF9C
	str r0, [r7]
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #8]
_0804FF22:
	ldrh r0, [r7, #8]
	movs r1, #6
	bl Mod
	cmp r0, #0
	bne _0804FF80
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r6, [r4, #0x24]
	adds r6, r6, r0
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r5, [r4, #0x28]
	adds r5, r5, r0
	ldr r0, [sp, #4]
	subs r0, r0, r5
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	subs r1, r1, r6
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r7, #0xa]
	ldrh r1, [r7, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r2, r1, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r7, #0xa]
	ldr r4, [r7, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r4
_0804FF80:
	adds r0, r7, #0
	bl sub_804F5BC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF90: .4byte gCurTask
_0804FF94: .4byte IWRAM_START + 0x1C
_0804FF98: .4byte sub_804FF9C

	thumb_func_start sub_804FF9C
sub_804FF9C: @ 0x0804FF9C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0805001C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050020 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805000C
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r0, _08050024 @ =0x000002CD
	strh r0, [r1, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08050028 @ =0x00000111
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	add r1, sp, #4
	mov r0, sp
	bl sub_802C668
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	ldr r2, [r5, #0x24]
	adds r2, r2, r0
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	ldr r1, [r5, #0x28]
	adds r1, r1, r0
	ldr r0, [sp, #4]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0xc]
	ldr r0, _0805002C @ =sub_804FE24
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
_0805000C:
	adds r0, r4, #0
	bl sub_804F5BC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805001C: .4byte gCurTask
_08050020: .4byte IWRAM_START + 0x1C
_08050024: .4byte 0x000002CD
_08050028: .4byte 0x00000111
_0805002C: .4byte sub_804FE24

	thumb_func_start sub_8050030
sub_8050030: @ 0x08050030
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	mov ip, r0
	adds r4, r6, #4
	movs r1, #0x3a
	adds r1, r1, r6
	mov r8, r1
	ldrh r3, [r6, #0x2e]
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r5, [r6, #0x30]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050062
	movs r1, #1
	mov sl, r1
_08050062:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r7, _080500FC @ =0x00000FFF
	ands r7, r5
	ands r2, r1
	ldrh r0, [r6, #0x2c]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _080500B0
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050080:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08050080
	adds r4, r2, #0
_080500B0:
	movs r5, #0
	lsls r7, r7, #0x10
_080500B4:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r7, #0x10
	bl sub_80859F4
	mov r1, r8
	strh r0, [r1]
	movs r3, #2
	add r8, r3
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080500B4
	ldrh r0, [r6, #0x2c]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x2c]
	ldrh r1, [r6, #0x2c]
	ldr r0, [r6, #0x30]
	adds r0, r0, r1
	ldr r1, _08050100 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x30]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080500FC: .4byte 0x00000FFF
_08050100: .4byte 0x00007FFF

	thumb_func_start sub_8050104
sub_8050104: @ 0x08050104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	mov ip, r0
	adds r4, r6, #4
	adds r7, r6, #0
	adds r7, #0x20
	ldrh r1, [r6, #0x16]
	mov sb, r1
	movs r3, #0
	mov sl, r3
	ldr r5, [r6, #0x18]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050134
	movs r0, #1
	mov sl, r0
_08050134:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r0, _080501CC @ =0x00000FFF
	mov r8, r0
	ands r0, r5
	mov r8, r0
	ands r2, r1
	ldrh r0, [r6, #0x14]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _08050186
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050156:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050156
	adds r4, r2, #0
_08050186:
	movs r5, #0
_08050188:
	lsls r0, r5, #3
	adds r0, r4, r0
	mov r1, r8
	bl sub_8085968
	strh r0, [r7]
	adds r7, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050188
	ldrh r0, [r6, #0x14]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x14]
	ldrh r1, [r6, #0x14]
	ldr r0, [r6, #0x18]
	adds r0, r0, r1
	ldr r1, _080501D0 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x18]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080501CC: .4byte 0x00000FFF
_080501D0: .4byte 0x00007FFF

	thumb_func_start sub_80501D4
sub_80501D4: @ 0x080501D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	mov r6, r8
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _08050298
	ldr r2, _08050248 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r1, r0
	strh r1, [r2]
	mov r3, r8
	ldrb r4, [r3, #0xf]
	cmp r4, #0
	bne _0805026C
	ldr r5, _0805024C @ =0x000007B4
	add r5, r8
	ldr r0, [r5, #4]
	bl VramFree
	movs r0, #0x2a
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _08050250 @ =0x00000317
	strh r0, [r5, #0xa]
	ldr r0, _08050254 @ =0x000007D4
	add r0, r8
	strb r1, [r0]
	ldr r1, _08050258 @ =0x000007D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _0805025C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050260 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08050264 @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050268 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	movs r0, #1
	mov r4, r8
	strb r0, [r4, #0xf]
	b _0805027A
	.align 2, 0
_08050248: .4byte gUnknown_03005424
_0805024C: .4byte 0x000007B4
_08050250: .4byte 0x00000317
_08050254: .4byte 0x000007D4
_08050258: .4byte 0x000007D5
_0805025C: .4byte gDispCnt
_08050260: .4byte 0x00007FFF
_08050264: .4byte gWinRegs
_08050268: .4byte gBldRegs
_0805026C:
	mov r7, r8
	ldrb r0, [r7, #0xc]
	cmp r0, #0
	beq _0805027A
	ldr r0, _0805028C @ =0x0000FFDF
	ands r1, r0
	strh r1, [r2]
_0805027A:
	mov r0, r8
	ldrh r1, [r0, #0x10]
	ldr r0, _08050290 @ =0x0000FFFE
	ands r0, r1
	mov r1, r8
	strh r0, [r1, #0x10]
	ldr r3, _08050294 @ =gUnknown_03005424
	b _080502A4
	.align 2, 0
_0805028C: .4byte 0x0000FFDF
_08050290: .4byte 0x0000FFFE
_08050294: .4byte gUnknown_03005424
_08050298:
	ldr r0, _080502BC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	strh r1, [r0]
	adds r3, r0, #0
_080502A4:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080502C8
	ldr r2, _080502C0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080502C4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	b _080502D6
	.align 2, 0
_080502BC: .4byte gUnknown_03005424
_080502C0: .4byte gDispCnt
_080502C4: .4byte 0x0000FBFF
_080502C8:
	ldr r0, _0805057C @ =gDispCnt
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r0]
_080502D6:
	ldrh r1, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080502EA
	b _0805056C
_080502EA:
	movs r7, #0x20
	ldrsh r0, [r6, r7]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r2, [sp, #0x10]
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	ldrh r3, [r2, #0x3a]
	adds r7, r0, r3
	ldr r1, _08050580 @ =0x000003FF
	adds r0, r1, #0
	ands r7, r0
	ldr r3, _08050584 @ =gSineTable
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r3, sl
	asrs r1, r3, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _08050590 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r0, _08050594 @ =0x000007C4
	add r0, r8
	str r5, [r0]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r0, [sp, #0x10]
	adds r0, #0x3a
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	adds r1, #0x42
	str r1, [sp, #0x24]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_08050392:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050392
	ldr r6, _08050584 @ =gSineTable
	ldr r0, _08050598 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, _0805059C @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r3]
	mov r0, r8
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080503FA
	ldr r5, _080505A0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	mov r4, sp
	ldrh r4, [r4, #0x18]
	strh r4, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_080503FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _080505A4 @ =0xFFFFFF00
	adds r1, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805042A:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _08050584 @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _08050588 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x1c]
	ldr r1, _08050584 @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080505AC @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805042A
	ldr r1, _08050584 @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080505B0 @ =0x000008BC
	add r5, r8
	ldr r6, _080505B4 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x24]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050580 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _0805058C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080505AC @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_0805056C:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805057C: .4byte gDispCnt
_08050580: .4byte 0x000003FF
_08050584: .4byte gSineTable
_08050588: .4byte gUnknown_080D89A5
_0805058C: .4byte gCamera
_08050590: .4byte gBgAffineRegs
_08050594: .4byte 0x000007C4
_08050598: .4byte gUnknown_03005590
_0805059C: .4byte 0x000001FF
_080505A0: .4byte 0x000007B4
_080505A4: .4byte 0xFFFFFF00
_080505A8: .4byte 0x00002060
_080505AC: .4byte gUnknown_030054B8
_080505B0: .4byte 0x000008BC
_080505B4: .4byte 0x000008F4

	thumb_func_start sub_80505B8
sub_80505B8: @ 0x080505B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r8, r0
	mov r6, r8
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r4, [r0]
	cmp r4, #0
	bne _08050606
	movs r5, #0xf7
	lsls r5, r5, #3
	add r5, r8
	ldr r0, [r5]
	cmp r0, #0
	beq _080505FC
	bl VramFree
	str r4, [r5]
	ldr r2, _08050884 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050888 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0805088C @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050890 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
_080505FC:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	ldr r0, _08050894 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0x10]
_08050606:
	movs r3, #0x20
	ldrsh r0, [r6, r3]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r4, #0x22
	ldrsh r0, [r6, r4]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r7, [sp, #0x10]
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r7, r0, r1
	ldr r2, _08050898 @ =0x000003FF
	adds r0, r2, #0
	ands r7, r0
	ldr r4, _0805089C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r7, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080508A0 @ =gUnknown_080D89A5
	ldrb r3, [r0]
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r3, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r3, _080508A4 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r4, sl
	asrs r1, r4, #8
	ldr r0, [r3, #4]
	subs r6, r1, r0
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _080508A8 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r2, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r1, _080508AC @ =0x000007C4
	add r1, r8
	movs r0, #0
	str r0, [r1]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r2, [sp, #0x10]
	adds r2, #0x3a
	str r2, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	adds r0, #0x42
	str r0, [sp, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_080506AE:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080506AE
	ldrb r2, [r3]
	mov r0, r8
	movs r1, #0xff
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080506FA
	ldr r5, _080508B0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	strh r6, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_080506FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0805089C @ =gSineTable
	ldr r4, _080508B4 @ =0xFFFFFF00
	adds r1, r7, r4
	ldr r0, _08050898 @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805072C:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x1c]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050898 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _0805089C @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _080508A0 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x18]
	ldr r1, _0805089C @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080508B8 @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805072C
	ldr r1, _0805089C @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080508A0 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080508BC @ =0x000008BC
	add r5, r8
	ldr r6, _080508C0 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x20]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050898 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080508B8 @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050884: .4byte gDispCnt
_08050888: .4byte 0x00007FFF
_0805088C: .4byte gWinRegs
_08050890: .4byte gBldRegs
_08050894: .4byte 0x0000FFFE
_08050898: .4byte 0x000003FF
_0805089C: .4byte gSineTable
_080508A0: .4byte gUnknown_080D89A5
_080508A4: .4byte gCamera
_080508A8: .4byte gBgAffineRegs
_080508AC: .4byte 0x000007C4
_080508B0: .4byte 0x000007B4
_080508B4: .4byte 0xFFFFFF00
_080508B8: .4byte gUnknown_030054B8
_080508BC: .4byte 0x000008BC
_080508C0: .4byte 0x000008F4

	thumb_func_start sub_80508C4
sub_80508C4: @ 0x080508C4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _08050938
	ldr r2, _08050940 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08050944 @ =gWinRegs
	ldr r0, _08050948 @ =0x00003735
	strh r0, [r1, #0xa]
	ldr r3, _0805094C @ =gBldRegs
	ldr r0, _08050950 @ =0x00001346
	strh r0, [r3]
	lsls r1, r4, #1
	adds r1, r1, r4
	asrs r1, r1, #8
	adds r1, #0xa
	movs r2, #0xf
	ands r1, r2
	lsls r0, r4, #2
	adds r0, r0, r4
	asrs r0, r0, #8
	adds r0, #8
	ands r0, r2
	lsls r1, r1, #8
	orrs r1, r0
	strh r1, [r3, #2]
	strh r1, [r3, #4]
	ldr r0, _08050954 @ =0x000007B4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2, #0x10]
	movs r3, #0
	movs r4, #0xfe
	lsls r4, r4, #3
_0805091E:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	orrs r0, r1
	str r0, [r2, #0x10]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0805091E
_08050938:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050940: .4byte gDispCnt
_08050944: .4byte gWinRegs
_08050948: .4byte 0x00003735
_0805094C: .4byte gBldRegs
_08050950: .4byte 0x00001346
_08050954: .4byte 0x000007B4

	thumb_func_start sub_8050958
sub_8050958: @ 0x08050958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08050A5C
	subs r0, #1
	strb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080509B0
	movs r5, #0
	ldr r0, _080509A0 @ =gFlags
	mov sl, r0
	ldr r6, _080509A4 @ =gObjPalette
	ldr r4, _080509A8 @ =gUnknown_080D8F10
	ldr r3, _080509AC @ =gBgPalette
_08050980:
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r2, r5, #1
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, r2, r3
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050980
	b _08050A4C
	.align 2, 0
_080509A0: .4byte gFlags
_080509A4: .4byte gObjPalette
_080509A8: .4byte gUnknown_080D8F10
_080509AC: .4byte gBgPalette
_080509B0:
	ldr r0, _080509F8 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r6, r0, #1
	movs r0, #0xf
	ands r6, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _08050A0C
	movs r5, #0
	ldr r1, _080509FC @ =gFlags
	mov sl, r1
	ldr r0, _08050A00 @ =gObjPalette
	mov ip, r0
	movs r7, #0xf
	ldr r4, _08050A04 @ =gUnknown_080D8EF0
	ldr r3, _08050A08 @ =gBgPalette
_080509D0:
	adds r1, r5, r6
	ands r1, r7
	adds r2, r1, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r0, r0, #5
	strh r0, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080509D0
	b _08050A4C
	.align 2, 0
_080509F8: .4byte gUnknown_03005590
_080509FC: .4byte gFlags
_08050A00: .4byte gObjPalette
_08050A04: .4byte gUnknown_080D8EF0
_08050A08: .4byte gBgPalette
_08050A0C:
	movs r5, #0
	ldr r1, _08050A6C @ =gFlags
	mov sl, r1
	ldr r0, _08050A70 @ =gObjPalette
	mov sb, r0
	ldr r1, _08050A74 @ =gUnknown_080D8EF0
	mov r8, r1
	ldr r0, _08050A78 @ =gBgPalette
	mov ip, r0
	movs r7, #0xf
_08050A20:
	adds r3, r5, r6
	ands r3, r7
	adds r4, r3, #0
	adds r4, #0x80
	lsls r4, r4, #1
	add r4, sb
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r2, r1, #5
	lsrs r0, r1, #5
	orrs r2, r0
	orrs r2, r1
	strh r2, [r4]
	lsls r3, r3, #1
	add r3, ip
	strh r2, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050A20
_08050A4C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	str r0, [r1]
_08050A5C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A6C: .4byte gFlags
_08050A70: .4byte gObjPalette
_08050A74: .4byte gUnknown_080D8EF0
_08050A78: .4byte gBgPalette

	thumb_func_start sub_8050A7C
sub_8050A7C: @ 0x08050A7C
	push {r4, r5, r6, r7, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _08050B1C @ =gIntrTable+8
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08050A94
	bl VramFree
_08050A94:
	movs r4, #0
	ldr r0, _08050B20 @ =IWRAM_START + 0xCC
	adds r7, r5, r0
	ldr r1, _08050B24 @ =gIntrMainBuf + 4
	adds r5, r5, r1
_08050A9E:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050A9E
	movs r4, #0
_08050AB8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r7, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08050AB8
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xad
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08050B28 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050B1C: .4byte gIntrTable + 8
_08050B20: .4byte IWRAM_START + 0xCC
_08050B24: .4byte gIntrMainBuf + 4
_08050B28: .4byte gUnknown_03005B4C

	thumb_func_start sub_8050B2C
sub_8050B2C: @ 0x08050B2C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08050B40 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	bne _08050B44
	str r0, [r6]
	str r0, [r7]
	b _08050BA2
	.align 2, 0
_08050B40: .4byte gUnknown_03005B4C
_08050B44:
	ldrh r1, [r0, #6]
	ldr r0, _08050BA8 @ =IWRAM_START + 0x1C
	adds r1, r1, r0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r3, [r1, #0x24]
	adds r3, r3, r0
	movs r5, #0x22
	ldrsh r0, [r1, r5]
	lsls r0, r0, #8
	ldr r2, [r1, #0x28]
	adds r2, r2, r0
	ldr r4, _08050BAC @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r2, r2, r0
	movs r5, #0x26
	adds r0, r1, #0
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r2, r2, r0
	str r3, [r6]
	str r2, [r7]
_08050BA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050BA8: .4byte IWRAM_START + 0x1C
_08050BAC: .4byte gSineTable

	thumb_func_start sub_8050BB0
sub_8050BB0: @ 0x08050BB0
	push {lr}
	movs r2, #0
	ldr r0, _08050BD4 @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _08050BCC
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08050BCC
	movs r2, #1
_08050BCC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08050BD4: .4byte gUnknown_03005B4C

	thumb_func_start sub_8050BD8
sub_8050BD8: @ 0x08050BD8
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BE4
sub_8050BE4: @ 0x08050BE4
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BF0
sub_8050BF0: @ 0x08050BF0
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BFC
sub_8050BFC: @ 0x08050BFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08050C20
	ldr r0, [r4, #0x30]
	ldr r1, _08050C44 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r1, _08050C48 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x24]
	str r0, [r4]
	ldr r0, [r1, #0x28]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #0x2c]
	strh r0, [r4, #0x2e]
_08050C20:
	ldr r1, [r4, #0x30]
	ldr r0, _08050C4C @ =0x00001FFF
	cmp r1, r0
	bls _08050C3C
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, [r4, #0x48]
	subs r1, #0x57
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x44]
_08050C3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C44: .4byte 0x00000FFF
_08050C48: .4byte gUnknown_080D8D6C
_08050C4C: .4byte 0x00001FFF

	thumb_func_start sub_8050C50
sub_8050C50: @ 0x08050C50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08050CA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CAC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	adds r1, #0x57
	str r1, [r4, #0x48]
	cmp r1, #0
	bne _08050CA2
	ldr r2, _08050CB0 @ =0x00000FFF
	str r1, [r4, #0x30]
	ldr r1, _08050CB4 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r1, _08050CB8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r5]
	ldr r0, [r1, #4]
	str r0, [r5, #0x1c]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x16]
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStop
_08050CA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050CA8: .4byte gCurTask
_08050CAC: .4byte IWRAM_START + 0x1C
_08050CB0: .4byte 0x00000FFF
_08050CB4: .4byte gUnknown_080D8D6C
_08050CB8: .4byte gUnknown_080D8DCC

	thumb_func_start sub_8050CBC
sub_8050CBC: @ 0x08050CBC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050CE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CEC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050CF0 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08050CF4
	ldr r0, [r5, #0x24]
	subs r0, #0xc0
	str r0, [r5, #0x24]
	b _08050D12
	.align 2, 0
_08050CE8: .4byte gCurTask
_08050CEC: .4byte IWRAM_START + 0x1C
_08050CF0: .4byte IWRAM_START + 0x558
_08050CF4:
	cmp r0, #3
	bne _08050D12
	ldr r0, _08050D18 @ =0x00000FFF
	ands r1, r0
	str r1, [r4, #0x30]
	ldr r0, _08050D1C @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x48]
	str r1, [r4]
	ldr r1, [r0, #0x4c]
	str r1, [r4, #0x34]
	adds r0, #0x50
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, _08050D20 @ =sub_804F108
	str r0, [r6]
_08050D12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D18: .4byte 0x00000FFF
_08050D1C: .4byte gUnknown_080D8D6C
_08050D20: .4byte sub_804F108

	thumb_func_start sub_8050D24
sub_8050D24: @ 0x08050D24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050D80 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050D84 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050D88 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08050D78
	ldr r2, _08050D8C @ =0x00000FFF
	ands r1, r2
	str r1, [r4, #0x30]
	ldr r0, _08050D90 @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x54]
	str r1, [r4]
	ldr r1, [r0, #0x58]
	str r1, [r4, #0x34]
	adds r0, #0x5c
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r0, _08050D94 @ =gUnknown_080D8DCC
	ldr r1, [r0, #0x3c]
	str r1, [r5]
	ldr r1, [r0, #0x40]
	str r1, [r5, #0x1c]
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	ldr r0, _08050D98 @ =sub_8050DC8
	str r0, [r6]
_08050D78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D80: .4byte gCurTask
_08050D84: .4byte IWRAM_START + 0x1C
_08050D88: .4byte IWRAM_START + 0x558
_08050D8C: .4byte 0x00000FFF
_08050D90: .4byte gUnknown_080D8D6C
_08050D94: .4byte gUnknown_080D8DCC
_08050D98: .4byte sub_8050DC8

	thumb_func_start sub_8050D9C
sub_8050D9C: @ 0x08050D9C
	push {lr}
	ldr r1, _08050DBC @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	ldr r1, _08050DC0 @ =IWRAM_START + 0x1C
	adds r2, r2, r1
	ldr r1, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r2, #0x24]
	bl sub_8050030
	pop {r0}
	bx r0
	.align 2, 0
_08050DBC: .4byte gCurTask
_08050DC0: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8050DC4
sub_8050DC4: @ 0x08050DC4
	bx lr
	.align 2, 0

	thumb_func_start sub_8050DC8
sub_8050DC8: @ 0x08050DC8
	adds r3, r0, #0
	movs r0, #0x3c
	str r0, [r3, #8]
	movs r1, #0
	movs r0, #0xb4
	strh r0, [r3, #6]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r0, _08050DF4 @ =0x000002CE
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	bx lr
	.align 2, 0
_08050DF4: .4byte 0x000002CE

	thumb_func_start sub_8050DF8
sub_8050DF8: @ 0x08050DF8
	push {lr}
	bl sub_804F5BC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050E04
sub_8050E04: @ 0x08050E04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _08050EC0 @ =sub_805102C
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _08050EC4 @ =sub_80511EC
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x30]
	ldr r0, [r5, #0x10]
	str r0, [r4, #0x34]
	ldr r3, _08050EC8 @ =gSineTable
	ldrh r0, [r5, #6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #8
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	movs r1, #0
	mov r8, r1
	movs r2, #0
	strh r0, [r4, #0x38]
	ldrh r0, [r5, #6]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #8
	ldrsh r0, [r5, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r4, #0x3a]
	ldrh r0, [r5]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0xa]
	ldrb r1, [r5, #4]
	ldr r3, _08050ECC @ =IWRAM_START + 0x20
	adds r0, r6, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r4, #8]
	strh r2, [r4, #0x16]
	strh r2, [r4, #0x18]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08050ED0 @ =IWRAM_START + 0x21
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08050ED4 @ =IWRAM_START + 0x22
	adds r1, r6, r2
	movs r0, #0x10
	strb r0, [r1]
	adds r3, #5
	adds r6, r6, r3
	mov r0, r8
	strb r0, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050EC0: .4byte sub_805102C
_08050EC4: .4byte sub_80511EC
_08050EC8: .4byte gSineTable
_08050ECC: .4byte IWRAM_START + 0x20
_08050ED0: .4byte IWRAM_START + 0x21
_08050ED4: .4byte IWRAM_START + 0x22

	thumb_func_start sub_8050ED8
sub_8050ED8: @ 0x08050ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	ldr r0, _0805100C @ =sub_80510B0
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _08051010 @ =sub_8051200
	str r1, [sp]
	movs r1, #0x68
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	mov r0, r8
	cmp r0, #4
	bls _08050F14
	movs r2, #4
	mov r8, r2
_08050F14:
	ldr r3, _08051014 @ =IWRAM_START + 0x60
	adds r0, r1, r3
	mov r2, r8
	strb r2, [r0]
	movs r6, #0
	subs r3, #0x40
	adds r3, r3, r1
	mov sl, r3
	ldr r0, _08051018 @ =IWRAM_START + 0x21
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r2, _0805101C @ =IWRAM_START + 0x22
	adds r2, r1, r2
	str r2, [sp, #8]
	ldr r3, _08051020 @ =IWRAM_START + 0x25
	adds r3, r1, r3
	str r3, [sp, #0xc]
	cmp r6, r8
	bhs _08050FBA
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08051024 @ =gSineTable
	mov ip, r0
_08050F44:
	lsls r2, r6, #3
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldr r1, [r7, #0xc]
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r2
	ldr r1, [r7, #0x10]
	str r1, [r0]
	lsls r4, r6, #2
	adds r3, r5, #0
	adds r3, #0x50
	adds r3, r3, r4
	mov r1, sb
	muls r1, r6, r1
	ldrh r2, [r7, #6]
	adds r1, r1, r2
	ldr r2, _08051028 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	strh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, ip
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x10]
	movs r2, #8
	ldrsh r0, [r7, r2]
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x52
	adds r2, r2, r4
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #8
	ldrsh r0, [r7, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x61
	adds r0, r0, r6
	movs r1, #1
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r8
	blo _08050F44
_08050FBA:
	ldrh r0, [r7]
	bl VramMalloc
	str r0, [r5, #4]
	ldrh r0, [r7, #2]
	movs r2, #0
	movs r1, #0
	strh r0, [r5, #0xa]
	ldrb r0, [r7, #4]
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x16]
	strh r1, [r5, #0x18]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	movs r0, #0xff
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0x10
	ldr r3, [sp, #8]
	strb r0, [r3]
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805100C: .4byte sub_80510B0
_08051010: .4byte sub_8051200
_08051014: .4byte IWRAM_START + 0x60
_08051018: .4byte IWRAM_START + 0x21
_0805101C: .4byte IWRAM_START + 0x22
_08051020: .4byte IWRAM_START + 0x25
_08051024: .4byte gSineTable
_08051028: .4byte 0x000003FF

	thumb_func_start sub_805102C
sub_805102C: @ 0x0805102C
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805108C @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r5, r4, #0
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #0x34]
	adds r1, r1, r2
	str r1, [r4, #0x34]
	asrs r7, r0, #8
	ldr r2, _08051090 @ =gCamera
	ldr r0, [r2]
	subs r0, r7, r0
	strh r0, [r4, #0x16]
	asrs r6, r1, #8
	ldr r1, [r2, #4]
	subs r2, r6, r1
	strh r2, [r4, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051082
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051082
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08051094
_08051082:
	ldr r0, [r3]
	bl TaskDestroy
	b _080510AA
	.align 2, 0
_0805108C: .4byte gCurTask
_08051090: .4byte gCamera
_08051094:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_800C84C
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_080510AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80510B0
sub_80510B0: @ 0x080510B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080511C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	mov sb, r7
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	ldr r1, _080511C8 @ =IWRAM_START + 0x60
	adds r0, r4, r1
	ldr r2, [sp]
	ldrb r0, [r0]
	cmp r2, r0
	bhs _080511A4
	ldr r3, _080511CC @ =IWRAM_START + 0x61
	adds r3, r4, r3
	str r3, [sp, #4]
_080510E8:
	ldr r0, [sp, #4]
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051190
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	mov r4, sl
	lsls r5, r4, #3
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	adds r2, r0, r5
	lsls r4, r4, #2
	adds r0, r7, #0
	adds r0, #0x50
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r6, r7, #0
	adds r6, #0x34
	adds r3, r6, r5
	adds r0, r7, #0
	adds r0, #0x52
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r2, [r2]
	asrs r2, r2, #8
	ldr r1, _080511D0 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	mov r0, sb
	strh r2, [r0, #0x16]
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r1, r0, r1
	mov r3, sb
	strh r1, [r3, #0x18]
	adds r2, #0x80
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r3, r8
	movs r4, #0xf8
	lsls r4, r4, #1
	cmp r2, r4
	bhi _08051170
	mov r2, sb
	movs r4, #0x18
	ldrsh r0, [r2, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _08051170
	lsls r1, r1, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08051178
_08051170:
	ldr r1, [sp, #4]
	add r1, sl
	movs r0, #0
	strb r0, [r1]
_08051178:
	adds r0, r3, r5
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r0, r6, r5
	ldr r2, [r0]
	asrs r2, r2, #8
	mov r0, sb
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08051190:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp sl, r0
	blo _080510E8
_080511A4:
	ldr r0, [sp]
	cmp r0, #0
	bne _080511B2
	ldr r0, _080511C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080511D4 @ =sub_80511D8
	str r0, [r1, #8]
_080511B2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080511C4: .4byte gCurTask
_080511C8: .4byte IWRAM_START + 0x60
_080511CC: .4byte IWRAM_START + 0x61
_080511D0: .4byte gCamera
_080511D4: .4byte sub_80511D8

	thumb_func_start sub_80511D8
sub_80511D8: @ 0x080511D8
	push {lr}
	ldr r0, _080511E8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080511E8: .4byte gCurTask

	thumb_func_start sub_80511EC
sub_80511EC: @ 0x080511EC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8051200
sub_8051200: @ 0x08051200
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
