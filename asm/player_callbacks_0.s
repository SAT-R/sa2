.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D5518
gUnknown_080D5518:
    .2byte 15, 16, 3
    .2byte 16, 17, 1
    .2byte 16, 51, 3
    .2byte 0

.text
.syntax unified
.arm

	thumb_func_start sub_8011B88
sub_8011B88: @ 0x08011B88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _08011BA8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08011BAC
	movs r0, #0
	b _08011C7E
	.align 2, 0
_08011BA8: .4byte gGameMode
_08011BAC:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _08011BF0 @ =gPlayer
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _08011BF4 @ =sub_801F214
	str r2, [sp]
	ldr r2, _08011BF8 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov sb, r0              @ sb = t
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0         @ r7 = ts
	mov r0, r8              @ r0 = r8 = p2
	cmp r0, #0
	bne _08011BFC
	adds r0, r4, #0         @ r0 = r4 = gPlayer
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r7, #0x16]
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r7, #0x18]
	b _08011C44
	.align 2, 0
_08011BF0: .4byte gPlayer
_08011BF4: .4byte sub_801F214
_08011BF8: .4byte sub_801F550
_08011BFC:
	mov r1, r8
	cmp r1, #0
	blt _08011C44
	cmp r1, #2
	bgt _08011C44
	ldr r1, _08011C8C @ =gUnknown_080D6736
	adds r2, r4, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r3, [r0]
	strh r3, [r7, #0x16]
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0x18]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08011C44
	ldr r1, _08011C90 @ =gPlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r7, #0x16]
_08011C44:
	adds r6, r7, #0
	adds r6, #0x1c
	ldr r5, _08011C94 @ =gUnknown_080D5518
	mov r3, r8
	lsls r4, r3, #1
	add r4, r8
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
_08011C7E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08011C8C: .4byte gUnknown_080D6736
_08011C90: .4byte gPlayerCharacterIdleAnims
_08011C94: .4byte gUnknown_080D5518
