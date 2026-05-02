.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _08001ADC @ =gBackgroundsCopyQueueCursor
	ldr r1, _08001AE0 @ =gBackgroundsCopyQueueIndex
	ldrb r2, [r0]
	adds r3, r0, #0
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r2, r1
	bne _08001AC8
	bl _0800258C
_08001AC8:
	ldr r0, _08001AE4 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08001AE8
	movs r0, #0
	bl sub_800258E
	.align 2, 0
_08001ADC: .4byte gBackgroundsCopyQueueCursor
_08001AE0: .4byte gBackgroundsCopyQueueIndex
_08001AE4: .4byte 0x04000004
_08001AE8:
	ldr r0, _08001B48 @ =0x04000006
	ldrh r0, [r0]
	ldr r2, _08001B4C @ =gBackgroundsCopyQueue
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r6, [r0]
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r3]
	ldrh r2, [r6, #0x2e]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08001B14
	ldr r1, [r6, #0x30]
	ldr r0, [r6, #0x34]
	cmp r1, r0
	bne _08001B14
	bl _8002580
_08001B14:
	ldrh r3, [r6, #0x14]
	str r3, [sp]
	movs r3, #3
	adds r5, r3, #0
	ands r5, r2
	ldr r4, [sp]
	cmp r5, #1
	bls _08001B58
	ldr r0, _08001B50 @ =gDispCnt
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08001B58
	ldr r1, _08001B54 @ =gBgCntRegs
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, #0xe
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r3
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #1
	b _08001B76
	.align 2, 0
_08001B48: .4byte 0x04000006
_08001B4C: .4byte gBackgroundsCopyQueue
_08001B50: .4byte gDispCnt
_08001B54: .4byte gBgCntRegs
_08001B58:
	movs r1, #0x20
	str r1, [sp, #0xc]
	ldr r0, _08001C48 @ =gBgCntRegs
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsrs r3, r0, #0xe
	cmp r3, #1
	beq _08001B6E
	cmp r3, #3
	bne _08001B74
_08001B6E:
	movs r2, #0x80
	lsls r2, r2, #4
	str r2, [sp, #4]
_08001B74:
	movs r0, #2
_08001B76:
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldrh r2, [r6, #0x2e]
	movs r0, #0x20
	mov sb, r0
	ands r0, r2
	cmp r0, #0
	beq _08001B94
	b _08001F60
_08001B94:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08001B9E
	b _08001E50
_08001B9E:
	ldrh r0, [r6, #0x24]
	ldr r1, [sp, #0xc]
	muls r0, r1, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r5, [r6, #0x22]
	mov r8, r5
	ldr r5, [sp, #8]
	mov r0, r8
	muls r0, r5, r0
	adds r7, r1, r0
	ldrh r5, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08001BC4
	b _08001CCC
_08001BC4:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08001C50
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r2, [r6, #0x10]
	adds r2, r2, r0
	ldrh r0, [r6, #0x1e]
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	subs r0, #1
	ldr r3, [sp, #8]
	muls r0, r3, r0
	adds r4, r2, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08001C4C @ =0x0000FFFF
	cmp r5, r0
	bne _08001BFA
	bl _08002570
_08001BFA:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_08001C04:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08001C36
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_08001C18:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08001C18
_08001C36:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08001C04
	bl _08002570
	.align 2, 0
_08001C48: .4byte gBgCntRegs
_08001C4C: .4byte 0x0000FFFF
_08001C50:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r2, [r6, #0x10]
	adds r2, r2, r0
	ldrh r0, [r6, #0x1e]
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	subs r0, #1
	ldr r3, [sp, #8]
	muls r0, r3, r0
	adds r4, r2, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08001CC8 @ =0x0000FFFF
	cmp r5, r0
	bne _08001C7A
	bl _08002570
_08001C7A:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_08001C84:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08001CB6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08001C98:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08001C98
_08001CB6:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08001C84
	bl _08002570
	.align 2, 0
_08001CC8: .4byte 0x0000FFFF
_08001CCC:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08001D50
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r1, [sp, #8]
	muls r0, r1, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	ldr r2, [sp, #8]
	muls r0, r2, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _08001D4C @ =0x0000FFFF
	cmp r5, r3
	bne _08001CFC
	bl _08002570
_08001CFC:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r2, r0
	mov sb, r0
	mov sl, r3
_08001D06:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08001D38
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
_08001D1A:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08001D1A
_08001D38:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08001D06
	bl _08002570
	.align 2, 0
_08001D4C: .4byte 0x0000FFFF
_08001D50:
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _08001DF0
	ldr r2, [sp, #8]
	cmp r2, #2
	bne _08001DF0
	mov r3, sb
	mov r0, r8
	subs r3, r3, r0
	cmp r3, #0
	ble _08001DF0
	ldrh r0, [r6, #0x26]
	add r0, r8
	adds r2, r0, #0
	subs r2, #0x20
	cmp r2, #0
	ble _08001DF0
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	lsls r0, r0, #1
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	lsls r0, r0, #1
	adds r4, r1, r0
	lsls r3, r3, #1
	mov sb, r3
	lsls r2, r2, #1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08001DE8 @ =0x0000FFFF
	cmp r5, r1
	bne _08001D98
	b _08002570
_08001D98:
	ldr r1, _08001DEC @ =0x040000D4
	asrs r3, r3, #1
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r3, r0
	mov r8, r3
	asrs r2, r2, #1
	mov ip, r2
	orrs r2, r0
	mov ip, r2
_08001DAC:
	str r4, [r1]
	str r7, [r1, #4]
	mov r3, r8
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r4, #0
	add r0, sb
	str r0, [r1]
	ldr r2, [sp, #4]
	adds r2, r2, r7
	str r2, [r1, #4]
	mov r3, ip
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	ldr r3, [sp]
	ldr r0, [sp, #8]
	adds r2, r3, #0
	muls r2, r0, r2
	mov sl, r2
	add r4, sl
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _08001DE8 @ =0x0000FFFF
	cmp r5, r2
	bne _08001DAC
	b _08002570
	.align 2, 0
_08001DE8: .4byte 0x0000FFFF
_08001DEC: .4byte 0x040000D4
_08001DF0:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08001E48 @ =0x0000FFFF
	cmp r5, r0
	bne _08001E10
	b _08002570
_08001E10:
	ldr r1, _08001E4C @ =0x040000D4
	movs r2, #0x80
	lsls r2, r2, #0x18
	mov r8, r2
	mov sb, r0
	ldr r0, [sp]
	adds r2, r0, #0
	muls r2, r3, r2
_08001E20:
	str r4, [r1]
	str r7, [r1, #4]
	ldrh r0, [r6, #0x26]
	ldr r3, [sp, #8]
	muls r0, r3, r0
	asrs r0, r0, #1
	mov r3, r8
	orrs r0, r3
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	adds r4, r4, r2
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bne _08001E20
	b _08002570
	.align 2, 0
_08001E48: .4byte 0x0000FFFF
_08001E4C: .4byte 0x040000D4
_08001E50:
	ldrh r1, [r6, #0x1e]
	str r1, [sp, #0x10]
	ldrh r2, [r6, #0x20]
	str r2, [sp, #0x14]
	movs r3, #0
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _08001E64
	b _08002570
_08001E64:
	ldr r4, [sp, #0x10]
	add r4, sl
	ldrh r1, [r6, #0x14]
	adds r0, r4, #0
	bl Div
	str r0, [sp, #0x18]
	ldrh r1, [r6, #0x14]
	adds r5, r0, #0
	adds r0, r5, #0
	muls r0, r1, r0
	subs r4, r4, r0
	str r4, [sp, #0x1c]
	ldrh r0, [r6, #0x28]
	mov r8, r0
	ldrh r0, [r6, #0x26]
	mov r2, sl
	subs r0, r0, r2
	subs r1, r1, r4
	cmp r1, r0
	ble _08001E90
	adds r1, r0, #0
_08001E90:
	ldr r4, [sp, #8]
	adds r3, r1, #0
	muls r3, r4, r3
	str r3, [sp, #0x20]
	movs r5, #0
	mov sb, r5
	add r1, sl
	str r1, [sp, #0x38]
	cmp sb, r8
	bge _08001F50
_08001EA4:
	ldr r4, [sp, #0x14]
	add r4, sb
	ldrh r1, [r6, #0x16]
	adds r0, r4, #0
	bl Div
	ldrh r3, [r6, #0x16]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r4, r4, r1
	subs r5, r3, r4
	ldrh r1, [r6, #0x3c]
	muls r1, r0, r1
	ldr r0, [r6, #0x38]
	adds r0, r0, r1
	ldr r1, [sp, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrh r2, [r6, #0x14]
	muls r0, r2, r0
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r3, [sp, #8]
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	ldrh r1, [r6, #0x24]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	mov r1, sb
	muls r1, r2, r1
	adds r0, r0, r1
	ldrh r3, [r6, #0x22]
	adds r0, r0, r3
	ldr r2, [sp, #8]
	mov r1, sl
	muls r1, r2, r1
	adds r7, r0, r1
	add sb, r5
	cmp r5, r8
	ble _08001F04
	mov r5, r8
_08001F04:
	mov r3, r8
	subs r3, r3, r5
	mov r8, r3
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	beq _08001F4A
	ldr r3, _08001F5C @ =0x040000D4
	ldr r1, [sp, #0x20]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x3c]
	orrs r2, r0
	str r2, [sp, #0x3c]
	ldr r1, [sp]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	mov ip, r0
_08001F32:
	str r4, [r3]
	str r7, [r3, #4]
	ldr r0, [sp, #0x3c]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, ip
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _08001F32
_08001F4A:
	ldrh r2, [r6, #0x28]
	cmp sb, r2
	blt _08001EA4
_08001F50:
	ldr r3, [sp, #0x38]
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _08001E64
	b _08002570
	.align 2, 0
_08001F5C: .4byte 0x040000D4
_08001F60:
	movs r0, #0x40
	ands r0, r2
	ldrh r3, [r6, #0x30]
	ldr r1, _08002030 @ =gBgScrollRegs
	mov sb, r1
	lsls r5, r5, #2
	mov r8, r5
	cmp r0, #0
	bne _08001FAC
	adds r2, r4, #0
	lsls r0, r4, #3
	ldrh r5, [r6, #0x16]
	ldrh r7, [r6, #0x32]
	cmp r3, r0
	blt _08001F90
_08001F7E:
	lsls r1, r2, #3
	ldrh r0, [r6, #0x30]
	subs r0, r0, r1
	strh r0, [r6, #0x30]
	ldrh r1, [r6, #0x30]
	adds r2, r4, #0
	lsls r0, r4, #3
	cmp r1, r0
	bge _08001F7E
_08001F90:
	adds r2, r5, #0
	lsls r0, r2, #3
	ldrh r3, [r6, #0x30]
	cmp r7, r0
	blt _08001FAC
_08001F9A:
	lsls r1, r2, #3
	ldrh r0, [r6, #0x32]
	subs r0, r0, r1
	strh r0, [r6, #0x32]
	ldrh r1, [r6, #0x32]
	adds r2, r5, #0
	lsls r0, r2, #3
	cmp r1, r0
	bge _08001F9A
_08001FAC:
	mov r0, r8
	add r0, sb
	movs r2, #7
	ands r3, r2
	strh r3, [r0]
	mov r1, sb
	adds r1, #2
	add r1, r8
	ldrh r0, [r6, #0x32]
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r6, #0x34]
	ldrh r4, [r6, #0x30]
	lsrs r2, r4, #3
	lsrs r0, r0, #3
	cmp r0, r2
	bne _08001FDC
	ldrh r1, [r6, #0x36]
	ldrh r0, [r6, #0x32]
	lsrs r1, r1, #3
	lsrs r0, r0, #3
	cmp r1, r0
	bne _08001FDC
	b _08002570
_08001FDC:
	ldrh r1, [r6, #0x2e]
	movs r0, #0x40
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _08001FEA
	b _08002454
_08001FEA:
	ldrh r0, [r6, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r6, #0x32]
	lsrs r0, r0, #3
	ldrh r2, [r6, #0x20]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldrh r0, [r6, #0x24]
	ldr r4, [sp, #0xc]
	muls r0, r4, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r0, [r6, #0x22]
	ldr r5, [sp, #8]
	muls r0, r5, r0
	adds r7, r1, r0
	ldrh r0, [r6, #0x26]
	ldr r1, [sp, #0x10]
	adds r2, r1, r0
	adds r1, r2, #1
	ldrh r4, [r6, #0x14]
	mov r8, r0
	cmp r1, r4
	ble _08002034
	subs r0, r4, #1
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08002036
	.align 2, 0
_08002030: .4byte gBgScrollRegs
_08002034:
	movs r2, #0
_08002036:
	ldrh r0, [r6, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0800204C
	b _08002148
_0800204C:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080020D0
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	add r0, r8
	subs r0, #1
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _080020CC @ =0x0000FFFF
	cmp r5, r0
	bne _08002080
	b _0800223C
_08002080:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_0800208A:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _080020BC
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_0800209E:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _0800209E
_080020BC:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _0800208A
	b _0800223C
	.align 2, 0
_080020CC: .4byte 0x0000FFFF
_080020D0:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	add r0, r8
	subs r0, #1
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _08002144 @ =0x0000FFFF
	cmp r5, r0
	bne _080020F8
	b _0800223C
_080020F8:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_08002102:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08002134
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08002116:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08002116
_08002134:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _08002102
	b _0800223C
	.align 2, 0
_08002144: .4byte 0x0000FFFF
_08002148:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080021CC
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	ldr r4, [sp, #0x10]
	adds r1, r4, #0
	muls r1, r3, r1
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _080021C8 @ =0x0000FFFF
	cmp r5, r0
	beq _0800223C
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_08002184:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _080021B6
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
_08002198:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08002198
_080021B6:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _08002184
	b _0800223C
	.align 2, 0
_080021C8: .4byte 0x0000FFFF
_080021CC:
	ldr r3, [sp, #0x14]
	adds r0, r3, #0
	muls r0, r4, r0
	ldr r4, [sp, #8]
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	ldr r3, [sp, #0x10]
	adds r1, r3, #0
	muls r1, r4, r1
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _080022F0 @ =0x0000FFFF
	cmp r5, r0
	beq _0800223C
	ldr r2, _080022F4 @ =0x040000D4
	mov r1, sl
	asrs r0, r1, #0x10
	subs r0, #1
	mov r8, r0
	ldr r3, _080022F0 @ =0x0000FFFF
	mov ip, r3
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov sb, r0
	ldr r1, [sp]
	ldr r0, [sp, #8]
	adds r3, r1, #0
	muls r3, r0, r3
_08002210:
	str r4, [r2]
	str r7, [r2, #4]
	ldrh r0, [r6, #0x26]
	mov r1, r8
	subs r0, r0, r1
	ldr r1, [sp, #8]
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r1, sb
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	adds r4, r4, r3
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _08002210
_0800223C:
	mov r1, sl
	asrs r3, r1, #0x10
	cmp r3, #0
	bne _08002246
	b _08002570
_08002246:
	ldrh r0, [r6, #0x24]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r0, [r6, #0x22]
	ldrh r4, [r6, #0x14]
	adds r0, r0, r4
	ldr r5, [sp, #0x10]
	subs r0, r0, r5
	ldr r2, [sp, #8]
	muls r0, r2, r0
	adds r7, r1, r0
	ldrh r0, [r6, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r1, [r6, #0x2e]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0800236C
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080022F8
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	subs r0, r3, #1
	muls r0, r2, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _080022F0 @ =0x0000FFFF
	cmp r5, r3
	bne _080022A2
	b _08002570
_080022A2:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r2, r0
	mov sb, r0
	mov sl, r3
_080022AC:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _080022DE
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_080022C0:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _080022C0
_080022DE:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _080022AC
	b _08002570
	.align 2, 0
_080022F0: .4byte 0x0000FFFF
_080022F4: .4byte 0x040000D4
_080022F8:
	ldr r2, [sp, #0x14]
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r4, [sp, #8]
	muls r0, r4, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	subs r0, r3, #1
	muls r0, r4, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08002368 @ =0x0000FFFF
	cmp r5, r0
	bne _0800231A
	b _08002570
_0800231A:
	ldr r2, [sp]
	ldr r3, [sp, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_08002326:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08002358
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0800233A:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _0800233A
_08002358:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08002326
	b _08002570
	.align 2, 0
_08002368: .4byte 0x0000FFFF
_0800236C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080023EC
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080023E8 @ =0x0000FFFF
	cmp r5, r0
	bne _08002394
	b _08002570
_08002394:
	mov r1, sl
	str r1, [sp, #0x30]
	mov ip, r3
	ldr r0, [sp]
	adds r3, r0, #0
	muls r3, r2, r3
	mov sb, r3
_080023A2:
	movs r3, #0
	subs r5, #1
	ldr r1, [sp, #0xc]
	adds r2, r7, r1
	cmp r3, ip
	bge _080023D6
	movs r0, #0x80
	lsls r0, r0, #4
	mov sl, r0
	ldr r1, [sp, #0x30]
	asrs r1, r1, #0x10
	mov r8, r1
_080023BA:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, sl
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _080023BA
_080023D6:
	adds r7, r2, #0
	mov r2, sb
	subs r4, r4, r2
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _080023E8 @ =0x0000FFFF
	cmp r5, r3
	bne _080023A2
	b _08002570
	.align 2, 0
_080023E8: .4byte 0x0000FFFF
_080023EC:
	ldr r1, [sp, #0x14]
	adds r0, r1, #0
	muls r0, r4, r0
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0800244C @ =0x0000FFFF
	cmp r5, r0
	bne _0800240A
	b _08002570
_0800240A:
	ldr r2, _08002450 @ =0x040000D4
	ldr r1, [sp, #8]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov r3, sb
	orrs r3, r0
	mov sb, r3
	ldr r1, [sp]
	ldr r3, [sp, #8]
	adds r0, r1, #0
	muls r0, r3, r0
	mov r8, r0
_0800242E:
	str r4, [r2]
	str r7, [r2, #4]
	mov r0, sb
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, r8
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _0800244C @ =0x0000FFFF
	cmp r5, r3
	bne _0800242E
	b _08002570
	.align 2, 0
_0800244C: .4byte 0x0000FFFF
_08002450: .4byte 0x040000D4
_08002454:
	lsrs r0, r4, #3
	ldrh r4, [r6, #0x1e]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r6, #0x32]
	lsrs r0, r0, #3
	ldrh r5, [r6, #0x20]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r0, #0
	mov sl, r0
	ldrh r1, [r6, #0x26]
	cmp sl, r1
	bge _08002570
_08002478:
	ldr r4, [sp, #0x10]
	add r4, sl
	ldrh r1, [r6, #0x14]
	adds r0, r4, #0
	bl Div
	str r0, [sp, #0x24]
	ldrh r1, [r6, #0x14]
	adds r2, r0, #0
	adds r0, r2, #0
	muls r0, r1, r0
	subs r4, r4, r0
	str r4, [sp, #0x28]
	ldrh r3, [r6, #0x28]
	mov r8, r3
	ldrh r0, [r6, #0x26]
	mov r4, sl
	subs r0, r0, r4
	ldr r5, [sp, #0x28]
	subs r1, r1, r5
	cmp r1, r0
	ble _080024A6
	adds r1, r0, #0
_080024A6:
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	str r0, [sp, #0x2c]
	movs r3, #0
	mov sb, r3
	add r1, sl
	str r1, [sp, #0x34]
	cmp sb, r8
	bge _08002566
_080024BA:
	ldr r4, [sp, #0x14]
	add r4, sb
	ldrh r1, [r6, #0x16]
	adds r0, r4, #0
	bl Div
	ldrh r3, [r6, #0x16]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r4, r4, r1
	subs r5, r3, r4
	ldrh r1, [r6, #0x3c]
	muls r1, r0, r1
	ldr r0, [r6, #0x38]
	adds r0, r0, r1
	ldr r1, [sp, #0x24]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrh r2, [r6, #0x14]
	muls r0, r2, r0
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r2, [sp, #0x28]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r3, [sp, #8]
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	ldrh r1, [r6, #0x24]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	mov r1, sb
	muls r1, r2, r1
	adds r0, r0, r1
	ldrh r3, [r6, #0x22]
	adds r0, r0, r3
	ldr r2, [sp, #8]
	mov r1, sl
	muls r1, r2, r1
	adds r7, r0, r1
	add sb, r5
	cmp r5, r8
	ble _0800251A
	mov r5, r8
_0800251A:
	mov r3, r8
	subs r3, r3, r5
	mov r8, r3
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	beq _08002560
	ldr r3, _080025A0 @ =0x040000D4
	ldr r1, [sp, #0x2c]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x3c]
	orrs r2, r0
	str r2, [sp, #0x3c]
	ldr r1, [sp]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	mov ip, r0
_08002548:
	str r4, [r3]
	str r7, [r3, #4]
	ldr r0, [sp, #0x3c]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, ip
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _08002548
_08002560:
	ldrh r2, [r6, #0x28]
	cmp sb, r2
	blt _080024BA
_08002566:
	ldr r3, [sp, #0x34]
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _08002478
_08002570:
	ldr r0, _080025A4 @ =0x04000006
	ldrh r0, [r0]
	ldrh r0, [r6, #0x30]
	strh r0, [r6, #0x34]
	ldrh r0, [r6, #0x32]
	strh r0, [r6, #0x36]
	ldr r3, _080025A8 @ =gBackgroundsCopyQueueCursor
	ldr r4, _080025AC @ =gBackgroundsCopyQueueIndex
_8002580: @ 0x08002580
	ldrb r0, [r3]
	ldrb r5, [r4]
	cmp r0, r5
	beq _0800258C
	bl _08001AC8
_0800258C:
	movs r0, #1
sub_800258E:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080025A0: .4byte 0x040000D4
_080025A4: .4byte REG_VCOUNT
_080025A8: .4byte gBackgroundsCopyQueueCursor
_080025AC: .4byte gBackgroundsCopyQueueIndex

.syntax divided
