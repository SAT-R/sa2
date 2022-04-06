	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

.ifdef MULTI_SIO_DI_FUNC_FAST

@--------------------------------------------------------------------
@-              Update Receive Data/Check Buffer Routine            -
@--------------------------------------------------------------------

	arm_func_start MultiSioRecvBufChange
MultiSioRecvBufChange: @ 0x08158F14
	stmfd   sp!, {r4-r11}

	mov     r12, #REG_BASE                      @ r12: REG_BASE
	ldr     r11, =gMultiSioArea                 @ r11: &gMultiSioArea
	add     r10, r11, #OFS_MS_LAST_RECV_BUF_P   @ r10: &gMultiSioArea.lastRecvBufp[0]
	mov     r9,  #1                             @ r9:  1
	mov     r8,  #0                             @ r8:  0


	@ *(vu8 *)REG_ADDR_IME = 0   Disable Interrupt (29 Clocks)

	strb    r8,  [r12, #OFFSET_REG_IME]

	@ gMultiSioArea.recvCheckBufp[i] <--> gMultiSioArea.lastRecvBufp[i]      Update Receive Buffer

	ldmia   r10,  {r0-r7}
	stmia   r10!, {r4-r7}
	stmia   r10!, {r0-r3}

	@ syncRecvFlagBak[i] = gMultiSioArea.syncRecvFlag[i]
	@ gMultiSioArea.syncRecvFlag[i] = 0

	ldr     r0,  [r11, #OFS_MS_SYNC_RECV_FLAG]
	str     r8,  [r11, #OFS_MS_SYNC_RECV_FLAG]

	@ *(vu8 *)REG_IME = 1   Enable Interrupt

	strb    r9,  [r12, #OFFSET_REG_IME]

	@ return  gMultiSioArea.syncRecvFlag[i]

	ldmfd   sp!, {r4-r11}
	bx      lr
	.ltorg
	arm_func_end MultiSioRecvBufChange

@--------------------------------------------------------------------
@-                  Multi-play Interrupt Routine                    -
@--------------------------------------------------------------------

	arm_func_start MultiSioIntr
MultiSioIntr: @ 0x08158F54
	@ Save Receive Data
	@ *(u64 *)recvTmp = *(u64 *)REG_ADDR_SIOMLT_RECV

	mov     r12, #REG_BASE                          @ r12: REG_SIOMLT_RECV
	add     r12, r12, #OFFSET_REG_SIOMLT_RECV
	ldmia   r12, {r0-r1}

	@ Save Register to Stack

	stmfd   sp!, {r7-r11}

	ldr     r11, =gMultiSioArea                     @ r11: &gMultiSioArea
	mov     r9,     #MULTI_SIO_SYNC_DATA & 0x00ff   @ r9:  MULTI_SIO_SYNC_DATA
	add     r9, r9, #MULTI_SIO_SYNC_DATA & 0xff00

	@ Detect hard error

	@ gMultiSioArea.error = REG_SIOCNT->Error

	ldrh    r3, [r12, #REG_SIOCNT - REG_SIOMLT_RECV]
	and     r3, r3, #SIO_ERROR
	strb    r3, [r11, #OFS_MS_HARD_ERROR]

	@ Send Data Processing

	@ if  (gMultiSioArea.sendBufCounter == -1) {

	ldr     r10, [r11, #OFS_MS_SEND_BUF_COUNTER]    @ r10: gMultiSioArea.sendBufCounter
	adds    r3,  r10, #1
	blt     3f
	bne     2f

	@     REG_SIOCNT->data = MULTI_SIO_SYNC_DATA          Set Synchronization Data

	strh    r9, [r12, #REG_SIOMLT_SEND - REG_SIOMLT_RECV]

	@     gMultiSioArea.currentSendBufp <--> gMultiSioArea.nextSendBufp         Change Send Buffer

	add     r8,  r11, #OFS_MS_NEXT_SEND_BUF_P
	ldmia   r8, {r2,r3}
	mov     r7,  r2
	stmia   r8, {r3,r7}
	b       3f
2:
	@ } else if (gMultiSioArea.sendBufCounter >= 0) {
	@     REG_SIOCNT->data = gMultiSioArea.currentSendBufp[gMultiSioArea.sendBufCounter]
	@                                                     Set Send Data

	ldr     r3, [r11, #OFS_MS_CURRENT_SEND_BUF_P]
	ldr     r2, [r3,  r10, lsl #1]
	strh    r2, [r12, #REG_SIOMLT_SEND - REG_SIOMLT_RECV]
3:
	@ }

	@ if (gMultiSioArea.sendBufCounter < sizeof(struct MultiSioPacket) / 2 - 1)
	@     gMultiSioArea.sendBufCounter++;

	cmp     r10, #MULTI_SIO_PACKET_SIZE / 2 - 1
	addlt   r10, r10, #1
	strlt   r10, [r11, #OFS_MS_SEND_BUF_COUNTER]

	@ Save Receive Data & Register to Stack

	stmfd   sp!, {r0-r1, r5-r6}


	@ Receive Data Processing (Max. Approx. 160 Clocks/Included in Wait Period)

	@ for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {

	mov     r6, #MULTI_SIO_PLAYERS_MAX - 1          @ r6:  i
4:
	add     r8, r11, #OFS_MS_RECV_BUF_COUNTER       @ r8: &gMultiSioArea.recvBufCounter[i]
	add     r8, r8, r6, lsl #2
	ldr     r10, [r8, #0]                           @ r10: gMultiSioArea.recvBufCounter[i]
	mov     r3, r6, lsl #1                          @ r5:  RecvTmp[i]
	ldrh    r5,  [sp, r3]

	@ if ( recvTmp[i] == MULTI_SIO_SYNC_DATA
	@   && gMultiSioArea.recvBufCounter[i] > sizeof(struct MultiSioPacket) / 2 - 3) {

	cmp     r5, r9
	bne     6f
	cmp     r10, #MULTI_SIO_PACKET_SIZE / 2 - 3
	ble     6f

	@      gMultiSioArea.recvBufCounter[i] = -1

	mov     r0, #1
	sub     r10, r0, #2

	b       7f
6:
	@ } else {
	@     gMultiSioArea.currentRecvBufp[i][gMultiSioArea.recvBufCounter[i]] = recvTmp[i]
	@                                                     Store Receive Data

	ldr     r0, [r8, #OFS_MS_CURRENT_RECV_BUF_P - OFS_MS_RECV_BUF_COUNTER]
	mov     r3, r10, lsl #1
	strh    r5, [r0, r3]

	@ if (gMultiSioArea.recvBufCounter[i] == sizeof(struct MultiSioPacket) / 2 - 3)

	cmp     r10, #MULTI_SIO_PACKET_SIZE / 2 - 3
	bne     7f

	@     gMultiSioArea.currentRecvBufp[i] <--> gMultiSioArea.lastRecvBufp[i]   Change Receive Buffer

	ldr     r1, [r8, #OFS_MS_LAST_RECV_BUF_P    - OFS_MS_RECV_BUF_COUNTER]
	str     r0, [r8, #OFS_MS_LAST_RECV_BUF_P    - OFS_MS_RECV_BUF_COUNTER]
	str     r1, [r8, #OFS_MS_CURRENT_RECV_BUF_P - OFS_MS_RECV_BUF_COUNTER]

	@     gMultiSioArea.syncRecvFlag[i] = 1;                         Receive Completion Flag

	add     r3, r11, #OFS_MS_SYNC_RECV_FLAG
	mov     r0, #1
	strb    r0, [r3, r6]
7:
	@ }

	@ if (gMultiSioArea.recvBufCounter[i] < sizeof(struct MultiSioPacket) / 2 - 1)
	@     gMultiSioArea.recvBufCounter[i]++;

	cmp     r10, #MULTI_SIO_PACKET_SIZE / 2 - 1
	addlt   r10, r10, #1
	str     r10, [r8, #0]

	subs    r6, r6, #1
	bge     4b

	@ }


	@ Start Master Send

	@ if (gMultiSioArea.type == SIO_MULTI_PARENT)

	ldrb    r0, [r11,#OFS_MS_TYPE]
	cmp     r0, #0
	beq     11f

	@ *(vu16 *)REG_ADDR_MULTI_SIO_TIMER_H = 0;             Stop Timer

	ldr     r7, =REG_MULTI_SIO_TIMER_H              @ r7:  REG_MULTI_SIO_TIMER_H
	mov     r0, #0
	strh    r0, [r7, #0]

	@ REG_SIOCNT |= SIO_ENABLE;              Restart Send

	ldrh    r0, [r12, #REG_SIOCNT - REG_SIOMLT_RECV]
	orr     r0, r0, #SIO_ENABLE
	strh    r0, [r12, #REG_SIOCNT - REG_SIOMLT_RECV]

	@ *(vu16 *)REG_ADDR_MULTI_SIO_TIMER_H                  Restart Timer
	@                      = (TIMER_1CLK | TIMER_INTR_ENABLE | TIMER_ENABLE);

	mov     r0, #0xC0
	strh    r0, [r7, #0]
11:
	add     sp, sp, #8
	ldmfd   sp!, {r5-r11}
	bx      lr
	arm_func_end MultiSioIntr

.endif
