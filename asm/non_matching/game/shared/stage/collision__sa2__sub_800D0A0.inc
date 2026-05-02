.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x2c]
	ldr r7, _08009920 @ =gPlayer
	ldrb r3, [r7, #0xe]
	adds r3, #5
	rsbs r0, r3, #0
	add r1, sp, #8
	mov sb, r1
	strb r0, [r1]
	ldrb r1, [r7, #0xf]
	movs r6, #1
	subs r2, r6, r1
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r1, #1
	adds r0, #1
	strb r1, [r0]
	add r0, sp, #4
	mov r1, sb
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0xe]
	rsbs r0, r3, #0
	add r2, sp, #0xc
	mov r8, r2
	strb r0, [r2]
	ldrb r2, [r7, #0xf]
	rsbs r1, r2, #0
	mov r0, sp
	adds r0, #0xd
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, sb
	mov r1, r8
	movs r2, #4
	bl memcpy
	movs r3, #0
	str r3, [sp, #0x30]
	movs r5, #0
	str r5, [sp, #0x34]
	ldr r0, _08009924 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x40]
	ldr r0, _08009928 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0xe]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _0800992C @ =0x03000058
	adds r4, r4, r0
	ldrb r0, [r4]
	subs r6, r6, r0
	mov r0, sp
	adds r0, #0x11
	strb r6, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r4]
	subs r0, #1
	mov r1, sp
	adds r1, #0x13
	strb r0, [r1]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0xe]
	rsbs r0, r3, #0
	add r1, sp, #0x14
	strb r0, [r1]
	ldrb r0, [r4]
	rsbs r0, r0, #0
	mov r2, sp
	adds r2, #0x15
	strb r0, [r2]
	mov r0, sp
	adds r0, #0x16
	strb r3, [r0]
	ldrb r2, [r4]
	adds r0, #1
	strb r2, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl memcpy
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, sb
	cmp r1, r0
	beq _08009918
	ldr r0, [r7, #0x10]
	movs r3, #0x80
	ands r0, r3
	cmp r0, #0
	bne _08009918
	ldr r6, [sp, #0x1c]
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7]
	asrs r1, r1, #8
	str r0, [sp, #0x44]
	cmp r2, r1
	bne _08009930
	ldr r0, [sp, #0x20]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bne _08009930
_08009918:
	movs r0, #0
	bl _0800A392
	.align 2, 0
_08009920: .4byte gPlayer
_08009924: .4byte gStageFlags
_08009928: .4byte gCurTask
_0800992C: .4byte 0x03000058
_08009930:
	ldr r0, _08009A18 @ =gPlayer
	ldr r1, [r0]
	str r1, [sp, #0x38]
	ldr r2, [r0, #4]
	str r2, [sp, #0x3c]
	adds r1, r0, #0
	adds r1, #0x27
	adds r4, r0, #0
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	cmp r3, r1
	beq _0800994C
	bl _0800A390
_0800994C:
	ldr r1, [r4, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800996A
	ldr r0, [r4, #0x28]
	ldr r6, [sp, #0x18]
	cmp r0, r6
	bne _0800996A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x10]
	movs r0, #1
	str r0, [sp, #0x34]
_0800996A:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	mov sb, r0
	ldr r2, [sp, #0x3c]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _0800997E
	b _08009E70
_0800997E:
	ldr r3, [sp, #0x44]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	ldr r6, [sp, #0x38]
	asrs r0, r6, #8
	mov r1, ip
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r1, r0, r6
	adds r7, r0, #0
	cmp r2, r1
	bgt _080099AC
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _080099BC
	cmp r2, r1
	bge _080099AC
	b _08009E70
_080099AC:
	mov r3, ip
	movs r0, #2
	ldrsb r0, [r3, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _080099BC
	b _08009E70
_080099BC:
	mov r6, sb
	asrs r0, r6, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, ip
	movs r6, #1
	ldrsb r6, [r0, r6]
	mov r0, r8
	adds r1, r0, r6
	cmp r2, r1
	bgt _080099E6
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _080099F6
	cmp r2, r1
	bge _080099E6
	b _08009E70
_080099E6:
	mov r3, ip
	movs r0, #3
	ldrsb r0, [r3, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _080099F6
	b _08009E70
_080099F6:
	ldr r6, [sp, #0x40]
	cmp r6, #0
	bne _08009A1C
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r8, r0
	ble _08009A06
	b _08009CBE
_08009A06:
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _08009A38
	b _08009CBE
	.align 2, 0
_08009A18: .4byte gPlayer
_08009A1C:
	mov r6, sb
	asrs r0, r6, #0x10
	cmp r8, r0
	bgt _08009A26
	b _08009CB8
_08009A26:
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r1, #0
	bge _08009A38
	b _08009CB8
_08009A38:
	ldr r3, [sp, #0x40]
	cmp r3, #0
	beq _08009A40
	b _08009B78
_08009A40:
	mov r6, sb
	asrs r0, r6, #0x10
	movs r1, #1
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, ip
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r6, _08009AF8 @ =gPlayer
	ldr r1, [r6, #4]
	ldr r2, _08009AFC @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x3c]
	adds r3, r3, r0
	str r3, [sp, #0x3c]
	asrs r0, r3, #8
	movs r1, #0xf
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _08009B00 @ =sa2__sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	ldr r2, [sp, #0x28]
	bl sa2__sub_801F100
	adds r7, r0, #0
	cmp r7, #0
	bge _08009B04
	ldr r1, [r6, #0x10]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _08009AAA
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #1
	beq _08009AD6
	cmp r0, #3
	beq _08009AD6
_08009AAA:
	cmp r2, #3
	bne _08009AC8
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08009AC8
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #0
	bne _08009AD6
_08009AC8:
	ldr r0, _08009AF8 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
	adds r4, r0, #0
_08009AD6:
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0
	strh r0, [r4, #0xa]
	lsls r1, r7, #8
	ldr r0, [r4, #4]
	subs r0, r0, r1
	str r0, [r4, #4]
	bl _0800A372
	.align 2, 0
_08009AF8: .4byte gPlayer
_08009AFC: .4byte 0xFFFFFF00
_08009B00: .4byte sa2__sub_801EC3C
_08009B04:
	movs r0, #8
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	ldr r1, [r6, #0x10]
	orrs r1, r0
	str r1, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _08009B30
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #1
	beq _08009B5C
	cmp r0, #3
	beq _08009B5C
_08009B30:
	cmp r2, #3
	bne _08009B4E
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08009B4E
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #0
	bne _08009B5C
_08009B4E:
	ldr r0, _08009B74 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
	adds r4, r0, #0
_08009B5C:
	ldr r6, [sp, #0x18]
	str r6, [r4, #0x28]
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #4]
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _08009B72
	bl _0800A378
_08009B72:
	b _08009CA4
	.align 2, 0
_08009B74: .4byte gPlayer
_08009B78:
	mov r2, sb
	asrs r0, r2, #0x10
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r3, ip
	movs r1, #3
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r6, _08009C2C @ =gPlayer
	ldr r1, [r6, #4]
	ldr r2, _08009C30 @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r5, [sp, #0x3c]
	adds r5, r5, r0
	str r5, [sp, #0x3c]
	asrs r0, r5, #8
	movs r1, #0xf
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, _08009C34 @ =sa2__sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sa2__sub_801F100
	adds r7, r0, #0
	cmp r7, #0
	bge _08009C38
	ldr r1, [r6, #0x10]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _08009BE0
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #1
	beq _08009C0C
	cmp r0, #3
	beq _08009C0C
_08009BE0:
	cmp r2, #3
	bne _08009BFE
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08009BFE
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #0
	bne _08009C0C
_08009BFE:
	ldr r0, _08009C2C @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
	adds r4, r0, #0
_08009C0C:
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0
	strh r0, [r4, #0xa]
	lsls r1, r7, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	b _0800A372
	.align 2, 0
_08009C2C: .4byte gPlayer
_08009C30: .4byte 0xFFFFFF00
_08009C34: .4byte sa2__sub_801EC3C
_08009C38:
	movs r0, #8
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	ldr r1, [r6, #0x10]
	orrs r1, r0
	str r1, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _08009C64
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #1
	beq _08009C90
	cmp r0, #3
	beq _08009C90
_08009C64:
	cmp r2, #3
	bne _08009C82
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08009C82
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r6, #0
	cmp r0, #0
	bne _08009C90
_08009C82:
	ldr r0, _08009CB4 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
	adds r4, r0, #0
_08009C90:
	ldr r2, [sp, #0x18]
	str r2, [r4, #0x28]
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r3, [sp, #0x3c]
	str r3, [r4, #4]
	ldr r5, [sp, #0x34]
	cmp r5, #0
	beq _08009CA4
	b _0800A378
_08009CA4:
	adds r0, r4, #0
	bl sa2__sub_8021BE0
	ldrh r0, [r4, #8]
	strh r0, [r4, #0xc]
	movs r0, #0
	strb r0, [r4, #0x14]
	b _0800A372
	.align 2, 0
_08009CB4: .4byte gPlayer
_08009CB8:
	ldr r6, [sp, #0x40]
	cmp r6, #0
	bne _08009CE0
_08009CBE:
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r8, r0
	ble _08009CD8
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	adds r5, r2, #0
	cmp r0, #0
	blt _08009CFE
_08009CD8:
	ldr r5, [sp, #0x40]
	cmp r5, #0
	bne _08009CE0
	b _08009E70
_08009CE0:
	mov r6, sb
	asrs r0, r6, #0x10
	cmp r8, r0
	ble _08009CEA
	b _08009E70
_08009CEA:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	adds r5, r2, #0
	cmp r0, #0
	blt _08009CFE
	b _08009E70
_08009CFE:
	ldr r6, [sp, #0x40]
	cmp r6, #0
	bne _08009DB0
	ldr r4, _08009D90 @ =gPlayer
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	add r0, r8
	ldr r1, _08009D94 @ =sa2__sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sa2__sub_801F100
	adds r7, r0, #0
	cmp r7, #0
	bge _08009D98
	ldr r1, [r4, #0x10]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _08009D46
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08009D6E
	cmp r0, #3
	beq _08009D6E
_08009D46:
	cmp r2, #3
	bne _08009D62
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08009D62
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08009D6E
_08009D62:
	ldr r0, _08009D90 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
_08009D6E:
	ldr r4, _08009D90 @ =gPlayer
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0
	strh r0, [r4, #0xa]
	lsls r1, r7, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	b _08009DA0
	.align 2, 0
_08009D90: .4byte gPlayer
_08009D94: .4byte sa2__sub_801EC3C
_08009D98:
	ldr r0, [sp, #0x38]
	str r0, [r4]
	ldr r1, [sp, #0x3c]
	str r1, [r4, #4]
_08009DA0:
	ldr r0, _08009DAC @ =gPlayer
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	asrs r2, r5, #0x10
	subs r1, r1, r2
	b _08009E5A
	.align 2, 0
_08009DAC: .4byte gPlayer
_08009DB0:
	ldr r4, _08009E40 @ =gPlayer
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	mov r6, r8
	subs r0, r6, r0
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _08009E44 @ =sa2__sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	ldr r2, [sp, #0x28]
	bl sa2__sub_801F100
	adds r7, r0, #0
	cmp r7, #0
	bge _08009E48
	ldr r1, [r4, #0x10]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _08009DF6
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08009E1E
	cmp r0, #3
	beq _08009E1E
_08009DF6:
	cmp r2, #3
	bne _08009E12
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08009E12
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08009E1E
_08009E12:
	ldr r0, _08009E40 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
_08009E1E:
	ldr r4, _08009E40 @ =gPlayer
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0
	strh r0, [r4, #0xa]
	lsls r1, r7, #8
	ldr r0, [r4, #4]
	subs r0, r0, r1
	str r0, [r4, #4]
	b _08009E50
	.align 2, 0
_08009E40: .4byte gPlayer
_08009E44: .4byte sa2__sub_801EC3C
_08009E48:
	ldr r0, [sp, #0x38]
	str r0, [r4]
	ldr r1, [sp, #0x3c]
	str r1, [r4, #4]
_08009E50:
	ldr r0, _08009E6C @ =gPlayer
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	asrs r2, r5, #0x10
	adds r1, r1, r2
_08009E5A:
	adds r4, r0, #0
	cmp r1, #0
	bgt _08009E70
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r3, [sp, #0x30]
	orrs r3, r0
	str r3, [sp, #0x30]
	b _0800A372
	.align 2, 0
_08009E6C: .4byte gPlayer
_08009E70:
	ldrb r0, [r4, #0x14]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08009E84
	b _0800A372
_08009E84:
	ldr r5, [sp, #0x44]
	asrs r0, r5, #0x10
	mov r6, sp
	movs r5, #0xc
	ldrsb r5, [r6, r5]
	adds r3, r0, r5
	ldr r0, [sp, #0x38]
	asrs r1, r0, #8
	add r0, sp, #4
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r2, r1, r6
	adds r7, r1, #0
	cmp r3, r2
	bgt _08009EB6
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r2
	bge _08009EC8
	cmp r3, r2
	bge _08009EB6
	b _0800A372
_08009EB6:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r2, r0
	cmp r0, r3
	bge _08009EC8
	b _0800A372
_08009EC8:
	mov r2, sb
	asrs r0, r2, #0x10
	mov r3, sp
	movs r2, #0xd
	ldrsb r2, [r3, r2]
	adds r1, r0, r2
	add r0, sp, #4
	movs r5, #1
	ldrsb r5, [r0, r5]
	mov r6, r8
	adds r3, r6, r5
	cmp r1, r3
	bgt _08009EF6
	mov r6, sp
	movs r0, #0xf
	ldrsb r0, [r6, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _08009F08
	cmp r1, r3
	bge _08009EF6
	b _0800A372
_08009EF6:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _08009F08
	b _0800A372
_08009F08:
	ldr r0, [sp, #0x44]
	asrs r1, r0, #0x10
	cmp r7, r1
	ble _08009F12
	b _0800A132
_08009F12:
	mov sb, r4
	ldr r3, [r4, #0x10]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _08009F20
	b _0800A0B8
_08009F20:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	adds r6, r4, #0
	adds r6, #0x3e
	movs r5, #0
	ldrsb r5, [r6, r5]
	cmp r5, #0
	beq _08009F3A
	strh r2, [r4, #8]
	b _0800A372
_08009F3A:
	mov r2, sp
	movs r0, #0xc
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [sp, #0x38]
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08009F5A
	rsbs r1, r1, #0
_08009F5A:
	movs r0, #0x90
	lsls r0, r0, #3
	cmp r1, r0
	ble _08009FCC
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	mov r2, sl
	lsls r0, r2, #0x10
	cmp r0, #0
	ble _08009FB4
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _08009FA2
	strh r2, [r4, #0xc]
	mov r0, sl
	strh r0, [r4, #8]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	strb r5, [r0]
	strb r5, [r6]
	b _0800A358
_08009FA2:
	mov r1, sl
	strh r1, [r4, #0xc]
	strh r1, [r4, #8]
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [r4]
	b _0800A366
_08009FB4:
	movs r0, #2
	orrs r3, r0
	str r3, [r4, #0x10]
	ldr r0, _08009FC8 @ =0x0000FE80
	strh r0, [r4, #8]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r4, #0xa]
	b _0800A372
	.align 2, 0
_08009FC8: .4byte 0x0000FE80
_08009FCC:
	movs r3, #8
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _08009FD6
	b _0800A372
_08009FD6:
	ldr r1, [sp, #0x38]
	asrs r0, r1, #8
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	mov r2, r8
	subs r1, r2, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _0800A060 @ =sa2__sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	bl sa2__sub_801F100
	adds r7, r0, #0
	cmp r7, #0
	bge _0800A068
	ldr r1, [r4, #0x10]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _0800A01C
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800A042
	cmp r0, #3
	beq _0800A042
_0800A01C:
	cmp r2, #3
	bne _0800A034
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0800A034
	movs r0, #0
	ldrsb r0, [r6, r0]
	mov r4, sb
	cmp r0, #0
	bne _0800A042
_0800A034:
	ldr r0, _0800A064 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
	adds r4, r0, #0
_0800A042:
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0
	strh r0, [r4, #8]
	lsls r1, r7, #8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	b _0800A372
	.align 2, 0
_0800A060: .4byte sa2__sub_801EB44
_0800A064: .4byte gPlayer
_0800A068:
	ldr r1, [r4, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800A09A
	movs r0, #0x20
	orrs r1, r0
	ldr r3, [sp, #0x30]
	orrs r3, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r4, #0x10]
	ands r3, r0
	str r3, [sp, #0x30]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	adds r1, r4, #0
	adds r1, #0x40
	strb r0, [r1]
_0800A09A:
	ldr r0, [r4, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r6, [sp, #0x30]
	ands r6, r1
	str r6, [sp, #0x30]
	strh r5, [r4, #0xc]
	strh r5, [r4, #8]
	ldr r0, [sp, #0x38]
	str r0, [r4]
	ldr r1, [sp, #0x3c]
	str r1, [r4, #4]
	b _0800A372
_0800A0B8:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	adds r6, r4, #0
	adds r6, #0x3e
	movs r5, #0
	ldrsb r5, [r6, r5]
	cmp r5, #0
	beq _0800A0D4
	movs r0, #0
	strh r0, [r4, #8]
	b _0800A372
_0800A0D4:
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800A0E2
	rsbs r2, r1, #0
_0800A0E2:
	movs r0, #0x90
	lsls r0, r0, #3
	cmp r2, r0
	bgt _0800A0EC
	b _0800A372
_0800A0EC:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	bge _0800A12C
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800A128
	mov r0, sl
	strh r0, [r4, #0xc]
	strh r0, [r4, #8]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	strb r5, [r0]
	strb r5, [r6]
	b _0800A358
_0800A128:
	adds r0, r4, #0
	b _0800A362
_0800A12C:
	strh r5, [r4, #0xc]
	strh r5, [r4, #8]
	b _0800A372
_0800A132:
	adds r5, r4, #0
	ldr r3, [r5, #0x10]
	movs r2, #1
	mov sb, r2
	adds r2, r3, #0
	mov r6, sb
	ands r2, r6
	cmp r2, #0
	bne _0800A146
	b _0800A2F0
_0800A146:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	ldr r0, _0800A160 @ =gPlayer + 0x3E
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800A164
	movs r0, #0
	strh r0, [r5, #8]
	b _0800A372
	.align 2, 0
_0800A160: .4byte gPlayer + 0x3E
_0800A164:
	mov r2, sp
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [sp, #0x38]
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _0800A184
	rsbs r1, r1, #0
_0800A184:
	movs r0, #0x90
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800A1FC
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	mov r2, sl
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800A1E8
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800A1D4
	strh r2, [r5, #0xc]
	mov r0, sl
	strh r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3d
	strb r6, [r0]
	ldr r1, _0800A1D0 @ =gPlayer + 0x3E
	strb r6, [r1]
	b _0800A358
	.align 2, 0
_0800A1D0: .4byte gPlayer + 0x3E
_0800A1D4:
	mov r2, sl
	strh r2, [r5, #0xc]
	strh r2, [r5, #8]
	ldr r0, [r5]
	ldr r3, _0800A1E4 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r5]
	b _0800A366
	.align 2, 0
_0800A1E4: .4byte 0xFFFFFF00
_0800A1E8:
	movs r0, #2
	orrs r3, r0
	str r3, [r5, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #8]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r5, #0xa]
	b _0800A372
_0800A1FC:
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0800A206
	b _0800A372
_0800A206:
	ldr r2, [sp, #0x38]
	asrs r0, r2, #8
	movs r1, #0xe
	ldrsb r1, [r5, r1]
	add r1, r8
	ldr r2, _0800A290 @ =sa2__sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sa2__sub_801F100
	adds r7, r0, #0
	cmp r7, #0
	bge _0800A29C
	ldr r1, [r5, #0x10]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x10]
	adds r0, r5, #0
	adds r0, #0x59
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #2
	bne _0800A24A
	subs r0, #0x1c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r5, #0
	cmp r0, #1
	beq _0800A272
	cmp r0, #3
	beq _0800A272
_0800A24A:
	cmp r2, #3
	bne _0800A264
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0800A264
	ldr r3, _0800A294 @ =gPlayer + 0x3E
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r4, r5, #0
	cmp r0, #0
	bne _0800A272
_0800A264:
	ldr r0, _0800A298 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x10]
	adds r4, r0, #0
_0800A272:
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0
	strh r0, [r4, #8]
	lsls r1, r7, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	b _0800A372
	.align 2, 0
_0800A290: .4byte sa2__sub_801EB44
_0800A294: .4byte gPlayer + 0x3E
_0800A298: .4byte gPlayer
_0800A29C:
	ldr r1, [r5, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800A2CE
	movs r0, #0x20
	orrs r1, r0
	ldr r2, [sp, #0x30]
	orrs r2, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r5, #0x10]
	ands r2, r0
	str r2, [sp, #0x30]
	adds r0, r5, #0
	adds r0, #0x40
	movs r4, #0xe
	strb r4, [r0]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	strb r4, [r5, #0xf]
_0800A2CE:
	ldr r0, [r5, #0x10]
	mov r3, sb
	orrs r0, r3
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x30]
	orrs r0, r3
	str r0, [sp, #0x30]
	strh r6, [r5, #0xc]
	strh r6, [r5, #8]
	ldr r1, [sp, #0x38]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	str r0, [r5]
	ldr r3, [sp, #0x3c]
	str r3, [r5, #4]
	b _0800A372
_0800A2F0:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r5, #0x10]
	adds r7, r5, #0
	adds r7, #0x3e
	movs r6, #0
	ldrsb r6, [r7, r6]
	cmp r6, #0
	beq _0800A308
	strh r2, [r5, #8]
	b _0800A372
_0800A308:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800A316
	rsbs r2, r1, #0
_0800A316:
	movs r0, #0x90
	lsls r0, r0, #3
	cmp r2, r0
	ble _0800A372
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	ble _0800A36E
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800A360
	mov r0, sl
	strh r0, [r5, #0xc]
	strh r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3d
	strb r6, [r0]
	strb r6, [r7]
_0800A358:
	movs r0, #0xa1
	bl m4aSongNumStart
	b _0800A372
_0800A360:
	adds r0, r5, #0
_0800A362:
	bl sa2__sub_800DE44
_0800A366:
	movs r0, #0xa2
	bl m4aSongNumStart
	b _0800A372
_0800A36E:
	strh r6, [r4, #0xc]
	strh r6, [r4, #8]
_0800A372:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800A390
_0800A378:
	ldr r2, _0800A3A4 @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800A390
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x10]
_0800A390:
	ldr r0, [sp, #0x30]
_0800A392:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A3A4: .4byte gPlayer

.syntax divided
