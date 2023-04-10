.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
.align 2 , 0
    .global gUnknown_080D69C8
gUnknown_080D69C8:
    .incbin "baserom.gba", 0x000D69C8, 0xB8

    .global gUnknown_080D6A80
gUnknown_080D6A80:
    .incbin "baserom.gba", 0x000D6A80, 0x30

    .global gUnknown_080D6AB0
gUnknown_080D6AB0:
    .incbin "baserom.gba", 0x000D6AB0, 0x1E

    .global gUnknown_080D6ACE
gUnknown_080D6ACE:
    .incbin "baserom.gba", 0x000D6ACE, 0x22

    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .incbin "baserom.gba", 0x000D6AF0, 0x18

.arm
.syntax unified
.text

@ NOTE: We consider Player Callbacks to be all those procedures
@       that are passed to the first member of the Player struct.
@       So even if there are procedures that only take a Player,
@       if they are only called directly in the code, those are NOT callbacks.

.if 00
.endif

	thumb_func_start sub_802A07C
sub_802A07C: @ 0x0802A07C
	push {r4, lr}
	ldr r4, _0802A0C4 @ =gPlayer
	adds r1, r4, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A0A2
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0A2:
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802A0BE
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A0C4: .4byte gPlayer

	thumb_func_start sub_802A0C8
sub_802A0C8: @ 0x0802A0C8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _0802A0F4
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A0F4
	ldr r1, _0802A0EC @ =gPlayer
	ldr r0, _0802A0F0 @ =PlayerCB_802A620
	str r0, [r1]
	movs r0, #1
	b _0802A0F6
	.align 2, 0
_0802A0EC: .4byte gPlayer
_0802A0F0: .4byte PlayerCB_802A620
_0802A0F4:
	movs r0, #0
