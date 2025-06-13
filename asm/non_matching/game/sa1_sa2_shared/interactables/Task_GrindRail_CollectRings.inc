.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0200B1FC @ =gPlayer
	mov ip, r0
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	mov r2, ip
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0200B200 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov sb, r0
	ldr r3, _0200B204 @ =IWRAM_START + 0x08
	adds r0, r1, r3
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, _0200B208 @ =IWRAM_START + 0x04
	adds r0, r1, r2
	ldrh r2, [r0]
	subs r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]
	ldr r0, _0200B20C @ =IWRAM_START + 0x09
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp, #4]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r2, sb
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, ip
	ldr r3, [r0, #0x20]
	adds r0, r3, #0
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B132
	b _0200B30A
_0200B132:
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	movs r2, #3
	ldrsb r2, [r1, r2]
	lsls r1, r2, #3
	adds r4, r0, r1
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r7, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #0x10]
	cmp r4, r7
	ble _0200B152
	b _0200B2F8
_0200B152:
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r6, r0, #3
	adds r1, r4, r6
	str r0, [sp, #0xc]
	cmp r1, r7
	bge _0200B162
	b _0200B2F8
_0200B162:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r1, r2, r0
	cmp r1, r8
	ble _0200B178
	b _0200B2F8
_0200B178:
	mov r0, sb
	ldrb r0, [r0, #6]
	lsls r0, r0, #3
	str r0, [sp, #0x14]
	adds r1, r1, r0
	cmp r1, r8
	bge _0200B188
	b _0200B2F8
_0200B188:
	movs r1, #0
	cmp r8, r2
	bgt _0200B190
	movs r1, #1
_0200B190:
	mov r2, ip
	movs r0, #0x12
	ldrsh r2, [r2, r0]
	cmp r2, #0
	bge _0200B19C
	b _0200B2E4
_0200B19C:
	cmp r1, #0
	bne _0200B1A2
	b _0200B2E4
_0200B1A2:
	adds r0, r5, #0
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B1AE
	b _0200B2E4
_0200B1AE:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	bne _0200B1BA
	b _0200B2B0
_0200B1BA:
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0200B238
	ands r3, r1
	cmp r3, #0
	beq _0200B230
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	blt _0200B1EA
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B210 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B230
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B230
_0200B1EA:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B214
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B21A
	.align 2, 0
_0200B1FC: .4byte gPlayer
_0200B200: .4byte gCurTask
_0200B204: .4byte IWRAM_START + 0x08
_0200B208: .4byte IWRAM_START + 0x04
_0200B20C: .4byte IWRAM_START + 0x09
_0200B210: .4byte gPlayerControls
_0200B214:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B21A:
	strb r0, [r1]
	ldr r2, _0200B228 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r3, _0200B22C @ =IWRAM_START + 0x09
	adds r1, r1, r3
	b _0200B29E
	.align 2, 0
_0200B228: .4byte gCurTask
_0200B22C: .4byte IWRAM_START + 0x09
_0200B230:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0200B2E4
_0200B238:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200B2E4
	ldr r3, [sp, #0x10]
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r3, [sp, #0xc]
	lsls r1, r3, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _0200B276
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B288 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B2E4
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B2E4
_0200B276:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B28C
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B292
	.align 2, 0
_0200B288: .4byte gPlayerControls
_0200B28C:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B292:
	strb r0, [r1]
	ldr r1, _0200B2A8 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0200B2AC @ =IWRAM_START + 0x09
	adds r1, r1, r2
_0200B29E:
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	b _0200B2E4
	.align 2, 0
_0200B2A8: .4byte gCurTask
_0200B2AC: .4byte IWRAM_START + 0x09
_0200B2B0:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0200B2C2
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	blt _0200B2CA
	b _0200B2E4
_0200B2C2:
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	ble _0200B2E4
_0200B2CA:
	mov r2, ip
	adds r2, #0x6d
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x6e
	strb r1, [r0]
	movs r1, #1
	ands r5, r1
	cmp r5, #0
	beq _0200B2E4
	strb r1, [r0]
_0200B2E4:
	ldr r3, _0200B2F0 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r0, _0200B2F4 @ =IWRAM_START + 0x09
	adds r1, r1, r0
	b _0200B302
	.align 2, 0
_0200B2F0: .4byte gCurTask
_0200B2F4: .4byte IWRAM_START + 0x09
_0200B2F8:
	ldr r1, _0200B36C @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0200B370 @ =IWRAM_START + 0x09
	adds r1, r1, r2
_0200B302:
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
_0200B30A:
	ldr r2, _0200B374 @ =gCamera
	ldr r0, [r2]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0200B34C
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200B34C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200B35C
_0200B34C:
	mov r2, sp
	ldrb r3, [r2, #4]
	mov r2, sb
	strb r3, [r2]
	ldr r1, _0200B36C @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
_0200B35C:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B36C: .4byte gCurTask
_0200B370: .4byte IWRAM_START + 0x09
_0200B374: .4byte gCamera

	
.syntax divided
