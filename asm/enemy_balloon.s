.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateEntity_Balloon
CreateEntity_Balloon: @ 0x0805849C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _080585AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080584CA
	ldr r0, _080585B0 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805859C
_080584CA:
	ldr r0, _080585B4 @ =sub_80585DC
	ldr r2, _080585B8 @ =0x00004040
	ldr r1, _080585BC @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x60
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, _080585C0 @ =IWRAM_START + 0xC
	adds r5, r4, r0
	movs r0, #0
	mov r8, r0
	strh r6, [r1, #4]
	mov r0, sb
	strh r0, [r1, #6]
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, sl
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r3, r6, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r6, sb
	lsls r2, r6, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	movs r0, #0x80
	str r0, [r1, #0x54]
	movs r6, #0
	str r6, [r1, #0x58]
	ldr r0, _080585C4 @ =IWRAM_START + 0x5E
	adds r1, r4, r0
	movs r0, #0x78
	strb r0, [r1]
	ldrb r0, [r7, #5]
	lsls r0, r0, #2
	ldr r6, _080585C8 @ =IWRAM_START + 0x5C
	adds r1, r4, r6
	strb r0, [r1]
	ldrb r0, [r7, #6]
	lsls r0, r0, #2
	adds r6, #1
	adds r1, r4, r6
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r0, [r5, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r5, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0xa
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _080585CC @ =0x000001F5
	strh r0, [r5, #0xa]
	subs r6, #0x31
	adds r0, r4, r6
	mov r1, r8
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	movs r6, #0
	strh r6, [r5, #8]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x1c]
	ldr r0, _080585D0 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r6, _080585D4 @ =IWRAM_START + 0x2E
	adds r1, r4, r6
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080585D8 @ =IWRAM_START + 0x31
	adds r4, r4, r0
	mov r1, r8
	strb r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
_0805859C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080585AC: .4byte gGameMode
_080585B0: .4byte gUnknown_030054EC
_080585B4: .4byte sub_80585DC
_080585B8: .4byte 0x00004040
_080585BC: .4byte TaskDestructor_80095E8
_080585C0: .4byte IWRAM_START + 0xC
_080585C4: .4byte IWRAM_START + 0x5E
_080585C8: .4byte IWRAM_START + 0x5C
_080585CC: .4byte 0x000001F5
_080585D0: .4byte IWRAM_START + 0x2D
_080585D4: .4byte IWRAM_START + 0x2E
_080585D8: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80585DC
sub_80585DC: @ 0x080585DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08058684 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r1, _08058688 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r6]
	mov r8, r2
	ldr r1, [r6, #0x58]
	adds r1, #1
	ldr r4, _0805868C @ =0x000003FF
	ands r1, r4
	str r1, [r6, #0x58]
	lsls r0, r1, #2
	adds r0, r0, r1
	ands r0, r4
	ldr r5, _08058690 @ =gSineTable
	mov sl, r5
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r5, [r0, r2]
	mov ip, r5
	ldr r5, _08058694 @ =IWRAM_START + 0x5C
	adds r0, r3, r5
	ldrb r0, [r0]
	mov r2, ip
	muls r2, r0, r2
	asrs r2, r2, #6
	str r2, [r6, #0x4c]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r4
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r5, #1
	adds r3, r3, r5
	ldrb r0, [r3]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	str r1, [sp]
	ldr r2, [r6, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #4]
	ldr r4, _08058698 @ =gCamera
	ldr r0, [r4]
	adds r3, r1, #0
	subs r0, r3, r0
	strh r0, [r7, #0x16]
	ldr r0, [r4, #4]
	ldr r5, [sp, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _0805869C
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08058780
	.align 2, 0
_08058684: .4byte gCurTask
_08058688: .4byte IWRAM_START + 0xC
_0805868C: .4byte 0x000003FF
_08058690: .4byte gSineTable
_08058694: .4byte IWRAM_START + 0x5C
_08058698: .4byte gCamera
_0805869C:
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080586CC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080586CC
	ldr r0, [r6, #0x48]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	movs r4, #0x90
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _080586CC
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08058704
_080586CC:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080586F0
	movs r5, #0x18
	ldrsh r0, [r7, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _080586F0
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058704
_080586F0:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08058700 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058780
	.align 2, 0
_08058700: .4byte gCurTask
_08058704:
	ldr r0, [r6, #0x4c]
	asrs r2, r0, #8
	mov r3, r8
	movs r1, #3
	ldrsb r1, [r3, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _08058718
	movs r0, #0x80
	b _08058728
_08058718:
	mov r4, r8
	ldrb r0, [r4, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _0805872A
	movs r0, #0x80
	rsbs r0, r0, #0
_08058728:
	str r0, [r6, #0x54]
_0805872A:
	adds r1, r6, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058758
	ldr r0, _08058790 @ =0x000001F5
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08058794 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08058798 @ =sub_805879C
	str r0, [r1, #8]
_08058758:
	ldr r5, [sp]
	lsls r0, r5, #8
	ldr r2, [sp, #4]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_08058780:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058790: .4byte 0x000001F5
_08058794: .4byte gCurTask
_08058798: .4byte sub_805879C

	thumb_func_start sub_805879C
sub_805879C: @ 0x0805879C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _080587FC @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _08058800 @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r6]
	mov sl, r3
	ldr r1, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x48]
	ldr r0, [r6, #0x50]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _08058804 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08058808
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08058904
	.align 2, 0
_080587FC: .4byte gCurTask
_08058800: .4byte IWRAM_START + 0xC
_08058804: .4byte gCamera
_08058808:
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805883A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805883A
	ldr r0, [r6, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805883A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08058874
_0805883A:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805885E
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805885E
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08058874
_0805885E:
	ldrb r0, [r6, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08058870 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08058904
	.align 2, 0
_08058870: .4byte gCurTask
_08058874:
	adds r6, #0x5e
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2d
	bne _080588B8
	mov r1, sp
	movs r2, #0
	movs r0, #3
	strh r0, [r1]
	movs r0, #0xfb
	lsls r0, r0, #1
	strh r0, [r1, #2]
	mov r0, sp
	strb r2, [r0, #4]
	adds r0, r4, #1
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	movs r0, #0xff
	strh r0, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #8]
	mov r0, sp
	bl CreateProjectile
_080588B8:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	cmp r0, #0
	bne _080588EE
	movs r0, #0x78
	strb r0, [r6]
	movs r1, #0
	ldr r0, _08058914 @ =0x000001F5
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08058918 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805891C @ =sub_80585DC
	str r0, [r1, #8]
_080588EE:
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	eors r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_08058904:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058914: .4byte 0x000001F5
_08058918: .4byte gCurTask
_0805891C: .4byte sub_80585DC
