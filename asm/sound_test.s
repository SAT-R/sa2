.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_808AB08
sub_808AB08: @ 0x0808AB08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _0808ADAC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	adds r1, #0xc8
	adds r1, r0, r1
	str r1, [sp]
	ldr r2, _0808ADB0 @ =IWRAM_START + 0xF8
	adds r6, r0, r2
	ldr r3, _0808ADB4 @ =IWRAM_START + 0x30C
	adds r3, r3, r0
	mov sl, r3
	ldr r5, _0808ADB8 @ =IWRAM_START + 0x33C
	adds r4, r0, r5
	ldr r1, _0808ADBC @ =IWRAM_START + 0x2DC
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0808ADC0 @ =IWRAM_START + 0x2D8
	adds r1, r0, r2
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r3, _0808ADC4 @ =IWRAM_START + 0x188
	adds r3, r0, r3
	str r3, [sp, #8]
	ldr r5, _0808ADC8 @ =IWRAM_START + 0x1B8
	adds r5, r0, r5
	str r5, [sp, #0xc]
	ldr r1, _0808ADCC @ =IWRAM_START + 0x3CC
	adds r1, r0, r1
	str r1, [sp, #0x10]
	ldr r1, _0808ADD0 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	ldr r3, _0808ADD4 @ =gHBlankCallbacks
	ldr r2, _0808ADD8 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0808ADDC @ =sub_808DB2C
	str r1, [r0]
	ldr r2, _0808ADE0 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	movs r5, #0
	movs r2, #0x60
	mov sb, r2
	ldr r2, _0808ADE4 @ =gUnknown_080E0C30
_0808AB88:
	movs r0, #0x60
	strh r0, [r4, #0x18]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0808ADE8 @ =0x0000070C
	adds r1, r7, r3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0808ABC8
	cmp r0, #0
	ble _0808ABB0
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x60
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0808ABB0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808ABC8
	subs r0, r2, r0
	ldrb r0, [r0]
	mov r3, sb
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808ABC8:
	adds r0, r4, #0
	str r2, [sp, #0x20]
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r0, r0, r5
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x20]
	cmp r0, #1
	ble _0808AB88
	movs r5, #0
_0808ABE6:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0808ABE6
	mov r0, sl
	bl sub_80051E8
	ldr r0, [sp]
	bl sub_80051E8
	mov r0, r8
	bl sub_80051E8
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	mov r0, r8
	bl sub_80051E8
	mov r3, r8
	ldr r0, [r3, #0x10]
	ldr r1, _0808ADEC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldr r5, _0808ADF0 @ =0x00000709
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808AC38
	b _0808AE14
_0808AC38:
	movs r0, #0
	mov ip, r0
	mov sb, r0
	ldr r0, _0808ADF4 @ =0x04000062
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r0, r4
	lsrs r2, r0, #0xc
	adds r5, #0xa
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808AC68
	movs r1, #0x20
	movs r0, #0x20
	mov sb, r0
	subs r5, #1
	adds r0, r7, r5
	strb r1, [r0]
	strb r2, [r3]
	movs r0, #1
	mov ip, r0
_0808AC68:
	movs r2, #0
	ldr r1, _0808ADF8 @ =0x00000714
	adds r3, r7, r1
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808AC92
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r5, _0808ADFC @ =0x00000712
	adds r1, r7, r5
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808AC92:
	ldr r0, _0808AE00 @ =0x04000072
	movs r1, #0
	ldrsh r0, [r0, r1]
	ands r0, r4
	lsrs r2, r0, #0xc
	ldr r5, _0808AE04 @ =0x00000715
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808ACC4
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0808ADFC @ =0x00000712
	adds r1, r7, r0
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808ACC4:
	ldr r0, _0808AE08 @ =0x04000078
	movs r1, #0
	ldrsh r0, [r0, r1]
	ands r0, r4
	lsrs r2, r0, #0xc
	ldr r5, _0808AE0C @ =0x00000716
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808ACF6
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0808ADFC @ =0x00000712
	adds r1, r7, r0
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808ACF6:
	ldr r1, _0808AE10 @ =gSoundInfo
	str r1, [sp, #0x14]
	movs r5, #0
	movs r2, #0xe7
	lsls r2, r2, #3
	adds r2, r7, r2
	str r2, [sp, #0x18]
	movs r3, #0xe3
	lsls r3, r3, #3
	adds r3, r7, r3
	str r3, [sp, #0x1c]
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r0, r0, r7
	mov r8, r0
	ldr r1, _0808ADFC @ =0x00000712
	adds r1, r1, r7
	mov sl, r1
_0808AD1A:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	ldr r3, [sp, #0x18]
	adds r6, r3, r2
	lsls r1, r1, #6
	ldr r0, [sp, #0x14]
	adds r0, #0x70
	adds r4, r0, r1
	ldr r1, [r6]
	ldr r0, [r4]
	cmp r1, r0
	beq _0808AD64
	subs r3, r1, r0
	ldr r0, [sp, #0x1c]
	adds r2, r0, r2
	ldr r0, [r2]
	subs r0, r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bls _0808AD5E
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	movs r0, #0x20
	mov r1, sl
	strb r0, [r1]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808AD5E:
	str r3, [r2]
	ldr r0, [r4]
	str r0, [r6]
_0808AD64:
	lsls r0, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0808AD1A
	mov r3, ip
	cmp r3, #0
	beq _0808AD8E
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r4, r7, r5
	mov r0, sb
	mov r1, ip
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
_0808AD8E:
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r1, r7, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc0
	ble _0808AE26
	movs r0, #0xc0
	strh r0, [r1]
	ldr r3, _0808ADFC @ =0x00000712
	adds r1, r7, r3
	movs r0, #4
	strb r0, [r1]
	b _0808AE26
	.align 2, 0
_0808ADAC: .4byte gCurTask
_0808ADB0: .4byte IWRAM_START + 0xF8
_0808ADB4: .4byte IWRAM_START + 0x30C
_0808ADB8: .4byte IWRAM_START + 0x33C
_0808ADBC: .4byte IWRAM_START + 0x2DC
_0808ADC0: .4byte IWRAM_START + 0x2D8
_0808ADC4: .4byte IWRAM_START + 0x188
_0808ADC8: .4byte IWRAM_START + 0x1B8
_0808ADCC: .4byte IWRAM_START + 0x3CC
_0808ADD0: .4byte gBgScrollRegs
_0808ADD4: .4byte gHBlankCallbacks
_0808ADD8: .4byte gNumHBlankCallbacks
_0808ADDC: .4byte sub_808DB2C
_0808ADE0: .4byte gFlags
_0808ADE4: .4byte gUnknown_080E0C30
_0808ADE8: .4byte 0x0000070C
_0808ADEC: .4byte 0xFFFFFBFF
_0808ADF0: .4byte 0x00000709
_0808ADF4: .4byte 0x04000062
_0808ADF8: .4byte 0x00000714
_0808ADFC: .4byte 0x00000712
_0808AE00: .4byte 0x04000072
_0808AE04: .4byte 0x00000715
_0808AE08: .4byte 0x04000078
_0808AE0C: .4byte 0x00000716
_0808AE10: .4byte gSoundInfo
_0808AE14:
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r1, r7, r5
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808AF64 @ =0x00000712
	adds r0, r7, r1
	strb r2, [r0]
_0808AE26:
	movs r5, #0
	ldr r6, _0808AF68 @ =0x000003CA
_0808AE2A:
	ldr r2, [sp, #4]
	ldrh r0, [r2, #0xa]
	cmp r0, r6
	beq _0808AE58
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r0, r0, #8
	strh r0, [r1]
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r2, r7, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0808AE58:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	ldr r5, [sp, #0xc]
	adds r0, r5, r0
	lsls r1, r1, #2
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	bl sub_8004860
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808AE2A
	movs r3, #0xe2
	lsls r3, r3, #3
	adds r4, r7, r3
	ldr r2, _0808AF6C @ =gSineTable
	ldr r5, _0808AF64 @ =0x00000712
	adds r3, r7, r5
	ldrb r1, [r3]
	lsls r1, r1, #2
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808AEAC
	subs r0, #1
	strb r0, [r3]
_0808AEAC:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0808AEB8
	movs r0, #0
	strh r0, [r4]
_0808AEB8:
	movs r5, #0
_0808AEBA:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808AEBA
	ldr r0, [sp, #4]
	bl sub_80051E8
	ldr r3, _0808AF6C @ =gSineTable
	mov r8, r3
	movs r0, #0xe1
	lsls r0, r0, #3
	adds r5, r7, r0
	ldrb r1, [r5]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #7
	adds r0, #0x5e
	ldr r1, [sp, #8]
	strh r0, [r1, #0x16]
	ldr r0, [sp, #8]
	bl sub_80051E8
	ldrb r0, [r5]
	ands r4, r0
	lsls r4, r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #7
	movs r0, #0x3a
	subs r0, r0, r1
	ldr r2, [sp, #8]
	strh r0, [r2, #0x16]
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	ldr r0, [sp, #8]
	bl sub_80051E8
	ldr r3, [sp, #8]
	ldr r0, [r3, #0x10]
	ldr r1, _0808AF70 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF64: .4byte 0x00000712
_0808AF68: .4byte 0x000003CA
_0808AF6C: .4byte gSineTable
_0808AF70: .4byte 0xFFFFFBFF

	thumb_func_start sub_808AF74
sub_808AF74: @ 0x0808AF74
	push {r4, r5, r6, lr}
	ldr r0, _0808AFB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0808AFB4 @ =IWRAM_START + 0x278
	adds r2, r5, r0
	ldr r1, _0808AFB8 @ =gUnknown_030006FC
	adds r4, r5, r1
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	ldr r3, _0808AFBC @ =gUnknown_03000709
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808AFC4
	adds r0, r2, #0
	bl sub_8004558
	ldrb r0, [r4]
	cmp r0, #0x2c
	bls _0808AFDA
	ldr r1, _0808AFC0 @ =IWRAM_START+4
	adds r0, r5, r1
	bl sub_802D4CC
	b _0808AFDA
	.align 2, 0
_0808AFB0: .4byte gCurTask
_0808AFB4: .4byte IWRAM_START + 0x278
_0808AFB8: .4byte gUnknown_030006FC
_0808AFBC: .4byte gUnknown_03000709
_0808AFC0: .4byte IWRAM_START+4
_0808AFC4:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808AFD2
	adds r0, r2, #0
	bl sub_8004558
_0808AFD2:
	ldr r2, _0808AFF8 @ =IWRAM_START+4
	adds r0, r5, r2
	bl sub_802D4CC
_0808AFDA:
	ldr r3, _0808AFFC @ =0x000006FC
	adds r1, r6, r3
	ldrb r0, [r1]
	cmp r0, #0x3c
	bls _0808B01E
	ldr r2, _0808B000 @ =0x00000709
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808B00C
	ldr r0, _0808B004 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808B008 @ =sub_808B2C8
	b _0808B01C
	.align 2, 0
_0808AFF8: .4byte IWRAM_START+4
_0808AFFC: .4byte 0x000006FC
_0808B000: .4byte 0x00000709
_0808B004: .4byte gCurTask
_0808B008: .4byte sub_808B2C8
_0808B00C:
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	bl sub_808B030
	ldr r0, _0808B028 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808B02C @ =sub_808A720
_0808B01C:
	str r0, [r1, #8]
_0808B01E:
	bl sub_808AB08
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B028: .4byte gCurTask
_0808B02C: .4byte sub_808A720

	thumb_func_start sub_808B030
sub_808B030: @ 0x0808B030
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808B058 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	ldr r1, _0808B05C @ =IWRAM_START + 0x2D8
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r4, #5
	bls _0808B04E
	b _0808B178
_0808B04E:
	lsls r0, r4, #2
	ldr r1, _0808B060 @ =_0808B064
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B058: .4byte gCurTask
_0808B05C: .4byte IWRAM_START + 0x2D8
_0808B060: .4byte _0808B064
_0808B064: @ jump table
	.4byte _0808B07C @ case 0
	.4byte _0808B0A8 @ case 1
	.4byte _0808B0D4 @ case 2
	.4byte _0808B100 @ case 3
	.4byte _0808B12C @ case 4
	.4byte _0808B154 @ case 5
_0808B07C:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B0A0 @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B0A4 @ =0x000003CA
	b _0808B176
	.align 2, 0
_0808B0A0: .4byte 0x00000299
_0808B0A4: .4byte 0x000003CA
_0808B0A8:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B0CC @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B0D0 @ =0x000003CD
	b _0808B176
	.align 2, 0
_0808B0CC: .4byte 0x00000299
_0808B0D0: .4byte 0x000003CD
_0808B0D4:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	ldr r1, _0808B0FC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
	.align 2, 0
_0808B0FC: .4byte 0xFFFFFBFF
_0808B100:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	ldr r1, _0808B128 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
	.align 2, 0
_0808B128: .4byte 0xFFFFFBFF
_0808B12C:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
_0808B154:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B184 @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B188 @ =0x000003CB
_0808B176:
	strh r0, [r3, #0xa]
_0808B178:
	adds r0, r3, #0
	bl sub_8004558
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B184: .4byte 0x00000299
_0808B188: .4byte 0x000003CB

	thumb_func_start sub_808B18C
sub_808B18C: @ 0x0808B18C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808B1B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _0808B1B4 @ =IWRAM_START + 0x2D8
	adds r0, r5, r1
	ldr r3, [r0]
	ldr r1, _0808B1B8 @ =gUnknown_03000709
	adds r0, r5, r1
	ldrb r7, [r0]
	cmp r7, #0
	beq _0808B1BC
	cmp r7, #1
	beq _0808B1E4
	b _0808B2A0
	.align 2, 0
_0808B1B0: .4byte gCurTask
_0808B1B4: .4byte IWRAM_START + 0x2D8
_0808B1B8: .4byte gUnknown_03000709
_0808B1BC:
	ldrh r1, [r3, #0xa]
	ldr r0, _0808B1D8 @ =0x000003CB
	cmp r1, r0
	bne _0808B1DC
	adds r0, r3, #0
	bl sub_8004558
	cmp r0, #0
	bne _0808B2A0
	movs r0, #1
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B1D8: .4byte 0x000003CB
_0808B1DC:
	adds r0, r3, #0
	bl sub_8004558
	b _0808B2A0
_0808B1E4:
	ldr r0, _0808B21C @ =gUnknown_03000700
	adds r2, r5, r0
	adds r0, #4
	adds r1, r5, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	ldr r1, _0808B220 @ =gUnknown_030006FC
	adds r4, r5, r1
	strb r0, [r4]
	adds r0, r3, #0
	bl sub_8004558
	ldrb r0, [r4]
	cmp r0, #0x36
	bls _0808B228
	ldr r0, _0808B224 @ =gUnknown_0300070A
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808B228
	strb r7, [r1]
	movs r0, #3
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B21C: .4byte gUnknown_03000700
_0808B220: .4byte gUnknown_030006FC
_0808B224: .4byte gUnknown_0300070A
_0808B228:
	ldr r1, _0808B248 @ =0x000006FC
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0808B250
	ldr r0, _0808B24C @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808B250
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B248: .4byte 0x000006FC
_0808B24C: .4byte 0x0000070A
_0808B250:
	ldr r1, _0808B270 @ =0x000006FC
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x72
	bls _0808B278
	ldr r0, _0808B274 @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808B278
	movs r0, #3
	strb r0, [r1]
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B270: .4byte 0x000006FC
_0808B274: .4byte 0x0000070A
_0808B278:
	ldr r1, _0808B2A8 @ =0x000006FC
	adds r5, r6, r1
	ldrb r0, [r5]
	cmp r0, #0x77
	bls _0808B2A0
	ldr r0, _0808B2AC @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0808B2A0
	movs r4, #0
	strb r4, [r1]
	movs r0, #2
	bl sub_808B030
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r6, r1
	str r4, [r0]
	strb r4, [r5]
_0808B2A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2A8: .4byte 0x000006FC
_0808B2AC: .4byte 0x0000070A

	thumb_func_start sub_808B2B0
sub_808B2B0: @ 0x0808B2B0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0808B2C4 @ =0x00000784
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0808B2C4: .4byte 0x00000784

	thumb_func_start sub_808B2C8
sub_808B2C8: @ 0x0808B2C8
	push {lr}
	ldr r1, _0808B2E4 @ =gProfileScreenNextVramAddress
	ldr r0, _0808B2E8 @ =0x06010000
	str r0, [r1]
	ldr r1, _0808B2EC @ =gProfileScreenSubMenuNextVramAddress
	movs r0, #0
	str r0, [r1]
	ldr r0, _0808B2F0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0808B2E4: .4byte gProfileScreenNextVramAddress
_0808B2E8: .4byte 0x06010000
_0808B2EC: .4byte gProfileScreenSubMenuNextVramAddress
_0808B2F0: .4byte gCurTask

	thumb_func_start sub_808B2F4
sub_808B2F4: @ 0x0808B2F4
	push {lr}
	sub sp, #0x18
	ldrh r0, [r0, #6]
	ldr r2, _0808B338 @ =gDispCnt
	ldr r3, _0808B33C @ =0x00001141
	adds r1, r3, #0
	strh r1, [r2]
	ldr r3, _0808B340 @ =gBgCntRegs
	movs r2, #0
	ldr r1, _0808B344 @ =0x00000703
	strh r1, [r3]
	ldr r1, _0808B348 @ =gBgScrollRegs
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	ldr r1, _0808B34C @ =IWRAM_START + 0x48
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0xa9
	bl sub_806B854
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0808B338: .4byte gDispCnt
_0808B33C: .4byte 0x00001141
_0808B340: .4byte gBgCntRegs
_0808B344: .4byte 0x00000703
_0808B348: .4byte gBgScrollRegs
_0808B34C: .4byte IWRAM_START + 0x48

	thumb_func_start sub_808B350
sub_808B350: @ 0x0808B350
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _0808B394 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0
	ldr r2, _0808B398 @ =gUnknown_03000412
	adds r4, r0, r2
	lsrs r6, r1, #0x10
	ldr r1, _0808B39C @ =IWRAM_START + 0x3FC
	adds r5, r0, r1
_0808B370:
	strh r6, [r4]
	mov r2, r8
	strh r2, [r4, #2]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r6, #0xa
	adds r5, #0x30
	adds r7, #1
	cmp r7, #0xf
	bls _0808B370
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B394: .4byte gCurTask
_0808B398: .4byte gUnknown_03000412
_0808B39C: .4byte IWRAM_START + 0x3FC

	thumb_func_start sub_808B3A0
sub_808B3A0: @ 0x0808B3A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0808B3F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r6, #0
	ldr r1, _0808B3F4 @ =gUnknown_080E05E4
	mov r8, r1
	ldr r1, _0808B3F8 @ =gUnknown_0300041C
	adds r4, r0, r1
	subs r1, #0x20
	adds r5, r0, r1
_0808B3BE:
	lsls r0, r7, #4
	adds r0, r6, r0
	add r0, r8
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x20
	strb r0, [r4]
	movs r0, #0xff
	strb r0, [r4, #1]
	cmp r1, #0
	bne _0808B3D6
	strb r1, [r4]
_0808B3D6:
	adds r0, r5, #0
	bl sub_8004558
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #0xf
	bls _0808B3BE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3F0: .4byte gCurTask
_0808B3F4: .4byte gUnknown_080E05E4
_0808B3F8: .4byte gUnknown_0300041C
