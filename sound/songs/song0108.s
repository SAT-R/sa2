	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0108_1
song0108_1:	@ 0x08C80D94
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N04	, An6, v112
	.byte	W04
	.byte	FINE

	.align 2
	.global song0108
song0108:	@ 0x08C80DA8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0108_1		@ track