_0802A0F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A0FC
sub_802A0FC: @ 0x0802A0FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0802A17C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _0802A148
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r0, [r2, #0x20]
	ldr r1, _0802A13C @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r1, _0802A140 @ =gPlayer
	ldr r0, _0802A144 @ =PlayerCB_802A228
	str r0, [r1]
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A13C: .4byte 0x01000006
_0802A140: .4byte gPlayer
_0802A144: .4byte PlayerCB_802A228
_0802A148:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0802A17C
	ldr r0, [r2, #0x20]
	ldr r1, _0802A170 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A17C
	ldr r1, _0802A174 @ =gPlayer
	ldr r0, _0802A178 @ =PlayerCB_8025A0C
	str r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A170: .4byte 0x01000006
_0802A174: .4byte gPlayer
_0802A178: .4byte PlayerCB_8025A0C
_0802A17C:
	movs r0, #0
_0802A17E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A184
sub_802A184: @ 0x0802A184
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0802A1C0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0802A1B4 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A1C0
	ldr r0, _0802A1B8 @ =gPlayer
	ldr r1, _0802A1BC @ =PlayerCB_802631C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	movs r0, #1
	b _0802A1C2
	.align 2, 0
_0802A1B4: .4byte gPlayerControls
_0802A1B8: .4byte gPlayer
_0802A1BC: .4byte PlayerCB_802631C
_0802A1C0:
	movs r0, #0
_0802A1C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A1C8
sub_802A1C8: @ 0x0802A1C8
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A1E4
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1E4:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A1FA
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1FA:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_0802A204:
	str r0, [r3, #0x40]
	ldr r1, _0802A224 @ =gUnknown_080D6902
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [r3, #0x48]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	str r0, [r3, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A224: .4byte gUnknown_080D6902

	thumb_func_start PlayerCB_802A228
PlayerCB_802A228: @ 0x0802A228
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #2
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A250 @ =gPlayer
	ldr r2, _0802A254 @ =PlayerCB_8025854
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A250: .4byte gPlayer
_0802A254: .4byte PlayerCB_8025854

	thumb_func_start PlayerCB_802A258
PlayerCB_802A258: @ 0x0802A258
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A27E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0802A276
	adds r0, r2, #0
	bl PlayerCB_8025A0C
	b _0802A296
_0802A276:
	adds r0, r2, #0
	bl PlayerCB_8025318
	b _0802A296
_0802A27E:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _0802A29C @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r2, #0x20]
	ldr r0, _0802A2A0 @ =gPlayer
	ldr r1, _0802A2A4 @ =PlayerCB_8026D2C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
_0802A296:
	pop {r0}
	bx r0
	.align 2, 0
_0802A29C: .4byte 0xFEFFFFDF
_0802A2A0: .4byte gPlayer
_0802A2A4: .4byte PlayerCB_8026D2C

	thumb_func_start sub_802A2A8
sub_802A2A8: @ 0x0802A2A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802A2E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802A2DE
	ldr r0, [r2, #0x20]
	movs r1, #0x84
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0802A2DE
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802A2DE
	adds r0, r2, #0
	adds r0, #0x5e
	ldr r1, _0802A2E8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A2EC
_0802A2DE:
	movs r0, #0
	b _0802A2F4
	.align 2, 0
_0802A2E4: .4byte gGameMode
_0802A2E8: .4byte gPlayerControls
_0802A2EC:
	ldr r1, _0802A2F8 @ =gPlayer
	ldr r0, _0802A2FC @ =PlayerCB_802A714
	str r0, [r1]
	movs r0, #1
_0802A2F4:
	pop {r1}
	bx r1
	.align 2, 0
_0802A2F8: .4byte gPlayer
_0802A2FC: .4byte PlayerCB_802A714

	thumb_func_start PlayerCB_802A300
PlayerCB_802A300: @ 0x0802A300
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0802A34C @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0x66
	ldr r0, _0802A350 @ =0x0000FFFF
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _0802A354 @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _0802A358 @ =gPlayer
	ldr r1, _0802A35C @ =PlayerCB_802940C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A34C: .4byte 0xFEFFFFD7
_0802A350: .4byte 0x0000FFFF
_0802A354: .4byte 0x00000115
_0802A358: .4byte gPlayer
_0802A35C: .4byte PlayerCB_802940C

	thumb_func_start sub_802A360
sub_802A360: @ 0x0802A360
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x3e
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x92
	lsls r0, r0, #1     @ SE_ICE_PARADISE_SLIDE
	bl m4aSongNumStart
	ldr r0, _0802A3B0 @ =gPlayer
	ldr r1, _0802A3B4 @ =PlayerCB_8026BCC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3B0: .4byte gPlayer
_0802A3B4: .4byte PlayerCB_8026BCC

	thumb_func_start PlayerCB_802A3B8
PlayerCB_802A3B8: @ 0x0802A3B8
	push {lr}
	bl sub_802808C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_802A3C4
PlayerCB_802A3C4: @ 0x0802A3C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	adds r4, #0x90
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A3E2
	ldr r1, _0802A3E8 @ =gPlayer
	ldr r0, _0802A3EC @ =PlayerCB_8025A0C
	str r0, [r1]
_0802A3E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E8: .4byte gPlayer
_0802A3EC: .4byte PlayerCB_8025A0C

	thumb_func_start PlayerCB_802A3F0
PlayerCB_802A3F0: @ 0x0802A3F0
	push {lr}
	ldr r2, _0802A408 @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0802A402
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_0802A402:
	pop {r0}
	bx r0
	.align 2, 0
_0802A408: .4byte gCamera

	thumb_func_start sub_802A40C
sub_802A40C: @ 0x0802A40C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x72
	strh r2, [r0]
	ldr r0, _0802A460 @ =gPlayer
	ldr r1, _0802A464 @ =PlayerCB_80279F8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A460: .4byte gPlayer
_0802A464: .4byte PlayerCB_80279F8

	thumb_func_start sub_802A468
sub_802A468: @ 0x0802A468
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0802A4B0 @ =gPlayer
	ldr r1, _0802A4B4 @ =PlayerCB_8027C5C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4B0: .4byte gPlayer
_0802A4B4: .4byte PlayerCB_8027C5C

	thumb_func_start sub_802A4B8
sub_802A4B8: @ 0x0802A4B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _0802A4F4 @ =gPlayer
	ldr r1, _0802A4F8 @ =PlayerCB_8027D3C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4F4: .4byte gPlayer
_0802A4F8: .4byte PlayerCB_8027D3C

	thumb_func_start PlayerCB_802A4FC
PlayerCB_802A4FC: @ 0x0802A4FC
	bx lr
	.align 2, 0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A500
sub_802A500: @ 0x0802A500
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802A51A
	adds r0, r4, #0
	bl sub_8022218
	adds r0, r4, #0
	bl sub_8022284
	b _0802A526
_0802A51A:
	adds r0, r4, #0
	bl sub_8022284
	adds r0, r4, #0
	bl sub_8022218
_0802A526:
	pop {r4}
	pop {r0}
	bx r0
    
@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A52C
sub_802A52C: @ 0x0802A52C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0802A54C
	ldr r1, _0802A550 @ =gPlayer
	ldr r0, _0802A554 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_0802A54C:
	pop {r0}
	bx r0
	.align 2, 0
_0802A550: .4byte gPlayer
_0802A554: .4byte PlayerCB_8025318

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A558
sub_802A558: @ 0x0802A558
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _0802A56A
	movs r1, #0xc
_0802A56A:
	ldrh r3, [r2, #0x12]
	movs r4, #0x12
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _0802A57C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0802A57C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	strh r0, [r2, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A58C
sub_802A58C: @ 0x0802A58C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _0802A5A8
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _0802A5A8
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_0802A5A8:
	pop {r0}
	bx r0

@ Unused?
@  r0 : Player*
	thumb_func_start sub_802A5AC
sub_802A5AC: @ 0x0802A5AC
	push {lr}
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802A5C0
	subs r0, r2, #1
	strb r0, [r1]
_0802A5C0:
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_802A5C4
PlayerCB_802A5C4: @ 0x0802A5C4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802A5E6
	movs r0, #6
	b _0802A5E8
_0802A5E6:
	movs r0, #5
_0802A5E8:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A614 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _0802A618 @ =gPlayer
	ldr r1, _0802A61C @ =PlayerCB_8025548
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0802A614: .4byte 0xFFFFBFFF
_0802A618: .4byte gPlayer
_0802A61C: .4byte PlayerCB_8025548

	thumb_func_start PlayerCB_802A620
PlayerCB_802A620: @ 0x0802A620
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x90
	ldr r3, [r1]
	ldr r1, [r3, #0x1c]
	ldr r2, _0802A654 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A658 @ =gPlayer
	ldr r2, _0802A65C @ =PlayerCB_802569C
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A654: .4byte 0xFFFFBFFF
_0802A658: .4byte gPlayer
_0802A65C: .4byte PlayerCB_802569C

@ Unused?
	thumb_func_start sub_802A660
sub_802A660: @ 0x0802A660
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A6BA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _0802A69C
	cmp r1, #0x20
	bne _0802A6BA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0802A690
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A690:
	subs r0, #0x18
	cmp r0, #0
	bge _0802A6B8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _0802A6B8
_0802A69C:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0802A6B0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A6B0:
	adds r0, #0x18
	cmp r0, #0
	ble _0802A6B8
	movs r0, #0x60
_0802A6B8:
	strh r0, [r2, #0x14]
_0802A6BA:
	pop {r0}
	bx r0
	.align 2, 0

@ Unused?
	thumb_func_start sub_802A6C0
sub_802A6C0: @ 0x0802A6C0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A708 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r2, ip
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0802A70C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802A710 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_0802A708: .4byte 0xFFFFCFFF
_0802A70C: .4byte gPlayer
_0802A710: .4byte 0xBFFFFFFF

	thumb_func_start PlayerCB_802A714
PlayerCB_802A714: @ 0x0802A714
	push {lr}
	adds r2, r0, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _0802A7A4
	lsls r0, r0, #2
	ldr r1, _0802A730 @ =_0802A734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A730: .4byte _0802A734
_0802A734: @ jump table
	.4byte _0802A748 @ case 0
	.4byte _0802A750 @ case 1
	.4byte _0802A76A @ case 2
	.4byte _0802A772 @ case 3
	.4byte _0802A78C @ case 4
_0802A748:
	adds r0, r2, #0
	bl sub_8011D48
	b _0802A7A4
_0802A750:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A762
	adds r0, r2, #0
	bl sub_8012548
	b _0802A7A4
_0802A762:
	adds r0, r2, #0
	bl sub_8012830
	b _0802A7A4
_0802A76A:
	adds r0, r2, #0
	bl sub_8012D3C
	b _0802A7A4
_0802A772:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A784
	adds r0, r2, #0
	bl sub_8012EEC
	b _0802A7A4
_0802A784:
	adds r0, r2, #0
	bl sub_8013070
	b _0802A7A4
_0802A78C:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A79E
	adds r0, r2, #0
	bl sub_8013F04
	b _0802A7A4
_0802A79E:
	adds r0, r2, #0
	bl sub_8011D48
_0802A7A4:
	pop {r0}
	bx r0
