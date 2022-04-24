	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0332_1
song0332_1:	@ 0x08C84EE4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 32
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte		N24	, Cn4, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song0332
song0332:	@ 0x08C84EF4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0332_1		@ track
