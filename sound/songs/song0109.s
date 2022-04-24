	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0109_1
song0109_1:	@ 0x08C80DB4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W48
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song0109
song0109:	@ 0x08C80DC8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0109_1		@ track
