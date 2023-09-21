.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D6736
gUnknown_080D6736:
    .incbin "baserom.gba", 0x000D6736, 0x1CC
    
.text
.syntax unified
.arm

.if 0
@ Similar to sub_80228C0, sub_80229EC, sub_8022B18
	thumb_func_start sub_8022C44
sub_8022C44: @ 0x08022C44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov sl, r2
	str r2, [sp]
	ldr r3, _08022CD8 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022CD8 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022CBA
	adds r1, r6, #0
_08022CBA:
	cmp r1, #0
	beq _08022D18
	cmp r1, #0
	bge _08022CDC
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022D58
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022D1C
	b _08022D22
	.align 2, 0
_08022CD8: .4byte sub_801ED24
_08022CDC:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022CE6
	rsbs r0, r0, #0
_08022CE6:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022CF0
	movs r0, #0xb
_08022CF0:
	cmp r1, r0
	bgt _08022D0A
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022D04
	mov r2, sl
	b _08022D24
_08022D04:
	mov r3, sb
	ldrb r0, [r3]
	b _08022D26
_08022D0A:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022D58
_08022D18:
	cmp r6, r2
	bge _08022D22
_08022D1C:
	mov r1, sl
	ldrb r0, [r1]
	b _08022D26
_08022D22:
	mov r2, sb
_08022D24:
	ldrb r0, [r2]
_08022D26:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022D58
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022D68 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022D58
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022D58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022D68: .4byte gUnknown_03005424
.endif

	thumb_func_start sub_8022D6C
sub_8022D6C: @ 0x08022D6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r1, #0
	ldr r3, [r4, #0x20]
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08022D8C
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	b _08022F4E
_08022D8C:
	ldr r0, _08022E40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	adds r7, #0x24
	cmp r0, #0
	bne _08022E90
	ldr r0, _08022E44 @ =gUnknown_03005660
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08022E90
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	asrs r5, r0, #0x10
	movs r2, #4
	rsbs r2, r2, #0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	mov r8, r1
	mov r6, ip
	movs r1, #4
	ldrsh r0, [r6, r1]
	mov r6, r8
	subs r0, r0, r6
	ands r0, r2
	lsls r0, r0, #0x10
	ands r5, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	bne _08022E78
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022E78
	ldrb r0, [r7]
	adds r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	bhi _08022E78
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08022E78
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08022DF4
	rsbs r1, r1, #0
_08022DF4:
	ldr r0, _08022E48 @ =0x000005FF
	cmp r1, r0
	ble _08022E78
	adds r0, r4, #0
	bl sub_80228C0
	lsls r1, r5, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	blt _08022E54
	ldr r1, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xa
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08022E26
	orrs r1, r2
	str r1, [r4, #0x20]
	ldr r0, _08022E4C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08022E26
	bl sub_80117F0
_08022E26:
	ldr r0, _08022E50 @ =0x00000119
	bl m4aSongNumStartOrContinue
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strb r0, [r7]
	ldr r0, [r4, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	b _08022E6A
	.align 2, 0
_08022E40: .4byte gCurrentLevel
_08022E44: .4byte gUnknown_03005660
_08022E48: .4byte 0x000005FF
_08022E4C: .4byte gGameMode
_08022E50: .4byte 0x00000119
_08022E54:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E66
	ldr r0, _08022E70 @ =0x00000119
	bl m4aSongNumStop
_08022E66:
	ldr r0, [r4, #0x20]
	ldr r1, _08022E74 @ =0xFFFDFFFF
_08022E6A:
	ands r0, r1
	str r0, [r4, #0x20]
	b _08022F4E
	.align 2, 0
_08022E70: .4byte 0x00000119
_08022E74: .4byte 0xFFFDFFFF
_08022E78:
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E90
	ldr r0, _08022EC0 @ =0xFFFDFFFF
	ands r1, r0
	str r1, [r4, #0x20]
	ldr r0, _08022EC4 @ =0x00000119
	bl m4aSongNumStop
_08022E90:
	ldr r0, _08022EC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022EF4
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r0, r0, #0x18
	subs r0, #0x40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022ECC
	cmp r0, #0
	bgt _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
	.align 2, 0
_08022EC0: .4byte 0xFFFDFFFF
_08022EC4: .4byte 0x00000119
_08022EC8: .4byte gUnknown_03005424
_08022ECC:
	cmp r0, #0
	ble _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
_08022ED4:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022ED8:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	ble _08022F20
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	bne _08022F4E
	adds r0, r4, #0
	bl sub_8022C44
	b _08022F4E
_08022EF4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022F08
	cmp r0, #0
	bgt _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F08:
	cmp r0, #0
	ble _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F10:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022F14:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	bgt _08022F26
_08022F20:
	cmp r0, #0
	beq _08022F30
	b _08022F4E
_08022F26:
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	beq _08022F48
	b _08022F4E
_08022F30:
	adds r0, r4, #0
	bl sub_80228C0
	b _08022F4E
_08022F38:
	adds r0, r4, #0
	bl sub_80229EC
	b _08022F4E
_08022F40:
	adds r0, r4, #0
	bl sub_8022B18
	b _08022F4E
_08022F48:
	adds r0, r4, #0
	bl sub_8022C44
_08022F4E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
