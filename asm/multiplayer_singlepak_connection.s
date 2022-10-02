.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8082AA8
sub_8082AA8: @ 0x08082AA8
	push {r4, r5, lr}
	ldr r5, _08082AFC @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	bl sub_8082788
	ldr r0, _08082B00 @ =IWRAM_START + 0x430
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _08082AF6
	movs r0, #0
	strh r0, [r4]
	ldr r0, _08082B04 @ =gMPlayInfo_BGM
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _08082B08 @ =gMPlayInfo_SE1
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _08082B0C @ =gMPlayInfo_SE2
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _08082B10 @ =gMPlayInfo_SE3
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r1, _08082B14 @ =gBldRegs
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, [r5]
	ldr r0, _08082B18 @ =sub_8082630
	str r0, [r1, #8]
_08082AF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082AFC: .4byte gCurTask
_08082B00: .4byte IWRAM_START + 0x430
_08082B04: .4byte gMPlayInfo_BGM
_08082B08: .4byte gMPlayInfo_SE1
_08082B0C: .4byte gMPlayInfo_SE2
_08082B10: .4byte gMPlayInfo_SE3
_08082B14: .4byte gBldRegs
_08082B18: .4byte sub_8082630

	thumb_func_start sub_8082B1C
sub_8082B1C: @ 0x08082B1C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08082B6C @ =sub_808207C
	movs r1, #0x88
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, _08082B70 @ =IWRAM_START + 0x434
	adds r1, r2, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r1]
	ldr r4, _08082B74 @ =IWRAM_START + 0x430
	adds r1, r2, r4
	movs r3, #0
	strh r5, [r1]
	adds r4, #8
	adds r1, r2, r4
	strb r3, [r1]
	ldr r1, _08082B78 @ =IWRAM_START + 0x43C
	adds r2, r2, r1
	ldr r1, _08082B7C @ =gFrameCount
	ldr r1, [r1]
	str r1, [r2]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082B6C: .4byte sub_808207C
_08082B70: .4byte IWRAM_START + 0x434
_08082B74: .4byte IWRAM_START + 0x430
_08082B78: .4byte IWRAM_START + 0x43C
_08082B7C: .4byte gFrameCount

	thumb_func_start sub_8082B80
sub_8082B80: @ 0x08082B80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08082BF0 @ =gUnknown_080D672C
	mov r8, r0
