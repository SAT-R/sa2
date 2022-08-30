.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; CreateCourseFinishScores
	thumb_func_start sub_808DBA4
sub_808DBA4: @ 0x0808DBA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x30]
	add r1, sp, #4
	ldr r0, _0808DCD0 @ =gUnknown_080E1208
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r6, sp, #0x10
	ldr r1, _0808DCD4 @ =gUnknown_080E1214
	adds r0, r6, #0
	movs r2, #0xc
	bl memcpy
	add r0, sp, #0x1c
	mov r8, r0
	ldr r1, _0808DCD8 @ =gUnknown_080E1220
	movs r2, #0xc
	bl memcpy
	mov r1, sp
	adds r1, #0x28
	str r1, [sp, #0x34]
	ldr r1, _0808DCDC @ =gUnknown_080E122C
	ldr r0, [sp, #0x34]
	movs r2, #6
	bl memcpy
	ldr r2, [sp, #0x30]
	lsls r4, r2, #2
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #7
	ldr r1, _0808DCE0 @ =sub_808E890
	str r1, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sl, r0
	ldr r3, _0808DCE4 @ =IWRAM_START + 0x78
	adds r0, r5, r3
	movs r1, #0
	movs r3, #0
	strh r3, [r0]
	ldr r2, _0808DCE8 @ =IWRAM_START + 0x7A
	adds r0, r5, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	adds r0, r6, r4
	ldrh r1, [r0]
	subs r2, #0xc
	adds r0, r5, r2
	strh r1, [r0]
	ldr r0, [sp, #0x30]
	lsls r0, r0, #1
	mov sb, r0
	mov r1, sb
	adds r1, #1
	lsls r1, r1, #1
	adds r6, r6, r1
	ldrh r2, [r6]
	ldr r6, _0808DCEC @ =IWRAM_START + 0x72
	adds r0, r5, r6
	strh r2, [r0]
	add r4, r8
	ldrh r2, [r4]
	ldr r4, _0808DCF0 @ =IWRAM_START + 0x74
	adds r0, r5, r4
	strh r2, [r0]
	add r8, r1
	mov r6, r8
	ldrh r1, [r6]
	ldr r2, _0808DCF4 @ =IWRAM_START + 0x76
	adds r0, r5, r2
	strh r1, [r0]
	ldr r0, _0808DCF8 @ =gUnknown_030059E0
	mov r4, sl
	str r0, [r4]
	ldr r6, _0808DCFC @ =IWRAM_START+4
	adds r7, r5, r6
	ldr r6, _0808DD00 @ =gUnknown_080E11E4
	ldr r4, [sp, #0x30]
	add r4, sb
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r3, [sp, #0x3c]
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	strh r0, [r7, #0xa]
	adds r4, #2
	lsls r4, r4, #2
	adds r4, r4, r6
	ldr r1, [r4]
	ldr r2, _0808DD04 @ =IWRAM_START + 0x24
	adds r0, r5, r2
	strb r1, [r0]
	ldr r4, _0808DD08 @ =IWRAM_START + 0x25
	adds r1, r5, r4
	movs r0, #0xff
	strb r0, [r1]
	ldr r3, [sp, #0x3c]
	strh r3, [r7, #0x16]
	strh r3, [r7, #0x18]
	strh r3, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r3, [r7, #0x1c]
	ldr r6, _0808DD0C @ =IWRAM_START + 0x26
	adds r1, r5, r6
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, [sp, #0x34]
	add r0, sb
	ldrh r0, [r0]
	ldr r1, _0808DD10 @ =IWRAM_START + 0x29
	adds r5, r5, r1
	strb r0, [r5]
	ldr r2, [sp, #0x30]
	cmp r2, #2
	beq _0808DD14
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r7, #0x10]
	b _0808DD16
	.align 2, 0
_0808DCD0: .4byte gUnknown_080E1208
_0808DCD4: .4byte gUnknown_080E1214
_0808DCD8: .4byte gUnknown_080E1220
_0808DCDC: .4byte gUnknown_080E122C
_0808DCE0: .4byte sub_808E890
_0808DCE4: .4byte IWRAM_START + 0x78
_0808DCE8: .4byte IWRAM_START + 0x7A
_0808DCEC: .4byte IWRAM_START + 0x72
_0808DCF0: .4byte IWRAM_START + 0x74
_0808DCF4: .4byte IWRAM_START + 0x76
_0808DCF8: .4byte gUnknown_030059E0
_0808DCFC: .4byte IWRAM_START+4
_0808DD00: .4byte gUnknown_080E11E4
_0808DD04: .4byte IWRAM_START + 0x24
_0808DD08: .4byte IWRAM_START + 0x25
_0808DD0C: .4byte IWRAM_START + 0x26
_0808DD10: .4byte IWRAM_START + 0x29
_0808DD14:
	str r3, [r7, #0x10]
_0808DD16:
	adds r0, r7, #0
	bl sub_8004558
	movs r4, #0
	mov r3, sl
	str r4, [r3, #0x38]
	ldr r6, [sp, #0x30]
	cmp r6, #0
	bne _0808DD76
	mov r7, sl
	adds r7, #0x34
	movs r0, #6
	bl VramMalloc
	str r0, [r7, #4]
	movs r1, #0
	movs r0, #0xea
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x54
	strb r1, [r0]
	mov r2, sl
	adds r2, #0x55
	movs r0, #0xff
	strb r0, [r2]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	strh r4, [r7, #8]
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r4, [r7, #0x1c]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	mov r0, sl
	adds r0, #0x59
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0xec
	bl m4aSongNumStart
_0808DD76:
	mov r0, sl
	adds r0, #0x64
	strh r4, [r0]
	movs r1, #0xff
	lsls r1, r1, #8
	strh r1, [r0, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808DD9C
sub_808DD9C: @ 0x0808DD9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0808DF40 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #4
	adds r6, r4, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r2, _0808DF44 @ =IWRAM_START + 0x64
	adds r2, r2, r4
	mov sl, r2
	adds r0, #0x6c
	adds r0, r0, r4
	mov ip, r0
	ldr r1, _0808DF48 @ =IWRAM_START + 0x74
	adds r2, r4, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _0808DF4C @ =IWRAM_START + 0x72
	adds r7, r4, r0
	ldr r1, _0808DF50 @ =IWRAM_START + 0x76
	adds r3, r4, r1
	ldrh r0, [r3]
	ldrh r1, [r7]
	adds r0, r0, r1
	strh r0, [r7]
	ldrh r0, [r2]
	cmp r0, #0x60
	bls _0808DDF6
	adds r1, r0, #0
	lsls r0, r1, #8
	subs r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r2]
_0808DDF6:
	ldrh r1, [r3]
	ldr r0, _0808DF54 @ =0x000007FF
	cmp r1, r0
	bhi _0808DE0A
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
_0808DE0A:
	mov r2, ip
	ldrh r0, [r2]
	ldr r3, _0808DF58 @ =gUnknown_03005960
	ldr r1, [r3]
	lsls r1, r1, #8
	str r1, [sp, #4]
	mov r1, r8
	ldr r1, [r1, #8]
	mov sb, r1
	mov r2, sb
	ldr r1, [sp, #4]
	subs r2, r2, r1
	str r2, [sp]
	ldr r2, _0808DF5C @ =0xFFFFEC00
	mov sb, r2
	ldr r2, [sp]
	add r2, sb
	cmp r0, r2
	bge _0808DE34
	mov r0, ip
	strh r2, [r0]
_0808DE34:
	ldrh r1, [r7]
	str r1, [sp]
	ldr r1, [r3, #4]
	lsls r1, r1, #8
	mov r2, r8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	ldr r1, _0808DF60 @ =0xFFFFF600
	adds r0, r0, r1
	ldr r2, [sp]
	cmp r2, r0
	ble _0808DEAA
	strh r0, [r7]
	mov r1, r8
	ldr r0, [r1, #8]
	ldr r1, [r3]
	lsls r1, r1, #8
	subs r0, r0, r1
	add r0, sb
	mov r2, ip
	strh r0, [r2]
	ldr r0, _0808DF64 @ =IWRAM_START + 0x7A
	adds r7, r4, r0
	ldrb r0, [r7]
	cmp r0, #0
	bne _0808DEAA
	mov r1, r8
	adds r1, #0x64
	movs r0, #0x52
	strh r0, [r1]
	ldr r0, [r5, #8]
	bl VramFree
	movs r0, #0x19
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x82
	strh r0, [r6, #0xa]
	ldr r1, _0808DF68 @ =IWRAM_START + 0x24
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _0808DF6C @ =IWRAM_START + 0x25
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	strb r0, [r7]
	ldr r0, _0808DF70 @ =0x000001D3
	strh r0, [r5, #0x3e]
	ldr r1, _0808DF74 @ =IWRAM_START + 0x54
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _0808DF78 @ =IWRAM_START + 0x55
	adds r1, r4, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_0808DEAA:
	adds r0, r5, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808DEC0
	ldr r0, [r5]
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r1, sl
	strh r0, [r1]
_0808DEC0:
	adds r1, r5, #0
	adds r1, #0x70
	ldrh r0, [r1]
	lsrs r0, r0, #8
	strh r0, [r6, #0x16]
	adds r2, r5, #0
	adds r2, #0x72
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldrh r0, [r1]
	lsrs r0, r0, #8
	mov r1, sl
	strh r0, [r1, #6]
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strh r0, [r1, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r0, [r6, #0x16]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r1, [r6, #0x18]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r1, r5, #0
	adds r1, #0x78
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc8
	bne _0808DF30
	ldr r0, _0808DF7C @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0808DF80 @ =gUnknown_030053F0
	ldrh r1, [r1]
	ldr r2, _0808DF84 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0808DF30:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DF40: .4byte gCurTask
_0808DF44: .4byte IWRAM_START + 0x64
_0808DF48: .4byte IWRAM_START + 0x74
_0808DF4C: .4byte IWRAM_START + 0x72
_0808DF50: .4byte IWRAM_START + 0x76
_0808DF54: .4byte 0x000007FF
_0808DF58: .4byte gUnknown_03005960
_0808DF5C: .4byte 0xFFFFEC00
_0808DF60: .4byte 0xFFFFF600
_0808DF64: .4byte IWRAM_START + 0x7A
_0808DF68: .4byte IWRAM_START + 0x24
_0808DF6C: .4byte IWRAM_START + 0x25
_0808DF70: .4byte 0x000001D3
_0808DF74: .4byte IWRAM_START + 0x54
_0808DF78: .4byte IWRAM_START + 0x55
_0808DF7C: .4byte gUnknown_03005490
_0808DF80: .4byte gUnknown_030053F0
_0808DF84: .4byte gUnknown_030054F4

	thumb_func_start sub_808DF88
sub_808DF88: @ 0x0808DF88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0808E094 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #4
	adds r0, r0, r4
	mov r8, r0
	ldr r1, [r5]
	mov ip, r1
	ldr r2, _0808E098 @ =IWRAM_START + 0x70
	adds r7, r4, r2
	ldr r0, _0808E09C @ =IWRAM_START + 0x74
	adds r2, r4, r0
	ldrh r0, [r7]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r7]
	ldr r1, _0808E0A0 @ =IWRAM_START + 0x72
	adds r6, r4, r1
	ldr r0, _0808E0A4 @ =IWRAM_START + 0x76
	adds r3, r4, r0
	ldrh r0, [r3]
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r6]
	ldrh r0, [r2]
	cmp r0, #0x60
	bls _0808DFD8
	adds r1, r0, #0
	lsls r0, r1, #7
	subs r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
_0808DFD8:
	ldrh r0, [r3]
	cmp r0, #0x60
	bls _0808DFE8
	adds r1, r0, #0
	lsls r0, r1, #7
	subs r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r3]
_0808DFE8:
	ldrh r0, [r7]
	ldr r3, _0808E0A8 @ =gUnknown_03005960
	ldr r1, [r3]
	lsls r1, r1, #8
	mov r2, ip
	ldr r2, [r2, #8]
	mov sb, r2
	subs r2, r2, r1
	mov sl, r2
	ldr r1, _0808E0AC @ =0xFFFFE400
	mov sb, r1
	add r2, sb
	cmp r0, r2
	bge _0808E006
	strh r2, [r7]
_0808E006:
	ldrh r2, [r6]
	mov sl, r2
	ldr r1, [r3, #4]
	lsls r1, r1, #8
	mov r2, ip
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	ldr r1, _0808E0B0 @ =0xFFFFEC00
	adds r0, r0, r1
	cmp sl, r0
	ble _0808E052
	strh r0, [r6]
	ldr r0, [r2, #8]
	ldr r1, [r3]
	lsls r1, r1, #8
	subs r0, r0, r1
	add r0, sb
	strh r0, [r7]
	ldr r2, _0808E0B4 @ =IWRAM_START + 0x7A
	adds r6, r4, r2
	ldrb r0, [r6]
	cmp r0, #0
	bne _0808E052
	ldr r0, [r5, #8]
	bl VramFree
	movs r0, #0x24
	bl VramMalloc
	mov r1, r8
	str r0, [r1, #4]
	movs r0, #0xdf
	strh r0, [r1, #0xa]
	ldr r2, _0808E0B8 @ =IWRAM_START + 0x24
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	strb r0, [r6]
_0808E052:
	adds r0, r5, #0
	adds r0, #0x70
	ldrh r0, [r0]
	lsrs r0, r0, #8
	mov r1, r8
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808E0C0
	adds r2, r5, #0
	adds r2, #0x7b
	ldrb r0, [r2]
	adds r0, #4
	strb r0, [r2]
	ldr r1, _0808E0BC @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	adds r0, #0x72
	ldrh r0, [r0]
	lsrs r0, r0, #8
	adds r0, r0, r1
	mov r2, r8
	strh r0, [r2, #0x18]
	b _0808E0CC
	.align 2, 0
_0808E094: .4byte gCurTask
_0808E098: .4byte IWRAM_START + 0x70
_0808E09C: .4byte IWRAM_START + 0x74
_0808E0A0: .4byte IWRAM_START + 0x72
_0808E0A4: .4byte IWRAM_START + 0x76
_0808E0A8: .4byte gUnknown_03005960
_0808E0AC: .4byte 0xFFFFE400
_0808E0B0: .4byte 0xFFFFEC00
_0808E0B4: .4byte IWRAM_START + 0x7A
_0808E0B8: .4byte IWRAM_START + 0x24
_0808E0BC: .4byte gSineTable
_0808E0C0:
	adds r0, r5, #0
	adds r0, #0x72
	ldrh r0, [r0]
	lsrs r0, r0, #8
	mov r1, r8
	strh r0, [r1, #0x18]
_0808E0CC:
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
	adds r1, r5, #0
	adds r1, #0x78
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc8
	bne _0808E0FA
	ldr r0, _0808E108 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0808E10C @ =gUnknown_030053F0
	ldrh r1, [r1]
	ldr r2, _0808E110 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0808E0FA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E108: .4byte gUnknown_03005490
_0808E10C: .4byte gUnknown_030053F0
_0808E110: .4byte gUnknown_030054F4

	thumb_func_start sub_808E114
sub_808E114: @ 0x0808E114
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _0808E150 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	adds r0, #4
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [r6]
	mov sb, r1
	ldr r2, _0808E154 @ =IWRAM_START + 0x78
	adds r1, r3, r2
	ldrh r0, [r1]
	cmp r0, #0x2d
	bhi _0808E15C
	ldr r4, _0808E158 @ =IWRAM_START + 0x70
	adds r1, r3, r4
	subs r2, #4
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	b _0808E17E
	.align 2, 0
_0808E150: .4byte gCurTask
_0808E154: .4byte IWRAM_START + 0x78
_0808E158: .4byte IWRAM_START + 0x70
_0808E15C:
	ldr r2, _0808E254 @ =gSineTable
	ldrh r0, [r1]
	subs r0, #0x2d
	lsls r0, r0, #1
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #7
	ldr r2, _0808E258 @ =IWRAM_START + 0x7C
	adds r0, r3, r2
	strb r1, [r0]
_0808E17E:
	adds r2, r6, #0
	adds r2, #0x74
	ldrh r0, [r2]
	cmp r0, #0x60
	bls _0808E192
	adds r1, r0, #0
	lsls r0, r1, #7
	subs r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
_0808E192:
	adds r5, r6, #0
	adds r5, #0x70
	ldrh r2, [r5]
	ldr r3, _0808E25C @ =gUnknown_03005960
	ldr r1, [r3]
	lsls r1, r1, #8
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, r0, r1
	ldr r1, _0808E260 @ =0xFFFFC000
	adds r0, r0, r1
	cmp r2, r0
	ble _0808E1AE
	strh r0, [r5]
_0808E1AE:
	adds r4, r6, #0
	adds r4, #0x72
	ldrh r0, [r4]
	lsrs r0, r0, #8
	ldr r1, [r3, #4]
	adds r0, r0, r1
	ldrh r1, [r5]
	lsrs r1, r1, #8
	ldr r2, [r3]
	adds r1, r1, r2
	adds r7, r6, #0
	adds r7, #0x7c
	movs r2, #0
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	ldr r2, _0808E264 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r1, r0, #0
	cmp r1, #0
	bge _0808E1E6
	lsls r0, r1, #8
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
_0808E1E6:
	cmp r1, #0
	ble _0808E1F6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
_0808E1F6:
	ldrh r1, [r5]
	lsrs r1, r1, #8
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r4]
	lsrs r0, r0, #8
	subs r0, #0xe
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
	adds r4, r6, #0
	adds r4, #0x78
	ldrh r0, [r4]
	cmp r0, #0x28
	bne _0808E22A
	mov r1, sb
	adds r1, #0x64
	movs r0, #0x52
	strh r0, [r1]
_0808E22A:
	ldrh r0, [r4]
	cmp r0, #0xc8
	bne _0808E240
	ldr r0, _0808E268 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0808E26C @ =gUnknown_030053F0
	ldrh r1, [r1]
	ldr r2, _0808E270 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0808E240:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E254: .4byte gSineTable
_0808E258: .4byte IWRAM_START + 0x7C
_0808E25C: .4byte gUnknown_03005960
_0808E260: .4byte 0xFFFFC000
_0808E264: .4byte sub_801EC3C
_0808E268: .4byte gUnknown_03005490
_0808E26C: .4byte gUnknown_030053F0
_0808E270: .4byte gUnknown_030054F4

	thumb_func_start sub_808E274
sub_808E274: @ 0x0808E274
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r1, _0808E32C @ =gDispCnt
	movs r0, #0xb2
	lsls r0, r0, #5
	strh r0, [r1]
	ldr r1, _0808E330 @ =gBgCntRegs
	movs r4, #0
	movs r5, #0
	movs r0, #0xe0
	lsls r0, r0, #5
	strh r0, [r1]
	ldr r0, _0808E334 @ =0x00001D05
	strh r0, [r1, #2]
	ldr r0, _0808E338 @ =0x00005E0A
	strh r0, [r1, #4]
	str r5, [sp, #0x10]
	ldr r1, _0808E33C @ =0x040000D4
	add r0, sp, #0x10
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808E340 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0808E344 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _0808E348 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	strb r4, [r3, #2]
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	ldr r0, _0808E34C @ =gBgScrollRegs
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	strh r5, [r0, #4]
	ldr r1, _0808E350 @ =0x0000FF88
	strh r1, [r0, #6]
	strh r5, [r0]
	strh r5, [r0, #2]
	movs r4, #0x80
	lsls r4, r4, #1
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _0808E354 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8003EE4
	adds r0, r6, #0
	bl sub_808E35C
	adds r6, r6, r4
	movs r0, #1
	strh r0, [r6]
	strh r5, [r6, #4]
	movs r0, #2
	strh r0, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #6]
	ldr r0, _0808E358 @ =0x00003FFF
	strh r0, [r6, #8]
	strh r5, [r6, #0xa]
	adds r0, r6, #0
	bl sub_802D4CC
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E32C: .4byte gDispCnt
_0808E330: .4byte gBgCntRegs
_0808E334: .4byte 0x00001D05
_0808E338: .4byte 0x00005E0A
_0808E33C: .4byte 0x040000D4
_0808E340: .4byte 0x85004000
_0808E344: .4byte gUnknown_03004D80
_0808E348: .4byte gUnknown_03002280
_0808E34C: .4byte gBgScrollRegs
_0808E350: .4byte 0x0000FF88
_0808E354: .4byte gBgAffineRegs
_0808E358: .4byte 0x00003FFF

	thumb_func_start sub_808E35C
sub_808E35C: @ 0x0808E35C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0808E408 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r0, #0
	bge _0808E372
	movs r2, #0
_0808E372:
	adds r0, r7, #0
	adds r0, #0x80
	ldr r1, _0808E40C @ =0x06004000
	str r1, [r0, #4]
	movs r6, #0
	movs r4, #0
	strh r4, [r0, #0xa]
	ldr r1, _0808E410 @ =0x0600E800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r3, _0808E414 @ =gUnknown_080E1130
	movs r1, #0x87
	lsls r1, r1, #1
	adds r5, r7, r1
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #4
	subs r1, r1, r2
	ldrh r5, [r5]
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r5, #0x1e
	strh r5, [r0, #0x26]
	movs r1, #5
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0xaa
	strb r6, [r1]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r0, _0808E418 @ =0x06008000
	str r0, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808E41C @ =0x0600F000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r1, _0808E420 @ =gUnknown_080E1118
	movs r2, #0x86
	lsls r2, r2, #1
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	strh r5, [r7, #0x26]
	movs r0, #0x14
	strh r0, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r6, [r0]
	movs r0, #2
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E408: .4byte gLoadedSaveGame
_0808E40C: .4byte 0x06004000
_0808E410: .4byte 0x0600E800
_0808E414: .4byte gUnknown_080E1130
_0808E418: .4byte 0x06008000
_0808E41C: .4byte 0x0600F000
_0808E420: .4byte gUnknown_080E1118

	thumb_func_start sub_808E424
sub_808E424: @ 0x0808E424
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, _0808E458 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0808E45C @ =IWRAM_START + 0x110
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _0808E476
	movs r0, #1
	strh r0, [r2]
	ldr r2, _0808E460 @ =IWRAM_START + 0x112
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808E470
	cmp r0, #1
	bgt _0808E464
	cmp r0, #0
	beq _0808E468
	b _0808E476
	.align 2, 0
_0808E458: .4byte gCurTask
_0808E45C: .4byte IWRAM_START + 0x110
_0808E460: .4byte IWRAM_START + 0x112
_0808E464:
	cmp r0, #2
	bne _0808E476
_0808E468:
	movs r0, #0x2d
	bl m4aSongNumStart
	b _0808E476
_0808E470:
	movs r0, #0x2e
	bl m4aSongNumStart
_0808E476:
	movs r4, #0x80
	lsls r4, r4, #1
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _0808E4BC @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8003EE4
	adds r4, r6, r4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808E4B2
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r5, [r0]
	ldr r0, _0808E4C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808E4C4 @ =sub_808E4C8
	str r0, [r1, #8]
_0808E4B2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E4BC: .4byte gBgAffineRegs
_0808E4C0: .4byte gCurTask
_0808E4C4: .4byte sub_808E4C8

	thumb_func_start sub_808E4C8
sub_808E4C8: @ 0x0808E4C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0808E5AC @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r8, r1
	cmp r0, #0
	bge _0808E4EA
	movs r0, #0
	mov r8, r0
_0808E4EA:
	ldr r1, _0808E5B0 @ =gCurTask
	mov sb, r1
	ldr r0, [r1]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sl, r0
	movs r7, #0x80
	lsls r7, r7, #1
	movs r6, #0
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	ldr r0, _0808E5B4 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r0, _0808E5B8 @ =IWRAM_START + 0x110
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xaa
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0808E600
	strh r6, [r2]
	ldr r1, _0808E5BC @ =IWRAM_START + 0x10C
	adds r2, r5, r1
	ldrh r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _0808E5E4
	ldr r1, _0808E5C0 @ =gBgScrollRegs
	ldr r0, _0808E5C4 @ =0x0000FFDC
	strh r0, [r1, #2]
	ldr r1, _0808E5C8 @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r6, [r0, #0xa]
	ldr r1, _0808E5CC @ =0x0600E000
	str r1, [r0, #0xc]
	strh r6, [r0, #0x18]
	strh r6, [r0, #0x1a]
	ldr r4, _0808E5D0 @ =gUnknown_080E1130
	ldr r1, _0808E5D4 @ =IWRAM_START + 0x10E
	adds r3, r5, r1
	mov r1, r8
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #4
	subs r1, r1, r2
	adds r1, #1
	ldrh r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	strh r6, [r0, #0x1e]
	strh r6, [r0, #0x20]
	strh r6, [r0, #0x22]
	strh r6, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #5
	strh r1, [r0, #0x28]
	ldr r1, _0808E5D8 @ =IWRAM_START + 0x6A
	adds r2, r5, r1
	movs r1, #0
	strb r1, [r2]
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r2, _0808E5DC @ =gDispCnt
	ldrh r1, [r2]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xcd
	lsls r0, r0, #1
	bl m4aSongNumStart
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0808E5E0 @ =sub_808E63C
	b _0808E5FE
	.align 2, 0
_0808E5AC: .4byte gLoadedSaveGame
_0808E5B0: .4byte gCurTask
_0808E5B4: .4byte gBgAffineRegs
_0808E5B8: .4byte IWRAM_START + 0x110
_0808E5BC: .4byte IWRAM_START + 0x10C
_0808E5C0: .4byte gBgScrollRegs
_0808E5C4: .4byte 0x0000FFDC
_0808E5C8: .4byte IWRAM_START + 0x40
_0808E5CC: .4byte 0x0600E000
_0808E5D0: .4byte gUnknown_080E1130
_0808E5D4: .4byte IWRAM_START + 0x10E
_0808E5D8: .4byte IWRAM_START + 0x6A
_0808E5DC: .4byte gDispCnt
_0808E5E0: .4byte sub_808E63C
_0808E5E4:
	adds r0, r1, #1
	strh r0, [r2]
	ldr r0, _0808E630 @ =IWRAM_START + 0x10E
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	mov r0, sl
	bl sub_808E35C
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0808E634 @ =sub_808E4C8
_0808E5FE:
	str r0, [r1, #8]
_0808E600:
	ldr r0, _0808E638 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808E61E
	movs r1, #0x88
	lsls r1, r1, #1
	add r1, sl
	ldrh r0, [r1]
	cmp r0, #8
	bls _0808E61E
	movs r0, #0xaa
	lsls r0, r0, #1
	strh r0, [r1]
_0808E61E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E630: .4byte IWRAM_START + 0x10E
_0808E634: .4byte sub_808E4C8
_0808E638: .4byte gPressedKeys

	thumb_func_start sub_808E63C
sub_808E63C: @ 0x0808E63C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0808E698 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	ldr r0, _0808E69C @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r0, _0808E6A0 @ =IWRAM_START + 0x110
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0808E68E
	strh r4, [r2]
	ldr r0, _0808E6A4 @ =IWRAM_START + 0x100
	adds r1, r5, r0
	movs r2, #1
	strh r2, [r1]
	ldr r0, _0808E6A8 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r4, [r1, #4]
	strh r2, [r1, #2]
	strh r4, [r1, #0xa]
	ldr r1, [r6]
	ldr r0, _0808E6AC @ =sub_808E6B0
	str r0, [r1, #8]
_0808E68E:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E698: .4byte gCurTask
_0808E69C: .4byte gBgAffineRegs
_0808E6A0: .4byte IWRAM_START + 0x110
_0808E6A4: .4byte IWRAM_START + 0x100
_0808E6A8: .4byte 0x00003FFF
_0808E6AC: .4byte sub_808E6B0

	thumb_func_start sub_808E6B0
sub_808E6B0: @ 0x0808E6B0
	push {r4, lr}
	sub sp, #0x10
	ldr r0, _0808E70C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0808E710 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r0, _0808E714 @ =IWRAM_START + 0x100
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808E734
	ldr r3, _0808E718 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	ldr r0, _0808E71C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _0808E720 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	blt _0808E724
	ldrb r0, [r3]
	movs r2, #1
	bl sub_80346C8
	b _0808E72C
	.align 2, 0
_0808E70C: .4byte gCurTask
_0808E710: .4byte gBgAffineRegs
_0808E714: .4byte IWRAM_START + 0x100
_0808E718: .4byte gCurrentLevel
_0808E71C: .4byte gLoadedSaveGame
_0808E720: .4byte gSelectedCharacter
_0808E724:
	ldrb r0, [r3]
	movs r2, #4
	bl sub_80346C8
_0808E72C:
	ldr r0, _0808E73C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808E734:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E73C: .4byte gCurTask

@; CreateCreamCutScene
	thumb_func_start sub_808E740
sub_808E740: @ 0x0808E740
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0808E790 @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r5, #0
	str r5, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	lsls r2, r4, #2
	ldr r6, _0808E794 @ =IWRAM_START + 0x10C
	adds r3, r1, r6
	strh r2, [r3]
	adds r2, r2, r4
	adds r6, #2
	adds r3, r1, r6
	strh r2, [r3]
	ldr r3, _0808E798 @ =IWRAM_START + 0x110
	adds r2, r1, r3
	strh r5, [r2]
	adds r6, #4
	adds r1, r1, r6
	strb r4, [r1]
	bl sub_808E274
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E790: .4byte sub_808E424
_0808E794: .4byte IWRAM_START + 0x10C
_0808E798: .4byte IWRAM_START + 0x110

@; CreateCreamCutScene2
	thumb_func_start sub_808E79C
sub_808E79C: @ 0x0808E79C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808E7DC @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, _0808E7E0 @ =IWRAM_START + 0x10C
	adds r1, r2, r3
	strh r4, [r1]
	adds r3, #2
	adds r1, r2, r3
	strh r4, [r1]
	ldr r1, _0808E7E4 @ =IWRAM_START + 0x110
	adds r2, r2, r1
	strh r4, [r2]
	bl sub_808E274
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E7DC: .4byte sub_808E424
_0808E7E0: .4byte IWRAM_START + 0x10C
_0808E7E4: .4byte IWRAM_START + 0x110

@; CreateTailsCutScene
	thumb_func_start sub_808E7E8
sub_808E7E8: @ 0x0808E7E8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808E82C @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _0808E830 @ =IWRAM_START + 0x10C
	adds r3, r2, r1
	movs r1, #8
	strh r1, [r3]
	ldr r1, _0808E834 @ =IWRAM_START + 0x10E
	adds r3, r2, r1
	movs r1, #0xa
	strh r1, [r3]
	ldr r1, _0808E838 @ =IWRAM_START + 0x110
	adds r2, r2, r1
	strh r4, [r2]
	bl sub_808E274
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E82C: .4byte sub_808E424
_0808E830: .4byte IWRAM_START + 0x10C
_0808E834: .4byte IWRAM_START + 0x10E
_0808E838: .4byte IWRAM_START + 0x110

@; CreateKnucklesCutScene
	thumb_func_start sub_808E83C
sub_808E83C: @ 0x0808E83C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808E880 @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _0808E884 @ =IWRAM_START + 0x10C
	adds r3, r2, r1
	movs r1, #4
	strh r1, [r3]
	ldr r1, _0808E888 @ =IWRAM_START + 0x10E
	adds r3, r2, r1
	movs r1, #5
	strh r1, [r3]
	ldr r1, _0808E88C @ =IWRAM_START + 0x110
	adds r2, r2, r1
	strh r4, [r2]
	bl sub_808E274
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E880: .4byte sub_808E424
_0808E884: .4byte IWRAM_START + 0x10C
_0808E888: .4byte IWRAM_START + 0x10E
_0808E88C: .4byte IWRAM_START + 0x110

	thumb_func_start sub_808E890
sub_808E890: @ 0x0808E890
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #8]
	bl VramFree
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0808E8AA
	bl VramFree
_0808E8AA:
	pop {r4}
	pop {r0}
	bx r0

@; CreateFinalEndingCutScenePart1
	thumb_func_start sub_808E8B0
sub_808E8B0: @ 0x0808E8B0
	push {lr}
	sub sp, #4
	ldr r0, _0808E8E4 @ =sub_808E9AC
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _0808E8E8 @ =sub_808E9F8
	str r1, [sp]
	movs r1, #0x74
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _0808E8EC @ =IWRAM_START + 0x6C
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0808E8F0 @ =IWRAM_START + 0x6D
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0808E8F4 @ =IWRAM_START + 0x6E
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808E8E4: .4byte sub_808E9AC
_0808E8E8: .4byte sub_808E9F8
_0808E8EC: .4byte IWRAM_START + 0x6C
_0808E8F0: .4byte IWRAM_START + 0x6D
_0808E8F4: .4byte IWRAM_START + 0x6E

	thumb_func_start sub_808E8F8
sub_808E8F8: @ 0x0808E8F8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r6, r4, #0
	ldrh r5, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	beq _0808E916
	strh r2, [r3]
	b _0808E954
_0808E916:
	ldr r2, _0808E93C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0808E940 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0808E944 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E948
	movs r1, #0x10
	subs r1, r1, r4
	adds r0, r2, #0
	asrs r0, r1
	adds r0, r5, r0
	b _0808E952
	.align 2, 0
_0808E93C: .4byte gUnknown_030053B8
_0808E940: .4byte 0x00196225
_0808E944: .4byte 0x3C6EF35F
_0808E948:
	movs r1, #8
	subs r1, r1, r6
	adds r0, r2, #0
	asrs r0, r1
	subs r0, r5, r0
_0808E952:
	strh r0, [r3]
_0808E954:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808E95C
sub_808E95C: @ 0x0808E95C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r3, [r4]
	cmp r3, r1
	beq _0808E96E
	str r1, [r4]
	b _0808E9A4
_0808E96E:
	ldr r2, _0808E994 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0808E998 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0808E99C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E9A0
	movs r1, #8
	subs r1, r1, r5
	adds r0, r2, #0
	asrs r0, r1
	adds r0, r3, r0
	b _0808E9A2
	.align 2, 0
_0808E994: .4byte gUnknown_030053B8
_0808E998: .4byte 0x00196225
_0808E99C: .4byte 0x3C6EF35F
_0808E9A0:
	subs r0, r3, r2
_0808E9A2:
	str r0, [r4]
_0808E9A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808E9AC
sub_808E9AC: @ 0x0808E9AC
	push {lr}
	ldr r0, _0808E9C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0808E9C8 @ =IWRAM_START + 0x6E
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808E9CC
	subs r0, #1
	strh r0, [r1]
	b _0808E9F0
	.align 2, 0
_0808E9C4: .4byte gCurTask
_0808E9C8: .4byte IWRAM_START + 0x6E
_0808E9CC:
	ldr r0, _0808E9E0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _0808E9E4
	bl sub_808FC78
	b _0808E9E8
	.align 2, 0
_0808E9E0: .4byte gCurrentLevel
_0808E9E4:
	bl sub_8091684
_0808E9E8:
	ldr r0, _0808E9F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808E9F0:
	pop {r0}
	bx r0
	.align 2, 0
_0808E9F4: .4byte gCurTask

	thumb_func_start sub_808E9F8
sub_808E9F8: @ 0x0808E9F8
	bx lr
	.align 2, 0

	thumb_func_start sub_808E9FC
sub_808E9FC: @ 0x0808E9FC
	push {lr}
	ldr r2, _0808EA24 @ =gCurTask
	ldr r0, [r2]
	ldrh r3, [r0, #6]
	ldr r0, _0808EA28 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _0808EA2C @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1d
	bls _0808EA34
	ldr r0, _0808EA30 @ =IWRAM_START + 0x6D
	adds r1, r3, r0
	movs r0, #2
	b _0808EA3A
	.align 2, 0
_0808EA24: .4byte gCurTask
_0808EA28: .4byte gLoadedSaveGame
_0808EA2C: .4byte gSelectedCharacter
_0808EA30: .4byte IWRAM_START + 0x6D
_0808EA34:
	ldr r0, _0808EA48 @ =IWRAM_START + 0x6D
	adds r1, r3, r0
	movs r0, #1
_0808EA3A:
	strb r0, [r1]
	ldr r1, [r2]
	ldr r0, _0808EA4C @ =sub_808E9AC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0808EA48: .4byte IWRAM_START + 0x6D
_0808EA4C: .4byte sub_808E9AC

;@ CreateCreditsCutScenePart2
	thumb_func_start sub_808EA50
sub_808EA50: @ 0x0808EA50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r7, #0
	ldr r1, _0808EAE4 @ =gDispCnt
	movs r2, #0x8a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808EAE8 @ =gBgCntRegs
	movs r3, #0
	mov r8, r3
	movs r0, #0xb8
	lsls r0, r0, #7
	strh r0, [r1]
	ldr r0, _0808EAEC @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	ldr r0, _0808EAF0 @ =gUnknown_03004D80
	mov r1, r8
	strb r1, [r0]
	ldr r1, _0808EAF4 @ =gUnknown_03002280
	mov r2, r8
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _0808EAF8 @ =sub_808EBC4
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _0808EAFC @ =sub_808ED5C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	movs r1, #0x52
	strh r7, [r1]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r3, _0808EB00 @ =IWRAM_START + 0x4C
	adds r1, r2, r3
	strb r4, [r1]
	adds r3, #2
	adds r0, r2, r3
	strb r5, [r0]
	adds r3, #1
	adds r0, r2, r3
	strb r6, [r0]
	movs r0, #0xb4
	str r0, [r7, #0x54]
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808EB08
	ldr r0, _0808EB04 @ =IWRAM_START + 0x50
	adds r1, r2, r0
	movs r0, #5
	strb r0, [r1]
	b _0808EB10
	.align 2, 0
_0808EAE4: .4byte gDispCnt
_0808EAE8: .4byte gBgCntRegs
_0808EAEC: .4byte gBgScrollRegs
_0808EAF0: .4byte gUnknown_03004D80
_0808EAF4: .4byte gUnknown_03002280
_0808EAF8: .4byte sub_808EBC4
_0808EAFC: .4byte sub_808ED5C
_0808EB00: .4byte IWRAM_START + 0x4C
_0808EB04: .4byte IWRAM_START + 0x50
_0808EB08:
	ldr r1, _0808EB40 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	mov r2, r8
	strb r2, [r0]
_0808EB10:
	adds r0, r7, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #1
	bne _0808EB26
	ldr r0, _0808EB44 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	bne _0808EB36
_0808EB26:
	ldrb r1, [r2]
	cmp r1, #2
	bne _0808EB48
	ldr r0, _0808EB44 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _0808EB48
_0808EB36:
	adds r0, r7, #0
	adds r0, #0x4d
	strb r1, [r0]
	b _0808EB50
	.align 2, 0
_0808EB40: .4byte IWRAM_START + 0x50
_0808EB44: .4byte gLoadedSaveGame
_0808EB48:
	adds r1, r7, #0
	adds r1, #0x4d
	movs r0, #0
	strb r0, [r1]
_0808EB50:
	adds r1, r7, #0
	adds r1, #0x40
	movs r4, #0
	movs r2, #0
	strh r2, [r1]
	strh r2, [r1, #4]
	strh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldr r0, _0808EBB8 @ =0x00003FFF
	strh r0, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r7, #4]
	strh r2, [r7, #0xa]
	ldr r0, _0808EBBC @ =0x0600E000
	str r0, [r7, #0xc]
	strh r2, [r7, #0x18]
	strh r2, [r7, #0x1a]
	ldr r3, _0808EBC0 @ =gUnknown_080E1244
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	adds r1, #0xe
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	strh r2, [r7, #0x1e]
	strh r2, [r7, #0x20]
	strh r2, [r7, #0x22]
	strh r2, [r7, #0x24]
	movs r0, #0x1e
	strh r0, [r7, #0x26]
	movs r0, #0x14
	strh r0, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r4, [r0]
	strh r2, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EBB8: .4byte 0x00003FFF
_0808EBBC: .4byte 0x0600E000
_0808EBC0: .4byte gUnknown_080E1244

	thumb_func_start sub_808EBC4
sub_808EBC4: @ 0x0808EBC4
	push {r4, lr}
	ldr r0, _0808EC10 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r1, _0808EC14 @ =IWRAM_START + 0x40
	adds r4, r0, r1
	movs r1, #2
	strh r1, [r4, #2]
	ldr r1, _0808EC18 @ =IWRAM_START + 0x4D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808EBEE
	ldr r0, _0808EC1C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808EBEE
	ldr r0, _0808EC20 @ =sub_808ECB4
	str r0, [r2, #8]
_0808EBEE:
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808EC08
	movs r0, #0
	strh r0, [r4, #4]
	ldr r0, _0808EC10 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808EC24 @ =sub_808EC64
	str r0, [r1, #8]
_0808EC08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC10: .4byte gCurTask
_0808EC14: .4byte IWRAM_START + 0x40
_0808EC18: .4byte IWRAM_START + 0x4D
_0808EC1C: .4byte gPressedKeys
_0808EC20: .4byte sub_808ECB4
_0808EC24: .4byte sub_808EC64

	thumb_func_start sub_808EC28
sub_808EC28: @ 0x0808EC28
	push {r4, r5, lr}
	ldr r5, _0808EC58 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _0808EC5C @ =IWRAM_START + 0x40
	adds r4, r0, r1
	movs r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808EC50
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _0808EC60 @ =sub_808ED04
	str r0, [r1, #8]
_0808EC50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC58: .4byte gCurTask
_0808EC5C: .4byte IWRAM_START + 0x40
_0808EC60: .4byte sub_808ED04

	thumb_func_start sub_808EC64
sub_808EC64: @ 0x0808EC64
	push {r4, lr}
	ldr r2, _0808EC98 @ =gCurTask
	ldr r3, [r2]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x4d
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808EC8C
	ldr r0, _0808EC9C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808EC8C
	ldr r0, _0808ECA0 @ =sub_808ECB4
	str r0, [r3, #8]
_0808EC8C:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0808ECA4
	subs r0, #1
	str r0, [r4, #0x54]
	b _0808ECAA
	.align 2, 0
_0808EC98: .4byte gCurTask
_0808EC9C: .4byte gPressedKeys
_0808ECA0: .4byte sub_808ECB4
_0808ECA4:
	ldr r1, [r2]
	ldr r0, _0808ECB0 @ =sub_808EC28
	str r0, [r1, #8]
_0808ECAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECB0: .4byte sub_808EC28

	thumb_func_start sub_808ECB4
sub_808ECB4: @ 0x0808ECB4
	push {r4, r5, r6, lr}
	ldr r6, _0808ECF4 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	ldr r0, _0808ECF8 @ =IWRAM_START + 0x40
	adds r4, r5, r0
	movs r0, #1
	strh r0, [r4, #2]
	ldr r0, _0808ECFC @ =gMPlayInfo_BGM
	movs r1, #0x18
	bl m4aMPlayFadeOutTemporarily
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808ECEE
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, _0808ED00 @ =IWRAM_START + 0x4C
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_808F14C
	ldr r0, [r6]
	bl TaskDestroy
_0808ECEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECF4: .4byte gCurTask
_0808ECF8: .4byte IWRAM_START + 0x40
_0808ECFC: .4byte gMPlayInfo_BGM
_0808ED00: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_808ED04
sub_808ED04: @ 0x0808ED04
	push {r4, lr}
	ldr r0, _0808ED30 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r0, _0808ED34 @ =IWRAM_START + 0x4E
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _0808ED38 @ =IWRAM_START + 0x4F
	adds r3, r1, r4
	ldrb r0, [r3]
	cmp r0, #3
	bhi _0808ED3C
	subs r4, #3
	adds r0, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r2]
	ldrb r2, [r3]
	bl sub_808ED60
	b _0808ED46
	.align 2, 0
_0808ED30: .4byte gCurTask
_0808ED34: .4byte IWRAM_START + 0x4E
_0808ED38: .4byte IWRAM_START + 0x4F
_0808ED3C:
	ldr r2, _0808ED54 @ =IWRAM_START + 0x4C
	adds r0, r1, r2
	ldrb r0, [r0]
	bl sub_808F14C
_0808ED46:
	ldr r0, _0808ED58 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ED54: .4byte IWRAM_START + 0x4C
_0808ED58: .4byte gCurTask

	thumb_func_start sub_808ED5C
sub_808ED5C: @ 0x0808ED5C
	bx lr
	.align 2, 0

@; CreateCreditsVariant2
	thumb_func_start sub_808ED60
sub_808ED60: @ 0x0808ED60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #0
	mov ip, r1
	ldr r1, _0808EE0C @ =gDispCnt
	ldr r2, _0808EE10 @ =0x00001241
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808EE14 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0808EE18 @ =0x00001C04
	strh r0, [r1, #2]
	ldr r0, _0808EE1C @ =gBgScrollRegs
	mov r3, ip
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	ldr r0, _0808EE20 @ =gUnknown_03004D80
	strb r4, [r0, #1]
	ldr r1, _0808EE24 @ =gUnknown_03002280
	strb r4, [r1, #4]
	strb r4, [r1, #5]
	movs r0, #0xff
	strb r0, [r1, #6]
	movs r0, #0x20
	strb r0, [r1, #7]
	ldr r0, _0808EE28 @ =sub_808F004
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _0808EE2C @ =sub_808F148
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r7, _0808EE30 @ =IWRAM_START + 0x4C
	adds r1, r2, r7
	strb r5, [r1]
	ldr r3, _0808EE34 @ =IWRAM_START + 0x4E
	adds r0, r2, r3
	strb r6, [r0]
	adds r7, #3
	adds r0, r2, r7
	mov r3, r8
	strb r3, [r0]
	adds r7, #3
	adds r0, r2, r7
	strb r4, [r0]
	movs r0, #0x96
	mov r3, ip
	str r0, [r3, #0x54]
	subs r7, #2
	adds r0, r2, r7
	strb r4, [r0]
	ldrb r1, [r1]
	cmp r1, #1
	bne _0808EE40
	ldr r0, _0808EE38 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _0808EE40
	ldr r3, _0808EE3C @ =IWRAM_START + 0x4D
	adds r0, r2, r3
	strb r1, [r0]
	b _0808EE68
	.align 2, 0
_0808EE0C: .4byte gDispCnt
_0808EE10: .4byte 0x00001241
_0808EE14: .4byte gBgCntRegs
_0808EE18: .4byte 0x00001C04
_0808EE1C: .4byte gBgScrollRegs
_0808EE20: .4byte gUnknown_03004D80
_0808EE24: .4byte gUnknown_03002280
_0808EE28: .4byte sub_808F004
_0808EE2C: .4byte sub_808F148
_0808EE30: .4byte IWRAM_START + 0x4C
_0808EE34: .4byte IWRAM_START + 0x4E
_0808EE38: .4byte gLoadedSaveGame
_0808EE3C: .4byte IWRAM_START + 0x4D
_0808EE40:
	mov r0, ip
	adds r0, #0x4c
	ldrb r1, [r0]
	cmp r1, #2
	bne _0808EE60
	ldr r0, _0808EE5C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _0808EE60
	mov r0, ip
	adds r0, #0x4d
	strb r1, [r0]
	b _0808EE68
	.align 2, 0
_0808EE5C: .4byte gLoadedSaveGame
_0808EE60:
	mov r1, ip
	adds r1, #0x4d
	movs r0, #0
	strb r0, [r1]
_0808EE68:
	movs r3, #0
	mov r4, ip
	adds r4, #0x4f
	adds r1, r4, #0
	mov r5, ip
	adds r5, #0x50
	ldr r7, _0808EF24 @ =gUnknown_080E12AA
	mov sb, r7
	movs r0, #0x51
	add r0, ip
	mov r8, r0
	mov r2, ip
	adds r2, #0x40
	str r2, [sp, #4]
	ldr r7, _0808EF28 @ =gUnknown_080E1278
	mov sl, r7
	ldrb r0, [r4]
	cmp r3, r0
	bhs _0808EEA8
	adds r2, r5, #0
	mov r6, sb
_0808EE92:
	adds r0, r3, r6
	ldrb r0, [r0]
	ldrb r7, [r2]
	adds r0, r0, r7
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r4]
	cmp r3, r0
	blo _0808EE92
_0808EEA8:
	ldrb r0, [r1]
	add r0, sb
	ldrb r0, [r0]
	ldrb r1, [r5]
	adds r0, r0, r1
	movs r2, #0
	mov r3, r8
	strb r0, [r3]
	ldr r1, [sp, #4]
	movs r3, #1
	strh r3, [r1]
	strh r2, [r1, #4]
	strh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	ldr r0, _0808EF2C @ =0x00003FFF
	strh r0, [r1, #8]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	cmp r0, #0
	beq _0808EF12
	ldr r0, _0808EF30 @ =0x06004000
	mov r7, ip
	str r0, [r7, #4]
	strh r2, [r7, #0xa]
	ldr r0, _0808EF34 @ =0x0600E000
	str r0, [r7, #0xc]
	strh r2, [r7, #0x18]
	strh r2, [r7, #0x1a]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	strh r2, [r7, #0x1e]
	strh r2, [r7, #0x20]
	strh r2, [r7, #0x22]
	strh r2, [r7, #0x24]
	movs r0, #0x1e
	strh r0, [r7, #0x26]
	movs r0, #0x14
	strh r0, [r7, #0x28]
	mov r1, ip
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r3, [r7, #0x2e]
	mov r0, ip
	bl sub_8002A3C
_0808EF12:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF24: .4byte gUnknown_080E12AA
_0808EF28: .4byte gUnknown_080E1278
_0808EF2C: .4byte 0x00003FFF
_0808EF30: .4byte 0x06004000
_0808EF34: .4byte 0x0600E000

	thumb_func_start sub_808EF38
sub_808EF38: @ 0x0808EF38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808EFCC @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r7, r0
	ldr r1, _0808EFD0 @ =IWRAM_START + 0x40
	adds r5, r7, r1
	movs r6, #0
	movs r0, #1
	strh r0, [r5, #2]
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _0808EFF4
	strh r6, [r5, #4]
	ldr r5, _0808EFD4 @ =IWRAM_START + 0x50
	adds r2, r7, r5
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r5, #1
	adds r1, r7, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0808EFEC
	ldr r1, _0808EFD8 @ =gUnknown_080E1278
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0808EFC4
	ldr r0, _0808EFDC @ =0x06004000
	str r0, [r4, #4]
	strh r6, [r4, #0xa]
	ldr r0, _0808EFE0 @ =0x0600E000
	str r0, [r4, #0xc]
	strh r6, [r4, #0x18]
	strh r6, [r4, #0x1a]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x1c]
	strh r6, [r4, #0x1e]
	strh r6, [r4, #0x20]
	strh r6, [r4, #0x22]
	strh r6, [r4, #0x24]
	movs r0, #0x1e
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	ldr r0, _0808EFE4 @ =IWRAM_START + 0x2A
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
	strh r3, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
_0808EFC4:
	mov r5, r8
	ldr r1, [r5]
	ldr r0, _0808EFE8 @ =sub_808F004
	b _0808EFF2
	.align 2, 0
_0808EFCC: .4byte gCurTask
_0808EFD0: .4byte IWRAM_START + 0x40
_0808EFD4: .4byte IWRAM_START + 0x50
_0808EFD8: .4byte gUnknown_080E1278
_0808EFDC: .4byte 0x06004000
_0808EFE0: .4byte 0x0600E000
_0808EFE4: .4byte IWRAM_START + 0x2A
_0808EFE8: .4byte sub_808F004
_0808EFEC:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0808F000 @ =sub_808F10C
_0808EFF2:
	str r0, [r1, #8]
_0808EFF4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F000: .4byte sub_808F10C

	thumb_func_start sub_808F004
sub_808F004: @ 0x0808F004
	push {r4, lr}
	ldr r0, _0808F050 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r1, _0808F054 @ =IWRAM_START + 0x40
	adds r4, r0, r1
	movs r1, #2
	strh r1, [r4, #2]
	ldr r1, _0808F058 @ =IWRAM_START + 0x4D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F02E
	ldr r0, _0808F05C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808F02E
	ldr r0, _0808F060 @ =sub_808F0BC
	str r0, [r2, #8]
_0808F02E:
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F048
	movs r0, #0
	strh r0, [r4, #4]
	ldr r0, _0808F050 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F064 @ =sub_808F068
	str r0, [r1, #8]
_0808F048:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F050: .4byte gCurTask
_0808F054: .4byte IWRAM_START + 0x40
_0808F058: .4byte IWRAM_START + 0x4D
_0808F05C: .4byte gPressedKeys
_0808F060: .4byte sub_808F0BC
_0808F064: .4byte sub_808F068

	thumb_func_start sub_808F068
sub_808F068: @ 0x0808F068
	push {lr}
	ldr r2, _0808F084 @ =gCurTask
	ldr r3, [r2]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _0808F088
	subs r0, #1
	str r0, [r1, #0x54]
	b _0808F090
	.align 2, 0
_0808F084: .4byte gCurTask
_0808F088:
	movs r0, #0x96
	str r0, [r1, #0x54]
	ldr r0, _0808F0B0 @ =sub_808EF38
	str r0, [r3, #8]
_0808F090:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F0AC
	ldr r0, _0808F0B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808F0AC
	ldr r1, [r2]
	ldr r0, _0808F0B8 @ =sub_808F0BC
	str r0, [r1, #8]
_0808F0AC:
	pop {r0}
	bx r0
	.align 2, 0
_0808F0B0: .4byte sub_808EF38
_0808F0B4: .4byte gPressedKeys
_0808F0B8: .4byte sub_808F0BC

	thumb_func_start sub_808F0BC
sub_808F0BC: @ 0x0808F0BC
	push {r4, r5, r6, lr}
	ldr r6, _0808F0FC @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	ldr r0, _0808F100 @ =IWRAM_START + 0x40
	adds r4, r5, r0
	movs r0, #1
	strh r0, [r4, #2]
	ldr r0, _0808F104 @ =gMPlayInfo_BGM
	movs r1, #0x18
	bl m4aMPlayFadeOutTemporarily
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F0F6
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, _0808F108 @ =IWRAM_START + 0x4C
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_808F14C
	ldr r0, [r6]
	bl TaskDestroy
_0808F0F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808F0FC: .4byte gCurTask
_0808F100: .4byte IWRAM_START + 0x40
_0808F104: .4byte gMPlayInfo_BGM
_0808F108: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_808F10C
sub_808F10C: @ 0x0808F10C
	push {r4, lr}
	ldr r4, _0808F13C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0808F140 @ =IWRAM_START + 0x4F
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, _0808F144 @ =IWRAM_START + 0x4C
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r3, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F13C: .4byte gCurTask
_0808F140: .4byte IWRAM_START + 0x4F
_0808F144: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_808F148
sub_808F148: @ 0x0808F148
	bx lr
	.align 2, 0

@; CreateCreditsEnd
	thumb_func_start sub_808F14C
sub_808F14C: @ 0x0808F14C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0
	mov sl, r0
	ldr r1, _0808F4BC @ =gDispCnt
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808F4C0 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0808F4C4 @ =0x0000160D
	strh r0, [r1]
	movs r0, #0xa9
	lsls r0, r0, #7
	strh r0, [r1, #2]
	ldr r0, _0808F4C8 @ =0x00001504
	strh r0, [r1, #4]
	mov r3, sl
	str r3, [sp, #4]
	ldr r2, _0808F4CC @ =0x040000D4
	add r7, sp, #4
	str r7, [r2]
	movs r6, #1
	lsls r0, r6, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _0808F4D0 @ =0x85001000
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0808F4D4 @ =gUnknown_03004D80
	movs r0, #0x5a
	strb r0, [r3, #2]
	ldr r0, _0808F4D8 @ =gUnknown_03002280
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	movs r1, #0xff
	strb r1, [r0, #0xa]
	movs r2, #0x20
	strb r2, [r0, #0xb]
	strb r4, [r3]
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	strb r4, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	ldr r0, _0808F4DC @ =sub_808FB2C
	movs r1, #0xc4
	lsls r1, r1, #1
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _0808F4E0 @ =sub_808FBE4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _0808F4E4 @ =IWRAM_START + 0x164
	adds r1, r2, r0
	movs r0, #0x87
	lsls r0, r0, #1
	str r0, [r1]
	ldr r1, _0808F4E8 @ =IWRAM_START + 0x15C
	adds r0, r2, r1
	strb r5, [r0]
	ldr r3, _0808F4EC @ =IWRAM_START + 0x15D
	adds r0, r2, r3
	strb r4, [r0]
	ldr r7, _0808F4F0 @ =IWRAM_START + 0x15E
	adds r0, r2, r7
	strb r4, [r0]
	adds r1, #3
	adds r0, r2, r1
	strb r4, [r0]
	adds r3, #0xb
	adds r1, r2, r3
	movs r0, #0x1e
	strh r0, [r1]
	adds r7, #2
	adds r3, r2, r7
	strb r4, [r3]
	ldr r1, _0808F4F4 @ =IWRAM_START + 0x161
	adds r0, r2, r1
	strb r4, [r0]
	adds r7, #2
	adds r1, r2, r7
	ldr r0, _0808F4F8 @ =0x0000FFFF
	strh r0, [r1]
	ldr r0, _0808F4FC @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	beq _0808F22E
	strb r6, [r3]
_0808F22E:
	movs r3, #0
	ldr r0, _0808F500 @ =IWRAM_START + 0x170
	adds r5, r2, r0
	ldr r1, _0808F504 @ =IWRAM_START + 0x178
	adds r4, r2, r1
	ldr r7, _0808F508 @ =IWRAM_START + 0x180
	adds r2, r2, r7
	mov r8, r3
	movs r0, #0xb4
	lsls r0, r0, #8
	mov sb, r0
	movs r6, #0xc8
	lsls r6, r6, #8
_0808F248:
	lsls r1, r3, #2
	adds r0, r5, r1
	mov r7, r8
	str r7, [r0]
	adds r0, r4, r1
	mov r7, sb
	str r7, [r0]
	adds r1, r2, r1
	str r6, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _0808F248
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, sl
	movs r7, #0
	movs r0, #1
	strh r0, [r1]
	strh r7, [r1, #4]
	movs r0, #2
	strh r0, [r1, #2]
	strh r7, [r1, #0xa]
	adds r0, #0xfe
	strh r0, [r1, #6]
	ldr r0, _0808F50C @ =0x00003FFF
	strh r0, [r1, #8]
	movs r6, #0xb6
	lsls r6, r6, #1
	add r6, sl
	ldr r0, _0808F510 @ =0x06010000
	str r0, [r6]
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #8]
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808F29A
	b _0808F448
_0808F29A:
	mov r4, sl
	adds r4, #0x40
	ldr r2, _0808F4BC @ =gDispCnt
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _0808F514 @ =gBgScrollRegs
	strh r7, [r3]
	strh r7, [r3, #2]
	ldr r0, _0808F518 @ =0x0600C000
	str r0, [r4, #4]
	strh r7, [r4, #0xa]
	ldr r1, _0808F51C @ =0x0600B000
	str r1, [r4, #0xc]
	strh r7, [r4, #0x18]
	strh r7, [r4, #0x1a]
	ldr r2, _0808F520 @ =gUnknown_080E12B0
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x1c]
	strh r7, [r4, #0x1e]
	strh r7, [r4, #0x20]
	strh r7, [r4, #0x22]
	strh r7, [r4, #0x24]
	movs r3, #0x1e
	strh r3, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	mov r1, sl
	adds r1, #0x6a
	str r1, [sp, #0xc]
	movs r2, #0
	strb r2, [r1]
	strh r7, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	mov r0, sl
	adds r0, #0xc0
	ldr r1, [r6]
	str r1, [r0, #4]
	ldr r5, _0808F524 @ =gUnknown_080E12D0
	ldr r2, [r5]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	str r1, [r6]
	ldrh r1, [r5, #4]
	strh r1, [r0, #0xa]
	ldrb r2, [r5, #6]
	mov r1, sl
	adds r1, #0xe0
	strb r2, [r1]
	mov r2, sl
	adds r2, #0xe1
	movs r1, #0xff
	strb r1, [r2]
	movs r3, #0x78
	strh r3, [r0, #0x16]
	ldr r1, _0808F528 @ =0x0000FFEC
	strh r1, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	mov r1, sl
	adds r1, #0xe2
	movs r2, #0x10
	mov r8, r2
	mov r3, r8
	strb r3, [r1]
	adds r1, #3
	movs r2, #0
	strb r2, [r1]
	str r7, [r0, #0x10]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r3
	str r3, [r0, #0x28]
	bl sub_8004558
	mov r0, sl
	adds r0, #0xf0
	ldr r1, [r6]
	str r1, [r0, #4]
	ldr r2, [r5, #8]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	str r1, [r6]
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0xa]
	ldrb r2, [r5, #0xe]
	movs r1, #0x88
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _0808F52C @ =0x00000111
	add r2, sl
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	movs r1, #0x78
	strh r1, [r0, #0x16]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x89
	lsls r1, r1, #1
	add r1, sl
	mov r3, r8
	strb r3, [r1]
	ldr r1, _0808F530 @ =0x00000115
	add r1, sl
	movs r2, #0
	strb r2, [r1]
	str r7, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r6]
	str r1, [r0, #4]
	ldr r2, [r5, #0x10]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	str r1, [r6]
	ldrh r1, [r5, #0x14]
	strh r1, [r0, #0xa]
	ldrb r2, [r5, #0x16]
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _0808F534 @ =0x00000141
	add r2, sl
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	movs r1, #0x78
	strh r1, [r0, #0x16]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0xa1
	lsls r1, r1, #1
	add r1, sl
	mov r3, r8
	strb r3, [r1]
	ldr r1, _0808F538 @ =0x00000145
	add r1, sl
	movs r2, #0
	strb r2, [r1]
	str r7, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	ldr r0, _0808F4BC @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r0, r1
	ldr r1, _0808F4BC @ =gDispCnt
	strh r0, [r1]
	ldr r2, _0808F514 @ =gBgScrollRegs
	strh r7, [r2]
	strh r7, [r2, #2]
	ldr r3, _0808F518 @ =0x0600C000
	str r3, [r4, #4]
	strh r7, [r4, #0xa]
	ldr r0, _0808F51C @ =0x0600B000
	str r0, [r4, #0xc]
	strh r7, [r4, #0x18]
	strh r7, [r4, #0x1a]
	ldr r0, _0808F53C @ =0x0000015F
	add r0, sl
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #1
	ldr r1, _0808F520 @ =gUnknown_080E12B0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x1c]
	strh r7, [r4, #0x1e]
	strh r7, [r4, #0x20]
	strh r7, [r4, #0x22]
	strh r7, [r4, #0x24]
	movs r2, #0x1e
	strh r2, [r4, #0x26]
	movs r3, #0x14
	strh r3, [r4, #0x28]
	movs r1, #0
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	strh r7, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	adds r0, r4, #0
	bl sub_8003638
_0808F448:
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	cmp r0, #1
	bne _0808F4AC
	ldr r2, _0808F4BC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808F514 @ =gBgScrollRegs
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, sl
	str r0, [r1, #4]
	strh r7, [r1, #0xa]
	ldr r0, _0808F540 @ =0x0600A000
	str r0, [r1, #0xc]
	strh r7, [r1, #0x18]
	strh r7, [r1, #0x1a]
	ldr r1, _0808F520 @ =gUnknown_080E12B0
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r2, sl
	strh r0, [r2, #0x1c]
	strh r7, [r2, #0x1e]
	strh r7, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r7, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	mov r0, sl
	adds r0, #0x2a
	movs r3, #0
	strb r3, [r0]
	movs r0, #5
	strh r0, [r2, #0x2e]
	mov r0, sl
	bl sub_8002A3C
_0808F4AC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F4BC: .4byte gDispCnt
_0808F4C0: .4byte gBgCntRegs
_0808F4C4: .4byte 0x0000160D
_0808F4C8: .4byte 0x00001504
_0808F4CC: .4byte 0x040000D4
_0808F4D0: .4byte 0x85001000
_0808F4D4: .4byte gUnknown_03004D80
_0808F4D8: .4byte gUnknown_03002280
_0808F4DC: .4byte sub_808FB2C
_0808F4E0: .4byte sub_808FBE4
_0808F4E4: .4byte IWRAM_START + 0x164
_0808F4E8: .4byte IWRAM_START + 0x15C
_0808F4EC: .4byte IWRAM_START + 0x15D
_0808F4F0: .4byte IWRAM_START + 0x15E
_0808F4F4: .4byte IWRAM_START + 0x161
_0808F4F8: .4byte 0x0000FFFF
_0808F4FC: .4byte gLoadedSaveGame
_0808F500: .4byte IWRAM_START + 0x170
_0808F504: .4byte IWRAM_START + 0x178
_0808F508: .4byte IWRAM_START + 0x180
_0808F50C: .4byte 0x00003FFF
_0808F510: .4byte 0x06010000
_0808F514: .4byte gBgScrollRegs
_0808F518: .4byte 0x0600C000
_0808F51C: .4byte 0x0600B000
_0808F520: .4byte gUnknown_080E12B0
_0808F524: .4byte gUnknown_080E12D0
_0808F528: .4byte 0x0000FFEC
_0808F52C: .4byte 0x00000111
_0808F530: .4byte 0x00000115
_0808F534: .4byte 0x00000141
_0808F538: .4byte 0x00000145
_0808F53C: .4byte 0x0000015F
_0808F540: .4byte 0x0600A000

	thumb_func_start sub_808F544
sub_808F544: @ 0x0808F544
	push {r4, r5, r6, r7, lr}
	ldr r7, _0808F5A0 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0808F5A4 @ =IWRAM_START + 0x150
	adds r6, r5, r0
	movs r0, #1
	strh r0, [r6, #2]
	ldr r1, _0808F5A8 @ =IWRAM_START + 0x15C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808F576
	adds r0, r4, #0
	bl sub_808FBE8
	adds r0, r4, #0
	bl sub_808FC00
	adds r0, r4, #0
	bl sub_808FC3C
_0808F576:
	adds r0, r4, #0
	bl sub_808FA24
	adds r0, r6, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F5BA
	movs r0, #0
	strh r0, [r6, #4]
	ldr r1, _0808F5AC @ =IWRAM_START + 0x15D
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808F5B4
	ldr r1, [r7]
	ldr r0, _0808F5B0 @ =sub_808F5C4
	b _0808F5B8
	.align 2, 0
_0808F5A0: .4byte gCurTask
_0808F5A4: .4byte IWRAM_START + 0x150
_0808F5A8: .4byte IWRAM_START + 0x15C
_0808F5AC: .4byte IWRAM_START + 0x15D
_0808F5B0: .4byte sub_808F5C4
_0808F5B4:
	ldr r1, [r7]
	ldr r0, _0808F5C0 @ =sub_808FB94
_0808F5B8:
	str r0, [r1, #8]
_0808F5BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F5C0: .4byte sub_808FB94

	thumb_func_start sub_808F5C4
sub_808F5C4: @ 0x0808F5C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0808F5E8 @ =gCurTask
	ldr r0, [r1]
	ldrh r6, [r0, #6]
	ldr r2, _0808F5EC @ =IWRAM_START + 0x164
	adds r2, r2, r6
	mov sl, r2
	ldr r7, [r2]
	cmp r7, #0
	beq _0808F5F0
	subs r0, r7, #1
	str r0, [r2]
	b _0808F6B0
	.align 2, 0
_0808F5E8: .4byte gCurTask
_0808F5EC: .4byte IWRAM_START + 0x164
_0808F5F0:
	ldr r3, _0808F6C0 @ =IWRAM_START + 0x40
	adds r0, r6, r3
	ldr r5, _0808F6C4 @ =gDispCnt
	ldrh r2, [r5]
	ldr r1, _0808F6C8 @ =0x0000FDFF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5]
	ldr r4, _0808F6CC @ =gBgScrollRegs
	strh r7, [r4]
	strh r7, [r4, #2]
	ldr r1, _0808F6D0 @ =0x0600C000
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _0808F6D4 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	ldr r1, _0808F6D8 @ =gUnknown_080E12B0
	mov r8, r1
	ldrh r1, [r1, #0x1a]
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	movs r2, #0x1e
	mov sb, r2
	mov r3, sb
	strh r3, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r2, _0808F6DC @ =IWRAM_START + 0x6A
	adds r1, r6, r2
	movs r3, #0
	strb r3, [r1]
	strh r7, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0808F6E0 @ =IWRAM_START + 0x80
	adds r0, r6, r1
	ldrh r1, [r5]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5]
	strh r7, [r4, #8]
	ldr r1, _0808F6E4 @ =0x0000D190
	strh r1, [r4, #0xa]
	ldr r1, _0808F6E8 @ =0x06004000
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _0808F6EC @ =0x0600A800
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	mov r2, r8
	ldrh r1, [r2, #0x1c]
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	mov r3, sb
	strh r3, [r0, #0x26]
	movs r1, #3
	strh r1, [r0, #0x28]
	ldr r2, _0808F6F0 @ =IWRAM_START + 0xAA
	adds r1, r6, r2
	movs r3, #0
	strb r3, [r1]
	movs r4, #2
	movs r1, #2
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0808F6F4 @ =IWRAM_START + 0x15D
	adds r0, r6, r1
	strb r4, [r0]
	ldr r2, _0808F6F8 @ =IWRAM_START + 0x15F
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x87
	lsls r0, r0, #1
	mov r3, sl
	str r0, [r3]
	ldr r0, _0808F6FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F700 @ =sub_808FB2C
	str r0, [r1, #8]
_0808F6B0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F6C0: .4byte IWRAM_START + 0x40
_0808F6C4: .4byte gDispCnt
_0808F6C8: .4byte 0x0000FDFF
_0808F6CC: .4byte gBgScrollRegs
_0808F6D0: .4byte 0x0600C000
_0808F6D4: .4byte 0x0600B000
_0808F6D8: .4byte gUnknown_080E12B0
_0808F6DC: .4byte IWRAM_START + 0x6A
_0808F6E0: .4byte IWRAM_START + 0x80
_0808F6E4: .4byte 0x0000D190
_0808F6E8: .4byte 0x06004000
_0808F6EC: .4byte 0x0600A800
_0808F6F0: .4byte IWRAM_START + 0xAA
_0808F6F4: .4byte IWRAM_START + 0x15D
_0808F6F8: .4byte IWRAM_START + 0x15F
_0808F6FC: .4byte gCurTask
_0808F700: .4byte sub_808FB2C

	thumb_func_start sub_808F704
sub_808F704: @ 0x0808F704
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808F750 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r1, _0808F754 @ =IWRAM_START + 0x15C
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808F7B0
	mov r0, r8
	bl sub_808FBE8
	mov r0, r8
	bl sub_808FC00
	mov r0, r8
	bl sub_808FC3C
	ldr r0, _0808F758 @ =IWRAM_START + 0x15F
	adds r6, r4, r0
	ldrb r0, [r6]
	cmp r0, #0xa
	bhi _0808F7B0
	ldr r1, _0808F75C @ =IWRAM_START + 0x15E
	adds r7, r4, r1
	ldrb r0, [r7]
	adds r5, r0, #0
	cmp r5, #0
	beq _0808F760
	subs r0, #1
	strb r0, [r7]
	b _0808F7B0
	.align 2, 0
_0808F750: .4byte gCurTask
_0808F754: .4byte IWRAM_START + 0x15C
_0808F758: .4byte IWRAM_START + 0x15F
_0808F75C: .4byte IWRAM_START + 0x15E
_0808F760:
	ldr r1, _0808F7C8 @ =IWRAM_START + 0x40
	adds r0, r4, r1
	ldr r3, _0808F7CC @ =gDispCnt
	ldrh r1, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	ldr r1, _0808F7D0 @ =gBgScrollRegs
	strh r5, [r1]
	strh r5, [r1, #2]
	ldr r2, _0808F7D4 @ =gUnknown_080E12B0
	ldrb r1, [r6]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	strh r5, [r0, #0x2e]
	bl sub_8002A3C
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r1, _0808F7D8 @ =gUnknown_080E12F0
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r0, [r6]
	cmp r0, #9
	bne _0808F7B0
	movs r0, #0xd4
	bl m4aSongNumStart
_0808F7B0:
	mov r0, r8
	bl sub_808FA24
	movs r1, #0xb2
	lsls r1, r1, #1
	add r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _0808F7DC
	subs r0, #1
	str r0, [r1]
	b _0808F810
	.align 2, 0
_0808F7C8: .4byte IWRAM_START + 0x40
_0808F7CC: .4byte gDispCnt
_0808F7D0: .4byte gBgScrollRegs
_0808F7D4: .4byte gUnknown_080E12B0
_0808F7D8: .4byte gUnknown_080E12F0
_0808F7DC:
	ldr r2, _0808F7F8 @ =0x0000015D
	add r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _0808F804
	movs r0, #1
	strb r0, [r2]
	movs r0, #0x1e
	str r0, [r1]
	ldr r0, _0808F7FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F800 @ =sub_808F544
	b _0808F80E
	.align 2, 0
_0808F7F8: .4byte 0x0000015D
_0808F7FC: .4byte gCurTask
_0808F800: .4byte sub_808F544
_0808F804:
	cmp r0, #2
	bne _0808F810
	ldr r0, _0808F81C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F820 @ =sub_808F824
_0808F80E:
	str r0, [r1, #8]
_0808F810:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F81C: .4byte gCurTask
_0808F820: .4byte sub_808F824

	thumb_func_start sub_808F824
sub_808F824: @ 0x0808F824
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	ldr r0, _0808F930 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	mov r0, sp
	strh r7, [r0]
	ldr r1, _0808F934 @ =IWRAM_START + 0x15C
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, #1
	beq _0808F848
	b _0808F9D0
_0808F848:
	ldr r4, _0808F938 @ =gLoadedSaveGame
	ldr r1, [r4]
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	bne _0808F858
	strb r2, [r1, #0x19]
	bl WriteSaveGame
_0808F858:
	movs r1, #0
	adds r2, r4, #0
	ldr r0, [r2]
	adds r3, r0, #7
	movs r4, #1
_0808F862:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0x1c
	bls _0808F874
	adds r0, r4, #0
	lsls r0, r1
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_0808F874:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0808F862
	cmp r5, #0xe
	bls _0808F89E
	ldr r2, [r2]
	ldrb r1, [r2, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808F89E
	ldrb r1, [r2, #0x1a]
	cmp r1, #0
	bne _0808F89E
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #0x1a]
	bl WriteSaveGame
_0808F89E:
	ldr r1, _0808F93C @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	bne _0808F8AA
	b _0808F9BC
_0808F8AA:
	ldr r2, _0808F938 @ =gLoadedSaveGame
	ldr r3, [r2]
	adds r4, r0, #0
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0808F99C
	adds r0, r3, #0
	adds r0, #0x15
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	movs r1, #0
	ldr r0, [r2]
	adds r3, r0, #0
	adds r3, #0x15
_0808F8D6:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F8E4
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0808F8E4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0808F8D6
	cmp r7, #1
	bne _0808F8FA
	ldr r0, [r2]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _0808F91E
_0808F8FA:
	cmp r7, #2
	bne _0808F906
	ldr r0, [r2]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _0808F91E
_0808F906:
	cmp r7, #3
	bne _0808F912
	ldr r0, [r2]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	bne _0808F91E
_0808F912:
	cmp r7, #3
	bls _0808F944
	ldr r0, [r2]
	ldrb r0, [r0, #0x13]
	cmp r0, #0xf
	bls _0808F944
_0808F91E:
	ldr r2, _0808F940 @ =0x00000161
	adds r1, r6, r2
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xb2
	lsls r0, r0, #1
	adds r1, r6, r0
	b _0808F9EE
	.align 2, 0
_0808F930: .4byte gCurTask
_0808F934: .4byte IWRAM_START + 0x15C
_0808F938: .4byte gLoadedSaveGame
_0808F93C: .4byte gSelectedCharacter
_0808F940: .4byte 0x00000161
_0808F944:
	cmp r7, #1
	bne _0808F94E
	ldr r0, [r2]
	strb r7, [r0, #0x14]
	b _0808F974
_0808F94E:
	cmp r7, #2
	bne _0808F95A
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #0x11]
	b _0808F974
_0808F95A:
	cmp r7, #3
	bne _0808F966
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #0x12]
	b _0808F974
_0808F966:
	cmp r7, #4
	bne _0808F974
	ldr r2, [r2]
	ldrb r1, [r2, #0x13]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2, #0x13]
_0808F974:
	bl WriteSaveGame
	ldr r2, _0808F994 @ =0x00000161
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xb2
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #0x69
	str r0, [r1]
	subs r2, #9
	adds r1, r6, r2
	ldr r0, _0808F998 @ =0x00003FFF
	strh r0, [r1]
	b _0808F9F2
	.align 2, 0
_0808F994: .4byte 0x00000161
_0808F998: .4byte 0x00003FFF
_0808F99C:
	ldr r2, _0808F9B4 @ =0x00000161
	adds r1, r6, r2
	strb r0, [r1]
	movs r0, #0xac
	lsls r0, r0, #1
	adds r1, r6, r0
	ldr r0, _0808F9B8 @ =0x00003FFF
	strh r0, [r1]
	adds r2, #3
	adds r1, r6, r2
	movs r0, #0x69
	b _0808F9F0
	.align 2, 0
_0808F9B4: .4byte 0x00000161
_0808F9B8: .4byte 0x00003FFF
_0808F9BC:
	ldr r0, _0808F9CC @ =0x00000161
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	movs r2, #0xb2
	lsls r2, r2, #1
	adds r1, r6, r2
	b _0808F9EE
	.align 2, 0
_0808F9CC: .4byte 0x00000161
_0808F9D0:
	ldr r0, _0808FA0C @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	bne _0808F9E2
	movs r0, #1
	strb r0, [r1, #0x1b]
	bl WriteSaveGame
_0808F9E2:
	ldr r0, _0808FA10 @ =IWRAM_START + 0x161
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0808FA14 @ =IWRAM_START + 0x164
	adds r1, r4, r2
_0808F9EE:
	movs r0, #0xb4
_0808F9F0:
	str r0, [r1]
_0808F9F2:
	ldr r0, _0808FA18 @ =0x0000015D
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0808FA1C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808FA20 @ =sub_808F544
	str r0, [r1, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA0C: .4byte gLoadedSaveGame
_0808FA10: .4byte IWRAM_START + 0x161
_0808FA14: .4byte IWRAM_START + 0x164
_0808FA18: .4byte 0x0000015D
_0808FA1C: .4byte gCurTask
_0808FA20: .4byte sub_808F544

	thumb_func_start sub_808FA24
sub_808FA24: @ 0x0808FA24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808FB1E
	ldr r2, _0808FA88 @ =0x0000015F
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _0808FB1E
	movs r0, #0xb4
	lsls r0, r0, #1
	adds r4, r6, r0
	ldrh r1, [r4]
	movs r0, #0
	ldrsh r2, [r4, r0]
	cmp r2, #0
	ble _0808FA90
	adds r5, r6, #0
	adds r5, #0xc0
	ldr r1, _0808FA8C @ =gUnknown_080E12D0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0xe0
	strb r1, [r0]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r5, #0x16]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r4]
	subs r0, #1
	b _0808FAAA
	.align 2, 0
_0808FA88: .4byte 0x0000015F
_0808FA8C: .4byte gUnknown_080E12D0
_0808FA90:
	adds r0, r1, #0
	adds r0, #0xe
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bhi _0808FAA0
	subs r0, r1, #1
	b _0808FAAA
_0808FAA0:
	movs r0, #0xf
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _0808FAAC
	movs r0, #0x1e
_0808FAAA:
	strh r0, [r4]
_0808FAAC:
	ldr r1, _0808FB24 @ =0x0000015F
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _0808FB1E
	adds r5, r6, #0
	adds r5, #0xf0
	ldr r4, _0808FB28 @ =gUnknown_080E12D0
	ldrh r0, [r4, #0xc]
	strh r0, [r5, #0xa]
	ldrb r1, [r4, #0xe]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r5, #0x16]
	adds r2, #0x6c
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x90
	lsls r0, r0, #1
	adds r5, r6, r0
	ldrh r0, [r4, #0x14]
	strh r0, [r5, #0xa]
	ldrb r1, [r4, #0x16]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r5, #0x16]
	adds r2, #0x44
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0808FB1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808FB24: .4byte 0x0000015F
_0808FB28: .4byte gUnknown_080E12D0

	thumb_func_start sub_808FB2C
sub_808FB2C: @ 0x0808FB2C
	push {r4, r5, r6, lr}
	ldr r6, _0808FB84 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0808FB88 @ =IWRAM_START + 0x150
	adds r5, r1, r0
	movs r0, #2
	strh r0, [r5, #2]
	ldr r0, _0808FB8C @ =IWRAM_START + 0x15C
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808FB5E
	adds r0, r4, #0
	bl sub_808FBE8
	adds r0, r4, #0
	bl sub_808FC00
	adds r0, r4, #0
	bl sub_808FC3C
_0808FB5E:
	adds r0, r4, #0
	bl sub_808FA24
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808FB7C
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _0808FB90 @ =sub_808F704
	str r0, [r1, #8]
_0808FB7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808FB84: .4byte gCurTask
_0808FB88: .4byte IWRAM_START + 0x150
_0808FB8C: .4byte IWRAM_START + 0x15C
_0808FB90: .4byte sub_808F704

	thumb_func_start sub_808FB94
sub_808FB94: @ 0x0808FB94
	push {r4, lr}
	ldr r4, _0808FBAC @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0808FBB0 @ =IWRAM_START + 0x164
	adds r2, r1, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808FBB4
	subs r0, #1
	str r0, [r2]
	b _0808FBDE
	.align 2, 0
_0808FBAC: .4byte gCurTask
_0808FBB0: .4byte IWRAM_START + 0x164
_0808FBB4:
	ldr r2, _0808FBCC @ =IWRAM_START + 0x161
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808FBD0
	bl sub_8094118
	ldr r0, [r4]
	bl TaskDestroy
	b _0808FBDE
	.align 2, 0
_0808FBCC: .4byte IWRAM_START + 0x161
_0808FBD0:
	cmp r0, #1
	bne _0808FBDE
	bl CreateTitleScreen
	ldr r0, [r4]
	bl TaskDestroy
_0808FBDE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808FBE4
sub_808FBE4: @ 0x0808FBE4
	bx lr
	.align 2, 0

	thumb_func_start sub_808FBE8
sub_808FBE8: @ 0x0808FBE8
	adds r2, r0, #0
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x78
	str r0, [r1]
	adds r0, #0xfc
	adds r1, r2, r0
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [r1]
	bx lr

	thumb_func_start sub_808FC00
sub_808FC00: @ 0x0808FC00
	push {lr}
	adds r2, r0, #0
	ldr r1, _0808FC34 @ =0x0000015F
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _0808FC2E
	movs r3, #0xbc
	lsls r3, r3, #1
	adds r0, r2, r3
	movs r1, #0x78
	str r1, [r0]
	movs r0, #0xbe
	lsls r0, r0, #1
	adds r2, r2, r0
	ldr r1, [r2]
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r1, r0
	ble _0808FC2E
	ldr r3, _0808FC38 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0808FC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0808FC34: .4byte 0x0000015F
_0808FC38: .4byte 0xFFFFFD00

	thumb_func_start sub_808FC3C
sub_808FC3C: @ 0x0808FC3C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0808FC70 @ =0x0000015F
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _0808FC6A
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r2, r3
	movs r1, #0x78
	str r1, [r0]
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r2, r2, r0
	ldr r1, [r2]
	movs r0, #0x94
	lsls r0, r0, #8
	cmp r1, r0
	ble _0808FC6A
	ldr r3, _0808FC74 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0808FC6A:
	pop {r0}
	bx r0
	.align 2, 0
_0808FC70: .4byte 0x0000015F
_0808FC74: .4byte 0xFFFFFD00

@; CreateExtraEndingCutScene
	thumb_func_start sub_808FC78
sub_808FC78: @ 0x0808FC78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldr r1, _0808FE70 @ =0x0000FFFF
	bl SeedRng
	ldr r1, _0808FE74 @ =gDispCnt
	movs r2, #0x8a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808FE78 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0808FE7C @ =0x00009C03
	strh r0, [r1]
	ldr r0, _0808FE80 @ =gBgScrollRegs
	mov r3, r8
	strh r3, [r0]
	strh r3, [r0, #2]
	ldr r0, _0808FE84 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _0808FE88 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x40
	strb r0, [r1, #3]
	bl m4aMPlayAllStop
	movs r0, #0x2b
	bl m4aSongNumStart
	ldr r0, _0808FE8C @ =sub_8090480
	ldr r1, _0808FE90 @ =0x000005CC
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _0808FE94 @ =sub_8091480
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0808FE98 @ =IWRAM_START + 0x37C
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _0808FE9C @ =gUnknown_080E1514
	ldrh r2, [r1]
	ldr r3, _0808FEA0 @ =IWRAM_START + 0x390
	adds r1, r0, r3
	strh r2, [r1]
	ldr r2, _0808FEA4 @ =IWRAM_START + 0x398
	adds r1, r0, r2
	str r5, [r1]
	adds r3, #0xc
	adds r1, r0, r3
	str r5, [r1]
	ldr r1, _0808FEA8 @ =gUnknown_080E1530
	ldrh r2, [r1]
	subs r3, #0x1f
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0808FEAC @ =gUnknown_080E154A
	ldrb r2, [r1]
	adds r3, #2
	adds r1, r0, r3
	strb r2, [r1]
	ldr r2, _0808FEB0 @ =IWRAM_START + 0x37E
	adds r1, r0, r2
	strb r4, [r1]
	adds r3, #1
	adds r2, r0, r3
	movs r1, #5
	strb r1, [r2]
	ldr r1, _0808FEB4 @ =IWRAM_START + 0x38E
	adds r2, r0, r1
	movs r1, #3
	strh r1, [r2]
	adds r3, #0x12
	adds r2, r0, r3
	movs r1, #0xa0
	strh r1, [r2]
	ldr r2, _0808FEB8 @ =IWRAM_START + 0x394
	adds r1, r0, r2
	strh r5, [r1]
	adds r3, #4
	adds r1, r0, r3
	strh r5, [r1]
	movs r4, #0
	ldr r1, _0808FEBC @ =IWRAM_START + 0x40
	adds r1, r1, r0
	mov sb, r1
	ldr r2, _0808FEC0 @ =IWRAM_START + 0x60
	adds r2, r0, r2
	str r2, [sp, #0x70]
	ldr r3, _0808FEC4 @ =IWRAM_START + 0x61
	adds r3, r0, r3
	str r3, [sp, #0x74]
	ldr r1, _0808FEC8 @ =IWRAM_START + 0x62
	adds r1, r0, r1
	str r1, [sp, #0x78]
	ldr r2, _0808FECC @ =IWRAM_START + 0x65
	adds r2, r0, r2
	str r2, [sp, #0x7c]
	ldr r3, _0808FED0 @ =IWRAM_START + 0x70
	adds r3, r3, r0
	mov sl, r3
	ldr r1, _0808FED4 @ =IWRAM_START + 0x90
	adds r1, r0, r1
	str r1, [sp, #8]
	ldr r2, _0808FED8 @ =IWRAM_START + 0x91
	adds r2, r0, r2
	str r2, [sp, #0xc]
	ldr r3, _0808FEDC @ =IWRAM_START + 0x92
	adds r3, r0, r3
	str r3, [sp, #0x10]
	ldr r1, _0808FEE0 @ =IWRAM_START + 0x95
	adds r1, r0, r1
	str r1, [sp, #0x14]
	ldr r2, _0808FEE4 @ =IWRAM_START + 0xA0
	adds r2, r0, r2
	str r2, [sp, #0x28]
	ldr r3, _0808FEE8 @ =IWRAM_START + 0xC0
	adds r3, r0, r3
	str r3, [sp, #0x3c]
	ldr r1, _0808FEEC @ =IWRAM_START + 0xC1
	adds r1, r0, r1
	str r1, [sp, #0x40]
	ldr r2, _0808FEF0 @ =IWRAM_START + 0xC2
	adds r2, r0, r2
	str r2, [sp, #0x44]
	ldr r3, _0808FEF4 @ =IWRAM_START + 0xC5
	adds r3, r0, r3
	str r3, [sp, #0x48]
	ldr r1, _0808FEF8 @ =IWRAM_START + 0x210
	adds r1, r0, r1
	str r1, [sp, #0x2c]
_0808FD9E:
	movs r5, #0
	lsls r3, r4, #2
	ldr r2, _0808FEFC @ =0x00000211
	add r2, r8
	str r2, [sp, #0x30]
	ldr r0, _0808FF00 @ =0x00000212
	add r0, r8
	str r0, [sp, #0x34]
	ldr r1, _0808FF04 @ =0x00000215
	add r1, r8
	str r1, [sp, #0x38]
	movs r2, #0x90
	lsls r2, r2, #2
	add r2, r8
	str r2, [sp, #0x4c]
	ldr r0, _0808FF08 @ =0x00000241
	add r0, r8
	str r0, [sp, #0x50]
	ldr r1, _0808FF0C @ =0x00000242
	add r1, r8
	str r1, [sp, #0x54]
	ldr r2, _0808FF10 @ =0x00000245
	add r2, r8
	str r2, [sp, #0x58]
	movs r0, #0xd8
	lsls r0, r0, #2
	add r0, r8
	str r0, [sp, #0x18]
	ldr r1, _0808FF14 @ =0x00000361
	add r1, r8
	str r1, [sp, #0x1c]
	ldr r2, _0808FF18 @ =0x00000362
	add r2, r8
	str r2, [sp, #0x20]
	ldr r0, _0808FF1C @ =0x00000365
	add r0, r8
	str r0, [sp, #0x24]
	movs r1, #0x9c
	lsls r1, r1, #2
	add r1, r8
	str r1, [sp, #0x5c]
	ldr r2, _0808FF20 @ =0x00000271
	add r2, r8
	str r2, [sp, #0x60]
	ldr r0, _0808FF24 @ =0x00000272
	add r0, r8
	str r0, [sp, #0x64]
	ldr r1, _0808FF28 @ =0x00000275
	add r1, r8
	str r1, [sp, #0x68]
	mov r2, r8
	adds r2, #0x2a
	str r2, [sp, #0x6c]
	adds r2, r3, #0
	movs r1, #0xe8
	lsls r1, r1, #2
	add r1, r8
	movs r6, #0
_0808FE12:
	lsls r0, r5, #3
	adds r0, r2, r0
	adds r0, r1, r0
	str r6, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0808FE12
	movs r0, #0xf8
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r3
	movs r1, #0
	str r1, [r0]
	movs r0, #0x8e
	lsls r0, r0, #3
	add r0, r8
	adds r0, r0, r3
	str r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0808FD9E
	movs r4, #0
	ldr r3, _0808FF2C @ =0x0000047C
	add r3, r8
	ldr r6, _0808FF30 @ =gUnknown_080E1484
_0808FE4C:
	movs r5, #0
	lsls r2, r4, #2
_0808FE50:
	cmp r4, #1
	bhi _0808FF34
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r3, r0
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r2, r1
	adds r1, r1, r6
	ldr r1, [r1]
	lsls r1, r1, #8
	b _0808FF5C
	.align 2, 0
_0808FE70: .4byte 0x0000FFFF
_0808FE74: .4byte gDispCnt
_0808FE78: .4byte gBgCntRegs
_0808FE7C: .4byte 0x00009C03
_0808FE80: .4byte gBgScrollRegs
_0808FE84: .4byte gUnknown_03004D80
_0808FE88: .4byte gUnknown_03002280
_0808FE8C: .4byte sub_8090480
_0808FE90: .4byte 0x000005CC
_0808FE94: .4byte sub_8091480
_0808FE98: .4byte IWRAM_START + 0x37C
_0808FE9C: .4byte gUnknown_080E1514
_0808FEA0: .4byte IWRAM_START + 0x390
_0808FEA4: .4byte IWRAM_START + 0x398
_0808FEA8: .4byte gUnknown_080E1530
_0808FEAC: .4byte gUnknown_080E154A
_0808FEB0: .4byte IWRAM_START + 0x37E
_0808FEB4: .4byte IWRAM_START + 0x38E
_0808FEB8: .4byte IWRAM_START + 0x394
_0808FEBC: .4byte IWRAM_START + 0x40
_0808FEC0: .4byte IWRAM_START + 0x60
_0808FEC4: .4byte IWRAM_START + 0x61
_0808FEC8: .4byte IWRAM_START + 0x62
_0808FECC: .4byte IWRAM_START + 0x65
_0808FED0: .4byte IWRAM_START + 0x70
_0808FED4: .4byte IWRAM_START + 0x90
_0808FED8: .4byte IWRAM_START + 0x91
_0808FEDC: .4byte IWRAM_START + 0x92
_0808FEE0: .4byte IWRAM_START + 0x95
_0808FEE4: .4byte IWRAM_START + 0xA0
_0808FEE8: .4byte IWRAM_START + 0xC0
_0808FEEC: .4byte IWRAM_START + 0xC1
_0808FEF0: .4byte IWRAM_START + 0xC2
_0808FEF4: .4byte IWRAM_START + 0xC5
_0808FEF8: .4byte IWRAM_START + 0x210
_0808FEFC: .4byte 0x00000211
_0808FF00: .4byte 0x00000212
_0808FF04: .4byte 0x00000215
_0808FF08: .4byte 0x00000241
_0808FF0C: .4byte 0x00000242
_0808FF10: .4byte 0x00000245
_0808FF14: .4byte 0x00000361
_0808FF18: .4byte 0x00000362
_0808FF1C: .4byte 0x00000365
_0808FF20: .4byte 0x00000271
_0808FF24: .4byte 0x00000272
_0808FF28: .4byte 0x00000275
_0808FF2C: .4byte 0x0000047C
_0808FF30: .4byte gUnknown_080E1484
_0808FF34:
	cmp r4, #2
	bne _0808FF50
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, #8
	adds r0, r3, r0
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, #8
	adds r1, r1, r6
	ldr r1, [r1]
	b _0808FF5C
_0808FF50:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r3, r0
	movs r1, #0
_0808FF5C:
	str r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bhi _0808FF6A
	b _0808FE50
_0808FF6A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0808FF76
	b _0808FE4C
_0808FF76:
	movs r4, #0
	ldr r7, _080900FC @ =0x000004F4
	add r7, r8
	ldr r3, _08090100 @ =gUnknown_080E13AC
	mov ip, r3
_0808FF80:
	movs r5, #0
	lsls r3, r4, #2
	adds r2, r4, #1
	adds r4, r3, #0
_0808FF88:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r7, r0
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xb
	bls _0808FF88
	movs r5, #0
	adds r4, r3, #0
	ldr r3, _08090104 @ =0x00000584
	add r3, r8
	ldr r6, _08090108 @ =gUnknown_080E143C
_0808FFAE:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r3, r0
	adds r0, r0, r6
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0808FFAE
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0808FF80
	movs r5, #0
	lsls r3, r4, #2
	adds r4, r3, #0
	ldr r2, _080900FC @ =0x000004F4
	add r2, r8
	ldr r6, _08090100 @ =gUnknown_080E13AC
_0808FFDE:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r2, r0
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xb
	bls _0808FFDE
	movs r5, #0
	ldr r2, _08090104 @ =0x00000584
	add r2, r8
	ldr r4, _08090108 @ =gUnknown_080E143C
_08090000:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r1, r2, r0
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08090000
	movs r5, #0
	ldr r3, _0809010C @ =0x00000381
	add r3, r8
	movs r1, #0
	ldr r2, _08090110 @ =0x00000387
	add r2, r8
_08090026:
	adds r0, r3, r5
	strb r1, [r0]
	adds r0, r2, r5
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08090026
	movs r5, #0
_0809003A:
	bl Random
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	movs r2, #0xfa
	lsls r2, r2, #2
	add r2, r8
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
	movs r0, #0xfb
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r4
	movs r6, #0
	str r6, [r0]
	bl Random
	movs r2, #0xfc
	lsls r2, r2, #2
	add r2, r8
	adds r2, r2, r4
	movs r1, #3
	ands r1, r0
	adds r1, #0xb
	movs r3, #1
	adds r0, r3, #0
	lsls r0, r1
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _0809003A
	movs r1, #0x8f
	lsls r1, r1, #3
	add r1, r8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
	movs r5, #0xdc
	lsls r5, r5, #2
	add r5, r8
	strh r3, [r5]
	strh r6, [r5, #4]
	movs r0, #0x80
	strh r0, [r5, #6]
	ldr r0, _08090114 @ =0x00003FBF
	strh r0, [r5, #8]
	strh r6, [r5, #0xa]
	movs r1, #0xe6
	lsls r1, r1, #2
	add r1, r8
	ldr r0, _08090118 @ =0x06010000
	str r0, [r1]
	movs r4, #0
	movs r6, #0xe6
	lsls r6, r6, #2
	add r6, r8
	movs r5, #0
_080900B6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r6]
	str r0, [r2, #4]
	ldr r0, [r6]
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r6]
	ldr r1, _0809011C @ =gUnknown_080E12FC
	adds r0, r4, #3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r2, #0x16]
	strh r5, [r2, #0x18]
	cmp r4, #1
	bhi _08090120
	adds r0, r4, #1
	b _08090124
	.align 2, 0
_080900FC: .4byte 0x000004F4
_08090100: .4byte gUnknown_080E13AC
_08090104: .4byte 0x00000584
_08090108: .4byte gUnknown_080E143C
_0809010C: .4byte 0x00000381
_08090110: .4byte 0x00000387
_08090114: .4byte 0x00003FBF
_08090118: .4byte 0x06010000
_0809011C: .4byte gUnknown_080E12FC
_08090120:
	adds r0, r4, #0
	adds r0, #0xa
_08090124:
	lsls r0, r0, #6
	strh r0, [r2, #0x1a]
	str r5, [r2, #0x10]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	adds r0, r2, #0
	adds r0, #0x22
	movs r3, #0x10
	strb r3, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080900B6
	movs r5, #0xe6
	lsls r5, r5, #2
	add r5, r8
	ldr r0, [r5]
	mov r1, sb
	str r0, [r1, #4]
	ldr r0, [r5]
	movs r2, #0xa8
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r5]
	ldr r7, _08090478 @ =gUnknown_080E12FC
	ldrh r0, [r7, #4]
	movs r6, #0
	movs r4, #0
	strh r0, [r1, #0xa]
	ldrb r0, [r7, #6]
	ldr r3, [sp, #0x70]
	strb r0, [r3]
	movs r0, #0xff
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	mov r2, sb
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	adds r0, #1
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	movs r0, #0x10
	ldr r3, [sp, #0x78]
	strb r0, [r3]
	ldr r1, [sp, #0x7c]
	strb r6, [r1]
	str r4, [r2, #0x10]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r2, #0x28]
	mov r0, sb
	bl sub_8004558
	ldr r0, [r5]
	mov r1, sl
	str r0, [r1, #4]
	ldr r1, [r7, #0x38]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	ldrh r0, [r7, #0x3c]
	mov r2, sl
	strh r0, [r2, #0xa]
	adds r0, r7, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	ldr r3, [sp, #8]
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	movs r3, #0x10
	ldr r2, [sp, #0x10]
	strb r3, [r2]
	ldr r0, [sp, #0x14]
	strb r6, [r0]
	mov r1, sl
	str r4, [r1, #0x10]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	mov r0, sl
	bl sub_8004558
	ldr r0, [r5]
	ldr r3, [sp, #0x28]
	str r0, [r3, #4]
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r5]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #0x40]
	strb r0, [r3]
	ldr r0, [sp, #0x28]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r0, #0x90
	lsls r0, r0, #2
	ldr r1, [sp, #0x28]
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	movs r3, #0x10
	ldr r2, [sp, #0x44]
	strb r3, [r2]
	ldr r0, [sp, #0x48]
	strb r6, [r0]
	str r4, [r1, #0x10]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	ldr r0, [sp, #0x28]
	bl sub_8004558
	movs r6, #0xe6
	lsls r6, r6, #2
	add r6, r8
	movs r5, #0
_08090256:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xd0
	mov r1, r8
	adds r3, r1, r0
	ldr r0, [r6]
	str r0, [r3, #4]
	ldr r7, _08090478 @ =gUnknown_080E12FC
	adds r2, r4, #0
	adds r2, #0xd
	lsls r2, r2, #3
	adds r2, r2, r7
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r2, #4]
	strh r0, [r3, #0xa]
	ldrb r1, [r2, #6]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, sp
	strb r0, [r2, #4]
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, #0x81
	strh r0, [r3, #0x1a]
	strh r5, [r3, #8]
	strh r5, [r3, #0x14]
	strh r5, [r3, #0x1c]
	adds r0, r3, #0
	adds r0, #0x22
	movs r1, #0x10
	mov sl, r1
	mov r2, sl
	strb r2, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	str r5, [r3, #0x10]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	str r2, [r3, #0x28]
	adds r0, r3, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08090256
	movs r0, #0xf8
	lsls r0, r0, #1
	add r0, r8
	movs r5, #0xe6
	lsls r5, r5, #2
	add r5, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	adds r1, r7, #0
	adds r1, #0x98
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0x9c
	ldrh r1, [r1]
	movs r6, #0
	movs r4, #0
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0x9e
	ldrb r1, [r1]
	ldr r3, [sp, #0x2c]
	strb r1, [r3]
	ldr r2, [sp, #0x30]
	ldrb r1, [r2]
	mov r3, sp
	ldrb r3, [r3, #4]
	orrs r1, r3
	strb r1, [r2]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r1, #0xa0
	lsls r1, r1, #1
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r2, sl
	ldr r1, [sp, #0x34]
	strb r2, [r1]
	movs r1, #1
	ldr r3, [sp, #0x38]
	strb r1, [r3]
	str r4, [r0, #0x10]
	mov r1, sb
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x88
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	adds r1, r7, #0
	adds r1, #0xa0
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0xa4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0xa6
	ldrb r1, [r1]
	ldr r2, [sp, #0x4c]
	strb r1, [r2]
	ldr r3, [sp, #0x50]
	ldrb r1, [r3]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r1, r2
	strb r1, [r3]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r1, #0xc0
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r1, sl
	ldr r3, [sp, #0x54]
	strb r1, [r3]
	ldr r2, [sp, #0x58]
	strb r6, [r2]
	str r4, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	ldr r2, [r7, #0x48]
	lsls r2, r2, #6
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0x4e
	ldrb r1, [r1]
	ldr r2, [sp, #0x18]
	strb r1, [r2]
	ldr r3, [sp, #0x1c]
	ldrb r1, [r3]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r1, r2
	strb r1, [r3]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r1, sl
	ldr r3, [sp, #0x20]
	strb r1, [r3]
	ldr r2, [sp, #0x24]
	strb r6, [r2]
	str r4, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x94
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	ldr r2, [r7, #0x40]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0x44
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0x46
	ldrb r1, [r1]
	ldr r2, [sp, #0x5c]
	strb r1, [r2]
	ldr r3, [sp, #0x60]
	ldrb r1, [r3]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r1, r2
	strb r1, [r3]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r1, sl
	ldr r3, [sp, #0x64]
	strb r1, [r3]
	ldr r2, [sp, #0x68]
	strb r6, [r2]
	str r4, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, r8
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0809047C @ =0x0600E000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0xaa
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x20
	strh r0, [r1, #0x26]
	movs r0, #0x40
	strh r0, [r1, #0x28]
	ldr r2, [sp, #0x6c]
	strb r6, [r2]
	strh r4, [r1, #0x2e]
	mov r0, r8
	bl sub_8002A3C
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090478: .4byte gUnknown_080E12FC
_0809047C: .4byte 0x0600E000

	thumb_func_start sub_8090480
sub_8090480: @ 0x08090480
	push {r4, r5, r6, r7, lr}
	ldr r7, _0809050C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _08090510 @ =IWRAM_START + 0x370
	adds r6, r5, r0
	movs r0, #2
	strh r0, [r6, #2]
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _08090514 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _080904B2
	adds r0, r4, #0
	bl sub_8090EB4
_080904B2:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r1, _08090518 @ =IWRAM_START + 0x37C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _080904E0
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_080904E0:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r4, #0
	bl sub_8090F6C
	adds r0, r6, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08090504
	movs r0, #0
	strh r0, [r6, #4]
	ldr r1, [r7]
	ldr r0, _0809051C @ =sub_80913DC
	str r0, [r1, #8]
_08090504:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809050C: .4byte gCurTask
_08090510: .4byte IWRAM_START + 0x370
_08090514: .4byte gBgScrollRegs
_08090518: .4byte IWRAM_START + 0x37C
_0809051C: .4byte sub_80913DC

	thumb_func_start sub_8090520
sub_8090520: @ 0x08090520
	push {r4, r5, r6, r7, lr}
	ldr r7, _080905A8 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _080905AC @ =IWRAM_START + 0x370
	adds r6, r5, r0
	ldr r0, _080905B0 @ =0x00003FFF
	strh r0, [r6, #8]
	movs r0, #1
	strh r0, [r6, #2]
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _080905B4 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _08090556
	adds r0, r4, #0
	bl sub_8090EB4
_08090556:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r1, _080905B8 @ =IWRAM_START + 0x37C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _08090584
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_08090584:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r6, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080905A2
	movs r0, #0
	strh r0, [r6, #4]
	ldr r1, [r7]
	ldr r0, _080905BC @ =sub_8091468
	str r0, [r1, #8]
_080905A2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080905A8: .4byte gCurTask
_080905AC: .4byte IWRAM_START + 0x370
_080905B0: .4byte 0x00003FFF
_080905B4: .4byte gBgScrollRegs
_080905B8: .4byte IWRAM_START + 0x37C
_080905BC: .4byte sub_8091468

	thumb_func_start sub_80905C0
sub_80905C0: @ 0x080905C0
	push {r4, r5, r6, r7, lr}
	ldr r7, _08090634 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _08090638 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _080905EA
	adds r0, r4, #0
	bl sub_8090EB4
_080905EA:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r0, _0809063C @ =IWRAM_START + 0x37C
	adds r5, r6, r0
	ldrb r0, [r5]
	cmp r0, #0xe
	bhi _08090618
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_08090618:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r4, #0
	bl sub_8090F6C
	ldr r1, _08090640 @ =IWRAM_START + 0x390
	adds r2, r6, r1
	ldrh r0, [r2]
	cmp r0, #0
	beq _08090644
	subs r0, #1
	strh r0, [r2]
	b _0809065C
	.align 2, 0
_08090634: .4byte gCurTask
_08090638: .4byte gBgScrollRegs
_0809063C: .4byte IWRAM_START + 0x37C
_08090640: .4byte IWRAM_START + 0x390
_08090644:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08090664 @ =gUnknown_080E1514
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, [r7]
	ldr r0, _08090668 @ =sub_80913DC
	str r0, [r1, #8]
_0809065C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090664: .4byte gUnknown_080E1514
_08090668: .4byte sub_80913DC

	thumb_func_start sub_809066C
sub_809066C: @ 0x0809066C
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #0xdf
	lsls r5, r5, #2
	add r5, ip
	ldrb r3, [r5]
	adds r2, r3, #0
	cmp r2, #0xc
	bhi _0809069E
	movs r1, #0xf8
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0x8c
	lsls r0, r0, #3
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0xf9
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [r1]
	b _080907D0
_0809069E:
	cmp r2, #0xd
	bne _08090712
	movs r2, #0xf9
	lsls r2, r2, #2
	add r2, ip
	ldr r1, [r2]
	ldr r0, _080906EC @ =0xFFFFCE00
	cmp r1, r0
	ble _08090704
	ldr r3, _080906F0 @ =0xFFFFFF00
	adds r0, r1, r3
	str r0, [r2]
	movs r3, #0xf8
	lsls r3, r3, #2
	add r3, ip
	ldr r1, [r3]
	ldr r0, _080906F4 @ =0x0000A9FF
	cmp r1, r0
	ble _080906C6
	b _080907D0
_080906C6:
	ldr r2, _080906F8 @ =0x0000038E
	add r2, ip
	ldrh r1, [r2]
	ldr r0, _080906FC @ =0x000003FF
	cmp r1, r0
	bhi _080906D6
	adds r0, r1, #1
	strh r0, [r2]
_080906D6:
	ldr r1, _08090700 @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	b _080907D0
	.align 2, 0
_080906EC: .4byte 0xFFFFCE00
_080906F0: .4byte 0xFFFFFF00
_080906F4: .4byte 0x0000A9FF
_080906F8: .4byte 0x0000038E
_080906FC: .4byte 0x000003FF
_08090700: .4byte gSineTable
_08090704:
	movs r1, #0xf8
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
	b _0809078C
_08090712:
	cmp r2, #0xf
	bne _08090740
	movs r2, #0xf9
	lsls r2, r2, #2
	add r2, ip
	ldr r1, [r2]
	ldr r0, _0809072C @ =0x000054FF
	cmp r1, r0
	bgt _08090730
	adds r0, r1, #0
	adds r0, #0x50
	b _080907CE
	.align 2, 0
_0809072C: .4byte 0x000054FF
_08090730:
	adds r0, r3, #1
	strb r0, [r5]
	movs r1, #0xe5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0x3c
	strh r0, [r1]
	b _080907D0
_08090740:
	cmp r2, #0x10
	bhi _08090794
	movs r6, #1
	movs r4, #0xe5
	lsls r4, r4, #2
	add r4, ip
	ldrh r0, [r4]
	cmp r0, #0xdb
	bls _08090754
	movs r6, #0
_08090754:
	movs r3, #0xf9
	lsls r3, r3, #2
	add r3, ip
	ldr r2, _08090784 @ =gSineTable
	ldrh r0, [r4]
	lsls r0, r0, #1
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	asrs r0, r6
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldrh r1, [r4]
	ldr r0, _08090788 @ =0x0000012B
	cmp r1, r0
	bhi _0809078C
	adds r0, r1, #1
	strh r0, [r4]
	b _080907D0
	.align 2, 0
_08090784: .4byte gSineTable
_08090788: .4byte 0x0000012B
_0809078C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _080907D0
_08090794:
	movs r1, #0xf9
	lsls r1, r1, #2
	add r1, ip
	ldr r0, _080907F4 @ =0x00000474
	add r0, ip
	ldr r0, [r0]
	ldr r4, _080907F8 @ =0xFFFFC400
	adds r0, r0, r4
	ldr r1, [r1]
	cmp r1, r0
	ble _080907B2
	cmp r2, #0x11
	bne _080907B2
	adds r0, r3, #1
	strb r0, [r5]
_080907B2:
	movs r2, #0xf9
	lsls r2, r2, #2
	add r2, ip
	ldr r0, _080907F4 @ =0x00000474
	add r0, ip
	ldr r0, [r0]
	ldr r1, _080907FC @ =0xFFFFD800
	adds r0, r0, r1
	ldr r1, [r2]
	cmp r1, r0
	bge _080907D0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
_080907CE:
	str r0, [r2]
_080907D0:
	movs r0, #0xdf
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _080907EC
	movs r0, #0xf8
	lsls r0, r0, #2
	add r0, ip
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r2, #2
	bl sub_808E95C
_080907EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080907F4: .4byte 0x00000474
_080907F8: .4byte 0xFFFFC400
_080907FC: .4byte 0xFFFFD800

	thumb_func_start sub_8090800
sub_8090800: @ 0x08090800
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0809082C
	movs r4, #0x8e
	lsls r4, r4, #3
	adds r1, r3, r4
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
	ldr r0, _08090828 @ =0x00000474
	adds r1, r3, r0
	movs r0, #0x8c
	lsls r0, r0, #7
	b _080908A4
	.align 2, 0
_08090828: .4byte 0x00000474
_0809082C:
	cmp r0, #0xd
	bne _0809084C
	ldr r1, _08090844 @ =0x00000474
	adds r2, r3, r1
	ldr r1, [r2]
	ldr r0, _08090848 @ =0x00008BFF
	cmp r1, r0
	bgt _0809084C
	adds r0, r1, #0
	adds r0, #0x80
	str r0, [r2]
	b _080908A6
	.align 2, 0
_08090844: .4byte 0x00000474
_08090848: .4byte 0x00008BFF
_0809084C:
	movs r4, #0xdf
	lsls r4, r4, #2
	adds r5, r3, r4
	ldrb r4, [r5]
	adds r0, r4, #0
	cmp r0, #0xe
	bne _0809087A
	ldr r0, _08090870 @ =0x00000474
	adds r2, r3, r0
	ldr r1, [r2]
	movs r0, #0xaa
	lsls r0, r0, #7
	cmp r1, r0
	ble _08090874
	adds r0, r1, #0
	subs r0, #0x40
	str r0, [r2]
	b _080908A6
	.align 2, 0
_08090870: .4byte 0x00000474
_08090874:
	adds r0, r4, #1
	strb r0, [r5]
	b _080908A6
_0809087A:
	cmp r0, #0x10
	bhi _0809089C
	ldr r1, _08090894 @ =0x00000474
	adds r2, r3, r1
	ldr r1, [r2]
	ldr r0, _08090898 @ =0x000086FF
	cmp r1, r0
	bgt _080908A6
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r2]
	b _080908A6
	.align 2, 0
_08090894: .4byte 0x00000474
_08090898: .4byte 0x000086FF
_0809089C:
	ldr r4, _080908C4 @ =0x00000474
	adds r1, r3, r4
	ldr r0, [r1]
	subs r0, #8
_080908A4:
	str r0, [r1]
_080908A6:
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _080908F0
	ldr r4, _080908C8 @ =0x00000396
	adds r1, r3, r4
	ldrh r2, [r1]
	ldr r0, _080908CC @ =0x000003FF
	cmp r2, r0
	bhi _080908D0
	adds r0, r2, #0
	adds r0, #0x20
	b _080908D2
	.align 2, 0
_080908C4: .4byte 0x00000474
_080908C8: .4byte 0x00000396
_080908CC: .4byte 0x000003FF
_080908D0:
	movs r0, #0
_080908D2:
	strh r0, [r1]
	ldr r0, _080908F8 @ =0x00000474
	adds r2, r3, r0
	ldr r1, _080908FC @ =gSineTable
	ldr r4, _08090900 @ =0x00000396
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_080908F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080908F8: .4byte 0x00000474
_080908FC: .4byte gSineTable
_08090900: .4byte 0x00000396

	thumb_func_start sub_8090904
sub_8090904: @ 0x08090904
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	movs r0, #0xdf
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	subs r0, #0xd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080909AC
	movs r7, #0
	ldr r0, _08090970 @ =0x0000047C
	add r0, r8
	mov sb, r0
	movs r1, #0x90
	lsls r1, r1, #3
	add r1, r8
	mov ip, r1
	ldr r5, _08090974 @ =0x00000484
	add r5, r8
	ldr r3, _08090978 @ =0x000103FE
	mov sl, r3
_0809093C:
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r3, r1, #2
	mov r6, sb
	adds r4, r6, r3
	ldr r2, [r4]
	ldr r6, _0809097C @ =0x000009FF
	adds r1, r2, r6
	adds r6, r0, #0
	cmp r1, sl
	bls _08090962
	mov r1, ip
	adds r0, r1, r3
	ldr r0, [r0]
	ldr r1, _0809097C @ =0x000009FF
	adds r0, r0, r1
	ldr r1, _08090980 @ =0x0000B3FE
	cmp r0, r1
	bhi _080909A2
_08090962:
	cmp r7, #2
	bhi _08090984
	adds r0, r5, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	subs r0, r2, r0
	b _0809098C
	.align 2, 0
_08090970: .4byte 0x0000047C
_08090974: .4byte 0x00000484
_08090978: .4byte 0x000103FE
_0809097C: .4byte 0x000009FF
_08090980: .4byte 0x0000B3FE
_08090984:
	adds r0, r5, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	adds r0, r2, r0
_0809098C:
	str r0, [r4]
	adds r0, r6, r7
	lsls r0, r0, #2
	mov r3, ip
	adds r2, r3, r0
	adds r0, r5, r0
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r2]
	subs r0, r0, r1
	str r0, [r2]
_080909A2:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bls _0809093C
_080909AC:
	movs r0, #0xdf
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _080909BA
	b _08090C02
_080909BA:
	movs r7, #0
	ldr r4, _08090A28 @ =0x00000381
	add r4, r8
	mov sl, r4
	ldr r6, _08090A2C @ =0x0000047C
	add r6, r8
	str r6, [sp]
	ldr r0, _08090A30 @ =0x00000484
	add r0, r8
	mov sb, r0
	ldr r1, _08090A34 @ =0x00000474
	add r1, r8
	str r1, [sp, #0xc]
	movs r3, #0x8e
	lsls r3, r3, #3
	add r3, r8
	str r3, [sp, #4]
	movs r4, #0x90
	lsls r4, r4, #3
	add r4, r8
	str r4, [sp, #8]
	ldr r6, _08090A38 @ =0x00000387
	add r6, r8
	str r6, [sp, #0x10]
_080909EA:
	mov r0, sl
	adds r0, r0, r7
	mov ip, r0
	ldrb r5, [r0]
	cmp r5, #0x10
	bls _080909F8
	b _08090B0E
_080909F8:
	cmp r7, #2
	bhi _08090A90
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r4, r1, r2
	ldr r3, [sp, #4]
	ldr r1, [r3]
	movs r6, #0xf0
	lsls r6, r6, #6
	adds r1, r1, r6
	ldr r3, [r4]
	adds r6, r0, #0
	cmp r3, r1
	bge _08090A3C
	mov r1, sb
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #7
	adds r0, r3, r0
	str r0, [r4]
	b _08090A44
	.align 2, 0
_08090A28: .4byte 0x00000381
_08090A2C: .4byte 0x0000047C
_08090A30: .4byte 0x00000484
_08090A34: .4byte 0x00000474
_08090A38: .4byte 0x00000387
_08090A3C:
	movs r0, #0x10
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
_08090A44:
	mov r4, sl
	adds r5, r4, r7
	ldrb r4, [r5]
	movs r0, #1
	mov ip, r0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _08090B0E
	adds r0, r6, r7
	lsls r1, r0, #2
	ldr r3, [sp, #8]
	adds r2, r3, r1
	ldr r6, [sp, #0xc]
	ldr r0, [r6]
	ldr r3, _08090A7C @ =0xFFFFE200
	adds r0, r0, r3
	ldr r3, [r2]
	cmp r3, r0
	bge _08090A80
	mov r4, sb
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #7
	adds r0, r3, r0
	str r0, [r2]
	b _08090A86
	.align 2, 0
_08090A7C: .4byte 0xFFFFE200
_08090A80:
	mov r0, ip
	orrs r0, r4
	strb r0, [r5]
_08090A86:
	ldr r6, [sp, #0x10]
	adds r1, r6, r7
	movs r0, #2
	strb r0, [r1]
	b _08090B0E
_08090A90:
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r4, r1, r2
	ldr r3, [sp, #4]
	ldr r1, [r3]
	ldr r6, _08090AB8 @ =0xFFFFC400
	adds r1, r1, r6
	ldr r3, [r4]
	adds r6, r0, #0
	cmp r3, r1
	ble _08090ABC
	mov r1, sb
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #7
	subs r0, r3, r0
	str r0, [r4]
	b _08090AC4
	.align 2, 0
_08090AB8: .4byte 0xFFFFC400
_08090ABC:
	movs r0, #0x10
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
_08090AC4:
	mov r4, sl
	adds r5, r4, r7
	ldrb r4, [r5]
	movs r0, #1
	mov ip, r0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _08090B06
	adds r0, r6, r7
	lsls r1, r0, #2
	ldr r3, [sp, #8]
	adds r2, r3, r1
	ldr r6, [sp, #0xc]
	ldr r0, [r6]
	ldr r3, _08090AFC @ =0xFFFFE200
	adds r0, r0, r3
	ldr r3, [r2]
	cmp r3, r0
	bge _08090B00
	mov r4, sb
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #7
	adds r0, r3, r0
	str r0, [r2]
	b _08090B06
	.align 2, 0
_08090AFC: .4byte 0xFFFFE200
_08090B00:
	mov r0, ip
	orrs r0, r4
	strb r0, [r5]
_08090B06:
	ldr r6, [sp, #0x10]
	adds r0, r6, r7
	movs r1, #1
	strb r1, [r0]
_08090B0E:
	mov r3, sl
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r0, #0xf
	bls _08090BA4
	lsls r2, r7, #2
	adds r0, r2, r7
	lsls r0, r0, #2
	movs r1, #0x91
	lsls r1, r1, #3
	add r1, r8
	adds r3, r1, r0
	add r0, sb
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldr r0, _08090B64 @ =0x0003FF00
	adds r6, r2, #0
	cmp r1, r0
	ble _08090B3E
	movs r0, #0
	str r0, [r3]
_08090B3E:
	ldr r0, [r3]
	asrs r0, r0, #2
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r1, _08090B68 @ =gSineTable
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08090B6C
	ldr r3, [sp, #0x10]
	adds r0, r3, r7
	movs r4, #1
	strb r4, [r0]
	b _08090B74
	.align 2, 0
_08090B64: .4byte 0x0003FF00
_08090B68: .4byte gSineTable
_08090B6C:
	ldr r0, [sp, #0x10]
	adds r1, r0, r7
	movs r0, #2
	strb r0, [r1]
_08090B74:
	adds r1, r6, r7
	lsls r1, r1, #2
	ldr r3, [sp]
	adds r2, r3, r1
	movs r0, #0x91
	lsls r0, r0, #3
	add r0, r8
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #2
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r6, _08090C14 @ =gSineTable
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08090BA4:
	mov r1, sl
	adds r0, r1, r7
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08090BF6
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #2
	ldr r0, _08090C18 @ =0x0000048C
	add r0, r8
	adds r3, r0, r2
	mov r4, sb
	adds r0, r4, r2
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldr r0, _08090C1C @ =0x0003FF00
	cmp r1, r0
	ble _08090BD6
	movs r0, #0
	str r0, [r3]
_08090BD6:
	ldr r6, [sp, #8]
	adds r2, r6, r2
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08090C14 @ =gSineTable
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	ldr r3, _08090C20 @ =0xFFFFE200
	adds r0, r0, r3
	ldr r4, [sp, #0xc]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r2]
_08090BF6:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bhi _08090C02
	b _080909EA
_08090C02:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090C14: .4byte gSineTable
_08090C18: .4byte 0x0000048C
_08090C1C: .4byte 0x0003FF00
_08090C20: .4byte 0xFFFFE200

	thumb_func_start sub_8090C24
sub_8090C24: @ 0x08090C24
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xdf
	lsls r0, r0, #2
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0xc
	bhi _08090C74
	movs r0, #0x8c
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r0, #0x78
	str r0, [r1]
	ldr r0, _08090C58 @ =0x00000464
	adds r1, r4, r0
	movs r0, #0x50
	str r0, [r1]
	movs r1, #0xe4
	lsls r1, r1, #2
	adds r2, r4, r1
	ldrh r0, [r2]
	cmp r0, #0
	beq _08090C5C
	subs r0, #1
	strh r0, [r2]
	b _08090C86
	.align 2, 0
_08090C58: .4byte 0x00000464
_08090C5C:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r1, _08090C70 @ =gUnknown_080E1514
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08090C86
	.align 2, 0
_08090C70: .4byte gUnknown_080E1514
_08090C74:
	ldr r0, _08090C9C @ =0x00000464
	adds r2, r4, r0
	ldr r1, [r2]
	movs r0, #0x32
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08090C86
	subs r0, r1, #1
	str r0, [r2]
_08090C86:
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r1, #0x78
	movs r2, #2
	bl sub_808E8F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090C9C: .4byte 0x00000464

	thumb_func_start sub_8090CA0
sub_8090CA0: @ 0x08090CA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _08090D52
	movs r5, #0
	ldr r6, _08090D08 @ =0x00000584
	adds r6, r6, r3
	mov r8, r6
	movs r0, #0xb1
	lsls r0, r0, #3
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _08090D0C @ =0x0000058C
	adds r7, r3, r1
	ldr r6, _08090D10 @ =0x000103FE
	mov sl, r6
	ldr r0, _08090D14 @ =gUnknown_080E1444
	mov sb, r0
_08090CD4:
	lsls r0, r5, #1
	adds r1, r0, r5
	lsls r3, r1, #2
	mov r1, r8
	adds r2, r1, r3
	ldr r4, [r2]
	ldr r6, _08090D18 @ =0x000009FF
	adds r1, r4, r6
	adds r6, r0, #0
	cmp r1, sl
	bls _08090CFA
	mov r1, ip
	adds r0, r1, r3
	ldr r0, [r0]
	ldr r1, _08090D18 @ =0x000009FF
	adds r0, r0, r1
	ldr r1, _08090D1C @ =0x0000B3FE
	cmp r0, r1
	bhi _08090D48
_08090CFA:
	cmp r5, #2
	bhi _08090D20
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #6
	subs r0, r4, r0
	b _08090D28
	.align 2, 0
_08090D08: .4byte 0x00000584
_08090D0C: .4byte 0x0000058C
_08090D10: .4byte 0x000103FE
_08090D14: .4byte gUnknown_080E1444
_08090D18: .4byte 0x000009FF
_08090D1C: .4byte 0x0000B3FE
_08090D20:
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #6
	adds r0, r4, r0
_08090D28:
	str r0, [r2]
	adds r2, r6, r5
	lsls r2, r2, #2
	mov r6, ip
	adds r4, r6, r2
	adds r3, r7, r2
	ldr r1, [r3]
	asrs r1, r1, #7
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	add r2, sb
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
_08090D48:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08090CD4
_08090D52:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8090D60
sub_8090D60: @ 0x08090D60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r1, r0, r2
	ldrb r3, [r1]
	cmp r3, #0xc
	bhi _08090E0A
	movs r5, #0
	cmp r5, r3
	bhs _08090E0A
	movs r2, #0x9f
	lsls r2, r2, #3
	adds r2, r2, r0
	mov sb, r2
	ldr r2, _08090DD4 @ =0x000004F4
	adds r2, r2, r0
	mov r8, r2
	ldr r7, _08090DD8 @ =gUnknown_080E13AC
	ldr r2, _08090DDC @ =0x000004FC
	adds r6, r0, r2
	adds r0, r7, #4
	mov sl, r0
	mov ip, r1
_08090D96:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r3, r0, #2
	mov r1, sb
	adds r4, r1, r3
	ldr r0, [r4]
	ldr r2, _08090DE0 @ =0x000009FF
	adds r0, r0, r2
	ldr r1, _08090DE4 @ =0x0000B3FE
	cmp r0, r1
	bhi _08090DEC
	mov r0, r8
	adds r1, r0, r3
	adds r0, r3, r7
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	adds r2, r6, r3
	ldr r1, [r2]
	asrs r1, r1, #3
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	ldr r0, _08090DE8 @ =gUnknown_080E13B4
	adds r1, r3, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	b _08090DFC
	.align 2, 0
_08090DD4: .4byte 0x000004F4
_08090DD8: .4byte gUnknown_080E13AC
_08090DDC: .4byte 0x000004FC
_08090DE0: .4byte 0x000009FF
_08090DE4: .4byte 0x0000B3FE
_08090DE8: .4byte gUnknown_080E13B4
_08090DEC:
	adds r1, r6, r3
	movs r0, #0
	str r0, [r1]
	mov r1, sl
	adds r0, r3, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r4]
_08090DFC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, ip
	ldrb r2, [r2]
	cmp r5, r2
	blo _08090D96
_08090E0A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8090E18
sub_8090E18: @ 0x08090E18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	movs r1, #0xa
	mov sb, r1
	cmp r0, #0xd
	bne _08090E36
	movs r0, #4
	mov sb, r0
_08090E36:
	movs r6, #0
	cmp r6, sb
	bhs _08090EA2
	movs r1, #0xfc
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r8, r1
_08090E44:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r4, r0, #2
	movs r1, #0xfb
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r5, r0, r4
	ldr r1, [r5]
	ldr r0, _08090EB0 @ =0xFFFFA600
	cmp r1, r0
	bge _08090E8C
	movs r0, #0xe6
	lsls r0, r0, #8
	str r0, [r5]
	bl Random
	mov r1, r8
	adds r2, r1, r4
	movs r1, #3
	ands r1, r0
	adds r1, #0xb
	movs r0, #1
	lsls r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2]
	bl Random
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r2, r7, r1
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
_08090E8C:
	mov r0, r8
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, sb
	blo _08090E44
_08090EA2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090EB0: .4byte 0xFFFFA600

	thumb_func_start sub_8090EB4
sub_8090EB4: @ 0x08090EB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r1, _08090F5C @ =gUnknown_080E15A8
	mov sb, r1
	movs r2, #0xe9
	lsls r2, r2, #2
	adds r6, r0, r2
	movs r1, #0xe8
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r8, r1
	subs r2, #0x28
	adds r2, r2, r0
	mov ip, r2
	ldr r1, _08090F60 @ =0x00000474
	adds r7, r0, r1
_08090EDA:
	lsls r0, r5, #3
	adds r3, r6, r0
	ldr r2, [r3]
	movs r1, #0x14
	rsbs r1, r1, #0
	adds r4, r0, #0
	cmp r2, r1
	bge _08090F06
	movs r0, #0xe6
	lsls r0, r0, #8
	str r0, [r3]
	mov r2, r8
	adds r1, r2, r4
	ldr r0, [r1]
	ldr r2, _08090F64 @ =0xFFFFB000
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _08090F06
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [r1]
_08090F06:
	adds r2, r6, r4
	lsls r0, r5, #2
	add r0, sb
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r2]
	subs r3, r1, r0
	str r3, [r2]
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0xe
	bne _08090F2E
	ldr r1, [r7]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	ble _08090F2E
	adds r0, r3, #0
	subs r0, #0x40
	str r0, [r2]
_08090F2E:
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #0xf
	bne _08090F46
	ldr r1, [r7]
	ldr r0, _08090F68 @ =0x00008BFF
	cmp r1, r0
	bgt _08090F46
	adds r1, r6, r4
	ldr r0, [r1]
	adds r0, #0x20
	str r0, [r1]
_08090F46:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08090EDA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090F5C: .4byte gUnknown_080E15A8
_08090F60: .4byte 0x00000474
_08090F64: .4byte 0xFFFFB000
_08090F68: .4byte 0x00008BFF

	thumb_func_start sub_8090F6C
sub_8090F6C: @ 0x08090F6C
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0809102C
	ldr r4, _08090F98 @ =0x0000037D
	adds r2, r3, r4
	ldrb r1, [r2]
	cmp r1, #0
	beq _08090F9C
	adds r4, #1
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08090F9C
	subs r0, r1, #1
	strb r0, [r2]
	b _0809102C
	.align 2, 0
_08090F98: .4byte 0x0000037D
_08090F9C:
	ldr r0, _08090FB8 @ =0x0000037F
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08090FF0
	subs r0, #1
	strb r0, [r2]
	ldr r2, _08090FBC @ =0x0000037E
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #3
	bhi _08090FC4
	ldr r2, _08090FC0 @ =0x040000D4
	b _08090FCC
	.align 2, 0
_08090FB8: .4byte 0x0000037F
_08090FBC: .4byte 0x0000037E
_08090FC0: .4byte 0x040000D4
_08090FC4:
	ldr r2, _08090FE0 @ =0x040000D4
	ldrb r1, [r1]
	movs r0, #6
	subs r0, r0, r1
_08090FCC:
	lsls r0, r0, #5
	ldr r1, _08090FE4 @ =gUnknown_080E15C8
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08090FE8 @ =gUnknown_030020C0
	str r0, [r2, #4]
	ldr r0, _08090FEC @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _08091008
	.align 2, 0
_08090FE0: .4byte 0x040000D4
_08090FE4: .4byte gUnknown_080E15C8
_08090FE8: .4byte gUnknown_030020C0
_08090FEC: .4byte 0x84000008
_08090FF0:
	ldr r4, _08091034 @ =0x0000037E
	adds r1, r3, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08091038 @ =gUnknown_080E154A
	subs r4, #2
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
_08091008:
	ldr r0, _08091034 @ =0x0000037E
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #7
	bne _0809102C
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0809103C @ =gUnknown_080E1530
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r4, _08091040 @ =0x0000037D
	adds r0, r3, r4
	strb r1, [r0]
_0809102C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091034: .4byte 0x0000037E
_08091038: .4byte gUnknown_080E154A
_0809103C: .4byte gUnknown_080E1530
_08091040: .4byte 0x0000037D

	thumb_func_start sub_8091044
sub_8091044: @ 0x08091044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r7, #0xa
	cmp r0, #0xd
	bne _08091060
	movs r7, #4
_08091060:
	movs r2, #0xd0
	lsls r2, r2, #2
	adds r4, r6, r2
	movs r5, #0
	movs r0, #0x40
	adds r0, r0, r6
	mov sl, r0
	cmp r5, r7
	bhs _080910B6
	ldr r0, _08091140 @ =gUnknown_080E1348
	ldrh r1, [r0]
	mov sb, r1
	ldrb r0, [r0, #2]
	mov r8, r0
_0809107C:
	mov r2, sb
	strh r2, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	mov r1, r8
	strb r1, [r0]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _0809107C
_080910B6:
	ldr r0, _08091144 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _08091124
	movs r7, #0
	movs r5, #0
_080910C4:
	movs r1, #3
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r4, r6, r0
	ldr r0, _08091148 @ =gUnknown_080E12FC
	adds r1, #3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	cmp r5, #4
	bls _080910F0
	movs r7, #1
_080910F0:
	lsls r2, r5, #3
	movs r1, #0xe8
	lsls r1, r1, #2
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r1, [r0]
	asrs r1, r1, #8
	movs r0, #0x64
	muls r0, r7, r0
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	movs r1, #0xe9
	lsls r1, r1, #2
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _080910C4
_08091124:
	mov r4, sl
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0xd
	bne _0809114C
	ldr r1, _08091148 @ =gUnknown_080E12FC
	ldrh r0, [r1, #0xc]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0xe]
	b _08091176
	.align 2, 0
_08091140: .4byte gUnknown_080E1348
_08091144: .4byte gBgScrollRegs
_08091148: .4byte gUnknown_080E12FC
_0809114C:
	subs r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08091164
	ldr r1, _08091160 @ =gUnknown_080E12FC
	ldrh r0, [r1, #0x14]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	b _08091176
	.align 2, 0
_08091160: .4byte gUnknown_080E12FC
_08091164:
	cmp r1, #0x10
	bls _0809117C
	ldr r0, _080911E4 @ =gUnknown_080E12FC
	adds r1, r0, #0
	adds r1, #0xac
	ldrh r1, [r1]
	strh r1, [r4, #0xa]
	adds r0, #0xae
	ldrb r1, [r0]
_08091176:
	adds r0, r6, #0
	adds r0, #0x60
	strb r1, [r0]
_0809117C:
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	movs r2, #0xf9
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r0, #0xdf
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bhi _0809120C
	adds r4, r6, #0
	adds r4, #0xa0
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r0, r6, r2
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	cmp r0, #0xa
	bne _080911E8
	ldr r0, _080911E4 @ =gUnknown_080E12FC
	adds r1, r0, #0
	adds r1, #0x5c
	ldrh r1, [r1]
	strh r1, [r4, #0xa]
	adds r0, #0x5e
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc0
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	b _08091206
	.align 2, 0
_080911E4: .4byte gUnknown_080E12FC
_080911E8:
	cmp r0, #0xd
	bne _08091206
	ldr r0, _08091264 @ =gUnknown_080E12FC
	adds r1, r0, #0
	adds r1, #0x64
	ldrh r1, [r1]
	strh r1, [r4, #0xa]
	adds r0, #0x66
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc0
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
_08091206:
	adds r0, r4, #0
	bl sub_80051E8
_0809120C:
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0809126C
	movs r2, #0xf8
	lsls r2, r2, #1
	adds r4, r6, r2
	movs r5, #0
	cmp r5, r0
	bhs _080912B8
_08091224:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _08091268 @ =0x000004F4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r5, r0
	blo _08091224
	b _080912B8
	.align 2, 0
_08091264: .4byte gUnknown_080E12FC
_08091268: .4byte 0x000004F4
_0809126C:
	movs r5, #0
	ldr r7, _080912FC @ =gUnknown_080E12FC
_08091270:
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r0, r2, #4
	adds r0, #0xd0
	adds r4, r6, r0
	adds r0, r5, #0
	adds r0, #0xd
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r2, #2
	ldr r1, _08091300 @ =0x00000584
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	adds r1, #4
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08091270
_080912B8:
	ldr r0, _08091304 @ =gBgScrollRegs
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x6d
	bgt _08091310
	movs r0, #0x88
	lsls r0, r0, #2
	adds r4, r6, r0
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	ldr r2, _08091308 @ =0x00000464
	adds r0, r6, r2
	ldr r0, [r0]
	adds r0, #0x1e
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809130C
	subs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80051E8
	b _08091310
	.align 2, 0
_080912FC: .4byte gUnknown_080E12FC
_08091300: .4byte 0x00000584
_08091304: .4byte gBgScrollRegs
_08091308: .4byte 0x00000464
_0809130C:
	movs r0, #2
	strb r0, [r1]
_08091310:
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _080913C8
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0x70
_08091322:
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _08091360 @ =0x0000047C
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _0809136E
	subs r2, #0xf9
	adds r0, r6, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #1
	bne _08091368
	ldr r0, [r4, #0x10]
	ldr r1, _08091364 @ =0xFFFFFBFF
	ands r0, r1
	b _08091388
	.align 2, 0
_08091360: .4byte 0x0000047C
_08091364: .4byte 0xFFFFFBFF
_08091368:
	cmp r0, #2
	bne _0809138A
	b _08091380
_0809136E:
	cmp r5, #2
	bhi _08091380
	ldr r0, [r4, #0x10]
	ldr r1, _0809137C @ =0xFFFFFBFF
	ands r0, r1
	b _08091388
	.align 2, 0
_0809137C: .4byte 0xFFFFFBFF
_08091380:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_08091388:
	str r0, [r4, #0x10]
_0809138A:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08091322
	movs r0, #0x94
	lsls r0, r0, #2
	adds r4, r6, r0
	movs r1, #0x8e
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r2, _080913D8 @ =0x00000474
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080913C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080913D8: .4byte 0x00000474

	thumb_func_start sub_80913DC
sub_80913DC: @ 0x080913DC
	push {r4, r5, r6, lr}
	ldr r6, _08091458 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _0809145C @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _08091406
	adds r0, r4, #0
	bl sub_8090EB4
_08091406:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r0, _08091460 @ =IWRAM_START + 0x37C
	adds r5, r5, r0
	ldrb r0, [r5]
	cmp r0, #0xe
	bhi _08091434
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_08091434:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r4, #0
	bl sub_8090F6C
	ldrb r0, [r5]
	cmp r0, #0xd
	beq _08091450
	cmp r0, #0x12
	bne _08091450
	ldr r1, [r6]
	ldr r0, _08091464 @ =sub_8090520
	str r0, [r1, #8]
_08091450:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091458: .4byte gCurTask
_0809145C: .4byte gBgScrollRegs
_08091460: .4byte IWRAM_START + 0x37C
_08091464: .4byte sub_8090520

	thumb_func_start sub_8091468
sub_8091468: @ 0x08091468
	push {lr}
	bl sub_80914B8
	ldr r0, _0809147C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0809147C: .4byte gCurTask

	thumb_func_start sub_8091480
sub_8091480: @ 0x08091480
	bx lr
	.align 2, 0

	thumb_func_start sub_8091484
sub_8091484: @ 0x08091484
	push {lr}
	adds r2, r0, #0
	ldr r3, _080914B0 @ =gBgScrollRegs
	movs r0, #2
	ldrsh r1, [r3, r0]
	ldr r0, _080914B4 @ =0x0000015F
	cmp r1, r0
	bgt _080914A0
	movs r0, #0xe7
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, #0x20
	str r0, [r1]
_080914A0:
	movs r1, #0xe7
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r3, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080914B0: .4byte gBgScrollRegs
_080914B4: .4byte 0x0000015F

@; CreateExtraEndingCutSceneSlides
	thumb_func_start sub_80914B8
sub_80914B8: @ 0x080914B8
	push {r4, r5, lr}
	sub sp, #4
	movs r2, #0
	ldr r1, _08091560 @ =gDispCnt
	movs r3, #0x8a
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _08091564 @ =gBgCntRegs
	movs r5, #0
	movs r4, #0
	movs r0, #0xb8
	lsls r0, r0, #7
	strh r0, [r1]
	ldr r0, _08091568 @ =gBgScrollRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	ldr r0, _0809156C @ =gUnknown_03004D80
	strb r5, [r0]
	ldr r1, _08091570 @ =gUnknown_03002280
	strb r5, [r1]
	strb r5, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _08091574 @ =sub_8091590
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _08091578 @ =sub_8091680
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	adds r2, r0, #0
	ldrh r3, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	ldr r1, _0809157C @ =IWRAM_START + 0x4C
	adds r2, r3, r1
	movs r1, #0xf0
	strh r1, [r2]
	ldr r1, _08091580 @ =IWRAM_START + 0x40
	adds r2, r3, r1
	movs r1, #1
	strh r1, [r2, #2]
	strh r1, [r2]
	strh r4, [r2, #4]
	movs r1, #0x80
	strh r1, [r2, #6]
	ldr r1, _08091584 @ =0x00003FFF
	strh r1, [r2, #8]
	strh r4, [r2, #0xa]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08091588 @ =0x0600E000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0xd2
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r1, _0809158C @ =IWRAM_START + 0x2A
	adds r3, r3, r1
	strb r5, [r3]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091560: .4byte gDispCnt
_08091564: .4byte gBgCntRegs
_08091568: .4byte gBgScrollRegs
_0809156C: .4byte gUnknown_03004D80
_08091570: .4byte gUnknown_03002280
_08091574: .4byte sub_8091590
_08091578: .4byte sub_8091680
_0809157C: .4byte IWRAM_START + 0x4C
_08091580: .4byte IWRAM_START + 0x40
_08091584: .4byte 0x00003FFF
_08091588: .4byte 0x0600E000
_0809158C: .4byte IWRAM_START + 0x2A

	thumb_func_start sub_8091590
sub_8091590: @ 0x08091590
	push {r4, r5, lr}
	ldr r5, _080915C0 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _080915C4 @ =IWRAM_START + 0x40
	adds r4, r0, r1
	movs r0, #2
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080915B8
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _080915C8 @ =sub_8091608
	str r0, [r1, #8]
_080915B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080915C0: .4byte gCurTask
_080915C4: .4byte IWRAM_START + 0x40
_080915C8: .4byte sub_8091608

	thumb_func_start sub_80915CC
sub_80915CC: @ 0x080915CC
	push {r4, r5, lr}
	ldr r5, _080915FC @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08091600 @ =IWRAM_START + 0x40
	adds r4, r0, r1
	movs r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080915F4
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _08091604 @ =sub_8091638
	str r0, [r1, #8]
_080915F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080915FC: .4byte gCurTask
_08091600: .4byte IWRAM_START + 0x40
_08091604: .4byte sub_8091638

	thumb_func_start sub_8091608
sub_8091608: @ 0x08091608
	push {lr}
	ldr r0, _08091620 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r3, _08091624 @ =IWRAM_START + 0x4C
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091628
	subs r0, #1
	strh r0, [r1]
	b _08091630
	.align 2, 0
_08091620: .4byte gCurTask
_08091624: .4byte IWRAM_START + 0x4C
_08091628:
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08091634 @ =sub_80915CC
	str r0, [r2, #8]
_08091630:
	pop {r0}
	bx r0
	.align 2, 0
_08091634: .4byte sub_80915CC

	thumb_func_start sub_8091638
sub_8091638: @ 0x08091638
	push {r4, lr}
	ldr r4, _08091660 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _08091664 @ =IWRAM_START + 0x4C
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091668
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08091678
	movs r0, #0x2c
	bl m4aSongNumStart
	b _08091678
	.align 2, 0
_08091660: .4byte gCurTask
_08091664: .4byte IWRAM_START + 0x4C
_08091668:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
_08091678:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8091680
sub_8091680: @ 0x08091680
	bx lr
	.align 2, 0

@; CreateFinalEndingCutScene2
	thumb_func_start sub_8091684
sub_8091684: @ 0x08091684
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	movs r7, #0
	movs r5, #0
	ldr r1, _08091A6C @ =0x0000FFFF
	movs r0, #0
	bl SeedRng
	ldr r1, _08091A70 @ =gDispCnt
	movs r2, #0x9a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08091A74 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08091A78 @ =0x00009C03
	strh r0, [r1]
	ldr r0, _08091A7C @ =0x00009805
	strh r0, [r1, #2]
	ldr r0, _08091A80 @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	ldr r3, _08091A84 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _08091A88 @ =gUnknown_03002280
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
	bl m4aMPlayAllStop
	movs r0, #0x2a
	bl m4aSongNumStart
	ldr r0, _08091A8C @ =sub_8092690
	ldr r1, _08091A90 @ =0x0000049C
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _08091A94 @ =sub_8092800
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r3, _08091A98 @ =IWRAM_START + 0x35C
	adds r1, r0, r3
	strb r4, [r1]
	ldr r6, _08091A9C @ =IWRAM_START + 0x494
	adds r1, r0, r6
	str r5, [r1]
	ldr r2, _08091AA0 @ =IWRAM_START + 0x470
	adds r1, r0, r2
	str r5, [r1]
	adds r3, #8
	adds r1, r0, r3
	strb r4, [r1]
	subs r6, #0x20
	adds r1, r0, r6
	str r5, [r1]
	ldr r1, _08091AA4 @ =IWRAM_START + 0x36E
	adds r2, r0, r1
	movs r1, #0xa0
	strh r1, [r2]
	adds r3, #8
	adds r2, r0, r3
	movs r1, #0xc8
	strh r1, [r2]
	ldr r6, _08091AA8 @ =IWRAM_START + 0x363
	adds r1, r0, r6
	strb r4, [r1]
	ldr r2, _08091AAC @ =IWRAM_START + 0x370
	adds r1, r0, r2
	strh r5, [r1]
	adds r3, #8
	adds r1, r0, r3
	str r5, [r1]
	ldr r4, _08091AB0 @ =IWRAM_START + 0x372
	adds r1, r0, r4
	strh r5, [r1]
	subs r6, #6
	adds r4, r0, r6
	movs r1, #0
	ldr r2, _08091AB4 @ =IWRAM_START + 0x47C
	adds r3, r0, r2
	adds r6, #8
	adds r2, r0, r6
_08091754:
	adds r0, r4, r5
	strb r1, [r0]
	lsls r0, r5, #2
	adds r0, r3, r0
	str r1, [r0]
	strb r1, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08091754
	movs r6, #0
	movs r0, #0x80
	adds r0, r0, r7
	mov sl, r0
	adds r1, r7, #0
	adds r1, #0xa0
	str r1, [sp, #0x28]
	adds r2, r7, #0
	adds r2, #0xa1
	str r2, [sp, #0x2c]
	adds r3, r7, #0
	adds r3, #0xa2
	str r3, [sp, #0x34]
	adds r4, r7, #0
	adds r4, #0xa5
	str r4, [sp, #0x40]
	ldr r0, _08091AB8 @ =0x00000131
	adds r0, r7, r0
	str r0, [sp, #4]
	movs r1, #0x99
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #8]
	ldr r2, _08091ABC @ =0x00000135
	adds r2, r7, r2
	str r2, [sp, #0xc]
	ldr r3, _08091AC0 @ =0x00000161
	adds r3, r7, r3
	str r3, [sp, #0x18]
	movs r4, #0xb1
	lsls r4, r4, #1
	adds r4, r7, r4
	str r4, [sp, #0x1c]
	ldr r0, _08091AC4 @ =0x00000165
	adds r0, r7, r0
	str r0, [sp, #0x20]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #0x30]
	ldr r2, _08091AC8 @ =0x000001C1
	adds r2, r7, r2
	str r2, [sp, #0x38]
	movs r3, #0xe1
	lsls r3, r3, #1
	adds r3, r7, r3
	str r3, [sp, #0x3c]
	ldr r4, _08091ACC @ =0x000001C5
	adds r4, r7, r4
	str r4, [sp, #0x44]
	adds r0, r7, #0
	adds r0, #0x2a
	str r0, [sp, #0x10]
	adds r1, r7, #0
	adds r1, #0x40
	str r1, [sp, #0x14]
	adds r2, r7, #0
	adds r2, #0x6a
	str r2, [sp, #0x24]
	movs r3, #0xde
	lsls r3, r3, #2
	adds r3, r3, r7
	mov r8, r3
	mov sb, r6
	movs r0, #0xf2
	lsls r0, r0, #2
	adds r4, r7, r0
_080917F0:
	movs r5, #0
	adds r3, r6, #1
	lsls r2, r6, #2
_080917F6:
	lsls r0, r5, #3
	adds r0, r2, r0
	mov r6, r8
	adds r1, r6, r0
	mov r6, sb
	str r6, [r1]
	adds r0, r4, r0
	str r6, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080917F6
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080917F0
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0xd2
	str r0, [r1]
	movs r2, #0xf1
	lsls r2, r2, #2
	adds r1, r7, r2
	movs r0, #0xaa
	lsls r0, r0, #7
	str r0, [r1]
	movs r3, #0xea
	lsls r3, r3, #2
	adds r0, r7, r3
	movs r1, #0x78
	str r1, [r0]
	movs r4, #0xed
	lsls r4, r4, #2
	adds r0, r7, r4
	str r1, [r0]
	movs r6, #0xeb
	lsls r6, r6, #2
	adds r0, r7, r6
	movs r1, #0xa0
	lsls r1, r1, #7
	str r1, [r0]
	subs r2, #0xc
	adds r0, r7, r2
	str r1, [r0]
	adds r3, #8
	adds r0, r7, r3
	movs r1, #1
	str r1, [r0]
	adds r4, #8
	adds r0, r7, r4
	str r1, [r0]
	movs r5, #0
	movs r6, #1
_08091864:
	bl Random
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r2, r7, r1
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
	movs r2, #0xff
	lsls r2, r2, #2
	adds r0, r7, r2
	adds r0, r0, r4
	movs r3, #0
	str r3, [r0]
	str r3, [sp, #0x48]
	bl Random
	movs r1, #0x80
	lsls r1, r1, #3
	adds r2, r7, r1
	adds r2, r2, r4
	adds r1, r6, #0
	ands r1, r0
	adds r1, #0xc
	adds r0, r6, #0
	lsls r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x48]
	cmp r5, #9
	bls _08091864
	movs r6, #0x93
	lsls r6, r6, #3
	adds r0, r7, r6
	strb r3, [r0]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r0, #2
	strh r0, [r5, #2]
	movs r0, #1
	strh r0, [r5]
	strh r3, [r5, #4]
	movs r1, #0x50
	mov sb, r1
	mov r2, sb
	strh r2, [r5, #6]
	ldr r0, _08091AD0 @ =0x00003FBF
	strh r0, [r5, #8]
	strh r3, [r5, #0xa]
	subs r6, #4
	adds r4, r7, r6
	ldr r0, _08091AD4 @ =0x06010000
	str r0, [r4]
	mov r1, sl
	str r0, [r1, #4]
	ldr r2, _08091AD8 @ =gUnknown_080E1650
	mov r8, r2
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r2, #4]
	mov r6, sl
	strh r0, [r6, #0xa]
	ldrb r0, [r2, #6]
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	movs r0, #0xff
	ldr r2, [sp, #0x2c]
	strb r0, [r2]
	strh r3, [r6, #0x16]
	strh r3, [r6, #0x18]
	strh r3, [r6, #0x1a]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	movs r5, #0x10
	ldr r6, [sp, #0x34]
	strb r5, [r6]
	movs r1, #0
	ldr r0, [sp, #0x40]
	strb r1, [r0]
	mov r2, sl
	str r3, [r2, #0x10]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r2, #0x28]
	mov r0, sl
	str r3, [sp, #0x48]
	bl sub_8004558
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1, #4]
	ldr r0, [r4]
	movs r2, #0xd0
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [r4]
	adds r0, r6, #0
	ldr r2, [sp, #4]
	strb r0, [r2]
	movs r0, #0x78
	mov ip, r0
	mov r2, ip
	strh r2, [r1, #0x16]
	mov r0, sb
	strh r0, [r1, #0x18]
	ldr r3, [sp, #0x48]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r2, [sp, #8]
	strb r5, [r2]
	movs r2, #0
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	str r3, [r1, #0x10]
	str r6, [r1, #0x28]
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1, #4]
	ldr r0, [r4]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [r4]
	adds r0, r6, #0
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	mov r0, ip
	strh r0, [r1, #0x16]
	mov r2, sb
	strh r2, [r1, #0x18]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r0, [sp, #0x1c]
	strb r5, [r0]
	movs r0, #0
	ldr r2, [sp, #0x20]
	strb r0, [r2]
	str r3, [r1, #0x10]
	str r6, [r1, #0x28]
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r1, [r4]
	str r1, [r0, #4]
	ldr r1, [r4]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r4]
	mov r2, r8
	ldrh r1, [r2, #0xc]
	strh r1, [r0, #0xa]
	ldrb r1, [r2, #0xe]
	ldr r2, [sp, #0x30]
	strb r1, [r2]
	adds r1, r6, #0
	ldr r2, [sp, #0x38]
	strb r1, [r2]
	strh r3, [r0, #0x16]
	strh r3, [r0, #0x18]
	movs r1, #0x80
	strh r1, [r0, #0x1a]
	strh r3, [r0, #8]
	strh r3, [r0, #0x14]
	strh r3, [r0, #0x1c]
	ldr r3, [sp, #0x3c]
	strb r5, [r3]
	movs r2, #2
	ldr r1, [sp, #0x44]
	strb r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	str r6, [r0, #0x28]
	bl sub_8004558
	movs r6, #0
	mov r5, r8
	movs r3, #0
_080919F6:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r7, r0
	ldr r0, [r4]
	str r0, [r2, #4]
	adds r0, r6, #3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	movs r0, #0x40
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080919F6
	movs r6, #0
	ldr r2, _08091ADC @ =0x00000494
	adds r4, r7, r2
	ldr r0, _08091AD8 @ =gUnknown_080E1650
	ldr r0, [r0, #0x10]
	lsls r0, r0, #5
	mov sl, r0
	movs r3, #0
_08091A60:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	movs r1, #0x8c
	lsls r1, r1, #2
	b _08091AE0
	.align 2, 0
_08091A6C: .4byte 0x0000FFFF
_08091A70: .4byte gDispCnt
_08091A74: .4byte gBgCntRegs
_08091A78: .4byte 0x00009C03
_08091A7C: .4byte 0x00009805
_08091A80: .4byte gBgScrollRegs
_08091A84: .4byte gUnknown_03004D80
_08091A88: .4byte gUnknown_03002280
_08091A8C: .4byte sub_8092690
_08091A90: .4byte 0x0000049C
_08091A94: .4byte sub_8092800
_08091A98: .4byte IWRAM_START + 0x35C
_08091A9C: .4byte IWRAM_START + 0x494
_08091AA0: .4byte IWRAM_START + 0x470
_08091AA4: .4byte IWRAM_START + 0x36E
_08091AA8: .4byte IWRAM_START + 0x363
_08091AAC: .4byte IWRAM_START + 0x370
_08091AB0: .4byte IWRAM_START + 0x372
_08091AB4: .4byte IWRAM_START + 0x47C
_08091AB8: .4byte 0x00000131
_08091ABC: .4byte 0x00000135
_08091AC0: .4byte 0x00000161
_08091AC4: .4byte 0x00000165
_08091AC8: .4byte 0x000001C1
_08091ACC: .4byte 0x000001C5
_08091AD0: .4byte 0x00003FBF
_08091AD4: .4byte 0x06010000
_08091AD8: .4byte gUnknown_080E1650
_08091ADC: .4byte 0x00000494
_08091AE0:
	adds r0, r0, r1
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1, #4]
	ldr r0, [r4]
	add r0, sl
	str r0, [r4]
	adds r2, r1, #0
	adds r2, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, r0
	movs r0, #0xff
	strb r0, [r2]
	strh r3, [r1, #0x16]
	strh r3, [r1, #0x18]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	adds r0, r1, #0
	adds r0, #0x22
	movs r2, #0x10
	mov sb, r2
	mov r2, sb
	strb r2, [r0]
	adds r0, #3
	movs r2, #2
	mov r8, r2
	mov r2, r8
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	movs r5, #1
	rsbs r5, r5, #0
	str r5, [r1, #0x28]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08091A60
	ldr r3, _08091C8C @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bne _08091BA4
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r6, _08091C90 @ =0x00000494
	adds r3, r7, r6
	ldr r1, [r3]
	str r1, [r0, #4]
	ldr r4, _08091C94 @ =gUnknown_080E1650
	adds r1, r4, #0
	adds r1, #0xd8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r3]
	adds r1, r1, r2
	str r1, [r3]
	adds r1, r4, #0
	adds r1, #0xdc
	ldrh r1, [r1]
	movs r2, #0
	strh r1, [r0, #0xa]
	adds r1, r4, #0
	adds r1, #0xde
	ldrb r3, [r1]
	movs r4, #0xc8
	lsls r4, r4, #1
	adds r1, r7, r4
	strb r3, [r1]
	ldr r6, _08091C98 @ =0x00000191
	adds r3, r7, r6
	ldrb r1, [r3]
	mov r4, ip
	orrs r1, r4
	strb r1, [r3]
	strh r2, [r0, #0x16]
	strh r2, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	adds r6, #1
	adds r1, r7, r6
	mov r3, sb
	strb r3, [r1]
	ldr r4, _08091C9C @ =0x00000195
	adds r1, r7, r4
	mov r6, r8
	strb r6, [r1]
	str r2, [r0, #0x10]
	str r5, [r0, #0x28]
	bl sub_8004558
_08091BA4:
	movs r6, #0
	ldr r0, _08091C90 @ =0x00000494
	adds r5, r7, r0
	movs r1, #0
	mov r8, r1
	movs r4, #0
_08091BB0:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, #0xb0
	adds r2, r7, r0
	ldr r0, [r5]
	str r0, [r2, #4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, _08091C94 @ =gUnknown_080E1650
	adds r0, r6, #5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	mov r3, r8
	strb r3, [r0]
	str r4, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _08091BB0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r7, #4]
	movs r4, #0
	mov r8, r4
	movs r4, #0
	strh r4, [r7, #0xa]
	ldr r0, _08091CA0 @ =0x0600E000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r6, _08091CA4 @ =gUnknown_080E1648
	ldrh r0, [r6, #2]
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	movs r5, #0x20
	strh r5, [r7, #0x26]
	strh r5, [r7, #0x28]
	mov r1, r8
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	strh r4, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	ldr r0, _08091CA8 @ =0x06004000
	ldr r2, [sp, #0x14]
	str r0, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _08091CAC @ =0x0600C000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	ldrh r0, [r6]
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	strh r5, [r2, #0x26]
	strh r5, [r2, #0x28]
	mov r4, r8
	ldr r3, [sp, #0x24]
	strb r4, [r3]
	movs r0, #1
	strh r0, [r2, #0x2e]
	ldr r0, [sp, #0x14]
	bl sub_8002A3C
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091C8C: .4byte gSelectedCharacter
_08091C90: .4byte 0x00000494
_08091C94: .4byte gUnknown_080E1650
_08091C98: .4byte 0x00000191
_08091C9C: .4byte 0x00000195
_08091CA0: .4byte 0x0600E000
_08091CA4: .4byte gUnknown_080E1648
_08091CA8: .4byte 0x06004000
_08091CAC: .4byte 0x0600C000

	thumb_func_start sub_8091CB0
sub_8091CB0: @ 0x08091CB0
	push {r4, r5, lr}
	ldr r0, _08091CF8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	ldr r0, _08091CFC @ =IWRAM_START + 0x36E
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091D00
	subs r0, #1
	strh r0, [r1]
	b _08091E50
	.align 2, 0
_08091CF8: .4byte gCurTask
_08091CFC: .4byte IWRAM_START + 0x36E
_08091D00:
	ldr r3, _08091D5C @ =IWRAM_START + 0x35C
	adds r5, r5, r3
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08091D74
	cmp r1, #9
	bhi _08091DE0
	ldr r2, _08091D60 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091D64 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r2, _08091D68 @ =gBldRegs
	ldr r0, _08091D6C @ =0x00003FBF
	strh r0, [r2]
	ldr r1, _08091D70 @ =gUnknown_080E1738
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _08091D58
	b _08091E50
_08091D58:
	b _08091E2E
	.align 2, 0
_08091D5C: .4byte IWRAM_START + 0x35C
_08091D60: .4byte gDispCnt
_08091D64: .4byte gWinRegs
_08091D68: .4byte gBldRegs
_08091D6C: .4byte 0x00003FBF
_08091D70: .4byte gUnknown_080E1738
_08091D74:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08091DE0
	ldr r2, _08091DCC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091DD0 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r3, _08091DD4 @ =gBldRegs
	ldr r0, _08091DD8 @ =0x00003FBF
	strh r0, [r3]
	ldr r2, _08091DDC @ =gUnknown_080E1738
	ldrb r0, [r5]
	adds r0, r0, r2
	ldrb r1, [r0]
	ldrh r0, [r3, #4]
	subs r0, r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r5]
	adds r2, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2]
	cmp r0, r2
	bhi _08091E50
	adds r0, r1, #1
	strb r0, [r5]
	b _08091E50
	.align 2, 0
_08091DCC: .4byte gDispCnt
_08091DD0: .4byte gWinRegs
_08091DD4: .4byte gBldRegs
_08091DD8: .4byte 0x00003FBF
_08091DDC: .4byte gUnknown_080E1738
_08091DE0:
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, #0xa
	bne _08091E48
	adds r0, r4, #0
	bl sub_80928C8
	ldr r2, _08091E38 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091E3C @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _08091E40 @ =gBldRegs
	ldr r0, _08091E44 @ =0x00003FBF
	strh r0, [r1]
	ldrh r0, [r1, #4]
	subs r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08091E50
_08091E2E:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08091E50
	.align 2, 0
_08091E38: .4byte gDispCnt
_08091E3C: .4byte gWinRegs
_08091E40: .4byte gBldRegs
_08091E44: .4byte 0x00003FBF
_08091E48:
	ldr r0, _08091E58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08091E5C @ =sub_8091E60
	str r0, [r1, #8]
_08091E50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091E58: .4byte gCurTask
_08091E5C: .4byte sub_8091E60

	thumb_func_start sub_8091E60
sub_8091E60: @ 0x08091E60
	push {r4, r5, r6, lr}
	ldr r6, _08091ED0 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, _08091ED4 @ =IWRAM_START + 0x350
	adds r1, r5, r0
	movs r0, #0x50
	strh r0, [r1, #6]
	movs r0, #1
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	adds r0, r4, #0
	bl sub_809289C
	ldr r4, _08091ED8 @ =IWRAM_START + 0x36C
	adds r1, r5, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091EEC
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x27
	bls _08091F5E
	ldr r0, _08091EDC @ =IWRAM_START + 0x36E
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _08091EE0
	subs r0, #1
	strh r0, [r4]
	b _08091F5E
	.align 2, 0
_08091ED0: .4byte gCurTask
_08091ED4: .4byte IWRAM_START + 0x350
_08091ED8: .4byte IWRAM_START + 0x36C
_08091EDC: .4byte IWRAM_START + 0x36E
_08091EE0:
	bl Random
	movs r1, #0xf
	ands r1, r0
	strh r1, [r4]
	b _08091F5E
_08091EEC:
	ldr r3, _08091F30 @ =gBldRegs
	ldrh r0, [r3, #4]
	cmp r0, #0xf
	bhi _08091F44
	ldr r2, _08091F34 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _08091F38 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r2]
	movs r0, #0xf0
	strh r0, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0x3f
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0xa]
	ldr r0, _08091F3C @ =0x00003FBF
	strh r0, [r3]
	ldr r0, _08091F40 @ =IWRAM_START + 0x374
	adds r1, r5, r0
	ldr r0, [r1]
	adds r0, #0x20
	str r0, [r1]
	asrs r0, r0, #8
	strh r0, [r3, #4]
	b _08091F5E
	.align 2, 0
_08091F30: .4byte gBldRegs
_08091F34: .4byte gDispCnt
_08091F38: .4byte gWinRegs
_08091F3C: .4byte 0x00003FBF
_08091F40: .4byte IWRAM_START + 0x374
_08091F44:
	ldr r4, _08091F54 @ =IWRAM_START + 0x36E
	adds r1, r5, r4
	ldrh r0, [r1]
	cmp r0, #0x63
	bhi _08091F58
	adds r0, #1
	strh r0, [r1]
	b _08091F5E
	.align 2, 0
_08091F54: .4byte IWRAM_START + 0x36E
_08091F58:
	ldr r1, [r6]
	ldr r0, _08091F64 @ =sub_80927E8
	str r0, [r1, #8]
_08091F5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091F64: .4byte sub_80927E8

	thumb_func_start sub_8091F68
sub_8091F68: @ 0x08091F68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #1
	ldr r0, _08091F80 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0x37
	bgt _08091F88
	ldr r6, _08091F84 @ =0x00000474
	adds r2, r4, r6
	b _08091F90
	.align 2, 0
_08091F80: .4byte gBgScrollRegs
_08091F84: .4byte 0x00000474
_08091F88:
	cmp r1, #0x5f
	bgt _08091FAA
	ldr r0, _08092024 @ =0x00000474
	adds r2, r4, r0
_08091F90:
	ldr r1, _08092028 @ =gUnknown_080E1752
	movs r6, #0xd9
	lsls r6, r6, #2
	adds r0, r4, r6
	ldrb r0, [r0]
	adds r0, r0, r1
	adds r1, r5, #0
	ldrb r0, [r0]
	lsls r1, r0
	lsls r1, r1, #1
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08091FAA:
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0x87
	bgt _08092008
	movs r2, #0xd7
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08092014
	ldr r6, _08092024 @ =0x00000474
	adds r0, r4, r6
	ldr r2, [r0]
	cmp r2, #0
	ble _08091FE8
	ldrh r1, [r3, #6]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08091FE8
	asrs r1, r2, #8
	movs r2, #6
	ldrsh r0, [r3, r2]
	cmp r1, r0
	ble _08091FE8
	movs r3, #0xd9
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08091FE8:
	movs r6, #0x8e
	lsls r6, r6, #3
	adds r2, r4, r6
	ldr r1, _0809202C @ =gUnknown_080E1742
	movs r3, #0xd9
	lsls r3, r3, #2
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #1
	ldrb r0, [r0]
	lsls r1, r0
	lsls r1, r5
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08092008:
	movs r6, #0xd7
	lsls r6, r6, #2
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #9
	bls _08092034
_08092014:
	ldr r0, _08092030 @ =gBgScrollRegs
	ldrh r1, [r0, #6]
	strh r1, [r0, #2]
	movs r1, #0
	movs r2, #2
	bl sub_808E8F8
	b _08092042
	.align 2, 0
_08092024: .4byte 0x00000474
_08092028: .4byte gUnknown_080E1752
_0809202C: .4byte gUnknown_080E1742
_08092030: .4byte gBgScrollRegs
_08092034:
	ldr r1, _08092054 @ =gBgScrollRegs
	movs r2, #0x8e
	lsls r2, r2, #3
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #2]
_08092042:
	ldr r1, _08092054 @ =gBgScrollRegs
	ldr r3, _08092058 @ =0x00000474
	adds r0, r4, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092054: .4byte gBgScrollRegs
_08092058: .4byte 0x00000474

	thumb_func_start sub_809205C
sub_809205C: @ 0x0809205C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r0, r0, r7
	mov r8, r0
	movs r1, #1
	mov sb, r1
_08092074:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r4, r0, #2
	movs r1, #0xff
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r5, r0, r4
	ldr r1, [r5]
	ldr r0, _080920E0 @ =0xFFFFA600
	cmp r1, r0
	bge _080920BC
	movs r0, #0xe6
	lsls r0, r0, #8
	str r0, [r5]
	bl Random
	mov r1, r8
	adds r2, r1, r4
	mov r1, sb
	ands r1, r0
	adds r1, #0xc
	mov r0, sb
	lsls r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2]
	bl Random
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r2, r7, r1
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
_080920BC:
	mov r0, r8
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #9
	bls _08092074
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920E0: .4byte 0xFFFFA600

	thumb_func_start sub_80920E4
sub_80920E4: @ 0x080920E4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0xd7
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #9
	bls _08092130
	movs r2, #0xdb
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0x28
	bhi _0809215C
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r0, [r1]
	movs r1, #0x28
	subs r1, r1, r0
	lsls r1, r1, #3
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xea
	lsls r1, r1, #2
	adds r4, r5, r1
	adds r0, r4, #0
	movs r1, #0x52
	movs r2, #2
	bl sub_808E8F8
	movs r2, #0xed
	lsls r2, r2, #2
	adds r1, r5, r2
	ldr r0, [r4]
	str r0, [r1]
	b _080921CC
_08092130:
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r2, r5, r0
	ldr r1, [r2]
	ldr r0, _08092158 @ =0x00004FFF
	cmp r1, r0
	bgt _08092144
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r2]
_08092144:
	movs r1, #0xea
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x52
	str r1, [r0]
	movs r2, #0xed
	lsls r2, r2, #2
	adds r0, r5, r2
	str r1, [r0]
	b _08092176
	.align 2, 0
_08092158: .4byte 0x00004FFF
_0809215C:
	movs r0, #0xea
	lsls r0, r0, #2
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #0x52
	movs r2, #2
	bl sub_808E8F8
	movs r2, #0xed
	lsls r2, r2, #2
	adds r1, r5, r2
	ldr r0, [r4]
	str r0, [r1]
_08092176:
	movs r1, #0xeb
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _080921E4 @ =0x00004FFF
	cmp r1, r0
	ble _080921CC
	movs r0, #0x93
	lsls r0, r0, #3
	adds r2, r5, r0
	ldrb r0, [r2]
	cmp r0, #3
	beq _08092194
	cmp r0, #0
	bne _080921AA
_08092194:
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [r0]
	rsbs r1, r1, #0
	str r1, [r0]
	ldrb r0, [r2]
	cmp r0, #3
	bne _080921AA
	movs r0, #0
	strb r0, [r2]
_080921AA:
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r2, r5, r0
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [r0]
	lsls r1, r1, #7
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r2, #0x93
	lsls r2, r2, #3
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080921CC:
	movs r1, #0xee
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r2, #0xeb
	lsls r2, r2, #2
	adds r1, r5, r2
	ldr r1, [r1]
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921E4: .4byte 0x00004FFF

	thumb_func_start sub_80921E8
sub_80921E8: @ 0x080921E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0xf1
	lsls r1, r1, #2
	adds r1, r1, r7
	mov sl, r1
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r2, r2, r7
	mov sb, r2
_08092208:
	mov r3, sl
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r2, _08092270 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	cmp r0, #0xe3
	bgt _08092312
	ldr r1, _08092274 @ =0x0000035D
	adds r0, r7, r1
	mov r2, r8
	adds r6, r0, r2
	ldrb r0, [r6]
	cmp r0, #0
	beq _08092290
	lsls r4, r2, #3
	mov r3, sb
	adds r2, r3, r4
	mov r0, r8
	lsls r3, r0, #2
	ldr r1, _08092278 @ =0x0000047C
	adds r0, r7, r1
	adds r5, r0, r3
	ldr r0, [r2]
	ldr r1, [r5]
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, [r5]
	adds r0, #4
	str r0, [r5]
	ldrb r0, [r6]
	cmp r0, #1
	bne _08092250
	movs r0, #0
	str r0, [r5]
_08092250:
	ldrb r0, [r6]
	subs r1, r0, #1
	movs r2, #0
	strb r1, [r6]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	bhi _08092280
	ldr r2, _0809227C @ =0x00000365
	adds r0, r7, r2
	add r0, r8
	movs r1, #1
	strb r1, [r0]
	b _08092374
	.align 2, 0
_08092270: .4byte gBgScrollRegs
_08092274: .4byte 0x0000035D
_08092278: .4byte 0x0000047C
_0809227C: .4byte 0x00000365
_08092280:
	ldr r1, _0809228C @ =0x00000365
	adds r0, r7, r1
	add r0, r8
	strb r2, [r0]
	b _08092374
	.align 2, 0
_0809228C: .4byte 0x00000365
_08092290:
	bl Random
	movs r1, #0x3f
	ands r1, r0
	adds r1, #0x3c
	strb r1, [r6]
	bl Random
	mov r3, r8
	lsls r2, r3, #3
	movs r3, #0xde
	lsls r3, r3, #2
	adds r1, r7, r3
	adds r5, r1, r2
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r3, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	subs r0, #0xa
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r5]
	ldr r0, [r3]
	subs r0, #0xf
	adds r4, r2, #0
	cmp r1, r0
	bge _080922CA
	str r0, [r5]
_080922CA:
	ldr r0, [r3]
	subs r1, r0, #5
	ldr r0, [r5]
	cmp r0, r1
	bge _080922D6
	str r1, [r5]
_080922D6:
	ldr r2, _080922F8 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0x5f
	bgt _080922FC
	bl Random
	mov r1, sb
	adds r2, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	mov r3, sl
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r2]
	b _08092370
	.align 2, 0
_080922F8: .4byte gBgScrollRegs
_080922FC:
	bl Random
	mov r1, sb
	adds r2, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	mov r3, sl
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r2]
	b _08092370
_08092312:
	ldr r1, _08092348 @ =0x00000365
	adds r0, r7, r1
	mov r3, r8
	adds r2, r0, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809232E
	subs r1, #8
	adds r0, r7, r1
	add r0, r8
	movs r1, #0xf
	strb r1, [r0]
	movs r0, #1
	strb r0, [r2]
_0809232E:
	ldr r2, _0809234C @ =0x0000035D
	adds r0, r7, r2
	mov r3, r8
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08092350
	subs r0, #1
	strb r0, [r1]
	lsls r4, r3, #3
	lsls r3, r3, #2
	b _08092374
	.align 2, 0
_08092348: .4byte 0x00000365
_0809234C: .4byte 0x0000035D
_08092350:
	mov r0, r8
	lsls r2, r0, #3
	movs r3, #0xde
	lsls r3, r3, #2
	adds r1, r7, r3
	adds r1, r1, r2
	adds r3, #0x48
	adds r0, r7, r3
	ldr r0, [r0]
	str r0, [r1]
	mov r0, sb
	adds r1, r0, r2
	mov r3, sl
	ldr r0, [r3]
	str r0, [r1]
	adds r4, r2, #0
_08092370:
	mov r0, r8
	lsls r3, r0, #2
_08092374:
	movs r1, #0xde
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r7, r0
	ldr r1, _080923A8 @ =gUnknown_080E1782
	adds r1, r3, r1
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r2, #2
	bl sub_808E8F8
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #5
	bhi _0809239A
	b _08092208
_0809239A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080923A8: .4byte gUnknown_080E1782

	thumb_func_start sub_80923AC
sub_80923AC: @ 0x080923AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r4, r6, #0
	adds r4, #0x80
	movs r5, #0
	ldr r7, _0809267C @ =gUnknown_080E1650
	ldrb r1, [r7, #6]
	mov r8, r1
_080923CA:
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	mov r2, r8
	strb r2, [r0]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	movs r2, #0xfe
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _080923CA
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r5, r6, r0
	ldrb r0, [r5]
	cmp r0, #8
	bls _0809241A
	movs r1, #1
	str r1, [sp]
_0809241A:
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r7, _0809267C @ =gUnknown_080E1650
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	adds r2, #0x20
	adds r0, r6, r2
	strb r1, [r0]
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	movs r2, #0xf1
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrb r0, [r5]
	movs r1, #0x98
	lsls r1, r1, #1
	adds r1, r6, r1
	str r1, [sp, #8]
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r2, r6, r2
	str r2, [sp, #4]
	cmp r0, #9
	bhi _0809253C
	movs r5, #0
	mov r8, r7
_08092472:
	movs r1, #0xf1
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, _08092680 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	cmp r1, #0xe3
	bgt _080924D2
	movs r1, #1
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r4, r6, r0
	adds r1, #3
	lsls r1, r1, #3
	add r1, r8
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r1, r5, #3
	movs r2, #0xde
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080924D2:
	ldr r1, _08092684 @ =0x00000365
	adds r0, r6, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08092532
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r4, r6, r0
	mov r1, r8
	ldrh r0, [r1, #0x14]
	movs r7, #0
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r1, r5, #3
	movs r2, #0xf2
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #1
	beq _0809252C
	strh r7, [r4, #0x14]
	strh r7, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _08092688 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_0809252C:
	adds r0, r4, #0
	bl sub_80051E8
_08092532:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08092472
_0809253C:
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _0809254E
	movs r1, #1
	str r1, [sp]
_0809254E:
	movs r2, #0x88
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r0, _0809267C @ =gUnknown_080E1650
	mov sl, r0
	ldr r1, _0809268C @ =gSelectedCharacter
	mov r8, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r1, #7
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #8]
	strb r0, [r1]
	movs r2, #0xea
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	movs r1, #0xeb
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	mov r2, sb
	ldrb r0, [r2]
	cmp r0, #0xa
	bls _080925B2
	movs r0, #1
	str r0, [sp]
_080925B2:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r4, r6, r1
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r1, #0x11
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r2, #0xed
	lsls r2, r2, #2
	adds r7, r6, r2
	ldr r0, [r7]
	strh r0, [r4, #0x16]
	movs r0, #0xee
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0809263C
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r0, [sp]
	adds r0, #0x1b
	lsls r0, r0, #3
	add r0, sl
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	adds r2, #0x20
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, [r7]
	strh r0, [r4, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0809263C:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0xa
	bls _0809266A
	movs r5, #0
_08092646:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0xb0
	adds r0, r6, r0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08092646
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r1, r6, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0809266A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809267C: .4byte gUnknown_080E1650
_08092680: .4byte gBgScrollRegs
_08092684: .4byte 0x00000365
_08092688: .4byte 0xFFFFBFFF
_0809268C: .4byte gSelectedCharacter

	thumb_func_start sub_8092690
sub_8092690: @ 0x08092690
	push {r4, r5, r6, r7, lr}
	ldr r7, _080926F4 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	ldr r0, _080926F8 @ =IWRAM_START + 0x350
	adds r5, r6, r0
	movs r0, #2
	strh r0, [r5, #2]
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809270A
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, _080926FC @ =IWRAM_START + 0x35C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08092704
	ldr r1, [r7]
	ldr r0, _08092700 @ =sub_8092780
	b _08092708
	.align 2, 0
_080926F4: .4byte gCurTask
_080926F8: .4byte IWRAM_START + 0x350
_080926FC: .4byte IWRAM_START + 0x35C
_08092700: .4byte sub_8092780
_08092704:
	ldr r1, [r7]
	ldr r0, _08092710 @ =sub_8091CB0
_08092708:
	str r0, [r1, #8]
_0809270A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092710: .4byte sub_8091CB0

	thumb_func_start sub_8092714
sub_8092714: @ 0x08092714
	push {r4, r5, r6, lr}
	ldr r6, _08092774 @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08092778 @ =IWRAM_START + 0x350
	adds r5, r0, r1
	movs r0, #1
	strh r0, [r5, #2]
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809276C
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _0809277C @ =sub_8091CB0
	str r0, [r1, #8]
_0809276C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092774: .4byte gCurTask
_08092778: .4byte IWRAM_START + 0x350
_0809277C: .4byte sub_8091CB0

	thumb_func_start sub_8092780
sub_8092780: @ 0x08092780
	push {r4, r5, r6, lr}
	ldr r6, _080927D8 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	ldr r0, _080927DC @ =IWRAM_START + 0x3C4
	adds r5, r5, r0
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, _080927E0 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	cmp r0, #0xdb
	ble _080927D2
	ldr r1, [r6]
	ldr r0, _080927E4 @ =sub_8091CB0
	str r0, [r1, #8]
_080927D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080927D8: .4byte gCurTask
_080927DC: .4byte IWRAM_START + 0x3C4
_080927E0: .4byte gBgScrollRegs
_080927E4: .4byte sub_8091CB0

	thumb_func_start sub_80927E8
sub_80927E8: @ 0x080927E8
	push {r4, lr}
	ldr r4, _080927FC @ =gCurTask
	bl sub_80928F8
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080927FC: .4byte gCurTask

	thumb_func_start sub_8092800
sub_8092800: @ 0x08092800
	bx lr
	.align 2, 0

	thumb_func_start sub_8092804
sub_8092804: @ 0x08092804
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r2, #0xd7
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08092844
	movs r5, #0xf0
	lsls r5, r5, #2
	adds r4, r1, r5
	movs r0, #0xd2
	str r0, [r4]
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r3, r1, r0
	ldr r2, [r3]
	asrs r0, r2, #8
	ldr r1, _0809284C @ =gBgScrollRegs
	movs r5, #6
	ldrsh r1, [r1, r5]
	adds r0, r0, r1
	cmp r0, #0xe6
	bgt _0809283A
	adds r0, r2, #0
	adds r0, #0x20
	str r0, [r3]
_0809283A:
	adds r0, r4, #0
	movs r1, #0xd2
	movs r2, #1
	bl sub_808E8F8
_08092844:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809284C: .4byte gBgScrollRegs

	thumb_func_start sub_8092850
sub_8092850: @ 0x08092850
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r1, _08092898 @ =0x00000365
	adds r1, r1, r0
	mov ip, r1
	movs r1, #0xf2
	lsls r1, r1, #2
	adds r7, r0, r1
	subs r1, #0x50
	adds r6, r0, r1
	adds r1, #0x54
	adds r5, r0, r1
	subs r1, #0x50
	adds r4, r0, r1
_0809286C:
	mov r1, ip
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08092888
	lsls r1, r3, #3
	adds r2, r7, r1
	adds r0, r6, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r2, r5, r1
	adds r1, r4, r1
	ldr r0, [r1]
	str r0, [r2]
_08092888:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _0809286C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092898: .4byte 0x00000365

	thumb_func_start sub_809289C
sub_809289C: @ 0x0809289C
	push {lr}
	ldr r0, _080928B8 @ =0x05000300
	ldr r1, _080928BC @ =0x05000100
	movs r2, #1
	bl CpuFastSet
	ldr r0, _080928C0 @ =0x05000320
	ldr r1, _080928C4 @ =0x05000120
	movs r2, #1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080928B8: .4byte 0x05000300
_080928BC: .4byte 0x05000100
_080928C0: .4byte 0x05000320
_080928C4: .4byte 0x05000120

	thumb_func_start sub_80928C8
sub_80928C8: @ 0x080928C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080928F4 @ =gUnknown_080E1648
	ldrh r0, [r5, #6]
	movs r1, #0
	strh r0, [r4, #0x1c]
	strh r1, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	adds r4, #0x40
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x1c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080928F4: .4byte gUnknown_080E1648

@; CreateFinalEndingCutSceneLanding
	thumb_func_start sub_80928F8
sub_80928F8: @ 0x080928F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc4
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x24]
	ldr r1, _08092990 @ =gDispCnt
	movs r2, #0x9a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08092994 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08092998 @ =0x00009C03
	strh r0, [r1]
	ldr r0, _0809299C @ =0x00001806
	strh r0, [r1, #2]
	ldr r0, _080929A0 @ =gBgScrollRegs
	mov r3, sl
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	ldr r3, _080929A4 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _080929A8 @ =gUnknown_03002280
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
	ldr r0, _080929AC @ =sub_8093EDC
	ldr r1, _080929B0 @ =0x0000061C
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _080929B4 @ =sub_8093F9C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _080929B8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _080929BC @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080929C4
	movs r0, #2
	str r0, [sp, #0x24]
	ldr r1, _080929C0 @ =IWRAM_START + 0x33C
	adds r0, r2, r1
	strb r4, [r0]
	b _080929CC
	.align 2, 0
_08092990: .4byte gDispCnt
_08092994: .4byte gBgCntRegs
_08092998: .4byte 0x00009C03
_0809299C: .4byte 0x00001806
_080929A0: .4byte gBgScrollRegs
_080929A4: .4byte gUnknown_03004D80
_080929A8: .4byte gUnknown_03002280
_080929AC: .4byte sub_8093EDC
_080929B0: .4byte 0x0000061C
_080929B4: .4byte sub_8093F9C
_080929B8: .4byte gLoadedSaveGame
_080929BC: .4byte gSelectedCharacter
_080929C0: .4byte IWRAM_START + 0x33C
_080929C4:
	ldr r3, _08092A38 @ =IWRAM_START + 0x33C
	adds r1, r2, r3
	movs r0, #0xa
	strb r0, [r1]
_080929CC:
	movs r0, #0xce
	lsls r0, r0, #2
	add r0, sl
	movs r2, #0
	strb r2, [r0]
	ldr r1, _08092A3C @ =0x00000339
	add r1, sl
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08092A40 @ =0x0000033A
	add r0, sl
	strb r2, [r0]
	ldr r0, _08092A44 @ =0x00000342
	add r0, sl
	movs r3, #0
	strh r2, [r0]
	ldr r0, _08092A48 @ =0x00000346
	add r0, sl
	strh r2, [r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	add r0, sl
	strh r2, [r0]
	movs r1, #0xd0
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r1, _08092A4C @ =0x0000034A
	add r1, sl
	movs r0, #0x32
	strh r0, [r1]
	movs r1, #0xd1
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08092A50 @ =0x0000033D
	add r0, sl
	strb r3, [r0]
	ldr r0, _08092A54 @ =0x0000033E
	add r0, sl
	strb r3, [r0]
	ldr r0, _08092A58 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #1
	bne _08092A60
	ldr r0, _08092A5C @ =0x0000033B
	add r0, sl
	strb r1, [r0]
	b _08092A66
	.align 2, 0
_08092A38: .4byte IWRAM_START + 0x33C
_08092A3C: .4byte 0x00000339
_08092A40: .4byte 0x0000033A
_08092A44: .4byte 0x00000342
_08092A48: .4byte 0x00000346
_08092A4C: .4byte 0x0000034A
_08092A50: .4byte 0x0000033D
_08092A54: .4byte 0x0000033E
_08092A58: .4byte gSelectedCharacter
_08092A5C: .4byte 0x0000033B
_08092A60:
	ldr r0, _08092E2C @ =0x0000033B
	add r0, sl
	strb r3, [r0]
_08092A66:
	movs r5, #0
	mov r0, sl
	adds r0, #0x80
	str r0, [sp, #0x84]
	mov r1, sl
	adds r1, #0xa0
	str r1, [sp, #0x88]
	mov r2, sl
	adds r2, #0xa1
	str r2, [sp, #0x8c]
	mov r3, sl
	adds r3, #0xa2
	str r3, [sp, #0x90]
	adds r0, #0x25
	str r0, [sp, #0x94]
	adds r1, #0x10
	str r1, [sp, #0xa8]
	adds r2, #0x2f
	str r2, [sp, #0xac]
	adds r3, #0x2f
	str r3, [sp, #0xb0]
	adds r0, #0x2d
	str r0, [sp, #0xb4]
	adds r1, #0x25
	str r1, [sp, #0xb8]
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x48]
	ldr r3, _08092E30 @ =0x000001C1
	add r3, sl
	str r3, [sp, #0x4c]
	movs r0, #0xe1
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x50]
	ldr r1, _08092E34 @ =0x000001C5
	add r1, sl
	str r1, [sp, #0x54]
	movs r2, #0xf8
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x60]
	ldr r3, _08092E38 @ =0x000001F1
	add r3, sl
	str r3, [sp, #0x64]
	movs r0, #0xf9
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x68]
	ldr r1, _08092E3C @ =0x000001F5
	add r1, sl
	str r1, [sp, #0x6c]
	movs r2, #0x88
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x74]
	ldr r3, _08092E40 @ =0x00000221
	add r3, sl
	str r3, [sp, #0x78]
	ldr r0, _08092E44 @ =0x00000222
	add r0, sl
	str r0, [sp, #0x7c]
	ldr r1, _08092E48 @ =0x00000225
	add r1, sl
	str r1, [sp, #0x80]
	movs r2, #0x94
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x98]
	ldr r3, _08092E4C @ =0x00000251
	add r3, sl
	str r3, [sp, #0x9c]
	ldr r0, _08092E50 @ =0x00000252
	add r0, sl
	str r0, [sp, #0xa0]
	ldr r1, _08092E54 @ =0x00000255
	add r1, sl
	str r1, [sp, #0xa4]
	mov r2, sl
	adds r2, #0xe0
	str r2, [sp, #0xbc]
	movs r3, #0x80
	lsls r3, r3, #1
	add r3, sl
	str r3, [sp, #0x30]
	ldr r0, _08092E58 @ =0x00000101
	add r0, sl
	str r0, [sp, #0x34]
	movs r1, #0x81
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x38]
	ldr r2, _08092E5C @ =0x00000105
	add r2, sl
	str r2, [sp, #0x3c]
	mov r3, sl
	adds r3, #0x40
	str r3, [sp, #0x5c]
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x40]
	mov r1, sl
	adds r1, #0x6a
	str r1, [sp, #0x70]
	ldr r2, [sp, #0x24]
	lsls r2, r2, #1
	str r2, [sp, #0x44]
	subs r3, #0x16
	str r3, [sp, #0x58]
	movs r6, #0xd3
	lsls r6, r6, #2
	add r6, sl
	movs r7, #0
_08092B4A:
	movs r4, #0
	lsls r2, r5, #2
	adds r1, r2, #0
_08092B50:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r0, r6, r0
	str r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08092B50
	movs r4, #0
	ldr r1, _08092E60 @ =0x000004DC
	add r1, sl
	movs r3, #0
_08092B6E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r1, r0
	str r3, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xc
	bls _08092B6E
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08092B4A
	movs r5, #0
	movs r0, #0xbc
	lsls r0, r0, #3
	add r0, sl
	str r0, [sp, #0x28]
	movs r3, #0
	movs r1, #0xbd
	lsls r1, r1, #3
	add r1, sl
	mov ip, r1
	movs r2, #0xbe
	lsls r2, r2, #3
	add r2, sl
	mov sb, r2
	movs r0, #0xbf
	lsls r0, r0, #3
	add r0, sl
	mov r8, r0
	movs r7, #0xc0
	lsls r7, r7, #3
	add r7, sl
	movs r6, #0xc1
	lsls r6, r6, #3
	add r6, sl
	movs r4, #0xc2
	lsls r4, r4, #3
	add r4, sl
_08092BC4:
	lsls r1, r5, #2
	ldr r2, [sp, #0x28]
	adds r0, r2, r1
	str r3, [r0]
	mov r2, ip
	adds r0, r2, r1
	str r3, [r0]
	mov r2, sb
	adds r0, r2, r1
	str r3, [r0]
	mov r0, r8
	adds r2, r0, r1
	movs r0, #0xb4
	lsls r0, r0, #8
	str r0, [r2]
	adds r2, r7, r1
	movs r0, #0xc8
	lsls r0, r0, #8
	str r0, [r2]
	adds r0, r6, r1
	str r3, [r0]
	adds r1, r4, r1
	str r3, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08092BC4
	movs r4, #0
_08092BFE:
	bl Random
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #2
	ldr r2, _08092E60 @ =0x000004DC
	add r2, sl
	adds r2, r2, r1
	movs r1, #0x7f
	ands r1, r0
	str r1, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xc
	bls _08092BFE
	movs r7, #0xc3
	lsls r7, r7, #3
	add r7, sl
	ldr r0, _08092E64 @ =0x06010000
	str r0, [r7]
	movs r1, #0xcb
	lsls r1, r1, #2
	add r1, sl
	movs r2, #0
	mov sb, r2
	movs r0, #2
	strh r0, [r1, #2]
	movs r0, #1
	strh r0, [r1]
	mov r3, sb
	strh r3, [r1, #4]
	adds r0, #0xff
	strh r0, [r1, #6]
	ldr r0, _08092E68 @ =0x00003FBF
	strh r0, [r1, #8]
	ldr r1, _08092E6C @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _08092C52
	b _08092D64
_08092C52:
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r7]
	str r1, [r0, #4]
	ldr r1, [r7]
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r7]
	ldr r6, _08092E70 @ =gUnknown_080E17A4
	movs r3, #0x82
	lsls r3, r3, #1
	adds r1, r6, r3
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r2, #0x83
	lsls r2, r2, #1
	adds r1, r6, r2
	ldrb r2, [r1]
	movs r1, #0x98
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _08092E74 @ =0x00000131
	add r2, sl
	movs r1, #0xff
	strb r1, [r2]
	movs r1, #0xc8
	strh r1, [r0, #0x16]
	movs r1, #0x64
	strh r1, [r0, #0x18]
	movs r1, #0x80
	strh r1, [r0, #0x1a]
	mov r3, sb
	strh r3, [r0, #8]
	strh r3, [r0, #0x14]
	strh r3, [r0, #0x1c]
	adds r1, #0xb2
	add r1, sl
	movs r5, #0x10
	strb r5, [r1]
	ldr r2, _08092E78 @ =0x00000135
	add r2, sl
	movs r1, #1
	strb r1, [r2]
	mov r1, sb
	str r1, [r0, #0x10]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r0, #0x28]
	bl sub_8004558
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	ldr r0, [r7]
	str r0, [r1, #4]
	ldr r0, [r7]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [r7]
	adds r2, #0x41
	add r2, sl
	adds r0, r4, #0
	strb r0, [r2]
	movs r0, #0x6e
	strh r0, [r1, #0x16]
	ldr r0, _08092E7C @ =0x0000FFEC
	strh r0, [r1, #0x18]
	movs r3, #0x40
	strh r3, [r1, #0x1a]
	mov r0, sb
	strh r0, [r1, #8]
	strh r0, [r1, #0x14]
	strh r0, [r1, #0x1c]
	movs r0, #0xb1
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	ldr r0, _08092E80 @ =0x00000165
	add r0, sl
	movs r2, #0
	strb r2, [r0]
	mov r0, sb
	str r0, [r1, #0x10]
	str r4, [r1, #0x28]
	movs r0, #0xb8
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r7]
	str r1, [r0, #4]
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r1, r6, r2
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r7]
	adds r1, r1, r2
	str r1, [r7]
	movs r2, #0xc6
	lsls r2, r2, #1
	adds r1, r6, r2
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r2, #2
	adds r1, r6, r2
	ldrb r2, [r1]
	movs r1, #0xc8
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _08092E84 @ =0x00000191
	add r2, sl
	adds r1, r4, #0
	strb r1, [r2]
	mov r1, sb
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	strh r3, [r0, #0x1a]
	strh r1, [r0, #8]
	strh r1, [r0, #0x14]
	strh r1, [r0, #0x1c]
	movs r1, #0xc9
	lsls r1, r1, #1
	add r1, sl
	strb r5, [r1]
	ldr r2, _08092E88 @ =0x00000195
	add r2, sl
	movs r1, #2
	strb r1, [r2]
	mov r2, sb
	str r2, [r0, #0x10]
	str r4, [r0, #0x28]
	bl sub_8004558
_08092D64:
	ldr r0, [r7]
	ldr r3, [sp, #0x84]
	str r0, [r3, #4]
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r7]
	ldr r4, _08092E70 @ =gUnknown_080E17A4
	ldr r2, _08092E6C @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r3, #0xa]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	ldr r3, [sp, #0x88]
	strb r0, [r3]
	movs r0, #0xff
	ldr r1, [sp, #0x8c]
	strb r0, [r1]
	movs r0, #0x78
	ldr r2, [sp, #0x84]
	strh r0, [r2, #0x16]
	ldr r0, _08092E7C @ =0x0000FFEC
	strh r0, [r2, #0x18]
	movs r3, #0x40
	mov r8, r3
	mov r0, r8
	strh r0, [r2, #0x1a]
	mov r1, sb
	strh r1, [r2, #8]
	strh r1, [r2, #0x14]
	strh r1, [r2, #0x1c]
	movs r5, #0x10
	ldr r2, [sp, #0x90]
	strb r5, [r2]
	movs r0, #0
	ldr r3, [sp, #0x94]
	strb r0, [r3]
	mov r1, sb
	ldr r2, [sp, #0x84]
	str r1, [r2, #0x10]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r2, #0x28]
	ldr r0, [sp, #0x84]
	bl sub_8004558
	movs r2, #0xc8
	lsls r2, r2, #2
	add r2, sl
	ldr r0, [r7]
	ldr r3, [sp, #0xa8]
	str r0, [r3, #4]
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r7]
	ldr r3, _08092E6C @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #0x14
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	ldr r1, [sp, #0xa8]
	strh r0, [r1, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #0x14
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	ldr r3, [sp, #0xac]
	strb r0, [r3]
	adds r0, r6, #0
	ldr r1, [sp, #0xb0]
	strb r0, [r1]
	mov r0, sb
	ldr r3, [sp, #0xa8]
	strh r0, [r3, #0x16]
	strh r0, [r3, #0x18]
	mov r1, r8
	strh r1, [r3, #0x1a]
	strh r0, [r3, #8]
	strh r0, [r3, #0x14]
	strh r0, [r3, #0x1c]
	ldr r3, [sp, #0xb4]
	strb r5, [r3]
	movs r1, #0
	ldr r0, [sp, #0xb8]
	b _08092E8C
	.align 2, 0
_08092E2C: .4byte 0x0000033B
_08092E30: .4byte 0x000001C1
_08092E34: .4byte 0x000001C5
_08092E38: .4byte 0x000001F1
_08092E3C: .4byte 0x000001F5
_08092E40: .4byte 0x00000221
_08092E44: .4byte 0x00000222
_08092E48: .4byte 0x00000225
_08092E4C: .4byte 0x00000251
_08092E50: .4byte 0x00000252
_08092E54: .4byte 0x00000255
_08092E58: .4byte 0x00000101
_08092E5C: .4byte 0x00000105
_08092E60: .4byte 0x000004DC
_08092E64: .4byte 0x06010000
_08092E68: .4byte 0x00003FBF
_08092E6C: .4byte gSelectedCharacter
_08092E70: .4byte gUnknown_080E17A4
_08092E74: .4byte 0x00000131
_08092E78: .4byte 0x00000135
_08092E7C: .4byte 0x0000FFEC
_08092E80: .4byte 0x00000165
_08092E84: .4byte 0x00000191
_08092E88: .4byte 0x00000195
_08092E8C:
	strb r1, [r0]
	movs r0, #0x60
	ldr r3, [sp, #0xa8]
	str r0, [r3, #0x10]
	str r6, [r3, #0x28]
	mov r0, sb
	strh r0, [r2]
	movs r1, #0xd0
	lsls r1, r1, #2
	add r1, sl
	ldrh r0, [r1]
	strh r0, [r2, #2]
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldrh r0, [r3, #0x16]
	strh r0, [r2, #6]
	ldrh r0, [r3, #0x18]
	strh r0, [r2, #8]
	ldr r0, [sp, #0xa8]
	bl sub_8004558
	movs r5, #0
	movs r7, #0xc3
	lsls r7, r7, #3
	add r7, sl
	movs r6, #0
	movs r1, #0x93
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	mov sb, r0
	movs r2, #0x92
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrh r0, [r0]
	mov r8, r0
_08092ED4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r3, #0x98
	lsls r3, r3, #2
	adds r0, r0, r3
	mov r1, sl
	adds r2, r1, r0
	ldr r0, [r7]
	str r0, [r2, #4]
	adds r0, r5, #0
	adds r0, #0x24
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	mov r3, r8
	strh r3, [r2, #0xa]
	adds r0, r2, #0
	adds r0, #0x20
	mov r1, sb
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r6, [r2, #0x16]
	strh r6, [r2, #0x18]
	movs r0, #0xc0
	strh r0, [r2, #0x1a]
	strh r6, [r2, #8]
	strh r6, [r2, #0x14]
	strh r6, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	movs r3, #0
	strb r3, [r0]
	str r6, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08092ED4
	movs r5, #0
	movs r6, #0xc3
	lsls r6, r6, #3
	add r6, sl
	ldr r7, _08093294 @ =gUnknown_080E17A4
	movs r4, #0
	movs r1, #0x9b
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	add r2, sp, #0x2c
	strb r0, [r2]
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r0, [r0]
	mov r8, r0
_08092F64:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sl
	adds r2, r3, r0
	ldr r0, [r6]
	str r0, [r2, #4]
	adds r0, r5, #0
	adds r0, #0x26
	lsls r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r0, r8
	strh r0, [r2, #0xa]
	adds r0, r2, #0
	adds r0, #0x20
	add r1, sp, #0x2c
	ldrb r1, [r1]
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #0x1e
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	movs r0, #0xc0
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	adds r0, r2, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	str r4, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	str r3, [sp, #0xc0]
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0xc0]
	cmp r5, #1
	bls _08092F64
	movs r0, #0xd0
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0xc3
	lsls r4, r4, #3
	add r4, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	ldr r1, _08093294 @ =gUnknown_080E17A4
	mov r8, r1
	movs r1, #0x8c
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0x8e
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	movs r7, #0
	strh r1, [r0, #0xa]
	movs r1, #0x8f
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x48]
	strb r1, [r2]
	ldr r2, [sp, #0x4c]
	ldrb r1, [r2]
	mov r2, sb
	orrs r1, r2
	ldr r2, [sp, #0x4c]
	strb r1, [r2]
	strh r7, [r0, #0x16]
	strh r3, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0x50]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0x54]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0xe8
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0xa2
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r1, #0xa3
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x60]
	strb r1, [r2]
	ldr r3, [sp, #0x64]
	ldrb r1, [r3]
	mov r2, sb
	orrs r1, r2
	strb r1, [r3]
	movs r5, #0x78
	strh r5, [r0, #0x16]
	ldr r1, _08093298 @ =0x0000FFEC
	strh r1, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0x68]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0x6c]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	movs r1, #0xa4
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0xa6
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r1, #0xa7
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x74]
	strb r1, [r2]
	ldr r3, [sp, #0x78]
	ldrb r1, [r3]
	mov r2, sb
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, #0x16]
	movs r6, #0x80
	lsls r6, r6, #1
	strh r6, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0x7c]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0x80]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x8c
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0xaa
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r1, #0xab
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x98]
	strb r1, [r2]
	ldr r3, [sp, #0x9c]
	ldrb r1, [r3]
	mov r2, sb
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, #0x16]
	strh r6, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0xa0]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0xa4]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	ldr r0, [r4]
	ldr r2, [sp, #0xbc]
	str r0, [r2, #4]
	ldr r0, [r4]
	movs r3, #0xa8
	lsls r3, r3, #5
	adds r0, r0, r3
	str r0, [r4]
	ldr r6, _0809329C @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r0, #0x19
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #4]
	strh r0, [r2, #0xa]
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r0, #0x19
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0, #6]
	ldr r1, [sp, #0x30]
	strb r0, [r1]
	ldr r2, [sp, #0x34]
	ldrb r0, [r2]
	mov r3, sb
	orrs r0, r3
	strb r0, [r2]
	ldr r0, [sp, #0xbc]
	strh r5, [r0, #0x16]
	strh r7, [r0, #0x18]
	movs r0, #0x40
	ldr r1, [sp, #0xbc]
	strh r0, [r1, #0x1a]
	strh r7, [r1, #8]
	strh r7, [r1, #0x14]
	strh r7, [r1, #0x1c]
	movs r3, #0x10
	ldr r2, [sp, #0x38]
	strb r3, [r2]
	movs r0, #1
	mov r8, r0
	mov r2, r8
	ldr r1, [sp, #0x3c]
	strb r2, [r1]
	ldr r3, [sp, #0xbc]
	str r7, [r3, #0x10]
	subs r0, #2
	str r0, [r3, #0x28]
	ldr r0, [sp, #0xbc]
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	ldr r1, [sp, #0x5c]
	str r0, [r1, #4]
	strh r7, [r1, #0xa]
	ldr r0, _080932A0 @ =0x0600E000
	str r0, [r1, #0xc]
	strh r7, [r1, #0x18]
	strh r7, [r1, #0x1a]
	ldr r5, _080932A4 @ =gUnknown_080E179C
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	strh r7, [r1, #0x1e]
	strh r7, [r1, #0x20]
	strh r7, [r1, #0x22]
	strh r7, [r1, #0x24]
	movs r4, #0x20
	strh r4, [r1, #0x26]
	strh r4, [r1, #0x28]
	movs r0, #0
	ldr r3, [sp, #0x70]
	strb r0, [r3]
	strh r7, [r1, #0x2e]
	ldr r0, [sp, #0x5c]
	bl sub_8002A3C
	ldr r1, [sp, #0x24]
	cmp r1, #2
	bne _0809321E
	ldr r1, _080932A8 @ =gBgScrollRegs
	movs r0, #8
	strh r0, [r1, #4]
_0809321E:
	ldr r0, _080932AC @ =0x06004000
	mov r2, sl
	str r0, [r2, #4]
	strh r7, [r2, #0xa]
	ldr r0, _080932B0 @ =0x0600C000
	str r0, [r2, #0xc]
	strh r7, [r2, #0x18]
	strh r7, [r2, #0x1a]
	ldr r3, [sp, #0x44]
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	strh r7, [r2, #0x1e]
	strh r7, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r7, [r2, #0x24]
	strh r4, [r2, #0x26]
	strh r4, [r2, #0x28]
	movs r1, #0
	ldr r0, [sp, #0x58]
	strb r1, [r0]
	mov r3, r8
	strh r3, [r2, #0x2e]
	mov r0, sl
	bl sub_8002A3C
	ldr r0, _080932B4 @ =gLoadedSaveGame
	ldr r0, [r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08093282
	ldr r1, _080932B8 @ =gUnknown_080E1AF4
	add r0, sp, #4
	movs r2, #0x20
	bl memcpy
	ldr r1, _080932BC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _080932C0 @ =IWRAM_START + 0x28C0
	str r0, [r1, #4]
	ldr r0, _080932C4 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08093282:
	add sp, #0xc4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093294: .4byte gUnknown_080E17A4
_08093298: .4byte 0x0000FFEC
_0809329C: .4byte gSelectedCharacter
_080932A0: .4byte 0x0600E000
_080932A4: .4byte gUnknown_080E179C
_080932A8: .4byte gBgScrollRegs
_080932AC: .4byte 0x06004000
_080932B0: .4byte 0x0600C000
_080932B4: .4byte gLoadedSaveGame
_080932B8: .4byte gUnknown_080E1AF4
_080932BC: .4byte 0x040000D4
_080932C0: .4byte IWRAM_START + 0x28C0
_080932C4: .4byte 0x84000008

	thumb_func_start sub_80932C8
sub_80932C8: @ 0x080932C8
	push {r4, r5, r6, lr}
	ldr r6, _0809333C @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08093340 @ =IWRAM_START + 0x32C
	adds r5, r0, r1
	movs r0, #1
	strh r0, [r5, #2]
	ldr r0, _08093344 @ =0x00003FFF
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl sub_8093FA0
	adds r0, r4, #0
	bl sub_8093FF0
	adds r0, r4, #0
	bl sub_80934B8
	adds r0, r4, #0
	bl sub_8093638
	adds r0, r4, #0
	bl sub_8093740
	adds r0, r4, #0
	bl sub_809401C
	adds r0, r4, #0
	bl sub_8094044
	adds r0, r4, #0
	bl sub_8094060
	adds r0, r4, #0
	bl sub_80940BC
	adds r0, r4, #0
	bl sub_8093868
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08093336
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _08093348 @ =sub_8093F54
	str r0, [r1, #8]
_08093336:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809333C: .4byte gCurTask
_08093340: .4byte IWRAM_START + 0x32C
_08093344: .4byte 0x00003FFF
_08093348: .4byte sub_8093F54

	thumb_func_start sub_809334C
sub_809334C: @ 0x0809334C
	push {r4, r5, r6, lr}
	ldr r0, _0809340C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8093FA0
	adds r0, r5, #0
	bl sub_8093FF0
	adds r0, r5, #0
	bl sub_80934B8
	adds r0, r5, #0
	bl sub_8093638
	adds r0, r5, #0
	bl sub_8093740
	adds r0, r5, #0
	bl sub_809401C
	adds r0, r5, #0
	bl sub_8094044
	adds r0, r5, #0
	bl sub_8094060
	adds r0, r5, #0
	bl sub_80940BC
	adds r0, r5, #0
	bl sub_8093868
	ldr r0, _08093410 @ =IWRAM_START + 0x5E4
	adds r3, r4, r0
	ldr r2, _08093414 @ =gUnknown_080E1944
	ldr r1, _08093418 @ =IWRAM_START + 0x338
	adds r0, r4, r1
	ldrb r6, [r0]
	lsls r0, r6, #1
	adds r1, #3
	adds r4, r4, r1
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _0809341C @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3]
	cmp r1, r0
	beq _080933D4
	adds r1, r4, #0
	cmp r1, #0
	bne _080933CC
	cmp r6, #3
	bhi _080933D4
_080933CC:
	cmp r1, #1
	bne _080934A8
	cmp r6, #4
	bls _080934A8
_080933D4:
	ldr r1, _08093420 @ =0x0000033B
	adds r0, r5, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080933EA
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #5
	bls _080933FA
_080933EA:
	cmp r1, #1
	bne _080934A0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #6
	bhi _080934A0
_080933FA:
	ldr r2, _08093424 @ =0x00000342
	adds r6, r5, r2
	ldrh r0, [r6]
	cmp r0, #0
	beq _08093428
	subs r0, #1
	strh r0, [r6]
	b _080934A8
	.align 2, 0
_0809340C: .4byte gCurTask
_08093410: .4byte IWRAM_START + 0x5E4
_08093414: .4byte gUnknown_080E1944
_08093418: .4byte IWRAM_START + 0x338
_0809341C: .4byte gBgScrollRegs
_08093420: .4byte 0x0000033B
_08093424: .4byte 0x00000342
_08093428:
	ldr r3, _08093464 @ =gUnknown_080E1B14
	movs r0, #0xce
	lsls r0, r0, #2
	adds r2, r5, r0
	ldr r1, _08093468 @ =0x0000033B
	adds r4, r5, r1
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	ldrb r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6]
	ldrb r3, [r2]
	adds r1, r3, #1
	strb r1, [r2]
	ldrb r0, [r4]
	cmp r0, #0
	beq _080934A8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08093470
	ldr r2, _0809346C @ =0x0000033A
	adds r0, r5, r2
	strb r1, [r0]
	b _080934A8
	.align 2, 0
_08093464: .4byte gUnknown_080E1B14
_08093468: .4byte 0x0000033B
_0809346C: .4byte 0x0000033A
_08093470:
	subs r0, r3, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0809348C
	ldr r0, _08093488 @ =0x0000033A
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080934A8
	.align 2, 0
_08093488: .4byte 0x0000033A
_0809348C:
	cmp r1, #4
	bls _080934A8
	ldr r2, _0809349C @ =0x0000033A
	adds r1, r5, r2
	movs r0, #4
	strb r0, [r1]
	b _080934A8
	.align 2, 0
_0809349C: .4byte 0x0000033A
_080934A0:
	ldr r0, _080934B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080934B4 @ =sub_80932C8
	str r0, [r1, #8]
_080934A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080934B0: .4byte gCurTask
_080934B4: .4byte sub_80932C8

	thumb_func_start sub_80934B8
sub_80934B8: @ 0x080934B8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08093500 @ =0x000005E4
	adds r6, r4, r0
	ldr r3, _08093504 @ =gUnknown_080E1944
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r5, [r0]
	lsls r1, r5, #1
	ldr r2, _08093508 @ =0x0000033B
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	ldr r2, _0809350C @ =gBgScrollRegs
	movs r7, #6
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6]
	adds r7, r2, #0
	cmp r1, r0
	bge _08093510
	cmp r5, #0
	bne _08093518
	movs r2, #0xc8
	lsls r2, r2, #2
	adds r0, r1, r2
	str r0, [r6]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r1, r4, r3
	b _08093624
	.align 2, 0
_08093500: .4byte 0x000005E4
_08093504: .4byte gUnknown_080E1944
_08093508: .4byte 0x0000033B
_0809350C: .4byte gBgScrollRegs
_08093510:
	cmp r5, #0
	bne _08093518
	str r0, [r6]
	b _0809361E
_08093518:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
	cmp r1, #1
	bne _08093530
	ldr r5, _0809352C @ =0x000005E4
	adds r2, r4, r5
	b _08093604
	.align 2, 0
_0809352C: .4byte 0x000005E4
_08093530:
	ldr r0, _08093544 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08093548
	cmp r1, #5
	beq _0809354C
	b _080935F8
	.align 2, 0
_08093544: .4byte gSelectedCharacter
_08093548:
	cmp r1, #4
	bne _080935F8
_0809354C:
	ldr r7, _080935B8 @ =0x00000342
	adds r0, r4, r7
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093596
	ldr r0, _080935BC @ =0x0000033E
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0x22
	bhi _08093568
	adds r0, #1
	strb r0, [r3]
_08093568:
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r2, r4, r1
	ldr r1, _080935C0 @ =gUnknown_080E1B30
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r5, #0xf0
	lsls r5, r5, #7
	adds r0, r0, r5
	str r0, [r2]
	ldr r7, _080935C4 @ =0x000005E4
	adds r2, r4, r7
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r2]
_08093596:
	ldr r2, _080935B8 @ =0x00000342
	adds r0, r4, r2
	ldrh r0, [r0]
	cmp r0, #0x31
	bhi _080935C8
	movs r3, #0xd0
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	movs r5, #0xc8
	lsls r5, r5, #2
	adds r1, r4, r5
	ldrh r0, [r1]
	adds r0, #3
	b _080935DE
	.align 2, 0
_080935B8: .4byte 0x00000342
_080935BC: .4byte 0x0000033E
_080935C0: .4byte gUnknown_080E1B30
_080935C4: .4byte 0x000005E4
_080935C8:
	movs r7, #0xd0
	lsls r7, r7, #2
	adds r1, r4, r7
	ldrh r0, [r1]
	adds r0, #8
	strh r0, [r1]
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #0x14
_080935DE:
	strh r0, [r1]
	ldr r1, _080935F4 @ =0x00000342
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, #1
	bne _0809362A
	movs r0, #0xd4
	bl m4aSongNumStart
	b _0809362A
	.align 2, 0
_080935F4: .4byte 0x00000342
_080935F8:
	ldr r5, _08093630 @ =0x000005E4
	adds r2, r4, r5
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
_08093604:
	lsls r1, r1, #1
	ldr r5, _08093634 @ =0x0000033B
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	movs r3, #6
	ldrsh r1, [r7, r3]
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2]
_0809361E:
	movs r5, #0xbc
	lsls r5, r5, #3
	adds r1, r4, r5
_08093624:
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
_0809362A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093630: .4byte 0x000005E4
_08093634: .4byte 0x0000033B

	thumb_func_start sub_8093638
sub_8093638: @ 0x08093638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	movs r6, #0
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r6, r0
	bge _08093728
	movs r0, #0xd5
	lsls r0, r0, #2
	add r0, ip
	mov r8, r0
	movs r7, #0xd7
	lsls r7, r7, #2
	add r7, ip
	ldr r1, _0809369C @ =gSineTable
	mov sl, r1
	mov sb, r6
	movs r2, #0xd3
	lsls r2, r2, #2
	add r2, ip
	str r2, [sp]
_08093674:
	lsls r3, r6, #2
	adds r0, r3, r6
	lsls r4, r0, #2
	mov r0, r8
	adds r2, r0, r4
	ldr r1, _080936A0 @ =gUnknown_080E1964
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bhi _080936A4
	adds r0, r7, r4
	mov r2, sb
	str r2, [r0]
	b _080936AA
	.align 2, 0
_0809369C: .4byte gSineTable
_080936A0: .4byte gUnknown_080E1964
_080936A4:
	adds r1, r7, r4
	movs r0, #1
	str r0, [r1]
_080936AA:
	adds r0, r3, r6
	lsls r3, r0, #2
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	ldr r5, _08093738 @ =0x0003FFFF
	cmp r0, r5
	ble _080936BE
	mov r1, sb
	str r1, [r2]
_080936BE:
	ldr r0, [sp]
	adds r1, r0, r3
	ldr r0, [r2]
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	movs r0, #0xd6
	lsls r0, r0, #2
	add r0, ip
	adds r4, r0, r3
	ldr r1, _0809373C @ =gUnknown_080E1968
	adds r0, r3, r1
	ldr r1, [r0]
	lsls r1, r1, #3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	cmp r0, r5
	ble _080936F4
	mov r2, sb
	str r2, [r4]
_080936F4:
	movs r2, #0xd4
	lsls r2, r2, #2
	add r2, ip
	adds r2, r2, r3
	ldr r0, [r4]
	asrs r0, r0, #8
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r6, r0
	blt _08093674
_08093728:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093738: .4byte 0x0003FFFF
_0809373C: .4byte gUnknown_080E1968

	thumb_func_start sub_8093740
sub_8093740: @ 0x08093740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	movs r5, #0
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r5, r0
	bge _0809384E
	movs r0, #0x9c
	lsls r0, r0, #3
	add r0, ip
	mov r8, r0
	ldr r1, _080937B4 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r1, r2]
	movs r3, #0xbe
	mov sl, r3
	subs r0, r3, r0
	lsls r0, r0, #8
	str r0, [sp]
	ldr r4, _080937B8 @ =gUnknown_030053B8
	mov sb, r4
	ldr r6, _080937BC @ =0x000004EC
	add r6, ip
	ldr r7, _080937C0 @ =0x000004DC
	add r7, ip
_08093786:
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r2, r0, #2
	mov r3, r8
	adds r0, r3, r2
	ldr r0, [r0]
	adds r4, r1, #0
	ldr r1, [sp]
	cmp r0, r1
	bne _080937D2
	mov r3, sb
	ldr r1, [r3]
	ldr r0, _080937C4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080937C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	cmp r0, #0
	bge _080937CC
	adds r1, r6, r2
	movs r0, #1
	rsbs r0, r0, #0
	b _080937D0
	.align 2, 0
_080937B4: .4byte gBgScrollRegs
_080937B8: .4byte gUnknown_030053B8
_080937BC: .4byte 0x000004EC
_080937C0: .4byte 0x000004DC
_080937C4: .4byte 0x00196225
_080937C8: .4byte 0x3C6EF35F
_080937CC:
	adds r1, r6, r2
	movs r0, #1
_080937D0:
	str r0, [r1]
_080937D2:
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r2, r7, r0
	adds r0, r6, r0
	ldr r0, [r0]
	lsls r0, r0, #7
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #9
	cmp r1, r3
	ble _080937F4
	movs r0, #0xa
	rsbs r0, r0, #0
	str r0, [r2]
	b _080937FE
_080937F4:
	movs r0, #0xa
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080937FE
	str r3, [r2]
_080937FE:
	adds r1, r4, r5
	lsls r1, r1, #2
	mov r2, r8
	adds r3, r2, r1
	ldr r4, _08093860 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r4, r2]
	mov r4, sl
	subs r0, r4, r0
	lsls r2, r0, #8
	adds r1, r7, r1
	ldr r0, [r1]
	asrs r0, r0, #7
	lsls r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, _08093864 @ =gSineTable
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _08093830
	rsbs r0, r0, #0
_08093830:
	lsls r0, r0, #3
	subs r0, r2, r0
	str r0, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r5, r0
	blt _08093786
_0809384E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093860: .4byte gBgScrollRegs
_08093864: .4byte gSineTable

	thumb_func_start sub_8093868
sub_8093868: @ 0x08093868
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r0, r0, r5
	mov ip, r0
	ldr r0, _08093894 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #1
	bne _08093898
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #4
	bls _080938A4
	b _08093970
	.align 2, 0
_08093894: .4byte gSelectedCharacter
_08093898:
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0809394E
_080938A4:
	adds r6, r5, #0
	adds r6, #0x80
	movs r3, #0xce
	lsls r3, r3, #2
	adds r4, r5, r3
	ldrb r1, [r4]
	cmp r1, #2
	bhi _080938C4
	ldr r3, _080938BC @ =gUnknown_080E17A4
	ldr r2, _080938C0 @ =gUnknown_080E1C48
	b _0809390E
	.align 2, 0
_080938BC: .4byte gUnknown_080E17A4
_080938C0: .4byte gUnknown_080E1C48
_080938C4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	bne _08093908
	cmp r1, #4
	bhi _080938F8
	ldr r2, _080938F0 @ =gUnknown_080E17A4
	ldr r1, _080938F4 @ =gUnknown_080E1C4E
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	b _08093930
	.align 2, 0
_080938F0: .4byte gUnknown_080E17A4
_080938F4: .4byte gUnknown_080E1C4E
_080938F8:
	ldr r3, _08093900 @ =gUnknown_080E17A4
	ldr r2, _08093904 @ =gUnknown_080E1C4E
	b _0809390C
	.align 2, 0
_08093900: .4byte gUnknown_080E17A4
_08093904: .4byte gUnknown_080E1C4E
_08093908:
	ldr r3, _08093964 @ =gUnknown_080E17A4
	ldr r2, _08093968 @ =gUnknown_080E1C48
_0809390C:
	ldrb r1, [r4]
_0809390E:
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r4]
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
_08093930:
	ldrb r1, [r0, #6]
	adds r0, r5, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r2, _0809396C @ =0x000005E4
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
_0809394E:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	beq _08093970
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	beq _0809397C
	b _080939B6
	.align 2, 0
_08093964: .4byte gUnknown_080E17A4
_08093968: .4byte gUnknown_080E1C48
_0809396C: .4byte 0x000005E4
_08093970:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _080939B6
_0809397C:
	adds r6, r5, #0
	adds r6, #0xb0
	movs r2, #0xbc
	lsls r2, r2, #3
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r3, _080939DC @ =0x000005E4
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	movs r0, #0xd0
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	mov r2, ip
	strh r0, [r2, #2]
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r2, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r2, #8]
	adds r0, r6, #0
	mov r1, ip
	bl sub_8004860
_080939B6:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, _080939E0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080939E4
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080939F0
	b _08093A7E
	.align 2, 0
_080939DC: .4byte 0x000005E4
_080939E0: .4byte gSelectedCharacter
_080939E4:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #5
	bls _08093A7E
_080939F0:
	adds r6, r5, #0
	adds r6, #0xe0
	ldr r3, _08093A28 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	beq _08093A34
	ldr r2, _08093A2C @ =gUnknown_080E17A4
	ldr r0, _08093A30 @ =gUnknown_080E1C48
	ldrb r1, [r0, #5]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	b _08093A5A
	.align 2, 0
_08093A28: .4byte gSelectedCharacter
_08093A2C: .4byte gUnknown_080E17A4
_08093A30: .4byte gUnknown_080E1C48
_08093A34:
	ldr r2, _08093B5C @ =gUnknown_080E17A4
	ldr r0, _08093B60 @ =gUnknown_080E1C4E
	ldrb r1, [r0, #6]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r5, r3
_08093A5A:
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r2, _08093B64 @ =0x000005E4
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093A7E:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08093B00
	ldr r0, _08093B68 @ =0x0000033D
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093B00
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r1, _08093B5C @ =gUnknown_080E17A4
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r3, #0x8f
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrb r1, [r0]
	adds r2, #0xa4
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r7, r5, #0
	adds r7, #0x96
	ldrh r0, [r7]
	strh r0, [r6, #0x16]
	adds r4, r5, #0
	adds r4, #0x98
	ldrh r0, [r4]
	adds r0, #0x19
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	ldr r1, _08093B6C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	ldrh r0, [r7]
	strh r0, [r6, #0x16]
	ldrh r0, [r4]
	adds r0, #0x19
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #1
	beq _08093AFA
	movs r0, #1
	mov r3, r8
	strb r0, [r3]
_08093AFA:
	adds r0, r6, #0
	bl sub_80051E8
_08093B00:
	movs r4, #0
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r4, r0
	bge _08093BD4
	ldr r7, _08093B70 @ =gUnknown_080E1964
	movs r2, #0x10
	adds r2, r2, r7
	mov r8, r2
_08093B1A:
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r3, #0x98
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r5, r0
	ldr r0, _08093B5C @ =gUnknown_080E17A4
	adds r1, #0x24
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #2
	adds r3, #0xfc
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08093B74
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _08093B7A
	.align 2, 0
_08093B5C: .4byte gUnknown_080E17A4
_08093B60: .4byte gUnknown_080E1C4E
_08093B64: .4byte 0x000005E4
_08093B68: .4byte 0x0000033D
_08093B6C: .4byte 0xFFFFFBFF
_08093B70: .4byte gUnknown_080E1964
_08093B74:
	ldr r0, [r6, #0x10]
	ldr r1, _08093BE0 @ =0xFFFFFBFF
	ands r0, r1
_08093B7A:
	str r0, [r6, #0x10]
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r0, r7, #0
	adds r0, #0xc
	adds r0, r2, r0
	ldr r1, [r0]
	movs r3, #0xd3
	lsls r3, r3, #2
	adds r0, r5, r3
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x16]
	mov r1, r8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08093BE4 @ =gBgScrollRegs
	ldrh r0, [r0, #6]
	subs r1, r1, r0
	adds r3, #4
	adds r0, r5, r3
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r4, r0
	blt _08093B1A
_08093BD4:
	movs r4, #0
	movs r2, #0xcf
	lsls r2, r2, #2
	adds r0, r5, r2
	b _08093C72
	.align 2, 0
_08093BE0: .4byte 0xFFFFFBFF
_08093BE4: .4byte gBgScrollRegs
_08093BE8:
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r5, r0
	ldr r0, _08093C2C @ =gUnknown_080E17A4
	adds r1, #0x26
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #2
	ldr r3, _08093C30 @ =0x000004EC
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	ble _08093C34
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _08093C3A
	.align 2, 0
_08093C2C: .4byte gUnknown_080E17A4
_08093C30: .4byte 0x000004EC
_08093C34:
	ldr r0, [r6, #0x10]
	ldr r1, _08093CD4 @ =0xFFFFFBFF
	ands r0, r1
_08093C3A:
	str r0, [r6, #0x10]
	adds r1, r2, r4
	lsls r1, r1, #2
	ldr r2, _08093CD8 @ =0x000004DC
	adds r0, r5, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	movs r3, #0x9c
	lsls r3, r3, #3
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
_08093C72:
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r4, r0
	blt _08093BE8
	ldr r2, _08093CDC @ =0x0000034A
	adds r4, r5, r2
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r2, [r4, r3]
	cmp r2, #0
	ble _08093CE8
	movs r0, #0xe8
	lsls r0, r0, #1
	adds r6, r5, r0
	ldr r1, _08093CE0 @ =gUnknown_080E17A4
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r3, #0xa3
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrb r1, [r0]
	adds r2, #0xac
	adds r0, r5, r2
	strb r1, [r0]
	movs r3, #0xbe
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r1, _08093CE4 @ =0x000005F4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r0, [r4]
	subs r0, #1
	b _08093D02
	.align 2, 0
_08093CD4: .4byte 0xFFFFFBFF
_08093CD8: .4byte 0x000004DC
_08093CDC: .4byte 0x0000034A
_08093CE0: .4byte gUnknown_080E17A4
_08093CE4: .4byte 0x000005F4
_08093CE8:
	adds r0, r1, #0
	adds r0, #0x1d
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08093CF8
	subs r0, r1, #1
	b _08093D02
_08093CF8:
	movs r0, #0x1e
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _08093D04
	movs r0, #0x32
_08093D02:
	strh r0, [r4]
_08093D04:
	ldr r0, _08093D20 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08093D24
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08093D30
	b _08093DBE
	.align 2, 0
_08093D20: .4byte gSelectedCharacter
_08093D24:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	bls _08093DB0
_08093D30:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r4, _08093E60 @ =gUnknown_080E17A4
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r2, #0xa7
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r1, [r0]
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r2, _08093E64 @ =0x000005FC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r3, #0x8c
	lsls r3, r3, #2
	adds r6, r5, r3
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r2, #0xab
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r3, #0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r2, _08093E68 @ =0x00000604
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093DB0:
	ldr r0, _08093E6C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08093DBE
	b _08093EC8
_08093DBE:
	movs r3, #0x88
	lsls r3, r3, #1
	adds r6, r5, r3
	ldr r4, _08093E60 @ =gUnknown_080E17A4
	ldr r2, _08093E70 @ =gUnknown_080E1C55
	ldr r0, _08093E74 @ =0x0000033A
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	movs r3, #0xbd
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r1, _08093E78 @ =0x000005EC
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r2, #0xce
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #5
	bhi _08093E80
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r6, r5, r3
	adds r0, #0x2b
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	adds r0, #0x2b
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	subs r0, #0x14
	strh r0, [r6, #0x16]
	ldr r1, _08093E7C @ =0x000005E4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	subs r0, #0x14
	b _08093EBA
	.align 2, 0
_08093E60: .4byte gUnknown_080E17A4
_08093E64: .4byte 0x000005FC
_08093E68: .4byte 0x00000604
_08093E6C: .4byte gSelectedCharacter
_08093E70: .4byte gUnknown_080E1C55
_08093E74: .4byte 0x0000033A
_08093E78: .4byte 0x000005EC
_08093E7C: .4byte 0x000005E4
_08093E80:
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r6, r5, r2
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r1, #0xc7
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r2, #0x20
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	ldr r1, _08093ED4 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, _08093ED8 @ =0x000005E4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
_08093EBA:
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093EC8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093ED4: .4byte 0xFFFFFBFF
_08093ED8: .4byte 0x000005E4

	thumb_func_start sub_8093EDC
sub_8093EDC: @ 0x08093EDC
	push {r4, r5, r6, lr}
	ldr r6, _08093F48 @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08093F4C @ =IWRAM_START + 0x32C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8093FA0
	adds r0, r4, #0
	bl sub_8093FF0
	adds r0, r4, #0
	bl sub_80934B8
	adds r0, r4, #0
	bl sub_8093638
	adds r0, r4, #0
	bl sub_8093740
	adds r0, r4, #0
	bl sub_809401C
	adds r0, r4, #0
	bl sub_8094044
	adds r0, r4, #0
	bl sub_8094060
	adds r0, r4, #0
	bl sub_80940BC
	adds r0, r4, #0
	bl sub_8093868
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08093F42
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _08093F50 @ =sub_809334C
	str r0, [r1, #8]
_08093F42:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093F48: .4byte gCurTask
_08093F4C: .4byte IWRAM_START + 0x32C
_08093F50: .4byte sub_809334C

	thumb_func_start sub_8093F54
sub_8093F54: @ 0x08093F54
	push {r4, lr}
	ldr r4, _08093F7C @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _08093F80 @ =IWRAM_START + 0x344
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _08093F84
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08093F94
	movs r0, #0x2c
	bl m4aSongNumStart
	b _08093F94
	.align 2, 0
_08093F7C: .4byte gCurTask
_08093F80: .4byte IWRAM_START + 0x344
_08093F84:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
_08093F94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8093F9C
sub_8093F9C: @ 0x08093F9C
	bx lr
	.align 2, 0

	thumb_func_start sub_8093FA0
sub_8093FA0: @ 0x08093FA0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _08093FBC @ =gBgScrollRegs
	movs r3, #2
	ldrsh r1, [r0, r3]
	adds r3, r0, #0
	cmp r1, #0x4b
	bgt _08093FC4
	ldr r4, _08093FC0 @ =0x00000614
	adds r1, r2, r4
	ldr r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #2
	b _08093FCE
	.align 2, 0
_08093FBC: .4byte gBgScrollRegs
_08093FC0: .4byte 0x00000614
_08093FC4:
	ldr r0, _08093FEC @ =0x00000614
	adds r1, r2, r0
	ldr r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #1
_08093FCE:
	adds r0, r0, r4
	str r0, [r1]
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0x5f
	bgt _08093FE4
	ldr r4, _08093FEC @ =0x00000614
	adds r0, r2, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r3, #2]
_08093FE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093FEC: .4byte 0x00000614

	thumb_func_start sub_8093FF0
sub_8093FF0: @ 0x08093FF0
	push {lr}
	ldr r1, _08094014 @ =0x0000060C
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r0]
	ldr r2, _08094018 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0x41
	bgt _0809400E
	asrs r0, r1, #8
	strh r0, [r2, #6]
_0809400E:
	pop {r0}
	bx r0
	.align 2, 0
_08094014: .4byte 0x0000060C
_08094018: .4byte gBgScrollRegs

	thumb_func_start sub_809401C
sub_809401C: @ 0x0809401C
	movs r1, #0xbd
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x78
	str r1, [r2]
	ldr r3, _0809403C @ =0x000005EC
	adds r0, r0, r3
	ldr r1, _08094040 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r2, [r1, r3]
	movs r1, #0xc2
	subs r1, r1, r2
	lsls r1, r1, #8
	str r1, [r0]
	bx lr
	.align 2, 0
_0809403C: .4byte 0x000005EC
_08094040: .4byte gBgScrollRegs

	thumb_func_start sub_8094044
sub_8094044: @ 0x08094044
	movs r1, #0xbe
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x78
	str r1, [r2]
	ldr r1, _0809405C @ =0x000005F4
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #4
	str r1, [r0]
	bx lr
	.align 2, 0
_0809405C: .4byte 0x000005F4

	thumb_func_start sub_8094060
sub_8094060: @ 0x08094060
	push {lr}
	adds r2, r0, #0
	ldr r0, _08094080 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08094084
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _08094090
	b _080940AE
	.align 2, 0
_08094080: .4byte gSelectedCharacter
_08094084:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _080940AE
_08094090:
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #0x78
	str r1, [r0]
	ldr r3, _080940B4 @ =0x000005FC
	adds r2, r2, r3
	ldr r1, [r2]
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r1, r0
	ble _080940AE
	ldr r3, _080940B8 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_080940AE:
	pop {r0}
	bx r0
	.align 2, 0
_080940B4: .4byte 0x000005FC
_080940B8: .4byte 0xFFFFFD00

	thumb_func_start sub_80940BC
sub_80940BC: @ 0x080940BC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080940DC @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080940E0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _080940EC
	b _0809410A
	.align 2, 0
_080940DC: .4byte gSelectedCharacter
_080940E0:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _0809410A
_080940EC:
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #0x78
	str r1, [r0]
	ldr r3, _08094110 @ =0x00000604
	adds r2, r2, r3
	ldr r1, [r2]
	movs r0, #0x96
	lsls r0, r0, #8
	cmp r1, r0
	ble _0809410A
	ldr r3, _08094114 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0809410A:
	pop {r0}
	bx r0
	.align 2, 0
_08094110: .4byte 0x00000604
_08094114: .4byte 0xFFFFFD00

@; CreateMissingChaosEmaraldsCutScene
	thumb_func_start sub_8094118
sub_8094118: @ 0x08094118
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	ldr r1, _08094204 @ =gDispCnt
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08094208 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0809420C @ =0x00001E03
	strh r0, [r1]
	ldr r0, _08094210 @ =0x00001C05
	strh r0, [r1, #2]
	ldr r3, _08094214 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _08094218 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	str r6, [sp, #4]
	ldr r1, _0809421C @ =0x040000D4
	add r5, sp, #4
	str r5, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08094220 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08094224 @ =sub_8094360
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _08094228 @ =sub_80945A0
	str r1, [sp]
	movs r1, #0xc8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	adds r0, #0xbc
	adds r2, r3, r0
	strb r4, [r2]
	ldr r5, _0809422C @ =IWRAM_START + 0xC0
	adds r1, r3, r5
	movs r0, #0xf0
	str r0, [r1]
	ldr r1, _08094230 @ =IWRAM_START + 0xBD
	adds r0, r3, r1
	strb r4, [r0]
	subs r5, #1
	adds r1, r3, r5
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	subs r5, #1
	adds r0, r3, r5
	strb r4, [r0]
	ldr r4, _08094234 @ =gLoadedSaveGame
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r1]
	ldr r0, [r4]
	ldr r1, _08094238 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080941EC
	movs r0, #1
	strb r0, [r2]
	movs r2, #0
	ldr r0, _08094230 @ =IWRAM_START + 0xBD
	adds r1, r3, r0
_080941D0:
	ldr r0, [r4]
	adds r0, #0x15
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080941E2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080941E2:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080941D0
_080941EC:
	bl m4aMPlayAllStop
	adds r0, r6, #0
	adds r0, #0xbd
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _08094240
	ldr r0, _0809423C @ =0x0000019F
	bl m4aSongNumStart
	b _08094248
	.align 2, 0
_08094204: .4byte gDispCnt
_08094208: .4byte gBgCntRegs
_0809420C: .4byte 0x00001E03
_08094210: .4byte 0x00001C05
_08094214: .4byte gUnknown_03004D80
_08094218: .4byte gUnknown_03002280
_0809421C: .4byte 0x040000D4
_08094220: .4byte 0x85004000
_08094224: .4byte sub_8094360
_08094228: .4byte sub_80945A0
_0809422C: .4byte IWRAM_START + 0xC0
_08094230: .4byte IWRAM_START + 0xBD
_08094234: .4byte gLoadedSaveGame
_08094238: .4byte gSelectedCharacter
_0809423C: .4byte 0x0000019F
_08094240:
	movs r0, #0xcc
	lsls r0, r0, #1
	bl m4aSongNumStart
_08094248:
	adds r1, r6, #0
	adds r1, #0xb0
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	strh r2, [r1, #4]
	movs r0, #0x80
	strh r0, [r1, #6]
	ldr r0, _08094290 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	adds r4, r6, #0
	adds r4, #0xc4
	ldr r0, _08094294 @ =0x06010000
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x80
	str r0, [r3, #4]
	ldrb r0, [r7]
	cmp r0, #3
	bhi _0809429C
	ldr r2, _08094298 @ =gUnknown_080E1CA0
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r2, #4]
	strh r0, [r3, #0xa]
	ldrb r1, [r2, #6]
	adds r0, r6, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r0, #0x55
	b _080942B6
	.align 2, 0
_08094290: .4byte 0x00003FFF
_08094294: .4byte 0x06010000
_08094298: .4byte gUnknown_080E1CA0
_0809429C:
	ldr r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _08094338 @ =gUnknown_080E1CA0
	ldrh r0, [r1, #0xc]
	strh r0, [r3, #0xa]
	ldrb r1, [r1, #0xe]
	adds r0, r6, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r0, #0x5a
_080942B6:
	strh r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r5, #0
	movs r4, #0
	movs r0, #0x78
	strh r0, [r3, #0x16]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r5, [r0]
	str r4, [r3, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	adds r0, r3, #0
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r6, #4]
	strh r4, [r6, #0xa]
	ldr r0, _0809433C @ =0x0600F000
	str r0, [r6, #0xc]
	strh r4, [r6, #0x18]
	strh r4, [r6, #0x1a]
	strh r4, [r6, #0x1e]
	strh r4, [r6, #0x20]
	strh r4, [r6, #0x22]
	strh r4, [r6, #0x24]
	movs r1, #0x1e
	strh r1, [r6, #0x26]
	movs r0, #0x14
	strh r0, [r6, #0x28]
	adds r0, r6, #0
	adds r0, #0x2a
	strb r5, [r0]
	strh r4, [r6, #0x2e]
	adds r2, r6, #0
	adds r2, #0x40
	ldr r0, _08094340 @ =0x06004000
	str r0, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _08094344 @ =0x0600E000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	strh r1, [r2, #0x26]
	ldrb r0, [r7]
	cmp r0, #0
	beq _08094348
	movs r0, #7
	b _0809434A
	.align 2, 0
_08094338: .4byte gUnknown_080E1CA0
_0809433C: .4byte 0x0600F000
_08094340: .4byte 0x06004000
_08094344: .4byte 0x0600E000
_08094348:
	movs r0, #6
_0809434A:
	strh r0, [r2, #0x28]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strh r0, [r2, #0x2e]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094360
sub_8094360: @ 0x08094360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #0
	ldr r0, _080943E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, _080943E8 @ =IWRAM_START + 0xBD
	adds r6, r4, r0
	ldrb r5, [r6]
	cmp r5, #0
	bne _08094400
	ldr r1, _080943EC @ =IWRAM_START + 0xBF
	adds r6, r4, r1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #1
	ble _080943BE
	ldr r2, _080943F0 @ =gDispCnt
	ldrh r0, [r2]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080943F4 @ =gBgScrollRegs
	strh r3, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldr r0, _080943F8 @ =IWRAM_START + 0x40
	adds r3, r4, r0
	ldr r1, _080943FC @ =gUnknown_080E1C5C
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
_080943BE:
	ldr r2, _080943F0 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080943F4 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	mov r3, r8
	ldr r0, _080943FC @ =gUnknown_080E1C5C
	ldrh r0, [r0]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
	b _0809446E
	.align 2, 0
_080943E4: .4byte gCurTask
_080943E8: .4byte IWRAM_START + 0xBD
_080943EC: .4byte IWRAM_START + 0xBF
_080943F0: .4byte gDispCnt
_080943F4: .4byte gBgScrollRegs
_080943F8: .4byte IWRAM_START + 0x40
_080943FC: .4byte gUnknown_080E1C5C
_08094400:
	ldr r7, _08094480 @ =gDispCnt
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r5, _08094484 @ =gBgScrollRegs
	strh r3, [r5]
	strh r3, [r5, #2]
	mov r3, r8
	ldr r0, _08094488 @ =gUnknown_080E1C5C
	mov r8, r0
	ldrh r0, [r0, #0xe]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
	ldrb r0, [r6]
	ldr r1, _0809448C @ =IWRAM_START + 0xBF
	adds r2, r4, r1
	cmp r0, #1
	bhi _08094436
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	ble _0809446E
_08094436:
	ldrh r0, [r7]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7]
	movs r0, #0
	strh r0, [r5, #4]
	movs r0, #0xa0
	strh r0, [r5, #6]
	ldr r7, _08094490 @ =IWRAM_START + 0x40
	adds r3, r4, r7
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, #6
	ldrb r2, [r6]
	subs r2, #1
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xf
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
_0809446E:
	ldr r0, _08094494 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08094498 @ =sub_809449C
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094480: .4byte gDispCnt
_08094484: .4byte gBgScrollRegs
_08094488: .4byte gUnknown_080E1C5C
_0809448C: .4byte IWRAM_START + 0xBF
_08094490: .4byte IWRAM_START + 0x40
_08094494: .4byte gCurTask
_08094498: .4byte sub_809449C

	thumb_func_start sub_809449C
sub_809449C: @ 0x0809449C
	push {r4, r5, r6, lr}
	ldr r6, _080944DC @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r1, _080944E0 @ =IWRAM_START + 0xB0
	adds r4, r5, r1
	movs r1, #2
	strh r1, [r4, #2]
	bl sub_80945A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080944D4
	movs r0, #0
	strh r0, [r4, #4]
	ldr r2, _080944E4 @ =IWRAM_START + 0xBE
	adds r0, r5, r2
	strb r1, [r0]
	ldr r1, [r6]
	ldr r0, _080944E8 @ =sub_8094530
	str r0, [r1, #8]
_080944D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080944DC: .4byte gCurTask
_080944E0: .4byte IWRAM_START + 0xB0
_080944E4: .4byte IWRAM_START + 0xBE
_080944E8: .4byte sub_8094530

	thumb_func_start sub_80944EC
sub_80944EC: @ 0x080944EC
	push {r4, r5, lr}
	ldr r5, _08094524 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r2, _08094528 @ =IWRAM_START + 0xB0
	adds r4, r1, r2
	movs r1, #1
	strh r1, [r4, #2]
	bl sub_80945A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809451E
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _0809452C @ =sub_8094570
	str r0, [r1, #8]
_0809451E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094524: .4byte gCurTask
_08094528: .4byte IWRAM_START + 0xB0
_0809452C: .4byte sub_8094570

	thumb_func_start sub_8094530
sub_8094530: @ 0x08094530
	push {r4, r5, lr}
	ldr r5, _08094554 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_80945A4
	ldr r0, _08094558 @ =IWRAM_START + 0xC0
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0809455C
	subs r0, #1
	str r0, [r4]
	b _08094566
	.align 2, 0
_08094554: .4byte gCurTask
_08094558: .4byte IWRAM_START + 0xC0
_0809455C:
	movs r0, #0xb4
	str r0, [r4]
	ldr r1, [r5]
	ldr r0, _0809456C @ =sub_80944EC
	str r0, [r1, #8]
_08094566:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809456C: .4byte sub_80944EC

	thumb_func_start sub_8094570
sub_8094570: @ 0x08094570
	push {r4, lr}
	ldr r4, _08094588 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _0809458C @ =IWRAM_START + 0xC0
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, #0
	beq _08094590
	subs r0, #1
	str r0, [r1]
	b _0809459A
	.align 2, 0
_08094588: .4byte gCurTask
_0809458C: .4byte IWRAM_START + 0xC0
_08094590:
	bl CreateTitleScreen
	ldr r0, [r4]
	bl TaskDestroy
_0809459A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80945A0
sub_80945A0: @ 0x080945A0
	bx lr
	.align 2, 0

	thumb_func_start sub_80945A4
sub_80945A4: @ 0x080945A4
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0xbd
	ldrb r0, [r0]
	cmp r0, #0
	beq _080945DC
	adds r4, r2, #0
	adds r4, #0x80
	cmp r0, #3
	bls _080945D0
	adds r0, r2, #0
	adds r0, #0xbe
	ldrb r0, [r0]
	cmp r0, #0
	beq _080945D0
	ldr r1, _080945E4 @ =gUnknown_080E1CA0
	ldrh r0, [r1, #0x14]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	adds r0, r2, #0
	adds r0, #0xa0
	strb r1, [r0]
_080945D0:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080945DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080945E4: .4byte gUnknown_080E1CA0
