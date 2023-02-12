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

.if 00
.endif
