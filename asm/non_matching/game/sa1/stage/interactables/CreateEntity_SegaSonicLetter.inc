.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0      @ r8 = me
	adds r6, r1, #0
	mov sb, r2
	mov sl, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10  @ r1 = regionX
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0          @ sb = regionY
	mov r1, sl
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1          @ sl = id
	ldr r1, _0807EBAC @ =gUnknown_086CED90
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r0, _0807EBB0 @ =Task_SegaSonicLetter
	ldr r1, _0807EBB4 @ =TaskDestructor_SegaSonicLetter
	str r1, [sp]
	movs r1, #0x44
	movs r2, #0x80
	lsls r2, r2, #6
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _0807EBB8 @ =0x0300000C
	adds r5, r4, r2     @ r5 = s
	movs r7, #0
	strh r6, [r0, #4]
	mov r3, sb
	strh r3, [r0, #6]
	mov r1, r8
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r2, sl
	strb r2, [r0, #9]
	mov r3, r8          @ r3 = r8 = me
	ldrb r0, [r3, #3]
	ldr r1, _0807EBBC @ =0x0300003C
	adds r1, r1, r4
	mov sl, r1          @ sl = s->meDat0
	strb r0, [r1]
	ldr r2, _0807EBC0 @ =0x0300003D
	adds r0, r4, r2
	movs r3, #0
	strb r3, [r0]
	mov r0, r8
	ldrb r2, [r0, #4]
	movs r0, #3
	adds r1, r0, #0
	ands r1, r2
	ldr r3, _0807EBC4 @ =0x0300003E
	adds r2, r4, r3
	strb r1, [r2]   @ letter->meDat1 = me->d.uData[1] % 4u;
	mov r2, r8          @ r2 = r8 = me
	ldrb r1, [r2, #4]
	ands r0, r1
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r0, [r0]
	subs r0, #0xa1
	asrs r0, r0, #1
	adds r3, #1
	adds r1, r4, r3
	strb r0, [r1]
	ldrb r1, [r2, #5]
	ldr r2, _0807EBC8 @ =0x03000040
	adds r0, r4, r2
	strb r1, [r0]
	mov r3, r8          @ r3 = r8 = me
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x16]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	mov r1, sb
	lsls r1, r1, #8
	mov sb, r1
	add r0, sb
	strh r0, [r5, #0x18]
	movs r0, #0xfe
	strb r0, [r3]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	strh r7, [r5, #8]
	movs r0, #0xf6
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	mov r2, sl
	ldrb r0, [r2]
	lsls r0, r0, #2
	ldr r3, _0807EBCC @ =0x0300002C
	adds r1, r4, r3
	strb r0, [r1]
	strh r7, [r5, #0x14]
	strh r7, [r5, #0x1c]
	ldr r0, _0807EBD0 @ =0x0300002D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _0807EBD4 @ =0x0300002E
	adds r1, r4, r2
	movs r0, #0x10
	strb r0, [r1]
	adds r3, #5
	adds r4, r4, r3
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBAC: .4byte gUnknown_086CED90
_0807EBB0: .4byte Task_SegaSonicLetter
_0807EBB4: .4byte TaskDestructor_SegaSonicLetter
_0807EBB8: .4byte 0x0300000C
_0807EBBC: .4byte 0x0300003C
_0807EBC0: .4byte 0x0300003D
_0807EBC4: .4byte 0x0300003E
_0807EBC8: .4byte 0x03000040
_0807EBCC: .4byte 0x0300002C
_0807EBD0: .4byte 0x0300002D
_0807EBD4: .4byte 0x0300002E

.syntax divided
