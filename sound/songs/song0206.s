	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0206_1
song0206_1:	@ 0x08C81FCC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 6
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0206
song0206:	@ 0x08C81FDC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0206_1		@ track
