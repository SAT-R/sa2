.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8072E84
sub_8072E84: @ 0x08072E84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r5, _08072F1C @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08072F28
	ldr r2, [r6]
	ldr r1, _08072F20 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r6, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	movs r0, #8
	ldrsh r5, [r6, r0]
	adds r3, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r3, r1
	bgt _08072F28
	movs r7, #0xc
	ldrsh r2, [r6, r7]
	mov sl, r2
	subs r0, r2, r5
	adds r0, r3, r0
	cmp r0, r1
	blt _08072F28
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xa
	ldrsh r2, [r6, r3]
	adds r4, r0, r2
	mov r7, r8
	lsls r0, r7, #0x10
	asrs r3, r0, #0x10
	cmp r4, r3
	bgt _08072F28
	movs r7, #0xe
	ldrsh r0, [r6, r7]
	subs r0, r0, r2
	adds r0, r4, r0
	cmp r0, r3
	blt _08072F28
	mov r2, sl
	adds r0, r2, r5
	asrs r0, r0, #1
	add r0, ip
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08072F24
	movs r0, #1
	b _08072F2A
	.align 2, 0
_08072F1C: .4byte gPlayer
_08072F20: .4byte gCamera
_08072F24:
	movs r0, #2
	b _08072F2A
_08072F28:
	movs r0, #0
_08072F2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8072F38
sub_8072F38: @ 0x08072F38
	push {r4, lr}
	ldr r0, _08072F68 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8072E84
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	beq _08072F76
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _08072F6C
	cmp r1, #1
	bne _08072F76
	adds r0, r4, #0
	bl sub_8072DCC
	b _08072F76
	.align 2, 0
_08072F68: .4byte gCurTask
_08072F6C:
	cmp r2, #2
	bne _08072F76
	adds r0, r4, #0
	bl sub_8072DCC
_08072F76:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _08072F86
	adds r0, r4, #0
	bl sub_8073280
_08072F86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8072F8C
sub_8072F8C: @ 0x08072F8C
	push {r4, lr}
	ldr r0, _08072FCC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8072E84
	cmp r0, #0
	beq _08072FB6
	ldr r0, _08072FD0 @ =gPlayer
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x37
	bne _08072FB6
	adds r0, r4, #0
	bl sub_80730BC
_08072FB6:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _08072FC6
	adds r0, r4, #0
	bl sub_8073280
_08072FC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072FCC: .4byte gCurTask
_08072FD0: .4byte gPlayer

	thumb_func_start sub_8072FD4
sub_8072FD4: @ 0x08072FD4
	bx lr
	.align 2, 0

	thumb_func_start sub_8072FD8
