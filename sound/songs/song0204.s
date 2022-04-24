	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0204_1
song0204_1:	@ 0x08C81F94
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 4
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0204
song0204:	@ 0x08C81FA4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0204_1		@ track
