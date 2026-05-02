.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08053D64 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _08053D68 @ =0x03000048
	adds r0, r1, r2
	ldrb r7, [r0]
	ldr r4, _08053D6C @ =0x0300004C
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #1
	lsls r2, r0, #0x10
	strh r0, [r1]
	movs r4, #0x72
	mov sl, r4          @ sl = r4 = 0x72
	lsrs r0, r2, #0x10
	mov sb, r0          @ sb = ui->unk4C++;
	asrs r2, r2, #0x10
	adds r1, r2, #0
	subs r1, #0xa
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _08053D70
	lsls r0, r1, #6
	movs r1, #0x14 @ 20
	bl Div
	mov r1, sp
	subs r0, #0x46
	b _08053D84
	.align 2, 0
_08053D64: .4byte gCurTask
_08053D68: .4byte 0x03000048
_08053D6C: .4byte 0x0300004C
_08053D70:
	cmp r2, #0x1d
	ble _08053D80
	mov r1, sp
	ldr r0, _08053D7C @ =0x0000FFFA
	b _08053D84
	.align 2, 0
_08053D7C: .4byte 0x0000FFFA
_08053D80:
	mov r1, sp
	ldr r0, _08053DDC @ =0x0000FFBA
_08053D84:
	strh r0, [r1, #0xc]
	mov r1, sp      @ r1 = overB
	movs r4, #0x5a
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	adds r0, #4
	strh r0, [r1, #0xa]
	movs r2, #1
	movs r0, #1
	strh r0, [r1, #0xe]
	movs r0, #0x18
	strh r0, [r1, #8]
	movs r0, #3
	strh r0, [r1, #0x10]
	movs r0, #0xa
	strh r0, [r1, #0x12]
	mov r0, sp
	strb r2, [r0, #0x16]
	ldr r0, _08053DE0 @ =gUnknown_0865F178
	bl sub_80530CC
	ldr r0, _08053DE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0     @ r6 = ui
	ldr r2, _08053DE8 @ =gSpecialStageCollectedRings
	ldrh r1, [r2]
	ldr r0, _08053DEC @ =0x000003E7
	mov r8, r4          @ r8 = r4 = 90
	cmp r1, r0
	bls _08053DF0
	movs r0, #0x29
	strb r0, [r6]
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	mov r2, sl
	lsls r2, r2, #0x10
	mov sl, r2
	b _08053E24
	.align 2, 0
_08053DDC: .4byte 0x0000FFBA
_08053DE0: .4byte gUnknown_0865F178
_08053DE4: .4byte gCurTask
_08053DE8: .4byte gSpecialStageCollectedRings
_08053DEC: .4byte 0x000003E7
_08053DF0:
	ldrh r4, [r2]
	movs r5, #0
	mov r0, sb
	lsls r0, r0, #0x10
	mov sb, r0
	mov r1, sl
	lsls r1, r1, #0x10
	mov sl, r1
_08053E00:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r3, r0, #0
	movs r0, #2
	subs r0, r0, r5
	adds r0, r6, r0
	lsls r1, r3, #3
	lsls r2, r3, #1
	adds r1, r1, r2
	subs r1, r4, r1
	adds r1, #0x20
	strb r1, [r0]
	adds r4, r3, #0
	adds r5, #1
	cmp r5, #2
	ble _08053E00
_08053E24:
	ldr r0, _08053E54 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _08053E58 @ =0x03000044
	adds r0, r0, r2
	ldr r1, _08053E5C @ =gSpecialStageCollectedRings
	ldrh r1, [r1]
	strh r1, [r0]
	mov r4, sb
	asrs r2, r4, #0x10
	adds r1, r2, #0
	subs r1, #0x14
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _08053E60
	lsls r0, r1, #6
	movs r1, #0x14
	bl Div
	mov r1, sp
	subs r0, #0x40
	b _08053E6E
	.align 2, 0
_08053E54: .4byte gCurTask
_08053E58: .4byte 0x03000044
_08053E5C: .4byte gSpecialStageCollectedRings
_08053E60:
	cmp r2, #0x27
	ble _08053E6A
	mov r1, sp
	movs r0, #0
	b _08053E6E
_08053E6A:
	mov r1, sp
	ldr r0, _08053EC4 @ =0x0000FFC0
_08053E6E:
	strh r0, [r1, #0xc]
	mov r1, sp
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #0x12]
	movs r0, #0x10
	strh r0, [r1, #8]
	mov r0, sp
	strh r2, [r0, #0x10]
	movs r3, #1
	strb r3, [r0, #0x16]
	ldr r0, _08053EC8 @ =gSpecialStageCollectedRings
	ldrh r2, [r0]
	cmp r2, #9
	bhi _08053EE2
	mov r0, sp
	mov r4, r8
	asrs r1, r4, #0x10
	adds r1, #0xc
	strh r1, [r0, #0xa]
	strh r3, [r0, #0xe]
	cmp r2, #0
	bne _08053ED8
	adds r0, r7, #0     @ r0 = r7 = r7
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsrs r0, r0, #3
	ldr r1, _08053ECC @ =gUnknown_0865F174
	adds r0, r0, r1
	mov r1, sp
	bl sub_80530CC
	movs r0, #0x1f
	ands r7, r0
	ldr r0, _08053ED0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08053ED4 @ =0x03000048
	adds r0, r0, r1
	strh r7, [r0]
	b _08053F10
	.align 2, 0
_08053EC4: .4byte 0x0000FFC0
_08053EC8: .4byte gSpecialStageCollectedRings
_08053ECC: .4byte gUnknown_0865F174
_08053ED0: .4byte gCurTask
_08053ED4: .4byte 0x03000048
_08053ED8:
	adds r0, r6, #2
	mov r1, sp
	bl sub_80530CC
	b _08053F10
_08053EE2:
	cmp r2, #0x63
	bhi _08053EFC
	mov r1, sp
	mov r2, r8
	asrs r0, r2, #0x10
	adds r0, #8
	strh r0, [r1, #0xa]
	movs r0, #2
	strh r0, [r1, #0xe]
	adds r0, r6, #1
	bl sub_80530CC
	b _08053F10
_08053EFC:
	mov r1, sp
	mov r4, r8
	asrs r0, r4, #0x10
	adds r0, #4
	strh r0, [r1, #0xa]
	movs r0, #3
	strh r0, [r1, #0xe]
	adds r0, r6, #0
	bl sub_80530CC
_08053F10:
	ldr r0, _08053F30 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08053F34 @ =0x03000010
	adds r6, r0, r1
	ldr r2, _08053F38 @ =gSpecialStageTargetRings
	ldrh r1, [r2]
	ldr r0, _08053F3C @ =0x000003E7
	cmp r1, r0
	bls _08053F40
	movs r0, #0x29
	strb r0, [r6]
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	b _08053F68
	.align 2, 0
_08053F30: .4byte gCurTask
_08053F34: .4byte 0x03000010
_08053F38: .4byte gSpecialStageTargetRings
_08053F3C: .4byte 0x000003E7
_08053F40:
	ldrh r4, [r2]
	movs r5, #0
_08053F44:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r3, r0, #0
	movs r0, #2
	subs r0, r0, r5
	adds r0, r6, r0
	lsls r1, r3, #3
	lsls r2, r3, #1
	adds r1, r1, r2
	subs r1, r4, r1
	adds r1, #0x20
	strb r1, [r0]
	adds r4, r3, #0
	adds r5, #1
	cmp r5, #2
	ble _08053F44
_08053F68:
	ldr r0, _08053F98 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _08053F9C @ =0x03000044
	adds r0, r0, r2
	ldr r1, _08053FA0 @ =gSpecialStageTargetRings
	ldrh r1, [r1]
	strh r1, [r0]
	mov r4, sb
	asrs r2, r4, #0x10
	adds r1, r2, #0
	subs r1, #0xf
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _08053FA4
	lsls r0, r1, #6
	movs r1, #0x14
	bl Div
	mov r1, sp
	subs r0, #0x34
	b _08053FB2
	.align 2, 0
_08053F98: .4byte gCurTask
_08053F9C: .4byte 0x03000044
_08053FA0: .4byte gSpecialStageTargetRings
_08053FA4:
	cmp r2, #0x22
	ble _08053FAE
	mov r1, sp
	movs r0, #0xc
	b _08053FB2
_08053FAE:
	mov r1, sp
	ldr r0, _0805400C @ =0x0000FFCC
_08053FB2:
	strh r0, [r1, #0xc]
	mov r1, sp
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #0x12]
	movs r0, #0x10
	strh r0, [r1, #8]
	mov r0, sp
	strh r2, [r0, #0x10]
	movs r3, #1
	strb r3, [r0, #0x16]
	ldr r0, _08054010 @ =gSpecialStageTargetRings
	ldrh r2, [r0]
	cmp r2, #9
	bhi _0805402A
	mov r0, sp
	mov r4, sl
	asrs r1, r4, #0x10
	adds r1, #0xc
	strh r1, [r0, #0xa]
	strh r3, [r0, #0xe]
	cmp r2, #0
	bne _08054020
	adds r0, r7, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08054014 @ =gUnknown_0865F174
	adds r0, r0, r1
	mov r1, sp
	bl sub_80530CC
	movs r0, #0x1f
	ands r7, r0
	ldr r0, _08054018 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0805401C @ =0x03000048
	adds r0, r0, r1
	strh r7, [r0]
	b _08054058
	.align 2, 0
_0805400C: .4byte 0x0000FFCC
_08054010: .4byte gSpecialStageTargetRings
_08054014: .4byte gUnknown_0865F174
_08054018: .4byte gCurTask
_0805401C: .4byte 0x03000048
_08054020:
	adds r0, r6, #2
	mov r1, sp
	bl sub_80530CC
	b _08054058
_0805402A:
	cmp r2, #0x63
	bhi _08054044
	mov r1, sp
	mov r2, sl
	asrs r0, r2, #0x10
	adds r0, #8
	strh r0, [r1, #0xa]
	movs r0, #2
	strh r0, [r1, #0xe]
	adds r0, r6, #1
	bl sub_80530CC
	b _08054058
_08054044:
	mov r1, sp
	mov r4, sl
	asrs r0, r4, #0x10
	adds r0, #4
	strh r0, [r1, #0xa]
	movs r0, #3
	strh r0, [r1, #0xe]
	adds r0, r6, #0
	bl sub_80530CC
_08054058:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
