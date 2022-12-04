.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_0
Handler_MusicPlant_Pipe_0: @ 0x08076F0C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #6]
	movs r3, #4
	ldrsh r0, [r0, r3]
	ldr r3, [r2, #8]
	mov ip, r3
	rsbs r7, r0, #0
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xa
	mov r3, ip
	subs r0, r3, r0
	str r0, [r2, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r6, [r2, #0xc]
	rsbs r5, r1, #0
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r0, r6, r0
	str r0, [r2, #0x14]
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	ldrh r1, [r2, #0x1a]
	adds r3, r0, r1
	strh r3, [r2, #0x1a]
	lsls r1, r3, #0x10
	ldr r0, _08076F8C @ =0x3FF0000
	cmp r1, r0
	bls _08076F84
	ldr r1, _08076F90 @ =0xFFFFFC00
	adds r0, r3, r1
	strh r0, [r2, #0x1a]
	mov r3, ip
	subs r0, r3, r7
	str r0, [r2, #8]
	subs r0, r6, r5
	str r0, [r2, #0xc]
	ldrh r0, [r2, #0x18]
	adds r3, r0, #1
	strh r3, [r2, #0x18]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r0, _08076F94 @ =0x0000FFFF
	cmp r1, r0
	bne _08076F84
	orrs r3, r1
	strh r3, [r2, #0x18]
_08076F84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F8C: .4byte 0x3FF0000
_08076F90: .4byte 0xFFFFFC00
_08076F94: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_1
Handler_MusicPlant_Pipe_1: @ 0x08076F98
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _08077048 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _0807704C @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077042
	ldr r0, _08077050 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077054 @ =0x0000FFFF
	cmp r1, r0
	bne _08077042
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077042:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077048: .4byte 0x000003FF
_0807704C: .4byte gSineTable
_08077050: .4byte 0xFFFFFC00
_08077054: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_2
Handler_MusicPlant_Pipe_2: @ 0x08077058
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _08077108 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _0807710C @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077100
	ldr r0, _08077110 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077114 @ =0x0000FFFF
	cmp r1, r0
	bne _08077100
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077100:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077108: .4byte 0x000003FF
_0807710C: .4byte gSineTable
_08077110: .4byte 0xFFFFFC00
_08077114: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_3
Handler_MusicPlant_Pipe_3: @ 0x08077118
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	ldr r0, _080771C8 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _080771CC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _080771C0
	ldr r0, _080771D0 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _080771D4 @ =0x0000FFFF
	cmp r1, r0
	bne _080771C0
	orrs r2, r1
	strh r2, [r4, #0x18]
_080771C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080771C8: .4byte 0x000003FF
_080771CC: .4byte gSineTable
_080771D0: .4byte 0xFFFFFC00
_080771D4: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_4
Handler_MusicPlant_Pipe_4: @ 0x080771D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _08077290 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _08077294 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077288
	ldr r0, _08077298 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _0807729C @ =0x0000FFFF
	cmp r1, r0
	bne _08077288
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077288:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077290: .4byte 0x000003FF
_08077294: .4byte gSineTable
_08077298: .4byte 0xFFFFFC00
_0807729C: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_5
Handler_MusicPlant_Pipe_5: @ 0x080772A0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r3, _08077354 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _08077358 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _0807734E
	ldr r0, _0807735C @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	subs r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077360 @ =0x0000FFFF
	cmp r1, r0
	bne _0807734E
	orrs r2, r1
	strh r2, [r4, #0x18]
_0807734E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077354: .4byte 0x000003FF
_08077358: .4byte gSineTable
_0807735C: .4byte 0xFFFFFC00
_08077360: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_6
Handler_MusicPlant_Pipe_6: @ 0x08077364
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _0807741C @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _08077420 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _08077414
	ldr r0, _08077424 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	str r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077428 @ =0x0000FFFF
	cmp r1, r0
	bne _08077414
	orrs r2, r1
	strh r2, [r4, #0x18]
_08077414:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807741C: .4byte 0x000003FF
_08077420: .4byte gSineTable
_08077424: .4byte 0xFFFFFC00
_08077428: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_7
Handler_MusicPlant_Pipe_7: @ 0x0807742C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r0, r2, #2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r0, _080774E4 @ =0x000003FF
	mov ip, r0
	mov r3, ip
	ands r1, r3
	ldr r7, _080774E8 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _080774DC
	ldr r0, _080774EC @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	subs r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _080774F0 @ =0x0000FFFF
	cmp r1, r0
	bne _080774DC
	orrs r2, r1
	strh r2, [r4, #0x18]
_080774DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080774E4: .4byte 0x000003FF
_080774E8: .4byte gSineTable
_080774EC: .4byte 0xFFFFFC00
_080774F0: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_8
Handler_MusicPlant_Pipe_8: @ 0x080774F4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #2
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _080775A8 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _080775AC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _080775A2
	ldr r0, _080775B0 @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _080775B4 @ =0x0000FFFF
	cmp r1, r0
	bne _080775A2
	orrs r2, r1
	strh r2, [r4, #0x18]
_080775A2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080775A8: .4byte 0x000003FF
_080775AC: .4byte gSineTable
_080775B0: .4byte 0xFFFFFC00
_080775B4: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_9
Handler_MusicPlant_Pipe_9: @ 0x080775B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov ip, r1
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #3
	add r0, ip
	ldr r7, [r0, #4]
	ldrh r4, [r6, #0x1a]
	lsrs r2, r4, #3
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r1, _080776A0 @ =0x000003FF
	mov sl, r1
	mov r0, sl
	ands r2, r0
	ldr r5, _080776A4 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r7, #0
	muls r1, r0, r1
	mov r8, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r7, #0
	muls r1, r0, r1
	mov sb, r1
	mov r0, r8
	subs r0, r0, r1
	asrs r1, r0, #8
	ldr r0, [r6, #8]
	mov r8, r0
	add r1, r8
	str r1, [r6, #0x10]
	lsls r2, r2, #1
	adds r2, r2, r5
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r3, r5, r3
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x16
	adds r1, r1, r3
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #8
	ldr r1, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0x14]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #2]
	adds r4, r4, r0
	strh r4, [r6, #0x1a]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, sl
	bls _08077692
	ldr r2, _080776A8 @ =0xFFFFFC00
	adds r0, r4, r2
	strh r0, [r6, #0x1a]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	mov r2, sb
	subs r0, r0, r2
	asrs r0, r0, #8
	add r0, r8
	str r0, [r6, #8]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r0, r0, r3
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r6, #0xc]
	ldrh r0, [r6, #0x18]
	adds r2, r0, #1
	strh r2, [r6, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	add r0, ip
	ldrh r1, [r0]
	ldr r0, _080776AC @ =0x0000FFFF
	cmp r1, r0
	bne _08077692
	orrs r2, r1
	strh r2, [r6, #0x18]
_08077692:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080776A0: .4byte 0x000003FF
_080776A4: .4byte gSineTable
_080776A8: .4byte 0xFFFFFC00
_080776AC: .4byte 0x0000FFFF

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_10
Handler_MusicPlant_Pipe_10: @ 0x080776B0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r5, [r0, #4]
	ldrh r2, [r4, #0x1a]
	lsrs r1, r2, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _08077764 @ =0x000003FF
	mov ip, r3
	mov r0, ip
	ands r1, r0
	ldr r7, _08077768 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r3, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, ip
	bls _0807775E
	ldr r0, _0807776C @ =0xFFFFFC00
	adds r2, r2, r0
	strh r2, [r4, #0x1a]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r7, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	adds r2, r0, #1
	strh r2, [r4, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r6
	ldrh r1, [r0]
	ldr r0, _08077770 @ =0x0000FFFF
	cmp r1, r0
	bne _0807775E
	orrs r2, r1
	strh r2, [r4, #0x18]
_0807775E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077764: .4byte 0x000003FF
_08077768: .4byte gSineTable
_0807776C: .4byte 0xFFFFFC00
_08077770: .4byte 0x0000FFFF

	thumb_func_start sub_8077774
sub_8077774: @ 0x08077774
	str r1, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	bx lr

	thumb_func_start sub_8077788
sub_8077788: @ 0x08077788
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r4, #0x18]
	ldr r5, _080777B8 @ =0x0000FFFF
	cmp r0, r5
	beq _080777C0
	ldr r1, _080777BC @ =gUnknown_080DFCB0
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
	ldrh r1, [r4, #0x18]
	eors r1, r5
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _080777C2
	.align 2, 0
_080777B8: .4byte 0x0000FFFF
_080777BC: .4byte gUnknown_080DFCB0
_080777C0:
	movs r0, #0
_080777C2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80777C8
sub_80777C8: @ 0x080777C8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r2, _08077824 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08077828 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r1, _0807782C @ =gUnknown_080DFE90
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x10]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r1, _08077830 @ =gUnknown_080DFEB4
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, #0x24
	strb r0, [r2]
	ldr r1, _08077834 @ =gUnknown_080DFED0
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08077838 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807783C @ =sub_80778AC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077824: .4byte gPlayer
_08077828: .4byte 0xFFBFFFFF
_0807782C: .4byte gUnknown_080DFE90
_08077830: .4byte gUnknown_080DFEB4
_08077834: .4byte gUnknown_080DFED0
_08077838: .4byte gCurTask
_0807783C: .4byte sub_80778AC

	thumb_func_start sub_8077840
sub_8077840: @ 0x08077840
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0807789C @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077898
	ldr r3, [r2, #0x1c]
	ldr r0, _080778A0 @ =gCamera
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r2, #0x20]
	ldr r4, [r0, #4]
	subs r2, r2, r4
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r1, r1, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r3, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r2, r2, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r1, r3, #0
	muls r1, r3, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	muls r0, r2, r0
	adds r1, r1, r0
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	ble _080778A4
_08077898:
	movs r0, #0
	b _080778A6
	.align 2, 0
_0807789C: .4byte gPlayer
_080778A0: .4byte gCamera
_080778A4:
	movs r0, #1
_080778A6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80778AC
sub_80778AC: @ 0x080778AC
	push {r4, lr}
	ldr r0, _080778E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8077840
	cmp r0, #0
	beq _080778CA
	adds r0, r4, #0
	bl sub_80778E4
_080778CA:
	adds r0, r4, #0
	bl sub_807794C
	cmp r0, #0
	beq _080778DA
	adds r0, r4, #0
	bl sub_8077994
_080778DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080778E0: .4byte gCurTask

	thumb_func_start sub_80778E4
sub_80778E4: @ 0x080778E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _0807793C @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r6, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	ldr r1, [r5, #0x1c]
	lsls r1, r1, #8
	ldr r2, [r5, #0x20]
	adds r2, #4
	lsls r2, r2, #8
	adds r0, r5, #0
	bl sub_8077774
	ldr r0, _08077940 @ =0x00000141
	bl m4aSongNumStart
	ldr r0, _08077944 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08077948 @ =sub_8077A3C
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807793C: .4byte gPlayer
_08077940: .4byte 0x00000141
_08077944: .4byte gCurTask
_08077948: .4byte sub_8077A3C

	thumb_func_start sub_807794C
sub_807794C: @ 0x0807794C
	push {lr}
	ldr r1, [r0, #0x1c]
	ldr r3, _08077988 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x20]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08077984
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08077984
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807798C
_08077984:
	movs r0, #1
	b _0807798E
	.align 2, 0
_08077988: .4byte gCamera
_0807798C:
	movs r0, #0
_0807798E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8077994
sub_8077994: @ 0x08077994
	push {lr}
	ldr r1, [r0, #0x28]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080779AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080779AC: .4byte gCurTask

	thumb_func_start initSprite_Interactable_MusicPlant_PipeInstrument_Entry
initSprite_Interactable_MusicPlant_PipeInstrument_Entry: @ 0x080779B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08077A28 @ =sub_80778AC
	ldr r2, _08077A2C @ =0x00002010
	ldr r1, _08077A30 @ =sub_8077AA8
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r1, r3
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	strh r0, [r3, #0x24]
	str r2, [r3, #0x28]
	ldrb r2, [r2]
	ldr r7, _08077A34 @ =IWRAM_START + 0x2C
	adds r0, r1, r7
	strb r2, [r0]
	ldr r0, _08077A38 @ =IWRAM_START + 0x2D
	adds r1, r1, r0
	strb r6, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #0x20]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A28: .4byte sub_80778AC
_08077A2C: .4byte 0x00002010
_08077A30: .4byte sub_8077AA8
_08077A34: .4byte IWRAM_START + 0x2C
_08077A38: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_8077A3C
sub_8077A3C: @ 0x08077A3C
	push {r4, r5, lr}
	ldr r5, _08077A64 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08077A68 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08077A70
	bl sub_802A004
	ldr r1, [r5]
	ldr r0, _08077A6C @ =sub_80778AC
	str r0, [r1, #8]
	b _08077A9C
	.align 2, 0
_08077A64: .4byte gCurTask
_08077A68: .4byte gPlayer
_08077A6C: .4byte sub_80778AC
_08077A70:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	movs r0, #1
	strh r0, [r2, #0x10]
	strh r1, [r2, #0x12]
	ldr r1, _08077AA4 @ =gUnknown_08C8793C
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8077788
	cmp r0, #0
	bne _08077A96
	adds r0, r4, #0
	bl sub_80777C8
_08077A96:
	adds r0, r4, #0
	bl sub_8077AAC
_08077A9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077AA4: .4byte gUnknown_08C8793C

	thumb_func_start sub_8077AA8
sub_8077AA8: @ 0x08077AA8
	bx lr
	.align 2, 0

	thumb_func_start sub_8077AAC
sub_8077AAC: @ 0x08077AAC
	ldr r2, _08077AB8 @ =gPlayer
	ldr r1, [r0, #0x10]
	str r1, [r2, #8]
	ldr r0, [r0, #0x14]
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
_08077AB8: .4byte gPlayer

	thumb_func_start sub_8077ABC
sub_8077ABC: @ 0x08077ABC
	push {r4, r5, lr}
	ldr r5, _08077AE4 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _08077AE8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08077AF0
	bl sub_802A004
	ldr r1, [r5]
	ldr r0, _08077AEC @ =sub_8077C04
	str r0, [r1, #8]
	b _08077B1E
	.align 2, 0
_08077AE4: .4byte gCurTask
_08077AE8: .4byte gPlayer
_08077AEC: .4byte sub_8077C04
_08077AF0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #1
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x12]
	ldr r1, _08077B24 @ =gUnknown_08C87960
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8077788
	cmp r0, #0
	bne _08077B18
	adds r0, r4, #0
	bl sub_8077B28
_08077B18:
	adds r0, r4, #0
	bl sub_8077CA0
_08077B1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077B24: .4byte gUnknown_08C87960

	thumb_func_start sub_8077B28
sub_8077B28: @ 0x08077B28
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r2, _08077B80 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08077B84 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r1, _08077B88 @ =gUnknown_080DFFF4
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x10]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r1, _08077B8C @ =gUnknown_080E0000
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, #0x24
	strb r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08077B90 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08077B94 @ =sub_8077C04
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077B80: .4byte gPlayer
_08077B84: .4byte 0xFFBFFFFF
_08077B88: .4byte gUnknown_080DFFF4
_08077B8C: .4byte gUnknown_080E0000
_08077B90: .4byte gCurTask
_08077B94: .4byte sub_8077C04

	thumb_func_start sub_8077B98
sub_8077B98: @ 0x08077B98
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08077BF4 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077BF0
	ldr r3, [r2, #0x1c]
	ldr r0, _08077BF8 @ =gCamera
	ldr r1, [r0]
	subs r3, r3, r1
	ldr r2, [r2, #0x20]
	ldr r4, [r0, #4]
	subs r2, r2, r4
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r1, r1, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r3, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r2, r2, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r1, r3, #0
	muls r1, r3, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	muls r0, r2, r0
	adds r1, r1, r0
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	ble _08077BFC
_08077BF0:
	movs r0, #0
	b _08077BFE
	.align 2, 0
_08077BF4: .4byte gPlayer
_08077BF8: .4byte gCamera
_08077BFC:
	movs r0, #1
_08077BFE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8077C04
sub_8077C04: @ 0x08077C04
	push {r4, lr}
	ldr r0, _08077C38 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8077B98
	cmp r0, #0
	beq _08077C22
	adds r0, r4, #0
	bl sub_8077C3C
_08077C22:
	adds r0, r4, #0
	bl sub_8077CB0
	cmp r0, #0
	beq _08077C32
	adds r0, r4, #0
	bl sub_8077CF8
_08077C32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077C38: .4byte gCurTask

	thumb_func_start sub_8077C3C
sub_8077C3C: @ 0x08077C3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _08077C90 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r6, #0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	ldr r1, [r5, #0x1c]
	lsls r1, r1, #8
	ldr r2, [r5, #0x20]
	lsls r2, r2, #8
	adds r0, r5, #0
	bl sub_8077774
	ldr r0, _08077C94 @ =0x0000013F
	bl m4aSongNumStart
	ldr r0, _08077C98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08077C9C @ =sub_8077ABC
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077C90: .4byte gPlayer
_08077C94: .4byte 0x0000013F
_08077C98: .4byte gCurTask
_08077C9C: .4byte sub_8077ABC

	thumb_func_start sub_8077CA0
sub_8077CA0: @ 0x08077CA0
	ldr r2, _08077CAC @ =gPlayer
	ldr r1, [r0, #0x10]
	str r1, [r2, #8]
	ldr r0, [r0, #0x14]
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
_08077CAC: .4byte gPlayer

	thumb_func_start sub_8077CB0
sub_8077CB0: @ 0x08077CB0
	push {lr}
	ldr r1, [r0, #0x1c]
	ldr r3, _08077CEC @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x20]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08077CE8
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08077CE8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08077CF0
_08077CE8:
	movs r0, #1
	b _08077CF2
	.align 2, 0
_08077CEC: .4byte gCamera
_08077CF0:
	movs r0, #0
_08077CF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8077CF8
sub_8077CF8: @ 0x08077CF8
	push {lr}
	ldr r1, [r0, #0x28]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08077D10 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08077D10: .4byte gCurTask

	thumb_func_start initSprite_Interactable_MusicPlant_Trumpet_Entry
initSprite_Interactable_MusicPlant_Trumpet_Entry: @ 0x08077D14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08077D8C @ =sub_8077C04
	ldr r2, _08077D90 @ =0x00002010
	ldr r1, _08077D94 @ =sub_8077DA0
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r1, r3
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	strh r0, [r3, #0x24]
	str r2, [r3, #0x28]
	ldrb r2, [r2]
	ldr r7, _08077D98 @ =IWRAM_START + 0x2C
	adds r0, r1, r7
	strb r2, [r0]
	ldr r0, _08077D9C @ =IWRAM_START + 0x2D
	adds r1, r1, r0
	strb r6, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #0x20]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077D8C: .4byte sub_8077C04
_08077D90: .4byte 0x00002010
_08077D94: .4byte sub_8077DA0
_08077D98: .4byte IWRAM_START + 0x2C
_08077D9C: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_8077DA0
sub_8077DA0: @ 0x08077DA0
	bx lr
	.align 2, 0
