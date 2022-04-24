	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0147_1
song0147_1:	@ 0x08C81828
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W48
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song0147
song0147:	@ 0x08C8183C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0147_1		@ track
