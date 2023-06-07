.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_800A24C
Task_800A24C: @ 0x0800A24C
	push {r4, r5, r6, lr}
	ldr r0, _0800A2C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	ldr r0, _0800A2CC @ =IWRAM_START + 0x62
	adds r4, r6, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _0800A2D0 @ =gMPlayInfo_BGM
	ldr r5, _0800A2D4 @ =0x0000FFFF
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2D8 @ =gMPlayInfo_SE1
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2DC @ =gMPlayInfo_SE2
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2E0 @ =gMPlayInfo_SE3
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r4]
	cmp r0, #0x2f
	bls _0800A308
	ldr r0, _0800A2E4 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldr r2, _0800A2E8 @ =IWRAM_START + 0x65
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #5]
	movs r0, #0
	adds r1, r5, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800A2EC @ =gUnknown_03002AE4
	ldr r0, _0800A2F0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800A2F4 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0800A2F8 @ =gVramGraphicsCopyCursor
	ldr r0, _0800A2FC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800A300 @ =IWRAM_START + 0x64
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A304
	bl CreateTitleScreen
	b _0800A308
	.align 2, 0
_0800A2C8: .4byte gCurTask
_0800A2CC: .4byte IWRAM_START + 0x62
_0800A2D0: .4byte gMPlayInfo_BGM
_0800A2D4: .4byte 0x0000FFFF
_0800A2D8: .4byte gMPlayInfo_SE1
_0800A2DC: .4byte gMPlayInfo_SE2
_0800A2E0: .4byte gMPlayInfo_SE3
_0800A2E4: .4byte gLoadedSaveGame
_0800A2E8: .4byte IWRAM_START + 0x65
_0800A2EC: .4byte gUnknown_03002AE4
_0800A2F0: .4byte gUnknown_0300287C
_0800A2F4: .4byte gUnknown_03005390
_0800A2F8: .4byte gVramGraphicsCopyCursor
_0800A2FC: .4byte gVramGraphicsCopyQueueIndex
_0800A300: .4byte IWRAM_START + 0x64
_0800A304:
	bl CreateTitleScreenAtPlayModeMenu
_0800A308:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Task_800A310
Task_800A310: @ 0x0800A310
	push {lr}
	ldr r0, _0800A33C @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	ldr r0, _0800A340 @ =IWRAM_START + 0x60
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	ldr r2, _0800A344 @ =gBldRegs
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r2, #4]
	ldrh r1, [r1]
	ldr r0, _0800A348 @ =0x00000FFF
	cmp r1, r0
	bls _0800A336
	ldr r0, _0800A34C @ =Task_800A24C
	str r0, [r3, #8]
_0800A336:
	pop {r0}
	bx r0
	.align 2, 0
_0800A33C: .4byte gCurTask
_0800A340: .4byte IWRAM_START + 0x60
_0800A344: .4byte gBldRegs
_0800A348: .4byte 0x00000FFF
_0800A34C: .4byte Task_800A24C

	thumb_func_start TaskDestructor_800A350
TaskDestructor_800A350: @ 0x0800A350
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	ldr r1, _0800A37C @ =gUnknown_030054E4
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0800A380 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _0800A384 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A37C: .4byte gUnknown_030054E4
_0800A380: .4byte gUnknown_03005424
_0800A384: .4byte 0x0000FFBF

	thumb_func_start CreateMusicFadeoutTask
CreateMusicFadeoutTask: @ 0x0800A388
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800A3C8 @ =Task_800A3D4
	ldr r2, _0800A3CC @ =0x0000FFFE
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4]
	adds r1, r5, #0
	bl __divsi3
	strh r0, [r4, #2]
	ldr r1, _0800A3D0 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A3C8: .4byte Task_800A3D4
_0800A3CC: .4byte 0x0000FFFE
_0800A3D0: .4byte gUnknown_030054A8

	thumb_func_start Task_800A3D4
Task_800A3D4: @ 0x0800A3D4
	push {r4, r5, lr}
	ldr r0, _0800A424 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0800A428 @ =gMPlayInfo_BGM
	ldr r4, _0800A42C @ =0x0000FFFF
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A430 @ =gMPlayInfo_SE1
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A434 @ =gMPlayInfo_SE2
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A438 @ =gMPlayInfo_SE3
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800A41E
	movs r0, #0
	strh r0, [r5]
_0800A41E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A424: .4byte gCurTask
_0800A428: .4byte gMPlayInfo_BGM
_0800A42C: .4byte 0x0000FFFF
_0800A430: .4byte gMPlayInfo_SE1
_0800A434: .4byte gMPlayInfo_SE2
_0800A438: .4byte gMPlayInfo_SE3
