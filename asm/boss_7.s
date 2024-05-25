.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.align 2, 0

 	.global gUnknown_080D8108
gUnknown_080D8108:
    .incbin "baserom.gba", 0x000D8108, 0x40

    .global gUnknown_080D8148
gUnknown_080D8148:
    .incbin "baserom.gba", 0x000D8148, 0x2

    .global gUnknown_080D814A
gUnknown_080D814A:
    .incbin "baserom.gba", 0x000D814A, 0x452

    .global gUnknown_080D859C
gUnknown_080D859C:
    .incbin "baserom.gba", 0x000D859C, 0x138

    .global gUnknown_080D86D4
gUnknown_080D86D4:
    .incbin "baserom.gba", 0x000D86D4, 0x3C

    .global gUnknown_080D8710
gUnknown_080D8710:
    .incbin "baserom.gba", 0x000D8710, 0x3C

    .global gUnknown_080D874C
gUnknown_080D874C:
    .incbin "baserom.gba", 0x000D874C, 0x3C

    .global gUnknown_080D8788
gUnknown_080D8788:
    .incbin "baserom.gba", 0x000D8788, 0xE

    .global gUnknown_080D8796
gUnknown_080D8796:
    .incbin "baserom.gba", 0x000D8796, 0x42

    .global gUnknown_080D87D8
gUnknown_080D87D8:
    .incbin "baserom.gba", 0x000D87D8, 0xE

    .global gUnknown_080D87E6
gUnknown_080D87E6:
    .incbin "baserom.gba", 0x000D87E6, 0x22

    .global gUnknown_080D8808
gUnknown_080D8808:
    .incbin "baserom.gba", 0x000D8808, 0x38

    .global gUnknown_080D8840
gUnknown_080D8840:
    .incbin "baserom.gba", 0x000D8840, 0x18

    .global gUnknown_080D8858
gUnknown_080D8858:
    .incbin "baserom.gba", 0x000D8858, 0xC

    .global gUnknown_080D8864
gUnknown_080D8864:
    .incbin "baserom.gba", 0x000D8864, 0x10

    .global gUnknown_080D8874
gUnknown_080D8874:
    .incbin "baserom.gba", 0x000D8874, 0x14

.text
.syntax unified
.arm

	thumb_func_start Task_80497E0
Task_80497E0: @ 0x080497E0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08049814 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r2, _08049818 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	adds r7, r2, #0
	cmp r1, #0
	beq _0804981C
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08049838
	.align 2, 0
_08049814: .4byte gCurTask
_08049818: .4byte gPlayer
_0804981C:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, _08049854 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08049838:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r6, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049858
	ldr r0, [r3]
	bl TaskDestroy
	b _080498BC
	.align 2, 0
