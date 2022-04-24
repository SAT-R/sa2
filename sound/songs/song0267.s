	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0267_1
song0267_1:	@ 0x08C83A18
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 67
	.byte	VOL	, v100
	.byte	LFOS	, 84
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte		N18	, Gn2, v127
	.byte	W18
	.byte	FINE

	.align 2
	.global song0267
song0267:	@ 0x08C83A30
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0267_1		@ track
