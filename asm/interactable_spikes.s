.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 00
	thumb_func_start initSprite_Interactable_Spikes_Up
initSprite_Interactable_Spikes_Up: @ 0x0805F618
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0              @ r8 = ia
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10      @ r4 = spriteRegionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10      @ r5 = spriteRegionY
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18      @ r6 = spriteY
	ldr r0, _0805F6B0 @ =sub_805F810
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov sb, r1              @ sb = 0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0     @ r0 = spikes
	ldr r3, _0805F6B4 @ =IWRAM_START + 0xC
	adds r2, r1, r3     @ r2 = s
	mov r1, sb
	str r1, [r0, #0x40]
	str r1, [r0, #0x3c]
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r3, r8
	str r3, [r0]
	ldrb r1, [r3]
	strb r1, [r0, #8]
	strb r6, [r0, #9]
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r2, #0x16]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r2, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r3]
	ldr r0, _0805F6B8 @ =0x06011980
	str r0, [r2, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	mov r3, sb
	strh r3, [r2, #8]
	ldr r0, _0805F6BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0805F6C8
	ldr r1, _0805F6C0 @ =sSpikesOfZone
	ldr r0, _0805F6C4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0805F6CA
	.align 2, 0
_0805F6B0: .4byte sub_805F810
_0805F6B4: .4byte IWRAM_START + 0xC
_0805F6B8: .4byte 0x06011980
_0805F6BC: .4byte gGameMode
_0805F6C0: .4byte sSpikesOfZone
_0805F6C4: .4byte gCurrentLevel
_0805F6C8:
	ldr r0, _0805F710 @ =0x0000021E
_0805F6CA:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x1c]
	adds r3, r2, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F710: .4byte 0x0000021E
.endif

	thumb_func_start initSprite_Interactable_Spikes_Down
initSprite_Interactable_Spikes_Down: @ 0x0805F714
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0805F7EC @ =sub_805F928
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0805F7F0 @ =IWRAM_START + 0xC
	adds r0, r3, r2
	mov r7, sb
	str r7, [r1, #0x40]
	str r7, [r1, #0x3c]
	movs r2, #0
	mov sl, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, r8
	str r7, [r1]
	ldrb r2, [r7]
	strb r2, [r1, #8]
	strb r6, [r1, #9]
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r4, r4, #8
	adds r1, r1, r4
	strh r1, [r0, #0x16]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	lsls r5, r5, #8
	adds r1, r1, r5
	strh r1, [r0, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r7]
	ldr r1, _0805F7F4 @ =0x06011980
	str r1, [r0, #4]
	movs r1, #0x88
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	ldr r2, _0805F7F8 @ =sSpikesOfZone
	ldr r1, _0805F7FC @ =gCurrentLevel
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldr r7, _0805F800 @ =IWRAM_START + 0x2C
	adds r1, r3, r7
	mov r2, sl
	strb r2, [r1]
	mov r7, sb
	strh r7, [r0, #0x14]
	mov r1, sb
	strh r1, [r0, #0x1c]
	ldr r7, _0805F804 @ =IWRAM_START + 0x2D
	adds r2, r3, r7
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _0805F808 @ =IWRAM_START + 0x2E
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _0805F80C @ =IWRAM_START + 0x31
	adds r3, r3, r2
	mov r7, sl
	strb r7, [r3]
	subs r1, #0x11
	str r1, [r0, #0x28]
	movs r1, #0xa8
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7EC: .4byte sub_805F928
_0805F7F0: .4byte IWRAM_START + 0xC
_0805F7F4: .4byte 0x06011980
_0805F7F8: .4byte sSpikesOfZone
_0805F7FC: .4byte gCurrentLevel
_0805F800: .4byte IWRAM_START + 0x2C
_0805F804: .4byte IWRAM_START + 0x2D
_0805F808: .4byte IWRAM_START + 0x2E
_0805F80C: .4byte IWRAM_START + 0x31

	thumb_func_start sub_805F810
sub_805F810: @ 0x0805F810
	push {r4, r5, r6, lr}
	ldr r0, _0805F868 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805F86C @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	ldr r0, _0805F870 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805F878
	ldr r3, _0805F874 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80601F8
	b _0805F884
	.align 2, 0
_0805F868: .4byte gCurTask
_0805F86C: .4byte gCamera
_0805F870: .4byte gUnknown_03005424
_0805F874: .4byte gPlayer
_0805F878:
	ldr r3, _0805F900 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_8060440
_0805F884:
	ldr r0, _0805F904 @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #5
	bne _0805F8CE
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805F8CE
	ldr r0, _0805F908 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805F8CE
	ldr r0, [r4, #0x3c]
	movs r1, #0xc0
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0805F8B6
	ldr r0, _0805F900 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805F8B6:
	ldr r0, [r4, #0x3c]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0805F8CE
	ldr r0, _0805F900 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #9
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805F8CE:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805F8F2
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805F8F2
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805F910
_0805F8F2:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, _0805F90C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805F922
	.align 2, 0
_0805F900: .4byte gPlayer
_0805F904: .4byte gGameMode
_0805F908: .4byte gUnknown_030053E0
_0805F90C: .4byte gCurTask
_0805F910:
	ldrb r0, [r3]
	cmp r0, #5
	beq _0805F91C
	adds r0, r5, #0
	bl sub_8004558
_0805F91C:
	adds r0, r5, #0
	bl sub_80051E8
_0805F922:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_805F928
sub_805F928: @ 0x0805F928
	push {r4, r5, r6, lr}
	ldr r0, _0805F998 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805F99C @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	ldr r0, _0805F9A0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0805F97E
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805F97E
	ldr r0, _0805F9A4 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805F9BC
_0805F97E:
	ldr r0, _0805F9A8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805F9B0
	ldr r3, _0805F9AC @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_8060440
	b _0805F9BC
	.align 2, 0
_0805F998: .4byte gCurTask
_0805F99C: .4byte gCamera
_0805F9A0: .4byte gGameMode
_0805F9A4: .4byte gUnknown_030053E0
_0805F9A8: .4byte gUnknown_03005424
_0805F9AC: .4byte gPlayer
_0805F9B0:
	ldr r3, _0805FA34 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80601F8
_0805F9BC:
	ldr r0, _0805FA38 @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #5
	bne _0805FA02
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805FA02
	ldr r0, _0805FA3C @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805FA02
	ldr r0, [r4, #0x3c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F9EC
	ldr r0, _0805FA34 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805F9EC:
	ldr r0, [r4, #0x3c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805FA02
	ldr r0, _0805FA34 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #9
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805FA02:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805FA26
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805FA26
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805FA44
_0805FA26:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, _0805FA40 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805FA66
	.align 2, 0
_0805FA34: .4byte gPlayer
_0805FA38: .4byte gGameMode
_0805FA3C: .4byte gUnknown_030053E0
_0805FA40: .4byte gCurTask
_0805FA44:
	ldrb r0, [r3]
	cmp r0, #5
	bne _0805FA5A
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805FA5A
	ldr r0, _0805FA6C @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FA66
_0805FA5A:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0805FA66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA6C: .4byte gUnknown_030053E0

	thumb_func_start initSprite_Interactable_Spikes_LeftRight
initSprite_Interactable_Spikes_LeftRight: @ 0x0805FA70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0805FB50 @ =sub_805FBA0
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0805FB54 @ =TaskDestructor_8060CF4
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r6, r0
	ldr r1, _0805FB58 @ =IWRAM_START + 0xC
	adds r7, r6, r1
	movs r2, #0
	str r2, [r0, #0x40]
	str r2, [r0, #0x3c]
	movs r3, #0
	mov sb, r3
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sl
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r3, r8
	strb r3, [r0, #9]
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r1]
	movs r0, #0x10
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r7, #8]
	ldr r1, _0805FB5C @ =sSpikesOfZone
	ldr r0, _0805FB60 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r0, _0805FB64 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r2, _0805FB68 @ =IWRAM_START + 0x2D
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r3, _0805FB6C @ =IWRAM_START + 0x2E
	adds r1, r6, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805FB70 @ =IWRAM_START + 0x31
	adds r6, r6, r0
	mov r1, sb
	strb r1, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	ldr r0, _0805FB74 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0805FB78
	mov r2, sl
	ldrb r0, [r2, #2]
	b _0805FB7C
	.align 2, 0
_0805FB50: .4byte sub_805FBA0
_0805FB54: .4byte TaskDestructor_8060CF4
_0805FB58: .4byte IWRAM_START + 0xC
_0805FB5C: .4byte sSpikesOfZone
_0805FB60: .4byte gCurrentLevel
_0805FB64: .4byte IWRAM_START + 0x2C
_0805FB68: .4byte IWRAM_START + 0x2D
_0805FB6C: .4byte IWRAM_START + 0x2E
_0805FB70: .4byte IWRAM_START + 0x31
_0805FB74: .4byte gGameMode
_0805FB78:
	mov r3, sl
	ldrb r0, [r3, #2]
_0805FB7C:
	cmp r0, #0x19
	bne _0805FB88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0805FB88:
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_805FBA0
sub_805FBA0: @ 0x0805FBA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805FCAC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _0805FCB0 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov sl, r0
	ldr r1, [sp, #4]
	ldr r1, [r1]
	str r1, [sp]
	ldr r3, [sp, #4]
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _0805FCB4 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, sl
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r3, sl
	strh r1, [r3, #0x18]
	ldr r0, _0805FCB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0805FC16
	ldr r1, [sp]
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0805FC16
	ldr r0, _0805FCBC @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805FC16
	b _0805FDA4
_0805FC16:
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	ldr r5, _0805FCC0 @ =gPlayer
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r4, r0, #0
	ldr r0, _0805FCC4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0
	beq _0805FCC8
	movs r2, #0x80
	lsls r2, r2, #9
	mov r8, r2
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _0805FC6C
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r2, #0
	strh r2, [r5, #0x12]
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
_0805FC6C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r4
	cmp r0, #0
	beq _0805FD12
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq _0805FD12
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	mov r0, sl
	str r0, [r5, #0x3c]
	b _0805FD12
	.align 2, 0
_0805FCAC: .4byte gCurTask
_0805FCB0: .4byte IWRAM_START + 0xC
_0805FCB4: .4byte gCamera
_0805FCB8: .4byte gGameMode
_0805FCBC: .4byte gUnknown_030053E0
_0805FCC0: .4byte gPlayer
_0805FCC4: .4byte gUnknown_03005424
_0805FCC8:
	movs r1, #0x80
	lsls r1, r1, #9
	mov r8, r1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0805FCF8
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _0805FCF8
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r3, sb
	strh r3, [r5, #0x12]
_0805FCF8:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r4
	cmp r0, #0
	beq _0805FD12
	ldr r2, _0805FD5C @ =gPlayer
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	movs r0, #0
	strh r0, [r2, #0x12]
_0805FD12:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r4
	cmp r3, #0
	beq _0805FD60
	ldr r2, _0805FD5C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r4, r0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r0, #0
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x14]
	movs r0, #0x19
	ldr r3, [sp]
	ldrb r3, [r3, #2]
	cmp r0, r3
	beq _0805FDA4
	adds r0, r2, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0805FDA4
	movs r0, #0x9a
	bl m4aSongNumStart
	b _0805FDA4
	.align 2, 0
_0805FD5C: .4byte gPlayer
_0805FD60:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq _0805FDA4
	ldr r2, _0805FE28 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r4, r0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	strh r3, [r2, #0x10]
	strh r3, [r2, #0x14]
	movs r0, #0x19
	ldr r3, [sp]
	ldrb r3, [r3, #2]
	cmp r0, r3
	bne _0805FDA4
	adds r0, r2, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0805FDA4
	movs r0, #0x9a
	bl m4aSongNumStart
_0805FDA4:
	ldr r0, _0805FE2C @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #5
	bne _0805FDF0
	ldr r1, [sp]
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0805FDF0
	ldr r0, _0805FE30 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805FDF0
	ldr r2, [sp, #4]
	ldr r0, [r2, #0x3c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FDD8
	ldr r0, _0805FE28 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805FDD8:
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x3c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805FDF0
	ldr r0, _0805FE28 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #9
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805FDF0:
	mov r2, sl
	ldrh r0, [r2, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805FE16
	movs r1, #0x18
	ldrsh r0, [r2, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805FE16
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805FE38
_0805FE16:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _0805FE34 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805FE5C
	.align 2, 0
_0805FE28: .4byte gPlayer
_0805FE2C: .4byte gGameMode
_0805FE30: .4byte gUnknown_030053E0
_0805FE34: .4byte gCurTask
_0805FE38:
	ldrb r0, [r3]
	cmp r0, #5
	bne _0805FE50
	ldr r3, [sp]
	movs r0, #3
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0805FE50
	ldr r0, _0805FE6C @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FE5C
_0805FE50:
	mov r0, sl
	bl sub_8004558
	mov r0, sl
	bl sub_80051E8
_0805FE5C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FE6C: .4byte gUnknown_030053E0

	thumb_func_start initSprite_Interactable_Spikes_HidingUp
initSprite_Interactable_Spikes_HidingUp: @ 0x0805FE70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0805FF48 @ =sub_805FF68
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0805FF4C @ =TaskDestructor_8060CF4
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _0805FF50 @ =IWRAM_START + 0xC
	adds r5, r2, r1
	movs r3, #0
	str r3, [r0, #0x40]
	str r3, [r0, #0x3c]
	movs r7, #0
	mov sl, r7
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	movs r0, #0x10
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r5, #8]
	ldr r0, _0805FF54 @ =0x0000FFFF
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r0, _0805FF58 @ =IWRAM_START + 0x2C
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r7, _0805FF5C @ =IWRAM_START + 0x2D
	adds r1, r2, r7
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _0805FF60 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0805FF64 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	mov r7, sl
	strb r7, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF48: .4byte sub_805FF68
_0805FF4C: .4byte TaskDestructor_8060CF4
_0805FF50: .4byte IWRAM_START + 0xC
_0805FF54: .4byte 0x0000FFFF
_0805FF58: .4byte IWRAM_START + 0x2C
_0805FF5C: .4byte IWRAM_START + 0x2D
_0805FF60: .4byte IWRAM_START + 0x2E
_0805FF64: .4byte IWRAM_START + 0x31

	thumb_func_start sub_805FF68
sub_805FF68: @ 0x0805FF68
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r0, #0
	str r0, [sp, #4]
	ldr r4, _0805FFD8 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805FFDC @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0805FFCC
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805FFCC
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0805FFE0
_0805FFCC:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, [r4]
	bl TaskDestroy
	b _08060028
	.align 2, 0
_0805FFD8: .4byte gCurTask
_0805FFDC: .4byte gCamera
_0805FFE0:
	ldr r0, _08060000 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060008
	ldr r3, _08060004 @ =gPlayer
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8060554
	b _08060018
	.align 2, 0
_08060000: .4byte gUnknown_03005424
_08060004: .4byte gPlayer
_08060008:
	ldr r3, _08060030 @ =gPlayer
	add r1, sp, #4
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_80609B4
_08060018:
	cmp r0, #0
	beq _08060028
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08060028:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060030: .4byte gPlayer

	thumb_func_start initSprite_Interactable_Spikes_HidingDown
initSprite_Interactable_Spikes_HidingDown: @ 0x08060034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0806010C @ =sub_806012C
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08060110 @ =TaskDestructor_8060CF4
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _08060114 @ =IWRAM_START + 0xC
	adds r5, r2, r1
	movs r3, #0
	str r3, [r0, #0x40]
	str r3, [r0, #0x3c]
	movs r7, #0
	mov sl, r7
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	movs r0, #0x10
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r5, #8]
	ldr r0, _08060118 @ =0x0000FFFF
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r0, _0806011C @ =IWRAM_START + 0x2C
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r7, _08060120 @ =IWRAM_START + 0x2D
	adds r1, r2, r7
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _08060124 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08060128 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	mov r7, sl
	strb r7, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	movs r0, #0xa8
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806010C: .4byte sub_806012C
_08060110: .4byte TaskDestructor_8060CF4
_08060114: .4byte IWRAM_START + 0xC
_08060118: .4byte 0x0000FFFF
_0806011C: .4byte IWRAM_START + 0x2C
_08060120: .4byte IWRAM_START + 0x2D
_08060124: .4byte IWRAM_START + 0x2E
_08060128: .4byte IWRAM_START + 0x31

	thumb_func_start sub_806012C
sub_806012C: @ 0x0806012C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r0, #0
	str r0, [sp, #4]
	ldr r4, _0806019C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _080601A0 @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08060190
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08060190
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080601A4
_08060190:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, [r4]
	bl TaskDestroy
	b _080601EC
	.align 2, 0
_0806019C: .4byte gCurTask
_080601A0: .4byte gCamera
_080601A4:
	ldr r0, _080601C4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080601CC
	ldr r3, _080601C8 @ =gPlayer
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_80609B4
	b _080601DC
	.align 2, 0
_080601C4: .4byte gUnknown_03005424
_080601C8: .4byte gPlayer
_080601CC:
	ldr r3, _080601F4 @ =gPlayer
	add r1, sp, #4
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8060554
_080601DC:
	cmp r0, #0
	beq _080601EC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080601EC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080601F4: .4byte gPlayer

	thumb_func_start sub_80601F8
sub_80601F8: @ 0x080601F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _080602C8 @ =gCamera
	ldr r0, [r2]
	lsrs r7, r3, #0x10
	mov sl, r7
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r2, r1, #0x10
	mov sb, r2
	asrs r7, r1, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	ldr r0, _080602CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080602FC
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080602FC
	ldr r0, _080602D0 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _080602FC
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r8, r0
	cmp r0, #0
	beq _080602FC
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080602A4
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
_080602A4:
	ldr r0, _080602D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080602D8
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _080602EE
	.align 2, 0
_080602C8: .4byte gCamera
_080602CC: .4byte gGameMode
_080602D0: .4byte gUnknown_030053E0
_080602D4: .4byte gUnknown_03005424
_080602D8:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_080602EE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	bne _080603C6
_080602FC:
	ldr r1, [r5, #0x20]
	lsrs r7, r1, #3
	movs r0, #1
	ands r7, r0
	lsrs r1, r1, #1
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	ldr r0, [r5, #0x3c]
	str r0, [sp, #8]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	beq _0806042C
	movs r3, #0xc0
	lsls r3, r3, #0xa
	ands r3, r2
	cmp r3, #0
	beq _08060404
	ldr r0, _08060388 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	beq _0806038C
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0806042C
	movs r0, #0
	strh r0, [r5, #0x12]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r4, r0
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
	b _080603BC
	.align 2, 0
_08060388: .4byte gUnknown_03005424
_0806038C:
	movs r0, #0x80
	lsls r0, r0, #9
	mov sb, r0
	ands r2, r0
	cmp r2, #0
	beq _0806042C
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _080603D0
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	ldr r1, [r5, #0xc]
	adds r1, r1, r0
	str r1, [r5, #0xc]
	mov r2, sl
	strh r2, [r5, #0x12]
_080603BC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0806042C
_080603C6:
	movs r0, #0x9a
	bl m4aSongNumStart
	movs r0, #1
	b _0806042E
_080603D0:
	cmp r7, #0
	beq _080603DC
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	b _080603E4
_080603DC:
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
_080603E4:
	str r0, [r5, #0x20]
	mov r7, r8
	cmp r7, #0
	beq _080603F4
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	b _080603FC
_080603F4:
	ldr r0, [r5, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
_080603FC:
	str r0, [r5, #0x20]
	ldr r0, [sp, #8]
	str r0, [r5, #0x3c]
	b _0806042C
_08060404:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0806042C
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0806042C:
	movs r0, #0
_0806042E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8060440
sub_8060440: @ 0x08060440
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _080604C8 @ =gCamera
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r7, r1, #0x10
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0806054A
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	beq _0806054A
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _080604D0
	ldr r0, _080604CC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080604D0
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r5, r0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	adds r0, #1
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	strh r3, [r4, #0x12]
	strh r3, [r4, #0x14]
	b _08060508
	.align 2, 0
_080604C8: .4byte gCamera
_080604CC: .4byte gUnknown_03005424
_080604D0:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08060520
	ldr r0, _0806051C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08060520
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	subs r0, #1
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_08060508:
	adds r0, r4, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0806054A
	movs r0, #0x9a
	bl m4aSongNumStart
	movs r0, #1
	b _0806054C
	.align 2, 0
_0806051C: .4byte gUnknown_03005424
_08060520:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0806054A
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0806054A:
	movs r0, #0
_0806054C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8060554
sub_8060554: @ 0x08060554
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r2
	adds r5, r3, #0
	ldr r0, _080605F4 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0
	str r4, [sp, #0xc]
	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _080605F8 @ =gCamera
	ldr r0, [r3]
	lsrs r7, r2, #0x10
	str r7, [sp, #8]
	asrs r2, r2, #0x10
	mov r8, r2
	subs r0, r2, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	asrs r7, r1, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	cmp r4, #0x3b
	bhi _080605FC
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080605D0
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _080605D0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_080605D0:
	mov r0, sl
	lsls r1, r0, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080605F0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_080605F0:
	movs r0, #0
	b _0806099A
	.align 2, 0
_080605F4: .4byte gUnknown_03005590
_080605F8: .4byte gCamera
_080605FC:
	cmp r4, #0x3d
	bhi _08060660
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806061C
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0806061C
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0806061C:
	mov r2, sl
	lsls r1, r2, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0806063C
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_0806063C:
	ldr r1, _08060658 @ =sSpikesOfZone
	ldr r0, _0806065C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060928
	.align 2, 0
_08060658: .4byte sSpikesOfZone
_0806065C: .4byte gCurrentLevel
_08060660:
	cmp r4, #0x3f
	bhi _08060686
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060680
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060680
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060680:
	mov r3, sl
	lsls r1, r3, #2
	b _080608F4
_08060686:
	cmp r4, #0x7b
	bls _0806068C
	b _080608CE
_0806068C:
	adds r2, r6, #0
	adds r2, #0x20
	ldrb r0, [r2]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _080606AA
	cmp r1, #0
	bne _080606A0
	b _080607EA
_080606A0:
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	bne _080606AA
	b _080607EA
_080606AA:
	cmp r1, #0
	bne _080606B4
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_080606B4:
	ldr r1, _0806074C @ =sSpikesOfZone
	ldr r0, _08060750 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r2]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _08060786
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _080606FC
	b _08060998
_080606FC:
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _08060754 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060758
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _0806076E
	.align 2, 0
_0806074C: .4byte sSpikesOfZone
_08060750: .4byte gCurrentLevel
_08060754: .4byte gUnknown_03005424
_08060758:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_0806076E:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
_08060772:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	bne _0806077E
	b _08060998
_0806077E:
	movs r0, #0x9a
	bl m4aSongNumStart
	b _08060998
_08060786:
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	bne _0806079A
	b _08060998
_0806079A:
	movs r4, #0x80
	lsls r4, r4, #9
	adds r3, r2, #0
	ands r3, r4
	cmp r3, #0
	beq _080607BE
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	ands r2, r4
	cmp r2, #0
	bne _080607BC
	b _08060998
_080607BC:
	b _08060772
_080607BE:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	bne _080607CA
	b _08060998
_080607CA:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
	b _08060998
_080607EA:
	ldr r7, [sp, #8]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r3, #0x10
	asrs r7, r4, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	adds r3, r4, #0
	cmp r2, #0
	beq _080608BE
	movs r4, #0x80
	lsls r4, r4, #9
	ands r0, r4
	cmp r0, #0
	beq _08060844
	ldr r0, _08060840 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060844
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	ands r2, r4
	cmp r2, #0
	beq _080608BE
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _080608BE
	b _0806077E
	.align 2, 0
_08060840: .4byte gUnknown_03005424
_08060844:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08060894
	ldr r0, _08060890 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08060894
	asrs r0, r3, #0x10
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _080608BE
	b _0806077E
	.align 2, 0
_08060890: .4byte gUnknown_03005424
_08060894:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _080608BE
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_080608BE:
	mov r2, sl
	lsls r0, r2, #2
	mov r1, sb
	adds r1, #0x3c
	adds r1, r1, r0
	ldr r0, [r5, #0x20]
	str r0, [r1]
	b _08060998
_080608CE:
	ldr r3, [sp, #0xc]
	cmp r3, #0x7d
	bhi _0806093C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080608F0
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _080608F0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_080608F0:
	mov r4, sl
	lsls r1, r4, #2
_080608F4:
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060910
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060910:
	ldr r1, _08060934 @ =sSpikesOfZone
	ldr r0, _08060938 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060928:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b _08060998
	.align 2, 0
_08060934: .4byte sSpikesOfZone
_08060938: .4byte gCurrentLevel
_0806093C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060958
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060958
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060958:
	mov r7, sl
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060978
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060978:
	ldr r1, _080609AC @ =sSpikesOfZone
	ldr r0, _080609B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
_08060998:
	movs r0, #1
_0806099A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080609AC: .4byte sSpikesOfZone
_080609B0: .4byte gCurrentLevel

	thumb_func_start sub_80609B4
sub_80609B4: @ 0x080609B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r7, r2, #0
	adds r5, r3, #0
	ldr r0, _08060A58 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0
	str r4, [sp, #0xc]
	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08060A5C @ =gCamera
	ldr r0, [r3]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #8]
	asrs r2, r2, #0x10
	mov r8, r2
	mov r0, sb
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	cmp r4, #0x3b
	bhi _08060A60
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A34
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A34
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A34:
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060A54
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060A54:
	movs r0, #0
	b _08060CDA
	.align 2, 0
_08060A58: .4byte gUnknown_03005590
_08060A5C: .4byte gCamera
_08060A60:
	cmp r4, #0x3d
	bhi _08060AC4
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A80
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A80
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A80:
	mov r4, sl
	lsls r1, r4, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060AA0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060AA0:
	ldr r1, _08060ABC @ =sSpikesOfZone
	ldr r0, _08060AC0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060C68
	.align 2, 0
_08060ABC: .4byte sSpikesOfZone
_08060AC0: .4byte gCurrentLevel
_08060AC4:
	cmp r4, #0x3f
	bhi _08060AEA
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060AE4
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060AE4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060AE4:
	mov r0, sl
	lsls r1, r0, #2
	b _08060C34
_08060AEA:
	cmp r4, #0x7b
	bls _08060AF0
	b _08060C0E
_08060AF0:
	adds r3, r6, #0
	adds r3, #0x20
	ldrb r0, [r3]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _08060B0A
	cmp r1, #0
	beq _08060BD4
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	beq _08060BD4
_08060B0A:
	cmp r1, #0
	bne _08060B14
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_08060B14:
	ldr r1, _08060BAC @ =sSpikesOfZone
	ldr r0, _08060BB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	beq _08060B46
	b _08060CD8
_08060B46:
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08060B5E
	b _08060CD8
_08060B5E:
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _08060BB4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060BB8
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _08060BCE
	.align 2, 0
_08060BAC: .4byte sSpikesOfZone
_08060BB0: .4byte gCurrentLevel
_08060BB4: .4byte gUnknown_03005424
_08060BB8:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_08060BCE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	b _08060BFC
_08060BD4:
	ldr r4, [sp, #8]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r1, sl
	lsls r2, r1, #2
	adds r1, r7, #0
	adds r1, #0x3c
	adds r1, r1, r2
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08060CD8
_08060BFC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _08060CD8
	movs r0, #0x9a
	bl m4aSongNumStart
	b _08060CD8
_08060C0E:
	ldr r2, [sp, #0xc]
	cmp r2, #0x7d
	bhi _08060C7C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C30
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C30
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C30:
	mov r4, sl
	lsls r1, r4, #2
_08060C34:
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060C50
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060C50:
	ldr r1, _08060C74 @ =sSpikesOfZone
	ldr r0, _08060C78 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060C68:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b _08060CD8
	.align 2, 0
_08060C74: .4byte sSpikesOfZone
_08060C78: .4byte gCurrentLevel
_08060C7C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C98
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C98
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C98:
	mov r0, sl
	lsls r1, r0, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060CB8
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060CB8:
	ldr r1, _08060CEC @ =sSpikesOfZone
	ldr r0, _08060CF0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
_08060CD8:
	movs r0, #1
_08060CDA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060CEC: .4byte sSpikesOfZone
_08060CF0: .4byte gCurrentLevel

	thumb_func_start TaskDestructor_8060CF4
TaskDestructor_8060CF4: @ 0x08060CF4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8060D08
sub_8060D08: @ 0x08060D08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r4, [r5]
	adds r4, #1
	strb r4, [r5]
	adds r6, r0, #0
	adds r6, #0x2e
	ldrb r4, [r6]
	subs r4, #1
	strb r4, [r6]
	bl sub_800CCB8
	ldrb r1, [r5]
	subs r1, #1
	strb r1, [r5]
	ldrb r1, [r6]
	adds r1, #1
	strb r1, [r6]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
