.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 00
	thumb_func_start Task_EnemySpinner
Task_EnemySpinner: @ 0x08057024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08057174 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0          @ r8 = structPtrPart
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	str r0, [sp, #4]    @ sp04 = spinner
	ldr r6, _08057178 @ =IWRAM_START + 0xC
	add r6, r8          @ r6 = s
	ldr r0, [r0]
	str r0, [sp]        @ sp00 = me

	ldr r1, [sp, #4]
	ldr r0, [r1, #0x44]
	asrs r4, r0, #8
	ldr r0, [r1, #0x48]
	asrs r5, r0, #8     @ r5 = Q_24_8_TO_INT(spinner->poxY)
	ldr r1, _0805717C @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]

	ldr r2, _08057180 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08057184 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _0805713E
	mov sl, r2      @ sl = r2 = gPlayer
	mov r0, sl
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0      @ ip = gPlayer.unk90
	movs r0, #0xc
	add r0, ip
	mov sb, r0
	ldr r0, [r0, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805712E
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _0805712E

	ldr r0, _08057188 @ =IWRAM_START + 0x40
	add r0, r8
	movs r7, #0
	ldrsb r7, [r0, r7]  @ r7 = spinner->unk40
	adds r3, r7, r4     @ r3 = someX
	mov r1, sl
	ldr r0, [r1, #8]
	asrs r0, r0, #8     @ r0 = Q_24_8(gPlayer.x)
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]       @ r1 = u90->unk38 
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, r1     @ r2 = otherX
	cmp r3, r2
	bgt _080570C2
	ldr r0, _0805718C @ =IWRAM_START + 0x42
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r2
	bge _080570D4
	cmp r3, r2
	blt _0805712E
_080570C2:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	blt _0805712E
_080570D4:
	adds r0, r6, #0
	adds r0, #0x35
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r3, r5
	mov r1, sl
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r1, sb
	adds r1, #0x2d
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r2, r1
	bgt _08057108
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0805711A
	cmp r2, r1
	blt _0805712E
_08057108:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _0805712E
_0805711A:
	mov r0, sl
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0805712E
	mov r0, sl
	bl sub_800CBA4
_0805712E:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _0805716A
_0805713E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057162
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057162
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057190
_08057162:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r1, [sp]
	strb r0, [r1]
_0805716A:
	ldr r0, _08057174 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080571A4
	.align 2, 0
_08057174: .4byte gCurTask
_08057178: .4byte IWRAM_START + 0xC
_0805717C: .4byte gCamera
_08057180: .4byte gPlayer
_08057184: .4byte 0x00400080
_08057188: .4byte IWRAM_START + 0x40
_0805718C: .4byte IWRAM_START + 0x42
_08057190:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080571A4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.endif
