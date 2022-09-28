.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start umul3232H32
umul3232H32: @ 0x0200F79C
	add r2, pc, #0x0 @ =__umul3232H32
	bx r2

	arm_func_start __umul3232H32
__umul3232H32: @ 0x0200F7A0
	umull r2, r3, r0, r1
	add r0, r3, #0
	bx lr

	thumb_func_start SoundMain
SoundMain: @ 0x080945F8
	ldr r0, _08094664 @ =SOUND_INFO_PTR
	ldr r0, [r0]
	ldr r2, _08094668 @ =0x68736D53
	ldr r3, [r0]
	cmp r2, r3
	beq _08094606
	bx lr
_08094606:
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
	beq _0809462A
	ldr r2, _08094670 @ =0x04000006
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _08094628
	adds r2, #0xe4
_08094628:
	adds r1, r1, r2
_0809462A:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _0809463A
	ldr r0, [r0, #0x24]
	bl sub_0200fbce
	ldr r0, [sp, #0x18]
_0809463A:
	ldr r3, [r0, #0x28]
	bl sub_0200fbce
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _08094674 @ =0x00000350
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _0809465A
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_0809465A:
	str r5, [sp, #8]
	ldr r6, _08094678 @ =0x00000630
	ldr r3, _0809466C @ =SoundMainRAM_Buffer + 1
	bx r3
	.align 2, 0
_08094664: .4byte SOUND_INFO_PTR
_08094668: .4byte 0x68736D53
_0809466C: .4byte SoundMainRAM_Buffer + 1
_08094670: .4byte 0x04000006
_08094674: .4byte 0x00000350
_08094678: .4byte 0x00000630

	thumb_func_start SoundMainRAM
SoundMainRAM: @ 0x0809467C
	ldrb r3, [r0, #5]
	cmp r3, #0
	beq SoundMainRAM_NoReverb
	add r1, pc, #0x4 @ =SoundMainRAM_Reverb
	bx r1
	.align 2, 0

	arm_func_start SoundMainRAM_Reverb
SoundMainRAM_Reverb: @ 0x08094688
	cmp r4, #2
	addeq r7, r0, #0x350
	addne r7, r5, r8
	mov r4, r8
_08094698:
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
	bgt _08094698
	add r0, pc, #0x2F @ =SoundMainRAM_ChanLoop
	bx r0

	thumb_func_start SoundMainRAM_NoReverb
SoundMainRAM_NoReverb: @ 0x080946DC
	movs r0, #0
	mov r1, r8
	adds r6, r6, r5
	lsrs r1, r1, #3
	blo _080946EA
	stm r5!, {r0}
	stm r6!, {r0}
_080946EA:
	lsrs r1, r1, #1
	blo _080946F6
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
_080946F6:
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, #1
	bgt _080946F6

	non_word_aligned_thumb_func_start SoundMainRAM_ChanLoop
SoundMainRAM_ChanLoop: @ 0x0809470A
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #0x18]
	mov ip, r0
	ldrb r0, [r4, #6]
	adds r4, #0x50
_08094714:
	str r0, [sp, #4]
	ldr r3, [r4, #0x24]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08094734
	ldr r1, _08094730 @ =0x04000006
	ldrb r1, [r1]
	cmp r1, #0xa0
	bhs _08094728
	adds r1, #0xe4
_08094728:
	cmp r1, r0
	blo _08094734
	b _08094A06
	.align 2, 0
_08094730: .4byte 0x04000006
_08094734:
	ldrb r6, [r4]
	movs r0, #0xc7
	tst r0, r6
	bne _0809473E
	b sub_080949FC
_0809473E:
	movs r0, #0x80
	tst r0, r6
	beq _0809476E
	movs r0, #0x40
	tst r0, r6
	bne _0809477E
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
	beq _080947C6
	movs r0, #0x10
	orrs r6, r0
	strb r6, [r4]
	b _080947C6
_0809476E:
	ldrb r5, [r4, #9]
	movs r0, #4
	tst r0, r6
	beq _08094784
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	bhi _080947D4
_0809477E:
	movs r0, #0
	strb r0, [r4]
	b sub_080949FC
_08094784:
	movs r0, #0x40
	tst r0, r6
	beq _080947A4
	ldrb r0, [r4, #7]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	bhi _080947D4
_08094796:
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	beq _0809477E
	movs r0, #4
	orrs r6, r0
	strb r6, [r4]
	b _080947D4
_080947A4:
	movs r2, #3
	ands r2, r6
	cmp r2, #2
	bne _080947C2
	ldrb r0, [r4, #5]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #6]
	cmp r5, r0
	bhi _080947D4
	adds r5, r0, #0
	beq _08094796
	subs r6, #1
	strb r6, [r4]
	b _080947D4
_080947C2:
	cmp r2, #3
	bne _080947D4
_080947C6:
	ldrb r0, [r4, #4]
	adds r5, r5, r0
	cmp r5, #0xff
	blo _080947D4
	movs r5, #0xff
	subs r6, #1
	strb r6, [r4]
_080947D4:
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
	beq _08094808
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x10]
_08094808:
	ldr r5, [sp, #8]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x28]
	add r0, pc, #0x4 @ =sub_08094814
	bx r0
	.align 2, 0

	arm_func_start sub_08094814
sub_08094814: @ 0x08094814
	str r8, [sp]
	ldrb sl, [r4, #0xa]
	ldrb fp, [r4, #0xb]
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldrb r0, [r4, #1]
	tst r0, #8
	beq _08094954
_08094834:
	cmp r2, #4
	ble _080948A4
	subs r2, r2, r8
	movgt lr, #0
	bgt _08094860
	mov lr, r8
	add r2, r2, r8
	sub r8, r2, #4
	sub lr, lr, r8
	ands r2, r2, #3
	moveq r2, #4
_08094860:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_08094868:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	adds r5, r5, #0x40000000
	blo _08094868
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _08094860
	adds r8, r8, lr
	beq _080949E8
_080948A4:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080948AC:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	subs r2, r2, #1
	beq _0809491C
_080948D0:
	adds r5, r5, #0x40000000
	blo _080948AC
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _08094834
	b _080949E8
_080948EC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _08094910
	ldr r3, [sp, #0x14]
	rsb sb, r2, #0
_08094900:
	adds r2, r0, r2
	bgt _080949B8
	sub sb, sb, r0
	b _08094900
_08094910:
	pop {r4, ip}
	mov r2, #0
	b _0809492C
_0809491C:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r3, [sp, #0xc]
	bne _080948D0
_0809492C:
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	b _080949F0
_08094954:
	push {r4, ip}
	ldr lr, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	mul r4, ip, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_08094970:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_08094978:
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
	beq _080949C4
	bic lr, lr, #0x3f800000
	subs r2, r2, sb
	ble _080948EC
	subs sb, sb, #1
	addeq r0, r0, r1
_080949B8:
	ldrsbne r0, [r3, sb]!
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_080949C4:
	adds r5, r5, #0x40000000
	blo _08094978
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _08094970
	sub r3, r3, #1
	pop {r4, ip}
	str lr, [r4, #0x1c]
_080949E8:
	str r2, [r4, #0x18]
	str r3, [r4, #0x28]
_080949F0:
	ldr r8, [sp]
	add r0, pc, #0x1 @ =sub_080949FC
	bx r0

	thumb_func_start sub_080949FC
sub_080949FC: @ 0x080949FC
	ldr r0, [sp, #4]
	subs r0, #1
	ble _08094A06
	adds r4, #0x40
	b _08094714
_08094A06:
	ldr r0, [sp, #0x18]
	ldr r3, _08094A1C @ =0x68736D53
	str r3, [r0]
	add sp, #0x1c
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	non_word_aligned_thumb_func_start sub_0200fbce
sub_0200fbce: @ 0x0200FBCE
	bx r3
	.align 2, 0
_08094A1C: .4byte 0x68736D53

	thumb_func_start SoundMainBTM
SoundMainBTM: @ 0x0814F810
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

	thumb_func_start RealClearChain
RealClearChain: @ 0x0200FBEC
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0200FC0A
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _0200FBFE
	str r1, [r2, #0x34]
	b _0200FC00
_0200FBFE:
	str r1, [r3, #0x20]
_0200FC00:
	cmp r1, #0
	beq _0200FC06
	str r2, [r1, #0x30]
_0200FC06:
	movs r1, #0
	str r1, [r0, #0x2c]
_0200FC0A:
	bx lr

	thumb_func_start ply_fine
ply_fine:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0200FC30
_0200FC16:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0200FC24
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_0200FC24:
	adds r0, r4, #0
	bl RealClearChain
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0200FC16
_0200FC30:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MPlayJumpTableCopy
MPlayJumpTableCopy: @ 0x0200FC3C
	mov ip, lr
	movs r1, #0x24
	ldr r2, _0200FC6C @ =gMPlayJumpTableTemplate
_0200FC42:
	ldr r3, [r2]
	bl _0200FC56
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _0200FC42
	bx ip
	.align 2, 0

	thumb_func_start sub_0200fc54
sub_0200fc54: @ 0x0200FC54
	ldrb r3, [r2]
_0200FC56:
	push {r0}
	lsrs r0, r2, #0x19
	bne _0200FC68
	ldr r0, _0200FC6C @ =gMPlayJumpTableTemplate
	cmp r2, r0
	blo _0200FC66
	lsrs r0, r2, #0xe
	beq _0200FC68
_0200FC66:
	movs r3, #0
_0200FC68:
	pop {r0}
	bx lr
	.align 2, 0
_0200FC6C: .4byte gMPlayJumpTableTemplate

	thumb_func_start sub_0200fc70
sub_0200fc70: @ 0x0200FC70
	ldr r2, [r1, #0x40]

	non_word_aligned_thumb_func_start sub_0200fc72
sub_0200fc72: @ 0x0200FC72
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b _0200FC56
	.align 2, 0
_0200FC7C:
	push {lr}
_0200FC7E:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl sub_0200fc54
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0

	thumb_func_start sub_0200FC9C
sub_0200FC9C: @ 0x0200FC9C
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _0200FCB4
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
	strb r2, [r1, #2]
	b _0200FC7C
_0200FCB4:
	b ply_fine
	.align 2, 0

	thumb_func_start sub_0200FCB8
sub_0200FCB8: @ 0x0200FCB8
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _0200FCCA
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_0200FCCA:
	bx lr

	thumb_func_start sub_0200fccc
sub_0200fccc: @ 0x0200FCCC
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _0200FCDC
	adds r2, #1
	str r2, [r1, #0x40]
	b _0200FC7E
_0200FCDC:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl sub_0200fc70
	cmp ip, r3
	bhs _0200FCEE
	b _0200FC7E
_0200FCEE:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200FCFC
sub_0200FCFC: @ 0x0200FCFC
	mov ip, lr
	bl sub_0200fc70
	strb r3, [r1, #0x1d]
	bx ip
	.align 2, 0

	thumb_func_start sub_0200FD08
sub_0200FD08: @ 0x0200FD08
	mov ip, lr
	bl sub_0200fc70
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip

	thumb_func_start sub_0200FD1C
sub_0200FD1C: @ 0x0200FD1C
	mov ip, lr
	bl sub_0200fc70
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0200FD30
sub_0200FD30: @ 0x0200FD30
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
	bl _0200FC56
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl _0200FC56
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl _0200FC56
	str r3, [r1, #0x2c]
	bx ip
	.align 2, 0

	thumb_func_start sub_0200FD60
sub_0200FD60: @ 0x0200FD60
	mov ip, lr
	bl sub_0200fc70
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0200FD74
sub_0200FD74: @ 0x0200FD74
	mov ip, lr
	bl sub_0200fc70
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_0200FD88
sub_0200FD88: @ 0x0200FD88
	mov ip, lr
	bl sub_0200fc70
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_0200FD9C
sub_0200FD9C: @ 0x0200FD9C
	mov ip, lr
	bl sub_0200fc70
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0200FDB0
sub_0200FDB0: @ 0x0200FDB0
	mov ip, lr
	bl sub_0200fc70
	strb r3, [r1, #0x1b]
	bx ip
	.align 2, 0

	thumb_func_start sub_0200FDBC
sub_0200FDBC: @ 0x0200FDBC
	mov ip, lr
	bl sub_0200fc70
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _0200FDD2
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_0200FDD2:
	bx ip

	thumb_func_start sub_0200FDD4
sub_0200FDD4: @ 0x0200FDD4
	mov ip, lr
	bl sub_0200fc70
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_0200FDE8
sub_0200FDE8: @ 0x0200FDE8
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _0200FDFC @ =0x04000060
	adds r0, r0, r3
	bl sub_0200fc72
	strb r3, [r0]
	bx ip
	.align 2, 0
_0200FDFC: .4byte 0x04000060

	thumb_func_start sub_0200fe00
sub_0200fe00: @ 0x0200FE00
	ldr r0, _020100AC @ =SOUND_INFO_PTR
	ldr r0, [r0]
	ldr r2, _020100B0 @ =0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _0200FE40
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _0200FE40
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _0200FE44 @ =0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _0200FE26
	ldr r1, _0200FE48 @ =0x84400004
	str r1, [r2, #8]
_0200FE26:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _0200FE30
	ldr r1, _0200FE48 @ =0x84400004
	str r1, [r2, #0x14]
_0200FE30:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_0200FE40:
	bx lr
	.align 2, 0
_0200FE44: .4byte 0x040000BC
_0200FE48: .4byte 0x84400004

	thumb_func_start MPlayMain
MPlayMain: @ 0x0200FE4C
	ldr r2, _020100B0 @ =0x68736D53
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _0200FE56
	bx lr
_0200FE56:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _0200FE68
	ldr r0, [r0, #0x3c]
	bl sub_020100a4
_0200FE68:
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
	bge _0200FE80
	b _02010094
_0200FE80:
	ldr r0, _020100AC @ =SOUND_INFO_PTR
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl FadeOutBody
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0200FE94
	b _02010094
_0200FE94:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _0200FFE4
_0200FE9C:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_0200FEA4:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _0200FEAE
	b _0200FFC0
_0200FEAE:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0200FEE2
_0200FEBA:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0200FED6
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _0200FEDC
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _0200FEDC
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _0200FEDC
_0200FED6:
	adds r0, r4, #0
	bl ClearChain
_0200FEDC:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0200FEBA
_0200FEE2:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _0200FF60
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
	b _0200FF60
_0200FF08:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _0200FF14
	ldrb r1, [r5, #7]
	b _0200FF1E
_0200FF14:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _0200FF1E
	strb r1, [r5, #7]
_0200FF1E:
	cmp r1, #0xcf
	blo _0200FF34
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_020100a4
	b _0200FF60
_0200FF34:
	cmp r1, #0xb0
	bls _0200FF56
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_020100a4
	ldrb r0, [r5]
	cmp r0, #0
	beq _0200FFBC
	b _0200FF60
_0200FF56:
	ldr r0, _020100A8 @ =gUnknown_02019CCC
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_0200FF60:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0200FF08
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _0200FFBC
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _0200FFBC
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _0200FF82
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _0200FFBC
_0200FF82:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _0200FF96
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _0200FF9A
_0200FF96:
	movs r0, #0x80
	subs r2, r0, r1
_0200FF9A:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _0200FFBC
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _0200FFB6
	movs r1, #0xc
	b _0200FFB8
_0200FFB6:
	movs r1, #3
_0200FFB8:
	orrs r0, r1
	strb r0, [r5]
_0200FFBC:
	mov r3, sl
	mov r4, fp
_0200FFC0:
	subs r6, #1
	ble _0200FFCC
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _0200FEA4
_0200FFCC:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _0200FFDE
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _02010094
_0200FFDE:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_0200FFE4:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _0200FFEC
	b _0200FE9C
_0200FFEC:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_0200FFF0:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _0201008A
	movs r1, #0xf
	tst r1, r0
	beq _0201008A
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _02010080
_0201000E:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _0201001E
	adds r0, r4, #0
	bl ClearChain
	b _0201007A
_0201001E:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _0201003C
	bl sub_020100f8
	cmp r6, #0
	beq _0201003C
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_0201003C:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _0201007A
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _02010050
	movs r2, #0
_02010050:
	cmp r6, #0
	beq _0201006E
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl sub_020100a4
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _0201007A
_0201006E:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl MidiKeyToFreq
	str r0, [r4, #0x20]
_0201007A:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0201000E
_02010080:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_0201008A:
	subs r2, #1
	ble _02010094
	movs r0, #0x50
	adds r5, r5, r0
	bgt _0200FFF0
_02010094:
	ldr r0, _020100B0 @ =0x68736D53
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	thumb_func_start sub_020100a4
sub_020100a4: @ 0x020100A4
	bx r3
	.align 2, 0
_020100A8: .4byte gUnknown_02019CCC
_020100AC: .4byte SOUND_INFO_PTR
_020100B0: .4byte 0x68736D53

	thumb_func_start TrackStop
TrackStop: @ 0x020100B4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _020100EC
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _020100EA
	movs r6, #0
_020100C8:
	ldrb r0, [r4]
	cmp r0, #0
	beq _020100E2
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _020100E0
	ldr r3, _020100F4 @ =SOUND_INFO_PTR
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_020100a4
_020100E0:
	strb r6, [r4]
_020100E2:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _020100C8
_020100EA:
	str r4, [r5, #0x20]
_020100EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020100F4: .4byte SOUND_INFO_PTR

	thumb_func_start sub_020100f8
sub_020100f8: @ 0x020100F8
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
	bls _02010110
	movs r0, #0xff
_02010110:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _02010124
	movs r0, #0xff
_02010124:
	strb r0, [r4, #3]
	bx lr

	thumb_func_start ply_note
ply_note: @ 0x02010128
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _02010320 @ =SOUND_INFO_PTR
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _02010324 @ =gUnknown_02019CCC
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _0201016E
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _0201016C
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _0201016C
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_0201016C:
	str r3, [r5, #0x40]
_0201016E:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _020101C0
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _0201018E
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _02010190
_0201018E:
	adds r0, r3, #0
_02010190:
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
	beq _020101A8
	b _0201030E
_020101A8:
	movs r0, #0x80
	tst r0, r2
	beq _020101C4
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _020101BC
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_020101BC:
	ldrb r3, [r6, #1]
	b _020101C4
_020101C0:
	mov sb, r4
	ldrb r3, [r5, #5]
_020101C4:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _020101D4
	movs r0, #0xff
_020101D4:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _02010214
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _020101EC
	b _0201030E
_020101EC:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _02010268
	movs r0, #0x40
	tst r0, r1
	bne _02010268
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _02010268
	beq _0201020C
	b _0201030E
_0201020C:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _02010268
	b _0201030E
_02010214:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_02010222:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _02010268
	movs r0, #0x40
	tst r0, r1
	beq _0201023C
	cmp r2, #0
	bne _02010240
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _0201025A
_0201023C:
	cmp r2, #0
	bne _0201025C
_02010240:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _0201024C
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _0201025A
_0201024C:
	bhi _0201025C
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _02010258
	adds r7, r0, #0
	b _0201025A
_02010258:
	blo _0201025C
_0201025A:
	mov r8, r4
_0201025C:
	adds r4, #0x40
	subs r3, #1
	bgt _02010222
	mov r4, r8
	cmp r4, #0
	beq _0201030E
_02010268:
	adds r0, r4, #0
	bl ClearChain
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _0201027C
	str r4, [r3, #0x30]
_0201027C:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _0201028E
	adds r1, r5, #0
	bl sub_02010368
_0201028E:
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
	bl sub_020100f8
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _020102C8
	movs r3, #0
_020102C8:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _020102F6
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _020102E2
	movs r0, #0x70
	tst r0, r1
	bne _020102E4
_020102E2:
	movs r1, #8
_020102E4:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_020100a4
	b _02010300
_020102F6:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl MidiKeyToFreq
_02010300:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_0201030E:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_02010320: .4byte SOUND_INFO_PTR
_02010324: .4byte gUnknown_02019CCC

	thumb_func_start ply_endtie
ply_endtie: @ 0x02010328
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _0201033A
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _0201033C
_0201033A:
	ldrb r3, [r1, #5]
_0201033C:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _02010364
	movs r4, #0x83
	movs r5, #0x40
_02010346:
	ldrb r2, [r1]
	tst r2, r4
	beq _0201035E
	tst r2, r5
	bne _0201035E
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _0201035E
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _02010364
_0201035E:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _02010346
_02010364:
	pop {r4, r5}
	bx lr

	thumb_func_start sub_02010368
sub_02010368: @ 0x02010368
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _02010378
	movs r2, #0xc
	b _0201037A
_02010378:
	movs r2, #3
_0201037A:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_02010384
sub_02010384: @ 0x02010384
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0

	thumb_func_start ply_lfos
ply_lfos: @ 0x02010390
	mov ip, lr
	bl sub_02010384
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _020103A0
	bl sub_02010368
_020103A0:
	bx ip
	.align 2, 0

	thumb_func_start ply_mod
ply_mod: @ 0x020103A4
	mov ip, lr
	bl sub_02010384
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _020103B4
	bl sub_02010368
_020103B4:
	bx ip
	.align 2, 0
