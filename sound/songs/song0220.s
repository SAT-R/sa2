	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0220_1
song0220_1:	@ 0x08C823B4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 81
	.byte	VOICE	, 20
	.byte	VOL	, v100
	.byte	LFOS	, 51
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte		N24	, Ds4, v120
	.byte	W24
	.byte	FINE

	.align 2
	.global song0220
song0220:	@ 0x08C823CC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0220_1		@ track
