.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    
    .global gUnknown_080D8F30
gUnknown_080D8F30:
    .2byte 0x1EA, 0     @ SA2_ANIM_KUBINAGA_BASE, Variant 0
    .2byte 0x1EA, 1     @ SA2_ANIM_KUBINAGA_BASE, Variant 1

.text
.syntax unified
.arm

	thumb_func_start sub_80528AC
sub_80528AC: @ 0x080528AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _08052944 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov sb, r0
	ldr r2, _08052948 @ =IWRAM_START + 0xC
	adds r2, r2, r3
	mov r8, r2
	ldr r6, _0805294C @ =IWRAM_START + 0x3C
	adds r6, r6, r3
	mov sl, r6
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r1, _08052950 @ =IWRAM_START + 0xA8
	adds r0, r3, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, _08052954 @ =IWRAM_START + 0xAC
	adds r0, r3, r2
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r6, _08052958 @ =IWRAM_START + 0xB0
	ldr r0, [r6, r3]
	mov ip, r0
	mov r6, ip
	asrs r6, r6, #8
	str r6, [sp, #0x18]
	str r6, [sp, #0x20]
	ldr r0, _0805295C @ =IWRAM_START + 0xB4
	adds r3, r3, r0
	ldr r0, [r3]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	str r0, [sp, #0x24]
	ldr r3, _08052960 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	mov r6, r8
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	mov r0, sp
	ldrh r3, [r0, #0x20]
	ldr r6, _08052960 @ =gCamera
	ldr r0, [r6]
	subs r0, r3, r0
	mov r6, sl
	strh r0, [r6, #0x16]
	ldr r6, _08052960 @ =gCamera
	ldr r0, [r6, #4]
	subs r3, r3, r0
	mov r0, sl
	strh r3, [r0, #0x18]
	mov r0, r8
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052964
	ldr r1, _08052944 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08052ADC
	.align 2, 0
_08052944: .4byte gCurTask
_08052948: .4byte IWRAM_START + 0xC
_0805294C: .4byte IWRAM_START + 0x3C
_08052950: .4byte IWRAM_START + 0xA8
_08052954: .4byte IWRAM_START + 0xAC
_08052958: .4byte IWRAM_START + 0xB0
_0805295C: .4byte IWRAM_START + 0xB4
_08052960: .4byte gCamera
_08052964:
	mov r0, sl
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052984
	ldr r2, _08052980 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08052ADC
	.align 2, 0
_08052980: .4byte gCurTask
_08052984:
	ldr r3, _080529E8 @ =gCamera
	ldr r1, [r3]
	movs r6, #0xb8
	lsls r6, r6, #1
	adds r0, r1, r6
	cmp r4, r0
	bgt _080529AE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _080529AE
	ldr r1, [r3, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _080529AE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _080529F0
_080529AE:
	mov r3, r8
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080529D4
	movs r6, #0x18
	ldrsh r0, [r3, r6]
	adds r0, #0x80
	cmp r0, #0
	blt _080529D4
	movs r0, #0x18
	ldrsh r1, [r3, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080529F0
_080529D4:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	ldr r0, _080529EC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08052ADC
	.align 2, 0
_080529E8: .4byte gCamera
_080529EC: .4byte gCurTask
_080529F0:
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	mov r1, sb
	adds r1, #0xac
	ldr r1, [r1]
	bl sub_80122DC
	mov r1, sb
	adds r1, #0xb8
	ldrh r0, [r1]
	cmp r0, #0
	beq _08052A90
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _08052A98
	mov r0, sp
	movs r2, #1
	strh r2, [r0]
	mov r1, sp
	ldr r0, _08052A50 @ =0x000001EB
	strh r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #4]
	mov r0, sb
	adds r0, #0xbc
	ldrh r0, [r0]
	strh r0, [r1, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r1, #8]
	mov r0, sb
	adds r0, #0xc0
	ldrb r1, [r0]
	cmp r1, #0
	bne _08052A58
	subs r0, #0x10
	ldr r0, [r0]
	str r0, [sp, #0xc]
	mov r0, sb
	adds r0, #0xb4
	ldr r0, [r0]
	ldr r3, _08052A54 @ =0xFFFFF600
	adds r0, r0, r3
	b _08052A80
	.align 2, 0
_08052A50: .4byte 0x000001EB
_08052A54: .4byte 0xFFFFF600
_08052A58:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08052A6E
	mov r0, sb
	adds r0, #0xb0
	ldr r0, [r0]
	movs r6, #0xa0
	lsls r6, r6, #4
	adds r0, r0, r6
	b _08052A78
_08052A6E:
	mov r0, sb
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r1, _08052A8C @ =0xFFFFF600
	adds r0, r0, r1
_08052A78:
	str r0, [sp, #0xc]
	mov r0, sb
	adds r0, #0xb4
	ldr r0, [r0]
_08052A80:
	str r0, [sp, #0x10]
	mov r0, sp
	bl CreateProjectile
	b _08052A98
	.align 2, 0
_08052A8C: .4byte 0xFFFFF600
_08052A90:
	ldr r0, _08052ABC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08052AC0 @ =sub_8052AEC
	str r0, [r1, #8]
_08052A98:
	mov r0, r8
	bl DisplaySprite
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08052AC4
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r2, #0x10]
	mov r0, r8
	bl DisplaySprite
	b _08052AD6
	.align 2, 0
_08052ABC: .4byte gCurTask
_08052AC0: .4byte sub_8052AEC
_08052AC4:
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	eors r0, r1
	str r0, [r3, #0x10]
	mov r0, r8
	bl DisplaySprite
_08052AD6:
	mov r0, sb
	bl sub_8052CC8
_08052ADC:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8052AEC
sub_8052AEC: @ 0x08052AEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r1, _08052BA8 @ =gCurTask
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r2, _08052BAC @ =IWRAM_START + 0xC
	adds r7, r4, r2
	ldr r0, _08052BB0 @ =IWRAM_START + 0x3C
	adds r0, r0, r4
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	adds r2, #0x9c
	adds r0, r4, r2
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r5, r1, #0
	adds r2, #4
	adds r0, r4, r2
	ldr r2, [r0]
	asrs r2, r2, #8
	str r2, [sp, #0x18]
	adds r6, r2, #0
	ldr r2, _08052BB4 @ =IWRAM_START + 0xB0
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #4]
	adds r2, #4
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, _08052BB8 @ =gCamera
	mov sl, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r2, sl
	ldr r0, [r2, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	mov r0, sp
	ldrh r2, [r0, #4]
	strh r2, [r0, #0x14]
	mov r0, sl
	ldr r0, [r0]
	mov ip, r0
	mov r0, sp
	ldrh r2, [r0, #0x14]
	mov r0, ip
	subs r2, r2, r0
	mov r0, sb
	strh r2, [r0, #0x16]
	mov r2, sl
	ldr r2, [r2, #4]
	mov ip, r2
	mov r2, sp
	ldrh r0, [r2, #0x14]
	mov r2, ip
	subs r0, r0, r2
	mov r2, sb
	strh r0, [r2, #0x18]
	ldr r0, _08052BBC @ =IWRAM_START + 0xBE
	adds r4, r4, r0
	ldr r2, _08052BC0 @ =0xFFFFFE00
	adds r0, r2, #0
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	adds r0, r7, #0
	ldr r2, [sp, #0x18]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052BC4
	ldr r1, _08052BA8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08052CB6
	.align 2, 0
_08052BA8: .4byte gCurTask
_08052BAC: .4byte IWRAM_START + 0xC
_08052BB0: .4byte IWRAM_START + 0x3C
_08052BB4: .4byte IWRAM_START + 0xB0
_08052BB8: .4byte gCamera
_08052BBC: .4byte IWRAM_START + 0xBE
_08052BC0: .4byte 0xFFFFFE00
_08052BC4:
	mov r0, sb
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08052BE4
	ldr r2, _08052BE0 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08052CB6
	.align 2, 0
_08052BE0: .4byte gCurTask
_08052BE4:
	mov r0, sl
	ldr r1, [r0]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _08052C0E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	blt _08052C0E
	mov r0, sl
	ldr r1, [r0, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r6, r0
	bgt _08052C0E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	bge _08052C48
_08052C0E:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08052C32
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08052C32
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08052C48
_08052C32:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08052C44 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08052CB6
	.align 2, 0
_08052C44: .4byte gCurTask
_08052C48:
	mov r0, r8
	adds r0, #0xa8
	ldr r0, [r0]
	mov r1, r8
	adds r1, #0xac
	ldr r1, [r1]
	bl sub_80122DC
	mov r1, r8
	adds r1, #0xbe
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08052C76
	movs r0, #0
	strh r0, [r1]
	subs r1, #6
	movs r0, #0x78
	strh r0, [r1]
	ldr r0, _08052C98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08052C9C @ =sub_80524D0
	str r0, [r1, #8]
_08052C76:
	adds r0, r7, #0
	bl DisplaySprite
	adds r0, r7, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08052CA0
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl DisplaySprite
	b _08052CB0
	.align 2, 0
_08052C98: .4byte gCurTask
_08052C9C: .4byte sub_80524D0
_08052CA0:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl DisplaySprite
_08052CB0:
	mov r0, r8
	bl sub_8052CC8
_08052CB6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8052CC8
sub_8052CC8: @ 0x08052CC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	movs r0, #0x3c
	adds r0, r0, r7
	mov r8, r0
	adds r4, r7, #0
	adds r4, #0x6c
	adds r1, r7, #0
	adds r1, #0x9c
	str r1, [sp]
	ldr r3, _08052D70 @ =gSineTable
	adds r0, r7, #0
	adds r0, #0xba
	ldrh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r1, r0, r3
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	asrs r0, r0, #5
	str r0, [sp, #4]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	asrs r0, r0, #5
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0xbe
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xe0
	lsls r1, r1, #4
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	cmp r0, sl
	bhs _08052DAE
_08052D30:
	adds r2, r0, #1
	ldr r3, [sp, #4]
	adds r1, r2, #0
	muls r1, r3, r1
	adds r0, r7, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	ldr r0, [sp, #8]
	adds r1, r2, #0
	muls r1, r0, r1
	adds r0, r7, #0
	adds r0, #0xac
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r6, r1, #8
	ldr r1, _08052D74 @ =gCamera
	ldr r0, [r1]
	subs r3, r5, r0
	strh r3, [r4, #0x16]
	adds r0, r7, #0
	adds r0, #0xc0
	ldrb r1, [r0]
	mov sb, r2
	cmp r1, #0
	bne _08052D78
	ldr r2, _08052D74 @ =gCamera
	ldr r0, [r2, #4]
	subs r0, r6, r0
	subs r0, #0xa
	b _08052D92
	.align 2, 0
_08052D70: .4byte gSineTable
_08052D74: .4byte gCamera
_08052D78:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08052D86
	adds r0, r3, #0
	adds r0, #0xa
	b _08052D8A
_08052D86:
	adds r0, r3, #0
	subs r0, #0xa
_08052D8A:
	strh r0, [r4, #0x16]
	ldr r3, _08052E54 @ =gCamera
	ldr r0, [r3, #4]
	subs r0, r6, r0
_08052D92:
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800C84C
	adds r0, r4, #0
	bl DisplaySprite
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	blo _08052D30
_08052DAE:
	adds r4, r7, #0
	adds r4, #0xb0
	ldr r3, _08052E58 @ =gSineTable
	movs r2, #0xba
	adds r2, r2, r7
	mov ip, r2
	ldrh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xbe
	adds r0, r0, r7
	mov sb, r0
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	muls r0, r1, r0
	asrs r0, r0, #6
	adds r1, r7, #0
	adds r1, #0xa8
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r4]
	adds r2, r7, #0
	adds r2, #0xb4
	mov r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r3, sb
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	muls r1, r0, r1
	asrs r1, r1, #6
	adds r0, r7, #0
	adds r0, #0xac
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r4]
	asrs r5, r0, #8
	asrs r6, r1, #8
	adds r3, r5, #0
	ldr r4, _08052E54 @ =gCamera
	ldr r0, [r4]
	subs r1, r3, r0
	mov r0, r8
	strh r1, [r0, #0x16]
	adds r0, r7, #0
	adds r0, #0xc0
	ldrb r2, [r0]
	cmp r2, #0
	bne _08052E60
	adds r2, r6, #0
	ldr r0, [r4, #4]
	subs r0, r2, r0
	subs r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x18]
	ldr r1, _08052E5C @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r2
	adds r0, #0xa
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldr r2, [sp]
	strh r0, [r2]
	b _08052EBE
	.align 2, 0
_08052E54: .4byte gCamera
_08052E58: .4byte gSineTable
_08052E5C: .4byte gPlayer
_08052E60:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08052E8C
	adds r0, r1, #0
	adds r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r1, _08052E88 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	adds r1, #0xa
	b _08052EA8
	.align 2, 0
_08052E88: .4byte gPlayer
_08052E8C:
	adds r0, r1, #0
	subs r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r1, _08052F08 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	subs r1, #0xa
_08052EA8:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldr r2, [sp]
	strh r0, [r2]
	ldr r0, _08052F0C @ =gCamera
	ldr r0, [r0, #4]
	subs r0, r6, r0
	mov r3, r8
	strh r0, [r3, #0x18]
_08052EBE:
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800C84C
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	mov r2, r8
	ldrh r0, [r2, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r2, #0x18]
	strh r0, [r1, #8]
	ldrh r1, [r1]
	adds r0, r7, #0
	adds r0, #0xbc
	strh r1, [r0]
	ldr r3, [sp]
	ldrh r2, [r3]
	ldr r1, _08052F10 @ =0xFFFFFF00
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	bls _08052F14
	movs r0, #0xf4
	lsls r0, r0, #1
	mov r2, r8
	strh r0, [r2, #0xa]
	mov r1, r8
	adds r1, #0x20
	movs r0, #0
	b _08052F28
	.align 2, 0
_08052F08: .4byte gPlayer
_08052F0C: .4byte gCamera
_08052F10: .4byte 0xFFFFFF00
_08052F14:
	adds r0, r1, #0
	eors r0, r2
	ldr r3, [sp]
	strh r0, [r3]
	movs r0, #0xf4
	lsls r0, r0, #1
	mov r1, r8
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
_08052F28:
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08052F68 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08052F6C @ =0x00002060
	orrs r0, r1
	mov r2, r8
	str r0, [r2, #0x10]
	mov r0, r8
	bl UpdateSpriteAnimation
	mov r0, r8
	ldr r1, [sp]
	bl sub_8004860
	mov r0, r8
	bl DisplaySprite
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052F68: .4byte gUnknown_030054B8
_08052F6C: .4byte 0x00002060

	thumb_func_start sub_8052F70
sub_8052F70: @ 0x08052F70
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
