.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_808B768
sub_808B768: @ 0x0808B768
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, _0808B84C @ =gDispCnt
	ldr r0, _0808B850 @ =0x00001441
	strh r0, [r1]
	ldr r1, _0808B854 @ =gBgCntRegs
	movs r5, #0
	movs r4, #0
	ldr r0, _0808B858 @ =0x00001F04
	strh r0, [r1]
	ldr r0, _0808B85C @ =0x00009D0A
	strh r0, [r1, #2]
	ldr r0, _0808B860 @ =0x00007A81
	strh r0, [r1, #4]
	ldr r2, _0808B864 @ =gUnknown_03004D80
	strb r5, [r2]
	ldr r0, _0808B868 @ =gUnknown_03002280
	strb r5, [r0]
	strb r5, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r6, #0x20
	strb r6, [r0, #3]
	strb r5, [r2, #1]
	strb r5, [r0, #4]
	strb r5, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r6, [r0, #7]
	strb r5, [r2, #2]
	strb r5, [r0, #8]
	strb r5, [r0, #9]
	strb r1, [r0, #0xa]
	strb r6, [r0, #0xb]
	str r4, [sp]
	ldr r1, _0808B86C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r8, r0
	str r0, [r1, #4]
	ldr r0, _0808B870 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808B874 @ =gBgScrollRegs
	strh r4, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #8
	strh r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	strh r4, [r1]
	strh r4, [r1, #2]
	adds r0, r7, #0
	adds r0, #0x80
	ldr r1, _0808B878 @ =0x06004000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0808B87C @ =0x0600F800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0x60
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0xaa
	strb r5, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	mov r0, r8
	str r0, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808B880 @ =0x0600D000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	movs r0, #0x83
	lsls r0, r0, #1
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	strh r6, [r7, #0x26]
	strh r6, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r5, [r0]
	movs r0, #6
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B84C: .4byte gDispCnt
_0808B850: .4byte 0x00001441
_0808B854: .4byte gBgCntRegs
_0808B858: .4byte 0x00001F04
_0808B85C: .4byte 0x00009D0A
_0808B860: .4byte 0x00007A81
_0808B864: .4byte gUnknown_03004D80
_0808B868: .4byte gUnknown_03002280
_0808B86C: .4byte 0x040000D4
_0808B870: .4byte 0x85004000
_0808B874: .4byte gBgScrollRegs
_0808B878: .4byte 0x06004000
_0808B87C: .4byte 0x0600F800
_0808B880: .4byte 0x0600D000
