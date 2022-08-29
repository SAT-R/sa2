.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8007CC8
sub_8007CC8: @ 0x08007CC8
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08007CE4 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08007CE8 @ =gUnknown_03005190
	str r0, [r1, #4]
	ldr r0, _08007CEC @ =0x81000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_08007CE4: .4byte 0x040000D4
_08007CE8: .4byte gUnknown_03005190
_08007CEC: .4byte 0x81000100

	thumb_func_start sub_8007CF0
sub_8007CF0: @ 0x08007CF0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08007D14 @ =gUnknown_020226D0
	ldr r0, [r0]
	cmp r0, r1
	beq _08007D10
	ldr r0, _08007D18 @ =gUnknown_03001940
	ldr r0, [r0]
	subs r0, r1, r0
	lsls r0, r0, #9
	lsrs r0, r0, #0x10
	ldr r1, _08007D1C @ =gUnknown_03005190
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_08007D10:
	pop {r0}
	bx r0
	.align 2, 0
_08007D14: .4byte gUnknown_020226D0
_08007D18: .4byte gUnknown_03001940
_08007D1C: .4byte gUnknown_03005190
