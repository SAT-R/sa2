	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0114_1
song0114_1:	@ 0x08C80FD0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 68
	.byte	VOL	, v100
	.byte	LFOS	, 15
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 46
	.byte		N04	, Cs4, v127
	.byte	W05
	.byte		N02	, Gn3
	.byte	W03
	.byte		N01	, Fn5
	.byte	W02
	.byte		N03	, Ds5
	.byte	W10
	.byte		TIE	, Bn3, v072
	.byte	W76
song0114_1_1:
	.byte	W96
	.byte	GOTO	
		.word	song0114_1_1
	.byte	W12
	.byte		EOT	, Bn3
	.byte	FINE

	.align 2
	.global song0114
song0114:	@ 0x08C81000
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0114_1		@ track
