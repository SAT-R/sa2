.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r2, _08008288 @ =gPlayer    @ r2 = p = gPlayer
	ldrb r4, [r2, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _0800828C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08007F60
	bl Task_RingsMgrMain_Return
_08007F60:
	ldr r0, _08008290 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08008294 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x14]     @ sp14 = void *rings
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08007F8E
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08007F8A
	ldr r0, _0800829C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08007F8E
_08007F8A:
	cmp r1, #0x1d
	bne _08007FBE
_08007F8E:
	ldr r5, _080082A0 @ =gBossRingsShallRespawn
	ldrb r0, [r5]
	cmp r0, #0
	beq _08007FBE
	ldr r4, _080082A4 @ =gBossRingsRespawnCount
	ldrb r0, [r4]
	cmp r0, #0
	beq _08007FBE
	ldr r1, _080082A8 @ =gSpritePosData_rings
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	bl RLUnCompWram
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_08007FBE:
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _08007FFA
	bl sub_802C6E4
	movs r1, #0x87
	lsls r1, r1, #2
	ands r1, r0
	movs r3, #1
	str r3, [sp, #8]
	cmp r1, #0
	beq _08007FE4
	movs r4, #0
	str r4, [sp, #8]
_08007FE4:
	ldr r0, _080082AC @ =gPlayer + 0x8
	adds r1, r0, #4
	bl sub_802C668
	mov r0, sp
	movs r1, #0xf6
	strb r1, [r0]
	strb r1, [r0, #1]
	movs r1, #0xa
	strb r1, [r0, #2]
	strb r1, [r0, #3]
_08007FFA:
	ldr r0, _08008290 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r6, _08008294 @ =IWRAM_START + 0x30
	adds r0, r1, r6
	ldr r0, [r0]
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	adds r0, r1, #0
	bl UpdateSpriteAnimation
	ldr r0, [sp, #0x18]     @ r0 = sp18 = s
	ldr r0, [r0, #0xc]
	str r0, [sp, #0x20]     @ sp20 = dimensions = s->dimensions
	ldr r1, [sp, #0x14]
	adds r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldm r1!, {r0}
	str r1, [sp, #0x14]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, _08008288 @ =gPlayer
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	mov r0, sp
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _0800805C
	b _0800822C
_0800805C:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	blo _08008064
	b _0800822C
_08008064:
	ldr r4, _08008288 @ =gPlayer
	ldr r2, [r4, #8]
	asrs r1, r2, #8
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	subs r0, #8
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sb, r0      @ ((Q_24_8_TO_INT(gPlayer.x) - sp00[0] - 8) >> 8);
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	ldr r3, [r4, #0xc]
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x40]
	cmp sb, r0
	ble _08008098
	b _08008208
_08008098:
	ldr r0, [sp, #0xc]
	cmp sb, r0
	blo _080080A0
	b _08008208
_080080A0:
	ldr r1, [sp, #0xc]
	mov r0, sl
	muls r0, r1, r0
	mov r4, sb
	lsls r1, r4, #2
	lsls r0, r0, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	adds r4, #1
	str r4, [sp, #0x3c]
	cmp r0, #0
	bne _080080BE
	b _080081E4
_080080BE:
	subs r0, #8
	adds r5, r6, r0     @ r5 = region
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _080080CC
	b _080081E4
_080080CC:
	mov r0, sp
	str r0, [sp, #0x24]
_080080D0:
	cmp r1, #0xfe
	bne _080080D6
	b _080081D2
_080080D6:
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r2, sb
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r7, r1, r0
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _0800810A
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080081D2
	ldr r6, _08008288 @ =gPlayer
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _080081D2
_0800810A:
	mov r2, r8
	subs r2, #8
	ldr r1, _08008288 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r4, [sp, #0x24]
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800812C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _0800813A
	cmp r2, r1
	blt _080081D2
_0800812C:
	ldr r6, [sp, #0x24]
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080081D2
_0800813A:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r1, _08008288 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r4, [sp, #0x24]
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08008158
	cmp r7, r1
	bge _08008166
	cmp r2, r1
	blt _080081D2
_08008158:
	ldr r6, [sp, #0x24]
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080081D2
_08008166:
	ldr r1, _080082B0 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080081AC
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _080081AC
	ldr r0, _080082B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080081AC
	ldr r1, _080082B8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _080081A4
	movs r0, #0xff
_080081A4:
	strb r0, [r1]
	ldr r1, _080082BC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_080081AC:
	ldr r0, _080082B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080081C0
	ldr r1, _080082B0 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _080081C0
	movs r0, #0xff
	strh r0, [r1]
_080081C0:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0xfe
	strb r0, [r5]
_080081D2:
	adds r5, #2
	ldrb r1, [r5]
	adds r0, r1, #0
	ldr r2, _08008288 @ =gPlayer
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #8]
	cmp r0, #0xff
	beq _080081E4
	b _080080D0
_080081E4:
	ldr r4, [sp, #0x3c]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	asrs r1, r2, #8
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp sb, r0
	bgt _08008208
	ldr r6, [sp, #0xc]
	cmp sb, r6
	bhs _08008208
	b _080080A0
_08008208:
	ldr r1, [sp, #0x40]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	asrs r1, r3, #8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _0800822C
	ldr r2, [sp, #0x10]
	cmp sl, r2
	bhs _0800822C
	b _08008064
_0800822C:
	ldr r0, _080082B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08008236
	b _0800847E
_08008236:
	movs r2, #0
_08008238:
	ldr r0, _080082C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r3, r2, #1
	str r3, [sp, #0x30]
	cmp r2, r0
	bne _0800824A
	b _08008472
_0800824A:
	ldr r1, _080082C4 @ =gMultiplayerPlayerTasks
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08008258
	b _08008472
_08008258:
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r4, r2, r6     @ r4 = mpPlayer
	ldr r1, _080082C8 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r6, #0x2d
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r3, _080082CC @ =IWRAM_START + 0x2F
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	b _080082D0
	.align 2, 0
_08008288: .4byte gPlayer
_0800828C: .4byte gUnknown_03005424
_08008290: .4byte gCurTask
_08008294: .4byte IWRAM_START + 0x30
_08008298: .4byte gCurrentLevel
_0800829C: .4byte gUnknown_030054B0
_080082A0: .4byte gBossRingsShallRespawn
_080082A4: .4byte gBossRingsRespawnCount
_080082A8: .4byte gSpritePosData_rings
_080082AC: .4byte gPlayer + 0x8
_080082B0: .4byte gRingCount
_080082B4: .4byte gGameMode
_080082B8: .4byte gNumLives
_080082BC: .4byte gUnknown_030054A8
_080082C0: .4byte 0x04000128
_080082C4: .4byte gMultiplayerPlayerTasks
_080082C8: .4byte IWRAM_START + 0x52
_080082CC: .4byte IWRAM_START + 0x2F
_080082D0:
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _080082DA
	b _08008472
_080082DA:
	ldr r6, [sp, #0x10]
	cmp sl, r6
	blo _080082E2
	b _08008472
_080082E2:
	ldr r0, _08008330 @ =IWRAM_START + 0x50
	adds r0, r2, r0
	str r0, [sp, #0x28]
	ldr r1, _08008334 @ =IWRAM_START + 0x2C
	adds r1, r2, r1
	str r1, [sp, #0x2c]
	subs r3, #1
	adds r3, r2, r3
	str r3, [sp, #0x48]
_080082F4:
	ldr r6, [sp, #0x28]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	subs r1, #8
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r3, [sp, #0x48]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r1, r1, r0
	adds r1, #0x10
	asrs r1, r1, #8
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x40]
	adds r0, r4, #0
	adds r0, #0x52
	str r0, [sp, #0x38]
	adds r2, r4, #0
	adds r2, #0x2f
	str r2, [sp, #0x34]
	cmp sb, r1
	ble _0800832E
	b _0800844C
_0800832E:
	b _08008444
	.align 2, 0
_08008330: .4byte IWRAM_START + 0x50
_08008334: .4byte IWRAM_START + 0x2C
_08008338:
	ldr r6, [sp, #0xc]
	mov r0, sl
	muls r0, r6, r0
	mov r2, sb
	lsls r1, r2, #2
	lsls r0, r0, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, #1
	str r2, [sp, #0x3c]
	cmp r0, #0
	beq _08008426
	subs r0, #8
	adds r5, r3, r0
	b _0800841E
_0800835A:
	cmp r1, #0xfe
	beq _0800841C
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r6, sb
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r7, r1, r0
	mov r2, r8
	subs r2, #8
	ldr r3, [sp, #0x28]
	movs r6, #0
	ldrsh r0, [r3, r6]
	ldr r1, [sp, #0x2c]
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08008396
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _080083A4
	cmp r2, r1
	blt _0800841C
_08008396:
	ldr r6, [sp, #0x48]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800841C
_080083A4:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r1, [sp, #0x38]
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080083C4
	cmp r7, r1
	bge _080083D2
	cmp r2, r1
	blt _0800841C
_080083C4:
	ldr r6, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800841C
_080083D2:
	ldrb r1, [r4, #0xa]
	ldr r3, _080084F8 @ =gPlayerCharacterIdleAnims
	ldr r2, _080084FC @ =gMultiplayerCharacters
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0xe4
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0800840A
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800841C
_0800840A:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0xfe
	strb r0, [r5]
_0800841C:
	adds r5, #2
_0800841E:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800835A
_08008426:
	ldr r2, [sp, #0x3c]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r3, [sp, #0x28]
	movs r6, #0
	ldrsh r1, [r3, r6]
	ldr r2, [sp, #0x48]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp sb, r0
	bgt _0800844C
_08008444:
	ldr r3, [sp, #0xc]
	cmp sb, r3
	bhs _0800844C
	b _08008338
_0800844C:
	ldr r6, [sp, #0x40]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp, #0x38]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _08008472
	ldr r6, [sp, #0x10]
	cmp sl, r6
	bhs _08008472
	b _080082F4
_08008472:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0800847E
	b _08008238
_0800847E:
	ldr r2, _08008500 @ =gCamera
	ldr r3, [r2, #4]
	lsls r0, r3, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _08008504 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08008498
	b _080086B4
_08008498:
	ldr r0, _08008508 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080084A2
	b _080086B4
_080084A2:
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r3, #0
	adds r0, #0xa0
	cmp r1, r0
	blt _080084B0
	b Task_RingsMgrMain_Return
_080084B0:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	blo _080084B8
	b Task_RingsMgrMain_Return
_080084B8:
	ldr r4, _08008500 @ =gCamera
	ldr r0, [r4]
	lsls r1, r0, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r1, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _080084CC
	b _0800867A
_080084CC:
	ldr r6, [sp, #0xc]
	mov r2, sl
	muls r2, r6, r2
	mov r0, sb
	lsls r1, r0, #2
	lsls r0, r2, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r1]
	str r2, [sp, #0x44]
	cmp sb, r6
	blo _080084E8
	b _0800867A
_080084E8:
	cmp r0, #0
	bne _080084EE
	b _0800864C
_080084EE:
	subs r0, #8
	ldr r4, [sp, #0x14]
	adds r5, r4, r0
	b _08008642
	.align 2, 0
_080084F8: .4byte gPlayerCharacterIdleAnims
_080084FC: .4byte gMultiplayerCharacters
_08008500: .4byte gCamera
_08008504: .4byte gPlayer
_08008508: .4byte gGameMode
_0800850C:
	cmp r1, #0xfe
	beq _08008582
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r6, sb
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r7, r1, r0
	ldr r3, _08008588 @ =gCamera
	ldr r0, [r3]
	mov r4, r8
	subs r0, r4, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08008582
	ldr r0, [r3, #4]
	subs r0, r7, r0
	cmp r0, #0
	blt _08008582
	subs r0, #0x10
	cmp r0, #0xa0
	bgt _08008582
	mov r1, r8
	subs r1, #0x40
	ldr r3, _0800858C @ =gPlayer
	ldr r0, [r3, #8]
	asrs r2, r0, #8
	cmp r1, r2
	bgt _08008590
	mov r0, r8
	adds r0, #0x40
	cmp r0, r2
	blt _08008590
	adds r1, r7, #0
	subs r1, #0x48
	ldr r0, [r3, #0xc]
	asrs r2, r0, #8
	cmp r1, r2
	bgt _08008590
	adds r0, r7, #0
	adds r0, #0x38
	cmp r0, r2
	blt _08008590
	mov r6, r8
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800BAAC
	movs r0, #0xfe
	strb r0, [r5]
_08008582:
	adds r5, #2
	b _08008642
	.align 2, 0
_08008588: .4byte gCamera
_0800858C: .4byte gPlayer
_08008590:
	adds r5, #2
	ldr r2, [sp, #0x18]
	adds r2, #0x23
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080085A2
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080085C4
_080085A2:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _080085C0 @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x18]
	bl DisplaySprite
	b _08008638
	.align 2, 0
_080085C0: .4byte gCamera
_080085C4:
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r0, _0800869C @ =gUnknown_030022D0
	adds r6, r1, r0
	ldr r4, [sp, #0x18]
	ldrh r0, [r4, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r4, r0, #0
	ldr r0, _080086A0 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	bne _080085EA
	b Task_RingsMgrMain_Return
_080085EA:
	ldr r1, _080086A4 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _080086A8 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _080086AC @ =gCamera
	ldr r0, [r6, #4]
	subs r0, r7, r0
	ldr r6, [sp, #0x20]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _080086AC @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _080086B0 @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_08008638:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_08008642:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800864C
	b _0800850C
_0800864C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r0, #8
	ldr r2, _080086AC @ =gCamera
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _0800867A
	mov r3, sb
	lsls r1, r3, #2
	ldr r4, [sp, #0x44]
	lsls r0, r4, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [sp, #0xc]
	cmp sb, r1
	bhs _0800867A
	b _080084E8
_0800867A:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r2, _080086AC @ =gCamera
	ldr r0, [r2, #4]
	adds r0, #0xa0
	cmp r1, r0
	blt _08008692
	b Task_RingsMgrMain_Return
_08008692:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	bhs _0800869A
	b _080084B8
_0800869A:
	b Task_RingsMgrMain_Return
	.align 2, 0
_0800869C: .4byte gUnknown_030022D0
_080086A0: .4byte iwram_end
_080086A4: .4byte 0x040000D4
_080086A8: .4byte 0x80000003
_080086AC: .4byte gCamera
_080086B0: .4byte 0x000001FF
_080086B4:
	mov r4, sl
	lsls r1, r4, #8
	ldr r6, _08008708 @ =gCamera
	ldr r0, [r6, #4]
	adds r0, #0xa0
	cmp r1, r0
	blt _080086C4
	b Task_RingsMgrMain_Return
_080086C4:
	ldr r0, [sp, #0x10]
	cmp sl, r0
	blo _080086CC
	b Task_RingsMgrMain_Return
_080086CC:
	ldr r1, _08008708 @ =gCamera
	ldr r0, [r1]
	lsls r1, r0, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r1, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _080086E0
	b _0800882C
_080086E0:
	ldr r2, [sp, #0xc]
	cmp sb, r2
	blo _080086E8
	b _0800882C
_080086E8:
	ldr r3, [sp, #0xc]
	mov r0, sl
	muls r0, r3, r0
	mov r4, sb
	lsls r1, r4, #2
	lsls r0, r0, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08008702
	b _0800880E
_08008702:
	subs r0, #8
	adds r5, r6, r0
	b _08008804
	.align 2, 0
_08008708: .4byte gCamera
_0800870C:
	cmp r1, #0xfe
	beq _08008746
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r2, sb
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r7, r1, r0
	ldr r4, _0800874C @ =gCamera
	ldr r0, [r4]
	mov r6, r8
	subs r0, r6, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08008746
	ldr r0, [r4, #4]
	subs r0, r7, r0
	cmp r0, #0
	blt _08008746
	subs r0, #0x10
	cmp r0, #0xa0
	ble _08008750
_08008746:
	adds r5, #2
	b _08008804
	.align 2, 0
_0800874C: .4byte gCamera
_08008750:
	adds r5, #2
	ldr r2, [sp, #0x18]
	adds r2, #0x23
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _08008764
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08008788
_08008764:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _08008784 @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x18]
	bl DisplaySprite
	b _080087FA
	.align 2, 0
_08008784: .4byte gCamera
_08008788:
	ldrb r1, [r1]
	lsls r1, r1, #3
	ldr r0, _0800885C @ =gUnknown_030022D0
	adds r6, r1, r0
	ldr r4, [sp, #0x18]
	ldrh r0, [r4, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r4, r0, #0
	ldr r0, _08008860 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	beq Task_RingsMgrMain_Return
	ldr r1, _08008864 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _08008868 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _0800886C @ =gCamera
	ldr r0, [r6, #4]
	subs r0, r7, r0
	ldr r6, [sp, #0x20]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _0800886C @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _08008870 @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_080087FA:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_08008804:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800880E
	b _0800870C
_0800880E:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r0, #8
	ldr r2, _0800886C @ =gCamera
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _0800882C
	ldr r3, [sp, #0xc]
	cmp sb, r3
	bhs _0800882C
	b _080086E8
_0800882C:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r4, _0800886C @ =gCamera
	ldr r0, [r4, #4]
	adds r0, #0xa0
	cmp r1, r0
	bge Task_RingsMgrMain_Return
	ldr r6, [sp, #0x10]
	cmp sl, r6
	bhs Task_RingsMgrMain_Return
	b _080086CC
Task_RingsMgrMain_Return:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800885C: .4byte gUnknown_030022D0
_08008860: .4byte iwram_end
_08008864: .4byte 0x040000D4
_08008868: .4byte 0x80000003
_0800886C: .4byte gCamera
_08008870: .4byte 0x000001FF

.syntax divided
