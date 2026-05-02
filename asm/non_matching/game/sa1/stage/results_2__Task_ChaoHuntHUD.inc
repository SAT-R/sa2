.include "constants/constants.inc"

.syntax unified

.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0801B8A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	str r0, [sp]
	ldr r0, _0801B8A4 @ =gCourseTime
	ldr r2, [r0]
	ldr r1, _0801B8A8 @ =0x00000E0F
	ldr r4, _0801B8AC @ =0x03000030
	adds r4, r4, r3
	mov sl, r4
	adds r4, r0, #0
	cmp r2, r1
	bhi _0801B72E
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _0801B72E
	ldr r0, _0801B8B0 @ =0x03000240
	adds r0, r0, r3
	mov sl, r0
_0801B72E:
	ldr r0, _0801B8B4 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801B754
	ldr r1, [r4]
	ldr r0, _0801B8B8 @ =0x000004AF
	cmp r1, r0
	bhi _0801B754
	adds r0, r1, #0
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _0801B754
	movs r0, #0x8b      @ SE_TIMER
	bl m4aSongNumStart
_0801B754:
	movs r7, #0xf0
	lsls r7, r7, #1
	add r7, sl
	movs r1, #0x20
	mov r8, r1
	mov r4, r8
	strh r4, [r7, #0x18]
	movs r0, #0x18
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl DisplaySprite
	movs r0, #0x30
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl DisplaySprite
	ldr r4, _0801B8A4 @ =gCourseTime
	ldr r0, [r4]
	movs r1, #0x3c
	bl Div
	adds r5, r0, #0
	ldr r1, [r4]
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0801B8BC @ =sa2__gUnknown_080E0234
	adds r0, r1, r0
	ldrb r4, [r0]
	movs r0, #0xf
	mov sb, r0
	lsrs r1, r4, #4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	movs r0, #0x38
	strh r0, [r7, #0x16]
	mov r0, r8
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	movs r6, #0xf
	adds r1, r6, #0
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	movs r0, #0x40
	strh r0, [r7, #0x16]
	mov r4, r8
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	adds r0, r5, #0
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r1, #0
	bl Base10DigitsToHexNibbles
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsrs r0, r0, #0x14
	mov r1, sb
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	mov r0, sl
	adds r7, r0, r1
	mov r1, r8
	strh r1, [r7, #0x16]
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	adds r1, r6, #0
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	movs r0, #0x28
	strh r0, [r7, #0x16]
	mov r0, r8
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	adds r0, r4, #0
	movs r1, #0x3c
	bl Div
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	adds r0, r1, #0
	bl Base10DigitsToHexNibbles
	ands r6, r0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	movs r0, #0x10
	strh r0, [r7, #0x16]
	mov r4, r8
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	movs r5, #0
	ldr r0, _0801B8C0 @ =gMultiplayerConnections
	ldrb r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801B876
	b _0801BA86
_0801B876:
	ldr r2, _0801B8C4 @ =gGameMode
	ldr r0, [sp]
	adds r0, #0x30
	mov sl, r0
_0801B87E:
	ldr r7, [sp]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, #8
	strh r0, [r7, #0x16]
	movs r0, #8
	strh r0, [r7, #0x18]
	ldrb r0, [r2]
	cmp r0, #6
	bne _0801B8C8
	adds r0, r7, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r1, r5, #1
	mov sb, r1
	b _0801B920
	.align 2, 0
_0801B8A0: .4byte gCurTask
_0801B8A4: .4byte gCourseTime
_0801B8A8: .4byte 0x00000E0F
_0801B8AC: .4byte 0x03000030
_0801B8B0: .4byte 0x03000240
_0801B8B4: .4byte gStageFlags
_0801B8B8: .4byte 0x000004AF
_0801B8BC: .4byte sa2__gUnknown_080E0234
_0801B8C0: .4byte gMultiplayerConnections
_0801B8C4: .4byte gGameMode
_0801B8C8:
	cmp r0, #4
	bne _0801B8E4
	ldr r0, _0801B8E0 @ =gMultiplayerCharacters
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x25
	strb r0, [r1]
	adds r4, r5, #1
	mov sb, r4
	b _0801B920
	.align 2, 0
_0801B8E0: .4byte gMultiplayerCharacters
_0801B8E4:
	movs r2, #0
	ldr r3, _0801B974 @ =gMultiplayerConnections
	ldrb r1, [r3]
	movs r0, #0x10
	ands r1, r0
	asrs r1, r1, #4
	ldr r0, _0801B978 @ =gMultiplayerCharacters
	mov r8, r0
	adds r4, r7, #0
	adds r4, #0x25
	adds r0, r5, #1
	mov sb, r0
	cmp r5, r1
	beq _0801B918
	movs r6, #0x10
_0801B902:
	adds r2, #1
	cmp r2, #3
	bhi _0801B918
	ldrb r0, [r3]
	adds r1, r6, #0
	lsls r1, r2
	ands r0, r1
	adds r1, r2, #4
	asrs r0, r1
	cmp r5, r0
	bne _0801B902
_0801B918:
	mov r1, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	strb r0, [r4]
_0801B920:
	adds r0, r7, #0
	bl DisplaySprite
	ldr r0, _0801B97C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801B988
	movs r4, #0
	movs r2, #0
	ldr r1, _0801B980 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	cmp r0, #0
	beq _0801B970
	ldr r0, _0801B974 @ =gMultiplayerConnections
	ldrb r3, [r0]
	mov r8, r1
	ldr r7, _0801B984 @ =gMultiplayerCharRings
	movs r6, #0x10
_0801B944:
	adds r0, r6, #0
	lsls r0, r2
	ands r0, r3
	adds r1, r2, #4
	asrs r0, r1
	cmp r5, r0
	bne _0801B95C
	adds r0, r2, r7
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0801B95C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0801B970
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _0801B944
_0801B970:
	adds r0, r4, #0
	b _0801B98E
	.align 2, 0
_0801B974: .4byte gMultiplayerConnections
_0801B978: .4byte gMultiplayerCharacters
_0801B97C: .4byte gGameMode
_0801B980: .4byte gMultiplayerPlayerTasks
_0801B984: .4byte gMultiplayerCharRings
_0801B988:
	ldr r0, _0801B9F4 @ =gMultiplayerCharRings
	adds r0, r5, r0
	ldrb r0, [r0]
_0801B98E:
	bl Base10DigitsToHexNibbles
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xff
	bls _0801B9F8
	lsrs r1, r4, #8
	movs r0, #0xf
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	ldr r1, [sp]
	ldrh r0, [r1, #0x16]
	adds r0, #3
	strh r0, [r7, #0x16]
	movs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	lsrs r1, r4, #4
	movs r0, #0xf
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	ldr r1, [sp]
	ldrh r0, [r1, #0x16]
	adds r0, #0xb
	strh r0, [r7, #0x16]
	movs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	movs r1, #0xf
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	ldr r4, [sp]
	ldrh r0, [r4, #0x16]
	adds r0, #0x13
	b _0801BA32
	.align 2, 0
_0801B9F4: .4byte gMultiplayerCharRings
_0801B9F8:
	cmp r4, #0xf
	bls _0801BA40
	lsrs r1, r4, #4
	movs r0, #0xf
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	ldr r1, [sp]
	ldrh r0, [r1, #0x16]
	adds r0, #7
	strh r0, [r7, #0x16]
	movs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	movs r1, #0xf
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	ldr r4, [sp]
	ldrh r0, [r4, #0x16]
	adds r0, #0xf
_0801BA32:
	strh r0, [r7, #0x16]
	movs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	b _0801BA60
_0801BA40:
	movs r0, #0xf
	ands r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	mov r4, sl
	adds r7, r4, r1
	ldr r1, [sp]
	ldrh r0, [r1, #0x16]
	adds r0, #0xb
	strh r0, [r7, #0x16]
	movs r4, #0xe
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
_0801BA60:
	mov r5, sb
	cmp r5, #3
	bhi _0801BA86
	ldr r0, _0801BA98 @ =gMultiplayerConnections
	ldrb r0, [r0]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801BA86
	ldr r0, _0801BA9C @ =gGameMode
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #5
	beq _0801BA80
	b _0801B87E
_0801BA80:
	cmp r5, #2
	beq _0801BA86
	b _0801B87E
_0801BA86:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BA98: .4byte gMultiplayerConnections
_0801BA9C: .4byte gGameMode

.syntax divided
