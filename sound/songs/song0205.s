	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0205_1
song0205_1:	@ 0x08C81FB0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 5
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0205
song0205:	@ 0x08C81FC0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0205_1		@ track
