.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0         @ r5 = opponent
	ldr r0, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]            @ sp00 = oppX
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]        @ sp04 = oppY
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18      @ r4 = layer
	movs r0, #0
	mov r8, r0              @ r8 = result = 0
	ldr r2, _0800DAB0 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800DAAA
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	bne _0800DAAA
	ldr r1, _0800DAB4 @ =gMultiplayerPlayerTasks
	ldr r0, _0800DAB8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	mov sb, r6              @ sb = r6 = mpPlayer
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r4, r0
	beq _0800DABC
_0800DAAA:
	movs r0, #0
	b sub_800DA4C_return_0
	.align 2, 0
_0800DAB0: .4byte gPlayer
_0800DAB4: .4byte gMultiplayerPlayerTasks
_0800DAB8: .4byte 0x04000128
_0800DABC:
	ldr r0, [r2, #0x10]     @ r0 = p->speedAirX
	cmp r0, #0
	bne _0800DB70
	ldr r1, [r5, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800DB70
	ldr r1, [sp]            @ r1 = sp00 = oppX
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0         @ r1 = r5 = opponent
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4         @ r2 = oppLeft = oppX + opponent->reserved.left
	ldr r7, _0800DC50 @ =IWRAM_START + 0x50
	adds r0, r3, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r7, _0800DC54 @ =IWRAM_START + 0x2C
	adds r0, r3, r7         @ r3 = task(--> mpPlayer)
	movs r7, #0
	ldrsb r7, [r0, r7]      @ r7 = mpPlayer.left
	adds r1, r1, r7         @ r1 = HN_LEFT(mpPlayer->s.hbs[1])
	cmp r2, r1              @ oppLeft > mpPlayer.unk50
	bgt _0800DB08
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4         @ r0 = oppo->s.hbs[1].right - oppo->s.hbs[1].left
	adds r0, r2, r0         @ r0 = HB_RIGHT(opponent->s.hbs[1])
	cmp r0, r1
	bge _0800DB1A
	cmp r2, r1
	blt _0800DB70
_0800DB08:
	ldr r4, _0800DC58 @ =IWRAM_START + 0x2E
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7         @ HB_WIDTH(mpPlayer->s.hbs[1])
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB1A:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800DB56
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB68
	cmp r2, r1
	blt _0800DB70
_0800DB56:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB68:
	movs r0, #2
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DB70:
	ldr r0, [r6, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0800DB7C
	b _0800DC8C
_0800DB7C:
	ldr r0, [r5, #0x28]
	cmp r0, r1
	bne _0800DB84
	b _0800DC8C
_0800DB84:
	ldr r4, [sp]            @ r4 = sp00 = oppX
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	adds r0, r5, #0
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r1, r7
	mov r2, sb
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	cmp r4, r1
	bgt _0800DBC8
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r4, r0
	cmp r0, r1
	bge _0800DBDC
	cmp r4, r1
	blt _0800DC8C
_0800DBC8:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r4
	blt _0800DC8C
_0800DBDC:
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r4, r0, r1
	mov r1, sb
	adds r1, #0x52
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r3, #0x35
	ldrsb r7, [r3, r6]
	mov ip, r7
	adds r3, r0, r7
	mov sl, r2
	adds r2, r1, #0
	cmp r4, r3
	bgt _0800DC20
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r4, r0
	cmp r0, r3
	bge _0800DC34
	cmp r4, r3
	blt _0800DC8C
_0800DC20:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _0800DC8C
_0800DC34:
	ldr r0, [sp, #8]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0xc]
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC5C
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC66
	.align 2, 0
_0800DC50: .4byte IWRAM_START + 0x50
_0800DC54: .4byte IWRAM_START + 0x2C
_0800DC58: .4byte IWRAM_START + 0x2E
_0800DC5C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC66:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r4, sl
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC7E
	movs r0, #0x80
	lsls r0, r0, #9
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC88
_0800DC7E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC88:
	movs r0, #1
	b _0800DD3C
_0800DC8C:
	ldr r0, [r6, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq sub_800DA4C_return
	ldr r0, [r5, #0x30]
	cmp r0, r1
	beq sub_800DA4C_return
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r3, r0, r2
	mov r0, sb
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r6, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r3, r1
	bgt _0800DCD8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	bge _0800DCEA
	cmp r3, r1
	blt sub_800DA4C_return
_0800DCD8:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r3
	blt sub_800DA4C_return
_0800DCEA:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r3, r6, #0
	adds r3, #0x2d
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800DD28
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DD3A
	cmp r2, r1
	blt sub_800DA4C_return
_0800DD28:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt sub_800DA4C_return
_0800DD3A:
	movs r0, #2
_0800DD3C:
	mov r2, r8
	orrs r2, r0
	mov r8, r2
sub_800DA4C_return:
	mov r0, r8
sub_800DA4C_return_0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.syntax divided
