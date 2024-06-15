.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_80508C4
sub_80508C4: @ 0x080508C4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _08050938
	ldr r2, _08050940 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08050944 @ =gWinRegs
	ldr r0, _08050948 @ =0x00003735
	strh r0, [r1, #0xa]
	ldr r3, _0805094C @ =gBldRegs
	ldr r0, _08050950 @ =0x00001346
	strh r0, [r3]
	lsls r1, r4, #1
	adds r1, r1, r4
	asrs r1, r1, #8
	adds r1, #0xa
	movs r2, #0xf
	ands r1, r2
	lsls r0, r4, #2
	adds r0, r0, r4
	asrs r0, r0, #8
	adds r0, #8
	ands r0, r2
	lsls r1, r1, #8
	orrs r1, r0
	strh r1, [r3, #2]
	strh r1, [r3, #4]
	ldr r0, _08050954 @ =0x000007B4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2, #0x10]
	movs r3, #0
	movs r4, #0xfe
	lsls r4, r4, #3
_0805091E:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	orrs r0, r1
	str r0, [r2, #0x10]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0805091E
_08050938:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050940: .4byte gDispCnt
_08050944: .4byte gWinRegs
_08050948: .4byte 0x00003735
_0805094C: .4byte gBldRegs
_08050950: .4byte 0x00001346
_08050954: .4byte 0x000007B4

	thumb_func_start sub_8050958
sub_8050958: @ 0x08050958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08050A5C
	subs r0, #1
	strb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080509B0
	movs r5, #0
	ldr r0, _080509A0 @ =gFlags
	mov sl, r0
	ldr r6, _080509A4 @ =gObjPalette
	ldr r4, _080509A8 @ =gUnknown_080D8EF0+0x20
	ldr r3, _080509AC @ =gBgPalette
_08050980:
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r2, r5, #1
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, r2, r3
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050980
	b _08050A4C
	.align 2, 0
_080509A0: .4byte gFlags
_080509A4: .4byte gObjPalette
_080509A8: .4byte gUnknown_080D8EF0+0x20
_080509AC: .4byte gBgPalette
_080509B0:
	ldr r0, _080509F8 @ =gStageTime
	ldr r0, [r0]
	lsrs r6, r0, #1
	movs r0, #0xf
	ands r6, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _08050A0C
	movs r5, #0
	ldr r1, _080509FC @ =gFlags
	mov sl, r1
	ldr r0, _08050A00 @ =gObjPalette
	mov ip, r0
	movs r7, #0xf
	ldr r4, _08050A04 @ =gUnknown_080D8EF0
	ldr r3, _08050A08 @ =gBgPalette
_080509D0:
	adds r1, r5, r6
	ands r1, r7
	adds r2, r1, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r0, r0, #5
	strh r0, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080509D0
	b _08050A4C
	.align 2, 0
_080509F8: .4byte gStageTime
_080509FC: .4byte gFlags
_08050A00: .4byte gObjPalette
_08050A04: .4byte gUnknown_080D8EF0
_08050A08: .4byte gBgPalette
_08050A0C:
	movs r5, #0
	ldr r1, _08050A6C @ =gFlags
	mov sl, r1
	ldr r0, _08050A70 @ =gObjPalette
	mov sb, r0
	ldr r1, _08050A74 @ =gUnknown_080D8EF0
	mov r8, r1
	ldr r0, _08050A78 @ =gBgPalette
	mov ip, r0
	movs r7, #0xf
_08050A20:
	adds r3, r5, r6
	ands r3, r7
	adds r4, r3, #0
	adds r4, #0x80
	lsls r4, r4, #1
	add r4, sb
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r2, r1, #5
	lsrs r0, r1, #5
	orrs r2, r0
	orrs r2, r1
	strh r2, [r4]
	lsls r3, r3, #1
	add r3, ip
	strh r2, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050A20
_08050A4C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	str r0, [r1]
_08050A5C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A6C: .4byte gFlags
_08050A70: .4byte gObjPalette
_08050A74: .4byte gUnknown_080D8EF0
_08050A78: .4byte gBgPalette

	thumb_func_start TaskDestructor_TrueArea53BossGfx
TaskDestructor_TrueArea53BossGfx: @ 0x08050A7C
	push {r4, r5, r6, r7, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _08050B1C @ =IWRAM_START + 0x7B8
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08050A94
	bl VramFree
_08050A94:
	movs r4, #0
	ldr r0, _08050B20 @ =IWRAM_START + 0xCC
	adds r7, r5, r0
	ldr r1, _08050B24 @ =gIntrMainBuf + 4
	adds r5, r5, r1
_08050A9E:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050A9E
	movs r4, #0
_08050AB8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r7, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08050AB8
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xad
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08050B28 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050B1C: .4byte IWRAM_START + 0x7B8
_08050B20: .4byte IWRAM_START + 0xCC
_08050B24: .4byte gIntrMainBuf + 4
_08050B28: .4byte gActiveBossTask

	thumb_func_start sub_8050B2C
sub_8050B2C: @ 0x08050B2C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08050B40 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08050B44
	str r0, [r6]
	str r0, [r7]
	b _08050BA2
	.align 2, 0
_08050B40: .4byte gActiveBossTask
_08050B44:
	ldrh r1, [r0, #6]
	ldr r0, _08050BA8 @ =IWRAM_START + 0x1C
	adds r1, r1, r0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r3, [r1, #0x24]
	adds r3, r3, r0
	movs r5, #0x22
	ldrsh r0, [r1, r5]
	lsls r0, r0, #8
	ldr r2, [r1, #0x28]
	adds r2, r2, r0
	ldr r4, _08050BAC @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r2, r2, r0
	movs r5, #0x26
	adds r0, r1, #0
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r2, r2, r0
	str r3, [r6]
	str r2, [r7]
_08050BA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050BA8: .4byte IWRAM_START + 0x1C
_08050BAC: .4byte gSineTable

	thumb_func_start ExtraBossIsDead
ExtraBossIsDead: @ 0x08050BB0
	push {lr}
	movs r2, #0
	ldr r0, _08050BD4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08050BCC
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08050BCC
	movs r2, #1
_08050BCC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08050BD4: .4byte gActiveBossTask

	thumb_func_start sub_8050BD8
sub_8050BD8: @ 0x08050BD8
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BE4
sub_8050BE4: @ 0x08050BE4
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BF0
sub_8050BF0: @ 0x08050BF0
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BFC
sub_8050BFC: @ 0x08050BFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08050C20
	ldr r0, [r4, #0x30]
	ldr r1, _08050C44 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r1, _08050C48 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x24]
	str r0, [r4]
	ldr r0, [r1, #0x28]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #0x2c]
	strh r0, [r4, #0x2e]
_08050C20:
	ldr r1, [r4, #0x30]
	ldr r0, _08050C4C @ =0x00001FFF
	cmp r1, r0
	bls _08050C3C
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, [r4, #0x48]
	subs r1, #0x57
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x44]
_08050C3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C44: .4byte 0x00000FFF
_08050C48: .4byte gUnknown_080D8D6C
_08050C4C: .4byte 0x00001FFF

	thumb_func_start sub_8050C50
sub_8050C50: @ 0x08050C50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08050CA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CAC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	adds r1, #0x57
	str r1, [r4, #0x48]
	cmp r1, #0
	bne _08050CA2
	ldr r2, _08050CB0 @ =0x00000FFF
	str r1, [r4, #0x30]
	ldr r1, _08050CB4 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r1, _08050CB8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r5]
	ldr r0, [r1, #4]
	str r0, [r5, #0x1c]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x16]
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStop
_08050CA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050CA8: .4byte gCurTask
_08050CAC: .4byte IWRAM_START + 0x1C
_08050CB0: .4byte 0x00000FFF
_08050CB4: .4byte gUnknown_080D8D6C
_08050CB8: .4byte gUnknown_080D8DCC

	thumb_func_start sub_8050CBC
sub_8050CBC: @ 0x08050CBC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050CE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CEC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050CF0 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08050CF4
	ldr r0, [r5, #0x24]
	subs r0, #0xc0
	str r0, [r5, #0x24]
	b _08050D12
	.align 2, 0
_08050CE8: .4byte gCurTask
_08050CEC: .4byte IWRAM_START + 0x1C
_08050CF0: .4byte IWRAM_START + 0x558
_08050CF4:
	cmp r0, #3
	bne _08050D12
	ldr r0, _08050D18 @ =0x00000FFF
	ands r1, r0
	str r1, [r4, #0x30]
	ldr r0, _08050D1C @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x48]
	str r1, [r4]
	ldr r1, [r0, #0x4c]
	str r1, [r4, #0x34]
	adds r0, #0x50
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, _08050D20 @ =sub_804F108
	str r0, [r6]
_08050D12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D18: .4byte 0x00000FFF
_08050D1C: .4byte gUnknown_080D8D6C
_08050D20: .4byte sub_804F108

	thumb_func_start sub_8050D24
sub_8050D24: @ 0x08050D24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050D80 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050D84 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050D88 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08050D78
	ldr r2, _08050D8C @ =0x00000FFF
	ands r1, r2
	str r1, [r4, #0x30]
	ldr r0, _08050D90 @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x54]
	str r1, [r4]
	ldr r1, [r0, #0x58]
	str r1, [r4, #0x34]
	adds r0, #0x5c
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r0, _08050D94 @ =gUnknown_080D8DCC
	ldr r1, [r0, #0x3c]
	str r1, [r5]
	ldr r1, [r0, #0x40]
	str r1, [r5, #0x1c]
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	ldr r0, _08050D98 @ =sub_8050DC8
	str r0, [r6]
_08050D78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D80: .4byte gCurTask
_08050D84: .4byte IWRAM_START + 0x1C
_08050D88: .4byte IWRAM_START + 0x558
_08050D8C: .4byte 0x00000FFF
_08050D90: .4byte gUnknown_080D8D6C
_08050D94: .4byte gUnknown_080D8DCC
_08050D98: .4byte sub_8050DC8

	thumb_func_start sub_8050D9C
sub_8050D9C: @ 0x08050D9C
	push {lr}
	ldr r1, _08050DBC @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	ldr r1, _08050DC0 @ =IWRAM_START + 0x1C
	adds r2, r2, r1
	ldr r1, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r2, #0x24]
	bl sub_8050030
	pop {r0}
	bx r0
	.align 2, 0
_08050DBC: .4byte gCurTask
_08050DC0: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8050DC4
sub_8050DC4: @ 0x08050DC4
	bx lr
	.align 2, 0

	thumb_func_start sub_8050DC8
sub_8050DC8: @ 0x08050DC8
	adds r3, r0, #0
	movs r0, #0x3c
	str r0, [r3, #8]
	movs r1, #0
	movs r0, #0xb4
	strh r0, [r3, #6]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r0, _08050DF4 @ =0x000002CE
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	bx lr
	.align 2, 0
_08050DF4: .4byte 0x000002CE

	thumb_func_start sub_8050DF8
sub_8050DF8: @ 0x08050DF8
	push {lr}
	bl sub_804F5BC
	pop {r0}
	bx r0
	.align 2, 0
