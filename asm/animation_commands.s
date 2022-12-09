.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start animCmd_GetPalette
animCmd_GetPalette: @ 0x08005B3C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _08005B90
	ldr r1, [r4, #4]
	ldr r2, _08005B98 @ =0x040000D4
	ldr r0, _08005B9C @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08005BA0 @ =gObjPalette
	adds r0, r0, r1
	str r0, [r2, #4]
	ldrh r0, [r4, #8]
	asrs r0, r0, #1
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _08005BA4 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_08005B90:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005B98: .4byte 0x040000D4
_08005B9C: .4byte gUnknown_03002794
_08005BA0: .4byte gObjPalette
_08005BA4: .4byte gFlags

	thumb_func_start animCmd_JumpBack
animCmd_JumpBack: @ 0x08005BA8
	ldr r2, [r0, #4]
	ldrh r0, [r1, #0x14]
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr

	thumb_func_start animCmd_4
animCmd_4: @ 0x08005BB4
	ldr r0, [r1, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r0, r2
	str r0, [r1, #0x10]
	movs r0, #0
	bx lr
	.align 2, 0

    @ Cmd (-5)
	thumb_func_start animCmd_PlaySoundEffect
animCmd_PlaySoundEffect: @ 0x08005BC4
	push {lr}
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r0, [r0, #4]
	bl m4aSongNumStart
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start animCmd_7
animCmd_7: @ 0x08005BD8
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	ldrh r3, [r1, #0x16]
	adds r2, r2, r3
	strh r2, [r1, #0x16]
	ldrh r0, [r0, #6]
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	strh r0, [r1, #0x18]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start animCmd_8
animCmd_8: @ 0x08005BF4
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start animCmd_9
animCmd_9: @ 0x08005C00
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	strh r2, [r1, #0xa]
	adds r3, r1, #0
	adds r3, #0x21
	movs r2, #0xff
	strb r2, [r3]
	ldrh r0, [r0, #6]
	adds r1, #0x20
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

	thumb_func_start animCmd_10
animCmd_10: @ 0x08005C20
	ldrh r2, [r1, #0x14]
	adds r2, #4
	strh r2, [r1, #0x14]
	bx lr

	thumb_func_start animCmd_11
animCmd_11: @ 0x08005C28
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldr r2, [r1, #0x10]
	ldr r3, _08005C40 @ =0xFFFFCFFF
	ands r2, r3
	ldr r0, [r0, #4]
	lsls r0, r0, #0xc
	orrs r2, r0
	str r2, [r1, #0x10]
	movs r0, #1
	bx lr
	.align 2, 0
_08005C40: .4byte 0xFFFFCFFF

	thumb_func_start animCmd_12
animCmd_12: @ 0x08005C44
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldr r0, [r0, #4]
	lsls r0, r0, #6
	strh r0, [r1, #0x1a]
	movs r0, #1
	bx lr
