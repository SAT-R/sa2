.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_PikoPiko
CreateEntity_PikoPiko: @ 0x080554C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _0805552C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080554EE
	ldr r0, _08055530 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080554EE
	b _080555F2
_080554EE:
	ldr r0, _08055534 @ =sub_805560C
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r1, _08055538 @ =sub_80557DC
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov sb, r0
	strh r6, [r7, #4]
	mov r2, r8
	strh r2, [r7, #6]
	str r4, [r7]
	ldrb r0, [r4]
	strb r0, [r7, #8]
	strb r5, [r7, #9]
	movs r0, #4
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08055540
	ldr r3, _0805553C @ =IWRAM_START + 0x54
	adds r1, r1, r3
	movs r0, #1
	b _08055546
	.align 2, 0
_0805552C: .4byte gGameMode
_08055530: .4byte gUnknown_030054EC
_08055534: .4byte sub_805560C
_08055538: .4byte sub_80557DC
_0805553C: .4byte IWRAM_START + 0x54
_08055540:
	ldr r0, _08055604 @ =IWRAM_START + 0x54
	adds r1, r1, r0
	movs r0, #0
_08055546:
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x56
	movs r2, #0
	mov sl, r2
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r6, r6, #8
	adds r1, r1, r6
	lsls r1, r1, #8
	str r1, [r7, #0x44]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r5, r3, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	str r2, [r7, #0x4c]
	asrs r0, r0, #8
	asrs r1, r1, #8
	adds r2, r7, #0
	adds r2, #0x54
	ldrb r2, [r2]
	mov r3, sl
	str r3, [sp]
	ldr r3, _08055608 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r7, #0x50]
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r6
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r1, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r4]
	movs r0, #0x1e
	bl VramMalloc
	mov r3, sb
	str r0, [r3, #4]
	movs r0, #0xf7
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	mov r0, sb
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r3, #0x1a]
	mov r2, sl
	strh r2, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x1c]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sb
	adds r0, #0x25
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, sb
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
_080555F2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055604: .4byte IWRAM_START + 0x54
_08055608: .4byte sub_801EE64

	thumb_func_start sub_805560C
sub_805560C: @ 0x0805560C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	ldr r0, _080556E4 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r1, _080556E8 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r4]
	mov r8, r2
	ldr r5, _080556EC @ =IWRAM_START + 0x56
	adds r0, r3, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r4, #0x4c]
	adds r2, r2, r0
	str r2, [r4, #0x4c]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080556F0 @ =IWRAM_START + 0x54
	adds r5, r3, r2
	ldrb r2, [r5]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080556F4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08055682
	lsls r0, r0, #8
	ldr r1, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x50]
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r5]
	ldr r3, _080556F8 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08055682:
	cmp r0, #0
	ble _0805568E
	lsls r1, r0, #8
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
_0805568E:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	asrs r6, r0, #8
	str r6, [sp, #8]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r5, r0, #8
	str r5, [sp, #0xc]
	ldr r1, _080556FC @ =gCamera
	ldr r0, [r1]
	adds r3, r6, #0
	subs r0, r3, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	strh r0, [r7, #0x18]
	ldr r0, _08055700 @ =gPlayer
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	beq _08055704
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #1
	bne _08055704
	mov r2, sb
	ldr r0, [r2]
	bl TaskDestroy
	b _080557CE
	.align 2, 0
_080556E4: .4byte gCurTask
_080556E8: .4byte IWRAM_START + 0xC
_080556EC: .4byte IWRAM_START + 0x56
_080556F0: .4byte IWRAM_START + 0x54
_080556F4: .4byte sub_801EE64
_080556F8: .4byte sub_801EC3C
_080556FC: .4byte gCamera
_08055700: .4byte gPlayer
_08055704:
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	ldr r3, _0805576C @ =gCamera
	ldr r1, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _08055736
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08055736
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08055736
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08055774
_08055736:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805575A
	movs r5, #0x18
	ldrsh r0, [r7, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0805575A
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055774
_0805575A:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08055770 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080557CE
	.align 2, 0
_0805576C: .4byte gCamera
_08055770: .4byte gCurTask
_08055774:
	ldr r1, [r4, #0x4c]
	asrs r3, r1, #8
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r5, r0, #0
	cmp r3, r2
	bgt _08055798
	adds r2, r4, #0
	adds r2, #0x56
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08055798
	rsbs r0, r0, #0
	strh r0, [r2]
	b _080557B6
_08055798:
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080557B6
	adds r3, r4, #0
	adds r3, #0x56
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, #0
	ble _080557B6
	rsbs r0, r0, #0
	strh r0, [r3]
_080557B6:
	ldr r2, [sp, #8]
	lsls r0, r2, #8
	ldr r3, [sp, #0xc]
	lsls r1, r3, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_080557CE:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80557DC
sub_80557DC: @ 0x080557DC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
