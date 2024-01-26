.include "constants/gba_constants.inc"
.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r2, _0802F200 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r7, _0802F204 @ =gPlayer
	adds r0, r7, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	orrs r0, r2
	str r0, [r1, #0x1c]
	adds r0, r7, #0
	adds r0, #0x94
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _0802F208 @ =gActiveBossTask
	movs r4, #0
	str r4, [r0]
	ldr r0, _0802F20C @ =Task_802F75C
	movs r2, #0x88
	lsls r2, r2, #6
	ldr r1, _0802F210 @ =TaskDestructor_StageIntroParent
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r0, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r0, r0, r5
	str r0, [sp, #8]
	movs r6, #2
	str r6, [r0]
	strb r4, [r0, #4]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r7, #0x20]
	ldr r0, _0802F214 @ =Task_802F9F8
	ldr r2, _0802F218 @ =0x00002210
	ldr r1, _0802F21C @ =TaskDestructor_nop_8030458
	mov r8, r1
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r3, _0802F220 @ =IWRAM_START+4
	adds r0, r0, r3
	strh r4, [r0]
	strh r4, [r0, #4]
	strh r6, [r0, #2]
	strh r4, [r0, #6]
	ldr r1, _0802F224 @ =0x00003FFF
	strh r1, [r0, #8]
	strh r4, [r0, #0xa]
	bl UpdateScreenFade
	ldr r0, _0802F228 @ =Task_IntroColorAnimation
	ldr r2, _0802F22C @ =0x00002220
	mov r1, r8
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r3, _0802F230 @ =IWRAM_START + 0x10
	adds r1, r0, r3
	strh r4, [r1]
	strh r4, [r1, #2]
	ldr r2, _0802F234 @ =IWRAM_START + 0x14
	adds r1, r0, r2
	strh r4, [r1]
	strh r4, [r1, #2]
	ldr r0, _0802F238 @ =Task_IntroZoneNameAndIconAnimations
	movs r1, #0xc4
	lsls r1, r1, #2
	ldr r2, _0802F23C @ =0x00002230
	ldr r3, _0802F240 @ =TaskDestructor_803045C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r0, r0, r5
	mov r8, r0
	ldr r3, [sp, #8]
	str r3, [r0]
	ldr r0, _0802F244 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F260
	ldr r2, _0802F248 @ =zoneLoadingCharacterLogos
	ldr r0, _0802F24C @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F250 @ =zoneLoadingZoneNames
	ldr r1, _0802F254 @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r1, r4, #3
	adds r1, r1, r5		@ r1 = 24*LEVEL_TO_ZONE(gCurrLvl)
	ldrh r6, [r1]		@ r6 = zoneNamesTilecount0
	lsls r2, r2, #2
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r6
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r3, r2, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r3, [r1]
	adds r2, #3
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802F258 @ =zoneLoadingIcons
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, _0802F25C @ =sZoneUnlockedIcons
	ldrh r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	b _0802F2BE
	.align 2, 0
_0802F200: .4byte gUnknown_03005424
_0802F204: .4byte gPlayer
_0802F208: .4byte gActiveBossTask
_0802F20C: .4byte Task_802F75C
_0802F210: .4byte TaskDestructor_StageIntroParent
_0802F214: .4byte Task_802F9F8
_0802F218: .4byte 0x00002210
_0802F21C: .4byte TaskDestructor_nop_8030458
_0802F220: .4byte IWRAM_START+4
_0802F224: .4byte 0x00003FFF
_0802F228: .4byte Task_IntroColorAnimation
_0802F22C: .4byte 0x00002220
_0802F230: .4byte IWRAM_START + 0x10
_0802F234: .4byte IWRAM_START + 0x14
_0802F238: .4byte Task_IntroZoneNameAndIconAnimations
_0802F23C: .4byte 0x00002230
_0802F240: .4byte TaskDestructor_803045C
_0802F244: .4byte gGameMode
_0802F248: .4byte zoneLoadingCharacterLogos
_0802F24C: .4byte gSelectedCharacter
_0802F250: .4byte zoneLoadingZoneNames
_0802F254: .4byte gCurrentLevel
_0802F258: .4byte zoneLoadingIcons
_0802F25C: .4byte sZoneUnlockedIcons
_0802F260:
	ldr r2, _0802F3E0 @ =zoneLoadingCharacterLogos
	ldr r0, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F3E8 @ =zoneLoadingZoneNames
	ldr r1, _0802F3EC @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r1, r4, #3
	adds r1, r1, r5
	ldrh r6, [r1]
	lsls r2, r2, #2
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r6
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r3, r2, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r3, [r1]
	adds r2, #3
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802F3F0 @ =zoneLoadingIcons
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
_0802F2BE:
	adds r0, r0, r1
	bl VramMalloc
	adds r6, r0, #0
__0802F2C4:
	movs r5, #0xda
	lsls r5, r5, #1
	add r5, r8
	movs r4, #0
	movs r7, #0
	strh r7, [r5, #0x16]
	strh r7, [r5, #0x18]
	str r6, [r5, #4]
	ldr r2, _0802F3E0 @ =zoneLoadingCharacterLogos
	ldr r3, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r7, [r5, #8]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, r8
	strb r1, [r0]
	strh r7, [r5, #0x14]
	strh r7, [r5, #0x1c]
	ldr r1, _0802F3F4 @ =0x000001D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0xeb
	lsls r1, r1, #1
	add r1, r8
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802F3F8 @ =0x000001D9
	add r1, r8
	strb r4, [r1]
	ldr r0, _0802F3FC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802F34C
	ldr r0, _0802F400 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
_0802F34C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r7, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	movs r7, #0
	movs r4, #0xb1
	lsls r4, r4, #2
	add r4, r8
	str r4, [sp, #0x20]
	ldr r0, _0802F404 @ =0x000002C5
	add r0, r8
	str r0, [sp, #0x24]
	ldr r1, _0802F408 @ =0x000002C6
	add r1, r8
	str r1, [sp, #0x28]
	ldr r2, _0802F40C @ =0x000002C9
	add r2, r8
	str r2, [sp, #0x2c]
	movs r3, #0xbd
	lsls r3, r3, #2
	add r3, r8
	str r3, [sp, #0x10]
	ldr r4, _0802F410 @ =0x000002F5
	add r4, r8
	str r4, [sp, #0x14]
	ldr r0, _0802F414 @ =0x000002F6
	add r0, r8
	str r0, [sp, #0x18]
	ldr r1, _0802F418 @ =0x000002F9
	add r1, r8
	str r1, [sp, #0x1c]
	movs r2, #0
	ldr r3, _0802F3E8 @ =zoneLoadingZoneNames
	adds r4, r3, #2
	mov sl, r4
	adds r0, r3, #4
	mov ip, r0
_0802F39C:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r4, r8
	adds r5, r4, r0			@ r5 = s
	strh r2, [r5, #0x16]
	strh r2, [r5, #0x18]
	ldr r0, _0802F3EC @ =gCurrentLevel
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0802F41C
	str r6, [r5, #4]
	adds r0, r7, #0
	adds r0, #0x20
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r4, r1, #0
	add r4, sl
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	add r1, ip
	ldrh r1, [r1]
	b _0802F47E
	.align 2, 0
_0802F3E0: .4byte zoneLoadingCharacterLogos
_0802F3E4: .4byte gSelectedCharacter
_0802F3E8: .4byte zoneLoadingZoneNames
_0802F3EC: .4byte gCurrentLevel
_0802F3F0: .4byte zoneLoadingIcons
_0802F3F4: .4byte 0x000001D5
_0802F3F8: .4byte 0x000001D9
_0802F3FC: .4byte gGameMode
_0802F400: .4byte 0x04000128
_0802F404: .4byte 0x000002C5
_0802F408: .4byte 0x000002C6
_0802F40C: .4byte 0x000002C9
_0802F410: .4byte 0x000002F5
_0802F414: .4byte 0x000002F6
_0802F418: .4byte 0x000002F9
_0802F41C:
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _0802F446
	str r6, [r5, #4]
	adds r0, r7, #0
	adds r0, #0x24
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r4, r1, #0
	add r4, sl
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	add r1, ip
	ldrh r1, [r1]
	b _0802F47E
_0802F446:
	str r6, [r5, #4]
	ldr r1, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	add r1, sl
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldr r4, _0802F5D8 @ =gCurrentLevel
	ldrb r1, [r4]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r1, r1, #2
	adds r1, r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	ldrh r1, [r0]
_0802F47E:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	movs r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov r4, sp
	strb r0, [r4, #0xc]
	movs r0, #0xff
	strb r0, [r1, r5]
	adds r0, r5, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r2, [r0]
	movs r4, #1
	rsbs r4, r4, #0
	mov sb, r4
	str r4, [r5, #0x28]
	str r2, [r5, #0x10]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _0802F4C0
	b _0802F39C
_0802F4C0:
	movs r5, #0xa9
	lsls r5, r5, #2
	add r5, r8
	movs r7, #0
	movs r4, #0
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	adds r6, r6, r0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r5, #0x1a]
	strh r4, [r5, #8]
	subs r0, #0x25
	strh r0, [r5, #0xa]
	ldr r2, [sp, #0x20]
	strb r7, [r2]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	movs r0, #0x20
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldr r2, [sp, #0x2c]
	strb r7, [r2]
	mov r3, sb
	str r3, [r5, #0x28]
	str r4, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, r8
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	ldr r3, _0802F5DC @ =zoneLoadingIcons
	ldr r2, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r0, r3, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldrb r1, [r2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r3, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1d
	bne _0802F558
	ldrh r0, [r3, #0x32]
	strh r0, [r5, #0xa]
	ldrh r0, [r3, #0x34]
	strb r0, [r1]
_0802F558:
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	mov r4, sp
	ldrb r4, [r4, #0xc]
	orrs r0, r4
	strb r0, [r3]
	movs r1, #0x10
	ldr r0, [sp, #0x18]
	strb r1, [r0]
	ldr r2, [sp, #0x1c]
	strb r7, [r2]
	mov r3, sb
	str r3, [r5, #0x28]
	ldr r2, _0802F5E0 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	ldr r0, _0802F5E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F652
	movs r7, #0
	movs r4, #0
	mov sb, r4
	movs r3, #0
	ldr r4, _0802F5E8 @ =sZoneUnlockedIcons
_0802F5A8:
	lsls r0, r7, #1
	adds r1, r0, r7
	lsls r0, r1, #4
	adds r0, #4
	mov r2, r8
	adds r5, r2, r0
	strh r3, [r5, #0x16]
	ldr r0, _0802F5EC @ =0x0000FFE0
	strh r0, [r5, #0x18]
	str r6, [r5, #4]
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r6, r6, r0
	ldr r0, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	cmp r0, #0x1d
	bne _0802F5F0
	cmp r7, #8
	bne _0802F5FE
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0x3a]
	b _0802F60E
	.align 2, 0
_0802F5D8: .4byte gCurrentLevel
_0802F5DC: .4byte zoneLoadingIcons
_0802F5E0: .4byte gUnknown_030054B8
_0802F5E4: .4byte gGameMode
_0802F5E8: .4byte sZoneUnlockedIcons
_0802F5EC: .4byte 0x0000FFE0
_0802F5F0:
	asrs r0, r2, #0x1a
	cmp r7, r0
	bne _0802F5FE
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0x3a]
	b _0802F60E
_0802F5FE:
	lsls r1, r1, #1
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r0, r4, #4
	adds r1, r1, r0
	ldrh r1, [r1]
_0802F60E:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r3, [r5, #0x10]
	adds r0, r5, #0
	str r3, [sp, #0x30]
	bl UpdateSpriteAnimation
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #8
	bls _0802F5A8
_0802F652:
	ldr r0, _0802F73C @ =Task_IntroActLettersAnimations
	movs r2, #0x89
	lsls r2, r2, #6
	ldr r1, _0802F740 @ =TaskDestructor_8030474
	str r1, [sp]
	movs r1, #0xc4
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1          @ r8 = sit_e
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r4, _0802F744 @ =sZoneLoadingActLetters
	ldrh r0, [r4]
	lsls r0, r0, #2
	bl VramMalloc
	adds r6, r0, #0
	movs r7, #0
	movs r3, #0
	mov sl, r3
	movs r3, #0
	mov sb, r4
_0802F688:  @ loop
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r0, r1, #4
	adds r0, #4
	mov r2, r8
	adds r5, r2, r0
	strh r3, [r5, #0x16]
	ldr r0, _0802F748 @ =0x0000FFE0
	strh r0, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r0, r4, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r2, r5, #0
	adds r2, #0x20
	strb r0, [r2]
	cmp r7, #3
	bne _0802F6C8
	ldr r0, _0802F74C @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802F6C8
	ldrh r0, [r4, #0x1a]
	strh r0, [r5, #0xa]
	ldrh r0, [r4, #0x1c]
	strb r0, [r2]
_0802F6C8:
	str r6, [r5, #4]
	mov r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r0, #0x80
	strh r0, [r5, #0x1a]
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r3, [r5, #0x10]
	adds r0, r5, #0
	str r3, [sp, #0x30]
	bl UpdateSpriteAnimation
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #3
	bls _0802F688
	ldr r0, _0802F750 @ =Task_UpdateStageLoadingScreen
	ldr r2, _0802F754 @ =0x000022F0
	ldr r1, _0802F758 @ =TaskDestructor_nop_8030458
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r3, [sp, #8]
	str r3, [r1]
	ldr r0, [sp, #4]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F73C: .4byte Task_IntroActLettersAnimations
_0802F740: .4byte TaskDestructor_8030474
_0802F744: .4byte sZoneLoadingActLetters
_0802F748: .4byte 0x0000FFE0
_0802F74C: .4byte gCurrentLevel
_0802F750: .4byte Task_UpdateStageLoadingScreen
_0802F754: .4byte 0x000022F0
_0802F758: .4byte TaskDestructor_nop_8030458

.syntax divided
