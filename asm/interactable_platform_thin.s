.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D5468
gUnknown_080D5468:
    .incbin "baserom.gba", 0x000D5468, 0x36
    
    .global gUnknown_080D549E
gUnknown_080D549E:
    .incbin "baserom.gba", 0x000D549E, 0x6E

.text
.syntax unified
.arm

	thumb_func_start sub_8010F78
sub_8010F78: @ 0x08010F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08010FB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r7, r1, r0
	ldr r3, _08010FB4 @ =IWRAM_START + 0xF0
	add r3, r8
	str r3, [sp]
	ldrh r0, [r3]
	adds r1, r0, #1
	strh r1, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _08010FB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08011188
	.align 2, 0
_08010FB0: .4byte gCurTask
_08010FB4: .4byte IWRAM_START + 0xF0
_08010FB8:
	ldr r0, _08011198 @ =IWRAM_START + 0xF2
	add r0, r8
	str r0, [sp, #4]
	ldrh r0, [r0]
	adds r0, #0x28
	ldr r1, [sp, #4]
	strh r0, [r1]
	ldr r6, _0801119C @ =IWRAM_START + 0xC0
	add r6, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	subs r2, r2, r0
	strh r2, [r6, #6]
	ldrh r0, [r6, #2]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	ble _08011006
	adds r4, r1, #0
_08011006:
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _080111A4 @ =gUnknown_030054B8
	mov sl, r2
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111A8 @ =IWRAM_START + 0x30
	add r7, r8
	ldr r6, _080111AC @ =IWRAM_START + 0xCC
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B0 @ =IWRAM_START + 0x60
	add r7, r8
	ldr r6, _080111B4 @ =IWRAM_START + 0xD8
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B8 @ =IWRAM_START + 0x90
	add r7, r8
	ldr r6, _080111BC @ =IWRAM_START + 0xE4
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	subs r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
_08011188:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011198: .4byte IWRAM_START + 0xF2
_0801119C: .4byte IWRAM_START + 0xC0
_080111A0: .4byte gCamera
_080111A4: .4byte gUnknown_030054B8
_080111A8: .4byte IWRAM_START + 0x30
_080111AC: .4byte IWRAM_START + 0xCC
_080111B0: .4byte IWRAM_START + 0x60
_080111B4: .4byte IWRAM_START + 0xD8
_080111B8: .4byte IWRAM_START + 0x90
_080111BC: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_80111C0
sub_80111C0: @ 0x080111C0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
    
	thumb_func_start sub_80111D4
sub_80111D4: @ 0x080111D4
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x64]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80111F0
sub_80111F0: @ 0x080111F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	adds r4, #1
	strb r4, [r6]
	adds r5, r0, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	subs r4, #1
	strb r4, [r5]
	bl sub_800CCB8
	ldrb r1, [r6]
	subs r1, #1
	strb r1, [r6]
	ldrb r1, [r5]
	adds r1, #1
	strb r1, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
