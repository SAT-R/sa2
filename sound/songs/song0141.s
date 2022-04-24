	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0141_1
song0141_1:	@ 0x08C815C4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 90
	.byte	VOICE	, 1
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 127
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W48
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song0141
song0141:	@ 0x08C815D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0141_1		@ track
