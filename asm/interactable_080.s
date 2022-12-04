.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable080
initSprite_Interactable080: @ 0x0807B088
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807B168 @ =Task_Interactable080
	ldr r2, _0807B16C @ =0x00002010
	ldr r1, _0807B170 @ =TaskDestructor_Interactable080
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldr r1, _0807B174 @ =IWRAM_START + 0x44
	adds r0, r5, r1
	movs r1, #0
	mov sl, r1
	movs r3, #0
	strh r3, [r0]
	ldr r1, _0807B178 @ =IWRAM_START + 0x46
	adds r0, r5, r1
	strh r3, [r0]
	adds r1, #2
	adds r0, r5, r1
	strh r3, [r0]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	strh r4, [r2, #4]
	strh r6, [r2, #6]
	mov r0, sb
	str r0, [r2]
	ldrb r0, [r0]
	strb r0, [r2, #8]
	mov r1, r8
	strb r1, [r2, #9]
	ldr r0, _0807B17C @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]
	ldr r0, _0807B180 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B184 @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807B188 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _0807B18C @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	mov r1, sl
	strb r1, [r5]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, sb
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B168: .4byte Task_Interactable080
_0807B16C: .4byte 0x00002010
_0807B170: .4byte TaskDestructor_Interactable080
_0807B174: .4byte IWRAM_START + 0x44
_0807B178: .4byte IWRAM_START + 0x46
_0807B17C: .4byte IWRAM_START + 0xC
_0807B180: .4byte IWRAM_START + 0x2D
_0807B184: .4byte IWRAM_START + 0x2E
_0807B188: .4byte IWRAM_START + 0x31
_0807B18C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807B190
sub_807B190: @ 0x0807B190
	push {lr}
	ldr r3, [r0, #0x3c]
	ldr r2, _0807B1E4 @ =gCamera
	ldr r1, [r2]
	subs r3, r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r3, r3, r1
	ldr r1, [r0, #0x40]
	ldr r2, [r2, #4]
	subs r1, r1, r2
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r3, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r3, r3, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r3, r0
	bhi _0807B1DE
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B1DE
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B1E8
_0807B1DE:
	movs r0, #1
	b _0807B1EA
	.align 2, 0
_0807B1E4: .4byte gCamera
_0807B1E8:
	movs r0, #0
_0807B1EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B1F0
sub_807B1F0: @ 0x0807B1F0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0807B264 @ =gPlayer
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B260
	ldr r3, [r6, #0x3c]
	ldr r1, _0807B268 @ =gCamera
	ldr r5, [r1]
	subs r3, r3, r5
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r3, r3, r0
	ldr r2, [r6, #0x40]
	ldr r4, [r1, #4]
	subs r2, r2, r4
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r2, r2, r0
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	subs r0, r0, r5
	ldr r1, [r7, #0xc]
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
	movs r0, #0x90
	lsls r0, r0, #2
	cmp r1, r0
	ble _0807B26C
_0807B260:
	movs r0, #0
	b _0807B26E
	.align 2, 0
_0807B264: .4byte gPlayer
_0807B268: .4byte gCamera
_0807B26C:
	movs r0, #1
_0807B26E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable080
Task_Interactable080: @ 0x0807B274
	push {r4, lr}
	ldr r0, _0807B2A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807B1F0
	cmp r0, #0
	beq _0807B292
	adds r0, r4, #0
	bl sub_807B2D0
_0807B292:
	adds r0, r4, #0
	bl sub_807B190
	cmp r0, #0
	beq _0807B2A8
	adds r0, r4, #0
	bl sub_807B398
	b _0807B2B4
	.align 2, 0
_0807B2A4: .4byte gCurTask
_0807B2A8:
	adds r0, r4, #0
	bl sub_807B318
	adds r0, r4, #0
	bl sub_807B350
_0807B2B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_Interactable080
TaskDestructor_Interactable080: @ 0x0807B2BC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807B2D0
sub_807B2D0: @ 0x0807B2D0
	push {r4, lr}
	ldr r2, _0807B308 @ =gPlayer
	movs r1, #0x6d
	adds r1, r1, r2
	mov ip, r1
	movs r3, #0
	movs r1, #0xe
	mov r4, ip
	strb r1, [r4]
	adds r2, #0x6e
	strb r3, [r2]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807B30C @ =0x00000129
	bl m4aSongNumStart
	ldr r0, _0807B310 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B314 @ =sub_807B3B0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B308: .4byte gPlayer
_0807B30C: .4byte 0x00000129
_0807B310: .4byte gCurTask
_0807B314: .4byte sub_807B3B0

	thumb_func_start sub_807B318
sub_807B318: @ 0x0807B318
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0807B348 @ =gSineTable
	adds r2, r3, #0
	adds r2, #0x48
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r3, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r3, _0807B34C @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0807B348: .4byte gSineTable
_0807B34C: .4byte 0x000003FF

	thumb_func_start sub_807B350
sub_807B350: @ 0x0807B350
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r1, [r3, #0x3c]
	ldr r2, _0807B394 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B394: .4byte gCamera

	thumb_func_start sub_807B398
sub_807B398: @ 0x0807B398
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807B3AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807B3AC: .4byte gCurTask

	thumb_func_start sub_807B3B0
sub_807B3B0: @ 0x0807B3B0
	push {lr}
	ldr r0, _0807B3D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0807B3D8
	adds r0, r2, #0
	bl sub_807B398
	b _0807B3DE
	.align 2, 0
_0807B3D4: .4byte gCurTask
_0807B3D8:
	adds r0, r2, #0
	bl sub_807B350
_0807B3DE:
	pop {r0}
	bx r0
	.align 2, 0
