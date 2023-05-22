.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Create_KuraKura
Create_KuraKura: @ 0x08051E3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	mov r8, r2
	mov sl, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sl
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	ldr r0, _08051FD4 @ =sub_8052024
	ldr r2, _08051FD8 @ =0x00004050
	ldr r1, _08051FDC @ =sub_8052264
	str r1, [sp]
	movs r1, #0xb4
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, _08051FE0 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	adds r2, #0xa4
	adds r0, r4, r2
	movs r5, #0
	str r5, [r0]
	subs r2, #4
	adds r0, r4, r2
	str r5, [r0]
	strh r6, [r1, #4]
	mov r0, r8
	strh r0, [r1, #6]
	mov r2, sb
	str r2, [r1]
	ldrb r0, [r2]
	strb r0, [r1, #8]
	mov r0, sl
	strb r0, [r1, #9]
	ldr r2, _08051FE4 @ =IWRAM_START + 0xA4
	adds r1, r4, r2
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	lsls r0, r0, #8
	str r0, [r1]
	ldr r0, _08051FE8 @ =IWRAM_START + 0xA8
	adds r1, r4, r0
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	mov r2, r8
	lsls r2, r2, #8
	mov r8, r2
	add r0, r8
	lsls r0, r0, #8
	str r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r6
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	add r0, r8
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	movs r0, #8
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08051FEC @ =0x000001E5
	strh r0, [r7, #0xa]
	ldr r1, _08051FF0 @ =IWRAM_START + 0x2C
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _08051FF4 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08051FF8 @ =IWRAM_START + 0x2E
	adds r0, r4, r1
	movs r2, #0x10
	mov sb, r2
	mov r1, sb
	strb r1, [r0]
	ldr r2, _08051FFC @ =IWRAM_START + 0x31
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	str r2, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	ldr r0, _08052000 @ =IWRAM_START + 0x3C
	adds r7, r4, r0
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r0, #1
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf3
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r1, _08052004 @ =IWRAM_START + 0x5C
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _08052008 @ =IWRAM_START + 0x5D
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0805200C @ =IWRAM_START + 0x5E
	adds r0, r4, r1
	mov r2, sb
	strb r2, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	mov r0, r8
	str r0, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _08052010 @ =IWRAM_START + 0x6C
	adds r7, r4, r1
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08052014 @ =0x000001E7
	strh r0, [r7, #0xa]
	ldr r2, _08052018 @ =IWRAM_START + 0x8C
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #1
	adds r1, r4, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0805201C @ =IWRAM_START + 0x8E
	adds r0, r4, r1
	mov r2, sb
	strb r2, [r0]
	ldr r0, _08052020 @ =IWRAM_START + 0x91
	adds r4, r4, r0
	movs r1, #0
	strb r1, [r4]
	mov r2, r8
	str r2, [r7, #0x28]
	str r6, [r7, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051FD4: .4byte sub_8052024
_08051FD8: .4byte 0x00004050
_08051FDC: .4byte sub_8052264
_08051FE0: .4byte IWRAM_START + 0xC
_08051FE4: .4byte IWRAM_START + 0xA4
_08051FE8: .4byte IWRAM_START + 0xA8
_08051FEC: .4byte 0x000001E5
_08051FF0: .4byte IWRAM_START + 0x2C
_08051FF4: .4byte IWRAM_START + 0x2D
_08051FF8: .4byte IWRAM_START + 0x2E
_08051FFC: .4byte IWRAM_START + 0x31
_08052000: .4byte IWRAM_START + 0x3C
_08052004: .4byte IWRAM_START + 0x5C
_08052008: .4byte IWRAM_START + 0x5D
_0805200C: .4byte IWRAM_START + 0x5E
_08052010: .4byte IWRAM_START + 0x6C
_08052014: .4byte 0x000001E7
_08052018: .4byte IWRAM_START + 0x8C
_0805201C: .4byte IWRAM_START + 0x8E
_08052020: .4byte IWRAM_START + 0x91

	thumb_func_start sub_8052024
sub_8052024: @ 0x08052024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08052088 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _0805208C @ =IWRAM_START + 0xC
	adds r6, r2, r1
	ldr r0, [r0]
	mov sl, r0
	adds r1, #0x98
	adds r0, r2, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r0, _08052090 @ =IWRAM_START + 0xA8
	adds r2, r2, r0
	ldr r2, [r2]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r7, _08052094 @ =gCamera
	ldr r0, [r7]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	ldr r0, [r6, #0x10]
	ldr r3, _08052098 @ =0xFFFFFBFF
	ands r0, r3
	str r0, [r6, #0x10]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _0805209C
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _0805212E
	.align 2, 0
_08052088: .4byte gCurTask
_0805208C: .4byte IWRAM_START + 0xC
_08052090: .4byte IWRAM_START + 0xA8
_08052094: .4byte gCamera
_08052098: .4byte 0xFFFFFBFF
_0805209C:
	ldr r1, [r7]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _080520C2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _080520C2
	ldr r1, [r7, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _080520C2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _080520FC
_080520C2:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080520E6
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080520E6
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080520FC
_080520E6:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _080520F8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805212E
	.align 2, 0
_080520F8: .4byte gCurTask
_080520FC:
	mov r0, r8
	adds r0, #0xa4
	ldr r0, [r0]
	mov r1, r8
	adds r1, #0xa8
	ldr r1, [r1]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_80051E8
	mov r0, r8
	bl sub_805213C
_0805212E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805213C
sub_805213C: @ 0x0805213C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	adds r0, #0x3c
	str r0, [sp, #0x14]
	movs r2, #0x6c
	adds r2, r2, r4
	mov sb, r2
	adds r3, r4, #0
	adds r3, #0xac
	ldr r2, _08052254 @ =gSineTable
	ldr r0, _08052258 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #2
	ldr r1, _0805225C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	ands r0, r1
	str r0, [r3]
	movs r5, #0
	mov r8, r2
	adds r6, r3, #0
	ldr r3, _08052260 @ =gCamera
	adds r7, r4, #0
	adds r7, #0xa8
	str r7, [sp, #0xc]
	str r6, [sp, #8]
	movs r0, #0xa4
	adds r0, r0, r4
	mov sl, r0
_08052188:
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r6]
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0xb
	subs r2, r2, r5
	asrs r0, r2
	adds r1, r1, r0
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r7, [sp, #0x14]
	strh r1, [r7, #0x16]
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r6]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	asrs r0, r2
	adds r1, r1, r0
	ldr r0, [r3, #4]
	subs r1, r1, r0
	ldr r0, [sp, #0x14]
	strh r1, [r0, #0x18]
	ldr r0, [sp, #0x14]
	str r3, [sp, #0x10]
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x10]
	cmp r5, #1
	bls _08052188
	mov r2, sl
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r4, _08052254 @ =gSineTable
	ldr r7, [sp, #8]
	ldr r3, [r7]
	lsls r0, r3, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x19
	adds r1, r1, r2
	asrs r0, r0, #0x1b
	subs r1, r1, r0
	str r1, [sp]
	ldr r0, [sp, #0xc]
	ldr r2, [r0]
	asrs r2, r2, #8
	movs r7, #0x80
	lsls r7, r7, #1
	adds r3, r3, r7
	lsls r3, r3, #1
	adds r3, r3, r4
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x19
	adds r2, r2, r3
	asrs r0, r0, #0x1b
	subs r2, r2, r0
	str r2, [sp, #4]
	ldr r3, _08052260 @ =gCamera
	ldr r0, [r3]
	adds r4, r1, #0
	subs r0, r4, r0
	mov r7, sb
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	strh r0, [r7, #0x18]
	mov r0, sb
	bl sub_800C84C
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052254: .4byte gSineTable
_08052258: .4byte gUnknown_03005590
_0805225C: .4byte 0x000003FF
_08052260: .4byte gCamera

	thumb_func_start sub_8052264
sub_8052264: @ 0x08052264
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
