	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0105_1
song0105_1:	@ 0x08C80D20
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 17
	.byte	VOL	, v120
	.byte	LFOS	, 15
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N02	, Cn1, v127
	.byte	W05
	.byte		N17	
	.byte	W17
	.byte	FINE

	.align 2
	.global song0105
song0105:	@ 0x08C80D3C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0105_1		@ track
