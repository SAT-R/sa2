.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

	thumb_func_start sub_8017670
sub_8017670: @ 0x08017670
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r2, _08017718 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov sl, r0
	ldr r0, _0801771C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov sb, r7
	ldr r1, [r2, #0x20]
	lsrs r0, r1, #5
	str r0, [sp, #0x14]
	movs r0, #1
	ldr r3, [sp, #0x14]
	ands r3, r0
	str r3, [sp, #0x14]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080176B6
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _080176B6
	bl sub_8017F34
_080176B6:
	ldr r0, _08017720 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r0
	cmp r0, #4
	bne _080176F2
	ldr r0, _08017724 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x56
	ldrb r0, [r5]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017728 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	str r5, [sp, #0x20]
	cmp r1, r3
	beq _0801772C
_080176F2:
	bl sub_8018300
	cmp r0, #0
	bne _080176FC
	b _08017C18
_080176FC:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017708
	b _08017C18
_08017708:
	ldr r2, _08017718 @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08017C18
	.align 2, 0
_08017718: .4byte gPlayer
_0801771C: .4byte gCurTask
_08017720: .4byte gGameMode
_08017724: .4byte gMultiplayerConnections
_08017728: .4byte 0x04000128
_0801772C:
	ldr r6, _0801779C @ =gPlayer
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801774C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _0801774C
	b _08017C18
_0801774C:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x24]
	cmp r0, #0
	beq _08017764
	ldr r5, [r7, #0x5c]
	mov r4, r8
	ands r5, r4
	cmp r5, #0
	bne _08017764
	b _08017BB4
_08017764:
	movs r5, #0
	strb r5, [r1]
	ldr r0, _080177A0 @ =0xFFFFFEDC
	adds r4, r0, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080177C8
	bl sub_80181E0
	cmp r0, #0
	beq _080177A4
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0801778E
	b _08017C18
_0801778E:
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
	str r5, [r7, #0x4c]
	b _08017C18
	.align 2, 0
_0801779C: .4byte gPlayer
_080177A0: .4byte 0xFFFFFEDC
_080177A4:
	mov r2, sb
	ldrh r2, [r2, #0xa]
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080177C8
	mov r3, sl
	ldr r0, [r3, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080177C8
	mov r4, sb
	ldr r0, [r4, #0x30]
	cmp r0, r1
	beq _080177C8
	b _08017C18
_080177C8:
	ldr r0, _080178D4 @ =gPlayer
	mov sl, r0
	ldrb r4, [r0, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #0x10
	strb r0, [r1]
	mov r2, sl
	ldrb r3, [r2, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #0x11
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #0xc
	movs r2, #4
	bl memcpy
	movs r3, #0x50
	adds r3, r3, r7
	mov r8, r3
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r6, r7, #0
	adds r6, #0x52
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r7, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, sb
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	mov r3, r8
	str r3, [sp, #0x18]
	str r6, [sp, #0x1c]
	mov r8, r5
	cmp r0, #0
	beq _0801784E
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801784E
	mov r4, sl
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
_0801784E:
	str r2, [r7, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _08017860
	movs r0, #0x1e
	ldr r1, [sp, #0x24]
	strb r0, [r1]
_08017860:
	ldr r2, [sp, #0x18]
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r4, [sp, #0x1c]
	movs r0, #0
	ldrsh r2, [r4, r0]
	ldr r5, _080178D4 @ =gPlayer
	add r3, sp, #0xc
	str r3, [sp]
	mov r0, sb
	adds r3, r5, #0
	bl CheckRectCollision_SpritePlayer
	cmp r0, #0
	bne _08017880
	b _0801798E
_08017880:
	mov r4, r8
	ldrh r0, [r4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x17
	movs r4, #1
	ands r0, r4
	adds r1, r5, #0
	adds r1, #0x38
	ldrb r1, [r1]
	cmp r0, r1
	beq _08017898
	b _0801798E
_08017898:
	ldr r1, _080178D8 @ =0xFFFFFEDC
	adds r0, r1, #0
	mov r3, sb
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0801798E
	ldr r0, _080178DC @ =gUnknown_03005424
	ldrh r3, [r0]
	lsrs r1, r3, #7
	ands r1, r4
	lsrs r2, r2, #0x13
	adds r0, r4, #0
	bics r0, r2
	cmp r1, r0
	beq _0801798E
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _080178E0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, [sp, #0x1c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080178EE
	b _0801798E
	.align 2, 0
_080178D4: .4byte gPlayer
_080178D8: .4byte 0xFFFFFEDC
_080178DC: .4byte gUnknown_03005424
_080178E0:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r3, [sp, #0x1c]
	movs r4, #0
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _0801798E
_080178EE:
	ldr r4, _08017938 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r2, #0
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	subs r0, #3
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801793C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _08017942
	.align 2, 0
_08017938: .4byte gPlayer
_0801793C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_08017942:
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017986
	bl sub_8019224
	movs r1, #8
	strb r1, [r0]
	ldr r2, [sp, #0x20]
	ldrb r1, [r2]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	ldr r0, _08017974 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801797C
	ldr r0, [r7, #0x5c]
	ldr r1, _08017978 @ =0xFFFFFEFF
	ands r0, r1
	b _08017984
	.align 2, 0
_08017974: .4byte gUnknown_03005424
_08017978: .4byte 0xFFFFFEFF
_0801797C:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
_08017984:
	str r0, [r7, #0x5c]
_08017986:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x5c]
_0801798E:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0801799A
	b _08017C18
_0801799A:
	ldr r6, _080179BC @ =gPlayer
	adds r0, r6, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _080179C4
	movs r0, #0x1e
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	ldr r0, [r6, #0x20]
	ldr r1, _080179C0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	b _08017B9A
	.align 2, 0
_080179BC: .4byte gPlayer
_080179C0: .4byte 0xFFBFFFFF
_080179C4:
	ldr r4, _08017A5C @ =0xFFFFFEDC
	adds r0, r4, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _08017A60 @ =gUnknown_03005424
	cmp r0, #2
	bhi _08017A14
	ldr r0, [r6, #8]
	asrs r1, r0, #8
	ldr r2, _08017A64 @ =gCamera
	ldr r0, [r2, #0x30]
	cmp r1, r0
	ble _08017A14
	ldr r0, [r2, #0x34]
	cmp r1, r0
	bge _08017A14
	ldrh r4, [r5]
	lsrs r0, r4, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	mov r1, r8
	ldrh r0, [r1]
	lsrs r0, r0, #3
	adds r1, r3, #0
	bics r1, r0
	cmp r2, r1
	bne _08017A14
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08017A14
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _08017A70
_08017A14:
	ldr r2, _08017A68 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08017A6C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	adds r2, #0x64
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	mov r4, r8
	ldrh r1, [r4]
	lsrs r1, r1, #3
	adds r0, r3, #0
	bics r0, r1
	cmp r2, r0
	bne _08017A54
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08017A54
	b _08017C18
_08017A54:
	movs r0, #0x1e
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	b _08017C18
	.align 2, 0
_08017A5C: .4byte 0xFFFFFEDC
_08017A60: .4byte gUnknown_03005424
_08017A64: .4byte gCamera
_08017A68: .4byte gPlayer
_08017A6C: .4byte 0xFFBFFFFF
_08017A70:
	movs r2, #0x17
	ldrsb r2, [r6, r2]
	movs r0, #0x80
	ands r0, r4
	ldr r3, [sp, #0x18]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r1, r1, #8
	mov r8, r1
	cmp r0, #0
	bne _08017ACC
	ldr r1, [sp, #0x1c]
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r1, sb
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	add r1, sp, #0xc
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r5, r0, #8
	subs r0, r0, r2
	mov r4, r8
	asrs r1, r4, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08017AC8 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08017B1C
	lsls r0, r0, #8
	subs r5, r5, r0
	b _08017B08
	.align 2, 0
_08017AC8: .4byte sub_801EC3C
_08017ACC:
	ldr r1, [sp, #0x1c]
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r1, sb
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	add r1, sp, #0xc
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r5, r0, #8
	adds r0, r0, r2
	mov r4, r8
	asrs r1, r4, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _08017B5C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08017B1C
	lsls r0, r0, #8
	adds r5, r5, r0
_08017B08:
	ldr r0, [r6, #0x20]
	ldr r1, _08017B60 @ =0xFFBFFFFF
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x5c]
	subs r1, #7
	ands r0, r1
	str r0, [r7, #0x5c]
_08017B1C:
	ldr r3, _08017B64 @ =gPlayer
	mov r0, r8
	str r0, [r3, #8]
	str r5, [r3, #0xc]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017B78
	ldr r2, [r3, #0x20]
	movs r0, #8
	orrs r2, r0
	subs r0, #0xd
	ands r2, r0
	adds r0, #2
	ands r2, r0
	str r2, [r3, #0x20]
	mov r1, sb
	str r1, [r3, #0x3c]
	movs r0, #0
	strh r0, [r3, #0x12]
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08017B68
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	b _08017B6C
	.align 2, 0
_08017B5C: .4byte sub_801EC3C
_08017B60: .4byte 0xFFBFFFFF
_08017B64: .4byte gPlayer
_08017B68:
	movs r0, #1
	orrs r2, r0
_08017B6C:
	str r2, [r3, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017B8A
_08017B78:
	bl sub_8019224
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldr r3, [sp, #0x20]
	ldrb r1, [r3]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_08017B8A:
	ldr r0, _08017BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08017BA8
	ldr r0, [r7, #0x5c]
	ldr r1, _08017BA4 @ =0xFFFFFEFF
_08017B9A:
	ands r0, r1
	str r0, [r7, #0x5c]
	b _08017C18
	.align 2, 0
_08017BA0: .4byte gUnknown_03005424
_08017BA4: .4byte 0xFFFFFEFF
_08017BA8:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x5c]
	b _08017C18
_08017BB4:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017C18
	ldr r0, [r6, #0x3c]
	cmp r0, sb
	bne _08017C18
	adds r0, r7, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r5, [sp, #8]
	mov r0, sb
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017C16
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08017C16
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
_08017C16:
	str r2, [r7, #0x4c]
_08017C18:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8017C28
sub_8017C28: @ 0x08017C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08017CB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	str r7, [sp, #0xc]
	ldr r2, _08017CBC @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017C58
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _08017C58
	bl sub_8017F34
_08017C58:
	ldr r0, _08017CC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08017C90
	ldr r0, _08017CC4 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017CC8 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08017CCC
_08017C90:
	bl sub_8018300
	cmp r0, #0
	bne _08017C9A
	b _08017F1E
_08017C9A:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017CA6
	b _08017F1E
_08017CA6:
	ldr r2, _08017CBC @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08017F1E
	.align 2, 0
_08017CB8: .4byte gCurTask
_08017CBC: .4byte gPlayer
_08017CC0: .4byte gGameMode
_08017CC4: .4byte gMultiplayerConnections
_08017CC8: .4byte 0x04000128
_08017CCC:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x14]
	cmp r0, #0
	beq _08017CDA
	b _08017EB4
_08017CDA:
	ldr r0, [sp, #0xc]
	ldr r1, [r0, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08017D3C
	ldr r5, _08017D38 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08017D08
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08017D08
	b _08017F1E
_08017D08:
	adds r0, r7, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _08017EFA
	.align 2, 0
_08017D38: .4byte gPlayer
_08017D3C:
	ldr r0, _08017DD4 @ =gPlayer
	str r0, [sp, #0x10]
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08017D5E
	ldr r0, [sp, #0x10]
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08017D5E
	b _08017F1E
_08017D5E:
	movs r1, #0x50
	adds r1, r1, r7
	mov sl, r1
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r5, #0x66
	adds r5, r5, r7
	mov r8, r5
	movs r6, #0
	ldrsh r3, [r5, r6]
	adds r6, r7, #0
	adds r6, #0x68
	movs r4, #0
	ldrsh r0, [r6, r4]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	bl sub_800DA4C
	adds r3, r0, #0
	movs r1, #2
	ands r0, r1
	mov r2, sl
	mov sl, r6
	mov ip, r5
	cmp r0, #0
	beq _08017DF4
	ldr r5, [sp, #0x10]
	ldr r0, [r5, #0x20]
	ands r0, r1
	cmp r0, #0
	bne _08017DF4
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017DF4
	ldr r6, [sp, #0xc]
	ldrh r1, [r6, #0xa]
	movs r0, #0xbd
	lsls r0, r0, #1
	cmp r1, r0
	bne _08017DDC
	ldr r0, _08017DD8 @ =0xFFFFF880
	bl sub_80188A4
	b _08017E56
	.align 2, 0
_08017DD4: .4byte gPlayer
_08017DD8: .4byte 0xFFFFF880
_08017DDC:
	ldr r0, _08017DEC @ =0x0000017F
	cmp r1, r0
	bne _08017DF4
	ldr r0, _08017DF0 @ =0xFFFFF580
	bl sub_80188A4
	b _08017E56
	.align 2, 0
_08017DEC: .4byte 0x0000017F
_08017DF0: .4byte 0xFFFFF580
_08017DF4:
	movs r4, #1
	adds r0, r3, #0
	ands r0, r4
	cmp r0, #0
	beq _08017E64
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	cmp r0, #0
	beq _08017E1C
	ldr r1, _08017E18 @ =gPlayer
	ldrh r2, [r1, #0x10]
	movs r4, #0x10
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _08017E3C
	b _08017E32
	.align 2, 0
_08017E18: .4byte gPlayer
_08017E1C:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r3
	cmp r0, #0
	beq _08017E3C
	ldr r1, _08017E60 @ =gPlayer
	ldrh r2, [r1, #0x10]
	movs r5, #0x10
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge _08017E3C
_08017E32:
	rsbs r0, r2, #0
	strh r0, [r1, #0x10]
	ldrh r0, [r1, #0x14]
	rsbs r0, r0, #0
	strh r0, [r1, #0x14]
_08017E3C:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	beq _08017E56
	ldr r1, _08017E60 @ =gPlayer
	ldrh r2, [r1, #0x12]
	movs r6, #0x12
	ldrsh r0, [r1, r6]
	cmp r0, #0
	ble _08017E56
	rsbs r0, r2, #0
	strh r0, [r1, #0x12]
_08017E56:
	movs r0, #0x1e
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	b _08017F1E
	.align 2, 0
_08017E60: .4byte gPlayer
_08017E64:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r5, sb
	movs r6, #0
	ldrsh r2, [r5, r6]
	mov r0, r8
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov r6, sl
	movs r5, #0
	ldrsh r0, [r6, r5]
	str r0, [sp]
	mov r6, ip
	ldrh r0, [r6]
	lsrs r0, r0, #7
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	bl sub_800D0A0
	adds r3, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017F1C
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08017F1C
	ldr r0, _08017EB0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	b _08017F1C
	.align 2, 0
_08017EB0: .4byte gPlayer
_08017EB4:
	subs r0, #1
	strb r0, [r1]
	ldr r5, _08017F30 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017F1E
	ldr r0, [r5, #0x3c]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _08017F1E
	adds r0, r7, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
_08017EFA:
	ldr r0, [sp, #0xc]
	bl sub_800D0A0
	adds r3, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017F1C
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08017F1C
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
_08017F1C:
	str r3, [r7, #0x4c]
_08017F1E:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017F30: .4byte gPlayer

	thumb_func_start sub_8017F34
sub_8017F34: @ 0x08017F34
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08017F78 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r0, [r6, #0x44]
	cmp r0, #0
	bge _08017F4C
	rsbs r0, r0, #0
_08017F4C:
	cmp r0, #0x80
	bgt _08017F5C
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bge _08017F58
	rsbs r0, r0, #0
_08017F58:
	cmp r0, #0x80
	ble _08017F80
_08017F5C:
	ldr r2, _08017F7C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	b _08018110
	.align 2, 0
_08017F78: .4byte gCurTask
_08017F7C: .4byte gPlayer
_08017F80:
	ldr r1, _08017FCC @ =gMultiplayerPlayerTasks
	ldr r0, _08017FD0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08017FD4 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r4, #0x80
	adds r1, r4, #0
	ands r1, r0
	ldr r2, _08017FD4 @ =IWRAM_START + 0x54
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _08017FE4
	ldr r2, _08017FD8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x3c]
	ldr r1, _08017FDC @ =IWRAM_START + 0x56
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r2, _08017FE0 @ =IWRAM_START + 0x64
	adds r0, r3, r2
	strb r1, [r0]
	b _08018110
	.align 2, 0
_08017FCC: .4byte gMultiplayerPlayerTasks
_08017FD0: .4byte 0x04000128
_08017FD4: .4byte IWRAM_START + 0x54
_08017FD8: .4byte gPlayer
_08017FDC: .4byte IWRAM_START + 0x56
_08017FE0: .4byte IWRAM_START + 0x64
_08017FE4:
	ldr r2, _08018008 @ =gPlayer
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, _0801800C @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _08018010
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	b _08018016
	.align 2, 0
_08018008: .4byte gPlayer
_0801800C: .4byte gUnknown_03005424
_08018010:
	ldr r1, [r5, #0xc]
	ldr r2, _08018050 @ =0xFFFFFE00
	adds r1, r1, r2
_08018016:
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r5, #0xc]
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bge _08018058
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08018054 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0801809C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	b _08018084
	.align 2, 0
_08018050: .4byte 0xFFFFFE00
_08018054: .4byte sub_801EC3C
_08018058:
	cmp r0, #0
	ble _0801809C
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _080180D4 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0801809C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
_08018084:
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_0801809C:
	ldr r1, [r6, #0x44]
	cmp r1, #0
	bge _080180E0
	ldr r5, _080180D8 @ =gPlayer
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _080180DC @ =sub_801EB44
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08018110
	lsls r1, r0, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	b _08018110
	.align 2, 0
_080180D4: .4byte sub_801EC3C
_080180D8: .4byte gPlayer
_080180DC: .4byte sub_801EB44
_080180E0:
	cmp r1, #0
	ble _08018110
	ldr r4, _08018118 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0801811C @ =sub_801EB44
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08018110
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_08018110:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018118: .4byte gPlayer
_0801811C: .4byte sub_801EB44

	thumb_func_start sub_8018120
sub_8018120: @ 0x08018120
	push {r4, r5, r6, r7, lr}
	ldr r0, _080181C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r3, _080181C8 @ =gPlayer
	ldr r4, [r3, #0x20]
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0801819C
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _0801819C
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r1, [r3, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3, #0xc]
	ldr r1, _080181CC @ =gMultiplayerPlayerTasks
	ldr r0, _080181D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _080181D4 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	adds r2, r0, #0
	ands r2, r1
	ldr r7, _080181D4 @ =IWRAM_START + 0x54
	adds r1, r5, r7
	ldrh r1, [r1]
	ands r0, r1
	cmp r2, r0
	beq _0801819C
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	str r4, [r3, #0x20]
	adds r0, #8
	str r0, [r3, #0x3c]
	ldr r1, _080181D8 @ =IWRAM_START + 0x56
	adds r0, r5, r1
	ldrb r1, [r0]
	ldr r2, _080181DC @ =IWRAM_START + 0x64
	adds r0, r5, r2
	strb r1, [r0]
_0801819C:
	bl sub_8018300
	cmp r0, #0
	beq _080181BC
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080181BC
	ldr r2, _080181C8 @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r6, #0x4c]
_080181BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080181C4: .4byte gCurTask
_080181C8: .4byte gPlayer
_080181CC: .4byte gMultiplayerPlayerTasks
_080181D0: .4byte 0x04000128
_080181D4: .4byte IWRAM_START + 0x54
_080181D8: .4byte IWRAM_START + 0x56
_080181DC: .4byte IWRAM_START + 0x64

	thumb_func_start sub_80181E0
sub_80181E0: @ 0x080181E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r5, _08018270 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, _08018274 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	mov r8, r6
	ldr r0, [r1, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080182D0
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _080182D0
	ldr r1, _08018278 @ =IWRAM_START + 0x50
	adds r0, r4, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, _0801827C @ =IWRAM_START + 0x52
	adds r0, r4, r3
	movs r7, #0
	ldrsh r2, [r0, r7]
	adds r3, #0x14
	adds r0, r4, r3
	movs r7, #0
	ldrsh r3, [r0, r7]
	ldr r7, _08018280 @ =IWRAM_START + 0x68
	adds r0, r4, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	str r0, [sp]
	ldr r7, _08018284 @ =IWRAM_START + 0x54
	adds r0, r4, r7
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_800DA4C
	adds r2, r0, #0
	ands r0, r4
	cmp r0, #0
	beq _080182D0
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080182A6
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08018288
	ldrh r1, [r5, #0x10]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _080182A6
	b _0801829C
	.align 2, 0
_08018270: .4byte gPlayer
_08018274: .4byte gCurTask
_08018278: .4byte IWRAM_START + 0x50
_0801827C: .4byte IWRAM_START + 0x52
_08018280: .4byte IWRAM_START + 0x68
_08018284: .4byte IWRAM_START + 0x54
_08018288:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _080182A6
	ldrh r1, [r5, #0x10]
	movs r7, #0x10
	ldrsh r0, [r5, r7]
	cmp r0, #0
	bge _080182A6
_0801829C:
	rsbs r0, r1, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x14]
	rsbs r0, r0, #0
	strh r0, [r5, #0x14]
_080182A6:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _080182C0
	ldr r1, _080182CC @ =gPlayer
	ldrh r2, [r1, #0x12]
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080182C0
	rsbs r0, r2, #0
	strh r0, [r1, #0x12]
_080182C0:
	mov r1, r8
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _080182F0
	.align 2, 0
_080182CC: .4byte gPlayer
_080182D0:
	ldr r2, _080182FC @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080182EE
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _080182EE
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_080182EE:
	movs r0, #0
_080182F0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080182FC: .4byte gPlayer

@ Out:
@  bool32 (hit?)
	thumb_func_start sub_8018300
sub_8018300: @ 0x08018300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r2, _080183A4 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, _080183A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	str r6, [sp, #0xc]
	adds r0, #0x60
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08018332
	b _08018634
_08018332:
	ldr r1, _080183AC @ =IWRAM_START + 0x50
	adds r5, r4, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _080183B0 @ =IWRAM_START + 0x52
	adds r7, r4, r3
	movs r2, #0
	ldrsh r0, [r7, r2]
	mov ip, r0
	adds r3, #0x14
	adds r3, r3, r4
	mov r8, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp, #0x20]
	ldr r3, _080183B4 @ =IWRAM_START + 0x68
	adds r3, r3, r4
	mov sb, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp]
	ldr r3, _080183B8 @ =IWRAM_START + 0x54
	adds r4, r4, r3
	ldrh r0, [r4]
	lsrs r0, r0, #7
	movs r2, #1
	mov sl, r2
	ands r0, r2
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800DA4C
	adds r2, r0, #0
	ldr r0, _080183BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08018400
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08018400
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080183C8
	ldr r5, _080183C0 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080183C4 @ =0xFFFFFCA0
	b _080183D6
	.align 2, 0
_080183A4: .4byte gPlayer
_080183A8: .4byte gCurTask
_080183AC: .4byte IWRAM_START + 0x50
_080183B0: .4byte IWRAM_START + 0x52
_080183B4: .4byte IWRAM_START + 0x68
_080183B8: .4byte IWRAM_START + 0x54
_080183BC: .4byte gGameMode
_080183C0: .4byte 0xFFFFFA60
_080183C4: .4byte 0xFFFFFCA0
_080183C8:
	movs r5, #0xb4
	lsls r5, r5, #3
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xd8
	lsls r0, r0, #2
_080183D6:
	adds r2, r0, #0
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldrh r0, [r4]
	lsrs r0, r0, #7
	mov r4, sl
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_800DA4C
	adds r2, r0, #0
_08018400:
	adds r0, r2, #0
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _08018492
	ldr r0, _08018440 @ =gPlayer
	adds r1, r0, #0
	adds r1, #0x61
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r0
	cmp r1, #0
	bne _08018464
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08018444
	mov r7, r8
	ldrh r1, [r7, #0x10]
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _08018464
	rsbs r0, r1, #0
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #0x14]
	rsbs r0, r0, #0
	strh r0, [r7, #0x14]
	b _08018464
	.align 2, 0
_08018440: .4byte gPlayer
_08018444:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _08018464
	mov r4, r8
	ldrh r1, [r4, #0x10]
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _08018464
	rsbs r0, r1, #0
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x14]
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_08018464:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _0801847E
	mov r7, r8
	ldrh r1, [r7, #0x12]
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _0801847E
	rsbs r0, r1, #0
	strh r0, [r7, #0x12]
_0801847E:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0801849E
	movs r0, #1
	b _0801874C
_08018492:
	movs r4, #2
	ands r4, r2
	ldr r5, _080184C4 @ =gPlayer
	mov r8, r5
	cmp r4, #0
	beq _08018512
_0801849E:
	movs r3, #1
	ands r2, r3
	cmp r2, #0
	beq _080184D8
	adds r0, r6, #0
	adds r0, #0x50
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r2, r8
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080184C8
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _080184D0
	.align 2, 0
_080184C4: .4byte gPlayer
_080184C8:
	mov r4, r8
	ldr r0, [r4, #0x20]
	orrs r0, r3
	str r0, [r4, #0x20]
_080184D0:
	mov r0, r8
	bl sub_800DE44
	b _08018506
_080184D8:
	adds r0, r6, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r1, [r0, r5]
	mov r7, r8
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080184F2
	ldr r0, [r7, #0x20]
	orrs r0, r3
	str r0, [r7, #0x20]
	b _08018500
_080184F2:
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	mov r2, r8
	str r0, [r2, #0x20]
_08018500:
	mov r0, r8
	bl sub_800DD54
_08018506:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _0801874C
_08018512:
	ldr r3, [sp, #0x10]
	ldr r1, [r3, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080185F4
	ldr r5, [sp, #0xc]
	ldr r0, [r5, #0x30]
	cmp r0, r1
	bne _080185F4
	mov r7, r8
	ldr r7, [r7, #0x20]
	str r7, [sp, #0x14]
	mov r0, r8
	ldr r0, [r0, #0x3c]
	str r0, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x50
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r7, r6, #0
	adds r7, #0x52
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	movs r2, #0x66
	adds r2, r2, r6
	mov sb, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x20]
	movs r2, #0x68
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	str r0, [sp, #0x1c]
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800D0A0
	adds r4, r0, #0
	ldr r0, _080185B0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08018584
	b _08018718
_08018584:
	cmp r4, #0
	beq _0801858A
	b _08018718
_0801858A:
	ldr r3, [sp, #0x14]
	mov r0, r8
	str r3, [r0, #0x20]
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x3c]
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080185BC
	ldr r5, _080185B4 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080185B8 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _080185CC
	.align 2, 0
_080185B0: .4byte gGameMode
_080185B4: .4byte 0xFFFFFA60
_080185B8: .4byte 0xFFFFFCA0
_080185BC:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_080185CC:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, sb
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sl
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldr r5, [sp, #0x1c]
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	b _08018712
_080185F4:
	ldr r1, _08018630 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	mov r8, r1
	cmp r0, #0
	beq _08018618
	ldr r0, [r1, #0x3c]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _08018618
	movs r0, #9
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	mov r3, r8
	str r2, [r3, #0x20]
_08018618:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08018624
	b _0801874A
_08018624:
	mov r4, r8
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
	b _0801874A
	.align 2, 0
_08018630: .4byte gPlayer
_08018634:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08018644
	b _0801874A
_08018644:
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	beq _0801864C
	b _0801874A
_0801864C:
	ldr r7, _080186C0 @ =IWRAM_START + 0x50
	adds r5, r4, r7
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, _080186C4 @ =IWRAM_START + 0x52
	adds r7, r4, r2
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	adds r2, #0x14
	adds r2, r2, r4
	mov r8, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x20]
	ldr r2, _080186C8 @ =IWRAM_START + 0x68
	adds r2, r2, r4
	mov sb, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	ldr r0, _080186CC @ =IWRAM_START + 0x54
	adds r0, r0, r4
	mov sl, r0
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800D0A0
	adds r4, r0, #0
	ldr r0, _080186D0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08018718
	cmp r4, #0
	bne _08018718
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080186DC
	ldr r5, _080186D4 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080186D8 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _080186EC
	.align 2, 0
_080186C0: .4byte IWRAM_START + 0x50
_080186C4: .4byte IWRAM_START + 0x52
_080186C8: .4byte IWRAM_START + 0x68
_080186CC: .4byte IWRAM_START + 0x54
_080186D0: .4byte gGameMode
_080186D4: .4byte 0xFFFFFA60
_080186D8: .4byte 0xFFFFFCA0
_080186DC:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_080186EC:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	mov r5, sl
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
_08018712:
	bl sub_800D0A0
	adds r4, r0, #0
_08018718:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08018736
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08018736
	ldr r0, _0801875C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_08018736:
	str r4, [r6, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r4
	cmp r0, #0
	beq _0801874A
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_0801874A:
	movs r0, #0
_0801874C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801875C: .4byte gPlayer

	thumb_func_start sub_8018760
sub_8018760: @ 0x08018760
	push {r4, r5, r6, lr}
	ldr r6, _080187D0 @ =gPlayer
	adds r0, r6, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080187E4
	ldr r5, _080187D4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r6, #0x20]
	ldr r1, _080187D8 @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _080187DC @ =0xFF7FFFFF
	ands r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080187E0 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	movs r0, #0x99
	bl m4aSongNumStart
	ldrh r0, [r4]
	strh r0, [r6, #0x12]
	ldr r0, [r5]
	bl TaskDestroy
	b _08018804
	.align 2, 0
_080187D0: .4byte gPlayer
_080187D4: .4byte gCurTask
_080187D8: .4byte 0xFFDFFFFF
_080187DC: .4byte 0xFF7FFFFF
_080187E0: .4byte 0xFFFFFEFF
_080187E4:
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	beq _08018804
	ldr r0, [r6, #0x20]
	ldr r1, _0801880C @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _08018810 @ =0xFF7FFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, _08018814 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08018804:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801880C: .4byte 0xFFDFFFFF
_08018810: .4byte 0xFF7FFFFF
_08018814: .4byte gCurTask

	thumb_func_start sub_8018818
sub_8018818: @ 0x08018818
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801886C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08018864
	ldr r1, _08018870 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	ldr r7, _08018874 @ =gPlayer
	cmp r0, #0
	beq _08018854
	movs r6, #0xc0
	lsls r6, r6, #0x12
	movs r5, #3
	rsbs r5, r5, #0
	adds r3, r1, #0
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0xc
_0801883C:
	ldm r2!, {r0}
	ldrh r1, [r0, #6]
	adds r1, r1, r6
	ldr r0, [r1, #0x5c]
	ands r0, r5
	str r0, [r1, #0x5c]
	adds r3, #4
	cmp r2, r4
	bhi _08018854
	ldr r0, [r3]
	cmp r0, #0
	bne _0801883C
_08018854:
	movs r0, #0x78
	strh r0, [r7, #0x2c]
	adds r2, r7, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08018864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801886C: .4byte gGameMode
_08018870: .4byte gMultiplayerPlayerTasks
_08018874: .4byte gPlayer

	thumb_func_start TaskDestructor_CreateMultiplayerPlayer
TaskDestructor_CreateMultiplayerPlayer: @ 0x08018878
	push {lr}
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r0, r2
	ldr r1, _0801889C @ =gMultiplayerPlayerTasks
	ldr r3, _080188A0 @ =IWRAM_START + 0x56
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0801889C: .4byte gMultiplayerPlayerTasks
_080188A0: .4byte IWRAM_START + 0x56

	thumb_func_start sub_80188A4
sub_80188A4: @ 0x080188A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080188F4 @ =sub_8018760
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r1, #2
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	ldr r3, _080188F8 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	adds r0, r3, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r2, r3, #0
	adds r2, #0x64
	movs r0, #0x6d
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r3, #0x20]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080188F4: .4byte sub_8018760
_080188F8: .4byte gPlayer
