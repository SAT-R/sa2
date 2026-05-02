.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	ldr r0, _08012DE0 @ =gFlags
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08012E0E_return_0
	ldr r6, _08012DE4 @ =gUsedSaveSectorID
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08012E1C
	movs r4, #0x86
	lsls r4, r4, #3
	adds r0, r4, #0
	bl EwramMalloc
	adds r5, r0, #0     @ r5 = sectorBuffer
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl ReadFlash
	movs r4, #1
	movs r2, #0
	ldr r0, _08012DE8 @ =gLoadedSaveGame
	ldrb r1, [r5]
	b _08012DFC
	.align 2, 0
_08012DE0: .4byte gFlags
_08012DE4: .4byte gUsedSaveSectorID
_08012DE8: .4byte gLoadedSaveGame
_08012DEC_loop:
	adds r2, #1
	ldr r0, _08012E14 @ =0x0000042F
	cmp r2, r0
	bhi _08012E04
	adds r1, r5, r2
	ldr r0, _08012E18 @ =gLoadedSaveGame
	adds r0, r2, r0
	ldrb r1, [r1]
_08012DFC:
	ldrb r0, [r0]
	cmp r1, r0
	beq _08012DEC_loop
	movs r4, #0
_08012E04:
	adds r0, r5, #0
	bl EwramFree
	cmp r4, #0
	beq _08012E1C
_08012E0E_return_0:
	movs r0, #0
	b _08012E8A_return
	.align 2, 0
_08012E14: .4byte 0x0000042F
_08012E18: .4byte gLoadedSaveGame
_08012E1C:
	ldr r0, _08012E34 @ =gUsedSaveSectorID
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	bne _08012E3C
	ldr r0, _08012E38 @ =EraseFlashSector
	ldr r1, [r0]
	movs r0, #0
	b _08012E52
	.align 2, 0
_08012E34: .4byte gUsedSaveSectorID
_08012E38: .4byte EraseFlashSector
_08012E3C:
	cmp r0, #9
	ble _08012E42
	movs r5, #0
_08012E42:
	ldr r1, _08012E90 @ =EraseFlashSector
	lsls r0, r5, #0x18
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	ldr r1, [r1]
_08012E52:
	bl _call_via_r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08012E8A_return
	ldr r4, _08012E94 @ =gLoadedSaveGame
	ldr r0, _08012E98 @ =0x4F524950
	str r0, [r4]
	adds r0, r4, #0
	bl CalculateChecksum
	ldr r2, _08012E9C @ =0x0000042C
	adds r1, r4, r2
	str r0, [r1]
	ldr r0, _08012EA0 @ =gUsedSaveSectorID
	strb r5, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, #4
	adds r1, r4, #0
	bl ProgramFlashSectorAndVerifyNBytes
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08012E8A_return:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012E90: .4byte EraseFlashSector
_08012E94: .4byte gLoadedSaveGame
_08012E98: .4byte 0x4F524950
_08012E9C: .4byte 0x0000042C
_08012EA0: .4byte gUsedSaveSectorID

.syntax divided
