.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8007C10
sub_8007C10: @ 0x08007C10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r0, r5, #3
	lsrs r5, r0, #2
	movs r4, #0
	ldr r1, _08007C4C @ =gUnknown_03001888
	ldrh r0, [r1]
	lsrs r0, r0, #2
	mov sb, r1
	cmp r4, r0
	bhs _08007CAE
	ldr r0, _08007C50 @ =gUnknown_03005190
	mov r8, r0
_08007C32:
	lsls r1, r4, #1
	mov r2, r8
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, #0
	bne _08007C94
	movs r3, #0
	ldr r7, _08007C4C @ =gUnknown_03001888
	mov ip, r7
	ldr r0, _08007C50 @ =gUnknown_03005190
	mov sl, r0
	ldr r6, _08007C54 @ =gUnknown_020226D0
	b _08007C5E
	.align 2, 0
_08007C4C: .4byte gUnknown_03001888
_08007C50: .4byte gUnknown_03005190
_08007C54: .4byte gUnknown_020226D0
_08007C58:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08007C5E:
	cmp r3, r5
	bhs _08007C7C
	adds r2, r4, r3
	mov r7, ip
	ldrh r0, [r7]
	lsrs r0, r0, #2
	cmp r2, r0
	blt _08007C72
	ldr r0, [r6]
	b _08007CB2
_08007C72:
	lsls r0, r2, #1
	add r0, sl
	ldrh r0, [r0]
	cmp r0, #0
	beq _08007C58
_08007C7C:
	cmp r3, r5
	bne _08007C9E
	mov r2, r8
	adds r0, r1, r2
	strh r5, [r0]
	ldr r0, _08007C90 @ =gUnknown_03001940
	lsls r1, r4, #7
	ldr r0, [r0]
	adds r0, r0, r1
	b _08007CB2
	.align 2, 0
_08007C90: .4byte gUnknown_03001940
_08007C94:
	ldr r7, _08007CC0 @ =0x0000FFFF
	adds r0, r4, r7
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08007C9E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, sb
	ldrh r0, [r1]
	lsrs r0, r0, #2
	cmp r4, r0
	blo _08007C32
_08007CAE:
	ldr r0, _08007CC4 @ =gUnknown_020226D0
	ldr r0, [r0]
_08007CB2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007CC0: .4byte 0x0000FFFF
_08007CC4: .4byte gUnknown_020226D0

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
