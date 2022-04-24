	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0144_1
song0144_1:	@ 0x08C816E0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 27
	.byte	VOL	, v120
	.byte	LFOS	, 84
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte		N18	, Gn2, v127
	.byte	W18
	.byte	FINE

	.align 2
	.global song0144
song0144:	@ 0x08C816F8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0144_1		@ track
