.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_80754B8
sub_80754B8: @ 0x080754B8
	push {r4, r5, r6, lr}
	ldr r3, _080754E4 @ =gCurTask
	ldr r0, [r3]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x4a
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0807552C
	cmp r0, #4
	bgt _080754E8
	cmp r0, #0
	beq _080754EE
	b _08075588
	.align 2, 0
_080754E4: .4byte gCurTask
_080754E8:
	cmp r0, #6
	beq _08075574
	b _08075588
_080754EE:
	ldr r3, _08075520 @ =gSineTable
	ldr r1, _08075524 @ =IWRAM_START + 0x49
	adds r2, r4, r1
	ldrb r0, [r2]
	lsls r0, r0, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	ldr r6, _08075528 @ =IWRAM_START + 0x44
	adds r1, r4, r6
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	b _0807555E
	.align 2, 0
_08075520: .4byte gSineTable
_08075524: .4byte IWRAM_START + 0x49
_08075528: .4byte IWRAM_START + 0x44
_0807552C:
	ldr r3, _08075568 @ =gSineTable
	ldr r6, _0807556C @ =IWRAM_START + 0x49
	adds r2, r4, r6
	ldrb r0, [r2]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	rsbs r0, r0, #0
	subs r6, #5
	adds r1, r4, r6
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	rsbs r0, r0, #0
_0807555E:
	ldr r2, _08075570 @ =IWRAM_START + 0x46
	adds r1, r4, r2
	strh r0, [r1]
	b _08075588
	.align 2, 0
