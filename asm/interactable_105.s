.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_8080E54
Task_8080E54: @ 0x08080E54
	push {r4, r5, lr}
	ldr r0, _08080E7C @ =gCurTask
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x46
	adds r1, r5, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080E80 @ =0xFFFF0000
	cmp r0, r1
	bne _08080E84
	adds r0, r2, #0
	bl TaskDestroy
	b _08080EF0
	.align 2, 0
_08080E7C: .4byte gCurTask
_08080E80: .4byte 0xFFFF0000
_08080E84:
	ldr r1, _08080EDC @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x38]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	ldr r0, _08080EE0 @ =IWRAM_START + 0x42
	adds r1, r5, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r2
	str r0, [r4, #0x3c]
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	ldr r1, [r4, #0x30]
	ldr r2, _08080EE4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r0, [r4, #0x38]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r4, #0x34]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r2, _08080EE8 @ =IWRAM_START + 0x44
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080EEC
	adds r0, r4, #0
	bl sub_80051E8
	b _08080EF0
	.align 2, 0
_08080EDC: .4byte IWRAM_START + 0x40
_08080EE0: .4byte IWRAM_START + 0x42
_08080EE4: .4byte gCamera
_08080EE8: .4byte IWRAM_START + 0x44
_08080EEC:
	subs r0, #1
	strh r0, [r1]
_08080EF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_8080EF8
TaskDestructor_8080EF8: @ 0x08080EF8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r2, _08080F24 @ =gUnknown_080E0140
	adds r1, #0x48
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080F20
	ldr r0, [r3, #4]
	bl VramFree
_08080F20:
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_080E0140
