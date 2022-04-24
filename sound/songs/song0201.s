	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0201_1
song0201_1:	@ 0x08C81F40
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 1
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0201
song0201:	@ 0x08C81F50
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0201_1		@ track
