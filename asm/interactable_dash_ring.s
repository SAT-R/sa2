.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start TaskDestructor_Interactable_DashRing
TaskDestructor_Interactable_DashRing: @ 0x08074C04
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8074C20
sub_8074C20: @ 0x08074C20
	ldr r2, [r0, #0x70]
	ldr r3, _08074C44 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	strh r2, [r0, #0x16]
	ldr r1, [r0, #0x74]
	ldr r3, [r3, #4]
	subs r1, r1, r3
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x46
	strh r2, [r1]
	ldr r1, [r0, #0x74]
	subs r1, r1, r3
	adds r0, #0x48
	strh r1, [r0]
	bx lr
	.align 2, 0
_08074C44: .4byte gCamera

	thumb_func_start sub_8074C48
sub_8074C48: @ 0x08074C48
	push {lr}
	ldr r1, [r0, #0x70]
	ldr r3, _08074C8C @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x74]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x82
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _08074C86
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0xc
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08074C86
	subs r1, #0x18
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08074C90
_08074C86:
	movs r0, #1
	b _08074C92
	.align 2, 0
_08074C8C: .4byte gCamera
_08074C90:
	movs r0, #0
_08074C92:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074C98
sub_8074C98: @ 0x08074C98
	push {lr}
	ldr r1, [r0, #0x78]
	adds r0, #0x7c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08074CB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08074CB0: .4byte gCurTask
