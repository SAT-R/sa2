.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080E0124
gUnknown_080E0124:
    .incbin "baserom.gba", 0x000E0124, 0x12

    .global gUnknown_080E0136
gUnknown_080E0136:
    .byte 0, 0, 0, 0, 1, 1, 1, 2
.align 2 , 0

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

	thumb_func_start sub_807CA64
sub_807CA64: @ 0x0807CA64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	subs r0, #0x10
	lsls r5, r0, #8
	movs r2, #0xc3
	lsls r2, r2, #1
	adds r1, r4, r2
	ldrh r0, [r1]
	movs r7, #0
	ldrsh r3, [r1, r7]
	cmp r3, #0
	bgt _0807CAA4
	movs r6, #1
	subs r0, #0x40
	strh r0, [r1]
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0807CAA0 @ =0xFFFFFD00
	cmp r0, r2
	bge _0807CA9A
	adds r3, r2, #0
_0807CA9A:
	strh r3, [r1]
	b _0807CAC8
	.align 2, 0
_0807CAA0: .4byte 0xFFFFFD00
_0807CAA4:
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	cmp r3, r0
	ble _0807CAB0
	adds r2, r0, #0
_0807CAB0:
	strh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	rsbs r0, r0, #0
	asrs r0, r0, #4
	movs r3, #0x40
	rsbs r3, r3, #0
	cmp r0, r3
	ble _0807CAC4
	adds r0, r3, #0
_0807CAC4:
	adds r0, r2, r0
	strh r0, [r1]
