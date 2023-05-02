.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080E0124
gUnknown_080E0124:
    .incbin "baserom.gba", 0x000E0124, 0x12

.text
.syntax unified
.arm

	thumb_func_start initSprite_Interactable086
initSprite_Interactable086: @ 0x0807C7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x30]     @ r6 = kind
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0807C980 @ =Task_807D06C
	movs r1, #0x96
	lsls r1, r1, #2
	ldr r2, _0807C984 @ =0x00002010
	ldr r3, _0807C988 @ =TaskDestructor_Interactable086
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r0, [sp, #4]
	ldr r1, _0807C98C @ =IWRAM_START + 0x228
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r1]
	ldr r3, _0807C990 @ =IWRAM_START + 0x22C
	adds r3, r3, r2
	mov sl, r3
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3]
	ldr r4, _0807C994 @ =IWRAM_START + 0x230
	adds r0, r2, r4
	strh r6, [r0]
	movs r0, #3
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r1, _0807C998 @ =IWRAM_START + 0x234
	adds r1, r1, r2
	mov r8, r1
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r3, _0807C99C @ =IWRAM_START + 0x236
	adds r6, r2, r3
	strh r0, [r6]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r4, [r1]
	adds r0, r0, r4
	ldr r1, _0807C9A0 @ =IWRAM_START + 0x238
	adds r5, r2, r1
	strh r0, [r5]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	ldrh r3, [r6]
	adds r0, r0, r3
	ldr r4, _0807C9A4 @ =IWRAM_START + 0x23A
	adds r3, r2, r4
	strh r0, [r3]
	ldr r0, _0807C9A8 @ =IWRAM_START + 0x23C
	adds r0, r2, r0
	str r0, [sp, #8]
	movs r4, #0
	ldrsh r1, [r5, r4]
	str r1, [sp, #0xc]
	mov r1, r8
	movs r4, #0
	ldrsh r0, [r1, r4]
	ldr r4, [sp, #0xc]
	adds r1, r4, r0
	asrs r1, r1, #1
	mov r4, ip
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r1, [sp, #8]
	str r0, [r1]
	ldr r4, _0807C9AC @ =IWRAM_START + 0x240
	adds r4, r4, r2
	mov ip, r4
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov r4, sl
	ldr r0, [r4]
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1]
	ldrh r0, [r3]
	ldrh r1, [r6]
	subs r0, r0, r1
	ldr r3, _0807C9B0 @ =IWRAM_START + 0x244
	adds r1, r2, r3
	strh r0, [r1]
	ldrh r0, [r5]
	mov r4, r8
	ldrh r1, [r4]
	subs r0, r0, r1
	adds r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	ldrh r0, [r1]
	lsrs r0, r0, #2
	ldr r4, _0807C9B4 @ =IWRAM_START + 0x248
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _0807C9B8 @ =IWRAM_START + 0x24C
	adds r0, r2, r1
	str r7, [r0]
	ldrb r1, [r7]
	adds r3, #0xa
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, #9
	adds r2, r2, r4
	mov r0, sb
	strb r0, [r2]
	movs r4, #0
	movs r1, #0
_0807C8CA:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r2, [sp, #4]
	adds r0, r2, r0
	str r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0807C8CA
	movs r0, #4
	bl VramMalloc
	ldr r3, [sp, #4]
	movs r4, #0x95
	lsls r4, r4, #2
	adds r1, r3, r4
	str r0, [r1]
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	mov sl, r0
	movs r6, #0
	ldr r1, _0807C9BC @ =gUnknown_080E0124
	mov r8, r1
	movs r2, #4
	add r2, r8
	mov sb, r2
_0807C904:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r0, r2, #4
	movs r3, #0xcc
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #4]
	adds r3, r1, r0
	strh r6, [r3, #8]
	strh r6, [r3, #0x14]
	strh r6, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	str r5, [r3, #4]
	lsls r2, r2, #1
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	mov r0, r8
	adds r0, #2
	adds r0, r2, r0
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	add r2, sb
	ldrh r0, [r2]
	lsls r0, r0, #5
	adds r5, r5, r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0807C904
	ldr r0, [sp, #4]
	bl sub_807D1BC
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C980: .4byte Task_807D06C
_0807C984: .4byte 0x00002010
_0807C988: .4byte TaskDestructor_Interactable086
_0807C98C: .4byte IWRAM_START + 0x228
_0807C990: .4byte IWRAM_START + 0x22C
_0807C994: .4byte IWRAM_START + 0x230
_0807C998: .4byte IWRAM_START + 0x234
_0807C99C: .4byte IWRAM_START + 0x236
_0807C9A0: .4byte IWRAM_START + 0x238
_0807C9A4: .4byte IWRAM_START + 0x23A
_0807C9A8: .4byte IWRAM_START + 0x23C
_0807C9AC: .4byte IWRAM_START + 0x240
_0807C9B0: .4byte IWRAM_START + 0x244
_0807C9B4: .4byte IWRAM_START + 0x248
_0807C9B8: .4byte IWRAM_START + 0x24C
_0807C9BC: .4byte gUnknown_080E0124

.if 00
	thumb_func_start sub_807C9C0
sub_807C9C0: @ 0x0807C9C0
	push {r4, lr}
	mov ip, r0
	ldr r2, _0807CA58 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x2c
	strh r0, [r1]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r1, [r2, #8]
	adds r4, r2, #0
	movs r1, #0xc1
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0x40
	strb r0, [r1]
	movs r1, #0xc2
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	movs r0, #0x80
	strh r0, [r1]
	ldrh r0, [r4, #0x12]
	movs r1, #0xc3
	lsls r1, r1, #1
	add r1, ip
	strh r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	add r0, ip
	strh r3, [r0]
	movs r2, #0xc4
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r2]
	movs r2, #0xc6
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r2]
	movs r0, #0xc8
	lsls r0, r0, #1
	add r0, ip
	str r3, [r0]
	movs r0, #0xca
	lsls r0, r0, #1
	add r0, ip
	str r3, [r0]
	ldr r0, _0807CA5C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807CA60 @ =Task_807D0C4
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA58: .4byte gPlayer
_0807CA5C: .4byte gCurTask
_0807CA60: .4byte Task_807D0C4

.endif
