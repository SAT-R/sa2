.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08067CAC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	mov r1, sb
	ldr r0, [r1, #0x38]
	adds r2, r0, #1
	str r2, [sp, #0x10]
	subs r0, #0xb3
	cmp r0, #0x80
	bhi _08067D28
	lsrs r7, r0, #4
	movs r0, #2
	mov r8, r0
	movs r1, #0x1f
	mov ip, r1
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sl, r2
_08067C64:
	mov r0, r8
	lsls r2, r0, #1
	ldr r1, _08067CB0 @ =gUiPaletteSoundTestBox3
	adds r0, r2, r1
	ldrh r1, [r0]
	movs r3, #0x1f
	ands r3, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r5, r0, #5
	mov r0, sl
	ands r0, r1
	lsrs r4, r0, #0xa
	ldr r0, _08067CB4 @ =gUiPaletteSoundTestBox4
	adds r2, r2, r0
	ldrh r1, [r2]
	movs r2, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r6, r0, #5
	mov r0, sl
	ands r0, r1
	lsrs r1, r0, #0xa
	cmp r3, r2
	bls _08067CB8
	subs r0, r3, r2
	muls r0, r7, r0
	lsrs r0, r0, #3
	subs r3, r3, r0
	mov r2, ip
	ands r3, r2
	b _08067CC4
	.align 2, 0
_08067CAC: .4byte gCurTask
_08067CB0: .4byte gUiPaletteSoundTestBox3
_08067CB4: .4byte gUiPaletteSoundTestBox4
_08067CB8:
	subs r0, r2, r3
	muls r0, r7, r0
	lsrs r0, r0, #3
	adds r3, r3, r0
	mov r0, ip
	ands r3, r0
_08067CC4:
	cmp r5, r6
	bls _08067CD2
	subs r0, r5, r6
	muls r0, r7, r0
	lsrs r0, r0, #3
	subs r0, r5, r0
	b _08067CDA
_08067CD2:
	subs r0, r6, r5
	muls r0, r7, r0
	lsrs r0, r0, #3
	adds r0, r5, r0
_08067CDA:
	mov r2, ip
	ands r0, r2
	lsls r5, r0, #5
	cmp r4, r1
	bls _08067CF2
	subs r0, r4, r1
	muls r0, r7, r0
	lsrs r0, r0, #3
	subs r0, r4, r0
	mov r1, ip
	ands r0, r1
	b _08067CFE
_08067CF2:
	subs r0, r1, r4
	muls r0, r7, r0
	lsrs r0, r0, #3
	adds r0, r4, r0
	mov r2, ip
	ands r0, r2
_08067CFE:
	lsls r4, r0, #0xa
	orrs r3, r5
	orrs r4, r3
	mov r0, r8
	adds r0, #0xe0
	lsls r0, r0, #1
	ldr r1, _08067D88 @ =gObjPalette
	adds r0, r0, r1
	strh r4, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0xf
	bls _08067C64
	ldr r2, _08067D8C @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_08067D28:
	movs r0, #0xc8
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	cmp r1, r0
	bhi _08067D34
	b _08067E32
_08067D34:
	movs r2, #0
	str r2, [sp, #0x10]
	mov r8, r2
	mov r7, sb
	adds r7, #0x2c
	movs r4, #0
	ldr r6, _08067D90 @ =0x00000311
_08067D42:
	str r4, [sp]
	ldr r0, _08067D94 @ =Task_8066D64
	movs r1, #0xb2
	lsls r1, r1, #1
	ldr r2, _08067D98 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	mov r1, r8
	lsls r2, r1, #2
	mov r1, sp
	adds r1, r1, r2
	adds r1, #4
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	strh r4, [r3, #0x3c]
	movs r0, #0xf
	str r0, [r3, #0x4c]
	str r4, [r3, #0x48]
	mov r0, r8
	str r0, [r3, #0x44]
	str r4, [r3, #0x40]
	adds r5, r2, #0
	cmp r0, #0
	bne _08067DA4
	ldr r0, _08067D9C @ =0x06016060
	str r0, [r3, #4]
	strh r6, [r3, #0xa]
	ldr r2, _08067DA0 @ =0x03000020
	adds r0, r1, r2
	strb r4, [r0]
	b _08067DD2
	.align 2, 0
_08067D88: .4byte gObjPalette
_08067D8C: .4byte gFlags
_08067D90: .4byte 0x00000311
_08067D94: .4byte Task_8066D64
_08067D98: .4byte 0x00002120
_08067D9C: .4byte 0x06016060
_08067DA0: .4byte 0x03000020
_08067DA4:
	mov r0, r8
	cmp r0, #1
	bne _08067DC4
	ldr r0, _08067DBC @ =0x06016920
	str r0, [r3, #4]
	strh r6, [r3, #0xa]
	ldr r2, _08067DC0 @ =0x03000020
	adds r0, r1, r2
	mov r1, r8
	strb r1, [r0]
	b _08067DD2
	.align 2, 0
_08067DBC: .4byte 0x06016920
_08067DC0: .4byte 0x03000020
_08067DC4:
	ldr r0, _08067E54 @ =0x06016E20
	str r0, [r3, #4]
	strh r6, [r3, #0xa]
	ldr r2, _08067E58 @ =0x03000020
	adds r1, r1, r2
	movs r0, #2
	strb r0, [r1]
_08067DD2:
	movs r0, #0xb4
	strh r0, [r3, #0x16]
	movs r0, #0x50
	strh r0, [r3, #0x18]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r3, #0x10]
	adds r0, r3, #0
	bl UpdateSpriteAnimation
	adds r1, r7, r5
	mov r0, sp
	adds r0, r0, r5
	adds r0, #4
	ldr r0, [r0]
	str r0, [r1]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #2
	bls _08067D42
	mov r0, sb
	ldr r1, [r0, #0xc]
	ldr r0, _08067E5C @ =Task_8068004
	str r0, [r1, #8]
	ldr r0, _08067E60 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08067E64 @ =Task_8067E68
	str r0, [r1, #8]
_08067E32:
	mov r0, sb
	bl sub_805423C
	ldr r1, [sp, #0x10]
	mov r2, sb
	str r1, [r2, #0x38]
	ldr r0, [sp, #0x14]
	str r1, [r0, #0x3c]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067E54: .4byte 0x06016E20
_08067E58: .4byte 0x03000020
_08067E5C: .4byte Task_8068004
_08067E60: .4byte gCurTask
_08067E64: .4byte Task_8067E68
.syntax divided
