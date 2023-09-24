.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_8011660
Task_8011660: @ 0x08011660
	push {r4, r5, r6, r7, lr}
	ldr r6, _08011688 @ =gWater
	ldr r7, _0801168C @ =gCamera
	ldr r0, _08011690 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080116A0
	ldr r0, _08011694 @ =gPlayer
	ldr r0, [r0, #8]
	asrs r1, r0, #8
	ldr r0, _08011698 @ =0x00001A09
	cmp r1, r0
	ble _080116A0
	ldr r0, _0801169C @ =0x0000299A
	cmp r1, r0
	bgt _080116A0
	movs r0, #1
	b _080116A2
	.align 2, 0
_08011688: .4byte gWater
_0801168C: .4byte gCamera
_08011690: .4byte gCurrentLevel
_08011694: .4byte gPlayer
_08011698: .4byte 0x00001A09
_0801169C: .4byte 0x0000299A
_080116A0:
	movs r0, #0
_080116A2:
	strb r0, [r6]
	ldrb r2, [r6]
	cmp r2, #1
	beq _080116BC
	ldr r0, _080116B8 @ =gFlags
	ldr r1, [r0]
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _080117DC
	.align 2, 0
_080116B8: .4byte gFlags
_080116BC:
	ldr r1, _080116E0 @ =gStageTime
	ldr r0, [r1]
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _080116EC
	ldrh r0, [r6, #4]
	movs r1, #4
	ldrsh r2, [r6, r1]
	movs r3, #6
	ldrsh r1, [r6, r3]
	cmp r2, r1
	beq _080116EC
	cmp r2, r1
	bge _080116E4
	adds r0, #1
	b _080116EA
	.align 2, 0
_080116E0: .4byte gStageTime
_080116E4:
	cmp r2, r1
	ble _080116EC
	subs r0, #1
_080116EA:
	strh r0, [r6, #4]
_080116EC:
	movs r0, #4
	ldrsh r2, [r6, r0]
	ldr r1, [r7, #4]
	cmp r2, r1
	bgt _080116FA
	movs r0, #0
	b _0801170A
_080116FA:
	adds r0, r1, #0
	adds r0, #0xa0
	cmp r2, r0
	bge _08011708
	ldrb r0, [r6, #4]
	subs r0, r0, r1
	b _0801170A
_08011708:
	movs r0, #0xff
_0801170A:
	strb r0, [r6, #2]
	ldr r3, _080117AC @ =gUnknown_03001870
	ldr r2, _080117B0 @ =gUnknown_03004D50
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _080117B4 @ =sub_8011A4C
	str r1, [r0]
	ldr r2, _080117B8 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6, #1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x9e
	bhi _0801178C
	adds r4, r6, #0
	adds r4, #0x14
	ldr r1, [r7]
	ldr r0, [r5]
	adds r0, #1
	lsrs r0, r0, #2
	adds r1, r1, r0
	movs r0, #0xf
	ands r1, r0
	rsbs r1, r1, #0
	strh r1, [r4, #0x16]
	ldrb r0, [r6, #2]
	adds r0, #1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	ldr r0, [r5]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801178C
	ldrh r0, [r4, #0x18]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _0801178C
	movs r5, #0x10
_0801177A:
	adds r0, r4, #0
	bl DisplaySprite
	ldrh r0, [r4, #0x16]
	adds r0, #0x10
	strh r0, [r4, #0x16]
	subs r5, #1
	cmp r5, #0
	bge _0801177A
_0801178C:
	ldrb r0, [r6, #2]
	subs r2, r0, #1
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x9e
	bhi _080117C8
	ldr r1, _080117BC @ =gIntrTable
	ldr r0, _080117C0 @ =sub_8011ACC
	str r0, [r1, #0xc]
	ldr r0, _080117C4 @ =gUnknown_03002874
	strb r2, [r0]
	ldr r2, _080117B8 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	b _080117DA
	.align 2, 0
_080117AC: .4byte gUnknown_03001870
_080117B0: .4byte gUnknown_03004D50
_080117B4: .4byte sub_8011A4C
_080117B8: .4byte gFlags
_080117BC: .4byte gIntrTable
_080117C0: .4byte sub_8011ACC
_080117C4: .4byte gUnknown_03002874
_080117C8:
	ldr r1, _080117E4 @ =gIntrTable
	ldr r0, _080117E8 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	ldr r2, _080117EC @ =gFlags
	ldr r0, [r2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
_080117DA:
	str r0, [r2]
_080117DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080117E4: .4byte gIntrTable
_080117E8: .4byte gIntrTableTemplate
_080117EC: .4byte gFlags

@; new thing

	thumb_func_start sub_80117F0
sub_80117F0: @ 0x080117F0
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08011850 @ =sub_8011870
	ldr r2, _08011854 @ =0x00004001
	ldr r1, _08011858 @ =sub_8011B3C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	ldr r0, _0801185C @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0xc
	bl VramMalloc
	str r0, [r5, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r5, #8]
	movs r0, #0x88
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r1, _08011860 @ =IWRAM_START + 0x3C
	adds r0, r4, r1
	strb r3, [r0]
	ldr r0, _08011864 @ =IWRAM_START + 0x3D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0xc1
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x1c]
	ldr r0, _08011868 @ =IWRAM_START + 0x3E
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801186C @ =IWRAM_START + 0x41
	adds r4, r4, r1
	strb r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011850: .4byte sub_8011870
_08011854: .4byte 0x00004001
_08011858: .4byte sub_8011B3C
_0801185C: .4byte IWRAM_START + 0x1C
_08011860: .4byte IWRAM_START + 0x3C
_08011864: .4byte IWRAM_START + 0x3D
_08011868: .4byte IWRAM_START + 0x3E
_0801186C: .4byte IWRAM_START + 0x41

	thumb_func_start sub_8011870
sub_8011870: @ 0x08011870
	push {r4, r5, lr}
	ldr r0, _08011898 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x1c
	adds r4, r1, r0
	ldr r5, _0801189C @ =gPlayer
	ldr r0, [r5, #0x20]
	ldr r1, _080118A0 @ =0x00020080
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _080118A4
	adds r0, r2, #0
	bl TaskDestroy
	b _080118F6
	.align 2, 0
_08011898: .4byte gCurTask
_0801189C: .4byte gPlayer
_080118A0: .4byte 0x00020080
_080118A4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	str r1, [r3]
	ldr r0, _080118D4 @ =gWater
	movs r2, #4
	ldrsh r0, [r0, r2]
	str r0, [r3, #4]
	ldr r2, _080118D8 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080118E0
	ldr r0, [r4, #0x10]
	ldr r1, _080118DC @ =0xFFFFFBFF
	ands r0, r1
	b _080118E8
	.align 2, 0
_080118D4: .4byte gWater
_080118D8: .4byte gCamera
_080118DC: .4byte 0xFFFFFBFF
_080118E0:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080118E8:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_080118F6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80118FC
sub_80118FC: @ 0x080118FC
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801194C @ =Task_801F214
	str r2, [sp]
	ldr r2, _08011950 @ =TaskDestructor_801F550
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0
	bl sub_801F15C
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	ldr r0, _08011954 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0xc
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _08011958 @ =0x00000229
	strh r0, [r5, #0xa]
	ldr r0, _0801195C @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801194C: .4byte Task_801F214
_08011950: .4byte TaskDestructor_801F550
_08011954: .4byte IWRAM_START + 0x1C
_08011958: .4byte 0x00000229
_0801195C: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8011960
sub_8011960: @ 0x08011960
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	asrs r7, r3, #4
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	beq _08011A12
	ldr r6, _08011A18 @ =0x7BDE7BDE
	ldr r3, _08011A1C @ =0x739C739C
	adds r2, r3, #0
	ands r2, r1
_0801197A:
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	bne _0801197A
_08011A12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011A18: .4byte 0x7BDE7BDE
_08011A1C: .4byte 0x739C739C

	thumb_func_start TaskDestructor_8011A20
TaskDestructor_8011A20: @ 0x08011A20
	ldr r3, _08011A3C @ =gWater
	ldr r2, _08011A40 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _08011A44 @ =gIntrTable
	ldr r0, _08011A48 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	movs r0, #0
	str r0, [r3, #0x10]
	bx lr
	.align 2, 0
_08011A3C: .4byte gWater
_08011A40: .4byte gFlags
_08011A44: .4byte gIntrTable
_08011A48: .4byte gIntrTableTemplate

	thumb_func_start sub_8011A4C
sub_8011A4C: @ 0x08011A4C
	push {r4, r5, lr}
	ldr r3, _08011AAC @ =gWater
	ldr r0, [r3, #0x10]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldrb r2, [r3, #2]
	strb r2, [r3, #1]
	ldr r0, [r3, #8]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #8]
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _08011AA4
	ldr r0, _08011AB0 @ =0x040000D4
	ldr r2, _08011AB4 @ =IWRAM_START + 0x200
	adds r1, r4, r2
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08011AB8 @ =0x84000074
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [r0]
	ldr r1, _08011ABC @ =0x05000200
	str r1, [r0, #4]
	ldr r1, _08011AC0 @ =0x84000080
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08011AC4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08011AC8 @ =gFlags
	ldr r0, [r2]
	movs r1, #3
	orrs r0, r1
	str r0, [r2]
_08011AA4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011AAC: .4byte gWater
_08011AB0: .4byte 0x040000D4
_08011AB4: .4byte IWRAM_START + 0x200
_08011AB8: .4byte 0x84000074
_08011ABC: .4byte 0x05000200
_08011AC0: .4byte 0x84000080
_08011AC4: .4byte 0x0000FEFF
_08011AC8: .4byte gFlags

	thumb_func_start sub_8011ACC
sub_8011ACC: @ 0x08011ACC
	ldr r0, _08011B18 @ =gWater
	ldr r0, [r0, #0x10]
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r1, r2
	ldr r0, _08011B1C @ =0x040000D4
	ldr r3, _08011B20 @ =IWRAM_START + 0x200
	adds r1, r1, r3
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08011B24 @ =0x84000074
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [r0]
	ldr r1, _08011B28 @ =0x05000200
	str r1, [r0, #4]
	ldr r1, _08011B2C @ =0x84000080
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08011B30 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08011B34 @ =gFlags
	ldr r0, [r2]
	movs r1, #3
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08011B38 @ =0x04000202
	movs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_08011B18: .4byte gWater
_08011B1C: .4byte 0x040000D4
_08011B20: .4byte IWRAM_START + 0x200
_08011B24: .4byte 0x84000074
_08011B28: .4byte 0x05000200
_08011B2C: .4byte 0x84000080
_08011B30: .4byte 0x0000FEFF
_08011B34: .4byte gFlags
_08011B38: .4byte 0x04000202

	thumb_func_start sub_8011B3C
sub_8011B3C: @ 0x08011B3C
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08011B50 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_08011B50: .4byte IWRAM_START + 0x1C

.if 01
@; last func
	thumb_func_start sub_8011B54
sub_8011B54: @ 0x08011B54
	push {lr}
	adds r3, r0, #0
	asrs r2, r2, #4
	b _08011B7C
_08011B5C:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
_08011B7C:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _08011B5C
	pop {r0}
	bx r0
.endif
