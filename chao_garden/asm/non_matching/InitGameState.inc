.syntax unified
.text
	push {lr}
	ldr r2, _02000474 @ =gUnknown_03003B88
	movs r0, #0
	movs r1, #0x50
	cmp r0, r1
	bhs _02000454
	movs r3, #0
_0200044A:
	strb r3, [r2]
	adds r2, #1
	adds r0, #1
	cmp r0, r1
	blo _0200044A
_02000454:
	ldr r1, _02000478 @ =gUnknown_03003BD8
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x11
_0200045C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0200045C
	bl sub_02008810
	ldr r1, _0200047C @ =gGameState
	str r0, [r1, #0x10]
	movs r0, #0xff
	strb r0, [r1, #0x1c]
	pop {r0}
	bx r0
	.align 2, 0
_02000474: .4byte gUnknown_03003B88
_02000478: .4byte gUnknown_03003BD8
_0200047C: .4byte gGameState

	
.syntax divided