_08082B90:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	add r0, r8
	ldrh r2, [r0]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, #0x80
	adds r0, r6, r0
	lsls r1, r4, #0xb
	ldr r3, _08082BF4 @ =0x06010000
	adds r1, r1, r3
	movs r3, #0x78
	str r3, [sp]
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r7, #0xa0
	lsls r7, r7, #0xd
	adds r3, r3, r7
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	str r3, [sp, #8]
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [sp, #0x10]
	movs r3, #0
	bl sub_8082CEC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _08082B90
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082BF0: .4byte gUnknown_080D672C
_08082BF4: .4byte 0x06010000

	thumb_func_start sub_8082BF8
sub_8082BF8: @ 0x08082BF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r3, #0
	movs r6, #0x80
	lsls r6, r6, #1
	movs r5, #0
_08082C06:
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	lsls r1, r4, #2
	adds r1, r1, r6
	lsls r1, r1, #5
	ldr r2, _08082C50 @ =0x06010000
	adds r1, r1, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	ldr r2, _08082C54 @ =0x00000451
	bl sub_8082CEC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #9
	ble _08082C06
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082C50: .4byte 0x06010000
_08082C54: .4byte 0x00000451

	thumb_func_start sub_8082C58
sub_8082C58: @ 0x08082C58
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r3, #0
	movs r5, #0
_08082C62:
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r6, r0
	lsls r1, r1, #6
	ldr r2, _08082CAC @ =0x06012500
	adds r1, r1, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	ldr r2, _08082CB0 @ =0x0000044B
	bl sub_8082CEC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #2
	ble _08082C62
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082CAC: .4byte 0x06012500
_08082CB0: .4byte 0x0000044B

	thumb_func_start sub_8082CB4
sub_8082CB4: @ 0x08082CB4
	push {r4, lr}
	sub sp, #0x14
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08082CE4 @ =0x06012F00
	ldr r2, _08082CE8 @ =0x0000044B
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [sp, #0x10]
	movs r3, #3
	bl sub_8082CEC
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082CE4: .4byte 0x06012F00
_08082CE8: .4byte 0x0000044B

	thumb_func_start sub_8082CEC
sub_8082CEC: @ 0x08082CEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldr r0, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	ldr r4, [sp, #0x24]
	mov r8, r4
	movs r4, #0
	mov r7, ip
	strh r0, [r7, #0x16]
	strh r5, [r7, #0x18]
	str r1, [r7, #4]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r2, [r7, #0xa]
	mov r0, ip
	adds r0, #0x20
	strb r3, [r0]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	ldr r4, [sp, #0x28]
	str r4, [r7, #0x10]
	mov r0, ip
	bl sub_8004558
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8082D44
sub_8082D44: @ 0x08082D44
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

	thumb_func_start sub_80832FC
sub_80832FC: @ 0x080832FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r6, [sp, #0x54]
	ldr r0, [sp, #0x58]
	mov sb, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	str r6, [sp, #8]
	asrs r2, r6, #0x1f
	str r2, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r1, #0
	adds r2, r0, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x14]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	str r3, [sp, #0x10]
	movs r4, #1
	mov r0, sb
	lsls r4, r0
	subs r4, r4, r6
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x2c]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	mov r2, sl
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r2, r0, #0x1f
	mov r8, r2
	lsls r6, r1, #1
	mov r3, r8
	orrs r3, r6
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	ldr r2, [sp]
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r5, r0, #0x1f
	lsls r4, r1, #1
	adds r3, r5, #0
	orrs r3, r4
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	asrs r1, r2, #0x1f
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	ldr r3, [sp, #0x24]
	ldr r4, [sp, #0x28]
	adds r3, r3, r0
	adcs r4, r1
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	adds r1, r4, #0
	adds r0, r3, #0
	mov r2, sb
	bl __ashrdi3
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_808343C
sub_808343C: @ 0x0808343C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r4, [sp, #0x28]
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r6, r2, #0
	adds r0, r2, #0
	asrs r1, r6, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r7, r0, #0
	mov r4, sb
	asrs r5, r4, #0x1f
	subs r2, r7, r6
	lsls r2, r2, #1
	subs r2, r2, r6
	movs r0, #1
	mov r3, r8
	lsls r0, r3
	adds r2, r2, r0
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, sl
	asrs r1, r0, #0x1f
	subs r2, r7, r6
	mov sb, r2
	subs r2, r2, r6
	ldr r3, [sp, #0x28]
	adds r2, r2, r3
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp, #4]
	asrs r1, r0, #0x1f
	lsls r2, r6, #1
	adds r2, r2, r6
	subs r2, r2, r7
	subs r2, r2, r7
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp]
	asrs r1, r0, #0x1f
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	adds r1, r5, #0
	adds r0, r4, #0
	mov r2, r8
	bl __ashrdi3
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8083504
sub_8083504: @ 0x08083504
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0808352E
	ldr r0, [r6, #8]
	muls r0, r1, r0
	asrs r3, r0, #0xa
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r7, #2]
	b _08083530
_0808352E:
	ldr r3, [r6, #8]
_08083530:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0808354E
	ldr r0, [r6, #0xc]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #4
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r7, #4]
	b _08083550
_0808354E:
	ldr r4, [r6, #0xc]
_08083550:
	ldrh r0, [r5]
	cmp r0, #0
	beq _080835B8
	ldr r0, _080835B4 @ =gSineTable
	mov ip, r0
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r3, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r5, #8]
	adds r0, r0, r2
	str r0, [r7, #8]
	ldrh r1, [r5]
	lsls r0, r1, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r3, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	b _080835C2
	.align 2, 0
_080835B4: .4byte gSineTable
_080835B8:
	ldr r0, [r5, #8]
	adds r0, r0, r3
	str r0, [r7, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r4
_080835C2:
	str r0, [r7, #0xc]
	ldrh r0, [r5]
	ldrh r6, [r6]
	adds r0, r0, r6
	ldr r2, _080835DC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080835DC: .4byte 0x000003FF

	thumb_func_start sub_80835E0
sub_80835E0: @ 0x080835E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083608
	ldr r0, [r5, #8]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	b _0808360A
_08083608:
	ldr r4, [r5, #8]
_0808360A:
	movs r0, #4
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083628
	ldr r0, [r5, #0xc]
	muls r0, r1, r0
	asrs r7, r0, #0xa
	movs r2, #4
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	b _0808362A
_08083628:
	ldr r7, [r5, #0xc]
_0808362A:
	ldrh r0, [r6]
	mov ip, r0
	mov r0, ip
	cmp r0, #0
	beq _08083694
	ldr r3, _08083690 @ =gSineTable
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r6, #8]
	adds r0, r0, r2
	str r0, [r5, #8]
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r6, #0xc]
	adds r0, r0, r2
	b _0808369E
	.align 2, 0
_08083690: .4byte gSineTable
_08083694:
	ldr r0, [r6, #8]
	adds r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r6, #0xc]
	adds r0, r0, r7
_0808369E:
	str r0, [r5, #0xc]
	ldrh r0, [r5]
	add r0, ip
	ldr r2, _080836B8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080836B8: .4byte 0x000003FF

	thumb_func_start sub_80836BC
sub_80836BC: @ 0x080836BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _080836E4
	ldr r0, [r6, #8]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	b _080836E6
_080836E4:
	ldr r4, [r6, #8]
_080836E6:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083704
	ldr r0, [r6, #0xc]
	muls r0, r1, r0
	asrs r7, r0, #0xa
	movs r2, #4
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	b _08083706
_08083704:
	ldr r7, [r6, #0xc]
_08083706:
	ldrh r0, [r5]
	mov ip, r0
	mov r0, ip
	cmp r0, #0
	beq _08083770
	ldr r3, _0808376C @ =gSineTable
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r5, #8]
	adds r0, r0, r2
	str r0, [r5, #8]
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	b _0808377A
	.align 2, 0
_0808376C: .4byte gSineTable
_08083770:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r7
_0808377A:
	str r0, [r5, #0xc]
	ldrh r0, [r6]
	add r0, ip
	ldr r2, _08083794 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083794: .4byte 0x000003FF

	thumb_func_start sub_8083798
sub_8083798: @ 0x08083798
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	movs r4, #0x80
	lsls r4, r4, #3
	cmp r0, r4
	beq _080837C2
	movs r0, #0x80
	lsls r0, r0, #0xd
	movs r2, #2
	ldrsh r1, [r7, r2]
	bl Div
	strh r0, [r7, #2]
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #8]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	str r0, [r7, #8]
_080837C2:
	movs r1, #4
	ldrsh r0, [r7, r1]
	cmp r0, r4
	beq _080837E4
	movs r0, #0x80
	lsls r0, r0, #0xd
	movs r2, #4
	ldrsh r1, [r7, r2]
	bl Div
	strh r0, [r7, #4]
	movs r0, #4
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #0xc]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	str r0, [r7, #0xc]
_080837E4:
	ldrh r0, [r7]
	subs r0, r4, r0
	ldr r2, _0808383C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r7]
	cmp r0, #0
	beq _08083844
	ldr r5, [r7, #8]
	rsbs r5, r5, #0
	ldr r6, _08083840 @ =gSineTable
	ldrh r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r3, [r0]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	adds r4, r5, #0
	muls r4, r3, r4
	asrs r4, r4, #8
	ldr r2, [r7, #0xc]
	rsbs r2, r2, #0
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r0, r2, #0
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r4, r4, r0
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r2, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r7, #0xc]
	str r4, [r7, #8]
	b _08083850
	.align 2, 0
_0808383C: .4byte 0x000003FF
_08083840: .4byte gSineTable
_08083844:
	ldr r0, [r7, #8]
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsbs r0, r0, #0
	str r0, [r7, #0xc]
_08083850:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083858
sub_8083858: @ 0x08083858
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #4]
	movs r2, #6
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80838CC
sub_80838CC: @ 0x080838CC
	push {r4, r5, r6, lr}
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #0
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #2
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #4
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #4]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r5, #4
	ldrsh r4, [r0, r5]
	movs r6, #4
	ldrsh r0, [r1, r6]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xa
	strh r3, [r2, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_808399C
sub_808399C: @ 0x0808399C
	push {r4, r5, r6, r7, lr}
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #0
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r6, [r0, r7]
	movs r4, #6
	ldrsh r3, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r5, [r0, r7]
	movs r4, #4
	ldrsh r3, [r1, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #2
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #4
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #2]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #4
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #6
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r6, #2
	ldrsh r3, [r1, r6]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #4
	ldrsh r1, [r1, r7]
	muls r1, r4, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	strh r2, [r0, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8083A48
sub_8083A48: @ 0x08083A48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #6
	ldrsh r2, [r0, r3]
	movs r5, #0
	ldrsh r4, [r1, r5]
	mov r8, r4
	mov r7, r8
	muls r7, r2, r7
	adds r2, r7, #0
	movs r3, #0
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	movs r4, #4
	ldrsh r6, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r5, #4
	ldrsh r3, [r0, r5]
	movs r7, #2
	ldrsh r5, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r5, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #2
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r4, #4
	ldrsh r3, [r0, r4]
	mov r7, r8
	muls r7, r3, r7
	adds r3, r7, #0
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #2]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r6, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #6
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r3, #4
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	subs r2, r2, r0
	asrs r2, r2, #0xa
	strh r2, [r1, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083B10
sub_8083B10: @ 0x08083B10
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #4]
	movs r2, #6
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8083B88
sub_8083B88: @ 0x08083B88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	movs r3, #4
	ldrsh r2, [r5, r3]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #2]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #4]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #6]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #8]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xc]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xe]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x10]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x12]
	ldr r2, [r5, #0x14]
	mov sl, r2
	mov r3, sl
	asrs r3, r3, #0x1f
	str r3, [sp]
	mov r0, sl
	adds r1, r3, #0
	movs r2, #2
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [r5, #0x18]
	mov sb, r3
	mov r0, sb
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r2, #8
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r5, [r5, #0x1c]
	asrs r7, r5, #0x1f
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0xe
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x14]
	mov r0, sl
	ldr r1, [sp]
	movs r2, #4
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r3, #0xa
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0x10
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x18]
	mov r0, sl
	ldr r1, [sp]
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r3, #0xc
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0x12
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x1c]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8083E44
sub_8083E44: @ 0x08083E44
	push {r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r1, #4
	ldrsh r4, [r6, r1]
	movs r3, #6
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #6]
	movs r0, #8
	ldrsh r2, [r6, r0]
	movs r1, #0xa
	ldrsh r4, [r6, r1]
	movs r3, #0xc
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #8]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xa]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xc]
	movs r0, #0xe
	ldrsh r2, [r6, r0]
	movs r1, #0x10
	ldrsh r4, [r6, r1]
	movs r3, #0x12
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xe]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0x10]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0x12]
	ldr r2, [r6, #0x14]
	ldr r4, [r6, #0x18]
	ldr r7, [r6, #0x1c]
	str r2, [sp]
	asrs r2, r2, #0x1f
	str r2, [sp, #4]
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	asrs r4, r4, #0x1f
	str r4, [sp, #0x14]
	movs r2, #8
	ldrsh r0, [r5, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r7, [sp, #0x18]
	asrs r7, r7, #0x1f
	str r7, [sp, #0x1c]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r6, #0x14]
	movs r3, #4
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x20]
	str r3, [sp, #0x24]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r6, #0x18]
	movs r3, #6
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x28]
	str r3, [sp, #0x2c]
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r6, #0x1c]
	add sp, #0x30
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8084090
sub_8084090: @ 0x08084090
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [r6, #0x14]
	asrs r0, r0, #0x1f
	mov sb, r0
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r2, #2
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, [r6, #0x18]
	asrs r3, r3, #0x1f
	mov sl, r3
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r7, #8
	ldrsh r4, [r5, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp]
	ldr r3, [sp, #4]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r3, [r6, #0x1c]
	mov r8, r3
	asrs r7, r3, #0x1f
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0xe
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp]
	ldr r3, [sp, #4]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x14]
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r3, #4
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r2, #0xa
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0x10
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x18]
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r3, #6
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r2, #0xc
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0x12
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x1c]
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r7, #8
	ldrsh r3, [r5, r7]
	movs r0, #0xe
	ldrsh r4, [r5, r0]
	movs r1, #2
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #8]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xe]
	movs r7, #4
	ldrsh r2, [r5, r7]
	movs r0, #0xa
	ldrsh r3, [r5, r0]
	movs r1, #0x10
	ldrsh r4, [r5, r1]
	movs r7, #2
	ldrsh r0, [r6, r7]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xa]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0x10]
	movs r7, #6
	ldrsh r2, [r5, r7]
	movs r0, #0xc
	ldrsh r3, [r5, r0]
	movs r1, #0x12
	ldrsh r4, [r5, r1]
	movs r7, #2
	ldrsh r0, [r6, r7]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #6]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xc]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0x12]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80842E4
sub_80842E4: @ 0x080842E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	mov r8, r1
	str r2, [sp]
	ldr r7, [r0]
	asrs r0, r7, #0x1f
	str r0, [sp, #4]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sb
	ldr r0, [r0, #4]
	mov sl, r0
	mov r1, sl
	asrs r1, r1, #0x1f
	str r1, [sp, #8]
	mov r2, r8
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r0, [r0, #8]
	mov sb, r0
	mov r1, sb
	asrs r1, r1, #0x1f
	str r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #4
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r1, [sp, #8]
	mov r2, r8
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3, #4]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #6
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r1, [sp, #8]
	mov r2, r8
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3, #8]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808442C
sub_808442C: @ 0x0808442C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r0, [r0, #4]
	mov sb, r0
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, r8
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r0, [r0, #8]
	asrs r0, r0, #0x1f
	str r0, [sp]
	mov r2, sl
	ldr r0, [r2, #8]
	ldr r1, [sp]
	mov r3, r8
	movs r2, #0xe
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r4, r1, #0
	adds r3, r0, #0
	adds r3, r3, r5
	adcs r4, r6
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r3, r3, r0
	adcs r4, r1
	lsls r1, r4, #0x16
	lsrs r0, r3, #0xa
	orrs r1, r0
	str r1, [sp, #4]
	asrs r3, r4, #0xa
	str r3, [sp, #8]
	mov r2, sl
	str r1, [r2]
	ldr r3, [sp, #4]
	asrs r6, r3, #0x1f
	adds r0, r3, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #4
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r3, sl
	ldr r0, [r3, #8]
	ldr r1, [sp]
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	adds r4, r4, r0
	adcs r5, r1
	mov r1, r8
	ldr r2, [r1, #0x18]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r4, r4, r0
	adcs r5, r1
	lsls r1, r5, #0x16
	lsrs r0, r4, #0xa
	adds r4, r1, #0
	orrs r4, r0
	mov r2, sl
	str r4, [r2, #4]
	ldr r0, [sp, #4]
	adds r1, r6, #0
	mov r3, r8
	movs r2, #6
	ldrsh r6, [r3, r2]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r4, #0
	asrs r1, r4, #0x1f
	mov r3, r8
	movs r2, #0xc
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r6, r0
	adcs r7, r1
	mov r3, sl
	ldr r0, [r3, #8]
	ldr r1, [sp]
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r6
	adcs r1, r7
	mov r2, r8
	ldr r4, [r2, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sl
	str r0, [r3, #8]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808458C
sub_808458C: @ 0x0808458C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	ldr r0, [r1]
	str r0, [sp, #4]
	asrs r0, r0, #0x1f
	str r0, [sp, #8]
	mov r1, sb
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r2, sl
	ldr r0, [r2, #4]
	str r0, [sp, #0xc]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	mov r3, sb
	ldr r0, [r3, #0x18]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r6, r6, r0
	adcs r7, r1
	mov r1, sl
	ldr r0, [r1, #8]
	adds r4, r0, #0
	asrs r5, r0, #0x1f
	mov r2, sb
	ldr r0, [r2, #0x1c]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r2, r2, r6
	adcs r3, r7
	ldr r1, _08084778 @ =0x00000000
	ldr r0, _08084774 @ =0x00100000
	adds r2, r2, r0
	adcs r3, r1
	lsls r6, r3, #0x16
	mov r8, r6
	lsrs r6, r2, #0xa
	mov r2, r8
	orrs r2, r6
	asrs r3, r3, #0xa
	bl __divdi3
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r6, [sp, #0x14]
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x1c]
	str r3, [sp, #0x20]
	mov r3, sb
	movs r1, #6
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r3, [sp, #0x14]
	str r3, [sp, #0x24]
	asrs r6, r6, #0x1f
	str r6, [sp, #0x28]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6]
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r2, [r0, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r2, [r0, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6, #4]
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r2, [r0, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r2, [r0, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6, #8]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084774: .4byte 0x00100000
_08084778: .4byte 0x00000000

	thumb_func_start sub_808477C
sub_808477C: @ 0x0808477C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	str r1, [sp]
	ldr r4, [r1]
	ldr r7, [r1, #4]
	ldr r0, [r0, #0x14]
	adds r1, r4, #0
	muls r1, r0, r1
	mov r2, r8
	ldr r0, [r2, #0x18]
	muls r0, r7, r0
	adds r1, r1, r0
	ldr r3, [sp]
	ldr r3, [r3, #8]
	mov sb, r3
	ldr r0, [r2, #0x1c]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r1, r1, r0
	asrs r1, r1, #0xa
	bl __divsi3
	mov sl, r0
	str r4, [sp, #4]
	asrs r4, r4, #0x1f
	str r4, [sp, #8]
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	str r7, [sp, #0xc]
	asrs r7, r7, #0x1f
	str r7, [sp, #0x10]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, r8
	movs r3, #6
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	mov r2, sl
	str r2, [sp, #0x14]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3]
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, r8
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r2, [sp]
	str r0, [r2, #4]
	mov r3, r8
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r2, r8
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r2, [sp]
	str r0, [r2, #8]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8084904
sub_8084904: @ 0x08084904
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084960 @ =gSineTable
	movs r3, #0
_08084914:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084914
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #0x10]
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084960: .4byte gSineTable

	thumb_func_start sub_8084964
sub_8084964: @ 0x08084964
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r3, #0
	movs r0, #0
	ldr r5, _080849C0 @ =gSineTable
	movs r2, #0
_08084974:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084974
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r3, #2]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r3, #6]
	strh r2, [r3, #0xe]
	strh r0, [r3, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080849C0: .4byte gSineTable

	thumb_func_start sub_80849C4
sub_80849C4: @ 0x080849C4
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084A20 @ =gSineTable
	movs r3, #0
_080849D4:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080849D4
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084A20: .4byte gSineTable

	thumb_func_start sub_8084A24
sub_8084A24: @ 0x08084A24
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r7, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, ip
	movs r0, #0
	ldr r4, _08084B50 @ =gSineTable
	movs r3, #0
_08084A3A:
	stm r2!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084A3A
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	mov r3, r8
	strh r3, [r2, #0x12]
	strh r3, [r2, #0xa]
	strh r3, [r2, #2]
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r5, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r6, [r0]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x14
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #2
	ldrsh r4, [r7, r1]
	adds r0, r3, #0
	muls r0, r4, r0
	asrs r0, r0, #0xa
	mov r2, r8
	subs r2, r2, r6
	mov r8, r2
	mov r1, r8
	muls r1, r0, r1
	lsls r1, r1, #6
	movs r0, #4
	ldrsh r2, [r7, r0]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r4, r8
	muls r4, r0, r4
	lsls r4, r4, #6
	adds r0, r3, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	lsls r2, r2, #6
	adds r0, r3, #0
	muls r0, r3, r0
	asrs r0, r0, #0xa
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #2]
	movs r3, #4
	ldrsh r0, [r7, r3]
	asrs r5, r5, #0x14
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r1, r1, #0x10
	adds r0, r1, r0
	mov r3, ip
	strh r0, [r3, #4]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r2, r2, #0x10
	subs r0, r2, r0
	mov r3, ip
	strh r0, [r3, #6]
	movs r3, #4
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r1, r1, r0
	mov r0, ip
	strh r1, [r0, #8]
	movs r1, #2
	ldrsh r0, [r7, r1]
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #0xa]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r4, r4, #0x10
	adds r0, r4, r0
	strh r0, [r3, #0xc]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0, #0xe]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r4, r4, r0
	mov r2, ip
	strh r4, [r2, #0x10]
	movs r3, #4
	ldrsh r0, [r7, r3]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xa
	adds r6, r6, r0
	mov r3, ip
	strh r6, [r3, #0x12]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B50: .4byte gSineTable

	thumb_func_start sub_8084B54
sub_8084B54: @ 0x08084B54
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r6, _08084C6C @ =gSineTable
	lsls r4, r2, #1
	adds r4, r4, r6
	ldrh r4, [r4]
	mov sl, r4
	mov r4, sl
	lsls r4, r4, #0x10
	mov sl, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov ip, r2
	mov r2, ip
	lsls r2, r2, #0x10
	mov ip, r2
	lsls r2, r1, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov r8, r2
	mov r2, r8
	lsls r2, r2, #0x10
	mov r8, r2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	mov sb, r1
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	lsls r1, r3, #1
	adds r1, r1, r6
	ldrh r5, [r1]
	lsls r5, r5, #0x10
	adds r3, r3, r4
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r4, [r3]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	mov r2, sb
	asrs r2, r2, #0x14
	mov sb, r2
	mov r2, sb
	muls r2, r4, r2
	asrs r2, r2, #0xa
	asrs r5, r5, #0x14
	mov r1, sl
	asrs r1, r1, #0x14
	mov sl, r1
	mov r3, sl
	muls r3, r5, r3
	asrs r3, r3, #0xa
	mov r1, r8
	asrs r1, r1, #0x14
	mov r8, r1
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	movs r6, #0
	strh r2, [r0, #2]
	mov r2, ip
	asrs r2, r2, #0x14
	mov ip, r2
	mov r1, ip
	muls r1, r5, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #4]
	rsbs r1, r4, #0
	mov r2, r8
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #6]
	rsbs r1, r5, #0
	mov r2, sb
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r3, sl
	muls r3, r4, r3
	asrs r3, r3, #0xa
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #8]
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xa]
	mov r2, r8
	muls r2, r5, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #0xc]
	mov r4, r8
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xe]
	mov r1, sl
	rsbs r1, r1, #0
	strh r1, [r0, #0x10]
	mov r2, sb
	mov r1, ip
	muls r1, r2, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0x12]
	str r6, [r0, #0x1c]
	str r6, [r0, #0x18]
	str r6, [r0, #0x14]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084C6C: .4byte gSineTable

	thumb_func_start sub_8084C70
sub_8084C70: @ 0x08084C70
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r3, #0
	ldr r3, [r1]
	str r3, [r5, #0x14]
	ldr r4, [r1, #4]
	str r4, [r5, #0x18]
	ldr r1, [r1, #8]
	str r1, [r5, #0x1c]
	adds r6, r5, #0
	adds r6, #0xe
	ldr r0, [r2]
	subs r0, r0, r3
	movs r3, #0
	strh r0, [r5, #0xe]
	ldr r0, [r2, #4]
	subs r0, r0, r4
	strh r0, [r6, #2]
	ldr r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0x12
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084CB0
	rsbs r0, r0, #0
_08084CB0:
	cmp r0, #0x20
	ble _08084D02
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #0xe]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084D0C
_08084D02:
	strh r3, [r5, #0xe]
	strh r3, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0x12]
_08084D0C:
	adds r3, r5, #0
	adds r3, #0xe
	adds r4, r5, #2
	movs r6, #2
	ldrsh r1, [r7, r6]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r1, r0, r1
	movs r6, #4
	ldrsh r2, [r7, r6]
	movs r6, #2
	ldrsh r0, [r3, r6]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r0, #0
	mov ip, r0
	strh r1, [r5, #2]
	movs r2, #4
	ldrsh r1, [r7, r2]
	movs r6, #0xe
	ldrsh r0, [r5, r6]
	muls r0, r1, r0
	movs r1, #0
	ldrsh r2, [r7, r1]
	movs r6, #4
	ldrsh r1, [r3, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	movs r6, #2
	ldrsh r2, [r7, r6]
	movs r6, #0xe
	ldrsh r1, [r5, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r1, #4
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r6, #6
	ldrsh r1, [r5, r6]
	adds r0, r0, r1
	adds r7, r3, #0
	cmp r0, #0
	bge _08084D7C
	rsbs r0, r0, #0
_08084D7C:
	cmp r0, #0x20
	ble _08084DCE
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #2
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #2]
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	b _08084DDA
_08084DCE:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #2]
	mov r3, ip
	strh r3, [r5, #4]
	strh r3, [r5, #6]
_08084DDA:
	adds r6, r5, #0
	adds r6, #8
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r2, #4
	ldrsh r0, [r4, r2]
	muls r1, r0, r1
	movs r3, #4
	ldrsh r2, [r7, r3]
	movs r3, #2
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r3, #0
	strh r1, [r5, #8]
	movs r0, #4
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	mov ip, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	mov r2, ip
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r4, #2
	ldrsh r2, [r7, r4]
	movs r4, #2
	ldrsh r1, [r5, r4]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r0, #8
	ldrsh r2, [r5, r0]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0xc
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084E4A
	rsbs r0, r0, #0
_08084E4A:
	cmp r0, #0x20
	ble _08084E9C
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #8]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084EA6
_08084E9C:
	strh r3, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0xa]
	strh r3, [r5, #0xc]
_08084EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8084EAC
sub_8084EAC: @ 0x08084EAC
	ldrh r2, [r0, #4]
	ldrh r3, [r0, #8]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #8]
	eors r2, r1
	strh r2, [r0, #4]
	ldrh r2, [r0, #6]
	ldrh r3, [r0, #0xe]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0xe]
	eors r2, r1
	strh r2, [r0, #6]
	ldrh r2, [r0, #0xc]
	ldrh r3, [r0, #0x10]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0x10]
	eors r2, r1
	strh r2, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_8084EE0
sub_8084EE0: @ 0x08084EE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r1, #2
	ldrsh r4, [r0, r1]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x20]
	movs r5, #0x12
	ldrsh r2, [r0, r5]
	ldr r7, [sp, #0x20]
	adds r0, r7, #0
	muls r0, r2, r0
	mov r1, r8
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r5, #0x10
	ldrsh r7, [r1, r5]
	str r7, [sp, #0x24]
	adds r1, r3, #0
	muls r1, r7, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	mov r7, r8
	movs r0, #4
	ldrsh r6, [r7, r0]
	movs r4, #8
	ldrsh r5, [r7, r4]
	adds r0, r5, #0
	muls r0, r2, r0
	movs r2, #0xe
	ldrsh r4, [r7, r2]
	adds r2, r3, #0
	muls r2, r4, r2
	subs r0, r0, r2
	asrs r0, r0, #0xa
	muls r0, r6, r0
	subs r1, r1, r0
	movs r0, #6
	ldrsh r3, [r7, r0]
	ldr r2, [sp, #0x24]
	adds r0, r5, #0
	muls r0, r2, r0
	ldr r5, [sp, #0x20]
	adds r2, r5, #0
	muls r2, r4, r2
	subs r0, r0, r2
	asrs r0, r0, #0xa
	muls r0, r3, r0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	mov r2, sp
	mov r1, r8
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldm r1!, {r4, r5}
	stm r2!, {r4, r5}
	mov r1, sp
	movs r7, #0xa
	ldrsh r2, [r1, r7]
	movs r3, #0x12
	ldrsh r1, [r1, r3]
	muls r2, r1, r2
	mov r1, sp
	movs r4, #0xc
	ldrsh r3, [r1, r4]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #2]
	rsbs r4, r0, #0
	mov r1, sp
	movs r3, #4
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #4]
	mov r1, sp
	movs r3, #4
	ldrsh r2, [r1, r3]
	movs r5, #0xc
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0xa
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #6]
	mov r1, sp
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #0xc
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #8]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xa]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0xc
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #8
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xc]
	mov r1, sp
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #0xa
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xe]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #4
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0x10]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r4, #0xa
	ldrsh r1, [r1, r4]
	muls r2, r1, r2
	mov r1, sp
	movs r5, #4
	ldrsh r3, [r1, r5]
	movs r7, #8
	ldrsh r1, [r1, r7]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x12]
	ldr r2, [sp, #0x14]
	asrs r2, r2, #0x1f
	mov sb, r2
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r4, [sp, #0x18]
	asrs r4, r4, #0x1f
	mov sl, r4
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r7, #8
	ldrsh r4, [r2, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, sp
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r4, r8
	strh r0, [r4, #0x14]
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r5, #4
	ldrsh r4, [r2, r5]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, sp
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r4, r8
	strh r0, [r4, #0x16]
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r5, #6
	ldrsh r4, [r2, r5]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, sp
	movs r7, #0x12
	ldrsh r4, [r2, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	strh r0, [r2, #0x18]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80851E0
sub_80851E0: @ 0x080851E0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x10
	mov r8, r0
	bl sub_8084EAC
	mov r1, r8
	ldr r0, [r1, #0x14]
	rsbs r0, r0, #0
	str r0, [r1, #0x14]
	ldr r4, [r1, #0x18]
	rsbs r4, r4, #0
	str r4, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	mov sb, r2
	mov r3, sb
	rsbs r3, r3, #0
	mov sb, r3
	str r3, [r1, #0x1c]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	str r4, [sp, #8]
	asrs r4, r4, #0x1f
	str r4, [sp, #0xc]
	mov r3, r8
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r2, sb
	asrs r2, r2, #0x1f
	mov sl, r2
	mov r0, sb
	mov r1, sl
	mov r3, r8
	movs r2, #0xe
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x14]
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r2, r8
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	mov r1, sl
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2, #0x18]
	movs r3, #6
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r1, r8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	mov r1, sl
	mov r3, r8
	movs r2, #0x12
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x1c]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085314
sub_8085314: @ 0x08085314
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r2, #0
	ldrsh r3, [r1, r2]
	lsls r3, r3, #1
	movs r5, #2
	ldrsh r4, [r1, r5]
	lsls r4, r4, #1
	movs r7, #4
	ldrsh r6, [r1, r7]
	lsls r6, r6, #1
	movs r5, #6
	ldrsh r2, [r1, r5]
	adds r5, r3, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	str r5, [sp]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r5, r7, #0
	lsls r5, r5, #6
	mov ip, r5
	adds r7, r6, #0
	muls r7, r2, r7
	adds r2, r7, #0
	lsls r2, r2, #6
	mov sb, r2
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r7, r3, #0
	muls r7, r2, r7
	adds r3, r7, #0
	lsls r3, r3, #6
	mov r8, r3
	adds r3, r4, #0
	muls r3, r2, r3
	lsls r3, r3, #6
	adds r5, r6, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	movs r7, #2
	ldrsh r2, [r1, r7]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r4, r7, #0
	lsls r4, r4, #6
	mov sl, r4
	adds r4, r6, #0
	muls r4, r2, r4
	lsls r4, r4, #6
	movs r7, #4
	ldrsh r1, [r1, r7]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r2, r2, #6
	mov r1, sl
	asrs r1, r1, #0x10
	mov sl, r1
	asrs r2, r2, #0x10
	adds r1, r1, r2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r6, r7, #0
	subs r1, r6, r1
	movs r7, #0
	str r7, [r0, #0x14]
	strh r1, [r0, #2]
	asrs r3, r3, #0x10
	mov r1, sb
	asrs r1, r1, #0x10
	mov sb, r1
	subs r1, r3, r1
	strh r1, [r0, #4]
	asrs r5, r5, #0x10
	mov r7, ip
	asrs r7, r7, #0x10
	adds r1, r5, r7
	strh r1, [r0, #6]
	add r3, sb
	strh r3, [r0, #8]
	mov r1, r8
	asrs r1, r1, #0x10
	mov r8, r1
	add r2, r8
	subs r2, r6, r2
	strh r2, [r0, #0xa]
	asrs r4, r4, #0x10
	ldr r2, [sp]
	asrs r3, r2, #0x10
	subs r1, r4, r3
	strh r1, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	adds r4, r4, r3
	strh r4, [r0, #0x10]
	add r8, sl
	mov r3, r8
	subs r6, r6, r3
	strh r6, [r0, #0x12]
	ldr r4, [r0, #0x14]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80853F8
sub_80853F8: @ 0x080853F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _080854D2
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _080854CC
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r4, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r2, r4, #0
	adds r2, #0x56
	ldrh r2, [r2]
	adds r3, r4, #0
	adds r3, #0x58
	ldrh r3, [r3]
	bl sub_8084B54
	adds r2, r4, #0
	adds r2, #0x5c
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x36]
	movs r6, #0
	ldrsh r1, [r2, r6]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x38]
	movs r6, #0
	ldrsh r1, [r2, r6]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x3a]
	adds r2, r4, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r6, #0x3c
	ldrsh r0, [r4, r6]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x3c]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r3, #0x3e
	ldrsh r0, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x3e]
	movs r6, #0
	ldrsh r2, [r2, r6]
	adds r1, r4, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xa
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0x60
	movs r6, #0
	ldrsh r1, [r3, r6]
	adds r2, r4, #0
	adds r2, #0x42
	movs r6, #0
	ldrsh r0, [r2, r6]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r2]
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r6, #0
	ldrsh r0, [r1, r6]
	muls r0, r2, r0
	asrs r0, r0, #0xa
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r3, r0]
	adds r2, r4, #0
	adds r2, #0x46
	movs r3, #0
	ldrsh r0, [r2, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r2]
	ldr r0, [r4, #0x64]
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x6c]
	str r0, [r4, #0x50]
_080854CC:
	ldr r0, [r4, #0xc]
	orrs r0, r5
	str r0, [r4, #0xc]
_080854D2:
	adds r0, r4, #0
	adds r0, #0x34
	pop {r4, r5, r6}
	pop {r1}
	bx r1
