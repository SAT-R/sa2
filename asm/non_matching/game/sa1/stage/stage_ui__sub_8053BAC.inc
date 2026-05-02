.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	ldr r0, _08053C24 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0     @ r5 = ui
	ldr r1, _08053C28 @ =0x03000048
	mov r8, r1          @ r8 = 0x03000048
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r6, r0, #0x18  @ r6 = ui->unk48 << 24
	lsrs r7, r6, #0x18  @ r7 = r7 = ui->unk48
	mov r0, sp
	movs r2, #0
	movs r1, #5         @ r1 = 5
	mov ip, r1          @ ip = r1 = 5
	mov r1, ip          @ r1 = 5
	strh r1, [r0, #0xc]
	mov r1, sp
	movs r0, #6
	strh r0, [r1, #0x12]
	movs r0, #0x10
	strh r0, [r1, #8]
	mov r0, sp
	strh r2, [r0, #0x10]
	movs r3, #1
	strb r3, [r0, #0x16]
	ldr r0, _08053C2C @ =gRingCount
	ldrh r2, [r0]
	cmp r2, #9
	bhi _08053C3C
	mov r0, sp
	movs r1, #9
	strh r1, [r0, #0xa]
	strh r3, [r0, #0xe]
	cmp r2, #0
	bne _08053C34
	adds r4, r7, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsrs r0, r6, #0x1b
	ldr r1, _08053C30 @ =gUnknown_0865F174
	adds r0, r0, r1
	mov r1, sp
	bl sub_80530CC
	movs r0, #0x1f
	ands r4, r0
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	add r0, r8
	strh r4, [r0]
	b _08053C6C
	.align 2, 0
_08053C24: .4byte gCurTask
_08053C28: .4byte 0x03000048
_08053C2C: .4byte gRingCount
_08053C30: .4byte gUnknown_0865F174
_08053C34:
	ldr r1, _08053C38 @ =0x03000002
	b _08053C4E
	.align 2, 0
_08053C38: .4byte 0x03000002
_08053C3C:
	cmp r2, #0x63
	bhi _08053C5C
	mov r0, sp
	mov r1, ip      @ r1 = ip = 5
	strh r1, [r0, #0xa]
	mov r1, sp
	movs r0, #2
	strh r0, [r1, #0xe]
	ldr r1, _08053C58 @ =0x03000001
_08053C4E:
	adds r0, r4, r1
	mov r1, sp
	bl sub_80530CC
	b _08053C6C
	.align 2, 0
_08053C58: .4byte 0x03000001
_08053C5C:
	mov r0, sp
	strh r3, [r0, #0xa]
	mov r1, sp
	movs r0, #3
	strh r0, [r1, #0xe]
	adds r0, r5, #0
	bl sub_80530CC
_08053C6C:
	adds r5, #0x10
	mov r0, sp
	ldr r1, _08053CB4 @ =0x0000FFFE
	strh r1, [r0, #0xc]
	movs r3, #0
	ldrb r0, [r5]
	ldr r1, _08053CB8 @ =gLevelScore
	cmp r0, #0x20
	bne _08053C90
_08053C7E:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bhi _08053C90
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _08053C7E
_08053C90:
	ldr r0, [r1]
	cmp r0, #0
	beq _08053CBC
	mov r0, sp
	movs r1, #9
	subs r1, r1, r3
	strh r1, [r0, #0xe]
	mov r2, sp
	lsls r1, r1, #3
	movs r0, #0x51
	subs r0, r0, r1
	strh r0, [r2, #0xa]
	adds r0, r5, r3
	mov r1, sp
	bl sub_80530CC
	b _08053CCC
	.align 2, 0
_08053CB4: .4byte 0x0000FFFE
_08053CB8: .4byte gLevelScore
_08053CBC:
	mov r1, sp
	movs r0, #1
	strh r0, [r1, #0xe]
	movs r0, #0x49
	strh r0, [r1, #0xa]
	ldr r0, _08053D10 @ =gUnknown_0865F178
	bl sub_80530CC
_08053CCC:
	adds r5, #0x10
	mov r1, sp
	movs r0, #0x19
	strh r0, [r1, #0xa]
	movs r0, #0xc
	strh r0, [r1, #0xc]
	movs r0, #7
	strh r0, [r1, #0xe]
	adds r0, r5, #0
	bl sub_80530CC
	ldr r0, _08053D14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08053D00
	adds r5, #0x10
	mov r1, sp
	movs r0, #0x16
	strh r0, [r1, #0xa]
	movs r0, #0x8f
	strh r0, [r1, #0xc]
	movs r0, #1
	strh r0, [r1, #0xe]
	adds r0, r5, #0
	bl sub_80530CC
_08053D00:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053D10: .4byte gUnknown_0865F178
_08053D14: .4byte gGameMode

.syntax divided
