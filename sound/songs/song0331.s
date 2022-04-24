	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0331_1
song0331_1:	@ 0x08C84EC8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 31
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte		N09	, Cn3, v127
	.byte	W09
	.byte	FINE

	.align 2
	.global song0331
song0331:	@ 0x08C84ED8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0331_1		@ track
