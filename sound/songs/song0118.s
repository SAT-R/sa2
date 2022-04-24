	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0118_1
song0118_1:	@ 0x08C810D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 3
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0118
song0118:	@ 0x08C810E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0118_1		@ track
