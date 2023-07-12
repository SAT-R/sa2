.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Flickey
CreateEntity_Flickey: @ 0x08058920
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08058AB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805894C
	ldr r0, _08058ABC @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805894C
	b _08058AA6
_0805894C:
	ldr r0, _08058AC0 @ =sub_8058AF4
	movs r1, #0xaa
	lsls r1, r1, #2
	ldr r2, _08058AC4 @ =0x00004040
	ldr r3, _08058AC8 @ =sub_8059398
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _08058ACC @ =IWRAM_START + 0xC
	adds r7, r2, r0
	movs r1, #0
	mov r8, r1
	movs r1, #0
	mov r3, sl
	strh r6, [r3, #4]
	strh r4, [r3, #6]
	mov r0, sb
	str r0, [r3]
	ldrb r0, [r0]
	strb r0, [r3, #8]
	strb r5, [r3, #9]
	ldr r3, _08058AD0 @ =IWRAM_START + 0x8C
	adds r5, r2, r3
	mov r3, sb
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r6, r6, #8
	mov ip, r6
	add r0, ip
	lsls r0, r0, #8
	str r0, [r5]
	ldr r6, _08058AD4 @ =IWRAM_START + 0x90
	adds r3, r2, r6
	mov r6, sb
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r3]
	ldr r6, _08058AD8 @ =IWRAM_START + 0x94
	adds r0, r2, r6
	str r1, [r0]
	adds r6, #4
	adds r0, r2, r6
	str r1, [r0]
	ldr r0, _08058ADC @ =IWRAM_START + 0x9C
	adds r1, r2, r0
	ldr r0, _08058AE0 @ =0x0000FE80
	strh r0, [r1]
	adds r6, #6
	adds r1, r2, r6
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r1, _08058AE4 @ =IWRAM_START + 0x2A4
	adds r0, r2, r1
	mov r6, r8
	strb r6, [r0]
	ldr r0, [r5]
	lsls r0, r0, #8
	ldr r1, [r3]
	lsls r1, r1, #8
	movs r3, #0
	mov r5, ip
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldr r4, _08058AE8 @ =IWRAM_START + 0xA4
	adds r6, r2, r4
	asrs r5, r0, #0x10
	ldr r0, _08058AEC @ =IWRAM_START + 0xA8
	adds r2, r2, r0
	asrs r4, r1, #0x10
_080589EA:
	lsls r1, r3, #3
	adds r0, r6, r1
	str r5, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x3f
	bls _080589EA
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sb
	strb r0, [r3]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08058AF0 @ =0x000001FB
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	mov r7, sl
	adds r7, #0x4c
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	adds r0, r0, r1
	strh r0, [r7, #0x18]
	movs r0, #8
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xfe
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x6c
	strb r5, [r0]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x6d
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x6e
	movs r3, #0x10
	strb r3, [r0]
	adds r0, #3
	strb r5, [r0]
	mov r4, r8
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
_08058AA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058AB8: .4byte gGameMode
_08058ABC: .4byte gDifficultyLevel
_08058AC0: .4byte sub_8058AF4
_08058AC4: .4byte 0x00004040
_08058AC8: .4byte sub_8059398
_08058ACC: .4byte IWRAM_START + 0xC
_08058AD0: .4byte IWRAM_START + 0x8C
_08058AD4: .4byte IWRAM_START + 0x90
_08058AD8: .4byte IWRAM_START + 0x94
_08058ADC: .4byte IWRAM_START + 0x9C
_08058AE0: .4byte 0x0000FE80
_08058AE4: .4byte IWRAM_START + 0x2A4
_08058AE8: .4byte IWRAM_START + 0xA4
_08058AEC: .4byte IWRAM_START + 0xA8
_08058AF0: .4byte 0x000001FB

	thumb_func_start sub_8058AF4
sub_8058AF4: @ 0x08058AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	ldr r0, _08058D1C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov sl, r0
	ldr r0, _08058D20 @ =IWRAM_START + 0xC
	adds r0, r0, r4
	mov sb, r0
	mov r1, sl
	ldr r1, [r1]
	str r1, [sp, #0x2c]
	ldr r2, _08058D24 @ =IWRAM_START + 0x9E
	adds r3, r4, r2
	ldrh r0, [r3]
	adds r0, #0x20
	movs r5, #0
	mov r8, r5
	strh r0, [r3]
	ldr r6, _08058D28 @ =IWRAM_START + 0x94
	adds r5, r4, r6
	ldr r7, _08058D2C @ =IWRAM_START + 0x9C
	adds r0, r4, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	adds r6, #4
	adds r2, r4, r6
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r2, _08058D30 @ =IWRAM_START + 0x8C
	adds r0, r4, r2
	ldr r6, [r0]
	ldr r0, [r5]
	adds r6, r6, r0
	asrs r6, r6, #8
	str r6, [sp, #0x30]
	ldr r3, _08058D34 @ =IWRAM_START + 0x90
	adds r0, r4, r3
	ldr r5, [r0]
	adds r5, r5, r1
	asrs r5, r5, #8
	str r5, [sp, #0x34]
	mov r7, r8
	str r7, [sp]
	ldr r0, _08058D38 @ =sub_801EE64
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	mov r8, r0
	ldr r3, _08058D3C @ =gCamera
	ldr r0, [r3]
	ldr r1, [sp, #0x30]
	subs r0, r1, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r3, #4]
	ldr r7, [sp, #0x34]
	subs r0, r7, r0
	strh r0, [r2, #0x18]
	ldr r0, _08058D40 @ =IWRAM_START + 0x2A4
	adds r2, r4, r0
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r7, _08058D44 @ =IWRAM_START + 0xA4
	adds r0, r4, r7
	adds r0, r0, r1
	str r6, [r0]
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r6, _08058D48 @ =IWRAM_START + 0xA8
	adds r0, r4, r6
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r2]
	subs r7, #0x58
	adds r7, r7, r4
	mov sb, r7
	movs r6, #0
	ldr r0, _08058D40 @ =IWRAM_START + 0x2A4
	adds r0, r4, r0
	str r0, [sp, #0x38]
	adds r7, r3, #0
	ldr r1, _08058D44 @ =IWRAM_START + 0xA4
	adds r1, r4, r1
	str r1, [sp, #0x40]
	ldr r2, _08058D48 @ =IWRAM_START + 0xA8
	adds r2, r4, r2
	str r2, [sp, #0x44]
_08058BCE:
	adds r5, r6, #1
	lsls r0, r5, #4
	ldr r3, [sp, #0x38]
	ldrb r2, [r3]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #3
	mov r4, sl
	adds r4, #0xa4
	adds r4, r4, r2
	ldr r0, [r4]
	ldr r1, [r7]
	subs r0, r0, r1
	mov r6, sb
	strh r0, [r6, #0x16]
	mov r3, sl
	adds r3, #0xa8
	adds r3, r3, r2
	ldr r0, [r3]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r1, [r4]
	ldr r2, [r3]
	mov r0, sb
	bl sub_800C84C
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _08058BCE
	movs r7, #0xc
	add r7, sl
	mov sb, r7
	mov r0, sb
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08058C26
	b _08058D50
_08058C26:
	mov r1, sl
	adds r1, #0xa0
	movs r0, #0x78
	strb r0, [r1]
	movs r0, #0x4c
	add r0, sl
	mov sb, r0
	bl sub_8004558
	movs r6, #0
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x48]
	mov r2, sp
	adds r2, #0x10
	str r2, [sp, #0x4c]
	mov r3, sl
	adds r3, #0x9c
	str r3, [sp, #0x3c]
	ldr r4, [sp, #0x44]
	mov r8, r4
_08058C50:
	movs r0, #0xa9
	lsls r0, r0, #2
	add r0, sl
	adds r5, r6, #1
	lsls r1, r5, #4
	ldrb r0, [r0]
	subs r7, r0, r1
	movs r0, #0x3f
	ands r7, r0
	lsls r3, r7, #3
	ldr r0, [sp, #0x40]
	adds r4, r0, r3
	ldr r0, [r4]
	ldr r2, _08058D3C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r1, sb
	strh r0, [r1, #0x16]
	add r3, r8
	ldr r0, [r3]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r2, sb
	strh r0, [r2, #0x18]
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #2
	mov r1, sp
	adds r1, r1, r2
	adds r1, #8
	ldr r0, [r4]
	str r0, [r1]
	ldr r4, [sp, #0x48]
	adds r1, r4, r2
	ldr r0, [r3]
	str r0, [r1]
	ldr r6, [sp, #0x4c]
	adds r2, r6, r2
	subs r0, r7, #1
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldr r1, [r3]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r2]
	mov r0, sb
	bl sub_80051E8
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _08058C50
	movs r6, #0
	ldr r3, [sp, #0x40]
	ldr r7, [sp, #0x44]
_08058CC2:
	lsls r1, r6, #3
	adds r2, r3, r1
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r0, sp
	adds r0, r0, r4
	adds r0, #8
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r2]
	adds r1, r7, r1
	ldr r2, [sp, #0x48]
	adds r0, r2, r4
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	ldr r5, [sp, #0x3c]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r5, r6, #1
	adds r1, r5, #0
	str r3, [sp, #0x50]
	bl Div
	adds r2, r6, #3
	lsls r2, r2, #3
	ldr r3, [sp, #0x50]
	adds r1, r3, r2
	str r0, [r1]
	adds r2, r7, r2
	ldr r6, [sp, #0x4c]
	adds r4, r6, r4
	ldr r0, [r4]
	lsls r0, r0, #8
	str r0, [r2]
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _08058CC2
	ldr r0, _08058D1C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058D4C @ =sub_80591FC
	str r0, [r1, #8]
	b _08058ECA
	.align 2, 0
_08058D1C: .4byte gCurTask
_08058D20: .4byte IWRAM_START + 0xC
_08058D24: .4byte IWRAM_START + 0x9E
_08058D28: .4byte IWRAM_START + 0x94
_08058D2C: .4byte IWRAM_START + 0x9C
_08058D30: .4byte IWRAM_START + 0x8C
_08058D34: .4byte IWRAM_START + 0x90
_08058D38: .4byte sub_801EE64
_08058D3C: .4byte gCamera
_08058D40: .4byte IWRAM_START + 0x2A4
_08058D44: .4byte IWRAM_START + 0xA4
_08058D48: .4byte IWRAM_START + 0xA8
_08058D4C: .4byte sub_80591FC
_08058D50:
	mov r7, sl
	adds r7, #0x9e
	mov r0, r8
	cmp r0, #0
	bge _08058E06
	mov r1, sb
	ldrh r0, [r1, #0x18]
	add r0, r8
	strh r0, [r1, #0x18]
	mov r2, sl
	adds r2, #0x98
	mov r3, r8
	lsls r1, r3, #8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r7]
	ldr r6, _08058DC4 @ =0x000001FB
	mov r4, sb
	strh r6, [r4, #0xa]
	mov r4, sl
	adds r4, #0x2c
	movs r0, #1
	strb r0, [r4]
	mov r3, sl
	adds r3, #0x2d
	movs r5, #1
	rsbs r5, r5, #0
	mov r8, r5
	movs r0, #0xff
	strb r0, [r3]
	subs r2, #4
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r5, [sp, #0x2c]
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08058DC8
	mov r0, sl
	adds r0, #0x9c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08058DC8
	mov r2, sb
	strh r6, [r2, #0xa]
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r3]
	mov r4, r8
	orrs r0, r4
	strb r0, [r3]
	b _08058DFE
	.align 2, 0
_08058DC4: .4byte 0x000001FB
_08058DC8:
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r5, [sp, #0x2c]
	movs r0, #3
	ldrsb r0, [r5, r0]
	ldrb r6, [r5, #5]
	adds r0, r0, r6
	lsls r0, r0, #3
	cmp r1, r0
	blt _08058E06
	mov r0, sl
	adds r0, #0x9c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08058E06
	movs r1, #0
	ldr r0, _08058E9C @ =0x000001FB
	mov r2, sb
	strh r0, [r2, #0xa]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08058DFE:
	ldr r0, _08058EA0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058EA4 @ =sub_8058EDC
	str r0, [r1, #8]
_08058E06:
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _08058E28
	mov r1, sb
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08058E28
	ldr r0, _08058E9C @ =0x000001FB
	mov r4, sb
	strh r0, [r4, #0xa]
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08058E28:
	mov r0, sl
	adds r0, #0x8c
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r3, _08058EA8 @ =gCamera
	ldr r1, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08058E62
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08058E62
	mov r0, sl
	adds r0, #0x90
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r0, r1, r6
	cmp r2, r0
	bgt _08058E62
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08058EAC
_08058E62:
	mov r7, sb
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08058E88
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08058E88
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058EAC
_08058E88:
	mov r3, sl
	ldrb r0, [r3, #8]
	ldr r4, [sp, #0x2c]
	strb r0, [r4]
	ldr r0, _08058EA0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058ECA
	.align 2, 0
_08058E9C: .4byte 0x000001FB
_08058EA0: .4byte gCurTask
_08058EA4: .4byte sub_8058EDC
_08058EA8: .4byte gCamera
_08058EAC:
	ldr r5, [sp, #0x30]
	lsls r0, r5, #8
	ldr r6, [sp, #0x34]
	lsls r1, r6, #8
	bl sub_80122DC
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	mov r0, sl
	bl sub_8059320
_08058ECA:
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8058EDC
sub_8058EDC: @ 0x08058EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _080590C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _080590C8 @ =IWRAM_START + 0xC
	adds r0, r0, r2
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp, #0x24]
	ldr r3, _080590CC @ =IWRAM_START + 0x8C
	adds r0, r2, r3
	ldr r4, _080590D0 @ =IWRAM_START + 0x94
	adds r1, r2, r4
	ldr r5, [r0]
	ldr r0, [r1]
	adds r5, r5, r0
	asrs r5, r5, #8
	str r5, [sp, #0x28]
	ldr r7, _080590D4 @ =IWRAM_START + 0x90
	adds r0, r2, r7
	adds r3, #0xc
	adds r1, r2, r3
	ldr r4, [r0]
	ldr r0, [r1]
	adds r4, r4, r0
	asrs r4, r4, #8
	str r4, [sp, #0x2c]
	ldr r6, _080590D8 @ =gCamera
	ldr r0, [r6]
	adds r7, r5, #0
	subs r0, r7, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r6, #4]
	ldr r3, [sp, #0x2c]
	subs r0, r3, r0
	strh r0, [r1, #0x18]
	ldr r7, _080590DC @ =IWRAM_START + 0x2A4
	adds r3, r2, r7
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r7, _080590E0 @ =IWRAM_START + 0xA4
	adds r0, r2, r7
	adds r0, r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r5, _080590E4 @ =IWRAM_START + 0xA8
	adds r0, r2, r5
	adds r0, r0, r1
	str r4, [r0]
	ldrb r0, [r3]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r3]
	subs r7, #0x58
	adds r7, r7, r2
	mov r8, r7
	movs r7, #0
	ldr r0, _080590DC @ =IWRAM_START + 0x2A4
	adds r0, r0, r2
	mov sl, r0
	ldr r1, _080590E0 @ =IWRAM_START + 0xA4
	adds r1, r2, r1
	str r1, [sp, #0x3c]
	adds r3, r5, #0
	adds r3, r2, r3
	str r3, [sp, #0x40]
_08058F7A:
	adds r5, r7, #1
	lsls r0, r5, #4
	mov r4, sl
	ldrb r2, [r4]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #3
	mov r4, sb
	adds r4, #0xa4
	adds r4, r4, r2
	ldr r0, [r4]
	ldr r1, [r6]
	subs r0, r0, r1
	mov r7, r8
	strh r0, [r7, #0x16]
	mov r3, sb
	adds r3, #0xa8
	adds r3, r3, r2
	ldr r0, [r3]
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldr r1, [r4]
	ldr r2, [r3]
	mov r0, r8
	bl sub_800C84C
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	cmp r7, #2
	bls _08058F7A
	movs r0, #0xc
	add r0, sb
	mov r8, r0
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08058FD0
	b _080590EC
_08058FD0:
	mov r1, sb
	adds r1, #0xa0
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _080590C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080590E8 @ =sub_80591FC
	str r0, [r1, #8]
	movs r1, #0x4c
	add r1, sb
	mov r8, r1
	mov r0, r8
	bl sub_8004558
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0x30]
	mov r3, sp
	adds r3, #8
	str r3, [sp, #0x34]
	mov r4, sb
	adds r4, #0x9c
	str r4, [sp, #0x38]
	ldr r5, [sp, #0x40]
	mov sl, r5
_08059004:
	movs r0, #0xa9
	lsls r0, r0, #2
	add r0, sb
	adds r5, r7, #1
	lsls r1, r5, #4
	ldrb r0, [r0]
	subs r6, r0, r1
	movs r0, #0x3f
	ands r6, r0
	lsls r3, r6, #3
	ldr r0, [sp, #0x3c]
	adds r4, r0, r3
	ldr r0, [r4]
	ldr r2, _080590D8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	add r3, sl
	ldr r0, [r3]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #0x18]
	lsls r2, r7, #1
	adds r2, r2, r7
	lsls r2, r2, #2
	mov r7, sp
	adds r1, r7, r2
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, [sp, #0x30]
	adds r1, r0, r2
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, [sp, #0x34]
	adds r2, r1, r2
	subs r0, r6, #1
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldr r1, [r3]
	ldr r0, [r0]
	subs r1, r1, r0
	str r1, [r2]
	mov r0, r8
	bl sub_80051E8
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	cmp r7, #2
	bls _08059004
	movs r7, #0
	ldr r3, [sp, #0x3c]
	ldr r6, [sp, #0x40]
_08059074:
	lsls r1, r7, #3
	adds r2, r3, r1
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #2
	mov r5, sp
	adds r0, r5, r4
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r2]
	adds r1, r6, r1
	ldr r2, [sp, #0x30]
	adds r0, r2, r4
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	ldr r5, [sp, #0x38]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r5, r7, #1
	adds r1, r5, #0
	str r3, [sp, #0x44]
	bl Div
	adds r2, r7, #3
	lsls r2, r2, #3
	ldr r3, [sp, #0x44]
	adds r1, r3, r2
	str r0, [r1]
	adds r2, r6, r2
	ldr r7, [sp, #0x34]
	adds r4, r7, r4
	ldr r0, [r4]
	lsls r0, r0, #8
	str r0, [r2]
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	cmp r7, #2
	bls _08059074
	b _080591E0
	.align 2, 0
_080590C4: .4byte gCurTask
_080590C8: .4byte IWRAM_START + 0xC
_080590CC: .4byte IWRAM_START + 0x8C
_080590D0: .4byte IWRAM_START + 0x94
_080590D4: .4byte IWRAM_START + 0x90
_080590D8: .4byte gCamera
_080590DC: .4byte IWRAM_START + 0x2A4
_080590E0: .4byte IWRAM_START + 0xA4
_080590E4: .4byte IWRAM_START + 0xA8
_080590E8: .4byte sub_80591FC
_080590EC:
	mov r0, sb
	adds r0, #0x8c
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r3, _08059160 @ =gCamera
	ldr r1, [r3]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _08059126
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08059126
	mov r0, sb
	adds r0, #0x90
	ldr r0, [r0]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08059126
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08059168
_08059126:
	mov r7, r8
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805914C
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805914C
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059168
_0805914C:
	mov r3, sb
	ldrb r0, [r3, #8]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	ldr r0, _08059164 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080591E0
	.align 2, 0
_08059160: .4byte gCamera
_08059164: .4byte gCurTask
_08059168:
	ldr r5, [sp, #0x28]
	lsls r0, r5, #8
	ldr r7, [sp, #0x2c]
	lsls r1, r7, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	cmp r0, #0
	bne _080591D4
	mov r0, r8
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080591A8
	ldr r0, _080591A0 @ =0xFFFFFBFF
	ands r1, r0
	mov r2, r8
	str r1, [r2, #0x10]
	mov r1, sb
	adds r1, #0x9c
	ldr r0, _080591A4 @ =0x0000FE80
	b _080591B6
	.align 2, 0
_080591A0: .4byte 0xFFFFFBFF
_080591A4: .4byte 0x0000FE80
_080591A8:
	orrs r1, r2
	mov r3, r8
	str r1, [r3, #0x10]
	mov r1, sb
	adds r1, #0x9c
	movs r0, #0xc0
	lsls r0, r0, #1
_080591B6:
	strh r0, [r1]
	ldr r0, _080591F0 @ =0x000001FB
	mov r4, r8
	strh r0, [r4, #0xa]
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080591F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080591F8 @ =sub_8058AF4
	str r0, [r1, #8]
_080591D4:
	mov r0, r8
	bl sub_80051E8
	mov r0, sb
	bl sub_8059320
_080591E0:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080591F0: .4byte 0x000001FB
_080591F4: .4byte gCurTask
_080591F8: .4byte sub_8058AF4

	thumb_func_start sub_80591FC
sub_80591FC: @ 0x080591FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _0805922C @ =gCurTask
	ldr r0, [r2]
	ldrh r4, [r0, #6]
	ldr r0, _08059230 @ =IWRAM_START + 0x4C
	adds r7, r4, r0
	adds r0, #0x54
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059234
	ldr r0, [r2]
	bl TaskDestroy
	b _080592F8
	.align 2, 0
_0805922C: .4byte gCurTask
_08059230: .4byte IWRAM_START + 0x4C
_08059234:
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	mov r8, r0
	ldr r0, _08059308 @ =IWRAM_START + 0xA4
	adds r0, r0, r4
	mov sl, r0
	ldr r0, _0805930C @ =IWRAM_START + 0xA0
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, _08059310 @ =IWRAM_START + 0xA8
	adds r0, r0, r4
	mov sb, r0
_08059250:
	mov r1, r8
	adds r1, #3
	lsls r1, r1, #3
	mov r0, sb
	adds r4, r0, r1
	ldr r0, [r4]
	adds r0, #0x30
	str r0, [r4]
	mov r0, r8
	lsls r2, r0, #3
	mov r0, sl
	adds r6, r0, r2
	add r1, sl
	ldr r0, [r6]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r6]
	mov r0, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r1, [r4]
	adds r0, r0, r1
	str r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r6]
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08059314 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080592A6
	lsls r0, r0, #8
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
_080592A6:
	ldr r0, [sp, #8]
	ldrb r2, [r0]
	cmp r2, #0x2d
	bhi _080592BE
	ldr r0, _08059318 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080592EA
	cmp r2, #0x2c
	bhi _080592EA
_080592BE:
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r2, _0805931C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r7, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_080592EA:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _08059250
_080592F8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059308: .4byte IWRAM_START + 0xA4
_0805930C: .4byte IWRAM_START + 0xA0
_08059310: .4byte IWRAM_START + 0xA8
_08059314: .4byte sub_801EE64
_08059318: .4byte gUnknown_03005590
_0805931C: .4byte gCamera

	thumb_func_start sub_8059320
sub_8059320: @ 0x08059320
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #0
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r7, _08059394 @ =gCamera
_0805933E:
	adds r4, #1
	lsls r0, r4, #4
	mov r1, r8
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #3
	adds r0, r6, #0
	adds r0, #0xa4
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0xa8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805933E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059394: .4byte gCamera

	thumb_func_start sub_8059398
sub_8059398: @ 0x08059398
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x50]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