_0807CAC8:
	ldr r2, _0807CB20 @ =gPlayer
	movs r7, #0xc3
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2, #0xc]
	adds r1, r0, r1
	str r1, [r2, #0xc]
	adds r0, r5, #0
	cmp r0, r1
	ble _0807CAE2
	adds r0, r1, #0
_0807CAE2:
	str r0, [r2, #0xc]
	movs r7, #0xc2
	lsls r7, r7, #1
	adds r3, r4, r7
	ldrh r0, [r3]
	adds r0, #0x40
	movs r5, #0
	strh r0, [r3]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0807CB02
	adds r2, r1, #0
_0807CB02:
	strh r2, [r3]
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r1, [r2]
	cmp r1, #0
	ble _0807CB24
	movs r7, #0
	ldrsh r0, [r3, r7]
	subs r0, r1, r0
	str r0, [r2]
	cmp r0, #0
	bge _0807CB44
	str r5, [r2]
	b _0807CB44
	.align 2, 0
_0807CB20: .4byte gPlayer
_0807CB24:
	cmp r1, #0
	bge _0807CB38
	movs r7, #0
	ldrsh r0, [r3, r7]
	adds r0, r1, r0
	str r0, [r2]
	cmp r0, #0
	ble _0807CB44
	str r5, [r2]
	b _0807CB44
_0807CB38:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl sub_807CC28
_0807CB44:
	ldr r2, _0807CB74 @ =gPlayer
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	movs r7, #0xc8
	lsls r7, r7, #1
	adds r1, r4, r7
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r0, #0
	cmp r6, #2
	bne _0807CB6E
	movs r0, #1
_0807CB6E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807CB74: .4byte gPlayer

	thumb_func_start sub_807CB78
sub_807CB78: @ 0x0807CB78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r3, _0807CBD0 @ =gPlayer
	movs r0, #0x8b
	lsls r0, r0, #2
	adds r2, r4, r0
	ldr r1, _0807CBD4 @ =0x00000236
	adds r0, r4, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3, #0xc]
	cmp r1, r0
	ble _0807CBDC
	movs r0, #0xc3
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	subs r0, #0x10
	strh r0, [r1]
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0807CBD8 @ =0xFFFFFD00
	cmp r0, r2
	bge _0807CBB4
	adds r3, r2, #0
_0807CBB4:
	strh r3, [r1]
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r4, #0
	bl sub_807CC28
	b _0807CBDE
	.align 2, 0
_0807CBD0: .4byte gPlayer
_0807CBD4: .4byte 0x00000236
_0807CBD8: .4byte 0xFFFFFD00
_0807CBDC:
	movs r5, #1
_0807CBDE:
	ldr r2, _0807CC24 @ =gPlayer
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	movs r6, #0xc8
	lsls r6, r6, #1
	adds r1, r4, r6
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	adds r3, #4
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	adds r6, #4
	adds r1, r4, r6
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807CC24: .4byte gPlayer

	thumb_func_start sub_807CC28
sub_807CC28: @ 0x0807CC28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrh r5, [r0]
	ldr r2, _0807CCB4 @ =0x00000246
	adds r0, r6, r2
	ldrh r4, [r0]
	subs r1, #0xbc
	adds r0, r6, r1
	ldr r0, [r0]
	rsbs r0, r0, #0
	subs r2, #2
	adds r1, r6, r2
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	movs r5, #0xc8
	lsls r5, r5, #1
	adds r3, r6, r5
	asrs r0, r0, #0x10
	ldr r2, _0807CCB8 @ =gSineTable
	movs r1, #0xc1
	lsls r1, r1, #1
	adds r4, r6, r1
	ldrb r1, [r4]
	lsls r1, r1, #3
	adds r5, #0x70
	adds r1, r1, r5
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, #0x80
	strh r0, [r1]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0xc0
	lsls r3, r3, #3
	cmp r0, r3
	bls _0807CCA2
	adds r2, r3, #0
_0807CCA2:
	strh r2, [r1]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	adds r0, r0, r1
	strb r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CCB4: .4byte 0x00000246
_0807CCB8: .4byte gSineTable

	thumb_func_start sub_807CCBC
sub_807CCBC: @ 0x0807CCBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
	ldr r0, _0807CD64 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807CCDC
	movs r1, #1
	mov sl, r1
_0807CCDC:
	movs r2, #0
	mov r8, r2
_0807CCE0:
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #4
	movs r2, #0xcc
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r0, r7, r0
	bl sub_8004558
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0807CCE0
	movs r0, #0
	mov r8, r0
	ldr r1, _0807CD68 @ =gSineTable
	mov sb, r1
_0807CD0A:
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #3
	adds r6, r7, r0
	ldr r4, [r6]
	cmp r4, #0
	bne _0807CD7E
	mov r0, sl
	cmp r0, #0
	bne _0807CD22
	b _0807CE74
_0807CD22:
	bl Random
	ldr r2, _0807CD6C @ =gUnknown_080E0136
	movs r5, #7
	adds r1, r5, #0
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	str r0, [r6]
	bl Random
	strb r0, [r6, #4]
	str r4, [r6, #8]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807CD70
	bl Random
	adds r1, r5, #0
	ands r1, r0
	rsbs r1, r1, #0
	lsls r1, r1, #8
	b _0807CD74
	.align 2, 0
_0807CD64: .4byte gUnknown_03005590
_0807CD68: .4byte gSineTable
_0807CD6C: .4byte gUnknown_080E0136
_0807CD70:
	movs r1, #0x80
	lsls r1, r1, #6
_0807CD74:
	str r1, [r6, #0xc]
	movs r0, #0
	str r0, [r6, #0x10]
	str r0, [r6, #0x14]
	mov sl, r0
_0807CD7E:
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807CD88
	rsbs r0, r1, #0
_0807CD88:
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0807CDA0
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	ble _0807CD9C
	adds r2, r3, #0
_0807CD9C:
	adds r0, r2, #0
	b _0807CDA2
_0807CDA0:
	movs r0, #0x40
_0807CDA2:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r1, r0
	str r3, [r6, #0xc]
	cmp r3, #0
	ble _0807CE12
	rsbs r0, r3, #0
	str r0, [r6, #0x14]
	asrs r1, r3, #5
	ldr r2, _0807CE04 @ =0x00000246
	adds r0, r7, r2
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r2, r0, #0x10
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrh r1, [r0]
	cmp r1, r2
	bge _0807CDCE
	adds r1, r2, #0
_0807CDCE:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	asrs r1, r3, #8
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0807CE08
	adds r1, r2, #0
	cmp r0, #8
	ble _0807CE0A
	movs r1, #8
	b _0807CE0A
	.align 2, 0
_0807CE04: .4byte 0x00000246
_0807CE08:
	movs r1, #2
_0807CE0A:
	ldrb r0, [r6, #4]
	adds r0, r0, r1
	strb r0, [r6, #4]
	b _0807CE74
_0807CE12:
	asrs r0, r3, #8
	rsbs r0, r0, #0
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrh r2, [r1]
	cmp r0, r2
	bge _0807CE70
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	str r0, [r6, #0x14]
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r5, [r0]
	subs r2, #2
	adds r0, r7, r2
	ldrh r4, [r0]
	rsbs r0, r3, #0
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	asrs r0, r0, #0x10
	ldrb r1, [r6, #4]
	lsls r1, r1, #3
	add r1, sb
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	ldrb r0, [r6, #4]
	adds r0, #8
	strb r0, [r6, #4]
	b _0807CE74
_0807CE70:
	movs r0, #0
	str r0, [r6]
_0807CE74:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bhi _0807CE84
	b _0807CD0A
_0807CE84:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807CE94
sub_807CE94: @ 0x0807CE94
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r7, _0807CEEC @ =gCamera
_0807CE9C:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r3, [r4]
	cmp r3, #0
	beq _0807CF1A
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r7]
	subs r2, r2, r0
	strh r2, [r3, #0x16]
	ldr r3, [r4]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r7, #4]
	subs r2, r2, r0
	strh r2, [r3, #0x18]
	ldrb r0, [r4, #4]
	cmp r0, #0x7b
	bhi _0807CEF0
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0807CEF6
	.align 2, 0
_0807CEEC: .4byte gCamera
_0807CEF0:
	ldr r1, [r4]
	movs r0, #0x90
	lsls r0, r0, #3
_0807CEF6:
	strh r0, [r1, #0x1a]
	ldr r1, [r4, #0xc]
	ldr r0, _0807CF08 @ =0xFFFFF000
	cmp r1, r0
	ble _0807CF0C
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #6
	b _0807CF12
	.align 2, 0
_0807CF08: .4byte 0xFFFFF000
_0807CF0C:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
_0807CF12:
	str r0, [r1, #0x10]
	adds r0, r1, #0
	bl sub_80051E8
_0807CF1A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0807CE9C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
    
	thumb_func_start sub_807CF2C
sub_807CF2C: @ 0x0807CF2C
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	ldr r2, [r0]
	ldr r1, _0807CFA4 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0x8b
	lsls r4, r4, #2
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807CF9E
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807CF9E
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0807CFA8 @ =0x0000023A
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807CF9E
	subs r2, #4
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807CFAC
_0807CF9E:
	movs r0, #1
	b _0807CFAE
	.align 2, 0
_0807CFA4: .4byte gCamera
_0807CFA8: .4byte 0x0000023A
_0807CFAC:
	movs r0, #0
_0807CFAE:
	pop {r4, r5}
	pop {r1}
	bx r1
    
.if 0
.endif
