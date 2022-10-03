.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; CreateUnknownTimeDisplay
	thumb_func_start sub_8082D44
sub_8082D44: @ f
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08082E08 @ =sub_808328C
	movs r1, #0x90
	lsls r1, r1, #2
	ldr r2, _08082E0C @ =0x00002102
	ldr r3, _08082E10 @ =sub_80832E0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _08082E14 @ =gUnknown_03005B6C
	movs r2, #0
	str r2, [r1]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	mov sl, r4
	movs r5, #0
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08082E18 @ =IWRAM_START + 0x21
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08082E1C @ =IWRAM_START + 0x22
	adds r1, r6, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08082E20 @ =IWRAM_START + 0x25
	adds r0, r6, r1
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xb
	str r0, [r4, #0x10]
	ldr r0, _08082E24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08082DB6
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08082E28 @ =0x000002D9
	strh r0, [r4, #0xa]
	ldr r2, _08082E2C @ =IWRAM_START + 0x20
	adds r0, r6, r2
	strb r5, [r0]
_08082DB6:
	adds r0, r4, #0
	bl sub_8004558
	movs r5, #0
	movs r7, #0
	ldr r0, _08082E30 @ =IWRAM_START + 0x34
	adds r4, r6, r0
	ldr r1, _08082E34 @ =IWRAM_START + 0x52
	adds r1, r1, r6
	mov r8, r1
	ldr r2, _08082E38 @ =IWRAM_START + 0x30
	adds r6, r6, r2
	ldr r0, _08082E3C @ =0x0000045F
	mov sb, r0
_08082DD2:
	strh r7, [r4, #0x12]
	strh r7, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x16]
	strh r7, [r4, #4]
	mov r1, sb
	strh r1, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x10
	strb r0, [r4, #0x1c]
	strh r7, [r4, #0x10]
	strh r7, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	movs r0, #0
	mov r2, r8
	strb r0, [r2, #3]
	str r7, [r4, #0xc]
	cmp r5, #0
	bne _08082E40
	movs r0, #0x16
	bl VramMalloc
	b _08082E48
	.align 2, 0
_08082E08: .4byte sub_808328C
_08082E0C: .4byte 0x00002102
_08082E10: .4byte sub_80832E0
_08082E14: .4byte gUnknown_03005B6C
_08082E18: .4byte IWRAM_START + 0x21
_08082E1C: .4byte IWRAM_START + 0x22
_08082E20: .4byte IWRAM_START + 0x25
_08082E24: .4byte gGameMode
_08082E28: .4byte 0x000002D9
_08082E2C: .4byte IWRAM_START + 0x20
_08082E30: .4byte IWRAM_START + 0x34
_08082E34: .4byte IWRAM_START + 0x52
_08082E38: .4byte IWRAM_START + 0x30
_08082E3C: .4byte 0x0000045F
_08082E40:
	lsls r1, r5, #6
	mov r2, sl
	ldr r0, [r2, #0x34]
	adds r0, r0, r1
_08082E48:
	str r0, [r4]
	adds r0, r6, #0
	bl sub_8004558
	adds r4, #0x30
	movs r0, #0x30
	add r8, r0
	adds r6, #0x30
	adds r5, #1
	cmp r5, #0xa
	bls _08082DD2
	movs r5, #0
	ldr r3, _08082E90 @ =gFlags
	ldr r0, _08082E94 @ =gObjPalette
	ldr r2, _08082E98 @ =gUnknown_080E0270
	adds r1, r0, #0
	adds r1, #0xe0
_08082E6A:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08082E6A
	ldr r0, [r3]
	movs r1, #2
	orrs r0, r1
	str r0, [r3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082E90: .4byte gFlags
_08082E94: .4byte gObjPalette
_08082E98: .4byte gUnknown_080E0270

	thumb_func_start sub_8082E9C
sub_8082E9C: @ 0x08082E9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _0808302C @ =gUnknown_03005490
	ldr r0, [r1]
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	ldr r0, _0808302C @ =gUnknown_03005490
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08083030 @ =gUnknown_080E0234
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	lsls r6, r0, #0x10
	lsrs r1, r6, #0x10
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	bl Div
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r5, r5, r1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	mov sl, r0
	ldr r0, _0808302C @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _08083034 @ =0x00000E0F
	cmp r1, r0
	bhi _08082F32
	ldr r0, _08083038 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sl, r0
_08082F32:
	movs r2, #8
	movs r5, #0x26
	movs r4, #0xf
	adds r1, r4, #0
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	movs r1, #0
	mov sb, r1
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x10
	movs r1, #0x84
	lsls r1, r1, #2
	mov r8, r1
	adds r3, r7, r1
	strh r0, [r3, #0x16]
	strh r5, [r3, #0x18]
	ldr r0, _0808303C @ =0x00000235
	adds r0, r7, r0
	str r0, [sp, #8]
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x18
	lsrs r1, r6, #0x14
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x20
	adds r1, r4, #0
	ldr r0, [sp, #4]
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x28
	mov r1, r8
	adds r3, r7, r1
	strh r0, [r3, #0x16]
	strh r5, [r3, #0x18]
	mov r1, sb
	ldr r0, [sp, #8]
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x30
	ldr r0, [sp]
	lsrs r1, r0, #4
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r1, #0x38
	ldr r0, [sp]
	ands r4, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r1, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808302C: .4byte gUnknown_03005490
_08083030: .4byte gUnknown_080E0234
_08083034: .4byte 0x00000E0F
_08083038: .4byte gUnknown_03005590
_0808303C: .4byte 0x00000235

	thumb_func_start sub_8083040
sub_8083040: @ 0x08083040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r2, #0
	ldr r0, _080830F8 @ =gUnknown_030055B8
	ldrb r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080830E6
	mov sl, r2
_0808305E:
	mov r4, sb
	movs r0, #0x1a
	muls r0, r2, r0
	strh r0, [r4, #0x16]
	mov r0, sl
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_80051E8
	ldr r0, _080830FC @ =gUnknown_030053E8
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_8004518
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x16]
	adds r0, #0x17
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r4, #0x18]
	adds r0, #0x13
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r2, [sp]
	adds r2, #1
	mov r8, r2
_0808309E:
	movs r0, #0xf
	ands r0, r5
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x30
	mov r0, sb
	adds r4, r0, r1
	strh r7, [r4, #0x16]
	strh r6, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r7, #0x10
	ldr r1, _08083100 @ =0xFFF80000
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	lsrs r5, r5, #4
	cmp r5, #0
	bne _0808309E
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #3
	bhi _080830E6
	ldr r0, _080830F8 @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0808305E
_080830E6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080830F8: .4byte gUnknown_030055B8
_080830FC: .4byte gUnknown_030053E8
_08083100: .4byte 0xFFF80000

	thumb_func_start sub_8083104
sub_8083104: @ 0x08083104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r5, _08083280 @ =gUnknown_03005B6C
	ldr r0, [r5]
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08083284 @ =gUnknown_080E0234
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	bl Div
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r5, r5, r1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	movs r2, #8
	movs r6, #0x36
	movs r5, #0xf
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	movs r2, #1
	mov sb, r2
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x10
	movs r7, #0x84
	lsls r7, r7, #2
	mov r2, r8
	adds r3, r2, r7
	strh r0, [r3, #0x16]
	strh r6, [r3, #0x18]
	ldr r0, _08083288 @ =0x00000235
	add r0, r8
	mov sl, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r1, #0x18
	lsrs r4, r4, #0x14
	ands r4, r5
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x30
	mov r2, r8
	adds r3, r2, r0
	strh r1, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x20
	adds r1, r5, #0
	ldr r0, [sp, #4]
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x28
	mov r1, r8
	adds r3, r1, r7
	strh r0, [r3, #0x16]
	strh r6, [r3, #0x18]
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x30
	ldr r0, [sp]
	lsrs r1, r0, #4
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r1, #0x38
	ldr r0, [sp]
	ands r5, r0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x30
	mov r2, r8
	adds r3, r2, r0
	strh r1, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083280: .4byte gUnknown_03005B6C
_08083284: .4byte gUnknown_080E0234
_08083288: .4byte 0x00000235

	thumb_func_start sub_808328C
sub_808328C: @ 0x0808328C
	push {r4, lr}
	ldr r0, _080832D4 @ =gUnknown_03005424
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _080832CC
	ldr r0, _080832D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080832C6
	adds r0, r4, #0
	bl sub_8082E9C
	ldr r0, _080832DC @ =gUnknown_03005B6C
	ldr r0, [r0]
	cmp r0, #0
	beq _080832C6
	adds r0, r4, #0
	bl sub_8083104
_080832C6:
	adds r0, r4, #0
	bl sub_8083040
_080832CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080832D4: .4byte gUnknown_03005424
_080832D8: .4byte gCurTask
_080832DC: .4byte gUnknown_03005B6C

	thumb_func_start sub_80832E0
sub_80832E0: @ 0x080832E0
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
