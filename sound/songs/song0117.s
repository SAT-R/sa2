	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0117_1
song0117_1:	@ 0x08C810B4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v100
	.byte		N48	, Cn3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song0117
song0117:	@ 0x08C810C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0117_1		@ track
