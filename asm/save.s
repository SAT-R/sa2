.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm


	thumb_func_start sub_80717EC_GenerateNewSaveGame
sub_80717EC_GenerateNewSaveGame: @ 0x080717EC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0xde
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	movs r0, #0
	str r0, [r4]
	movs r3, #1
	strb r3, [r4, #0x13]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	movs r2, #2
	strb r2, [r4, #6]
	ldr r0, _08071890 @ =0x0000FFFF
	strh r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x2c
	strh r3, [r4, #0x2c]
	strh r2, [r1, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #4]
	adds r1, #8
	movs r3, #0
	ldr r0, _08071894 @ =0xFFFF8CA0
	adds r5, r0, #0
	movs r2, #0x9d
	lsls r2, r2, #1
_08071828:
	strh r5, [r1]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r1, #2
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _08071828
	movs r0, #0
	strb r0, [r4, #0x1c]
	strb r0, [r4, #0x1d]
	strb r0, [r4, #0x1e]
	movs r0, #0xab
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r3, #0
	movs r2, #0
	ldr r0, _08071890 @ =0x0000FFFF
	adds r5, r0, #0
_08071852:
	strb r2, [r1, #0x10]
	strb r2, [r1, #0x11]
	strb r2, [r1, #0x12]
	strb r2, [r1, #0x13]
	ldrh r0, [r1, #4]
	orrs r0, r5
	strh r0, [r1, #4]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r1, #0x14
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071852
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0
	str r0, [r1]
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x1a]
	strb r0, [r4, #0x1b]
	strb r0, [r4, #0x15]
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	strb r0, [r4, #0x18]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071890: .4byte 0x0000FFFF
_08071894: .4byte 0xFFFF8CA0

	thumb_func_start sub_8071898
sub_8071898: @ 0x08071898
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0xde
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	ldr r0, _08071938 @ =0x4547474D
	str r0, [r4]
	movs r1, #0
	str r1, [r4, #4]
	str r1, [r4, #8]
	ldr r0, _0807193C @ =0x0000FFFF
	strh r0, [r4, #0xc]
	movs r2, #2
	strb r2, [r4, #0x18]
	strb r1, [r4, #0x1b]
	strb r1, [r4, #0x1a]
	strb r1, [r4, #0x19]
	movs r0, #1
	strb r0, [r4, #0x1c]
	strb r2, [r4, #0x1d]
	movs r0, #4
	strb r0, [r4, #0x1e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r3, #0
	ldr r0, _08071940 @ =0xFFFF8CA0
	adds r5, r0, #0
	movs r2, #0x9d
	lsls r2, r2, #1
_080718E4:
	strh r5, [r1]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r1, #2
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _080718E4
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r3, #0
	movs r2, #0
	ldr r0, _0807193C @ =0x0000FFFF
	adds r5, r0, #0
_08071906:
	strb r2, [r1, #0x10]
	strb r2, [r1, #0x11]
	strb r2, [r1, #0x12]
	strb r2, [r1, #0x13]
	ldrh r0, [r1, #4]
	orrs r0, r5
	strh r0, [r1, #4]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r1, #0x14
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071906
	movs r0, #0xdc
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071938: .4byte 0x4547474D
_0807193C: .4byte 0x0000FFFF
_08071940: .4byte 0xFFFF8CA0
	
	thumb_func_start sub_8071944_TryWriteSaveGame
sub_8071944_TryWriteSaveGame: @ 0x08071944
	push {r4, r5, r6, r7, lr}
	ldr r0, _080719B8 @ =gLoadedSaveGame
	ldr r5, [r0]
	ldr r0, _080719BC @ =gLastWrittenSaveGame
	ldr r6, [r0]
	ldr r0, _080719C0 @ =gSaveSectorDataBuffer
	ldr r7, [r0]
	ldr r0, [r5]
	cmp r0, #0
	bne _0807196C
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	str r4, [r5]
_0807196C:
	movs r2, #0xde
	lsls r2, r2, #2
	adds r0, r6, #0
	adds r1, r5, #0
	bl memcpy
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_80719D0_PackSaveSectorData
	ldr r0, _080719C4 @ =gFlags
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080719C8
	bl sub_8071C60_FindOldestSaveGameSector
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080719A2
	movs r2, #0
_080719A2:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r7, #0
	bl sub_8071D24_WriteToSaveSector
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080719C8
	movs r0, #1
	b _080719CA
	.align 2, 0
_080719B8: .4byte gLoadedSaveGame
_080719BC: .4byte gLastWrittenSaveGame
_080719C0: .4byte gSaveSectorDataBuffer
_080719C4: .4byte gFlags
_080719C8:
	movs r0, #0
_080719CA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
