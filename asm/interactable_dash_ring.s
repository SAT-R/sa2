.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80748E8
sub_80748E8: @ 0x080748E8
	push {lr}
	ldr r2, _0807491C @ =gPlayer
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0x18
	strb r1, [r3]
	ldr r1, [r0, #0x70]
	lsls r1, r1, #8
	str r1, [r2, #8]
	ldr r1, [r0, #0x74]
	lsls r1, r1, #8
	str r1, [r2, #0xc]
	adds r3, #5
	movs r1, #0x10
	strh r1, [r3]
	adds r0, #0x6c
	ldrh r0, [r0]
	cmp r0, #7
	bls _08074910
	b _08074AA6
_08074910:
	lsls r0, r0, #2
	ldr r1, _08074920 @ =_08074924
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807491C: .4byte gPlayer
_08074920: .4byte _08074924
_08074924: @ jump table
	.4byte _08074944 @ case 0
	.4byte _08074968 @ case 1
	.4byte _08074998 @ case 2
	.4byte _080749C4 @ case 3
	.4byte _080749F8 @ case 4
	.4byte _08074A1C @ case 5
	.4byte _08074A48 @ case 6
	.4byte _08074A74 @ case 7
_08074944:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074964 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074964: .4byte gSineTable
_08074968:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074994 @ =gSineTable
	movs r3, #0x90
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xe0
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074994: .4byte gSineTable
_08074998:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _080749C0 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	b _08074A9C
	.align 2, 0
_080749C0: .4byte gSineTable
_080749C4:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _080749F4 @ =gSineTable
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	b _08074A9E
	.align 2, 0
_080749F4: .4byte gSineTable
_080749F8:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08074A18 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #2
	b _08074A9A
	.align 2, 0
_08074A18: .4byte gSineTable
_08074A1C:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08074A44 @ =gSineTable
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #2
	b _08074A9A
	.align 2, 0
_08074A44: .4byte gSineTable
_08074A48:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _08074A70 @ =gSineTable
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074A70: .4byte gSineTable
_08074A74:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074AB8 @ =gSineTable
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xa0
	lsls r0, r0, #3
_08074A9A:
	adds r1, r1, r0
_08074A9C:
	ldrh r0, [r1]
_08074A9E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x12]
_08074AA6:
	ldr r0, _08074ABC @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _08074AC0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074AC4 @ =sub_8074BBC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08074AB8: .4byte gSineTable
_08074ABC: .4byte 0x00000115
_08074AC0: .4byte gCurTask
_08074AC4: .4byte sub_8074BBC

	thumb_func_start sub_8074AC8
sub_8074AC8: @ 0x08074AC8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08074ADC @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08074AE4
	b _08074B5A
	.align 2, 0
_08074ADC: .4byte gPlayer
_08074AE0:
	movs r0, #1
	b _08074B5C
_08074AE4:
	ldr r3, [r7, #0x70]
	ldr r0, _08074B64 @ =gCamera
	ldr r4, [r0]
	subs r3, r3, r4
	ldr r2, [r7, #0x74]
	ldr r5, [r0, #4]
	subs r2, r2, r5
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	movs r4, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
_08074B12:
	lsls r2, r4, #2
	adds r2, r7, r2
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r1, r3, r1
	subs r1, #0xc
	adds r2, #0x62
	ldrh r0, [r2]
	adds r0, r6, r0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, r5
	bgt _08074B50
	adds r0, #0x18
	cmp r0, r5
	blt _08074B50
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08074B50
	adds r0, r2, #0
	adds r0, #0x18
	cmp r0, r1
	bge _08074AE0
_08074B50:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08074B12
_08074B5A:
	movs r0, #0
_08074B5C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074B64: .4byte gCamera

	thumb_func_start Task_Interactable_DashRing
Task_Interactable_DashRing: @ 0x08074B68
	push {r4, r5, lr}
	ldr r0, _08074B98 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8074AC8
	cmp r0, #0
	beq _08074B86
	adds r0, r4, #0
	bl sub_80748E8
_08074B86:
	adds r0, r4, #0
	bl sub_8074C48
	cmp r0, #0
	beq _08074B9C
	adds r0, r4, #0
	bl sub_8074C98
	b _08074BB0
	.align 2, 0
_08074B98: .4byte gCurTask
_08074B9C:
	adds r0, r4, #0
	bl sub_8074C20
	adds r0, r4, #0
	bl sub_80051E8
	ldr r1, _08074BB8 @ =IWRAM_START + 0x30
	adds r0, r5, r1
	bl sub_80051E8
_08074BB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074BB8: .4byte IWRAM_START + 0x30

	thumb_func_start sub_8074BBC
sub_8074BBC: @ 0x08074BBC
	push {r4, r5, r6, lr}
	ldr r6, _08074BF8 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	adds r0, r4, #0
	bl sub_8074C20
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08074BFC @ =IWRAM_START + 0x30
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_8074AC8
	cmp r0, #0
	bne _08074BF0
	ldr r1, [r6]
	ldr r0, _08074C00 @ =Task_Interactable_DashRing
	str r0, [r1, #8]
_08074BF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074BF8: .4byte gCurTask
_08074BFC: .4byte IWRAM_START + 0x30
_08074C00: .4byte Task_Interactable_DashRing

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
