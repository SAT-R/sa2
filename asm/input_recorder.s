.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8007D20
sub_8007D20: @ 0x08007D20
	ldr r1, _08007D28 @ =gInputRecorder
	movs r0, #0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08007D28: .4byte gInputRecorder

	thumb_func_start sub_8007D2C
sub_8007D2C: @ 0x08007D2C
	ldr r1, _08007D34 @ =gInputRecorder
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007D34: .4byte gInputRecorder

	thumb_func_start sub_8007D38
sub_8007D38: @ 0x08007D38
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08007D78 @ =gInputRecorder
	movs r5, #0
	strb r5, [r6, #8]
	ldr r4, _08007D7C @ =gInputRecordBuffer
	movs r0, #0x80
	lsls r0, r0, #5
	bl EwramMalloc
	adds r1, r0, #0
	str r1, [r4]
	ldr r0, _08007D80 @ =gInputPlaybackBuffer
	ldr r0, [r0]
	bl LZ77UnCompWram
	ldr r0, _08007D84 @ =sub_8007DEC
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08007D88 @ =sub_8007DF0
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r5, [r6, #4]
	str r5, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007D78: .4byte gInputRecorder
_08007D7C: .4byte gInputRecordBuffer
_08007D80: .4byte gInputPlaybackBuffer
_08007D84: .4byte sub_8007DEC
_08007D88: .4byte sub_8007DF0

	thumb_func_start sub_8007D8C
sub_8007D8C: @ 0x08007D8C
	push {lr}
	ldr r3, _08007D9C @ =gInputRecorder
	ldr r2, [r3]
	ldr r0, _08007DA0 @ =0x000007FF
	cmp r2, r0
	ble _08007DA4
	movs r0, #0
	b _08007DB2
	.align 2, 0
_08007D9C: .4byte gInputRecorder
_08007DA0: .4byte 0x000007FF
_08007DA4:
	ldr r0, _08007DB8 @ =gInputRecordBuffer
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r2, #1
	str r1, [r3]
_08007DB2:
	pop {r1}
	bx r1
	.align 2, 0
_08007DB8: .4byte gInputRecordBuffer

	thumb_func_start sub_8007DBC
sub_8007DBC: @ 0x08007DBC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r4, _08007DE0 @ =gInputRecorder
	ldr r2, [r4, #4]
	ldr r0, _08007DE4 @ =0x000007FF
	cmp r2, r0
	bgt _08007DDA
	ldr r0, _08007DE8 @ =gInputRecordBuffer
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r2, #1
	str r0, [r4, #4]
_08007DDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007DE0: .4byte gInputRecorder
_08007DE4: .4byte 0x000007FF
_08007DE8: .4byte gInputRecordBuffer

	thumb_func_start sub_8007DEC
sub_8007DEC: @ 0x08007DEC
	bx lr
	.align 2, 0

	thumb_func_start sub_8007DF0
sub_8007DF0: @ 0x08007DF0
	push {lr}
	ldr r0, _08007E08 @ =gInputRecordBuffer
	ldr r0, [r0]
	bl EwramFree
	ldr r1, _08007E0C @ =gInputRecorder
	movs r0, #0
	strb r0, [r1, #8]
	str r0, [r1, #4]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08007E08: .4byte gInputRecordBuffer
_08007E0C: .4byte gInputRecorder
