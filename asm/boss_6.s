.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

  	.global gUnknown_080D8030
gUnknown_080D8030:
    .incbin "baserom.gba", 0x000D8030, 0x4

    .global gUnknown_080D8034
gUnknown_080D8034:
    .incbin "baserom.gba", 0x000D8034, 0x10

    .global gUnknown_080D8044
gUnknown_080D8044:
    .incbin "baserom.gba", 0x000D8044, 0xA

    .global gUnknown_080D804E
gUnknown_080D804E:
    .incbin "baserom.gba", 0x000D804E, 0x28

    .global gUnknown_080D8076
gUnknown_080D8076:
    .incbin "baserom.gba", 0x000D8076, 0x28

    .global gUnknown_080D809E
gUnknown_080D809E:
    .incbin "baserom.gba", 0x000D809E, 0x28

    .global gUnknown_080D80C6
gUnknown_080D80C6:
    .incbin "baserom.gba", 0x000D80C6, 0x20

    .global gUnknown_080D80E6
gUnknown_080D80E6:
    .incbin "baserom.gba", 0x000D80E6, 0x22

.text
.syntax unified
.arm

	thumb_func_start Task_EggGoRound
Task_EggGoRound: @ 0x080477F0
	push {r4, r5, lr}
	ldr r0, _0804785C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_804787C
	adds r0, r4, #0
	bl sub_80475D0
	adds r0, r4, #0
	bl sub_8046328
	ldr r1, [r4]
	cmp r1, #0x3f
	bhi _08047836
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08047828
	ldr r0, _08047860 @ =IWRAM_START + 0x2B
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08047828:
	ldr r1, [r4, #0x10]
	subs r1, #0x2c
	ldr r0, [r4]
	subs r0, #0x20
	lsls r0, r0, #2
	subs r1, r1, r0
	str r1, [r4, #0x10]
_08047836:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _08047854
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, _0804785C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08047864 @ =sub_8046040
	str r0, [r1, #8]
_08047854:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804785C: .4byte gCurTask
_08047860: .4byte IWRAM_START + 0x2B
_08047864: .4byte sub_8046040

	thumb_func_start sub_8047868
sub_8047868: @ 0x08047868
	push {lr}
	ldr r0, _08047878 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08047878: .4byte gCurTask

	thumb_func_start sub_804787C
sub_804787C: @ 0x0804787C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	ldr r0, [r4]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r1, [r4, #4]
	adds r1, r1, r2
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _080478CC @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	adds r0, r0, r1
	ldr r1, _080478D0 @ =0x0003FFFF
	ands r0, r1
	str r0, [r4, #0x14]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080478CC: .4byte sub_801EE64
_080478D0: .4byte 0x0003FFFF

	thumb_func_start sub_80478D4
sub_80478D4: @ 0x080478D4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08047934 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x10]
	adds r0, r0, r2
	ldr r1, _08047938 @ =0x0003FFFF
	ands r0, r1
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0804792A
	ldr r0, _0804793C @ =0xFFFFFF00
	cmp r2, r0
	beq _0804792A
	subs r0, r2, #1
	str r0, [r4, #0x10]
_0804792A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047934: .4byte sub_801EE64
_08047938: .4byte 0x0003FFFF
_0804793C: .4byte 0xFFFFFF00

	thumb_func_start sub_8047940
sub_8047940: @ 0x08047940
	push {lr}
	adds r2, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08047970
	ldr r0, _08047974 @ =0x000002B5
	strh r0, [r3, #0xa]
	subs r0, #0x99
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08047978 @ =0x0000021D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_08047970:
	pop {r0}
	bx r0
	.align 2, 0
_08047974: .4byte 0x000002B5
_08047978: .4byte 0x0000021D

	thumb_func_start sub_804797C
sub_804797C: @ 0x0804797C
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x6c
	ldr r0, [r4, #0xc]
	adds r0, #0x30
	str r0, [r4, #0xc]
	ldr r0, [r2, #0x6c]
	ldr r1, [r4, #8]
	adds r0, r0, r1
	str r0, [r2, #0x6c]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, #0x14
	ldr r1, [r2, #0x6c]
	asrs r1, r1, #8
	ldr r2, _080479EC @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _080479E2
	ldr r0, [r4, #8]
	subs r0, #0x40
	str r0, [r4, #8]
	cmp r0, #0
	bge _080479C4
	movs r0, #0
	str r0, [r4, #8]
_080479C4:
	ldr r1, [r4, #0xc]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	str r0, [r4, #0xc]
	lsls r1, r5, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_080479E2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080479EC: .4byte sub_801EC3C

	thumb_func_start TaskDestructor_EggGoRound
TaskDestructor_EggGoRound: @ 0x080479F0
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08047A48 @ =IWRAM_START + 0x3A0
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A4C @ =IWRAM_START + 0x370
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A50 @ =IWRAM_START + 0x1C8
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A54 @ =IWRAM_START + 0x200
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A58 @ =IWRAM_START + 0x260
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08047A5C @ =IWRAM_START + 0x2A4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _08047A60 @ =IWRAM_START + 0x230
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _08047A64 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047A48: .4byte IWRAM_START + 0x3A0
_08047A4C: .4byte IWRAM_START + 0x370
_08047A50: .4byte IWRAM_START + 0x1C8
_08047A54: .4byte IWRAM_START + 0x200
_08047A58: .4byte IWRAM_START + 0x260
_08047A5C: .4byte IWRAM_START + 0x2A4
_08047A60: .4byte IWRAM_START + 0x230
_08047A64: .4byte gActiveBossTask
