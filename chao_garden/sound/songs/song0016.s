	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0016_1
song0016_1:	@ 0x0201F244
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte	LFOS	, 73
	.byte	MOD	, 0
	.byte		N02	, Dn6, v084
	.byte	W02
	.byte			As5, v127
	.byte	W02
	.byte			Fs5, v116
	.byte	W02
	.byte			En5, v072
	.byte	W12
	.byte			Dn6, v084
	.byte	W02
	.byte			As5, v127
	.byte	W02
	.byte			Fs5, v116
	.byte	W02
	.byte			En5, v072
	.byte	W12
	.byte			Dn6, v084
	.byte	W02
	.byte			As5, v127
	.byte	W02
	.byte			Fs5, v116
	.byte	W02
	.byte			En5, v072
	.byte	W12
	.byte			Dn6, v084
	.byte	W02
	.byte			As5, v127
	.byte	W02
	.byte			Fs5, v116
	.byte	W02
	.byte			En5, v072
	.byte	W02
	.byte	FINE

	.align 2
	.global song0016
song0016:	@ 0x0201F288
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0016_1		@ track
