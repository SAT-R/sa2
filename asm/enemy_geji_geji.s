.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D8F50
gUnknown_080D8F50:
    .incbin "baserom.gba", 0x000D8F50, 0x20

.text
.syntax unified
.arm

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
