.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

@; These are referenced in data3.s
    .global gUnknown_080D5262
gUnknown_080D5262:
    .incbin "baserom.gba", 0x000D5262, 0x0E

    .global gUnknown_080D5270
gUnknown_080D5270:
    .incbin "baserom.gba", 0x000D5270, 0x0E

    .global gUnknown_080D527E
gUnknown_080D527E:
    .incbin "baserom.gba", 0x000D527E, 0x0E

    .global gUnknown_080D528C
gUnknown_080D528C:
    .incbin "baserom.gba", 0x000D528C, 0x0E

    .global gUnknown_080D529A
gUnknown_080D529A:
    .incbin "baserom.gba", 0x000D529A, 0x0E

    .global gUnknown_080D52A8
gUnknown_080D52A8:
    .incbin "baserom.gba", 0x000D52A8, 0x0E

    .global gUnknown_080D52B6
gUnknown_080D52B6:
    .incbin "baserom.gba", 0x000D52B6, 0x0E

    .global gUnknown_080D52C4
gUnknown_080D52C4:
    .incbin "baserom.gba", 0x000D52C4, 0x0E

    .global gUnknown_080D52D2
gUnknown_080D52D2:
    .incbin "baserom.gba", 0x000D52D2, 0x0E

.section .rodata2

    .global gUnknown_08c87098_unused
gUnknown_08c87098_unused:
    .space 0x100

    .global unk_8C87198
unk_8C87198:
    .4byte gUnknown_080D5254, gUnknown_080D5262, -1
    
    .global unk_8C871A4
unk_8C871A4:
    .4byte gUnknown_080D5270, gUnknown_080D527E, -1
    
    .global unk_8C871B0
unk_8C871B0:
    .4byte gUnknown_080D528C, gUnknown_080D529A, -1
    
    .global unk_8C871BC
unk_8C871BC:
    .4byte gUnknown_080D52A8, gUnknown_080D52B6, -1
    
    .global unk_8C871C8
unk_8C871C8:
    .4byte gUnknown_080D52C4, gUnknown_080D52D2, -1

.text
.syntax unified
.arm
 
.if 1
@ In:
@  r0: Player*
	thumb_func_start sub_800DF8C
sub_800DF8C: @ 0x0800DF8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0				@ r4 = p
	ldr r0, [r4, #0x20]
	ldr r1, _0800DFB0 @ =0x00200080
	ands r0, r1
	cmp r0, #0
	beq _0800DFB4
	movs r0, #0
	movs r1, #0
	bl sub_800E0C0
	b sub_800DF8C_return
	.align 2, 0
_0800DFB0: .4byte 0x00200080
_0800DFB4:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_800E0C0
	adds r0, r4, #0
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq sub_800DF8C_return
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800E050 @ =gUnknown_08C871D4
	adds r1, r4, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]            @ r1 = gUnknown_08C871D4[p->character]
	str r1, [sp]
	ldr r5, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq sub_800DF8C_return
__0800DFEC:
	ldrb r6, [r5]
	adds r5, #1
	ldrb r1, [r5]
	mov r8, r1
	adds r5, #1             @ r5 = sp00.unk0
	adds r2, r4, #0
	adds r2, #0x71
	ldrb r0, [r2]
	cmp r0, r8
	beq sub_800DF8C_return
	str r2, [sp, #8]
_0800E002:
	ldr r0, _0800E054 @ =gNewInputCountersIndex
	ldrb r4, [r0]           @ r4 = cid = gNewInputCountersIndex
	cmp r6, #0
	beq _0800E07A
	movs r2, #0xff
	mov sl, r2				@ sl = 0xFF
	movs r0, #0x1f
	mov sb, r0				@ sb = 0x1F
_0800E012:
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r0, r0, r5
	ldrb r1, [r0]
	mov ip, r1              @ ip = sp00.unk0[r6 * 3].unk0;
	ldrb r7, [r0, #1]       @ r7 = sp00.unk0[r6 * 3].unk1;
	ldrb r1, [r0, #2]       @ r1 = sp00.unk0[r6 * 3].unk2;
	mov r2, sl				@ r2 = sl = 0xFF
	ands r1, r2
_0800E02A:
	lsls r0, r4, #2
	ldr r2, _0800E058 @ =gNewInputCounters
	adds r0, r0, r2
	ldrb r3, [r0]
	ands r3, r7             @ r3 = 
	ldrb r2, [r0, #1]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r1, sl				@ r1 = sl = 0xFF
	ands r2, r1
	cmp r0, r2
	blt _0800E06C
	cmp ip, r3
	bne _0800E05C
	subs r4, #1
	mov r2, sb				@ r2 = sb = 0x1F
	ands r4, r2
	b _0800E072
	.align 2, 0
_0800E050: .4byte gUnknown_08C871D4
_0800E054: .4byte gNewInputCountersIndex
_0800E058: .4byte gNewInputCounters
_0800E05C:
	subs r4, #1
	mov r1, sb				@ r1 = sb = 0x1F
	ands r4, r1
	subs r0, #1
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0800E02A
_0800E06C:
	movs r2, #0
	cmp r2, #0
	beq _0800E076
_0800E072:
	cmp r6, #0
	bne _0800E012
_0800E076:
	cmp r6, #0
	bne _0800E082
_0800E07A:
	mov r1, r8
	ldr r0, [sp, #8]
	strb r1, [r0]
	b sub_800DF8C_return
_0800E082:
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r0, #2
	ldr r2, [sp]
	adds r0, r0, r2
	ldr r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq sub_800DF8C_return
	ldrb r6, [r5]
	adds r5, #1
	ldrb r0, [r5]
	mov r8, r0
	adds r5, #1
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	cmp r0, r8
	bne _0800E002
sub_800DF8C_return:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.endif
