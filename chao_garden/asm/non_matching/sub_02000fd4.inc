.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0
	ldr r0, _02001060 @ =gUnknown_03001140
	mov sl, r0
	ldr r1, _02001064 @ =gUnknown_030013A0
	mov ip, r1
	ldr r0, _02001068 @ =gUnknown_030013A1
	mov r8, r0
	ldr r1, _0200106C @ =gUnknown_03001142
	mov sb, r1
	ldr r7, _02001070 @ =gUnknown_030013A2
	ldr r3, _02001074 @ =gUnknown_03004E70
	movs r6, #0x80
	lsls r6, r6, #2
	adds r5, r3, #6
	ldr r4, _02001078 @ =gUnknown_03001280
_02000FFC:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #3
	adds r0, r2, r3
	strh r6, [r0]
	adds r2, r2, r5
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _02000FFC
	movs r2, #0
	ldr r4, _0200107C @ =gUnknown_03001120
	ldr r3, _02001080 @ =gUnknown_03001380
_02001022:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r4
	adds r1, r0, r3
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _02001022
	mov r1, ip
	ldrb r0, [r1]
	mov r1, sl
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldr r1, _02001084 @ =gUnknown_03001141
	strb r0, [r1]
	ldrb r0, [r7]
	mov r1, sb
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02001060: .4byte gUnknown_03001140
_02001064: .4byte gUnknown_030013A0
_02001068: .4byte gUnknown_030013A1
_0200106C: .4byte gUnknown_03001142
_02001070: .4byte gUnknown_030013A2
_02001074: .4byte gUnknown_03004E70
_02001078: .4byte gUnknown_03001280
_0200107C: .4byte gUnknown_03001120
_02001080: .4byte gUnknown_03001380
_02001084: .4byte gUnknown_03001141

	
.syntax divided
