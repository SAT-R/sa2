	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0229_1
song0229_1:	@ 0x08C82798
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 29
	.byte	VOL	, v100
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0229
song0229:	@ 0x08C827A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0229_1		@ track
