	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0151_1
song0151_1:	@ 0x08C81954
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 52
	.byte	VOL	, v100
	.byte	LFOS	, 52
	.byte	BENDR	, 2
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 10
	.byte		N03	, Cs1, v096
	.byte	W04
	.byte		N48	, Dn1, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song0151
song0151:	@ 0x08C81970
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0151_1		@ track
