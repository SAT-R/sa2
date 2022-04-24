	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0202_1
song0202_1:	@ 0x08C81F5C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 2
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0202
song0202:	@ 0x08C81F6C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0202_1		@ track
