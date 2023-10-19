.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.align 2 , 0
    .global sHeartOffsets
sHeartOffsets:
    .incbin "baserom.gba", 0x000D5684, 0xC0

.text
.syntax unified
.arm

.if 01
	thumb_func_start sub_8015E28
sub_8015E28: @ 0x08015E28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08015E4C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	movs r3, #0
	adds r1, #0xcc
	adds r0, r0, r1
	b _08015E62
	.align 2, 0
_08015E4C: .4byte gCurTask
_08015E50:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08015E5C
	b _08015FE2
_08015E5C:
	lsls r0, r3, #4
	adds r0, r5, r0
	adds r0, #0xcc
_08015E62:
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015E50
	cmp r3, #3
	bls _08015E6E
	b _08015FE2
_08015E6E:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r6, r5, r0
	lsls r3, r3, #4
	adds r0, r5, r3
	adds r0, #0xcc
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	adds r7, r0, r3
	ldr r1, _08015ED0 @ =gPlayer
	ldr r0, [r1, #8]
	str r0, [r7]
	adds r4, r5, #0
	adds r4, #0xc4
	adds r2, r4, r3
	ldr r0, [r1, #0xc]
	str r0, [r2]
	ldr r1, [r1, #0x20]
	movs r0, #1
	ands r1, r0
	mov r8, r3
	mov sb, r4
	cmp r1, #0
	beq _08015ED8
	ldr r3, _08015ED4 @ =sHeartOffsets
	mov r2, ip
	lsls r4, r2, #1
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r3, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r7]
	subs r0, r0, r1
	b _08015F00
	.align 2, 0
_08015ED0: .4byte gPlayer
_08015ED4: .4byte sHeartOffsets
_08015ED8:
	ldr r3, _08015F3C @ =sHeartOffsets
	mov r1, ip
	lsls r4, r1, #1
	adds r1, r4, r1
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r3, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r7]
	adds r0, r0, r1
_08015F00:
	str r0, [r7]
	adds r7, r3, #0
	ldr r0, _08015F40 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015F44
	mov r3, sb
	add r3, r8
	mov r2, ip
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r7, #4
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	subs r0, r0, r1
	b _08015F6C
	.align 2, 0
_08015F3C: .4byte sHeartOffsets
_08015F40: .4byte gUnknown_03005424
_08015F44:
	mov r3, sb
	add r3, r8
	mov r2, ip
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r7, #4
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	adds r0, r0, r1
_08015F6C:
	str r0, [r3]
	mov r1, r8
	adds r0, r5, r1
	adds r1, r0, #0
	adds r1, #0xc8
	movs r5, #0
	movs r4, #0
	strh r4, [r1]
	adds r0, #0xca
	strh r4, [r0]
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	subs r0, #0xa6
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08015FD8 @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	str r2, [r6, #0x10]
	ldr r0, _08015FDC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015FE0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r2
	str r0, [r6, #0x10]
	b _08015FE2
	.align 2, 0
_08015FD8: .4byte gPlayer
_08015FDC: .4byte gUnknown_03005424
_08015FE0:
	str r2, [r6, #0x10]
_08015FE2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.endif

	thumb_func_start TaskDestructor_8015FF0
TaskDestructor_8015FF0: @ 0x08015FF0
	push {r4, r5, lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_08015FFC:
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016016
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl VramFree
_08016016:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08015FFC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
