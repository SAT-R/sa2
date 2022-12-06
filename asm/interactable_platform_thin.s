.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D5468
gUnknown_080D5468:
    .incbin "baserom.gba", 0x000D5468, 0x36
    
    .global gUnknown_080D549E
gUnknown_080D549E:
    .incbin "baserom.gba", 0x000D549E, 0x6E

.text
.syntax unified
.arm

	thumb_func_start initSprite_Interactable_CommonThinPlatform
initSprite_Interactable_CommonThinPlatform: @ 0x08010984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08010A90 @ =sub_8010AB4
	ldr r2, _08010A94 @ =0x00002010
	ldr r1, _08010A98 @ =sub_80111C0
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _08010A9C @ =IWRAM_START + 0xC
	adds r6, r2, r1
	movs r7, #0
	mov sl, r7
	movs r3, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	str r3, [r0, #0x40]
	str r3, [r0, #0x44]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r6, #0x18]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	strb r0, [r1]
	ldr r4, _08010AA0 @ =gUnknown_080D5468
	ldr r5, _08010AA4 @ =gCurrentLevel
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r2, [sp, #4]
	ldr r7, _08010AA8 @ =IWRAM_START + 0x2C
	adds r0, r2, r7
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	ldr r0, _08010AAC @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r4, _08010AB0 @ =IWRAM_START + 0x2E
	adds r1, r2, r4
	movs r0, #0x10
	strb r0, [r1]
	adds r7, #5
	adds r2, r2, r7
	mov r0, sl
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010A90: .4byte sub_8010AB4
_08010A94: .4byte 0x00002010
_08010A98: .4byte sub_80111C0
_08010A9C: .4byte IWRAM_START + 0xC
_08010AA0: .4byte gUnknown_080D5468
_08010AA4: .4byte gCurrentLevel
_08010AA8: .4byte IWRAM_START + 0x2C
_08010AAC: .4byte IWRAM_START + 0x2D
_08010AB0: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_8010AB4
sub_8010AB4: @ 0x08010AB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r6, _08010B58 @ =gPlayer
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _08010B5C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _08010B60 @ =IWRAM_START + 0xC
	adds r2, r1, r2
	str r2, [sp]
	ldr r3, [r0]
	str r3, [sp, #4]
	ldrb r2, [r0, #8]
	lsls r2, r2, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	ldr r4, [sp, #8]
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08010B64 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #0xc]
	asrs r2, r2, #0x10
	subs r0, r2, r0
	ldr r4, [sp]
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	str r3, [sp, #0x10]
	asrs r3, r1, #0x10
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldr r0, _08010B68 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08010B6C
	ldr r4, [sp, #4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010B6C
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_8010D1C
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08010B3E
	b _08010CF0
_08010B3E:
	ldr r0, [r6, #0x3c]
	ldr r2, [sp]
	cmp r0, r2
	beq _08010B48
	b _08010CF0
_08010B48:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r6, #0x20]
	b _08010CF0
	.align 2, 0
_08010B58: .4byte gPlayer
_08010B5C: .4byte gCurTask
_08010B60: .4byte IWRAM_START + 0xC
_08010B64: .4byte gCamera
_08010B68: .4byte gGameMode
_08010B6C:
	ldr r7, [r6, #0x20]
	ldr r0, _08010C00 @ =0x00400080
	ands r7, r0
	cmp r7, #0
	beq _08010B78
	b _08010C84
_08010B78:
	ldr r3, [sp, #0xc]
	lsls r5, r3, #0x10
	asrs r4, r5, #0x10
	mov sb, r4
	ldr r0, [sp, #0x10]
	lsls r4, r0, #0x10
	asrs r1, r4, #0x10
	mov r8, r1
	ldr r0, [sp]
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_800CCB8
	mov sl, r0
	movs r2, #0xc0
	lsls r2, r2, #0xc
	ands r0, r2
	str r4, [sp, #0x18]
	cmp r0, #0
	beq _08010BCE
	ldr r0, [sp]
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_80111F0
	movs r3, #0xc0
	lsls r3, r3, #0xc
	ands r0, r3
	cmp r0, #0
	beq _08010BCE
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	strh r7, [r6, #0x10]
_08010BCE:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08010C84
	adds r0, r6, #0
	adds r0, #0x64
	ldrh r7, [r0]
	adds r0, #4
	ldrh r2, [r0]
	adds r0, #2
	ldrh r4, [r0]
	adds r0, #0x1b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r1, #3
	beq _08010C0A
	cmp r1, #3
	bgt _08010C04
	cmp r1, #0
	beq _08010C36
	b _08010C74
	.align 2, 0
_08010C00: .4byte 0x00400080
_08010C04:
	cmp r1, #4
	beq _08010C36
	b _08010C74
_08010C0A:
	cmp r7, #0x6b
	bne _08010C30
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	ldrh r0, [r6, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r6, #0x12]
	asrs r0, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	bl sub_8010D1C
	b _08010C8A
_08010C30:
	mov r3, sl
	lsls r0, r3, #0x18
	b _08010C78
_08010C36:
	ldr r0, _08010CB0 @ =gUnknown_080D672C
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r7, #0x24
	bne _08010C74
	cmp r2, #0x33
	bne _08010C74
	cmp r4, #1
	bne _08010C74
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	cmp r0, #0
	ble _08010C74
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	asrs r0, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	bl sub_8010D1C
	movs r3, #1
	str r3, [sp, #0x14]
_08010C74:
	mov r4, sl
	lsls r0, r4, #0x18
_08010C78:
	asrs r0, r0, #0x10
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
_08010C84:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08010CB8
_08010C8A:
	ldr r0, _08010CB4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08010CF0
	bl sub_8019224
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r3, [sp, #8]
	ldrh r1, [r3, #4]
	strb r1, [r0, #1]
	ldrh r1, [r3, #6]
	strb r1, [r0, #2]
	ldrb r1, [r3, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
	b _08010CF0
	.align 2, 0
_08010CB0: .4byte gUnknown_080D672C
_08010CB4: .4byte gGameMode
_08010CB8:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r2, _08010CFC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08010CE8
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08010CE8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08010D04
_08010CE8:
	ldr r2, [sp, #8]
	ldrb r0, [r2, #8]
	ldr r3, [sp, #4]
	strb r0, [r3]
_08010CF0:
	ldr r0, _08010D00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08010D0A
	.align 2, 0
_08010CFC: .4byte gCamera
_08010D00: .4byte gCurTask
_08010D04:
	ldr r0, [sp]
	bl sub_80051E8
_08010D0A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8010D1C
sub_8010D1C: @ 0x08010D1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08010F20 @ =sub_8010F78
	ldr r2, _08010F24 @ =0x00002011
	ldr r1, _08010F28 @ =sub_80111D4
	str r1, [sp]
	movs r1, #0xf4
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r1, _08010F2C @ =IWRAM_START + 0xC0
	adds r2, r5, r1
	ldr r3, _08010F30 @ =IWRAM_START + 0xF0
	adds r0, r5, r3
	movs r1, #0
	mov sl, r1
	mov r3, sl
	strh r3, [r0]
	ldr r0, _08010F34 @ =IWRAM_START + 0xF2
	adds r1, r5, r0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	lsls r4, r4, #0x10
	ldr r1, _08010F38 @ =0xFF800000
	adds r4, r4, r1
	lsrs r4, r4, #0x10
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	ldr r0, _08010F3C @ =0xFFCE0000
	add r8, r0
	mov r1, r8
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r3, _08010F40 @ =gUnknown_080D549E
	mov sb, r3
	ldr r0, _08010F44 @ =gCurrentLevel
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _08010F48 @ =IWRAM_START + 0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #8]
	strh r1, [r6, #0x14]
	strh r1, [r6, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08010F4C @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x70
	str r0, [r6, #0x10]
	ldr r2, [sp, #4]
	mov r0, sl
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r4, [r2, #6]
	mov r1, r8
	strh r1, [r2, #8]
	adds r0, r6, #0
	str r2, [sp, #4]
	bl sub_8004558
	ldr r4, _08010F50 @ =0x040000D4
	str r6, [r4]
	ldr r3, _08010F54 @ =IWRAM_START + 0x30
	adds r7, r5, r3
	str r7, [r4, #4]
	ldr r0, _08010F58 @ =0x80000018
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r1, _08010F5C @ =IWRAM_START + 0xCC
	adds r2, r5, r1
	str r2, [r4, #4]
	ldr r3, _08010F60 @ =0x80000006
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x71
	str r0, [r7, #0x10]
	mov r0, r8
	lsls r6, r0, #0x10
	asrs r6, r6, #0x10
	subs r6, #0x10
	strh r6, [r2, #8]
	subs r1, #0x6c
	adds r7, r5, r1
	str r2, [r4]
	ldr r3, _08010F64 @ =IWRAM_START + 0xD8
	adds r2, r5, r3
	str r2, [r4, #4]
	ldr r0, _08010F60 @ =0x80000006
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08010F44 @ =gCurrentLevel
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xa
	add sb, r1
	add r0, sb
	ldrh r1, [r0]
	ldr r3, _08010F68 @ =IWRAM_START + 0x80
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	mov r1, sl
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08010F6C @ =IWRAM_START + 0x82
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x72
	str r0, [r7, #0x10]
	ldr r2, [sp, #4]
	mov r0, r8
	strh r0, [r2, #8]
	adds r0, r7, #0
	str r2, [sp, #4]
	bl sub_8004558
	str r7, [r4]
	ldr r1, _08010F70 @ =IWRAM_START + 0x90
	adds r7, r5, r1
	str r7, [r4, #4]
	ldr r3, _08010F58 @ =0x80000018
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r0, _08010F74 @ =IWRAM_START + 0xE4
	adds r2, r5, r0
	str r2, [r4, #4]
	ldr r1, _08010F60 @ =0x80000006
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x73
	str r0, [r7, #0x10]
	strh r6, [r2, #8]
	adds r0, #0xa3
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010F20: .4byte sub_8010F78
_08010F24: .4byte 0x00002011
_08010F28: .4byte sub_80111D4
_08010F2C: .4byte IWRAM_START + 0xC0
_08010F30: .4byte IWRAM_START + 0xF0
_08010F34: .4byte IWRAM_START + 0xF2
_08010F38: .4byte 0xFF800000
_08010F3C: .4byte 0xFFCE0000
_08010F40: .4byte gUnknown_080D549E
_08010F44: .4byte gCurrentLevel
_08010F48: .4byte IWRAM_START + 0x20
_08010F4C: .4byte IWRAM_START + 0x22
_08010F50: .4byte 0x040000D4
_08010F54: .4byte IWRAM_START + 0x30
_08010F58: .4byte 0x80000018
_08010F5C: .4byte IWRAM_START + 0xCC
_08010F60: .4byte 0x80000006
_08010F64: .4byte IWRAM_START + 0xD8
_08010F68: .4byte IWRAM_START + 0x80
_08010F6C: .4byte IWRAM_START + 0x82
_08010F70: .4byte IWRAM_START + 0x90
_08010F74: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_8010F78
sub_8010F78: @ 0x08010F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08010FB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r7, r1, r0
	ldr r3, _08010FB4 @ =IWRAM_START + 0xF0
	add r3, r8
	str r3, [sp]
	ldrh r0, [r3]
	adds r1, r0, #1
	strh r1, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _08010FB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08011188
	.align 2, 0
_08010FB0: .4byte gCurTask
_08010FB4: .4byte IWRAM_START + 0xF0
_08010FB8:
	ldr r0, _08011198 @ =IWRAM_START + 0xF2
	add r0, r8
	str r0, [sp, #4]
	ldrh r0, [r0]
	adds r0, #0x28
	ldr r1, [sp, #4]
	strh r0, [r1]
	ldr r6, _0801119C @ =IWRAM_START + 0xC0
	add r6, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	subs r2, r2, r0
	strh r2, [r6, #6]
	ldrh r0, [r6, #2]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	ble _08011006
	adds r4, r1, #0
_08011006:
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _080111A4 @ =gUnknown_030054B8
	mov sl, r2
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111A8 @ =IWRAM_START + 0x30
	add r7, r8
	ldr r6, _080111AC @ =IWRAM_START + 0xCC
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B0 @ =IWRAM_START + 0x60
	add r7, r8
	ldr r6, _080111B4 @ =IWRAM_START + 0xD8
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B8 @ =IWRAM_START + 0x90
	add r7, r8
	ldr r6, _080111BC @ =IWRAM_START + 0xE4
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	subs r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
_08011188:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011198: .4byte IWRAM_START + 0xF2
_0801119C: .4byte IWRAM_START + 0xC0
_080111A0: .4byte gCamera
_080111A4: .4byte gUnknown_030054B8
_080111A8: .4byte IWRAM_START + 0x30
_080111AC: .4byte IWRAM_START + 0xCC
_080111B0: .4byte IWRAM_START + 0x60
_080111B4: .4byte IWRAM_START + 0xD8
_080111B8: .4byte IWRAM_START + 0x90
_080111BC: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_80111C0
sub_80111C0: @ 0x080111C0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
    
	thumb_func_start sub_80111D4
sub_80111D4: @ 0x080111D4
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x64]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80111F0
sub_80111F0: @ 0x080111F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	adds r4, #1
	strb r4, [r6]
	adds r5, r0, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	subs r4, #1
	strb r4, [r5]
	bl sub_800CCB8
	ldrb r1, [r6]
	subs r1, #1
	strb r1, [r6]
	ldrb r1, [r5]
	adds r1, #1
	strb r1, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
