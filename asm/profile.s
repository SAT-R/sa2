.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
