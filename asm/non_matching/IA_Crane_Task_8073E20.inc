
.syntax unified
.text
	push {r4, r5, r6, lr}
	ldr r0, _08073E88 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]       @ r4 = task-offset
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0         @ r5 = crane
	adds r0, r5, #0
	bl sub_8074260
	adds r0, r5, #0
	bl sub_807447C
	ldr r0, _08073E8C @ =IWRAM_START + 0x1C0
	adds r3, r4, r0     @ r3 = &crane->unk1B8.unk8
	ldr r0, [r3]
	cmp r0, #0
	bne _08073E46
	b _08073FFC
_08073E46:
	ldr r1, _08073E90 @ =IWRAM_START + 0x1BE
	adds r0, r4, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08073E9C
	adds r1, #4
	adds r0, r4, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r6, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r3, r0, #0
	subs r0, r6, r3
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	ble _08073E74
	ldr r2, _08073E94 @ =0x0000FFE0
_08073E74:
	subs r0, r3, r6
	asrs r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, _08073E98 @ =IWRAM_START + 0xF0
	adds r1, r4, r3
	strh r0, [r1]
	b _08073F56
	.align 2, 0
_08073E88: .4byte gCurTask
_08073E8C: .4byte IWRAM_START + 0x1C0
_08073E90: .4byte IWRAM_START + 0x1BE
_08073E94: .4byte 0x0000FFE0
_08073E98: .4byte IWRAM_START + 0xF0
_08073E9C:
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08073ECC
	ldr r2, _08073EB8 @ =IWRAM_START + 0x1C2
	adds r0, r4, r2
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	ble _08073EBC
	cmp r1, #0x20
	bgt _08073F54
	b _08073EC4
	.align 2, 0
_08073EB8: .4byte IWRAM_START + 0x1C2
_08073EBC:
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08073F04
_08073EC4:
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08073F56
_08073ECC:
	cmp r0, #0
	ble _08073F0C
__08073ED0:
	ldr r0, _08073EE8 @ =IWRAM_START + 0x1C2
	adds r2, r4, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08073EEC
	movs r4, #0
	ldrsh r0, [r3, r4]
	movs r3, #0
	ldrsh r1, [r2, r3]
	b _08073EF8
	.align 2, 0
_08073EE8: .4byte IWRAM_START + 0x1C2
_08073EEC:
	ldr r1, _08073F08 @ =IWRAM_START + 0x1BC
	adds r0, r4, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r4, #0
	ldrsh r0, [r2, r4]
_08073EF8:
	subs r0, r0, r1
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #31
	bgt _08073F56
_08073F04:
	movs r2, #0x20
	b _08073F56
	.align 2, 0
_08073F08: .4byte IWRAM_START + 0x1BC
_08073F0C:
	ldr r0, _08073F34 @ =IWRAM_START + 0x1C2
	adds r1, r4, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08073F3C
	ldr r2, _08073F38 @ =IWRAM_START + 0x1BC
	adds r1, r4, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	ble _08073F56
	b _08073F54
	.align 2, 0
_08073F34: .4byte IWRAM_START + 0x1C2
_08073F38: .4byte IWRAM_START + 0x1BC
_08073F3C:
	movs r4, #0
	ldrsh r0, [r1, r4]
	movs r2, #0
	ldrsh r1, [r3, r2]
	subs r1, r1, r0
	lsls r1, r1, #0xc
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08073F56
_08073F54:
	ldr r2, _08073FC8 @ =0x0000FFE0
_08073F56:
	movs r4, #0xe1
	lsls r4, r4, #1
	adds r3, r5, r4         @ r3 = &crane->unk1B8.unkA
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r3]
	adds r1, r0, r2
	strh r1, [r3]

	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r5, r3         @ r3 = &crane->unk1B8.unk8
	movs r4, #0
	ldrsh r2, [r0, r4]      @ r2 = crane->unk1B8.unk8
	cmp r2, #0
	ble _08073F7C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	ble _08073F88
_08073F7C:
	cmp r2, #0
	bge _08073FDA
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	blt _08073FDA
_08073F88:
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r2, r5, r0         @ r2 = &crane->unk1B8.unk8
	ldrh r1, [r2]
	movs r4, #0xe1
	lsls r4, r4, #1
	adds r3, r5, r4         @ r3 = &crane->unk1B8.unkA
	strh r1, [r3]
	subs r4, #6
	adds r0, r5, r4         @ r0 = &crane->unk1B8.unk4
	strh r1, [r0]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	rsbs r0, r0, #0
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08073FCC
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08073FBE
	rsbs r0, r0, #0
_08073FBE:
	cmp r0, #0x80
	bgt _08073FCE
	movs r0, #0
	strh r0, [r2]
	b _08073FCE
	.align 2, 0
_08073FC8: .4byte 0x0000FFE0
_08073FCC:
	strh r0, [r3]
_08073FCE:
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08073FDA:
	movs r3, #0xe1
	lsls r3, r3, #1
	adds r0, r5, r3         @ r0 = &crane->unk1B8.unkA
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	ldrh r4, [r5, #0x30]
	adds r0, r0, r4
	ldr r1, _08074058 @ =0x000003FF
	ands r0, r1
	strh r0, [r5, #0x30]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08074004
_08073FFC:
	ldr r0, _0807405C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074060 @ =Task_8073AA8
	str r0, [r1, #8]
_08074004:
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	bge _08074014
	rsbs r1, r1, #0
_08074014:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08074064
	adds r0, r5, #0
	bl sub_807432C
	cmp r0, #0
	beq _08074032
	adds r0, r5, #0
	bl sub_807447C
	adds r0, r5, #0
	bl sub_8074088
_08074032:
	adds r0, r5, #0
	bl sub_80745B4
	cmp r0, #0
	beq _08074064
	movs r4, #0xe2
	lsls r4, r4, #1
	adds r0, r5, r4         @ r0 = crane->ia
	ldr r1, [r0]
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807405C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08074082
	.align 2, 0
_08074058: .4byte 0x000003FF
_0807405C: .4byte gCurTask
_08074060: .4byte Task_8073AA8
_08074064:
	adds r0, r5, #0
	bl sub_80741B4
	adds r0, r5, #0
	bl sub_80745B4
	cmp r0, #0
	beq _0807407C
	adds r0, r5, #0
	bl sub_8074604
	b _08074082
_0807407C:
	adds r0, r5, #0
	bl sub_80742A8
_08074082:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

.syntax divided
