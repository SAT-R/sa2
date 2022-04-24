	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0128_1
song0128_1:	@ 0x08C81450
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 116
	.byte	VOL	, v120
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0128
song0128:	@ 0x08C81460
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0128_1		@ track
