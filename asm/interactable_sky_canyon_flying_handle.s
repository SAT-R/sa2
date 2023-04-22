.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807F350
sub_807F350: @ 0x0807F350
	push {r4, r5, lr}
	ldr r0, _0807F388 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807F38C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F36C
	adds r0, r4, #0
	bl sub_807F8B4
_0807F36C:
	adds r0, r4, #0
	bl sub_807F818
	ldr r3, _0807F390 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807F394
	adds r0, r4, #0
	bl sub_807F770
	b _0807F3DC
	.align 2, 0
_0807F388: .4byte gCurTask
_0807F38C: .4byte gGameMode
_0807F390: .4byte gPlayer
_0807F394:
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	cmp r0, #0x78
	bne _0807F3A4
	adds r0, r4, #0
	bl sub_807F798
	b _0807F3DC
_0807F3A4:
	ldr r1, _0807F408 @ =IWRAM_START + 0x69
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _0807F3E8
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0807F40C @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807F3DC
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0807F3D4
	movs r0, #1
_0807F3D4:
	str r0, [r4, #0x64]
	adds r0, r4, #0
	bl sub_807F484
_0807F3DC:
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807F3EE
_0807F3E8:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0807F3EE:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F7D0
	adds r0, r4, #0
	bl sub_807F5C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F408: .4byte IWRAM_START + 0x69
_0807F40C: .4byte gPlayerControls

	thumb_func_start sub_807F410
sub_807F410: @ 0x0807F410
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0807F470 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #0x37
	strh r0, [r1]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x10]
	strh r5, [r2, #0x12]
	adds r0, r4, #0
	bl sub_807F7D0
	movs r0, #1
	str r0, [r4, #0x60]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0807F474 @ =0x0000FE80
	strh r0, [r1]
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x48]
	str r5, [r4, #0x4c]
	str r5, [r4, #0x50]
	adds r4, #0x69
	movs r0, #0x1e
	strb r0, [r4]
	ldr r0, _0807F478 @ =0x00000123
	bl m4aSongNumStart
	ldr r0, _0807F47C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F480 @ =sub_807F350
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F470: .4byte gPlayer
_0807F474: .4byte 0x0000FE80
_0807F478: .4byte 0x00000123
_0807F47C: .4byte gCurTask
_0807F480: .4byte sub_807F350

	thumb_func_start sub_807F484
sub_807F484: @ 0x0807F484
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0807F4DC @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _0807F4E0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x10]
	strh r2, [r4, #0x12]
	adds r5, #0x69
	movs r0, #0x1e
	strb r0, [r5]
	ldr r0, _0807F4E4 @ =0x00000123
	bl m4aSongNumStop
	ldr r0, _0807F4E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F4EC @ =sub_807F6F0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4DC: .4byte gPlayer
_0807F4E0: .4byte 0xFFBFFFFF
_0807F4E4: .4byte 0x00000123
_0807F4E8: .4byte gCurTask
_0807F4EC: .4byte sub_807F6F0

	thumb_func_start sub_807F4F0
sub_807F4F0: @ 0x0807F4F0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x60]
	cmp r0, #0
	beq _0807F58A
	adds r2, r3, #0
	adds r2, #0x56
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3, #0x48]
	adds r5, r2, #0
	adds r4, r3, #0
	adds r4, #0x5e
	cmp r1, r0
	bgt _0807F540
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0807F540
	ldr r1, _0807F53C @ =gSineTable
	adds r2, #0x12
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r3, #0x50]
	ldrb r0, [r2]
	adds r0, #4
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4]
	b _0807F5B6
	.align 2, 0
_0807F53C: .4byte gSineTable
_0807F540:
	adds r1, r4, #0
	ldrh r0, [r1]
	adds r0, #0x10
	strh r0, [r1]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0807F558
	adds r2, r1, #0
_0807F558:
	strh r2, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r1, [r3, #0x48]
	subs r1, r1, r0
	str r1, [r3, #0x48]
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r0, [r3, #0x40]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807F5B6
	movs r0, #0
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	adds r1, r3, #0
	adds r1, #0x68
	movs r0, #0x80
	b _0807F5B4
_0807F58A:
	adds r0, r3, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	ldr r2, _0807F5BC @ =gSineTable
	adds r1, r3, #0
	adds r1, #0x68
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r3, #0x50]
	ldrb r0, [r1]
	adds r0, #4
_0807F5B4:
	strb r0, [r1]
_0807F5B6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5BC: .4byte gSineTable

	thumb_func_start sub_807F5C0
sub_807F5C0: @ 0x0807F5C0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807F5E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F5E8
	ldr r0, [r3, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807F5E4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x78]
	b _0807F5FE
	.align 2, 0
_0807F5E0: .4byte gGameMode
_0807F5E4: .4byte gCamera
_0807F5E8:
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r2, _0807F618 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x48]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
_0807F5FE:
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F618: .4byte gCamera

	thumb_func_start sub_807F61C
sub_807F61C: @ 0x0807F61C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0807F684 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F680
	ldr r3, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r3, r3, r0
	asrs r3, r3, #8
	ldr r2, _0807F688 @ =gCamera
	ldr r5, [r2]
	subs r3, r3, r5
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	asrs r1, r1, #8
	ldr r4, [r2, #4]
	subs r1, r1, r4
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r5
	ldr r2, [r6, #0xc]
	asrs r2, r2, #8
	subs r2, r2, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r3, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r1, r1, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r1, r0
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	ble _0807F68C
_0807F680:
	movs r0, #0
	b _0807F68E
	.align 2, 0
_0807F684: .4byte gPlayer
_0807F688: .4byte gCamera
_0807F68C:
	movs r0, #1
_0807F68E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable_SkyCanyon_FlyingHandle
Task_Interactable_SkyCanyon_FlyingHandle: @ 0x0807F694
	push {r4, lr}
	ldr r0, _0807F6D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807F6D8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F6B0
	adds r0, r4, #0
	bl sub_807F8B4
_0807F6B0:
	adds r0, r4, #0
	bl sub_807F61C
	cmp r0, #0
	beq _0807F6C0
	adds r0, r4, #0
	bl sub_807F410
_0807F6C0:
	adds r0, r4, #0
	bl sub_807F828
	cmp r0, #0
	beq _0807F6DC
	adds r0, r4, #0
	bl sub_807F89C
	b _0807F6E8
	.align 2, 0
_0807F6D4: .4byte gCurTask
_0807F6D8: .4byte gGameMode
_0807F6DC:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F5C0
_0807F6E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F6F0
sub_807F6F0: @ 0x0807F6F0
	push {r4, r5, lr}
	ldr r0, _0807F734 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807F738 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F70C
	adds r0, r4, #0
	bl sub_807F8B4
_0807F70C:
	ldr r0, _0807F73C @ =IWRAM_START + 0x69
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807F744
	ldr r0, _0807F740 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F72C
	adds r0, r4, #0
	bl sub_807F61C
	cmp r0, #0
	bne _0807F748
_0807F72C:
	adds r0, r4, #0
	bl sub_807F784
	b _0807F748
	.align 2, 0
_0807F734: .4byte gCurTask
_0807F738: .4byte gGameMode
_0807F73C: .4byte IWRAM_START + 0x69
_0807F740: .4byte gPlayer
_0807F744:
	subs r0, #1
	strb r0, [r1]
_0807F748:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F5C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_Interactable_SkyCanyon_FlyingHandle
TaskDestructor_Interactable_SkyCanyon_FlyingHandle: @ 0x0807F75C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807F770
sub_807F770: @ 0x0807F770
	ldr r0, _0807F77C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F780 @ =Task_Interactable_SkyCanyon_FlyingHandle
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807F77C: .4byte gCurTask
_0807F780: .4byte Task_Interactable_SkyCanyon_FlyingHandle

	thumb_func_start sub_807F784
sub_807F784: @ 0x0807F784
	ldr r0, _0807F790 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F794 @ =Task_Interactable_SkyCanyon_FlyingHandle
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807F790: .4byte gCurTask
_0807F794: .4byte Task_Interactable_SkyCanyon_FlyingHandle

	thumb_func_start sub_807F798
sub_807F798: @ 0x0807F798
	push {lr}
	ldr r3, _0807F7BC @ =gPlayer
	ldr r1, [r3, #0x20]
	ldr r2, _0807F7C0 @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r3, #0x20]
	adds r0, #0x69
	movs r1, #0x1e
	strb r1, [r0]
	ldr r0, _0807F7C4 @ =0x00000123
	bl m4aSongNumStop
	ldr r0, _0807F7C8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F7CC @ =sub_807F6F0
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807F7BC: .4byte gPlayer
_0807F7C0: .4byte 0xFFBFFFFF
_0807F7C4: .4byte 0x00000123
_0807F7C8: .4byte gCurTask
_0807F7CC: .4byte sub_807F6F0

	thumb_func_start sub_807F7D0
sub_807F7D0: @ 0x0807F7D0
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807F7F0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	cmp r1, #0
	beq _0807F7F4
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807F7FC
	.align 2, 0
_0807F7F0: .4byte gPlayer
_0807F7F4:
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	ldr r1, _0807F814 @ =0xFFFFFC00
_0807F7FC:
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, [r3, #0x48]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_0807F814: .4byte 0xFFFFFC00

	thumb_func_start sub_807F818
sub_807F818: @ 0x0807F818
	push {lr}
	ldr r0, _0807F824 @ =0x00000123
	bl m4aSongNumStartOrContinue
	pop {r0}
	bx r0
	.align 2, 0
_0807F824: .4byte 0x00000123

	thumb_func_start sub_807F828
sub_807F828: @ 0x0807F828
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807F890 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807F88A
	adds r0, r3, #0
	adds r0, #0x54
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807F88A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807F88A
	adds r0, r3, #0
	adds r0, #0x56
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807F894
_0807F88A:
	movs r0, #1
	b _0807F896
	.align 2, 0
_0807F890: .4byte gCamera
_0807F894:
	movs r0, #0
_0807F896:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807F89C
sub_807F89C: @ 0x0807F89C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807F8B0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807F8B0: .4byte gCurTask

	thumb_func_start sub_807F8B4
sub_807F8B4: @ 0x0807F8B4
	ldr r1, [r0, #0x74]
	str r1, [r0, #0x7c]
	adds r2, r0, #0
	adds r2, #0x80
	ldr r1, [r0, #0x78]
	str r1, [r2]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x70]
	str r1, [r0, #0x78]
	ldr r1, [r0, #0x44]
	ldr r2, [r0, #0x4c]
	adds r1, r1, r2
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x48]
	ldr r2, [r0, #0x50]
	adds r1, r1, r2
	str r1, [r0, #0x70]
	bx lr
	.align 2, 0
