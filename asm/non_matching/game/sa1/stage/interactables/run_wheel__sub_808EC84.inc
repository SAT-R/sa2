.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x2c]
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	bne _0808ECAA
	b _0808F084
_0808ECAA:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808ECB6
	b _0808F084
_0808ECB6:
	bl sub_80549FC
	adds r3, r0, #0
	cmp r3, #0
	beq _0808ED4C
	movs r0, #0x4e
	add r0, sl
	mov sb, r0
	ldrb r0, [r0]
	lsls r0, r0, #7
	ldr r1, _0808ED40 @ =0x000003FF
	mov r8, r1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r3, _0808ED44 @ =gSineTable
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	ldr r5, _0808ED48 @ =0x00001770
	adds r1, r5, #0
	bl Div
	adds r4, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x40]
	movs r6, #0xc8
	lsls r6, r6, #4
	adds r1, r6, #0
	bl Div
	muls r4, r0, r4
	ldr r0, [sp, #4]
	adds r4, r0, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #7
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	ldr r3, _0808ED44 @ =gSineTable
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r5, #0
	bl Div
	adds r5, r0, #0
	mov r2, sl
	ldr r0, [r2, #0x40]
	adds r1, r6, #0
	bl Div
	adds r2, r5, #0
	muls r2, r0, r2
	ldr r3, [sp, #8]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, [sp]
	adds r1, r4, #0
	adds r3, r7, #0
	bl Coll_Player_Platform
	b _0808F0A0
	.align 2, 0
_0808ED40: .4byte 0x000003FF
_0808ED44: .4byte gSineTable
_0808ED48: .4byte 0x00001770
_0808ED4C:
	ldr r2, [r7, #0x10]
	movs r5, #8
	adds r0, r2, #0
	ands r0, r5
	cmp r0, #0
	bne _0808ED5A
	b _0808F0A0
_0808ED5A:
	ldr r0, [r7, #0x28]
	ldr r4, [sp]
	cmp r0, r4
	beq _0808ED64
	b _0808F0A0
_0808ED64:
	movs r6, #0x18
	ldrsh r0, [r4, r6]
	ldr r4, _0808EDE4 @ =gCamera
	movs r6, #2
	ldrsh r1, [r4, r6]
	adds r0, r0, r1
	ldr r1, [sp]
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0xf
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [r7, #4]
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	bne _0808ED9C
	adds r0, r7, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808EE5C
_0808ED9C:
	mov r0, sl
	adds r0, #0x4c
	strh r3, [r0]
	cmp r1, #0
	beq _0808EDFE
	str r3, [r7, #0x28]
	movs r1, #9
	rsbs r1, r1, #0
	ands r1, r2
	str r1, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0808EDC8
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	bne _0808EDEC
_0808EDC8:
	ldrh r1, [r7, #8]
	movs r0, #8
	ldrsh r2, [r7, r0]
	ldr r0, _0808EDE8 @ =0xFFFFFEE0
	cmp r2, r0
	blt _0808EDE0
	adds r0, r1, #0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r2, r1
	ble _0808EDE0
	adds r0, r1, #0
_0808EDE0:
	strh r0, [r7, #8]
	b _0808EDF0
	.align 2, 0
_0808EDE4: .4byte gCamera
_0808EDE8: .4byte 0xFFFFFEE0
_0808EDEC:
	mov r1, sl
	str r3, [r1, #0x44]
_0808EDF0:
	adds r2, r7, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	b _0808EE9C
_0808EDFE:
	ldrh r1, [r4]
	ldr r2, [sp]
	ldrh r2, [r2, #0x16]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldr r3, [sp]
	ldrh r3, [r3, #0x18]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, [sp]
	adds r3, r7, #0
	bl Coll_Player_Platform
	ands r0, r5
	cmp r0, #0
	beq _0808EE9C
	ldr r0, [r7, #0x10]
	orrs r0, r5
	str r0, [r7, #0x10]
	ldr r4, [sp]
	str r4, [r7, #0x28]
	ldrh r1, [r7, #0xc]
	movs r6, #0xc
	ldrsh r2, [r7, r6]
	ldr r0, _0808EE58 @ =0xFFFFFDC0
	cmp r2, r0
	blt _0808EE46
	adds r0, r1, #0
	movs r1, #0x90
	lsls r1, r1, #2
	cmp r2, r1
	ble _0808EE46
	adds r0, r1, #0
_0808EE46:
	strh r0, [r7, #0xc]
	adds r2, r7, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	b _0808EE9C
	.align 2, 0
_0808EE58: .4byte 0xFFFFFDC0
_0808EE5C:
	ldr r2, _0808EEC8 @ =gSineTable
	mov r0, sl
	adds r0, #0x4e
	ldrb r0, [r0]
	lsls r0, r0, #7
	ldr r1, _0808EECC @ =0x000003FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r1, _0808EED0 @ =0x00001770
	bl Div
	adds r4, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x40]
	movs r1, #0xc8
	lsls r1, r1, #4
	bl Div
	muls r0, r4, r0
	ldr r4, [sp, #4]
	adds r0, r4, r0
	lsls r0, r0, #8
	movs r6, #8
	ldrsh r1, [r7, r6]
	subs r0, r0, r1
	str r0, [r7]
_0808EE9C:
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808EEAC
	b _0808F076
_0808EEAC:
	mov r1, sl
	ldr r0, [r1, #0x44]
	movs r1, #0x1c
	bl Div
	cmp r0, #0
	bge _0808EED4
	mov r2, sl
	ldr r0, [r2, #0x44]
	movs r1, #0x1c
	bl Div
	rsbs r0, r0, #0
	b _0808EEDE
	.align 2, 0
_0808EEC8: .4byte gSineTable
_0808EECC: .4byte 0x000003FF
_0808EED0: .4byte 0x00001770
_0808EED4:
	mov r3, sl
	ldr r0, [r3, #0x44]
	movs r1, #0x1c
	bl Div
_0808EEDE:
	ldr r1, [sp]
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x59
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r1, #3
	bne _0808EEFE
	subs r0, #0x19
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _0808EF0A
_0808EEFE:
	movs r4, #0xc
	ldrsh r0, [r7, r4]
	subs r0, #0x10
	mov r6, sl
	str r0, [r6, #0x44]
	b _0808EF12
_0808EF0A:
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	mov r2, sl
	str r0, [r2, #0x44]
_0808EF12:
	mov r4, sl
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _0808EF1E
	lsls r0, r0, #1
	str r0, [r4, #0x44]
_0808EF1E:
	mov r6, sl
	ldr r0, [r6, #0x44]
	movs r1, #0xb2
	lsls r1, r1, #4
	cmp r0, r1
	ble _0808EF2C
	str r1, [r6, #0x44]
_0808EF2C:
	mov r1, sl
	ldr r0, [r1, #0x40]
	ldr r2, [r1, #0x44]
	adds r0, r0, r2
	str r0, [r1, #0x40]
	ldr r1, [r1, #0x3c]
	cmp r0, r1
	ble _0808EF48
	mov r4, sl
	str r1, [r4, #0x40]
	cmp r2, #0
	bge _0808EF76
	movs r0, #0
	str r0, [r4, #0x44]
_0808EF48:
	mov r6, sl
	ldr r0, [r6, #0x44]
	cmp r0, #0
	bge _0808EF76
	ldrh r1, [r7, #0xc]
	movs r2, #0xc
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bgt _0808EF76
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0808EF70
	adds r0, r7, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _0808EF76
_0808EF70:
	adds r0, r1, #0
	subs r0, #0x40
	strh r0, [r7, #0xc]
_0808EF76:
	ldrh r1, [r7, #0xc]
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	ldr r0, _0808EFE0 @ =0xFFFFF700
	cmp r2, r0
	blt _0808EF8A
	movs r0, #0x90
	lsls r0, r0, #3
	cmp r2, r0
	ble _0808EF8C
_0808EF8A:
	adds r1, r0, #0
_0808EF8C:
	movs r2, #0
	strh r1, [r7, #0xc]
	mov r4, sl
	ldr r0, [r4, #0x40]
	cmp r0, #0
	bge _0808EFC0
	str r2, [r4, #0x40]
	str r2, [r4, #0x44]
	adds r0, r7, #0
	adds r0, #0x3e
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bne _0808EFB0
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808EFB0
	strh r2, [r7, #0xc]
_0808EFB0:
	ldr r1, [sp]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [sp]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_0808EFC0:
	mov r6, sl
	ldr r0, [r6, #0x44]
	cmp r0, #0
	blt _0808EFE4
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bgt _0808EFFC
	ldr r1, [sp]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [sp]
	adds r1, #0x20
	movs r0, #1
	b _0808EFFA
	.align 2, 0
_0808EFE0: .4byte 0xFFFFF700
_0808EFE4:
	mov r1, sl
	ldr r0, [r1, #0x48]
	cmp r0, #0
	blt _0808EFFC
	ldr r1, [sp]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [sp]
	adds r1, #0x20
	movs r0, #0
_0808EFFA:
	strb r0, [r1]
_0808EFFC:
	mov r3, sl
	adds r3, #0x4c
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	mov r4, sl
	ldr r2, [r4, #0x44]
	ldr r6, _0808F02C @ =0x000004FF
	adds r1, r2, r6
	ldr r0, _0808F030 @ =0x000009FE
	cmp r1, r0
	bhi _0808F034
	cmp r2, #0
	beq _0808F06E
	ldrh r0, [r3]
	movs r1, #0x19
	bl Mod
	cmp r0, #0
	bne _0808F06E
	movs r0, #0xd4
	bl m4aSongNumStart
	b _0808F06E
	.align 2, 0
_0808F02C: .4byte 0x000004FF
_0808F030: .4byte 0x000009FE
_0808F034:
	ldr r0, _0808F054 @ =0x0000081F
	adds r1, r2, r0
	ldr r0, _0808F058 @ =0x0000103E
	cmp r1, r0
	bhi _0808F05C
	ldrh r0, [r3]
	movs r1, #0x10
	bl Mod
	cmp r0, #0
	bne _0808F06E
	movs r0, #0xd5
	bl m4aSongNumStart
	b _0808F06E
	.align 2, 0
_0808F054: .4byte 0x0000081F
_0808F058: .4byte 0x0000103E
_0808F05C:
	ldrh r0, [r3]
	movs r1, #8
	bl Mod
	cmp r0, #0
	bne _0808F06E
	movs r0, #0xd6
	bl m4aSongNumStart
_0808F06E:
	mov r1, sl
	ldr r0, [r1, #0x44]
	str r0, [r1, #0x48]
	b _0808F0A0
_0808F076:
	mov r2, sl
	ldr r0, [r2, #0x44]
	cmp r0, #0
	ble _0808F080
	asrs r0, r0, #1
_0808F080:
	strh r0, [r7, #0xc]
	b _0808F0A0
_0808F084:
	ldr r1, [r7, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808F0A0
	ldr r0, [r7, #0x28]
	ldr r3, [sp]
	cmp r0, r3
	bne _0808F0A0
	movs r0, #0
	str r0, [r7, #0x28]
	subs r0, #9
	ands r1, r0
	str r1, [r7, #0x10]
_0808F0A0:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
