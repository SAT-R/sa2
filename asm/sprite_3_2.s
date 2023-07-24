.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start DrawToOamBuffer
DrawToOamBuffer: @ 0x0800594C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r5, _080059FC @ =gOamBuffer
	movs r0, #0
	mov sb, r0
	movs r3, #0
	ldr r1, _08005A00 @ =gUnknown_03002AE0
	mov sl, r1
	mov r2, sp
	adds r2, #8
	str r2, [sp, #0xc]
_0800596A:
	ldr r1, _08005A04 @ =gUnknown_03001850
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	adds r6, r3, #1
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080059B2
	ldr r4, _08005A08 @ =0x040000D4
	mov r8, r1
	ldr r0, _08005A0C @ =gUnknown_03002710
	mov ip, r0
	ldr r7, _08005A10 @ =gUnknown_030022D0
_08005988:
	asrs r2, r2, #0x18
	lsls r3, r2, #3
	adds r3, r3, r7
	str r3, [r4]
	str r5, [r4, #4]
	ldr r0, _08005A14 @ =0x80000003
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, #8
	add r2, ip
	mov r1, sb
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	strb r1, [r2]
	ldrb r0, [r3, #6]
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	cmp r0, r8
	bne _08005988
_080059B2:
	adds r3, r6, #0
	cmp r3, #0x1f
	ble _0800596A
	ldr r2, _08005A18 @ =gFlags
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08005A24
	ldr r0, _08005A1C @ =gUnknown_030018F0
	ldrb r3, [r0]
	lsls r0, r3, #3
	ldr r1, _080059FC @ =gOamBuffer
	adds r5, r0, r1
	mov r2, sl
	ldrb r0, [r2]
	cmp r3, r0
	bge _08005AB0
	mov r4, sp
	movs r1, #0x80
	lsls r1, r1, #2
	adds r7, r1, #0
	ldr r1, _08005A08 @ =0x040000D4
	ldr r6, _08005A20 @ =0x81000003
_080059E4:
	strh r7, [r4]
	mov r0, sp
	str r0, [r1]
	str r5, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r5, #8
	adds r3, #1
	ldrb r0, [r2]
	cmp r3, r0
	blt _080059E4
	b _08005AB0
	.align 2, 0
_080059FC: .4byte gOamBuffer
_08005A00: .4byte gUnknown_03002AE0
_08005A04: .4byte gUnknown_03001850
_08005A08: .4byte 0x040000D4
_08005A0C: .4byte gUnknown_03002710
_08005A10: .4byte gUnknown_030022D0
_08005A14: .4byte 0x80000003
_08005A18: .4byte gFlags
_08005A1C: .4byte gUnknown_030018F0
_08005A20: .4byte 0x81000003
_08005A24:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08005AAC
	ldr r1, _08005A98 @ =gUnknown_030018F0
	ldrb r0, [r1]
	subs r3, r0, #1
	lsls r0, r3, #3
	ldr r2, _08005A9C @ =gOamBuffer
	adds r5, r0, r2
	cmp r3, #0
	blt _08005A5E
	ldr r2, _08005AA0 @ =0x040000D4
	ldr r6, _08005AA4 @ =0x80000003
	ldr r0, _08005A9C @ =gOamBuffer
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r1, r5, #0
_08005A4C:
	str r1, [r2]
	str r4, [r2, #4]
	str r6, [r2, #8]
	ldr r0, [r2, #8]
	subs r1, #8
	subs r3, #1
	subs r4, #8
	cmp r3, #0
	bge _08005A4C
_08005A5E:
	ldr r2, _08005A98 @ =gUnknown_030018F0
	ldrb r1, [r2]
	movs r0, #0x80
	subs r0, r0, r1
	mov r1, sl
	strb r0, [r1]
	movs r3, #0
	ldrb r0, [r1]
	cmp r3, r0
	bge _08005AB0
	mov r5, sp
	movs r2, #0x80
	lsls r2, r2, #2
	adds r7, r2, #0
	ldr r1, _08005AA0 @ =0x040000D4
	adds r4, r0, #0
	ldr r6, _08005AA8 @ =0x81000003
	ldr r2, _08005A9C @ =gOamBuffer
_08005A82:
	strh r7, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, #8
	adds r3, #1
	cmp r3, r4
	blt _08005A82
	b _08005AB0
	.align 2, 0
_08005A98: .4byte gUnknown_030018F0
_08005A9C: .4byte gOamBuffer
_08005AA0: .4byte 0x040000D4
_08005AA4: .4byte 0x80000003
_08005AA8: .4byte 0x81000003
_08005AAC:
	mov r1, sl
	strb r0, [r1]
_08005AB0:
	movs r0, #0
	ldr r2, _08005AE4 @ =gUnknown_030018F0
	strb r0, [r2]
	ldr r1, _08005AE8 @ =gFlags
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08005AF8
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r5, _08005AEC @ =0x05000008
	ldr r1, _08005AF0 @ =gUnknown_03001850
	adds r2, r5, #0
	bl CpuSet
	str r4, [sp, #8]
	ldr r1, _08005AF4 @ =gUnknown_03004D60
	ldr r0, [sp, #0xc]
	adds r2, r5, #0
	bl CpuSet
	b _08005B1C
	.align 2, 0
_08005AE4: .4byte gUnknown_030018F0
_08005AE8: .4byte gFlags
_08005AEC: .4byte 0x05000008
_08005AF0: .4byte gUnknown_03001850
_08005AF4: .4byte gUnknown_03004D60
_08005AF8:
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #8]
	ldr r0, _08005B2C @ =0x040000D4
	ldr r2, [sp, #0xc]
	str r2, [r0]
	ldr r2, _08005B30 @ =gUnknown_03001850
	str r2, [r0, #4]
	ldr r2, _08005B34 @ =0x85000008
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	str r1, [sp, #8]
	ldr r1, [sp, #0xc]
	str r1, [r0]
	ldr r1, _08005B38 @ =gUnknown_03004D60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08005B1C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005B2C: .4byte 0x040000D4
_08005B30: .4byte gUnknown_03001850
_08005B34: .4byte 0x85000008
_08005B38: .4byte gUnknown_03004D60
