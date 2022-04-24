	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0139_1
song0139_1:	@ 0x08C8157C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 64
	.byte	VOL	, v070
	.byte	LFOS	, 15
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N03	, As4, v127
	.byte	W04
	.byte		N32	
	.byte	W32
	.byte	W03
	.byte	FINE

	.align 2
	.global song0139
song0139:	@ 0x08C81598
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0139_1		@ track
