.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable078
initSprite_Interactable078: @ 0x0807AC04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
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
	ldr r0, _0807ACD4 @ =Task_Interactable078
	ldr r2, _0807ACD8 @ =0x00002010
	ldr r1, _0807ACDC @ =TaskDestructor_Interactable078
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r2, r6
	mov r1, sb
	str r1, [r6]
	movs r3, #0
	movs r1, #0
	strh r4, [r6, #4]
	strh r5, [r6, #6]
	mov r7, sb
	ldrb r0, [r7]
	strb r0, [r6, #8]
	mov r0, r8
	strb r0, [r6, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r6, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r6, #0x40]
	ldr r7, _0807ACE0 @ =IWRAM_START + 0xC
	adds r4, r2, r7
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _0807ACE4 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r7, #0x22
	adds r1, r2, r7
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807ACE8 @ =IWRAM_START + 0x31
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x2a
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807ACEC @ =0x0000FFFF
	strh r0, [r4, #0xa]
	ldr r2, [sp, #4]
	ldr r4, _0807ACF0 @ =IWRAM_START + 0x2C
	adds r2, r2, r4
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r2]
	adds r0, r6, #0
	movs r1, #1
	bl sub_807ACF4
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	mov r1, sb
	strb r0, [r1]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ACD4: .4byte Task_Interactable078
_0807ACD8: .4byte 0x00002010
_0807ACDC: .4byte TaskDestructor_Interactable078
_0807ACE0: .4byte IWRAM_START + 0xC
_0807ACE4: .4byte IWRAM_START + 0x2D
_0807ACE8: .4byte IWRAM_START + 0x31
_0807ACEC: .4byte 0x0000FFFF
_0807ACF0: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807ACF4
sub_807ACF4: @ 0x0807ACF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r6, #0
	adds r5, #0xc
	ldr r0, _0807AD2C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x8f
	lsls r1, r1, #1
	bl __umodsi3
	adds r2, r0, #0
	cmp r2, #0x77
	bhi _0807AD68
	movs r0, #0xf
	ands r2, r0
	cmp r4, #0
	beq _0807AD30
	cmp r2, #7
	bls _0807AD34
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #9
	b _0807AD40
	.align 2, 0
_0807AD2C: .4byte gUnknown_03005590
_0807AD30:
	cmp r2, #0
	bne _0807AD4A
_0807AD34:
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #8
_0807AD40:
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	b _0807AD62
_0807AD4A:
	cmp r2, #8
	bne _0807AD62
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #9
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
_0807AD62:
	movs r0, #0
	str r0, [r6, #0x44]
	b _0807AE52
_0807AD68:
	cmp r2, #0xb8
	bhi _0807ADA4
	subs r2, #0x78
	movs r3, #1
	ldr r0, _0807AD9C @ =gUnknown_080E00FC
	adds r1, r0, #0
	ldr r0, _0807ADA0 @ =gUnknown_080E00B4
	mov ip, r0
	adds r7, r6, #0
	adds r7, #0x2c
	ldrh r0, [r1, #4]
	cmp r2, r0
	blo _0807AE28
	adds r4, r1, #0
_0807AD84:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bhi _0807AE28
	lsls r0, r3, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r2, r0
	bhs _0807AD84
	b _0807AE28
	.align 2, 0
_0807AD9C: .4byte gUnknown_080E00FC
_0807ADA0: .4byte gUnknown_080E00B4
_0807ADA4:
	cmp r2, #0xf4
	bhi _0807ADFC
	subs r2, #0xb9
	movs r0, #0xf
	ands r2, r0
	cmp r4, #0
	beq _0807ADC4
	cmp r2, #7
	bls _0807ADC8
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #3
	b _0807ADD4
_0807ADC4:
	cmp r2, #0
	bne _0807ADDE
_0807ADC8:
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #2
_0807ADD4:
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	b _0807ADF6
_0807ADDE:
	cmp r2, #8
	bne _0807ADF6
	movs r0, #0x95
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #3
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
_0807ADF6:
	movs r0, #1
	str r0, [r6, #0x44]
	b _0807AE52
_0807ADFC:
	subs r2, #0xf5
	movs r3, #1
	ldr r0, _0807AE58 @ =gUnknown_080E00D4
	ldr r1, _0807AE5C @ =gUnknown_080E00B4
	mov ip, r1
	adds r7, r6, #0
	adds r7, #0x2c
	adds r1, r0, #0
	ldrh r0, [r1, #4]
	cmp r2, r0
	blo _0807AE28
	adds r4, r1, #0
_0807AE14:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bhi _0807AE28
	lsls r0, r3, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r2, r0
	bhs _0807AE14
_0807AE28:
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	mov r2, ip
	adds r0, r1, r2
	ldrh r0, [r0]
	movs r4, #0
	strh r0, [r5, #0xa]
	mov r0, ip
	adds r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r7]
	adds r0, r5, #0
	bl sub_8004558
	str r4, [r6, #0x44]
_0807AE52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AE58: .4byte gUnknown_080E00D4
_0807AE5C: .4byte gUnknown_080E00B4

	thumb_func_start sub_807AE60
sub_807AE60: @ 0x0807AE60
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0807AEA0 @ =gPlayer
	ldr r4, [r5, #0x20]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	bne _0807AF02
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AF02
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807AEA4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r4, [r5, #0x12]
	movs r0, #2
	b _0807AF04
	.align 2, 0
_0807AEA0: .4byte gPlayer
_0807AEA4:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807AEC6
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	movs r0, #1
	b _0807AF04
_0807AEC6:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807AEE8
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	movs r0, #3
	b _0807AF04
_0807AEE8:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AF02
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #4
	b _0807AF04
_0807AF02:
	movs r0, #0
_0807AF04:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AF0C
sub_807AF0C: @ 0x0807AF0C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, _0807AF5C @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807AF8A
	adds r5, r2, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #0x10
	strb r0, [r5]
	adds r4, r2, #0
	adds r4, #0x3b
	ldrb r0, [r4]
	adds r0, #0x10
	strb r0, [r4]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	bl sub_800CDBC
	adds r1, r0, #0
	ldrb r0, [r5]
	adds r0, #0x10
	strb r0, [r5]
	ldrb r0, [r4]
	subs r0, #0x10
	strb r0, [r4]
	cmp r1, #0
	beq _0807AF8A
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0807AF60
	movs r0, #2
	b _0807AF8C
	.align 2, 0
_0807AF5C: .4byte gPlayer
_0807AF60:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0807AF6E
	movs r0, #1
	b _0807AF8C
_0807AF6E:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0807AF7C
	movs r0, #3
	b _0807AF8C
_0807AF7C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AF8A
	movs r0, #4
	b _0807AF8C
_0807AF8A:
	movs r0, #0
_0807AF8C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Task_Interactable078
Task_Interactable078: @ 0x0807AF94
	push {r4, lr}
	ldr r0, _0807AFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0
	bl sub_807ACF4
	adds r0, r4, #0
	bl sub_807AE60
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0807AFCA
	adds r0, r4, #0
	bl sub_807AF0C
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0807AFCA
	ldr r0, _0807AFE0 @ =gPlayer
	bl sub_800CBA4
_0807AFCA:
	adds r0, r4, #0
	bl sub_807B028
	cmp r0, #0
	beq _0807AFE4
	adds r0, r4, #0
	bl sub_807B070
	b _0807AFEA
	.align 2, 0
_0807AFDC: .4byte gCurTask
_0807AFE0: .4byte gPlayer
_0807AFE4:
	adds r0, r4, #0
	bl sub_807B004
_0807AFEA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable078
TaskDestructor_Interactable078: @ 0x0807AFF0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807B004
sub_807B004: @ 0x0807B004
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B024 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	adds r0, #0xc
	bl sub_80051E8
	pop {r0}
	bx r0
	.align 2, 0
_0807B024: .4byte gCamera

	thumb_func_start sub_807B028
sub_807B028: @ 0x0807B028
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B064 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0807B060
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B060
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B068
_0807B060:
	movs r0, #1
	b _0807B06A
	.align 2, 0
_0807B064: .4byte gCamera
_0807B068:
	movs r0, #0
_0807B06A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B070
sub_807B070: @ 0x0807B070
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807B084 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807B084: .4byte gCurTask
