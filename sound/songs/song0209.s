	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0209_1
song0209_1:	@ 0x08C82004
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 9
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0209
song0209:	@ 0x08C82014
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0209_1		@ track
