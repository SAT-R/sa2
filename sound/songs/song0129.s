	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0129_1
song0129_1:	@ 0x08C8146C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 117
	.byte	VOL	, v120
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0129
song0129:	@ 0x08C8147C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0129_1		@ track
