.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _080377AC @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r2, r1
	ldr r3, _080377B0 @ =0x0300009C
	adds r0, r2, r3
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sl, r0
	ldr r4, _080377B4 @ =0x0300000C
	adds r7, r2, r4
	ldr r0, _080377B8 @ =0x03000044
	adds r0, r2, r0
	str r0, [sp, #4]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080377C0
	ldr r1, _080377BC @ =0x03000084
	adds r0, r2, r1
	ldr r1, [r6, #0x7c]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r6, #0x7c]
	ldr r0, [r6, #0x74]
	subs r0, r0, r1
	b _080377D0
	.align 2, 0
_080377AC: .4byte gCurTask
_080377B0: .4byte 0x0300009C
_080377B4: .4byte 0x0300000C
_080377B8: .4byte 0x03000044
_080377BC: .4byte 0x03000084
_080377C0:
	ldr r3, _08037830 @ =0x03000084
	adds r0, r2, r3
	ldr r1, [r6, #0x7c]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r6, #0x7c]
	ldr r0, [r6, #0x74]
	adds r0, r0, r1
_080377D0:
	str r0, [r6, #0x74]
	adds r3, r6, #0
	adds r3, #0x80
	ldr r1, [r6, #0x78]
	ldr r0, [r3]
	adds r1, r1, r0
	str r1, [r6, #0x78]
	adds r2, r6, #0
	adds r2, #0x88
	ldr r0, [r6, #0x74]
	asrs r0, r0, #8
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x8a
	asrs r1, r1, #8
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, [r3]
	cmp r0, #0
	bne _0803783C
	adds r2, r6, #0
	adds r2, #0x90
	ldrh r0, [r2]
	adds r0, #8
	ldr r1, _08037834 @ =0x000003FF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08037838 @ =gSineTable
	ldrh r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08037844
	.align 2, 0
_08037830: .4byte 0x03000084
_08037834: .4byte 0x000003FF
_08037838: .4byte gSineTable
_0803783C:
	adds r1, r6, #0
	adds r1, #0x90
	movs r0, #0
	strh r0, [r1]
_08037844:
	adds r0, r6, #0
	adds r0, #0x8c
	strh r5, [r0]
	adds r0, #2
	strh r4, [r0]
	lsls r5, r5, #0x10
	asrs r3, r5, #0x10
	mov r8, r3
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	mov sb, r0
	mov r0, r8
	mov r1, sb
	bl sub_8036E20
	adds r0, r6, #0
	adds r0, #0x94
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r4, [sp, #0x20]
	str r5, [sp, #0x1c]
	cmp r0, #7
	ble _0803787A
	bl sub_803803C
	b _0803802A
_0803787A:
	ldr r0, _080378FC @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	ldr r2, _08037900 @ =0x0300000C
	adds r1, r1, r2
	ldr r2, _08037904 @ =gCamera
	ldrh r0, [r2]
	mov r4, r8
	subs r0, r4, r0
	strh r0, [r1, #0x16]
	ldrh r0, [r2, #2]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r1, #0x18]
	ldrh r2, [r3, #6]
	ldr r3, _08037908 @ =0x03000044
	adds r1, r2, r3
	ldr r4, _0803790C @ =0x03000064
	adds r3, r2, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _080378BE
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080378BE
	movs r0, #0
	strb r0, [r3]
	ldr r0, _08037910 @ =0x03000065
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_080378BE:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	ldr r0, [sp, #4]
	bl UpdateSpriteAnimation
	ldr r0, _080378FC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08037900 @ =0x0300000C
	adds r2, r0, r1
	ldr r3, _08037908 @ =0x03000044
	adds r0, r0, r3
	ldrh r1, [r2, #0x16]
	strh r1, [r0, #0x16]
	ldrh r1, [r2, #0x18]
	strh r1, [r0, #0x18]
	bl sub_80370B4
	adds r0, r6, #0
	adds r0, #0x99
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0x42
	bls _080378F2
	b _0803802A
_080378F2:
	lsls r0, r1, #2
	ldr r1, _08037914 @ =_08037918
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080378FC: .4byte gCurTask
_08037900: .4byte 0x0300000C
_08037904: .4byte gCamera
_08037908: .4byte 0x03000044
_0803790C: .4byte 0x03000064
_08037910: .4byte 0x03000065
_08037914: .4byte _08037918
_08037918: @ jump table
	.4byte _08037A24 @ case 0
	.4byte _08037A88 @ case 1
	.4byte _08037ACA @ case 2
	.4byte _08037B02 @ case 3
	.4byte _08037B54 @ case 4
	.4byte _08038018 @ case 5
	.4byte _0803802A @ case 6
	.4byte _0803802A @ case 7
	.4byte _0803802A @ case 8
	.4byte _0803802A @ case 9
	.4byte _0803802A @ case 10
	.4byte _0803802A @ case 11
	.4byte _0803802A @ case 12
	.4byte _0803802A @ case 13
	.4byte _0803802A @ case 14
	.4byte _0803802A @ case 15
	.4byte _08037B6A @ case 16
	.4byte _08037B8C @ case 17
	.4byte _0803802A @ case 18
	.4byte _0803802A @ case 19
	.4byte _0803802A @ case 20
	.4byte _0803802A @ case 21
	.4byte _0803802A @ case 22
	.4byte _0803802A @ case 23
	.4byte _0803802A @ case 24
	.4byte _0803802A @ case 25
	.4byte _0803802A @ case 26
	.4byte _0803802A @ case 27
	.4byte _0803802A @ case 28
	.4byte _0803802A @ case 29
	.4byte _0803802A @ case 30
	.4byte _0803802A @ case 31
	.4byte _08037BF2 @ case 32
	.4byte _0803802A @ case 33
	.4byte _0803802A @ case 34
	.4byte _0803802A @ case 35
	.4byte _0803802A @ case 36
	.4byte _0803802A @ case 37
	.4byte _0803802A @ case 38
	.4byte _0803802A @ case 39
	.4byte _0803802A @ case 40
	.4byte _0803802A @ case 41
	.4byte _0803802A @ case 42
	.4byte _0803802A @ case 43
	.4byte _0803802A @ case 44
	.4byte _0803802A @ case 45
	.4byte _0803802A @ case 46
	.4byte _0803802A @ case 47
	.4byte _08037E88 @ case 48
	.4byte _0803802A @ case 49
	.4byte _08037E92 @ case 50
	.4byte _08037E96 @ case 51
	.4byte _08037EAC @ case 52
	.4byte _08037F18 @ case 53
	.4byte _0803802A @ case 54
	.4byte _0803802A @ case 55
	.4byte _0803802A @ case 56
	.4byte _0803802A @ case 57
	.4byte _0803802A @ case 58
	.4byte _0803802A @ case 59
	.4byte _0803802A @ case 60
	.4byte _0803802A @ case 61
	.4byte _0803802A @ case 62
	.4byte _0803802A @ case 63
	.4byte _08037F54 @ case 64
	.4byte _08037F80 @ case 65
	.4byte _08037FE4 @ case 66
_08037A24:
	adds r1, r6, #0
	adds r1, #0x9a
	movs r0, #0
	strb r0, [r1]
	mov r1, sl
	adds r1, #0x79
	movs r0, #8
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r2, _08037A5C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08037A60 @ =0x00196225
	muls r0, r1, r0
	ldr r4, _08037A64 @ =0x3C6EF35F
	adds r0, r0, r4
	str r0, [r2]
	movs r1, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	cmp r0, #1
	beq _08037A78
	cmp r0, #1
	bgt _08037A68
	cmp r0, #0
	beq _08037A70
	b _08037A88
	.align 2, 0
_08037A5C: .4byte gPseudoRandom
_08037A60: .4byte 0x00196225
_08037A64: .4byte 0x3C6EF35F
_08037A68:
	cmp r0, #2
	beq _08037A80
	cmp r0, #3
	bne _08037A88
_08037A70:
	adds r1, r6, #0
	adds r1, #0x92
	movs r0, #0x5a
	b _08037A86
_08037A78:
	adds r1, r6, #0
	adds r1, #0x92
	movs r0, #0xb4
	b _08037A86
_08037A80:
	adds r1, r6, #0
	adds r1, #0x92
	movs r0, #0xf0
_08037A86:
	strh r0, [r1]
_08037A88:
	adds r4, r6, #0
	adds r4, #0x92
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08037A9A
	b _0803802A
_08037A9A:
	ldr r7, [sp, #0x1c]
	asrs r0, r7, #0x10
	bl sub_803711C
	adds r1, r6, #0
	adds r1, #0x9a
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _08037ABA
	movs r0, #0xa
	strh r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
_08037ABA:
	mov r1, sl
	adds r1, #0x79
	movs r0, #0xa
	strb r0, [r1]
	movs r0, #0x14
	strh r0, [r4]
	movs r0, #0x40
	b _08038028
_08037ACA:
	mov r2, sl
	adds r2, #0x7a
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	strb r0, [r2]
	cmp r0, #0
	bne _08037ADC
	b _0803802A
_08037ADC:
	adds r2, r6, #0
	adds r2, #0x92
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08037AEE
	b _0803802A
_08037AEE:
	movs r1, #0xa
	movs r0, #0xa
	strh r0, [r2]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x79
	strb r1, [r0]
	b _0803802A
_08037B02:
	mov r0, sl
	adds r0, #0x7a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08037B12
	b _0803802A
_08037B12:
	adds r2, r6, #0
	adds r2, #0x92
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08037B26
	b _0803802A
_08037B26:
	mov r1, sl
	adds r1, #0x79
	movs r0, #0xd
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x9a
	ldrb r0, [r1]
	lsls r0, r0, #4
	strb r0, [r5]
	ldrb r0, [r1]
	cmp r0, #2
	bne _08037B4A
	movs r0, #0x1e
	strh r0, [r2]
	movs r0, #0xac
	bl m4aSongNumStart
	b _0803802A
_08037B4A:
	cmp r0, #1
	beq _08037B50
	b _0803802A
_08037B50:
	strh r3, [r2]
	b _0803802A
_08037B54:
	mov r1, sl
	adds r1, #0x79
	movs r2, #0
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x9a
	strb r2, [r0]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
_08037B6A:
	bl sub_803967C
	adds r1, r6, #0
	adds r1, #0x92
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r6, #0x7c]
	subs r1, #0xe
	movs r0, #0x40
	rsbs r0, r0, #0
	str r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
_08037B8C:
	movs r2, #0
	ldr r0, [r6, #0x7c]
	cmp r0, #0
	bgt _08037BA8
	adds r3, r6, #0
	adds r3, #0x84
	ldr r1, [r3]
	adds r0, r1, #0
	cmp r1, #0
	bge _08037BA2
	adds r0, r1, #3
_08037BA2:
	asrs r0, r0, #2
	subs r0, r1, r0
	str r0, [r3]
_08037BA8:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08037BC4
	ldr r0, [r6, #0x74]
	ldr r1, _08037BC0 @ =0xFFFF8C00
	cmp r0, r1
	blt _08037BD2
	str r1, [r6, #0x74]
	b _08037BD8
	.align 2, 0
_08037BC0: .4byte 0xFFFF8C00
_08037BC4:
	ldr r0, [r6, #0x74]
	movs r1, #0xe8
	lsls r1, r1, #7
	cmp r0, r1
	bgt _08037BD2
	str r1, [r6, #0x74]
	movs r2, #0xff
_08037BD2:
	cmp r2, #0
	bne _08037BD8
	b _0803802A
_08037BD8:
	movs r1, #0
	str r1, [r6, #0x7c]
	adds r0, r6, #0
	adds r0, #0x84
	str r1, [r0]
	adds r0, #0xe
	ldrh r0, [r0]
	cmp r0, #0
	beq _08037BEE
	movs r0, #4
	b _08038028
_08037BEE:
	movs r0, #0x10
	b _08038028
_08037BF2:
	adds r1, r6, #0
	adds r1, #0x92
	ldrh r0, [r1]
	subs r0, #1
	movs r4, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0
	bne _08037C40
	movs r0, #4
	strb r0, [r5]
	ldr r0, _08037C30 @ =gPlayer
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08037C20
	ldr r0, _08037C34 @ =gNumLives
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037C20
	b _0803802A
_08037C20:
	ldr r1, _08037C38 @ =gWinRegs
	ldr r0, _08037C3C @ =0x00001F1F
	strh r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	b _0803802A
	.align 2, 0
_08037C30: .4byte gPlayer
_08037C34: .4byte gNumLives
_08037C38: .4byte gWinRegs
_08037C3C: .4byte 0x00001F1F
_08037C40:
	ldr r0, _08037D54 @ =gPlayer
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _08037C56
	ldr r0, _08037D58 @ =gNumLives
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037C5C
_08037C56:
	ldr r1, _08037D5C @ =gWinRegs
	ldr r0, _08037D60 @ =0x00003F3F
	strh r0, [r1, #8]
_08037C5C:
	movs r1, #0
	ldrsh r0, [r3, r1]
	subs r0, #0xf
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08037C72
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08037C72:
	movs r0, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08037C8C
	movs r1, #0xc
	movs r4, #0xb
_08037C8C:
	ldrh r0, [r7, #0x18]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r2, r0, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xa0
	ble _08037CA6
	movs r3, #0xa0
_08037CA6:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08037D80
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08037CC4
	ldr r0, _08037D58 @ =gNumLives
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037CDE
_08037CC4:
	ldr r2, _08037D5C @ =gWinRegs
	ldrh r0, [r7, #0x16]
	adds r0, #0x20
	lsls r0, r0, #8
	movs r1, #0xf0
	orrs r0, r1
	strh r0, [r2]
	lsls r1, r5, #0x10
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r2, #4]
_08037CDE:
	ldr r0, _08037D64 @ =gCamera
	ldrh r5, [r0]
	adds r5, #0x78
	ldrh r0, [r7, #0x16]
	subs r0, #0x58
	lsls r4, r4, #0x10
	rsbs r3, r4, #0
	asrs r3, r3, #0x10
	movs r2, #0
	str r2, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037D68 @ =0xFFFFFF00
	ldr r7, [sp, #0x10]
	ands r1, r7
	orrs r1, r0
	str r1, [sp, #0x10]
	movs r0, #0xf0
	lsls r0, r0, #0xf
	ldr r2, _08037D6C @ =0xFF00FFFF
	ands r2, r1
	orrs r2, r0
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	ldr r0, _08037D70 @ =0xFFFF00FF
	ands r0, r2
	orrs r0, r3
	str r0, [sp, #0x10]
	lsls r4, r4, #8
	ldr r1, _08037D74 @ =0x00FFFFFF
	ands r0, r1
	orrs r0, r4
	str r0, [sp, #0x10]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r0, [sp, #0x20]
	asrs r4, r0, #0x10
	str r6, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_800C1E8
	adds r6, r0, #0
	ldr r0, _08037D78 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _08037D48
	b _08037E44
_08037D48:
	ldr r0, _08037D7C @ =gPartner
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	b _08037E14
	.align 2, 0
_08037D54: .4byte gPlayer
_08037D58: .4byte gNumLives
_08037D5C: .4byte gWinRegs
_08037D60: .4byte 0x00003F3F
_08037D64: .4byte gCamera
_08037D68: .4byte 0xFFFFFF00
_08037D6C: .4byte 0xFF00FFFF
_08037D70: .4byte 0xFFFF00FF
_08037D74: .4byte 0x00FFFFFF
_08037D78: .4byte gNumSingleplayerCharacters
_08037D7C: .4byte gPartner
_08037D80:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08037D92
	ldr r0, _08037E20 @ =gNumLives
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037DA6
_08037D92:
	ldr r2, _08037E24 @ =gWinRegs
	ldrh r0, [r7, #0x16]
	subs r0, #0x20
	strh r0, [r2]
	lsls r1, r5, #0x10
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r2, #4]
_08037DA6:
	ldr r0, _08037E28 @ =gCamera
	ldrh r5, [r0]
	adds r5, #0x78
	ldrh r2, [r7, #0x16]
	subs r2, #0x98
	lsls r4, r4, #0x10
	rsbs r3, r4, #0
	asrs r3, r3, #0x10
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0x88
	ldr r0, _08037E2C @ =0xFFFFFF00
	ldr r7, [sp, #0x18]
	ands r0, r7
	orrs r0, r1
	str r0, [sp, #0x18]
	lsls r2, r2, #0x18
	lsrs r2, r2, #8
	ldr r1, _08037E30 @ =0xFF00FFFF
	ands r1, r0
	orrs r1, r2
	str r1, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	ldr r0, _08037E34 @ =0xFFFF00FF
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #0x18]
	lsls r4, r4, #8
	ldr r1, _08037E38 @ =0x00FFFFFF
	ands r0, r1
	orrs r0, r4
	str r0, [sp, #0x18]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r0, [sp, #0x20]
	asrs r4, r0, #0x10
	str r6, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_800C1E8
	adds r6, r0, #0
	ldr r0, _08037E3C @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _08037E44
	ldr r0, _08037E40 @ =gPartner
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
_08037E14:
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_800C1E8
	b _08037E46
	.align 2, 0
_08037E20: .4byte gNumLives
_08037E24: .4byte gWinRegs
_08037E28: .4byte gCamera
_08037E2C: .4byte 0xFFFFFF00
_08037E30: .4byte 0xFF00FFFF
_08037E34: .4byte 0xFFFF00FF
_08037E38: .4byte 0x00FFFFFF
_08037E3C: .4byte gNumSingleplayerCharacters
_08037E40: .4byte gPartner
_08037E44:
	movs r0, #0
_08037E46:
	orrs r6, r0
	cmp r6, #2
	beq _08037E4E
	b _0803802A
_08037E4E:
	ldr r0, _08037E74 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	ldr r1, _08037E78 @ =0x03000044
	adds r3, r2, r1
	ldr r4, _08037E7C @ =0x03000064
	adds r1, r2, r4
	movs r0, #3
	strb r0, [r1]
	ldr r0, [r3, #0x10]
	ldr r1, _08037E80 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldr r7, _08037E84 @ =0x03000065
	adds r2, r2, r7
	movs r0, #0xff
	strb r0, [r2]
	b _0803802A
	.align 2, 0
_08037E74: .4byte gCurTask
_08037E78: .4byte 0x03000044
_08037E7C: .4byte 0x03000064
_08037E80: .4byte 0xFFFFBFFF
_08037E84: .4byte 0x03000065
_08037E88:
	bl sub_8039940
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
_08037E92:
	movs r0, #4
	b _08038028
_08037E96:
	ldr r0, _08037EA8 @ =0xFFFFFE00
	str r0, [r6, #0x7c]
	adds r1, r6, #0
	adds r1, #0x92
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
	.align 2, 0
_08037EA8: .4byte 0xFFFFFE00
_08037EAC:
	adds r3, r6, #0
	adds r3, #0x92
	ldrh r0, [r3]
	cmp r0, #0
	beq _08037EC2
	mov r0, sl
	adds r0, #0x79
	movs r2, #0
	movs r1, #0xf
	strb r1, [r0]
	strh r2, [r3]
_08037EC2:
	movs r2, #0
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08037EE4
	ldr r1, [r6, #0x74]
	ldr r0, _08037EE0 @ =0x0000CFFF
	cmp r1, r0
	ble _08037EF0
	adds r0, #1
	str r0, [sp, #8]
	b _08037EF6
	.align 2, 0
_08037EE0: .4byte 0x0000CFFF
_08037EE4:
	ldr r0, [r6, #0x74]
	ldr r1, _08037F14 @ =0xFFFF3000
	cmp r0, r1
	bgt _08037EF0
	str r1, [sp, #8]
	movs r2, #0xff
_08037EF0:
	cmp r2, #0
	bne _08037EF6
	b _0803802A
_08037EF6:
	ldr r1, [sp, #8]
	str r1, [r6, #0x74]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	ldr r2, [sp, #4]
	ldr r0, [r2, #0x10]
	eors r0, r1
	str r0, [r2, #0x10]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
	.align 2, 0
_08037F14: .4byte 0xFFFF3000
_08037F18:
	movs r2, #0
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08037F38
	ldr r0, [r6, #0x74]
	ldr r1, _08037F34 @ =0xFFFF8C00
	cmp r0, r1
	blt _08037F46
	str r1, [sp, #8]
	b _08037F4A
	.align 2, 0
_08037F34: .4byte 0xFFFF8C00
_08037F38:
	ldr r0, [r6, #0x74]
	movs r1, #0xe8
	lsls r1, r1, #7
	cmp r0, r1
	bgt _08037F46
	str r1, [sp, #8]
	movs r2, #0xff
_08037F46:
	cmp r2, #0
	beq _0803802A
_08037F4A:
	ldr r3, [sp, #8]
	str r3, [r6, #0x74]
	movs r0, #0
	str r0, [r6, #0x7c]
	b _08038028
_08037F54:
	mov r0, sl
	adds r0, #0x7a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803802A
	adds r1, r6, #0
	adds r1, #0x92
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803802A
	ldr r0, _08037F7C @ =0xFFFFFD00
	str r0, [r6, #0x7c]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
	.align 2, 0
_08037F7C: .4byte 0xFFFFFD00
_08037F80:
	movs r2, #0
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08037FA4
	ldr r1, [r6, #0x74]
	ldr r0, _08037FA0 @ =0x0000CFFF
	cmp r1, r0
	ble _08037FB0
	movs r4, #0xd0
	lsls r4, r4, #8
	str r4, [sp, #8]
	b _08037FB4
	.align 2, 0
_08037FA0: .4byte 0x0000CFFF
_08037FA4:
	ldr r0, [r6, #0x74]
	ldr r1, _08037FDC @ =0xFFFF3000
	cmp r0, r1
	bgt _08037FB0
	str r1, [sp, #8]
	movs r2, #0xff
_08037FB0:
	cmp r2, #0
	beq _0803802A
_08037FB4:
	ldr r0, _08037FE0 @ =0xFFFFFE00
	str r0, [r6, #0x7c]
	mov r1, sl
	adds r1, #0x79
	movs r0, #0x13
	strb r0, [r1]
	ldr r0, [sp, #8]
	str r0, [r6, #0x74]
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	ldr r2, [sp, #4]
	ldr r0, [r2, #0x10]
	eors r0, r1
	str r0, [r2, #0x10]
	ldrb r0, [r5]
	adds r0, #1
	b _08038028
	.align 2, 0
_08037FDC: .4byte 0xFFFF3000
_08037FE0: .4byte 0xFFFFFE00
_08037FE4:
	movs r2, #0
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08038004
	ldr r0, [r6, #0x74]
	ldr r1, _08038000 @ =0xFFFF8C00
	cmp r0, r1
	blt _08038014
	str r1, [r6, #0x74]
	str r2, [r6, #0x7c]
	b _08038018
	.align 2, 0
_08038000: .4byte 0xFFFF8C00
_08038004:
	ldr r0, [r6, #0x74]
	movs r1, #0xe8
	lsls r1, r1, #7
	cmp r0, r1
	bgt _08038014
	str r1, [r6, #0x74]
	str r2, [r6, #0x7c]
	movs r2, #0xff
_08038014:
	cmp r2, #0
	beq _0803802A
_08038018:
	mov r0, sl
	adds r0, #0x7a
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803802A
	movs r0, #0
_08038028:
	strb r0, [r5]
_0803802A:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.syntax divided
