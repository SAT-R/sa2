	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0107_1
song0107_1:	@ 0x08C80D70
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 3
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N04	, En4, v096
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte			Fs3, v100
	.byte	W04
	.byte	FINE

	.align 2
	.global song0107
song0107:	@ 0x08C80D88
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0107_1		@ track
