.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

@; NOTE / FIXME(?): These are only used by player_super_sonic.
@;                  But that already includes .rodata, which is 
@                   away from gUnknown_080D650C & gUnknown_080D661C
    .global gUnknown_080D650C
gUnknown_080D650C:
    .incbin "baserom.gba", 0x000D650C, 0x110

    .global gUnknown_080D661C
gUnknown_080D661C:
    .incbin "baserom.gba", 0x000D661C, 0x110

.text
.syntax unified
.arm

	thumb_func_start StageInit_ZoneFinal_0
StageInit_ZoneFinal_0: @ 0x0801DF08
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r1, _0801DFE0 @ =gDispCnt
	ldr r2, _0801DFE4 @ =0x00001141
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0801DFE8 @ =gUnknown_03004D80
	movs r5, #0
	strb r5, [r0, #2]
	ldr r1, _0801DFEC @ =gUnknown_03002280
	strb r5, [r1, #8]
	strb r5, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	mov sb, r0
	mov r2, sb
	strb r2, [r1, #0xb]
	ldr r4, _0801DFF0 @ =gUnknown_03005850 + 0x80
	ldr r0, _0801DFF4 @ =gBgCntRegs
	mov r8, r0
	ldr r0, _0801DFF8 @ =0x00001A89
	mov r1, r8
	strh r0, [r1, #4]
	ldr r6, _0801DFFC @ =gUnknown_080D5864
	adds r1, r6, #0
	adds r1, #0x80
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	ldr r0, _0801E000 @ =0x00000177
	strh r0, [r4, #0x1c]
	ldr r0, _0801E004 @ =0x06008000
	str r0, [r4, #4]
	ldr r0, _0801E008 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0xa
	strh r0, [r4, #0x26]
	movs r0, #9
	strh r0, [r4, #0x28]
	ldrh r0, [r4, #0x2e]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	subs r4, #0x80
	ldr r0, _0801E00C @ =0x00001E07
	mov r2, r8
	strh r0, [r2]
	adds r6, #0xc0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xba
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _0801E010 @ =0x06004000
	str r0, [r4, #4]
	ldr r0, _0801E014 @ =0x0600F000
	str r0, [r4, #0xc]
	mov r0, sb
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	strh r5, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r0, _0801E018 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r5, [r0, #0xe]
	movs r2, #0
	ldr r4, _0801E01C @ =gBgPalette
	ldr r3, _0801E020 @ =gUnknown_080D5CC2
_0801DFB6:
	lsls r0, r2, #1
	adds r1, r0, r4
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0801DFB6
	ldr r0, _0801E024 @ =gFlags
	ldr r1, [r0]
	movs r2, #1
	orrs r1, r2
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFE0: .4byte gDispCnt
_0801DFE4: .4byte 0x00001141
_0801DFE8: .4byte gUnknown_03004D80
_0801DFEC: .4byte gUnknown_03002280
_0801DFF0: .4byte gUnknown_03005850 + 0x80
_0801DFF4: .4byte gBgCntRegs
_0801DFF8: .4byte 0x00001A89
_0801DFFC: .4byte gUnknown_080D5864
_0801E000: .4byte 0x00000177
_0801E004: .4byte 0x06008000
_0801E008: .4byte 0x0600D000
_0801E00C: .4byte 0x00001E07
_0801E010: .4byte 0x06004000
_0801E014: .4byte 0x0600F000
_0801E018: .4byte gBgScrollRegs
_0801E01C: .4byte gBgPalette
_0801E020: .4byte gUnknown_080D5CC2
_0801E024: .4byte gFlags

	thumb_func_start DestroyCameraMovementTask
DestroyCameraMovementTask: @ 0x0801E028
	push {r4, lr}
	ldr r4, _0801E03C @ =gCamera
	ldr r0, [r4, #0x5c]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E03C: .4byte gCamera

	thumb_func_start TaskDestructor_801E040
TaskDestructor_801E040: @ 0x0801E040
	push {r4, lr}
	ldr r1, _0801E090 @ =gCamera
	movs r0, #0
	str r0, [r1, #0x5c]
	ldr r4, _0801E094 @ =gCurrentLevel
	ldr r3, _0801E098 @ =gFlags
	movs r2, #0
	ldr r0, _0801E09C @ =gBgScrollRegs
	movs r1, #3
_0801E052:
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0801E052
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1d
	bne _0801E080
	ldr r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0801E080
	ldr r1, _0801E0A0 @ =gIntrTable
	ldr r0, _0801E0A4 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r3]
_0801E080:
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E090: .4byte gCamera
_0801E094: .4byte gCurrentLevel
_0801E098: .4byte gFlags
_0801E09C: .4byte gBgScrollRegs
_0801E0A0: .4byte gIntrTable
_0801E0A4: .4byte gIntrTableTemplate

	thumb_func_start Task_801E0A8
Task_801E0A8: @ 0x0801E0A8
	push {lr}
	ldr r2, _0801E0E8 @ =gDispCnt
	ldrh r1, [r2]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0801E0EC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0801E0CA
	ldr r0, _0801E0F0 @ =0x0000F7FF
	ands r1, r0
	strh r1, [r2]
_0801E0CA:
	ldr r0, _0801E0F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801E0DA
	ldrh r1, [r2]
	ldr r0, _0801E0F8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
_0801E0DA:
	ldr r0, _0801E0FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801E100 @ =Task_801E104
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0801E0E8: .4byte gDispCnt
_0801E0EC: .4byte gCurrentLevel
_0801E0F0: .4byte 0x0000F7FF
_0801E0F4: .4byte gGameMode
_0801E0F8: .4byte 0x0000DFFF
_0801E0FC: .4byte gCurTask
_0801E100: .4byte Task_801E104

	thumb_func_start Task_801E104
Task_801E104: @ 0x0801E104
	push {lr}
	bl sub_801C394
	ldr r1, _0801E114 @ =gUnknown_030054B8
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E114: .4byte gUnknown_030054B8

	thumb_func_start StageInit_Zone2
StageInit_Zone2: @ 0x0801E118
	ldr r1, _0801E128 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801E128: .4byte gBgScrollRegs

    thumb_func_start StageInit_Dummy
StageInit_Dummy:
    bx lr
    .align 2, 0


	thumb_func_start stageBgUpdateDummy
stageBgUpdateDummy: @ 0x0801E130
	bx lr
	.align 2, 0

@ type: CameraMain
	thumb_func_start StageBgUpdateZone1ActBoss
StageBgUpdateZone1ActBoss: @ 0x0801E134
	push {lr}
	ldr r3, _0801E184 @ =gCamera
	ldr r0, _0801E188 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E18C @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E14C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E14C:
	ldr r2, _0801E190 @ =gBgScrollRegs
	ldr r0, [r1]
	adds r0, #4
	lsrs r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r3, #4]
	asrs r0, r0, #9
	strh r0, [r2, #2]
	ldr r3, _0801E194 @ =gHBlankCallbacks
	ldr r2, _0801E198 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E19C @ =HBlankCB_801E434
	str r1, [r0]
	ldr r2, _0801E1A0 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E184: .4byte gCamera
_0801E188: .4byte gPlayer
_0801E18C: .4byte gUnknown_03005590
_0801E190: .4byte gBgScrollRegs
_0801E194: .4byte gHBlankCallbacks
_0801E198: .4byte gNumHBlankCallbacks
_0801E19C: .4byte HBlankCB_801E434
_0801E1A0: .4byte gFlags

	thumb_func_start StageBgUpdateZone2ActBoss
StageBgUpdateZone2ActBoss: @ 0x0801E1A4
	push {lr}
	ldr r0, _0801E1C8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E1CC @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E1BA
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E1BA:
	ldr r0, [r1]
	movs r1, #0xfa
	lsls r1, r1, #4
	bl StageBgUpdateZone2Acts12
	pop {r0}
	bx r0
	.align 2, 0
_0801E1C8: .4byte gPlayer
_0801E1CC: .4byte gUnknown_03005590

	thumb_func_start StageBgUpdateZone3ActBoss
StageBgUpdateZone3ActBoss: @ 0x0801E1D0
	ldr r1, _0801E1E0 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #0xe]
	strh r0, [r1]
	strh r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0801E1E0: .4byte gBgScrollRegs

	thumb_func_start StageBgUpdateZone5ActBoss
StageBgUpdateZone5ActBoss: @ 0x0801E1E4
	ldr r2, _0801E218 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801E21C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0801E220 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0801E224 @ =gHBlankCallbacks
	ldr r2, _0801E228 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E22C @ =sub_801E498
	str r1, [r0]
	ldr r2, _0801E230 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0801E218: .4byte gDispCnt
_0801E21C: .4byte 0x0000FDFF
_0801E220: .4byte gBgScrollRegs
_0801E224: .4byte gHBlankCallbacks
_0801E228: .4byte gNumHBlankCallbacks
_0801E22C: .4byte sub_801E498
_0801E230: .4byte gFlags

	thumb_func_start StageBgUpdateZone6ActBoss
StageBgUpdateZone6ActBoss: @ 0x0801E234
	ldr r2, _0801E260 @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2, #6]
	ldr r0, _0801E264 @ =0x0000FFFC
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2, #6]
	ldr r1, _0801E268 @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0801E260: .4byte gBgCntRegs
_0801E264: .4byte 0x0000FFFC
_0801E268: .4byte gBgScrollRegs

	thumb_func_start StageBgUpdateZone7Acts12
StageBgUpdateZone7Acts12: @ 0x0801E26C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r7, r1, #0
	ldr r0, _0801E2C0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r4, #0
	movs r2, #0
	ldr r5, _0801E2C4 @ =gUnknown_080D5CA2
	lsls r1, r1, #4
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r3, r0
	blt _0801E2B2
	adds r6, r5, #0
	movs r5, #1
_0801E298:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bhi _0801E2B2
	lsls r0, r2, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r3, r0
	bge _0801E298
	adds r4, r5, #0
	ands r4, r2
_0801E2B2:
	cmp r4, #0
	bne _0801E2C8
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801D9D4
	b _0801E2D0
	.align 2, 0
_0801E2C0: .4byte gCurrentLevel
_0801E2C4: .4byte gUnknown_080D5CA2
_0801E2C8:
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801DD7C
_0801E2D0:
	ldr r0, _0801E2DC @ =gPlayer
	adds r0, #0xa8
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E2DC: .4byte gPlayer

@ type: CameraMain
	thumb_func_start StageBgUpdateZone7ActBoss
StageBgUpdateZone7ActBoss: @ 0x0801E2E0
	push {lr}
	ldr r0, _0801E304 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E308 @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E2F6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E2F6:
	ldr r0, [r1]
	ldr r1, _0801E30C @ =0x000003B1
	bl sub_801D9D4
	pop {r0}
	bx r0
	.align 2, 0
_0801E304: .4byte gPlayer
_0801E308: .4byte gUnknown_03005590
_0801E30C: .4byte 0x000003B1

	thumb_func_start StageBgUpdateZoneFinalActXX
StageBgUpdateZoneFinalActXX: @ 0x0801E310
	push {lr}
	ldr r0, _0801E348 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801E326
	ldr r1, _0801E34C @ =gUnknown_03005590
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E326:
	ldr r3, _0801E350 @ =gHBlankCallbacks
	ldr r2, _0801E354 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E358 @ =sub_801E4C4
	str r1, [r0]
	ldr r2, _0801E35C @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E348: .4byte gPlayer
_0801E34C: .4byte gUnknown_03005590
_0801E350: .4byte gHBlankCallbacks
_0801E354: .4byte gNumHBlankCallbacks
_0801E358: .4byte sub_801E4C4
_0801E35C: .4byte gFlags

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

    @ Unused
	thumb_func_start sub_801E3F0
sub_801E3F0: @ 0x0801E3F0
	push {lr}
	ldr r3, _0801E420 @ =gCamera
	ldr r0, _0801E424 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801E41A
	ldr r2, _0801E428 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801E42C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801E430 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r0, r1
	lsrs r0, r0, #0x10
	subs r0, #8
	str r0, [r3, #0x1c]
_0801E41A:
	pop {r0}
	bx r0
	.align 2, 0
_0801E420: .4byte gCamera
_0801E424: .4byte gUnknown_03005590
_0801E428: .4byte gPseudoRandom
_0801E42C: .4byte 0x00196225
_0801E430: .4byte 0x3C6EF35F

	thumb_func_start HBlankCB_801E434
HBlankCB_801E434: @ 0x0801E434
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x49
	bne _0801E448
	ldr r1, _0801E44C @ =0x0400001C
	ldr r0, _0801E450 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r0, r0, #4
	strh r0, [r1]
_0801E448:
	pop {r0}
	bx r0
	.align 2, 0
_0801E44C: .4byte 0x0400001C
_0801E450: .4byte gUnknown_03005590

	thumb_func_start sub_801E454
sub_801E454: @ 0x0801E454
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0801E482
	ldr r0, _0801E488 @ =gUnknown_030022AC
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r1, r0, r1
	subs r0, r1, #2
	ldrh r2, [r1, #2]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0801E474
	ldr r0, _0801E48C @ =0x0400001C
	strh r2, [r0]
_0801E474:
	subs r0, r1, #4
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0801E482
	ldr r0, _0801E490 @ =0x04000010
	strh r1, [r0]
_0801E482:
	pop {r0}
	bx r0
	.align 2, 0
_0801E488: .4byte gUnknown_030022AC
_0801E48C: .4byte 0x0400001C
_0801E490: .4byte 0x04000010

	thumb_func_start nullsub_801E494
nullsub_801E494: @ 0x0801E494
	bx lr
	.align 2, 0

	thumb_func_start sub_801E498
sub_801E498: @ 0x0801E498
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x69
	bls _0801E4B4
	ldr r3, _0801E4B8 @ =0x0400001C
	ldr r2, _0801E4BC @ =gCourseTime
	ldr r0, _0801E4C0 @ =gUnknown_080D5B50
	adds r0, r1, r0
	ldrb r1, [r0]
	subs r1, #1
	ldr r0, [r2]
	lsrs r0, r1
	strh r0, [r3]
_0801E4B4:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4B8: .4byte 0x0400001C
_0801E4BC: .4byte gCourseTime
_0801E4C0: .4byte gUnknown_080D5B50

	thumb_func_start sub_801E4C4
sub_801E4C4: @ 0x0801E4C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x58
	bne _0801E4D6
	ldr r0, _0801E4DC @ =0x0400001C
	ldr r1, _0801E4E0 @ =gUnknown_03005590
	ldrb r1, [r1]
	strh r1, [r0]
_0801E4D6:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4DC: .4byte 0x0400001C
_0801E4E0: .4byte gUnknown_03005590
