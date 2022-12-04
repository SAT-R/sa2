.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable074
initSprite_Interactable074: @ 0x08079DB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sb, r6
	ldr r0, _08079ED8 @ =Task_Interactable074
	ldr r2, _08079EDC @ =0x00002010
	ldr r1, _08079EE0 @ =TaskDestructor_Interactable074
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldrb r2, [r7, #3]
	ldr r3, _08079EE4 @ =IWRAM_START + 0x68
	adds r0, r1, r3
	movs r3, #0
	strb r2, [r0]
	ldrb r2, [r7, #4]
	ldr r6, _08079EE8 @ =IWRAM_START + 0x6C
	adds r0, r1, r6
	strb r2, [r0]
	ldr r2, _08079EEC @ =IWRAM_START + 0x69
	adds r0, r1, r2
	strb r3, [r0]
	subs r6, #1
	adds r0, r1, r6
	strb r3, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	mov r2, r8
	str r0, [r2, #0x60]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r2, #0x64]
	ldrb r2, [r7]
	ldr r3, _08079EF0 @ =IWRAM_START + 0x78
	adds r0, r1, r3
	strb r2, [r0]
	adds r6, #0xe
	adds r1, r1, r6
	mov r0, sb
	strb r0, [r1]
	mov r1, r8
	str r7, [r1, #0x74]
	movs r0, #4
	bl VramMalloc
	adds r5, r0, #0
	mov r2, r8
	str r5, [r2, #0x70]
	movs r6, #0
	movs r3, #0
	ldr r0, _08079EF4 @ =gUnknown_080E0038
	mov sb, r0
	movs r1, #4
	add r1, sb
	mov sl, r1
_08079E52:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r0, r4, #4
	mov r1, r8
	adds r2, r1, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	lsls r4, r4, #1
	mov r1, sb
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	mov r0, sb
	adds r0, #2
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	str r5, [r2, #4]
	adds r0, r2, #0
	str r3, [sp, #4]
	bl sub_8004558
	add r4, sl
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r5, r5, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #4]
	cmp r6, #1
	bls _08079E52
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079ED8: .4byte Task_Interactable074
_08079EDC: .4byte 0x00002010
_08079EE0: .4byte TaskDestructor_Interactable074
_08079EE4: .4byte IWRAM_START + 0x68
_08079EE8: .4byte IWRAM_START + 0x6C
_08079EEC: .4byte IWRAM_START + 0x69
_08079EF0: .4byte IWRAM_START + 0x78
_08079EF4: .4byte gUnknown_080E0038

	thumb_func_start sub_8079EF8
sub_8079EF8: @ 0x08079EF8
	push {r4, r5, r6, lr}
	ldr r0, _08079F30 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r5, _08079F34 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08079F18
	adds r0, r4, #0
	bl sub_807A238
_08079F18:
	ldr r1, _08079F38 @ =IWRAM_START + 0x69
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08079F3C
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	b _08079F46
	.align 2, 0
_08079F30: .4byte gCurTask
_08079F34: .4byte gPlayer
_08079F38: .4byte IWRAM_START + 0x69
_08079F3C:
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
_08079F46:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_807A104
	cmp r0, #0
	bne _08079F58
	adds r0, r4, #0
	bl sub_807A238
_08079F58:
	adds r0, r4, #0
	bl sub_807A25C
	adds r0, r4, #0
	bl sub_807A2D0
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	cmp r0, #0
	beq _08079F74
	adds r0, r4, #0
	bl sub_807A2AC
_08079F74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8079F7C
sub_8079F7C: @ 0x08079F7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r6, #0x30
	ldr r2, [r0, #0x60]
	ldr r4, _0807A000 @ =gCamera
	ldr r3, [r4]
	subs r1, r2, r3
	subs r1, #0x70
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	subs r2, r2, r3
	adds r2, #0x70
	ldr r0, [r0, #0x64]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0807A004 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r4, r0, #1
	movs r0, #1
	ands r4, r0
	lsls r1, r5, #0x10
	asrs r0, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bgt _08079FF6
	cmp r0, #0xf6
	bgt _08079FF6
	adds r7, r2, #0
_08079FC0:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08079FDA
	asrs r0, r1, #0x10
	cmp r0, #5
	ble _08079FDA
	strh r5, [r6, #0x16]
	mov r0, r8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
_08079FDA:
	lsls r0, r5, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r5, #0x10
	asrs r0, r1, #0x10
	cmp r0, r7
	bgt _08079FF6
	cmp r0, #0xf6
	ble _08079FC0
_08079FF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A000: .4byte gCamera
_0807A004: .4byte gUnknown_03005590

	thumb_func_start sub_807A008
sub_807A008: @ 0x0807A008
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	ldr r2, _0807A088 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, [r5, #0x64]
	ldr r0, [r2, #4]
	subs r0, #4
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0807A08C @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r4, r0, #1
	movs r0, #1
	ands r4, r0
	cmp r4, #0xb
	bhi _0807A07C
	ldr r6, _0807A090 @ =gUnknown_080E006C
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r0, r6, #2
	mov sb, r0
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0807A048:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r0, r6, #4
	adds r0, r2, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r1, r2, r6
	ldrh r1, [r1]
	add r1, r8
	strh r1, [r0, #0x16]
	add r2, sb
	ldrh r1, [r2]
	adds r1, r7, r1
	strh r1, [r0, #0x18]
	bl sub_80051E8
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _0807A048
_0807A07C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A088: .4byte gCamera
_0807A08C: .4byte gUnknown_03005590
_0807A090: .4byte gUnknown_080E006C

	thumb_func_start sub_807A094
sub_807A094: @ 0x0807A094
	push {r4, r5, lr}
	ldr r3, [r0, #0x60]
	ldr r2, _0807A0F4 @ =gCamera
	ldr r1, [r2]
	subs r3, r3, r1
	ldr r1, [r0, #0x64]
	ldr r2, [r2, #4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r1, _0807A0F8 @ =gUnknown_080E0044
	adds r0, #0x68
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsh r0, [r2, r1]
	adds r0, r3, r0
	movs r4, #0x80
	rsbs r4, r4, #0
	cmp r0, r4
	blt _0807A0EE
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r0, r3, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807A0EE
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	movs r3, #6
	ldrsh r0, [r2, r3]
	adds r0, r1, r0
	cmp r0, r4
	blt _0807A0EE
	movs r3, #2
	ldrsh r0, [r2, r3]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807A0FC
_0807A0EE:
	movs r0, #1
	b _0807A0FE
	.align 2, 0
_0807A0F4: .4byte gCamera
_0807A0F8: .4byte gUnknown_080E0044
_0807A0FC:
	movs r0, #0
_0807A0FE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A104
sub_807A104: @ 0x0807A104
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0807A194 @ =gPlayer
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A1A0
	ldr r3, [r6, #0x60]
	ldr r0, _0807A198 @ =gCamera
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r6, #0x64]
	ldr r5, [r0, #4]
	subs r2, r2, r5
	ldr r4, [r7, #8]
	asrs r4, r4, #8
	subs r4, r4, r1
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r5, _0807A19C @ =gUnknown_080E0054
	adds r0, r6, #0
	adds r0, #0x68
	ldrb r1, [r0]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r5, [r1]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r3, r3, r5
	ldrh r6, [r1, #2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r6
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r0, [r1, #4]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r1, #6]
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r3, r4
	bgt _0807A1A0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r3, r0
	cmp r0, r4
	blt _0807A1A0
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	lsls r0, r7, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807A1A0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, r2, r0
	cmp r0, r1
	blt _0807A1A0
	movs r0, #1
	b _0807A1A2
	.align 2, 0
_0807A194: .4byte gPlayer
_0807A198: .4byte gCamera
_0807A19C: .4byte gUnknown_080E0054
_0807A1A0:
	movs r0, #0
_0807A1A2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable074
Task_Interactable074: @ 0x0807A1A8
	push {r4, r5, lr}
	ldr r0, _0807A1D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_807A104
	cmp r0, #0
	beq _0807A1C6
	adds r0, r4, #0
	bl sub_807A218
_0807A1C6:
	adds r0, r4, #0
	bl sub_807A094
	cmp r0, #0
	beq _0807A1DC
	adds r0, r4, #0
	bl sub_807A314
	b _0807A1F8
	.align 2, 0
_0807A1D8: .4byte gCurTask
_0807A1DC:
	adds r0, r4, #0
	bl sub_807A25C
	adds r0, r4, #0
	bl sub_807A2D0
	ldr r1, _0807A200 @ =IWRAM_START + 0x69
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A1F8
	adds r0, r4, #0
	bl sub_807A2AC
_0807A1F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A200: .4byte IWRAM_START + 0x69

	thumb_func_start TaskDestructor_Interactable074
TaskDestructor_Interactable074: @ 0x0807A204
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x70]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807A218
sub_807A218: @ 0x0807A218
	ldr r1, _0807A22C @ =gPlayer
	adds r1, #0x38
	ldrb r1, [r1]
	adds r0, #0x6a
	strb r1, [r0]
	ldr r0, _0807A230 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A234 @ =sub_8079EF8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807A22C: .4byte gPlayer
_0807A230: .4byte gCurTask
_0807A234: .4byte sub_8079EF8

	thumb_func_start sub_807A238
sub_807A238: @ 0x0807A238
	ldr r1, _0807A250 @ =gPlayer
	adds r1, #0x38
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0807A254 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A258 @ =Task_Interactable074
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807A250: .4byte gPlayer
_0807A254: .4byte gCurTask
_0807A258: .4byte Task_Interactable074

	thumb_func_start sub_807A25C
sub_807A25C: @ 0x0807A25C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0807A294 @ =gUnknown_03005590
	adds r0, #0x6c
	ldrb r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r3, _0807A298 @ =gUnknown_080E0064
	adds r1, r5, #0
	adds r1, #0x68
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r2, r1, r3
	ldrh r4, [r2]
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r1, r4, r1
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bhs _0807A29C
	adds r1, r5, #0
	adds r1, #0x69
	movs r0, #1
	b _0807A2A2
	.align 2, 0
_0807A294: .4byte gUnknown_03005590
_0807A298: .4byte gUnknown_080E0064
_0807A29C:
	adds r1, r5, #0
	adds r1, #0x69
	movs r0, #0
_0807A2A2:
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A2AC
sub_807A2AC: @ 0x0807A2AC
	push {lr}
	adds r1, r0, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A2BE
	cmp r0, #1
	beq _0807A2C6
	b _0807A2CC
_0807A2BE:
	adds r0, r1, #0
	bl sub_8079F7C
	b _0807A2CC
_0807A2C6:
	adds r0, r1, #0
	bl sub_807A008
_0807A2CC:
	pop {r0}
	bx r0

	thumb_func_start sub_807A2D0
sub_807A2D0: @ 0x0807A2D0
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r1, #0x69
	ldrb r5, [r1]
	cmp r5, #0
	beq _0807A2F8
	adds r4, r0, #0
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807A30A
	ldr r0, _0807A2F4 @ =0x00000127
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r4]
	b _0807A30A
	.align 2, 0
_0807A2F4: .4byte 0x00000127
_0807A2F8:
	adds r4, r0, #0
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	beq _0807A30A
	ldr r0, _0807A310 @ =0x00000127
	bl m4aSongNumStop
	strb r5, [r4]
_0807A30A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A310: .4byte 0x00000127

	thumb_func_start sub_807A314
sub_807A314: @ 0x0807A314
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807A334 @ =0x00000127
	bl m4aSongNumStop
	ldr r1, [r4, #0x74]
	adds r4, #0x78
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r0, _0807A338 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A334: .4byte 0x00000127
_0807A338: .4byte gCurTask
