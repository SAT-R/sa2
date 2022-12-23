	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0030_1
song0030_1:	@ 0x0201F634
	.byte	KEYSH	, 0
song0030_1_1:
	.byte	TEMPO	, 75
	.byte	VOICE	, 62
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N11	, Cs5, v084
	.byte	W12
	.byte			Fn5, v100
	.byte	W12
	.byte	GOTO	
		.word	song0030_1_1
	.byte	FINE

	.align 2
	.global song0030
song0030:	@ 0x0201F650
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0030_1		@ track
