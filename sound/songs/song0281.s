	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0281_1
song0281_1:	@ 0x08C8422C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 81
	.byte	PAN	, c_v
	.byte	MOD	, 43
	.byte	LFOS	, 7
	.byte	MODT	, 0
	.byte	BENDR	, 10
	.byte	VOL	, v090
	.byte		TIE	, As3, v127
	.byte	W24
song0281_1_1:
	.byte	W72
	.byte	W72
	.byte	GOTO	
		.word	song0281_1_1
	.byte	W24
	.byte		EOT	, As3
	.byte	FINE

	.align 2
	.global song0281
song0281:	@ 0x08C84250
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0281_1		@ track
