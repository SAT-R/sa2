.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08031FF8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _08031FFC
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	b _080321A8
	.align 2, 0
_08031FF8: .4byte gGameMode
_08031FFC:
	ldr r0, _08032090 @ =Task_EggSnakeInit
	movs r2, #0x84
	lsls r2, r2, #6
	ldr r1, _08032094 @ =TaskDestructor_8034208
	str r1, [sp]
	movs r1, #0xac
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov sl, r0
	ldr r0, _08032098 @ =0x0300000C
	adds r7, r3, r0
	movs r4, #0
	movs r2, #0
	mov r0, r8
	mov r1, sl
	strh r0, [r1, #4]
	mov r0, sb
	strh r0, [r1, #6]
	str r6, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #8]
	strb r5, [r1, #9]
	ldr r0, _0803209C @ =0x03000098
	adds r1, r3, r0
	movs r0, #0x78
	strh r0, [r1]
	ldr r1, _080320A0 @ =0x0300009C
	adds r0, r3, r1
	strb r4, [r0]
	adds r1, #0xd
	adds r0, r3, r1
	strb r4, [r0]
	subs r1, #1
	adds r0, r3, r1
	strb r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	mov r1, sl
	str r0, [r1, #0x78]
	str r2, [r1, #0x7c]
	ldr r1, _080320A4 @ =0x03000080
	adds r0, r3, r1
	str r2, [r0]
	adds r1, #4
	adds r0, r3, r1
	str r2, [r0]
	adds r1, #0x1c
	adds r0, r3, r1
	strh r2, [r0]
	ldr r0, _080320A8 @ =0x030000A2
	adds r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	ldr r1, _080320AC @ =0x030000A4
	adds r0, r3, r1
	strh r2, [r0]
	adds r1, #6
	adds r0, r3, r1
	strb r4, [r0]
	ldr r0, _080320B0 @ =gLoadedSaveGame
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	beq _080320B8
	ldr r0, _080320B4 @ =0x0300009A
	adds r1, r3, r0
	movs r0, #2
	strb r0, [r1]
	b _080320BE
	.align 2, 0
_08032090: .4byte Task_EggSnakeInit
_08032094: .4byte TaskDestructor_8034208
_08032098: .4byte 0x0300000C
_0803209C: .4byte 0x03000098
_080320A0: .4byte 0x0300009C
_080320A4: .4byte 0x03000080
_080320A8: .4byte 0x030000A2
_080320AC: .4byte 0x030000A4
_080320B0: .4byte gLoadedSaveGame
_080320B4: .4byte 0x0300009A
_080320B8:
	ldr r1, _080321B8 @ =0x0300009A
	adds r0, r3, r1
	strb r4, [r0]
_080320BE:
	ldrb r0, [r6]
	lsls r0, r0, #3
	mov r1, r8
	lsls r5, r1, #8
	adds r0, r0, r5
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r1, sb
	lsls r1, r1, #8
	mov sb, r1
	add r0, sb
	strh r0, [r7, #0x18]
	movs r0, #0x30
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r0, #0
	strh r0, [r7, #8]
	ldr r0, _080321BC @ =0x00000296
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	movs r1, #3
	strb r1, [r0]
	movs r0, #0
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	str r1, [r7, #0x10]
	mov r4, sl
	adds r4, #0x44
	ldrb r0, [r6]
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r0, [r4, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	add r0, sb
	strh r0, [r4, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r0, #8
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #0xa5
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	mov r0, sl
	adds r0, #0x64
	movs r1, #3
	strb r1, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	mov r1, sl
	adds r1, #0x65
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x66
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	mov r1, r8
	str r1, [r4, #0x10]
	ldrh r1, [r7, #0x18]
	adds r0, r1, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, #0x20
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r7, #0x16]
	adds r2, r3, #0
	subs r2, #0x90
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r3, #0xb0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	bl Bosses_SetCamBounds
_080321A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080321B8: .4byte 0x0300009A
_080321BC: .4byte 0x00000296

.syntax divided
