	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0212_1
song0212_1:	@ 0x08C82058
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 12
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0212
song0212:	@ 0x08C82068
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0212_1		@ track
