.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0804FB18 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FB1C @ =IWRAM_START + 0x654
	adds r4, r0, r1
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x16
	mov ip, r3
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r6, _0804FB20 @ =IWRAM_START + 0x662
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804FADC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FB00
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FADC
_0804FB00:
	cmp r3, #8
	bne _0804FB06
	movs r5, #1
_0804FB06:
	cmp r5, #0
	beq sub_804FAA4__return
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FB24
	mov r0, ip
	adds r0, #0x46
	b _0804FB28
	.align 2, 0
_0804FB18: .4byte gCurTask
_0804FB1C: .4byte IWRAM_START + 0x654
_0804FB20: .4byte IWRAM_START + 0x662
_0804FB24:
	mov r0, ip
	subs r0, #0x46
_0804FB28:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _0804FB88 @ =0x000003FF
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r7, #0
	adds r2, r4, #0
	adds r2, #0xe
	str r2, [sp, #0x10]
	adds r3, r4, #0
	adds r3, #0x1e
	str r3, [sp, #0x14]
	adds r6, r4, #0
	adds r6, #0x2e
	str r6, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x30
	str r1, [sp, #0x1c]
	movs r2, #0x70
	adds r2, r2, r4
	mov sl, r2
	adds r4, #0x74
	mov sb, r4
	ldr r3, _0804FB8C @ =gSineTable
	mov r8, r3
_0804FB5E:
	mov r6, sp
	adds r0, r6, r7
	ldrb r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r6
	movs r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	cmp r7, #3
	bhi _0804FB90
	lsls r0, r7, #4
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r5, r0, #4
	b _0804FBA4
	.align 2, 0
_0804FB88: .4byte 0x000003FF
_0804FB8C: .4byte gSineTable
_0804FB90:
	subs r0, r7, #4
	lsls r1, r0, #4
	mov r3, ip
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x14
	lsrs r5, r1, #0x10
_0804FBA4:
	ldr r0, _0804FC0C @ =0x000003FF
	ands r4, r0
	lsls r2, r6, #2
	ldr r1, [sp, #0x18]
	adds r3, r1, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r5
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	ldr r3, [sp, #0x1c]
	adds r2, r3, r2
	lsls r0, r4, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2]
	lsls r1, r6, #3
	mov r6, sl
	adds r0, r6, r1
	ldr r2, [sp, #8]
	str r2, [r0]
	add r1, sb
	ldr r3, [sp, #0xc]
	str r3, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _0804FB5E
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
sub_804FAA4__return:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC0C: .4byte 0x000003FF

.syntax divided
