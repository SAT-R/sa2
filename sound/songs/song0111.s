	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0111_1
song0111_1:	@ 0x08C80EA0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 15
	.byte	VOL	, v120
	.byte	LFOS	, 45
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 27
	.byte		N17	, Ds3, v092
	.byte	W17
	.byte	FINE

	.align 2
	.global song0111
song0111:	@ 0x08C80EB8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0111_1		@ track
