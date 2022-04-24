	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0211_1
song0211_1:	@ 0x08C8203C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 11
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0211
song0211:	@ 0x08C8204C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0211_1		@ track
