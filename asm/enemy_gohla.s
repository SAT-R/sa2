.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Gohla
CreateEntity_Gohla: @ 0x08051788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, _080517F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080517B6
	ldr r0, _080517F8 @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #1
	bne _080517B6
	b _0805190C
_080517B6:
	ldr r0, _080517FC @ =sub_8051928
	ldr r2, _08051800 @ =0x00004040
	ldr r1, _08051804 @ =sub_8051E20
	str r1, [sp]
	movs r1, #0x90
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sl, r0
	ldr r0, _08051808 @ =IWRAM_START + 0xC
	adds r7, r1, r0
	mov r2, sl
	strh r5, [r2, #4]
	mov r0, sb
	strh r0, [r2, #6]
	str r6, [r2]
	ldrb r0, [r6]
	strb r0, [r2, #8]
	strb r4, [r2, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08051810
	ldr r2, _0805180C @ =IWRAM_START + 0x8C
	adds r1, r1, r2
	movs r0, #1
	b _08051816
	.align 2, 0
_080517F4: .4byte gGameMode
_080517F8: .4byte gDifficultyLevel
_080517FC: .4byte sub_8051928
_08051800: .4byte 0x00004040
_08051804: .4byte sub_8051E20
_08051808: .4byte IWRAM_START + 0xC
_0805180C: .4byte IWRAM_START + 0x8C
_08051810:
	ldr r0, _0805191C @ =IWRAM_START + 0x8C
	adds r1, r1, r0
	movs r0, #0
_08051816:
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #3
	lsls r5, r5, #8
	mov r8, r5
	add r1, r8
	lsls r1, r1, #8
	mov r2, sl
	str r1, [r2, #0x74]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r5, r2, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	mov r2, sl
	str r0, [r2, #0x78]
	movs r4, #0
	str r4, [r2, #0x7c]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, #0x8c
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _08051920 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	mov r1, sl
	adds r1, #0x80
	lsls r0, r0, #8
	str r0, [r1]
	mov r0, sl
	adds r0, #0x84
	str r4, [r0]
	adds r0, #4
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, r8
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r0, #9
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08051924 @ =0x000001E3
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
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
	strb r1, [r0]
	adds r0, #3
	strb r2, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	mov sb, r0
	str r0, [r7, #0x10]
	mov r7, sl
	adds r7, #0x44
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #6
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf2
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x64
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x65
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x66
	movs r2, #0x10
	strb r2, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	mov r2, r8
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
_0805190C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805191C: .4byte IWRAM_START + 0x8C
_08051920: .4byte sub_801EE64
_08051924: .4byte 0x000001E3

	thumb_func_start sub_8051928
sub_8051928: @ 0x08051928
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805195C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r1, [r4]
	mov sl, r1
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08051960
	ldr r0, [r4, #0x7c]
	adds r0, #0x80
	b _08051964
	.align 2, 0
_0805195C: .4byte gCurTask
_08051960:
	ldr r0, [r4, #0x7c]
	subs r0, #0x80
_08051964:
	str r0, [r4, #0x7c]
	movs r2, #0x80
	adds r2, r2, r4
	mov r8, r2
	ldr r0, [r4, #0x78]
	ldr r1, [r2]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x74]
	ldr r2, [r4, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r3, #0x8c
	adds r3, r3, r4
	mov sb, r3
	ldrb r2, [r3]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08051A64 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _080519BC
	lsls r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r4, #0x78]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x74]
	ldr r2, [r4, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _08051A68 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_080519BC:
	cmp r0, #0
	ble _080519CA
	lsls r1, r0, #8
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_080519CA:
	ldr r1, [r4, #0x74]
	ldr r0, [r4, #0x7c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r4, #0x78]
	mov r3, r8
	ldr r0, [r3]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r3, _08051A6C @ =gCamera
	ldr r0, [r3]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	adds r0, r4, #0
	str r3, [sp, #8]
	bl sub_8051DC8
	lsls r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #0
	bne _08051A5A
	ldr r0, [r4, #0x74]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _08051A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08051A30
	ldr r0, [r4, #0x78]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08051A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08051A74
_08051A30:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051A54
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051A54
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08051A74
_08051A54:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
_08051A5A:
	ldr r0, _08051A70 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051AD2
	.align 2, 0
_08051A64: .4byte sub_801EE64
_08051A68: .4byte sub_801EC3C
_08051A6C: .4byte gCamera
_08051A70: .4byte gCurTask
_08051A74:
	ldr r0, [r4, #0x7c]
	asrs r2, r0, #8
	mov r0, sl
	movs r1, #3
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	cmp r2, r0
	ble _08051A90
	mov r3, sl
	ldrb r0, [r3, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _08051AAA
_08051A90:
	ldr r0, _08051AE4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051AE8 @ =sub_8051AF0
	str r0, [r1, #8]
	ldr r0, _08051AEC @ =0x000001E3
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08051AAA:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	movs r0, #0x16
	ldrsh r1, [r5, r0]
	ldrh r2, [r5, #0x18]
	subs r2, #4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r5, #0x10]
	adds r0, r4, #0
	bl sub_8051CB8
_08051AD2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051AE4: .4byte gCurTask
_08051AE8: .4byte sub_8051AF0
_08051AEC: .4byte 0x000001E3

	thumb_func_start sub_8051AF0
sub_8051AF0: @ 0x08051AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08051BB0 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	ldr r2, _08051BB4 @ =IWRAM_START + 0xC
	adds r4, r3, r2
	ldr r0, [r5]
	str r0, [sp, #4]
	ldr r1, _08051BB8 @ =IWRAM_START + 0x80
	adds r1, r1, r3
	mov r8, r1
	ldr r0, [r5, #0x78]
	ldr r1, [r1]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _08051BBC @ =IWRAM_START + 0x8C
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	ldr r3, _08051BC0 @ =sub_801EC3C
	mov sl, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08051B64
	lsls r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5, #0x78]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	mov r3, sl
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08051B64:
	cmp r0, #0
	ble _08051B72
	lsls r1, r0, #8
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08051B72:
	ldr r1, [r5, #0x74]
	ldr r0, [r5, #0x7c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r5, #0x78]
	mov r3, r8
	ldr r0, [r3]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r3, _08051BC4 @ =gCamera
	ldr r0, [r3]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r4, #0x18]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl sub_8051DC8
	lsls r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #0
	beq _08051BC8
	ldr r1, _08051BB0 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08051C9A
	.align 2, 0
_08051BB0: .4byte gCurTask
_08051BB4: .4byte IWRAM_START + 0xC
_08051BB8: .4byte IWRAM_START + 0x80
_08051BBC: .4byte IWRAM_START + 0x8C
_08051BC0: .4byte sub_801EC3C
_08051BC4: .4byte gCamera
_08051BC8:
	ldr r0, [r5, #0x74]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _08051BFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08051BFA
	ldr r0, [r5, #0x78]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08051BFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08051C34
_08051BFA:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051C1E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051C1E
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08051C34
_08051C1E:
	ldrb r0, [r5, #8]
	ldr r3, [sp, #4]
	strb r0, [r3]
	ldr r0, _08051C30 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051C9A
	.align 2, 0
_08051C30: .4byte gCurTask
_08051C34:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _08051C80
	ldr r1, [r4, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08051C60
	ldr r0, _08051C5C @ =0xFFFFFBFF
	ands r1, r0
	b _08051C62
	.align 2, 0
_08051C5C: .4byte 0xFFFFFBFF
_08051C60:
	orrs r1, r2
_08051C62:
	str r1, [r4, #0x10]
	movs r1, #0
	ldr r0, _08051CAC @ =0x000001E3
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08051CB0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051CB4 @ =sub_8051928
	str r0, [r1, #8]
_08051C80:
	adds r0, r4, #0
	bl DisplaySprite
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x18]
	subs r2, #4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r4, #0x10]
	adds r0, r5, #0
	bl sub_8051CB8
_08051C9A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051CAC: .4byte 0x000001E3
_08051CB0: .4byte gCurTask
_08051CB4: .4byte sub_8051928

	thumb_func_start sub_8051CB8
sub_8051CB8: @ 0x08051CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r5, r7, #0
	adds r5, #0x44
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r1, r7, #0
	adds r1, #0x88
	ldrh r0, [r1]
	adds r0, #0x18
	ldr r3, _08051D08 @ =0x000003FF
	adds r2, r3, #0
	ands r0, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	adds r0, #0x20
	ands r0, r2
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r4, r1
	cmp r4, #0
	beq _08051D0C
	ldr r0, [r5, #0x10]
	orrs r0, r1
	b _08051D12
	.align 2, 0
_08051D08: .4byte 0x000003FF
_08051D0C:
	ldr r0, [r5, #0x10]
	ldr r1, _08051D8C @ =0xFFFFFBFF
	ands r0, r1
_08051D12:
	str r0, [r5, #0x10]
	movs r6, #0
	adds r0, r7, #0
	adds r0, #0x88
	str r0, [sp, #4]
	adds r7, #0x8a
	mov sl, r7
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	mov r4, sp
	ldr r7, _08051D90 @ =0x000003FF
	adds r3, r7, #0
_08051D32:
	lsls r2, r6, #8
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	adds r2, r2, r0
	ands r2, r3
	strh r2, [r4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #7
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r0, r1
	ands r0, r3
	strh r0, [r4, #2]
	ldrh r0, [r4]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _08051D94 @ =gSineTable
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1a
	mov r7, sb
	asrs r0, r7, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x16]
	ldrh r0, [r4, #2]
	lsls r0, r0, #1
	ldr r1, _08051D94 @ =gSineTable
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1d
	mov r7, r8
	asrs r0, r7, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, _08051D98 @ =0x000001FF
	cmp r2, r0
	bls _08051D9C
	movs r0, #0x88
	lsls r0, r0, #3
	b _08051DA0
	.align 2, 0
_08051D8C: .4byte 0xFFFFFBFF
_08051D90: .4byte 0x000003FF
_08051D94: .4byte gSineTable
_08051D98: .4byte 0x000001FF
_08051D9C:
	movs r0, #0x98
	lsls r0, r0, #3
_08051DA0:
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl DisplaySprite
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #8]
	cmp r6, #3
	bls _08051D32
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8051DC8
sub_8051DC8: @ 0x08051DC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r1, #0
	adds r7, r2, #0
	adds r5, r0, #0
	adds r5, #0xc
	movs r0, #0
	mov r8, r0
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051DEE
	movs r0, #1
	mov r8, r0
	b _08051E0C
_08051DEE:
	ldr r4, _08051E1C @ =gPlayer
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
_08051E0C:
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08051E1C: .4byte gPlayer

	thumb_func_start sub_8051E20
sub_8051E20: @ 0x08051E20
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x48]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
