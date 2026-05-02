.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, _08027E18 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0     @ r6 = wall
	adds r0, #0xc
	adds r7, r1, r0     @ r7 = s
	ldr r1, [r6]
	str r1, [sp]
	ldrb r2, [r6, #8]
	lsls r2, r2, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r2, r2, r0 @ r2 = worldX = TO_WORLD_POS(wall->base.meX, wall->base.regionX);
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r1, r1, r0 @ r1 = worldY = TO_WORLD_POS(me->y, wall->base.regionY);
	ldr r3, _08027E1C @ =gCamera
	ldrh r0, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	adds r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]  @ sp0C = 
	ldrh r0, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r7, #0x16]
	ldrh r0, [r3, #2]
	subs r1, r1, r0
	strh r1, [r7, #0x18]
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08027DFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08027E20
_08027DFA:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08027E20
	ldrb r0, [r6, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, [r4]
	bl TaskDestroy
	b _08028002_return
	.align 2, 0
_08027E18: .4byte gCurTask
_08027E1C: .4byte gCamera
_08027E20:
	ldr r0, _08027E68 @ =gRefSpriteTables
	ldr r1, [r0]
	ldrh r0, [r7, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]        @ r2 = oamData
	ldr r0, [r7, #0xc]  @ r0 = s->dimensions->oamIndex
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #8]    @ sp08 = &oamDataEntry
	movs r2, #0
	str r2, [sp, #4]    @ sp04 = i
_08027E40_outer_loop:
	movs r3, #0
	mov sl, r3          @ sl = j
	ldr r4, [sp, #4]
	lsls r4, r4, #2
	str r4, [sp, #0x10] @ sp10 = i * 4
_08027E4A_inner_loop:
	ldr r1, [r7, #0x10] @ r1 = s->frameFlags
	adds r0, r1, #0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r0, r2
	adds r2, r1, #0     @ r2 = r1 = s->frameFlags
	cmp r0, #0
	beq _08027E6C
	movs r0, #3
	mov r3, sl
	subs r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08027E6E
	.align 2, 0
_08027E68: .4byte gRefSpriteTables
_08027E6C:
	mov sb, sl
_08027E6E:
	movs r4, #0x3e
	ldrsh r0, [r6, r4]
	ldrh r3, [r6, #0x3e]
	cmp r0, #0
	blt _08027E7C
	mov r1, sl
	b _08027E86
_08027E7C:
	movs r0, #3
	mov r1, sl
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08027E86:
	ldr r0, [sp, #0x10] @ r0 = sp10 = i * 4
	add r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0          @ r8 = i * 4  + sb;
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrh r1, [r6, #0x3c]
	subs r1, r1, r0 @ temp = wall->qUnk3C - r1 * 10;
	movs r0, #7
	ldr r4, [sp, #4]
	subs r0, r0, r4
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	ble _08027F38
	movs r0, #0x2a
	muls r0, r1, r0
	ldr r4, _08027EEC @ =0xFFFFFE00
	adds r0, r0, r4
	muls r0, r1, r0
	lsls r0, r0, #8
	lsrs r5, r0, #0x10 @ r5 = I(temp * ((temp * 42) - Q(2)));
	lsls r0, r3, #0x10
	movs r4, #0x3e
	ldrsh r0, [r6, r4]
	muls r0, r1, r0
	lsls r0, r0, #8
	lsrs r4, r0, #0x10  @ r4 = temp2
	lsls r0, r5, #0x10
	mov ip, r0
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	cmp ip, r0
	ble _08027F3C
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _08027EF8
	movs r3, #0x80
	lsls r3, r3, #3
	ands r2, r3
	cmp r2, #0
	beq _08027EF0
	mov r4, r8      @ r4 = r8 = 
	cmp r4, #3
	beq _08027EEA
	b _08027FE2
_08027EEA:
	b _08027F08
	.align 2, 0
_08027EEC: .4byte 0xFFFFFE00
_08027EF0:
	mov r3, r8
	cmp r3, #0
	bne _08027FE2
	b _08027F22
_08027EF8:
	movs r3, #0x80
	lsls r3, r3, #3
	ands r2, r3
	cmp r2, #0
	beq _08027F1C
	mov r4, r8
	cmp r4, #0
	bne _08027FE2
_08027F08:
	ldrb r0, [r6, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r2, _08027F18 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08028002_return
	.align 2, 0
_08027F18: .4byte gCurTask
_08027F1C:
	mov r3, r8
	cmp r3, #3
	bne _08027FE2
_08027F22:
	ldrb r0, [r6, #8]
	ldr r4, [sp]
	strb r0, [r4]
	ldr r1, _08027F34 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08028002_return
	.align 2, 0
_08027F34: .4byte gCurTask
_08027F38:
	movs r4, #0
	movs r5, #0
_08027F3C:
	ldrh r0, [r7, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08027F98 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08028002_return
	ldr r0, [sp, #4]        @ r0 = i
	lsls r1, r0, #3
	ldrh r2, [r7, #0x18]
	adds r1, r1, r2
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	movs r1, #0
	strh r0, [r3]
	ldr r0, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	ands r0, r2
	cmp r0, #0
	beq _08027FA0
	mov r1, sb      @ r1 = sb = 
	lsls r0, r1, #3
	ldrh r1, [r7, #0x16]
	subs r1, r1, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, #8
	adds r1, r1, r0
	ldr r2, _08027F9C @ =0x000001FF
	adds r0, r2, #0
	ands r1, r0
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r4, #0
	orrs r1, r0
	b _08027FB4
	.align 2, 0
_08027F98: .4byte iwram_end
_08027F9C: .4byte 0x000001FF
_08027FA0:
	mov r1, sb
	lsls r0, r1, #3
	ldrh r2, [r7, #0x16]
	adds r0, r0, r2
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	ldr r4, _08028014 @ =0x000001FF
	adds r0, r4, #0
	ands r1, r0
_08027FB4:
	strh r1, [r3, #2]
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	ldr r1, [sp, #8]
	ldrh r2, [r1, #4]
	adds r2, r2, r0
	ldr r4, _08028018 @ =0xFFFFF000
	adds r0, r4, #0
	ands r2, r0
	ldr r0, [r7, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r0, r0, #2
	orrs r2, r0
	ldr r0, [r7, #4]
	ldr r1, _0802801C @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	add r0, r8
	orrs r2, r0
	strh r2, [r3, #4]
_08027FE2:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #3
	bhi _08027FF2
	b _08027E4A_inner_loop
_08027FF2:
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #7
	bhi _08028002_return
	b _08027E40_outer_loop
_08028002_return:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028014: .4byte 0x000001FF
_08028018: .4byte 0xFFFFF000
_0802801C: .4byte 0xF9FF0000

.syntax divided
