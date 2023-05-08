.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

@; some sort of palette loader function. Uses the Sprite object
@; but only ever called with animations which load a palette

	thumb_func_start CreatePaletteLoaderTask
CreatePaletteLoaderTask: @ 0x08009628
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080096A0 @ =sub_80096B4
	str r3, [sp]
	movs r1, #0x30
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	movs r1, #0
	mov r8, r1
	movs r3, #0
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	str r3, [r2, #4]
	strh r3, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r5, [r2, #0xa]
	ldr r5, _080096A4 @ =IWRAM_START + 0x20
	adds r1, r4, r5
	strb r6, [r1]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r1, _080096A8 @ =IWRAM_START + 0x21
	adds r5, r4, r1
	movs r1, #0xff
	strb r1, [r5]
	ldr r1, _080096AC @ =IWRAM_START + 0x22
	adds r5, r4, r1
	movs r1, #0x10
	strb r1, [r5]
	ldr r5, _080096B0 @ =IWRAM_START + 0x25
	adds r4, r4, r5
	mov r1, r8
	strb r1, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r2, #0x28]
	str r3, [r2, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080096A0: .4byte sub_80096B4
_080096A4: .4byte IWRAM_START + 0x20
_080096A8: .4byte IWRAM_START + 0x21
_080096AC: .4byte IWRAM_START + 0x22
_080096B0: .4byte IWRAM_START + 0x25

	thumb_func_start sub_80096B4
sub_80096B4: @ 0x080096B4
	push {r4, lr}
	ldr r4, _080096D8 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_80036E0
	cmp r0, #0
	bne _080096D0
	ldr r0, [r4]
	bl TaskDestroy
_080096D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080096D8: .4byte gCurTask