sub_8072FD8: @ 0x08072FD8
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	bne _08073000
	ldr r1, _08072FFC @ =gPlayer
	movs r0, #8
	ldrsh r2, [r3, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r0, [r3, #0x14]
	ldr r0, [r1, #0xc]
	str r0, [r3, #0x18]
	adds r1, #0x24
	movs r0, #0x6d
	b _08073018
	.align 2, 0
_08072FFC: .4byte gPlayer
_08073000:
	ldr r1, _08073028 @ =gPlayer
	movs r0, #0xc
	ldrsh r2, [r3, r0]
	ldr r0, [r3]
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #8]
	str r0, [r3, #0x14]
	ldr r0, [r1, #0xc]
	str r0, [r3, #0x18]
	adds r1, #0x24
	movs r0, #0x13
_08073018:
	strb r0, [r1]
	ldr r0, _0807302C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073030 @ =sub_8072C90
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08073028: .4byte gPlayer
_0807302C: .4byte gCurTask
_08073030: .4byte sub_8072C90

	thumb_func_start sub_8073034
sub_8073034: @ 0x08073034
	ldr r0, _08073040 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073044 @ =sub_8072F38
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08073040: .4byte gCurTask
_08073044: .4byte sub_8072F38

	thumb_func_start sub_8073048
sub_8073048: @ 0x08073048
	push {lr}
	ldr r0, _0807305C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073060 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073064 @ =sub_8073320
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807305C: .4byte 0x0000011B
_08073060: .4byte gCurTask
_08073064: .4byte sub_8073320

	thumb_func_start sub_8073068
sub_8073068: @ 0x08073068
	push {lr}
	ldr r0, _0807307C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073080 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073084 @ =sub_8072F38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807307C: .4byte 0x0000011B
_08073080: .4byte gCurTask
_08073084: .4byte sub_8072F38

	thumb_func_start sub_8073088
sub_8073088: @ 0x08073088
	push {lr}
	ldr r2, _080730A8 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _080730AC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _080730B0 @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _080730B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080730B8 @ =sub_8073320
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080730A8: .4byte gPlayer
_080730AC: .4byte 0xFFBFFFFF
_080730B0: .4byte 0x0000011B
_080730B4: .4byte gCurTask
_080730B8: .4byte sub_8073320

	thumb_func_start sub_80730BC
sub_80730BC: @ 0x080730BC
	push {lr}
	ldr r1, _080730D4 @ =gPlayer
	ldr r0, [r0, #4]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x6d
	bne _080730D8
	movs r0, #0x80
	b _080730DA
	.align 2, 0
_080730D4: .4byte gPlayer
_080730D8:
	movs r0, #0
_080730DA:
	strb r0, [r1]
	ldr r0, _080730E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080730EC @ =sub_8072D40
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080730E8: .4byte gCurTask
_080730EC: .4byte sub_8072D40

	thumb_func_start sub_80730F0
sub_80730F0: @ 0x080730F0
	push {lr}
	ldr r2, _08073118 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807311C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	subs r1, #0x49
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08073120
	movs r0, #0x6d
	b _08073122
	.align 2, 0
_08073118: .4byte gPlayer
_0807311C: .4byte 0xFFBFFFFF
_08073120:
	movs r0, #0x13
_08073122:
	strb r0, [r1]
	bl sub_80731D4
	ldr r0, _0807313C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073140 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073144 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807313C: .4byte 0x0000011B
_08073140: .4byte gCurTask
_08073144: .4byte sub_8072F8C

	thumb_func_start sub_8073148
sub_8073148: @ 0x08073148
	push {lr}
	ldr r0, _0807315C @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073160 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073164 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807315C: .4byte 0x0000011B
_08073160: .4byte gCurTask
_08073164: .4byte sub_8072F8C

	thumb_func_start sub_8073168
sub_8073168: @ 0x08073168
	push {lr}
	ldr r2, _08073188 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807318C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _08073190 @ =0x0000011B
	bl m4aSongNumStop
	ldr r0, _08073194 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073198 @ =sub_8072F8C
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08073188: .4byte gPlayer
_0807318C: .4byte 0xFFBFFFFF
_08073190: .4byte 0x0000011B
_08073194: .4byte gCurTask
_08073198: .4byte sub_8072F8C

	thumb_func_start sub_807319C
sub_807319C: @ 0x0807319C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080731B8 @ =gPlayer
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080731BC
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xf0
	lsls r2, r2, #4
	b _080731C4
	.align 2, 0
_080731B8: .4byte gPlayer
_080731BC:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x90
	lsls r2, r2, #4
_080731C4:
	cmp r0, r2
	ble _080731CA
	adds r1, r2, #0
_080731CA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80731D4
sub_80731D4: @ 0x080731D4
	push {r4, r5, lr}
	ldr r1, _08073214 @ =gPlayer
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	ldr r4, _08073218 @ =gSineTable
	adds r3, r1, #0
	adds r3, #0x24
	ldrb r0, [r3]
	lsls r0, r0, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r1, #0x10]
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r1, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073214: .4byte gPlayer
_08073218: .4byte gSineTable

	thumb_func_start sub_807321C
sub_807321C: @ 0x0807321C
	ldr r2, _08073230 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08073234 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x6d
	movs r0, #3
	strb r0, [r2]
	bx lr
	.align 2, 0
_08073230: .4byte gPlayer
_08073234: .4byte 0xFFBFFFFF

	thumb_func_start sub_8073238
sub_8073238: @ 0x08073238
	push {lr}
	ldr r1, [r0]
	ldr r3, _08073274 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08073270
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08073270
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08073278
_08073270:
	movs r0, #1
	b _0807327A
	.align 2, 0
_08073274: .4byte gCamera
_08073278:
	movs r0, #0
_0807327A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8073280
sub_8073280: @ 0x08073280
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08073298 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08073298: .4byte gCurTask

	thumb_func_start initSprite_Interactable048
initSprite_Interactable048: @ 0x0807329C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_HookRail_Start
initSprite_Interactable_HookRail_Start: @ 0x080732C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_HookRail_End
initSprite_Interactable_HookRail_End: @ 0x080732F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl initSprite_Interactable_HookRail
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8073320
sub_8073320: @ 0x08073320
	push {r4, lr}
	ldr r0, _08073344 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08073348 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807334C
	adds r0, r4, #0
	bl sub_8073068
	b _0807336C
	.align 2, 0
_08073344: .4byte gCurTask
_08073348: .4byte gPlayer
_0807334C:
	adds r0, r4, #0
	bl sub_8072E84
	cmp r0, #0
	bne _0807335C
	adds r0, r4, #0
	bl sub_8073068
_0807335C:
	adds r0, r4, #0
	bl sub_8073238
	cmp r0, #0
	beq _0807336C
	adds r0, r4, #0
	bl sub_8073280
_0807336C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
