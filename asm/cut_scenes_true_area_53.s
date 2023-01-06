.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateTrueArea53
CreateTrueArea53: @ 0x08036C54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08036DE8 @ =gBldRegs
	movs r4, #0
	movs r3, #0
	ldr r0, _08036DEC @ =0x00003FFF
	strh r0, [r1]
	strh r3, [r1, #2]
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r0, _08036DF0 @ =sub_80392AC
	movs r1, #0x9f
	lsls r1, r1, #2
	movs r2, #0xe0
	lsls r2, r2, #7
	str r3, [sp]
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	strb r4, [r6]
	movs r0, #0xb9
	lsls r0, r0, #1
	str r0, [r6, #4]
	movs r0, #0xe8
	str r0, [r6, #8]
	strb r4, [r6, #0xe]
	strb r4, [r6, #0xf]
	movs r5, #0
	mov ip, r5
	ldr r0, _08036DF4 @ =gUnknown_080D7830
	mov r8, r0
	ldr r4, _08036DF8 @ =IWRAM_START + 0x130
	adds r4, r4, r1
	mov sl, r4
	ldr r7, _08036DFC @ =IWRAM_START + 0x132
	adds r7, r7, r1
	mov sb, r7
_08036CAC:
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	lsls r4, r5, #3
	adds r1, r6, #0
	adds r1, #0x30
	adds r1, r1, r4
	lsls r3, r5, #2
	adds r2, r3, r5
	lsls r2, r2, #1
	mov r7, r8
	adds r0, r2, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	lsls r0, r0, #8
	str r0, [r1]
	adds r1, r6, #0
	adds r1, #0x34
	adds r1, r1, r4
	ldr r0, _08036E00 @ =gUnknown_080D7832
	adds r2, r2, r0
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #8
	str r0, [r1]
	mov r7, sl
	adds r0, r7, r3
	mov r1, ip
	strh r1, [r0]
	add r3, sb
	strh r1, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x1f
	bls _08036CAC
	movs r4, #0xd8
	lsls r4, r4, #1
	adds r0, r6, r4
	movs r2, #0
	movs r5, #1
	strb r5, [r0]
	movs r7, #0xda
	lsls r7, r7, #1
	adds r1, r6, r7
	movs r0, #0xc8
	lsls r0, r0, #7
	str r0, [r1]
	movs r0, #0xdc
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #0xb4
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0xde
	lsls r1, r1, #1
	adds r1, r1, r6
	mov ip, r1
	strh r2, [r1, #0x16]
	strh r2, [r1, #0x18]
	ldr r3, _08036E04 @ =gUnknown_080D7560
	ldr r0, [r3]
	str r0, [r1, #4]
	ldrh r0, [r3, #0x24]
	strh r0, [r1, #0xa]
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r1, [r0]
	adds r4, #0x2c
	adds r0, r6, r4
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	mov r5, ip
	strh r0, [r5, #0x1a]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	adds r7, #0x29
	adds r1, r6, r7
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0xdf
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r4, #5
	adds r1, r6, r4
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r5, #0x10]
	movs r5, #0
	movs r4, #0
_08036D6E:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r7, #0xf6
	lsls r7, r7, #1
	adds r0, r0, r7
	adds r0, r0, r6
	mov ip, r0
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	adds r2, r5, #1
	lsls r1, r2, #3
	adds r1, r1, r3
	ldr r0, [r1]
	mov r5, ip
	str r0, [r5, #4]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r4, [r5, #0x10]
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	cmp r5, #2
	bls _08036D6E
	bl sub_803986C
	bl sub_8039A4C
	movs r0, #0x30
	bl m4aSongNumStart
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036DE8: .4byte gBldRegs
_08036DEC: .4byte 0x00003FFF
_08036DF0: .4byte sub_80392AC
_08036DF4: .4byte gUnknown_080D7830
_08036DF8: .4byte IWRAM_START + 0x130
_08036DFC: .4byte IWRAM_START + 0x132
_08036E00: .4byte gUnknown_080D7832
_08036E04: .4byte gUnknown_080D7560

	thumb_func_start sub_8036E08
sub_8036E08: @ 0x08036E08
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08036ED8 @ =sub_8036EF8
	movs r1, #0xe4
	lsls r1, r1, #1
	movs r2, #0xe0
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	str r0, [r1, #0x34]
	ldr r0, _08036EDC @ =IWRAM_START + 0x188
	adds r1, r2, r0
	ldr r0, _08036EE0 @ =0x06008000
	str r0, [r1, #4]
	movs r3, #0
	strh r4, [r1, #0xa]
	ldr r0, _08036EE4 @ =0x0600E000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	ldr r0, _08036EE8 @ =0x0000017B
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	movs r0, #9
	strh r0, [r1, #0x22]
	movs r0, #1
	strh r0, [r1, #0x24]
	movs r0, #0xd
	strh r0, [r1, #0x26]
	movs r0, #0x12
	strh r0, [r1, #0x28]
	ldr r0, _08036EEC @ =IWRAM_START + 0x1B2
	adds r2, r2, r0
	strb r3, [r2]
	movs r0, #2
	strh r0, [r1, #0x2e]
	movs r3, #0
	movs r6, #0
	ldr r5, _08036EF0 @ =0x00000345
_08036E6C:
	lsls r2, r3, #1
	mov r0, ip
	adds r0, #8
	adds r0, r0, r2
	strh r4, [r0]
	lsls r1, r3, #2
	mov r0, ip
	adds r0, #0x18
	adds r0, r0, r1
	movs r1, #0xb4
	lsls r1, r1, #8
	str r1, [r0]
	adds r2, r2, r3
	lsls r2, r2, #4
	adds r2, #0x38
	mov r0, ip
	adds r1, r0, r2
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	lsls r0, r3, #9
	ldr r2, _08036EF4 @ =0x06013000
	adds r0, r0, r2
	str r0, [r1, #4]
	strh r5, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	strb r3, [r0]
	adds r2, r1, #0
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x25
	strb r6, [r0]
	str r4, [r1, #0x10]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #6
	bls _08036E6C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036ED8: .4byte sub_8036EF8
_08036EDC: .4byte IWRAM_START + 0x188
_08036EE0: .4byte 0x06008000
_08036EE4: .4byte 0x0600E000
_08036EE8: .4byte 0x0000017B
_08036EEC: .4byte IWRAM_START + 0x1B2
_08036EF0: .4byte 0x00000345
_08036EF4: .4byte 0x06013000

	thumb_func_start sub_8036EF8
sub_8036EF8: @ 0x08036EF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08036FD4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r7, #0
	ldr r0, _08036FD8 @ =0x000003FF
	mov sl, r0
	ldr r1, _08036FDC @ =gSineTable
	mov sb, r1
_08036F1C:
	lsls r0, r7, #1
	adds r4, r0, r7
	lsls r4, r4, #4
	adds r4, #0x38
	add r4, r8
	mov r1, r8
	adds r1, #8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	lsls r2, r7, #2
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r2
	ldrh r2, [r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xf
	muls r0, r1, r0
	lsrs r0, r0, #9
	mov r2, sl
	ands r2, r0
	str r2, [sp]
	adds r0, r7, #0
	adds r0, #0xd
	muls r1, r0, r1
	lsrs r1, r1, #9
	mov r3, sl
	ands r1, r3
	str r1, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r3, [r0, r2]
	mov r2, r8
	ldr r0, [r2, #0x34]
	movs r2, #0x20
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r5, r0, #0xe
	lsls r1, r1, #1
	add r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x64
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #6
	bls _08036F1C
	mov r1, r8
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	cmp r0, #0
	bne _08036FC2
	movs r0, #0xb4
	lsls r0, r0, #1
	str r0, [r1, #0x34]
	ldr r0, _08036FD4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08036FE0 @ =sub_8036FE4
	str r0, [r1, #8]
_08036FC2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036FD4: .4byte gCurTask
_08036FD8: .4byte 0x000003FF
_08036FDC: .4byte gSineTable
_08036FE0: .4byte sub_8036FE4

	thumb_func_start sub_8036FE4
sub_8036FE4: @ 0x08036FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080370B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r7, #0
	ldr r0, _080370B4 @ =0x000003FF
	mov sl, r0
	ldr r1, _080370B8 @ =gSineTable
	mov sb, r1
_08037008:
	lsls r0, r7, #1
	adds r4, r0, r7
	lsls r4, r4, #4
	adds r4, #0x38
	add r4, r8
	mov r1, r8
	adds r1, #8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	lsls r2, r7, #2
	mov r0, r8
	adds r0, #0x18
	adds r0, r0, r2
	ldrh r2, [r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xf
	muls r0, r1, r0
	lsrs r0, r0, #9
	mov r2, sl
	ands r2, r0
	str r2, [sp]
	adds r0, r7, #0
	adds r0, #0xd
	muls r1, r0, r1
	lsrs r1, r1, #9
	mov r3, sl
	ands r1, r3
	str r1, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r5, r0, #9
	lsls r1, r1, #1
	add r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	asrs r6, r0, #0xb
	adds r0, r5, #0
	adds r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x64
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #6
	bls _08037008
	mov r1, r8
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	cmp r0, #0
	bne _0803709E
	movs r0, #0x20
	str r0, [r1, #0x34]
	ldr r0, _080370B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080370BC @ =sub_80370C0
	str r0, [r1, #8]
_0803709E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080370B0: .4byte gCurTask
_080370B4: .4byte 0x000003FF
_080370B8: .4byte gSineTable
_080370BC: .4byte sub_80370C0

	thumb_func_start sub_80370C0
sub_80370C0: @ 0x080370C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r7, _0803712C @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, [r0, #0x34]
	subs r3, r0, #1
	mov r0, r8
	str r3, [r0, #0x34]
	cmp r3, #0
	bne _08037158
	movs r0, #0x78
	mov r1, r8
	str r0, [r1, #0x34]
	ldr r1, _08037130 @ =gBgCntRegs
	movs r2, #0
	ldr r0, _08037134 @ =0x00001C08
	strh r0, [r1, #4]
	ldr r1, _08037138 @ =gBldRegs
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r1, _0803713C @ =gDispCnt
	ldr r0, _08037140 @ =0x00005540
	strh r0, [r1]
	ldr r0, _08037144 @ =gBgScrollRegs
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	ldr r0, _08037148 @ =gUnknown_03004D80
	strb r2, [r0, #2]
	ldr r1, _0803714C @ =gUnknown_03002280
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x14
	strb r0, [r1, #0xb]
	ldr r2, _08037150 @ =IWRAM_START + 0x188
	adds r0, r4, r2
	bl sub_8002A3C
	ldr r1, [r7]
	ldr r0, _08037154 @ =sub_8037254
	str r0, [r1, #8]
	b _08037226
	.align 2, 0
_0803712C: .4byte gCurTask
_08037130: .4byte gBgCntRegs
_08037134: .4byte 0x00001C08
_08037138: .4byte gBldRegs
_0803713C: .4byte gDispCnt
_08037140: .4byte 0x00005540
_08037144: .4byte gBgScrollRegs
_08037148: .4byte gUnknown_03004D80
_0803714C: .4byte gUnknown_03002280
_08037150: .4byte IWRAM_START + 0x188
_08037154: .4byte sub_8037254
_08037158:
	cmp r3, #0xf
	bhi _0803718E
	ldr r2, _08037238 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0803723C @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r2]
	mov r0, r8
	ldr r1, [r0, #0x34]
	movs r0, #0x10
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldr r1, _08037240 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1, #8]
	movs r0, #0xff
	strh r0, [r1, #0xa]
_0803718E:
	movs r7, #0
	ldr r1, _08037244 @ =IWRAM_START + 0x8
	adds r1, r4, r1
	str r1, [sp, #8]
	ldr r2, _08037248 @ =IWRAM_START + 0x18
	adds r2, r4, r2
	str r2, [sp, #0xc]
	ldr r3, _0803724C @ =0x000003FF
	mov sl, r3
	ldr r0, _08037250 @ =gSineTable
	mov sb, r0
_080371A4:
	lsls r1, r7, #1
	adds r4, r1, r7
	lsls r4, r4, #4
	adds r4, #0x38
	add r4, r8
	ldr r2, [sp, #8]
	adds r1, r2, r1
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	lsls r0, r7, #2
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	ldrh r2, [r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xf
	muls r0, r1, r0
	lsrs r0, r0, #9
	mov r2, sl
	ands r2, r0
	str r2, [sp]
	adds r0, r7, #0
	adds r0, #0xd
	muls r1, r0, r1
	lsrs r1, r1, #9
	mov r3, sl
	ands r1, r3
	str r1, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r3, r8
	ldr r2, [r3, #0x34]
	muls r0, r2, r0
	lsrs r5, r0, #0xe
	lsls r1, r1, #1
	add r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x64
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #6
	bls _080371A4
_08037226:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037238: .4byte gDispCnt
_0803723C: .4byte gBldRegs
_08037240: .4byte gWinRegs
_08037244: .4byte IWRAM_START + 0x8
_08037248: .4byte IWRAM_START + 0x18
_0803724C: .4byte 0x000003FF
_08037250: .4byte gSineTable

	thumb_func_start sub_8037254
sub_8037254: @ 0x08037254
	push {lr}
	ldr r0, _08037284 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0, #0x34]
	subs r1, #1
	str r1, [r0, #0x34]
	cmp r1, #0
	bne _08037294
	ldr r1, _08037288 @ =gDispCnt
	movs r3, #0x8a
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _0803728C @ =gBgCntRegs
	ldr r0, _08037290 @ =0x00001C0B
	strh r0, [r1, #4]
	adds r0, r2, #0
	bl TaskDestroy
	b _080372BC
	.align 2, 0
_08037284: .4byte gCurTask
_08037288: .4byte gDispCnt
_0803728C: .4byte gBgCntRegs
_08037290: .4byte 0x00001C0B
_08037294:
	cmp r1, #0x74
	bhi _080372BC
	ldr r1, _080372C0 @ =gBldRegs
	ldrh r2, [r1, #4]
	cmp r2, #0
	beq _080372BC
	movs r0, #0xbf
	strh r0, [r1]
	subs r0, r2, #1
	strh r0, [r1, #4]
	ldr r1, _080372C4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1, #8]
	movs r0, #0xff
	strh r0, [r1, #0xa]
_080372BC:
	pop {r0}
	bx r0
	.align 2, 0
_080372C0: .4byte gBldRegs
_080372C4: .4byte gWinRegs

	thumb_func_start sub_80372C8
sub_80372C8: @ 0x080372C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	str r1, [sp, #4]
	ldr r0, _080373A8 @ =sub_80373CC
	movs r2, #0xe0
	lsls r2, r2, #7
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldr r6, _080373AC @ =gPseudoRandom
	ldr r1, [r6]
	ldr r2, _080373B0 @ =0x00196225
	mov sb, r2
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	ldr r7, _080373B4 @ =0x3C6EF35F
	mov r8, r7
	add r1, r8
	str r1, [r6]
	movs r3, #1
	ands r3, r1
	adds r3, #2
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	movs r0, #0
	mov ip, r0
	movs r0, #0x28
	strh r0, [r2]
	mov r7, sb
	muls r7, r1, r7
	adds r1, r7, #0
	add r1, r8
	str r1, [r6]
	movs r0, #0x1f
	mov sl, r0
	adds r0, r1, #0
	mov r7, sl
	ands r0, r7
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	ldr r7, [sp, #8]
	adds r0, r7, r0
	str r0, [r2, #4]
	mov r0, sb
	muls r0, r1, r0
	add r0, r8
	str r0, [r6]
	mov r1, sl
	ands r0, r1
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	ldr r6, [sp, #4]
	adds r1, r6, r0
	str r1, [r2, #8]
	strh r5, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldr r7, _080373B8 @ =IWRAM_START + 0x10
	adds r1, r4, r7
	strh r5, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _080373BC @ =gUnknown_080D7540
	lsls r3, r3, #3
	adds r3, r3, r0
	ldr r0, [r3]
	str r0, [r1, #4]
	ldrh r0, [r3, #4]
	strh r0, [r1, #0xa]
	ldrb r2, [r3, #6]
	ldr r3, _080373C0 @ =IWRAM_START + 0x30
	adds r0, r4, r3
	strb r2, [r0]
	ldr r6, _080373C4 @ =IWRAM_START + 0x31
	adds r2, r4, r6
	movs r0, #0xff
	strb r0, [r2]
	adds r0, #1
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	adds r7, #0x22
	adds r2, r4, r7
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, _080373C8 @ =IWRAM_START + 0x35
	adds r4, r4, r0
	mov r2, ip
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r1, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080373A8: .4byte sub_80373CC
_080373AC: .4byte gPseudoRandom
_080373B0: .4byte 0x00196225
_080373B4: .4byte 0x3C6EF35F
_080373B8: .4byte IWRAM_START + 0x10
_080373BC: .4byte gUnknown_080D7540
_080373C0: .4byte IWRAM_START + 0x30
_080373C4: .4byte IWRAM_START + 0x31
_080373C8: .4byte IWRAM_START + 0x35

	thumb_func_start sub_80373CC
sub_80373CC: @ 0x080373CC
	push {r4, r5, lr}
	ldr r0, _0803740C @ =gCurTask
	ldr r5, [r0]
	ldrh r1, [r5, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	adds r0, #0x10
	adds r4, r1, r0
	ldrh r0, [r2, #0xe]
	adds r0, #0x10
	strh r0, [r2, #0xe]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #4]
	adds r3, r0, r1
	str r3, [r2, #4]
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037410
	adds r0, r5, #0
	bl TaskDestroy
	b _0803742C
	.align 2, 0
_0803740C: .4byte gCurTask
_08037410:
	asrs r0, r3, #8
	strh r0, [r4, #0x16]
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, _08037434 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803742C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037434: .4byte gCamera

	thumb_func_start sub_8037438
sub_8037438: @ 0x08037438
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08037520 @ =gUnknown_080D7970
	lsls r4, r7, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r2, #0xe0
	lsls r2, r2, #7
	movs r5, #0
	str r5, [sp]
	movs r1, #0x74
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0
	strb r7, [r0]
	strb r5, [r0, #1]
	ldr r2, _08037524 @ =gUnknown_080D7704
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #2]
	ldr r2, _08037528 @ =gUnknown_080D77D0
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1, #8]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r3, r2, #4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r1, #0xc]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x10]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x12]
	ldr r0, _0803752C @ =gUnknown_080D76F0
	adds r4, r4, r0
	ldr r1, [r4]
	ldr r0, _08037530 @ =IWRAM_START + 0x14
	adds r4, r6, r0
	mov r0, ip
	ldrb r0, [r0]
	lsls r0, r0, #4
	mov r8, r0
	add r2, r8
	ldr r0, [r2]
	lsls r0, r0, #8
	strh r0, [r4, #0x16]
	mov r2, ip
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	strh r0, [r4, #0x18]
	ldr r0, [r1]
	str r0, [r4, #4]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037534 @ =IWRAM_START + 0x34
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _08037538 @ =IWRAM_START + 0x35
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0803753C @ =gUnknown_080D7984
	adds r0, r7, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r5, [r4, #8]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x1c]
	adds r2, #2
	adds r1, r6, r2
	movs r0, #0x20
	strb r0, [r1]
	cmp r7, #3
	bhi _08037544
	ldr r1, _08037540 @ =IWRAM_START + 0x39
	adds r0, r6, r1
	strb r7, [r0]
	b _0803754C
	.align 2, 0
_08037520: .4byte gUnknown_080D7970
_08037524: .4byte gUnknown_080D7704
_08037528: .4byte gUnknown_080D77D0
_0803752C: .4byte gUnknown_080D76F0
_08037530: .4byte IWRAM_START + 0x14
_08037534: .4byte IWRAM_START + 0x34
_08037538: .4byte IWRAM_START + 0x35
_0803753C: .4byte gUnknown_080D7984
_08037540: .4byte IWRAM_START + 0x39
_08037544:
	ldr r2, _080375AC @ =IWRAM_START + 0x39
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
_0803754C:
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	cmp r7, #3
	bhi _0803759E
	mov r4, ip
	adds r4, #0x44
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #0x16]
	strh r2, [r4, #0x18]
	ldr r1, _080375B0 @ =gUnknown_080D7540
	lsls r0, r7, #3
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r4, #4]
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	mov r0, ip
	adds r0, #0x64
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x65
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x69
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
_0803759E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080375AC: .4byte IWRAM_START + 0x39
_080375B0: .4byte gUnknown_080D7540

	thumb_func_start sub_80375B4
sub_80375B4: @ 0x080375B4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037658 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037634
	ldr r3, _0803765C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037660 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037664 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037668 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803766C @ =sub_8037674
	str r0, [r1, #8]
_08037634:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037670 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037658: .4byte gCurTask
_0803765C: .4byte gUnknown_080D7704
_08037660: .4byte gUnknown_080D76F0
_08037664: .4byte IWRAM_START + 0x34
_08037668: .4byte IWRAM_START + 0x35
_0803766C: .4byte sub_8037674
_08037670: .4byte gCamera

	thumb_func_start sub_8037674
sub_8037674: @ 0x08037674
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037728 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08037696
	movs r0, #0
	strh r0, [r4, #0x10]
_08037696:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037704
	ldr r3, _0803772C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037730 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037734 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037738 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803773C @ =sub_8037744
	str r0, [r1, #8]
_08037704:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037740 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037728: .4byte gCurTask
_0803772C: .4byte gUnknown_080D7704
_08037730: .4byte gUnknown_080D76F0
_08037734: .4byte IWRAM_START + 0x34
_08037738: .4byte IWRAM_START + 0x35
_0803773C: .4byte sub_8037744
_08037740: .4byte gCamera

	thumb_func_start sub_8037744
sub_8037744: @ 0x08037744
	push {r4, r5, r6, r7, lr}
	ldr r7, _080377FC @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08037766
	movs r0, #0
	strh r0, [r4, #0x10]
_08037766:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080377D8
	strh r0, [r4, #0x10]
	ldr r3, _08037800 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037804 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037808 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803780C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08037810 @ =sub_8037818
	str r0, [r1, #8]
_080377D8:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037814 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080377FC: .4byte gCurTask
_08037800: .4byte gUnknown_080D7704
_08037804: .4byte gUnknown_080D76F0
_08037808: .4byte IWRAM_START + 0x34
_0803780C: .4byte IWRAM_START + 0x35
_08037810: .4byte sub_8037818
_08037814: .4byte gCamera

	thumb_func_start sub_8037818
sub_8037818: @ 0x08037818
	push {r4, r5, r6, r7, lr}
	ldr r7, _080378A0 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803787C
	ldr r3, _080378A4 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080378A8 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080378AC @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080378B0 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080378B4 @ =sub_80378BC
	str r0, [r1, #8]
_0803787C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080378B8 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080378A0: .4byte gCurTask
_080378A4: .4byte gUnknown_080D7704
_080378A8: .4byte gUnknown_080D76F0
_080378AC: .4byte IWRAM_START + 0x34
_080378B0: .4byte IWRAM_START + 0x35
_080378B4: .4byte sub_80378BC
_080378B8: .4byte gCamera

	thumb_func_start sub_80378BC
sub_80378BC: @ 0x080378BC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803794C @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _08037950 @ =IWRAM_START + 0x14
	adds r6, r5, r1
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _08037928
	ldr r3, _08037954 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037958 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803795C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037960 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	str r7, [r4, #4]
	mov r2, ip
	ldr r1, [r2]
	ldr r0, _08037964 @ =sub_803796C
	str r0, [r1, #8]
_08037928:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037968 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803794C: .4byte gCurTask
_08037950: .4byte IWRAM_START + 0x14
_08037954: .4byte gUnknown_080D7704
_08037958: .4byte gUnknown_080D76F0
_0803795C: .4byte IWRAM_START + 0x34
_08037960: .4byte IWRAM_START + 0x35
_08037964: .4byte sub_803796C
_08037968: .4byte gCamera

	thumb_func_start sub_803796C
sub_803796C: @ 0x0803796C
	push {r4, r5, lr}
	ldr r0, _08037A24 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldrh r1, [r4, #2]
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080379A4
	cmp r1, #0xf0
	bne _08037996
	bl sub_8036E08
	movs r0, #0x31
	bl m4aSongNumStart
_08037996:
	ldr r1, [r4, #0xc]
	asrs r0, r1, #8
	cmp r0, #0x9c
	ble _080379A4
	adds r0, r1, #0
	subs r0, #0x18
	str r0, [r4, #0xc]
_080379A4:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080379FE
	ldr r3, _08037A28 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037A2C @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08037A24 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08037A30 @ =sub_8037A38
	str r0, [r1, #8]
_080379FE:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037A34 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037A24: .4byte gCurTask
_08037A28: .4byte gUnknown_080D7704
_08037A2C: .4byte gUnknown_080D76F0
_08037A30: .4byte sub_8037A38
_08037A34: .4byte gCamera

	thumb_func_start sub_8037A38
sub_8037A38: @ 0x08037A38
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037AE4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r1, [r4, #2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08037A5E
	ldr r2, _08037AE8 @ =IWRAM_START + 0x36
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08037A5E:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037ABE
	ldr r3, _08037AEC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037AF0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037AF4 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037AF8 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #0x72
	bl m4aSongNumStart
	ldr r1, [r7]
	ldr r0, _08037AFC @ =sub_8037B04
	str r0, [r1, #8]
_08037ABE:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037B00 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037AE4: .4byte gCurTask
_08037AE8: .4byte IWRAM_START + 0x36
_08037AEC: .4byte gUnknown_080D7704
_08037AF0: .4byte gUnknown_080D76F0
_08037AF4: .4byte IWRAM_START + 0x34
_08037AF8: .4byte IWRAM_START + 0x35
_08037AFC: .4byte sub_8037B04
_08037B00: .4byte gCamera

	thumb_func_start sub_8037B04
sub_8037B04: @ 0x08037B04
	push {r4, r5, r6, r7, lr}
	ldr r7, _08037BAC @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldr r2, _08037BB0 @ =gSineTable
	ldr r1, [r4, #4]
	adds r1, #1
	str r1, [r4, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037BB4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037B88
	ldr r3, _08037BB8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08037BBC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037BC0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08037BC4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08037BC8 @ =sub_8037BD0
	str r0, [r1, #8]
_08037B88:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08037BCC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037BAC: .4byte gCurTask
_08037BB0: .4byte gSineTable
_08037BB4: .4byte 0x000003FF
_08037BB8: .4byte gUnknown_080D7704
_08037BBC: .4byte gUnknown_080D76F0
_08037BC0: .4byte IWRAM_START + 0x34
_08037BC4: .4byte IWRAM_START + 0x35
_08037BC8: .4byte sub_8037BD0
_08037BCC: .4byte gCamera

	thumb_func_start sub_8037BD0
sub_8037BD0: @ 0x08037BD0
	push {r4, r5, r6, r7, lr}
	ldr r4, _08037CC0 @ =gCurTask
	ldr r0, [r4]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r7, r0
	adds r0, #0x14
	adds r6, r7, r0
	ldr r2, _08037CC4 @ =gSineTable
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037CC8 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037C54
	ldr r3, _08037CCC @ =gUnknown_080D7704
	ldrb r1, [r5, #1]
	adds r1, #1
	strb r1, [r5, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r5]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5, #2]
	ldr r1, _08037CD0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037CD4 @ =IWRAM_START + 0x34
	adds r0, r7, r2
	strb r1, [r0]
	ldr r0, _08037CD8 @ =IWRAM_START + 0x35
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r4]
	ldr r0, _08037CDC @ =sub_8037CEC
	str r0, [r1, #8]
_08037C54:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, _08037CE0 @ =gCamera
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r2, _08037CE4 @ =IWRAM_START + 0x44
	adds r6, r7, r2
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r1, _08037CE8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08037CBA
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_08037CBA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037CC0: .4byte gCurTask
_08037CC4: .4byte gSineTable
_08037CC8: .4byte 0x000003FF
_08037CCC: .4byte gUnknown_080D7704
_08037CD0: .4byte gUnknown_080D76F0
_08037CD4: .4byte IWRAM_START + 0x34
_08037CD8: .4byte IWRAM_START + 0x35
_08037CDC: .4byte sub_8037CEC
_08037CE0: .4byte gCamera
_08037CE4: .4byte IWRAM_START + 0x44
_08037CE8: .4byte 0xFFFFFBFF

	thumb_func_start sub_8037CEC
sub_8037CEC: @ 0x08037CEC
	push {r4, r5, r6, r7, lr}
	ldr r4, _08037DDC @ =gCurTask
	ldr r0, [r4]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r7, r0
	adds r0, #0x14
	adds r6, r7, r0
	ldr r2, _08037DE0 @ =gSineTable
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037DE4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08037D70
	ldr r3, _08037DE8 @ =gUnknown_080D7704
	ldrb r1, [r5, #1]
	adds r1, #1
	strb r1, [r5, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r5]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5, #2]
	ldr r1, _08037DEC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037DF0 @ =IWRAM_START + 0x34
	adds r0, r7, r2
	strb r1, [r0]
	ldr r0, _08037DF4 @ =IWRAM_START + 0x35
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r4]
	ldr r0, _08037DF8 @ =sub_8037E08
	str r0, [r1, #8]
_08037D70:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, _08037DFC @ =gCamera
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r2, _08037E00 @ =IWRAM_START + 0x44
	adds r6, r7, r2
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r1, _08037E04 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08037DD6
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_08037DD6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DDC: .4byte gCurTask
_08037DE0: .4byte gSineTable
_08037DE4: .4byte 0x000003FF
_08037DE8: .4byte gUnknown_080D7704
_08037DEC: .4byte gUnknown_080D76F0
_08037DF0: .4byte IWRAM_START + 0x34
_08037DF4: .4byte IWRAM_START + 0x35
_08037DF8: .4byte sub_8037E08
_08037DFC: .4byte gCamera
_08037E00: .4byte IWRAM_START + 0x44
_08037E04: .4byte 0xFFFFFBFF

	thumb_func_start sub_8037E08
sub_8037E08: @ 0x08037E08
	push {r4, r5, r6, r7, lr}
	ldr r0, _08037F2C @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r1, _08037F30 @ =IWRAM_START + 0x14
	adds r6, r4, r1
	ldr r2, _08037F34 @ =IWRAM_START + 0x44
	adds r7, r4, r2
	ldr r2, _08037F38 @ =gSineTable
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r1, _08037F3C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08037EC0
	ldr r0, _08037F40 @ =gBldRegs
	strh r1, [r0, #4]
	ldr r3, _08037F44 @ =gUnknown_080D7704
	ldrb r1, [r5, #1]
	adds r1, #1
	strb r1, [r5, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r5]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5, #2]
	ldr r1, _08037F48 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08037F4C @ =IWRAM_START + 0x34
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08037F50 @ =IWRAM_START + 0x35
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08037F54 @ =gUnknown_080D7540
	ldr r0, [r1, #8]
	str r0, [r7, #4]
	ldrh r0, [r1, #0xc]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #0xe]
	adds r2, #0x30
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08037F58 @ =IWRAM_START + 0x65
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	mov r2, ip
	ldr r1, [r2]
	ldr r0, _08037F5C @ =sub_8037F68
	str r0, [r1, #8]
	movs r0, #0x72
	bl m4aSongNumStop
	movs r0, #0xdd
	bl m4aSongNumStart
_08037EC0:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, _08037F60 @ =gCamera
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r1, _08037F64 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08037F24
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_08037F24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037F2C: .4byte gCurTask
_08037F30: .4byte IWRAM_START + 0x14
_08037F34: .4byte IWRAM_START + 0x44
_08037F38: .4byte gSineTable
_08037F3C: .4byte 0x000003FF
_08037F40: .4byte gBldRegs
_08037F44: .4byte gUnknown_080D7704
_08037F48: .4byte gUnknown_080D76F0
_08037F4C: .4byte IWRAM_START + 0x34
_08037F50: .4byte IWRAM_START + 0x35
_08037F54: .4byte gUnknown_080D7540
_08037F58: .4byte IWRAM_START + 0x65
_08037F5C: .4byte sub_8037F68
_08037F60: .4byte gCamera
_08037F64: .4byte 0xFFFFFBFF

	thumb_func_start sub_8037F68
sub_8037F68: @ 0x08037F68
	push {r4, r5, r6, lr}
	ldr r0, _08037FF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0x14
	adds r4, r1, r0
	ldr r1, [r5, #0xc]
	ldr r0, _08037FF4 @ =0xFFFFE000
	cmp r1, r0
	ble _08037F88
	ldr r2, _08037FF8 @ =0xFFFFF800
	adds r0, r1, r2
	str r0, [r5, #0xc]
_08037F88:
	ldr r2, _08037FFC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08038000 @ =gBldRegs
	movs r6, #0
	movs r2, #0xff
	strh r2, [r3]
	ldr r1, _08038004 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _08038032
	ldrh r0, [r3, #4]
	cmp r0, #0x10
	bne _0803802C
	ldr r1, _08038008 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0803800C @ =gUnknown_03002AE4
	ldr r0, _08038010 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08038014 @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _08038018 @ =gVramGraphicsCopyCursor
	ldr r0, _0803801C @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08038020 @ =gGameMode
	strb r6, [r0]
	ldr r0, _08038024 @ =gSelectedCharacter
	strb r6, [r0]
	ldr r1, _08038028 @ =gCurrentLevel
	movs r0, #0x1d
	strb r0, [r1]
	bl ApplyGameStageSettings
	bl GameStageStart
	b _080380A2
	.align 2, 0
_08037FF0: .4byte gCurTask
_08037FF4: .4byte 0xFFFFE000
_08037FF8: .4byte 0xFFFFF800
_08037FFC: .4byte gDispCnt
_08038000: .4byte gBldRegs
_08038004: .4byte gWinRegs
_08038008: .4byte 0x0000FFFF
_0803800C: .4byte gUnknown_03002AE4
_08038010: .4byte gUnknown_0300287C
_08038014: .4byte gUnknown_03005390
_08038018: .4byte gVramGraphicsCopyCursor
_0803801C: .4byte gVramGraphicsCopyQueueIndex
_08038020: .4byte gGameMode
_08038024: .4byte gSelectedCharacter
_08038028: .4byte gCurrentLevel
_0803802C:
	adds r0, #1
	strh r0, [r3, #4]
	b _08038036
_08038032:
	subs r0, #1
	strh r0, [r5, #2]
_08038036:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r6, _080380A8 @ =gCamera
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r5, #2]
	cmp r0, #0x99
	bls _08038090
	adds r4, r5, #0
	adds r4, #0x44
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r1, [r6, #4]
	movs r0, #0xb2
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	ldr r1, _080380AC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_08038090:
	ldrh r1, [r5, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080380A2
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_80372C8
_080380A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080380A8: .4byte gCamera
_080380AC: .4byte 0xFFFFFBFF

	thumb_func_start sub_80380B0
sub_80380B0: @ 0x080380B0
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803814C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038128
	ldr r3, _08038150 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038154 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038158 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803815C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038160 @ =sub_8038168
	str r0, [r1, #8]
_08038128:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038164 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803814C: .4byte gCurTask
_08038150: .4byte gUnknown_080D7704
_08038154: .4byte gUnknown_080D76F0
_08038158: .4byte IWRAM_START + 0x34
_0803815C: .4byte IWRAM_START + 0x35
_08038160: .4byte sub_8038168
_08038164: .4byte gCamera

	thumb_func_start sub_8038168
sub_8038168: @ 0x08038168
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803821C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0803818A
	movs r0, #0
	strh r0, [r4, #0x10]
_0803818A:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080381F8
	ldr r3, _08038220 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038224 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038228 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803822C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038230 @ =sub_8038238
	str r0, [r1, #8]
_080381F8:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038234 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803821C: .4byte gCurTask
_08038220: .4byte gUnknown_080D7704
_08038224: .4byte gUnknown_080D76F0
_08038228: .4byte IWRAM_START + 0x34
_0803822C: .4byte IWRAM_START + 0x35
_08038230: .4byte sub_8038238
_08038234: .4byte gCamera

	thumb_func_start sub_8038238
sub_8038238: @ 0x08038238
	push {r4, r5, r6, r7, lr}
	ldr r7, _080382D4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080382B0
	ldr r3, _080382D8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080382DC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080382E0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080382E4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080382E8 @ =sub_80382F0
	str r0, [r1, #8]
_080382B0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080382EC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080382D4: .4byte gCurTask
_080382D8: .4byte gUnknown_080D7704
_080382DC: .4byte gUnknown_080D76F0
_080382E0: .4byte IWRAM_START + 0x34
_080382E4: .4byte IWRAM_START + 0x35
_080382E8: .4byte sub_80382F0
_080382EC: .4byte gCamera

	thumb_func_start sub_80382F0
sub_80382F0: @ 0x080382F0
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803839C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038312
	movs r0, #0
	strh r0, [r4, #0x10]
_08038312:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038378
	ldr r3, _080383A0 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080383A4 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080383A8 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080383AC @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080383B0 @ =sub_80383B8
	str r0, [r1, #8]
_08038378:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080383B4 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803839C: .4byte gCurTask
_080383A0: .4byte gUnknown_080D7704
_080383A4: .4byte gUnknown_080D76F0
_080383A8: .4byte IWRAM_START + 0x34
_080383AC: .4byte IWRAM_START + 0x35
_080383B0: .4byte sub_80383B8
_080383B4: .4byte gCamera

	thumb_func_start sub_80383B8
sub_80383B8: @ 0x080383B8
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038440 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803841C
	ldr r3, _08038444 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038448 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803844C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038450 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038454 @ =sub_803845C
	str r0, [r1, #8]
_0803841C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038458 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038440: .4byte gCurTask
_08038444: .4byte gUnknown_080D7704
_08038448: .4byte gUnknown_080D76F0
_0803844C: .4byte IWRAM_START + 0x34
_08038450: .4byte IWRAM_START + 0x35
_08038454: .4byte sub_803845C
_08038458: .4byte gCamera

	thumb_func_start sub_803845C
sub_803845C: @ 0x0803845C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080384E4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080384C0
	ldr r3, _080384E8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080384EC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080384F0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080384F4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080384F8 @ =sub_8038500
	str r0, [r1, #8]
_080384C0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080384FC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080384E4: .4byte gCurTask
_080384E8: .4byte gUnknown_080D7704
_080384EC: .4byte gUnknown_080D76F0
_080384F0: .4byte IWRAM_START + 0x34
_080384F4: .4byte IWRAM_START + 0x35
_080384F8: .4byte sub_8038500
_080384FC: .4byte gCamera

	thumb_func_start sub_8038500
sub_8038500: @ 0x08038500
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038588 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038564
	ldr r3, _0803858C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038590 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038594 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038598 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803859C @ =sub_803997C
	str r0, [r1, #8]
_08038564:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080385A0 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038588: .4byte gCurTask
_0803858C: .4byte gUnknown_080D7704
_08038590: .4byte gUnknown_080D76F0
_08038594: .4byte IWRAM_START + 0x34
_08038598: .4byte IWRAM_START + 0x35
_0803859C: .4byte sub_803997C
_080385A0: .4byte gCamera

	thumb_func_start sub_80385A4
sub_80385A4: @ 0x080385A4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038648 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038624
	ldr r3, _0803864C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038650 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038654 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038658 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803865C @ =sub_8038664
	str r0, [r1, #8]
_08038624:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038660 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038648: .4byte gCurTask
_0803864C: .4byte gUnknown_080D7704
_08038650: .4byte gUnknown_080D76F0
_08038654: .4byte IWRAM_START + 0x34
_08038658: .4byte IWRAM_START + 0x35
_0803865C: .4byte sub_8038664
_08038660: .4byte gCamera

	thumb_func_start sub_8038664
sub_8038664: @ 0x08038664
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038710 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038686
	movs r0, #0
	strh r0, [r4, #0x10]
_08038686:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080386EC
	ldr r3, _08038714 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038718 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803871C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038720 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038724 @ =sub_803872C
	str r0, [r1, #8]
_080386EC:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038728 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038710: .4byte gCurTask
_08038714: .4byte gUnknown_080D7704
_08038718: .4byte gUnknown_080D76F0
_0803871C: .4byte IWRAM_START + 0x34
_08038720: .4byte IWRAM_START + 0x35
_08038724: .4byte sub_803872C
_08038728: .4byte gCamera

	thumb_func_start sub_803872C
sub_803872C: @ 0x0803872C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080387D8 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0803874E
	movs r0, #0
	strh r0, [r4, #0x10]
_0803874E:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080387B4
	ldr r3, _080387DC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080387E0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080387E4 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080387E8 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080387EC @ =sub_80387F4
	str r0, [r1, #8]
_080387B4:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080387F0 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080387D8: .4byte gCurTask
_080387DC: .4byte gUnknown_080D7704
_080387E0: .4byte gUnknown_080D76F0
_080387E4: .4byte IWRAM_START + 0x34
_080387E8: .4byte IWRAM_START + 0x35
_080387EC: .4byte sub_80387F4
_080387F0: .4byte gCamera

	thumb_func_start sub_80387F4
sub_80387F4: @ 0x080387F4
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803887C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038858
	ldr r3, _08038880 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038884 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038888 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0803888C @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038890 @ =sub_8038898
	str r0, [r1, #8]
_08038858:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038894 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803887C: .4byte gCurTask
_08038880: .4byte gUnknown_080D7704
_08038884: .4byte gUnknown_080D76F0
_08038888: .4byte IWRAM_START + 0x34
_0803888C: .4byte IWRAM_START + 0x35
_08038890: .4byte sub_8038898
_08038894: .4byte gCamera

	thumb_func_start sub_8038898
sub_8038898: @ 0x08038898
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038920 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080388FC
	ldr r3, _08038924 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038928 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803892C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038930 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038934 @ =sub_803893C
	str r0, [r1, #8]
_080388FC:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038938 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038920: .4byte gCurTask
_08038924: .4byte gUnknown_080D7704
_08038928: .4byte gUnknown_080D76F0
_0803892C: .4byte IWRAM_START + 0x34
_08038930: .4byte IWRAM_START + 0x35
_08038934: .4byte sub_803893C
_08038938: .4byte gCamera

	thumb_func_start sub_803893C
sub_803893C: @ 0x0803893C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080389C4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080389A0
	ldr r3, _080389C8 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080389CC @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080389D0 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080389D4 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080389D8 @ =sub_80399A4
	str r0, [r1, #8]
_080389A0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080389DC @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080389C4: .4byte gCurTask
_080389C8: .4byte gUnknown_080D7704
_080389CC: .4byte gUnknown_080D76F0
_080389D0: .4byte IWRAM_START + 0x34
_080389D4: .4byte IWRAM_START + 0x35
_080389D8: .4byte sub_80399A4
_080389DC: .4byte gCamera

	thumb_func_start sub_80389E0
sub_80389E0: @ 0x080389E0
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038A84 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038A60
	ldr r3, _08038A88 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038A8C @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038A90 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038A94 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038A98 @ =sub_8038AA0
	str r0, [r1, #8]
_08038A60:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038A9C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038A84: .4byte gCurTask
_08038A88: .4byte gUnknown_080D7704
_08038A8C: .4byte gUnknown_080D76F0
_08038A90: .4byte IWRAM_START + 0x34
_08038A94: .4byte IWRAM_START + 0x35
_08038A98: .4byte sub_8038AA0
_08038A9C: .4byte gCamera

	thumb_func_start sub_8038AA0
sub_8038AA0: @ 0x08038AA0
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038B50 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038AC2
	movs r0, #0
	strh r0, [r4, #0x10]
_08038AC2:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08038B2C
	strh r0, [r4, #0x10]
	ldr r3, _08038B54 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038B58 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038B5C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038B60 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038B64 @ =sub_8038B6C
	str r0, [r1, #8]
_08038B2C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038B68 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038B50: .4byte gCurTask
_08038B54: .4byte gUnknown_080D7704
_08038B58: .4byte gUnknown_080D76F0
_08038B5C: .4byte IWRAM_START + 0x34
_08038B60: .4byte IWRAM_START + 0x35
_08038B64: .4byte sub_8038B6C
_08038B68: .4byte gCamera

	thumb_func_start sub_8038B6C
sub_8038B6C: @ 0x08038B6C
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038C18 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038B8E
	movs r0, #0
	strh r0, [r4, #0x10]
_08038B8E:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038BF4
	ldr r3, _08038C1C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038C20 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038C24 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038C28 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038C2C @ =sub_8038C34
	str r0, [r1, #8]
_08038BF4:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038C30 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038C18: .4byte gCurTask
_08038C1C: .4byte gUnknown_080D7704
_08038C20: .4byte gUnknown_080D76F0
_08038C24: .4byte IWRAM_START + 0x34
_08038C28: .4byte IWRAM_START + 0x35
_08038C2C: .4byte sub_8038C34
_08038C30: .4byte gCamera

	thumb_func_start sub_8038C34
sub_8038C34: @ 0x08038C34
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038CBC @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038C98
	ldr r3, _08038CC0 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038CC4 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038CC8 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038CCC @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038CD0 @ =sub_8038CD8
	str r0, [r1, #8]
_08038C98:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038CD4 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038CBC: .4byte gCurTask
_08038CC0: .4byte gUnknown_080D7704
_08038CC4: .4byte gUnknown_080D76F0
_08038CC8: .4byte IWRAM_START + 0x34
_08038CCC: .4byte IWRAM_START + 0x35
_08038CD0: .4byte sub_8038CD8
_08038CD4: .4byte gCamera

	thumb_func_start sub_8038CD8
sub_8038CD8: @ 0x08038CD8
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038D60 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038D3C
	ldr r3, _08038D64 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038D68 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038D6C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038D70 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038D74 @ =sub_8038D7C
	str r0, [r1, #8]
_08038D3C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038D78 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038D60: .4byte gCurTask
_08038D64: .4byte gUnknown_080D7704
_08038D68: .4byte gUnknown_080D76F0
_08038D6C: .4byte IWRAM_START + 0x34
_08038D70: .4byte IWRAM_START + 0x35
_08038D74: .4byte sub_8038D7C
_08038D78: .4byte gCamera

	thumb_func_start sub_8038D7C
sub_8038D7C: @ 0x08038D7C
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038E04 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038DE0
	ldr r3, _08038E08 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038E0C @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038E10 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038E14 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038E18 @ =sub_80399CC
	str r0, [r1, #8]
_08038DE0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038E1C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038E04: .4byte gCurTask
_08038E08: .4byte gUnknown_080D7704
_08038E0C: .4byte gUnknown_080D76F0
_08038E10: .4byte IWRAM_START + 0x34
_08038E14: .4byte IWRAM_START + 0x35
_08038E18: .4byte sub_80399CC
_08038E1C: .4byte gCamera

	thumb_func_start sub_8038E20
sub_8038E20: @ 0x08038E20
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038EC4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldr r2, _08038EC8 @ =IWRAM_START + 0x36
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038EA0
	ldr r3, _08038ECC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038ED0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038ED4 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08038ED8 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038EDC @ =sub_8038EE4
	str r0, [r1, #8]
_08038EA0:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038EE0 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038EC4: .4byte gCurTask
_08038EC8: .4byte IWRAM_START + 0x36
_08038ECC: .4byte gUnknown_080D7704
_08038ED0: .4byte gUnknown_080D76F0
_08038ED4: .4byte IWRAM_START + 0x34
_08038ED8: .4byte IWRAM_START + 0x35
_08038EDC: .4byte sub_8038EE4
_08038EE0: .4byte gCamera

	thumb_func_start sub_8038EE4
sub_8038EE4: @ 0x08038EE4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08038F9C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038F06
	movs r0, #0
	strh r0, [r4, #0x10]
_08038F06:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	adds r2, r0, r1
	str r2, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08038F76
	ldr r3, _08038FA0 @ =0xFFFFFE00
	adds r0, r2, r3
	str r0, [r4, #0xc]
	strh r1, [r4, #0x10]
	ldr r3, _08038FA4 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08038FA8 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08038FAC @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _08038FB0 @ =IWRAM_START + 0x35
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _08038FB4 @ =sub_8038FBC
	str r0, [r1, #8]
_08038F76:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08038FB8 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038F9C: .4byte gCurTask
_08038FA0: .4byte 0xFFFFFE00
_08038FA4: .4byte gUnknown_080D7704
_08038FA8: .4byte gUnknown_080D76F0
_08038FAC: .4byte IWRAM_START + 0x34
_08038FB0: .4byte IWRAM_START + 0x35
_08038FB4: .4byte sub_8038FBC
_08038FB8: .4byte gCamera

	thumb_func_start sub_8038FBC
sub_8038FBC: @ 0x08038FBC
	push {r4, r5, r6, r7, lr}
	ldr r7, _08039068 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #0x10]
	subs r0, #0x20
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08038FDE
	movs r0, #0
	strh r0, [r4, #0x10]
_08038FDE:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08039044
	ldr r3, _0803906C @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08039070 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _08039074 @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _08039078 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0803907C @ =sub_8039084
	str r0, [r1, #8]
_08039044:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039080 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039068: .4byte gCurTask
_0803906C: .4byte gUnknown_080D7704
_08039070: .4byte gUnknown_080D76F0
_08039074: .4byte IWRAM_START + 0x34
_08039078: .4byte IWRAM_START + 0x35
_0803907C: .4byte sub_8039084
_08039080: .4byte gCamera

	thumb_func_start sub_8039084
sub_8039084: @ 0x08039084
	push {r4, r5, r6, lr}
	ldr r2, _080390A8 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r1, [r4, #8]
	ldr r0, _080390AC @ =0x0000B7FF
	adds r6, r2, #0
	cmp r1, r0
	bgt _080390B0
	adds r0, r1, #0
	adds r0, #0x80
	str r0, [r4, #8]
	b _080390B8
	.align 2, 0
_080390A8: .4byte gCurTask
_080390AC: .4byte 0x0000B7FF
_080390B0:
	ldr r0, [r5, #0x10]
	ldr r1, _08039130 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
_080390B8:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803910A
	ldr r3, _08039134 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08039138 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r6]
	ldr r0, _0803913C @ =sub_8039144
	str r0, [r1, #8]
_0803910A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039140 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039130: .4byte 0xFFFFFBFF
_08039134: .4byte gUnknown_080D7704
_08039138: .4byte gUnknown_080D76F0
_0803913C: .4byte sub_8039144
_08039140: .4byte gCamera

	thumb_func_start sub_8039144
sub_8039144: @ 0x08039144
	push {r4, r5, r6, r7, lr}
	ldr r7, _080391E4 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, #0x14
	adds r5, r6, r0
	ldr r1, [r4, #8]
	ldr r0, _080391E8 @ =0x000097FF
	cmp r1, r0
	bgt _08039164
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r4, #8]
_08039164:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080391BE
	ldr r3, _080391EC @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _080391F0 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080391F4 @ =IWRAM_START + 0x34
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080391F8 @ =IWRAM_START + 0x35
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _080391FC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r1, [r7]
	ldr r0, _08039200 @ =sub_8039208
	str r0, [r1, #8]
_080391BE:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039204 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080391E4: .4byte gCurTask
_080391E8: .4byte 0x000097FF
_080391EC: .4byte gUnknown_080D7704
_080391F0: .4byte gUnknown_080D76F0
_080391F4: .4byte IWRAM_START + 0x34
_080391F8: .4byte IWRAM_START + 0x35
_080391FC: .4byte 0xFFFFFBFF
_08039200: .4byte sub_8039208
_08039204: .4byte gCamera

	thumb_func_start sub_8039208
sub_8039208: @ 0x08039208
	push {r4, r5, r6, r7, lr}
	ldr r7, _08039290 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803926C
	ldr r3, _08039294 @ =gUnknown_080D7704
	ldrb r1, [r4, #1]
	adds r1, #1
	strb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08039298 @ =gUnknown_080D76F0
	adds r0, r2, #0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0803929C @ =IWRAM_START + 0x34
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080392A0 @ =IWRAM_START + 0x35
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080392A4 @ =sub_8039A10
	str r0, [r1, #8]
_0803926C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, _080392A8 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039290: .4byte gCurTask
_08039294: .4byte gUnknown_080D7704
_08039298: .4byte gUnknown_080D76F0
_0803929C: .4byte IWRAM_START + 0x34
_080392A0: .4byte IWRAM_START + 0x35
_080392A4: .4byte sub_8039A10
_080392A8: .4byte gCamera

	thumb_func_start sub_80392AC
sub_80392AC: @ 0x080392AC
	push {r4, r5, lr}
	ldr r0, _08039340 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08039344 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #3
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _080392D2
	ldrb r0, [r4]
	cmp r0, #0x2b
	bhi _080392D2
	adds r0, #1
	strb r0, [r4]
_080392D2:
	ldr r0, [r4, #8]
	adds r0, #2
	str r0, [r4, #8]
	ldr r1, _08039348 @ =gCamera
	movs r0, #0
	str r0, [r1]
	ldrb r0, [r4]
	str r0, [r1, #4]
	adds r1, r5, #0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	bl sub_803959C
	ldr r1, [r4, #4]
	movs r0, #0xb9
	lsls r0, r0, #1
	cmp r1, r0
	beq _0803937C
	subs r3, r1, #1
	str r3, [r4, #4]
	cmp r3, #0
	bne _08039332
	subs r0, #0x72
	str r0, [r4, #8]
	ldr r0, _08039340 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803934C @ =sub_80393A4
	str r0, [r1, #8]
	movs r0, #0xde
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r1, _08039350 @ =gUnknown_080D7560
	ldr r0, [r1]
	str r0, [r2, #4]
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	movs r5, #0xee
	lsls r5, r5, #1
	adds r0, r4, r5
	strb r1, [r0]
	str r3, [r2, #0x10]
	ldr r0, _08039354 @ =0x000001DD
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
_08039332:
	ldr r2, [r4, #4]
	cmp r2, #0x3c
	bne _08039358
	bl sub_804CD50
	b _0803939C
	.align 2, 0
_08039340: .4byte gCurTask
_08039344: .4byte gUnknown_03005590
_08039348: .4byte gCamera
_0803934C: .4byte sub_80393A4
_08039350: .4byte gUnknown_080D7560
_08039354: .4byte 0x000001DD
_08039358:
	cmp r2, #0x3b
	bhi _0803939C
	ldr r1, _08039374 @ =gSineTable
	ldr r0, _08039378 @ =0x000003FF
	ands r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	b _0803939C
	.align 2, 0
_08039374: .4byte gSineTable
_08039378: .4byte 0x000003FF
_0803937C:
	ldr r3, _08039394 @ =gBldRegs
	ldrh r2, [r3, #4]
	cmp r2, #0
	beq _08039398
	ldr r0, [r5]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0803939C
	subs r0, r2, #1
	strh r0, [r3, #4]
	b _0803939C
	.align 2, 0
_08039394: .4byte gBldRegs
_08039398:
	subs r0, r1, #1
	str r0, [r4, #4]
_0803939C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80393A4
sub_80393A4: @ 0x080393A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0803951C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7, #8]
	adds r0, #1
	str r0, [r7, #8]
	ldr r1, _08039520 @ =gUnknown_03005590
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08039524 @ =gUnknown_030054B8
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r0, #7
	str r0, [r7, #4]
	cmp r0, #0xfa
	bhi _080393DC
	b _08039500
_080393DC:
	add r1, sp, #8
	add r0, sp, #4
	bl sub_8050B2C
	ldr r0, [sp, #4]
	movs r1, #0xa0
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r3, #0
	mov sl, r3
	ldr r0, _08039528 @ =IWRAM_START + 0x10
	adds r0, r4, r0
	str r0, [sp, #0x10]
_08039402:
	ldr r1, [sp, #0x10]
	add r1, sl
	str r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803948E
	mov r2, sl
	lsls r2, r2, #3
	mov sb, r2
	adds r6, r7, #0
	adds r6, #0x30
	add r6, sb
	ldr r0, [r6]
	ldr r1, [sp, #4]
	ldr r2, [r7, #4]
	mov r3, sl
	lsls r3, r3, #2
	mov r8, r3
	add r3, sl
	lsls r3, r3, #1
	ldr r4, _0803952C @ =gUnknown_080D7838
	adds r3, r3, r4
	ldrb r4, [r3]
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	str r0, [r6]
	adds r5, r7, #0
	adds r5, #0x34
	add r5, sb
	ldr r0, [r5]
	ldr r1, [sp, #8]
	ldr r2, [r7, #4]
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5]
	movs r0, #0x98
	lsls r0, r0, #1
	adds r2, r7, r0
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	subs r1, r1, r0
	movs r3, #0
	strh r1, [r2]
	movs r1, #0x99
	lsls r1, r1, #1
	adds r2, r7, r1
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	subs r1, r1, r0
	strh r1, [r2]
	ldr r0, [r6]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r1, [sp, #4]
	cmp r0, r1
	ble _0803948E
	ldr r4, [sp, #0xc]
	strb r3, [r4]
_0803948E:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0x1f
	bls _08039402
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r6, r7, r0
	ldrb r0, [r6]
	cmp r0, #0
	beq _08039500
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	movs r0, #0xc8
	lsls r0, r0, #7
	ldr r1, [sp, #4]
	ldr r2, [r7, #4]
	adds r2, #0x20
	movs r4, #3
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	movs r1, #0xda
	lsls r1, r1, #1
	adds r5, r7, r1
	str r0, [r5]
	movs r0, #0xb4
	lsls r0, r0, #8
	ldr r1, [sp, #8]
	ldr r2, [r7, #4]
	adds r2, #0x60
	str r4, [sp]
	movs r3, #0xa
	bl sub_8085698
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r7, r2
	str r0, [r1]
	ldr r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	ldr r1, [sp, #4]
	cmp r0, r1
	ble _08039500
	movs r0, #0
	strb r0, [r6]
	ldr r0, _08039530 @ =gMPlayInfo_SE2
	movs r1, #4
	bl m4aMPlayFadeOutTemporarily
_08039500:
	ldr r2, [r7, #4]
	ldr r0, _08039534 @ =0x00000AEF
	cmp r2, r0
	bhi _08039540
	ldr r1, _08039538 @ =gSineTable
	ldr r0, _0803953C @ =0x000003FF
	ands r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	b _08039582
	.align 2, 0
_0803951C: .4byte gCurTask
_08039520: .4byte gUnknown_03005590
_08039524: .4byte gUnknown_030054B8
_08039528: .4byte IWRAM_START + 0x10
_0803952C: .4byte gUnknown_080D7838
_08039530: .4byte gMPlayInfo_SE2
_08039534: .4byte 0x00000AEF
_08039538: .4byte gSineTable
_0803953C: .4byte 0x000003FF
_08039540:
	ldr r0, _08039578 @ =0x00000BB8
	cmp r2, r0
	bls _08039580
	movs r0, #0
	bl sub_8037438
	movs r0, #1
	bl sub_8037438
	movs r0, #2
	bl sub_8037438
	movs r0, #3
	bl sub_8037438
	movs r0, #4
	bl sub_8037438
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0803957C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0803958C
	.align 2, 0
_08039578: .4byte 0x00000BB8
_0803957C: .4byte gCurTask
_08039580:
	movs r0, #0
_08039582:
	strb r0, [r7, #0xe]
	strb r0, [r7, #0xf]
	movs r0, #1
	bl sub_803959C
_0803958C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803959C
sub_803959C: @ 0x0803959C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080396BC @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _080396C0 @ =gBgScrollRegs
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	ldrb r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	mov r3, r8
	movs r0, #0xf
	ldrsb r0, [r3, r0]
	ldrb r5, [r3]
	adds r0, r0, r5
	strh r0, [r1, #6]
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	strh r0, [r1, #4]
	ldr r1, _080396C4 @ =IWRAM_START + 0x1EC
	adds r0, r6, r1
	bl sub_8004558
	ldr r2, _080396C8 @ =IWRAM_START + 0x21C
	adds r0, r6, r2
	bl sub_8004558
	ldr r3, _080396CC @ =IWRAM_START + 0x24C
	adds r0, r6, r3
	bl sub_8004558
	mov r5, r8
	ldr r1, [r5, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r2, _080396D0 @ =0x000003FF
	ands r0, r2
	str r0, [sp]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r2
	str r0, [sp, #4]
	cmp r4, #0
	beq _080396E0
	movs r0, #0
	mov sb, r0
	ldr r1, _080396D4 @ =IWRAM_START + 0x10
	adds r1, r1, r6
	mov sl, r1
_08039620:
	mov r0, sl
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _080396AA
	mov r2, sb
	lsls r6, r2, #2
	adds r0, r6, r2
	lsls r0, r0, #1
	ldr r3, _080396D8 @ =gUnknown_080D7838
	adds r0, r0, r3
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xf6
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r2, r8
	adds r7, r2, r0
	mov r3, sb
	lsls r2, r3, #3
	mov r5, r8
	adds r5, #0x30
	adds r5, r5, r2
	movs r3, #0x98
	lsls r3, r3, #1
	add r3, r8
	adds r3, r3, r6
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	mov r4, r8
	adds r4, #0x34
	adds r4, r4, r2
	movs r2, #0x99
	lsls r2, r2, #1
	add r2, r8
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r3]
	subs r0, #0x28
	strh r0, [r3]
	ldrh r0, [r2]
	subs r0, #0x10
	strh r0, [r2]
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldrb r1, [r2]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	ldr r1, _080396DC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_080396AA:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x1f
	bls _08039620
	b _08039816
	.align 2, 0
_080396BC: .4byte gCurTask
_080396C0: .4byte gBgScrollRegs
_080396C4: .4byte IWRAM_START + 0x1EC
_080396C8: .4byte IWRAM_START + 0x21C
_080396CC: .4byte IWRAM_START + 0x24C
_080396D0: .4byte 0x000003FF
_080396D4: .4byte IWRAM_START + 0x10
_080396D8: .4byte gUnknown_080D7838
_080396DC: .4byte 0xFFFFFBFF
_080396E0:
	movs r3, #0
	mov sb, r3
	ldr r5, _080397CC @ =IWRAM_START + 0x30
	adds r5, r6, r5
	str r5, [sp, #0x10]
	ldr r0, _080397D0 @ =IWRAM_START + 0x34
	adds r0, r6, r0
	str r0, [sp, #0x14]
	ldr r6, _080397D4 @ =gUnknown_080D7830
	ldr r1, _080397D8 @ =gSineTable
	mov sl, r1
_080396F6:
	mov r2, sb
	lsls r2, r2, #2
	mov ip, r2
	add r2, sb
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #8
	adds r0, r2, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xf6
	lsls r5, r5, #1
	adds r0, r0, r5
	mov r1, r8
	adds r7, r1, r0
	mov r5, sb
	lsls r3, r5, #3
	ldr r0, [sp, #0x10]
	adds r4, r0, r3
	ldr r1, [r4]
	str r1, [sp, #8]
	ldr r5, [sp, #0x14]
	adds r3, r5, r3
	ldr r0, [r3]
	str r0, [sp, #0xc]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r1, [sp]
	adds r5, r1, r5
	lsls r0, r5, #1
	add r0, sl
	movs r5, #0
	ldrsh r1, [r0, r5]
	str r1, [sp, #0x1c]
	adds r0, r6, #4
	adds r0, r2, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r5, [sp, #0x1c]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #4
	str r1, [r4]
	adds r0, r2, r6
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	add r0, sl
	movs r1, #0
	ldrsh r5, [r0, r1]
	str r5, [sp, #0x1c]
	adds r0, r6, #6
	adds r0, r2, r0
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r5, [sp, #0x1c]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #4
	str r1, [r3]
	ldr r0, _080397DC @ =gUnknown_080D7832
	adds r2, r2, r0
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3]
	movs r2, #0x98
	lsls r2, r2, #1
	add r2, r8
	add r2, ip
	ldr r0, [r4]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r2]
	movs r1, #0x99
	lsls r1, r1, #1
	add r1, r8
	add r1, ip
	ldr r0, [r3]
	ldr r5, [sp, #0xc]
	subs r0, r0, r5
	strh r0, [r1]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	ldr r0, [r3]
	asrs r0, r0, #8
	mov r3, r8
	ldrb r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _080397E4
	ldr r0, [r7, #0x10]
	ldr r1, _080397E0 @ =0xFFFFFBFF
	ands r0, r1
	b _080397EC
	.align 2, 0
_080397CC: .4byte IWRAM_START + 0x30
_080397D0: .4byte IWRAM_START + 0x34
_080397D4: .4byte gUnknown_080D7830
_080397D8: .4byte gSineTable
_080397DC: .4byte gUnknown_080D7832
_080397E0: .4byte 0xFFFFFBFF
_080397E4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080397EC:
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [sp]
	subs r0, #0x40
	ldr r1, _08039868 @ =0x000003FF
	ands r0, r1
	str r0, [sp]
	ldr r0, [sp, #4]
	subs r0, #0x40
	ands r0, r1
	str r0, [sp, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x1f
	bhi _08039816
	b _080396F6
_08039816:
	movs r0, #0xd8
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039858
	movs r7, #0xde
	lsls r7, r7, #1
	add r7, r8
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, r8
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0xdc
	lsls r0, r0, #1
	add r0, r8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2]
	subs r1, r1, r0
	movs r0, #0xf
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08039858:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039868: .4byte 0x000003FF

	thumb_func_start sub_803986C
sub_803986C: @ 0x0803986C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r1, _0803993C @ =gDispCnt
	ldr r2, _08039940 @ =0x00001341
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08039944 @ =gBgCntRegs
	movs r0, #0
	mov r8, r0
	movs r4, #0
	ldr r0, _08039948 @ =0x00005C09
	strh r0, [r1, #4]
	ldr r0, _0803994C @ =0x00001E06
	strh r0, [r1, #2]
	adds r0, #0xfd
	strh r0, [r1]
	ldr r0, _08039950 @ =gBgScrollRegs
	strh r4, [r0]
	movs r1, #0x48
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r1, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	ldr r0, _08039954 @ =gUnknown_03004D80
	mov r1, r8
	strb r1, [r0, #2]
	ldr r1, _08039958 @ =gUnknown_03002280
	mov r2, r8
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r6, #0x20
	strb r6, [r1, #0xb]
	ldr r0, _0803995C @ =sub_8039A38
	movs r2, #0x81
	lsls r2, r2, #8
	str r4, [sp]
	movs r1, #0xc0
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08039960 @ =0x0600F800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _08039964 @ =0x00000179
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r6, [r0, #0x26]
	strh r6, [r0, #0x28]
	ldr r2, _08039968 @ =IWRAM_START + 0x2A
	adds r1, r5, r2
	mov r2, r8
	strb r2, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0803996C @ =IWRAM_START + 0x40
	adds r0, r5, r1
	ldr r1, _08039970 @ =0x06004000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08039974 @ =0x0600F000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0xbd
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r6, [r0, #0x26]
	strh r6, [r0, #0x28]
	ldr r2, _08039978 @ =IWRAM_START + 0x6A
	adds r5, r5, r2
	mov r1, r8
	strb r1, [r5]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803993C: .4byte gDispCnt
_08039940: .4byte 0x00001341
_08039944: .4byte gBgCntRegs
_08039948: .4byte 0x00005C09
_0803994C: .4byte 0x00001E06
_08039950: .4byte gBgScrollRegs
_08039954: .4byte gUnknown_03004D80
_08039958: .4byte gUnknown_03002280
_0803995C: .4byte sub_8039A38
_08039960: .4byte 0x0600F800
_08039964: .4byte 0x00000179
_08039968: .4byte IWRAM_START + 0x2A
_0803996C: .4byte IWRAM_START + 0x40
_08039970: .4byte 0x06004000
_08039974: .4byte 0x0600F000
_08039978: .4byte IWRAM_START + 0x6A

	thumb_func_start sub_803997C
sub_803997C: @ 0x0803997C
	push {r4, lr}
	ldr r0, _0803999C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080399A0 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803999C: .4byte gCurTask
_080399A0: .4byte IWRAM_START + 0x14

	thumb_func_start sub_80399A4
sub_80399A4: @ 0x080399A4
	push {r4, lr}
	ldr r0, _080399C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080399C8 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080399C4: .4byte gCurTask
_080399C8: .4byte IWRAM_START + 0x14

	thumb_func_start sub_80399CC
sub_80399CC: @ 0x080399CC
	push {r4, lr}
	ldr r0, _08039A04 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, _08039A08 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039A0C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039A04: .4byte gCurTask
_08039A08: .4byte IWRAM_START + 0x14
_08039A0C: .4byte gCamera

	thumb_func_start sub_8039A10
sub_8039A10: @ 0x08039A10
	push {r4, lr}
	ldr r0, _08039A30 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _08039A34 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039A30: .4byte gCurTask
_08039A34: .4byte IWRAM_START + 0x14

	thumb_func_start sub_8039A38
sub_8039A38: @ 0x08039A38
	push {lr}
	ldr r0, _08039A48 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08039A48: .4byte gCurTask

@; CreateSkipHandler
	thumb_func_start sub_8039A4C
sub_8039A4C: @ 0x08039A4C
	push {lr}
	sub sp, #4
	ldr r0, _08039A68 @ =sub_8039A6C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r3, #0
	bl TaskCreate
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039A68: .4byte sub_8039A6C

	thumb_func_start sub_8039A6C
sub_8039A6C: @ 0x08039A6C
	push {lr}
	sub sp, #4
	ldr r0, _08039AB0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039AA8
	movs r0, #0
	ldr r1, _08039AB4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08039AB8 @ =gUnknown_03002AE4
	ldr r0, _08039ABC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08039AC0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08039AC4 @ =gVramGraphicsCopyCursor
	ldr r0, _08039AC8 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08039ACC @ =sub_8039AD4
	movs r1, #0
	str r1, [sp]
	ldr r2, _08039AD0 @ =0x00008888
	movs r3, #0
	bl TaskCreate
_08039AA8:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039AB0: .4byte gPressedKeys
_08039AB4: .4byte 0x0000FFFF
_08039AB8: .4byte gUnknown_03002AE4
_08039ABC: .4byte gUnknown_0300287C
_08039AC0: .4byte gUnknown_03005390
_08039AC4: .4byte gVramGraphicsCopyCursor
_08039AC8: .4byte gVramGraphicsCopyQueueIndex
_08039ACC: .4byte sub_8039AD4
_08039AD0: .4byte 0x00008888

@; Start true area 53
	thumb_func_start sub_8039AD4
sub_8039AD4: @ 0x08039AD4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08039B2C @ =gUnknown_030018F0
	movs r4, #0
	strb r4, [r0]
	ldr r0, _08039B30 @ =gUnknown_03002AE0
	strb r4, [r0]
	mov r0, sp
	ldr r1, _08039B34 @ =0x0000FFFF
	adds r5, r1, #0
	strh r5, [r0]
	ldr r1, _08039B38 @ =gUnknown_03001850
	ldr r6, _08039B3C @ =0x01000010
	adds r2, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r5, [r0]
	ldr r1, _08039B40 @ =gUnknown_03004D60
	adds r2, r6, #0
	bl CpuSet
	bl m4aMPlayAllStop
	ldr r0, _08039B44 @ =gGameMode
	strb r4, [r0]
	ldr r0, _08039B48 @ =gSelectedCharacter
	strb r4, [r0]
	ldr r1, _08039B4C @ =gCurrentLevel
	movs r0, #0x1d
	strb r0, [r1]
	bl ApplyGameStageSettings
	bl GameStageStart
	ldr r0, _08039B50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039B2C: .4byte gUnknown_030018F0
_08039B30: .4byte gUnknown_03002AE0
_08039B34: .4byte 0x0000FFFF
_08039B38: .4byte gUnknown_03001850
_08039B3C: .4byte 0x01000010
_08039B40: .4byte gUnknown_03004D60
_08039B44: .4byte gGameMode
_08039B48: .4byte gSelectedCharacter
_08039B4C: .4byte gCurrentLevel
_08039B50: .4byte gCurTask
