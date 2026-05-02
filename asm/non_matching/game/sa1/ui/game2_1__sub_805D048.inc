.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	bl sub_80535FC
	ldr r1, _0805D0B0 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	ldr r0, _0805D0B4 @ =gSpecialStageCollectedRings
	ldr r1, _0805D0B8 @ =gSpecialStageTargetRings
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	blo _0805D0DA
	movs r0, #0x2f
	bl m4aSongNumStart
	movs r0, #1
	str r0, [sp, #0x24]
	ldr r1, _0805D0BC @ =0x00002710
	str r1, [sp, #0x20]
	ldr r3, _0805D0C0 @ =gLoadedSaveGame
	ldrb r2, [r3, #0x1d]
	ldr r1, _0805D0C4 @ =gUnknown_08487134
	ldr r0, _0805D0C8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	asrs r0, r1
	ldr r4, [sp, #0x24]
	ands r0, r4
	cmp r0, #0
	beq _0805D0CC
	movs r0, #1
	mov r8, r0
	b _0805D0EC
	.align 2, 0
_0805D0B0: .4byte gBgScrollRegs
_0805D0B4: .4byte gSpecialStageCollectedRings
_0805D0B8: .4byte gSpecialStageTargetRings
_0805D0BC: .4byte 0x00002710
_0805D0C0: .4byte gLoadedSaveGame
_0805D0C4: .4byte gUnknown_08487134
_0805D0C8: .4byte gCurrentLevel
_0805D0CC:
	ldr r0, [sp, #0x24]
	lsls r0, r1
	orrs r2, r0
	strb r2, [r3, #0x1d]
	movs r1, #0
	mov r8, r1
	b _0805D0EC
_0805D0DA:
	movs r0, #0x2e
	bl m4aSongNumStart
	movs r2, #0
	mov r8, r2
	movs r3, #0
	str r3, [sp, #0x24]
	movs r4, #0
	str r4, [sp, #0x20]
_0805D0EC:
	ldr r0, _0805D164 @ =gLoadedSaveGame
	ldrb r0, [r0, #0x1d]
	mov sb, r0
	ldr r0, _0805D168 @ =gSpecialStageCollectedRings
	ldrh r0, [r0]
	mov sl, r0
	ldr r0, _0805D16C @ =gUnknown_0300507C
	ldrb r0, [r0]
	add r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0805D170 @ =sa2__gUnknown_0300543C
	ldrb r0, [r1]
	add r0, r8
	strb r0, [r1]
	ldr r1, _0805D174 @ =gLevelScore
	ldr r6, [r1]
	movs r0, #0x64
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	adds r0, r6, r0
	str r0, [r1]
	ldr r4, _0805D178 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl Div
	cmp r5, r0
	beq _0805D146
	ldr r0, _0805D17C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D146
	ldr r1, _0805D180 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0805D146:
	movs r0, #0x64
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	cmp r1, r0
	bls _0805D184
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _0805D186
	.align 2, 0
_0805D164: .4byte gLoadedSaveGame
_0805D168: .4byte gSpecialStageCollectedRings
_0805D16C: .4byte gUnknown_0300507C
_0805D170: .4byte sa2__gUnknown_0300543C
_0805D174: .4byte gLevelScore
_0805D178: .4byte 0x0000C350
_0805D17C: .4byte gGameMode
_0805D180: .4byte gNumLives
_0805D184:
	mov r7, sl
_0805D186:
	bl UiGfxStackInit
	ldr r0, _0805D4B4 @ =Task_805D684
	movs r5, #0
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0xc]
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r2, r1, r3
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	movs r0, #0xf0
	strh r0, [r2, #0xa]
	movs r0, #0x7e
	strh r0, [r2, #0xc]
	movs r4, #8
	strh r4, [r2, #0xe]
	strh r4, [r2, #0x10]
	movs r0, #0xe
	strh r0, [r2, #0x12]
	movs r3, #1
	strb r3, [r2, #0x16]
	movs r0, #0xa
	strh r0, [r2, #8]
	ldr r4, _0805D4BC @ =0x03000028
	adds r0, r1, r4
	add r3, sp, #0x24
	ldrb r3, [r3]
	strb r3, [r0]
	adds r4, #1
	adds r0, r1, r4
	mov r3, sb
	strb r3, [r0]
	adds r4, #1
	adds r1, r1, r4
	mov r0, r8
	strb r0, [r1]
	mov r1, sl
	strh r1, [r2, #0x26]
	ldr r3, [sp, #0x20]
	str r3, [r2, #0x18]
	movs r4, #0
	str r4, [r2, #0x1c]
	ldr r0, _0805D4C0 @ =Task_805D720
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #8]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r2, #0xa]
	movs r0, #0x80
	strh r0, [r2, #0xc]
	movs r0, #9
	strh r0, [r2, #0xe]
	movs r4, #2
	strh r4, [r2, #0x10]
	movs r0, #0xf
	strh r0, [r2, #0x12]
	movs r0, #1
	strb r0, [r2, #0x16]
	strh r5, [r2, #8]
	ldr r3, _0805D4BC @ =0x03000028
	adds r0, r1, r3
	add r4, sp, #0x24
	ldrb r4, [r4]
	strb r4, [r0]
	adds r3, #1
	adds r0, r1, r3
	mov r4, sb
	strb r4, [r0]
	ldr r0, _0805D4C4 @ =0x0300002A
	adds r1, r1, r0
	mov r3, r8
	strb r3, [r1]
	mov r4, sl
	strh r4, [r2, #0x26]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x18]
	movs r1, #0
	str r1, [r2, #0x1c]
	ldr r0, _0805D4C8 @ =Task_805D8EC
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0x10]
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r2, r1, r3
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r2]
	strh r5, [r2, #2]
	strh r5, [r2, #4]
	strh r5, [r2, #6]
	movs r6, #0x39
	strh r6, [r2, #0xa]
	movs r0, #0x49
	strh r0, [r2, #0xc]
	movs r4, #3
	strh r4, [r2, #0xe]
	strh r4, [r2, #0x10]
	movs r0, #0xe
	strh r0, [r2, #0x12]
	movs r3, #1
	strb r3, [r2, #0x16]
	movs r0, #0x18
	strh r0, [r2, #8]
	ldr r0, _0805D4BC @ =0x03000028
	add r3, sp, #0x24
	ldrb r3, [r3]
	strb r3, [r0, r1]
	ldr r3, _0805D4CC @ =0x03000029
	adds r0, r1, r3
	mov r3, sb
	strb r3, [r0]
	ldr r0, _0805D4C4 @ =0x0300002A
	adds r1, r1, r0
	mov r3, r8
	strb r3, [r1]
	mov r0, sl
	strh r0, [r2, #0x26]
	ldr r1, [sp, #0x20]
	str r1, [r2, #0x18]
	movs r3, #0
	str r3, [r2, #0x1c]
	ldr r0, _0805D4D0 @ =Task_805DB04
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	bl TaskCreate
	str r0, [sp, #0x14]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r2]
	strh r5, [r2, #2]
	strh r5, [r2, #4]
	movs r0, #1
	strh r0, [r2, #6]
	strh r6, [r2, #0xa]
	strh r6, [r2, #0xc]
	strh r4, [r2, #0xe]
	strh r4, [r2, #0x10]
	movs r3, #0xe
	strh r3, [r2, #0x12]
	strb r0, [r2, #0x16]
	movs r0, #0x10
	strh r0, [r2, #8]
	ldr r3, _0805D4BC @ =0x03000028
	add r0, sp, #0x24
	ldrb r0, [r0]
	strb r0, [r3, r1]
	adds r3, #1
	adds r0, r1, r3
	mov r3, sb
	strb r3, [r0]
	ldr r0, _0805D4C4 @ =0x0300002A
	adds r1, r1, r0
	mov r3, r8
	strb r3, [r1]
	mov r0, sl
	strh r0, [r2, #0x26]
	ldr r1, [sp, #0x20]
	str r1, [r2, #0x18]
	movs r3, #0
	str r3, [r2, #0x1c]
	ldr r0, _0805D4D4 @ =Task_805DD10
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	bl TaskCreate
	str r0, [sp, #0x18]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r2]
	strh r5, [r2, #2]
	strh r5, [r2, #4]
	movs r0, #2
	strh r0, [r2, #6]
	strh r6, [r2, #0xa]
	strh r6, [r2, #0xc]
	strh r4, [r2, #0xe]
	strh r4, [r2, #0x10]
	movs r3, #0xe
	strh r3, [r2, #0x12]
	movs r0, #1
	strb r0, [r2, #0x16]
	movs r3, #8
	strh r3, [r2, #8]
	ldr r0, _0805D4BC @ =0x03000028
	add r3, sp, #0x24
	ldrb r3, [r3]
	strb r3, [r0, r1]
	ldr r3, _0805D4CC @ =0x03000029
	adds r0, r1, r3
	mov r3, sb
	strb r3, [r0]
	ldr r0, _0805D4C4 @ =0x0300002A
	adds r1, r1, r0
	mov r3, r8
	strb r3, [r1]
	mov r0, sl
	strh r0, [r2, #0x26]
	ldr r1, [sp, #0x20]
	str r1, [r2, #0x18]
	movs r3, #0
	str r3, [r2, #0x1c]
	ldr r0, _0805D4D8 @ =Task_805DF2C
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	bl TaskCreate
	str r0, [sp, #0x1c]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r2]
	strh r5, [r2, #2]
	strh r5, [r2, #4]
	strh r4, [r2, #6]
	strh r6, [r2, #0xa]
	strh r6, [r2, #0xc]
	strh r4, [r2, #0xe]
	strh r4, [r2, #0x10]
	movs r4, #0xe
	strh r4, [r2, #0x12]
	movs r0, #1
	strb r0, [r2, #0x16]
	strh r5, [r2, #8]
	ldr r3, _0805D4BC @ =0x03000028
	adds r0, r1, r3
	add r4, sp, #0x24
	ldrb r4, [r4]
	strb r4, [r0]
	adds r3, #1
	adds r0, r1, r3
	mov r4, sb
	strb r4, [r0]
	ldr r0, _0805D4C4 @ =0x0300002A
	adds r1, r1, r0
	mov r3, r8
	strb r3, [r1]
	mov r4, sl
	strh r4, [r2, #0x26]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x18]
	movs r1, #0
	str r1, [r2, #0x1c]
	ldr r0, _0805D4DC @ =sub_805E018
	str r5, [sp]
	movs r1, #0x34
	ldr r2, _0805D4B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r1, [r6, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r2, r1, r3
	strh r5, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r5, [r2, #0x24]
	strh r5, [r2, #0xa]
	movs r0, #0x29
	strh r0, [r2, #0xc]
	movs r4, #1
	strh r4, [r2, #0xe]
	movs r0, #4
	strh r0, [r2, #0x10]
	movs r0, #0xd
	strh r0, [r2, #0x12]
	movs r0, #1
	strb r0, [r2, #0x16]
	strh r5, [r2, #8]
	adds r3, #0x28
	adds r0, r1, r3
	add r4, sp, #0x24
	ldrb r4, [r4]
	strb r4, [r0]
	adds r3, #1
	adds r0, r1, r3
	mov r4, sb
	strb r4, [r0]
	ldr r0, _0805D4C4 @ =0x0300002A
	adds r1, r1, r0
	mov r3, r8
	strb r3, [r1]
	movs r4, #0
	mov r0, sl
	strh r0, [r2, #0x26]
	ldr r1, [sp, #0x20]
	str r1, [r2, #0x18]
	movs r3, #0
	str r3, [r2, #0x1c]
	ldr r0, _0805D4E0 @ =sub_805D4F0
	movs r2, #0x84
	lsls r2, r2, #6
	ldr r1, _0805D4E4 @ =TaskDestructor_805E1E4
	str r1, [sp]
	movs r1, #0x2c
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r5, [r0, #0x28]
	strh r7, [r0, #0x2a]
	ldr r2, [sp, #0xc]
	str r2, [r0, #0x1c]
	ldr r3, [sp, #8]
	str r3, [r0, #0x18]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0xc]
	ldr r2, [sp, #0x14]
	str r2, [r0, #0x24]
	ldr r3, [sp, #0x18]
	str r3, [r0, #0x10]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x14]
	str r6, [r0, #0x20]
	ldr r3, _0805D4E8 @ =gBgSprites_Unknown1
	strb r4, [r3]
	ldr r0, _0805D4EC @ =gBgSprites_Unknown2
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	strb r4, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	strb r4, [r3, #2]
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r4, [r3, #3]
	strb r4, [r0, #0xc]
	strb r4, [r0, #0xd]
	strb r1, [r0, #0xe]
	strb r2, [r0, #0xf]
	ldr r0, [sp, #4]
	bl sub_805C994
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D4B4: .4byte Task_805D684
_0805D4B8: .4byte 0x00002120
_0805D4BC: .4byte 0x03000028
_0805D4C0: .4byte Task_805D720
_0805D4C4: .4byte 0x0300002A
_0805D4C8: .4byte Task_805D8EC
_0805D4CC: .4byte 0x03000029
_0805D4D0: .4byte Task_805DB04
_0805D4D4: .4byte Task_805DD10
_0805D4D8: .4byte Task_805DF2C
_0805D4DC: .4byte sub_805E018
_0805D4E0: .4byte sub_805D4F0
_0805D4E4: .4byte TaskDestructor_805E1E4
_0805D4E8: .4byte gBgSprites_Unknown1
_0805D4EC: .4byte gBgSprites_Unknown2

.syntax divided
