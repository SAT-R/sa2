.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start umul3232H32
umul3232H32: @ 0x02012AF8
	add r2, pc, #0x0 @ =__umul3232H32
	bx r2

	arm_func_start __umul3232H32
__umul3232H32: @ 0x02012AFC
	umull r2, r3, r0, r1
	add r0, r3, #0
	bx lr

	thumb_func_start SoundMain
SoundMain: @ 0x02012B08
	ldr r0, _02012B74 @ =gUnknown_03007FF0
	ldr r0, [r0]
	ldr r2, _02012B78 @ =0x68736D53
	ldr r3, [r0]
	cmp r2, r3
	beq _02012B16
	bx lr
_02012B16:
	adds r3, #1
	str r3, [r0]
	push {r4, r5, r6, r7, lr}
	mov r1, r8
	mov r2, sb
	mov r3, sl
	mov r4, fp
	push {r0, r1, r2, r3, r4}
	sub sp, #0x18
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	beq _02012B3A
	ldr r2, _02012B80 @ =0x04000006
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _02012B38
	adds r2, #0xe4
_02012B38:
	adds r1, r1, r2
_02012B3A:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _02012B4A
	ldr r0, [r0, #0x24]
	bl sub_02012F2A
	ldr r0, [sp, #0x18]
_02012B4A:
	ldr r3, [r0, #0x28]
	bl sub_02012F2A
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _02012B84 @ =0x00000350
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _02012B6A
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_02012B6A:
	str r5, [sp, #8]
	ldr r6, _02012B88 @ =0x00000630
	ldr r3, _02012B7C @ =gUnknown_03000001
	bx r3
	.align 2, 0
_02012B74: .4byte gUnknown_03007FF0
_02012B78: .4byte 0x68736D53
_02012B7C: .4byte gUnknown_03000001
_02012B80: .4byte 0x04000006
_02012B84: .4byte 0x00000350
_02012B88: .4byte 0x00000630

	thumb_func_start SoundMainRAM
SoundMainRAM: @ 0x02012B8C
	ldrb r3, [r0, #5]
	cmp r3, #0
	beq SoundMainRAM_NoReverb
	add r1, pc, #0x4 @ =SoundMainRAM_Reverb
	bx r1
	.align 2, 0

	arm_func_start SoundMainRAM_Reverb
SoundMainRAM_Reverb: @ 0x02012B98
	cmp r4, #2
	addeq r7, r0, #0x350
	addne r7, r5, r8
	mov r4, r8
_02012BA8:
	ldrsb r0, [r5, r6]
	ldrsb r1, [r5]
	add r0, r0, r1
	ldrsb r1, [r7, r6]
	add r0, r0, r1
	ldrsb r1, [r7], #1
	add r0, r0, r1
	mul r1, r0, r3
	asr r0, r1, #9
	tst r0, #0x80
	addne r0, r0, #1
	strb r0, [r5, r6]
	strb r0, [r5], #1
	subs r4, r4, #1
	bgt _02012BA8
	add r0, pc, #0x2F @ =SoundMainRAM_ChanLoop
	bx r0

	thumb_func_start SoundMainRAM_NoReverb
SoundMainRAM_NoReverb: @ 0x02012BEC
	movs r0, #0
	mov r1, r8
	adds r6, r6, r5
	lsrs r1, r1, #3
	blo SoundMainRAM_NoReverb_Ok
	stm r5!, {r0}
	stm r6!, {r0}
SoundMainRAM_NoReverb_Ok:
	lsrs r1, r1, #1
	blo SoundMainRAM_NoReverb_Loop
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
SoundMainRAM_NoReverb_Loop:
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, #1
	bgt SoundMainRAM_NoReverb_Loop

	non_word_aligned_thumb_func_start SoundMainRAM_ChanLoop
SoundMainRAM_ChanLoop: @ 0x02012C1A
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #0x18]
	mov ip, r0
	ldrb r0, [r4, #6]
	adds r4, #0x50
_02012C24:
	str r0, [sp, #4]
	ldr r3, [r4, #0x24]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02012C44
	ldr r1, _02012C40 @ =0x04000006
	ldrb r1, [r1]
	cmp r1, #0xa0
	bhs _02012C38
	adds r1, #0xe4
_02012C38:
	cmp r1, r0
	blo _02012C44
	b _02012F16
	.align 2, 0
_02012C40: .4byte 0x04000006
_02012C44:
	ldrb r6, [r4]
	movs r0, #0xc7
	tst r0, r6
	bne _02012C4E
	b sub_02012F0C
_02012C4E:
	movs r0, #0x80
	tst r0, r6
	beq _02012C7E
	movs r0, #0x40
	tst r0, r6
	bne _02012C8E
	movs r6, #3
	strb r6, [r4]
	adds r0, r3, #0
	adds r0, #0x10
	str r0, [r4, #0x28]
	ldr r0, [r3, #0xc]
	str r0, [r4, #0x18]
	movs r5, #0
	strb r5, [r4, #9]
	str r5, [r4, #0x1c]
	ldrb r2, [r3, #3]
	movs r0, #0xc0
	tst r0, r2
	beq _02012CD6
	movs r0, #0x10
	orrs r6, r0
	strb r6, [r4]
	b _02012CD6
_02012C7E:
	ldrb r5, [r4, #9]
	movs r0, #4
	tst r0, r6
	beq _02012C94
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	bhi _02012CE4
_02012C8E:
	movs r0, #0
	strb r0, [r4]
	b sub_02012F0C
_02012C94:
	movs r0, #0x40
	tst r0, r6
	beq _02012CB4
	ldrb r0, [r4, #7]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	bhi _02012CE4
_02012CA6:
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	beq _02012C8E
	movs r0, #4
	orrs r6, r0
	strb r6, [r4]
	b _02012CE4
_02012CB4:
	movs r2, #3
	ands r2, r6
	cmp r2, #2
	bne _02012CD2
	ldrb r0, [r4, #5]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #6]
	cmp r5, r0
	bhi _02012CE4
	adds r5, r0, #0
	beq _02012CA6
	subs r6, #1
	strb r6, [r4]
	b _02012CE4
_02012CD2:
	cmp r2, #3
	bne _02012CE4
_02012CD6:
	ldrb r0, [r4, #4]
	adds r5, r5, r0
	cmp r5, #0xff
	blo _02012CE4
	movs r5, #0xff
	subs r6, #1
	strb r6, [r4]
_02012CE4:
	strb r5, [r4, #9]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #7]
	adds r0, #1
	muls r0, r5, r0
	lsrs r5, r0, #4
	ldrb r0, [r4, #2]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #3]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xb]
	movs r0, #0x10
	ands r0, r6
	str r0, [sp, #0x10]
	beq _02012D18
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x10]
_02012D18:
	ldr r5, [sp, #8]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x28]
	add r0, pc, #0x4 @ =sub_02012D24
	bx r0
	.align 2, 0

	arm_func_start sub_02012D24
sub_02012D24: @ 0x02012D24
	str r8, [sp]
	ldrb sl, [r4, #0xa]
	ldrb fp, [r4, #0xb]
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldrb r0, [r4, #1]
	tst r0, #8
	beq _02012E64
_02012D44:
	cmp r2, #4
	ble _02012DB4
	subs r2, r2, r8
	movgt lr, #0
	bgt _02012D70
	mov lr, r8
	add r2, r2, r8
	sub r8, r2, #4
	sub lr, lr, r8
	ands r2, r2, #3
	moveq r2, #4
_02012D70:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_02012D78:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	adds r5, r5, #0x40000000
	blo _02012D78
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _02012D70
	adds r8, r8, lr
	beq _02012EF8
_02012DB4:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_02012DBC:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	subs r2, r2, #1
	beq _02012E2C
_02012DE0:
	adds r5, r5, #0x40000000
	blo _02012DBC
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _02012D44
	b _02012EF8
_02012DFC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02012E20
	ldr r3, [sp, #0x14]
	rsb sb, r2, #0
_02012E10:
	adds r2, r0, r2
	bgt _02012EC8
	sub sb, sb, r0
	b _02012E10
_02012E20:
	pop {r4, ip}
	mov r2, #0
	b _02012E3C
_02012E2C:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r3, [sp, #0xc]
	bne _02012DE0
_02012E3C:
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	b _02012F00
_02012E64:
	push {r4, ip}
	ldr lr, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	mul r4, ip, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_02012E80:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_02012E88:
	mul sb, lr, r1
	add sb, r0, sb, asr #23
	mul ip, sl, sb
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, sb
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add lr, lr, r4
	lsrs sb, lr, #0x17
	beq _02012ED4
	bic lr, lr, #0x3f800000
	subs r2, r2, sb
	ble _02012DFC
	subs sb, sb, #1
	addeq r0, r0, r1
_02012EC8:
	ldrsbne r0, [r3, sb]!
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_02012ED4:
	adds r5, r5, #0x40000000
	blo _02012E88
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _02012E80
	sub r3, r3, #1
	pop {r4, ip}
	str lr, [r4, #0x1c]
_02012EF8:
	str r2, [r4, #0x18]
	str r3, [r4, #0x28]
_02012F00:
	ldr r8, [sp]
	add r0, pc, #0x1 @ =sub_02012F0C
	bx r0

	thumb_func_start sub_02012F0C
sub_02012F0C: @ 0x02012F0C
	ldr r0, [sp, #4]
	subs r0, #1
	ble _02012F16
	adds r4, #0x40
	b _02012C24
_02012F16:
	ldr r0, [sp, #0x18]
	ldr r3, _02012F2C @ =0x68736D53
	str r3, [r0]
	add sp, #0x1c
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	non_word_aligned_thumb_func_start sub_02012F2A
sub_02012F2A: @ 0x02012F2A
	bx r3
	.align 2, 0
_02012F2C: .4byte 0x68736D53

	thumb_func_start sub_02012F30
sub_02012F30: @ 0x02012F30
	mov ip, r4
	movs r1, #0
	movs r2, #0
	movs r3, #0
	movs r4, #0
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	mov r4, ip
	bx lr
	.align 2, 0

	thumb_func_start sub_02012F48
sub_02012F48: @ 0x02012F48
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _02012F66
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _02012F5A
	str r1, [r2, #0x34]
	b _02012F5C
_02012F5A:
	str r1, [r3, #0x20]
_02012F5C:
	cmp r1, #0
	beq _02012F62
	str r2, [r1, #0x30]
_02012F62:
	movs r1, #0
	str r1, [r0, #0x2c]
_02012F66:
	bx lr
_02012F68:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _02012F8C
_02012F72:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _02012F80
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_02012F80:
	adds r0, r4, #0
	bl sub_02012F48
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _02012F72
_02012F8C:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MPlayJumpTableCopy
MPlayJumpTableCopy: @ 0x02012F98
	mov ip, lr
	movs r1, #0x24
	ldr r2, _02012FC8 @ =gUnknown_02015E6C
_02012F9E:
	ldr r3, [r2]
	bl _02012FB2
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _02012F9E
	bx ip
	.align 2, 0

	thumb_func_start sub_02012FB0
sub_02012FB0: @ 0x02012FB0
	ldrb r3, [r2]
_02012FB2:
	push {r0}
	lsrs r0, r2, #0x19
	bne _02012FC4
	ldr r0, _02012FC8 @ =gUnknown_02015E6C
	cmp r2, r0
	blo _02012FC2
	lsrs r0, r2, #0xe
	beq _02012FC4
_02012FC2:
	movs r3, #0
_02012FC4:
	pop {r0}
	bx lr
	.align 2, 0
_02012FC8: .4byte gUnknown_02015E6C

	thumb_func_start sub_02012FCC
sub_02012FCC: @ 0x02012FCC
	ldr r2, [r1, #0x40]

	non_word_aligned_thumb_func_start sub_02012FCE
sub_02012FCE: @ 0x02012FCE
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b _02012FB2
	.align 2, 0
_02012FD8:
	push {lr}
_02012FDA:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl sub_02012FB0
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0

	thumb_func_start sub_02012FF8
sub_02012FF8: @ 0x02012FF8
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _02013010
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
	strb r2, [r1, #2]
	b _02012FD8
_02013010:
	b _02012F68
	.align 2, 0

	thumb_func_start sub_02013014
sub_02013014: @ 0x02013014
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _02013026
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_02013026:
	bx lr

	thumb_func_start sub_02013028
sub_02013028: @ 0x02013028
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _02013038
	adds r2, #1
	str r2, [r1, #0x40]
	b _02012FDA
_02013038:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl sub_02012FCC
	cmp ip, r3
	bhs _0201304A
	b _02012FDA
_0201304A:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02013058
sub_02013058: @ 0x02013058
	mov ip, lr
	bl sub_02012FCC
	strb r3, [r1, #0x1d]
	bx ip
	.align 2, 0

	thumb_func_start sub_02013064
sub_02013064: @ 0x02013064
	mov ip, lr
	bl sub_02012FCC
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip

	thumb_func_start sub_02013078
sub_02013078: @ 0x02013078
	mov ip, lr
	bl sub_02012FCC
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0201308C
sub_0201308C: @ 0x0201308C
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, [r0, #0x30]
	adds r2, r2, r3
	ldr r3, [r2]
	bl _02012FB2
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl _02012FB2
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl _02012FB2
	str r3, [r1, #0x2c]
	bx ip
	.align 2, 0

	thumb_func_start sub_020130BC
sub_020130BC: @ 0x020130BC
	mov ip, lr
	bl sub_02012FCC
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_020130D0
sub_020130D0: @ 0x020130D0
	mov ip, lr
	bl sub_02012FCC
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_020130E4
sub_020130E4: @ 0x020130E4
	mov ip, lr
	bl sub_02012FCC
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_020130F8
sub_020130F8: @ 0x020130F8
	mov ip, lr
	bl sub_02012FCC
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0201310C
sub_0201310C: @ 0x0201310C
	mov ip, lr
	bl sub_02012FCC
	strb r3, [r1, #0x1b]
	bx ip
	.align 2, 0

	thumb_func_start sub_02013118
sub_02013118: @ 0x02013118
	mov ip, lr
	bl sub_02012FCC
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _0201312E
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_0201312E:
	bx ip

	thumb_func_start sub_02013130
sub_02013130: @ 0x02013130
	mov ip, lr
	bl sub_02012FCC
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_02013144
sub_02013144: @ 0x02013144
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _02013158 @ =0x04000060
	adds r0, r0, r3
	bl sub_02012FCE
	strb r3, [r0]
	bx ip
	.align 2, 0
_02013158: .4byte 0x04000060

	thumb_func_start sub_0201315C
sub_0201315C: @ 0x0201315C
	ldr r0, _02013408 @ =gUnknown_03007FF0
	ldr r0, [r0]
	ldr r2, _0201340C @ =0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _0201319C
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _0201319C
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _020131A0 @ =0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _02013182
	ldr r1, _020131A4 @ =0x84400004
	str r1, [r2, #8]
_02013182:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _0201318C
	ldr r1, _020131A4 @ =0x84400004
	str r1, [r2, #0x14]
_0201318C:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_0201319C:
	bx lr
	.align 2, 0
_020131A0: .4byte 0x040000BC
_020131A4: .4byte 0x84400004

	thumb_func_start MP2KPlayerMain
MP2KPlayerMain: @ 0x020131A8
	ldr r2, _0201340C @ =0x68736D53
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _020131B2
	bx lr
_020131B2:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _020131C4
	ldr r0, [r0, #0x3c]
	bl sub_02013400
_020131C4:
	pop {r0}
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _020131DC
	b _020133F0
_020131DC:
	ldr r0, _02013408 @ =gUnknown_03007FF0
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl FadeOutBody
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _020131F0
	b _020133F0
_020131F0:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _02013340
_020131F8:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_02013200:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _0201320A
	b _0201331C
_0201320A:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0201323E
_02013216:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _02013232
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _02013238
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _02013238
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _02013238
_02013232:
	adds r0, r4, #0
	bl ClearChain
_02013238:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _02013216
_0201323E:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _020132BC
	adds r0, r5, #0
	bl Clear64byte
	movs r0, #0x80
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0xf]
	movs r0, #0x40
	strb r0, [r5, #0x13]
	movs r0, #0x16
	strb r0, [r5, #0x19]
	movs r0, #1
	adds r1, r5, #6
	strb r0, [r1, #0x1e]
	b _020132BC
_02013264:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _02013270
	ldrb r1, [r5, #7]
	b _0201327A
_02013270:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _0201327A
	strb r1, [r5, #7]
_0201327A:
	cmp r1, #0xcf
	blo _02013290
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_02013400
	b _020132BC
_02013290:
	cmp r1, #0xb0
	bls _020132B2
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_02013400
	ldrb r0, [r5]
	cmp r0, #0
	beq _02013318
	b _020132BC
_020132B2:
	ldr r0, _02013404 @ =gUnknown_020160E0
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_020132BC:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _02013264
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _02013318
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _02013318
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _020132DE
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _02013318
_020132DE:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _020132F2
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _020132F6
_020132F2:
	movs r0, #0x80
	subs r2, r0, r1
_020132F6:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _02013318
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _02013312
	movs r1, #0xc
	b _02013314
_02013312:
	movs r1, #3
_02013314:
	orrs r0, r1
	strb r0, [r5]
_02013318:
	mov r3, sl
	mov r4, fp
_0201331C:
	subs r6, #1
	ble _02013328
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _02013200
_02013328:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _0201333A
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _020133F0
_0201333A:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_02013340:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _02013348
	b _020131F8
_02013348:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_0201334C:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _020133E6
	movs r1, #0xf
	tst r1, r0
	beq _020133E6
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _020133DC
_0201336A:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _0201337A
	adds r0, r4, #0
	bl ClearChain
	b _020133D6
_0201337A:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _02013398
	bl sub_02013454
	cmp r6, #0
	beq _02013398
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_02013398:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _020133D6
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _020133AC
	movs r2, #0
_020133AC:
	cmp r6, #0
	beq _020133CA
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl sub_02013400
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _020133D6
_020133CA:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl MidiKeyToFreq
	str r0, [r4, #0x20]
_020133D6:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0201336A
_020133DC:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_020133E6:
	subs r2, #1
	ble _020133F0
	movs r0, #0x50
	adds r5, r5, r0
	bgt _0201334C
_020133F0:
	ldr r0, _0201340C @ =0x68736D53
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	thumb_func_start sub_02013400
sub_02013400: @ 0x02013400
	bx r3
	.align 2, 0
_02013404: .4byte gUnknown_020160E0
_02013408: .4byte gUnknown_03007FF0
_0201340C: .4byte 0x68736D53

	thumb_func_start TrackStop
TrackStop: @ 0x02013410
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _02013448
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _02013446
	movs r6, #0
_02013424:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0201343E
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _0201343C
	ldr r3, _02013450 @ =gUnknown_03007FF0
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_02013400
_0201343C:
	strb r6, [r4]
_0201343E:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _02013424
_02013446:
	str r4, [r5, #0x20]
_02013448:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02013450: .4byte gUnknown_03007FF0

	thumb_func_start sub_02013454
sub_02013454: @ 0x02013454
	ldrb r1, [r4, #0x12]
	movs r0, #0x14
	ldrsb r2, [r4, r0]
	movs r3, #0x80
	adds r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x10]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _0201346C
	movs r0, #0xff
_0201346C:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _02013480
	movs r0, #0xff
_02013480:
	strb r0, [r4, #3]
	bx lr

	thumb_func_start MP2K_event_nxx
MP2K_event_nxx: @ 0x02013484
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _0201367C @ =gUnknown_03007FF0
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _02013680 @ =gUnknown_020160E0
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _020134CA
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _020134C8
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _020134C8
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_020134C8:
	str r3, [r5, #0x40]
_020134CA:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _0201351C
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _020134EA
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _020134EC
_020134EA:
	adds r0, r3, #0
_020134EC:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _02013504
	b _0201366A
_02013504:
	movs r0, #0x80
	tst r0, r2
	beq _02013520
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _02013518
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_02013518:
	ldrb r3, [r6, #1]
	b _02013520
_0201351C:
	mov sb, r4
	ldrb r3, [r5, #5]
_02013520:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _02013530
	movs r0, #0xff
_02013530:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _02013570
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _02013548
	b _0201366A
_02013548:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _020135C4
	movs r0, #0x40
	tst r0, r1
	bne _020135C4
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _020135C4
	beq _02013568
	b _0201366A
_02013568:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _020135C4
	b _0201366A
_02013570:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_0201357E:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _020135C4
	movs r0, #0x40
	tst r0, r1
	beq _02013598
	cmp r2, #0
	bne _0201359C
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _020135B6
_02013598:
	cmp r2, #0
	bne _020135B8
_0201359C:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _020135A8
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _020135B6
_020135A8:
	bhi _020135B8
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _020135B4
	adds r7, r0, #0
	b _020135B6
_020135B4:
	blo _020135B8
_020135B6:
	mov r8, r4
_020135B8:
	adds r4, #0x40
	subs r3, #1
	bgt _0201357E
	mov r4, r8
	cmp r4, #0
	beq _0201366A
_020135C4:
	adds r0, r4, #0
	bl ClearChain
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _020135D8
	str r4, [r3, #0x30]
_020135D8:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _020135EA
	adds r1, r5, #0
	bl sub_020136C4
_020135EA:
	ldr r0, [sp]
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl sub_02013454
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _02013624
	movs r3, #0
_02013624:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _02013652
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _0201363E
	movs r0, #0x70
	tst r0, r1
	bne _02013640
_0201363E:
	movs r1, #8
_02013640:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_02013400
	b _0201365C
_02013652:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl MidiKeyToFreq
_0201365C:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_0201366A:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_0201367C: .4byte gUnknown_03007FF0
_02013680: .4byte gUnknown_020160E0

	thumb_func_start MP2K_event_endtie
MP2K_event_endtie: @ 0x02013684
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _02013696
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _02013698
_02013696:
	ldrb r3, [r1, #5]
_02013698:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _020136C0
	movs r4, #0x83
	movs r5, #0x40
_020136A2:
	ldrb r2, [r1]
	tst r2, r4
	beq _020136BA
	tst r2, r5
	bne _020136BA
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _020136BA
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _020136C0
_020136BA:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _020136A2
_020136C0:
	pop {r4, r5}
	bx lr

	thumb_func_start sub_020136C4
sub_020136C4: @ 0x020136C4
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _020136D4
	movs r2, #0xc
	b _020136D6
_020136D4:
	movs r2, #3
_020136D6:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0

	thumb_func_start ld_r3_tp_adr_i_unchecked
ld_r3_tp_adr_i_unchecked: @ 0x020136E0
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0

	thumb_func_start MP2K_event_lfos
MP2K_event_lfos: @ 0x020136EC
	mov ip, lr
	bl ld_r3_tp_adr_i_unchecked
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _020136FC
	bl sub_020136C4
_020136FC:
	bx ip
	.align 2, 0

	thumb_func_start MP2K_event_mod
MP2K_event_mod: @ 0x02013700
	mov ip, lr
	bl ld_r3_tp_adr_i_unchecked
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _02013710
	bl sub_020136C4
_02013710:
	bx ip
	.align 2, 0