_08049854: .4byte gCamera
_08049858:
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _080498B0
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _080498C4 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r7, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r3, r0, #0
	cmp r3, #1
	bne _080498B0
	ldr r2, [r4, #0x10]
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	bne _080498B0
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #0x1e
	strb r0, [r2, #0x15]
	ldr r0, _080498C8 @ =0x000002B6
	strh r0, [r1, #0xa]
	adds r0, r2, #0
	adds r0, #0x88
	strb r3, [r0]
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
_080498B0:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080498BC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080498C4: .4byte gCamera
_080498C8: .4byte 0x000002B6

	thumb_func_start sub_80498CC
sub_80498CC: @ 0x080498CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080499B4 @ =sub_80499D8
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _080499B8 @ =sub_8049D1C
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r0, #0
	strb r4, [r6, #4]
	strb r0, [r6, #5]
	strb r0, [r6, #6]
	ldr r1, _080499BC @ =gUnknown_080D5964
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6]
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r3, r1, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6, #2]
	ldr r2, _080499C0 @ =gUnknown_03005440
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, _080499C4 @ =gUnknown_030054BC
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r4, #0
	beq _080499AC
	bl Player_DisableInputAndBossTimer
	ldr r3, _080499C8 @ =gPlayer
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	ldr r1, _080499CC @ =gUnknown_080D87E6
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r2, [r3, #8]
	asrs r0, r2, #8
	subs r5, r5, r0
	lsls r0, r4, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r3, #0xc]
	asrs r0, r1, #8
	subs r4, r4, r0
	lsls r7, r5, #8
	adds r2, r2, r7
	str r2, [r3, #8]
	lsls r2, r4, #8
	adds r1, r1, r2
	str r1, [r3, #0xc]
	ldr r1, _080499D0 @ =gCamera
	ldr r0, [r1]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	subs r0, #0x78
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	subs r0, #0x78
	adds r0, r0, r4
	str r0, [r1, #0x14]
	ldr r0, _080499D4 @ =gCheese
	ldr r1, [r0]
	cmp r1, #0
	beq _080499A6
	ldr r0, [r1]
	adds r0, r0, r7
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
_080499A6:
	ldrb r0, [r6, #4]
	subs r0, #1
	strb r0, [r6, #4]
_080499AC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080499B4: .4byte sub_80499D8
_080499B8: .4byte sub_8049D1C
_080499BC: .4byte gUnknown_080D5964
_080499C0: .4byte gUnknown_03005440
_080499C4: .4byte gUnknown_030054BC
_080499C8: .4byte gPlayer
_080499CC: .4byte gUnknown_080D87E6
_080499D0: .4byte gCamera
_080499D4: .4byte gCheese

	thumb_func_start sub_80499D8
sub_80499D8: @ 0x080499D8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08049A64 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldrb r0, [r7, #4]
	cmp r0, #6
	bls _080499EE
	b _08049C4C
_080499EE:
	cmp r0, #6
	beq _080499F4
	b _08049BAC
_080499F4:
	ldr r1, _08049A68 @ =gUnknown_03005440
	ldr r2, _08049A6C @ =gUnknown_080D5964
	ldrh r0, [r2, #0x1c]
	strh r0, [r1]
	ldr r1, _08049A70 @ =gUnknown_030054BC
	ldrh r0, [r2, #0x1e]
	strh r0, [r1]
	ldr r1, _08049A74 @ =gPlayer
	ldr r2, [r1, #8]
	ldr r0, _08049A78 @ =0x00A7CFFF
	adds r3, r1, #0
	cmp r2, r0
	bgt _08049A96
	ldr r0, _08049A7C @ =gUnknown_080D8808
	ldr r0, [r0, #0x30]
	adds r0, #0x1e
	lsls r0, r0, #8
	cmp r2, r0
	ble _08049A96
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r3, #0x20]
	movs r2, #0
	movs r1, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x5e
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #0x38
	strb r2, [r0]
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	subs r0, #0x78
	ldr r1, _08049A80 @ =gCamera
	ldr r2, [r1]
	cmp r0, r2
	bne _08049A4C
	b _08049C4C
_08049A4C:
	cmp r0, r2
	ble _08049A84
	ldr r0, [r1, #0x20]
	adds r0, #1
	str r0, [r1, #0x20]
	adds r0, r2, #1
	str r0, [r1]
	ldr r0, [r1, #0x10]
	adds r0, #1
	str r0, [r1, #0x10]
	b _08049C4C
	.align 2, 0
_08049A64: .4byte gCurTask
_08049A68: .4byte gUnknown_03005440
_08049A6C: .4byte gUnknown_080D5964
_08049A70: .4byte gUnknown_030054BC
_08049A74: .4byte gPlayer
_08049A78: .4byte 0x00A7CFFF
_08049A7C: .4byte gUnknown_080D8808
_08049A80: .4byte gCamera
_08049A84:
	ldr r0, [r1, #0x20]
	subs r0, #1
	str r0, [r1, #0x20]
	subs r0, r2, #1
	str r0, [r1]
	ldr r0, [r1, #0x10]
	subs r0, #1
	str r0, [r1, #0x10]
	b _08049C4C
_08049A96:
	ldr r1, [r3, #8]
	ldr r0, _08049ADC @ =0x00A6CBFF
	cmp r1, r0
	bgt _08049AF4
	ldr r0, _08049AE0 @ =gUnknown_080D8808
	ldr r0, [r0, #0x30]
	adds r0, #0x14
	lsls r0, r0, #8
	cmp r1, r0
	ble _08049AF4
	ldr r0, _08049AE4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08049AB4
	b _08049C4C
_08049AB4:
	ldr r4, _08049AE8 @ =gStageFlags
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049AC4
	b _08049C4C
_08049AC4:
	ldr r0, _08049AEC @ =gCourseTime
	ldr r0, [r0]
	str r0, [r3, #0x78]
	movs r0, #7
	bl CreateZoneBoss
	ldrh r1, [r4]
	ldr r0, _08049AF0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r4]
	b _08049C4C
	.align 2, 0
_08049ADC: .4byte 0x00A6CBFF
_08049AE0: .4byte gUnknown_080D8808
_08049AE4: .4byte gActiveBossTask
_08049AE8: .4byte gStageFlags
_08049AEC: .4byte gCourseTime
_08049AF0: .4byte 0x0000FFFD
_08049AF4:
	adds r2, r3, #0
	ldr r5, [r2, #8]
	ldr r0, _08049B1C @ =0x00A7D000
	cmp r5, r0
	ble _08049B24
	ldr r0, [r2, #0x20]
	ldr r1, _08049B20 @ =0xF7FFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x6d
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r7, #4]
	adds r0, #1
	strb r0, [r7, #4]
	strb r1, [r7, #6]
	b _08049C4C
	.align 2, 0
_08049B1C: .4byte 0x00A7D000
_08049B20: .4byte 0xF7FFFFFF
_08049B24:
	ldr r0, _08049B90 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08049B2E
	b _08049C4C
_08049B2E:
	ldr r0, _08049B94 @ =0x00A53BFF
	cmp r5, r0
	ble _08049B36
	b _08049C4C
_08049B36:
	ldr r4, _08049B98 @ =gUnknown_080D8808
	ldrb r0, [r7, #4]
	lsls r2, r0, #3
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	bge _08049B46
	b _08049C4C
_08049B46:
	lsls r0, r1, #8
	cmp r5, r0
	bge _08049B4E
	b _08049C4C
_08049B4E:
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r4, [r0]
	lsls r6, r4, #8
	adds r0, r5, r6
	str r0, [r3, #8]
	ldr r0, _08049B9C @ =gUnknown_030054FC
	str r6, [r0]
	ldrb r1, [r7, #4]
	adds r0, r6, #0
	bl sub_8039F50
	ldr r1, _08049BA0 @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08049BA4 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r4
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r4
	str r0, [r1, #0x10]
	ldr r0, _08049BA8 @ =gCheese
	ldr r1, [r0]
	cmp r1, #0
	beq _08049C4C
	ldr r0, [r1]
	adds r0, r0, r6
	b _08049C4A
	.align 2, 0
_08049B90: .4byte gActiveBossTask
_08049B94: .4byte 0x00A53BFF
_08049B98: .4byte gUnknown_080D8808
_08049B9C: .4byte gUnknown_030054FC
_08049BA0: .4byte gBossRingsShallRespawn
_08049BA4: .4byte gCamera
_08049BA8: .4byte gCheese
_08049BAC:
	cmp r0, #5
	bhi _08049C4C
	ldr r6, _08049C84 @ =gCamera
	ldr r0, _08049C88 @ =gUnknown_080D87D8
	ldrb r1, [r7, #4]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x10]
	ldrh r1, [r1]
	cmp r0, r1
	ble _08049BEE
	ldr r1, _08049C8C @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08049C90 @ =gBossRingsRespawnCount
	movs r0, #0xa @ BOSS_RINGS_DEFAULT_RESPAWN_COUNT
	strb r0, [r1]
	ldr r1, _08049C94 @ =gPlayer
	ldr r0, _08049C98 @ =gCourseTime
	ldr r0, [r0]
	str r0, [r1, #0x78]
	ldrb r0, [r7, #4]
	adds r0, #1
	strb r0, [r7, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CreateZoneBoss
	ldr r2, _08049C9C @ =gStageFlags
	ldrh r1, [r2]
	ldr r0, _08049CA0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
_08049BEE:
	ldr r4, _08049CA4 @ =gUnknown_080D8808
	ldrb r0, [r7, #4]
	lsls r2, r0, #3
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	blt _08049C4C
	ldr r0, _08049CA8 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08049C4C
	ldr r3, _08049C94 @ =gPlayer
	lsls r0, r1, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	blt _08049C4C
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r4, [r0]
	lsls r5, r4, #8
	adds r0, r1, r5
	str r0, [r3, #8]
	ldr r0, _08049CAC @ =gUnknown_030054FC
	str r5, [r0]
	ldrb r1, [r7, #4]
	adds r0, r5, #0
	bl sub_8039F50
	ldr r1, _08049C8C @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	ldr r0, [r6, #0x20]
	adds r0, r0, r4
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x10]
	adds r0, r0, r4
	str r0, [r6, #0x10]
	ldr r0, _08049CB0 @ =gCheese
	ldr r1, [r0]
	cmp r1, #0
	beq _08049C4C
	ldr r0, [r1]
	adds r0, r0, r5
_08049C4A:
	str r0, [r1]
_08049C4C:
	ldrb r0, [r7, #5]
	cmp r0, #6
	bhi _08049CC0
	ldr r3, _08049C84 @ =gCamera
	ldr r1, _08049C88 @ =gUnknown_080D87D8
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08049CB4 @ =0xFFFFFDA8
	adds r0, r0, r1
	ldr r1, [r3, #0x10]
	cmp r1, r0
	ble _08049CC0
	cmp r2, #6
	bne _08049CBC
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _08049C7C
	movs r0, #1
	str r0, [r3, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #3
	str r0, [r3, #8]
_08049C7C:
	ldr r1, _08049CB8 @ =gUnknown_030054B0
	movs r0, #1
	strb r0, [r1]
	b _08049CC0
	.align 2, 0
_08049C84: .4byte gCamera
_08049C88: .4byte gUnknown_080D87D8
_08049C8C: .4byte gBossRingsShallRespawn
_08049C90: .4byte gBossRingsRespawnCount
_08049C94: .4byte gPlayer
_08049C98: .4byte gCourseTime
_08049C9C: .4byte gStageFlags
_08049CA0: .4byte 0x0000FFFD
_08049CA4: .4byte gUnknown_080D8808
_08049CA8: .4byte gActiveBossTask
_08049CAC: .4byte gUnknown_030054FC
_08049CB0: .4byte gCheese
_08049CB4: .4byte 0xFFFFFDA8
_08049CB8: .4byte gUnknown_030054B0
_08049CBC:
	adds r0, r2, #1
	strb r0, [r7, #5]
_08049CC0:
	ldr r0, _08049CDC @ =gUnknown_080D5964
	ldrb r2, [r7, #5]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrh r3, [r7]
	adds r5, r3, #0
	ldrh r4, [r1]
	adds r6, r0, #0
	cmp r5, r4
	beq _08049CE4
	cmp r5, r4
	bhs _08049CE0
	adds r0, r3, #1
	b _08049CE2
	.align 2, 0
_08049CDC: .4byte gUnknown_080D5964
_08049CE0:
	subs r0, r3, #1
_08049CE2:
	strh r0, [r7]
_08049CE4:
	lsls r1, r2, #2
	adds r0, r6, #2
	adds r1, r1, r0
	ldrh r2, [r7, #2]
	adds r3, r2, #0
	ldrh r0, [r1]
	cmp r3, r0
	beq _08049D00
	cmp r3, r0
	bhs _08049CFC
	adds r0, r2, #1
	b _08049CFE
_08049CFC:
	subs r0, r2, #1
_08049CFE:
	strh r0, [r7, #2]
_08049D00:
	ldr r1, _08049D14 @ =gUnknown_03005440
	ldrh r0, [r7]
	strh r0, [r1]
	ldr r1, _08049D18 @ =gUnknown_030054BC
	ldrh r0, [r7, #2]
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049D14: .4byte gUnknown_03005440
_08049D18: .4byte gUnknown_030054BC

	thumb_func_start sub_8049D1C
sub_8049D1C: @ 0x08049D1C
	bx lr
	.align 2, 0

	thumb_func_start sub_8049D20
sub_8049D20: @ 0x08049D20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08049E74 @ =sub_8049E90
	movs r1, #0xb2
	lsls r1, r1, #1
	movs r2, #0x81
	lsls r2, r2, #7
	ldr r3, _08049E78 @ =sub_804A6B4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r2, _08049E7C @ =IWRAM_START + 0x15D
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _08049E80 @ =IWRAM_START + 0x120
	adds r1, r0, r3
	str r4, [r1]
	adds r3, #0x40
	adds r1, r0, r3
	str r5, [r1]
	subs r3, #2
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _08049E84 @ =IWRAM_START + 0x15F
	adds r0, r0, r1
	strb r2, [r0]
	movs r0, #0x2f
	bl VramMalloc
	str r0, [sp, #4]
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r5, #0
	ldr r3, _08049E88 @ =gUnknown_080D8840
	mov sb, r3
	movs r0, #4
	add r0, sb
	mov sl, r0
	movs r6, #0
_08049D8A:
	lsls r2, r5, #3
	movs r3, #0x92
	lsls r3, r3, #1
	adds r1, r7, r3
	adds r1, r1, r2
	mov r3, sb
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r7, r0
	adds r1, r1, r2
	mov r3, sl
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r2
	str r6, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r2
	str r6, [r0]
	lsls r3, r5, #1
	movs r0, #0xaa
	lsls r0, r0, #1
	adds r2, r7, r0
	adds r2, r2, r3
	adds r0, r5, #2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r2]
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r5
	strb r6, [r0]
	movs r4, #0
	adds r2, r5, #1
	mov r8, r2
	adds r3, r3, r5
	lsls r3, r3, #5
	adds r5, r7, r3
_08049DF2:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r2, r5, r0
	movs r0, #0x50
	strh r0, [r2, #0x16]
	strh r0, [r2, #0x18]
	lsls r0, r4, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _08049E8C @ =gUnknown_080D8864
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r6, [r2, #8]
	strh r6, [r2, #0x14]
	strh r6, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08049DF2
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08049D8A
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049E74: .4byte sub_8049E90
_08049E78: .4byte sub_804A6B4
_08049E7C: .4byte IWRAM_START + 0x15D
_08049E80: .4byte IWRAM_START + 0x120
_08049E84: .4byte IWRAM_START + 0x15F
_08049E88: .4byte gUnknown_080D8840
_08049E8C: .4byte gUnknown_080D8864

	thumb_func_start sub_8049E90
sub_8049E90: @ 0x08049E90
	push {r4, r5, r6, lr}
	ldr r0, _08049EB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _08049EB4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08049EB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08049F08
	.align 2, 0
_08049EB0: .4byte gCurTask
_08049EB4: .4byte gActiveBossTask
_08049EB8:
	movs r4, #0
	ldr r6, _08049F10 @ =gUnknown_080D8874
_08049EBC:
	movs r1, #0xad
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08049EBC
	ldr r1, _08049F14 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	cmp r0, #0x84
	bgt _08049EEE
	adds r0, r1, #0
	bl sub_800CBA4
_08049EEE:
	ldr r2, _08049F18 @ =0x0000015F
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08049F08
	adds r2, #1
	adds r0, r5, r2
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08049F08
	movs r0, #1
	strb r0, [r1]
_08049F08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049F10: .4byte gUnknown_080D8874
_08049F14: .4byte gPlayer
_08049F18: .4byte 0x0000015F

	thumb_func_start sub_8049F1C
sub_8049F1C: @ 0x08049F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r0, r8
	lsls r0, r0, #1
	str r0, [sp]
	add r0, r8
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov sl, r0
	mov r1, r8
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	mov sb, r0
	ldr r6, _0804A060 @ =0x0000015F
	add r6, ip
	ldrb r0, [r6]
	cmp r0, #0
	bne _08049F62
	str r0, [r2]
_08049F62:
	ldr r2, [r2]
	add sb, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r4, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r5, r0, #8
	ldr r1, _0804A064 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r6]
	cmp r0, #0
	bne _08049FD6
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r6, r0, r1
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08049FD6
	ldr r3, _0804A068 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r6]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_08049FD6:
	ldr r0, _0804A06C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0804A008
	ldr r0, [r6, #0x3c]
	cmp r0, r7
	bne _0804A008
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	add r0, sb
	str r0, [r6, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A008
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
_0804A008:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A036
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A036
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
_0804A036:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r1, sl
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, sl
	bl DisplaySprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A060: .4byte 0x0000015F
_0804A064: .4byte gCamera
_0804A068: .4byte gUnknown_080D8858
_0804A06C: .4byte gPlayer

	thumb_func_start sub_804A070
sub_804A070: @ 0x0804A070
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #5
	adds r6, r5, r0
	movs r0, #0x30
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _0804A1A8 @ =0x0000015F
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A0A8
	lsls r0, r7, #3
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	adds r1, r1, r0
	ldr r0, _0804A1AC @ =0xFFFFF800
	str r0, [r1]
_0804A0A8:
	lsls r2, r7, #3
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov ip, r1
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov sl, r0
	mov r0, ip
	ldr r0, [r0]
	mov sb, r0
	mov r1, sl
	ldr r0, [r1]
	add r0, sb
	asrs r0, r0, #8
	mov ip, r0
	mov r3, ip
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r1, r1, r2
	mov sb, r1
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r0, r2
	mov r2, sb
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r2, r1, #8
	adds r4, r2, #0
	ldr r1, _0804A1B0 @ =gCamera
	ldr r0, [r1]
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	subs r0, r4, r0
	strh r0, [r6, #0x18]
	ldr r4, _0804A1B4 @ =gPlayer
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0804A136
	str r4, [sp]
	str r1, [sp, #4]
	adds r0, r6, #0
	mov r1, ip
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	beq _0804A136
	ldr r0, [r4, #0xc]
	ldr r1, _0804A1AC @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldr r0, _0804A1B8 @ =0x0000FC80
	strh r0, [r4, #0x12]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r1, #9
	movs r0, #6
	strb r0, [r1]
_0804A136:
	ldr r2, _0804A1A8 @ =0x0000015F
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A17E
	movs r0, #0x84
	lsls r0, r0, #1
	bl m4aSongNumStart
	lsls r1, r7, #1
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A17E
	ldr r3, _0804A1BC @ =gUnknown_080D8858
	movs r0, #0xad
	lsls r0, r0, #1
	adds r2, r5, r0
	adds r2, r2, r7
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A17E:
	adds r0, r6, #0
	bl DisplaySprite
	ldrh r0, [r6, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1A8: .4byte 0x0000015F
_0804A1AC: .4byte 0xFFFFF800
_0804A1B0: .4byte gCamera
_0804A1B4: .4byte gPlayer
_0804A1B8: .4byte 0x0000FC80
_0804A1BC: .4byte gUnknown_080D8858

	thumb_func_start sub_804A1C0
sub_804A1C0: @ 0x0804A1C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #5
	add r0, r8
	mov sb, r0
	adds r0, #0x30
	str r0, [sp, #0x20]
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	rsbs r0, r0, #0
	str r0, [sp, #0x24]
	ldr r7, _0804A378 @ =0x0000015F
	add r7, r8
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A200
	ldr r0, _0804A37C @ =0xFFFFF800
	str r0, [r2]
_0804A200:
	ldr r2, [r2]
	ldr r1, [sp, #0x24]
	adds r1, r1, r2
	str r1, [sp, #0x24]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, r8
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A380 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	mov r2, sb
	strh r0, [r2, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r2, #0x18]
	ldrb r0, [r7]
	cmp r0, #0
	bne _0804A2EC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x3c
	beq _0804A258
	str r4, [sp, #0x28]
	cmp r0, #0x32
	bne _0804A2B6
_0804A258:
	movs r7, #0
	str r4, [sp, #0x28]
	adds r3, r6, #0
	subs r3, #0x10
	str r3, [sp, #0x2c]
	mov r4, sp
	movs r2, #0
_0804A266:
	lsls r0, r7, #6
	ldr r1, _0804A384 @ =gSineTable
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r0, r0, r5
	subs r0, #0x14
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r4, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	movs r0, #0x30
	strh r0, [r4, #0x1c]
	adds r0, #0xd0
	strh r0, [r4, #0xe]
	adds r0, #0x20
	add r0, r8
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _0804A388 @ =0x000002C3
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	str r2, [sp, #4]
	mov r0, sp
	ldr r1, _0804A38C @ =0x0000015D
	add r1, r8
	str r2, [sp, #0x30]
	bl CreateBossParticleStatic
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [sp, #0x30]
	cmp r7, #7
	bls _0804A266
_0804A2B6:
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, r8
	ldr r2, [sp, #0x28]
	adds r4, r0, r2
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A2EC
	ldr r3, _0804A390 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, r8
	add r2, sl
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A2EC:
	ldr r0, _0804A394 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A320
	ldr r0, [r4, #0x3c]
	cmp r0, sb
	bne _0804A320
	ldr r0, [r4, #0xc]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A320
	ldr r0, [r4, #8]
	adds r0, r0, r3
	str r0, [r4, #8]
_0804A320:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A34E
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A34E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A34E:
	mov r0, sb
	bl DisplaySprite
	mov r2, sb
	ldrh r0, [r2, #0x16]
	ldr r3, [sp, #0x20]
	strh r0, [r3, #0x16]
	ldrh r0, [r2, #0x18]
	adds r0, #0x40
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x20]
	bl DisplaySprite
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A378: .4byte 0x0000015F
_0804A37C: .4byte 0xFFFFF800
_0804A380: .4byte gCamera
_0804A384: .4byte gSineTable
_0804A388: .4byte 0x000002C3
_0804A38C: .4byte 0x0000015D
_0804A390: .4byte gUnknown_080D8858
_0804A394: .4byte gPlayer

	thumb_func_start sub_804A398
sub_804A398: @ 0x0804A398
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	mov sl, r0
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r4, #0x30
	adds r4, r4, r7
	mov r8, r4
	mov r0, sb
	lsls r3, r0, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	str r1, [sp, #0xc]
	rsbs r4, r1, #0
	str r4, [sp]
	ldr r0, _0804A528 @ =0x0000015F
	add r0, ip
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A406
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r4, _0804A52C @ =gSineTable
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #7
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	str r0, [r2]
_0804A406:
	ldr r2, [r2]
	ldr r4, [sp]
	adds r4, r4, r2
	str r4, [sp]
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A530 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804A480
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	mov r1, sl
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A480
	ldr r3, _0804A534 @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A480:
	ldr r0, _0804A538 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A4B8
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A4B8
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A4B8
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A4B8:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A4E6
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A4E6
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A4E6:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r4, r8
	strh r0, [r4, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	strh r0, [r4, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A528: .4byte 0x0000015F
_0804A52C: .4byte gSineTable
_0804A530: .4byte gCamera
_0804A534: .4byte gUnknown_080D8858
_0804A538: .4byte gPlayer

	thumb_func_start sub_804A53C
sub_804A53C: @ 0x0804A53C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #1
	str r0, [sp]
	add r0, sb
	lsls r0, r0, #5
	mov r1, ip
	adds r7, r1, r0
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	mov r1, sb
	lsls r3, r1, #3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	adds r2, r0, r3
	ldr r1, [r2]
	rsbs r0, r1, #0
	mov sl, r0
	ldr r4, _0804A6A4 @ =0x0000015F
	add r4, ip
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A588
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r2]
_0804A588:
	ldr r2, [r2]
	add sl, r2
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r1, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #8
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r2
	asrs r6, r0, #8
	ldr r1, _0804A6A8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804A5FC
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [sp]
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804A5FC
	ldr r3, _0804A6AC @ =gUnknown_080D8858
	movs r2, #0xad
	lsls r2, r2, #1
	add r2, ip
	add r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
_0804A5FC:
	ldr r0, _0804A6B0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #8
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0804A632
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _0804A632
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	add r0, sl
	str r0, [r4, #0xc]
	movs r0, #0xaf
	lsls r0, r0, #1
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804A632
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #8]
_0804A632:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0804A660
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0804A660
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0804A660:
	adds r0, r7, #0
	bl DisplaySprite
	ldrh r0, [r7, #0x16]
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r7, #0x18]
	adds r0, #0x40
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0x80
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	ldrh r0, [r7, #0x18]
	adds r0, #0xc0
	mov r1, r8
	strh r0, [r1, #0x18]
	mov r0, r8
	bl DisplaySprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A6A4: .4byte 0x0000015F
_0804A6A8: .4byte gCamera
_0804A6AC: .4byte gUnknown_080D8858
_0804A6B0: .4byte gPlayer

	thumb_func_start sub_804A6B4
sub_804A6B4: @ 0x0804A6B4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
