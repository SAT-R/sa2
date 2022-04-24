	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0135_1
song0135_1:	@ 0x08C814FC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 4
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W12
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song0135
song0135:	@ 0x08C81510
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0135_1		@ track
