.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZoneFinalActTA53
StageBgUpdateZoneFinalActTA53: @ 0x0801E360
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r0, _0801E3CC @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _0801E37A
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	movs r1, #1
	ands r1, r0
_0801E37A:
	cmp r1, #0
	beq _0801E3C4
	ldr r2, _0801E3D0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801E3D4 @ =gUnknown_03002878
	ldr r0, _0801E3D8 @ =0x04000014
	str r0, [r1]
	ldr r1, _0801E3DC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801E3E0 @ =gUnknown_03001884
	ldr r3, [r0]
	movs r2, #0
	ldr r6, _0801E3E4 @ =gSineTable
	ldr r5, _0801E3E8 @ =gUnknown_03005590
	ldr r4, _0801E3EC @ =0x000003FF
_0801E3A0:
	ldr r1, [r5]
	adds r1, r2, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9e
	bls _0801E3A0
_0801E3C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E3CC: .4byte gActiveBossTask
_0801E3D0: .4byte gFlags
_0801E3D4: .4byte gUnknown_03002878
_0801E3D8: .4byte 0x04000014
_0801E3DC: .4byte gUnknown_03002A80
_0801E3E0: .4byte gUnknown_03001884
_0801E3E4: .4byte gSineTable
_0801E3E8: .4byte gUnknown_03005590
_0801E3EC: .4byte 0x000003FF
