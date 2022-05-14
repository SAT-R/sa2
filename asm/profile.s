.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8063730
sub_8063730: @ 0x08063730
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #9
	bl m4aSongNumStart
	ldr r0, _080637C0 @ =sub_806A75C
	movs r1, #0xf1
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _080637C4 @ =sub_806A758
	str r3, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_8063B38
	ldr r1, _080637C8 @ =IWRAM_START + 0x358
	adds r0, r4, r1
	movs r2, #0
	strb r5, [r0]
	ldr r3, _080637CC @ =IWRAM_START + 0x360
	adds r0, r4, r3
	movs r1, #0
	strh r2, [r0]
	ldr r3, _080637D0 @ =gUnknown_03000781
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	subs r3, #3
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _080637D4 @ =gUnknown_03000782
	adds r4, r4, r0
	movs r0, #0xff
	strb r0, [r4]
	ldr r1, _080637D8 @ =gUnknown_03005B50
	ldr r0, _080637DC @ =0x06010000
	str r0, [r1]
	ldr r0, _080637E0 @ =gUnknown_03005B54
	str r2, [r0]
	movs r1, #0
	ldr r5, _080637E4 @ =gKeysFirstRepeatIntervals
	movs r4, #0x14
	ldr r3, _080637E8 @ =gKeysContinuedRepeatIntervals
	movs r2, #8
_0806379E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r5
	strb r4, [r1]
	adds r1, r0, r3
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _0806379E
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080637C0: .4byte sub_806A75C
_080637C4: .4byte sub_806A758
_080637C8: .4byte IWRAM_START + 0x358
_080637CC: .4byte IWRAM_START + 0x360
_080637D0: .4byte gUnknown_03000781
_080637D4: .4byte gUnknown_03000782
_080637D8: .4byte gUnknown_03005B50
_080637DC: .4byte 0x06010000
_080637E0: .4byte gUnknown_03005B54
_080637E4: .4byte gKeysFirstRepeatIntervals
_080637E8: .4byte gKeysContinuedRepeatIntervals

	thumb_func_start sub_80637EC
sub_80637EC: @ 0x080637EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _08063914 @ =sub_806B5A4
	ldr r1, _08063918 @ =0x00000714
	movs r2, #0x80
	lsls r2, r2, #6
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r6, #1
	ldr r1, _0806391C @ =gLoadedSaveGame
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	asrs r0, r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08063848
	adds r3, r1, #0
	movs r2, #1
_0806382C:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #4
	bgt _08063848
	ldr r0, [r3]
	ldrb r0, [r0, #0x13]
	asrs r0, r1
	ands r0, r2
	cmp r0, #0
	bne _0806382C
_08063848:
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r4, #0
	str r4, [r0]
	movs r0, #0x9e
	lsls r0, r0, #2
	bl EwramMalloc
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r5, r2
	str r0, [r1]
	ldr r1, _08063920 @ =0x00000704
	adds r0, r5, r1
	strb r7, [r0]
	ldr r2, _08063924 @ =0x00000705
	adds r0, r5, r2
	strb r4, [r0]
	adds r1, #2
	adds r0, r5, r1
	strb r4, [r0]
	adds r2, #2
	adds r0, r5, r2
	strb r4, [r0]
	adds r1, #2
	adds r0, r5, r1
	strb r4, [r0]
	adds r2, #2
	adds r0, r5, r2
	strb r6, [r0]
	movs r6, #0
	ldr r0, _08063928 @ =0x0000070A
	adds r3, r5, r0
	ldr r7, _0806391C @ =gLoadedSaveGame
	adds r4, r7, #0
_08063890:
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r1
	ldr r0, [r4]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _08063890
	ldr r0, [r7]
	ldrb r0, [r0, #6]
	subs r0, #1
	ldr r1, _0806392C @ =0x0000070F
	adds r2, r5, r1
	strb r0, [r2]
	adds r1, #1
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	ldr r0, _08063930 @ =0x00000711
	adds r1, r5, r0
	movs r0, #2
	strb r0, [r1]
	ldrb r0, [r2]
	cmp r0, #5
	bls _080638D2
	movs r0, #1
	strb r0, [r2]
_080638D2:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, [r7]
	adds r1, #0x34
	movs r2, #0x9e
	lsls r2, r2, #2
	bl memcpy
	ldr r1, _08063934 @ =gUnknown_03005B50
	ldr r0, _08063938 @ =0x06010000
	str r0, [r1]
	ldr r1, _0806393C @ =gUnknown_03005B54
	movs r0, #0
	str r0, [r1]
	bl sub_8068640
	adds r0, r5, #0
	bl sub_8068700
	adds r0, r5, #0
	bl sub_80687BC
	movs r0, #4
	bl m4aSongNumStart
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063914: .4byte sub_806B5A4
_08063918: .4byte 0x00000714
_0806391C: .4byte gLoadedSaveGame
_08063920: .4byte 0x00000704
_08063924: .4byte 0x00000705
_08063928: .4byte 0x0000070A
_0806392C: .4byte 0x0000070F
_08063930: .4byte 0x00000711
_08063934: .4byte gUnknown_03005B50
_08063938: .4byte 0x06010000
_0806393C: .4byte gUnknown_03005B54

	thumb_func_start sub_8063940_CreateProfileScreen
sub_8063940_CreateProfileScreen: @ 0x08063940
	push {r4, r5, r6, lr}
	sub sp, #4
	bl Random
	lsls r0, r0, #0x10
	eors r4, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r4, r0
	eors r6, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl SeedRng
	bl Random
	lsls r0, r0, #0x10
	eors r4, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r4, r0
	eors r5, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl SeedRng
	ldr r0, _080639E0 @ =sub_806B0D8
	movs r1, #0x81
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r3, #4
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _080639E4 @ =IWRAM_START + 0x1FC
	adds r0, r1, r2
	str r5, [r0]
	ldr r0, _080639E8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	ldr r3, _080639EC @ =IWRAM_START + 0x200
	adds r2, r1, r3
	strb r0, [r2]
	ldr r0, _080639F0 @ =IWRAM_START + 0x201
	adds r1, r1, r0
	movs r3, #1
	strb r3, [r1]
	ldrb r0, [r2]
	cmp r0, #5
	bls _080639BC
	strb r3, [r2]
_080639BC:
	ldr r0, _080639F4 @ =gUnknown_03005B50
	ldr r1, _080639F8 @ =0x06010000
	str r1, [r0]
	ldr r0, _080639FC @ =gUnknown_03005B54
	str r5, [r0]
	adds r0, r4, #0
	bl sub_80668A8
	adds r0, r4, #0
	bl sub_806B0AC
	adds r0, r4, #0
	bl sub_8066930
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080639E0: .4byte sub_806B0D8
_080639E4: .4byte IWRAM_START + 0x1FC
_080639E8: .4byte gLoadedSaveGame
_080639EC: .4byte IWRAM_START + 0x200
_080639F0: .4byte IWRAM_START + 0x201
_080639F4: .4byte gUnknown_03005B50
_080639F8: .4byte 0x06010000
_080639FC: .4byte gUnknown_03005B54
