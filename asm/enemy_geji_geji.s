.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D8F50
gUnknown_080D8F50:
    .incbin "baserom.gba", 0x000D8F50, 0x20

.text
.syntax unified
.arm

	thumb_func_start Create_GejiGeji
Create_GejiGeji: @ 0x08057D84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08057E04 @ =sub_8057F80
	movs r1, #0xa0
	lsls r1, r1, #2
	ldr r2, _08057E08 @ =0x00004040
	ldr r3, _08057E0C @ =sub_8058480
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r5, r0
	adds r0, #0xc
	adds r7, r5, r0
	movs r2, #0
	mov r1, sb
	strh r1, [r3, #4]
	mov r0, r8
	strh r0, [r3, #6]
	str r6, [r3]
	ldrb r0, [r6]
	strb r0, [r3, #8]
	strb r4, [r3, #9]
	ldrb r0, [r6]
	lsls r0, r0, #3
	mov r4, sb
	lsls r1, r4, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x6c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r4, r8
	lsls r1, r4, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x70]
	str r2, [r3, #0x74]
	str r2, [r3, #0x78]
	ldrb r0, [r6, #5]
	ldrb r1, [r6, #6]
	cmp r0, r1
	bls _08057E14
	ldr r2, _08057E10 @ =IWRAM_START + 0x27C
	adds r1, r5, r2
	movs r0, #0
	b _08057E1A
	.align 2, 0
_08057E04: .4byte sub_8057F80
_08057E08: .4byte 0x00004040
_08057E0C: .4byte sub_8058480
_08057E10: .4byte IWRAM_START + 0x27C
_08057E14:
	ldr r4, _08057F70 @ =IWRAM_START + 0x27C
	adds r1, r5, r4
	movs r0, #1
_08057E1A:
	strb r0, [r1]
	ldr r1, _08057F74 @ =0x0000027D
	adds r0, r3, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08057F78 @ =0x0000027E
	adds r0, r3, r2
	strb r1, [r0]
	movs r4, #0
	mov r0, sb
	lsls r0, r0, #8
	mov sb, r0
	mov r1, r8
	lsls r1, r1, #8
	mov ip, r1
	ldr r2, _08057F7C @ =gUnknown_080D8F50
	mov sl, r2
	adds r0, r7, #0
	adds r0, #0x20
	str r0, [sp, #4]
	adds r1, r7, #0
	adds r1, #0x21
	str r1, [sp, #8]
	adds r2, r7, #0
	adds r2, #0x22
	str r2, [sp, #0xc]
	adds r0, #5
	str r0, [sp, #0x10]
	adds r1, r3, #0
	adds r1, #0x3c
	str r1, [sp, #0x14]
	adds r2, r3, #0
	adds r2, #0x5c
	str r2, [sp, #0x18]
	adds r0, r3, #0
	adds r0, #0x5d
	str r0, [sp, #0x1c]
	adds r1, #0x22
	str r1, [sp, #0x20]
	adds r2, #5
	str r2, [sp, #0x24]
	movs r0, #0x7c
	adds r0, r0, r3
	mov r8, r0
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r5, r3, r1
_08057E78:
	lsls r1, r4, #2
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r3, #0x6c]
	asrs r0, r0, #8
	str r0, [r2]
	adds r1, r5, r1
	ldr r0, [r3, #0x70]
	asrs r0, r0, #8
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _08057E78
	ldrb r0, [r6]
	lsls r0, r0, #3
	add r0, sb
	movs r4, #0
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	add r0, ip
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r5, r3, r2
	ldrb r0, [r5]
	lsls r0, r0, #3
	add r0, sl
	ldr r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	ldrb r0, [r5]
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xa]
	ldrb r0, [r5]
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	ldr r2, [sp, #8]
	strb r0, [r2]
	movs r0, #0x10
	mov sb, r0
	mov r2, sb
	ldr r1, [sp, #0xc]
	strb r2, [r1]
	movs r1, #0
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	str r2, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	ldr r7, [sp, #0x14]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	add r0, sl
	ldr r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xa]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #0x18]
	strb r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x1c]
	strb r0, [r2]
	mov r0, sb
	ldr r4, [sp, #0x20]
	strb r0, [r4]
	movs r2, #0
	ldr r1, [sp, #0x24]
	strb r2, [r1]
	mov r4, r8
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057F70: .4byte IWRAM_START + 0x27C
_08057F74: .4byte 0x0000027D
_08057F78: .4byte 0x0000027E
_08057F7C: .4byte gUnknown_080D8F50

	thumb_func_start sub_8057F80
sub_8057F80: @ 0x08057F80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08057FC8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	adds r1, #0xc
	adds r7, r0, r1
	ldr r2, _08057FCC @ =IWRAM_START + 0x3C
	adds r2, r2, r0
	mov r8, r2
	ldr r3, [r6]
	str r3, [sp, #4]
	ldr r4, _08057FD0 @ =IWRAM_START + 0x27C
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08057FE4
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08057FD4
	ldr r0, [r6, #0x78]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r6, #0x78]
	b _08058002
	.align 2, 0
_08057FC8: .4byte gCurTask
_08057FCC: .4byte IWRAM_START + 0x3C
_08057FD0: .4byte IWRAM_START + 0x27C
_08057FD4:
	ldr r0, [r6, #0x78]
	ldr r2, _08057FE0 @ =0xFFFFFE80
	adds r0, r0, r2
	str r0, [r6, #0x78]
	b _08058002
	.align 2, 0
_08057FE0: .4byte 0xFFFFFE80
_08057FE4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08057FFA
	ldr r0, [r6, #0x74]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r0, r3
	b _08058000
_08057FFA:
	ldr r0, [r6, #0x74]
	ldr r4, _080580F8 @ =0xFFFFFE80
	adds r0, r0, r4
_08058000:
	str r0, [r6, #0x74]
_08058002:
	ldr r1, [r6, #0x6c]
	ldr r0, [r6, #0x74]
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #8]
	ldr r2, [r6, #0x70]
	ldr r0, [r6, #0x78]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #0xc]
	ldr r5, _080580FC @ =gCamera
	ldr r0, [r5]
	adds r3, r1, #0
	subs r0, r3, r0
	strh r0, [r7, #0x16]
	ldr r0, [r5, #4]
	ldr r4, [sp, #0xc]
	subs r0, r4, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080580EE
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x7c
	str r0, [sp, #0x10]
	ldr r1, _08058100 @ =0x0000027E
	adds r1, r1, r6
	mov sl, r1
	mov sb, r5
_08058044:
	adds r5, r4, #1
	movs r0, #0xd
	muls r0, r5, r0
	mov r3, sl
	ldrb r2, [r3]
	subs r2, r2, r0
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #2
	ldr r0, [sp, #0x10]
	adds r4, r0, r2
	ldr r0, [r4]
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	movs r0, #0xbe
	lsls r0, r0, #1
	adds r3, r6, r0
	adds r3, r3, r2
	ldr r0, [r3]
	mov r2, sb
	ldr r1, [r2, #4]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x18]
	ldr r1, [r4]
	ldr r2, [r3]
	ldr r0, _08058104 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	movs r3, #0
	bl sub_800CA20
	lsls r5, r5, #0x18
	lsrs r4, r5, #0x18
	cmp r4, #3
	bls _08058044
	ldr r0, [r6, #0x6c]
	asrs r2, r0, #8
	ldr r3, _080580FC @ =gCamera
	ldr r1, [r3]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _080580C4
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080580C4
	ldr r0, [r6, #0x70]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080580C4
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805810C
_080580C4:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080580E8
	movs r4, #0x18
	ldrsh r0, [r7, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _080580E8
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805810C
_080580E8:
	ldrb r0, [r6, #8]
	ldr r1, [sp, #4]
	strb r0, [r1]
_080580EE:
	ldr r0, _08058108 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805823E
	.align 2, 0
_080580F8: .4byte 0xFFFFFE80
_080580FC: .4byte gCamera
_08058100: .4byte 0x0000027E
_08058104: .4byte gPlayer
_08058108: .4byte gCurTask
_0805810C:
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805815A
	ldr r1, [r6, #0x78]
	asrs r3, r1, #8
	ldr r4, [sp, #4]
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _08058144
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08058144
	ldr r0, _08058140 @ =0x0000027D
	adds r1, r6, r0
	b _080581A2
	.align 2, 0
_08058140: .4byte 0x0000027D
_08058144:
	asrs r1, r4, #8
	ldr r2, [sp, #4]
	ldrb r0, [r2, #6]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080581AE
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	b _08058198
_0805815A:
	ldr r1, [r6, #0x74]
	asrs r3, r1, #8
	ldr r4, [sp, #4]
	movs r0, #3
	ldrsb r0, [r4, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _08058184
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08058184
	ldr r0, _08058180 @ =0x0000027D
	adds r1, r6, r0
	b _080581A2
	.align 2, 0
_08058180: .4byte 0x0000027D
_08058184:
	asrs r1, r4, #8
	ldr r2, [sp, #4]
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080581AE
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
_08058198:
	ands r0, r1
	cmp r0, #0
	beq _080581AE
	ldr r3, _08058250 @ =0x0000027D
	adds r1, r6, r3
_080581A2:
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08058254 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058258 @ =sub_8058264
	str r0, [r1, #8]
_080581AE:
	ldr r4, [sp, #8]
	lsls r0, r4, #8
	ldr r2, [sp, #0xc]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, r8
	bl sub_8004558
	movs r4, #0
	ldr r3, _0805825C @ =0x0000027E
	adds r3, r3, r6
	mov sb, r3
	ldr r7, _08058260 @ =gCamera
_080581D6:
	adds r4, #1
	movs r0, #0xd
	muls r0, r4, r0
	mov r1, sb
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r5, #0x3f
	ands r2, r5
	lsls r2, r2, #2
	ldr r3, [sp, #0x10]
	adds r0, r3, r2
	ldr r0, [r0]
	ldr r1, [r7]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	movs r3, #0xbe
	lsls r3, r3, #1
	adds r0, r6, r3
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #3
	bls _080581D6
	ldr r2, _0805825C @ =0x0000027E
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	ands r0, r5
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r4, [sp, #8]
	str r4, [r0]
	ldrb r1, [r1]
	lsls r1, r1, #2
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r3, [sp, #0xc]
	str r3, [r0]
_0805823E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058250: .4byte 0x0000027D
_08058254: .4byte gCurTask
_08058258: .4byte sub_8058264
_0805825C: .4byte 0x0000027E
_08058260: .4byte gCamera

	thumb_func_start sub_8058264
sub_8058264: @ 0x08058264
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _080582E4 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _080582E8 @ =IWRAM_START + 0xC
	adds r6, r4, r1
	ldr r2, [r7]
	mov sl, r2
	ldr r1, [r7, #0x6c]
	ldr r0, [r7, #0x74]
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp]
	ldr r2, [r7, #0x70]
	ldr r0, [r7, #0x78]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #4]
	ldr r3, _080582EC @ =IWRAM_START + 0x27E
	adds r3, r4, r3
	str r3, [sp, #0xc]
	ldrb r3, [r3]
	lsls r3, r3, #2
	mov r8, r3
	ldr r5, _080582F0 @ =IWRAM_START + 0x7C
	adds r0, r4, r5
	add r0, r8
	ldr r0, [r0]
	ldr r3, _080582F4 @ =gCamera
	mov r8, r3
	ldr r5, [r3]
	subs r0, r0, r5
	strh r0, [r6, #0x16]
	ldr r3, [sp, #0xc]
	ldrb r0, [r3]
	lsls r0, r0, #2
	ldr r5, _080582F8 @ =IWRAM_START + 0x17C
	adds r4, r4, r5
	adds r4, r4, r0
	ldr r0, [r4]
	mov r4, r8
	ldr r3, [r4, #4]
	subs r0, r0, r3
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080582FC
	mov r5, sb
	ldr r0, [r5]
	bl TaskDestroy
	b _08058460
	.align 2, 0
_080582E4: .4byte gCurTask
_080582E8: .4byte IWRAM_START + 0xC
_080582EC: .4byte IWRAM_START + 0x27E
_080582F0: .4byte IWRAM_START + 0x7C
_080582F4: .4byte gCamera
_080582F8: .4byte IWRAM_START + 0x17C
_080582FC:
	ldr r0, [r7, #0x6c]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08058330
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08058330
	ldr r0, [r7, #0x70]
	asrs r1, r0, #8
	mov r4, r8
	ldr r3, [r4, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r3, r5
	cmp r1, r0
	bgt _08058330
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bge _08058368
_08058330:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08058354
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08058354
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058368
_08058354:
	ldrb r0, [r7, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08058364 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058460
	.align 2, 0
_08058364: .4byte gCurTask
_08058368:
	ldr r4, [sp]
	lsls r0, r4, #8
	ldr r5, [sp, #4]
	lsls r1, r5, #8
	bl sub_80122DC
	ldr r0, _080583A4 @ =0x0000027D
	adds r1, r7, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080583D0
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080583AC
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080583C4
	ldr r0, _080583A8 @ =0xFFFFF7FF
	ands r1, r0
	b _080583C6
	.align 2, 0
_080583A4: .4byte 0x0000027D
_080583A8: .4byte 0xFFFFF7FF
_080583AC:
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080583C4
	ldr r0, _080583C0 @ =0xFFFFFBFF
	ands r1, r0
	b _080583C6
	.align 2, 0
_080583C0: .4byte 0xFFFFFBFF
_080583C4:
	orrs r1, r2
_080583C6:
	str r1, [r6, #0x10]
	ldr r0, _08058470 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058474 @ =sub_8057F80
	str r0, [r1, #8]
_080583D0:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	adds r6, #0x3c
	adds r0, r6, #0
	bl sub_8004558
	movs r4, #0
	movs r2, #0x7c
	adds r2, r2, r7
	mov sl, r2
	ldr r3, _08058478 @ =0x0000027E
	adds r3, r3, r7
	mov sb, r3
	ldr r5, _0805847C @ =gCamera
	mov r8, r5
_080583F8:
	adds r4, #1
	movs r0, #0xd
	muls r0, r4, r0
	mov r1, sb
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r3, #0x3f
	ands r2, r3
	lsls r2, r2, #2
	mov r5, sl
	adds r0, r5, r2
	ldr r0, [r0]
	mov r5, r8
	ldr r1, [r5]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp, #8]
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r3, [sp, #8]
	cmp r4, #3
	bls _080583F8
	ldr r2, _08058478 @ =0x0000027E
	adds r1, r7, r2
	ldrb r0, [r1]
	adds r0, #1
	ands r0, r3
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r3, [sp]
	str r3, [r0]
	ldrb r1, [r1]
	lsls r1, r1, #2
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r7, r4
	adds r0, r0, r1
	ldr r5, [sp, #4]
	str r5, [r0]
_08058460:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058470: .4byte gCurTask
_08058474: .4byte sub_8057F80
_08058478: .4byte 0x0000027E
_0805847C: .4byte gCamera

	thumb_func_start sub_8058480
sub_8058480: @ 0x08058480
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
