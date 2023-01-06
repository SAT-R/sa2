.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable069
initSprite_Interactable069: @ 0x08078B1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _08078DB4 @ =Task_Interactable069
	movs r1, #0xe0
	lsls r1, r1, #1
	ldr r2, _08078DB8 @ =0x00002010
	ldr r3, _08078DBC @ =TaskDestructor_Interactable069
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	mov r3, sl
	movs r0, #3
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	ldr r7, _08078DC0 @ =IWRAM_START + 0x1AC
	adds r1, r4, r7
	movs r5, #0
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r7, #2
	adds r3, r4, r7
	strh r0, [r3]
	mov r7, sl
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r7, _08078DC4 @ =IWRAM_START + 0x1B0
	adds r1, r4, r7
	strh r0, [r1]
	mov r1, sl
	ldrb r0, [r1, #6]
	lsls r0, r0, #3
	ldrh r7, [r3]
	adds r0, r0, r7
	ldr r1, _08078DC8 @ =IWRAM_START + 0x1B2
	adds r1, r1, r4
	mov ip, r1
	strh r0, [r1]
	ldr r7, _08078DCC @ =IWRAM_START + 0x1B8
	adds r0, r4, r7
	mov r1, sl
	str r1, [r0]
	ldrb r1, [r1]
	adds r7, #4
	adds r0, r4, r7
	strb r1, [r0]
	ldr r1, _08078DD0 @ =IWRAM_START + 0x1BD
	adds r0, r4, r1
	mov r7, sb
	strb r7, [r0]
	ldr r0, _08078DD4 @ =IWRAM_START + 0x158
	adds r1, r4, r0
	mov r7, sl
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, _08078DD8 @ =IWRAM_START + 0x15C
	adds r1, r4, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r6, r8
	lsls r6, r6, #8
	mov r8, r6
	add r0, r8
	str r0, [r1]
	mov r7, ip
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r6, #0
	ldrsh r1, [r3, r6]
	subs r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xc0
	lsls r1, r1, #3
	str r2, [sp, #4]
	bl __udivsi3
	adds r0, #0x78
	ldr r7, _08078DDC @ =IWRAM_START + 0x160
	adds r1, r4, r7
	strh r0, [r1]
	ldr r1, _08078DE0 @ =IWRAM_START + 0x164
	adds r0, r4, r1
	str r5, [r0]
	ldr r3, _08078DE4 @ =IWRAM_START + 0x168
	adds r0, r4, r3
	str r5, [r0]
	ldr r6, _08078DE8 @ =IWRAM_START + 0x16C
	adds r0, r4, r6
	movs r7, #1
	rsbs r7, r7, #0
	str r7, [r0]
	adds r1, #0xc
	adds r0, r4, r1
	strh r5, [r0]
	movs r0, #0x1f
	bl VramMalloc
	adds r7, r0, #0
	ldr r3, _08078DEC @ =IWRAM_START + 0x1B4
	adds r0, r4, r3
	str r7, [r0]
	ldr r2, [sp, #4]
	movs r6, #0x90
	lsls r6, r6, #3
	strh r6, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078DF0 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08078DF4 @ =IWRAM_START + 0x22
	adds r0, r4, r1
	movs r3, #0x10
	mov sb, r3
	mov r6, sb
	strb r6, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	mov r8, r0
	str r0, [r2, #0x10]
	str r7, [r2, #4]
	ldr r6, _08078DF8 @ =0x00000246
	strh r6, [r2, #0xa]
	subs r1, #5
	adds r0, r4, r1
	strb r3, [r0]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0x80
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078DFC @ =IWRAM_START + 0x30
	adds r2, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E00 @ =IWRAM_START + 0x51
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E04 @ =IWRAM_START + 0x52
	adds r0, r4, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08078E08 @ =IWRAM_START + 0x55
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E0C @ =IWRAM_START + 0x50
	adds r1, r4, r3
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078E10 @ =IWRAM_START + 0x60
	adds r2, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E14 @ =IWRAM_START + 0x81
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E18 @ =IWRAM_START + 0x82
	adds r0, r4, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08078E1C @ =IWRAM_START + 0x85
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E20 @ =IWRAM_START + 0x80
	adds r1, r4, r3
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xe8
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078E24 @ =IWRAM_START + 0x90
	adds r2, r4, r1
	adds r0, #0xe0
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E28 @ =IWRAM_START + 0xB1
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E2C @ =IWRAM_START + 0xB2
	adds r0, r4, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08078E30 @ =IWRAM_START + 0xB5
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E34 @ =IWRAM_START + 0xB0
	adds r1, r4, r3
	movs r0, #3
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r3, r7, r0
	ldr r1, _08078E38 @ =IWRAM_START + 0xC0
	adds r2, r4, r1
	movs r7, #0x90
	lsls r7, r7, #3
	strh r7, [r2, #0x1a]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	ldr r0, _08078E3C @ =IWRAM_START + 0xE1
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08078E40 @ =IWRAM_START + 0xE2
	adds r0, r4, r1
	mov r7, sb
	strb r7, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r7, #0
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	mov r1, r8
	str r1, [r2, #0x10]
	str r3, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r3, _08078E44 @ =IWRAM_START + 0xE0
	adds r4, r4, r3
	movs r0, #4
	strb r0, [r4]
	adds r0, r2, #0
	bl sub_8004558
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	mov r7, sl
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078DB4: .4byte Task_Interactable069
_08078DB8: .4byte 0x00002010
_08078DBC: .4byte TaskDestructor_Interactable069
_08078DC0: .4byte IWRAM_START + 0x1AC
_08078DC4: .4byte IWRAM_START + 0x1B0
_08078DC8: .4byte IWRAM_START + 0x1B2
_08078DCC: .4byte IWRAM_START + 0x1B8
_08078DD0: .4byte IWRAM_START + 0x1BD
_08078DD4: .4byte IWRAM_START + 0x158
_08078DD8: .4byte IWRAM_START + 0x15C
_08078DDC: .4byte IWRAM_START + 0x160
_08078DE0: .4byte IWRAM_START + 0x164
_08078DE4: .4byte IWRAM_START + 0x168
_08078DE8: .4byte IWRAM_START + 0x16C
_08078DEC: .4byte IWRAM_START + 0x1B4
_08078DF0: .4byte IWRAM_START + 0x21
_08078DF4: .4byte IWRAM_START + 0x22
_08078DF8: .4byte 0x00000246
_08078DFC: .4byte IWRAM_START + 0x30
_08078E00: .4byte IWRAM_START + 0x51
_08078E04: .4byte IWRAM_START + 0x52
_08078E08: .4byte IWRAM_START + 0x55
_08078E0C: .4byte IWRAM_START + 0x50
_08078E10: .4byte IWRAM_START + 0x60
_08078E14: .4byte IWRAM_START + 0x81
_08078E18: .4byte IWRAM_START + 0x82
_08078E1C: .4byte IWRAM_START + 0x85
_08078E20: .4byte IWRAM_START + 0x80
_08078E24: .4byte IWRAM_START + 0x90
_08078E28: .4byte IWRAM_START + 0xB1
_08078E2C: .4byte IWRAM_START + 0xB2
_08078E30: .4byte IWRAM_START + 0xB5
_08078E34: .4byte IWRAM_START + 0xB0
_08078E38: .4byte IWRAM_START + 0xC0
_08078E3C: .4byte IWRAM_START + 0xE1
_08078E40: .4byte IWRAM_START + 0xE2
_08078E44: .4byte IWRAM_START + 0xE0

	thumb_func_start sub_8078E48
sub_8078E48: @ 0x08078E48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r3, r2, r0
	movs r5, #0
	movs r1, #0
_08078E5E:
	strh r1, [r3]
	strh r1, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #0
	beq _08078E5E
	movs r5, #0
	adds r2, #0xf0
	mov r8, r2
	ldr r7, _08078E9C @ =gPseudoRandom
	ldr r6, _08078EA0 @ =0x00196225
	ldr r4, _08078EA4 @ =0x3C6EF35F
_08078E7A:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08078EA8
	ldr r0, [r7]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r4
	lsrs r0, r2, #0x14
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r2, #0
	muls r0, r6, r0
	b _08078EBC
	.align 2, 0
_08078E9C: .4byte gPseudoRandom
_08078EA0: .4byte 0x00196225
_08078EA4: .4byte 0x3C6EF35F
_08078EA8:
	ldr r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsrs r2, r1, #0x14
	ldr r0, _08078F08 @ =0xFFFFF000
	subs r0, r0, r2
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r6, r0
_08078EBC:
	adds r0, r0, r4
	str r0, [r7]
	lsrs r0, r0, #0x14
	rsbs r0, r0, #0
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #1
	bls _08078E7A
	movs r5, #0
	ldr r7, _08078F0C @ =gPseudoRandom
	ldr r6, _08078F10 @ =0x00196225
	ldr r4, _08078F14 @ =0x3C6EF35F
	ldr r1, _08078F08 @ =0xFFFFF000
	mov ip, r1
_08078EDE:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08078F18
	ldr r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsrs r0, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r0, r4
	str r0, [r7]
	lsrs r0, r0, #0x13
	mov r1, ip
	subs r0, r1, r0
	b _08078F36
	.align 2, 0
_08078F08: .4byte 0xFFFFF000
_08078F0C: .4byte gPseudoRandom
_08078F10: .4byte 0x00196225
_08078F14: .4byte 0x3C6EF35F
_08078F18:
	ldr r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsrs r2, r1, #0x14
	ldr r0, _08079010 @ =0xFFFFF800
	subs r0, r0, r2
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r0, r4
	str r0, [r7]
	lsrs r0, r0, #0x13
	mov r2, ip
	subs r0, r2, r0
_08078F36:
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #1
	bls _08078EDE
	movs r5, #0
	ldr r6, _08079014 @ =gPseudoRandom
	ldr r4, _08079018 @ =0x00196225
	ldr r2, _0807901C @ =0x3C6EF35F
	ldr r7, _08079020 @ =0xFFFFE000
_08078F4E:
	ldr r0, [r6]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r1, r1, r2
	lsrs r0, r1, #0x12
	adds r0, r0, r7
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r6]
	lsrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #3
	bls _08078F4E
	movs r5, #0
	ldr r6, _08079014 @ =gPseudoRandom
	ldr r4, _08079018 @ =0x00196225
	ldr r2, _0807901C @ =0x3C6EF35F
	ldr r7, _08079020 @ =0xFFFFE000
_08078F80:
	ldr r0, [r6]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r1, r1, r2
	lsrs r0, r1, #0x12
	adds r0, r0, r7
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r2
	str r0, [r6]
	lsrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r3, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #4
	cmp r5, #3
	bls _08078F80
	mov r3, r8
	movs r5, #0
	movs r1, #0
	movs r2, #0xfd
	lsls r2, r2, #8
_08078FB2:
	strh r1, [r3]
	strh r1, [r3, #2]
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #0
	beq _08078FB2
	movs r5, #0
	ldr r7, _08079014 @ =gPseudoRandom
	mov ip, r7
	ldr r7, _08079018 @ =0x00196225
	ldr r6, _0807901C @ =0x3C6EF35F
	ldr r0, _08079024 @ =0x000007FF
	mov sl, r0
	ldr r1, _08079028 @ =0x0000FD40
	mov sb, r1
	movs r2, #0x1f
	mov r8, r2
_08078FDC:
	movs r4, #1
	ands r4, r5
	cmp r4, #0
	beq _08079030
	mov r1, ip
	ldr r0, [r1]
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r1, r6
	adds r0, r1, #0
	mov r2, sl
	ands r0, r2
	ldr r2, _0807902C @ =0xFFFFFC00
	adds r0, r0, r2
	strh r0, [r3]
	movs r0, #0
	strh r0, [r3, #2]
	adds r0, r1, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x20
	b _0807905C
	.align 2, 0
_08079010: .4byte 0xFFFFF800
_08079014: .4byte gPseudoRandom
_08079018: .4byte 0x00196225
_0807901C: .4byte 0x3C6EF35F
_08079020: .4byte 0xFFFFE000
_08079024: .4byte 0x000007FF
_08079028: .4byte 0x0000FD40
_0807902C: .4byte 0xFFFFFC00
_08079030:
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, sl
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3]
	strh r4, [r3, #2]
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x20
	rsbs r0, r0, #0
_0807905C:
	strh r0, [r3, #4]
	mov r0, sb
	strh r0, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #1
	bls _08078FDC
	movs r5, #0
	ldr r1, _080790B8 @ =gPseudoRandom
	mov ip, r1
	ldr r7, _080790BC @ =0x00196225
	ldr r6, _080790C0 @ =0x3C6EF35F
	ldr r2, _080790C4 @ =0x00001FFF
	mov sl, r2
	ldr r0, _080790C8 @ =0x0000FD80
	mov sb, r0
	movs r1, #0x3f
	mov r8, r1
_08079084:
	movs r4, #1
	ands r4, r5
	cmp r4, #0
	beq _080790D0
	mov r2, ip
	ldr r0, [r2]
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r1, r6
	adds r0, r1, #0
	mov r2, sl
	ands r0, r2
	ldr r2, _080790CC @ =0xFFFFF000
	adds r0, r0, r2
	strh r0, [r3]
	movs r0, #0
	strh r0, [r3, #2]
	adds r0, r1, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x30
	b _080790FC
	.align 2, 0
_080790B8: .4byte gPseudoRandom
_080790BC: .4byte 0x00196225
_080790C0: .4byte 0x3C6EF35F
_080790C4: .4byte 0x00001FFF
_080790C8: .4byte 0x0000FD80
_080790CC: .4byte 0xFFFFF000
_080790D0:
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r6
	adds r1, r2, #0
	mov r0, sl
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r0, r0, r1
	strh r0, [r3]
	strh r4, [r3, #2]
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r1, ip
	str r0, [r1]
	mov r2, r8
	ands r0, r2
	adds r0, #0x30
	rsbs r0, r0, #0
_080790FC:
	strh r0, [r3, #4]
	mov r0, sb
	strh r0, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #1
	bls _08079084
	movs r5, #0
	ldr r1, _0807915C @ =gPseudoRandom
	mov r8, r1
	ldr r4, _08079160 @ =0x00196225
	ldr r2, _08079164 @ =0x3C6EF35F
	mov ip, r2
	movs r7, #0x3f
	mov sb, r7
	ldr r6, _08079168 @ =0x0000FDC0
_08079120:
	mov r1, r8
	ldr r0, [r1]
	muls r0, r4, r0
	add r0, ip
	ldr r1, _0807916C @ =0x00003FFF
	ands r1, r0
	ldr r2, _08079170 @ =0xFFFFE000
	adds r1, r1, r2
	strh r1, [r3]
	muls r0, r4, r0
	mov r7, ip
	adds r2, r0, r7
	mov r0, r8
	str r2, [r0]
	ldr r0, _08079174 @ =0x00000FFF
	ands r0, r2
	strh r0, [r3, #2]
	lsls r1, r1, #0x10
	cmp r1, #0
	ble _08079178
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r1, _08079164 @ =0x3C6EF35F
	adds r0, r0, r1
	ldr r2, _0807915C @ =gPseudoRandom
	str r0, [r2]
	mov r7, sb
	ands r0, r7
	adds r0, #0x40
	b _0807918C
	.align 2, 0
_0807915C: .4byte gPseudoRandom
_08079160: .4byte 0x00196225
_08079164: .4byte 0x3C6EF35F
_08079168: .4byte 0x0000FDC0
_0807916C: .4byte 0x00003FFF
_08079170: .4byte 0xFFFFE000
_08079174: .4byte 0x00000FFF
_08079178:
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r1, _080791AC @ =0x3C6EF35F
	adds r0, r0, r1
	ldr r2, _080791B0 @ =gPseudoRandom
	str r0, [r2]
	mov r7, sb
	ands r0, r7
	adds r0, #0x40
	rsbs r0, r0, #0
_0807918C:
	strh r0, [r3, #4]
	strh r6, [r3, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #8
	cmp r5, #7
	bls _08079120
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080791AC: .4byte 0x3C6EF35F
_080791B0: .4byte gPseudoRandom

	thumb_func_start sub_80791B4
sub_80791B4: @ 0x080791B4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r1, _08079230 @ =gUnknown_03005590
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r6, r2
	ldrh r5, [r0]
	ldr r4, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl __umodsi3
	adds r5, r0, #0
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, r7
	beq _080791EC
	adds r0, r6, #0
	bl sub_8078E48
	str r7, [r4]
_080791EC:
	movs r1, #0xb4
	lsls r1, r1, #1
	adds r3, r6, r1
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #9
	str r1, [r3]
	movs r4, #0xd9
	lsls r4, r4, #1
	adds r2, r6, r4
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r0, r0, #8
	cmp r1, r0
	ble _08079234
	movs r0, #0xba
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #1
	str r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #8
	ldr r1, [r3]
	subs r1, r1, r0
	movs r0, #0xf0
	lsls r0, r0, #6
	cmp r1, r0
	ble _0807928C
	adds r0, r6, #0
	bl sub_8079510
	b _0807928C
	.align 2, 0
_08079230: .4byte gUnknown_03005590
_08079234:
	movs r2, #0xba
	lsls r2, r2, #1
	adds r1, r6, r2
	movs r0, #0
	str r0, [r1]
	movs r4, #0xc6
	lsls r4, r4, #1
	adds r2, r6, r4
	movs r3, #0
	ldr r7, _08079294 @ =0xFFFFA000
	mov ip, r7
	ldr r6, _08079298 @ =gPseudoRandom
	ldr r5, _0807929C @ =0x00196225
	ldr r4, _080792A0 @ =0x3C6EF35F
_08079250:
	ldr r1, _080792A4 @ =0xFFFFFE00
	adds r0, r1, #0
	ldrh r7, [r2, #2]
	adds r0, r0, r7
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bge _08079280
	ldr r0, [r6]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r1, r1, r4
	lsrs r0, r1, #0x12
	ldr r7, _080792A8 @ =0xFFFFE000
	adds r0, r0, r7
	strh r0, [r2]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r4
	str r0, [r6]
	lsrs r0, r0, #0x12
	rsbs r0, r0, #0
	strh r0, [r2, #2]
_08079280:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
	cmp r3, #7
	bls _08079250
_0807928C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079294: .4byte 0xFFFFA000
_08079298: .4byte gPseudoRandom
_0807929C: .4byte 0x00196225
_080792A0: .4byte 0x3C6EF35F
_080792A4: .4byte 0xFFFFFE00
_080792A8: .4byte 0xFFFFE000

	thumb_func_start sub_80792AC
sub_80792AC: @ 0x080792AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r0, #0xb4
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r3, #0xd9
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r0, r0, #8
	ldr r1, [r1]
	subs r1, r1, r0
	movs r0, #0xf0
	lsls r0, r0, #6
	cmp r1, r0
	ble _080792D8
	b _080794FC
_080792D8:
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r5, r4, r0
	subs r3, #4
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	movs r6, #0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov sb, r7
	mov r8, r0
	ldr r0, _080794F8 @ =gCamera
	mov sl, r0
_080792F6:
	movs r1, #0xb4
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	cmp r3, sb
	bge _08079342
	movs r7, #0xac
	lsls r7, r7, #1
	adds r0, r4, r7
	ldr r1, [r0]
	mov r2, sl
	ldr r0, [r2]
	subs r1, r1, r0
	adds r7, #0xc
	adds r0, r4, r7
	movs r7, #0
	ldrsh r2, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r0, [r0]
	mov r2, sl
	ldr r1, [r2, #4]
	subs r0, r0, r1
	adds r0, r0, r3
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
_08079342:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #0
	beq _080792F6
	movs r6, #0
	ldr r3, _080794F8 @ =gCamera
	mov sb, r3
_08079354:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _080793AC
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x46
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_080793AC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #1
	bls _08079354
	movs r6, #0
	ldr r3, _080794F8 @ =gCamera
	mov sb, r3
_080793BE:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _08079416
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x76
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0x78
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_08079416:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #1
	bls _080793BE
	movs r6, #0
	ldr r3, _080794F8 @ =gCamera
	mov sb, r3
_08079428:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _08079480
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0xa6
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0xa8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_08079480:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #3
	bls _08079428
	movs r6, #0
	ldr r3, _080794F8 @ =gCamera
	mov sb, r3
_08079492:
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r3, r0, #8
	mov r7, r8
	asrs r0, r7, #0x10
	cmp r3, r0
	bge _080794EA
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r0]
	mov r7, sb
	ldr r0, [r7]
	subs r2, r2, r0
	adds r1, #0xc
	adds r0, r4, r1
	movs r7, #0
	ldrsh r1, [r5, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0xd6
	strh r2, [r0]
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r0]
	mov r2, sb
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0xd8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_080794EA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #4
	cmp r6, #3
	bls _08079492
	b _08079502
	.align 2, 0
_080794F8: .4byte gCamera
_080794FC:
	adds r0, r4, #0
	bl sub_8079560
_08079502:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8079510
sub_8079510: @ 0x08079510
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r1, #0xf0
	movs r4, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
_0807951C:
	ldrh r3, [r1, #6]
	movs r2, #6
	ldrsh r0, [r1, r2]
	ldrh r2, [r1, #2]
	cmp r0, #0
	ble _0807952E
	lsls r0, r2, #0x10
	cmp r0, #0
	bgt _0807954C
_0807952E:
	ldrh r0, [r1, #4]
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	adds r0, r2, r3
	strh r0, [r1, #2]
	adds r0, r3, #0
	adds r0, #0x2a
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	asrs r2, r5, #0x10
	cmp r0, r2
	ble _0807954C
	strh r2, [r1, #6]
_0807954C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r1, #8
	cmp r4, #0xc
	bls _0807951C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079560
sub_8079560: @ 0x08079560
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r5, r1
	ldr r0, [r0]
	mov sb, r0
	movs r2, #0xae
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r2, #0x56
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0xf0
	movs r6, #0
	ldr r7, _080795D8 @ =gCamera
_08079590:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080795A0
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _0807960A
_080795A0:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080795DC
	ldr r1, [r7]
	mov r0, sb
	subs r1, r0, r1
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xa6
	strh r1, [r0]
	ldr r1, [r7, #4]
	mov r2, r8
	subs r1, r2, r1
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xa8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
	b _0807960A
	.align 2, 0
_080795D8: .4byte gCamera
_080795DC:
	ldr r1, [r7]
	mov r0, sb
	subs r1, r0, r1
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xd6
	strh r1, [r0]
	ldr r1, [r7, #4]
	mov r2, r8
	subs r1, r2, r1
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xd8
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
_0807960A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, #8
	cmp r6, #0xc
	bls _08079590
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079624
sub_8079624: @ 0x08079624
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r2, [r0]
	ldr r1, _0807969C @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xd8
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08079698
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08079698
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xd9
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	cmp r0, r5
	blt _08079698
	subs r2, #4
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _080796A0
_08079698:
	movs r0, #1
	b _080796A2
	.align 2, 0
_0807969C: .4byte gCamera
_080796A0:
	movs r0, #0
_080796A2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80796A8
sub_80796A8: @ 0x080796A8
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, _0807973C @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08079744
	movs r1, #0xd9
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r7, #0xb4
	lsls r7, r7, #1
	adds r1, r3, r7
	ldr r1, [r1]
	asrs r5, r1, #8
	subs r0, r0, r5
	cmp r0, #0x3f
	ble _08079744
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r2, [r0]
	movs r7, #0xb2
	lsls r7, r7, #1
	adds r0, r3, r7
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r1, _08079740 @ =gCamera
	ldr r4, [r1]
	subs r2, r2, r4
	subs r7, #8
	adds r0, r3, r7
	ldr r0, [r0]
	adds r0, r0, r5
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x20
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _08079744
	adds r0, #0x40
	cmp r0, r1
	blt _08079744
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	subs r1, #0x20
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08079744
	cmp r2, r0
	blt _08079744
	movs r0, #1
	b _08079746
	.align 2, 0
_0807973C: .4byte gPlayer
_08079740: .4byte gCamera
_08079744:
	movs r0, #0
_08079746:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable069
Task_Interactable069: @ 0x0807974C
	push {r4, lr}
	ldr r0, _08079784 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80791B4
	adds r0, r4, #0
	bl sub_80796A8
	cmp r0, #0
	beq _08079770
	adds r0, r4, #0
	bl sub_80797AC
_08079770:
	adds r0, r4, #0
	bl sub_8079624
	cmp r0, #0
	beq _08079788
	adds r0, r4, #0
	bl sub_80797E8
	b _0807978E
	.align 2, 0
_08079784: .4byte gCurTask
_08079788:
	adds r0, r4, #0
	bl sub_80792AC
_0807978E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable069
TaskDestructor_Interactable069: @ 0x08079794
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _080797A8 @ =IWRAM_START + 0x1B4
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_080797A8: .4byte IWRAM_START + 0x1B4

	thumb_func_start sub_80797AC
sub_80797AC: @ 0x080797AC
	push {lr}
	bl sub_8029FF0
	ldr r2, _080797DC @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r3, r2, #0
	adds r3, #0x64
	movs r1, #0
	movs r0, #0x14
	strh r0, [r3]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	strh r1, [r2, #0x14]
	ldr r0, _080797E0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080797E4 @ =sub_8079810
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080797DC: .4byte gPlayer
_080797E0: .4byte gCurTask
_080797E4: .4byte sub_8079810

	thumb_func_start sub_80797E8
sub_80797E8: @ 0x080797E8
	push {lr}
	adds r2, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r0]
	movs r3, #0xde
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807980C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807980C: .4byte gCurTask

	thumb_func_start sub_8079810
sub_8079810: @ 0x08079810
	push {r4, r5, r6, lr}
	ldr r6, _0807983C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80791B4
	ldr r2, _08079840 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08079848
	bl sub_802A004
	ldr r1, [r6]
	ldr r0, _08079844 @ =Task_Interactable069
	str r0, [r1, #8]
	b _0807986E
	.align 2, 0
_0807983C: .4byte gCurTask
_08079840: .4byte gPlayer
_08079844: .4byte Task_Interactable069
_08079848:
	ldr r1, _0807987C @ =IWRAM_START + 0x15C
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r3, _08079880 @ =IWRAM_START + 0x168
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _08079884 @ =0xFFFFF000
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r3, #0xc
	adds r0, r4, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0807986E
	adds r0, r5, #0
	bl sub_8079888
_0807986E:
	adds r0, r5, #0
	bl sub_80792AC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807987C: .4byte IWRAM_START + 0x15C
_08079880: .4byte IWRAM_START + 0x168
_08079884: .4byte 0xFFFFF000

	thumb_func_start sub_8079888
sub_8079888: @ 0x08079888
	push {lr}
	bl sub_802A004
	ldr r1, _080798B4 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080798A6
	ldr r0, _080798B8 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r1, #0x20]
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
_080798A6:
	ldr r0, _080798BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080798C0 @ =Task_Interactable069
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080798B4: .4byte gPlayer
_080798B8: .4byte 0xFFBFFFFF
_080798BC: .4byte gCurTask
_080798C0: .4byte Task_Interactable069
