.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; Referenced inside gUnknown_080D798C
	thumb_func_start CreateEggBomberTank
CreateEggBomberTank: @ 0x0803CCA8
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
	ldr r1, _0803CD10 @ =gPseudoRandom
	ldr r0, _0803CD14 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803CD18 @ =Task_EggBomberTankMain
	movs r1, #0xda
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803CD1C @ =TaskDestructor_EggBomberTankMain
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
_0803CD10: .4byte gPseudoRandom
_0803CD14: .4byte gUnknown_03005590
_0803CD18: .4byte Task_EggBomberTankMain
_0803CD1C: .4byte TaskDestructor_EggBomberTankMain
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
	ldr r0, _0803D084 @ =gActiveBossTask
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
_0803D084: .4byte gActiveBossTask

	thumb_func_start Task_803D088
Task_803D088: @ 0x0803D088
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
	ldr r1, _0803D1F4 @ =gNumLives
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
_0803D1F4: .4byte gNumLives
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
	ldr r0, _0803D2BC @ =Task_803E520
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
_0803D2BC: .4byte Task_803E520

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
	ldr r2, _0803D354 @ =gPseudoRandom
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
_0803D354: .4byte gPseudoRandom
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
	ldr r1, _0803D948 @ =gNumLives
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
_0803D948: .4byte gNumLives
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
	ldr r1, _0803DE28 @ =gNumLives
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
_0803DE28: .4byte gNumLives
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
	ldr r0, _0803DF0C @ =Task_803D088
	str r0, [r1, #8]
	movs r0, #0xf1
	bl m4aSongNumStart
	mov r0, r8
	ldrh r3, [r0]
	movs r0, #0x40
	str r0, [sp]
	ldr r4, _0803DF10 @ =gUnknown_080D7B13
	ldr r2, _0803DF14 @ =gPseudoRandom
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
_0803DF0C: .4byte Task_803D088
_0803DF10: .4byte gUnknown_080D7B13
_0803DF14: .4byte gPseudoRandom
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
	ldr r3, _0803E2C4 @ =gPseudoRandom
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
_0803E2C4: .4byte gPseudoRandom
_0803E2C8: .4byte 0x00196225
_0803E2CC: .4byte 0x3C6EF35F
_0803E2D0: .4byte gCamera
_0803E2D4: .4byte 0x06012980
_0803E2D8: .4byte 0x0000026B
_0803E2DC:
	ldr r1, _0803E3CC @ =gPseudoRandom
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
_0803E3CC: .4byte gPseudoRandom
_0803E3D0: .4byte 0x00196225
_0803E3D4: .4byte 0x3C6EF35F
_0803E3D8: .4byte 0x00000103
_0803E3DC: .4byte gCamera
_0803E3E0: .4byte 0x000003FF
_0803E3E4: .4byte gUnknown_080D79D0
_0803E3E8: .4byte 0x06010000

	thumb_func_start sub_803E3EC
sub_803E3EC: @ 0x0803E3EC
	ldr r2, _0803E438 @ =gActiveBossTask
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
_0803E438: .4byte gActiveBossTask

	thumb_func_start Task_EggBomberTankMain
Task_EggBomberTankMain: @ 0x0803E43C
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
	ldr r0, _0803E51C @ =Task_803E520
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
_0803E51C: .4byte Task_803E520

	thumb_func_start Task_803E520
Task_803E520: @ 0x0803E520
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
	ldr r2, _0803E59C @ =gPseudoRandom
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
_0803E59C: .4byte gPseudoRandom
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
	ldr r2, _0803E62C @ =gPseudoRandom
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
_0803E62C: .4byte gPseudoRandom
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
	ldr r5, _0803E744 @ =gPseudoRandom
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
_0803E744: .4byte gPseudoRandom
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

	thumb_func_start TaskDestructor_EggBomberTankMain
TaskDestructor_EggBomberTankMain: @ 0x0803E768
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
	ldr r1, _0803E794 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E790: .4byte IWRAM_START + 0x84
_0803E794: .4byte gActiveBossTask

@; Unused?
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