_08075568: .4byte gSineTable
_0807556C: .4byte IWRAM_START + 0x49
_08075570: .4byte IWRAM_START + 0x46
_08075574:
	ldr r6, _0807559C @ =IWRAM_START + 0x44
	adds r0, r4, r6
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080755A0 @ =IWRAM_START + 0x46
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, [r3]
	ldr r0, _080755A4 @ =Task_Interactable_MusicPlant_Note_Sphere
	str r0, [r1, #8]
_08075588:
	adds r0, r5, #0
	bl sub_8075880
	adds r0, r5, #0
	bl sub_80758B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807559C: .4byte IWRAM_START + 0x44
_080755A0: .4byte IWRAM_START + 0x46
_080755A4: .4byte Task_Interactable_MusicPlant_Note_Sphere

	thumb_func_start sub_80755A8
sub_80755A8: @ 0x080755A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	bl sub_8075678
	adds r1, r7, #0
	adds r1, #0x49
	movs r2, #0
	mov ip, r2
	strb r0, [r1]
	ldr r2, _08075660 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _08075664 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r0, r7, #0
	adds r0, #0x4a
	mov r3, ip
	strb r3, [r0]
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	ldr r4, _08075668 @ =gUnknown_080DFC20
	adds r5, r7, #0
	adds r5, #0x48
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	str r2, [sp]
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r6, #0
	ldrsh r3, [r2, r6]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, ip
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	rsbs r2, r2, #0
	asrs r2, r2, #3
	str r2, [sp]
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #0xe
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0x1e
	bl sub_8080C78
	ldr r1, _0807566C @ =gUnknown_080DFC30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStart
	ldr r0, _08075670 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075674 @ =sub_80754B8
	str r0, [r1, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075660: .4byte gPlayer
_08075664: .4byte 0xFFFFFEFF
_08075668: .4byte gUnknown_080DFC20
_0807566C: .4byte gUnknown_080DFC30
_08075670: .4byte gCurTask
_08075674: .4byte sub_80754B8

	thumb_func_start sub_8075678
sub_8075678: @ 0x08075678
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r0, _080757B4 @ =gPlayer
	mov sb, r0
	ldr r4, [r0, #8]
	asrs r4, r4, #8
	mov r1, sl
	ldr r0, [r1, #0x3c]
	subs r4, r4, r0
	mov r2, sb
	ldr r5, [r2, #0xc]
	asrs r5, r5, #8
	ldr r0, [r1, #0x40]
	subs r5, r5, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8085530
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0xe
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0xe
	adds r0, r5, #0
	adds r1, r6, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl ArcTan2
	mov r8, r0
	mov r3, r8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x18
	mov r8, r3
	mov r0, sl
	adds r0, #0x49
	strb r3, [r0]
	mov r5, sb
	ldrh r4, [r5, #0x10]
	rsbs r4, r4, #0
	ldrh r5, [r5, #0x12]
	rsbs r5, r5, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8085530
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #8
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x16
	lsrs r4, r4, #0x10
	lsls r5, r5, #8
	adds r0, r5, #0
	adds r1, r6, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x16
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl ArcTan2
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	mov r1, r8
	movs r2, #8
	bl sub_808558C
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r3, _080757B8 @ =gUnknown_080DFC20
	movs r0, #0x48
	add sl, r0
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _080757BC @ =gSineTable
	lsls r0, r4, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, sb
	strh r0, [r1, #0x10]
	mov r5, sl
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r4, r4, #3
	adds r4, r4, r2
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r5, sb
	strh r0, [r5, #0x12]
	movs r0, #0x6d
	add sb, r0
	movs r0, #5
	mov r1, sb
	strb r0, [r1]
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080757B4: .4byte gPlayer
_080757B8: .4byte gUnknown_080DFC20
_080757BC: .4byte gSineTable

	thumb_func_start sub_80757C0
sub_80757C0: @ 0x080757C0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08075828 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807582C
	ldr r0, [r5, #8]
	asrs r2, r0, #8
	ldr r1, [r3, #0x3c]
	subs r0, r1, r2
	cmp r0, #0
	bge _080757E0
	subs r0, r2, r1
_080757E0:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	asrs r2, r0, #8
	ldr r1, [r3, #0x40]
	subs r0, r1, r2
	cmp r0, #0
	bge _080757F4
	subs r0, r2, r1
_080757F4:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08075808
	adds r3, r4, #0
_08075808:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bgt _0807582C
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r1, #0x90
	lsls r1, r1, #2
	cmp r0, r1
	bgt _0807582C
	movs r0, #1
	b _0807582E
	.align 2, 0
_08075828: .4byte gPlayer
_0807582C:
	movs r0, #0
_0807582E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable_MusicPlant_Note_Sphere
Task_Interactable_MusicPlant_Note_Sphere: @ 0x08075834
	push {r4, lr}
	ldr r0, _08075864 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80757C0
	cmp r0, #0
	beq _08075852
	adds r0, r4, #0
	bl sub_80755A8
_08075852:
	adds r0, r4, #0
	bl sub_80758E8
	cmp r0, #0
	beq _08075868
	adds r0, r4, #0
	bl sub_8075924
	b _08075874
	.align 2, 0
_08075864: .4byte gCurTask
_08075868:
	adds r0, r4, #0
	bl sub_8075880
	adds r0, r4, #0
	bl sub_80758B8
_08075874:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_Interactable_MusicPlant_Note_Sphere
TaskDestructor_Interactable_MusicPlant_Note_Sphere: @ 0x0807587C
	bx lr
	.align 2, 0

	thumb_func_start sub_8075880
sub_8075880: @ 0x08075880
	mov ip, r0
	mov r3, ip
	adds r3, #0xc
	ldr r1, [r0, #0x3c]
	ldr r2, _080758B4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	mov r0, ip
	ldr r1, [r0, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x18]
	bx lr
	.align 2, 0
_080758B4: .4byte gCamera

	thumb_func_start sub_80758B8
sub_80758B8: @ 0x080758B8
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _080758E4 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080758E4: .4byte 0xFFFFFBFF

	thumb_func_start sub_80758E8
sub_80758E8: @ 0x080758E8
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08075918 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _08075912
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _0807591C
_08075912:
	movs r0, #1
	b _0807591E
	.align 2, 0
_08075918: .4byte gCamera
_0807591C:
	movs r0, #0
_0807591E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075924
sub_8075924: @ 0x08075924
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08075938 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08075938: .4byte gCurTask
